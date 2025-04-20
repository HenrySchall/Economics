# Load Packages 
lapply(packages, library, character.only = TRUE)

############################
### Modelos de Filtragem ###
############################

dados <- import(file = "https://drive.google.com/uc?export=download&id=1vJ1l_1hi3OT5jCi7_d8rD5ItlVthEVte", format   = "csv", setclass = "tibble") %>%
mutate(ln_pib = log(pib), tempo  = row_number())

cores <- c( "#a70b2d","#0044ff","#058f27")
g1 <- dados %>% ggplot() + aes(x = data, y = pib, color = "PIB") +  
geom_line(size = 1) +               
scale_color_manual(values = cores) + # define cor da(s) linha(s)
theme(legend.position = "bottom", panel.background = element_rect(fill = "white"), plot.background = element_rect(fill = "gray")) +
labs(title = "PIB do Brasil", subtitle = "Preços de mercado, nº índice sazonalmente ajustado (média de 1995 = 100)", y = "Índice", x = NULL, color = NULL, caption  = "Dados: IBGE")
plot(g1)

########################
### Tendência Linear ###
########################

# Regressão linear do PIB contra o tempo
reg1 <- lm(formula = ln_pib ~ tempo, data = dados)
potencial_tl <- reg1 %>% fitted() %>% exp()       

# fitted() %>% -> extrai os valores estimados
# exp() -> reverte a transformação logarítmica

g1 + geom_line(mapping = aes(y = potencial_tl, color = "Tendência linear"), size = 1)

######################################
### Filtro Hodrick e Prescott (HP) ### 
######################################

# Converte dados para classe ts
dados_ts <- ts(data  = dados$ln_pib, start = c(year(min(dados$data)), quarter(min(dados$data))), frequency = 4)

# data  = dados$ln_pib -> vetor da série do PIB
# year(min(dados$data)) ->ano (formato AAAA)
# quarter(min(dados$data)) -> trimestre (formato T)
# frequency = 4 -> frequência da série (trimestral = 4))

filtro_hp <- hpfilter(x = dados_ts, type = "lambda", freq = 1600)
potencial_hp <- filtro_hp %>% fitted() %>% exp() %>% as.vector()

g1 + geom_line(mapping = aes(y = potencial_hp, color = "Tendência de Hodrick/Prescott"), size = 1)

##########################
### Filtro de Hamilton ###
##########################

# Regressão linear aplicando a especificação de Hamilton
reg2 <- lm(formula = ln_pib ~ lag(ln_pib, 8) + lag(ln_pib, 9) + lag(ln_pib, 10) + lag(ln_pib, 11), data = dados, na.action = na.omit)
# na.action = na.omit -> omite os NAs criados pela função lag()

potencial_h <- reg2 %>% fitted() %>% exp()

# Adiciona 11 NAs no início da série para corresponder ao tamanho do vetor do PIB
potencial_h <- c(rep(NA, 11), potencial_h)

# Atualiza gráfico base com nova linha da tendência
g1 + geom_line(mapping = aes(y = potencial_h, color = "Tendência de Hamilton"), size = 1)

#####################################
### Calculando o hiato do produto ### 
#####################################

# Cálculo do hiato do produto
hiato <- dados %>% select("data", "pib") %>% 
mutate(`Tendência Linear` = (pib / potencial_tl - 1) * 100, `Filtro HP` = (pib / potencial_hp - 1) * 100, 
`Filtro de Hamilton`= (pib / potencial_h - 1) * 100) %>% pivot_longer(cols = 3:5,names_to = "variavel", values_to = "valor")

# pivot_longer -> transforma a tabela pro formato "longo" (mais linhas e menos colunas)
# cols -> colunas a serem transformadas
# names_to -> nome da coluna que armazenará os nomes das colunas 3:6
# values_to -> nome da coluna que armazenará os valores das colunas 3:6

# Visualização de dados: gráfico de linha dos hiatos estimados
hiato %>% ggplot() + aes(x = data, y = valor, color = variavel) +
geom_hline(yintercept = 0, linetype = "dashed") +
geom_line(size = 1) +
scale_color_manual(values = cores) +

theme(
legend.position = "bottom", 
legend.text = element_text(size = 12), 
legend.title = element_text(size = 14, face = "bold"), 
plot.title = element_text(size = 20, face = "bold", hjust = 0.5), 
panel.background = element_rect(fill = "lightgray", color = NA),
plot.background = element_rect(fill = "white", color = NA)
) +

labs(title = "Hiato do Produto", subtitle = "", y = "%", x = NULL, color = NULL, 
caption = "Nota: hiato medido como a diferença % do PIB efetivo em relação ao potencial")

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

####################
### Sollow Model ###
####################


# Funções Definidas pelo Usuário ------------------------------------------

