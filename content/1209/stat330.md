---
title: "STAT 330: Mathematical Statistics"
subjects: "STAT"
prof: "Peijun Sang"
---

## Sources and References

**Primary notes** — Cameron Roopnarine (Hextical), *STAT 330: Mathematical Statistics, Fall 2020*, [hextical.github.io/university-notes](https://hextical.github.io/university-notes/)
**Supplementary notes** — David Duan, *STAT 330 Master Notes*, [david-duan.me](https://www.david-duan.me/assets/course-notes/4a/stat-330-master.pdf)
**Textbook** — Bain and Engelhardt, *Introduction to Probability and Mathematical Statistics*, 2nd Edition

# Chapter 1: Univariate Random Variables

## 1.1 The Probability Model

A **probability model** provides a mathematical framework for describing a random experiment. It consists of three components:

1. A **sample space** \( S \), the set of all possible outcomes of the experiment.
2. An **event** \( A \), which is a subset of \( S \).
3. A **probability function** \( P \) that assigns a real number to each event.

<div class="definition">
<strong>Probability Function.</strong> A function \( P \) defined on events in \( S \) is a <strong>probability function</strong> if it satisfies the following axioms:

(i) \( P(A) \geq 0 \) for every event \( A \subseteq S \).
(ii) \( P(S) = 1 \).
(iii) <strong>Countable additivity:</strong> If \( A_1, A_2, \ldots \) are pairwise mutually exclusive events (i.e., \( A_i \cap A_j = \varnothing \) for \( i \neq j \)), then
\[
P\!\left(\bigcup_{i=1}^{\infty} A_i\right) = \sum_{i=1}^{\infty} P(A_i).
\]
</div>

From these axioms, several useful properties follow immediately:

- \( P(\varnothing) = 0 \).
- **Complement rule:** \( P(\bar{A}) = 1 - P(A) \).
- **Inclusion-exclusion:** \( P(A_1 \cup A_2) = P(A_1) + P(A_2) - P(A_1 \cap A_2) \).
- **Monotonicity:** If \( A_1 \subseteq A_2 \), then \( P(A_1) \leq P(A_2) \).
- \( 0 \leq P(A) \leq 1 \) for all events \( A \).

<div class="definition">
<strong>Conditional Probability.</strong> For events \( A \) and \( B \) with \( P(B) > 0 \), the <strong>conditional probability</strong> of \( A \) given \( B \) is
\[
P(A \mid B) = \frac{P(A \cap B)}{P(B)}.
\]
</div>

<div class="definition">
<strong>Independence of Events.</strong> Two events \( A \) and \( B \) are <strong>independent</strong> if and only if
\[
P(A \cap B) = P(A)\,P(B).
\]
Equivalently, when \( P(B) > 0 \), independence holds if and only if \( P(A \mid B) = P(A) \). Intuitively, the occurrence of one event does not influence the probability of the other.
</div>

## 1.2 Random Variables and Cumulative Distribution Functions

<div class="definition">
<strong>Random Variable.</strong> A <strong>random variable</strong> \( X \) is a function from the sample space \( S \) to the real numbers \( \mathbb{R} \), i.e., \( X : S \to \mathbb{R} \), such that for every \( x \in \mathbb{R} \), the set \( \{X \leq x\} = \{s \in S : X(s) \leq x\} \) is an event (a subset of \( S \) with a well-defined probability).
</div>

The main purpose of a random variable is to quantify outcomes of a random experiment numerically.

<div class="definition">
<strong>Cumulative Distribution Function (CDF).</strong> The <strong>cumulative distribution function</strong> of a random variable \( X \) is defined by
\[
F(x) = P(X \leq x), \quad x \in \mathbb{R}.
\]
</div>

<div class="theorem">
<strong>Properties of the CDF.</strong> Let \( F \) be the CDF of a random variable \( X \). Then:

(1) \( F \) is non-decreasing: if \( x_1 \leq x_2 \), then \( F(x_1) \leq F(x_2) \).
(2) \( \lim_{x \to \infty} F(x) = 1 \) and \( \lim_{x \to -\infty} F(x) = 0 \).
(3) \( F \) is right-continuous: \( \lim_{x \to a^+} F(x) = F(a) \) for all \( a \in \mathbb{R} \).
(4) \( P(a < X \leq b) = F(b) - F(a) \).
(5) \( P(X = a) = F(a) - \lim_{x \to a^-} F(x) \).
</div>

## 1.3 Discrete Random Variables

<div class="definition">
<strong>Discrete Random Variable.</strong> A random variable \( X \) is <strong>discrete</strong> if it takes on a finite or countable number of values. Its CDF is a right-continuous step function.
</div>

<div class="definition">
<strong>Probability Mass Function (PMF).</strong> The <strong>probability mass function</strong> (also called the probability function) of a discrete random variable \( X \) is
\[
f(x) = P(X = x).
\]
The <strong>support</strong> of \( X \) is the set \( A = \{x : f(x) > 0\} \). The PMF satisfies \( f(x) \geq 0 \) for all \( x \) and \( \sum_{x \in A} f(x) = 1 \).
</div>

### Common Discrete Distributions

| Distribution | PMF \( f(x) \) | Support | Mean | Variance | MGF |
|---|---|---|---|---|---|
| \( \text{Bernoulli}(p) \) | \( p^x(1-p)^{1-x} \) | \( x \in \{0,1\} \) | \( p \) | \( p(1-p) \) | \( 1 - p + pe^t \) |
| \( \text{Binomial}(n,p) \) | \( \binom{n}{x}p^x(1-p)^{n-x} \) | \( x = 0,1,\ldots,n \) | \( np \) | \( np(1-p) \) | \( (pe^t + 1-p)^n \) |
| \( \text{Geometric}(p) \) | \( (1-p)^x p \) | \( x = 0,1,2,\ldots \) | \( (1-p)/p \) | \( (1-p)/p^2 \) | \( \frac{p}{1-(1-p)e^t} \) |
| \( \text{NegBin}(r,p) \) | \( \binom{x+r-1}{x}(1-p)^x p^r \) | \( x = 0,1,2,\ldots \) | \( r(1-p)/p \) | \( r(1-p)/p^2 \) | \( \left(\frac{p}{1-(1-p)e^t}\right)^r \) |
| \( \text{Poisson}(\lambda) \) | \( e^{-\lambda}\lambda^x / x! \) | \( x = 0,1,2,\ldots \) | \( \lambda \) | \( \lambda \) | \( \exp\{\lambda(e^t - 1)\} \) |

<div class="remark">
The <strong>Binomial</strong> distribution arises from \( n \) independent Bernoulli trials each with success probability \( p \). If \( X_1, \ldots, X_n \) are iid \( \text{Bernoulli}(p) \), then \( X = \sum_{i=1}^n X_i \sim \text{Binomial}(n,p) \).

The <strong>Geometric</strong> distribution (in the "number of failures before the first success" convention) counts the number of failures preceding the first success. The <strong>Negative Binomial</strong> generalizes this to the number of failures before the \( r \)-th success.
</div>

<div class="example">
<strong>Poisson as a Binomial Limit.</strong> If \( X \sim \text{Binomial}(n,p) \) with \( n \to \infty \) and \( np = \lambda \) held fixed (so \( p = \lambda/n \to 0 \)), then
\[
P(X = x) = \binom{n}{x}\left(\frac{\lambda}{n}\right)^x\!\left(1 - \frac{\lambda}{n}\right)^{n-x} \;\xrightarrow{n \to \infty}\; \frac{e^{-\lambda}\lambda^x}{x!},
\]
which is the Poisson PMF. The key step uses \( \lim_{n \to \infty}(1 + z/n)^n = e^z \).
</div>

## 1.4 Continuous Random Variables

<div class="definition">
<strong>Continuous Random Variable.</strong> A random variable \( X \) is <strong>continuous</strong> if its CDF \( F(x) \) is continuous everywhere and differentiable almost everywhere (except possibly at a countable set of points).
</div>

<div class="definition">
<strong>Probability Density Function (PDF).</strong> The <strong>probability density function</strong> of a continuous random variable \( X \) is
\[
f(x) = F'(x)
\]
wherever the derivative exists, and \( f(x) = 0 \) otherwise. The PDF satisfies:

(i) \( f(x) \geq 0 \) for all \( x \in \mathbb{R} \).
(ii) \( \int_{-\infty}^{\infty} f(x)\,dx = 1 \).
(iii) \( F(x) = \int_{-\infty}^{x} f(t)\,dt \).
(iv) \( P(a < X \leq b) = P(a \leq X \leq b) = \int_a^b f(x)\,dx \), since \( P(X = c) = 0 \) for any single point \( c \).
</div>

<div class="remark">
For continuous random variables, \( f(x) \neq P(X = x) \). Rather, \( f(x)\,\delta \approx P(x < X \leq x + \delta) \) for small \( \delta > 0 \).
</div>

### The Gamma Function

<div class="definition">
<strong>Gamma Function.</strong> For \( \alpha > 0 \), the <strong>gamma function</strong> is defined by
\[
\Gamma(\alpha) = \int_0^{\infty} x^{\alpha - 1} e^{-x}\,dx.
\]
Key properties:
(1) \( \Gamma(\alpha) = (\alpha - 1)\,\Gamma(\alpha - 1) \) for \( \alpha > 1 \).
(2) \( \Gamma(n) = (n-1)! \) for positive integers \( n \).
(3) \( \Gamma(1/2) = \sqrt{\pi} \).
</div>

### Common Continuous Distributions

| Distribution | PDF \( f(x) \) | Support | Mean | Variance | MGF |
|---|---|---|---|---|---|
| \( \text{Uniform}(a,b) \) | \( \frac{1}{b-a} \) | \( a < x < b \) | \( \frac{a+b}{2} \) | \( \frac{(b-a)^2}{12} \) | \( \frac{e^{tb}-e^{ta}}{t(b-a)} \) |
| \( \text{Exponential}(\theta) \) | \( \frac{1}{\theta}e^{-x/\theta} \) | \( x > 0 \) | \( \theta \) | \( \theta^2 \) | \( (1-\theta t)^{-1} \) |
| \( \text{Gamma}(\alpha,\beta) \) | \( \frac{x^{\alpha-1}e^{-x/\beta}}{\Gamma(\alpha)\beta^\alpha} \) | \( x > 0 \) | \( \alpha\beta \) | \( \alpha\beta^2 \) | \( (1-\beta t)^{-\alpha} \) |
| \( N(\mu,\sigma^2) \) | \( \frac{1}{\sqrt{2\pi}\sigma}\exp\!\left\{-\frac{(x-\mu)^2}{2\sigma^2}\right\} \) | \( x \in \mathbb{R} \) | \( \mu \) | \( \sigma^2 \) | \( \exp\!\left\{\mu t + \frac{\sigma^2 t^2}{2}\right\} \) |
| \( \text{Weibull}(\theta,\beta) \) | \( \frac{\beta}{\theta^\beta}x^{\beta-1}\exp\!\left\{-\left(\frac{x}{\theta}\right)^\beta\right\} \) | \( x > 0 \) | --- | --- | --- |

<div class="example">
<strong>Verifying the Normal PDF integrates to 1.</strong> For the standard normal \( Z \sim N(0,1) \), we need to show
\[
\int_{-\infty}^{\infty} \frac{1}{\sqrt{2\pi}} \exp\!\left\{-\frac{x^2}{2}\right\} dx = 1.
\]
By symmetry, the integral equals \( 2\int_0^{\infty} \frac{1}{\sqrt{2\pi}} e^{-x^2/2}\,dx \). Using the substitution \( y = x^2/2 \) (so \( dx = \frac{1}{\sqrt{2y}}\,dy \)):
\[
\frac{2}{\sqrt{2\pi}} \int_0^{\infty} e^{-y} \frac{1}{\sqrt{2y}}\,dy = \frac{1}{\sqrt{\pi}} \int_0^{\infty} y^{-1/2} e^{-y}\,dy = \frac{1}{\sqrt{\pi}}\,\Gamma\!\left(\frac{1}{2}\right) = \frac{\sqrt{\pi}}{\sqrt{\pi}} = 1.
\]

For general \( X \sim N(\mu, \sigma^2) \), writing \( X = \sigma Z + \mu \) with \( Z \sim N(0,1) \) and substituting \( z = (x - \mu)/\sigma \) reduces the general case to the standard one.
</div>

## 1.5 Expectation and Variance

<div class="definition">
<strong>Expected Value.</strong> The <strong>expectation</strong> (or expected value, or mean) of a random variable \( X \) is:

For discrete \( X \) with PMF \( f(x) \) and support \( A \):
\[
E[X] = \sum_{x \in A} x\,f(x), \quad \text{provided } \sum_{x \in A} |x|\,f(x) < \infty.
\]

For continuous \( X \) with PDF \( f(x) \):
\[
E[X] = \int_{-\infty}^{\infty} x\,f(x)\,dx, \quad \text{provided } \int_{-\infty}^{\infty} |x|\,f(x)\,dx < \infty.
\]

If the absolute convergence condition fails, \( E[X] \) does not exist.
</div>

<div class="remark">
The absolute convergence requirement is essential. For example, the Cauchy distribution with PDF \( f(x) = \frac{1}{\pi(1+x^2)} \) for \( x \in \mathbb{R} \) has \( \int_{-\infty}^{\infty} |x| f(x)\,dx = \infty \), so its mean does not exist, even though the improper integral \( \int_{-\infty}^{\infty} x f(x)\,dx = 0 \) by symmetry.
</div>

<div class="definition">
<strong>Expectation of a Function.</strong> For a function \( g \) applied to a random variable \( X \):
\[
E[g(X)] = \begin{cases} \sum_{x \in A} g(x)\,f(x) & \text{if } X \text{ is discrete}, \\[4pt] \int_{-\infty}^{\infty} g(x)\,f(x)\,dx & \text{if } X \text{ is continuous}, \end{cases}
\]
provided the sum or integral converges absolutely.
</div>

<div class="theorem">
<strong>Linearity of Expectation.</strong> For real constants \( a, b \) and functions \( g, h \):
\[
E[ag(X) + bh(X) + c] = a\,E[g(X)] + b\,E[h(X)] + c.
\]
</div>

<div class="definition">
<strong>Variance.</strong> The <strong>variance</strong> of a random variable \( X \) is
\[
\text{Var}(X) = E[(X - \mu)^2] = E[X^2] - (E[X])^2,
\]
where \( \mu = E[X] \).
</div>

<div class="proof">
<strong>Proof of the shortcut formula.</strong>
\[
\text{Var}(X) = E[(X - \mu)^2] = E[X^2 - 2\mu X + \mu^2] = E[X^2] - 2\mu\,E[X] + \mu^2 = E[X^2] - \mu^2.
\]
</div>

Properties of variance:

- \( \text{Var}(a) = 0 \) for any constant \( a \).
- \( \text{Var}(X) \geq 0 \).
- \( \text{Var}(X + a) = \text{Var}(X) \) (invariant under location shifts).
- \( \text{Var}(aX) = a^2\,\text{Var}(X) \).
- \( \text{Var}(aX + bY) = a^2\,\text{Var}(X) + b^2\,\text{Var}(Y) + 2ab\,\text{Cov}(X,Y) \).
- If \( X_1, \ldots, X_n \) are independent: \( \text{Var}\!\left(\sum_{i=1}^n X_i\right) = \sum_{i=1}^n \text{Var}(X_i) \).

### Moments

<div class="definition">
<strong>Moments.</strong> Let \( X \) be a random variable with mean \( \mu \).

The \( k \)-th <strong>moment about the origin</strong> (or raw moment) is \( E[X^k] \).
The \( k \)-th <strong>central moment</strong> (moment about the mean) is \( E[(X - \mu)^k] \).

In particular, the first moment is the mean and the second central moment is the variance.
</div>

<div class="example">
<strong>Moments of the Gamma distribution.</strong> If \( X \sim \text{Gamma}(\alpha, \beta) \), then for \( p > -\alpha \):
\[
E[X^p] = \frac{\beta^p\,\Gamma(\alpha + p)}{\Gamma(\alpha)}.
\]
Setting \( p = 1 \): \( E[X] = \alpha\beta \). Setting \( p = 2 \): \( E[X^2] = \alpha(\alpha+1)\beta^2 \). Therefore \( \text{Var}(X) = \alpha\beta^2 \).
</div>

<div class="example">
<strong>Moments of the Poisson distribution.</strong> If \( X \sim \text{Poisson}(\theta) \), then
\[
E[X] = \sum_{x=0}^{\infty} x\,\frac{\theta^x}{x!}\,e^{-\theta} = \theta \sum_{y=0}^{\infty} \frac{\theta^y}{y!}\,e^{-\theta} = \theta.
\]
A similar calculation yields \( E[X^2] = \theta^2 + \theta \), so \( \text{Var}(X) = \theta \).
</div>

## 1.6 Moment Generating Functions

<div class="definition">
<strong>Moment Generating Function (MGF).</strong> The <strong>moment generating function</strong> of a random variable \( X \) is
\[
M_X(t) = E[e^{tX}],
\]
provided this expectation exists (is finite) for all \( t \) in some open interval \( (-h, h) \) containing 0.
</div>

<div class="theorem">
<strong>Moment Extraction.</strong> If \( X \) has MGF \( M_X(t) \) defined on \( (-h, h) \), then for \( k = 1, 2, \ldots \):
\[
E[X^k] = M_X^{(k)}(0),
\]
where \( M_X^{(k)}(0) \) denotes the \( k \)-th derivative of \( M_X(t) \) evaluated at \( t = 0 \).
</div>

<div class="proof">
Since \( M_X(t) = E[e^{tX}] \), differentiating under the expectation gives
\[
M_X^{(k)}(t) = E[X^k e^{tX}].
\]
Setting \( t = 0 \) yields \( M_X^{(k)}(0) = E[X^k \cdot 1] = E[X^k] \).
</div>

<div class="theorem">
<strong>Uniqueness Theorem.</strong> If two random variables \( X \) and \( Y \) have MGFs that are equal in a neighbourhood of 0, i.e., \( M_X(t) = M_Y(t) \) for all \( t \in (-h, h) \) with \( h > 0 \), then \( X \) and \( Y \) have the same distribution.
</div>

<div class="theorem">
<strong>MGF of a Linear Function.</strong> If \( Y = aX + b \), then
\[
M_Y(t) = e^{bt}\,M_X(at).
\]
</div>

<div class="proof">
\( M_Y(t) = E[e^{tY}] = E[e^{t(aX+b)}] = e^{bt}\,E[e^{(at)X}] = e^{bt}\,M_X(at) \).
</div>

<div class="example">
<strong>MGF of the Normal distribution.</strong> For \( Z \sim N(0,1) \):
\[
M_Z(t) = \int_{-\infty}^{\infty} e^{tx}\,\frac{1}{\sqrt{2\pi}}\,e^{-x^2/2}\,dx = \exp\!\left\{\frac{t^2}{2}\right\}.
\]
This is derived by completing the square in the exponent: \( tx - x^2/2 = -(x-t)^2/2 + t^2/2 \).

For \( X \sim N(\mu, \sigma^2) \), writing \( X = \sigma Z + \mu \) gives:
\[
M_X(t) = e^{\mu t}\,M_Z(\sigma t) = \exp\!\left\{\mu t + \frac{\sigma^2 t^2}{2}\right\}.
\]
</div>

<div class="example">
<strong>Identifying a distribution via its MGF.</strong> Suppose \( M_X(t) = (1 - 2t)^{-1} \). This matches the form \( (1 - \beta t)^{-\alpha} \) with \( \alpha = 1, \beta = 2 \), which is the MGF of a \( \text{Gamma}(1, 2) = \text{Exponential}(2) \) distribution.
</div>

# Chapter 2: Multivariate Random Variables

## 2.1 Joint and Marginal Distribution Functions

<div class="definition">
<strong>Joint CDF.</strong> The <strong>joint cumulative distribution function</strong> of random variables \( X \) and \( Y \) is
\[
F(x, y) = P(X \leq x, Y \leq y), \quad (x, y) \in \mathbb{R}^2.
\]
</div>

Properties of the joint CDF:

1. \( F \) is non-decreasing in each argument when the other is held fixed.
2. \( \lim_{x \to -\infty} F(x, y) = 0 \) and \( \lim_{y \to -\infty} F(x, y) = 0 \).
3. \( \lim_{(x,y) \to (-\infty,-\infty)} F(x,y) = 0 \) and \( \lim_{(x,y) \to (\infty,\infty)} F(x,y) = 1 \).

<div class="definition">
<strong>Marginal CDFs.</strong> The <strong>marginal CDF</strong> of \( X \) is obtained by letting \( y \to \infty \):
\[
F_X(x) = \lim_{y \to \infty} F(x, y) = P(X \leq x).
\]
Similarly, \( F_Y(y) = \lim_{x \to \infty} F(x, y) \).
</div>

<div class="remark">
Given the joint CDF, we can always recover the marginal CDFs. However, marginal CDFs alone do not uniquely determine the joint CDF, since different joint distributions can share the same marginals.
</div>

## 2.2 Bivariate Discrete Distributions

<div class="definition">
<strong>Joint PMF.</strong> If \( X \) and \( Y \) are jointly discrete, their <strong>joint probability mass function</strong> is
\[
f(x, y) = P(X = x, Y = y), \quad (x, y) \in \mathbb{R}^2.
\]
The <strong>joint support</strong> is \( A = \{(x, y) : f(x, y) > 0\} \). It satisfies \( f(x,y) \geq 0 \) and \( \sum_{(x,y) \in A} f(x,y) = 1 \).
</div>

<div class="definition">
<strong>Marginal PMFs.</strong> The marginal PMFs are obtained by summing out the other variable:
\[
f_X(x) = \sum_y f(x, y), \qquad f_Y(y) = \sum_x f(x, y).
\]
</div>

<div class="example">
<strong>Joint PMF example.</strong> Suppose \( f(x,y) = (1-p)^2 p^{x+y} \) for \( x, y = 0, 1, 2, \ldots \) and \( 0 < p < 1 \). Then:

The marginal PMF of \( X \): \( f_X(x) = \sum_{y=0}^{\infty} (1-p)^2 p^{x+y} = (1-p)^2 p^x \cdot \frac{1}{1-p} = (1-p)p^x \), which is a Geometric distribution.

To compute \( P(X \leq Y) \):
\[
P(X \leq Y) = \sum_{x=0}^{\infty} \sum_{y=x}^{\infty} (1-p)^2 p^{x+y} = (1-p) \sum_{x=0}^{\infty} p^{2x} = \frac{1-p}{1-p^2} = \frac{1}{1+p}.
\]
</div>

## 2.3 Bivariate Continuous Distributions

<div class="definition">
<strong>Joint PDF.</strong> If the joint CDF can be written as
\[
F(x, y) = \int_{-\infty}^{x} \int_{-\infty}^{y} f(s, t)\,dt\,ds,
\]
then \( X \) and \( Y \) are <strong>jointly continuous</strong> with <strong>joint probability density function</strong>
\[
f(x, y) = \frac{\partial^2 F(x, y)}{\partial x\,\partial y}
\]
wherever this mixed partial derivative exists.
</div>

Properties: \( f(x,y) \geq 0 \) and \( \iint_{\mathbb{R}^2} f(x,y)\,dx\,dy = 1 \). For any region \( R \subseteq \mathbb{R}^2 \):
\[
P((X, Y) \in R) = \iint_R f(x, y)\,dx\,dy.
\]

<div class="definition">
<strong>Marginal PDFs.</strong> The marginal density of \( X \) is
\[
f_X(x) = \int_{-\infty}^{\infty} f(x, y)\,dy,
\]
and similarly \( f_Y(y) = \int_{-\infty}^{\infty} f(x, y)\,dx \).
</div>

<div class="example">
<strong>Working with a joint PDF.</strong> Let \( f(x,y) = x + y \) for \( 0 \leq x \leq 1 \), \( 0 \leq y \leq 1 \) and zero otherwise. Then:

Verification: \( \int_0^1 \int_0^1 (x+y)\,dy\,dx = \int_0^1 (x + 1/2)\,dx = 1 \).

Marginal of \( X \): \( f_X(x) = \int_0^1 (x+y)\,dy = x + 1/2 \) for \( 0 \leq x \leq 1 \).

\( P(X \leq Y) = \int_0^1 \int_x^1 (x+y)\,dy\,dx = 1/2 \).
</div>

## 2.4 Independence

<div class="definition">
<strong>Independence of Random Variables.</strong> Random variables \( X \) and \( Y \) are <strong>independent</strong> if and only if for all sets \( A, B \subseteq \mathbb{R} \):
\[
P(X \in A, Y \in B) = P(X \in A)\,P(Y \in B).
\]
</div>

<div class="theorem">
<strong>Equivalent Conditions for Independence.</strong> \( X \) and \( Y \) are independent if and only if any one of the following holds:

(1) \( F(x, y) = F_X(x)\,F_Y(y) \) for all \( (x,y) \in \mathbb{R}^2 \).
(2) \( f(x, y) = f_X(x)\,f_Y(y) \) for all \( (x,y) \).
</div>

<div class="theorem">
<strong>Factorization Theorem for Independence.</strong> Suppose \( (X, Y) \) has joint density (or mass function) \( f(x, y) \) with joint support \( A \), and the marginal supports are \( A_X \) and \( A_Y \). Then \( X \) and \( Y \) are independent if and only if:

(i) \( A = A_X \times A_Y \) (the support is a "rectangle"), and
(ii) there exist non-negative functions \( g \) and \( h \) such that \( f(x, y) = g(x)\,h(y) \) for all \( (x,y) \in A \).
</div>

<div class="remark">
If the support region is not rectangular (e.g., the support depends on both \( x \) and \( y \) jointly), then \( X \) and \( Y \) cannot be independent. For instance, \( f(x,y) = x + y \) on the unit square has a rectangular support, but since \( f(x,y) \neq f_X(x)\,f_Y(y) = (x + 1/2)(y + 1/2) \), the variables are not independent.
</div>

<div class="theorem">
<strong>Functions of Independent Variables.</strong> If \( X \) and \( Y \) are independent and \( g, h \) are real-valued functions, then \( g(X) \) and \( h(Y) \) are independent.
</div>

## 2.5 Joint Expectation, Covariance, and Correlation

<div class="definition">
<strong>Joint Expectation.</strong> For a function \( h(x, y) \) of jointly distributed random variables:

Discrete case: \( E[h(X, Y)] = \sum_{(x,y) \in A} h(x, y)\,f(x, y) \).

Continuous case: \( E[h(X, Y)] = \int_{-\infty}^{\infty}\int_{-\infty}^{\infty} h(x, y)\,f(x, y)\,dx\,dy \).
</div>

<div class="theorem">
<strong>Linearity of Expectation (general).</strong> For any random variables \( X_1, \ldots, X_n \) and constants \( a_1, \ldots, a_n \):
\[
E\!\left[\sum_{i=1}^n a_i X_i\right] = \sum_{i=1}^n a_i\,E[X_i].
\]
This holds regardless of whether the variables are independent.
</div>

<div class="theorem">
<strong>Independence and Expectation.</strong> If \( X \) and \( Y \) are independent and \( g(x), h(y) \) are real-valued functions, then
\[
E[g(X)\,h(Y)] = E[g(X)]\,E[h(Y)].
\]
More generally, if \( X_1, \ldots, X_n \) are independent: \( E\!\left[\prod_{i=1}^n g_i(X_i)\right] = \prod_{i=1}^n E[g_i(X_i)] \).
</div>

<div class="definition">
<strong>Covariance.</strong> The <strong>covariance</strong> of \( X \) and \( Y \) is
\[
\text{Cov}(X, Y) = E[(X - \mu_X)(Y - \mu_Y)] = E[XY] - E[X]\,E[Y].
\]
If \( X \) and \( Y \) are independent, then \( \text{Cov}(X, Y) = 0 \). The converse is not generally true.
</div>

<div class="definition">
<strong>Correlation Coefficient.</strong> The <strong>correlation coefficient</strong> is the standardized covariance:
\[
\rho(X, Y) = \frac{\text{Cov}(X, Y)}{\sqrt{\text{Var}(X)}\,\sqrt{\text{Var}(Y)}}.
\]
It satisfies \( -1 \leq \rho(X, Y) \leq 1 \). Equality \( |\rho| = 1 \) holds if and only if \( Y = aX + b \) for some constants with \( a \neq 0 \).
</div>

<div class="theorem">
<strong>Variance of a Linear Combination.</strong>

(1) \( \text{Var}(aX + bY) = a^2\,\text{Var}(X) + b^2\,\text{Var}(Y) + 2ab\,\text{Cov}(X, Y) \).

(2) \( \text{Var}\!\left(\sum_{i=1}^n a_i X_i\right) = \sum_{i=1}^n a_i^2\,\text{Var}(X_i) + 2\sum_{i < j} a_i a_j\,\text{Cov}(X_i, X_j) \).

(3) If \( X_1, \ldots, X_n \) are independent: \( \text{Var}\!\left(\sum_{i=1}^n a_i X_i\right) = \sum_{i=1}^n a_i^2\,\text{Var}(X_i) \).
</div>

## 2.6 Conditional Distributions and Expectation

<div class="definition">
<strong>Conditional PMF/PDF.</strong> The <strong>conditional distribution</strong> of \( X \) given \( Y = y \) is defined by

Discrete: \( f_X(x \mid y) = \frac{f(x, y)}{f_Y(y)} \), provided \( f_Y(y) > 0 \).

Continuous: \( f_X(x \mid y) = \frac{f(x, y)}{f_Y(y)} \), provided \( f_Y(y) > 0 \).

Similarly, \( f_Y(y \mid x) = f(x, y) / f_X(x) \).
</div>

These conditional functions are themselves valid probability distributions (they are non-negative and sum/integrate to 1).

<div class="theorem">
<strong>Product Rule.</strong> The joint density factors as
\[
f(x, y) = f_X(x \mid y)\,f_Y(y) = f_Y(y \mid x)\,f_X(x).
\]
</div>

<div class="theorem">
<strong>Independence via Conditional Distributions.</strong> \( X \) and \( Y \) are independent if and only if \( f_X(x \mid y) = f_X(x) \) for all \( x, y \) (and equivalently \( f_Y(y \mid x) = f_Y(y) \)).
</div>

### Conditional Expectation

<div class="definition">
<strong>Conditional Expectation.</strong> The <strong>conditional expectation</strong> of \( g(Y) \) given \( X = x \) is
\[
E[g(Y) \mid X = x] = \begin{cases} \sum_y g(y)\,f_Y(y \mid x) & \text{if } Y \text{ is discrete}, \\[4pt] \int_{-\infty}^{\infty} g(y)\,f_Y(y \mid x)\,dy & \text{if } Y \text{ is continuous}. \end{cases}
\]
The <strong>conditional mean</strong> is \( E[Y \mid X = x] \) and the <strong>conditional variance</strong> is
\[
\text{Var}(Y \mid X = x) = E[Y^2 \mid X = x] - (E[Y \mid X = x])^2.
\]
</div>

<div class="remark">
The conditional expectation \( E[g(Y) \mid X] \) (without fixing \( X = x \)) is itself a random variable that is a function of \( X \). To obtain it: first compute \( h(x) = E[g(Y) \mid X = x] \), then replace \( x \) with \( X \) to get the random variable \( h(X) \).
</div>

<div class="theorem">
<strong>Law of Total Expectation (Double Expectation Theorem).</strong> For any random variables \( X \) and \( Y \):
\[
E[g(Y)] = E[E[g(Y) \mid X]].
\]
In particular, \( E[Y] = E[E[Y \mid X]] \).
</div>

<div class="proof">
For the continuous case:
\[
E[E[g(X) \mid Y]] = \int_{-\infty}^{\infty}\!\left[\int_{-\infty}^{\infty} g(x)\,f_X(x \mid y)\,dx\right] f_Y(y)\,dy = \int_{-\infty}^{\infty} g(x) \underbrace{\left[\int_{-\infty}^{\infty} f(x,y)\,dy\right]}_{f_X(x)} dx = E[g(X)].
\]
</div>

<div class="theorem">
<strong>Law of Total Variance.</strong> For any random variables \( X \) and \( Y \):
\[
\text{Var}(Y) = E[\text{Var}(Y \mid X)] + \text{Var}(E[Y \mid X]).
\]
The first term captures the average within-group variance, and the second captures the between-group variance.
</div>

<div class="example">
<strong>Application of total expectation and variance.</strong> Suppose \( Y \sim \text{Poisson}(\theta) \) and \( X \mid Y = y \sim \text{Binomial}(y, p) \). Then:

\( E[X \mid Y] = Yp \), so \( E[X] = E[Yp] = p\theta \).

\( \text{Var}(X \mid Y) = Yp(1-p) \), so:
\[
\text{Var}(X) = E[Yp(1-p)] + \text{Var}(Yp) = p(1-p)\theta + p^2\theta = p\theta.
\]
This confirms \( X \sim \text{Poisson}(p\theta) \).
</div>

## 2.7 Joint Moment Generating Functions

<div class="definition">
<strong>Joint MGF.</strong> The <strong>joint moment generating function</strong> of \( X \) and \( Y \) is
\[
M(t_1, t_2) = E[e^{t_1 X + t_2 Y}],
\]
provided this exists for \( |t_1| < h_1 \) and \( |t_2| < h_2 \) for some \( h_1, h_2 > 0 \).

For \( n \) random variables: \( M(t_1, \ldots, t_n) = E[\exp\{t_1 X_1 + \cdots + t_n X_n\}] \).
</div>

Key applications:

1. **Recovering marginal MGFs:** \( M_X(t_1) = M(t_1, 0) \) and \( M_Y(t_2) = M(0, t_2) \).
2. **Testing independence:** \( X \) and \( Y \) are independent if and only if \( M(t_1, t_2) = M_X(t_1)\,M_Y(t_2) \).

<div class="example">
<strong>Additivity of independent Poissons.</strong> If \( X \sim \text{Poisson}(\theta_1) \) and \( Y \sim \text{Poisson}(\theta_2) \) are independent, then
\[
M_{X+Y}(t) = E[e^{tX}]\,E[e^{tY}] = \exp\{\theta_1(e^t - 1)\}\,\exp\{\theta_2(e^t - 1)\} = \exp\{(\theta_1 + \theta_2)(e^t - 1)\},
\]
which is the MGF of \( \text{Poisson}(\theta_1 + \theta_2) \). By uniqueness, \( X + Y \sim \text{Poisson}(\theta_1 + \theta_2) \).
</div>

## 2.8 The Multinomial Distribution

<div class="definition">
<strong>Multinomial Distribution.</strong> Suppose \( n \) independent trials are performed, each resulting in one of \( k \) categories with probabilities \( p_1, \ldots, p_k \) (\( \sum p_i = 1 \)). Let \( X_i \) count the number of outcomes in category \( i \). Then \( (X_1, \ldots, X_k) \sim \text{Multinomial}(n; p_1, \ldots, p_k) \) with joint PMF
\[
f(x_1, \ldots, x_k) = \frac{n!}{x_1!\,x_2!\cdots x_k!}\,p_1^{x_1}\cdots p_k^{x_k},
\]
where \( x_i \in \{0, 1, \ldots, n\} \) and \( \sum_{i=1}^k x_i = n \).
</div>

Properties of the Multinomial distribution:

1. **Joint MGF:** \( M(t_1, \ldots, t_k) = (p_1 e^{t_1} + \cdots + p_k e^{t_k})^n \).
2. **Marginals:** Each \( X_i \sim \text{Binomial}(n, p_i) \).
3. **Pairwise sums:** \( X_i + X_j \sim \text{Binomial}(n, p_i + p_j) \) for \( i \neq j \).
4. **Covariance:** \( \text{Cov}(X_i, X_j) = -np_i p_j \) for \( i \neq j \).
5. **Conditional distributions:** \( X_i \mid X_j = x_j \sim \text{Binomial}\!\left(n - x_j,\, \frac{p_i}{1 - p_j}\right) \) for \( i \neq j \).

## 2.9 The Bivariate Normal Distribution

<div class="definition">
<strong>Bivariate Normal Distribution.</strong> Random variables \( X_1 \) and \( X_2 \) follow a <strong>bivariate normal distribution</strong>, written \( \mathbf{X} = (X_1, X_2)^\top \sim \text{BVN}(\boldsymbol{\mu}, \Sigma) \), if their joint PDF is
\[
f(x_1, x_2) = \frac{1}{2\pi\sigma_1\sigma_2\sqrt{1-\rho^2}} \exp\!\left\{-\frac{1}{2(1-\rho^2)}\left[\left(\frac{x_1-\mu_1}{\sigma_1}\right)^2 + \left(\frac{x_2-\mu_2}{\sigma_2}\right)^2 - \frac{2\rho(x_1-\mu_1)(x_2-\mu_2)}{\sigma_1\sigma_2}\right]\right\},
\]
where \( \boldsymbol{\mu} = (\mu_1, \mu_2)^\top \) and \( \Sigma = \begin{pmatrix} \sigma_1^2 & \rho\sigma_1\sigma_2 \\ \rho\sigma_1\sigma_2 & \sigma_2^2 \end{pmatrix} \).
</div>

Properties of the bivariate normal:

1. **Joint MGF:** \( M(t_1, t_2) = \exp\!\left\{\mathbf{t}^\top\boldsymbol{\mu} + \frac{1}{2}\mathbf{t}^\top\Sigma\mathbf{t}\right\} \).
2. **Marginals:** \( X_1 \sim N(\mu_1, \sigma_1^2) \) and \( X_2 \sim N(\mu_2, \sigma_2^2) \).
3. **Conditional distributions:**
\[
X_2 \mid X_1 = x_1 \sim N\!\left(\mu_2 + \rho\frac{\sigma_2}{\sigma_1}(x_1 - \mu_1),\; \sigma_2^2(1-\rho^2)\right).
\]
4. **Covariance:** \( \text{Cov}(X_1, X_2) = \rho\sigma_1\sigma_2 \) and \( \text{Corr}(X_1, X_2) = \rho \).
5. **Independence:** \( \rho = 0 \iff X_1 \) and \( X_2 \) are independent. (For BVN, uncorrelated implies independent.)
6. **Linear combinations:** Any linear combination \( c_1 X_1 + c_2 X_2 \sim N(c_1\mu_1 + c_2\mu_2,\, \mathbf{c}^\top\Sigma\mathbf{c}) \).
7. **Quadratic form:** \( (\mathbf{x} - \boldsymbol{\mu})^\top\Sigma^{-1}(\mathbf{x} - \boldsymbol{\mu}) \sim \chi^2(2) \).

# Chapter 3: Functions of Random Variables

Given random variables \( X_1, \ldots, X_n \) and a function \( h \), we often need the distribution of \( Y = h(X_1, \ldots, X_n) \). Three principal techniques are available: the CDF technique, the one-to-one transformation (Jacobian) method, and the MGF technique.

## 3.1 The CDF Technique

The CDF technique is the most general method and works for both discrete and continuous variables.

**Procedure (continuous case):**
1. For each \( y \in \mathbb{R} \), determine the region \( R_y = \{(x_1, \ldots, x_n) : h(x_1, \ldots, x_n) \leq y\} \).
2. Compute \( F_Y(y) = P(Y \leq y) = \int_{R_y} f(x_1, \ldots, x_n)\,dx_1 \cdots dx_n \).
3. Differentiate: \( f_Y(y) = F_Y'(y) \).

<div class="example">
<strong>Distribution of \( Y = X^2 \) where \( X \sim N(0,1) \).</strong>

The support of \( Y \) is \( [0, \infty) \). For \( y > 0 \):
\[
F_Y(y) = P(X^2 \leq y) = P(-\sqrt{y} \leq X \leq \sqrt{y}) = F_X(\sqrt{y}) - F_X(-\sqrt{y}).
\]
Differentiating:
\[
f_Y(y) = \frac{1}{2\sqrt{y}}\left[f_X(\sqrt{y}) + f_X(-\sqrt{y})\right] = \frac{1}{2\sqrt{y}} \cdot \frac{2}{\sqrt{2\pi}}\,e^{-y/2} = \frac{1}{\sqrt{2\pi}}\,y^{-1/2}\,e^{-y/2}.
\]
This is the PDF of a \( \chi^2(1) \) distribution, equivalently \( \text{Gamma}(1/2, 2) \).
</div>

<div class="example">
<strong>Distribution of order statistics.</strong> Let \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} \text{Uniform}(0, \theta) \).

For the <strong>maximum</strong> \( X_{(n)} = \max_i X_i \): Since the \( X_i \) are independent,
\[
F_{X_{(n)}}(y) = P(X_1 \leq y, \ldots, X_n \leq y) = \left(\frac{y}{\theta}\right)^n, \quad 0 < y < \theta.
\]
So \( f_{X_{(n)}}(y) = \frac{n}{\theta^n}\,y^{n-1} \) for \( 0 < y < \theta \).

For the <strong>minimum</strong> \( X_{(1)} = \min_i X_i \):
\[
F_{X_{(1)}}(y) = 1 - P(X_1 > y, \ldots, X_n > y) = 1 - \left(\frac{\theta - y}{\theta}\right)^n, \quad 0 < y < \theta.
\]
So \( f_{X_{(1)}}(y) = \frac{n}{\theta}\left(1 - \frac{y}{\theta}\right)^{n-1} \) for \( 0 < y < \theta \).
</div>

<div class="theorem">
<strong>Probability Integral Transform.</strong> If \( X \) is a continuous random variable with CDF \( F \), then \( Y = F(X) \sim \text{Uniform}(0, 1) \).

Conversely, if \( U \sim \text{Uniform}(0,1) \), then \( X = F^{-1}(U) \) has CDF \( F \).
</div>

<div class="proof">
For \( 0 < y < 1 \):
\[
P(Y \leq y) = P(F(X) \leq y) = P(X \leq F^{-1}(y)) = F(F^{-1}(y)) = y,
\]
which is the CDF of \( \text{Uniform}(0,1) \).
</div>

## 3.2 One-to-One Transformations (Univariate)

<div class="theorem">
<strong>Univariate Transformation Theorem.</strong> Let \( X \) be a continuous random variable with PDF \( f_X(x) \) and support \( A \). If \( h \) is a one-to-one (monotone) function on \( A \), and \( Y = h(X) \), then the PDF of \( Y \) is
\[
f_Y(y) = f_X(x) \left|\frac{dx}{dy}\right|,
\]
where \( x = h^{-1}(y) \) and the support of \( Y \) is \( h(A) \).
</div>

<div class="example">
<strong>Log transformation.</strong> Let \( f_X(x) = \frac{\theta}{x^{\theta+1}} \) for \( x \geq 1 \) (a Pareto distribution) and \( Y = \ln(X) \).

Since \( y = \ln(x) \implies x = e^y \) and \( dx/dy = e^y \), for \( y > 0 \):
\[
f_Y(y) = f_X(e^y)\,|e^y| = \frac{\theta}{(e^y)^{\theta+1}}\,e^y = \theta\,e^{-y\theta}.
\]
Thus \( Y \sim \text{Exponential}(1/\theta) \).
</div>

<div class="example">
<strong>CDF transformation yields Uniform.</strong> If \( X \sim N(0,1) \) and \( Y = \Phi(X) \) where \( \Phi \) is the standard normal CDF, then \( Y \sim \text{Uniform}(0,1) \) by the Probability Integral Transform.
</div>

## 3.3 One-to-One Transformations (Bivariate Jacobian Method)

<div class="theorem">
<strong>Bivariate Transformation Theorem.</strong> Let \( (X, Y) \) have joint PDF \( f(x, y) \). Define \( U = h_1(X, Y) \) and \( V = h_2(X, Y) \), where the transformation is one-to-one with inverse \( x = w_1(u, v) \), \( y = w_2(u, v) \). The joint PDF of \( (U, V) \) is
\[
g(u, v) = f(w_1(u,v),\, w_2(u,v))\,\left|\frac{\partial(x, y)}{\partial(u, v)}\right|,
\]
where the <strong>Jacobian</strong> is the absolute value of the determinant
\[
\frac{\partial(x,y)}{\partial(u,v)} = \begin{vmatrix} \partial x/\partial u & \partial x/\partial v \\ \partial y/\partial u & \partial y/\partial v \end{vmatrix}.
\]
</div>

<div class="example">
<strong>Sum and difference of independent normals.</strong> Let \( X, Y \stackrel{\text{iid}}{\sim} N(0, 1) \). Define \( U = X + Y \) and \( V = X - Y \).

Inverse: \( x = (u+v)/2 \), \( y = (u-v)/2 \). The Jacobian is
\[
\frac{\partial(x,y)}{\partial(u,v)} = \begin{vmatrix} 1/2 & 1/2 \\ 1/2 & -1/2 \end{vmatrix} = -1/2.
\]

The joint PDF of \( (X, Y) \) is \( f(x,y) = \frac{1}{2\pi}\exp\{-(x^2+y^2)/2\} \). Substituting:
\[
g(u,v) = \frac{1}{2\pi}\exp\!\left\{-\frac{(u+v)^2/4 + (u-v)^2/4}{2}\right\}\cdot\frac{1}{2} = \frac{1}{4\pi}\exp\!\left\{-\frac{u^2+v^2}{4}\right\}.
\]
This factors as \( g_U(u)\,g_V(v) \), confirming that \( U \sim N(0,2) \) and \( V \sim N(0,2) \) are independent.
</div>

<div class="example">
<strong>Finding marginal via auxiliary variable.</strong> Suppose \( f(x,y) = e^{-x-y} \) for \( 0 < x < y < \infty \). To find the PDF of \( U = X + Y \), set \( V = X \).

Then \( x = v \), \( y = u - v \), with Jacobian \( |J| = 1 \). The support becomes \( 0 < v < u < \infty \) (from \( 0 < x < y \)).
\[
g(u,v) = e^{-u}, \quad 0 < v < u.
\]
Marginalizing: \( g_U(u) = \int_0^u e^{-u}\,dv = u\,e^{-u} \) for \( u > 0 \), which is \( \text{Gamma}(2, 1) \).
</div>

## 3.4 The MGF Technique

<div class="theorem">
<strong>MGF of a Sum of Independents.</strong> If \( X_1, \ldots, X_n \) are independent random variables, then \( T = \sum_{i=1}^n X_i \) has MGF
\[
M_T(t) = \prod_{i=1}^n M_{X_i}(t).
\]
If additionally the \( X_i \) are identically distributed with common MGF \( M(t) \), then \( M_T(t) = [M(t)]^n \).
</div>

### Important Distributions Derived via MGFs

<div class="definition">
<strong>Chi-Squared Distribution.</strong> If \( Z_1, \ldots, Z_k \stackrel{\text{iid}}{\sim} N(0, 1) \), then
\[
Q = \sum_{i=1}^k Z_i^2 \sim \chi^2(k).
\]
The MGF is \( M_Q(t) = (1 - 2t)^{-k/2} \) for \( t < 1/2 \). Note that \( \chi^2(k) = \text{Gamma}(k/2, 2) \).

If \( Y_i \sim \chi^2(k_i) \) are independent, then \( \sum Y_i \sim \chi^2(\sum k_i) \).
</div>

<div class="theorem">
<strong>Linear Combinations of Independent Normals.</strong> If \( X_i \sim N(\mu_i, \sigma_i^2) \) independently for \( i = 1, \ldots, n \), then
\[
\sum_{i=1}^n a_i X_i \sim N\!\left(\sum_{i=1}^n a_i\mu_i,\; \sum_{i=1}^n a_i^2\sigma_i^2\right).
\]
In particular, if \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \), then \( \bar{X}_n \sim N(\mu, \sigma^2/n) \).
</div>

