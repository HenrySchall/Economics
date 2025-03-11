# Política Monetária

### Esquema de Tinbergen
> O problema básico de política econômica, na definição seminal de Tinbergen [1952], envolve alcançar uma meta com base em um
instrumento de política, dada a estrutura da economia. Especificadas metas e instrumentos, o problema pode ser descrito
como segue: alguma função de bem-estar social vai especificar o valor ótimo das variáveis visadas e o custo para a sociedade dos desvios nos valores. Caso estes ocorram, as autoridades vão precisar escolher os instrumentos e calibrá-los para que a economia volte ao valor ótimo Larrain and Sachs [2000]. Resumidamente é um problema de maximizacao/otimização condiconada, funcão objetioc omc alguma resqutricaõ 

Considere o caso simples onde temos 2 metas e 2 instrumentos, de
modo que


Formula

t = taxa de metas 
i - instrumento 


O problema básico de política passa a ser então que, dadas as metas
T1 e T2, e a estrutura econômica representada pelos parâmetros
a1, a2, b1 e b2, o policymaker deve escolher os valores dos
instrumentos I1 e I2. Para que isso seja possível, é preciso observar a
condição abaixo.

Proposição de Tinbergen -> Se em uma economia de estrutura linear, há N metas, elas poderão
ser atingidas se houver pelo menos N instrumentos políticos
independentes.

Exemplo 
Vamos considerar um exemplo, para ficar mais simples a exposição.
Tomemos uma economia onde há duas metas, Y∗, = Yp e π∗ = 0, onde Y é o PIB e π é a inflação anual. Há, por suposto, dois
instrumentos: um fiscal, representado por G e outro monetário,
representado por M. Essa economia, ademais, pode ser
representada por


Suponha agora que o ponto de partida é dado por Y = Y∗
e por π = 2%, isto é, a economia encontra-se no pleno emprego e a
inflação está em 2%. O objetivo do policymaker é então reduzir a
inflação em dois pontos percentuais, sem perda sobre o produto.
Para abordar esse problema, primeiro, vamos reescrever 2 em termos
de desvios da base, isto é

Formula

onde os parâmetros a1, a2, b1 e b2 medem o efeito quantitativo de
G e M sobre Y e π.


O resultado depende diretamente de a1/b1 ≠ a2/b2 de modo que o
determinante da matriz dos parâmetros A seja diferente de zero,
possibilitanto que a inversa de A exista. Ou, em outras palavras,
que os efeitos da política fiscal e monetária sejam linearmente
independentes sobre o PIB e a inflação Certamente, essa é uma premissa bastante forte. Para ilustrar,
vamos supor que a inflação seja determinada pela Curva de Phillips,
de modo que a política monetária e a fiscal atuem sobre o PIB e o
PIB afete a inflação. Algo como

Y = a1G + a2M
π = gY

A Curva de Phillips criou uma dependência linear entre os
instrumentos, impedindo que haja uma solução para o problema de
política. Em outras palavras, se a única forma pela qual a política
monetária e a política fiscal podem influenciar a inflação é através
do efeito sobre o PIB, então, visar tanto Y
∗ quanto π∗será impossível


Se não existe solução no sentido proposto por Tinbergen [1952], é
possível abordar o problema de uma forma diferente. Theil [1957]
propôs uma forma alternativa, baseada na ideia de que o objetivo
básico do policymaker não seja o de alcançar o valor exato da meta,
mas que os valores dos instrumentos sejam calibrados de modo a
minimizar a distância entre o valor observado da variável de
interesse e sua meta. Isto é,

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

# Política Conjuntural