# Função que calcula a renda per capita no estado estacionário de Solow
y_ss <- function(A, s, n, g, delta, alpha){

  y <- A * (s / (n + g + delta))^(alpha / (1-alpha))

  return(y)

}


# Valores padrão para variáveis exógenas do modelo
A     <- 1
s     <- 0.1
n     <- 0.01
g     <- 0.015
delta <- 0.05
alpha <- 0.33


# Simulação 1: choque na taxa de crescimento populacional -----------------

# Criar um vetor numérico com uma sequência simulada de choques (novos valores
# de n)
choque_n <- seq(from = -0.05, to = 0, by = 0.001)


# Calcular efeito em y no estado estacionário dado choques em n
efeito_n <- y_ss(A = A, s = s, n = choque_n, g = g, delta = delta, alpha = alpha)


# Gerar gráfico da renda per capita vs. choque em n
dplyr::tibble(y = efeito_n, n = choque_n) %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = n, y = y) +
  ggplot2::geom_line(size = 2, color = "#282f6b") +
  ggplot2::labs(
    title    = "Estado estacionário de Solow: \nefeito de choque em n sobre a renda per capita",
    subtitle = "Assumindo que: A = 1, s = 10%, g = 1,5%, delta = 5% e alpha = 0,33",
    y        = "Renda per capita (y)",
    x        = "Taxa de crescimento populacional (n)",
    caption  = "Elaboração: analisemacro.com.br"
    )



# Simulação 2: choque na taxa de poupança ---------------------------------

# Criar um vetor numérico com uma sequência simulada de choques (novos valores
# de s)
choque_s <- seq(from = 0.1, to = 0.5, by = 0.01)


# Calcular efeito em y no estado estacionário dado choques em s
efeito_s <- y_ss(A = A, s = choque_s, n = n, g = g, delta = delta, alpha = alpha)


# Gerar gráfico da renda per capita vs. choque em s
dplyr::tibble(y = efeito_s, s = choque_s) %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = s, y = y) +
  ggplot2::geom_line(size = 2, color = "#282f6b") +
  ggplot2::labs(
    title    = "Estado estacionário de Solow: \nefeito de choque em s sobre a renda per capita",
    subtitle = "Assumindo que: A = 1, n = 1%, g = 1,5%, delta = 5% e alpha = 0,33",
    y        = "Renda per capita (y)",
    x        = "Taxa de poupança (s)",
    caption  = "Elaboração: analisemacro.com.br"
    )



# Simulação 3: choque tecnológico -----------------------------------------

# Criar um vetor numérico com uma sequência simulada de choques (novos valores
# de A)
choque_A <- seq(from = 1.05, to = 2.5, by = 0.01)


# Calcular efeito em y no estado estacionário dado choques em A
efeito_A <- y_ss(A = choque_A, s = s, n = n, g = g, delta = delta, alpha = alpha)


# Gerar gráfico da renda per capita vs. choque em A
dplyr::tibble(y = efeito_A, A = choque_A) %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = A, y = y) +
  ggplot2::geom_line(size = 2, color = "#282f6b") +
  ggplot2::labs(
    title    = "Estado estacionário de Solow: \nefeito de choque em A sobre a renda per capita",
    subtitle = "Assumindo que: s = 10%, n = 1%, g = 1,5%, delta = 5% e alpha = 0,33",
    y        = "Renda per capita (y)",
    x        = "Nível tecnológico (A)",
    caption  = "Elaboração: analisemacro.com.br"
    )



# Extra -------------------------------------------------------------------

# Calculando o capital per capita dado a renda per capita:
# Note que y = k^alpha, então -> k = y^(1/alpha)
# Uma vez obtido o k, podemos obter também a reta de depreciação (n + g + delta)k
# e a curva de investimento (sy)
solow <- dplyr::tibble(y = efeito_s, s = choque_s) %>%
  dplyr::mutate(
    k           = y^(1/alpha),
    n_g_delta_k = (n + g + delta) * k,
    sy          = mean(s) * y # por simplificação, média dos choques em s
    )

# Plotando o diagrama de Solow
solow %>%
  ggplot2::ggplot() +
  ggplot2::aes(x = k) +
  ggplot2::geom_line(mapping = ggplot2::aes(y = y, color = "y = k^alpha")) +
  ggplot2::geom_line(mapping = ggplot2::aes(y = n_g_delta_k, color = "(n + g + delta)k")) +
  ggplot2::geom_line(mapping = ggplot2::aes(y = sy, color = "sy")) +
  ggplot2::labs(
    title    = "Diagrama de Solow: estado estacionário",
    subtitle = paste0(
      "Assumindo que: A = 1, s = ", mean(solow$s),
      ", n = 1%, g = 1,5%, delta = 5% e alpha = 0,33"
      ),
    y        = NULL,
    color    = NULL,
    x        = "Capital per capita (k)",
    caption  = "Elaboração: analisemacro.com.br"
    )


