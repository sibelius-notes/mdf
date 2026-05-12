---
title: "ECE 493: Neural Networks and Deep Learning"
prof: "Elliot Creager"
subjects: "ECE"
ai_track: true
---

## Sources and References

**Primary textbook** — Bishop, C. M., & Bishop, H. (2024). *Deep Learning: Foundations and Concepts*. Springer. (Free e-book via institutional library)

**Supplementary texts** — Goodfellow, I., Bengio, Y., & Courville, A. (2016). *Deep Learning*. MIT Press. (Free online at deeplearningbook.org) — Murphy, K. P. (2022). *Probabilistic Machine Learning: An Introduction*. MIT Press. (Free online)

**Key papers** — Radford, A., et al. (2021). Learning transferable visual models from natural language supervision (CLIP). *ICML 2021*. — Kaplan, J., et al. (2020). Scaling laws for neural language models. arXiv:2001.08361. — Vaswani, A., et al. (2017). Attention is all you need. *NeurIPS 2017*. — Ho, J., et al. (2020). Denoising diffusion probabilistic models. *NeurIPS 2020*. — Wei, J., et al. (2022). Chain-of-thought prompting elicits reasoning in large language models. *NeurIPS 2022*. — Jumper, J., et al. (2021). Highly accurate protein structure prediction with AlphaFold. *Nature*, 596, 583–589.

**Online resources** — Andrej Karpathy's Neural Networks: Zero to Hero (YouTube/GitHub); Lilian Weng's blog (lilianweng.github.io); Stanford CS231n Convolutional Neural Networks for Visual Recognition (lecture notes freely available); MIT 6.S191 Introduction to Deep Learning.

---

# Chapter 1: Linear Models

## 1.1 Linear Regression

The simplest supervised learning problem is **linear regression**: given data \(\{(\mathbf{x}_i, y_i)\}_{i=1}^N\) with \(\mathbf{x}_i \in \mathbb{R}^D\) and \(y_i \in \mathbb{R}\), find a linear function \(f(\mathbf{x}; \mathbf{w}) = \mathbf{w}^T \mathbf{x} + b\) that predicts the target.

**Maximum likelihood estimation** under a Gaussian noise model \(y = \mathbf{w}^T\mathbf{x} + b + \epsilon\), \(\epsilon \sim \mathcal{N}(0, \sigma^2)\) gives:

\[
p(y | \mathbf{x}; \mathbf{w}) = \mathcal{N}(y; \mathbf{w}^T\mathbf{x} + b, \sigma^2)
\]

Maximizing the log-likelihood over the training set is equivalent to minimizing the **mean squared error (MSE)**:

\[
\mathcal{L}(\mathbf{w}, b) = \frac{1}{N}\sum_{i=1}^N (y_i - \mathbf{w}^T\mathbf{x}_i - b)^2
\]

The closed-form solution (normal equations), using design matrix \(X \in \mathbb{R}^{N \times D}\) with bias absorbed:

\[
\hat{\mathbf{w}} = (X^TX)^{-1}X^T\mathbf{y}
\]

## 1.2 Linear Classification

For classification with \(K\) classes, **softmax regression** (multinomial logistic regression) parameterizes a categorical distribution:

\[
p(y = k | \mathbf{x}; W) = \text{softmax}(W\mathbf{x} + \mathbf{b})_k = \frac{\exp(W_k^T\mathbf{x} + b_k)}{\sum_{j=1}^K \exp(W_j^T\mathbf{x} + b_j)}
\]

Training minimizes the **cross-entropy loss**:

\[
\mathcal{L}(W, \mathbf{b}) = -\frac{1}{N}\sum_{i=1}^N \sum_{k=1}^K y_{ik} \log p(y=k|\mathbf{x}_i)
\]

where \(y_{ik}\) is a one-hot indicator. Minimizing cross-entropy is equivalent to maximizing the log-likelihood of the categorical model.

**The perceptron** (Rosenblatt, 1958) is the historical ancestor of all neural networks: a single-layer linear threshold unit \(\hat{y} = \text{sign}(\mathbf{w}^T\mathbf{x})\) trained by the perceptron learning rule. The perceptron theorem guarantees convergence if the data is linearly separable.

---

# Chapter 2: Multilayer Perceptrons

## 2.1 The Universal Approximation Property

A single hidden layer network with \(H\) units and a non-linear activation:

\[
f(\mathbf{x}; W^{(1)}, W^{(2)}) = W^{(2)} \sigma(W^{(1)}\mathbf{x} + \mathbf{b}^{(1)}) + \mathbf{b}^{(2)}
\]

