# Macroeconometria

![Macroeconomia](https://github.com/user-attachments/assets/99ef8ada-2357-47c9-a2c3-0cf2e57d471a)

> A macroeconomia é um ramo da ciência econômica que estuda o comportamento de uma economia como um todo. Dessa forma, os macroeconomistas buscam entender os fenômenos econômicos formulando modelos agredados (representações simplificadas da realidade), eles são agregados, porque parte-se do pressuposto de que o todo é mais complexo do que a soma das partes, não sendo possível descrever uma economia por meio de modelos para todas as empresas e indivíduos. Sendo assim, sua preocupação está em analisar indicadores agregados como PIB, taxa de desemprego e índices de preços.

### Conceitos Iniciais

- Ceteris paribus -> "todo o mais é constante", ou seja, nada muda, exceto o fator ou fatores que estão sendo estudados
- Variável endógena ->  também chamada de dependente, é a variável cujos valores são determinados no modelo
- Variável exógena ->  também chamada de independente, é a variável cujos valores são determinados fora do modelo
- Preços flexíveis ->  Suposição de que os preços se ajustam para igualar oferta e demanda (longo prazo)
- Preços rígidos ->  Suposição de que no curto prazo, muitos preços são rígidos, ou seja, se ajustam lentamente em resposta a mudanças na oferta ou na demanda
- Fluxo -> Magnitude econômica de um intervalo de tempo. EX: PIB (taxa mensal)
- Estoque -> Magnitude medida de um determinado ponto específico no tempo. EX: dívida externa do país

> Quando estamos trabalhando com valores macroeconômicos é normal que eles sofram variações ao longo do tempo. Sendo assim, para termos uma visão realística dos dados, sempre transformamos valores nominais para valores deflacionados (ou reais), ou seja, contabilizando o efeito da variações dos indicadores economicos, geralmente o efeito inflacionário do período. Então para exemplificar, vamos pegar uma série do salário mínimo (IPEADATA) é um índice de preços (Índice Nacional de Preços ao Consumidor Amplo - IPCA) ou (Índice Nacional de Preços ao Consumidor - INPC) ou (Índice Geral de Preços de Mercado - IGPM), que será nossa variável para deflacionar o salário mínimo, aplicando à fórmula:

$Vreal(x,y) = (\frac{Ix}{Iy}) * Vx$

onde: 
- $Vreal(x,y)$ = é o valor real, ou deflacionado, no período x na data-base y
- $Ix$ = é o índice de preços fixado na data-base y
- $Iy$ = é o índice de preços no período x
- $Vx$ =  é o valor ou preço nominal no período x

Exemplo: Imagine que queremos o salário mínimo real de julho de 2021 (07/2021) na data-base de dezembro de 2021 (12/2021)

|Data |Salário Minimo|IPCA|
|---	     |--- |---    |
|2021-12-01|1100|6330.59|   
|2021-11-01|1100|6284.71|   
|2021-10-01|1100|6232.36|   	
|2021-09-01|1100|6160.89|  
|2021-08-01|1100|6087.84|  
|2021-07-01|1100|6034.73|  

$Vreal(x,y) = (\frac{Ix}{Iy}) * Vx$

$Vreal$(07/21,12/21) = $(\frac{6330.59}{6034.73}) * 1100$

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

$Deflator do PIB = \frac{PIB Nominal}{PIB Real}×100$

### Taxa de Crescimento de Indicadores 












### Modelos Macroeconômicos 

> Os ciclos econômicos são flutuações recorrentes na atividade econômica agregada dqw nações ao longo do tempo. Um ciclo consiste em fases de expansão, recessão e recuperação, simultaneamente em muitas setores da atividades econômica, as quais se consolidam posteriormente em uma nova fase de expansã (lembrando que essa sequência de mudanças é recorrente, mas não periódica). Podemos pensar os ciclos econômicos de forma análoga às condições meteorológicas, alguns períodos de calor e outros de frio, a ideia central é que a atividade econômica se move de um topo para um fundo e depois do fundo para o topo, oscilando em torno de um equilíbrio desconhecido. No Brasil a CODACE/FGV períodicamente determina e data os ciclos econômicos, como um comitê independente, ele ssegue os modelos adotados em outros países, como pelo NBER nos Estados Unidos.

#####  Decomposição do PIB

$Yt = Yp + Ht$

- Yt = Produto Interno Bruto (PIB)
- Yp = É o chamado produto potencial (não observável), representa a tendência de longo prazo do PIB, ou seja, reflete condições estruturais da economia como a população em idade ativa, o estoque de capital, qualidade de educação e qualidade das instituições.
- Ht = É o chamado hiato do produto, representa o componente cíclico, ou seja, reflete condições conjunturais da economia, como choques de demanda/oferta, incentivos de política econômica, condições climáticas, choques externos e incertezas políticas.

> Em outras palavras, no curto prazo o PIB pode crescer mais ou menos do que o PIB potencial, sendo a diferença entre Yt e Yp dada pelo hiato do produto ou ciclo econômico. A dinâmica desse ciclo é determinada em grande medida pela rigidez de preços da economia. Fossem os preços totalmente flexíveis, o ajuste seria imediato, implicando que a diferença (hiato) fosse sempre igual a zero (a economia estaria sempre em equilíbrio). Porém, na prática, isso não acontece.

> Em 1990, a teoria macroeconômica começou a ser baseada na síntese novo-keynesiana ou novo consenso macroeconômico. As implicações disso, foram o desenvolvimento de pequenos modelos estruturais, que buscavam entender melhor o ciclo econômico, assim como o grau de abertura do hiato do produto. Estes modelos sintetizam relações básicas entre as variáveis econômicas, permitindo estimar o comportamento da economia e ajustar a política econômica (efeito de mudanças no instrumento) de modo a evitar grandes desvios em relação às metas. No Brasil, a autoridade monetária (BCB), após a adoção do Regime de Metas para Inflação em 1999, vem constantemente utilizando modelos macroeconômicos com diferentes abordagens para metrificar o efeito da política econômica.

##### Modelos do Banco Central Brasileiro (BCB)

1. Modelo Agregado de Pequeno Porte ou Semi-Estruturais de Pequena Escala
2. Modelos Vetoriais Autorregressivos (VAR)
3. Indicadores de inflação antecedentes e de núcleo
6. Modelo semiestrutural médio (PAGODE)
7. Modelo Microfundado de médio porte (SAMBA)

#### 1) Modelo Agregado de Pequeno Porte

Suposições do modelo:
- A inflação depende da taxa de juros real
- A taxa de juros básica nominal é o instrumento da política monetária
- As expectativas dos agentes podem ser backward-looking (informações passadas) ou forward-looking (expectativas futuras)
- Existem mecanismos de transmissão nas decisões de política monetária e eles têm atrasos de transmissão

> O novo consenso ou novo keynesianismo admite subequilíbrios de curto prazo, derivados de falhas de mercado, ou seja, o hiato do produto pode ser diferente de zero no curto prazo. Portanto, os modelo agregado de Pequeno Porte do BC, busca capturar os mecanismos de transmissão das decisões de política monetária, bem como os atrasos envolvidos, ele é descrito em Bogdanski et al. (2000) e é composto por três equaçõese:

- Curva IS (Demanda)
- Curva Phillips (Oferta)
- Paridade da Taxa de Juros (Contato com o setor externo)
- Regra de Taylor (Decisões de Política Monetária)

> Paridade de Taxa de Juros ou Condição de Paridade de Taxa de Juros Descoberta é um conceito que descreve a relação entre as taxas de juros de dois países e as taxas de câmbio esperadas entre suas moedas. Essa condição é importante para entender como as taxas de juros e as expectativas de taxa de câmbio influenciam os fluxos de capital entre os países.

#### Matematicamente:
Curva IS -> $ht = \beta0 - \beta1(it - Etπt+1 - r*) + β2Θt−1 + β3Ψt−1 + εt$

- ht = Hiato do produto (diferença entre o PIB efetivo e o PIB
 potencial)
- it = Taxa de juros nominal
- Etπt+1 = Expectativa em t para a inflação em t+1
- r∗ = Taxa de juros neutra
- Θt−1 = Taxa de câmbio real
- Ψt−1 = Necessidades de financiamento do setor público
- εt = Choque de demanda

Curva Phillips -> $πt = α0 + α1πt−1 + α2Etπt+1 + α3ht−1 + α4∆εt + εt$

- πt = Inflação
- πt-1 = Inflação defasada
- Etπt+1 = Expectativa em t para a inflação em t+1
- ht-1 = Hiato do produto defasado
- ∆εt = Primeira diferença da taxa de câmbio nominal
- εt = Choque de oferta

Paridade da taxa de juros -> $∆εt = φ0 φ1(it − it*) + φ2xt + εt$

- (it − it*) = Diferencial de juros
- xt = Prêmio de risco
- εt = Choque externo

Regra de Taylor -> $it = ω0 + ω1it−1 + ω2(Etπt+1 − π∗) + ω3ht + ω4∆εt + εt$

- it = Taxa de juros nominal defasada
- Etπt+1 = Expectativa em t para a inflação em t+1
- π∗ = Meta de inflação
- ht = Hiato do produto
- ∆εt = Primeira diferença da taxa de câmbio nominal
- εt = Ruído branco

> O modelo é composto por um sistema de 3 equações, sendo que a Regra de Taylor pode ser considerada, arbitrariamente, como uma identidade. Dessa forma, o modelo é caracterizado como de equações simultâneas, dado que, por exemplo, o hiato do produto é definido pela Curva IS e é uma variável explicativa na Curva de Phillips, que por sua vez explica a inflação, sendo esta uma variável da Regra de Taylor. Sendo assim, não se pode obter a taxa de juros pela Regra de Taylor sem que a inflação pela Curva de Phillips tenha sido estimada, e não se pode estimar a inflação sem que o hiato tenha sido estimado pela Curva IS. Ou seja, dizemos que as variáveis são determinadas "simultaneamente" pelo modelo. A solução para esse tipo de modelo é, geralmente, o uso de um método (algoritmo iterativo) como o de Gauss–Seidel, variações dele ou semelhantes. Em resumo, o método segue estes procedimentos:

1) Suponha um conjunto de valores para as variáveis endógenas;
2) Usando este conjunto de valores para as variáveis do lado direito, resolva todas as equações para as variáveis do lado esquerdo;
3) O passo 2 produz um novo conjunto de valores das variáveis endógenas. Substitua o conjunto inicial por este novo conjunto e resolva as variáveis do lado esquerdo novamente;
4) Continue substituindo o conjunto anterior de valores pelo novo conjunto até que as diferenças entre o novo conjunto e o conjunto anterior estejam dentro do grau de acurácia definido. Quando a acurácia necessária é alcançada, a "convergência" é alcançada e o modelo é resolvido. Os valores do lado direito são consistentes com os valores calculados do lado esquerdo.

