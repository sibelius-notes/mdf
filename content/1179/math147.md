---
title: "MATH 147: Calculus 1 for Honours Mathematics"
---

These notes cover MATH 147 (Calculus 1 for Honours Mathematics) at the University of Waterloo. The course is the rigorous companion to MATH 137: every definition is given the full \(\varepsilon\)-\(\delta\) treatment, every major theorem is proved, and the real number system itself is developed from first principles. The primary inspiration is Spivak's *Calculus* and Rudin's *Principles of Mathematical Analysis*, but the presentation is aimed at a student encountering rigorous analysis for the first time.

---

# Chapter 1: The Real Number System

The calculus we develop in this course — limits, derivatives, integrals — ultimately rests on properties of the real numbers \(\mathbb{R}\). Most of us use real numbers every day without asking what they actually *are*. In MATH 147, we take that question seriously. The key insight is that \(\mathbb{R}\) is not just an algebraic object (a field) or an ordered object (like \(\mathbb{Q}\)), but a *complete* ordered field, and it is completeness that makes calculus possible.

## 1.1 Ordered Fields

An *ordered field* is a set equipped with addition, multiplication, and an ordering that all interact in the expected ways. The rationals \(\mathbb{Q}\) form an ordered field, but as we will see, they are fundamentally insufficient for analysis.

<div class="definition">

<strong>Definition 1.1 (Field).</strong> A <em>field</em> is a set \(F\) with two operations \(+\) and \(\cdot\) satisfying the usual axioms: commutativity, associativity, distributivity, identity elements \(0\) and \(1\) (with \(0 \ne 1\)), and the existence of additive and multiplicative inverses (the latter for all nonzero elements).

</div>

<div class="definition">

<strong>Definition 1.2 (Ordered Field).</strong> An <em>ordered field</em> is a field \(F\) together with a subset \(P \subset F\) (the <em>positive elements</em>) satisfying: (i) for every \(x \in F\), exactly one of \(x \in P\), \(x = 0\), or \(-x \in P\) holds (trichotomy); (ii) \(P\) is closed under addition and multiplication. We write \(x > 0\) to mean \(x \in P\), and \(x > y\) to mean \(x - y > 0\).

</div>

Both \(\mathbb{Q}\) and \(\mathbb{R}\) are ordered fields. The key difference comes next.

## 1.2 The Least Upper Bound Property

The rational numbers have a glaring gap: the set \(\{x \in \mathbb{Q} : x^2 < 2\}\) is bounded above in \(\mathbb{Q}\) (by \(2\), say), yet has no least upper bound in \(\mathbb{Q}\). The real numbers are distinguished precisely by the fact that this cannot happen.

<div class="definition">

<strong>Definition 1.3 (Upper Bound, Supremum).</strong> Let \(S \subset F\) be a nonempty subset of an ordered field. An element \(\alpha \in F\) is an <em>upper bound</em> for \(S\) if \(x \le \alpha\) for every \(x \in S\). If \(S\) has an upper bound, we say \(S\) is <em>bounded above</em>. The <em>least upper bound</em> or <em>supremum</em> of \(S\), written \(\sup S\), is an upper bound \(\alpha\) such that \(\alpha \le \beta\) for every upper bound \(\beta\). Similarly define <em>infimum</em> \(\inf S\).

</div>

<div class="theorem">

<strong>Axiom 1.4 (Completeness / Least Upper Bound Property).</strong> Every nonempty subset of \(\mathbb{R}\) that is bounded above has a least upper bound in \(\mathbb{R}\).

</div>

We take this as an axiom characterising \(\mathbb{R}\): up to isomorphism of ordered fields, there is exactly one complete ordered field, and we call it the real numbers. Notice that the completeness axiom fails for \(\mathbb{Q}\): the set \(\{q \in \mathbb{Q} : q > 0, q^2 < 2\}\) has no supremum in \(\mathbb{Q}\).

<div class="remark">

<strong>Remark 1.5.</strong> A useful rephrasing: \(\alpha = \sup S\) if and only if (i) \(x \le \alpha\) for all \(x \in S\), and (ii) for every \(\varepsilon > 0\) there exists \(x \in S\) with \(x > \alpha - \varepsilon\). Condition (ii) says \(\alpha\) is the *smallest* upper bound — anything strictly smaller gets beaten by some element of \(S\).

</div>

## 1.3 Consequences: Archimedean Property and Density of \(\mathbb{Q}\)

Completeness has far-reaching consequences. Two of the most important are that \(\mathbb{N}\) is not bounded in \(\mathbb{R}\), and that between any two real numbers lies a rational.

<div class="theorem">

<strong>Theorem 1.6 (Archimedean Property).</strong> For every \(x \in \mathbb{R}\), there exists \(n \in \mathbb{N}\) with \(n > x\).

</div>

*Proof.* If \(\mathbb{N}\) were bounded above in \(\mathbb{R}\), then by completeness \(\alpha = \sup \mathbb{N}\) would exist. Since \(\alpha - 1\) is not an upper bound, there is some \(n \in \mathbb{N}\) with \(n > \alpha - 1\), giving \(n + 1 > \alpha\). But \(n+1 \in \mathbb{N}\), contradicting that \(\alpha\) is an upper bound. \(\square\)

<div class="corollary">

<strong>Corollary 1.7.</strong> For every \(\varepsilon > 0\) there exists \(n \in \mathbb{N}\) with \(1/n < \varepsilon\). Equivalently, \(\lim_{n \to \infty} 1/n = 0\).

</div>

<div class="theorem">

<strong>Theorem 1.8 (Density of \(\mathbb{Q}\)).</strong> For every \(a, b \in \mathbb{R}\) with \(a < b\), there exists \(q \in \mathbb{Q}\) with \(a < q < b\).

</div>

*Proof.* By the Archimedean property, choose \(n \in \mathbb{N}\) with \(n > 1/(b-a)\), so \(1/n < b - a\). Let \(m = \lfloor na \rfloor + 1\), so \(m - 1 \le na < m\), giving \(a < m/n \le a + 1/n < a + (b-a) = b\). Then \(q = m/n\) works. \(\square\)

<div class="definition">

<strong>Definition 1.9 (Absolute Value).</strong> For \(x \in \mathbb{R}\), the <em>absolute value</em> is
\[
|x| = \begin{cases} x & x \ge 0 \\ -x & x < 0. \end{cases}
\]
Geometrically, \(|x|\) is the distance from \(x\) to \(0\), and \(|a - b|\) is the distance between \(a\) and \(b\).

</div>

<div class="theorem">