<div class="theorem">
<strong>Universal Approximation Theorem</strong> (Cybenko, 1989; Hornik, 1991). For any continuous function \(g\) on a compact domain and any \(\epsilon > 0\), there exists a single-hidden-layer network with sigmoid activation that approximates \(g\) to within \(\epsilon\) in supremum norm.
</div>

Universal approximation guarantees that shallow networks are expressive in principle, but may require exponentially many hidden units. **Depth** provides exponential efficiency for functions with hierarchical structure: the same function can be computed exactly by a deep network using polynomially many units.

## 2.2 Activation Functions

The activation function \(\sigma\) introduces non-linearity; without it, any composition of linear layers collapses to a single linear transformation.

**Sigmoid**: \(\sigma(z) = 1/(1+e^{-z})\). Outputs in \((0,1)\); historically important but saturates at extremes (gradient \(\to 0\)), causing **vanishing gradients** in deep networks.

**Tanh**: \(\tanh(z) = (e^z - e^{-z})/(e^z + e^{-z})\). Zero-centered outputs; still saturates.

**ReLU (Rectified Linear Unit)**: \(\text{ReLU}(z) = \max(0, z)\). Computationally cheap; gradient is 1 for \(z > 0\) and 0 for \(z < 0\). The gradient-1 region avoids vanishing; the zero-gradient region causes **dying ReLU** units. Default for hidden layers in most modern architectures.

**GELU (Gaussian Error Linear Unit)**: \(\text{GELU}(z) = z \cdot \Phi(z)\) where \(\Phi\) is the standard normal CDF. Smooth approximation to ReLU; used in BERT, GPT, and most transformer models. Approximated as \(\text{GELU}(z) \approx 0.5z(1 + \tanh(\sqrt{2/\pi}(z + 0.044715z^3)))\).

**Swish**: \(\text{Swish}(z) = z \cdot \sigma(\beta z)\). Empirically outperforms ReLU in some regimes; used in EfficientNet and some large language models.

## 2.3 Network Architecture Design

A deep MLP with \(L\) layers computes:

\[
\mathbf{h}^{(0)} = \mathbf{x}, \quad \mathbf{h}^{(l)} = \sigma(W^{(l)}\mathbf{h}^{(l-1)} + \mathbf{b}^{(l)})
\]

with output \(\hat{y} = W^{(L)}\mathbf{h}^{(L-1)} + b^{(L)}\) (linear output layer for regression; softmax for classification).

**Width vs. depth trade-off**: wider networks are easier to optimize (gradient flow is better) but may overfit on small datasets. Deeper networks are more parameter-efficient for hierarchical functions but harder to train without normalization and skip connections.

---

# Chapter 3: Optimization and Backpropagation

## 3.1 Stochastic Gradient Descent and Variants

Training minimizes the empirical risk \(\mathcal{L}(\theta) = \frac{1}{N}\sum_i \ell(f(\mathbf{x}_i;\theta), y_i)\). **Mini-batch SGD** approximates the full gradient with a small batch:

\[
\theta_{t+1} = \theta_t - \eta \nabla_\theta \mathcal{L}_{\mathcal{B}}(\theta_t)
\]

**SGD with momentum**:

\[
v_{t+1} = \mu v_t + \nabla_\theta \mathcal{L}_{\mathcal{B}}, \quad \theta_{t+1} = \theta_t - \eta v_{t+1}
\]

Momentum \(\mu \in [0.9, 0.99]\) accelerates convergence along directions of consistent gradient and dampens oscillations perpendicular to the optimum.

**Adam** (Kingma & Ba, 2015) adapts per-parameter learning rates using exponential moving averages of the gradient (\(m_t\)) and squared gradient (\(v_t\)):

\[
m_t = \beta_1 m_{t-1} + (1-\beta_1) g_t, \quad v_t = \beta_2 v_{t-1} + (1-\beta_2) g_t^2
\]

\[
\theta_t = \theta_{t-1} - \eta \frac{\hat{m}_t}{\sqrt{\hat{v}_t} + \epsilon}
\]

where \(\hat{m}_t = m_t/(1-\beta_1^t)\) and \(\hat{v}_t = v_t/(1-\beta_2^t)\) are bias-corrected estimates. Default hyperparameters: \(\beta_1 = 0.9\), \(\beta_2 = 0.999\), \(\epsilon = 10^{-8}\).

**AdamW** corrects the weight decay (L2 regularization) behavior of Adam by decoupling weight decay from the gradient update, applying it directly to the parameters rather than the gradient.

## 3.2 Backpropagation

**Backpropagation** (Rumelhart, Hinton & Williams, 1986) efficiently computes \(\nabla_\theta \mathcal{L}\) by the chain rule, traversing the computational graph in reverse.

For a network \(f(\mathbf{x}) = f^{(L)}(f^{(L-1)}(\cdots f^{(1)}(\mathbf{x})\cdots))\) with scalar loss \(\mathcal{L}\):

