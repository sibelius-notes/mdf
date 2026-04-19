---
title: "AMATH 840: Advanced Numerical Methods for Computational and Data Sciences"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly available references. Readers are encouraged to consult them for deeper treatment of the individual topics.

- S. Foucart and H. Rauhut, *A Mathematical Introduction to Compressive Sensing* (Birkhäuser, 2013) — the definitive mathematical reference for sparse recovery and compressed sensing theory.
- P.-G. Martinsson and J. A. Tropp, "Randomized Numerical Linear Algebra: Foundations and Algorithms," *Acta Numerica* 29 (2020); arXiv:2002.01387 — a comprehensive survey of randomized matrix algorithms.
- N. Halko, P.-G. Martinsson and J. A. Tropp, "Finding Structure with Randomness: Probabilistic Algorithms for Constructing Approximate Matrix Decompositions," *SIAM Rev.* 53(2), 217–288 (2011); arXiv:0909.4061 — the foundational paper on randomized SVD.
- G. H. Golub and C. F. Van Loan, *Matrix Computations*, 4th ed. (Johns Hopkins University Press, 2013) — the standard reference for numerical linear algebra.
- I. Goodfellow, Y. Bengio and A. Courville, *Deep Learning* (MIT Press, 2016); freely available at deeplearningbook.org.
- S. J. D. Prince, *Understanding Deep Learning* (MIT Press, 2023); freely available at udlbook.github.io.
- A. Vaswani et al., "Attention Is All You Need," *NeurIPS* 2017; arXiv:1706.03762.
- J. Ho, A. Jain and P. Abbeel, "Denoising Diffusion Probabilistic Models," *NeurIPS* 2020; arXiv:2006.11239.
- R. T. Q. Chen, Y. Rubanova, J. Bettencourt and D. K. Duvenaud, "Neural Ordinary Differential Equations," *NeurIPS* 2018; arXiv:1806.07366.
- S. Boyd and L. Vandenberghe, *Convex Optimization* (Cambridge University Press, 2004); freely available at stanford.edu/~boyd/cvxbook.

---

# Chapter 1: Data-Driven Methods Foundations

## 1.1 The Supervised Learning Framework

The goal of supervised learning is to infer a mapping \( f : \mathcal{X} \to \mathcal{Y} \) from a finite collection of input-output pairs \( \{(x_i, y_i)\}_{i=1}^n \subset \mathcal{X} \times \mathcal{Y} \). We assume these pairs are drawn independently from some unknown joint distribution \( \rho \) on \( \mathcal{X} \times \mathcal{Y} \). The **true risk** of a candidate function \( h \) with respect to a loss \( \ell : \mathcal{Y} \times \mathcal{Y} \to \mathbb{R}_{\geq 0} \) is

\[
\mathcal{R}(h) = \mathbb{E}_{(x,y) \sim \rho}\left[\ell(h(x), y)\right].
\]

Since \( \rho \) is unknown, we cannot evaluate \( \mathcal{R}(h) \) directly. Instead we form the **empirical risk**

\[
\hat{\mathcal{R}}_n(h) = \frac{1}{n} \sum_{i=1}^n \ell(h(x_i), y_i),
\]

and minimize \( \hat{\mathcal{R}}_n \) over a hypothesis class \( \mathcal{H} \). This principle is called **empirical risk minimization** (ERM).

A central question is: when does minimizing \( \hat{\mathcal{R}}_n \) over \( \mathcal{H} \) lead to a function \( \hat{h} \) whose true risk is close to the best achievable true risk in \( \mathcal{H} \)? The answer hinges on the complexity of \( \mathcal{H} \) relative to the sample size \( n \), formalized through notions such as VC dimension and Rademacher complexity.

## 1.2 Bias-Variance Tradeoff

For the squared-error loss \( \ell(a,b) = (a-b)^2 \) and a fixed test point \( x \), the expected prediction error of an estimator \( \hat{f} \) trained on a random sample of size \( n \) decomposes as

\[
\mathbb{E}\left[\left(\hat{f}(x) - y\right)^2\right] = \underbrace{\left(\mathbb{E}[\hat{f}(x)] - f^*(x)\right)^2}_{\text{bias}^2} + \underbrace{\mathrm{Var}(\hat{f}(x))}_{\text{variance}} + \sigma^2,
\]

where \( f^*(x) = \mathbb{E}[y \mid x] \) is the Bayes-optimal predictor and \( \sigma^2 = \mathrm{Var}(y \mid x) \) is irreducible noise. This **bias-variance decomposition** captures the fundamental tension in model selection: complex models (large \( \mathcal{H} \)) achieve low bias but high variance, while simple models achieve the reverse. The optimal model complexity balances these two terms and typically grows with \( n \).

Concretely, if we model \( y = f^*(x) + \varepsilon \) with \( \varepsilon \sim (0, \sigma^2) \) and estimate \( f^* \) using a linear smoother \( \hat{f}(x) = \sum_i w_i(x) y_i \), then bias arises from misspecification of the functional form and variance grows as the effective degrees of freedom of the smoother.

## 1.3 Least-Squares Regression: Normal Equations, QR, and SVD

Consider the linear model \( y \approx X\beta \) where \( X \in \mathbb{R}^{n \times p} \), \( y \in \mathbb{R}^n \), and we seek

\[
\hat{\beta} = \arg\min_{\beta} \|y - X\beta\|_2^2.
\]

The minimizer satisfies the **normal equations** \( X^\top X \hat{\beta} = X^\top y \). When \( X^\top X \) is invertible this gives \( \hat{\beta} = (X^\top X)^{-1} X^\top y \). Direct solution via the normal equations requires forming \( X^\top X \), which squares the condition number: \( \kappa(X^\top X) = \kappa(X)^2 \). This is numerically undesirable.

A more stable route uses the **QR decomposition** \( X = QR \), where \( Q \in \mathbb{R}^{n \times p} \) has orthonormal columns and \( R \in \mathbb{R}^{p \times p} \) is upper triangular. The normal equations become \( R^\top R \hat{\beta} = R^\top Q^\top y \), which simplifies to \( R\hat{\beta} = Q^\top y \). This triangular system is solved by back-substitution in \( O(p^2) \) operations after an \( O(np^2) \) factorization, and the condition number of \( R \) equals that of \( X \) rather than its square.

The most robust (though most expensive) approach uses the **thin SVD** \( X = U \Sigma V^\top \), where \( U \in \mathbb{R}^{n \times p} \), \( \Sigma = \mathrm{diag}(\sigma_1, \ldots, \sigma_p) \), and \( V \in \mathbb{R}^{p \times p} \). The unique minimum-norm least-squares solution is

\[
\hat{\beta} = X^\dagger y = V \Sigma^{-1} U^\top y = \sum_{i=1}^p \frac{u_i^\top y}{\sigma_i} v_i,
\]

where \( X^\dagger \) is the Moore-Penrose pseudoinverse. This expression is numerically stable and immediately suggests regularization by truncation.

### 1.3.1 Comparison of Methods

| Method | Stability | Cost | Remarks |
|--------|-----------|------|---------|
| Normal equations | \( \kappa^2 \) | \( O(np^2 + p^3) \) | Avoid when \( \kappa \gg 1 \) |
| QR factorization | \( \kappa \) | \( O(np^2) \) | Standard in practice |
| SVD | \( \kappa \) | \( O(\min(n,p) \cdot np) \) | Best for rank-deficient \( X \) |

## 1.4 Truncated SVD and Tikhonov Regularization

When \( X \) is ill-conditioned or nearly rank-deficient, small singular values amplify noise dramatically: if \( y = X\beta^* + \varepsilon \), then the contribution of the \( i \)-th singular component to the solution is \( (u_i^\top y)/\sigma_i = (u_i^\top X\beta^*)/\sigma_i + (u_i^\top \varepsilon)/\sigma_i \). When \( \sigma_i \) is small, the noise term \( (u_i^\top \varepsilon)/\sigma_i \) blows up.

**Truncated SVD (TSVD)** regularization discards components corresponding to singular values below a threshold \( \tau \):

\[
\hat{\beta}_k = \sum_{i=1}^k \frac{u_i^\top y}{\sigma_i} v_i, \quad k = \max\{i : \sigma_i \geq \tau\}.
\]

**Tikhonov regularization** (ridge regression) instead penalizes the norm of \( \beta \):

\[
\hat{\beta}_\lambda = \arg\min_\beta \left\{ \|y - X\beta\|_2^2 + \lambda\|\beta\|_2^2 \right\} = \sum_{i=1}^p \frac{\sigma_i}{\sigma_i^2 + \lambda} (u_i^\top y) v_i.
\]

Both methods are **spectral filters**: TSVD applies a hard cutoff, Tikhonov applies a soft filter \( f_\lambda(\sigma) = \sigma/(\sigma^2+\lambda) \) that downweights small singular values continuously. The parameter \( \lambda \) (or \( k \) for TSVD) controls the bias-variance tradeoff and is typically chosen by cross-validation or the discrepancy principle when a noise level estimate is available.

## 1.5 Model Selection

