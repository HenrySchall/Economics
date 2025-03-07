# Introdução

### Deflacionando Dados 

> Quando estamos trabalhando com valores macroeconômicos é normal que eles sofram variações ao longo do tempo. Sendo assim, para termos uma visão realística dos dados, sempre transformamos valores nominais para valores deflacionados (ou reais), ou seja, contabilizando o efeito da variações dos indicadores economicos, geralmente o efeito inflacionário do período. Então para exemplificar, vamos pegar uma série do salário mínimo (IPEADATA) é um índice de preços (Índice Nacional de Preços ao Consumidor Amplo - IPCA) ou (Índice Nacional de Preços ao Consumidor - INPC) ou (Índice Geral de Preços de Mercado - IGPM), que será nossa variável para deflacionar o salário mínimo, aplicando à fórmula:

<p align="center">
  <img src="https://github.com/user-attachments/assets/106f2a08-da07-4639-94a6-39406b0caec6"/>

onde: 
- $Vreal(x,y)$ = é o valor real, ou deflacionado, no período x na data-base y
- $Ix$ = é o índice de preços fixado na data-base y
- $Iy$ = é o índice de preços no período x
- $Vx$ =  é o valor ou preço nominal no período x

Exemplo: Imagine que queremos o salário mínimo real de julho de 2021 (07/2021) na data-base de dezembro de 2021 (12/2021)

|Data |Salário Minimo|IPCA|
|---	      |--- |---    |
|2021-12-01|1100|6330.59|   
|2021-11-01|1100|6284.71|   
|2021-10-01|1100|6232.36|   	
|2021-09-01|1100|6160.89|  
|2021-08-01|1100|6087.84|  
|2021-07-01|1100|6034.73|  

<p align="left">
  <img src="https://github.com/user-attachments/assets/43dcffa5-7148-43d7-8d1e-2381b3fec7d4"/>

### Sistema de Contas Nacionais

> O Sistema de Contas Nacionais (SCN) é o conjunto padronizado de recomendações internacionalmente acordadas sobre como compilar as medidas de atividade econômica, de acordo com rígidas convenções contábeis baseadas em princípios econômicos. No Brasil o responsável por compilar e divulgar essas estatísticas é o IBGE através do Sistema de Contas Nacionais Trimestrais (SCNT)

Indices 
- Produto Interno Bruto (PIB) a preços de mercado;
- Impostos sobre produtos;
- Valor adicionado a preços básicos;
- Consumo pessoal;
- Consumo do governo;
- Formação bruta de capital fixo (FBCF);
- Variação de estoques
- Exportações e importações de bens e serviços.

> O PIB é a soma de todos os bens e serviços finais produzidos por um país, estado ou cidade, geralmente em um ano. Todos os países calculam o seu PIB nas suas respectivas moedas. Em resumo, o PIB é um indicador que ajuda a compreender a economia como um todo, mas não expressa importantes fatores, como distribuição de renda, qualidade de vida, educação e saúde. O PIB pode ser expresso por três óticas:

- Oferta (produto): PIB é igual ao valor bruto da produção, a preços básicos, menos o consumo intermediário, a preços de consumidor, mais os impostos, líquidos de subsídios, sobre produtos;
- Demanda (despesa): PIB é igual a despesa de consumo das famílias, mais o consumo do governo, mais o consumo das instituições sem fins de lucro a serviço das famílias (consumo final), mais a formação bruta de capital fixo, mais a variação de estoques, mais as exportações de bens e serviços, menos as importações de bens e serviços;
- Renda: PIB é igual à remuneração dos empregados, mais o total dos impostos, líquidos de subsídios, sobre a produção e a importação, mais o rendimento misto bruto, mais o excedente operacional bruto.

PIB nominal X PIB real

#### Deflator do PIB
O deflator do PIB mede o nível atual de preços relativo ao nível de preços do ano-base;
É um índice de preços com todos os bens e serviços produzidos na economia;
Serve para obter a parte do aumento do PIB nominal atribuída a um aumento de preços e não por uma aumento nas quantidades produzidas;
Reflete apenas os preços dos bens e serviços.
Seu cálculo é bastante simples:     

<p align="center">
  <img src="https://github.com/user-attachments/assets/8c361c92-69d2-4d1b-9ea1-2973542a5cbc"/>

### Taxa de Crescimento de Indicadores 

> Sendo It o número índice do período (trimestre) t, onde t = 1,2,...,n, podemos obter algumas métricas de crescimento PIB como:

- Taxa trimestre contra trimestre imediatamente anterior (t contra t-1): 
<p align="center">
  <img src="https://github.com/user-attachments/assets/234b2198-8a1a-43c0-84ac-03fe37bfadb8"/>