**Forward pass**: compute and cache activations \(\mathbf{h}^{(l)}\) for all \(l\).

**Backward pass**: define \(\boldsymbol{\delta}^{(l)} = \partial \mathcal{L} / \partial \mathbf{z}^{(l)}\) (gradient with respect to pre-activation):

\[
\boldsymbol{\delta}^{(L)} = \nabla_{\mathbf{h}^{(L)}} \mathcal{L} \odot \sigma'(\mathbf{z}^{(L)})
\]

\[
\boldsymbol{\delta}^{(l)} = (W^{(l+1)T}\boldsymbol{\delta}^{(l+1)}) \odot \sigma'(\mathbf{z}^{(l)})
\]

Weight gradients:

\[
\nabla_{W^{(l)}} \mathcal{L} = \boldsymbol{\delta}^{(l)} (\mathbf{h}^{(l-1)})^T
\]

The backward pass has the same asymptotic cost as the forward pass: \(O(L \cdot D^2)\) for width \(D\), linear in the number of layers.

## 3.3 Vanishing and Exploding Gradients

In deep networks, gradients propagated backward through many layers can shrink or grow exponentially. For a network with weights initialized from \(\mathcal{N}(0, \sigma_w^2)\), the gradient variance at layer \(l\) from the output scales as:

\[
\text{Var}[\delta^{(l)}] \propto \left(\sigma_w^2 D \right)^{L-l} \text{Var}[\delta^{(L)}]
\]

For convergence, we need \(\sigma_w^2 D \approx 1\). **Xavier initialization** (Glorot & Bengio, 2010) sets \(\sigma_w^2 = 2/(D_{\text{in}} + D_{\text{out}})\). **He initialization** (He et al., 2015) for ReLU sets \(\sigma_w^2 = 2/D_{\text{in}}\), accounting for the half-activation of ReLU.

**Gradient clipping**: for RNNs and transformers, clip the gradient norm: if \(\|\mathbf{g}\|_2 > \gamma\), rescale \(\mathbf{g} \leftarrow \gamma \mathbf{g}/\|\mathbf{g}\|_2\). Prevents exploding gradients without removing directional information.

---

# Chapter 4: Convolutional Neural Networks

## 4.1 The Convolution Operation

A **convolution** of a feature map \(\mathbf{x} \in \mathbb{R}^{H \times W \times C}\) with a filter \(\mathbf{k} \in \mathbb{R}^{K \times K \times C}\):

\[
(\mathbf{x} * \mathbf{k})[h,w] = \sum_{c=1}^C \sum_{i,j=-K/2}^{K/2} x[h+i, w+j, c] \cdot k[i, j, c]
\]

**Parameter sharing**: the same filter \(\mathbf{k}\) is applied at every spatial location. For a filter bank of \(F\) filters, the output has \(F\) channels. Parameter sharing reduces the parameter count from \(O(H \cdot W \cdot C \cdot F)\) (fully connected) to \(O(K^2 \cdot C \cdot F)\) — typically 100–1000× fewer parameters.

**Translation equivariance**: \((T_\delta \mathbf{x}) * \mathbf{k} = T_\delta(\mathbf{x} * \mathbf{k})\) where \(T_\delta\) is a spatial shift. Convolutional layers produce the same feature at shifted positions, regardless of where the feature appears in the image.

**Pooling**: max-pooling or average-pooling over spatial windows introduces approximate **translation invariance** and reduces spatial resolution, expanding the receptive field.

## 4.2 CNN Architectures

**LeNet** (LeCun et al., 1998): two convolutional layers followed by fully connected layers; the archetype for all subsequent CNNs.

**AlexNet** (Krizhevsky, Sutskever, Hinton, 2012): first deep CNN to win ImageNet LSVRC. Five convolutional layers, three fully connected; introduced ReLU activation and dropout.

**VGG** (Simonyan & Zisserman, 2014): very deep (16–19 layers) with only \(3 \times 3\) filters; demonstrated that depth with small filters outperforms shallow networks with large filters.

**ResNet** (He et al., 2016): introduced **skip connections** (residual connections):

\[
\mathbf{h}^{(l+1)} = \sigma(\mathbf{h}^{(l)} + F(\mathbf{h}^{(l)}; W^{(l)}))
\]

The skip connection allows gradients to bypass layers, enabling training of 100–1000-layer networks. The identity shortcut provides a gradient highway, alleviating vanishing gradients. ResNets achieve human-level performance on ImageNet.

## 4.3 Receptive Field and Representation

The **receptive field** of a unit is the region of the input that affects its activation. After \(L\) convolutional layers each with kernel size \(k\):