**Cross-validation** partitions the training data into \( K \) folds and estimates generalization error by rotating through held-out folds. For \( K = n \) this becomes leave-one-out cross-validation (LOOCV), which for linear models admits an efficient closed-form update based on the hat matrix \( H = X(X^\top X)^{-1} X^\top \): the LOOCV error equals

\[
\mathrm{LOOCV} = \frac{1}{n} \sum_{i=1}^n \left(\frac{y_i - \hat{y}_i}{1 - H_{ii}}\right)^2,
\]

where \( \hat{y} = Hy \) is the full-data fitted vector. This follows because deleting observation \( i \) shifts the prediction by \( H_{ii}/(1-H_{ii}) \) times the residual.

Information criteria such as AIC (\( -2\log\hat{L} + 2p \)) and BIC (\( -2\log\hat{L} + p\log n \)) penalize model complexity differently: BIC's stronger penalty favors more parsimonious models and is consistent in the model-selection sense.

---

# Chapter 2: Sparse Optimization and Compressed Sensing

## 2.1 Sparsity and Underdetermined Systems

In many modern applications the number of unknowns \( p \) far exceeds the number of measurements \( n \). Classical linear algebra tells us that the system \( Ax = b \) with \( A \in \mathbb{R}^{n \times p} \), \( n \ll p \), is severely underdetermined and has infinitely many solutions. However, if we believe the true signal \( x^* \) is **\( s \)-sparse** — meaning at most \( s \) of its entries are nonzero — and if \( s \ll n \), then the system is highly constrained in a combinatorial sense. Compressed sensing theory identifies conditions under which \( x^* \) is the *unique* sparse solution and provides efficient algorithms to recover it.

The ideal formulation seeks the sparsest solution:

\[
\min_{x \in \mathbb{R}^p} \|x\|_0 \quad \text{subject to} \quad Ax = b,
\]

where \( \|x\|_0 = |\{i : x_i \neq 0\}| \) counts nonzeros. This problem is NP-hard in general. The central insight of compressed sensing — due to Candès, Romberg, Tao and Donoho — is that under appropriate conditions on \( A \), the \( \ell^1 \) relaxation

\[
\min_{x \in \mathbb{R}^p} \|x\|_1 \quad \text{subject to} \quad Ax = b
\]

recovers \( x^* \) exactly, and can be solved by efficient convex programming.

## 2.2 Null Space Property and Coherence

<div class="definition">
<strong>Definition (Null Space Property).</strong> A matrix <em>A</em> satisfies the <em>Null Space Property (NSP)</em> of order <em>s</em> if for every vector <em>v</em> in the null space of <em>A</em> and every index set <em>S</em> with <em>|S| ≤ s</em>,

\[ \|v_S\|_1 < \|v_{\bar{S}}\|_1, \]

where <em>v_S</em> denotes the restriction of <em>v</em> to the coordinates in <em>S</em> and <em>\(\bar{S}\)</em> is its complement.
</div>

The NSP precisely characterizes when \( \ell^1 \)-minimization recovers all \( s \)-sparse vectors: \( A \) has the NSP of order \( s \) if and only if every \( s \)-sparse \( x^* \) is the unique solution of \( \min \|x\|_1 \) subject to \( Ax = b \) with \( b = Ax^* \).

The **coherence** of \( A \) (with columns normalized to unit \( \ell^2 \) norm) is

\[
\mu(A) = \max_{i \neq j} |a_i^\top a_j|.
\]

<div class="theorem">
<strong>Theorem (Coherence Bound).</strong> If <em>A</em> has unit-norm columns and coherence <em>μ</em>, and if the sparsity <em>s</em> satisfies

\[ s < \frac{1}{2}\left(1 + \frac{1}{\mu}\right), \]

then every <em>s</em>-sparse vector is uniquely recoverable by ℓ¹-minimization from <em>Ax = b</em>.
</div>

The coherence bound is easy to verify but pessimistic: it requires \( s = O(1/\mu) \), whereas the RIP-based theory allows \( s = O(\sqrt{n}) \) for random matrices.

## 2.3 Orthogonal Matching Pursuit

**Orthogonal Matching Pursuit (OMP)** is a greedy algorithm that iteratively selects columns of \( A \) most correlated with the current residual.

**Algorithm OMP:** Initialize \( r^{(0)} = b \), \( S^{(0)} = \emptyset \). At each iteration \( t \):
1. Find \( j_t = \arg\max_j |a_j^\top r^{(t-1)}| \) (most correlated column).
2. Update \( S^{(t)} = S^{(t-1)} \cup \{j_t\} \).
3. Compute \( x^{(t)} = \arg\min_{x : \mathrm{supp}(x) \subseteq S^{(t)}} \|b - Ax\|_2 \) (orthogonal projection).
4. Update residual \( r^{(t)} = b - Ax^{(t)} \).

Stop after \( s \) iterations or when \( \|r^{(t)}\| \) falls below a noise threshold.

<div class="theorem">
<strong>Theorem (OMP Recovery).</strong> If <em>A</em> has unit-norm columns with coherence <em>μ</em> and <em>b = Ax*</em> where <em>x*</em> is <em>s</em>-sparse with

\[ s < \frac{1}{2}\left(1 + \frac{1}{\mu}\right), \]

then OMP recovers <em>x*</em> exactly in exactly <em>s</em> iterations.
</div>

The key step in the proof is showing that at each iteration the correct column is selected. If \( x^* \) has support \( T \) and the current residual is \( r = A_{T} \alpha \) for some coefficient vector \( \alpha \), then the maximum inner product \( \max_j |a_j^\top r| \) is achieved by a column in \( T \) provided the coherence condition holds.

## 2.4 Iterative Thresholding Algorithms

**Iterative Hard Thresholding (IHT)** iterates the update

\[
x^{(t+1)} = \mathcal{H}_s\!\left(x^{(t)} + \mu A^\top(b - Ax^{(t)})\right),
\]

where \( \mathcal{H}_s(z) \) retains only the \( s \) largest-magnitude components of \( z \) and sets the rest to zero. With step size \( \mu = 1/\|A\|_2^2 \), IHT converges to a local minimizer of the \( \ell^0 \)-constrained problem.

**Iterative Soft Thresholding (IST)** applies the soft-thresholding operator \( \mathcal{S}_\lambda(z_i) = \mathrm{sign}(z_i)\max(|z_i|-\lambda, 0) \) and solves the regularized problem

\[
\min_x \frac{1}{2}\|Ax - b\|_2^2 + \lambda\|x\|_1.
\]

The update is \( x^{(t+1)} = \mathcal{S}_{\lambda/L}\!\left(x^{(t)} - \frac{1}{L}A^\top(Ax^{(t)}-b)\right) \), where \( L = \|A^\top A\|_2 \). This is the proximal gradient method, also known as ISTA (Iterative Shrinkage-Thresholding Algorithm).

## 2.5 ISTA and FISTA

The **LASSO** problem \( \min_x \frac{1}{2}\|Ax-b\|_2^2 + \lambda\|x\|_1 \) can be written as \( \min_x f(x) + g(x) \) with \( f(x) = \frac{1}{2}\|Ax-b\|_2^2 \) smooth and \( g(x) = \lambda\|x\|_1 \) convex non-smooth. The **proximal operator** of \( g \) is

\[
\mathrm{prox}_{\gamma g}(v) = \arg\min_x \left\{g(x) + \frac{1}{2\gamma}\|x-v\|_2^2\right\} = \mathcal{S}_{\gamma\lambda}(v).
\]

ISTA is the **proximal gradient descent** iteration:

\[
x^{(t+1)} = \mathrm{prox}_{g/L}\!\left(x^{(t)} - \frac{1}{L}\nabla f(x^{(t)})\right).
\]

<div class="theorem">
<strong>Theorem (ISTA Convergence).</strong> Let <em>f</em> be convex with <em>L</em>-Lipschitz gradient, and let <em>g</em> be convex. ISTA with step size <em>1/L</em> satisfies

\[ F(x^{(t)}) - F^* \leq \frac{L\|x^{(0)} - x^*\|_2^2}{2t}, \]

so the objective gap decays as <em>O(1/t)</em>.
</div>

**FISTA** (Fast ISTA, Beck and Teboulle 2009) accelerates this to \( O(1/t^2) \) by incorporating a momentum step. The iteration is

\[
x^{(t+1)} = \mathrm{prox}_{g/L}\!\left(y^{(t)} - \frac{1}{L}\nabla f(y^{(t)})\right),
\]

\[
y^{(t+1)} = x^{(t+1)} + \frac{\theta_t - 1}{\theta_{t+1}}\left(x^{(t+1)} - x^{(t)}\right),
\]

where \( \theta_0 = 1 \) and \( \theta_{t+1} = \frac{1 + \sqrt{1 + 4\theta_t^2}}{2} \). The point \( y^{(t)} \) is an **extrapolation** of the last two iterates.

<div class="theorem">
<strong>Theorem (FISTA Convergence).</strong> FISTA achieves

