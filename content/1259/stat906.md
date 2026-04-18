---
title: "STAT 906: Computer Intensive Methods for Stochastic Models in Finance"
prof: "Christiane Lemieux"
subjects: "STAT"
---

## Sources and References
**Primary texts** — Paul Glasserman, *Monte Carlo Methods in Financial Engineering* (Springer, 2004); Christiane Lemieux, *Monte Carlo and Quasi-Monte Carlo Sampling* (Springer, 2009); Don McLeish, *Monte Carlo Simulation & Finance* (Wiley, 2005).
**Online resources** — MIT 18.S096 / 18.337 computational finance notes; Stanford MATH 238 stochastic finance simulation notes; Peter Jäckel's numerical methods resources.

---

# Chapter 1: Introduction — Stochastic Finance Models and Applications

## 1.1 The Role of Simulation in Modern Finance

The pricing and risk management of financial derivatives sits at the intersection of probability theory, stochastic calculus, and numerical computation. Whereas closed-form solutions exist only in a narrow class of idealized settings — the canonical example being the Black-Scholes formula for a European call on a geometric Brownian motion — the instruments actually traded in modern markets are far more complex. Barrier options, Asian options, basket options written on correlated underlyings, callable bonds with embedded optionality, and structured credit products whose payoffs depend on the joint behavior of dozens or hundreds of obligors all defy analytical treatment. The **Monte Carlo method**, together with its quasi-random and variance-reduced extensions, provides a flexible, general-purpose numerical framework that can accommodate virtually any model and payoff structure. This course develops both the theoretical foundations and the computational practice needed to apply these methods rigorously.

Before diving into the Monte Carlo machinery, it is essential to understand the stochastic models that serve as inputs to the simulation. The choice of model has profound consequences for both the qualitative behavior of prices and the efficiency of numerical schemes. This chapter surveys the principal model families used in quantitative finance, emphasizing their mathematical structure, the key parameters governing their behavior, and the limitations that motivate more elaborate specifications.

## 1.2 Geometric Brownian Motion and the Black-Scholes Framework

The foundation of modern derivatives theory is the model introduced by Black, Scholes, and Merton in 1973. Under the **physical** (or real-world) measure \( \mathbb{P} \), the price \( S_t \) of a non-dividend-paying asset is assumed to satisfy the stochastic differential equation

\[
dS_t = \mu S_t \, dt + \sigma S_t \, dW_t,
\]

where \( \mu \in \mathbb{R} \) is the drift, \( \sigma > 0 \) is the constant volatility, and \( W_t \) is a standard Brownian motion on a filtered probability space \( (\Omega, \mathcal{F}, \{\mathcal{F}_t\}, \mathbb{P}) \). This is the **geometric Brownian motion** (GBM) model. By Itô's formula applied to \( \ln S_t \), one obtains the explicit solution

\[
S_t = S_0 \exp\!\left(\left(\mu - \tfrac{1}{2}\sigma^2\right)t + \sigma W_t\right),
\]

which shows that log-returns over any interval are normally distributed and that \( S_t > 0 \) almost surely. The parameter \( \mu - \frac{1}{2}\sigma^2 \) is the **continuously compounded expected return** (net of the Itô correction), while \( \sigma \) controls the dispersion of log-returns.

The power of the Black-Scholes framework rests on the concept of **no-arbitrage pricing** through a change of measure. The **risk-neutral pricing theorem**, which we state formally below, asserts that derivative prices can be computed as discounted expectations under a particular equivalent measure \( \mathbb{Q} \), the existence of which is guaranteed (under mild technical conditions) by the absence of arbitrage in the market.

<div class="theorem">
<strong>Theorem 1.1 (Risk-Neutral Pricing).</strong> Let the market be arbitrage-free and let \( r \geq 0 \) be the continuously compounded risk-free rate. Then there exists a probability measure \( \mathbb{Q} \) equivalent to \( \mathbb{P} \) — the <em>risk-neutral measure</em> — under which the discounted price process \( e^{-rt} S_t \) is a local martingale. The time-0 price of any attainable contingent claim with \( \mathcal{F}_T \)-measurable payoff \( H \) is

\[
V_0 = e^{-rT} \mathbb{E}^{\mathbb{Q}}\!\left[H\right].
\]

Under \( \mathbb{Q} \), the asset price satisfies \( dS_t = r S_t \, dt + \sigma S_t \, d\tilde{W}_t \), where \( \tilde{W}_t = W_t + \frac{\mu - r}{\sigma} t \) is a \( \mathbb{Q} \)-Brownian motion, and the market price of risk is \( \lambda = (\mu - r)/\sigma \).
</div>

For a European call option with strike \( K \) and maturity \( T \), the payoff is \( H = (S_T - K)^+ \). Evaluating the risk-neutral expectation by direct integration of the log-normal density yields the celebrated **Black-Scholes formula**:

\[
C(S_0, K, T, r, \sigma) = S_0 \Phi(d_1) - K e^{-rT} \Phi(d_2),
\]

where \( \Phi \) denotes the standard normal CDF,

\[
d_1 = \frac{\ln(S_0/K) + (r + \sigma^2/2)T}{\sigma\sqrt{T}}, \qquad d_2 = d_1 - \sigma\sqrt{T}.
\]

Despite its elegance, the Black-Scholes model suffers from well-documented empirical failures. Equity returns exhibit **excess kurtosis** (fat tails) relative to the normal distribution, and the implied volatility surface — the function \( \sigma_{\mathrm{imp}}(K, T) \) obtained by inverting the Black-Scholes formula — is neither flat nor constant over time, displaying the characteristic **volatility smile** and **volatility skew** patterns. These deficiencies motivate the richer model families discussed in the following sections.

## 1.3 Stochastic Volatility Models

The most important generalization of Black-Scholes replaces the constant volatility \( \sigma \) with a second stochastic process. In the **Heston model** (1993), the instantaneous variance \( v_t = \sigma_t^2 \) follows a mean-reverting square-root process:

\[
dS_t = r S_t \, dt + \sqrt{v_t}\, S_t \, d\tilde{W}_t^{(1)},
\]

\[
dv_t = \kappa(\theta - v_t)\, dt + \xi \sqrt{v_t}\, d\tilde{W}_t^{(2)},
\]

where \( \tilde{W}^{(1)} \) and \( \tilde{W}^{(2)} \) are \( \mathbb{Q} \)-Brownian motions with correlation \( d\langle \tilde{W}^{(1)}, \tilde{W}^{(2)} \rangle_t = \rho \, dt \). The parameter \( \kappa > 0 \) is the **mean-reversion speed**, \( \theta > 0 \) is the **long-run variance**, and \( \xi > 0 \) is the **volatility of volatility**. The condition \( 2\kappa\theta \geq \xi^2 \) (the **Feller condition**) ensures that \( v_t > 0 \) almost surely; in practice, this condition is frequently violated by calibrated parameters, requiring careful treatment in simulation.

The Heston model admits a semi-closed-form characteristic function for \( \ln S_T \), enabling fast pricing of vanilla options via Fourier inversion, while exotic options require simulation. The negative correlation \( \rho < 0 \) (empirically typical for equity markets) generates the leverage effect: downward price moves tend to increase volatility, producing a left-skewed return distribution and explaining the observed negative skew in the implied volatility surface.

## 1.4 Jump-Diffusion Models

Another approach to capturing fat tails and sudden market moves augments the continuous diffusion with a **jump component**. In the **Merton jump-diffusion model** (1976), the log-price dynamics under \( \mathbb{Q} \) are

\[
dS_t = (r - \lambda \bar{\kappa}) S_t \, dt + \sigma S_t \, d\tilde{W}_t + S_{t^-}(e^{J} - 1)\, dN_t,
\]

where \( N_t \) is a Poisson process with intensity \( \lambda > 0 \), \( J \sim \mathcal{N}(\mu_J, \sigma_J^2) \) is the normally distributed log-jump size, and \( \bar{\kappa} = e^{\mu_J + \sigma_J^2/2} - 1 \) is the mean percentage jump size (included to enforce the martingale condition). The solution is

\[
S_t = S_0 \exp\!\left(\left(r - \tfrac{1}{2}\sigma^2 - \lambda\bar{\kappa}\right)t + \sigma \tilde{W}_t\right) \prod_{i=1}^{N_t} e^{J_i},
\]

making simulation straightforward: one simulates the Brownian path, draws the number of jumps \( N_t \sim \mathrm{Poisson}(\lambda t) \), and then multiplies by the independent jump factors. The **Kou model** (2002) replaces the Gaussian jump distribution with an asymmetric double-exponential, providing a better fit to the asymmetric tails of equity returns and yielding a richer implied volatility surface.

## 1.5 Term Structure Models

In fixed-income markets, the primary objects of interest are **interest rate processes** and the prices of bonds, swaps, caps, floors, and swaptions. The simplest tractable models specify dynamics for the **short rate** \( r_t \) directly. The **Vasicek model** posits

\[
dr_t = a(b - r_t)\, dt + \sigma \, dW_t,
\]

where \( a, b, \sigma > 0 \). This is an Ornstein-Uhlenbeck process: the short rate reverts to the long-run mean \( b \) at speed \( a \), with Gaussian increments. Its main drawbacks are that rates can become negative (with positive probability) and that the model is not easily calibrated to an arbitrary initial yield curve.

The **Cox-Ingersoll-Ross (CIR) model** rectifies the negativity issue by replacing the constant diffusion coefficient with \( \sigma\sqrt{r_t} \):

\[
dr_t = a(b - r_t)\, dt + \sigma \sqrt{r_t}\, dW_t.
\]

Under the Feller condition \( 2ab \geq \sigma^2 \), the process \( r_t \) remains strictly positive. The CIR process shares its distributional structure with the Heston variance process, and the same simulation challenges apply.