<div class="definition">
<strong>Student's t-Distribution.</strong> If \( Z \sim N(0, 1) \) and \( Q \sim \chi^2(\nu) \) are independent, then
\[
T = \frac{Z}{\sqrt{Q/\nu}} \sim t(\nu),
\]
the <strong>Student's t-distribution</strong> with \( \nu \) degrees of freedom. Its support is \( (-\infty, \infty) \).
</div>

<div class="definition">
<strong>F-Distribution.</strong> If \( X \sim \chi^2(n) \) and \( Y \sim \chi^2(m) \) are independent, then
\[
\frac{X/n}{Y/m} \sim F(n, m).
\]
Also, if \( X \) and \( Y \) are independent chi-squared, then \( X + Y \sim \chi^2(n + m) \).
</div>

<div class="theorem">
<strong>Sampling from the Normal Distribution.</strong> If \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \), define \( \bar{X} = \frac{1}{n}\sum X_i \) and \( S^2 = \frac{1}{n-1}\sum(X_i - \bar{X})^2 \). Then:

(1) \( \bar{X} \sim N(\mu, \sigma^2/n) \).
(2) \( \frac{(n-1)S^2}{\sigma^2} = \frac{\sum(X_i - \bar{X})^2}{\sigma^2} \sim \chi^2(n-1) \).
(3) \( \bar{X} \) and \( S^2 \) are independent.
(4) \( \frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t(n-1) \).
</div>

