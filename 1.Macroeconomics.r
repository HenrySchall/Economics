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

##########################
### Visualizando dados ###
##########################