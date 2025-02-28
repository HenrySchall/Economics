# Modelos Macroeconômicos 

> Os modelos macroeconômicos são representações matemáticas e teóricas que buscam descrever e explicar o comportamento da economia como um todo. Esses modelos são utilizados para analisar as interações entre diferentes variáveis macroeconômicas, como o Produto Interno Bruto (PIB), inflação, desemprego, taxas de juros, consumo, investimento e comércio exterior. Eles ajudam economistas e formuladores de políticas a entender como as políticas econômicas e choques externos podem afetar a economia.

#### Tipos de Modelos Macroeconômicos

1) Modelos Clássicos: Baseiam-se na ideia de que os mercados são eficientes e que a economia tende ao pleno emprego. Acredita-se que as forças de oferta e demanda se ajustam rapidamente, levando a um equilíbrio de longo prazo.

2) Modelos Keynesianos: Focados na importância da demanda agregada para determinar o nível de produção e emprego. Esses modelos sugerem que a economia pode ficar em equilíbrio em um nível de produção abaixo do pleno emprego, e que a intervenção do governo pode ser necessária para estimular a demanda.

3) Modelos de Equilíbrio Geral: Consideram a interação entre diferentes mercados e setores da economia. Esses modelos analisam como choques em um setor podem afetar outros setores e a economia como um todo. Um exemplo é o modelo de equilíbrio geral dinâmico estocástico (DSGE).

4) Modelos de Crescimento Econômico: Focam em explicar as causas do crescimento econômico ao longo do tempo. Exemplos incluem o modelo de Solow, que considera fatores como capital, trabalho e progresso tecnológico, e modelos endógenos que incorporam a inovação e o capital humano como motores do crescimento.

5) Modelos de Ciclos Econômicos: Analisam as flutuações econômicas ao longo do tempo, como recessões e expansões. Esses modelos tentam explicar as causas e a duração dos ciclos econômicos, considerando fatores como choques de oferta e demanda.

6) Modelos de Expectativas Racionais: Consideram que os agentes econômicos formam suas expectativas sobre o futuro de maneira racional, utilizando toda a informação disponível. Esses modelos são frequentemente usados em análises de política monetária.

####  Decomposição do PIB

$Yt = Yp + Ht$

- Yt = Produto Interno Bruto (PIB)
- Yp = É o chamado produto potencial (não observável), representa a tendência de longo prazo do PIB, ou seja, reflete condições estruturais da economia como a população em idade ativa, o estoque de capital, qualidade de educação e qualidade das instituições.
- Ht = É o chamado hiato do produto, representa o componente cíclico, ou seja, reflete condições conjunturais da economia, como choques de demanda/oferta, incentivos de política econômica, condições climáticas, choques externos e incertezas políticas.

> Em outras palavras, no curto prazo o PIB pode crescer mais ou menos do que o PIB potencial, sendo a diferença entre Yt e Yp dada pelo hiato do produto ou ciclo econômico. A dinâmica desse ciclo é determinada em grande medida pela rigidez de preços/salários da economia no curto prazo, se hipoteticamente falando os preços fossem totalmente flexíveis, o ajuste seria imediato, implicando um hiato do produto igual a zero (equilíbrio constante). Na literatura existem três métodos para estimar o produto potencial e o hiato do produto:

- Filtros de Kalman (1960)
- Filtros de Hodrick e Prescott (1997)
- Filtros de Hamilton (2017)
-  Funcao de producao Orair e Baciotti (2018)

É importante destacar que nenhum método é perfeito, mas alguns são úteis para o próposito em questão ("All models are wrong, but some are useful" - George Box). Pontua-se que, dentre as possibilidades, os filtros multivariados têm se destacado como uma das metodologias mais utilizadas pelo BCB.

#### Filtros de Kalman
O filtro de Kalman é um algoritmo recursivo que permite usar uma série temporal observável para estimar uma série não observável, chamada de variável de "estado", sendo construído na forma de "estado-espaço". Em termos simples, o "estado" da variável no momento t é relacionado com o "estado" da variável no momento t-1, caracterizando uma relação dinâmica. Há dois grupos de equações nas que fornecem "palpites" sobre o verdadeiro valor da variável de interesse:

Equação de estado: descreve como o sistema evolui de um ponto no tempo para o próximo (primeiro palpite);
Equação de medida (observação): combina ao estado atual uma nova informação (observação) com alguma incerteza (ruído), para finalidade de refinar a estimativa (segundo palpite).

<p align="center">
  <img src="https://github.com/user-attachments/assets/79b1653f-a72b-43b4-8a4f-bd676e1a7b6d"/>
</p>

#### Filtros de Hodrick e Prescott (HP)

> O filtro HP separa uma série temporal Yt em dois componentes: tendência Gt (também chamado de crescimento) e ciclo Ct, ou seja, Yt = Gt + Ct, para t = 1,2,..., n. Dessa forma, Hodrick e Prescott (1997) propõem uma forma de isolar Ct de Yt através da minimização de Gt, matematicamente falando:

<p align="center">
  <img src="https://github.com/user-attachments/assets/7eb2d45b-82d4-47dd-8f2f-8171908b4acf"/>
</p>

> O primeiro termo desse problema de minimização é a soma dos desvios quadrados, que penaliza o componente cíclico. O segundo termo é um múltiplo de λ da soma dos quadrados das segundas diferenças do componente de tendência, que penaliza variações da taxa de crescimento do componente de tendência. O parâmetro λ é um número positivo, quanto maior for o valor de λ mais suave será a série de tendência. Na literatura sugere-se λ = 1600 como um valor para séries temporais de frequência trimestral.

#### Filtros de Hamilton (2017)

> Aplicação de uma especificação de um modelo de regressão linear (MQO) para extrair componentes de tendência e ciclo de uma série temporal, proposto por Hamilton (2017) como uma alternativa ao filtro HP. Estima-se um modelo MQO para uma série temporal Yt deslocada por h períodos a frente e regredida contra x séries  defasadas da própria série Yt, ou seja, uma específicação de modelo AR(X) modificada. Com h = 8 e x = 4, sendo representado como:

<p align="center">
  <img src="https://github.com/user-attachments/assets/b86c9dc6-c04b-4c74-8ef5-6f8b2f42f2f6"/>
</p>

#### Filtros de Hamilton (2017)




### Modelos do Banco Central Brasileiro (BCB)

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