<div class="proof">
For (2), the key identity is \( \sum(X_i - \mu)^2 = \sum(X_i - \bar{X})^2 + n(\bar{X} - \mu)^2 \). Since the left side is \( \chi^2(n) \) and \( n(\bar{X}-\mu)^2/\sigma^2 \sim \chi^2(1) \), by independence of \( \bar{X} \) and \( S^2 \), comparing MGFs gives \( (1-2t)^{-n/2} = M_U(t)(1-2t)^{-1/2} \), so \( M_U(t) = (1-2t)^{-(n-1)/2} \), confirming \( \chi^2(n-1) \).

For (4), since \( \frac{\bar{X}-\mu}{\sigma/\sqrt{n}} \sim N(0,1) \) and \( \frac{(n-1)S^2}{\sigma^2} \sim \chi^2(n-1) \) are independent, the ratio has a \( t(n-1) \) distribution by definition.
</div>

# Chapter 4: Limiting and Asymptotic Distributions

## 4.1 Convergence in Distribution

<div class="definition">
<strong>Convergence in Distribution.</strong> Let \( X_1, X_2, \ldots \) be a sequence of random variables with CDFs \( F_1, F_2, \ldots \), and let \( X \) be a random variable with CDF \( F \). We say \( X_n \) <strong>converges in distribution</strong> to \( X \), written \( X_n \xrightarrow{d} X \), if
\[
\lim_{n \to \infty} F_n(x) = F(x)
\]
for all \( x \) at which \( F \) is continuous. The CDF \( F \) is called the <strong>limiting</strong> (or <strong>asymptotic</strong>) <strong>distribution</strong> of the sequence.
</div>

