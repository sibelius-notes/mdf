---
title: "MATH 137: Calculus 1 for Honours Mathematics"
subjects: "MATH"
---

This quick reference covers MATH 137 (Fall 2017, University of Waterloo), based on the course notes by Barbara A. Forrest and Brian E. Forrest. The material progresses from sequences through limits, derivatives, the Mean Value Theorem, and culminates in Taylor polynomials.

# Chapter 1: Sequences and Convergence

## 1.1 Absolute Values

The absolute value provides the fundamental notion of distance on the real number line and underpins all of the limit definitions in this course.

<div class="definition">

<strong>Definition (Absolute Value).</strong> For each \(x \in \mathbb{R}\), define the absolute value of \(x\) by

\[
|x| = \begin{cases} x & \text{if } x \ge 0 \\ -x & \text{if } x < 0. \end{cases}
\]

</div>

Geometrically, \(|x|\) is the distance from \(x\) to \(0\), and \(|a - b|\) is the distance between \(a\) and \(b\).

### 1.1.1 Inequalities Involving Absolute Values

<div class="theorem">

<strong>Theorem 1 (Triangle Inequality).</strong> Let \(x, y, z\) be any real numbers. Then

\[
|x - y| \le |x - z| + |z - y|.
\]

</div>

This says the distance from \(x\) to \(y\) never exceeds the sum of the distances from \(x\) to \(z\) and from \(z\) to \(y\).

<div class="theorem">

<strong>Theorem 2 (Triangle Inequality II).</strong> Let \(x, y \in \mathbb{R}\). Then

\[
|x + y| \le |x| + |y|.
\]

</div>

The key inequality \(|x - a| < \delta\) describes the open interval \((a - \delta, a + \delta)\), while \(0 < |x - a| < \delta\) describes \((a-\delta, a+\delta) \setminus \{a\}\). These sets appear throughout the \(\varepsilon\)-\(\delta\) framework.

## 1.2 Sequences and Their Limits

### 1.2.1 Introduction to Sequences

A sequence is an infinite ordered list of real numbers \(\{a_1, a_2, a_3, \ldots\}\), also written \(\{a_n\}_{n=1}^\infty\) or simply \(\{a_n\}\). Sequences can be given by explicit formulas (e.g.\ \(a_n = 1/n\)), by a list from which a pattern is deduced, or by recursion.

### 1.2.2 Recursively Defined Sequences

A recursively defined sequence specifies each term in terms of previous terms. For instance, \(a_1 = 1\) and \(a_{n+1} = \frac{1}{1 + a_n}\) defines a sequence whose terms converge to the golden ratio \(\frac{-1+\sqrt{5}}{2}\). Heron's algorithm for square roots uses the recursion \(a_{n+1} = \frac{1}{2}\bigl(a_n + \frac{\alpha}{a_n}\bigr)\) to approximate \(\sqrt{\alpha}\).

### 1.2.3 Subsequences and Tails

<div class="definition">

<strong>Definition (Subsequence).</strong> Let \(\{a_n\}\) be a sequence. Let \(n_1 < n_2 < n_3 < \cdots\) be natural numbers. The sequence \(\{a_{n_k}\} = \{a_{n_1}, a_{n_2}, a_{n_3}, \ldots\}\) is called a subsequence of \(\{a_n\}\).

</div>

<div class="definition">

<strong>Definition (Tail of a Sequence).</strong> Given a sequence \(\{a_n\}\) and \(k \in \mathbb{N}\), the subsequence \(\{a_k, a_{k+1}, a_{k+2}, \ldots\}\) is called the tail of \(\{a_n\}\) with cutoff \(k\).

</div>

### 1.2.4 Limits of Sequences

<div class="definition">

<strong>Definition (Limit of a Sequence, Formal I).</strong> We say that \(L\) is the limit of the sequence \(\{a_n\}\) as \(n \to \infty\) if for every \(\varepsilon > 0\) there exists \(N \in \mathbb{N}\) such that if \(n \ge N\), then \(|a_n - L| < \varepsilon\). We write \(\lim_{n\to\infty} a_n = L\).

</div>

<div class="definition">

<strong>Definition (Limit of a Sequence, Formal II).</strong> \(L = \lim_{n\to\infty} a_n\) if for every \(\varepsilon > 0\), the interval \((L - \varepsilon, L + \varepsilon)\) contains a tail of \(\{a_n\}\).

</div>

<div class="theorem">

<strong>Theorem 3 (Equivalent Characterizations of Convergence).</strong> The following are equivalent:
1. \(\lim_{n\to\infty} a_n = L\).
2. Every interval \((L-\varepsilon, L+\varepsilon)\) contains a tail of \(\{a_n\}\).
3. Every interval \((L-\varepsilon, L+\varepsilon)\) contains all but finitely many terms of \(\{a_n\}\).
4. Every open interval \((a,b)\) containing \(L\) contains a tail of \(\{a_n\}\).
5. Every open interval \((a,b)\) containing \(L\) contains all but finitely many terms of \(\{a_n\}\).

</div>

<div class="theorem">

<strong>Theorem 4 (Uniqueness of Limits for Sequences).</strong> If a sequence \(\{a_n\}\) has a limit \(L\), then \(L\) is unique.

</div>

<div class="proposition">

<strong>Proposition 5.</strong> Let \(\{a_n\}\) be a sequence with \(a_n \ge 0\) for each \(n \in \mathbb{N}\). If \(L = \lim_{n\to\infty} a_n\), then \(L \ge 0\).

</div>

### 1.2.5 Divergence to \(\pm\infty\)

<div class="definition">

