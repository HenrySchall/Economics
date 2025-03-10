if(!require(magrittr)){install.packages("magrittr")}
if(!require(mFilter)){install.packages("mFilter")}
if(!require(rio)){install.packages("rio")}
if(!require(BCDating)){install.packages("BCDating")}

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
library(mFilter)
library(ipeadatar) 
library(sidrar)
library(GetBCBData)
library(BCDating)

# if some packages weren't installed, run the commands in R Terminal -> https://github.com/HenrySchall/Data_Science/blob/main/R/Install_Packages.txt

############################
### Modelos de Filtragem ###
############################

dados <- import(file = "https://drive.google.com/uc?export=download&id=1vJ1l_1hi3OT5jCi7_d8rD5ItlVthEVte", format   = "csv", setclass = "tibble") %>%
mutate(ln_pib = log(pib), tempo  = row_number())

# Vetor de cores
cores <- c( "#282f6b","#b22200","#eace3f","#224f20")
g1 <- dados %>% ggplot() + aes(x = data, y = pib, color = "PIB") +  # especificação de eixos e título da série
geom_line(size = 1) +                    # adiciona linha com observações
scale_color_manual(values = cores) +     # define cor da(s) linha(s)
theme(legend.position = "bottom") +      # posiciona a legenda embaixo
labs(title = "PIB do Brasil", subtitle = "Preços de mercado, nº índice sazonalmente ajustado (média de 1995 = 100)", y = "Índice", x = NULL, color = NULL, caption  = "Dados: IBGE | Elaboração: analisemacro.com.br")

Plot(g1) 


# Tendência linear --------------------------------------------------------

# Regressão linear do PIB contra o tempo
reg1 <- lm(
  formula = ln_pib ~ tempo,   # especificação do modelo no formato de fórmula
  data    = dados             # fonte dos dados
  )

# Salva a tendência estimada
potencial_tl <- reg1 %>%
  fitted() %>% # extrai os valores estimados
  exp()        # reverte a transformação logarítmica

# Atualiza gráfico base com nova linha da tendência
g1 +
  ggplot2::geom_line(
    mapping = ggplot2::aes(y = potencial_tl, color = "Tendência linear"),
    size    = 1
    )


# Tendência quadrática ----------------------------------------------------

# Regressão linear do PIB contra o tempo + tempo^2  (veja help de I)
reg2 <- lm(formula = ln_pib ~ tempo + I(tempo^2), data = dados)

# Salva a tendência estimada
potencial_tq <- reg2 %>%
  fitted() %>% # extrai os valores estimados
  exp()        # reverte a transformação logarítmica

# Atualiza gráfico base com nova linha da tendência
g1 +
  ggplot2::geom_line(
    mapping = ggplot2::aes(y = potencial_tq, color = "Tendência quadrática"),
    size    = 1
    )


# Filtro HP ---------------------------------------------------------------

# Converte dados para classe ts
dados_ts <- ts(                         # função para criar um objeto de classe ts
  data  = dados$ln_pib,                 # vetor da série do PIB
  start = c(                            # vetor com dois elementos: ano e trimestre de início da série
    lubridate::year(min(dados$data)),   # ano (formato AAAA)
    lubridate::quarter(min(dados$data)) # trimestre (formato T)
    ),
  frequency = 4                         # frequência da série (trimestral = 4)
  )

# Calcula o filtro HP
filtro_hp <- mFilter::hpfilter(x = dados_ts, type = "lambda", freq = 1600)

# Salva a tendência calculada
potencial_hp <- filtro_hp %>%
  fitted() %>% # extrai os valores estimados
  exp() %>%    # reverte a transformação logarítmica
  as.vector()  # converte de classe ts para vetor numérico

# Atualiza gráfico base com nova linha da tendência
g1 +
  ggplot2::geom_line(
    mapping = ggplot2::aes(y = potencial_hp, color = "Tendência HP"),
    size    = 1
    )


# Filtro de Hamilton ------------------------------------------------------

# Regressão linear aplicando a especificação de Hamilton
reg3 <- lm(
  formula   = ln_pib ~ lag(ln_pib, 8) + lag(ln_pib, 9) + lag(ln_pib, 10) + lag(ln_pib, 11),
  data      = dados,
  na.action = na.omit  # omite os NAs criados pela função lag()
  )

# Salva a tendência estimada
potencial_h <- reg3 %>%
  fitted() %>% # extrai os valores estimados
  exp()        # reverte a transformação logarítmica

