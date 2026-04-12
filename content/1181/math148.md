---
title: "MATH 148: Calculus 2 for Honours Mathematics"
subjects: "MATH"
---

---

# Chapter 1: The Riemann Integral

Defining integration carefully turns out to be subtle. The naive idea — "sum up infinitely many infinitely thin rectangles" — is not a definition; it is a picture. The Darboux approach makes this precise by bracketing the integral between two quantities we can actually compute: the upper sum, which overestimates by taking the supremum on each subinterval, and the lower sum, which underestimates by taking the infimum. A function is integrable precisely when these two estimates can be made arbitrarily close.

## 1.1 Upper and Lower Sums

We work throughout with bounded functions on a closed interval \([a,b]\).

<div class="definition">

<strong>Definition 1.1 (Partition).</strong> A <em>partition</em> of \([a,b]\) is a finite set \(P = \{x_0, x_1, \ldots, x_n\}\) with \(a = x_0 < x_1 < \cdots < x_n = b\). The <em>mesh</em> of \(P\) is \(\|P\| = \max_{1 \le i \le n}(x_i - x_{i-1})\). A partition \(Q\) is a <em>refinement</em> of \(P\) if \(P \subseteq Q\).

</div>

<div class="definition">

<strong>Definition 1.2 (Upper and Lower Sums).</strong> Let \(f : [a,b] \to \mathbb{R}\) be bounded and let \(P = \{x_0, \ldots, x_n\}\) be a partition. For each subinterval \([x_{i-1}, x_i]\), set
\[M_i = \sup_{x \in [x_{i-1},x_i]} f(x), \qquad m_i = \inf_{x \in [x_{i-1},x_i]} f(x).\]
The <em>upper sum</em> and <em>lower sum</em> of \(f\) with respect to \(P\) are
\[U(f,P) = \sum_{i=1}^n M_i (x_i - x_{i-1}), \qquad L(f,P) = \sum_{i=1}^n m_i (x_i - x_{i-1}).\]

</div>

Notice that \(L(f,P) \le U(f,P)\) always, since \(m_i \le M_i\). The key monotonicity property is that refining a partition can only improve the estimates: upper sums decrease and lower sums increase.

<div class="lemma">

<strong>Lemma 1.3 (Refinement Lemma).</strong> If \(Q\) is a refinement of \(P\), then \(L(f,P) \le L(f,Q)\) and \(U(f,Q) \le U(f,P)\).

</div>

*Proof.* It suffices to check the effect of adding a single point. Suppose \(Q = P \cup \{x^*\}\) where \(x^* \in (x_{k-1}, x_k)\). Every term in \(U(f,Q)\) except those for \([x_{k-1},x^*]\) and \([x^*,x_k]\) coincides with the corresponding term in \(U(f,P)\). For the affected term,
\[\sup_{[x_{k-1},x_k]} f \cdot (x_k - x_{k-1}) \ge \sup_{[x_{k-1},x^*]} f \cdot (x^* - x_{k-1}) + \sup_{[x^*,x_k]} f \cdot (x_k - x^*),\]
since the supremum over a larger set is at least as large. Hence \(U(f,Q) \le U(f,P)\). The lower sum case is analogous. \(\square\)

<div class="corollary">

<strong>Corollary 1.4.</strong> For any two partitions \(P\) and \(Q\) of \([a,b]\), \(L(f,P) \le U(f,Q)\).

</div>

*Proof.* Let \(R = P \cup Q\). Then \(L(f,P) \le L(f,R) \le U(f,R) \le U(f,Q)\). \(\square\)

This corollary says every lower sum is a lower bound for every upper sum. It follows that
\[\sup_P L(f,P) \le \inf_P U(f,P),\]
and the gap between these two quantities measures how "integrable" \(f\) is.

<div class="definition">

<strong>Definition 1.5 (Upper and Lower Integrals).</strong> The <em>lower integral</em> and <em>upper integral</em> of \(f\) on \([a,b]\) are
\[\underline{\int_a^b} f = \sup_P L(f,P), \qquad \overline{\int_a^b} f = \inf_P U(f,P).\]

</div>

## 1.2 Riemann Integrability

We now have the tools to say precisely what it means for a function to be integrable.

<div class="definition">

<strong>Definition 1.6 (Darboux Integrability).</strong> A bounded function \(f : [a,b] \to \mathbb{R}\) is <em>Darboux integrable</em> (or simply <em>integrable</em>) on \([a,b]\) if
\[\underline{\int_a^b} f = \overline{\int_a^b} f.\]
The common value is the <em>definite integral</em> \(\displaystyle\int_a^b f(x)\,dx\).

</div>

The following criterion gives a practical way to verify integrability without computing the supremum and infimum explicitly.

<div class="theorem">

<strong>Theorem 1.7 (Cauchy Criterion for Integrability).</strong> A bounded function \(f\) is integrable on \([a,b]\) if and only if for every \(\varepsilon > 0\) there exists a partition \(P\) such that \(U(f,P) - L(f,P) < \varepsilon\).

</div>

*Proof.* If the criterion holds, then for each \(\varepsilon > 0\) we find \(P\) with \(U(f,P) - L(f,P) < \varepsilon\). Since \(L(f,P) \le \underline{\int} f \le \overline{\int} f \le U(f,P)\), we get \(0 \le \overline{\int} f - \underline{\int} f < \varepsilon\). Since \(\varepsilon\) is arbitrary, the two integrals agree. The converse is similar. \(\square\)

<div class="theorem">

<strong>Theorem 1.8 (Continuous Functions are Integrable).</strong> If \(f : [a,b] \to \mathbb{R}\) is continuous, then \(f\) is integrable on \([a,b]\).

</div>

*Proof.* Since \(f\) is continuous on a closed bounded interval, it is uniformly continuous: for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that \(|x-y| < \delta\) implies \(|f(x) - f(y)| < \varepsilon/(b-a)\). Choose any partition \(P\) with \(\|P\| < \delta\). On each subinterval \([x_{i-1},x_i]\), the oscillation \(M_i - m_i < \varepsilon/(b-a)\). Then
\[U(f,P) - L(f,P) = \sum_{i=1}^n (M_i - m_i)(x_i - x_{i-1}) < \frac{\varepsilon}{b-a}\sum_{i=1}^n (x_i - x_{i-1}) = \varepsilon. \quad \square\]

<div class="theorem">

<strong>Theorem 1.9 (Monotone Functions are Integrable).</strong> If \(f : [a,b] \to \mathbb{R}\) is monotone and bounded, then \(f\) is integrable on \([a,b]\).

</div>