<strong>Definition (Divergence to \(+\infty\)).</strong> We say \(\{a_n\}\) diverges to \(\infty\) if for every \(M > 0\) there exists \(N \in \mathbb{N}\) so that if \(n \ge N\), then \(a_n > M\). We write \(\lim_{n\to\infty} a_n = \infty\).

</div>

<div class="definition">

<strong>Definition (Divergence to \(-\infty\)).</strong> We say \(\{a_n\}\) diverges to \(-\infty\) if for every \(M < 0\) there exists \(N \in \mathbb{N}\) so that if \(n \ge N\), then \(a_n < M\). We write \(\lim_{n\to\infty} a_n = -\infty\).

</div>

<div class="theorem">

<strong>Theorem 6.</strong>
(i) If \(\alpha > 0\), then \(\lim_{n\to\infty} n^\alpha = \infty\).
(ii) If \(\alpha < 0\), then \(\lim_{n\to\infty} n^\alpha = 0\).

</div>

### 1.2.6 Arithmetic for Limits of Sequences

<div class="theorem">

<strong>Theorem 7 (Arithmetic Rules for Limits of Sequences).</strong> Let \(\lim_{n\to\infty} a_n = L\) and \(\lim_{n\to\infty} b_n = M\). Then:
<br>(i) If \(a_n = c\) for every \(n\), then \(c = L\).
<br>(ii) \(\lim_{n\to\infty} c\,a_n = cL\).
<br>(iii) \(\lim_{n\to\infty}(a_n + b_n) = L + M\).
<br>(iv) \(\lim_{n\to\infty} a_n b_n = LM\).
<br>(v) \(\lim_{n\to\infty} \frac{a_n}{b_n} = \frac{L}{M}\) if \(M \ne 0\).
<br>(vi) If \(a_n \ge 0\) for all \(n\) and \(\alpha > 0\), then \(\lim_{n\to\infty} a_n^\alpha = L^\alpha\).
<br>(vii) For any \(k \in \mathbb{N}\), \(\lim_{n\to\infty} a_{n+k} = L\).

</div>

<div class="theorem">

<strong>Theorem 8.</strong> Assume \(\lim_{n\to\infty} b_n = 0\) and \(\lim_{n\to\infty} \frac{a_n}{b_n}\) exists. Then \(\lim_{n\to\infty} a_n = 0\).

</div>

## 1.3 Squeeze Theorem

<div class="theorem">

<strong>Theorem 9 (Squeeze Theorem for Sequences).</strong> Assume \(a_n \le b_n \le c_n\) and \(\lim_{n\to\infty} a_n = L = \lim_{n\to\infty} c_n\). Then \(\{b_n\}\) converges and \(\lim_{n\to\infty} b_n = L\).

</div>

For example, since \(-1/n \le \sin(n)/n \le 1/n\) and both bounds converge to \(0\), the Squeeze Theorem gives \(\lim_{n\to\infty} \sin(n)/n = 0\).

![Squeeze theorem for sin(n)/n](/pics/math137/squeeze.png)

## 1.4 Monotone Convergence Theorem

<div class="definition">

<strong>Definition (Upper and Lower Bounds).</strong> Let \(S \subset \mathbb{R}\). We say \(\alpha\) is an upper bound of \(S\) if \(x \le \alpha\) for every \(x \in S\). We say \(\beta\) is a lower bound if \(\beta \le x\) for every \(x \in S\). \(S\) is bounded if it is bounded both above and below.

</div>

<div class="definition">

<strong>Definition (Least Upper Bound).</strong> \(\alpha = \text{lub}(S)\) if \(\alpha\) is an upper bound of \(S\) and is the smallest such upper bound. Also called the supremum, \(\sup(S)\).

</div>

<div class="definition">

<strong>Definition (Greatest Lower Bound).</strong> \(\beta = \text{glb}(S)\) if \(\beta\) is a lower bound of \(S\) and is the largest such lower bound. Also called the infimum, \(\inf(S)\).

</div>

<div class="theorem">

<strong>Axiom 10 (Least Upper Bound Property).</strong> Let \(S \subset \mathbb{R}\) be nonempty and bounded above. Then \(S\) has a least upper bound.

</div>

<div class="theorem">

<strong>Theorem 11 (Monotone Convergence Theorem).</strong> Let \(\{a_n\}\) be an increasing sequence.
<br>1. If \(\{a_n\}\) is bounded above, then \(\{a_n\}\) converges to \(L = \text{lub}(\{a_n\})\).
<br>2. If \(\{a_n\}\) is not bounded above, then \(\{a_n\}\) diverges to \(\infty\).
<br>In particular, \(\{a_n\}\) converges if and only if it is bounded above. A similar statement holds for decreasing sequences.

</div>

![Monotone convergence: increasing bounded sequence](/pics/math137/monotone_conv.png)

## 1.5 Introduction to Series

<div class="definition">

<strong>Definition (Series).</strong> Given a sequence \(\{a_n\}\), the formal sum \(\sum_{n=1}^\infty a_n\) is called a series. The \(k\)-th partial sum is \(S_k = \sum_{n=1}^k a_n\). The series converges if \(\{S_k\}\) converges; in that case \(\sum_{n=1}^\infty a_n = \lim_{k\to\infty} S_k\).

</div>

### 1.5.1 Geometric Series

<div class="definition">

<strong>Definition (Geometric Series).</strong> A geometric series is \(\sum_{n=0}^\infty r^n = 1 + r + r^2 + \cdots\). The number \(r\) is the ratio.

</div>

<div class="theorem">

<strong>Theorem 12 (Geometric Series Test).</strong> The geometric series \(\sum_{n=0}^\infty r^n\) converges if \(|r| < 1\) and diverges otherwise. If \(|r| < 1\), then

\[
\sum_{n=0}^\infty r^n = \frac{1}{1 - r}.
\]

</div>

