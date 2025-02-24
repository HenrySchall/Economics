# Macroeconometrics

![Gere uma imagem sobre macroeconometria 20-02-2025 at 06-30-35](https://github.com/user-attachments/assets/99ef8ada-2357-47c9-a2c3-0cf2e57d471a)


> A macroeconomia é um ramo da ciência econômica que estuda o comportamento de uma economia como um todo. Dessa forma, os macroeconomistas buscam entender os fenômenos econômicos formulando modelos agredados (representações simplificadas da realidade), eles são agregados, porque parte-se do pressuposto de que o todo é mais complexo do que a soma das partes, não sendo possível descrever uma economia por meio de modelos para todas as empresas e indivíduos. Sendo assim, sua preocupação está em analisar indicadores agregados como PIB, taxa de desemprego e índices de preços.







### The Brazilian Central Bank Models

1. Small-scale semi-structural models
2. Vector Autoregressive (VAR) Models
3. Leading and core inflation indicators
6. Medium semi-structural model (PAGODE)
7. Medium-sized Micro-Founded Model (SAMBA)

### Small-Scale Semi-Structural Models

> In 1990, macroeconomic theory began to be based on the neoclassical synthesis or new macroeconomic consensus. The implications of this were the development of small structural models, which made it possible to estimate the lags in the effect of changes in the monetary policy instrument on prices.

Model Assumptions: 
- Inflation depends on the real interest rate
- Nominal base interest rate is the instrument of monetary policy
- Agents' expectations can be backward-looking (past information) or forward-looking (future expectations)
- There are transmission mechanisms in monetary policy decisions and they have transmission lags

> The new consensus or new Keynesianism admits short-term subequilibria, derived from market failures, that is, the output gap may be non-zero in the short term. Therefore, the BC's small-scale models seek to capture the transmission mechanisms of monetary policy decisions, as well as the lags involved, and are composed of:

- IS Curve (Demand)
- Phillips Curve (Supply)
- Interest Rate Parity (Contact with the external sector)
- Taylor Rule (Monetary Policy Decisions)

> Interest Rate Parity or Uncovered Interest Rate Parity Condition is a concept that describes the relationship between the interest rates of two countries and the expected exchange rates between their currencies. This condition is important for understanding how interest rates and exchange rate expectations influence capital flows between countries.

#### Mathematically:
IS Curve -> $Ht = \beta0 - \beta1(it - Etπt+1 - r*) + β2Θt−1 + β3Ψt−1 + εt$

- Ht = Product gap
- it = Nominal interest rate
- Etπt+1 = Expectation at t for inflation at t + 1
- r∗ = Neutral interest rate
- Θt−1 = Real exchange rate
- Ψt−1 = Public sector financing needs
- εt = Demand shock

Phillips Curve -> $πt = α0 + α1πt−1 + α2Etπt+1 + α3ht−1 + α4∆εt + εt$

- πt = Inflation
- ∆εt = First difference of nominal exchange rate
- εt = Supply shock

Interest Rate Parity -> $∆εt = φ0 φ1(it − it*) + φ2xt + εt$

- (it − it*) = Interest differential
- xt = Risk premium
- εt = External shock

Taylor Rule -> $it = ω0 + ω1it−1 + ω2(Etπt+1 − π∗) + ω3ht + ω4∆εt + εt$

- π∗ = Inflation target
- εt = white noise

### Bibliographical References:
- W.H. Greene. Econometric Analysis. Pearson Education, 2003.
- C. A. Sims. Macroeconometrics and reality. Econometrica,
- E. J. A. Lima, F. Araujo, and J. R. Costa e Silva. Previsáo e Modelos Macroeconômicos no Banco Central do Brasil. Dez anos de metas para inflação no Brasil, 2010.
- J. M. Wooldridge. Introductory Econometrics: A Modern Approach. Editora Cengage, 2013
