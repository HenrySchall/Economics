###########################
### ANALISANDO OS DADOS ###
###########################

# Tipo de dado que queremos no R
# - ts: série temporal
# - zoo: objeto zoo 
# - xts: no formato xts
# - timeSeries: série financeira

dados <- import(file="https://analisemacro.com.br/download/38675/",format = "csv",setclass = "tbl_df")
View(dados)

class(dados)
str(dados)

#####################
### Deflacionando ###
#####################

mutate(dados,real = (inpc[data == "2021-12-01"] / inpc) * salario_minimo)

# Salvar em um novo objeto
dados_reais <- mutate(dados,real = (inpc[data == "2021-12-01"] / inpc) * salario_minimo)

# Salvar no mesmo objeto
dados <- mutate(dados,real = (inpc[data == "2021-12-01"] / inpc) * salario_minimo)

####################################
### Visualizando dados (ggplot2) ###
####################################

ggplot(data = dados) + # inicia a primeira camada do gráfico
aes(x = data) + # define o eixo X
geom_line(aes(y=salario_minimo,color = "Nominal"),size = 1) + # plota uma linha com as observações                      
geom_line(aes(y=real,color = "Real"),size = 1) + # adiciona a outra linha de observações                 
labs(title = "Salário mínimo - Brasil",subtitle = "Valores deflacionados pelo INPC a preços de dez/2021",x = "Data",y = "R$",color = NULL, caption  = "Dados: IBGE/IPEADATA") # define títulos/textos do gráfico