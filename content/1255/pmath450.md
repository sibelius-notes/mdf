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

## Historical Motivation

The theory of measure and integration underwent a decisive transformation in the first decade of the twentieth century. Before Henri Lebesgue's 1902 doctoral thesis, integration meant the Riemann integral — a construction tied to the geometry of rectangles and the assumption of near-continuity. Lebesgue's crucial insight was to partition the *range* of a function rather than its domain, measuring the size of level sets with a new notion of "length" that could handle wildly discontinuous functions. The resulting Lebesgue integral was far more powerful: it recovered limits under much weaker hypotheses (the Dominated Convergence Theorem), and it turned the space of square-integrable functions into a complete metric space — the Hilbert space \( L^2 \). Lebesgue's construction rested on the concept of a *measure*, a countably additive set function, and the abstract framework quickly revealed that the restriction to non-negative values was an artificial one.

The need for *signed* measures — set functions taking both positive and negative values — arose naturally from physics and from functional analysis. Electric charge distributions on a conductor can be positive in some regions and negative in others; the resulting "charge measure" integrates to give the total charge over any region. More abstractly, the Hahn-Banach theorem and the study of linear functionals on function spaces demanded that one treat differences of measures on the same footing as ordinary measures. The German mathematician Johann Radon (in his 1913 paper) and the Polish mathematician Otto Nikodym (in 1930) gave precise meaning to the "derivative" of one measure with respect to another: if \( \nu \) is absolutely continuous with respect to \( \mu \), there is a density \( f = d\nu/d\mu \) such that \( \nu(E) = \int_E f \, d\mu \) for all measurable sets \( E \). This Radon-Nikodym theorem is the measure-theoretic generalization of the fundamental theorem of calculus, and it is the backbone of modern probability theory, where conditional expectations are defined precisely as Radon-Nikodym derivatives.

The signed measure formalism also provides the right algebraic setting for analysis. The collection \( M(X) \) of all finite signed measures on a measurable space \( (X, \mathcal{M}) \) becomes a real vector space under the natural operations, and the *total variation norm* \( \|\nu\| = |\nu|(X) \) makes \( M(X) \) into a Banach space. This Banach space structure is not merely aesthetic: by the Riesz-Markov-Kakutani theorem, the dual of the space \( C(K) \) of continuous functions on a compact Hausdorff space \( K \) is isometrically isomorphic to \( M(K) \), the space of regular Borel signed measures. Understanding \( M(K) \) thus becomes the key to understanding all bounded linear functionals on \( C(K) \) — a central theme connecting measure theory, functional analysis, and topology.

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

### 1.1.2 Worked Examples of Signed Measures

The abstract definition comes alive through explicit computations. The first family of examples comes from integrating a real-valued function against a positive measure.

<div class="example">
<strong>Example 1.1 (Sine measure on \([0, 2\pi]\)).</strong> Let \( \mu = m \) be Lebesgue measure on \( [0, 2\pi] \) and define
\[
\nu(E) = \int_E \sin(x) \, dm(x), \quad E \in \mathcal{B}([0, 2\pi]).
\]
Since \( f(x) = \sin(x) \) is integrable (and bounded), \( \nu \) is a well-defined signed measure. We compute:

\[
\nu([0, \pi]) = \int_0^{\pi} \sin(x) \, dx = \bigl[-\cos(x)\bigr]_0^{\pi} = -\cos(\pi) + \cos(0) = 1 + 1 = 2.
\]
\[
\nu([\pi, 2\pi]) = \int_{\pi}^{2\pi} \sin(x) \, dx = \bigl[-\cos(x)\bigr]_{\pi}^{2\pi} = -\cos(2\pi) + \cos(\pi) = -1 - 1 = -2.
\]
The total: \( \nu([0, 2\pi]) = 2 + (-2) = 0 \), consistent with the integral of \( \sin \) over a full period.

Now we identify the positive and negative sets. Set \( P = [0, \pi] \) and \( N = [\pi, 2\pi] \). For any measurable \( E \subseteq P = [0, \pi] \), the function \( \sin(x) \ge 0 \) on \( P \), so \( \nu(E) = \int_E \sin(x) \, dx \ge 0 \). Thus \( P \) is a <em>positive set</em> for \( \nu \). Similarly, \( \sin(x) \le 0 \) on \( [\pi, 2\pi] \), so every measurable subset of \( N \) has non-positive \( \nu \)-measure; \( N \) is a <em>negative set</em> for \( \nu \). The pair \( (P, N) = ([0,\pi], [\pi, 2\pi]) \) is a Hahn decomposition of \( [0, 2\pi] \) with respect to \( \nu \).

The Jordan decomposition is:

\[
\nu^+(E) = \nu(E \cap [0,\pi]) = \int_{E \cap [0,\pi]} \sin(x)\,dx, \qquad \nu^-(E) = -\nu(E \cap [\pi, 2\pi]) = \int_{E \cap [\pi,2\pi]} (-\sin x)\,dx.
\]
In particular, \( \nu^+([0,\pi]) = 2 \), \( \nu^-([\pi,2\pi]) = 2 \), and \( |\nu|([0,2\pi]) = \nu^+([0,2\pi]) + \nu^-([0,2\pi]) = 2 + 2 = 4 \).
</div>

<div class="example">
<strong>Example 1.2 (Difference of Dirac measures).</strong> Let \( X = \mathbb{R} \), \( \mathcal{M} = \mathcal{B}(\mathbb{R}) \), \( \mu_1 = \delta_0 \) (the Dirac mass at 0), and \( \mu_2 = \delta_1 \) (the Dirac mass at 1). Define
\[
\nu = \mu_1 - \mu_2 = \delta_0 - \delta_1.
\]
For any Borel set \( E \),

\[
\nu(E) = \mathbf{1}_E(0) - \mathbf{1}_E(1).
\]
We compute \( \nu \) on several sets:
<ul>
<li>\( \nu(\{0\}) = 1 - 0 = 1 \).</li>
<li>\( \nu(\{1\}) = 0 - 1 = -1 \).</li>
<li>\( \nu(\{0,1\}) = 1 - 1 = 0 \).</li>
<li>\( \nu(\mathbb{R} \setminus \{0,1\}) = 0 - 0 = 0 \).</li>
</ul>

The Hahn decomposition: take \( P = \{0\} \cup (\mathbb{R} \setminus \{0,1\}) = \mathbb{R} \setminus \{1\} \) and \( N = \{1\} \). Check: every measurable \( F \subseteq P \) satisfies \( \nu(F) = \mathbf{1}_F(0) \ge 0 \), so \( P \) is a positive set. Every measurable \( F \subseteq N = \{1\} \) satisfies \( \nu(F) = -\mathbf{1}_F(1) \le 0 \), so \( N \) is a negative set. The Jordan decomposition:

\[
\nu^+ = \delta_0, \qquad \nu^- = \delta_1, \qquad |\nu| = \delta_0 + \delta_1.
\]
One verifies \( \nu^+ \perp \nu^- \) (they live on \( \{0\} \) and \( \{1\} \) respectively, which are disjoint), and \( \|\nu\| = |\nu|(\mathbb{R}) = 2 \).
</div>

### 1.1.3 Positive, Negative, and Null Sets

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

### 1.1.4 Key Lemma on Positive Sets

The following lemma is the engine behind the Hahn decomposition.

