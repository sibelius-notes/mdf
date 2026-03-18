---
title: "AMATH 477/677: Introduction to Applied Stochastic Processes"
prof: "N. Sri Namachchivaya"
---

These notes follow the Fall 2021 lectures of Professor N. Sri Namachchivaya for AMATH 477/677 at the University of Waterloo. The course develops the theory of applied stochastic processes from first principles in probability, through martingales and Markov chains, to the Kalman filter — the central algorithmic achievement connecting all threads.

---

# Lecture 1: Course Overview and Motivation

Applied stochastic processes arise whenever a deterministic model is insufficient because of inherent randomness in the system, uncertainty in initial conditions, or noise corrupting observations. Professor Namachchivaya opens the course by surveying five motivating contexts that will recur throughout the semester.

**Random walk and the heat equation.** A particle performing a simple random walk on the integers — stepping right with probability <span>&#92;(1/2&#92;)</span> and left with probability <span>&#92;(1/2&#92;)</span> — gives rise, in the diffusive limit, to the heat equation <span>&#92;(&#92;partial_t u = &#92;frac{1}{2}&#92;partial_{xx} u&#92;)</span>. This passage from discrete randomness to a continuous partial differential equation is the prototype for the entire theory of diffusion processes developed later.

**Black–Scholes and financial mathematics.** The log-normal model for asset prices, <span>&#92;(dS = &#92;mu S&#92;,dt + &#92;sigma S&#92;,dW&#92;)</span>, requires stochastic calculus (AMATH 777) for its full treatment, but the probabilistic foundations — Brownian motion, martingales, conditional expectation — are built in this course.

**Sequential decision-making and change-point detection.** Many engineering and statistical problems require detecting a change in the distribution of a data stream as quickly as possible while controlling the false-alarm rate. Optimal stopping theory and martingale methods provide the rigorous framework.

**Kalman filter and data assimilation.** The linear-Gaussian filtering problem — estimating a hidden state <span>&#92;(X_k&#92;)</span> from noisy observations <span>&#92;(Y_k = H_k X_k + V_k&#92;)</span> — is solved exactly by the discrete-time Kalman filter, the culminating topic of the course. In geophysical and meteorological applications, this is called data assimilation: blending model predictions with real observations to produce optimal state estimates.

**Gaussian PDF evolution for dynamical systems.** For a linear stochastic differential equation <span>&#92;(dX = AX&#92;,dt + B&#92;,dW&#92;)</span>, the probability density of the state remains Gaussian for all time, with mean and covariance satisfying tractable ordinary differential equations. This deterministic evolution of uncertainty is at the heart of practical filtering.

The course is organized in five parts: (1) review of probability and random variables; (2) MMSE estimation and projections in <span>&#92;(L^2&#92;)</span>; (3) random processes, martingales, and Markov chains; (4) the filtering problem; (5) ODE supplement. The mathematical language throughout is measure-theoretic probability, introduced carefully in the early lectures.

---

# Lecture 2: Basic Probability — Foundations

## Probability Spaces

<div class="definition">
A <strong>probability space</strong> is a triple <span>&#92;((&#92;Omega, &#92;mathcal{F}, P)&#92;)</span>, where:
<ul>
<li><span>&#92;(&#92;Omega&#92;)</span> is the <em>sample space</em>, the set of all possible outcomes <span>&#92;(&#92;omega&#92;)</span>.</li>
<li><span>&#92;(&#92;mathcal{F}&#92;)</span> is a <span>&#92;(&#92;sigma&#92;)</span>-algebra of subsets of <span>&#92;(&#92;Omega&#92;)</span>, called <em>events</em>.</li>
<li><span>&#92;(P : &#92;mathcal{F} &#92;to [0,1]&#92;)</span> is a <em>probability measure</em>.</li>
</ul>
</div>

A <span>&#92;(&#92;sigma&#92;)</span>-algebra <span>&#92;(&#92;mathcal{F}&#92;)</span> satisfies three axioms: (i) <span>&#92;(&#92;Omega &#92;in &#92;mathcal{F}&#92;)</span>; (ii) if <span>&#92;(A &#92;in &#92;mathcal{F}&#92;)</span> then <span>&#92;(A^c &#92;in &#92;mathcal{F}&#92;)</span>; (iii) if <span>&#92;(A_1, A_2, &#92;ldots &#92;in &#92;mathcal{F}&#92;)</span> then <span>&#92;(&#92;bigcup_{n=1}^&#92;infty A_n &#92;in &#92;mathcal{F}&#92;)</span>. The closure under countable unions, combined with complementation, implies closure under countable intersections by De Morgan's law: <span>&#92;((&#92;bigcup_n A_n)^c = &#92;bigcap_n A_n^c&#92;)</span>.

The Kolmogorov axioms for the probability measure are: (i) <span>&#92;(P(A) &#92;ge 0&#92;)</span> for all <span>&#92;(A &#92;in &#92;mathcal{F}&#92;)</span>; (ii) <span>&#92;(P(&#92;Omega) = 1&#92;)</span>; (iii) countable additivity — if <span>&#92;(A_1, A_2, &#92;ldots&#92;)</span> are pairwise disjoint then <span>&#92;(P(&#92;bigcup_n A_n) = &#92;sum_n P(A_n)&#92;)</span>.

From these axioms one derives: <span>&#92;(P(&#92;emptyset) = 0&#92;)</span> (take <span>&#92;(A_n = &#92;emptyset&#92;)</span> for all <span>&#92;(n&#92;)</span> in countable additivity); <span>&#92;(P(A^c) = 1 - P(A)&#92;)</span>; the inclusion-exclusion principle <span>&#92;(P(A &#92;cup B) = P(A) + P(B) - P(A &#92;cap B)&#92;)</span>; and the monotonicity <span>&#92;(A &#92;subseteq B &#92;Rightarrow P(A) &#92;le P(B)&#92;)</span>.

## Continuity of Probability

<div class="theorem">
<strong>Continuity from below.</strong> If <span>&#92;(A_1 &#92;subseteq A_2 &#92;subseteq &#92;cdots&#92;)</span> and <span>&#92;(A = &#92;bigcup_n A_n&#92;)</span>, then <span>&#92;(P(A_n) &#92;uparrow P(A)&#92;)</span>.

<strong>Continuity from above.</strong> If <span>&#92;(A_1 &#92;supseteq A_2 &#92;supseteq &#92;cdots&#92;)</span> and <span>&#92;(A = &#92;bigcap_n A_n&#92;)</span>, then <span>&#92;(P(A_n) &#92;downarrow P(A)&#92;)</span>.
</div>

Both results follow from writing the limit set as a disjoint union and applying countable additivity.

---

# Lecture 3: Random Variables and Distributions

## Random Variables

<div class="definition">
A <strong>random variable</strong> is a measurable function <span>&#92;(X : &#92;Omega &#92;to &#92;mathbb{R}&#92;)</span>, meaning that for every Borel set <span>&#92;(B &#92;in &#92;mathcal{B}(&#92;mathbb{R})&#92;)</span>, the preimage <span>&#92;(X^{-1}(B) = &#92;{&#92;omega : X(&#92;omega) &#92;in B&#92;} &#92;in &#92;mathcal{F}&#92;)</span>.
</div>

The Borel <span>&#92;(&#92;sigma&#92;)</span>-algebra <span>&#92;(&#92;mathcal{B}(&#92;mathbb{R})&#92;)</span> is the smallest <span>&#92;(&#92;sigma&#92;)</span>-algebra containing all open intervals. It contains all open sets, closed sets, and countable intersections and unions thereof. The real line is uncountable, which motivates the introduction of the Borel structure: we cannot sensibly assign probability to every subset of <span>&#92;(&#92;mathbb{R}&#92;)</span> (the Vitali construction shows this would violate countable additivity), so we restrict to measurable sets.

**Discrete examples.** A fair coin toss has <span>&#92;(&#92;Omega = &#92;{H, T&#92;}&#92;)</span>. Define <span>&#92;(X(H) = 1&#92;)</span>, <span>&#92;(X(T) = 0&#92;)</span>. Then <span>&#92;(X&#92;)</span> follows the Bernoulli(1/2) distribution. More generally, <span>&#92;(X &#92;sim &#92;text{Bernoulli}(p)&#92;)</span> has <span>&#92;(P(X=1)=p&#92;)</span> and <span>&#92;(P(X=0)=1-p&#92;)</span>.

The **Geometric** distribution models the number of trials until the first success in a sequence of independent Bernoulli trials: <span>&#92;(P(X=k) = (1-p)^{k-1}p&#92;)</span>, <span>&#92;(k = 1, 2, &#92;ldots&#92;)</span>.

The **Poisson** distribution models the number of events in a fixed time interval when events occur at constant average rate <span>&#92;(&#92;lambda&#92;)</span>: <span>&#92;(P(X=k) = e^{-&#92;lambda}&#92;lambda^k/k!&#92;)</span>, <span>&#92;(k = 0, 1, 2, &#92;ldots&#92;)</span>

The **Binomial** distribution counts successes in <span>&#92;(n&#92;)</span> independent Bernoulli trials: <span>&#92;(P(X=k) = &#92;binom{n}{k}p^k(1-p)^{n-k}&#92;)</span>.

---

# Lecture 4: Distributions, Expectation, and Properties

## Cumulative Distribution Function

<div class="definition">
The <strong>cumulative distribution function (CDF)</strong> of a random variable <span>&#92;(X&#92;)</span> is <span>&#92;(F_X(x) = P(X &#92;le x)&#92;)</span> for <span>&#92;(x &#92;in &#92;mathbb{R}&#92;)</span>.
</div>

The CDF has three fundamental properties: (i) **monotonicity** — <span>&#92;(x &#92;le y &#92;Rightarrow F(x) &#92;le F(y)&#92;)</span>; (ii) **limits** — <span>&#92;(&#92;lim_{x &#92;to -&#92;infty} F(x) = 0&#92;)</span> and <span>&#92;(&#92;lim_{x &#92;to +&#92;infty} F(x) = 1&#92;)</span>; (iii) **right-continuity** — <span>&#92;(&#92;lim_{y &#92;downarrow x} F(y) = F(x)&#92;)</span>. These properties follow directly from the continuity of probability and the axioms.

For a continuous random variable, the **probability density function (PDF)** <span>&#92;(p_X(x)&#92;)</span> satisfies <span>&#92;(F_X(x) = &#92;int_{-&#92;infty}^x p_X(t)&#92;,dt&#92;)</span> and <span>&#92;(p_X(x) &#92;ge 0&#92;)</span>, <span>&#92;(&#92;int_{-&#92;infty}^&#92;infty p_X(x)&#92;,dx = 1&#92;)</span>.

## Expectation

The **expectation** of a random variable is defined as the Lebesgue integral with respect to the probability measure: <span>&#92;(E[X] = &#92;int_&#92;Omega X(&#92;omega)&#92;,dP(&#92;omega)&#92;)</span>. For a discrete random variable, this reduces to <span>&#92;(E[X] = &#92;sum_k k&#92;, P(X=k)&#92;)</span>, and for a continuous one, <span>&#92;(E[X] = &#92;int_{-&#92;infty}^&#92;infty x&#92;, p_X(x)&#92;,dx&#92;)</span>.

For the binomial distribution <span>&#92;(X &#92;sim &#92;text{Binomial}(n,p)&#92;)</span>, <span>&#92;(E[X] = np&#92;)</span>. This follows from writing <span>&#92;(X = &#92;sum_{i=1}^n X_i&#92;)</span> where <span>&#92;(X_i&#92;)</span> are i.i.d. Bernoulli, and using linearity of expectation. For the geometric distribution, <span>&#92;(E[X] = 1/p&#92;)</span>.

The **law of the unconscious statistician** states <span>&#92;(E[g(X)] = &#92;int g(x)&#92;,p_X(x)&#92;,dx&#92;)</span> for measurable <span>&#92;(g&#92;)</span>, allowing computation of moments without finding the distribution of <span>&#92;(g(X)&#92;)</span> explicitly.

---

# Lecture 5: Expectation, Moments, and Conditional Probability

## Characteristic Functions and Cumulants

The **<span>&#92;(n&#92;)</span>-th moment** of <span>&#92;(X&#92;)</span> is <span>&#92;(&#92;mu_n = E[X^n]&#92;)</span>. The **variance** is <span>&#92;(&#92;text{Var}(X) = E[(X - E[X])^2] = E[X^2] - (E[X])^2&#92;)</span>.

The **characteristic function** is <span>&#92;(&#92;phi_X(t) = E[e^{itX}]&#92;)</span>, which always exists and determines the distribution uniquely. Its series expansion gives moments: <span>&#92;(&#92;phi_X(t) = &#92;sum_{n=0}^&#92;infty &#92;frac{(it)^n}{n!} E[X^n]&#92;)</span>. The **moment generating function** is <span>&#92;(M_X(t) = E[e^{tX}]&#92;)</span>, when it exists in a neighborhood of zero.

The **cumulant generating function** is <span>&#92;(&#92;log M_X(t) = &#92;sum_{n=1}^&#92;infty &#92;kappa_n t^n/n!&#92;)</span>. The cumulants <span>&#92;(&#92;kappa_n&#92;)</span> are related to moments: <span>&#92;(&#92;kappa_1 = E[X]&#92;)</span>, <span>&#92;(&#92;kappa_2 = &#92;text{Var}(X)&#92;)</span>, and higher cumulants measure departure from Gaussianity. For a Gaussian, all cumulants of order <span>&#92;(&#92;ge 3&#92;)</span> are zero.

## Key Continuous Distributions

The **Exponential** distribution with rate <span>&#92;(&#92;lambda > 0&#92;)</span> has PDF <span>&#92;(p(x) = &#92;lambda e^{-&#92;lambda x}&#92;)</span> for <span>&#92;(x &#92;ge 0&#92;)</span>. Its mean is <span>&#92;(1/&#92;lambda&#92;)</span> and variance <span>&#92;(1/&#92;lambda^2&#92;)</span>.

The **Gaussian** (Normal) distribution <span>&#92;(X &#92;sim N(&#92;mu, &#92;sigma^2)&#92;)</span> has PDF <span>&#92;(p(x) = &#92;frac{1}{&#92;sqrt{2&#92;pi&#92;sigma^2}}&#92;exp&#92;!&#92;left(-&#92;frac{(x-&#92;mu)^2}{2&#92;sigma^2}&#92;right)&#92;)</span>. The standard normal <span>&#92;(N(0,1)&#92;)</span> has CDF <span>&#92;(&#92;Phi(u) = &#92;int_{-&#92;infty}^u &#92;frac{1}{&#92;sqrt{2&#92;pi}}e^{-x^2/2}&#92;,dx&#92;)</span> and the complementary function <span>&#92;(Q(u) = 1 - &#92;Phi(u)&#92;)</span>. The verification that the Gaussian PDF integrates to one uses the polar-coordinate trick: defining <span>&#92;(I = &#92;int_{-&#92;infty}^&#92;infty e^{-u^2/2}&#92;,du&#92;)</span>, squaring to get <span>&#92;(I^2 = &#92;int&#92;!&#92;!&#92;int e^{-(u^2+v^2)/2}&#92;,du&#92;,dv = 2&#92;pi&#92;)</span>, so <span>&#92;(I = &#92;sqrt{2&#92;pi}&#92;)</span>.

The **Cauchy** distribution has PDF <span>&#92;(p(x) = &#92;frac{1}{&#92;pi(1+x^2)}&#92;)</span>. It is a notable example where the mean does not exist, since the integral <span>&#92;(&#92;int_{-&#92;infty}^&#92;infty |x|/(1+x^2)&#92;,dx&#92;)</span> diverges.

## Conditional Probability

<div class="definition">
For events <span>&#92;(E, F&#92;)</span> with <span>&#92;(P(F) > 0&#92;)</span>, the <strong>conditional probability</strong> of <span>&#92;(E&#92;)</span> given <span>&#92;(F&#92;)</span> is
<span>&#92;[P(E|F) = &#92;frac{P(E &#92;cap F)}{P(F)}.&#92;]</span>
</div>

This is the rescaled probability restricted to the event <span>&#92;(F&#92;)</span>. Conditional probability is itself a probability measure on <span>&#92;((&#92;Omega, &#92;mathcal{F})&#92;)</span> conditioned on <span>&#92;(F&#92;)</span>.

---

# Lecture 6: Conditional Expectation and Bayes' Law

## Bayes' Theorem and Total Probability

<div class="theorem">
<strong>Law of Total Probability.</strong> If <span>&#92;(B_1, B_2, &#92;ldots&#92;)</span> partition <span>&#92;(&#92;Omega&#92;)</span>, then <span>&#92;(P(A) = &#92;sum_i P(A|B_i)P(B_i)&#92;)</span>.

<strong>Bayes' Theorem.</strong> <span>&#92;[P(B_i|A) = &#92;frac{P(A|B_i)P(B_i)}{&#92;sum_j P(A|B_j)P(B_j)}.&#92;]</span>
</div>

Bayes' theorem is the engine of Bayesian inference: given prior probabilities <span>&#92;(P(B_i)&#92;)</span> and likelihood <span>&#92;(P(A|B_i)&#92;)</span>, the posterior <span>&#92;(P(B_i|A)&#92;)</span> is updated evidence about the state <span>&#92;(B_i&#92;)</span>.

## Conditional Expectation

For continuous random variables <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> with joint density <span>&#92;(p_{XY}&#92;)</span>, the conditional density of <span>&#92;(X&#92;)</span> given <span>&#92;(Y = y&#92;)</span> is <span>&#92;(p_{X|Y}(x|y) = p_{XY}(x,y)/p_Y(y)&#92;)</span>, and the conditional expectation is <span>&#92;(E[X|Y=y] = &#92;int x&#92;, p_{X|Y}(x|y)&#92;,dx&#92;)</span>.

The **abstract definition** via <span>&#92;(&#92;sigma&#92;)</span>-algebras is more general and foundational. Given a sub-<span>&#92;(&#92;sigma&#92;)</span>-algebra <span>&#92;(&#92;mathcal{G} &#92;subseteq &#92;mathcal{F}&#92;)</span>, the conditional expectation <span>&#92;(E[X|&#92;mathcal{G}]&#92;)</span> is the unique <span>&#92;(&#92;mathcal{G}&#92;)</span>-measurable random variable satisfying the **partial averaging property**: for every <span>&#92;(G &#92;in &#92;mathcal{G}&#92;)</span>,
<span>&#92;[&#92;int_G E[X|&#92;mathcal{G}]&#92;,dP = &#92;int_G X&#92;,dP.&#92;]</span>

**Properties of conditional expectation:**

1. **Linearity:** <span>&#92;(E[aX + bY|&#92;mathcal{G}] = aE[X|&#92;mathcal{G}] + bE[Y|&#92;mathcal{G}]&#92;)</span>.
2. **Tower property (iterated conditioning):** If <span>&#92;(&#92;mathcal{H} &#92;subseteq &#92;mathcal{G}&#92;)</span>, then <span>&#92;(E[E[X|&#92;mathcal{G}]|&#92;mathcal{H}] = E[X|&#92;mathcal{H}]&#92;)</span>. In particular, <span>&#92;(E[E[X|Y]] = E[X]&#92;)</span>.
3. **Taking out what is known:** If <span>&#92;(Z&#92;)</span> is <span>&#92;(&#92;mathcal{G}&#92;)</span>-measurable, then <span>&#92;(E[ZX|&#92;mathcal{G}] = Z&#92;,E[X|&#92;mathcal{G}]&#92;)</span>.
4. **Independence:** If <span>&#92;(X&#92;)</span> is independent of <span>&#92;(&#92;mathcal{G}&#92;)</span>, then <span>&#92;(E[X|&#92;mathcal{G}] = E[X]&#92;)</span>.
5. **Jensen's inequality:** For convex <span>&#92;(&#92;varphi&#92;)</span>, <span>&#92;(&#92;varphi(E[X|&#92;mathcal{G}]) &#92;le E[&#92;varphi(X)|&#92;mathcal{G}]&#92;)</span>.

The **best approximation property** of conditional expectation states that among all <span>&#92;(&#92;mathcal{G}&#92;)</span>-measurable functions <span>&#92;(g&#92;)</span>, the function <span>&#92;(E[X|&#92;mathcal{G}]&#92;)</span> minimizes <span>&#92;(E[(X - g)^2]&#92;)</span>. This is the MMSE interpretation: <span>&#92;(E[X|Y]&#92;)</span> is the best predictor of <span>&#92;(X&#92;)</span> given observation <span>&#92;(Y&#92;)</span>.

## Memoryless Property of the Exponential Distribution

<div class="theorem">
The exponential distribution is the unique continuous distribution with the memoryless property: <span>&#92;(P(X > s+t | X > s) = P(X > t)&#92;)</span> for all <span>&#92;(s, t &#92;ge 0&#92;)</span>.
</div>

**Proof:** For <span>&#92;(X &#92;sim &#92;text{Exp}(&#92;lambda)&#92;)</span>, <span>&#92;(P(X > x) = e^{-&#92;lambda x}&#92;)</span>, so
<span>&#92;[P(X > s+t|X>s) = &#92;frac{P(X>s+t)}{P(X>s)} = &#92;frac{e^{-&#92;lambda(s+t)}}{e^{-&#92;lambda s}} = e^{-&#92;lambda t} = P(X>t).&#92;]</span>

---

# Lecture 7: Borel–Cantelli, Convergence Theorems, and Transformations

## The Borel–Cantelli Lemmas

The event <span>&#92;(&#92;{A_n &#92;text{ i.o.}&#92;} = &#92;limsup_n A_n = &#92;bigcap_{n=1}^&#92;infty &#92;bigcup_{k=n}^&#92;infty A_k&#92;)</span> reads "infinitely many of the <span>&#92;(A_n&#92;)</span> occur."

<div class="theorem">
<strong>Borel–Cantelli Lemma I.</strong> If <span>&#92;(&#92;sum_{n=1}^&#92;infty P(A_n) < &#92;infty&#92;)</span>, then <span>&#92;(P(A_n &#92;text{ i.o.}) = 0&#92;)</span>.

<strong>Borel–Cantelli Lemma II.</strong> If the <span>&#92;(A_n&#92;)</span> are independent and <span>&#92;(&#92;sum_{n=1}^&#92;infty P(A_n) = &#92;infty&#92;)</span>, then <span>&#92;(P(A_n &#92;text{ i.o.}) = 1&#92;)</span>.
</div>

**Proof of I:** For any <span>&#92;(m&#92;)</span>, <span>&#92;(P(A_n &#92;text{ i.o.}) &#92;le P&#92;!&#92;left(&#92;bigcup_{k=m}^&#92;infty A_k&#92;right) &#92;le &#92;sum_{k=m}^&#92;infty P(A_k) &#92;to 0&#92;)</span> as <span>&#92;(m &#92;to &#92;infty&#92;)</span>, since the tail of a convergent series vanishes.

## Fundamental Convergence Theorems

<div class="theorem">
<strong>Monotone Convergence Theorem (MCT).</strong> If <span>&#92;(0 &#92;le f_n &#92;uparrow f&#92;)</span> pointwise a.e., then <span>&#92;(&#92;int f_n&#92;,dP &#92;uparrow &#92;int f&#92;,dP&#92;)</span>.

<strong>Fatou's Lemma.</strong> For <span>&#92;(f_n &#92;ge 0&#92;)</span>, <span>&#92;(&#92;int &#92;liminf_n f_n&#92;,dP &#92;le &#92;liminf_n &#92;int f_n&#92;,dP&#92;)</span>.

<strong>Dominated Convergence Theorem (DCT).</strong> If <span>&#92;(f_n &#92;to f&#92;)</span> a.e. and <span>&#92;(|f_n| &#92;le g&#92;)</span> for some integrable <span>&#92;(g&#92;)</span>, then <span>&#92;(&#92;int f_n&#92;,dP &#92;to &#92;int f&#92;,dP&#92;)</span>.
</div>

These three theorems govern when the limit and integral (or expectation) can be interchanged, and are foundational to stochastic analysis.

## Transformations of Random Variables

