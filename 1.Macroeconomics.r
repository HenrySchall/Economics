library(magrittr)
library(rio)      
library(timetk)   
library(dplyr)    
library(tidyr)    
library(ggplot2) 
library(readr)
library(readxl)
library(forecast)
library(zoo)
library(rio) 
library(timetk)

###########################
### ANALISANDO OS DADOS ###
###########################

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
rolling <- function(column, fun = sum, period = 4, align = "right", ...) {
slidify_vec(.x = column,.f = fun,.period = period,.align = align, ...)}

# column = coluna de um data frame sobre a qual a operação será realizada
# fun = recebe uma função aritmética (sum, mean, median, etc.)
# period = janela móvel (de quantos em quantos períodos a operação é aplicada)
# align = a operação gera "period" - 1 valores em relação ao input inicial de valores

# Taxa trimestre contra trimestre imediatamente anterior (t contra t-1)
dados <- mutate(dados,var_trimestral = (num_indice_sa/lag(x = num_indice_sa, n = 1) - 1) * 100)

# Taxa trimestre contra mesmo trimestre do ano anterior (t contra t-4)
dados <- mutate(dados,var_interanual = (num_indice/lag(x = num_indice, n = 4) - 1) * 100)

# Taxa acumulada em quatro trimestres (em relação ao mesmo período do ano anterior)
dados <- mutate(dados,var_anual = (rolling(num_indice) / rolling(lag(x = num_indice, n = 4)) - 1) * 100)

View(dados)

# Taxa acumulada ao longo do ano (em relação ao mesmo período do ano anterior)
taxas <- taxas %>% # o pipe (%>%) pega o output dessa linha e insere como input
  # na próx. linha, possibilitando operações em cadeia/mais fáceis de serem lidas

  # 1º) Cria uma coluna de ano (YYYY) e agrupa as observações por essa coluna
  dplyr::group_by(ano = lubridate::year(data)) %>%

  # 2º) Acumula o número índice do PIB ao longo de cada ano em uma nova coluna
  dplyr::mutate(num_indice_acum = cumsum(num_indice)) %>%

  # 3º) Desagrupa os dados
  dplyr::ungroup() %>%

  # 4º) Calcula a taxa de variação % do índice >acumulado< no ano
  dplyr::mutate(
    var_acum_ano = (
      num_indice_acum / dplyr::lag(x = num_indice_acum, n = 4) - 1) * 100
  )
