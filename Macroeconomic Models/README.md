# Modelos Macroeconômicos 

> Como vimos os os macroeconomistas buscam entender os fenômenos econômicos formulando modelos agredados, esses são utilizados para analisar as interações entre diferentes variáveis macroeconômicas agregadas, como o Produto Interno Bruto (PIB), inflação, desemprego, taxas de juros, consumo, entre outros. Eles ajudam economistas e formuladores de políticas econômicas a entender como as políticas e os choques externos podem afetar a economia.

#### Tipos de Modelos Macroeconômicos

1) Modelos Clássicos: Baseiam-se na ideia de que os mercados são eficientes e que a economia tende ao pleno emprego. Acredita-se que as forças de oferta e demanda se ajustam rapidamente, levando a um equilíbrio de longo prazo.

2) Modelos Keynesianos: Focados na importância da demanda agregada para determinar o nível de produção e emprego. Esses modelos sugerem que a economia pode ficar em equilíbrio em um nível de produção abaixo do pleno emprego, e que a intervenção do governo pode ser necessária para estimular a demanda.

3) Modelos de Equilíbrio Geral: Consideram a interação entre diferentes mercados e setores da economia. Esses modelos analisam como choques em um setor podem afetar outros setores e a economia como um todo. Um exemplo é o modelo de equilíbrio geral dinâmico estocástico (DSGE).

4) Modelos de Crescimento Econômico: Focam em explicar as causas do crescimento econômico ao longo do tempo. Exemplos incluem o modelo de Solow, que considera fatores como capital, trabalho e progresso tecnológico, e modelos endógenos que incorporam a inovação e o capital humano como motores do crescimento.

5) Modelos de Ciclos Econômicos: Analisam as flutuações econômicas ao longo do tempo, como recessões e expansões. Esses modelos tentam explicar as causas e a duração dos ciclos econômicos, considerando fatores como choques de oferta e demanda.

6) Modelos de Expectativas Racionais: Consideram que os agentes econômicos formam suas expectativas sobre o futuro de maneira racional, utilizando toda a informação disponível. Esses modelos são frequentemente usados em análises de política monetária.

## Filtros Econômicos

<p align="center">
  <img src="https://github.com/user-attachments/assets/529abd70-77aa-4fe5-b9c7-7a1dc9bdf3e9"/>
</p>

- Yt = Produto Interno Bruto (PIB)
- Yp = É o chamado produto potencial (não observável), representa a tendência de longo prazo do PIB, ou seja, reflete condições estruturais da economia como a população em idade ativa, o estoque de capital, qualidade de educação e qualidade das instituições.
- Ht = É o chamado hiato do produto, representa o componente cíclico, ou seja, reflete condições conjunturais da economia, como choques de demanda/oferta, incentivos de política econômica, condições climáticas, choques externos e incertezas políticas.

> No curto prazo o PIB pode crescer mais ou menos do que o PIB potencial, sendo a diferença entre Yt e Yp dada pelo hiato do produto. A dinâmica desse ciclo é determinada em grande medida pela rigidez de preços/salários da economia no curto prazo, se hipoteticamente falando os preços fossem totalmente flexíveis, o ajuste seria imediato, implicando um hiato do produto igual a zero (equilíbrio constante). Na literatura existem três métodos para estimar o produto potencial e o hiato do produto:

- Filtros de Kalman (1960)
- Filtros de Hodrick e Prescott (1997)
- Filtros de Hamilton (2017)

É importante destacar que nenhum método é perfeito, mas alguns são úteis para o próposito em questão ("All models are wrong, but some are useful" - George Box). Pontua-se que, dentre as possibilidades, os filtros multivariados têm se destacado como uma das metodologias mais utilizadas pelo Banco Central Brasileiro (BCB).

