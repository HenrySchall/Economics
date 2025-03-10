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





Há também, dentre outros, o canal do crédito: ao aumentar a taxa de juros, o BC estimula que as taxas cobradas por empréstimos bancários também subam, diminuindo o volume de empréstimos a pessoas e empresas, desestimulando o consumo e o investimento.

O BCB estima que o efeito de mudanças na Selic sobre a inflação demora, em média, de 6 a 9 meses se concretizar.
