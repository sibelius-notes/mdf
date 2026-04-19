---
title: "AMATH 731: Applied Functional Analysis"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly available texts. Kreyszig's *Introductory Functional Analysis with Applications* (Wiley, 1978) provides the foundational treatment of normed spaces and operator theory accessible to applied mathematicians. Brezis's *Functional Analysis, Sobolev Spaces and Partial Differential Equations* (Springer, 2011) is the canonical modern reference for \( L^p \) spaces, Sobolev spaces, and the Lax-Milgram theorem. Evans's *Partial Differential Equations* (AMS, 2nd ed., 2010), particularly Appendices B and C, gives a self-contained treatment of Sobolev spaces oriented toward PDE applications. Reed and Simon's *Methods of Modern Mathematical Physics I: Functional Analysis* (Academic Press, 1980) covers the spectral theory of unbounded operators and functional calculus. Berlinet and Thomas-Agnan's *Reproducing Kernel Hilbert Spaces in Probability and Statistics* (Springer, 2004) is the standard reference for RKHS theory. Zeidler's *Applied Functional Analysis: Applications to Mathematical Physics* (Springer, 1995) treats fixed-point theory and nonlinear operators in an applied setting. Vershynin's *High-Dimensional Probability* (Cambridge, 2018) provides supplementary probabilistic perspectives.

---

# Chapter 1: Normed Linear Spaces and Banach Spaces

## Section 1.1: Structural Background

The foundation of functional analysis is the replacement of finite-dimensional Euclidean space \( \mathbb{R}^n \) by infinite-dimensional analogues that retain enough algebraic and metric structure to support a rich theory of linear operators. A **normed linear space** is a vector space \( X \) over \( \mathbb{R} \) (or \( \mathbb{C} \)) equipped with a function \( \|\cdot\| : X \to [0,\infty) \) satisfying positivity (\( \|x\| = 0 \Leftrightarrow x = 0 \)), homogeneity (\( \|\alpha x\| = |\alpha|\|x\| \)), and the triangle inequality (\( \|x+y\| \leq \|x\| + \|y\| \)). Every norm induces a metric \( d(x,y) = \|x-y\| \), and completeness of this metric space is the key structural property distinguishing **Banach spaces** from general normed spaces.

Standard functional analysis — covered in depth in the companion PMATH 453 notes — establishes the foundational theory of Banach and Hilbert spaces, including the four pillars: the Hahn-Banach extension theorem, the Open Mapping theorem, the Closed Graph theorem, and the Banach-Steinhaus (Uniform Boundedness) principle. We recall these without proof and assume familiarity with their standard applications. The spectral theorem for compact self-adjoint operators on Hilbert spaces, weak topologies, and the Banach-Alaoglu theorem are likewise treated there. This chapter instead develops the concrete function spaces — chiefly \( L^p \) spaces — that are the primary arena for applied functional analysis.

## Section 1.2: \( L^p \) Spaces

### Construction via Measure Theory

Let \( (\Omega, \mathcal{F}, \mu) \) be a measure space. For \( 1 \leq p < \infty \), define

\[
\mathcal{L}^p(\Omega, \mu) = \left\{ f : \Omega \to \mathbb{R} \text{ measurable} : \int_\Omega |f|^p \, d\mu < \infty \right\}.
\]

This is a vector space under pointwise addition and scalar multiplication, but \( \|f\|_p = \left(\int_\Omega |f|^p \, d\mu\right)^{1/p} \) fails to be a norm because \( \|f\|_p = 0 \) only implies \( f = 0 \) almost everywhere, not everywhere. The standard remedy is to pass to equivalence classes: we say \( f \sim g \) if \( f = g \) \( \mu \)-almost everywhere, and define

\[
L^p(\Omega, \mu) = \mathcal{L}^p(\Omega, \mu) / {\sim}.
\]

Elements of \( L^p \) are equivalence classes, though by convention we speak of "functions in \( L^p \)" with the understanding that statements hold up to sets of measure zero. For \( p = \infty \), define

\[
\|f\|_\infty = \operatorname{ess\,sup}_{\omega \in \Omega} |f(\omega)| = \inf\{ M \geq 0 : \mu(\{|f| > M\}) = 0 \},
\]

and \( L^\infty(\Omega, \mu) \) consists of equivalence classes of essentially bounded measurable functions.

The most important special cases are \( L^p(\Omega) \) where \( \Omega \subseteq \mathbb{R}^n \) is an open set and \( \mu \) is Lebesgue measure, and sequence spaces \( \ell^p = L^p(\mathbb{N}, \mu_c) \) where \( \mu_c \) is counting measure, giving

\[
\ell^p = \left\{ (x_n)_{n=1}^\infty : \sum_{n=1}^\infty |x_n|^p < \infty \right\}, \quad \|(x_n)\|_{\ell^p} = \left(\sum_{n=1}^\infty |x_n|^p\right)^{1/p}.
\]

### Hölder's and Minkowski's Inequalities

The triangle inequality for \( \|\cdot\|_p \) requires proof and follows from a chain of classical inequalities. We develop these carefully.

**Young's inequality.** For \( a, b \geq 0 \) and conjugate exponents \( 1 < p, q < \infty \) with \( \frac{1}{p} + \frac{1}{q} = 1 \), we have

\[
ab \leq \frac{a^p}{p} + \frac{b^q}{q}.
\]

