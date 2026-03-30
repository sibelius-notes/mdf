---
title: "AMATH 345: Data-Driven Mathematical Models"
prof: "Roberto Guglielmi"
subjects: "AMATH"
---

## Sources and References

**Primary textbook**
- S. L. Brunton and J. N. Kutz, *Data-Driven Science and Engineering: Machine Learning, Dynamical Systems, and Control*, 2nd ed. (Cambridge University Press, 2022)

**Supplementary texts**
- G. Strang, *Linear Algebra and Learning from Data* (Wellesley-Cambridge Press, 2019)
- S. Foucart and H. Rauhut, *A Mathematical Introduction to Compressive Sensing* (Springer, 2013)
- D. M. Bates and D. G. Watts, *Nonlinear Regression Analysis and Its Applications* (Wiley, 1988)

**Online resources**
- MIT OpenCourseWare 18.065 *Matrix Methods in Data Analysis, Signal Processing, and Machine Learning* (Gilbert Strang) — ocw.mit.edu
- S. Brunton's YouTube channel and lecture notes — databookuw.com

---

# Chapter 1: Mathematical Models and Dynamical Systems

## Section 1.1: The Role of Mathematical Models

A **mathematical model** is a set of equations that describes the evolution of a physical, biological, or engineered system. Models serve different purposes:
- **Mechanistic (white-box) models**: derived from first principles (Newton's laws, conservation laws). Interpretable but require prior knowledge of the governing physics.
- **Data-driven (black-box) models**: learned from observations. Applicable when first principles are unknown but can be opaque.
- **Gray-box models**: hybrid — mechanistic structure with data-calibrated parameters.

AMATH 345 focuses on methods that extract useful models from data, either by fitting parameters to known structures or by identifying structure directly from measurements.

## Section 1.2: Dynamical Systems

A **continuous dynamical system** is specified by a vector field \(\mathbf{f}\):

\[
\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}, t; \boldsymbol{\theta}), \qquad \mathbf{x}(0) = \mathbf{x}_0,
\]

where \(\mathbf{x}(t) \in \mathbb{R}^n\) is the state, \(t\) is time, and \(\boldsymbol{\theta}\) are parameters. A **discrete dynamical system** has the form \(\mathbf{x}_{k+1} = \mathbf{F}(\mathbf{x}_k)\).

Key concepts:
- **Fixed point** (equilibrium): \(\mathbf{f}(\mathbf{x}^*, t) = 0\). Stability is determined by the eigenvalues of the Jacobian \(D\mathbf{f}(\mathbf{x}^*)\).
- **Attractor**: a set toward which trajectories converge.
- **Limit cycle**: a periodic orbit that is an attractor.
- **Chaos**: sensitive dependence on initial conditions, dense periodic orbits, topological mixing.

## Section 1.3: Numerical Methods for ODEs

Standard solvers discretize time and integrate step by step:

- **Forward Euler**: \(\mathbf{x}_{k+1} = \mathbf{x}_k + h\, \mathbf{f}(\mathbf{x}_k)\). First-order accurate, conditionally stable.
- **Runge-Kutta 4 (RK4)**: fourth-order accurate; standard workhorse. Requires four function evaluations per step.
- **Implicit methods**: required for **stiff systems** — systems where the time scales of different components differ by orders of magnitude (e.g., chemical kinetics).

The choice of solver affects the quality of data generated for downstream data-driven analysis.

## Section 1.4: Optimization in Vector Spaces

Data-driven methods typically involve minimizing a cost function. The general form:

\[
\min_{\boldsymbol{\theta}} \mathcal{L}(\boldsymbol{\theta}) = \frac{1}{N}\sum_{i=1}^N \ell(y_i, f(\mathbf{x}_i; \boldsymbol{\theta})) + \lambda\, R(\boldsymbol{\theta}),
\]

where \(\ell\) is a loss function, \(f\) is the model, and \(R\) is a regularizer. Key results:
- **Convexity**: A function \(\mathcal{L}\) is convex if \(\mathcal{L}(\alpha \mathbf{u} + (1-\alpha)\mathbf{v}) \leq \alpha \mathcal{L}(\mathbf{u}) + (1-\alpha)\mathcal{L}(\mathbf{v})\). Convex optimization problems have no local minima that are not global.
- **Gradient descent**: \(\boldsymbol{\theta}_{k+1} = \boldsymbol{\theta}_k - \eta \nabla \mathcal{L}(\boldsymbol{\theta}_k)\). Converges to global minimum for convex \(\mathcal{L}\); gets stuck in local minima for non-convex problems.