\[ F(x^{(t)}) - F^* \leq \frac{2L\|x^{(0)} - x^*\|_2^2}{(t+1)^2}, \]

an <em>O(1/t²)</em> rate that is optimal among first-order methods for this problem class.
</div>

*Proof sketch.* The key is tracking an energy functional \( \mathcal{E}_t = \theta_t^2(F(x^{(t)}) - F^*) + \frac{L}{2}\|z^{(t)} - x^*\|_2^2 \) for a carefully chosen auxiliary sequence \( z^{(t)} \). One shows \( \mathcal{E}_{t+1} \leq \mathcal{E}_t \) using the descent lemma and the update rule for \( \theta_t \). Since \( \theta_t \sim t/2 \) for large \( t \), this yields the \( O(1/t^2) \) bound.

## 2.6 ADMM and Primal-Dual Methods

The **Alternating Direction Method of Multipliers (ADMM)** solves problems of the form

\[
\min_{x,z} f(x) + g(z) \quad \text{subject to} \quad Ax + Bz = c.
\]

The augmented Lagrangian is \( \mathcal{L}_\rho(x,z,u) = f(x) + g(z) + u^\top(Ax+Bz-c) + \frac{\rho}{2}\|Ax+Bz-c\|_2^2 \). ADMM alternates between minimizing over \( x \), minimizing over \( z \), and updating the dual variable \( u \):

\[
x^{(t+1)} = \arg\min_x \mathcal{L}_\rho(x, z^{(t)}, u^{(t)}),
\]
\[
z^{(t+1)} = \arg\min_z \mathcal{L}_\rho(x^{(t+1)}, z, u^{(t)}),
\]
\[
u^{(t+1)} = u^{(t)} + \rho(Ax^{(t+1)} + Bz^{(t+1)} - c).
\]

For the LASSO, ADMM with the splitting \( x = z \) reduces the \( x \)-update to a ridge regression and the \( z \)-update to soft thresholding, both with closed forms. ADMM converges at \( O(1/t) \) for convex problems and is particularly well-suited to distributed settings.

**Primal-dual proximal methods** directly work on the saddle-point problem \( \min_x \max_u f(x) + \langle Kx, u\rangle - g^*(u) \) and interleave proximal steps in both primal and dual variables, achieving \( O(1/t) \) convergence for convex-concave problems.

## 2.7 Restricted Isometry Property

<div class="definition">
<strong>Definition (RIP).</strong> A matrix <em>A ∈ ℝ^{n×p}</em> satisfies the <em>Restricted Isometry Property (RIP)</em> of order <em>s</em> with constant <em>δ_s ∈ (0,1)</em> if

\[ (1 - \delta_s)\|x\|_2^2 \leq \|Ax\|_2^2 \leq (1 + \delta_s)\|x\|_2^2 \]

for every <em>s</em>-sparse vector <em>x ∈ ℝ^p</em>.
</div>

Geometrically, the RIP says that \( A \) acts as a near-isometry on all \( s \)-sparse vectors simultaneously: it does not too greatly distort their norms.

<div class="theorem">
<strong>Theorem (Candès-Romberg-Tao).</strong> If <em>A</em> satisfies RIP of order <em>2s</em> with constant <em>δ_{2s} < √2 − 1 ≈ 0.4142</em>, then for any <em>s</em>-sparse vector <em>x*</em> the solution <em>x̂</em> of

\[ \min_x \|x\|_1 \quad \text{subject to} \quad \|Ax - b\|_2 \leq \eta \]

satisfies

\[ \|x̂ - x*\|_2 \leq C_0 \eta, \]

for a constant <em>C₀</em> depending only on <em>δ_{2s}</em>. In the noiseless case <em>η = 0</em>, recovery is exact.
</div>

The proof introduces the **cone constraint** on the error \( h = \hat{x} - x^* \) (that \( \|h_{\bar{S}}\|_1 \leq \|h_S\|_1 \) follows from optimality of \( \hat{x} \)), then uses the RIP to bound \( \|h\|_2 \) in terms of the constraint violation.

### 2.7.1 RIP for Random Matrices

A central result is that random matrices satisfy the RIP with high probability using very few measurements.

<div class="theorem">
<strong>Theorem (RIP for Gaussian Matrices).</strong> Let each entry of <em>A ∈ ℝ^{n×p}</em> be drawn i.i.d. from <em>N(0, 1/n)</em>. If

\[ n \geq C \delta^{-2} s \log(ep/s), \]

then <em>A</em> satisfies RIP of order <em>s</em> with constant <em>δ</em> with probability at least <em>1 − 2e^{−cn}</em>.
</div>

The same result holds for Bernoulli (\( \pm 1/\sqrt{n} \)) matrices and more generally for any sub-Gaussian distribution. The \( s\log(p/s) \) scaling of measurements is information-theoretically near-optimal for \( s \)-sparse recovery.

---

# Chapter 3: Kernel Methods and Reproducing Kernel Hilbert Spaces

## 3.1 Reproducing Kernel Hilbert Spaces

A **reproducing kernel Hilbert space (RKHS)** is a Hilbert space \( \mathcal{H} \) of functions \( f : \mathcal{X} \to \mathbb{R} \) in which point evaluations are continuous linear functionals. By the Riesz representation theorem, for each \( x \in \mathcal{X} \) there exists a unique \( K_x \in \mathcal{H} \) such that

\[
f(x) = \langle f, K_x \rangle_{\mathcal{H}} \quad \text{for all } f \in \mathcal{H}.
\]

