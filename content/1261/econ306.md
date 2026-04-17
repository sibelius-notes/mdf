---
title: "ECON 306: Macroeconomics"
prof: "Jean Guillaume Forand"
subjects: "ECON"
---

## Sources and References

**Supplementary texts** — Mankiw, N.G., *Macroeconomics*, 10th ed. (Worth, 2019); Abel, Bernanke & Croushore, *Macroeconomics*, 9th ed. (Pearson, 2017); Blanchard, O., *Macroeconomics*, 8th ed. (Pearson, 2020).

**Online resources** — MIT OpenCourseWare 14.02 (Principles of Macroeconomics) and 14.452 (Advanced Macroeconomics); Federal Reserve Bank of St. Louis FRED database; Bank of Canada research notes.

---

# Chapter 1: Consumption and Savings — Partial Equilibrium

## 1.1 The Intertemporal Budget Constraint

Modern macroeconomics treats consumers as forward-looking agents who choose consumption paths over time to maximize lifetime welfare. The simplest setting is a two-period model. A consumer earns income \( y_1 \) in period 1 and \( y_2 \) in period 2, faces a real interest rate \( r \), and can borrow or save freely at that rate. The budget constraints for each period are:

\[
c_1 + s = y_1
\]

\[
c_2 = y_2 + (1+r)s
\]

where \( s \) is saving (positive) or borrowing (negative). Eliminating \( s \) yields the intertemporal budget constraint (IBC):

\[
c_1 + \frac{c_2}{1+r} = y_1 + \frac{y_2}{1+r} \equiv W
\]

The right-hand side \( W \) is the consumer's present-value wealth. The IBC says that the present value of consumption equals the present value of income — the consumer cannot leave unpaid debt at the end of period 2.

<div class="definition">
<strong>Present Value:</strong> A dollar received at date \( t \) is worth \( 1/(1+r)^t \) dollars today. Present-value wealth aggregates income across periods at the market interest rate, reflecting the opportunity cost of funds.
</div>

## 1.2 Preferences and Optimal Choice

Consumers are assumed to have preferences over consumption in the two periods represented by a utility function:

\[
U(c_1, c_2) = u(c_1) + \beta \, u(c_2)
\]

where \( u(\cdot) \) is a strictly concave instantaneous utility function (e.g., \( u(c) = \ln c \) or \( u(c) = c^{1-\sigma}/(1-\sigma) \)) and \( \beta \in (0,1) \) is the subjective discount factor. The household prefers smooth consumption over time (due to concavity) but also values present over future consumption (due to \( \beta < 1 \)).

The consumer's problem is:

\[
\max_{c_1, c_2} \; u(c_1) + \beta \, u(c_2) \quad \text{subject to} \quad c_1 + \frac{c_2}{1+r} = W
\]

The first-order condition — the Euler equation — equates the marginal utility of consuming today to the discounted marginal utility of consuming tomorrow:

\[
u'(c_1) = \beta(1+r) \, u'(c_2)
\]

<div class="theorem">
<strong>Euler Equation:</strong> The optimality condition \( u'(c_1) = \beta(1+r) \, u'(c_2) \) characterises the optimal intertemporal allocation of consumption. When \( \beta(1+r) = 1 \), the consumer chooses flat consumption: \( c_1 = c_2 \). A higher interest rate makes future consumption cheaper relative to present consumption, encouraging saving.
</div>

### 1.2.1 Specific Functional Form: Log Utility

With \( u(c) = \ln c \), the Euler equation becomes:

\[
\frac{1}{c_1} = \beta(1+r) \frac{1}{c_2} \implies c_2 = \beta(1+r) c_1
\]

Substituting into the IBC:

\[
c_1 + \frac{\beta(1+r)c_1}{1+r} = W \implies c_1(1 + \beta) = W \implies c_1 = \frac{W}{1+\beta}
\]

This shows that with log utility, the optimal share of wealth consumed in period 1 is \( 1/(1+\beta) \), independent of the interest rate — the income and substitution effects of an interest rate change exactly cancel on first-period consumption.

## 1.3 Effects of Interest Rate Changes

A change in the real interest rate affects consumption through two channels:

- **Substitution effect:** A higher \( r \) makes future consumption cheaper relative to present; consumers substitute toward the future (save more).
- **Income effect:** If the consumer is a net saver, a higher \( r \) raises wealth, increasing consumption in both periods. If a net borrower, it reduces wealth.

The net effect on first-period consumption is therefore ambiguous in general (it depends on whether the consumer is a borrower or saver), but the Euler equation always pins down the growth rate of consumption.

