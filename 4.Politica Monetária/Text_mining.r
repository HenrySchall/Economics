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

# if some packages weren't installed, run the commands in R Terminal -> https://github.com/HenrySchall/Data_Science/blob/main/R/Arquivos/Install_packages.r
# Link -> https://www.bcb.gov.br/en/publications/copomminutes/cronologicos

###################
### Text Mining ###
###################

# URL JSON (Web scraping)
url_json <- "https://www.bcb.gov.br/api/servico/sitebcb/copomminutes/ultimas?quantidade=2000&filtro="

# Importar JSON e usar links para importar textos das atas (formato tabular)
atas_texto <- fromJSON(txt = url_json) %>%
extract2("conteudo") %>% 
mutate(  

  magrittr::extract2("conteudo") %>% # extrai o elemento da lista
  dplyr::mutate(  # cria e trata colunas de interesse


    # expressão regular (regex) para extrair os primeiros 2 ou 3 números da coluna Titulo
    ata = stringr::str_extract(string = Titulo, pattern = "^[[:digit:]]{2,3}") %>%
      as.numeric(),

    # constrói link p/ cada ata
    link = paste0("https://www.bcb.gov.br", Url) %>% URLencode(),

    # importar textos das atas a partir dos links (for-loop)
    texto = purrr::map_chr(
      .x = link,
      .f = ~paste0(pdftools::pdf_text(.x), collapse = "\n")
      ),

    .keep = "none"  # mantém somente colunas criadas

    ) %>%
  tidyr::drop_na(ata) %>%  # remove linhas com NA (coluna ata)
  dplyr::as_tibble()

# Sobre regex, ver o pacote {stringr}: https://stringr.tidyverse.org/


# |-- Tratamento de dados ----

# Termos a serem arbitrariamente removidos
termos_rm <- c(
  "th",
  "Minutes of the Meeting",
  "Monetary Policy Committee",
  "Copom",
  "bcb.gov.br",
  "BCB",
  "Headquarters",
  "meeting rooms",
  "floor",
  "Brasilia",
  "Brasília",
  "DF",
  "Brazil",
  "Department",
  "Banking",
  "Operations",
  "Deputy",
  "Governor",
  "Committee",
  "Banco Central do Brasil",
  "banco central  brasil",
  "Meeting",
  "Office",
  "Minutes",
  "rd",
  "st",
  "nd",
  "Central Bank",
  "pp",
  "govbr",
  "bcbgovbr",
  month.name, # constante do R com nome de meses por extenso
  month.abb # abreviados
  )


# Remover stop words, pontuações, números, aplicar stemming e criar tokens
atas_token <- atas_texto %>%
  # Remove atas antes da nº 62 por problemas de codificação de caracters
  dplyr::filter(ata >= 62) %>%  # alternativa: ler essas atas com pdftools::pdf_ocr_text()
  dplyr::select(-"link") %>%
  dplyr::mutate(
    # Transforma para minúsculo
    texto = stringr::str_to_lower(texto) %>%
      # Remove "stop words"
      tm::removeWords(words = tm::stopwords(kind = "english")) %>%
      tm::removeWords(words = tm::stopwords(kind = "portuguese")) %>%
      # Remove pontuações e números
      tm::removePunctuation() %>%
      tm::removeNumbers() %>%
      # Remove termos "indesejados"
      tm::removeWords(words = stringr::str_to_lower(termos_rm)) %>%
      stringr::str_replace_all(pattern = "\\n|\\r|\\–|\\'|\\’|\\“|\\”", replacement = "") %>%
      # Stemming
      tm::stemDocument(language = "english")
    ) %>%
  # Criar tokens por palavras
  tidytext::unnest_tokens(output = "token", input = "texto", token = "words")



# Etapa 3: classificação de sentimentos -----------------------------------

# Objetivo: cruzar tabelas (tokens/dicionário) e contabilizar sentimento por ata


# Conjunto de dados do dicionário Loughran-McDonald
dicionario <- textdata::lexicon_loughran() %>%
  dplyr::mutate(
    token      = tm::stemDocument(x = word, language = "english"), # stemming
    sentimento = sentiment,
    .keep      = "none"
    ) %>%
  dplyr::group_by(token) %>%       # dado aplicação de stemming, surgiram palavras
  dplyr::distinct(sentimento) %>%  # duplicadas, aqui mantemos somente palavras únicas
  dplyr::ungroup() %>%
  dplyr::filter(sentimento %in% c("positive", "negative"))

# Cruzar Tokens das atas com Dicionário e contar palavras por sentimento
atas_sentimento <- dplyr::inner_join( # cruza mantendo linhas com chave em comum
  x  = atas_token,
  y  = dicionario,
  by = "token"
  ) %>%
  # conta por ata e sentimento (positivo/negativo) quantas palavras existem (mais técnicamente, quantas linhas existem na tabela)
  dplyr::count(ata, sentimento)


# Etapa 4: índice de sentimentos ------------------------------------------

# Objetivo: calcular índice entre nº palavras positivas e negativas


# Transforma dados e calcula o índice
indice <- atas_sentimento %>%
  tidyr::pivot_wider( # transforma para formato long (mais colunas e menos linhas)
    id_cols     = "ata",
    names_from  = "sentimento",
    values_from = "n"
    ) %>%
  dplyr::mutate(indice = positive - negative) # calcula o índice


# Visualização de dados (gráfico de colunas)
indice %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = ata, y = indice, fill = indice > 0) +
  ggplot2::geom_col(show.legend = FALSE) +
  ggplot2::scale_fill_manual(values = c("#b22200", "#282f6b")) +
  ggplot2::scale_x_continuous(breaks = scales::breaks_extended(n = 10)) +
  ggplot2::theme_light() +
  ggplot2::labs(
    title    = "COPOM: análise de sentimentos das atas",
    subtitle = "Sentimento = nº palavras positivas - nº palavras negativas, conforme dicionário de Loughran-McDonald",
    x        = "Nº da Reunião",
    y        = "Sentimento",
    caption  = "Dados: BCB | Elaboração: analisemacro.com.br"
  )