The function \( K : \mathcal{X} \times \mathcal{X} \to \mathbb{R} \) defined by \( K(x, x') = \langle K_x, K_{x'}\rangle_{\mathcal{H}} = K_{x'}(x) \) is called the **reproducing kernel** of \( \mathcal{H} \).

<div class="definition">
<strong>Definition (Positive Definite Kernel).</strong> A symmetric function <em>K : X × X → ℝ</em> is <em>positive definite</em> if for all finite sets <em>{x₁,...,xₙ} ⊂ X</em> and all <em>c ∈ ℝⁿ</em>,

\[ \sum_{i,j=1}^n c_i c_j K(x_i, x_j) \geq 0, \]

with equality only when <em>c = 0</em> (strictly positive definite).
</div>

<div class="theorem">
<strong>Theorem (Mercer's Theorem).</strong> Let <em>K</em> be a continuous positive-definite kernel on a compact set <em>X ⊂ ℝ^d</em>. Then <em>K</em> admits an expansion

\[ K(x, x') = \sum_{j=1}^\infty \lambda_j \phi_j(x) \phi_j(x'), \]

where <em>{φ_j}</em> are the eigenfunctions of the integral operator <em>(T_K f)(x) = ∫ K(x,x')f(x') dμ(x')</em> and <em>λ_j > 0</em> are the corresponding eigenvalues. The series converges absolutely and uniformly.
</div>

Mercer's theorem allows us to implicitly work in the (potentially infinite-dimensional) feature space \( \mathcal{H} \) through the kernel function \( K(x,x') \) alone, without explicitly computing \( \phi_j \).

## 3.2 Common Kernels

The **Gaussian (RBF) kernel** \( K(x,x') = \exp(-\|x-x'\|_2^2 / (2\ell^2)) \) corresponds to an infinite-dimensional feature space and is universal (can approximate any continuous function on compact sets). The **polynomial kernel** \( K(x,x') = (x^\top x' + c)^d \) of degree \( d \) corresponds to all monomials up to degree \( d \).

The kernel trick is the observation that many algorithms — including SVMs, kernel PCA, and Gaussian process regression — depend on the data only through inner products \( \langle x_i, x_j \rangle \). Replacing these with \( K(x_i, x_j) \) implicitly operates in the RKHS feature space without ever forming the feature vectors explicitly.

## 3.3 Tikhonov Regularization in RKHS

Learning in an RKHS seeks \( f \in \mathcal{H} \) minimizing

\[
\frac{1}{n}\sum_{i=1}^n \ell(f(x_i), y_i) + \lambda\|f\|_{\mathcal{H}}^2.
\]

The \( \|f\|_{\mathcal{H}}^2 \) penalty controls the complexity of \( f \) in the RKHS norm, which measures smoothness in a kernel-specific sense. For the squared loss and Gaussian kernel, this corresponds to Gaussian process regression with a specific prior.

## 3.4 Representer Theorem

<div class="theorem">
<strong>Theorem (Representer Theorem, Kimeldorf and Wahba 1971; Schölkopf et al. 2001).</strong> Let <em>K</em> be a positive-definite kernel and <em>Φ : [0,∞) → ℝ</em> a strictly increasing function. For any loss function <em>L</em>, the minimizer of

\[ \min_{f \in H} \sum_{i=1}^n L(y_i, f(x_1), \ldots, f(x_n)) + \Phi(\|f\|_{\mathcal{H}}) \]

satisfies

\[ f^*(x) = \sum_{i=1}^n \alpha_i K(x, x_i) \]

for some coefficients <em>α ∈ ℝⁿ</em>.
</div>

*Proof.* Decompose \( f = f_{\parallel} + f_\perp \) where \( f_{\parallel} \) lies in the span of \( \{K_{x_i}\}_{i=1}^n \) and \( f_\perp \perp \{K_{x_i}\}_{i=1}^n \). By the reproducing property, \( f(x_i) = \langle f, K_{x_i}\rangle = \langle f_{\parallel}, K_{x_i}\rangle = f_{\parallel}(x_i) \). Therefore the data-fit term depends only on \( f_{\parallel} \). Since \( \|f\|_{\mathcal{H}}^2 = \|f_{\parallel}\|_{\mathcal{H}}^2 + \|f_\perp\|_{\mathcal{H}}^2 \), the regularization term is minimized by setting \( f_\perp = 0 \). Hence the minimizer lies in the \( n \)-dimensional subspace spanned by the kernel sections at the training points. \( \square \)

The representer theorem is fundamental: it reduces an infinite-dimensional variational problem to a finite-dimensional one. Substituting \( f(x) = \sum_j \alpha_j K(x,x_j) \) into the objective gives a problem in \( \alpha \in \mathbb{R}^n \) involving only the **kernel matrix** \( K_{ij} = K(x_i,x_j) \).

## 3.5 Hyperparameter Selection

The RKHS approach introduces at minimum two hyperparameters: the regularization strength \( \lambda \) and any parameters in the kernel (e.g., the bandwidth \( \ell \) in the Gaussian kernel). These are typically selected by cross-validation or marginal likelihood maximization (in the Gaussian process interpretation). Efficient computation of leave-one-out cross-validation for kernel methods exploits the Woodbury identity to update the solution as training points are removed without refactorizing the kernel matrix.

---

# Chapter 4: Randomized Numerical Linear Algebra

## 4.1 Johnson-Lindenstrauss Lemma

A foundational result in dimensionality reduction asserts that any finite point cloud can be embedded in a low-dimensional Euclidean space with controlled metric distortion.

<div class="theorem">
<strong>Theorem (Johnson-Lindenstrauss, 1984).</strong> For any set of <em>m</em> points in <em>ℝ^p</em> and any <em>ε ∈ (0,1/2)</em>, there exists a linear map <em>Φ : ℝ^p → ℝ^k</em> with

\[ k = O(\varepsilon^{-2} \log m) \]

such that for all pairs <em>i,j</em>,

\[ (1-\varepsilon)\|x_i - x_j\|_2^2 \leq \|\Phi x_i - \Phi x_j\|_2^2 \leq (1+\varepsilon)\|x_i - x_j\|_2^2. \]

Moreover, a random matrix with i.i.d. <em>N(0,1/k)</em> entries achieves this with high probability.
</div>

*Proof sketch (sub-Gaussian concentration).* Fix a unit vector \( u \in \mathbb{R}^p \) and let \( \Phi = \frac{1}{\sqrt{k}} G \) with \( G \in \mathbb{R}^{k \times p} \) having i.i.d. \( N(0,1) \) entries. Then \( \|\Phi u\|_2^2 = \frac{1}{k}\|Gu\|_2^2 = \frac{1}{k}\sum_{i=1}^k (g_i^\top u)^2 \), and each term \( (g_i^\top u)^2 \sim \chi^2_1 \) (since \( g_i^\top u \sim N(0,1) \) for any fixed unit vector). The chi-squared concentration inequality gives \( P(|\frac{1}{k}\sum_{i=1}^k Z_i - 1| > \varepsilon) \leq 2\exp(-k\varepsilon^2/8) \) for i.i.d. standard normals \( Z_i \). A union bound over all \( \binom{m}{2} \) pairs requires \( k \gtrsim \varepsilon^{-2}\log m \).

## 4.2 Randomized Matrix Multiplication and Sketching

Given matrices \( A \in \mathbb{R}^{m \times n} \) and \( B \in \mathbb{R}^{n \times p} \), the exact product \( C = AB \) costs \( O(mnp) \). The randomized approximation samples columns of \( A \) and rows of \( B \) with probability proportional to \( \|a_k\|_2 \|b_k\|_2 \): define

\[
\tilde{C} = \frac{1}{s}\sum_{t=1}^s \frac{a_{k_t} b_{k_t}^\top}{p_{k_t}},
\]

where column \( k_t \) is sampled with probability \( p_k \propto \|a_k\|_2 \|b_k\|_2 \). Then \( \mathbb{E}[\tilde{C}] = AB \) and the variance decays as \( 1/s \).

A **sketch** of an \( m \times n \) matrix \( A \) with respect to a random matrix \( S \in \mathbb{R}^{k \times m} \) is the product \( SA \in \mathbb{R}^{k \times n} \) with \( k \ll m \). The sketch-and-solve approach for least squares computes \( \hat{x} = \arg\min_x \|SA(Sx - Sb)\|_2 \). For Gaussian or sub-Gaussian sketches, the sketched solution satisfies a \( (1+\varepsilon) \)-multiplicative approximation guarantee with high probability when \( k = O(p/\varepsilon^2) \).

## 4.3 Randomized QR Decomposition

**Randomized rank-revealing QR (RRQR)** approximates the column space of \( A \) by first sketching \( B = SA \in \mathbb{R}^{k \times n} \), computing a column-pivoted QR decomposition of \( B^\top \) to identify a set of \( k \) columns spanning the approximate column range, and then applying QR to those columns of \( A \). The result is an approximate factorization \( A \approx QRP \) where \( P \) is a permutation, \( R \) is upper triangular, and \( Q \) has orthonormal columns. The randomized approach reduces the dominant cost from \( O(mnr) \) to \( O(mn \log r + mr^2) \) for rank-\( r \) approximations.

## 4.4 Randomized SVD: The Halko-Martinsson-Tropp Algorithm

The randomized SVD algorithm of Halko, Martinsson and Tropp (2011) computes a low-rank approximation \( A \approx U_k \Sigma_k V_k^\top \) in two stages.

**Stage A (range approximation):** Draw a Gaussian random matrix \( \Omega \in \mathbb{R}^{n \times (k+p)} \) with i.i.d. \( N(0,1) \) entries and form the sample matrix \( Y = A\Omega \in \mathbb{R}^{m \times (k+p)} \). Compute a thin QR: \( Y = QR \), yielding \( Q \in \mathbb{R}^{m \times (k+p)} \) with \( \mathrm{range}(Q) \approx \mathrm{range}_k(A) \).

**Stage B (SVD of small matrix):** Form \( B = Q^\top A \in \mathbb{R}^{(k+p) \times n} \), compute its thin SVD \( B = \tilde{U}\Sigma V^\top \), and set \( U = Q\tilde{U} \). Output \( A \approx U\Sigma V^\top \).

**Power iteration** can be used to sharpen the approximation: replace \( Y = A\Omega \) with \( Y = (AA^\top)^q A\Omega \) for some integer \( q \geq 1 \). This amplifies the ratio \( (\sigma_k/\sigma_{k+1})^{2q+1} \) between the \( k \)-th and \( (k+1) \)-th singular values, dramatically improving the range approximation for matrices with slowly decaying singular values.

<div class="theorem">
<strong>Theorem (Expected Error, Halko-Martinsson-Tropp).</strong> Let <em>A ∈ ℝ^{m×n}</em> and let <em>Q</em> be computed as above with oversampling parameter <em>p ≥ 2</em>. Then

\[ \mathbb{E}\|A - QQ^\top A\|_F \leq \left(1 + \frac{k}{p-1}\right)^{1/2} \left(\sum_{j>k} \sigma_j^2\right)^{1/2}. \]

For the spectral norm, with probability at least <em>1 − δ</em>,

\[ \|A - QQ^\top A\|_2 \leq \left(1 + \frac{4\sqrt{k+p}}{p} \cdot \sqrt{\min(m,n)}\right) \sigma_{k+1}(A). \]
</div>

The expected Frobenius error exceeds the optimal rank-\( k \) Frobenius error (which equals \( (\sum_{j>k}\sigma_j^2)^{1/2} \) by the Eckart-Young theorem) by only a constant factor, especially when \( p \geq k \). The algorithm requires \( O(mn\log k) \) floating-point operations — far less than the \( O(mn\min(m,n)) \) cost of full SVD.

## 4.5 Applications to Model Reduction

Randomized SVD is the engine for many large-scale data science tasks. In **principal component analysis (PCA)**, computing the leading \( k \) singular vectors of a data matrix \( X \in \mathbb{R}^{n \times d} \) via randomized SVD costs \( O(nd\log k) \) rather than \( O(nd\min(n,d)) \). In **model reduction** for dynamical systems, the proper orthogonal decomposition (POD) basis is computed by randomized SVD of the snapshot matrix. In **recommendation systems**, randomized SVD extracts the latent factor structure of large user-item matrices. The oversampling parameter \( p \) and power iteration count \( q \) are tuned to balance accuracy against computational cost.

---

# Chapter 5: Deep Neural Networks

## 5.1 Fully Connected Networks and Universal Approximation

A **fully connected (feedforward) neural network** with \( L \) layers maps an input \( x \in \mathbb{R}^{d_0} \) to an output \( y \in \mathbb{R}^{d_L} \) via

\[
h^{(0)} = x, \quad h^{(\ell)} = \sigma\!\left(W^{(\ell)} h^{(\ell-1)} + b^{(\ell)}\right), \quad \ell = 1, \ldots, L,
\]

where \( W^{(\ell)} \in \mathbb{R}^{d_\ell \times d_{\ell-1}} \) and \( b^{(\ell)} \in \mathbb{R}^{d_\ell} \) are learnable parameters and \( \sigma \) is an elementwise activation function (e.g., ReLU, sigmoid, tanh).

<div class="theorem">
<strong>Theorem (Universal Approximation, Cybenko 1989; Hornik et al. 1989).</strong> Let <em>σ</em> be a non-constant bounded continuous activation function. For any continuous function <em>f : [0,1]^d → ℝ</em> and <em>ε > 0</em>, there exist parameters such that a single-hidden-layer network achieves

\[ \sup_{x \in [0,1]^d} |f_\theta(x) - f(x)| < \varepsilon. \]
</div>

Barron's theorem (1993) provides a quantitative rate: functions with integrable frequency-domain representations can be approximated by a two-layer network of width \( O(\varepsilon^{-2}) \) independent of \( d \), avoiding the curse of dimensionality for this function class. **ReLU networks** — which use \( \sigma(z) = \max(0,z) \) — are piecewise linear and admit a combinatorial analysis: depth-\( L \) ReLU networks can represent exponentially more linear regions than depth-1 networks, a rigorous justification for depth.

## 5.2 Convolutional Neural Networks

**Convolutional neural networks (CNNs)** exploit translation equivariance by sharing parameters across spatial positions. A 2D convolution layer applies a set of learned filters \( w^{(k)} \in \mathbb{R}^{h \times h \times C_{\rm in}} \) to an input feature map \( Z \in \mathbb{R}^{H \times W \times C_{\rm in}} \):

\[
\left(Z * w^{(k)}\right)_{ij} = \sum_{s,t,c} Z_{i+s, j+t, c} \cdot w^{(k)}_{s,t,c}.
\]

The parameter count is \( h^2 C_{\rm in} C_{\rm out} \), independent of the spatial dimensions \( H, W \). Interspersed pooling layers (max pooling, average pooling) progressively reduce spatial resolution and build translation-invariant representations.

## 5.3 Residual Networks

**Residual networks (ResNets)**, introduced by He et al. (2016), add skip connections that bypass one or more layers:

\[
h^{(\ell+1)} = h^{(\ell)} + \mathcal{F}(h^{(\ell)}; \theta^{(\ell)}),
\]

where \( \mathcal{F} \) is a small sub-network (typically two convolution-BN-ReLU blocks). The identity shortcut \( h^{(\ell)} \) provides two critical benefits. First, **gradient flow**: the gradient of the loss with respect to \( h^{(\ell)} \) satisfies

\[
\frac{\partial \mathcal{L}}{\partial h^{(\ell)}} = \frac{\partial \mathcal{L}}{\partial h^{(L)}} \cdot \prod_{k=\ell}^{L-1}\left(I + \frac{\partial \mathcal{F}_k}{\partial h^{(k)}}\right),
\]

and the identity component prevents the product from vanishing even when the Jacobians \( \partial \mathcal{F}_k/\partial h^{(k)} \) are small. Second, **ensemble interpretation**: the expanded computation tree of a ResNet resembles an ensemble of \( 2^L \) shallower paths, promoting robustness.

## 5.4 Transformers and the Attention Mechanism

The **Transformer** architecture (Vaswani et al., 2017) abandons recurrence and convolution entirely, relying instead on self-attention to model dependencies across the entire sequence.

Given a sequence represented as a matrix \( X \in \mathbb{R}^{T \times d_{\rm model}} \), the **scaled dot-product attention** is

\[
\mathrm{Attention}(Q, K, V) = \mathrm{softmax}\!\left(\frac{QK^\top}{\sqrt{d_k}}\right) V,
\]

where \( Q = XW_Q \), \( K = XW_K \), \( V = XW_V \) are the query, key, and value projections with \( W_Q, W_K \in \mathbb{R}^{d_{\rm model} \times d_k} \) and \( W_V \in \mathbb{R}^{d_{\rm model} \times d_v} \). The softmax is applied row-wise, normalizing over the key dimension. The factor \( 1/\sqrt{d_k} \) prevents the dot products from growing in magnitude with \( d_k \), which would push the softmax into saturation.

**Multi-head attention** computes \( H \) attention functions in parallel, each projecting to a lower-dimensional subspace, and concatenates the results:

\[
\mathrm{MHA}(X) = \mathrm{Concat}(\mathrm{head}_1, \ldots, \mathrm{head}_H) W_O,
\]

\[
\mathrm{head}_i = \mathrm{Attention}(XW_{Q,i}, XW_{K,i}, XW_{V,i}).
\]

Multiple heads allow the model to jointly attend to information from different representation subspaces at different positions.

**Positional encoding** injects sequence order information (absent from the permutation-invariant attention) via a fixed or learned additive signal:

\[
\mathrm{PE}(t, 2i) = \sin\!\left(\frac{t}{10000^{2i/d}}\right), \quad \mathrm{PE}(t, 2i+1) = \cos\!\left(\frac{t}{10000^{2i/d}}\right).
\]

This sinusoidal encoding has the property that \( \mathrm{PE}(t + \Delta) \) can be expressed as a fixed linear function of \( \mathrm{PE}(t) \), enabling relative position offsets to be represented linearly.

## 5.5 Kolmogorov-Arnold Networks

**Kolmogorov-Arnold Networks (KANs)** are based on the Kolmogorov-Arnold representation theorem, which states that any continuous multivariate function \( f : [0,1]^n \to \mathbb{R} \) can be expressed as

\[
f(x_1, \ldots, x_n) = \sum_{q=1}^{2n+1} \Phi_q\!\left(\sum_{p=1}^n \phi_{q,p}(x_p)\right),
\]

a composition of univariate functions. KANs replace the fixed activation functions of MLPs with learned univariate functions \( \phi_{q,p} \) parameterized as B-splines on a grid. Each edge in the network is a learnable spline rather than a fixed activation following a linear operation. This allows KANs to represent exact compositional structure and provides interpretability through visualization of the learned splines. The trade-off versus MLPs lies in the spline parameterization overhead and the need to adaptively refine the spline grid during training.

## 5.6 Physics-Informed Neural Networks

**Physics-Informed Neural Networks (PINNs)** incorporate partial differential equation (PDE) constraints directly into the loss function. Given a PDE \( \mathcal{N}[u](x,t) = f(x,t) \) on a domain \( \Omega \) with boundary condition \( \mathcal{B}[u] = g \), a neural network \( u_\theta(x,t) \) is trained to minimize

\[
\mathcal{L}(\theta) = w_r \mathcal{L}_r + w_b \mathcal{L}_b + w_d \mathcal{L}_d,
\]

where \( \mathcal{L}_r = \frac{1}{N_r}\sum_i |\mathcal{N}[u_\theta](x_i,t_i) - f(x_i,t_i)|^2 \) is the **residual loss** at collocation points, \( \mathcal{L}_b \) enforces boundary conditions, and \( \mathcal{L}_d \) fits any available data. Derivatives in \( \mathcal{N}[u_\theta] \) are computed via automatic differentiation. PINNs require no spatial grid and naturally handle irregular domains, but can be difficult to train due to the multi-objective nature of the loss.

## 5.7 Scaling Laws

Empirical scaling laws (Kaplan et al., 2020 for language models) reveal that model performance follows power laws in compute \( C \), dataset size \( D \), and parameter count \( N \):

\[
\mathcal{L}(N, D, C) \sim \alpha_N N^{-a} + \alpha_D D^{-b} + \text{const.}
\]

**Model collapse** refers to the degradation of model quality when training on AI-generated data replaces original human-generated data: the distribution of synthetic data is narrower than the true distribution (tails are underrepresented), and iterative training on such data progressively shrinks the effective support, losing diversity and rare but important modes.

---

# Chapter 6: Backpropagation and Automatic Differentiation

## 6.1 Computational Graph Formalism

Any numerical computation can be represented as a **directed acyclic graph (DAG)** where nodes are variables (scalars, vectors, or tensors) and edges represent elementary operations (addition, multiplication, exp, etc.). An **elementary operation** has a simple known derivative. The total derivative of a scalar output \( L \) with respect to an input \( x \) is computed by accumulating contributions along all paths from \( x \) to \( L \) in the graph.

## 6.2 Forward-Mode Automatic Differentiation

**Forward-mode AD** propagates **dual numbers** through the computation. A dual number is a pair \( (v, \dot{v}) \in \mathbb{R}^2 \) representing a function value and its directional derivative in a chosen direction \( d \):

\[
f(x + \epsilon d) \approx f(x) + \epsilon \nabla f(x)^\top d = v + \epsilon \dot{v},
\]

where \( \epsilon^2 = 0 \) is the dual unit. Elementary operations extend to dual numbers via

\[
(a, \dot{a}) + (b, \dot{b}) = (a+b, \dot{a}+\dot{b}), \quad (a, \dot{a}) \cdot (b, \dot{b}) = (ab, \, a\dot{b} + \dot{a}b),
\]

and analogously for exp, log, etc. A single forward pass through the graph computes \( \nabla f(x)^\top d \) for one direction \( d \). To compute the full Jacobian \( J \in \mathbb{R}^{m \times n} \) (with \( m \) outputs and \( n \) inputs), forward mode requires \( n \) passes — one per input direction. Thus forward mode is efficient when \( n \ll m \).

## 6.3 Reverse-Mode Automatic Differentiation and Backpropagation

**Reverse-mode AD** computes the gradient of a scalar loss \( L \) with respect to all inputs in a single backward pass. The **adjoint** (cotangent) of a node \( v_i \) is \( \bar{v}_i = \partial L / \partial v_i \). Starting from \( \bar{L} = 1 \), adjoints are propagated backward through the graph using the chain rule:

\[
\bar{v}_i = \sum_{j : i \to j} \bar{v}_j \cdot \frac{\partial v_j}{\partial v_i}.
\]

For a composition \( L = f_k \circ f_{k-1} \circ \cdots \circ f_1 \), reverse mode computes \( \nabla_x L = J_{f_1}^\top J_{f_2}^\top \cdots J_{f_k}^\top \nabla_{f_k} L \) in order from output to input. The total cost is proportional to the forward-pass cost, independent of the number of parameters — an enormous advantage in neural network training where \( n \) (number of parameters) is vastly larger than \( m = 1 \) (scalar loss).

**Backpropagation** is precisely reverse-mode AD applied to a neural network's computation graph. For a network with layers \( h^{(\ell)} = \sigma(W^{(\ell)} h^{(\ell-1)} + b^{(\ell)}) \) and loss \( \mathcal{L}(h^{(L)}, y) \), define the error signal \( \delta^{(\ell)} = \frac{\partial \mathcal{L}}{\partial z^{(\ell)}} \) where \( z^{(\ell)} = W^{(\ell)} h^{(\ell-1)} + b^{(\ell)} \) is the pre-activation. The backward recursion is

\[
\delta^{(\ell)} = \left(W^{(\ell+1)}\right)^\top \delta^{(\ell+1)} \odot \sigma'(z^{(\ell)}),
\]

and the parameter gradients are \( \nabla_{W^{(\ell)}} \mathcal{L} = \delta^{(\ell)} (h^{(\ell-1)})^\top \), \( \nabla_{b^{(\ell)}} \mathcal{L} = \delta^{(\ell)} \). This two-pass algorithm (forward to compute activations, backward to compute gradients) has the same \( O(p) \) cost as evaluating the network, where \( p \) is the total number of parameters.

## 6.4 Adjoint Methods for ODE-Constrained Optimization

Consider optimizing a scalar objective \( J(\theta) = g(x(T), \theta) \) where \( x(t) \) satisfies the ODE

\[
\dot{x}(t) = f(x(t), t, \theta), \quad x(0) = x_0.
\]

Computing \( \nabla_\theta J \) by differentiating through the ODE solver is memory-intensive. The **adjoint method** instead introduces the adjoint state \( \lambda(t) \in \mathbb{R}^d \) satisfying the **adjoint ODE**

\[
\dot{\lambda}(t) = -\lambda(t)^\top \frac{\partial f}{\partial x}(x(t), t, \theta), \quad \lambda(T) = \frac{\partial g}{\partial x}(x(T)),
\]

which is solved backward in time from \( T \) to \( 0 \). The gradient is then

\[
\frac{dJ}{d\theta} = \int_0^T \lambda(t)^\top \frac{\partial f}{\partial \theta}(x(t), t, \theta) \, dt.
\]

This method, related to Pontryagin's maximum principle in optimal control, uses \( O(1) \) memory (independent of the number of time steps) at the cost of a second ODE solve.

## 6.5 Neural ODEs

**Neural ODEs** (Chen et al., 2018) parameterize the dynamics \( f \) by a neural network \( f_\theta \):

\[
\dot{h}(t) = f_\theta(h(t), t), \quad h(t_0) = h_0,
\]

and use the adjoint method to compute gradients through the ODE solver. This can be viewed as a continuous-depth limit of ResNets (\( h^{(\ell+1)} = h^{(\ell)} + f_\theta(h^{(\ell)}) \) corresponds to a forward Euler discretization). Neural ODEs offer adaptive computation (via ODE solver step-size control), reversible architectures (the flow is invertible), and a natural framework for continuous-time dynamics modeling. They form the backbone of continuous normalizing flows used in generative modeling.

---

# Chapter 7: Optimization for Machine Learning

## 7.1 Stochastic Gradient Descent

**Stochastic gradient descent (SGD)** replaces the full gradient \( \nabla \mathcal{L}(\theta) = \frac{1}{n}\sum_i \nabla \ell_i(\theta) \) with a mini-batch estimator

\[
g_t = \frac{1}{|B_t|} \sum_{i \in B_t} \nabla \ell_i(\theta_t),
\]

and updates \( \theta_{t+1} = \theta_t - \eta_t g_t \). The mini-batch gradient is an **unbiased estimator** of the full gradient. The stochasticity reduces per-iteration cost from \( O(n) \) to \( O(|B_t|) \), at the price of increased variance.

<div class="theorem">
<strong>Theorem (SGD Convergence, Convex Case).</strong> Suppose <em>ℓ</em> is convex and <em>L</em>-smooth with gradients bounded in norm by <em>G</em>. With step sizes <em>η_t = c/√t</em>,

\[ \mathbb{E}\left[\mathcal{L}\!\left(\frac{1}{T}\sum_{t=1}^T \theta_t\right)\right] - \mathcal{L}^* \leq \frac{G^2 c + \|\theta_0 - \theta^*\|^2/(2c)}{√T}. \]
</div>

For strongly convex functions, a geometrically decaying step size achieves a linear convergence rate. For non-convex objectives (as in deep learning), SGD converges to a critical point (where \( \|\nabla\mathcal{L}\|^2 \to 0 \) in expectation) at rate \( O(1/\sqrt{T}) \).

## 7.2 Variance Reduction

**SVRG** (Stochastic Variance Reduced Gradient, Johnson and Zhang, 2013) eliminates the \( O(1/\sqrt{T}) \) noise floor. Periodically (every \( m \) iterations) compute a full gradient \( \tilde{\nabla} = \frac{1}{n}\sum_i \nabla \ell_i(\tilde{\theta}) \) at a snapshot \( \tilde{\theta} \). The SVRG update uses a **variance-reduced gradient estimate**

\[
v_t = \nabla \ell_{i_t}(\theta_t) - \nabla \ell_{i_t}(\tilde{\theta}) + \tilde{\nabla},
\]

which has \( \mathbb{E}[v_t] = \nabla\mathcal{L}(\theta_t) \) and variance that tends to zero as \( \theta_t \to \theta^* \). For strongly convex smooth objectives, SVRG achieves **linear convergence** \( \mathcal{L}(\theta_T) - \mathcal{L}^* = O(\rho^T) \) with total gradient oracle complexity \( O((n + \kappa)\log(1/\epsilon)) \), a significant improvement over \( O(n\kappa/\varepsilon) \) for full gradient descent. **SAGA** uses a table of individual gradient values and achieves similar linear convergence without the synchronization cost of SVRG's snapshot.

## 7.3 Momentum Methods

**Heavy ball momentum** maintains a velocity \( v_t \) and updates

\[
v_{t+1} = \beta v_t - \eta \nabla \mathcal{L}(\theta_t), \quad \theta_{t+1} = \theta_t + v_{t+1}.
\]

Momentum damps oscillations along directions of high curvature and accelerates progress along directions of low curvature.

**Nesterov accelerated gradient** evaluates the gradient at the "look-ahead" point:

\[
\theta_{t+1} = y_t - \eta \nabla \mathcal{L}(y_t), \quad y_{t+1} = \theta_{t+1} + \frac{t}{t+3}(\theta_{t+1} - \theta_t),
\]

and achieves the optimal \( O(1/t^2) \) convergence rate for convex smooth objectives, matching the lower bound for first-order methods. The acceleration comes from a careful choice of the extrapolation coefficient that aligns with the eigenspectrum of the Hessian.

## 7.4 Adam Optimizer

**Adam** (Kingma and Ba, 2015) combines first- and second-moment estimates of the gradient to adaptively scale the learning rate for each parameter:

\[
m_t = \beta_1 m_{t-1} + (1-\beta_1) g_t, \quad v_t = \beta_2 v_{t-1} + (1-\beta_2) g_t^2,
\]

\[
\hat{m}_t = \frac{m_t}{1 - \beta_1^t}, \quad \hat{v}_t = \frac{v_t}{1-\beta_2^t}, \quad \theta_{t+1} = \theta_t - \frac{\eta}{\sqrt{\hat{v}_t} + \varepsilon} \hat{m}_t.
\]

The **bias correction** factors \( 1/(1-\beta_k^t) \) compensate for the initialization \( m_0 = v_0 = 0 \), which causes systematic underestimation in early iterations. With \( \beta_1 = 0.9 \), \( \beta_2 = 0.999 \), and \( \varepsilon = 10^{-8} \), Adam is robust to gradient scale and requires minimal tuning. Convergence guarantees for Adam on non-convex objectives remain an active research area; counterexamples exist for the convex case that motivate variants such as AMSGrad.

## 7.5 Implicit Regularization and the Neural Tangent Kernel

A fundamental puzzle in deep learning is that overparameterized models (with far more parameters than data points) generalize well despite achieving zero training error. One explanation is **implicit regularization**: SGD does not converge to an arbitrary minimizer of the training loss but to a specific one with low norm or high margin, depending on the architecture and initialization.

In the **infinite-width limit**, a neural network behaves as a kernel method. Fix the network architecture and let the widths \( d_1, \ldots, d_{L-1} \to \infty \). At random initialization, the network output is a Gaussian process. Upon infinitesimal gradient steps (gradient flow), the parameters move to first order in an RKHS whose kernel is the **Neural Tangent Kernel** (NTK):

\[
K_{\rm NTK}(x, x') = \left\langle \frac{\partial f_\theta(x)}{\partial \theta}, \frac{\partial f_\theta(x')}{\partial \theta} \right\rangle_{\ell^2}.
\]

The NTK remains approximately constant throughout training (kernel regime), and training dynamics are linear: the loss decays as \( \mathcal{L}(t) = \mathcal{L}(0)e^{-\lambda_{\min}(K_{\rm NTK})t} \), where \( \lambda_{\min} \) is the smallest eigenvalue of the kernel Gram matrix. The NTK provides a rigorous bridge between infinite-width networks and classical kernel methods, though practical networks are far from the infinite-width regime.

## 7.6 Saddle Points and Escaping Non-Convexity

For non-convex neural network losses, strict saddle points — where the Hessian has at least one strictly negative eigenvalue — are generically encountered. SGD with noise can escape strict saddle points: the stochastic gradient fluctuations excite the negative-curvature direction, causing escape at a rate related to the negative eigenvalue magnitude. Perturbed gradient descent provably escapes saddle points in polynomial time under smoothness and strict saddle conditions.

---

# Chapter 8: Diffusion Models and Generative Methods

## 8.1 Score-Based Models and Langevin Dynamics

Let \( p_{\rm data}(x) \) be an unknown distribution over \( \mathbb{R}^d \). The **score function** is \( \nabla_x \log p_{\rm data}(x) \). If the score were available, **Langevin dynamics** could sample from \( p_{\rm data} \) via the stochastic differential equation

\[
dx_t = \frac{1}{2} \nabla_x \log p_{\rm data}(x_t) \, dt + dW_t,
\]

whose stationary distribution is \( p_{\rm data} \) (by the Fokker-Planck equation). **Score matching** (Hyvärinen, 2005) fits a neural network \( s_\theta(x) \approx \nabla_x \log p_{\rm data}(x) \) by minimizing

\[
\mathcal{J}(\theta) = \mathbb{E}_{p_{\rm data}}\!\left[\frac{1}{2}\|s_\theta(x)\|_2^2 + \nabla_x \cdot s_\theta(x)\right],
\]

where the divergence \( \nabla_x \cdot s_\theta \) is a trace of the Jacobian, computed efficiently by Hutchinson's estimator. After fitting \( s_\theta \), new samples are generated by running discretized Langevin dynamics.

## 8.2 Denoising Diffusion Probabilistic Models

**DDPM** (Ho, Jain and Abbeel, 2020) defines a forward noising process and a learned reverse denoising process.

**Forward process:** Given a clean sample \( x_0 \sim q(x_0) \), define a Markov chain

\[
q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{1-\beta_t}\, x_{t-1}, \beta_t I),
\]