### 1.5.2 Divergence Test

<div class="theorem">

<strong>Theorem 13 (Divergence Test).</strong> If \(\sum_{n=1}^\infty a_n\) converges, then \(\lim_{n\to\infty} a_n = 0\). Equivalently, if \(\lim_{n\to\infty} a_n \ne 0\) or does not exist, then \(\sum_{n=1}^\infty a_n\) diverges.

</div>

The converse is false: the Harmonic Series \(\sum 1/n\) diverges even though \(1/n \to 0\).

---

# Chapter 2: Limits and Continuity

## 2.1 Introduction to Limits for Functions

<div class="definition">

<strong>Definition (Limit of a Function at \(x = a\)).</strong> Let \(f\) be a function and \(a \in \mathbb{R}\). We say \(\lim_{x \to a} f(x) = L\) if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that if \(0 < |x - a| < \delta\), then \(|f(x) - L| < \varepsilon\).

</div>

<svg viewBox="0 0 320 230" xmlns="http://www.w3.org/2000/svg" style="max-width:320px;display:block;margin:1.5em auto">
  <defs>
    <marker id="edArr" markerWidth="7" markerHeight="7" refX="5" refY="3" orient="auto">
      <path d="M0,0 L0,6 L7,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <text x="160" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">ε-δ Definition of Limit</text>
  <!-- Axes -->
  <line x1="20" y1="200" x2="300" y2="200" stroke="currentColor" stroke-width="1.2" marker-end="url(#edArr)"/>
  <line x1="40" y1="215" x2="40" y2="25" stroke="currentColor" stroke-width="1.2" marker-end="url(#edArr)"/>
  <text x="303" y="204" font-size="10" fill="currentColor">x</text>
  <text x="34" y="22" font-size="10" fill="currentColor">y</text>
  <!-- Curve: f(x) = (x-160)^2/1500 + 90, in pixel coords -->
  <path d="M60,185 Q120,95 160,85 Q200,75 260,130" fill="none" stroke="currentColor" stroke-width="2"/>
  <!-- a = 160, f(a)=85 -->
  <!-- delta strip: x in [130, 190] -->
  <rect x="130" y="25" width="60" height="175" fill="#3b82f6" fill-opacity="0.10" stroke="none"/>
  <line x1="130" y1="25" x2="130" y2="200" stroke="#3b82f6" stroke-width="1.2" stroke-dasharray="4,2"/>
  <line x1="190" y1="25" x2="190" y2="200" stroke="#3b82f6" stroke-width="1.2" stroke-dasharray="4,2"/>
  <text x="130" y="215" font-size="9" fill="#3b82f6" text-anchor="middle">a−δ</text>
  <text x="190" y="215" font-size="9" fill="#3b82f6" text-anchor="middle">a+δ</text>
  <text x="160" y="215" font-size="9" fill="currentColor" text-anchor="middle">a</text>
  <circle cx="160" cy="200" r="2.5" fill="currentColor"/>
  <!-- epsilon strip: y in [65, 105] -->
  <rect x="20" y="65" width="280" height="40" fill="#ef4444" fill-opacity="0.10" stroke="none"/>
  <line x1="20" y1="65" x2="300" y2="65" stroke="#ef4444" stroke-width="1.2" stroke-dasharray="4,2"/>
  <line x1="20" y1="105" x2="300" y2="105" stroke="#ef4444" stroke-width="1.2" stroke-dasharray="4,2"/>
  <text x="18" y="62" font-size="9" fill="#ef4444" text-anchor="end">L+ε</text>
  <text x="18" y="108" font-size="9" fill="#ef4444" text-anchor="end">L−ε</text>
  <text x="16" y="87" font-size="9" fill="currentColor" text-anchor="end">L</text>
  <circle cx="40" cy="85" r="2.5" fill="currentColor"/>
  <!-- Point on curve at a -->
  <circle cx="160" cy="85" r="4" fill="#22c55e"/>
  <!-- Connecting dashed lines -->
  <line x1="160" y1="85" x2="160" y2="200" stroke="#3b82f6" stroke-width="1" stroke-dasharray="3,2" opacity="0.5"/>
  <line x1="40" y1="85" x2="160" y2="85" stroke="#ef4444" stroke-width="1" stroke-dasharray="3,2" opacity="0.5"/>
  <text x="160" y="225" font-size="9" fill="currentColor" text-anchor="middle" opacity="0.7">|x−a|&lt;δ ⟹ |f(x)−L|&lt;ε</text>
</svg>

## 2.2 Sequential Characterization of Limits

<div class="theorem">

<strong>Theorem 1 (Sequential Characterization of Limits).</strong> Let \(f\) be defined on an open interval containing \(a\), except possibly at \(a\). Then \(\lim_{x\to a} f(x) = L\) if and only if for every sequence \(\{x_n\}\) with \(x_n \ne a\) and \(x_n \to a\), we have \(\lim_{n\to\infty} f(x_n) = L\).

</div>

<div class="theorem">

<strong>Theorem 2 (Uniqueness of Limits for Functions).</strong> If \(\lim_{x\to a} f(x) = L\) and \(\lim_{x\to a} f(x) = M\), then \(L = M\).

</div>

## 2.3 Arithmetic Rules for Limits of Functions

<div class="theorem">

<strong>Theorem 3 (Arithmetic Rules for Limits of Functions).</strong> Let \(\lim_{x\to a} f(x) = L\) and \(\lim_{x\to a} g(x) = M\). Then:
<br>(i) If \(f(x) = c\) for all \(x\), then \(\lim_{x\to a} f(x) = c\).
<br>(ii) \(\lim_{x\to a} cf(x) = cL\).
<br>(iii) \(\lim_{x\to a}[f(x)+g(x)] = L+M\).
<br>(iv) \(\lim_{x\to a} f(x)g(x) = LM\).
<br>(v) \(\lim_{x\to a} \frac{f(x)}{g(x)} = \frac{L}{M}\) if \(M \ne 0\).

