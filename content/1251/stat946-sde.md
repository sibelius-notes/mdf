---
title: "STAT 946: Stochastic Differential Equations"
prof: "Yi Shen"
subjects: "STAT"
---

## Sources and References
**Primary texts** — Bernt Øksendal, *Stochastic Differential Equations: An Introduction with Applications* (6th ed., Springer, 2003); Ioannis Karatzas and Steven Shreve, *Brownian Motion and Stochastic Calculus* (2nd ed., Springer, 1991).
**Supplementary** — Daniel Revuz and Marc Yor, *Continuous Martingales and Brownian Motion* (3rd ed., Springer, 1999); Rogers and Williams, *Diffusions, Markov Processes and Martingales* (Cambridge, 2000).
**Online resources** — Cambridge Part III Stochastic Calculus lecture notes (James Norris); MIT 18.676 Stochastic Calculus lecture notes; Timo Seppäläinen's UW-Madison lecture notes on SDEs.

---

# Chapter 1: Brownian Motion

## Section 1.1: Construction via Wiener Measure

Brownian motion occupies a foundational role in the theory of stochastic differential equations, serving simultaneously as the canonical model of continuous-time random noise and as the driving process in virtually all classical SDEs. Before developing the stochastic calculus needed to formulate and solve SDEs, we must establish the existence of Brownian motion on a rigorous probabilistic footing.

<div class="definition">

<strong>Definition 1.1 (Brownian Motion).</strong> A stochastic process \( (B_t)_{t \geq 0} \) defined on a probability space \( (\Omega, \mathcal{F}, \mathbb{P}) \) is called a <em>standard Brownian motion</em> (or <em>standard Wiener process</em>) if the following conditions hold:

<ol>
<li>\( B_0 = 0 \) almost surely.</li>
<li><em>Independent increments:</em> for any \( 0 \leq t_0 < t_1 < \cdots < t_n \), the increments \( B_{t_1} - B_{t_0}, B_{t_2} - B_{t_1}, \ldots, B_{t_n} - B_{t_{n-1}} \) are mutually independent.</li>
<li><em>Stationary increments:</em> for any \( s < t \), the distribution of \( B_t - B_s \) depends only on \( t - s \).</li>
<li><em>Gaussian marginals:</em> for any \( s < t \), \( B_t - B_s \sim \mathcal{N}(0, t - s) \).</li>
<li><em>Continuous paths:</em> \( t \mapsto B_t(\omega) \) is continuous for \( \mathbb{P} \)-almost every \( \omega \in \Omega \).</li>
</ol>

</div>

Properties (2)–(4) together make \( (B_t) \) a **Gaussian process** with covariance \( \text{Cov}(B_s, B_t) = \min(s, t) \). The central challenge is to exhibit a probability space on which a process satisfying all five conditions simultaneously exists.

### Subsection 1.1.1: Kolmogorov Extension and Consistency

