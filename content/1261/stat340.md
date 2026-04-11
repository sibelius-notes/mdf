---
title: "STAT 340: Stochastic Simulation Methods"
subjects: "STAT"
prof: "Erik Hintz"
---


## Sources and References

**Textbooks** — Ross, S. M. (2013), *Simulation*, 5th Edition; Law, A. M. (2014), *Simulation Modeling and Analysis*, 5th Edition; Ripley, B. D. (1987), *Stochastic Simulation*
**Advanced references** — Lemieux, C. (2009), *Monte Carlo and Quasi-Monte Carlo Sampling*; Asmussen, S. and Glynn, P. W. (2007), *Stochastic Simulation: Algorithms and Analysis*; Devroye, L. (1986), *Non-Uniform Random Variate Generation*
**Online resources** — MIT OCW simulation materials; Cambridge lecture notes on Monte Carlo methods

# Chapter 1: Introduction to Simulation

## 1.1 What Is Simulation?

A **simulation** is an imitation of a real-world process or system over time. One builds a **model** -- a set of assumptions about how a system operates, expressed as mathematical or logical relationships -- and then uses a computer to generate artificial histories of the system. By observing these histories one draws inferences about the operating characteristics of the real system.

Three key terms recur throughout the course:

- **System**: a collection of entities that interact over time to accomplish one or more goals.
- **Model**: an abstract representation of a system, typically involving variables, parameters, and equations that capture essential behaviour.
- **Simulation**: the process of running a model on a computer to produce output that can be analysed statistically.

Simulation is particularly valuable when the system is too complex for analytical treatment, when closed-form solutions do not exist, or when real-world experimentation is prohibitively expensive or dangerous.

### Deterministic vs. Stochastic Simulation

In a **deterministic** simulation all input quantities and relationships are fixed; running the model twice produces identical output. In a **stochastic** (or Monte Carlo) simulation at least some inputs are random, so each replication produces different output. Stochastic simulation is the focus of this course: it requires generating random numbers, transforming them into random variates from desired distributions, collecting output data, and performing statistical analysis on the results.

## 1.2 Overview of Monte Carlo Methods

<div class="definition">
<strong>Monte Carlo method.</strong> Any computational algorithm that relies on repeated random sampling to obtain numerical results. The name originates from the Monte Carlo casino in Monaco and was popularised by Stanislaw Ulam, John von Neumann, and Nicholas Metropolis during the Manhattan Project in the 1940s.
</div>

The central idea is deceptively simple. Suppose we wish to evaluate a quantity \(\theta\) that can be expressed as

\[
\theta = E[g(X)]
\]
for some random variable \(X\) with known distribution and some function \(g\). If we can generate independent realisations \(X_1, X_2, \ldots, X_n\) of \(X\), then the **sample mean**

\[
\hat{\theta}_n = \frac{1}{n}\sum_{i=1}^{n} g(X_i)
\]
is an unbiased estimator of \(\theta\), and the strong law of large numbers guarantees \(\hat{\theta}_n \to \theta\) almost surely as \(n \to \infty\).

Monte Carlo methods appear throughout science and engineering: evaluating high-dimensional integrals in physics, pricing financial derivatives, simulating queueing networks, assessing system reliability, performing Bayesian inference, and solving partial differential equations.

## 1.3 Floating-Point Arithmetic

Since all Monte Carlo methods are implemented on digital computers, understanding how computers represent numbers is essential. Errors introduced by finite-precision arithmetic can accumulate and corrupt simulation results if one is not careful.

### Binary Representation of Integers

Every non-negative integer \(n\) can be written uniquely in base 2 as

\[
n = \sum_{k=0}^{K} b_k \, 2^k, \qquad b_k \in \{0,1\}.
\]

<div class="example">
<strong>Example.</strong> The decimal number 13 in binary is \(1101_2\) because \(13 = 1\cdot 2^3 + 1\cdot 2^2 + 0\cdot 2^1 + 1\cdot 2^0 = 8 + 4 + 0 + 1\).
</div>

To convert a decimal integer to binary, one repeatedly divides by 2 and records the remainders from bottom to top.

### Binary Representation of Fractions

A real number between 0 and 1 can be expressed in binary as

\[
0.d_1 d_2 d_3 \cdots = \sum_{k=1}^{\infty} d_k \, 2^{-k}, \qquad d_k \in \{0,1\}.
\]
The procedure to convert a decimal fraction to binary is: multiply by 2, record the integer part as the next binary digit, keep the fractional part, and repeat.

<div class="example">
<strong>Example.</strong> Convert 0.375 to binary. Multiply 0.375 by 2 to get 0.75; integer part is 0. Multiply 0.75 by 2 to get 1.5; integer part is 1. Multiply 0.5 by 2 to get 1.0; integer part is 1. So \(0.375_{10} = 0.011_2\).
</div>

<div class="remark">
<strong>Remark.</strong> Many common decimal fractions (such as 0.1 or 0.2) do not have a finite binary representation. The decimal 0.1 in binary is \(0.0\overline{0011}_2\), repeating infinitely. This is analogous to how 1/3 has no finite decimal expansion.
</div>

### IEEE 754 Double Precision

Modern computers store floating-point numbers according to the IEEE 754 standard. A **double-precision** (64-bit) number uses:

| Component | Bits | Purpose |
|---|---|---|
| Sign | 1 | 0 for positive, 1 for negative |
| Exponent | 11 | Biased exponent (bias = 1023) |
| Mantissa (significand) | 52 | Fractional part of the normalised form |

A normalised double-precision number represents

\[
(-1)^{s} \times 1.d_1 d_2 \cdots d_{52} \times 2^{e - 1023}
\]
where the leading 1 before the binary point is implicit (the "hidden bit"), so the mantissa effectively has 53 bits of precision.

<div class="definition">
<strong>Machine epsilon.</strong> The smallest positive number \(\varepsilon_{\text{mach}}\) such that \(\text{fl}(1 + \varepsilon_{\text{mach}}) \neq 1\) in floating-point arithmetic. For double precision, \(\varepsilon_{\text{mach}} = 2^{-52} \approx 2.22 \times 10^{-16}\).
</div>

The range of representable doubles spans roughly \(2.2 \times 10^{-308}\) to \(1.8 \times 10^{308}\). Numbers smaller than the minimum are **underflow** and are typically rounded to zero; numbers larger than the maximum cause **overflow** and are set to infinity.

### Rounding Errors and Their Consequences

Floating-point arithmetic is not exact. Two important phenomena arise:

1. **Rounding error**: when a real number is stored in finite precision, it is rounded to the nearest representable value. The relative error satisfies \(|\text{fl}(x) - x|/|x| \leq \varepsilon_{\text{mach}}/2\).

2. **Catastrophic cancellation**: when two nearly equal numbers are subtracted, the leading significant digits cancel, and the result retains few meaningful digits.

<div class="example">
<strong>Example (catastrophic cancellation).</strong> Suppose \(a = 1.000000001\) and \(b = 1.000000000\). In exact arithmetic, \(a - b = 10^{-9}\). But if each is stored to only 10 significant digits, the difference may retain only 1 significant digit, dramatically amplifying relative error.
</div>

For simulation work, these considerations matter in several ways: random number generators involve modular arithmetic on integers (where exact integer arithmetic is essential), cumulative sums over many iterations can drift, and likelihood computations for rare events may underflow.

## 1.4 Motivation and Applications

Stochastic simulation is applied across a vast range of disciplines:

- **Finance**: pricing exotic options and computing risk measures (Value-at-Risk, CVaR) when closed-form solutions are unavailable.
- **Operations research**: modelling queueing systems (call centres, hospital emergency departments, manufacturing lines) to estimate waiting times and throughput.
- **Reliability engineering**: estimating system failure probabilities by simulating component lifetimes.
- **Bayesian statistics**: Markov chain Monte Carlo (MCMC) methods for posterior inference.
- **Physics**: simulating particle transport, Ising models, and molecular dynamics.

The power of simulation lies in its generality: if one can describe the probabilistic mechanism that governs a system, one can simulate it.

# Chapter 2: Pseudo-Random Number Generation

## 2.1 The Need for Random Numbers

Every stochastic simulation begins with a source of randomness. In principle one could use physical random devices (radioactive decay, thermal noise), but such **true** random number generators are slow and non-reproducible. Instead, simulation practitioners use **pseudo-random number generators** (PRNGs): deterministic algorithms that produce sequences of numbers which, for all practical purposes, appear to be independent realisations of a \(\text{Uniform}(0,1)\) distribution.

<div class="definition">
<strong>Pseudo-random number generator.</strong> A deterministic algorithm that, given an initial value (the <em>seed</em>), produces a sequence \(u_1, u_2, u_3, \ldots\) of numbers in \([0,1)\) that satisfies statistical tests for uniformity and independence.
</div>

### Properties of a Good PRNG

A high-quality PRNG should possess the following properties:

1. **Uniformity**: the output values should closely approximate a uniform distribution on \((0,1)\).
2. **Independence**: successive values should show no discernible correlation.
3. **Long period**: the sequence should not repeat for a very long time. Since the generator has finitely many internal states, it must eventually cycle; the length of this cycle is the **period**.
4. **Reproducibility**: given the same seed, the generator must produce the same sequence, enabling debugging and verification.
5. **Efficiency**: generating each number should require minimal computation.
6. **Portability**: the generator should produce identical results on different platforms.

## 2.2 Linear Congruential Generators

The most classical family of PRNGs is the **linear congruential generator** (LCG), introduced by D. H. Lehmer in 1951.

<div class="definition">
<strong>Linear congruential generator.</strong> Given integers \(a\) (the multiplier), \(c\) (the increment), \(m\) (the modulus), and \(x_0\) (the seed), define
\[
x_{n+1} = (a\, x_n + c) \bmod m, \qquad n = 0, 1, 2, \ldots
\]
The pseudo-random numbers on \([0,1)\) are then \(u_n = x_n / m\).
</div>