</div>

<div class="theorem">

<strong>Theorem 4.</strong> If \(\lim_{x\to a} \frac{f(x)}{g(x)}\) exists and \(\lim_{x\to a} g(x) = 0\), then \(\lim_{x\to a} f(x) = 0\).

</div>

<div class="theorem">

<strong>Theorem 5 (Limits of Polynomials).</strong> If \(p(x) = \alpha_0 + \alpha_1 x + \cdots + \alpha_n x^n\) is any polynomial, then \(\lim_{x\to a} p(x) = p(a)\).

</div>

## 2.4 One-sided Limits

<div class="definition">

<strong>Definition (Limit from the Right).</strong> \(\lim_{x\to a^+} f(x) = L\) if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that if \(0 < x - a < \delta\), then \(|f(x) - L| < \varepsilon\).

</div>

<div class="definition">

<strong>Definition (Limit from the Left).</strong> \(\lim_{x\to a^-} f(x) = L\) if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that if \(0 < a - x < \delta\), then \(|f(x) - L| < \varepsilon\).

</div>

<div class="theorem">

<strong>Theorem 6 (One-sided vs Two-sided Limits).</strong> \(\lim_{x\to a} f(x) = L\) exists if and only if both one-sided limits exist and \(\lim_{x\to a^-} f(x) = L = \lim_{x\to a^+} f(x)\).

</div>

## 2.5 The Squeeze Theorem

<div class="theorem">

<strong>Theorem 7 (Squeeze Theorem for Functions).</strong> Assume \(g(x) \le f(x) \le h(x)\) on an open interval containing \(a\) (except possibly at \(a\)), and \(\lim_{x\to a} g(x) = L = \lim_{x\to a} h(x)\). Then \(\lim_{x\to a} f(x) = L\).

</div>

## 2.6 The Fundamental Trigonometric Limit

<div class="theorem">

<strong>Theorem 8 (Fundamental Trigonometric Limit).</strong>

\[
\lim_{\theta \to 0} \frac{\sin(\theta)}{\theta} = 1.
\]

</div>

This is proved by comparing the areas of a triangle, a circular sector, and a larger triangle on the unit circle, then applying the Squeeze Theorem.

## 2.7 Limits at Infinity and Asymptotes

<div class="definition">

<strong>Definition (Limits at Infinity).</strong> \(\lim_{x\to\infty} f(x) = L\) means for every \(\varepsilon > 0\) there exists \(N\) such that if \(x > N\), then \(|f(x) - L| < \varepsilon\). Similarly for \(\lim_{x\to -\infty} f(x) = L\).

</div>

<div class="definition">

<strong>Definition (Horizontal Asymptote).</strong> If \(\lim_{x\to\infty} f(x) = L\) or \(\lim_{x\to -\infty} f(x) = L\), then \(y = L\) is a horizontal asymptote of \(f\).

</div>

<div class="definition">

<strong>Definition (Infinite Limits at \(\infty\)).</strong> \(\lim_{x\to\infty} f(x) = \infty\) means for every \(M > 0\) there exists \(N > 0\) such that if \(x > N\), then \(f(x) > M\).

</div>

<div class="theorem">

<strong>Theorem 9 (Squeeze Theorem at \(\pm\infty\)).</strong> If \(g(x) \le f(x) \le h(x)\) for all \(x \ge N\) and \(\lim_{x\to\infty} g(x) = L = \lim_{x\to\infty} h(x)\), then \(\lim_{x\to\infty} f(x) = L\). Analogously for \(x \to -\infty\).

</div>

### 2.7.2 Fundamental Log Limit

<div class="theorem">

<strong>Theorem 10 (Fundamental Log Limit).</strong>

\[
\lim_{x\to\infty} \frac{\ln(x)}{x} = 0.
\]

</div>

More generally, for any \(p > 0\), \(\lim_{x\to\infty} \frac{\ln(x)}{x^p} = 0\) and \(\lim_{x\to\infty} \frac{x^p}{e^x} = 0\). Logarithms grow slower than any positive power; exponentials grow faster than any polynomial.

### 2.7.3 Vertical Asymptotes and Infinite Limits

<div class="definition">

<strong>Definition (Right-Hand Infinite Limits).</strong> \(\lim_{x\to a^+} f(x) = \infty\) means for every \(M > 0\) there exists \(\delta > 0\) such that if \(a < x < a + \delta\), then \(f(x) > M\). Analogously for \(-\infty\) and for limits from the left.

</div>

<div class="definition">

<strong>Definition (Infinite Limits).</strong> \(\lim_{x\to a} f(x) = \infty\) if both \(\lim_{x\to a^-} f(x) = \infty\) and \(\lim_{x\to a^+} f(x) = \infty\).

</div>

<div class="definition">

<strong>Definition (Vertical Asymptote).</strong> If any of \(\lim_{x\to a^\pm} f(x) = \pm\infty\) holds, then \(x = a\) is a vertical asymptote for \(f\).

</div>

## 2.8 Continuity

<div class="definition">

<strong>Definition (Continuity I).</strong> A function \(f\) is continuous at \(x = a\) if (i) \(\lim_{x\to a} f(x)\) exists, and (ii) \(\lim_{x\to a} f(x) = f(a)\).

</div>

<div class="definition">

<strong>Definition (Continuity II).</strong> \(f\) is continuous at \(x = a\) if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that \(|x - a| < \delta\) implies \(|f(x) - f(a)| < \varepsilon\).

</div>

<div class="theorem">

