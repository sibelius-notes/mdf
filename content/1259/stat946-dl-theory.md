---
title: "STAT 946: Deep Learning Theory"
prof: "Mufan Li"
subjects: "STAT"
---

## Sources and References
**Primary research papers** — Radford Neal, *Bayesian Learning for Neural Networks* (1996); Arthur Jacot, Franck Gabriel, and Clément Hongler, "Neural Tangent Kernel: Convergence and Generalization in Neural Networks," *NeurIPS 2018*; Greg Yang and Edward Hu, "Feature Learning in Infinite-Width Neural Networks," *ICML 2021*; Lenaic Chizat and Francis Bach, "On the Global Convergence of Gradient Descent for Overparameterized Models," *NeurIPS 2018*.
**Supplementary** — Belkin et al., "Reconciling Modern ML Practice and the Bias-Variance Trade-Off" (2019); Ricky Chen et al., "Neural Ordinary Differential Equations," *NeurIPS 2018*.
**Online resources** — Boris Hanin's lecture notes on neural network limits; Greg Yang's tensor programs series; Sebastian Goldt et al. DMFT notes.

# Chapter 1: The Deep Learning Theory Landscape

The empirical success of deep learning has outpaced its theoretical understanding by a substantial margin. Neural networks trained by gradient-based methods on finite datasets routinely achieve near-zero training loss while generalizing remarkably well to unseen data — a phenomenon that appears to contradict classical statistical learning theory, which would predict catastrophic overfitting in heavily overparameterized models. This course is organized around a unifying mathematical strategy for understanding these phenomena: the study of **scaling limits**, that is, the limiting behavior of neural networks as the number of parameters (typically the width or depth) tends to infinity. These limits yield tractable mathematical objects — Gaussian processes, kernel methods, partial differential equations, stochastic differential equations — which serve as theoretical proxies for understanding the behavior of finite but large networks.

## 1.1 The Generalization Mystery

Classical statistical learning theory, rooted in the work of Vapnik and Chervonenkis, relates generalization error to the capacity of the function class being optimized over. For a hypothesis class \( \mathcal{H} \) with VC dimension \( d \), the generalization bound takes the form

\[
R(h) \leq \hat{R}(h) + C\sqrt{\frac{d}{n}},
\]

where \( R(h) \) is the true risk, \( \hat{R}(h) \) is the empirical risk, and \( n \) is the sample size. For neural networks with millions or billions of parameters trained to interpolate \( n \sim 10^5 \) examples, the ratio \( d/n \) is enormous, and such bounds are vacuous. Yet these networks generalize.

The resolution to this mystery is subtle and has driven a great deal of theoretical activity. Several candidate explanations have been proposed, none fully satisfactory in isolation:

1. **Implicit regularization**: Gradient descent on overparameterized models has an implicit bias toward low-complexity solutions. For linear models, gradient descent initialized at zero converges to the minimum Euclidean norm interpolant. Analogous results hold for certain nonlinear architectures.

2. **Benign overfitting**: In high dimensions, interpolating training data can be compatible with good generalization. The geometry of high-dimensional spaces allows interpolating classifiers to remain smooth away from training points.

3. **The scaling limit perspective**: In the infinite-width limit, the function space explored by the network contracts to a reproducing kernel Hilbert space (RKHS), and generalization in the RKHS is well understood via classical theory.

## 1.2 The Optimization Landscape

A neural network with \( L \) layers, widths \( n_1, \ldots, n_{L-1} \), and parameters \( \theta \in \mathbb{R}^p \) defines a loss function

\[
\mathcal{L}(\theta) = \frac{1}{n} \sum_{i=1}^{n} \ell(f_\theta(x_i), y_i),
\]

which is highly nonconvex in \( \theta \). Classical optimization theory offers few guarantees in this setting. Nevertheless, gradient descent reliably finds near-global minima in practice. Theoretical analyses have revealed:

- For sufficiently wide networks, the loss landscape has no spurious local minima — all local minima are global minima, provided the network is wider than the number of training points.
- The Hessian at initialization has a large number of near-zero eigenvalues, corresponding to flat directions; gradient descent moves along these flat directions initially.
- **Linear mode connectivity**: Trained networks in the same loss basin can be linearly interpolated in parameter space without increasing the loss, suggesting a convex-like structure in the loss landscape at scale.

## 1.3 Lazy Versus Active Learning

A fundamental dichotomy in deep learning theory concerns whether the network's **features** (intermediate representations) change during training. In the **lazy** or **kernel** regime, the network parameters move negligibly from their initialization, and the network is well approximated by its first-order Taylor expansion around initialization. The dynamics are then linear and governed by the neural tangent kernel. In the **feature learning** or **mean-field** regime, the parameters move by order-one amounts, features adapt substantially, and the network develops structured representations not present at initialization.

The distinction is controlled by the parametrization and scaling of the weights. Standard (NTK) parametrization places the network in the lazy regime as width \( n \to \infty \), while the maximal update parametrization (\( \mu P \)) allows feature learning to persist in the limit. Understanding which regime better describes practical networks — and whether there is a smooth interpolation between them — remains an active research frontier.

## 1.4 What a Theory of Deep Learning Must Explain

A complete theory should address:

1. **Generalization**: Why do overparameterized interpolating networks generalize? What is the effective complexity measure?
2. **Optimization**: Why does gradient descent find global minima? What is the implicit bias of the optimizer?
3. **Feature learning**: How do representations form? What determines the quality of learned features?
4. **Scaling laws**: Why do test loss and capability scale as power laws in model size, data, and compute?
5. **Architecture effects**: Why do specific architectural choices (residual connections, normalization, attention) lead to better training and generalization?

The scaling limit approach addresses (1)–(4) in idealized settings and provides a rigorous foundation for building more complete answers.

# Chapter 2: Probability Background

This chapter establishes the probabilistic infrastructure needed throughout the course: the theory of Gaussian processes, functional central limit theorems, and convergence in distribution for infinite-dimensional random variables.

## 2.1 Gaussian Processes

Let \( (S, \mathcal{S}) \) be a measurable space. A **Gaussian process** (GP) on \( S \) is a collection of random variables \( \{f(x)\}_{x \in S} \) defined on a common probability space such that for every finite collection \( x_1, \ldots, x_k \in S \), the joint distribution of \( (f(x_1), \ldots, f(x_k)) \) is multivariate Gaussian.

A GP is completely characterized by its **mean function** \( m : S \to \mathbb{R} \) and **covariance kernel** \( K : S \times S \to \mathbb{R} \), defined by

\[
m(x) = \mathbb{E}\left[f(x)\right], \qquad K(x, x') = \mathrm{Cov}\left(f(x), f(x')\right).
\]

For \( K \) to be a valid covariance kernel it must be **positive semidefinite**: for all \( k \geq 1 \), all \( x_1, \ldots, x_k \in S \), and all \( \alpha \in \mathbb{R}^k \),

\[
\sum_{i,j=1}^{k} \alpha_i \alpha_j K(x_i, x_j) \geq 0.
\]

<div class="theorem">
<strong>Theorem (Kolmogorov Extension).</strong> Let \( S \) be a separable metric space, \( m : S \to \mathbb{R} \) any function, and \( K : S \times S \to \mathbb{R} \) a symmetric positive semidefinite kernel. Then there exists a probability space \( (\Omega, \mathcal{F}, \mathbb{P}) \) and a Gaussian process \( f : \Omega \times S \to \mathbb{R} \) with mean \( m \) and covariance \( K \).
</div>

The proof proceeds by constructing consistent finite-dimensional distributions and applying Kolmogorov's extension theorem, which guarantees a unique projective limit measure on the product space \( \mathbb{R}^S \) equipped with the product \( \sigma \)-algebra.

<div class="remark">
<strong>Remark.</strong> The Kolmogorov extension theorem guarantees existence of a process with the correct finite-dimensional distributions, but not automatically the existence of a version with nice path properties (continuity, measurability in both arguments). For GPs indexed by \( \mathbb{R}^d \), regularity of sample paths is controlled by the modulus of continuity of \( K \): if \( K \) satisfies a Hölder condition, Kolmogorov's continuity criterion guarantees continuous paths.
</div>