\[
r_L = 1 + L(k-1)
\]

For a ResNet with 50 layers and \(3 \times 3\) filters, the receptive field at the deepest layer is \(r = 101 \times 101\) — covering nearly the entire \(224 \times 224\) input image.

**Feature visualization** (Zeiler & Fergus, 2014) reveals the features learned at each layer: early layers detect edges and colors; middle layers detect textures and shapes; deep layers detect object parts and abstract concepts. This hierarchical feature learning is why deep CNNs generalize well across vision tasks.

---

# Chapter 5: Regularization and Normalization

## 5.1 Regularization

Without regularization, deep networks with millions of parameters overfit training data. Classical regularizers penalize weight magnitude:

**L2 regularization (weight decay)**: \(\mathcal{L}_{\text{reg}} = \mathcal{L} + \frac{\lambda}{2}\|\theta\|_2^2\). Penalizes large weights; equivalent to a Gaussian prior \(p(\theta) \propto \exp(-\lambda\|\theta\|^2/2)\).

**L1 regularization**: \(\mathcal{L}_{\text{reg}} = \mathcal{L} + \lambda\|\theta\|_1\). Promotes sparsity — drives many weights to exactly zero. Useful for model compression.

**Dropout** (Srivastava et al., 2014): during training, independently zero each activation with probability \(p_{\text{drop}}\). At test time, scale activations by \((1 - p_{\text{drop}})\). Dropout prevents co-adaptation of neurons and can be viewed as training an exponential ensemble of sub-networks.

**Data augmentation**: creating additional training examples by applying label-preserving transformations (random crops, flips, color jitter, mixup, cutout) reduces effective overfitting without modifying the model.

## 5.2 Batch Normalization

**Batch normalization** (Ioffe & Szegedy, 2015) normalizes the pre-activation at each layer across the mini-batch:

\[
\hat{z}_i = \frac{z_i - \mu_\mathcal{B}}{\sqrt{\sigma_\mathcal{B}^2 + \epsilon}}, \quad y_i = \gamma \hat{z}_i + \beta
\]

where \(\mu_\mathcal{B}, \sigma_\mathcal{B}^2\) are the mini-batch mean and variance, and \(\gamma, \beta\) are learnable scale and shift parameters. At inference, population statistics (exponential moving averages accumulated during training) replace mini-batch statistics.

**Effects of batch normalization**:
- Reduces internal covariate shift, allowing larger learning rates.
- Acts as a regularizer (adding noise through batch statistics), reducing the need for dropout.
- Smoothes the loss landscape, improving convergence.

**Layer normalization** (Ba et al., 2016) normalizes across features rather than across the batch:

\[
\hat{z} = \frac{z - \mu_{\text{layer}}}{\sqrt{\sigma_{\text{layer}}^2 + \epsilon}}, \quad \mu_{\text{layer}} = \frac{1}{D}\sum_d z_d
\]

Layer normalization is used in transformers and RNNs where batch statistics are ill-defined (variable-length sequences; small batch sizes in inference).

---

# Chapter 6: Autoencoders and Latent Representations

## 6.1 Deterministic Autoencoders

An **autoencoder** learns a compressed representation (code) of the data by training a network to reconstruct its input through a bottleneck. The encoder \(q_\phi: \mathcal{X} \to \mathcal{Z}\) maps input \(\mathbf{x}\) to latent code \(\mathbf{z} = q_\phi(\mathbf{x})\); the decoder \(p_\theta: \mathcal{Z} \to \mathcal{X}\) reconstructs \(\hat{\mathbf{x}} = p_\theta(\mathbf{z})\). Training minimizes reconstruction error:

\[
\mathcal{L}(\phi, \theta) = \frac{1}{N}\sum_i \|\mathbf{x}_i - p_\theta(q_\phi(\mathbf{x}_i))\|^2
\]

**Undercomplete autoencoders** have \(\dim(\mathcal{Z}) < \dim(\mathcal{X})\), forcing compression. The bottleneck forces the model to learn the most salient features. PCA is the special case where encoder and decoder are linear and the loss is MSE.

**Denoising autoencoders** train to reconstruct \(\mathbf{x}\) from a corrupted version \(\tilde{\mathbf{x}} = \mathbf{x} + \epsilon\), learning to extract robust features invariant to noise.

## 6.2 Variational Autoencoders

The **Variational Autoencoder (VAE)** (Kingma & Welling, 2014) is a probabilistic generative model that learns a latent variable distribution \(p_\theta(\mathbf{x}|\mathbf{z})p(\mathbf{z})\). The encoder parameterizes a posterior approximation \(q_\phi(\mathbf{z}|\mathbf{x}) = \mathcal{N}(\mu_\phi(\mathbf{x}), \text{diag}(\sigma_\phi^2(\mathbf{x})))\).

