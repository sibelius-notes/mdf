---
title: "PHYS 449: Machine Learning in Physics"
prof: "Roger Melko"
---

## Sources and References

**Primary references**
- I. Goodfellow, Y. Bengio, and A. Courville, *Deep Learning* (MIT Press, 2016) — deeplearningbook.org
- K. Murphy, *Probabilistic Machine Learning: An Introduction* (MIT Press, 2022) — probml.github.io/pml-book/book1.html
- C. Bishop, *Pattern Recognition and Machine Learning* (Springer, 2006)

**Physics-specific references**
- J. Carrasquilla and R. G. Melko, "Machine learning phases of matter," *Nature Physics* 13 (2017), 431–434
- P. Mehta et al., "A high-bias, low-variance introduction to machine learning for physicists," *Physics Reports* 810 (2019), 1–124
- G. Carleo et al., "Machine learning and the physical sciences," *Rev. Mod. Phys.* 91 (2019), 045002

**Online resources**
- Stanford CS229 lecture notes — cs229.stanford.edu
- UBC CPSC 340/540 notes — cs.ubc.ca

---

# Chapter 1: Learning Theory in Physics — Connections and Foundations

## Section 1.1: Why Physics and Machine Learning?

Machine learning and statistical physics share deep mathematical structures. The central theme of this course:

> **Statistical mechanics provides a natural language for machine learning, and ML provides powerful tools for physics.**

Key correspondences:

| Statistical Mechanics | Machine Learning |
|---|---|
| Energy function \(E(\mathbf{s})\) | Loss function / negative log-likelihood |
| Boltzmann distribution \(p(\mathbf{s}) \propto e^{-\beta E(\mathbf{s})}\) | Softmax / Gibbs distribution |
| Partition function \(Z = \sum_\mathbf{s} e^{-\beta E(\mathbf{s})}\) | Normalizing constant |
| Free energy \(F = -\frac{1}{\beta}\log Z\) | Log-partition function |
| Entropy \(S = -\sum_i p_i \log p_i\) | Shannon entropy / cross-entropy loss |
| Phase transition | Change of regime in learning dynamics |
| Renormalization group (RG) | Deep learning hierarchy / coarse-graining |

## Section 1.2: Statistical Learning Theory

**Learning problem**: given a dataset \(\mathcal{D} = \{(\mathbf{x}_i, y_i)\}_{i=1}^N\) drawn i.i.d. from an unknown distribution \(p(\mathbf{x}, y)\), find a function \(f_\theta: \mathcal{X} \to \mathcal{Y}\) that generalizes to new samples.

The **generalization error** (true risk):

\[
R[f] = \mathbb{E}_{(\mathbf{x},y) \sim p}[\ell(y, f(\mathbf{x}))].
\]

The **empirical risk** (training error):

\[
\hat{R}[f] = \frac{1}{N}\sum_{i=1}^N \ell(y_i, f(\mathbf{x}_i)).
\]

The **bias-variance tradeoff**: for mean-squared error,

\[
\mathbb{E}[(y - f(\mathbf{x}))^2] = \underbrace{(\mathbb{E}[f(\mathbf{x})] - y)^2}_{\text{bias}^2} + \underbrace{\mathrm{Var}[f(\mathbf{x})]}_{\text{variance}} + \underbrace{\sigma^2_\varepsilon}_{\text{noise}}.
\]

Simple models have high bias (underfitting); complex models have high variance (overfitting).

## Section 1.3: Information Theory

**Shannon entropy** quantifies uncertainty in a distribution \(p\):

\[
H(p) = -\sum_i p_i \log p_i = \mathbb{E}[-\log p].
\]

**KL divergence** (relative entropy) measures how much distribution \(q\) differs from \(p\):

\[
D_{KL}(p \| q) = \sum_i p_i \log \frac{p_i}{q_i} \geq 0, \quad \text{with equality iff } p = q.
\]

**Cross-entropy**:

\[
H(p, q) = H(p) + D_{KL}(p \| q) = -\sum_i p_i \log q_i.
\]

