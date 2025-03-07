library(httpgd)
library(jsonlite)  
library(curl)     
library(magrittr)   
library(dplyr)     
library(stringr)    
library(purrr)      
library(pdftools)   
library(tidyr)     
library(tm)         
library(tidytext)   
library(textdata)   
library(ggplot2)    
library(scales)    

# if some packages weren't installed, run the commands in R Terminal -> https://github.com/HenrySchall/Data_Science/blob/main/R/Install_Packages.txt

# Text Mining (ou Mineração de Texto) é o processo de extrair informações úteis de textos não estruturados. Esse processo envolve técnicas de Processamento de 
# Linguagem Natural (PLN), estatísticas e aprendizado de máquina para analisar grandes volumes de texto,  nesse código o foco será a análise do otimismo das 
# Atas do COPOM, que podem ser econtradas no link: https://www.bcb.gov.br/en/publications/copomminutes/cronologicos

####################
### Web Scraping ###
####################


# URL JSON 
url_json <- "https://www.bcb.gov.br/api/servico/sitebcb/copomminutes/ultimas?quantidade=2000&filtro="

# Importar JSON e usar links para importar textos das atas (formato tabular)
atas_texto <- fromJSON(txt = url_json) %>%
  extract2("conteudo") %>% # extrai o elemento da lista
  mutate(  # cria e trata colunas de interesse

    # expressão regular (regex) para extrair os primeiros 2 ou 3 números da coluna Titulo
    ata = stringr::str_extract(string = Titulo, pattern = "^[[:digit:]]{2,3}") %>%
      as.numeric(),

    # constrói link p/ cada ata
    link = paste0("https://www.bcb.gov.br", Url) %>% URLencode(),

    # importar textos das atas a partir dos links (for-loop)
    texto = map_chr(
      .x = link,
      .f = ~paste0(pdf_text(.x), collapse = "\n")),

     .keep = "none"  # mantém somente colunas criadas

    ) %>%
  drop_na(ata) %>%  # remove linhas com NA (coluna ata)
  as_tibble()

# extract2("conteudo") -> extrai o elemento da lista
# mutate -> cria e trata colunas de interesse
# ata = str_extract(string = Titulo, pattern = "^[[:digit:]]{2,3}") as.numeric() -> extrair os primeiros 2 ou 3 números da coluna titulo (https://stringr.tidyverse.org/)
# link = paste0("https://www.bcb.gov.br", Url) %>% URLencode() -> cria um link para cada ata   
# texto = map_chr(.x = link, .f = ~paste0(pdf_text(.x), collapse = "\n")), .keep = "none") -> importar textos das atas a partir dos links e mantem apenas as colunas criadas
# drop_na(ata) %>% -> remove linhas com NA (coluna ata)

###########################
### Tratamento de dados ###
###########################

# Termos sem interesse a serem arbitrariamente removidos
termos_rm <- c("th","Minutes of the Meeting","Monetary Policy Committee","Copom","bcb.gov.br","BCB","Headquarters",
"meeting rooms","floor","Brasilia","Brasília","DF","Brazil","Department","Banking","Operations","Deputy",
"Governor","Committee","Banco Central do Brasil","banco central  brasil","Meeting","Office","Minutes","rd","st",
"nd","Central Bank","pp","govbr","bcbgovbr", month.name, month.abb)

# Remover stop words, pontuações, números, aplicar stemming e criar tokens
atas_token <- atas_texto %>%
  
# Remove atas antes da nº 62 por problemas de codificação de caracters
  filter(ata >= 62) %>%  # alternativa: ler essas atas com pdftools::pdf_ocr_text()
  select(-"link") %>%
  mutate(
    
    # Transforma para minúsculo
    texto = str_to_lower(texto) %>%
    
    # Remove "stop words"
    removeWords(words = stopwords(kind = "english")) %>%
    removeWords(words = stopwords(kind = "portuguese")) %>%
    
    # Remove pontuações e números
    removePunctuation() %>%
    removeNumbers() %>%
    
    # Remove termos "indesejados"
    removeWords(words = str_to_lower(termos_rm)) %>%
    str_replace_all(pattern = "\\n|\\r|\\–|\\'|\\’|\\“|\\”", replacement = "") %>%
    
    # Stemming
    stemDocument(language = "english")  
  
  ) %>%
    
  # Criar tokens por palavras
  unnest_tokens(output = "token", input = "texto", token = "words")   

###################
### Text Mining ###
###################

# Analisando sentimentos das Atas do COPOM (Comitê de Política Monetária)

# Conjunto de dados do dicionário Loughran-McDonald

dicionario <- import(file = "https://drive.google.com/uc?export=download&id=1VX_2Bm_cbh1ECIjOY9jpyfV32ObOY3Hg", format = "csv", class = "tibble") %>%
mutate(token = stemDocument(x = word, language = "english"), sentimento = sentiment,.keep = "none") %>%
  
group_by(token) %>%       
distinct(sentimento) %>%  
ungroup() %>%
filter(sentimento %in% c("positive", "negative"))

# Cruzar Tokens das atas com Dicionário e contar palavras por sentimento
atas_sentimento <- inner_join(x = atas_token, ny = dicionario, by = "token") %>%
count(ata, sentimento)
#inner_join ->  cruza mantendo linhas com chave em comum

#############
### Index ###
#############

# Transforma dados e calcula o índice
indice <- atas_sentimento %>%
  pivot_wider( # transforma para formato long (mais colunas e menos linhas)
    id_cols     = "ata",
    names_from  = "sentimento",
    values_from = "n"
    ) %>%
  mutate(indice = positive - negative) # calcula o índice


# Visualização de dados (gráfico de colunas)
indice %>%
ggplot() + aes(x = ata, y = indice, fill = indice > 0) +
geom_col(show.legend = FALSE) +
scale_fill_manual(values = c("#b22200", "#282f6b")) +
scale_x_continuous(breaks = scales::breaks_extended(n = 10)) +
theme_light() +
labs(title = "COPOM: análise de sentimentos das atas", subtitle = "Sentimento = nº palavras positivas - nº palavras negativas, conforme dicionário de Loughran-McDonald",
x  = "Nº da Reunião", y = "Sentimento", caption = "Dados: BCB")


