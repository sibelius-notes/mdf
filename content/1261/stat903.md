---
title: "STAT 903: High-Dimensional Probability"
prof: "Aukosh Jagannath"
subjects: "STAT"
---

## Sources and References

**Primary textbooks** — Vershynin, *High-Dimensional Probability* (Cambridge, 2018); Boucheron, Lugosi & Massart, *Concentration Inequalities* (Oxford, 2013)

**Supplementary texts** — Ledoux, *The Concentration of Measure Phenomenon* (AMS, 2001); Wainwright, *High-Dimensional Statistics* (Cambridge, 2019); Anderson, Guionnet & Zeitouni, *An Introduction to Random Matrices* (Cambridge, 2010)

**Online resources** — MIT OCW 18.S997 (High-Dimensional Statistics, Rigollet); Stanford STATS 300C (Theory of Statistics, Montanari); Roman Vershynin's lecture notes (math.uci.edu)

---

# Chapter 1: Foundations of Concentration

## 1.1 The Concentration Phenomenon

One of the most striking and counterintuitive features of high-dimensional probability is that smooth functions of many independent random variables tend to concentrate tightly around their mean. This phenomenon, which has no real analogue in low dimensions, becomes more pronounced as the dimension grows and underlies a vast collection of results in probability, statistics, combinatorics, and theoretical computer science.

The prototypical geometric manifestation is Lévy's theorem on the sphere. Consider the unit sphere \( \mathbb{S}^{n-1} = \{ x \in \mathbb{R}^n : \|x\| = 1 \} \) equipped with the uniform (Haar) measure \( \sigma \). Fix any 1-Lipschitz function \( f : \mathbb{S}^{n-1} \to \mathbb{R} \) — that is, \( |f(x) - f(y)| \leq \|x - y\| \) for all \( x, y \). Let \( M_f \) denote the median of \( f \) with respect to \( \sigma \).