for a fixed variance schedule \( \beta_1, \ldots, \beta_T \). Defining \( \alpha_t = 1 - \beta_t \) and \( \bar{\alpha}_t = \prod_{s=1}^t \alpha_s \), the marginal at time \( t \) has the closed form

\[
q(x_t | x_0) = \mathcal{N}\!\left(x_t; \sqrt{\bar{\alpha}_t}\, x_0, (1-\bar{\alpha}_t) I\right).
\]

For large \( T \), \( \bar{\alpha}_T \approx 0 \) and \( x_T \approx \mathcal{N}(0, I) \). This **reparameterization** allows sampling at any noise level without iterating: \( x_t = \sqrt{\bar{\alpha}_t} x_0 + \sqrt{1-\bar{\alpha}_t}\, \varepsilon \) where \( \varepsilon \sim \mathcal{N}(0, I) \).

**Reverse process:** The true reverse \( q(x_{t-1}|x_t) \) is intractable. Instead, a neural network \( p_\theta(x_{t-1}|x_t) = \mathcal{N}(x_{t-1}; \mu_\theta(x_t,t), \Sigma_\theta(x_t,t)) \) is learned. Conditioned on \( x_0 \), the reverse posterior has the closed form

\[
q(x_{t-1}|x_t, x_0) = \mathcal{N}\!\left(x_{t-1}; \tilde{\mu}_t(x_t, x_0), \tilde{\beta}_t I\right),
\]