Training maximizes the **Evidence Lower Bound (ELBO)**:

\[
\mathcal{L}_{\text{ELBO}}(\phi, \theta) = \mathbb{E}_{q_\phi(\mathbf{z}|\mathbf{x})}[\log p_\theta(\mathbf{x}|\mathbf{z})] - D_{\text{KL}}(q_\phi(\mathbf{z}|\mathbf{x}) \| p(\mathbf{z}))
\]

The first term is the reconstruction likelihood; the second penalizes the posterior from deviating from the standard Gaussian prior \(p(\mathbf{z}) = \mathcal{N}(0, I)\). The **reparameterization trick** enables backpropagation through the sampling step: \(\mathbf{z} = \mu + \sigma \odot \boldsymbol{\epsilon}\), \(\boldsymbol{\epsilon} \sim \mathcal{N}(0,I)\).

---

# Chapter 7: Diffusion Models

## 7.1 Forward Noising Process

**Diffusion models** (Ho et al., 2020) define a Markov chain that gradually adds Gaussian noise to data over \(T\) steps:

\[
q(\mathbf{x}_t | \mathbf{x}_{t-1}) = \mathcal{N}(\mathbf{x}_t; \sqrt{1-\beta_t}\mathbf{x}_{t-1}, \beta_t I)
\]

Using \(\alpha_t = 1 - \beta_t\) and \(\bar{\alpha}_t = \prod_{s=1}^t \alpha_s\), the marginal at step \(t\) has a closed form:

\[
q(\mathbf{x}_t | \mathbf{x}_0) = \mathcal{N}(\mathbf{x}_t; \sqrt{\bar{\alpha}_t}\mathbf{x}_0, (1-\bar{\alpha}_t)I)
\]

At \(T \to \infty\) with an appropriate noise schedule, \(\mathbf{x}_T \approx \mathcal{N}(0, I)\) — pure Gaussian noise.

## 7.2 Reverse Process and Training

The **reverse process** learns to denoise: starting from noise \(\mathbf{x}_T \sim \mathcal{N}(0,I)\), iteratively sample:

\[
p_\theta(\mathbf{x}_{t-1}|\mathbf{x}_t) = \mathcal{N}(\mathbf{x}_{t-1}; \mu_\theta(\mathbf{x}_t, t), \Sigma_\theta(\mathbf{x}_t, t))
\]

The neural network \(\epsilon_\theta(\mathbf{x}_t, t)\) is trained to predict the noise \(\boldsymbol{\epsilon}\) added to \(\mathbf{x}_0\) to produce \(\mathbf{x}_t\):

\[
\mathcal{L}_{\text{simple}} = \mathbb{E}_{t, \mathbf{x}_0, \boldsymbol{\epsilon}}\left[\|\boldsymbol{\epsilon} - \epsilon_\theta(\sqrt{\bar{\alpha}_t}\mathbf{x}_0 + \sqrt{1-\bar{\alpha}_t}\boldsymbol{\epsilon}, t)\|^2\right]
\]

This is a denoising score matching objective: the network learns the score function \(\nabla_{\mathbf{x}_t} \log q(\mathbf{x}_t)\) (up to scale).

## 7.3 Conditional Generation and Classifier-Free Guidance

**Classifier-free guidance (CFG)** (Ho & Salimans, 2022) trains a single conditional diffusion model \(\epsilon_\theta(\mathbf{x}_t, c)\) alongside an unconditional model \(\epsilon_\theta(\mathbf{x}_t, \varnothing)\) (condition dropped with probability \(p\) during training). At generation time, the guided score is:

\[
\tilde{\epsilon} = (1 + w)\epsilon_\theta(\mathbf{x}_t, c) - w\epsilon_\theta(\mathbf{x}_t, \varnothing)
\]

Higher guidance scale \(w\) increases adherence to the condition \(c\) at the cost of diversity. CFG is the mechanism behind Stable Diffusion, DALL-E 2, and Imagen's controllable image generation.

---

# Chapter 8: Contrastive Learning

## 8.1 Self-Supervised Representation Learning

**Contrastive learning** trains encoders to map similar inputs close together in embedding space and dissimilar inputs far apart, without labeled data. The key idea is to define **positive pairs** (semantically related inputs) and **negative pairs** from the data itself.

**SimCLR** (Chen et al., 2020) creates positive pairs by applying two different random augmentations to the same image: \((\mathbf{x}_i^{(1)}, \mathbf{x}_i^{(2)})\). The **NT-Xent loss** for a mini-batch of \(N\) samples (creating \(2N\) augmented views):