The existence proof proceeds in two stages. First, the Kolmogorov Extension Theorem guarantees existence of a process with the correct finite-dimensional distributions; second, a path-regularity argument (Kolmogorov's continuity criterion) produces a continuous modification.

<div class="theorem">

<strong>Theorem 1.2 (Kolmogorov Extension Theorem).</strong> Let \( I \) be an arbitrary index set. Suppose that for each finite subset \( F \subset I \), we are given a Borel probability measure \( \mu_F \) on \( \mathbb{R}^F \) such that the family \( \{ \mu_F \} \) is <em>consistent</em>: whenever \( F \subset G \), the projection of \( \mu_G \) onto the \( F \)-coordinates equals \( \mu_F \). Then there exists a unique probability measure \( \mu \) on \( (\mathbb{R}^I, \mathcal{B}(\mathbb{R})^{\otimes I}) \) whose restriction to each \( \mathbb{R}^F \) equals \( \mu_F \).

</div>

For Brownian motion, we take \( I = [0, \infty) \) and define \( \mu_{\{t_1, \ldots, t_n\}} \) to be the \( n \)-dimensional Gaussian measure with mean zero and covariance matrix \( \Sigma_{ij} = \min(t_i, t_j) \). Consistency is verified by the properties of Gaussian distributions under marginalization. Kolmogorov's theorem then yields a process \( (B_t)_{t \geq 0} \) on \( \Omega = \mathbb{R}^{[0,\infty)} \) with the correct finite-dimensional distributions.

However, continuity of paths is a property of the trajectory as a whole, not a finite-dimensional property, and so it cannot be read off from the marginals alone. We invoke:

<div class="theorem">

<strong>Theorem 1.3 (Kolmogorov Continuity Criterion).</strong> Let \( (X_t)_{t \in [0,T]} \) be a stochastic process such that for some constants \( \alpha > 0 \), \( \beta > 1 \), \( C < \infty \),

\[
\mathbb{E}\left[ |X_t - X_s|^\alpha \right] \leq C |t - s|^\beta \quad \text{for all } s, t \in [0, T].
\]

Then there exists a modification \( \tilde{X} \) of \( X \) whose paths are Hölder continuous of any exponent \( \gamma \in (0, (\beta - 1)/\alpha) \).

</div>

For the Gaussian process constructed above, \( B_t - B_s \sim \mathcal{N}(0, t-s) \), so for any even integer \( p = 2k \),

\[
\mathbb{E}\left[ |B_t - B_s|^p \right] = (p-1)!! \cdot |t - s|^{p/2}.
\]

Taking \( p = 4 \) gives \( \mathbb{E}\left[ |B_t - B_s|^4 \right] = 3|t-s|^2 \), so the criterion applies with \( \alpha = 4 \), \( \beta = 2 \), yielding Hölder continuity of any exponent \( \gamma < 1/4 \). The continuous modification is the Brownian motion.

## Section 1.2: Non-Differentiability and Quadratic Variation

Although Brownian paths are continuous, they are nowhere differentiable almost surely — a fact that has fundamental consequences for stochastic calculus.

<div class="theorem">

<strong>Theorem 1.4 (Non-Differentiability of Brownian Paths).</strong> Almost surely, \( t \mapsto B_t(\omega) \) is nowhere differentiable.

</div>

<div class="proof">

<strong>Proof (sketch).</strong> Suppose for contradiction that \( B_\cdot(\omega) \) is differentiable at some \( t_0 \in [0,1] \), so there exists \( M < \infty \) such that \( |B_{t_0 + h} - B_{t_0}| \leq M|h| \) for small \( h \). For an integer \( n \), partition \( [0,1] \) into \( n \) intervals of length \( 1/n \). With high probability, for large \( n \), none of the increments \( |B_{k/n} - B_{(k-1)/n}| \) exceeds \( 2M/n \). But each such increment is \( \mathcal{N}(0, 1/n) \), so \( \mathbb{P}(|B_{k/n} - B_{(k-1)/n}| \leq 2M/n) = \mathbb{P}(|Z| \leq 2M/\sqrt{n}) \leq C/\sqrt{n} \). Multiplying over the \( n \) independent increments gives a probability at most \( (C/\sqrt{n})^n \to 0 \). A careful Borel-Cantelli argument completes the proof.

</div>

The correct notion of "variation" for Brownian motion is **quadratic variation**.

<div class="definition">

<strong>Definition 1.5 (Quadratic Variation).</strong> For a continuous process \( (X_t) \) and a partition \( \Pi = \{0 = t_0 < t_1 < \cdots < t_n = T\} \) with mesh \( |\Pi| = \max_i (t_i - t_{i-1}) \), define the quadratic variation sum

\[
Q(\Pi, X) = \sum_{i=1}^n \left( X_{t_i} - X_{t_{i-1}} \right)^2.
\]

We say \( X \) has quadratic variation \( \left\langle X \right\rangle_T \) if \( Q(\Pi_n, X) \to \left\langle X \right\rangle_T \) in probability as \( |\Pi_n| \to 0 \).

</div>

<div class="theorem">

<strong>Theorem 1.6 (Quadratic Variation of Brownian Motion).</strong> For any sequence of partitions \( \Pi_n \) of \( [0,T] \) with \( |\Pi_n| \to 0 \),

\[
\sum_{i} \left( B_{t_i^n} - B_{t_{i-1}^n} \right)^2 \xrightarrow{L^2} T.
\]

In particular, \( \left\langle B \right\rangle_T = T \), often written \( d\left\langle B \right\rangle_t = dt \).

</div>

<div class="proof">

<strong>Proof.</strong> Let \( \Delta_i B = B_{t_i} - B_{t_{i-1}} \) and \( \Delta_i t = t_i - t_{i-1} \). Set \( S_n = \sum_i (\Delta_i B)^2 \). Then \( \mathbb{E}[(\Delta_i B)^2] = \Delta_i t \), so \( \mathbb{E}[S_n] = T \). For the variance:

\[
\text{Var}(S_n) = \sum_i \text{Var}\left( (\Delta_i B)^2 \right) = \sum_i 2(\Delta_i t)^2 \leq 2|\Pi_n| \sum_i \Delta_i t = 2|\Pi_n| T \to 0.
\]

Hence \( S_n \to T \) in \( L^2 \).

</div>

This result — that \( (dB_t)^2 = dt \) in a suitable sense — is the engine behind Itô's formula.

## Section 1.3: Lévy's Characterization Theorem

A fundamental result, due to Paul Lévy, characterizes Brownian motion among continuous martingales purely via its quadratic variation.

<div class="theorem">

<strong>Theorem 1.7 (Lévy's Characterization).</strong> Let \( (M_t)_{t \geq 0} \) be a continuous local martingale with \( M_0 = 0 \) and \( \left\langle M \right\rangle_t = t \) for all \( t \geq 0 \). Then \( M \) is a standard Brownian motion.

</div>

<div class="proof">

<strong>Proof.</strong> Fix \( s < t \) and \( u \in \mathbb{R} \). Define \( Z_r = \exp\left( iu M_r + \frac{u^2}{2} r \right) \) for \( r \geq 0 \). By Itô's formula (developed in Chapter 3):

\[
dZ_r = Z_r \left( iu \, dM_r + \frac{(iu)^2}{2} d\left\langle M \right\rangle_r + \frac{u^2}{2} dr \right) = iu Z_r \, dM_r,
\]

since \( (iu)^2/2 + u^2/2 = 0 \). Thus \( Z_r \) is a local martingale; with appropriate integrability, it is a true martingale. Hence

\[
\mathbb{E}\left[ e^{iu(M_t - M_s)} \mid \mathcal{F}_s \right] = e^{-u^2(t-s)/2},
\]

which is the characteristic function of \( \mathcal{N}(0, t-s) \). Since this holds for all \( u \), the conditional distribution of \( M_t - M_s \) given \( \mathcal{F}_s \) is \( \mathcal{N}(0, t-s) \), establishing that \( M \) has independent, stationary Gaussian increments with continuous paths. By Definition 1.1, \( M \) is a Brownian motion.

</div>

## Section 1.4: Brownian Motion as a Martingale

<div class="theorem">

<strong>Theorem 1.8.</strong> Let \( (\mathcal{F}_t) \) be the natural filtration of \( B \). The following processes are martingales with respect to \( (\mathcal{F}_t) \):
<ol>
<li>\( B_t \)</li>
<li>\( B_t^2 - t \)</li>
<li>\( \exp\!\left(\theta B_t - \frac{\theta^2}{2} t\right) \) for any \( \theta \in \mathbb{R} \).</li>
</ol>

</div>

These martingales — linear, quadratic, and exponential — serve as test functions throughout the theory.

## Section 1.5: Reflection Principle and Running Maximum

<div class="theorem">

<strong>Theorem 1.9 (Reflection Principle).</strong> For any \( a > 0 \) and \( t > 0 \),

\[
\mathbb{P}\!\left( \max_{0 \leq s \leq t} B_s \geq a \right) = 2 \mathbb{P}(B_t \geq a) = 2\left(1 - \Phi\!\left(\frac{a}{\sqrt{t}}\right)\right),
\]

where \( \Phi \) is the standard normal CDF.

</div>

The proof uses the strong Markov property at the hitting time \( \tau_a = \inf\{t : B_t = a\} \): after reaching \( a \), the reflected path is an independent Brownian motion, so \( \mathbb{P}(\tau_a \leq t, B_t < a) = \mathbb{P}(\tau_a \leq t, B_t > a) \), from which the formula follows.

---

# Chapter 2: Martingales and Continuous Semimartingales

## Section 2.1: Filtrations, Adapted Processes, and Stopping Times

Throughout, we fix a filtered probability space \( (\Omega, \mathcal{F}, (\mathcal{F}_t)_{t \geq 0}, \mathbb{P}) \) satisfying the **usual conditions**: the filtration is right-continuous (\( \mathcal{F}_t = \mathcal{F}_{t+} \)) and complete (each \( \mathcal{F}_t \) contains all \( \mathbb{P} \)-null sets of \( \mathcal{F} \)).

<div class="definition">

<strong>Definition 2.1.</strong> A process \( (X_t)_{t \geq 0} \) is <em>adapted</em> to \( (\mathcal{F}_t) \) if \( X_t \) is \( \mathcal{F}_t \)-measurable for each \( t \geq 0 \). It is <em>progressively measurable</em> if for each \( t \geq 0 \), the map \( (\omega, s) \mapsto X_s(\omega) \) is measurable from \( (\Omega \times [0,t], \mathcal{F}_t \otimes \mathcal{B}([0,t])) \) to \( (\mathbb{R}, \mathcal{B}(\mathbb{R})) \).

</div>

<div class="definition">

<strong>Definition 2.2 (Stopping Time).</strong> A random variable \( \tau : \Omega \to [0, \infty] \) is a <em>stopping time</em> if \( \{ \tau \leq t \} \in \mathcal{F}_t \) for all \( t \geq 0 \). The <em>stopped \( \sigma \)-algebra</em> is \( \mathcal{F}_\tau = \{ A \in \mathcal{F} : A \cap \{ \tau \leq t \} \in \mathcal{F}_t \text{ for all } t \} \).

</div>

## Section 2.2: Martingales and the Optional Sampling Theorem

<div class="definition">

<strong>Definition 2.3 (Martingale).</strong> An adapted, integrable process \( (M_t)_{t \geq 0} \) is a <em>martingale</em> if \( \mathbb{E}\left[ M_t \mid \mathcal{F}_s \right] = M_s \) for all \( s \leq t \). It is a <em>supermartingale</em> (resp. <em>submartingale</em>) if \( \mathbb{E}\left[ M_t \mid \mathcal{F}_s \right] \leq M_s \) (resp. \( \geq M_s \)) a.s.

</div>

<div class="theorem">

<strong>Theorem 2.4 (Optional Sampling Theorem).</strong> Let \( (M_t) \) be a right-continuous martingale and \( \sigma \leq \tau \) bounded stopping times. Then \( \mathbb{E}[M_\tau \mid \mathcal{F}_\sigma] = M_\sigma \) a.s.

</div>

<div class="theorem">

<strong>Theorem 2.5 (Doob's Maximal Inequality).</strong> Let \( (M_t)_{t \in [0,T]} \) be a right-continuous martingale. Then for any \( p > 1 \),

\[
\mathbb{E}\!\left[ \sup_{0 \leq t \leq T} |M_t|^p \right] \leq \left(\frac{p}{p-1}\right)^p \mathbb{E}\!\left[ |M_T|^p \right].
\]

For \( p = 2 \), this gives \( \mathbb{E}[\sup_t M_t^2] \leq 4 \mathbb{E}[M_T^2] \).

</div>

## Section 2.3: Uniform Integrability and Closure

<div class="definition">

<strong>Definition 2.6 (Uniform Integrability).</strong> A family \( \{ X_\alpha \} \) of random variables is <em>uniformly integrable</em> if

\[
\lim_{K \to \infty} \sup_\alpha \mathbb{E}\!\left[ |X_\alpha| \mathbf{1}_{\{|X_\alpha| > K\}} \right] = 0.
\]

</div>

<div class="theorem">

<strong>Theorem 2.7.</strong> A martingale \( (M_t)_{t \geq 0} \) is uniformly integrable if and only if it converges almost surely and in \( L^1 \) to a limit \( M_\infty \in L^1 \), and \( M_t = \mathbb{E}[M_\infty \mid \mathcal{F}_t] \).

</div>

## Section 2.4: Local Martingales

<div class="definition">

<strong>Definition 2.8 (Local Martingale).</strong> An adapted process \( (M_t) \) with \( M_0 = 0 \) is a <em>local martingale</em> if there exists a sequence of stopping times \( \tau_n \nearrow \infty \) a.s. such that each stopped process \( M_{t \wedge \tau_n} \) is a martingale.

</div>

Every martingale is a local martingale, but the converse fails. Local martingales arise naturally from stochastic integration: the Itô integral \( \int_0^t H_s \, dB_s \) is a local martingale for any progressively measurable \( H \) with \( \int_0^t H_s^2 \, ds < \infty \) a.s.

## Section 2.5: Continuous Semimartingales

<div class="definition">

<strong>Definition 2.9 (Semimartingale).</strong> A continuous adapted process \( X \) is a <em>continuous semimartingale</em> if it admits a decomposition

\[
X_t = X_0 + M_t + A_t,
\]

where \( M \) is a continuous local martingale with \( M_0 = 0 \), and \( A \) is a continuous adapted process of <em>finite variation</em> with \( A_0 = 0 \). This decomposition is unique.

</div>

The finite-variation component \( A \) may be written \( A_t = \int_0^t a_s \, ds \) for many processes arising in practice, though it can be more general (a signed measure on time).

## Section 2.6: Quadratic Variation and the Kunita-Watanabe Inequality

For two continuous local martingales \( M \) and \( N \), the **quadratic covariation** \( \left\langle M, N \right\rangle \) is defined by polarization:

\[
\left\langle M, N \right\rangle_t = \frac{1}{4}\left( \left\langle M + N \right\rangle_t - \left\langle M - N \right\rangle_t \right).
\]

The process \( M_t N_t - \left\langle M, N \right\rangle_t \) is a local martingale. In terms of partition sums,

\[
\left\langle M, N \right\rangle_t = \lim_{|\Pi| \to 0} \sum_i (M_{t_{i+1}} - M_{t_i})(N_{t_{i+1}} - N_{t_i}) \quad \text{in probability}.
\]

<div class="theorem">

<strong>Theorem 2.10 (Kunita-Watanabe Inequality).</strong> For continuous local martingales \( M \), \( N \) and measurable processes \( H \), \( K \geq 0 \),

\[
\int_0^T H_s K_s \, |d\left\langle M, N \right\rangle_s| \leq \left(\int_0^T H_s^2 \, d\left\langle M \right\rangle_s\right)^{1/2} \left(\int_0^T K_s^2 \, d\left\langle N \right\rangle_s\right)^{1/2}.
\]

</div>

This is a Cauchy-Schwarz inequality for stochastic measures, and it plays a fundamental role in the theory of stochastic integration.

---

# Chapter 3: The Itô Integral

## Section 3.1: Construction for Simple Processes

We aim to define \( \int_0^T H_s \, dB_s \) for progressively measurable \( H \). The strategy parallels the Lebesgue construction: first define the integral for elementary (step) integrands, prove an isometry, then extend by density.

<div class="definition">

<strong>Definition 3.1 (Simple Processes).</strong> A process \( H \) is <em>simple</em> if there exist \( 0 = t_0 < t_1 < \cdots < t_n = T \) and bounded \( \mathcal{F}_{t_{i-1}} \)-measurable random variables \( \xi_{i-1} \) such that

\[
H_t = \sum_{i=0}^{n-1} \xi_i \mathbf{1}_{(t_i, t_{i+1}]}(t).
\]

The Itô integral of a simple process is defined by

\[
\int_0^T H_s \, dB_s = \sum_{i=0}^{n-1} \xi_i (B_{t_{i+1}} - B_{t_i}).
\]

</div>

The use of left endpoints (evaluation at \( t_i \), not \( t_{i+1} \)) is the defining feature distinguishing the Itô integral from the Stratonovich integral.

## Section 3.2: The Itô Isometry

<div class="theorem">

<strong>Theorem 3.2 (Itô Isometry for Simple Processes).</strong> For a simple adapted process \( H \) with \( \mathbb{E}\!\left[\int_0^T H_s^2 \, ds\right] < \infty \),

\[
\mathbb{E}\!\left[\left(\int_0^T H_s \, dB_s\right)^2\right] = \mathbb{E}\!\left[\int_0^T H_s^2 \, ds\right].
\]

</div>

<div class="proof">

<strong>Proof.</strong> Write \( I = \sum_{i=0}^{n-1} \xi_i \Delta_i B \) where \( \Delta_i B = B_{t_{i+1}} - B_{t_i} \).

\[
\mathbb{E}[I^2] = \sum_{i,j} \mathbb{E}[\xi_i \xi_j \Delta_i B \, \Delta_j B].
\]

For \( i \neq j \), say \( i < j \): condition on \( \mathcal{F}_{t_j} \), noting \( \xi_i, \xi_j, \Delta_i B \) are \( \mathcal{F}_{t_j} \)-measurable while \( \Delta_j B \) is independent of \( \mathcal{F}_{t_j} \) with mean zero. Hence the cross terms vanish. For the diagonal terms:

\[
\mathbb{E}[\xi_i^2 (\Delta_i B)^2] = \mathbb{E}\!\left[\mathbb{E}\!\left[\xi_i^2 (\Delta_i B)^2 \mid \mathcal{F}_{t_i}\right]\right] = \mathbb{E}[\xi_i^2 (t_{i+1} - t_i)] = \mathbb{E}\!\left[\int_{t_i}^{t_{i+1}} H_s^2 \, ds\right].
\]

Summing over \( i \) gives the result.

</div>

## Section 3.3: Extension to \( L^2 \)-Adapted Processes

Let \( \mathcal{H}^2(T) \) denote the space of progressively measurable processes \( H \) with

\[
\lVert H \rVert_{\mathcal{H}^2}^2 = \mathbb{E}\!\left[\int_0^T H_s^2 \, ds\right] < \infty.
\]

Simple processes are dense in \( \mathcal{H}^2(T) \). Given \( H \in \mathcal{H}^2(T) \), choose simple \( H^n \to H \) in \( \mathcal{H}^2(T) \). The sequence \( I_n = \int_0^T H^n_s \, dB_s \) is Cauchy in \( L^2(\mathbb{P}) \) by the isometry:

\[
\mathbb{E}\!\left[ (I_n - I_m)^2 \right] = \lVert H^n - H^m \rVert_{\mathcal{H}^2}^2 \to 0.
\]

The limit \( I = \lim_{n\to\infty} I_n \) in \( L^2(\mathbb{P}) \) is defined to be \( \int_0^T H_s \, dB_s \), and is independent of the approximating sequence. The isometry extends:

\[
\mathbb{E}\!\left[\left(\int_0^T H_s \, dB_s\right)^2\right] = \mathbb{E}\!\left[\int_0^T H_s^2 \, ds\right], \quad H \in \mathcal{H}^2(T).
\]

For locally \( L^2 \) integrands (i.e., \( \int_0^t H_s^2 \, ds < \infty \) a.s. for all \( t \)), the integral is defined as a local martingale via a localisation argument.

## Section 3.4: Properties of the Itô Integral

<div class="theorem">

<strong>Theorem 3.3 (Martingale Property).</strong> For \( H \in \mathcal{H}^2(T) \), the process \( \left(\int_0^t H_s \, dB_s\right)_{t \in [0,T]} \) is a continuous square-integrable martingale with quadratic variation

\[
\left\langle \int_0^\cdot H_s \, dB_s \right\rangle_t = \int_0^t H_s^2 \, ds.
\]

</div>

Linearity, adaptedness, and the localised version for \( H \) with \( \int_0^t H_s^2 \, ds < \infty \) a.s. are proved similarly.

## Section 3.5: Itô's Formula

Itô's formula is the cornerstone of stochastic calculus, providing a chain rule adapted to processes with nonzero quadratic variation.

<div class="theorem">

<strong>Theorem 3.4 (Itô's Formula, Scalar Version).</strong> Let \( B \) be a standard Brownian motion and \( f \in C^2(\mathbb{R}) \). Then

\[
f(B_t) = f(B_0) + \int_0^t f'(B_s) \, dB_s + \frac{1}{2}\int_0^t f''(B_s) \, ds.
\]

</div>

<div class="proof">

<strong>Proof.</strong> Apply the Taylor expansion to the increments over a partition \( \Pi \) of \( [0,t] \):

\[
f(B_{t_{i+1}}) - f(B_{t_i}) = f'(B_{t_i})\Delta_i B + \frac{1}{2} f''(B_{t_i}) (\Delta_i B)^2 + R_i,
\]

where \( R_i = O(|\Delta_i B|^3) \). Summing:

\[
f(B_t) - f(B_0) = \sum_i f'(B_{t_i}) \Delta_i B + \frac{1}{2} \sum_i f''(B_{t_i})(\Delta_i B)^2 + \sum_i R_i.
\]

As \( |\Pi| \to 0 \): the first sum converges in \( L^2 \) to \( \int_0^t f'(B_s) \, dB_s \); the second sum converges in probability to \( \frac{1}{2}\int_0^t f''(B_s) \, ds \) by the quadratic variation result (Theorem 1.6) and continuity of \( f'' \circ B \); and the remainder \( \sum_i R_i \to 0 \) in probability. Taking limits completes the proof.

</div>

<div class="theorem">

<strong>Theorem 3.5 (Itô's Formula, General Version).</strong> Let \( X_t = X_0 + \int_0^t b_s \, ds + \int_0^t \sigma_s \, dB_s \) be a continuous semimartingale and \( f \in C^{1,2}([0,\infty) \times \mathbb{R}) \). Then

\[
f(t, X_t) = f(0, X_0) + \int_0^t \frac{\partial f}{\partial s}(s, X_s) \, ds + \int_0^t \frac{\partial f}{\partial x}(s, X_s) \, dX_s + \frac{1}{2}\int_0^t \frac{\partial^2 f}{\partial x^2}(s, X_s) \sigma_s^2 \, ds.
\]

Equivalently, in differential notation: \( df(t, X_t) = \partial_t f \, dt + \partial_x f \, dX_t + \frac{1}{2} \partial_{xx} f \, \sigma_t^2 \, dt \).

</div>

### Subsection 3.5.1: Multidimensional Itô Formula

<div class="theorem">

<strong>Theorem 3.6 (Multidimensional Itô Formula).</strong> Let \( X = (X^1, \ldots, X^d) \) be a vector of continuous semimartingales and \( f \in C^{1,2}([0,\infty) \times \mathbb{R}^d) \). Then

\[
f(t, X_t) = f(0, X_0) + \int_0^t \partial_s f(s, X_s) \, ds + \sum_{k=1}^d \int_0^t \partial_{x_k} f(s, X_s) \, dX^k_s + \frac{1}{2} \sum_{j,k} \int_0^t \partial_{x_j x_k} f(s, X_s) \, d\left\langle X^j, X^k \right\rangle_s.
\]

</div>

### Subsection 3.5.2: Key Examples

**Geometric Brownian Motion.** Take \( f(x) = e^x \) and \( X_t = \mu t + \sigma B_t \). Then

\[
e^{X_t} = e^{X_0} \exp\!\left(\mu t + \sigma B_t\right) \Rightarrow dS_t = S_t(\mu \, dt + \sigma \, dB_t),
\]

where \( S_t = S_0 \exp\left((\mu - \sigma^2/2)t + \sigma B_t\right) \). This is the Black-Scholes model.

**Ornstein-Uhlenbeck Process.** The SDE \( dX_t = -\theta X_t \, dt + \sigma \, dB_t \) has solution

\[
X_t = X_0 e^{-\theta t} + \sigma \int_0^t e^{-\theta(t-s)} \, dB_s,
\]

which follows from applying Itô's formula to \( f(t, X_t) = e^{\theta t} X_t \).

---

# Chapter 4: Strong and Weak Solutions of SDEs

## Section 4.1: Formulation of SDEs

We consider the **stochastic differential equation**

\[
dX_t = b(t, X_t) \, dt + \sigma(t, X_t) \, dB_t, \quad X_0 = x_0,
\]

where \( b : [0,T] \times \mathbb{R}^d \to \mathbb{R}^d \) is the **drift** and \( \sigma : [0,T] \times \mathbb{R}^d \to \mathbb{R}^{d \times m} \) is the **diffusion coefficient**. A solution is a process \( X \) that satisfies the integral form:

\[
X_t = x_0 + \int_0^t b(s, X_s) \, ds + \int_0^t \sigma(s, X_s) \, dB_s.
\]

## Section 4.2: Strong Solutions

<div class="definition">

<strong>Definition 4.1 (Strong Solution).</strong> Given a filtered probability space \( (\Omega, \mathcal{F}, (\mathcal{F}_t), \mathbb{P}) \) and an \( m \)-dimensional Brownian motion \( B \) defined on it, a <em>strong solution</em> to the SDE is an adapted continuous process \( X \) defined on the <em>same</em> probability space such that

\[
X_t = x_0 + \int_0^t b(s, X_s) \, ds + \int_0^t \sigma(s, X_s) \, dB_s \quad \mathbb{P}\text{-a.s. for all } t \geq 0.
\]

</div>

The defining feature of a strong solution is **pathwise construction**: the process \( X \) is built as a measurable functional of the given Brownian path \( B(\cdot, \omega) \). In other words, there exists a measurable map \( F : C([0,\infty); \mathbb{R}^m) \to C([0,\infty); \mathbb{R}^d) \) such that \( X = F(B) \) a.s.

## Section 4.3: Weak Solutions

<div class="definition">

<strong>Definition 4.2 (Weak Solution).</strong> A <em>weak solution</em> to the SDE consists of a probability space \( (\Omega, \mathcal{F}, \mathbb{P}) \), a filtration \( (\mathcal{F}_t) \), an \( m \)-dimensional Brownian motion \( B \) on this space, and an adapted continuous process \( X \) such that the integral equation holds. The probability space and Brownian motion may be chosen as part of the solution.

</div>

<div class="remark">

<strong>Remark 4.3.</strong> A strong solution is always a weak solution (take the given space and Brownian motion). The converse is false in general. A weak solution specifies only the joint distribution of \( (X, B) \) on path space; the Brownian motion \( B \) driving the solution need not be independent of \( X \) on any pre-given space.

</div>

## Section 4.4: Uniqueness Concepts

Two notions of uniqueness arise naturally:

<div class="definition">

<strong>Definition 4.4.</strong> <em>Pathwise uniqueness</em> holds if any two strong solutions \( X \) and \( X' \) defined on the same probability space, driven by the same Brownian motion, and with the same initial condition satisfy \( \mathbb{P}(X_t = X'_t \text{ for all } t \geq 0) = 1 \). <em>Uniqueness in law</em> holds if any two weak solutions with the same initial distribution have the same law on \( C([0,\infty); \mathbb{R}^d) \).

</div>

## Section 4.5: Tanaka's Equation — A Canonical Example

Consider the one-dimensional SDE

\[
dX_t = \text{sgn}(X_t) \, dB_t, \quad X_0 = 0,
\]

where \( \text{sgn}(x) = 1 \) for \( x > 0 \) and \( \text{sgn}(x) = -1 \) for \( x \leq 0 \).

By Lévy's characterization (Theorem 1.7), \( |B_t| \) is a Brownian motion, so \( X_t = |B_t| \) (a reflected Brownian motion) provides a weak solution with \( \tilde{B}_t = \int_0^t \text{sgn}(B_s) \, dB_s \) being the driving Brownian motion. However, the filtration generated by \( X = |B| \) is strictly smaller than that of \( B \), so no strong solution exists: one cannot recover the Brownian motion \( B \) (and hence \( X \)) from \( |B| \) alone. Pathwise uniqueness also fails for this equation.

---

# Chapter 5: Existence and Uniqueness of Solutions

## Section 5.1: The Picard Iteration Theorem

The main existence and uniqueness result for strong solutions under global Lipschitz conditions is proved by a **Picard-Lindelöf iteration** adapted to the stochastic setting.

<div class="theorem">

<strong>Theorem 5.1 (Picard-Lindelöf, Strong Solutions).</strong> Let \( b : [0,T] \times \mathbb{R}^d \to \mathbb{R}^d \) and \( \sigma : [0,T] \times \mathbb{R}^d \to \mathbb{R}^{d \times m} \) satisfy the following conditions for some constant \( K < \infty \):

<ol>
<li><em>Global Lipschitz:</em> for all \( t \in [0,T] \) and \( x, y \in \mathbb{R}^d \),
\[
|b(t,x) - b(t,y)| + \lVert \sigma(t,x) - \sigma(t,y) \rVert \leq K|x - y|.
\]
</li>
<li><em>Linear growth:</em> for all \( t \in [0,T] \) and \( x \in \mathbb{R}^d \),
\[
|b(t,x)| + \lVert \sigma(t,x) \rVert \leq K(1 + |x|).
\]
</li>
</ol>

Then for any \( \mathcal{F}_0 \)-measurable initial condition \( X_0 \) with \( \mathbb{E}[|X_0|^2] < \infty \), the SDE has a unique strong solution \( X \) with continuous paths and \( \mathbb{E}\!\left[\sup_{t \leq T} |X_t|^2\right] < \infty \).

</div>

<div class="proof">

<strong>Proof.</strong> Define the Picard iterates: set \( X^0_t \equiv X_0 \) and for \( n \geq 0 \),

\[
X^{n+1}_t = X_0 + \int_0^t b(s, X^n_s) \, ds + \int_0^t \sigma(s, X^n_s) \, dB_s.
\]

<strong>Step 1: Well-definedness.</strong> Each \( X^n \) is adapted and continuous; by induction and the linear growth condition, \( \mathbb{E}[\sup_{t \leq T} |X^n_t|^2] < \infty \).

<strong>Step 2: Convergence.</strong> Let \( D^n_t = \mathbb{E}\!\left[\sup_{s \leq t} |X^{n+1}_s - X^n_s|^2\right] \). For \( t \leq T \):

\[
X^{n+1}_t - X^n_t = \int_0^t (b(s, X^n_s) - b(s, X^{n-1}_s)) \, ds + \int_0^t (\sigma(s, X^n_s) - \sigma(s, X^{n-1}_s)) \, dB_s.
\]

Applying \( (a+b)^2 \leq 2(a^2 + b^2) \), Cauchy-Schwarz for the Riemann integral, and Doob's maximal inequality (Theorem 2.5) for the stochastic integral:

\[
\mathbb{E}\!\left[\sup_{s \leq t} |X^{n+1}_s - X^n_s|^2\right] \leq 2t \int_0^t \mathbb{E}\!\left[ |b(s,X^n_s) - b(s,X^{n-1}_s)|^2 \right] ds + 8\int_0^t \mathbb{E}\!\left[ \lVert \sigma(s,X^n_s) - \sigma(s,X^{n-1}_s) \rVert^2 \right] ds.
\]

Using the Lipschitz condition:

\[
D^n_t \leq C_T K^2 \int_0^t D^{n-1}_s \, ds,
\]

where \( C_T = 2T + 8 \). Iterating this inequality from \( D^0_t \leq C_0 \) (a finite constant from the well-definedness step) gives

\[
D^n_t \leq C_0 \frac{(C_T K^2 t)^n}{n!}.
\]

Hence \( \sum_n (D^n_T)^{1/2} < \infty \), which implies \( \sum_n \mathbb{E}[\sup_{t \leq T} |X^{n+1}_t - X^n_t|^2]^{1/2} < \infty \). By the Borel-Cantelli lemma (applied to \( L^2 \) summability), the iterates converge uniformly on \( [0,T] \) almost surely and in \( L^2 \) to a continuous adapted process \( X \).

<strong>Step 3: \( X \) solves the SDE.</strong> Taking \( n \to \infty \) in the defining integral equation for \( X^{n+1} \) and using \( L^2 \) convergence, dominated convergence for the drift integral, and isometry convergence for the stochastic integral, we obtain that \( X \) satisfies the SDE.

<strong>Step 4: Uniqueness.</strong> If \( X \) and \( Y \) are two solutions on the same space driven by the same \( B \), set \( e(t) = \mathbb{E}[\sup_{s \leq t} |X_s - Y_s|^2] \). The same estimates give \( e(t) \leq C \int_0^t e(s) \, ds \), and Gronwall's lemma yields \( e(t) = 0 \), so \( X = Y \) a.s.

</div>

## Section 5.2: The Gronwall Inequality

<div class="lemma">

<strong>Lemma 5.2 (Gronwall's Inequality).</strong> Suppose \( u : [0,T] \to [0,\infty) \) is continuous and satisfies

\[
u(t) \leq \alpha + \beta \int_0^t u(s) \, ds
\]

for constants \( \alpha, \beta \geq 0 \). Then \( u(t) \leq \alpha e^{\beta t} \) for all \( t \in [0,T] \).

</div>

<div class="proof">

<strong>Proof.</strong> Set \( v(t) = \alpha + \beta \int_0^t u(s) \, ds \). Then \( u(t) \leq v(t) \) and \( v'(t) = \beta u(t) \leq \beta v(t) \). So \( (e^{-\beta t} v(t))' \leq 0 \), giving \( v(t) \leq v(0) e^{\beta t} = \alpha e^{\beta t} \).

</div>

## Section 5.3: Local Lipschitz Conditions and Explosion

Under only a local Lipschitz condition, solutions may exist only up to an **explosion time** \( \tau_\infty = \lim_{n \to \infty} \tau_n \) where \( \tau_n = \inf\{t : |X_t| \geq n\} \). The solution is unique on \( [0, \tau_\infty) \). Linear growth prevents explosion (\( \tau_\infty = \infty \) a.s.).

## Section 5.4: The Yamada-Watanabe Theorem

A deep result connecting strong and weak existence with uniqueness:

<div class="theorem">

<strong>Theorem 5.3 (Yamada-Watanabe).</strong> If the SDE has a weak solution and if pathwise uniqueness holds, then a strong solution exists and is unique.

</div>

The proof uses a coupling argument: given any two weak solutions possibly on different spaces, one constructs them jointly on a common probability space (via Skorokhod's representation) and appeals to pathwise uniqueness to show they coincide. The measurability of the resulting solution as a functional of the Brownian motion is the key technical step.

<div class="remark">

<strong>Remark 5.4.</strong> The Yamada-Watanabe theorem also applies to one-dimensional SDEs where \( b \) is bounded and measurable and \( \sigma \) satisfies the Yamada-Watanabe condition: \( |\sigma(x) - \sigma(y)| \leq h(|x-y|) \) where \( \int_0^1 h(u)^{-2} du = \infty \). In particular, \( \sigma \) Hölder-\( 1/2 \) is sufficient for pathwise uniqueness, giving strong solutions even when \( \sigma \) is not Lipschitz.

</div>

---

# Chapter 6: The Markov Property

## Section 6.1: Strong Solutions as Markov Processes

<div class="theorem">

<strong>Theorem 6.1 (Markov Property of SDE Solutions).</strong> Let \( X \) be the unique strong solution of the SDE under Lipschitz and linear growth conditions, with deterministic initial condition \( X_0 = x \). Then \( X \) is a time-homogeneous Markov process: for any bounded Borel function \( f \) and \( s \leq t \),

\[
\mathbb{E}[f(X_t) \mid \mathcal{F}_s] = \mathbb{E}^{X_s}[f(X_{t-s})],
\]

where \( \mathbb{E}^y \) denotes expectation starting from \( X_0 = y \).

</div>

The Markov property follows from the pathwise uniqueness and the fact that \( (X_{s+r})_{r \geq 0} \) solves the same SDE starting from \( X_s \), driven by the shifted Brownian motion \( \tilde{B}_r = B_{s+r} - B_s \), which is independent of \( \mathcal{F}_s \).

## Section 6.2: Transition Semigroup

<div class="definition">

<strong>Definition 6.2 (Transition Semigroup).</strong> Define the <em>transition semigroup</em> \( (P_t)_{t \geq 0} \) by

\[
(P_t f)(x) = \mathbb{E}^x[f(X_t)] = \int_{\mathbb{R}^d} f(y) \, p(t, x, dy),
\]

where \( p(t, x, \cdot) \) is the distribution of \( X_t \) starting from \( x \). The semigroup property \( P_{s+t} = P_s \circ P_t \) follows from the Markov property.

</div>

## Section 6.3: The Generator

<div class="definition">

<strong>Definition 6.3 (Infinitesimal Generator).</strong> The <em>generator</em> of the diffusion \( dX_t = b(X_t) \, dt + \sigma(X_t) \, dB_t \) is the differential operator

\[
\mathcal{L} = \sum_{i=1}^d b_i(x) \frac{\partial}{\partial x_i} + \frac{1}{2} \sum_{i,j=1}^d a_{ij}(x) \frac{\partial^2}{\partial x_i \partial x_j},
\]

where \( a = \sigma \sigma^\top \) is the <em>diffusion matrix</em>. For \( f \in C^2_c(\mathbb{R}^d) \),

\[
\mathcal{L} f(x) = \lim_{t \downarrow 0} \frac{(P_t f)(x) - f(x)}{t}.
\]

</div>

The connection between \( \mathcal{L} \) and Itô's formula is immediate: if \( f \in C^2 \), then by Itô's formula,

\[
f(X_t) = f(x) + \int_0^t \mathcal{L} f(X_s) \, ds + \text{(local martingale)},
\]

so \( f(X_t) - \int_0^t \mathcal{L} f(X_s) \, ds \) is a local martingale. This characterizes \( \mathcal{L} \) as the operator such that the above process is a local martingale, which is the **martingale problem** formulation of Stroock and Varadhan.

## Section 6.4: The Strong Markov Property

<div class="theorem">

<strong>Theorem 6.4 (Strong Markov Property).</strong> Under the Lipschitz and linear growth conditions, the solution \( X \) satisfies the <em>strong</em> Markov property: for any stopping time \( \tau < \infty \) a.s. and bounded Borel \( f \),

\[
\mathbb{E}[f(X_{\tau + t}) \mid \mathcal{F}_\tau] = (P_t f)(X_\tau) \quad \mathbb{P}\text{-a.s.}
\]

</div>

The strong Markov property distinguishes diffusions from general Markov processes and allows the analysis of exit times, harmonic functions, and the Feynman-Kac formula.

---

# Chapter 7: The Feynman-Kac Formula and Girsanov's Theorem

## Section 7.1: The Feynman-Kac Formula

The Feynman-Kac formula establishes a profound connection between SDEs and parabolic PDEs. It expresses the solution to a PDE as an expectation over diffusion paths.

<div class="theorem">

<strong>Theorem 7.1 (Feynman-Kac Formula).</strong> Let \( X \) be the unique strong solution of

\[
dX_t = b(X_t) \, dt + \sigma(X_t) \, dB_t
\]

with generator \( \mathcal{L} \). Let \( f, c : \mathbb{R}^d \to \mathbb{R} \) be bounded continuous functions with \( c \geq 0 \). Define

\[
u(t, x) = \mathbb{E}^x\!\left[ f(X_T) \exp\!\left(-\int_t^T c(X_s) \, ds\right) \right].
\]

Then \( u \in C^{1,2}([0,T) \times \mathbb{R}^d) \) and \( u \) solves the terminal-value problem

\[
\frac{\partial u}{\partial t} + \mathcal{L} u - c \cdot u = 0 \quad \text{on } [0,T) \times \mathbb{R}^d, \qquad u(T, x) = f(x).
\]

</div>

<div class="proof">

<strong>Proof.</strong> Define the process \( Y_t = e^{-\int_0^t c(X_s) ds} u(t, X_t) \) for \( t \in [0,T] \). Applying Itô's formula to \( g(t, x) = e^{-\int_0^t c(X_s) ds} u(t, x) \) — more carefully, to the joint process — gives:

\[
dY_t = e^{-\int_0^t c \, ds} \left[ \partial_t u + \mathcal{L} u - c \cdot u \right] dt + e^{-\int_0^t c \, ds} \nabla u \cdot \sigma(X_t) \, dB_t.
\]

If \( u \) satisfies the PDE, the \( dt \)-term vanishes and \( Y_t \) is a local martingale. Under appropriate integrability (which holds under boundedness assumptions), \( Y \) is a true martingale on \( [0,T] \). Then:

\[
Y_t = \mathbb{E}[Y_T \mid \mathcal{F}_t] = \mathbb{E}\!\left[ e^{-\int_0^T c \, ds} u(T, X_T) \mid \mathcal{F}_t \right] = \mathbb{E}\!\left[ e^{-\int_0^T c \, ds} f(X_T) \mid \mathcal{F}_t \right].
\]

On the other hand, \( Y_t = e^{-\int_0^t c \, ds} u(t, X_t) \), so

\[
u(t, X_t) = e^{\int_0^t c \, ds} \mathbb{E}\!\left[ e^{-\int_0^T c \, ds} f(X_T) \mid \mathcal{F}_t \right] = \mathbb{E}^{X_t}\!\left[ f(X_{T-t}) e^{-\int_0^{T-t} c(X_s) ds} \right],
\]

which matches the stated formula (with \( t \) replaced by \( T - t \)). To make this a rigorous proof, one first shows \( u \) as defined by the expectation is indeed in \( C^{1,2} \) (using the smoothness of the fundamental solution under ellipticity conditions), then verifies the martingale property directly.

</div>

<div class="remark">

<strong>Remark 7.2 (Applications).</strong> The Feynman-Kac formula is foundational in mathematical finance: the Black-Scholes PDE is precisely the Feynman-Kac equation for the discounted expected payoff under the risk-neutral measure, driven by geometric Brownian motion.

</div>

## Section 7.2: Girsanov's Theorem

Girsanov's theorem describes how the law of a stochastic process changes under an equivalent change of measure. It is the probabilistic analogue of a change of variables for measures.

### Subsection 7.2.1: Exponential Martingales and Novikov's Condition

<div class="definition">

<strong>Definition 7.3 (Exponential Martingale).</strong> Let \( \theta = (\theta_t)_{t \geq 0} \) be a progressively measurable process. The <em>Doléans-Dade exponential</em> (or <em>stochastic exponential</em>) of \( -\int_0^\cdot \theta_s \, dB_s \) is

\[
\mathcal{E}_t = \exp\!\left(-\int_0^t \theta_s \, dB_s - \frac{1}{2}\int_0^t \theta_s^2 \, ds\right).
\]

By Itô's formula, \( d\mathcal{E}_t = -\theta_t \mathcal{E}_t \, dB_t \), so \( \mathcal{E} \) is a local martingale with \( \mathcal{E}_0 = 1 \).

</div>

<div class="theorem">

<strong>Theorem 7.4 (Novikov's Condition).</strong> If

\[
\mathbb{E}\!\left[\exp\!\left(\frac{1}{2}\int_0^T \theta_s^2 \, ds\right)\right] < \infty,
\]

then \( (\mathcal{E}_t)_{t \in [0,T]} \) is a uniformly integrable martingale. In particular, \( \mathbb{E}[\mathcal{E}_T] = 1 \).

</div>

Novikov's condition ensures \( \mathcal{E} \) is a true martingale (not just a local one), which is necessary for the change-of-measure to produce a probability measure.

### Subsection 7.2.2: The Girsanov Theorem

<div class="theorem">

<strong>Theorem 7.5 (Girsanov).</strong> Let \( B \) be an \( m \)-dimensional Brownian motion on \( (\Omega, \mathcal{F}, (\mathcal{F}_t), \mathbb{P}) \) and let \( \theta = (\theta_t)_{t \in [0,T]} \) satisfy Novikov's condition. Define a new measure \( \tilde{\mathbb{P}} \) on \( \mathcal{F}_T \) by

\[
\frac{d\tilde{\mathbb{P}}}{d\mathbb{P}} = \mathcal{E}_T.
\]

Then the process

\[
\tilde{B}_t = B_t + \int_0^t \theta_s \, ds
\]

is a Brownian motion under \( \tilde{\mathbb{P}} \).

</div>

<div class="proof">

<strong>Proof.</strong> Since \( \mathcal{E}_T > 0 \) and \( \mathbb{E}[\mathcal{E}_T] = 1 \), \( \tilde{\mathbb{P}} \) is indeed a probability measure equivalent to \( \mathbb{P} \). We use Lévy's characterization: it suffices to show \( \tilde{B} \) is a continuous local martingale under \( \tilde{\mathbb{P}} \) with \( \left\langle \tilde{B} \right\rangle_t = t \).

The quadratic variation is unaffected by the change of measure (it is a pathwise property): \( \left\langle \tilde{B} \right\rangle_t = \left\langle B \right\rangle_t = t \). For the martingale property, we use the abstract Bayes formula: for \( s < t \) and bounded \( F_s \)-measurable \( Z \),

\[
\tilde{\mathbb{E}}[Z \tilde{B}_t] = \mathbb{E}[Z \tilde{B}_t \mathcal{E}_T].
\]

One computes \( d(\mathcal{E}_t \tilde{B}_t) = \tilde{B}_t \, d\mathcal{E}_t + \mathcal{E}_t \, d\tilde{B}_t + d\left\langle \mathcal{E}, \tilde{B} \right\rangle_t \). Here \( d\mathcal{E}_t = -\theta_t \mathcal{E}_t \, dB_t \) and \( d\tilde{B}_t = dB_t + \theta_t \, dt \), so \( d\left\langle \mathcal{E}, \tilde{B} \right\rangle_t = -\theta_t \mathcal{E}_t \, dt \). Thus

\[
d(\mathcal{E}_t \tilde{B}_t) = \tilde{B}_t \, d\mathcal{E}_t + \mathcal{E}_t \, dB_t + \mathcal{E}_t \theta_t \, dt - \theta_t \mathcal{E}_t \, dt = \tilde{B}_t \, d\mathcal{E}_t + \mathcal{E}_t \, dB_t,
\]

which is a (local) \( \mathbb{P} \)-martingale. Under Novikov's condition and appropriate integrability, this is a true martingale, giving \( \mathbb{E}[\mathcal{E}_t \tilde{B}_t \mid \mathcal{F}_s] = \mathcal{E}_s \tilde{B}_s \), i.e., \( \tilde{\mathbb{E}}[\tilde{B}_t \mid \mathcal{F}_s] = \tilde{B}_s \). By Lévy's theorem, \( \tilde{B} \) is a \( \tilde{\mathbb{P}} \)-Brownian motion.

</div>

### Subsection 7.2.3: Cameron-Martin Theorem

A special case of Girsanov's theorem arises when \( \theta_t = h'(t) \) is deterministic:

<div class="theorem">

<strong>Theorem 7.6 (Cameron-Martin).</strong> Let \( h \in H^1([0,T]) \) (i.e., \( h \) is absolutely continuous with \( \int_0^T (h'(t))^2 dt < \infty \)). Define \( \tilde{\mathbb{P}} \) by

\[
\frac{d\tilde{\mathbb{P}}}{d\mathbb{P}} = \exp\!\left(\int_0^T h'(t) \, dB_t - \frac{1}{2}\int_0^T (h'(t))^2 \, dt\right).
\]

Then under \( \tilde{\mathbb{P}} \), the process \( B_t - h(t) \) is a standard Brownian motion.

</div>

### Subsection 7.2.4: Applications

**Finance — Risk-Neutral Measure.** In the Black-Scholes model, \( dS_t = \mu S_t \, dt + \sigma S_t \, dB_t \). Under the change of measure with \( \theta_t = (\mu - r)/\sigma \), the drift changes to \( r \) (the risk-free rate), and \( S \) becomes a martingale after discounting. This is the risk-neutral (or equivalent martingale) measure.

**Statistics — Likelihood Ratio.** The Radon-Nikodym derivative \( d\tilde{\mathbb{P}}/d\mathbb{P} \) serves as the likelihood ratio for discriminating between two drift models \( \mu_1 \) and \( \mu_2 \) based on observations of the path \( (X_t)_{t \in [0,T]} \). This is the basis for hypothesis testing for diffusion models.

---

# Chapter 8: SDEs with Respect to Continuous Semimartingales

## Section 8.1: The Stratonovich Integral

The Stratonovich integral is an alternative stochastic integral that uses midpoint evaluation rather than left-endpoint evaluation, and enjoys the ordinary chain rule (unlike the Itô integral).

<div class="definition">

<strong>Definition 8.1 (Stratonovich Integral).</strong> For continuous semimartingales \( H \) and \( X \), the <em>Stratonovich integral</em> is defined by

\[
\int_0^t H_s \circ dX_s = \int_0^t H_s \, dX_s + \frac{1}{2} \left\langle H, X \right\rangle_t,
\]

where the first term on the right is the Itô integral and \( \left\langle H, X \right\rangle_t \) is the quadratic covariation.

</div>

<div class="theorem">

<strong>Theorem 8.2 (Stratonovich Chain Rule).</strong> For \( f \in C^2(\mathbb{R}) \) and a continuous semimartingale \( X \),

\[
f(X_t) = f(X_0) + \int_0^t f'(X_s) \circ dX_s.
\]

</div>

This is the ordinary chain rule without a correction term, which makes the Stratonovich integral the natural choice in geometric contexts (e.g., SDEs on manifolds).

<div class="proof">

<strong>Proof.</strong> By Itô's formula:

\[
f(X_t) = f(X_0) + \int_0^t f'(X_s) \, dX_s + \frac{1}{2}\int_0^t f''(X_s) \, d\left\langle X \right\rangle_s.
\]

On the other hand, by the Itô-Stratonovich correction formula and the fact that \( d\left\langle f'(X), X \right\rangle_s = f''(X_s) \, d\left\langle X \right\rangle_s \):

\[
\int_0^t f'(X_s) \circ dX_s = \int_0^t f'(X_s) \, dX_s + \frac{1}{2}\int_0^t f''(X_s) \, d\left\langle X \right\rangle_s.
\]

These two expressions for \( f(X_t) - f(X_0) \) coincide.

</div>

## Section 8.2: The Itô-Stratonovich Correction

For the SDE \( dX_t = b(X_t) \, dt + \sigma(X_t) \, dB_t \), the Stratonovich version reads:

\[
dX_t = b(X_t) \, dt + \sigma(X_t) \circ dB_t.
\]

Converting: since \( \left\langle \sigma(X), B \right\rangle_t = \int_0^t \sigma'(X_s) \sigma(X_s) \, ds \) (by Itô's formula applied to \( \sigma(X) \)), the Itô form has drift:

\[
b_{\text{Itô}}(x) = b(x) - \frac{1}{2}\sigma'(x)\sigma(x).
\]

Equivalently, a Stratonovich SDE with coefficients \( (b, \sigma) \) corresponds to an Itô SDE with drift \( b - \frac{1}{2}\sigma'\sigma \) and the same diffusion coefficient \( \sigma \).

## Section 8.3: SDEs Driven by General Continuous Semimartingales

<div class="definition">

<strong>Definition 8.3.</strong> Let \( Z = (Z^1, \ldots, Z^m) \) be a vector of continuous semimartingales. The SDE

\[
dX_t = b(t, X_t) \, dt + \sum_{k=1}^m \sigma_k(t, X_t) \, dZ^k_t
\]

is understood in the integral sense:

\[
X_t = X_0 + \int_0^t b(s, X_s) \, ds + \sum_{k=1}^m \int_0^t \sigma_k(s, X_s) \, dZ^k_s,
\]

where the last integrals are Itô integrals with respect to the semimartingales \( Z^k \).

</div>

Under suitable Lipschitz conditions on the coefficients and local square-integrability of the semimartingale drivers, the existence and uniqueness theory extends from the Brownian case. The proofs proceed via the same Picard iteration, using the isometric properties of stochastic integrals with respect to semimartingales.

## Section 8.4: Stability of Solutions

<div class="theorem">

<strong>Theorem 8.4 (Stability with Respect to Coefficients).</strong> Suppose \( b^n \to b \) and \( \sigma^n \to \sigma \) locally uniformly, and that \( X^n_0 \to X_0 \) in \( L^2 \). Let \( X^n \) and \( X \) be the corresponding strong solutions under Lipschitz conditions. Then

\[
\mathbb{E}\!\left[\sup_{t \leq T} |X^n_t - X_t|^2\right] \to 0.
\]

</div>

This stability result ensures that the solution depends continuously on its data — initial conditions and coefficients — which is essential for numerical approximations such as the Euler-Maruyama scheme.

## Section 8.5: The Euler-Maruyama Approximation

A natural numerical method for the SDE \( dX_t = b(X_t) \, dt + \sigma(X_t) \, dB_t \) is the **Euler-Maruyama scheme**: for a partition \( 0 = t_0 < t_1 < \cdots < t_n = T \) with step \( h = T/n \),

\[
X^n_{t_{k+1}} = X^n_{t_k} + b(X^n_{t_k}) h + \sigma(X^n_{t_k})(B_{t_{k+1}} - B_{t_k}).
\]

Under global Lipschitz and linear growth conditions, this scheme converges to the true solution: the strong error satisfies

\[
\mathbb{E}\!\left[\sup_{k} |X_{t_k} - X^n_{t_k}|^2\right] \leq C \cdot h.
\]

The proof is a discrete analogue of the Picard convergence argument.

## Section 8.6: Lévy's Theorem and Equivalences for Semimartingales

<div class="theorem">

<strong>Theorem 8.5 (Lévy Characterization for Semimartingales).</strong> Let \( M = (M^1, \ldots, M^m) \) be a vector of continuous local martingales with \( M_0 = 0 \) and \( \left\langle M^i, M^j \right\rangle_t = \delta_{ij} t \). Then \( M \) is a standard \( m \)-dimensional Brownian motion.

</div>

This generalizes Theorem 1.7 and shows that the Brownian structure is entirely determined by the quadratic variation structure — a fact that underpins the equivalence of different formulations of stochastic integration.

---

# Appendix: Summary of Key Formulas

**Itô's formula** (scalar): for \( f \in C^{1,2} \) and \( dX = b \, dt + \sigma \, dB \),

\[
df(t, X_t) = \partial_t f \, dt + \partial_x f \, dX_t + \frac{1}{2}\partial_{xx} f \cdot \sigma^2 \, dt.
\]

**Itô isometry**:

\[
\mathbb{E}\!\left[\left(\int_0^T H_s \, dB_s\right)^2\right] = \mathbb{E}\!\left[\int_0^T H_s^2 \, ds\right].
\]

**Girsanov's theorem**: under \( d\tilde{\mathbb{P}}/d\mathbb{P} = \mathcal{E}_T \) where \( \mathcal{E}_t = \exp(-\int_0^t \theta_s \, dB_s - \frac{1}{2}\int_0^t \theta_s^2 \, ds) \), the process \( \tilde{B}_t = B_t + \int_0^t \theta_s \, ds \) is a \( \tilde{\mathbb{P}} \)-Brownian motion.

**Feynman-Kac**: \( u(t,x) = \mathbb{E}^x\!\left[f(X_T) e^{-\int_t^T c(X_s) ds}\right] \) solves \( \partial_t u + \mathcal{L} u - cu = 0 \), \( u(T,\cdot) = f \).

**Quadratic variation of Brownian motion**: \( \left\langle B \right\rangle_t = t \); equivalently \( (dB_t)^2 = dt \).

**Stratonovich–Itô conversion**: \( \int_0^t H \circ dX = \int_0^t H \, dX + \frac{1}{2}\left\langle H, X \right\rangle_t \).

**Generator of diffusion** \( dX = b(X) \, dt + \sigma(X) \, dB \):

\[
\mathcal{L} = \sum_i b_i \partial_{x_i} + \frac{1}{2}\sum_{i,j} (\sigma\sigma^\top)_{ij} \partial_{x_i x_j}.
\]