---

# Chapter 2: Singular Value Decomposition and QR Decomposition

## Section 2.1: The Singular Value Decomposition

<div class="theorem">
<strong>Singular Value Decomposition (SVD).</strong> Every matrix \(A \in \mathbb{R}^{m \times n}\) (with \(m \geq n\)) can be factored as
\[
A = U \Sigma V^T,
\]
where \(U \in \mathbb{R}^{m \times m}\) and \(V \in \mathbb{R}^{n \times n}\) are orthogonal matrices (\(U^T U = I\), \(V^T V = I\)), and \(\Sigma \in \mathbb{R}^{m \times n}\) is diagonal with non-negative entries \(\sigma_1 \geq \sigma_2 \geq \cdots \geq \sigma_n \geq 0\) called the <strong>singular values</strong>.
</div>

The columns of \(U\) are the **left singular vectors** (orthonormal basis for column space); the columns of \(V\) are the **right singular vectors** (orthonormal basis for row space).

### Geometric Interpretation

The SVD says every linear map decomposes into three operations:
1. Rotate the input (\(V^T\): rotation in domain)
2. Stretch (scale by \(\sigma_i\) along each axis)
3. Rotate the output (\(U\): rotation in codomain)

The singular values measure how much the matrix "stretches" in each direction. The rank of \(A\) equals the number of nonzero singular values.

### Reduced SVD and Best Rank-\(r\) Approximation

The **reduced (thin) SVD** keeps only the \(r = \mathrm{rank}(A)\) nonzero singular values:

\[
A = \sum_{i=1}^r \sigma_i \mathbf{u}_i \mathbf{v}_i^T.
\]

<div class="theorem">
<strong>Eckart-Young Theorem.</strong> The best rank-\(r\) approximation to \(A\) in both the Frobenius norm and the spectral norm is
\[
A_r = \sum_{i=1}^r \sigma_i \mathbf{u}_i \mathbf{v}_i^T = U_r \Sigma_r V_r^T.
\]
The approximation error is \(\|A - A_r\|_F^2 = \sum_{i=r+1}^n \sigma_i^2\).
</div>

This is the mathematical foundation of **dimensionality reduction**: if the singular values drop off rapidly, a low-rank approximation captures most of the variance in the data.

### Principal Component Analysis (PCA)

PCA is the SVD applied to a data matrix \(X \in \mathbb{R}^{n \times p}\) (n observations, p features, columns mean-centered). The SVD \(X = U\Sigma V^T\) gives:
- **Principal components**: the columns of \(V\) (directions of maximum variance in feature space).
- **Scores**: the columns of \(U\Sigma\) (coordinates of observations in the PC space).
- **Variance explained by PC \(k\)**: \(\sigma_k^2 / \sum_i \sigma_i^2\).

PCA reduces noise, reveals dominant patterns, and enables visualization of high-dimensional data.

## Section 2.2: QR Decomposition

<div class="theorem">
<strong>QR Decomposition.</strong> Every matrix \(A \in \mathbb{R}^{m \times n}\) (with \(m \geq n\)) can be factored as \(A = QR\), where \(Q \in \mathbb{R}^{m \times n}\) has orthonormal columns (\(Q^T Q = I_n\)) and \(R \in \mathbb{R}^{n \times n}\) is upper triangular with positive diagonal entries.
</div>

The QR decomposition is computed by **Gram-Schmidt orthogonalization** or (numerically more stable) **Householder reflections**.

### Application: Solving Least-Squares Problems

The QR decomposition is the primary tool for solving least-squares problems. Given \(A = QR\), the least-squares solution \(\hat{\mathbf{x}} = (A^T A)^{-1} A^T \mathbf{b}\) is equivalent to solving \(R\hat{\mathbf{x}} = Q^T \mathbf{b}\) — a triangular system solved by back-substitution.

## Section 2.3: The Pseudo-Inverse and Least Squares

The **Moore-Penrose pseudo-inverse** of \(A\) is defined via the SVD:

\[
A^+ = V \Sigma^+ U^T,
\]