## 1.4 Consumption Growth and the Real Interest Rate

Rearranging the Euler equation with \( u(c) = c^{1-\sigma}/(1-\sigma) \):

\[
\left(\frac{c_2}{c_1}\right)^\sigma = \beta(1+r)
\]

Taking logarithms and using the approximation \( \ln(1+x) \approx x \):

\[
\sigma \cdot g_c \approx r - \rho
\]

where \( g_c = (c_2 - c_1)/c_1 \) is consumption growth and \( \rho = -\ln\beta > 0 \) is the rate of time preference. This is one of the central equations of macro: consumption grows faster when the real interest rate exceeds the rate of time preference, and the elasticity of substitution \( 1/\sigma \) governs how sensitive growth is to the interest rate.

<div class="remark">
<strong>Empirical Application:</strong> Hall (1978) showed that if financial markets are complete and consumers are optimizing, changes in consumption should follow a random walk — only surprise changes in the interest rate or income should affect consumption. Deviations from this benchmark motivate models with borrowing constraints, habits, and rule-of-thumb consumers.
</div>

## 1.5 Saving and the National Accounts

Private saving is \( S^{priv} = y - T - c \) (disposable income minus consumption). Government saving is \( S^{gov} = T - G \). National saving is:

\[
S = S^{priv} + S^{gov} = y - c - G
\]

In a closed economy, national saving equals investment: \( S = I \). This accounting identity motivates the subsequent focus on production and the determination of output and interest rates in general equilibrium.

---

# Chapter 2: Labour Supply — Partial Equilibrium

## 2.1 The Labour-Leisure Trade-off

Labour supply decisions are modelled as a choice between consumption goods \( c \) (purchasable with labour income) and leisure \( \ell \). If the consumer has a time endowment normalized to 1, then hours worked \( h = 1 - \ell \). Given a real wage \( w \), the budget constraint is:

\[
c = w \cdot h = w(1-\ell)
\]

The consumer maximises:

\[
U(c, \ell) \quad \text{subject to} \quad c + w\ell = w
\]

where \( w \) is the "price" of leisure (its opportunity cost in terms of foregone consumption). The right-hand side \( w \) is full income — the total resources available if all time is sold.

## 2.2 Optimal Labour Supply

The first-order condition equates the marginal rate of substitution between leisure and consumption to the real wage:

\[
\frac{U_\ell(c,\ell)}{U_c(c,\ell)} = w
\]

<div class="definition">
<strong>Marginal Rate of Substitution (MRS):</strong> The MRS between leisure and consumption measures how much consumption the consumer requires to give up one unit of leisure. At the optimum, this must equal the real wage — the market price of time.
</div>

## 2.3 Income and Substitution Effects of Wage Changes

When the real wage changes, two effects operate:

- **Substitution effect:** A higher wage makes leisure more expensive relative to consumption, inducing the consumer to supply more labour (work more).
- **Income effect:** A higher wage raises the value of the time endowment. If leisure is a normal good, consumers demand more leisure and work less.

The labour supply curve can therefore be backward-bending: at low wages the substitution effect dominates (labour supply rises with wages); at high wages the income effect may dominate (labour supply falls).

## 2.4 Intertemporal Labour Supply

In a dynamic context, the consumer chooses labour supply in multiple periods. The intertemporal substitution of labour is governed by a condition analogous to the consumption Euler equation. If the wage is temporarily high today, the consumer supplies more labour now and takes more leisure later — this is the mechanism that drives labour supply fluctuations over the business cycle in Real Business Cycle (RBC) models.

<div class="example">
<strong>Temporary vs. Permanent Wage Changes:</strong> A <em>temporary</em> increase in the real wage has a large substitution effect (the consumer wants to work more now, save, and consume later) with a small income effect. A <em>permanent</em> increase has a large income effect (the consumer is much wealthier) that can offset the substitution effect. This asymmetry is central to understanding business cycle fluctuations driven by technology shocks.
</div>

---

# Chapter 3: Production — Static General Equilibrium

## 3.1 The Firm's Production Decision

Consider a representative firm with a neoclassical production function:

\[
Y = F(K, L)
\]

satisfying constant returns to scale (CRS), positive and diminishing marginal products, and the Inada conditions:

\[
F_K, F_L > 0; \quad F_{KK}, F_{LL} < 0; \quad \lim_{K \to 0} F_K = \lim_{L \to 0} F_L = \infty; \quad \lim_{K \to \infty} F_K = \lim_{L \to \infty} F_L = 0
\]