<strong>Theorem 1.10 (Triangle Inequality).</strong> For all \(x, y \in \mathbb{R}\):
\[
|x + y| \le |x| + |y|, \qquad \bigl||x| - |y|\bigr| \le |x - y|.
\]

</div>

The triangle inequality is the single most-used estimate in all of analysis. Every \(\varepsilon\)-\(\delta\) proof eventually invokes it.

---

# Chapter 2: Sequences

A sequence is the simplest setting in which to develop the idea of a limit. Before we can meaningfully speak of a function approaching a value, we need a rigorous account of what it means for a list of numbers to converge. The theory of sequences also provides the tools to prove completeness consequences like the Bolzano–Weierstrass theorem, which will be indispensable later.

## 2.1 Limits of Sequences

<div class="definition">

<strong>Definition 2.1 (Convergence of a Sequence).</strong> A sequence \(\{a_n\}_{n=1}^\infty\) <em>converges</em> to \(L \in \mathbb{R}\), written \(\lim_{n \to \infty} a_n = L\), if for every \(\varepsilon > 0\) there exists \(N \in \mathbb{N}\) such that \(n \ge N\) implies \(|a_n - L| < \varepsilon\). A sequence that does not converge is <em>divergent</em>.

</div>

The key idea is that \(\varepsilon\) is given first — it is the tolerance — and we must respond with an \(N\) that works for that tolerance. The order matters: \(N\) is allowed to depend on \(\varepsilon\).

<div class="example">

<strong>Example 2.2.</strong> Show \(\lim_{n\to\infty} \frac{1}{n} = 0\). Given \(\varepsilon > 0\), by the Archimedean property choose \(N \in \mathbb{N}\) with \(N > 1/\varepsilon\). Then for \(n \ge N\), \(|1/n - 0| = 1/n \le 1/N < \varepsilon\). \(\square\)

</div>

<div class="theorem">

<strong>Theorem 2.3 (Uniqueness of Limits).</strong> If \(\lim_{n\to\infty} a_n = L\) and \(\lim_{n\to\infty} a_n = M\), then \(L = M\).

</div>

*Proof.* Suppose \(L \ne M\); set \(\varepsilon = |L - M|/2 > 0\). Choose \(N_1\) so that \(n \ge N_1\) implies \(|a_n - L| < \varepsilon\), and \(N_2\) so that \(n \ge N_2\) implies \(|a_n - M| < \varepsilon\). For \(n \ge \max(N_1, N_2)\), the triangle inequality gives \(|L - M| \le |L - a_n| + |a_n - M| < 2\varepsilon = |L - M|\), a contradiction. \(\square\)

<div class="definition">

<strong>Definition 2.4 (Divergence to Infinity).</strong> We write \(\lim_{n\to\infty} a_n = +\infty\) if for every \(M > 0\) there exists \(N\) such that \(n \ge N\) implies \(a_n > M\). Similarly for \(-\infty\).

</div>

## 2.2 Limit Theorems

<div class="theorem">

<strong>Theorem 2.5 (Arithmetic Rules for Sequences).</strong> Suppose \(\lim_{n\to\infty} a_n = L\) and \(\lim_{n\to\infty} b_n = M\). Then:
<br>(i) \(\lim_{n\to\infty}(a_n + b_n) = L + M\).
<br>(ii) \(\lim_{n\to\infty} c\,a_n = cL\) for any constant \(c\).
<br>(iii) \(\lim_{n\to\infty} a_n b_n = LM\).
<br>(iv) \(\lim_{n\to\infty} a_n/b_n = L/M\) if \(M \ne 0\).

</div>

<div class="theorem">

<strong>Theorem 2.6 (Squeeze Theorem).</strong> If \(a_n \le b_n \le c_n\) for all sufficiently large \(n\), and \(\lim_{n\to\infty} a_n = \lim_{n\to\infty} c_n = L\), then \(\lim_{n\to\infty} b_n = L\).

</div>

<div class="theorem">

<strong>Theorem 2.7 (Order Preservation).</strong> If \(\lim_{n\to\infty} a_n = L\) and \(a_n \ge 0\) for all \(n\), then \(L \ge 0\). More generally, if \(a_n \le b_n\) for all sufficiently large \(n\) and both sequences converge, then \(\lim a_n \le \lim b_n\).

</div>

## 2.3 Monotone Convergence Theorem

This is where completeness first pays off for sequences. A monotone sequence that is bounded has nowhere to go but converge.

<div class="theorem">

<strong>Theorem 2.8 (Monotone Convergence Theorem).</strong> Let \(\{a_n\}\) be a monotone increasing sequence.
<br>(i) If \(\{a_n\}\) is bounded above, then \(\{a_n\}\) converges and \(\lim_{n\to\infty} a_n = \sup\{a_n : n \in \mathbb{N}\}\).
<br>(ii) If \(\{a_n\}\) is not bounded above, then \(\lim_{n\to\infty} a_n = +\infty\).
A symmetric statement holds for decreasing sequences.

</div>

*Proof.* Let \(L = \sup\{a_n\}\), which exists by completeness. Given \(\varepsilon > 0\), since \(L - \varepsilon\) is not an upper bound, there exists \(a_N > L - \varepsilon\). Since the sequence is increasing, for all \(n \ge N\) we have \(L - \varepsilon < a_N \le a_n \le L\), so \(|a_n - L| < \varepsilon\). \(\square\)

The Monotone Convergence Theorem is the engine behind many existence arguments: to prove a sequence converges, it often suffices to show it is monotone and bounded.

## 2.4 Subsequences and the Bolzano–Weierstrass Theorem

<div class="definition">

<strong>Definition 2.9 (Subsequence).</strong> Given \(\{a_n\}\) and strictly increasing indices \(n_1 < n_2 < n_3 < \cdots\), the sequence \(\{a_{n_k}\}_{k=1}^\infty\) is a <em>subsequence</em> of \(\{a_n\}\).

</div>

<div class="theorem">

<strong>Theorem 2.10.</strong> If \(\lim_{n\to\infty} a_n = L\), then every subsequence also converges to \(L\).

</div>

The contrapositive is equally important: if two subsequences converge to different limits, the original sequence diverges.

<div class="theorem">

<strong>Theorem 2.11 (Bolzano–Weierstrass).</strong> Every bounded sequence of real numbers has a convergent subsequence.

</div>