<div class="remark">
Convergence in distribution concerns the CDFs, not the random variables themselves. It does not require that \( X_n \) be "close" to \( X \) in any sample-path sense. The condition is only required at continuity points of \( F \).
</div>

<div class="example">
<strong>Limiting distribution of order statistics.</strong> Let \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} \text{Uniform}(0, 1) \). Then:

For \( nX_{(1)} \): The CDF is \( F_n(x) = 1 - (1 - x/n)^n \) for \( 0 < x < n \). As \( n \to \infty \):
\[
\lim_{n \to \infty} F_n(x) = 1 - e^{-x}, \quad x > 0,
\]
which is the CDF of \( \text{Exponential}(1) \). So \( nX_{(1)} \xrightarrow{d} \text{Exponential}(1) \).

For \( X_{(n)} \): The CDF \( F_n(x) = x^n \) on \( (0,1) \) converges to the degenerate distribution at 1: \( X_{(n)} \xrightarrow{d} 1 \).
</div>

## 4.2 Convergence in Probability

<div class="definition">
<strong>Convergence in Probability.</strong> A sequence \( X_1, X_2, \ldots \) <strong>converges in probability</strong> to a random variable \( X \), written \( X_n \xrightarrow{P} X \), if for every \( \varepsilon > 0 \):
\[
\lim_{n \to \infty} P(|X_n - X| \geq \varepsilon) = 0.
\]
When \( X = b \) is a constant, we write \( X_n \xrightarrow{P} b \).
</div>