For pricing instruments that depend on the joint evolution of multiple forward rates, the **LIBOR Market Model** (LMM), also known as the Brace-Gatarek-Musiela (BGM) model, provides a more sophisticated framework. The LMM models a set of simply-compounded forward rates \( L_1(t), \ldots, L_n(t) \) directly as log-normal processes under their respective forward measures. This ensures consistency with cap pricing via Black's formula but requires simulation in high dimension, making Monte Carlo essentially the only viable numerical approach for complex LMM payoffs.

## 1.6 The Monte Carlo Pricing Framework

Given a model and a payoff, the Monte Carlo approach to pricing proceeds as follows. One generates \( n \) independent sample paths of the underlying state variables \( (S_t, v_t, r_t, \ldots) \) from time 0 to maturity \( T \) under the risk-neutral measure \( \mathbb{Q} \). For each path \( \omega_i \), one evaluates the discounted payoff \( Y_i = e^{-rT} H(\omega_i) \) (or its path-dependent analogue). The Monte Carlo price estimate is then

\[
\hat{V} = \frac{1}{n} \sum_{i=1}^{n} Y_i.
\]

By the strong law of large numbers, \( \hat{V} \to \mathbb{E}^{\mathbb{Q}}[e^{-rT} H] = V_0 \) almost surely as \( n \to \infty \). The central limit theorem quantifies the rate of convergence: the error \( \hat{V} - V_0 \) is approximately \( \mathcal{N}(0, \sigma_Y^2 / n) \), where \( \sigma_Y^2 = \mathrm{Var}^{\mathbb{Q}}(e^{-rT} H) \). The three-sigma confidence interval for \( V_0 \) is

\[
\hat{V} \pm 3 \frac{s}{\sqrt{n}},
\]

where \( s^2 = (n-1)^{-1}\sum_{i=1}^{n}(Y_i - \hat{V})^2 \) is the sample variance. The key observation is that the half-width of this interval decays as \( O(n^{-1/2}) \) regardless of the dimension of the state space — a property that makes Monte Carlo uniquely well-suited to high-dimensional problems.

---

# Chapter 2: The Monte Carlo Method

## 2.1 Foundations: Law of Large Numbers and Central Limit Theorem

The Monte Carlo method reduces the computation of an integral — or equivalently, an expectation — to the problem of generating random samples. Let \( X \) be a random vector in \( \mathbb{R}^d \) with distribution \( F \), and let \( f: \mathbb{R}^d \to \mathbb{R} \) be a measurable function with \( \mathbb{E}[|f(X)|] < \infty \). We seek to estimate \( \mu = \mathbb{E}[f(X)] \).

<div class="theorem">
<strong>Theorem 2.1 (Strong Law of Large Numbers).</strong> Let \( X_1, X_2, \ldots \) be i.i.d. copies of \( X \). Define the Monte Carlo estimator \( \hat{\mu}_n = n^{-1}\sum_{i=1}^n f(X_i) \). Then \( \hat{\mu}_n \to \mu \) almost surely as \( n \to \infty \).
</div>

<div class="theorem">
<strong>Theorem 2.2 (Central Limit Theorem).</strong> If additionally \( \sigma^2 = \mathrm{Var}(f(X)) < \infty \), then

\[
\sqrt{n}\,(\hat{\mu}_n - \mu) \xrightarrow{d} \mathcal{N}(0, \sigma^2) \quad \text{as } n \to \infty.
\]

Consequently, for any \( \alpha \in (0,1) \), an asymptotically valid \( (1-\alpha) \)-level confidence interval for \( \mu \) is

\[
\hat{\mu}_n \pm z_{\alpha/2} \frac{s_n}{\sqrt{n}},
\]

where \( s_n^2 = (n-1)^{-1}\sum_{i=1}^n (f(X_i) - \hat{\mu}_n)^2 \) and \( z_{\alpha/2} \) is the \( (1 - \alpha/2) \) quantile of the standard normal distribution.
</div>

The quantity \( s_n/\sqrt{n} \) is the **standard error** of the Monte Carlo estimate. Since the standard error decays as \( O(n^{-1/2}) \), halving the error requires quadrupling the number of samples. This slow convergence rate is the fundamental limitation of the basic Monte Carlo method and motivates the variance reduction and quasi-Monte Carlo techniques discussed in later chapters.

## 2.2 Simulating Paths of Stochastic Differential Equations

In practice, one rarely has access to the exact distribution of \( S_T \) conditional on \( S_0 \). For models like Heston or CIR, the transition density exists but is complicated (a noncentral chi-squared distribution in the CIR case). For general SDE models, one must resort to **time discretization schemes**.

Consider a general Itô SDE:

\[
dX_t = a(X_t, t)\, dt + b(X_t, t)\, dW_t, \qquad X_0 = x_0.
\]

Partition the time interval \( [0, T] \) into \( m \) steps of equal length \( h = T/m \), with grid points \( t_k = kh \). The **Euler-Maruyama scheme** approximates each increment by evaluating the drift and diffusion at the left endpoint:

\[
X_{t_{k+1}} \approx X_{t_k} + a(X_{t_k}, t_k)\, h + b(X_{t_k}, t_k)\, \Delta W_k,
\]

where \( \Delta W_k = W_{t_{k+1}} - W_{t_k} \sim \mathcal{N}(0, h) \) are independent increments, simulated as \( \sqrt{h}\, Z_k \) with \( Z_k \sim \mathcal{N}(0,1) \). The Euler-Maruyama scheme has **strong order** \( 1/2 \) (meaning the expected absolute error \( \mathbb{E}[|X_{t_k} - X_{t_k}^{\mathrm{EM}}|] = O(h^{1/2}) \)) and **weak order** 1 (meaning the error in expectations \( |\mathbb{E}[g(X_T)] - \mathbb{E}[g(X_T^{\mathrm{EM}})]| = O(h) \) for smooth test functions \( g \)).

The **Milstein scheme** improves the strong order to 1 by adding a correction term derived from Itô's lemma:

\[
X_{t_{k+1}} \approx X_{t_k} + a(X_{t_k}, t_k)\, h + b(X_{t_k}, t_k)\, \Delta W_k + \frac{1}{2} b(X_{t_k}, t_k)\, b'(X_{t_k}, t_k)\left[(\Delta W_k)^2 - h\right],
\]