\[
\mathcal{L}_{i,j} = -\log \frac{\exp(\text{sim}(\mathbf{z}_i, \mathbf{z}_j)/\tau)}{\sum_{k=1}^{2N} \mathbf{1}[k \neq i]\exp(\text{sim}(\mathbf{z}_i, \mathbf{z}_k)/\tau)}
\]

where \(\text{sim}(\mathbf{u}, \mathbf{v}) = \mathbf{u}^T\mathbf{v}/(\|\mathbf{u}\|\|\mathbf{v}\|)\) is cosine similarity and \(\tau\) is temperature.

## 8.2 CLIP — Multimodal Contrastive Learning

**CLIP** (Radford et al., 2021) trains a joint image-text embedding space by contrasting \(N^2 - N\) negative pairs in a batch of \(N\) image-text pairs. A vision encoder \(f_V\) and text encoder \(f_T\) produce embeddings; CLIP maximizes the cosine similarity of matching pairs and minimizes non-matching pairs:

\[
\mathcal{L}_{\text{CLIP}} = -\frac{1}{2N}\left[\sum_i \log \frac{\exp(f_V^i \cdot f_T^i / \tau)}{\sum_j \exp(f_V^i \cdot f_T^j/\tau)} + \sum_i \log \frac{\exp(f_T^i \cdot f_V^i/\tau)}{\sum_j \exp(f_T^i \cdot f_V^j/\tau)}\right]
\]

Trained on 400 million web-scale image-text pairs, CLIP demonstrates **zero-shot transfer**: given a natural language description of a class, CLIP classifies images into that class without any task-specific fine-tuning. CLIP embeddings are used in Stable Diffusion's conditioning.

---

# Chapter 9: Sequence Models and Transformers

## 9.1 Recurrent Neural Networks

A **RNN** processes a sequence \((\mathbf{x}_1, \ldots, \mathbf{x}_T)\) by maintaining a hidden state:

\[
\mathbf{h}_t = \sigma(W_h \mathbf{h}_{t-1} + W_x \mathbf{x}_t + \mathbf{b})
\]

RNNs share parameters across time and can handle variable-length sequences. However, gradients through many time steps can vanish or explode. **LSTM** (Hochreiter & Schmidhuber, 1997) uses gating to selectively retain and forget information:

\[
\mathbf{f}_t = \sigma(W_f[\mathbf{h}_{t-1}, \mathbf{x}_t] + \mathbf{b}_f) \quad \text{(forget gate)}
\]

\[
\mathbf{i}_t = \sigma(W_i[\mathbf{h}_{t-1}, \mathbf{x}_t] + \mathbf{b}_i) \quad \text{(input gate)}
\]

\[
\mathbf{c}_t = \mathbf{f}_t \odot \mathbf{c}_{t-1} + \mathbf{i}_t \odot \tanh(W_c[\mathbf{h}_{t-1}, \mathbf{x}_t] + \mathbf{b}_c)
\]

The cell state \(\mathbf{c}_t\) acts as a memory that the forget gate can preserve intact across many steps.

## 9.2 Attention Mechanism

**Attention** (Bahdanau et al., 2015) allows the decoder to focus on different encoder positions when generating each output token. For a query \(\mathbf{q}\), keys \(\mathbf{K}\), and values \(\mathbf{V}\):

\[
\text{Attention}(\mathbf{q}, K, V) = \text{softmax}\left(\frac{\mathbf{q}K^T}{\sqrt{d_k}}\right)V
\]

The dot product \(\mathbf{q}K^T\) measures compatibility; scaling by \(\sqrt{d_k}\) prevents softmax saturation for large key dimensions.

## 9.3 The Transformer

The **Transformer** (Vaswani et al., 2017) replaces recurrence with **self-attention**, processing all tokens in parallel:

\[
\text{Self-Attention}(X) = \text{softmax}\left(\frac{XW_Q(XW_K)^T}{\sqrt{d_k}}\right)XW_V
\]

**Multi-head attention** runs \(H\) attention heads in parallel:

\[
\text{MHA}(X) = \text{Concat}(\text{head}_1, \ldots, \text{head}_H)W_O, \quad \text{head}_h = \text{Attention}(XW_Q^h, XW_K^h, XW_V^h)
\]

Each head can attend to different aspects of the input; concatenation captures diverse feature interactions.

A Transformer **encoder block** consists of:
1. Multi-head self-attention (with residual connection and layer norm)
2. Position-wise feedforward network: \(\text{FFN}(\mathbf{h}) = \text{ReLU}(\mathbf{h}W_1 + b_1)W_2 + b_2\) (with residual + layer norm)

**Positional encoding** adds position information to token embeddings (since attention is permutation-invariant):

\[
\text{PE}(\text{pos}, 2i) = \sin(\text{pos}/10000^{2i/d}), \quad \text{PE}(\text{pos}, 2i+1) = \cos(\text{pos}/10000^{2i/d})
\]