where \(\Sigma^+\) replaces each nonzero singular value \(\sigma_i\) by \(1/\sigma_i\). The least-squares solution is \(\hat{\mathbf{x}} = A^+ \mathbf{b}\), which minimizes \(\|A\mathbf{x} - \mathbf{b}\|_2\) and has minimum norm among all minimizers.

---

# Chapter 3: Sparsity and Compressed Sensing

## Section 3.1: Sparsity

A vector \(\mathbf{x} \in \mathbb{R}^n\) is **\(k\)-sparse** if at most \(k\) of its entries are nonzero: \(\|\mathbf{x}\|_0 \leq k\), where \(\|\mathbf{x}\|_0 = |\{i : x_i \neq 0\}|\).

Sparsity is ubiquitous: natural images are sparse in the wavelet domain; neural signals are sparse in time; physical laws expressed in a dictionary of basis functions are often sparse.

<div class="remark">
<strong>Sparsity and compression.</strong> JPEG compression stores images in the Discrete Cosine Transform (DCT) domain and discards small coefficients. This is lossy compression exploiting the fact that natural images are approximately sparse in the frequency domain.
</div>

## Section 3.2: Compressed Sensing

**Compressed sensing** (Candès, Romberg, Tao; Donoho, 2006) shows that sparse signals can be exactly recovered from far fewer measurements than the Nyquist rate implies.

**Setup**: We observe \(\mathbf{y} = \Phi \mathbf{x}\) where \(\Phi \in \mathbb{R}^{m \times n}\) is a measurement matrix with \(m \ll n\) (fewer measurements than unknowns). If \(\mathbf{x}\) is \(k\)-sparse, can we recover \(\mathbf{x}\) from \(\mathbf{y}\)?

**Naive approach**: minimize \(\|\mathbf{x}\|_0\) subject to \(\Phi\mathbf{x} = \mathbf{y}\). This is NP-hard (combinatorial search).

**Key insight**: Under a condition on \(\Phi\) called the **Restricted Isometry Property (RIP)**, the \(\ell_0\) problem is equivalent to the convex \(\ell_1\) minimization problem:

\[
\hat{\mathbf{x}} = \arg\min_{\mathbf{x}} \|\mathbf{x}\|_1 \quad \text{subject to} \quad \Phi\mathbf{x} = \mathbf{y}.
\]

<div class="definition">
<strong>Restricted Isometry Property (RIP).</strong> A matrix \(\Phi\) satisfies the RIP of order \(k\) with constant \(\delta_k \in (0,1)\) if for all \(k\)-sparse vectors \(\mathbf{x}\):
\[
(1 - \delta_k)\|\mathbf{x}\|_2^2 \leq \|\Phi\mathbf{x}\|_2^2 \leq (1 + \delta_k)\|\mathbf{x}\|_2^2.
\]
</div>

Random Gaussian and Bernoulli matrices satisfy the RIP with high probability for \(m = O(k \log(n/k))\) — much less than the \(m = n\) required classically.

### LASSO and Sparse Recovery

The **LASSO** (Least Absolute Shrinkage and Selection Operator) adds \(\ell_1\) regularization to ordinary least-squares:

\[
\hat{\boldsymbol{\beta}} = \arg\min_{\boldsymbol{\beta}} \frac{1}{2}\|A\boldsymbol{\beta} - \mathbf{b}\|_2^2 + \lambda\|\boldsymbol{\beta}\|_1.
\]

The \(\ell_1\) penalty promotes sparsity: at the solution, many coefficients are exactly zero. This is in contrast to \(\ell_2\) regularization (ridge regression) which shrinks coefficients toward zero but never sets them exactly to zero.

**Intuition**: The \(\ell_1\) ball is a polytope with corners on the coordinate axes; the constrained minimum tends to occur at a corner, where many components are zero.

---

# Chapter 4: Model Calibration and Parameter Inference for Dynamical Systems

## Section 4.1: Linear Regression and Model Selection

**Linear regression** fits a model \(y = \mathbf{x}^T \boldsymbol{\beta} + \varepsilon\) to data \(\{(\mathbf{x}_i, y_i)\}_{i=1}^N\). In matrix form \(\mathbf{y} = X\boldsymbol{\beta} + \boldsymbol{\varepsilon}\), the ordinary least-squares (OLS) estimator is:

\[
\hat{\boldsymbol{\beta}} = (X^T X)^{-1} X^T \mathbf{y} = X^+ \mathbf{y}.
\]

