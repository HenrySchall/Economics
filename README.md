# Macroeconometrics

![Gere uma imagem sobre macroeconometria 20-02-2025 at 06-30-35](https://github.com/user-attachments/assets/99ef8ada-2357-47c9-a2c3-0cf2e57d471a)

> A macroeconomia é um ramo da ciência econômica que estuda o comportamento de uma economia como um todo. Dessa forma, os macroeconomistas buscam entender os fenômenos econômicos formulando modelos agredados (representações simplificadas da realidade), eles são agregados, porque parte-se do pressuposto de que o todo é mais complexo do que a soma das partes, não sendo possível descrever uma economia por meio de modelos para todas as empresas e indivíduos. Sendo assim, sua preocupação está em analisar indicadores agregados como PIB, taxa de desemprego e índices de preços.

### Conceitos Iniciais

- Ceteris paribus -> "todo o mais é constante", ou seja, nada muda, exceto o fator ou fatores que estão sendo estudados
- Variável endógena ->  também chamada de dependente, é a variável cujos valores são determinados no modelo
- Variável exógena ->  também chamada de independente, é a variável cujos valores são determinados fora do modelo
- Preços flexíveis ->  Suposição de que os preços se ajustam para igualar oferta e demanda (longo prazo)
- Preços rígidos ->  Suposição de que no curto prazo, muitos preços são rígidos, ou seja, se ajustam lentamente em resposta a mudanças na oferta ou na demanda
- Fluxo -> Magnitude econômica de um intervalo de tempo. EX: PIB (taxa mensal)
- Estoque -> Magnitude medida de um determinado ponto específico no tempo. EX: dívida externa do país

> Quando estamos trabalhando com valores macroeconômicos é normal que eles sofram variações ao longo do tempo. Sendo assim, para termos uma visão realística dos dados, sempre transformamos valores nominais para valores deflacionados (ou reais), ou seja, contabilizando o efeito da variações dos indicadores economicos, geralmente o efeito inflacionário do período. Então para exemplificar, vamos pegar uma série do salário mínimo (IPEADATA) é um índice de preços (Índice Nacional de Preços ao Consumidor Amplo - IPCA), que será nossa variável para deflacionar o salário mínimo, aplicando à fórmula:

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

1) O PIB é a soma de todos os bens e serviços finais produzidos por um país, estado ou cidade, geralmente em um ano. Todos os países calculam o seu PIB nas suas respectivas moedas. Em resumo, o PIB é um indicador que ajuda a compreender a economia como um todo, mas não expressa importantes fatores, como distribuição de renda, qualidade de vida, educação e saúde. O PIB pode ser expresso por três óticas:

- Oferta (produto): PIB é igual ao valor bruto da produção, a preços básicos, menos o consumo intermediário, a preços de consumidor, mais os impostos, líquidos de subsídios, sobre produtos;
- 
- Demanda (despesa): PIB é igual a despesa de consumo das famílias, mais o consumo do governo, mais o consumo das instituições sem fins de lucro a serviço das famílias (consumo final), mais a formação bruta de capital fixo, mais a variação de estoques, mais as exportações de bens e serviços, menos as importações de bens e serviços;
- 
- Renda: PIB é igual à remuneração dos empregados, mais o total dos impostos, líquidos de subsídios, sobre a produção e a importação, mais o rendimento misto bruto, mais o excedente operacional bruto.

PIB nominal X PIB real

#### Deflator do PIB
O deflator do PIB mede o nível atual de preços relativo ao nível de preços do ano-base;
É um índice de preços com todos os bens e serviços produzidos na economia;
Serve para obter a parte do aumento do PIB nominal atribuída a um aumento de preços e não por uma aumento nas quantidades produzidas;
Reflete apenas os preços dos bens e serviços.
Seu cálculo é bastante simples:     

$Deflator do PIB = \frac{PIB Nominal}{PIB Real}× 100$

#### Taxa de Crescimento do PIB

![Captura de tela 2025-02-24 050105](https://github.com/user-attachments/assets/115ad00a-c0cf-42c4-9bd5-83b514fbfd7c)





























