*Proof.* Assume \(f\) is non-decreasing (the decreasing case is symmetric). For the uniform partition \(P_n\) with \(n\) subintervals of length \(\Delta x = (b-a)/n\), on each subinterval \(m_i = f(x_{i-1})\) and \(M_i = f(x_i)\). Hence
\[U(f,P_n) - L(f,P_n) = \Delta x \sum_{i=1}^n (f(x_i) - f(x_{i-1})) = \frac{b-a}{n}(f(b) - f(a)) \to 0.\quad \square\]

<div class="remark">

<strong>Remark 1.10.</strong> More generally, a bounded function with finitely many discontinuities is integrable (each discontinuity can be enclosed in a small subinterval contributing negligible oscillation). The full characterisation — due to Lebesgue — is that a bounded function is Riemann integrable if and only if its set of discontinuities has measure zero. This is proved in PMATH 451.

</div>

## 1.3 Properties of the Integral

The integral inherits the expected algebraic and order properties directly from the definitions.

<div class="theorem">

<strong>Theorem 1.11 (Properties of the Definite Integral).</strong> Let \(f, g : [a,b] \to \mathbb{R}\) be integrable. Then:

(i) <em>Linearity:</em> \(\int_a^b (cf + g) = c\int_a^b f + \int_a^b g\) for any \(c \in \mathbb{R}\).

(ii) <em>Additivity:</em> If \(c \in (a,b)\), then \(\int_a^b f = \int_a^c f + \int_c^b f\).

(iii) <em>Monotonicity:</em> If \(f \le g\) on \([a,b]\), then \(\int_a^b f \le \int_a^b g\).

(iv) <em>Triangle inequality:</em> \(|f|\) is integrable and \(\left|\int_a^b f\right| \le \int_a^b |f|\).

(v) <em>Bounds:</em> If \(m \le f \le M\) on \([a,b]\), then \(m(b-a) \le \int_a^b f \le M(b-a)\).

</div>

<div class="theorem">

<strong>Theorem 1.12 (Mean Value Theorem for Integrals).</strong> If \(f : [a,b] \to \mathbb{R}\) is continuous, there exists \(c \in [a,b]\) with
\[f(c) = \frac{1}{b-a}\int_a^b f(x)\,dx.\]

</div>

*Proof.* By the Extreme Value Theorem, \(f\) attains its minimum \(m\) and maximum \(M\) on \([a,b]\). By Theorem 1.11(v), \(m \le \frac{1}{b-a}\int_a^b f \le M\). By the Intermediate Value Theorem, \(f\) takes every value between \(m\) and \(M\), so in particular it takes the value \(\frac{1}{b-a}\int_a^b f\) at some \(c \in [a,b]\). \(\square\)

## 1.4 The Fundamental Theorem of Calculus

The Fundamental Theorem is the central result of calculus: it says that differentiation and integration are inverse operations. We prove both parts with full rigour.