Under the Gauss-Markov conditions (\(\mathbb{E}[\boldsymbol{\varepsilon}] = 0\), \(\mathrm{Var}(\boldsymbol{\varepsilon}) = \sigma^2 I\)), OLS is the Best Linear Unbiased Estimator (BLUE).

**Model selection** criteria trade goodness-of-fit against model complexity:
- **AIC** (Akaike): \(-2\ell + 2k\), where \(\ell\) is the log-likelihood and \(k\) the number of parameters.
- **BIC** (Bayes): \(-2\ell + k\log N\). Penalizes complexity more heavily for large \(N\).
- **Cross-validation**: hold out data to estimate prediction error directly.

## Section 4.2: Nonlinear Regression and Gradient Descent

For models \(y = f(\mathbf{x}; \boldsymbol{\theta})\) nonlinear in \(\boldsymbol{\theta}\), we minimize the residual sum of squares:

\[
\mathcal{L}(\boldsymbol{\theta}) = \frac{1}{2}\sum_{i=1}^N [y_i - f(\mathbf{x}_i; \boldsymbol{\theta})]^2.
\]

**Gradient descent**: \(\boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} - \eta \nabla_{\boldsymbol{\theta}} \mathcal{L}(\boldsymbol{\theta}^{(k)})\).

**Newton's method**: \(\boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} - [\nabla^2 \mathcal{L}]^{-1} \nabla \mathcal{L}\). Converges quadratically near the minimum but requires computing the Hessian.

**Gauss-Newton / Levenberg-Marquardt**: Practical methods for nonlinear least-squares that approximate the Hessian using the Jacobian.

## Section 4.3: Curve Fitting for ODE Models

To infer parameters of an ODE model \(\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}; \boldsymbol{\theta})\) from time-series data, minimize the mismatch between simulated and observed trajectories:

\[
\hat{\boldsymbol{\theta}} = \arg\min_{\boldsymbol{\theta}} \sum_{k} \|\mathbf{x}^{\text{obs}}(t_k) - \mathbf{x}^{\text{sim}}(t_k; \boldsymbol{\theta})\|^2.
\]

Practical challenges:
- **Local minima**: gradient descent may converge to non-physical solutions; global optimization methods (differential evolution, basin hopping) are sometimes needed.
- **Identifiability**: multiple parameter vectors may fit the data equally well. A model is **structurally identifiable** if, in principle, parameters are uniquely determined by noise-free data.
- **Sensitivity**: parameters with small gradients are **practical non-identifiable** from noisy data.

## Section 4.4: Uncertainty Analysis

**Bootstrapping**: resample data with replacement to generate many pseudo-datasets; fit the model to each; the distribution of estimates gives uncertainty intervals.

**Bayesian inference**: treat \(\boldsymbol{\theta}\) as a random variable with prior \(p(\boldsymbol{\theta})\); update to posterior \(p(\boldsymbol{\theta}|\mathbf{y}) \propto p(\mathbf{y}|\boldsymbol{\theta}) p(\boldsymbol{\theta})\) via Bayes' theorem. **MCMC** methods (Metropolis-Hastings, Hamiltonian Monte Carlo) sample the posterior.

---

# Chapter 5: Neural Networks and Deep Learning for Dynamical Systems

## Section 5.1: Multi-Layer Neural Networks

A **feedforward neural network** with \(L\) layers computes:

\[
\mathbf{h}^{(0)} = \mathbf{x}, \quad \mathbf{h}^{(\ell)} = \sigma\!\left(W^{(\ell)} \mathbf{h}^{(\ell-1)} + \mathbf{b}^{(\ell)}\right), \quad \hat{y} = \mathbf{h}^{(L)},
\]

where \(W^{(\ell)}\) are weight matrices, \(\mathbf{b}^{(\ell)}\) are bias vectors, and \(\sigma\) is a nonlinear **activation function** applied elementwise.

Common activation functions:

| Activation | Formula | Properties |
|---|---|---|
| **ReLU** | \(\max(0, x)\) | Sparse, no vanishing gradient for \(x>0\), not differentiable at 0 |
| **Sigmoid** | \(1/(1+e^{-x})\) | Output in \((0,1)\), vanishing gradient for large \(|x|\) |
| **Tanh** | \((e^x - e^{-x})/(e^x + e^{-x})\) | Output in \((-1,1)\), zero-centered |
| **GELU** | \(x\,\Phi(x)\) | Smooth approximation to ReLU, used in transformers |