When \(c = 0\) the generator is called a **multiplicative** congruential generator. When \(c \neq 0\) it is called a **mixed** congruential generator.

### Modular Arithmetic Review

The operation \(a \bmod m\) returns the remainder when \(a\) is divided by \(m\). Formally, \(a \bmod m = a - m\lfloor a/m \rfloor\). Key properties:

- \((a + b) \bmod m = ((a \bmod m) + (b \bmod m)) \bmod m\)
- \((a \cdot b) \bmod m = ((a \bmod m) \cdot (b \bmod m)) \bmod m\)

These identities allow intermediate computations to be kept within range, preventing integer overflow.

<div class="example">
<strong>Example.</strong> Consider the LCG with \(a = 5\), \(c = 3\), \(m = 16\), and \(x_0 = 0\). The sequence is:
\[
x_1 = (5 \cdot 0 + 3) \bmod 16 = 3, \quad x_2 = (5 \cdot 3 + 3) \bmod 16 = 18 \bmod 16 = 2
\]
\[
x_3 = (5 \cdot 2 + 3) \bmod 16 = 13, \quad x_4 = (5 \cdot 13 + 3) \bmod 16 = 68 \bmod 16 = 4
\]
Continuing, the full cycle of length 16 is: 3, 2, 13, 4, 7, 6, 1, 8, 11, 10, 5, 12, 15, 14, 9, 0, and then it repeats. This generator achieves the maximum period \(m = 16\).
</div>

### Full-Period Conditions

<div class="theorem">
<strong>Hull--Dobell Theorem.</strong> The mixed LCG \(x_{n+1} = (ax_n + c) \bmod m\) has full period \(m\) (i.e., every value \(0, 1, \ldots, m-1\) appears exactly once before the sequence repeats) if and only if the following three conditions all hold:
<ol>
<li>\(\gcd(c, m) = 1\) (the increment and modulus are coprime).</li>
<li>If \(p\) is a prime factor of \(m\), then \(p \mid (a - 1)\) (i.e., \(a - 1\) is divisible by every prime factor of \(m\)).</li>
<li>If \(4 \mid m\), then \(4 \mid (a - 1)\).</li>
</ol>
</div>

For the multiplicative case (\(c = 0\)), the maximum achievable period is \(m - 1\) (since \(x_n = 0\) is an absorbing state). This maximum period is achieved when \(m\) is prime and \(a\) is a **primitive root** modulo \(m\), meaning the smallest positive integer \(k\) with \(a^k \equiv 1 \pmod{m}\) is \(k = m - 1\).

### Choice of Parameters

Historically popular choices include:

| Generator | \(a\) | \(c\) | \(m\) | Period |
|---|---|---|---|---|
| RANDU (IBM) | 65539 | 0 | \(2^{31}\) | \(2^{29}\) |
| MINSTD (Park--Miller) | 16807 | 0 | \(2^{31} - 1\) | \(2^{31} - 2\) |
| Numerical Recipes | 1664525 | 1013904223 | \(2^{32}\) | \(2^{32}\) |

<div class="remark">
<strong>Remark.</strong> RANDU is a notorious example of a bad generator. Its outputs, when viewed in consecutive triples \((u_i, u_{i+1}, u_{i+2})\), fall on just 15 parallel planes in the unit cube, revealing severe lattice structure. This demonstrates that passing simple one-dimensional tests is not sufficient; higher-dimensional structure must also be examined.
</div>

## 2.3 Lattice Structure and Spectral Test

Every LCG has an inherent **lattice structure**: the \(d\)-tuples \((u_i, u_{i+1}, \ldots, u_{i+d-1})\) lie on a finite number of parallel hyperplanes in the \(d\)-dimensional unit cube. The **spectral test** (introduced by Coveyou and MacPherson in 1967) measures the maximum distance between adjacent hyperplanes. A good generator has small inter-plane distances in all dimensions up to at least \(d = 6\).

## 2.4 The Mersenne Twister

The **Mersenne Twister** (MT19937), developed by Makoto Matsumoto and Takuji Nishimura in 1998, is the default PRNG in many software packages including R, Python, and MATLAB. Its key properties are:

- Period of \(2^{19937} - 1\), a Mersenne prime (hence the name).
- Equidistributed in 623 consecutive dimensions up to 32-bit accuracy.
- Uses a 624-element array of 32-bit integers as its internal state.
- Passes most standard statistical tests for randomness.

The algorithm works with a **linear recurrence over \(\mathbb{F}_2\)** (the field with two elements). At each step it combines three state words using bitwise XOR and shift operations, then applies a tempering transformation to improve the statistical properties of the output.

<div class="remark">
<strong>Remark.</strong> Despite its excellent properties, the Mersenne Twister is <em>not</em> suitable for cryptographic applications because observing 624 consecutive outputs allows one to reconstruct the full internal state and predict all future outputs. For cryptographic purposes, one uses generators based on number-theoretic problems (e.g., Blum--Blum--Shub).
</div>

## 2.5 Testing Randomness

No deterministic generator is truly random, so we subject PRNGs to a battery of statistical tests. The null hypothesis is always that the generated values are iid \(\text{Uniform}(0,1)\).

### Chi-Squared Goodness-of-Fit Test

Partition \([0,1)\) into \(k\) equal subintervals. Generate \(n\) values and let \(O_j\) be the observed count in the \(j\)-th subinterval. The expected count is \(E_j = n/k\). The test statistic is

\[
\chi^2 = \sum_{j=1}^{k} \frac{(O_j - E_j)^2}{E_j}.
\]
Under the null hypothesis, \(\chi^2 \sim \chi^2_{k-1}\) approximately for large \(n\). We reject uniformity if \(\chi^2\) is too large (or, for the purpose of testing PRNGs, also if it is suspiciously small, which indicates too-perfect regularity).

<div class="example">
<strong>Example.</strong> Generate \(n = 1000\) values and partition \([0,1)\) into \(k = 10\) subintervals. Suppose the observed counts are (95, 102, 108, 97, 100, 103, 99, 96, 101, 99). Then \(E_j = 100\) for all \(j\), and
\[
\chi^2 = \frac{(95-100)^2}{100} + \frac{(102-100)^2}{100} + \cdots + \frac{(99-100)^2}{100} = \frac{25+4+64+9+0+9+1+16+1+1}{100} = 1.30.
\]
With 9 degrees of freedom, \(\chi^2_{0.95, 9} = 16.92\), so we do not reject uniformity.
</div>

### Serial Test (Pairs Test)

The serial test checks for independence between consecutive values. Partition \([0,1)^2\) into \(k^2\) cells and count how many of the pairs \((u_i, u_{i+1})\) fall into each cell. Apply a chi-squared test with \(k^2 - 1\) degrees of freedom.

### Runs Test

A **run** is a maximal sequence of consecutive values that are all increasing (a run up) or all decreasing (a run down). Under true independence, the expected number and lengths of runs follow known distributions. Let \(R\) be the total number of runs (up and down combined) in a sequence of \(n\) values. For large \(n\),

\[
E[R] = \frac{2n - 1}{3}, \qquad \text{Var}(R) = \frac{16n - 29}{90}.
\]
The standardised statistic \(Z = (R - E[R])/\sqrt{\text{Var}(R)}\) is approximately \(N(0,1)\).

### The Spectral Test

The **spectral test** (Coveyou and MacPherson, 1967) is the definitive test for evaluating the global structure of an LCG. Since all points \((u_n, u_{n+1}, \ldots, u_{n+s-1})\) generated by an LCG lie on a family of parallel hyperplanes in \([0,1)^s\), the spectral test measures the maximum distance \(\nu_s\) between adjacent hyperplanes.

<div class="definition">
<strong>Definition (spectral test figure of merit).</strong> For an LCG with modulus \(m\), the spectral test figure of merit in dimension \(s\) is \(\nu_s\), the largest possible distance between adjacent hyperplanes among all families of parallel hyperplanes that contain all lattice points. Smaller \(\nu_s\) means the points are more uniformly spread in dimension \(s\).
</div>

A commonly cited benchmark is \(\nu_s \leq m^{-1/s}/2\), which corresponds to a grid spacing comparable to what one would expect from a good uniform distribution in dimension \(s\). The figure of merit \(\mu_s = \nu_s \cdot m^{1/s}\) is normalised so that \(\mu_s \approx 1\) for a good generator.

The spectral test reveals a fundamental limitation of LCGs: in dimension \(s\), the generated vectors lie in at most \(m^{1/s}\) hyperplanes. For double precision with \(m \approx 2^{64}\), this gives at most \(2^{64/s}\) hyperplanes in dimension \(s\), which quickly becomes inadequate for large \(s\). This is why the Mersenne Twister, which passes the spectral test in 623 dimensions, is preferred for serious simulation work.

<div class="example">
<strong>Randu generator (cautionary tale).</strong> The generator \(x_{n+1} = 65539\, x_n \bmod 2^{31}\) was widely used in the 1960s-70s. Despite passing the chi-squared test, its spectral test reveals that all triples \((u_n, u_{n+1}, u_{n+2})\) fall on just 15 planes in \(\mathbb{R}^3\), a catastrophic failure. Statistical results from RANDU-based simulations from that era are considered unreliable.
</div>

### TestU01 and Modern Test Suites

L'Ecuyer and Simard's **TestU01** package provides over 80 statistical tests organised into batteries:

- **SmallCrush** (10 tests, \(\approx 4\) seconds): a quick screen for obvious flaws.
- **Crush** (96 tests, \(\approx 1.5\) hours): a thorough examination.
- **BigCrush** (106 tests, \(\approx 6\) hours): the most demanding battery.

