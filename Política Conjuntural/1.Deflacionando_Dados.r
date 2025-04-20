# Load Packages 
lapply(packages, library, character.only = TRUE)

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

#################################
### Calcular taxa de variação ###
#################################

# Tabelas do SIDRA
# 1846 - Valores a preços correntes
# 6612 - Valores encadeados a preços de 1995
# 1620 - Série encadeada do índice de volume trimestral (Base: média 1995 = 100)
# 1621 - Série encadeada do índice de volume trimestral com ajuste sazonal (Base: média 1995 = 100)

dados <- import(file=" https://drive.google.com/uc?export=download&id=1tLPIlaFw4t7jUv6Zu3BzY-qQVjbsMqdU",format = "csv",setclass = "tbl_df")
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
dados %>%
select("Trimeste/Ano"= "data","Var. % trimestral" = "var_trimestral", "Variação % interanual" = "var_interanual", "Variação % anual" = "var_anual", "Variação % acumulada no ano" = "var_acum_ano") %>%
pivot_longer(cols = 2:5,names_to  = "variavel", values_to = "valor") %>%
 
# cols = índice das colunas que vou pivotar
# names_to = nome da coluna que armazenará os nomes de 2:5
# values_to = nome da coluna que armazenará os valores de 2:5  
  
ggplot() + aes(x = `Trimeste/Ano`, y = valor, color = variavel) +
geom_line(size = 1) +
facet_wrap(facets = ~variavel, scales = "free") + # cria um gráfico para cada linha
theme_minimal() + # define um tema padronizado
labs(title = "PIB: taxas de crescimento", y = NULL, caption = "Dados: IBGE") +
theme(legend.position = "none") # remove a legenda do lado direito