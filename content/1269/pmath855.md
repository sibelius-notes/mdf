---
why: |
  Microlocal analysis is the modern language of linear PDE and mathematical physics, yet it sits in an awkward gap: too advanced for a standard PDE course, rarely taught as a standalone subject. The phase-space perspective it introduces is indispensable for anyone doing analysis.
made_up: true
title: "PMATH 855: Microlocal Analysis"
subjects: "PMATH"
---

*These notes synthesize material from L. Hörmander's The Analysis of Linear Partial Differential Operators, A. Grigis and J. Sjöstrand's Microlocal Analysis for Differential Operators, M. Zworski's Semiclassical Analysis, and M.E. Taylor's Pseudodifferential Operators, enriched with material from MIT OCW 18.157 (R. Melrose) and S. Dyatlov's lecture notes.*

## Chapter 1: Distributions and Sobolev Spaces

The modern theory of partial differential equations rests on a broadened notion of "function" that permits differentiation of objects far more irregular than anything classical analysis can handle. Laurent Schwartz's theory of distributions, developed in the late 1940s, provided the rigorous framework for this program. In this opening chapter, we set up the functional-analytic foundations: the spaces of test functions, distributions, tempered distributions, and the Sobolev spaces that measure regularity in a quantitative way. These tools are indispensable for everything that follows.

### 1.1 Test Functions and Distributions

We begin with the space of test functions and the distributions that act on them.

<div class="definition">
<strong>Definition 1.1.1 (Test Function Space).</strong> Let \(\Omega \subseteq \mathbb{R}^n\) be open. The space \(C_c^\infty(\Omega)\), also denoted \(\mathcal{D}(\Omega)\), consists of all infinitely differentiable functions \(\varphi : \Omega \to \mathbb{C}\) with compact support in \(\Omega\). We equip \(\mathcal{D}(\Omega)\) with the following topology: a sequence \(\varphi_j \to \varphi\) in \(\mathcal{D}(\Omega)\) if and only if there exists a compact set \(K \subset \Omega\) with \(\operatorname{supp} \varphi_j \subseteq K\) for all \(j\), and \(\partial^\alpha \varphi_j \to \partial^\alpha \varphi\) uniformly on \(K\) for every multi-index \(\alpha\).
</div>

This topology makes \(\mathcal{D}(\Omega)\) into a locally convex topological vector space, though not a Fréchet space (it is an LF-space, i.e., a strict inductive limit of Fréchet spaces). The precise topological structure, while important for the general theory, will mostly stay in the background; what matters for us is the notion of convergence described above.