<div class="theorem">
<strong>Universal Approximation Theorem.</strong> A feedforward neural network with one hidden layer and a continuous non-polynomial activation function can approximate any continuous function on a compact set to arbitrary precision, given sufficiently many hidden units.
</div>

## Section 5.2: The Backpropagation Algorithm

Training a neural network requires computing \(\nabla_\theta \mathcal{L}\) — the gradient of the loss with respect to all network parameters. **Backpropagation** is an efficient algorithm that applies the chain rule layer-by-layer backward through the network.

For the loss \(\mathcal{L}\) and parameters \(W^{(\ell)}\):

\[
\delta^{(L)} = \nabla_{\mathbf{h}^{(L)}} \mathcal{L} \odot \sigma'(\mathbf{z}^{(L)}), \quad \delta^{(\ell)} = \left(W^{(\ell+1)}\right)^T \delta^{(\ell+1)} \odot \sigma'(\mathbf{z}^{(\ell)}),
\]

\[
\nabla_{W^{(\ell)}} \mathcal{L} = \delta^{(\ell)} (\mathbf{h}^{(\ell-1)})^T.
\]

The computational cost of backpropagation is \(O(|\theta|)\) — proportional to the number of parameters — the same cost as a forward pass.

## Section 5.3: Stochastic Gradient Descent and Variants

**Stochastic Gradient Descent (SGD)**: estimate the gradient using a random mini-batch of size \(B \ll N\):

\[
\boldsymbol{\theta} \leftarrow \boldsymbol{\theta} - \frac{\eta}{B} \sum_{i \in \mathcal{B}} \nabla_\theta \ell(y_i, f(\mathbf{x}_i; \boldsymbol{\theta})).
\]

SGD adds noise to the gradient, which helps escape local minima in non-convex landscapes. Modern optimizers (Adam, AdaGrad, RMSProp) adapt the learning rate per parameter using gradient history.

## Section 5.4: Convolutional Neural Networks (CNNs)

CNNs exploit **translational invariance** in spatial data (images, time series). A convolutional layer applies a shared filter (kernel) across all positions:

\[
(K * I)[m,n] = \sum_{k,l} K[k,l]\, I[m-k, n-l].
\]

CNNs drastically reduce the number of parameters compared to fully connected layers and are the dominant architecture for image analysis.

## Section 5.5: Neural Networks for Dynamical Systems

**Neural ODEs** (Chen et al., 2018): parameterize the right-hand side of an ODE with a neural network:

\[
\dot{\mathbf{x}} = f_\theta(\mathbf{x}, t), \qquad f_\theta \text{ is a neural network.}
\]

The ODE is integrated numerically; backpropagation through the solver uses the **adjoint sensitivity method** to compute gradients without storing intermediate states.

Neural ODEs enable learning continuous-time dynamics from irregularly-sampled data and provide an interpretable continuous-time model.

---

# Chapter 6: Data-Driven Methods for Dynamical Systems

## Section 6.1: Dynamic Mode Decomposition (DMD)

**Dynamic Mode Decomposition** (Schmid, 2010; Kutz et al., 2016) extracts the dominant spatiotemporal patterns in time-series data by fitting a linear model to the data.

