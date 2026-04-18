---
title: "PHYS 449: Machine Learning in Physics"
prof: "Roger Melko"
subjects: "PHYS"
---

## Sources and References

**Primary references**
- I. Goodfellow, Y. Bengio, and A. Courville, *Deep Learning* (MIT Press, 2016) — deeplearningbook.org
- K. Murphy, *Probabilistic Machine Learning: An Introduction* (MIT Press, 2022) — probml.github.io/pml-book/book1.html
- C. Bishop, *Pattern Recognition and Machine Learning* (Springer, 2006)
- K. Murphy, *Probabilistic Machine Learning: Advanced Topics* (MIT Press, 2023)

**Physics-specific references**
- J. Carrasquilla and R. G. Melko, "Machine learning phases of matter," *Nature Physics* 13 (2017), 431–434
- P. Mehta et al., "A high-bias, low-variance introduction to machine learning for physicists," *Physics Reports* 810 (2019), 1–124
- G. Carleo and M. Troyer, "Solving the quantum many-body problem with artificial neural networks," *Science* 355 (2017), 602–606
- G. Carleo et al., "Machine learning and the physical sciences," *Rev. Mod. Phys.* 91 (2019), 045002
- E. P. L. van Nieuwenburg, Y.-H. Liu, and S. D. Huber, "Learning phase transitions by confusion," *Nature Physics* 13 (2017), 435–439

**Online resources**
- Stanford CS229 materials — cs229.stanford.edu
- UBC CPSC 340/540 notes — cs.ubc.ca
- P. Mehta et al., "ML for physicists" review notes — physicsml.github.io

---

# Chapter 1: Learning Theory in Physics — Connections and Foundations

## Section 1.1: Why Physics and Machine Learning Share Deep Mathematical Structure

One of the most striking intellectual developments of the past decade is the realization that machine learning and statistical physics are not merely analogous fields — they are, in many ways, the same mathematics applied to different domains. Both disciplines are fundamentally concerned with inference: given some observed data (a set of configurations, experimental measurements, or labeled examples), what can we infer about the underlying system that generated them? Both frame this question probabilistically, and both lean on the same toolkit of exponential families, entropy, and optimization over high-dimensional spaces.

The connection runs deeper than surface analogy. The Boltzmann distribution, which describes the probability of a physical microstate in thermal equilibrium, is formally identical to the softmax function used in classification neural networks. The partition function of statistical mechanics, which encodes all thermodynamic information about a system, is the same mathematical object as the normalizing constant that ensures a model's predicted probabilities sum to one. The free energy minimized by a thermodynamic system at fixed temperature is the same as the log-partition function that appears in variational inference. These are not coincidences — they reflect the fact that both fields are solving the same underlying problem: how to define a consistent probability distribution over a space of states given constraints on average quantities.

This course exploits this correspondence systematically. We will see that understanding the Ising model prepares us to understand Boltzmann machines; that renormalization group ideas from field theory illuminate why deep networks are so expressive; that variational Monte Carlo methods for quantum mechanics become natural gradient descent in disguise; and that the sign problem in quantum simulation has an analogue in the vanishing gradient problem of deep learning. The two fields sharpen each other.

<div class="definition">
<strong>The ML–Statistical Mechanics Correspondence Table</strong>

The following table summarizes the central dictionary between statistical mechanics and machine learning. Each entry represents a formal mathematical identification, not just an analogy.

| Statistical Mechanics | Machine Learning |
|---|---|
| Energy function \( E(\mathbf{s}) \) | Loss function / negative log-likelihood |
| Boltzmann distribution \( p(\mathbf{s}) \propto e^{-\beta E(\mathbf{s})} \) | Softmax / Gibbs distribution over classes |
| Partition function \( Z = \sum_\mathbf{s} e^{-\beta E(\mathbf{s})} \) | Normalizing constant of a probabilistic model |
| Free energy \( F = -\frac{1}{\beta}\log Z \) | Log-partition function; ELBO in variational inference |
| Entropy \( S = -\sum_i p_i \log p_i \) | Shannon entropy; cross-entropy loss |
| Phase transition | Abrupt change of regime in learning dynamics |
| Renormalization group (RG) | Hierarchical feature extraction in deep networks |
| Fixed point of RG flow | Convergence of learning to a trained representation |
| Correlation length \( \xi \) | Effective depth of feature dependencies |
</div>

The three learning paradigms — supervised, unsupervised, and reinforcement learning — all have natural physics counterparts. **Supervised learning** (given labeled examples, predict labels) is like curve-fitting to measured data points; in physics, this includes learning interatomic potentials from ab initio calculations. **Unsupervised learning** (discover structure in unlabeled data) maps onto identifying phases of matter from Monte Carlo configurations, or compressing quantum states into efficient representations. **Reinforcement learning** (an agent learns by interacting with an environment to maximize cumulative reward) connects to problems like quantum control and finding optimal measurement protocols.

## Section 1.2: Statistical Learning Theory

The central question of machine learning is: when does a model trained on finite data **generalize** to new examples? Statistical learning theory provides rigorous answers by carefully separating the training error from the true error.

<div class="definition">
<strong>Generalization Error (True Risk)</strong>

Given a loss function \( \ell \) and a model \( f_\theta \), the <em>true risk</em> or <em>generalization error</em> is the expected loss over the entire data-generating distribution \( p(\mathbf{x}, y) \):

\[
R[f] = \mathbb{E}_{(\mathbf{x},y) \sim p}\left[\ell\!\left(y,\, f(\mathbf{x})\right)\right].
\]

This is the quantity we ultimately care about, but it is unobservable because we do not know \( p \).
</div>

Because the true distribution is unknown, we estimate the true risk using the training data. The **empirical risk** is the average loss on the training set:

\[
\hat{R}[f] = \frac{1}{N}\sum_{i=1}^N \ell\!\left(y_i,\, f(\mathbf{x}_i)\right).
\]

The empirical risk is observable but optimistic — a sufficiently complex model can memorize the training data and achieve \( \hat{R} = 0 \) while still failing badly on new inputs. The gap \( R[f] - \hat{R}[f] \) is the **generalization gap**, and bounding it is the central problem of learning theory.

### Subsection 1.2.1: Bias-Variance-Noise Decomposition

To understand why models fail, it is illuminating to decompose the generalization error into three components. Assume we are doing regression with squared loss, and suppose the data is generated as \( y = f^*(\mathbf{x}) + \varepsilon \) where \( \varepsilon \sim \mathcal{N}(0, \sigma^2) \) is irreducible noise. Let \( \hat{f}_\mathcal{D} \) be the model trained on dataset \( \mathcal{D} \). We compute the expected loss over both the randomness in \( \mathcal{D} \) and in \( \varepsilon \):

\[
\mathbb{E}\!\left[(y - \hat{f}(\mathbf{x}))^2\right] = \mathbb{E}\!\left[(f^*(\mathbf{x}) + \varepsilon - \hat{f}(\mathbf{x}))^2\right].
\]

Expanding and using \( \mathbb{E}[\varepsilon] = 0 \) and independence:

\[
= \mathbb{E}\!\left[(f^*(\mathbf{x}) - \hat{f}(\mathbf{x}))^2\right] + \sigma^2.
\]

Now write \( f^*(\mathbf{x}) - \hat{f}(\mathbf{x}) = (f^*(\mathbf{x}) - \mathbb{E}[\hat{f}(\mathbf{x})]) + (\mathbb{E}[\hat{f}(\mathbf{x})] - \hat{f}(\mathbf{x})) \) and expand the square. The cross term vanishes, giving the full decomposition:

\[
\mathbb{E}\!\left[(y - \hat{f}(\mathbf{x}))^2\right] = \underbrace{\left(f^*(\mathbf{x}) - \mathbb{E}_\mathcal{D}[\hat{f}(\mathbf{x})]\right)^2}_{\text{Bias}^2} + \underbrace{\mathbb{E}_\mathcal{D}\!\left[(\hat{f}(\mathbf{x}) - \mathbb{E}_\mathcal{D}[\hat{f}(\mathbf{x})])^2\right]}_{\text{Variance}} + \underbrace{\sigma^2}_{\text{Noise}}.
\]

The **bias** measures systematic error: how far the average prediction is from the truth. A model that is too simple (e.g., linear when the truth is quadratic) has high bias regardless of how much data is available. The **variance** measures sensitivity to the particular training set: a model that is too complex memorizes training-specific patterns and produces wildly different outputs for different draws of \( \mathcal{D} \). The **noise** \( \sigma^2 \) is irreducible — it comes from inherent randomness in the labels and cannot be eliminated by any model. In practice, reducing bias (by increasing model complexity) increases variance, and vice versa. The art of machine learning consists largely in navigating this tradeoff.

### Subsection 1.2.2: PAC Learning and Sample Complexity

The Probably Approximately Correct (PAC) learning framework, due to Valiant (1984), asks: how many training examples are needed for a learning algorithm to produce a model that is probably approximately correct? Formally, a hypothesis class \( \mathcal{H} \) is PAC-learnable if there exists an algorithm such that for any distribution \( p \) and any target concept \( f^* \in \mathcal{H} \), given \( m \) samples with

\[
m \geq \frac{1}{\varepsilon}\left(\log|\mathcal{H}| + \log\frac{1}{\delta}\right),
\]

with probability at least \( 1 - \delta \) the algorithm outputs \( h \in \mathcal{H} \) with \( R[h] \leq R[f^*] + \varepsilon \). The key insight is that the sample complexity scales only logarithmically with the size of the hypothesis class. This is reassuring: even a hypothesis class containing \( 10^{100} \) possible functions can be learned reliably with only a few hundred examples, provided the class is finite.

For infinite hypothesis classes (such as all linear classifiers in \( \mathbb{R}^d \)), the relevant measure of complexity is the **VC dimension**, discussed next.

### Subsection 1.2.3: VC Dimension

<div class="definition">
<strong>VC Dimension</strong>

A hypothesis class \( \mathcal{H} \) of binary classifiers <em>shatters</em> a set of points \( \{x_1,\ldots,x_m\} \) if for every possible labeling \( (y_1,\ldots,y_m) \in \{0,1\}^m \), there exists some \( h \in \mathcal{H} \) that assigns exactly those labels. The <em>Vapnik-Chervonenkis (VC) dimension</em> of \( \mathcal{H} \) is the size of the largest set that \( \mathcal{H} \) can shatter:

\[
\mathrm{VC}(\mathcal{H}) = \max\{m : \mathcal{H} \text{ shatters some set of } m \text{ points}\}.
\]
</div>

As a concrete example, consider linear classifiers in \( \mathbb{R}^2 \) (lines through the plane). Any three points in general position (not collinear) can be shattered — for all \( 2^3 = 8 \) labelings, one can find a separating line. However, no four points in general position can always be shattered (there is always at least one labeling not achievable by a line). Therefore \( \mathrm{VC}(\text{linear classifiers in } \mathbb{R}^2) = 3 \). More generally, linear classifiers in \( \mathbb{R}^d \) have VC dimension \( d+1 \).

The Vapnik-Chervonenkis theorem bounds the generalization gap: with probability at least \( 1 - \delta \),

\[
R[h] \leq \hat{R}[h] + O\!\left(\sqrt{\frac{d\log(N/d) + \log(1/\delta)}{N}}\right),
\]

where \( d = \mathrm{VC}(\mathcal{H}) \) and \( N \) is the number of training examples. This bound shows that generalization improves as \( N \) grows and that the sample complexity scales roughly as \( N \sim d \), tying together model complexity and data requirements.