Modern generators (PCG, xorshift\({}^{**}\), Mersenne Twister) pass all BigCrush tests. LCGs with small moduli routinely fail Crush. TestU01 is the current gold standard for PRNG evaluation.

### Other Tests

Additional tests used in comprehensive test suites include:

- **Gap test**: examines the lengths of gaps between successive values falling in a specified subinterval.
- **Poker test**: groups digits into "hands" and checks their frequency.
- **Birthday spacings test**: looks at the distribution of spacings between sorted output values.
- **Kolmogorov--Smirnov test**: compares the empirical CDF of the generated values to the uniform CDF.

# Chapter 3: Random Variate Generation

## 3.1 The Inverse Transform Method

The inverse transform method is the most fundamental technique for generating random variates from non-uniform distributions. It rests on a simple but powerful probability result.

<div class="theorem">
<strong>Inverse Transform Theorem.</strong> Let \(F\) be a cumulative distribution function and define the generalised inverse (quantile function)
\[
F^{-1}(u) = \inf\{x : F(x) \geq u\}, \qquad 0 < u < 1.
\]
If \(U \sim \text{Uniform}(0,1)\), then \(X = F^{-1}(U)\) has CDF \(F\).
</div>

<div class="proof">
<strong>Proof.</strong> We need to show \(P(X \leq x) = F(x)\). Since \(F\) is non-decreasing, the event \(\{F^{-1}(U) \leq x\}\) is equivalent to \(\{U \leq F(x)\}\). (To see this: if \(F^{-1}(U) \leq x\), then by definition of \(F^{-1}\), \(U \leq F(x)\) because \(F\) is non-decreasing. Conversely, if \(U \leq F(x)\), then \(F^{-1}(U) \leq x\) by the definition of the infimum.) Therefore
\[
P(X \leq x) = P(F^{-1}(U) \leq x) = P(U \leq F(x)) = F(x),
\]
where the last equality uses the fact that \(U\) is uniform on \((0,1)\).
</div>

### Algorithm for Continuous Distributions

To generate a random variate \(X\) with continuous CDF \(F\):

1. Generate \(U \sim \text{Uniform}(0,1)\).
2. Return \(X = F^{-1}(U)\).

<div class="example">
<strong>Example (Exponential distribution).</strong> If \(X \sim \text{Exp}(\lambda)\), then \(F(x) = 1 - e^{-\lambda x}\) for \(x \geq 0\). Setting \(u = 1 - e^{-\lambda x}\) and solving for \(x\) gives \(x = -\ln(1-u)/\lambda\). Since \(1-U\) has the same distribution as \(U\) when \(U \sim \text{Uniform}(0,1)\), we can use
\[
X = -\frac{\ln U}{\lambda}.
\]
Numerically: if \(\lambda = 2\) and \(U = 0.3\), then \(X = -\ln(0.3)/2 = 1.2040/2 = 0.6020\).
</div>

<div class="example">
<strong>Example (Weibull distribution).</strong> If \(X \sim \text{Weibull}(\alpha, \beta)\), then \(F(x) = 1 - e^{-(x/\beta)^\alpha}\). Inverting: \(X = \beta(-\ln U)^{1/\alpha}\).
</div>

### Inverse Transform for Discrete Distributions

For a discrete random variable \(X\) taking values \(x_1 < x_2 < x_3 < \cdots\) with PMF \(p(x_i)\) and CDF \(F(x_i) = \sum_{j \leq i} p(x_j)\):

1. Generate \(U \sim \text{Uniform}(0,1)\).
2. Return \(X = x_i\) where \(i\) is the smallest index such that \(U \leq F(x_i)\).

Equivalently, set \(X = x_i\) if \(F(x_{i-1}) < U \leq F(x_i)\), with the convention \(F(x_0) = 0\).

<div class="example">
<strong>Example.</strong> Suppose \(X\) has PMF \(P(X=1) = 0.25\), \(P(X=2) = 0.40\), \(P(X=3) = 0.35\). The CDF values are \(F(1) = 0.25\), \(F(2) = 0.65\), \(F(3) = 1.00\). If \(U = 0.52\), then \(F(1) = 0.25 < 0.52 \leq 0.65 = F(2)\), so \(X = 2\).
</div>

<div class="example">
<strong>Example (Geometric distribution).</strong> If \(X \sim \text{Geometric}(p)\) with \(P(X = k) = (1-p)^{k-1}p\) for \(k = 1, 2, \ldots\), the CDF is \(F(k) = 1 - (1-p)^k\). Setting \(U = 1 - (1-p)^k\) and solving: \(k = \lceil \ln(1-U)/\ln(1-p) \rceil = \lceil \ln U / \ln(1-p) \rceil\).
</div>

## 3.2 The Acceptance-Rejection Method

When the inverse CDF is not available in closed form (or is expensive to compute), the **acceptance-rejection** (AR) method provides an elegant alternative. It was introduced by John von Neumann in 1951.

<div class="theorem">
<strong>Acceptance-Rejection Theorem.</strong> Suppose we wish to generate \(X\) with density \(f\). Let \(g\) be another density from which we can easily generate, and suppose there exists a constant \(c \geq 1\) such that
\[
f(x) \leq c\, g(x) \quad \text{for all } x.
\]
Then the following algorithm produces a variate with density \(f\):
<ol>
<li>Generate \(Y\) from density \(g\).</li>
<li>Generate \(U \sim \text{Uniform}(0,1)\), independent of \(Y\).</li>
<li>If \(U \leq f(Y)/(c\, g(Y))\), accept \(X = Y\). Otherwise, return to step 1.</li>
</ol>
The expected number of iterations until acceptance is \(c\).
</div>

<div class="proof">
<strong>Proof of correctness.</strong> We need to show the accepted \(Y\) has density \(f\). The probability of acceptance is
\[
P(\text{accept}) = P\!\left(U \leq \frac{f(Y)}{c\,g(Y)}\right) = \int_{-\infty}^{\infty} \frac{f(y)}{c\,g(y)}\, g(y)\, dy = \frac{1}{c}\int_{-\infty}^{\infty} f(y)\, dy = \frac{1}{c}.
\]
The conditional density of the accepted value at \(x\) is, by Bayes' theorem,

\[
\frac{g(x) \cdot \frac{f(x)}{c\,g(x)}}{1/c} = f(x).
\]
Since each trial is independent and succeeds with probability \(1/c\), the number of trials until acceptance is \(\text{Geometric}(1/c)\) with mean \(c\).
</div>

<div class="remark">
<strong>Remark.</strong> Efficiency demands choosing \(g\) to be close in shape to \(f\), making \(c = \sup_x f(x)/g(x)\) as small as possible (ideally close to 1). A poorly chosen proposal density leads to a large \(c\) and many rejections.
</div>

<div class="example">
<strong>Example (generating Beta(2,1) variates).</strong> The density is \(f(x) = 2x\) for \(0 < x < 1\). Use \(g(x) = 1\) (uniform on \((0,1)\)) as the proposal. The bounding constant is \(c = \sup_{0<x<1} f(x)/g(x) = 2\). Algorithm: generate \(Y \sim U(0,1)\) and \(U \sim U(0,1)\); accept \(X = Y\) if \(U \leq f(Y)/(c \cdot 1) = Y\). On average, 2 iterations are needed per accepted variate.
</div>

<div class="example">
<strong>Example (generating standard normal variates via AR).</strong> One classical method uses the double exponential (Laplace) distribution with density \(g(x) = \frac{1}{2}e^{-|x|}\) as the proposal. The standard normal density is \(f(x) = \frac{1}{\sqrt{2\pi}}e^{-x^2/2}\). One can show \(c = \sup_x f(x)/g(x) = \sqrt{2e/\pi} \approx 1.3155\). The acceptance condition simplifies to: generate \(Y\) from the Laplace distribution, accept if \(U \leq \exp(-(|Y|-1)^2/2)\). The average number of trials per accepted variate is about 1.32, which is quite efficient.
</div>

## 3.3 Composition and Table Look-Up Methods

### Composition (Mixture) Method

If the target density can be written as a **mixture**

\[
f(x) = \sum_{j=1}^{k} p_j \, f_j(x), \qquad p_j \geq 0, \quad \sum_{j=1}^{k} p_j = 1,
\]
where each component density \(f_j\) is easy to sample from, then:

1. Generate an index \(J\) with \(P(J = j) = p_j\).
2. Generate \(X\) from density \(f_J\).

The resulting \(X\) has density \(f\).

<div class="example">
<strong>Example.</strong> The Laplace (double exponential) density \(f(x) = \frac{1}{2}e^{-|x|}\) can be decomposed as a 50-50 mixture of an \(\text{Exp}(1)\) density on \((0,\infty)\) and a reflected \(\text{Exp}(1)\) density on \((-\infty, 0)\). To sample: flip a fair coin; if heads, generate \(X = -\ln U\); if tails, generate \(X = \ln U\).
</div>

### Table Look-Up (Alias Method)

For discrete distributions with finitely many outcomes, the **alias method** (due to A. J. Walker, 1977) allows sampling in \(O(1)\) time after an \(O(k)\) preprocessing step, where \(k\) is the number of possible values.

The idea is to construct a table with \(k\) entries, each containing a probability \(q_j\) and an "alias" index \(a_j\). To generate a variate:

1. Generate an integer \(J\) uniformly from \(\{1, 2, \ldots, k\}\).
2. Generate \(U \sim \text{Uniform}(0,1)\).
3. If \(U \leq q_J\), return \(J\); otherwise return \(a_J\).

The preprocessing step constructs the table so that the correct PMF is reproduced. This method is particularly valuable when many variates from the same distribution are needed.

## 3.4 Generating from Specific Distributions

### Normal Distribution

Several specialised methods exist for generating standard normal variates:

The **Box--Muller transform** generates two independent standard normals from two independent uniforms. If \(U_1, U_2 \sim \text{Uniform}(0,1)\), then

\[
Z_1 = \sqrt{-2\ln U_1}\,\cos(2\pi U_2), \qquad Z_2 = \sqrt{-2\ln U_1}\,\sin(2\pi U_2)
\]
are independent \(N(0,1)\) random variables.

<div class="proof">
<strong>Proof sketch.</strong> Set \(R^2 = -2\ln U_1\) and \(\Theta = 2\pi U_2\). Since \(U_1 \sim \text{Uniform}(0,1)\), we have \(R^2 \sim \text{Exp}(1/2)\), i.e., \(R^2\) has a chi-squared distribution with 2 degrees of freedom. Since \(\Theta \sim \text{Uniform}(0, 2\pi)\) and is independent of \(R\), the pair \((R, \Theta)\) represents polar coordinates of a point whose Cartesian coordinates \((Z_1, Z_2)\) are independent standard normals. This follows from the fact that the standard bivariate normal density is rotationally symmetric.
</div>

The **Polar method** (Marsaglia, 1964) avoids the costly trigonometric evaluations in Box--Muller. Generate \(V_1, V_2\) independently from \(\text{Uniform}(-1, 1)\). Compute \(S = V_1^2 + V_2^2\). If \(S \geq 1\), reject and repeat. Otherwise set

\[
Z_1 = V_1 \sqrt{\frac{-2\ln S}{S}}, \qquad Z_2 = V_2 \sqrt{\frac{-2\ln S}{S}}.
\]
The acceptance probability is \(\pi/4 \approx 0.785\).

### Gamma Distribution

For \(X \sim \text{Gamma}(\alpha, 1)\) with integer \(\alpha\), the sum-of-exponentials method works: \(X = -\sum_{i=1}^{\alpha} \ln U_i\). For non-integer \(\alpha > 1\), acceptance-rejection methods are used. A widely-used algorithm is due to Ahrens and Dieter (1974).

For \(\alpha < 1\), one can use the identity: if \(Y \sim \text{Gamma}(\alpha + 1, 1)\) and \(U \sim \text{Uniform}(0,1)\) are independent, then \(X = Y \cdot U^{1/\alpha} \sim \text{Gamma}(\alpha, 1)\).

### Poisson Distribution

For \(X \sim \text{Poisson}(\lambda)\), the inverse transform via the CDF is natural: starting from \(p = e^{-\lambda}\), \(F = p\), and \(x = 0\), generate \(U\); while \(U > F\), update \(p \leftarrow p \cdot \lambda / (x+1)\), \(F \leftarrow F + p\), and \(x \leftarrow x + 1\). Return \(x\). This is efficient for small \(\lambda\) but slow for large \(\lambda\), where one switches to acceptance-rejection or normal approximation methods.

## 3.5 Generating Multivariate Distributions

### Multivariate Normal

To generate \(\mathbf{X} \sim N(\boldsymbol{\mu}, \boldsymbol{\Sigma})\) in \(\mathbb{R}^d\):

1. Compute the **Cholesky decomposition** \(\boldsymbol{\Sigma} = \mathbf{L}\mathbf{L}^T\), where \(\mathbf{L}\) is lower triangular.
2. Generate \(\mathbf{Z} = (Z_1, \ldots, Z_d)^T\) with each \(Z_i \sim N(0,1)\) independently.
3. Set \(\mathbf{X} = \boldsymbol{\mu} + \mathbf{L}\mathbf{Z}\).

Then \(E[\mathbf{X}] = \boldsymbol{\mu}\) and \(\text{Cov}(\mathbf{X}) = \mathbf{L}\, E[\mathbf{Z}\mathbf{Z}^T]\, \mathbf{L}^T = \mathbf{L}\mathbf{I}\mathbf{L}^T = \boldsymbol{\Sigma}\).

<div class="example">
<strong>Example.</strong> Generate \((X_1, X_2)^T \sim N\!\left(\binom{0}{0}, \begin{pmatrix} 1 & 0.6 \\ 0.6 & 1 \end{pmatrix}\right)\). The Cholesky factor is
\[
\mathbf{L} = \begin{pmatrix} 1 & 0 \\ 0.6 & 0.8 \end{pmatrix}.
\]
Generate \(Z_1, Z_2 \sim N(0,1)\) independently. Then \(X_1 = Z_1\) and \(X_2 = 0.6\, Z_1 + 0.8\, Z_2\). If \(Z_1 = 0.5\) and \(Z_2 = -1.2\), then \(X_1 = 0.5\) and \(X_2 = 0.6(0.5) + 0.8(-1.2) = 0.30 - 0.96 = -0.66\).
</div>

### Conditional Distribution Method

For a random vector \((X_1, X_2, \ldots, X_d)\), one can factorise the joint density using the chain rule of probability:

\[
f(x_1, \ldots, x_d) = f_1(x_1)\, f_2(x_2 \mid x_1)\, f_3(x_3 \mid x_1, x_2) \cdots f_d(x_d \mid x_1, \ldots, x_{d-1}).
\]
Sample \(X_1\) from its marginal, then \(X_2\) from its conditional given \(X_1\), and so on.

## 3.6 Copulas

A **copula** provides a way to model the dependence structure between random variables separately from their marginal distributions. This is invaluable in finance, insurance, and risk management.

<div class="theorem">
<strong>Sklar's Theorem.</strong> Let \(F\) be a joint CDF with marginals \(F_1, \ldots, F_d\). Then there exists a copula \(C : [0,1]^d \to [0,1]\) such that
\[
F(x_1, \ldots, x_d) = C(F_1(x_1), \ldots, F_d(x_d)).
\]
If the marginals are continuous, then \(C\) is unique. Conversely, for any copula \(C\) and any marginal CDFs \(F_1, \ldots, F_d\), the function above defines a valid joint CDF.
</div>

### Gaussian Copula

The Gaussian copula is derived from the multivariate normal distribution. If \(\mathbf{R}\) is a correlation matrix, the Gaussian copula is

\[
C_R^{\text{Ga}}(u_1, \ldots, u_d) = \Phi_R(\Phi^{-1}(u_1), \ldots, \Phi^{-1}(u_d)),
\]
where \(\Phi_R\) is the CDF of the standard multivariate normal with correlation \(\mathbf{R}\) and \(\Phi^{-1}\) is the standard normal quantile function.

To sample from a Gaussian copula with given marginals \(F_1, \ldots, F_d\):

1. Generate \(\mathbf{Z} \sim N(\mathbf{0}, \mathbf{R})\) using the Cholesky method.
2. Set \(U_i = \Phi(Z_i)\) for \(i = 1, \ldots, d\). The vector \((U_1, \ldots, U_d)\) has the Gaussian copula.
3. Set \(X_i = F_i^{-1}(U_i)\) to obtain the desired marginals.

### Student-\(t\) Copula

The \(t\) copula allows for heavier tails and stronger tail dependence than the Gaussian copula. If \(\mathbf{R}\) is a correlation matrix and \(\nu > 0\) is the degrees of freedom:

1. Generate \(\mathbf{Z} \sim N(\mathbf{0}, \mathbf{R})\).
2. Generate \(W \sim \chi^2_\nu / \nu\) independently.
3. Set \(\mathbf{T} = \mathbf{Z}/\sqrt{W}\). Each \(T_i\) has a univariate \(t_\nu\) distribution.
4. Set \(U_i = t_\nu(T_i)\) where \(t_\nu\) is the CDF of the \(t_\nu\) distribution.
5. Set \(X_i = F_i^{-1}(U_i)\).

### Archimedean Copulas

An **Archimedean copula** has the form

\[
C(u_1, \ldots, u_d) = \psi(\psi^{-1}(u_1) + \cdots + \psi^{-1}(u_d)),
\]
where \(\psi : [0, \infty) \to [0, 1]\) is a **generator** function satisfying \(\psi(0) = 1\), \(\psi(\infty) = 0\), and appropriate monotonicity conditions.

Common examples include:

| Family | Generator \(\psi(t)\) | Parameter |
|---|---|---|
| Clayton | \((1 + t)^{-1/\theta}\) | \(\theta > 0\) |
| Gumbel | \(\exp(-t^{1/\theta})\) | \(\theta \geq 1\) |
| Frank | \(-\frac{1}{\theta}\ln\!\left(1 + e^{-t}(e^{-\theta} - 1)\right)\) | \(\theta \neq 0\) |

Sampling from Archimedean copulas in two dimensions can be done using the conditional method: generate \(U_1 \sim \text{Uniform}(0,1)\), then generate \(U_2\) from the conditional distribution \(C(u_2 \mid u_1) = \partial C / \partial u_1\) evaluated at \(u_1\).

## 3.7 Simulating Stochastic Processes

### Brownian Motion

A **standard Brownian motion** (Wiener process) \(\{W(t) : t \geq 0\}\) satisfies: (i) \(W(0) = 0\), (ii) the increments \(W(t) - W(s) \sim N(0, t-s)\) for \(0 \leq s < t\), and (iii) non-overlapping increments are independent.

To simulate \(W\) at times \(0 = t_0 < t_1 < \cdots < t_n\):

1. For \(i = 1, \ldots, n\), generate \(Z_i \sim N(0,1)\) independently.
2. Set \(W(t_i) = W(t_{i-1}) + \sqrt{t_i - t_{i-1}}\, Z_i\).

For equal spacing \(\Delta t = t_i - t_{i-1}\), this reduces to \(W(t_i) = W(t_{i-1}) + \sqrt{\Delta t}\, Z_i\).