*Proof.* Let \(\{a_n\} \subset [A, B]\). We perform repeated bisection. Set \([A_0, B_0] = [A, B]\). Given \([A_k, B_k]\), at least one of \([A_k, \tfrac{A_k+B_k}{2}]\) or \([\tfrac{A_k+B_k}{2}, B_k]\) contains infinitely many terms; call it \([A_{k+1}, B_{k+1}]\). Pick \(n_{k+1} > n_k\) with \(a_{n_{k+1}} \in [A_{k+1}, B_{k+1}]\). The nested intervals have length \((B-A)/2^k \to 0\), so by completeness they share a unique point \(L\). Since \(a_{n_k} \in [A_k, B_k]\) and the interval widths shrink to zero, \(a_{n_k} \to L\). \(\square\)

## 2.5 Cauchy Sequences

The Bolzano–Weierstrass theorem tells us bounded sequences have convergent subsequences, but how can we verify convergence without knowing the limit in advance? Cauchy sequences answer this.

<div class="definition">

<strong>Definition 2.12 (Cauchy Sequence).</strong> A sequence \(\{a_n\}\) is a <em>Cauchy sequence</em> if for every \(\varepsilon > 0\) there exists \(N \in \mathbb{N}\) such that for all \(m, n \ge N\), \(|a_m - a_n| < \varepsilon\).

</div>

The definition says the terms of the sequence eventually cluster together, without reference to any putative limit.

<div class="theorem">

<strong>Theorem 2.13 (Cauchy Criterion).</strong> A sequence of real numbers converges if and only if it is a Cauchy sequence.

</div>

*Proof.* (\(\Rightarrow\)) If \(a_n \to L\), given \(\varepsilon > 0\) choose \(N\) so that \(|a_n - L| < \varepsilon/2\) for \(n \ge N\). Then \(|a_m - a_n| \le |a_m - L| + |L - a_n| < \varepsilon\).

(\(\Leftarrow\)) Let \(\{a_n\}\) be Cauchy. First, every Cauchy sequence is bounded (choose \(N\) for \(\varepsilon = 1\); then \(|a_n| \le |a_N| + 1\) for \(n \ge N\), and the finitely many earlier terms are also bounded). By Bolzano–Weierstrass, there is a convergent subsequence \(a_{n_k} \to L\). Given \(\varepsilon > 0\), choose \(N\) so that \(m, n \ge N\) implies \(|a_m - a_n| < \varepsilon/2\), and \(K\) so that \(k \ge K\) implies \(|a_{n_k} - L| < \varepsilon/2\). For \(n \ge N\), pick \(k \ge K\) with \(n_k \ge N\); then \(|a_n - L| \le |a_n - a_{n_k}| + |a_{n_k} - L| < \varepsilon\). \(\square\)

This equivalence — Cauchy iff convergent — is another way of stating completeness. In the rationals, Cauchy sequences need not converge (e.g.\ the rational approximations to \(\sqrt{2}\)).

---

# Chapter 3: Limits and Continuity

With sequences in hand, we can define limits of functions. The interplay between function limits and sequential limits is both elegant and practically powerful: many properties of function limits reduce immediately to the corresponding sequence results.

## 3.1 The Epsilon-Delta Definition

<div class="definition">

<strong>Definition 3.1 (Limit of a Function).</strong> Let \(f\) be defined on an open interval containing \(a\), except possibly at \(a\) itself. We write \(\lim_{x \to a} f(x) = L\) if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that
\[
0 < |x - a| < \delta \implies |f(x) - L| < \varepsilon.
\]

</div>

Notice the condition \(0 < |x - a|\): we never evaluate \(f\) at \(x = a\). The limit is about the behaviour of \(f\) *near* \(a\), not *at* \(a\).

<div class="example">

<strong>Example 3.2.</strong> Prove \(\lim_{x \to 3}(2x - 1) = 5\) directly from the definition. We need \(|f(x) - 5| = |2x - 6| = 2|x - 3| < \varepsilon\) whenever \(0 < |x - 3| < \delta\). Choosing \(\delta = \varepsilon/2\) works: if \(|x-3| < \delta\) then \(|2x - 6| = 2|x-3| < 2\delta = \varepsilon\). \(\square\)

</div>

<div class="example">

<strong>Example 3.3.</strong> Prove \(\lim_{x \to 2} x^2 = 4\). We want \(|x^2 - 4| < \varepsilon\). Write \(|x^2 - 4| = |x+2||x-2|\). If we restrict \(|x-2| < 1\) first, then \(|x| < 3\) so \(|x+2| < 5\). Thus \(|x^2 - 4| < 5|x-2|\). Set \(\delta = \min(1, \varepsilon/5)\); then \(|x-2| < \delta\) implies \(|x^2-4| < 5 \cdot (\varepsilon/5) = \varepsilon\). \(\square\)

</div>

## 3.2 Limit Laws

<div class="theorem">

<strong>Theorem 3.4 (Sequential Characterization of Limits).</strong> \(\lim_{x \to a} f(x) = L\) if and only if for every sequence \(\{x_n\}\) with \(x_n \ne a\) and \(x_n \to a\), we have \(f(x_n) \to L\).

</div>

This theorem is the bridge between sequence theory and function limits. It means every result we proved for sequences carries over to function limits immediately.

<div class="theorem">

<strong>Theorem 3.5 (Arithmetic Limit Laws).</strong> If \(\lim_{x\to a} f(x) = L\) and \(\lim_{x\to a} g(x) = M\), then:
<br>(i) \(\lim_{x\to a}[f(x) + g(x)] = L + M\).
<br>(ii) \(\lim_{x\to a} f(x)g(x) = LM\).
<br>(iii) \(\lim_{x\to a} f(x)/g(x) = L/M\) when \(M \ne 0\).
<br>(iv) \(\lim_{x\to a} |f(x)| = |L|\).

</div>

<div class="theorem">

<strong>Theorem 3.6 (Squeeze Theorem for Functions).</strong> If \(g(x) \le f(x) \le h(x)\) near \(a\) (but not necessarily at \(a\)) and \(\lim_{x\to a} g(x) = \lim_{x\to a} h(x) = L\), then \(\lim_{x\to a} f(x) = L\).

</div>

<div class="theorem">

<strong>Theorem 3.7 (Fundamental Trigonometric Limit).</strong>
\[
\lim_{\theta \to 0} \frac{\sin \theta}{\theta} = 1.
\]

</div>

*Proof (sketch).* For \(0 < \theta < \pi/2\), comparing areas of triangles and the circular sector on the unit circle gives \(\sin\theta < \theta < \tan\theta\), hence \(\cos\theta < \sin\theta/\theta < 1\). Since \(\cos\theta \to 1\), the Squeeze Theorem finishes it. \(\square\)

