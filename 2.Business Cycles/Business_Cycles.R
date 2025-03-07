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

# if some packages weren't installed, run the commands in R Terminal -> https://github.com/HenrySchall/Data_Science/blob/main/R/Arquivos/Install_packages.r

dados <- import(file = "https://drive.google.com/uc?export=download&id=1vJ1l_1hi3OT5jCi7_d8rD5ItlVthEVte", format = "csv", class = "tibble") %>% 
mutate(pib_log = log(pib))
View(dados)

# Nesse caso estamos utilizando uma Série do PIB Real em frequência trimestral e ajustada sazonalmente, esse ajuste sazonal é um processo 
# utilizado para remover as variações sazonais (feriados, estações do ano, etc.), de modo a identificar a tendência de longo prazo e os ciclos econômicos. 
# O método mais comum para ajustar sazonalmente é o programa X-13ARIMA-SEATS (https://www.census.gov/data/software/x13as.html), para encontrar o código para 
# sazonalinar séries, ir no link -> https://github.com/HenrySchall/Macroeconometrics/blob/main/1.Introdu%C3%A7%C3%A3o/3.X13ARIMASEATS.r

# Tipo de dados 
# - ts: série temporal
# - zoo: objeto zoo 
# - xts: no formato xts
# - timeSeries: série financeira

dados_ts <- ts(data = dados$pib_log, start = c(year(min(dados$data)),quarter(min(dados$data))),frequency = 4)                            
  
# year(min(dados$data)),    # 1ª posição do vetor: extrai a 1ª data e converte para YYYY  
# quarter(min(dados$data))  # 2ª posição do vetor: extrai a 1ª data e converte para MM  

# Visualiza a série temporal
plot(dados_ts)

# Computar o ciclo de negócios pelo método de Harding e Pagan (2002)
ciclo <- BBQ(y = dados_ts, minphase = 2, mincycle = 5)

# y = dados_ts -> série do PIB transformado
# minphase = 2 -> duração mínima das fases (recessão/expansão)
# mincycle = 5 -> duração mínima do ciclo
  
# Imprime os picos, vales e duração da fase
show(ciclo)

# Imprime informações detalhadas (comparar com CODACE)
summary(ciclo)

# Plota gráfico da série do PIB com áreas sombreadas das recessões
plot(x = ciclo, y = dados_ts, main = "Ciclo de negócios brasileiro (PIB)")