## 2.2 Reproducing Kernel Hilbert Spaces

Given a positive semidefinite kernel \( K \), the **reproducing kernel Hilbert space** (RKHS) \( \mathcal{H}_K \) is the completion of the pre-Hilbert space of functions \( \{x \mapsto \sum_{i} \alpha_i K(x_i, x)\} \) with inner product

\[
\left\langle \sum_i \alpha_i K(x_i, \cdot),\, \sum_j \beta_j K(x_j', \cdot) \right\rangle_{\mathcal{H}_K} = \sum_{i,j} \alpha_i \beta_j K(x_i, x_j').
\]

The reproducing property states that for all \( f \in \mathcal{H}_K \) and \( x \in S \),

\[
f(x) = \langle f, K(x, \cdot) \rangle_{\mathcal{H}_K}.
\]

The RKHS norm \( \| f \|_{\mathcal{H}_K} \) is the natural complexity measure for functions learned by kernel methods, and plays a central role in generalization theory for kernel regression.

## 2.3 Functional Central Limit Theorem

Let \( X_1, X_2, \ldots \) be i.i.d. real-valued random variables with mean zero and variance \( \sigma^2 > 0 \). Define the partial sum process

\[
S_n(t) = \frac{1}{\sigma\sqrt{n}} \sum_{k=1}^{\lfloor nt \rfloor} X_k, \qquad t \in [0,1].
\]

Each \( S_n \) is a random element of the Skorokhod space \( D[0,1] \) of right-continuous functions with left limits, equipped with the Skorokhod topology.

<div class="theorem">
<strong>Theorem (Donsker, 1951).</strong> Under the above assumptions, \( S_n \Rightarrow W \) in \( D[0,1] \), where \( W \) is standard Brownian motion (the Wiener process).
</div>

This is the prototypical example of convergence in distribution for infinite-dimensional random variables. The convergence \( \Rightarrow \) means that for every bounded continuous functional \( \Phi : D[0,1] \to \mathbb{R} \), we have \( \mathbb{E}[\Phi(S_n)] \to \mathbb{E}[\Phi(W)] \). The functional CLT underlies the deep connections between neural network training dynamics and stochastic differential equations developed in later chapters.

## 2.4 Weak Convergence in Infinite Dimensions

For metric spaces \( (\mathcal{X}, d) \), a sequence of probability measures \( \mu_n \) on \( \mathcal{X} \) **converges weakly** to \( \mu \), written \( \mu_n \Rightarrow \mu \), if

\[
\int_{\mathcal{X}} \varphi \, d\mu_n \to \int_{\mathcal{X}} \varphi \, d\mu
\]

for every bounded continuous \( \varphi : \mathcal{X} \to \mathbb{R} \). By the Portmanteau theorem, this is equivalent to \( \mu(A) = \lim_{n} \mu_n(A) \) for all \( \mu \)-continuity sets.

In the context of neural network limits, the spaces \( \mathcal{X} \) will typically be function spaces: \( C(\mathcal{X}) \) for outputs at a fixed layer, or \( C([0,T]; \mathbb{R}^d) \) for continuous-time training trajectories.

## 2.5 Exchangeability and de Finetti's Theorem

A sequence of random variables \( (X_1, X_2, \ldots) \) is **exchangeable** if for every \( n \) and every permutation \( \pi \) of \( \{1,\ldots,n\} \), the joint distribution of \( (X_{\pi(1)}, \ldots, X_{\pi(n)}) \) equals that of \( (X_1, \ldots, X_n) \).

<div class="theorem">
<strong>Theorem (de Finetti, 1931).</strong> An infinite sequence \( (X_1, X_2, \ldots) \) of \( [0,1] \)-valued random variables is exchangeable if and only if there exists a probability measure \( \mu \) on \( [0,1] \) such that
\[
(X_1, X_2, \ldots) \mid \theta \sim \mathrm{i.i.d.}\,F_\theta, \quad \theta \sim \mu.
\]
That is, exchangeable sequences are mixtures of i.i.d. sequences.
</div>

De Finetti's theorem is relevant to the Bayesian interpretation of neural network Gaussian processes: the exchangeability of the network outputs (over the random initialization) explains why the output distribution is a mixture of Gaussian distributions, which in the appropriate limit becomes purely Gaussian.

# Chapter 3: Neural Network Gaussian Processes

## 3.1 Neal's Infinite-Width Limit

Consider a single hidden layer network with input dimension \( d_0 \), hidden width \( n \), and scalar output:

\[
f(x) = \frac{1}{\sqrt{n}} \sum_{j=1}^{n} a_j \phi\left( w_j^\top x + b_j \right),
\]

where \( \phi : \mathbb{R} \to \mathbb{R} \) is a fixed activation function, and the weights and biases are initialized independently:

\[
w_j \sim \mathcal{N}(0, \sigma_w^2 I_{d_0}), \quad b_j \sim \mathcal{N}(0, \sigma_b^2), \quad a_j \sim \mathcal{N}(0, 1).
\]

The \( 1/\sqrt{n} \) normalization ensures that the output variance remains order one as \( n \to \infty \).

<div class="theorem">
<strong>Theorem (Neal, 1994).</strong> For any fixed finite collection of inputs \( x_1, \ldots, x_k \in \mathbb{R}^{d_0} \), as \( n \to \infty \), the joint distribution of \( (f(x_1), \ldots, f(x_k)) \) converges in distribution to a multivariate Gaussian with mean zero and covariance
\[
K(x_i, x_j) = \mathbb{E}_{w, b}\left[ \phi(w^\top x_i + b)\, \phi(w^\top x_j + b) \right],
\]
where the expectation is over \( w \sim \mathcal{N}(0, \sigma_w^2 I) \) and \( b \sim \mathcal{N}(0, \sigma_b^2) \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Fix \( x_1, \ldots, x_k \). Each pre-activation is a Gaussian random variable: \( z_j(x_i) = w_j^\top x_i + b_j \sim \mathcal{N}(0, \sigma_w^2 \|x_i\|^2 + \sigma_b^2) \). The output at \( x_i \) is

\[
f(x_i) = \frac{1}{\sqrt{n}} \sum_{j=1}^n a_j \phi(z_j(x_i)).
\]

Since the \( a_j \) are i.i.d. with mean zero and unit variance, and the \( \phi(z_j(x_i)) \) are i.i.d. (indexed by \( j \)) with finite second moments by assumption on \( \phi \), the vector \( (f(x_1), \ldots, f(x_k)) \) is a sum of i.i.d. random vectors, each with mean zero. By the multivariate CLT, the sum converges in distribution to a multivariate Gaussian with covariance

\[
\mathrm{Cov}(f(x_i), f(x_j)) = \mathbb{E}\left[ \phi(z(x_i)) \phi(z(x_j)) \right],
\]

where \( (z(x_i), z(x_j)) \) are jointly Gaussian. <span style="float:right">&#9632;</span>
</div>

The kernel \( K(x, x') = \mathbb{E}[\phi(z(x))\phi(z(x'))] \) is the **NNGP kernel** for the single hidden layer. For common activations it admits closed forms. For example, with \( \phi = \mathrm{erf} \) (the error function):