## 3.3 One-Sided Limits and Limits at Infinity

<div class="definition">

<strong>Definition 3.8 (One-Sided Limits).</strong> \(\lim_{x\to a^+} f(x) = L\) means: for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that \(0 < x - a < \delta\) implies \(|f(x) - L| < \varepsilon\). Similarly define \(\lim_{x\to a^-} f(x) = L\).

</div>

<div class="theorem">

<strong>Theorem 3.9.</strong> \(\lim_{x\to a} f(x) = L\) exists if and only if both one-sided limits exist and \(\lim_{x\to a^-} f(x) = L = \lim_{x\to a^+} f(x)\).

</div>

<div class="definition">

<strong>Definition 3.10 (Limits at Infinity).</strong> \(\lim_{x\to\infty} f(x) = L\) means: for every \(\varepsilon > 0\) there exists \(N\) such that \(x > N\) implies \(|f(x) - L| < \varepsilon\).

</div>

## 3.4 Continuity

<div class="definition">

<strong>Definition 3.11 (Continuity at a Point).</strong> A function \(f\) is <em>continuous at \(a\)</em> if
\[
\lim_{x \to a} f(x) = f(a).
\]
Equivalently, for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that \(|x - a| < \delta\) implies \(|f(x) - f(a)| < \varepsilon\). Note that now \(x = a\) is allowed.

</div>

<div class="theorem">

<strong>Theorem 3.12 (Sequential Characterization of Continuity).</strong> \(f\) is continuous at \(a\) if and only if for every sequence \(x_n \to a\), we have \(f(x_n) \to f(a)\).

</div>

<div class="theorem">

<strong>Theorem 3.13 (Algebra of Continuous Functions).</strong> If \(f\) and \(g\) are continuous at \(a\), so are \(f + g\), \(fg\), and \(f/g\) (when \(g(a) \ne 0\)). If \(f\) is continuous at \(a\) and \(g\) is continuous at \(f(a)\), then \(g \circ f\) is continuous at \(a\).

</div>

The elementary functions — polynomials, \(\sin x\), \(\cos x\), \(e^x\), \(\ln x\) — are all continuous on their natural domains. Combining them with the theorem above produces a vast class of continuous functions.

## 3.5 The Intermediate Value Theorem

The IVT captures the geometric intuition that a continuous function cannot jump: if \(f\) is \(2\) at one point and \(7\) at another, it must take every value in between. This seemingly obvious fact requires completeness to prove.

<div class="theorem">

<strong>Theorem 3.14 (Intermediate Value Theorem).</strong> If \(f\) is continuous on \([a, b]\) and \(k\) is any value strictly between \(f(a)\) and \(f(b)\), then there exists \(c \in (a, b)\) with \(f(c) = k\).

</div>

*Proof.* Without loss of generality assume \(f(a) < k < f(b)\). Define \(S = \{x \in [a,b] : f(x) \le k\}\). Then \(a \in S\) so \(S \ne \emptyset\), and \(S\) is bounded above by \(b\). By completeness, \(c = \sup S\) exists. We claim \(f(c) = k\).

Suppose \(f(c) < k\). Since \(f\) is continuous at \(c\), with \(\varepsilon = k - f(c) > 0\) we find \(\delta > 0\) such that \(|x - c| < \delta\) implies \(|f(x) - f(c)| < \varepsilon\), i.e.\ \(f(x) < k\). Thus \([c, c+\delta) \subset S\) (as long as \(c + \delta \le b\)), contradicting that \(c\) is an upper bound for \(S\). Suppose \(f(c) > k\). Then by continuity, \(f(x) > k\) near \(c\), so \(c - \delta\) is also an upper bound of \(S\), contradicting \(c = \sup S\). Therefore \(f(c) = k\). \(\square\)

The IVT has powerful applications: it guarantees roots of polynomials of odd degree, underpins the bisection method for root-finding, and shows that continuous images of intervals are intervals.

## 3.6 The Extreme Value Theorem

The IVT tells us about intermediate values; the Extreme Value Theorem tells us about maximum and minimum values. Both require the interval to be *closed* and *bounded*, and both fail without these hypotheses.

<div class="theorem">

<strong>Theorem 3.15 (Extreme Value Theorem).</strong> If \(f\) is continuous on \([a, b]\), then \(f\) attains a global maximum and a global minimum on \([a, b]\): there exist \(x_{\min}, x_{\max} \in [a,b]\) with \(f(x_{\min}) \le f(x) \le f(x_{\max})\) for all \(x \in [a,b]\).

</div>

*Proof.* Let \(M = \sup\{f(x) : x \in [a,b]\}\), which is finite by the claim below. Choose \(x_n \in [a,b]\) with \(f(x_n) > M - 1/n\). By Bolzano–Weierstrass, \(\{x_n\}\) has a convergent subsequence \(x_{n_k} \to x_{\max} \in [a,b]\) (the limit is in \([a,b]\) since the interval is closed). By continuity, \(f(x_{n_k}) \to f(x_{\max})\); since \(f(x_{n_k}) \to M\), we get \(f(x_{\max}) = M\). The minimum is handled similarly. That \(M < \infty\): if not, pick \(x_n\) with \(f(x_n) > n\); extract a convergent subsequence to \(x^*\); continuity forces \(f(x_n) \to f(x^*)\), contradicting \(f(x_n) \to \infty\). \(\square\)

## 3.7 Uniform Continuity

Ordinary continuity allows \(\delta\) to depend on both \(\varepsilon\) *and* the point \(a\). Uniform continuity is a stronger condition requiring a single \(\delta\) that works everywhere at once.

<div class="definition">

<strong>Definition 3.16 (Uniform Continuity).</strong> A function \(f : [a,b] \to \mathbb{R}\) is <em>uniformly continuous</em> if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that for *all* \(x, y \in [a,b]\),
\[
|x - y| < \delta \implies |f(x) - f(y)| < \varepsilon.
\]

</div>

<div class="example">

<strong>Example 3.17.</strong> \(f(x) = x^2\) is continuous on \(\mathbb{R}\) but not uniformly continuous: for any \(\delta > 0\), taking \(x = n\) and \(y = n + \delta/2\) for large \(n\) gives \(|x - y| < \delta\) but \(|f(x) - f(y)| = |(n+\delta/2)^2 - n^2| = n\delta + \delta^2/4 \to \infty\). However, \(f(x) = x^2\) *is* uniformly continuous on any closed bounded interval.

</div>

<div class="theorem">

