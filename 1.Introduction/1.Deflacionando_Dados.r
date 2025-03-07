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

dados <- import(file=" https://drive.google.com/uc?export=download&id=1rNo07TaQrh7237k7h_MEvMytza19mRHv",format = "csv",setclass = "tbl_df")
View(dados)

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