The canonical example is Cobb-Douglas:

\[
Y = K^\alpha L^{1-\alpha}, \quad \alpha \in (0,1)
\]

Under CRS, Euler's theorem gives \( F = F_K \cdot K + F_L \cdot L \), implying that factor payments exhaust total output — no economic profit in equilibrium.

## 3.2 Profit Maximisation and Factor Demand

A competitive firm takes the real wage \( w \) and real rental rate \( R \) as given and solves:

\[
\max_{K,L} \; F(K,L) - wL - RK
\]

The first-order conditions are:

\[
F_L(K,L) = w \quad \text{and} \quad F_K(K,L) = R
\]

These pin down the firm's demand for labour and capital as functions of factor prices.

<div class="theorem">
<strong>Factor Price Equalization:</strong> In a competitive static general equilibrium, real factor prices are determined by the condition that each factor earns its marginal product. For Cobb-Douglas, this gives \( w = (1-\alpha)K^\alpha L^{-\alpha} \) and \( R = \alpha K^{\alpha-1} L^{1-\alpha} \).
</div>

## 3.3 Static General Equilibrium

A static general equilibrium with competitive markets requires that all markets clear simultaneously. In the simplest model with fixed capital \( \bar{K} \) and inelastic labour supply \( \bar{L} \):

- **Labour market:** \( F_L(\bar{K}, \bar{L}) = w^* \)
- **Capital market:** \( F_K(\bar{K}, \bar{L}) = R^* \)
- **Goods market:** By Walras's Law, if labour and capital markets clear, the goods market clears as well: \( Y^* = F(\bar{K}, \bar{L}) \)

The real wage and rental rate adjust to clear markets; output is determined by the supply side.

## 3.4 The Role of Total Factor Productivity

Output depends not only on capital and labour but on how efficiently they are used. Augmenting the production function by a technology parameter \( A \):

\[
Y = A \cdot F(K, L)
\]

An increase in \( A \) shifts the production function up, raising output for given inputs, and raises both the marginal product of labour (pushing up wages) and the marginal product of capital (pushing up the rental rate). Changes in \( A \) driven by technology shocks are the engine of fluctuations in RBC models.

---

# Chapter 4: Production — Dynamic General Equilibrium

## 4.1 Capital Accumulation

The key dynamic in the macroeconomy is capital accumulation. The capital stock evolves according to:

\[
K_{t+1} = (1-\delta)K_t + I_t
\]

or in continuous time:

\[
\dot{K} = I - \delta K
\]

where \( \delta \in (0,1) \) is the depreciation rate and \( I \) is gross investment. In a closed economy, \( I = S = Y - C - G \).

## 4.2 The Solow-Swan Growth Model

The Solow model (Solow 1956, Swan 1956) is the workhorse model of long-run growth. It takes saving behaviour as exogenous: households save a constant fraction \( s \) of income, so \( I = sY \).

### 4.2.1 Intensive Form

With population growing at rate \( n \) (so \( L_t = L_0 e^{nt} \)), define capital per worker \( k = K/L \). Under CRS, output per worker is:

\[
y = f(k) = F(K/L, 1)
\]

The capital accumulation equation in intensive form is:

\[
\dot{k} = sf(k) - (n + \delta)k
\]

This is the fundamental differential equation of the Solow model. The term \( sf(k) \) is investment per worker; the term \( (n+\delta)k \) is the investment required to keep \( k \) constant (covering depreciation and new workers).

<div class="theorem">
<strong>Steady State:</strong> The steady state capital-labour ratio \( k^* \) satisfies:

\[
sf(k^*) = (n+\delta)k^*
\]
At the steady state, capital per worker, output per worker, and consumption per worker are all constant. The economy converges to \( k^* \) from any initial \( k_0 > 0 \).
</div>

### 4.2.2 The Golden Rule

Steady-state consumption per worker is:

\[
c^* = f(k^*) - (n+\delta)k^*
\]

The golden rule capital stock \( k^{GR} \) maximises steady-state consumption:

\[
f'(k^{GR}) = n + \delta
\]

At the golden rule, the marginal product of capital equals the sum of the population growth rate and the depreciation rate. If the steady state has \( k^* < k^{GR} \) (as is typical with low saving rates), the economy is dynamically efficient — it is impossible to increase consumption in all periods simultaneously.

<div class="example">
<strong>Cobb-Douglas Solow Model:</strong> With \( f(k) = k^\alpha \), the steady state satisfies:

\[
s(k^*)^\alpha = (n+\delta)k^* \implies k^* = \left(\frac{s}{n+\delta}\right)^{1/(1-\alpha)}
\]
A permanent increase in the saving rate raises the steady-state capital stock and output per worker, but has no effect on the long-run growth rate — growth eventually returns to zero per capita (or \( g \) per capita if we add labour-augmenting technology growing at rate \( g \)).
</div>

### 4.2.3 Convergence

The Solow model predicts conditional convergence: countries with lower capital per worker (relative to their own steady state) grow faster. The speed of convergence near the steady state is approximately:

\[
\lambda \approx (1-\alpha)(n + \delta + g)
\]

For typical parameter values (\( \alpha = 1/3 \), \( n + \delta + g \approx 0.06 \)), this gives \( \lambda \approx 0.04 \) — the economy closes about 4% of the gap between its current state and the steady state each year, implying a half-life of roughly 17 years.

### 4.2.4 Technology and Long-Run Growth

In the basic Solow model with labour-augmenting technology \( A_t \) growing at rate \( g \), define efficiency units of capital \( \tilde{k} = K/(A \cdot L) \). The capital accumulation equation becomes:

\[
\dot{\tilde{k}} = sf(\tilde{k}) - (n + \delta + g)\tilde{k}
\]

The balanced growth path has \( \tilde{k} \) constant; along it, output per worker grows at the exogenous rate \( g \). The Solow model thus explains sustained growth only by assuming exogenous technical progress — the engine of growth is left unexplained.

## 4.3 The Ramsey-Cass-Koopmans Model

The RCK model endogenises the saving decision by replacing the constant saving rate with fully optimising households. The representative household maximises:

\[
\int_0^\infty e^{-(\rho - n)t} u(c_t) \, dt
\]

subject to the capital accumulation equation. The discount rate net of population growth is \( \rho - n > 0 \) (assumed positive for the integral to converge).

### 4.3.1 Optimality Conditions

Using the Hamiltonian or dynamic programming, the optimal path satisfies two equations. The Euler equation for consumption:

\[
\frac{\dot{c}}{c} = \frac{1}{\sigma}\left[ f'(k) - \delta - \rho \right]
\]

and the capital accumulation equation:

\[
\dot{k} = f(k) - \delta k - c
\]

plus the transversality condition \( \lim_{t\to\infty} e^{-(\rho-n)t} \lambda_t k_t = 0 \), which rules out Ponzi schemes.

<div class="theorem">
<strong>Modified Golden Rule:</strong> In the RCK model, the steady state satisfies:

\[
f'(k^*) = \delta + \rho
\]
This is the modified golden rule: the marginal product of capital equals depreciation plus the rate of time preference. Unlike the Solow golden rule, this is uniquely determined by preferences (\( \rho \)) and technology (\( f'(\cdot) \)).
</div>

### 4.3.2 Phase Diagram Analysis

The RCK model is typically analysed using a phase diagram in \( (k, c) \) space. The locus \( \dot{k} = 0 \) is \( c = f(k) - \delta k \) (the consumption-compatible capital accumulation); the locus \( \dot{c} = 0 \) is the vertical line \( k = k^* \) (where \( f'(k^*) = \delta + \rho \)). The steady state is a saddle point; the stable manifold (the saddle path) is the unique optimal trajectory.

<div class="remark">
<strong>RCK vs. Solow:</strong> The RCK model yields qualitatively similar predictions to Solow — convergence to a unique steady state — but the saving rate is now endogenous and generally varies along the transition path. In steady state, the RCK saving rate equals \( s^* = (n + g)k^* / f(k^*) \), pinned down by fundamentals.
</div>

## 4.4 Business Cycles in Dynamic Models

While the Solow and RCK models focus on long-run growth, the same general equilibrium framework provides the foundation for business cycle models. Kydland and Prescott (1982) and Long and Plosser (1983) showed that a calibrated version of the RCK model, hit by technology shocks, can replicate key features of business cycle fluctuations: the co-movement of output, consumption, investment, and hours worked.

The Real Business Cycle (RBC) model adds stochastic total factor productivity \( A_t \) to the RCK framework:

\[
Y_t = A_t F(K_t, L_t)
\]

A positive technology shock raises the marginal product of capital and labour, inducing higher investment and labour supply via intertemporal substitution. The model generates recessions from negative technology shocks — a conclusion that remains controversial, since it is hard to identify large negative technology shocks in the data.

---

# Chapter 5: The IS-LM Model

## 5.1 Overview and Motivation

The IS-LM model, developed by Hicks (1937) as a formalisation of Keynes's *General Theory*, characterises short-run equilibrium in the goods and money markets. It is a model of aggregate demand: it determines output and the interest rate given a fixed price level. The assumption of a fixed price level distinguishes the short run (IS-LM) from the long run (neoclassical/Solow).

## 5.2 The IS Curve: Goods Market Equilibrium

The IS (Investment-Saving) curve represents combinations of output \( Y \) and the real interest rate \( r \) such that the goods market clears: aggregate demand equals output.

Aggregate demand is:

\[
Z = C(Y - T) + I(r) + G
\]

where \( C(\cdot) \) is the consumption function (increasing in disposable income), \( I(r) \) is investment (decreasing in \( r \)), \( G \) is government spending, and \( T \) is taxes.

Goods market equilibrium requires \( Y = Z \):

\[
Y = C(Y - T) + I(r) + G
\]

<div class="definition">
<strong>IS Curve:</strong> The IS curve is the set of \((Y, r)\) pairs that satisfy goods market equilibrium. It slopes downward in \((Y, r)\) space: a higher interest rate reduces investment, which lowers aggregate demand and equilibrium output.
</div>

The slope of the IS curve is steeper (more vertical) when investment is less sensitive to the interest rate (low interest elasticity of investment) and flatter when investment is very sensitive.

### 5.2.1 The Multiplier

A key property of the Keynesian goods market is the multiplier: an exogenous increase in spending (e.g., government spending \( \Delta G \)) raises output by more than \( \Delta G \). With a marginal propensity to consume \( 0 < c_1 < 1 \):

\[
\Delta Y = \frac{1}{1 - c_1} \Delta G
\]

The multiplier \( 1/(1-c_1) > 1 \) reflects the rounds of induced consumption spending.

## 5.3 The LM Curve: Money Market Equilibrium

The LM (Liquidity-Money) curve represents combinations of \( Y \) and the nominal interest rate \( i \) such that the money market clears: money supply equals money demand.

Money demand (Keynesian liquidity preference):

\[
\frac{M^d}{P} = L(Y, i) = k Y - h i
\]

where \( k > 0 \) (transactions demand rises with income) and \( h > 0 \) (asset demand for money falls with the opportunity cost \( i \)). Money market equilibrium:

\[
\frac{M}{P} = L(Y, i)
\]

<div class="definition">
<strong>LM Curve:</strong> The LM curve is the set of \((Y, i)\) pairs that satisfy money market equilibrium given real money supply \( M/P \). It slopes upward: higher income raises money demand, requiring a higher interest rate to restore equilibrium with fixed money supply.
</div>

## 5.4 IS-LM Equilibrium

IS-LM equilibrium is the pair \( (Y^*, i^*) \) at which both the goods market and money market clear simultaneously. Graphically, it is the intersection of the IS and LM curves.

### 5.4.1 Fiscal Policy

An increase in government spending \( G \) shifts the IS curve rightward. In IS-LM equilibrium, output rises but by less than the simple Keynesian multiplier, because the rise in output increases money demand, pushing up the interest rate \( i \), which crowds out some private investment. This is the **crowding-out** effect.

<div class="example">
<strong>Crowding Out:</strong> If the LM curve is vertical (perfectly inelastic money demand — the "classical case"), an increase in \( G \) raises \( i \) without raising \( Y \) at all: full crowding out. If the LM curve is horizontal (the "Keynesian liquidity trap"), fiscal policy is fully effective with no crowding out.
</div>

### 5.4.2 Monetary Policy

An increase in money supply \( M \) shifts the LM curve rightward (for a given price level \( P \), real money supply \( M/P \) rises). This lowers the equilibrium interest rate, stimulates investment, and raises output.

### 5.4.3 The Liquidity Trap

When the nominal interest rate reaches its zero lower bound (\( i = 0 \)), the LM curve is horizontal: money and bonds become perfect substitutes, and further monetary expansion cannot lower \( i \). In this situation monetary policy is powerless to stimulate demand — fiscal policy becomes the only tool. This scenario became highly relevant after the 2008 financial crisis and again in the COVID-19 recession.

---

# Chapter 6: Aggregate Demand and Aggregate Supply

## 6.1 From IS-LM to Aggregate Demand

The IS-LM model holds the price level fixed. To study the effect of price changes, we derive the aggregate demand (AD) curve: the relationship between the price level \( P \) and output \( Y \), keeping money supply \( M \) and fiscal policy \( (G, T) \) fixed.

When \( P \) rises, real money supply \( M/P \) falls, shifting the LM curve left, raising the interest rate, crowding out investment, and reducing output. Thus the AD curve slopes downward in \( (Y, P) \) space.

\[
\text{AD:} \quad Y = Y^d(P, M, G, T) \quad \frac{\partial Y^d}{\partial P} < 0
\]

## 6.2 Aggregate Supply

### 6.2.1 Short-Run Aggregate Supply

The short-run aggregate supply (SRAS) curve relates the price level to output supplied by firms. It slopes upward because wages and other input costs are sticky in the short run — when prices rise, the product wage falls, and firms are willing to supply more output.

Several models generate an upward-sloping SRAS:
- **Sticky wage model:** Nominal wages adjust slowly; a rise in \( P \) lowers real wages, raises employment, raises output.
- **Sticky price model (New Keynesian):** Some firms cannot adjust prices immediately (Calvo pricing); an increase in aggregate demand raises output at firms with sticky prices.
- **Imperfect information model (Lucas):** Firms observe their own price but not the aggregate price level; a rise in their price may be misinterpreted as a relative price increase, inducing higher production.

### 6.2.2 Long-Run Aggregate Supply

In the long run, wages and prices are fully flexible and adjust to clear markets. Long-run aggregate supply (LRAS) is a vertical line at potential output \( \bar{Y} \) — the level of output consistent with full employment and full utilisation of capital. \( \bar{Y} \) is determined by the supply side (technology, capital, labour supply) and is independent of the price level.

## 6.3 AD-AS Equilibrium and Dynamics

Short-run equilibrium is at the intersection of AD and SRAS. Long-run equilibrium additionally requires the economy to be on LRAS.

<div class="theorem">
<strong>Self-Correcting Mechanism:</strong> If output is below potential (\( Y < \bar{Y} \)), unemployment is above the natural rate, wages fall, SRAS shifts right (prices fall), and output returns to \( \bar{Y} \). The economy is self-correcting in the long run. The policy debate concerns how long this adjustment takes in practice.
</div>

### 6.3.1 Demand Shocks

A positive demand shock (e.g., a fiscal expansion or increase in consumer confidence) shifts AD right. In the short run, output rises above \( \bar{Y} \) and prices rise. Over time, wages and prices adjust upward, SRAS shifts left, and output returns to \( \bar{Y} \) at a higher price level. The long-run effect of a demand shock is purely inflationary.

### 6.3.2 Supply Shocks

A negative supply shock (e.g., an oil price spike, as in 1973 and 1979) shifts SRAS left. The economy experiences both higher prices and lower output — stagflation. This poses a dilemma for policy: stimulating demand addresses low output but worsens inflation; tight policy reduces inflation but deepens the recession.

---

# Chapter 7: Inflation and Unemployment

## 7.1 The Phillips Curve

The original Phillips curve (Phillips 1958) documented an empirical negative relationship between wage inflation and unemployment in the UK. Samuelson and Solow (1960) interpreted this as a policy menu: policymakers could choose lower unemployment at the cost of higher inflation.

The expectations-augmented Phillips curve (Friedman 1968, Phelps 1967) incorporates inflation expectations:

\[
\pi = \pi^e - \epsilon(u - u^n) + \nu
\]

where \( \pi \) is inflation, \( \pi^e \) is expected inflation, \( u \) is the unemployment rate, \( u^n \) is the natural rate of unemployment, \( \epsilon > 0 \), and \( \nu \) is a supply shock.

<div class="theorem">
<strong>Natural Rate Hypothesis:</strong> There is no long-run trade-off between inflation and unemployment. In the long run, \( \pi = \pi^e \), so \( u = u^n \) regardless of the inflation rate. Attempting to hold unemployment below \( u^n \) simply raises inflation expectations and the actual inflation rate without a lasting gain in employment.
</div>

### 7.1.1 New Keynesian Phillips Curve

The modern New Keynesian Phillips Curve (NKPC) is derived from microfoundations (Calvo pricing):

\[
\pi_t = \beta E_t[\pi_{t+1}] + \kappa (y_t - \bar{y}_t)
\]

where \( \kappa > 0 \) depends on the degree of price stickiness and \( y_t - \bar{y}_t \) is the output gap. The NKPC is forward-looking: current inflation depends on expected future inflation, not past inflation. This has important implications for how monetary policy should be conducted.

## 7.2 Types of Unemployment

Three types of unemployment are distinguished in macroeconomic analysis:

- **Frictional unemployment:** Arises from the time required to match workers to jobs. Even in a healthy economy with many vacancies, some workers are between jobs.
- **Structural unemployment:** Arises from a mismatch between the skills workers possess and the skills employers demand. May be exacerbated by technological change or geographic immobility.
- **Cyclical unemployment:** Arises when aggregate demand falls short of potential output, driving unemployment above the natural rate.

<div class="definition">
<strong>Natural Rate of Unemployment (NAIRU):</strong> The unemployment rate consistent with stable inflation — roughly the sum of frictional and structural unemployment. In Canada, estimates of the NAIRU have varied between 5% and 7% over recent decades.
</div>

## 7.3 Okun's Law

Okun's Law (Okun 1962) relates changes in unemployment to output growth:

\[
\Delta u = -\frac{1}{\omega}\left( \frac{\Delta Y}{Y} - g \right)
\]

where \( \omega \approx 2 \) is the Okun coefficient and \( g \) is the trend growth rate. A 1-percentage-point rise in unemployment above the natural rate is associated with roughly 2% of lost output below potential. Okun's Law is a useful empirical regularity for relating the labour market to the goods market.

---

# Chapter 8: Open Economy Macroeconomics — The Mundell-Fleming Model

## 8.1 The Open Economy

In an open economy, residents can trade goods and assets internationally. The current account records trade in goods and services; the capital account records trade in financial assets. With perfect capital mobility, domestic and foreign assets are perfect substitutes, and the domestic interest rate must equal the world interest rate: \( r = r^* \).

## 8.2 The Exchange Rate

The nominal exchange rate \( E \) is the price of foreign currency in terms of domestic currency (e.g., CAD per USD). An increase in \( E \) is a depreciation of the domestic currency. The real exchange rate is:

\[
\varepsilon = \frac{E \cdot P^*}{P}
\]

where \( P^* \) is the foreign price level and \( P \) is the domestic price level. A higher real exchange rate makes domestic goods cheaper relative to foreign goods, stimulating exports and reducing imports.

## 8.3 The Mundell-Fleming Model

The Mundell-Fleming (MF) model extends IS-LM to an open economy with a fixed price level (short run) and perfect capital mobility. The key equations are:

**IS curve (open economy):**

\[
Y = C(Y-T) + I(r) + G + NX(\varepsilon)
\]

**LM curve:**

\[
\frac{M}{P} = L(Y, i)
\]

**Balance of payments / interest parity:**

\[
r = r^*
\]

Under perfect capital mobility, any domestic interest rate above \( r^* \) would attract infinite capital inflows; any rate below \( r^* \) would trigger infinite outflows. Thus, the domestic interest rate is pinned at \( r^* \) — the economy is on the BP curve (horizontal at \( r^* \)).

## 8.4 Fixed Exchange Rate Regime

Under a fixed exchange rate, the central bank stands ready to buy or sell foreign currency to maintain \( E = \bar{E} \). The money supply is endogenous: the central bank must intervene.

<div class="theorem">
<strong>Mundell-Fleming: Fixed Exchange Rate</strong>
<em>Fiscal policy:</em> Under fixed exchange rates with perfect capital mobility, fiscal policy is fully effective. An increase in \( G \) shifts IS right, putting upward pressure on \( r \). To defend the peg, the central bank buys foreign currency (sells domestic currency), expanding \( M \) and shifting LM right until \( r = r^* \) is restored. Output rises by the full open-economy multiplier.
<br><br>
<em>Monetary policy:</em> Under fixed exchange rates, monetary policy is completely ineffective. Any expansion of \( M \) lowers \( r \) below \( r^* \), triggering capital outflows and requiring the central bank to sell foreign reserves, contracting \( M \) back to its original level.
</div>

## 8.5 Flexible Exchange Rate Regime

Under a flexible (floating) exchange rate, the exchange rate adjusts to maintain balance of payments equilibrium without central bank intervention.

<div class="theorem">
<strong>Mundell-Fleming: Flexible Exchange Rate</strong>
<em>Fiscal policy:</em> Under flexible exchange rates with perfect capital mobility, fiscal policy is completely ineffective. An increase in \( G \) raises output temporarily and puts upward pressure on \( r \). Capital inflows appreciate the currency (\( E \) falls), making exports less competitive. NX falls, shifting IS back left until output returns to its original level. The composition of output shifts from net exports to government spending — complete crowding out via the exchange rate.
<br><br>
<em>Monetary policy:</em> Under flexible exchange rates, monetary policy is very powerful. An increase in \( M \) lowers \( r \), triggers capital outflows, depreciates the currency, improves NX, and raises output significantly.
</div>

## 8.6 The Trilemma of International Finance

The Mundell-Fleming analysis implies the **impossible trinity**: a country cannot simultaneously have (1) free capital mobility, (2) a fixed exchange rate, and (3) an independent monetary policy. Only two of these three objectives can be achieved simultaneously.

<div class="example">
<strong>Policy Regimes and the Trilemma:</strong>
<ul>
<li>The Eurozone sacrifices independent monetary policy (giving it to the ECB) to have free capital mobility and fixed exchange rates.</li>
<li>Canada has free capital mobility and a floating exchange rate, so it retains independent monetary policy.</li>
<li>China has traditionally maintained a managed exchange rate and independent monetary policy by restricting capital flows.</li>
</ul>
</div>

## 8.7 Purchasing Power Parity

In the long run, the real exchange rate tends toward 1 (Purchasing Power Parity, PPP): identical goods should sell for the same price everywhere when expressed in a common currency. PPP implies:

\[
E = \frac{P}{P^*}
\]

Absolute PPP holds when price levels are equal across countries. Relative PPP holds when changes in the nominal exchange rate reflect inflation differentials:

\[
\hat{E} = \pi - \pi^*
\]

where \( \hat{E} \) is the rate of depreciation, \( \pi \) is domestic inflation, and \( \pi^* \) is foreign inflation. PPP is a reasonable long-run benchmark but deviates significantly in the short run due to traded vs. non-traded goods, transport costs, and nominal rigidities.

---

# Chapter 9: Monetary and Fiscal Policy

## 9.1 Monetary Policy Transmission

Monetary policy affects the economy through multiple channels:
- **Interest rate channel:** Policy rate changes transmit to longer-term real rates, affecting investment and durable consumption.
- **Asset price channel:** Lower interest rates raise equity prices and housing values, increasing wealth and collateral values.
- **Exchange rate channel:** Lower domestic rates depreciate the currency, stimulating net exports.
- **Credit channel:** Policy rates affect bank lending conditions (bank lending channel) and the net worth of borrowers (balance sheet channel).

## 9.2 The Taylor Rule

The Taylor rule (Taylor 1993) describes how central banks adjust the nominal interest rate in response to inflation and the output gap:

\[
i_t = r^* + \pi_t + a_\pi(\pi_t - \pi^*) + a_y(y_t - \bar{y}_t)
\]

where \( r^* \) is the neutral real rate, \( \pi^* \) is the inflation target, and \( a_\pi, a_y > 0 \). The Taylor principle requires \( a_\pi > 0 \): when inflation rises by 1%, the nominal rate must rise by more than 1% so that the real interest rate rises, dampening demand.

<div class="remark">
<strong>Taylor Principle and Determinacy:</strong> If \( a_\pi < 1 \) (passive monetary policy), multiple equilibria may exist — sunspot fluctuations can be self-fulfilling. Active monetary policy (\( a_\pi > 1 \)) pins down a unique equilibrium by ensuring that any deviation of inflation from target is met with a sufficient real interest rate response.
</div>

## 9.3 Fiscal Policy and Ricardian Equivalence

Ricardian equivalence (Barro 1974) is one of the most important and controversial propositions in macroeconomics: a tax cut today, financed by government borrowing, has no effect on aggregate demand if consumers are fully optimising and foresee future tax increases.

Formally: if the government cuts taxes by \( \Delta T \) today and issues bonds, consumers recognise that future taxes must rise by \( (1+r)\Delta T \) to repay the debt. The present value of the tax cut is zero, so consumption is unchanged.

Ricardian equivalence requires: perfect capital markets, infinite horizons (or operative bequest motives), lump-sum taxes, and no distortions. Deviations from these conditions (borrowing-constrained households, finite lives, distortionary taxes) break the equivalence and restore a role for fiscal policy.

## 9.4 Government Budget Constraint and Debt Dynamics

The government budget constraint is:

\[
\dot{B} = r B + G - T
\]

where \( B \) is the stock of government debt and \( G - T \) is the primary deficit. Dividing by GDP \( Y \) and defining the debt-to-GDP ratio \( b = B/Y \):

\[
\dot{b} = (r - g) b + (g\text{-}t)
\]

where \( g\text{-}t \) is the primary deficit as a share of GDP. If \( r > g \) (the real interest rate exceeds growth), debt accumulates explosively unless the primary surplus \( t - g \) is positive and large enough. The sustainability of fiscal policy depends critically on whether \( r - g \) is positive or negative — a question that has attracted renewed attention since interest rates fell near zero after 2008.