**Setup**: Given snapshot data \(X = [\mathbf{x}_1, \ldots, \mathbf{x}_{N-1}]\) and \(X' = [\mathbf{x}_2, \ldots, \mathbf{x}_N]\), find the best-fit linear operator \(A\) such that:

\[
X' \approx A X.
\]

**Algorithm**:
1. Compute the SVD: \(X = U\Sigma V^T\).
2. Truncate to rank \(r\): \(X \approx U_r \Sigma_r V_r^T\).
3. Compute the reduced operator: \(\tilde{A} = U_r^T A U_r = U_r^T X' V_r \Sigma_r^{-1}\).
4. Compute eigendecomposition: \(\tilde{A} W = W \Lambda\).
5. **DMD modes**: \(\Phi = X' V_r \Sigma_r^{-1} W\) (columns are DMD modes).
6. **DMD eigenvalues**: \(\lambda_k\) give the time evolution — continuous-time frequencies are \(\omega_k = \log(\lambda_k)/\Delta t\).

The data reconstructed as: \(\mathbf{x}(t) \approx \sum_k b_k \phi_k e^{\omega_k t}\), where \(b_k\) are determined by initial conditions.

DMD is widely used in fluid mechanics, climate science, and video processing.

## Section 6.2: Sparse Identification of Nonlinear Dynamics (SINDy)

**SINDy** (Brunton, Proctor, Kutz, 2016) identifies sparse governing equations from data. The key insight: the equations of motion for most physical systems can be expressed as sparse linear combinations of a library of candidate functions.

**Algorithm**:
1. Collect state data \(X \in \mathbb{R}^{m \times n}\) (m time points, n state variables).
2. Compute (or estimate) the time derivatives \(\dot{X}\).
3. Build a **library of candidate functions**: \(\Theta(X) = [1,\ X,\ X^2,\ X \cdot X,\ \sin(X),\ \ldots] \in \mathbb{R}^{m \times p}\).
4. Solve the sparse regression problem:
\[
\dot{X} \approx \Theta(X)\, \Xi, \quad \text{minimize } \|\dot{X} - \Theta(X)\Xi\|_F \text{ subject to sparsity on } \Xi.
\]
5. Each nonzero row of \(\Xi\) corresponds to an active term in the equations.

<div class="example">
<strong>Lorenz system.</strong> Data from the chaotic Lorenz system \(\dot{x} = \sigma(y-x)\), \(\dot{y} = x(\rho - z) - y\), \(\dot{z} = xy - \beta z\) is fed to SINDy with a polynomial library. The algorithm correctly recovers the sparse governing equations, identifying only the active terms from a library of hundreds of candidates.
</div>

SINDy has been applied to turbulent flows, epidemiology (COVID-19 SIR parameter estimation), neuroscience, and plasma physics.

## Section 6.3: Koopman Operator Theory

**Koopman operator theory** reformulates nonlinear dynamical systems as infinite-dimensional linear systems by lifting the state into a space of observables.

**Definition**: For a discrete system \(\mathbf{x}_{k+1} = \mathbf{F}(\mathbf{x}_k)\), the **Koopman operator** \(\mathcal{K}\) acts on scalar observables \(g: \mathbb{R}^n \to \mathbb{R}\):

\[
(\mathcal{K} g)(\mathbf{x}) = g(\mathbf{F}(\mathbf{x})).
\]

The operator \(\mathcal{K}\) is **linear** (since \(\mathcal{K}(\alpha g + \beta h) = \alpha \mathcal{K}g + \beta \mathcal{K}h\)) even when \(\mathbf{F}\) is nonlinear. The price is that \(\mathcal{K}\) is infinite-dimensional.

**Key property**: if \(g\) is a Koopman eigenfunction (\(\mathcal{K} g = \lambda g\)), then \(g(\mathbf{x}_k) = \lambda^k g(\mathbf{x}_0)\) — the observable evolves linearly.

### Extended DMD (EDMD) — Data-Driven Koopman Analysis

In practice, we approximate the Koopman operator on a finite-dimensional subspace spanned by a dictionary of observable functions \(\psi_1(\mathbf{x}), \ldots, \psi_p(\mathbf{x})\):

\[
\psi(\mathbf{x}_{k+1}) \approx K\, \psi(\mathbf{x}_k),
\]

where \(K \in \mathbb{R}^{p \times p}\) is a finite-dimensional Koopman matrix estimated from data via least-squares.

Applications:
- **Model predictive control**: Koopman linearization enables linear control theory for nonlinear systems.
- **Flow analysis**: identify coherent structures in turbulent flows.
- **Epidemiological modelling**: identify observable combinations that evolve linearly.

<div class="remark">
<strong>SINDy vs. DMD vs. Koopman — a comparison.</strong>
<ul>
<li><strong>DMD</strong>: assumes the system is approximately linear in the original state space. Fast, interpretable, but limited to near-linear dynamics.</li>
<li><strong>SINDy</strong>: identifies explicit nonlinear governing equations. Requires a library of candidate functions and produces interpretable results, but requires clean derivatives.</li>
<li><strong>Koopman/EDMD</strong>: linearizes nonlinear systems by lifting to observable space. Very general but requires choosing the dictionary; the resulting model is linear but higher-dimensional.</li>
</ul>
</div>