<div class="theorem">
<strong>Convergence in probability implies convergence in distribution.</strong> If \( X_n \xrightarrow{P} X \), then \( X_n \xrightarrow{d} X \). The converse is not true in general.

However, for the special case of convergence to a constant:
\[
X_n \xrightarrow{d} b \iff X_n \xrightarrow{P} b.
\]
</div>

## 4.3 The Weak Law of Large Numbers

<div class="theorem">
<strong>Markov's Inequality.</strong> For any random variable \( X \) and constants \( k > 0 \), \( c > 0 \):
\[
P(|X| \geq c) \leq \frac{E[|X|^k]}{c^k}.
\]
The most common case is \( k = 2 \) (Chebyshev's inequality): \( P(|X| \geq c) \leq E[X^2]/c^2 \).
</div>

<div class="theorem">
<strong>Weak Law of Large Numbers (WLLN).</strong> Let \( X_1, X_2, \ldots \) be iid random variables with \( E[X_i] = \mu \) and \( \text{Var}(X_i) = \sigma^2 < \infty \). Then the sample mean
\[
\bar{X}_n = \frac{1}{n}\sum_{i=1}^n X_i \xrightarrow{P} \mu.
\]
</div>

<div class="proof">
By Chebyshev's inequality, for any \( \varepsilon > 0 \):
\[
P(|\bar{X}_n - \mu| \geq \varepsilon) \leq \frac{E[(\bar{X}_n - \mu)^2]}{\varepsilon^2} = \frac{\text{Var}(\bar{X}_n)}{\varepsilon^2} = \frac{\sigma^2}{n\varepsilon^2} \to 0
\]
as \( n \to \infty \). By the squeeze theorem, \( P(|\bar{X}_n - \mu| \geq \varepsilon) \to 0 \).
</div>

<div class="remark">
The WLLN also holds under weaker conditions, for instance when the \( X_i \) are independent (not necessarily identically distributed) with uniformly bounded variances.
</div>

## 4.4 The Central Limit Theorem

<div class="theorem">
<strong>Central Limit Theorem (CLT).</strong> Let \( X_1, X_2, \ldots \) be iid random variables with \( E[X_i] = \mu \) and \( \text{Var}(X_i) = \sigma^2 \in (0, \infty) \). Then
\[
\frac{\sqrt{n}(\bar{X}_n - \mu)}{\sigma} \xrightarrow{d} N(0, 1).
\]
Equivalently, \( \sqrt{n}(\bar{X}_n - \mu) \xrightarrow{d} N(0, \sigma^2) \).
</div>

<div class="proof">
<strong>Proof via MGFs.</strong> Let \( Y_i = (X_i - \mu)/\sigma \), so the \( Y_i \) are iid with \( E[Y_i] = 0 \), \( \text{Var}(Y_i) = 1 \), and MGF \( M_Y(t) \). The MGF of \( \frac{\sqrt{n}(\bar{X}_n - \mu)}{\sigma} = \frac{1}{\sqrt{n}}\sum Y_i \) is
\[
M_n(t) = \left[M_Y\!\left(\frac{t}{\sqrt{n}}\right)\right]^n.
\]
Expanding by Taylor's theorem: \( M_Y(t/\sqrt{n}) = 1 + \frac{t^2}{2n} + o(t^2/n) \). Therefore:
\[
\lim_{n \to \infty}\left[1 + \frac{t^2}{2n} + o\!\left(\frac{t^2}{n}\right)\right]^n = \exp\!\left\{\frac{t^2}{2}\right\},
\]
which is the MGF of \( N(0,1) \). By the MGF convergence theorem, the result follows.
</div>

<div class="theorem">
<strong>MGF Convergence Theorem.</strong> Let \( X_n \) have MGF \( M_n(t) \) and \( X \) have MGF \( M(t) \). If there exists \( h > 0 \) such that \( \lim_{n \to \infty} M_n(t) = M(t) \) for all \( t \in (-h, h) \), then \( X_n \xrightarrow{d} X \).
</div>

## 4.5 Slutsky's Theorem and the Continuous Mapping Theorem

<div class="theorem">
<strong>Continuous Mapping Theorem.</strong> Let \( g(\cdot) \) be a continuous function. Then:

(1) If \( X_n \xrightarrow{P} a \), then \( g(X_n) \xrightarrow{P} g(a) \).
(2) If \( X_n \xrightarrow{d} X \), then \( g(X_n) \xrightarrow{d} g(X) \).
</div>

<div class="theorem">
<strong>Slutsky's Theorem.</strong> If \( X_n \xrightarrow{d} X \) and \( Y_n \xrightarrow{P} b \) (a constant), then:

(a) \( X_n + Y_n \xrightarrow{d} X + b \). (This also holds if \( b \) is replaced by a random variable \( Y \).)
(b) \( X_n Y_n \xrightarrow{d} bX \).
(c) \( X_n / Y_n \xrightarrow{d} X/b \) provided \( b \neq 0 \).
</div>

<div class="example">
<strong>Standardizing with estimated variance.</strong> Let \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} \text{Poisson}(\mu) \). By the CLT,
\[
\frac{\sqrt{n}(\bar{X}_n - \mu)}{\sqrt{\mu}} \xrightarrow{d} N(0, 1).
\]
Since \( \bar{X}_n \xrightarrow{P} \mu \) by the WLLN, the continuous mapping theorem gives \( \sqrt{\mu}/\sqrt{\bar{X}_n} \xrightarrow{P} 1 \). By Slutsky's theorem:
\[
\frac{\sqrt{n}(\bar{X}_n - \mu)}{\sqrt{\bar{X}_n}} = \frac{\sqrt{n}(\bar{X}_n - \mu)}{\sqrt{\mu}} \cdot \frac{\sqrt{\mu}}{\sqrt{\bar{X}_n}} \xrightarrow{d} N(0,1).
\]
</div>