## Section 1.3: Information Theory

Information theory, developed by Claude Shannon in 1948, provides the mathematical language of learning. At its core, it quantifies how much "surprise" or "uncertainty" a probability distribution carries, and how to measure the distance between two distributions. These concepts underpin every part of machine learning, from loss functions to generative models.

### Subsection 1.3.1: Shannon Entropy

<div class="definition">
<strong>Shannon Entropy</strong>

For a discrete probability distribution \( p = (p_1,\ldots,p_k) \), the <em>Shannon entropy</em> is

\[
H(p) = -\sum_{i=1}^k p_i \log p_i = \mathbb{E}_{x \sim p}[-\log p(x)].
\]

Entropy is measured in nats when the logarithm is natural, and in bits when it is base 2. It is the expected amount of information gained upon observing a sample from \( p \), or equivalently the minimum expected number of bits needed to encode a sample.
</div>

Entropy is maximized by the uniform distribution (\( H = \log k \)) and minimized (to zero) by a deterministic distribution concentrated on a single outcome. In physics, entropy is the Gibbs entropy \( S = -k_B \sum_i p_i \ln p_i \), establishing the direct connection to thermodynamics. High-entropy distributions correspond to disordered states; low-entropy distributions to ordered ones.

### Subsection 1.3.2: KL Divergence and Its Non-Negativity

The Kullback-Leibler (KL) divergence measures how much one distribution differs from another. It arises naturally wherever we ask: given that the true distribution is \( p \), how much extra information do we waste by encoding samples as if they came from \( q \)?

\[
D_{KL}(p \| q) = \sum_i p_i \log \frac{p_i}{q_i}.
\]

A critical property is that \( D_{KL}(p \| q) \geq 0 \) with equality if and only if \( p = q \). This follows from **Jensen's inequality**: since \( \log \) is concave,

\[
-D_{KL}(p \| q) = \sum_i p_i \log \frac{q_i}{p_i} = \mathbb{E}_p\!\left[\log \frac{q}{p}\right] \leq \log \mathbb{E}_p\!\left[\frac{q}{p}\right] = \log \sum_i p_i \frac{q_i}{p_i} = \log 1 = 0.
\]

Multiplying through by \(-1\) gives \( D_{KL}(p\|q) \geq 0 \). Note that KL divergence is not symmetric: \( D_{KL}(p\|q) \neq D_{KL}(q\|p) \) in general, so it is not a true metric. This asymmetry has practical consequences in variational inference, where minimizing \( D_{KL}(q\|p) \) (the "reverse KL") tends to produce solutions that underestimate the support of \( p \), while minimizing \( D_{KL}(p\|q) \) (the "forward KL") produces mean-seeking behavior.

### Subsection 1.3.3: Cross-Entropy and Maximum Likelihood

The **cross-entropy** between two distributions is

\[
H(p, q) = -\sum_i p_i \log q_i = H(p) + D_{KL}(p \| q).
\]

Since \( H(p) \) does not depend on the model \( q \), minimizing cross-entropy over \( q \) is equivalent to minimizing KL divergence. When \( p \) is the empirical distribution of the training labels and \( q_\theta \) is the model's predicted distribution, we get:

\[
\min_\theta H(p_\text{data}, q_\theta) \equiv \max_\theta \sum_{i=1}^N \log q_\theta(y_i | \mathbf{x}_i).
\]

This is exactly maximum likelihood estimation. The cross-entropy loss used ubiquitously in classification training is therefore not an arbitrary choice — it is the principled, information-theoretically optimal way to train a probabilistic classifier.

### Subsection 1.3.4: Mutual Information

The **mutual information** between two random variables \( X \) and \( Y \) measures how much knowing one reduces uncertainty about the other:

\[
I(X; Y) = D_{KL}(p(x,y) \| p(x)p(y)) = H(X) - H(X|Y) = H(Y) - H(Y|X).
\]

Mutual information is symmetric, always non-negative, and equals zero if and only if \( X \) and \( Y \) are independent. It appears in the information bottleneck principle — the idea that the optimal internal representation of a neural network should maximize information about the output while compressing information about the input — and in contrastive learning objectives.

---

# Chapter 2: The Ising Model — A Physical Introduction to Learning

## Section 2.1: The Ising Model — Hamiltonian and Boltzmann Distribution

The Ising model is the canonical model of a phase transition and one of the most important exactly solvable problems in statistical physics. It consists of \( N \) binary spins \( s_i \in \{-1, +1\} \) arranged on a lattice, interacting through nearest-neighbor couplings. The **Hamiltonian** (energy function) is:

\[
H(\mathbf{s}) = -J \sum_{\langle i,j \rangle} s_i s_j - h \sum_i s_i,
\]

where \( J > 0 \) is the ferromagnetic coupling constant (neighboring aligned spins lower the energy), \( h \) is an external magnetic field, and \( \langle i,j \rangle \) denotes summation over nearest-neighbor pairs. For \( J > 0 \) and \( h = 0 \), the energy is minimized when all spins align, giving a ferromagnetic ground state.

At nonzero temperature \( T \), the system explores its configuration space according to the **Boltzmann distribution**:

\[
p(\mathbf{s}) = \frac{1}{Z} e^{-\beta H(\mathbf{s})}, \qquad Z = \sum_{\mathbf{s}} e^{-\beta H(\mathbf{s})}, \qquad \beta = \frac{1}{k_B T}.
\]

The partition function \( Z \) normalizes the distribution and encodes all thermodynamic information: the free energy is \( F = -k_B T \ln Z \), the internal energy is \( U = -\partial \ln Z / \partial \beta \), and the specific heat is \( C = \partial U / \partial T \). Computing \( Z \) exactly requires summing \( 2^N \) terms, which is exponentially hard in general — a difficulty that has a direct analogue in the intractability of computing normalizing constants in machine learning models.

## Section 2.2: Phase Transition and Critical Phenomena

The 2D Ising model on the square lattice is one of the few nontrivial models with an exactly known phase transition. Lars Onsager solved it in 1944, showing that the free energy is singular at the critical temperature:

\[
T_c = \frac{2J}{k_B \ln(1 + \sqrt{2})} \approx 2.269 \, J/k_B.
\]

For \( T < T_c \), the system is in a **ferromagnetic phase**: even in the absence of an external field, the system spontaneously magnetizes to some nonzero value \( \langle M \rangle \neq 0 \). The symmetry \( s_i \to -s_i \) (which is a symmetry of the Hamiltonian when \( h=0 \)) is spontaneously broken. For \( T > T_c \), thermal fluctuations destroy long-range order and \( \langle M \rangle = 0 \): this is the **paramagnetic phase**. Exactly at \( T_c \), the system is at a continuous phase transition characterized by scale-invariant fluctuations.

The order parameter \( m = \langle M \rangle / N \) vanishes as \( T \to T_c^- \) with a power law:

\[
m \sim (T_c - T)^\beta, \quad \beta = 1/8.
\]

Other thermodynamic quantities also diverge as power laws, characterized by **critical exponents**. The magnetic susceptibility \( \chi \sim |T - T_c|^{-\gamma} \) with \( \gamma = 7/4 \), and the correlation length \( \xi \sim |T - T_c|^{-\nu} \) with \( \nu = 1 \). The spin-spin correlation function at \( T_c \) decays as a power law: \( \langle s_i s_j \rangle \sim |i-j|^{-(d-2+\eta)} \) with \( \eta = 1/4 \), in contrast to the exponential decay \( e^{-|i-j|/\xi} \) away from \( T_c \). The divergence of the correlation length signals that fluctuations occur on all length scales simultaneously — the defining feature of criticality.

**Universality** is perhaps the most important concept in the theory of phase transitions: different physical systems with the same symmetry and dimensionality have identical critical exponents, regardless of their microscopic details. The 2D Ising universality class includes many different systems — water near its liquid-gas critical point, binary alloys, uniaxial ferromagnets — that share \( \beta = 1/8 \), \( \gamma = 7/4 \), \( \nu = 1 \). Universality is explained by the renormalization group.

## Section 2.3: Renormalization Group

The renormalization group (RG) is a systematic framework for understanding how physics changes as we change the scale of observation. In the block-spin RG of Kadanoff, we coarse-grain the lattice: replace each block of \( b^d \) spins with a single effective spin representing their average. The result is a new effective Hamiltonian for the coarse-grained spins, with renormalized coupling constants. Iterating this procedure defines a flow in the space of Hamiltonians.

Fixed points of this flow are special: they are Hamiltonians that are unchanged by coarse-graining, which means the system looks the same at all scales — a hallmark of criticality. The Ising critical point is an unstable fixed point of the RG flow. Perturbations away from the fixed point flow toward the stable fixed points (the ordered and disordered phases). The critical exponents are determined by the eigenvalues of the linearized RG transformation near the fixed point.

The connection to deep learning is profound. A deep neural network performs a sequence of transformations: raw input features at the first layer are progressively coarse-grained into higher-level abstract representations at deeper layers. This is formally analogous to the RG coarse-graining procedure. Mehta and Schwab (2014) made this precise for a specific class of networks, showing that the weights learned by a Restricted Boltzmann Machine on Ising configurations approximate the RG decimation procedure. While the full equivalence does not extend to all network architectures, the analogy provides genuine insight into why depth is useful: each layer extracts features at a different scale, just as each RG step extracts the relevant degrees of freedom at a new length scale.

## Section 2.4: Monte Carlo Methods and Simulated Annealing

To generate configurations distributed according to the Boltzmann distribution — essential for computing thermodynamic averages — we use Markov Chain Monte Carlo (MCMC) methods.

<div class="definition">
<strong>Metropolis-Hastings Algorithm</strong>