<div class="example">
<strong>Example.</strong> Simulate Brownian motion at times \(t = 0, 0.25, 0.50, 0.75, 1.0\). We have \(\Delta t = 0.25\) and \(\sqrt{\Delta t} = 0.5\). Suppose the standard normals are \(Z_1 = 0.31, Z_2 = -1.15, Z_3 = 0.72, Z_4 = 0.44\). Then:
\[
W(0.25) = 0 + 0.5(0.31) = 0.155
\]
\[
W(0.50) = 0.155 + 0.5(-1.15) = -0.420
\]
\[
W(0.75) = -0.420 + 0.5(0.72) = -0.060
\]
\[
W(1.00) = -0.060 + 0.5(0.44) = 0.160
\]
</div>

**Geometric Brownian motion** (used in the Black--Scholes model for stock prices) is

\[
S(t) = S(0)\exp\!\left(\left(\mu - \tfrac{\sigma^2}{2}\right)t + \sigma W(t)\right),
\]
where \(\mu\) is the drift and \(\sigma\) is the volatility.

### Poisson Process

A **Poisson process** \(\{N(t) : t \geq 0\}\) with rate \(\lambda\) satisfies: (i) \(N(0) = 0\), (ii) independent increments, and (iii) \(N(t) - N(s) \sim \text{Poisson}(\lambda(t-s))\) for \(s < t\).

The key simulation insight is that the inter-arrival times \(T_1, T_2, \ldots\) are iid \(\text{Exp}(\lambda)\). To simulate the arrival times on \([0, T]\):

1. Set \(t = 0\), \(n = 0\).
2. Generate \(U \sim \text{Uniform}(0,1)\) and set \(t \leftarrow t - \ln(U)/\lambda\).
3. If \(t > T\), stop. Otherwise, \(n \leftarrow n + 1\), record \(S_n = t\), and return to step 2.

For a **non-homogeneous Poisson process** with time-varying rate \(\lambda(t) \leq \lambda^*\), one can use **thinning** (Lewis and Shedler, 1979): generate arrivals from a homogeneous Poisson process at rate \(\lambda^*\), then independently accept each arrival at time \(t\) with probability \(\lambda(t)/\lambda^*\).

# Chapter 4: Monte Carlo Estimation

## 4.1 Monte Carlo Estimators for Integrals

The fundamental Monte Carlo integration problem is to estimate

\[
\theta = \int_a^b h(x)\, dx.
\]
By writing \(\theta = (b-a)\, E[h(U)]\) where \(U \sim \text{Uniform}(a,b)\), the **sample-mean estimator** is

\[
\hat{\theta}_n = \frac{b-a}{n}\sum_{i=1}^{n} h(U_i), \qquad U_i \sim \text{Uniform}(a,b) \text{ iid}.
\]

More generally, to estimate \(\theta = E[g(X)]\) where \(X\) has density \(f\), we generate \(X_1, \ldots, X_n\) iid from \(f\) and compute

\[
\hat{\theta}_n = \frac{1}{n}\sum_{i=1}^{n} g(X_i).
\]

### Multidimensional Integration

A major advantage of Monte Carlo over deterministic quadrature rules is its **dimension independence**. For a standard Gaussian quadrature rule over \([0,1]^s\) with \(k\) points per dimension, the total number of function evaluations is \(k^s\), which grows exponentially with dimension (the **curse of dimensionality**). In contrast, the MC estimator

\[
\hat\theta = \frac{1}{n}\sum_{i=1}^n g(\boldsymbol{X}_i), \qquad \boldsymbol{X}_i \sim f_{\boldsymbol{X}},
\]
achieves standard error \(\sigma/\sqrt{n}\) regardless of dimension, where \(\sigma^2 = \text{Var}(g(\boldsymbol{X}))\). For \(s = 10\), even 10 points per dimension requires \(10^{10}\) function evaluations, while MC can achieve a 1% relative error with roughly \(10^4/\sigma^2\) samples.

This advantage makes Monte Carlo the method of choice for integrals over more than 3--4 dimensions, which arise naturally in Bayesian posterior computations, high-dimensional finance models, and particle transport simulations.

### Hit-or-Miss Estimator

An alternative approach for estimating \(\theta = \int_0^1 h(x)\, dx\) (assuming \(0 \leq h(x) \leq 1\)) uses the geometric interpretation:

1. Generate \((U_1, U_2)\) uniformly on the unit square \([0,1]^2\).
2. If \(U_2 \leq h(U_1)\), count a "hit."

Then \(\hat{\theta}_n = (\text{number of hits})/n\) is an unbiased estimator because \(P(U_2 \leq h(U_1)) = \int_0^1 h(x)\, dx = \theta\).

<div class="theorem">
<strong>Comparison of estimators.</strong> The sample-mean estimator always has variance no larger than the hit-or-miss estimator. Specifically,
\[
\text{Var}(\hat{\theta}_{\text{SM}}) = \frac{1}{n}\left(\int_0^1 h(x)^2\, dx - \theta^2\right), \qquad \text{Var}(\hat{\theta}_{\text{HM}}) = \frac{\theta(1-\theta)}{n}.
\]
Since \(\int_0^1 h(x)^2\, dx \leq \int_0^1 h(x)\, dx = \theta\) when \(0 \leq h \leq 1\), we have \(\text{Var}(\hat{\theta}_{\text{SM}}) \leq \text{Var}(\hat{\theta}_{\text{HM}})\).
</div>

<div class="example">
<strong>Example.</strong> Estimate \(\theta = \int_0^1 e^x\, dx = e - 1 \approx 1.71828\). Using the sample-mean estimator with \(n = 5\) uniform samples, suppose \(U_1 = 0.12, U_2 = 0.47, U_3 = 0.83, U_4 = 0.26, U_5 = 0.65\). Then
\[
\hat{\theta}_5 = \frac{1}{5}(e^{0.12} + e^{0.47} + e^{0.83} + e^{0.26} + e^{0.65}) = \frac{1.1275 + 1.5999 + 2.2933 + 1.2969 + 1.9155}{5} = \frac{8.2331}{5} = 1.6466.
\]
With more samples, this estimate converges to the true value.
</div>

## 4.2 Properties of Monte Carlo Estimators

### Unbiasedness

The sample-mean estimator is **unbiased**:

\[
E[\hat{\theta}_n] = \frac{1}{n}\sum_{i=1}^{n} E[g(X_i)] = E[g(X)] = \theta.
\]

### Consistency

By the **strong law of large numbers**, \(\hat{\theta}_n \to \theta\) almost surely as \(n \to \infty\). This means that with enough samples, the estimator converges to the true value.

### Mean Squared Error

The **mean squared error** (MSE) of an estimator \(\hat{\theta}\) is

\[
\text{MSE}(\hat{\theta}) = E[(\hat{\theta} - \theta)^2] = \text{Var}(\hat{\theta}) + (\text{Bias}(\hat{\theta}))^2.
\]
For the unbiased sample-mean estimator, \(\text{MSE}(\hat{\theta}_n) = \text{Var}(\hat{\theta}_n) = \sigma^2/n\), where \(\sigma^2 = \text{Var}(g(X))\).

<div class="remark">
<strong>Remark.</strong> The MSE decreases as \(O(1/n)\), so halving the error requires quadrupling the number of samples. This \(O(n^{-1/2})\) convergence rate of the standard error is independent of dimension, which is a major advantage of Monte Carlo over deterministic numerical integration in high dimensions.
</div>

### Central Limit Theorem for MC Estimators

<div class="theorem">
<strong>Central Limit Theorem.</strong> If \(\sigma^2 = \text{Var}(g(X)) < \infty\), then as \(n \to \infty\),
\[
\frac{\hat{\theta}_n - \theta}{\sigma / \sqrt{n}} \xrightarrow{d} N(0,1).
\]
Equivalently, \(\sqrt{n}(\hat{\theta}_n - \theta) \xrightarrow{d} N(0, \sigma^2)\).
</div>

This result is the theoretical foundation for constructing confidence intervals. Since \(\sigma^2\) is typically unknown, we estimate it by the **sample variance**

\[
S_n^2 = \frac{1}{n-1}\sum_{i=1}^{n}(g(X_i) - \hat{\theta}_n)^2.
\]

### Confidence Intervals

An approximate \((1-\alpha)\)-level confidence interval for \(\theta\) is

\[
\hat{\theta}_n \pm z_{\alpha/2}\, \frac{S_n}{\sqrt{n}},
\]
where \(z_{\alpha/2}\) is the \((1-\alpha/2)\)-quantile of the standard normal distribution. For a 95% confidence interval, \(z_{0.025} = 1.96\).

<div class="example">
<strong>Example.</strong> Suppose after \(n = 10{,}000\) replications of a simulation, the sample mean is \(\hat{\theta} = 3.142\) and the sample standard deviation is \(S = 0.85\). A 95% confidence interval is
\[
3.142 \pm 1.96 \times \frac{0.85}{\sqrt{10000}} = 3.142 \pm 0.0167 = (3.125, 3.159).
\]
</div>

### Determining Sample Size

To achieve a confidence interval of half-width \(\varepsilon\) at confidence level \(1 - \alpha\), we need

\[
n \geq \left(\frac{z_{\alpha/2}\, S}{\varepsilon}\right)^2.
\]
In practice, one runs a pilot study to estimate \(S\), then determines the required total sample size.

## 4.3 Examples and Applications

### Estimating \(\pi\)

One of the most classical Monte Carlo experiments estimates \(\pi\) via the area of a quarter circle. Generate \((U_1, U_2)\) uniformly on \([0,1]^2\) and check whether \(U_1^2 + U_2^2 \leq 1\). Since the area of the quarter circle is \(\pi/4\),

\[
\hat{\pi}_n = \frac{4}{n}\sum_{i=1}^{n} \mathbf{1}(U_{1i}^2 + U_{2i}^2 \leq 1).
\]
This is a hit-or-miss estimator.

### Option Pricing

In finance, the price of a European call option under the Black--Scholes model is