\[
\tilde{\mu}_t(x_t, x_0) = \frac{\sqrt{\bar{\alpha}_{t-1}}\beta_t}{1-\bar{\alpha}_t} x_0 + \frac{\sqrt{\alpha_t}(1-\bar{\alpha}_{t-1})}{1-\bar{\alpha}_t} x_t, \quad \tilde{\beta}_t = \frac{(1-\bar{\alpha}_{t-1})\beta_t}{1-\bar{\alpha}_t}.
\]

**Training objective (ELBO):** The evidence lower bound on \( \log p_\theta(x_0) \) decomposes as

\[
\mathcal{L} = \mathbb{E}_q\!\left[-\log p_\theta(x_0|x_1) + \sum_{t=2}^T D_{\rm KL}(q(x_{t-1}|x_t,x_0) \| p_\theta(x_{t-1}|x_t)) + D_{\rm KL}(q(x_T|x_0)\|p(x_T))\right].
\]

The KL terms between Gaussians have closed forms. DDPM trains a noise prediction network \( \varepsilon_\theta(x_t, t) \) to predict the noise \( \varepsilon \) added in the forward process, using the simplified objective

\[
\mathcal{L}_{\rm simple} = \mathbb{E}_{t, x_0, \varepsilon}\!\left[\|\varepsilon - \varepsilon_\theta(\sqrt{\bar{\alpha}_t} x_0 + \sqrt{1-\bar{\alpha}_t}\varepsilon, t)\|_2^2\right].
\]