where \( b'(x,t) = \partial b/\partial x \). For the GBM model, with \( a(x) = rx \) and \( b(x) = \sigma x \), the Milstein scheme gives an exact result because the additional correction term precisely recovers the exact solution; indeed, the log transformation reduces GBM to an arithmetic process whose exact increments are readily simulated.

<div class="example">
<strong>Example 2.1 (Euler simulation of GBM).</strong> Consider pricing an Asian call option with payoff \( (A_T - K)^+ \), where \( A_T = m^{-1}\sum_{k=1}^m S_{t_k} \) is the arithmetic average of the asset price at \( m \) monitoring dates. With \( S_0 = 100 \), \( K = 100 \), \( r = 0.05 \), \( \sigma = 0.20 \), \( T = 1 \), and \( m = 52 \) (weekly), the Euler-Maruyama scheme generates the path

\[
S_{t_{k+1}} = S_{t_k} \exp\!\left(\left(r - \tfrac{1}{2}\sigma^2\right)h + \sigma\sqrt{h}\, Z_k\right),
\]

(using the exact GBM increment). With \( n = 10{,}000 \) paths, a typical Monte Carlo estimate gives \( \hat{V} \approx 5.35 \) with standard error approximately \( 0.03 \). The exact GBM formula is used here; for Heston dynamics one would require approximate discretization of the variance process.
</div>

## 2.3 Discretization of the Heston Model

Simulating the Heston model requires care because the square-root diffusion \( dv_t = \kappa(\theta - v_t)\, dt + \xi\sqrt{v_t}\, dW_t^{(2)} \) can become negative under naive Euler discretization. Several remedies are used in practice. The **reflection fix** replaces \( v_{t_k} \) by \( |v_{t_k}| \) before taking the square root; the **absorption fix** replaces negative values by zero. A more principled approach is the **QE (Quadratic Exponential) scheme** of Andersen (2008), which approximates the conditional distribution of \( v_{t_{k+1}} | v_{t_k} \) by matching its first two moments to a mixture of an exponential and a point mass at zero, then applying an efficient inversion method.

For the integrated variance \( \int_0^T v_t \, dt \), which appears in the log-price formula for Heston, one can use the moment-matching approximation or, for higher accuracy, the exact simulation method of Broadie and Kaya (2006), which exploits the noncentral chi-squared distribution of \( v_T | v_0 \).

## 2.4 Error Analysis and Computational Complexity

The total error of a Monte Carlo simulation consists of two components: the **statistical error** from sampling (of order \( O(n^{-1/2}) \)) and the **discretization bias** from time-stepping (of order \( O(h^p) \) for a scheme of weak order \( p \)). To balance these two error sources, one should choose \( h \) so that \( h^p \approx n^{-1/2} \), which gives \( m = T/h = O(n^{1/(2p)}) \) time steps. For Euler-Maruyama (\( p = 1 \)), this means \( m = O(n^{1/2} \)), giving a total computational cost of \( O(n \cdot m) = O(n^{3/2}) \) function evaluations to achieve a root-mean-square error of \( O(n^{-1/2}) \).

<div class="remark">
<strong>Remark 2.1.</strong> For models where the exact distribution of \( S_T \) is available in closed form (e.g., Black-Scholes, Merton jump-diffusion), one can simulate exact terminal values without time-stepping, thereby eliminating the discretization bias entirely and reducing the cost to \( O(n) \). This is always preferable when feasible. The multilevel Monte Carlo method (discussed in Chapter 7) provides a systematic way to reduce the cost when exact simulation is not available.
</div>

## 2.5 Greeks and Sensitivity Estimation

A critical application of Monte Carlo in practice is the estimation of **Greeks** — sensitivities of the option price to model parameters. The delta is \( \Delta = \partial V_0 / \partial S_0 \), the vega is \( \mathcal{V} = \partial V_0 / \partial \sigma \), and so forth. Three main approaches are used in simulation.

The **finite difference** method approximates \( \Delta \approx (V_0(S_0 + \epsilon) - V_0(S_0 - \epsilon)) / (2\epsilon) \) using independent Monte Carlo runs at \( S_0 \pm \epsilon \). This is simple but can be inaccurate due to the combined simulation and truncation error; the optimal \( \epsilon \) is of order \( (s/\sqrt{n})^{1/2} \), requiring careful tuning.

The **pathwise differentiation** method (also called the **IPA method**) passes the derivative inside the expectation:

\[
\Delta = \frac{\partial}{\partial S_0} \mathbb{E}\!\left[e^{-rT} H(S_T)\right] = \mathbb{E}\!\left[e^{-rT} H'(S_T) \frac{\partial S_T}{\partial S_0}\right].
\]

For a European call and GBM, \( \partial S_T/\partial S_0 = S_T/S_0 \) and \( H'(S_T) = \mathbf{1}_{S_T > K} \), giving the estimator \( e^{-rT} \mathbf{1}_{S_T > K} \cdot S_T/S_0 \). This is the most efficient method when the payoff is differentiable.

The **likelihood ratio method** (or **score function method**) writes \( \Delta = \mathbb{E}[e^{-rT} H(S_T) \cdot \partial \ln p_{S_T}(s) / \partial S_0] \), where \( p_{S_T} \) is the density. This method applies even to discontinuous payoffs but tends to have higher variance.

---

# Chapter 3: Random Number Generation

## 3.1 Pseudo-Random Number Generators

Monte Carlo simulation requires a source of (pseudo-)random numbers that are uniformly distributed on \( [0,1) \) and exhibit no detectable correlations. A **pseudo-random number generator (PRNG)** is a deterministic algorithm that produces a sequence \( u_1, u_2, \ldots \) that mimics the properties of a true random sequence. The sequence is completely determined by its initial **seed**, which makes it reproducible — an essential feature for debugging and variance reduction.

The simplest family of PRNGs is the **linear congruential generator (LCG)**:

\[
x_{k+1} = (a x_k + c) \bmod m, \qquad u_k = x_k / m,
\]

where \( m \) is the modulus, \( a \) is the multiplier, and \( c \) is the addend. The period of an LCG divides \( m \), and with proper parameter choices (satisfying the Hull-Dobell theorem) one can achieve the maximum period \( m \). For example, the classic Park-Miller generator uses \( m = 2^{31} - 1 \), \( a = 7^5 \), \( c = 0 \). Despite its simplicity, the LCG has serious deficiencies: successive tuples \( (u_k, u_{k+1}, \ldots, u_{k+d-1}) \) lie on a small number of parallel hyperplanes in \( [0,1)^d \) (the **Marsaglia phenomenon**), which can introduce systematic bias in high-dimensional simulations.

The **Mersenne Twister** (MT19937, Matsumoto and Nishimura, 1998) is the standard PRNG in scientific computing. It is based on a linear recurrence over \( \mathbb{F}_2 \) with period \( 2^{19937} - 1 \) (a Mersenne prime, hence the name) and passes virtually all standard statistical tests. Its state space is 624 words of 32 bits, and it produces uniformly distributed integers that are then mapped to \( [0,1) \). The Mersenne Twister is the default generator in NumPy, R, and most scientific software.

## 3.2 Statistical Tests for PRNGs

No matter how sophisticated, any PRNG may exhibit subtle patterns that corrupt Monte Carlo estimates. A battery of statistical tests should be applied to any PRNG before use in a serious application. The **TestU01 library** of L'Ecuyer and Simard (2007) provides the most comprehensive suite available, including:

The **frequency test** checks that the proportion of \( u_k \in [0, 1/2) \) is close to \( 1/2 \). The **serial test** checks the joint distribution of pairs \( (u_k, u_{k+1}) \). The **spectral test** evaluates the lattice structure of the generator in multiple dimensions. The **birthday spacings test** checks for unexpected clustering of points. Generators that fail these tests should not be used for high-dimensional simulation.

## 3.3 The Inverse Transform Method

Given a PRNG producing uniform random variables \( U \sim \mathrm{Uniform}(0,1) \), the most general method for generating a random variable \( X \) with CDF \( F \) is the **inverse transform method**:

<div class="theorem">
<strong>Theorem 3.1 (Inverse Transform).</strong> Let \( F: \mathbb{R} \to [0,1] \) be a CDF and define its generalized inverse (quantile function) \( F^{-1}(u) = \inf\{x : F(x) \geq u\} \). If \( U \sim \mathrm{Uniform}(0,1) \), then \( X = F^{-1}(U) \) has CDF \( F \).
</div>

<div class="proof">
For any \( x \in \mathbb{R} \) and \( u \in (0,1) \), one has \( F^{-1}(u) \leq x \) if and only if \( u \leq F(x) \), since \( F^{-1} \) is the left-continuous inverse of the right-continuous function \( F \). Therefore \( \mathbb{P}(X \leq x) = \mathbb{P}(U \leq F(x)) = F(x) \).
</div>

For the exponential distribution with rate \( \lambda \), \( F^{-1}(u) = -\ln(1-u)/\lambda \), which can be simplified to \( -\ln(u)/\lambda \) since \( 1 - U \overset{d}{=} U \). For the standard normal, \( \Phi^{-1} \) has no closed form but can be computed to machine precision using rational approximations (e.g., the Beasley-Springer-Moro algorithm).

## 3.4 Generating Normal Random Variables

Since Gaussian random variables are the cornerstone of almost every financial simulation, their efficient generation deserves special attention. Three principal methods are in use.

**Box-Muller transform.** Given two independent uniform variates \( U_1, U_2 \sim \mathrm{Uniform}(0,1) \), set

\[
Z_1 = \sqrt{-2 \ln U_1} \cos(2\pi U_2), \qquad Z_2 = \sqrt{-2 \ln U_1} \sin(2\pi U_2).
\]

Then \( Z_1 \) and \( Z_2 \) are independent standard normals. The proof follows from the Jacobian of the polar-to-Cartesian transformation combined with the fact that the squared radius \( R^2 = Z_1^2 + Z_2^2 \) is exponentially distributed with rate \( 1/2 \).

**Marsaglia polar method.** This avoids the trigonometric functions of Box-Muller by generating a random point \( (V_1, V_2) \) uniform on the unit disk via rejection sampling, then setting \( Z_i = V_i \sqrt{-2\ln S / S} \) where \( S = V_1^2 + V_2^2 \). The acceptance probability is \( \pi/4 \approx 0.785 \), making this more efficient than Box-Muller in environments where trigonometric functions are expensive.

**Ziggurat method.** For the highest throughput, the ziggurat method of Marsaglia and Tsang (2000) decomposes the area under the normal density into a stack of rectangular regions and a tail region, then uses a fast acceptance-rejection scheme within each rectangle. This is typically the fastest method for scalar hardware.

## 3.5 Generating Correlated Normal Vectors

Many financial applications require simulating correlated normal random vectors \( \mathbf{Z} \sim \mathcal{N}(\mathbf{0}, \Sigma) \), where \( \Sigma \in \mathbb{R}^{d \times d} \) is a positive semi-definite covariance matrix. The standard approach is **Cholesky decomposition**. Write \( \Sigma = L L^\top \) where \( L \) is lower triangular with non-negative diagonal entries. If \( \mathbf{W} \sim \mathcal{N}(\mathbf{0}, I_d) \) is a vector of independent standard normals, then \( \mathbf{Z} = L\mathbf{W} \) satisfies

\[
\mathrm{Cov}(\mathbf{Z}) = L \, \mathrm{Cov}(\mathbf{W}) \, L^\top = L I_d L^\top = \Sigma.
\]

The Cholesky factorization costs \( O(d^3) \) to compute and \( O(d^2) \) to apply per sample, making it feasible for moderate dimensions (say, \( d \leq 500 \)). For very large correlation matrices arising in portfolio simulation (e.g., \( d = 1000 \) assets), one may use a **principal component decomposition** \( \Sigma = P \Lambda P^\top \) and retain only the \( k \ll d \) largest eigenvalues, approximating \( \mathbf{Z} \approx P_k \Lambda_k^{1/2} \mathbf{W}_k \) where \( \mathbf{W}_k \in \mathbb{R}^k \). This reduces the simulation cost at the expense of introducing a truncation error.

## 3.6 Generating Other Distributions

**Gamma distribution.** For integer shape parameter \( \alpha \in \mathbb{N} \), one uses the fact that \( \mathrm{Gamma}(\alpha, \lambda) \overset{d}{=} \sum_{i=1}^\alpha \mathrm{Exponential}(\lambda) \), so one sums \( \alpha \) independent exponential variates. For non-integer \( \alpha \), the **Marsaglia-Tsang method** uses a clever transformation: if \( \alpha > 1 \), set \( d = \alpha - 1/3 \) and \( c = 1/\sqrt{9d} \), generate \( Z \sim \mathcal{N}(0,1) \) and \( U \sim \mathrm{Uniform}(0,1) \), accept \( v = (1 + cZ)^3 \) if \( Z > -1/c \) and \( \ln U < Z^2/2 + d - dv + d\ln v \), and output \( X = dv / \lambda \).

**Poisson distribution.** For moderate \( \lambda \), one can use the inversion method applied to the CDF, or the **Knuth method**: generate successive exponential inter-arrival times \( E_1, E_2, \ldots \) and count how many fit within the interval of length \( \lambda \), returning \( N = \min\{k : E_1 + \cdots + E_k > \lambda\} - 1 \). For large \( \lambda \), the Poisson random variable is approximately normal and specialized rejection methods are preferable.

---

# Chapter 4: Variance Reduction Techniques

## 4.1 Motivation

The fundamental inefficiency of crude Monte Carlo is that the standard error \( \sigma/\sqrt{n} \) depends on the inherent variability \( \sigma \) of the payoff estimator. Variance reduction techniques seek to find estimators \( \tilde{Y} \) with the same expectation as the original estimator \( Y = e^{-rT} H \) but with \( \mathrm{Var}(\tilde{Y}) \ll \mathrm{Var}(Y) \). If \( \mathrm{Var}(\tilde{Y}) = \mathrm{Var}(Y) / k \), then the reduced-variance estimator achieves the same accuracy as crude Monte Carlo with \( k n \) samples using only \( n \) samples — effectively a \( k \)-fold speedup.

## 4.2 Antithetic Variates

The **antithetic variates** method exploits the fact that, for many simulation problems, the payoff is a monotone function of the driving Brownian motion \( W \). The idea is to pair each sample path driven by \( W \) with a mirror path driven by \( -W \), since \( -W \) is also a Brownian motion. The antithetic estimator is

\[
\tilde{Y} = \frac{1}{2}\left[f(X(W)) + f(X(-W))\right],
\]

and the Monte Carlo estimator averages \( \tilde{Y}_1, \ldots, \tilde{Y}_n \) over \( n \) paired replications.

<div class="theorem">
<strong>Theorem 4.1 (Variance Reduction via Antithetic Variates).</strong> Let \( Y = f(X) \) and \( Y' = f(X') \) where \( X \overset{d}{=} X' \) and \( X, X' \) are defined on the same probability space (typically \( X' \) is the antithetic counterpart of \( X \)). The antithetic estimator \( \tilde{Y} = (Y + Y')/2 \) has variance

\[
\mathrm{Var}(\tilde{Y}) = \frac{\mathrm{Var}(Y)}{2} + \frac{\mathrm{Cov}(Y, Y')}{2}.
\]

Therefore \( \mathrm{Var}(\tilde{Y}) \leq \mathrm{Var}(Y)/2 \) if and only if \( \mathrm{Cov}(Y, Y') \leq 0 \), i.e., if and only if the antithetic pairing induces negative correlation between paired payoffs. In particular, if \( f \) is monotone and \( X' = F^{-1}(1 - F(X)) \) (the antithetic transform via the quantile function), then \( \mathrm{Cov}(Y, Y') \leq 0 \) whenever \( f \) is monotone.
</div>

For a European call under GBM, using \( Z \mapsto -Z \) in the log-price formula gives the antithetic path \( S_T' = S_0 \exp((r - \sigma^2/2)T - \sigma\sqrt{T}Z) \). Since the call payoff \( (S_T - K)^+\) is increasing in \( S_T \) and \( S_T' = S_0^2 K / S_T \cdot e^{-\text{const}} \) is decreasing in \( S_T \), the covariance is negative and variance reduction is guaranteed.

## 4.3 Control Variates

The **control variate** method is arguably the most powerful and widely applicable variance reduction technique. Suppose one can compute \( \mathbb{E}[Z] = \mu_Z \) analytically for some random variable \( Z \) that is correlated with the target payoff \( Y = f(X) \). The control variate estimator with coefficient \( b \in \mathbb{R} \) is

\[
\tilde{Y}(b) = Y - b(Z - \mu_Z),
\]

which satisfies \( \mathbb{E}[\tilde{Y}(b)] = \mathbb{E}[Y] = \mu \) for all \( b \). Its variance is

\[
\mathrm{Var}(\tilde{Y}(b)) = \mathrm{Var}(Y) - 2b\,\mathrm{Cov}(Y, Z) + b^2 \mathrm{Var}(Z).
\]

<div class="theorem">
<strong>Theorem 4.2 (Optimal Control Variate Coefficient).</strong> The variance \( \mathrm{Var}(\tilde{Y}(b)) \) is minimized at

\[
b^* = \frac{\mathrm{Cov}(Y, Z)}{\mathrm{Var}(Z)},
\]

yielding the minimum variance

\[
\mathrm{Var}(\tilde{Y}(b^*)) = \mathrm{Var}(Y)\left(1 - \rho_{Y,Z}^2\right),
\]

where \( \rho_{Y,Z} = \mathrm{Corr}(Y, Z) \) is the correlation between the payoff and the control. The variance reduction factor is therefore \( 1/(1 - \rho_{Y,Z}^2) \), which diverges as \( |\rho_{Y,Z}| \to 1 \).
</div>

<div class="proof">
Differentiating \( \mathrm{Var}(\tilde{Y}(b)) = \sigma_Y^2 - 2b\,\sigma_{YZ} + b^2 \sigma_Z^2 \) with respect to \( b \) and setting to zero gives \( b^* = \sigma_{YZ}/\sigma_Z^2 = \mathrm{Cov}(Y,Z)/\mathrm{Var}(Z) \). Substituting back:

\[
\mathrm{Var}(\tilde{Y}(b^*)) = \sigma_Y^2 - \frac{\sigma_{YZ}^2}{\sigma_Z^2} = \sigma_Y^2\!\left(1 - \frac{\sigma_{YZ}^2}{\sigma_Y^2 \sigma_Z^2}\right) = \sigma_Y^2 (1 - \rho_{Y,Z}^2). \qquad \square
\]
</div>

In practice, \( b^* \) is unknown and must be estimated from the same simulation; one uses the sample regression coefficient \( \hat{b} = \widehat{\mathrm{Cov}}(Y,Z) / \widehat{\mathrm{Var}}(Z) \). The resulting estimator \( \hat{\mu} = \bar{Y} - \hat{b}(\bar{Z} - \mu_Z) \) introduces a small bias of order \( O(1/n) \) but typically achieves variance very close to the optimum. A common choice is to use a pilot run of \( n_0 \) samples to estimate \( b^* \) and a main run of \( n - n_0 \) samples for the primary estimation.

<div class="example">
<strong>Example 4.1 (Control variate for an Asian option).</strong> Consider an arithmetic average Asian call under GBM. The arithmetic average \( A_T = m^{-1}\sum_{k=1}^m S_{t_k} \) has no closed-form moment generating function, but the geometric average \( G_T = \left(\prod_{k=1}^m S_{t_k}\right)^{1/m} \) does. Since \( G_T \) is log-normally distributed, the geometric Asian call has a known price \( \mu_Z = e^{-rT}\mathbb{E}^{\mathbb{Q}}[(G_T - K)^+] \), computable in closed form. One uses \( Z = e^{-rT}(G_T - K)^+ \) as the control variate. The arithmetic and geometric averages are highly correlated (typical \( |\rho| > 0.99 \)), yielding variance reductions of factors of several hundred.
</div>

## 4.4 Stratified Sampling

**Stratified sampling** divides the sample space into \( k \) disjoint strata \( A_1, \ldots, A_k \) with \( \bigcup_j A_j = \Omega \) and \( p_j = \mathbb{P}(A_j) > 0 \). Within each stratum, \( n_j \) samples are drawn. If stratum \( j \) has mean \( \mu_j = \mathbb{E}[Y | A_j] \) and variance \( \sigma_j^2 = \mathrm{Var}(Y | A_j) \), the stratified estimator is

\[
\hat{\mu}_{\mathrm{strat}} = \sum_{j=1}^k p_j \bar{Y}_j, \qquad \bar{Y}_j = \frac{1}{n_j}\sum_{i=1}^{n_j} Y_{j,i},
\]

with variance \( \mathrm{Var}(\hat{\mu}_{\mathrm{strat}}) = \sum_{j=1}^k p_j^2 \sigma_j^2 / n_j \).

**Proportional allocation** sets \( n_j = n p_j \) and achieves variance \( \sum_j p_j \sigma_j^2 / n \), which is no larger than the crude Monte Carlo variance \( (\sum_j p_j \sigma_j^2 + \text{between-stratum variance})/n \). **Optimal (Neyman) allocation** sets \( n_j \propto p_j \sigma_j \) and minimizes the stratified variance for a fixed total sample size \( n = \sum_j n_j \), achieving \( \mathrm{Var} = (\sum_j p_j \sigma_j)^2 / n \).

## 4.5 Importance Sampling

**Importance sampling** changes the sampling distribution to focus on the most important regions of the sample space. Let \( g \) be an alternative density (the **importance density**) with \( g(x) > 0 \) whenever \( f(x) p(x) \neq 0 \), where \( p \) is the original density of \( X \). Then

\[
\mu = \mathbb{E}_p[f(X)] = \int f(x) p(x)\, dx = \int f(x) \frac{p(x)}{g(x)} g(x)\, dx = \mathbb{E}_g\!\left[f(X) \frac{p(X)}{g(X)}\right].
\]

The ratio \( w(x) = p(x)/g(x) \) is the **likelihood ratio** or **Radon-Nikodym derivative** of \( p \) with respect to \( g \). The importance sampling estimator \( \hat{\mu}_{\mathrm{IS}} = n^{-1}\sum_{i=1}^n f(X_i) w(X_i) \) with \( X_i \sim g \) is unbiased with variance

\[
\mathrm{Var}(\hat{\mu}_{\mathrm{IS}}) = \frac{1}{n}\left(\int f(x)^2 \frac{p(x)^2}{g(x)} dx - \mu^2\right).
\]

The variance is minimized when \( g^*(x) \propto |f(x)| p(x) \), in which case the variance is exactly zero (at the cost of knowing \( \mu \) already). In practice, one chooses \( g \) to approximate this ideal but remain tractable to sample from.

In the context of risk management, importance sampling is particularly valuable for estimating tail probabilities and expected shortfall (CVaR). For example, when estimating the probability that a portfolio loss exceeds a high threshold \( \ell \), the event \( \{L > \ell\}  \) is rare under the physical measure. One can exponentially tilt the driving Brownian motion: under the measure with Girsanov density \( d\mathbb{Q}/d\mathbb{P} = \exp(\theta W_T - \theta^2 T/2) \), the mean of \( W_T \) shifts from 0 to \( \theta T \), concentrating probability mass on the tail of interest.

## 4.6 Moment Matching

**Moment matching** is a variance reduction technique that forces the simulated paths to match certain known theoretical moments exactly. The simplest application is **mean correction**: after generating \( n \) samples \( S_{T,1}, \ldots, S_{T,n} \) of the terminal asset price, one scales each path by the factor \( \mathbb{E}[S_T] / \bar{S}_T \) to ensure the sample mean equals the theoretical mean \( S_0 e^{rT} \). More generally, one can match the first \( k \) moments simultaneously by solving a system of equations. Moment matching can achieve substantial variance reduction when the payoff is close to linear in the underlying.

---

# Chapter 5: Quasi-Monte Carlo Methods

## 5.1 Motivation and Overview

The Monte Carlo method achieves a stochastic error of order \( O(n^{-1/2}) \) regardless of the dimension of the integration domain. However, the constant implicit in this bound depends on \( \sigma = \mathrm{Var}(f(X))^{1/2} \), which can be large for financial payoffs. The **quasi-Monte Carlo (QMC) method** replaces the pseudo-random points with carefully constructed **deterministic** point sets that cover the unit hypercube \( [0,1)^s \) more uniformly than random points. For functions of sufficient regularity, this can improve the convergence rate dramatically.

## 5.2 Discrepancy Theory

The key concept underlying QMC is **discrepancy**, which measures how uniformly a point set covers the unit hypercube. Let \( P_n = \{u_1, \ldots, u_n\} \subset [0,1)^s \) be a deterministic point set.

<div class="definition">
<strong>Definition 5.1 (Star Discrepancy).</strong> The <em>star discrepancy</em> of \( P_n \) is

\[
D_n^*(P_n) = \sup_{J \subseteq [0,1)^s} \left|\frac{|P_n \cap J|}{n} - \mathrm{Vol}(J)\right|,
\]

where the supremum is over all axis-aligned boxes \( J = [0, u_1) \times \cdots \times [0, u_s) \) with one corner at the origin, \( |P_n \cap J| \) is the number of points falling in \( J \), and \( \mathrm{Vol}(J) = u_1 \cdots u_s \).
</div>

The star discrepancy measures the worst-case deviation between the empirical distribution of the points and the uniform distribution over all anchor boxes. For a truly random sequence, one can show \( D_n^* = O(\sqrt{\log\log n / n}) \) almost surely. The best deterministic constructions achieve \( D_n^* = O\!\left((\log n)^s / n\right) \), which is dramatically smaller for fixed \( s \).

The importance of discrepancy is made precise by the following fundamental result.

<div class="theorem">
<strong>Theorem 5.1 (Koksma-Hlawka Inequality).</strong> For any function \( f: [0,1]^s \to \mathbb{R} \) of bounded variation \( V(f) \) in the sense of Hardy and Krause, the quasi-Monte Carlo integration error satisfies

\[
\left|\frac{1}{n}\sum_{i=1}^n f(u_i) - \int_{[0,1]^s} f(u)\, du\right| \leq V(f) \cdot D_n^*(P_n).
\]

Thus the QMC error is bounded by the product of a smoothness measure of the integrand and a uniformity measure of the point set.
</div>

This inequality motivates two complementary strategies: constructing point sets with low discrepancy (improving \( D_n^*(P_n) \)), and transforming the integrand to reduce its variation \( V(f) \) (the effective dimension reduction techniques discussed below).

## 5.3 Low-Discrepancy Sequences

A **low-discrepancy sequence** (LDS) is an infinite sequence whose first \( n \) terms achieve star discrepancy \( D_n^* = O\!\left((\log n)^s / n\right) \) for all \( n \). In contrast to \( (t,m,s) \)-nets, which are constructed for a specific \( n = b^m \), an LDS allows arbitrary \( n \).

**Halton sequences** generalize the van der Corput sequence to multiple dimensions. For a prime base \( b \), the van der Corput sequence \( \phi_b(k) \) is obtained by reflecting the base-\( b \) representation of the integer \( k \) about the decimal point: if \( k = \sum_{j} d_j b^j \), then \( \phi_b(k) = \sum_j d_j b^{-(j+1)} \). The \( s \)-dimensional Halton sequence uses the first \( s \) primes \( b_1 = 2, b_2 = 3, \ldots, b_s \):

\[
u_k = (\phi_2(k), \phi_3(k), \phi_5(k), \ldots, \phi_{b_s}(k)), \qquad k = 1, 2, 3, \ldots
\]

The Halton sequence is easy to implement and achieves discrepancy \( O((\log n)^s / n) \), but for large \( s \) and small \( n \), the higher-dimensional components exhibit significant correlation due to the large prime bases required.

**Sobol' sequences** are based on the theory of **digital nets** over \( \mathbb{F}_2 \) and are generally regarded as superior to Halton sequences for dimensions above 10. They require the specification of **direction numbers** derived from primitive polynomials over \( \mathbb{F}_2 \), and standard implementations (e.g., the Joe-Kuo tables) provide direction numbers for up to \( 21{,}201 \) dimensions. Sobol' sequences have well-distributed projections onto all low-dimensional subspaces, which is crucial for financial applications where the payoff depends heavily on a small number of "important" dimensions.

## 5.4 Digital Nets and \((t,m,s)\)-Nets

<div class="definition">
<strong>Definition 5.2 (\((t,m,s)\)-net in base \( b \)).</strong> A point set \( P = \{u_0, \ldots, u_{b^m - 1}\} \subset [0,1)^s \) is a <em>\((t,m,s)\)-net in base \( b \)</em> if every elementary interval in base \( b \) of the form

\[
J = \prod_{j=1}^s \left[\frac{a_j}{b^{d_j}}, \frac{a_j+1}{b^{d_j}}\right), \qquad 0 \leq a_j < b^{d_j}, \quad \sum_{j=1}^s d_j = m - t,
\]

contains exactly \( b^t \) points of \( P \). The parameter \( t \) is the <em>quality parameter</em>; smaller \( t \) means better equidistribution.
</div>

A \((0,m,s)\)-net is the most uniformly distributed possible: every elementary interval of volume \( b^{-m} \) contains exactly one point. Constructing \((t,m,s)\)-nets with small \( t \) in large dimensions \( s \) is the central combinatorial problem of QMC theory. The **Sobol' construction** and the **Niederreiter-Xing construction** are the principal methods.

## 5.5 Randomized QMC

A significant limitation of deterministic QMC methods is that they do not provide a mechanism for error estimation. The Koksma-Hlawka bound is rarely computable in practice, and there is no analog of the CLT. **Randomized QMC (RQMC)** resolves this by applying a random shift or scramble to the deterministic point set while preserving its low-discrepancy structure.

The simplest RQMC method is **random shift** (Owen, 1995; L'Ecuyer and Lemieux, 2000): given a deterministic LDS \( \{u_1, \ldots, u_n\} \subset [0,1)^s \), add a uniform random shift \( \Delta \sim \mathrm{Uniform}[0,1)^s \) component-wise modulo 1:

\[
\tilde{u}_i = (u_i + \Delta) \bmod 1.
\]

The shifted sequence \( \{\tilde{u}_1, \ldots, \tilde{u}_n\} \) has the same discrepancy as the original (since shifting is an isometry of the torus), but each individual point \( \tilde{u}_i \) is uniformly distributed over \( [0,1)^s \). Therefore the RQMC estimator \( \hat{\mu}_{\mathrm{RQMC}} = n^{-1}\sum_{i=1}^n f(\tilde{u}_i) \) is unbiased.

By repeating with \( R \) independent random shifts \( \Delta_1, \ldots, \Delta_R \) and averaging the resulting estimates \( \hat{\mu}_1, \ldots, \hat{\mu}_R \), one obtains an unbiased estimator \( \bar{\mu} = R^{-1}\sum_{r=1}^R \hat{\mu}_r \) whose variance can be estimated as \( s^2/R \), enabling confidence intervals identical in form to the Monte Carlo CLT.

**Owen's scrambled nets** provide an even more powerful form of randomization: for a \((t,m,s)\)-net in base \( b \), Owen's scrambling randomly permutes the digits of each coordinate using a nested tree of random permutations. The result is a random point set that (a) has the same \((t,m,s)\)-net property almost surely, (b) gives uniformly distributed marginals, and (c) achieves a variance that decreases as \( O(n^{-3}(\log n)^{s-1}) \) for smooth integrands, compared to \( O(n^{-1}) \) for standard Monte Carlo.

## 5.6 Convergence Rates and Effective Dimension

For smooth functions \( f \in C^k([0,1]^s) \), the QMC error with a \((t,m,s)\)-net satisfies

\[
\left|\hat{\mu}_{\mathrm{QMC}} - \mu\right| = O\!\left(\frac{(\log n)^{s-1}}{n}\right),
\]

which is better than the Monte Carlo rate \( O(n^{-1/2}) \) for all \( s \) when \( n \) is large enough. However, the constant in the \( O(\cdot) \) bound grows with \( s \), and for realistic \( n \) and large \( s \), the QMC advantage may not materialize. This is the **curse of dimensionality** for QMC.

The concept of **effective dimension** (Caflisch, Morokoff, and Owen, 1997) provides a more nuanced picture. The **effective dimension in the superposition sense** at level \( \epsilon \) is the smallest \( s_{\epsilon} \) such that the sum of all ANOVA components of order at most \( s_{\epsilon} \) accounts for a fraction \( 1 - \epsilon \) of the total variance. Empirically, many financial integrands have effective dimension of order 2–5 even when the nominal dimension \( s \) is hundreds, explaining why QMC methods often outperform Monte Carlo dramatically in practice.

**Dimension reduction techniques** such as the **Brownian bridge construction** and the **principal component analysis (PCA) construction** aim to concentrate the most important variation of the payoff into the first few QMC dimensions, thereby reducing the effective dimension. In the Brownian bridge construction, one first generates \( W_T \), then successively bisects the time interval, generating intermediate points by Brownian bridge interpolation. In the PCA construction, one diagonalizes the covariance matrix of the discretized Brownian path and assigns the largest eigenvalue components to the first QMC coordinates.

---

# Chapter 6: Simulation with Copula Models

## 6.1 Introduction to Copulas

In multivariate financial modeling, one frequently needs to specify the joint distribution of a vector of random variables \( (X_1, \ldots, X_d) \) — for example, the joint default times of \( d \) obligors in a credit portfolio, or the joint returns of \( d \) assets. A **copula** provides a flexible way to separate the specification of the marginal distributions \( F_1, \ldots, F_d \) from the specification of the dependence structure. This separation is made mathematically precise by Sklar's theorem, the fundamental result of copula theory.

<div class="theorem">
<strong>Theorem 6.1 (Sklar's Theorem).</strong> Let \( F \) be a joint CDF on \( \mathbb{R}^d \) with marginals \( F_1, \ldots, F_d \). Then there exists a copula \( C: [0,1]^d \to [0,1] \) — a \( d \)-dimensional CDF with uniform marginals on \( [0,1] \) — such that

\[
F(x_1, \ldots, x_d) = C(F_1(x_1), \ldots, F_d(x_d))
\]

for all \( (x_1, \ldots, x_d) \in \mathbb{R}^d \). If the marginals \( F_i \) are continuous, then \( C \) is unique. Conversely, for any copula \( C \) and marginals \( F_1, \ldots, F_d \), the function \( F \) defined above is a valid joint CDF.
</div>

Sklar's theorem is the theoretical foundation for copula-based modeling: one specifies the marginal distributions and the copula separately, then combines them. For simulation, the procedure is: (1) generate a sample \( (U_1, \ldots, U_d) \sim C \) from the copula; (2) apply the quantile transforms \( X_i = F_i^{-1}(U_i) \) to obtain a sample from \( F \).

## 6.2 Fréchet-Hoeffding Bounds

Any copula \( C \) satisfies the **Fréchet-Hoeffding bounds**:

\[
W(u_1, \ldots, u_d) \leq C(u_1, \ldots, u_d) \leq M(u_1, \ldots, u_d),
\]

where

\[
M(u_1, \ldots, u_d) = \min(u_1, \ldots, u_d), \qquad W(u_1, \ldots, u_d) = \max\!\left(\sum_{i=1}^d u_i - (d-1), 0\right).
\]

\( M \) is the **upper Fréchet bound** (comonotonicity copula) and corresponds to the case of perfect positive dependence: \( (X_1, \ldots, X_d) = (F_1^{-1}(U), \ldots, F_d^{-1}(U)) \) for a single uniform \( U \). \( W \) is the **lower Fréchet bound** (countermonotonicity) and is a valid copula only for \( d = 2 \). The **independence copula** \( \Pi(u_1, \ldots, u_d) = \prod_{i=1}^d u_i \) corresponds to joint independence of the \( X_i \).

## 6.3 The Gaussian Copula

The **Gaussian copula** is defined by

\[
C_{\Sigma}^{\mathrm{Ga}}(u_1, \ldots, u_d) = \Phi_\Sigma(\Phi^{-1}(u_1), \ldots, \Phi^{-1}(u_d)),
\]

where \( \Phi_\Sigma \) is the joint CDF of \( \mathcal{N}(\mathbf{0}, \Sigma) \) and \( \Phi^{-1} \) is the standard normal quantile function. The parameter is the correlation matrix \( \Sigma \) (with unit diagonal). Simulation from the Gaussian copula is straightforward: generate \( \mathbf{Z} \sim \mathcal{N}(\mathbf{0}, \Sigma) \) via Cholesky decomposition, then set \( U_i = \Phi(Z_i) \).

The Gaussian copula achieved infamy during the 2007–2008 financial crisis due to its widespread use in pricing collateralized debt obligations (CDOs). Its critical deficiency is the **absence of tail dependence**: the Gaussian copula has zero upper and lower tail dependence coefficients, meaning that extreme joint losses are far less likely under the Gaussian copula than under empirically calibrated models. This misspecification led to systematic underpricing of credit risk in senior CDO tranches.

<div class="definition">
<strong>Definition 6.1 (Tail Dependence Coefficients).</strong> The <em>upper tail dependence coefficient</em> of a bivariate copula \( C \) is

\[
\lambda_U = \lim_{u \to 1^-} \frac{1 - 2u + C(u,u)}{1 - u},
\]

and the <em>lower tail dependence coefficient</em> is \( \lambda_L = \lim_{u \to 0^+} C(u,u)/u \). A copula has upper (resp. lower) tail dependence if \( \lambda_U > 0 \) (resp. \( \lambda_L > 0 \)).
</div>

For the Gaussian copula with correlation \( \rho < 1 \), \( \lambda_U = \lambda_L = 0 \). For the \( t \)-copula with \( \nu \) degrees of freedom and correlation \( \rho \), both tail dependence coefficients equal \( 2T_{\nu+1}(-\sqrt{(\nu+1)(1-\rho)/(1+\rho)}) > 0 \), where \( T_{\nu+1} \) is the CDF of the \( t \)-distribution with \( \nu + 1 \) degrees of freedom. This positive tail dependence is the principal reason the \( t \)-copula is preferred for credit risk modeling.

## 6.4 The \( t \)-Copula

The **\( t \)-copula** with \( \nu \) degrees of freedom and correlation matrix \( \Sigma \) is

\[
C_{\Sigma,\nu}^{t}(u_1, \ldots, u_d) = t_{\Sigma,\nu}(t_\nu^{-1}(u_1), \ldots, t_\nu^{-1}(u_d)),
\]

where \( t_{\Sigma,\nu} \) is the joint CDF of the multivariate \( t \)-distribution and \( t_\nu^{-1} \) is the quantile function of the univariate \( t \)-distribution with \( \nu \) degrees of freedom. Simulation is also straightforward: generate \( \mathbf{Z} \sim \mathcal{N}(\mathbf{0}, \Sigma) \) and an independent \( \chi^2_\nu \) random variable \( V \), then set \( \mathbf{T} = \mathbf{Z} / \sqrt{V/\nu} \) and \( U_i = t_\nu(T_i) \).

## 6.5 Archimedean Copulas

**Archimedean copulas** are a large and flexible family defined via a **generator function** \( \phi: [0,\infty) \to [0,1] \) that is completely monotone (i.e., \( (-1)^k \phi^{(k)}(t) \geq 0 \) for all \( k \geq 0 \) and \( t \geq 0 \)):

\[
C(u_1, \ldots, u_d) = \phi\!\left(\phi^{-1}(u_1) + \cdots + \phi^{-1}(u_d)\right).
\]

The most important Archimedean families in finance are:

**Clayton copula:** Generator \( \phi(t) = (1 + t)^{-1/\theta} \) for \( \theta > 0 \). This copula exhibits strong lower tail dependence (\( \lambda_L = 2^{-1/\theta} \)) but no upper tail dependence, making it suitable for modeling joint crash risk.

**Gumbel copula:** Generator \( \phi(t) = e^{-t^{1/\theta}} \) for \( \theta \geq 1 \). The Gumbel copula has strong upper tail dependence (\( \lambda_U = 2 - 2^{1/\theta} \)) but no lower tail dependence.

**Frank copula:** Generator \( \phi(t) = -\theta^{-1}\ln(1 - (1-e^{-\theta})e^{-t}) \) for \( \theta \in \mathbb{R} \setminus \{0\} \). The Frank copula is symmetric and has no tail dependence in either tail, but provides a flexible interior dependence structure.

Simulation from multivariate Archimedean copulas uses the **Marshall-Olkin algorithm**: generate a random variable \( V \) from the distribution with Laplace transform \( \phi \), then generate \( d \) independent exponential random variables \( E_1, \ldots, E_d \) with rate 1 and set \( U_i = \phi(E_i/V) \). For the Clayton copula, \( V \sim \mathrm{Gamma}(1/\theta, 1) \); for the Gumbel copula, \( V \) follows a positive stable distribution.

## 6.6 Copulas in Credit Risk: The Factor Model

The most widely used credit risk model is the **Gaussian one-factor copula model** underlying the Li formula. Each obligor \( i \) has an asset value \( A_i = \sqrt{\rho}\, M + \sqrt{1-\rho}\, Z_i \), where \( M \sim \mathcal{N}(0,1) \) is the common market factor and \( Z_i \sim \mathcal{N}(0,1) \) are idiosyncratic factors, all independent. Obligor \( i \) defaults if \( A_i < \Phi^{-1}(p_i) \), where \( p_i = F_i(T) \) is its marginal default probability by time \( T \). The joint default distribution is then a Gaussian copula with exchangeable correlation \( \rho \).

For CDO tranche pricing via Monte Carlo, one generates \( M \sim \mathcal{N}(0,1) \) and, for each obligor, generates \( Z_i \sim \mathcal{N}(0,1) \), computes \( A_i \), and checks if default occurs. The portfolio loss is \( L = \sum_{i: \text{default}} (1 - R_i) / N \), where \( R_i \) is the recovery rate. Importance sampling with an exponentially tilted distribution for \( M \) can dramatically reduce variance for senior tranche pricing.

---

# Chapter 7: Advanced and Specialized Topics

## 7.1 Markov Chain Monte Carlo Methods

**Markov chain Monte Carlo (MCMC)** methods provide a way to sample from distributions that are known only up to a normalizing constant — a common situation in Bayesian inference. In finance, MCMC arises in the Bayesian calibration of model parameters (e.g., estimating the posterior distribution of Heston parameters given observed option prices) and in filtering problems.

### 7.1.1 The Metropolis-Hastings Algorithm

The **Metropolis-Hastings (MH) algorithm** constructs a Markov chain whose stationary distribution is the target distribution \( \pi(\theta) \propto \ell(\theta) \pi_0(\theta) \), where \( \ell(\theta) \) is the likelihood and \( \pi_0 \) is the prior. Given the current state \( \theta^{(t)} \), the algorithm proceeds as follows.

First, propose a candidate \( \theta^* \) from a proposal distribution \( q(\cdot | \theta^{(t)}) \) (e.g., a random walk \( \theta^* = \theta^{(t)} + \epsilon \) with \( \epsilon \sim \mathcal{N}(0, \Sigma_q) \)). Second, compute the acceptance ratio

\[
\alpha(\theta^{(t)}, \theta^*) = \min\!\left(1, \frac{\pi(\theta^*) q(\theta^{(t)} | \theta^*)}{\pi(\theta^{(t)}) q(\theta^* | \theta^{(t)})}\right).
\]

Third, set \( \theta^{(t+1)} = \theta^* \) with probability \( \alpha \), and \( \theta^{(t+1)} = \theta^{(t)} \) otherwise.

<div class="theorem">
<strong>Theorem 7.1 (Stationary Distribution of MH).</strong> The Markov chain produced by the Metropolis-Hastings algorithm with target \( \pi \) and proposal \( q \) is reversible with respect to \( \pi \). That is, the detailed balance equation \( \pi(\theta) k(\theta, \theta') = \pi(\theta') k(\theta', \theta) \) holds for the transition kernel \( k \). Consequently, \( \pi \) is the stationary distribution of the chain, and under mild regularity conditions on \( q \), the chain is ergodic: for any integrable function \( g \),

\[
\frac{1}{T}\sum_{t=1}^T g(\theta^{(t)}) \to \mathbb{E}_\pi[g(\theta)] \quad \text{almost surely as } T \to \infty.
\]
</div>

The practical performance of the MH algorithm depends critically on the tuning of the proposal distribution. The **optimal scaling theory** (Roberts, Gelman, Gilks, 1997) shows that for a random walk MH with Gaussian proposals in dimension \( d \), the optimal acceptance rate is approximately \( 23.4\% \), and the optimal proposal standard deviation is \( 2.38 / \sqrt{d} \) times the posterior standard deviation in each coordinate.

### 7.1.2 The Gibbs Sampler

The **Gibbs sampler** is a special case of MH that is particularly well-suited to problems where the full conditional distributions \( \pi(\theta_j | \theta_{-j}) \) are easy to sample from. At each iteration, the algorithm cycles through the coordinates \( j = 1, \ldots, d \), drawing each coordinate from its full conditional:

\[
\theta_j^{(t+1)} \sim \pi\!\left(\theta_j \,\middle|\, \theta_1^{(t+1)}, \ldots, \theta_{j-1}^{(t+1)}, \theta_{j+1}^{(t)}, \ldots, \theta_d^{(t)}\right).
\]

The Gibbs sampler always accepts its proposals (the acceptance ratio equals 1), making it very efficient when the full conditionals are tractable. For Bayesian models with conjugate priors — such as the normal-inverse-Wishart prior for Gaussian models — the full conditionals are standard distributions.

In financial applications, MCMC is used for: (1) Bayesian parameter estimation of stochastic volatility models, where the unobserved volatility path is treated as a latent variable and sampled jointly with the model parameters (the **particle MCMC** or **data augmentation** approach); (2) pricing path-dependent derivatives under complex models where the state space is high-dimensional.

## 7.2 American Option Pricing: The Longstaff-Schwartz Algorithm

American options grant the holder the right to exercise at any time before maturity, making their valuation an **optimal stopping problem**. Let \( h(t, S_t) \) denote the immediate exercise value (e.g., \( (K - S_t)^+  \) for an American put). The American option price is

\[
V_0 = \sup_{\tau \in \mathcal{T}_{0,T}} \mathbb{E}^{\mathbb{Q}}\!\left[e^{-r\tau} h(\tau, S_\tau)\right],
\]

where the supremum is over all \( \mathcal{F} \)-stopping times \( \tau \) taking values in \( [0, T] \). The **Bellman equation** provides the recursive characterization:

\[
V_t = \max\!\left(h(t, S_t),\; e^{-r\delta} \mathbb{E}^{\mathbb{Q}}\!\left[V_{t+\delta} \,\middle|\, S_t\right]\right).
\]

The key quantity is the **continuation value** \( \mathcal{C}(t, S_t) = e^{-r\delta}\mathbb{E}^{\mathbb{Q}}[V_{t+\delta}|S_t] \): one should exercise if and only if \( h(t, S_t) \geq \mathcal{C}(t, S_t) \).

The **Longstaff-Schwartz (LS) algorithm** (2001) approximates the continuation value by regressing it on a set of basis functions of the current state. Specifically, working backwards from maturity, at each exercise date \( t_m \) one approximates

\[
\mathcal{C}(t_m, S_{t_m}) \approx \sum_{k=1}^K \beta_k^{(m)} \psi_k(S_{t_m}),
\]

where \( \psi_1, \ldots, \psi_K \) are chosen basis functions (e.g., \( 1, S, S^2, \ldots \) or Laguerre polynomials) and the coefficients \( \beta^{(m)} = (\beta_1^{(m)}, \ldots, \beta_K^{(m)}) \) are estimated by ordinary least squares using the simulated paths.

**Algorithm (Longstaff-Schwartz):**
1. Simulate \( n \) paths of \( (S_{t_0}, S_{t_1}, \ldots, S_{t_M}) \) from time 0 to maturity \( T = t_M \).
2. Initialize the cash flow matrix: at \( t_M \), set \( CF_i = h(T, S_{T,i}) \) for each path \( i \).
3. For \( m = M-1, M-2, \ldots, 1 \) (backwards):
   (a) Identify the paths \( \mathcal{I}_m = \{i : h(t_m, S_{t_m,i}) > 0\} \) on which early exercise is relevant.
   (b) For paths in \( \mathcal{I}_m \), compute the discounted future cash flows \( Y_i = e^{-r(t_{m^+} - t_m)} CF_i \), where \( m^+ \) is the next exercise time on path \( i \).
   (c) Regress \( Y_i \) on \( (\psi_k(S_{t_m,i}))_{k=1}^K \) to obtain \( \hat{\beta}^{(m)} \) and the fitted continuation value \( \hat{\mathcal{C}}_i = \sum_k \hat{\beta}_k^{(m)} \psi_k(S_{t_m,i}) \).
   (d) Update: for paths \( i \in \mathcal{I}_m \) with \( h(t_m, S_{t_m,i}) > \hat{\mathcal{C}}_i \), update \( CF_i \leftarrow h(t_m, S_{t_m,i}) \) and record exercise at \( t_m \).
4. Discount all cash flows to time 0: \( \hat{V}_0 = n^{-1}\sum_i e^{-r \tau_i} CF_i \), where \( \tau_i \) is the exercise time on path \( i \).

<div class="theorem">
<strong>Theorem 7.2 (Convergence of LS Algorithm).</strong> Under appropriate conditions on the basis functions and the payoff, the LS estimator converges to the true American option price as both the number of paths \( n \to \infty \) and the number of basis functions \( K \to \infty \). Specifically, the exercise boundary estimated by the LS algorithm converges to the true optimal stopping boundary, and the resulting price estimator is a lower bound on the true price. An upper bound can be computed by the dual approach of Andersen and Broadie (2004).
</div>

<div class="remark">
<strong>Remark 7.1.</strong> The LS algorithm produces a biased estimator because the exercise decision is estimated on the same paths used for pricing; this is the <em>in-sample</em> bias. A simple remedy is to use separate sets of paths for the regression (to estimate the stopping rule) and for the final pricing. The resulting <em>out-of-sample</em> estimator is unbiased conditional on the regression, and its variance can be estimated by the usual formula.
</div>

<div class="example">
<strong>Example 7.1 (American put under Black-Scholes).</strong> Consider an American put with \( S_0 = 100 \), \( K = 100 \), \( r = 0.05 \), \( \sigma = 0.20 \), \( T = 1 \), and \( M = 50 \) exercise dates. Using the LS algorithm with \( n = 50{,}000 \) paths and basis functions \( \{1, S, S^2, S^3\} \) (first four Laguerre polynomials normalized to the in-the-money region), one obtains \( \hat{V}_0 \approx 6.08 \) with standard error approximately \( 0.02 \). The benchmark finite-difference solution gives \( 6.09 \), confirming the accuracy of the LS algorithm.
</div>

## 7.3 Multilevel Monte Carlo

The **multilevel Monte Carlo (MLMC) method**, introduced by Giles (2008) building on earlier work by Heinrich, provides a principled way to balance the competing costs of statistical accuracy (requiring large \( n \)) and discretization accuracy (requiring small step size \( h \)) when simulating SDEs.

Consider a hierarchy of time grids with step sizes \( h_\ell = T \cdot 2^{-\ell} \) for levels \( \ell = 0, 1, \ldots, L \). Let \( \hat{Y}_\ell \) denote the estimator for \( \mathbb{E}[f(X_T)] \) computed using step size \( h_\ell \) on a single path. The key identity is the **telescoping sum**:

\[
\mathbb{E}[\hat{Y}_L] = \mathbb{E}[\hat{Y}_0] + \sum_{\ell=1}^L \mathbb{E}[\hat{Y}_\ell - \hat{Y}_{\ell-1}].
\]

The MLMC estimator approximates each term in this sum with \( n_\ell \) pairs of coupled paths (at level \( \ell \) and level \( \ell-1 \), coupled by sharing the same Brownian increments):

\[
\hat{\mu}_{\mathrm{MLMC}} = \frac{1}{n_0}\sum_{i=1}^{n_0} \hat{Y}_{0,i} + \sum_{\ell=1}^L \frac{1}{n_\ell}\sum_{i=1}^{n_\ell}\!\left(\hat{Y}_{\ell,i} - \hat{Y}_{\ell-1,i}\right).
\]

<div class="theorem">
<strong>Theorem 7.3 (Giles' MLMC Complexity Theorem).</strong> Let \( \alpha, \beta, \gamma > 0 \) be constants such that:
<ul style="margin:0.5em 0 0.5em 1.5em;">
  <li>Weak convergence: \( |\mathbb{E}[\hat{Y}_\ell] - \mathbb{E}[f(X_T)]| = O(h_\ell^\alpha) \).</li>
  <li>Variance decay: \( \mathrm{Var}(\hat{Y}_\ell - \hat{Y}_{\ell-1}) = O(h_\ell^\beta) \).</li>
  <li>Cost per sample: \( \mathcal{C}(\hat{Y}_\ell - \hat{Y}_{\ell-1}) = O(h_\ell^{-\gamma}) \).</li>
</ul>
If \( \beta > \gamma \), the total cost to achieve RMSE \( \varepsilon \) is \( O(\varepsilon^{-2}) \), the same as standard Monte Carlo but with a smaller constant. If \( \beta = \gamma \), the cost is \( O(\varepsilon^{-2}(\log\varepsilon)^2) \). If \( \beta < \gamma \), the cost is \( O(\varepsilon^{-2-(\gamma-\beta)/\alpha}) \), better than the \( O(\varepsilon^{-2-\gamma/\alpha}) \) cost of standard Monte Carlo.
</div>

For the Euler-Maruyama scheme applied to a smooth SDE, \( \alpha = 1 \), \( \beta = 1 \), \( \gamma = 1 \), giving case \( \beta = \gamma \) and cost \( O(\varepsilon^{-2}(\log \varepsilon)^2) \) — a dramatic improvement over the \( O(\varepsilon^{-3}) \) cost of standard Monte Carlo (which must use \( m = O(\varepsilon^{-1}) \) time steps to achieve bias \( O(\varepsilon) \) and \( n = O(\varepsilon^{-2}) \) paths for variance \( O(\varepsilon^2) \)).

For the Milstein scheme (\( \alpha = \beta = 1 \), but with a stronger variance decay of \( \beta = 2 \) under additional conditions), one achieves the optimal \( O(\varepsilon^{-2}) \) cost. Implementing the Milstein correction for multi-dimensional SDEs requires simulating the **Lévy areas** \( \int_0^h W_t^{(1)} dW_t^{(2)} \), which has no simple closed form and requires additional simulation or approximation.

The MLMC method has been extended to option pricing with discontinuous payoffs (where standard convergence theory breaks down), to nested simulation problems arising in risk measures like CVA, and to stochastic partial differential equations.

## 7.4 Sequential Monte Carlo and Particle Filters

**Sequential Monte Carlo (SMC)** methods, also known as **particle filters**, provide a framework for on-line Bayesian inference in state-space models of the form:

\[
X_t | X_{t-1} \sim f(x_t | x_{t-1}), \qquad Y_t | X_t \sim g(y_t | x_t),
\]

where \( X_t \) is the unobserved state (e.g., stochastic volatility) and \( Y_t \) is the observed data (e.g., asset returns). The goal is to compute the filtering distribution \( p(x_t | y_{1:t}) \) sequentially as new observations arrive.

The particle filter approximates the filtering distribution by a weighted empirical distribution \( \sum_{i=1}^N w_t^{(i)} \delta_{x_t^{(i)}} \), where the **particles** \( x_t^{(i)} \) are samples from some importance distribution and the **weights** \( w_t^{(i)} \) correct for the discrepancy between the importance distribution and the target.

**Bootstrap particle filter algorithm:**
1. Initialize: draw \( x_0^{(i)} \sim p(x_0) \) for \( i = 1, \ldots, N \) and set \( w_0^{(i)} = 1/N \).
2. For each time step \( t = 1, 2, \ldots \):
   (a) **Resample**: draw \( \tilde{x}_{t-1}^{(i)} \) from \( \{x_{t-1}^{(j)}, w_{t-1}^{(j)}\}_{j=1}^N \) with replacement, giving each particle equal weight \( 1/N \).
   (b) **Propagate**: draw \( x_t^{(i)} \sim f(\cdot | \tilde{x}_{t-1}^{(i)}) \) from the transition distribution.
   (c) **Weight**: set \( w_t^{(i)} \propto g(y_t | x_t^{(i)}) \) and normalize so \( \sum_i w_t^{(i)} = 1 \).
   (d) **Estimate**: approximate \( \mathbb{E}[h(X_t) | y_{1:t}] \approx \sum_i w_t^{(i)} h(x_t^{(i)}) \).

The resampling step prevents **weight degeneracy** — the collapse of all weight onto a single particle — which would otherwise occur exponentially fast in \( t \). The **effective sample size** \( \mathrm{ESS} = 1/\sum_i (w_t^{(i)})^2 \) quantifies weight degeneracy; resampling is typically triggered when \( \mathrm{ESS} < N/2 \).

In finance, particle filters are used for: (1) real-time estimation of the latent volatility path in stochastic volatility models; (2) filtering the state in regime-switching models; (3) calibration of complex models to multiple time series simultaneously.

<div class="remark">
<strong>Remark 7.2.</strong> The <strong>particle MCMC</strong> method of Andrieu, Doucet, and Holenstein (2010) combines particle filters with MCMC to enable joint inference over both the latent states and the model parameters. The particle filter provides an unbiased estimate of the likelihood \( p(y_{1:T} | \theta) \) which can be used inside an MH algorithm for \( \theta \), yielding exact posterior inference despite the intractability of the exact likelihood.
</div>

## 7.5 Variance Reduction in Advanced Settings

Several variance reduction ideas extend naturally to the advanced simulation contexts described above.

For the **LS algorithm**, a control variate can be incorporated by using the discounted payoff under a simplified (analytically tractable) stopping rule as the control. For instance, one can use the European option price as a control for the American option price, since the two are highly correlated and the European price is known analytically.

For **MLMC**, the variance at each level can be reduced by applying antithetic variates within each level: coupling the fine-grid path with an antithetically constructed fine-grid path ensures that the variance \( \mathrm{Var}(\hat{Y}_\ell - \hat{Y}_{\ell-1}) \) decays at an accelerated rate for certain payoffs.

For **particle filters**, one can use the **auxiliary particle filter** (Pitt and Shephard, 1999), which uses a look-ahead step to pre-weight the particles before resampling, concentrating computational effort on the particles most likely to survive the resampling step.

## 7.6 Monte Carlo for CVA and XVA

Credit Valuation Adjustment (**CVA**) represents the price adjustment to account for counterparty default risk in OTC derivative transactions. It is defined as

\[
\mathrm{CVA} = (1 - R) \int_0^T e^{-rs} \mathbb{E}^{\mathbb{Q}}\!\left[V^+(s)\right] d\mathbb{P}^D(s),
\]

where \( R \) is the recovery rate, \( V^+(s) = \max(V(s), 0) \) is the positive exposure at time \( s \), and \( \mathbb{P}^D(s) \) is the default probability of the counterparty at time \( s \). Computing CVA via Monte Carlo requires simulating both the market risk factors (determining \( V(s) \)) and the credit risk factors (determining the default time), typically under a joint model. The **nested simulation** problem — computing \( \mathbb{E}[V^+(s)] \) at each simulated default scenario — is computationally intensive and has motivated the development of **regression-based CVA** methods analogous to the LS algorithm.

---

## Appendix: Key Formulas and Convergence Summary

The following table summarizes the convergence rates of the main methods discussed in this course.

| Method | Error Rate | Cost for RMSE \( \varepsilon \) |
|--------|-----------|-------------------------------|
| Monte Carlo (exact simulation) | \( O(n^{-1/2}) \) | \( O(\varepsilon^{-2}) \) |
| Monte Carlo + Euler (balanced) | \( O(n^{-1/2}) \) | \( O(\varepsilon^{-3}) \) |
| Monte Carlo + Milstein | \( O(n^{-1/2}) \) | \( O(\varepsilon^{-2}\log\varepsilon^{-1}) \) |
| Multilevel MC + Euler | \( O(n^{-1/2}) \) | \( O(\varepsilon^{-2}(\log\varepsilon^{-1})^2) \) |
| Multilevel MC + Milstein | \( O(n^{-1/2}) \) | \( O(\varepsilon^{-2}) \) |
| QMC (smooth, dim \( s \)) | \( O((\log n)^s/n) \) | Better than MC for fixed \( s \) |
| RQMC + scrambled nets | \( O(n^{-3/2+\epsilon}) \) | Superlinear improvement |

For the Koksma-Hlawka bound: \( |\hat{\mu}_{\mathrm{QMC}} - \mu| \leq V(f) \cdot D_n^* \), and for a \((t,m,s)\)-net, \( D_n^* \leq C(s) (\log n)^{s-1} / n \). The optimal control variate coefficient is \( b^* = \mathrm{Cov}(Y,Z)/\mathrm{Var}(Z) \), achieving variance reduction \( 1/(1-\rho_{YZ}^2) \). The antithetic variance is \( (\mathrm{Var}(Y) + \mathrm{Cov}(Y,Y'))/2 \leq \mathrm{Var}(Y)/2 \) when \( \mathrm{Cov}(Y,Y') \leq 0 \).