<strong>Theorem 11 (Sequential Characterization of Continuity).</strong> \(f\) is continuous at \(x = a\) if and only if whenever \(\{x_n\}\) is a sequence with \(\lim_{n\to\infty} x_n = a\), we have \(\lim_{n\to\infty} f(x_n) = f(a)\).

</div>

### 2.8.1 Types of Discontinuities

A removable discontinuity occurs when \(\lim_{x\to a} f(x)\) exists but does not equal \(f(a)\) (or \(f(a)\) is undefined). An essential discontinuity occurs when the limit does not exist: this includes jump discontinuities (both one-sided limits exist but differ), infinite discontinuities (function blows up), and oscillatory discontinuities.

### 2.8.2--2.8.4 Continuity of Standard Functions

<div class="theorem">

<strong>Theorem 12.</strong> Polynomials are continuous everywhere. The functions \(\sin(x)\), \(\cos(x)\), \(e^x\) are continuous on \(\mathbb{R}\), and \(\ln(x)\) is continuous on \((0,\infty)\).

</div>

<div class="theorem">

<strong>Theorem 13 (Arithmetic Rules for Continuous Functions).</strong> If \(f\) and \(g\) are continuous at \(a\), then so are \(f+g\), \(fg\), \(cf\), and \(f/g\) (when \(g(a)\ne 0\)).

</div>

<div class="theorem">

<strong>Theorem 14 (Composition of Continuous Functions).</strong> If \(f\) is continuous at \(a\) and \(g\) is continuous at \(f(a)\), then \(g \circ f\) is continuous at \(a\).

</div>

<div class="definition">

<strong>Definition (Continuity on an Interval).</strong> \(f\) is continuous on an open interval \((a,b)\) if it is continuous at every point in \((a,b)\). \(f\) is continuous on \([a,b]\) if it is continuous on \((a,b)\), right-continuous at \(a\), and left-continuous at \(b\).

</div>

<div class="theorem">

<strong>Theorem 15 (Continuous Image of a Closed Interval).</strong> If \(f\) is continuous on \([a,b]\), then the range of \(f\) on \([a,b]\) is also a closed interval.

</div>

## 2.9 Intermediate Value Theorem

<div class="theorem">

<strong>Theorem 16 (Intermediate Value Theorem).</strong> If \(f\) is continuous on \([a,b]\) and \(k\) is any value between \(f(a)\) and \(f(b)\), then there exists \(c \in (a,b)\) such that \(f(c) = k\).

</div>

The IVT provides the theoretical basis for the bisection method: if \(f(a)\) and \(f(b)\) have opposite signs and \(f\) is continuous, then \(f\) has a root in \((a,b)\).

## 2.10 Extreme Value Theorem

<div class="definition">

<strong>Definition (Global Maximum and Minimum).</strong> \(c\) is a global maximum for \(f\) on \(I\) if \(f(x) \le f(c)\) for all \(x \in I\). Similarly for global minimum.

</div>

<div class="theorem">

<strong>Theorem 17 (Extreme Value Theorem).</strong> If \(f\) is continuous on a closed interval \([a,b]\), then \(f\) attains both a global maximum and a global minimum on \([a,b]\).

</div>

---

# Chapter 3: Derivatives

## 3.1 Instantaneous Velocity

If \(s(t)\) is the position of an object at time \(t\), then the instantaneous velocity at \(t_0\) is defined as \(v(t_0) = \lim_{h\to 0} \frac{s(t_0+h)-s(t_0)}{h}\), provided this limit exists. This motivates the general definition of derivative.

## 3.2 Definition of the Derivative

<div class="definition">

<strong>Definition (Derivative at \(t = a\)).</strong> \(f\) is differentiable at \(t = a\) if

