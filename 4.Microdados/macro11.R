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
library(lubridate)
library(ipeadatar) 
library(sidrar)
library(GetBCBData) 
library(PNADcIBGE) 
library(survey)
library(data.table)

# if some packages weren't installed, run the commands -> https://github.com/HenrySchall/Data_Science/blob/main/R/Install_Packages.txt
# More information about the package PNADcIBGE -> https://rpubs.com/gabriel-assuncao-ibge/pnadc

###########################
### Importando os dados ###
###########################

# Criar pasta para salvar microdados
setwd("C:/Users/henri/Documentos")
if (!dir.exists("data")) {dir.create("data")}

# Importar microdados
dados <- get_pnadc(year = 2022, quarter = 1, vars = c("VD4020"), savedir = "data", labels = FALSE)

# year = ano da PNADC
# quarter = trimestre da PNADC
# vars    = variáveis a serem importadas para o R
# savedir = pasta para salvar arquivos
# labels  = não recodificar variáveis com descrições

# Listar arquivos baixados na pasta "data"
list.files("data")

# Conectar os dados com o Visual Studio Code
setwd("C:/Users/henri/Documentos/data")

dadosPNADc <- read_pnadc(microdata="PNADC_012022.txt", input_txt="input_PNADC_trimestral.txt")

dadosPNADc <- pnadc_labeller(data_pnadc=dadosPNADc, dictionary.file="dicionario_PNADC_microdados_trimestral.xls")

dadosPNADc <- pnadc_deflator(data_pnadc=dadosPNADc, deflator.file="deflator_PNADC_2024_trimestral_101112.xls")

# Gerenciamento de Memória - Liberar Espaço
gc()

###############
### Análise ###
###############

# Renda em valor real (deflacionada)
dados$variables <- mutate(dados$variables, VD4020_real = VD4020 * Efetivo)

# VD4020 = Variável de renda nominal
# Efetivo = Deflator
# dados$variables = Tabela com as variáveis importadas
# VD4020_real = Coluna que será criada (nominal * deflator do IBGE)

# Observação: os valores resultantes dos comandos abaixo são estimativas sobre
# a população.
View(dados[["variables"]])
# |-- Estatísticas descritivas ----

# Renda média
svymean(x = ~VD4020_real, design = dados, na.rm = TRUE)

# Massa de renda (total/soma)
svytotal(x = ~VD4020_real, design = dados, na.rm = TRUE)

# Quantis de renda
survey::svyquantile(
  x         = ~VD4020_real,
  design    = dados,
  na.rm     = TRUE,
  quantiles = c(0.25, 0.5, 0.75)
  )

# Gráfico de histograma
survey::svyhist(formula = ~VD4020_real, design = dados)


# Número de observações:

# Amostra
sum(weights(dados, type = "sampling") != 0) # ou simplismente nrow(dados$variables)

# População
survey::svytotal(x = ~as.numeric(Trimestre), design = dados)



# |-- Renda por regiões ----


# Criar variável representando Regiões
ufs <- as.numeric(dados$variables$UF)

dados$variables <- dplyr::mutate(
  dados$variables,                 # tabela com as variáveis importadas dentro do plano amostral
  regiao = dplyr::case_when(       # condições lógicas para categorizar UFs
    ufs %in% 11:17 ~ "Norte",      # com base nos códigos IBGE de cada UF
    ufs %in% 21:29 ~ "Nordeste",
    ufs %in% 31:35 ~ "Sudeste",
    ufs %in% 41:43 ~ "Sul",
    ufs %in% 50:53 ~ "Centro-Oeste"
    )
  )


# Renda média por Região
survey::svyby(
  formula = ~VD4020_real,     # variável usada para calcular uma estatística
  by      = ~regiao,          # variável que define grupos (domínios) para o cálculo
  design  = dados,            # objeto fonte de dados
  FUN     = survey::svymean,  # cálculo (estatística) a ser aplicado
  na.rm   = TRUE
  )



# Criar pasta para salvar microdados (é criada se não existir)
if (!dir.exists("data")) {dir.create("data")}