> De maneira prática, o modelo pode ser estimado por métodos econométricos como: Mínimos Quadrados de Dois Estágios (2SLS) usando variáveis instrumentas e Método dos Momentos Generalizado (GMM). Também é possível o uso de técnicas bayesianas, como demonstrado por Herbst e Schorfheide (2015).

Dado este modelo básico, suponha que o Banco Central aumente a taxa básica de juros. Qual o efeito dessa redução sobre a economia?

Um aumento da taxa de juros nominal implica em taxas reais de juros mais elevadas, que por sua vez, pode levar à diminuição de investimentos pelas empresas e à diminuição de consumo por parte das famílias – o que, por sua vez, tende a reduzir a demanda por bens e serviços da economia, contribuindo para a redução da inflação. Em resumo, neste caso a autoridade monetária está buscando conter o aquecimento da economia pelo lado da demanda agrega, ou seja, tentando atenuar um hiato do produto positivo. Isso é feito pelos chamados canais de transmissão da política monetária, nesse caso o canal da Curva IS.

Outro canal importante de transmissão da política monetária é o da taxa de câmbio. Quando a taxa de juros sobe, a moeda doméstica tende a se valorizar, barateando bens comercializáveis internacionalmente. A taxa de câmbio afeta a inflação por meio da diminuição dos preços produtos importados, desincentivando a exportação e estimulando a importação, dessa forma reduzindo a pressão sobre o nível de preços. Note que no modelo exposto este contato com o exterior não está incluso.