\[
f'(a) = \lim_{h\to 0} \frac{f(a+h) - f(a)}{h}
\]
exists. Equivalently, \(f'(a) = \lim_{t\to a} \frac{f(t)-f(a)}{t-a}\).

</div>

### 3.2.1 The Tangent Line

<div class="definition">

<strong>Definition (Tangent Line).</strong> If \(f\) is differentiable at \(x = a\), the tangent line to the graph of \(f\) at \(x = a\) is \(y = f(a) + f'(a)(x - a)\).

</div>

### 3.2.2 Differentiability versus Continuity

<div class="theorem">

<strong>Theorem 1 (Differentiability Implies Continuity).</strong> If \(f\) is differentiable at \(t = a\), then \(f\) is continuous at \(t = a\).

</div>

The converse is false: \(f(x) = |x|\) is continuous at \(0\) but not differentiable there.

## 3.3 The Derivative Function

<div class="definition">

<strong>Definition (Derivative Function).</strong> \(f\) is differentiable on an interval \(I\) if \(f'(a)\) exists for every \(a \in I\). The derivative function is \(f'(t) = \lim_{h\to 0}\frac{f(t+h)-f(t)}{h}\).

</div>

<div class="definition">

<strong>Definition (Higher Derivatives).</strong> The second derivative is \(f'' = (f')'\), also written \(f^{(2)}\) or \(\frac{d^2 f}{dx^2}\). In general, \(f^{(n+1)} = \frac{d}{dx}(f^{(n)})\).

</div>

## 3.4 Derivatives of Elementary Functions

<div class="theorem">

<strong>Theorem 2 (Derivative of \(\sin(x)\)).</strong> If \(f(x) = \sin(x)\), then \(f'(x) = \cos(x)\).

</div>

<div class="theorem">

<strong>Theorem 3 (Derivative of \(\cos(x)\)).</strong> If \(f(x) = \cos(x)\), then \(f'(x) = -\sin(x)\).

</div>

<div class="theorem">

<strong>Theorem 4 (Derivative of \(e^x\)).</strong> If \(f(x) = e^x\), then \(f'(x) = e^x\).

</div>

## 3.5 Tangent Lines and Linear Approximation

<div class="definition">

<strong>Definition (Linear Approximation).</strong> Let \(f\) be differentiable at \(x = a\). The linear approximation to \(f\) at \(x = a\) is

\[
L_a^f(x) = f(a) + f'(a)(x - a).
\]

</div>

<div class="definition">

<strong>Definition (Error in Linear Approximation).</strong> The error is \(|f(x) - L_a(x)|\).

</div>

<div class="theorem">

<strong>Theorem 5 (Error in Linear Approximation).</strong> If \(|f''(x)| \le M\) for each \(x\) in an interval \(I\) containing \(a\), then

\[
|f(x) - L_a(x)| \le \frac{M}{2}(x - a)^2
\]
for each \(x \in I\).

</div>

## 3.6 Newton's Method

Newton's Method generates a recursive sequence \(x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}\) to approximate a root of \(f(x) = 0\). Each step uses the tangent line approximation. In favorable conditions, the number of correct decimal places roughly doubles with each iteration, making it far more efficient than the bisection method.

## 3.7 Arithmetic Rules of Differentiation

<div class="theorem">

<strong>Theorem 6 (Arithmetic Rules for Differentiation).</strong> If \(f\) and \(g\) are differentiable at \(x = a\):
<br>1) Constant Multiple: \((cf)'(a) = cf'(a)\).
<br>2) Sum Rule: \((f+g)'(a) = f'(a) + g'(a)\).
<br>3) Product Rule: \((fg)'(a) = f'(a)g(a) + f(a)g'(a)\).
<br>4) Reciprocal Rule: \((1/g)'(a) = -g'(a)/[g(a)]^2\) if \(g(a) \ne 0\).
<br>5) Quotient Rule: \((f/g)'(a) = \frac{f'(a)g(a) - f(a)g'(a)}{[g(a)]^2}\) if \(g(a) \ne 0\).

</div>

<div class="theorem">

<strong>Theorem 7 (Power Rule).</strong> If \(\alpha \in \mathbb{R}\), \(\alpha \ne 0\), and \(f(x) = x^\alpha\), then \(f'(x) = \alpha x^{\alpha - 1}\) wherever \(x^{\alpha-1}\) is defined.

</div>

## 3.8 The Chain Rule

<div class="theorem">

<strong>Theorem 8 (Chain Rule).</strong> If \(y = f(x)\) is differentiable at \(x = a\) and \(z = g(y)\) is differentiable at \(y = f(a)\), then \(h(x) = g(f(x))\) is differentiable at \(x = a\) and

\[
h'(a) = g'(f(a)) \cdot f'(a).
\]
In Leibniz notation: \(\frac{dz}{dx} = \frac{dz}{dy}\cdot\frac{dy}{dx}\).

</div>

## 3.9 Derivatives of Other Trigonometric Functions

From the quotient rule and the derivatives of \(\sin\) and \(\cos\):

\[
\frac{d}{dx}\tan(x) = \sec^2(x), \quad \frac{d}{dx}\cot(x) = -\csc^2(x),
\]

\[
\frac{d}{dx}\sec(x) = \tan(x)\sec(x), \quad \frac{d}{dx}\csc(x) = -\cot(x)\csc(x).
\]

## 3.10 Derivatives of Inverse Functions

<div class="theorem">

<strong>Theorem 9 (Inverse Function Theorem).</strong> If \(y = f(x)\) is invertible on \([c,d]\) with inverse \(x = g(y)\), \(f\) is differentiable at \(a \in (c,d)\), and \(f'(a) \ne 0\), then \(g\) is differentiable at \(b = f(a)\) and

\[
g'(b) = \frac{1}{f'(a)} = \frac{1}{f'(g(b))}.
\]

</div>

Key consequences: \(\frac{d}{dx}\ln(x) = \frac{1}{x}\).

## 3.11 Derivatives of Inverse Trigonometric Functions

Using the Chain Rule and Inverse Function Theorem:

\[
\frac{d}{dx}\arcsin(x) = \frac{1}{\sqrt{1-x^2}}, \quad \frac{d}{dx}\arccos(x) = \frac{-1}{\sqrt{1-x^2}}, \quad \frac{d}{dx}\arctan(x) = \frac{1}{1+x^2}.
\]

## 3.12 Implicit Differentiation

When a relation \(F(x,y) = 0\) implicitly defines \(y\) as a differentiable function of \(x\), we differentiate both sides with respect to \(x\) (using the Chain Rule on \(y\) terms) and solve for \(\frac{dy}{dx}\). Logarithmic differentiation handles functions of the form \(y = g(x)^{f(x)}\) by taking \(\ln\) of both sides first.

## 3.13 Local Extrema

<div class="definition">

<strong>Definition (Local Maxima and Minima).</strong> \(c\) is a local maximum for \(f\) if there exists an open interval \((a,b)\) containing \(c\) with \(f(x) \le f(c)\) for all \(x \in (a,b)\). Similarly for local minimum.

</div>

<div class="theorem">

<strong>Theorem 10 (Local Extrema Theorem).</strong> If \(c\) is a local maximum or local minimum for \(f\) and \(f'(c)\) exists, then \(f'(c) = 0\).

</div>

<div class="definition">

<strong>Definition (Critical Point).</strong> A point \(c\) in the domain of \(f\) is a critical point if \(f'(c) = 0\) or \(f'(c)\) does not exist.

</div>

---

# Chapter 4: The Mean Value Theorem

## 4.1 The Mean Value Theorem

<div class="theorem">

<strong>Theorem 1 (Mean Value Theorem).</strong> If \(f\) is continuous on \([a,b]\) and differentiable on \((a,b)\), then there exists \(c \in (a,b)\) such that

\[
f'(c) = \frac{f(b) - f(a)}{b - a}.
\]

</div>

<div class="theorem">

<strong>Theorem 2 (Rolle's Theorem).</strong> If \(f\) is continuous on \([a,b]\), differentiable on \((a,b)\), and \(f(a) = 0 = f(b)\), then there exists \(c \in (a,b)\) with \(f'(c) = 0\).

</div>

## 4.2 Applications of the Mean Value Theorem

### 4.2.1 Antiderivatives

<div class="definition">

<strong>Definition (Antiderivative).</strong> Given a function \(f\), an antiderivative is a function \(F\) such that \(F'(x) = f(x)\).

</div>

<div class="theorem">

<strong>Theorem 3 (Constant Function Theorem).</strong> If \(f'(x) = 0\) for all \(x \in I\), then \(f\) is constant on \(I\).

</div>

<div class="theorem">

<strong>Theorem 4 (Antiderivative Theorem).</strong> If \(f'(x) = g'(x)\) for all \(x \in I\), then there exists a constant \(\alpha\) such that \(f(x) = g(x) + \alpha\) for every \(x \in I\).

</div>

<div class="theorem">

<strong>Theorem 5 (Power Rule for Antiderivatives).</strong> If \(\alpha \ne -1\), then

\[
\int x^\alpha\,dx = \frac{x^{\alpha+1}}{\alpha+1} + C.
\]

</div>

### 4.2.2 Increasing Function Theorem

<div class="definition">

<strong>Definition (Increasing and Decreasing Functions).</strong> \(f\) is increasing on \(I\) if \(x_1 < x_2\) implies \(f(x_1) < f(x_2)\). \(f\) is decreasing if \(x_1 < x_2\) implies \(f(x_1) > f(x_2)\).

</div>

<div class="theorem">

<strong>Theorem 6 (Increasing/Decreasing Function Theorem).</strong>
<br>(i) If \(f'(x) > 0\) on \(I\), then \(f\) is increasing on \(I\).
<br>(ii) If \(f'(x) \ge 0\) on \(I\), then \(f\) is non-decreasing on \(I\).
<br>(iii) If \(f'(x) < 0\) on \(I\), then \(f\) is decreasing on \(I\).
<br>(iv) If \(f'(x) \le 0\) on \(I\), then \(f\) is non-increasing on \(I\).

</div>

### 4.2.3 Functions with Bounded Derivatives

<div class="theorem">

<strong>Theorem 7 (Bounded Derivative Theorem).</strong> If \(f\) is continuous on \([a,b]\), differentiable on \((a,b)\), and \(m \le f'(x) \le M\) for each \(x \in (a,b)\), then

\[
f(a) + m(x-a) \le f(x) \le f(a) + M(x-a)
\]
for all \(x \in [a,b]\).

</div>

### 4.2.4 Comparing Functions Using Their Derivatives

<div class="theorem">

<strong>Theorem 8.</strong> Assume \(f\) and \(g\) are continuous at \(x=a\) with \(f(a) = g(a)\).
<br>(i) If \(f'(x) \le g'(x)\) for all \(x > a\), then \(f(x) \le g(x)\) for all \(x > a\).
<br>(ii) If \(f'(x) \le g'(x)\) for all \(x < a\), then \(f(x) \ge g(x)\) for all \(x < a\).

</div>

<div class="theorem">

<strong>Theorem 9.</strong> For any \(\alpha \in \mathbb{R}\),

\[
e^\alpha = \lim_{n\to\infty}\left(1 + \frac{\alpha}{n}\right)^n.
\]

</div>

### 4.2.5--4.2.6 Concavity

<div class="definition">

<strong>Definition (Concavity).</strong> The graph of \(f\) is concave upwards on \(I\) if for every pair \(a, b \in I\), the secant line joining \((a,f(a))\) and \((b,f(b))\) lies above the graph. Concave downwards means the secant lies below.

</div>

<div class="theorem">

<strong>Theorem 10 (Second Derivative Test for Concavity).</strong>
<br>(i) If \(f''(x) > 0\) on \(I\), then \(f\) is concave upwards on \(I\).
<br>(ii) If \(f''(x) < 0\) on \(I\), then \(f\) is concave downwards on \(I\).

</div>

<div class="definition">

<strong>Definition (Inflection Point).</strong> \(c\) is an inflection point for \(f\) if \(f\) is continuous at \(c\) and the concavity of \(f\) changes at \(c\).

</div>

<div class="theorem">

<strong>Theorem 11 (Test for Inflection Points).</strong> If \(f''\) is continuous at \(c\) and \((c,f(c))\) is an inflection point, then \(f''(c) = 0\).

</div>

### 4.2.7 Classifying Critical Points

<div class="theorem">

<strong>Theorem 12 (First Derivative Test).</strong> Let \(c\) be a critical point of \(f\) with \(f\) continuous at \(c\).
<br>(i) If \(f'(x) < 0\) for \(x < c\) and \(f'(x) > 0\) for \(x > c\) (near \(c\)), then \(f\) has a local minimum at \(c\).
<br>(ii) If \(f'(x) > 0\) for \(x < c\) and \(f'(x) < 0\) for \(x > c\), then \(f\) has a local maximum at \(c\).

</div>

<div class="theorem">

<strong>Theorem 13 (Second Derivative Test).</strong> If \(f'(c) = 0\) and \(f''\) is continuous at \(c\):
<br>(i) If \(f''(c) < 0\), then \(f\) has a local maximum at \(c\).
<br>(ii) If \(f''(c) > 0\), then \(f\) has a local minimum at \(c\).

</div>

## 4.3 L'Hopital's Rule

<div class="theorem">

<strong>Theorem 14 (L'Hopital's Rule).</strong> Assume \(f'(x)\) and \(g'(x)\) exist near \(x = a\), \(g'(x) \ne 0\) near \(a\) (except possibly at \(a\)), and that \(\lim_{x\to a}\frac{f(x)}{g(x)}\) is indeterminate of type \(\frac{0}{0}\) or \(\frac{\infty}{\infty}\). Then

\[
\lim_{x\to a}\frac{f(x)}{g(x)} = \lim_{x\to a}\frac{f'(x)}{g'(x)}
\]
provided the latter limit exists (or is \(\pm\infty\)). The rule also holds for one-sided limits and limits at \(\pm\infty\).

</div>

Other indeterminate forms (\(0\cdot\infty\), \(\infty - \infty\), \(1^\infty\), \(\infty^0\), \(0^0\)) can often be rewritten to apply L'Hopital's Rule by algebraic manipulation or taking logarithms.

---

# Chapter 5: Taylor Polynomials and Taylor's Theorem

## 5.1 Introduction to Taylor Polynomials

Taylor polynomials encode the value of a function and its first \(n\) derivatives at a single point, providing increasingly accurate polynomial approximations.

<div class="definition">

<strong>Definition (Taylor Polynomials).</strong> Assume \(f\) is \(n\)-times differentiable at \(x = a\). The \(n\)-th degree Taylor polynomial for \(f\) centered at \(x = a\) is

\[
T_{n,a}(x) = \sum_{k=0}^{n} \frac{f^{(k)}(a)}{k!}(x-a)^k.
\]

</div>

Key examples centered at \(a = 0\):
- \(e^x = 1 + x + \frac{x^2}{2} + \frac{x^3}{6} + \cdots + \frac{x^n}{n!} + \cdots\)
- \(\sin(x) = x - \frac{x^3}{6} + \frac{x^5}{120} - \cdots\)
- \(\cos(x) = 1 - \frac{x^2}{2} + \frac{x^4}{24} - \cdots\)

![Taylor polynomials for eˣ: T₁, T₂, T₃, T₅](/pics/math137/taylor_exp.png)

## 5.2 Taylor's Theorem and Errors in Approximations

<div class="definition">

<strong>Definition (Taylor Remainder).</strong> \(R_{n,a}(x) = f(x) - T_{n,a}(x)\). The error is \(|R_{n,a}(x)|\).

</div>

<div class="theorem">

<strong>Theorem 1 (Taylor's Theorem).</strong> Assume \(f\) is \((n+1)\)-times differentiable on an interval \(I\) containing \(a\). For any \(x \in I\), there exists \(c\) between \(x\) and \(a\) such that

\[
R_{n,a}(x) = f(x) - T_{n,a}(x) = \frac{f^{(n+1)}(c)}{(n+1)!}(x-a)^{n+1}.
\]

</div>

When \(n = 0\), this reduces to the Mean Value Theorem. When \(n = 1\), it gives the error bound for linear approximation.

<div class="theorem">

<strong>Theorem 2 (Taylor's Approximation Theorem I).</strong> If \(f^{(k+1)}\) is continuous on \([-1,1]\), then there exists \(M > 0\) such that

\[
|f(x) - T_{k,0}(x)| \le M|x|^{k+1}
\]
for each \(x \in [-1,1]\).

</div>

## 5.3 Big-O

<div class="definition">

<strong>Definition (Big-O Notation).</strong> We write \(f(x) = O(g(x))\) as \(x \to a\) if there exist \(\varepsilon > 0\) and \(M > 0\) such that \(|f(x)| \le M|g(x)|\) for all \(x \in (a-\varepsilon, a+\varepsilon)\) except possibly at \(x = a\).

</div>

<div class="definition">

<strong>Definition (Extended Big-O).</strong> \(f(x) = g(x) + O(h(x))\) as \(x \to a\) means \(f(x) - g(x) = O(h(x))\) as \(x \to a\).

</div>

<div class="theorem">

<strong>Theorem 3 (Taylor's Approximation Theorem II).</strong> If \(f\) is \((n+1)\)-times differentiable on \([-r,r]\) with \(f^{(n+1)}\) continuous, then

\[
f(x) = T_{n,0}(x) + O(x^{n+1}) \quad \text{as } x \to 0.
\]

</div>

<div class="theorem">

<strong>Theorem 4 (Arithmetic of Big-O).</strong> Assume \(f(x) = O(x^n)\) and \(g(x) = O(x^m)\) as \(x \to 0\). Let \(k = \min\{n,m\}\). Then:
<br>1) \(c \cdot O(x^n) = O(x^n)\).
<br>2) \(O(x^n) + O(x^m) = O(x^k)\).
<br>3) \(O(x^n) \cdot O(x^m) = O(x^{n+m})\).
<br>4) If \(k \le n\), then \(f(x) = O(x^k)\).
<br>5) If \(k \le n\), then \(\frac{1}{x^k}O(x^n) = O(x^{n-k})\).
<br>6) \(f(u^k) = O(u^{kn})\) (substitution).

</div>

### 5.3.1 Calculating Taylor Polynomials

<div class="theorem">

<strong>Theorem 5 (Characterization of Taylor Polynomials).</strong> Assume \(r > 0\), \(f\) is \((n+1)\)-times differentiable on \([-r,r]\) with \(f^{(n+1)}\) continuous. If \(p\) is a polynomial of degree \(n\) or less with \(f(x) = p(x) + O(x^{n+1})\), then \(p(x) = T_{n,0}(x)\).

</div>

This theorem is enormously useful: it lets us find Taylor polynomials of complicated compositions and products by combining known Taylor expansions with Big-O arithmetic, completely avoiding the direct computation of higher derivatives.