Modern models use **rotary positional embeddings (RoPE)** or **ALiBi** instead.

## 9.4 Vision Transformers

**ViT** (Dosovitskiy et al., 2021) applies the Transformer directly to image patches. An image \(\mathbf{x} \in \mathbb{R}^{H \times W \times C}\) is partitioned into \(N = HW/P^2\) patches of size \(P \times P\). Each patch is linearly projected to a \(d\)-dimensional embedding; a learnable [CLS] token is prepended. The sequence is processed by a standard Transformer encoder, and the [CLS] representation is used for classification.

ViT requires pre-training on large datasets (JFT-300M) to outperform CNNs due to the lack of translation equivariance. **DeiT** (Touvron et al., 2021) trains ViT on ImageNet-1K using knowledge distillation from a CNN teacher, achieving competitive performance without large-scale pre-training.

---

# Chapter 10: Graph Neural Networks

## 10.1 Message Passing Framework

A **graph neural network** iteratively updates node representations by aggregating information from neighbors. The general **message passing** framework:

\[
\mathbf{m}_{v}^{(l)} = \text{AGG}\left(\{M^{(l)}(\mathbf{h}_v^{(l-1)}, \mathbf{h}_u^{(l-1)}, \mathbf{e}_{vu}) : u \in \mathcal{N}(v)\}\right)
\]

\[
\mathbf{h}_v^{(l)} = U^{(l)}\left(\mathbf{h}_v^{(l-1)}, \mathbf{m}_v^{(l)}\right)
\]

where \(M^{(l)}\) is the message function, \(\text{AGG}\) is a permutation-invariant aggregation (sum, mean, max), \(U^{(l)}\) is the update function, and \(\mathbf{e}_{vu}\) are edge features.

**Graph Convolutional Network (GCN)** (Kipf & Welling, 2017) uses a simple normalized sum aggregation:

\[
\mathbf{h}_v^{(l+1)} = \sigma\left(W^{(l)} \sum_{u \in \mathcal{N}(v) \cup \{v\}} \frac{1}{\sqrt{d_u d_v}} \mathbf{h}_u^{(l)}\right)
\]

where \(d_v\) is the degree of node \(v\). The normalization \(1/\sqrt{d_u d_v}\) prevents high-degree nodes from dominating.

## 10.2 Expressiveness and the Weisfeiler-Lehman Test

The **Weisfeiler-Lehman (WL) graph isomorphism test** iteratively refines node colorings by hashing each node's neighborhood. GCNs with sum aggregation are at most as powerful as 1-WL: they cannot distinguish certain pairs of non-isomorphic graphs.

**Graph Isomorphism Network (GIN)** (Xu et al., 2019) achieves maximum 1-WL expressiveness by using sum aggregation with a learned \(\epsilon\) parameter:

\[
\mathbf{h}_v^{(l+1)} = \text{MLP}^{(l)}\left((1 + \epsilon^{(l)})\mathbf{h}_v^{(l)} + \sum_{u \in \mathcal{N}(v)} \mathbf{h}_u^{(l)}\right)
\]

For molecular property prediction and other graph-level tasks, GNNs produce graph representations by pooling node representations (sum, mean, or hierarchical pooling).

---

# Chapter 11: Large Language Models

## 11.1 Scaling Laws

**Scaling laws** (Kaplan et al., 2020) characterize how LLM test loss \(\mathcal{L}\) scales with model size \(N\) (parameters), dataset size \(D\) (tokens), and compute \(C = 6ND\) (FLOP):

\[
\mathcal{L}(N) \approx \left(\frac{N_c}{N}\right)^{\alpha_N}, \quad \mathcal{L}(D) \approx \left(\frac{D_c}{D}\right)^{\alpha_D}
\]

with empirical exponents \(\alpha_N \approx 0.076\) and \(\alpha_D \approx 0.095\). These power laws hold across 6 orders of magnitude in scale. The **Chinchilla scaling law** (Hoffmann et al., 2022) shows that for a fixed compute budget, optimal models are smaller than previously thought and require substantially more tokens: roughly \(N \propto C^{0.5}\) and \(D \propto C^{0.5}\).

## 11.2 Pre-training and the Autoregressive Language Model

GPT-style models are trained to predict the next token:

\[
\mathcal{L}_{\text{LM}} = -\sum_{t=1}^T \log p_\theta(x_t | x_1, \ldots, x_{t-1})
\]

The **causal attention mask** ensures token \(t\) cannot attend to tokens \(t+1, \ldots, T\), preserving the autoregressive property. During inference, tokens are sampled one by one from \(p_\theta(x_t|\text{context})\).