![FTC: F'(x)=f(x) and area under curve equals F(b)−F(a)](/pics/math148/ftc.png)

<div class="definition">

<strong>Definition 1.13 (Accumulation Function).</strong> If \(f\) is integrable on \([a,b]\), the <em>accumulation function</em> of \(f\) based at \(a\) is
\[F(x) = \int_a^x f(t)\,dt, \quad x \in [a,b].\]

</div>

<div class="theorem">

<strong>Theorem 1.14 (Fundamental Theorem of Calculus, Part 1).</strong> If \(f : [a,b] \to \mathbb{R}\) is integrable and \(f\) is continuous at \(x_0 \in [a,b]\), then \(F\) is differentiable at \(x_0\) and \(F'(x_0) = f(x_0)\).

</div>

*Proof.* We estimate the difference quotient. For \(h > 0\) (the case \(h < 0\) is analogous),
\[\frac{F(x_0+h) - F(x_0)}{h} = \frac{1}{h}\int_{x_0}^{x_0+h} f(t)\,dt.\]
We compare this to \(f(x_0) = \frac{1}{h}\int_{x_0}^{x_0+h} f(x_0)\,dt\). Their difference is
\[\left|\frac{F(x_0+h)-F(x_0)}{h} - f(x_0)\right| = \left|\frac{1}{h}\int_{x_0}^{x_0+h}(f(t)-f(x_0))\,dt\right| \le \frac{1}{h}\int_{x_0}^{x_0+h}|f(t)-f(x_0)|\,dt.\]
Given \(\varepsilon > 0\), by continuity of \(f\) at \(x_0\) there exists \(\delta > 0\) such that \(|t - x_0| < \delta\) implies \(|f(t) - f(x_0)| < \varepsilon\). For \(0 < h < \delta\), every \(t \in [x_0, x_0+h]\) satisfies \(|t-x_0| < \delta\), so the expression above is at most \(\frac{1}{h} \cdot \varepsilon h = \varepsilon\). Hence the limit is \(f(x_0)\). \(\square\)

The geometric meaning is immediate: \(F(x)\) measures accumulated area, and its rate of change at any point is precisely the height of \(f\) at that point. If \(f\) is large at \(x_0\), area is accumulating quickly; if \(f\) is small or negative, area accumulates slowly or decreases.

<div class="theorem">

<strong>Theorem 1.15 (Fundamental Theorem of Calculus, Part 2).</strong> If \(f : [a,b] \to \mathbb{R}\) is continuous and \(G : [a,b] \to \mathbb{R}\) satisfies \(G' = f\) on \([a,b]\), then
\[\int_a^b f(x)\,dx = G(b) - G(a).\]

</div>

*Proof.* Let \(F(x) = \int_a^x f(t)\,dt\). By Part 1, \(F' = f = G'\) on \([a,b]\). Hence \((G - F)' = 0\) on \([a,b]\), so \(G - F\) is constant by the Mean Value Theorem: \(G(x) - F(x) = C\) for all \(x\). Setting \(x = a\) gives \(C = G(a) - F(a) = G(a)\) since \(F(a) = 0\). Therefore \(G(b) - F(b) = G(a)\), i.e., \(\int_a^b f = F(b) = G(b) - G(a)\). \(\square\)

<div class="theorem">

<strong>Theorem 1.16 (Extended FTC / Leibniz Rule).</strong> If \(f\) is continuous and \(u, v\) are differentiable, then
\[\frac{d}{dx}\int_{u(x)}^{v(x)} f(t)\,dt = f(v(x))\,v'(x) - f(u(x))\,u'(x).\]

</div>

---

# Chapter 2: Integration Techniques

With the theoretical foundation secure, we develop the computational toolkit. Every technique is ultimately a restatement of either the chain rule (substitution) or the product rule (integration by parts).

## 2.1 Substitution

<div class="theorem">

<strong>Theorem 2.1 (Substitution Rule).</strong> If \(g : [a,b] \to \mathbb{R}\) is continuously differentiable and \(f\) is continuous on the range of \(g\), then
\[\int_a^b f(g(x))\,g'(x)\,dx = \int_{g(a)}^{g(b)} f(u)\,du.\]

</div>

*Proof.* Let \(F\) be an antiderivative of \(f\). By the chain rule, \(\frac{d}{dx}F(g(x)) = f(g(x))g'(x)\). By FTC Part 2, both sides equal \(F(g(b)) - F(g(a))\). \(\square\)

## 2.2 Integration by Parts

<div class="theorem">

<strong>Theorem 2.2 (Integration by Parts).</strong> If \(f'\) and \(g'\) are continuous on \([a,b]\), then
\[\int_a^b f(x)\,g'(x)\,dx = f(x)g(x)\Big|_a^b - \int_a^b f'(x)\,g(x)\,dx.\]

</div>

*Proof.* The product rule gives \((fg)' = f'g + fg'\). Integrating and applying FTC Part 2 yields the result. \(\square\)

The mnemonic is \(\int u\,dv = uv - \int v\,du\). The art lies in choosing \(u\) and \(dv\). A useful hierarchy for \(u\): logarithms, inverse trig functions, polynomials, trig functions, exponentials (LIPTE). Among the key applications: \(\int \ln x\,dx = x\ln x - x + C\) (taking \(u = \ln x\), \(dv = dx\)); the reduction formula for \(\int x^n e^x\,dx\); and the self-referential trick for \(\int e^x \sin x\,dx\) where integrating by parts twice returns the original integral.

## 2.3 Trigonometric Substitution

When an integrand contains \(\sqrt{a^2 - x^2}\), \(\sqrt{a^2 + x^2}\), or \(\sqrt{x^2 - a^2}\), a trigonometric substitution eliminates the radical by exploiting a Pythagorean identity.

| Form | Substitution | Identity |
|---|---|---|
| \(\sqrt{a^2 - x^2}\) | \(x = a\sin\theta\) | \(1 - \sin^2\theta = \cos^2\theta\) |
| \(\sqrt{a^2 + x^2}\) | \(x = a\tan\theta\) | \(1 + \tan^2\theta = \sec^2\theta\) |
| \(\sqrt{x^2 - a^2}\) | \(x = a\sec\theta\) | \(\sec^2\theta - 1 = \tan^2\theta\) |

After substituting and integrating in \(\theta\), one converts back to \(x\) using a reference triangle. For example, \(\int_0^1 \sqrt{1-x^2}\,dx = \frac{\pi}{4}\), computing the area of a quarter-circle.

## 2.4 Partial Fractions

Every rational function \(p(x)/q(x)\) with \(\deg p < \deg q\) can be decomposed into simpler fractions, each of which is straightforward to integrate. The decomposition is guaranteed by the Fundamental Theorem of Algebra, which states that every real polynomial factors completely into linear and irreducible quadratic factors over \(\mathbb{R}\).

<div class="definition">

<strong>Definition 2.3 (Partial Fraction Decomposition).</strong> Let \(r(x) = p(x)/q(x)\) with \(\deg p < \deg q\). Factor \(q(x)\) as \(a\prod_j (x - \alpha_j)^{m_j} \prod_k (x^2 + b_k x + c_k)^{n_k}\) over \(\mathbb{R}\). The partial fraction decomposition writes \(r(x)\) as a sum: each linear factor \((x - \alpha_j)^{m_j}\) contributes \(\sum_{s=1}^{m_j} \frac{A_{j,s}}{(x-\alpha_j)^s}\), and each irreducible quadratic factor \((x^2 + b_k x + c_k)^{n_k}\) contributes \(\sum_{s=1}^{n_k} \frac{B_{k,s}x + C_{k,s}}{(x^2+b_kx+c_k)^s}\).

</div>

If \(\deg p \ge \deg q\), perform polynomial long division first to write \(r = q_0 + p_1/q\) with \(\deg p_1 < \deg q\). The integrals of each piece involve \(\ln|x - \alpha|\), \(\arctan\), and — for repeated quadratic factors — recursive reduction formulas.

---

# Chapter 3: Improper Integrals

So far our integral handles bounded functions on bounded intervals. Many natural integrands — Gaussian densities, the Gamma function, inverse powers near a singularity — require extending this definition. Improper integrals do so by taking limits, and the question of convergence becomes central.

## 3.1 Type I and Type II Improper Integrals

<div class="definition">

<strong>Definition 3.1 (Type I Improper Integrals).</strong> If \(f\) is integrable on \([a,b]\) for all \(b > a\), we define
\[\int_a^\infty f(x)\,dx = \lim_{b \to \infty} \int_a^b f(x)\,dx\]
when this limit exists (and is finite). Similarly for \(\int_{-\infty}^a\) and \(\int_{-\infty}^\infty\) (the last requires splitting at some finite point \(c\) and demanding both halves converge independently).

</div>

<div class="definition">

<strong>Definition 3.2 (Type II Improper Integrals).</strong> If \(f\) is integrable on \([a+\varepsilon, b]\) for all \(\varepsilon > 0\) but has a singularity at \(a\), we define
\[\int_a^b f(x)\,dx = \lim_{\varepsilon \to 0^+} \int_{a+\varepsilon}^b f(x)\,dx.\]
Similarly for singularities at \(b\) or at an interior point.

</div>

<div class="theorem">

<strong>Theorem 3.3 (\(p\)-Test, Type I).</strong> The integral \(\int_1^\infty x^{-p}\,dx\) converges if and only if \(p > 1\). When \(p > 1\), its value is \(\frac{1}{p-1}\).

</div>

<div class="theorem">

<strong>Theorem 3.4 (\(p\)-Test, Type II).</strong> The integral \(\int_0^1 x^{-p}\,dx\) converges if and only if \(p < 1\). When \(p < 1\), its value is \(\frac{1}{1-p}\).

</div>

Notice that the two \(p\)-tests have complementary conditions: the integral to infinity converges for large \(p\) (the function decays fast enough), while the integral near zero converges for small \(p\) (the singularity is not too severe). Together they govern a vast array of comparison arguments.

## 3.2 Absolute Convergence

Not every convergent improper integral converges because the integrand is eventually non-negative; the integral may converge through cancellation. This distinction is important.

<div class="definition">

<strong>Definition 3.5 (Absolute Convergence of an Integral).</strong> The integral \(\int_a^\infty f(x)\,dx\) <em>converges absolutely</em> if \(\int_a^\infty |f(x)|\,dx\) converges.

</div>

<div class="theorem">

<strong>Theorem 3.6 (Absolute Convergence Implies Convergence).</strong> If \(\int_a^\infty |f(x)|\,dx < \infty\), then \(\int_a^\infty f(x)\,dx\) converges.

</div>

*Proof.* Write \(f = f^+ - f^-\) where \(f^+ = \max(f,0)\) and \(f^- = \max(-f,0)\). Both \(f^+\) and \(f^-\) are non-negative and bounded by \(|f|\), so both integrals converge by the comparison test. Hence \(\int f = \int f^+ - \int f^-\) converges. \(\square\)

A function like \(f(x) = \sin(x)/x\) on \([1,\infty)\) converges conditionally but not absolutely: the oscillation provides cancellation that the absolute value destroys. This parallels the series distinction between absolute and conditional convergence.

## 3.3 Comparison Tests

![Comparison test: 0 ≤ f(x) ≤ g(x), f converges while g diverges](/pics/math148/comparison_test.png)

<div class="theorem">

<strong>Theorem 3.7 (Direct Comparison Test).</strong> Suppose \(0 \le g(x) \le f(x)\) for \(x \ge a\), with both functions continuous.

1. If \(\int_a^\infty f\,dx\) converges, then \(\int_a^\infty g\,dx\) converges.
2. If \(\int_a^\infty g\,dx\) diverges, then \(\int_a^\infty f\,dx\) diverges.

</div>

<div class="theorem">

<strong>Theorem 3.8 (Limit Comparison Test).</strong> Suppose \(f, g > 0\) on \([a,\infty)\) and \(\lim_{x \to \infty} f(x)/g(x) = L\).

1. If \(0 < L < \infty\), then \(\int_a^\infty f\) and \(\int_a^\infty g\) either both converge or both diverge.
2. If \(L = 0\) and \(\int_a^\infty g\) converges, then \(\int_a^\infty f\) converges.

</div>

<div class="definition">

<strong>Definition 3.9 (Gamma Function).</strong> For \(x > 0\), the <em>Gamma function</em> is \(\Gamma(x) = \int_0^\infty t^{x-1}e^{-t}\,dt\). This integral converges: the singularity at 0 is of type \(t^{x-1}\) (integrable when \(x > 0\)), and the decay \(e^{-t}\) dominates any polynomial at infinity.

</div>

Integrating by parts with \(u = t^x\) and \(dv = e^{-t}\,dt\) yields the functional equation \(\Gamma(x+1) = x\,\Gamma(x)\). Since \(\Gamma(1) = 1\), induction gives \(\Gamma(n) = (n-1)!\) for positive integers \(n\). The Gamma function is the unique (up to normalisation) log-convex extension of the factorial to the positive reals.

---

# Chapter 4: Applications of Integration

Integration measures more than area; it is the natural tool for any quantity built by accumulation — volume, arc length, work, and probability. The unifying idea is always the same: approximate by a Riemann sum, pass to the limit, and the approximation becomes an integral.

## 4.1 Area and Volume

<div class="definition">

<strong>Definition 4.1 (Area Between Curves).</strong> If \(f, g : [a,b] \to \mathbb{R}\) are continuous, the area of the region between their graphs is
\[A = \int_a^b |f(x) - g(x)|\,dx.\]

</div>

When the curves cross, one must identify the crossing points and split the integral accordingly.

For volumes, we use the <em>method of cross-sections</em>: if \(A(x)\) is the area of the cross-section of a solid at position \(x\), then the volume is \(V = \int_a^b A(x)\,dx\). Two specialisations are particularly useful.

<div class="definition">

<strong>Definition 4.2 (Disk/Washer Method).</strong> The volume obtained by rotating \(y = f(x) \ge 0\) around the \(x\)-axis over \([a,b]\) is
\[V = \int_a^b \pi [f(x)]^2\,dx.\]
If a region between \(0 \le f(x) \le g(x)\) is rotated, we subtract the inner disk:
\[V = \int_a^b \pi[(g(x))^2 - (f(x))^2]\,dx.\]

</div>

<div class="definition">

<strong>Definition 4.3 (Shell Method).</strong> The volume obtained by rotating the region between \(f(x)\) and \(g(x)\) (with \(f \le g\)) around the \(y\)-axis over \([a,b]\) (with \(a \ge 0\)) is
\[V = \int_a^b 2\pi x\,(g(x) - f(x))\,dx.\]

</div>

## 4.2 Arc Length

For a smooth parametric curve \(\vec{r}(t) = (x(t), y(t))\), \(t \in [a,b]\), the length is obtained by approximating the curve by polygonal segments and passing to the limit. The result is clean because the Euclidean norm of the velocity vector \(\vec{r}'(t) = (x'(t), y'(t))\) is exactly the instantaneous speed.

<div class="definition">

<strong>Definition 4.4 (Arc Length).</strong> If \(\vec{r} : [a,b] \to \mathbb{R}^2\) is continuously differentiable, the <em>arc length</em> of the curve is
\[L = \int_a^b \|\vec{r}'(t)\|\,dt = \int_a^b \sqrt{(x'(t))^2 + (y'(t))^2}\,dt.\]

</div>

For a graph \(y = f(x)\), parametrised as \(\vec{r}(t) = (t, f(t))\), this reduces to the familiar formula \(L = \int_a^b \sqrt{1 + (f'(x))^2}\,dx\).

The rigorous justification: approximate by polygonal segments with vertices at \(\vec{r}(t_0), \vec{r}(t_1), \ldots, \vec{r}(t_n)\). The length of the \(i\)-th segment is \(\|\vec{r}(t_i) - \vec{r}(t_{i-1})\|\). By the mean value theorem applied to each component, \(\|\vec{r}(t_i) - \vec{r}(t_{i-1})\| \approx \|\vec{r}'(\xi_i)\|(t_i - t_{i-1})\) for some \(\xi_i\) in the subinterval, and the sum converges to the integral.

<div class="definition">

<strong>Definition 4.5 (Arc Length Function and Unit Tangent).</strong> The arc length function \(s(t) = \int_a^t \|\vec{r}'(\tau)\|\,d\tau\) satisfies \(s'(t) = \|\vec{r}'(t)\|\). The <em>unit tangent vector</em> is \(\hat{T}(t) = \vec{r}'(t)/\|\vec{r}'(t)\|\).

</div>

## 4.3 Work and Physics Applications

In physics, work is the line integral of force over displacement. When force \(F(x)\) is variable along a one-dimensional path,
\[W = \int_a^b F(x)\,dx.\]
Hooke's Law \(F(x) = kx\) for a spring gives \(W = \frac{1}{2}k(b^2 - a^2)\). Gravitational and hydrostatic pressure problems follow the same accumulation principle: slice the region into thin pieces, approximate the contribution of each slice, and integrate.

---

# Chapter 5: Differential Equations

A differential equation relates a function to its derivatives, encoding how a quantity changes in response to its current state. The subject sits at the intersection of analysis, geometry (direction fields), and modelling. For MATH 148, we emphasise: (a) two families of equations with explicit solution formulas, (b) the geometric picture of solution curves, and (c) the fundamental existence and uniqueness theorem that guarantees a unique solution before we search for it.

## 5.1 Separable Equations

<div class="definition">

<strong>Definition 5.1 (Separable Differential Equation).</strong> A first-order ODE is <em>separable</em> if it has the form \(y' = f(x)\,g(y)\). The variables can be "separated": \(\frac{dy}{g(y)} = f(x)\,dx\).

</div>

The method is: (1) find equilibrium solutions \(g(y_0) = 0\); (2) for non-equilibrium solutions, integrate both sides after separating, obtaining \(\int \frac{dy}{g(y)} = \int f(x)\,dx + C\); (3) solve for \(y\) if possible.

The justification is clean: if \(y = \varphi(x)\) is a solution, then by the chain rule and the equation \(\varphi' = f(x)g(\varphi)\), both sides when integrated give the same value, and the equality of antiderivatives is guaranteed by FTC.

## 5.2 Linear First-Order Equations

<div class="definition">

<strong>Definition 5.2 (First-Order Linear ODE).</strong> An ODE is <em>linear and first-order</em> if it has the form \(y' = p(x)\,y + q(x)\), or equivalently \(y' - p(x)\,y = q(x)\).

</div>

<div class="theorem">

<strong>Theorem 5.3 (Integrating Factor Method).</strong> The general solution to \(y' - p(x)\,y = q(x)\) is
\[y(x) = e^{P(x)}\left(\int q(x)\,e^{-P(x)}\,dx + C\right)\]
where \(P(x) = \int p(x)\,dx\). The function \(\mu(x) = e^{-P(x)}\) is the <em>integrating factor</em>.

</div>

*Proof.* Multiply the equation by \(\mu(x) = e^{-P(x)}\). The left side becomes \(\frac{d}{dx}[\mu(x)\,y(x)]\) by the product rule (since \(\mu' = -p(x)\mu\)). Integrating gives \(\mu(x)y(x) = \int q(x)\mu(x)\,dx + C\), and dividing by \(\mu(x)>0\) yields the result. \(\square\)

## 5.3 Existence and Uniqueness

Before solving any initial value problem, we should ask: does a solution exist, and is it unique? Without an existence theorem, our search for a solution might be futile; without uniqueness, a single initial condition might lead to multiple incompatible solutions. The following theorem, known as the Picard–Lindelöf theorem, answers both questions under mild assumptions.

<div class="theorem">

<strong>Theorem 5.4 (Picard–Lindelöf Existence and Uniqueness).</strong> Suppose \(f : U \to \mathbb{R}\) is defined on an open set \(U \subseteq \mathbb{R}^2\) containing the point \((x_0, y_0)\), that \(f\) is continuous on \(U\), and that \(f\) satisfies a <em>Lipschitz condition</em> in \(y\): there exists \(L > 0\) such that
\[|f(x,y_1) - f(x,y_2)| \le L|y_1 - y_2|\]
for all \((x,y_1), (x,y_2) \in U\). Then there exists \(\delta > 0\) and a unique function \(\varphi : (x_0 - \delta, x_0 + \delta) \to \mathbb{R}\) satisfying
\[\varphi'(x) = f(x, \varphi(x)), \quad \varphi(x_0) = y_0.\]

</div>

The Lipschitz condition is satisfied whenever \(\partial f/\partial y\) exists and is bounded on \(U\) — in particular, whenever \(f\) is \(C^1\). The proof constructs the solution as the limit of the Picard iterates:
\[\varphi_0(x) = y_0, \qquad \varphi_{n+1}(x) = y_0 + \int_{x_0}^x f(t, \varphi_n(t))\,dt.\]
One verifies that this sequence converges uniformly on a small interval using the Lipschitz condition and the contraction mapping principle.

<div class="remark">

<strong>Remark 5.5.</strong> The Lipschitz hypothesis is necessary. The equation \(y' = y^{2/3}\), \(y(0) = 0\) has both \(y \equiv 0\) and \(y = (x/3)^3\) as solutions: uniqueness fails because \(\partial f/\partial y = \frac{2}{3}y^{-1/3}\) is unbounded near \(y = 0\).

</div>

## 5.4 Applications

The following models all reduce to separable or linear first-order ODEs.

**Exponential Growth/Decay.** The equation \(y' = ky\) (with \(k\) constant) has the unique solution \(y = y_0 e^{k(x-x_0)}\). For radioactive decay, \(k < 0\) and the half-life is \(T_{1/2} = (\ln 2)/|k|\).

**Newton's Law of Cooling.** \(T'(t) = k(T - T_e)\) (temperature difference decays exponentially). Solution: \(T(t) = T_e + (T_0 - T_e)e^{kt}\), \(k < 0\).

**Logistic Growth.** \(P' = kP(1 - P/M)\) with carrying capacity \(M > 0\). This is separable; the explicit solution is
\[P(t) = \frac{MP_0}{P_0 + (M - P_0)e^{-kt}}.\]
As \(t \to \infty\), \(P(t) \to M\). The inflection point occurs at \(P = M/2\), where growth is fastest.

---

# Chapter 6: Sequences and Series

We turn from functions to infinite sums. Intuitively, adding infinitely many numbers can give a finite result — as the geometric series \(1 + 1/2 + 1/4 + \cdots = 2\) shows — but the conditions under which this happens are subtle. The theory of convergence tests organises our knowledge: we learn to compare unknown series against known benchmarks, and to distinguish the more stable absolute convergence from the fragile conditional convergence.

## 6.1 Sequences and Series

<div class="definition">

<strong>Definition 6.1 (Convergence of a Series).</strong> The <em>infinite series</em> \(\sum_{n=1}^\infty a_n\) <em>converges</em> to \(S \in \mathbb{R}\) if the sequence of partial sums \(S_k = \sum_{n=1}^k a_n\) satisfies \(\lim_{k \to \infty} S_k = S\). Otherwise it diverges.

</div>

<div class="theorem">

<strong>Theorem 6.2 (Geometric Series).</strong> The geometric series \(\sum_{n=0}^\infty r^n\) converges to \(\frac{1}{1-r}\) if \(|r| < 1\), and diverges if \(|r| \ge 1\).

</div>

<div class="theorem">

<strong>Theorem 6.3 (Divergence Test).</strong> If \(\sum a_n\) converges, then \(a_n \to 0\). Equivalently, if \(a_n \not\to 0\), the series diverges.

</div>

The converse fails: \(\sum 1/n\) diverges despite \(1/n \to 0\).

## 6.2 Convergence Tests

<div class="theorem">

<strong>Theorem 6.4 (Integral Test).</strong> Let \(f : [1,\infty) \to \mathbb{R}\) be positive, continuous, and decreasing with \(f(n) = a_n\). Then \(\sum_{n=1}^\infty a_n\) converges if and only if \(\int_1^\infty f(x)\,dx\) converges. Moreover, if the series converges to \(S\), then \(\int_{n+1}^\infty f \le S - S_n \le \int_n^\infty f\).

</div>

<div class="theorem">

<strong>Theorem 6.5 (\(p\)-Series).</strong> The series \(\sum_{n=1}^\infty n^{-p}\) converges if and only if \(p > 1\).

</div>

<div class="theorem">

<strong>Theorem 6.6 (Comparison Test).</strong> Suppose \(0 \le a_n \le b_n\) for all \(n\).

1. If \(\sum b_n\) converges, then \(\sum a_n\) converges.
2. If \(\sum a_n\) diverges, then \(\sum b_n\) diverges.

</div>

<div class="theorem">

<strong>Theorem 6.7 (Limit Comparison Test).</strong> Suppose \(a_n, b_n > 0\) and \(L = \lim_{n\to\infty} a_n/b_n\).

1. If \(0 < L < \infty\): \(\sum a_n\) and \(\sum b_n\) converge or diverge together.
2. If \(L = 0\) and \(\sum b_n < \infty\): then \(\sum a_n < \infty\).

</div>

<div class="theorem">

<strong>Theorem 6.8 (Alternating Series Test).</strong> If \(\{a_n\}\) is decreasing and \(a_n \to 0\), then \(\sum_{n=1}^\infty (-1)^{n-1}a_n\) converges. The error in approximating the sum by \(S_k\) satisfies \(|S - S_k| \le a_{k+1}\).

</div>

<div class="theorem">

<strong>Theorem 6.9 (Ratio Test).</strong> Let \(L = \lim_{n\to\infty}|a_{n+1}/a_n|\).

1. If \(L < 1\): the series converges absolutely.
2. If \(L > 1\): the series diverges.
3. If \(L = 1\): the test is inconclusive.

</div>

## 6.3 Absolute and Conditional Convergence

<div class="definition">

<strong>Definition 6.10 (Absolute and Conditional Convergence).</strong> A series \(\sum a_n\) <em>converges absolutely</em> if \(\sum |a_n| < \infty\). It <em>converges conditionally</em> if \(\sum a_n\) converges but \(\sum |a_n| = \infty\).

</div>

<div class="theorem">

<strong>Theorem 6.11 (Absolute Convergence Implies Convergence).</strong> If \(\sum |a_n| < \infty\), then \(\sum a_n\) converges.

</div>

*Proof.* Write \(a_n = a_n^+ - a_n^-\) as in the integral case. Both \(\sum a_n^+\) and \(\sum a_n^-\) are bounded above by \(\sum |a_n| < \infty\) and are non-negative, hence convergent. Their difference converges. \(\square\)

<div class="theorem">

<strong>Theorem 6.12 (Riemann Rearrangement).</strong>

1. If \(\sum a_n\) converges absolutely, then every rearrangement converges to the same sum.
2. If \(\sum a_n\) converges conditionally, then for any \(\alpha \in \mathbb{R} \cup \{\pm\infty\}\), there exists a rearrangement converging to \(\alpha\).

</div>

This dramatic theorem, due to Riemann, shows that absolute convergence is the "right" notion of convergence for infinite sums: only then does the sum not depend on the order of terms.

## 6.4 Power Series and Radius of Convergence

<div class="definition">

<strong>Definition 6.13 (Power Series).</strong> A <em>power series centred at \(a\)</em> is a series of the form \(\sum_{n=0}^\infty c_n(x-a)^n\), where \(x\) is a real variable and \(c_n \in \mathbb{R}\).

</div>

<div class="theorem">

<strong>Theorem 6.14 (Structure of Convergence).</strong> For a power series \(\sum c_n(x-a)^n\), exactly one of the following holds:

1. The series converges only at \(x = a\).
2. There exists \(R \in (0,\infty)\) such that the series converges absolutely for \(|x-a| < R\) and diverges for \(|x-a| > R\).
3. The series converges absolutely for all \(x \in \mathbb{R}\).

</div>

*Proof sketch.* If the series converges at some \(x_1 \ne a\), then the terms \(c_n(x_1-a)^n \to 0\), so they are bounded: \(|c_n| \le M/|x_1-a|^n\). For \(|x-a| < |x_1-a|\), the terms are bounded by \(M(|x-a|/|x_1-a|)^n\, (< 1)\), giving geometric-series convergence. The set of \(x\) for which convergence holds is therefore an interval centred at \(a\). \(\square\)

The number \(R\) is the <em>radius of convergence</em>. It can be computed via the Hadamard formula \(1/R = \limsup_{n\to\infty} |c_n|^{1/n}\), or via the ratio test: if \(\lim |c_{n+1}/c_n| = L\), then \(R = 1/L\).

## 6.5 Uniform Convergence

Uniform convergence is the key property that allows us to interchange limits with integration and differentiation. It is strictly stronger than pointwise convergence, and power series provide our main supply of uniformly convergent sequences.

<div class="definition">

<strong>Definition 6.15 (Uniform Convergence).</strong> A sequence of functions \(f_n : E \to \mathbb{R}\) <em>converges uniformly</em> to \(f : E \to \mathbb{R}\) if for every \(\varepsilon > 0\) there exists \(N\) (independent of \(x\)) such that \(n \ge N\) implies \(|f_n(x) - f(x)| < \varepsilon\) for all \(x \in E\).

</div>

The contrast with pointwise convergence is that for pointwise convergence \(N\) may depend on \(x\); for uniform convergence a single \(N\) works everywhere simultaneously.

<div class="theorem">

<strong>Theorem 6.16 (Uniform Limit of Continuous Functions is Continuous).</strong> If \(f_n\) are continuous on \(E\) and \(f_n \to f\) uniformly, then \(f\) is continuous on \(E\).

</div>

*Proof.* Fix \(x_0 \in E\) and \(\varepsilon > 0\). Choose \(N\) so that \(|f_n(x) - f(x)| < \varepsilon/3\) for all \(x \in E\) and \(n \ge N\). By continuity of \(f_N\), there exists \(\delta > 0\) such that \(|x - x_0| < \delta\) implies \(|f_N(x) - f_N(x_0)| < \varepsilon/3\). Then for \(|x-x_0| < \delta\):
\[|f(x)-f(x_0)| \le |f(x)-f_N(x)| + |f_N(x)-f_N(x_0)| + |f_N(x_0)-f(x_0)| < \varepsilon. \quad \square\]

<div class="theorem">

<strong>Theorem 6.17 (Uniform Convergence and Integration).</strong> If \(f_n \to f\) uniformly on \([a,b]\), then
\[\lim_{n\to\infty}\int_a^b f_n(x)\,dx = \int_a^b f(x)\,dx.\]

</div>

*Proof.* \(\left|\int_a^b f_n - \int_a^b f\right| \le \int_a^b |f_n - f| \le (b-a)\sup_x|f_n(x)-f(x)| \to 0\). \(\square\)

<div class="theorem">

<strong>Theorem 6.18 (Power Series Converge Uniformly on Compact Subintervals).</strong> If \(\sum c_n(x-a)^n\) has radius of convergence \(R > 0\), then for any \(0 < r < R\) the series converges uniformly on \([a-r, a+r]\).

</div>

*Proof.* For \(|x-a| \le r < R\), we have \(|c_n(x-a)^n| \le |c_n|r^n\). Since \(r < R\), the series \(\sum |c_n|r^n\) converges (ratio test). The Weierstrass \(M\)-test (with \(M_n = |c_n|r^n\)) then gives uniform convergence. \(\square\)

---

# Chapter 7: Taylor Series

Taylor series are the ultimate tool for approximating functions by polynomials. They connect differentiation, integration, and power series into a single coherent picture. In MATH 148, we go beyond computation: we prove that power series can be differentiated and integrated termwise within the radius of convergence, and we examine the theoretical conditions under which a function equals its Taylor series.

## 7.1 Taylor and Maclaurin Series

<div class="definition">

<strong>Definition 7.1 (Taylor Series).</strong> If \(f\) has derivatives of all orders at \(a\), its <em>Taylor series centred at \(a\)</em> is
\[\sum_{n=0}^\infty \frac{f^{(n)}(a)}{n!}(x-a)^n.\]
When \(a = 0\) this is the <em>Maclaurin series</em>. The \(n\)-th partial sum \(T_{n,a}(x) = \sum_{k=0}^n \frac{f^{(k)}(a)}{k!}(x-a)^k\) is the <em>Taylor polynomial</em> of degree \(n\).

</div>

<div class="theorem">

<strong>Theorem 7.2 (Taylor's Theorem with Lagrange Remainder).</strong> If \(f\) is \((n+1)\)-times differentiable on an interval containing \(a\) and \(x\), then there exists \(c\) strictly between \(a\) and \(x\) such that
\[f(x) = T_{n,a}(x) + R_{n,a}(x), \quad R_{n,a}(x) = \frac{f^{(n+1)}(c)}{(n+1)!}(x-a)^{n+1}.\]

</div>

*Proof.* Define \(g(t) = f(x) - \sum_{k=0}^n \frac{f^{(k)}(t)}{k!}(x-t)^k - K(x-t)^{n+1}\) where \(K\) is chosen so that \(g(a) = 0\). Clearly \(g(x) = 0\). By Rolle's Theorem applied to \(g\) on \([a,x]\), there exists \(c\) with \(g'(c) = 0\). Computing \(g'(t)\) (telescoping cancellation leaves only \(-\frac{f^{(n+1)}(t)}{n!}(x-t)^n + K(n+1)(x-t)^n\)) and setting it to zero yields \(K = \frac{f^{(n+1)}(c)}{(n+1)!}\). \(\square\)

<div class="theorem">

<strong>Theorem 7.3 (Convergence of Taylor Series).</strong> If \(f\) has derivatives of all orders on an interval \(I\) containing \(a\) and there exists \(M > 0\) with \(|f^{(n)}(x)| \le M\) for all \(n\) and all \(x \in I\), then \(f(x) = \sum_{n=0}^\infty \frac{f^{(n)}(a)}{n!}(x-a)^n\) for all \(x \in I\).

</div>

*Proof.* By Taylor's Theorem, \(|R_{n,a}(x)| \le M\frac{|x-a|^{n+1}}{(n+1)!} \to 0\) as \(n \to \infty\), since \(r^n/n! \to 0\) for any fixed \(r\). \(\square\)

The standard Taylor series (valid for all \(x \in \mathbb{R}\)):
\[e^x = \sum_{n=0}^\infty \frac{x^n}{n!}, \quad \cos x = \sum_{k=0}^\infty \frac{(-1)^k x^{2k}}{(2k)!}, \quad \sin x = \sum_{k=0}^\infty \frac{(-1)^k x^{2k+1}}{(2k+1)!}.\]
For \(|x| \le 1\): \(\ln(1+x) = \sum_{n=1}^\infty \frac{(-1)^{n-1}x^n}{n}\) and \(\arctan x = \sum_{n=0}^\infty \frac{(-1)^n x^{2n+1}}{2n+1}\). Setting \(x=1\) in the arctan series gives Leibniz's formula \(\pi/4 = 1 - 1/3 + 1/5 - \cdots\).

<div class="theorem">

<strong>Theorem 7.4 (Generalized Binomial Series).</strong> For any \(\alpha \in \mathbb{R}\) and \(|x| < 1\),
\[(1+x)^\alpha = \sum_{k=0}^\infty \binom{\alpha}{k}x^k, \quad \binom{\alpha}{k} = \frac{\alpha(\alpha-1)\cdots(\alpha-k+1)}{k!}.\]

</div>

## 7.2 Termwise Differentiation and Integration

The central analytical fact about power series is that they behave exactly like polynomials with respect to differentiation and integration: we may differentiate or integrate term by term, and the radius of convergence is preserved.

<div class="theorem">

<strong>Theorem 7.5 (Termwise Differentiation of Power Series).</strong> If \(f(x) = \sum_{n=0}^\infty c_n(x-a)^n\) has radius of convergence \(R > 0\), then \(f\) is differentiable on \((a-R,a+R)\) and
\[f'(x) = \sum_{n=1}^\infty n\,c_n(x-a)^{n-1}.\]
The differentiated series also has radius of convergence \(R\).

</div>

*Proof.* Let \(g(x) = \sum_{n=1}^\infty n\,c_n(x-a)^{n-1}\). We verify that this series has radius of convergence \(R\): since \(\lim n^{1/n} = 1\), the Hadamard formula gives \(\limsup |nc_n|^{1/n} = \limsup |c_n|^{1/n} = 1/R\). By Theorem 6.18, for any \(r < R\) the original and differentiated series converge uniformly on \([a-r,a+r]\). Fix \(x_0\) with \(|x_0 - a| < R\) and choose \(r\) with \(|x_0-a| < r < R\). Consider the difference quotient:
\[\frac{f(x)-f(x_0)}{x-x_0} = \sum_{n=1}^\infty c_n \frac{(x-a)^n - (x_0-a)^n}{x - x_0}.\]
For each \(n\), by the factorisation \(\frac{u^n - v^n}{u-v} = u^{n-1}+u^{n-2}v+\cdots+v^{n-1}\), the \(n\)-th summand converges to \(n\,c_n(x_0-a)^{n-1}\) as \(x \to x_0\). The key step is that this convergence is dominated uniformly in \(n\) by a convergent series (using the bound on \([a-r,a+r]\)), allowing us to interchange the limit with the sum. Hence \(f'(x_0) = g(x_0)\). \(\square\)

Repeated application shows \(f\) has derivatives of all orders, and evaluating \(f^{(k)}(a)\) gives \(k!\,c_k\), confirming that the coefficients must be \(c_k = f^{(k)}(a)/k!\) — the Taylor coefficients. In other words, if a function has a power series representation, that representation must be its Taylor series.

<div class="theorem">

<strong>Theorem 7.6 (Termwise Integration of Power Series).</strong> If \(f(x) = \sum_{n=0}^\infty c_n(x-a)^n\) has radius of convergence \(R > 0\), then for \(|x-a| < R\),
\[\int_a^x f(t)\,dt = \sum_{n=0}^\infty \frac{c_n}{n+1}(x-a)^{n+1}.\]

</div>

*Proof.* The integrated series has the same radius of convergence \(R\) (check via the Hadamard formula). By Theorem 6.17, we may integrate the uniformly convergent partial sums termwise, and the limit of the integral equals the integral of the limit. \(\square\)

## 7.3 Applications

**Computing integrals without closed form.** The function \(e^{-x^2}\) has no elementary antiderivative, but its Maclaurin series \(\sum_{n=0}^\infty \frac{(-1)^n x^{2n}}{n!}\) integrates termwise to give
\[\int_0^x e^{-t^2}\,dt = \sum_{n=0}^\infty \frac{(-1)^n x^{2n+1}}{n!(2n+1)}.\]
This series converges for all \(x\) and gives the error function \(\operatorname{erf}(x) = \frac{2}{\sqrt{\pi}}\int_0^x e^{-t^2}\,dt\) to any desired precision.

**Euler's Formula.** Substituting \(x = i\theta\) (with \(i^2 = -1\)) into the Maclaurin series for \(e^x\) and collecting real and imaginary parts gives:
\[e^{i\theta} = \cos\theta + i\sin\theta.\]
This is the starting point for the theory of complex power series.

**Brief Note on Complex Power Series.** A power series \(\sum_{n=0}^\infty c_n(z-a)^n\) with \(c_n, a, z \in \mathbb{C}\) converges in a disk \(|z-a| < R\) in the complex plane, where \(R\) is again given by the Hadamard formula. Within this disk, all the same termwise differentiation and integration theorems hold, and the sum defines an analytic (holomorphic) function. The real and imaginary parts of a complex power series satisfy the Cauchy–Riemann equations. This is the entry point to PMATH 352 (Complex Analysis).

---

# Appendix: Vector-Valued Functions and Curves

We close with a brief treatment of vector-valued functions, which gives a coordinate-free language for parametric curves and unifies arc length, velocity, and tangent vectors.

<div class="definition">

<strong>Definition A.1 (Vector-Valued Function).</strong> A <em>vector-valued function</em> \(\vec{r} : I \to \mathbb{R}^2\) assigns to each \(t \in I\) a vector \(\vec{r}(t) = (x(t), y(t))\). The range of \(\vec{r}\) is called a <em>parametric curve</em>. The function is <em>continuous</em> (resp. <em>differentiable</em>) at \(t_0\) if both component functions are.

</div>

<div class="definition">

<strong>Definition A.2 (Derivative and Velocity).</strong>
\[\vec{r}'(t_0) = \lim_{h \to 0}\frac{\vec{r}(t_0+h) - \vec{r}(t_0)}{h} = (x'(t_0), y'(t_0)).\]
In a physical context, \(\vec{r}'(t)\) is the <em>velocity vector</em> and \(\|\vec{r}'(t)\|\) is the <em>speed</em>. The curve is <em>smooth</em> at \(t_0\) if \(\vec{r}'(t_0) \ne (0,0)\), in which case \(\vec{r}'(t_0)\) is tangent to the curve.

</div>

<div class="theorem">

<strong>Theorem A.3 (Arc Length as Integral of Speed).</strong> If \(\vec{r} : [a,b] \to \mathbb{R}^2\) is continuously differentiable, the arc length of the curve is
\[L = \int_a^b \|\vec{r}'(t)\|\,dt = \int_a^b \sqrt{(x'(t))^2 + (y'(t))^2}\,dt.\]

</div>

The derivation: partition \([a,b]\) and approximate the curve by line segments. The \(i\)-th segment has length
\[\|\vec{r}(t_i) - \vec{r}(t_{i-1})\| = \sqrt{(x(t_i)-x(t_{i-1}))^2 + (y(t_i)-y(t_{i-1}))^2}.\]
By the MVT, \(x(t_i)-x(t_{i-1}) = x'(\xi_i)\Delta t_i\) and \(y(t_i)-y(t_{i-1}) = y'(\eta_i)\Delta t_i\) for some \(\xi_i, \eta_i\) in the subinterval. Since \(\|\vec{r}'\|\) is continuous, as \(\|P\| \to 0\) the Riemann sums converge to the integral. A careful argument using uniform continuity makes this precise.

<div class="remark">

<strong>Remark A.4 (Arc Length Parametrisation).</strong> The arc length function \(s(t) = \int_a^t \|\vec{r}'(\tau)\|\,d\tau\) has \(s'(t) = \|\vec{r}'(t)\| > 0\) whenever the curve is smooth. Hence \(s\) is strictly increasing and can be inverted: reparametrising \(\vec{r}\) by arc length yields a curve with speed identically 1, the natural geometric parametrisation. The curvature \(\kappa = \|d\hat{T}/ds\|\) (rate of turning of the unit tangent with respect to arc length) is then a geometric invariant independent of parametrisation.

</div>

---

*These notes are intended to accompany the lectures of MATH 148 and should be read alongside a textbook such as Spivak's* Calculus *or Apostol's* Calculus, Vol. 1. *Problem sets are the primary vehicle for internalising the material; reading without problem-solving is insufficient.*