<strong>Theorem 3.18 (Heine–Cantor Theorem).</strong> If \(f\) is continuous on a closed bounded interval \([a, b]\), then \(f\) is uniformly continuous on \([a,b]\).

</div>

*Proof.* Suppose for contradiction that \(f\) is not uniformly continuous on \([a,b]\). Then there exists \(\varepsilon_0 > 0\) and sequences \(x_n, y_n \in [a,b]\) with \(|x_n - y_n| < 1/n\) but \(|f(x_n) - f(y_n)| \ge \varepsilon_0\). By Bolzano–Weierstrass, extract a convergent subsequence \(x_{n_k} \to c \in [a,b]\). Then \(y_{n_k} \to c\) too (since \(|x_{n_k} - y_{n_k}| \to 0\)). By continuity of \(f\) at \(c\), \(f(x_{n_k}) \to f(c)\) and \(f(y_{n_k}) \to f(c)\), so \(|f(x_{n_k}) - f(y_{n_k})| \to 0\), contradicting \(\ge \varepsilon_0\). \(\square\)

---

# Chapter 4: Differentiation

Differentiation is the mathematical formalization of the notion of instantaneous rate of change. The derivative at a point is a limit — a single real number — that encodes the slope of the tangent line, the velocity of a moving particle, the sensitivity of an output to a change in input. What makes differentiation powerful is that it is *local*: the derivative at \(a\) depends only on the behaviour of \(f\) near \(a\).

## 4.1 The Derivative

<div class="definition">

<strong>Definition 4.1 (Derivative at a Point).</strong> A function \(f\) is <em>differentiable at \(a\)</em> if the limit
\[
f'(a) = \lim_{h \to 0} \frac{f(a+h) - f(a)}{h}
\]
exists. Equivalently, \(f'(a) = \lim_{x \to a} \frac{f(x) - f(a)}{x - a}\). The value \(f'(a)\) is the <em>derivative of \(f\) at \(a\)</em>.

</div>

Geometrically, \(f'(a)\) is the slope of the tangent line to the graph of \(f\) at the point \((a, f(a))\). The tangent line itself is \(y = f(a) + f'(a)(x - a)\), the best linear approximation to \(f\) near \(a\).

<div class="theorem">

<strong>Theorem 4.2 (Differentiability Implies Continuity).</strong> If \(f\) is differentiable at \(a\), then \(f\) is continuous at \(a\).

</div>