#### Filtros de Kalman
> O filtro de Kalman é um algoritmo recursivo que permite usar uma série temporal observável para estimar uma série não observável, chamada de variável de "estado", sendo construído na forma de "estado-espaço". Em termos simples, o "estado" da variável no momento t é relacionado com o "estado" da variável no momento t-1, caracterizando uma relação dinâmica. Há dois grupos de equações nas que fornecem "palpites" sobre o verdadeiro valor da variável de interesse:

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

> Aplicação de uma especificação de um modelo de regressão linear (MQO) para extrair componentes de tendência e ciclo de uma série temporal, proposto por Hamilton (2017) como uma alternativa ao filtro HP. Estima-se um modelo MQO para uma série temporal Yt deslocada por h períodos a frente e regredida contra x séries defasadas da própria série Yt, ou seja, uma específicação de modelo AR(X) modificada. Com exemplificação, vamos considerar h = 8 e x = 4, matemáticamente:

<p align="center">
  <img src="https://github.com/user-attachments/assets/b86c9dc6-c04b-4c74-8ef5-6f8b2f42f2f6"/>
</p>

#### Filtros de Hamilton (2017)


Há também, dentre outros, o canal do crédito: ao aumentar a taxa de juros, o BC estimula que as taxas cobradas por empréstimos bancários também subam, diminuindo o volume de empréstimos a pessoas e empresas, desestimulando o consumo e o investimento.

O BCB estima que o efeito de mudanças na Selic sobre a inflação demora, em média, de 6 a 9 meses se concretizar.


## Ciclos Econômicos

> Os ciclos econômicos são flutuações recorrentes na atividade econômica agregada das nações ao longo do tempo. Um ciclo consiste em fases de expansão, recessão e recuperação, simultaneamente em muitas setores da atividades econômica, as quais se consolidam posteriormente em uma nova fase de expansão (lembrando que essa sequência de mudanças é recorrente, mas não periódica). A ideia central é que a atividade econômica se move de um topo para um fundo e depois do fundo para o topo, oscilando em torno de um equilíbrio desconhecido, o ciclo econômico desempenha um papel importante para as decisões de política econômica e de empresas, sendo um importante indicador para a política monetária, possibilitando a atuação do Banco Central para estabilizar as flutuações da economia. No Brasil a CODACE/FGV períodicamente determina e data os ciclos econômicos, como um comitê independente, ele ssegue os modelos adotados em outros países, como pelo NBER nos Estados Unidos.

![userlmn_11b28909693848f194a27ba565fd7274](https://github.com/user-attachments/assets/2206d68f-7344-4548-9d4a-b3a96a85e6ee)

- Pico (A): é o ponto de virada quando a expansão transita para a fase de recessão;
- Vale (C): é o ponto de virada quando a recessão transita para a fase de expansão/recuperação;
- Duração (AB): é o número de trimestres entre o pico e o vale;
- Amplitude (BC): é a distância entre o pico e o vale ou altura do triângulo.

### Modelo de Harding e Pagan

> Há diveros trabalhos que investigam que buscam modelar a datação de ciclos econômicos, todavia o mais utilizado é o Modelo de Harding e Pagan (2002), que segue a definição de Burns e Mitchell (1946). Partindo de uma série Yt em frequência trimestral, representativa da atividade econômica (PIB) e usualmente transformada como Yt = ln (Yt). Sendo assim, a datação do ciclo econômico deve compreender as seguintes etapas:

1) Determinação de um conjunto potencial de pontos de virada, ou seja, os picos e vales em uma série Yt.
2) Um procedimento para garantir que os picos e os vales se alternem.
3) Um conjunto de regras que recombinam os pontos de virada estabelecidos após os passos 1) e 2) para satisfazer critérios pré-determinados relativos à duração e amplitude das fases e ciclos completos (regras de censura).

Conforme Harding e Pagan (2002), os pontos de virada da série acontecem quando:

<p align="center">
  <img src="https://github.com/user-attachments/assets/31b82548-adf1-4cae-80c9-9521f873ed97"/>