Given a differentiable bijection <span>&#92;(y = g(x)&#92;)</span> with inverse <span>&#92;(x = g^{-1}(y)&#92;)</span>, the density of <span>&#92;(Y = g(X)&#92;)</span> is
<span>&#92;[p_Y(y) = p_X(g^{-1}(y))&#92;left|&#92;frac{d g^{-1}}{dy}&#92;right|.&#92;]</span>

For a multivariate transformation <span>&#92;(&#92;mathbf{Y} = g(&#92;mathbf{X})&#92;)</span> in <span>&#92;(&#92;mathbb{R}^n&#92;)</span>, the Jacobian determinant replaces the scalar derivative. The **Rayleigh distribution** example: if <span>&#92;(X,Y&#92;)</span> are i.i.d. <span>&#92;(N(0,&#92;sigma^2)&#92;)</span>, then <span>&#92;(R = &#92;sqrt{X^2+Y^2}&#92;)</span> has the Rayleigh density <span>&#92;(p_R(r) = (r/&#92;sigma^2)e^{-r^2/(2&#92;sigma^2)}&#92;)</span> for <span>&#92;(r &#92;ge 0&#92;)</span>.

---

# Lecture 8: Four Modes of Convergence

Given a sequence of random variables <span>&#92;(X_1, X_2, &#92;ldots&#92;)</span> and a target <span>&#92;(X&#92;)</span>, four modes of convergence are defined and studied.

<div class="definition">
<ol>
<li><strong>Almost sure (a.s.) convergence:</strong> <span>&#92;(X_n &#92;xrightarrow{a.s.} X&#92;)</span> if <span>&#92;(P(&#92;lim_{n&#92;to&#92;infty} X_n = X) = 1&#92;)</span>.</li>
<li><strong>Mean-square (m.s.) convergence:</strong> <span>&#92;(X_n &#92;xrightarrow{m.s.} X&#92;)</span> if <span>&#92;(E[(X_n - X)^2] &#92;to 0&#92;)</span>.</li>
<li><strong>Convergence in probability:</strong> <span>&#92;(X_n &#92;xrightarrow{p} X&#92;)</span> if for all <span>&#92;(&#92;varepsilon > 0&#92;)</span>, <span>&#92;(P(|X_n - X| > &#92;varepsilon) &#92;to 0&#92;)</span>.</li>
<li><strong>Convergence in distribution:</strong> <span>&#92;(X_n &#92;xrightarrow{d} X&#92;)</span> if <span>&#92;(F_{X_n}(x) &#92;to F_X(x)&#92;)</span> at all continuity points of <span>&#92;(F_X&#92;)</span>.</li>
</ol>
</div>

**Relationships among modes:** (a.s.) <span>&#92;(&#92;Rightarrow&#92;)</span> (p.) <span>&#92;(&#92;Rightarrow&#92;)</span> (d.); (m.s.) <span>&#92;(&#92;Rightarrow&#92;)</span> (p.) <span>&#92;(&#92;Rightarrow&#92;)</span> (d.). Neither (a.s.) nor (m.s.) implies the other in general.

The implication (m.s.) <span>&#92;(&#92;Rightarrow&#92;)</span> (p.) follows from **Markov's inequality**: for any <span>&#92;(&#92;varepsilon > 0&#92;)</span>,
<span>&#92;[P(|X_n - X| > &#92;varepsilon) &#92;le &#92;frac{E[(X_n-X)^2]}{&#92;varepsilon^2} &#92;to 0.&#92;]</span>

**Chebyshev's inequality** is a special case: <span>&#92;(P(|X - &#92;mu| &#92;ge k&#92;sigma) &#92;le 1/k^2&#92;)</span>.

## Central Limit Theorem

<div class="theorem">
<strong>Central Limit Theorem.</strong> Let <span>&#92;(X_1, X_2, &#92;ldots&#92;)</span> be i.i.d. with mean <span>&#92;(&#92;mu&#92;)</span> and variance <span>&#92;(&#92;sigma^2 < &#92;infty&#92;)</span>. Then
<span>&#92;[&#92;frac{&#92;sum_{i=1}^n X_i - n&#92;mu}{&#92;sigma&#92;sqrt{n}} &#92;xrightarrow{d} N(0,1).&#92;]</span>
</div>

**Heuristic via characteristic functions.** Let <span>&#92;(S_n = (X_1+&#92;cdots+X_n - n&#92;mu)/(&#92;sigma&#92;sqrt{n})&#92;)</span>. The characteristic function of <span>&#92;(X_i - &#92;mu&#92;)</span> is <span>&#92;(&#92;phi(t) = 1 - &#92;sigma^2 t^2/2 + O(t^3)&#92;)</span>. By independence, the characteristic function of <span>&#92;(S_n&#92;)</span> is <span>&#92;(&#92;phi(t/(&#92;sigma&#92;sqrt{n}))^n = (1 - t^2/(2n) + O(n^{-3/2}))^n &#92;to e^{-t^2/2}&#92;)</span>, which is the characteristic function of <span>&#92;(N(0,1)&#92;)</span>.

---

# Lectures 9–11: Minimum Mean-Square Error Estimation

## The Geometry of <span>&#92;(L^2&#92;)</span>

The space <span>&#92;(L^2(&#92;Omega,&#92;mathcal{F},P)&#92;)</span> consists of all square-integrable random variables with inner product <span>&#92;((U,V) = E[UV]&#92;)</span> and norm <span>&#92;(&#92;|U&#92;|^2 = E[U^2]&#92;)</span>. This is a Hilbert space — complete and having an orthogonality structure that makes projection well-defined.

<div class="theorem">
<strong>Orthogonality Principle.</strong> Let <span>&#92;(V&#92;)</span> be a closed linear subspace of <span>&#92;(L^2&#92;)</span> and <span>&#92;(X &#92;in L^2&#92;)</span>. There exists a unique element <span>&#92;(&#92;hat{X} &#92;in V&#92;)</span>, called the <em>projection</em> <span>&#92;(&#92;Pi_V X&#92;)</span>, satisfying:
<ol>
<li><strong>Existence and uniqueness:</strong> <span>&#92;(&#92;hat{X} = &#92;arg&#92;min_{Z &#92;in V} E[(X-Z)^2]&#92;)</span>.</li>
<li><strong>Characterization:</strong> <span>&#92;(&#92;hat{X} &#92;in V&#92;)</span> is the projection if and only if <span>&#92;(X - &#92;hat{X} &#92;perp V&#92;)</span>, i.e., <span>&#92;(E[(X-&#92;hat{X})Z] = 0&#92;)</span> for all <span>&#92;(Z &#92;in V&#92;)</span>.</li>
<li><strong>Error:</strong> <span>&#92;(E[(X-&#92;hat{X})^2] = E[X^2] - E[&#92;hat{X}^2]&#92;)</span>.</li>
</ol>
</div>

The projection satisfies: (i) linearity <span>&#92;(&#92;Pi_V(aX+bY) = a&#92;Pi_V X + b&#92;Pi_V Y&#92;)</span>; (ii) if <span>&#92;(V_1 &#92;subseteq V_2&#92;)</span> then <span>&#92;(&#92;Pi_{V_1}&#92;Pi_{V_2} = &#92;Pi_{V_1}&#92;)</span>; (iii) if <span>&#92;(V_1 &#92;perp V_2&#92;)</span> then <span>&#92;(&#92;Pi_{V_1 &#92;oplus V_2} = &#92;Pi_{V_1} + &#92;Pi_{V_2}&#92;)</span>.

## Linear MMSE Estimator

Given observations <span>&#92;(Y_1, &#92;ldots, Y_n&#92;)</span>, the **linear MMSE estimator** of <span>&#92;(X&#92;)</span> is the best linear combination <span>&#92;(&#92;hat{X} = &#92;sum_{i=1}^n &#92;alpha_i Y_i&#92;)</span>. By the orthogonality principle, the optimal coefficients satisfy <span>&#92;(E[(X - &#92;hat{X})Y_i] = 0&#92;)</span> for all <span>&#92;(i&#92;)</span>, yielding the **normal equations**.

For a single observation <span>&#92;(Y&#92;)</span>: <span>&#92;(&#92;hat{X} = E[X] + &#92;text{Cov}(X,Y)&#92;text{Var}(Y)^{-1}(Y - E[Y])&#92;)</span> with estimation error <span>&#92;(&#92;text{Var}(X) - &#92;text{Cov}(X,Y)^2/&#92;text{Var}(Y)&#92;)</span>.

## Gram–Schmidt and Innovations

<div class="theorem">
<strong>Gram–Schmidt orthogonalization.</strong> From any sequence <span>&#92;(Y_1, &#92;ldots, Y_n&#92;)</span>, one constructs an orthogonal sequence <span>&#92;(&#92;tilde{Y}_1, &#92;ldots, &#92;tilde{Y}_n&#92;)</span> via <span>&#92;(&#92;tilde{Y}_k = Y_k - &#92;hat{E}[Y_k | Y_1,&#92;ldots,Y_{k-1}]&#92;)</span>, with <span>&#92;(E[&#92;tilde{Y}_i &#92;tilde{Y}_j] = 0&#92;)</span> for <span>&#92;(i &#92;ne j&#92;)</span>, and the linear spans coincide.
</div>

The sequence <span>&#92;(&#92;tilde{Y}_k&#92;)</span> consists of the **innovations** — the new information brought by each observation beyond what was already predictable from prior ones. Since orthogonal variables have a trivial joint projection (sum of individual projections), working with the innovations simplifies the MMSE formula to
<span>&#92;[&#92;hat{E}[X|Y_1,&#92;ldots,Y_n] = E[X] + &#92;sum_{k=1}^n &#92;frac{&#92;text{Cov}(X,&#92;tilde{Y}_k)}{&#92;text{Var}(&#92;tilde{Y}_k)}&#92;tilde{Y}_k.&#92;]</span>

## Vector MMSE and Schur Complements

For random vectors <span>&#92;(X &#92;in &#92;mathbb{R}^n&#92;)</span> and <span>&#92;(Y &#92;in &#92;mathbb{R}^m&#92;)</span>, the vector MMSE estimator is
<span>&#92;[&#92;hat{X} = E[X] + R_{XY}R_Y^{-1}(Y - E[Y]),&#92;]</span>
where <span>&#92;(R_{XY} = &#92;text{Cov}(X,Y)&#92;)</span> and <span>&#92;(R_Y = &#92;text{Cov}(Y,Y)&#92;)</span>. The estimation error covariance is
<span>&#92;[P = R_X - R_{XY}R_Y^{-1}R_{YX}.&#92;]</span>

The derivation uses **block Gaussian elimination**. Write the joint covariance matrix as a block matrix
<span>&#92;[&#92;begin{pmatrix} R_X & R_{XY} &#92;&#92; R_{YX} & R_Y &#92;end{pmatrix}.&#92;]</span>
The **Schur complement** of the <span>&#92;(R_Y&#92;)</span> block is <span>&#92;(&#92;Delta_A = R_X - R_{XY}R_Y^{-1}R_{YX}&#92;)</span>, which equals the minimum achievable error covariance. The block factorization
<span>&#92;[&#92;begin{pmatrix} I & 0 &#92;&#92; -R_{YX}R_X^{-1} & I &#92;end{pmatrix}&#92;begin{pmatrix} R_X & R_{XY} &#92;&#92; R_{YX} & R_Y &#92;end{pmatrix}&#92;begin{pmatrix} I & -R_X^{-1}R_{XY} &#92;&#92; 0 & I &#92;end{pmatrix} = &#92;begin{pmatrix} R_X & 0 &#92;&#92; 0 & &#92;Delta_D &#92;end{pmatrix}&#92;]</span>
leads directly to the optimal gain matrix via completing the square in the mean-square error.

## Recursive MMSE Estimation

Instead of inverting the full covariance matrix of all past observations when a new observation arrives, one can update the estimate recursively using the innovations. This is the key idea behind the Kalman filter.

Suppose we have the estimate <span>&#92;(&#92;hat{X}_{k-1}&#92;)</span> based on <span>&#92;(Y_1, &#92;ldots, Y_{k-1}&#92;)</span>. When the new observation <span>&#92;(Y_k&#92;)</span> arrives, the innovation is
<span>&#92;[&#92;tilde{Y}_k = Y_k - &#92;hat{E}[Y_k | Y_1, &#92;ldots, Y_{k-1}].&#92;]</span>
The update takes the form
<span>&#92;[&#92;hat{X}_k = &#92;hat{X}_{k-1} + B_k &#92;tilde{Y}_k,&#92;quad B_k = &#92;frac{(X, &#92;tilde{Y}_k)_{L^2}}{(&#92;tilde{Y}_k, &#92;tilde{Y}_k)_{L^2}}.&#92;]</span>

For the scalar example with <span>&#92;(X&#92;)</span> unknown constant observed with additive noise <span>&#92;(Y_k = X + V_k&#92;)</span> where <span>&#92;(V_k&#92;)</span> are i.i.d. with variance <span>&#92;(a^2&#92;)</span>, the recursive scalar update is:
<span>&#92;[&#92;hat{X}_k = &#92;hat{X}_{k-1} + &#92;frac{P_{k-1}}{P_{k-1}+a^2}(Y_k - &#92;hat{X}_{k-1}),&#92;quad P_k = &#92;frac{a^2 P_{k-1}}{a^2 + P_{k-1}}.&#92;]</span>
The error variance <span>&#92;(P_k&#92;)</span> decreases monotonically to zero as more observations are accumulated, reflecting the fact that more data about a constant signal eventually pins it down completely.

---

# Lecture 12: Random Processes — Definitions and Basics

## Random Processes

<div class="definition">
A <strong>random process</strong> (or stochastic process) is a collection of random variables <span>&#92;(&#92;{X_t : t &#92;in T&#92;}&#92;)</span> defined on a probability space <span>&#92;((&#92;Omega, &#92;mathcal{F}, P)&#92;)</span>, indexed by a parameter set <span>&#92;(T&#92;)</span> (typically time).
</div>

A random process can be viewed in three equivalent ways: (i) as a function of two variables <span>&#92;(X(t,&#92;omega)&#92;)</span>; (ii) for each fixed <span>&#92;(&#92;omega&#92;)</span>, as a deterministic function <span>&#92;(t &#92;mapsto X(t,&#92;omega)&#92;)</span> called a **sample path** or **realization**; (iii) for each fixed <span>&#92;(t&#92;)</span>, as a random variable <span>&#92;(&#92;omega &#92;mapsto X(t,&#92;omega)&#92;)</span>.

The **mean function** is <span>&#92;(&#92;mu_X(t) = E[X_t]&#92;)</span>. The **autocorrelation function** is <span>&#92;(R_X(t,s) = E[X_t X_s]&#92;)</span>. The **autocovariance** is <span>&#92;(C_X(t,s) = E[(X_t - &#92;mu_X(t))(X_s - &#92;mu_X(s))] = R_X(t,s) - &#92;mu_X(t)&#92;mu_X(s)&#92;)</span>. The **finite-dimensional distributions** are the joint distributions of <span>&#92;((X_{t_1}, &#92;ldots, X_{t_k})&#92;)</span> for all finite subsets of index times.

A **Gaussian process** is one where every finite collection <span>&#92;((X_{t_1}, &#92;ldots, X_{t_k})&#92;)</span> is jointly Gaussian. Such a process is entirely specified by its mean function and autocovariance function.

## Simple Random Walk and Gambler's Ruin

The **simple random walk** is defined by <span>&#92;(S_0 = 0&#92;)</span> and <span>&#92;(S_n = S_{n-1} + &#92;xi_n&#92;)</span> where <span>&#92;(&#92;xi_1, &#92;xi_2, &#92;ldots&#92;)</span> are i.i.d. with <span>&#92;(P(&#92;xi_i = +1) = p&#92;)</span> and <span>&#92;(P(&#92;xi_i = -1) = q = 1-p&#92;)</span>.

The **Gambler's ruin** problem asks: starting with <span>&#92;(k&#92;)</span> dollars, playing against a casino with total wealth <span>&#92;(N&#92;)</span>, what is the probability <span>&#92;(&#92;varphi(k)&#92;)</span> of reaching <span>&#92;(N&#92;)</span> before 0? The first-step analysis gives the recurrence <span>&#92;(&#92;varphi(k) = p&#92;varphi(k+1) + q&#92;varphi(k-1)&#92;)</span> with boundary conditions <span>&#92;(&#92;varphi(0) = 0&#92;)</span>, <span>&#92;(&#92;varphi(N) = 1&#92;)</span>. The solution for <span>&#92;(p &#92;ne q&#92;)</span> is <span>&#92;(&#92;varphi(k) = (1-(q/p)^k)/(1-(q/p)^N)&#92;)</span>; for the fair game <span>&#92;(p = q = 1/2&#92;)</span> it simplifies to <span>&#92;(&#92;varphi(k) = k/N&#92;)</span>.

---

# Lecture 13: Martingales in Discrete Time

## Definition and Examples

<div class="definition">
A sequence <span>&#92;((S_n, &#92;mathcal{F}_n)_{n &#92;ge 0}&#92;)</span> is a <strong>martingale</strong> if: (i) each <span>&#92;(S_n&#92;)</span> is <span>&#92;(&#92;mathcal{F}_n&#92;)</span>-measurable; (ii) <span>&#92;(E[|S_n|] < &#92;infty&#92;)</span>; (iii) <span>&#92;(E[S_{n+1}|&#92;mathcal{F}_n] = S_n&#92;)</span> for all <span>&#92;(n&#92;)</span>.
</div>

If the equality is replaced by <span>&#92;(&#92;ge&#92;)</span>, the process is a **submartingale**; if by <span>&#92;(&#92;le&#92;)</span>, a **supermartingale**.

**Example 1 (Random walk).** For the simple symmetric random walk with <span>&#92;(p = q = 1/2&#92;)</span>, <span>&#92;(S_n&#92;)</span> is a martingale. So is <span>&#92;(S_n^2 - n&#92;sigma^2&#92;)</span>, the quadratic martingale, since <span>&#92;(E[S_{n+1}^2 - (n+1)&#92;sigma^2|&#92;mathcal{F}_n] = S_n^2 + &#92;sigma^2 - (n+1)&#92;sigma^2 = S_n^2 - n&#92;sigma^2&#92;)</span>.

**Example 2 (Multiplicative martingale).** For i.i.d. positive variables <span>&#92;(&#92;xi_k&#92;)</span> with <span>&#92;(E[&#92;xi_k] = 1&#92;)</span>, the product <span>&#92;(M_n = &#92;prod_{k=1}^n &#92;xi_k&#92;)</span> is a martingale. This arises in financial modeling: if <span>&#92;(&#92;xi_k&#92;)</span> is the daily return ratio of an asset, then under the risk-neutral measure <span>&#92;(E[&#92;xi_k] = 1&#92;)</span> and the discounted price process is a martingale.

## Maximal Inequalities

<div class="theorem">
<strong>Doob's Maximal Inequality.</strong> For a nonnegative submartingale <span>&#92;((S_n)&#92;)</span>,
<span>&#92;[P&#92;!&#92;left(&#92;max_{k &#92;le n} S_k &#92;ge &#92;lambda&#92;right) &#92;le &#92;frac{E[S_n]}{&#92;lambda}.&#92;]</span>

<strong>Kolmogorov's Maximal Inequality.</strong> For a martingale <span>&#92;((S_n)&#92;)</span> with <span>&#92;(E[S_n^2] < &#92;infty&#92;)</span>,
<span>&#92;[P&#92;!&#92;left(&#92;max_{k &#92;le n} |S_k| &#92;ge &#92;lambda&#92;right) &#92;le &#92;frac{E[S_n^2]}{&#92;lambda^2}.&#92;]</span>
</div>

**Proof of Doob's inequality.** Define the stopping time <span>&#92;(&#92;tau = &#92;min&#92;{k &#92;le n : S_k &#92;ge &#92;lambda&#92;}&#92;)</span> (with <span>&#92;(&#92;tau = &#92;infty&#92;)</span> if no such <span>&#92;(k&#92;)</span> exists). On the event <span>&#92;(A = &#92;{&#92;max_{k&#92;le n} S_k &#92;ge &#92;lambda&#92;}&#92;)</span>, we have <span>&#92;(&#92;tau &#92;le n&#92;)</span> and by the submartingale property <span>&#92;(&#92;lambda P(A) &#92;le E[S_n &#92;mathbf{1}_A] &#92;le E[S_n]&#92;)</span>.

## Stopping Times and Optional Stopping

<div class="definition">
A random variable <span>&#92;(&#92;tau : &#92;Omega &#92;to &#92;{0,1,&#92;ldots,&#92;infty&#92;}&#92;)</span> is a <strong>stopping time</strong> with respect to <span>&#92;((&#92;mathcal{F}_n)&#92;)</span> if <span>&#92;(&#92;{&#92;tau = n&#92;} &#92;in &#92;mathcal{F}_n&#92;)</span> for all <span>&#92;(n &#92;ge 0&#92;)</span>.
</div>

<div class="theorem">
<strong>Optional Stopping Theorem.</strong> If <span>&#92;((S_n)&#92;)</span> is a martingale and <span>&#92;(&#92;tau&#92;)</span> is a stopping time with <span>&#92;(E[&#92;tau] < &#92;infty&#92;)</span> and <span>&#92;(E[|S_{n+1} - S_n| | &#92;mathcal{F}_n] &#92;le C&#92;)</span> for some constant <span>&#92;(C&#92;)</span>, then <span>&#92;(E[S_&#92;tau] = E[S_0]&#92;)</span>.
</div>

The optional stopping theorem is used to solve the Gambler's ruin: applying it to the martingale <span>&#92;(S_n&#92;)</span> at the absorption time gives <span>&#92;(E[S_&#92;tau] = E[S_0] = k&#92;)</span>. Since <span>&#92;(S_&#92;tau&#92;)</span> equals <span>&#92;(N&#92;)</span> with probability <span>&#92;(&#92;varphi(k)&#92;)</span> and <span>&#92;(0&#92;)</span> otherwise, we get <span>&#92;(N&#92;varphi(k) + 0&#92;cdot(1-&#92;varphi(k)) = k&#92;)</span>, confirming <span>&#92;(&#92;varphi(k) = k/N&#92;)</span> in the fair case.

---

# Lecture 14: Markov and Wiener Processes

## Markov Processes

<div class="definition">
A stochastic process <span>&#92;(&#92;{X_t&#92;}&#92;)</span> is a <strong>Markov process</strong> if for all <span>&#92;(s < t&#92;)</span> and measurable sets <span>&#92;(A&#92;)</span>,
<span>&#92;[P(X_t &#92;in A | X_u,&#92;, u &#92;le s) = P(X_t &#92;in A | X_s).&#92;]</span>
</div>

The future is conditionally independent of the past given the present. The **transition density** <span>&#92;(p(t,x,s,y)&#92;)</span> gives the density of <span>&#92;(X_t = y&#92;)</span> given <span>&#92;(X_s = x&#92;)</span>. The **Chapman–Kolmogorov equation** expresses the consistency of transition densities over multiple time intervals:
<span>&#92;[p(t,x,u,z) = &#92;int p(t,x,s,y)&#92;,p(s,y,u,z)&#92;,dy,&#92;quad s &#92;in (t,u).&#92;]</span>

A **diffusion process** is a Markov process characterized by its **drift** <span>&#92;(b(&#92;xi, t) = &#92;lim_{&#92;Delta t&#92;to 0} E[X_{t+&#92;Delta t} - X_t | X_t = &#92;xi]/&#92;Delta t&#92;)</span> and **diffusion coefficient** <span>&#92;(a(&#92;xi,t) = &#92;lim_{&#92;Delta t&#92;to 0} E[(X_{t+&#92;Delta t}-X_t)^2|X_t=&#92;xi]/&#92;Delta t&#92;)</span>. The Brownian motion is the fundamental diffusion, with <span>&#92;(b &#92;equiv 0&#92;)</span> and <span>&#92;(a &#92;equiv &#92;sigma^2&#92;)</span>.

## Wiener Process (Brownian Motion)