- Taxa trimestre contra mesmo trimestre do ano anterior (t contra t-4)
<p align="center">
  <img src="https://github.com/user-attachments/assets/a90ed934-a87d-4e42-bef0-9b4c68cfa1af"/>

- Taxa acumulada em quatro trimestres (em relação ao mesmo período do ano anterior):
<p align="center">
  <img src="https://github.com/user-attachments/assets/d5de14e7-2d26-4752-8409-7c2c56b4aaac"/>

#### Exemplo 
> A tabela abaixo apresenta uma amostra das séries encadeadas do PIB, índice de volume trimestral, e são provenientes das tabelas 1620 e 1621 do SIDRA/IBGE.

|Período          |Nº Índice|Nº Índice com Ajuste Sazonal|
|---	            |---      |---                         |
|1º trimestre 2020|167,60   |6330.59                     |   
|1º trimestre 2021|170,53   |6284.71                     |   
|2º trimestre 2020|152,48   |6232.36                     |   	
|2º trimestre 2021|171,38   |6160.89                     |  
|3º trimestre 2019|173,64   |6087.84                     |  
|3º trimestre 2020|168,37   |6034.73                     |  
|3º trimestre 2021|175,46   |6034.73                     |  
|4º trimestre 2019|172,03   |6034.73                     |  
|4º trimestre 2020|171,46   |6034.73                     |  
|4º trimestre 2021|173,96   |6034.73                     |  


|Variação % Anual                                                                                |
|---	                                                                                           |
|                                             -                                                  |
|                                             -                                                  |
|                                             -                                                  |
|[ (171,38 + 170,53 + 171,46 + 168,37) / (152,48 + 167,60 + 172,03 + 173,64) - 1 ] * 100 = 2,40% |
|                                             -                                                  |
|                                             -                                                  |
|[ (175,46 + 171,38 + 170,53 + 171,46) / (168,37 + 152,48 + 167,60 + 172,03) - 1 ] * 100 = 4,29% |
|                                             -                                                  |
|                                             -                                                  |
|[ (173,96 + 175,46 + 171,38 + 170,53) / (171,46 + 168,37 + 152,48 + 167,60) - 1 ] * 100 = 4,76% |



|Período          |Nº Índice|Nº Índice com Ajuste Sazonal|Variação % Trimestral                    |Variação % Interanual                    |  
|---	            |---      |---                         |---	                                     |---	                                     |
|1º trimestre 2020|167,60   |6330.59                     |[ (168,10 / 171,89) - 1 ] * 100 = -2,20% |                     -                   |
|1º trimestre 2021|170,53   |6284.71                     |[ (173,14 / 171,45) - 1 ] * 100 = 0,99%  |[ (170,53 / 167,60) - 1 ] * 100 = 1,75%  |
|2º trimestre 2020|152,48   |6232.36                     |[ (153,26 / 168,10) - 1 ] * 100 = -8,83% |                     -                   |
|2º trimestre 2021|171,38   |6160.89                     |[ (172,06 / 173,14) - 1 ] * 100 = -0,62% |[ (171,38 / 152,48) - 1 ] * 100 = 12,40% |
|3º trimestre 2019|173,64   |6087.84                     |                      -                  |                     -                   |
|3º trimestre 2020|168,37   |6034.73                     |[ (165,33 / 153,26) - 1 ] * 100 = 7,88%  |[ (168,37 / 173,64) - 1 ] * 100 = -3,04% |
|3º trimestre 2021|175,46   |6034.73                     |[ (172,26 / 172,06) - 1 ] * 100 = 0,12%  |[ (175,46 / 168,37) - 1 ] * 100 = 4,21%  |
|4º trimestre 2019|172,03   |6034.73                     |[ (171,89 / 170,49) - 1 ] * 100 = 0,82%  |                     -                   |
|4º trimestre 2020|171,46   |6034.73                     |[ (171,45 / 165,33) - 1 ] * 100 = 3,70%  |[ (171,46 / 172,03) - 1 ] * 100 = -0,33% |
|4º trimestre 2021|173,96   |6034.73                     |[ (174,26 / 172,26) - 1 ] * 100 = 1,16%  |[ (173,96 / 171,46) - 1 ] * 100 = 1,46%  |




### Software X-13ARIMA-SEATS 

> É um programa desenvolvido pelo U.S. Census Bureau para ajuste sazonal de séries temporais. Ele combina dois métodos clássicos de ajuste sazonal:

- X-11/X-12-ARIMA –> Método baseado em médias móveis iterativas, amplamente utilizado para ajustar séries econômicas e estatísticas oficiais.
- SEATS (Signal Extraction in ARIMA Time Series) -> Modelo estatístico baseado na decomposição da série em componentes estruturais (tendência, sazonalidade, ciclo e erro).