*Proof.* Fix \( b > 0 \) and consider \( \phi(a) = \frac{a^p}{p} + \frac{b^q}{q} - ab \). Then \( \phi'(a) = a^{p-1} - b \), which vanishes at \( a_0 = b^{1/(p-1)} = b^{q/p} \). Since \( \phi''(a) = (p-1)a^{p-2} > 0 \), this is a global minimum. At \( a_0 \),

\[
\phi(a_0) = \frac{b^q}{p} + \frac{b^q}{q} - b^{q/p + 1} = b^q\left(\frac{1}{p} + \frac{1}{q}\right) - b^q = 0,
\]

where we used \( q/p + 1 = q(1/p + 1/q) = q \). Hence \( \phi(a) \geq 0 \) for all \( a \geq 0 \). \( \square \)

<div class="theorem">
<strong>Theorem (Hölder's Inequality).</strong> Let <em>p</em> and <em>q</em> be conjugate exponents, <em>1 &le; p &le; &infin;</em>. If <em>f &isin; L<sup>p</sup>(&Omega;)</em> and <em>g &isin; L<sup>q</sup>(&Omega;)</em>, then <em>fg &isin; L<sup>1</sup>(&Omega;)</em> and

\[
\int_\Omega |fg| \, d\mu \leq \|f\|_p \|g\|_q.
\]
</div>

*Proof.* The cases \( p = 1, q = \infty \) and \( p = \infty, q = 1 \) are immediate from the definition of the essential supremum. Assume \( 1 < p, q < \infty \). If either \( \|f\|_p = 0 \) or \( \|g\|_q = 0 \), the inequality is trivial. Otherwise, define the normalized functions \( \tilde{f} = f/\|f\|_p \) and \( \tilde{g} = g/\|g\|_q \). Applying Young's inequality pointwise,

\[
|\tilde{f}(\omega)\tilde{g}(\omega)| \leq \frac{|\tilde{f}(\omega)|^p}{p} + \frac{|\tilde{g}(\omega)|^q}{q}.
\]

Integrating over \( \Omega \),

\[
\int_\Omega |\tilde{f}\tilde{g}| \, d\mu \leq \frac{1}{p}\int_\Omega |\tilde{f}|^p \, d\mu + \frac{1}{q}\int_\Omega |\tilde{g}|^q \, d\mu = \frac{1}{p} + \frac{1}{q} = 1.
\]

Multiplying both sides by \( \|f\|_p \|g\|_q \) gives the result. \( \square \)

<div class="theorem">
<strong>Theorem (Minkowski's Inequality).</strong> For <em>1 &le; p &le; &infin;</em> and <em>f, g &isin; L<sup>p</sup>(&Omega;)</em>,

\[
\|f + g\|_p \leq \|f\|_p + \|g\|_p.
\]
</div>

*Proof.* The cases \( p = 1 \) and \( p = \infty \) follow directly from \( |f+g| \leq |f| + |g| \). For \( 1 < p < \infty \), we write

\[
\int |f+g|^p = \int |f+g| \cdot |f+g|^{p-1} \leq \int |f| |f+g|^{p-1} + \int |g| |f+g|^{p-1}.
\]

Apply Hölder's inequality to each term with exponents \( p \) and \( q = p/(p-1) \):

\[
\int |f| |f+g|^{p-1} \leq \|f\|_p \left(\int |f+g|^{(p-1)q}\right)^{1/q} = \|f\|_p \|f+g\|_p^{p/q}.
\]

Similarly for the \( g \) term. Hence

\[
\|f+g\|_p^p \leq (\|f\|_p + \|g\|_p) \|f+g\|_p^{p/q}.
\]

Dividing both sides by \( \|f+g\|_p^{p/q} = \|f+g\|_p^{p-1} \) (assuming \( \|f+g\|_p > 0 \)) gives \( \|f+g\|_p \leq \|f\|_p + \|g\|_p \). \( \square \)

Minkowski's inequality shows that \( L^p(\Omega) \) is indeed a normed linear space for \( 1 \leq p \leq \infty \).

### Completeness: The Riesz-Fischer Theorem

<div class="theorem">
<strong>Theorem (Riesz-Fischer).</strong> For <em>1 &le; p &le; &infin;</em>, the space <em>L<sup>p</sup>(&Omega;, &mu;)</em> is complete, hence a Banach space.
</div>

*Proof.* We treat \( 1 \leq p < \infty \); the case \( p = \infty \) is handled similarly. Let \( (f_n) \) be a Cauchy sequence in \( L^p \). Extract a subsequence \( (f_{n_k}) \) satisfying \( \|f_{n_{k+1}} - f_{n_k}\|_p < 2^{-k} \) for all \( k \). Define the partial sums of the telescoping series:

\[
g_N(\omega) = \sum_{k=1}^N |f_{n_{k+1}}(\omega) - f_{n_k}(\omega)|.
\]

By Minkowski's inequality, \( \|g_N\|_p \leq \sum_{k=1}^N 2^{-k} < 1 \). By the monotone convergence theorem, the pointwise limit \( g(\omega) = \lim_{N \to \infty} g_N(\omega) \) satisfies \( \|g\|_p \leq 1 < \infty \), so \( g \in L^p \). In particular, \( g(\omega) < \infty \) for \( \mu \)-almost every \( \omega \), which means the series \( \sum_{k=1}^\infty (f_{n_{k+1}}(\omega) - f_{n_k}(\omega)) \) converges absolutely for a.e. \( \omega \).

Define

\[
f(\omega) = f_{n_1}(\omega) + \sum_{k=1}^\infty (f_{n_{k+1}}(\omega) - f_{n_k}(\omega)) = \lim_{k \to \infty} f_{n_k}(\omega)
\]

wherever this limit exists, and \( f(\omega) = 0 \) otherwise. Then \( f \) is measurable and \( |f| \leq |f_{n_1}| + g \in L^p \), so \( f \in L^p \). Moreover,

\[
|f - f_{n_k}|^p = \left|\sum_{j=k}^\infty (f_{n_{j+1}} - f_{n_j})\right|^p \leq g^p \in L^1,
\]

and the right side tends to zero pointwise as \( k \to \infty \). By the dominated convergence theorem, \( \|f - f_{n_k}\|_p \to 0 \). Since \( (f_n) \) is Cauchy and a subsequence converges to \( f \), the whole sequence converges: \( \|f_n - f\|_p \to 0 \). \( \square \)

### Duality of \( L^p \) Spaces

A fundamental structural result characterizes the continuous dual \( (L^p)^* \). For \( 1 \leq p < \infty \) and conjugate exponent \( q \), every \( g \in L^q \) defines a bounded linear functional \( \Lambda_g \in (L^p)^* \) via

\[
\Lambda_g(f) = \int_\Omega fg \, d\mu, \quad f \in L^p.
\]

By Hölder's inequality, \( |\Lambda_g(f)| \leq \|g\|_q \|f\|_p \), so \( \|\Lambda_g\|_{(L^p)^*} \leq \|g\|_q \). The map \( g \mapsto \Lambda_g \) is in fact an isometric isomorphism \( L^q \cong (L^p)^* \) for \( 1 < p < \infty \), and also for \( p = 1 \) when \( \mu \) is \( \sigma \)-finite. The proof that every bounded functional arises this way uses the Radon-Nikodym theorem.

<div class="theorem">
<strong>Theorem (Dual of L<sup>p</sup>).</strong> Let <em>(&Omega;, &mu;)</em> be a <em>&sigma;</em>-finite measure space and <em>1 &le; p &lt; &infin;</em> with conjugate exponent <em>q</em>. The map <em>g &mapsto; &Lambda;<sub>g</sub></em> is an isometric isomorphism <em>L<sup>q</sup>(&Omega;) &cong; (L<sup>p</sup>(&Omega;))*</em>.
</div>

The case \( p = 2 \) recovers the Riesz representation theorem for Hilbert spaces, since \( L^2 \) is self-dual. The \( L^\infty \) space is not the dual of \( L^1 \) in general; rather, \( (L^\infty)^* \) is strictly larger and contains finitely additive set functions.

### Dense Subsets of \( L^p \)

For applications, it is essential to know that smooth functions are dense in \( L^p \). Let \( \Omega \subseteq \mathbb{R}^n \) be open and \( 1 \leq p < \infty \).

**Step functions** (finite linear combinations of indicator functions of measurable sets of finite measure) are dense in \( L^p(\Omega) \), by the definition of the Lebesgue integral.

**Continuous functions with compact support** \( C_c(\Omega) \) are dense in \( L^p(\Omega) \). This follows from the fact that any indicator function \( \mathbf{1}_E \) (for \( E \) measurable, \( \mu(E) < \infty \)) can be approximated by continuous functions via inner/outer regularity of Lebesgue measure.

**Smooth functions with compact support** \( C_c^\infty(\Omega) \) are dense in \( L^p(\Omega) \). The proof uses **mollification**: given \( f \in L^p(\Omega) \) and a standard mollifier \( \eta_\epsilon(x) = \epsilon^{-n}\eta(x/\epsilon) \) where \( \eta \in C_c^\infty(\mathbb{R}^n) \), \( \eta \geq 0 \), \( \int \eta = 1 \), the convolution \( f_\epsilon = \eta_\epsilon * f \) satisfies \( f_\epsilon \in C^\infty \) and \( \|f_\epsilon - f\|_p \to 0 \) as \( \epsilon \to 0^+ \). This approximation technique is ubiquitous in PDE theory.

---

# Chapter 2: Sobolev Spaces

## Section 2.1: Weak Derivatives

### Motivation

Classical solutions of PDEs require that a function be differentiable in the pointwise sense. This is too restrictive for many natural problems: the minimizer of an energy functional may not be smooth, and boundary conditions in variational problems may force discontinuities in derivatives. The theory of **weak derivatives** extends the classical notion to a distributional setting that remains compatible with \( L^p \) function spaces.

The key idea comes from integration by parts. If \( u \in C^1(\Omega) \) and \( \phi \in C_c^\infty(\Omega) \) (a **test function**), then for any multi-index \( \alpha \) with \( |\alpha| = 1 \),

\[
\int_\Omega u \, \partial^\alpha \phi \, dx = -\int_\Omega (\partial^\alpha u) \phi \, dx,
\]

since \( \phi \) vanishes on \( \partial\Omega \) and all boundary terms disappear. This identity holds when \( u \) is differentiable, but the right-hand side makes sense whenever \( \partial^\alpha u \in L^1_{\mathrm{loc}} \).

<div class="definition">
<strong>Definition (Weak Derivative).</strong> Let <em>u &isin; L<sup>1</sup><sub>loc</sub>(&Omega;)</em> and let <em>&alpha;</em> be a multi-index. A function <em>v &isin; L<sup>1</sup><sub>loc</sub>(&Omega;)</em> is called the <em>weak partial derivative</em> <em>D<sup>&alpha;</sup>u</em> if

\[
\int_\Omega v \, \phi \, dx = (-1)^{|\alpha|} \int_\Omega u \, D^\alpha \phi \, dx \quad \text{for all } \phi \in C_c^\infty(\Omega).
\]
</div>

Uniqueness of the weak derivative follows immediately: if \( v_1 \) and \( v_2 \) both satisfy the definition, then \( \int_\Omega (v_1 - v_2)\phi \, dx = 0 \) for all \( \phi \in C_c^\infty(\Omega) \), and by the fundamental lemma of the calculus of variations, \( v_1 = v_2 \) a.e.

The weak derivative agrees with the classical derivative whenever the latter exists. More importantly, the weak derivative of a function in \( L^1_{\mathrm{loc}} \) may exist even when the pointwise derivative does not. For example, the absolute value function \( u(x) = |x| \) on \( (-1,1) \) has weak derivative \( u'(x) = \mathrm{sgn}(x) \) (equal to \( \pm 1 \) a.e.), even though the classical derivative fails at the origin.

### Sobolev Spaces \( W^{k,p} \)

<div class="definition">
<strong>Definition (Sobolev Space).</strong> Let <em>&Omega; &sube; &Rscr;<sup>n</sup></em> be open, <em>k &isin; &Nopf;</em>, and <em>1 &le; p &le; &infin;</em>. The <strong>Sobolev space</strong> <em>W<sup>k,p</sup>(&Omega;)</em> consists of all <em>u &isin; L<sup>p</sup>(&Omega;)</em> such that for every multi-index <em>&alpha;</em> with <em>|&alpha;| &le; k</em>, the weak derivative <em>D<sup>&alpha;</sup>u</em> exists and belongs to <em>L<sup>p</sup>(&Omega;)</em>. The norm is

\[
\|u\|_{W^{k,p}(\Omega)} = \left(\sum_{|\alpha| \leq k} \|D^\alpha u\|_{L^p(\Omega)}^p\right)^{1/p} \quad (1 \leq p < \infty),
\]

with the obvious modification for <em>p = &infin;</em>.
</div>

The Hilbert space case \( p = 2 \) is of special importance and is denoted \( H^k(\Omega) = W^{k,2}(\Omega) \), equipped with the inner product

\[
\langle u, v \rangle_{H^k} = \sum_{|\alpha| \leq k} \int_\Omega D^\alpha u \cdot D^\alpha v \, dx.
\]

The spaces \( W_0^{k,p}(\Omega) \) are defined as the closure of \( C_c^\infty(\Omega) \) in \( W^{k,p}(\Omega) \), and they capture the notion of functions whose "boundary values" (in a generalized sense) vanish on \( \partial\Omega \). For the Dirichlet problem, the natural solution space is \( H_0^1(\Omega) = W_0^{1,2}(\Omega) \).

## Section 2.2: Completeness of Sobolev Spaces

<div class="theorem">
<strong>Theorem.</strong> For <em>1 &le; p &le; &infin;</em> and <em>k &isin; &Nopf;</em>, the Sobolev space <em>W<sup>k,p</sup>(&Omega;)</em> is a Banach space. For <em>p = 2</em>, it is a Hilbert space.
</div>

*Proof.* We verify completeness. Let \( (u_m) \) be a Cauchy sequence in \( W^{k,p}(\Omega) \). For each multi-index \( |\alpha| \leq k \), the sequence \( (D^\alpha u_m) \) is Cauchy in \( L^p(\Omega) \) (since \( \|D^\alpha u_m - D^\alpha u_l\|_p \leq \|u_m - u_l\|_{W^{k,p}} \to 0 \)). By completeness of \( L^p \), there exist \( u_\alpha \in L^p(\Omega) \) with \( D^\alpha u_m \to u_\alpha \) in \( L^p \) for each \( |\alpha| \leq k \). Let \( u = u_0 \) be the \( L^p \) limit.

It remains to show that \( u_\alpha = D^\alpha u \) in the weak sense. For any test function \( \phi \in C_c^\infty(\Omega) \),

\[
\int_\Omega u_\alpha \phi \, dx = \lim_{m \to \infty} \int_\Omega (D^\alpha u_m) \phi \, dx = \lim_{m \to \infty} (-1)^{|\alpha|} \int_\Omega u_m D^\alpha \phi \, dx = (-1)^{|\alpha|} \int_\Omega u \, D^\alpha \phi \, dx,
\]

where we used convergence in \( L^p \) and Hölder's inequality (since \( \phi \in L^{p'} \) as it has compact support). This confirms \( D^\alpha u = u_\alpha \in L^p \), so \( u \in W^{k,p} \) and \( u_m \to u \) in \( W^{k,p} \). \( \square \)

## Section 2.3: Approximation by Smooth Functions

One of the most useful structural results about Sobolev spaces is that smooth functions are dense. This is the content of the Meyers-Serrin theorem.

<div class="theorem">
<strong>Theorem (Meyers-Serrin, H = W).</strong> For <em>1 &le; p &lt; &infin;</em> and any open <em>&Omega; &sube; &Rscr;<sup>n</sup></em>,

\[
C^\infty(\Omega) \cap W^{k,p}(\Omega) \text{ is dense in } W^{k,p}(\Omega).
\]
</div>

The proof uses a partition of unity subordinate to a locally finite cover of \( \Omega \) by balls, together with mollification in each ball. If \( \Omega \) has a sufficiently regular boundary (e.g., Lipschitz), then one can additionally approximate by functions in \( C^\infty(\bar\Omega) \), the smooth functions up to the boundary.

## Section 2.4: Trace Theorem

A fundamental issue in Sobolev theory is the meaning of boundary values. For a function \( u \in L^p(\Omega) \), the restriction to the boundary \( \partial\Omega \) (a set of measure zero in \( \mathbb{R}^n \)) is not defined. However, for \( u \in W^{1,p}(\Omega) \), a boundary trace can be defined in a rigorous way.

<div class="theorem">
<strong>Theorem (Trace Theorem).</strong> Let <em>&Omega; &sube; &Rscr;<sup>n</sup></em> be a bounded open set with <em>C<sup>1</sup></em> boundary, and <em>1 &le; p &lt; &infin;</em>. There exists a bounded linear operator <em>T : W<sup>1,p</sup>(&Omega;) &to; L<sup>p</sup>(&part;&Omega;)</em>, called the <strong>trace operator</strong>, such that <em>Tu = u|<sub>&part;&Omega;</sub></em> for all <em>u &isin; C<sup>1</sup>(&Omega;&macr;)</em>.
</div>

The key point is that \( T \) is continuous: small changes in \( u \) in the \( W^{1,p} \) norm produce small changes in the boundary values in \( L^p(\partial\Omega) \). Moreover, \( \ker T = W_0^{1,p}(\Omega) \), justifying the interpretation of \( W_0^{1,p} \) as the space of functions with zero boundary data.

## Section 2.5: Poincaré Inequality

The Poincaré inequality plays a critical role in the analysis of elliptic PDEs and in establishing coercivity for the Lax-Milgram theorem.

<div class="theorem">
<strong>Theorem (Poincaré Inequality).</strong> Let <em>&Omega; &sube; &Rscr;<sup>n</sup></em> be a bounded open set. There exists a constant <em>C = C(&Omega;, p) > 0</em> such that for all <em>u &isin; W<sub>0</sub><sup>1,p</sup>(&Omega;)</em>,

\[
\|u\|_{L^p(\Omega)} \leq C \|\nabla u\|_{L^p(\Omega)}.
\]
</div>

*Proof sketch.* Since \( u \in W_0^{1,p}(\Omega) \), we can extend \( u \) by zero to all of \( \mathbb{R}^n \). Enclose \( \Omega \) in a cube \( Q = [0,a]^n \). For \( u \in C_c^\infty(\Omega) \subseteq C_c^\infty(Q) \), the fundamental theorem of calculus gives

\[
u(x) = \int_0^{x_1} \frac{\partial u}{\partial x_1}(t, x_2, \ldots, x_n) \, dt,
\]

since \( u \) vanishes on the boundary. By Hölder's inequality,

\[
|u(x)|^p \leq x_1^{p-1} \int_0^{x_1} \left|\frac{\partial u}{\partial x_1}\right|^p dt \leq a^{p-1} \int_0^a \left|\frac{\partial u}{\partial x_1}\right|^p dt.
\]

Integrating over \( Q \) and using \( |\partial u/\partial x_1| \leq |\nabla u| \),

\[
\|u\|_{L^p(Q)}^p \leq a^p \|\nabla u\|_{L^p(Q)}^p.
\]

Since \( u = 0 \) outside \( \Omega \), the same holds with \( Q \) replaced by \( \Omega \), giving \( C = a = \mathrm{diam}(\Omega) \). By density of \( C_c^\infty \) in \( W_0^{1,p} \), the inequality extends. \( \square \)

An important consequence is that on \( H_0^1(\Omega) \), the seminorm \( u \mapsto \|\nabla u\|_{L^2} \) is equivalent to the full norm \( u \mapsto \|u\|_{H^1} \), since the Poincaré inequality controls \( \|u\|_{L^2} \) by \( \|\nabla u\|_{L^2} \).

## Section 2.6: Sobolev Embedding Theorem

The Sobolev embedding theorem describes how the regularity of a Sobolev function controls its pointwise size and continuity. The embeddings come in three qualitatively different regimes depending on the relationship between the order of differentiability \( k \), the integrability exponent \( p \), and the spatial dimension \( n \).

<div class="theorem">
<strong>Theorem (Sobolev Embedding).</strong> Let <em>&Omega; &sube; &Rscr;<sup>n</sup></em> be a bounded open set with Lipschitz boundary, and let <em>k &ge; 1</em>, <em>1 &le; p &lt; &infin;</em>.

<ol>
<li><em><strong>Subcritical case</strong>: kp &lt; n.</em> Define the Sobolev conjugate exponent <em>p* = np/(n-kp)</em>. Then <em>W<sup>k,p</sup>(&Omega;) &hookrightarrow; L<sup>p*</sup>(&Omega;)</em> continuously.</li>
<li><em><strong>Critical case</strong>: kp = n.</em> Then <em>W<sup>k,p</sup>(&Omega;) &hookrightarrow; L<sup>q</sup>(&Omega;)</em> for all <em>q &lt; &infin;</em>.</li>
<li><em><strong>Supercritical case</strong>: kp &gt; n.</em> Then <em>W<sup>k,p</sup>(&Omega;) &hookrightarrow; C^{0,\gamma}(\bar\Omega)</em> for the Hölder exponent <em>&gamma; = k - n/p</em> (if <em>k - n/p</em> is not an integer) or any <em>&gamma; &lt; 1</em> (at the endpoint).</li>
</ol>
</div>

The most important case for applications is \( k = 1 \), subcritical: \( W^{1,p}(\Omega) \hookrightarrow L^{p^*}(\Omega) \) where \( p^* = np/(n-p) \) for \( p < n \). We prove this case, following Brezis.

*Proof of \( W^{1,p}(\mathbb{R}^n) \hookrightarrow L^{p^*}(\mathbb{R}^n) \) for \( 1 \leq p < n \).* We first handle \( p = 1 \), then obtain the general case by applying the \( p=1 \) result to a power of \( u \).

**Step 1 (\( p = 1 \)).** Claim: \( \|u\|_{L^{n/(n-1)}} \leq C \|\nabla u\|_{L^1} \) for \( u \in C_c^\infty(\mathbb{R}^n) \).

For each coordinate direction \( i \),

\[
|u(x)| \leq \int_{-\infty}^\infty \left|\frac{\partial u}{\partial x_i}(x_1, \ldots, t, \ldots, x_n)\right| dt =: F_i(x_1,\ldots,\hat{x}_i,\ldots,x_n).
\]

Hence \( |u(x)|^{n/(n-1)} \leq \prod_{i=1}^n F_i^{1/(n-1)} \). Integrate over \( x_1 \) and apply the generalized Hölder inequality for \( n-1 \) functions with exponent \( n-1 \) to the product of \( F_2^{1/(n-1)}, \ldots, F_n^{1/(n-1)} \):

\[
\int |u|^{n/(n-1)} dx_1 \leq F_1^{1/(n-1)} \prod_{i=2}^n \left(\int F_i \, dx_1\right)^{1/(n-1)}.
\]

Continuing to integrate over each \( x_i \) in turn and applying Hölder at each step, one obtains after \( n \) integrations:

\[
\|u\|_{L^{n/(n-1)}}^{n/(n-1)} \leq \prod_{i=1}^n \left(\int |\partial_i u| \, dx\right)^{1/(n-1)} \leq \left(\int |\nabla u| \, dx\right)^{n/(n-1)},
\]

the last step using the AM-GM inequality. This gives \( \|u\|_{L^{n/(n-1)}} \leq \|\nabla u\|_{L^1} \), i.e., the \( p = 1 \) Sobolev inequality with \( p^* = n/(n-1) \).

**Step 2 (\( 1 < p < n \)).** Let \( \gamma = p(n-1)/(n-p) > 1 \), chosen so that \( p^* = \gamma p/(p-1) \cdot (n-1)/n \)... more precisely, apply the \( p=1 \) result to \( v = |u|^\gamma \):

\[
\left(\int |u|^{\gamma n/(n-1)}\right)^{(n-1)/n} \leq \int |\nabla(|u|^\gamma)| = \gamma \int |u|^{\gamma-1}|\nabla u|.
\]

Choose \( \gamma \) so that \( \gamma n/(n-1) = p^* \), giving \( \gamma = p^*(n-1)/n = p(n-1)/(n-p) \). Apply Hölder with exponents \( p \) and \( q = p/(p-1) \) to the right-hand side:

\[
\gamma \int |u|^{\gamma-1}|\nabla u| \leq \gamma \|u\|_{L^{(\gamma-1)q}}^{\gamma-1} \|\nabla u\|_{L^p}.
\]

One checks that \( (\gamma-1)q = p^* \), so \( \|u\|_{L^{(\gamma-1)q}} = \|u\|_{L^{p^*}} \). Combining:

\[
\|u\|_{L^{p^*}}^{p^*/p^{**}} \leq C \|u\|_{L^{p^*}}^{\gamma-1} \|\nabla u\|_{L^p},
\]

and since \( p^*/p^{**} = (n-1)/n \) and \( \gamma - 1 = p^*/p^{**} \cdot (p-1) \), dividing appropriately yields

\[
\|u\|_{L^{p^*}} \leq C(n,p) \|\nabla u\|_{L^p}.
\]

This is the \( W^{1,p} \to L^{p^*} \) Sobolev inequality. Combined with \( \|u\|_{L^p} \leq C\|u\|_{W^{1,p}} \), this gives the continuous embedding \( W^{1,p}(\mathbb{R}^n) \hookrightarrow L^{p^*}(\mathbb{R}^n) \). The result for bounded domains \( \Omega \) follows by an extension argument. \( \square \)

<div class="remark">
<strong>Remark (Rellich-Kondrachov Compactness).</strong> The Sobolev embedding is not only continuous but <em>compact</em> in strictly subcritical cases: if <em>kp &lt; n</em> and <em>q &lt; p*</em>, then the embedding <em>W<sup>k,p</sup>(&Omega;) &hookrightarrow; L<sup>q</sup>(&Omega;)</em> is compact for bounded <em>&Omega;</em> with Lipschitz boundary. This Rellich-Kondrachov theorem is essential for compactness arguments in elliptic PDE theory.
</div>

---

# Chapter 3: Fixed Point Theorems and Nonlinear Equations

## Section 3.1: Banach Contraction Mapping Principle

The **Banach fixed-point theorem** (also called the **contraction mapping principle**) is the simplest and most widely applied existence theorem in analysis. It provides both existence and uniqueness of a fixed point, along with a constructive iteration scheme.

<div class="theorem">
<strong>Theorem (Banach Fixed-Point Theorem).</strong> Let <em>(X, d)</em> be a complete metric space and <em>T : X &to; X</em> a contraction, i.e., there exists <em>0 &le; L &lt; 1</em> such that

\[
d(Tx, Ty) \leq L \, d(x,y) \quad \text{for all } x, y \in X.
\]

Then <em>T</em> has a unique fixed point <em>x^* \in X</em>. Starting from any <em>x_0 \in X</em>, the iteration <em>x_{n+1} = Tx_n</em> converges to <em>x^*</em>, with error estimate

\[
d(x_n, x^*) \leq \frac{L^n}{1-L} d(x_1, x_0).
\]
</div>

*Proof.* **Existence.** Starting from arbitrary \( x_0 \in X \), define the orbit \( x_n = T^n x_0 \). By induction,

\[
d(x_{n+1}, x_n) \leq L^n d(x_1, x_0).
\]

For \( m > n \), the triangle inequality gives

\[
d(x_m, x_n) \leq \sum_{k=n}^{m-1} d(x_{k+1}, x_k) \leq d(x_1, x_0) \sum_{k=n}^{m-1} L^k \leq \frac{L^n}{1-L} d(x_1, x_0).
\]

Since \( L < 1 \), the right side tends to zero as \( n \to \infty \), so \( (x_n) \) is Cauchy. By completeness, \( x_n \to x^* \) for some \( x^* \in X \). Continuity of \( T \) (which follows from the contraction condition) gives \( Tx^* = T(\lim x_n) = \lim Tx_n = \lim x_{n+1} = x^* \).

**Uniqueness.** If \( x^* \) and \( y^* \) are both fixed points, then \( d(x^*, y^*) = d(Tx^*, Ty^*) \leq L d(x^*, y^*) \). Since \( L < 1 \), this forces \( d(x^*, y^*) = 0 \), i.e., \( x^* = y^* \). \( \square \)

### Application: Picard-Lindelöf Theorem

The contraction mapping principle yields one of the most important theorems in ODE theory. Consider the initial value problem

\[
u'(t) = f(t, u(t)), \quad u(t_0) = u_0,
\]

where \( f : [t_0 - a, t_0 + a] \times \overline{B(u_0, b)} \to \mathbb{R}^n \) is continuous and **Lipschitz in the second variable**: there exists \( L \geq 0 \) such that

\[
|f(t, u) - f(t, v)| \leq L|u - v| \quad \text{for all } t, u, v.
\]

Integrating, the IVP is equivalent to the integral equation

\[
u(t) = u_0 + \int_{t_0}^t f(s, u(s)) \, ds.
\]

Define the Picard operator \( (Tu)(t) = u_0 + \int_{t_0}^t f(s, u(s)) \, ds \) on the complete metric space \( X = C([t_0 - h, t_0 + h], \overline{B(u_0, b)}) \) (with the uniform norm) for a suitably small \( h > 0 \). Let \( M = \sup |f| \). Choose \( h \leq \min(a, b/M, 1/(2L)) \). Then:

1. \( T \) maps \( X \) to itself: \( |Tu(t) - u_0| \leq Mh \leq b \).
2. \( T \) is a contraction:

\[
\|Tu - Tv\|_\infty = \sup_t \left|\int_{t_0}^t (f(s,u) - f(s,v)) \, ds\right| \leq Lh \|u-v\|_\infty \leq \frac{1}{2}\|u-v\|_\infty.
\]

By the Banach fixed-point theorem, \( T \) has a unique fixed point \( u^* \in X \), which is the unique local solution to the IVP. This is the **Picard-Lindelöf theorem**.

## Section 3.2: Schauder Fixed-Point Theorem

The Banach theorem requires a contraction, which is a strong condition. For many nonlinear problems, one can prove existence (but not uniqueness) under much weaker hypotheses using topological fixed-point theorems.

<div class="theorem">
<strong>Theorem (Schauder Fixed-Point Theorem).</strong> Let <em>X</em> be a Banach space, <em>K &sube; X</em> a nonempty convex compact subset, and <em>T : K &to; K</em> continuous. Then <em>T</em> has at least one fixed point.
</div>

The finite-dimensional special case is the **Brouwer fixed-point theorem**: any continuous map from a closed ball in \( \mathbb{R}^n \) to itself has a fixed point. The Schauder theorem extends this to infinite dimensions by exploiting compactness of \( K \) to approximate \( T \) by finite-dimensional maps.

A more practical variant for PDE applications is the **Schauder-Leray theorem**: if \( T : X \to X \) is a compact (completely continuous) map and the set \( \{x \in X : x = \lambda Tx \text{ for some } \lambda \in [0,1]\} \) is bounded, then \( T \) has a fixed point. This can be used, for instance, to prove existence for semilinear elliptic equations of the form \( -\Delta u = f(x, u) \) in a bounded domain.

---

# Chapter 4: Hilbert Spaces and the Lax-Milgram Theorem

## Section 4.1: Hilbert Space Foundations

Standard functional analysis (PMATH 453) covers the foundational theory of Hilbert spaces: the projection theorem, Riesz representation, orthonormal bases, Gram-Schmidt, and the Hilbert adjoint. We recall that a **Hilbert space** is a complete inner product space, and that the **Riesz representation theorem** asserts that every bounded linear functional \( \ell \) on a Hilbert space \( H \) has a unique representative \( v \in H \) with \( \ell(u) = \langle u, v \rangle_H \) and \( \|\ell\|_{H^*} = \|v\|_H \). We also recall the **orthogonal projection theorem**: if \( M \subseteq H \) is a closed subspace, then \( H = M \oplus M^\perp \) and every element of \( H \) has a unique decomposition.

## Section 4.2: Bilinear Forms and the Lax-Milgram Theorem

The Lax-Milgram theorem is a generalization of the Riesz representation theorem that is the cornerstone of the variational approach to elliptic PDEs.

<div class="definition">
<strong>Definition.</strong> Let <em>V</em> be a real Hilbert space. A map <em>a : V &times; V &to; &Rscr;</em> is a <strong>bounded bilinear form</strong> if it is linear in each argument separately and there exists <em>M > 0</em> with <em>|a(u,v)| &le; M\|u\|\|v\|</em> for all <em>u, v &isin; V</em>. It is <strong>coercive</strong> (or <strong>V-elliptic</strong>) if there exists <em>&alpha; > 0</em> such that

\[
a(u,u) \geq \alpha \|u\|_V^2 \quad \text{for all } u \in V.
\]
</div>

<div class="theorem">
<strong>Theorem (Lax-Milgram).</strong> Let <em>V</em> be a real Hilbert space, <em>a : V &times; V &to; &Rscr;</em> a bounded and coercive bilinear form, and <em>f &isin; V*</em> a bounded linear functional. Then there exists a unique <em>u &isin; V</em> such that

\[
a(u, v) = f(v) \quad \text{for all } v \in V.
\]

Moreover, the solution satisfies <em>\|u\|_V &le; (1/&alpha;)\|f\|_{V*}</em>.
</div>

*Proof.* For each fixed \( u \in V \), the map \( v \mapsto a(u,v) \) is a bounded linear functional on \( V \), so by the Riesz representation theorem there exists a unique element \( Au \in V \) with

\[
a(u,v) = \langle Au, v \rangle_V \quad \text{for all } v \in V.
\]

This defines a linear operator \( A : V \to V \). By boundedness of \( a \): \( \|Au\|_V = \sup_{\|v\|=1} \langle Au, v \rangle = \sup_{\|v\|=1} a(u,v) \leq M\|u\|_V \), so \( \|A\| \leq M \). By coercivity: \( \langle Au, u \rangle = a(u,u) \geq \alpha\|u\|_V^2 \), which implies \( \|Au\|_V \geq \alpha\|u\|_V \), so \( A \) is injective.

Similarly, by Riesz, the functional \( f \in V^* \) has a representative \( F \in V \) with \( f(v) = \langle F, v \rangle_V \). We seek \( u \) with \( Au = F \).

Apply the contraction mapping principle. Choose \( \rho > 0 \) and define \( T : V \to V \) by

\[
Tu = u - \rho(Au - F).
\]

A fixed point of \( T \) solves \( Au = F \). We compute:

\[
\|Tu - Tv\|_V^2 = \|u - v - \rho A(u-v)\|_V^2 = \|u-v\|_V^2 - 2\rho\langle A(u-v), u-v \rangle + \rho^2\|A(u-v)\|_V^2.
\]

Using coercivity \( \langle A(u-v), u-v \rangle \geq \alpha\|u-v\|_V^2 \) and \( \|A(u-v)\|_V \leq M\|u-v\|_V \):

\[
\|Tu - Tv\|_V^2 \leq (1 - 2\rho\alpha + \rho^2 M^2)\|u-v\|_V^2.
\]

Choosing \( \rho = \alpha/M^2 \) minimizes the factor: \( 1 - 2\rho\alpha + \rho^2 M^2 = 1 - \alpha^2/M^2 < 1 \). So \( T \) is a contraction on the Hilbert space \( V \) (which is complete), and by the Banach theorem \( T \) has a unique fixed point \( u \in V \). The estimate \( \|u\|_V \leq (1/\alpha)\|F\|_V = (1/\alpha)\|f\|_{V^*} \) follows from coercivity: \( \alpha\|u\|_V^2 \leq a(u,u) = f(u) \leq \|f\|_{V^*}\|u\|_V \). \( \square \)

## Section 4.3: Application to the Dirichlet Problem

The Lax-Milgram theorem provides a complete solution theory for linear elliptic boundary value problems in weak form. Consider the second-order elliptic problem:

\[
-\nabla \cdot (A(x)\nabla u) + c(x)u = f(x) \text{ in } \Omega, \quad u = 0 \text{ on } \partial\Omega,
\]

where \( \Omega \subseteq \mathbb{R}^n \) is bounded with Lipschitz boundary, \( A(x) = (a_{ij}(x)) \) is a matrix with \( a_{ij} \in L^\infty(\Omega) \), and the ellipticity condition \( \xi^T A(x) \xi \geq \theta|\xi|^2 \) holds for some \( \theta > 0 \) and all \( \xi \in \mathbb{R}^n \), and \( c \in L^\infty(\Omega) \), \( c \geq 0 \), \( f \in L^2(\Omega) \).

Multiply by a test function \( v \in H_0^1(\Omega) \) and integrate by parts (using zero boundary conditions):

\[
a(u,v) = \int_\Omega \sum_{i,j} a_{ij}(x)\partial_j u \, \partial_i v \, dx + \int_\Omega c(x)uv \, dx = \int_\Omega f v \, dx = f(v).
\]

The bilinear form \( a : H_0^1(\Omega) \times H_0^1(\Omega) \to \mathbb{R} \) is bounded: by Cauchy-Schwarz and \( a_{ij} \in L^\infty \),

\[
|a(u,v)| \leq (\|A\|_{L^\infty} + \|c\|_{L^\infty})\|u\|_{H^1}\|v\|_{H^1}.
\]

Coercivity follows from ellipticity: \( a(u,u) \geq \theta\|\nabla u\|_{L^2}^2 \geq \theta C_P^{-2} \|u\|_{H_0^1}^2 \), where the last step uses the Poincaré inequality to control \( \|u\|_{L^2} \) by \( \|\nabla u\|_{L^2} \) (with constant \( C_P \)).

By Lax-Milgram, there exists a unique **weak solution** \( u \in H_0^1(\Omega) \) satisfying the variational equation. This is the heart of the modern theory of elliptic PDEs.

## Section 4.4: Galerkin Approximation and Céa's Lemma

In practice, one cannot work in the infinite-dimensional space \( H_0^1(\Omega) \) directly. The **Galerkin method** approximates the solution in a sequence of finite-dimensional subspaces.

Let \( V_h \subseteq V = H_0^1(\Omega) \) be a finite-dimensional subspace (for instance, the span of piecewise linear finite element basis functions on a mesh of size \( h \)). The **Galerkin approximation** \( u_h \in V_h \) is defined by

\[
a(u_h, v_h) = f(v_h) \quad \text{for all } v_h \in V_h.
\]

Since \( V_h \) is finite-dimensional, this is equivalent to a linear system \( \mathbf{K}\mathbf{u} = \mathbf{f} \), where \( K_{ij} = a(\phi_j, \phi_i) \) is the **stiffness matrix** and \( (\phi_i) \) is a basis for \( V_h \). Coercivity of \( a \) implies \( \mathbf{K} \) is positive definite, hence nonsingular.

<div class="theorem">
<strong>Theorem (Céa's Lemma).</strong> Under the hypotheses of Lax-Milgram, if <em>u</em> is the exact weak solution and <em>u<sub>h</sub></em> is the Galerkin approximation in <em>V<sub>h</sub> &sube; V</em>, then

\[
\|u - u_h\|_V \leq \frac{M}{\alpha} \inf_{v_h \in V_h} \|u - v_h\|_V.
\]
</div>

*Proof.* Since both \( u \) and \( u_h \) satisfy the variational equation (in \( V \) and \( V_h \) respectively), for any \( v_h \in V_h \):

\[
a(u - u_h, v_h) = a(u, v_h) - a(u_h, v_h) = f(v_h) - f(v_h) = 0.
\]

This is the **Galerkin orthogonality** property: the error \( e_h = u - u_h \) is \( a \)-orthogonal to \( V_h \). Now for any \( v_h \in V_h \), write \( u - u_h = (u - v_h) - (u_h - v_h) \). Since \( u_h - v_h \in V_h \):

\[
\alpha\|u - u_h\|_V^2 \leq a(u-u_h, u-u_h) = a(u-u_h, u - v_h) + a(u-u_h, v_h - u_h) = a(u-u_h, u-v_h),
\]

using Galerkin orthogonality in the last step. By boundedness of \( a \):

\[
\alpha\|u - u_h\|_V^2 \leq M\|u-u_h\|_V \|u - v_h\|_V.
\]

Dividing by \( \|u - u_h\|_V \) and taking the infimum over \( v_h \in V_h \) yields Céa's lemma. \( \square \)

Céa's lemma reduces the approximation error to a best-approximation problem in the subspace \( V_h \). For piecewise polynomial finite elements on a mesh of size \( h \), standard approximation theory gives \( \inf_{v_h} \|u - v_h\|_{H^1} = O(h^r) \) when \( u \in H^{r+1} \), yielding an \( O(h^r) \) convergence rate for the finite element method.

---

# Chapter 5: Spectral Theory

## Section 5.1: Compact Operators and the Spectral Theorem

The spectral theorem for compact self-adjoint operators on Hilbert spaces is treated comprehensively in the companion PMATH 453 notes. We recall the essential statements without proof.

An operator \( T : H \to H \) on a Hilbert space is **compact** if it maps bounded sets to precompact (relatively compact) sets, equivalently if every bounded sequence \( (x_n) \) has a subsequence for which \( (Tx_{n_k}) \) converges. The **spectrum** of a bounded operator \( T : H \to H \) is

\[
\sigma(T) = \{\lambda \in \mathbb{C} : T - \lambda I \text{ is not boundedly invertible}\},
\]

which decomposes into the **point spectrum** \( \sigma_p(T) \) (eigenvalues), **continuous spectrum**, and **residual spectrum**.

The spectral theorem for compact self-adjoint operators states that if \( T : H \to H \) is compact and self-adjoint (i.e., \( \langle Tx, y \rangle = \langle x, Ty \rangle \)), then \( H \) has an orthonormal basis \( (e_n) \) consisting of eigenvectors of \( T \), the corresponding eigenvalues \( (\lambda_n) \) are real, and \( \lambda_n \to 0 \) unless \( H \) is finite-dimensional.

## Section 5.2: Sturm-Liouville Theory

### Regular Sturm-Liouville Problems

The **Sturm-Liouville problem** is a classical eigenvalue problem for a second-order ODE:

\[
-(p(x)u')' + q(x)u = \lambda w(x)u, \quad x \in (a,b),
\]

with boundary conditions

\[
\alpha_1 u(a) + \alpha_2 u'(a) = 0, \quad \beta_1 u(b) + \beta_2 u'(b) = 0,
\]

where \( |\alpha_1| + |\alpha_2| > 0 \) and \( |\beta_1| + |\beta_2| > 0 \). The problem is **regular** when \( p, p', q, w \) are continuous on \( [a,b] \), \( p(x) > 0 \) and \( w(x) > 0 \) throughout.

The natural Hilbert space is the **weighted** \( L^2 \) space

\[
L^2_w(a,b) = \left\{ u : \int_a^b |u(x)|^2 w(x) \, dx < \infty \right\}
\]

with inner product \( \langle u, v \rangle_w = \int_a^b u(x)\overline{v(x)} w(x) \, dx \). Define the **Sturm-Liouville operator** \( L \) by

\[
Lu = \frac{1}{w(x)}\left[-(p(x)u')' + q(x)u\right],
\]

so that the eigenvalue problem reads \( Lu = \lambda u \) in \( L^2_w \).

### Self-Adjointness

<div class="theorem">
<strong>Theorem.</strong> The Sturm-Liouville operator <em>L</em> with separated boundary conditions is self-adjoint on the domain <em>D(L) = \{u \in L^2_w : u, u' \in AC([a,b]),\, Lu \in L^2_w,\, \text{boundary conditions satisfied}\}</em>.
</div>

*Proof.* We verify \( \langle Lu, v \rangle_w = \langle u, Lv \rangle_w \). Computing:

\[
\langle Lu, v \rangle_w = \int_a^b [-(pu')' + qu]\bar{v} \, dx.
\]

Integrate by parts:

\[
-\int_a^b (pu')'\bar{v} \, dx = -[pu'\bar{v}]_a^b + \int_a^b pu'\bar{v}' \, dx.
\]

The boundary term \( [pu'\bar{v}]_a^b \) vanishes: at \( x = a \), the boundary condition \( \alpha_1 u(a) + \alpha_2 u'(a) = 0 \) (and similarly for \( v \)) imply \( p(a)u'(a)\bar{v}(a) = p(a)u'(a)\bar{v}(a) \). With separated boundary conditions, a short calculation shows that

\[
\left[p(u'\bar{v} - u\bar{v}')\right]_a^b = 0,
\]

which is the **Lagrange identity**. Therefore \( \langle Lu, v\rangle_w = \langle u, Lv\rangle_w \). \( \square \)

### Spectral Properties and Eigenfunction Expansion

<div class="theorem">
<strong>Theorem (Sturm-Liouville Spectral Theorem).</strong> The regular Sturm-Liouville operator <em>L</em> has the following properties:
<ol>
<li>All eigenvalues are real and the eigenfunctions corresponding to distinct eigenvalues are orthogonal in <em>L<sup>2</sup><sub>w</sub>(a,b)</em>.</li>
<li>There are infinitely many eigenvalues <em>&lambda;<sub>1</sub> &lt; &lambda;<sub>2</sub> &lt; &lambda;<sub>3</sub> &lt; &cdots;</em> with <em>&lambda;<sub>n</sub> &to; &infin;</em>.</li>
<li>Each eigenvalue is simple (one-dimensional eigenspace).</li>
<li>The eigenfunctions <em>\{&phi;<sub>n</sub>\}</em>, normalized so that <em>\|&phi;<sub>n</sub>\|<sub>w</sub> = 1</em>, form a complete orthonormal basis for <em>L<sup>2</sup><sub>w</sub>(a,b)</em>.</li>
</ol>
</div>

The proof of this theorem uses the compact resolvent: one shows that for suitable \( \mu \), the operator \( (L + \mu I)^{-1} : L^2_w \to L^2_w \) exists and is a compact self-adjoint operator (via the Green's function representation). The spectral theorem for compact self-adjoint operators then applies to give properties (1)–(4).

**Eigenfunction expansion.** For any \( f \in L^2_w(a,b) \), the expansion

\[
f = \sum_{n=1}^\infty c_n \phi_n, \quad c_n = \langle f, \phi_n \rangle_w = \int_a^b f(x)\phi_n(x)w(x) \, dx,
\]

converges in the norm of \( L^2_w \), i.e., \( \left\|f - \sum_{n=1}^N c_n\phi_n\right\|_w \to 0 \). This is the generalized Fourier series in the basis \( (\phi_n) \), and the completeness guarantees that no information is lost. Parseval's identity holds: \( \|f\|_w^2 = \sum_{n=1}^\infty |c_n|^2 \).

### Examples

The classical orthogonal polynomial systems arise as eigenfunctions of Sturm-Liouville problems. The **Legendre polynomials** \( P_n(x) \) are eigenfunctions of \( L = -\frac{d}{dx}[(1-x^2)\frac{d}{dx}] \) on \( (-1,1) \) with \( w = 1 \). The **Chebyshev polynomials** correspond to \( p(x) = \sqrt{1-x^2} \) and \( w(x) = 1/\sqrt{1-x^2} \). The Fourier series \( \{e^{inx}\}_{n \in \mathbb{Z}} \) arises from \( Lu = -u'' \) on \( [0, 2\pi] \) with periodic boundary conditions, which is a symmetric but not separated-boundary-condition case.

## Section 5.3: Spectral Theory of Unbounded Operators

### Unbounded Self-Adjoint Operators

In quantum mechanics and PDE theory, the most important operators — the Laplacian, Schrödinger operators — are **unbounded**: they are defined only on a dense domain \( D(A) \subsetneq H \) and are not bounded on all of \( H \). The theory of such operators requires careful attention to domains.

<div class="definition">
<strong>Definition.</strong> A densely defined linear operator <em>A : D(A) &sube; H &to; H</em> is <em>symmetric</em> if <em>\langle Au, v\rangle = \langle u, Av\rangle</em> for all <em>u, v &isin; D(A)</em>. It is <em>self-adjoint</em> if additionally <em>D(A*) = D(A)</em>, where the <em>adjoint domain</em> is <em>D(A*) = \{v &isin; H : u \mapsto \langle Au, v\rangle \text{ is bounded}\}</em>.
</div>

The distinction between symmetric and self-adjoint is crucial: a symmetric operator may have many self-adjoint extensions, and different extensions have different spectra. The deficiency indices \( (n_+, n_-)= (\dim\ker(A^*-iI), \dim\ker(A^*+iI)) \) control the extension theory. Self-adjoint extensions exist if and only if \( n_+ = n_- \).

For \( A = -\Delta \) on \( \Omega \subseteq \mathbb{R}^n \) with domain \( D(A) = C_c^\infty(\Omega) \), the operator is symmetric in \( L^2(\Omega) \). The Dirichlet Laplacian (self-adjoint extension with zero boundary conditions) has domain \( D(A_D) = H^2(\Omega) \cap H_0^1(\Omega) \).

### Spectrum of the Laplacian

For the Dirichlet Laplacian \( -\Delta_D \) on a bounded domain \( \Omega \), the resolvent \( (-\Delta_D - \lambda)^{-1} \) is a compact operator on \( L^2(\Omega) \) for \( \lambda \notin \sigma(-\Delta_D) \) (this follows from the Sobolev embedding: the resolvent maps \( L^2 \to H^2 \hookrightarrow L^2 \) compactly by Rellich-Kondrachov). Therefore the spectrum is purely discrete: \( \sigma(-\Delta_D) = \{0 < \lambda_1 \leq \lambda_2 \leq \cdots\} \) with \( \lambda_n \to \infty \). The eigenfunctions form an orthonormal basis for \( L^2(\Omega) \).

For the Laplacian on all of \( \mathbb{R}^n \), the spectrum is instead \( \sigma(-\Delta) = [0,\infty) \) (purely continuous), with no \( L^2 \) eigenfunctions. This is the primary difference between bounded and unbounded domains.

### Functional Calculus

For a self-adjoint operator \( A \) on \( H \), the **spectral theorem** (for unbounded operators, proved via the Cayley transform and Stone-Weierstrass, as in Reed-Simon) asserts the existence of a **spectral measure** \( E(\cdot) \) on the Borel subsets of \( \mathbb{R} \) such that

\[
A = \int_{\mathbb{R}} \lambda \, dE(\lambda).
\]

For any bounded Borel function \( \phi : \mathbb{R} \to \mathbb{C} \), the functional calculus defines \( \phi(A) = \int_\mathbb{R} \phi(\lambda) \, dE(\lambda) \), a bounded operator on \( H \). This gives meaning to expressions such as \( e^{itA} \), \( f(A) \) for \( f \in L^\infty(\mathbb{R}) \), and \( A^s \) for \( s > 0 \).

### Applications to Quantum Mechanics

In quantum mechanics, the **observables** of a physical system correspond to self-adjoint operators on the Hilbert space \( H = L^2(\mathbb{R}^n) \). The **Hamiltonian** for a particle in a potential \( V \) is the Schrödinger operator

\[
H = -\frac{\hbar^2}{2m}\Delta + V(x).
\]

For this to be a well-defined self-adjoint operator, one requires that the multiplication operator \( V \) does not "destroy" the domain. The Kato-Rellich theorem gives conditions: if \( V \) is real-valued and \( -\Delta + V \) is essentially self-adjoint on \( C_c^\infty(\mathbb{R}^n) \) when, for instance, \( V \in L^2(\mathbb{R}^3) + L^\infty(\mathbb{R}^3) \).

The spectrum of \( H \) carries physical meaning: the **bound states** correspond to \( L^2 \) eigenfunctions (discrete spectrum), while **scattering states** live in the continuous spectrum. **Stone's theorem** asserts that the unitary group \( e^{-itH/\hbar} \) is the unique strongly continuous one-parameter unitary group with generator \( iH/\hbar \), and the Schrödinger equation \( i\hbar \partial_t \psi = H\psi \) has the solution \( \psi(t) = e^{-itH/\hbar}\psi(0) \).

## Section 5.4: Semigroup Theory

A natural generalization of \( e^{-itH} \) is the theory of **strongly continuous semigroups** (or \( C_0 \)-semigroups), which provides a Banach-space framework for evolution equations.

<div class="definition">
<strong>Definition.</strong> A family <em>(T(t))<sub>t &ge; 0</em> of bounded linear operators on a Banach space <em>X</em> is a <em>C<sub>0</sub>-semigroup</em> if: (i) <em>T(0) = I</em>; (ii) <em>T(s+t) = T(s)T(t)</em> for all <em>s, t &ge; 0</em>; (iii) <em>T(t)x &to; x</em> as <em>t &to; 0<sup>+</sup></em> for all <em>x &isin; X</em>. The <strong>infinitesimal generator</strong> is

\[
Ax = \lim_{t \to 0^+} \frac{T(t)x - x}{t}
\]

defined on the domain <em>D(A) = \{x \in X : \text{the limit exists in } X\}</em>.
</div>

The **Hille-Yosida theorem** characterizes which operators generate \( C_0 \)-semigroups: a densely defined closed linear operator \( A \) is the generator of a \( C_0 \)-semigroup satisfying \( \|T(t)\| \leq Me^{\omega t} \) if and only if all real \( \lambda > \omega \) are in the resolvent set and \( \|(\lambda - A)^{-n}\| \leq M/(\lambda - \omega)^n \).

For applications: the heat equation \( \partial_t u = \Delta u \), \( u(0) = u_0 \in L^2 \), has solution \( u(t) = T(t)u_0 \) where \( (T(t)) \) is the heat semigroup generated by \( \Delta \) (the Dirichlet Laplacian on a domain, or the free Laplacian on \( \mathbb{R}^n \)). The smoothing effect of the heat semigroup — \( T(t) : L^2 \to H^k \) for all \( k \geq 0 \) when \( t > 0 \) — is a manifestation of the spectral properties of \( \Delta \).

---

# Chapter 6: Reproducing Kernel Hilbert Spaces

## Section 6.1: Evaluation Functionals

Let \( H \) be a Hilbert space of functions \( f : \mathcal{X} \to \mathbb{R} \) defined on some set \( \mathcal{X} \). For a fixed point \( x \in \mathcal{X} \), the **evaluation functional** \( \delta_x : H \to \mathbb{R} \) is defined by

\[
\delta_x(f) = f(x).
\]

In many function spaces, the evaluation functional is not bounded. For example, in \( L^2([0,1]) \), pointwise evaluation is not even well-defined, since functions are equivalence classes under a.e. equality.

<div class="definition">
<strong>Definition (Reproducing Kernel Hilbert Space).</strong> A Hilbert space <em>H</em> of real-valued functions on a set <em>&Xscr;</em> is called a <strong>reproducing kernel Hilbert space (RKHS)</strong> if for every <em>x &isin; &Xscr;</em>, the evaluation functional <em>&delta;<sub>x</sub> : H &to; &Rscr;</em> is bounded (continuous).
</div>

Boundedness of \( \delta_x \) means: there exists \( C_x > 0 \) such that \( |f(x)| \leq C_x \|f\|_H \) for all \( f \in H \). By the Riesz representation theorem, since \( \delta_x \) is a bounded linear functional on the Hilbert space \( H \), there exists a unique element \( K_x \in H \) such that

\[
f(x) = \delta_x(f) = \langle f, K_x \rangle_H \quad \text{for all } f \in H.
\]

The function \( K : \mathcal{X} \times \mathcal{X} \to \mathbb{R} \) defined by \( K(x,y) = K_x(y) \) is the **reproducing kernel** of \( H \). The "reproducing property" is:

\[
f(x) = \langle f, K(x, \cdot) \rangle_H \quad \text{for all } f \in H, x \in \mathcal{X}.
\]

In particular, \( K(x,y) = K_x(y) = \langle K_y, K_x \rangle_H = \langle K_x, K_y \rangle_H = K(y,x) \), so the reproducing kernel is **symmetric**.

## Section 6.2: Moore-Aronszajn Theorem

The fundamental theorem of RKHS theory establishes a bijection between reproducing kernels and RKHSs.

<div class="definition">
<strong>Definition (Positive Definite Kernel).</strong> A function <em>K : &Xscr; &times; &Xscr; &to; &Rscr;</em> is <strong>positive semi-definite</strong> (or <strong>positive definite</strong> if strict) if for every finite set of points <em>x<sub>1</sub>, &hellip;, x<sub>n</sub> &isin; &Xscr;</em> and every <em>c<sub>1</sub>, &hellip;, c<sub>n</sub> &isin; &Rscr;</em>,

\[
\sum_{i=1}^n \sum_{j=1}^n c_i c_j K(x_i, x_j) \geq 0.
\]
</div>

<div class="theorem">
<strong>Theorem (Moore-Aronszajn).</strong> Let <em>&Xscr;</em> be a nonempty set.
<ol>
<li>Every RKHS <em>H</em> on <em>&Xscr;</em> has a unique reproducing kernel <em>K</em>, and <em>K</em> is symmetric and positive semi-definite.</li>
<li>Conversely, for every symmetric positive semi-definite function <em>K : &Xscr; &times; &Xscr; &to; &Rscr;</em>, there exists a unique RKHS <em>H<sub>K</sub></em> on <em>&Xscr;</em> whose reproducing kernel is <em>K</em>.</li>
</ol>
</div>

*Proof.*

**Part 1 (Uniqueness).** Suppose \( K \) and \( K' \) are both reproducing kernels for \( H \). Then for any \( f \in H \) and \( x \in \mathcal{X} \),

\[
f(x) = \langle f, K(x,\cdot)\rangle_H = \langle f, K'(x,\cdot)\rangle_H,
\]

so \( \langle f, K(x,\cdot) - K'(x,\cdot)\rangle_H = 0 \) for all \( f \in H \). Taking \( f = K(x,\cdot) - K'(x,\cdot) \) gives \( \|K(x,\cdot) - K'(x,\cdot)\|_H = 0 \), hence \( K(x,\cdot) = K'(x,\cdot) \) for each \( x \). Symmetry gives \( K = K' \).

Positive semi-definiteness follows from:

\[
\sum_{i,j} c_i c_j K(x_i, x_j) = \left\|\sum_i c_i K(x_i, \cdot)\right\|_H^2 \geq 0,
\]

using the reproducing property and bilinearity of the inner product.

**Part 2 (Existence and uniqueness of \( H_K \)).** Given \( K \) symmetric positive semi-definite, let

\[
\mathcal{H}_0 = \mathrm{span}\{K(x, \cdot) : x \in \mathcal{X}\},
\]

the vector space of all finite linear combinations \( \sum_{i=1}^n c_i K(x_i, \cdot) \). Define a bilinear form on \( \mathcal{H}_0 \) by

\[
\left\langle \sum_i c_i K(x_i, \cdot), \sum_j d_j K(y_j, \cdot) \right\rangle = \sum_{i,j} c_i d_j K(x_i, y_j).
\]

This is well-defined (independent of the representation), symmetric, and positive semi-definite by assumption on \( K \). To see it is positive definite: if \( \|f\|^2 = \langle f, f\rangle = 0 \) for \( f = \sum_i c_i K(x_i,\cdot) \), then the reproducing property gives \( f(x) = \langle f, K(x,\cdot)\rangle = 0 \) for all \( x \), so \( f \equiv 0 \). Hence \( \langle \cdot, \cdot\rangle \) is an inner product on \( \mathcal{H}_0 \).

Define \( H_K \) to be the completion of \( \mathcal{H}_0 \) with respect to this inner product. The evaluations \( f \mapsto f(x) = \langle f, K(x,\cdot)\rangle \) are bounded on \( \mathcal{H}_0 \) (since \( |f(x)| \leq \|f\|\|K(x,\cdot)\| = \|f\|\sqrt{K(x,x)} \)) and extend to bounded functionals on \( H_K \). The completion \( H_K \) inherits the reproducing property, and uniqueness follows as in Part 1. \( \square \)

## Section 6.3: Mercer's Theorem

When \( \mathcal{X} \) is a compact metric space and \( K \) is a continuous positive semi-definite kernel, Mercer's theorem gives an explicit spectral expansion of \( K \).

<div class="theorem">
<strong>Theorem (Mercer).</strong> Let <em>&Xscr;</em> be a compact metric space with Borel measure <em>&mu;</em>, and let <em>K : &Xscr; &times; &Xscr; &to; &Rscr;</em> be continuous and positive semi-definite. Define the integral operator <em>T<sub>K</sub> : L<sup>2</sup>(&Xscr;, &mu;) &to; L<sup>2</sup>(&Xscr;, &mu;)</em> by

\[
(T_K f)(x) = \int_{\mathcal{X}} K(x,y)f(y) \, d\mu(y).
\]

Then <em>T<sub>K</sub></em> is a compact positive self-adjoint operator, with eigenvalues <em>&mu;<sub>1</sub> &ge; &mu;<sub>2</sub> &ge; &cdots; &ge; 0</em> (counting multiplicity) and corresponding <em>L<sup>2</sup></em>-orthonormal eigenfunctions <em>(&phi;<sub>n</sub>)</em>. The kernel admits the absolutely and uniformly convergent expansion

\[
K(x,y) = \sum_{n=1}^\infty \mu_n \phi_n(x)\phi_n(y).
\]
</div>

This expansion has profound consequences. The RKHS \( H_K \) can be described as

\[
H_K = \left\{ f = \sum_{n=1}^\infty a_n \phi_n : \sum_{n=1}^\infty \frac{a_n^2}{\mu_n} < \infty \right\}, \quad \|f\|_{H_K}^2 = \sum_{n=1}^\infty \frac{a_n^2}{\mu_n}.
\]

Functions in \( H_K \) are smoother than generic \( L^2 \) functions: the coefficients \( a_n = \langle f, \phi_n\rangle_{L^2} \) must decay fast enough that \( \sum a_n^2/\mu_n < \infty \), which is a decay condition on the spectral coefficients.

## Section 6.4: Examples of Kernels

### Gaussian (RBF) Kernel

On \( \mathcal{X} = \mathbb{R}^d \), the **Gaussian kernel** with bandwidth \( \sigma > 0 \) is

\[
K(x,y) = \exp\left(-\frac{\|x-y\|^2}{2\sigma^2}\right).
\]

This is positive definite (strictly): for any distinct points \( x_1, \ldots, x_n \) and nonzero \( c \in \mathbb{R}^n \), \( \sum_{i,j} c_i c_j K(x_i,x_j) > 0 \). The RKHS \( H_K \) associated to the Gaussian kernel consists of very smooth functions (infinitely differentiable), and the Mercer eigenvalues decay super-exponentially, reflecting the high regularity.

The reproducing kernel can be understood via the Fourier transform: the Gaussian kernel \( K(x,y) = K(x-y) \) is a **translation-invariant** kernel whose Fourier transform \( \hat{K}(\xi) = (2\pi)^{d/2}\sigma^d e^{-\sigma^2\|\xi\|^2/2} \) is strictly positive. By Bochner's theorem, any continuous translation-invariant positive semi-definite kernel is the Fourier transform of a nonnegative measure.

### Polynomial Kernel

The **polynomial kernel** of degree \( m \) on \( \mathbb{R}^d \) is

\[
K(x,y) = (1 + \langle x, y\rangle)^m.
\]

The RKHS \( H_K \) equals the space of polynomials in \( \mathbb{R}^d \) of degree at most \( m \), and the reproducing kernel property corresponds to polynomial evaluation by inner product. This kernel is widely used in support vector machine classification.

### Matérn Kernel

The **Matérn kernel** of order \( \nu > 0 \) on \( \mathbb{R}^d \) is

\[
K_\nu(x,y) = \frac{2^{1-\nu}}{\Gamma(\nu)}\left(\frac{\sqrt{2\nu}\|x-y\|}{\ell}\right)^\nu K_\nu\!\left(\frac{\sqrt{2\nu}\|x-y\|}{\ell}\right),
\]

where \( K_\nu \) on the right denotes the modified Bessel function of the second kind (the notation is standard). The RKHS of the Matérn-\( \nu \) kernel is the Sobolev space \( H^{\nu+d/2}(\mathbb{R}^d) \) (up to equivalence of norms), providing a direct bridge between kernel methods and Sobolev theory.

Special cases include \( \nu = 1/2 \): \( K_{1/2}(x,y) = e^{-\|x-y\|/\ell} \) (Ornstein-Uhlenbeck/Laplace kernel), whose RKHS is \( H^1(\mathbb{R}) \) for \( d = 1 \); and \( \nu = 3/2 \): \( K_{3/2}(x,y) = (1 + \sqrt{3}\|x-y\|/\ell)e^{-\sqrt{3}\|x-y\|/\ell} \), whose RKHS is \( H^2(\mathbb{R}) \) for \( d = 1 \).

## Section 6.5: RKHS in Supervised Learning

RKHS theory provides the mathematical foundation for **kernel methods** in machine learning and for **Gaussian process regression**. The key insight is that many learning problems can be cast as optimization in an RKHS, and the representer theorem then reduces the infinite-dimensional problem to a finite one.

**Representer Theorem.** Let \( H_K \) be an RKHS over \( \mathcal{X} \) with kernel \( K \), let \( (x_1, y_1), \ldots, (x_n, y_n) \in \mathcal{X} \times \mathbb{R} \) be training data, and let \( \Phi : \mathbb{R}^n \times \mathbb{R}_+ \to \mathbb{R} \) be strictly increasing in the second argument. Then every minimizer of

\[
\Phi\left(y_1, \ldots, y_n, f(x_1), \ldots, f(x_n), \|f\|_{H_K}^2\right)
\]

over \( f \in H_K \) has the form

\[
f^*(x) = \sum_{i=1}^n \alpha_i K(x_i, x)
\]

for some coefficients \( \alpha_1, \ldots, \alpha_n \in \mathbb{R} \).

The proof is elegant: decompose \( f = f_\parallel + f_\perp \) where \( f_\parallel \in V = \mathrm{span}\{K(x_i,\cdot)\} \) and \( f_\perp \perp V \). Since evaluations at \( x_i \) depend only on \( f_\parallel \) (by the reproducing property and orthogonality), the loss is unchanged by \( f_\perp \), but the regularization \( \|f\|^2 = \|f_\parallel\|^2 + \|f_\perp\|^2 \) is minimized by taking \( f_\perp = 0 \).

Substituting the form of \( f^* \), the problem reduces to optimizing over \( \alpha \in \mathbb{R}^n \), involving the **kernel matrix** \( \mathbf{K}_{ij} = K(x_i, x_j) \), which is positive semi-definite by definition of a kernel.

**Connection to Gaussian Processes.** A Gaussian process \( f \sim \mathcal{GP}(0, K) \) with kernel \( K \) can be viewed as a distribution over functions in (a larger space containing) \( H_K \). The posterior mean of the Gaussian process given noisy observations \( y_i = f(x_i) + \epsilon_i \), \( \epsilon_i \sim N(0,\sigma^2) \), is precisely the solution to the Tikhonov regularization problem

\[
\min_{f \in H_K} \sum_{i=1}^n (f(x_i) - y_i)^2 + \sigma^2 \|f\|_{H_K}^2.
\]

By the representer theorem, this has solution \( f^*(x) = \mathbf{k}(x)^T(\mathbf{K} + \sigma^2 I)^{-1}\mathbf{y} \), where \( \mathbf{k}(x) = (K(x_1,x),\ldots,K(x_n,x))^T \), recovering the Gaussian process predictive mean formula.

---

# Chapter 7: Generalized Fourier Series

## Section 7.1: Orthonormal Bases in Hilbert Spaces

An **orthonormal system** in a Hilbert space \( H \) is a set \( \{e_\alpha\}_{\alpha \in I} \subseteq H \) with \( \langle e_\alpha, e_\beta \rangle = \delta_{\alpha\beta} \). It is an **orthonormal basis** (or **complete orthonormal system**) if the only element of \( H \) orthogonal to all \( e_\alpha \) is zero, equivalently if \( \overline{\mathrm{span}}\{e_\alpha\} = H \).

For a separable Hilbert space (one with a countable dense subset), any orthonormal basis is countable, \( \{e_n\}_{n=1}^\infty \), and the **generalized Fourier series** expansion holds:

\[
f = \sum_{n=1}^\infty \hat{f}(n) e_n, \quad \hat{f}(n) = \langle f, e_n\rangle,
\]

with convergence in \( \|\cdot\|_H \). The coefficients \( \hat{f}(n) \) are the **generalized Fourier coefficients** of \( f \) in the basis \( (e_n) \). **Parseval's identity** states

\[
\|f\|_H^2 = \sum_{n=1}^\infty |\hat{f}(n)|^2,
\]

and **Bessel's inequality** \( \sum_{n=1}^N |\hat{f}(n)|^2 \leq \|f\|_H^2 \) holds for any finite subset of an orthonormal system (not necessarily complete).

## Section 7.2: Classical Fourier Series as a Special Case

The classical Fourier series on \( L^2(-\pi, \pi) \) is the generalized Fourier series in the orthonormal basis \( e_n(x) = (2\pi)^{-1/2}e^{inx} \), \( n \in \mathbb{Z} \). Completeness of this system in \( L^2(-\pi,\pi) \) is a theorem: it follows, for example, from the density of trigonometric polynomials in \( C([-\pi,\pi]) \) (Weierstrass approximation), the density of \( C([-\pi,\pi]) \) in \( L^2 \), and the fact that a complete orthonormal system in a dense subspace extends to a complete system in the whole space.

Parseval's identity in this context reads:

\[
\frac{1}{2\pi}\int_{-\pi}^\pi |f(x)|^2 \, dx = \sum_{n=-\infty}^\infty |\hat{f}(n)|^2, \quad \hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^\pi f(x)e^{-inx} \, dx,
\]

which is the isometric isomorphism \( L^2(-\pi,\pi) \cong \ell^2(\mathbb{Z}) \) given by the Fourier transform. This unitary equivalence is the rigorous content of the claim that Fourier series "decomposes" a function into frequencies.

## Section 7.3: Eigenfunction Expansion as Generalized Fourier Series

The Sturm-Liouville spectral theorem of Section 5.2 provides a complete orthonormal basis \( (\phi_n) \) for \( L^2_w(a,b) \). The resulting eigenfunction expansion

\[
f = \sum_{n=1}^\infty \langle f, \phi_n\rangle_w \phi_n
\]

is exactly a generalized Fourier series in this Hilbert space. The connection to the classical Fourier series is that the latter arises from the simplest Sturm-Liouville problem \( -u'' = \lambda u \) with periodic boundary conditions.

More generally, any second-order linear differential operator with appropriate boundary conditions that makes it self-adjoint generates a complete set of eigenfunctions, providing a basis for \( L^2 \) expansions. This principle underlies separation of variables solutions to PDEs: the solution is expanded in eigenfunctions of the spatial operator, with coefficients satisfying simple ODEs in time.

---

# Chapter 8: Fréchet and Gâteaux Derivatives

## Section 8.1: Differentiation in Banach Spaces

In finite-dimensional calculus, the derivative of a function \( F : \mathbb{R}^n \to \mathbb{R}^m \) at a point \( x \) is the best linear approximation to \( F \) near \( x \). Extending this concept to maps between Banach spaces requires care about the topology.

<div class="definition">
<strong>Definition (Fréchet Derivative).</strong> Let <em>X, Y</em> be Banach spaces and <em>F : U &sube; X &to; Y</em> where <em>U</em> is open. <em>F</em> is <strong>Fréchet differentiable</strong> at <em>x &isin; U</em> if there exists a bounded linear operator <em>DF(x) : X &to; Y</em> such that

\[
\lim_{\|h\|_X \to 0} \frac{\|F(x+h) - F(x) - DF(x)h\|_Y}{\|h\|_X} = 0.
\]

The operator <em>DF(x)</em> is called the <strong>Fréchet derivative</strong> of <em>F</em> at <em>x</em>.
</div>

The Fréchet derivative, when it exists, is unique (by a standard uniqueness argument via the difference of two derivatives). Fréchet differentiability is the "right" notion because it implies continuity of \( F \) at \( x \) and is preserved under composition.

The weaker **Gâteaux derivative** requires only the existence of directional derivatives:

<div class="definition">
<strong>Definition (Gâteaux Derivative).</strong> <em>F : U &sube; X &to; Y</em> is <strong>Gâteaux differentiable</strong> at <em>x</em> in direction <em>h &isin; X</em> if

\[
\delta F(x; h) = \lim_{t \to 0} \frac{F(x+th) - F(x)}{t}
\]

exists. If <em>h &mapsto; &delta;F(x; h)</em> is a bounded linear map from <em>X</em> to <em>Y</em>, we write <em>dF(x)h = &delta;F(x;h)</em> and call <em>dF(x)</em> the <strong>Gâteaux derivative</strong>.
</div>

Fréchet differentiability implies Gâteaux differentiability with \( dF(x) = DF(x) \). The converse fails in general: a function can be Gâteaux differentiable in all directions with a linear \( dF(x) \), yet fail to be Fréchet differentiable (the remainder may not be uniform in direction). However, if the Gâteaux derivative \( dF(x) \) exists in a neighborhood of \( x \) and \( x \mapsto dF(x) \in \mathcal{L}(X,Y) \) is continuous at \( x \), then \( F \) is Fréchet differentiable at \( x \) with \( DF(x) = dF(x) \).

## Section 8.2: Examples of Fréchet Derivatives

**Example 1: Nonlinear operator on \( L^2 \).** Let \( g : \mathbb{R} \to \mathbb{R} \) be continuously differentiable with bounded derivative, and define \( F : L^2(\Omega) \to L^2(\Omega) \) by \( (F(u))(x) = g(u(x)) \). The Fréchet derivative is the multiplication operator

\[
DF(u)h = g'(u(\cdot)) h(\cdot),
\]

i.e., \( (DF(u)h)(x) = g'(u(x))h(x) \). To verify: \( \|F(u+h) - F(u) - DF(u)h\|_{L^2}^2 = \int |g(u+h) - g(u) - g'(u)h|^2 \). By the mean value theorem, this integrand is \( o(|h(x)|^2) \) pointwise, and for bounded \( g' \) a dominated convergence argument shows the ratio \( \|F(u+h)-F(u)-DF(u)h\|_{L^2}/\|h\|_{L^2} \to 0 \).

**Example 2: Integral functional.** Let \( J : H_0^1(\Omega) \to \mathbb{R} \) be the energy functional

\[
J(u) = \frac{1}{2}\int_\Omega |\nabla u|^2 \, dx - \int_\Omega f u \, dx.
\]

The Gâteaux derivative of \( J \) at \( u \) in direction \( v \) is

\[
dJ(u)v = \int_\Omega \nabla u \cdot \nabla v \, dx - \int_\Omega fv \, dx.
\]

Setting \( dJ(u)v = 0 \) for all \( v \in H_0^1(\Omega) \) gives the weak form \( \int \nabla u \cdot \nabla v = \int fv \), i.e., \( -\Delta u = f \) weakly. The critical points of \( J \) are precisely the weak solutions to Poisson's equation.

## Section 8.3: Chain Rule and Higher Derivatives

<div class="theorem">
<strong>Theorem (Chain Rule).</strong> Let <em>X, Y, Z</em> be Banach spaces, <em>F : U &sube; X &to; Y</em> Fréchet differentiable at <em>x</em>, and <em>G : V &sube; Y &to; Z</em> Fréchet differentiable at <em>F(x)</em> (where <em>F(U) &sube; V</em>). Then <em>G &circ; F</em> is Fréchet differentiable at <em>x</em> with

\[
D(G \circ F)(x) = DG(F(x)) \circ DF(x).
\]
</div>

The proof mirrors the finite-dimensional chain rule: write \( G(F(x+h)) - G(F(x)) = DG(F(x))[F(x+h)-F(x)] + r_G \) where \( r_G = o(\|F(x+h)-F(x)\|_Y) \). Substituting \( F(x+h) - F(x) = DF(x)h + r_F \) with \( r_F = o(\|h\|_X) \), and estimating \( \|r_G\| \leq \|DG(F(x))\|\|r_F\| + o(\|r_F\|) = o(\|h\|_X) \) gives the result.

**Higher derivatives.** The \( k \)-th Fréchet derivative \( D^k F(x) \), if it exists, is a bounded \( k \)-linear map from \( X^k \) to \( Y \). For \( k = 2 \), \( D^2 F(x) : X \times X \to Y \) is bilinear and symmetric: \( D^2 F(x)(h_1, h_2) = D^2 F(x)(h_2, h_1) \). This is the Banach-space analogue of the Hessian.

**Taylor's theorem.** If \( F : U \to Y \) is \( (k+1) \)-times Fréchet differentiable, then

\[
F(x+h) = F(x) + DF(x)h + \frac{1}{2!}D^2F(x)(h,h) + \cdots + \frac{1}{k!}D^kF(x)(h,\ldots,h) + R_k(x,h),
\]

where \( \|R_k(x,h)\|_Y = o(\|h\|_X^k) \) as \( \|h\|_X \to 0 \).

## Section 8.4: Implicit Function Theorem in Banach Spaces

<div class="theorem">
<strong>Theorem (Implicit Function Theorem).</strong> Let <em>X, Y, Z</em> be Banach spaces, <em>F : U &sube; X &times; Y &to; Z</em> continuously Fréchet differentiable on an open set <em>U</em>, and let <em>(x<sub>0</sub>, y<sub>0</sub>) &isin; U</em> satisfy <em>F(x<sub>0</sub>, y<sub>0</sub>) = 0</em>. If the partial Fréchet derivative <em>D<sub>y</sub>F(x<sub>0</sub>, y<sub>0</sub>) : Y &to; Z</em> is a bounded isomorphism (i.e., bijective with bounded inverse), then there exist open neighborhoods <em>V &ni; x<sub>0</sub></em> and <em>W &ni; y<sub>0</sub></em> and a continuously Fréchet differentiable map <em>&phi; : V &to; W</em> such that

\[
F(x, \phi(x)) = 0 \quad \text{for all } x \in V,
\]

and <em>\{(x,y) &isin; V &times; W : F(x,y) = 0\} = \{(x, &phi;(x)) : x &isin; V\}</em>.
</div>

The proof is a direct application of the Banach contraction mapping principle: for fixed \( x \), the equation \( F(x,y) = 0 \) is rewritten as a fixed-point problem for \( y \), and the contraction constant is controlled by the invertibility of \( D_y F(x_0, y_0) \) and the continuity of the Fréchet derivative.

## Section 8.5: Application to Calculus of Variations

The calculus of variations seeks to minimize or find critical points of **functionals** of the form

\[
J(u) = \int_a^b L(x, u(x), u'(x)) \, dx,
\]

where \( L : [a,b] \times \mathbb{R} \times \mathbb{R} \to \mathbb{R} \) is the **Lagrangian** and the domain is \( X = \{u \in C^2([a,b]) : u(a) = u_0, u(b) = u_1\} \) (or an appropriate Sobolev space). The Fréchet framework clarifies the derivation of the Euler-Lagrange equations.

Consider \( J : H_0^1(a,b) \to \mathbb{R} \) for the case \( u(a) = u(b) = 0 \) (zero boundary conditions). The Gâteaux derivative is computed by differentiating \( t \mapsto J(u + tv) \) at \( t = 0 \):

\[
dJ(u)v = \frac{d}{dt}\bigg|_{t=0} \int_a^b L(x, u+tv, u'+tv') \, dx = \int_a^b \left(L_u(x,u,u')v + L_{u'}(x,u,u')v'\right) dx.
\]

Integrating by parts (using \( v(a) = v(b) = 0 \)):

\[
dJ(u)v = \int_a^b \left(L_u - \frac{d}{dx}L_{u'}\right)v \, dx.
\]

Setting \( dJ(u)v = 0 \) for all \( v \in H_0^1(a,b) \) and applying the fundamental lemma of the calculus of variations yields the **Euler-Lagrange equation**:

\[
L_u(x,u,u') - \frac{d}{dx}L_{u'}(x,u,u') = 0.
\]

This derivation shows that the Euler-Lagrange equation is precisely the condition that the Gâteaux derivative of \( J \) vanishes, i.e., that \( u \) is a critical point of \( J \) in \( H_0^1 \). For the special case \( L(x,u,u') = \frac{1}{2}|u'|^2 - f(x)u \), the Euler-Lagrange equation is \( -u'' = f \), i.e., Poisson's equation.

**Second variation and minimizers.** The second Fréchet derivative \( D^2J(u) \) is a bounded bilinear form on \( H_0^1 \). If \( D^2J(u) \) is coercive (positive definite as a bilinear form), then \( u \) is a local minimizer. This is the Banach-space analogue of the second-order sufficient condition in finite-dimensional optimization.

---

# Chapter 9: Applications and Connections

## Section 9.1: Weak Formulations of Elliptic PDEs

The framework developed in the preceding chapters — Sobolev spaces, the Lax-Milgram theorem, Galerkin methods — provides a complete and rigorous treatment of second-order linear elliptic PDEs. We summarize the general second-order problem.

Consider the operator \( Lu = -\sum_{i,j} \partial_i(a_{ij}\partial_j u) + \sum_i b_i \partial_i u + cu \) on \( \Omega \). Under appropriate assumptions (boundedness of coefficients, ellipticity \( \sum_{i,j}a_{ij}\xi_i\xi_j \geq \theta|\xi|^2 \), and smallness of lower-order terms), the bilinear form \( a(u,v) = \int_\Omega (a_{ij}\partial_j u \partial_i v + b_i (\partial_i u)v + cuv) \) is bounded and satisfies a Gårding inequality:

\[
a(u,u) \geq \alpha\|u\|_{H^1}^2 - \beta\|u\|_{L^2}^2 \quad (\alpha > 0, \beta \geq 0).
\]

If \( \beta = 0 \) (or with a spectral shift), Lax-Milgram applies and gives a unique weak solution \( u \in H_0^1(\Omega) \) for any \( f \in H^{-1}(\Omega) = (H_0^1(\Omega))^* \).

**Elliptic regularity** then provides the upgrade: if the coefficients and boundary are smooth, then \( f \in H^{k}(\Omega) \) implies \( u \in H^{k+2}(\Omega) \), and for smooth enough data, the weak solution is a classical \( C^2 \) solution. This "bootstrapping" of regularity uses the Sobolev embedding theorem: once enough \( H^k \) regularity is established, the embedding \( H^k \hookrightarrow C^{0,\gamma} \) gives pointwise properties.

## Section 9.2: Nonlinear PDEs via Fixed Points

Many nonlinear elliptic problems can be analyzed via the Schauder fixed-point theorem. Consider

\[
-\Delta u = f(x, u) \text{ in } \Omega, \quad u = 0 \text{ on } \partial\Omega,
\]

where \( f : \Omega \times \mathbb{R} \to \mathbb{R} \) is a Carathéodory function with \( |f(x,s)| \leq a(x) + b|s|^r \) for some \( r < (n+2)/(n-2) \) (subcritical growth).

Define the solution operator: for fixed \( v \in L^{2n/(n-2)}(\Omega) \), the linear problem \( -\Delta w = f(x,v) \) has a unique solution \( w = (-\Delta)^{-1}(f(\cdot,v)) \in H_0^1(\Omega) \). By subcritical growth and the Sobolev embedding, the map \( T : v \mapsto w \) maps a ball in \( L^{2n/(n-2)} \) to itself and is compact (by Rellich-Kondrachov). The Schauder theorem yields a fixed point \( u = Tu \), which is a weak solution.

## Section 9.3: Approximation Theory and Kernel Methods

RKHS theory connects functional analysis to approximation theory. Given a continuous kernel \( K \) and data \( (x_i, y_i)_{i=1}^n \), the regularized least squares problem

\[
\min_{f \in H_K} \frac{1}{n}\sum_{i=1}^n (f(x_i) - y_i)^2 + \lambda\|f\|_{H_K}^2
\]

has a unique minimizer by the strict convexity and coercivity of the objective functional (the Fréchet derivative argument shows the functional is strongly convex on \( H_K \)). The representer theorem gives explicit form, and convergence theory (learning rates) is governed by the approximation power of \( H_K \) and the eigenvalue decay of the kernel operator.

In this sense, the three threads of the course — Sobolev spaces, spectral theory, and RKHS — converge: the Matérn kernel connects RKHS to Sobolev spaces; the Mercer eigenvalues are spectral data of a compact operator; and the Lax-Milgram/Galerkin framework provides the functional-analytic machinery to study approximation error.

## Section 9.4: Numerical Linear Algebra

Operator-theoretic ideas from functional analysis underlie several fundamental algorithms in numerical linear algebra.

**Conjugate gradient method.** The CG method for solving \( Au = f \) (with \( A \) symmetric positive definite) is precisely the Galerkin method applied in the Krylov subspace \( K_k = \mathrm{span}\{f, Af, A^2f, \ldots, A^{k-1}f\} \). Céa's lemma, applied with the \( A \)-inner product \( \langle u, v\rangle_A = \langle Au, v\rangle \), gives

\[
\|u - u_k\|_A \leq \min_{p \in \mathcal{P}_k, p(0)=1} \max_{\lambda \in \sigma(A)} |p(\lambda)| \cdot \|u - u_0\|_A,
\]

where the minimum is over polynomials of degree \( k \) with \( p(0) = 1 \). This reduces convergence analysis to a polynomial approximation problem on the spectrum of \( A \), linking spectral theory directly to algorithmic performance.

**Preconditioning.** The condition number \( \kappa(A) = \lambda_{\max}/\lambda_{\min} \) governs CG convergence. A preconditioner \( P \approx A^{-1/2} \) transforms the problem to \( PAP \cdot (P^{-1}u) = Pf \), reducing the condition number. Functionally, this amounts to changing the Hilbert space norm — the Sobolev norm rather than the \( L^2 \) norm — and the theory of Sobolev preconditioning (using the Laplacian as a preconditioner for elliptic problems) is a direct application of Sobolev space theory.

---

## Summary and Perspective

Applied functional analysis weaves together several strands of modern mathematics and provides the rigorous foundation for large parts of applied mathematics, from PDE theory to machine learning. The progression through the course follows a natural arc.

The \( L^p \) spaces, developed in Chapter 1, provide the correct function spaces for integration theory, replacing pointwise convergence with \( L^p \) convergence. Sobolev spaces, Chapter 2, add differentiability to the \( L^p \) framework, enabling weak solutions to PDEs. The embedding theorems quantify the regularity gained by having derivatives in \( L^p \), and the Poincaré inequality anchors the spectral gap.

Fixed-point theorems, Chapter 3, provide existence proofs for both ODEs (Picard-Lindelöf) and nonlinear PDEs (Schauder), while the Lax-Milgram theorem, Chapter 4, gives a complete well-posedness theory for linear elliptic problems via bilinear forms and their coercivity. Céa's lemma then converts this to convergence theory for finite element methods.

Spectral theory, Chapter 5, extends the classical eigenvalue decomposition to operators on infinite-dimensional spaces. Sturm-Liouville theory provides the canonical example of a complete eigenfunction system arising from an ODE boundary value problem, and the spectral theorem for unbounded self-adjoint operators — applied via the functional calculus — is the mathematical language of quantum mechanics and semigroup theory.

Reproducing kernel Hilbert spaces, Chapter 6, bridge classical analysis with modern machine learning. The Moore-Aronszajn theorem establishes a precise duality between kernels and function spaces, Mercer's theorem connects this to spectral theory, and the representer theorem reduces infinite-dimensional optimization to finite-dimensional linear algebra.

Finally, the Fréchet derivative, Chapter 8, provides the calculus of infinite-dimensional spaces. It unifies the Euler-Lagrange equations of classical mechanics, the implicit function theorem for nonlinear equations, and the sensitivity analysis of optimization problems, completing the applied functional analyst's toolkit.