Given the current configuration \( \mathbf{s} \), the Metropolis-Hastings algorithm proceeds as:
<ol>
<li>Propose a new configuration \( \mathbf{s}' \) by flipping a randomly chosen spin.</li>
<li>Compute the energy change: \( \Delta E = H(\mathbf{s}') - H(\mathbf{s}) \).</li>
<li>Accept the proposal with probability \( A = \min(1,\, e^{-\beta \Delta E}) \).</li>
<li>If accepted, set \( \mathbf{s} \leftarrow \mathbf{s}' \); otherwise keep \( \mathbf{s} \).</li>
</ol>
</div>

The Metropolis algorithm satisfies **detailed balance**: the probability of transitioning from \( \mathbf{s} \) to \( \mathbf{s}' \) times \( p(\mathbf{s}) \) equals the reverse transition probability times \( p(\mathbf{s}') \). This ensures the Markov chain has the Boltzmann distribution as its stationary distribution. Near the critical temperature, however, the correlation length \( \xi \) diverges and the Metropolis algorithm suffers from **critical slowing down**: successive configurations are highly correlated, and the autocorrelation time \( \tau \sim \xi^z \) with \( z \approx 2 \). The **Wolff cluster algorithm** circumvents this by flipping entire clusters of spins at once, reducing the dynamical exponent to \( z \approx 0.25 \).

**Simulated annealing** adapts the Metropolis algorithm to global optimization. The idea is to start at high temperature (where the system explores freely) and gradually reduce the temperature according to an **annealing schedule**, analogous to slowly cooling a metal to allow it to settle into a low-energy crystalline state. If the temperature is reduced slowly enough, the system converges to the global minimum rather than becoming trapped in a local minimum. Simulated annealing is a powerful heuristic for combinatorial optimization problems such as the travelling salesman problem.

## Section 2.5: Machine Learning Applied to the Ising Model

The Ising model serves as the ideal benchmark for ML methods in physics: it has a known exact solution, tunable complexity, and can generate labeled training data (ordered vs. disordered) at low cost. Carrasquilla and Melko (2017) demonstrated that a simple feedforward neural network, trained on Ising configurations as images with binary labels (ordered/disordered), learns to identify the phase transition with high accuracy. The network's output — the predicted probability of being in the ordered phase — serves as a learned order parameter that drops sharply near \( T_c \). Crucially, the network achieves this without any knowledge of the magnetization formula; it discovers the relevant order parameter autonomously.

The **confusion scheme** of van Nieuwenburg, Liu, and Huber (2017) extends this to *unsupervised* phase detection. Instead of providing true labels, the scheme trains a classifier to distinguish "group A" from "group B" while systematically varying the boundary \( T^*  \) that defines which configurations belong to which group. When the proposed boundary coincides with the true transition temperature, the classifier can do the best job (since the two groups genuinely differ). When the boundary is far from \( T_c \), the classifier performs poorly because both groups contain a mix of ordered and disordered configurations. Plotting classification accuracy vs. \( T^* \) reveals a characteristic W-shaped or peak-shaped curve whose extremum locates the true \( T_c \) — without ever providing the true labels.

---

# Chapter 3: Linear Models for Regression and Classification

## Section 3.1: Linear Regression

Linear regression is the foundational supervised learning algorithm: it assumes the target \( y \in \mathbb{R} \) is a linear function of the input features \( \mathbf{x} \in \mathbb{R}^d \) plus noise:

\[
y = \mathbf{w}^T \mathbf{x} + b + \varepsilon, \qquad \varepsilon \sim \mathcal{N}(0, \sigma^2).
\]

The **Ordinary Least Squares (OLS)** estimator minimizes the sum of squared residuals over the training set. Collecting the \( N \) training examples into a design matrix \( X \in \mathbb{R}^{N \times d} \) and target vector \( \mathbf{y} \in \mathbb{R}^N \), the loss is:

\[
\mathcal{L}(\mathbf{w}) = \|X\mathbf{w} - \mathbf{y}\|^2.
\]

Setting the gradient to zero gives the **normal equations**:

\[
\nabla_\mathbf{w} \mathcal{L} = 2X^T(X\mathbf{w} - \mathbf{y}) = 0 \implies \hat{\mathbf{w}} = (X^T X)^{-1} X^T \mathbf{y}.
\]

The matrix \( X^+ = (X^T X)^{-1} X^T \) is the Moore-Penrose pseudoinverse of \( X \). This is the unique minimizer provided \( X^T X \) is invertible, which requires \( N \geq d \) and no perfectly collinear features.

The **probabilistic interpretation** makes the connection to maximum likelihood precise. If we assume the Gaussian noise model above, then the likelihood of the data given \( \mathbf{w} \) is

\[
p(\mathbf{y} | X, \mathbf{w}) = \prod_{i=1}^N \mathcal{N}(y_i; \mathbf{w}^T \mathbf{x}_i, \sigma^2) \propto \exp\!\left(-\frac{1}{2\sigma^2}\|X\mathbf{w} - \mathbf{y}\|^2\right).
\]

Maximizing this log-likelihood over \( \mathbf{w} \) is exactly equivalent to minimizing the MSE loss. In other words, OLS linear regression is maximum likelihood estimation under a Gaussian noise assumption.

## Section 3.2: Ridge Regression and the Bayesian View

When the number of features \( d \) is large relative to \( N \), or when features are nearly collinear, the OLS estimate has high variance: small changes in the training data lead to wildly different estimates of \( \mathbf{w} \). Ridge regression (also called Tikhonov regularization) adds an \( L_2 \) penalty on the weights to shrink them toward zero:

\[
\mathcal{L}_\text{ridge}(\mathbf{w}) = \|X\mathbf{w} - \mathbf{y}\|^2 + \lambda \|\mathbf{w}\|^2.
\]

The regularized solution is:

\[
\hat{\mathbf{w}}_\text{ridge} = (X^T X + \lambda I)^{-1} X^T \mathbf{y}.
\]

Adding \( \lambda I \) to \( X^T X \) ensures the matrix is invertible even when \( X^T X \) is rank-deficient. As \( \lambda \to 0 \), we recover OLS; as \( \lambda \to \infty \), \( \hat{\mathbf{w}} \to 0 \). Increasing \( \lambda \) reduces variance at the cost of increasing bias — a direct instantiation of the bias-variance tradeoff.

The **Bayesian interpretation** of ridge regression is elegant and illuminating. Suppose we place a Gaussian prior on the weights: \( p(\mathbf{w}) = \mathcal{N}(\mathbf{0}, \lambda^{-1}I) \). The posterior distribution is:

\[
p(\mathbf{w} | X, \mathbf{y}) \propto p(\mathbf{y} | X, \mathbf{w}) \cdot p(\mathbf{w}).
\]

Taking the logarithm and maximizing (MAP estimation) yields exactly the ridge regression objective, with \( \lambda = \sigma^2 / \tau^2 \) where \( \tau^2 \) is the prior variance. Ridge regression is therefore the maximum-a-posteriori estimate under a Gaussian prior.

## Section 3.3: Lasso and Sparse Solutions

The Lasso (Least Absolute Shrinkage and Selection Operator) replaces the \( L_2 \) penalty with an \( L_1 \) penalty:

\[
\mathcal{L}_\text{lasso}(\mathbf{w}) = \|X\mathbf{w} - \mathbf{y}\|^2 + \lambda \|\mathbf{w}\|_1, \qquad \|\mathbf{w}\|_1 = \sum_j |w_j|.
\]

The key property of the Lasso is that it induces **sparsity**: many coefficients are set exactly to zero, effectively performing automatic feature selection. The geometric reason is straightforward. The constraint region \( \|\mathbf{w}\|_1 \leq t \) is a diamond (hypercube rotated 45°) whose corners lie on the coordinate axes. When the elliptical contours of the OLS loss intersect this diamond, they are far more likely to touch at a corner — where one or more coordinates are exactly zero — than at a smooth point on the boundary. The \( L_2 \) constraint ball has no corners, so it does not produce exact zeros. For physical applications where only a small number of physical features are relevant (e.g., identifying the relevant terms in a Hamiltonian from data), the Lasso's sparsity is a crucial advantage.

## Section 3.4: Logistic Regression

Logistic regression extends linear modeling to binary classification (\( y \in \{0, 1\} \)). We model the probability of the positive class as a sigmoid function of a linear combination of features:

\[
p(y=1|\mathbf{x}) = \sigma(\mathbf{w}^T \mathbf{x} + b) = \frac{1}{1 + e^{-(\mathbf{w}^T \mathbf{x} + b)}}.
\]

The sigmoid \( \sigma(z) = 1/(1+e^{-z}) \) maps any real value to \( (0,1) \), making it interpretable as a probability. Training minimizes the **binary cross-entropy loss** (negative log-likelihood of the Bernoulli model):

\[
\mathcal{L} = -\sum_{i=1}^N \left[y_i \log \hat{p}_i + (1-y_i)\log(1-\hat{p}_i)\right].
\]

Computing the gradient: \( \nabla_\mathbf{w} \mathcal{L} = \sum_i (\hat{p}_i - y_i) \mathbf{x}_i \). This has the elegant form: gradient = (prediction error) × (input), summed over all training examples. There is no closed-form solution for logistic regression (unlike linear regression), so we rely on iterative gradient-based methods.

## Section 3.5: Softmax Regression and the Boltzmann Connection

For multi-class classification (\( y \in \{1,\ldots,K\} \)), softmax regression models:

\[
p(y=k|\mathbf{x}) = \frac{e^{\mathbf{w}_k^T \mathbf{x} + b_k}}{\sum_{j=1}^K e^{\mathbf{w}_j^T \mathbf{x} + b_j}}.
\]

This is formally identical to the Boltzmann distribution with "energy" \( E_k(\mathbf{x}) = -\mathbf{w}_k^T \mathbf{x} - b_k \) and inverse temperature \( \beta = 1 \). The partition function \( \sum_j e^{\mathbf{w}_j^T \mathbf{x}} \) plays the same normalizing role as in statistical mechanics. This is not an accident: softmax regression is the maximum-entropy model subject to linear constraints on feature expectations, and the Boltzmann distribution is the maximum-entropy distribution subject to a constraint on the expected energy. Both arise from the same variational principle.

## Section 3.6: Overfitting, Model Selection, and Cross-Validation

A central practical challenge is choosing model complexity. Training error decreases monotonically as model complexity increases (a sufficiently complex model can fit any training set perfectly), but the test error first decreases then increases — the classic U-shaped curve. The minimum of the test error curve defines the optimal complexity, and the gap between training and test error at this point is the generalization gap.

**K-fold cross-validation** provides a principled way to estimate generalization error without a held-out test set. The training data is split into \( K \) equal folds. For each fold \( k \), a model is trained on the other \( K-1 \) folds and evaluated on fold \( k \). The cross-validation error is the average over all folds. This procedure reduces the variance of the generalization estimate (by using more data for both training and evaluation) at the cost of \( K \) times the computational expense. Common choices are \( K = 5 \) or \( K = 10 \).

---

# Chapter 4: Convex Optimization

## Section 4.1: Convexity and Why It Matters

A function \( f: \mathbb{R}^d \to \mathbb{R} \) is **convex** if for all \( \mathbf{x}, \mathbf{y} \in \mathbb{R}^d \) and \( t \in [0,1] \):

\[
f(t\mathbf{x} + (1-t)\mathbf{y}) \leq t f(\mathbf{x}) + (1-t)f(\mathbf{y}).
\]

Geometrically, the function lies below the chord connecting any two of its points. Convexity is the key structural property that guarantees any local minimum is a global minimum: if we find a point where the gradient is zero, we know we have found the best possible solution. For machine learning, this means convex losses (like the MSE for linear regression or the cross-entropy for logistic regression) can be minimized to global optimality by gradient-based methods. Non-convex losses (as arise in neural networks) have many local minima and saddle points, making optimization far more challenging.

A function is **strongly convex** with parameter \( \mu > 0 \) if \( f(\mathbf{y}) \geq f(\mathbf{x}) + \nabla f(\mathbf{x})^T(\mathbf{y}-\mathbf{x}) + \frac{\mu}{2}\|\mathbf{y}-\mathbf{x}\|^2 \) for all \( \mathbf{x}, \mathbf{y} \). Strong convexity implies that the function grows at least quadratically away from its minimum, which greatly accelerates convergence.

## Section 4.2: Gradient Descent and Convergence

**Gradient descent** is the simplest first-order optimization method:

\[
\boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} - \eta \nabla_\theta \mathcal{L}(\boldsymbol{\theta}^{(k)}),
\]

where \( \eta > 0 \) is the learning rate. For a convex function with Lipschitz-continuous gradient (constant \( L \)) and step size \( \eta \leq 1/L \), gradient descent satisfies:

\[
\mathcal{L}(\boldsymbol{\theta}^{(k)}) - \mathcal{L}^* \leq \frac{\|\boldsymbol{\theta}^{(0)} - \boldsymbol{\theta}^*\|^2}{2\eta k},
\]

which is an \( O(1/k) \) convergence rate. For strongly convex functions with parameter \( \mu \), the convergence is exponential (linear convergence):

\[
\mathcal{L}(\boldsymbol{\theta}^{(k)}) - \mathcal{L}^* \leq \left(1 - \frac{\mu}{L}\right)^k \!\left(\mathcal{L}(\boldsymbol{\theta}^{(0)}) - \mathcal{L}^*\right).
\]

The ratio \( \kappa = L/\mu \) is the **condition number**. When \( \kappa \gg 1 \) (ill-conditioned problem), convergence is slow because the gradient points in a direction that is suboptimal relative to the curvature of the loss surface.

## Section 4.3: Newton's Method and Second-Order Optimization

Newton's method uses second-order information — the **Hessian** \( H = \nabla^2 \mathcal{L} \) — to take a better step:

\[
\boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} - \left(\nabla^2 \mathcal{L}(\boldsymbol{\theta}^{(k)})\right)^{-1} \nabla \mathcal{L}(\boldsymbol{\theta}^{(k)}).
\]

This corresponds to minimizing a local quadratic approximation of the loss. Newton's method has **quadratic convergence** near the minimum: the error \( \|\boldsymbol{\theta}^{(k)} - \boldsymbol{\theta}^*\| \) is squared at each step. The drawback is that computing and inverting the \( d \times d \) Hessian costs \( O(d^2) \) storage and \( O(d^3) \) computation — prohibitive for modern neural networks with \( d \sim 10^8 \) parameters.

## Section 4.4: Stochastic Gradient Descent

In large-scale machine learning, computing the full gradient over \( N \) training examples costs \( O(N) \) per step. **Stochastic gradient descent (SGD)** approximates the gradient using a single randomly chosen example (or a mini-batch of \( B \) examples):

\[
\boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} - \eta_k \hat{\nabla} \mathcal{L}(\boldsymbol{\theta}^{(k)}), \qquad \hat{\nabla} \mathcal{L} = \frac{1}{B}\sum_{i \in \mathcal{B}} \nabla_\theta \ell(y_i, f_\theta(\mathbf{x}_i)).
\]

