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

- Teoria Econômica & Econometria
> Por meio da Econometria é possível avaliar empiricamente a teoria econômica e explicar fatos passados, testar hipóteses, prever resultados de políticas ou eventos futuros e estimar relações entre variáveis econômicas. Isso é viável porque, em geral, há relações de equilíbrio de longo prazo entre variáveis econômicas.

Exemplos de campos da econometria:

Econometria básica (regressão linear múltipla, …)
Econometria de séries temporais (AR, MA, ARMA, ARIMA, ARCH, GARCH, VAR, VEC, …)
Econometria não-paramétrica (regressão não-paramétrica, ….)
Microeconometria (dados em painel, …)
- Macroeconometria (DSGE, DSGE-VAR, VAR, VEC, …)

2. Estrutura dos dados econômicos

> Os dados econômicos apresentam-se em uma variedade de tipos. Embora alguns métodos econométricos possam ser aplicados com pouca ou nenhuma modificação para muitos tipos de informações, as características especiais de alguns dados devem ser consideradas ou deveriam ser exploradas. Descreveremos a seguir as estruturas de dados mais importantes encontradas nos trabalhos aplicados.

Corte Transversal: Um conjunto de dados de corte transversal consiste em uma amostra de indivíduos, consumidores, empresas, cidades, estados, países ou uma variedade de outras unidades, tomada em um determinado ponto no tempo, sendo assim não podemos considerar que eles foram obtidos por uma amostra aleatória, os dados das unidades não precisam corresponder ao mesmo período e a ordenação dos dados não importa para a análise econométrica.
Série Temporal: Um conjunto de séries temporais consiste em observações sobre uma variável ou muitas variáveis ao longo do tempo. Exemplos de dados de séries temporais incluem preços de ações, oferta de moeda, índice de preços ao consumidor, produto interno bruto, taxas anuais de homicídios e números de automóveis vendidos. Sendo assim, podemos considerar que eventos passados podem influenciar eventos futuros e a ordenação cronológica das observações transmite informações importantes.
Dados em Painel: Um conjunto de dados em painel consiste em uma série temporal para cada registro de corte transversal. Como exemplo, suponha que tenhamos o histórico de salário, educação e emprego para um conjunto de indivíduos ao longo de um período de dez anos. Sendo assim, as mesmas unidades de corte transversal são acompanhadas ao longo de um determinado período e a ordenação no corte transversal de um conjunto de dados em painel não é importante.
3. Estatística

> A estatística é definda como a ciência que objetiva coletar, organizar, analisar e interpretar dados. Ela é dividida em 3 partes:

Descritiva é aquela relacionada a descrição dos dados, representada pelas medidas de: centralidade (Média, moda e mediana), posição (Amplitude e Quartis), dispersão (Variância e Desvio Padrão).
Probabilistica é aquela relacionada a conceitos de probabilidades (espaço amostral, eventos) e distribuições de probabilidade discretas e contínuas (Binomial, Poisson, Exponencial e Normal).
Inferencial é aquela relacionada a estimação de parâmetros, intervalo de confiança e testes de hipóteses.
> Outro ponto importante é são as chamadas Técnicas de Amostragem, que são sub-divididas em 4 grupos:

Aleatória Simples: Seleção executada por meio de sorteio, sem nenhum filtro.
Estratificada: Divisão da população em grupos e seleção aleatória de uma amostra de cada grupo. (Ex: divisão por região, classe social, religião…).
Conglomerado (Agrupamento): Divisão da população em grupos com características similares, porém heterogêneas, e seleção aleatória de alguns grupos para analisar todos os elementos destes grupos. (Ex.: Divisão da população de escolas estaduais por região, enfermeiros de uma rede de hospitais… ).
Sistemática: Membros da população são ordenados numericamente e são selecionados aleatoriamente, obedecendo uma sequência numérica. (Ex.: criação de números para cada amostra e seleção obedecendo uma ordem numérica).
3) Testes de hipóteses

> São testes de afirmações sobre um parâmetro. Processo que utiliza estatísticas amostrais para testar uma hipótese (afirmação original) e aceitá-la ou rejeitá-la.

Existem duas hipóteses:

- Hipótese nula (H0)

- Hipótese alternativa (H1):

Tipos de erro

- Erro tipo I: hipótese nula rejeitada quando ela for verdadeira

Erro tipo II: aceita a hipótese nula (não rejeita) sendo ela falsa.
#### Intervalo de confiança

- Intervalo de confiança: Probabilidade de que o parâmetro populacional estimado, esteja no intervalo selecionado.

- Nível de significância: Probabilidade máxima permitida para cometer o erro tipo I.

#### Métricas de Desempenho

Erro absoluto médio (MAE)

![Captura de tela 2023–12–23 220021](https://github.com/HenrySchall/R/assets/96027335/f5bcb70b-8869-46b5-819c-11266879e2b1)

- Oi = valores observados

- Pi = valores previstos

Raiz do erro quadrático médio (RMSE)

#### Outliers

São dados discrepantes, isto é, são dados muito diferentes dos demais dados pertencentes à variável em análise. A relevância deles deve ser analisada para definir se continuarão no dataset ou se devem ser tratados (corrigidos, excluídos ou substituídos), pois se não forem relevantes, podem interferir significativamente nos resultados das análises.
















 Mínimos Quadrados Ordinários (MQO): Este é o método mais comum de estimativa em regressão linear. O MQO busca minimizar a soma dos quadrados das diferenças entre os valores observados e os valores previstos pelo modelo.

Mínimos Quadrados Generalizados (MQG): Este método é uma extensão do MQO que é utilizado quando as suposições de homocedasticidade (variância constante dos erros) não são atendidas. O MQG leva em conta a estrutura de variância dos erros.

Regressão de Mínimos Quadrados Pesados: Utiliza pesos diferentes para as observações, o que pode ser útil em situações onde algumas observações são mais confiáveis do que outras

Máxima Verossimilha (MV)


















### Modelos Macroeconômicos 

> Os ciclos econômicos são flutuações recorrentes na atividade econômica agregada dqw nações ao longo do tempo. Um ciclo consiste em fases de expansão, recessão e recuperação, simultaneamente em muitas setores da atividades econômica, as quais se consolidam posteriormente em uma nova fase de expansã (lembrando que essa sequência de mudanças é recorrente, mas não periódica). Podemos pensar os ciclos econômicos de forma análoga às condições meteorológicas, alguns períodos de calor e outros de frio, a ideia central é que a atividade econômica se move de um topo para um fundo e depois do fundo para o topo, oscilando em torno de um equilíbrio desconhecido. No Brasil a CODACE/FGV períodicamente determina e data os ciclos econômicos, como um comitê independente, ele ssegue os modelos adotados em outros países, como pelo NBER nos Estados Unidos.

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