Minimizing cross-entropy loss is equivalent to maximum likelihood estimation: if \(p\) is the true label distribution and \(q_\theta\) is the model's predicted distribution, then \(\min_\theta H(p, q_\theta)\) is equivalent to \(\max_\theta \sum_i \log q_\theta(y_i|\mathbf{x}_i)\).

---

# Chapter 2: The Ising Model — A Physical Introduction to Learning

## Section 2.1: The Ising Model

The **Ising model** is a prototypical model of ferromagnetism, consisting of binary spins \(s_i \in \{-1, +1\}\) on a lattice with Hamiltonian:

\[
H(\mathbf{s}) = -J \sum_{\langle i,j \rangle} s_i s_j - h \sum_i s_i,
\]

where \(J > 0\) is the ferromagnetic coupling, \(h\) is an external field, and \(\langle i,j \rangle\) denotes nearest-neighbor pairs.

The thermal equilibrium state is the Boltzmann distribution:

\[
p(\mathbf{s}) = \frac{1}{Z} e^{-\beta H(\mathbf{s})}, \qquad Z = \sum_{\mathbf{s}} e^{-\beta H(\mathbf{s})}, \qquad \beta = 1/(k_B T).
\]

## Section 2.2: Phase Transition

In 2D on the square lattice, the Ising model undergoes a continuous **phase transition** at the critical temperature:

\[
T_c = \frac{2J}{k_B \ln(1 + \sqrt{2})} \approx 2.269 J/k_B.
\]

- **Low \(T\)** (\(T < T_c\)): spontaneous magnetization \(\langle M \rangle \neq 0\); ordered ferromagnetic phase.
- **High \(T\)** (\(T > T_c\)): \(\langle M \rangle = 0\); disordered paramagnetic phase.
- **At \(T_c\)**: power-law correlations, diverging correlation length, universal scaling.

The Ising model serves as a test bed for ML: given configurations sampled at various temperatures, can a ML model identify the phase transition?

Carrasquilla and Melko (2017) showed that a simple convolutional neural network trained to classify Ising configurations as ordered/disordered learns to output a phase diagram with a sharp transition — demonstrating that ML can identify phases of matter.

## Section 2.3: Monte Carlo and Sampling

To generate configurations distributed according to the Boltzmann distribution, Markov Chain Monte Carlo (MCMC) methods are used:

**Metropolis-Hastings algorithm**:
1. Propose a spin flip: \(\mathbf{s}' = \mathbf{s}\) with spin \(s_i \to -s_i\).
2. Compute the energy change: \(\Delta E = H(\mathbf{s}') - H(\mathbf{s})\).
3. Accept with probability: \(\min(1, e^{-\beta \Delta E})\).

This generates a Markov chain that converges to the Boltzmann distribution.

**Connection to optimization**: Simulated annealing uses the Metropolis algorithm with a slowly decreasing temperature ("annealing schedule") to find the minimum-energy configuration — a global optimization strategy motivated by statistical mechanics.

---

# Chapter 3: Linear Models for Regression and Classification

## Section 3.1: Linear Regression

Linear regression models the relationship \(y = \mathbf{w}^T \mathbf{x} + b + \varepsilon\). Minimizing the mean squared error gives the OLS estimator \(\hat{\mathbf{w}} = (X^T X)^{-1} X^T \mathbf{y}\).

**Probabilistic interpretation**: if \(\varepsilon \sim \mathcal{N}(0, \sigma^2)\), then minimizing MSE is equivalent to maximum likelihood under a Gaussian model.

**Ridge regression**: add \(L_2\) regularization to the loss: \(\mathcal{L} = \|X\mathbf{w} - \mathbf{y}\|^2 + \lambda\|\mathbf{w}\|^2\). Solution: \(\hat{\mathbf{w}} = (X^T X + \lambda I)^{-1} X^T \mathbf{y}\). Regularization prevents overfitting by shrinking weights.

**Bayesian interpretation**: Ridge regression corresponds to a Gaussian prior on \(\mathbf{w}\): maximizing the posterior \(p(\mathbf{w}|\mathbf{y}, X) \propto p(\mathbf{y}|X,\mathbf{w})p(\mathbf{w})\) with \(p(\mathbf{w}) = \mathcal{N}(0, \lambda^{-1}I)\).

## Section 3.2: Logistic Regression

For binary classification (\(y \in \{0,1\}\)), logistic regression models:

\[
p(y=1|\mathbf{x}) = \sigma(\mathbf{w}^T \mathbf{x} + b) = \frac{1}{1 + e^{-(\mathbf{w}^T \mathbf{x} + b)}}.
\]

Training minimizes the **binary cross-entropy loss**:

\[
\mathcal{L} = -\sum_i [y_i \log \hat{p}_i + (1-y_i)\log(1-\hat{p}_i)].
\]

For multi-class classification, the **softmax** generalizes the sigmoid:

\[
p(y=k|\mathbf{x}) = \frac{e^{\mathbf{w}_k^T \mathbf{x}}}{\sum_j e^{\mathbf{w}_j^T \mathbf{x}}}.
\]

This is formally the Boltzmann distribution with "energy" \(-\mathbf{w}_k^T \mathbf{x}\) — connecting classification to statistical mechanics.

---

# Chapter 4: Optimization

## Section 4.1: Gradient Descent and Variants

**Gradient descent** iteratively follows the negative gradient:

\[
\boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} - \eta \nabla_\theta \mathcal{L}(\boldsymbol{\theta}^{(k)}).
\]

**Stochastic gradient descent (SGD)**: use a mini-batch estimate \(\hat{\nabla} \mathcal{L}\). Noisy gradients help escape saddle points and sharp minima.

**Momentum**: accumulate gradient history to reduce oscillations:

\[
\mathbf{v}^{(k+1)} = \mu \mathbf{v}^{(k)} - \eta \nabla \mathcal{L}, \qquad \boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} + \mathbf{v}^{(k+1)}.
\]

**Adam** (Kingma & Ba, 2015): adaptive per-parameter learning rates using first and second moment estimates:

\[
m_t = \beta_1 m_{t-1} + (1-\beta_1) g_t, \quad v_t = \beta_2 v_{t-1} + (1-\beta_2) g_t^2,
\]
\[
\theta_t = \theta_{t-1} - \frac{\eta}{\sqrt{\hat{v}_t} + \varepsilon} \hat{m}_t.
\]

Adam is the default optimizer in most deep learning applications.

## Section 4.2: The Loss Landscape

The loss landscape of a deep neural network is a high-dimensional non-convex surface. Key features:

- **Saddle points**: gradient zero but not a minimum (second-order derivatives have mixed signs). Dominant in high dimensions; SGD noise helps escape.
- **Flat minima vs. sharp minima**: flat minima generalize better than sharp minima (Hochreiter & Schmidhuber, 1997). SGD with large batch size tends to find sharp minima.
- **Mode connectivity**: recent work shows that most good minima of neural networks are connected by low-loss paths.

---

# Chapter 5: Neural Networks

## Section 5.1: Architecture

A deep neural network with \(L\) layers is a composition:

\[
f(\mathbf{x}; \theta) = f^{(L)} \circ \cdots \circ f^{(1)}(\mathbf{x}),
\]

where \(f^{(\ell)}(\mathbf{h}) = \sigma(W^{(\ell)}\mathbf{h} + \mathbf{b}^{(\ell)})\). The parameters \(\theta = \{W^{(\ell)}, \mathbf{b}^{(\ell)}\}\) are learned by backpropagation.

**Depth vs. width**: Depth allows exponentially more efficient representation of certain functions. Width ensures expressivity at each layer.

## Section 5.2: Backpropagation

Backpropagation is the chain rule applied backwards. For loss \(\mathcal{L}\) and parameters \(W^{(\ell)}\):

- **Forward pass**: compute \(\mathbf{h}^{(\ell)}\) for each layer.
- **Backward pass**: compute \(\delta^{(\ell)} = \partial \mathcal{L}/\partial \mathbf{z}^{(\ell)}\) recursively.
- **Weight gradient**: \(\nabla_{W^{(\ell)}} \mathcal{L} = \delta^{(\ell)} (\mathbf{h}^{(\ell-1)})^T\).

Cost: \(O(\text{parameters})\) — same as a forward pass.

## Section 5.3: Regularization

- **Dropout** (Srivastava et al., 2014): randomly zero out neurons during training with probability \(p\). Equivalent to training an exponential number of sub-networks and averaging.
- **Batch normalization**: normalize activations within each mini-batch; reduces internal covariate shift and accelerates training.
- **Weight decay**: \(L_2\) regularization on weights; equivalent to a Gaussian prior in Bayesian terms.
- **Early stopping**: stop training when validation loss starts increasing.

---

# Chapter 6: Supervised and Unsupervised Learning

## Section 6.1: Classification and Regression

**Supervised learning** has labeled training data. Loss functions:
- **Classification**: cross-entropy loss \(-\sum_i y_i \log \hat{p}_i\).
- **Regression**: mean squared error \(\frac{1}{N}\sum_i (y_i - \hat{y}_i)^2\).

**Convolutional neural networks (CNNs)**: exploit spatial translational invariance via shared filter kernels. Dominant for image classification, materials property prediction from crystal structures.

## Section 6.2: Unsupervised Learning

**Unsupervised learning** discovers structure in unlabeled data.

**Clustering**: K-means minimizes within-cluster variance; assigns each point to the nearest centroid.

**Principal Component Analysis (PCA)**: linear dimensionality reduction by projecting onto the top eigenvectors of the data covariance matrix (equivalent to the SVD, Chapter 2).

**Autoencoders**: neural networks trained to reconstruct their input through a bottleneck. The encoder \(z = f(\mathbf{x})\) learns a compressed representation; the decoder \(\hat{\mathbf{x}} = g(z)\) reconstructs the input.

---

# Chapter 7: Generative Models

## Section 7.1: Variational Autoencoders (VAEs)

The **VAE** (Kingma & Welling, 2014) is a generative model that learns a latent variable model \(p_\theta(\mathbf{x}) = \int p_\theta(\mathbf{x}|z) p(z) dz\). Training maximizes the **Evidence Lower Bound (ELBO)**:

\[
\mathcal{L}_{\text{ELBO}} = \mathbb{E}_{q_\phi(z|\mathbf{x})}[\log p_\theta(\mathbf{x}|z)] - D_{KL}(q_\phi(z|\mathbf{x}) \| p(z)),
\]

where \(q_\phi(z|\mathbf{x})\) is the encoder (approximate posterior) and \(p_\theta(\mathbf{x}|z)\) is the decoder (generative model). The KL term regularizes the latent space to be compact.

## Section 7.2: Generative Adversarial Networks (GANs)

GANs (Goodfellow et al., 2014) train two networks simultaneously:
- **Generator** \(G_\theta\): maps random noise \(\mathbf{z} \sim p(\mathbf{z})\) to samples in data space.
- **Discriminator** \(D_\phi\): classifies inputs as real or generated.

The adversarial training objective:

\[
\min_G \max_D \mathbb{E}_{\mathbf{x} \sim p_{\text{data}}}[\log D(\mathbf{x})] + \mathbb{E}_{\mathbf{z} \sim p(\mathbf{z})}[\log(1 - D(G(\mathbf{z})))].
\]

At Nash equilibrium, \(G\) produces samples indistinguishable from real data: \(p_G = p_{\text{data}}\).

---

# Chapter 8: Hopfield Networks, RBMs, and Energy-Based Models

## Section 8.1: Hopfield Networks

The **Hopfield network** (Hopfield, 1982) is a recurrent network of \(N\) binary neurons \(s_i \in \{-1, +1\}\) with symmetric weights \(W_{ij}\). The energy function is:

\[
E(\mathbf{s}) = -\frac{1}{2} \sum_{i \neq j} W_{ij} s_i s_j.
\]

This is exactly the Ising Hamiltonian with \(J_{ij} = W_{ij}\)!

The network stores patterns via **Hebbian learning**: \(W_{ij} = \frac{1}{N}\sum_\mu \xi_i^\mu \xi_j^\mu\), where \(\{\boldsymbol{\xi}^\mu\}\) are the patterns to be stored. Retrieval proceeds by updating spins to minimize energy:

\[
s_i \leftarrow \mathrm{sign}\!\left(\sum_j W_{ij} s_j\right).
\]

The energy decreases monotonically with updates, so the network converges to a local minimum — an attractor corresponding to a stored pattern (or a spurious state).

## Section 8.2: Restricted Boltzmann Machines

An **RBM** is a bipartite energy-based model with visible units \(\mathbf{v} \in \{0,1\}^n\) and hidden units \(\mathbf{h} \in \{0,1\}^m$, with energy:

\[
E(\mathbf{v}, \mathbf{h}) = -\mathbf{a}^T \mathbf{v} - \mathbf{b}^T \mathbf{h} - \mathbf{v}^T W \mathbf{h}.
\]

The joint distribution is \(p(\mathbf{v}, \mathbf{h}) = Z^{-1} e^{-E(\mathbf{v},\mathbf{h})}\). Since the graph is bipartite, the conditional distributions factorize:

\[
p(h_j=1|\mathbf{v}) = \sigma\!\left(b_j + \sum_i v_i W_{ij}\right), \quad p(v_i=1|\mathbf{h}) = \sigma\!\left(a_i + \sum_j W_{ij} h_j\right).
\]

Training maximizes the log-likelihood of the data:

\[
\mathcal{L} = \sum_{\mathbf{v} \in \mathcal{D}} \log p(\mathbf{v}) = \sum_{\mathbf{v}} \left[\log \sum_\mathbf{h} e^{-E(\mathbf{v},\mathbf{h})} - \log Z\right].
\]

The gradient involves the model's own expected statistics:

\[
\nabla_{W_{ij}} \mathcal{L} = \langle v_i h_j \rangle_{\text{data}} - \langle v_i h_j \rangle_{\text{model}}.
\]

The data term is tractable (one Gibbs pass); the model term requires MCMC sampling (Contrastive Divergence approximation).

**Connection to physics**: the RBM is formally identical to an Ising model on a bipartite graph. RBMs have been used as neural quantum states (Carleo & Troyer, 2017) to represent quantum many-body wave functions.

---

# Chapter 9: Autoregressive Models

## Section 9.1: Autoregressive Decomposition

Any joint distribution can be factored by the chain rule:

\[
p(\mathbf{x}) = p(x_1) \prod_{i=2}^n p(x_i | x_1, \ldots, x_{i-1}).
\]

An **autoregressive model** parameterizes each conditional \(p_\theta(x_i | x_{<i})\) with a neural network. This enables exact likelihood computation and sampling.

**PixelCNN**: applies this idea to images, modeling pixels left-to-right and top-to-bottom using masked convolutions.

**Autoregressive neural quantum states**: model the wave function \(\psi(\mathbf{s}) = \langle \mathbf{s}|\psi\rangle\) of a quantum system using an autoregressive network. Enables direct sampling from \(|\psi(\mathbf{s})|^2\) without MCMC.

---

# Chapter 10: Recurrent Neural Networks and Transformers

## Section 10.1: Recurrent Neural Networks

A **vanilla RNN** processes a sequence \(\mathbf{x}_1, \ldots, \mathbf{x}_T\) by maintaining a hidden state:

\[
\mathbf{h}_t = \sigma(W_h \mathbf{h}_{t-1} + W_x \mathbf{x}_t + \mathbf{b}).
\]

**Long Short-Term Memory (LSTM)**: solves the vanishing gradient problem with gated memory cells that can maintain information across long sequences.

## Section 10.2: The Transformer

The **Transformer** (Vaswani et al., 2017) processes sequences using **self-attention** rather than recurrence. For a sequence of embeddings \(\{Q, K, V\}\):

\[
\text{Attention}(Q, K, V) = \mathrm{softmax}\!\left(\frac{QK^T}{\sqrt{d_k}}\right) V.
\]

Self-attention computes pairwise interactions between all positions — \(O(n^2)\) complexity — but can be parallelized across the sequence dimension.

**Physical analogy**: self-attention is related to the interaction energy in a many-body system. The query-key dot product measures "compatibility" between positions, analogous to pairwise coupling in a spin model.

---

# Chapter 11: Diffusion Models and Normalizing Flows

## Section 11.1: Diffusion Models

**Denoising Diffusion Probabilistic Models (DDPMs)** (Ho et al., 2020) learn to reverse a gradual noising process.

**Forward process**: gradually add Gaussian noise to data over \(T\) steps:

\[
q(\mathbf{x}_t | \mathbf{x}_{t-1}) = \mathcal{N}(\mathbf{x}_t; \sqrt{1-\beta_t}\,\mathbf{x}_{t-1}, \beta_t I).
\]

After \(T\) steps, \(\mathbf{x}_T \approx \mathcal{N}(0, I)\).

**Reverse process**: learn a neural network \(\boldsymbol{\epsilon}_\theta(\mathbf{x}_t, t)\) that predicts the noise added at step \(t\). Sampling generates data by iteratively denoising from pure noise.

**Connection to statistical mechanics**: the forward diffusion process is an Ornstein-Uhlenbeck process (Langevin dynamics); the reverse process is trained to denoise, analogous to score-based generative models that estimate the score function \(\nabla_\mathbf{x} \log p(\mathbf{x})\).

## Section 11.2: Normalizing Flows

**Normalizing flows** model a complex distribution \(p(\mathbf{x})\) by applying a sequence of invertible transformations \(f_1, \ldots, f_K\) to a simple base distribution \(p_0(\mathbf{z})\):

\[
\mathbf{x} = f_K \circ \cdots \circ f_1(\mathbf{z}), \quad \mathbf{z} \sim p_0(\mathbf{z}).
\]

By the change-of-variables formula:

\[
\log p(\mathbf{x}) = \log p_0(\mathbf{z}) - \sum_{k=1}^K \log\left|\det \frac{\partial f_k}{\partial \mathbf{z}_k}\right|.
\]

The Jacobian determinant must be efficiently computable; this is achieved with **affine coupling layers** (RealNVP, Glow). Flows give exact likelihoods and allow exact inference, in contrast to VAEs and GANs.

---

# Chapter 12: Machine Learning for Quantum Physics

## Section 12.1: Neural Quantum States

Carleo and Troyer (2017) proposed representing the many-body wave function \(\Psi(\mathbf{s})\) using a neural network. For a spin-1/2 system with \(N\) spins, the Hilbert space has \(2^N\) dimensions — exponentially large. A neural network can represent approximate ground states compactly.

The **Restricted Boltzmann Machine ansatz**:

\[
\Psi(\mathbf{s}) = e^{\sum_i a_i s_i} \prod_j \cosh\!\left(b_j + \sum_i W_{ij} s_i\right).
\]

Training minimizes the variational energy \(E = \langle \Psi | H | \Psi \rangle / \langle \Psi | \Psi \rangle\) using stochastic reconfiguration (a natural gradient method adapted for quantum wave functions).

## Section 12.2: Machine Learning for Phase Transitions

**Supervised**: train a CNN to classify spin configurations as ordered/disordered. The classifier's output (confidence) serves as an order parameter, automatically locating the phase transition.

**Unsupervised**: apply PCA or autoencoders to spin configurations across temperatures. The dominant principal component captures the order parameter; anomalous changes in the latent representation signal phase transitions.

**Confusion scheme** (van Nieuwenburg et al., 2017): train a binary classifier to distinguish "low T" and "high T" configurations while varying the boundary. The classification accuracy as a function of boundary position peaks at the critical temperature.

## Section 12.3: Quantum Machine Learning

**Variational quantum circuits**: parameterized quantum circuits trained with classical optimizers (variational quantum eigensolver, QAOA). Related to deep learning on quantum hardware.

**Barren plateaus**: a fundamental obstacle — the gradients of variational quantum circuits vanish exponentially with system size (in analogy with vanishing gradients in deep networks), making training intractable at large scales.