<div class="definition">
<strong>Definition 1.1.2 (Distributions).</strong> A <em>distribution</em> on \(\Omega\) is a continuous linear functional \(u : \mathcal{D}(\Omega) \to \mathbb{C}\). The space of all distributions on \(\Omega\) is denoted \(\mathcal{D}'(\Omega)\). Continuity means that if \(\varphi_j \to \varphi\) in \(\mathcal{D}(\Omega)\), then \(\langle u, \varphi_j \rangle \to \langle u, \varphi \rangle\) in \(\mathbb{C}\).
</div>

<div class="example">
<strong>Example 1.1.3.</strong> Every locally integrable function \(f \in L^1_{\mathrm{loc}}(\Omega)\) defines a distribution via

\[
\langle u_f, \varphi \rangle = \int_\Omega f(x) \varphi(x) \, dx, \quad \varphi \in \mathcal{D}(\Omega).
\]
The map \(f \mapsto u_f\) is injective (by the du Bois-Reymond lemma), so we identify \(L^1_{\mathrm{loc}}(\Omega)\) with a subspace of \(\mathcal{D}'(\Omega)\). Distributions that arise this way are called <em>regular</em>.
</div>

<div class="example">
<strong>Example 1.1.4 (Dirac Delta).</strong> For \(x_0 \in \Omega\), the Dirac delta at \(x_0\) is the distribution defined by

\[
\langle \delta_{x_0}, \varphi \rangle = \varphi(x_0).
\]
This is not a regular distribution: there is no locally integrable function \(f\) such that \(\int f \varphi \, dx = \varphi(x_0)\) for all \(\varphi \in \mathcal{D}(\Omega)\).
</div>

<div class="example">
<strong>Example 1.1.5 (Principal Value).</strong> The principal value distribution on \(\mathbb{R}\) is defined by

\[
\langle \mathrm{p.v.}\tfrac{1}{x}, \varphi \rangle = \lim_{\varepsilon \to 0^+} \int_{|x| > \varepsilon} \frac{\varphi(x)}{x} \, dx.
\]
One verifies that this limit exists for every \(\varphi \in \mathcal{D}(\mathbb{R})\) and defines a continuous linear functional.
</div>

### 1.2 Operations on Distributions

The power of distribution theory lies in the ability to extend classical operations — differentiation, multiplication by smooth functions, convolution — to this enlarged setting.

<div class="definition">
<strong>Definition 1.2.1 (Derivative of a Distribution).</strong> If \(u \in \mathcal{D}'(\Omega)\) and \(\alpha\) is a multi-index, the distributional derivative \(\partial^\alpha u\) is defined by

\[
\langle \partial^\alpha u, \varphi \rangle = (-1)^{|\alpha|} \langle u, \partial^\alpha \varphi \rangle, \quad \varphi \in \mathcal{D}(\Omega).
\]
</div>

This definition is motivated by integration by parts: if \(u\) is smooth with compact support, the formula above holds with equality. The key observation is that every distribution is infinitely differentiable in the distributional sense.

<div class="example">
<strong>Example 1.2.2.</strong> On \(\mathbb{R}\), the Heaviside function \(H(x) = \mathbf{1}_{[0,\infty)}(x)\) has distributional derivative \(H' = \delta_0\). Indeed, for \(\varphi \in \mathcal{D}(\mathbb{R})\),

\[
\langle H', \varphi \rangle = -\langle H, \varphi' \rangle = -\int_0^\infty \varphi'(x) \, dx = \varphi(0) = \langle \delta_0, \varphi \rangle.
\]
</div>

<div class="definition">
<strong>Definition 1.2.3 (Multiplication by Smooth Functions).</strong> If \(u \in \mathcal{D}'(\Omega)\) and \(a \in C^\infty(\Omega)\), then \(au \in \mathcal{D}'(\Omega)\) is defined by

\[
\langle au, \varphi \rangle = \langle u, a\varphi \rangle, \quad \varphi \in \mathcal{D}(\Omega).
\]
</div>

<div class="remark">
<strong>Remark 1.2.4.</strong> It is in general <em>not</em> possible to multiply two arbitrary distributions. This fundamental obstruction, formalized by Schwartz's impossibility result, is one of the motivations for microlocal analysis: the wavefront set will tell us precisely when multiplication of distributions is well-defined.
</div>

<div class="definition">
<strong>Definition 1.2.5 (Convolution).</strong> If \(u \in \mathcal{D}'(\mathbb{R}^n)\) and \(\varphi \in \mathcal{D}(\mathbb{R}^n)\), the convolution \(u * \varphi\) is the smooth function

\[
(u * \varphi)(x) = \langle u, \varphi(x - \cdot) \rangle.
\]
More generally, if \(u \in \mathcal{E}'(\mathbb{R}^n)\) (compactly supported distribution) and \(v \in \mathcal{D}'(\mathbb{R}^n)\), the convolution \(u * v \in \mathcal{D}'(\mathbb{R}^n)\) is defined by

\[
\langle u * v, \varphi \rangle = \langle u_x, \langle v_y, \varphi(x+y) \rangle \rangle.
\]
</div>

<div class="proposition">
<strong>Proposition 1.2.6 (Regularization).</strong> Let \(\rho \in \mathcal{D}(\mathbb{R}^n)\) with \(\int \rho = 1\), and set \(\rho_\varepsilon(x) = \varepsilon^{-n}\rho(x/\varepsilon)\). If \(u \in \mathcal{D}'(\mathbb{R}^n)\), then \(u * \rho_\varepsilon \to u\) in \(\mathcal{D}'(\mathbb{R}^n)\) as \(\varepsilon \to 0\).
</div>

### 1.3 Tempered Distributions and the Fourier Transform

To develop Fourier analysis in the distributional setting, we need a space of distributions adapted to the Fourier transform. This is the space of tempered distributions, introduced by Schwartz precisely for this purpose.

<div class="definition">
<strong>Definition 1.3.1 (Schwartz Space).</strong> The <em>Schwartz space</em> \(\mathcal{S}(\mathbb{R}^n)\) consists of all \(\varphi \in C^\infty(\mathbb{R}^n)\) such that

\[
\|\varphi\|_{\alpha,\beta} := \sup_{x \in \mathbb{R}^n} |x^\alpha \partial^\beta \varphi(x)| < \infty
\]
for all multi-indices \(\alpha, \beta\). The topology is generated by the family of seminorms \(\|\cdot\|_{\alpha,\beta}\), making \(\mathcal{S}(\mathbb{R}^n)\) a Fréchet space.
</div>

<div class="definition">
<strong>Definition 1.3.2 (Tempered Distributions).</strong> A <em>tempered distribution</em> is a continuous linear functional on \(\mathcal{S}(\mathbb{R}^n)\). The space of tempered distributions is denoted \(\mathcal{S}'(\mathbb{R}^n)\). We have the continuous inclusions

\[
\mathcal{D}(\mathbb{R}^n) \hookrightarrow \mathcal{S}(\mathbb{R}^n) \hookrightarrow \mathcal{S}'(\mathbb{R}^n) \hookrightarrow \mathcal{D}'(\mathbb{R}^n).
\]
</div>

<div class="definition">
<strong>Definition 1.3.3 (Fourier Transform).</strong> For \(\varphi \in \mathcal{S}(\mathbb{R}^n)\), the Fourier transform is

\[
\hat{\varphi}(\xi) = \mathcal{F}\varphi(\xi) = \int_{\mathbb{R}^n} e^{-i x \cdot \xi} \varphi(x) \, dx.
\]
The inverse Fourier transform is

\[
\mathcal{F}^{-1}\psi(x) = (2\pi)^{-n} \int_{\mathbb{R}^n} e^{i x \cdot \xi} \psi(\xi) \, d\xi.
\]
</div>

<div class="theorem">
<strong>Theorem 1.3.4 (Fourier Transform on \(\mathcal{S}\)).</strong> The Fourier transform \(\mathcal{F} : \mathcal{S}(\mathbb{R}^n) \to \mathcal{S}(\mathbb{R}^n)\) is a topological isomorphism with inverse \(\mathcal{F}^{-1}\). Moreover:
<br>(i) \(\mathcal{F}(\partial^\alpha \varphi)(\xi) = (i\xi)^\alpha \hat{\varphi}(\xi)\),
<br>(ii) \(\mathcal{F}(x^\alpha \varphi)(\xi) = (i\partial_\xi)^\alpha \hat{\varphi}(\xi)\),
<br>(iii) \(\mathcal{F}(\varphi * \psi) = \hat{\varphi} \cdot \hat{\psi}\),
<br>(iv) (Parseval) \(\int \hat{\varphi} \overline{\hat{\psi}} \, d\xi = (2\pi)^n \int \varphi \overline{\psi} \, dx\).
</div>

<div class="definition">
<strong>Definition 1.3.5 (Fourier Transform of Tempered Distributions).</strong> For \(u \in \mathcal{S}'(\mathbb{R}^n)\), the Fourier transform \(\hat{u} \in \mathcal{S}'(\mathbb{R}^n)\) is defined by

\[
\langle \hat{u}, \varphi \rangle = \langle u, \hat{\varphi} \rangle, \quad \varphi \in \mathcal{S}(\mathbb{R}^n).
\]
</div>

<div class="example">
<strong>Example 1.3.6.</strong> The Fourier transform of \(\delta_0\) is the constant function \(1\):

\[
\langle \hat{\delta}_0, \varphi \rangle = \langle \delta_0, \hat{\varphi} \rangle = \hat{\varphi}(0) = \int \varphi(x) \, dx = \langle 1, \varphi \rangle.
\]
Conversely, \(\hat{1} = (2\pi)^n \delta_0\).
</div>

### 1.4 Sobolev Spaces

Sobolev spaces provide the quantitative framework for measuring regularity of distributions. They are the natural \(L^2\)-based function spaces in which to study elliptic and more general PDE.

<div class="definition">
<strong>Definition 1.4.1 (Sobolev Spaces via Fourier Transform).</strong> For \(s \in \mathbb{R}\), the Sobolev space \(H^s(\mathbb{R}^n)\) consists of all \(u \in \mathcal{S}'(\mathbb{R}^n)\) such that

\[
\|u\|_{H^s}^2 := \int_{\mathbb{R}^n} (1 + |\xi|^2)^s |\hat{u}(\xi)|^2 \, d\xi < \infty.
\]
We write \(\langle \xi \rangle = (1 + |\xi|^2)^{1/2}\), so the norm becomes \(\|u\|_{H^s} = \|\langle \xi \rangle^s \hat{u}\|_{L^2}\).
</div>

<div class="remark">
<strong>Remark 1.4.2.</strong> For non-negative integers \(s = k\), \(H^k(\mathbb{R}^n)\) coincides with the space of \(L^2\) functions whose distributional derivatives up to order \(k\) are in \(L^2\), with equivalent norms. For negative \(s\), \(H^s(\mathbb{R}^n)\) contains genuine distributions. For instance, \(\delta_0 \in H^s(\mathbb{R}^n)\) if and only if \(s < -n/2\).
</div>

<div class="proposition">
<strong>Proposition 1.4.3 (Basic Properties).</strong>
<br>(i) \(H^s(\mathbb{R}^n)\) is a Hilbert space with inner product \(\langle u, v \rangle_{H^s} = \int \langle \xi \rangle^{2s} \hat{u}(\xi) \overline{\hat{v}(\xi)} \, d\xi\).
<br>(ii) If \(s > t\), then \(H^s(\mathbb{R}^n) \hookrightarrow H^t(\mathbb{R}^n)\) with continuous inclusion.
<br>(iii) \(\mathcal{S}(\mathbb{R}^n)\) is dense in \(H^s(\mathbb{R}^n)\) for every \(s \in \mathbb{R}\).
<br>(iv) The dual of \(H^s(\mathbb{R}^n)\) is isometrically isomorphic to \(H^{-s}(\mathbb{R}^n)\).
</div>

<div class="definition">
<strong>Definition 1.4.4 (Sobolev Spaces on Domains).</strong> For an open set \(\Omega \subseteq \mathbb{R}^n\), we define:
<br>(i) \(H^s(\Omega) = \{ u|_\Omega : u \in H^s(\mathbb{R}^n) \}\) with the quotient norm,
<br>(ii) \(H^s_0(\Omega)\) as the closure of \(C_c^\infty(\Omega)\) in \(H^s(\Omega)\).
</div>

### 1.5 Sobolev Embedding Theorems

The embedding theorems relate Sobolev regularity to classical regularity. They are among the most frequently used results in PDE theory.

<div class="theorem">
<strong>Theorem 1.5.1 (Sobolev Embedding).</strong> If \(s > n/2 + k\) for a non-negative integer \(k\), then \(H^s(\mathbb{R}^n) \hookrightarrow C^k_b(\mathbb{R}^n)\) (bounded continuous functions with bounded derivatives up to order \(k\)), and the embedding is continuous:

\[
\|\partial^\alpha u\|_{L^\infty} \leq C_{s,n} \|u\|_{H^s}, \quad |\alpha| \leq k.
\]
In particular, \(\bigcap_{s \in \mathbb{R}} H^s(\mathbb{R}^n) = \mathcal{S}(\mathbb{R}^n)\) (as sets, though the topologies differ).
</div>

<div class="proof">
<strong>Proof.</strong> For \(|\alpha| \leq k\) and \(u \in \mathcal{S}(\mathbb{R}^n)\),

\[
\partial^\alpha u(x) = (2\pi)^{-n} \int e^{ix \cdot \xi} (i\xi)^\alpha \hat{u}(\xi) \, d\xi.
\]
By the Cauchy-Schwarz inequality,

\[
|\partial^\alpha u(x)| \leq (2\pi)^{-n} \int |\xi^\alpha| |\hat{u}(\xi)| \, d\xi = (2\pi)^{-n} \int \frac{|\xi^\alpha|}{\langle \xi \rangle^s} \cdot \langle \xi \rangle^s |\hat{u}(\xi)| \, d\xi
\]

\[
\leq (2\pi)^{-n} \left(\int \frac{|\xi|^{2k}}{\langle \xi \rangle^{2s}} \, d\xi\right)^{1/2} \|u\|_{H^s}.
\]
The first integral is finite precisely when \(2s - 2k > n\), i.e., \(s > n/2 + k\). The result extends from \(\mathcal{S}\) to \(H^s\) by density. \(\blacksquare\)
</div>

<div class="theorem">
<strong>Theorem 1.5.2 (Rellich-Kondrachov Compactness).</strong> Let \(\Omega \subset \mathbb{R}^n\) be a bounded open set with Lipschitz boundary. If \(s > t\), then the inclusion \(H^s(\Omega) \hookrightarrow H^t(\Omega)\) is compact.
</div>

This compactness result is fundamental for spectral theory of elliptic operators and will appear repeatedly in later chapters.

### 1.6 Trace Theorems

When studying boundary value problems, one needs to restrict Sobolev functions to lower-dimensional submanifolds. The trace theorems make this precise.

<div class="theorem">
<strong>Theorem 1.6.1 (Trace Theorem).</strong> Let \(\Omega \subset \mathbb{R}^n\) be a bounded open set with smooth boundary \(\partial\Omega\). For \(s > 1/2\), the restriction map \(\gamma_0 : C^\infty(\overline{\Omega}) \to C^\infty(\partial\Omega)\) defined by \(\gamma_0 u = u|_{\partial\Omega}\) extends to a continuous surjection

\[
\gamma_0 : H^s(\Omega) \to H^{s-1/2}(\partial\Omega),
\]
with a continuous right inverse (extension operator).
</div>

<div class="remark">
<strong>Remark 1.6.2.</strong> The loss of \(1/2\) derivative is sharp and cannot be improved. This is consistent with the heuristic that restricting to a codimension-\(k\) submanifold costs \(k/2\) derivatives in the \(L^2\)-based Sobolev scale.
</div>

### 1.7 Duality of Sobolev Spaces

<div class="theorem">
<strong>Theorem 1.7.1.</strong> The dual space of \(H^s_0(\Omega)\) is naturally identified with \(H^{-s}(\Omega)\), and the dual of \(H^s(\Omega)\) is identified with a space of distributions supported in \(\overline{\Omega}\). In the case \(\Omega = \mathbb{R}^n\), we have \((H^s(\mathbb{R}^n))' \cong H^{-s}(\mathbb{R}^n)\) with the duality pairing extending the \(L^2\) inner product.
</div>

These duality relations are essential for the weak formulation of PDE and for the theory of pseudodifferential operators on Sobolev spaces that we develop in Chapter 3.

---

## Chapter 2: The Fourier Transform and Symbol Classes

Having set up the distributional framework, we now turn to the algebraic and analytic machinery that underlies the theory of pseudodifferential operators. The key idea, pioneered by Kohn-Nirenberg (1965) and Hörmander (1965), is to associate to a linear operator a function of both position and frequency — its *symbol* — and to study the operator through the properties of this symbol. This chapter develops the symbol calculus that makes this program precise.

### 2.1 Oscillatory Integrals

Many of the integrals we encounter will not converge absolutely; they must be interpreted as *oscillatory integrals*, regularized by the rapid oscillation of the integrand.

<div class="definition">
<strong>Definition 2.1.1 (Oscillatory Integral).</strong> Let \(a(x,\xi) \in S^m_{1,0}(\mathbb{R}^n \times \mathbb{R}^n)\) (to be defined below) and \(\Phi(x,\xi)\) be a phase function. The oscillatory integral

\[
I(\varphi) = \int\!\!\!\int e^{i\Phi(x,\xi)} a(x,\xi) \varphi(x) \, dx \, d\xi
\]
is defined as the limit

\[
I(\varphi) = \lim_{\varepsilon \to 0} \int\!\!\!\int e^{i\Phi(x,\xi)} a(x,\xi) \chi(\varepsilon\xi) \varphi(x) \, dx \, d\xi,
\]
where \(\chi \in C_c^\infty(\mathbb{R}^n)\) with \(\chi(0) = 1\). The limit is independent of the choice of \(\chi\).
</div>

The independence of the cutoff function follows from integration by parts, exploiting the fact that the differential operator

\[
L = \frac{1 - i\xi \cdot \nabla_x \Phi}{|\nabla_x \Phi|^2 + |\xi|^2}(1 - \Delta_\xi)
\]
satisfies \(L^t(e^{i\Phi}) = e^{i\Phi}\) when the phase is non-degenerate, and repeated application of \(L^t\) to the amplitude \(a \cdot \chi(\varepsilon\xi) \cdot \varphi\) produces convergent integrals.

### 2.2 Symbol Classes

The symbol classes, introduced by Hörmander, provide the natural setting for the symbols of pseudodifferential operators.

<div class="definition">
<strong>Definition 2.2.1 (Symbol Classes \(S^m_{\rho,\delta}\)).</strong> Let \(m \in \mathbb{R}\) and \(0 \leq \delta \leq \rho \leq 1\). A smooth function \(a \in C^\infty(\mathbb{R}^n \times \mathbb{R}^n)\) belongs to the symbol class \(S^m_{\rho,\delta}(\mathbb{R}^n \times \mathbb{R}^n)\) if for all multi-indices \(\alpha, \beta\) there exists a constant \(C_{\alpha,\beta}\) such that

\[
|\partial_\xi^\alpha \partial_x^\beta a(x,\xi)| \leq C_{\alpha,\beta} \langle \xi \rangle^{m - \rho|\alpha| + \delta|\beta|}
\]
for all \(x, \xi \in \mathbb{R}^n\). We write \(S^m = S^m_{1,0}\) for the standard class and \(S^{-\infty} = \bigcap_m S^m\).
</div>

<div class="remark">
<strong>Remark 2.2.2.</strong> The condition \(\delta < \rho\) (or at least \(\delta \leq \rho\) with \(\delta < 1\)) is essential for a well-behaved calculus. The "forbidden" class \(S^m_{1,1}\) fails to give \(L^2\)-bounded operators even at order \(m = 0\), and its pseudodifferential calculus is fundamentally deficient. The standard classes \(S^m_{1,0}\) and the Weyl-Hörmander classes \(S^m_{1/2,1/2}\) are the most important in practice.
</div>

<div class="example">
<strong>Example 2.2.3.</strong> The function \(a(x,\xi) = \langle \xi \rangle^m = (1 + |\xi|^2)^{m/2}\) belongs to \(S^m_{1,0}\). More generally, if \(p(x,\xi)\) is a polynomial of degree \(m\) in \(\xi\) with smooth coefficients bounded along with all their derivatives, then \(p \in S^m_{1,0}\).
</div>

<div class="example">
<strong>Example 2.2.4.</strong> The symbol \(a(x,\xi) = |\xi|^2 + V(x)\), where \(V \in C^\infty_b(\mathbb{R}^n)\), belongs to \(S^2_{1,0}\). This is the symbol of the Schrödinger operator \(-\Delta + V(x)\).
</div>

### 2.3 Asymptotic Expansions

A central technique in the symbol calculus is the construction of symbols from asymptotic series.

<div class="definition">
<strong>Definition 2.3.1 (Asymptotic Expansion).</strong> Let \(a_j \in S^{m_j}_{\rho,\delta}\) with \(m_j \to -\infty\). We say that \(a \in S^{m_0}_{\rho,\delta}\) has the asymptotic expansion \(a \sim \sum_{j=0}^\infty a_j\) if for every \(N\),

\[
a - \sum_{j=0}^{N-1} a_j \in S^{m_N}_{\rho,\delta}.
\]
</div>

<div class="theorem">
<strong>Theorem 2.3.2 (Borel's Lemma for Symbols).</strong> Given \(a_j \in S^{m_j}_{\rho,\delta}\) with \(m_j \to -\infty\), there exists \(a \in S^{m_0}_{\rho,\delta}\) with \(a \sim \sum_j a_j\). The symbol \(a\) is unique modulo \(S^{-\infty}\).
</div>

<div class="proof">
<strong>Proof.</strong> Choose a cutoff \(\chi \in C^\infty(\mathbb{R}^n)\) with \(\chi(\xi) = 0\) for \(|\xi| \leq 1\) and \(\chi(\xi) = 1\) for \(|\xi| \geq 2\). Set

\[
a(x,\xi) = \sum_{j=0}^\infty \chi(\xi/R_j) a_j(x,\xi),
\]
where \(R_j\) is a sequence increasing sufficiently rapidly to \(\infty\). For \(|\xi| \leq R_j\), the \(j\)-th term vanishes, so the sum is locally finite and defines a smooth function. One verifies that for sufficiently rapidly growing \(R_j\), the tail \(\sum_{j \geq N} \chi(\xi/R_j) a_j\) belongs to \(S^{m_N}_{\rho,\delta}\). The uniqueness modulo \(S^{-\infty}\) is immediate from the definition. \(\blacksquare\)
</div>

### 2.4 Classical Symbols

Many operators arising in geometric and physical applications have symbols with a particularly nice structure.

<div class="definition">
<strong>Definition 2.4.1 (Classical Symbols).</strong> A symbol \(a \in S^m_{1,0}\) is <em>classical</em> (or <em>polyhomogeneous</em>) if it admits an asymptotic expansion \(a \sim \sum_{j=0}^\infty a_{m-j}\), where each \(a_{m-j}(x,\xi)\) is positively homogeneous of degree \(m-j\) in \(\xi\) for \(|\xi| \geq 1\):

\[
a_{m-j}(x, t\xi) = t^{m-j} a_{m-j}(x,\xi), \quad t \geq 1, \; |\xi| \geq 1.
\]
The leading term \(a_m\) is called the <em>principal symbol</em>.
</div>

<div class="example">
<strong>Example 2.4.2.</strong> The Laplacian \(\Delta = \sum_{j=1}^n \partial_{x_j}^2\) has symbol \(-|\xi|^2\), which is a classical symbol of order 2 with principal symbol \(\sigma_2(\Delta)(x,\xi) = -|\xi|^2\). More generally, any differential operator \(P = \sum_{|\alpha| \leq m} a_\alpha(x) D^\alpha\) (where \(D = -i\partial\)) has symbol \(p(x,\xi) = \sum_{|\alpha| \leq m} a_\alpha(x) \xi^\alpha\), which is a polynomial in \(\xi\) and hence classical.
</div>

### 2.5 The Schwartz Kernel Theorem

The Schwartz kernel theorem provides the bridge between operators and distributions, and is fundamental to the theory of integral operators.

<div class="theorem">
<strong>Theorem 2.5.1 (Schwartz Kernel Theorem).</strong> Every continuous linear operator \(A : \mathcal{D}(\Omega_2) \to \mathcal{D}'(\Omega_1)\) has a unique distribution kernel \(K_A \in \mathcal{D}'(\Omega_1 \times \Omega_2)\) such that

\[
\langle Au, v \rangle = \langle K_A, v \otimes u \rangle
\]
for all \(u \in \mathcal{D}(\Omega_2)\), \(v \in \mathcal{D}(\Omega_1)\). Conversely, every \(K \in \mathcal{D}'(\Omega_1 \times \Omega_2)\) defines such an operator.
</div>

<div class="remark">
<strong>Remark 2.5.2.</strong> The Schwartz kernel theorem is a deep result in functional analysis, relying on the nuclear structure of the spaces involved. It tells us that the study of linear operators is, in principle, reducible to the study of distributions on product spaces — a profound unification.
</div>

### 2.6 Fourier Integral Representation of Operators

We can now write down the general form of a pseudodifferential operator as a Fourier integral.

<div class="definition">
<strong>Definition 2.6.1.</strong> Given a symbol \(a \in S^m_{\rho,\delta}(\mathbb{R}^n \times \mathbb{R}^n)\), the associated operator \(\mathrm{Op}(a)\) (or \(a(x,D)\)) is defined by

\[
\mathrm{Op}(a)u(x) = (2\pi)^{-n} \int_{\mathbb{R}^n} e^{ix \cdot \xi} a(x,\xi) \hat{u}(\xi) \, d\xi
\]
for \(u \in \mathcal{S}(\mathbb{R}^n)\). Equivalently, using the Fourier inversion formula,

\[
\mathrm{Op}(a)u(x) = (2\pi)^{-n} \int\!\!\!\int e^{i(x-y) \cdot \xi} a(x,\xi) u(y) \, dy \, d\xi.
\]
The latter is an oscillatory integral.
</div>

<div class="remark">
<strong>Remark 2.6.2.</strong> This is the <em>Kohn-Nirenberg</em> (or <em>standard</em> or <em>left</em>) quantization. Other quantization schemes — notably the <em>Weyl quantization</em> \(\mathrm{Op}^w(a)\), where the symbol is evaluated at the midpoint \((x+y)/2\) rather than at \(x\) — will become important in Chapter 7 on semiclassical analysis.
</div>

---

## Chapter 3: Pseudodifferential Operators

Pseudodifferential operators (abbreviated \(\Psi\)DOs) generalize differential operators by allowing symbols that are not polynomial in \(\xi\). They were introduced in the 1960s by Kohn-Nirenberg, Hörmander, and others to provide a flexible algebraic framework for studying elliptic PDE. The fundamental insight is that the class of pseudodifferential operators is closed under composition, taking adjoints, and — crucially — taking parametrices (approximate inverses) of elliptic operators.

### 3.1 Definition and Basic Properties

<div class="definition">
<strong>Definition 3.1.1 (Pseudodifferential Operator).</strong> An operator \(A : \mathcal{S}(\mathbb{R}^n) \to \mathcal{S}'(\mathbb{R}^n)\) is a pseudodifferential operator of order \(m\) and type \((\rho,\delta)\) if it has the form

\[
Au(x) = \mathrm{Op}(a)u(x) = (2\pi)^{-n} \int\!\!\!\int e^{i(x-y)\cdot\xi} a(x,\xi) u(y) \, dy \, d\xi
\]
for some symbol \(a \in S^m_{\rho,\delta}\). We write \(A \in \Psi^m_{\rho,\delta}(\mathbb{R}^n)\), or simply \(A \in \Psi^m\) when \((\rho,\delta) = (1,0)\). The class \(\Psi^{-\infty} = \bigcap_m \Psi^m\) consists of <em>smoothing operators</em>.
</div>

<div class="proposition">
<strong>Proposition 3.1.2.</strong> Every \(A \in \Psi^{-\infty}(\mathbb{R}^n)\) has a Schwartz kernel \(K_A \in \mathcal{S}(\mathbb{R}^n \times \mathbb{R}^n)\); in particular, \(A\) maps \(\mathcal{S}'(\mathbb{R}^n) \to \mathcal{S}(\mathbb{R}^n)\). Conversely, any operator with Schwartz kernel in \(\mathcal{S}\) belongs to \(\Psi^{-\infty}\).
</div>

<div class="theorem">
<strong>Theorem 3.1.3 (Mapping Properties).</strong> If \(A \in \Psi^m_{\rho,\delta}(\mathbb{R}^n)\) with \(\delta < 1\), then:
<br>(i) \(A : \mathcal{S}(\mathbb{R}^n) \to \mathcal{S}(\mathbb{R}^n)\) is continuous.
<br>(ii) \(A\) extends to a continuous map \(A : \mathcal{S}'(\mathbb{R}^n) \to \mathcal{S}'(\mathbb{R}^n)\).
<br>(iii) \(A : H^s(\mathbb{R}^n) \to H^{s-m}(\mathbb{R}^n)\) is continuous for every \(s \in \mathbb{R}\).
</div>

Part (iii) says that a \(\Psi\)DO of order \(m\) "costs" exactly \(m\) derivatives in the Sobolev scale, which is the quantitative embodiment of the notion of order.

### 3.2 The Symbol Map

The assignment \(a \mapsto \mathrm{Op}(a)\) is not quite injective: two symbols that differ by an element of \(S^{-\infty}\) give rise to operators that differ by a smoothing operator. The quotient gives a well-defined map.

<div class="theorem">
<strong>Theorem 3.2.1 (Symbol Map).</strong> The map \(\sigma : \Psi^m_{\rho,\delta} / \Psi^{-\infty} \to S^m_{\rho,\delta} / S^{-\infty}\) that assigns to an operator its symbol class (modulo \(S^{-\infty}\)) is a well-defined isomorphism. The principal symbol \(\sigma_m(A) \in S^m / S^{m-(\rho-\delta)}\) is an invariantly defined function on \(T^*\mathbb{R}^n\) (or more generally on the cotangent bundle of a manifold).
</div>

### 3.3 Composition of Pseudodifferential Operators

The closure of the pseudodifferential calculus under composition is its most powerful algebraic property.

<div class="theorem">
<strong>Theorem 3.3.1 (Composition).</strong> Let \(A \in \Psi^{m_1}_{\rho,\delta}(\mathbb{R}^n)\) with symbol \(a\) and \(B \in \Psi^{m_2}_{\rho,\delta}(\mathbb{R}^n)\) with symbol \(b\), where \(\delta < \rho\). Then \(AB \in \Psi^{m_1+m_2}_{\rho,\delta}(\mathbb{R}^n)\) with symbol \(c \in S^{m_1+m_2}_{\rho,\delta}\) given by

\[
c(x,\xi) \sim \sum_\alpha \frac{1}{\alpha!} \partial_\xi^\alpha a(x,\xi) \cdot D_x^\alpha b(x,\xi).
\]
In particular, the principal symbol of the composition is the product of the principal symbols:

\[
\sigma_{m_1+m_2}(AB) = \sigma_{m_1}(A) \cdot \sigma_{m_2}(B).
\]
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> The Schwartz kernel of \(AB\) is

\[
K_{AB}(x,y) = \int K_A(x,z) K_B(z,y) \, dz.
\]
Substituting the oscillatory integral representations and performing a stationary phase expansion in the intermediate variable \(z\) yields the asymptotic formula. The key identity is

\[
e^{-iz \cdot \eta} a(x,\xi+\eta) = \sum_{|\alpha| < N} \frac{(-iz)^\alpha}{\alpha!} \partial_\xi^\alpha a(x,\xi) \cdot e^{-iz \cdot \eta} + r_N(x,z,\xi,\eta),
\]
applied via Taylor expansion. The remainder \(r_N\) contributes a term in \(S^{m_1+m_2-N(\rho-\delta)}\), which can be made arbitrarily negative. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark 3.3.2.</strong> The formula \(c \sim \sum_\alpha \frac{1}{\alpha!} \partial_\xi^\alpha a \cdot D_x^\alpha b\) is a generalization of the Leibniz rule. When \(a\) and \(b\) are polynomials in \(\xi\) (i.e., the operators are differential operators), the sum is finite and reduces to the usual composition of differential operators.
</div>

### 3.4 Adjoint

<div class="theorem">
<strong>Theorem 3.4.1 (Formal Adjoint).</strong> If \(A \in \Psi^m_{\rho,\delta}\) with symbol \(a\), then the formal \(L^2\)-adjoint \(A^*\) defined by \(\langle A^* u, v \rangle = \langle u, Av \rangle\) is a pseudodifferential operator \(A^* \in \Psi^m_{\rho,\delta}\) with symbol

\[
a^*(x,\xi) \sim \sum_\alpha \frac{1}{\alpha!} \partial_\xi^\alpha D_x^\alpha \overline{a(x,\xi)}.
\]
In particular, \(\sigma_m(A^*) = \overline{\sigma_m(A)}\).
</div>

<div class="corollary">
<strong>Corollary 3.4.2.</strong> The principal symbol of a formally self-adjoint pseudodifferential operator is real-valued.
</div>

### 3.5 Elliptic Operators and Parametrices

Ellipticity is the key condition that allows one to "invert" a pseudodifferential operator modulo smoothing errors.

<div class="definition">
<strong>Definition 3.5.1 (Ellipticity).</strong> An operator \(A \in \Psi^m_{\rho,\delta}\) with symbol \(a\) is <em>elliptic</em> if there exist constants \(C, R > 0\) such that

\[
|a(x,\xi)| \geq C \langle \xi \rangle^m, \quad |\xi| \geq R.
\]
Equivalently, the principal symbol \(\sigma_m(A)(x,\xi) \neq 0\) for all \(x \in \mathbb{R}^n\) and \(\xi \neq 0\).
</div>

<div class="example">
<strong>Example 3.5.2.</strong> The Laplacian \(\Delta\) has principal symbol \(-|\xi|^2\), which is elliptic. The operator \(I - \Delta\), with symbol \(1 + |\xi|^2\), is elliptic of order 2. The heat operator \(\partial_t - \Delta\), with symbol \(i\tau - |\xi|^2\) on \(\mathbb{R}^{n+1}\), is <em>not</em> elliptic (it vanishes when \(\tau = 0\) and \(\xi = 0\) in a degenerate way as a function on \(\mathbb{R}^{n+1}\)).
</div>

<div class="theorem">
<strong>Theorem 3.5.3 (Parametrix Construction).</strong> Let \(A \in \Psi^m_{\rho,\delta}\) be elliptic with \(\delta < \rho\). Then there exists \(B \in \Psi^{-m}_{\rho,\delta}\) such that

\[
AB = I + R_1, \quad BA = I + R_2,
\]
where \(R_1, R_2 \in \Psi^{-\infty}\) are smoothing operators. The operator \(B\) is called a <em>parametrix</em> for \(A\).
</div>

<div class="proof">
<strong>Proof.</strong> We construct the symbol \(b\) of \(B\) by solving the asymptotic equation \(a \# b \sim 1\), where \(\#\) denotes the composition of symbols. Set \(b_0(x,\xi) = \chi(\xi) / a(x,\xi)\), where \(\chi \in C^\infty\) is a cutoff vanishing near the origin and equal to 1 for \(|\xi| \geq R\). Then \(b_0 \in S^{-m}_{\rho,\delta}\), and \(a \# b_0 = 1 + r_1\) with \(r_1 \in S^{-(\rho-\delta)}_{\rho,\delta}\).

We now set \(b_1 = -b_0 \cdot r_1 \in S^{-m-(\rho-\delta)}\) and iterate: having constructed \(b_0, \ldots, b_{N-1}\) such that \(a \# (b_0 + \cdots + b_{N-1}) = 1 + r_N\) with \(r_N \in S^{-N(\rho-\delta)}\), we set \(b_N = -b_0 \cdot r_N\). By Borel's lemma (Theorem 2.3.2), there exists \(b \sim \sum_j b_j\) in \(S^{-m}\), and the corresponding operator \(B = \mathrm{Op}(b)\) satisfies \(AB = I + R_1\) with \(R_1 \in \Psi^{-\infty}\). A similar construction gives the left parametrix. \(\blacksquare\)
</div>

### 3.6 Elliptic Regularity

The parametrix immediately yields the fundamental regularity theorem for elliptic equations.

<div class="theorem">
<strong>Theorem 3.6.1 (Elliptic Regularity).</strong> Let \(A \in \Psi^m\) be elliptic. If \(Au = f\) with \(f \in H^s_{\mathrm{loc}}\), then \(u \in H^{s+m}_{\mathrm{loc}}\). In particular, if \(f \in C^\infty\), then \(u \in C^\infty\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(B\) be a parametrix for \(A\), so \(BA = I + R\) with \(R \in \Psi^{-\infty}\). Then \(u = Bf - Ru\). Since \(f \in H^s_{\mathrm{loc}}\) and \(B \in \Psi^{-m}\), we have \(Bf \in H^{s+m}_{\mathrm{loc}}\). Since \(R\) is smoothing, \(Ru \in C^\infty\). Hence \(u = Bf - Ru \in H^{s+m}_{\mathrm{loc}}\). \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark 3.6.2.</strong> This proof is remarkably clean compared to the classical proof of elliptic regularity via difference quotients or Schauder estimates. The parametrix method reduces regularity to a purely algebraic statement about symbol composition. This is the power of the pseudodifferential calculus.
</div>

### 3.7 The Calderón-Vaillancourt Theorem

Not every \(\Psi\)DO of order 0 is bounded on \(L^2\): this requires some care with the symbol class.

<div class="theorem">
<strong>Theorem 3.7.1 (Calderón-Vaillancourt).</strong> If \(a \in S^0_{\rho,\rho}(\mathbb{R}^n \times \mathbb{R}^n)\) with \(0 \leq \rho < 1\), then \(\mathrm{Op}(a) : L^2(\mathbb{R}^n) \to L^2(\mathbb{R}^n)\) is bounded, with

\[
\|\mathrm{Op}(a)\|_{L^2 \to L^2} \leq C \sum_{|\alpha+\beta| \leq N} \sup_{x,\xi} |\partial_\xi^\alpha \partial_x^\beta a(x,\xi)|,
\]
where \(N\) depends only on \(n\) and \(\rho\).
</div>

<div class="proof">
<strong>Proof (Sketch for \(\rho = 0\)).</strong> The case \(\rho = 0\) is the most classical. The symbol \(a \in S^0_{0,0}\) satisfies \(|\partial_\xi^\alpha \partial_x^\beta a| \leq C_{\alpha\beta}\) for all \(\alpha, \beta\). One decomposes the operator using a partition of unity in phase space (a Gabor-type decomposition) and estimates each piece. The Cotlar-Stein almost-orthogonality lemma then yields the \(L^2\)-boundedness. Specifically, if \(A = \sum_j A_j\) where the pieces satisfy

\[
\|A_i^* A_j\| \leq c(i-j)^2, \quad \|A_i A_j^*\| \leq c(i-j)^2,
\]
with \(\sum_j c(j) < \infty\), then \(\|A\| \leq \sum_j \sqrt{c(j)}\). \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark 3.7.2.</strong> The theorem fails for \(\rho = 1\): there exist symbols in \(S^0_{1,1}\) whose quantizations are unbounded on \(L^2\). This is another manifestation of the pathology of the \((1,1)\) class.
</div>

### 3.8 Gårding's Inequality

Gårding's inequality is the pseudodifferential version of coercivity, fundamental for energy estimates.

<div class="theorem">
<strong>Theorem 3.8.1 (Sharp Gårding Inequality).</strong> Let \(A \in \Psi^m_{1,0}(\mathbb{R}^n)\) with symbol \(a\) satisfying \(\operatorname{Re} a(x,\xi) \geq 0\) for all \(x,\xi\). Then there exists \(C > 0\) such that

\[
\operatorname{Re} \langle Au, u \rangle \geq -C\|u\|_{H^{(m-1)/2}}^2
\]
for all \(u \in \mathcal{S}(\mathbb{R}^n)\).
</div>

<div class="theorem">
<strong>Theorem 3.8.2 (Fefferman-Phong Inequality).</strong> Under the stronger hypothesis that \(a(x,\xi) \geq 0\) (real non-negative symbol of order \(m\)), one has the improved lower bound

\[
\operatorname{Re} \langle Au, u \rangle \geq -C\|u\|_{H^{(m-2)/2}}^2.
\]
This gains a full derivative over the sharp Gårding inequality and is optimal.
</div>

<div class="remark">
<strong>Remark 3.8.3.</strong> The Fefferman-Phong inequality, proved in 1978, is a deep result whose proof uses a delicate decomposition of phase space. It plays an important role in the theory of subelliptic estimates and in semiclassical analysis.
</div>

---

## Chapter 4: Wavefront Sets and Microlocal Analysis

The wavefront set is the central concept of microlocal analysis. Introduced by Hörmander in 1970, it refines the classical notion of singular support by tracking not only *where* a distribution is singular but also *in which codirections* the singularity occurs. This refinement, living in the cotangent bundle rather than the base manifold, is the passage from local to microlocal analysis — and it transforms the study of PDE.

### 4.1 Singular Support

We begin with the classical notion, which the wavefront set refines.

<div class="definition">
<strong>Definition 4.1.1 (Singular Support).</strong> The <em>singular support</em> of a distribution \(u \in \mathcal{D}'(\Omega)\), denoted \(\operatorname{sing\,supp}(u)\), is the smallest closed set \(F \subseteq \Omega\) such that \(u|_{\Omega \setminus F} \in C^\infty(\Omega \setminus F)\). Equivalently,

\[
x_0 \notin \operatorname{sing\,supp}(u) \iff \exists \, \varphi \in C_c^\infty(\Omega) \text{ with } \varphi(x_0) \neq 0 \text{ and } \varphi u \in C^\infty(\Omega).
\]
</div>

<div class="example">
<strong>Example 4.1.2.</strong> For the Dirac delta, \(\operatorname{sing\,supp}(\delta_0) = \{0\}\). For the Heaviside function \(H\), \(\operatorname{sing\,supp}(H) = \{0\}\) as well, since \(H\) is smooth away from the origin.
</div>

The singular support tells us *where* the singularity is, but not *how* it is oriented. Two distributions can have the same singular support but very different analytic behavior — for instance, \(\delta(x_1)\) (singular on the hyperplane \(\{x_1 = 0\}\)) and \(\delta(x_1) + \delta(x_2)\) have qualitatively different singularity structures that the singular support alone cannot distinguish.

### 4.2 The Wavefront Set

<div class="definition">
<strong>Definition 4.2.1 (Wavefront Set).</strong> Let \(u \in \mathcal{D}'(\Omega)\). A point \((x_0, \xi_0) \in \Omega \times (\mathbb{R}^n \setminus \{0\})\) is <em>not</em> in the wavefront set \(\mathrm{WF}(u)\) if there exist \(\varphi \in C_c^\infty(\Omega)\) with \(\varphi(x_0) \neq 0\) and an open cone \(\Gamma \subset \mathbb{R}^n \setminus \{0\}\) containing \(\xi_0\) such that for every \(N \in \mathbb{N}\),

\[
|\widehat{\varphi u}(\xi)| \leq C_N \langle \xi \rangle^{-N}, \quad \xi \in \Gamma.
\]
The <em>wavefront set</em> \(\mathrm{WF}(u) \subset T^*\Omega \setminus 0\) is the complement of the set of all such "microlocally regular" points.
</div>

The wavefront set is a closed conic subset of \(T^*\Omega \setminus 0\) (conic means invariant under positive scaling of the fiber variable \(\xi\)). It refines the singular support via the projection:

<div class="proposition">
<strong>Proposition 4.2.2.</strong> The projection of \(\mathrm{WF}(u)\) onto the base \(\Omega\) equals \(\operatorname{sing\,supp}(u)\):

\[
\pi(\mathrm{WF}(u)) = \operatorname{sing\,supp}(u),
\]
where \(\pi : T^*\Omega \setminus 0 \to \Omega\) is the base projection.
</div>

<div class="proof">
<strong>Proof.</strong> If \(x_0 \notin \operatorname{sing\,supp}(u)\), then there exists \(\varphi\) with \(\varphi(x_0) \neq 0\) and \(\varphi u \in C^\infty_c\), so \(\widehat{\varphi u}\) is rapidly decreasing in <em>all</em> directions. Thus \((x_0, \xi_0) \notin \mathrm{WF}(u)\) for every \(\xi_0\), so \(x_0 \notin \pi(\mathrm{WF}(u))\). Conversely, if \(x_0 \notin \pi(\mathrm{WF}(u))\), one can cover \(S^{n-1}\) by finitely many open cones in which \(\widehat{\varphi u}\) is rapidly decreasing (after possibly shrinking the support of \(\varphi\)), yielding rapid decrease in all directions and hence \(\varphi u \in C^\infty\). \(\blacksquare\)
</div>

<div class="example">
<strong>Example 4.2.3 (Wavefront Set of the Dirac Delta).</strong> For \(\delta_0 \in \mathcal{D}'(\mathbb{R}^n)\), we have \(\hat{\delta}_0 = 1\), which does not decay in any direction. Thus

\[
\mathrm{WF}(\delta_0) = \{(0,\xi) : \xi \in \mathbb{R}^n \setminus \{0\}\} = \{0\} \times (\mathbb{R}^n \setminus \{0\}).
\]
The singularity at the origin is "omnidirectional."
</div>

<div class="example">
<strong>Example 4.2.4 (Wavefront Set of a Characteristic Function).</strong> Let \(\Omega \subset \mathbb{R}^n\) be a bounded open set with smooth boundary. Then

\[
\mathrm{WF}(\mathbf{1}_\Omega) = \{(x,\xi) : x \in \partial\Omega, \; \xi \perp T_x(\partial\Omega), \; \xi \neq 0\} = N^*(\partial\Omega) \setminus 0,
\]
the conormal bundle of the boundary (minus the zero section). The singularity is concentrated on the boundary and points in the normal direction.
</div>

<div class="example">
<strong>Example 4.2.5 (Wavefront Set of \(\delta(x_1)\)).</strong> Consider \(\delta(x_1) \in \mathcal{D}'(\mathbb{R}^n)\), the distribution defined by \(\langle \delta(x_1), \varphi \rangle = \int \varphi(0, x') \, dx'\). Its Fourier transform in \(x_1\) is constant, so the singularity is in the \(\xi_1\)-direction:

\[
\mathrm{WF}(\delta(x_1)) = \{(0,x'; \xi_1, 0) : x' \in \mathbb{R}^{n-1}, \; \xi_1 \neq 0\}.
\]
This is precisely the conormal bundle of the hyperplane \(\{x_1 = 0\}\).
</div>

### 4.3 Microlocal Regularity and Pseudolocality

<div class="theorem">
<strong>Theorem 4.3.1 (Microlocal Regularity of \(\Psi\)DOs).</strong> If \(A \in \Psi^m_{\rho,\delta}\) with \(\delta < \rho\), then

\[
\mathrm{WF}(Au) \subseteq \mathrm{WF}(u)
\]
for every \(u \in \mathcal{S}'(\mathbb{R}^n)\) (or \(u \in \mathcal{E}'(\mathbb{R}^n)\)). That is, a pseudodifferential operator does not create new singularities.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> If \((x_0, \xi_0) \notin \mathrm{WF}(u)\), we must show \((x_0, \xi_0) \notin \mathrm{WF}(Au)\). Choose \(\varphi\) localizing near \(x_0\) and a symbol \(b \in S^0\) that is 1 near \((x_0, \xi_0)\) (in a conic sense) and supported where \(u\) is microlocally regular. The key is to decompose \(A = A_1 + A_2\) where \(A_1\) has symbol supported in the region where \(u\) is microlocally smooth, so \(A_1 u\) is smooth near \((x_0,\xi_0)\), and \(A_2\) has symbol vanishing near \((x_0,\xi_0)\). A careful estimation using the symbol calculus completes the argument. \(\blacksquare\)
</div>

<div class="corollary">
<strong>Corollary 4.3.2 (Pseudolocality).</strong> For \(A \in \Psi^m_{\rho,\delta}\) with \(\delta < \rho\),

\[
\operatorname{sing\,supp}(Au) \subseteq \operatorname{sing\,supp}(u).
\]
</div>

### 4.4 Microlocal Elliptic Regularity

The wavefront set allows a refinement of elliptic regularity to the microlocal level.

<div class="definition">
<strong>Definition 4.4.1 (Characteristic Set).</strong> For \(A \in \Psi^m\) with principal symbol \(\sigma_m(A)\), the <em>characteristic set</em> is

\[
\operatorname{Char}(A) = \{(x,\xi) \in T^*\mathbb{R}^n \setminus 0 : \sigma_m(A)(x,\xi) = 0\}.
\]
The operator \(A\) is elliptic precisely when \(\operatorname{Char}(A) = \emptyset\).
</div>

<div class="theorem">
<strong>Theorem 4.4.2 (Microlocal Elliptic Regularity).</strong> Let \(A \in \Psi^m\) and \(Au = f\). Then

\[
\mathrm{WF}(u) \subseteq \mathrm{WF}(f) \cup \operatorname{Char}(A).
\]
In words: the wavefront set of a solution \(u\) can only contain points that are either in the wavefront set of the right-hand side or in the characteristic set of the operator.
</div>

<div class="proof">
<strong>Proof.</strong> Suppose \((x_0,\xi_0) \notin \mathrm{WF}(f) \cup \operatorname{Char}(A)\). Since \((x_0,\xi_0) \notin \operatorname{Char}(A)\), the principal symbol \(\sigma_m(A)\) is nonzero at \((x_0,\xi_0)\). We can construct a microlocal parametrix \(B \in \Psi^{-m}\) that inverts \(A\) microlocally near \((x_0,\xi_0)\): \(BA = I + R\) where \(R\) is microsupported away from \((x_0,\xi_0)\). Then

\[
u = Bf - Ru + Ru - Ru = Bf - Ru
\]
microlocally near \((x_0,\xi_0)\). Since \((x_0,\xi_0) \notin \mathrm{WF}(f)\) and \(B\) preserves wavefront sets, \((x_0,\xi_0) \notin \mathrm{WF}(Bf)\). And \(R\) is smoothing near \((x_0,\xi_0)\), so \((x_0,\xi_0) \notin \mathrm{WF}(Ru)\). Hence \((x_0,\xi_0) \notin \mathrm{WF}(u)\). \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark 4.4.3.</strong> When the operator is elliptic (\(\operatorname{Char}(A) = \emptyset\)), this reduces to \(\mathrm{WF}(u) \subseteq \mathrm{WF}(f)\), which refines the global statement \(\operatorname{sing\,supp}(u) \subseteq \operatorname{sing\,supp}(f)\). For non-elliptic operators (like the wave operator), the characteristic set is nonempty, and singularities can propagate along it — the subject of Section 4.6.
</div>

### 4.5 The Wavefront Set of a Product

One of the most important applications of the wavefront set is to the problem of multiplying distributions. As noted in Chapter 1, not all distributions can be multiplied; the wavefront set gives a precise criterion.

<div class="theorem">
<strong>Theorem 4.5.1 (Hörmander's Criterion for Multiplication).</strong> Let \(u, v \in \mathcal{D}'(\Omega)\). If the following condition holds:

\[
(x, \xi) \in \mathrm{WF}(u) \text{ and } (x, \eta) \in \mathrm{WF}(v) \implies \xi + \eta \neq 0,
\]
then the product \(uv \in \mathcal{D}'(\Omega)\) is well-defined, and

\[
\mathrm{WF}(uv) \subseteq \{(x, \xi+\eta) : (x,\xi) \in \mathrm{WF}(u) \cup \{0\}, \; (x,\eta) \in \mathrm{WF}(v) \cup \{0\}, \; \xi+\eta \neq 0\}.
\]
Here \(\{0\}\) means we allow \(\xi = 0\) or \(\eta = 0\) (but not \(\xi + \eta = 0\)) in the union.
</div>

<div class="remark">
<strong>Remark 4.5.2.</strong> Hörmander's condition is a "no-cancellation" condition: the singular codirections of \(u\) and \(v\) at any common singular point must not be antipodal. This is violated for \(\delta_0 \cdot \delta_0\) (both wavefront sets are all of \(\{0\} \times (\mathbb{R}^n \setminus \{0\})\)), which indeed cannot be defined. It is satisfied for the product of \(\delta(x_1)\) with a distribution smooth in the \(x_1\) variable — the codirections are complementary.
</div>

<div class="example">
<strong>Example 4.5.3.</strong> Let \(u = \delta(x_1) \in \mathcal{D}'(\mathbb{R}^2)\) and \(v = \delta(x_2) \in \mathcal{D}'(\mathbb{R}^2)\). Then \(\mathrm{WF}(u) \subset \{(\xi_1, 0)\}\)-directions and \(\mathrm{WF}(v) \subset \{(0, \xi_2)\}\)-directions. Hörmander's condition is satisfied (these are never antipodal), and the product \(uv = \delta(x_1)\delta(x_2) = \delta_0\) is well-defined.
</div>

### 4.6 Propagation of Singularities

For operators that are not elliptic, singularities can propagate. The fundamental theorem describes this propagation.

<div class="definition">
<strong>Definition 4.6.1 (Bicharacteristic Flow).</strong> Let \(P \in \Psi^m\) have real principal symbol \(p = \sigma_m(P)\). The <em>Hamilton vector field</em> of \(p\) is

\[
H_p = \sum_{j=1}^n \left(\frac{\partial p}{\partial \xi_j} \frac{\partial}{\partial x_j} - \frac{\partial p}{\partial x_j} \frac{\partial}{\partial \xi_j}\right).
\]
A <em>bicharacteristic</em> is an integral curve of \(H_p\) lying in \(\operatorname{Char}(P) = \{p = 0\}\). <em>Null bicharacteristics</em> are bicharacteristic curves on which \(p = 0\).
</div>

<div class="theorem">
<strong>Theorem 4.6.2 (Hörmander's Propagation of Singularities).</strong> Let \(P \in \Psi^m\) have real principal symbol \(p\). If \(Pu = f\), then \(\mathrm{WF}(u) \setminus \mathrm{WF}(f)\) is a union of maximally extended null bicharacteristics of \(P\) contained in \(\operatorname{Char}(P)\).
</div>

<div class="remark">
<strong>Remark 4.6.3.</strong> In plainer language: wherever the wavefront set of \(u\) is not "explained" by the right-hand side \(f\), the singularities must propagate along the Hamiltonian flow of the principal symbol. For the wave operator \(P = D_t^2 - \Delta_x\) with principal symbol \(p = \tau^2 - |\xi|^2\), the null bicharacteristics are the lifts to \(T^*\mathbb{R}^{n+1}\) of light rays (straight lines traversed at speed 1). This theorem thus contains, as a special case, the classical fact that singularities of waves propagate along light rays — Huygens' principle in its microlocal incarnation.
</div>

<div class="example">
<strong>Example 4.6.4 (Wave Equation).</strong> For the wave operator \(P = \partial_t^2 - \Delta_x\) on \(\mathbb{R}^{1+n}\), the principal symbol is \(p(t,x;\tau,\xi) = -\tau^2 + |\xi|^2\). The Hamilton equations are

\[
\dot{t} = -2\tau, \quad \dot{x} = 2\xi, \quad \dot{\tau} = 0, \quad \dot{\xi} = 0.
\]
On \(\operatorname{Char}(P) = \{\tau^2 = |\xi|^2\}\), with \(\tau = \pm|\xi|\), these are straight lines in space-time with velocity \(\dot{x}/\dot{t} = -\xi/\tau = \mp \xi/|\xi|\), i.e., unit speed propagation. The propagation of singularities theorem says that the wavefront set of a solution to the wave equation propagates along these rays.
</div>

---

## Chapter 5: Fourier Integral Operators

Fourier integral operators (FIOs) generalize pseudodifferential operators by allowing the phase function to be more general than the linear phase \((x-y) \cdot \xi\). They were introduced by Hörmander in 1971 to provide a coordinate-invariant framework for the propagation of singularities and to construct parametrices for hyperbolic equations. FIOs encode canonical transformations (symplectomorphisms) of the cotangent bundle, linking the symplectic geometry of classical mechanics to the analysis of PDEs. The theory draws heavily on the work of Maslov, Hörmander, and Duistermaat-Guillemin.

### 5.1 Symplectic Geometry and Lagrangian Submanifolds

The natural geometric setting for FIOs is symplectic geometry.

<div class="definition">
<strong>Definition 5.1.1 (Symplectic Structure).</strong> The cotangent bundle \(T^*\mathbb{R}^n\) carries the canonical symplectic form \(\omega = \sum_{j=1}^n d\xi_j \wedge dx_j\). A submanifold \(\Lambda \subset T^*\mathbb{R}^n\) of dimension \(n\) is <em>Lagrangian</em> if \(\omega|_\Lambda = 0\).
</div>

<div class="example">
<strong>Example 5.1.2.</strong> The zero section \(\{(x,0) : x \in \mathbb{R}^n\}\) is Lagrangian. The conormal bundle \(N^*S = \{(x,\xi) : x \in S, \; \xi \perp T_xS\}\) of any smooth submanifold \(S \subset \mathbb{R}^n\) is Lagrangian. The graph of any exact 1-form \(\xi = d\phi(x)\) is Lagrangian.
</div>

<div class="definition">
<strong>Definition 5.1.3 (Canonical Relation).</strong> A <em>canonical relation</em> from \(T^*\mathbb{R}^{n_2}\) to \(T^*\mathbb{R}^{n_1}\) is a Lagrangian submanifold \(C \subset T^*\mathbb{R}^{n_1} \times T^*\mathbb{R}^{n_2}\) with respect to the twisted symplectic form \(\omega_1 \oplus (-\omega_2)\). In particular, the graph of any canonical transformation (symplectomorphism) \(\chi : T^*\mathbb{R}^n \to T^*\mathbb{R}^n\) is a canonical relation.
</div>

### 5.2 Generating Functions and Phase Functions

<div class="definition">
<strong>Definition 5.2.1 (Non-degenerate Phase Function).</strong> A <em>phase function</em> is a smooth real-valued function \(\Phi(x,y,\theta)\) defined on \(\mathbb{R}^{n_1} \times \mathbb{R}^{n_2} \times (\mathbb{R}^N \setminus \{0\})\) that is positively homogeneous of degree 1 in \(\theta\). It is <em>non-degenerate</em> if the differentials \(d(\partial\Phi/\partial\theta_1), \ldots, d(\partial\Phi/\partial\theta_N)\) are linearly independent on the critical set

\[
C_\Phi = \{(x,y,\theta) : \nabla_\theta \Phi = 0\}.
\]
</div>

<div class="proposition">
<strong>Proposition 5.2.2.</strong> If \(\Phi\) is a non-degenerate phase function, then \(C_\Phi\) is a smooth manifold of dimension \(n_1 + n_2\), and the map

\[
C_\Phi \ni (x,y,\theta) \mapsto (x, \nabla_x\Phi; y, -\nabla_y\Phi) \in T^*\mathbb{R}^{n_1} \times T^*\mathbb{R}^{n_2}
\]
parametrizes a Lagrangian submanifold (with respect to the twisted symplectic form), which is the canonical relation associated to \(\Phi\).
</div>

<div class="example">
<strong>Example 5.2.3.</strong> The phase function \(\Phi(x,y,\xi) = (x-y) \cdot \xi\) is non-degenerate, with critical set \(C_\Phi = \{x = y\}\) and associated canonical relation equal to the diagonal \(\{(x,\xi;x,\xi)\}\) — corresponding to the identity transformation. This is the phase of pseudodifferential operators.
</div>

### 5.3 Definition of Fourier Integral Operators

<div class="definition">
<strong>Definition 5.3.1 (Fourier Integral Operator).</strong> A <em>Fourier integral operator</em> of order \(m\) associated to a non-degenerate phase function \(\Phi(x,y,\theta)\) is an operator of the form

\[
Au(x) = \int\!\!\!\int e^{i\Phi(x,y,\theta)} a(x,y,\theta) u(y) \, dy \, d\theta,
\]
where \(a \in S^{m + n_1/2 - N/2}_{1,0}(\mathbb{R}^{n_1} \times \mathbb{R}^{n_2} \times \mathbb{R}^N)\) is an amplitude, interpreted as an oscillatory integral. We write \(A \in I^m(C)\), where \(C\) is the canonical relation generated by \(\Phi\).
</div>

<div class="remark">
<strong>Remark 5.3.2.</strong> The order convention is set so that pseudodifferential operators of order \(m\) are FIOs of order \(m\) associated to the identity canonical relation (the diagonal in \(T^*\mathbb{R}^n \times T^*\mathbb{R}^n\)).
</div>

<div class="theorem">
<strong>Theorem 5.3.3 (Wavefront Set of FIOs).</strong> If \(A \in I^m(C)\) and \(u \in \mathcal{E}'(\mathbb{R}^{n_2})\), then

\[
\mathrm{WF}(Au) \subseteq C \circ \mathrm{WF}(u) := \{(x,\xi) : \exists (y,\eta) \in \mathrm{WF}(u), \; (x,\xi;y,\eta) \in C\}.
\]
That is, the FIO transforms the wavefront set according to its canonical relation.
</div>

### 5.4 Composition with Pseudodifferential Operators

<div class="theorem">
<strong>Theorem 5.4.1.</strong> If \(A \in I^m(C)\) is an FIO and \(P \in \Psi^k\) is a pseudodifferential operator, then \(PA \in I^{m+k}(C)\) — the composition is again an FIO associated to the same canonical relation, with order increased by \(k\). Similarly, \(AP' \in I^{m+k'}(C)\) for \(P' \in \Psi^{k'}\).
</div>

This means that the class of FIOs associated to a given canonical relation forms a module over the ring of pseudodifferential operators — a crucial structural property.

### 5.5 Egorov's Theorem

Egorov's theorem is the microlocal version of the statement that conjugation by a unitary operator associated to a canonical transformation implements that transformation at the symbol level.

<div class="theorem">
<strong>Theorem 5.5.1 (Egorov's Theorem).</strong> Let \(\chi : T^*\mathbb{R}^n \to T^*\mathbb{R}^n\) be a canonical transformation, and let \(U \in I^0(\operatorname{Graph}(\chi))\) be an elliptic FIO of order 0 with parametrix \(U^{-1} \in I^0(\operatorname{Graph}(\chi^{-1}))\). Then for any \(A \in \Psi^m\), the conjugated operator

\[
B = U^{-1} A U
\]
is a pseudodifferential operator \(B \in \Psi^m\), and its principal symbol satisfies

\[
\sigma_m(B) = \sigma_m(A) \circ \chi.
\]
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> By Theorem 5.4.1, \(AU \in I^m(\operatorname{Graph}(\chi))\), and then \(U^{-1}(AU) \in I^m(\operatorname{Graph}(\chi^{-1}) \circ \operatorname{Graph}(\chi)) = I^m(\Delta)\), where \(\Delta\) is the diagonal canonical relation. But FIOs associated to the diagonal are precisely pseudodifferential operators, so \(B \in \Psi^m\). The formula for the principal symbol follows from tracking the symbol through the composition. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark 5.5.2.</strong> Egorov's theorem is the rigorous version of the "quantum-classical correspondence" for a single observable: conjugation by the quantum propagator \(U\) corresponds to composition with the classical flow \(\chi\) at the level of principal symbols. This is a cornerstone of semiclassical analysis.
</div>

### 5.6 Application: Parametrix for the Wave Equation

We illustrate the power of FIO theory by constructing a parametrix for the wave equation.

<div class="theorem">
<strong>Theorem 5.6.1 (Parametrix for the Wave Operator).</strong> Consider the Cauchy problem

\[
\begin{cases} (\partial_t^2 - \Delta) u = 0, \\ u(0,x) = f(x), \\ \partial_t u(0,x) = g(x). \end{cases}
\]
There exist Fourier integral operators \(E_0(t), E_1(t) \in I^0(\mathbb{R}^n)\) such that the solution is

\[
u(t,\cdot) = E_0(t)f + E_1(t)g + R(t)(f,g),
\]
where \(R(t)\) is a smoothing operator. The canonical relation of \(E_j(t)\) is the graph of the geodesic flow at time \(t\) (for the flat metric, this is the linear flow \((x,\xi) \mapsto (x + 2t\xi/|\xi|, \xi)\) on the characteristic set \(\{|\xi| = 1\}\), extended homogeneously).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> One constructs \(E_0(t)\) as an FIO with phase function

\[
\Phi_\pm(t,x,y,\xi) = (x - y) \cdot \xi \pm t|\xi|
\]
and amplitude \(a(t,x,y,\xi)\) determined by solving the transport equations obtained from applying the wave operator to the ansatz

\[
E_0(t)f(x) = \frac{1}{(2\pi)^n} \int\!\!\!\int \left(e^{i((x-y)\cdot\xi + t|\xi|)} a^+(t,x,\xi) + e^{i((x-y)\cdot\xi - t|\xi|)} a^-(t,x,\xi)\right) f(y) \, dy \, d\xi.
\]
The phase functions \(\Phi_\pm\) generate the forward and backward light cones. The transport equations, obtained by collecting terms of decreasing homogeneity in \(\xi\), can be solved iteratively, yielding an amplitude with an asymptotic expansion. The initial conditions \(u(0) = f\), \(\partial_t u(0) = g\) determine the split between the \(+\) and \(-\) contributions. \(\blacksquare\)
</div>

---

## Chapter 6: Applications to PDE

With the machinery of pseudodifferential operators, wavefront sets, and Fourier integral operators in hand, we now demonstrate the power of microlocal analysis through applications to partial differential equations. These applications range from the foundational (elliptic regularity) to the sophisticated (propagation of singularities for the wave equation, analytic wavefront set). The microlocal perspective not only simplifies many classical arguments but also yields results that are inaccessible by other methods.

### 6.1 Elliptic Regularity Revisited

We have already proved elliptic regularity (Theorem 3.6.1) via parametrices. The microlocal viewpoint gives a sharper result.

<div class="theorem">
<strong>Theorem 6.1.1 (Microlocal Elliptic Regularity, Refined).</strong> Let \(P \in \Psi^m(\mathbb{R}^n)\) be a classical pseudodifferential operator with principal symbol \(p_m\). If \(Pu = f\) and \((x_0, \xi_0) \notin \operatorname{Char}(P) \cup \mathrm{WF}(f)\), then \((x_0,\xi_0) \notin \mathrm{WF}(u)\). Furthermore, microlocally near \((x_0,\xi_0)\),

\[
u \equiv B f \pmod{C^\infty},
\]
where \(B\) is a microlocal parametrix with principal symbol \(1/p_m\).
</div>

This refined statement is immediately useful for equations that are elliptic only in some directions.

### 6.2 Hypoellipticity

An operator is hypoelliptic if it gains regularity, though perhaps not as much as an elliptic operator.

<div class="definition">
<strong>Definition 6.2.1.</strong> A linear differential operator \(P\) is <em>hypoelliptic</em> if \(\operatorname{sing\,supp}(Pu) = \operatorname{sing\,supp}(u)\) for all \(u \in \mathcal{D}'(\Omega)\). That is, \(Pu \in C^\infty(\Omega) \implies u \in C^\infty(\Omega)\).
</div>

<div class="example">
<strong>Example 6.2.2.</strong> The heat operator \(P = \partial_t - \Delta_x\) on \(\mathbb{R}^{1+n}\) is hypoelliptic but not elliptic. Its characteristic set \(\operatorname{Char}(P) = \{\tau = 0, \xi = 0\}\) is nonempty (as a set in the projectivized cotangent bundle, it is the "direction" \(d\tau\)), yet solutions to \(Pu = 0\) are smooth. Hörmander proved that a constant-coefficient operator \(P(D)\) is hypoelliptic if and only if for every \(\alpha\), \(|P^{(\alpha)}(\xi)/P(\xi)| \to 0\) as \(|\xi| \to \infty\) (with \(\xi\) staying away from the zeros of \(P\)).
</div>

<div class="theorem">
<strong>Theorem 6.2.3 (Hörmander's Sum of Squares).</strong> Let \(X_0, X_1, \ldots, X_r\) be smooth real vector fields on an open set \(\Omega \subseteq \mathbb{R}^n\), and consider the operator

\[
P = \sum_{j=1}^r X_j^2 + X_0 + c
\]
where \(c \in C^\infty(\Omega)\). If the Lie algebra generated by \(X_0, X_1, \ldots, X_r\) spans the tangent space at every point (the <em>Hörmander bracket condition</em>), then \(P\) is hypoelliptic.
</div>

<div class="remark">
<strong>Remark 6.2.4.</strong> This landmark theorem, proved by Hörmander in 1967 and partly motivating his later development of microlocal analysis, covers important operators in sub-Riemannian geometry and mathematical finance (e.g., the Kolmogorov equation). The proof involves subelliptic estimates that are most naturally expressed in the pseudodifferential framework.
</div>

### 6.3 The Heat Kernel via Pseudodifferential Methods

The pseudodifferential calculus provides an elegant construction of the heat kernel for elliptic operators.

<div class="theorem">
<strong>Theorem 6.3.1.</strong> Let \(P \in \Psi^2(\mathbb{R}^n)\) be a classical, self-adjoint, elliptic operator that is positive (i.e., \(\langle Pu, u \rangle \geq c\|u\|_{H^1}^2 - C\|u\|_{L^2}^2\)). Then the heat semigroup \(e^{-tP}\) exists for \(t > 0\) as a smoothing operator, and its Schwartz kernel \(K_t(x,y)\) satisfies:
<br>(i) \(K_t \in C^\infty(\mathbb{R}^+ \times \mathbb{R}^n \times \mathbb{R}^n)\),
<br>(ii) \(K_t(x,y) \to \delta(x-y)\) as \(t \to 0^+\) in the sense of distributions,
<br>(iii) For small \(t > 0\), \(K_t\) admits an asymptotic expansion on the diagonal:

\[
K_t(x,x) \sim (4\pi t)^{-n/2} \sum_{j=0}^\infty a_j(x) t^j \quad \text{as } t \to 0^+,
\]
where the coefficients \(a_j(x)\) are determined by the symbol of \(P\).
</div>

<div class="remark">
<strong>Remark 6.3.2.</strong> The diagonal expansion of the heat kernel is intimately connected to spectral geometry through the trace formula

\[
\operatorname{Tr}(e^{-tP}) = \int K_t(x,x) \, dx \sim (4\pi t)^{-n/2} \sum_{j=0}^\infty \left(\int a_j(x) \, dx\right) t^j.
\]
On a compact manifold, the left-hand side equals \(\sum_k e^{-t\lambda_k}\), where \(\lambda_k\) are the eigenvalues of \(P\). This connection between the heat trace and spectral data is the starting point for the Weyl law (Chapter 7) and the Atiyah-Singer index theorem.
</div>

### 6.4 Propagation of Singularities for the Wave Equation

We now give a detailed treatment of the propagation theorem for the wave equation, using the machinery developed in Chapters 4 and 5.

<div class="theorem">
<strong>Theorem 6.4.1 (Propagation of Singularities for the Wave Equation).</strong> Let \(P = D_t^2 - \sum_{j,k} \partial_{x_j}(g^{jk}(x)\partial_{x_k})\) be a wave operator with smooth metric \(g\), and suppose \(Pu = f\) on \(\mathbb{R} \times \mathbb{R}^n\). Then:
<br>(i) \(\mathrm{WF}(u) \setminus \mathrm{WF}(f) \subset \operatorname{Char}(P) = \{\tau^2 = |\xi|_g^2\}\),
<br>(ii) \(\mathrm{WF}(u) \setminus \mathrm{WF}(f)\) is invariant under the null bicharacteristic flow, i.e., it is a union of maximally extended null bicharacteristics.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> Part (i) is microlocal elliptic regularity (Theorem 4.4.2). For part (ii), the idea is to construct a microlocal energy estimate near the bicharacteristic. Let \(\gamma : [0,T] \to T^*(\mathbb{R}^{1+n}) \setminus 0\) be a null bicharacteristic of \(P\), and suppose \(\gamma(0) \notin \mathrm{WF}(u)\). We want to show \(\gamma(t) \notin \mathrm{WF}(u)\) for \(t \in [0,T]\).

Choose a family of pseudodifferential operators \(B(t) \in \Psi^0\) microsupported near \(\gamma(t)\) and define the microlocal energy

\[
E(t) = \|B(t) D_t u\|_{L^2}^2 + \|B(t) \nabla_x u\|_{L^2}^2.
\]
One computes \(\frac{d}{dt}E(t)\) using the equation \(Pu = f\), the composition formula for \(\Psi\)DOs, and the positive commutator method (following Hörmander). The crucial point is that \([P, B(t)^*B(t)]\) has principal symbol \(H_p(|b(t)|^2)\), and by choosing \(B(t)\) to propagate along the flow, this commutator can be made non-positive (modulo lower-order terms). A Gronwall argument then yields \(E(t) = 0\) for all \(t\), hence \(\gamma(t) \notin \mathrm{WF}(u)\). \(\blacksquare\)
</div>

### 6.5 Duhamel's Principle

<div class="theorem">
<strong>Theorem 6.5.1 (Duhamel's Principle).</strong> Consider the inhomogeneous wave equation

\[
\begin{cases} (\partial_t^2 - \Delta) u = F(t,x), \quad t > 0, \\ u(0,x) = f(x), \quad \partial_t u(0,x) = g(x). \end{cases}
\]
If \(E_1(t)\) is the propagator for the homogeneous equation with data \(u(0) = 0\), \(\partial_t u(0) = g\) (so that \(u(t) = E_1(t)g\)), then the solution to the inhomogeneous problem is

\[
u(t) = E_0(t)f + E_1(t)g + \int_0^t E_1(t-s) F(s) \, ds.
\]
</div>

<div class="remark">
<strong>Remark 6.5.2.</strong> Duhamel's principle, combined with the FIO structure of \(E_0(t)\) and \(E_1(t)\), allows one to analyze the wavefront set of solutions to inhomogeneous wave equations. In particular, \(\mathrm{WF}(u)\) is determined by the wavefront sets of the initial data and forcing, transported along null bicharacteristics.
</div>

### 6.6 The FBI Transform

The FBI (Fourier-Bros-Iagolnitzer) transform is a tool for studying analytic regularity, bridging the gap between \(C^\infty\) microlocal analysis and analytic microlocal analysis.

<div class="definition">
<strong>Definition 6.6.1 (FBI Transform).</strong> The FBI transform of \(u \in \mathcal{E}'(\mathbb{R}^n)\) is

\[
Tu(x,\xi) = c_n \int_{\mathbb{R}^n} e^{i(x-y) \cdot \xi - |\xi|(x-y)^2/2} u(y) \, dy,
\]
where \(c_n\) is a normalization constant. This is a smooth function of \((x,\xi) \in \mathbb{R}^n \times \mathbb{R}^n\).
</div>

<div class="theorem">
<strong>Theorem 6.6.2.</strong> A point \((x_0,\xi_0) \notin \mathrm{WF}(u)\) if and only if \(|Tu(x,\xi)|\) decays rapidly as \(|\xi| \to \infty\) in a neighborhood of \((x_0, \xi_0/|\xi_0|)\) with \(|\xi| \to \infty\) in the direction \(\xi_0\).
</div>

### 6.7 Analytic Wavefront Set

<div class="definition">
<strong>Definition 6.7.1 (Analytic Wavefront Set).</strong> The <em>analytic wavefront set</em> \(\mathrm{WF}_A(u)\) is defined by: \((x_0, \xi_0) \notin \mathrm{WF}_A(u)\) if there exist \(\varepsilon > 0\) and a neighborhood \(U\) of \((x_0, \xi_0/|\xi_0|)\) such that

\[
|Tu(x,\xi)| \leq C e^{-\varepsilon |\xi|}
\]
for \((x, \xi/|\xi|) \in U\) and \(|\xi|\) sufficiently large.
</div>

<div class="remark">
<strong>Remark 6.7.2.</strong> The analytic wavefront set refines the \(C^\infty\) wavefront set: \(\mathrm{WF}_A(u) \subseteq \mathrm{WF}(u)\), and while \(\mathrm{WF}(u) = \emptyset\) means \(u \in C^\infty\), \(\mathrm{WF}_A(u) = \emptyset\) means \(u\) is real-analytic. The analytic wavefront set is relevant for the study of analytic hypoellipticity and for the analysis of operators with analytic coefficients. Its theory, developed by Bros-Iagolnitzer, Sjöstrand, and Kashiwara-Kawai, is considerably deeper than the \(C^\infty\) theory.
</div>

---

## Chapter 7: Semiclassical Analysis

Semiclassical analysis studies the behavior of quantum-mechanical systems in the limit where Planck's constant \(\hbar \to 0\) — or, mathematically, operators depending on a small parameter \(h\) that plays the role of \(\hbar\). This chapter introduces the semiclassical pseudodifferential calculus, where the symbol depends on \(h\) and the relevant notion of order tracks powers of \(h\) rather than growth in \(\xi\). Semiclassical analysis provides quantitative refinements of the qualitative results of microlocal analysis and has deep applications to spectral theory, scattering theory, and quantum ergodicity. The foundational contributions of Weyl, Egorov, Maslov, and more recently Zworski and Sjöstrand shape this field.

### 7.1 Semiclassical Pseudodifferential Operators

<div class="definition">
<strong>Definition 7.1.1 (Semiclassical Symbol Classes).</strong> For \(m \in \mathbb{R}\) and \(0 < h \leq h_0\), the semiclassical symbol class \(S^m_h(\mathbb{R}^{2n})\) consists of families \(\{a_h(x,\xi)\}_{h \in (0,h_0]}\) in \(C^\infty(\mathbb{R}^{2n})\) satisfying

\[
|\partial_x^\alpha \partial_\xi^\beta a_h(x,\xi)| \leq C_{\alpha,\beta} \langle \xi \rangle^{m - |\beta|}
\]
uniformly in \(h\). The class \(S^m_{\delta,h}\) allows \(h\)-dependent bounds:

\[
|\partial_x^\alpha \partial_\xi^\beta a_h(x,\xi)| \leq C_{\alpha,\beta} h^{-\delta(|\alpha|+|\beta|)} \langle \xi \rangle^{m - |\beta|}.
\]
</div>

<div class="definition">
<strong>Definition 7.1.2 (Semiclassical Quantization).</strong> The <em>standard (Kohn-Nirenberg) semiclassical quantization</em> of \(a \in S^m_h\) is

\[
\mathrm{Op}_h(a) u(x) = \frac{1}{(2\pi h)^n} \int\!\!\!\int e^{i(x-y)\cdot\xi/h} a(x,\xi) u(y) \, dy \, d\xi.
\]
This is related to the non-semiclassical quantization by the rescaling \(\xi \mapsto h\xi\): \(\mathrm{Op}_h(a) = \mathrm{Op}(a(x, h\cdot))\) after appropriate identification.
</div>

The factor of \(1/h\) in the phase reflects the fundamental semiclassical scaling: oscillations at frequency \(\sim 1/h\) in position space correspond to momenta of order 1 in the classical limit.

### 7.2 Weyl Quantization

The Weyl quantization, which evaluates the symbol at the midpoint, has special properties that make it the preferred quantization in semiclassical analysis.

<div class="definition">
<strong>Definition 7.2.1 (Weyl Quantization).</strong> The <em>Weyl quantization</em> of \(a \in S^m_h\) is

\[
\mathrm{Op}_h^w(a) u(x) = \frac{1}{(2\pi h)^n} \int\!\!\!\int e^{i(x-y)\cdot\xi/h} a\!\left(\frac{x+y}{2}, \xi\right) u(y) \, dy \, d\xi.
\]
</div>

<div class="proposition">
<strong>Proposition 7.2.2 (Properties of Weyl Quantization).</strong>
<br>(i) If \(a\) is real-valued, then \(\mathrm{Op}_h^w(a)\) is formally self-adjoint on \(L^2(\mathbb{R}^n)\).
<br>(ii) Weyl and standard quantizations differ by lower-order terms: \(\mathrm{Op}_h^w(a) = \mathrm{Op}_h(a) + \mathcal{O}(h)\) as operators on \(L^2\).
<br>(iii) The Weyl symbol of the composition \(\mathrm{Op}_h^w(a) \mathrm{Op}_h^w(b)\) is given by the Moyal product:

\[
(a \#_h b)(x,\xi) = e^{\frac{ih}{2}(\partial_{\xi_a} \cdot \partial_{x_b} - \partial_{x_a} \cdot \partial_{\xi_b})} a(x_a,\xi_a) b(x_b, \xi_b) \Big|_{\substack{x_a = x_b = x \\ \xi_a = \xi_b = \xi}}.
\]
In particular, \(a \#_h b = ab + \frac{h}{2i}\{a,b\} + \mathcal{O}(h^2)\), where \(\{a,b\} = \sum_j (\partial_{\xi_j}a \, \partial_{x_j}b - \partial_{x_j}a \, \partial_{\xi_j}b)\) is the Poisson bracket.
</div>

<div class="remark">
<strong>Remark 7.2.3.</strong> Property (i) is the main advantage of Weyl quantization: real symbols give self-adjoint operators, which is physically natural since observables in quantum mechanics are represented by self-adjoint operators. Property (iii) shows that the commutator \([\mathrm{Op}_h^w(a), \mathrm{Op}_h^w(b)] = \frac{h}{i}\mathrm{Op}_h^w(\{a,b\}) + \mathcal{O}(h^2)\), which is the mathematical content of Dirac's correspondence principle.
</div>

<div class="example">
<strong>Example 7.2.4.</strong> The semiclassical Schrödinger operator \(P_h = -h^2 \Delta + V(x)\) is the Weyl quantization of the classical Hamiltonian \(p(x,\xi) = |\xi|^2 + V(x)\). The semiclassical principal symbol is thus the total energy of the classical system.
</div>

### 7.3 Semiclassical Wavefront Set

<div class="definition">
<strong>Definition 7.3.1 (Semiclassical Wavefront Set).</strong> Let \(\{u_h\}_{h \in (0,h_0]}\) be a bounded family in \(L^2(\mathbb{R}^n)\). The <em>semiclassical wavefront set</em> \(\mathrm{WF}_h(u_h) \subset T^*\mathbb{R}^n\) is the complement of the set of points \((x_0,\xi_0)\) such that there exists \(a \in C_c^\infty(T^*\mathbb{R}^n)\) with \(a(x_0,\xi_0) \neq 0\) and \(\|\mathrm{Op}_h(a) u_h\|_{L^2} = \mathcal{O}(h^\infty)\).
</div>

<div class="remark">
<strong>Remark 7.3.2.</strong> Unlike the classical wavefront set (which lives in the cosphere bundle, being conic in \(\xi\)), the semiclassical wavefront set lives in the full cotangent bundle \(T^*\mathbb{R}^n\) and is <em>not</em> conic. It detects concentration of the family \(u_h\) at a specific point in phase space, not merely a direction. This reflects the uncertainty principle: at scale \(h\), one can localize in both position and momentum simultaneously (up to an \(h\)-neighborhood).
</div>

### 7.4 Egorov's Theorem in the Semiclassical Regime

<div class="theorem">
<strong>Theorem 7.4.1 (Semiclassical Egorov's Theorem).</strong> Let \(P_h = \mathrm{Op}_h^w(p)\) with real principal symbol \(p \in S^0_h\), and let \(U_h(t) = e^{-itP_h/h}\) be the semiclassical propagator. Let \(\Phi^t : T^*\mathbb{R}^n \to T^*\mathbb{R}^n\) be the Hamiltonian flow of \(p\). Then for any \(a \in S^0_h\),

\[
U_h(t)^* \mathrm{Op}_h^w(a) U_h(t) = \mathrm{Op}_h^w(a \circ \Phi^t) + \mathcal{O}(h) \quad \text{in } \mathcal{L}(L^2),
\]
for \(|t| \leq T\) (any fixed \(T\)). More precisely, the full symbol has an asymptotic expansion in powers of \(h\).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> Set \(A(t) = U_h(t)^* \mathrm{Op}_h^w(a) U_h(t)\). Then

\[
\frac{d}{dt} A(t) = \frac{i}{h} [P_h, A(t)].
\]
Writing \(A(t) = \mathrm{Op}_h^w(a_t)\), the Moyal product formula gives

\[
\frac{d}{dt} a_t = \{p, a_t\} + \mathcal{O}(h) = H_p(a_t) + \mathcal{O}(h),
\]
with initial condition \(a_0 = a\). To leading order, this is the transport equation along the Hamiltonian flow, solved by \(a_t^{(0)} = a \circ \Phi^t\). Higher-order corrections are obtained iteratively. \(\blacksquare\)
</div>

### 7.5 Quantum-Classical Correspondence

The semiclassical results above are manifestations of a broader principle: quantum mechanics converges to classical mechanics as \(h \to 0\).

<div class="theorem">
<strong>Theorem 7.5.1 (Semiclassical Propagation of Wavefront Sets).</strong> Let \(u_h\) solve the semiclassical Schrödinger equation \(ih\partial_t u_h = P_h u_h\), where \(P_h = \mathrm{Op}_h^w(p)\) with real \(p\). Then the semiclassical wavefront set propagates according to the classical flow:

\[
\mathrm{WF}_h(u_h(t)) = \Phi^t(\mathrm{WF}_h(u_h(0))),
\]
where \(\Phi^t\) is the Hamiltonian flow of \(p\).
</div>

<div class="remark">
<strong>Remark 7.5.2.</strong> This theorem makes precise the statement that "quantum particles follow classical trajectories in the semiclassical limit." More precisely, the phase-space concentration of a quantum state, as measured by the semiclassical wavefront set, is transported by the classical Hamiltonian flow. This is the mathematical foundation of the WKB approximation and geometric optics.
</div>

### 7.6 The Weyl Law

The Weyl law describes the asymptotic distribution of eigenvalues of elliptic operators and is one of the crown jewels of semiclassical analysis.

<div class="theorem">
<strong>Theorem 7.6.1 (Weyl Law).</strong> Let \(P_h = -h^2\Delta + V(x)\) on a compact Riemannian manifold \((M,g)\) of dimension \(n\), where \(V \in C^\infty(M)\). Let \(N(E, h) = \#\{\lambda_j(h) \leq E\}\) count the number of eigenvalues of \(P_h\) below \(E\). If \(E\) is a regular value of the classical Hamiltonian \(p(x,\xi) = |\xi|_g^2 + V(x)\), then

\[
N(E,h) = \frac{1}{(2\pi h)^n} \operatorname{Vol}\{(x,\xi) \in T^*M : p(x,\xi) \leq E\} + \mathcal{O}(h^{1-n}).
\]
Equivalently, on a compact manifold without potential, the eigenvalue counting function \(N(\lambda) = \#\{\lambda_j \leq \lambda\}\) of \(-\Delta\) satisfies

\[
N(\lambda) = \frac{\omega_n \operatorname{Vol}(M)}{(2\pi)^n} \lambda^{n/2} + \mathcal{O}(\lambda^{(n-1)/2})
\]
as \(\lambda \to \infty\), where \(\omega_n\) is the volume of the unit ball in \(\mathbb{R}^n\).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> The proof proceeds in several steps.

<em>Step 1: Tauberian argument.</em> The eigenvalue counting function is related to the trace of the heat kernel or the spectral projector. One introduces a smoothed counting function \(\tilde{N}(E,h) = \operatorname{Tr}(f((P_h - E)/\delta))\) for a smooth approximation \(f\) to the characteristic function of \((-\infty, 0]\).

<em>Step 2: Functional calculus.</em> By the Helffer-Sjöstrand formula,

\[
f(P_h) = \frac{1}{\pi} \int_{\mathbb{C}} \bar{\partial}\tilde{f}(z) (z - P_h)^{-1} \, dL(z),
\]
where \(\tilde{f}\) is an almost-analytic extension of \(f\). The resolvent \((z - P_h)^{-1}\) is a semiclassical pseudodifferential operator for \(z\) away from the spectrum.

<em>Step 3: Trace asymptotics.</em> Using the semiclassical symbol calculus, one computes

\[
\operatorname{Tr}(f(P_h)) = \frac{1}{(2\pi h)^n} \int_{T^*M} f(p(x,\xi)) \, dx \, d\xi + \mathcal{O}(h^{1-n}).
\]
The leading term is exactly the phase-space volume below \(E\), and the error is controlled by the remainder in the stationary phase expansion.

<em>Step 4: De-smoothing.</em> A Tauberian theorem (or direct comparison argument) allows one to pass from the smoothed counting function back to the sharp one, at the cost of a controlled error. \(\blacksquare\)
</div>

<div class="remark">
<strong>Remark 7.6.2 (Historical Context).</strong> The leading term of the Weyl law was conjectured by Hermann Weyl in 1911 for the Dirichlet Laplacian on bounded domains. The proof of the sharp remainder \(\mathcal{O}(\lambda^{(n-1)/2})\) is due to Hörmander (1968), who used the wave equation and FIO methods — specifically, the relation between the wave trace \(\operatorname{Tr}(\cos(t\sqrt{-\Delta}))\) and the length spectrum of closed geodesics. The semiclassical version presented here, following Zworski, uses the resolvent approach.
</div>

<div class="remark">
<strong>Remark 7.6.3.</strong> The remainder estimate \(\mathcal{O}(\lambda^{(n-1)/2})\) is sharp in general (as shown by the round sphere, where the high multiplicities of eigenvalues cause concentration). However, under additional dynamical hypotheses — for instance, if the set of closed geodesics has measure zero (the generic case) — the remainder can be improved to \(o(\lambda^{(n-1)/2})\). This is the content of the Duistermaat-Guillemin theorem (1975).
</div>

### 7.7 Applications to Spectral Theory

We conclude with some further applications of semiclassical analysis to spectral theory.

<div class="theorem">
<strong>Theorem 7.7.1 (Quantum Ergodicity, Shnirelman-Zelditch-Colin de Verdière).</strong> Let \((M,g)\) be a compact Riemannian manifold such that the geodesic flow on the unit cosphere bundle \(S^*M\) is ergodic. Let \(\{u_j\}_{j=1}^\infty\) be an orthonormal basis of eigenfunctions of \(-\Delta_g\) with eigenvalues \(\lambda_j \to \infty\). Then there exists a subsequence \(\{u_{j_k}\}\) of density 1 (meaning \(\#\{k : j_k \leq N\}/N \to 1\) as \(N \to \infty\)) such that for every \(a \in C^\infty(S^*M)\),

\[
\langle \mathrm{Op}(a) u_{j_k}, u_{j_k} \rangle \to \frac{1}{\operatorname{Vol}(S^*M)} \int_{S^*M} a \, d\mu_L
\]
as \(k \to \infty\), where \(\mu_L\) is the Liouville measure.
</div>

<div class="remark">
<strong>Remark 7.7.2.</strong> In physical terms, quantum ergodicity says that "almost all" eigenfunctions become equidistributed in phase space as the eigenvalue goes to infinity — the quantum analog of the ergodic hypothesis in classical mechanics. The question of whether <em>all</em> eigenfunctions equidistribute (the Quantum Unique Ergodicity conjecture of Rudnick and Sarnak, 1994) remains one of the central open problems at the interface of analysis, number theory, and mathematical physics. It has been resolved in the arithmetic setting by Lindenstrauss (Fields Medal, 2010).
</div>

<div class="theorem">
<strong>Theorem 7.7.3 (Semiclassical Trace Formula).</strong> Let \(P_h = -h^2\Delta + V\) on a compact manifold, and let \(\chi \in C_c^\infty(\mathbb{R})\). Then

\[
\operatorname{Tr}(\chi(P_h)) = \frac{1}{(2\pi h)^n} \int_{T^*M} \chi(p(x,\xi)) \, dx \, d\xi + \sum_{k=1}^\infty h^k \int_{T^*M} c_k(x,\xi) \chi(p(x,\xi)) \, dx \, d\xi + \mathcal{O}(h^\infty),
\]
where the coefficients \(c_k\) are determined by the symbol of \(P_h\). The leading term is the Weyl term, and the subleading corrections encode geometric and dynamical information about the classical system.
</div>

<div class="remark">
<strong>Remark 7.7.4.</strong> The trace formula connects the spectral side (eigenvalues of \(P_h\)) with the geometric/dynamical side (the Hamiltonian flow of \(p\) on \(T^*M\)). In its more refined versions (Gutzwiller trace formula, Selberg trace formula), it relates individual eigenvalues to periodic orbits of the classical system. This is one of the deepest and most active areas of contemporary mathematical physics.
</div>

### 7.8 Conclusion

The semiclassical perspective brings the entire subject full circle. The distributions and Sobolev spaces of Chapter 1 provided the analytic foundation; the symbol calculus of Chapters 2--3 gave us the algebraic tools; the wavefront set of Chapter 4 revealed the geometric structure of singularities; the FIOs of Chapter 5 encoded symplectic transformations; the PDE applications of Chapter 6 demonstrated the power of the framework; and now semiclassical analysis shows how all of these ideas fit together in the regime where analysis meets geometry and physics. The passage from local to microlocal — from base manifold to cotangent bundle — is not merely a technical refinement but a genuine change in perspective, one that has transformed the study of linear PDE and continues to drive research in spectral theory, mathematical physics, and beyond.