Há também, dentre outros, o canal do crédito: ao aumentar a taxa de juros, o BC estimula que as taxas cobradas por empréstimos bancários também subam, diminuindo o volume de empréstimos a pessoas e empresas, desestimulando o consumo e o investimento.

O BCB estima que o efeito de mudanças na Selic sobre a inflação demora, em média, de 6 a 9 meses se concretizar.


### Referências bibliográficas:
- W.H. Greene. Econometric Analysis. Pearson Education, 2003.
- C. A. Sims. Macroeconometrics and reality. Econometrica.
- P. M. Geraats. Central bank transparency. Economic Journal, 112
 (39), 2002.
- Herbst, E. P., & Schorfheide, F. (2015). Bayesian estimation of DSGE models. In Bayesian Estimation of DSGE Models. Princeton University Press.
- J. Hermann. Objeto, metodologia e conceitos básicos da análise macroeconômica: notas de aula. mimeo, 2004
- E. J. A. Lima, F. Araujo, and J. R. Costa e Silva. Previsáo e Modelos Macroeconômicos no Banco Central do Brasil. Dez anos de metas para inflação no Brasil, 2010.
- J. M. Wooldridge. Introductory Econometrics: A Modern Approach. Editora Cengage, 2013.
- J. Bogdanski, A. A. Tombini, and S. R. Werlang. Implementing Inflation Targeting in Brazil. BCB Working Paper 01, 2000.