# Adiciona 11 NAs no início da série para corresponder ao tamanho do vetor do PIB
potencial_h <- c(rep(NA, 11), potencial_h)

# Atualiza gráfico base com nova linha da tendência
g1 +
  ggplot2::geom_line(
    mapping = ggplot2::aes(y = potencial_h, color = "Tendência Hamilton"),
    size    = 1
    )



# Calculando o hiato ------------------------------------------------------

# Cálculo do hiato do produto
hiato <- dados %>%
  dplyr::select("data", "pib") %>% # seleciona colunas de interesse
  dplyr::mutate(                   # cria novas colunas com cálculo do hiato
    `Tendência Linear`     = (pib / potencial_tl - 1) * 100,
    `Tendência Quadrática` = (pib / potencial_tq - 1) * 100,
    `Filtro HP`            = (pib / potencial_hp - 1) * 100,
    `Filtro de Hamilton`   = (pib / potencial_h - 1) * 100
    ) %>%
  tidyr::pivot_longer(             # transforma a tabela pro formato "longo" (mais linhas e menos colunas)
    cols      = 3:6,               # colunas a serem transformadas
    names_to  = "variavel",        # nome da coluna que armazenará os nomes das colunas 3:6
    values_to = "valor"            # nome da coluna que armazenará os valores das colunas 3:6
    )

# Visualização de dados: gráfico de linha dos hiatos estimados
hiato %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = data, y = valor, color = variavel) +
  ggplot2::geom_hline(yintercept = 0, linetype = "dashed") + # gera uma linha horizontal quando y = 0
  ggplot2::geom_line(size = 1) +
  ggplot2::scale_color_manual(values = cores) +
  ggplot2::theme(legend.position = "top") +
  ggplot2::labs(
    title    = "Hiato do Produto - Brasil",
    subtitle = "Cálculos do autor a partir do PIB encadeado dessazonalidado (média 1995 = 100)",
    y        = "%",
    x        = NULL,
    color    = NULL,
    caption  = "Elaboração: analisemacro.com.br \n Nota: hiato medido como a diferença % do PIB efetivo em relação ao potencial."
    )

######################
### Businees Cycle ###
######################

dados <- import(file = "https://drive.google.com/uc?export=download&id=1vJ1l_1hi3OT5jCi7_d8rD5ItlVthEVte", format = "csv", class = "tibble") %>% 
mutate(pib_log = log(pib))
View(dados)

# Nesse caso estamos utilizando uma Série do PIB Real em frequência trimestral e ajustada sazonalmente, esse ajuste sazonal é um processo 
# utilizado para remover as variações sazonais (feriados, estações do ano, etc.), de modo a identificar a tendência de longo prazo e os ciclos econômicos. 
# O método mais comum para ajustar sazonalmente é o programa X-13ARIMA-SEATS (https://www.census.gov/data/software/x13as.html), para encontrar o código para 
# sazonalinar séries, ir no link -> https://github.com/HenrySchall/Macroeconometrics/blob/main/1.Introduction/3.X13ARIMASEATS.r

# Tipo de dados 
# - ts: série temporal
# - zoo: objeto zoo 
# - xts: no formato xts
# - timeSeries: série financeira

dados_ts <- ts(data = dados$pib_log, start = c(year(min(dados$data)),quarter(min(dados$data))),frequency = 4)                            
  
# year(min(dados$data)) -> 1ª posição do vetor: extrai a 1ª data e converte para YYYY  
# quarter(min(dados$data)) -> 2ª posição do vetor: extrai a 1ª data e converte para MM  

# Visualiza a série temporal
plot(dados_ts)

# Computar o Businees Cycle pelo método de Harding e Pagan (2002)
ciclo <- BBQ(y = dados_ts, minphase = 2, mincycle = 5)

# minphase = 2 -> duração mínima das fases (recessão/expansão)
# mincycle = 5 -> duração mínima do ciclo
  
# Imprime os picos, vales e duração da fase
show(ciclo)

# Imprime informações detalhadas (comparar com FGV-CODACE)
summary(ciclo)

# Plota gráfico da série do PIB com áreas sombreadas das recessões
plot(x = ciclo, y = dados_ts, main = "Businees Cycle Brazil")

par(bg = "gray", fg = "black") 
plot(x = ciclo, y = dados_ts, , col = "black", col.main = "black", col.axis = "black", col.lab = "black", border = "black", lwd = 1, main = "Ciclo de negócios brasileiro (PIB)",
sub = "Produzidos por:", xlab = "Anos", ylab = "Frequência")