\[
C = e^{-rT}\, E[\max(S(T) - K, 0)],
\]
where \(S(T) = S_0 \exp\!\left((r - \sigma^2/2)T + \sigma\sqrt{T}\, Z\right)\) and \(Z \sim N(0,1)\). A Monte Carlo estimator generates \(n\) independent copies of \(Z\), computes each payoff, and averages:

\[
\hat{C}_n = \frac{e^{-rT}}{n}\sum_{i=1}^{n}\max(S_0 e^{(r-\sigma^2/2)T + \sigma\sqrt{T}Z_i} - K,\, 0).
\]

<div class="example">
<strong>Example.</strong> Let \(S_0 = 100\), \(K = 105\), \(r = 0.05\), \(\sigma = 0.20\), \(T = 1\). For one replication with \(Z = 0.35\):
\[
S(T) = 100 \exp(0.05 - 0.02 + 0.20 \times 0.35) = 100 \exp(0.10) = 100 \times 1.10517 = 110.52.
\]
Payoff: \(\max(110.52 - 105, 0) = 5.52\). Discounted: \(e^{-0.05} \times 5.52 = 0.9512 \times 5.52 = 5.25\). After many replications, the average converges to the Black--Scholes price.
</div>

### Queueing Systems

Consider a single-server queue with Poisson arrivals (rate \(\lambda\)) and exponential service times (rate \(\mu\)). While the \(M/M/1\) queue has a known steady-state distribution, more complex systems (e.g., \(G/G/k\) queues with priorities) lack analytical solutions and must be studied via simulation. Typical output measures include average waiting time, server utilisation, and maximum queue length.

### Reliability

For a system of \(d\) components with independent random lifetimes \(T_1, \ldots, T_d\), the system lifetime \(T_{\text{sys}} = h(T_1, \ldots, T_d)\) depends on the system structure function \(h\). For complex configurations (mixtures of series and parallel), Monte Carlo simulation estimates the system reliability \(P(T_{\text{sys}} > t)\) by generating many independent replications of component lifetimes.

## 4.4 Quasi-Monte Carlo Methods

Standard Monte Carlo uses pseudo-random sequences which, while statistically uniform, contain **random clusters and gaps**. **Quasi-Monte Carlo** (QMC) methods replace the random sequence with a **low-discrepancy sequence** that fills the unit hypercube more evenly.

