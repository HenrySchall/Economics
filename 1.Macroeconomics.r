library(magrittr)
library(rio)      
library(timetk)   
library(dplyr) 
library(tidyverse)   
library(tidyr)    
library(ggplot2) 
library(readr)
library(readxl)
library(forecast)
library(zoo)
library(rio) 
library(timetk)
library(lubridate)

# if the packages weren't installed, run the commands in R Terminal -> https://github.com/HenrySchall/Data_Science/blob/main/R/Install_Packages.txt

# Tipo de dados 
# - ts: série temporal
# - zoo: objeto zoo 
# - xts: no formato xts
# - timeSeries: série financeira

dados <- import(file="https://analisemacro.com.br/download/38675/",format = "csv",setclass = "tbl_df")
View(dados)

class(dados)
str(dados)

###########################
### Deflacionando Dados ###
###########################

dados <- mutate(dados,real = (inpc[data == "2021-12-01"] / inpc) * salario_minimo)

# Visualizando dados
ggplot(data = dados) + # inicia a primeira camada do gráfico
aes(x = data) + # define o eixo X
geom_line(aes(y=salario_minimo,color = "Nominal"),size = 1) + # plota uma linha com as observações                      
geom_line(aes(y=real,color = "Real"),size = 1) + # adiciona a outra linha de observações                 
labs(title = "Salário mínimo - Brasil",subtitle = "Valores deflacionados pelo INPC a preços de dez/2021",x = "Data",y = "R$",color = NULL, caption  = "Dados: IBGE/IPEADATA") # define títulos/textos do gráfico

#####################################
### Calcular taxa de crescimento ###
#####################################

dados <- import(file = "https://analisemacro.com.br/download/38774/",format = "csv",setclass = "tibble")
View(dados)

# Criando uma função para operações aritméticas em janelas móveis
moving <- function(column, fun = sum, period = 4, align = "right", ...) 
{slidify_vec(.x = column,.f = fun,.period = period,.align = align, ...)}

# column = coluna de um data frame sobre a qual a operação será realizada
# fun = recebe uma função aritmética (sum, mean, median, etc.)
# period = janela móvel (de quantos em quantos períodos a operação é aplicada)
# align = a operação gera "period" - 1 valores em relação ao input inicial de valores

# Taxa trimestre contra trimestre imediatamente anterior (t contra t-1)
dados <- mutate(dados,var_trimestral = (num_indice_sa/lag(x = num_indice_sa, n = 1) - 1) * 100)

# Taxa trimestre contra mesmo trimestre do ano anterior (t contra t-4)
dados <- mutate(dados,var_interanual = (num_indice/lag(x = num_indice, n = 4) - 1) * 100)

# Taxa acumulada em quatro trimestres (em relação ao mesmo período do ano anterior)
dados <- mutate(dados,var_anual = (moving (num_indice) / moving(lag(x = num_indice, n = 4)) - 1) * 100)

View(dados)

# Taxa acumulada ao longo do ano (em relação ao mesmo período do ano anterior)
dados <- dados %>% 

# Cria uma coluna de ano (YYYY) e agrupa as observações por essa coluna
group_by(ano = year(data)) %>%

# Acumula o número índice do PIB ao longo de cada ano em uma nova coluna
mutate(num_indice_acum = cumsum(num_indice)) %>% 

# Desagrupa os dados
ungroup() %>%

# 4º) Calcula a taxa de variação % do índice acumulado no ano
mutate(var_acum_ano = (num_indice_acum / lag(x = num_indice_acum, n = 4) - 1) * 100)

View(dados)

# Visualizando dados

# Tratar dados e criar gráficos de linha
dados %>%
  # Selecionar e renomear colunas de interesse ("novo_nome" = "nome_antigo")
  dplyr::select(
    "Trimeste/Ano"                = "data",
    "Var. % trimestral"           = "var_trimestral",
    "Variação % interanual"       = "var_interanual",
    "Variação % anual"            = "var_anual",
    "Variação % acumulada no ano" = "var_acum_ano"
    ) %>%
  # Pivotar tabela p/ formato "longo" (menos colunas e mais linhas)
  tidyr::pivot_longer(
    cols      = 2:5,        # índice das colunas que vou pivotar
    names_to  = "variavel", # nome da coluna que armazenará os nomes de 2:5
    values_to = "valor"     # nome da coluna que armazenará os valores de 2:5
    ) %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = `Trimeste/Ano`, y = valor, color = variavel) +
  ggplot2::geom_line(size = 1) +
  ggplot2::facet_wrap(facets = ~variavel, scales = "free") + # cria um gráfico para cada linha
  ggplot2::theme_minimal() + # define um tema padronizado
  ggplot2::labs(
    title   = "PIB: taxas de crescimento",
    y       = NULL,
    caption = "Dados: IBGE | Elaboração: analisemacro.com.br"
    ) +
  ggplot2::theme(legend.position = "none") # remove a legenda do lado direito