**Sampling** is performed by iterating the reverse step from \( x_T \sim \mathcal{N}(0,I) \):

\[
x_{t-1} = \frac{1}{\sqrt{\alpha_t}}\!\left(x_t - \frac{1-\alpha_t}{\sqrt{1-\bar{\alpha}_t}} \varepsilon_\theta(x_t, t)\right) + \sqrt{\tilde{\beta}_t}\, z, \quad z \sim \mathcal{N}(0,I).
\]

## 8.3 Connection to Score Matching and SDEs

Song et al. (2020) unified score-based and diffusion models via SDEs. The forward process is described by an SDE

\[
dx = f(x,t)\, dt + g(t)\, dW_t,
\]

and the reverse-time SDE (Anderson, 1982) is

\[
dx = \left[f(x,t) - g(t)^2 \nabla_x \log p_t(x)\right] dt + g(t)\, d\bar{W}_t,
\]

where \( p_t \) is the marginal density at time \( t \) and \( \bar{W}_t \) is a reverse-time Brownian motion. The score function \( \nabla_x \log p_t(x) \) is estimated by a time-conditioned neural network trained via **denoising score matching**:

\[
\mathcal{J}(\theta) = \mathbb{E}_{t, x_0, x_t}\!\left[\left\|s_\theta(x_t, t) - \nabla_{x_t} \log q(x_t|x_0)\right\|_2^2\right] = \mathbb{E}_{t,x_0,\varepsilon}\!\left[\left\|s_\theta(x_t,t) + \frac{\varepsilon}{\sqrt{1-\bar{\alpha}_t}}\right\|_2^2\right].
\]

This SDE viewpoint unifies DDPM (discrete VP-SDE), score matching, and enables higher-order ODE sampling via the probability flow ODE associated with the reverse SDE.

---

# Chapter 9: Low-Rank and Tensor Methods

## 9.1 Low-Rank Matrix Approximation

The **Eckart-Young-Mirsky theorem** is the fundamental result in low-rank approximation.

<div class="theorem">
<strong>Theorem (Eckart-Young, 1936).</strong> Let <em>A ∈ ℝ^{m×n}</em> with SVD <em>A = UΣV^T</em> and let <em>A_k = U_k Σ_k V_k^T</em> be the truncated SVD retaining the <em>k</em> largest singular values. Then for both the Frobenius and spectral norms,

