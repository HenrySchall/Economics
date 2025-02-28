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

# Dados -------------------------------------------------------------------

# Importar dados online: PIB trimestral (série encadeada, s.a.)
dados <- rio::import(
  file     = "https://analisemacro.com.br/download/38922/",
  format   = "csv",
  setclass = "tibble"
  ) %>%
  # Cria uma nova coluna com a transformação logarítmica do PIB
  dplyr::mutate(pib_log = log(pib))

# Transformar série do PIB para a clase "ts"
dados_ts <- ts(                          # função para criar série temporal
  data = dados$pib_log,                  # vetor com valores da série
  start = c(                             # definir ano e mês de início da série
    lubridate::year(min(dados$data)),    # 1ª posição do vetor: extrai a 1ª data e converte para YYYY
    lubridate::quarter(min(dados$data))  # 2ª posição do vetor: extrai a 1ª data e converte para MM
    ),
  frequency = 4                          # define a frequência da série (4 = trimestral)
  )

# Visualiza a série temporal
plot(dados_ts)



# Datação do ciclo econômico ----------------------------------------------

# Computar o ciclo de negócios pelo método de Harding e Pagan (2002)
ciclo <- BCDating::BBQ(
  y        = dados_ts,   # série do PIB transformado
  minphase = 2,          # duração mínima das fases (recessão/expansão)
  mincycle = 5,          # duração mínima do ciclo
  )

# Imprime os picos, vales e duração da fase
show(ciclo)

# Imprime informações detalhadas (comparar com CODACE)
summary(ciclo)



# Análise gráfica ---------------------------------------------------------

# Plota gráfico da série do PIB com áreas sombreadas das recessões
plot(x = ciclo, y = dados_ts, main = "Ciclo de negócios brasileiro (PIB)")


