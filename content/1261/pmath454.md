---
title: "PMATH 454: Fourier Analysis"
prof: "Nico Spronk"
subjects: "PMATH"
---

## Sources and References

**Primary textbook** — Katznelson, Y. *An Introduction to Harmonic Analysis*, 3rd ed. Cambridge University Press, 2004.
**Supplementary texts** — Rudin, W. *Functional Analysis*, 2nd ed. McGraw-Hill, 1991. Folland, G.B. *Real Analysis: Modern Techniques and Their Applications*, 2nd ed. Wiley, 1999. Stein, E.M. and Shakarchi, R. *Fourier Analysis: An Introduction*, Princeton Lectures in Analysis, Vol. 1, 2003.
**Online resources** — MIT OCW 18.103 Fourier Analysis; Tao, T. lecture notes on harmonic analysis; Stein & Shakarchi *Fourier Analysis* (Princeton Lectures).

---

# Chapter 1: Fourier Series — Foundations

## Historical Origins: Heat, Controversy, and a Revolution in Mathematics

The story of Fourier analysis begins in 1807, when Joseph Fourier submitted a memoir to the French Academy of Sciences titled *Mémoire sur la propagation de la chaleur dans les corps solides* ("Memoir on the propagation of heat in solid bodies"). The manuscript contained a claim that would ignite decades of mathematical controversy: *any* function defined on an interval could be represented as an infinite sum of sines and cosines.

This was not merely a technical assertion. It was a philosophical bombshell. The eighteenth century had been dominated by the view, championed by Euler and d'Alembert, that "arbitrary" functions and "analytic" (formula-defined) functions were categorically different objects. Fourier's claim — that a step function, a function with corners, even a function defined piecewise by completely unrelated formulas, could be expressed as a sum of smooth sinusoidal waves — seemed to violate the very nature of these functions. Lagrange, one of the greatest mathematicians alive, was unconvinced. He had worked on similar problems years earlier and was skeptical that the series could converge to discontinuous functions. The Academy declined to publish the memoir.

Fourier persisted. In 1822, he published the full theory as *Théorie analytique de la chaleur* ("The Analytic Theory of Heat"). He was right about the physics — and mostly right about the mathematics. The precise question of *when* and *in what sense* the Fourier series of a function converges to that function would take another century to fully resolve, driving the development of:
- **Measure theory** (Lebesgue, 1901) — because "almost everywhere" convergence requires a precise notion of sets of measure zero;
- **Functional analysis** — because the convergence question in \(L^2\) required the theory of Hilbert spaces;
- **Set theory and descriptive set theory** — Cantor invented transfinite ordinals while working on sets of uniqueness for Fourier series;
- **The Riemann integral itself** — Riemann's 1854 habilitation thesis defined the Riemann integral specifically to study Fourier series.

In short, Fourier's 1807 memoir did not merely solve a problem in heat conduction. It created modern analysis. We study Fourier analysis not just for its applications but because it is the lens through which the structure of \(L^p\) spaces, Hilbert spaces, distribution theory, and harmonic analysis came into focus.

## The Circle Group and Periodic Functions

The natural domain for Fourier series is the **circle group** \(\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}\), which we identify with the interval \([-\pi, \pi)\) equipped with addition modulo \(2\pi\). A function \(f : \mathbb{R} \to \mathbb{C}\) is **\(2\pi\)-periodic** if \(f(x + 2\pi) = f(x)\) for all \(x \in \mathbb{R}\). The natural function spaces on \(\mathbb{T}\) are the Lebesgue spaces \(L^p(\mathbb{T})\) for \(1 \leq p \leq \infty\), defined with respect to normalized Lebesgue measure \(\frac{dx}{2\pi}\).

The circle group \(\mathbb{T}\) is simultaneously a group, a compact topological space, and a smooth manifold. This triple structure — algebraic, topological, and geometric — is what makes Fourier analysis on \(\mathbb{T}\) so rich. The "correct" measure on \(\mathbb{T}\) for group-theoretic purposes is the one that is translation-invariant: the **Haar measure**, which here is simply normalized arc length \(\frac{dx}{2\pi}\). The normalization ensures \(\int_\mathbb{T} 1\, d\mu = 1\), making \(\mathbb{T}\) a probability space and the Fourier transform a unitary operation.

The characters of \(\mathbb{T}\) — continuous group homomorphisms \(\mathbb{T} \to \mathbb{C}^\times\) of unit modulus — are exactly the exponential functions \(e_n(x) = e^{inx}\) for \(n \in \mathbb{Z}\). These form an orthonormal system in \(L^2(\mathbb{T})\):

\[
\langle e_n, e_m \rangle = \frac{1}{2\pi}\int_{-\pi}^{\pi} e^{inx}\overline{e^{imx}}\,dx = \frac{1}{2\pi}\int_{-\pi}^{\pi} e^{i(n-m)x}\,dx = \delta_{nm}.
\]

This orthonormality is the computational backbone of Fourier analysis: it means the exponentials are "independent" in an inner product sense, and the Fourier coefficients can be extracted by projecting onto each character. The fact that these characters form a **complete** orthonormal set — equivalently, that their finite linear combinations are dense in \(L^2(\mathbb{T})\) — is the content of the completeness theorem, which we prove later via Fejér's theorem.

## Fourier Coefficients and Fourier Series

<div class="definition">
<strong>Definition (Fourier Coefficients).</strong> Let \(f \in L^1(\mathbb{T})\). The <strong>Fourier coefficients</strong> of \(f\) are defined by

\[
\hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x)e^{-inx}\,dx, \quad n \in \mathbb{Z}.
\]
The <strong>formal Fourier series</strong> of \(f\) is

\[
f \sim \sum_{n=-\infty}^{\infty} \hat{f}(n)e^{inx}.
\]
The <strong>partial sums</strong> are \(S_N f(x) = \sum_{|n| \leq N} \hat{f}(n)e^{inx}\).
</div>

The tilde notation \(\sim\) is deliberate: the series need not converge to \(f\) pointwise. The central question of Fourier analysis is precisely when and in what sense the partial sums recover \(f\).

The formula for Fourier coefficients has a clean heuristic: if we believe \(f(x) = \sum_n c_n e^{inx}\), then multiply both sides by \(e^{-imx}\) and integrate:

\[
\frac{1}{2\pi}\int_{-\pi}^\pi f(x) e^{-imx}\,dx = \sum_n c_n \underbrace{\frac{1}{2\pi}\int_{-\pi}^\pi e^{i(n-m)x}\,dx}_{= \delta_{nm}} = c_m.
\]
This orthogonality computation shows that *if* \(f\) has a Fourier series, then its coefficients must be given by the formula above. The subtle issue is going the other direction: given the coefficients, does the series converge back to \(f\)?

## Worked Examples: Computing Fourier Coefficients

Let us compute the Fourier coefficients of several fundamental functions. These are not just exercises — each computation illuminates a different aspect of the theory, and several lead to famous classical identities.

### Example 1: The Sawtooth Wave \(f(x) = x\)

Consider \(f(x) = x\) on \([-\pi, \pi)\), extended to be \(2\pi\)-periodic. This function is odd (\(f(-x) = -f(x)\)), which immediately tells us that its Fourier series involves only sines (the imaginary parts of \(e^{inx}\)).

**Computation of \(\hat{f}(0)\):** Since \(f\) is odd, \(\hat{f}(0) = \frac{1}{2\pi}\int_{-\pi}^\pi x\,dx = 0\).

**Computation of \(\hat{f}(n)\) for \(n \neq 0\):** We integrate by parts:

\[
\hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^{\pi} x e^{-inx}\,dx.
\]
Let \(u = x\), \(dv = e^{-inx}\,dx\), so \(du = dx\), \(v = \frac{e^{-inx}}{-in}\). Then:

\[
\hat{f}(n) = \frac{1}{2\pi}\left[\frac{x e^{-inx}}{-in}\right]_{-\pi}^{\pi} - \frac{1}{2\pi}\int_{-\pi}^{\pi}\frac{e^{-inx}}{-in}\,dx.
\]
The boundary term: \(\frac{1}{2\pi}\cdot\frac{\pi e^{-in\pi} - (-\pi)e^{in\pi}}{-in} = \frac{1}{2\pi}\cdot\frac{\pi(e^{-in\pi} + e^{in\pi})}{-in} = \frac{1}{2\pi}\cdot\frac{2\pi\cos(n\pi)}{-in} = \frac{\cos(n\pi)}{-in} = \frac{(-1)^n}{-in}.\)

The remaining integral: \(-\frac{1}{2\pi}\cdot\frac{1}{-in}\int_{-\pi}^\pi e^{-inx}\,dx = 0\) since \(\int_{-\pi}^\pi e^{-inx}\,dx = 0\) for \(n \neq 0\).

Therefore:

\[
\hat{f}(n) = \frac{(-1)^n}{-in} = \frac{(-1)^{n+1}}{in} = \frac{(-1)^{n+1}\cdot (-i)}{n} = \frac{i(-1)^n \cdot (-1)}{n}
\]
More cleanly: \(\hat{f}(n) = \frac{(-1)^{n+1} i}{n} \cdot \frac{1}{1}.\) Wait — let us redo this carefully:

\[
\hat{f}(n) = \frac{(-1)^n}{-in} = \frac{(-1)^n}{-in}\cdot\frac{i}{i} = \frac{i(-1)^n}{n}.
\]
But we know \(f\) is real and odd, so \(\hat{f}(n)\) should be purely imaginary and odd in \(n\). Indeed: \(\hat{f}(n) = \frac{i(-1)^n}{n}\). Since \(\hat{f}(-n) = \frac{i(-1)^{-n}}{-n} = \frac{-i(-1)^n}{n} = -\hat{f}(n)\) (noting \((-1)^{-n} = (-1)^n\)), this is consistent.

The Fourier series is:

\[
x \sim \sum_{n \neq 0} \frac{i(-1)^n}{n} e^{inx} = 2\sum_{n=1}^\infty \frac{(-1)^{n+1}}{n}\sin(nx),
\]
where we combined the \(n\) and \(-n\) terms: \(\frac{i(-1)^n e^{inx}}{n} + \frac{-i(-1)^n e^{-inx}}{n} = \frac{2(-1)^n \sin(nx)}{-n} = \frac{2(-1)^{n+1}\sin(nx)}{n}\).

So the Fourier series of the sawtooth wave is:

\[
x = 2\left(\sin x - \frac{\sin 2x}{2} + \frac{\sin 3x}{3} - \frac{\sin 4x}{4} + \cdots\right), \quad x \in (-\pi, \pi).
\]

Setting \(x = \pi/2\): the right side gives \(2(1 - 0 - 1/3 + 0 + 1/5 - \cdots) = 2(1 - 1/3 + 1/5 - \cdots)\). Since the left side is \(\pi/2\), we recover the **Leibniz formula**:

\[
\frac{\pi}{4} = 1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \cdots
\]

### Example 2: The Square Wave

Let \(f(x) = \text{sgn}(x) = \begin{cases} 1 & 0 < x < \pi \\ -1 & -\pi < x < 0 \end{cases}\), extended \(2\pi\)-periodically. This is an odd function, so again only sine terms appear.

For \(n \neq 0\):

\[
\hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x) e^{-inx}\,dx = \frac{1}{2\pi}\left(\int_0^\pi e^{-inx}\,dx - \int_{-\pi}^0 e^{-inx}\,dx\right).
\]
Computing: \(\int_0^\pi e^{-inx}\,dx = \frac{1-e^{-in\pi}}{in} = \frac{1-(-1)^n}{in}\). By oddness, \(\int_{-\pi}^0 e^{-inx}\,dx = -\frac{1-(-1)^n}{in}\).

So \(\hat{f}(n) = \frac{1}{2\pi}\cdot\frac{2(1-(-1)^n)}{in} = \frac{1-(-1)^n}{\pi i n}\).

When \(n\) is even, \(\hat{f}(n) = 0\). When \(n\) is odd, \(\hat{f}(n) = \frac{2}{\pi i n}\). Thus:

\[
\text{sgn}(x) \sim \frac{4}{\pi}\left(\sin x + \frac{\sin 3x}{3} + \frac{\sin 5x}{5} + \cdots\right).
\]

This is the **Fourier series of the square wave**. It only has odd harmonics — a consequence of the half-wave symmetry \(f(x+\pi) = -f(x)\). The series converges to \(f(x)\) at all points where \(f\) is continuous (which is everywhere except \(0, \pm\pi\)), converges to \(0 = \frac{f(0^+)+f(0^-)}{2}\) at the jump discontinuities, but exhibits the **Gibbs phenomenon** near the jumps (see Section 1.6 below).

### Example 3: The Triangular Wave \(f(x) = |x|\)

The function \(f(x) = |x|\) on \([-\pi, \pi]\) is even (\(f(-x) = f(x)\)), so its Fourier series involves only cosines.

**Computation of \(\hat{f}(0)\):** \(\hat{f}(0) = \frac{1}{2\pi}\int_{-\pi}^\pi |x|\,dx = \frac{1}{2\pi}\cdot 2\int_0^\pi x\,dx = \frac{1}{2\pi}\cdot\pi^2 = \frac{\pi}{2}\).

**Computation of \(\hat{f}(n)\) for \(n \neq 0\):** Using evenness:

\[
\hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^\pi |x|e^{-inx}\,dx = \frac{1}{\pi}\int_0^\pi x\cos(nx)\,dx,
\]
since \(|x|\cos(nx)\) is even (product of two even functions). Integrating by parts:

\[
\int_0^\pi x\cos(nx)\,dx = \left[\frac{x\sin(nx)}{n}\right]_0^\pi - \int_0^\pi \frac{\sin(nx)}{n}\,dx = 0 + \frac{1}{n}\left[\frac{\cos(nx)}{n}\right]_0^\pi = \frac{\cos(n\pi) - 1}{n^2} = \frac{(-1)^n - 1}{n^2}.
\]

Therefore \(\hat{f}(n) = \frac{(-1)^n - 1}{\pi n^2}\). When \(n\) is even, \(\hat{f}(n) = 0\). When \(n\) is odd, \(\hat{f}(n) = \frac{-2}{\pi n^2}\).

The Fourier series of \(|x|\) is:

\[
|x| = \frac{\pi}{2} - \frac{4}{\pi}\left(\cos x + \frac{\cos 3x}{9} + \frac{\cos 5x}{25} + \cdots\right) = \frac{\pi}{2} - \frac{4}{\pi}\sum_{k=0}^\infty \frac{\cos((2k+1)x)}{(2k+1)^2}.
\]

**Parseval's identity applied:** By Parseval, \(\|f\|_{L^2}^2 = \sum_n |\hat{f}(n)|^2\). The left side is \(\frac{1}{2\pi}\int_{-\pi}^\pi x^2\,dx = \frac{\pi^2}{3}\). The right side:

\[
|\hat{f}(0)|^2 + 2\sum_{n=1}^\infty |\hat{f}(n)|^2 = \frac{\pi^2}{4} + 2\sum_{k=0}^\infty \frac{4}{\pi^2(2k+1)^4}.
\]
Setting these equal: \(\frac{\pi^2}{3} = \frac{\pi^2}{4} + \frac{8}{\pi^2}\sum_{k=0}^\infty \frac{1}{(2k+1)^4}\), giving \(\sum_{k=0}^\infty \frac{1}{(2k+1)^4} = \frac{\pi^4}{96}\), and from this one can recover \(\sum_{n=1}^\infty \frac{1}{n^4} = \frac{\pi^4}{90}\).

### Example 4: The Parabola \(f(x) = x^2\)

Consider \(f(x) = x^2\) on \([-\pi, \pi]\), extended periodically. This is an even function.

**Computation of \(\hat{f}(0)\):** \(\hat{f}(0) = \frac{1}{2\pi}\int_{-\pi}^\pi x^2\,dx = \frac{1}{2\pi}\cdot\frac{2\pi^3}{3} = \frac{\pi^2}{3}\).

**Computation of \(\hat{f}(n)\) for \(n \neq 0\):** Two integrations by parts give:

\[
\hat{f}(n) = \frac{1}{\pi}\int_0^\pi x^2\cos(nx)\,dx = \frac{1}{\pi}\left[\frac{x^2\sin(nx)}{n}\right]_0^\pi - \frac{2}{\pi n}\int_0^\pi x\sin(nx)\,dx.
\]
The boundary term vanishes. Continuing:

\[
\frac{2}{\pi n}\int_0^\pi x\sin(nx)\,dx = \frac{2}{\pi n}\left(\left[-\frac{x\cos(nx)}{n}\right]_0^\pi + \frac{1}{n}\int_0^\pi\cos(nx)\,dx\right) = \frac{2}{\pi n}\cdot\frac{-\pi\cos(n\pi)}{n} = \frac{-2(-1)^n}{n^2}.
\]
Therefore \(\hat{f}(n) = \frac{2(-1)^n}{n^2}\) for \(n \neq 0\). The Fourier series is:

\[
x^2 = \frac{\pi^2}{3} + 4\sum_{n=1}^\infty \frac{(-1)^n}{n^2}\cos(nx) = \frac{\pi^2}{3} - 4\cos x + \cos 2x - \frac{4\cos 3x}{9} + \frac{4\cos 4x}{16} - \cdots
\]

Wait — let us recheck: \(\hat{f}(n) = \frac{2(-1)^n}{n^2}\), so the series is \(\frac{\pi^2}{3} + \sum_{n\neq 0}\frac{2(-1)^n}{n^2}e^{inx} = \frac{\pi^2}{3} + 4\sum_{n=1}^\infty \frac{(-1)^n}{n^2}\cos(nx)\).

**Evaluating at \(x = 0\):** The left side gives \(0\). The right side:

\[
0 = \frac{\pi^2}{3} + 4\sum_{n=1}^\infty \frac{(-1)^n}{n^2} = \frac{\pi^2}{3} - \frac{4\pi^2}{12} = \frac{\pi^2}{3} - \frac{\pi^2}{3}.
\]
This is automatically satisfied. More interestingly, **evaluating at \(x = \pi\)**: the left side gives \(\pi^2\), and since \(\cos(n\pi) = (-1)^n\):

\[
\pi^2 = \frac{\pi^2}{3} + 4\sum_{n=1}^\infty \frac{(-1)^n \cdot (-1)^n}{n^2} = \frac{\pi^2}{3} + 4\sum_{n=1}^\infty \frac{1}{n^2}.
\]
Rearranging: \(\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}\).

This is the famous **Basel problem**, solved by Euler in 1734 (he used a different method — factoring \(\sin(\pi x)/(\pi x)\) as a product over its zeros). Fourier's method gives it as a byproduct of knowing the Fourier series of \(x^2\). One can also recover it from Parseval: \(\|x^2\|_{L^2}^2 = \frac{\pi^4}{5}\) and \(\sum|\hat{f}(n)|^2 = \frac{\pi^4}{9} + 2\sum_{n=1}^\infty \frac{4}{n^4}\), giving \(\sum \frac{1}{n^4} = \frac{\pi^4}{90}\) — Euler's quartic formula as well.

## Motivation: The Heat Equation on the Circle

Consider the heat equation on \(\mathbb{T}\):

\[
\frac{\partial u}{\partial t} = \frac{\partial^2 u}{\partial x^2}, \quad u(x,0) = f(x),
\]
where \(f\) is the initial temperature distribution. This was Fourier's original problem. He considered a thin metal ring (the circle \(\mathbb{T}\)) with an initial non-uniform temperature, and asked: how does the temperature evolve over time?

The key insight — Fourier's great idea — is to look for solutions of the form \(u(x,t) = X(x)T(t)\), separating variables. Substituting:

\[
X(x)T'(t) = X''(x)T(t) \implies \frac{T'(t)}{T(t)} = \frac{X''(x)}{X(x)} = -\lambda,
\]
where \(\lambda\) is a constant (since the left side depends only on \(t\) and the right only on \(x\)). For periodic boundary conditions, \(X(x) = e^{inx}\) with \(\lambda = n^2\) solves \(X'' = -\lambda X\). Then \(T'(t) = -n^2 T(t)\), so \(T(t) = e^{-n^2 t}\). The separated solution is \(u_n(x,t) = e^{inx-n^2 t}\).

Superimposing all modes: substituting \(u(x,t) = \sum_n c_n(t) e^{inx}\) and comparing coefficients gives \(c_n'(t) = -n^2 c_n(t)\), so \(c_n(t) = c_n(0)e^{-n^2 t}\). With \(c_n(0) = \hat{f}(n)\), the solution is:

\[
u(x,t) = \sum_{n=-\infty}^{\infty} \hat{f}(n)e^{-n^2 t}e^{inx}.
\]
For \(t > 0\), the factor \(e^{-n^2 t}\) provides rapid decay, making the series absolutely and uniformly convergent. This is the Poisson–Weierstrass kernel approach and illustrates how Fourier series decompose the evolution operator into independent modes.

What does this tell us physically? High-frequency oscillations (large \(|n|\)) are damped out extremely rapidly by the factor \(e^{-n^2 t}\), which decays much faster than the low-frequency ones. The "roughness" of the initial temperature distribution disappears instantaneously — for any \(t > 0\), no matter how rough \(f\) is, the solution \(u(\cdot, t)\) is a \(C^\infty\) function (indeed, real-analytic). The heat equation is a smoothing operator. This is in stark contrast to the wave equation, which preserves singularities.

**The Weierstrass approximation theorem** follows as an elegant corollary: since \(u(\cdot,t)\) is a trigonometric polynomial (a finite sum of exponentials, to any desired precision for small \(t\)) and converges uniformly to the continuous initial data \(f\), continuous periodic functions can be uniformly approximated by trigonometric polynomials.

## The Riemann–Lebesgue Lemma

<div class="theorem">
<strong>Theorem (Riemann–Lebesgue Lemma).</strong> If \(f \in L^1(\mathbb{T})\), then \(\hat{f}(n) \to 0\) as \(|n| \to \infty\).
</div>

<div class="proof">
<strong>Proof.</strong> We give the standard \(\varepsilon/3\) proof. Fix \(\varepsilon > 0\). Since step functions are dense in \(L^1(\mathbb{T})\), choose a step function \(g = \sum_{k=1}^K a_k \mathbf{1}_{[c_k, d_k]}\) with \(\|f - g\|_{L^1} < \varepsilon/2\).

For the step function \(g\), we compute directly:

\[
\hat{g}(n) = \sum_{k=1}^K a_k \frac{1}{2\pi}\int_{c_k}^{d_k} e^{-inx}\,dx = \sum_{k=1}^K a_k \frac{e^{-inc_k} - e^{-ind_k}}{2\pi i n}.
\]
Since this is a finite sum and each term is \(O(1/n)\), we have \(|\hat{g}(n)| \leq C/|n| \to 0\) as \(|n| \to \infty\). Choose \(N\) large enough that \(|\hat{g}(n)| < \varepsilon/2\) for \(|n| > N\).

For \(|n| > N\):

\[
|\hat{f}(n)| \leq |\hat{f}(n) - \hat{g}(n)| + |\hat{g}(n)| = |\widehat{(f-g)}(n)| + |\hat{g}(n)| \leq \|f-g\|_{L^1} + \varepsilon/2 < \varepsilon.
\]
Since \(\varepsilon\) was arbitrary, \(\hat{f}(n) \to 0\). \(\square\)
</div>

The Riemann–Lebesgue lemma tells us that Fourier coefficients must lie in \(c_0(\mathbb{Z})\) (sequences vanishing at infinity). This is a necessary condition, but far from sufficient: characterizing the image of \(L^1(\mathbb{T})\) under the Fourier transform is a difficult open problem. The image is strictly contained in \(c_0(\mathbb{Z})\) — for example, one can construct sequences in \(c_0(\mathbb{Z})\) that are not Fourier coefficients of any \(L^1\) function.

**Interpretation:** The Riemann–Lebesgue lemma says that rapid oscillations (high frequencies) are "averaged out" in the integral \(\int f(x) e^{-inx}\,dx\) as \(n \to \infty\). The factor \(e^{-inx}\) oscillates so rapidly for large \(n\) that the contributions from neighboring intervals nearly cancel. This is a form of the "principle of stationary phase" in its simplest incarnation.

<div class="example">
<strong>Example.</strong> For \(f(x) = x\) on \([-\pi,\pi)\) extended periodically, we computed \(\hat{f}(n) = \frac{i(-1)^n}{n}\) for \(n \neq 0\). Indeed \(|\hat{f}(n)| = 1/|n| \to 0\), confirming Riemann–Lebesgue. However, \(\sum_n |\hat{f}(n)| = \infty\) (harmonic series diverges), so the Fourier series does *not* converge absolutely.
</div>

---

# Chapter 2: Convolutions and Summability Kernels

## Convolution on the Torus

<div class="definition">
<strong>Definition (Convolution on \(\mathbb{T}\)).</strong> For \(f, g \in L^1(\mathbb{T})\), their <strong>convolution</strong> is

\[
(f * g)(x) = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x-t)g(t)\,dt.
\]
</div>

Convolution is commutative, associative, and bilinear. By Young's convolution inequality, \(\|f*g\|_p \leq \|f\|_1 \|g\|_p\) for any \(1 \leq p \leq \infty\). The crucial algebraic property is that the Fourier transform converts convolution to pointwise multiplication: \(\widehat{f*g}(n) = \hat{f}(n)\hat{g}(n)\). This makes the Fourier transform a homomorphism of algebras from \((L^1(\mathbb{T}), *)\) into \((c_0(\mathbb{Z}), \cdot)\).

**Why does convolution arise?** In the heat equation, the solution at time \(t\) is \(u(\cdot, t) = f * K_t\) where \(K_t\) is a kernel depending only on time. This is because the heat equation is translation-invariant: shifting the initial data \(f\) just shifts the solution. Any translation-invariant linear operation on periodic functions must be a convolution (by a version of the representation theorem for such operators). Thus convolution is not an arbitrary algebraic construction — it is the fundamental structure of any linear, translation-invariant operation.

**Young's inequality in detail:** For \(p = 1\): \(\|f*g\|_1 \leq \|f\|_1\|g\|_1\) — this makes \(L^1(\mathbb{T})\) into a Banach algebra under convolution. For general \(p\):

\[
\|f*g\|_p \leq \|f\|_1\|g\|_p.
\]
Proof: by Minkowski's inequality for integrals, \(\|f*g\|_p = \|\int f(t)g(\cdot - t)\frac{dt}{2\pi}\|_p \leq \int |f(t)|\|g(\cdot-t)\|_p\frac{dt}{2\pi} = \|g\|_p \|f\|_1\).

## The Dirichlet Kernel

The partial sum \(S_N f\) can be expressed as a convolution. Writing \(\hat{f}(n) = \frac{1}{2\pi}\int f(t)e^{-int}\,dt\) and substituting:

\[
S_N f(x) = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(t) \sum_{n=-N}^{N} e^{in(x-t)}\,dt = (f * D_N)(x),
\]
where the **Dirichlet kernel** is:

<div class="definition">
<strong>Definition (Dirichlet Kernel).</strong>

\[
D_N(x) = \sum_{n=-N}^{N} e^{inx} = \frac{\sin\!\left((N+\tfrac{1}{2})x\right)}{\sin(x/2)}.
\]
</div>

**Derivation of the closed form:** We have a finite geometric series:

\[
D_N(x) = e^{-iNx}\sum_{k=0}^{2N} e^{ikx} = e^{-iNx}\cdot\frac{e^{i(2N+1)x}-1}{e^{ix}-1}.
\]
Multiplying numerator and denominator by \(e^{-ix/2}\):

\[
D_N(x) = e^{-iNx}\cdot\frac{e^{i(2N+1/2)x} - e^{-ix/2}}{e^{ix/2} - e^{-ix/2}} = \frac{e^{i(N+1/2)x} - e^{-i(N+1/2)x}}{e^{ix/2} - e^{-ix/2}} = \frac{\sin((N+\frac{1}{2})x)}{\sin(x/2)}.
\]

The Dirichlet kernel has the properties:
- \(\frac{1}{2\pi}\int_{-\pi}^\pi D_N(x)\,dx = 1\) (the constant term of \(D_N\) is 1).
- \(D_N\) is even.
- \(D_N(x) = 2N+1\) at \(x = 0\).
- \(D_N\) oscillates and can be positive or negative.

The \(L^1\) norm of the Dirichlet kernel grows logarithmically:

\[
\|D_N\|_{L^1} = \frac{1}{2\pi}\int_{-\pi}^{\pi} |D_N(x)|\,dx \sim \frac{4}{\pi^2}\log N \to \infty.
\]

**Proof of the logarithmic growth:** For \(x \in (0,\pi]\), \(\sin(x/2) \geq x/\pi\), so \(|D_N(x)| \leq \pi/x \cdot |\sin((N+\frac{1}{2})x)|/(1) \leq \pi/x\). More carefully:

\[
\|D_N\|_1 \geq C\int_0^\pi \frac{|\sin((N+\frac12)x)|}{x}\,dx \geq C\sum_{k=1}^N \int_{(k-1)\pi/(N+1/2)}^{k\pi/(N+1/2)} \frac{|\sin((N+\frac12)x)|}{x}\,dx \geq C\sum_{k=1}^N \frac{1}{k} \sim C\log N.
\]

This divergence of the **Lebesgue constants** \(L_N = \|D_N\|_{L^1}\) is the root cause of all the pathological behavior of Fourier partial sums. By the Banach–Steinhaus theorem, since the operators \(f \mapsto S_N f(0)\) have operator norms \(\|S_N(\cdot)(0)\|_{L^1 \to \mathbb{C}} = L_N \to \infty\), there must exist continuous functions \(f\) for which \(\sup_N |S_N f(0)| = \infty\) — i.e., the Fourier series diverges at \(x = 0\).

## The Gibbs Phenomenon

The Gibbs phenomenon refers to the persistent overshoot of Fourier partial sums near a jump discontinuity. It was observed by Henry Wilbraham in 1848, rediscovered and reported by J. Willard Gibbs in 1898, and fully explained by Maxime Bôcher in 1906.

Consider the partial sums \(S_N f\) of the sawtooth wave \(f(x) = x\) (which has a jump discontinuity of size \(2\pi\) at \(x = \pm\pi\)). The maximum of \(S_N f\) near the discontinuity exceeds the value \(\pi\) of the function itself by approximately a fixed fraction, even as \(N \to \infty\).

**Locating the overshoot:** The partial sum \(S_N f(x) = 2\sum_{k=1}^N \frac{(-1)^{k+1}}{k}\sin(kx)\). Differentiating:

\[
(S_N f)'(x) = 2\sum_{k=1}^N (-1)^{k+1}\cos(kx).
\]
Using the formula for the sum of cosines, one finds \((S_N f)'(x) = D_N(x+\pi) - D_N(x)\) (up to factors). Setting this to zero to find critical points near \(x = 0^+\): the first zero of \((S_N f)'\) after 0 is at \(x_N = \frac{\pi}{N+1/2} \approx \frac{\pi}{N}\).

**Computing the overshoot:**

\[
S_N f(x_N) = 2\sum_{k=1}^N \frac{(-1)^{k+1}}{k}\sin\!\left(\frac{k\pi}{N+1/2}\right).
\]
This is a Riemann sum for \(2\int_0^\pi \frac{\sin t}{t}\,dt\). Indeed, substituting \(t = k\pi/(N+1/2)\):

\[
\lim_{N\to\infty} S_N f(x_N) = 2\int_0^\pi \frac{\sin t}{t}\,dt = 2 \cdot \text{Si}(\pi) \approx 2 \times 1.8519 \approx 3.7038 \cdots
\]
The function's limit from the right is \(f(0^+) = 0\) (as \(x \to 0^+\)) — no wait, let us reconsider. Near \(x = \pi^-\), the function jumps from near \(\pi\) to near \(-\pi\). The overshoot is:

\[
\lim_{N\to\infty} S_N f\!\left(\pi - \frac{\pi}{N}\right) - \pi = 2\int_0^\pi \frac{\sin t}{t}\,dt - \pi \approx 3.7038 - \pi \approx 0.5619 \cdots
\]
As a fraction of the jump (of size \(2\pi\)): \(\frac{0.5619}{2\pi} \approx 8.9\% \approx 9\%\).

This 9% overshoot is universal: it does not depend on the function, only on the presence of a jump discontinuity. The Gibbs phenomenon says that Fourier partial sums always overshoot jump discontinuities by about 9% of the jump size, and this overshoot does not diminish — only the width of the overshoot region (around \(\pi/N\)) shrinks.

**Why does Gibbs happen?** The Dirichlet kernel \(D_N\) has oscillatory lobes. When we compute \(S_N f = f * D_N\), the lobes of \(D_N\) near the discontinuity create artificial oscillations. The Cesàro means \(\sigma_N f = f * K_N\) avoid this because the Fejér kernel \(K_N \geq 0\) has no oscillatory lobes — it is non-negative, so it cannot create overshoots. This is the key advantage of Cesàro summation.

## The Fejér Kernel and Cesàro Means

To remedy the poor behavior of \(D_N\), one considers the **Cesàro means** (arithmetic averages of partial sums):

\[
\sigma_N f(x) = \frac{1}{N}\sum_{k=0}^{N-1} S_k f(x) = (f * K_N)(x),
\]
where the **Fejér kernel** is:

<div class="definition">
<strong>Definition (Fejér Kernel).</strong>

\[
K_N(x) = \frac{1}{N}\sum_{k=0}^{N-1} D_k(x) = \frac{1}{N}\left(\frac{\sin(Nx/2)}{\sin(x/2)}\right)^2.
\]
</div>

**Derivation:** We have \(K_N(x) = \frac{1}{N}\sum_{k=0}^{N-1}D_k(x) = \frac{1}{N}\sum_{k=0}^{N-1}\sum_{|n|\leq k} e^{inx}\). Each frequency \(n\) with \(|n| \leq N-1\) appears in the sum over \(k\) for \(k = |n|, |n|+1, \ldots, N-1\), contributing \(N - |n|\) times. So:

\[
K_N(x) = \sum_{|n| \leq N-1}\left(1 - \frac{|n|}{N}\right)e^{inx}.
\]
The Cesàro mean thus applies **triangular weights** \(1 - |n|/N\) to the Fourier coefficients, tapering them to zero as \(|n| \to N\). This is called a **Fejér kernel** or **Bartlett window** in signal processing.

For the closed form \(\frac{1}{N}\left(\frac{\sin(Nx/2)}{\sin(x/2)}\right)^2\): this follows from the identity \(\left(\sum_{k=0}^{N-1}e^{ikx}\right)^2 = N\sum_{k=0}^{N-1}D_k(x)\) after careful manipulation.

The Fejér kernel has three crucial properties:
1. **Non-negativity**: \(K_N(x) = \frac{1}{N}\left(\frac{\sin(Nx/2)}{\sin(x/2)}\right)^2 \geq 0\) for all \(x\). This is the key property that the Dirichlet kernel lacks.
2. **Normalization**: \(\frac{1}{2\pi}\int_{-\pi}^{\pi} K_N(x)\,dx = 1\).
3. **Concentration**: For any \(\delta > 0\), \(\int_{\delta \leq |x| \leq \pi} K_N(x)\,dx \to 0\) as \(N \to \infty\).

**Proof of concentration:** For \(|x| \geq \delta > 0\), \(|\sin(x/2)| \geq |\sin(\delta/2)| > 0\), so \(K_N(x) \leq \frac{1}{N\sin^2(\delta/2)} \to 0\) uniformly. Therefore \(\int_{|x|\geq\delta}K_N(x)\,dx \leq \frac{2\pi}{N\sin^2(\delta/2)} \to 0\).

These three properties define an **approximate identity** (or summability kernel).

**Intuition:** The Fejér kernel \(K_N\) looks like a bump of height \(\approx N\) and width \(\approx 2\pi/N\), with total area 1 (normalized), concentrated near 0, and non-negative. Convolution with \(K_N\) averages \(f\) over a window of width \(\approx 2\pi/N\). As \(N \to \infty\), the window shrinks to a point, so the average converges to the function value (at points of continuity).

## Summability Kernels and the General Convergence Theorem

<div class="definition">
<strong>Definition (Summability Kernel / Approximate Identity).</strong> A sequence of functions \(\{k_N\}_{N \geq 1}\) on \(\mathbb{T}\) is a <strong>summability kernel</strong> if:
<ol>
<li>\(\frac{1}{2\pi}\int_{-\pi}^{\pi} k_N(x)\,dx = 1\) for all \(N\),</li>
<li>\(\sup_N \frac{1}{2\pi}\int_{-\pi}^{\pi} |k_N(x)|\,dx < \infty\),</li>
<li>For each \(\delta > 0\): \(\int_{\delta \leq |x| \leq \pi} |k_N(x)|\,dx \to 0\) as \(N \to \infty\).</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem (Convergence via Approximate Identities).</strong> Let \(\{k_N\}\) be a summability kernel. Then:
<ul>
<li>If \(f \in L^p(\mathbb{T})\) for \(1 \leq p < \infty\), then \(\|f * k_N - f\|_p \to 0\).</li>
<li>If \(f \in C(\mathbb{T})\), then \(f * k_N \to f\) uniformly.</li>
<li>If \(f\) is bounded and continuous at \(x_0\), then \((f * k_N)(x_0) \to f(x_0)\).</li>
</ul>
</div>

<div class="proof">
<strong>Proof (continuous case).</strong> Given \(\varepsilon > 0\), use uniform continuity of \(f\) on \(\mathbb{T}\) to choose \(\delta > 0\) such that \(|f(x-t) - f(x)| < \varepsilon\) whenever \(|t| < \delta\). Then:
\begin{align*}
|(f*k_N)(x) - f(x)| &= \left|\frac{1}{2\pi}\int_{-\pi}^\pi (f(x-t)-f(x))k_N(t)\,dt\right| \\
&\leq \frac{1}{2\pi}\int_{|t|<\delta}|f(x-t)-f(x)||k_N(t)|\,dt + \frac{1}{2\pi}\int_{\delta\leq|t|\leq\pi}|f(x-t)-f(x)||k_N(t)|\,dt \\
&\leq \varepsilon\cdot C + 2\|f\|_\infty \cdot \frac{1}{2\pi}\int_{|t|\geq\delta}|k_N(t)|\,dt.
\end{align*}
The second term tends to 0 as \(N\to\infty\) by property (3). Since \(\varepsilon\) was arbitrary, this gives uniform convergence. \(\square\)
</div>

<div class="theorem">
<strong>Theorem (Fejér's Theorem).</strong> If \(f \in C(\mathbb{T})\), then the Cesàro means \(\sigma_N f\) converge uniformly to \(f\).
</div>

Fejér's theorem is a cornerstone result. As an immediate corollary, the trigonometric polynomials are dense in \(C(\mathbb{T})\), which in turn implies that \(\{e^{inx}\}_{n \in \mathbb{Z}}\) is a complete orthonormal set in \(L^2(\mathbb{T})\). Another corollary: if \(\hat{f}(n) = 0\) for all \(n \in \mathbb{Z}\), then \(f = 0\) a.e. (the uniqueness theorem for Fourier series).

**Historical context:** Lipót Fejér proved this theorem in 1900, at the age of 19, as his dissertation work. It was a complete surprise — after du Bois-Reymond had shown in 1873 that there exist continuous functions whose Fourier *partial sums* diverge at a point, it seemed that Fourier series might be fundamentally flawed. Fejér showed that one need only average the partial sums to restore convergence. The beauty of the idea is that the Fejér kernel is non-negative — a fact that makes it behave much better than the oscillatory Dirichlet kernel.

## The Poisson Kernel

Another important summability kernel is the **Poisson kernel**, which arises from the solution to Laplace's equation on the disk.

<div class="definition">
<strong>Definition (Poisson Kernel on \(\mathbb{T}\)).</strong> For \(0 \leq r < 1\), the Poisson kernel is

\[
P_r(x) = \sum_{n=-\infty}^\infty r^{|n|} e^{inx} = \frac{1-r^2}{1 - 2r\cos x + r^2}.
\]
</div>

**Derivation:** The geometric series \(\sum_{n=0}^\infty r^n e^{inx} = \frac{1}{1-re^{ix}}\) and its complex conjugate give, summing:

\[
P_r(x) = \text{Re}\left(\frac{1+re^{ix}}{1-re^{ix}}\right) = \frac{1-r^2}{|1-re^{ix}|^2} = \frac{1-r^2}{1-2r\cos x + r^2}.
\]

The Poisson kernel is non-negative, normalized (\(\frac{1}{2\pi}\int_{-\pi}^\pi P_r(x)\,dx = 1\)), and concentrates near \(x=0\) as \(r \to 1^-\). Thus \(\{P_r\}_{r\to 1^-}\) is a summability kernel (in the continuous parameter version).

**Connection to harmonic analysis:** If \(u(r,x) = (f * P_r)(x) = \sum_n \hat{f}(n) r^{|n|} e^{inx}\), then \(u\) is the harmonic extension of \(f\) to the unit disk (in polar coordinates). The Poisson kernel solves the **Dirichlet problem** for the disk: given continuous boundary data \(f\) on \(\partial\mathbb{D} \cong \mathbb{T}\), the harmonic extension to the interior is \(u(re^{ix}) = (f*P_r)(x)\), and \(u(re^{ix}) \to f(e^{ix})\) uniformly as \(r \to 1^-\).

## The Weierstrass Kernel

The **Weierstrass kernel** (or heat kernel on \(\mathbb{T}\)) is:

\[
W_t(x) = \sum_{n=-\infty}^\infty e^{-n^2 t}e^{inx}, \quad t > 0.
\]
This arises directly from the heat equation on \(\mathbb{T}\) (the Fourier multiplier \(e^{-n^2 t}\) represents the heat flow). As \(t \to 0^+\), \(\{W_t\}\) is a summability kernel. The Weierstrass approximation theorem — trigonometric polynomials are dense in \(C(\mathbb{T})\) — follows from the fact that for small \(t\), \(W_t * f\) is a trigonometric polynomial (to any desired precision) converging uniformly to \(f\).

---

# Chapter 3: Convergence of Fourier Series

## Why \(L^2\) is the Right Space

Before studying convergence, it is worth asking: *why do we focus so much on \(L^2\)?* There are several compelling reasons.

**Hilbert space completeness:** \(L^2(\mathbb{T})\) is a Hilbert space — it has an inner product, and it is complete (every Cauchy sequence converges). This makes orthonormal expansions work perfectly: given an orthonormal system, the Fourier series always converges *in norm*. For \(L^1\) or other \(L^p\), we lack this inner product structure, and convergence is much harder to guarantee.

**Physical motivation:** In quantum mechanics, states are vectors in a Hilbert space, and the "square-integrability" of wavefunctions is a physical requirement (the norm-squared represents probability). In signal processing, energy is proportional to the square of amplitude, so \(L^2\) is the natural energy space.

**The Riesz–Fischer theorem:** In \(L^2\), there is a perfect bijection between functions and their Fourier coefficient sequences. This bijectivity fails in \(L^1\) (the image of the Fourier transform is not all of \(c_0\)) and in \(L^\infty\) (a bounded function's Fourier series may not converge anywhere). In \(L^2\), the Fourier transform is an isometric isomorphism \(L^2(\mathbb{T}) \cong \ell^2(\mathbb{Z})\) — a perfect duality.

**Parseval's theorem:** In \(L^2\), the energy of a function equals the sum of the squares of its Fourier coefficients. This is the mathematical content of the fact that frequencies are "independent" — they carry non-overlapping energy. This has no analog in \(L^1\).

**Failure in \(L^1\):** There exist \(f \in L^1(\mathbb{T})\) whose Fourier series diverges everywhere (Kolmogorov's 1923 example). There exist \(f \in C(\mathbb{T})\) whose Fourier series diverges at a point (du Bois-Reymond, 1873). In \(L^2\), by Carleson's theorem (1966), the Fourier series converges almost everywhere — but this required 60 years to prove after the convergence in \(L^2\)-norm was established.

## Uniform Convergence

While Fejér's theorem gives uniform convergence of Cesàro means for continuous \(f\), the partial sums themselves may diverge. To guarantee \(S_N f \to f\) uniformly, one needs additional smoothness.

<div class="theorem">
<strong>Theorem (Dirichlet–Jordan).</strong> If \(f\) is of bounded variation on \([-\pi,\pi]\), then for every \(x\),

\[
S_N f(x) \to \frac{f(x^+) + f(x^-)}{2}.
\]
If additionally \(f\) is continuous at \(x\), then \(S_N f(x) \to f(x)\). If \(f\) is continuous and of bounded variation, convergence is uniform.
</div>

A cleaner sufficient condition is the **Dini-type condition**: if \(f\) is \(\alpha\)-Hölder continuous (i.e., \(|f(x) - f(y)| \leq C|x-y|^\alpha\) for some \(\alpha > 0\)), then \(S_N f \to f\) uniformly. More generally, if \(f \in C^1(\mathbb{T})\), then \(|\hat{f}(n)| = O(1/n)\) and the Fourier series converges absolutely and uniformly.

**Why smoothness helps:** Integration by parts relates \(\hat{f}'(n)\) and \(n\hat{f}(n)\). If \(f\) is \(C^k\), then \(|\hat{f}(n)| = O(|n|^{-k})\), and the series \(\sum_n |\hat{f}(n)|\) converges absolutely for \(k \geq 2\), giving uniform convergence. For \(C^\infty\) functions, the Fourier series converges faster than any polynomial — it is an analytic "frequency-domain" representation of the function.

## \(L^p\) Convergence

<div class="theorem">
<strong>Theorem (\(L^2\) Convergence).</strong> For \(f \in L^2(\mathbb{T})\), the partial sums \(S_N f\) converge to \(f\) in \(L^2(\mathbb{T})\).
</div>

This follows from Hilbert space theory: the exponentials \(\{e^{inx}\}\) form a complete orthonormal basis of \(L^2(\mathbb{T})\), and \(S_N f\) is the orthogonal projection of \(f\) onto the span of \(\{e^{inx} : |n| \leq N\}\). In any Hilbert space, the partial sums of a Fourier expansion (with respect to a complete orthonormal basis) converge in norm — this is the content of Bessel's inequality and completeness.

<div class="theorem">
<strong>Theorem (M. Riesz, \(L^p\) Convergence).</strong> For \(1 < p < \infty\) and \(f \in L^p(\mathbb{T})\), \(S_N f \to f\) in \(L^p\). Equivalently, the Hilbert transform is bounded on \(L^p(\mathbb{T})\).
</div>

The proof of M. Riesz's theorem requires deeper methods — specifically, the boundedness of the conjugate function operator (Hilbert transform) on \(L^p\) for \(1 < p < \infty\). This fails at the endpoints: the Hilbert transform is not bounded on \(L^1\) or \(L^\infty\).

**Failure of \(L^1\) convergence**: Du Bois-Reymond constructed a continuous function whose Fourier series diverges at a point. By a Baire category argument (Banach–Steinhaus theorem applied to the diverging Lebesgue constants), one can show that for a generic \(f \in C(\mathbb{T})\), the Fourier series diverges on a dense set.

## Kolmogorov's Example

In 1923, Andrei Kolmogorov (age 19, like Fejér before him) constructed an \(L^1\) function whose Fourier series diverges everywhere — not just at a point, but at *every* point. This was a shocking demonstration that \(L^1\) is genuinely the wrong space for pointwise convergence of Fourier series.

The construction is intricate but the idea is clear: one builds \(f\) as a sum \(f = \sum_k f_k\) where each \(f_k\) is a trigonometric polynomial chosen so that the partial sums of \(f\) are large at a dense set of points. The \(L^1\) norm of \(f\) is controlled because the \(f_k\) are spread out, but the partial sums blow up everywhere because the \(f_k\) conspire to create large values at different points at different scales.

Kolmogorov later (1926) strengthened his result to show an \(L^1\) function whose Fourier series diverges everywhere in a much stronger sense (the partial sums are unbounded almost everywhere). The complete picture for \(L^p\) spaces is:
- \(p = 1\): Fourier series can diverge everywhere (Kolmogorov).
- \(1 < p < \infty\): Fourier series converges in \(L^p\)-norm (M. Riesz), and even converges a.e. (Carleson–Hunt theorem, 1968).
- \(p = \infty\): \(L^\infty\) convergence fails (same as for \(L^1\) by duality arguments).
- \(C(\mathbb{T})\) (continuous functions): Fourier series converges a.e. (Carleson, 1966), but can diverge at individual points (du Bois-Reymond).

---

# Chapter 4: Pointwise Convergence — Dini's Theorem and Localization

## Dini's Test

<div class="theorem">
<strong>Theorem (Dini's Test).</strong> Let \(f \in L^1(\mathbb{T})\) and suppose that for some \(x_0 \in \mathbb{T}\) and \(s \in \mathbb{C}\), the function

\[
t \mapsto \frac{f(x_0 + t) + f(x_0 - t) - 2s}{t}
\]
is integrable near \(t = 0\) (i.e., belongs to \(L^1((0,\delta))\) for some \(\delta > 0\)). Then \(S_N f(x_0) \to s\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Write \(S_N f(x_0) - s = \frac{1}{2\pi}\int_0^\pi \left[f(x_0+t) + f(x_0-t) - 2s\right] \frac{\sin((N+\frac{1}{2})t)}{2\sin(t/2)}\,dt\). Since \(\frac{t}{2\sin(t/2)} \to 1\) as \(t \to 0^+\), the Dini condition ensures the integrand divided by \(t\) is in \(L^1\), and the Riemann–Lebesgue lemma gives convergence to zero. \(\square\)
</div>

**Interpreting Dini's condition:** The condition asks that the "average oscillation" \(\frac{f(x_0+t)+f(x_0-t)-2s}{t}\) be integrable near 0. This is automatic if:
- \(f\) has a one-sided derivative at \(x_0\) from both sides (then the numerator is \(O(t)\), so the ratio is bounded);
- \(f\) is Hölder continuous at \(x_0\) (then the numerator is \(O(t^\alpha)\), so the ratio is \(O(t^{\alpha-1})\), integrable for \(\alpha > 0\));
- \(f\) satisfies a Lipschitz condition at \(x_0\).

In all these cases, \(S_N f(x_0) \to \frac{f(x_0^+)+f(x_0^-)}{2}\).

Dini's test generalizes Dirichlet's classical theorem: if \(f\) is Hölder continuous at \(x_0\) (say with exponent \(\alpha > 0\)) or has one-sided limits with finite one-sided derivatives, the Dini condition is satisfied with \(s = \frac{f(x_0^+) + f(x_0^-)}{2}\).

## Riemann's Localization Principle

A striking feature of pointwise convergence is its local nature.

<div class="theorem">
<strong>Theorem (Localization Principle).</strong> Let \(f, g \in L^1(\mathbb{T})\). If \(f = g\) in a neighborhood of \(x_0\), then

\[
\lim_{N \to \infty} \left(S_N f(x_0) - S_N g(x_0)\right) = 0
\]
whenever either limit exists.
</div>

<div class="proof">
<strong>Proof sketch.</strong> We have \(S_N f(x_0) - S_N g(x_0) = \frac{1}{2\pi}\int_{-\pi}^{\pi} (f-g)(t)D_N(x_0 - t)\,dt\). If \(f - g = 0\) on \((x_0 - \delta, x_0 + \delta)\), then the integrand is supported away from \(x_0\), where \(D_N(x_0-t) = \frac{\sin((N+\frac{1}{2})(x_0-t))}{\sin((x_0-t)/2)}\) and the denominator is bounded away from zero. The Riemann–Lebesgue lemma then gives convergence to zero. \(\square\)
</div>

The localization principle has the striking consequence that the convergence of \(S_N f(x_0)\) depends only on the behavior of \(f\) near \(x_0\) — a global operation (summing all Fourier coefficients) yields a result determined by local data. This is remarkable: the Fourier coefficients involve integrating \(f\) over the entire circle, yet their sum at a point depends only on what \(f\) does in an arbitrarily small neighborhood of that point.

**Contrast with global phenomena:** The failure of pointwise convergence (Kolmogorov's example) does require global properties of \(f\), but any information about convergence at a specific point \(x_0\) is purely local. This is why one can make local modifications to \(f\) (in a small neighborhood of a point) without affecting convergence elsewhere.

## Hardy's Tauberian Theorem

Hardy's theorem provides a striking bridge between summability and ordinary convergence.

<div class="theorem">
<strong>Theorem (Hardy's Tauberian Theorem).</strong> Suppose \(f \in L^1(\mathbb{T})\) and the Cesàro means \(\sigma_N f(x_0) \to s\). If additionally \(\hat{f}(n) = O(1/|n|)\) as \(|n| \to \infty\), then \(S_N f(x_0) \to s\).
</div>

The condition \(\hat{f}(n) = O(1/n)\) is a **Tauberian condition** — it provides the extra regularity that converts Cesàro convergence back to ordinary convergence. The proof uses summation by parts (Abel summation) and the estimate on the size of Fourier coefficients to control the difference \(S_N f - \sigma_N f\).

This theorem is a model for the general Tauberian theory developed by Hardy–Littlewood and Wiener, which plays a central role in analytic number theory (Wiener's Tauberian theorem and the prime number theorem).

---

# Chapter 5: Hilbert Space Theory and L² Analysis

## \(L^2(\mathbb{T})\) as a Hilbert Space

The space \(L^2(\mathbb{T})\) with inner product \(\langle f, g \rangle = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x)\overline{g(x)}\,dx\) is a complete inner product space (Hilbert space). The norm is \(\|f\|_2 = \langle f, f\rangle^{1/2}\).

The completeness of \(L^2\) — the Riesz–Fischer theorem — was proved in 1907 simultaneously and independently by Frigyes Riesz and Ernst Fischer. This was a foundational result: it showed that \(L^2\) is a complete metric space (hence a Banach space, and with the inner product structure, a Hilbert space). The proof used the Lebesgue integral crucially — the Riemann integral does not give a complete space, because limits of Riemann-integrable functions need not be Riemann-integrable.

<div class="theorem">
<strong>Theorem (Orthonormal Basis).</strong> The system \(\{e^{inx}\}_{n \in \mathbb{Z}}\) is a complete orthonormal basis (Hilbert basis) for \(L^2(\mathbb{T})\).
</div>

Completeness here means that the only element orthogonal to all \(e^{inx}\) is the zero function — equivalently, if \(\hat{f}(n) = 0\) for all \(n\) then \(f = 0\) in \(L^2\). This follows from Fejér's theorem: if all Fourier coefficients vanish, then all Cesàro means vanish, and since they converge to \(f\) in \(L^2\), we have \(f = 0\).

**General Hilbert space context:** In any Hilbert space \(\mathcal{H}\) with complete orthonormal set \(\{e_n\}\), every element \(f \in \mathcal{H}\) has a Fourier expansion \(f = \sum_n \langle f, e_n\rangle e_n\) converging in norm, and the map \(f \mapsto \{\langle f, e_n\rangle\}_n\) is an isometric isomorphism from \(\mathcal{H}\) to \(\ell^2\). Applied to \(L^2(\mathbb{T})\) with \(e_n = e^{inx}\), this gives the fundamental theorem of Fourier series in \(L^2\).

## Parseval's and Plancherel's Theorems

<div class="theorem">
<strong>Theorem (Parseval's Identity).</strong> For \(f, g \in L^2(\mathbb{T})\),

\[
\langle f, g \rangle = \sum_{n=-\infty}^{\infty} \hat{f}(n)\overline{\hat{g}(n)}.
\]
In particular, taking \(g = f\):

\[
\|f\|_{L^2}^2 = \sum_{n=-\infty}^{\infty} |\hat{f}(n)|^2.
\]
</div>

<div class="theorem">
<strong>Theorem (Plancherel).</strong> The Fourier transform \(\mathcal{F} : L^2(\mathbb{T}) \to \ell^2(\mathbb{Z})\), defined by \(\mathcal{F}(f) = \{\hat{f}(n)\}_{n \in \mathbb{Z}}\), is an isometric isomorphism.
</div>

**Parseval gives \(\sum 1/n^2 = \pi^2/6\) directly:** Apply Parseval to \(f(x) = x\). We have \(\|f\|_{L^2}^2 = \frac{1}{2\pi}\int_{-\pi}^\pi x^2\,dx = \frac{\pi^2}{3}\). The Fourier coefficients are \(\hat{f}(0) = 0\) and \(\hat{f}(n) = \frac{i(-1)^n}{n}\) for \(n \neq 0\), so \(|\hat{f}(n)|^2 = 1/n^2\). Parseval gives:

\[
\frac{\pi^2}{3} = \sum_{n \neq 0} \frac{1}{n^2} = 2\sum_{n=1}^\infty \frac{1}{n^2},
\]
so \(\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}\). This is the most elegant proof of the Basel problem — arguably more natural than Euler's original argument. It took Euler enormous effort (and a non-rigorous passage through infinite products) to establish this in 1734; Parseval's identity (once the theory is set up) makes it a one-line calculation.

**Parseval gives \(\sum 1/n^4 = \pi^4/90\):** Apply Parseval to \(f(x) = x^2\). We computed \(\hat{f}(n) = 2(-1)^n/n^2\) for \(n \neq 0\) and \(\hat{f}(0) = \pi^2/3\). Then \(\|f\|_{L^2}^2 = \frac{1}{2\pi}\int_{-\pi}^\pi x^4\,dx = \frac{\pi^4}{5}\). Parseval:

\[
\frac{\pi^4}{5} = \frac{\pi^4}{9} + 2\sum_{n=1}^\infty \frac{4}{n^4} \implies \sum_{n=1}^\infty\frac{1}{n^4} = \frac{\pi^4}{90}.
\]

**Parseval gives \(\sum 1/(2k+1)^2 = \pi^2/8\):** Apply Parseval to the square wave \(f(x) = \text{sgn}(x)\). We have \(\|f\|_{L^2}^2 = 1\) and \(\hat{f}(n) = 0\) for even \(n\), \(\hat{f}(2k+1) = \frac{2}{\pi i(2k+1)}\). Parseval:

\[
1 = \sum_{k=-\infty}^\infty |\hat{f}(2k+1)|^2 = 2\sum_{k=0}^\infty \frac{4}{\pi^2(2k+1)^2} \implies \sum_{k=0}^\infty\frac{1}{(2k+1)^2} = \frac{\pi^2}{8}.
\]

These computations illustrate the power of Parseval's identity: the \(L^2\) theory of Fourier series transforms analytic number theory questions (sums of series) into geometric questions (computing norms in Hilbert spaces).

## The Riesz–Fischer Theorem

<div class="theorem">
<strong>Theorem (Riesz–Fischer).</strong> The map \(\mathcal{F} : L^2(\mathbb{T}) \to \ell^2(\mathbb{Z})\) is surjective: for every sequence \(\{c_n\} \in \ell^2(\mathbb{Z})\), there exists a unique \(f \in L^2(\mathbb{T})\) with \(\hat{f}(n) = c_n\) for all \(n \in \mathbb{Z}\). Moreover, the partial sums \(S_N f\) converge to \(f\) in \(L^2\).
</div>

The Riesz–Fischer theorem is a completeness statement — it says that every square-summable sequence of "frequencies" corresponds to an actual \(L^2\) function. This was a major result in the early 20th century, establishing a precise correspondence between function theory and sequence spaces.

**Construction:** Given \(\{c_n\} \in \ell^2(\mathbb{Z})\), define \(f_N = \sum_{|n|\leq N} c_n e^{inx}\). These are Cauchy in \(L^2\): \(\|f_M - f_N\|_{L^2}^2 = \sum_{N<|n|\leq M}|c_n|^2 \to 0\) since \(\{c_n\} \in \ell^2\). By completeness of \(L^2\), the limit \(f = \lim f_N\) exists in \(L^2\), and one verifies \(\hat{f}(n) = c_n\).

## Convergence for Smooth Functions

<div class="theorem">
<strong>Theorem (Decay of Fourier Coefficients for Smooth Functions).</strong> If \(f \in C^k(\mathbb{T})\), then \(|\hat{f}(n)| = O(|n|^{-k})\) as \(|n| \to \infty\). If \(f \in C^\infty(\mathbb{T})\), then \(\hat{f}(n)\) decays faster than any polynomial: \(|\hat{f}(n)| = O(|n|^{-k})\) for all \(k \geq 0\).
</div>

<div class="proof">
<strong>Proof.</strong> Integration by parts \(k\) times: \(\hat{f}(n) = \frac{1}{2\pi}\int f(x)e^{-inx}\,dx = \frac{1}{(in)^k}\widehat{f^{(k)}}(n)\). Since \(f^{(k)} \in L^2\), its Fourier coefficients are square-summable, hence bounded. \(\square\)
</div>

Conversely, if \(\hat{f}(n)\) decays rapidly, then \(f\) is smooth. For \(C^\infty\) functions the Fourier series converges absolutely and uniformly: \(\sum_n |\hat{f}(n)| < \infty\).

**The regularity ladder:** The smooth-function theorem gives us a precise dictionary between function regularity and Fourier coefficient decay:

| Regularity of \(f\) | Decay of \(\vert \hat{f}(n)\vert \) | Convergence |
|---|---|---|
| \(f \in L^1(\mathbb{T})\) | \(o(1)\) (R-L lemma) | No pointwise guarantee |
| \(f\) Hölder \(C^{0,\alpha}\) | \(O(n^{-\alpha})\) | Uniform |
| \(f \in C^1(\mathbb{T})\) | \(O(1/n)\) | Absolute + uniform |
| \(f \in C^k(\mathbb{T})\) | \(O(n^{-k})\) | Absolutely \(\sum n^{k-1}\vert \hat{f}(n)\vert < \infty\) |
| \(f \in C^\infty(\mathbb{T})\) | Faster than any \(n^{-k}\) | Absolutely and rapidly |
| \(f\) real-analytic | Exponential \(O(r^{-\vert n\vert })\), \(r > 1\) | Absolutely and exponentially |

This table encodes the fundamental insight: *smoothness in the spatial domain corresponds to decay in the frequency domain.* The Fourier transform is a "microscope" that reveals the regularity of functions through their frequency content.

---

# Chapter 6: Interpolation Theorems

## The Riesz–Thorin Interpolation Theorem

Many operators in Fourier analysis are bounded on two endpoint spaces but one wants to deduce boundedness on intermediate spaces. The Riesz–Thorin theorem makes this precise.

<div class="theorem">
<strong>Theorem (Riesz–Thorin Interpolation).</strong> Let \((X, \mu)\) and \((Y, \nu)\) be measure spaces. Suppose a linear operator \(T\) satisfies

\[
\|Tf\|_{L^{q_0}(Y)} \leq M_0\|f\|_{L^{p_0}(X)}, \quad \|Tf\|_{L^{q_1}(Y)} \leq M_1\|f\|_{L^{p_1}(X)}.
\]
For \(0 < \theta < 1\), define \(\frac{1}{p} = \frac{1-\theta}{p_0} + \frac{\theta}{p_1}\) and \(\frac{1}{q} = \frac{1-\theta}{q_0} + \frac{\theta}{q_1}\). Then

\[
\|Tf\|_{L^q(Y)} \leq M_0^{1-\theta}M_1^{\theta}\|f\|_{L^p(X)}.
\]
</div>

<div class="proof">
<strong>Proof sketch (Three-Lines Lemma).</strong> The key tool is the Hadamard three-lines lemma: if \(\Phi\) is bounded and holomorphic on the strip \(\{0 < \text{Re}(z) < 1\}\) with \(|\Phi(it)| \leq M_0\) and \(|\Phi(1+it)| \leq M_1\) for all \(t \in \mathbb{R}\), then \(|\Phi(\theta + it)| \leq M_0^{1-\theta}M_1^\theta\). One constructs an analytic function \(z \mapsto \langle T(f^{p/p(z)}), g^{q'/q'(z)}\rangle\) and applies this lemma to obtain the interpolated bound. \(\square\)
</div>

**Application: Fourier transform on \(L^p(\mathbb{T})\):** The Fourier transform (mapping \(f\) to its sequence of Fourier coefficients) is bounded from \(L^1 \to \ell^\infty\) (trivially: \(|\hat{f}(n)| \leq \|f\|_1\)) and from \(L^2 \to \ell^2\) (isometrically, by Plancherel). By Riesz–Thorin with \(\theta = 2/p' - 1\), it is bounded from \(L^p \to \ell^{p'}\) for \(1 \leq p \leq 2\). This is the Hausdorff–Young inequality.

## The Hausdorff–Young Inequality

<div class="theorem">
<strong>Theorem (Hausdorff–Young Inequality).</strong> For \(1 \leq p \leq 2\) and \(f \in L^p(\mathbb{T})\),

\[
\left(\sum_{n \in \mathbb{Z}} |\hat{f}(n)|^{p'}\right)^{1/p'} \leq \|f\|_{L^p(\mathbb{T})},
\]
where \(p' = p/(p-1)\) is the conjugate exponent.
</div>

<div class="proof">
<strong>Proof.</strong> The Fourier transform is bounded from \(L^1(\mathbb{T})\) to \(\ell^\infty(\mathbb{Z})\) with norm 1 (trivially \(|\hat{f}(n)| \leq \|f\|_1\)), and isometric from \(L^2(\mathbb{T})\) to \(\ell^2(\mathbb{Z})\) by Plancherel. Applying Riesz–Thorin with \((p_0, q_0) = (1, \infty)\) and \((p_1, q_1) = (2, 2)\), the interpolation parameter \(\theta = 2/p' - 1\) yields the result. \(\square\)
</div>

The Hausdorff–Young inequality is sharp: equality holds for Gaussian functions. The reverse inequality (Young's inequality) states that if \(\{\hat{f}(n)\} \in \ell^p\) for \(1 \leq p \leq 2\), then \(f \in L^{p'}(\mathbb{T})\). Together these establish a duality between the integrability of a function and the summability of its Fourier coefficients.

---

# Chapter 7: Fourier Transform on the Real Line

## The Fourier Transform on \(L^1(\mathbb{R})\)

Moving from the compact group \(\mathbb{T}\) to the locally compact group \(\mathbb{R}\), the Fourier transform becomes an integral over all of \(\mathbb{R}\).

<div class="definition">
<strong>Definition (Fourier Transform on \(L^1(\mathbb{R})\)).</strong> For \(f \in L^1(\mathbb{R})\), the <strong>Fourier transform</strong> is

\[
\hat{f}(\xi) = \int_{\mathbb{R}} f(x)e^{-2\pi i x\xi}\,dx, \quad \xi \in \mathbb{R}.
\]
</div>

This convention (with the \(2\pi\) in the exponent rather than the measure) makes the inversion formula symmetric: \(f(x) = \int_{\mathbb{R}} \hat{f}(\xi)e^{2\pi ix\xi}\,d\xi\). The Fourier transform of an \(L^1\) function is continuous, bounded (\(|\hat{f}(\xi)| \leq \|f\|_1\)), and vanishes at infinity (Riemann–Lebesgue).

**Alternative conventions:** In physics and engineering, common conventions are \(\hat{f}(\xi) = \int f(x)e^{-i\xi x}\,dx\) (with the \(2\pi\) factor appearing in the inversion formula), or \(\hat{f}(\xi) = \frac{1}{\sqrt{2\pi}}\int f(x)e^{-i\xi x}\,dx\) (the symmetric convention). All are equivalent; the \(2\pi\)-in-exponent convention is the "analyst's convention" that makes Plancherel an isometry without extra constants.

**Key properties of the Fourier transform:**
- **Linearity:** \(\widehat{af+bg} = a\hat{f} + b\hat{g}\).
- **Translation:** \(\widehat{f(\cdot - a)}(\xi) = e^{-2\pi ia\xi}\hat{f}(\xi)\).
- **Modulation:** \(\widehat{e^{2\pi ib\cdot}f}(\xi) = \hat{f}(\xi - b)\).
- **Scaling:** \(\widehat{f(a\cdot)}(\xi) = \frac{1}{|a|}\hat{f}(\xi/a)\) for \(a \neq 0\).
- **Convolution:** \(\widehat{f*g}(\xi) = \hat{f}(\xi)\hat{g}(\xi)\).
- **Differentiation:** \(\widehat{f'}(\xi) = 2\pi i\xi\hat{f}(\xi)\) (if \(f' \in L^1\)).
- **Riemann–Lebesgue:** \(\hat{f}(\xi) \to 0\) as \(|\xi| \to \infty\).

## The Fundamental Example: The Gaussian

The most important example in all of Fourier analysis is the Gaussian:

<div class="example">
<strong>Example (The Gaussian is its own Fourier transform).</strong> Let \(f(x) = e^{-\pi x^2}\). Then \(\hat{f}(\xi) = e^{-\pi\xi^2}\).
</div>

This is the statement that the Gaussian function is an *eigenfunction* of the Fourier transform with eigenvalue 1. Let us prove this in full detail.

**Proof:** We compute \(\hat{f}(\xi) = \int_{-\infty}^\infty e^{-\pi x^2} e^{-2\pi ix\xi}\,dx\).

**Step 1: Differentiate under the integral sign.** Let \(I(\xi) = \hat{f}(\xi)\). Then:

\[
I'(\xi) = \int_{-\infty}^\infty e^{-\pi x^2}(-2\pi ix)e^{-2\pi ix\xi}\,dx = -i\int_{-\infty}^\infty x e^{-\pi x^2}e^{-2\pi ix\xi}\,dx.
\]
Integrating by parts with \(u = e^{-2\pi ix\xi}\), \(dv = xe^{-\pi x^2}\,dx\), so \(v = -\frac{1}{2\pi}e^{-\pi x^2}\):

\[
I'(\xi) = -i\left[-\frac{e^{-\pi x^2}e^{-2\pi ix\xi}}{2\pi}\Bigg|_{-\infty}^\infty + \frac{1}{2\pi}\int_{-\infty}^\infty e^{-\pi x^2}(-2\pi i\xi)e^{-2\pi ix\xi}\,dx\right] = -i \cdot \frac{-2\pi i\xi}{2\pi}\cdot I(\xi) = -2\pi\xi I(\xi).
\]

**Step 2: Solve the ODE.** We have \(I'(\xi) = -2\pi\xi I(\xi)\), which is separable: \(\frac{dI}{I} = -2\pi\xi\,d\xi\), giving \(I(\xi) = Ce^{-\pi\xi^2}\).

**Step 3: Determine the constant.** \(I(0) = \int_{-\infty}^\infty e^{-\pi x^2}\,dx\). The standard Gaussian integral gives \(\int_{-\infty}^\infty e^{-\pi x^2}\,dx = 1\) (by the substitution \(u = \sqrt{\pi}x\) and the well-known \(\int e^{-u^2}\,du = \sqrt{\pi}\)). Thus \(C = I(0) = 1\), and \(\hat{f}(\xi) = e^{-\pi\xi^2}\). \(\square\)

**Why does this matter?** The Gaussian arises everywhere because:
1. It is the unique (up to scaling) function that is its own Fourier transform — a "fixed point" of \(\mathcal{F}\).
2. It saturates the Heisenberg uncertainty principle (achieves equality).
3. It is the fundamental solution of the heat equation: \(H_t(x) = \frac{1}{\sqrt{4\pi t}}e^{-x^2/(4t)}\) is a Gaussian.
4. It is the limit in the Central Limit Theorem: the distribution of \((X_1+\cdots+X_n)/\sqrt{n}\) converges to a Gaussian.

More generally, \(\hat{f}(\xi) = e^{-a\pi\xi^2}\) when \(f(x) = a^{-1/2}e^{-\pi x^2/a}\). The scaling \(a \leftrightarrow 1/a\) in the uncertainty principle is reflected in the Fourier transform: a wide Gaussian (\(a\) large) transforms to a narrow Gaussian (\(1/a\) small).

**Eigenfunctions of the Fourier transform:** More generally, the Hermite functions \(h_n(x) = H_n(\sqrt{2\pi}x)e^{-\pi x^2}\) (where \(H_n\) are Hermite polynomials) are eigenfunctions of \(\mathcal{F}\) with eigenvalues \(e^{-\pi i n/2} = i^{-n}\). They form a complete orthonormal basis of \(L^2(\mathbb{R})\). The Fourier transform acts on this basis by \(\mathcal{F}h_n = i^{-n}h_n\), showing \(\mathcal{F}^4 = \text{Id}\) (the Fourier transform has order 4 as an operator on \(L^2(\mathbb{R})\)).

## Test Functions and the Schwartz Class

To develop a robust theory including inversion, one works with spaces of rapidly decaying smooth functions.

<div class="definition">
<strong>Definition (Schwartz Class).</strong> The <strong>Schwartz space</strong> \(\mathcal{S}(\mathbb{R})\) consists of all \(f \in C^\infty(\mathbb{R})\) such that for all \(m, k \geq 0\),

\[
\|f\|_{m,k} = \sup_{x \in \mathbb{R}} |x^m f^{(k)}(x)| < \infty.
\]
The seminorms \(\|\cdot\|_{m,k}\) define a locally convex Fréchet topology on \(\mathcal{S}(\mathbb{R})\).
</div>

Examples of Schwartz functions include: Gaussians \(e^{-ax^2}\) (for \(a > 0\)), functions with compact support that are smooth (compactly supported smooth functions \(C_c^\infty(\mathbb{R}) \subset \mathcal{S}(\mathbb{R})\)), and products of polynomials with Gaussians.

**Why Schwartz?** The Schwartz class is specifically designed so that the Fourier transform preserves it. The Fourier transform swaps differentiation and multiplication by \(x\): \(\widehat{f'}(\xi) = 2\pi i\xi\hat{f}(\xi)\) and \(\widehat{xf}(\xi) = \frac{1}{-2\pi i}\hat{f}'(\xi)\). If \(f\) decays rapidly and is smooth, then \(\hat{f}\) is smooth (because \(x^m f \in L^1\) for all \(m\)) and decays rapidly (because \(f\) is smooth). So \(\mathcal{S}\) is closed under \(\mathcal{F}\). The key point is that both conditions — rapid decay AND infinite smoothness — are needed simultaneously, and Schwartz functions have both.

<div class="definition">
<strong>Definition (Test Functions).</strong> The space \(C_c^\infty(\mathbb{R})\) of smooth compactly supported functions, often denoted \(\mathcal{D}(\mathbb{R})\), is a dense subspace of \(\mathcal{S}(\mathbb{R})\).
</div>

## The Fourier Transform as an Isomorphism on \(\mathcal{S}\)

<div class="theorem">
<strong>Theorem (Fourier Transform on Schwartz Space).</strong> The Fourier transform \(\mathcal{F} : \mathcal{S}(\mathbb{R}) \to \mathcal{S}(\mathbb{R})\) is a topological isomorphism (a homeomorphism in the Fréchet topology). It satisfies:
<ul>
<li><strong>Differentiation rule:</strong> \(\widehat{f'}(\xi) = 2\pi i\xi\hat{f}(\xi)\), or equivalently \(\widehat{(-2\pi ix)f}(\xi) = \hat{f}'(\xi)\).</li>
<li><strong>Inversion:</strong> \(f(x) = \int_{\mathbb{R}} \hat{f}(\xi) e^{2\pi ix\xi}\,d\xi\) for all \(f \in \mathcal{S}(\mathbb{R})\).</li>
<li><strong>Gaussian:</strong> \(\mathcal{F}(e^{-\pi x^2}) = e^{-\pi \xi^2}\) (the Gaussian is a fixed point).</li>
</ul>
</div>

The key insight is that the Fourier transform exchanges differentiation and multiplication by polynomials, so the Schwartz conditions (rapid decay times smooth) are preserved.

---

# Chapter 8: Distributions and Tempered Distributions

## Distributions

The theory of distributions extends classical analysis to include objects like the Dirac delta that arise naturally in physics and PDE.

<div class="definition">
<strong>Definition (Distributions).</strong> A <strong>distribution</strong> is a continuous linear functional \(T : C_c^\infty(\mathbb{R}) \to \mathbb{C}\), where continuity means \(T(\phi_n) \to T(\phi)\) whenever \(\phi_n \to \phi\) in the topology of \(\mathcal{D}(\mathbb{R})\) (all \(\phi_n\) supported in a common compact set, with all derivatives converging uniformly). The space of distributions is \(\mathcal{D}'(\mathbb{R})\).
</div>

Every locally integrable function \(f\) defines a <strong>regular distribution</strong> \(T_f(\phi) = \int f(x)\phi(x)\,dx\). The **Dirac delta** \(\delta_a(\phi) = \phi(a)\) is a <strong>singular distribution</strong> not given by a function.

**Why distributions?** Classical analysis runs into walls when working with PDE: the derivative of a discontinuous function does not exist classically, yet it arises naturally in physics (the derivative of the Heaviside step function is the Dirac delta). Distributions (also called "generalized functions") extend the notion of function so that every distribution has a derivative, every \(L^1_\text{loc}\) function can be differentiated infinitely often, and solutions to PDE can be found in spaces much larger than classical function spaces.

Laurent Schwartz introduced distributions rigorously in 1945, for which he was awarded the Fields Medal in 1950.

Operations on distributions are defined by duality:
- **Differentiation**: \(T'(\phi) = -T(\phi')\) (justified by integration by parts for regular distributions).
- **Multiplication by smooth functions**: \((gT)(\phi) = T(g\phi)\) for \(g \in C^\infty(\mathbb{R})\).

The **principal value** distribution \(\text{p.v.}\frac{1}{x}(\phi) = \lim_{\varepsilon \to 0^+}\int_{|x|>\varepsilon} \frac{\phi(x)}{x}\,dx\) is a fundamental singular distribution arising in the Hilbert transform.

**Distributional derivative examples:**
- The Heaviside step function \(H(x) = \mathbf{1}_{x>0}\) has distributional derivative \(H' = \delta_0\).
- The absolute value \(|x|\) has distributional derivative \(\text{sgn}(x)\), and second derivative \(2\delta_0\).
- The function \(\log|x|\) has distributional derivative \(\text{p.v.}\frac{1}{x}\).

## Tempered Distributions

<div class="definition">
<strong>Definition (Tempered Distributions).</strong> A <strong>tempered distribution</strong> is a continuous linear functional \(T : \mathcal{S}(\mathbb{R}) \to \mathbb{C}\). The space of tempered distributions is \(\mathcal{S}'(\mathbb{R})\).
</div>

Since \(\mathcal{D}(\mathbb{R}) \subset \mathcal{S}(\mathbb{R})\), restriction gives \(\mathcal{S}'(\mathbb{R}) \subset \mathcal{D}'(\mathbb{R})\). Tempered distributions are precisely those distributions that can be extended continuously from \(\mathcal{D}\) to \(\mathcal{S}\).

Functions of polynomial growth define tempered distributions: if \(f\) is measurable and \(|f(x)| \leq C(1 + |x|)^N\) for some \(N\), then \(T_f \in \mathcal{S}'(\mathbb{R})\).

**Why tempered?** "Tempered" means "not growing too fast." A distribution is tempered if it does not grow faster than a polynomial — fast enough for the Fourier transform to be defined (since Schwartz functions decay faster than any polynomial, tempered distributions can be "tested" against them). The Fourier transform is well-defined on \(\mathcal{S}'\), but not on all of \(\mathcal{D}'\) (which can include things like \(e^{x^2}\) that grow too fast for the Fourier transform to make sense).

## Fourier Transform of Tempered Distributions

<div class="definition">
<strong>Definition (Fourier Transform of a Tempered Distribution).</strong> For \(T \in \mathcal{S}'(\mathbb{R})\), define \(\hat{T} \in \mathcal{S}'(\mathbb{R})\) by

\[
\langle \hat{T}, \phi \rangle = \langle T, \hat{\phi} \rangle \quad \text{for all } \phi \in \mathcal{S}(\mathbb{R}).
\]
</div>

This is consistent with the classical definition for \(L^1\) functions (by Parseval's identity) and extends the Fourier transform to a continuous automorphism of \(\mathcal{S}'(\mathbb{R})\).

Key examples:

<div class="example">
<strong>Example 1:</strong> \(\hat{\delta} = 1\). Indeed, \(\langle \hat{\delta}, \phi\rangle = \langle \delta, \hat{\phi}\rangle = \hat{\phi}(0) = \int \phi(x)\,dx = \langle 1, \phi\rangle\).
</div>

<div class="example">
<strong>Example 2:</strong> \(\hat{1} = \delta\). Since \(\mathcal{F}^2 f(x) = f(-x)\), applying to the previous example gives \(\mathcal{F}(1) = \delta\). More explicitly, \(\langle \hat{1}, \phi\rangle = \langle 1, \hat{\phi}\rangle = \int \hat{\phi}(\xi)\,d\xi = \phi(0) = \langle\delta, \phi\rangle\) by the Fourier inversion theorem.
</div>

<div class="example">
<strong>Example 3:</strong> \(\widehat{e^{2\pi i a\cdot}} = \delta_a\). The function \(x \mapsto e^{2\pi iax}\) has Fourier transform \(\delta_a\) (Dirac delta at frequency \(a\)), consistent with the heuristic that a pure tone at frequency \(a\) is localized at that frequency.
</div>

<div class="example">
<strong>Example 4: The Dirac comb.</strong> The distribution \(\text{III}(x) = \sum_{n\in\mathbb{Z}}\delta_n\) is called the Dirac comb or Shah function. Its Fourier transform is \(\widehat{\text{III}} = \text{III}\) — the Dirac comb is its own Fourier transform! This is essentially the content of the Poisson summation formula: \(\sum_n \delta_n\) is the distributional version of \(\sum_n f(n) = \sum_k \hat{f}(k)\).
</div>

**Differentiation**: \(\widehat{T'} = 2\pi i\xi \hat{T}\) and \(\widehat{xT} = \frac{i}{2\pi}\hat{T}'\), extending the classical rules to distributions.

---

# Chapter 9: Inversion and Plancherel on ℝ

## Fourier Inversion on the Schwartz Class

<div class="theorem">
<strong>Theorem (Fourier Inversion on \(\mathcal{S}(\mathbb{R})\)).</strong> For \(f \in \mathcal{S}(\mathbb{R})\),

\[
f(x) = \int_{\mathbb{R}} \hat{f}(\xi)e^{2\pi ix\xi}\,d\xi.
\]
That is, \(\mathcal{F}^{-1} = \mathcal{F}^*\), where \((\mathcal{F}^* g)(x) = \int g(\xi)e^{2\pi ix\xi}\,d\xi\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Consider the family of Gaussians \(g_\varepsilon(x) = e^{-\pi\varepsilon^2\xi^2}\). One shows \(\int \hat{f}(\xi)g_\varepsilon(\xi)e^{2\pi ix\xi}\,d\xi = \int f(y)h_\varepsilon(x-y)\,dy\) where \(h_\varepsilon\) is a Gaussian approximate identity. As \(\varepsilon \to 0\), this converges to \(f(x)\), while the left side converges to \(\int \hat{f}(\xi)e^{2\pi ix\xi}\,d\xi\) by dominated convergence. \(\square\)
</div>

## Inversion on \(L^1(\mathbb{R})\)

For \(f \in L^1(\mathbb{R})\), the Fourier transform \(\hat{f}\) is continuous and bounded but need not be in \(L^1\), so the inversion integral may not converge absolutely.

<div class="theorem">
<strong>Theorem (Inversion in \(L^1\)).</strong> If \(f \in L^1(\mathbb{R})\) and \(\hat{f} \in L^1(\mathbb{R})\), then \(f(x) = \int_{\mathbb{R}} \hat{f}(\xi)e^{2\pi ix\xi}\,d\xi\) for a.e. \(x\).
</div>

**The difficulty:** Unlike the circle \(\mathbb{T}\), on \(\mathbb{R}\) the Fourier transform of an \(L^1\) function need not be in \(L^1\). Consider the function \(f = \mathbf{1}_{[-1,1]}\): its Fourier transform is \(\hat{f}(\xi) = \frac{\sin(2\pi\xi)}{\pi\xi}\), which is in \(L^2(\mathbb{R})\) but not in \(L^1(\mathbb{R})\) (since \(\int |\sin(2\pi\xi)/(\pi\xi)|\,d\xi = \infty\)). The inversion formula \(f = \check{\hat{f}}\) holds but requires principal value interpretation.

## Plancherel's Theorem on \(L^2(\mathbb{R})\)

<div class="theorem">
<strong>Theorem (Plancherel on \(\mathbb{R}\)).</strong> The Fourier transform extends uniquely from \(L^1(\mathbb{R}) \cap L^2(\mathbb{R})\) to a unitary isomorphism \(\mathcal{F} : L^2(\mathbb{R}) \to L^2(\mathbb{R})\). That is, for all \(f \in L^2(\mathbb{R})\),

\[
\|\hat{f}\|_{L^2(\mathbb{R})} = \|f\|_{L^2(\mathbb{R})},
\]
and the map \(f \mapsto \hat{f}\) is bijective on \(L^2(\mathbb{R})\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> For \(f \in L^1 \cap L^2\), the identity \(\|\hat{f}\|_2 = \|f\|_2\) follows from the Fourier inversion theorem and Parseval's identity on \(\mathcal{S}\). Since \(L^1 \cap L^2\) is dense in \(L^2\), and the Fourier transform is an isometry on this dense subspace, it extends uniquely to an isometry on all of \(L^2\). Surjectivity follows from the explicit inversion formula. \(\square\)
</div>

The \(L^2\) Fourier transform is defined as an \(L^2\) limit: for \(f \in L^2(\mathbb{R})\), choose \(f_n \in L^1 \cap L^2\) with \(f_n \to f\) in \(L^2\) (e.g., \(f_n = f \cdot \mathbf{1}_{[-n,n]}\)), and then \(\hat{f} = \lim_{n\to\infty} \hat{f}_n\) in \(L^2\). The pointwise formula \(\hat{f}(\xi) = \int f(x)e^{-2\pi ix\xi}\,dx\) holds only in a principal value sense.

**Plancherel as a symmetry:** The statement \(\|\hat{f}\|_2 = \|f\|_2\) says that the Fourier transform preserves the \(L^2\) norm — it is a *unitary* operator on the Hilbert space \(L^2(\mathbb{R})\). This is a kind of "energy conservation" principle: the total energy of a signal is the same whether measured in the time domain or the frequency domain.

---

# Chapter 10: Applications — PDE, Probability, Number Theory

## Heat Equation on \(\mathbb{R}\)

The Fourier transform reduces the heat equation \(u_t = u_{xx}\), \(u(x,0) = f(x)\) on \(\mathbb{R}\) to an ODE in the frequency variable:

\[
\hat{u}_t(\xi, t) = -(2\pi\xi)^2 \hat{u}(\xi,t), \quad \hat{u}(\xi,0) = \hat{f}(\xi).
\]
The solution is \(\hat{u}(\xi,t) = \hat{f}(\xi)e^{-4\pi^2\xi^2 t}\). Inverting, \(u = f * H_t\) where the **heat kernel** is:

\[
H_t(x) = \frac{1}{\sqrt{4\pi t}}e^{-x^2/(4t)}.
\]
For \(t > 0\), \(H_t \in \mathcal{S}(\mathbb{R})\), and convolution with \(H_t\) smooths \(f\) instantly — even if \(f\) is only in \(L^2\) or \(L^1\), the solution is \(C^\infty\) for \(t > 0\) (hypoellipticity / infinite speed of propagation of smoothness).

**Derivation of the heat kernel:** We need the inverse Fourier transform of \(e^{-4\pi^2\xi^2 t}\). Using the Gaussian computation: \(\mathcal{F}(e^{-\pi x^2})(\xi) = e^{-\pi\xi^2}\). Scaling: \(\mathcal{F}(a^{-1/2}e^{-\pi x^2/a})(\xi) = e^{-\pi a\xi^2}\). Setting \(\pi a = 4\pi^2 t\), so \(a = 4\pi t\):

\[
H_t(x) = \frac{1}{\sqrt{4\pi t}}e^{-x^2/(4t)} = \mathcal{F}^{-1}(e^{-4\pi^2\xi^2 t})(x).
\]

This is a beautiful circle: the heat equation's fundamental solution is a Gaussian, which is the function that is its own Fourier transform (up to scaling). The deep reason is that the Gaussian is the unique fixed point of the Fourier transform — and the heat equation's smoothing action in the spatial domain corresponds to Gaussian damping in the frequency domain.

## Wave Equation

The wave equation \(u_{tt} = u_{xx}\) transforms to \(\hat{u}_{tt} = -(2\pi\xi)^2\hat{u}\), giving \(\hat{u}(\xi,t) = \hat{f}(\xi)\cos(2\pi\xi t) + \hat{g}(\xi)\frac{\sin(2\pi\xi t)}{2\pi\xi}\) for initial data \(u(\cdot,0) = f\), \(u_t(\cdot,0) = g\). The **d'Alembert formula** \(u(x,t) = \frac{f(x+t)+f(x-t)}{2} + \frac{1}{2}\int_{x-t}^{x+t} g(s)\,ds\) follows by inverting. Unlike the heat equation, the wave equation propagates at finite speed (the solution at \((x,t)\) depends only on the initial data in \([x-t,x+t]\)).

**Contrast with heat:** The heat equation has infinite propagation speed (any perturbation of the initial data affects the solution everywhere immediately), while the wave equation has finite propagation speed (the "cone of dependence" is \([x-t, x+t]\)). This is visible in the Fourier transform: the heat damping factor \(e^{-4\pi^2\xi^2 t}\) kills all high frequencies exponentially, while the wave factor \(e^{\pm 2\pi i\xi t}\) is a pure phase rotation — no damping, just propagation.

## Probability: Characteristic Functions

<div class="definition">
<strong>Definition (Characteristic Function).</strong> The <strong>characteristic function</strong> of a random variable \(X\) with distribution \(\mu\) is

\[
\varphi_X(t) = \mathbb{E}[e^{itX}] = \int_{\mathbb{R}} e^{itx}\,d\mu(x) = \hat{\mu}(-t/(2\pi)).
\]
</div>

Characteristic functions are the Fourier–Stieltjes transforms of probability measures. They enjoy several key properties: \(\varphi_X(0) = 1\), \(|\varphi_X(t)| \leq 1\), and \(\varphi_X\) is uniformly continuous. The characteristic function of the standard normal \(N(0,1)\) is \(e^{-t^2/2}\) — again a Gaussian! This reflects the fact that the Gaussian is stable under convolution (sums of Gaussians are Gaussian) and is the unique distribution with this property (up to scaling).

<div class="theorem">
<strong>Theorem (Lévy Continuity Theorem).</strong> A sequence of probability measures \(\mu_n\) converges weakly to \(\mu\) if and only if \(\hat{\mu}_n(t) \to \hat{\mu}(t)\) for all \(t\), with the convergence being uniform on compact sets.
</div>

**Central Limit Theorem sketch**: If \(X_1, X_2, \ldots\) are i.i.d. with mean 0 and variance 1, then \(\varphi_{S_n/\sqrt{n}}(t) = \left(\varphi_X(t/\sqrt{n})\right)^n\). Taylor expanding \(\varphi_X(t/\sqrt{n}) \approx 1 - t^2/(2n) + o(1/n)\) gives \(\varphi_{S_n/\sqrt{n}}(t) \to e^{-t^2/2}\), the characteristic function of \(N(0,1)\). By Lévy's theorem, \(S_n/\sqrt{n} \xrightarrow{d} N(0,1)\).

## Poisson Summation Formula

<div class="theorem">
<strong>Theorem (Poisson Summation).</strong> For \(f \in \mathcal{S}(\mathbb{R})\),

\[
\sum_{n \in \mathbb{Z}} f(n) = \sum_{k \in \mathbb{Z}} \hat{f}(k).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Define \(F(x) = \sum_n f(x+n)\); this converges absolutely and is 1-periodic. Its Fourier coefficients are \(\hat{F}(k) = \int_0^1 F(x)e^{-2\pi ikx}\,dx = \sum_n \int_0^1 f(x+n)e^{-2\pi ikx}\,dx = \int_{\mathbb{R}} f(x)e^{-2\pi ikx}\,dx = \hat{f}(k)\). Evaluating at \(x = 0\): \(F(0) = \sum_n f(n) = \sum_k \hat{F}(k) = \sum_k \hat{f}(k)\). \(\square\)
</div>

**Application — Jacobi theta function**: Taking \(f(x) = e^{-\pi t x^2}\), so \(\hat{f}(\xi) = t^{-1/2}e^{-\pi\xi^2/t}\), the Poisson formula gives:

\[
\theta(t) := \sum_{n \in \mathbb{Z}} e^{-\pi n^2 t} = \frac{1}{\sqrt{t}}\sum_{n \in \mathbb{Z}} e^{-\pi n^2/t} = \frac{1}{\sqrt{t}}\theta(1/t).
\]
This functional equation for \(\theta(t)\) is central to the proof of the functional equation of the Riemann zeta function \(\zeta(s)\).

**Application — Number theory:** Via the Poisson summation formula, one can relate sums over lattice points to sums over frequencies. For example, the number of ways to represent an integer \(n\) as a sum of four squares is related to the Fourier coefficients of \(\theta(t)^4\) — a deep connection between automorphic forms and arithmetic (Jacobi's four-square theorem).

**Application — Sampling:** The Poisson summation formula is the mathematical foundation of the Shannon–Nyquist sampling theorem. Sampling a function \(f\) at integer points and then summing over \(\mathbb{Z}\) creates a periodic "aliased" version \(F(x) = \sum_n f(x+n)\) whose Fourier coefficients are the values \(\hat{f}(k)\) at integer frequencies. If \(\hat{f}\) is supported in \([-1/2, 1/2]\) (band-limited), there is no aliasing and the samples perfectly determine \(f\).

---

# Chapter 11: Further Applications

## The Sampling Theorem

The **Shannon–Nyquist sampling theorem** answers the question: when can a continuous function be perfectly reconstructed from its values at discrete sample points?

<div class="definition">
<strong>Definition (Band-Limited Function).</strong> A function \(f \in L^2(\mathbb{R})\) is <strong>band-limited</strong> with bandwidth \(B > 0\) if \(\hat{f}(\xi) = 0\) for \(|\xi| > B\).
</div>

<div class="theorem">
<strong>Theorem (Shannon–Nyquist).</strong> If \(f\) is band-limited with bandwidth \(B\), then \(f\) is completely determined by its samples \(\{f(n/(2B))\}_{n \in \mathbb{Z}}\), and can be reconstructed via:

\[
f(x) = \sum_{n \in \mathbb{Z}} f\!\left(\frac{n}{2B}\right) \text{sinc}(2Bx - n),
\]
where \(\text{sinc}(y) = \frac{\sin(\pi y)}{\pi y}\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Since \(\hat{f}\) is supported in \([-B, B]\), we can expand \(\hat{f}\) as a Fourier series on \([-B,B]\). The Fourier coefficients of \(\hat{f}\) (viewed as a function on \([-B,B]\)) are proportional to samples \(f(n/(2B))\). The reconstruction formula is then the Fourier series inversion. \(\square\)
</div>

The sampling rate \(2B\) (the Nyquist rate) is optimal: sampling below this rate leads to **aliasing**, where different frequency components become indistinguishable. The sinc function \(\frac{\sin(\pi y)}{\pi y}\) is the inverse Fourier transform of the indicator function of \([-1/2, 1/2]\), so the reconstruction formula is exactly the statement that convolution with an ideal low-pass filter (the indicator of \([-B,B]\) in frequency space) reconstructs the band-limited function from its samples.

## The Uncertainty Principle

The Heisenberg uncertainty principle in quantum mechanics has a precise mathematical formulation in terms of Fourier analysis.

<div class="theorem">
<strong>Theorem (Heisenberg–Pauli–Weyl Uncertainty Principle).</strong> For \(f \in L^2(\mathbb{R})\) with \(\|f\|_2 = 1\),

\[
\left(\int_{\mathbb{R}} x^2|f(x)|^2\,dx\right)\left(\int_{\mathbb{R}} \xi^2|\hat{f}(\xi)|^2\,d\xi\right) \geq \frac{1}{16\pi^2}.
\]
Equivalently, \(\|xf\|_{L^2} \cdot \|\xi\hat{f}\|_{L^2} \geq \frac{1}{4\pi}\|f\|_{L^2}^2\).
</div>

<div class="proof">
<strong>Proof (complete).</strong> We prove the equivalent form. Assume \(f \in \mathcal{S}(\mathbb{R})\) first.

**Step 1: Integration by parts.** Compute:

\[
\int_\mathbb{R} x(|f(x)|^2)'\ dx = \int_\mathbb{R} x(f\bar{f})'\ dx = \int_\mathbb{R} x(f'\bar{f} + f\bar{f}')\ dx = \int_\mathbb{R} x \cdot 2\text{Re}(f'(x)\overline{f(x)})\ dx.
\]
Integration by parts (boundary term vanishes for \(f \in \mathcal{S}\)):

\[
\int_\mathbb{R} x(|f|^2)'\ dx = -\int_\mathbb{R}|f(x)|^2\,dx = -\|f\|_2^2.
\]
Thus \(\text{Re}\int_\mathbb{R} xf'(x)\overline{f(x)}\,dx = -\frac{1}{2}\|f\|_2^2\).

**Step 2: Cauchy–Schwarz.** By Cauchy–Schwarz:

\[
\left|\int_\mathbb{R} xf'(x)\overline{f(x)}\,dx\right| \leq \|xf\|_2\|f'\|_2.
\]
Taking real parts: \(\frac{1}{2}\|f\|_2^2 \leq \|xf\|_2\|f'\|_2\).

**Step 3: Fourier identity.** Using \(\widehat{f'}(\xi) = 2\pi i\xi\hat{f}(\xi)\) and Plancherel: \(\|f'\|_2 = \|\widehat{f'}\|_2 = 2\pi\|\xi\hat{f}\|_2\).

**Step 4: Combine.** Substituting:

\[
\frac{1}{2}\|f\|_2^2 \leq \|xf\|_2 \cdot 2\pi\|\xi\hat{f}\|_2,
\]
giving \(\|xf\|_2\|\xi\hat{f}\|_2 \geq \frac{\|f\|_2^2}{4\pi}\). \(\square\)
</div>

**Equality condition:** Equality holds in Cauchy–Schwarz when \(f'\) and \(xf\) are proportional: \(f'(x) = \lambda x f(x)\) for some \(\lambda \in \mathbb{C}\). Since we also need \(\text{Re}(\lambda) < 0\) for \(f \in L^2\), writing \(\lambda = -2\pi a\) for \(a > 0\) gives \(f'(x) = -2\pi ax f(x)\), solved by \(f(x) = Ce^{-\pi a x^2}\). The equality is thus achieved uniquely (up to normalization, translation, and modulation) by Gaussian functions!

**Physical interpretation:** In quantum mechanics, \(|f(x)|^2\,dx\) is the probability of finding a particle in \([x, x+dx]\), and \(|\hat{f}(\xi)|^2\,d\xi\) is the probability of the particle having momentum in \([\xi, \xi+d\xi]\). The uncertainty principle says: you cannot simultaneously pin down both position and momentum with arbitrary precision. The Gaussian wavepacket (coherent state) is the unique state that saturates this bound — it is the most "quantum mechanically localized" state possible.

**Different formulation:** In signal processing, \(\Delta t \cdot \Delta\omega \geq \frac{1}{2}\) where \(\Delta t\) is the "time spread" and \(\Delta\omega\) is the "frequency spread" (standard deviations). This is why speech compression algorithms and spectrogram analysis face fundamental resolution limits: you cannot simultaneously achieve fine time resolution and fine frequency resolution.

## Sobolev Spaces

<div class="definition">
<strong>Definition (Sobolev Spaces \(H^s(\mathbb{R})\)).</strong> For \(s \in \mathbb{R}\), the <strong>Sobolev space</strong> \(H^s(\mathbb{R})\) is defined as

\[
H^s(\mathbb{R}) = \left\{f \in \mathcal{S}'(\mathbb{R}) : (1 + |\xi|^2)^{s/2}\hat{f}(\xi) \in L^2(\mathbb{R})\right\},
\]
with norm \(\|f\|_{H^s}^2 = \int_{\mathbb{R}} (1 + |\xi|^2)^s|\hat{f}(\xi)|^2\,d\xi\).
</div>

For integer \(s = k \geq 0\), \(H^k(\mathbb{R})\) coincides with the classical Sobolev space of functions with \(k\) derivatives in \(L^2\): \(H^k = \{f : f^{(j)} \in L^2 \text{ for } 0 \leq j \leq k\}\). The Fourier definition extends this to fractional and negative \(s\).

**Why Sobolev spaces?** In PDE, solutions often exist in "weak" form — they satisfy an equation only in a distributional sense, with limited regularity. Sobolev spaces provide the correct framework: they are Hilbert spaces with norms measuring both function values and derivative sizes, and they have good compactness and embedding properties.

**Sobolev embedding theorem**: if \(s > 1/2\), then \(H^s(\mathbb{R}) \hookrightarrow C_0(\mathbb{R})\) (functions in \(H^s\) are continuous and vanish at infinity). More generally, if \(s > k + 1/2\), then \(H^s(\mathbb{R}) \hookrightarrow C^k(\mathbb{R})\).

**Proof of embedding:** If \(f \in H^s\) with \(s > 1/2\), then \(\hat{f} \in L^1(\mathbb{R})\) (by Cauchy–Schwarz: \(\int |\hat{f}(\xi)|\,d\xi \leq (\int(1+|\xi|^2)^s|\hat{f}|^2)^{1/2}(\int(1+|\xi|^2)^{-s})^{1/2} < \infty\) when \(2s > 1\)), so \(f = \check{\hat{f}}\) is a continuous function vanishing at infinity.

**Elliptic regularity sketch**: Consider the equation \(-\Delta u + u = f\) on \(\mathbb{R}^n\). Taking the Fourier transform: \((4\pi^2|\xi|^2 + 1)\hat{u}(\xi) = \hat{f}(\xi)\), so \(\hat{u}(\xi) = \frac{\hat{f}(\xi)}{4\pi^2|\xi|^2 + 1}\). If \(f \in H^s\), then \(\hat{f}(\xi)(1+|\xi|^2)^{s/2} \in L^2\), and

\[
\hat{u}(\xi)(1+|\xi|^2)^{(s+2)/2} = \hat{f}(\xi)(1+|\xi|^2)^{s/2} \cdot \frac{(1+|\xi|^2)^{1}}{4\pi^2|\xi|^2+1} \in L^2,
\]
so \(u \in H^{s+2}\). The elliptic operator gains two derivatives in Sobolev regularity — a manifestation of elliptic regularity.

---

# Chapter 12: Fourier–Stieltjes Transform and Bochner's Theorem

## Measures and the Fourier–Stieltjes Transform

Let \(M(\mathbb{R})\) denote the space of finite (complex) Borel measures on \(\mathbb{R}\), equipped with total variation norm \(\|\mu\| = |\mu|(\mathbb{R})\). This is a Banach algebra under convolution \((\mu * \nu)(E) = \int \mu(E-x)\,d\nu(x)\).

<div class="definition">
<strong>Definition (Fourier–Stieltjes Transform).</strong> For \(\mu \in M(\mathbb{R})\), the <strong>Fourier–Stieltjes transform</strong> is

\[
\hat{\mu}(\xi) = \int_{\mathbb{R}} e^{-2\pi ix\xi}\,d\mu(x), \quad \xi \in \mathbb{R}.
\]
</div>

Properties of \(\hat{\mu}\):
- \(\hat{\mu}\) is bounded: \(|\hat{\mu}(\xi)| \leq \|\mu\|\).
- \(\hat{\mu}\) is uniformly continuous (but need not vanish at infinity — e.g., \(\mu = \delta_a\) gives \(\hat{\mu}(\xi) = e^{-2\pi ia\xi}\)).
- \(\widehat{\mu * \nu} = \hat{\mu} \cdot \hat{\nu}\) (the Fourier–Stieltjes transform is a homomorphism).

For absolutely continuous measures \(d\mu = f\,dx\) with \(f \in L^1(\mathbb{R})\), this reduces to the ordinary Fourier transform. The Riemann–Lebesgue lemma no longer applies: \(\hat{\mu}\) need not tend to zero at infinity.

## Positive-Definite Functions

<div class="definition">
<strong>Definition (Positive-Definite Function).</strong> A function \(\varphi : \mathbb{R} \to \mathbb{C}\) is <strong>positive definite</strong> if for all \(n \geq 1\), all \(x_1, \ldots, x_n \in \mathbb{R}\), and all \(c_1, \ldots, c_n \in \mathbb{C}\),

\[
\sum_{j=1}^n\sum_{k=1}^n c_j\overline{c_k}\varphi(x_j - x_k) \geq 0.
\]
</div>

Positive-definite functions satisfy: \(\varphi(0) \geq 0\), \(\overline{\varphi(x)} = \varphi(-x)\), and \(|\varphi(x)| \leq \varphi(0)\) for all \(x\). The Fourier–Stieltjes transform of a positive Borel measure is always positive definite, as:

\[
\sum_{j,k} c_j\overline{c_k}\hat{\mu}(x_j - x_k) = \int_{\mathbb{R}} \left|\sum_j c_j e^{-2\pi ix_j\xi}\right|^2 d\mu(\xi) \geq 0.
\]

Bochner's theorem is the profound converse.

## Bochner's Theorem

<div class="theorem">
<strong>Theorem (Bochner).</strong> A function \(\varphi : \mathbb{R} \to \mathbb{C}\) is continuous and positive definite if and only if there exists a finite positive Borel measure \(\mu\) on \(\mathbb{R}\) such that

\[
\varphi(x) = \hat{\mu}(x) = \int_{\mathbb{R}} e^{-2\pi it x}\,d\mu(t).
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> The "if" direction was shown above. For the "only if" direction: given a continuous positive-definite \(\varphi\), one verifies that the linear functional \(\Lambda : \mathcal{S}(\mathbb{R}) \to \mathbb{C}\) defined by \(\Lambda(f) = \int \varphi(x)\hat{f}(x)\,dx\) is positive (\(\Lambda(|f|^2) \geq 0\)) by the positive-definiteness assumption expanded via an approximation argument. By the Riesz representation theorem, \(\Lambda(f) = \int \hat{f}\,d\mu\) for some positive Borel measure \(\mu\). The Fourier inversion then identifies \(\varphi = \hat{\mu}\). \(\square\)
</div>

<div class="remark">
<strong>Remark (Connection to Probability).</strong> In probability theory, the characteristic function \(\varphi_X(t) = \mathbb{E}[e^{itX}]\) of any random variable \(X\) is continuous and positive definite (with \(\varphi_X(0) = 1\) and \(\|\mu\| = 1\)). Bochner's theorem gives a complete characterization: a function is a characteristic function if and only if it is continuous, positive definite, and equal to 1 at 0. This is fundamental for the theory of infinitely divisible distributions and Lévy processes.
</div>

**The Wiener algebra**: The image of \(M(\mathbb{R})\) under the Fourier–Stieltjes transform is the algebra of Fourier–Stieltjes transforms, a subalgebra of \(C_b(\mathbb{R})\) (bounded continuous functions). Understanding this image — which continuous functions are Fourier–Stieltjes transforms — is one of the central questions in abstract harmonic analysis, motivating the study of the Fourier algebra and Fourier–Stieltjes algebra \(B(G)\) for locally compact groups \(G\), a topic of ongoing research including work by Prof. Spronk.

<div class="remark">
<strong>Remark (Abstract Harmonic Analysis).</strong> The themes of this course — Fourier series on \(\mathbb{T}\), Fourier transform on \(\mathbb{R}\), and the Fourier–Stieltjes transform — are special cases of abstract harmonic analysis on locally compact abelian groups \(G\). Pontryagin duality gives a canonical isomorphism \(G \cong \hat{\hat{G}}\) (the dual of the dual), and Plancherel's theorem holds for all locally compact abelian groups with Haar measure. Non-abelian harmonic analysis (representation theory of non-abelian groups) generalizes further, replacing characters by irreducible unitary representations, and is an active area of modern mathematics.
</div>

---

# Chapter 13: Abstract Harmonic Analysis and Pontryagin Duality

## Locally Compact Abelian Groups

The framework of this course — Fourier analysis on \(\mathbb{T}\) and \(\mathbb{R}\) — extends to a vast generalization: the theory of locally compact abelian groups (LCA groups). This generalization, developed primarily by André Weil and Lev Pontryagin in the 1930s–40s, unifies Fourier series (on \(\mathbb{T}\)), the Fourier transform (on \(\mathbb{R}\)), and discrete Fourier analysis (on \(\mathbb{Z}/n\mathbb{Z}\)) into a single framework.

<div class="definition">
<strong>Definition (LCA Group).</strong> A <strong>locally compact abelian group</strong> is an abelian group \(G\) equipped with a topology making it a locally compact Hausdorff space, such that the group operations (multiplication \(G \times G \to G\) and inversion \(G \to G\)) are continuous.
</div>

**Examples:**
- \(\mathbb{R}^n\) with addition (non-compact).
- \(\mathbb{T} = \mathbb{R}/\mathbb{Z}\) (compact).
- \(\mathbb{Z}\) with the discrete topology (discrete).
- \(\mathbb{Z}/n\mathbb{Z}\) (finite, hence compact and discrete).
- \(\mathbb{Q}_p\) (the \(p\)-adic numbers — compact open subgroups).
- Any product \(G_1 \times G_2\) of LCA groups.

## Haar Measure

<div class="theorem">
<strong>Theorem (Haar Measure, A. Weil 1940).</strong> Every locally compact group \(G\) admits a left-translation-invariant regular Borel measure \(\mu_G\), unique up to a positive scalar. If \(G\) is abelian (or compact), this measure is also right-translation-invariant (bi-invariant, or simply <strong>Haar measure</strong>).
</div>

The Haar measure is the natural notion of "size" on \(G\), analogous to Lebesgue measure on \(\mathbb{R}\). It allows the definition of \(L^p(G)\) spaces and convolution on \(G\).

**Examples of Haar measures:**
- \(\mathbb{R}^n\): Lebesgue measure \(dx\).
- \(\mathbb{T}\): normalized arc length \(\frac{d\theta}{2\pi}\).
- \(\mathbb{Z}\): counting measure.
- \(\mathbb{Z}/n\mathbb{Z}\): \(\frac{1}{n}\) times counting measure (normalized).
- Compact group: the Haar measure is a probability measure (total mass 1).
- Discrete group: counting measure.

## The Dual Group and Pontryagin Duality

<div class="definition">
<strong>Definition (Dual Group / Pontryagin Dual).</strong> For an LCA group \(G\), the <strong>Pontryagin dual</strong> \(\hat{G}\) is the group of continuous group homomorphisms \(\chi : G \to \mathbb{T}\), called <strong>characters</strong>, equipped with the compact-open topology and pointwise multiplication \((\chi_1\chi_2)(g) = \chi_1(g)\chi_2(g)\).
</div>

The characters \(\chi : G \to \mathbb{T}\) are the "pure frequencies" on \(G\). They generalize:
- On \(\mathbb{T}\): characters are \(\chi_n(\theta) = e^{in\theta}\) for \(n \in \mathbb{Z}\), so \(\hat{\mathbb{T}} = \mathbb{Z}\).
- On \(\mathbb{R}\): characters are \(\chi_\xi(x) = e^{2\pi ix\xi}\) for \(\xi \in \mathbb{R}\), so \(\hat{\mathbb{R}} = \mathbb{R}\).
- On \(\mathbb{Z}\): characters are \(\chi_\theta(n) = e^{in\theta}\) for \(\theta \in \mathbb{T}\), so \(\hat{\mathbb{Z}} = \mathbb{T}\).
- On \(\mathbb{Z}/n\mathbb{Z}\): characters are \(\chi_k(j) = e^{2\pi ijk/n}\) for \(k \in \mathbb{Z}/n\mathbb{Z}\), so \(\widehat{\mathbb{Z}/n\mathbb{Z}} = \mathbb{Z}/n\mathbb{Z}\).

<div class="theorem">
<strong>Theorem (Pontryagin Duality).</strong> For any LCA group \(G\), there is a natural isomorphism \(G \cong \hat{\hat{G}}\), given by the evaluation map \(g \mapsto (\chi \mapsto \chi(g))\). This is a topological group isomorphism.
</div>

Pontryagin duality says that "taking characters twice" returns to the original group. This is a profound symmetry between a group and its dual:
- \(\mathbb{T}\) and \(\mathbb{Z}\) are Pontryagin duals of each other.
- \(\mathbb{R}\) is self-dual: \(\hat{\mathbb{R}} \cong \mathbb{R}\).
- \(\mathbb{Z}/n\mathbb{Z}\) is self-dual.
- Compact groups have discrete duals; discrete groups have compact duals.

**The duality table:**

| Group \(G\) | Dual \(\hat{G}\) | Fourier analysis |
|---|---|---|
| \(\mathbb{T}\) (circle) | \(\mathbb{Z}\) (integers) | Fourier series |
| \(\mathbb{Z}\) (integers) | \(\mathbb{T}\) (circle) | Discrete Fourier series |
| \(\mathbb{R}\) (reals) | \(\mathbb{R}\) (reals) | Fourier transform |
| \(\mathbb{Z}/n\mathbb{Z}\) (cyclic) | \(\mathbb{Z}/n\mathbb{Z}\) (cyclic) | DFT |
| Compact \(\Leftrightarrow\) | Discrete | Fourier series \(\leftrightarrow\) Fourier transform |

## The Abstract Fourier Transform

For an LCA group \(G\) with Haar measure \(\mu_G\), define the **abstract Fourier transform** of \(f \in L^1(G)\) as:

\[
\hat{f}(\chi) = \int_G f(g)\overline{\chi(g)}\,d\mu_G(g), \quad \chi \in \hat{G}.
\]

This is the Fourier transform on the dual group \(\hat{G}\). The abstract theory gives:
- **Riemann–Lebesgue:** \(\hat{f} \in C_0(\hat{G})\) for \(f \in L^1(G)\).
- **Convolution:** \(\widehat{f*g} = \hat{f}\cdot\hat{g}\).
- **Plancherel:** The Fourier transform extends to a unitary isomorphism \(L^2(G) \cong L^2(\hat{G})\) (with appropriate Haar measures on \(\hat{G}\)).
- **Inversion:** For \(f \in L^1(G)\) with \(\hat{f} \in L^1(\hat{G})\), \(f(g) = \int_{\hat{G}}\hat{f}(\chi)\chi(g)\,d\mu_{\hat{G}}(\chi)\).

## Abstract Fourier Analysis on the Circle: Connection to Representation Theory

The characters \(e^{inx}\) on \(\mathbb{T}\) are precisely the **irreducible unitary representations** of \(\mathbb{T}\). Since \(\mathbb{T}\) is abelian, every irreducible representation is one-dimensional (a character). The Fourier series expansion \(f = \sum_n \hat{f}(n)e_n\) is the decomposition of \(f\) (viewed as acting by multiplication in the regular representation) into irreducibles.

For non-abelian groups \(G\), irreducible representations are higher-dimensional, and the Fourier transform \(\hat{f}(\pi) = \int_G f(g)\pi(g)\,d\mu_G(g)\) takes values in operators (matrices). The Peter–Weyl theorem for compact groups and the Plancherel theorem for locally compact groups give the non-abelian analogues of Parseval's identity. This is the starting point of the representation-theoretic approach to Fourier analysis, which is central to Prof. Spronk's research.

## The Wiener Tauberian Theorem

A crowning achievement of abstract harmonic analysis is Wiener's Tauberian theorem, which generalizes Hardy's theorem and has deep applications in number theory.

<div class="theorem">
<strong>Theorem (Wiener's Tauberian Theorem).</strong> Let \(G = \mathbb{R}\). If \(f \in L^1(\mathbb{R})\) and \(\hat{f}(\xi) \neq 0\) for all \(\xi \in \mathbb{R}\), then the closed linear span (in \(L^1\)) of the translates \(\{f(\cdot - a) : a \in \mathbb{R}\}\) is all of \(L^1(\mathbb{R})\).
</div>

The condition \(\hat{f} \neq 0\) everywhere is called "non-vanishing spectrum." Wiener's theorem says: if \(f\) has non-vanishing spectrum, then the translates of \(f\) are "dense" in \(L^1\). As a corollary, if \(\mu\) is a measure on \(\mathbb{R}\) and \(\int f(x-t)\,d\mu(t) \to L\int f(x)\,dx\) for some \(f\) with non-vanishing spectrum, then the same holds for all \(g \in L^1\). This is the Tauberian content: knowing the "limit" for one test function with non-vanishing spectrum forces the limit for all test functions.

**Application to the prime number theorem:** The prime number theorem (\(\pi(x) \sim x/\log x\) where \(\pi(x)\) counts primes up to \(x\)) can be proved using Wiener's theorem. The key step is showing that the Riemann zeta function \(\zeta(s)\) has no zeros on the line \(\text{Re}(s) = 1\), which corresponds (via an analytic Tauberian argument) to the non-vanishing of a certain Fourier transform.

---

# Chapter 14: The Hilbert Transform

## Definition and Motivation

The **Hilbert transform** is the most important singular integral operator in harmonic analysis. It arises naturally in several contexts: the relationship between real and imaginary parts of analytic functions, the conjugate Fourier series, and the theory of \(L^p\) convergence of Fourier series.

<div class="definition">
<strong>Definition (Hilbert Transform).</strong> The <strong>Hilbert transform</strong> of \(f \in \mathcal{S}(\mathbb{R})\) is

\[
(Hf)(x) = \text{p.v.}\frac{1}{\pi}\int_{-\infty}^\infty \frac{f(y)}{x-y}\,dy = \lim_{\varepsilon\to 0^+}\frac{1}{\pi}\int_{|x-y|>\varepsilon}\frac{f(y)}{x-y}\,dy.
\]
</div>

The Hilbert transform is a **convolution** with the kernel \(k(x) = \frac{1}{\pi x}\), which is not integrable at 0 — hence the principal value interpretation.

**Fourier multiplier:** The Fourier transform simplifies the Hilbert transform dramatically:

\[
\widehat{Hf}(\xi) = -i\,\text{sgn}(\xi)\hat{f}(\xi),
\]
where \(\text{sgn}(\xi) = \pm 1\) for \(\xi \gtrless 0\). The Hilbert transform is thus the Fourier multiplier with symbol \(-i\,\text{sgn}(\xi)\) — it rotates the phase of each frequency component by \(\pm\pi/2\).

**Derivation:** The Fourier transform of the principal value distribution \(\text{p.v.}\frac{1}{\pi x}\) is \(-i\,\text{sgn}(\xi)\). This can be seen by regularization: \(\text{p.v.}\frac{1}{\pi x} = \lim_{\varepsilon\to 0}(\frac{1}{\pi x}\mathbf{1}_{|x|>\varepsilon})\), and the Fourier transform of \(\frac{1}{\pi x}\mathbf{1}_{|x|>\varepsilon}\) converges to \(-i\,\text{sgn}(\xi)\) as \(\varepsilon\to 0\).

## Properties of the Hilbert Transform

1. **\(L^2\) isometry:** Since \(|\text{sgn}(\xi)| = 1\), Plancherel gives \(\|Hf\|_2 = \|f\|_2\) — the Hilbert transform is an isometry on \(L^2(\mathbb{R})\).

2. **Involution:** \(H^2 = -I\) (the Hilbert transform squares to minus the identity), since \((-i\,\text{sgn}(\xi))^2 = -1\). So \(H\) is a unitary operator with \(H^{-1} = -H\).

3. **\(L^p\) boundedness (M. Riesz, 1927):** For \(1 < p < \infty\), \(H : L^p(\mathbb{R}) \to L^p(\mathbb{R})\) is bounded. This is the central tool in proving \(L^p\) convergence of Fourier series.

4. **Weak \(L^1\) bound:** \(H\) is not bounded on \(L^1\) (the integral of \(1/x\) diverges), but it satisfies the weak-type estimate \(\mu(\{|Hf| > \lambda\}) \leq C\|f\|_1/\lambda\) for all \(\lambda > 0\).

5. **Analytic functions:** If \(f\) is the real part of an analytic function \(F = f + ig\) in the upper half-plane, then \(g\) is (up to constants) the Hilbert transform of \(f|_{\mathbb{R}}\). The Hilbert transform thus converts between the real and imaginary parts of boundary values of analytic functions.

## Connection to Fourier Series Convergence

The Hilbert transform is the key to proving \(L^p\) convergence of Fourier series for \(1 < p < \infty\). The **conjugate Fourier series** of \(f \in L^1(\mathbb{T})\) is:

\[
\tilde{f}(x) = -i\sum_{n\neq 0} \text{sgn}(n)\hat{f}(n)e^{inx}.
\]
This is the Fourier series with the Fourier multiplier \(-i\,\text{sgn}(n)\) — the discrete analogue of the Hilbert transform. The conjugate Fourier series converges in \(L^p\) for \(1 < p < \infty\) because the discrete Hilbert transform (convolution with \(\text{p.v.}\cot(x/2)/(2\pi)\) on \(\mathbb{T}\)) is bounded on \(L^p(\mathbb{T})\). M. Riesz's theorem on \(L^p\) convergence of Fourier series follows directly.

---

# Chapter 15: Harmonic Analysis Beyond the Course

## Wavelets: An Alternative to Fourier

The Fourier transform decomposes a function into pure frequencies — infinite sine waves. This is powerful for stationary signals (whose frequency content does not change over time), but poor for non-stationary signals (like speech, music, or images with sharp edges).

**The wavelet transform** decomposes a function into "wavelets" — localized oscillatory pieces supported in small intervals, dilated and translated to cover all scales and locations. The wavelet transform \(Wf(a,b) = \frac{1}{\sqrt{|a|}}\int f(x)\overline{\psi\!\left(\frac{x-b}{a}\right)}\,dx\) (where \(\psi\) is a "mother wavelet") provides simultaneous time-frequency localization, unlike the Fourier transform.

Wavelets inherit the uncertainty principle: a wavelet cannot be perfectly localized in both time and frequency, but wavelets are specifically designed to balance this tradeoff better than pure Fourier modes for practical signals.

## \(L^p\) Harmonic Analysis and Calderón–Zygmund Theory

Beyond the Hilbert transform, there is a large family of **singular integral operators** of the form \(Tf(x) = \int K(x,y)f(y)\,dy\) where \(K\) is a singular kernel. The **Calderón–Zygmund theory** (1952) provides a unified framework for proving \(L^p\) boundedness of such operators:
1. Show \(T\) is bounded on \(L^2\) (often via Fourier multipliers).
2. Show \(T\) satisfies a "weak type (1,1)" estimate (using the Calderón–Zygmund decomposition).
3. Interpolate to get boundedness on \(L^p\) for \(1 < p < 2\).
4. Use duality to extend to \(2 < p < \infty\).

This program, combining interpolation, decomposition, and duality, is the backbone of modern harmonic analysis and PDE.

## Hardy Spaces and BMO

The Hardy space \(H^1(\mathbb{R})\) is the "right" replacement for \(L^1\) in harmonic analysis: it consists of those \(L^1\) functions whose Hilbert transform is also in \(L^1\). The space \(\text{BMO}(\mathbb{R})\) (functions of bounded mean oscillation) is the dual of \(H^1\) and the "right" replacement for \(L^\infty\). The Fefferman–Stein theorem (\(H^1\)–\(\text{BMO}\) duality) is a deep result that shows \(\text{BMO}\) is the correct endpoint for many singular integral estimates.

The Fourier multiplier characterization of singular integrals, the role of the Hilbert transform as the canonical singular integral, and the Calderón–Zygmund decomposition together form the foundation of modern harmonic analysis and its applications to PDE, number theory, and geometry.

---

# Appendix: Key Identities and Summary Formulas

## Fourier Series Formulas

For \(f \in L^1(\mathbb{T})\) with Fourier coefficients \(\hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^\pi f(x)e^{-inx}\,dx\):

| Identity | Formula |
|---|---|
| Parseval | \(\|f\|_{L^2}^2 = \sum_n \vert \hat{f}(n)\vert ^2\) |
| Convolution | \(\widehat{f*g}(n) = \hat{f}(n)\hat{g}(n)\) |
| Differentiation | \(\widehat{f'}(n) = in\hat{f}(n)\) |
| Translation | \(\widehat{f(\cdot-a)}(n) = e^{-ina}\hat{f}(n)\) |
| Modulation | \(\widehat{e^{iax}f}(n) = \hat{f}(n-a)\) |
| Conjugation | \(\widehat{\bar{f}}(n) = \overline{\hat{f}(-n)}\) |

## Key Fourier Coefficient Computations

| Function \(f(x)\) | Fourier coefficients \(\hat{f}(n)\) |
|---|---|
| \(f(x) = x\) (sawtooth) | \(\hat{f}(0) = 0\), \(\hat{f}(n) = \frac{i(-1)^n}{n}\) for \(n\neq 0\) |
| \(f(x) = x^2\) (parabola) | \(\hat{f}(0) = \frac{\pi^2}{3}\), \(\hat{f}(n) = \frac{2(-1)^n}{n^2}\) |
| \(f(x) = \vert x\vert \) (triangle) | \(\hat{f}(0) = \frac{\pi}{2}\), \(\hat{f}(n) = \frac{(-1)^n-1}{\pi n^2}\) |
| \(f(x) = \text{sgn}(x)\) (square) | \(\hat{f}(n) = \frac{1-(-1)^n}{\pi in}\) (odd \(n\): \(\frac{2}{\pi in}\)) |
| \(f(x) = e^{ax}\), \(a \notin i\mathbb{Z}\) | \(\hat{f}(n) = \frac{e^{a\pi}-e^{-a\pi}}{2\pi(a-in)}\) |

## Series Identities Derived from Parseval

| Identity | Source |
|---|---|
| \(\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}\) | Parseval for \(f(x)=x\) or evaluation of \(f(x)=x^2\) |
| \(\sum_{n=1}^\infty \frac{1}{n^4} = \frac{\pi^4}{90}\) | Parseval for \(f(x)=x^2\) |
| \(\sum_{n=0}^\infty \frac{1}{(2n+1)^2} = \frac{\pi^2}{8}\) | Parseval for square wave |
| \(\sum_{n=0}^\infty \frac{(-1)^n}{2n+1} = \frac{\pi}{4}\) | Leibniz formula, from \(f(x)=x\) at \(x=\pi/2\) |
| \(\sum_{n=1}^\infty \frac{1}{(2n-1)^4} = \frac{\pi^4}{96}\) | Parseval for \(f(x)=\vert x\vert \) |

## Fourier Transform Formulas on \(\mathbb{R}\)

Convention: \(\hat{f}(\xi) = \int_\mathbb{R} f(x)e^{-2\pi ix\xi}\,dx\).

| Function \(f(x)\) | Fourier transform \(\hat{f}(\xi)\) |
|---|---|
| \(e^{-\pi x^2}\) (Gaussian) | \(e^{-\pi\xi^2}\) (self-dual!) |
| \(e^{-a\vert x\vert }\), \(a > 0\) | \(\frac{2a}{a^2+4\pi^2\xi^2}\) |
| \(\mathbf{1}_{[-a,a]}(x)\) (box) | \(\frac{\sin(2\pi a\xi)}{\pi\xi} = 2a\,\text{sinc}(2a\xi)\) |
| \(\text{sinc}(x) = \frac{\sin(\pi x)}{\pi x}\) | \(\mathbf{1}_{[-1/2,1/2]}(\xi)\) |
| \(H_t(x) = \frac{1}{\sqrt{4\pi t}}e^{-x^2/4t}\) | \(e^{-4\pi^2\xi^2 t}\) |
| \(\delta_a(x)\) | \(e^{-2\pi ia\xi}\) |
| \(e^{2\pi iax}\) | \(\delta_a(\xi)\) |
| \(\text{p.v.}\frac{1}{\pi x}\) | \(-i\,\text{sgn}(\xi)\) |

## Kernels and Their Properties

| Kernel | Formula | Non-negative? | \(\|\cdot\|_{L^1}\) |
|---|---|---|---|
| Dirichlet \(D_N\) | \(\frac{\sin((N+\frac12)x)}{\sin(x/2)}\) | No | \(\sim \frac{4}{\pi^2}\log N\) |
| Fejér \(K_N\) | \(\frac{1}{N}\left(\frac{\sin(Nx/2)}{\sin(x/2)}\right)^2\) | Yes | 1 |
| Poisson \(P_r\) | \(\frac{1-r^2}{1-2r\cos x+r^2}\) | Yes | 1 |
| Weierstrass \(W_t\) | \(\sum_n e^{-n^2t}e^{inx}\) | Yes | 1 |
| Heat \(H_t\) | \(\frac{1}{\sqrt{4\pi t}}e^{-x^2/(4t)}\) | Yes | 1 |

## Fundamental Theorems Summary

<div class="theorem">
<strong>Summary: The Main Theorems of Fourier Analysis.</strong>
<ol>
<li><strong>Riemann–Lebesgue:</strong> \(f \in L^1 \Rightarrow \hat{f}(n) \to 0\).</li>
<li><strong>Fejér:</strong> \(f \in C(\mathbb{T}) \Rightarrow \sigma_N f \to f\) uniformly.</li>
<li><strong>Dini:</strong> If \(\frac{f(x_0+t)+f(x_0-t)-2s}{t} \in L^1\) near 0, then \(S_N f(x_0) \to s\).</li>
<li><strong>Localization:</strong> \(S_N f(x_0)\) depends only on \(f\) near \(x_0\).</li>
<li><strong>Parseval:</strong> \(\|f\|_{L^2(\mathbb{T})}^2 = \sum_n |\hat{f}(n)|^2\) for \(f \in L^2(\mathbb{T})\).</li>
<li><strong>Riesz–Fischer:</strong> \(\mathcal{F}: L^2(\mathbb{T}) \to \ell^2(\mathbb{Z})\) is an isometric isomorphism.</li>
<li><strong>M. Riesz:</strong> \(f \in L^p(\mathbb{T})\), \(1 < p < \infty \Rightarrow S_N f \to f\) in \(L^p\).</li>
<li><strong>Plancherel (on \(\mathbb{R}\)):</strong> \(\mathcal{F}: L^2(\mathbb{R}) \to L^2(\mathbb{R})\) is a unitary isomorphism.</li>
<li><strong>Inversion:</strong> If \(f, \hat{f} \in L^1(\mathbb{R})\), then \(f(x) = \int \hat{f}(\xi)e^{2\pi ix\xi}\,d\xi\) a.e.</li>
<li><strong>Poisson Summation:</strong> \(\sum_n f(n) = \sum_k \hat{f}(k)\) for \(f \in \mathcal{S}(\mathbb{R})\).</li>
<li><strong>Uncertainty:</strong> \(\|xf\|_2 \cdot \|\xi\hat{f}\|_2 \geq \frac{1}{4\pi}\|f\|_2^2\), equality iff \(f\) is Gaussian.</li>
<li><strong>Bochner:</strong> \(\varphi\) is continuous and positive definite \(\Leftrightarrow\) \(\varphi = \hat{\mu}\) for a positive measure \(\mu\).</li>
<li><strong>Pontryagin duality:</strong> For an LCA group \(G\), \(G \cong \hat{\hat{G}}\) naturally.</li>
</ol>
</div>

---

# Chapter 16: Why Exponentials? The Deep Reasons

## Eigenfunctions of Translation and Differentiation

One of the most important conceptual questions in Fourier analysis is: *why do we use \(e^{inx}\) as the basis functions?* It is not an arbitrary choice. There are at least three independent, compelling reasons.

**Reason 1: Eigenfunctions of the differentiation operator.** Consider the ordinary differential equation \(Df = \lambda f\) where \(D = \frac{d}{dx}\). The solutions are \(f(x) = Ce^{\lambda x}\). For periodic solutions on \(\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}\), we need \(e^{\lambda(x+2\pi)} = e^{\lambda x}\), which forces \(e^{2\pi\lambda} = 1\), so \(\lambda = in\) for some \(n \in \mathbb{Z}\). Therefore, the functions \(e^{inx}\) are precisely the **eigenfunctions of \(d/dx\) on \(\mathbb{T}\)**, with eigenvalues \(in\). Since \(d/dx\) is a fundamental operator in analysis and physics (it appears in every linear PDE), it is natural to decompose functions into eigenfunctions of \(d/dx\). The Fourier series is this eigenfunction expansion.

More concretely: any constant-coefficient linear differential operator \(L = \sum_{k=0}^N a_k \frac{d^k}{dx^k}\) is diagonalized by the Fourier basis. We have \(Le^{inx} = \left(\sum_k a_k (in)^k\right)e^{inx} = p(in)e^{inx}\) where \(p\) is a polynomial. So \(L\) acts on each Fourier mode independently, multiplying it by the scalar \(p(in)\). This is the fundamental reason the Fourier transform converts differential equations to algebraic ones: it simultaneously diagonalizes all constant-coefficient differential operators.

**Reason 2: Characters of the group \(\mathbb{T}\).** The circle \(\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}\) is an abelian group. A **character** of \(\mathbb{T}\) is a continuous group homomorphism \(\chi : \mathbb{T} \to \mathbb{C}^\times\) of modulus 1 (i.e., mapping into the unit circle \(\mathbb{T} \subset \mathbb{C}^\times\)). The homomorphism property means \(\chi(x+y) = \chi(x)\chi(y)\) for all \(x, y \in \mathbb{T}\).

If \(\chi\) is smooth and satisfies this, differentiate: \(\chi'(x+y) = \chi'(x)\chi(y)\). Setting \(x = 0\): \(\chi'(y) = \chi'(0)\chi(y)\). This is the same ODE as before, giving \(\chi(y) = e^{\chi'(0)y}\). The condition \(|\chi| = 1\) forces \(\chi'(0) = in\) for \(n \in \mathbb{Z}\). So the characters of \(\mathbb{T}\) are exactly \(e_n(x) = e^{inx}\), \(n \in \mathbb{Z}\).

This is the group-theoretic explanation: characters are the simplest functions on a group, encoding its symmetry. Any group-invariant analysis on \(\mathbb{T}\) must decompose into characters — this is the Peter–Weyl theorem for compact abelian groups.

**Reason 3: Eigenfunctions of convolution (translation-invariant operators).** A **translation-invariant linear operator** \(T : L^2(\mathbb{T}) \to L^2(\mathbb{T})\) satisfies \(T(\tau_a f) = \tau_a(Tf)\) where \(\tau_a f(x) = f(x-a)\). Such operators include: convolution with a fixed kernel \(Tf = f * g\), the Hilbert transform, the Fourier partial sums \(S_N\), and all differential operators with constant coefficients.

**Claim:** Every bounded translation-invariant operator on \(L^2(\mathbb{T})\) is a **Fourier multiplier**: \(\widehat{Tf}(n) = m(n)\hat{f}(n)\) for some bounded sequence \(m(n)\), called the **multiplier sequence**. The action of \(T\) on each Fourier mode \(e^{inx}\) is multiplication by \(m(n)\), and the functions \(e^{inx}\) are simultaneous eigenfunctions of all such operators.

**Proof of claim:** Let \(T\) be translation-invariant and bounded. For each \(n \in \mathbb{Z}\), apply \(T\) to the character \(e_n(x) = e^{inx}\). We have:

\[
(T e_n)(x) = T(\tau_{-y}e_n)(x+y) = \tau_{-y}(Te_n)(x+y) \cdot e^{iny}/ e^{iny}
\]
More cleanly: let \(m(n) = \widehat{Te_n}(n)/1\). Translation-invariance gives \(\tau_a(Te_n) = T(\tau_a e_n) = T(e^{-ina}e_n) = e^{-ina}Te_n\). So \(Te_n\) is an eigenfunction of every translation with eigenvalue \(e^{-ina}\) — which forces \(Te_n = c_n e_n\) for some constant \(c_n = m(n)\). For general \(f = \sum \hat{f}(n)e_n\), linearity and continuity give \(Tf = \sum m(n)\hat{f}(n)e_n\). Thus \(T\) is a Fourier multiplier. \(\square\)

This is the **spectral theorem for translation-invariant operators**: the Fourier basis simultaneously diagonalizes all such operators. In engineering terms, sinusoids are the "eigenmodes" of any linear time-invariant (LTI) system, and the transfer function \(m(n)\) captures the system's response at each frequency.

**Reason 4: Convolution algebra diagonalization.** The Fourier transform is a homomorphism of algebras: it converts \((L^1(\mathbb{T}), *)\) (with convolution as multiplication) into \((\ell^\infty(\mathbb{Z}), \cdot)\) (with pointwise multiplication). This is because

\[
\widehat{f * g}(n) = \hat{f}(n)\hat{g}(n).
\]
In algebraic language: the Fourier transform is an algebra homomorphism, and the characters \(e^{inx}\) are the "maximal ideals" (Gelfand theory) of the convolution algebra. The Fourier series is the Gelfand transform — the most natural representation of the algebra.

## Why Not Other Bases?

Could we use other orthonormal bases for \(L^2(\mathbb{T})\)? Yes — for example, wavelets, or the Haar system, or Legendre polynomials adapted to the circle. But none of these have the four properties above simultaneously. Exponentials are special because they are:
1. Smooth (unlike the Haar wavelet which has jumps).
2. Eigenfunctions of differentiation (unlike wavelets).
3. Characters of the group (a group-theoretic property no other system has).
4. Eigenfunctions of all convolution operators simultaneously.

The price we pay is that exponentials are *non-localized*: a single \(e^{inx}\) is spread over all of \(\mathbb{T}\), contributing to every point. This is why the Fourier transform is poor for analyzing localized events (like a click in audio, or an edge in an image) — and why wavelets were invented as a complementary tool.

---

# Chapter 17: Bessel's Inequality, Completeness, and the Proof of Parseval

## Bessel's Inequality

Let \(\mathcal{H}\) be a Hilbert space with inner product \(\langle \cdot, \cdot \rangle\), and let \(\{e_n\}_{n \in \mathbb{Z}}\) be an orthonormal system (not necessarily complete). For any \(f \in \mathcal{H}\), the **Fourier coefficients** with respect to this system are \(c_n = \langle f, e_n \rangle\).

<div class="theorem">
<strong>Theorem (Bessel's Inequality).</strong> For any orthonormal system \(\{e_n\}\) in a Hilbert space \(\mathcal{H}\) and any \(f \in \mathcal{H}\),

\[
\sum_{n \in \mathbb{Z}} |\langle f, e_n\rangle|^2 \leq \|f\|^2.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Let \(S_N = \sum_{|n| \leq N} \langle f, e_n\rangle e_n\) be the partial Fourier sum. Observe that \(S_N\) is the orthogonal projection of \(f\) onto \(V_N = \text{span}\{e_n : |n| \leq N\}\). The projection is characterized by \(f - S_N \perp V_N\), which we verify: for \(|m| \leq N\),

\[
\langle f - S_N, e_m\rangle = \langle f, e_m\rangle - \sum_{|n|\leq N}\langle f, e_n\rangle\langle e_n, e_m\rangle = \langle f, e_m\rangle - \langle f, e_m\rangle = 0.
\]
Now by the Pythagorean theorem:

\[
\|f\|^2 = \|S_N + (f - S_N)\|^2 = \|S_N\|^2 + \|f - S_N\|^2 \geq \|S_N\|^2 = \sum_{|n|\leq N}|\langle f, e_n\rangle|^2.
\]
Since this holds for all \(N\), taking \(N \to \infty\) gives Bessel's inequality. \(\square\)
</div>

**Geometric interpretation:** Bessel's inequality says that the energy in the Fourier components cannot exceed the total energy of \(f\). The "missing energy" \(\|f\|^2 - \sum_n |c_n|^2 = \|f - S_\infty\|^2 \geq 0\) is the energy in the "orthogonal complement" of the system — it is zero if and only if the system is complete (spans a dense subspace).

## Completeness: Parseval's Identity

The orthonormal system \(\{e^{inx}\}_{n \in \mathbb{Z}}\) is **complete** in \(L^2(\mathbb{T})\) if and only if no non-zero function is orthogonal to all \(e^{inx}\) — equivalently, if \(\hat{f}(n) = 0\) for all \(n \in \mathbb{Z}\), then \(f = 0\) in \(L^2(\mathbb{T})\).

<div class="theorem">
<strong>Theorem (Completeness of the Exponential System).</strong> The system \(\{e^{inx}\}_{n \in \mathbb{Z}}\) is complete in \(L^2(\mathbb{T})\). Equivalently, if \(f \in L^2(\mathbb{T})\) and \(\hat{f}(n) = 0\) for all \(n \in \mathbb{Z}\), then \(f = 0\) a.e.
</div>

<div class="proof">
<strong>Proof (via Fejér's theorem).</strong> Suppose \(\hat{f}(n) = 0\) for all \(n\). The Cesàro means are \(\sigma_N f = K_N * f\), and since \(K_N(x) = \sum_{|n| \leq N-1}(1 - |n|/N)e^{inx}\), we have:

\[
\sigma_N f(x) = \sum_{|n|\leq N-1}\left(1-\frac{|n|}{N}\right)\hat{f}(n)e^{inx} = 0,
\]
since all \(\hat{f}(n) = 0\). On the other hand, for any \(g \in C(\mathbb{T})\), Fejér's theorem gives \(\|K_N * g - g\|_\infty \to 0\). For general \(f \in L^2\) and \(\varepsilon > 0\), choose \(g \in C(\mathbb{T})\) with \(\|f - g\|_2 < \varepsilon\). Then:

\[
\|f\|_2 = \|f - \sigma_N f\|_2 \leq \|f - g\|_2 + \|g - \sigma_N g\|_2 + \|\sigma_N g - \sigma_N f\|_2.
\]
The first term is \(< \varepsilon\). The last term is \(\|\sigma_N(g-f)\|_2 \leq \|K_N\|_1\|g-f\|_2 \leq \varepsilon\) (since \(\|K_N\|_1 = 1\)). The middle term \(\|g - \sigma_N g\|_2 \leq \|g - \sigma_N g\|_\infty \to 0\). So \(\|f\|_2 < 2\varepsilon + o(1)\); since \(\varepsilon\) was arbitrary, \(\|f\|_2 = 0\), so \(f = 0\) a.e. \(\square\)
</div>

<div class="theorem">
<strong>Theorem (Parseval's Identity, full proof).</strong> For \(f \in L^2(\mathbb{T})\),

\[
\|f\|_{L^2(\mathbb{T})}^2 = \frac{1}{2\pi}\int_{-\pi}^\pi |f(x)|^2\,dx = \sum_{n=-\infty}^\infty |\hat{f}(n)|^2.
\]
</div>

<div class="proof">
<strong>Proof.</strong> From the completeness theorem, we know \(S_N f \to f\) in \(L^2\). (Indeed, by Bessel, \(\{S_N f\}\) is Cauchy: \(\|S_M f - S_N f\|_2^2 = \sum_{N < |n| \leq M}|\hat{f}(n)|^2 \to 0\), and its limit must be \(f\) since \(\langle f - \lim S_N f, e_n\rangle = 0\) for all \(n\), forcing the limit to equal \(f\) by completeness.) Now:

\[
\|f\|_2^2 = \langle f, f\rangle = \lim_{N\to\infty}\langle S_N f, f\rangle = \lim_{N\to\infty}\sum_{|n|\leq N}\hat{f}(n)\overline{\langle f, e_n\rangle} \cdot 2\pi
\]
Wait — more cleanly, since \(S_N f \to f\) in \(L^2\):

\[
\|f\|_2^2 = \lim_{N\to\infty}\|S_N f\|_2^2 = \lim_{N\to\infty}\sum_{|n|\leq N}|\hat{f}(n)|^2 = \sum_{n\in\mathbb{Z}}|\hat{f}(n)|^2. \quad\square
\]
</div>

**Polarization:** The inner product version \(\langle f, g\rangle = \sum_n \hat{f}(n)\overline{\hat{g}(n)}\) follows by polarizing: \(4\langle f,g\rangle = \|f+g\|^2 - \|f-g\|^2 + i\|f+ig\|^2 - i\|f-ig\|^2\).

---

# Chapter 18: The Banach–Steinhaus Argument for Divergence

## The Operator Norm of Partial Sums

We have seen that the Dirichlet kernel has \(L^1\) norm \(\|D_N\|_1 \sim \frac{4}{\pi^2}\log N \to \infty\). Let us make precise why this implies the existence of continuous functions with divergent Fourier series.

Define the **evaluation functional** \(L_{N,x_0} : C(\mathbb{T}) \to \mathbb{C}\) by \(L_{N,x_0}(f) = S_N f(x_0) = (f * D_N)(x_0)\). This is a bounded linear functional on \(C(\mathbb{T})\) (with the sup norm), with operator norm:

\[
\|L_{N,x_0}\| = \sup_{\|f\|_\infty \leq 1}|S_N f(x_0)| = \frac{1}{2\pi}\int_{-\pi}^\pi |D_N(x_0 - t)|\,dt = \|D_N\|_{L^1}.
\]
(The equality of the operator norm to \(\|D_N\|_{L^1}\) follows because the supremum is attained by \(f(t) = \text{sgn}(D_N(x_0 - t))\), which one approximates by continuous functions.)

Since \(\|L_{N,x_0}\| = \|D_N\|_1 \to \infty\, \text{ as } N \to \infty\), the Banach–Steinhaus theorem (uniform boundedness principle) applies:

<div class="theorem">
<strong>Theorem (Banach–Steinhaus / Uniform Boundedness Principle).</strong> Let \(X\) be a Banach space and \(\{T_\alpha : X \to Y\}\) a family of bounded linear operators. If \(\sup_\alpha \|T_\alpha x\| < \infty\) for every \(x \in X\), then \(\sup_\alpha \|T_\alpha\| < \infty\).
</div>

The contrapositive: if \(\sup_\alpha \|T_\alpha\| = \infty\), then there exists \(x \in X\) with \(\sup_\alpha \|T_\alpha x\| = \infty\). Applying this to \(T_N = L_{N,0}: C(\mathbb{T}) \to \mathbb{C}\) with \(\|T_N\| = \|D_N\|_1 \to \infty\), we conclude:

<div class="theorem">
<strong>Theorem (du Bois-Reymond, 1873).</strong> There exists a continuous function \(f \in C(\mathbb{T})\) such that the Fourier series \(\sum_{n=-N}^N \hat{f}(n)e^{in\cdot 0}\) diverges as \(N \to \infty\). In fact, the set of continuous functions whose Fourier series diverges at \(x = 0\) is a dense \(G_\delta\) set in \(C(\mathbb{T})\).
</div>

<div class="proof">
<strong>Proof (existence).</strong> Banach–Steinhaus gives existence since \(\|L_{N,0}\| \to \infty\). For the density claim: the set of "good" functions (Fourier series converging at 0) is \(\bigcap_M \bigcup_N \{f : |S_N f(0)| \leq M\}\), which by Baire category is a meager (first-category) set once we show the set \(\{f : |S_N f(0)| \leq M\} \text{ for all } N\) is closed nowhere dense. The "bad" set — whose complement is meager — is therefore a dense \(G_\delta\). \(\square\)
</div>

**Refinement:** By using all points \(x_0 \in \mathbb{T}\) simultaneously, one obtains: there exists \(f \in C(\mathbb{T})\) whose Fourier series diverges on a set of full measure (though du Bois-Reymond only showed divergence at a single point). Carleson's 1966 theorem shows that for \(f \in L^2(\mathbb{T})\), the Fourier series converges almost everywhere — a far deeper result.

**The Lebesgue constants:** The numbers \(L_N = \|D_N\|_{L^1}\) are called **Lebesgue constants**. Their growth rate controls the worst-case behavior of Fourier partial sums. Precisely, for any \(f \in C(\mathbb{T})\):

\[
\|S_N f\|_\infty \leq L_N \|f\|_\infty, \quad \text{but this bound is tight.}
\]
The logarithmic growth \(L_N \sim \frac{4}{\pi^2}\log N\) is the reason partial sums of Fourier series can diverge — but only logarithmically slowly. In practice, for smooth functions, the divergence is overwhelmed by the rapid decay of Fourier coefficients.

---

# Chapter 19: The Gibbs Phenomenon — Detailed Analysis

## Precise Statement and Computation

We now give a complete, rigorous treatment of the Gibbs phenomenon. Consider the square wave:

\[
f(x) = \frac{\pi}{2}\text{sgn}(x) = \begin{cases} \pi/2 & 0 < x < \pi \\ -\pi/2 & -\pi < x < 0 \end{cases}, \quad \text{extended } 2\pi\text{-periodically}.
\]
This normalization (amplitude \(\pi/2\) rather than 1) will make the computation cleaner. Its Fourier series is:

\[
f(x) = \sum_{\substack{n=1 \\ n \text{ odd}}}^\infty \frac{2}{n}\sin(nx) = 2\sin x + \frac{2\sin 3x}{3} + \frac{2\sin 5x}{5} + \cdots
\]
The partial sums are \(S_N f(x) = \sum_{\substack{n=1 \\ n \text{ odd}, n \leq 2N-1}} \frac{2}{n}\sin(nx) = 2\sum_{k=0}^{N-1}\frac{\sin((2k+1)x)}{2k+1}\).

**Locating the maximum of \(S_N f\):** Let us compute \((S_N f)'(x) = 2\sum_{k=0}^{N-1}\cos((2k+1)x)\). Using the product formula:

\[
\cos\theta + \cos 3\theta + \cdots + \cos(2N-1)\theta = \frac{\sin 2N\theta}{2\sin\theta}.
\]
(Proof: multiply by \(2\sin\theta\) and telescope.) So \((S_N f)'(x) = \frac{\sin 2Nx}{\sin x}\). The first critical point in \((0, \pi)\) is at \(x_N = \frac{\pi}{2N}\) (the first zero of \(\sin 2Nx\) after 0).

**Value at the critical point:** We evaluate \(S_N f(x_N)\) as a Riemann sum. Setting \(x_N = \pi/(2N)\):

\[
S_N f(x_N) = 2\sum_{k=0}^{N-1}\frac{\sin((2k+1)\pi/(2N))}{2k+1}.
\]
Let \(t_k = (2k+1)\pi/(2N)\); then the sum is \(\frac{2N}{\pi}\sum_{k=0}^{N-1}\frac{\sin t_k}{t_k}\cdot\frac{\pi}{N} \cdot \frac{1}{1}\). More precisely, this is a Riemann sum for:

\[
\frac{1}{\pi}\cdot 2\cdot\int_0^\pi \frac{\sin t}{t}\,dt \cdot \pi = 2\int_0^\pi \frac{\sin t}{t}\,dt = 2\,\text{Si}(\pi),
\]
where \(\text{Si}(\pi) = \int_0^\pi \frac{\sin t}{t}\,dt \approx 1.8519\). Therefore:

\[
\lim_{N\to\infty} S_N f(x_N) = 2\,\text{Si}(\pi) \approx 2 \times 1.8519 \approx 3.7038\cdots
\]

**The overshoot:** The function \(f\) has value \(\pi/2 \approx 1.5708\) just to the right of the jump at \(x=0\). The partial sum overshoots to approximately \(3.7038/2 \approx 1.852\). Wait — let us recheck. Actually \(S_N f(x_N) \to 2\,\text{Si}(\pi)\); we compare this to \(f(0^+) = \pi/2\):

\[
\text{Overshoot} = \lim_{N\to\infty}S_N f(x_N) - f(0^+) = 2\,\text{Si}(\pi) - \frac{\pi}{2} \approx 3.7038 - 1.5708 \approx 2.133.
\]
Hmm — this depends on the normalization. Let us instead use the standard normalization where \(f = \text{sgn}(x)\) (values \(\pm 1\)) so the jump at 0 has magnitude 2. The Fourier series is \(f(x) \sim \frac{4}{\pi}\sum_{k=0}^\infty \frac{\sin((2k+1)x)}{2k+1}\), and the partial sums satisfy:

\[
\lim_{N\to\infty} S_N f(x_N) = \frac{4}{\pi}\int_0^\pi \frac{\sin t}{t}\,dt = \frac{4}{\pi}\text{Si}(\pi) \approx \frac{4}{\pi}\times 1.8519 \approx 2.3591.
\]
The value of \(f(0^+) = 1\), so the overshoot is \(2.3591 - 1 = 1.3591\) — as a fraction of the **jump** (which has size 2): \(\frac{1.3591}{2} \approx 67.95\%\). That's total overshoot as fraction of the full jump magnitude. But conventionally one reports the overshoot as a fraction of the half-jump from 0 to 1, giving \(\approx 17.9\%\). The Gibbs constant is:

\[
G = \frac{2}{\pi}\text{Si}(\pi) - 1 = \frac{2}{\pi}\int_0^\pi\frac{\sin t}{t}\,dt - 1 \approx \frac{2\times 1.8519}{\pi} - 1 \approx 1.1790 - 1 = 0.1790.
\]
So the overshoot is approximately **\(17.9\%\) of the half-jump** (or equivalently, \(8.9\%\) of the full jump), universally for any function with a jump discontinuity. This constant does not depend on the shape of the function near the discontinuity — only on the magnitude of the jump.

**Why the overshoot persists:** The key insight is that the overshoot does not come from "misadventure" or numerical error. It is an exact consequence of the Riemann sum approximation to \(\int_0^\pi \frac{\sin t}{t}\,dt\), which is a fixed positive number regardless of \(N\). The region of overshoot *shrinks* (width \(\approx \pi/N \to 0\)) but the height remains constant. The Gibbs phenomenon is therefore invisible in \(L^p\) for any \(p < \infty\) (because the overshoot region has vanishing measure), but it is visible in \(L^\infty\) (the max norm).

**Gibbs for general jump discontinuities:** If \(f\) has a jump of size \([f](x_0) = f(x_0^+) - f(x_0^-)\) at \(x_0\), then by the localization principle, \(S_N f\) near \(x_0\) looks like \(S_N g\) where \(g\) is the square wave with the same jump size. Therefore \(S_N f\) overshoots the jump by approximately \(G \cdot [f](x_0) \approx 8.9\%\) of the jump, universally.

**Remedies for Gibbs:** The three main methods to avoid Gibbs are:
1. **Cesàro/Fejér summation:** Averaging partial sums gives \(\sigma_N f\), which converges uniformly on \(\mathbb{T}\) for continuous \(f\). For discontinuous \(f\), \(\sigma_N f\) converges to \([f(x^+)+f(x^-)]/2\) pointwise. The Fejér kernel is non-negative, which prevents overshoot.
2. **Lanczos \(\sigma\)-factors:** Multiply Fourier coefficients by \(\sigma(n/N) = \text{sinc}(n/N)\) before summing. This smooths the cutoff and reduces overshoot by introducing a taper.
3. **Spectral resampling:** In computational methods, use a different basis (wavelets, polynomials) near discontinuities.

---

# Chapter 20: Abel Summability and the Poisson Integral

## Abel Summability: Definition and Basic Properties

Let \(\sum_{n=0}^\infty a_n\) be a series of complex numbers. We say the series is **Abel summable** to \(L\) if:

\[
A\text{-lim}_{r\to 1^-}\sum_{n=0}^\infty a_n r^n = L.
\]
More generally, for the two-sided series \(\sum_{n=-\infty}^\infty a_n\) arising in Fourier analysis, Abel summability means:

\[
A\text{-lim}_{r\to 1^-}\sum_{n=-\infty}^\infty a_n r^{|n|} = L.
\]

<div class="theorem">
<strong>Theorem (Convergent implies Abel summable).</strong> If \(\sum_{n=0}^\infty a_n = L\) (ordinary convergence), then the series is Abel summable to \(L\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(s_N = \sum_{n=0}^N a_n \to L\). The Abel sum is \(A(r) = \sum_{n=0}^\infty a_n r^n = (1-r)\sum_{N=0}^\infty s_N r^N\) (by summation by parts / Abel's summation formula). Since \((1-r)\sum_{N=0}^\infty r^N = 1\), we have \(A(r) - L = (1-r)\sum_{N=0}^\infty (s_N - L)r^N\). Given \(\varepsilon > 0\), choose \(N_0\) such that \(|s_N - L| < \varepsilon\) for \(N > N_0\). Split the sum at \(N_0\) and let \(r \to 1^-\); the tail is bounded by \(\varepsilon\), and the head tends to 0. \(\square\)
</div>

Abel summability is strictly weaker than convergence. The classic example: \(\sum_{n=0}^\infty (-1)^n\) diverges (partial sums alternate 1, 0, 1, 0, ...) but is Abel summable to \(1/2\): \(\sum (-1)^n r^n = \frac{1}{1+r} \to \frac{1}{2}\) as \(r\to 1^-\).

## Fourier Series is Always Abel Summable

<div class="theorem">
<strong>Theorem (Abel Summability of Fourier Series).</strong> Let \(f \in L^1(\mathbb{T})\). Then for any \(x_0 \in \mathbb{T}\) at which \(f\) is continuous:

\[
\lim_{r\to 1^-} \sum_{n=-\infty}^\infty \hat{f}(n)r^{|n|}e^{inx_0} = f(x_0).
\]
</div>

<div class="proof">
<strong>Proof.</strong> The Abel means are \(A_r f(x) = \sum_n \hat{f}(n)r^{|n|}e^{inx} = (f * P_r)(x)\), where \(P_r\) is the Poisson kernel. Since \(\{P_r\}_{0<r<1}\) is a summability kernel (non-negative, normalized, concentrating near 0 as \(r\to 1^-\)), the general convergence theorem for approximate identities gives \((f * P_r)(x_0) \to f(x_0)\) at every continuity point of \(f\). \(\square\)
</div>

This is a remarkable result: **the Fourier series of any \(L^1\) function is always Abel summable to the function value (at continuity points)**. This is much better than ordinary convergence (which can fail even for continuous functions) — Abel summability is robust enough to handle any integrable function.

## The Poisson Integral Revisited

The Poisson integral \(u(r,x) = (f * P_r)(x) = \sum_n \hat{f}(n)r^{|n|}e^{inx}\) solves the **Dirichlet problem for the disk**:

**Problem:** Given a continuous function \(f\) on the unit circle \(\partial\mathbb{D} = \mathbb{T}\), find a harmonic function \(u\) on the open disk \(\mathbb{D}\) that is continuous on \(\bar{\mathbb{D}}\) and satisfies \(u|_{\partial\mathbb{D}} = f\).

**Solution:** The harmonic extension is \(u(re^{ix}) = (f * P_r)(x)\).

**Verification of harmonicity:** Convert to Cartesian coordinates: if \(z = re^{ix} = x_1 + ix_2\), then the Poisson kernel is the real part of the Cayley-type function \(\frac{1+z}{1-z}\). More directly: each term \(\hat{f}(n)r^{|n|}e^{inx}\) is the real part of a monomial \(c_n z^n\) (for \(n \geq 0\)) or its conjugate (for \(n < 0\)), hence harmonic. The sum is harmonic because it converges uniformly for \(r < 1\).

**The maximum principle:** A harmonic function on a bounded domain achieves its maximum and minimum on the boundary. Therefore \(u(re^{ix}) = (f * P_r)(x)\) satisfies:

\[
\min_\mathbb{T} f \leq u(re^{ix}) \leq \max_\mathbb{T} f \quad \text{for all } r < 1.
\]
This is consistent with the non-negativity of \(P_r\): since \(P_r \geq 0\) and \(\int P_r = 1\), convolution with \(P_r\) is a *weighted average* of values of \(f\), necessarily between the min and max of \(f\).

**Uniqueness:** The Dirichlet problem has a unique harmonic solution (by the maximum principle). So the Poisson integral is the *unique* harmonic extension, not just *a* solution.

**Boundary behavior:** For continuous \(f\), \(u(re^{ix}) \to f(e^{ix})\) uniformly as \(r\to 1^-\). For \(f \in L^p(\mathbb{T})\), \(u(r,\cdot) \to f\) in \(L^p\) as \(r\to 1^-\). For general \(f \in L^1(\mathbb{T})\), \(u(r,x) \to f(x)\) for almost every \(x\) (this is the Hardy–Littlewood maximal theorem).

---

# Chapter 21: More Fourier Transform Examples on \(\mathbb{R}\)

## The Rectangle Function and Sinc

<div class="example">
<strong>Example (Rectangle function).</strong> Let \(f = \mathbf{1}_{[-1/2, 1/2]}\), the indicator function of \([-1/2, 1/2]\). Then:

\[
\hat{f}(\xi) = \int_{-1/2}^{1/2} e^{-2\pi ix\xi}\,dx = \left[\frac{e^{-2\pi ix\xi}}{-2\pi i\xi}\right]_{-1/2}^{1/2} = \frac{e^{-\pi i\xi} - e^{\pi i\xi}}{-2\pi i\xi} = \frac{2\sin(\pi\xi)}{2\pi\xi} = \text{sinc}(\xi),
\]
where \(\text{sinc}(\xi) = \frac{\sin(\pi\xi)}{\pi\xi}\) (with \(\text{sinc}(0) = 1\) by continuity).
</div>

This is one of the most important pairs in Fourier analysis. Note that \(\text{sinc} \in L^2(\mathbb{R})\) but \(\text{sinc} \notin L^1(\mathbb{R})\) (since \(\int_0^\infty |\text{sinc}(\xi)|\,d\xi = \sum_{k=0}^\infty \int_k^{k+1}\frac{|\sin\pi\xi|}{\pi\xi}\,d\xi \approx \sum \frac{1}{k} = \infty\)). This illustrates the asymmetry of the Fourier transform on \(L^1\): the transform of an \(L^1\) function need not be in \(L^1\), even though it is bounded.

**The sinc function and sampling:** The sinc function is the **ideal interpolation kernel** for band-limited signals. The Shannon–Nyquist theorem (Chapter 11) says that a function band-limited to \([-B, B]\) can be reconstructed from its samples via sinc interpolation. The choice of sinc is forced: its Fourier transform is \(\mathbf{1}_{[-1/2,1/2]}\) (a perfect low-pass filter), which passes all frequencies in \([-B,B]\) unchanged and kills all others.

**Gibbs for the sinc:** The rectangle function has jump discontinuities at \(\pm 1/2\). If one computes the partial sums of the Fourier series of a rectangle wave (periodic version), one encounters the Gibbs phenomenon. The sinc is the "spectral" representation of this rectangle, and the slow decay of sinc (\(\sim 1/|\xi|\)) is a direct consequence of the jump discontinuity — confirming the general principle: **smoothness in the function \(\leftrightarrow\) rapid decay of the Fourier transform**.

## The Cauchy Distribution

<div class="example">
<strong>Example (Cauchy distribution).</strong> Let \(f(x) = \frac{1}{\pi(1+x^2)}\). This is the probability density of the Cauchy distribution (also known as the Lorentz distribution in physics). We claim \(\hat{f}(\xi) = e^{-2\pi|\xi|}\).
</div>

**Proof by contour integration:** We compute \(\hat{f}(\xi) = \frac{1}{\pi}\int_{-\infty}^\infty \frac{e^{-2\pi ix\xi}}{1+x^2}\,dx\).

The integrand has poles at \(x = \pm i\). For \(\xi > 0\), \(e^{-2\pi ix\xi}\) decays in the lower half-plane (\(\text{Im}(x) < 0\)), so we close the contour below, picking up the residue at \(x = -i\):

\[
\hat{f}(\xi) = \frac{1}{\pi}\cdot(-2\pi i)\cdot \text{Res}_{x=-i}\frac{e^{-2\pi ix\xi}}{1+x^2} = \frac{1}{\pi}\cdot(-2\pi i)\cdot\frac{e^{-2\pi i(-i)\xi}}{-2i} = \frac{1}{\pi}\cdot\pi e^{-2\pi\xi} = e^{-2\pi\xi}.
\]
For \(\xi < 0\), close above and pick up the residue at \(x = +i\): similarly \(\hat{f}(\xi) = e^{2\pi\xi}\). In both cases, \(\hat{f}(\xi) = e^{-2\pi|\xi|}\). \(\square\)

**Significance:** The Cauchy distribution's Fourier transform is \(e^{-2\pi|\xi|}\), which is the Poisson kernel on the upper half-plane! Specifically, \(P_y(\xi) = e^{-2\pi y|\xi|}\) is the Fourier transform of the Poisson kernel \(\frac{1}{\pi}\frac{y}{x^2+y^2}\) for the upper half-plane (\(y > 0\)):

\[
u(x,y) = (f * P_y)(x) = \int_\mathbb{R} f(t)\frac{1}{\pi}\frac{y}{(x-t)^2+y^2}\,dt
\]
solves the Dirichlet problem for the upper half-plane with boundary data \(f\) on \(\mathbb{R}\). This is the exact analogue of the Poisson integral for the disk.

**Characteristic function:** In probability, \(e^{-2\pi|\xi|}\) (with suitable parameterization) is the characteristic function of the Cauchy distribution, confirming that the Cauchy distribution has no finite moments — its characteristic function is not differentiable at \(\xi = 0\).

## The Two-Sided Exponential

<div class="example">
<strong>Example.</strong> Let \(f(x) = e^{-a|x|}\) for \(a > 0\). Then:

\[
\hat{f}(\xi) = \int_{-\infty}^\infty e^{-a|x|}e^{-2\pi ix\xi}\,dx = \int_0^\infty e^{-ax}e^{-2\pi ix\xi}\,dx + \int_{-\infty}^0 e^{ax}e^{-2\pi ix\xi}\,dx.
\]
Computing each integral: \(\int_0^\infty e^{-(a+2\pi i\xi)x}\,dx = \frac{1}{a+2\pi i\xi}\) and \(\int_{-\infty}^0 e^{(a-2\pi i\xi)x}\,dx = \frac{1}{a-2\pi i\xi}\). Therefore:

\[
\hat{f}(\xi) = \frac{1}{a+2\pi i\xi} + \frac{1}{a-2\pi i\xi} = \frac{2a}{a^2 + 4\pi^2\xi^2}.
\]
</div>

This is a Cauchy-type (Lorentzian) function — and indeed, up to normalization, the Fourier transform of a Cauchy distribution is an exponential. The pair \((e^{-a|x|}, \frac{2a}{a^2+4\pi^2\xi^2})\) is dual to the pair \((\frac{a/\pi}{a^2+x^2}, e^{-2\pi a|\xi|})\). Both are manifestations of the same duality: exponential decay in one domain corresponds to Lorentzian (rational) shape in the other.

## Complete Table of Important Pairs

Beyond the examples computed, here are additional important Fourier transform pairs (with convention \(\hat{f}(\xi) = \int f(x)e^{-2\pi ix\xi}\,dx\)):

| \(f(x)\) | \(\hat{f}(\xi)\) | Notes |
|---|---|---|
| \(e^{-\pi x^2}\) | \(e^{-\pi\xi^2}\) | Self-dual Gaussian |
| \(e^{-a\vert x\vert }\), \(a>0\) | \(\frac{2a}{a^2+4\pi^2\xi^2}\) | Two-sided exponential |
| \(\frac{a}{\pi(a^2+x^2)}\) | \(e^{-2\pi a\vert \xi\vert }\) | Cauchy / Lorentzian |
| \(\mathbf{1}_{[-a,a]}\) | \(2a\,\text{sinc}(2a\xi)\) | Rectangle / sinc |
| \(\text{sinc}(x)\) | \(\mathbf{1}_{[-1/2,1/2]}(\xi)\) | Sinc / rectangle |
| \((1 - \vert x/a\vert )^+\) | \(a\,\text{sinc}^2(a\xi)\) | Triangle / sinc² |
| \(\text{sinc}^2(x)\) | \((1-\vert \xi\vert )^+\) | Sinc² / triangle |
| \(H_t(x) = \frac{e^{-x^2/4t}}{\sqrt{4\pi t}}\) | \(e^{-4\pi^2\xi^2 t}\) | Heat kernel |
| \(\delta(x-a)\) | \(e^{-2\pi ia\xi}\) | Shifted Dirac delta |
| \(e^{2\pi iax}\) | \(\delta(\xi-a)\) | Pure tone |
| \(\sum_n \delta(x-n)\) | \(\sum_k \delta(\xi-k)\) | Poisson (Dirac comb) |
| \(\text{p.v.}\frac{1}{\pi x}\) | \(-i\,\text{sgn}(\xi)\) | Hilbert transform kernel |

The last entry — the sinc² / triangle duality — is used in window design for spectral analysis. The Bartlett (triangular) window in the time domain corresponds to squaring the spectrum in the frequency domain, reducing spectral leakage.

---

# Chapter 22: The Heat Equation and Diffusion — Detailed Analysis

## Derivation of the Heat Equation

The heat equation \(u_t = \kappa u_{xx}\) (where \(\kappa > 0\) is the thermal diffusivity) arises from Fourier's law of heat conduction: the heat flux is proportional to the temperature gradient. Let \(u(x,t)\) be the temperature at position \(x\) and time \(t\). The rate of heat flow across a boundary at \(x\) is \(-\kappa u_x(x,t)\) (negative because heat flows from hot to cold). The change in heat in the interval \([a,b]\) is \(\frac{d}{dt}\int_a^b u\,dx = \kappa u_x(b,t) - \kappa u_x(a,t)\). Differentiating with respect to \(b\) gives \(u_t = \kappa u_{xx}\).

## The Fundamental Solution

Setting \(\kappa = 1/4\pi\) (for convenience with the \(2\pi\)-convention Fourier transform) or simply working with \(\kappa = 1\), the Fourier transform of the heat equation \(u_t = u_{xx}\) with initial data \(u(x,0) = f(x)\) is:

\[
\frac{\partial}{\partial t}\hat{u}(\xi,t) = -(2\pi\xi)^2\hat{u}(\xi,t), \quad \hat{u}(\xi,0) = \hat{f}(\xi).
\]
Solving: \(\hat{u}(\xi,t) = \hat{f}(\xi)e^{-4\pi^2\xi^2 t}\). The solution is:

\[
u(x,t) = \int_\mathbb{R} \hat{f}(\xi)e^{-4\pi^2\xi^2 t}e^{2\pi ix\xi}\,d\xi = (f * H_t)(x),
\]
where \(H_t(x) = \frac{1}{\sqrt{4\pi t}}e^{-x^2/(4t)}\) is the **fundamental solution** (heat kernel).

**Properties of the heat kernel:**
1. \(H_t(x) > 0\) for all \(x \in \mathbb{R}\) and \(t > 0\) (instantaneous spreading — no finite propagation speed!).
2. \(\int_\mathbb{R} H_t(x)\,dx = 1\) for all \(t > 0\) (conservation of "total heat").
3. \(H_t \to \delta_0\) as \(t \to 0^+\) in the distributional sense (the initial condition is recovered in the limit).
4. \(H_s * H_t = H_{s+t}\) (the semigroup property: heat flow for time \(s\) followed by time \(t\) equals heat flow for time \(s+t\)).

**Proof of semigroup property:** \(\widehat{H_s * H_t}(\xi) = \hat{H}_s(\xi)\hat{H}_t(\xi) = e^{-4\pi^2\xi^2 s}\cdot e^{-4\pi^2\xi^2 t} = e^{-4\pi^2\xi^2(s+t)} = \hat{H}_{s+t}(\xi)\). \(\square\)

## Why the Heat Equation Smooths

The factor \(e^{-4\pi^2\xi^2 t}\) in the Fourier domain is a Gaussian which decays rapidly for large \(|\xi|\). No matter how rough \(f\) is (even if \(f\) is only in \(L^2\) or \(L^1\)), for any \(t > 0\):

\[
\widehat{u(\cdot,t)}(\xi) = \hat{f}(\xi)e^{-4\pi^2\xi^2 t}.
\]
This is the product of a bounded function (by Riemann–Lebesgue) with a Schwartz function (\(e^{-4\pi^2\xi^2 t} \in \mathcal{S}(\mathbb{R})\) for each fixed \(t > 0\)). Therefore \(\hat{u}(\cdot,t) \in \mathcal{S}(\mathbb{R})\) for any \(t > 0\), which means \(u(\cdot,t) \in \mathcal{S}(\mathbb{R})\) — the solution is instantly in the Schwartz class! In particular, \(u(\cdot,t) \in C^\infty(\mathbb{R})\) and all its derivatives exist and are square-integrable.

**Rate of smoothing:** The derivative \(\frac{\partial^k u}{\partial x^k}(\cdot,t)\) has Fourier transform \((2\pi i\xi)^k\hat{u}(\xi,t) = (2\pi i\xi)^k\hat{f}(\xi)e^{-4\pi^2\xi^2 t}\). Its \(L^2\) norm is:

\[
\left\|\frac{\partial^k u}{\partial x^k}(\cdot,t)\right\|_{L^2}^2 = \int_\mathbb{R} (2\pi\xi)^{2k}|\hat{f}(\xi)|^2 e^{-8\pi^2\xi^2 t}\,d\xi \leq \sup_{\xi}(2\pi\xi)^{2k}e^{-8\pi^2\xi^2 t}\cdot\|f\|_{L^2}^2.
\]
The supremum \(\sup_\xi |\xi|^{2k} e^{-8\pi^2\xi^2 t}\) is attained at \(\xi^* = \sqrt{k/(8\pi^2 t)}\) and equals \(\left(\frac{k}{8\pi^2 t}\right)^k e^{-k}\). So the \(k\)th derivative has size \(\sim t^{-k}\) for small \(t\) — all derivatives exist but blow up as \(t \to 0^+\) if the initial data was rough.

## Connection to Probability and the Central Limit Theorem

The heat kernel \(H_t(x) = \frac{1}{\sqrt{4\pi t}}e^{-x^2/(4t)}\) is (up to scaling) the Gaussian density with mean 0 and variance \(2t\). The semigroup property \(H_s * H_t = H_{s+t}\) corresponds to the fact that the sum of two independent Gaussian random variables is Gaussian (with the variances adding). The heat equation \(u_t = u_{xx}\) is the **Fokker–Planck equation** for Brownian motion: if \(u(x,t)\) represents the probability density of a particle undergoing Brownian motion starting at \(x=0\), then \(u(x,t) = H_t(x)\).

The Central Limit Theorem (CLT) can be understood via the heat equation: the normalized sum \(S_n/\sqrt{n}\) of i.i.d. random variables with mean 0 and variance 1 has characteristic function \(\varphi_{S_n/\sqrt{n}}(t) = \varphi_X(t/\sqrt{n})^n\). For large \(n\), this behaves like \((1 - t^2/(2n))^n \approx e^{-t^2/2}\), the characteristic function of \(N(0,1)\). In the Fourier/PDE language: the CLT says that iterating the convolution \(f * f * \cdots * f\) (\(n\) times) and rescaling gives convergence to the Gaussian — the fixed point of the rescaled heat semigroup.

---

# Chapter 23: Fourier Analysis and Number Theory

## The Poisson Summation Formula — Three Perspectives

The Poisson summation formula \(\sum_{n\in\mathbb{Z}} f(n) = \sum_{k\in\mathbb{Z}}\hat{f}(k)\) is one of the deepest results in all of mathematics, connecting analysis, number theory, and geometry.

**Perspective 1: Periodization.** As proved in Chapter 10, the key step is to periodize \(f\) to get \(F(x) = \sum_n f(x+n)\), compute its Fourier coefficients as values of \(\hat{f}\), and evaluate at \(x=0\). This is the analytic proof.

**Perspective 2: Abstract harmonic analysis.** The formula says that integration over \(\mathbb{Z} \subset \mathbb{R}\) equals integration over \(\hat{\mathbb{Z}} = \mathbb{T} \subset \hat{\mathbb{R}} = \mathbb{R}\). More precisely, the natural map \(\mathbb{R} \to \mathbb{R}/\mathbb{Z} = \mathbb{T}\) induces a "dual map" on Fourier transforms, and the Poisson formula is the precise statement of this duality. This perspective generalizes to all LCA groups: if \(G\) is an LCA group and \(H \subset G\) a closed subgroup, then \(\sum_{h \in H} f(h) = \frac{|\hat{G}|}{|\hat{H}|}\sum_{\xi \in H^\perp} \hat{f}(\xi)\) where \(H^\perp\) is the annihilator of \(H\) in \(\hat{G}\).

**Perspective 3: Number-theoretic applications.** Evaluating the Poisson formula at specific functions produces stunning identities:

**(a) The Jacobi theta function identity** (already seen in Chapter 10):

\[
\theta(t) = \sum_{n\in\mathbb{Z}} e^{-\pi n^2 t} = \frac{1}{\sqrt{t}}\theta(1/t).
\]
This functional equation is the basis of Riemann's proof of the functional equation of \(\zeta(s)\).

**(b) Gauss sums:** Taking \(f(x) = e^{\pi i x^2/N}\) (a chirp function) and applying Poisson summation yields the evaluation of Gauss sums \(G(N) = \sum_{k=0}^{N-1} e^{2\pi ik^2/N}\). It is known that \(|G(N)| = \sqrt{N}\) and the argument of \(G(N)\) depends on \(N \pmod 4\). Gauss himself computed these sums laboriously; Fourier analysis provides a systematic approach.

**(c) Lattice point counting:** For a convex body \(\Omega \subset \mathbb{R}^n\), the number of lattice points \(N(R) = \#\{\mathbf{m} \in \mathbb{Z}^n : \mathbf{m} \in R\Omega\}\) satisfies \(N(R) = R^n \text{Vol}(\Omega) + O(R^{n-1})\) by Poisson summation. The error term \(O(R^{n-1})\) corresponds to contributions from Fourier modes \(\hat{f}(k) = \hat{\mathbf{1}}_{R\Omega}(k)\) for \(k \neq 0\).

For the circle \(\Omega = \{(x,y) : x^2+y^2 \leq 1\}\), this becomes the **Gauss circle problem**: count lattice points in the disk of radius \(R\). The main term is \(\pi R^2\) and the error is \(O(R^\theta)\) for some \(\theta\). Gauss proved \(\theta \leq 1\); the best current bound is \(\theta \leq 131/208 \approx 0.629\); the conjecture is \(\theta = 1/2 + \varepsilon\).

## The Riemann Zeta Function

The Riemann zeta function \(\zeta(s) = \sum_{n=1}^\infty n^{-s}\) (converging for \(\text{Re}(s) > 1\)) is deeply connected to Fourier analysis via the Jacobi theta function.

**Riemann's functional equation:** Define \(\xi(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s)\). Riemann showed in 1859 that \(\xi(s) = \xi(1-s)\) — the zeta function satisfies a functional equation relating \(s\) to \(1-s\). The proof uses the Mellin transform of the theta function:

\[
\xi(s) = \frac{1}{2}\int_0^\infty (\theta(t) - 1)t^{s/2}\frac{dt}{t},
\]
and the functional equation \(\theta(1/t) = \sqrt{t}\,\theta(t)\) of the theta function (a consequence of Poisson summation) gives the functional equation for \(\xi(s)\) after splitting the integral at \(t=1\).

This is one of the most beautiful applications of Fourier analysis (specifically Poisson summation) to number theory: the analytic continuation and functional equation of the Riemann zeta function follow from a two-line computation once the theta function identity is established.

## Analytic Number Theory and L-functions

The Dirichlet \(L\)-functions \(L(s, \chi) = \sum_{n=1}^\infty \chi(n)n^{-s}\) (where \(\chi\) is a Dirichlet character modulo \(q\) — a multiplicative function satisfying \(\chi(n+q) = \chi(n)\)) are generalizations of the Riemann zeta function. Their functional equations and analytic properties similarly follow from Fourier analysis on \(\mathbb{Z}/q\mathbb{Z}\) (the discrete Fourier transform).

Specifically, the **Fourier expansion of \(\chi\)**:

\[
\chi(n) = \frac{1}{\phi(q)}\sum_{a=0}^{q-1}\hat{\chi}(a)e^{2\pi ian/q},
\]
where \(\hat{\chi}(a) = \sum_{n=0}^{q-1}\chi(n)e^{-2\pi ian/q}\) are the DFT coefficients of \(\chi\). The **Gauss sum** is \(\tau(\chi) = \hat{\chi}(1) = \sum_n \chi(n)e^{2\pi in/q}\). The functional equation for \(L(s,\chi)\) involves \(\tau(\chi)\) precisely as the theta function's functional equation involves the Gaussian integral.

This illustrates the unified role of Fourier analysis across all of number theory: the same technique (Poisson summation / functional equations via Fourier methods) applies whether the group is \(\mathbb{R}\), \(\mathbb{T}\), \(\mathbb{Z}/q\mathbb{Z}\), or the adelic groups of modern algebraic number theory.

---

# Chapter 24: Fourier Analysis in Signal Processing

## The Discrete Fourier Transform

In applications, one works with finitely many samples rather than continuous functions. The **Discrete Fourier Transform (DFT)** is the Fourier analysis on the finite group \(\mathbb{Z}/N\mathbb{Z}\).

<div class="definition">
<strong>Definition (DFT).</strong> For a sequence \((x_0, x_1, \ldots, x_{N-1}) \in \mathbb{C}^N\), the DFT is the sequence \((\hat{x}_0, \ldots, \hat{x}_{N-1})\) defined by:

\[
\hat{x}_k = \sum_{n=0}^{N-1} x_n e^{-2\pi ink/N}, \quad k = 0, 1, \ldots, N-1.
\]
The inverse DFT is \(x_n = \frac{1}{N}\sum_{k=0}^{N-1}\hat{x}_k e^{2\pi ink/N}\).
</div>

The DFT is exactly the Fourier transform on the group \(\mathbb{Z}/N\mathbb{Z}\), which is its own Pontryagin dual. The characters of \(\mathbb{Z}/N\mathbb{Z}\) are \(\chi_k(n) = e^{2\pi ink/N}\) for \(k = 0, 1, \ldots, N-1\), and the DFT is the change-of-basis from the standard basis to the character basis.

**Parseval for DFT:** \(\frac{1}{N}\sum_k |\hat{x}_k|^2 = \sum_n |x_n|^2\).

**Convolution theorem for DFT:** \(\widehat{x * y}_k = \hat{x}_k\cdot\hat{y}_k\), where the convolution is cyclic: \((x * y)_n = \sum_{j=0}^{N-1}x_j y_{n-j \pmod N}\).

## The Fast Fourier Transform

Computing the DFT naively requires \(O(N^2)\) operations (for each of the \(N\) output values, sum \(N\) terms). The **Fast Fourier Transform (FFT)**, discovered in its modern form by Cooley and Tukey in 1965 (and known earlier to Gauss in 1805!), reduces this to \(O(N\log N)\) by exploiting the recursive structure of the DFT.

**Cooley–Tukey FFT (radix-2 decimation in time):** Suppose \(N = 2^m\). Split the DFT into even and odd-indexed terms:

\[
\hat{x}_k = \sum_{n=0}^{N/2-1} x_{2n} e^{-2\pi i(2n)k/N} + \sum_{n=0}^{N/2-1} x_{2n+1} e^{-2\pi i(2n+1)k/N}
= X_k^{\text{even}} + e^{-2\pi ik/N}X_k^{\text{odd}},
\]
where \(X^{\text{even}}\) and \(X^{\text{odd}}\) are size-\(N/2\) DFTs of the even- and odd-indexed subsequences. Using periodicity \(X_k^{\text{even/odd}} = X_{k+N/2}^{\text{even/odd}}\), each output pair \((\hat{x}_k, \hat{x}_{k+N/2})\) can be computed from one butterfly operation: \(\hat{x}_k = X_k^{\text{even}} + W^k X_k^{\text{odd}}\) and \(\hat{x}_{k+N/2} = X_k^{\text{even}} - W^k X_k^{\text{odd}}\), where \(W = e^{-2\pi i/N}\) is the primitive \(N\)th root of unity. Applying this recursively gives the \(O(N\log N)\) algorithm.

The FFT is one of the most important algorithms in the history of computation — it enables real-time digital signal processing, audio/video compression (MP3, JPEG use DCT, a cousin of DFT), radar, MRI, and countless other applications.

## The Short-Time Fourier Transform and Spectrograms

The ordinary Fourier transform is global: \(\hat{f}(\xi)\) is determined by the entire function \(f\). For non-stationary signals (speech, music, seismic data, EEG), one needs a *local* frequency analysis.

**Definition:** The **Short-Time Fourier Transform (STFT)** of \(f\) with window function \(g\) is:

\[
\mathcal{V}_g f(x, \xi) = \int_\mathbb{R} f(t)\overline{g(t-x)}e^{-2\pi it\xi}\,dt.
\]
This measures the content of \(f\) near time \(x\) at frequency \(\xi\), using the window \(g\) to localize. If \(g\) is a Gaussian (coherent state), the STFT becomes the **Gabor transform**. The magnitude squared \(|\mathcal{V}_g f(x,\xi)|^2\) is the **spectrogram** — a time-frequency picture of the signal.

**Uncertainty principle for STFT:** By the Heisenberg uncertainty principle, no window can be simultaneously concentrated in both time and frequency. The Gaussian window achieves the optimal balance (minimizing the time-frequency area of the uncertainty ellipse). This is why Gabor chose the Gaussian window in 1946.

**Energy conservation (Parseval for STFT):** \(\iint |\mathcal{V}_g f(x,\xi)|^2\,dx\,d\xi = \|g\|_{L^2}^2\|f\|_{L^2}^2\). The total spectrogram energy equals the product of the signal energy and window energy.

## Applications: MP3 and JPEG

**MP3 (audio compression):** The MP3 algorithm (ISO MPEG Audio Layer 3) uses the Modified Discrete Cosine Transform (MDCT), a windowed variant of the DFT. The MDCT computes a short-time frequency analysis of the audio signal in overlapping windows of length 1152 samples (at 44.1kHz, this is about 26ms). Psychoacoustic masking (the fact that the human ear cannot hear quiet sounds near loud sounds at nearby frequencies) is used to quantize high-energy components with more bits and discard inaudible components. The Huffman coding of the quantized coefficients provides further lossless compression. The mathematical core is Fourier analysis; the compression comes from the sparsity of the frequency representation.

**JPEG (image compression):** JPEG (Joint Photographic Experts Group) applies the Discrete Cosine Transform (DCT) to 8×8 blocks of an image. The DCT is the real part of the DFT of a symmetrized signal; it has better energy concentration properties than the DFT for natural images. High-frequency DCT coefficients (rapid spatial variations) are quantized aggressively (discarded or rounded heavily), while low-frequency components (smooth variations) are preserved. The mathematical basis: natural images tend to have slowly varying regions (low spatial frequencies dominate), so the DCT representation is sparse.

Both applications illustrate the practical power of Fourier analysis: by transforming to the frequency domain, signals become sparse (few large coefficients), enabling compression. The uncertainty principle provides the fundamental limit on this compression.

---

# Chapter 25: Convergence in L^p — The Hilbert Transform Proof

## M. Riesz's Theorem: Strategy

We have stated that for \(1 < p < \infty\), the Fourier partial sums \(S_N f \to f\) in \(L^p(\mathbb{T})\). The proof proceeds via the boundedness of the Hilbert transform. Let us outline the argument in more detail.

**Step 1: Relate \(S_N f\) to the Hilbert transform.** The partial sum \(S_N f = f * D_N\) can be written as:

\[
S_N f(x) = \frac{1}{2\pi}\int_{-\pi}^\pi f(t)D_N(x-t)\,dt.
\]
The Dirichlet kernel \(D_N(x) = \frac{\sin((N+\frac12)x)}{\sin(x/2)}\) can be related to the conjugate Dirichlet kernel and the Hilbert transform as follows. Write:

\[
D_N(x) = \frac{\sin(Nx)\cos(x/2) + \cos(Nx)\sin(x/2)}{\sin(x/2)} = \sin(Nx)\cot(x/2) + \cos(Nx).
\]
The term \(\cos(Nx)\) gives a term in \(S_N f(x)\) that involves the Fourier coefficients of \(f\) directly (converging to \(f\) in \(L^p\) by compactness arguments). The term \(\sin(Nx)\cot(x/2)\) is related to the **conjugate partial sum**:

\[
\tilde{S}_N f(x) = \frac{1}{2\pi}\int_{-\pi}^\pi f(t)\cot\!\left(\frac{x-t}{2}\right)\sin(N(x-t))\,dt,
\]
which is the "Hilbert transform of \(f\) at frequency \(N\)." As \(N \to \infty\), this relates to the conjugate function operator (Hilbert transform on \(\mathbb{T}\)).

**Step 2: Boundedness of the conjugate function operator.** The **conjugate function** of \(f\) is:

\[
\tilde{f}(x) = \lim_{\varepsilon\to 0^+}\frac{-1}{2\pi}\int_{\varepsilon < |t| \leq \pi} f(x-t)\cot\!\left(\frac{t}{2}\right)\,dt.
\]
This is the periodic analogue of the Hilbert transform, with kernel \(\frac{1}{2\pi}\cot(t/2)\) replacing \(\frac{1}{\pi t}\). M. Riesz proved in 1924–1927 that the conjugate function operator \(f \mapsto \tilde{f}\) is bounded on \(L^p(\mathbb{T})\) for \(1 < p < \infty\):

\[
\|\tilde{f}\|_{L^p(\mathbb{T})} \leq C_p \|f\|_{L^p(\mathbb{T})}.
\]

**Step 3: Conclude \(L^p\) convergence.** Once the conjugate function operator is bounded, one shows that \(S_N f(x) = (\text{bounded operator involving } \tilde{f})(x) + \text{terms involving Fourier coefficients}\). The convergence \(S_N f \to f\) in \(L^p\) follows by approximation with trigonometric polynomials (for which convergence is obvious) and the bounded operator.

## The Proof of M. Riesz's Theorem: Key Idea

The original proof of M. Riesz used **complex analysis** (the Phragmén–Lindelöf principle). Modern proofs use the **Calderón–Zygmund decomposition** and interpolation. We sketch the key idea.

**Fourier multiplier approach:** In the frequency domain, the Hilbert transform on \(\mathbb{R}\) is multiplication by \(-i\,\text{sgn}(\xi)\). The boundedness on \(L^2\) is trivial (isometry). For \(L^p\) with \(p \neq 2\), one uses the fact that \(\text{sgn}(\xi)\) is a bounded measurable function, and the Fourier multiplier theorem:

<div class="theorem">
<strong>Theorem (Mikhlin Multiplier Theorem, simplified).</strong> Let \(m : \mathbb{R}\setminus\{0\} \to \mathbb{C}\) satisfy \(|\xi^k\partial_\xi^k m(\xi)| \leq C\) for \(k = 0, 1, \ldots, \lfloor n/2\rfloor + 1\) (in \(\mathbb{R}^n\)). Then the Fourier multiplier \(T_m f = (m\hat{f})^\vee\) is bounded on \(L^p(\mathbb{R}^n)\) for all \(1 < p < \infty\).
</div>

For the Hilbert transform, \(m(\xi) = -i\,\text{sgn}(\xi)\) satisfies \(|m(\xi)| \leq 1\) but does not satisfy the smoothness condition at \(\xi = 0\). The boundedness on \(L^p\) requires the more refined Calderón–Zygmund theory for singular integrals.

**Failure at the endpoints:** The Hilbert transform is not bounded on \(L^1(\mathbb{R})\): if it were, then the conjugate function \(\tilde{f} \in L^1\) whenever \(f \in L^1\), but one can construct \(f \in L^1\) with \(\tilde{f} \notin L^1\) (e.g., \(f = \mathbf{1}_{[0,1]}\): its Hilbert transform is \(\frac{1}{\pi}\log\frac{x}{|x-1|}\), which is not integrable near 0 and 1). Similarly, the Hilbert transform is not bounded on \(L^\infty\): if \(f = \mathbf{1}_{[-1,1]}\), then \(Hf(x) = \frac{1}{\pi}\log\frac{|x+1|}{|x-1|}\), which is unbounded near \(x = \pm 1\).

The endpoint theory uses Hardy spaces (\(H^1\)) and BMO as replacements for \(L^1\) and \(L^\infty\) respectively, as mentioned in Chapter 15.

---

# Chapter 26: Connections to PDEs — Regularity Theory

## Fourier Analysis and Elliptic PDEs

The Fourier transform is the primary tool for understanding regularity of solutions to elliptic PDEs. We illustrate with the Laplacian.

**The Laplacian in frequency space.** For \(f \in \mathcal{S}(\mathbb{R}^n)\), the Fourier transform of \(\Delta f = \sum_j \partial_j^2 f\) is:

\[
\widehat{\Delta f}(\xi) = -(2\pi|\xi|)^2\hat{f}(\xi) = -4\pi^2|\xi|^2\hat{f}(\xi).
\]
The Laplacian is a Fourier multiplier with symbol \(-4\pi^2|\xi|^2\). The operator \((-\Delta)^s\) (fractional Laplacian) has symbol \((4\pi^2|\xi|^2)^s = (2\pi|\xi|)^{2s}\), which makes sense for any \(s \in \mathbb{R}\) — this is the definition of the fractional Laplacian via Fourier analysis.

**Elliptic regularity.** Consider the PDE \(-\Delta u + u = f\) on \(\mathbb{R}^n\). Taking the Fourier transform: \((4\pi^2|\xi|^2 + 1)\hat{u}(\xi) = \hat{f}(\xi)\), giving:

\[
\hat{u}(\xi) = \frac{\hat{f}(\xi)}{1 + 4\pi^2|\xi|^2}.
\]
If \(f \in H^s(\mathbb{R}^n)\), then \((1+|\xi|^2)^{s/2}\hat{f} \in L^2\), and:

\[
(1+|\xi|^2)^{(s+2)/2}\hat{u}(\xi) = (1+|\xi|^2)^{s/2}\hat{f}(\xi)\cdot\frac{(1+|\xi|^2)}{1+4\pi^2|\xi|^2}.
\]
The ratio \(\frac{(1+|\xi|^2)}{1+4\pi^2|\xi|^2}\) is bounded, so \(u \in H^{s+2}(\mathbb{R}^n)\). The solution gains two derivatives over the right-hand side. This is **elliptic regularity**: the Laplacian is an elliptic operator (its symbol \(|\xi|^2\) never vanishes for \(\xi \neq 0\)), and elliptic operators always gain regularity.

**Green's function.** The **fundamental solution** of \(-\Delta + 1\) is the function \(G\) with \((-\Delta + 1)G = \delta\), i.e., \(\hat{G}(\xi) = (1+4\pi^2|\xi|^2)^{-1}\). In one dimension, this is the inverse Fourier transform of \(\frac{1}{1+4\pi^2\xi^2}\), which equals \(\frac{1}{2}e^{-|x|}\) (as computed in Chapter 21: the Fourier transform of \(e^{-a|x|}\) is \(\frac{2a}{a^2+4\pi^2\xi^2}\), so for \(a=1\), \(\mathcal{F}^{-1}(\frac{1}{1+4\pi^2\xi^2}) = \frac{1}{2}e^{-|x|}\)). In higher dimensions, the Green's function involves Bessel functions.

## The Wave Equation and Dispersive PDEs

**Wave equation.** The PDE \(u_{tt} = c^2\Delta u\) has Fourier transform \(\hat{u}_{tt} = -c^2(2\pi|\xi|)^2\hat{u}\), giving \(\hat{u}(\xi,t) = \hat{f}(\xi)\cos(2\pi c|\xi|t) + \hat{g}(\xi)\frac{\sin(2\pi c|\xi|t)}{2\pi c|\xi|}\) (for initial data \(u(\cdot,0) = f\), \(u_t(\cdot,0) = g\)). The multiplier \(e^{\pm 2\pi ic|\xi|t}\) has constant modulus — no decay, only phase shift. This reflects the conservative nature of the wave equation.

**Schrödinger equation.** The Schrödinger equation \(i\partial_t u = -\Delta u\) (setting \(\hbar = 2m = 1\)) has Fourier transform \(i\hat{u}_t = 4\pi^2|\xi|^2\hat{u}\), giving \(\hat{u}(\xi,t) = \hat{f}(\xi)e^{-4\pi^2 i|\xi|^2 t}\). The multiplier \(e^{-4\pi^2i|\xi|^2 t}\) has constant modulus — again conservative (Schrödinger preserves \(L^2\) norm, corresponding to conservation of probability).

The fundamental solution \(e^{-it\Delta}f\) is given by convolution with the **Schrödinger propagator** \(S_t(x) = (4\pi it)^{-n/2}e^{i|x|^2/(4t)}\) (a complex Gaussian). Unlike the heat kernel (\(e^{-it\Delta}\) vs \(e^{-t\Delta}\)), this kernel does not decay and is not in \(L^1\) — the Schrödinger equation does not smooth in the same sense as the heat equation.

**Dispersive estimates.** While the Schrödinger propagator conserves \(L^2\) norm, it does cause dispersive spreading: solutions in \(L^2\) spread out over time, and in \(L^\infty\), \(\|e^{it\Delta}f\|_\infty \leq |4\pi t|^{-n/2}\|f\|_{L^1}\). This "dispersive decay" is proved by the method of stationary phase applied to the oscillatory integral \(\int \hat{f}(\xi)e^{2\pi i(x\cdot\xi - 2\pi|\xi|^2 t)}\,d\xi\).

---

# Chapter 27: Multidimensional Fourier Analysis

## Fourier Transform on \(\mathbb{R}^n\)

The Fourier transform on \(\mathbb{R}^n\) is defined by the same formula:

\[
\hat{f}(\xi) = \int_{\mathbb{R}^n} f(x)e^{-2\pi ix\cdot\xi}\,dx, \quad \xi \in \mathbb{R}^n,
\]
where \(x\cdot\xi = \sum_j x_j\xi_j\) is the inner product. All properties extend:
- **Plancherel:** \(\|\hat{f}\|_{L^2(\mathbb{R}^n)} = \|f\|_{L^2(\mathbb{R}^n)}\).
- **Convolution:** \(\widehat{f*g} = \hat{f}\cdot\hat{g}\) where \((f*g)(x) = \int_{\mathbb{R}^n}f(x-y)g(y)\,dy\).
- **Rotation covariance:** If \(R\) is a rotation matrix, then \(\widehat{f\circ R} = \hat{f}\circ R\).
- **Gaussian is self-dual:** \(\mathcal{F}(e^{-\pi|x|^2}) = e^{-\pi|\xi|^2}\).

**Radial functions:** If \(f(x) = f_0(|x|)\) is radial, then \(\hat{f}(\xi) = \hat{f}_0(|\xi|)\) is also radial, and:

\[
\hat{f}(\xi) = \frac{2\pi}{|\xi|^{(n-2)/2}}\int_0^\infty f_0(r)r^{n/2}J_{(n-2)/2}(2\pi r|\xi|)\,dr,
\]
where \(J_\nu\) is the Bessel function of order \(\nu\). For \(n = 1\), this reduces to the cosine transform (since \(J_{-1/2}(t) = \sqrt{2/\pi t}\cos t\)).

## Fourier Series on the Torus \(\mathbb{T}^n\)

On the \(n\)-dimensional torus \(\mathbb{T}^n = (\mathbb{R}/2\pi\mathbb{Z})^n\), the characters are \(e^{in\cdot x}\) for \(n \in \mathbb{Z}^n\) (multi-index \(n = (n_1, \ldots, n_n)\)). The Fourier series of \(f : \mathbb{T}^n \to \mathbb{C}\) is:

\[
f(x) \sim \sum_{n\in\mathbb{Z}^n} \hat{f}(n)e^{in\cdot x}, \quad \hat{f}(n) = \frac{1}{(2\pi)^n}\int_{\mathbb{T}^n}f(x)e^{-in\cdot x}\,dx.
\]
Parseval: \(\|f\|_{L^2(\mathbb{T}^n)}^2 = \sum_{n\in\mathbb{Z}^n}|\hat{f}(n)|^2\).

**The heat equation on \(\mathbb{T}^n\):** The solution of \(u_t = \Delta u\) with initial data \(f\) on \(\mathbb{T}^n\) is:

\[
u(x,t) = \sum_{n\in\mathbb{Z}^n}\hat{f}(n)e^{-|n|^2 t}e^{in\cdot x},
\]
where \(|n|^2 = n_1^2 + \cdots + n_n^2\). The decay rates are determined by \(|n|^2\), giving immediate smoothing for \(t > 0\).

**Lattice points and number theory:** The number of ways to write an integer \(N\) as a sum of \(n\) squares, \(r_n(N) = \#\{m \in \mathbb{Z}^n : |m|^2 = N\}\), is related to the Fourier analysis of the theta function \(\theta^n(t) = (\sum_m e^{-m^2 t})^n = \sum_{N=0}^\infty r_n(N)e^{-Nt}\). Jacobi's formula \(r_4(N) = 8\sum_{4\nmid d, d|N} d\) follows from the theory of modular forms, which are essentially Fourier analysis on the group \(\text{SL}(2,\mathbb{Z})\backslash\mathbb{H}\).

## Spherical Harmonics

On the sphere \(S^{n-1} \subset \mathbb{R}^n\), the natural analogue of the exponentials \(e^{inx}\) are the **spherical harmonics**: the restrictions to \(S^{n-1}\) of harmonic polynomials. The space \(\mathcal{H}_k\) of spherical harmonics of degree \(k\) consists of polynomials \(p(x)\) of degree \(k\) satisfying \(\Delta p = 0\), restricted to the sphere.

Spherical harmonics form a complete orthogonal system on \(L^2(S^{n-1})\), and any \(f \in L^2(S^{n-1})\) has an expansion \(f = \sum_{k=0}^\infty f_k\) where \(f_k \in \mathcal{H}_k\). This is the spherical harmonic expansion, the analogue of Fourier series on the circle.

For \(n=3\) (the usual sphere \(S^2\) in \(\mathbb{R}^3\)), the spherical harmonics \(Y_l^m(\theta, \phi)\) for \(l = 0, 1, 2, \ldots\) and \(-l \leq m \leq l\) are familiar from quantum mechanics (hydrogen atom wavefunctions). The Laplacian on \(S^2\) has \(Y_l^m\) as eigenfunctions with eigenvalue \(-l(l+1)\). The "size" \(2l+1\) of the \(l\)th eigenspace (one eigenvalue for each \(m\)) reflects the rotational symmetry of the sphere: under the action of \(\text{SO}(3)\), each eigenspace \(\mathcal{H}_l\) is an irreducible representation of dimension \(2l+1\).

---

# Chapter 28: Wavelet Analysis — A Brief Introduction

## Limitations of the Fourier Transform

The Fourier transform decomposes a function into pure frequencies — globally supported sinusoids. This global decomposition is optimal for **stationary** signals (signals whose statistical properties do not change over time) but poorly suited for **non-stationary** signals (signals with transient features, edges, or time-varying frequency content).

**Example:** Consider the function \(f(x) = \sin(10\pi x)\mathbf{1}_{[0,1/2]} + \sin(40\pi x)\mathbf{1}_{[1/2,1]}\), which has frequency 5 Hz for the first half-second and frequency 20 Hz for the second half-second. The Fourier transform \(\hat{f}(\xi)\) will show peaks near \(\pm 5\) and \(\pm 20\), but will not reveal *when* each frequency occurs. The spectrogram (STFT) does better, but is limited by the uncertainty principle: any window that is short in time must be wide in frequency, and vice versa.

Wavelets provide a multi-resolution decomposition that adapts to the local features of the signal.

## The Continuous Wavelet Transform

<div class="definition">
<strong>Definition (Continuous Wavelet Transform).</strong> Let \(\psi \in L^2(\mathbb{R})\) be a **mother wavelet**, satisfying the **admissibility condition**:

\[
C_\psi = \int_\mathbb{R} \frac{|\hat{\psi}(\xi)|^2}{|\xi|}\,d\xi < \infty,
\]
which implies \(\hat{\psi}(0) = 0\) (equivalently, \(\int \psi(x)\,dx = 0\) — the wavelet has zero mean). The <strong>continuous wavelet transform</strong> of \(f \in L^2(\mathbb{R})\) with respect to \(\psi\) is:

\[
Wf(a,b) = \frac{1}{\sqrt{|a|}}\int_\mathbb{R} f(x)\overline{\psi\!\left(\frac{x-b}{a}\right)}\,dx = \langle f, \psi_{a,b}\rangle,
\]
where \(\psi_{a,b}(x) = |a|^{-1/2}\psi((x-b)/a)\) is the wavelet dilated by scale \(a > 0\) and translated to position \(b \in \mathbb{R}\).
</div>

**Interpretation:** \(Wf(a,b)\) measures the content of \(f\) near position \(b\) at scale \(a\). Large \(a\) corresponds to coarse scales (low frequencies), small \(a\) to fine scales (high frequencies). The wavelet transform is a "zoom" that simultaneously resolves both position and scale.

**Energy preservation:** If \(\psi\) satisfies the admissibility condition, then:

\[
\|f\|_{L^2}^2 = \frac{1}{C_\psi}\int_0^\infty\int_{-\infty}^\infty |Wf(a,b)|^2\,\frac{db\,da}{a^2}.
\]
The energy of \(f\) can be read off from its wavelet transform.

## Comparison: Fourier vs. Wavelet

| Property | Fourier Transform | Wavelet Transform |
|---|---|---|
| Basis functions | \(e^{2\pi i\xi x}\) — oscillates everywhere | \(\psi_{a,b}\) — localized in time |
| Resolution | Exact frequency, no time info | Both time and scale info |
| Heisenberg box | Thin (exact \(\xi\)) × infinite (all \(t\)) | Roughly equal time–frequency area |
| Best for | Stationary signals | Non-stationary / transient signals |
| Edge detection | Poor (Gibbs) | Excellent (wavelets detect edges) |
| Parseval analog | Yes (\(\|f\|_2 = \|\hat{f}\|_2\)) | Yes (energy reconstruction) |
| PDE applications | Constant-coeff operators | Variable-coeff operators |

The wavelet transform is the modern complement to the Fourier transform, not a replacement. For stationary signals and PDEs with constant coefficients, the Fourier transform is optimal. For image processing (edges, textures), audio coding (transients), and PDEs with variable coefficients, wavelets offer advantages.

---

# Chapter 29: Harmonic Analysis on Groups — Spronk's Research Area

## The Fourier Algebra and Fourier–Stieltjes Algebra

For a locally compact group \(G\) (possibly non-abelian), the **Fourier algebra** \(A(G)\) and **Fourier–Stieltjes algebra** \(B(G)\) were introduced by Pierre Eymard in 1964. These algebras generalize the spaces of Fourier series and Fourier–Stieltjes transforms to non-abelian groups.

**Definition of \(A(G)\):** The Fourier algebra \(A(G)\) consists of functions of the form \(u(g) = \langle \pi(g)\xi, \eta\rangle\) where \(\pi\) is a unitary representation of \(G\) in the left regular representation \(\lambda\) on \(L^2(G)\), and \(\xi, \eta \in L^2(G)\). For abelian \(G\), \(A(G) = L^1(\hat{G})^\wedge\) under Fourier transform — it is the Fourier transform of \(L^1(\hat{G})\), i.e., the space of Fourier transforms of absolutely integrable functions on the dual group.

**Definition of \(B(G)\):** The Fourier–Stieltjes algebra \(B(G)\) consists of all "matrix coefficients" \(u(g) = \langle\pi(g)\xi,\eta\rangle\) for all unitary representations \(\pi\) of \(G\). For abelian \(G\), \(B(G)\) is the Fourier transform of \(M(\hat{G})\) (all finite Borel measures on \(\hat{G}\)) — i.e., the algebra of Fourier–Stieltjes transforms.

**The inclusion:** \(A(G) \subset B(G) \subset C_b(G)\) (bounded continuous functions). For compact \(G\), \(A(G) = B(G)\) since all representations are direct sums of finite-dimensional ones.

**Connection to amenability:** The group \(G\) is **amenable** (admits an invariant mean on \(L^\infty(G)\)) if and only if there exists a bounded approximate identity in \(A(G)\) — a sequence \(u_n \in A(G)\) with \(\|u_n\|_{A(G)} \leq C\) and \(u_n(g) \to 1\) for all \(g \in G\). This characterization (Leptin's theorem) connects harmonic analysis on groups to group-theoretic properties. Abelian groups and compact groups are amenable; non-amenable groups include free groups and \(\text{SL}(2,\mathbb{R})\).

## Schur Multipliers and Completely Bounded Maps

A **Schur multiplier** on \(B(\mathcal{H})\) (bounded operators on a Hilbert space \(\mathcal{H}\)) is an operator of the form \(T \mapsto \phi \cdot T\) where \(\phi\) is a function on the "index set" of operators. These arise naturally in harmonic analysis as the Fourier side of convolution operators.

A linear map \(T: A \to B\) between operator spaces is **completely bounded** if the amplifications \(T \otimes \text{Id}_{M_n}: A \otimes M_n \to B \otimes M_n\) are bounded uniformly in \(n\). The completely bounded norm \(\|T\|_{cb}\) is the supremum over all \(n\). Completely bounded maps are the "right" morphisms in operator space theory (quantum functional analysis).

**Connection to Fourier analysis:** For a locally compact group \(G\), the space of completely bounded Fourier multipliers — functions \(\varphi: G \to \mathbb{C}\) such that \(f \mapsto \varphi f\) is a completely bounded operator on \(A(G)\) — is denoted \(M_{cb}A(G)\). It is an algebra under pointwise multiplication, containing \(B(G)\). Understanding \(M_{cb}A(G)\) is related to deep questions about the operator space structure of \(A(G)\) and has connections to quantum groups and approximation properties.

This is the area of Prof. Spronk's research: understanding the structure of Fourier and Fourier–Stieltjes algebras, their duality, and their operator space properties for various locally compact groups.

---

# Chapter 30: Problem Sets and Exercises

## Chapter 1 Exercises

<div class="example">
<strong>Exercise 1.1.</strong> Compute the Fourier series of \(f(x) = \cos^2(x)\) on \([-\pi,\pi]\). (Hint: use the identity \(\cos^2(x) = \frac{1+\cos 2x}{2}\) and compare with the definition of Fourier series.)

<strong>Solution:</strong> The function \(\cos^2(x) = \frac{1}{2} + \frac{1}{2}\cos 2x = \frac{1}{2} + \frac{1}{4}(e^{2ix} + e^{-2ix})\). By inspection (or by direct computation), the Fourier coefficients are: \(\hat{f}(0) = 1/2\), \(\hat{f}(2) = \hat{f}(-2) = 1/4\), and \(\hat{f}(n) = 0\) for all other \(n\). This is a finite Fourier series (a trigonometric polynomial), so it is trivially its own Fourier series with exact convergence.
</div>

<div class="example">
<strong>Exercise 1.2.</strong> Show that if \(f \in L^1(\mathbb{T})\) is real-valued and even (\(f(-x) = f(x)\)), then \(\hat{f}(n) = \hat{f}(-n) \in \mathbb{R}\) for all \(n \in \mathbb{Z}\). What is the analogous statement for odd functions?

<strong>Solution:</strong> If \(f\) is real, then \(\overline{\hat{f}(n)} = \frac{1}{2\pi}\int\overline{f(x)e^{-inx}}\,dx = \frac{1}{2\pi}\int f(x)e^{inx}\,dx = \hat{f}(-n)\). If additionally \(f\) is even, then the substitution \(x \to -x\) gives \(\hat{f}(n) = \hat{f}(-n)\) (since \(f(-x) = f(x)\) and \(e^{-in(-x)} = e^{inx}\)). Combined: \(\hat{f}(n) = \overline{\hat{f}(n)}\), so \(\hat{f}(n) \in \mathbb{R}\). For odd real \(f\): \(\hat{f}(n) = -\hat{f}(-n) = -\overline{\hat{f}(n)}\), so \(\hat{f}(n)\) is purely imaginary.
</div>

<div class="example">
<strong>Exercise 1.3.</strong> Prove that if \(f, g \in L^2(\mathbb{T})\) and \(\hat{f}(n) = \hat{g}(n)\) for all \(n\), then \(f = g\) a.e. (Uniqueness theorem for Fourier series.)

<strong>Solution:</strong> By linearity, \(h = f - g \in L^2(\mathbb{T})\) has \(\hat{h}(n) = 0\) for all \(n\). By Parseval, \(\|h\|_{L^2}^2 = \sum_n|\hat{h}(n)|^2 = 0\), so \(h = 0\) a.e.
</div>

<div class="example">
<strong>Exercise 1.4 (Basel problem via different Fourier series).</strong> Compute the Fourier series of \(f(x) = (\pi - x)/2\) on \((0, 2\pi)\) and use it to derive \(\sum_{n=1}^\infty \frac{1}{n^2} = \frac{\pi^2}{6}\).

<strong>Solution:</strong> The function \(f(x) = (\pi-x)/2\) for \(x \in (0,2\pi)\) has Fourier coefficients (computing from the definition on \([0,2\pi]\) with measure \(dx/(2\pi)\)): \(\hat{f}(0) = \frac{1}{2\pi}\int_0^{2\pi}\frac{\pi-x}{2}\,dx = 0\), and for \(n \neq 0\): \(\hat{f}(n) = \frac{1}{2\pi}\int_0^{2\pi}\frac{\pi-x}{2}e^{-inx}\,dx = \frac{1}{2in}\) (by integration by parts). So \(f(x) \sim \sum_{n\neq 0}\frac{1}{2in}e^{inx} = \sum_{n=1}^\infty\frac{\sin(nx)}{n}\). Applying Parseval: \(\|f\|_2^2 = \frac{1}{2\pi}\int_0^{2\pi}\frac{(\pi-x)^2}{4}\,dx = \frac{\pi^2}{12}\). Also \(\sum_n|\hat{f}(n)|^2 = 2\sum_{n=1}^\infty\frac{1}{4n^2} = \frac{1}{2}\sum\frac{1}{n^2}\). Equating: \(\frac{\pi^2}{12} = \frac{1}{2}\sum\frac{1}{n^2}\), giving \(\sum\frac{1}{n^2} = \frac{\pi^2}{6}\).
</div>

## Chapter 2–3 Exercises

<div class="example">
<strong>Exercise 2.1.</strong> Let \(K_N\) be the Fejér kernel. Show directly (without using the closed form) that \(\hat{K}_N(n) = 1 - |n|/N\) for \(|n| \leq N-1\) and \(\hat{K}_N(n) = 0\) for \(|n| \geq N\). What does this imply about the convergence of \(\sigma_N f\) in \(L^2\)?

<strong>Solution:</strong> \(K_N = \frac{1}{N}\sum_{k=0}^{N-1}D_k\). The Fourier coefficient \(\hat{K}_N(n) = \frac{1}{N}\sum_{k=0}^{N-1}\hat{D}_k(n)\). Since \(\hat{D}_k(n) = \mathbf{1}_{|n|\leq k}\), we get \(\hat{K}_N(n) = \frac{1}{N}\#\{k : |n| \leq k \leq N-1\} = \frac{N-|n|}{N} = 1-|n|/N\) for \(|n| \leq N-1\), and 0 otherwise. For \(f \in L^2\): \(\sigma_N f = f * K_N\) has Fourier coefficients \(\hat{\sigma_N f}(n) = (1-|n|/N)\hat{f}(n)\). In \(L^2\) norm: \(\|f - \sigma_N f\|_2^2 = \sum_n |\hat{f}(n)|^2|1 - (1-|n|/N)|^2 = \sum_{|n|<N}\frac{n^2}{N^2}|\hat{f}(n)|^2 + \sum_{|n|\geq N}|\hat{f}(n)|^2 \to 0\) by Parseval (the first sum \(\leq \sum_{|n|<N}|\hat{f}(n)|^2\to 0\) since the weights \(\to 0\), and the second sum \(\to 0\) since \(\{|\hat{f}(n)|^2\}\) is summable).
</div>

<div class="example">
<strong>Exercise 3.1 (Dini implies Dirichlet).</strong> Show that the Dini condition is satisfied (with \(s = f(x_0)\)) whenever \(f\) is Hölder continuous at \(x_0\): \(|f(x_0 + t) - f(x_0)| \leq C|t|^\alpha\) for some \(\alpha > 0\).

<strong>Solution:</strong> The Dini condition requires integrability of \(\frac{f(x_0+t)+f(x_0-t)-2f(x_0)}{t}\) near 0. We have:

\[
|f(x_0+t)+f(x_0-t)-2f(x_0)| \leq |f(x_0+t)-f(x_0)| + |f(x_0-t)-f(x_0)| \leq 2C|t|^\alpha.
\]
So the integrand is bounded by \(2C|t|^{\alpha-1}\), which is integrable near 0 for \(\alpha > 0\).
</div>

## Chapter 7 Exercises

<div class="example">
<strong>Exercise 7.1.</strong> Compute the Fourier transform of \(f(x) = xe^{-a|x|}\) for \(a > 0\).

<strong>Solution:</strong> Write \(f(x) = xe^{-a|x|} = x e^{-ax}\mathbf{1}_{x\geq 0} + xe^{ax}\mathbf{1}_{x<0}\). Using the formula \(\widehat{xf} = \frac{i}{2\pi}\hat{f}'\) (differentiation in frequency corresponds to multiplication by \(ix/(2\pi)\) in the Fourier domain — or more precisely, \(\widehat{xf}(\xi) = \frac{1}{-2\pi i}\frac{d}{d\xi}\hat{f}(\xi)\)): since \(\widehat{e^{-a|x|}}(\xi) = \frac{2a}{a^2+4\pi^2\xi^2}\), we have:

\[
\hat{f}(\xi) = \frac{i}{2\pi}\frac{d}{d\xi}\frac{2a}{a^2+4\pi^2\xi^2} = \frac{i}{2\pi}\cdot\frac{-16\pi^2 a\xi}{(a^2+4\pi^2\xi^2)^2} = \frac{-8\pi i a\xi}{(a^2+4\pi^2\xi^2)^2}.
\]
This is a purely imaginary, odd function of \(\xi\), consistent with \(f\) being real and odd.
</div>

<div class="example">
<strong>Exercise 7.2 (Plancherel from Parseval).</strong> Prove that \(\|\hat{f}\|_{L^2(\mathbb{R})} = \|f\|_{L^2(\mathbb{R})}\) for \(f \in \mathcal{S}(\mathbb{R})\), using only the inversion formula and basic properties of the Fourier transform.

<strong>Solution:</strong> By the inversion formula and the formula for the inner product: \(\|f\|_2^2 = \int f(x)\overline{f(x)}\,dx = \int f(x)\overline{\int\hat{f}(\xi)e^{2\pi ix\xi}\,d\xi}\,dx = \int\hat{f}(\xi)\overline{\int\overline{f(x)}e^{2\pi ix\xi}\,dx}\,d\xi\). The inner integral is \(\widehat{\bar{f}}(-\xi) = \overline{\hat{f}(\xi)}\) (since \(\widehat{\bar{f}}(\xi) = \overline{\hat{f}(-\xi)}\)). So \(\|f\|_2^2 = \int\hat{f}(\xi)\overline{\hat{f}(\xi)}\,d\xi = \|\hat{f}\|_2^2\). \(\square\)
</div>

---

# Additional Remarks: Connections and Open Problems

## The Carleson–Hunt Theorem

The most technically difficult result in all of classical Fourier analysis is Carleson's theorem (1966), proved by Lennart Carleson and extended by Richard Hunt:

<div class="theorem">
<strong>Theorem (Carleson–Hunt, 1966–1968).</strong> For \(f \in L^p(\mathbb{T})\) with \(p > 1\), the Fourier series of \(f\) converges almost everywhere: \(S_N f(x) \to f(x)\) for a.e. \(x \in \mathbb{T}\).
</div>

The proof is extraordinarily involved, using a sophisticated combinatorial decomposition of the time-frequency plane. Carleson was awarded the Abel Prize in 2006 partly for this result. The key idea is a new kind of maximal estimate for the **Carleson operator** \(C^*f(x) = \sup_N |S_N f(x)|\), showing that \(\|C^*f\|_{L^2} \leq C\|f\|_{L^2}\). This maximal estimate is fundamentally different from the classical maximal theorems (Hardy–Littlewood) because the Carleson operator involves a variable frequency cutoff.

The theorem is sharp: for \(p = 1\), Kolmogorov's example shows everywhere-divergent Fourier series exist (see Chapter 3). The threshold between \(p=1\) (divergence possible) and \(p > 1\) (a.e. convergence) is one of the most striking features of Fourier analysis.

## Restriction Theorems and the Kakeya Problem

A **Fourier restriction problem** asks: for which surfaces \(S \subset \hat{\mathbb{R}}^n\) is it true that \(\hat{f}|_S \in L^q(S)\) for all \(f \in L^p(\mathbb{R}^n)\)? The prototypical case is restriction to the sphere \(S^{n-1}\).

The **Stein–Tomas restriction theorem** (1975–1978) gives the restriction estimate \(\|\hat{f}|_{S^{n-1}}\|_{L^2(S^{n-1})} \leq C\|f\|_{L^p(\mathbb{R}^n)}\) for \(p \leq \frac{2(n+1)}{n+3}\). This has applications to PDEs (solutions of the wave and Schrödinger equations live on characteristic hypersurfaces in frequency space), harmonic analysis, and combinatorics.

The **Kakeya problem** (Kakeya needle problem): what is the minimum-dimension set in \(\mathbb{R}^n\) that contains a unit line segment in every direction? The answer is: the set must have Hausdorff dimension \(n\) (proved in \(\mathbb{R}^2\) by Besicovitch; the higher-dimensional case is open!). The Kakeya problem is connected to the restriction theorem via the geometry of wave packets, and both are connected to deep questions about the distribution of lattice points and the behavior of exponential sums.

These are among the central open problems in harmonic analysis — active research areas where the techniques of this course (Fourier analysis, Hilbert space theory, interpolation, singular integrals) are indispensable tools.

## Quantum Groups and Non-Commutative \(L^p\) Spaces

The abstract harmonic analysis of Chapter 13 (Pontryagin duality, Fourier algebras) has a quantum generalization. A **quantum group** is a non-commutative analogue of a locally compact group, formalized as a co-algebra with a compatible Hopf structure. The Fourier transform for quantum groups takes values in non-commutative \(L^p\) spaces (spaces of operators on a Hilbert space with a trace-based norm).

Professor Spronk's research includes the study of Fourier and Fourier–Stieltjes algebras for locally compact groups with quantum group structure, the complete bounded multipliers \(M_{cb}A(G)\), and the connections between operator space theory, approximation properties of groups, and harmonic analysis. These are active areas connecting functional analysis, representation theory, and operator algebras.

---

*End of PMATH 454 course notes. These notes cover Chapters 1–15 plus supplementary material in Chapters 16–30. For the original course material, see Katznelson's "Introduction to Harmonic Analysis" (primary text) and Stein–Shakarchi "Fourier Analysis: An Introduction" (supplementary). For abstract harmonic analysis on groups, see Folland "A Course in Abstract Harmonic Analysis" and Hewitt–Ross "Abstract Harmonic Analysis" (Vols. I–II).*

---

# Chapter 31: Wiener's General Tauberian Theory

## The Wiener Algebra \(A(\mathbb{R})\)

The **Wiener algebra** \(A(\mathbb{R})\) consists of all functions \(f : \mathbb{R} \to \mathbb{C}\) whose Fourier transform is in \(L^1(\mathbb{R})\):

\[
A(\mathbb{R}) = \{f \in C_0(\mathbb{R}) : \hat{f} \in L^1(\mathbb{R})\},
\]
with norm \(\|f\|_A = \|\hat{f}\|_{L^1(\mathbb{R})}\). This is a Banach algebra under pointwise multiplication (since \(\widehat{fg} = \hat{f} * \hat{g}\) and \(\|\hat{f}*\hat{g}\|_1 \leq \|\hat{f}\|_1\|\hat{g}\|_1\) by Young's inequality).

The Wiener algebra is the Fourier transform of \(L^1(\mathbb{R})\). By the Riemann–Lebesgue lemma, \(A(\mathbb{R}) \subset C_0(\mathbb{R})\) (continuous functions vanishing at infinity). The inclusion is strict: not every function in \(C_0(\mathbb{R})\) belongs to \(A(\mathbb{R})\) (e.g., functions that are not smooth enough, like the function \(f(x) = |x|^{-1/2}\mathbf{1}_{|x|\leq 1}\) near 0 whose Fourier transform does not decay integrably).

**The Gelfand theory of \(A(\mathbb{R})\):** The maximal ideal space (Gelfand spectrum) of the commutative Banach algebra \(A(\mathbb{R})\) is \(\mathbb{R}\) itself: the maximal ideals are \(\mathfrak{m}_\xi = \{f \in A(\mathbb{R}) : \hat{f}(\xi) = 0\}\) for each \(\xi \in \mathbb{R}\). The Gelfand transform coincides with the Fourier transform. This is Gelfand's perspective: Fourier analysis is the spectral theory of the Banach algebra \(L^1(\mathbb{R})\).

## Wiener's Theorem on Invertibility in \(A(\mathbb{R})\)

Wiener proved a fundamental result about when functions in \(A(\mathbb{R})\) are invertible:

<div class="theorem">
<strong>Theorem (Wiener's Theorem on the Wiener Algebra).</strong> If \(f \in A(\mathbb{R})\) and \(f(\xi) \neq 0\) for all \(\xi \in \mathbb{R}\), then \(1/f \in A(\mathbb{R})\).
</div>

In other words: if \(f\) is in the Wiener algebra and has no zeros, then its reciprocal is also in the Wiener algebra. This is an extraordinarily non-obvious result: knowing that \(\hat{f} \in L^1(\mathbb{R})\) and that \(f\) is nowhere zero does not obviously imply that \(\widehat{(1/f)} \in L^1(\mathbb{R})\).

**Proof via Gelfand theory:** In the Gelfand theory of commutative Banach algebras, an element \(f\) is invertible in the algebra if and only if \(\hat{f}(\xi) \neq 0\) for all \(\xi\) in the maximal ideal space. Since the maximal ideal space of \(A(\mathbb{R})\) is \(\mathbb{R}\) (identified via the Fourier transform), the condition "\(f(\xi) \neq 0\) for all \(\xi \in \mathbb{R}\)" means exactly that \(f\) corresponds to an invertible element. Therefore \(f\) is invertible in \(A(\mathbb{R})\), i.e., \(1/f \in A(\mathbb{R})\). This is Gelfand theory at its most elegant: a deep analytic theorem (invertibility in \(A(\mathbb{R})\)) reduces to an algebraic condition. \(\square\)

## The General Tauberian Theorem

<div class="theorem">
<strong>Theorem (Wiener's General Tauberian Theorem).</strong> Let \(f \in L^1(\mathbb{R})\) and suppose \(\hat{f}(\xi) \neq 0\) for all \(\xi \in \mathbb{R}\) (the "non-vanishing spectrum" condition). Let \(\mu\) be a bounded measure on \(\mathbb{R}\). If

\[
\lim_{t \to +\infty} (f * \mu)(t) = c \int_\mathbb{R} f\,dx,
\]
then for every \(g \in L^1(\mathbb{R})\):

\[
\lim_{t \to +\infty} (g * \mu)(t) = c \int_\mathbb{R} g\,dx.
\]
</div>

**Interpretation:** The hypothesis says that when "averaged" against \(\mu\) at large times, the function \(f\) "converges" to its average value times \(c\). The conclusion says that *every* \(g \in L^1(\mathbb{R})\) behaves the same way — because \(f\) has non-vanishing spectrum, its translates span a dense subset of \(L^1(\mathbb{R})\), so the behavior of \(\mu\) on \(f\) determines its behavior on everything.

**Application: The Prime Number Theorem.** Wiener's tauberian theorem is used in one proof of the Prime Number Theorem (PNT): \(\pi(x) \sim x/\log x\). The key step is relating the counting function \(\pi(x)\) to the Riemann zeta function \(\zeta(s)\) via a Mellin transform, and then using the fact that \(\zeta(1+it) \neq 0\) for all real \(t\) (non-vanishing on the line \(\text{Re}(s) = 1\)) as the "non-vanishing spectrum" condition. The tauberian theorem converts this frequency-domain non-vanishing into the asymptotic density statement of the PNT.

---

# Chapter 32: Maximal Functions and the Hardy–Littlewood Theorem

## The Hardy–Littlewood Maximal Function

A fundamental tool in harmonic analysis, discovered by G.H. Hardy and J.E. Littlewood in 1930, is the **maximal function**.

<div class="definition">
<strong>Definition (Hardy–Littlewood Maximal Function).</strong> For \(f \in L^1_{\text{loc}}(\mathbb{R}^n)\), the <strong>Hardy–Littlewood maximal function</strong> is:

\[
(Mf)(x) = \sup_{r > 0} \frac{1}{|B(x,r)|}\int_{B(x,r)} |f(y)|\,dy,
\]
where \(B(x,r)\) is the ball of radius \(r\) centered at \(x\) and \(|B(x,r)|\) is its volume.
</div>

Intuitively, \(Mf(x)\) is the largest average of \(|f|\) over any ball centered at \(x\). It controls the "worst-case" local average behavior of \(|f|\).

<div class="theorem">
<strong>Theorem (Hardy–Littlewood Maximal Theorem).</strong>
<ol>
<li><strong>Weak-type (1,1):</strong> There is a constant \(C_n > 0\) such that for all \(f \in L^1(\mathbb{R}^n)\) and \(\lambda > 0\):

\[
|\{x : Mf(x) > \lambda\}| \leq \frac{C_n}{\lambda}\|f\|_{L^1(\mathbb{R}^n)}.
\]
</li>
<li><strong>\(L^p\) boundedness (\(p > 1\)):</strong> For \(1 < p \leq \infty\), there is a constant \(C_{n,p}\) such that \(\|Mf\|_{L^p} \leq C_{n,p}\|f\|_{L^p}\).
</li>
</ol>
</div>

The weak-type (1,1) estimate is proved using the **Vitali covering lemma**: if a collection of balls covers a measurable set, one can extract a disjoint subcollection covering at least \(1/3^n\) of the set. This geometric fact is then used to control the measure of the super-level set \(\{Mf > \lambda\}\).

**Why is the maximal function useful?** The maximal function controls the behavior of approximate identities: if \(\phi_\varepsilon(x) = \varepsilon^{-n}\phi(x/\varepsilon)\) is an approximate identity with \(|\phi(x)| \leq C(1+|x|)^{-(n+1)}\), then \(|(f * \phi_\varepsilon)(x)| \leq C \cdot Mf(x)\) for all \(\varepsilon > 0\). The maximal theorem then implies that \(f * \phi_\varepsilon \to f\) a.e. as \(\varepsilon \to 0^+\) for any \(f \in L^1_{\text{loc}}\) — this is the **Lebesgue differentiation theorem** in disguise.

**Lebesgue differentiation theorem:** For \(f \in L^1_{\text{loc}}(\mathbb{R}^n)\),

\[
\lim_{r\to 0^+}\frac{1}{|B(x,r)|}\int_{B(x,r)}f(y)\,dy = f(x) \quad \text{for a.e. } x.
\]
This follows from the maximal theorem: the set where the limit fails has measure zero, controlled by \(\{Mf > \lambda\}\).

## Pointwise Convergence of Poisson Integrals

As an application of the Hardy–Littlewood maximal theorem to Fourier analysis:

<div class="theorem">
<strong>Theorem (Pointwise convergence of Poisson integrals).</strong> For \(f \in L^p(\mathbb{T})\) with \(1 \leq p < \infty\), the Poisson integral \(u(r,x) = (f * P_r)(x) \to f(x)\) as \(r \to 1^-\), for almost every \(x \in \mathbb{T}\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The key estimate is \(\sup_{0<r<1}|u(r,x)| \leq C \cdot Mf(x)\) (the Poisson maximal function is controlled by the Hardy–Littlewood maximal function). Since \(Mf \in L^p\) for \(p > 1\) and is in weak \(L^1\) for \(p=1\), the set where \(\sup_r|u(r,x)| = \infty\) has measure zero. Combined with the dense set of continuous functions (for which convergence is uniform), a standard approximation argument gives a.e. convergence. \(\square\)
</div>

This theorem guarantees that the harmonic extension \(u(re^{ix}) = (f * P_r)(x)\) has radial limits almost everywhere, even for merely \(L^1\) boundary data. In complex analysis terms: a function analytic in the disk with \(L^1\) boundary values (a function in the **Hardy space** \(H^1(\mathbb{D})\)) has radial limits a.e.

---

# Chapter 33: The Fourier Transform as a Unitary Operator — Spectral Theory

## Spectral Decomposition of \(\mathcal{F}\)

The Fourier transform \(\mathcal{F} : L^2(\mathbb{R}) \to L^2(\mathbb{R})\) is a unitary operator. Its spectrum and spectral decomposition can be completely described.

**Eigenvalues of \(\mathcal{F}\):** Since \(\mathcal{F}^4 = \text{Id}\) (applying the Fourier transform four times returns to the original function: \(\mathcal{F}^2 f(x) = f(-x)\), \(\mathcal{F}^4 f(x) = f(x)\)), the eigenvalues of \(\mathcal{F}\) must satisfy \(\lambda^4 = 1\). The possible eigenvalues are \(\lambda \in \{1, -1, i, -i\}\).

**Hermite functions as eigenfunctions:** The **Hermite functions** are:

\[
h_n(x) = (-1)^n e^{\pi x^2} \frac{d^n}{dx^n}(e^{-2\pi x^2}) = 2^{1/4}H_n(\sqrt{2\pi}\, x)e^{-\pi x^2},
\]
where \(H_n\) is the \(n\)th Hermite polynomial (with appropriate normalization). These are eigenfunctions of \(\mathcal{F}\):

\[
\mathcal{F}(h_n) = (-i)^n h_n.
\]
For \(n = 0\): \(\mathcal{F}(h_0) = h_0\) (eigenvalue 1) — the Gaussian is its own Fourier transform.
For \(n = 1\): \(\mathcal{F}(h_1) = -i\, h_1\) (eigenvalue \(-i\)).
For \(n = 2\): \(\mathcal{F}(h_2) = -h_2\) (eigenvalue \(-1\)).
For \(n = 3\): \(\mathcal{F}(h_3) = i\, h_3\) (eigenvalue \(i\)).
For \(n = 4\): \(\mathcal{F}(h_4) = h_4\) (eigenvalue 1 again), and so on with period 4.

The Hermite functions form a complete orthonormal basis of \(L^2(\mathbb{R})\) (proved via the theory of the harmonic oscillator \(H = -\frac{d^2}{dx^2} + 4\pi^2 x^2\), whose eigenfunctions are the Hermite functions). Therefore:

**Spectral decomposition of \(\mathcal{F}\):** Let \(V_k = \overline{\text{span}}\{h_n : n \equiv k \pmod 4\}\) for \(k \in \{0,1,2,3\}\). Then \(L^2(\mathbb{R}) = V_0 \oplus V_1 \oplus V_2 \oplus V_3\) (orthogonal direct sum), and \(\mathcal{F}\) acts on each \(V_k\) as multiplication by \((-i)^k\). The eigenspaces are:
- \(V_0\): eigenvalue 1 (Fourier-invariant functions).
- \(V_1\): eigenvalue \(-i\).
- \(V_2\): eigenvalue \(-1\) (Fourier-anti-invariant: \(\hat{f} = -f\), e.g., \(h_2(x) \propto (4\pi x^2 - 1)e^{-\pi x^2}\)).
- \(V_3\): eigenvalue \(i\).

**The order-4 property:** \(\mathcal{F}^4 = \text{Id}\) means the Fourier transform is a unitary operator of order 4. This can be thought of as the Fourier transform generating a \(\mathbb{Z}/4\mathbb{Z}\) symmetry of \(L^2(\mathbb{R})\).

## The Fractional Fourier Transform

Once we have the spectral decomposition, we can define the **fractional Fourier transform** of order \(\alpha\):

\[
\mathcal{F}^\alpha = \sum_{n=0}^\infty e^{-in\pi\alpha/2} P_{V_n},
\]
where \(P_{V_n}\) is the projection onto \(V_{n \pmod 4}\). For \(\alpha = 1\), this gives the ordinary Fourier transform; for \(\alpha = 2\), it gives \(f(x) \mapsto f(-x)\); for \(\alpha = 0\), it gives the identity.

The fractional Fourier transform interpolates between the identity and the Fourier transform. In time-frequency analysis, \(\mathcal{F}^\alpha\) rotates the time-frequency plane by angle \(\alpha\pi/2\) — it "rotates" between time and frequency representations. This makes it useful in signal processing for chirp signals (signals whose frequency changes linearly with time), radar, and quantum optics.

---

# Chapter 34: Interpolation Theory — Marcinkiewicz and Calderón–Mityagin

## The Marcinkiewicz Interpolation Theorem

The Riesz–Thorin theorem (Chapter 6) uses complex analysis. There is a real-variable interpolation theorem — the Marcinkiewicz theorem — that is technically less demanding but has different scope.

<div class="definition">
<strong>Definition (Weak \(L^p\) / Lorentz space).</strong> For \(1 \leq p < \infty\), the <strong>weak \(L^p\) space</strong> \(L^{p,\infty}(X)\) consists of all measurable \(f\) such that:

\[
\|f\|_{L^{p,\infty}} = \sup_{\lambda>0} \lambda \cdot \mu(\{|f| > \lambda\})^{1/p} < \infty.
\]
This is weaker than the \(L^p\) condition: \(L^p \subset L^{p,\infty}\) and the inclusion is strict (e.g., \(f(x) = 1/x \in L^{1,\infty}(\mathbb{R})\) but \(f \notin L^1(\mathbb{R})\)).
</div>

An operator \(T\) is of **weak type \((p,p)\)** if \(\|Tf\|_{L^{p,\infty}} \leq C\|f\|_{L^p}\).

<div class="theorem">
<strong>Theorem (Marcinkiewicz Interpolation).</strong> Let \(T\) be a sublinear operator. Suppose:
\begin{itemize}
\item \(T\) is of weak type \((p_0, p_0)\): \(\|Tf\|_{L^{p_0,\infty}} \leq M_0\|f\|_{L^{p_0}}\).
\item \(T\) is of weak type \((p_1, p_1)\): \(\|Tf\|_{L^{p_1,\infty}} \leq M_1\|f\|_{L^{p_1}}\).
\end{itemize}
Then for \(p_0 < p < p_1\), \(T\) is bounded on \(L^p\): \(\|Tf\|_{L^p} \leq C_{p,p_0,p_1}M_0^{1-\theta}M_1^\theta\|f\|_{L^p}\) where \(1/p = (1-\theta)/p_0 + \theta/p_1\).
</div>

<div class="proof">
<strong>Proof sketch (Calderón–Mityagin level decomposition).</strong> For a fixed \(f\) and \(\lambda > 0\), decompose \(f = f_\lambda^\sharp + f_\lambda^\flat\) where \(f_\lambda^\sharp = f \cdot \mathbf{1}_{|f| > \lambda}\) (the "large" part) and \(f_\lambda^\flat = f \cdot \mathbf{1}_{|f| \leq \lambda}\) (the "small" part). By sublinearity: \(|Tf| \leq |Tf_\lambda^\sharp| + |Tf_\lambda^\flat|\). The level set \(\{|Tf| > 2\lambda\}\) is contained in \(\{|Tf_\lambda^\sharp| > \lambda\} \cup \{|Tf_\lambda^\flat| > \lambda\}\). Applying the weak-type estimates to each piece and integrating in \(\lambda\) (using the layer cake formula \(\|Tf\|_p^p = p\int_0^\infty\lambda^{p-1}\mu\{|Tf|>\lambda\}\,d\lambda\)) gives the \(L^p\) bound. \(\square\)
</div>

**Application:** The Hardy–Littlewood maximal function \(M\) is bounded on \(L^\infty\) trivially (\(Mf \leq \|f\|_\infty\)) and is of weak type (1,1) (Hardy–Littlewood theorem). Marcinkiewicz interpolation then gives boundedness on \(L^p\) for all \(1 < p < \infty\) — the full Hardy–Littlewood maximal theorem.

**Application to the Hilbert transform:** The Hilbert transform is bounded on \(L^2\) (by Plancherel) and satisfies a weak-type (1,1) estimate (proved via the Calderón–Zygmund decomposition). Marcinkiewicz gives boundedness on \(L^p\) for \(1 < p \leq 2\), and duality extends to \(2 \leq p < \infty\).

---

# Chapter 35: Convergence of Fourier Series — The Complete Picture

## A Unified Summary

The behavior of Fourier partial sums \(S_N f\) depends critically on the function space. Here is the complete picture:

**\(L^1\) functions:**
- Fourier series can diverge everywhere (Kolmogorov 1923).
- Fourier series is always Cesàro summable a.e. to \(f\) (since \(\sigma_N f \to f\) in \(L^1\) norm by Fejér, hence a.e. for a subsequence; with more work, a.e. for the full sequence).
- Fourier series is always Abel summable to \(f\) at continuity points (Poisson integral theorem).

**\(L^2\) functions:**
- \(S_N f \to f\) in \(L^2\) norm (Hilbert space theory / Riesz–Fischer).
- \(S_N f(x) \to f(x)\) for **almost every** \(x\) (Carleson–Hunt, 1966–1968, deep theorem!).
- The exceptional set (where divergence can occur) has measure zero but can be any given set of measure zero.

**\(L^p\) functions, \(1 < p < \infty\):**
- \(S_N f \to f\) in \(L^p\) norm (M. Riesz 1927, via Hilbert transform boundedness).
- \(S_N f(x) \to f(x)\) for almost every \(x\) (Carleson–Hunt 1968).

**Continuous functions:**
- \(S_N f\) can diverge at a point (du Bois-Reymond 1873).
- The set of continuous functions with everywhere divergent Fourier series is a dense \(G_\delta\) (Baire category / Banach–Steinhaus).
- But \(\sigma_N f \to f\) uniformly (Fejér 1900).
- And \(S_N f(x) \to f(x)\) for almost every \(x\) (Carleson 1966).

**Smooth functions (\(C^k, C^\infty\), analytic):**
- The Fourier series converges uniformly (for \(C^1\) or higher): \(|\hat{f}(n)| = O(n^{-k})\) for \(f \in C^k\), and \(\sum n^{k-1}|\hat{f}(n)| < \infty\) for \(k \geq 2\), giving absolute uniform convergence.
- For real-analytic functions, convergence is geometric: \(|\hat{f}(n)| \leq Ce^{-\rho|n|}\) for some \(\rho > 0\).

**Functions of bounded variation:**
- \(S_N f(x) \to [f(x^+)+f(x^-)]/2\) for every \(x\) (Dirichlet–Jordan theorem).
- Near jumps: Gibbs phenomenon — overshoot of ~8.9% of jump size.

This table reveals the fundamental structure:
- **Norm convergence** is always easier than **pointwise convergence**.
- **Regularity** dramatically improves convergence.
- The key borderline is \(L^2\): above (i.e., \(L^p\) for \(p>1\), smooth functions) convergence is good; below (i.e., \(L^1\), measures) convergence can fail.
- The Carleson–Hunt theorem shows that \(L^2\) is the true "threshold" for a.e. convergence.

## A Hierarchy of Convergence Methods

Beyond ordinary convergence of partial sums \(S_N f\), there is a hierarchy of summability methods, each applicable to a wider class of functions:

1. **Ordinary convergence** of \(S_N f\): requires smoothness (Dini, Hölder) or bounded variation.
2. **Cesàro summability** (\(\sigma_N f\)): works for all \(f \in L^1(\mathbb{T})\) in norm, uniformly for continuous \(f\) (Fejér).
3. **Abel summability** (\(A_r f = f * P_r\)): works at every continuity point of any \(f \in L^1(\mathbb{T})\).
4. **Bochner–Riesz summability**: uses the kernel \((1-|n|^2/N^2)_+^\delta\) — lies between ordinary and Cesàro summability for \(\delta > 0\).

The relationship between these methods is made precise by Tauberian theorems: extra conditions on the Fourier coefficients (Tauberian conditions) allow one to conclude ordinary convergence from summability.

## A Note on Divergence at a Point

The construction of a continuous function with divergent Fourier series (guaranteed by Banach–Steinhaus) is non-constructive. An explicit construction was given by du Bois-Reymond, but it is complicated. Here is a more modern explicit example due to Fejér (1910):

**Fejér's example:** Consider the function:

\[
f(x) = \sum_{n=1}^\infty \frac{\sin(n_k x)}{n_k}
\]
where \(n_k\) grows sufficiently rapidly (e.g., \(n_{k+1} > 2n_k^2\)). This series converges uniformly (since \(\sum 1/n_k < \infty\)), so \(f \in C(\mathbb{T})\). But by choosing the gaps between \(n_k\) large enough, the partial sums \(S_{N_k}f(0)\) for \(N_k\) between \(n_k\) and \(n_{k+1}\) accumulate contributions from all earlier terms that add coherently, making the partial sums oscillate without converging.

The formal verification requires careful estimates of \(\sum_{j=k}^\infty \frac{\sin(n_j \cdot 0)}{n_j}\) — which is 0 — versus the partial sums \(S_{N_k}f(0)\) at intermediate \(N_k\), where the contribution from large terms like \(\frac{\sin(n_k x)}{n_k}\) near \(x=0\) (where \(\sin(n_k x) \approx n_k x\)) gives a significant contribution. This example illustrates the subtlety of pointwise Fourier convergence.

---

# Chapter 36: Fourier Analysis on Finite Groups — the DFT in Depth

## Characters and Representations of \(\mathbb{Z}/N\mathbb{Z}\)

The group \(\mathbb{Z}/N\mathbb{Z} = \{0, 1, 2, \ldots, N-1\}\) with addition mod \(N\) is cyclic of order \(N\). Its characters (group homomorphisms \(\chi: \mathbb{Z}/N\mathbb{Z} \to \mathbb{T}\)) are:

\[
\chi_k(j) = e^{2\pi ijk/N}, \quad k = 0, 1, \ldots, N-1.
\]
These form a complete orthonormal system in \(L^2(\mathbb{Z}/N\mathbb{Z}) = \mathbb{C}^N\) (with the inner product \(\langle x, y\rangle = \frac{1}{N}\sum_{j=0}^{N-1}x_j\overline{y_j}\)):

\[
\frac{1}{N}\sum_{j=0}^{N-1}\chi_k(j)\overline{\chi_l(j)} = \frac{1}{N}\sum_{j=0}^{N-1}e^{2\pi ij(k-l)/N} = \delta_{kl}.
\]

The DFT is the expansion in this character basis: \(\hat{x}_k = N\langle x, \chi_k\rangle = \sum_j x_j e^{-2\pi ijk/N}\). The factor of \(N\) comes from the non-normalized inner product \(\langle x, y\rangle_{\text{DFT}} = \sum_j x_j\overline{y_j}\) (without the \(1/N\)), which is the convention used in the DFT.

## Convolution Theorem for the DFT

The cyclic convolution of sequences \(x, y \in \mathbb{C}^N\) is \((x \circledast y)_n = \sum_{j=0}^{N-1}x_j y_{n-j\pmod N}\). Its DFT satisfies:

\[
\widehat{x \circledast y}_k = \hat{x}_k \cdot \hat{y}_k.
\]
This is the cornerstone of fast polynomial multiplication and is used in many algorithms. For example, multiplying two polynomials of degree \(n-1\) using DFT: represent each polynomial as a vector of coefficients, compute the DFT (in \(O(N\log N)\) time), multiply pointwise (in \(O(N)\) time), and compute the inverse DFT (in \(O(N\log N)\) time). The total is \(O(N\log N)\) rather than the naive \(O(N^2)\) — this is the basis of fast polynomial multiplication (used in computer algebra systems and cryptography).

## Parseval for the DFT

For \(x \in \mathbb{C}^N\): \(\sum_{k=0}^{N-1}|\hat{x}_k|^2 = N\sum_{j=0}^{N-1}|x_j|^2\).

This follows from the unitarity of the DFT matrix \(W\) with entries \(W_{kj} = e^{-2\pi ijk/N}\): we have \(W^* W = N \cdot I_N\) (since the rows of \(W\) are orthogonal with \(L^2\) norm \(\sqrt{N}\) each).

## Quantum Fourier Transform

In quantum computing, the **quantum Fourier transform (QFT)** is the DFT implemented as a quantum circuit. For an \(n\)-qubit quantum system with state space \(\mathbb{C}^{2^n}\), the QFT applies the DFT with \(N = 2^n\). The key advantage is that the QFT circuit requires only \(O(n^2) = O((\log N)^2)\) quantum gates — exponentially fewer than the classical FFT's \(O(N\log N)\) classical gates.

The QFT is a key subroutine in quantum algorithms:
- **Shor's algorithm** (1994) for integer factorization uses the QFT to find the period of a function, which corresponds to the prime factors. The QFT is the reason Shor's algorithm achieves exponential speedup over classical factoring algorithms.
- **Phase estimation** algorithms use the QFT to measure eigenvalues of quantum operators.

The mathematical content is purely Fourier analysis on \(\mathbb{Z}/N\mathbb{Z}\) — the QFT is the same as the DFT, just implemented in quantum mechanics (where states can be in superposition). The efficiency comes from quantum parallelism: the quantum state \(|\psi\rangle = \sum_{j=0}^{N-1}x_j|j\rangle\) "stores" all \(N\) amplitudes simultaneously, allowing the QFT to process all inputs at once.

---

# Chapter 37: The Fourier Transform and Partial Differential Equations — Further Examples

## The Schrödinger Equation in Detail

The free Schrödinger equation \(i\partial_t\psi = -\frac{1}{2}\Delta\psi\) (in units where \(\hbar = m = 1\)) governs the time evolution of a quantum particle. Taking the Fourier transform in \(x\):

\[
i\partial_t\hat{\psi}(\xi,t) = \frac{(2\pi|\xi|)^2}{2}\hat{\psi}(\xi,t),
\]
so \(\hat{\psi}(\xi,t) = \hat{\psi}_0(\xi)e^{-2\pi^2|\xi|^2 it}\). The solution is \(\psi(x,t) = e^{it\Delta/2}\psi_0(x) = (\psi_0 * K_t)(x)\) where:

\[
K_t(x) = \frac{1}{(2\pi it)^{n/2}}e^{i|x|^2/(2t)}
\]
is the Schrödinger propagator (a complex Gaussian / chirp). Unlike the heat kernel, \(K_t\) has constant modulus \(|K_t(x)| = (2\pi|t|)^{-n/2}\) — there is no decay in \(x\), only oscillation. This reflects the **dispersive** but **non-dissipative** nature of the Schrödinger equation.

**Dispersive decay:** Even though \(|K_t(x)|= C/|t|^{n/2}\) decays in \(t\), individual wave packets spread out. By Young's inequality and properties of \(K_t\):

\[
\|\psi(\cdot,t)\|_{L^\infty(\mathbb{R}^n)} \leq \|K_t\|_{L^\infty}\|\psi_0\|_{L^1} = \frac{1}{(2\pi|t|)^{n/2}}\|\psi_0\|_{L^1}.
\]
So the maximum amplitude of the wave function decays like \(t^{-n/2}\). Meanwhile, \(\|\psi(\cdot,t)\|_{L^2} = \|\psi_0\|_{L^2}\) is conserved (Plancherel + the fact that \(|e^{-2\pi^2|\xi|^2it}| = 1\)). This combination — \(L^2\) conservation and \(L^\infty\) decay — is characteristic of **dispersive equations**.

**Strichartz estimates:** A deeper fact is the Strichartz estimate: for \(n \geq 1\),

\[
\|e^{it\Delta/2}\psi_0\|_{L^4_{t,x}(\mathbb{R}^{1+n})} \leq C\|\psi_0\|_{L^2(\mathbb{R}^n)}
\]
(for appropriate exponents depending on \(n\)). These estimates combine the \(L^2\) conservation with the dispersive decay and are proved using the Fourier transform together with the method of stationary phase. They are fundamental for the analysis of nonlinear Schrödinger equations.

## The Klein–Gordon Equation

The relativistic wave equation \(\psi_{tt} = c^2\Delta\psi - m^2c^4\psi\) (Klein–Gordon equation) governs relativistic scalar particles. In Fourier space: \(\hat{\psi}_{tt} = -(c^2(2\pi|\xi|)^2 + m^2c^4)\hat{\psi}\), giving oscillatory solutions with frequency \(\omega(\xi) = \sqrt{c^2(2\pi|\xi|)^2 + m^2c^4}\). This is the dispersion relation of special relativity: \(\omega^2 = |cp|^2 + (mc^2)^2\) where \(p = 2\pi\hbar\xi\) is momentum.

The **phase velocity** is \(v_\phi = \omega/|\xi| = c\sqrt{1 + (mc/2\pi\hbar|\xi|)^2} > c\) — faster than light! But the **group velocity** \(v_g = \partial\omega/\partial|\xi| = c^2(2\pi|\xi|)/\omega < c\) — energy and information travel at the group velocity, which is always less than \(c\). This illustrates the physical significance of the distinction between phase and group velocity, which is made precise by Fourier analysis.

## Pseudodifferential Operators

The Fourier transform allows a far-reaching generalization of differential operators. A **pseudodifferential operator** of order \(m\) is:

\[
(Pu)(x) = \int_{\mathbb{R}^n} p(x,\xi)\hat{u}(\xi)e^{2\pi ix\cdot\xi}\,d\xi,
\]
where \(p(x,\xi)\) is a "symbol" satisfying \(|\partial_x^\alpha\partial_\xi^\beta p(x,\xi)| \leq C_{\alpha\beta}(1+|\xi|)^{m-|\beta|}\). Differential operators \(P = \sum_{|\alpha|\leq m}a_\alpha(x)\partial^\alpha\) correspond to polynomial symbols \(p(x,\xi) = \sum_{|\alpha|\leq m}a_\alpha(x)(2\pi i\xi)^\alpha\). Pseudodifferential operators allow "fractional derivatives," operators whose symbol involves \(|\xi|^s\) for non-integer \(s\), and variable-coefficient versions of Fourier multipliers.

The **calculus of pseudodifferential operators** (composition, adjoint, parametrix) generalizes the calculus of differential operators and is the foundation of modern PDE theory, particularly the proof of elliptic regularity in full generality and the Atiyah–Singer index theorem.

---

# Appendix B: Historical Timeline of Fourier Analysis

| Year | Event | Person |
|---|---|---|
| 1807 | Memoir on heat submitted to French Academy; claim that arbitrary functions have trigonometric series representations | Fourier |
| 1822 | Publication of *Théorie analytique de la chaleur* | Fourier |
| 1829 | Rigorous proof of convergence for piecewise smooth functions | Dirichlet |
| 1848 | Observation of Gibbs phenomenon (published posthumously) | Wilbraham |
| 1854 | Riemann integral defined (specifically to study Fourier series); habilitation thesis | Riemann |
| 1873 | Continuous function with divergent Fourier series at a point | du Bois-Reymond |
| 1885 | Weierstrass approximation theorem (polynomials dense in continuous functions on intervals) | Weierstrass |
| 1898 | Gibbs phenomenon rediscovered and reported | Gibbs |
| 1900 | Cesàro means of Fourier series converge uniformly for continuous functions | Fejér (age 19) |
| 1901 | Lebesgue integral; measure theory | Lebesgue |
| 1906 | Complete mathematical analysis of the Gibbs phenomenon | Bôcher |
| 1907 | \(L^2\) theory; Riesz–Fischer theorem; completeness of \(\{e^{inx}\}\) in \(L^2\) | Riesz, Fischer |
| 1910 | \(L^p\) spaces defined; Young's inequality | Young |
| 1923 | \(L^1\) function with everywhere divergent Fourier series | Kolmogorov (age 19) |
| 1924–27 | \(L^p\) convergence of Fourier series for \(1 < p < \infty\); Hilbert transform bounded on \(L^p\) | M. Riesz |
| 1925 | Abstract harmonic analysis; Fourier transform on locally compact abelian groups | Wiener, Pontryagin |
| 1928 | Wiener Tauberian theorem; Wiener algebra | Wiener |
| 1930 | Hardy–Littlewood maximal theorem | Hardy, Littlewood |
| 1932 | Pontryagin duality | Pontryagin |
| 1934 | Haar measure on locally compact groups | Weil, Haar |
| 1940 | \(L^2\) theory of Fourier transform on \(\mathbb{R}\) (Plancherel) | Plancherel (earlier), systematized by Wiener |
| 1945 | Theory of distributions (generalized functions); Fourier transform on \(\mathcal{S}'\) | Laurent Schwartz (Fields Medal 1950) |
| 1952 | Calderón–Zygmund theory of singular integrals | Calderón, Zygmund |
| 1956 | Interpolation theory (Calderón) | Calderón |
| 1964 | Fourier algebra \(A(G)\) and \(B(G)\) for locally compact groups | Eymard |
| 1965 | Cooley–Tukey FFT algorithm (\(O(N\log N)\)) | Cooley, Tukey (rediscovery of Gauss 1805!) |
| 1966 | Fourier series of \(L^2\) functions converges a.e. | Carleson (Abel Prize 2006) |
| 1968 | Extension to \(L^p\), \(p > 1\) | Hunt |
| 1973 | Wavelet precursors (coherent states in physics) | Grossmann, Morlet (in physics) |
| 1980s | Wavelet theory developed systematically | Daubechies, Mallat, Meyer |
| 1994 | Quantum Fourier Transform; Shor's factoring algorithm | Shor |
| 2015– | Machine learning applications; neural networks learn Fourier-like representations | Deep learning era |

This timeline illustrates a central theme: **Fourier analysis has continuously driven the development of modern mathematics**. The questions raised by Fourier's 1807 memoir — when does the series converge? in what sense? — took 160 years to fully answer (Carleson 1966), generating measure theory, functional analysis, distribution theory, and harmonic analysis along the way.

---

# Appendix C: Notation and Conventions

Throughout these notes, the following conventions are used consistently.

**Circle and periodic functions:**
- \(\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}\), identified with \([-\pi,\pi)\).
- Haar measure: \(\frac{dx}{2\pi}\), so \(\int_\mathbb{T} 1\,d\mu = 1\).
- Fourier coefficients: \(\hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^\pi f(x)e^{-inx}\,dx\).
- \(L^p(\mathbb{T})\) norm: \(\|f\|_p = \left(\frac{1}{2\pi}\int_{-\pi}^\pi |f|^p\,dx\right)^{1/p}\).
- Parseval: \(\|f\|_2^2 = \sum_n |\hat{f}(n)|^2\) (in terms of the normalized inner product).

**Fourier transform on \(\mathbb{R}\):**
- Convention: \(\hat{f}(\xi) = \int_\mathbb{R} f(x)e^{-2\pi ix\xi}\,dx\) ("analyst's convention").
- Inversion: \(f(x) = \int_\mathbb{R}\hat{f}(\xi)e^{2\pi ix\xi}\,d\xi\).
- Plancherel: \(\|\hat{f}\|_2 = \|f\|_2\).
- Differentiation: \(\widehat{f^{(k)}}(\xi) = (2\pi i\xi)^k\hat{f}(\xi)\).

**Alternative conventions (physics/engineering):**
- \(\hat{f}(\xi) = \int f(x)e^{-i\xi x}\,dx\) (the \(2\pi\) appears in the inverse: \(f(x) = \frac{1}{2\pi}\int\hat{f}(\xi)e^{i\xi x}\,d\xi\)).
- Symmetric: \(\hat{f}(\xi) = \frac{1}{\sqrt{2\pi}}\int f(x)e^{-i\xi x}\,dx\), \(f(x) = \frac{1}{\sqrt{2\pi}}\int\hat{f}(\xi)e^{i\xi x}\,d\xi\). Plancherel is \(\|\hat{f}\|_2 = \|f\|_2\) in all conventions with appropriate normalizations.

**Function spaces:**
- \(C(\mathbb{T})\): continuous functions on \(\mathbb{T}\), with sup norm.
- \(C^k(\mathbb{T})\): \(k\)-times continuously differentiable.
- \(C^\infty(\mathbb{T})\): infinitely differentiable.
- \(L^p(\mathbb{T})\): functions with finite \(p\)th moment, \(1 \leq p \leq \infty\).
- \(L^{p,\infty}(\mathbb{T})\): weak \(L^p\).
- \(\mathcal{S}(\mathbb{R})\): Schwartz space of rapidly decaying smooth functions.
- \(\mathcal{S}'(\mathbb{R})\): tempered distributions.
- \(H^s(\mathbb{R})\): Sobolev space of order \(s \in \mathbb{R}\).
- \(A(G)\): Fourier algebra of locally compact group \(G\).
- \(B(G)\): Fourier–Stieltjes algebra.

**Standard kernels (on \(\mathbb{T}\)):**
- \(D_N\): Dirichlet kernel, \(D_N(x) = \frac{\sin((N+1/2)x)}{\sin(x/2)}\).
- \(K_N\): Fejér kernel, \(K_N(x) = \frac{1}{N}\left(\frac{\sin(Nx/2)}{\sin(x/2)}\right)^2\).
- \(P_r\): Poisson kernel, \(P_r(x) = \frac{1-r^2}{1-2r\cos x + r^2}\), \(0 \leq r < 1\).
- \(W_t\): Weierstrass (heat) kernel on \(\mathbb{T}\), \(W_t(x) = \sum_n e^{-n^2 t}e^{inx}\).

**Standard kernels (on \(\mathbb{R}\)):**
- \(H_t\): heat kernel, \(H_t(x) = (4\pi t)^{-1/2}e^{-x^2/(4t)}\).
- \(K_t\): Schrödinger propagator, \(K_t(x) = (2\pi it)^{-1/2}e^{ix^2/(2t)}\).
- \(\text{sinc}\): \(\text{sinc}(x) = \frac{\sin(\pi x)}{\pi x}\).