#### Fases de um Ciclo
- Recessão: Período compreendido entre um pico e um vale;
- Expansão: Período compreendido entre um vale e um pico;
- Ciclo completo: Duração das fases de recessão e expansão somadas.

> Todavia, é necessário definir algumas "regras de censura", que são restrições adicionais para eliminar/manter os pontos de virada identificados ajustados. Isso passa por definir uma duração mínima das fases de recessão/expansão entre picos/vales, o usual e recomendado pela literatura (inspirado no NBER), no caso de séries trimestrais, é definir k = 2 para encontrar esses pontos máximos e mínimos locais e t = 5 para se ter um ciclo completo, ou seja:

- Recessão/Expansão: dura, no mínimo, 2 trimestres
- Ciclo completo: dura, no mínimo, 5 trimestres

## Modelo de Sollow
> Os economistas Roy Harrod e Evsey Domar desenvolveram um modelo de crescimento que enfatizava a necessidade de um equilíbrio exato entre a taxa de poupança e o crescimento da economia, para evitar crises econômmicas. No entanto, esse modelo não explicava de forma clara o porque da estabilidade do crescimento econômico no longo prazo, já observada empiricamente. Nesse contexto, Robert Solow em seu artigo de 1956 "A Contribution to the Theory of Economic Growth" - Nobel 1987, apresentou um modelo alternativo que introduzia o progresso tecnológico exógeno e o acúmulo de capital como fatores centrais do crescimento econômico, buscando entender o porquê alguns países são tão ricos e outros tão pobres.

> Antes de apresentar o modelo proposto por Sollow, é preciso conceituar os Fatos Estilizados, esses são definidos como padrões gerais ou regularidades empíricas observadas na economia ao longo do tempo, não havendo uma comprovação matmática para a ocorrencia deles.

- Fato 1: há grande variação entre as rendas per capita das economias. Os países mais pobres têm rendas per capita que são inferiores a 5% da renda per capita dos países mais ricos.
- Fato 2: as taxas de crescimento econômico variam substancialmente entre um país e outro.
- Fato 3: as taxas de crescimento não são necessariamente constantes ao longo do tempo.
- Fato 4: a posição relativa de um país na distribuição mundial da renda per capita nao é imutável. Os países podem passar de "pobres" a "ricos" e vice-versa.
  
Hipóteses simplificadoras:
- O mundo é formado por países que produzem e consomem um único bem homogêneo (produto, unidades do PIB);
- Não há comércio internacional no modelo (economia fechada);
- A tecnologia é exógena (i.e. P&D não afeta a tecnologia existente);
- As pessoas poupam uma fração constante da sua renda e investimento = poupança;
- As pessoas gastam uma fração constante de tempo acumulando qualificações;
- Toda a população da economia faz parte da força de trabalho (todas as pessoas trabalham).

> O modelo é construído em torno de duas equações. A primeira delas descreve como insumos de capital (escavadeiras, semicondutores, etc.) e de trabalho (operários, engenheiros, etc.) se combinam para gerar produto.

<p align="center">
  <img src="https://github.com/user-attachments/assets/f86e59e3-e7e5-4a39-bdaf-c862331fd3a4"/>

onde:
- Y = produto;
- K = insumos de capital;
- L = insumos de trabalho;
- α = qualquer número entre 0 e 1
- Função de retornos constantes à escala

O interesse aqui é na evolução do produto por trabalhador ou per capita. Sendo assim, podemos reescrever a função de produção como:

<p align="center">
  <img src="https://github.com/user-attachments/assets/e930186e-31b4-4b04-8716-b6f088289bbd"/>

Graficamente: 

<p align="center">
  <img src="https://github.com/user-attachments/assets/9dda0c9b-bb9a-42f3-b7c0-3de91cbfb732"/>

- Com mais capital por trabalhador, as empresas dessa economia geram mais produto por trabalhador
- Com α = 0,25, há retornos decrescentes ao capital por trabalhador (cada unidade adicional de capital dada ao trabalhador faz o produto crescer menos e menos).

  