*Proof.* Write \(f(x) - f(a) = \frac{f(x)-f(a)}{x-a} \cdot (x-a)\). As \(x \to a\), the first factor tends to \(f'(a)\) and the second to \(0\), so the product tends to \(0\). \(\square\)

The converse is false: \(f(x) = |x|\) is continuous everywhere but not differentiable at \(0\), since \((|h| - 0)/h = \pm 1\) depending on the sign of \(h\).

## 4.2 Differentiation Rules

<div class="theorem">

<strong>Theorem 4.3 (Linearity and Product Rule).</strong> If \(f\) and \(g\) are differentiable at \(a\):
<br>(i) \((f + g)'(a) = f'(a) + g'(a)\).
<br>(ii) \((cf)'(a) = cf'(a)\).
<br>(iii) <em>(Product Rule)</em> \((fg)'(a) = f'(a)g(a) + f(a)g'(a)\).
<br>(iv) <em>(Quotient Rule)</em> \((f/g)'(a) = \dfrac{f'(a)g(a) - f(a)g'(a)}{[g(a)]^2}\) when \(g(a) \ne 0\).

</div>

<div class="theorem">

<strong>Theorem 4.4 (Power Rule).</strong> For any \(\alpha \in \mathbb{R}\), \(\frac{d}{dx} x^\alpha = \alpha x^{\alpha-1}\) wherever \(x^{\alpha-1}\) is defined.

</div>

Key derivatives of standard functions:
\[
\frac{d}{dx}\sin x = \cos x, \quad \frac{d}{dx}\cos x = -\sin x, \quad \frac{d}{dx} e^x = e^x, \quad \frac{d}{dx}\ln x = \frac{1}{x}.
\]

## 4.3 The Chain Rule

The chain rule is perhaps the most important differentiation rule, governing how derivatives compose. Its proof requires care because the naive approach (dividing by \(g(x) - g(a)\)) fails when \(g(x) = g(a)\) at a sequence of points converging to \(a\).

<div class="theorem">

<strong>Theorem 4.5 (Chain Rule).</strong> If \(f\) is differentiable at \(a\) and \(g\) is differentiable at \(f(a)\), then \(h = g \circ f\) is differentiable at \(a\) and
\[
h'(a) = g'(f(a)) \cdot f'(a).
\]

</div>

*Proof.* Define \(\phi : \mathbb{R} \to \mathbb{R}\) by
\[
\phi(y) = \begin{cases} \dfrac{g(y) - g(f(a))}{y - f(a)} & y \ne f(a) \\ g'(f(a)) & y = f(a). \end{cases}
\]
By definition of \(g'(f(a))\), \(\phi\) is continuous at \(f(a)\). We have \(g(y) - g(f(a)) = \phi(y)(y - f(a))\). Setting \(y = f(x)\):
\[
h(x) - h(a) = g(f(x)) - g(f(a)) = \phi(f(x)) \cdot (f(x) - f(a)).
\]
Dividing by \(x - a\) (for \(x \ne a\)) and taking \(x \to a\): \(f(x) \to f(a)\) (by continuity), so \(\phi(f(x)) \to \phi(f(a)) = g'(f(a))\), and \((f(x)-f(a))/(x-a) \to f'(a)\). \(\square\)

## 4.4 Implicit Differentiation and Inverse Functions

When a relation \(F(x,y) = 0\) defines \(y\) implicitly as a differentiable function of \(x\), we differentiate both sides with respect to \(x\) using the Chain Rule on \(y\)-terms, then solve for \(dy/dx\). This technique gives us derivatives of inverse functions.

<div class="theorem">

<strong>Theorem 4.6 (Inverse Function Theorem, one-variable).</strong> Suppose \(f\) is continuous and strictly monotone on an interval \(I\), differentiable at \(a \in I\), and \(f'(a) \ne 0\). Let \(g = f^{-1}\) be the inverse function, and \(b = f(a)\). Then \(g\) is differentiable at \(b\) and
\[
g'(b) = \frac{1}{f'(a)} = \frac{1}{f'(g(b))}.
\]

</div>

Applying this to \(f(x) = e^x\) (so \(g = \ln\)) gives \((\ln x)' = 1/x\). Applying to \(f(x) = \sin x\) on \([-\pi/2, \pi/2]\) gives \((\arcsin x)' = 1/\sqrt{1-x^2}\); similarly \((\arctan x)' = 1/(1+x^2)\).

## 4.5 Higher Derivatives

<div class="definition">

<strong>Definition 4.7 (Higher Derivatives).</strong> The <em>second derivative</em> is \(f'' = (f')'\), and the <em>\(n\)-th derivative</em> \(f^{(n)} = (f^{(n-1)})'\). We say \(f\) is \(C^n\) on an interval if \(f^{(n)}\) exists and is continuous there, and \(C^\infty\) if it is \(C^n\) for all \(n\).

</div>

The second derivative measures concavity: \(f'' > 0\) on \(I\) means the graph bends upward (concave up), while \(f'' < 0\) means it bends downward. An inflection point is where concavity changes.

---

# Chapter 5: The Mean Value Theorem and Applications

The Mean Value Theorem is the central result of one-variable differential calculus. It connects the local notion of a derivative at a point to the global behaviour of a function over an interval. Most of the key applications of differentiation — monotonicity, L'Hôpital's Rule, Taylor's theorem — ultimately flow from it.

## 5.1 Rolle's Theorem and the MVT

<div class="theorem">

<strong>Theorem 5.1 (Rolle's Theorem).</strong> If \(f\) is continuous on \([a,b]\), differentiable on \((a,b)\), and \(f(a) = f(b)\), then there exists \(c \in (a,b)\) with \(f'(c) = 0\).

</div>

*Proof.* By the EVT, \(f\) attains a maximum and minimum on \([a,b]\). If both are attained at the endpoints, then \(f\) is constant (since \(f(a)=f(b)\)) and \(f' \equiv 0\) on \((a,b)\). Otherwise, at least one extreme value is attained at an interior point \(c \in (a,b)\); at such a point the Local Extrema Theorem forces \(f'(c) = 0\). \(\square\)

<div class="theorem">

<strong>Theorem 5.2 (Mean Value Theorem).</strong> If \(f\) is continuous on \([a,b]\) and differentiable on \((a,b)\), then there exists \(c \in (a,b)\) such that
\[
f'(c) = \frac{f(b) - f(a)}{b - a}.
\]

</div>

*Proof.* Apply Rolle's Theorem to the auxiliary function \(g(x) = f(x) - \frac{f(b)-f(a)}{b-a}(x-a)\). One checks \(g(a) = g(b) = f(a)\), so there is \(c\) with \(g'(c) = 0\), giving the result. \(\square\)

Geometrically, the MVT says the tangent line at some interior point is parallel to the secant through the endpoints. Analytically, it says the instantaneous rate of change equals the average rate of change at some moment — a rigorous form of the intuition that a car traveling 60 km in one hour must at some instant be going exactly 60 km/h.

## 5.2 Monotonicity

<div class="theorem">

<strong>Theorem 5.3 (Monotonicity Theorem).</strong>
<br>(i) If \(f'(x) > 0\) for all \(x \in (a,b)\), then \(f\) is strictly increasing on \([a,b]\).
<br>(ii) If \(f'(x) < 0\) for all \(x \in (a,b)\), then \(f\) is strictly decreasing on \([a,b]\).
<br>(iii) If \(f'(x) = 0\) for all \(x \in (a,b)\), then \(f\) is constant on \([a,b]\).

</div>

*Proof.* For (i), let \(a \le x_1 < x_2 \le b\). By the MVT there is \(c \in (x_1, x_2)\) with \(f(x_2) - f(x_1) = f'(c)(x_2 - x_1) > 0\). \(\square\)

## 5.3 L'Hôpital's Rule

L'Hôpital's Rule handles indeterminate forms \(0/0\) and \(\infty/\infty\) by replacing the ratio of functions with the ratio of their derivatives. Its proof uses the Cauchy Mean Value Theorem.

<div class="theorem">

<strong>Theorem 5.4 (Cauchy Mean Value Theorem).</strong> If \(f\) and \(g\) are continuous on \([a,b]\) and differentiable on \((a,b)\), then there exists \(c \in (a,b)\) with
\[
[f(b)-f(a)]g'(c) = [g(b)-g(a)]f'(c).
\]

</div>

*Proof.* Apply Rolle's to \(h(x) = [f(b)-f(a)]g(x) - [g(b)-g(a)]f(x)\). Then \(h(a) = f(b)g(a) - f(a)g(b) = h(b)\), so there is \(c\) with \(h'(c) = 0\). \(\square\)

<div class="theorem">

<strong>Theorem 5.5 (L'Hôpital's Rule).</strong> Suppose \(f\) and \(g\) are differentiable on \((a, b)\) (possibly with \(a = -\infty\) or \(b = +\infty\)), \(g'(x) \ne 0\) on \((a,b)\), and that one of the following holds:
<br>(H1) \(\lim_{x\to a^+} f(x) = 0\) and \(\lim_{x\to a^+} g(x) = 0\) (the \(0/0\) case); or
<br>(H2) \(\lim_{x\to a^+} |g(x)| = +\infty\) (the \(\infty/\infty\) case).
If \(\lim_{x\to a^+} f'(x)/g'(x) = L\) (with \(L \in \mathbb{R} \cup \{\pm\infty\}\)), then \(\lim_{x\to a^+} f(x)/g(x) = L\). The same holds for \(x \to b^-\) and for two-sided limits.

</div>

*Proof (0/0 case, finite \(L\)).* Extend \(f\) and \(g\) to \([a, b)\) by setting \(f(a) = g(a) = 0\). For \(x \in (a, b)\), the Cauchy MVT applied to \([a, x]\) gives \(c_x \in (a, x)\) with
\[
\frac{f(x)}{g(x)} = \frac{f(x) - f(a)}{g(x) - g(a)} = \frac{f'(c_x)}{g'(c_x)}.
\]
As \(x \to a^+\), we have \(c_x \to a^+\), and hence \(f'(c_x)/g'(c_x) \to L\). \(\square\)

The most frequently used instances: \(\lim_{x\to 0}\frac{\sin x}{x} = 1\), \(\lim_{x\to\infty}\frac{\ln x}{x} = 0\), \(\lim_{x\to\infty}\frac{x^n}{e^x} = 0\).

## 5.4 Convexity

<div class="definition">

<strong>Definition 5.6 (Convexity).</strong> \(f\) is <em>convex</em> (concave up) on \((a,b)\) if for all \(x, y \in (a,b)\) and \(t \in [0,1]\),
\[
f(tx + (1-t)y) \le tf(x) + (1-t)f(y).
\]
\(f\) is <em>concave</em> (concave down) if the inequality is reversed.

</div>

<div class="theorem">

<strong>Theorem 5.7 (Second Derivative and Convexity).</strong> If \(f\) is twice differentiable on \((a,b)\):
<br>(i) \(f\) is convex on \((a,b)\) if and only if \(f'' \ge 0\) on \((a,b)\).
<br>(ii) If \(f'' > 0\) on \((a,b)\), then \(f\) is strictly convex.

</div>

<div class="theorem">

<strong>Theorem 5.8 (Second Derivative Test).</strong> Suppose \(f'(c) = 0\). If \(f''(c) > 0\), then \(f\) has a local minimum at \(c\); if \(f''(c) < 0\), then \(f\) has a local maximum at \(c\).

</div>

---

# Chapter 6: Taylor Polynomials and Approximation

The derivative captures the first-order behaviour of a function near a point. Higher derivatives capture higher-order behaviour, and Taylor's theorem lets us assemble all of this information into a polynomial approximation with a quantitative error bound. This is the starting point for numerical analysis, asymptotic analysis, and eventually the theory of power series.

## 6.1 Taylor Polynomials

<div class="definition">

<strong>Definition 6.1 (Taylor Polynomial).</strong> Suppose \(f\) is \(n\) times differentiable at \(a\). The <em>\(n\)-th order Taylor polynomial of \(f\) centred at \(a\)</em> is
\[
T_{n,a}(x) = \sum_{k=0}^{n} \frac{f^{(k)}(a)}{k!}(x - a)^k.
\]

</div>

Notice that \(T_{n,a}\) is the unique polynomial of degree at most \(n\) whose first \(n\) derivatives at \(a\) match those of \(f\): \(T_{n,a}^{(k)}(a) = f^{(k)}(a)\) for \(k = 0, 1, \ldots, n\). The case \(n = 1\) recovers the linear (tangent line) approximation.

Key Maclaurin series (centred at \(a = 0\)):
\[
e^x = \sum_{k=0}^{n} \frac{x^k}{k!} + R_n(x), \quad \sin x = \sum_{k=0}^{m} \frac{(-1)^k x^{2k+1}}{(2k+1)!} + R_{2m+1}(x),
\]
\[
\cos x = \sum_{k=0}^{m} \frac{(-1)^k x^{2k}}{(2k)!} + R_{2m}(x), \quad \frac{1}{1-x} = \sum_{k=0}^{n} x^k + R_n(x) \text{ for } |x| < 1.
\]

## 6.2 Taylor's Theorem with Remainder

<div class="theorem">

<strong>Theorem 6.2 (Taylor's Theorem, Lagrange Remainder).</strong> Suppose \(f\) is \((n+1)\) times differentiable on an open interval containing \(a\) and \(x\). Define the remainder \(R_{n,a}(x) = f(x) - T_{n,a}(x)\). Then there exists \(c\) strictly between \(a\) and \(x\) such that
\[
R_{n,a}(x) = \frac{f^{(n+1)}(c)}{(n+1)!}(x - a)^{n+1}.
\]

</div>

*Proof.* Fix \(x \ne a\) and define \(M\) by the equation \(f(x) = T_{n,a}(x) + M(x-a)^{n+1}\). We want to show \(M = f^{(n+1)}(c)/(n+1)!\) for some \(c\) between \(a\) and \(x\). Define
\[
g(t) = f(x) - T_{n,t}(x) - M(x-t)^{n+1}.
\]
One checks that \(g(x) = 0\) and \(g(a) = 0\) (by construction of \(M\)). Computing \(g'(t)\): the terms in \(T_{n,t}(x)\) telescope when differentiated with respect to \(t\), leaving \(g'(t) = -\frac{f^{(n+1)}(t)}{n!}(x-t)^n + M(n+1)(x-t)^n\). By Rolle's Theorem applied to \(g\) on the interval with endpoints \(a\) and \(x\), there is \(c\) with \(g'(c) = 0\), giving \(M = f^{(n+1)}(c)/(n+1)!\). \(\square\)

When \(n = 0\), Taylor's Theorem reduces to the Mean Value Theorem. The Lagrange form of the remainder is what makes Taylor polynomials useful: if we can bound \(|f^{(n+1)}|\), we get a concrete error bound.

<div class="corollary">

<strong>Corollary 6.3 (Error Bound).</strong> If \(|f^{(n+1)}(t)| \le M\) for all \(t\) between \(a\) and \(x\), then
\[
|f(x) - T_{n,a}(x)| \le \frac{M}{(n+1)!}|x - a|^{n+1}.
\]

</div>

## 6.3 Applications

<div class="example">

<strong>Example 6.4.</strong> Approximate \(e\) to four decimal places. We use \(T_{n,0}(1) = \sum_{k=0}^n 1/k!\) with the error bound \(|e - T_{n,0}(1)| \le e/((n+1)!)\). Since \(e < 3\), for \(n = 9\) the error is at most \(3/10! \approx 8.3 \times 10^{-7} < 0.5 \times 10^{-4}\), so 9 terms suffice.

</div>

<div class="example">

<strong>Example 6.5 (Computing limits with Taylor expansions).</strong> To find \(\lim_{x\to 0}\frac{e^x - 1 - x}{x^2}\), substitute \(e^x = 1 + x + x^2/2 + O(x^3)\) to get \(\frac{x^2/2 + O(x^3)}{x^2} = 1/2 + O(x) \to 1/2\). This is far cleaner than two applications of L'Hôpital's Rule.

</div>

<div class="theorem">

<strong>Theorem 6.6 (Characterization of Taylor Polynomials).</strong> Suppose \(f\) is \((n+1)\) times differentiable near \(a\) with \(f^{(n+1)}\) continuous. If \(p\) is any polynomial of degree at most \(n\) with
\[
\lim_{x\to a}\frac{f(x) - p(x)}{(x-a)^n} = 0,
\]
then \(p = T_{n,a}\). Equivalently (using Big-O), \(T_{n,a}\) is the unique degree-\(n\) polynomial with \(f(x) = T_{n,a}(x) + O((x-a)^{n+1})\).

</div>

---

# Chapter 7: Series

An infinite series is a sum with infinitely many terms. This is not a priori a well-defined operation, and its meaning must be defined through limits of partial sums. The key questions are: when does a series converge, and how do its properties (like absolute vs.\ conditional convergence) affect that?

## 7.1 Convergence of Series

<div class="definition">

<strong>Definition 7.1 (Series and Partial Sums).</strong> Given a sequence \(\{a_n\}_{n=1}^\infty\), the associated <em>series</em> is \(\sum_{n=1}^\infty a_n\). The <em>\(k\)-th partial sum</em> is \(S_k = \sum_{n=1}^k a_n\). The series <em>converges</em> to \(S\) if \(\lim_{k\to\infty} S_k = S\); otherwise it <em>diverges</em>.

</div>

<div class="theorem">

<strong>Theorem 7.2 (Divergence Test).</strong> If \(\sum a_n\) converges, then \(\lim_{n\to\infty} a_n = 0\). Equivalently, if \(a_n \not\to 0\), then \(\sum a_n\) diverges.

</div>

*Proof.* If \(S_k \to S\), then \(a_n = S_n - S_{n-1} \to S - S = 0\). \(\square\)

The converse is famously false: \(\sum 1/n\) diverges (the harmonic series) despite \(1/n \to 0\).

## 7.2 Geometric and \(p\)-Series

<div class="theorem">

<strong>Theorem 7.3 (Geometric Series).</strong> The series \(\sum_{n=0}^\infty r^n\) converges if and only if \(|r| < 1\), in which case
\[
\sum_{n=0}^\infty r^n = \frac{1}{1-r}.
\]

</div>

*Proof.* Partial sums satisfy \(S_k = (1 - r^{k+1})/(1-r)\) when \(r \ne 1\). If \(|r| < 1\), \(r^{k+1} \to 0\); if \(|r| \ge 1\), the terms do not tend to zero. \(\square\)

<div class="theorem">

<strong>Theorem 7.4 (\(p\)-Series Test).</strong> The series \(\sum_{n=1}^\infty \frac{1}{n^p}\) converges if and only if \(p > 1\).

</div>

The divergence of \(\sum 1/n\) (\(p = 1\)) can be seen by grouping: \(1 + 1/2 + (1/3 + 1/4) + (1/5 + \cdots + 1/8) + \cdots\), where each group sums to at least \(1/2\).

## 7.3 Convergence Tests

<div class="theorem">

<strong>Theorem 7.5 (Comparison Test).</strong> Suppose \(0 \le a_n \le b_n\) for all sufficiently large \(n\).
<br>(i) If \(\sum b_n\) converges, then \(\sum a_n\) converges.
<br>(ii) If \(\sum a_n\) diverges, then \(\sum b_n\) diverges.

</div>

<div class="theorem">

<strong>Theorem 7.6 (Limit Comparison Test).</strong> Suppose \(a_n, b_n > 0\) and \(\lim_{n\to\infty} a_n/b_n = L\) with \(0 < L < \infty\). Then \(\sum a_n\) and \(\sum b_n\) either both converge or both diverge.

</div>

<div class="theorem">

<strong>Theorem 7.7 (Ratio Test).</strong> Let \(\sum a_n\) be a series of positive terms and suppose \(\lim_{n\to\infty} a_{n+1}/a_n = r\). If \(r < 1\), the series converges; if \(r > 1\), it diverges. If \(r = 1\), the test is inconclusive.

</div>

<div class="theorem">

<strong>Theorem 7.8 (Root Test).</strong> Let \(r = \limsup_{n\to\infty} a_n^{1/n}\). If \(r < 1\), then \(\sum a_n\) converges absolutely; if \(r > 1\), it diverges. If \(r = 1\), the test is inconclusive.

</div>

<div class="theorem">

<strong>Theorem 7.9 (Alternating Series Test / Leibniz Criterion).</strong> If \(\{b_n\}\) is a decreasing sequence with \(b_n \ge 0\) and \(b_n \to 0\), then the alternating series \(\sum_{n=1}^\infty (-1)^{n-1} b_n\) converges. Moreover, the error in truncating after \(N\) terms satisfies \(|S - S_N| \le b_{N+1}\).

</div>

*Proof.* The even partial sums \(S_{2k}\) are increasing and bounded above by \(S_1 = b_1\); the odd partial sums \(S_{2k+1}\) are decreasing and bounded below by \(S_2\). Both subsequences converge, and since \(S_{2k+1} - S_{2k} = b_{2k+1} \to 0\), they share the same limit \(S\). \(\square\)

## 7.4 Absolute and Conditional Convergence

The distinction between absolute and conditional convergence is one of the deeper surprises of series theory.

<div class="definition">

<strong>Definition 7.10 (Absolute and Conditional Convergence).</strong> A series \(\sum a_n\) is <em>absolutely convergent</em> if \(\sum |a_n|\) converges. It is <em>conditionally convergent</em> if \(\sum a_n\) converges but \(\sum |a_n|\) diverges.

</div>

<div class="theorem">

<strong>Theorem 7.11 (Absolute Convergence Implies Convergence).</strong> If \(\sum |a_n|\) converges, then \(\sum a_n\) converges.

</div>

*Proof.* Define \(b_n = a_n + |a_n|\), so \(0 \le b_n \le 2|a_n|\). Since \(\sum |a_n|\) converges, so does \(\sum b_n\) by comparison. Then \(\sum a_n = \sum b_n - \sum |a_n|\) converges. \(\square\)

The archetypal conditionally convergent series is \(\sum_{n=1}^\infty (-1)^{n-1}/n = \ln 2\), which converges by the alternating series test but whose absolute values form the divergent harmonic series.

<div class="theorem">

<strong>Theorem 7.12 (Riemann Rearrangement Theorem).</strong> Let \(\sum a_n\) be a conditionally convergent series. For any \(L \in \mathbb{R} \cup \{+\infty, -\infty\}\), there exists a rearrangement \(\sum a_{\sigma(n)}\) (where \(\sigma : \mathbb{N} \to \mathbb{N}\) is a bijection) that converges to \(L\).

</div>

This theorem is genuinely shocking: by reordering the terms of a conditionally convergent series, we can make it sum to *any* value we like. The key is that for a conditionally convergent series, both the positive-term subseries and the negative-term subseries must diverge (to \(+\infty\) and \(-\infty\) respectively), providing unlimited "credit" and "debt" to spend.

By contrast, absolutely convergent series can be rearranged freely: every rearrangement converges to the same sum. This is why absolute convergence is the "safe" notion in analysis.

---

*These notes cover the core material of MATH 147. The approach throughout has been to develop each concept rigorously while keeping the geometric and analytic intuition in the foreground. The completeness of \(\mathbb{R}\) is the invisible thread running through every major theorem: it gives us the Monotone Convergence Theorem, Bolzano–Weierstrass, the Cauchy Criterion, the Extreme Value Theorem, the Intermediate Value Theorem, and ultimately all the machinery of analysis.*
