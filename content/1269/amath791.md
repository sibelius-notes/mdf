---
title: "AMATH 791: Inverse Problems and Data Assimilation"
subjects: "AMATH"
---

*These notes synthesize material from J. Kaipio and E. Somersalo's Statistical and Computational Inverse Problems, A. Kirsch's An Introduction to the Mathematical Theory of Inverse Problems, C.R. Vogel's Computational Methods for Inverse Problems, A.M. Stuart's "Inverse Problems: A Bayesian Perspective" (Acta Numerica, 2010), and supplementary material from MIT 18.327 lecture notes and Cambridge DAMTP Inverse Problems notes.*

---

## Chapter 1: Introduction to Inverse Problems

### 1.1 Forward and Inverse Problems

The study of inverse problems begins with a simple but profound observation: in the natural sciences and engineering, we often know the physical laws governing a system (expressed as differential or integral equations) and wish to determine the input, parameters, or initial conditions that produced a set of observed data. This stands in contrast to the classical *forward problem*, in which one computes the output of a known system given known inputs. The systematic mathematical study of inverse problems emerged in the twentieth century, though specific instances — such as the determination of a planet's orbit from astronomical observations — are as old as mathematical physics itself.

<div class="definition">
<strong>Definition 1.1 (Forward Problem).</strong> Let \(X\) and \(Y\) be normed spaces. A <em>forward problem</em> is the task of evaluating \(y = F(x)\) for a given mapping \(F: X \to Y\) and a given \(x \in X\). The mapping \(F\) is called the <em>forward operator</em> or <em>parameter-to-observable map</em>.
</div>

In a typical physical setting, \(x\) represents a cause (a source term, an initial condition, a material parameter), \(F\) encodes the governing physical law (e.g., solving a PDE), and \(y\) is the resulting observation or measurement. The forward problem is usually well-posed: given the cause, we can compute the effect.

<div class="definition">
<strong>Definition 1.2 (Inverse Problem).</strong> Given the forward operator \(F: X \to Y\) and an observation \(y \in Y\), the <em>inverse problem</em> is to find \(x \in X\) such that \(F(x) = y\). When \(y\) is contaminated by noise, we write \(y^\delta = F(x) + \eta\) where \(\|\eta\| \leq \delta\), and seek an approximation to \(x\).
</div>

The asymmetry between forward and inverse problems is fundamental. Forward problems typically enjoy existence, uniqueness, and stability of solutions; inverse problems typically violate one or more of these properties. This leads us to the central concept of well-posedness.

### 1.2 Well-Posedness and Ill-Posedness

The notion of a well-posed problem was introduced by Jacques Hadamard in his 1902 lectures on the Cauchy problem for partial differential equations. Hadamard believed that only well-posed problems could be physically meaningful — a view that has since been thoroughly overturned, as the most important problems in science and engineering are precisely the ill-posed ones.

<div class="definition">
<strong>Definition 1.3 (Well-Posedness in the Sense of Hadamard).</strong> A problem is <em>well-posed</em> in the sense of Hadamard if:
<ol>
<li><em>Existence:</em> For every admissible datum \(y \in Y\), there exists a solution \(x \in X\).</li>
<li><em>Uniqueness:</em> The solution is unique.</li>
<li><em>Stability:</em> The solution depends continuously on the data; that is, small perturbations in \(y\) produce small changes in \(x\).</li>
</ol>
A problem that fails any of these conditions is called <em>ill-posed</em>.
</div>

For inverse problems, the most insidious source of ill-posedness is typically the failure of stability. Even when a solution exists and is unique, the reconstruction may be catastrophically sensitive to noise: small measurement errors in \(y^\delta\) can produce arbitrarily large errors in the reconstructed \(x\). This phenomenon is intimately connected to the spectral properties of the forward operator, as we shall see in Chapter 2.

To appreciate the severity of instability, consider the following elementary example. Suppose \(A: \ell^2 \to \ell^2\) is the diagonal operator \((Ax)_n = \sigma_n x_n\) with \(\sigma_n = 1/n\). The exact solution of \(Ax = y\) is \(x_n = ny_n\). If the data is perturbed by \(\eta = (0, 0, \ldots, 0, \epsilon, 0, \ldots)\) with \(\epsilon\) in the \(N\)-th position, the perturbation in \(x\) has norm \(N\epsilon\), which grows without bound as \(N \to \infty\) even for fixed \(\epsilon > 0\). This is the essence of instability: arbitrarily small perturbations in the data (in the \(\ell^2\) norm) can produce arbitrarily large errors in the solution.

<div class="remark">
<strong>Remark 1.4.</strong> Hadamard's 1923 monograph "Lectures on Cauchy's Problem in Linear Partial Differential Equations" formalized the notion of well-posedness. He considered the backward heat equation as an example of an ill-posed problem and regarded such problems as mathematically pathological. It was not until the mid-twentieth century, through the work of A.N. Tikhonov, M.M. Lavrent'ev, V.K. Ivanov, and others in the Soviet school, that ill-posed problems were recognized as not only legitimate but central to applied mathematics.
</div>

### 1.3 Canonical Examples of Inverse Problems

We now present several classical inverse problems that will serve as recurring examples throughout the course. Each illustrates a different facet of ill-posedness and motivates the theoretical machinery to come.

<div class="example">
<strong>Example 1.5 (Backward Heat Equation).</strong> Consider the heat equation on \([0,\pi]\) with homogeneous Dirichlet boundary conditions:
\[
\frac{\partial u}{\partial t} = \frac{\partial^2 u}{\partial x^2}, \quad u(0,t) = u(\pi,t) = 0, \quad u(x,0) = f(x).
\]
The forward problem is: given \(f\), find \(u(x,T)\) for some \(T > 0\). The solution is
\[
u(x,T) = \sum_{n=1}^{\infty} f_n e^{-n^2 T} \sin(nx), \quad \text{where } f_n = \frac{2}{\pi}\int_0^\pi f(x)\sin(nx)\,dx.
\]
The inverse problem is: given a measurement \(g(x) = u(x,T)\), recover the initial condition \(f(x)\). This requires inverting the exponential decay, yielding \(f_n = g_n e^{n^2 T}\). Since the factors \(e^{n^2 T}\) grow super-exponentially, any noise in the high-frequency Fourier coefficients of \(g\) is amplified catastrophically. This is the prototypical example of a severely ill-posed problem.
</div>

The backward heat equation illustrates how smoothing operators — operators whose forward action damps high frequencies — produce ill-posed inverse problems. The degree of ill-posedness is determined by the rate at which the singular values of the forward operator decay to zero.

<div class="example">
<strong>Example 1.6 (X-ray Tomography and the Radon Transform).</strong> In computed tomography (CT), one measures the attenuation of X-rays passing through a body. If \(f(x)\) denotes the attenuation coefficient at position \(x \in \mathbb{R}^2\), the measurement along a line \(L\) is modeled by the <em>Radon transform</em>:
\[
(\mathcal{R}f)(s,\theta) = \int_L f(x)\,d\ell = \int_{-\infty}^{\infty} f(s\omega + t\omega^\perp)\,dt,
\]
where \(\omega = (\cos\theta, \sin\theta)\), \(\omega^\perp = (-\sin\theta, \cos\theta)\), and \(s \in \mathbb{R}\), \(\theta \in [0,\pi)\). The inverse problem — recovering \(f\) from \(\mathcal{R}f\) — is mildly ill-posed. The celebrated filtered backprojection algorithm of Radon (1917) and its modern descendants are the workhorses of medical CT imaging.
</div>

<div class="example">
<strong>Example 1.7 (Parameter Identification in an Elliptic PDE).</strong> Consider the elliptic boundary value problem
\[
-\nabla \cdot (a(x) \nabla u) = f \quad \text{in } \Omega, \qquad u = 0 \quad \text{on } \partial\Omega,
\]
where \(\Omega \subset \mathbb{R}^d\) is a bounded domain and \(a(x) > 0\) is the diffusion coefficient. The forward problem is: given \(a\) and \(f\), solve for \(u\). A natural inverse problem is: given measurements of \(u\) (or of the Neumann data \(a \frac{\partial u}{\partial \nu}\big|_{\partial\Omega}\) for various boundary conditions), recover the unknown coefficient \(a(x)\). This is a nonlinear inverse problem, and it arises in groundwater hydrology, medical imaging (electrical impedance tomography), and geophysics.
</div>

<div class="remark">
<strong>Remark 1.8.</strong> The three examples above represent, respectively, a linear severely ill-posed problem (backward heat equation), a linear mildly ill-posed problem (Radon transform inversion), and a nonlinear ill-posed problem (coefficient identification). The degree of ill-posedness — loosely, how fast the singular values of the linearized forward operator decay — has profound implications for the achievable accuracy of reconstruction and the choice of regularization method.
</div>

### 1.4 A Taxonomy of Inverse Problems

Inverse problems arise in virtually every area of science and engineering. It is useful to classify them along several axes. First, one distinguishes between *linear* inverse problems, where \(F\) is a linear operator, and *nonlinear* inverse problems. Second, one classifies by the nature of the unknown: it may be a function (infinite-dimensional), a finite-dimensional parameter vector, or a geometric object (e.g., the shape of a scatterer). Third, one distinguishes the degree of ill-posedness: a problem is *mildly ill-posed* if the singular values of the forward operator decay polynomially, and *severely ill-posed* if they decay exponentially or faster.

<div class="definition">
<strong>Definition 1.9 (Degree of Ill-Posedness).</strong> Consider a compact operator \(A: X \to Y\) with singular values \(\{\sigma_n\}\). The inverse problem \(Ax = y\) is called:
<ul>
<li><em>Mildly ill-posed</em> if \(\sigma_n \sim n^{-\alpha}\) for some \(\alpha > 0\) (polynomial decay).</li>
<li><em>Severely ill-posed</em> if \(\sigma_n \sim e^{-\alpha n^\beta}\) for some \(\alpha, \beta > 0\) (exponential or super-exponential decay).</li>
</ul>
</div>

The degree of ill-posedness determines the fundamental limits of reconstruction accuracy. For mildly ill-posed problems, Hölder-type convergence rates (powers of the noise level \(\delta\)) are achievable. For severely ill-posed problems, the best achievable convergence rates are only logarithmic in \(\delta\), reflecting the extreme difficulty of recovering information that has been exponentially damped.

<div class="example">
<strong>Example 1.10 (Integral Equation of the First Kind).</strong> The Fredholm integral equation of the first kind,
\[
(Af)(t) = \int_0^1 k(t,s) f(s)\,ds = g(t), \quad t \in [0,1],
\]
with a smooth kernel \(k \in C^\infty([0,1]^2)\), is a canonical example of an ill-posed problem. The operator \(A: L^2[0,1] \to L^2[0,1]\) is compact, and the smoothness of the kernel determines the rate of singular value decay. For analytic kernels, the decay is typically exponential (severely ill-posed); for finitely differentiable kernels, the decay is polynomial (mildly ill-posed).
</div>

Throughout this course, we shall develop three complementary approaches to tackling ill-posed inverse problems: deterministic regularization theory (Chapters 2–4), the Bayesian/statistical approach (Chapters 5–6), and data assimilation for dynamical systems (Chapter 7). Each perspective offers distinct insights and computational tools, and a mature practitioner must be conversant in all three.

---

## Chapter 2: Linear Inverse Problems and Regularization

### 2.1 Compact Operators and Singular Value Decomposition

We begin the mathematical theory of linear inverse problems by recalling the spectral theory of compact operators on Hilbert spaces. The singular value decomposition (SVD) is the fundamental structural tool for understanding ill-posedness and designing regularization methods.

Let \(X\) and \(Y\) be infinite-dimensional separable Hilbert spaces with inner products \(\langle \cdot, \cdot \rangle_X\) and \(\langle \cdot, \cdot \rangle_Y\), respectively. Throughout this chapter, \(A: X \to Y\) denotes a bounded linear operator.

<div class="definition">
<strong>Definition 2.1 (Compact Operator).</strong> A bounded linear operator \(A: X \to Y\) is <em>compact</em> if the image \(A(B)\) of the unit ball \(B = \{x \in X : \|x\|_X \leq 1\}\) has compact closure in \(Y\). Equivalently, \(A\) maps every bounded sequence to a sequence with a convergent subsequence.
</div>

Compact operators are the natural setting for infinite-dimensional inverse problems. Integral operators with square-integrable kernels, solution operators for elliptic PDEs mapping data to boundary measurements, and the Radon transform (on appropriate function spaces) are all compact. The key property of a compact operator \(A\) is that it cannot have a bounded inverse on an infinite-dimensional space: if \(A\) is compact and injective, then \(A^{-1}\) is unbounded on the range of \(A\). This is the operator-theoretic root of ill-posedness.

<div class="theorem">
<strong>Theorem 2.2 (Singular Value Decomposition).</strong> Let \(A: X \to Y\) be a compact operator between separable Hilbert spaces. Then there exist orthonormal systems \(\{v_n\}_{n=1}^\infty \subset X\) and \(\{u_n\}_{n=1}^\infty \subset Y\), and a sequence \(\sigma_1 \geq \sigma_2 \geq \cdots > 0\) with \(\sigma_n \to 0\), such that
\[
Ax = \sum_{n=1}^{\infty} \sigma_n \langle x, v_n \rangle_X \, u_n \quad \text{for all } x \in X.
\]
The numbers \(\sigma_n\) are called the <em>singular values</em> of \(A\), and the triples \((\sigma_n, v_n, u_n)\) form the <em>singular system</em>. We have \(A v_n = \sigma_n u_n\) and \(A^* u_n = \sigma_n v_n\), where \(A^*\) is the Hilbert-space adjoint.
</div>