<div class="theorem">
<strong>Lemma.</strong> Let \( \nu \) be a signed measure and suppose \( E \in \mathcal{M} \) with \( 0 < \nu(E) < +\infty \). Then \( E \) contains a positive set \( P \) with \( \nu(P) > 0 \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> If \( E \) itself is already a positive set, take \( P = E \). Otherwise, there exists a measurable \( F_1 \subseteq E \) with \( \nu(F_1) < 0 \). Let \( n_1 \) be the smallest positive integer such that there exists \( F_1 \subseteq E \) measurable with \( \nu(F_1) \le -1/n_1 \). Set \( E_1 = E \setminus F_1 \); then \( \nu(E_1) = \nu(E) - \nu(F_1) \ge \nu(E) + 1/n_1 > \nu(E) \). Continue this process inductively: at each stage, either the remaining set is positive (done), or extract a set of measure at most \( -1/n_k \) for the smallest such integer \( n_k \). The sets \( F_k \) are disjoint, \( \sum_k \nu(F_k) \le -\sum_k 1/n_k \), and since \( \nu(E) \) is finite, the series converges, so \( n_k \to \infty \). The set \( P = E \setminus \bigcup_k F_k \) is then a positive set with \( \nu(P) = \nu(E) - \sum_k \nu(F_k) \ge \nu(E) > 0 \).
</div>

---

## 1.2 Hahn Decomposition Theorem

The Hahn decomposition theorem is the structural foundation of the theory of signed measures. Intuitively, it says that every signed measure is — in a precise, global sense — the difference of its positive and negative parts, concentrated on disjoint regions of the space. One can always partition \( X \) into a "positive half" where \( \nu \) behaves like a positive measure and a "negative half" where \( \nu \) behaves like the negative of a positive measure. This is the signed-measure analogue of writing a real number as the difference of its positive and negative parts: \( x = x^+ - x^- \) where \( x^+ = \max(x,0) \) and \( x^- = \max(-x,0) \).

<div class="theorem">
<strong>Hahn Decomposition Theorem.</strong> Let \( \nu \) be a signed measure on \( (X, \mathcal{M}) \). Then there exist sets \( P, N \in \mathcal{M} \) such that:
<ol>
<li>\( P \cup N = X \) and \( P \cap N = \emptyset \).</li>
<li>\( P \) is a positive set for \( \nu \) and \( N \) is a negative set for \( \nu \).</li>
</ol>
The pair \( (P, N) \) is called a <strong>Hahn decomposition</strong> of \( X \) with respect to \( \nu \).
</div>

<div class="proof">
<strong>Full proof.</strong> Without loss of generality, assume \( \nu \) does not take the value \( +\infty \) (so \( \nu : \mathcal{M} \to (-\infty, +\infty] \); the other case is symmetric). Define
\[
\lambda = \sup\{ \nu(E) : E \in \mathcal{M},\, E \text{ is a positive set for } \nu \}.
\]

<em>Step 1: \( \lambda \) is finite.</em> Since \( \emptyset \) is a positive set with \( \nu(\emptyset) = 0 \), we have \( \lambda \ge 0 \). Suppose \( P_1, P_2 \) are positive sets. Then \( P_1 \cup P_2 \) is also a positive set: for any measurable \( E \subseteq P_1 \cup P_2 \), write \( E = (E \cap P_1) \cup (E \cap P_2 \setminus P_1) \). Since \( E \cap P_1 \subseteq P_1 \) and \( E \cap P_2 \setminus P_1 \subseteq P_2 \), both have non-negative \( \nu \)-measure, so \( \nu(E) \ge 0 \). Thus countable unions of positive sets are positive. Now, \( \lambda < +\infty \): since \( \nu(X) \le \nu(P) + 0 \) for any positive set \( P \) (the complement contributes \( \le 0 \)), and \( \nu \) does not take \( +\infty \), we have \( \lambda \le \sup_P \nu(P) \le \nu(X) + \text{const} < +\infty \). (A cleaner argument: if \( \lambda = +\infty \), pick positive sets \( P_n \) with \( \nu(P_n) \ge n \); the union \( P = \bigcup P_n \) is positive with \( \nu(P) = +\infty \), contradicting that \( \nu \) does not attain \( +\infty \).)

<em>Step 2: Construct the positive set \( P \) achieving \( \lambda \).</em> Choose positive sets \( P_n \) with \( \nu(P_n) \to \lambda \). Let \( P = \bigcup_{n=1}^\infty P_n \). Since \( P \) is a countable union of positive sets, \( P \) is itself a positive set. Moreover,
\[
\nu(P) \ge \nu(P_n) \quad \text{for all } n
\]
(because \( P_n \subseteq P \) and \( P \) is positive, so \( \nu(P) = \nu(P_n) + \nu(P \setminus P_n) \ge \nu(P_n) \)). Letting \( n \to \infty \), \( \nu(P) \ge \lambda \). But \( \nu(P) \le \lambda \) by definition of \( \lambda \). Thus \( \nu(P) = \lambda \).

<em>Step 3: \( N = X \setminus P \) is a negative set.</em> Suppose for contradiction that \( N \) is not a negative set. Then there exists a measurable \( E \subseteq N \) with \( \nu(E) > 0 \). Since \( \nu(E) \) is finite (because \( \nu \) does not take \( +\infty \) and \( \nu(E) > 0 \)), by the Key Lemma, \( E \) contains a positive set \( Q \) with \( \nu(Q) > 0 \). Since \( Q \subseteq N = X \setminus P \), the set \( P \cup Q \) is a positive set (disjoint union of two positive sets) with
\[
\nu(P \cup Q) = \nu(P) + \nu(Q) = \lambda + \nu(Q) > \lambda,
\]
contradicting the definition of \( \lambda \). Therefore \( N \) is a negative set.

<em>Step 4: Uniqueness up to null sets.</em> If \( (P', N') \) is another Hahn decomposition, consider \( E = P \setminus P' = P \cap N' \). As a subset of \( P \), \( E \) is a subset of a positive set, so \( \nu(E) \ge 0 \). As a subset of \( N' \), \( E \) is a subset of a negative set, so \( \nu(E) \le 0 \). Hence \( \nu(E) = 0 \), and for any measurable \( F \subseteq E \), the same argument gives \( \nu(F) = 0 \). Thus \( E \) is a null set for \( \nu \), and by symmetry so is \( P' \setminus P \). Therefore \( P \triangle P' = (P \setminus P') \cup (P' \setminus P) \) is a null set, and similarly for \( N \triangle N' \).
</div>

<div class="example">
<strong>Example: Hahn decomposition for the sine measure.</strong> Let \( \nu \) be the signed measure \( d\nu = \sin(x)\,dx \) on \( [0, 2\pi] \) from Example 1.1. We showed that \( P = [0, \pi] \) is a positive set and \( N = [\pi, 2\pi] \) is a negative set. The Jordan decomposition is:
\[
\nu^+(E) = \int_{E \cap [0,\pi]} \sin(x)\,dx, \qquad \nu^-(E) = \int_{E \cap [\pi, 2\pi]} (-\sin x)\,dx.
\]
Explicitly: \( \nu^+([0,\pi]) = 2 \), \( \nu^+(\text{anything in } [\pi,2\pi]) = 0 \); \( \nu^-([\pi,2\pi]) = 2 \), \( \nu^-(\text{anything in } [0,\pi]) = 0 \). The measures \( \nu^+ \) and \( \nu^- \) are mutually singular (they live on disjoint sets \( [0,\pi] \) and \( [\pi,2\pi] \)), and \( \nu = \nu^+ - \nu^- \) as required.
</div>

<div class="remark">
The Hahn decomposition theorem connects to later material as follows. The Jordan decomposition \( \nu = \nu^+ - \nu^- \) defined via the Hahn decomposition gives the canonical way to reduce questions about signed measures to questions about positive measures. In Section 1.3, we use the Hahn decomposition to state the Radon-Nikodym theorem for signed measures: if \( \nu \ll \mu \), then both \( \nu^+ \ll \mu \) and \( \nu^- \ll \mu \), and we can find densities \( f^+ = d\nu^+/d\mu \) and \( f^- = d\nu^-/d\mu \), giving the overall density \( f = f^+ - f^- \).
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

<div class="example">
<strong>Example: Lebesgue decomposition of \( \delta_0 + m|_{[0,1]} \).</strong> Let \( X = \mathbb{R} \), let \( \mu = m \) be Lebesgue measure, and let
\[
\nu = \delta_0 + m|_{[0,1]},
\]
where \( m|_{[0,1]} \) denotes Lebesgue measure restricted to \( [0,1] \): \( m|_{[0,1]}(E) = m(E \cap [0,1]) \).

We claim the Lebesgue decomposition of \( \nu \) with respect to \( m \) is:

\[
\nu_{ac} = m|_{[0,1]}, \qquad \nu_s = \delta_0.
\]
Verification: (i) \( \nu_{ac} \ll m \): if \( m(E) = 0 \), then \( m(E \cap [0,1]) = 0 \), so \( \nu_{ac}(E) = 0 \). \checkmark. (ii) \( \nu_s = \delta_0 \perp m \): take \( A = \{0\} \) and \( B = \mathbb{R} \setminus \{0\} \). Then \( m(A) = 0 \) (so \( \nu_s \) lives on \( A \)) and \( \delta_0(B) = 0 \) (so \( m \) lives on \( B \)). \checkmark. (iii) \( \nu_{ac} + \nu_s = m|_{[0,1]} + \delta_0 = \nu \). \checkmark.

The Radon-Nikodym derivative of the absolutely continuous part is \( d\nu_{ac}/dm = \mathbf{1}_{[0,1]} \). The singular part \( \delta_0 \) has no Radon-Nikodym derivative with respect to Lebesgue measure — it is a point mass on a set of Lebesgue measure zero.
</div>

---

## 1.6 The Radon-Nikodym Theorem

### 1.6.1 Motivation

The Radon-Nikodym theorem is the measure-theoretic version of the fundamental theorem of calculus for abstract measures. Recall that for a function \( F : [a,b] \to \mathbb{R} \) that is absolutely continuous, the classical fundamental theorem guarantees the existence of a derivative \( f = F' \in L^1 \) such that \( F(x) - F(a) = \int_a^x f(t)\,dt \). The signed measure \( \nu(E) = F(b) - F(a) \) (for intervals \( E = [a,b] \)) is absolutely continuous with respect to Lebesgue measure, and the Radon-Nikodym theorem says that such an \( f \) exists in full generality: whenever \( \nu \ll \mu \), the "derivative" \( d\nu/d\mu \) exists as an \( L^1(\mu) \) function. The notation \( d\nu/d\mu \) is not merely suggestive — it satisfies a genuine chain rule (see Section 1.6.3), making the analogy with classical differentiation exact.

### 1.6.2 Statement

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

### 1.6.3 Fully Worked Example

<div class="example">
<strong>Example: Polynomial density on \([0,1]\).</strong> Let \( \mu = m \) be Lebesgue measure on \( [0,1] \) and define
\[
\nu(E) = \int_E 3x^2 \, dm(x), \quad E \in \mathcal{B}([0,1]).
\]

<strong>Step 1: Verify \( \nu \ll \mu \).</strong> If \( m(E) = 0 \), then \( \nu(E) = \int_E 3x^2\,dx = 0 \), since the integral of a bounded measurable function over a null set is zero. So \( \nu \ll m \). \checkmark

<strong>Step 2: Identify the Radon-Nikodym derivative.</strong> By definition, \( f = d\nu/dm \) is the function satisfying \( \nu(E) = \int_E f\,dm \) for all \( E \). Comparing with the definition of \( \nu \), we read off immediately:
\[
\frac{d\nu}{dm} = 3x^2.
\]
We verify: \( \nu([0,1]) = \int_0^1 3x^2\,dx = [x^3]_0^1 = 1 \). Also \( \nu([0, 1/2]) = \int_0^{1/2} 3x^2\,dx = [x^3]_0^{1/2} = 1/8 \).

<strong>Step 3: Change of variables formula.</strong> The Radon-Nikodym theorem implies the following change-of-variables identity: for any \( \nu \)-integrable function \( g \),
\[
\int_X g \, d\nu = \int_X g \cdot \frac{d\nu}{d\mu} \, d\mu.
\]
Take \( g(x) = x \). Then:

\[
\int_{[0,1]} x \, d\nu = \int_0^1 x \cdot 3x^2 \, dx = \int_0^1 3x^3 \, dx = \left[\frac{3x^4}{4}\right]_0^1 = \frac{3}{4}.
\]
One can verify this directly: \( \int x\,d\nu \) represents the "expected value of \( x \)" under the probability measure \( \nu \) (note \( \nu([0,1]) = 1 \)), which is the mean of the distribution with density \( 3x^2 \) — a standard computation giving \( 3/4 \).
</div>

### 1.6.4 Proof via Hilbert Space Methods (von Neumann's Argument)

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

### 1.6.5 The Chain Rule for Radon-Nikodym Derivatives

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

<div class="example">
<strong>Chain rule in action.</strong> Let \( \lambda = m \) (Lebesgue measure on \( [0,1] \)), let \( d\mu = 2x\,dm \) (so \( d\mu/dm = 2x \)), and let \( d\nu = 6x^2\,dm \) (so \( d\nu/dm = 6x^2 \)). Since \( \nu \ll \mu \) (both are absolutely continuous with respect to \( m \)), the chain rule gives
\[
\frac{d\nu}{dm} = \frac{d\nu}{d\mu} \cdot \frac{d\mu}{dm} \implies 6x^2 = \frac{d\nu}{d\mu} \cdot 2x \implies \frac{d\nu}{d\mu} = 3x.
\]
Verification: \( \nu(E) = \int_E 6x^2\,dx \) and \( \int_E 3x\,d\mu = \int_E 3x \cdot 2x\,dx = \int_E 6x^2\,dx \). \checkmark
</div>

<div class="theorem">
<strong>Reciprocal Rule.</strong> If \( \mu \ll \nu \) and \( \nu \ll \mu \) (i.e., \( \mu \) and \( \nu \) are mutually absolutely continuous), then
\[
\frac{d\mu}{d\nu} = \left(\frac{d\nu}{d\mu}\right)^{-1} \quad \mu\text{-a.e. (equivalently, } \nu\text{-a.e.)}
\]
</div>

### 1.6.6 Further Examples

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

### 2.2.2 Extremal Function for \( p = 2 \): Worked Example

For \( p = q = 2 \), the duality is self-duality of the Hilbert space \( L^2 \). The following example illustrates concretely how a functional determines its representing function.

<div class="example">
<strong>Example: Riesz representation for \( L^2([0,1]) \).</strong> Let \( \ell : L^2([0,1]) \to \mathbb{R} \) be the bounded linear functional defined by
\[
\ell(f) = \int_0^1 f(x) \cdot 2x \, dx.
\]
We claim the representing function is \( g(x) = 2x \), and we verify all properties.

<strong>Finding \( g \):</strong> By the Riesz representation theorem for \( L^2 \), the unique \( g \in L^2([0,1]) \) satisfying \( \ell(f) = \int_0^1 fg\,dx \) for all \( f \in L^2 \) is \( g(x) = 2x \). Indeed, \( \ell(f) = \int_0^1 f(x) \cdot 2x\,dx \), so \( g \) is read off directly.

<strong>Verifying the norm:</strong>
\[
\|g\|_2^2 = \int_0^1 (2x)^2 \, dx = \int_0^1 4x^2 \, dx = \left[\frac{4x^3}{3}\right]_0^1 = \frac{4}{3}.
\]
So \( \|g\|_2 = \sqrt{4/3} = \frac{2}{\sqrt{3}} \).

<strong>Verifying the extremal function:</strong> For \( p = q = 2 \), the extremal function achieving \( \|\ell\| = \|g\|_2 \) is
\[
f_0(x) = \frac{g(x)}{\|g\|_2} = \frac{2x}{2/\sqrt{3}} = \sqrt{3}\, x.
\]
Check: \( \|f_0\|_2^2 = \int_0^1 3x^2\,dx = 1 \). \checkmark. And:

\[
\ell(f_0) = \int_0^1 \sqrt{3}\,x \cdot 2x\,dx = 2\sqrt{3}\int_0^1 x^2\,dx = \frac{2\sqrt{3}}{3} = \frac{2}{\sqrt{3}} = \|g\|_2.
\]
So \( \|\ell\| = \|g\|_2 = \frac{2}{\sqrt{3}} = \sqrt{\frac{4}{3}} \). \checkmark

<strong>Uniqueness of \( g \):</strong> Suppose \( g' \in L^2([0,1]) \) also represents \( \ell \). Then \( \int_0^1 f(g - g')\,dx = 0 \) for all \( f \in L^2 \). Taking \( f = g - g' \) gives \( \|g - g'\|_2^2 = 0 \), so \( g = g' \) a.e. The representing function is unique.
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

<div class="example">
<strong>Banach limit: a bounded functional on \( \ell^\infty \) not represented by \( \ell^1 \).</strong> To see concretely that \( (\ell^\infty)^* \supsetneq \ell^1 \) in the sequence-space setting, consider the Banach limit \( \mathrm{LIM} : \ell^\infty \to \mathbb{R} \). A <em>Banach limit</em> is a bounded linear functional on \( \ell^\infty(\mathbb{N}) \) satisfying:
<ol>
<li>\( \mathrm{LIM}(x) \ge 0 \) whenever \( x_n \ge 0 \) for all \( n \) (positivity).</li>
<li>\( \mathrm{LIM}(Sx) = \mathrm{LIM}(x) \) for all \( x \), where \( S \) is the shift \( (Sx)_n = x_{n+1} \) (shift-invariance).</li>
<li>\( \mathrm{LIM}(x) = \lim_{n \to \infty} x_n \) whenever the ordinary limit exists (consistency).</li>
</ol>
The existence of Banach limits follows from the Hahn-Banach theorem applied to the ordinary limit functional on the subspace of convergent sequences (which is dominated by \( \|x\|_\infty \)), extending shift-invariantly to all of \( \ell^\infty \). Since a Banach limit is shift-invariant, if it were represented by \( y = (y_1, y_2, \ldots) \in \ell^1 \), then \( \mathrm{LIM}(x) = \sum_n y_n x_n \) for all \( x \in \ell^\infty \). Shift-invariance would require \( \sum_n y_n x_{n+1} = \sum_n y_n x_n \) for all \( x \), which forces \( y_n = y_{n+1} \) for all \( n \) (by choosing appropriate \( x \)). A constant nonzero sequence is not in \( \ell^1 \), so no such \( y \in \ell^1 \) can exist. Therefore Banach limits lie in \( (\ell^\infty)^* \setminus \ell^1 \).
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

---

# Chapter 3: Modes of Convergence

## 3.1 The Four Modes and Their Relationships

In measure theory and analysis, sequences of functions can converge in several distinct senses, and understanding the relationships between these modes is essential for applying theorems correctly. The four principal modes are: (1) uniform convergence, (2) convergence almost everywhere (a.e.), (3) convergence in measure, and (4) convergence in \( L^p \) norm. These are not equivalent, and their precise relationships form a web of implications and counterexamples that every analyst must internalize.

The diagram of implications is:

\[
\text{uniform} \implies \text{a.e.} \implies \text{in measure}; \qquad L^p \implies \text{in measure}; \qquad \text{a.e.} + \text{dominated} \implies L^p.
\]
None of the reverse implications holds in general, and counterexamples are instructive.

<div class="definition">
Let \( (X, \mathcal{M}, \mu) \) be a measure space and \( f_n, f : X \to \mathbb{R} \) measurable.
<ul>
<li><strong>Uniform convergence:</strong> \( f_n \to f \) uniformly if \( \sup_{x \in X} |f_n(x) - f(x)| \to 0 \).</li>
<li><strong>A.e. convergence:</strong> \( f_n \to f \) a.e. if \( \mu(\{x : f_n(x) \not\to f(x)\}) = 0 \).</li>
<li><strong>Convergence in measure:</strong> \( f_n \to f \) in measure if for every \( \varepsilon > 0 \), \( \mu(\{x : |f_n(x) - f(x)| > \varepsilon\}) \to 0 \).</li>
<li><strong>\( L^p \) convergence:</strong> \( f_n \to f \) in \( L^p \) if \( \|f_n - f\|_p \to 0 \).</li>
</ul>
</div>

<div class="theorem">
<strong>Proposition (Implications between modes).</strong>
<ol>
<li>Uniform convergence \( \implies \) a.e. convergence.</li>
<li>A.e. convergence on a finite measure space \( \implies \) convergence in measure (Egoroff's theorem gives more: a.e. convergence \( \implies \) almost uniform convergence \( \implies \) convergence in measure).</li>
<li>\( L^p \) convergence \( \implies \) convergence in measure (by Markov's inequality: \( \mu(|f_n - f| > \varepsilon) \le \varepsilon^{-p}\|f_n - f\|_p^p \to 0 \)).</li>
<li>A.e. convergence + dominated convergence hypothesis \( \implies \) \( L^p \) convergence.</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (3).</strong> By Markov's inequality applied to \( |f_n - f|^p \):
\[
\mu(\{|f_n - f| > \varepsilon\}) = \mu(\{|f_n - f|^p > \varepsilon^p\}) \le \frac{1}{\varepsilon^p} \int |f_n - f|^p \, d\mu = \frac{\|f_n - f\|_p^p}{\varepsilon^p} \to 0.
\]
</div>

## 3.2 The Typewriter Sequence

The following example is the canonical counterexample showing that convergence in measure does not imply a.e. convergence, and that \( L^p \) convergence does not imply a.e. convergence.

<div class="example">
<strong>The Typewriter Sequence.</strong> Let \( X = [0,1] \) with Lebesgue measure \( m \). Define the sequence \( \{f_n\} \) by "sliding indicators across \( [0,1] \) repeatedly at finer and finer scales":

For \( n \ge 1 \), write \( n = 2^k + j \) where \( 0 \le j < 2^k \). Define

\[
f_n = \mathbf{1}_{[j/2^k, (j+1)/2^k]}.
\]
Explicitly, the first several terms are:
<ul>
<li>\( f_1 = \mathbf{1}_{[0,1]} \) (whole interval, \( k=0, j=0 \)).</li>
<li>\( f_2 = \mathbf{1}_{[0,1/2]} \), \( f_3 = \mathbf{1}_{[1/2,1]} \) (halves, \( k=1 \)).</li>
<li>\( f_4 = \mathbf{1}_{[0,1/4]} \), \( f_5 = \mathbf{1}_{[1/4,1/2]} \), \( f_6 = \mathbf{1}_{[1/2,3/4]} \), \( f_7 = \mathbf{1}_{[3/4,1]} \) (quarters, \( k=2 \)).</li>
</ul>
The name "typewriter sequence" comes from the image of a cursor scanning left to right across progressively finer subdivisions of the interval.

<strong>Convergence in measure:</strong> For any \( \varepsilon \in (0,1) \),
\[
m(\{f_n > \varepsilon\}) = m([j/2^k, (j+1)/2^k]) = 1/2^k \to 0
\]
as \( n \to \infty \) (since \( k \to \infty \)). So \( f_n \to 0 \) in measure. \checkmark

<strong>No a.e. convergence:</strong> For any fixed \( x \in [0,1] \), the value \( f_n(x) \) is 1 for infinitely many \( n \) (the \( n \) for which the sliding window covers \( x \) at each scale) and 0 for infinitely many others. Formally, for any \( k \ge 1 \), there exists \( j \in \{0,\ldots,2^k-1\} \) with \( x \in [j/2^k, (j+1)/2^k] \), giving a term in the sequence equal to 1. So \( \limsup_{n} f_n(x) = 1 \) and \( \liminf_n f_n(x) = 0 \) for every \( x \in [0,1] \). Thus \( f_n \) does not converge at any point — \( f_n \not\to 0 \) a.e. (and in fact not pointwise anywhere).

<strong>No \( L^1 \) convergence:</strong> \( \|f_n - 0\|_1 = \int_0^1 f_n\,dx = 1/2^k \to 0 \). Wait — actually this goes to 0! So \( f_n \to 0 \) in \( L^1 \). This is consistent: \( L^p \) convergence does not imply a.e. convergence. The typewriter sequence converges in \( L^p \) to 0 (for all \( p < \infty \)) but does not converge a.e. anywhere. This is the sharpest illustration that \( L^p \) convergence and a.e. convergence are genuinely different.
</div>

<div class="remark">
The typewriter sequence shows all the following at once: (a) convergence in measure \( \not\Rightarrow \) a.e. convergence; (b) \( L^p \) convergence \( \not\Rightarrow \) a.e. convergence; (c) a.e. convergence \( \not\Rightarrow \) \( L^p \) convergence (using a different example, e.g., \( g_n = n \cdot \mathbf{1}_{[0,1/n]} \to 0 \) a.e. but \( \|g_n\|_1 = 1 \not\to 0 \)).
</div>

---

# Chapter 4: Vitali Convergence Theorem

## 4.1 Uniform Integrability

The Dominated Convergence Theorem requires a single dominating function. The Vitali Convergence Theorem replaces this with a more flexible condition — *uniform integrability* — that captures the essential content of domination without requiring a fixed bound.

<div class="definition">
Let \( (X, \mathcal{M}, \mu) \) be a measure space and \( \{f_n\} \subseteq L^1(\mu) \). The sequence \( \{f_n\} \) is called <strong>uniformly integrable</strong> if:
<ol>
<li><strong>Tight at infinity:</strong> For every \( \varepsilon > 0 \) there exists \( M > 0 \) such that
\[
\int_{\{|f_n| > M\}} |f_n| \, d\mu < \varepsilon \quad \text{for all } n.
\]
</li>
<li><strong>Absolutely equicontinuous:</strong> For every \( \varepsilon > 0 \) there exists \( \delta > 0 \) such that
\[
\mu(E) < \delta \implies \int_E |f_n| \, d\mu < \varepsilon \quad \text{for all } n.
\]
</li>
</ol>
</div>

<div class="remark">
On a finite measure space, the Dunford-Pettis theorem characterizes weakly precompact subsets of \( L^1 \) as exactly the uniformly integrable sets. Uniform integrability is thus a "tightness" condition in the functional-analytic sense. If \( \{|f_n|\} \) is dominated by a single \( g \in L^1 \), then \( \{f_n\} \) is automatically uniformly integrable.
</div>

## 4.2 Statement and Proof

<div class="theorem">
<strong>Vitali Convergence Theorem.</strong> Let \( (X, \mathcal{M}, \mu) \) be a finite measure space and \( 1 \le p < \infty \). Let \( f_n, f \in L^p(\mu) \). Then \( f_n \to f \) in \( L^p(\mu) \) if and only if:
<ol>
<li>\( f_n \to f \) in measure, and</li>
<li>\( \{|f_n|^p\} \) is uniformly integrable.
</li>
</ol>
</div>

<div class="proof">
<strong>Proof (\( p = 1 \), forward direction).</strong> Assume \( \|f_n - f\|_1 \to 0 \). Then \( f_n \to f \) in measure (by Markov). For uniform integrability: given \( \varepsilon > 0 \), choose \( N \) large enough that \( \|f_n - f\|_1 < \varepsilon/2 \) for \( n \ge N \). The finite set \( \{f_1, \ldots, f_N, f\} \) is automatically uniformly integrable (finite sets of \( L^1 \) functions are always uniformly integrable). Using the triangle inequality \( |f_n| \le |f_n - f| + |f| \), one controls \( \int_E |f_n|\,d\mu \le \|f_n - f\|_1 + \int_E |f|\,d\mu < \varepsilon \) for \( n \ge N \) when \( \mu(E) < \delta \) for appropriate \( \delta \). The finitely many remaining terms \( n < N \) are handled by the finite collection.

<strong>Proof (\( p = 1 \), reverse direction).</strong> Assume \( f_n \to f \) in measure and \( \{f_n\} \) is uniformly integrable. Given \( \varepsilon > 0 \), let \( \delta \) be as in the uniform integrability condition. Let \( E_n = \{|f_n - f| > \varepsilon\} \). Since \( f_n \to f \) in measure, \( \mu(E_n) \to 0 \), so \( \mu(E_n) < \delta \) for large \( n \). Then:
\[
\|f_n - f\|_1 = \int_{E_n} |f_n - f|\,d\mu + \int_{E_n^c} |f_n - f|\,d\mu \le \int_{E_n} |f_n|\,d\mu + \int_{E_n} |f|\,d\mu + \varepsilon \cdot \mu(X).
\]
The first term is \( < \varepsilon \) by uniform integrability (since \( \mu(E_n) < \delta \)). For the second term, \( \int_{E_n} |f|\,d\mu \to 0 \) by absolute continuity of the integral of \( f \). So \( \limsup_n \|f_n - f\|_1 \le 2\varepsilon + \varepsilon \cdot \mu(X) \). Since \( \varepsilon \) is arbitrary, \( \|f_n - f\|_1 \to 0 \).
</div>

## 4.3 Typewriter Sequence Fails Vitali

<div class="example">
<strong>Typewriter sequence and Vitali's theorem.</strong> Recall the typewriter sequence \( f_n = \mathbf{1}_{[j/2^k, (j+1)/2^k]} \) on \( [0,1] \). We showed \( f_n \to 0 \) in \( L^1 \) (with \( \|f_n\|_1 = 1/2^k \to 0 \)) and in measure. The Vitali conditions are satisfied: \( \{f_n\} \) is uniformly integrable (in fact dominated by 1), and \( f_n \to 0 \) in measure. The Vitali theorem then predicts \( L^1 \) convergence — which we already verified directly.

Now consider a modified sequence where Vitali fails. Let \( h_n = 2^k \cdot \mathbf{1}_{[j/2^k,(j+1)/2^k]} \) (where again \( n = 2^k + j \)). Then \( \|h_n\|_1 = 2^k \cdot (1/2^k) = 1 \) for all \( n \), and \( h_n \to 0 \) in measure (since \( m(\{h_n > \varepsilon\}) = 1/2^k \to 0 \)). But \( h_n \not\to 0 \) in \( L^1 \) (since \( \|h_n\|_1 = 1 \not\to 0 \)). By Vitali's theorem, \( \{h_n\} \) must fail to be uniformly integrable. Indeed: take \( M = 1 \). Then \( \int_{\{h_n > M\}} h_n \, dm = \int_{[j/2^k,(j+1)/2^k]} 2^k \, dm = 1 \), which does not go to zero — confirming failure of uniform integrability at infinity.
</div>

<div class="remark">
The Vitali theorem sharpens our understanding of why the DCT works: when \( |f_n| \le g \in L^1 \), the dominated condition implies uniform integrability automatically. Vitali is strictly more general: it characterizes \( L^p \) convergence without requiring a single dominating function.
</div>

---

# Problem Sets

## Problem Set A: Signed Measures — Hahn and Jordan Decompositions

These five problems develop facility with signed measures, Hahn decompositions, and Jordan decompositions. For each, work carefully with definitions.

**Problem A.1.** Let \( f(x) = x^3 - x \) on \( [-1, 1] \) and define \( \nu(E) = \int_E f\,dm \) for Borel \( E \subseteq [-1,1] \).

(a) Find all zeros of \( f \) in \( [-1,1] \). Identify positive and negative sets for \( \nu \).

(b) Write down the Hahn decomposition \( (P, N) \) of \( [-1,1] \) with respect to \( \nu \).

(c) Compute \( \nu^+([-1,1]) \), \( \nu^-([-1,1]) \), and \( |\nu|([-1,1]) \) explicitly.

(d) Verify the Jordan decomposition \( \nu = \nu^+ - \nu^- \) by checking \( \nu(\{x : f(x) > 0\}) \) and \( \nu(\{x : f(x) < 0\}) \).

---

**Problem A.2.** Let \( \mu_1 \) and \( \mu_2 \) be positive finite measures on \( (X, \mathcal{M}) \) and set \( \nu = 3\mu_1 - 2\mu_2 \).

(a) Show that \( \nu \) is a signed measure.

(b) If \( (P, N) \) is a Hahn decomposition of \( \nu \), show that \( \nu^+(E) = \nu(E \cap P) \le 3\mu_1(E) \) for all \( E \).

(c) Express \( |\nu|(X) \) in terms of \( \mu_1 \) and \( \mu_2 \).

(d) Give a counterexample showing that in general \( |\nu| \ne 3\mu_1 + 2\mu_2 \). (Hint: consider the case \( \mu_1 = \mu_2 \).)

---

**Problem A.3.** Let \( \nu \) be a signed measure on \( (X, \mathcal{M}) \).

(a) Show that if \( P_1 \) and \( P_2 \) are both positive sets for \( \nu \), then so is \( P_1 \cup P_2 \).

(b) Show that if \( \{P_n\}_{n=1}^\infty \) is a sequence of positive sets, then \( \bigcup_n P_n \) is a positive set. (Careful: use countable additivity.)

(c) Conclude that there exists a "maximal" positive set — a positive set of maximal \( \nu \)-measure. (This is the construction in the proof of Hahn's theorem.)

(d) Is a subset of a positive set always a positive set? Prove or give a counterexample.

---

**Problem A.4.** Uniqueness of the Hahn decomposition.

Let \( \nu \) be a signed measure on \( (X, \mathcal{M}) \), and suppose \( (P, N) \) and \( (P', N') \) are two Hahn decompositions.

(a) Show that \( P \triangle P' = (P \setminus P') \cup (P' \setminus P) \) is a null set for \( \nu \).

(b) Show that \( \nu^+ \) and \( \nu^- \), as defined via either decomposition, are the same measures. (That is, the Jordan decomposition is uniquely determined even though the Hahn decomposition is not.)

(c) Give an explicit example of a signed measure with two distinct (but null-set-equivalent) Hahn decompositions.

---

**Problem A.5.** The total variation norm makes \( M(X) \) a Banach space.

Let \( M(X) \) denote the space of finite signed measures on \( (X, \mathcal{M}) \).

(a) Verify that \( \|\nu\| = |\nu|(X) \) defines a norm on \( M(X) \): positivity, homogeneity, and the triangle inequality. (For the triangle inequality, use the Jordan decompositions of \( \nu \) and \( \mu \).)

(b) Show that \( M(X) \) is complete under this norm. (Hint: Given a Cauchy sequence \( \nu_n \), show that the limit \( \nu(E) = \lim_n \nu_n(E) \) defines a signed measure, and that \( \|\nu_n - \nu\| \to 0 \).)

(c) Explain why \( M(X) \) is not a lattice in general (i.e., the pointwise supremum of two elements of \( M(X) \) need not be in \( M(X) \)).

---

## Problem Set B: Radon-Nikodym Theorem and Densities

**Problem B.1.** Let \( \mu = m \) be Lebesgue measure on \( [0,1] \) and let \( \nu \) be the measure defined by \( \nu(E) = \int_E x(1-x)\,dx \).

(a) Find \( d\nu/dm \).

(b) Compute \( \int_{[0,1]} e^x \, d\nu \) using the change-of-variables formula \( \int g\,d\nu = \int g\,(d\nu/dm)\,dm \).

(c) Compute \( \int_{[0,1]} e^x\,dm \) and verify that the two integrals are different, explaining why.

---

**Problem B.2.** Let \( \mu \) be counting measure on \( \mathbb{N} \) and let \( \nu(\{n\}) = 1/n^2 \). Extend \( \nu \) to all subsets of \( \mathbb{N} \) by countable additivity.

(a) Show \( \nu \ll \mu \) and find \( d\nu/d\mu \).

(b) Compute \( \int_{\mathbb{N}} f\,d\nu \) for \( f(n) = n \) using the Radon-Nikodym derivative. Does this integral converge?

(c) Now let \( \lambda(\{n\}) = 1/n \). Find \( d\nu/d\lambda \) using the chain rule.

---

**Problem B.3.** Let \( \mu = m \) on \( [0, \infty) \) and define \( \nu(E) = \int_E e^{-t}\,dt \). Let \( F(x) = \nu([0,x]) \).

(a) Compute \( F(x) \) explicitly and verify that \( F \) is an absolutely continuous function with \( F'(x) = e^{-x} = d\nu/dm \).

(b) Now let \( G(x) = \nu^+(E) \) where \( \nu^+, \nu^- \) are defined via the Jordan decomposition. What are \( \nu^+ \) and \( \nu^- \) for this measure?

(c) Show that the Lebesgue decomposition of \( \nu \) with respect to \( m \) has \( \nu_s = 0 \) (i.e., \( \nu \) is purely absolutely continuous with respect to \( m \)).

---

**Problem B.4.** The chain rule.

Let \( \lambda = m \) on \( [0,1] \), let \( d\mu = \phi\,dm \) where \( \phi(x) = 4x^3 \), and let \( d\nu = \psi\,dm \) where \( \psi(x) = 12x^5 \).

(a) Verify \( \nu \ll \mu \ll \lambda \).

(b) Compute \( d\mu/d\lambda \) and \( d\nu/d\lambda \) directly.

(c) Use the chain rule to compute \( d\nu/d\mu \), and verify your answer by checking \( \int_E (d\nu/d\mu)\,d\mu = \nu(E) \) for \( E = [0,1/2] \).

---

**Problem B.5.** Failure of Radon-Nikodym without \( \sigma \)-finiteness.

Let \( X = [0,1] \), \( \mathcal{M} = \mathcal{B}([0,1]) \), \( \mu = \) counting measure (so \( \mu(E) = |E| \) if \( E \) is finite, \( \infty \) otherwise), and \( \nu = m \) (Lebesgue measure).

(a) Show that \( \nu \ll \mu \) (any set with counting-measure zero has Lebesgue measure zero).

(b) Suppose for contradiction that there exists a measurable \( f \ge 0 \) with \( \nu(E) = \int_E f\,d\mu \) for all \( E \). By taking \( E = \{x\} \) for each \( x \), show \( f(x) = 0 \) for all \( x \).

(c) Show that \( f \equiv 0 \) gives \( \int_E f\,d\mu = 0 \ne m(E) \) for \( E = [0,1] \). Conclude that the Radon-Nikodym theorem fails, and identify where the hypotheses break down.

---

## Problem Set C: \( L^p \) Duality and Riesz Representation

**Problem C.1.** Let \( \mu = m \) on \( [0,1] \) and define the functional \( \ell : L^3([0,1]) \to \mathbb{R} \) by

\[
\ell(f) = \int_0^1 f(x) \cdot x^2\,dx.
\]

(a) Identify the conjugate exponent \( q \) for \( p = 3 \).

(b) Find the representing function \( g \in L^q([0,1]) \) such that \( \ell(f) = \int fg\,dm \).

(c) Compute \( \|g\|_q \) and verify that \( \|\ell\| = \|g\|_q \).

(d) Find the extremal function \( f_0 \in L^3([0,1]) \) with \( \|f_0\|_3 = 1 \) and \( \ell(f_0) = \|\ell\| \).

---

**Problem C.2.** Let \( \mu \) be counting measure on \( \{1, 2, 3, \ldots\} \), so \( L^p(\mu) = \ell^p \). Let \( \ell : \ell^2 \to \mathbb{R} \) be defined by

\[
\ell(x) = \sum_{n=1}^\infty \frac{x_n}{n}.
\]

(a) Show that \( \ell \) is a bounded linear functional on \( \ell^2 \).

(b) Find the representing sequence \( y \in \ell^2 \) (so that \( \ell(x) = \sum x_n y_n \)).

(c) Compute \( \|\ell\|_{(\ell^2)^*} = \|y\|_2 = \left(\sum 1/n^2\right)^{1/2} = \pi/\sqrt{6} \).

---

**Problem C.3.** Reflexivity.

(a) Show directly (using the Riesz representation theorem twice) that \( L^2(\mu) \) is reflexive for any \( \sigma \)-finite \( \mu \).

(b) Give an explicit example of a bounded sequence in \( L^2([0,1]) \) that has no strongly convergent subsequence, but does have a weakly convergent subsequence.

(c) Use the weak sequential compactness of \( L^2 \) to show: if \( \{f_n\} \subseteq L^2([0,1]) \) with \( \sup_n \|f_n\|_2 \le 1 \), then there exists a subsequence \( f_{n_k} \rightharpoonup f \) weakly, and \( \|f\|_2 \le 1 \).

---

**Problem C.4.** Non-reflexivity of \( L^1 \).

Let \( \mu = m \) on \( [0,1] \).

(a) Show that the sequence \( f_n = n \cdot \mathbf{1}_{[0,1/n]} \) is bounded in \( L^1 \) (in fact \( \|f_n\|_1 = 1 \)).

(b) Show that \( f_n \rightharpoonup^* \delta_0 \) in the weak-\(*\) sense: \( \int_0^1 f_n g\,dm \to g(0) \) for all continuous \( g \).

(c) Explain why this does not contradict the Riesz representation theorem for \( L^1 \) (since \( \delta_0 \notin L^1 \)), but does show that \( L^1 \) is not reflexive.

---

**Problem C.5.** The Riesz representation theorem for \( L^p \), \( 1 < p < \infty \).

Let \( (X, \mathcal{M}, \mu) \) be \( \sigma \)-finite and \( 1 < p < \infty \). Let \( \ell \in (L^p)^* \) be a bounded linear functional with \( \ell \ne 0 \).

(a) Show that the set function \( \nu(E) = \ell(\mathbf{1}_E) \) (for \( \mu(E) < \infty \)) defines a finite signed measure that is absolutely continuous with respect to \( \mu \).

(b) Apply the Radon-Nikodym theorem to obtain \( g \) with \( \nu(E) = \int_E g\,d\mu \).

(c) Show \( g \in L^q \) by the truncation argument, using that \( \|g_n\|_q \le \|\ell\| \) for each truncation \( g_n \).

(d) Conclude \( \ell(f) = \int fg\,d\mu \) for all \( f \in L^p \), and verify the norm identity \( \|\ell\| = \|g\|_q \).

---

## Problem Set D: Weak Convergence

**Problem D.1.** Weak convergence in \( L^2 \).

Let \( f_n(x) = \sin(nx) \) on \( [0, 2\pi] \) with Lebesgue measure.

(a) Show \( f_n \rightharpoonup 0 \) weakly in \( L^2([0,2\pi]) \) using the Riemann-Lebesgue lemma.

(b) Show \( f_n \not\to 0 \) strongly in \( L^2([0,2\pi]) \) by computing \( \|f_n\|_2 \).

(c) Does \( f_n^2 \rightharpoonup 0 \) weakly in \( L^1([0,2\pi]) \)? Compute \( \int_0^{2\pi} \sin^2(nx) g(x)\,dx \) for \( g \equiv 1 \) and determine the weak limit of \( f_n^2 \).

---

**Problem D.2.** Weak but not strong convergence.

Let \( e_n = \mathbf{1}_{[n,n+1]} \) on \( [0,\infty) \) with Lebesgue measure.

(a) Show \( \|e_n\|_2 = 1 \) for all \( n \).

(b) Show \( e_n \rightharpoonup 0 \) weakly in \( L^2([0,\infty)) \). (For any \( g \in L^2 \), \( \int_n^{n+1} g(x)\,dx \to 0 \) by the absolute continuity of \( \int |g|^2 \).)

(c) Show \( e_n \not\to 0 \) strongly.

(d) This gives an example of a sequence on the closed unit ball of \( L^2 \) with no strongly convergent subsequence. Reconcile this with the Bolzano-Weierstrass theorem (which fails in infinite-dimensional spaces).

---

**Problem D.3.** Properties of the weak limit.

Suppose \( f_n \rightharpoonup f \) weakly in \( L^p(\mu) \) with \( 1 < p < \infty \).

(a) Prove \( \|f\|_p \le \liminf_n \|f_n\|_p \) (weak lower semicontinuity of the norm).

(b) Show that if additionally \( \|f_n\|_p \to \|f\|_p \), then \( f_n \to f \) strongly in \( L^p \). (This is the Radon-Riesz property, sometimes called the Kadec-Klee property for \( L^p \).)

(c) Give an explicit example where weak convergence holds and \( \|f_n\|_p \to \|f\|_p \) but \( f_n \to f \) pointwise nowhere.

---

**Problem D.4.** Weak convergence and nonlinear functionals.

Let \( f_n \rightharpoonup f \) in \( L^2([0,1]) \).

(a) Does \( f_n^2 \rightharpoonup f^2 \) in \( L^1([0,1]) \) necessarily? Give a proof or counterexample.

(b) Does \( \|f_n^2 - f^2\|_1 \to 0 \) necessarily? Give a proof or counterexample.

(c) Show that \( \int_0^1 f_n^2\,dx \ge \int_0^1 f^2\,dx \) for all large \( n \) (i.e., weak lower semicontinuity of the \( L^2 \) norm squared).

---

**Problem D.5.** Weak convergence via duality.

Let \( \sin(nx) \to 0 \) weakly in \( L^2([0,\pi]) \).

(a) Compute \( \int_0^\pi \sin(nx)\cos(mx)\,dx \) for fixed \( m \ge 1 \) using integration by parts or product-to-sum formulas, and verify that this goes to 0 as \( n \to \infty \).

(b) Show that the Fourier series \( \sum_{n=1}^\infty a_n \sin(nx) \) with \( a_n \in \ell^2 \) defines an element of \( L^2([0,\pi]) \) via Parseval's identity.

(c) Use weak convergence to give a one-line proof that \( \int_0^\pi P(x)\sin(nx)\,dx \to 0 \) for any polynomial \( P \), without explicit computation.

---

# Chapter 5: Connections to Other Areas

## 5.1 Signed Measures and Functional Analysis: The Riesz-Markov-Kakutani Theorem

The theory of signed measures connects deeply to functional analysis through the Riesz-Markov-Kakutani theorem. Let \( K \) be a compact Hausdorff space and \( C(K) \) the Banach space of continuous real-valued functions on \( K \) with the supremum norm. The dual space \( C(K)^* \) — the space of all bounded linear functionals on \( C(K) \) — is isometrically isomorphic to the space \( M(K) \) of regular Borel signed measures on \( K \):

\[
C(K)^* \cong M(K) \quad \text{isometrically,}
\]
where the duality pairing is \( \langle \ell, f \rangle = \int_K f \, d\nu \) for \( \nu \in M(K) \).

<div class="theorem">
<strong>Riesz-Markov-Kakutani Theorem.</strong> Let \( K \) be a compact Hausdorff space. For every bounded linear functional \( \ell \in C(K)^* \) there exists a unique regular Borel signed measure \( \nu \in M(K) \) such that
\[
\ell(f) = \int_K f \, d\nu \quad \text{for all } f \in C(K),
\]
and \( \|\ell\|_{C(K)^*} = |\nu|(K) = \|\nu\|_{M(K)} \).
</div>

<div class="remark">
This theorem is the "topological" analogue of the Riesz representation theorem for \( L^p \) spaces. The key difference is that \( C(K) \) is not an \( L^p \) space in general (there is no underlying measure), so the Radon-Nikodym theorem does not directly apply. Instead, the proof uses regularity of Borel measures on compact Hausdorff spaces and a separate positivity argument. The theorem is fundamental in harmonic analysis (where \( K = \mathbb{T} \), the circle), probability theory (where positive linear functionals correspond to probability measures, giving the classical Riesz representation for probability), and operator theory.
</div>

## 5.2 Radon-Nikodym and Conditional Expectation in Probability

The Radon-Nikodym theorem is the measure-theoretic foundation of conditional expectation, one of the central concepts in probability theory. Given a probability space \( (\Omega, \mathcal{F}, P) \) and an integrable random variable \( X \), and given a sub-\( \sigma \)-algebra \( \mathcal{G} \subseteq \mathcal{F} \), the conditional expectation \( E[X \mid \mathcal{G}] \) is defined as the unique \( \mathcal{G} \)-measurable function satisfying

\[
\int_A E[X \mid \mathcal{G}] \, dP = \int_A X \, dP \quad \text{for all } A \in \mathcal{G}.
\]
This is precisely the Radon-Nikodym derivative: consider the measure \( \nu(A) = \int_A X\,dP \) defined on \( \mathcal{G} \). Since \( \nu \ll P|_{\mathcal{G}} \), the Radon-Nikodym theorem guarantees a unique \( \mathcal{G} \)-measurable density, which is \( E[X \mid \mathcal{G}] \).

<div class="example">
<strong>Example: Conditional expectation as Radon-Nikodym derivative.</strong> Let \( \Omega = [0,1] \), \( \mathcal{F} = \mathcal{B}([0,1]) \), \( P = m \) (Lebesgue measure), and \( X(\omega) = \omega \) (the identity random variable). Let \( \mathcal{G} = \{\emptyset, [0,1/2], (1/2,1], [0,1]\} \) be the two-atom sub-\( \sigma \)-algebra.

The conditional expectation \( E[X \mid \mathcal{G}] \) is constant on each atom:

\[
E[X \mid \mathcal{G}](\omega) = \frac{\int_{[0,1/2]} X\,dP}{P([0,1/2])} \cdot \mathbf{1}_{[0,1/2]}(\omega) + \frac{\int_{(1/2,1]} X\,dP}{P((1/2,1])} \cdot \mathbf{1}_{(1/2,1]}(\omega).
\]
Computing: \( \int_0^{1/2} \omega\,d\omega = 1/8 \), \( P([0,1/2]) = 1/2 \), so the first constant is \( \frac{1/8}{1/2} = 1/4 \). Similarly \( \int_{1/2}^1 \omega\,d\omega = 3/8 \), giving \( \frac{3/8}{1/2} = 3/4 \). So

\[
E[X \mid \mathcal{G}](\omega) = \frac{1}{4} \mathbf{1}_{[0,1/2]}(\omega) + \frac{3}{4} \mathbf{1}_{(1/2,1]}(\omega).
\]
This is indeed the Radon-Nikodym derivative of \( \nu(A) = \int_A \omega\,d\omega \) (defined on \( \mathcal{G} \)) with respect to Lebesgue measure restricted to \( \mathcal{G} \).
</div>

## 5.3 \( L^p \) Duality and PDE Theory

The duality of \( L^p \) spaces is foundational in the theory of partial differential equations, particularly in the study of weak solutions. A function \( u \) is a *weak solution* of the PDE \( Lu = f \) (where \( L \) is a differential operator) if

\[
\int_\Omega u \cdot L^* \phi \, dx = \int_\Omega f \phi \, dx \quad \text{for all test functions } \phi \in C_c^\infty(\Omega),
\]
where \( L^* \) is the formal adjoint of \( L \). This is precisely a statement about a bounded linear functional on a suitable \( L^p \) or Sobolev space. The Riesz representation theorem (or its Sobolev-space analogue, the Lax-Milgram theorem) guarantees the existence of such a \( u \) by showing that the functional \( \phi \mapsto \int f\phi \) is bounded on an appropriate function space.

Reflexivity plays a central role: because \( L^2 \) is reflexive, every bounded sequence of approximate solutions has a weakly convergent subsequence. The weak limit is then a candidate for the true solution. This strategy — bound, extract weakly, verify — is the backbone of the direct method in the calculus of variations and modern PDE theory.

## 5.4 Weak Convergence and the Calculus of Variations

The calculus of variations asks: minimize a functional \( J[u] = \int_\Omega F(x, u, \nabla u)\,dx \) over some admissible class of functions. The direct method proceeds as follows:

1. Take a minimizing sequence \( \{u_n\} \) with \( J[u_n] \to \inf J \).
2. Show \( \{u_n\} \) is bounded in a reflexive Sobolev space \( W^{1,p}(\Omega) \) (using coercivity of \( J \)).
3. Extract a weakly convergent subsequence \( u_{n_k} \rightharpoonup u^* \) in \( W^{1,p} \).
4. Use weak lower semicontinuity of \( J \) (which holds when \( F \) is convex in the gradient variable) to conclude \( J[u^*] \le \liminf_k J[u_{n_k}] = \inf J \).
5. Conclude \( u^* \) is a minimizer.

The weak sequential compactness of reflexive \( L^p \) spaces (which underlies the same property for Sobolev spaces) is therefore the existence theorem for minimizers in variational problems. Without reflexivity — as in \( L^1 \) or \( L^\infty \) — the method breaks down, and more sophisticated tools (Young measures, relaxation) are needed.

<div class="remark">
The connection between signed measures and functional analysis (via Riesz-Markov-Kakutani), conditional expectations and Radon-Nikodym, \( L^p \) duality and PDEs, and weak convergence and the calculus of variations forms a unified narrative: measure theory is not merely a foundation for integration, but is the language in which modern analysis, probability, and mathematical physics are written. The material in this course — signed measures, Radon-Nikodym, and \( L^p \) duality — occupies the heart of this language.
</div>

---

*End of PMATH 450 Spring 2025 notes. For the foundational and Fourier analysis material, see the [Spring 2018 offering](/1185/pmath450/).*