**Instruction tuning** (Wei et al., 2022; Ouyang et al., 2022) fine-tunes the pre-trained model on a dataset of (instruction, response) pairs to improve instruction-following. **RLHF (Reinforcement Learning from Human Feedback)** further aligns the model using human preferences: a reward model is trained to predict human preference judgments, then the language model is fine-tuned with PPO to maximize expected reward.

## 11.3 Chain-of-Thought Reasoning

**Chain-of-thought (CoT) prompting** (Wei et al., 2022) improves reasoning performance on multi-step problems by prompting the model to generate intermediate reasoning steps before the final answer. Providing a few examples with explicit reasoning chains (few-shot CoT) elicits chain-of-thought in the model's completions.

CoT emerges as a capability only at sufficient model scale (∼ 100B parameters for GPT-3 level models): smaller models do not benefit from CoT prompting. **Self-consistency** (Wang et al., 2023) generates multiple reasoning paths and majority-votes the final answer, further improving accuracy.

## 11.4 Retrieval-Augmented Generation

**RAG** (Piktus et al., 2020; Lewis et al., 2020) augments the language model with a retrieval component: given a query, retrieve relevant documents from a large corpus, concatenate them with the query, and generate an answer conditioned on both. This overcomes the LLM's knowledge cutoff and reduces hallucination for knowledge-intensive tasks.

The retrieval component uses dense embeddings: documents are embedded with a bi-encoder; queries retrieve the top-\(k\) documents by maximum inner product search (FAISS, ScaNN). The reader generates the final answer from the retrieved context.

---

# Chapter 12: Generalization and Foundation Model Applications

## 12.1 The Double-Descent Phenomenon

Classical statistical learning theory predicts a bias-variance trade-off: as model complexity increases, test error decreases (bias reduction), then increases (variance increase), forming a U-shaped curve. Deep learning consistently violates this theory: test error decreases again beyond the classical optimal complexity — the **double descent** phenomenon (Nakkiran et al., 2019).

The second descent occurs in the interpolation regime (where the model fits the training data exactly) and is explained by the implicit regularization of gradient descent in over-parameterized models. **Neural collapse** (Papyan, Han & Donoho, 2020) characterizes the geometry of deep representations at the terminal phase of training: class means collapse to the vertices of a simplex equiangular tight frame, and within-class variance collapses to zero, independent of the data distribution.

## 12.2 AlphaFold and Scientific Applications

**AlphaFold2** (Jumper et al., 2021) predicts protein 3D structure from amino acid sequence with atomic-level accuracy, solving a 50-year grand challenge in structural biology. Key innovations:

- **Evoformer**: a transformer-based module operating on both the multiple sequence alignment (MSA) and pairwise residue representations simultaneously, iteratively refining both.
- **Structure module**: directly predicts 3D coordinates from the pair representation, outputting backbone frames and torsion angles.
- **Self-distillation**: AlphaFold2 uses structures predicted by itself as additional training data, improving performance through unlabeled data.

AlphaFold2 achieves median backbone RMS deviation < 1 Å on CASP14 targets, outperforming all other methods by a large margin. Its release of predicted structures for 214 million proteins in the AlphaFold Protein Structure Database has transformed structural biology and drug discovery.

## 12.3 Ethics in Deep Learning

**Fairness**: neural networks trained on biased data can perpetuate or amplify discriminatory outcomes. Fairness constraints (demographic parity, equalized odds, individual fairness) can be incorporated as regularizers or post-processing steps. The tension between different fairness metrics (it is impossible to simultaneously satisfy all) requires careful specification of the social context.

**Differential privacy (DP)**: training with DP-SGD (Abadi et al., 2016) adds calibrated Gaussian noise to gradients, providing a formal bound on information leakage about individual training examples. DP guarantees: the probability that any output reveals any individual's participation in the training set is bounded by a factor \(e^\epsilon\). DP training typically reduces model accuracy for a given privacy budget.

**Robustness and security**: adversarial examples — imperceptibly perturbed inputs that fool neural networks — reveal brittleness. **Adversarial training** (Madry et al., 2018) trains on worst-case perturbed inputs via projected gradient descent (PGD):

\[
\mathbf{x}^* = \arg\max_{\|\boldsymbol{\delta}\|_p \leq \epsilon} \mathcal{L}(f_\theta(\mathbf{x} + \boldsymbol{\delta}), y)
\]

Adversarial training improves robustness at the cost of clean accuracy — a fundamental trade-off that remains an active research area.

**Collective action and governance**: the concentration of compute and data required to train frontier models creates power asymmetries. Open-source models (LLaMA, Mistral) democratize access; model cards and datasheets improve transparency; deployment restrictions (usage policies, access controls) balance openness against misuse risk.