<div class="proof">
<strong>Proof.</strong> Consider the self-adjoint compact operator \(A^*A: X \to X\). By the spectral theorem for compact self-adjoint operators, there exist eigenvalues \(\lambda_1 \geq \lambda_2 \geq \cdots > 0\) with \(\lambda_n \to 0\) and corresponding orthonormal eigenvectors \(v_n\) such that \(A^*A v_n = \lambda_n v_n\). Set \(\sigma_n = \sqrt{\lambda_n}\) and \(u_n = \sigma_n^{-1} A v_n\). Then \(\{u_n\}\) is orthonormal in \(Y\) since \(\langle u_m, u_n \rangle_Y = \sigma_m^{-1}\sigma_n^{-1} \langle Av_m, Av_n\rangle_Y = \sigma_m^{-1}\sigma_n^{-1}\langle A^*Av_m, v_n\rangle_X = \delta_{mn}\). The expansion follows from the completeness of \(\{v_n\}\) in \((\ker A)^\perp\). \(\square\)
</div>

The SVD reveals the mechanism of ill-posedness with crystalline clarity. The equation \(Ax = y\) has the formal solution
\[
x = \sum_{n=1}^{\infty} \frac{1}{\sigma_n} \langle y, u_n \rangle_Y \, v_n,
\]
which converges if and only if the Picard condition \(\sum_{n=1}^\infty \sigma_n^{-2} |\langle y, u_n\rangle_Y|^2 < \infty\) is satisfied. For noisy data \(y^\delta\), the high-frequency noise components \(\langle y^\delta, u_n\rangle_Y\) do not decay, and division by the vanishing \(\sigma_n\) produces catastrophic amplification. Regularization, in all its forms, is fundamentally about suppressing these unstable high-frequency components.

### 2.2 Ill-Posed Operator Equations and the Moore-Penrose Inverse

<div class="definition">
<strong>Definition 2.3 (Moore-Penrose Generalized Inverse).</strong> Let \(A: X \to Y\) be a bounded linear operator with closed range. The <em>Moore-Penrose generalized inverse</em> \(A^\dagger: Y \to X\) is defined as follows: for \(y \in \mathcal{D}(A^\dagger) = \mathcal{R}(A) \oplus \mathcal{R}(A)^\perp\), the element \(x^\dagger = A^\dagger y\) is the unique element of minimal norm in \(X\) that minimizes \(\|Ax - y\|_Y\).
</div>

When \(A\) is compact and injective, \(A^\dagger\) exists on \(\mathcal{R}(A) \oplus \mathcal{R}(A)^\perp = Y\) but is unbounded — the hallmark of ill-posedness. In terms of the SVD, the Moore-Penrose inverse acts as
\[
A^\dagger y = \sum_{n=1}^{\infty} \frac{1}{\sigma_n} \langle y, u_n \rangle_Y \, v_n,
\]
defined on the domain of all \(y\) for which this series converges.

<div class="theorem">
<strong>Theorem 2.4 (Picard Criterion).</strong> Let \(A: X \to Y\) be compact with singular system \((\sigma_n, v_n, u_n)\). An element \(y \in Y\) belongs to the range \(\mathcal{R}(A)\) if and only if
\[
\sum_{n=1}^{\infty} \frac{|\langle y, u_n\rangle_Y|^2}{\sigma_n^2} < \infty.
\]
</div>

The Picard criterion provides a precise diagnostic for solvability and reveals why noisy data \(y^\delta\) almost never lies in the range of \(A\): noise typically has Fourier coefficients that do not decay fast enough to compensate for the growth of \(\sigma_n^{-2}\).

<div class="example">
<strong>Example 2.5 (Picard Condition for the Backward Heat Equation).</strong> Returning to Example 1.5, the forward operator \(A: L^2[0,\pi] \to L^2[0,\pi]\) maps \(f \mapsto u(\cdot, T)\) with singular values \(\sigma_n = e^{-n^2 T}\). For exact data \(g = Af\), the Fourier coefficients satisfy \(|\langle g, u_n\rangle| = e^{-n^2 T}|f_n|\), and the Picard condition \(\sum_n e^{2n^2 T}|g_n|^2 < \infty\) holds if and only if \(\sum_n |f_n|^2 < \infty\), i.e., \(f \in L^2\). But if \(g\) is perturbed by even a tiny amount of white noise — whose Fourier coefficients do not decay — the Picard condition fails catastrophically. This is the spectral explanation of the severe ill-posedness of backward diffusion.
</div>

### 2.3 The Regularization Framework

Before presenting specific regularization methods, we introduce the general framework that unifies them.

<div class="definition">
<strong>Definition 2.6 (Regularization Method).</strong> A family of continuous operators \(\{R_\alpha: Y \to X\}_{\alpha > 0}\) is a <em>regularization method</em> (or <em>regularization strategy</em>) for the operator equation \(Ax = y\) if, for every \(y \in \mathcal{R}(A)\),
\[
\lim_{\alpha \to 0} R_\alpha y = A^\dagger y.
\]
If \(\alpha = \alpha(\delta, y^\delta)\) is chosen depending on the noise level and the data such that \(R_{\alpha(\delta)} y^\delta \to A^\dagger y\) as \(\delta \to 0\) whenever \(\|y^\delta - y\| \leq \delta\), then \(\alpha(\cdot)\) is called a <em>parameter choice rule</em> and the pair \((R_\alpha, \alpha(\cdot))\) is a <em>convergent regularization method</em>.
</div>

This abstract definition captures the essence of regularization: approximating the unbounded operator \(A^\dagger\) by a family of bounded operators, parameterized by \(\alpha\), that converge pointwise on the range of \(A\). The art of regularization lies in designing families \(\{R_\alpha\}\) that have good approximation properties and in choosing \(\alpha\) to balance the competing demands of fidelity and stability.

### 2.4 Tikhonov Regularization

The idea of stabilizing an ill-posed problem by adding a penalty term was introduced independently by A.N. Tikhonov (1943, 1963) and D.L. Phillips (1962). Tikhonov regularization is the most widely used and best-understood regularization method.

<div class="definition">
<strong>Definition 2.7 (Tikhonov Regularization).</strong> Given the operator equation \(Ax = y^\delta\) with noisy data \(y^\delta\), the <em>Tikhonov regularized solution</em> is
\[
x_\alpha^\delta = \arg\min_{x \in X} \left\{ \|Ax - y^\delta\|_Y^2 + \alpha \|x\|_X^2 \right\},
\]
where \(\alpha > 0\) is the <em>regularization parameter</em>.
</div>

The regularized solution admits the explicit representation
\[
x_\alpha^\delta = (A^*A + \alpha I)^{-1} A^* y^\delta = \sum_{n=1}^{\infty} \frac{\sigma_n}{\sigma_n^2 + \alpha} \langle y^\delta, u_n \rangle_Y \, v_n.
\]
The filter factors \(q_n(\alpha) = \sigma_n^2/(\sigma_n^2 + \alpha)\) smoothly interpolate between 0 (for \(\sigma_n \ll \sqrt{\alpha}\)) and 1 (for \(\sigma_n \gg \sqrt{\alpha}\)), effectively cutting off the unstable high-frequency components. The regularization parameter \(\alpha\) controls the trade-off between fidelity to the data (small residual) and stability (small norm of the solution).

<div class="theorem">
<strong>Theorem 2.8 (Convergence of Tikhonov Regularization).</strong> Let \(A: X \to Y\) be a compact injective operator, let \(x^\dagger = A^\dagger y\), and let \(y^\delta\) satisfy \(\|y^\delta - y\| \leq \delta\). If the regularization parameter is chosen such that \(\alpha(\delta) \to 0\) and \(\delta^2/\alpha(\delta) \to 0\) as \(\delta \to 0\), then
\[
\|x_{\alpha(\delta)}^\delta - x^\dagger\|_X \to 0 \quad \text{as } \delta \to 0.
\]
</div>

<div class="proof">
<strong>Proof.</strong> We decompose the error as
\[
x_\alpha^\delta - x^\dagger = (R_\alpha A - I)x^\dagger + R_\alpha(y^\delta - y),
\]
where \(R_\alpha = (A^*A + \alpha I)^{-1}A^*\) is the Tikhonov reconstruction operator. For the first term (the bias or approximation error), using the SVD representation one shows that \(\|(R_\alpha A - I)x^\dagger\| \to 0\) as \(\alpha \to 0\) for any \(x^\dagger \in X\). For the second term (the variance or propagated noise error), one has \(\|R_\alpha\| = \sup_n \sigma_n/(\sigma_n^2 + \alpha) \leq 1/(2\sqrt{\alpha})\), so
\[
\|R_\alpha(y^\delta - y)\| \leq \frac{\delta}{2\sqrt{\alpha}}.
\]
Under the condition \(\delta^2/\alpha \to 0\), the noise term vanishes. Combining both terms yields the result. \(\square\)
</div>

The convergence rate depends critically on the smoothness of the true solution. This is quantified through *source conditions*, which express regularity by requiring that \(x^\dagger\) lies in the range of a power of \(A^*A\).

<div class="theorem">
<strong>Theorem 2.9 (Convergence Rates under Source Conditions).</strong> Suppose \(x^\dagger = (A^*A)^\nu w\) for some \(w \in X\) with \(\|w\| \leq \rho\) (a source condition of order \(\nu > 0\)). With the a priori parameter choice \(\alpha \sim (\delta/\rho)^{2/(2\nu+1)}\), the Tikhonov regularized solution satisfies
\[
\|x_\alpha^\delta - x^\dagger\| = O\!\left(\delta^{2\nu/(2\nu+1)}\right) \quad \text{as } \delta \to 0.
\]
For \(\nu = 1/2\) (i.e., \(x^\dagger \in \mathcal{R}(A^*)\)), this gives the rate \(O(\delta^{1/2})\). For \(\nu = 1\) (i.e., \(x^\dagger \in \mathcal{R}(A^*A)\)), the rate is \(O(\delta^{2/3})\).
</div>

<div class="remark">
<strong>Remark 2.10.</strong> The rate \(O(\delta^{2\nu/(2\nu+1)})\) is optimal among all regularization methods (in the minimax sense) for source conditions of order \(\nu \leq 1\). This was established by various authors including Natterer and Vainikko. For \(\nu > 1\), Tikhonov regularization with the standard \(\|x\|^2\) penalty is no longer order-optimal; one must use higher-order penalties or different methods.
</div>

In many applications, one has additional prior information about the solution — for instance, that it is smooth, or that certain components should be penalized differently. This motivates a generalization of Tikhonov regularization.

<div class="definition">
<strong>Definition 2.11 (Generalized Tikhonov Regularization).</strong> Given a bounded linear operator \(L: X \to Z\) (the <em>regularization operator</em>), the <em>generalized Tikhonov regularized solution</em> is
\[
x_\alpha^\delta = \arg\min_{x \in X} \left\{ \|Ax - y^\delta\|_Y^2 + \alpha \|Lx\|_Z^2 \right\}.
\]
Common choices include \(L = I\) (standard Tikhonov), \(L = \frac{d}{dx}\) (penalizing the first derivative, promoting smoothness), and \(L = \frac{d^2}{dx^2}\) (penalizing curvature).
</div>

The choice of \(L\) encodes prior knowledge about the solution's regularity. When \(L\) is a differential operator, the penalty promotes smoothness of the reconstructed solution. This is closely connected to the Bayesian perspective (Chapter 5): the generalized Tikhonov penalty \(\|Lx\|^2\) corresponds to a Gaussian prior whose precision operator (inverse covariance) is \(L^*L\).

### 2.5 Truncated Singular Value Decomposition

An alternative to Tikhonov regularization is to simply truncate the SVD expansion at an appropriate level, discarding the components associated with small singular values.

<div class="definition">
<strong>Definition 2.12 (Truncated SVD, TSVD).</strong> Given the operator equation \(Ax = y^\delta\) and a truncation level \(N \in \mathbb{N}\), the <em>truncated SVD solution</em> is
\[
x_N^\delta = \sum_{n=1}^{N} \frac{1}{\sigma_n} \langle y^\delta, u_n \rangle_Y \, v_n.
\]
</div>

The TSVD uses the sharp filter \(q_n = 1\) for \(n \leq N\) and \(q_n = 0\) for \(n > N\). While less smooth than Tikhonov's filter, TSVD has the advantage of being a projection method, making it natural in settings where one works with a finite number of basis functions. The truncation level \(N\) plays the role of the regularization parameter: small \(N\) gives a smooth but biased reconstruction; large \(N\) includes more detail but also more noise.

<div class="theorem">
<strong>Theorem 2.13 (TSVD Convergence Rates).</strong> Under the source condition \(x^\dagger = (A^*A)^\nu w\), with the parameter choice \(N = N(\delta)\) determined by \(\sigma_{N+1} \sim (\delta/\rho)^{1/(2\nu+1)}\), the TSVD solution achieves the same optimal convergence rate as Tikhonov regularization:
\[
\|x_{N(\delta)}^\delta - x^\dagger\| = O\!\left(\delta^{2\nu/(2\nu+1)}\right).
\]
</div>

### 2.6 Parameter Choice Methods

The practical effectiveness of any regularization method hinges on the choice of the regularization parameter. There are two fundamentally different approaches: *a priori* methods, which choose the parameter based on the noise level \(\delta\) and assumed smoothness of the solution (without looking at the data), and *a posteriori* methods, which use the data to guide the choice.

<div class="definition">
<strong>Definition 2.14 (Morozov Discrepancy Principle).</strong> Given a noise level \(\delta > 0\) and a constant \(\tau > 1\), the <em>Morozov discrepancy principle</em> selects the regularization parameter \(\alpha = \alpha(\delta)\) as the solution of
\[
\|A x_\alpha^\delta - y^\delta\|_Y = \tau \delta.
\]
The idea is that the residual should be comparable to the noise level: fitting the data more closely than the noise level \(\delta\) amounts to fitting noise.
</div>