\[ \|A - A_k\|_F = \min_{\mathrm{rank}(B) \leq k} \|A - B\|_F = \sqrt{\sum_{j > k} \sigma_j^2}, \]

\[ \|A - A_k\|_2 = \min_{\mathrm{rank}(B) \leq k} \|A - B\|_2 = \sigma_{k+1}. \]
</div>

The theorem says that the truncated SVD is simultaneously the best rank-\( k \) approximation in both norms — a remarkable property not shared by most other matrix approximations. The Frobenius-norm best approximation is unique when \( \sigma_k > \sigma_{k+1} \) (generic case).

## 9.2 CUR Decomposition

The **CUR decomposition** approximates \( A \approx CUR \) where \( C \) consists of actual columns of \( A \), \( R \) consists of actual rows, and \( U \) is a small matrix chosen to minimize approximation error. Unlike the SVD, CUR preserves sparsity and interpretability of the original data matrix since \( C \) and \( R \) are submatrices of \( A \). The optimal \( U = C^\dagger A R^\dagger \) (using pseudoinverses) achieves the best approximation given the selected columns and rows. Column and row selection can be performed by leverage-score sampling: column \( j \) is selected with probability proportional to \( \|v_j^{(k)}\|_2^2 \) where \( V_k \) is the right singular matrix of the rank-\( k \) SVD, ensuring that columns spanning the approximate column space are preferentially sampled.

## 9.3 Tensor Decompositions

A tensor \( \mathcal{A} \in \mathbb{R}^{n_1 \times n_2 \times \cdots \times n_d} \) generalizes a matrix to \( d \) modes. The dominant tensor decompositions are:

**CP (CANDECOMP/PARAFAC) decomposition:** Expresses the tensor as a sum of rank-one tensors

\[
\mathcal{A} \approx \sum_{r=1}^R a_r^{(1)} \otimes a_r^{(2)} \otimes \cdots \otimes a_r^{(d)},
\]

where \( a_r^{(k)} \in \mathbb{R}^{n_k} \) are factor vectors and \( R \) is the CP rank. CP decomposition is the natural generalization of matrix rank. It is fitted by alternating least squares (ALS): fix all factors but one and solve the resulting least squares problem, then cycle.

**Tucker decomposition:** Generalizes the matrix SVD to a **core tensor** \( \mathcal{G} \in \mathbb{R}^{r_1 \times \cdots \times r_d} \) and orthogonal factor matrices \( U^{(k)} \in \mathbb{R}^{n_k \times r_k} \):

\[
\mathcal{A} \approx \mathcal{G} \times_1 U^{(1)} \times_2 U^{(2)} \cdots \times_d U^{(d)},
\]

where \( \times_k \) denotes the mode-\( k \) product. The **Higher-Order SVD (HOSVD)** computes \( U^{(k)} \) as the left singular vectors of the mode-\( k \) unfolding \( A_{(k)} \in \mathbb{R}^{n_k \times \prod_{j \neq k} n_j} \).

## 9.4 Tensor Train Format

The **tensor train (TT) decomposition**, also called matrix product state (MPS) in quantum physics, represents \( \mathcal{A} \) as a contraction of low-rank tensors (cores):

\[
\mathcal{A}(i_1, i_2, \ldots, i_d) = G^{(1)}_{i_1} G^{(2)}_{i_2} \cdots G^{(d)}_{i_d},
\]

where each core \( G^{(k)} \in \mathbb{R}^{r_{k-1} \times n_k \times r_k} \) is a 3-tensor and the product denotes contraction of the bond indices \( r_k \) (with \( r_0 = r_d = 1 \)). The storage cost is \( O(dnr^2) \) rather than \( O(n^d) \), an exponential reduction for large \( d \). The TT ranks \( r_k \) govern the compression ratio.

**TT-SVD algorithm:** Given a full tensor \( \mathcal{A} \), compute the TT decomposition by sequentially reshaping and taking truncated SVDs. Unfold mode 1: \( A_{(1)} \in \mathbb{R}^{n_1 \times n_2 n_3 \cdots n_d} \), take truncated SVD to obtain core \( G^{(1)} \in \mathbb{R}^{1 \times n_1 \times r_1} \) and residual \( R_1 \in \mathbb{R}^{r_1 \times n_2 n_3 \cdots n_d} \). Reshape \( R_1 \) as \( \mathbb{R}^{r_1 n_2 \times n_3 \cdots n_d} \), take truncated SVD to obtain \( G^{(2)} \) and \( R_2 \). Continue until all cores are extracted. The procedure is stable and the approximation error is bounded by the sum of discarded singular values across all steps.

## 9.5 Applications in Compression and Quantum Many-Body Physics

**Data compression:** Large weight tensors in neural networks can be approximated by TT decompositions, reducing parameter counts by orders of magnitude with controlled accuracy loss — an approach called **tensor network compression**. This enables deployment of large models on memory-constrained hardware.

**Quantum many-body physics:** Many-body quantum states \( |\psi\rangle \in (\mathbb{C}^2)^{\otimes n} \) are naturally described as tensors of dimension \( 2^n \). Physically relevant states (ground states of gapped local Hamiltonians in one dimension) satisfy an **area law**: the entanglement entropy between any contiguous subsystem and its complement is bounded, implying that the state can be efficiently represented by an MPS with bounded bond dimension \( r \). The density matrix renormalization group (DMRG) algorithm, the most powerful method for 1D quantum systems, can be interpreted as alternating least squares optimization over the MPS manifold.

**Tensor decompositions in signal processing and data analysis:** Tucker and CP decompositions are used in chemometrics (fluorescence spectroscopy data are naturally trilinear), video analysis (space-time-color data), and recommendation systems with multi-relational data (user-item-context tensors). The non-uniqueness of Tucker decomposition (under rotations of factor matrices) is remedied in CP by uniqueness conditions (Kruskal's theorem) that hold generically when the sum of component k-ranks exceeds \( 2R \) for each mode.

---

# Appendix: Mathematical Prerequisites

## A.1 Sub-Gaussian Random Variables

A zero-mean random variable \( X \) is **sub-Gaussian** with parameter \( \sigma^2 \) if its moment generating function satisfies \( \mathbb{E}[e^{tX}] \leq e^{t^2\sigma^2/2} \) for all \( t \in \mathbb{R} \). Gaussian variables \( N(0,\sigma^2) \) and bounded variables \( |X| \leq M \) (with \( \sigma^2 = M^2 \)) are both sub-Gaussian. The **Hoeffding-type concentration inequality** states that for independent sub-Gaussian variables \( X_1, \ldots, X_n \) with parameters \( \sigma_i^2 \),

\[
P\!\left(\left|\frac{1}{n}\sum_{i=1}^n X_i\right| \geq t\right) \leq 2\exp\!\left(-\frac{nt^2}{2\sigma^2}\right), \quad \sigma^2 = \frac{1}{n}\sum_i \sigma_i^2.
\]

Sub-Gaussian concentration is the key technical tool underlying the RIP proof for Gaussian matrices, the Johnson-Lindenstrauss lemma, and convergence analyses of stochastic optimization.

## A.2 Operator Norms and Matrix Inequalities

For a matrix \( A \in \mathbb{R}^{m \times n} \), the **spectral norm** \( \|A\|_2 = \sigma_{\max}(A) \), the **Frobenius norm** \( \|A\|_F = (\sum_{ij} a_{ij}^2)^{1/2} = (\sum_i \sigma_i^2)^{1/2} \), and the **nuclear norm** \( \|A\|_* = \sum_i \sigma_i \). These satisfy

\[
\|A\|_2 \leq \|A\|_F \leq \sqrt{r} \|A\|_2, \quad \|A\|_F \leq \|A\|_* \leq \sqrt{r}\|A\|_F,
\]

where \( r = \mathrm{rank}(A) \). The nuclear norm is the convex envelope of the rank function on the spectral-norm unit ball and plays the role of \( \ell^1 \) norm for matrix recovery (analogous to LASSO for vectors).

## A.3 Proximal Calculus

The proximal operator is foundational to modern non-smooth optimization. Key examples:

- **\( \ell^1 \) norm:** \( \mathrm{prox}_{\lambda\|\cdot\|_1}(v)_i = \mathcal{S}_\lambda(v_i) = \mathrm{sign}(v_i)\max(|v_i|-\lambda,0) \) (soft thresholding).
- **Nuclear norm:** \( \mathrm{prox}_{\lambda\|\cdot\|_*}(A) = U \mathcal{S}_\lambda(\Sigma) V^\top \) (singular value soft thresholding).
- **Indicator function \( \iota_C \) of convex set \( C \):** \( \mathrm{prox}_{\iota_C}(v) = \Pi_C(v) \) (Euclidean projection onto \( C \)).

The **Moreau decomposition** states \( v = \mathrm{prox}_{\gamma f}(v) + \gamma \mathrm{prox}_{f^*/\gamma}(v/\gamma) \) for any proper closed convex \( f \), where \( f^* \) is the Fenchel conjugate. This duality between proximal operators of conjugate functions is the basis of primal-dual splitting methods.