\[
K(x, x') = \frac{2}{\pi} \arcsin\!\left( \frac{2 \sigma_w^2 x^\top x' + 2\sigma_b^2}{\sqrt{(1 + 2\sigma_w^2 \|x\|^2 + 2\sigma_b^2)(1 + 2\sigma_w^2 \|x'\|^2 + 2\sigma_b^2)}} \right).
\]

## 3.2 Deep NNGP Kernel Recursion

For a deep network with \( L \) hidden layers, the NNGP kernel is computed recursively. Define the pre-activations at layer \( \ell \):

\[
h^{(\ell)}(x) = \frac{1}{\sqrt{n_\ell}} W^{(\ell)} \phi\!\left(h^{(\ell-1)}(x)\right) + b^{(\ell)},
\]

with \( W^{(\ell)}_{jk} \sim \mathcal{N}(0, \sigma_w^2) \) i.i.d. and \( b^{(\ell)}_j \sim \mathcal{N}(0, \sigma_b^2) \) i.i.d.

<div class="definition">
<strong>Definition (NNGP Kernel Recursion).</strong> Define \( K^{(0)}(x, x') = \sigma_w^2 x^\top x' / d_0 + \sigma_b^2 \). For \( \ell = 1, \ldots, L \):

\[
K^{(\ell)}(x, x') = \sigma_w^2 \, \mathbb{E}_{(u,v) \sim \mathcal{N}(0, \Sigma^{(\ell-1)})}\!\left[ \phi(u)\phi(v) \right] + \sigma_b^2,
\]

where \( \Sigma^{(\ell-1)} \) is the \( 2 \times 2 \) covariance matrix

\[
\Sigma^{(\ell-1)} = \begin{pmatrix} K^{(\ell-1)}(x,x) & K^{(\ell-1)}(x,x') \\ K^{(\ell-1)}(x',x) & K^{(\ell-1)}(x',x') \end{pmatrix}.
\]
</div>

This recursion is the key computational tool for the deep NNGP. It shows that the GP prior over functions defined by a deep network has a covariance structure determined entirely by the activation function and the depth, independent of the width (in the limit).

## 3.3 Properties of the NNGP Kernel

Several structural properties of \( K^{(L)} \) bear on the utility of the NNGP as a model:

**Stationarity.** For activations such as \( \phi = \mathrm{ReLU} \), the kernel is not stationary (i.e., does not depend only on \( x - x' \)) but is **dot-product** (depends on \( x^\top x' \) and \( \|x\| \), \( \|x'\| \)). Stationarity would require a different architecture or input preprocessing.

**Depth-induced smoothness.** As depth \( L \) increases, the recursion tends to drive \( K^{(L)}(x, x') \) toward a fixed point. For activations whose arc-cosine kernel has spectral radius less than 1, the deep kernel converges to a degenerate kernel concentrating mass on the diagonal, which corresponds to all inputs being mapped to the same representation — the **depth-induced kernel degeneracy** problem.

**Arc-cosine kernels.** For \( \phi = \mathrm{ReLU} \), the kernel expectation admits a closed form:

\[
\mathbb{E}_{(u,v) \sim \mathcal{N}(0,\Sigma)}\!\left[\mathrm{ReLU}(u)\,\mathrm{ReLU}(v)\right] = \frac{1}{2\pi}\sqrt{K(x,x)K(x',x')}\left(\sin\theta + (\pi - \theta)\cos\theta\right),
\]

where \( \theta = \arccos\!\left( K(x,x') / \sqrt{K(x,x)K(x',x')} \right) \).

## 3.4 Bayesian Deep Learning Interpretation

In the Bayesian interpretation, the NNGP is a prior over functions. Given training data \( \mathcal{D} = \{(x_i, y_i)\}_{i=1}^n \) with Gaussian noise \( y_i = f(x_i) + \varepsilon_i \), \( \varepsilon_i \sim \mathcal{N}(0, \sigma^2) \), the posterior is also a GP:

\[
f \mid \mathcal{D} \sim \mathcal{GP}\!\left(\mu_*, K_*\right),
\]

where

\[
\mu_*(x) = K(x, X)(K(X,X) + \sigma^2 I)^{-1} y, \quad K_*(x,x') = K(x,x') - K(x,X)(K(X,X)+\sigma^2 I)^{-1} K(X,x').
\]

Here \( K(x, X) \) denotes the vector with entries \( K(x, x_i) \) and \( K(X, X) \) the matrix with entries \( K(x_i, x_j) \). This posterior mean is exactly the kernel regression estimator with kernel \( K \), connecting the NNGP to classical nonparametric regression.

# Chapter 4: Neural Tangent Kernel

## 4.1 Linearization of Training Dynamics

Consider training a network \( f_\theta : \mathbb{R}^{d_0} \to \mathbb{R} \) by gradient flow on the mean squared error loss:

\[
\mathcal{L}(\theta) = \frac{1}{2n} \sum_{i=1}^n \left( f_\theta(x_i) - y_i \right)^2.
\]

The gradient flow ODE is

\[
\dot{\theta}(t) = -\nabla_\theta \mathcal{L}(\theta(t)).
\]

The evolution of the network output vector \( \hat{y}(t) = (f_{\theta(t)}(x_1), \ldots, f_{\theta(t)}(x_n)) \in \mathbb{R}^n \) is

\[
\dot{\hat{y}}_i(t) = \nabla_\theta f_{\theta(t)}(x_i)^\top \dot{\theta}(t) = -\frac{1}{n}\sum_j K_{\theta(t)}(x_i, x_j)\left(\hat{y}_j(t) - y_j\right),
\]

where the **neural tangent kernel** evaluated at time \( t \) is

\[
K_{\theta(t)}(x, x') = \nabla_\theta f_{\theta(t)}(x)^\top \nabla_\theta f_{\theta(t)}(x').
\]

<div class="definition">
<strong>Definition (Neural Tangent Kernel).</strong> For a network \( f_\theta \) with parameter \( \theta \in \mathbb{R}^p \), the <em>neural tangent kernel</em> (NTK) at \( \theta \) is the function \( K_\theta : \mathbb{R}^{d_0} \times \mathbb{R}^{d_0} \to \mathbb{R} \) defined by

\[
K_\theta(x, x') = \left\langle \nabla_\theta f_\theta(x),\, \nabla_\theta f_\theta(x') \right\rangle_{\mathbb{R}^p}.
\]
</div>

## 4.2 Jacot et al.'s Convergence Theorem

The fundamental theorem of NTK theory, due to Jacot, Gabriel, and Hongler (2018), states that in the infinite-width limit, the NTK is deterministic at initialization and constant during training.

<div class="theorem">
<strong>Theorem (Jacot-Gabriel-Hongler, 2018).</strong> Consider an \( L \)-layer fully connected network with widths \( n_1 = \cdots = n_{L-1} = n \) under the NTK parametrization (weights initialized i.i.d. \( \mathcal{N}(0, 2/n) \) at each layer). Then:

<ol>
<li><strong>Convergence at initialization:</strong> As \( n \to \infty \), \( K_{\theta_0}(x,x') \to K^\infty(x,x') \) in probability, where \( K^\infty \) is a deterministic positive semidefinite kernel.</li>
<li><strong>Constancy during training:</strong> For any fixed training time \( T > 0 \), \( \sup_{t \in [0,T]} \|K_{\theta(t)} - K^\infty\| \to 0 \) in probability as \( n \to \infty \).</li>
</ol>
</div>

The deterministic limiting kernel \( K^\infty \) is computed by the following recursion. Define

\[
\Sigma^{(0)}(x,x') = \frac{\sigma_w^2}{d_0} x^\top x' + \sigma_b^2,
\]

and recursively

\[
\Sigma^{(\ell)}(x,x') = \sigma_w^2 \,\dot{\mathcal{K}}\!\left(\Sigma^{(\ell-1)}(x,x), \Sigma^{(\ell-1)}(x,x'), \Sigma^{(\ell-1)}(x',x')\right) + \sigma_b^2,
\]

where \( \dot{\mathcal{K}} \) involves the activation's arc-cosine kernel. The NTK is then

\[
K^\infty(x,x') = \sum_{\ell=1}^{L} \dot{\Sigma}^{(\ell)}(x,x') \prod_{h=\ell+1}^{L} \dot{\Sigma}^{(h)}(x,x').
\]

Here \( \dot{\Sigma}^{(\ell)} \) denotes the derivative kernel.

## 4.3 Kernel Gradient Descent Dynamics

In the infinite-width limit, the training dynamics reduce to a linear ODE. Define the NTK matrix \( \mathbf{K} \in \mathbb{R}^{n \times n} \) with entries \( \mathbf{K}_{ij} = K^\infty(x_i, x_j) \). The prediction vector evolves as

\[
\dot{\hat{y}}(t) = -\frac{1}{n}\mathbf{K}\left(\hat{y}(t) - y\right),
\]

whose solution is

\[
\hat{y}(t) = y + e^{-\mathbf{K} t / n}\!\left(\hat{y}(0) - y\right) = \left(I - e^{-\mathbf{K}t/n}\right) y + e^{-\mathbf{K}t/n} \hat{y}(0).
\]

As \( t \to \infty \), if \( \mathbf{K} \succ 0 \), then \( \hat{y}(t) \to y \), i.e., the network perfectly interpolates the training data. The convergence rate is controlled by the smallest eigenvalue \( \lambda_{\min}(\mathbf{K}) \).

## 4.4 Implicit Regularization Toward Minimum-Norm Solutions

A crucial aspect of the NTK dynamics is the implicit bias of gradient flow toward the minimum-norm interpolant in the RKHS. For new test points \( x_* \), the prediction at time \( t \) is

\[
f_t(x_*) = K^\infty(x_*, X)\left(I - e^{-\mathbf{K}t/n}\right)\mathbf{K}^{-1} y + \text{initialization terms},
\]

and as \( t \to \infty \):

\[
f_\infty(x_*) = K^\infty(x_*, X) \mathbf{K}^{-1} y.
\]

This is precisely the kernel regression estimator with kernel \( K^\infty \), which is the minimum-norm interpolant in \( \mathcal{H}_{K^\infty} \). Thus:

<div class="theorem">
<strong>Theorem (Implicit Bias of NTK Gradient Flow).</strong> In the infinite-width limit, gradient flow on the MSE loss converges to the minimum-RKHS-norm interpolant in the RKHS of the neural tangent kernel:

\[
f_\infty = \arg\min_{f \in \mathcal{H}_{K^\infty}} \|f\|_{\mathcal{H}_{K^\infty}} \quad \text{subject to } f(x_i) = y_i \text{ for all } i.
\]
</div>

This connects the NTK theory to the classical theory of kernel methods and provides a precise characterization of the function learned by an infinitely wide network.

# Chapter 5: Generalization and Double Descent

## 5.1 Classical Bias-Variance Decomposition

For a generic estimator \( \hat{f} \) trained on data of size \( n \), the risk decomposes as

\[
\mathbb{E}\!\left[(f^*(x) - \hat{f}(x))^2\right] = \underbrace{\left(\mathbb{E}\hat{f}(x) - f^*(x)\right)^2}_{\text{bias}^2} + \underbrace{\mathrm{Var}\!\left(\hat{f}(x)\right)}_{\text{variance}}.
\]

Classical statistical intuition asserts a **bias-variance tradeoff**: complex models have low bias but high variance, and vice versa. The optimal model complexity (e.g., number of parameters) balances these two terms, yielding a U-shaped risk curve with an optimal point below the interpolation threshold.

## 5.2 Kernel Regression and the RKHS Perspective

For kernel regression with kernel \( K \) on \( n \) training points with labels corrupted by noise \( \varepsilon \sim \mathcal{N}(0, \sigma^2 I) \), the ridge estimator with regularization \( \lambda \geq 0 \) is

\[
\hat{f}_\lambda(x) = K(x, X)\left(\mathbf{K} + \lambda I\right)^{-1} y.
\]

The excess risk of this estimator admits exact asymptotic characterizations in the proportional limit \( n, d \to \infty \) with \( n/d \to \gamma \). For polynomial-decay kernel eigenvalues, the risk is minimized at \( \lambda > 0 \) (regularized regression), but the unregularized minimum-norm interpolant (\( \lambda = 0 \)) can also generalize when the noise level is low.

## 5.3 Double Descent

Belkin et al. (2019) and subsequent theoretical works showed that the classical U-shaped bias-variance tradeoff is incomplete. The risk curve has a second descent beyond the interpolation threshold:

\[
\text{Test risk} = \begin{cases} \text{classical U-shape} & p < n \\ \text{peak near } p \approx n & \text{(interpolation threshold)} \\ \text{decreasing again} & p > n \end{cases}
\]

<div class="theorem">
<strong>Theorem (Double Descent for Linear Models, Bartlett et al. 2020).</strong> Consider the minimum-norm linear interpolant \( \hat{\beta} = X^\top (XX^\top)^{-1} y \) in the overparameterized regime \( p > n \). Under mild assumptions on the covariate distribution and signal-to-noise ratio, the test risk satisfies

\[
R(\hat{\beta}) \to \sigma^2 \cdot \frac{\gamma}{\gamma - 1} + \text{bias terms} \quad \text{as } p/n \to \gamma > 1,
\]

which decreases as \( \gamma \to \infty \) (i.e., as the model becomes increasingly overparameterized).
</div>

<div class="remark">
<strong>Remark.</strong> The divergence at \( \gamma = 1 \) (i.e., \( p = n \)) is the interpolation peak. For \( p \gg n \), the minimum-norm solution essentially ignores the noise directions, and the risk returns to a level determined by the signal. The infinite-width network achieves the \( \gamma = \infty \) limit, where risk is governed solely by the RKHS approximation properties of the kernel.
</div>

## 5.4 Benign Overfitting in Overparameterized Models

The theoretical analysis of benign overfitting identifies the key geometric condition: the **effective rank** of the covariance matrix must be much larger than \( n \). In high dimensions with rapidly decaying eigenvalues \( \lambda_1 \gg \lambda_2 \geq \cdots \geq \lambda_p \), the minimum-norm interpolant effectively fits the signal in the high-eigenvalue directions and distributes the noise across many low-eigenvalue directions, where it is damped.

For kernel regression in the infinite-width limit, the NTK kernel has a specific spectral decay determined by the network architecture and depth. Understanding this spectral decay is essential for understanding why and when infinite-width networks generalize.

# Chapter 6: Feature Learning and μP

## 6.1 The NTK Versus Mean-Field Dichotomy

In the NTK (lazy) regime, network parameters change by \( O(n^{-1/2}) \) during training, features do not adapt, and the network is equivalent to a kernel machine. This regime arises naturally from the standard parametrization:

\[
f_\theta(x) = \frac{1}{\sqrt{n}} a^\top \phi(W x),
\]

with \( W_{ij}, a_j \sim \mathcal{N}(0,1) \). Under this scaling, the gradient of the loss with respect to \( W \) is \( O(n^{-1/2}) \), so \( W \) barely moves.

The **mean-field** or **feature learning** regime is characterized by parameter updates of order 1 as \( n \to \infty \). This requires a different scaling — the **maximal update parametrization** (\( \mu P \)) introduced by Yang and Hu (2021).

## 6.2 Maximal Update Parametrization

<div class="definition">
<strong>Definition (μP Scaling, Yang-Hu 2021).</strong> For a width-\( n \) two-layer network \( f(x) = n^{-1} a^\top \phi(W x) \) with first-layer weights \( W \in \mathbb{R}^{n \times d} \) and second-layer weights \( a \in \mathbb{R}^n \):

<ul>
<li>Initialize: \( W_{ij} \sim \mathcal{N}(0, \sigma_w^2) \), \( a_j \sim \mathcal{N}(0, \sigma_a^2) \)</li>
<li>Learning rates: \( \eta_W = \eta \), \( \eta_a = \eta/n \)</li>
<li>Scale output by \( 1/n \) (not \( 1/\sqrt{n} \))</li>
</ul>

Under this parametrization, the feature update \( \Delta W_{ij} = O(1) \) as \( n \to \infty \).
</div>

To see why, consider one step of gradient descent on the loss \( \mathcal{L} = n^{-1}\sum_i \ell(f(x_i), y_i) \):

\[
\Delta W = -\eta \nabla_W \mathcal{L} = -\frac{\eta}{n^2} \sum_i \ell'_i \cdot a \cdot \phi'(Wx_i) x_i^\top.
\]

With \( a_j = O(1) \) and \( \ell'_i = O(1) \), each entry \( \Delta W_{jk} \sim \eta n^{-2} \cdot n \cdot O(1) = O(n^{-1}) \). Wait — this is \( O(n^{-1}) \), not \( O(1) \). The output scaling \( 1/n \) versus \( 1/\sqrt{n} \) changes the balance: with output \( n^{-1} a^\top \phi(Wx) \), the output is \( O(n^{-1/2}) \) at initialization (since \( a^\top \phi(Wx) \sim \sqrt{n} \)), meaning the loss gradient with respect to \( W \) is now \( O(n^{-1/2}) \cdot O(n^{-1}) \cdot O(n) = O(1) \). The precise scaling depends on the parametrization details.

The key insight is the following characterization:

<div class="theorem">
<strong>Theorem (Yang-Hu, 2021 — Informal).</strong> For each parameter tensor in an \( L \)-layer network, there is a unique scaling of (i) the initialization variance and (ii) the learning rate such that the per-step feature update \( \Delta h^{(\ell)} \) is order 1 in the limit \( n \to \infty \). This is the maximal update parametrization. Any other scaling leads to either vanishing updates (lazy/NTK regime) or diverging updates (unstable regime).
</div>

## 6.3 Hyperparameter Transfer Across Width

A remarkable practical implication of \( \mu P \) is that optimal hyperparameters (learning rate, initialization scale) transfer across model widths. If hyperparameters are tuned at a small width \( n_0 \), they remain near-optimal at arbitrarily large width \( n \gg n_0 \).

This stands in contrast to standard (NTK) parametrization, where the optimal learning rate scales as \( \eta \sim n^{-1} \) (since the NTK matrix scales as \( n \)) and must be retuned for each width. In \( \mu P \), the effective NTK at each layer scales in a way that makes the optimal learning rate width-independent.

**Practical consequence**: Large language models can be tuned cheaply at small width and the hyperparameters transferred to full-scale models, a procedure validated empirically by Yang et al. in the *Tensor Programs V* paper.

## 6.4 Tensor Programs Framework

Yang's tensor programs framework provides a general calculus for computing infinite-width limits of arbitrary computations on neural networks. The framework tracks the behavior of arbitrary polynomials in the weight matrices under the infinite-width limit and identifies which computations are well-defined (i.e., converge to finite limits). The \( \mu P \) parametrization is the unique one for which the infinite-width limit captures nontrivial feature learning.

# Chapter 7: Mean-Field PDE

## 7.1 Continuous-Time Gradient Flow on the Space of Measures

For a two-layer network with \( n \) neurons, consider the output

\[
f_\mu(x) = \int \phi(w^\top x + b)\, d\mu(w, b),
\]

where \( \mu \) is the empirical measure of the \( n \) neurons: \( \mu = n^{-1}\sum_{j=1}^n a_j \delta_{(w_j, b_j)} \). Here we absorb the output weights \( a_j \) into the measure as a signed measure.

In the mean-field limit, the empirical measure \( \mu_n(t) \) (the distribution of a single neuron at training time \( t \)) converges to a probability measure \( \mu(t) \in \mathcal{P}(\mathbb{R}^{d+1}) \) satisfying a PDE.

<div class="definition">
<strong>Definition (Mean-Field Gradient Flow).</strong> The <em>mean-field gradient flow</em> for a two-layer network trained on the loss \( \mathcal{L}(\mu) = \frac{1}{2n}\sum_i (f_\mu(x_i) - y_i)^2 + \lambda R(\mu) \) is the PDE

\[
\partial_t \mu_t = \nabla \cdot \left( \mu_t \nabla \frac{\delta \mathcal{L}}{\delta \mu}(\mu_t) \right),
\]

where \( \delta \mathcal{L}/\delta \mu \) denotes the first variation of \( \mathcal{L} \) with respect to \( \mu \).
</div>

This is a continuity equation: it conserves total mass and represents each neuron moving in parameter space along the gradient of the loss.

## 7.2 The Vlasov PDE

Expanding the first variation for the squared loss:

\[
\frac{\delta \mathcal{L}}{\delta \mu}(w,b) = \frac{1}{n}\sum_{i=1}^n \left(f_{\mu}(x_i) - y_i\right)\phi(w^\top x_i + b).
\]

The PDE for the neuron density becomes

\[
\partial_t \mu_t(w,b) = \nabla_{(w,b)} \cdot \left( \mu_t(w,b) \cdot \frac{1}{n}\sum_i r_i(t) \nabla_{(w,b)}\phi(w^\top x_i + b) \right),
\]

where \( r_i(t) = f_{\mu_t}(x_i) - y_i \) is the residual. This is a nonlinear Vlasov-type equation — nonlinear because the force field \( r_i(t) \) depends on \( \mu_t \) itself.

## 7.3 Wasserstein Gradient Flow Interpretation

The mean-field dynamics can be interpreted as a gradient flow on the space of probability measures \( \mathcal{P}_2(\mathbb{R}^{d+1}) \) equipped with the **Wasserstein-2 metric**

\[
W_2(\mu, \nu)^2 = \inf_{\pi \in \Gamma(\mu,\nu)} \int \|x - y\|^2\, d\pi(x,y),
\]

where \( \Gamma(\mu,\nu) \) is the set of couplings of \( \mu \) and \( \nu \). The formal gradient of \( \mathcal{L} \) in the Wasserstein metric leads exactly to the continuity equation above. This geometric perspective connects the mean-field PDE to the theory of optimal transport.

## 7.4 Global Convergence (Chizat-Bach, 2018)

<div class="theorem">
<strong>Theorem (Chizat-Bach, 2018).</strong> For a two-layer network with sufficiently large \( n \) and a loss function satisfying a certain regularity and homogeneity condition, the mean-field gradient flow converges globally to the set of global minimizers of \( \mathcal{L} \). Specifically, the residuals satisfy \( \|r(t)\| \to 0 \) as \( t \to \infty \).
</div>

The proof proceeds via a Lyapunov analysis. The key ingredient is a **quantitative propagation of chaos** estimate: the empirical measure \( \mu_n(t) \) of the \( n \)-neuron system is well approximated by the mean-field limit \( \mu(t) \) uniformly over compact time intervals, with error \( O(n^{-1/2}) \).

<div class="remark">
<strong>Remark.</strong> The Chizat-Bach convergence result applies to the idealized mean-field dynamics, not directly to discrete gradient descent with finite \( n \). Closing the gap between the mean-field PDE and practical SGD requires additional work on (i) discretization error, (ii) stochastic noise in SGD, and (iii) the behavior for finite but large \( n \).
</div>

# Chapter 8: Dynamical Mean Field Theory

## 8.1 The DMFT Framework

Dynamical mean field theory (DMFT) originated in condensed matter physics as a method to analyze disordered systems (e.g., spin glasses). It was adapted to analyze neural network training dynamics by Mannelli et al., Goldt et al., and related works.

The central idea is to replace the complicated high-dimensional dynamics of all \( n \) neurons by an effective single-neuron dynamics driven by a self-consistent noise process. Formally, consider a two-layer network with \( n \) hidden neurons trained on \( m \) samples:

\[
f(x) = \frac{1}{\sqrt{n}} \sum_{j=1}^n a_j \phi(w_j^\top x), \quad w_j, x_i \in \mathbb{R}^d.
\]

In the proportional limit \( n, m, d \to \infty \) with \( n/d \to \alpha \), \( m/d \to \beta \), the dynamics of each neuron \( w_j(t) \) under gradient descent become, in the limit, equivalent to the dynamics of a single neuron \( w(t) \) satisfying a **self-consistent stochastic process**.

## 8.2 The Self-Consistency Equations

The DMFT equations for the neuron dynamics take the form:

\[
\dot{w}(t) = -\frac{1}{d}\sum_{i=1}^m r_i(t)\phi'(w(t)^\top x_i) x_i + \eta(t),
\]

where the "residuals" \( r_i(t) \) are themselves expressed through an effective stochastic process, and \( \eta(t) \) is a Gaussian process with covariance

\[
\mathbb{E}\!\left[\eta(t)\eta(s)^\top\right] = C(t,s) I_d,
\]

with the covariance function \( C(t,s) \) determined self-consistently through the fixed-point equations:

\[
C(t,s) = \frac{\alpha}{\beta} \int \mathbb{E}\!\left[ \phi'(w(t)^\top x)\phi'(w(s)^\top x) \right] d\mu_x(x),
\]

and similarly for the response function \( R(t,s) = \delta \mathbb{E}[w(t)] / \delta \eta(s) \).

These equations are **exact** in the proportional scaling limit and provide an asymptotic characterization of the full training trajectory.

## 8.3 Application to Two-Layer Networks with Random Features

For networks in the random feature regime (only the second layer \( a \) is trained, first layer \( w \) is fixed at initialization), the DMFT reduces to a simpler system. The self-consistency equations become a system of ODEs for the order parameters:

\[
m(t) = \frac{1}{n}\sum_j \mathbb{E}\!\left[a_j(t) w_j^\top w^*\right], \quad q(t) = \frac{1}{n}\sum_j \mathbb{E}\!\left[a_j(t)^2\right],
\]

where \( w^* \) is the ground truth weight vector (for a single-index model). The DMFT yields exact differential equations for \( m(t) \) and \( q(t) \), which completely characterize the generalization error at all times.

# Chapter 9: Single Index Models

## 9.1 Definition and Information-Theoretic Bounds

A **single index model** (SIM) posits that the label \( y \) depends on the input \( x \in \mathbb{R}^d \) only through a single linear projection:

\[
y = g(w^{*\top} x) + \varepsilon,
\]

where \( w^* \in \mathbb{R}^d \) is the unknown index direction, \( g : \mathbb{R} \to \mathbb{R} \) is an unknown link function, and \( \varepsilon \) is noise. With \( x \sim \mathcal{N}(0, I_d) \) and \( n \) training samples, the information-theoretic minimax estimation rate for \( w^* \) (up to sign) is:

\[
\inf_{\hat{w}} \sup_{w^*, g} \mathbb{E}\!\left[\sin^2\!\angle(\hat{w}, w^*)\right] \gtrsim \frac{d}{n \cdot \mathrm{SNR}},
\]

where SNR is the signal-to-noise ratio. Achieving this rate requires algorithms that can leverage the low-dimensional structure of the problem.

## 9.2 The Staircase Property

**Gradient descent with a two-layer network** on a SIM task exhibits a staircase phenomenon: the learning proceeds in discrete phases, each corresponding to learning one "harmonic" of the link function \( g \) in the Hermite polynomial basis.

Let \( g(t) = \sum_{k=0}^\infty c_k H_k(t) \) be the Hermite expansion. The **information exponent** \( s^* = \min\{k \geq 1 : c_k \neq 0\} \) determines the sample complexity: learning the index direction \( w^* \) requires \( n \gtrsim d^{s^*/2} \) samples for gradient descent. Functions with \( s^* = 2 \) (e.g., \( g(t) = t^2 \)) require quadratic sample complexity in the dimension, whereas \( s^* = 1 \) (linear \( g \)) requires only linear.

## 9.3 DMFT Analysis of SGD on Single-Index Tasks

Applying DMFT to SGD on a two-layer network trained on a SIM yields exact characterizations of the order parameter dynamics:

\[
\frac{dm}{dt} = -\lambda m + \alpha \cdot F_1(m, q), \quad \frac{dq}{dt} = -2\lambda q + \alpha \cdot F_2(m, q),
\]

where \( F_1 \) and \( F_2 \) are deterministic functions depending on \( g \) and the activation \( \phi \), and \( \lambda \) is the regularization parameter. These ODEs exhibit **phase transitions**: as \( \alpha = n/d \) crosses a critical value \( \alpha_c \), the stable fixed point transitions from the uninformative solution \( m = 0 \) (no correlation with \( w^* \)) to an informative solution \( m > 0 \).

<div class="theorem">
<strong>Theorem (DMFT Phase Transition for SIM).</strong> For a single-index model with link function \( g \) having information exponent \( s^* \), the DMFT predicts that SGD on a two-layer network undergoes a phase transition at sample size

\[
n_c \asymp d^{s^*/2}.
\]

Below \( n_c \), the DMFT fixed point has \( m = 0 \) and generalization error is no better than chance. Above \( n_c \), the DMFT predicts \( m > 0 \) and consistent estimation of \( w^* \).
</div>

# Chapter 10: Neural ODEs

## 10.1 The Neural ODE Formulation

Chen et al. (2018) proposed **Neural ODEs** as a continuous-depth generalization of residual networks. A residual network with blocks \( h_{t+1} = h_t + \Delta t \cdot f_\theta(h_t, t) \) is interpreted as the Euler discretization of the ODE

\[
\dot{h}(t) = f_\theta(h(t), t), \quad h(0) = x,
\]

where \( f_\theta : \mathbb{R}^d \times [0,T] \to \mathbb{R}^d \) is a neural network parametrizing the vector field, and the output is \( h(T) \).

<div class="definition">
<strong>Definition (Neural ODE).</strong> A <em>neural ODE</em> is the initial value problem

\[
\frac{dh}{dt} = f_\theta(h(t), t), \quad h(0) = x \in \mathbb{R}^d,
\]

with output \( \hat{y} = g_\phi(h(T)) \) for a learned readout \( g_\phi \). The parameter \( \theta \) is optimized by minimizing a loss on the output.
</div>

**Existence and uniqueness.** By Picard-Lindelöf, if \( f_\theta(\cdot, t) \) is Lipschitz continuous uniformly in \( t \) (e.g., \( f_\theta \) is a Lipschitz neural network), then the IVP has a unique global solution. The Lipschitz constant of the flow map \( x \mapsto h(T) \) is bounded by \( e^{L_f T} \), where \( L_f \) is the Lipschitz constant of \( f_\theta \).

## 10.2 The Adjoint Method

Computing gradients of the loss \( \mathcal{L}(h(T)) \) with respect to \( \theta \) via direct backpropagation through the ODE solver would require storing all intermediate states, costing \( O(T/\Delta t) \) memory. The adjoint method reduces this to \( O(1) \) memory by solving a second ODE backward in time.

Define the adjoint state \( a(t) = \partial \mathcal{L} / \partial h(t) \in \mathbb{R}^d \). Differentiating the ODE with respect to the initial condition and applying the chain rule yields:

<div class="theorem">
<strong>Theorem (Adjoint ODE).</strong> The adjoint state satisfies the backward ODE

\[
\dot{a}(t) = -a(t)^\top \frac{\partial f_\theta}{\partial h}(h(t), t),
\]

with terminal condition \( a(T) = \partial \mathcal{L} / \partial h(T) \). The gradient with respect to the parameters is

\[
\frac{\partial \mathcal{L}}{\partial \theta} = -\int_0^T a(t)^\top \frac{\partial f_\theta}{\partial \theta}(h(t), t)\, dt.
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> Let \( h(t; \epsilon) \) be the solution when \( \theta \) is perturbed by \( \epsilon\delta\theta \). Then

\[
\frac{d}{dt}\left[\frac{\partial h}{\partial \epsilon}\right] = \frac{\partial f_\theta}{\partial h} \frac{\partial h}{\partial \epsilon} + \frac{\partial f_\theta}{\partial \theta}\delta\theta.
\]

The variation of the loss is \( \delta\mathcal{L} = a(T)^\top \delta h(T) \). Using integration by parts and the adjoint ODE, this equals \( -\int_0^T a(t)^\top \frac{\partial f_\theta}{\partial \theta}\delta\theta\, dt \). <span style="float:right">&#9632;</span>
</div>

## 10.3 Continuous Normalizing Flows

Neural ODEs define invertible maps (since ODEs with Lipschitz vector fields are diffeomorphisms), making them natural building blocks for **normalizing flows** — generative models that transform a simple base distribution into a complex target distribution.

For a random variable \( z(t) \) evolving as \( \dot{z}(t) = f_\theta(z(t), t) \), the log-density evolves by the **instantaneous change of variables formula**:

\[
\frac{d}{dt}\log p(z(t), t) = -\mathrm{tr}\!\left(\frac{\partial f_\theta}{\partial z}(z(t), t)\right).
\]

This follows from the Liouville equation for the density transport. The trace of the Jacobian can be estimated efficiently using the Hutchinson trace estimator, giving an unbiased gradient estimate without ever forming the full Jacobian.

# Chapter 11: ODE Limits for ResNets

## 11.1 ResNets as Euler Discretizations

A ResNet with \( L \) blocks and step size \( \Delta t = T/L \) computes

\[
h_{k+1} = h_k + \Delta t \cdot f^{(k)}_\theta(h_k), \quad k = 0, 1, \ldots, L-1,
\]

where each block \( f^{(k)}_\theta \) is a small neural network. As \( L \to \infty \) with \( T \) fixed, if the block weights \( \theta^{(k)} \) are coupled (e.g., if \( f^{(k)}_\theta = f_{\theta(k \Delta t)} \) for a time-continuous parameter function \( \theta : [0,T] \to \Theta \)), the sequence \( (h_k)_{k=0}^L \) converges to the solution of the neural ODE \( \dot{h}(t) = f_{\theta(t)}(h(t)) \).

This convergence is in the Euler method sense: the global error is \( O(\Delta t) = O(1/L) \) under Lipschitz continuity of the vector field.

## 11.2 Mean-Field Limit of Infinite-Depth ResNets

A distinct limit is the **mean-field limit** as \( n, L \to \infty \) simultaneously (with \( n \) the width and \( L \) the depth). In this regime, at each layer \( k \) the \( n \)-dimensional hidden state \( h_k \in \mathbb{R}^n \) is governed by

\[
h_{k+1} = h_k + \frac{\Delta t}{\sqrt{n}} \sum_{j=1}^n a_j^{(k)} \phi(w_j^{(k)\top} h_k).
\]

Under appropriate weight initialization and taking \( n, L \to \infty \) with \( \Delta t = T/L \), the empirical distribution of \( (h_k, w^{(k)}) \) converges to a measure-valued process \( \mu_t \in \mathcal{P}(\mathbb{R}^d \times \mathbb{R}^d) \) satisfying a PDE that couples the forward state and the weight distributions.

## 11.3 Controlled ODEs and Rough Path Theory

When the "signal" driving the ODE has low regularity (e.g., the input sequence to a network has fractal or rough structure), the appropriate framework is **rough path theory** (Lyons, 1998) or the closely related theory of **controlled differential equations** (CDEs):

\[
dh_t = f_\theta(h_t)\, dX_t,
\]

where \( X_t \) is a rough path (a path with finite \( p \)-variation for \( p \geq 2 \)). Neural CDEs (Kidger et al., 2020) are the network analog: they process time series by learning a vector field \( f_\theta \) and evolving the hidden state via a CDE driven by the input path \( X \). The key advantage is that the hidden state dynamics depend on the input data in a continuous, differentiable manner, enabling training by the adjoint method.

# Chapter 12: SDE Limits for Shaped MLPs

## 12.1 Noise in SGD as Brownian Motion

Stochastic gradient descent (SGD) introduces noise through the mini-batch approximation. For a batch of size \( B \), the gradient estimate is

\[
\hat{g}(\theta) = \frac{1}{B}\sum_{i \in \mathcal{B}} \nabla_\theta \ell(\theta; x_i, y_i) \approx \nabla_\theta \mathcal{L}(\theta) + \frac{1}{\sqrt{B}}\xi(\theta),
\]

where \( \xi(\theta) \) is approximately Gaussian with covariance \( \Sigma(\theta) = \mathrm{Var}(\nabla_\theta \ell(\theta; x, y)) \).

The SGD dynamics with step size \( \eta \) and continuous-time interpolation (taking \( \eta \to 0 \), \( B \to \infty \) with \( \eta/B \to \gamma \)) converge to the Itô SDE:

\[
d\theta_t = -\nabla_\theta \mathcal{L}(\theta_t)\, dt + \sqrt{\gamma \Sigma(\theta_t)}\, dW_t,
\]

where \( W_t \) is a standard Brownian motion in \( \mathbb{R}^p \). This is the **SDE limit of SGD**.

## 12.2 Itô SDE for Training Dynamics

<div class="definition">
<strong>Definition (Itô SDE).</strong> An <em>Itô stochastic differential equation</em> is

\[
dX_t = b(X_t, t)\, dt + \sigma(X_t, t)\, dW_t,
\]

where \( b : \mathbb{R}^d \times [0,T] \to \mathbb{R}^d \) is the drift, \( \sigma : \mathbb{R}^d \times [0,T] \to \mathbb{R}^{d \times m} \) is the diffusion coefficient, and \( W_t \) is an \( m \)-dimensional standard Brownian motion.
</div>

By Itô's formula, if \( V : \mathbb{R}^d \times [0,T] \to \mathbb{R} \) is \( C^{2,1} \), then

\[
dV(X_t, t) = \left(\partial_t V + b^\top \nabla V + \frac{1}{2}\mathrm{tr}(\sigma\sigma^\top \nabla^2 V)\right) dt + (\nabla V)^\top \sigma\, dW_t.
\]

The generator of the diffusion is \( \mathcal{A} = b^\top \nabla + \frac{1}{2}\mathrm{tr}(\sigma\sigma^\top \nabla^2) \), and the corresponding Fokker-Planck equation for the density \( p_t \) of \( X_t \) is

\[
\partial_t p_t = -\nabla \cdot (b p_t) + \frac{1}{2}\nabla^2 : (\sigma\sigma^\top p_t).
\]

## 12.3 SDE Limits for "Shaped" MLPs

For MLPs with shaped activations and specific weight scalings (e.g., \( \tanh \) networks with \( \sigma_w^2 = 1 + \varepsilon_n \) where \( \varepsilon_n \to 0 \)), the training dynamics of the hidden layer pre-activations converge in the depth-infinite limit to a system of SDEs. Hayou, Doucet, and Rousseau analyzed this regime and showed that pre-activations converge weakly to solutions of

\[
dh^\ell = f(h^\ell)\, dt + g(h^\ell)\, dB^\ell,
\]

where \( B^\ell \) is a Brownian motion and the functions \( f, g \) are determined by the activation and the weight variance. The SDE framework captures the interplay between signal propagation and noise amplification across depth.

## 12.4 Connection to Score-Based Generative Models

A celebrated application of SDEs to deep learning is the **score-based generative modeling** framework (Song et al., 2020). The forward process transforms data \( x_0 \sim p_{\rm data} \) into noise by the SDE

\[
dX_t = -\frac{1}{2}X_t\, dt + dW_t \quad \text{(Ornstein-Uhlenbeck process)}.
\]

The marginal density \( p_t \) converges exponentially to \( \mathcal{N}(0, I) \). The **reverse-time SDE** runs the diffusion backward:

\[
dX_t = \left(-\frac{1}{2}X_t - \nabla_x \log p_t(X_t)\right) dt + d\bar{W}_t,
\]

where \( \bar{W}_t \) is a backward Brownian motion. The **score function** \( \nabla_x \log p_t \) is approximated by a neural network \( s_\theta(x, t) \) trained by **score matching**:

\[
\mathcal{L}(\theta) = \mathbb{E}_{t, X_t}\!\left[\|s_\theta(X_t, t) - \nabla_{X_t} \log p_t(X_t)\|^2\right].
\]

Simulating the reverse SDE with the learned score generates new samples from (approximately) \( p_{\rm data} \). The theoretical analysis of when this procedure succeeds, how errors in score estimation propagate, and the sample complexity of score matching are active research directions tightly connected to the SDE limits developed in this chapter.

## 12.5 The Ornstein-Uhlenbeck Process as Linear SDE

The **Ornstein-Uhlenbeck** (OU) process is the unique stationary Gaussian Markov process, providing the canonical linear SDE example:

\[
dX_t = -\alpha X_t\, dt + \sigma\, dW_t, \quad X_0 \sim \mathcal{N}(m_0, v_0).
\]

By Itô's formula, \( X_t = e^{-\alpha t} X_0 + \sigma \int_0^t e^{-\alpha(t-s)}\, dW_s \), so \( X_t \sim \mathcal{N}(m_t, v_t) \) with

\[
m_t = e^{-\alpha t} m_0, \quad v_t = e^{-2\alpha t} v_0 + \frac{\sigma^2}{2\alpha}(1 - e^{-2\alpha t}).
\]

As \( t \to \infty \), \( X_t \to \mathcal{N}(0, \sigma^2/(2\alpha)) \) (the stationary distribution). This is the continuous-time analog of weight decay in optimization.

# Chapter 13: Training Dynamics and Limiting Spectrum

## 13.1 Random Matrix Theory at Initialization

At initialization, the weight matrices of a neural network are essentially random matrices. The **Marchenko-Pastur law** (1967) describes the limiting spectral distribution of the sample covariance matrix \( \frac{1}{n} W W^\top \) when \( W \) is an \( m \times n \) matrix with i.i.d. entries of mean zero and variance \( \sigma^2 \), in the limit \( m, n \to \infty \) with \( m/n \to \gamma \in (0, \infty) \).

<div class="theorem">
<strong>Theorem (Marchenko-Pastur Law).</strong> Under the above conditions, the empirical spectral distribution of \( \frac{1}{n}WW^\top \) converges weakly almost surely to the Marchenko-Pastur distribution with density

\[
\rho_\gamma(\lambda) = \frac{1}{2\pi \sigma^2 \gamma \lambda}\sqrt{(\lambda_+ - \lambda)(\lambda - \lambda_-)}\,\mathbf{1}_{[\lambda_-, \lambda_+]}(\lambda),
\]

where \( \lambda_\pm = \sigma^2(1 \pm \sqrt{\gamma})^2 \).
</div>

The Marchenko-Pastur law implies that at initialization, the NTK matrix (which is formed as a product of Jacobians) has a limiting spectral distribution determined by the network architecture and depth. The smallest eigenvalue \( \lambda_{\min}(\mathbf{K}) \) is positive in the overparameterized regime, ensuring that gradient flow converges.

## 13.2 The Edge of Stability

**Edge of stability** (Cohen et al., 2021) refers to the empirical observation that during training with constant learning rate \( \eta \), the **sharpness** (largest Hessian eigenvalue) \( \lambda_{\max}(\nabla^2 \mathcal{L})  \) rises to \( 2/\eta \) and stabilizes there, even as the loss continues to decrease. This stands in sharp contrast to the classical convergence theory for gradient descent, which requires \( \eta < 2/\lambda_{\max} \) for stability.

Formally, gradient descent with step size \( \eta \) on a quadratic loss \( \mathcal{L}(\theta) = \frac{1}{2}\theta^\top A \theta \) is stable if and only if all eigenvalues of \( I - \eta A \) have modulus less than 1, i.e., \( \eta \lambda_{\max}(A) < 2 \). At the edge of stability, \( \eta \lambda_{\max} = 2 \), and the dynamics in the top eigendirection are neutrally stable (oscillating), while all other directions converge. The nonlinearity of the loss allows the sharpness to self-regulate at this edge.

## 13.3 The Catapult Phase

The **catapult phase** (Lewkowycz et al., 2020) describes the initial transient in training large learning rates: the loss first increases (the network is "catapulted" away from initialization), then decreases sharply to a lower minimum than what would be achieved with a small learning rate. Theoretically, this is understood as follows: the large learning rate selectively amplifies the top eigenmodes of the Hessian, driving the network into a flatter region of the loss landscape. The implicit regularization of large learning rates biases toward flat minima.

## 13.4 Loss of Plasticity

**Loss of plasticity** refers to the phenomenon where neural networks trained continually on non-stationary data gradually lose the ability to learn new tasks. Formally, if a network is trained sequentially on tasks \( \mathcal{T}_1, \mathcal{T}_2, \ldots \), the effective rank of the neural Jacobian

\[
\mathrm{rank}(J_\theta) = \mathrm{rank}\!\left(\left[\nabla_\theta f_\theta(x_1), \ldots, \nabla_\theta f_\theta(x_n)\right]\right)
\]

decreases over time. This corresponds to a collapse of the representation: many neurons become co-linear or "dead" (outputting zero for all inputs, e.g., due to ReLU saturation). The connection to the NTK theory is direct: as \( \mathrm{rank}(J_\theta) \to r < n \), the NTK matrix \( \mathbf{K} = J_\theta J_\theta^\top / n \) becomes rank-deficient, and gradient descent can no longer fit new data.

## 13.5 Neural Collapse

**Neural collapse** (Papyan, Han, and Donoho, 2020) is a geometric phenomenon observed in the final layer representations of deep classifiers trained to convergence:

1. **Within-class variability collapse**: All training samples from class \( c \) converge to a single point \( h_c^* \) (the class mean).
2. **Convergence to equiangular tight frame (ETF)**: The class means \( \{h_c^*\}_{c=1}^C \) form a simplex ETF: \( \langle h_c^*, h_{c'}^* \rangle = -1/(C-1) \) for \( c \neq c' \), maximally equiangular.
3. **Alignment of weights and features**: The last-layer weight vectors align with the class means.
4. **Agreement of nearest-class-mean and last-layer classifiers**: Both decision rules coincide.

The theoretical explanation of neural collapse via an unconstrained features model (treating the penultimate features as free variables) reduces to a Riemannian optimization problem on the Stiefel manifold, whose global minimum is precisely the ETF structure.

<div class="theorem">
<strong>Theorem (Global Optimality of ETF under Neural Collapse).</strong> Consider the unconstrained features model:

\[
\min_{H, W, b} \frac{1}{n}\sum_{i=1}^n \ell_{\rm CE}(W h_i + b, y_i) + \frac{\lambda_W}{2}\|W\|_F^2 + \frac{\lambda_H}{2}\|H\|_F^2,
\]

where \( H = [h_1,\ldots,h_n] \in \mathbb{R}^{d \times n} \), \( W \in \mathbb{R}^{C \times d} \), and \( b \in \mathbb{R}^C \). For the cross-entropy loss, all global minimizers exhibit neural collapse: the optimal \( H \) and \( W \) form a simplex ETF.
</div>

## 13.6 Connecting Spectrum and Generalization

The **bulk spectral distribution** of the NTK (or the Gram matrix of the neural Jacobian) at any point during training encodes the effective complexity of the network. Specifically, the generalization error of the kernel regression solution is controlled by the projection of the target function onto the eigenspaces of \( \mathbf{K} \):

\[
\text{Test MSE} = \sum_{k=1}^\infty \frac{\lambda_k^2}{(\lambda_k + \lambda)^2} \beta_k^2 + \sigma^2 \sum_{k=1}^\infty \frac{\lambda_k^2}{(\lambda_k + \lambda)^2 n},
\]

where \( \lambda_k \) are the eigenvalues of the kernel operator, \( \beta_k = \langle f^*, \varphi_k \rangle \) are the projections of the target onto the eigenfunctions, and \( \lambda \) is the ridge parameter. The bias term is controlled by the spectral decay of \( K \) relative to the smoothness of \( f^* \), and the variance term by the number of effective parameters \( \sum_k \lambda_k^2/(\lambda_k + \lambda)^2 \).

Understanding the full spectral distribution at large width — and how it evolves during training — is thus central to a complete theory of generalization in deep learning, and remains an active area at the intersection of random matrix theory and deep learning theory.

---

## Appendix: Key Notation

Throughout these notes we use the following conventions:

- \( f_\theta \): neural network with parameters \( \theta \in \mathbb{R}^p \)
- \( n \): network width (number of neurons per layer)
- \( L \): network depth (number of layers)
- \( d \): input dimension
- \( m \): number of training samples
- \( K(x,x') \): kernel function (NNGP or NTK depending on context)
- \( \mathbf{K} \): kernel Gram matrix with entries \( K(x_i, x_j) \)
- \( \phi \): activation function
- \( \mu_t \): probability measure over neurons at time \( t \)
- \( W_2 \): Wasserstein-2 distance
- \( \mathcal{H}_K \): RKHS with kernel \( K \)
- \( \Rightarrow \): weak convergence of probability measures
- \( \mathcal{GP}(m, K) \): Gaussian process with mean \( m \) and covariance \( K \)
