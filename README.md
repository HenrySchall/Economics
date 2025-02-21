# Macroeconometrics

![Gere uma imagem sobre macroeconometria 20-02-2025 at 06-30-35](https://github.com/user-attachments/assets/99ef8ada-2357-47c9-a2c3-0cf2e57d471a)

> Os macroeconomistas procuram entender fenômenos econômicos específicos por meio da formulação de modelos (representações
simplificadas da realidade). Esse modelos se baseiam na formulação de hipóteses sobre o funcionamento da economia, ou seja,
o comportamento dos agentes econômicos dentro do mercado.

### Modelo Macroeconômicos do Banco Central Brasileiro 

1. Modelos semiestruturais pequeno porte
2. Modelos de Vetores Autorregressivos (VAR)
3. Indicadores antecedentes e núcleos de inflação
6. Modelo semiestrutural médio (PAGODE)
7. Modelo microfundamentado de médio porte (SAMBA)

### Modelo Semiestruturais de Pequeno Porte

> Em 1990, a teoria macroeconômica passou a se basear na síntese neoclássica ou novo consenso macroeconômico. As
implicações disso, foram o desenvolvimento de pequenos modelos estruturais, que possibilitaram estimar a defasagens no efeito de mudanças no instrumento da política monetária sobre os preços.

Hipóteses do Modelo: 
- Inflação depende da taxa de juros real
- Taxa de juros básica nominal é o instrumento de política monetária
- As expectativas dos agentes podem ser do tipo backward-looking (informações passadas) ou forward-looking (expectativas futuras)
- Existem mecanismos de transmissão nas decisões de política monetária e eles possuem defasagens de transmissão 

> O novo consenso ou novo-keynesianismo, admite subequilíbrios de curto prazo, derivados das falhas de mercado, ou seja, o hiato do produto pode ser diferente de zero no curto prazo. Sendo assim os modelos de pequeno porte do BC, buscam a captar os mecanismos de transmissão das decisões de política monetária, bem como as defasagens envolvidas, sendo compostos por:

- Curva IS (Demanda)
- Curva de Phillips (Oferta)
- Interest Rate Parity (Contato com o setor externo)
- Regra de Taylor (Decisões de política monetária)

> Interest Rate Parity ou Condição de paridade descoberta da taxa de juros é um conceito que descreve a relação entre as taxas de juros de dois países e as taxas de câmbio esperadas entre suas moedas. Essa condição é importante para entender como as taxas de juros e as expectativas de câmbio influenciam os fluxos de capital entre os países.

#### Matematicamente: 
Curva IS -> $Ht = \beta0 - \beta1(it - Etπt+1 - r*) + β2Θt−1 + β3Ψt−1 + εt$

- Ht = Hiato do produto
- it = Taxa de juros nominal
- Etπt+1 = Expectativa em t para a inflação em t + 1
- r∗ = Taxa de juros neutra
- Θt−1 = Taxa de câmbio real
- Ψt−1 = Necessidades de financiamento do setor público
- εt = Choque de demanda

Curva de Phillips -> $πt = α0 + α1πt−1 + α2Etπt+1 + α3ht−1 + α4∆εt + εt$

- πt = Inflação
- ∆εt = Primeira diferença da taxa de câmbio nominal
- εt = Choque de oferta

Interest Rate Parity -> $∆εt = φ0 φ1(it − it*) + φ2xt + εt$

- (it − it*) = diferencial de juros
- xt = prêmio de risco
- εt = choque externo

Regra de Taylor -> $it = ω0 + ω1it−1 + ω2(Etπt+1 − π∗) + ω3ht + ω4∆εt + εt$

- π∗ = Meta de inflação
- εt = ruído branco