<div class="definition">
A <strong>standard Wiener process</strong> (or Brownian motion) <span>&#92;(&#92;{W_t : t &#92;ge 0&#92;}&#92;)</span> is a Gaussian process satisfying:
<ol>
<li><span>&#92;(W_0 = 0&#92;)</span> almost surely.</li>
<li><span>&#92;(E[W_t] = 0&#92;)</span> for all <span>&#92;(t&#92;)</span>.</li>
<li><span>&#92;(E[W_t W_s] = &#92;sigma^2 &#92;min(t,s)&#92;)</span> for all <span>&#92;(s,t &#92;ge 0&#92;)</span>.</li>
<li>Independent increments: <span>&#92;(W_{t_2}-W_{t_1}, W_{t_3}-W_{t_2}, &#92;ldots&#92;)</span> are independent for <span>&#92;(t_1 < t_2 < &#92;cdots&#92;)</span>.</li>
<li>Continuous sample paths.</li>
</ol>
</div>

Additional properties established in the lectures include: (6) positive definiteness of the correlation function (follows from the variance formula); (7) the Markov property — proved by showing the future increments are independent of <span>&#92;(&#92;sigma&#92;{W_s : s &#92;le t&#92;}&#92;)</span>, using the Gaussian structure and independence of increments; (8) the martingale property — <span>&#92;(E[W_t | &#92;mathcal{F}_s] = W_s&#92;)</span> for <span>&#92;(s &#92;le t&#92;)</span>, following from independent increments; (9) almost sure continuity of paths; (10) nowhere differentiability and unbounded variation — the quadratic variation <span>&#92;(&#92;sum_k (W_{t_{k+1}} - W_{t_k})^2 &#92;to t&#92;)</span> in probability, establishing that Brownian paths are too irregular for ordinary Riemann–Stieltjes integration.

**White noise** is defined formally as the derivative <span>&#92;(&#92;xi(t) = &#92;dot{W}(t)&#92;)</span>. While not a function in the classical sense, it arises as the limit of <span>&#92;(&#92;xi_&#92;delta(t) = (W_{t+&#92;delta} - W_t)/&#92;delta&#92;)</span>. The spectral density of <span>&#92;(&#92;xi_&#92;delta&#92;)</span> converges to a constant (flat spectrum) as <span>&#92;(&#92;delta &#92;to 0&#92;)</span>, justifying the name "white" noise. The stochastic integral <span>&#92;(&#92;int_0^t h(t-s)&#92;,dW(s)&#92;)</span> — the formal integral against Brownian motion — is the Itô integral, developed rigorously in AMATH 777.

---

# Lectures 15–17: Markov Chains

## Finite Discrete-Time Markov Chains

<div class="definition">
A <strong>Markov chain</strong> with state space <span>&#92;(S = &#92;{1, &#92;ldots, N&#92;}&#92;)</span> is a sequence of random variables <span>&#92;((X_0, X_1, &#92;ldots)&#92;)</span> satisfying the Markov property:
<span>&#92;[P(X_{n+1} = j | X_n = i, X_{n-1} = i_{n-1}, &#92;ldots, X_0 = i_0) = p_{ij},&#92;]</span>
where the transition probabilities <span>&#92;(p_{ij}&#92;)</span> do not depend on <span>&#92;(n&#92;)</span> (time-homogeneous).
</div>

The **transition matrix** <span>&#92;(P = (p_{ij})&#92;)</span> is **stochastic**: <span>&#92;(p_{ij} &#92;ge 0&#92;)</span> for all <span>&#92;(i,j&#92;)</span> and <span>&#92;(&#92;sum_j p_{ij} = 1&#92;)</span> for all <span>&#92;(i&#92;)</span>. The initial distribution <span>&#92;(&#92;pi_0&#92;)</span> is a row vector with <span>&#92;(&#92;pi_0(i) = P(X_0 = i)&#92;)</span>.

The **Markov theorem** states that the finite-dimensional distributions of the chain are completely determined by <span>&#92;(&#92;pi_0&#92;)</span> and <span>&#92;(P&#92;)</span>:
<span>&#92;[P(X_0=i_0, X_1=i_1, &#92;ldots, X_n=i_n) = &#92;pi_0(i_0)&#92;,p_{i_0 i_1}&#92;,p_{i_1 i_2}&#92;cdots p_{i_{n-1}i_n}.&#92;]</span>

## Chapman–Kolmogorov and n-Step Transitions

The <span>&#92;(n&#92;)</span>-step transition probabilities are <span>&#92;(p^{(n)}_{ij} = P(X_{n}=j|X_0=i)&#92;)</span>, and the matrix of these probabilities is <span>&#92;(P^n&#92;)</span> (the <span>&#92;(n&#92;)</span>-th matrix power). The **Chapman–Kolmogorov equation** states:
<span>&#92;[P^{(n+m)} = P^{(n)}&#92;cdot P^{(m)},&#92;quad &#92;text{i.e.,}&#92;quad p^{(n+m)}_{ij} = &#92;sum_k p^{(n)}_{ik}&#92;, p^{(m)}_{kj}.&#92;]</span>

The distribution at time <span>&#92;(n&#92;)</span> is <span>&#92;(&#92;pi_n = &#92;pi_0 P^n&#92;)</span>.

## Two-State Chain: Explicit Solution

Consider a two-state chain with states <span>&#92;(&#92;{0,1&#92;}&#92;)</span> and transition matrix <span>&#92;(P = &#92;begin{pmatrix}1-&#92;alpha & &#92;alpha &#92;&#92; &#92;beta & 1-&#92;beta&#92;end{pmatrix}&#92;)</span>. The eigenvalues are 1 and <span>&#92;(1-&#92;alpha-&#92;beta&#92;)</span>. Diagonalizing yields the explicit formula:
<span>&#92;[P(X_n = 0) = &#92;frac{&#92;beta}{&#92;alpha+&#92;beta} + &#92;left(1-&#92;alpha-&#92;beta&#92;right)^n&#92;!&#92;left(&#92;pi_0(0) - &#92;frac{&#92;beta}{&#92;alpha+&#92;beta}&#92;right).&#92;]</span>

As <span>&#92;(n &#92;to &#92;infty&#92;)</span>, provided <span>&#92;(|1-&#92;alpha-&#92;beta| < 1&#92;)</span>, the chain converges to the **stationary distribution** <span>&#92;(&#92;pi = (&#92;beta/(&#92;alpha+&#92;beta),&#92;, &#92;alpha/(&#92;alpha+&#92;beta))&#92;)</span>.

## Stationary Distributions and Classification

<div class="definition">
A probability distribution <span>&#92;(&#92;pi&#92;)</span> is <strong>stationary</strong> (or invariant) for the chain if <span>&#92;(&#92;pi = &#92;pi P&#92;)</span>, i.e., <span>&#92;(&#92;pi_j = &#92;sum_i &#92;pi_i p_{ij}&#92;)</span> for all <span>&#92;(j&#92;)</span>.
</div>