<div class="theorem">
<strong>Theorem 2.15 (Convergence under the Discrepancy Principle).</strong> If \(\alpha(\delta)\) is chosen by the Morozov discrepancy principle with \(\tau > 1\), then the Tikhonov regularized solution converges: \(\|x_{\alpha(\delta)}^\delta - x^\dagger\| \to 0\) as \(\delta \to 0\). Under the source condition \(x^\dagger \in \mathcal{R}(A^*)\), the rate \(O(\delta^{1/2})\) is achieved.
</div>

The discrepancy principle requires knowledge of the noise level \(\delta\), which may not always be available in practice. The L-curve method, introduced by P.C. Hansen in the early 1990s, provides a heuristic alternative.

<div class="definition">
<strong>Definition 2.16 (L-Curve Method).</strong> The <em>L-curve</em> is the parametric plot of \((\log\|Ax_\alpha^\delta - y^\delta\|, \log\|x_\alpha^\delta\|)\) as \(\alpha\) varies. The L-curve method selects \(\alpha\) at the point of maximum curvature of this curve, which typically exhibits a characteristic "L" shape: the vertical part corresponds to over-regularization (large \(\alpha\)), and the horizontal part to under-regularization (small \(\alpha\)).
</div>

<div class="remark">
<strong>Remark 2.17.</strong> While the L-curve method is popular in practice and often works well, it is not guaranteed to be a convergent regularization strategy in the sense of Definition 2.6. Hanke and Raus (1996) constructed counterexamples. Nevertheless, its simplicity and the visual insight it provides make it a valuable practical tool, especially when the noise level is unknown.
</div>