<div class="theorem">
<strong>Theorem (Lévy's Concentration on the Sphere).</strong> For any 1-Lipschitz function \( f : \mathbb{S}^{n-1} \to \mathbb{R} \) and any \( t > 0 \),

\[
\sigma\!\left(\left|f - M_f\right| \geq t\right) \leq 2 \exp\!\left(-\frac{(n-2)\,t^2}{2}\right).
\]
</div>

The interpretation is dramatic. For large \( n \), the function \( f \) is essentially constant on all but an exponentially small fraction of the sphere. A geometric reformulation: almost all of the sphere lies within distance \( t \) of any fixed equator, provided \( t \gg n^{-1/2} \). The sphere, despite being a curved \( (n-1) \)-dimensional manifold, exhibits the same Gaussian concentration as a product of independent coordinates.

The key mechanism behind this theorem is an isoperimetric inequality: among all subsets \( A \subseteq \mathbb{S}^{n-1} \) with \( \sigma(A) \geq 1/2 \), the \( t \)-neighborhood \( A_t = \{ x : d(x, A) \leq t \} \) has measure at least \( 1 - 2e^{-(n-2)t^2/2} \). This is the spherical isoperimetric inequality, and concentration follows from it directly.

More broadly, the concentration of measure phenomenon manifests wherever there is a combination of a high-dimensional product structure, a smoothness condition on the function of interest, and a mechanism (log-Sobolev inequality, curvature condition, or independent summands) that limits large fluctuations. The rest of this chapter develops the classical toolbox that formalizes these ideas.

## 1.2 Classical Tail Bounds

The story of concentration begins with simple, classical inequalities that make no structural assumption beyond the existence of moments.

<div class="theorem">
<strong>Theorem (Markov's Inequality).</strong> Let \( X \geq 0 \) be a non-negative random variable and \( t > 0 \). Then
\[
\mathbb{P}(X \geq t) \leq \frac{\mathbb{E}[X]}{t}.
\]
</div>

Markov's inequality is tight (achieved by a two-point distribution) but rarely gives useful tail bounds in practice because it uses only the first moment. Chebyshev's inequality refines it using the second moment.

<div class="theorem">
<strong>Theorem (Chebyshev's Inequality).</strong> For any random variable \( X \) with finite variance, and any \( t > 0 \),
\[
\mathbb{P}\!\left(\left|X - \mathbb{E}[X]\right| \geq t\right) \leq \frac{\mathrm{Var}(X)}{t^2}.
\]
</div>

The polynomial decay \( O(t^{-2}) \) is often too slow for high-dimensional applications. The key idea that produces exponential tails is to work with the moment generating function (MGF). For a random variable \( X \) with mean zero, the Cramér-Chernoff method proceeds as follows: for any \( \lambda > 0 \),

\[
\mathbb{P}(X \geq t) = \mathbb{P}(e^{\lambda X} \geq e^{\lambda t}) \leq e^{-\lambda t} \mathbb{E}\left[e^{\lambda X}\right].
\]

Optimizing over \( \lambda \) yields the Cramér transform, which is the Legendre–Fenchel transform of the log-MGF \( \psi(\lambda) = \log \mathbb{E}[e^{\lambda X}] \). Specifically, the large deviation rate function is

\[
I(t) = \sup_{\lambda \geq 0} \left\{ \lambda t - \psi(\lambda) \right\}.
\]

The quality of the resulting tail bound depends entirely on how fast the MGF grows with \( \lambda \), which motivates the notion of sub-Gaussian and sub-exponential variables.

## 1.3 Sub-Gaussian Random Variables

The most important class of random variables for concentration theory is the sub-Gaussian class. Intuitively, these are variables whose tails decay at least as fast as those of a Gaussian, and they are characterized by the behavior of the MGF.

<div class="definition">
<strong>Definition (Sub-Gaussian Random Variable).</strong> A mean-zero random variable \( X \) is called <em>sub-Gaussian with parameter \( \sigma^2 \)</em> (written \( X \in \mathrm{subG}(\sigma^2) \)) if its moment generating function satisfies
\[
\mathbb{E}\left[e^{\lambda X}\right] \leq \exp\!\left(\frac{\sigma^2 \lambda^2}{2}\right) \quad \text{for all } \lambda \in \mathbb{R}.
\]
</div>

This definition immediately yields Gaussian-type tail bounds via the Cramér-Chernoff method: for \( X \in \mathrm{subG}(\sigma^2) \),

\[
\mathbb{P}(X \geq t) \leq e^{-\lambda t} \exp\!\left(\frac{\sigma^2 \lambda^2}{2}\right),
\]

and optimizing over \( \lambda = t/\sigma^2 \) gives

\[
\mathbb{P}(X \geq t) \leq \exp\!\left(-\frac{t^2}{2\sigma^2}\right).
\]

The sub-Gaussian class admits several equivalent characterizations. A mean-zero random variable \( X \) is sub-Gaussian if and only if any one of the following holds: (i) the MGF condition above; (ii) Orlicz norm finiteness, \( \|X\|_{\psi_2} < \infty \); (iii) the tail bound \( \mathbb{P}(|X| \geq t) \leq 2e^{-ct^2/K^2} \) for some constants \( c, K > 0 \); or (iv) the moment growth condition \( (\mathbb{E}|X|^p)^{1/p} \leq K\sqrt{p} \) for all \( p \geq 1 \).

<div class="definition">
<strong>Definition (Sub-Gaussian Norm).</strong> The sub-Gaussian norm (or \( \psi_2 \)-norm) of a random variable \( X \) is defined as
\[
\|X\|_{\psi_2} = \inf\!\left\{ t > 0 : \mathbb{E}\left[\exp\!\left(\frac{X^2}{t^2}\right)\right] \leq 2 \right\}.
\]
</div>

The equivalence of the various characterizations holds up to universal constants. A key result that connects the bounded-variable setting to the sub-Gaussian framework is Hoeffding's lemma.

<div class="theorem">
<strong>Lemma (Hoeffding).</strong> If \( X \) is a mean-zero random variable satisfying \( a \leq X \leq b \) almost surely, then
\[
\mathbb{E}\left[e^{\lambda X}\right] \leq \exp\!\left(\frac{\lambda^2 (b-a)^2}{8}\right).
\]
In particular, \( X \in \mathrm{subG}\!\left(\frac{(b-a)^2}{4}\right) \).
</div>

The proof uses the convexity of the exponential function to bound \( \mathbb{E}[e^{\lambda X}] \) by a linear combination of \( e^{\lambda a} \) and \( e^{\lambda b} \), then applies a Taylor expansion argument. Gaussian random variables \( X \sim N(0, \sigma^2) \) are exactly \( \mathrm{subG}(\sigma^2) \) with equality in the MGF condition. Bernoulli random variables, bounded random variables, and more generally any variable satisfying \( |X| \leq C \) are sub-Gaussian. Rademacher variables \( \varepsilon \in \{-1, +1\} \) with equal probability are \( \mathrm{subG}(1) \).

## 1.4 Sub-Exponential Random Variables

A broader class allows for heavier tails than Gaussian while still admitting exponential-type bounds. The canonical example is a chi-squared random variable.

<div class="definition">
<strong>Definition (Sub-Exponential Random Variable).</strong> A mean-zero random variable \( X \) is <em>sub-exponential with parameters \( (\nu^2, b) \)</em> if its MGF satisfies
\[
\mathbb{E}\left[e^{\lambda X}\right] \leq \exp\!\left(\frac{\nu^2 \lambda^2}{2}\right) \quad \text{for all } |\lambda| \leq \frac{1}{b}.
\]
</div>

Sub-exponential variables are characterized by the Bernstein moment condition: \( X \) is sub-exponential if and only if there exists \( K > 0 \) such that

\[
\mathbb{E}\left[|X|^p\right] \leq \frac{p!}{2} K^{p-2} \nu^2 \quad \text{for all } p \geq 2.
\]

The tail behavior of sub-exponential variables transitions between Gaussian and exponential depending on the regime.

<div class="theorem">
<strong>Theorem (Bernstein's Inequality, Sub-Exponential Form).</strong> Let \( X \) be mean-zero and sub-exponential with parameters \( (\nu^2, b) \). Then for all \( t > 0 \),
\[
\mathbb{P}(X \geq t) \leq \exp\!\left(-\frac{t^2/2}{\nu^2 + bt}\right).
\]
For \( t \leq \nu^2/b \), this is Gaussian: \( \exp(-t^2/(2\nu^2)) \); for \( t \geq \nu^2/b \), it is exponential: \( \exp(-t/(2b)) \).
</div>

The squared sub-Gaussian: if \( X \in \mathrm{subG}(\sigma^2) \), then \( X^2 - \mathbb{E}[X^2] \) is sub-exponential. This is why chi-squared random variables (which are sums of squared Gaussians) are sub-exponential. Similarly, a random variable of the form \( X = \langle a, g \rangle^2 - \|a\|^2 \) where \( g \sim N(0, I_n) \) is sub-exponential with parameters that depend on \( \|a\|_2 \) and \( \|a\|_\infty \).

## 1.5 Sums of Independent Variables

The most important setting for concentration is that of sums of independent random variables. Here the independence structure allows for clean recursive arguments and sharp results.

<div class="theorem">
<strong>Theorem (Hoeffding's Inequality).</strong> Let \( X_1, \ldots, X_n \) be independent mean-zero random variables with \( a_i \leq X_i \leq b_i \) almost surely. Let \( S_n = X_1 + \cdots + X_n \). Then for all \( t > 0 \),
\[
\mathbb{P}(S_n \geq t) \leq \exp\!\left(-\frac{2t^2}{\sum_{i=1}^n (b_i - a_i)^2}\right).
\]
</div>

The proof applies Hoeffding's lemma to each summand, uses independence to factorize the MGF as \( \mathbb{E}[e^{\lambda S_n}] = \prod_i \mathbb{E}[e^{\lambda X_i}] \leq \prod_i \exp(\lambda^2(b_i-a_i)^2/8) \), and then optimizes over \( \lambda \). For bounded random variables, this is essentially optimal.

<div class="theorem">
<strong>Theorem (Bennett's Inequality).</strong> Let \( X_1, \ldots, X_n \) be independent mean-zero random variables with \( X_i \leq b \) almost surely and \( \sum_i \mathbb{E}[X_i^2] = v \). Define \( h(u) = (1+u)\log(1+u) - u \). Then for all \( t > 0 \),
\[
\mathbb{P}(S_n \geq t) \leq \exp\!\left(-\frac{v}{b^2}\, h\!\left(\frac{bt}{v}\right)\right).
\]
</div>

Bennett's inequality is sharper than Hoeffding's when the variance is small relative to the range. The following version is often stated in a simpler but slightly looser form:

<div class="theorem">
<strong>Theorem (Bernstein's Inequality).</strong> Under the same hypotheses as Bennett's inequality,
\[
\mathbb{P}(S_n \geq t) \leq \exp\!\left(-\frac{t^2/2}{v + bt/3}\right).
\]
</div>

This is the Bernstein inequality for sums of bounded variables. It is obtained from Bennett's inequality via the elementary bound \( h(u) \geq u^2/(2(1+u/3)) \) for \( u \geq 0 \). The Bernstein inequality interpolates: when \( t \ll v/b \) (small deviations), the bound is approximately Gaussian \( e^{-t^2/(2v)} \); when \( t \gg v/b \) (large deviations), it is exponential \( e^{-3t/(2b)} \).

---

# Chapter 2: General Concentration Methods

## 2.1 The Bounded Differences / McDiarmid Inequality

The tools of Chapter 1 require independence and apply to sums of random variables. The bounded differences inequality extends concentration to arbitrary functions of independent variables, requiring only a Lipschitz-type condition on each coordinate.

<div class="theorem">
<strong>Theorem (McDiarmid's Inequality).</strong> Let \( X_1, \ldots, X_n \) be independent random variables taking values in some set \( \mathcal{X} \), and let \( f : \mathcal{X}^n \to \mathbb{R} \) satisfy the bounded differences condition: for each \( i \), there exists \( c_i < \infty \) such that
\[
\sup_{x_1, \ldots, x_n, x_i'} \left|f(x_1, \ldots, x_n) - f(x_1, \ldots, x_{i-1}, x_i', x_{i+1}, \ldots, x_n)\right| \leq c_i.
\]
Then for all \( t > 0 \),

\[
\mathbb{P}\!\left(f(X) - \mathbb{E}[f(X)] \geq t\right) \leq \exp\!\left(-\frac{2t^2}{\sum_{i=1}^n c_i^2}\right).
\]
</div>

The proof proceeds via the Azuma-Hoeffding inequality for martingales. Define the Doob martingale \( M_k = \mathbb{E}[f(X) \mid X_1, \ldots, X_k] \) with \( M_0 = \mathbb{E}[f(X)] \) and \( M_n = f(X) \). The differences \( D_k = M_k - M_{k-1} \) are conditionally mean-zero and satisfy \( |D_k| \leq c_k \) by the bounded differences assumption. Applying the sub-Gaussian property to each martingale difference and summing gives the result.

<div class="example">
<strong>Example (Longest Increasing Subsequence).</strong> Let \( L_n(\sigma) \) denote the length of the longest increasing subsequence of a random permutation \( \sigma \) of \( \{1, \ldots, n\} \). Changing one entry of \( \sigma \) can alter \( L_n \) by at most 1, so McDiarmid's inequality with \( c_i = 1 \) gives \( \mathbb{P}(|L_n - \mathbb{E}[L_n]| \geq t) \leq 2e^{-2t^2/n} \). Combined with the Vershik-Kerov / Logan-Shepp result \( \mathbb{E}[L_n] \approx 2\sqrt{n} \), this shows \( L_n/\sqrt{n} \to 2 \) in probability.
</div>

## 2.2 The Efron-Stein Inequality

While McDiarmid's inequality controls the tails using the worst-case influence of each coordinate, the Efron-Stein inequality gives a tight bound on the variance of any function of independent random variables in terms of leave-one-out variances.

<div class="theorem">
<strong>Theorem (Efron-Stein Inequality).</strong> Let \( X_1, \ldots, X_n \) be independent random variables and \( f = f(X_1, \ldots, X_n) \) any function with \( \mathbb{E}[f^2] < \infty \). Let \( X' \) be an independent copy of \( X \). Then
\[
\mathrm{Var}(f) \leq \frac{1}{2} \sum_{i=1}^n \mathbb{E}\!\left[\left(f(X) - f(X^{(i)})\right)^2\right],
\]
where \( X^{(i)} = (X_1, \ldots, X_{i-1}, X_i', X_{i+1}, \ldots, X_n) \) replaces the \( i \)-th coordinate with an independent copy.
</div>

The proof uses the decomposition of \( f - \mathbb{E}[f] \) into the sum of conditional expectation differences, then applies the Cauchy-Schwarz inequality. The Efron-Stein inequality is particularly powerful because it provides the correct variance bound for many non-linear statistics such as the empirical risk of a classifier, the maximum of a random process, or the length of a shortest path in a random graph.

## 2.3 Log-Sobolev Inequalities and the Herbst Argument

Log-Sobolev inequalities encode a notion of hypercontractivity and provide a powerful route to concentration that works beyond the product measure setting.

<div class="definition">
<strong>Definition (Log-Sobolev Inequality).</strong> A probability measure \( \mu \) on \( \mathbb{R}^n \) satisfies the log-Sobolev inequality with constant \( \rho > 0 \) if for all smooth functions \( f > 0 \),
\[
\mathrm{Ent}_\mu(f^2) \leq \frac{2}{\rho} \int |\nabla f|^2 \, d\mu,
\]
where the entropy functional is \( \mathrm{Ent}_\mu(g) = \mathbb{E}_\mu[g \log g] - \mathbb{E}_\mu[g] \log \mathbb{E}_\mu[g] \).
</div>

The standard Gaussian measure \( \gamma = N(0, I_n) \) satisfies the log-Sobolev inequality with constant \( \rho = 1 \) (Gross's theorem, 1975). Product measures \( \mu = \mu_1 \otimes \cdots \otimes \mu_n \) satisfy the log-Sobolev inequality with constant equal to the worst individual constant, by tensorization.

The Herbst argument converts a log-Sobolev inequality into a concentration inequality for Lipschitz functions. Let \( f : \mathbb{R}^n \to \mathbb{R} \) be \( L \)-Lipschitz, so \( |\nabla f| \leq L \). Apply the log-Sobolev inequality with \( f \) replaced by \( e^{\lambda f / 2} \). Setting \( h(\lambda) = \log \mathbb{E}[e^{\lambda f}] \) and differentiating yields the Herbst differential inequality:

\[
h'(\lambda) - h(\lambda)/\lambda \leq \frac{L^2 \lambda}{2\rho}.
\]

Solving this ODE with initial condition \( h(0) = 0 \) gives \( h(\lambda) \leq L^2 \lambda^2 / (2\rho) \), i.e., \( f \in \mathrm{subG}(L^2/\rho) \). This immediately implies Gaussian concentration.

<div class="theorem">
<strong>Theorem (Gaussian Concentration via Herbst).</strong> If \( \mu \) satisfies the log-Sobolev inequality with constant \( \rho \) and \( f \) is \( L \)-Lipschitz, then
\[
\mu\!\left(f - \mathbb{E}_\mu[f] \geq t\right) \leq \exp\!\left(-\frac{\rho \, t^2}{2 L^2}\right).
\]
</div>

## 2.4 Talagrand's Convex Distance Inequality

One of the deepest results in concentration theory is Talagrand's convex distance inequality, which applies to product probability measures without any smoothness assumption on the function.

<div class="definition">
<strong>Definition (Convex Distance).</strong> For \( x \in \mathcal{X}^n \) and a set \( A \subseteq \mathcal{X}^n \), the convex distance is
\[
d_T(x, A) = \sup_{\alpha \in \mathbb{R}^n, \|\alpha\|_2 \leq 1} \inf_{y \in A} \sum_{i : x_i \neq y_i} \alpha_i.
\]
</div>

The convex distance is a weighted Hamming distance, where the weights \( \alpha \) are chosen adversarially to maximize the distance from \( x \) to the set \( A \).

<div class="theorem">
<strong>Theorem (Talagrand's Convex Distance Inequality).</strong> Let \( \mu = \mu_1 \otimes \cdots \otimes \mu_n \) be a product probability measure on \( \mathcal{X}^n \), and let \( A \subseteq \mathcal{X}^n \). Then for all \( t > 0 \),
\[
\mu(A) \cdot \mu\!\left(d_T(\cdot, A) \geq t\right) \leq \exp\!\left(-\frac{t^2}{4}\right).
\]
</div>

In particular, if \( \mu(A) \geq 1/2 \), then \( \mu(d_T(\cdot, A) \geq t) \leq 2e^{-t^2/4} \). This inequality is remarkable because it applies to all product measures, requires no assumptions on the structure of \( A \), and captures fluctuations of combinatorial statistics that cannot be directly addressed by Lipschitz concentration.

## 2.5 Isoperimetric Inequalities

Isoperimetric inequalities provide the sharpest form of concentration by characterizing the sets of minimal boundary for given volume. The Gaussian isoperimetric inequality is the analogue of the classical Euclidean isoperimetric inequality.

<div class="theorem">
<strong>Theorem (Gaussian Isoperimetric Inequality).</strong> Among all Borel sets \( A \subseteq \mathbb{R}^n \) with \( \gamma(A) = \Phi(s) \) (where \( \Phi \) is the standard normal CDF), the Gaussian surface area \( \gamma^+(A) \) is minimized by half-spaces, achieving \( \gamma^+(A) = \phi(s) \) where \( \phi \) is the standard normal density. Equivalently, for all \( t > 0 \),
\[
\gamma(A_t) \geq \Phi\!\left(\Phi^{-1}(\gamma(A)) + t\right).
\]
</div>

Bobkov's inequality provides a functional form of the Gaussian isoperimetric inequality. Define the isoperimetric function \( I = \phi \circ \Phi^{-1} \). Then for any smooth \( f : \mathbb{R}^n \to [0,1] \),

\[
I(\mathbb{E}_\gamma[f]) \leq \mathbb{E}_\gamma\!\left[\sqrt{I(f)^2 + |\nabla f|^2}\right].
\]

This implies both the Gaussian concentration inequality and the Poincaré inequality as special cases.

---

# Chapter 3: Random Matrix Theory — Wigner Matrices and the Semicircle Law

## 3.1 Wigner Matrices

Random matrix theory studies the spectral properties of large matrices whose entries are random. The fundamental object is the Wigner matrix.

<div class="definition">
<strong>Definition (Wigner Matrix).</strong> A Wigner matrix is a symmetric \( n \times n \) random matrix \( W_n \) where the upper-triangular entries \( \{W_{ij}\}_{i \leq j} \) are independent (up to symmetry), the diagonal entries \( W_{ii} \) have mean zero and variance \( \sigma_d^2 \), and the off-diagonal entries \( W_{ij} \) for \( i < j \) have mean zero and variance \( \sigma^2 \). The normalized matrix is \( \hat{W}_n = W_n / (\sigma\sqrt{n}) \).
</div>

The most important special cases are the Gaussian Orthogonal Ensemble (GOE) and the Gaussian Unitary Ensemble (GUE). In the GOE, off-diagonal entries are \( N(0, 1) \) and diagonal entries are \( N(0, 2) \); the distribution is invariant under orthogonal conjugation \( W \mapsto OWO^T \) for any orthogonal \( O \). In the GUE, the matrix is Hermitian with complex Gaussian off-diagonal entries; it is invariant under unitary conjugation.

<div class="remark">
<strong>Remark (Symmetry Classes).</strong> The three classical random matrix ensembles — GOE, GUE, and GSE (Gaussian Symplectic Ensemble) — correspond respectively to the Dyson index \( \beta = 1, 2, 4 \), counting the dimension of the real division algebra over which the matrix entries live. Many universality results hold for each \( \beta \)-class separately.
</div>

The empirical spectral distribution of \( \hat{W}_n \) is the random measure

\[
\mu_n = \frac{1}{n} \sum_{i=1}^n \delta_{\lambda_i(\hat{W}_n)},
\]

where \( \lambda_1(\hat{W}_n) \leq \cdots \leq \lambda_n(\hat{W}_n) \) are the ordered eigenvalues. Wigner's theorem asserts that \( \mu_n \) converges weakly to a deterministic limit: the semicircle distribution.

## 3.2 Method of Moments

The method of moments is the classical approach to proving convergence of the empirical spectral distribution. The key identity is the trace formula: for any polynomial \( p \),

\[
\int p(\lambda) \, d\mu_n(\lambda) = \frac{1}{n} \mathrm{tr}\, p(\hat{W}_n).
\]

For the \( k \)-th moment, this gives

\[
\int \lambda^k \, d\mu_n(\lambda) = \frac{1}{n} \mathrm{tr}\!\left(\hat{W}_n^k\right) = \frac{1}{n \cdot (\sigma\sqrt{n})^k} \sum_{i_1, \ldots, i_k = 1}^n W_{i_1 i_2} W_{i_2 i_3} \cdots W_{i_k i_1}.
\]

Taking expectations and using the independence and moment conditions, one finds that only certain index paths — those forming a closed walk with no "unseen" edges — contribute non-negligibly. In the limit, only non-crossing pair partitions contribute, and their count is given by the Catalan numbers.

<div class="theorem">
<strong>Theorem (Moments of the Semicircle Law).</strong> The \( k \)-th moment of the standard semicircle distribution on \( \left[-2, 2\right] \) is
\[
m_k = \int_{-2}^{2} \lambda^k \cdot \frac{\sqrt{4 - \lambda^2}}{2\pi} \, d\lambda = \begin{cases} C_{k/2} & \text{if } k \text{ is even,} \\ 0 & \text{if } k \text{ is odd,} \end{cases}
\]
where \( C_m = \frac{1}{m+1}\binom{2m}{m} \) is the \( m \)-th Catalan number.
</div>

The combinatorial argument for the method of moments proceeds by showing that \( \mathbb{E}[\mathrm{tr}(\hat{W}_n^k)/n] \to C_{k/2} \) for each even \( k \). The non-crossing pair partitions — the combinatorial objects counted by Catalan numbers — arise because: (a) for the expectation of a product of independent entries to be non-zero, each edge in the walk must appear at least twice; (b) the constraint that the walk is a closed path on a tree (genus zero) forces the pairing to be non-crossing. The genus expansion for higher-order corrections connects this to the theory of free probability.

## 3.3 Stieltjes Transform Method

A more powerful and analytic approach to the empirical spectral distribution uses the Stieltjes transform.

<div class="definition">
<strong>Definition (Stieltjes Transform).</strong> For a probability measure \( \mu \) on \( \mathbb{R} \), its Stieltjes transform is the function defined on \( \mathbb{C}^+ = \{ z \in \mathbb{C} : \mathrm{Im}(z) > 0 \} \) by
\[
s_\mu(z) = \int \frac{1}{\lambda - z} \, d\mu(\lambda).
\]
</div>

The Stieltjes transform is analytic on \( \mathbb{C}^+ \), satisfies \( \mathrm{Im}(s_\mu(z)) > 0 \) for \( z \in \mathbb{C}^+ \), and determines \( \mu \) uniquely via the inversion formula

\[
\mu\!\left(\left(a, b\right)\right) = \lim_{\eta \to 0^+} \frac{1}{\pi} \int_a^b \mathrm{Im}\!\left(s_\mu(x + i\eta)\right) dx.
\]

For the empirical spectral distribution of \( \hat{W}_n \), the Stieltjes transform is

\[
s_n(z) = \frac{1}{n} \mathrm{tr}\!\left((\hat{W}_n - zI)^{-1}\right) = \frac{1}{n} \sum_{i=1}^n \frac{1}{\lambda_i - z},
\]

which is essentially the normalized trace of the resolvent \( G(z) = (\hat{W}_n - zI)^{-1} \). The strategy is to derive a self-consistency equation for the limiting Stieltjes transform \( s(z) = \lim_n s_n(z) \) using the Schur complement formula and the law of large numbers for quadratic forms.

The self-consistency equation for the Wigner semicircle law is:

\[
s(z) = \frac{1}{-z - s(z)},
\]

or equivalently \( s(z)^2 + z \cdot s(z) + 1 = 0 \). The solution analytic on \( \mathbb{C}^+ \) is

\[
s(z) = \frac{-z + \sqrt{z^2 - 4}}{2},
\]

where the branch cut is chosen so that \( \mathrm{Im}(s(z)) > 0 \). Inverting the Stieltjes transform via the Stieltjes inversion formula recovers the semicircle density.

## 3.4 Wigner's Semicircle Law

<div class="theorem">
<strong>Theorem (Wigner's Semicircle Law).</strong> Let \( \hat{W}_n = W_n/(\sigma\sqrt{n}) \) be a normalized Wigner matrix. Assume the entries have mean zero, variance \( \sigma^2 \) (off-diagonal), and all moments finite. Then the empirical spectral distribution \( \mu_n \) converges weakly in probability to the semicircle distribution \( \mu_{sc} \) with density
\[
\frac{d\mu_{sc}}{d\lambda} = \frac{1}{2\pi}\sqrt{4 - \lambda^2} \cdot \mathbf{1}_{|\lambda| \leq 2}.
\]
</div>

The convergence holds almost surely for GOE/GUE and in probability for general Wigner matrices under the finite fourth moment condition. The proof via the Stieltjes transform method proceeds by:

1. Establishing a self-averaging property: \( s_n(z) - \mathbb{E}[s_n(z)] \to 0 \) in probability using resolvent identities and the Poincaré inequality (or direct variance computation);

2. Showing \( \mathbb{E}[s_n(z)] \to s(z) \) where \( s(z) \) solves the self-consistency equation;

3. Applying the Stieltjes inversion formula to identify the limit as the semicircle law.

## 3.5 Concentration of the Empirical Spectral Distribution

Beyond convergence of the mean spectral distribution, one can quantify the fluctuations of \( \mu_n \) around its mean and the convergence of individual eigenvalues to their semicircle locations.

<div class="theorem">
<strong>Theorem (Concentration of the ESD).</strong> For a Wigner matrix with sub-Gaussian entries, the empirical spectral distribution \( \mu_n \) is concentrated around its expectation \( \mathbb{E}[\mu_n] \) in the Kolmogorov metric. Specifically, for any \( t > 0 \),
\[
\mathbb{P}\!\left(\sup_{x \in \mathbb{R}} \left|F_n(x) - \mathbb{E}[F_n(x)]\right| \geq t\right) \leq 2\exp\!\left(-cn^2 t^2\right),
\]
where \( F_n \) is the empirical CDF of the eigenvalues and \( c > 0 \) is a universal constant.
</div>

This follows from the Lipschitz dependence of the empirical CDF on individual matrix entries, combined with Gaussian concentration. The operator norm of a Wigner matrix also concentrates: for sub-Gaussian Wigner matrices, \( \|\hat{W}_n\|_{\mathrm{op}} \leq 2 + O(n^{-2/3}) \) with high probability, with the \( n^{-2/3} \) fluctuations governed by the Tracy-Widom distribution.

---

# Chapter 4: Sample Covariance Matrices and the Marchenko-Pastur Law

## 4.1 Sample Covariance Matrices

In statistics and data science, the fundamental random matrix is not the Wigner matrix but the sample covariance matrix. Let \( x_1, \ldots, x_n \in \mathbb{R}^p \) be i.i.d. samples from a population with covariance \( \Sigma \). The sample covariance matrix is

\[
\hat{\Sigma}_n = \frac{1}{n} \sum_{i=1}^n x_i x_i^T \quad \text{(assuming zero mean)}.
\]

Writing \( X \) for the \( p \times n \) data matrix with columns \( x_i \), we have \( \hat{\Sigma}_n = n^{-1} X X^T \). When \( \Sigma = I_p \) and the entries \( x_{ij} \) are i.i.d. Gaussian, the matrix \( n\hat{\Sigma}_n \sim W_p(I_p, n) \) follows the Wishart distribution.

The regime of interest is the proportional limit: \( p, n \to \infty \) with \( p/n \to \gamma \in (0, \infty) \). When \( \gamma \leq 1 \), the matrix \( \hat{\Sigma}_n \) is almost surely non-singular for large \( n \); when \( \gamma > 1 \), the matrix is rank-deficient. The empirical spectral distribution of \( \hat{\Sigma}_n \) converges to the Marchenko-Pastur law.

## 4.2 Marchenko-Pastur Distribution

<div class="theorem">
<strong>Theorem (Marchenko-Pastur Law).</strong> Let \( X \) be a \( p \times n \) matrix with i.i.d. entries of mean zero and variance 1. In the limit \( p/n \to \gamma \in (0, \infty) \), the empirical spectral distribution of \( \hat{\Sigma}_n = n^{-1} X X^T \) converges almost surely to the Marchenko-Pastur distribution \( \mu_\gamma \) with density
\[
\frac{d\mu_\gamma}{d\lambda} = \frac{1}{2\pi \gamma \lambda} \sqrt{(\lambda_+ - \lambda)(\lambda - \lambda_-)} \cdot \mathbf{1}_{\left[\lambda_-, \lambda_+\right]}(\lambda) + \left(1 - \frac{1}{\gamma}\right)^+ \delta_0,
\]
where \( \lambda_\pm = (1 \pm \sqrt{\gamma})^2 \).
</div>

The point mass at zero appears when \( \gamma > 1 \), corresponding to the \( p - n \) zero eigenvalues of the rank-\( n \) matrix \( \hat{\Sigma}_n \). The support \( \left[(1-\sqrt{\gamma})^2, (1+\sqrt{\gamma})^2\right] \) shrinks to the point \( \{1\} \) as \( \gamma \to 0 \) (the classical regime \( p \ll n \)) and expands as \( \gamma \to 1 \). The Stieltjes transform of \( \mu_\gamma \) satisfies the self-consistency equation

\[
s(z) = \frac{1}{-z + \gamma - \gamma z \, s(z)},
\]

which can be derived by analogous resolvent arguments to those used for the semicircle law.

<div class="remark">
<strong>Remark (Population Covariance).</strong> When the population covariance is \( \Sigma \neq I \), the empirical spectral distribution of \( \hat{\Sigma}_n \) converges to the free multiplicative convolution of the Marchenko-Pastur law with the spectral distribution of \( \Sigma \). The Stieltjes transform satisfies the more general fixed-point equation \( s(z) = \int \frac{1}{\lambda(1 - \gamma - \gamma z\,s(z)) - z} \, d\mu_\Sigma(\lambda) \), the so-called Silverstein equation.
</div>

## 4.3 Non-Asymptotic Bounds

The asymptotic Marchenko-Pastur law describes what happens in the limit, but for finite \( n \) and \( p \), one needs non-asymptotic bounds on the operator norm and singular values.

<div class="theorem">
<strong>Theorem (Operator Norm of Wishart Matrices).</strong> Let \( X \) be a \( p \times n \) matrix with i.i.d. \( N(0,1) \) entries. Then for any \( t > 0 \),
\[
\mathbb{P}\!\left(\left\|\frac{1}{n} X X^T - I_p\right\|_{\mathrm{op}} \geq \delta + t\right) \leq 2\exp(-cnt^2),
\]
where \( \delta = 2\sqrt{p/n} + p/n \) and \( c > 0 \) is an absolute constant.
</div>

This bound is proved by combining an \( \varepsilon \)-net argument (covering the unit sphere by finitely many points) with a union bound and concentration for individual quadratic forms. The \( \varepsilon \)-net approach works as follows: for any symmetric matrix \( A \), \( \|A\|_{\mathrm{op}} = \sup_{v \in \mathbb{S}^{p-1}} |v^T A v| \). Restricting the supremum to an \( \varepsilon \)-net \( \mathcal{N}_\varepsilon \) of \( \mathbb{S}^{p-1} \) introduces an approximation error of at most \( 2\varepsilon \|A\|_{\mathrm{op}} \). A standard \( 1/4 \)-net has at most \( 9^p \) points, and a union bound over these points combined with a Gaussian concentration inequality for \( v^T A v \) yields the result.

For sub-Gaussian entries, the same bound holds (Vershynin's theorem) with constants depending on the sub-Gaussian norm. The key technical tool is the non-asymptotic concentration of quadratic forms: if \( g \sim N(0, I_n) \), then \( \|Bg\|^2 / n \) concentrates around \( \|B\|_F^2/n \) at the rate governed by \( \|B\|_{\mathrm{op}} \).

---

# Chapter 5: Extremal Eigenvalues and the BBP Transition

## 5.1 Tracy-Widom Fluctuations

Having established the bulk limit (semicircle for Wigner, Marchenko-Pastur for sample covariance), attention turns to the extreme eigenvalues. The fluctuations of the largest eigenvalue are described by the Tracy-Widom distribution.

<div class="theorem">
<strong>Theorem (Tracy-Widom Edge Universality, informal).</strong> For the GOE, the largest eigenvalue \( \lambda_1(\hat{W}_n) \) satisfies
\[
n^{2/3}\!\left(\lambda_1(\hat{W}_n) - 2\right) \xrightarrow{d} \mathrm{TW}_1
\]
as \( n \to \infty \), where \( \mathrm{TW}_1 \) is the Tracy-Widom distribution of index 1, expressed via a Painlevé II transcendent.
</div>

The Tracy-Widom distribution for GUE (\( \mathrm{TW}_2 \)) is expressed as

\[
F_2(t) = \exp\!\left(-\int_t^\infty (s - t) q(s)^2 \, ds\right),
\]

where \( q \) is the Hastings-McLeod solution to the Painlevé II equation \( q'' = sq + 2q^3 \) with asymptotics \( q(s) \sim \mathrm{Ai}(s) \) as \( s \to +\infty \). The scaling exponent \( n^{2/3} \) is characteristic of the soft-edge universality class and contrasts with the \( n^{1/2} \) CLT scaling for linear statistics of eigenvalues. Edge universality holds for all Wigner matrices with sub-exponential entries (Erdős-Schlein-Yau-Yin, Tao-Vu).

## 5.2 Spiked Covariance Models and the BBP Transition

A central problem in high-dimensional statistics is signal detection: given a noisy matrix, can one detect low-rank structure? The BBP (Baik-Ben Arous-Péché) transition answers this question for the spiked covariance model.

<div class="definition">
<strong>Definition (Spiked Covariance Model).</strong> The spiked Wishart model is \( \hat{\Sigma}_n = n^{-1} \Sigma^{1/2} X X^T \Sigma^{1/2} \) where the population covariance has the form \( \Sigma = I_p + \sum_{k=1}^r \theta_k v_k v_k^T \) for signal strengths \( \theta_1 \geq \cdots \geq \theta_r > 0 \) and unit vectors \( v_1, \ldots, v_r \in \mathbb{R}^p \).
</div>

<div class="theorem">
<strong>Theorem (BBP Phase Transition).</strong> In the proportional limit \( p/n \to \gamma \), the \( k \)-th largest eigenvalue of \( \hat{\Sigma}_n \) satisfies:
<ul>
<li>If \( \theta_k > \sqrt{\gamma} \) (above threshold): \( \lambda_k(\hat{\Sigma}_n) \to (1 + \theta_k)(1 + \gamma/\theta_k) \), which lies above the bulk edge \( (1+\sqrt{\gamma})^2 \).</li>
<li>If \( \theta_k \leq \sqrt{\gamma} \) (below threshold): \( \lambda_k(\hat{\Sigma}_n) \to (1+\sqrt{\gamma})^2 \), the bulk edge. No signal separation occurs.</li>
</ul>
</div>

The threshold \( \theta_c = \sqrt{\gamma} \) is sharp. Below it, the signal spike is completely buried in the random noise of the bulk, and no consistent estimation of the spike strength or direction is possible.

## 5.3 PCA in High Dimensions

Principal component analysis (PCA) extracts the top eigenvectors of the sample covariance matrix as estimates of the population principal components. In high dimensions, this procedure is fundamentally inconsistent.

<div class="theorem">
<strong>Theorem (Inconsistency of Sample Eigenvectors).</strong> In the spiked model with a single spike \( \theta > 0 \), let \( \hat{v}_1 \) be the leading eigenvector of \( \hat{\Sigma}_n \). In the proportional limit \( p/n \to \gamma \):
<ul>
<li>If \( \theta > \sqrt{\gamma} \): \( |\langle \hat{v}_1, v_1 \rangle|^2 \to 1 - \frac{\gamma}{\theta^2} \in (0,1) \). The sample eigenvector is correlated with the truth but not consistent.</li>
<li>If \( \theta \leq \sqrt{\gamma} \): \( |\langle \hat{v}_1, v_1 \rangle|^2 \to 0 \). The sample eigenvector is asymptotically orthogonal to the true direction.</li>
</ul>
</div>

This inconsistency is a fundamental statistical barrier, not an artifact of the estimator. It motivates regularized PCA procedures (e.g., sparse PCA, ridge-shrunk PCA) that can overcome the curse of dimensionality by exploiting additional structural assumptions.

---

# Chapter 6: Gaussian Processes

## 6.1 Definitions and Basic Examples

A Gaussian process is a collection of random variables \( \{X_t\}_{t \in T} \) indexed by an arbitrary set \( T \), such that every finite sub-collection \( (X_{t_1}, \ldots, X_{t_k}) \) follows a multivariate Gaussian distribution. A Gaussian process is completely characterized by its mean function \( m(t) = \mathbb{E}[X_t] \) and its covariance kernel \( K(s,t) = \mathrm{Cov}(X_s, X_t) \).

<div class="example">
<strong>Example (Brownian Motion).</strong> Standard Brownian motion \( \{B_t\}_{t \geq 0} \) is a Gaussian process with \( m(t) = 0 \) and \( K(s,t) = \min(s,t) \). The Brownian bridge on \( [0,1] \) has covariance \( K(s,t) = \min(s,t) - st \).
</div>

<div class="example">
<strong>Example (Gaussian Random Fields).</strong> For \( T \subseteq \mathbb{R}^n \), the squared exponential kernel \( K(s,t) = \exp(-\|s-t\|^2/(2\ell^2)) \) defines a Gaussian process with infinitely differentiable sample paths. The Ornstein-Uhlenbeck process has kernel \( K(s,t) = \exp(-|s-t|/\ell) \).
</div>

The natural metric on the index set associated to a Gaussian process is the canonical metric \( d(s,t) = \sqrt{\mathbb{E}[(X_s - X_t)^2]} \). Understanding the supremum \( \sup_{t \in T} X_t \) is a central problem; its distribution and concentration depend on the geometry of \( T \) under \( d \).

## 6.2 Comparison Inequalities

Two of the most useful tools for comparing suprema of Gaussian processes are Slepian's lemma and Gordon's minimax theorem.

<div class="theorem">
<strong>Theorem (Slepian's Lemma).</strong> Let \( X = \{X_t\}_{t \in T} \) and \( Y = \{Y_t\}_{t \in T} \) be two centered Gaussian processes satisfying \( \mathbb{E}[X_t^2] = \mathbb{E}[Y_t^2] \) for all \( t \), and \( \mathbb{E}[(X_s - X_t)^2] \leq \mathbb{E}[(Y_s - Y_t)^2] \) for all \( s, t \in T \). Then
\[
\mathbb{E}\!\left[\sup_{t \in T} X_t\right] \leq \mathbb{E}\!\left[\sup_{t \in T} Y_t\right].
\]
</div>

Slepian's lemma is proved by interpolation: consider the process \( Z_t(\theta) = \sin(\theta) X_t + \cos(\theta) Y_t \) for \( \theta \in [0, \pi/2] \), differentiate \( \mathbb{E}[\sup_t Z_t(\theta)] \) with respect to \( \theta \), and show the derivative is non-negative using the Gaussian integration by parts formula (Stein's lemma).

Gordon's minimax theorem extends Slepian's comparison to processes indexed by product sets and provides lower bounds on minimax quantities.

<div class="theorem">
<strong>Theorem (Gordon's Minimax Theorem).</strong> Let \( X_{tu} \) and \( Y_{tu} \) be centered Gaussian processes indexed by \( T \times U \) satisfying: \( \mathbb{E}[X_{tu}^2] = \mathbb{E}[Y_{tu}^2] \) for all \( t, u \); \( \mathbb{E}[(X_{tu} - X_{t'u'})^2] \geq \mathbb{E}[(Y_{tu} - Y_{t'u'})^2] \) when \( t = t' \); and \( \mathbb{E}[(X_{tu} - X_{t'u'})^2] \leq \mathbb{E}[(Y_{tu} - Y_{t'u'})^2] \) when \( u = u' \). Then
\[
\mathbb{E}\!\left[\min_{t} \max_{u} X_{tu}\right] \leq \mathbb{E}\!\left[\min_{t} \max_{u} Y_{tu}\right].
\]
</div>

Gordon's theorem is the key tool for proving exact recovery thresholds in compressed sensing and establishing performance bounds for convex optimization algorithms in high dimensions.

## 6.3 Metric Entropy and Dudley's Integral

The metric entropy of a set \( T \) captures how complex \( T \) is as a metric space, and it governs the supremum of the associated Gaussian process.

<div class="definition">
<strong>Definition (Covering and Packing Numbers).</strong> The covering number \( N(T, d, \varepsilon) \) is the minimum number of balls of radius \( \varepsilon \) (in metric \( d \)) needed to cover \( T \). The packing number \( M(T, d, \varepsilon) \) is the maximum number of points in \( T \) that are mutually \( \varepsilon \)-separated. These satisfy \( M(T, d, 2\varepsilon) \leq N(T, d, \varepsilon) \leq M(T, d, \varepsilon) \).
</div>

The \( \varepsilon \)-net argument is a fundamental tool: to bound \( \sup_{t \in T} X_t \), discretize \( T \) by an \( \varepsilon \)-net \( T_\varepsilon \) of size \( N(T, d, \varepsilon) \), apply a union bound to control \( \sup_{t \in T_\varepsilon} X_t \), and then control the approximation error.

<div class="theorem">
<strong>Theorem (Dudley's Entropy Integral).</strong> Let \( \{X_t\}_{t \in T} \) be a centered Gaussian process with canonical metric \( d \). Then
\[
\mathbb{E}\!\left[\sup_{t \in T} X_t\right] \lesssim \int_0^{\mathrm{diam}(T)} \sqrt{\log N(T, d, \varepsilon)} \, d\varepsilon,
\]
where the implied constant is absolute (and can be taken to be 12).
</div>

The proof proceeds by a multiscale \( \varepsilon \)-net argument called chaining. Fix a chain of scales \( \varepsilon_k = 2^{-k} \mathrm{diam}(T) \). For each \( t \in T \), let \( \pi_k(t) \) be the nearest point in an \( \varepsilon_k \)-net. Then \( X_t = X_{\pi_K(t)} + \sum_{k=0}^{K-1} (X_{\pi_{k+1}(t)} - X_{\pi_k(t)}) \) (telescoping). The final term \( X_{\pi_K(t)} \) is bounded by taking \( K \) large enough that \( \varepsilon_K \) is below the precision level. Each increment \( X_{\pi_{k+1}(t)} - X_{\pi_k(t)} \) is sub-Gaussian with scale \( \varepsilon_k \), and there are at most \( N(T, d, \varepsilon_k) \) possible values for \( \pi_k(t) \). A union bound at each scale and summing the geometric series gives the integral bound.

## 6.4 Chaining and Fernique's Theorem

Dudley's bound is not always tight. The improvement comes from generic chaining, which optimizes the discretization at each scale.

<div class="definition">
<strong>Definition (Admissible Sequence).</strong> An admissible sequence of \( T \) is a sequence of subsets \( \{T_k\}_{k \geq 0} \) with \( T_0 = \{t_0\} \) (a single point) and \( |T_k| \leq 2^{2^k} \). The \( \gamma_2 \)-functional is defined as
\[
\gamma_2(T, d) = \inf \sup_{t \in T} \sum_{k=0}^\infty 2^{k/2} d(t, T_k),
\]
where the infimum is over all admissible sequences.
</div>

<div class="theorem">
<strong>Theorem (Talagrand's Majorizing Measure Theorem).</strong> For any centered Gaussian process \( \{X_t\}_{t \in T} \) with canonical metric \( d \),
\[
\mathbb{E}\!\left[\sup_{t \in T} X_t\right] \asymp \gamma_2(T, d),
\]
where \( \asymp \) means equality up to universal constants.
</div>

This theorem, proved by Talagrand in 1987 (the upper bound via generic chaining, the lower bound via the majorizing measure theory), is one of the deepest results in the theory of Gaussian processes. It completely characterizes the expected supremum in terms of the geometry of the index set.

<div class="remark">
<strong>Remark (Fernique's Theorem).</strong> As a consequence, the supremum of a Gaussian process over a compact set is almost surely finite, and in fact has Gaussian tails with a rate determined by \( \gamma_2 \). The precise statement is: if \( \mathbb{E}[\sup_t X_t] = m < \infty \), then \( \mathbb{P}(\sup_t X_t \geq m + u) \leq e^{-u^2/(2\sigma^2)} \) where \( \sigma^2 = \sup_t \mathbb{E}[X_t^2] \).
</div>

## 6.5 Applications

The theory of Gaussian processes and covering numbers has numerous applications in high-dimensional statistics.

The Johnson-Lindenstrauss lemma states that \( n \) points in \( \mathbb{R}^d \) can be embedded in \( \mathbb{R}^k \) for \( k = O(\varepsilon^{-2} \log n) \) while preserving all pairwise distances up to a factor \( (1 \pm \varepsilon) \). The proof uses the sub-Gaussian concentration for Gaussian random projections and a union bound over the \( \binom{n}{2} \) pairs of points.

For empirical processes, let \( \mathcal{F} \) be a class of functions on a probability space \( (\mathcal{X}, P) \), and define the empirical process \( G_n(f) = n^{-1/2} \sum_{i=1}^n (f(x_i) - Pf) \). The bracketing entropy of \( \mathcal{F} \) controls the supremum:

\[
\mathbb{E}\!\left[\sup_{f \in \mathcal{F}} |G_n(f)|\right] \lesssim \int_0^\infty \sqrt{\log N_{[\,]}(\varepsilon, \mathcal{F}, L^2(P))} \, d\varepsilon,
\]

which is the Dudley entropy integral bound for empirical processes. This is the fundamental tool for proving uniform laws of large numbers and establishing the rate of convergence of M-estimators.

---

# Chapter 7: Universality and Gaussian Equivalence

## 7.1 Lindeberg Replacement Strategy

Universality in random matrix theory and high-dimensional statistics means that limiting spectral statistics depend only on low-order moments of the entry distribution, not on higher-order details. The main technical tool is the Lindeberg replacement (swapping) strategy.

The idea is elementary: given two random variables \( X \) and \( Y \) with the same mean, variance, and possibly higher moments, replacing \( X \) with \( Y \) in a function \( f \) does not change \( \mathbb{E}[f] \) to high order, provided \( f \) is smooth and the entries are small. Formally, if \( f \) is three-times differentiable and \( X, Y \) match in the first two moments with \( \mathbb{E}[|X|^3] + \mathbb{E}[|Y|^3] \leq C \), then

\[
\left|\mathbb{E}[f(W + X)] - \mathbb{E}[f(W + Y)]\right| \lesssim \|f'''\|_\infty \cdot \mathbb{E}\!\left[|X|^3 + |Y|^3\right].
\]

In the matrix setting, one replaces the entries of the matrix one by one — there are \( n^2 \) entries — and accumulates an error of order \( n^2 \cdot n^{-3/2} = n^{-1/2} \to 0 \) (using that each entry scales as \( n^{-1/2} \) after normalization). This gives universality of any smooth functional of the empirical spectral distribution.

The challenge for edge universality (Tracy-Widom) and local statistics is that the relevant test functions are singular (involving the inverse of the Gram matrix), requiring more delicate resolvent estimates rather than direct Taylor expansion.

## 7.2 Universality of Wigner Semicircle — Four Moment Theorem

<div class="theorem">
<strong>Theorem (Four Moment Theorem, Tao-Vu 2011).</strong> Let \( W_n \) and \( \tilde{W}_n \) be two Wigner matrices whose entries match in the first four moments. Let \( G : \mathbb{R}^n \to \mathbb{R} \) be a smooth function of the \( n \) eigenvalues. Then
\[
\left|\mathbb{E}\!\left[G(\lambda_1(W_n), \ldots, \lambda_n(W_n))\right] - \mathbb{E}\!\left[G(\lambda_1(\tilde{W}_n), \ldots, \lambda_n(\tilde{W}_n))\right]\right| \to 0
\]
as \( n \to \infty \), provided \( G \) satisfies suitable regularity conditions.
</div>

The four moment matching condition (mean, variance, third moment, fourth moment) is necessary for edge universality but not for bulk universality (where matching of two moments suffices for linear statistics). The Tao-Vu proof combines the Lindeberg swapping strategy with detailed resolvent estimates (local semicircle law) developed in the Erdős-Schlein-Yau-Yin program.

The local semicircle law (Erdős et al.) is a much stronger result than the global Wigner theorem: it asserts that the empirical spectral measure matches the semicircle density at optimal local scales, specifically at scales \( \eta \gg 1/n \). This is quantified by controlling the imaginary part of the resolvent \( n^{-1} \mathrm{tr}(W - zI)^{-1} \) uniformly over \( z \) with \( \mathrm{Im}(z) \geq n^{-1+\varepsilon} \).

## 7.3 Gaussian Equivalence Theorems

The Gaussian Equivalence Theorem (GET) is a statistical analogue of universality for models involving non-Gaussian data. It asserts that in the high-dimensional limit, key statistical quantities (e.g., test error, prediction risk) depend on the data distribution only through its first two moments.

The setting is a generalized linear model (GLM): observe \( y_i = \phi(\langle w^*, x_i \rangle) + \text{noise} \), where \( x_i \in \mathbb{R}^p \) is the feature vector, \( w^* \in \mathbb{R}^p \) is the signal, and \( \phi \) is a link function (possibly non-linear, possibly random). The estimator is typically the ERM solution or a regularized estimator.

<div class="theorem">
<strong>Theorem (Gaussian Equivalence Theorem, Goldt-Loureiro-Refinetti-Biroli-Krzakala, 2020; Hu-Lu, 2022).</strong> Consider a GLM with feature vectors \( x_i \in \mathbb{R}^p \) having i.i.d. entries with mean zero, variance \( 1/p \), and bounded higher cumulants. In the proportional limit \( p/n \to \gamma \), the training and generalization error of the ERM estimator converge to those of the corresponding estimator trained on Gaussian data \( \tilde{x}_i \sim N(0, \Sigma_x/p) \) with the same covariance structure.
</div>

The rigorous proof of the GET proceeds via:

1. The CGMT (Convex Gaussian Minimax Theorem), a corollary of Gordon's theorem, which reduces the analysis of the ERM to a two-dimensional optimization problem (the Gordon auxiliary problem) in the Gaussian case.

2. Universality arguments showing that the Gordon auxiliary problem has the same solution for non-Gaussian data as for Gaussian data, provided the first two moments match.

3. A characterization of the limiting risk via a system of fixed-point equations (state evolution equations) that can be solved explicitly for common loss functions and regularizers.

The GET has far-reaching consequences for the analysis of neural networks. For a single-layer neural network (random features model) \( f(x) = \frac{1}{\sqrt{N}} \sum_{j=1}^N a_j \sigma(w_j^T x) \) with random hidden layer \( \{w_j\} \), the generalization error in the proportional limit \( N, p, n \to \infty \) with \( N/n \to \psi \) and \( p/n \to \gamma \) is equivalent to that of a linear estimator with an effective kernel determined by the Hermite expansion of \( \sigma \).

## 7.4 Mean-Field Methods and Free Energy

The GET is closely related to mean-field methods from statistical physics, particularly the replica and cavity methods developed for spin glass models.

The Sherrington-Kirkpatrick (SK) model is the prototypical mean-field spin glass: given a symmetric random matrix \( J_{ij} \sim N(0, 1/n) \), the Hamiltonian is

\[
H_n(\sigma) = \sum_{i < j} J_{ij} \sigma_i \sigma_j + h \sum_i \sigma_i, \quad \sigma \in \{-1, +1\}^n,
\]

and the free energy is \( F_n(\beta) = \frac{1}{n} \log \sum_\sigma e^{-\beta H_n(\sigma)} \). The Parisi formula (Guerra-Toninelli bound, Guerra lower bound, Talagrand's proof 2006) gives the exact limiting free energy:

\[
\lim_{n \to \infty} F_n(\beta) = \inf_{q \in [0,1]} \left\{ \frac{\beta^2}{4}(1 - q)^2 + \mathbb{E}\!\left[\log 2 \cosh\!\left(\beta\sqrt{q} \, z + \beta h\right)\right] \right\},
\]

where \( z \sim N(0,1) \). This is the replica-symmetric Parisi formula; for \( \beta < 1 \) (high temperature), it is exact, while for \( \beta > 1 \) (low temperature), one requires replica symmetry breaking.

The cavity method provides a heuristic (and in many cases rigorous, via the Aizenman-Sims-Starr scheme) way to derive fixed-point equations for the overlaps \( q = n^{-1} \langle \sigma, \tau \rangle \) between two replicas. In the context of the GET, the state evolution equations are the statistical analogues of these fixed-point equations, describing the propagation of uncertainty through the layers of the network.

<div class="remark">
<strong>Remark (Connection to Free Probability).</strong> The Stieltjes transforms arising in random matrix theory are closely related to the \( R \)-transform and \( S \)-transform of free probability theory. The free additive convolution of spectral measures corresponds to adding independent random matrices, and the free multiplicative convolution corresponds to the product of independent matrices. The Marchenko-Pastur distribution is the free Poisson distribution.
</div>

## 7.5 Applications to High-Dimensional Optimization

The universality perspective has profound implications for understanding the loss landscape of random neural networks and the phenomenon of benign overfitting.

**Loss Landscape of Random Neural Networks.** For a two-layer neural network with random first layer weights, the loss landscape as a function of the output layer weights is deterministic in the limit. The empirical risk has a unique global minimum (in the overparameterized regime \( N > n \)) that generalizes well, provided the effective kernel is well-conditioned. The characterization of this minimum uses the GET together with random matrix theory for the random feature matrix.

**Benign Overfitting.** A striking recent discovery is that interpolating estimators (those that exactly fit the training data, achieving zero training error) can generalize well in high dimensions. The classical bias-variance tradeoff predicts that interpolation leads to poor generalization, but this is wrong in the high-dimensional proportional limit when the signal-to-noise ratio is favorable. The minimum-norm interpolator (pseudoinverse solution of the overparameterized least squares problem) achieves near-Bayes optimal risk when \( p/n \to \gamma > 1 \) and the signal strength is above a threshold.

<div class="theorem">
<strong>Theorem (Benign Overfitting, Bartlett-Montanari-Rigollet, informal).</strong> For the minimum-norm interpolating estimator in linear regression with Gaussian design and i.i.d. noise of variance \( \sigma^2 \), the test error in the proportional limit \( p/n \to \gamma > 1 \) is
\[
R(\hat{w}) \to \sigma^2 \cdot \frac{\gamma}{\gamma - 1} + \text{bias term}.
\]
The bias term vanishes if the signal is sufficiently smooth relative to the feature spectrum, yielding consistency even with zero training error.
</div>

The double-descent risk curve — where test error decreases, then increases near the interpolation threshold \( p = n \), then decreases again — is a direct consequence of the random matrix theory for sample covariance matrices. Near \( p/n = 1 \), the smallest singular value of the design matrix approaches zero (the Marchenko-Pastur edge at \( (1-\sqrt{\gamma})^2 \to 0 \)), leading to ill-conditioning. Beyond the threshold, the minimum-norm solution regularizes the estimator, and the risk decreases as \( p/n \) grows.

The GET provides the most comprehensive framework for these analyses: given that the statistical problem depends on the data distribution only through its first two moments in the proportional limit, one can compute exact limiting risk curves using Gaussian calculus — the replica method from physics, now made rigorous by Guerra's interpolation scheme and the CGMT.

---

## Appendix: Key Notations and Quick Reference

The following table summarizes the principal inequalities and their parameters.

| Inequality | Setting | Bound | Applies To |
|---|---|---|---|
| Hoeffding | \( a_i \leq X_i \leq b_i \) | \( \exp(-2t^2 / \sum(b_i-a_i)^2) \) | Bounded sums |
| Bernstein | Sub-exp., variance \( v \), range \( b \) | \( \exp(-t^2/(2v + 2bt/3)) \) | Sub-exp. sums |
| McDiarmid | Bounded differences \( c_i \) | \( \exp(-2t^2 / \sum c_i^2) \) | Functions of indep. variables |
| Efron-Stein | Any \( f \) with \( \mathbb{E}[f^2] < \infty \) | \( \mathrm{Var}(f) \leq \frac{1}{2}\sum \mathbb{E}[(f - f^{(i)})^2] \) | Variance control |
| Log-Sobolev + Herbst | \( L \)-Lipschitz, LSI constant \( \rho \) | \( \exp(-\rho t^2 / (2L^2)) \) | Smooth functions under LSI |
| Talagrand | Product measure, convex distance | \( \mu(A) \cdot \mu(d_T \geq t) \leq e^{-t^2/4} \) | Convex combinatorial sets |
| Dudley | Gaussian process on \( T \) | \( \int_0^\infty \sqrt{\log N(T,d,\varepsilon)}\,d\varepsilon \) | Suprema of GP |

**Sub-Gaussian norm relationships.** If \( X \in \mathrm{subG}(\sigma^2) \), then \( \|X\|_{\psi_2} \asymp \sigma \) and for all \( p \geq 1 \), \( (\mathbb{E}|X|^p)^{1/p} \leq C\sigma\sqrt{p} \). If \( X \in \mathrm{subG}(\sigma^2) \) and \( Y \in \mathrm{subG}(\tau^2) \) are independent, then \( X + Y \in \mathrm{subG}(\sigma^2 + \tau^2) \).

**Spectral distributions summary.** The Wigner semicircle \( \mu_{sc} \) has support \( \left[-2,2\right] \) and moments \( m_{2k} = C_k \). The Marchenko-Pastur law \( \mu_\gamma \) has support \( \left[(1-\sqrt{\gamma})^2, (1+\sqrt{\gamma})^2\right] \) and \( k \)-th free cumulant equal to \( \gamma \). The Tracy-Widom distribution \( \mathrm{TW}_\beta \) has mean \( \mu_\beta \) and variance \( \sigma_\beta^2 \) of order 1, with left tail heavier than right.

**BBP threshold.** In the spiked model with aspect ratio \( \gamma = p/n \), a spike of strength \( \theta \) is detectable if and only if \( \theta > \sqrt{\gamma} \). Above threshold, the outlier eigenvalue converges to \( (1+\theta)(1+\gamma/\theta) \) and the eigenvector correlation to \( \sqrt{1 - \gamma/\theta^2} \).

**GET summary.** For GLMs in the proportional limit, test error equals that under matched-moment Gaussian data. The limiting risk is characterized by fixed-point equations (state evolution) of the form \( q = \mathbb{E}_{(Z,W)}[\eta(q,\lambda)^2] \) where \( \eta \) is the proximal operator of the loss and \( Z, W \) are Gaussian.