For a finite-state chain, a stationary distribution always exists (by Perron–Frobenius theory: the matrix <span>&#92;(P&#92;)</span> has eigenvalue 1 with a non-negative left eigenvector).

**State classification.** State <span>&#92;(j&#92;)</span> is **accessible** from <span>&#92;(i&#92;)</span> (written <span>&#92;(i &#92;to j&#92;)</span>) if <span>&#92;(p^{(n)}_{ij} > 0&#92;)</span> for some <span>&#92;(n &#92;ge 0&#92;)</span>. States <span>&#92;(i&#92;)</span> and <span>&#92;(j&#92;)</span> **communicate** (<span>&#92;(i &#92;leftrightarrow j&#92;)</span>) if <span>&#92;(i &#92;to j&#92;)</span> and <span>&#92;(j &#92;to i&#92;)</span>. Communication is an equivalence relation, partitioning the state space into **communicating classes**.

A communicating class <span>&#92;(C&#92;)</span> is **closed** if <span>&#92;(p_{ij} = 0&#92;)</span> whenever <span>&#92;(i &#92;in C&#92;)</span> and <span>&#92;(j &#92;notin C&#92;)</span> — once the chain enters <span>&#92;(C&#92;)</span>, it never leaves. A single-state closed class is an **absorbing state**. A chain is **irreducible** if it has exactly one communicating class.

A state <span>&#92;(i&#92;)</span> is **recurrent** if the chain returns to <span>&#92;(i&#92;)</span> with probability 1, and **transient** otherwise. For a finite irreducible chain, all states are recurrent. Among recurrent states, <span>&#92;(i&#92;)</span> is **positive recurrent** if the expected return time <span>&#92;(E[&#92;tau_i | X_0 = i]&#92;)</span> is finite, and **null recurrent** if it is infinite. For finite chains, all recurrent states are positive recurrent.

<div class="theorem">
<strong>Basic Limit Theorem for Markov Chains.</strong> For an irreducible, positive recurrent chain, the stationary distribution <span>&#92;(&#92;pi&#92;)</span> is unique and <span>&#92;(&#92;pi_j = 1/E[&#92;tau_j | X_0 = j]&#92;)</span>. Furthermore, <span>&#92;(p^{(n)}_{ij} &#92;to &#92;pi_j&#92;)</span> as <span>&#92;(n &#92;to &#92;infty&#92;)</span> for all <span>&#92;(i, j&#92;)</span> (for aperiodic chains).
</div>

## Hitting Times and Strong Markov Property

The **hitting time** to set <span>&#92;(A&#92;)</span> is <span>&#92;(&#92;tau^A = &#92;min&#92;{n &#92;ge 0 : X_n &#92;in A&#92;}&#92;)</span>. The **hitting probability** from state <span>&#92;(i&#92;)</span> is <span>&#92;(h^A_i = P(&#92;tau^A < &#92;infty | X_0 = i)&#92;)</span>. These satisfy the linear system: <span>&#92;(h^A_i = 1&#92;)</span> for <span>&#92;(i &#92;in A&#92;)</span>, and <span>&#92;(h^A_i = &#92;sum_j p_{ij} h^A_j&#92;)</span> for <span>&#92;(i &#92;notin A&#92;)</span> (with the minimal non-negative solution).

The **Strong Markov Property** states that at any stopping time <span>&#92;(&#92;tau&#92;)</span>, the process "starts fresh" from state <span>&#92;(X_&#92;tau&#92;)</span>, independent of the past.

## Time Reversibility

A chain with stationary distribution <span>&#92;(&#92;pi&#92;)</span> is **time reversible** if the **detailed balance equations** hold:
<span>&#92;[&#92;pi_i p_{ij} = &#92;pi_j p_{ji}&#92;quad &#92;text{for all } i,j.&#92;]</span>
The time-reversed chain has transition probabilities <span>&#92;(q_{ij} = &#92;pi_j p_{ji}/&#92;pi_i&#92;)</span>. If the chain is reversible, <span>&#92;(q_{ij} = p_{ij}&#92;)</span> — the chain looks the same in both directions of time.

---

# Lecture 18: Introduction to Random Oscillations

## Damped Harmonic Oscillator with Random Forcing

The equation of motion for a randomly forced mechanical oscillator is
<span>&#92;[&#92;ddot{X} + 2&#92;beta&#92;omega&#92;dot{X} + &#92;omega^2 X = f(t),&#92;quad X(t_0)=x_0,&#92;quad &#92;dot{X}(t_0)=v_0,&#92;]</span>
where <span>&#92;(f(t)&#92;)</span> is a stationary Gaussian forcing process with mean <span>&#92;(&#92;mu_f&#92;)</span> and covariance <span>&#92;(C_{ff}(t-s)&#92;)</span>, and <span>&#92;(&#92;beta < 1&#92;)</span> (underdamped). The parameters are: <span>&#92;(&#92;beta = b/(2m&#92;omega)&#92;)</span> (damping ratio) and <span>&#92;(&#92;omega^2 = k/m&#92;)</span> (natural frequency).

By variation of parameters, the general solution is
<span>&#92;[X(t) = g(t-t_0)x_0 + h(t-t_0)v_0 + &#92;int_{t_0}^t h(t-&#92;tau)f(&#92;tau)&#92;,d&#92;tau,&#92;]</span>
where the homogeneous response functions are
<span>&#92;[g(t) = e^{-&#92;beta&#92;omega t}&#92;!&#92;left(&#92;cos&#92;omega_d t + &#92;frac{&#92;beta&#92;omega}{&#92;omega_d}&#92;sin&#92;omega_d t&#92;right),&#92;quad h(t) = &#92;frac{e^{-&#92;beta&#92;omega t}}{&#92;omega_d}&#92;sin&#92;omega_d t,&#92;]</span>
with <span>&#92;(&#92;omega_d = &#92;omega&#92;sqrt{1-&#92;beta^2}&#92;)</span> the damped natural frequency.

Since the system is linear, the response <span>&#92;(X(t)&#92;)</span> is Gaussian when the forcing and initial conditions are Gaussian. The **mean response** is
<span>&#92;[&#92;mu_X(t) = g(t-t_0)E[x_0] + h(t-t_0)E[v_0] + &#92;frac{&#92;mu_f}{&#92;omega^2}(1-g(t-t_0)).&#92;]</span>

For white noise forcing <span>&#92;(C_{ff}(&#92;tau) = 2&#92;pi&#92;Phi_0&#92;delta(&#92;tau)&#92;)</span> and zero mean, the covariance simplifies. In the **stationary regime** (taking <span>&#92;(t_0 &#92;to -&#92;infty&#92;)</span>), the autocovariance of the response is
<span>&#92;[C_{XX}(&#92;tau) = &#92;frac{&#92;pi&#92;Phi_0}{2&#92;omega^3&#92;beta}&#92;,e^{-&#92;beta&#92;omega|&#92;tau|}&#92;!&#92;left(&#92;cos&#92;omega_d|&#92;tau| + &#92;frac{&#92;beta&#92;omega}{&#92;omega_d}&#92;sin&#92;omega_d|&#92;tau|&#92;right),&#92;]</span>
and the stationary variance is <span>&#92;(C_{XX}(0) = &#92;pi&#92;Phi_0/(2&#92;omega^3&#92;beta)&#92;)</span>. This shows that lighter damping (<span>&#92;(&#92;beta &#92;to 0&#92;)</span>) leads to larger variance in the response, as the random energy accumulates without sufficient dissipation.

---

# Lecture 19: Discrete-Time Dynamical Systems and the Filtering Problem

## State-Space Formulation

The **filtering problem** is set up in state-space form. The unknown signal <span>&#92;(X_k &#92;in &#92;mathbb{R}^n&#92;)</span> evolves according to the **state equation**
<span>&#92;[X_{k+1} = A_k X_k + W_k,&#92;]</span>
and is observed through the **observation equation**
<span>&#92;[Y_k = H_k X_k + V_k.&#92;]</span>
Here <span>&#92;(W_k&#92;)</span> is process noise with <span>&#92;(E[W_k] = 0&#92;)</span>, <span>&#92;(&#92;text{Cov}(W_k) = Q_k&#92;)</span>, and <span>&#92;(V_k&#92;)</span> is measurement noise with <span>&#92;(E[V_k] = 0&#92;)</span>, <span>&#92;(&#92;text{Cov}(V_k) = R_k&#92;)</span>. The initial state has <span>&#92;(E[X_0] = &#92;bar{X}_0&#92;)</span> and <span>&#92;(&#92;text{Cov}(X_0) = P_0&#92;)</span>. All noise sources and the initial condition are pairwise uncorrelated.

Taking expectations of the state equation yields the mean propagation
<span>&#92;[&#92;bar{X}_{k+1} = A_k&#92;bar{X}_k.&#92;]</span>
For the covariance, using the uncorrelatedness of <span>&#92;(X_k&#92;)</span> and <span>&#92;(W_k&#92;)</span>:
<span>&#92;[P_{k+1} = A_k P_k A_k^T + Q_k&#92;quad&#92;text{(Lyapunov Difference Equation).}&#92;]</span>
Similarly, <span>&#92;(&#92;bar{Y}_k = H_k&#92;bar{X}_k&#92;)</span> and <span>&#92;(E[(Y_k - &#92;bar{Y}_k)(Y_k-&#92;bar{Y}_k)^T] = H_k P_k H_k^T + R_k&#92;)</span>.

In the Gaussian case with <span>&#92;(W_k &#92;sim N(0,Q_k)&#92;)</span> and <span>&#92;(V_k &#92;sim N(0,R_k)&#92;)</span>, the state distribution remains Gaussian for all time: <span>&#92;(X_k &#92;sim N(&#92;bar{X}_k, P_k)&#92;)</span>.

---

# Lectures 20–21: Discrete Kalman Filter — Derivation

## The Two-Step Structure

The Kalman filter operates in two alternating steps at each time <span>&#92;(k&#92;)</span>:

1. **Information update (measurement update):** Given the prior <span>&#92;(&#92;hat{X}_{k|k-1}&#92;)</span> (estimate of <span>&#92;(X_k&#92;)</span> based on observations up to <span>&#92;(k-1&#92;)</span>) and the new observation <span>&#92;(Y_k&#92;)</span>, compute the posterior <span>&#92;(&#92;hat{X}_{k|k}&#92;)</span>.

2. **Time update (prediction step):** Propagate <span>&#92;(&#92;hat{X}_{k|k}&#92;)</span> forward through the dynamics to obtain the prior <span>&#92;(&#92;hat{X}_{k+1|k}&#92;)</span>.

## Innovations and Information Update

The key insight is to decompose the information in <span>&#92;(Y_k&#92;)</span> into what is already predictable from <span>&#92;(Y_0, &#92;ldots, Y_{k-1}&#92;)</span> and the genuinely new information. The **innovation** is
<span>&#92;[&#92;tilde{Y}_k = Y_k - &#92;hat{E}[Y_k | Y_0,&#92;ldots,Y_{k-1}] = Y_k - H_k&#92;hat{X}_{k|k-1}.&#92;]</span>

Using the state equation <span>&#92;(&#92;tilde{Y}_k = H_k &#92;tilde{X}_{k|k-1} + V_k&#92;)</span> where <span>&#92;(&#92;tilde{X}_{k|k-1} = X_k - &#92;hat{X}_{k|k-1}&#92;)</span> is the prior error.

Applying the orthogonality principle from Chapter 3 to update <span>&#92;(&#92;hat{X}_{k|k}&#92;)</span> using the innovation:
<span>&#92;[&#92;hat{X}_{k|k} = &#92;hat{X}_{k|k-1} + &#92;Sigma_{k|k-1} H_k^T M_k^{-1} &#92;tilde{Y}_k,&#92;]</span>
where <span>&#92;(M_k = H_k&#92;Sigma_{k|k-1}H_k^T + R_k = &#92;text{Cov}(&#92;tilde{Y}_k)&#92;)</span> is the innovation covariance and <span>&#92;(&#92;Sigma_{k|k-1} = &#92;text{Cov}(X_k - &#92;hat{X}_{k|k-1})&#92;)</span> is the prior error covariance.

The **posterior error covariance** after the information update is
<span>&#92;[&#92;Sigma_{k|k} = &#92;Sigma_{k|k-1} - &#92;Sigma_{k|k-1}H_k^T M_k^{-1}H_k&#92;Sigma_{k|k-1}^T.&#92;]</span>

An equivalent form using the matrix inversion lemma is <span>&#92;(&#92;Sigma_{k|k}^{-1} = &#92;Sigma_{k|k-1}^{-1} + H_k^T R_k^{-1} H_k&#92;)</span>.

## Time Update

After the information update, the time update propagates both the posterior estimate and error covariance through the dynamics. Since <span>&#92;(W_k&#92;)</span> is uncorrelated with all observations <span>&#92;(Y_0, &#92;ldots, Y_k&#92;)</span>,
<span>&#92;[&#92;hat{X}_{k+1|k} = A_k &#92;hat{X}_{k|k},&#92;quad &#92;Sigma_{k+1|k} = A_k &#92;Sigma_{k|k} A_k^T + Q_k.&#92;]</span>

## The Kalman Filter Equations (Combined)

Combining the two steps, defining the **Kalman gain** matrix
<span>&#92;[K_k = A_k &#92;Sigma_{k|k-1} H_k^T &#92;left(H_k&#92;Sigma_{k|k-1}H_k^T + R_k&#92;right)^{-1},&#92;]</span>
the full recursion for the **prior estimate** and **prior error covariance** is:
<span>&#92;[&#92;hat{X}_{k+1|k} = A_k&#92;hat{X}_{k|k-1} + K_k&#92;left(Y_k - H_k&#92;hat{X}_{k|k-1}&#92;right),&#92;]</span>
<span>&#92;[&#92;Sigma_{k+1|k} = A_k&#92;Sigma_{k|k-1} A_k^T - A_k&#92;Sigma_{k|k-1}H_k^T&#92;left(H_k&#92;Sigma_{k|k-1}H_k^T+R_k&#92;right)^{-1}H_k&#92;Sigma_{k|k-1}A_k^T + Q_k,&#92;]</span>
initialized with <span>&#92;(&#92;hat{X}_{0|-1} = &#92;bar{X}_0&#92;)</span> and <span>&#92;(&#92;Sigma_{0|-1} = P_0&#92;)</span>.

The structure of the Kalman filter update <span>&#92;(&#92;hat{X}_{k+1|k} = A_k&#92;hat{X}_{k|k-1} + K_k&#92;tilde{Y}_k&#92;)</span> is a linear dynamical system driven by the innovation sequence. The Kalman gain weights the innovation by the prior uncertainty relative to the observation noise.

<div class="remark">
When <span>&#92;(H_k = 0&#92;)</span> (no observations), the Kalman filter reduces to pure prediction: <span>&#92;(K_k = 0&#92;)</span>, <span>&#92;(&#92;hat{X}_{k+1|k} = A_k&#92;bar{X}_k&#92;)</span>, and <span>&#92;(&#92;Sigma_{k+1|k} = A_k P_k A_k^T + Q_k&#92;)</span> — exactly the Lyapunov difference equation for the open-loop covariance.

For time-invariant systems where <span>&#92;(A_k, H_k, Q_k, R_k&#92;)</span> are constant, the error covariance <span>&#92;(&#92;Sigma_{k|k-1}&#92;)</span> converges to a steady-state value satisfying the <strong>discrete algebraic Riccati equation</strong>, and the Kalman gain converges to a constant <span>&#92;(K&#92;)</span>.
</div>

---

# Lectures 22–23: Kalman Filter — Bayesian Perspective

## Filtering as Bayesian Inference

From the probabilistic viewpoint, filtering is about tracking the conditional distribution of the state given all past observations. Define the **posterior distribution** at time <span>&#92;(k&#92;)</span> as <span>&#92;(&#92;pi_k^u &#92;sim (X_k | Y_0^k)&#92;)</span> and the **prior distribution** as <span>&#92;(&#92;pi_k^p &#92;sim (X_k | Y_0^{k-1})&#92;)</span>.

The two steps of the filter correspond to:

**Propagation step:** <span>&#92;(&#92;pi_{k-1}^u &#92;to &#92;pi_k^p&#92;)</span> via the Markov transition kernel.

**Update step (Bayes' formula):** <span>&#92;(&#92;pi_k^u(dx_k) &#92;propto l(x_k|y_k)&#92;,&#92;pi_k^p(dx_k)&#92;)</span>, where <span>&#92;(l(x_k|y_k)&#92;)</span> is the likelihood of the observation.

## Gaussian Case: Exact Bayes Update

For the linear-Gaussian model, if the prior at time <span>&#92;(k&#92;)</span> is Gaussian <span>&#92;(&#92;pi_k^p &#92;sim N(X_k^p, P_k^p)&#92;)</span>, then after the Bayes update with observation <span>&#92;(Y_k&#92;)</span>, the posterior is also Gaussian <span>&#92;(&#92;pi_k^u &#92;sim N(X_k^u, P_k^u)&#92;)</span> with:
<span>&#92;[X_k^u = X_k^p + P_k^u H_k^T R_k^{-1}(Y_k - H_k X_k^p),&#92;]</span>
<span>&#92;[(P_k^u)^{-1} = (P_k^p)^{-1} + H_k^T R_k^{-1} H_k.&#92;]</span>

The explicit density computation — completing the square in the product of prior and likelihood Gaussians — shows that the posterior is itself Gaussian, confirming that the Gaussian family is closed under Bayesian updating for linear-Gaussian models.

<div class="theorem">
<strong>Conditional Mean Estimator Theorem.</strong> If the signal and observation processes are jointly Gaussian, then the MMSE linear estimator <span>&#92;(&#92;hat{E}[X_k|Y_0^k]&#92;)</span> equals the conditional mean <span>&#92;(E[X_k|Y_0^k]&#92;)</span>. In other words, for jointly Gaussian random vectors, the best linear estimator and the best (possibly nonlinear) estimator coincide.
</div>

This theorem justifies the Kalman filter as the globally optimal (not just optimal among linear) estimator when all noise is Gaussian. The proof uses the fact that for jointly Gaussian <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span>, the MMSE error <span>&#92;(&#92;varepsilon = X - &#92;hat{E}[X|Y]&#92;)</span> is independent of <span>&#92;(Y&#92;)</span> (since it is Gaussian and uncorrelated with <span>&#92;(Y&#92;)</span>), hence the conditional distribution of <span>&#92;(X&#92;)</span> given <span>&#92;(Y = y&#92;)</span> is <span>&#92;(N(&#92;hat{E}[X|Y=y], &#92;text{Cov}(&#92;varepsilon))&#92;)</span>, and so <span>&#92;(E[X|Y=y] = &#92;hat{E}[X|Y=y]&#92;)</span>.

## Continuous-Time Kalman–Bucy Filter

Passing to the continuous-time limit as the time step <span>&#92;(&#92;Delta t &#92;to 0&#92;)</span> in the scalar model, one obtains the **Kalman–Bucy filter**. For the model
<span>&#92;[dX(t) = aX(t)&#92;,dt + b&#92;,dW(t),&#92;quad dY(t) = hX(t)&#92;,dt + g&#92;,dV(t),&#92;]</span>
the filter equations for the conditional mean <span>&#92;(m(t) = E[X(t)|Y_s,&#92;,s &#92;le t]&#92;)</span> and conditional variance <span>&#92;(&#92;gamma(t)&#92;)</span> are:
<span>&#92;[dm(t) = am(t)&#92;,dt + &#92;frac{h&#92;gamma(t)}{g^2}&#92;left(dY(t) - hm(t)&#92;,dt&#92;right),&#92;]</span>
<span>&#92;[&#92;dot{&#92;gamma}(t) = 2a&#92;gamma(t) + b^2 - &#92;frac{h^2&#92;gamma^2(t)}{g^2}.&#92;]</span>

The second equation is a **Riccati equation** for the error variance. In the vector case, for the model <span>&#92;(dX = AX&#92;,dt + B&#92;,dW&#92;)</span>, <span>&#92;(dY = HX&#92;,dt + G&#92;,dV&#92;)</span>, the Kalman–Bucy filter is:
<span>&#92;[d&#92;pi_t = A&#92;pi_t&#92;,dt + &#92;Sigma_t H^*(GG^*)^{-1}(dY_t - H&#92;pi_t&#92;,dt),&#92;]</span>
<span>&#92;[&#92;dot{&#92;Sigma}_t = A&#92;Sigma_t + &#92;Sigma_t A^* + BB^* - &#92;Sigma_t H^*(GG^*)^{-1}H&#92;Sigma_t,&#92;]</span>
where <span>&#92;(&#92;Sigma_t = E[(X_t - &#92;pi_t)(X_t-&#92;pi_t)^*]&#92;)</span> is the error covariance. The quantity <span>&#92;(d&#92;nu_t = dY_t - H&#92;pi_t&#92;,dt&#92;)</span> is the **innovation process** in continuous time.

---

# Lecture 24: Review and Synthesis

## MMSE vs. Conditional Expectation

The course distinguishes two estimators whose relationship is a recurring theme. The **MMSE linear estimator** <span>&#92;(&#92;hat{E}[X|Y]&#92;)</span> is the best estimator restricted to linear functions of <span>&#92;(Y&#92;)</span> and is determined entirely by first and second moments. The **conditional mean** <span>&#92;(E[X|Y]&#92;)</span> is the best unconstrained estimator (possibly nonlinear).

In general, <span>&#92;(E[(X-E[X|Y])^2] &#92;le E[(X-&#92;hat{E}[X|Y])^2] &#92;le &#92;text{Var}(X)&#92;)</span>, with the left inequality being the improvement from using the conditional mean over the linear estimator. When <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> are jointly Gaussian, the two coincide — a fact fundamental to the Kalman filter's optimality.

## Key Examination Topics

The following topics form the core of the course:

**Probability and conditional expectations:** jointly normal random variables, independence, properties of conditional expectation, Bayes' theorem.

**Stochastic processes:** Brownian motion, its properties (Gaussian, zero mean, covariance <span>&#92;(&#92;min(t,s)&#92;)</span>, independent increments, Markov, martingale, continuous paths), martingales in discrete time.

**Linear stochastic systems:** propagation of mean and covariance; Lyapunov equation; first-order ODE review.

**Markov chains:** communicating classes; invariant distributions; recurrence and transience; long-run behavior.

**Estimation:** orthogonality principle; conditional expectation as projection; time update and information update steps; discrete-time Kalman filter.

---

# ODE Supplement: First-Order Ordinary Differential Equations

## Linear First-Order ODEs

The general first-order linear ODE in standard form is
<span>&#92;[&#92;frac{dy}{dx} + P(x)y = Q(x).&#92;]</span>

**Solution by integrating factor.** The integrating factor is <span>&#92;(&#92;mu(x) = e^{&#92;int P(x)&#92;,dx}&#92;)</span>. Multiplying through converts the left side to an exact differential:
<span>&#92;[&#92;frac{d}{dx}[&#92;mu(x)y(x)] = &#92;mu(x)Q(x).&#92;]</span>
Integrating and solving for <span>&#92;(y&#92;)</span>:
<span>&#92;[y(x) = e^{-&#92;int P(x)&#92;,dx}&#92;left(c + &#92;int Q(x)&#92;,e^{&#92;int P(x)&#92;,dx}&#92;,dx&#92;right).&#92;]</span>

**Solution by variation of parameters.** The homogeneous solution is <span>&#92;(y_h = c&#92;varphi(x)&#92;)</span> where <span>&#92;(&#92;varphi(x) = e^{-&#92;int P(x)&#92;,dx}&#92;)</span>. The particular solution is sought in the form <span>&#92;(y_p = v(x)&#92;varphi(x)&#92;)</span>, leading to <span>&#92;(v'(x) = Q(x)/&#92;varphi(x)&#92;)</span>, which recovers the same formula.

## Bernoulli Equations

The **Bernoulli equation** <span>&#92;(&#92;frac{dy}{dx} + P(x)y = Q(x)y^&#92;alpha&#92;)</span> for <span>&#92;(&#92;alpha &#92;ne 0,1&#92;)</span> is nonlinear but reducible to linear form via the substitution <span>&#92;(v = y^{1-&#92;alpha}&#92;)</span>:
<span>&#92;[&#92;frac{dv}{dx} + (1-&#92;alpha)P(x)v = (1-&#92;alpha)Q(x).&#92;]</span>

## Riccati Equations

The **Riccati equation** <span>&#92;(&#92;frac{dy}{dx} = P(x) + Q(x)y + R(x)y^2&#92;)</span> is not generally solvable in closed form. However, if a particular solution <span>&#92;(y_1(x)&#92;)</span> is known, the substitution <span>&#92;(y = y_1 + v&#92;)</span> reduces the equation to a Bernoulli equation for <span>&#92;(v&#92;)</span>:
<span>&#92;[&#92;frac{dv}{dx} - [Q(x) + 2R(x)y_1(x)]v = R(x)v^2.&#92;]</span>
This Bernoulli equation with <span>&#92;(&#92;alpha = 2&#92;)</span> is then solved via <span>&#92;(w = v^{-1}&#92;)</span>, yielding a linear ODE for <span>&#92;(w&#92;)</span>.

The Riccati structure appears throughout the course: the discrete-time Kalman filter's error covariance satisfies a matrix Riccati recursion, and the continuous-time error covariance satisfies the matrix Riccati ODE <span>&#92;(&#92;dot{&#92;Sigma} = A&#92;Sigma + &#92;Sigma A^* + BB^* - &#92;Sigma H^*(GG^*)^{-1}H&#92;Sigma&#92;)</span>.

---

# Tutorial Supplement

## Tutorial 2: Linear Scaling and Gaussian Distribution

The **linear scaling rule** for PDFs states: if <span>&#92;(Y = aX + b&#92;)</span> with <span>&#92;(a > 0&#92;)</span>, then <span>&#92;(p_Y(y) = &#92;frac{1}{a}p_X&#92;!&#92;left(&#92;frac{y-b}{a}&#92;right)&#92;)</span>. This follows from differentiating the CDF <span>&#92;(F_Y(y) = F_X((y-b)/a)&#92;)</span>.

The standard normal integral <span>&#92;(&#92;int_{-&#92;infty}^&#92;infty e^{-x^2/2}&#92;,dx = &#92;sqrt{2&#92;pi}&#92;)</span> is computed via the polar-coordinate trick. For <span>&#92;(X &#92;sim N(&#92;mu,&#92;sigma^2)&#92;)</span>, standardization gives <span>&#92;(Y = (X-&#92;mu)/&#92;sigma &#92;sim N(0,1)&#92;)</span>, allowing all normal probabilities to be computed from the standard tables.

## Tutorial 3: Conditional Expectation

The **law of iterated expectations** <span>&#92;(E[X] = E[E[X|Y]]&#92;)</span> is fundamental. For discrete <span>&#92;(Y&#92;)</span>, it reads <span>&#92;(E[X] = &#92;sum_y E[X|Y=y]P(Y=y)&#92;)</span>. The proof follows by expanding the right-hand side and rearranging the double sum. For jointly continuous <span>&#92;((X,Y)&#92;)</span>, conditional expectations are computed from the conditional density <span>&#92;(f_{X|Y}(x|y) = f_{XY}(x,y)/f_Y(y)&#92;)</span>.

## Tutorial 4: MCT and Transformations

A key example illustrating the necessity of the monotonicity assumption in the MCT: the sequence <span>&#92;(f_n = n&#92;mathbf{1}_{(0,1/n]}&#92;)</span> satisfies <span>&#92;(&#92;int f_n = 1&#92;)</span> for all <span>&#92;(n&#92;)</span> but <span>&#92;(f_n &#92;to 0&#92;)</span> pointwise, so <span>&#92;(&#92;lim &#92;int f_n &#92;ne &#92;int &#92;lim f_n&#92;)</span>. The sequence is not monotone decreasing, illustrating that MCT requires non-negative monotone sequences.

For the transformation <span>&#92;(Y_1 = 2X_1&#92;)</span>, <span>&#92;(Y_2 = X_2 - X_1&#92;)</span> applied to exponential <span>&#92;((X_1, X_2)&#92;)</span>, computing the Jacobian (determinant 1/2) and applying the change-of-variables formula yields <span>&#92;(g(y_1, y_2) = e^{-y_1}e^{-y_2}&#92;)</span>, proving independence.

## Tutorial 5: MMSE Properties

**The MMSE estimator is unbiased:** <span>&#92;(E[&#92;hat{X}_M] = E[E[X|Y]] = E[X]&#92;)</span> by the tower property. **The error is orthogonal to any function of <span>&#92;(Y&#92;)</span>:** <span>&#92;(E[&#92;tilde{X}&#92;cdot g(Y)] = 0&#92;)</span> for all <span>&#92;(g&#92;)</span>. **Variance decomposition:** <span>&#92;(&#92;text{Var}(X) = &#92;text{Var}(&#92;hat{X}_M) + &#92;text{Var}(&#92;tilde{X})&#92;)</span>, since <span>&#92;(&#92;text{Cov}(&#92;tilde{X},&#92;hat{X}_M) = 0&#92;)</span>.

Example: <span>&#92;(X &#92;sim N(0,1)&#92;)</span>, <span>&#92;(Y = X + W&#92;)</span> with <span>&#92;(W &#92;sim N(0,1)&#92;)</span> independent. Since <span>&#92;(&#92;text{Cov}(X,Y) = 1&#92;)</span> and <span>&#92;(&#92;text{Var}(Y) = 2&#92;)</span>, the MMSE estimator is <span>&#92;(&#92;hat{X}_M = Y/2&#92;)</span> with MSE 1/2.

## Tutorial 6: Brownian Motion Properties

The covariance function <span>&#92;(&#92;text{Cov}(W_s, W_t) = &#92;min(s,t)&#92;)</span> follows from the independent increments property and the fact that <span>&#92;(W_s = W_s - W_0&#92;)</span> and <span>&#92;(W_t - W_s&#92;)</span> are independent for <span>&#92;(s &#92;le t&#92;)</span>.

For the geometric Brownian motion <span>&#92;(X(t) = e^{W(t)}&#92;)</span>: using the MGF of the normal, <span>&#92;(E[X(t)] = e^{t/2}&#92;)</span>, <span>&#92;(&#92;text{Var}(X(t)) = e^{2t} - e^t&#92;)</span>, and for <span>&#92;(s &#92;le t&#92;)</span>, <span>&#92;(&#92;text{Cov}(X(s),X(t)) = e^{(3s+t)/2} - e^{(s+t)/2}&#92;)</span>.

## Tutorial 7: Markov Chain State Distributions

The **state distribution** at time <span>&#92;(n&#92;)</span> is <span>&#92;(&#92;pi(n) = &#92;pi(0)P^n&#92;)</span>. For the two-state example with transition matrix <span>&#92;(P = &#92;begin{pmatrix}1/2&1/2&#92;&#92;1/3&2/3&#92;end{pmatrix}&#92;)</span> and <span>&#92;(&#92;pi(0) = [1,0]&#92;)</span>, the probability of being in state 1 at time 3 is computed as the (0,1) entry of <span>&#92;(&#92;pi(0)P^3&#92;)</span>, yielding <span>&#92;(43/72&#92;)</span>.

## Tutorial 8: Kalman Filter Examples

**Example 1 (i.i.d. observations of a constant):** <span>&#92;(X_k = X_{k-1}&#92;)</span>, <span>&#92;(Y_k = X_k + V_k&#92;)</span> with <span>&#92;(V_k &#92;sim N(0,&#92;sigma^2)&#92;)</span>. The posterior variance satisfies <span>&#92;(&#92;Sigma_{k|k} = &#92;Sigma_{k-1|k-1}&#92;sigma^2/(&#92;Sigma_{k-1|k-1}+&#92;sigma^2)&#92;)</span>, which decreases monotonically. Equivalently, <span>&#92;(&#92;sigma^2/&#92;Sigma_{k|k} = 1 + &#92;sigma^2/&#92;Sigma_{k-1|k-1}&#92;)</span>, showing <span>&#92;(&#92;Sigma_{k|k} &#92;to 0&#92;)</span> as <span>&#92;(k &#92;to &#92;infty&#92;)</span>.

**Example 2 (AR(1) signal):** <span>&#92;(X_n = aX_{n-1} + W_n&#92;)</span>, <span>&#92;(Y_n = X_n + V_n&#92;)</span>. The posterior is <span>&#92;(N(m_n, s_n^2)&#92;)</span> with
<span>&#92;[m_n = &#92;frac{&#92;tau^2 a m_{n-1} + (a^2 s_{n-1}^2 + &#92;sigma^2)Y_n}{&#92;tau^2 + a^2 s_{n-1}^2 + &#92;sigma^2},&#92;quad s_n^2 = &#92;frac{&#92;tau^2(a^2 s_{n-1}^2 + &#92;sigma^2)}{&#92;tau^2 + a^2 s_{n-1}^2 + &#92;sigma^2}.&#92;]</span>
Simulation with <span>&#92;(a = 0.98&#92;)</span> and unit noise variances shows the filter track closely following the true signal, with the error variance quickly reaching steady state.

---

# Expanded Treatment: Probability Theory

## Measure Theory Foundations

The development of probability theory on a firm mathematical foundation requires understanding why the measure-theoretic approach is necessary. The naive approach of assigning probabilities to all subsets of a sample space fails for uncountable spaces: the Vitali theorem shows that no translation-invariant measure can be defined on all subsets of <span>&#92;([0,1]&#92;)</span> satisfying countable additivity. The Borel <span>&#92;(&#92;sigma&#92;)</span>-algebra sidesteps this by restricting to the "measurable" subsets.

**Generating a <span>&#92;(&#92;sigma&#92;)</span>-algebra.** Given a collection of sets <span>&#92;(&#92;mathcal{C}&#92;)</span>, the <span>&#92;(&#92;sigma&#92;)</span>-algebra generated by <span>&#92;(&#92;mathcal{C}&#92;)</span>, written <span>&#92;(&#92;sigma(&#92;mathcal{C})&#92;)</span>, is the smallest <span>&#92;(&#92;sigma&#92;)</span>-algebra containing <span>&#92;(&#92;mathcal{C}&#92;)</span>. It exists because the intersection of any collection of <span>&#92;(&#92;sigma&#92;)</span>-algebras is again a <span>&#92;(&#92;sigma&#92;)</span>-algebra. The Borel <span>&#92;(&#92;sigma&#92;)</span>-algebra on <span>&#92;(&#92;mathbb{R}&#92;)</span> is <span>&#92;(&#92;mathcal{B}(&#92;mathbb{R}) = &#92;sigma&#92;{&#92;text{open intervals}&#92;}&#92;)</span>.

It is an important fact that <span>&#92;(&#92;mathcal{B}(&#92;mathbb{R})&#92;)</span> can also be generated by any of the following: all open sets; all closed sets; all intervals <span>&#92;((-&#92;infty, x]&#92;)</span> for <span>&#92;(x &#92;in &#92;mathbb{R}&#92;)</span>; or all intervals <span>&#92;([a,b)&#92;)</span>. This multiplicity of generators is important for characterizing random variables: the condition <span>&#92;(&#92;{X &#92;le x&#92;} &#92;in &#92;mathcal{F}&#92;)</span> for all <span>&#92;(x&#92;)</span> is equivalent to <span>&#92;(X&#92;)</span> being measurable.

**Probability measure construction.** For a probability model to be self-consistent, we need to know that a probability measure can be built from a specification of finite-dimensional distributions. The **Carathéodory extension theorem** guarantees that a countably additive set function defined on an algebra extends uniquely to the generated <span>&#92;(&#92;sigma&#92;)</span>-algebra. For stochastic processes, **Kolmogorov's extension theorem** provides the corresponding result: a consistent family of finite-dimensional distributions (satisfying symmetry and compatibility conditions) defines a unique measure on the product space.

## The Inclusion-Exclusion Principle

For three events <span>&#92;(A, B, C&#92;)</span>, the inclusion-exclusion principle generalizes to
<span>&#92;[P(A &#92;cup B &#92;cup C) = P(A) + P(B) + P(C) - P(A &#92;cap B) - P(A &#92;cap C) - P(B &#92;cap C) + P(A &#92;cap B &#92;cap C).&#92;]</span>
For <span>&#92;(n&#92;)</span> events it reads <span>&#92;(P&#92;!&#92;left(&#92;bigcup_{i=1}^n A_i&#92;right) = &#92;sum_k (-1)^{k+1}&#92;sum_{|S|=k} P&#92;!&#92;left(&#92;bigcap_{i &#92;in S} A_i&#92;right)&#92;)</span>. A useful consequence is the union bound (Boole's inequality): <span>&#92;(P(&#92;bigcup_i A_i) &#92;le &#92;sum_i P(A_i)&#92;)</span>.

## Detailed Study of the Borel–Cantelli Lemmas

The first Borel–Cantelli lemma, <span>&#92;(&#92;sum_n P(A_n) < &#92;infty &#92;Rightarrow P(&#92;limsup_n A_n) = 0&#92;)</span>, is used throughout the course in convergence proofs. The second Borel–Cantelli lemma, <span>&#92;(&#92;sum_n P(A_n) = &#92;infty&#92;)</span> and <span>&#92;(A_n&#92;)</span> independent <span>&#92;(&#92;Rightarrow P(&#92;limsup_n A_n) = 1&#92;)</span>, establishes the converse under independence. Note the independence requirement: the lemma fails without it (consider <span>&#92;(A_n = A&#92;)</span> for a single event with <span>&#92;(P(A) = 1/2&#92;)</span>; then <span>&#92;(&#92;sum P(A_n) = &#92;infty&#92;)</span> but <span>&#92;(P(A_n &#92;text{ i.o.}) = 1/2 < 1&#92;)</span>).

**Proof of Borel–Cantelli II.** It suffices to show <span>&#92;(P&#92;!&#92;left(&#92;bigcap_{n=1}^&#92;infty &#92;bigcup_{k=n}^&#92;infty A_k&#92;right) = 1&#92;)</span>, or equivalently <span>&#92;(P&#92;!&#92;left(&#92;bigcup_{n=1}^&#92;infty &#92;bigcap_{k=n}^&#92;infty A_k^c&#92;right) = 0&#92;)</span>. For any fixed <span>&#92;(n&#92;)</span>, by independence:
<span>&#92;[P&#92;!&#92;left(&#92;bigcap_{k=n}^{n+m} A_k^c&#92;right) = &#92;prod_{k=n}^{n+m}(1 - P(A_k)) &#92;le &#92;prod_{k=n}^{n+m} e^{-P(A_k)} = &#92;exp&#92;!&#92;left(-&#92;sum_{k=n}^{n+m}P(A_k)&#92;right) &#92;to 0&#92;]</span>
as <span>&#92;(m &#92;to &#92;infty&#92;)</span> since <span>&#92;(&#92;sum_k P(A_k) = &#92;infty&#92;)</span>. Taking <span>&#92;(m &#92;to &#92;infty&#92;)</span> and applying continuity from above gives <span>&#92;(P(&#92;bigcap_{k=n}^&#92;infty A_k^c) = 0&#92;)</span> for every <span>&#92;(n&#92;)</span>, hence the event <span>&#92;(&#92;bigcup_n &#92;bigcap_{k &#92;ge n} A_k^c&#92;)</span> has probability zero.

## Random Variables: Deeper Properties

**Independence of random variables.** Random variables <span>&#92;(X_1, &#92;ldots, X_n&#92;)</span> are **independent** if the events <span>&#92;(&#92;{X_1 &#92;in B_1&#92;}, &#92;ldots, &#92;{X_n &#92;in B_n&#92;}&#92;)</span> are independent for all Borel sets <span>&#92;(B_i&#92;)</span>. Equivalently, the joint CDF factors: <span>&#92;(F_{X_1,&#92;ldots,X_n}(x_1,&#92;ldots,x_n) = &#92;prod_i F_{X_i}(x_i)&#92;)</span>. For jointly continuous random variables, independence is equivalent to the joint density factoring as <span>&#92;(p_{X_1,&#92;ldots,X_n}(x_1,&#92;ldots,x_n) = &#92;prod_i p_{X_i}(x_i)&#92;)</span>.

**Functions of random variables.** The **distribution function method** and the **transformation method** provide systematic ways to find the distribution of <span>&#92;(Y = g(X)&#92;)</span>. For example, if <span>&#92;(X &#92;sim &#92;text{Exp}(&#92;lambda)&#92;)</span> and <span>&#92;(Y = X^2&#92;)</span>, then <span>&#92;(P(Y &#92;le y) = P(X &#92;le &#92;sqrt{y}) = 1 - e^{-&#92;lambda&#92;sqrt{y}}&#92;)</span> for <span>&#92;(y &#92;ge 0&#92;)</span>, so <span>&#92;(p_Y(y) = &#92;frac{&#92;lambda}{2&#92;sqrt{y}}e^{-&#92;lambda&#92;sqrt{y}}&#92;)</span>.

## Moment Generating Functions and Cumulants

The **moment generating function (MGF)** of <span>&#92;(X&#92;)</span> is <span>&#92;(M_X(t) = E[e^{tX}]&#92;)</span>. When it exists in a neighborhood of zero, all moments are finite and <span>&#92;(E[X^n] = M_X^{(n)}(0)&#92;)</span>. The MGF uniquely determines the distribution (when it exists).

For the normal distribution <span>&#92;(X &#92;sim N(&#92;mu, &#92;sigma^2)&#92;)</span):
<span>&#92;[M_X(t) = &#92;exp&#92;!&#92;left(&#92;mu t + &#92;frac{&#92;sigma^2 t^2}{2}&#92;right).&#92;]</span>

For the Poisson distribution with rate <span>&#92;(&#92;lambda&#92;)</span>: <span>&#92;(M_X(t) = &#92;exp(&#92;lambda(e^t - 1))&#92;)</span>.

The **cumulant generating function** is <span>&#92;(K_X(t) = &#92;log M_X(t)&#92;)</span>. The first few cumulants are:
<span>&#92;[&#92;kappa_1 = K_X'(0) = E[X] = &#92;mu,&#92;quad &#92;kappa_2 = K_X''(0) = &#92;text{Var}(X) = &#92;sigma^2,&#92;]</span>
<span>&#92;[&#92;kappa_3 = K_X'''(0) = E[(X-&#92;mu)^3]&#92;quad&#92;text{(skewness numerator)},&#92;quad &#92;kappa_4 = K_X^{(4)}(0) = &#92;mu_4 - 3&#92;sigma^4&#92;quad&#92;text{(excess kurtosis numerator)}.&#92;]</span>

For the normal distribution, all cumulants of order <span>&#92;(&#92;ge 3&#92;)</span> vanish: <span>&#92;(&#92;kappa_n = 0&#92;)</span> for <span>&#92;(n &#92;ge 3&#92;)</span>. This makes the normal distribution uniquely simple from the cumulant perspective and explains why the CLT converges to it.

The **moment-cumulant relation** expresses moments in terms of cumulants: <span>&#92;(&#92;mu_n' = &#92;sum_{&#92;pi &#92;in &#92;Pi_n} &#92;prod_{B &#92;in &#92;pi} &#92;kappa_{|B|}&#92;)</span>, summing over all set partitions of <span>&#92;(&#92;{1,&#92;ldots,n&#92;}&#92;)</span>. For example, <span>&#92;(E[X^4] = &#92;kappa_4 + 4&#92;kappa_3&#92;kappa_1 + 3&#92;kappa_2^2 + 6&#92;kappa_2&#92;kappa_1^2 + &#92;kappa_1^4&#92;)</span>.

## The Exponential Distribution in Detail

The exponential distribution <span>&#92;(&#92;text{Exp}(&#92;lambda)&#92;)</span> is the continuous analogue of the geometric distribution. Its CDF is <span>&#92;(F(x) = 1 - e^{-&#92;lambda x}&#92;)</span> for <span>&#92;(x &#92;ge 0&#92;)</span>. The key properties:

- Mean: <span>&#92;(E[X] = 1/&#92;lambda&#92;)</span>, computed as <span>&#92;(&#92;int_0^&#92;infty x&#92;lambda e^{-&#92;lambda x}&#92;,dx = 1/&#92;lambda&#92;)</span> by integration by parts.
- Variance: <span>&#92;(&#92;text{Var}(X) = 1/&#92;lambda^2&#92;)</span>.
- MGF: <span>&#92;(M_X(t) = &#92;lambda/(&#92;lambda - t)&#92;)</span> for <span>&#92;(t < &#92;lambda&#92;)</span>.
- The memoryless property: already proved in Lecture 6; it is the defining characteristic of the exponential among continuous distributions.

The Poisson process and exponential distribution are intimately connected: if events arrive as a Poisson process with rate <span>&#92;(&#92;lambda&#92;)</span>, the inter-arrival times are i.i.d. <span>&#92;(&#92;text{Exp}(&#92;lambda)&#92;)</span>.

## Conditional Expectation: Complete Development

The abstract definition of conditional expectation is motivated by seeking a random variable <span>&#92;(Z = E[X|&#92;mathcal{G}]&#92;)</span> that encodes the best prediction of <span>&#92;(X&#92;)</span> given the information in <span>&#92;(&#92;mathcal{G}&#92;)</span>. By the Radon–Nikodym theorem, this exists and is unique: for any <span>&#92;(X &#92;in L^1(&#92;Omega,&#92;mathcal{F},P)&#92;)</span> and sub-<span>&#92;(&#92;sigma&#92;)</span>-algebra <span>&#92;(&#92;mathcal{G}&#92;)</span>, there exists a unique (a.s.) <span>&#92;(&#92;mathcal{G}&#92;)</span>-measurable <span>&#92;(Z&#92;)</span> with <span>&#92;(E[Z] = E[X]&#92;)</span> and <span>&#92;(&#92;int_G Z&#92;,dP = &#92;int_G X&#92;,dP&#92;)</span> for all <span>&#92;(G &#92;in &#92;mathcal{G}&#92;)</span>.

A detailed verification of the tower property: suppose <span>&#92;(&#92;mathcal{H} &#92;subseteq &#92;mathcal{G}&#92;)</span>. We must show <span>&#92;(E[E[X|&#92;mathcal{G}]|&#92;mathcal{H}] = E[X|&#92;mathcal{H}]&#92;)</span>, i.e., for every <span>&#92;(H &#92;in &#92;mathcal{H}&#92;)</span>,
<span>&#92;[&#92;int_H E[E[X|&#92;mathcal{G}]|&#92;mathcal{H}]&#92;,dP = &#92;int_H X&#92;,dP.&#92;]</span>
But since <span>&#92;(H &#92;in &#92;mathcal{H} &#92;subseteq &#92;mathcal{G}&#92;)</span>, the partial averaging property of the outer conditional expectation gives
<span>&#92;[&#92;int_H E[E[X|&#92;mathcal{G}]|&#92;mathcal{H}]&#92;,dP = &#92;int_H E[X|&#92;mathcal{G}]&#92;,dP = &#92;int_H X&#92;,dP,&#92;]</span>
where the last equality uses the partial averaging property of <span>&#92;(E[X|&#92;mathcal{G}]&#92;)</span> with <span>&#92;(H &#92;in &#92;mathcal{G}&#92;)</span>. Since the characterization holds for all <span>&#92;(H &#92;in &#92;mathcal{H}&#92;)</span>, the tower property is established.

The property "taking out what is known": if <span>&#92;(Z&#92;)</span> is <span>&#92;(&#92;mathcal{G}&#92;)</span>-measurable and bounded, then <span>&#92;(E[ZX|&#92;mathcal{G}] = Z E[X|&#92;mathcal{G}]&#92;)</span>. Proof: for any <span>&#92;(G &#92;in &#92;mathcal{G}&#92;)</span>,
<span>&#92;[&#92;int_G Z E[X|&#92;mathcal{G}]&#92;,dP = &#92;int_G ZX&#92;,dP&#92;]</span>
holds by the integral version of the result for indicator functions, extended to general bounded <span>&#92;(Z&#92;)</span> by linearity and monotone convergence.

---

# Expanded Treatment: Random Processes

## Stationary Processes and Spectral Theory

A random process <span>&#92;(&#92;{X_t&#92;}&#92;)</span> is **strictly stationary** if its finite-dimensional distributions are invariant under time shifts. It is **wide-sense stationary (WSS)** or **weakly stationary** if <span>&#92;(&#92;mu_X(t) = &#92;mu&#92;)</span> (constant) and <span>&#92;(R_X(t,s) = R_X(t-s)&#92;)</span> (depends only on the lag). WSS processes have a rich spectral theory.

The **power spectral density (PSD)** of a WSS process is the Fourier transform of the autocorrelation:
<span>&#92;[S_X(&#92;omega) = &#92;int_{-&#92;infty}^&#92;infty R_X(&#92;tau) e^{-i2&#92;pi&#92;omega&#92;tau}&#92;,d&#92;tau.&#92;]</span>

The PSD is real, non-negative, and even. The **Wiener–Khinchin theorem** states that for a WSS process, <span>&#92;(S_X(&#92;omega)&#92;)</span> is the PSD in the sense that <span>&#92;(&#92;text{Var}(X_t) = R_X(0) = &#92;int_{-&#92;infty}^&#92;infty S_X(&#92;omega)&#92;,d&#92;omega&#92;)</span>.

White noise has a flat PSD: <span>&#92;(S_&#92;xi(&#92;omega) &#92;equiv 1&#92;)</span> (or a constant). This is the origin of the term "white" — analogous to white light containing all frequencies equally. The autocovariance of white noise is <span>&#92;(C_&#92;xi(&#92;tau) = &#92;delta(&#92;tau)&#92;)</span>. The response of a linear system with transfer function <span>&#92;(H(&#92;omega)&#92;)</span> to white noise has PSD <span>&#92;(S_Y(&#92;omega) = |H(&#92;omega)|^2 S_&#92;xi(&#92;omega) = |H(&#92;omega)|^2&#92;)</span>.

For the damped oscillator driven by white noise, the transfer function is
<span>&#92;[H(&#92;omega) = &#92;frac{1}{&#92;omega_0^2 - &#92;omega^2 + 2i&#92;beta&#92;omega_0&#92;omega},&#92;]</span>
and the PSD of the response is <span>&#92;(S_X(&#92;omega) = |H(&#92;omega)|^2&#92;)</span>, peaked near <span>&#92;(&#92;omega &#92;approx &#92;omega_d&#92;)</span> — the resonance frequency.

## Independent Increment Processes

A process <span>&#92;(&#92;{X_t&#92;}&#92;)</span> has **independent increments** if for all <span>&#92;(t_0 < t_1 < &#92;cdots < t_n&#92;)</span>, the increments <span>&#92;(X_{t_1}-X_{t_0}, X_{t_2}-X_{t_1}, &#92;ldots, X_{t_n}-X_{t_{n-1}}&#92;)</span> are independent. This is a special case of the Markov property: knowing the increment structure means past increments carry no additional information about future ones beyond what is encoded in the current position.

The Brownian motion is the most important example. Its increments are not only independent but also **stationary** (the distribution of <span>&#92;(W_{t+s} - W_t&#92;)</span> depends only on <span>&#92;(s&#92;)</span>). Gaussian independent increments with continuous paths and <span>&#92;(&#92;text{Var}(W_t) = &#92;sigma^2 t&#92;)</span> characterize Brownian motion uniquely.

---

# Expanded Treatment: Martingales

## Filtrations and Natural Filtrations

A **filtration** <span>&#92;((&#92;mathcal{F}_n)_{n &#92;ge 0}&#92;)</span> is an increasing sequence of <span>&#92;(&#92;sigma&#92;)</span>-algebras: <span>&#92;(&#92;mathcal{F}_0 &#92;subseteq &#92;mathcal{F}_1 &#92;subseteq &#92;cdots &#92;subseteq &#92;mathcal{F}&#92;)</span>. The filtration models the accumulation of information over time. The **natural filtration** of a process <span>&#92;(&#92;{X_n&#92;}&#92;)</span> is <span>&#92;(&#92;mathcal{F}_n^X = &#92;sigma(X_0, X_1, &#92;ldots, X_n)&#92;)</span), the smallest <span>&#92;(&#92;sigma&#92;)</span>-algebra with respect to which <span>&#92;(X_0, &#92;ldots, X_n&#92;)</span> are all measurable.

A process <span>&#92;((X_n)&#92;)</span> is **adapted** to the filtration <span>&#92;((&#92;mathcal{F}_n)&#92;)</span> if <span>&#92;(X_n&#92;)</span> is <span>&#92;(&#92;mathcal{F}_n&#92;)</span>-measurable for each <span>&#92;(n&#92;)</span> — meaning <span>&#92;(X_n&#92;)</span>'s value is "known" at time <span>&#92;(n&#92;)</span>. A martingale is an adapted integrable process with constant conditional means.

## Martingale Examples in Detail

**Doob's martingale.** For any integrable <span>&#92;(X&#92;)</span> and filtration <span>&#92;((&#92;mathcal{F}_n)&#92;)</span>, the sequence <span>&#92;(M_n = E[X|&#92;mathcal{F}_n]&#92;)</span> is a martingale (with respect to <span>&#92;(&#92;mathcal{F}_n&#92;)</span>). This follows immediately from the tower property: <span>&#92;(E[M_{n+1}|&#92;mathcal{F}_n] = E[E[X|&#92;mathcal{F}_{n+1}]|&#92;mathcal{F}_n] = E[X|&#92;mathcal{F}_n] = M_n&#92;)</span>. The Kalman filter estimate <span>&#92;(&#92;hat{X}_{k|k} = E[X_k|Y_0^k]&#92;)</span> is a Doob martingale.

**Likelihood ratio martingale.** Let <span>&#92;(P&#92;)</span> and <span>&#92;(Q&#92;)</span> be two probability measures on <span>&#92;((&#92;Omega,&#92;mathcal{F})&#92;)</span>, with <span>&#92;(Q &#92;ll P&#92;)</span> (Q absolutely continuous with respect to P). The Radon–Nikodym derivative <span>&#92;(L_n = dQ/dP |_{&#92;mathcal{F}_n}&#92;)</span> forms a martingale under <span>&#92;(P&#92;)</span>. This is the likelihood ratio process appearing in hypothesis testing and change-point detection.

**Wald's identity.** For a random walk <span>&#92;(S_n = &#92;sum_{k=1}^n X_k&#92;)</span> with i.i.d. <span>&#92;(X_k&#92;)</span> having mean <span>&#92;(&#92;mu&#92;)</span>, the process <span>&#92;(S_n - n&#92;mu&#92;)</span> is a martingale. Applying optional stopping: <span>&#92;(E[S_&#92;tau] = &#92;mu E[&#92;tau]&#92;)</span> under suitable integrability.

## The Betting Strategy and Wealth Processes

The martingale betting strategy provides an intuitive way to construct martingales. Suppose a gambler bets <span>&#92;(H_n&#92;)</span> units at time <span>&#92;(n&#92;)</span> on a fair game. The total wealth at time <span>&#92;(N&#92;)</span> is <span>&#92;(S_N = S_0 + &#92;sum_{n=1}^N H_n(X_n - X_{n-1})&#92;)</span>. If <span>&#92;(H_n&#92;)</span> is predictable (i.e., <span>&#92;(&#92;mathcal{F}_{n-1}&#92;)</span>-measurable), then the "stochastic integral" <span>&#92;((H &#92;cdot X)_N = &#92;sum_{n=1}^N H_n &#92;Delta X_n&#92;)</span> is a martingale when <span>&#92;(X&#92;)</span> is a martingale. This is the **discrete stochastic integral** — no betting strategy on a fair game can produce a positive expected profit.

## Doob's Maximal Inequality: Full Proof

Let <span>&#92;((S_n, &#92;mathcal{F}_n)&#92;)</span> be a nonnegative submartingale. Define <span>&#92;(S_n^* = &#92;max_{k &#92;le n} S_k&#92;)</span>. We prove <span>&#92;(&#92;lambda P(S_n^* &#92;ge &#92;lambda) &#92;le E[S_n]&#92;)</span>.

Let <span>&#92;(A = &#92;{S_n^* &#92;ge &#92;lambda&#92;}&#92;)</span> and <span>&#92;(&#92;tau = &#92;min&#92;{k &#92;le n: S_k &#92;ge &#92;lambda&#92;}&#92;)</span>, with <span>&#92;(&#92;tau = n+1&#92;)</span> on <span>&#92;(A^c&#92;)</span>. Define <span>&#92;(A_k = &#92;{&#92;tau = k&#92;} &#92;in &#92;mathcal{F}_k&#92;)</span> for <span>&#92;(k &#92;le n&#92;)</span>. On <span>&#92;(A_k&#92;)</span>, <span>&#92;(S_k &#92;ge &#92;lambda&#92;)</span>. Since <span>&#92;(A = &#92;bigcup_{k=1}^n A_k&#92;)</span> (disjoint union) and <span>&#92;((S_n)&#92;)</span> is a submartingale:
<span>&#92;[&#92;lambda P(A) = &#92;lambda &#92;sum_{k=1}^n P(A_k) &#92;le &#92;sum_{k=1}^n E[S_k &#92;mathbf{1}_{A_k}] &#92;le &#92;sum_{k=1}^n E[S_n &#92;mathbf{1}_{A_k}] = E[S_n &#92;mathbf{1}_A] &#92;le E[S_n].&#92;]</span>
The second inequality uses the submartingale property: <span>&#92;(E[S_k &#92;mathbf{1}_{A_k}] &#92;le E[E[S_n|&#92;mathcal{F}_k]&#92;mathbf{1}_{A_k}] = E[S_n &#92;mathbf{1}_{A_k}]&#92;)</span>.

## Optional Stopping: Conditions and Proof

The optional stopping theorem (OST) states <span>&#92;(E[S_&#92;tau] = E[S_0]&#92;)</span> for a martingale <span>&#92;((S_n)&#92;)</span> and stopping time <span>&#92;(&#92;tau&#92;)</span>, provided appropriate integrability. A sufficient set of conditions is: (i) <span>&#92;(P(&#92;tau < &#92;infty) = 1&#92;)</span>; (ii) <span>&#92;(E[&#92;tau] < &#92;infty&#92;)</span>; (iii) <span>&#92;(|S_{n+1} - S_n| &#92;le C&#92;)</span> a.s. for some constant <span>&#92;(C&#92;)</span>.

**Proof.** The stopped process <span>&#92;(S_{n &#92;wedge &#92;tau}&#92;)</span> is a martingale (since <span>&#92;(&#92;tau&#92;)</span> is a stopping time). Thus <span>&#92;(E[S_{n &#92;wedge &#92;tau}] = E[S_0]&#92;)</span> for all <span>&#92;(n&#92;)</span>. We need to show <span>&#92;(S_{n &#92;wedge &#92;tau} &#92;to S_&#92;tau&#92;)</span> with dominated convergence. The bound: <span>&#92;(|S_{n &#92;wedge &#92;tau} - S_0| &#92;le C &#92;cdot (n &#92;wedge &#92;tau) &#92;le C&#92;tau&#92;)</span>, and <span>&#92;(E[C&#92;tau] = CE[&#92;tau] < &#92;infty&#92;)</span>. So by DCT, <span>&#92;(E[S_{n&#92;wedge&#92;tau}] &#92;to E[S_&#92;tau]&#92;)</span), giving <span>&#92;(E[S_&#92;tau] = E[S_0]&#92;)</span>.

---

# Expanded Treatment: Markov Chains

## Ehrenfest Chain

The **Ehrenfest model** of heat exchange has <span>&#92;(N&#92;)</span> balls distributed between two urns. At each step, one ball is chosen uniformly at random and moved to the other urn. The state is <span>&#92;(X_n &#92;in &#92;{0, 1, &#92;ldots, N&#92;}&#92;)</span> (number of balls in urn 1). The transition probabilities are:
<span>&#92;[p_{k,k+1} = &#92;frac{N-k}{N},&#92;quad p_{k,k-1} = &#92;frac{k}{N},&#92;quad p_{k,j} = 0&#92;text{ otherwise.}&#92;]</span>

This chain is irreducible, aperiodic, and has a unique stationary distribution: the Binomial<span>&#92;((N, 1/2)&#92;)</span> distribution. The chain models the equalization of temperature: starting from all balls in one urn (maximum order), the system evolves toward the most probable state with <span>&#92;(N/2&#92;)</span> balls in each urn.

## Three-State Chain Diagonalization

For a three-state Markov chain with transition matrix <span>&#92;(P&#92;)</span>, the <span>&#92;(n&#92;)</span>-step transition probabilities can be found by diagonalization. Writing <span>&#92;(P = U&#92;Lambda U^{-1}&#92;)</span> where <span>&#92;(&#92;Lambda = &#92;text{diag}(&#92;lambda_1, &#92;lambda_2, &#92;lambda_3)&#92;)</span> are the eigenvalues, we have <span>&#92;(P^n = U&#92;Lambda^n U^{-1)&#92;)</span>. The eigenvalues of a stochastic matrix always include <span>&#92;(&#92;lambda_1 = 1&#92;)</span>, and by the Perron–Frobenius theorem, all other eigenvalues satisfy <span>&#92;(|&#92;lambda_i| &#92;le 1&#92;)</span>. As <span>&#92;(n &#92;to &#92;infty&#92;)</span>, only the eigenvalue 1 survives, and <span>&#92;(P^n &#92;to &#92;mathbf{1}&#92;pi&#92;)</span> where <span>&#92;(&#92;pi&#92;)</span> is the stationary distribution.

<div class="example">
<strong>Social Mobility Example.</strong> Consider a three-class social mobility model with transition matrix
<span>&#92;[P = &#92;begin{pmatrix}0.45 & 0.48 & 0.07 &#92;&#92; 0.05 & 0.70 & 0.25 &#92;&#92; 0.01 & 0.50 & 0.49&#92;end{pmatrix}.&#92;]</span>
The eigenvalues are 1, and two others with <span>&#92;(|&#92;lambda| < 1&#92;)</span>. The stationary distribution <span>&#92;(&#92;pi&#92;)</span> satisfying <span>&#92;(&#92;pi P = &#92;pi&#92;)</span> gives the long-run class distribution. Starting from any initial distribution, <span>&#92;(&#92;pi(n) = &#92;pi(0)P^n &#92;to &#92;pi&#92;)</span> geometrically fast.
</div>

## Proof of the Hitting Probability Characterization

<div class="theorem">
The hitting probabilities <span>&#92;(h_i^A = P(&#92;tau^A < &#92;infty | X_0 = i)&#92;)</span> satisfy:
<ul>
<li><span>&#92;(h_i^A = 1&#92;)</span> for all <span>&#92;(i &#92;in A&#92;)</span>.</li>
<li><span>&#92;(h_i^A = &#92;sum_{j &#92;in S} p_{ij} h_j^A&#92;)</span> for <span>&#92;(i &#92;notin A&#92;)</span>.</li>
</ul>
Moreover, <span>&#92;(&#92;mathbf{h}^A&#92;)</span> is the minimal non-negative solution to this system.
</div>

**Proof.** For <span>&#92;(i &#92;in A&#92;)</span>, the chain starts in <span>&#92;(A&#92;)</span> so <span>&#92;(&#92;tau^A = 0&#92;)</span> almost surely. For <span>&#92;(i &#92;notin A&#92;)</span>, condition on the first step:
<span>&#92;[h_i^A = P(&#92;tau^A < &#92;infty | X_0 = i) = &#92;sum_j P(X_1 = j | X_0 = i) P(&#92;tau^A < &#92;infty | X_1 = j) = &#92;sum_j p_{ij} h_j^A,&#92;]</span>
where we used the Markov property: given <span>&#92;(X_1 = j&#92;)</span>, the chain starts fresh from <span>&#92;(j&#92;)</span>, so <span>&#92;(P(&#92;tau^A < &#92;infty | X_1 = j) = h_j^A&#92;)</span>.

The minimality is important: the system of linear equations may have multiple solutions (for example, if A is transient from some states), and <span>&#92;(&#92;mathbf{h}^A&#92;)</span> is the smallest.

## Recurrence and Transience: Complete Theory

A state <span>&#92;(i&#92;)</span> is **recurrent** if and only if <span>&#92;(&#92;sum_{n=0}^&#92;infty p^{(n)}_{ii} = &#92;infty&#92;)</span>. This is equivalent to: the chain, started at <span>&#92;(i&#92;)</span>, returns to <span>&#92;(i&#92;)</span> infinitely often with probability 1.

A state is **transient** if and only if <span>&#92;(&#92;sum_{n=0}^&#92;infty p^{(n)}_{ii} < &#92;infty&#92;)</span>. In this case, the chain returns to <span>&#92;(i&#92;)</span> only finitely many times.

For a simple random walk on <span>&#92;(&#92;mathbb{Z}&#92;)</span> with <span>&#92;(p = q = 1/2&#92;)</span>, state 0 is recurrent in 1D and 2D, but transient in 3D and higher. This is Pólya's recurrence theorem. The key computation uses Stirling's approximation: <span>&#92;(p^{(2n)}_{00} = &#92;binom{2n}{n}/4^n &#92;sim 1/&#92;sqrt{&#92;pi n}&#92;)</span> in 1D, and <span>&#92;(&#92;sum_n p^{(2n)}_{00} = &#92;infty&#92;)</span>.

**Positive recurrence** means the expected return time is finite: <span>&#92;(m_i = E_i[&#92;tau_i^+] < &#92;infty&#92;)</span>. For a finite irreducible chain, all states are positive recurrent and <span>&#92;(&#92;pi_i = 1/m_i&#92;)</span> — the stationary probability of being in state <span>&#92;(i&#92;)</span> equals the reciprocal of the mean return time.

**The random walk on the integers** <span>&#92;(&#92;{0, 1, &#92;ldots, N&#92;}&#92;)</span> with reflecting boundaries at 0 and <span>&#92;(N&#92;)</span> (i.e., <span>&#92;(p_{00} = q&#92;)</span>, <span>&#92;(p_{NN} = p&#92;)</span>) gives an irreducible finite chain that is positive recurrent. The stationary distribution can be found by solving <span>&#92;(&#92;pi P = &#92;pi&#92;)</span>.

## Detailed Balance and Reversibility in Practice

The detailed balance equations <span>&#92;(&#92;pi_i p_{ij} = &#92;pi_j p_{ji}&#92;)</span> have a beautiful physical interpretation: in equilibrium, the average number of transitions per unit time from <span>&#92;(i&#92;)</span> to <span>&#92;(j&#92;)</span> equals the average number from <span>&#92;(j&#92;)</span> to <span>&#92;(i&#92;)</span>. This is the discrete-time analogue of microscopic reversibility in thermodynamics.

**Metropolis–Hastings algorithm.** Given a target distribution <span>&#92;(&#92;pi&#92;)</span> on a large state space, one designs a Markov chain with stationary distribution <span>&#92;(&#92;pi&#92;)</span> by accepting proposed moves with probability <span>&#92;(&#92;min(1, &#92;pi_j q_{ji}/(&#92;pi_i q_{ij}))&#92;)</span>, where <span>&#92;(q_{ij}&#92;)</span> is a proposal probability. The resulting chain satisfies detailed balance and thus has <span>&#92;(&#92;pi&#92;)</span> as its stationary distribution. This is the foundation of Markov Chain Monte Carlo (MCMC) methods.

---

# Expanded Treatment: MMSE Estimation

## Hilbert Space Theory and Projections

The space <span>&#92;(L^2(&#92;Omega,&#92;mathcal{F},P)&#92;)</span> is a complete inner product space (Hilbert space) with inner product <span>&#92;(&#92;langle X, Y&#92;rangle = E[XY]&#92;)</span>. The norm is <span>&#92;(&#92;|X&#92;| = &#92;sqrt{E[X^2]}&#92;)</span>. Completeness means every Cauchy sequence (in mean square) converges to an element of <span>&#92;(L^2&#92;)</span>.

The **projection theorem** in Hilbert spaces states: for any closed subspace <span>&#92;(V&#92;)</span> and any <span>&#92;(X &#92;in L^2&#92;)</span>, there exists a unique <span>&#92;(&#92;hat{X} &#92;in V&#92;)</span> minimizing <span>&#92;(&#92;|X - Z&#92;|&#92;)</span> over <span>&#92;(Z &#92;in V&#92;)</span>, and <span>&#92;(&#92;hat{X}&#92;)</span> is characterized by <span>&#92;(X - &#92;hat{X} &#92;perp V&#92;)</span>. This is the orthogonality principle.

Three canonical projections appear in this course:

1. **Projection onto constants:** The best estimate of <span>&#92;(X&#92;)</span> using only a constant is <span>&#92;(&#92;hat{X} = E[X]&#92;)</span>. Orthogonality: <span>&#92;(E[X - E[X]] = 0&#92;)</span>.

2. **Linear MMSE:** The best linear estimate <span>&#92;(&#92;hat{X} = b + &#92;sum_i &#92;alpha_i Y_i&#92;)</span> is the projection of <span>&#92;(X&#92;)</span) onto the closed linear span of <span>&#92;(&#92;{1, Y_1, &#92;ldots, Y_n&#92;}&#92;)</span>.

3. **Conditional expectation:** The best (possibly nonlinear) estimate <span>&#92;(E[X|Y]&#92;)</span> is the projection onto the sub-<span>&#92;(&#92;sigma&#92;)</span>-algebra generated by <span>&#92;(Y&#92;)</span> — a much larger subspace.

The MSE hierarchy is: <span>&#92;(E[(X - E[X|Y])^2] &#92;le E[(X - &#92;hat{E}[X|Y])^2] &#92;le E[(X - E[X])^2]&#92;)</span>, with each inequality strict in general.

## Gram–Schmidt in Detail

The Gram–Schmidt process orthogonalizes a sequence of observations <span>&#92;(Y_1, Y_2, &#92;ldots&#92;)</span> (centered) as follows:
<span>&#92;[&#92;tilde{Y}_1 = Y_1 - E[Y_1],&#92;]</span>
<span>&#92;[&#92;tilde{Y}_k = Y_k - E[Y_k] - &#92;sum_{j=1}^{k-1} &#92;frac{&#92;text{Cov}(Y_k, &#92;tilde{Y}_j)}{&#92;text{Var}(&#92;tilde{Y}_j)}&#92;tilde{Y}_j&#92;quad&#92;text{for }k &#92;ge 2.&#92;]</span>

The resulting <span>&#92;(&#92;tilde{Y}_j&#92;)</span> are uncorrelated (in the sense <span>&#92;(E[&#92;tilde{Y}_i &#92;tilde{Y}_j] = 0&#92;)</span> for <span>&#92;(i &#92;ne j&#92;)</span>) and span the same linear space as the original <span>&#92;(Y_j&#92;)</span>'s. The joint projection decomposes as:
<span>&#92;[&#92;hat{E}[X|Y_1,&#92;ldots,Y_n] = E[X] + &#92;sum_{k=1}^n &#92;frac{&#92;text{Cov}(X,&#92;tilde{Y}_k)}{&#92;text{Var}(&#92;tilde{Y}_k)}&#92;tilde{Y}_k.&#92;]</span>

The recursion for Gram–Schmidt corresponds exactly to the **innovations process** in filtering: each <span>&#92;(&#92;tilde{Y}_k&#92;)</span> is the "new information" in <span>&#92;(Y_k&#92;)</span> beyond what was already captured in <span>&#92;(Y_1,&#92;ldots,Y_{k-1}&#92;)</span>.

## Block Matrix Inversion and Schur Complements

The **Schur complement formula** provides a powerful tool for inverting block matrices. If
<span>&#92;[M = &#92;begin{pmatrix}A & B &#92;&#92; C & D&#92;end{pmatrix}&#92;]</span>
with <span>&#92;(D&#92;)</span> invertible, then <span>&#92;(M&#92;)</span> is invertible if and only if the Schur complement <span>&#92;(&#92;Delta_A = A - BD^{-1}C&#92;)</span> is invertible, and
<span>&#92;[M^{-1} = &#92;begin{pmatrix}&#92;Delta_A^{-1} & -&#92;Delta_A^{-1}BD^{-1} &#92;&#92; -D^{-1}C&#92;Delta_A^{-1} & D^{-1} + D^{-1}C&#92;Delta_A^{-1}BD^{-1}&#92;end{pmatrix}.&#92;]</span>

The **matrix inversion lemma** (Woodbury identity) is a consequence:
<span>&#92;[(A + BCD)^{-1} = A^{-1} - A^{-1}B(C^{-1} + DA^{-1}B)^{-1}DA^{-1}.&#92;]</span>

In the Kalman filter context, the two equivalent forms of the posterior error covariance
<span>&#92;[&#92;Sigma_{k|k} = &#92;Sigma_{k|k-1} - &#92;Sigma_{k|k-1}H_k^T M_k^{-1}H_k&#92;Sigma_{k|k-1}&#92;quad&#92;text{and}&#92;quad &#92;Sigma_{k|k}^{-1} = &#92;Sigma_{k|k-1}^{-1} + H_k^T R_k^{-1}H_k&#92;]</span>
are related by exactly this matrix inversion lemma. The first form is numerically stable when <span>&#92;(R_k&#92;)</span> is much larger than <span>&#92;(&#92;Sigma_{k|k-1}&#92;)</span> (high noise); the second form (information filter form) is stable when <span>&#92;(&#92;Sigma_{k|k-1}&#92;)</span> is large (high prior uncertainty).

---

# Expanded Treatment: The Kalman Filter

## Innovations Sequence Properties

The innovations <span>&#92;(&#92;tilde{Y}_k = Y_k - H_k&#92;hat{X}_{k|k-1}&#92;)</span> form a **white noise sequence**: they are uncorrelated across time steps.

**Proof:** For <span>&#92;(k > j&#92;)</span>, <span>&#92;(E[&#92;tilde{Y}_k &#92;tilde{Y}_j^T] = 0&#92;)</span>. This follows because <span>&#92;(&#92;tilde{Y}_j&#92;)</span> is in the linear span of <span>&#92;(Y_0,&#92;ldots,Y_j&#92;)</span>, hence in the information available at time <span>&#92;(j&#92;)</span>. The innovation <span>&#92;(&#92;tilde{Y}_k = H_k&#92;tilde{X}_{k|k-1} + V_k&#92;)</span> has the component <span>&#92;(&#92;tilde{X}_{k|k-1} = X_k - &#92;hat{X}_{k|k-1}&#92;)</span> which is orthogonal to all past observations by the projection property. Since <span>&#92;(V_k&#92;)</span> is also uncorrelated with past observations, <span>&#92;(E[&#92;tilde{Y}_k &#92;tilde{Y}_j^T] = 0&#92;)</span> for <span>&#92;(k > j&#92;)</span>.

The **covariance of the innovation** is <span>&#92;(M_k = E[&#92;tilde{Y}_k&#92;tilde{Y}_k^T] = H_k&#92;Sigma_{k|k-1}H_k^T + R_k&#92;)</span>. The term <span>&#92;(H_k&#92;Sigma_{k|k-1}H_k^T&#92;)</span> captures the uncertainty in predicting <span>&#92;(Y_k&#92;)</span> due to uncertainty in the state, while <span>&#92;(R_k&#92;)</span> is the measurement noise.

## Kalman Filter as Sequential Orthogonal Projection

The Kalman filter can be understood as performing Gram–Schmidt orthogonalization of the observation sequence in real time. At each step, the prior estimate <span>&#92;(&#92;hat{X}_{k|k-1}&#92;)</span> is the projection of <span>&#92;(X_k&#92;)</span> onto the linear span of <span>&#92;(&#92;{1,Y_0,&#92;ldots,Y_{k-1}&#92;}&#92;)</span>. The innovation <span>&#92;(&#92;tilde{Y}_k&#92;)</span> is the component of <span>&#92;(Y_k&#92;)</span> orthogonal to this span. The posterior <span>&#92;(&#92;hat{X}_{k|k}&#92;)</span> adds to the prior the component of <span>&#92;(X_k&#92;)</span> that can be predicted from <span>&#92;(&#92;tilde{Y}_k&#92;)</span>:
<span>&#92;[&#92;hat{X}_{k|k} = &#92;hat{X}_{k|k-1} + &#92;frac{&#92;text{Cov}(X_k,&#92;tilde{Y}_k)}{&#92;text{Cov}(&#92;tilde{Y}_k)}&#92;tilde{Y}_k = &#92;hat{X}_{k|k-1} + &#92;Sigma_{k|k-1}H_k^T M_k^{-1}&#92;tilde{Y}_k.&#92;]</span>

The **Kalman gain** <span>&#92;(G_k = &#92;Sigma_{k|k-1}H_k^T M_k^{-1}&#92;)</span> (as used in the information update) measures how much the estimate should be adjusted per unit of innovation. When prior uncertainty is large (<span>&#92;(&#92;Sigma_{k|k-1}&#92;)</span> large), the gain is large — we trust the observations more. When measurement noise is large (<span>&#92;(R_k&#92;)</span> large, hence <span>&#92;(M_k&#92;)</span> large), the gain is small — we trust the model prediction more.

## Steady-State Kalman Filter

For a time-invariant system (constant <span>&#92;(A, H, Q, R&#92;)</span>), the error covariance sequence <span>&#92;(&#92;Sigma_{k|k-1}&#92;)</span> converges to a steady-state value <span>&#92;(&#92;bar{&#92;Sigma}&#92;)</span> satisfying the **discrete algebraic Riccati equation (DARE)**:
<span>&#92;[&#92;bar{&#92;Sigma} = A&#92;bar{&#92;Sigma}A^T - A&#92;bar{&#92;Sigma}H^T(H&#92;bar{&#92;Sigma}H^T + R)^{-1}H&#92;bar{&#92;Sigma}A^T + Q.&#92;]</span>

The steady-state Kalman gain is <span>&#92;(&#92;bar{K} = A&#92;bar{&#92;Sigma}H^T(H&#92;bar{&#92;Sigma}H^T+R)^{-1}&#92;)</span>, and the filter becomes a time-invariant linear system:
<span>&#92;[&#92;hat{X}_{k+1|k} = A&#92;hat{X}_{k|k-1} + &#92;bar{K}(Y_k - H&#92;hat{X}_{k|k-1}).&#92;]</span>

The stability of this steady-state filter (i.e., the convergence of estimation errors) is related to the stability of the matrix <span>&#92;(A - &#92;bar{K}H&#92;)</span>. Under standard observability and controllability conditions, the steady-state Kalman filter is stable.

## Scalar Kalman Filter: Complete Example

Consider the tracking problem: <span>&#92;(X_{k+1} = X_k + W_k&#92;)</span> (random walk), <span>&#92;(Y_k = X_k + V_k&#92;)</span>, with <span>&#92;(Q = &#92;sigma_w^2&#92;)</span>, <span>&#92;(R = &#92;sigma_v^2&#92;)</span>, and initial variance <span>&#92;(&#92;Sigma_{0|-1} = P_0&#92;)</span>. The Kalman gain at step <span>&#92;(k&#92;)</span >, using <span>&#92;(A = H = 1&#92;)</span>, is:
<span>&#92;[K_k = &#92;frac{&#92;Sigma_{k|k-1}}{&#92;Sigma_{k|k-1} + &#92;sigma_v^2},&#92;]</span>
the posterior error variance is:
<span>&#92;[&#92;Sigma_{k|k} = &#92;frac{&#92;sigma_v^2&#92;Sigma_{k|k-1}}{&#92;Sigma_{k|k-1}+&#92;sigma_v^2} = (1-K_k)&#92;Sigma_{k|k-1},&#92;]</span>
and the next prior error variance is:
<span>&#92;[&#92;Sigma_{k+1|k} = &#92;Sigma_{k|k} + &#92;sigma_w^2 = &#92;frac{&#92;sigma_v^2&#92;Sigma_{k|k-1}}{&#92;Sigma_{k|k-1}+&#92;sigma_v^2} + &#92;sigma_w^2.&#92;]</span>

The steady-state prior variance satisfies <span>&#92;(&#92;bar{&#92;Sigma} = &#92;frac{&#92;sigma_v^2&#92;bar{&#92;Sigma}}{&#92;bar{&#92;Sigma}+&#92;sigma_v^2} + &#92;sigma_w^2&#92;)</span>, a quadratic equation with positive solution
<span>&#92;[&#92;bar{&#92;Sigma} = &#92;frac{&#92;sigma_w^2 + &#92;sqrt{&#92;sigma_w^4 + 4&#92;sigma_w^2&#92;sigma_v^2}}{2}.&#92;]</span>

The estimate update is:
<span>&#92;[&#92;hat{X}_{k+1|k} = &#92;hat{X}_{k|k-1} + K_k(Y_k - &#92;hat{X}_{k|k-1}).&#92;]</span>

When <span>&#92;(&#92;sigma_w^2 = 0&#92;)</span> (no process noise), <span>&#92;(&#92;bar{&#92;Sigma} = 0&#92;)</span>: the random walk has no diffusion, so eventually we know the state exactly. When <span>&#92;(&#92;sigma_v^2 &#92;to &#92;infty&#92;)</span> (very noisy measurements), <span>&#92;(K_k &#92;to 0&#92;)</span>: we discard observations and predict by momentum alone.

---

# Expanded Treatment: Random Oscillations and Linear Systems

## Response of Linear Systems to Gaussian Input

The fundamental theorem for linear systems driven by Gaussian processes is: if the input is Gaussian, the output is Gaussian. This follows from the fact that any linear transformation of a Gaussian random variable (or vector, or process) produces a Gaussian result. For the oscillator
<span>&#92;[X(t) = g(t-t_0)x_0 + h(t-t_0)v_0 + &#92;int_{t_0}^t h(t-&#92;tau)f(&#92;tau)&#92;,d&#92;tau,&#92;]</span>
the output <span>&#92;(X(t)&#92;)</span> is a linear functional of the Gaussian input <span>&#92;(f&#92;)</span> and the Gaussian initial conditions <span>&#92;(x_0, v_0&#92;)</span>. Therefore <span>&#92;(X(t)&#92;)</span> is Gaussian for each <span>&#92;(t&#92;)</span>, and the joint distribution of <span>&#92;((X(t_1), &#92;ldots, X(t_n))&#92;)</span> is multivariate Gaussian.

**Mean and covariance of the response.** The mean <span>&#92;(&#92;mu_X(t)&#92;)</span> satisfies a deterministic version of the equation with <span>&#92;(f&#92;)</span> replaced by <span>&#92;(&#92;mu_f&#92;)</span>. The covariance <span>&#92;(C_{XX}(t,s)&#92;)</span> is determined by:
<span>&#92;[C_{XX}(t,s) = g(t-t_0)g(s-t_0)&#92;text{Var}(x_0) + h(t-t_0)h(s-t_0)&#92;text{Var}(v_0)&#92;]</span>
<span>&#92;[+ &#92;int&#92;!&#92;!&#92;int h(t-&#92;tau)h(s-&#92;sigma)C_{ff}(&#92;tau,&#92;sigma)&#92;,d&#92;tau&#92;,d&#92;sigma,&#92;]</span>
assuming initial conditions and forcing are uncorrelated.

**Stationarity of the response.** As the initial time <span>&#92;(t_0 &#92;to -&#92;infty&#92;)</span>, the transient terms involving <span>&#92;(g&#92;)</span> and <span>&#92;(h&#92;)</span> multiplied by initial conditions decay exponentially (since <span>&#92;(&#92;beta > 0&#92;)</span>), and the response converges to a WSS process. The stationary autocovariance
<span>&#92;[C_{XX}(&#92;tau) = 2&#92;pi&#92;Phi_0&#92;int_0^&#92;infty h(u)h(u+|&#92;tau|)&#92;,du&#92;]</span>
for white noise input, evaluated via the residue theorem, gives the explicit formula stated earlier.

## Connection to Spectral Analysis

For a WSS process observed in steady state, the PSD of the response is <span>&#92;(S_X(&#92;omega) = |H(&#92;omega)|^2 S_f(&#92;omega)&#92;)</span>. For white noise <span>&#92;(S_f(&#92;omega) = 2&#92;pi&#92;Phi_0&#92;)</span> (constant), the PSD of the response is
<span>&#92;[S_X(&#92;omega) = &#92;frac{2&#92;pi&#92;Phi_0}{(&#92;omega_0^2 - &#92;omega^2)^2 + 4&#92;beta^2&#92;omega_0^2&#92;omega^2}.&#92;]</span>

The variance is the integral of the PSD:
<span>&#92;[&#92;text{Var}(X) = &#92;int_{-&#92;infty}^&#92;infty S_X(&#92;omega)&#92;,d&#92;omega = &#92;frac{&#92;pi&#92;Phi_0}{2&#92;omega_0^3&#92;beta},&#92;]</span>
confirming the earlier calculation. The peak of the PSD occurs near the resonance <span>&#92;(&#92;omega = &#92;omega_d = &#92;omega_0&#92;sqrt{1-&#92;beta^2}&#92;)</span>, becoming sharper as <span>&#92;(&#92;beta &#92;to 0&#92;)</span>.

---

# Expanded Treatment: Filtering Theory

## The General Nonlinear Filter

For general (nonlinear, non-Gaussian) systems, the optimal filter is the conditional distribution <span>&#92;(&#92;pi_t(dx) = P(X_t &#92;in dx | Y_s, 0 &#92;le s &#92;le t)&#92;)</span>. The exact evolution of <span>&#92;(&#92;pi_t&#92;)</span> is given by the **Kushner–Stratonovich equation** (continuous time) or the **Bayes recursion** (discrete time). These are infinite-dimensional equations — they evolve probability densities rather than finite-dimensional sufficient statistics.

The Kalman filter's remarkable property is that for linear-Gaussian models, the conditional distribution <span>&#92;(&#92;pi_t&#92;)</span> remains Gaussian for all time, with mean and covariance satisfying the finite-dimensional Kalman filter equations. The Gaussian family is the only "finite-dimensional sufficient statistic" for this class of models.

## The Innovations Process in Continuous Time

For the continuous-time model <span>&#92;(dX = AX&#92;,dt + B&#92;,dW&#92;)</span>, <span>&#92;(dY = HX&#92;,dt + G&#92;,dV&#92;)</span>, the **innovations process** is defined as:
<span>&#92;[d&#92;nu_t = dY_t - H&#92;pi_t&#92;,dt,&#92;]</span>
where <span>&#92;(&#92;pi_t = E[X_t|Y_s, s &#92;le t]&#92;)</span> is the filter estimate. The Kalman–Bucy theorem states that <span>&#92;(&#92;nu_t&#92;)</span> is a Brownian motion with the same covariance as <span>&#92;(GG^*&#92;)</span> — it is the "new information" arriving per unit time that cannot be predicted from the past observations. The Kalman–Bucy filter can be written as:
<span>&#92;[d&#92;pi_t = A&#92;pi_t&#92;,dt + &#92;Sigma_t H^*(GG^*)^{-1}d&#92;nu_t,&#92;]</span>
a stochastic ODE driven by the innovations. The error covariance satisfies the deterministic Riccati equation; this is the deep fact making linear filtering tractable.

## Discrete-to-Continuous Passage

The derivation of the Kalman–Bucy filter from its discrete counterpart provides important insight. Discretizing <span>&#92;(dX = aX&#92;,dt + b&#92;,dW&#92;)</span> with time step <span>&#92;(&#92;Delta t&#92;)</span>:
<span>&#92;[X_{n+1} = (1+a&#92;Delta t)X_n + b&#92;sqrt{&#92;Delta t}W_{n+1},&#92;quad Y_{n+1} = hX_n&#92;Delta t + g&#92;sqrt{&#92;Delta t}V_{n+1}.&#92;]</span>

Applying the discrete Kalman filter and taking <span>&#92;(&#92;Delta t &#92;to 0&#92;)</span>:
<span>&#92;[&#92;frac{m_{n+1}-m_n}{&#92;Delta t} &#92;to &#92;dot{m},&#92;quad &#92;frac{&#92;gamma_{n+1}-&#92;gamma_n}{&#92;Delta t} &#92;to &#92;dot{&#92;gamma},&#92;]</span>
the recursions become ODEs. The Kalman gain <span>&#92;(K_k = (1+a&#92;Delta t)&#92;gamma_n h&#92;Delta t/(g^2&#92;Delta t + h^2&#92;gamma_n(&#92;Delta t)^2)&#92;)</span> scales as <span>&#92;(h&#92;gamma/g^2&#92;)</span> as <span>&#92;(&#92;Delta t &#92;to 0&#92;)</span>, giving the continuous-time gain <span>&#92;(h&#92;gamma/g^2&#92;)</span> in the innovation term <span>&#92;(d&#92;nu = dY - hm&#92;,dt&#92;)</span>. The Riccati equation for <span>&#92;(&#92;gamma&#92;)</span> follows similarly.

---

# Appendix: Key Formulas and Summary Tables

## Distributions Summary

| Distribution | PMF / PDF | Mean | Variance | MGF |
|---|---|---|---|---|
| Bernoulli<span>&#92;((p)&#92;)</span> | <span>&#92;(p^k(1-p)^{1-k}&#92;)</span> | <span>&#92;(p&#92;)</span> | <span>&#92;(p(1-p)&#92;)</span> | <span>&#92;(1-p+pe^t&#92;)</span> |
| Binomial<span>&#92;((n,p)&#92;)</span> | <span>&#92;(&#92;binom{n}{k}p^k(1-p)^{n-k}&#92;)</span> | <span>&#92;(np&#92;)</span> | <span>&#92;(np(1-p)&#92;)</span> | <span>&#92;((1-p+pe^t)^n&#92;)</span> |
| Geometric<span>&#92;((p)&#92;)</span> | <span>&#92;((1-p)^{k-1}p&#92;)</span> | <span>&#92;(1/p&#92;)</span> | <span>&#92;((1-p)/p^2&#92;)</span> | <span>&#92;(pe^t/(1-(1-p)e^t)&#92;)</span> |
| Poisson<span>&#92;((&#92;lambda)&#92;)</span> | <span>&#92;(e^{-&#92;lambda}&#92;lambda^k/k!&#92;)</span> | <span>&#92;(&#92;lambda&#92;)</span> | <span>&#92;(&#92;lambda&#92;)</span> | <span>&#92;(e^{&#92;lambda(e^t-1)}&#92;)</span> |
| Exponential<span>&#92;((&#92;lambda)&#92;)</span> | <span>&#92;(&#92;lambda e^{-&#92;lambda x}&#92;)</span> | <span>&#92;(1/&#92;lambda&#92;)</span> | <span>&#92;(1/&#92;lambda^2&#92;)</span> | <span>&#92;(&#92;lambda/(&#92;lambda-t)&#92;)</span> |
| Gaussian<span>&#92;((&#92;mu,&#92;sigma^2)&#92;)</span> | <span>&#92;(&#92;frac{1}{&#92;sqrt{2&#92;pi&#92;sigma^2}}e^{-(x-&#92;mu)^2/(2&#92;sigma^2)}&#92;)</span> | <span>&#92;(&#92;mu&#92;)</span> | <span>&#92;(&#92;sigma^2&#92;)</span> | <span>&#92;(e^{&#92;mu t + &#92;sigma^2 t^2/2}&#92;)</span> |

## Convergence Relations

<span>&#92;[&#92;text{a.s. convergence} &#92;Rightarrow &#92;text{convergence in probability} &#92;Rightarrow &#92;text{convergence in distribution}&#92;]</span>
<span>&#92;[&#92;text{m.s. convergence} &#92;Rightarrow &#92;text{convergence in probability} &#92;Rightarrow &#92;text{convergence in distribution}&#92;]</span>

No other implications hold in general, but: (i) if <span>&#92;(X_n &#92;xrightarrow{p} X&#92;)</span>, there exists a subsequence converging a.s.; (ii) if <span>&#92;(X_n &#92;xrightarrow{d} c&#92;)</span> (constant), then <span>&#92;(X_n &#92;xrightarrow{p} c&#92;)</span>.

## Kalman Filter Summary

**State model:** <span>&#92;(X_{k+1} = A_k X_k + W_k&#92;)</span>, <span>&#92;(E[W_k]=0&#92;)</span>, <span>&#92;(&#92;text{Cov}(W_k)=Q_k&#92;)</span>.

**Observation model:** <span>&#92;(Y_k = H_k X_k + V_k&#92;)</span>, <span>&#92;(E[V_k]=0&#92;)</span>, <span>&#92;(&#92;text{Cov}(V_k)=R_k&#92;)</span>.

**Information update:**
<span>&#92;[&#92;hat{X}_{k|k} = &#92;hat{X}_{k|k-1} + &#92;Sigma_{k|k-1}H_k^T(H_k&#92;Sigma_{k|k-1}H_k^T+R_k)^{-1}(Y_k - H_k&#92;hat{X}_{k|k-1}),&#92;]</span>
<span>&#92;[&#92;Sigma_{k|k} = &#92;Sigma_{k|k-1} - &#92;Sigma_{k|k-1}H_k^T(H_k&#92;Sigma_{k|k-1}H_k^T+R_k)^{-1}H_k&#92;Sigma_{k|k-1}.&#92;]</span>

**Time update:**
<span>&#92;[&#92;hat{X}_{k+1|k} = A_k&#92;hat{X}_{k|k},&#92;quad &#92;Sigma_{k+1|k} = A_k&#92;Sigma_{k|k}A_k^T + Q_k.&#92;]</span>

**Kalman gain (combined):**
<span>&#92;[K_k = A_k&#92;Sigma_{k|k-1}H_k^T(H_k&#92;Sigma_{k|k-1}H_k^T+R_k)^{-1}.&#92;]</span>

**Combined recursion for prior:**
<span>&#92;[&#92;hat{X}_{k+1|k} = A_k&#92;hat{X}_{k|k-1} + K_k(Y_k - H_k&#92;hat{X}_{k|k-1}).&#92;]</span>

## Wiener Process Properties Summary

A standard Wiener process <span>&#92;(W_t&#92;)</span> satisfies: (1) <span>&#92;(W_0=0&#92;)</span> a.s.; (2) <span>&#92;(W_t &#92;sim N(0,t)&#92;)</span>; (3) <span>&#92;(&#92;text{Cov}(W_s,W_t) = &#92;min(s,t)&#92;)</span>; (4) independent increments; (5) Gaussian process; (6) Markov property; (7) martingale; (8) continuous but nowhere differentiable paths; (9) quadratic variation <span>&#92;([W]_t = t&#92;)</span>.


---

# Lecture 25–26: ODE Methods — Supplement for Stochastic Calculus

The study of stochastic differential equations requires a solid foundation in ordinary differential equations (ODEs), particularly first-order linear equations and certain nonlinear equations that arise naturally in filtering and control theory. This supplement develops these tools systematically, drawing on the methods taught in the final lecture block of the course.

## Standard Form and Integrating Factors

A first-order linear ODE for an unknown function <span>&#92;(y(x)&#92;)</span> is any equation that can be written in the standard form
<span>&#92;[&#92;frac{dy}{dx} + P(x)&#92;,y = Q(x),&#92;]</span>
where <span>&#92;(P&#92;)</span> and <span>&#92;(Q&#92;)</span> are given functions of the independent variable <span>&#92;(x&#92;)</span>. The classical method of integrating factors, due to Euler, reduces this equation to exact form by multiplying through by a carefully chosen function <span>&#92;(&#92;mu(x)&#92;)</span>. The result of the multiplication is
<span>&#92;[&#92;mu(x)&#92;frac{dy}{dx} + &#92;mu(x)P(x)&#92;,y = &#92;mu(x)Q(x).&#92;]</span>

The key insight is to require that the left-hand side be an exact derivative of the product <span>&#92;(&#92;mu(x)y(x)&#92;)</span>. Expanding by the product rule,
<span>&#92;[&#92;frac{d}{dx}[&#92;mu(x)y(x)] = &#92;mu(x)&#92;frac{dy}{dx} + y(x)&#92;frac{d&#92;mu}{dx}.&#92;]</span>
Comparing with the multiplied equation, exactness requires <span>&#92;(&#92;mu(x)P(x) = &#92;mu'(x)&#92;)</span>, which is the separable ODE
<span>&#92;[&#92;frac{1}{&#92;mu}&#92;frac{d&#92;mu}{dx} = P(x)&#92;quad&#92;Rightarrow&#92;quad &#92;mu(x) = e^{&#92;int P(x)&#92;,dx}.&#92;]</span>
Any choice of constant of integration (equivalently, any nonzero constant multiple of <span>&#92;(&#92;mu&#92;)</span>) works; convention takes the constant to be one. With this integrating factor, the equation becomes
<span>&#92;[&#92;frac{d}{dx}[&#92;mu(x)y(x)] = &#92;mu(x)Q(x),&#92;]</span>
which integrates directly to
<span>&#92;[&#92;mu(x)y(x) = &#92;int &#92;mu(x)Q(x)&#92;,dx + C,&#92;]</span>
and thus
<span>&#92;[y(x) = e^{-&#92;int P(x)&#92;,dx}&#92;!&#92;left(C + &#92;int Q(x)e^{&#92;int P(x)&#92;,dx}&#92;,dx&#92;right).&#92;]</span>
This formula solves every first-order linear ODE to within quadrature — the only remaining task is evaluating the integral, which may or may not admit a closed form.

The connection to stochastic systems is immediate: the Lyapunov equation for the error covariance of the Kalman filter, and the matrix Riccati equation governing the continuous-time filter, are both differential equations of this general structure in a matrix-valued setting.

## Variation of Parameters for First-Order Equations

The method of variation of parameters provides an alternative derivation of the same solution formula and is the direct ancestor of the stochastic variation-of-parameters used in random oscillation analysis. The starting point is the associated homogeneous equation
<span>&#92;[y' + P(x)y = 0,&#92;]</span>
which factors as a separable equation with solution
<span>&#92;[y_h(x) = Ce^{-&#92;int P(x)&#92;,dx} =: C&#92;varphi(x).&#92;]</span>
Here <span>&#92;(&#92;varphi(x) = e^{-&#92;int P(x)&#92;,dx}&#92;)</span> is the fundamental solution of the homogeneous equation. For the non-homogeneous equation, one seeks a particular solution of the form <span>&#92;(&#92;varphi_p(x) = v(x)&#92;varphi(x)&#92;)</span>, where the "constant" <span>&#92;(C&#92;)</span> has been allowed to vary, hence the name. Substituting into the non-homogeneous equation,
<span>&#92;[v'(x)&#92;varphi(x) + v(x)&#92;varphi'(x) + P(x)v(x)&#92;varphi(x) = Q(x).&#92;]</span>
Because <span>&#92;(&#92;varphi&#92;)</span> satisfies the homogeneous equation, <span>&#92;(&#92;varphi'(x) + P(x)&#92;varphi(x) = 0&#92;)</span>, so the middle two terms combine to zero and one is left with
<span>&#92;[v'(x)&#92;varphi(x) = Q(x)&#92;quad&#92;Rightarrow&#92;quad v(x) = &#92;int &#92;varphi^{-1}(x)Q(x)&#92;,dx + C.&#92;]</span>
The general solution <span>&#92;(y = v(x)&#92;varphi(x)&#92;)</span> then recovers the integrating factor formula exactly. In the stochastic setting, one applies an analogous idea: the response of a linear dynamical system to random forcing is expressed as a convolution integral (variation of parameters), and the statistics of the response (mean, covariance) are then computed from the statistics of the forcing.

## Bernoulli Equations

A Bernoulli equation is a nonlinear first-order ODE of the form
<span>&#92;[&#92;frac{dy}{dx} + P(x)y = Q(x)y^&#92;alpha,&#92;quad &#92;alpha&#92;in&#92;mathbb{R},&#92;]</span>
named after Jacob Bernoulli who studied the case <span>&#92;(&#92;alpha = 2&#92;)</span> in 1695. For <span>&#92;(&#92;alpha = 0&#92;)</span> or <span>&#92;(&#92;alpha = 1&#92;)</span> the equation is linear and the preceding methods apply directly. For other values of <span>&#92;(&#92;alpha&#92;)</span>, the nonlinearity is removed by a change of variable. Observing that <span>&#92;(y = 0&#92;)</span> is a trivial solution (for <span>&#92;(&#92;alpha &#92;neq 0&#92;)</span>), the non-trivial solutions satisfy dividing by <span>&#92;(y^&#92;alpha&#92;)</span>:
<span>&#92;[y^{-&#92;alpha}&#92;frac{dy}{dx} + P(x)y^{1-&#92;alpha} = Q(x).&#92;]</span>
Setting <span>&#92;(v = y^{1-&#92;alpha}&#92;)</span>, the chain rule gives <span>&#92;(&#92;frac{dv}{dx} = (1-&#92;alpha)y^{-&#92;alpha}&#92;frac{dy}{dx}&#92;)</span>, so the equation transforms to
<span>&#92;[&#92;frac{dv}{dx} + (1-&#92;alpha)P(x)&#92;,v = (1-&#92;alpha)Q(x),&#92;]</span>
which is a linear first-order ODE for <span>&#92;(v&#92;)</span> and is solved by integrating factors.

**Example.** Consider <span>&#92;(&#92;frac{dy}{dx} - 5y = -&#92;frac{5}{2}xy^3&#92;)</span>, a Bernoulli equation with <span>&#92;(&#92;alpha = 3&#92;)</span>. Setting <span>&#92;(v = y^{-2}&#92;)</span> yields <span>&#92;(&#92;frac{dv}{dx} + 10v = 5x&#92;)</span>. The integrating factor is <span>&#92;(&#92;mu = e^{10x}&#92;)</span>, and the solution is
<span>&#92;[v(x) = &#92;frac{x}{2} - &#92;frac{1}{20} + Ce^{-10x},&#92;]</span>
so <span>&#92;(y(x) = &#92;left(&#92;frac{x}{2} - &#92;frac{1}{20} + Ce^{-10x}&#92;right)^{-1/2}&#92;)</span>. Note that the solution <span>&#92;(y = 0&#92;)</span> is lost in the division step.

The Bernoulli equation appears in filtering theory when the error covariance of a scalar system evolves according to a Riccati equation: after a suitable substitution, the scalar Riccati equation for <span>&#92;(&#92;gamma&#92;)</span> becomes Bernoulli with <span>&#92;(&#92;alpha = 2&#92;)</span>, which in turn reduces to a linear equation for <span>&#92;(&#92;gamma^{-1}&#92;)</span>.

## Riccati Equations

The Riccati equation is the nonlinear first-order ODE
<span>&#92;[&#92;frac{dy}{dx} = P(x) + Q(x)y + R(x)y^2,&#92;]</span>
where the right-hand side is quadratic in <span>&#92;(y&#92;)</span>. The constant term <span>&#92;(P(x)&#92;)</span> makes this a non-homogeneous equation, so <span>&#92;(y = 0&#92;)</span> is generally not a solution. In general, Riccati equations cannot be solved in closed form without additional information. However, if one particular solution <span>&#92;(y_1(x)&#92;)</span> is known, the general solution can be found by the substitution <span>&#92;(y = y_1 + v&#92;)</span>, which transforms the Riccati equation into a Bernoulli equation for <span>&#92;(v&#92;)</span>. Indeed, since <span>&#92;(y_1' = P + Qy_1 + Ry_1^2&#92;)</span>, the equation for <span>&#92;(v = y - y_1&#92;)</span> is
<span>&#92;[v' = Q(x)v + R(x)v^2 + 2R(x)y_1(x)v = [Q(x) + 2R(x)y_1(x)]v + R(x)v^2,&#92;]</span>
which is Bernoulli with <span>&#92;(&#92;alpha = 2&#92;)</span>. Setting <span>&#92;(w = v^{-1}&#92;)</span> gives the linear equation <span>&#92;(w' - [Q(x) + 2R(x)y_1(x)]w = -R(x)&#92;)</span>.

**Example.** Consider <span>&#92;(&#92;frac{dy}{dx} = 2 - 2xy + y^2&#92;)</span>. One can verify that <span>&#92;(y_1(x) = 2x&#92;)</span> is a particular solution: <span>&#92;(2 = 2 - (2x)^2 + (2x)^2 = 2&#92;)</span>. Setting <span>&#92;(y = 2x + v&#92;)</span> gives <span>&#92;(v' - 2xv = v^2&#92;)</span>, a Bernoulli equation. With <span>&#92;(w = v^{-1}&#92;)</span>, this becomes <span>&#92;(w' + 2xw = -1&#92;)</span>, which is linear with integrating factor <span>&#92;(e^{x^2}&#92;)</span>. Hence
<span>&#92;[e^{x^2}w = -&#92;int e^{x^2}&#92;,dx + C =: -&#92;varphi(x) + C,&#92;]</span>
where <span>&#92;(&#92;varphi(x) = &#92;int_0^x e^{t^2}&#92;,dt&#92;)</span> is related to the error function. Reverting through <span>&#92;(v = w^{-1}&#92;)</span> and <span>&#92;(y = 2x + v&#92;)</span> gives the general solution
<span>&#92;[y(x) = 2x + &#92;frac{e^{x^2}}{C - &#92;varphi(x)}.&#92;]</span>

The Riccati equation is central to filtering and control. The scalar continuous-time Riccati equation
<span>&#92;[&#92;dot{&#92;gamma} = 2a&#92;gamma + b^2 - &#92;frac{h^2}{g^2}&#92;gamma^2&#92;]</span>
describes the evolution of the estimation error variance in the Kalman-Bucy filter for the one-dimensional system. Here <span>&#92;(a&#92;)</span> is the drift coefficient, <span>&#92;(b^2&#92;)</span> is the state noise intensity, <span>&#92;(h&#92;)</span> is the observation coefficient, and <span>&#92;(g^2&#92;)</span> is the observation noise intensity. At steady state <span>&#92;(&#92;dot{&#92;gamma} = 0&#92;)</span>, the positive root of this quadratic gives the asymptotic error variance <span>&#92;(&#92;gamma^* = &#92;frac{g^2}{h^2}&#92;left(a + &#92;sqrt{a^2 + b^2h^2/g^2}&#92;right)&#92;)</span>.

---

# Tutorial Solutions and Problem-Solving Strategies

## Tutorial 2: Transformations of Random Variables

One of the most fundamental operations in probability is computing the distribution of <span>&#92;(Y = g(X)&#92;)</span> when the distribution of <span>&#92;(X&#92;)</span> is known. For a monotone differentiable function <span>&#92;(g&#92;)</span>, the PDF of <span>&#92;(Y&#92;)</span> is
<span>&#92;[f_Y(y) = f_X(g^{-1}(y))&#92;left|&#92;frac{d}{dy}g^{-1}(y)&#92;right|,&#92;]</span>
which is the Jacobian formula. The absolute value accounts for monotone decreasing transformations.

**Linear scaling.** If <span>&#92;(Y = aX + b&#92;)</span> with <span>&#92;(a &#92;neq 0&#92;)</span>, then <span>&#92;(x = (y-b)/a&#92;)</span> and <span>&#92;(|dx/dy| = 1/|a|&#92;)</span>, giving
<span>&#92;[f_Y(y) = &#92;frac{1}{|a|}f_X&#92;!&#92;left(&#92;frac{y-b}{a}&#92;right).&#92;]</span>
Applying this to <span>&#92;(X &#92;sim N(&#92;mu, &#92;sigma^2)&#92;)</span> with <span>&#92;(Y = (X-&#92;mu)/&#92;sigma&#92;)</span> yields <span>&#92;(f_Y(y) = &#92;frac{1}{&#92;sqrt{2&#92;pi}}e^{-y^2/2}&#92;)</span>, confirming that standardization produces a standard normal. More generally, any affine function of a Gaussian is Gaussian: <span>&#92;(aX + b &#92;sim N(a&#92;mu + b, a^2&#92;sigma^2)&#92;)</span>.

**Non-monotone transformations.** When <span>&#92;(g&#92;)</span> is not monotone, one must sum contributions from all preimages:
<span>&#92;[f_Y(y) = &#92;sum_{x:&#92;, g(x)=y} &#92;frac{f_X(x)}{|g'(x)|}.&#92;]</span>
For example, if <span>&#92;(X &#92;sim N(0,1)&#92;)</span> and <span>&#92;(Y = X^2&#92;)</span>, both <span>&#92;(x = &#92;pm&#92;sqrt{y}&#92;)</span> contribute, giving
<span>&#92;[f_Y(y) = &#92;frac{1}{&#92;sqrt{2&#92;pi y}}e^{-y/2},&#92;quad y > 0,&#92;]</span>
which is the chi-squared distribution with one degree of freedom, also written <span>&#92;(&#92;chi^2_1&#92;)</span>.

## Tutorial 3: Conditional Expectation — Law of Iterated Expectations

The law of iterated expectations (also called the tower property) states that for random variables <span>&#92;(X&#92;)</span>, <span>&#92;(Y&#92;)</span> on the same probability space,
<span>&#92;[E[X] = E[E[X &#92;mid Y]],&#92;]</span>
where the outer expectation on the right is with respect to <span>&#92;(Y&#92;)</span>. This result follows directly from the definition of conditional expectation by integration:
<span>&#92;[E[E[X|Y]] = &#92;int_{&#92;mathcal{Y}} E[X|Y=y]&#92;,f_Y(y)&#92;,dy = &#92;int_{&#92;mathcal{Y}}&#92;!&#92;int_{&#92;mathcal{X}} x&#92;,f_{X|Y}(x|y)&#92;,dx&#92;,f_Y(y)&#92;,dy&#92;]</span>
<span>&#92;[= &#92;int_{&#92;mathcal{X}}&#92;int_{&#92;mathcal{Y}} x&#92;,f_{X,Y}(x,y)&#92;,dy&#92;,dx = &#92;int_{&#92;mathcal{X}} x&#92;,f_X(x)&#92;,dx = E[X].&#92;]</span>
The interchange of integration order is justified by Fubini's theorem whenever <span>&#92;(E[|X|] < &#92;infty&#92;)</span>.

More generally, for any sub-<span>&#92;(&#92;sigma&#92;)</span>-algebra <span>&#92;(&#92;mathcal{G} &#92;subseteq &#92;mathcal{H} &#92;subseteq &#92;mathcal{F}&#92;)</span>, the tower property reads
<span>&#92;[E[E[X|&#92;mathcal{H}]|&#92;mathcal{G}] = E[X|&#92;mathcal{G}].&#92;]</span>
Conditioning on a coarser <span>&#92;(&#92;sigma&#92;)</span>-algebra (less information) dominates: knowing less about <span>&#92;(Y&#92;)</span> washes out the finer conditioning.

The law of total variance is the variance analogue:
<span>&#92;[&#92;operatorname{Var}(X) = E[&#92;operatorname{Var}(X|Y)] + &#92;operatorname{Var}(E[X|Y]).&#92;]</span>
The first term, <span>&#92;(E[&#92;operatorname{Var}(X|Y)]&#92;)</span>, is the expected within-group variance (residual uncertainty after observing <span>&#92;(Y&#92;)</span>). The second term, <span>&#92;(&#92;operatorname{Var}(E[X|Y])&#92;)</span>, is the between-group variance (the variance of the conditional mean). This decomposition underlies the MMSE variance identity <span>&#92;(&#92;operatorname{Var}(X) = &#92;operatorname{Var}(&#92;hat{X}) + &#92;operatorname{Var}(&#92;tilde{X})&#92;)</span> discussed in the MMSE section.

## Tutorial 5: MMSE Estimation — Orthogonality and Error Analysis

Suppose one observes <span>&#92;(Y = X + W&#92;)</span> where <span>&#92;(X &#92;sim N(0,1)&#92;)</span> and <span>&#92;(W &#92;sim N(0,&#92;sigma_W^2)&#92;)</span> are independent, and wants to estimate <span>&#92;(X&#92;)</span> from <span>&#92;(Y&#92;)</span>. The MMSE estimator is <span>&#92;(E[X|Y]&#92;)</span>. By the Gaussian joint distribution, this conditional expectation is linear:
<span>&#92;[&#92;hat{X} = E[X|Y] = &#92;frac{&#92;operatorname{Cov}(X,Y)}{&#92;operatorname{Var}(Y)}Y = &#92;frac{1}{1+&#92;sigma_W^2}Y.&#92;]</span>
The signal-to-noise ratio <span>&#92;(&#92;sigma_X^2/&#92;sigma_W^2 = 1/&#92;sigma_W^2&#92;)</span> determines how much the estimator trusts the observation: when <span>&#92;(&#92;sigma_W^2 &#92;to 0&#92;)</span> (very clean observations), <span>&#92;(&#92;hat{X} &#92;to Y&#92;)</span>; when <span>&#92;(&#92;sigma_W^2 &#92;to &#92;infty&#92;)</span> (very noisy observations), <span>&#92;(&#92;hat{X} &#92;to 0 = E[X]&#92;)</span>.

The orthogonality principle states that the estimation error <span>&#92;(&#92;tilde{X} = X - &#92;hat{X}&#92;)</span> is uncorrelated with any function of the observation:
<span>&#92;[E[&#92;tilde{X}&#92;,h(Y)] = 0 &#92;quad&#92;text{for all measurable } h.&#92;]</span>
In particular, <span>&#92;(E[&#92;tilde{X} &#92;cdot Y] = 0&#92;)</span>, which one verifies: <span>&#92;(E[(X - &#92;hat{X})Y] = E[XY] - E[&#92;hat{X}Y]&#92;)</span>. Since <span>&#92;(&#92;hat{X} = &#92;alpha Y&#92;)</span> with <span>&#92;(&#92;alpha = 1/(1+&#92;sigma_W^2)&#92;)</span>, this becomes <span>&#92;(E[XY] - &#92;alpha E[Y^2] = 1 - &#92;alpha(1+&#92;sigma_W^2) = 0&#92;)</span>. The MMSE is
<span>&#92;[&#92;text{MMSE} = E[&#92;tilde{X}^2] = &#92;operatorname{Var}(X|Y) = &#92;frac{&#92;sigma_W^2}{1+&#92;sigma_W^2},&#92;]</span>
which is also equal to <span>&#92;(&#92;sigma_X^2 - &#92;sigma_{&#92;hat{X}}^2 = 1 - &#92;frac{1}{(1+&#92;sigma_W^2)}&#92;)</span>, confirming the variance decomposition identity.

## Tutorial 6: Standard Brownian Motion — Covariance Calculation

The covariance calculation <span>&#92;(&#92;operatorname{Cov}(W_s, W_t) = &#92;min(s,t)&#92;)</span> is a fundamental result that follows directly from the independent increment property. For <span>&#92;(s &#92;leq t&#92;)</span>:
<span>&#92;[E[W_sW_t] = E[W_s(W_s + (W_t - W_s))] = E[W_s^2] + E[W_s(W_t - W_s)].&#92;]</span>
The second term vanishes because <span>&#92;(W_s&#92;)</span> is <span>&#92;(&#92;mathcal{F}_s&#92;)</span>-measurable and <span>&#92;(W_t - W_s&#92;)</span> is independent of <span>&#92;(&#92;mathcal{F}_s&#92;)</span> (independent increments), with <span>&#92;(E[W_t - W_s] = 0&#92;)</span>. Therefore <span>&#92;(E[W_sW_t] = E[W_s^2] = s&#92;)</span>, and since <span>&#92;(E[W_s] = E[W_t] = 0&#92;)</span>, we have <span>&#92;(&#92;operatorname{Cov}(W_s,W_t) = s = &#92;min(s,t)&#92;)</span> for <span>&#92;(s &#92;leq t&#92;)</span>.

Geometric Brownian motion <span>&#92;(S_t = S_0 e^{(&#92;mu - &#92;sigma^2/2)t + &#92;sigma W_t}&#92;)</span> models stock prices and is the foundation of the Black-Scholes theory. While <span>&#92;(W_t&#92;)</span> is Gaussian, <span>&#92;(S_t&#92;)</span> is log-normally distributed: <span>&#92;(&#92;log(S_t/S_0) &#92;sim N((&#92;mu - &#92;sigma^2/2)t, &#92;sigma^2 t)&#92;)</span>. The parameter <span>&#92;(&#92;mu&#92;)</span> is the drift rate and <span>&#92;(&#92;sigma&#92;)</span> is the volatility. The shift <span>&#92;(-&#92;sigma^2/2&#92;)</span> in the exponent is the Itô correction that ensures <span>&#92;(E[S_t] = S_0 e^{&#92;mu t}&#92;)</span>; without this correction, the process would not be a martingale when <span>&#92;(&#92;mu = 0&#92;)</span>.

## Tutorial 7: Markov Chain Computations

For a two-state Markov chain with states <span>&#92;(&#92;{1, 2&#92;}&#92;)</span> and transition matrix
<span>&#92;[P = &#92;begin{pmatrix} 1-p & p &#92;&#92; q & 1-q &#92;end{pmatrix},&#92;]</span>
the <span>&#92;(n&#92;)</span>-step transition probabilities can be computed by diagonalizing <span>&#92;(P&#92;)</span>. The eigenvalues of <span>&#92;(P&#92;)</span> are <span>&#92;(&#92;lambda_1 = 1&#92;)</span> and <span>&#92;(&#92;lambda_2 = 1 - p - q&#92;)</span>. Provided <span>&#92;(p + q &#92;neq 0&#92;)</span>, the matrix power is
<span>&#92;[P^n = &#92;frac{1}{p+q}&#92;begin{pmatrix} q & p &#92;&#92; q & p &#92;end{pmatrix} + &#92;frac{(1-p-q)^n}{p+q}&#92;begin{pmatrix} p & -p &#92;&#92; -q & q &#92;end{pmatrix}.&#92;]</span>
As <span>&#92;(n &#92;to &#92;infty&#92;)</span>, since <span>&#92;(|1-p-q| < 1&#92;)</span> when <span>&#92;(0 < p,q < 1&#92;)</span>, the second term vanishes and every row of <span>&#92;(P^n&#92;)</span> converges to the stationary distribution <span>&#92;(&#92;pi = (q/(p+q),&#92;; p/(p+q))&#92;)</span>. This confirms that the chain is ergodic and that the initial condition is forgotten.

The stationary distribution can also be found by solving <span>&#92;(&#92;pi P = &#92;pi&#92;)</span> subject to <span>&#92;(&#92;pi_1 + &#92;pi_2 = 1&#92;)</span>:
<span>&#92;[&#92;pi_1(1-p) + &#92;pi_2 q = &#92;pi_1&#92;quad&#92;Rightarrow&#92;quad &#92;pi_1 p = &#92;pi_2 q,&#92;]</span>
giving <span>&#92;(&#92;pi_1/&#92;pi_2 = q/p&#92;)</span> and therefore <span>&#92;(&#92;pi_1 = q/(p+q)&#92;)</span>, <span>&#92;(&#92;pi_2 = p/(p+q)&#92;)</span>.

## Tutorial 8: Kalman Filter — AR(1) Signal Example

Consider an AR(1) signal process <span>&#92;(X_{k+1} = aX_k + W_k&#92;)</span> with <span>&#92;(|a| < 1&#92;)</span>, <span>&#92;(W_k &#92;sim N(0, Q)&#92;)</span> i.i.d., observed as <span>&#92;(Y_k = X_k + V_k&#92;)</span> with <span>&#92;(V_k &#92;sim N(0, R)&#92;)</span> i.i.d. and independent of <span>&#92;(W_k&#92;)</span>. This is the canonical example for the scalar Kalman filter.

The stationary variance of <span>&#92;(X_k&#92;)</span> satisfies <span>&#92;(&#92;sigma_X^2 = a^2&#92;sigma_X^2 + Q&#92;)</span>, giving <span>&#92;(&#92;sigma_X^2 = Q/(1-a^2)&#92;)</span>. The steady-state prior error variance <span>&#92;(&#92;gamma_&#92;infty&#92;)</span> satisfies the DARE
<span>&#92;[&#92;gamma_&#92;infty = a^2&#92;left(&#92;gamma_&#92;infty - &#92;frac{&#92;gamma_&#92;infty^2}{&#92;gamma_&#92;infty + R}&#92;right) + Q = a^2&#92;frac{R&#92;gamma_&#92;infty}{&#92;gamma_&#92;infty + R} + Q.&#92;]</span>
Rearranging, <span>&#92;(&#92;gamma_&#92;infty(&#92;gamma_&#92;infty + R)(1 - a^2) = Q(&#92;gamma_&#92;infty + R) + (a^2 - 1)R&#92;gamma_&#92;infty&#92;)</span>... after algebra the positive root is
<span>&#92;[&#92;gamma_&#92;infty = &#92;frac{(R(1-a^2)+Q) + &#92;sqrt{(R(1-a^2)+Q)^2 + 4a^2QR}}{2a^2} &#92;cdot &#92;frac{a^2}{1}&#92;]</span>
or more cleanly for the scalar case, by treating the DARE directly as a quadratic. The steady-state Kalman gain is <span>&#92;(K_&#92;infty = a&#92;gamma_&#92;infty/(&#92;gamma_&#92;infty + R)&#92;)</span>.

When the signal variance is large relative to noise (<span>&#92;(&#92;sigma_X^2 &#92;gg R&#92;)</span>), the filter trusts the observations strongly: <span>&#92;(K_&#92;infty &#92;approx a&#92;)</span>. When observations are very noisy (<span>&#92;(R &#92;gg &#92;sigma_X^2&#92;)</span>), the filter weights the prior prediction more heavily: <span>&#92;(K_&#92;infty &#92;approx aQ/R &#92;approx 0&#92;)</span>.

---

# Stochastic Processes: Additional Topics

## Power Spectral Density and Wiener–Khinchin Theorem

For a wide-sense stationary process <span>&#92;(X(t)&#92;)</span> with autocorrelation function <span>&#92;(R_{XX}(&#92;tau) = E[X(t+&#92;tau)X(t)]&#92;)</span>, the power spectral density (PSD) is defined as the Fourier transform
<span>&#92;[S_{XX}(&#92;omega) = &#92;int_{-&#92;infty}^{&#92;infty} R_{XX}(&#92;tau)&#92;,e^{-i&#92;omega&#92;tau}&#92;,d&#92;tau,&#92;]</span>
provided the integral converges. The Wiener–Khinchin theorem guarantees that <span>&#92;(S_{XX}(&#92;omega) &#92;geq 0&#92;)</span> for all <span>&#92;(&#92;omega&#92;)</span> and that <span>&#92;(R_{XX}(&#92;tau)&#92;)</span> is recovered by the inverse transform:
<span>&#92;[R_{XX}(&#92;tau) = &#92;frac{1}{2&#92;pi}&#92;int_{-&#92;infty}^{&#92;infty} S_{XX}(&#92;omega)&#92;,e^{i&#92;omega&#92;tau}&#92;,d&#92;omega.&#92;]</span>
Setting <span>&#92;(&#92;tau = 0&#92;)</span> gives the total power: <span>&#92;(E[X(t)^2] = R_{XX}(0) = &#92;frac{1}{2&#92;pi}&#92;int_{-&#92;infty}^{&#92;infty} S_{XX}(&#92;omega)&#92;,d&#92;omega&#92;)</span>, showing that the PSD describes the distribution of power across frequencies.

**White noise.** Ideal white noise has the flat spectrum <span>&#92;(S_{&#92;xi&#92;xi}(&#92;omega) = &#92;Phi_0&#92;)</span> (constant for all <span>&#92;(&#92;omega&#92;)</span>), corresponding to the autocorrelation <span>&#92;(R_{&#92;xi&#92;xi}(&#92;tau) = &#92;Phi_0&#92;delta(&#92;tau)&#92;)</span>. Physical white noise approximates this spectrum over a finite bandwidth. The formal derivative <span>&#92;(&#92;xi(t) = &#92;dot{W}_t&#92;)</span> of Brownian motion has this flat spectrum, which is why it is called white noise — by analogy with white light containing all frequencies equally.

**Rational spectra and linear filtering.** If white noise <span>&#92;(&#92;xi(t)&#92;)</span> is passed through a linear time-invariant filter with transfer function <span>&#92;(H(i&#92;omega)&#92;)</span>, the output PSD is
<span>&#92;[S_{YY}(&#92;omega) = |H(i&#92;omega)|^2 S_{&#92;xi&#92;xi}(&#92;omega) = &#92;Phi_0|H(i&#92;omega)|^2.&#92;]</span>
For the damped oscillator system <span>&#92;(&#92;ddot{X} + 2&#92;beta&#92;omega_0&#92;dot{X} + &#92;omega_0^2 X = &#92;xi(t)&#92;)</span>, the transfer function is
<span>&#92;[H(i&#92;omega) = &#92;frac{1}{&#92;omega_0^2 - &#92;omega^2 + 2i&#92;beta&#92;omega_0&#92;omega},&#92;]</span>
and the PSD of the response is
<span>&#92;[S_{XX}(&#92;omega) = &#92;frac{&#92;Phi_0}{(&#92;omega_0^2-&#92;omega^2)^2 + 4&#92;beta^2&#92;omega_0^2&#92;omega^2}.&#92;]</span>
Integrating this over all frequencies and using the residue theorem yields the total mean square response, which agrees with the stationary variance <span>&#92;(&#92;pi&#92;Phi_0/(2&#92;omega_0^3&#92;beta)&#92;)</span> derived by directly solving the Lyapunov equation.

## Ergodicity and Time Averages

A stationary process is ergodic (in the mean) if time averages converge to ensemble averages:
<span>&#92;[&#92;bar{X}_T := &#92;frac{1}{T}&#92;int_0^T X(t)&#92;,dt &#92;xrightarrow{m.s.} E[X(t)] &#92;quad&#92;text{as } T &#92;to &#92;infty.&#92;]</span>
A sufficient condition is that <span>&#92;(R_{XX}(&#92;tau) &#92;to 0&#92;)</span> as <span>&#92;(|&#92;tau| &#92;to &#92;infty&#92;)</span> (the correlations decay). Ergodicity is crucial for applications: it justifies estimating statistical properties from a single long realization of the process.

For Gaussian processes with rational PSD (such as the output of a linear system driven by white noise), ergodicity holds under mild conditions. In particular, all the processes arising in the Kalman filter context — Gaussian with rational spectra — are ergodic, meaning the stationary distribution can be approached through simulation of a single trajectory.

## The Chapman-Kolmogorov Equation in Detail

The Chapman-Kolmogorov (CK) equation is the fundamental consistency condition for Markov processes. For a time-homogeneous Markov chain with <span>&#92;(n&#92;)</span>-step transition matrix <span>&#92;(P^{(n)}&#92;)</span>, the CK equation reads
<span>&#92;[P^{(m+n)} = P^{(m)}P^{(n)},&#92;]</span>
which expresses the semigroup property: to go from state <span>&#92;(i&#92;)</span> to state <span>&#92;(j&#92;)</span> in <span>&#92;(m+n&#92;)</span> steps, one passes through some intermediate state <span>&#92;(k&#92;)</span> after <span>&#92;(m&#92;)</span> steps. For continuous-state Markov processes with transition density <span>&#92;(p(t,x;s,y) = P(X_s &#92;in dy &#92;mid X_t = x)/dy&#92;)</span> (for <span>&#92;(s > t&#92;)</span>), the CK equation is the integral identity
<span>&#92;[p(t,x;u,z) = &#92;int p(t,x;s,y)&#92;,p(s,y;u,z)&#92;,dy,&#92;quad t < s < u.&#92;]</span>
The differential form of the CK equation (as <span>&#92;(u - s &#92;to 0&#92;)</span>) yields the Fokker-Planck equation (also called the Kolmogorov forward equation), which governs the evolution of the transition density:
<span>&#92;[&#92;frac{&#92;partial p}{&#92;partial u} = -&#92;frac{&#92;partial}{&#92;partial z}[a(z)p] + &#92;frac{1}{2}&#92;frac{&#92;partial^2}{&#92;partial z^2}[b^2(z)p],&#92;]</span>
where <span>&#92;(a(z)&#92;)</span> is the drift coefficient and <span>&#92;(b^2(z)&#92;)</span> is the diffusion coefficient of the SDE <span>&#92;(dX_t = a(X_t)&#92;,dt + b(X_t)&#92;,dW_t&#92;)</span>. The Fokker-Planck equation is the stochastic analog of the Liouville equation in classical mechanics and shows why the study of stochastic processes requires the same ODE techniques (integrating factors, etc.) developed in the supplement.

## Poisson Process as a Counting Process

The Poisson process provides a clean example of how counting and waiting-time processes interact. Let <span>&#92;(N(t)&#92;)</span> denote the number of arrivals in <span>&#92;([0,t]&#92;)</span>. The process has independent and stationary increments: <span>&#92;(N(t)-N(s) &#92;sim &#92;mathrm{Poisson}(&#92;lambda(t-s))&#92;)</span> for <span>&#92;(s < t&#92;)</span>, independent of <span>&#92;(&#92;mathcal{F}_s&#92;)</span>. The connection to exponential distribution is: if interarrival times <span>&#92;(&#92;{T_k&#92;}_{k&#92;geq 1}&#92;)</span> are i.i.d. <span>&#92;(&#92;mathrm{Exp}(&#92;lambda)&#92;)</span>, then the counting process is Poisson. The martingale <span>&#92;(M_t = N(t) - &#92;lambda t&#92;)</span> (the compensated Poisson process) plays the same role for jump processes that Brownian motion plays for diffusions — it is the canonical example of a martingale with jumps.

The Poisson process is both a Markov chain (in continuous time, with states <span>&#92;(&#92;mathbb{Z}_{&#92;geq 0}&#92;)</span>) and a martingale (after centering). This dual character explains its appearance in advanced filtering theory: the nonlinear filtering of a Poisson-observed signal leads to different equations than the Gaussian-noise Kalman filter, involving intensity estimation and Doléans-Dade exponentials.

## Gaussian Processes — Characterization and Examples

A Gaussian process <span>&#92;(&#92;{X(t)&#92;}_{t &#92;in T}&#92;)</span> is completely characterized by its mean function <span>&#92;(m(t) = E[X(t)]&#92;)</span> and covariance kernel <span>&#92;(K(s,t) = &#92;operatorname{Cov}(X(s),X(t))&#92;)</span>, because all finite-dimensional distributions are jointly Gaussian. Any symmetric positive-semidefinite kernel <span>&#92;(K&#92;)</span> defines a valid Gaussian process.

**Ornstein-Uhlenbeck process.** The OU process satisfies the SDE <span>&#92;(dX_t = -&#92;alpha X_t&#92;,dt + &#92;sigma&#92;,dW_t&#92;)</span> with solution
<span>&#92;[X_t = X_0 e^{-&#92;alpha t} + &#92;sigma&#92;int_0^t e^{-&#92;alpha(t-s)}&#92;,dW_s.&#92;]</span>
Starting from <span>&#92;(X_0 &#92;sim N(0, &#92;sigma^2/(2&#92;alpha))&#92;)</span> (the stationary distribution), the process is stationary with covariance <span>&#92;(K(s,t) = &#92;frac{&#92;sigma^2}{2&#92;alpha}e^{-&#92;alpha|t-s|}&#92;)</span>. The OU process is the unique stationary Gaussian Markov process (in continuous time), serving as the continuous-time limit of the AR(1) model.

The OU process models mean-reverting dynamics in many applications: interest rates (Vasicek model), velocity in physical Brownian motion (Langevin equation), and the state noise in the Kalman filter when the signal is stationary. The exponential covariance kernel corresponds to the rational PSD
<span>&#92;[S_{XX}(&#92;omega) = &#92;frac{&#92;sigma^2}{&#92;alpha^2 + &#92;omega^2},&#92;]</span>
a Lorentzian spectrum with half-width <span>&#92;(&#92;alpha&#92;)</span> — the process has characteristic correlation time <span>&#92;(1/&#92;alpha&#92;)</span>, and observations separated by much more than <span>&#92;(1/&#92;alpha&#92;)</span> are essentially uncorrelated.


---

# Connections and Unifying Themes

## From Discrete to Continuous: The Unifying Thread

The course is structured around a deliberate progression from discrete to continuous, and from deterministic to stochastic. The simple random walk — where a particle steps right or left with equal probability — is the discrete prototype for Brownian motion. As the step size and time step shrink simultaneously (Donsker's invariance principle), the random walk converges in distribution to a Wiener process. Every property of the random walk has a continuous-time analog: the gambler's ruin probability corresponds to harmonic functions and the maximum principle for elliptic PDEs; the reflection principle for simple random walk becomes the reflection principle for Brownian motion; the ballot problem becomes the distribution of the Brownian maximum.

Similarly, the discrete Kalman filter is the prototype for the Kalman-Bucy filter. The two-step structure (information update, then time update) maps precisely onto the two terms in the continuous-time filter: the measurement term <span>&#92;(K(t)&#92;,d&#92;nu_t&#92;)</span> (continuous information update) and the drift term <span>&#92;(A&#92;hat{X}&#92;,dt&#92;)</span> (continuous time update). The discrete Riccati recursion <span>&#92;(&#92;Sigma_{k+1|k} = A&#92;Sigma_{k|k}A^T + Q - &#92;ldots&#92;)</span> becomes the matrix Riccati ODE <span>&#92;(&#92;dot{&#92;Sigma} = A&#92;Sigma + &#92;Sigma A^T + Q - &#92;Sigma H^T R^{-1} H &#92;Sigma&#92;)</span>.

## The Role of the Hilbert Space

The identification of <span>&#92;(L^2(&#92;Omega,&#92;mathcal{F},P)&#92;)</span> as a Hilbert space is not a formality — it is the key structural insight that makes MMSE estimation equivalent to orthogonal projection. The MMSE estimator <span>&#92;(&#92;hat{X} = E[X|&#92;mathcal{G}]&#92;)</span> is literally the closest point in the closed subspace <span>&#92;(L^2(&#92;Omega,&#92;mathcal{G},P) &#92;subseteq L^2(&#92;Omega,&#92;mathcal{F},P)&#92;)</span> to the target <span>&#92;(X&#92;)</span>. The Pythagorean theorem for Hilbert spaces gives <span>&#92;(&#92;|X&#92;|^2 = &#92;|&#92;hat{X}&#92;|^2 + &#92;|&#92;tilde{X}&#92;|^2&#92;)</span>, which is exactly the variance decomposition <span>&#92;(E[X^2] = E[&#92;hat{X}^2] + E[&#92;tilde{X}^2]&#92;)</span>. The Gram-Schmidt process for constructing orthonormal bases is precisely the innovation process construction: each new observation <span>&#92;(Y_k&#92;)</span> is "orthogonalized" against all previous observations to extract its new information content <span>&#92;(&#92;nu_k = Y_k - H_k&#92;hat{X}_{k|k-1}&#92;)</span>.

This geometric language illuminates why the Kalman filter is optimal not just among linear filters but among all estimators when the noise is Gaussian. In the Gaussian case, the conditional distribution <span>&#92;(P(X|&#92;mathcal{Y}_k)&#92;)</span> is itself Gaussian, and the conditional mean (the MMSE estimator) is a linear function of the observations. The Kalman filter computes this linear function recursively without ever constructing the full conditional distribution, making it computationally tractable even for high-dimensional state spaces.

## Martingales as the Language of Fair Games

The martingale concept provides a unifying language for many phenomena in the course. Brownian motion is a martingale; <span>&#92;(W_t^2 - t&#92;)</span> is a martingale (this encodes the quadratic variation); <span>&#92;(e^{&#92;theta W_t - &#92;theta^2 t/2}&#92;)</span> is a martingale for every <span>&#92;(&#92;theta&#92;)</span> (this is the exponential martingale, fundamental to the Cameron-Martin-Girsanov change of measure). The innovations process <span>&#92;(&#92;nu_k = Y_k - H_k&#92;hat{X}_{k|k-1}&#92;)</span> is a martingale difference sequence (each term has conditional mean zero given past observations). The compensated Poisson process <span>&#92;(N_t - &#92;lambda t&#92;)</span> is a martingale.

Optional stopping provides a powerful tool: if a martingale is stopped at a bounded stopping time, the stopped process is still a martingale, so the expected value at stopping equals the initial value. This gives exact formulas for hitting probabilities and expected hitting times for random walks and Brownian motion — results that would be very difficult to obtain without the martingale framework.

## Measure Theory: Why It Matters Practically

The abstract measure-theoretic framework, while requiring additional mathematical machinery, resolves several paradoxes and enables precise statements. Conditioning on an event of probability zero — such as conditioning Brownian motion on <span>&#92;(W_1 = 0&#92;)</span> to get the Brownian bridge — requires the Radon-Nikodym theorem and disintegration of measures; naive conditional probability <span>&#92;(P(A|B) = P(A&#92;cap B)/P(B)&#92;)</span> breaks down when <span>&#92;(P(B) = 0&#92;)</span>. The abstract conditional expectation <span>&#92;(E[X|&#92;mathcal{G}]&#92;)</span> handles this case. The Vitali set shows that not every subset of <span>&#92;(&#92;mathbb{R}&#92;)</span> can be assigned a length consistently, motivating the restriction to Borel (or Lebesgue) measurable sets. The Dominated Convergence Theorem justifies interchanging limits and integrals, which is used repeatedly — for instance, to differentiate the characteristic function under the integral sign to extract moments.

In the filtering context, measure theory provides the rigorous basis for the innovations representation: the filtration <span>&#92;(&#92;{&#92;mathcal{Y}_k&#92;}&#92;)</span> generated by the observations is a sub-<span>&#92;(&#92;sigma&#92;)</span>-algebra of the full probability space, and the Kalman filter computes projections onto <span>&#92;(L^2(&#92;mathcal{Y}_k)&#92;)</span> recursively. Without the measure-theoretic framework, one could not state precisely what "using all information up to time <span>&#92;(k&#92;)</span>" means, nor verify that the innovations are genuinely new information uncorrelated with the past.