<div class="example">
<strong>Example 2.18 (Numerical Differentiation).</strong> Consider the problem of recovering \(f = g'\) from noisy measurements of \(g\). We can write this as the inverse problem \(Af = g\) where \((Af)(t) = \int_0^t f(s)\,ds\). The operator \(A: L^2[0,1] \to L^2[0,1]\) is compact, and its singular values satisfy \(\sigma_n = 1/(n\pi - \pi/2) \sim 1/(n\pi)\) for large \(n\). This is a mildly ill-posed problem (polynomial singular value decay). Tikhonov regularization with \(\alpha \sim \delta^{2/3}\) yields the convergence rate \(\|x_\alpha^\delta - x^\dagger\| = O(\delta^{1/3})\) under minimal regularity, improving to \(O(\delta^{2/3})\) if \(f\) is sufficiently smooth.
</div>

---

## Chapter 3: Iterative Regularization Methods

### 3.1 The Landweber Iteration

While Tikhonov regularization and TSVD produce the regularized solution in one step (or by solving a single linear system), iterative methods generate a sequence of approximations that, if stopped at the right iterate, provide a regularized solution. The simplest such method is the Landweber iteration, introduced by L. Landweber in 1951 in the context of antenna theory.

<div class="definition">
<strong>Definition 3.1 (Landweber Iteration).</strong> Given the operator equation \(Ax = y^\delta\), the <em>Landweber iteration</em> is the fixed-point iteration
\[
x_{k+1}^\delta = x_k^\delta + \omega A^*(y^\delta - Ax_k^\delta), \quad k = 0, 1, 2, \ldots,
\]
with initial guess \(x_0^\delta = 0\) and relaxation parameter \(0 < \omega < 2/\|A\|^2\).
</div>

The Landweber iteration is a steepest descent method applied to the normal equation \(A^*Ax = A^*y^\delta\), with step size \(\omega\). The iteration has the SVD representation
\[
x_k^\delta = \sum_{n=1}^{\infty} \frac{1 - (1 - \omega\sigma_n^2)^k}{\sigma_n} \langle y^\delta, u_n\rangle_Y \, v_n,
\]
with filter factors \(q_n^{(k)} = 1 - (1-\omega\sigma_n^2)^k\). For small singular values (\(\sigma_n^2 \ll 1/k\)), we have \(q_n^{(k)} \approx k\omega\sigma_n^2 \approx 0\), so the corresponding components are suppressed. As the iteration count \(k\) increases, more components are included, and the iteration number plays the role of the regularization parameter (with larger \(k\) corresponding to weaker regularization, i.e., smaller \(\alpha\)).

<div class="theorem">
<strong>Theorem 3.2 (Convergence of Landweber Iteration).</strong> Let \(A: X \to Y\) be compact and injective, and let \(y = Ax^\dagger\). For exact data (\(\delta = 0\)), the iterates \(x_k\) converge to \(x^\dagger\) as \(k \to \infty\). For noisy data, the iterates first approach \(x^\dagger\) and then diverge (the <em>semi-convergence</em> phenomenon). Under the source condition \(x^\dagger = (A^*A)^\nu w\) with \(\|w\| \leq \rho\), stopping at iteration \(k^* \sim (\rho/\delta)^{2/(2\nu+1)}\) yields the optimal rate
\[
\|x_{k^*}^\delta - x^\dagger\| = O\!\left(\delta^{2\nu/(2\nu+1)}\right).
\]
</div>

<div class="proof">
<strong>Proof.</strong> We sketch the key steps. Write the error as \(e_k = x_k^\delta - x^\dagger\). Using the SVD, the bias component satisfies \(\|e_k^{\text{bias}}\|^2 = \sum_n (1-\omega\sigma_n^2)^{2k} |\langle x^\dagger, v_n\rangle|^2\), which decreases monotonically in \(k\). The noise component satisfies \(\|e_k^{\text{noise}}\|^2 = \sum_n q_n^{(k)2}/\sigma_n^2 \cdot |\langle y^\delta - y, u_n\rangle|^2\), which increases in \(k\). The source condition \(x^\dagger = (A^*A)^\nu w\) implies \(\langle x^\dagger, v_n\rangle = \sigma_n^{2\nu} \langle w, v_n\rangle\), giving the bias bound \(\|e_k^{\text{bias}}\| \leq C_\nu \rho k^{-\nu}\). The noise bound is \(\|e_k^{\text{noise}}\| \leq C\sqrt{k}\delta\). Balancing at \(k^* \sim (\rho/\delta)^{2/(2\nu+1)}\) yields the optimal rate. \(\square\)
</div>

The semi-convergence phenomenon — wherein iterates initially improve and then degrade — is the defining feature of iterative regularization. It means that the stopping rule is not merely a computational convenience but an integral part of the regularization strategy.

### 3.2 Conjugate Gradient Methods as Regularization

The Landweber iteration converges slowly because it uses only gradient information and has a fixed step size. Conjugate gradient (CG) methods converge much faster by exploiting conjugacy, and they too exhibit the semi-convergence property when applied to ill-posed problems.

<div class="definition">
<strong>Definition 3.3 (CGLS — Conjugate Gradients for Least Squares).</strong> The <em>CGLS method</em> applies the conjugate gradient algorithm to the normal equations \(A^*Ax = A^*y^\delta\). Starting from \(x_0 = 0\), \(r_0 = A^*y^\delta\), \(p_0 = r_0\), the iterates are:
\[
\alpha_k = \frac{\|r_k\|^2}{\|Ap_k\|^2}, \quad x_{k+1} = x_k + \alpha_k p_k, \quad r_{k+1} = r_k - \alpha_k A^*A p_k, \quad \beta_k = \frac{\|r_{k+1}\|^2}{\|r_k\|^2}, \quad p_{k+1} = r_{k+1} + \beta_k p_k.
\]
</div>

The CG method has the remarkable property that the \(k\)-th iterate minimizes the residual over the Krylov subspace \(\mathcal{K}_k(A^*A, A^*y^\delta) = \text{span}\{A^*y^\delta, (A^*A)A^*y^\delta, \ldots, (A^*A)^{k-1}A^*y^\delta\}\). This optimal approximation property makes CG converge much faster than Landweber, often reaching a given accuracy in far fewer iterations.

<div class="theorem">
<strong>Theorem 3.4 (Nemirovskii, 1986).</strong> The CGLS method, stopped by the discrepancy principle \(\|Ax_k^\delta - y^\delta\| \leq \tau\delta < \|Ax_{k-1}^\delta - y^\delta\|\) with \(\tau > 1\), is a regularization method: \(x_{k(\delta)}^\delta \to x^\dagger\) as \(\delta \to 0\). Moreover, under the source condition \(x^\dagger = A^*w\), the method achieves the optimal rate \(O(\delta^{1/2})\) in at most \(O(\delta^{-1/2})\) iterations — compared to \(O(\delta^{-1})\) iterations for Landweber.
</div>

<div class="remark">
<strong>Remark 3.5.</strong> The acceleration from Landweber to CG comes at a cost: unlike Landweber, the CG filter factors are not monotone, and the semi-convergence behavior can be more erratic. In practice, CG methods are preferred when the operator \(A\) has a wide range of singular values, making Landweber impractically slow.
</div>

### 3.3 The Kaczmarz Method

In many practical inverse problems, the data consists of multiple measurements, and the operator equation has a row-wise structure. The Kaczmarz method, also known as the algebraic reconstruction technique (ART) in tomographic imaging, exploits this structure by cycling through the equations one at a time.

<div class="definition">
<strong>Definition 3.6 (Kaczmarz Method).</strong> Suppose the data consists of \(m\) measurements: \(A_i x = y_i^\delta\) for \(i = 1, \ldots, m\), where each \(A_i: X \to Y_i\) is a bounded linear operator. The <em>Kaczmarz iteration</em> performs cyclic projections:
\[
x_{k+1}^\delta = x_k^\delta + \omega A_{[k]}^* (A_{[k]} A_{[k]}^*)^{-1}(y_{[k]}^\delta - A_{[k]} x_k^\delta),
\]
where \([k] = (k \mod m) + 1\) cycles through the row indices.
</div>

The Kaczmarz method was originally proposed by Stefan Kaczmarz in 1937 for finite-dimensional linear systems, and was rediscovered by Gordon, Bender, and Herman in 1970 as the ART algorithm for computed tomography. For consistent systems, the iterates converge to the least-norm solution. For ill-posed problems, the method again exhibits semi-convergence and must be stopped early.

<div class="example">
<strong>Example 3.7 (Kaczmarz for CT Reconstruction).</strong> In parallel-beam computed tomography, each row \(A_i\) corresponds to integration along a single X-ray path. The Kaczmarz method updates the image estimate after each ray, making it memory-efficient and suitable for large-scale problems. Stopping after one or a few cycles through all rays provides a regularized reconstruction. This is the basis of the widely used SART (Simultaneous Algebraic Reconstruction Technique) and OS-EM (Ordered Subsets Expectation Maximization) algorithms.
</div>

### 3.4 Stopping Rules as Regularization

The preceding sections show that, for iterative methods applied to ill-posed problems, the iteration count serves as the regularization parameter. This raises the question: how should one choose the stopping index?

<div class="definition">
<strong>Definition 3.8 (Discrepancy Principle for Iterative Methods).</strong> Given a noise level \(\delta\) and a constant \(\tau > 1\), the <em>discrepancy principle</em> terminates the iteration at the first index \(k^*\) such that
\[
\|Ax_{k^*}^\delta - y^\delta\|_Y \leq \tau \delta.
\]
</div>

<div class="theorem">
<strong>Theorem 3.9 (Regularization Property of Early Stopping).</strong> For the Landweber iteration with stopping index \(k^*(\delta)\) chosen by the discrepancy principle (with \(\tau > 1\)), we have:
<ol>
<li>The stopping index is finite for every \(\delta > 0\).</li>
<li>As \(\delta \to 0\), \(k^*(\delta) \to \infty\) and \(x_{k^*(\delta)}^\delta \to x^\dagger\).</li>
<li>Under the source condition \(x^\dagger \in \mathcal{R}((A^*A)^\nu)\) with \(0 < \nu \leq 1/2\), the convergence rate is \(O(\delta^{2\nu/(2\nu+1)})\).</li>
</ol>
</div>

<div class="remark">
<strong>Remark 3.10.</strong> Beyond the discrepancy principle, other stopping rules include the Lepskii balancing principle (which does not require knowledge of \(\delta\)), cross-validation, and the L-curve method applied to the iteration path. Each has its theoretical strengths and practical limitations. In the absence of a reliable noise estimate, the Lepskii principle is theoretically attractive as it achieves adaptive (nearly optimal) rates.
</div>

### 3.5 Comparison of Regularization Methods

It is instructive to compare the regularization methods developed in Chapters 2 and 3 from both theoretical and practical perspectives.

<div class="example">
<strong>Example 3.11 (Regularization Methods for Image Deblurring).</strong> Consider the deblurring problem \(Ax = y^\delta\), where \(A\) is a convolution operator with a Gaussian point spread function of width \(\sigma_{\text{psf}}\). This is a mildly ill-posed problem with singular values decaying as \(\sigma_n \sim e^{-cn^2}\) (the Gaussian decay makes this actually a severely ill-posed problem, despite the polynomial naming convention for the degree). For a \(256 \times 256\) test image corrupted with 1% Gaussian noise:
<ul>
<li>Tikhonov regularization with the discrepancy principle produces a smooth reconstruction with relative error approximately 15%.</li>
<li>TSVD with optimally chosen truncation level gives a similar error but introduces Gibbs-like ringing artifacts near sharp edges.</li>
<li>CGLS stopped by the discrepancy principle achieves approximately 12% error in about 30 iterations, compared to over 2000 iterations for Landweber.</li>
</ul>
These comparisons highlight the practical superiority of CG-based methods for large-scale problems, while Tikhonov regularization remains the method of choice when its normal equations can be solved efficiently.
</div>

The choice of regularization method in practice depends on several factors: the size of the problem (Tikhonov requires solving a linear system, while iterative methods require only matrix-vector products), the available information about the noise level (the discrepancy principle requires \(\delta\), the L-curve does not), the desired smoothness properties of the reconstruction, and computational resources.

---

## Chapter 4: Nonlinear Inverse Problems

### 4.1 Fréchet Differentiability and Linearization

Most physically important inverse problems are nonlinear: the forward operator \(F: X \to Y\) is a nonlinear mapping between function spaces. Examples include coefficient identification in PDEs, inverse scattering, and shape reconstruction. The analysis of nonlinear inverse problems relies on linearization, which requires the concept of Fréchet differentiability.

<div class="definition">
<strong>Definition 4.1 (Fréchet Derivative).</strong> Let \(X\) and \(Y\) be Banach spaces and \(F: \mathcal{D}(F) \subseteq X \to Y\). The operator \(F\) is <em>Fréchet differentiable</em> at \(x \in \mathcal{D}(F)\) if there exists a bounded linear operator \(F'(x): X \to Y\) such that
\[
\lim_{\|h\| \to 0} \frac{\|F(x+h) - F(x) - F'(x)h\|_Y}{\|h\|_X} = 0.
\]
The operator \(F'(x)\) is called the <em>Fréchet derivative</em> (or Jacobian) of \(F\) at \(x\).
</div>

The Fréchet derivative is the infinite-dimensional generalization of the Jacobian matrix. For PDE-based forward operators, computing \(F'(x)h\) typically requires solving a *sensitivity equation* — a linearized version of the governing PDE.

<div class="example">
<strong>Example 4.2 (Fréchet Derivative for an Elliptic Coefficient Problem).</strong> Consider the forward operator \(F: a \mapsto u\), where \(u\) solves
\[
-\nabla \cdot (a \nabla u) = f \quad \text{in } \Omega, \quad u = 0 \quad \text{on } \partial\Omega.
\]
Let \(a_0 \in L^\infty(\Omega)\) with \(a_0 \geq c > 0\), and let \(u_0 = F(a_0)\). The Fréchet derivative \(F'(a_0): L^\infty(\Omega) \to H^1_0(\Omega)\) at \(a_0\) in the direction \(h\) is \(F'(a_0)h = w\), where \(w\) solves the sensitivity equation
\[
-\nabla \cdot (a_0 \nabla w) = \nabla \cdot (h \nabla u_0) \quad \text{in } \Omega, \quad w = 0 \quad \text{on } \partial\Omega.
\]
This is a linear elliptic PDE with the same principal part as the forward problem.
</div>

### 4.2 Newton Methods for Ill-Posed Problems

The classical Newton method for solving the nonlinear equation \(F(x) = y\) generates iterates by linearizing at the current approximation and solving the linearized equation. For ill-posed problems, the linearized equation inherits the ill-posedness, and regularization must be applied at each Newton step.

<div class="definition">
<strong>Definition 4.3 (Gauss-Newton Method).</strong> The <em>Gauss-Newton method</em> for the nonlinear least-squares problem \(\min_x \|F(x) - y^\delta\|^2\) generates iterates via
\[
x_{k+1} = x_k + s_k, \quad \text{where } s_k = \arg\min_s \|F'(x_k)s - (y^\delta - F(x_k))\|_Y^2.
\]
When \(F'(x_k)\) is compact (as it is for most PDE-based problems), the linearized subproblem at each step is ill-posed and requires regularization.
</div>

<div class="definition">
<strong>Definition 4.4 (Levenberg-Marquardt Method).</strong> The <em>Levenberg-Marquardt method</em> applies Tikhonov regularization to each Gauss-Newton subproblem:
\[
s_k = \arg\min_s \left\{ \|F'(x_k)s - (y^\delta - F(x_k))\|_Y^2 + \alpha_k \|s\|_X^2 \right\},
\]
or equivalently, \(s_k = (F'(x_k)^*F'(x_k) + \alpha_k I)^{-1} F'(x_k)^*(y^\delta - F(x_k))\). The regularization parameter \(\alpha_k > 0\) may vary from step to step.
</div>

The Levenberg-Marquardt method interpolates between the Gauss-Newton method (\(\alpha_k \to 0\)) and the gradient descent method (\(\alpha_k \to \infty\)). For well-posed problems, one typically decreases \(\alpha_k\) as convergence is approached. For ill-posed problems, the choice of \(\alpha_k\) must balance regularization against the desire for fast convergence.

<div class="definition">
<strong>Definition 4.5 (Iteratively Regularized Gauss-Newton Method, IRGNM).</strong> The <em>IRGNM</em> generates iterates via
\[
x_{k+1} = x_k + (F'(x_k)^*F'(x_k) + \alpha_k I)^{-1}\big(F'(x_k)^*(y^\delta - F(x_k)) - \alpha_k(x_k - x_0)\big),
\]
where \(\alpha_k\) is a decreasing sequence with \(\alpha_k \to 0\), and \(x_0\) is an initial guess. Equivalently, \(x_{k+1}\) minimizes
\[
\|F'(x_k)(x - x_k) - (y^\delta - F(x_k))\|_Y^2 + \alpha_k \|x - x_0\|_X^2.
\]
</div>

The IRGNM was introduced by Bakushinskii (1992) and has become one of the most successful methods for nonlinear ill-posed problems. The key innovation over Levenberg-Marquardt is the penalty \(\|x - x_0\|^2\) rather than \(\|x - x_k\|^2\): this anchors the regularization to the initial guess, preventing drift.

<div class="theorem">
<strong>Theorem 4.6 (Convergence of IRGNM, Bakushinskii).</strong> Let \(F: \mathcal{D}(F) \subseteq X \to Y\) be Fréchet differentiable, and suppose the <em>tangential cone condition</em>
\[
\|F(x) - F(\tilde{x}) - F'(x)(x - \tilde{x})\|_Y \leq \eta \|F(x) - F(\tilde{x})\|_Y
\]
holds for some \(\eta < 1/2\) and all \(x, \tilde{x}\) in a ball around \(x^\dagger\). Let \(\alpha_k = \alpha_0 q^k\) for some \(q \in (0,1)\). If \(x_0\) is sufficiently close to \(x^\dagger\) and the iteration is stopped by the discrepancy principle, then \(x_{k^*}^\delta \to x^\dagger\) as \(\delta \to 0\).
</div>

<div class="remark">
<strong>Remark 4.7.</strong> The tangential cone condition is the nonlinear analogue of the linear well-posedness condition. It controls the nonlinearity of \(F\) and ensures that the linearization is a sufficiently good approximation. This condition has been verified for many important inverse problems, including coefficient identification in elliptic PDEs and inverse scattering problems. When it fails, one may need to restrict the iteration to a smaller neighborhood or employ globally convergent strategies.
</div>

### 4.3 Convergence under Source Conditions

Convergence rates for nonlinear inverse problems require nonlinear source conditions, which are more delicate than their linear counterparts.

<div class="definition">
<strong>Definition 4.8 (Nonlinear Source Condition).</strong> The true solution \(x^\dagger\) satisfies a <em>source condition</em> if
\[
x_0 - x^\dagger = F'(x^\dagger)^* \omega \quad \text{for some } \omega \in Y \text{ with } \|\omega\| \leq \rho.
\]
This is the analogue of the linear condition \(x^\dagger \in \mathcal{R}(A^*)\) and expresses a regularity or compatibility condition relating the initial guess, the true solution, and the forward operator.
</div>

<div class="theorem">
<strong>Theorem 4.9 (Convergence Rates for IRGNM).</strong> Under the tangential cone condition, the source condition of Definition 4.8, and the a priori parameter choice \(\alpha_k = \alpha_0 q^k\), the IRGNM with discrepancy principle stopping achieves
\[
\|x_{k^*}^\delta - x^\dagger\| = O(\delta^{1/2}).
\]
This is the optimal rate for the given source condition, matching the linear theory.
</div>

<div class="example">
<strong>Example 4.10 (Inverse Conductivity Problem).</strong> In electrical impedance tomography (EIT), one seeks to recover the conductivity \(a(x)\) in the elliptic PDE \(-\nabla \cdot (a \nabla u) = 0\) from measurements of the Neumann-to-Dirichlet map \(\Lambda_a: g \mapsto u|_{\partial\Omega}\), where \(g = a \frac{\partial u}{\partial \nu}\big|_{\partial\Omega}\). The forward operator \(F: a \mapsto \Lambda_a\) is nonlinear, Fréchet differentiable, and satisfies the tangential cone condition in a neighborhood of the true conductivity (under appropriate regularity assumptions). The IRGNM has been successfully applied to EIT reconstruction, with convergence rates verified both theoretically and numerically.
</div>

### 4.4 The Adjoint Method for Gradient Computation

All Newton-type methods for nonlinear inverse problems require the evaluation of the Fréchet derivative \(F'(x)\) or, more precisely, its adjoint \(F'(x)^*\). For PDE-constrained inverse problems, the adjoint method provides an efficient way to compute the gradient of a misfit functional without explicitly forming the (typically dense and huge) Jacobian matrix.

<div class="theorem">
<strong>Theorem 4.11 (Adjoint Gradient Formula).</strong> Consider the misfit functional \(\mathcal{J}(x) = \frac{1}{2}\|F(x) - y^\delta\|^2\), where \(F(x) = C(u(x))\) for a PDE state \(u(x)\) and observation operator \(C\). Suppose \(u(x)\) satisfies the state equation \(E(x, u) = 0\). Then the gradient of \(\mathcal{J}\) is
\[
\nabla \mathcal{J}(x) = -\left(\frac{\partial E}{\partial x}\right)^* p,
\]
where \(p\) is the <em>adjoint state</em> satisfying the adjoint equation
\[
\left(\frac{\partial E}{\partial u}\right)^* p = C^*(C u - y^\delta).
\]
</div>

The crucial observation is that computing \(\nabla\mathcal{J}\) requires solving only two PDEs (the forward state equation and the adjoint equation), regardless of the dimension of the parameter space. This makes gradient-based optimization feasible even when the unknown \(x\) is a spatially varying function discretized on a fine mesh with millions of unknowns.

<div class="remark">
<strong>Remark 4.12.</strong> The adjoint method has a long history. In control theory, it is the Pontryagin maximum principle; in meteorology, it was introduced by Marchuk (1974) and applied to 4D-Var data assimilation by Le Dimet and Tarantola (1986). In optimization, it is known as the "reverse mode" of automatic differentiation, and modern machine learning frameworks (backpropagation) implement precisely this idea. The unifying mathematical principle is the chain rule for Fréchet derivatives combined with the duality pairing.
</div>

---

## Chapter 5: Statistical and Bayesian Inversion

### 5.1 The Statistical Framework

The deterministic regularization theory of Chapters 2–4 treats the unknown \(x\) as a fixed but unknown element of a function space, and studies the worst-case behavior of reconstruction methods over classes of solutions. The *statistical* (or *Bayesian*) approach takes a fundamentally different perspective: the unknown \(x\) is modeled as a random variable, and the goal is to characterize the conditional distribution of \(x\) given the data. This paradigm, which has its roots in the work of Laplace and was revitalized for inverse problems by Kaipio, Somersalo, Franklin, Tarantola, and Stuart, provides a natural framework for uncertainty quantification.

<div class="definition">
<strong>Definition 5.1 (Statistical Inverse Problem).</strong> A <em>statistical inverse problem</em> consists of:
<ol>
<li>A forward model \(y = F(x) + \eta\), where \(x\) is the unknown, \(y\) is the observation, and \(\eta\) is a random noise variable.</li>
<li>A probability model for the noise \(\eta\), e.g., \(\eta \sim \mathcal{N}(0, \Gamma)\) for a covariance operator \(\Gamma\).</li>
<li>(In the Bayesian setting) A <em>prior distribution</em> \(\mu_0\) on the unknown \(x\), encoding prior knowledge or beliefs.</li>
</ol>
</div>

### 5.2 Maximum Likelihood and MAP Estimators

Before developing the full Bayesian framework, we consider two point estimators that provide connections to the deterministic theory.

<div class="definition">
<strong>Definition 5.2 (Likelihood Function).</strong> Given the observation model \(y = F(x) + \eta\) with \(\eta \sim \mathcal{N}(0, \Gamma)\), the <em>likelihood function</em> is
\[
\mathcal{L}(x; y) = \pi(y | x) \propto \exp\!\left(-\frac{1}{2}\|y - F(x)\|_\Gamma^2\right),
\]
where \(\|z\|_\Gamma^2 = \langle z, \Gamma^{-1}z \rangle\).
</div>

<div class="definition">
<strong>Definition 5.3 (Maximum Likelihood Estimator).</strong> The <em>maximum likelihood estimator</em> (MLE) is
\[
x_{\text{MLE}} = \arg\max_x \mathcal{L}(x; y) = \arg\min_x \|y - F(x)\|_\Gamma^2.
\]
</div>

In the linear case \(F(x) = Ax\) with \(\Gamma = \sigma^2 I\), the MLE is simply the least-squares solution \(x_{\text{MLE}} = \arg\min_x \|Ax - y\|^2\), which is the Moore-Penrose inverse \(A^\dagger y\). Thus the MLE inherits the instability of the ill-posed problem: regularization is needed even from the statistical perspective.

<div class="definition">
<strong>Definition 5.4 (Maximum a Posteriori Estimator).</strong> Given a prior density \(\pi_0(x)\), the <em>MAP estimator</em> is
\[
x_{\text{MAP}} = \arg\max_x \pi(x|y) = \arg\min_x \left\{ \frac{1}{2}\|y - F(x)\|_\Gamma^2 - \log\pi_0(x) \right\}.
\]
</div>

With a Gaussian prior \(x \sim \mathcal{N}(x_0, \alpha^{-1} C_0)\), the MAP estimator becomes
\[
x_{\text{MAP}} = \arg\min_x \left\{ \|y - F(x)\|_\Gamma^2 + \alpha \|x - x_0\|_{C_0^{-1}}^2 \right\},
\]
which is precisely Tikhonov regularization with penalty \(\alpha\|x - x_0\|_{C_0^{-1}}^2\). This reveals the deep connection between Bayesian priors and regularization penalties: the regularization parameter corresponds to the ratio of noise variance to prior variance, and the regularization norm encodes the prior covariance structure.

<div class="remark">
<strong>Remark 5.5.</strong> The equivalence between MAP estimation with Gaussian priors and Tikhonov regularization provides an important bridge between the deterministic and statistical theories. However, the Bayesian approach offers far more than a point estimate: it provides the full posterior distribution, which encodes the uncertainty in the reconstruction. Furthermore, in infinite dimensions, the MAP estimator may not be well-defined as a mode of the posterior measure (since infinite-dimensional Gaussian measures assign probability zero to every ball), requiring the more careful theory developed by Dashti and Stuart.
</div>

### 5.3 Bayesian Formulation of Inverse Problems

We now present the Bayesian framework for infinite-dimensional inverse problems, following the seminal treatment of Stuart (2010).

<div class="definition">
<strong>Definition 5.6 (Bayesian Inverse Problem).</strong> Let \(X\) be a separable Banach space and \(F: X \to \mathbb{R}^m\) be a forward operator. Given an observation \(y = F(x) + \eta\) with \(\eta \sim \mathcal{N}(0, \Gamma)\) and a prior measure \(\mu_0\) on \(X\), the <em>Bayesian inverse problem</em> is to determine the <em>posterior measure</em> \(\mu^y\) on \(X\) — the conditional distribution of \(x\) given \(y\).
</div>

By Bayes' theorem (in its measure-theoretic form), the posterior measure \(\mu^y\) is absolutely continuous with respect to the prior \(\mu_0\), with Radon-Nikodym derivative
\[
\frac{d\mu^y}{d\mu_0}(x) = \frac{1}{Z(y)} \exp\!\left(-\Phi(x; y)\right),
\]
where the *potential* (or *negative log-likelihood*) is
\[
\Phi(x; y) = \frac{1}{2}\|y - F(x)\|_\Gamma^2,
\]
and the normalizing constant is
\[
Z(y) = \int_X \exp\!\left(-\Phi(x; y)\right)\,d\mu_0(x).
\]

The posterior measure \(\mu^y\) is the complete solution to the Bayesian inverse problem: it encodes all available information about \(x\) given the data \(y\) and the prior knowledge \(\mu_0\). Point estimators (MAP, posterior mean) and uncertainty quantification (posterior covariance, credible regions) are all derived from \(\mu^y\).

### 5.4 Well-Posedness of the Bayesian Inverse Problem

A central question is whether the posterior measure is well-defined and depends continuously on the data. This is the Bayesian analogue of Hadamard's well-posedness conditions, and it was resolved in a landmark paper by Stuart (2010).

<div class="theorem">
<strong>Theorem 5.7 (Stuart, 2010).</strong> Let \(\mu_0\) be a Gaussian measure on a separable Banach space \(X\), and let \(\Phi: X \times \mathbb{R}^m \to \mathbb{R}\) satisfy:
<ol>
<li>\(\Phi\) is \(\mu_0\)-measurable for each \(y\).</li>
<li>There exist constants \(c_1, c_2 > 0\) and \(r \geq 0\) such that for all \(x \in X\), \(y \in \mathbb{R}^m\):
\[
0 \leq \Phi(x;y) \leq c_1 + c_2\left(\|x\|_X^r + \|y\|^r\right).
\]</li>
<li>For every \(\varepsilon > 0\) there exists \(M = M(\varepsilon) > 0\) such that, for all \(y_1, y_2\) with \(\max(\|y_1\|, \|y_2\|) \leq M\):
\[
|\Phi(x; y_1) - \Phi(x; y_2)| \leq C(1 + \|x\|_X^r)\|y_1 - y_2\|.
\]</li>
</ol>
Then:
<ol>
<li>The posterior measure \(\mu^y\) is well-defined (i.e., \(Z(y) > 0\)).</li>
<li>The posterior depends Lipschitz continuously on the data \(y\) in the Hellinger metric on probability measures:
\[
d_{\text{Hell}}(\mu^{y_1}, \mu^{y_2}) \leq C \|y_1 - y_2\|.
\]</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> The proof of well-definedness reduces to showing \(Z(y) > 0\). Since \(\Phi(x;y) \leq c_1 + c_2(\|x\|_X^r + \|y\|^r)\), we have
\[
Z(y) = \int_X \exp(-\Phi(x;y))\,d\mu_0(x) \geq \exp(-(c_1 + c_2\|y\|^r)) \int_X \exp(-c_2\|x\|_X^r)\,d\mu_0(x).
\]
The last integral is finite and positive by the Fernique theorem (Gaussian measures have finite exponential moments of \(\|x\|^2\), hence of \(\|x\|^r\) for any \(r\)), giving \(Z(y) > 0\).

For the Lipschitz stability in the Hellinger metric, one writes
\[
d_{\text{Hell}}^2(\mu^{y_1}, \mu^{y_2}) = \int_X \left(\sqrt{\frac{d\mu^{y_1}}{d\mu_0}} - \sqrt{\frac{d\mu^{y_2}}{d\mu_0}}\right)^2 d\mu_0.
\]
Using the bound on \(|\Phi(x;y_1) - \Phi(x;y_2)|\) and the inequality \(|\sqrt{a} - \sqrt{b}| \leq |a - b|/(2\min(\sqrt{a},\sqrt{b}))\), careful estimation yields the Lipschitz bound. \(\square\)
</div>

<div class="remark">
<strong>Remark 5.8.</strong> Stuart's theorem is remarkable because it establishes well-posedness of the Bayesian inverse problem in the infinite-dimensional setting, without discretization. This is in contrast to the MAP estimator, which requires regularization to be well-defined. The Bayesian framework thus provides a natural form of regularization through the prior measure. The Fernique theorem, which guarantees that Gaussian measures on Banach spaces have exponential integrability, is the key technical ingredient.
</div>

### 5.5 Gaussian Priors and Posterior Characterization

In the special case of a linear forward operator and Gaussian prior and noise, the posterior is itself Gaussian, and its mean and covariance can be computed in closed form.

<div class="theorem">
<strong>Theorem 5.9 (Gaussian Posterior for Linear Problems).</strong> Consider the observation model \(y = Ax + \eta\), where \(x \sim \mathcal{N}(m_0, C_0)\) and \(\eta \sim \mathcal{N}(0, \Gamma)\) are independent. Then the posterior distribution of \(x\) given \(y\) is Gaussian: \(x | y \sim \mathcal{N}(m_{\text{post}}, C_{\text{post}})\), where
\[
C_{\text{post}} = (C_0^{-1} + A^*\Gamma^{-1}A)^{-1}, \qquad m_{\text{post}} = C_{\text{post}}(C_0^{-1}m_0 + A^*\Gamma^{-1}y).
\]
Equivalently, using the Woodbury identity:
\[
C_{\text{post}} = C_0 - C_0 A^*(AC_0A^* + \Gamma)^{-1}AC_0, \qquad m_{\text{post}} = m_0 + C_0 A^*(AC_0A^* + \Gamma)^{-1}(y - Am_0).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Using Bayes' theorem for Gaussian distributions, the log-posterior density (up to constants) is
\[
-\frac{1}{2}\|y - Ax\|_\Gamma^2 - \frac{1}{2}\|x - m_0\|_{C_0}^2.
\]
Expanding and completing the square in \(x\), one obtains a quadratic form \(-\frac{1}{2}\|x - m_{\text{post}}\|_{C_{\text{post}}}^2 + \text{const}\), which identifies the posterior as \(\mathcal{N}(m_{\text{post}}, C_{\text{post}})\) with the stated parameters. \(\square\)
</div>

The posterior mean \(m_{\text{post}}\) coincides with the MAP estimator and, in the linear-Gaussian case, also with the minimum-variance estimator. The posterior covariance \(C_{\text{post}}\) quantifies the remaining uncertainty after observing \(y\). Note that \(C_{\text{post}} \preceq C_0\) (in the operator ordering), reflecting the information gained from the data.

<div class="example">
<strong>Example 5.10 (Deconvolution with Gaussian Prior).</strong> Consider a one-dimensional deconvolution problem: \(y(t) = \int_0^1 k(t-s) x(s)\,ds + \eta(t)\), where \(k\) is a known convolution kernel, \(\eta\) is white noise with variance \(\sigma^2\), and the prior on \(x\) is a Gaussian process with covariance function \(C_0(s,s') = \tau^2 \exp(-|s-s'|^2/(2\ell^2))\). The hyperparameters \(\tau\) (prior amplitude) and \(\ell\) (correlation length) encode prior beliefs about the smoothness and magnitude of \(x\). The posterior is Gaussian with mean and covariance given by Theorem 5.9. The posterior mean provides a regularized reconstruction, and the posterior standard deviation quantifies the pointwise uncertainty.
</div>

### 5.6 Choice of Prior and Gaussian Random Fields

The choice of prior measure is perhaps the most consequential modeling decision in Bayesian inversion. For function-valued unknowns, Gaussian random fields provide a flexible and analytically tractable class of priors.

<div class="definition">
<strong>Definition 5.11 (Matérn Covariance).</strong> The <em>Matérn covariance function</em> on \(\mathbb{R}^d\) is
\[
C_\nu(r) = \frac{\tau^2}{2^{\nu-1}\Gamma(\nu)}\left(\frac{\sqrt{2\nu}\,r}{\ell}\right)^\nu K_\nu\!\left(\frac{\sqrt{2\nu}\,r}{\ell}\right),
\]
where \(r = |x - x'|\), \(\tau^2\) is the marginal variance, \(\ell > 0\) is the correlation length, \(\nu > 0\) is the smoothness parameter, and \(K_\nu\) is the modified Bessel function of the second kind. A Gaussian random field with Matérn covariance has sample paths in the Sobolev space \(H^s(\mathbb{R}^d)\) for \(s < \nu\).
</div>

The Matérn class is the most commonly used family of covariance functions in spatial statistics and Bayesian inverse problems. The smoothness parameter \(\nu\) controls the regularity of the prior samples: \(\nu = 1/2\) gives the exponential covariance (rough, Markovian samples), \(\nu \to \infty\) recovers the squared exponential (infinitely smooth samples), and \(\nu = k + 1/2\) for integer \(k\) gives an explicit expression involving a polynomial times an exponential. The connection to PDEs is particularly elegant: Whittle (1963) showed that a Gaussian field with Matérn covariance in \(\mathbb{R}^d\) is the stationary solution of the stochastic PDE
\[
\left(\kappa^2 - \Delta\right)^{(\nu + d/2)/2} u = \mathcal{W},
\]
where \(\kappa = \sqrt{2\nu}/\ell\) and \(\mathcal{W}\) is spatial white noise. This SPDE representation, exploited by Lindgren, Rue, and Lindström (2011), enables efficient computation via finite element methods and sparse precision matrices.

<div class="remark">
<strong>Remark 5.12.</strong> The choice of prior encodes structural assumptions about the unknown. Beyond Gaussian priors, important alternatives include: <em>total variation priors</em> (which promote piecewise constant reconstructions and are widely used in image processing), <em>Besov space priors</em> (which allow for spatially inhomogeneous smoothness), and <em>level-set priors</em> (which model the unknown as a piecewise constant function whose interfaces are described by a level-set function, itself given a Gaussian prior). Each choice leads to a different posterior and different reconstruction characteristics. The theoretical framework of Theorem 5.7 extends to many of these non-Gaussian settings, though the analysis becomes more delicate.
</div>

---

## Chapter 6: Computational Methods for Bayesian Inversion

### 6.1 Markov Chain Monte Carlo Methods

For nonlinear or non-Gaussian problems, the posterior measure cannot be computed in closed form, and sampling methods are required. Markov chain Monte Carlo (MCMC) methods generate a Markov chain whose stationary distribution is the posterior, allowing estimation of posterior expectations via ergodic averages.

<div class="definition">
<strong>Definition 6.1 (Metropolis-Hastings Algorithm).</strong> The <em>Metropolis-Hastings (MH) algorithm</em> generates a Markov chain \(\{x^{(k)}\}\) targeting a distribution \(\pi\) as follows. Given the current state \(x^{(k)}\):
<ol>
<li><em>Propose:</em> Draw a candidate \(x' \sim q(\cdot | x^{(k)})\) from a proposal distribution \(q\).</li>
<li><em>Accept/Reject:</em> Set \(x^{(k+1)} = x'\) with probability
\[
\alpha(x^{(k)}, x') = \min\!\left(1, \frac{\pi(x') q(x^{(k)} | x')}{\pi(x^{(k)}) q(x' | x^{(k)})}\right),
\]
and \(x^{(k+1)} = x^{(k)}\) otherwise.</li>
</ol>
</div>

The Metropolis-Hastings algorithm is the foundation of MCMC. For finite-dimensional inverse problems, a common choice of proposal is the random walk \(x' = x^{(k)} + \beta \xi\) with \(\xi \sim \mathcal{N}(0, I)\) and step size \(\beta > 0\). However, in the context of infinite-dimensional inverse problems, the standard random walk MH algorithm degenerates: as the discretization is refined, the optimal step size \(\beta\) shrinks to zero and the acceptance rate collapses, rendering the algorithm useless.

### 6.2 The Preconditioned Crank-Nicolson Algorithm

The breakthrough insight of Cotter, Roberts, Stuart, and White (2013) was to design proposals that are well-defined on the infinite-dimensional space, yielding algorithms whose performance is independent of the discretization dimension.

<div class="definition">
<strong>Definition 6.2 (Preconditioned Crank-Nicolson, pCN).</strong> Given a prior \(\mu_0 = \mathcal{N}(0, C_0)\) and a posterior of the form \(\frac{d\mu^y}{d\mu_0}(x) \propto \exp(-\Phi(x))\), the <em>pCN algorithm</em> generates proposals via
\[
x' = \sqrt{1 - \beta^2}\, x^{(k)} + \beta \xi, \quad \xi \sim \mathcal{N}(0, C_0),
\]
where \(\beta \in (0, 1]\). The acceptance probability is
\[
\alpha(x^{(k)}, x') = \min\!\left(1, \exp\!\left(\Phi(x^{(k)}) - \Phi(x')\right)\right).
\]
</div>

The pCN proposal is *prior-preserving*: when \(\Phi \equiv 0\) (no data), the proposal is an exact draw from the prior, and the acceptance probability is 1. This is the crucial property that ensures dimension-independent behavior.

<div class="theorem">
<strong>Theorem 6.3 (Dimension Independence of pCN, Cotter-Roberts-Stuart-White, 2013).</strong> The pCN algorithm defines a well-posed Markov chain on the infinite-dimensional space \(X\). In particular:
<ol>
<li>The proposal is well-defined as a measure on \(X\) (it preserves the Cameron-Martin structure of the Gaussian prior).</li>
<li>The acceptance probability depends only on the potential \(\Phi\) and is bounded away from zero uniformly in the discretization dimension, provided \(\Phi\) satisfies the assumptions of Theorem 5.7.</li>
<li>The chain is reversible with respect to the posterior measure \(\mu^y\).</li>
</ol>
</div>

<div class="remark">
<strong>Remark 6.4.</strong> The key insight behind pCN is that, in infinite dimensions, the Radon-Nikodym derivative of a Gaussian measure with respect to another Gaussian measure is well-defined only when the two measures are equivalent (mutually absolutely continuous). The pCN proposal \(\mathcal{N}(\sqrt{1-\beta^2}x, \beta^2 C_0)\) is equivalent to the prior \(\mathcal{N}(0, C_0)\), ensuring that the Metropolis-Hastings ratio is well-defined. The standard random walk proposal \(\mathcal{N}(x, \beta^2 I)\) is singular with respect to the prior in infinite dimensions, which is why it degenerates.
</div>

<div class="example">
<strong>Example 6.5 (pCN for a Nonlinear Inverse Problem).</strong> Consider the problem of recovering the log-permeability field \(x = \log a\) in a Darcy flow model from pressure measurements. The prior on \(x\) is a Gaussian random field with Matérn covariance. With a discretization on a \(64 \times 64\) grid (4096 unknowns), the standard random walk MH algorithm has an acceptance rate below 1% for any reasonable step size. The pCN algorithm, with \(\beta = 0.2\), achieves an acceptance rate of approximately 25% — essentially the same rate as on coarser grids, confirming dimension independence.
</div>

### 6.3 Ensemble Kalman Inversion

While MCMC methods provide asymptotically exact samples from the posterior, they can be computationally expensive for large-scale problems. The *ensemble Kalman inversion* (EKI) method, introduced by Iglesias, Law, and Stuart (2013), provides a derivative-free approximate method based on the ensemble Kalman filter.

<div class="definition">
<strong>Definition 6.6 (Ensemble Kalman Inversion).</strong> Given an ensemble of \(J\) particles \(\{x_j^{(k)}\}_{j=1}^J\), the <em>EKI update</em> is:
\[
x_j^{(k+1)} = x_j^{(k)} + C_{xF}^{(k)} (C_{FF}^{(k)} + h^{-1}\Gamma)^{-1}(y - F(x_j^{(k)}) + \zeta_j^{(k)}),
\]
where \(\zeta_j^{(k)} \sim \mathcal{N}(0, h^{-1}\Gamma)\), \(h > 0\) is a step size parameter, and
\[
C_{xF}^{(k)} = \frac{1}{J-1}\sum_{j=1}^J (x_j^{(k)} - \bar{x}^{(k)})(F(x_j^{(k)}) - \overline{F(x^{(k)})})^T, \quad C_{FF}^{(k)} = \frac{1}{J-1}\sum_{j=1}^J (F(x_j^{(k)}) - \overline{F(x^{(k)})})(F(x_j^{(k)}) - \overline{F(x^{(k)})})^T.
\]
</div>

The EKI can be interpreted as a derivative-free approximate Newton method: the ensemble covariance matrices \(C_{xF}^{(k)}\) and \(C_{FF}^{(k)}\) approximate the cross-covariance and the Jacobian, respectively. Unlike MCMC, EKI does not sample the posterior exactly, but it is remarkably effective for optimization and uncertainty quantification in practice.

<div class="theorem">
<strong>Theorem 6.7 (Continuous-Time Limit of EKI, Schillings-Stuart, 2017).</strong> In the continuous-time limit \(h \to 0\), the EKI ensemble evolves according to the system of coupled ODEs:
\[
\dot{x}_j(t) = C_{xF}(t)\Gamma^{-1}(y - F(x_j(t))), \quad j = 1, \ldots, J.
\]
For linear problems \(F(x) = Ax\), the ensemble mean converges to the MAP estimator as \(t \to \infty\), and the ensemble covariance converges to the posterior covariance.
</div>

<div class="remark">
<strong>Remark 6.8.</strong> The EKI method requires only evaluations of the forward map \(F\) — no derivatives or adjoint computations. This makes it attractive for problems where the forward model is a legacy code or a complex PDE solver. The ensemble size \(J\) is typically small (50–100), making the method computationally feasible even for very high-dimensional problems.
</div>

### 6.4 Importance Sampling

Importance sampling provides an alternative to MCMC for computing posterior expectations, particularly when the posterior is not too different from a tractable distribution.

<div class="definition">
<strong>Definition 6.9 (Importance Sampling).</strong> Let \(\mu^y\) be the posterior measure and \(\nu\) be a tractable <em>importance distribution</em>. For any \(\mu^y\)-integrable function \(f\),
\[
\mathbb{E}_{\mu^y}[f(x)] = \frac{\mathbb{E}_\nu[f(x) w(x)]}{\mathbb{E}_\nu[w(x)]},
\]
where \(w(x) = \frac{d\mu^y}{d\nu}(x)\) is the importance weight. Given i.i.d. samples \(x_1, \ldots, x_N \sim \nu\), the self-normalized importance sampling estimator is
\[
\hat{I}_N = \frac{\sum_{j=1}^N f(x_j) w(x_j)}{\sum_{j=1}^N w(x_j)}.
\]
</div>

For Bayesian inverse problems, the natural choice is \(\nu = \mu_0\) (the prior), giving importance weights \(w(x_j) = \exp(-\Phi(x_j; y))/Z(y)\). However, the efficiency of importance sampling depends critically on the effective sample size \(N_{\text{eff}} = N / (1 + \mathrm{Var}_\nu[w/\bar{w}])\), which can collapse exponentially in the dimension of the problem. This is the well-known *curse of dimensionality* for importance sampling.

<div class="remark">
<strong>Remark 6.10.</strong> The curse of dimensionality for importance sampling motivates the development of more sophisticated methods such as sequential Monte Carlo (particle filters), which mitigate the weight degeneracy by introducing resampling and mutation steps. In the context of data assimilation (Chapter 7), particle filters play an important role but face similar challenges in high dimensions.
</div>

### 6.5 Sequential Monte Carlo and Particle Filters

Sequential Monte Carlo (SMC) methods, also known as particle filters, provide a principled framework for sampling from a sequence of distributions that interpolate between the prior and the posterior. They address the weight degeneracy problem of plain importance sampling by incorporating resampling steps.

<div class="definition">
<strong>Definition 6.11 (SMC Sampler for Inverse Problems).</strong> Define a sequence of intermediate distributions \(\mu_t\) for \(t = 0, 1, \ldots, T\) by
\[
\frac{d\mu_t}{d\mu_0}(x) \propto \exp\!\left(-\beta_t \Phi(x; y)\right),
\]
where \(0 = \beta_0 < \beta_1 < \cdots < \beta_T = 1\) is an increasing sequence of temperatures. The SMC algorithm maintains a weighted particle set \(\{(x_j^{(t)}, w_j^{(t)})\}_{j=1}^J\) and at each step:
<ol>
<li><em>Reweight:</em> Update the importance weights \(w_j^{(t)} \propto \exp(-(\beta_t - \beta_{t-1})\Phi(x_j^{(t-1)}; y))\).</li>
<li><em>Resample:</em> If the effective sample size \(N_{\text{eff}}\) drops below a threshold, resample the particles according to their weights.</li>
<li><em>Mutate:</em> Apply a Markov kernel (e.g., pCN) that leaves \(\mu_t\) invariant to each particle, diversifying the ensemble.</li>
</ol>
</div>

The tempering schedule \(\{\beta_t\}\) can be chosen adaptively to maintain a target effective sample size. This approach provides an unbiased estimate of the normalizing constant \(Z(y)\) as a byproduct, via the telescoping product formula \(Z(y) = \prod_{t=1}^T \frac{1}{J}\sum_j w_j^{(t)}\), which is useful for Bayesian model comparison.

<div class="example">
<strong>Example 6.12 (SMC for Multimodal Posteriors).</strong> Consider a nonlinear inverse problem where the posterior is bimodal — for instance, recovering the location of a point source from diffuse measurements, where the data are consistent with two symmetric locations. Standard MCMC methods (including pCN) may become trapped in one mode and fail to explore the full posterior. SMC with tempering provides a natural way to discover both modes: at low temperature (\(\beta\) near 0), the particles explore the broad prior, and as the temperature increases, they concentrate around the two modes proportionally to their posterior mass.</div>

<div class="remark">
<strong>Remark 6.13.</strong> The computational cost of SMC scales linearly with the number of particles \(J\) and the number of temperature steps \(T\). For problems where the posterior is well-concentrated (informative data), the required number of temperature steps can be large, making SMC expensive. Nonetheless, SMC provides the gold standard for Bayesian computation in low-to-moderate dimensions (up to roughly \(10^3\) parameters) and serves as a benchmark against which faster approximate methods are validated.
</div>

---

## Chapter 7: Data Assimilation

### 7.1 The Data Assimilation Problem

Data assimilation is the process of combining a dynamical model with time-distributed observations to estimate the state of a system. It arises in weather prediction, oceanography, hydrology, and many other fields where a time-evolving system is observed intermittently and imperfectly. The mathematical framework is that of filtering and smoothing for stochastic dynamical systems.

<div class="definition">
<strong>Definition 7.1 (Data Assimilation Problem).</strong> Consider a discrete-time dynamical system
\[
x_{k+1} = \mathcal{M}_k(x_k) + \xi_k, \quad y_k = H_k(x_k) + \eta_k, \quad k = 0, 1, 2, \ldots,
\]
where \(x_k \in \mathbb{R}^n\) is the state, \(\mathcal{M}_k\) is the (possibly nonlinear) model operator, \(\xi_k \sim \mathcal{N}(0, Q_k)\) is the model error, \(y_k \in \mathbb{R}^m\) is the observation, \(H_k\) is the (possibly nonlinear) observation operator, and \(\eta_k \sim \mathcal{N}(0, R_k)\) is the observation noise. The <em>filtering problem</em> is to estimate \(x_k\) given observations \(y_1, \ldots, y_k\).
</div>

Data assimilation methods divide into two broad classes: *sequential* (or *filtering*) methods, which update the state estimate each time a new observation arrives, and *variational* methods, which optimize a cost functional over an entire time window.

### 7.2 The Kalman Filter

The Kalman filter (Kalman, 1960) is the optimal sequential estimator for linear Gaussian systems: it computes the exact conditional mean and covariance of the state given all observations up to the current time.

<div class="theorem">
<strong>Theorem 7.2 (Kalman Filter).</strong> Consider the linear Gaussian system
\[
x_{k+1} = M_k x_k + \xi_k, \quad y_k = H_k x_k + \eta_k,
\]
with \(\xi_k \sim \mathcal{N}(0, Q_k)\), \(\eta_k \sim \mathcal{N}(0, R_k)\), and \(x_0 \sim \mathcal{N}(\hat{x}_0, P_0)\). The conditional distribution of \(x_k\) given \(y_1, \ldots, y_k\) is Gaussian: \(x_k | y_{1:k} \sim \mathcal{N}(\hat{x}_k^a, P_k^a)\), where the analysis (update) and forecast steps are:

<em>Forecast:</em>
\[
\hat{x}_k^f = M_{k-1}\hat{x}_{k-1}^a, \quad P_k^f = M_{k-1}P_{k-1}^a M_{k-1}^T + Q_{k-1}.
\]

<em>Analysis:</em>
\[
K_k = P_k^f H_k^T (H_k P_k^f H_k^T + R_k)^{-1},
\]
\[
\hat{x}_k^a = \hat{x}_k^f + K_k(y_k - H_k \hat{x}_k^f), \quad P_k^a = (I - K_k H_k)P_k^f.
\]
The matrix \(K_k\) is the <em>Kalman gain</em>, and \(d_k = y_k - H_k\hat{x}_k^f\) is the <em>innovation</em>.
</div>

<div class="proof">
<strong>Proof.</strong> The proof proceeds by induction. At time \(k\), assume \(x_{k-1}|y_{1:k-1} \sim \mathcal{N}(\hat{x}_{k-1}^a, P_{k-1}^a)\). The forecast distribution is
\[
x_k | y_{1:k-1} \sim \mathcal{N}(M_{k-1}\hat{x}_{k-1}^a, M_{k-1}P_{k-1}^a M_{k-1}^T + Q_{k-1}) = \mathcal{N}(\hat{x}_k^f, P_k^f).
\]
The joint distribution of \((x_k, y_k)\) given \(y_{1:k-1}\) is Gaussian. By the standard formula for conditioning Gaussians, \(x_k | y_{1:k}\) is Gaussian with mean \(\hat{x}_k^a = \hat{x}_k^f + P_k^f H_k^T(H_k P_k^f H_k^T + R_k)^{-1}(y_k - H_k\hat{x}_k^f)\) and covariance \(P_k^a = P_k^f - P_k^f H_k^T(H_k P_k^f H_k^T + R_k)^{-1}H_k P_k^f\), which simplifies to the stated formulas. \(\square\)
</div>

The Kalman filter is optimal for linear Gaussian systems in the sense that it minimizes the mean-squared estimation error. Its computational cost is \(O(n^2m + n^3)\) per time step, where \(n\) is the state dimension and \(m\) is the observation dimension. For the large-scale systems encountered in weather prediction (\(n \sim 10^8\)), the Kalman filter is infeasible due to the cost of storing and propagating the \(n \times n\) covariance matrix.

<div class="example">
<strong>Example 7.3 (Tracking a Falling Object).</strong> Consider tracking the height \(h\) and velocity \(v\) of a falling object under gravity with noisy position measurements. The state is \(x_k = (h_k, v_k)^T\), the dynamics are
\[
x_{k+1} = \begin{pmatrix} 1 & \Delta t \\ 0 & 1 \end{pmatrix} x_k + \begin{pmatrix} -\frac{1}{2}g(\Delta t)^2 \\ -g\Delta t \end{pmatrix} + \xi_k,
\]
and the observation model is \(y_k = (1, 0) x_k + \eta_k\) (we observe only the position). The Kalman filter optimally fuses the noisy position measurements with the gravitational dynamics model. The analysis covariance shrinks over time as observations accumulate, with the velocity uncertainty (unobserved) being reduced through the coupling in the dynamics.
</div>

### 7.3 Extensions of the Kalman Filter

For nonlinear or non-Gaussian systems, the Kalman filter must be modified. Two classical approaches are the Extended Kalman Filter and the Unscented Kalman Filter.

<div class="definition">
<strong>Definition 7.3 (Extended Kalman Filter, EKF).</strong> The <em>EKF</em> linearizes the model and observation operators about the current estimate:

<em>Forecast:</em>
\[
\hat{x}_k^f = \mathcal{M}_{k-1}(\hat{x}_{k-1}^a), \quad P_k^f = M_{k-1} P_{k-1}^a M_{k-1}^T + Q_{k-1}, \quad M_{k-1} = \mathcal{M}_{k-1}'(\hat{x}_{k-1}^a).
\]

<em>Analysis:</em> Same as the Kalman filter, with \(H_k\) replaced by \(H_k' = H_k'(\hat{x}_k^f)\), the Jacobian of \(H_k\) at the forecast.
</div>

<div class="definition">
<strong>Definition 7.4 (Unscented Kalman Filter, UKF).</strong> The <em>UKF</em> (Julier and Uhlmann, 1997) replaces the linearization of the EKF with a deterministic sampling strategy. Given a mean \(\hat{x}\) and covariance \(P\) in \(\mathbb{R}^n\), the UKF generates \(2n+1\) <em>sigma points</em>:
\[
\chi_0 = \hat{x}, \quad \chi_i = \hat{x} + \sqrt{(n+\lambda)P}\,\big|_i, \quad \chi_{n+i} = \hat{x} - \sqrt{(n+\lambda)P}\,\big|_i, \quad i = 1, \ldots, n,
\]
where \(\sqrt{(n+\lambda)P}\,\big|_i\) denotes the \(i\)-th column of the matrix square root, and \(\lambda = \alpha^2(n+\kappa) - n\) is a scaling parameter. The sigma points are propagated through the nonlinear model, and the forecast mean and covariance are computed from the propagated points using weighted averages.
</div>

<div class="remark">
<strong>Remark 7.5.</strong> The EKF requires the Jacobian of the model and observation operators, which may be expensive or unavailable. The UKF avoids derivatives entirely, using only evaluations of the nonlinear operators. However, both the EKF and UKF require \(O(n^2)\) storage for the covariance matrix, making them impractical for high-dimensional systems. The ensemble Kalman filter, discussed next, addresses this limitation.
</div>

### 7.4 The Ensemble Kalman Filter

The ensemble Kalman filter (EnKF), introduced by Evensen (1994), is the dominant data assimilation method in operational weather prediction, oceanography, and reservoir simulation. It replaces the covariance matrix with an empirical covariance computed from an ensemble of state realizations, reducing the storage and computational cost from \(O(n^2)\) to \(O(Jn)\), where \(J\) is the ensemble size (typically \(J = 50\)–\(100\)).

<div class="definition">
<strong>Definition 7.6 (Ensemble Kalman Filter, EnKF).</strong> Given an ensemble \(\{x_j^{a,k-1}\}_{j=1}^J\) at time \(k-1\):

<em>Forecast:</em> Propagate each ensemble member through the model:
\[
x_j^{f,k} = \mathcal{M}_{k-1}(x_j^{a,k-1}) + \xi_j^{k-1}, \quad \xi_j^{k-1} \sim \mathcal{N}(0, Q_{k-1}).
\]

<em>Analysis:</em> Compute ensemble statistics:
\[
\bar{x}^{f,k} = \frac{1}{J}\sum_{j=1}^J x_j^{f,k}, \quad P_k^f \approx \frac{1}{J-1}\sum_{j=1}^J (x_j^{f,k} - \bar{x}^{f,k})(x_j^{f,k} - \bar{x}^{f,k})^T.
\]
Update each member using perturbed observations:
\[
x_j^{a,k} = x_j^{f,k} + K_k(y_k + \zeta_j^k - H_k(x_j^{f,k})), \quad \zeta_j^k \sim \mathcal{N}(0, R_k),
\]
where \(K_k = P_k^f H_k^T(H_k P_k^f H_k^T + R_k)^{-1}\) is the Kalman gain computed from the ensemble covariance.
</div>

The EnKF is a Monte Carlo approximation to the Kalman filter. For linear Gaussian systems, it converges to the exact Kalman filter as \(J \to \infty\). For nonlinear systems, it provides an approximate Gaussian filtering distribution, with the ensemble spread serving as an estimate of the analysis uncertainty.

<div class="theorem">
<strong>Theorem 7.7 (Convergence of EnKF for Linear Systems).</strong> For the linear Gaussian system \(x_{k+1} = M_k x_k + \xi_k\), \(y_k = H_k x_k + \eta_k\), let \(\hat{x}_k^{a,J}\) and \(P_k^{a,J}\) denote the EnKF ensemble mean and covariance with ensemble size \(J\). Then, as \(J \to \infty\):
\[
\hat{x}_k^{a,J} \to \hat{x}_k^a, \quad P_k^{a,J} \to P_k^a \quad \text{almost surely},
\]
where \((\hat{x}_k^a, P_k^a)\) are the Kalman filter estimates.
</div>

<div class="remark">
<strong>Remark 7.8.</strong> In practice, the small ensemble size introduces sampling errors in the covariance estimate, leading to spurious long-range correlations and underestimation of the spread. Two standard remedies are <em>localization</em> (setting to zero the covariance entries corresponding to spatially distant pairs, using a Schur product with a compactly supported correlation function) and <em>inflation</em> (multiplying the ensemble anomalies by a factor \(\rho > 1\) to prevent filter divergence). These techniques, while heuristic, are essential for the successful application of the EnKF to high-dimensional systems.
</div>

### 7.5 Observation Operators

A critical component of any data assimilation system is the observation operator \(H_k\), which maps the model state to the space of observations. In realistic applications, the observation operator is often highly nontrivial.

<div class="definition">
<strong>Definition 7.9 (Observation Operator).</strong> The <em>observation operator</em> \(H_k: \mathbb{R}^n \to \mathbb{R}^m\) maps the model state \(x_k\) to the predicted observation \(H_k(x_k)\). The observation operator may be:
<ul>
<li><em>Linear and local:</em> point evaluations or spatial averages of state variables (e.g., a thermometer measures temperature at a point).</li>
<li><em>Linear and nonlocal:</em> integral transforms of the state (e.g., satellite radiance measurements involve integration through the atmosphere).</li>
<li><em>Nonlinear:</em> complex functions of the state (e.g., radar reflectivity depends nonlinearly on hydrometeor concentrations and size distributions).</li>
</ul>
</div>

The design and accurate specification of observation operators is a major challenge in operational data assimilation. Errors in the observation operator (often called *representativeness errors*) can be as significant as instrument noise and must be accounted for in the observation error covariance \(R_k\). The linearization of the observation operator, needed for the EKF and variational methods, is called the *tangent linear observation operator* and is denoted \(H_k'\).

### 7.6 Variational Methods: 3D-Var and 4D-Var

Variational data assimilation formulates the state estimation problem as the minimization of a cost functional. These methods have a rich history in meteorology, beginning with the work of Sasaki (1958) and Lorenc (1986).

<div class="definition">
<strong>Definition 7.10 (3D-Var).</strong> The <em>three-dimensional variational</em> (3D-Var) analysis finds the state \(x^a\) that minimizes:
\[
J(x) = \frac{1}{2}\|x - x^f\|_{B^{-1}}^2 + \frac{1}{2}\|y - H(x)\|_{R^{-1}}^2,
\]
where \(x^f\) is the forecast (background), \(B\) is the background error covariance, and \(R\) is the observation error covariance. For linear \(H\), the minimizer is
\[
x^a = x^f + BH^T(HBH^T + R)^{-1}(y - Hx^f),
\]
which is identical to the Kalman filter analysis with \(P^f = B\).
</div>

The 3D-Var method is a single-time analysis: it does not use the dynamical model to propagate information across time. In contrast, the four-dimensional variational method (4D-Var) assimilates observations distributed over a time window by optimizing the initial condition.

<div class="definition">
<strong>Definition 7.11 (4D-Var).</strong> Given observations \(y_k\) at times \(t_k\) for \(k = 0, \ldots, K\), the <em>4D-Var</em> method finds the initial condition \(x_0\) that minimizes:
\[
J(x_0) = \frac{1}{2}\|x_0 - x^b\|_{B^{-1}}^2 + \frac{1}{2}\sum_{k=0}^{K} \|y_k - H_k(\mathcal{M}_{0 \to k}(x_0))\|_{R_k^{-1}}^2,
\]
where \(\mathcal{M}_{0 \to k}\) denotes the model integration from time \(t_0\) to \(t_k\), and \(x^b\) is the background state.
</div>

<div class="theorem">
<strong>Theorem 7.12 (Equivalence of 4D-Var and Kalman Smoother).</strong> For linear Gaussian systems, the 4D-Var solution (the minimizer of the 4D-Var cost functional) coincides with the Kalman smoother estimate of \(x_0\) given all observations \(y_0, \ldots, y_K\).
</div>

<div class="proof">
<strong>Proof.</strong> For a linear system \(x_{k+1} = M_k x_k\) and \(y_k = H_k x_k + \eta_k\), the 4D-Var cost is
\[
J(x_0) = \frac{1}{2}(x_0 - x^b)^T B^{-1}(x_0 - x^b) + \frac{1}{2}\sum_{k=0}^K (y_k - H_k M_{0:k} x_0)^T R_k^{-1}(y_k - H_k M_{0:k} x_0),
\]
where \(M_{0:k} = M_{k-1} \cdots M_0\). This is a quadratic in \(x_0\), and the minimizer satisfies the normal equations. A straightforward calculation shows that the gradient and Hessian match those arising from the Rauch-Tung-Striebel fixed-interval smoother, establishing the equivalence. \(\square\)
</div>

<div class="remark">
<strong>Remark 7.13.</strong> The practical computation of 4D-Var requires the gradient \(\nabla J(x_0)\), which involves the <em>adjoint model</em> — the transpose of the linearized forward model integrated backward in time. Developing and maintaining adjoint models for complex numerical weather prediction systems (which involve millions of lines of code) is a major engineering challenge. Automatic differentiation tools have been instrumental in this effort. At operational weather prediction centers (ECMWF, Météo-France), both 4D-Var and ensemble-based methods are used, sometimes in hybrid combinations.
</div>

The duality between sequential (filtering) and variational (optimization) approaches is one of the deepest structural features of data assimilation. For linear Gaussian systems, the two approaches yield identical results (Theorem 7.12). For nonlinear systems, the equivalence breaks down, and each approach has distinct advantages: filtering methods (EKF, EnKF) naturally handle streaming data and provide real-time state estimates, while variational methods (4D-Var) can enforce dynamical consistency over the entire assimilation window and handle nonlinear observation operators more naturally. Modern hybrid methods seek to combine the best features of both.

<div class="example">
<strong>Example 7.14 (Lorenz '63 System).</strong> The Lorenz system
\[
\dot{x}_1 = \sigma(x_2 - x_1), \quad \dot{x}_2 = x_1(\rho - x_3) - x_2, \quad \dot{x}_3 = x_1 x_2 - \beta x_3,
\]
with classical parameters \(\sigma = 10\), \(\rho = 28\), \(\beta = 8/3\), provides a low-dimensional testbed for data assimilation algorithms. The chaotic attractor has a Lyapunov dimension of approximately 2.06, and the largest Lyapunov exponent is approximately 0.91, meaning that perturbations grow on average by a factor of \(e\) every 1.1 time units. The EnKF with as few as 10 ensemble members can successfully track the state from noisy observations of \(x_1\) alone, demonstrating the ability of the filter to infer the unobserved components through the dynamical coupling.
</div>

### 7.7 Convergence Analysis

The theoretical analysis of data assimilation algorithms, particularly for nonlinear high-dimensional systems, is a challenging and active research area. We state one important result on filter stability.

<div class="theorem">
<strong>Theorem 7.14 (Filter Stability for the Kalman Filter).</strong> Consider the linear time-invariant system \(x_{k+1} = Mx_k + \xi_k\), \(y_k = Hx_k + \eta_k\), with \((M, Q^{1/2})\) controllable and \((M, H)\) observable. Then the Kalman filter is stable: the error covariance \(P_k^a\) converges to a unique fixed point \(\bar{P}\) (the solution of the discrete algebraic Riccati equation) as \(k \to \infty\), independently of the initial condition \(P_0\).
</div>

This stability result ensures that the Kalman filter "forgets" its initial conditions and that the analysis error remains bounded over time. Extending such results to nonlinear filters and the EnKF is an active area of research, with important contributions by Le Gland, Monbet, and Tong, among others.

---

## Chapter 8: Selected Applications

### 8.1 Electrical Impedance Tomography

Electrical impedance tomography (EIT) is a medical and industrial imaging technique in which one seeks to reconstruct the electrical conductivity distribution inside a body from boundary voltage and current measurements. The mathematical formulation is the Calderón problem, named after A.P. Calderón who posed it in 1980.

<div class="definition">
<strong>Definition 8.1 (Calderón Problem).</strong> Let \(\Omega \subset \mathbb{R}^d\) be a bounded domain and \(\sigma: \Omega \to \mathbb{R}_{>0}\) be the conductivity. For a given boundary voltage \(f \in H^{1/2}(\partial\Omega)\), the potential \(u\) satisfies
\[
\nabla \cdot (\sigma \nabla u) = 0 \quad \text{in } \Omega, \quad u = f \quad \text{on } \partial\Omega.
\]
The <em>Dirichlet-to-Neumann (DtN) map</em> is \(\Lambda_\sigma: f \mapsto \sigma \frac{\partial u}{\partial \nu}\big|_{\partial\Omega}\). The <em>Calderón problem</em> asks: does \(\Lambda_\sigma\) uniquely determine \(\sigma\)?
</div>

<div class="theorem">
<strong>Theorem 8.2 (Sylvester-Uhlmann, 1987).</strong> For \(d \geq 3\) and \(\sigma \in C^2(\bar{\Omega})\) with \(\sigma > 0\), the DtN map \(\Lambda_\sigma\) uniquely determines \(\sigma\).
</div>

The proof of the Sylvester-Uhlmann theorem uses the construction of *complex geometric optics (CGO) solutions* — solutions of the conductivity equation that oscillate at a prescribed complex frequency and are used to recover the Fourier transform of \(\sigma\). In two dimensions, the uniqueness question was resolved by Nachman (1996) for \(\sigma \in W^{2,p}\) and by Astala and Päivärinta (2006) for \(\sigma \in L^\infty\).

Although uniqueness holds, the stability of the reconstruction is extremely poor. Alessandrini (1988) proved the following conditional stability estimate: if \(\sigma_1, \sigma_2\) are two conductivities in a bounded a priori class (with uniform bounds on their \(H^2\) norms), then
\[
\|\sigma_1 - \sigma_2\|_{L^\infty} \leq C \left|\log\|\Lambda_{\sigma_1} - \Lambda_{\sigma_2}\|\right|^{-\gamma}
\]
for some constants \(C, \gamma > 0\). The logarithmic modulus of continuity means that reducing the reconstruction error by a factor of 2 requires an exponential improvement in the measurement precision. Mandache (2001) showed that this logarithmic stability is in general optimal and cannot be improved.

<div class="remark">
<strong>Remark 8.3.</strong> While uniqueness results guarantee that the conductivity is determined in principle, the reconstruction problem is severely ill-posed: the singular values of the linearized forward operator decay exponentially. In practice, EIT produces images with limited spatial resolution compared to X-ray CT or MRI. However, its advantages — it is non-ionizing, inexpensive, and portable — make it valuable for applications such as pulmonary monitoring, detection of breast cancer, and industrial process monitoring.
</div>

<div class="example">
<strong>Example 8.4 (Linearized EIT Reconstruction).</strong> For a small perturbation \(\sigma = \sigma_0 + \delta\sigma\) around a known background \(\sigma_0\), the DtN map satisfies \(\Lambda_\sigma \approx \Lambda_{\sigma_0} + \Lambda'_{\sigma_0}[\delta\sigma]\), where the Fréchet derivative \(\Lambda'_{\sigma_0}\) maps the conductivity perturbation to a change in the DtN map. The linearized inverse problem is to recover \(\delta\sigma\) from the measurement \(\Lambda_\sigma - \Lambda_{\sigma_0}\). This is a linear ill-posed problem, and Tikhonov regularization or the IRGNM (iterating the linearization) are standard reconstruction algorithms.
</div>

### 8.2 X-Ray Computed Tomography

X-ray computed tomography, as introduced in Example 1.6, is the most successful application of inverse problems in medicine. The mathematical foundation is the inversion of the Radon transform.

<div class="theorem">
<strong>Theorem 8.5 (Fourier Slice Theorem).</strong> Let \(f \in L^1(\mathbb{R}^2)\) and let \(\hat{f}\) denote its two-dimensional Fourier transform. Then the one-dimensional Fourier transform of the Radon transform \((\mathcal{R}f)(\cdot, \theta)\) with respect to the first variable equals the restriction of \(\hat{f}\) to the line through the origin in direction \(\omega = (\cos\theta, \sin\theta)\):
\[
\widehat{(\mathcal{R}f)}(\xi, \theta) = \hat{f}(\xi\cos\theta, \xi\sin\theta).
\]
</div>

The Fourier Slice Theorem provides the theoretical basis for CT reconstruction: by measuring projections at all angles \(\theta\), one obtains the Fourier transform of \(f\) along all radial lines, and \(f\) can be recovered by inverse Fourier transform. In practice, the filtered backprojection (FBP) algorithm implements this idea efficiently.

<div class="definition">
<strong>Definition 8.6 (Filtered Backprojection).</strong> The <em>filtered backprojection</em> formula for inverting the Radon transform is:
\[
f(x) = \frac{1}{2}\int_0^\pi \left[(\mathcal{R}f)(\cdot, \theta) * h\right](x \cdot \omega)\,d\theta,
\]
where \(h\) is the ramp filter with Fourier transform \(\hat{h}(\xi) = |\xi|\), and \(*\) denotes convolution in the first variable.
</div>

<div class="remark">
<strong>Remark 8.7.</strong> The Radon transform inversion problem is mildly ill-posed: the singular values of the Radon transform (considered as an operator between appropriate Sobolev spaces) decay like \(n^{-1/2}\). This relatively mild ill-posedness, combined with the availability of the fast and exact FBP algorithm, explains why CT produces images of remarkably high quality. The 1979 Nobel Prize in Physiology or Medicine was awarded to G.N. Hounsfield and A.M. Cormack for the development of computed tomography.
</div>

### 8.3 Seismic Inversion

Seismic inversion is the process of inferring subsurface geological structure from seismic wave measurements. It is of central importance in exploration geophysics (oil and gas exploration) and in earthquake seismology.

<div class="example">
<strong>Example 8.8 (Full Waveform Inversion).</strong> In full waveform inversion (FWI), one seeks to recover the velocity field \(c(x)\) in the acoustic wave equation
\[
\frac{1}{c(x)^2}\frac{\partial^2 u}{\partial t^2} - \Delta u = s(x,t) \quad \text{in } \mathbb{R}^3 \times (0,T),
\]
from surface recordings of \(u(x_r, t)\) at receiver locations \(x_r\). The forward operator \(F: c \mapsto \{u(x_r, \cdot)\}_r\) is nonlinear, and the inverse problem is highly non-convex due to the oscillatory nature of seismic waves (the "cycle-skipping" problem). Successful FWI requires careful initialization (often from travel-time tomography), multi-scale strategies (starting with low-frequency data), and appropriate regularization.
</div>

The adjoint-state method provides an efficient way to compute the gradient of the FWI misfit functional: rather than computing the Fréchet derivative explicitly, one solves one forward and one adjoint wave equation to obtain the gradient at a cost independent of the number of parameters. This insight, due to Tarantola (1984) and Lailly (1983), made large-scale seismic inversion computationally feasible.

<div class="remark">
<strong>Remark 8.9.</strong> The non-convexity of the FWI misfit functional is fundamentally different from the ill-posedness discussed in earlier chapters. Even in the absence of noise, gradient-based methods can converge to local minima that are far from the true velocity model. This has driven the development of global optimization strategies, including simulated annealing and basin-hopping methods, as well as reformulations of the FWI objective using optimal transport distances (the Wasserstein distance), which provide more convex misfit landscapes. The mathematical analysis of these approaches is a frontier area in the theory of nonlinear inverse problems.
</div>

### 8.4 Weather Prediction and Numerical Weather Forecasting

Numerical weather prediction (NWP) is arguably the most important application of data assimilation. The state of the atmosphere is described by fields of temperature, pressure, humidity, and wind velocity, discretized on a global grid with \(n \sim 10^8\) to \(10^9\) degrees of freedom. Observations include satellite radiances, radiosonde profiles, aircraft reports, and surface station data, totaling \(m \sim 10^7\) observations per analysis cycle.

<div class="example">
<strong>Example 8.10 (Operational Data Assimilation at ECMWF).</strong> The European Centre for Medium-Range Weather Forecasts (ECMWF) uses a hybrid 4D-Var/ensemble system. The 4D-Var assimilation window is 12 hours, during which approximately \(4 \times 10^7\) observations are assimilated. The background error covariance \(B\) is estimated from an ensemble of 50 forecasts. The adjoint model integrates the linearized dynamics backward over the 12-hour window to compute the gradient of the cost functional. The minimization is performed using a limited-memory BFGS algorithm, typically requiring 50–100 iterations. The resulting analysis serves as the initial condition for deterministic and ensemble forecasts, which are the basis for weather predictions worldwide.
</div>

<div class="remark">
<strong>Remark 8.11.</strong> The success of modern weather prediction — forecast skill has improved by roughly one day per decade since the 1980s — is a testament to the power of data assimilation. The improvement comes from three sources: better observations (especially satellite data), better numerical models (higher resolution, improved physical parameterizations), and better data assimilation algorithms. The mathematical theory of inverse problems and data assimilation is central to this enterprise.
</div>

The connection between data assimilation and inverse problems is particularly transparent in the 4D-Var framework: finding the initial condition that best fits a trajectory of observations is precisely a nonlinear inverse problem with the dynamics as a constraint. The background term \(\|x_0 - x^b\|_{B^{-1}}^2\) serves as Tikhonov regularization, with the background error covariance \(B\) playing the role of the prior covariance in the Bayesian interpretation. This deep connection between the variational, filtering, and Bayesian perspectives is one of the most beautiful aspects of the theory.

<div class="example">
<strong>Example 8.12 (Ensemble-Variational Hybrid Methods).</strong> Modern operational systems increasingly combine ensemble and variational methods. In the "hybrid" approach used at NCEP and other centers, the background error covariance is a linear combination \(B = (1-\beta)B_{\text{static}} + \beta B_{\text{ens}}\), where \(B_{\text{static}}\) is a climatological covariance and \(B_{\text{ens}}\) is estimated from the ensemble. The parameter \(\beta \in [0,1]\) controls the blend. This approach captures the flow-dependent error structures (through the ensemble) while maintaining the stability provided by the static component.
</div>

### 8.5 Heat Source Identification

We conclude with an inverse source problem that brings together many of the themes of this course.

<div class="example">
<strong>Example 8.13 (Heat Source Identification).</strong> Consider the heat equation
\[
\frac{\partial u}{\partial t} - \Delta u = q(x) \quad \text{in } \Omega \times (0,T), \quad u = 0 \text{ on } \partial\Omega \times (0,T), \quad u(\cdot, 0) = 0,
\]
where \(q(x)\) is an unknown time-independent heat source. The forward operator \(F: q \mapsto u(\cdot, T)\) maps the source to the temperature distribution at time \(T\). By the linearity of the heat equation and the spectral expansion, if \(\{\varphi_n, \lambda_n\}\) are the Dirichlet eigenpairs of \(-\Delta\) on \(\Omega\), then
\[
(Fq)(x) = \sum_{n=1}^\infty \frac{1 - e^{-\lambda_n T}}{\lambda_n} \langle q, \varphi_n\rangle \, \varphi_n(x).
\]
The singular values of \(F\) are \(\sigma_n = (1 - e^{-\lambda_n T})/\lambda_n \sim 1/\lambda_n\) for large \(\lambda_n\), giving polynomial decay \(\sigma_n \sim n^{-2/d}\) (by Weyl's law, \(\lambda_n \sim n^{2/d}\)). This is a mildly ill-posed problem. Tikhonov regularization, CGLS, or Bayesian inversion with a Gaussian process prior on \(q\) are all effective approaches. The Bayesian framework provides the additional benefit of uncertainty quantification: the posterior standard deviation indicates where the source is well-determined by the data and where it is not.
</div>

This example illustrates the full cycle of inverse problems methodology: formulating the forward operator, analyzing its spectral properties to characterize the degree of ill-posedness, applying regularization or Bayesian inversion, and interpreting the results with rigorous uncertainty quantification.

<div class="remark">
<strong>Remark 8.14.</strong> A subtle but important point in heat source identification is that the choice of observation — final-time temperature \(u(\cdot, T)\), boundary flux measurements, or pointwise interior measurements — dramatically affects the degree of ill-posedness and the identifiability of the source. With only final-time temperature data, the source is determined up to elements of the null space of \(F\), which is trivial for time-independent sources but becomes substantial for time-dependent sources \(q(x,t)\). Uniqueness results for the latter require additional structural assumptions (e.g., separability \(q(x,t) = \sigma(t)f(x)\)) or multiple measurements.
</div>

The interplay between the deterministic theory of Chapters 2–4 and the statistical theory of Chapters 5–7 provides a comprehensive toolkit for tackling inverse problems across science and engineering. The applications presented in this chapter barely scratch the surface: inverse problems also arise in optical tomography (recovering the absorption and scattering coefficients of tissue from diffuse light measurements), quantitative photoacoustic tomography, magnetic resonance elastography, and the emerging field of computational mechanics, where one seeks to identify constitutive laws from full-field displacement measurements.

<div class="remark">
<strong>Remark 8.15.</strong> The field of inverse problems continues to evolve rapidly. Recent developments include the use of deep learning for regularization (learned regularizers, where a neural network is trained to approximate the regularized inverse map), the analysis of inverse problems on manifolds and graphs, the application of optimal transport theory to Bayesian inversion and data assimilation, and the development of derivative-free optimization methods for PDE-constrained inverse problems. The mathematical foundations developed in this course — functional analysis, regularization theory, Bayesian inference, and data assimilation — provide the rigorous framework upon which these modern advances are built. The interplay between rigorous mathematical analysis and large-scale computational methods remains the defining characteristic of the field.
</div>