## 4.6 The Delta Method

<div class="theorem">
<strong>Delta Method.</strong> Suppose \( \sqrt{n}(X_n - \theta) \xrightarrow{d} N(0, \sigma^2) \) and \( g \) is differentiable at \( \theta \) with \( g'(\theta) \neq 0 \). Then
\[
\sqrt{n}\left[g(X_n) - g(\theta)\right] \xrightarrow{d} N\!\left(0,\, [g'(\theta)]^2\,\sigma^2\right).
\]
Equivalently, \( g(X_n) \) is approximately \( N(g(\theta),\, [g'(\theta)]^2\sigma^2/n) \) for large \( n \).
</div>

The intuition comes from a first-order Taylor expansion: \( g(X_n) \approx g(\theta) + g'(\theta)(X_n - \theta) \), so
\[
\sqrt{n}[g(X_n) - g(\theta)] \approx g'(\theta)\,\sqrt{n}(X_n - \theta),
\]
and the right side converges to \( g'(\theta) \cdot N(0, \sigma^2) = N(0, [g'(\theta)]^2\sigma^2) \).

<div class="example">
<strong>Delta method for the Poisson.</strong> Let \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} \text{Poisson}(\mu) \). Since \( \text{Var}(X_i) = \mu \), the CLT gives \( \sqrt{n}(\bar{X}_n - \mu) \xrightarrow{d} N(0, \mu) \).

Taking \( g(x) = \sqrt{x} \), so \( g'(x) = \frac{1}{2}x^{-1/2} \) and \( [g'(\mu)]^2 = \frac{1}{4\mu} \):
\[
\sqrt{n}\!\left(\sqrt{\bar{X}_n} - \sqrt{\mu}\right) \xrightarrow{d} N\!\left(0,\, \frac{1}{4\mu} \cdot \mu\right) = N\!\left(0, \frac{1}{4}\right).
\]
This is the <strong>variance-stabilizing transformation</strong> for the Poisson: the asymptotic variance \( 1/4 \) does not depend on \( \mu \).
</div>

<div class="example">
<strong>Delta method for the Exponential.</strong> Let \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} \text{Exponential}(\theta) \). Then \( E[X_i] = \theta \), \( \text{Var}(X_i) = \theta^2 \), and \( \sqrt{n}(\bar{X}_n - \theta) \xrightarrow{d} N(0, \theta^2) \).