<div class="definition">
<strong>Discrepancy.</strong> For a sequence of \(n\) points \(u_1, \ldots, u_n \in [0,1)^s\), the <em>star discrepancy</em> is
\[
D_n^* = \sup_{A \subseteq [0,1)^s} \left|\frac{\#\{i : u_i \in A\}}{n} - \text{Vol}(A)\right|,
\]
where the supremum is over all axis-aligned boxes anchored at the origin. A sequence with small \(D_n^*\) is called a <em>low-discrepancy sequence</em>.
</div>

For a pseudo-random sequence, \(D_n^* = O(\sqrt{\log\log n/n})\) almost surely (by the law of the iterated logarithm). Low-discrepancy sequences achieve the superior rate \(D_n^* = O((\log n)^s / n)\).

### Halton Sequence

The **Halton sequence** in dimension \(s\) is constructed by combining van der Corput sequences in \(s\) different prime bases. For base \(b\), the van der Corput sequence for integer \(n\) with base-\(b\) representation \(n = \sum_k d_k b^k\) is

\[
v_b(n) = \sum_k d_k b^{-(k+1)}.
\]

For \(s = 2\): use base 2 for dimension 1 and base 3 for dimension 2. The first 8 Halton points in 2D are far more evenly distributed than 8 pseudo-random points.

### Sobol' Sequences

**Sobol' sequences** are the most widely used low-discrepancy sequences in high-dimensional problems. They are constructed over the base-2 field using direction numbers that optimise equidistribution. Key properties:

- Dimension \(s\) up to several thousand is supported by precomputed direction number tables.
- They are **scrambled** in modern implementations (using random digital shifts) to enable unbiased estimation and valid confidence intervals.
- Convergence rate of the QMC estimator variance: \(O((\log n)^{2s}/n^2)\), compared to \(O(1/n)\) for standard MC.

### QMC vs. MC: When to Use Each

| Feature | Standard MC | Quasi-MC (Sobol') |
|---|---|---|
| Convergence rate | \(O(n^{-1/2})\) | \(O(n^{-1}(\log n)^s)\) for smooth functions |
| Confidence intervals | Easy (CLT) | Requires scrambling |
| Dimension | Unlimited | Degrades for very high dimensions |
| Parallelism | Trivially parallel | Requires careful implementation |

QMC is most beneficial when the integrand is smooth and of low effective dimension. For rough integrands, rare event problems, or Markov chain simulations, standard MC or specialised techniques (such as importance sampling) are preferred.

# Chapter 5: Variance Reduction Techniques

## 5.1 Motivation

The standard error of the Monte Carlo estimator decreases as \(O(n^{-1/2})\). To reduce the error by a factor of 10, one needs 100 times as many samples -- which can be prohibitively expensive. **Variance reduction techniques** (VRTs) aim to produce estimators with smaller variance without increasing the number of replications, or equivalently, to achieve the same precision with fewer replications.

<div class="definition">
<strong>Variance reduction factor.</strong> For a variance reduction technique that produces estimator \(\hat{\theta}^*\) instead of the crude estimator \(\hat{\theta}\), the <em>variance reduction factor</em> is \(\text{Var}(\hat{\theta}) / \text{Var}(\hat{\theta}^*)\). A factor greater than 1 indicates improvement.
</div>

## 5.2 Antithetic Variates

The idea of **antithetic variates** is to introduce negative correlation between pairs of replications to reduce the variance of the average.

<div class="theorem">
<strong>Antithetic variates principle.</strong> Suppose \(\hat{\theta}_1\) and \(\hat{\theta}_2\) are two estimators of \(\theta\) with \(E[\hat{\theta}_i] = \theta\). Then
\[
\text{Var}\!\left(\frac{\hat{\theta}_1 + \hat{\theta}_2}{2}\right) = \frac{\text{Var}(\hat{\theta}_1) + \text{Var}(\hat{\theta}_2)}{4} + \frac{\text{Cov}(\hat{\theta}_1, \hat{\theta}_2)}{2}.
\]
If we can arrange \(\text{Cov}(\hat{\theta}_1, \hat{\theta}_2) < 0\), the variance is reduced compared to the independent case.
</div>

The standard implementation: if \(U_1, \ldots, U_n\) are iid \(\text{Uniform}(0,1)\), the crude estimator uses \(2n\) samples. The antithetic estimator uses:

\[
\hat{\theta}_{\text{AV}} = \frac{1}{2n}\left(\sum_{i=1}^{n} g(U_i) + \sum_{i=1}^{n} g(1 - U_i)\right) = \frac{1}{n}\sum_{i=1}^{n} \frac{g(U_i) + g(1-U_i)}{2}.
\]
Since \(1 - U_i \sim \text{Uniform}(0,1)\) whenever \(U_i\) does, both halves are valid estimators.

<div class="theorem">
<strong>When antithetic variates work.</strong> If \(g\) is a monotone function, then \(g(U)\) and \(g(1-U)\) are negatively correlated, so antithetic variates always reduce variance in this case. More precisely, \(\text{Cov}(g(U), g(1-U)) \leq 0\) for any monotone \(g\).
</div>

<div class="proof">
<strong>Proof.</strong> If \(g\) is non-decreasing, then since \(U\) and \(1-U\) are negatively correlated (as \(\text{Cov}(U, 1-U) = -\text{Var}(U) = -1/12 < 0\)), and monotone transformations preserve the direction of correlation (by the FKG inequality or a direct argument), we have \(\text{Cov}(g(U), g(1-U)) \leq 0\).
</div>

<div class="example">
<strong>Example.</strong> Estimate \(\theta = \int_0^1 e^x\, dx = e - 1\). The crude estimator with \(n\) samples has variance \(\text{Var}(e^U)/n = (e^2 - 1)/2 - (e-1)^2)/n \approx 0.2420/n\). The antithetic estimator has variance
\[
\text{Var}\!\left(\frac{e^U + e^{1-U}}{2}\right) / n.
\]
One can compute: \(E[(e^U + e^{1-U})/2] = e - 1\), and

\[
\text{Var}\!\left(\frac{e^U + e^{1-U}}{2}\right) = \frac{1}{4}\left(\text{Var}(e^U) + \text{Var}(e^{1-U}) + 2\text{Cov}(e^U, e^{1-U})\right).
\]
Since \(\text{Cov}(e^U, e^{1-U}) = E[e^U e^{1-U}] - (E[e^U])^2 = E[e] - (e-1)^2 = e - (e-1)^2 \approx 2.718 - 2.952 = -0.234\), the variance is substantially reduced. The variance reduction factor is approximately 21.4, meaning antithetic variates are about 21 times more efficient than crude Monte Carlo for this problem.
</div>

## 5.3 Stratified Sampling

**Stratified sampling** partitions the sample space into non-overlapping strata and samples from each stratum separately, guaranteeing that each region of the space is represented proportionally.

### Method

Partition \([0,1)\) into \(k\) strata \([0, 1/k), [1/k, 2/k), \ldots, [(k-1)/k, 1)\). Within stratum \(j\), generate \(n_j\) samples uniformly. The stratified estimator of \(\theta = \int_0^1 g(u)\, du\) is

\[
\hat{\theta}_{\text{str}} = \sum_{j=1}^{k} \frac{1}{k} \cdot \frac{1}{n_j}\sum_{i=1}^{n_j} g\!\left(\frac{j-1+U_{ji}}{k}\right),
\]
where \(U_{ji} \sim \text{Uniform}(0,1)\) independently.

With **proportional allocation** (\(n_j = n/k\) for all \(j\)), the total number of samples is \(n\) and the estimator simplifies.

<div class="theorem">
<strong>Variance decomposition.</strong> For proportional allocation with one sample per stratum (\(n_j = 1\), \(n = k\)),
\[
\text{Var}(\hat{\theta}_{\text{str}}) = \frac{1}{k}\sum_{j=1}^{k} \text{Var}\!\left(g\!\left(\frac{j-1+U}{k}\right)\right) \leq \text{Var}\!\left(\hat{\theta}_{\text{crude}}\right) = \frac{\text{Var}(g(U))}{k}.
\]
The inequality follows from the law of total variance: \(\text{Var}(g(U)) = E[\text{Var}(g(U) \mid J)] + \text{Var}(E[g(U) \mid J])\), and stratification eliminates the second (between-strata) term.
</div>

<div class="example">
<strong>Example.</strong> Estimate \(\theta = \int_0^1 e^x\, dx\) using \(k = 4\) strata with one sample each. Suppose \(U_1 = 0.72, U_2 = 0.35, U_3 = 0.91, U_4 = 0.58\). The stratified points are \(x_1 = (0 + 0.72)/4 = 0.18\), \(x_2 = (1 + 0.35)/4 = 0.3375\), \(x_3 = (2 + 0.91)/4 = 0.7275\), \(x_4 = (3 + 0.58)/4 = 0.895\). Then
\[
\hat{\theta}_{\text{str}} = \frac{1}{4}(e^{0.18} + e^{0.3375} + e^{0.7275} + e^{0.895}) = \frac{1.1972 + 1.4013 + 2.0698 + 2.4474}{4} = \frac{7.1157}{4} = 1.7789.
\]
This is closer to the true value \(e - 1 = 1.71828\) than a typical crude estimate with 4 samples.
</div>

## 5.4 Importance Sampling

**Importance sampling** is arguably the most powerful and flexible variance reduction technique. The idea is to sample from a different distribution that places more probability mass in the "important" regions of the integrand.

### Derivation

Suppose we wish to estimate \(\theta = E_f[g(X)] = \int g(x) f(x)\, dx\). Let \(h\) be another density with \(h(x) > 0\) whenever \(g(x) f(x) \neq 0\). Then

\[
\theta = \int g(x) f(x)\, dx = \int g(x) \frac{f(x)}{h(x)} h(x)\, dx = E_h\!\left[g(X)\frac{f(X)}{h(X)}\right].
\]
The **importance sampling estimator** is

\[
\hat{\theta}_{\text{IS}} = \frac{1}{n}\sum_{i=1}^{n} g(X_i)\, \frac{f(X_i)}{h(X_i)}, \qquad X_i \sim h \text{ iid}.
\]
The ratio \(w(x) = f(x)/h(x)\) is called the **likelihood ratio** or **importance weight**.

<div class="theorem">
<strong>Optimal importance sampling density.</strong> The variance of the importance sampling estimator is minimised when
\[
h^*(x) = \frac{|g(x)| f(x)}{\int |g(x)| f(x)\, dx}.
\]
If \(g(x) \geq 0\), this optimal density is \(h^*(x) \propto g(x) f(x)\), and the resulting variance is zero (the estimator returns the exact answer with a single sample).
</div>

<div class="remark">
<strong>Remark.</strong> The optimal density \(h^*\) cannot be used directly because its normalising constant is \(\theta\), the quantity we are trying to estimate. However, \(h^*\) provides guidance: a good importance sampling density should be roughly proportional to \(|g(x)| f(x)\), placing more mass where the integrand is large.
</div>

<div class="remark">
<strong>Remark (dangers of importance sampling).</strong> If \(h\) has lighter tails than \(f \cdot g\), the importance weights can become extremely large for some samples, leading to infinite variance. This is a well-known pitfall: importance sampling can perform <em>worse</em> than crude Monte Carlo if the proposal distribution is poorly chosen.
</div>

<div class="example">
<strong>Example (rare event estimation).</strong> Estimate \(\theta = P(Z > 4)\) where \(Z \sim N(0,1)\). By crude Monte Carlo, most samples of \(Z\) will be far from 4, and the indicator \(\mathbf{1}(Z > 4)\) will almost always be 0. Using importance sampling with \(h = N(4, 1)\) (a normal centred at 4):
\[
\hat{\theta}_{\text{IS}} = \frac{1}{n}\sum_{i=1}^{n} \mathbf{1}(X_i > 4)\, \frac{\phi(X_i)}{\phi(X_i - 4)}, \qquad X_i \sim N(4,1),
\]
where \(\phi\) is the standard normal density. The weight ratio simplifies to \(\exp(-4X_i + 8)\). Now most samples fall near 4, so the indicator is frequently 1, and the estimator converges much faster.
</div>

## 5.5 Control Variates

The **control variate** technique exploits known quantities to reduce variance. Suppose we estimate \(\theta = E[Y]\) and have access to another random variable \(C\) (the "control") whose expected value \(\mu_C = E[C]\) is known. The **control variate estimator** is

\[
Y^{(c)} = Y - \beta(C - \mu_C),
\]
for some constant \(\beta\). Since \(E[Y^{(c)}] = E[Y] = \theta\) regardless of \(\beta\), the estimator is unbiased.

<div class="theorem">
<strong>Optimal coefficient.</strong> The variance of the control variate estimator is
\[
\text{Var}(Y^{(c)}) = \text{Var}(Y) - 2\beta\,\text{Cov}(Y,C) + \beta^2\,\text{Var}(C).
\]
Minimising over \(\beta\) yields the optimal coefficient

\[
\beta^* = \frac{\text{Cov}(Y,C)}{\text{Var}(C)},
\]
and the resulting variance is

\[
\text{Var}(Y^{(c^*)}) = \text{Var}(Y)(1 - \rho_{Y,C}^2),
\]
where \(\rho_{Y,C}\) is the correlation between \(Y\) and \(C\).
</div>

<div class="proof">
<strong>Proof.</strong> The variance expression follows from the linearity of variance and covariance. Taking the derivative with respect to \(\beta\) and setting it to zero: \(-2\,\text{Cov}(Y,C) + 2\beta\,\text{Var}(C) = 0\), giving \(\beta^* = \text{Cov}(Y,C)/\text{Var}(C)\). Substituting back:
\[
\text{Var}(Y^{(c^*)}) = \text{Var}(Y) - \frac{(\text{Cov}(Y,C))^2}{\text{Var}(C)} = \text{Var}(Y)\!\left(1 - \frac{(\text{Cov}(Y,C))^2}{\text{Var}(Y)\,\text{Var}(C)}\right) = \text{Var}(Y)(1 - \rho^2).
\]
</div>

In practice, \(\beta^*\) is unknown and must be estimated from the simulation output (e.g., using a pilot run or from the same data).

<div class="example">
<strong>Example (option pricing with control variate).</strong> To price an Asian option (whose payoff depends on the average stock price along a path), one can use the European option payoff (which has a known Black--Scholes price) as a control variate. Both are driven by the same Brownian motion path, so they are typically highly correlated. If \(\rho \approx 0.95\), the variance reduction factor is \(1/(1 - 0.95^2) \approx 10.3\).
</div>

## 5.6 Combined Methods

Variance reduction techniques can often be combined for even greater effect.

### Antithetic + Control Variates

One can apply antithetic variates to generate negatively correlated pairs, and then apply a control variate adjustment to each pair. Care must be taken to estimate the optimal control coefficient appropriately.

### Stratification + Importance Sampling

Different importance sampling densities can be used within different strata, optimising the proposal locally. This is particularly useful when the integrand has different characteristics in different regions of the domain.

## 5.7 Applications to Option Pricing

### European Options

For a European call option under the Black--Scholes model, the Monte Carlo estimator is

\[
\hat{C} = \frac{e^{-rT}}{n}\sum_{i=1}^{n} \max(S_0 e^{(r - \sigma^2/2)T + \sigma\sqrt{T}Z_i} - K,\, 0).
\]
Antithetic variates replace each \(Z_i\) with the pair \((Z_i, -Z_i)\). Since \(\max(S(T) - K, 0)\) is an increasing function of \(Z\), the antithetic pairs are negatively correlated.

### Asian Options

An Asian call option has payoff \(\max(\bar{S} - K, 0)\) where \(\bar{S} = \frac{1}{m}\sum_{j=1}^{m} S(t_j)\) is the arithmetic average of the stock price at \(m\) monitoring dates. No closed-form price exists, so Monte Carlo is the standard tool. Variance reduction is essential: the geometric average Asian option (which has a closed-form price) serves as an excellent control variate because it is highly correlated with the arithmetic average version.

### Barrier Options

A knock-out barrier option becomes worthless if the stock price crosses a barrier level during the option's life. Simulating this requires tracking the entire price path, and importance sampling can shift the path distribution to make barrier-crossing events more frequent, improving efficiency for deep out-of-the-money barrier options.

## 5.8 Rare Event Simulation

Estimating probabilities of rare events \(\theta = P(A)\) with \(\theta \ll 1\) is challenging for crude Monte Carlo because the relative error is

\[
\frac{\sqrt{\text{Var}(\mathbf{1}_A)}}{\theta\sqrt{n}} = \frac{\sqrt{\theta(1-\theta)}}{\theta\sqrt{n}} \approx \frac{1}{\sqrt{\theta \cdot n}},
\]
which requires \(n = O(1/\theta)\) samples for a fixed relative error.

**Importance sampling** is the primary tool for rare event simulation. The idea is to change the probability measure so that the rare event becomes common, then correct via importance weights. For example, in estimating the probability of ruin in insurance, or the probability of buffer overflow in telecommunications, exponential tilting (also called exponential change of measure) shifts the distribution to make large losses more likely.

<div class="example">
<strong>Example.</strong> To estimate \(P(S_n > a)\) where \(S_n = X_1 + \cdots + X_n\) with \(X_i \sim \text{Exp}(1)\) iid and \(a\) is large, we use an exponentially tilted distribution: sample each \(X_i\) from \(\text{Exp}(1 - t)\) for some \(0 < t < 1\), and multiply the indicator by the likelihood ratio \(\prod_{i=1}^n (1-t) e^{tX_i}\). The optimal tilt parameter \(t\) satisfies \(E_t[S_n] = a\), which gives \(t = 1 - n/a\).
</div>

## 5.9 Conditional Monte Carlo

**Conditional Monte Carlo** reduces variance by analytically computing the conditional expectation over one or more random variables, thereby eliminating their contribution to the variance.

<div class="theorem">
<strong>Rao--Blackwell Theorem (simulation version).</strong> If \(\theta = E[g(X, Y)]\), then \(\tilde{g}(X) = E[g(X, Y) \mid X]\) satisfies \(E[\tilde{g}(X)] = \theta\) and \(\text{Var}(\tilde{g}(X)) \leq \text{Var}(g(X, Y))\). The inequality follows from the law of total variance:
\[
\text{Var}(g(X,Y)) = E[\text{Var}(g(X,Y) \mid X)] + \text{Var}(E[g(X,Y) \mid X]) \geq \text{Var}(\tilde{g}(X)).
\]
</div>

<div class="example">
<strong>Example.</strong> Estimate \(P(X + Y > 3)\) where \(X, Y \sim \text{Exp}(1)\) independently. Crude MC: generate pairs and check. Conditional MC: compute \(E[\mathbf{1}(X + Y > 3) \mid X] = P(Y > 3 - X \mid X) = e^{-(3-X)^+}\). This deterministic function of \(X\) alone has smaller variance since we have integrated out \(Y\) analytically.
</div>

## 5.10 Common Random Numbers

When comparing two system configurations (e.g., two scheduling policies for a factory), **common random numbers** (CRN) uses the same stream of uniform random numbers for both systems. This induces positive correlation between the two outputs \(Y_1\) and \(Y_2\), so the variance of the difference \(Y_1 - Y_2\) is

\[
\text{Var}(Y_1 - Y_2) = \text{Var}(Y_1) + \text{Var}(Y_2) - 2\,\text{Cov}(Y_1, Y_2).
\]
With CRN, \(\text{Cov}(Y_1, Y_2) > 0\), reducing the variance of the estimated difference. This technique does not reduce the variance of estimating either \(E[Y_1]\) or \(E[Y_2]\) alone, but it dramatically improves the comparison.

## 5.11 Summary of Variance Reduction Techniques

| Technique | Key Idea | When It Works Best | Typical Reduction |
|---|---|---|---|
| Antithetic variates | Negative correlation via \(U\) and \(1-U\) | Monotone integrands | 2--50x |
| Stratified sampling | Partition domain, sample each stratum | Integrand varies across strata | 2--20x |
| Importance sampling | Resample from better distribution | Rare events, peaked integrands | 10--10000x |
| Control variates | Subtract known-mean correlated variable | Highly correlated control available | 2--100x |
| Conditional MC | Integrate out some variables analytically | Conditional expectation is tractable | 2--50x |
| Common random numbers | Same random numbers for system comparison | Comparing alternatives | 2--20x |

---

# Appendix: Key Algorithms and Results Summary

## Random Variate Generation: Decision Tree

Choosing the right generation method depends on the form of the target density:

| Situation | Recommended Method |
|---|---|
| Invertible CDF in closed form | Inverse transform |
| Easy-to-sample envelope \(f_e(x) \geq c\,f(x)\) exists | Acceptance-rejection |
| Target is a mixture \(\sum_k p_k f_k\) | Composition (mixture) |
| Target is multivariate normal | Cholesky decomposition |
| Target involves a copula | Conditional simulation |
| Target is a stochastic process path | Sequential simulation (Euler, exact) |

## Acceptance-Rejection: Choosing the Envelope

The acceptance probability is \(1/c\) where \(c = \sup_x f(x)/f_e(x)\). A smaller \(c\) means fewer proposals are rejected. Optimal envelope density \(f_e^*(x) \propto f(x)\) gives \(c = 1\), but then \(f_e^* = f\) (which we cannot sample from). In practice, \(f_e\) is chosen from a family of easily sampled distributions, and \(c\) is minimized by matching the shape of \(f\) as closely as possible.

<div class="theorem">
<strong>Theorem (correctness of acceptance-rejection).</strong> Suppose \(X^* \sim f_e\) is proposed and \(U \sim \text{Uniform}(0,1)\) is drawn independently. If the accepted \(X^*\) satisfies \(U \leq f(X^*)/(c\,f_e(X^*))\), then the accepted variates have density \(f\).

<em>Proof.</em> Let \(X\) denote an accepted variate. For any measurable set \(A\):
\[
P(X \in A) = P\!\left(X^* \in A \;\middle|\; U \leq \frac{f(X^*)}{c\,f_e(X^*)}\right) = \frac{\int_A f(x^*)/(c\,f_e(x^*))\cdot f_e(x^*)\,dx^*}{\int_{-\infty}^{\infty} f(x^*)/(c\,f_e(x^*))\cdot f_e(x^*)\,dx^*} = \frac{\int_A f(x^*)\,dx^*/c}{1/c} = \int_A f(x^*)\,dx^*.
\]
</div>

## Monte Carlo Error Summary

| Quantity | Formula |
|---|---|
| Variance of MC estimator | \(\sigma^2/n\) where \(\sigma^2 = \text{Var}(g(X))\) |
| Standard error | \(\sigma/\sqrt{n}\) |
| 95% CI half-width | \(1.96\,S_n/\sqrt{n}\) |
| Required sample size for half-width \(\varepsilon\) | \(n \geq (z_{\alpha/2}\,S/\varepsilon)^2\) |
| Convergence rate of standard error | \(O(n^{-1/2})\), independent of dimension |

## Variance Reduction: Quantitative Benchmarks

<div class="example">
<strong>European call option under all techniques.</strong> Parameters: \(S_0 = 100\), \(K = 100\), \(r = 0.05\), \(\sigma = 0.2\), \(T = 1\). True Black-Scholes price: 10.45. With \(n = 10{,}000\) replications, approximate standard errors:

| Method | SE of estimate |
|---|---|
| Crude MC | 0.228 |
| Antithetic variates | 0.021 (effective factor 10.9) |
| Control variates (forward price) | 0.019 (effective factor 12.0) |
| Stratified sampling (10 strata) | 0.073 (effective factor 3.1) |
| Importance sampling (optimal shift) | 0.009 (effective factor 25.3) |

The best single technique is application-dependent. In practice, control variates and antithetic variates are the most widely used because they are easy to implement and provide substantial gains for smooth payoffs.
</div>

## Notation

| Symbol | Meaning |
|---|---|
| \(U \sim \text{Uniform}(0,1)\) | Uniform random variate (seed for all generation) |
| \(F^{-1}\) | Quantile (inverse CDF) function |
| \(c\) | Envelope constant in acceptance-rejection (\(c \geq \sup f/f_e\)) |
| \(\hat\theta_n\) | MC estimate after \(n\) replications |
| \(S_n^2\) | Sample variance of \(g(X_i)\) values |
| \(\rho\) | Correlation between control variate and estimator |
| \(\beta^*\) | Optimal control variate coefficient |

## Markov Chain Monte Carlo: A Brief Introduction

The methods covered in this course generate independent random variates. In many statistical problems --- particularly Bayesian inference --- the target distribution is a high-dimensional density \(\pi(x)\) that cannot be directly sampled. **Markov chain Monte Carlo** (MCMC) methods construct a Markov chain \(X_0, X_1, X_2, \ldots\) with \(\pi\) as its stationary distribution; after a burn-in period, the chain values \(X_t\) approximately follow \(\pi\).

### Metropolis--Hastings Algorithm

The **Metropolis--Hastings** (MH) algorithm is the most general MCMC method. Given the current state \(X_t = x\):

1. Propose \(Y \sim q(y \mid x)\) from a proposal distribution \(q\).
2. Compute the acceptance ratio
\[
\alpha(x, y) = \min\!\left(1, \frac{\pi(y)\,q(x \mid y)}{\pi(x)\,q(y \mid x)}\right).
\]
3. With probability \(\alpha(x, y)\), set \(X_{t+1} = y\); otherwise set \(X_{t+1} = x\).

The chain satisfies **detailed balance** \(\pi(x) q(y \mid x) \alpha(x,y) = \pi(y)q(x \mid y)\alpha(y,x)\), which ensures \(\pi\) is stationary. A key advantage is that only the ratio \(\pi(y)/\pi(x)\) is needed, so any normalizing constant in \(\pi\) cancels.

### Gibbs Sampling

When \(\pi\) is a joint distribution of \((X_1, \ldots, X_d)\) and all full conditionals \(\pi(X_j \mid X_{-j})\) are available in closed form, **Gibbs sampling** cycles through coordinates, sampling each from its full conditional. Gibbs sampling is a special case of MH with acceptance probability 1.

### MCMC vs. Direct Simulation

| Property | Direct MC | MCMC |
|---|---|---|
| Independence | Exact | Approximate (correlated chain) |
| Convergence diagnostics | None needed | Required (burn-in, ESS, trace plots) |
| Applicability | Known, tractable distributions | Any distribution with computable density ratio |
| Variance of estimators | \(\sigma^2/n\) | \(\sigma^2/(n/\tau)\), \(\tau\) = integrated autocorrelation |

The **effective sample size** (ESS) for MCMC is \(n / \tau\) where \(\tau = 1 + 2\sum_{k=1}^\infty \text{Corr}(X_t, X_{t+k})\). Highly correlated chains have large \(\tau\) and small ESS, requiring more iterations to achieve the same accuracy as direct MC.
