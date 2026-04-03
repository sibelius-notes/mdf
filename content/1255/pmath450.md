---
title: "PMATH 450: Measure Theory (Spring 2025 supplement)"
prof: "Blake Madill"
subjects: "PMATH"
---

## Sources and References

- Donald L. Cohn, <em>Measure Theory</em>, 2nd ed., Birkhäuser, 2013. (Primary textbook — Chapters 4 and 5 are the main references for Radon-Nikodym and dual spaces.)
- Walter Rudin, <em>Real and Complex Analysis</em>, 3rd ed., McGraw-Hill, 1987. (Chapters 6–7 for signed measures, Radon-Nikodym, and \( L^p \) duality.)
- Elias M. Stein and Rami Shakarchi, <em>Real Analysis: Measure Theory, Integration, and Hilbert Spaces</em>, Princeton University Press, 2005. (Chapter 4 for \( L^p \) spaces and duality.)
- Terence Tao, <em>An Introduction to Measure Theory</em>, American Mathematical Society, 2011. (Also available as lecture notes at https://terrytao.wordpress.com/2010/09/19/245a-notes-5-free-probability/ and https://terrytao.files.wordpress.com/2012/12/gsm-126-tao5-measure-book.pdf.)
- MIT OpenCourseWare, 18.125 Measure and Integration (available at https://ocw.mit.edu), lecture notes by various instructors.

---

> **Course revision note.** This Spring 2025 offering is a revised version of PMATH 450 that focuses deeply on advanced measure theory — Signed Measures, Hahn and Jordan Decompositions, the Radon-Nikodym Theorem, Lebesgue Decomposition, duality of \(L^p\) spaces, reflexivity, and weak convergence. The foundational material on Lebesgue measure construction, basic Lebesgue integration, Hilbert spaces, and Fourier analysis that appeared in earlier offerings has been removed and is no longer part of this course. If you need that foundational or Fourier content, it is covered in full in the [Spring 2018 offering of PMATH 450: Lebesgue Integration and Fourier Analysis](/1185/pmath450/).

---

# Chapter 1: Signed Measures and the Radon-Nikodym Theorem

## 1.1 Signed Measures

### 1.1.1 Motivation and Definition

So far in the course, measures have been non-negative set functions. There are natural reasons to consider set functions that can take both positive and negative values — for instance, the difference of two measures, or the distributional derivative of a function of bounded variation. These are called **signed measures**.

<div class="definition">
Let \( (X, \mathcal{M}) \) be a measurable space. A <strong>signed measure</strong> on \( (X, \mathcal{M}) \) is a function \( \nu : \mathcal{M} \to [-\infty, +\infty] \) satisfying:

<ol>
<li>\( \nu(\emptyset) = 0 \).</li>
<li>\( \nu \) assumes at most one of the values \( +\infty \) and \( -\infty \).</li>
<li>For every sequence \( \{E_k\}_{k=1}^\infty \) of pairwise disjoint sets in \( \mathcal{M} \),
\[
\nu\!\left(\bigcup_{k=1}^\infty E_k\right) = \sum_{k=1}^\infty \nu(E_k),
\]
where the series on the right converges absolutely whenever \( \nu\!\left(\bigcup_k E_k\right) \) is finite.
</li>
</ol>
</div>

<div class="remark">
Condition (2) prevents the indeterminate form \( \infty - \infty \). The absolute convergence requirement in condition (3) for finite values is essential: since the union does not depend on ordering of the sets, the sum cannot depend on ordering either, so it must converge absolutely.
</div>

### 1.1.2 Positive, Negative, and Null Sets

<div class="definition">
Let \( \nu \) be a signed measure on \( (X, \mathcal{M}) \).
<ul>
<li>A set \( P \in \mathcal{M} \) is a <strong>positive set</strong> for \( \nu \) if \( \nu(E) \ge 0 \) for every measurable \( E \subseteq P \).</li>
<li>A set \( N \in \mathcal{M} \) is a <strong>negative set</strong> for \( \nu \) if \( \nu(E) \le 0 \) for every measurable \( E \subseteq N \).</li>
<li>A set \( Z \in \mathcal{M} \) is a <strong>null set</strong> for \( \nu \) if \( \nu(E) = 0 \) for every measurable \( E \subseteq Z \).</li>
</ul>
</div>

<div class="remark">
Note the distinction between a null set for a signed measure \( \nu \) and a set of measure zero. A null set is a set on which every measurable subset has measure zero, whereas \( \nu(Z) = 0 \) alone does not guarantee this (cancellation can occur).
</div>

<div class="example">
Let \( f : X \to \mathbb{R} \) be \( \mu \)-integrable (where \( \mu \) is a positive measure), and define
\[
\nu(E) = \int_E f \, d\mu, \quad E \in \mathcal{M}.
\]
Then \( \nu \) is a signed measure. The set \( \{x : f(x) \ge 0\} \) is a positive set for \( \nu \), and \( \{x : f(x) \le 0\} \) is a negative set for \( \nu \).
</div>

### 1.1.3 Key Lemma on Positive Sets

The following lemma is the engine behind the Hahn decomposition.

<div class="theorem">
<strong>Lemma.</strong> Let \( \nu \) be a signed measure and suppose \( E \in \mathcal{M} \) with \( 0 < \nu(E) < +\infty \). Then \( E \) contains a positive set \( P \) with \( \nu(P) > 0 \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> If \( E \) itself is already a positive set, take \( P = E \). Otherwise, there exists a measurable \( F_1 \subseteq E \) with \( \nu(F_1) < 0 \). Let \( n_1 \) be the smallest positive integer such that there exists \( F_1 \subseteq E \) measurable with \( \nu(F_1) \le -1/n_1 \). Set \( E_1 = E \setminus F_1 \); then \( \nu(E_1) = \nu(E) - \nu(F_1) \ge \nu(E) + 1/n_1 > \nu(E) \). Continue this process inductively: at each stage, either the remaining set is positive (done), or extract a set of measure at most \( -1/n_k \) for the smallest such integer \( n_k \). The sets \( F_k \) are disjoint, \( \sum_k \nu(F_k) \le -\sum_k 1/n_k \), and since \( \nu(E) \) is finite, the series converges, so \( n_k \to \infty \). The set \( P = E \setminus \bigcup_k F_k \) is then a positive set with \( \nu(P) = \nu(E) - \sum_k \nu(F_k) \ge \nu(E) > 0 \).
</div>

---

## 1.2 Hahn Decomposition Theorem

<div class="theorem">
<strong>Hahn Decomposition Theorem.</strong> Let \( \nu \) be a signed measure on \( (X, \mathcal{M}) \). Then there exist sets \( P, N \in \mathcal{M} \) such that:
<ol>
<li>\( P \cup N = X \) and \( P \cap N = \emptyset \).</li>
<li>\( P \) is a positive set for \( \nu \) and \( N \) is a negative set for \( \nu \).</li>
</ol>
The pair \( (P, N) \) is called a <strong>Hahn decomposition</strong> of \( X \) with respect to \( \nu \).
</div>

<div class="remark">
The Hahn decomposition is not unique: if \( Z \) is a null set for \( \nu \), then \( (P \cup Z, N \setminus Z) \) is another valid Hahn decomposition. However, decompositions are unique up to null sets, in the sense that if \( (P', N') \) is another Hahn decomposition, then \( P \triangle P' \) and \( N \triangle N' \) are null sets for \( \nu \).
</div>

<div class="proof">
<strong>Proof outline.</strong> Assume without loss of generality that \( \nu \) does not take the value \( +\infty \) (so \( \nu : \mathcal{M} \to (-\infty, +\infty] \)). Define
\[
\lambda = \sup\{ \nu(E) : E \in \mathcal{M},\, E \text{ is a positive set for } \nu \}.
\]
Since \( \emptyset \) is a positive set, \( \lambda \ge 0 \). Choose positive sets \( P_n \) with \( \nu(P_n) \to \lambda \). Let \( P = \bigcup_n P_n \). One verifies that \( P \) is also a positive set (countable unions of positive sets are positive), and \( \nu(P) = \lambda < +\infty \) (since \( \nu \) does not take \( +\infty \)). Set \( N = X \setminus P \). If \( N \) were not a negative set, there would exist \( E \subseteq N \) measurable with \( \nu(E) > 0 \), and by the Key Lemma, \( E \) would contain a positive set \( Q \) with \( \nu(Q) > 0 \). Then \( P \cup Q \) is a positive set with \( \nu(P \cup Q) = \nu(P) + \nu(Q) > \lambda \), contradicting the definition of \( \lambda \). Hence \( N \) is a negative set.
</div>

---

## 1.3 Jordan Decomposition Theorem

### 1.3.1 The Positive and Negative Variations

<div class="definition">
Let \( \nu \) be a signed measure on \( (X, \mathcal{M}) \) with Hahn decomposition \( (P, N) \). The <strong>positive variation</strong> of \( \nu \) is the measure
\[
\nu^+(E) = \nu(E \cap P), \quad E \in \mathcal{M},
\]
and the <strong>negative variation</strong> of \( \nu \) is the measure
\[
\nu^-(E) = -\nu(E \cap N), \quad E \in \mathcal{M}.
\]
The <strong>total variation</strong> of \( \nu \) is
\[
|\nu|(E) = \nu^+(E) + \nu^-(E), \quad E \in \mathcal{M}.
\]
</div>

One checks that \( \nu^+ \) and \( \nu^- \) are genuine (non-negative) measures, and that they are **mutually singular**: \( \nu^+(N) = 0 \) and \( \nu^-(P) = 0 \).

<div class="theorem">
<strong>Jordan Decomposition Theorem.</strong> Every signed measure \( \nu \) can be written uniquely as
\[
\nu = \nu^+ - \nu^-,
\]
where \( \nu^+ \) and \( \nu^- \) are mutually singular positive measures, at least one of which is finite. This is called the <strong>Jordan decomposition</strong> of \( \nu \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Existence follows from the Hahn decomposition: for any \( E \in \mathcal{M} \),
\[
\nu(E) = \nu(E \cap P) + \nu(E \cap N) = \nu^+(E) - \nu^-(E).
\]
For uniqueness: suppose \( \nu = \mu^+ - \mu^- \) with \( \mu^+ \perp \mu^- \). Let \( (A, B) \) be a Hahn decomposition for \( \mu^+ - \mu^- \) arising from \( \mu^+ \perp \mu^- \). Then \( (A, B) \) is also a Hahn decomposition for \( \nu \), and since Hahn decompositions are unique up to null sets, we get \( \mu^+ = \nu^+ \) and \( \mu^- = \nu^- \).
</div>

<div class="remark">
The total variation measure \( |\nu| = \nu^+ + \nu^- \) satisfies \( |\nu|(X) = \nu^+(X) + \nu^-(X) \). The quantity \( \|\nu\| = |\nu|(X) \) is called the <strong>total variation norm</strong> of \( \nu \). The space \( M(X) \) of finite signed measures on a measurable space, equipped with this norm, is a Banach space.
</div>

### 1.3.2 Integration with Respect to Signed Measures

Given a signed measure \( \nu = \nu^+ - \nu^- \), we define integration by
\[
\int f \, d\nu = \int f \, d\nu^+ - \int f \, d\nu^-,
\]
whenever \( f \) is integrable with respect to \( |\nu| \).

---

## 1.4 Absolute Continuity and Mutual Singularity

### 1.4.1 Absolute Continuity

<div class="definition">
Let \( \mu \) be a positive measure and \( \nu \) a signed measure on \( (X, \mathcal{M}) \). We say \( \nu \) is <strong>absolutely continuous</strong> with respect to \( \mu \), written \( \nu \ll \mu \), if
\[
\mu(E) = 0 \implies \nu(E) = 0, \quad \forall E \in \mathcal{M}.
\]
</div>

<div class="example">
If \( f \in L^1(\mu) \) and \( \nu(E) = \int_E f \, d\mu \), then \( \nu \ll \mu \). This is the prototype example.
</div>

<div class="theorem">
<strong>Proposition (equivalent characterization).</strong> Let \( \mu \) be a positive finite measure and \( \nu \) a finite signed measure. Then \( \nu \ll \mu \) if and only if for every \( \varepsilon > 0 \) there exists \( \delta > 0 \) such that
\[
\mu(E) < \delta \implies |\nu(E)| < \varepsilon.
\]
</div>

<div class="remark">
The \( \varepsilon \)-\( \delta \) characterization fails without the finiteness assumption. The implication \( \nu \ll \mu \) always holds (in the sense of the definition), but the quantitative continuity may fail for \( \sigma \)-finite measures.
</div>

### 1.4.2 Mutual Singularity

<div class="definition">
Two signed measures \( \nu \) and \( \mu \) on \( (X, \mathcal{M}) \) are <strong>mutually singular</strong>, written \( \nu \perp \mu \), if there exist disjoint sets \( A, B \in \mathcal{M} \) with \( A \cup B = X \) such that \( |\nu|(B) = 0 \) and \( |\mu|(A) = 0 \).
</div>

Intuitively, \( \nu \) and \( \mu \) "live on" disjoint parts of \( X \).

<div class="example">
Let \( X = \mathbb{R} \), \( \mu = \) Lebesgue measure, and \( \nu = \delta_0 \) (the Dirac measure at 0). Then \( \nu \perp \mu \): take \( A = \{0\} \) (where \( \mu(\{0\}) = 0 \)) and \( B = \mathbb{R} \setminus \{0\} \) (where \( \nu(B) = 0 \)).
</div>

---

## 1.5 Lebesgue Decomposition Theorem

<div class="theorem">
<strong>Lebesgue Decomposition Theorem.</strong> Let \( \mu \) be a \( \sigma \)-finite positive measure and \( \nu \) a \( \sigma \)-finite signed measure on \( (X, \mathcal{M}) \). Then there exists a unique pair of \( \sigma \)-finite signed measures \( \nu_{ac} \) and \( \nu_s \) such that
\[
\nu = \nu_{ac} + \nu_s,
\]
with \( \nu_{ac} \ll \mu \) and \( \nu_s \perp \mu \). This is the <strong>Lebesgue decomposition</strong> of \( \nu \) with respect to \( \mu \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The result follows from the Radon-Nikodym theorem (proved next). One uses the Radon-Nikodym theorem applied to the measure \( \nu^+ + \nu^- + \mu \) and extracts the appropriate components. Alternatively, for positive \( \nu \) and \( \mu \): define \( \lambda = \mu + \nu \). Both \( \mu \) and \( \nu \) are absolutely continuous with respect to \( \lambda \). By Radon-Nikodym, \( d\mu = f \, d\lambda \) and \( d\nu = g \, d\lambda \). Decompose based on whether \( f > 0 \) or \( f = 0 \).
</div>

---

## 1.6 The Radon-Nikodym Theorem

### 1.6.1 Statement

<div class="theorem">
<strong>Radon-Nikodym Theorem.</strong> Let \( (X, \mathcal{M}, \mu) \) be a \( \sigma \)-finite measure space, and let \( \nu \) be a \( \sigma \)-finite signed measure on \( (X, \mathcal{M}) \) with \( \nu \ll \mu \). Then there exists a measurable function \( f : X \to [-\infty, +\infty] \), unique \( \mu \)-almost everywhere, such that
\[
\nu(E) = \int_E f \, d\mu \quad \text{for all } E \in \mathcal{M}.
\]
If \( \nu \) is a positive measure, then \( f \ge 0 \) \( \mu \)-a.e. If \( \nu \) is a finite signed measure, then \( f \in L^1(\mu) \).
</div>

<div class="definition">
The function \( f \) in the Radon-Nikodym theorem is called the <strong>Radon-Nikodym derivative</strong> (or <strong>density</strong>) of \( \nu \) with respect to \( \mu \), and is written
\[
f = \frac{d\nu}{d\mu}.
\]
</div>

<div class="remark">
The hypothesis of \( \sigma \)-finiteness is essential. The theorem fails for non-\( \sigma \)-finite measures: let \( \mu \) be counting measure on \( ([0,1], \mathcal{B}([0,1])) \) and \( \nu \) be Lebesgue measure. Then \( \nu \ll \mu \), but there is no \( L^1(\mu) \) function \( f \) with \( \nu(E) = \int_E f \, d\mu \) for all Borel \( E \).
</div>

### 1.6.2 Proof via Hilbert Space Methods (von Neumann's Argument)

This elegant proof is due to von Neumann and uses the Riesz representation theorem for Hilbert spaces.

<div class="proof">
<strong>Proof (von Neumann / Hilbert space method).</strong> We first handle the case where both \( \mu \) and \( \nu \) are finite positive measures. Let \( \lambda = \mu + \nu \). Since \( \nu \ll \lambda \) and \( \mu \ll \lambda \), consider the Hilbert space \( H = L^2(X, \mathcal{M}, \lambda) \). Define the bounded linear functional
\[
\Phi(g) = \int_X g \, d\nu, \quad g \in L^2(\lambda).
\]
Since \( \nu \le \lambda \), we have \( |\Phi(g)| \le \int |g| \, d\nu \le \int |g| \, d\lambda \le \|g\|_{L^2(\lambda)} \cdot \lambda(X)^{1/2} \) by Cauchy-Schwarz, so \( \Phi \) is a bounded linear functional on \( L^2(\lambda) \). By the Riesz representation theorem for Hilbert spaces, there exists a unique \( h \in L^2(\lambda) \) such that
\[
\int_X g \, d\nu = \int_X g h \, d\lambda = \int_X g h \, d(\mu + \nu), \quad \forall g \in L^2(\lambda).
\]
Rearranging:
\[
\int_X g(1 - h) \, d\nu = \int_X g h \, d\mu.
\]
Taking \( g = \mathbf{1}_E \) shows
\[
\nu(E \cap \{h < 1\}) = \int_E h \, d\mu + \nu(E \cap \{h \ge 1\})\quad(\text{after analysis}).
\]
One shows \( 0 \le h \le 1 \) \( \lambda \)-a.e. and \( \mu(\{h = 1\}) = 0 \) (since otherwise \( \int_{\{h=1\}} h \, d\mu = \mu(\{h=1\}) > 0 \) would force \( \nu(\{h = 1\}) < 0 \), contradiction). Define
\[
f = \frac{h}{1 - h} \cdot \mathbf{1}_{\{h < 1\}}.
\]
Then for any \( E \in \mathcal{M} \):
\[
\nu(E) = \int_E f \, d\mu.
\]
The \( \sigma \)-finite case follows by decomposing \( X \) into countably many finite-measure pieces and applying the finite case on each, then patching together with an appropriate normalization.
</div>

### 1.6.3 The Chain Rule for Radon-Nikodym Derivatives

<div class="theorem">
<strong>Chain Rule.</strong> Let \( \lambda, \mu, \nu \) be \( \sigma \)-finite measures on \( (X, \mathcal{M}) \) with \( \nu \ll \mu \ll \lambda \). Then \( \nu \ll \lambda \) and
\[
\frac{d\nu}{d\lambda} = \frac{d\nu}{d\mu} \cdot \frac{d\mu}{d\lambda} \quad \lambda\text{-a.e.}
\]
</div>

<div class="proof">
<strong>Proof.</strong> For any \( E \in \mathcal{M} \),
\[
\nu(E) = \int_E \frac{d\nu}{d\mu} \, d\mu = \int_E \frac{d\nu}{d\mu} \cdot \frac{d\mu}{d\lambda} \, d\lambda.
\]
By uniqueness of the Radon-Nikodym derivative, \( \frac{d\nu}{d\lambda} = \frac{d\nu}{d\mu} \cdot \frac{d\mu}{d\lambda} \) \( \lambda \)-a.e.
</div>

<div class="theorem">
<strong>Reciprocal Rule.</strong> If \( \mu \ll \nu \) and \( \nu \ll \mu \) (i.e., \( \mu \) and \( \nu \) are mutually absolutely continuous), then
\[
\frac{d\mu}{d\nu} = \left(\frac{d\nu}{d\mu}\right)^{-1} \quad \mu\text{-a.e. (equivalently, } \nu\text{-a.e.)}
\]
</div>

### 1.6.4 Examples

<div class="example">
<strong>Example 1: Lebesgue measure vs. weighted Lebesgue measure.</strong> Let \( \mu = m \) (Lebesgue measure on \( \mathbb{R} \)) and \( \nu(E) = \int_E e^{-x^2} \, dm \). Then \( \nu \ll m \) and \( \frac{d\nu}{dm} = e^{-x^2} \).
</div>

<div class="example">
<strong>Example 2: Absolute continuity on \( \mathbb{R} \).</strong> A signed measure \( \nu \) on \( (\mathbb{R}, \mathcal{B}(\mathbb{R})) \) is absolutely continuous with respect to Lebesgue measure if and only if there exists \( f \in L^1(\mathbb{R}) \) such that \( \nu(E) = \int_E f \, dm \). The Radon-Nikodym derivative is the classical density function familiar from probability theory.
</div>

<div class="example">
<strong>Example 3: Probability and conditional expectation.</strong> In probability theory, if \( (\Omega, \mathcal{F}, P) \) is a probability space and \( \mathcal{G} \subseteq \mathcal{F} \) is a sub-\( \sigma \)-algebra, the conditional expectation \( E[X \mid \mathcal{G}] \) of an integrable random variable \( X \) is precisely the Radon-Nikodym derivative of the measure \( \nu(A) = \int_A X \, dP \) (defined on \( \mathcal{G} \)) with respect to \( P|_{\mathcal{G}} \).
</div>

---

# Chapter 2: Dual Spaces of \( L^p \)

## 2.1 Bounded Linear Functionals on Banach Spaces

### 2.1.1 Recap of Dual Spaces

<div class="definition">
Let \( X \) be a Banach space over \( \mathbb{R} \) (or \( \mathbb{C} \)). A <strong>bounded linear functional</strong> on \( X \) is a linear map \( \ell : X \to \mathbb{R} \) (or \( \mathbb{C} \)) such that
\[
\|\ell\|_{X^*} = \sup_{\|x\| \le 1} |\ell(x)| < \infty.
\]
The space of all bounded linear functionals on \( X \) is called the <strong>dual space</strong>, denoted \( X^* \).
</div>

The dual space \( X^* \) is itself a Banach space under the operator norm \( \|\ell\|_{X^*} \). The central question for \( L^p \) spaces is: what does \( (L^p)^* \) look like concretely?

### 2.1.2 Conjugate Exponents

<div class="definition">
Let \( 1 \le p \le \infty \). The <strong>conjugate exponent</strong> (or <strong>dual exponent</strong>) \( q \) is defined by
\[
\frac{1}{p} + \frac{1}{q} = 1,
\]
with the conventions \( q = \infty \) when \( p = 1 \), and \( q = 1 \) when \( p = \infty \).
</div>

Recall Hölder's inequality: if \( f \in L^p(\mu) \) and \( g \in L^q(\mu) \), then \( fg \in L^1(\mu) \) and
\[
\int |fg| \, d\mu \le \|f\|_p \|g\|_q.
\]
This inequality is what makes integration against \( g \in L^q \) into a bounded functional on \( L^p \).

---

## 2.2 Embedding \( L^q \) into \( (L^p)^* \)

### 2.2.1 The Natural Map

<div class="definition">
Let \( 1 \le p < \infty \) and let \( q \) be the conjugate exponent. For \( g \in L^q(\mu) \), define the functional \( \Phi_g : L^p(\mu) \to \mathbb{R} \) by
\[
\Phi_g(f) = \int_X fg \, d\mu, \quad f \in L^p(\mu).
\]
</div>

<div class="theorem">
<strong>Proposition.</strong> The map \( \Phi_g \) is a bounded linear functional on \( L^p(\mu) \) with
\[
\|\Phi_g\|_{(L^p)^*} = \|g\|_{L^q(\mu)}.
\]
In particular, the map \( \Phi : L^q(\mu) \to (L^p(\mu))^*, \, g \mapsto \Phi_g \), is an isometric embedding.
</div>

<div class="proof">
<strong>Proof.</strong> Linearity is clear. By Hölder's inequality,
\[
|\Phi_g(f)| = \left|\int fg \, d\mu\right| \le \|f\|_p \|g\|_q,
\]
so \( \|\Phi_g\|_{(L^p)^*} \le \|g\|_q \).

For the reverse inequality (showing equality is achieved), we construct the <em>extremal function</em>. If \( g = 0 \), equality is trivial. Otherwise, set
\[
f_0 = |g|^{q-1} \cdot \text{sgn}(g) \cdot \|g\|_q^{1-q}.
\]
Then \( |f_0|^p = |g|^{p(q-1)} \cdot \|g\|_q^{p(1-q)} = |g|^q \cdot \|g\|_q^{-q} \) (using \( p(q-1) = q \)), so
\[
\|f_0\|_p^p = \|g\|_q^{-q} \int |g|^q \, d\mu = 1,
\]
i.e., \( \|f_0\|_p = 1 \). And
\[
\Phi_g(f_0) = \int f_0 g \, d\mu = \|g\|_q^{1-q} \int |g|^q \, d\mu = \|g\|_q^{1-q} \cdot \|g\|_q^q = \|g\|_q.
\]
Hence \( \|\Phi_g\|_{(L^p)^*} \ge \|g\|_q \), giving equality.
</div>

---

## 2.3 Riesz Representation Theorem for \( L^p \)

### 2.3.1 Statement

<div class="theorem">
<strong>Riesz Representation Theorem for \( L^p \).</strong> Let \( (X, \mathcal{M}, \mu) \) be a \( \sigma \)-finite measure space, and let \( 1 \le p < \infty \). Let \( q \) be the conjugate exponent. Then every bounded linear functional \( \ell \in (L^p(\mu))^* \) is of the form
\[
\ell(f) = \int_X fg \, d\mu \quad \forall f \in L^p(\mu)
\]
for a unique \( g \in L^q(\mu) \), and \( \|\ell\|_{(L^p)^*} = \|g\|_{L^q(\mu)} \). That is,
\[
(L^p(\mu))^* \cong L^q(\mu) \quad \text{isometrically.}
\]
</div>

### 2.3.2 Proof Sketch for \( 1 < p < \infty \)

<div class="proof">
<strong>Proof sketch (\( 1 < p < \infty \), \( \sigma \)-finite \( \mu \)).</strong>

<strong>Step 1: Construct a signed measure.</strong> Let \( \ell \in (L^p(\mu))^* \). Define a set function \( \nu : \mathcal{M} \to \mathbb{R} \) by
\[
\nu(E) = \ell(\mathbf{1}_E)
\]
for measurable sets \( E \) with \( \mu(E) < \infty \) (so that \( \mathbf{1}_E \in L^p(\mu) \)). One verifies that \( \nu \) extends to a finite signed measure on \( \mathcal{M} \), and that \( \nu \ll \mu \).

<strong>Step 2: Apply Radon-Nikodym.</strong> By the Radon-Nikodym theorem, there exists a measurable function \( g \) with \( \nu(E) = \int_E g \, d\mu \) for all \( E \). Hence
\[
\ell(\mathbf{1}_E) = \int_E g \, d\mu \quad \text{for all measurable } E \text{ with } \mu(E) < \infty.
\]

<strong>Step 3: Extend to simple functions and \( L^p \).</strong> By linearity, \( \ell(s) = \int sg \, d\mu \) for all simple functions \( s \). Since simple functions are dense in \( L^p \), and both \( \ell \) and \( f \mapsto \int fg \, d\mu \) are bounded (once we show \( g \in L^q \)), equality extends to all of \( L^p \).

<strong>Step 4: Show \( g \in L^q \).</strong> To show \( g \in L^q(\mu) \), truncate: let \( g_n = g \cdot \mathbf{1}_{\{|g| \le n\} \cap E_n} \) where \( E_n \nearrow X \) exhausts \( X \) with \( \mu(E_n) < \infty \). Using the extremal function for each \( g_n \), one derives \( \|g_n\|_q \le \|\ell\|_{(L^p)^*} \) uniformly in \( n \). By the monotone convergence theorem, \( \|g\|_q \le \|\ell\|_{(L^p)^*} < \infty \), so \( g \in L^q \).
</div>

### 2.3.3 Proof for \( p = 1 \)

<div class="proof">
<strong>Proof sketch (\( p = 1 \)).</strong> Given \( \ell \in (L^1(\mu))^* \), define \( \nu(E) = \ell(\mathbf{1}_E) \). One shows \( \nu \ll \mu \) and \( |\nu(E)| \le \|\ell\| \mu(E) \). By Radon-Nikodym, \( d\nu = g \, d\mu \) for some measurable \( g \). The bound on \( \nu \) gives \( |g| \le \|\ell\| \) \( \mu \)-a.e., so \( g \in L^\infty(\mu) \) with \( \|g\|_\infty \le \|\ell\| \). The functional \( f \mapsto \int fg \, d\mu \) then agrees with \( \ell \) on simple functions and extends by density to all of \( L^1 \). Together with the lower bound \( \|\ell\| \le \|g\|_\infty \) (from the isometric embedding direction), we get \( \|\ell\| = \|g\|_\infty \).
</div>

---

## 2.4 The Case \( p = \infty \): \( (L^\infty)^* \supsetneq L^1 \)

<div class="theorem">
<strong>Proposition.</strong> The natural embedding \( \Phi : L^1(\mu) \to (L^\infty(\mu))^* \) defined by \( \Phi_g(f) = \int fg \, d\mu \) is isometric, but it is <em>not</em> surjective in general.
</div>

<div class="proof">
<strong>Proof that \( \Phi \) is not surjective.</strong> Consider \( \mu = m \) (Lebesgue measure on \( [0,1] \)). Let \( C([0,1]) \subseteq L^\infty([0,1]) \) be the subspace of continuous functions. The evaluation functional \( \ell_0(f) = f(0) \) is a bounded linear functional on \( C([0,1]) \) (with \( \|\ell_0\| = 1 \)), and hence extends to a bounded linear functional on \( L^\infty([0,1]) \) by the Hahn-Banach theorem. If this extension \( \ell \) were of the form \( \ell(f) = \int_0^1 fg \, dm \) for some \( g \in L^1 \), then for every continuous \( f \) we would have \( f(0) = \int_0^1 fg \, dm \). But if \( f \) is a continuous function supported away from 0, then \( f(0) = 0 \) and \( \int fg \, dm = 0 \), while taking a sequence of continuous functions \( f_n \to \mathbf{1}_{\{0\}} \) (which is impossible in \( L^1 \) norm sense in a useful way), one can derive a contradiction using the regularity of Lebesgue measure (specifically, every set of positive measure has interior points, so no \( L^1 \) function can represent the Dirac delta).
</div>

<div class="remark">
More precisely: if \( \ell(f) = \int f g \, dm \) for all \( f \in L^\infty \), then for every Borel set \( E \),
\[
\ell(\mathbf{1}_E) = \int_E g \, dm.
\]
Taking \( E_n = (0, 1/n) \), we get \( \ell(\mathbf{1}_{E_n}) = \mathbf{1}_{E_n}(0) = 0 \) (if we define \( f(0) = 0 \) for the relevant functions). But \( \int_{E_n} g \, dm \to 0 \) regardless of \( g \in L^1 \) by absolute continuity of the integral. The actual contradiction arises from a more careful Hahn-Banach argument: the functional "evaluation at 0" cannot equal integration against any \( L^1 \) function, because evaluation at 0 is not even well-defined on equivalence classes in \( L^\infty \) (where functions differing on null sets are identified), yet a functional given by \( L^1 \) integration is insensitive to changes on null sets.

Thus \( (L^\infty)^* \) is strictly larger than \( L^1 \): it also contains "purely finitely additive" signed measures that are not countably additive, corresponding (via the Riesz representation theorem for the dual of \( C(K) \) spaces) to finitely additive measures on \( \mathbb{N} \) or similar objects.
</div>

---

## 2.5 Reflexivity of \( L^p \) for \( 1 < p < \infty \)

<div class="definition">
A Banach space \( X \) is called <strong>reflexive</strong> if the canonical embedding \( \iota : X \to X^{**} \) defined by
\[
\iota(x)(\ell) = \ell(x), \quad x \in X,\, \ell \in X^*,
\]
is surjective (and hence an isometric isomorphism).
</div>

<div class="theorem">
<strong>Theorem.</strong> For \( 1 < p < \infty \) and \( (X, \mathcal{M}, \mu) \) \( \sigma \)-finite, the space \( L^p(\mu) \) is reflexive.
</div>

<div class="proof">
<strong>Proof.</strong> We have \( (L^p)^* \cong L^q \) (by the Riesz representation theorem) and \( (L^q)^* \cong L^p \) (by the same theorem, since \( 1/q + 1/p = 1 \) and \( 1 < q < \infty \)). Thus \( (L^p)^{**} \cong (L^q)^* \cong L^p \). One verifies that the double dual identification is indeed the canonical embedding \( \iota \), so \( L^p \) is reflexive.
</div>

<div class="remark">
The spaces \( L^1 \) and \( L^\infty \) are generally <em>not</em> reflexive. We have \( (L^1)^* \cong L^\infty \), but \( (L^\infty)^* \supsetneq L^1 \), so \( (L^1)^{**} \cong (L^\infty)^* \not\cong L^1 \) in general.
</div>

---

## 2.6 Weak Convergence in \( L^p \)

### 2.6.1 Definition and Basic Properties

<div class="definition">
Let \( 1 \le p < \infty \) and \( (X, \mathcal{M}, \mu) \) be a \( \sigma \)-finite measure space. A sequence \( \{f_n\} \subseteq L^p(\mu) \) converges <strong>weakly</strong> to \( f \in L^p(\mu) \), written \( f_n \rightharpoonup f \), if
\[
\lim_{n \to \infty} \int_X f_n g \, d\mu = \int_X f g \, d\mu \quad \text{for all } g \in L^q(\mu),
\]
where \( 1/p + 1/q = 1 \).
</div>

<div class="remark">
Since every bounded linear functional on \( L^p \) is of the form \( \Phi_g \) for some \( g \in L^q \) (Riesz representation), this is the same as saying \( \ell(f_n) \to \ell(f) \) for every \( \ell \in (L^p)^* \) — the standard definition of weak convergence in a Banach space.
</div>

### 2.6.2 Key Properties of Weak Convergence

<div class="theorem">
<strong>Proposition.</strong> Let \( 1 < p < \infty \) and \( f_n \rightharpoonup f \) weakly in \( L^p(\mu) \). Then:
<ol>
<li><strong>Norm lower semicontinuity:</strong> \( \|f\|_p \le \liminf_{n \to \infty} \|f_n\|_p \).</li>
<li><strong>Boundedness:</strong> \( \sup_n \|f_n\|_p < \infty \) (by the Uniform Boundedness Principle).</li>
<li><strong>Uniqueness:</strong> The weak limit \( f \) is unique.</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (1).</strong> Let \( g_0 \in L^q \) be the extremal function for \( f \): choose \( g_0 = |f|^{p-1} \text{sgn}(f) / \|f\|_p^{p-1} \) (when \( f \ne 0 \)), so that \( \|g_0\|_q = 1 \) and \( \int f g_0 \, d\mu = \|f\|_p \). Then
\[
\|f\|_p = \int f g_0 \, d\mu = \lim_{n \to \infty} \int f_n g_0 \, d\mu \le \liminf_{n \to \infty} \|f_n\|_p \cdot \|g_0\|_q = \liminf_{n \to \infty} \|f_n\|_p.
\]
</div>

### 2.6.3 Strong vs. Weak Convergence

<div class="example">
<strong>Example: Riemann-Lebesgue-type oscillation.</strong> Let \( f_n(x) = \sin(nx) \) on \( [0, 2\pi] \) with Lebesgue measure. Then \( \|f_n\|_2 = \sqrt{\pi} \) for all \( n \) (so there is no strong convergence to 0 in \( L^2 \)), but \( f_n \rightharpoonup 0 \) weakly in \( L^2([0,2\pi]) \), because for any \( g \in L^2 \),
\[
\int_0^{2\pi} g(x) \sin(nx) \, dx \to 0
\]
by the Riemann-Lebesgue lemma. This illustrates that weak convergence is strictly weaker than norm convergence.
</div>

### 2.6.4 Weak Compactness (Banach-Alaoglu Consequence)

<div class="theorem">
<strong>Theorem (Weak Sequential Compactness in \( L^p \)).</strong> For \( 1 < p < \infty \), every bounded sequence in \( L^p(\mu) \) has a weakly convergent subsequence.
</div>

<div class="proof">
<strong>Proof sketch.</strong> By reflexivity of \( L^p \) for \( 1 < p < \infty \), the Banach-Alaoglu theorem (that the closed unit ball in the dual of a Banach space is weak-\(*\) compact) implies that the closed unit ball in \( L^p \) is weakly compact. Since \( L^p \) is reflexive, weak and weak-\(*\) topologies on \( L^p \) coincide, and since \( L^q \) (the predual in this duality) is separable for \( 1 < q < \infty \), the weak topology on bounded subsets of \( L^p \) is metrizable, giving sequential compactness.
</div>

<div class="remark">
This weak sequential compactness is a powerful tool in analysis and PDE theory: to find solutions to variational problems, one often constructs a bounded minimizing sequence \( \{f_n\} \subseteq L^p \), extracts a weakly convergent subsequence \( f_{n_k} \rightharpoonup f \), and then shows \( f \) is actually a minimizer using weak lower semicontinuity of the relevant functional.
</div>

---

## 2.7 Summary and Connections

The following table summarizes the duality picture for \( L^p \) spaces on a \( \sigma \)-finite measure space:

| \( p \) | \( q = p/(p-1) \) | \( (L^p)^* \cong \) | Reflexive? |
|---|---|---|---|
| \( 1 \) | \( \infty \) | \( L^\infty \) | No (in general) |
| \( 1 < p < \infty \) | \( 1 < q < \infty \) | \( L^q \) | Yes |
| \( \infty \) | \( 1 \) | \( \supsetneq L^1 \) | No |

The Radon-Nikodym theorem is the key technical tool that enables the proof of the Riesz representation theorem for \( L^p \): one uses bounded linear functionals to define signed measures (absolutely continuous with respect to \( \mu \)), applies Radon-Nikodym to get a density function \( g \), and then proves \( g \in L^q \) using the boundedness of the functional.