For \( g(x) = \ln(x) \), \( g'(\theta) = 1/\theta \), so:
\[
\sqrt{n}(\ln\bar{X}_n - \ln\theta) \xrightarrow{d} N\!\left(0,\, \frac{1}{\theta^2}\cdot\theta^2\right) = N(0, 1).
\]
</div>

## 4.7 Normal Approximations

The CLT enables us to approximate probabilities for sums and means of large samples. If \( X_1, \ldots, X_n \) are iid with mean \( \mu \) and variance \( \sigma^2 \), then for large \( n \):

\[
P\!\left(\bar{X}_n \leq x\right) \approx \Phi\!\left(\frac{x - \mu}{\sigma/\sqrt{n}}\right),
\]

where \( \Phi \) is the standard normal CDF. Similarly for the sum \( T_n = \sum X_i \):
\[
P(T_n \leq t) \approx \Phi\!\left(\frac{t - n\mu}{\sigma\sqrt{n}}\right).
\]

# Chapter 5: Point Estimation

## 5.1 Introduction and Basic Concepts

Suppose \( X_1, \ldots, X_n \) are iid random variables from a distribution with PDF (or PMF) \( f(x; \boldsymbol{\theta}) \), where \( \boldsymbol{\theta} = (\theta_1, \ldots, \theta_k)^\top \) is an unknown parameter vector in the parameter space \( \Theta \). The goal of **point estimation** is to use the observed data to produce a single "best guess" for \( \boldsymbol{\theta} \).

<div class="definition">
<strong>Statistic.</strong> A <strong>statistic</strong> is any function \( T = T(X_1, \ldots, X_n) \) of the data that does not depend on any unknown parameter.
</div>

<div class="definition">
<strong>Estimator and Estimate.</strong> If a statistic \( \hat{\theta} = T(X_1, \ldots, X_n) \) is used to estimate \( \theta \), it is called an <strong>estimator</strong> of \( \theta \). When evaluated at observed data \( (x_1, \ldots, x_n) \), the value \( \hat{\theta}(x_1, \ldots, x_n) \) is called an <strong>estimate</strong>.
</div>

<div class="definition">
<strong>Bias and Unbiasedness.</strong> An estimator \( \hat{\theta} \) is <strong>unbiased</strong> for \( \theta \) if \( E[\hat{\theta}] = \theta \) for all \( \theta \in \Theta \). The <strong>bias</strong> is \( \text{Bias}(\hat{\theta}) = E[\hat{\theta}] - \theta \).
</div>

## 5.2 Method of Moments

<div class="definition">
<strong>Method of Moments (MM) Estimator.</strong> The procedure equates population moments to sample moments and solves for the parameters.

1. <strong>Population moments:</strong> \( \mu_j = E[X^j] = \mu_j(\boldsymbol{\theta}) \) for \( j = 1, \ldots, k \).
2. <strong>Sample moments:</strong> \( \hat{\mu}_j = \frac{1}{n}\sum_{i=1}^n X_i^j \).
3. Solve the system \( \mu_j(\hat{\boldsymbol{\theta}}) = \hat{\mu}_j \) for \( j = 1, \ldots, k \) to obtain \( \hat{\boldsymbol{\theta}}_{\text{MM}} \).
</div>

<div class="example">
<strong>MM for the Exponential.</strong> If \( X_1, \ldots, X_n \stackrel{\text{iid}}{\sim} \text{Exponential}(\theta) \), then \( \mu_1 = E[X] = \theta \). Setting \( \hat{\theta} = \hat{\mu}_1 = \bar{X}_n \) gives the MM estimator \( \hat{\theta}_{\text{MM}} = \bar{X}_n \).
</div>

<div class="example">
<strong>MM for the Uniform.</strong> If \( X_i \stackrel{\text{iid}}{\sim} \text{Uniform}(0, \theta) \), then \( \mu_1 = \theta/2 \). Setting \( \hat{\theta}/2 = \bar{X}_n \) gives \( \hat{\theta}_{\text{MM}} = 2\bar{X}_n \).
</div>

<div class="example">
<strong>MM for the Normal.</strong> If \( X_i \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \), we have two parameters. Using two moment equations:

\( \mu_1(\mu, \sigma^2) = \mu \) and \( \mu_2(\mu, \sigma^2) = \mu^2 + \sigma^2 \).

Setting \( \hat{\mu}_1 = \bar{X}_n \) and \( \hat{\mu}_2 = \frac{1}{n}\sum X_i^2 \):
\[
\hat{\mu}_{\text{MM}} = \bar{X}_n, \qquad \hat{\sigma}^2_{\text{MM}} = \frac{1}{n}\sum_{i=1}^n X_i^2 - \bar{X}_n^2 = \frac{1}{n}\sum_{i=1}^n (X_i - \bar{X}_n)^2.
\]
</div>

## 5.3 Maximum Likelihood Estimation

<div class="definition">
<strong>Likelihood Function.</strong> Given iid observations from \( f(x; \theta) \), the <strong>likelihood function</strong> is
\[
L(\theta) = L(\theta;\, x_1, \ldots, x_n) = \prod_{i=1}^n f(x_i; \theta).
\]
The <strong>log-likelihood</strong> is \( \ell(\theta) = \ln L(\theta) = \sum_{i=1}^n \ln f(x_i; \theta) \).
</div>

<div class="definition">
<strong>Maximum Likelihood Estimator (MLE).</strong> The <strong>MLE</strong> is the value \( \hat{\theta} \) that maximizes \( L(\theta) \) (equivalently, \( \ell(\theta) \)):
\[
\hat{\theta} = \arg\max_{\theta \in \Theta}\, L(\theta) = \arg\max_{\theta \in \Theta}\, \ell(\theta).
\]
</div>

<div class="theorem">
<strong>Invariance Property of the MLE.</strong> If \( \hat{\theta} \) is the MLE of \( \theta \), then for any function \( \tau(\theta) \), the MLE of \( \tau(\theta) \) is \( \tau(\hat{\theta}) \).
</div>

<div class="example">
<strong>MLE for the Poisson.</strong> If \( X_i \stackrel{\text{iid}}{\sim} \text{Poisson}(\theta) \):
\[
\ell(\theta) = \left(\sum x_i\right)\ln\theta - n\theta - \sum\ln(x_i!).
\]
Setting \( \ell'(\theta) = \frac{\sum x_i}{\theta} - n = 0 \) gives \( \hat{\theta}_{\text{ML}} = \bar{X}_n \), the same as the MM estimator.

By invariance, the MLE of \( P(X_1 = 0) = e^{-\theta} \) is \( e^{-\bar{X}_n} \).
</div>

<div class="example">
<strong>MLE for the Normal.</strong> If \( X_i \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \):
\[
\ell(\mu, \sigma^2) = -\frac{n}{2}\ln(2\pi\sigma^2) - \frac{1}{2\sigma^2}\sum_{i=1}^n (x_i - \mu)^2.
\]
Setting partial derivatives to zero yields:
\[
\hat{\mu}_{\text{ML}} = \bar{X}_n, \qquad \hat{\sigma}^2_{\text{ML}} = \frac{1}{n}\sum_{i=1}^n (X_i - \bar{X}_n)^2.
\]
Note that \( \hat{\sigma}^2_{\text{ML}} \) is biased (its expectation is \( \frac{n-1}{n}\sigma^2 \)), unlike the unbiased estimator \( S^2 = \frac{1}{n-1}\sum(X_i - \bar{X}_n)^2 \).
</div>

<div class="example">
<strong>MLE for the Uniform (boundary case).</strong> If \( X_i \stackrel{\text{iid}}{\sim} \text{Uniform}(0, \theta) \), the likelihood is
\[
L(\theta) = \begin{cases} \theta^{-n} & \text{if } 0 \leq x_{(1)} \leq x_{(n)} \leq \theta, \\ 0 & \text{otherwise}. \end{cases}
\]
For \( \theta \geq x_{(n)} \), \( L(\theta) = \theta^{-n} \) is strictly decreasing, so the maximum is at \( \hat{\theta}_{\text{ML}} = X_{(n)} = \max(X_1, \ldots, X_n) \).

This differs from \( \hat{\theta}_{\text{MM}} = 2\bar{X}_n \). The calculus-based approach of setting derivatives to zero does not apply here because the maximum occurs at the boundary of the parameter space.
</div>

<div class="example">
<strong>MLE for a power-law density.</strong> If \( f(x; \theta) = \theta x^{\theta-1} \) for \( 0 < x < 1 \) and \( \theta > 0 \):
\[
\ell(\theta) = n\ln\theta + (\theta - 1)\sum_{i=1}^n \ln x_i.
\]
Setting \( \ell'(\theta) = n/\theta + \sum\ln x_i = 0 \) gives:
\[
\hat{\theta}_{\text{ML}} = -\frac{n}{\sum_{i=1}^n \ln X_i}.
\]
</div>

## 5.4 Properties of the MLE

### Score Function and Information

<div class="definition">
<strong>Score Function.</strong> The <strong>score function</strong> is
\[
S(\theta) = \frac{d}{d\theta}\ell(\theta) = \frac{d}{d\theta}\ln L(\theta).
\]
When the support does not depend on \( \theta \), the MLE satisfies \( S(\hat{\theta}) = 0 \).
</div>

<div class="definition">
<strong>Observed Information.</strong> The <strong>observed information</strong> is
\[
I(\theta) = -\frac{d^2}{d\theta^2}\ell(\theta).
\]
</div>

<div class="definition">
<strong>Fisher Information.</strong> The <strong>Fisher information</strong> (or expected information) is
\[
J(\theta) = E[I(\theta; \mathbf{X})] = -E\!\left[\frac{d^2}{d\theta^2}\ln f(X_1; \theta)\right] \cdot n = n\,J_1(\theta),
\]
where \( J_1(\theta) = -E\!\left[\frac{d^2}{d\theta^2}\ln f(X_1; \theta)\right] \) is the Fisher information from a single observation.
</div>

### The Cramer-Rao Lower Bound

<div class="theorem">
<strong>Cramer-Rao Lower Bound.</strong> If \( \hat{\theta} \) is any unbiased estimator of \( \theta \), then under regularity conditions:
\[
\text{Var}(\hat{\theta}) \geq \frac{1}{J(\theta)} = \frac{1}{n\,J_1(\theta)}.
\]
</div>

<div class="theorem">
<strong>Cramer-Rao Bound for Functions.</strong> If \( T \) is an unbiased estimator of \( g(\theta) \), then
\[
\text{Var}(T) \geq \frac{[g'(\theta)]^2}{J(\theta)}.
\]
</div>

An estimator achieving the Cramer-Rao lower bound is called **efficient** (or a minimum variance unbiased estimator, MVUE).

<div class="example">
<strong>Fisher information for Poisson.</strong> If \( X_i \stackrel{\text{iid}}{\sim} \text{Poisson}(\theta) \):
\[
\ln f(x; \theta) = x\ln\theta - \theta - \ln(x!), \quad \frac{d^2}{d\theta^2}\ln f(x;\theta) = -\frac{x}{\theta^2}.
\]
So \( J_1(\theta) = E[X]/\theta^2 = 1/\theta \), and \( J(\theta) = n/\theta \).

The MLE \( \hat{\theta} = \bar{X}_n \) has \( \text{Var}(\hat{\theta}) = \theta/n = 1/J(\theta) \), which equals the Cramer-Rao bound. Hence \( \bar{X}_n \) is an efficient estimator.
</div>

### Asymptotic Properties of the MLE

<div class="theorem">
<strong>Asymptotic Properties of the MLE.</strong> Under regularity conditions (support independent of \( \theta \), sufficient smoothness):

(1) <strong>Consistency:</strong> \( \hat{\theta} \xrightarrow{P} \theta \) as \( n \to \infty \).

(2) <strong>Asymptotic normality:</strong> \( \sqrt{n}(\hat{\theta} - \theta) \xrightarrow{d} N\!\left(0, \frac{1}{J_1(\theta)}\right) \).

(3) <strong>Asymptotic efficiency:</strong> The MLE achieves the Cramer-Rao lower bound asymptotically, meaning \( \text{Var}(\hat{\theta}) \approx \frac{1}{J(\theta)} \) for large \( n \).

(4) <strong>Delta method extension:</strong> \( \sqrt{n}[g(\hat{\theta}) - g(\theta)] \xrightarrow{d} N\!\left(0, \frac{[g'(\theta)]^2}{J_1(\theta)}\right) \).
</div>

<div class="remark">
Property (2) implies that the MLE is <strong>asymptotically unbiased</strong>, i.e., \( E[\hat{\theta}] \to \theta \) as \( n \to \infty \). Combined with (3), the MLE is <strong>asymptotically optimal</strong> in the sense of achieving the smallest possible variance among all (regular) estimators, at least for large samples.
</div>

<div class="example">
<strong>Complete MLE analysis for Poisson.</strong> Let \( X_i \stackrel{\text{iid}}{\sim} \text{Poisson}(\theta) \).

(i) MLE: \( \hat{\theta} = \bar{X}_n \).
(ii) MLE of \( g(\theta) = e^{-\theta} \): by invariance, \( \hat{g} = e^{-\bar{X}_n} \).
(iii) \( \sqrt{n}(\hat{\theta} - \theta) \xrightarrow{d} N(0, \theta) \) since \( J_1(\theta) = 1/\theta \).
(iv) By delta method with \( g(x) = e^{-x} \), \( g'(\theta) = -e^{-\theta} \):
\[
\sqrt{n}(e^{-\bar{X}_n} - e^{-\theta}) \xrightarrow{d} N(0,\, e^{-2\theta}\theta).
\]
(v) \( \hat{\theta} = \bar{X}_n \) is exactly unbiased: \( E[\bar{X}_n] = \theta \). However, \( e^{-\bar{X}_n} \) is biased for \( e^{-\theta} \) in finite samples, though it is asymptotically unbiased.
</div>

# Chapter 6: Confidence Intervals and Hypothesis Testing

## 6.1 Pivotal Quantities and Confidence Intervals

<div class="definition">
<strong>Pivotal Quantity.</strong> A <strong>pivotal quantity</strong> is a function \( Q(X_1, \ldots, X_n; \theta) \) of the data and the parameter \( \theta \) whose distribution does not depend on any unknown parameters.
</div>

A pivotal quantity is the basis for constructing confidence intervals. The general procedure is:

1. Find a pivotal quantity \( Q \) involving the parameter of interest.
2. Determine constants \( a, b \) such that \( P(a \leq Q \leq b) = 1 - \alpha \).
3. Rearrange the inequality to isolate \( \theta \), obtaining a \( 100(1-\alpha)\% \) confidence interval.

<div class="example">
<strong>CI for a normal mean (known variance).</strong> If \( X_i \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \) with \( \sigma^2 \) known, then
\[
Z = \frac{\bar{X}_n - \mu}{\sigma/\sqrt{n}} \sim N(0, 1)
\]
is a pivotal quantity. A \( 100(1-\alpha)\% \) confidence interval for \( \mu \) is
\[
\bar{X}_n \pm z_{\alpha/2}\,\frac{\sigma}{\sqrt{n}},
\]
where \( z_{\alpha/2} \) is the upper \( \alpha/2 \) quantile of \( N(0,1) \).
</div>

<div class="example">
<strong>CI for a normal mean (unknown variance).</strong> If \( X_i \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \) with \( \sigma^2 \) unknown, the pivot is
\[
T = \frac{\bar{X}_n - \mu}{S/\sqrt{n}} \sim t(n-1),
\]
giving the CI: \( \bar{X}_n \pm t_{\alpha/2, n-1}\,\frac{S}{\sqrt{n}} \).
</div>

<div class="example">
<strong>CI for a normal variance.</strong> The pivot \( \frac{(n-1)S^2}{\sigma^2} \sim \chi^2(n-1) \) yields
\[
\left(\frac{(n-1)S^2}{\chi^2_{\alpha/2, n-1}},\; \frac{(n-1)S^2}{\chi^2_{1-\alpha/2, n-1}}\right)
\]
as a \( 100(1-\alpha)\% \) confidence interval for \( \sigma^2 \).
</div>

### Large-Sample Confidence Intervals via the CLT

When the exact distribution of a pivotal quantity is not available, the CLT and asymptotic normality of the MLE provide approximate confidence intervals. By the asymptotic distribution of the MLE:
\[
\hat{\theta} \;\dot{\sim}\; N\!\left(\theta,\, \frac{1}{nJ_1(\theta)}\right),
\]
so an approximate \( 100(1-\alpha)\% \) CI for \( \theta \) is \( \hat{\theta} \pm z_{\alpha/2}\,\sqrt{1/(nJ_1(\hat{\theta}))} \).

## 6.2 Hypothesis Testing Fundamentals

<div class="definition">
<strong>Hypothesis Test.</strong> A <strong>hypothesis test</strong> consists of:

A <strong>null hypothesis</strong> \( H_0 \) and an <strong>alternative hypothesis</strong> \( H_1 \).
A <strong>test statistic</strong> \( T(X_1, \ldots, X_n) \).
A <strong>rejection region</strong> (critical region) \( C \): reject \( H_0 \) if \( T \in C \).
</div>

<div class="definition">
<strong>Types of Error.</strong>

<strong>Type I error:</strong> Rejecting \( H_0 \) when \( H_0 \) is true. Probability: \( \alpha = P(\text{reject } H_0 \mid H_0 \text{ true}) \).
<strong>Type II error:</strong> Failing to reject \( H_0 \) when \( H_1 \) is true. Probability: \( \beta = P(\text{fail to reject } H_0 \mid H_1 \text{ true}) \).

The <strong>significance level</strong> is \( \alpha \). The <strong>power</strong> of the test is \( 1 - \beta \).
</div>

<div class="definition">
<strong>Simple and Composite Hypotheses.</strong> A hypothesis is <strong>simple</strong> if it specifies the distribution completely (e.g., \( H_0: \theta = \theta_0 \)). It is <strong>composite</strong> if it specifies a set of distributions (e.g., \( H_1: \theta > \theta_0 \)).
</div>

## 6.3 The Neyman-Pearson Lemma

<div class="theorem">
<strong>Neyman-Pearson Lemma.</strong> For testing the simple null \( H_0: \theta = \theta_0 \) against the simple alternative \( H_1: \theta = \theta_1 \) at significance level \( \alpha \), the most powerful test rejects \( H_0 \) when the <strong>likelihood ratio</strong>
\[
\Lambda = \frac{L(\theta_1)}{L(\theta_0)} = \frac{\prod_{i=1}^n f(x_i; \theta_1)}{\prod_{i=1}^n f(x_i; \theta_0)}
\]
exceeds a critical value \( k \), where \( k \) is chosen so that \( P(\Lambda > k \mid H_0) = \alpha \).
</div>

<div class="remark">
The Neyman-Pearson Lemma provides the theoretical justification for likelihood-ratio-based testing. Among all tests with significance level at most \( \alpha \), the likelihood ratio test has the highest power against the specified alternative.
</div>

## 6.4 Likelihood Ratio Tests

For testing composite hypotheses, the **generalized likelihood ratio** is commonly used.

<div class="definition">
<strong>Likelihood Ratio Test Statistic.</strong> For testing \( H_0: \theta \in \Theta_0 \) versus \( H_1: \theta \in \Theta_0^c \), the <strong>likelihood ratio statistic</strong> is
\[
\lambda = \frac{\sup_{\theta \in \Theta_0} L(\theta)}{\sup_{\theta \in \Theta} L(\theta)} = \frac{L(\hat{\theta}_0)}{L(\hat{\theta})},
\]
where \( \hat{\theta}_0 \) is the MLE under \( H_0 \) and \( \hat{\theta} \) is the unrestricted MLE. Note \( 0 \leq \lambda \leq 1 \), and we reject \( H_0 \) for small values of \( \lambda \).
</div>

<div class="theorem">
<strong>Wilks' Theorem (asymptotic distribution).</strong> Under regularity conditions and under \( H_0 \), as \( n \to \infty \):
\[
-2\ln\lambda \xrightarrow{d} \chi^2(r),
\]
where \( r = \dim(\Theta) - \dim(\Theta_0) \) is the number of restrictions imposed by \( H_0 \). This provides a large-sample test: reject \( H_0 \) if \( -2\ln\lambda > \chi^2_{\alpha, r} \).
</div>

<div class="example">
<strong>Testing a normal mean.</strong> For \( X_i \stackrel{\text{iid}}{\sim} N(\mu, \sigma^2) \) with \( \sigma^2 \) known, testing \( H_0: \mu = \mu_0 \) vs. \( H_1: \mu \neq \mu_0 \):

Under \( H_0 \): \( L(\mu_0) \propto \exp\{-\frac{n(\bar{x} - \mu_0)^2}{2\sigma^2}\} \cdot \exp\{-\frac{\sum(x_i - \bar{x})^2}{2\sigma^2}\} \).

Under the full model: \( L(\hat{\mu}) \propto \exp\{-\frac{\sum(x_i - \bar{x})^2}{2\sigma^2}\} \).

The ratio simplifies to \( \lambda = \exp\{-\frac{n(\bar{x} - \mu_0)^2}{2\sigma^2}\} \), and \( -2\ln\lambda = \frac{n(\bar{x} - \mu_0)^2}{\sigma^2} = z^2 \), which has a \( \chi^2(1) \) distribution under \( H_0 \). Equivalently, the test rejects when \( |z| > z_{\alpha/2} \), consistent with the standard two-sided z-test.
</div>

<div class="example">
<strong>Relationship between CIs and tests.</strong> There is a duality between confidence intervals and hypothesis tests. A \( 100(1-\alpha)\% \) confidence interval consists of all parameter values \( \theta_0 \) for which the corresponding level-\( \alpha \) test would not reject \( H_0: \theta = \theta_0 \). Conversely, a level-\( \alpha \) test rejects \( H_0: \theta = \theta_0 \) if and only if \( \theta_0 \) lies outside the \( 100(1-\alpha)\% \) confidence interval.
</div>

## 6.5 Summary of Common Test Statistics

| Setting | Hypotheses | Test Statistic | Distribution under \( H_0 \) |
|---|---|---|---|
| Normal mean, \( \sigma^2 \) known | \( H_0: \mu = \mu_0 \) | \( Z = \frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}} \) | \( N(0,1) \) |
| Normal mean, \( \sigma^2 \) unknown | \( H_0: \mu = \mu_0 \) | \( T = \frac{\bar{X} - \mu_0}{S/\sqrt{n}} \) | \( t(n-1) \) |
| Normal variance | \( H_0: \sigma^2 = \sigma_0^2 \) | \( \chi^2 = \frac{(n-1)S^2}{\sigma_0^2} \) | \( \chi^2(n-1) \) |
| Two normal variances | \( H_0: \sigma_1^2 = \sigma_2^2 \) | \( F = \frac{S_1^2}{S_2^2} \) | \( F(n_1-1, n_2-1) \) |
| Large-sample proportion | \( H_0: p = p_0 \) | \( Z = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/n}} \) | \( N(0,1) \) approx |