The mini-batch gradient is an unbiased estimator of the full gradient: \( \mathbb{E}[\hat{\nabla}\mathcal{L}] = \nabla \mathcal{L} \). The variance of this estimate decreases as \( B \) increases, so larger mini-batches give more accurate gradient estimates but are more expensive per step.

**Mini-batch SGD** balances cost per step and gradient accuracy. A key subtlety: the noise inherent in SGD is not merely a drawback — it acts as an implicit regularizer. The noise helps the optimizer escape sharp minima (which generalize poorly) and find flatter regions of the loss landscape (which generalize better). This explains the empirical observation that SGD with small batch sizes often achieves better test performance than full-batch gradient descent.

**Convergence in expectation**: for SGD with learning rate \( \eta_k \) satisfying the Robbins-Monro conditions \( \sum_k \eta_k = \infty \) and \( \sum_k \eta_k^2 < \infty \) (e.g., \( \eta_k = \eta_0 / k \)), SGD converges to the optimum in expectation for convex problems. In practice, constant or piecewise-constant schedules with periodic reductions (step decay, cosine annealing) are commonly used.

## Section 4.5: Momentum and Nesterov Acceleration

Standard SGD oscillates in directions of high curvature and makes slow progress in directions of low curvature (think of a ravine: fast oscillations across the narrow width, slow progress along the valley). **Momentum** damps these oscillations by accumulating a velocity vector:

\[
\mathbf{v}^{(k+1)} = \mu \mathbf{v}^{(k)} - \eta \nabla \mathcal{L}(\boldsymbol{\theta}^{(k)}), \qquad \boldsymbol{\theta}^{(k+1)} = \boldsymbol{\theta}^{(k)} + \mathbf{v}^{(k+1)}.
\]

With momentum coefficient \( \mu \in [0,1) \), the velocity is an exponentially weighted average of past gradients. This accelerates convergence in consistent gradient directions while dampening oscillations. **Nesterov accelerated gradient** modifies momentum by computing the gradient at the "lookahead" position \( \boldsymbol{\theta} + \mu \mathbf{v} \) rather than the current position, achieving an optimal \( O(1/k^2) \) convergence rate for convex functions (vs. \( O(1/k) \) for standard gradient descent).

## Section 4.6: Adam Optimizer

**Adam** (Adaptive Moment Estimation, Kingma and Ba, 2015) combines momentum with adaptive per-parameter learning rates. It maintains exponentially moving averages of both the gradient (first moment) and the squared gradient (second moment):

\[
m_t = \beta_1 m_{t-1} + (1-\beta_1) g_t, \qquad v_t = \beta_2 v_{t-1} + (1-\beta_2) g_t^2,
\]

where \( g_t = \nabla_\theta \mathcal{L}_t \) is the mini-batch gradient. Since \( m_0 = v_0 = 0 \), the estimates are biased toward zero in early iterations. Adam corrects for this with **bias correction**:

\[
\hat{m}_t = \frac{m_t}{1-\beta_1^t}, \qquad \hat{v}_t = \frac{v_t}{1-\beta_2^t}.
\]

The parameter update is then:

\[
\theta_t = \theta_{t-1} - \frac{\eta}{\sqrt{\hat{v}_t} + \varepsilon} \hat{m}_t.
\]

Parameters with consistently large gradients receive smaller effective learning rates (since \( \sqrt{\hat{v}_t} \) is large), while parameters with small, noisy gradients receive larger effective rates. Typical values are \( \beta_1 = 0.9 \), \( \beta_2 = 0.999 \), \( \varepsilon = 10^{-8} \). Adam is the default optimizer for training deep neural networks because it requires minimal tuning of the learning rate.

## Section 4.7: SVRG and Variance Reduction

A fundamental limitation of SGD is that, even for strongly convex problems, the variance of the stochastic gradient forces the use of a diminishing learning rate — causing slow convergence. **Stochastic Variance Reduced Gradient (SVRG)** eliminates this limitation. The key idea is to periodically compute the full gradient \( \nabla \mathcal{L}(\tilde{\boldsymbol{\theta}}) \) at a snapshot \( \tilde{\boldsymbol{\theta}} \), then construct a control-variate corrected estimate:

\[
\tilde{g}_i = \nabla \ell_i(\boldsymbol{\theta}) - \nabla \ell_i(\tilde{\boldsymbol{\theta}}) + \nabla \mathcal{L}(\tilde{\boldsymbol{\theta}}).
\]

This estimate is unbiased (\( \mathbb{E}[\tilde{g}_i] = \nabla \mathcal{L}(\boldsymbol{\theta}) \)) and has variance that vanishes as \( \boldsymbol{\theta} \to \tilde{\boldsymbol{\theta}} \to \boldsymbol{\theta}^* \). This allows SVRG to use a constant learning rate and achieve the linear convergence rate of full gradient descent with per-step cost close to SGD.

## Section 4.8: Natural Gradient

The natural gradient is a second-order method adapted to the geometry of the statistical manifold. Standard gradient descent measures distance in parameter space using the Euclidean metric — but equal steps in parameter space may correspond to very different changes in the distribution \( p_\theta \). The **Fisher information matrix**

\[
F(\boldsymbol{\theta}) = \mathbb{E}_{x \sim p_\theta}\!\left[\nabla_\theta \log p_\theta(x)\, \nabla_\theta \log p_\theta(x)^T\right]
\]

is the natural Riemannian metric on the space of probability distributions. It measures the local sensitivity of the distribution to parameter changes: \( D_{KL}(p_\theta \| p_{\theta+d\theta}) \approx \frac{1}{2} d\theta^T F(\theta) d\theta \). The **natural gradient** replaces the Euclidean gradient with the Fisher-metric gradient:

\[
\tilde{\nabla}_\theta \mathcal{L} = F(\boldsymbol{\theta})^{-1} \nabla_\theta \mathcal{L}.
\]

The natural gradient update \( \boldsymbol{\theta} \leftarrow \boldsymbol{\theta} - \eta F^{-1} \nabla \mathcal{L} \) is invariant to reparameterization of the model — changing the parameterization does not change the effective update to the distribution. This is a significant advantage over ordinary gradient descent, which is coordinate-dependent. The natural gradient appears in quantum physics as the stochastic reconfiguration method (Chapter 13), and it reduces to Newton's method for exponential families where the Fisher matrix equals the Hessian of the log-likelihood.

---

# Chapter 5: Neural Networks

## Section 5.1: Feedforward Architecture

A **feedforward neural network** (also called a multilayer perceptron) maps an input \( \mathbf{x} \in \mathbb{R}^{d_0} \) to an output through a composition of layers:

\[
f(\mathbf{x}; \theta) = f^{(L)} \circ f^{(L-1)} \circ \cdots \circ f^{(1)}(\mathbf{x}),
\]

where the \( \ell \)-th layer applies an affine transformation followed by a pointwise nonlinearity:

\[
\mathbf{h}^{(\ell)} = \sigma\!\left(W^{(\ell)} \mathbf{h}^{(\ell-1)} + \mathbf{b}^{(\ell)}\right).
\]

The parameters \( \theta = \{W^{(\ell)}, \mathbf{b}^{(\ell)}\}_{\ell=1}^L \) are learned from data. The width (number of units per layer) and depth (number of layers \( L \)) together determine the network's expressive power.

The **Universal Approximation Theorem** (Cybenko, 1989; Hornik, 1991) states that a feedforward network with a single hidden layer of sufficient width, using a non-polynomial activation function, can approximate any continuous function on a compact domain to arbitrary precision. This result guarantees that, in principle, neural networks are sufficiently expressive. However, it does not address efficiency: representing certain functions with a shallow network may require exponentially many neurons, whereas a deep network can represent the same function with polynomially many. This is the theoretical motivation for depth.

Common **activation functions** include:
- **Sigmoid**: \( \sigma(z) = 1/(1+e^{-z}) \) — maps to \( (0,1) \); saturates for large \( |z| \), causing vanishing gradients.
- **Tanh**: \( \tanh(z) = 2\sigma(2z) - 1 \) — maps to \( (-1,1) \); zero-centered, better than sigmoid but still saturates.
- **ReLU** (Rectified Linear Unit): \( \mathrm{ReLU}(z) = \max(0, z) \) — does not saturate for positive inputs, computationally cheap; the dominant choice in modern networks.
- **Leaky ReLU / ELU**: variants of ReLU that avoid the "dying ReLU" problem (neurons permanently stuck at zero).

## Section 5.2: Backpropagation

Backpropagation is the algorithm for computing the gradient of the loss with respect to all parameters, by a single backward pass through the computational graph. It is nothing more than the chain rule of calculus applied systematically.

Define the pre-activation \( \mathbf{z}^{(\ell)} = W^{(\ell)}\mathbf{h}^{(\ell-1)} + \mathbf{b}^{(\ell)} \) and the error signal \( \boldsymbol{\delta}^{(\ell)} = \partial \mathcal{L} / \partial \mathbf{z}^{(\ell)} \).

**Forward pass**: compute \( \mathbf{h}^{(\ell)} = \sigma(\mathbf{z}^{(\ell)}) \) for \( \ell = 1, \ldots, L \) and the scalar loss \( \mathcal{L} \).

**Backward pass**: initialize \( \boldsymbol{\delta}^{(L)} = \partial \mathcal{L}/\partial \mathbf{z}^{(L)} \) (output layer gradient) and propagate backwards:

\[
\boldsymbol{\delta}^{(\ell)} = \left(W^{(\ell+1)}\right)^T \boldsymbol{\delta}^{(\ell+1)} \odot \sigma'(\mathbf{z}^{(\ell)}),
\]

where \( \odot \) is elementwise multiplication. The parameter gradients are then:

\[
\nabla_{W^{(\ell)}} \mathcal{L} = \boldsymbol{\delta}^{(\ell)} \left(\mathbf{h}^{(\ell-1)}\right)^T, \qquad \nabla_{\mathbf{b}^{(\ell)}} \mathcal{L} = \boldsymbol{\delta}^{(\ell)}.
\]

The computational cost of a backward pass is \( O(\text{number of parameters}) \), the same as a forward pass. This is what makes training neural networks feasible: gradient computation is not more expensive than evaluation.

## Section 5.3: Vanishing and Exploding Gradients

In deep networks, the error signal \( \boldsymbol{\delta}^{(\ell)} \) must propagate through many layers of the chain rule. At each layer, it is multiplied by \( W^{(\ell)T} \) and by \( \sigma'(\mathbf{z}^{(\ell)}) \). For a network of depth \( L \), the gradient at the first layer involves a product of \( L \) matrices:

\[
\frac{\partial \mathcal{L}}{\partial W^{(1)}} \propto \prod_{\ell=2}^{L} W^{(\ell)T} \mathrm{diag}(\sigma'(\mathbf{z}^{(\ell)})).
\]

If the spectral norms of these matrices are less than one, the gradient shrinks exponentially — the **vanishing gradient problem**. If they are greater than one, it grows exponentially — the **exploding gradient problem**. Both pathologies make training deep networks with simple gradient descent extremely difficult. The vanishing gradient problem is particularly severe for sigmoid and tanh activations, because \( |\sigma'(z)| \leq 1/4 \) and \( |\tanh'(z)| \leq 1 \), so the gradient shrinks at every layer. ReLU alleviates this for positive activations (since \( \mathrm{ReLU}'(z) = 1 \) for \( z > 0 \)), but "dead" ReLU units (stuck at zero) still cause problems.

## Section 5.4: Weight Initialization

Good initialization is crucial for avoiding vanishing/exploding gradients from the very start of training. The key idea is to choose weights so that the variance of the activations and the variance of the gradients are both preserved across layers.

Consider a layer with \( n_\text{in} \) inputs. If weights are drawn from a distribution with variance \( \sigma_w^2 \), then the variance of the pre-activation output is approximately \( n_\text{in} \sigma_w^2 \). For this to equal one (unit variance), we need:

**Xavier/Glorot initialization** (for sigmoid/tanh activations):

\[
\sigma_w^2 = \frac{2}{n_\text{in} + n_\text{out}},
\]

which is a compromise between preserving variance in the forward and backward passes. **He initialization** (for ReLU activations):

\[
\sigma_w^2 = \frac{2}{n_\text{in}},
\]

accounts for the fact that ReLU sets half its inputs to zero, halving the effective variance. Proper initialization makes the difference between a network that trains reliably and one that dies within a few gradient steps.

## Section 5.5: Convolutional Neural Networks

Convolutional Neural Networks (CNNs) exploit the structure of spatially organized data (images, lattice configurations) by replacing dense matrix multiplications with convolutions. A **convolutional layer** applies a learned filter \( k \) of size \( f \times f \) to the input:

\[
(X * k)[i,j] = \sum_{p,q} X[i+p, j+q]\, k[p,q].
\]

The same filter is applied at every spatial position — this is **weight sharing**, which dramatically reduces the number of parameters (from \( O(N^2) \) to \( O(f^2) \) per filter) and also endows the network with **translational equivariance**: if the input is shifted by \( (dx, dy) \), the output feature map shifts by the same amount. Multiple filters are used to detect different features; the outputs (feature maps) are stacked to form a 3D tensor for the next layer.

**Pooling layers** reduce spatial resolution by aggregating nearby activations (e.g., max-pooling takes the maximum over a \( 2 \times 2 \) region), building in invariance to small translations and reducing the number of activations. The **receptive field** of a unit at a deeper layer grows with depth: after \( L \) layers of convolution with \( 3 \times 3 \) filters, the receptive field has size \( (2L+1) \times (2L+1) \). CNNs have been directly applied to Ising configurations (treating the spin lattice as an image) for phase classification, and to crystal structures for predicting material properties.

## Section 5.6: Recurrent Neural Networks and LSTMs

**Recurrent Neural Networks (RNNs)** process sequential data by maintaining a hidden state \( \mathbf{h}_t \) that is updated at each time step:

\[
\mathbf{h}_t = \sigma\!\left(W_h \mathbf{h}_{t-1} + W_x \mathbf{x}_t + \mathbf{b}\right).
\]

The output at each step can depend on the entire history \( \mathbf{x}_1, \ldots, \mathbf{x}_t \) through the hidden state. However, training RNNs via backpropagation through time (BPTT) suffers from the same vanishing/exploding gradient problem as deep networks, since the gradient must propagate back through many recurrent steps.

The **Long Short-Term Memory (LSTM)** architecture (Hochschreider & Schmidhuber, 1997) resolves this by introducing a cell state \( \mathbf{c}_t \) and three learned gating mechanisms:

- **Forget gate**: \( \mathbf{f}_t = \sigma(W_f [\mathbf{h}_{t-1}, \mathbf{x}_t] + \mathbf{b}_f) \) — decides what to erase from the cell.
- **Input gate**: \( \mathbf{i}_t = \sigma(W_i [\mathbf{h}_{t-1}, \mathbf{x}_t] + \mathbf{b}_i) \) — decides what new information to write.
- **Output gate**: \( \mathbf{o}_t = \sigma(W_o [\mathbf{h}_{t-1}, \mathbf{x}_t] + \mathbf{b}_o) \) — decides what to read from the cell.

The cell update is \( \mathbf{c}_t = \mathbf{f}_t \odot \mathbf{c}_{t-1} + \mathbf{i}_t \odot \tilde{\mathbf{c}}_t \) and the hidden state is \( \mathbf{h}_t = \mathbf{o}_t \odot \tanh(\mathbf{c}_t) \). The cell state can carry information over many time steps with only multiplicative (gated) modifications, allowing gradients to flow without exponential decay.

## Section 5.7: Regularization Techniques

**Dropout** (Srivastava et al., 2014) randomly sets each neuron's activation to zero during training with probability \( p \), independently at each step. At test time, activations are scaled by \( (1-p) \) to preserve the expected value. Dropout can be interpreted as training an exponential ensemble of \( 2^n \) sub-networks (sharing parameters) and averaging their predictions — a form of Bayesian model averaging. The regularization effect comes from preventing neurons from co-adapting: each neuron must be useful on its own, not just in combination with specific other neurons.

**Batch normalization** (Ioffe and Szegedy, 2015) normalizes the pre-activations within each mini-batch before applying the nonlinearity. For a layer with pre-activations \( \{z_i^{(b)}\}_{b=1}^B \) over a mini-batch of size \( B \):

\[
\hat{z}_i^{(b)} = \frac{z_i^{(b)} - \mu_i}{\sqrt{\sigma_i^2 + \varepsilon}}, \qquad \mu_i = \frac{1}{B}\sum_b z_i^{(b)}, \quad \sigma_i^2 = \frac{1}{B}\sum_b (z_i^{(b)} - \mu_i)^2.
\]

Learnable scale and shift parameters \( \gamma_i, \beta_i \) restore the representational power: the output is \( \gamma_i \hat{z}_i + \beta_i \). Batch normalization reduces internal covariate shift (the change in the distribution of activations as parameters update), allowing larger learning rates and faster convergence. At inference, the running means and variances computed during training are used in place of mini-batch statistics.

---

# Chapter 6: Practical Aspects of Data-Driven Machine Learning

## Section 6.1: Train, Validation, and Test Splits

A robust ML workflow separates data into three disjoint sets with distinct roles. The **training set** is used to fit the model parameters via gradient descent. The **validation set** (or development set) is used to select hyperparameters (learning rate, regularization strength, architecture choices) and to monitor for overfitting during training. The **test set** is reserved for final evaluation and touched only once — at the end of the entire development cycle. This discipline is not merely pedantic: if the test set is used to guide any design decision, it becomes contaminated and the reported performance is optimistic.

**Data leakage** — inadvertent information flow from the validation or test set into the training process — is one of the most common sources of inflated performance estimates in applied ML. Examples include: normalizing features using statistics computed from the full dataset (including test examples), training on examples that overlap with test examples, or selecting features based on their correlation with test labels. Avoiding leakage requires treating every preprocessing step as part of the model that must be fit on training data alone.

## Section 6.2: Data Preprocessing

Raw features often span wildly different scales (e.g., temperature in Kelvin vs. atomic number), which can cause gradient descent to behave poorly. **Standardization** subtracts the mean and divides by the standard deviation (fit on training data only):

\[
x' = \frac{x - \mu_\text{train}}{\sigma_\text{train}}.
\]

**Min-max normalization** scales features to a fixed range \( [0,1] \). For neural networks, standardization is usually preferred because it produces zero-mean inputs, which interacts well with common initializations. **Handling missing values** requires care: simple imputation (mean/median replacement) can be biased, while more sophisticated methods like MICE (Multiple Imputation by Chained Equations) model the joint distribution of features.

## Section 6.3: Hyperparameter Tuning

**Grid search** evaluates all combinations of hyperparameter values on a predefined grid. This is thorough but exponentially expensive in the number of hyperparameters. **Random search** (Bergstra and Bengio, 2012) samples hyperparameter combinations randomly and is empirically as effective or better than grid search, because in practice only a few hyperparameters matter for any given problem, and random search allocates more evaluations to varying those parameters.

**Bayesian optimization** treats hyperparameter optimization as a sequential decision problem: fit a probabilistic surrogate model (typically a Gaussian process) to the observed (hyperparameter, validation performance) pairs, then choose the next hyperparameter configuration to maximize the expected improvement. This is especially valuable when each evaluation is expensive (e.g., training a large neural network for many epochs).

## Section 6.4: Evaluation Metrics

Beyond accuracy (fraction of correct predictions), a suite of metrics is needed for a complete picture, especially in class-imbalanced settings.

<div class="definition">
<strong>Classification Metrics</strong>

Let TP, FP, TN, FN denote true positives, false positives, true negatives, and false negatives.

<ul>
<li><strong>Precision</strong>: \( P = \text{TP}/(\text{TP}+\text{FP}) \) — fraction of predicted positives that are truly positive.</li>
<li><strong>Recall (Sensitivity)</strong>: \( R = \text{TP}/(\text{TP}+\text{FN}) \) — fraction of true positives that are correctly identified.</li>
<li><strong>F1 score</strong>: harmonic mean \( F_1 = 2PR/(P+R) \) — balances precision and recall.</li>
<li><strong>ROC-AUC</strong>: area under the Receiver Operating Characteristic curve (TP rate vs. FP rate across thresholds); equals the probability that a randomly chosen positive ranks above a randomly chosen negative.</li>
</ul>
</div>

## Section 6.5: Physics-Specific Data Challenges

Physics data presents unique challenges not found in standard ML benchmarks. **Symmetries** (gauge symmetry in lattice QCD, translational/rotational symmetry in molecular data, time-reversal symmetry in quantum systems) mean that many configurations in the training set are physically equivalent. If these symmetries are not exploited, the model wastes capacity learning that equivalent configurations give the same output; worse, it may fail to generalize to symmetry-related test examples not seen during training. Solutions include data augmentation (explicitly adding symmetry-related examples), architectures with built-in equivariance (equivariant neural networks, group-equivariant CNNs), and physics-informed loss functions.

**Monte Carlo noise** arises because training configurations are generated by MCMC, and successive configurations are correlated (autocorrelation time \( \tau \)). Treating correlated configurations as i.i.d. underestimates the effective sample size and leads to overconfident validation estimates. **Sparse labels** are the norm rather than the exception: DFT calculations or quantum Monte Carlo simulations to label training points may cost hours of compute per example, limiting dataset sizes to hundreds or thousands rather than millions.

---

# Chapter 7: Generative Models — Probabilistic Graphical Models

## Section 7.1: Directed and Undirected Graphical Models

A **probabilistic graphical model** encodes the conditional independence structure of a joint distribution via a graph. In a **directed graphical model** (Bayesian network), nodes represent random variables and directed edges encode conditional dependence: each variable \( X_i \) depends only on its parents \( \mathrm{Pa}(X_i) \), so the joint distribution factorizes as

\[
p(\mathbf{x}) = \prod_i p(x_i | \mathrm{Pa}(x_i)).
\]

Directed models are natural for generative processes with a clear causal structure (e.g., VAEs, autoregressive models).

In an **undirected graphical model** (Markov Random Field, or MRF), the graph is undirected and the joint distribution factorizes over the **cliques** \( \mathcal{C} \) of the graph:

\[
p(\mathbf{x}) = \frac{1}{Z} \prod_{c \in \mathcal{C}} \psi_c(\mathbf{x}_c),
\]

where \( \psi_c \geq 0 \) are **clique potential functions** and \( Z \) is the partition function. This factorization is the **Gibbs distribution**. The Ising model is an MRF with pairwise cliques and potential \( \psi_{\{i,j\}}(s_i, s_j) = e^{\beta J s_i s_j} \). Computing \( Z \) requires summing over all configurations, which is intractable for large systems — the same challenge that makes training Boltzmann machines difficult.

## Section 7.2: Boltzmann Machines

A **Boltzmann Machine** (Hinton and Sejnowski, 1985) is a fully connected MRF with binary units \( s_i \in \{0,1\} \) and energy function:

\[
E(\mathbf{s}) = -\sum_{i < j} W_{ij} s_i s_j - \sum_i b_i s_i.
\]

The joint distribution is the Boltzmann distribution \( p(\mathbf{s}) = e^{-E(\mathbf{s})} / Z \). Training maximizes the log-likelihood:

\[
\nabla_{W_{ij}} \log p(\mathbf{v}) = \langle v_i v_j \rangle_\text{data} - \langle s_i s_j \rangle_\text{model}.
\]

The data term (clamping visible units to a training example and sampling hidden units) is tractable; the model term requires MCMC sampling from the model distribution, which is expensive. Training full Boltzmann machines is therefore rarely done in practice.

## Section 7.3: Restricted Boltzmann Machines

The **Restricted Boltzmann Machine (RBM)** restricts the connectivity to a bipartite graph: all connections go between visible units \( \mathbf{v} \in \{0,1\}^n \) and hidden units \( \mathbf{h} \in \{0,1\}^m \), with no within-layer connections. The energy function is:

\[
E(\mathbf{v}, \mathbf{h}) = -\mathbf{a}^T \mathbf{v} - \mathbf{b}^T \mathbf{h} - \mathbf{v}^T W \mathbf{h}.
\]

The bipartite structure gives conditional independence of the hidden units given the visible units, and vice versa:

\[
p(h_j = 1 | \mathbf{v}) = \sigma\!\left(b_j + \sum_i v_i W_{ij}\right), \qquad p(v_i = 1 | \mathbf{h}) = \sigma\!\left(a_i + \sum_j W_{ij} h_j\right).
\]

This block-conditional independence makes **Gibbs sampling** efficient: alternate between sampling all hidden units (given visible) and all visible units (given hidden) in parallel. Training by exact maximum likelihood is still intractable, but **Contrastive Divergence (CD-k)** provides an efficient approximation: starting from a data example, run \( k \) steps of Gibbs sampling to obtain a "fantasy" particle, then update:

\[
\Delta W_{ij} \propto \langle v_i h_j \rangle_\text{data} - \langle v_i h_j \rangle_{k\text{-step}}.
\]

With \( k = 1 \), CD-1 is remarkably effective in practice. **Persistent Contrastive Divergence (PCD)** improves on this by maintaining a persistent Markov chain (rather than restarting from data each step), which better approximates the true model distribution.

The RBM has a beautiful physical interpretation: it is an Ising model on a bipartite graph. The visible units play the role of physical degrees of freedom, while the hidden units encode latent correlations. RBMs have been used as neural quantum state (NQS) ansätze: the wave function coefficients \( \Psi(\mathbf{s}) \) can be represented by the marginal amplitude of an RBM, with hidden units playing the role of auxiliary variables that mediate long-range correlations in the physical state.

---

# Chapter 8: Deep Generative Models I — VAEs and GANs

## Section 8.1: Variational Autoencoders

The **Variational Autoencoder (VAE)** (Kingma and Welling, 2014) is a principled generative model that learns a low-dimensional latent representation \( \mathbf{z} \in \mathbb{R}^k \) of high-dimensional data \( \mathbf{x} \in \mathbb{R}^d \). The generative model is a latent variable model:

\[
p_\theta(\mathbf{x}) = \int p_\theta(\mathbf{x} | \mathbf{z})\, p(\mathbf{z})\, d\mathbf{z},
\]

where \( p(\mathbf{z}) = \mathcal{N}(\mathbf{0}, I) \) is a standard Gaussian prior and \( p_\theta(\mathbf{x}|\mathbf{z}) \) is the decoder (parameterized by a neural network). Computing this integral exactly is intractable, so we cannot directly maximize \( \log p_\theta(\mathbf{x}) \).

### Subsection 8.1.1: ELBO Derivation

The key insight is to introduce an approximate posterior \( q_\phi(\mathbf{z}|\mathbf{x}) \) (the encoder) and derive a lower bound on the log-likelihood. Starting from:

\[
\log p_\theta(\mathbf{x}) = \log \int p_\theta(\mathbf{x}, \mathbf{z})\, d\mathbf{z} = \log \int q_\phi(\mathbf{z}|\mathbf{x}) \frac{p_\theta(\mathbf{x}, \mathbf{z})}{q_\phi(\mathbf{z}|\mathbf{x})}\, d\mathbf{z}.
\]

Applying Jensen's inequality (since \( \log \) is concave):

\[
\log p_\theta(\mathbf{x}) \geq \int q_\phi(\mathbf{z}|\mathbf{x}) \log \frac{p_\theta(\mathbf{x}, \mathbf{z})}{q_\phi(\mathbf{z}|\mathbf{x})}\, d\mathbf{z} = \mathcal{L}_\text{ELBO}(\theta, \phi).
\]

Expanding \( p_\theta(\mathbf{x}, \mathbf{z}) = p_\theta(\mathbf{x}|\mathbf{z}) p(\mathbf{z}) \):

\[
\mathcal{L}_\text{ELBO} = \underbrace{\mathbb{E}_{q_\phi(\mathbf{z}|\mathbf{x})}\!\left[\log p_\theta(\mathbf{x}|\mathbf{z})\right]}_{\text{reconstruction term}} - \underbrace{D_{KL}\!\left(q_\phi(\mathbf{z}|\mathbf{x}) \,\|\, p(\mathbf{z})\right)}_{\text{regularization term}}.
\]

The gap between the ELBO and the true log-likelihood is \( D_{KL}(q_\phi(\mathbf{z}|\mathbf{x}) \| p_\theta(\mathbf{z}|\mathbf{x})) \geq 0 \), so the ELBO is indeed a lower bound. Maximizing the ELBO simultaneously trains the encoder (minimize the KL to the prior) and the decoder (maximize reconstruction quality). The KL term regularizes the latent space: it pushes \( q_\phi(\mathbf{z}|\mathbf{x}) \) to be close to the Gaussian prior, ensuring the latent space is smooth and well-organized for generation.

### Subsection 8.1.2: Reparameterization Trick

The encoder outputs a Gaussian: \( q_\phi(\mathbf{z}|\mathbf{x}) = \mathcal{N}(\boldsymbol{\mu}_\phi(\mathbf{x}), \mathrm{diag}(\boldsymbol{\sigma}^2_\phi(\mathbf{x}))) \). To backpropagate through sampling (which is a non-differentiable operation), we use the **reparameterization trick**: write \( \mathbf{z} = \boldsymbol{\mu}_\phi(\mathbf{x}) + \boldsymbol{\sigma}_\phi(\mathbf{x}) \odot \boldsymbol{\epsilon} \) where \( \boldsymbol{\epsilon} \sim \mathcal{N}(\mathbf{0}, I) \). The randomness is now in \( \boldsymbol{\epsilon} \), which is independent of the parameters, so gradients flow through \( \boldsymbol{\mu}_\phi \) and \( \boldsymbol{\sigma}_\phi \) normally. This simple trick is what makes VAEs tractable to train.

**\(\beta\)-VAE** increases the KL weight to \( \beta > 1 \), encouraging a more compact and disentangled latent space where individual dimensions correspond to independent factors of variation in the data. This has been applied to discovering interpretable physical factors in materials datasets.

## Section 8.2: Generative Adversarial Networks

**GANs** (Goodfellow et al., 2014) take a fundamentally different approach to generative modeling: rather than maximizing likelihood, they train a generator network to produce samples that fool a discriminator network into thinking they are real. The training is framed as a minimax game:

\[
\min_G \max_D\; \mathbb{E}_{\mathbf{x} \sim p_\text{data}}\!\left[\log D(\mathbf{x})\right] + \mathbb{E}_{\mathbf{z} \sim p(\mathbf{z})}\!\left[\log(1 - D(G(\mathbf{z})))\right].
\]

The discriminator \( D(\mathbf{x}) \in (0,1) \) outputs the probability that \( \mathbf{x} \) is real. The optimal discriminator (for fixed \( G \)) is \( D^*(\mathbf{x}) = p_\text{data}(\mathbf{x}) / (p_\text{data}(\mathbf{x}) + p_G(\mathbf{x})) \). Substituting this back, the generator's loss at the optimum is the **Jensen-Shannon divergence** between \( p_G \) and \( p_\text{data} \), which is minimized when \( p_G = p_\text{data} \) — the Nash equilibrium.

In practice, GAN training is notoriously unstable: the two networks can fail to converge, one network can overwhelm the other, or the generator may collapse to producing only a few modes of the distribution (**mode collapse**). The **Wasserstein GAN (WGAN)** addresses these issues by replacing the Jensen-Shannon divergence with the Wasserstein-1 (Earth Mover) distance, which is continuous and differentiable everywhere, providing more stable gradients.

GANs have been applied to generate molecular structures, crystal lattice configurations, and quantum circuit designs in physics.

---

# Chapter 9: Attention and Transformers

## Section 9.1: The Attention Mechanism

The attention mechanism is the core innovation that enabled transformers to surpass recurrent networks on sequence modeling tasks. Its key insight is that, rather than compressing the entire input sequence into a single fixed-length hidden state (as RNNs do), attention allows the model to directly access any part of the input when producing each output element.

Given a query \( \mathbf{q} \), a set of keys \( K = \{\mathbf{k}_i\} \), and corresponding values \( V = \{\mathbf{v}_i\} \), the attention output is a weighted sum of the values, where the weights measure the compatibility of the query with each key:

\[
\text{Attention}(\mathbf{q}, K, V) = \sum_i \underbrace{\frac{e^{\mathbf{q}^T \mathbf{k}_i / \sqrt{d_k}}}{\sum_j e^{\mathbf{q}^T \mathbf{k}_j / \sqrt{d_k}}}}_{\text{attention weight}} \mathbf{v}_i.
\]

The \( \sqrt{d_k} \) scaling factor prevents the dot products from becoming very large in high dimensions (which would push the softmax into saturation). In matrix form with queries \( Q \in \mathbb{R}^{n \times d_k} \), keys \( K \in \mathbb{R}^{m \times d_k} \), and values \( V \in \mathbb{R}^{m \times d_v} \):

\[
\text{Attention}(Q, K, V) = \mathrm{softmax}\!\left(\frac{QK^T}{\sqrt{d_k}}\right) V.
\]

The attention matrix \( A = \mathrm{softmax}(QK^T/\sqrt{d_k}) \in \mathbb{R}^{n \times m} \) can be interpreted as a soft, differentiable lookup: each query retrieves a weighted combination of all values, with weights determined by how well the query matches each key.

## Section 9.2: Multi-Head Attention and Transformer Architecture

**Multi-head attention** runs \( h \) independent attention operations ("heads") in parallel, each with different learned projections:

\[
\text{MultiHead}(Q,K,V) = \mathrm{Concat}(\text{head}_1,\ldots,\text{head}_h)W^O, \quad \text{head}_i = \text{Attention}(QW^Q_i, KW^K_i, VW^V_i).
\]

Different heads can attend to different aspects of the input — one head might track syntactic relationships, another semantic similarity, another positional proximity. In physics applications, different heads might attend to different types of correlations (e.g., short-range vs. long-range, bond vs. non-bond).

The full **Transformer** architecture (Vaswani et al., 2017) consists of a stack of identical layers, each containing a multi-head self-attention sublayer followed by a position-wise feedforward sublayer, with residual connections and layer normalization:

\[
\mathbf{h}' = \mathrm{LayerNorm}(\mathbf{h} + \text{MultiHead}(\mathbf{h},\mathbf{h},\mathbf{h})), \qquad \mathbf{h}'' = \mathrm{LayerNorm}(\mathbf{h}' + \mathrm{FFN}(\mathbf{h}')).
\]

Since self-attention is permutation equivariant (the output does not change if the input sequence is permuted, with the attention weights permuting accordingly), the Transformer requires **positional encodings** to distinguish positions. The standard sinusoidal encoding adds fixed vectors \( \mathrm{PE}(pos, 2i) = \sin(pos/10000^{2i/d}) \) and \( \mathrm{PE}(pos, 2i+1) = \cos(pos/10000^{2i/d}) \) to the input embeddings.

## Section 9.3: Physical Analogy — Attention as Many-Body Interaction

The self-attention mechanism has a natural physical interpretation. The attention weight \( A_{ij} \) measures the "interaction strength" between positions \( i \) and \( j \) in the sequence. This is analogous to the pairwise interaction energy \( J_{ij} s_i s_j \) in a spin model, or to the two-body density matrix in quantum mechanics. The output of attention at position \( i \) is a sum over all other positions weighted by interaction strength — exactly the form of a mean-field update in a quantum many-body system. This analogy motivates the use of Transformers for modeling quantum states of matter, where the self-attention can represent the entanglement structure of the wave function.

---

# Chapter 10: Energy-Based Models and Hopfield Networks

## Section 10.1: Energy-Based Models

An **energy-based model (EBM)** defines a probability distribution through an energy function \( E_\theta(\mathbf{x}) \):

\[
p_\theta(\mathbf{x}) = \frac{e^{-E_\theta(\mathbf{x})}}{Z(\theta)}, \qquad Z(\theta) = \int e^{-E_\theta(\mathbf{x})}\, d\mathbf{x}.
\]

This is the most general form of a Boltzmann distribution, and the framework encompasses the Ising model, RBMs, Hopfield networks, and many other models as special cases. The flexibility of EBMs is their great strength: the energy function can be any neural network, making EBMs extremely expressive. The great weakness is the intractability of \( Z(\theta) \): computing it requires integrating over the entire input space.

**Contrastive Divergence** training approximates the log-likelihood gradient by running short MCMC chains initialized from the data. **Score matching** (Hyvärinen, 2005) entirely avoids computing \( Z \) by matching the gradient of the model log-density to the gradient of the data log-density:

\[
J(\theta) = \frac{1}{2}\mathbb{E}_p\!\left[\|s_\theta(\mathbf{x}) - \nabla_\mathbf{x} \log p(\mathbf{x})\|^2\right], \qquad s_\theta(\mathbf{x}) = \nabla_\mathbf{x} \log p_\theta(\mathbf{x}) = -\nabla_\mathbf{x} E_\theta(\mathbf{x}).
\]

Since \( \nabla_\mathbf{x} \log p = -\nabla_\mathbf{x} E \) does not involve \( Z \), the score can be computed without the partition function. Score matching connects to denoising autoencoders and forms the theoretical foundation of diffusion models (Chapter 12).

## Section 10.2: Hopfield Networks

The **Hopfield network** (Hopfield, 1982) is a model of associative memory — a system that can store patterns and retrieve them from partial or noisy versions. It consists of \( N \) binary neurons \( s_i \in \{-1, +1\} \) with symmetric weights \( W_{ij} = W_{ji} \), \( W_{ii} = 0 \). The energy function is:

\[
E(\mathbf{s}) = -\frac{1}{2} \sum_{i \neq j} W_{ij} s_i s_j.
\]

This is identically the Ising Hamiltonian. The dynamics proceed by asynchronously updating each spin to minimize the energy:

\[
s_i \leftarrow \mathrm{sign}\!\left(\sum_j W_{ij} s_j\right).
\]

Since each update decreases or preserves the energy (the energy is a Lyapunov function), the network always converges to a local energy minimum — a stored pattern or a spurious state. Patterns \( \{\boldsymbol{\xi}^\mu\}_{\mu=1}^P \) are stored by **Hebbian learning**:

\[
W_{ij} = \frac{1}{N} \sum_{\mu=1}^P \xi_i^\mu \xi_j^\mu.
\]

The network can reliably store up to \( P^* \approx 0.138 N \) patterns before retrieval accuracy collapses. Beyond this capacity, the number of spurious states proliferates and pattern retrieval fails. The critical capacity 0.138 is determined by a spin-glass analysis — another deep connection between neural networks and disordered systems in physics.

## Section 10.3: Modern Hopfield Networks

Ramsauer et al. (2020) showed that replacing the binary neurons and sign update with continuous neurons and a softmax update leads to a dramatically increased storage capacity. The **modern Hopfield network** has energy:

\[
E(\mathbf{s}, \Xi) = -\mathrm{lse}(\beta, \Xi^T \mathbf{s}) + \frac{1}{2}\mathbf{s}^T\mathbf{s} + \frac{1}{\beta}\log N + \frac{1}{2}M^2,
\]

where \( \mathrm{lse}(\beta, \mathbf{z}) = \beta^{-1} \log \sum_i e^{\beta z_i} \) is the log-sum-exp function and \( M = \max_\mu \|\boldsymbol{\xi}^\mu\| \). The update rule is:

\[
\mathbf{s}^{\text{new}} = \Xi\, \mathrm{softmax}(\beta \Xi^T \mathbf{s}).
\]

This update rule is **identical to one step of the self-attention mechanism** with \( \mathbf{s} \) as the query, \( \Xi \) as the keys and values, and \( \beta \) as the inverse temperature. This establishes a formal equivalence between transformer attention and associative memory retrieval in a Hopfield network — revealing that the attention mechanism can be understood as looking up the stored pattern that best matches the query.

The storage capacity of the modern Hopfield network scales **exponentially** with the embedding dimension: \( P \sim e^{\alpha d} \) for some constant \( \alpha \). This exponential improvement over the classical \( 0.138N \) capacity allows transformers (which implicitly implement Hopfield dynamics) to handle very large context windows.

---

# Chapter 11: Autoregressive Models

## Section 11.1: Autoregressive Factorization

Any joint distribution over a sequence \( \mathbf{x} = (x_1, \ldots, x_n) \) can be factored exactly using the **chain rule of probability**:

\[
p(\mathbf{x}) = p(x_1) \prod_{i=2}^n p(x_i | x_1, \ldots, x_{i-1}) = \prod_{i=1}^n p(x_i | x_{<i}).
\]

An **autoregressive model** parameterizes each conditional \( p_\theta(x_i | x_{<i}) \) with a neural network. This decomposition guarantees that the model defines a valid joint distribution (each factor is a proper conditional), enables exact likelihood computation (no intractable partition function), and allows ancestral sampling (sample \( x_1 \), then \( x_2 | x_1 \), etc.). The tradeoff is that sampling is sequential and therefore slow.

## Section 11.2: PixelCNN and Image Autoregressive Models

**PixelCNN** (van den Oord et al., 2016) applies autoregressive modeling to images by ordering pixels in raster-scan order (left to right, top to bottom) and modeling each pixel conditioned on all previous pixels. The key challenge is preventing the model from "seeing the future": convolutional filters must be masked so that only previously generated pixels can influence the current pixel. This is achieved by **masked convolutions**: setting specific filter weights to zero so that the filter only covers the upper-left portion of the receptive field. PixelCNN can generate high-quality images while maintaining exact likelihood tractability — an advantage over VAEs (approximate likelihood) and GANs (no likelihood).

## Section 11.3: Autoregressive Neural Quantum States

One of the most impactful applications of autoregressive models in physics is the **autoregressive neural quantum state (NQS)**. For a quantum many-body system with \( N \) spins, the wave function \( |\psi\rangle = \sum_\mathbf{s} \psi(\mathbf{s}) |\mathbf{s}\rangle \) has \( 2^N \) coefficients. An autoregressive network represents \( |\psi(\mathbf{s})|^2 \) as a product of conditionals:

\[
|\psi(s_1,\ldots,s_N)|^2 = \prod_{i=1}^N p_\theta(s_i | s_1,\ldots,s_{i-1}).
\]

Samples can be drawn **exactly** from \( |\psi|^2 \) by ancestral sampling — no MCMC is needed, eliminating autocorrelation time entirely. The wave function phase is represented by a separate network, and the full amplitude is \( \psi(\mathbf{s}) = \sqrt{p_\theta(\mathbf{s})} e^{i\phi_\theta(\mathbf{s})} \). This approach achieves excellent accuracy for frustrated quantum magnets and avoids the sign problem that plagues quantum Monte Carlo.

## Section 11.4: Comparing Generative Model Families

<div class="remark">
<strong>Comparison of Generative Model Families</strong>

| Property | Flow | VAE | GAN | Autoregressive |
|---|---|---|---|---|
| Exact log-likelihood | Yes | Lower bound only | No | Yes |
| Sampling speed | Fast | Fast | Fast | Slow (sequential) |
| Latent space | Yes (bijection) | Yes (stochastic) | Yes (implicit) | No |
| Training stability | Stable | Stable | Unstable | Stable |
| Physics applicability | Lattice models | Molecular graphs | Configuration generation | Quantum states |
</div>

---

# Chapter 12: Normalizing Flows and Diffusion Models

## Section 12.1: Normalizing Flows

A **normalizing flow** transforms a simple base distribution (typically Gaussian) into a complex target distribution via a composition of invertible differentiable maps. Let \( \mathbf{z} \sim p_0(\mathbf{z}) \) be a sample from the base and define \( \mathbf{x} = f(\mathbf{z}) \) where \( f: \mathbb{R}^d \to \mathbb{R}^d \) is an invertible map. By the **change of variables formula**:

\[
\log p(\mathbf{x}) = \log p_0\!\left(f^{-1}(\mathbf{x})\right) - \log\!\left|\det \frac{\partial f}{\partial \mathbf{z}}\right|.
\]

For a composition of \( K \) invertible maps \( f = f_K \circ \cdots \circ f_1 \):

\[
\log p(\mathbf{x}) = \log p_0(\mathbf{z}_0) - \sum_{k=1}^K \log\!\left|\det \frac{\partial f_k}{\partial \mathbf{z}_{k-1}}\right|.
\]

The challenge is to design \( f_k \) that are (1) expressive, (2) invertible, and (3) have efficiently computable Jacobian determinants. **Affine coupling layers** (RealNVP, Dinh et al., 2017) achieve this by splitting the input into two halves and applying an element-wise affine transformation to one half conditioned on the other:

\[
\mathbf{x}_{1:d/2} = \mathbf{z}_{1:d/2}, \qquad \mathbf{x}_{d/2+1:d} = \mathbf{z}_{d/2+1:d} \odot e^{s(\mathbf{z}_{1:d/2})} + t(\mathbf{z}_{1:d/2}),
\]

where \( s \) and \( t \) are arbitrary neural networks. The Jacobian is triangular, so its determinant is the product of diagonal elements — computable in \( O(d) \) time. Flows have been applied to accelerate Monte Carlo sampling for lattice gauge theories and spin systems: rather than relying on MCMC, one trains a flow to approximate the Boltzmann distribution and draws independent samples directly.

## Section 12.2: Denoising Diffusion Probabilistic Models

**Diffusion models** (Ho et al., 2020; Sohl-Dickstein et al., 2015) define a generative model through the reverse of a fixed noising process. The **forward process** gradually adds Gaussian noise to data over \( T \) steps:

\[
q(\mathbf{x}_t | \mathbf{x}_{t-1}) = \mathcal{N}\!\left(\mathbf{x}_t;\; \sqrt{1-\beta_t}\,\mathbf{x}_{t-1},\; \beta_t I\right),
\]

where \( \beta_t \in (0,1) \) is a noise schedule. By the Markov property, the marginal at any step is available in closed form: letting \( \bar{\alpha}_t = \prod_{s=1}^t (1-\beta_s) \),

\[
q(\mathbf{x}_t | \mathbf{x}_0) = \mathcal{N}\!\left(\mathbf{x}_t;\; \sqrt{\bar{\alpha}_t}\,\mathbf{x}_0,\; (1-\bar{\alpha}_t)I\right).
\]

For large \( T \), \( \bar{\alpha}_T \approx 0 \) and \( \mathbf{x}_T \approx \mathcal{N}(\mathbf{0}, I) \). To generate samples, we learn to reverse the forward process: train a neural network \( \boldsymbol{\epsilon}_\theta(\mathbf{x}_t, t) \) to predict the noise \( \boldsymbol{\epsilon} \) added to \( \mathbf{x}_0 \) to obtain \( \mathbf{x}_t \). The training objective is:

\[
\mathcal{L} = \mathbb{E}_{t, \mathbf{x}_0, \boldsymbol{\epsilon}}\!\left[\|\boldsymbol{\epsilon} - \boldsymbol{\epsilon}_\theta(\sqrt{\bar{\alpha}_t}\,\mathbf{x}_0 + \sqrt{1-\bar{\alpha}_t}\,\boldsymbol{\epsilon},\, t)\|^2\right].
\]

Sampling iteratively denoises from \( \mathbf{x}_T \sim \mathcal{N}(\mathbf{0},I) \) through \( \mathbf{x}_{T-1}, \ldots, \mathbf{x}_0 \).

## Section 12.3: Score-Based Models and the Connection to Physics

The **score function** of a distribution is \( \nabla_\mathbf{x} \log p(\mathbf{x}) \). Score-based generative models (Song and Ermon, 2019) train a neural network \( \mathbf{s}_\theta(\mathbf{x}) \approx \nabla_\mathbf{x} \log p(\mathbf{x}) \) and generate samples via **Langevin dynamics**:

\[
\mathbf{x}_{k+1} = \mathbf{x}_k + \frac{\epsilon}{2} \mathbf{s}_\theta(\mathbf{x}_k) + \sqrt{\epsilon}\, \boldsymbol{\eta}_k, \quad \boldsymbol{\eta}_k \sim \mathcal{N}(\mathbf{0}, I).
\]

This is the discretized Langevin equation, which generates samples from \( p \) in the limit \( \epsilon \to 0 \). The Langevin equation in physics describes the motion of a Brownian particle in a potential \( U(\mathbf{x}) = -\log p(\mathbf{x}) \), subject to a friction force and thermal noise. The **fluctuation-dissipation theorem** relates the noise amplitude to the temperature and friction coefficient, ensuring the correct stationary distribution is reached.

The forward diffusion process of DDPMs is an **Ornstein-Uhlenbeck process** — a Langevin dynamics with a linear restoring force — and the noise-prediction network is related to the score function via \( \boldsymbol{\epsilon}_\theta = -\sqrt{1-\bar{\alpha}_t}\,\mathbf{s}_\theta \). Score-based models and DDPMs are therefore unified within the same framework of stochastic differential equations, a perspective developed by Song et al. (2021) using the framework of SDEs.

---

# Chapter 13: Machine Learning for Quantum Physics

## Section 13.1: Neural Quantum States

The exponential scaling of the Hilbert space — \( 2^N \) for \( N \) spin-1/2 particles — is the central obstacle to simulating quantum many-body systems. Exact diagonalization is limited to \( N \lesssim 40 \); tensor network methods (MPS, PEPS) work well in 1D but face difficulties in 2D and beyond. **Neural Quantum States (NQS)**, introduced by Carleo and Troyer (2017), represent the wave function \( \Psi(\mathbf{s}) \) using a neural network with polynomial (not exponential) parameters, providing a flexible variational ansatz.

The **RBM ansatz** is:

\[
\Psi_\text{RBM}(\mathbf{s}) = e^{\sum_i a_i s_i} \prod_{j=1}^{M} \cosh\!\left(b_j + \sum_i W_{ij} s_i\right).
\]

After marginalizing out the hidden units, this gives a compact representation of the many-body wave function. The number of parameters is \( O(N \times M) \) (linear in system size), making it practical for large systems. The variational energy is computed by sampling spin configurations from \( |\Psi(\mathbf{s})|^2 \) using MCMC and evaluating the local energy estimator \( E_\text{loc}(\mathbf{s}) = \sum_{\mathbf{s}'} \langle \mathbf{s} | H | \mathbf{s}' \rangle \Psi(\mathbf{s}') / \Psi(\mathbf{s}) \).

## Section 13.2: Stochastic Reconfiguration

The natural gradient for quantum variational problems is called **stochastic reconfiguration (SR)**. The update rule is:

\[
\boldsymbol{\theta} \leftarrow \boldsymbol{\theta} - \eta\, S^{-1} \mathbf{F},
\]

where \( \mathbf{F}_k = \partial_{\theta_k} \mathcal{E} \) is the energy gradient and \( S_{kk'} = \langle O_k^* O_{k'} \rangle - \langle O_k^* \rangle \langle O_{k'} \rangle \) is the **quantum geometric tensor** (the analogoue of the Fisher information matrix for quantum states). Here \( O_k(\mathbf{s}) = \partial_{\theta_k} \log \Psi(\mathbf{s}) \). The quantum geometric tensor encodes the geometry of the space of quantum states parameterized by \( \boldsymbol{\theta} \): it measures how the state \( |\Psi_\theta\rangle \) changes under infinitesimal parameter variations, with respect to the Fubini-Study metric on the projective Hilbert space.

Stochastic reconfiguration is invariant under reparameterization of the ansatz (just as the natural gradient is invariant in classical ML), and converges much faster than ordinary gradient descent for quantum variational problems — especially near ground-state degeneracies or with ill-conditioned parameterizations.

## Section 13.3: ML for Phase Transitions — Supervised and Unsupervised

Identifying phase transitions is one of the most successful applications of ML in physics. Three complementary approaches cover different levels of prior knowledge:

**Supervised approach**: label configurations as "ordered" (low \( T \)) or "disordered" (high \( T \)) and train a neural network classifier. Carrasquilla and Melko (2017) showed that the network's confidence automatically locates \( T_c \) with high precision, even without knowledge of the order parameter. The network learns the order parameter implicitly — for the Ising model, the first layer weights of the trained network resemble the magnetization, demonstrating that the network discovers the physically relevant feature.

**Unsupervised approach**: apply dimensionality reduction (PCA, autoencoders) to configurations across temperatures. The first principal component of Ising configurations is the magnetization; its variance peaks at \( T_c \). More generally, anomalous changes in the latent representation across temperature serve as indicators of phase transitions without requiring any labels. This is especially valuable for exotic phases (topological order, spin liquids) where no simple order parameter is known.

**Confusion scheme**: as discussed in Chapter 2, this method uses a binary classifier trained with deliberately mislabeled data to locate phase transitions without any knowledge of the true labels. Its mathematical foundation is that a classifier achieves maximum accuracy when the boundary between classes coincides with the true phase boundary.

## Section 13.4: Quantum Machine Learning

**Variational quantum circuits** are parameterized quantum circuits in which gate angles are optimized classically. The variational quantum eigensolver (VQE) prepares a trial state \( |\psi(\boldsymbol{\theta})\rangle = U(\boldsymbol{\theta}) |0\rangle \) on a quantum computer and measures the energy expectation value, which is minimized by a classical optimizer. QAOA (Quantum Approximate Optimization Algorithm) applies this framework to combinatorial optimization problems.

**Barren plateaus** are a fundamental obstacle: for random variational circuits of sufficient depth, the gradient of the cost function with respect to any single parameter has mean zero and variance that vanishes exponentially with the number of qubits. This means that, for large quantum systems, random initialization leads to a featureless loss landscape where no gradient information is available. The barren plateau phenomenon is directly analogous to the vanishing gradient problem in deep classical networks: both arise from the concentration of measure on high-dimensional spaces. Proposed mitigations include local cost functions, structured initialization, and problem-specific circuit designs.

**Quantum tomography with ML**: reconstructing an unknown quantum state \( \rho \) from measurement data is quantum state tomography. ML approaches use neural networks to represent \( \rho \) compactly (e.g., as an NQS or a positive matrix parameterization) and fit the parameters to the measurement outcomes. Generative models (RBMs, autoregressive networks) are particularly natural for this task because they define probability distributions over measurement outcomes, and training them on measurement data gives a compact representation of the quantum state without ever constructing the full density matrix explicitly.

## Section 13.5: Summary — The Physical Science of Machine Learning

The unifying theme of this course is the deep mathematical kinship between machine learning and statistical physics. Every major ML algorithm has a physical counterpart: gradient descent is Langevin dynamics, the natural gradient is stochastic reconfiguration, the transformer attention head is a modern Hopfield network, the VAE ELBO is a variational free energy, and diffusion models are stochastic differential equations from non-equilibrium statistical mechanics. This is not mere analogy — it is the same mathematics, appearing in two different scientific traditions.

Conversely, ML tools have transformed physics research. Neural networks classify phases of matter without human-defined order parameters, represent quantum states with polynomial resources, accelerate Monte Carlo sampling by orders of magnitude, learn interatomic potentials from ab initio data, and find ground states of frustrated quantum magnets that resist every other known method. The coming decades will see the boundary between physics and machine learning continue to dissolve — and this course has aimed to give you the mathematical foundations to navigate both sides of that boundary.
