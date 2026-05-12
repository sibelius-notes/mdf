---
title: "STAT 940: Deep Learning"
prof: "Ali Ghodsi"
subjects: "STAT"
ai_track: true
---

## Sources and References
**Primary texts** — Ian Goodfellow, Yoshua Bengio, and Aaron Courville, *Deep Learning* (MIT Press, 2016); Christopher Bishop and Hugh Bishop, *Deep Learning: Foundations and Concepts* (Springer, 2024).
**Online resources** — Stanford CS231n (CNNs for Visual Recognition); Stanford CS224n (NLP with Deep Learning); fast.ai Practical Deep Learning course; Jay Alammar's illustrated transformer blog series; Lilian Weng's blog on diffusion models.

# Chapter 1: Feedforward Deep Networks

## 1.1 From Linear Models to Deep Networks

The story of modern deep learning begins with the simplest computational building block: the linear classifier. Given an input vector \(\mathbf{x} \in \mathbb{R}^d\), a linear model produces an output \(\hat{y} = \mathbf{w}^\top \mathbf{x} + b\) for some weight vector \(\mathbf{w}\) and bias \(b\). While linear models are interpretable and computationally convenient, they cannot represent the highly nonlinear input–output relationships present in natural images, speech, or language. The central insight of deep learning is that by composing many simple nonlinear transformations, a network can learn hierarchical representations of arbitrarily complex data.

The **perceptron**, introduced by Rosenblatt in 1958, was the first trainable linear classifier. Given a binary label \(y \in \{-1, +1\}\), the perceptron update rule adjusts \(\mathbf{w}\) whenever a training example is misclassified. Although the perceptron convergence theorem guarantees that the rule finds a separating hyperplane if one exists, the model fails on non-linearly separable problems — a limitation famously documented by Minsky and Papert. The solution is to stack multiple layers.

## 1.2 Activation Functions

A multilayer network inserts a pointwise nonlinearity \(\sigma\) after each linear transformation. Without such nonlinearities, the composition of linear maps is itself linear, and stacking layers would provide no representational benefit. Several activation functions have proven effective in practice.

<div class="definition">
<strong>Sigmoid activation.</strong> The sigmoid function is defined by

\[ \sigma(z) = \frac{1}{1 + e^{-z}}. \]

It maps \(\mathbb{R}\) to \((0,1)\) and was historically used in the output layer for binary classification and in hidden layers. Its derivative satisfies \(\sigma'(z) = \sigma(z)(1-\sigma(z))\), which vanishes for large \(|z|\), contributing to the vanishing gradient problem.
</div>

<div class="definition">
<strong>Hyperbolic tangent.</strong> The tanh activation is defined by

\[ \tanh(z) = \frac{e^z - e^{-z}}{e^z + e^{-z}} = 2\sigma(2z) - 1. \]

It maps \(\mathbb{R}\) to \((-1,1)\) and is zero-centered, which often aids optimization compared to the sigmoid.
</div>

<div class="definition">
<strong>Rectified Linear Unit (ReLU).</strong> The ReLU activation is defined by

\[ \text{ReLU}(z) = \max(0, z). \]

ReLU is piecewise linear and does not saturate for positive inputs, alleviating the vanishing gradient problem. However, neurons receiving consistently negative pre-activations produce zero gradient — a phenomenon known as the <em>dying ReLU</em> problem. Variants such as Leaky ReLU and ELU address this by allowing a small negative slope.
</div>

<div class="definition">
<strong>GELU activation.</strong> The Gaussian Error Linear Unit is defined by

\[ \text{GELU}(z) = z \cdot \Phi(z), \]

where \(\Phi\) is the standard normal CDF. It can be approximated as \(\text{GELU}(z) \approx 0.5z\left(1 + \tanh\!\left[\sqrt{2/\pi}\,(z + 0.044715\,z^3)\right]\right)\). GELU has become the standard activation in transformer architectures such as BERT and GPT.
</div>

## 1.3 The Multilayer Perceptron

A **multilayer perceptron** (MLP), also called a feedforward neural network, is defined by a sequence of affine transformations interleaved with elementwise nonlinearities. Let \(L\) denote the number of layers, \(\mathbf{h}^{(0)} = \mathbf{x}\) the input, and for \(\ell = 1, \ldots, L\):

\[ \mathbf{a}^{(\ell)} = \mathbf{W}^{(\ell)}\mathbf{h}^{(\ell-1)} + \mathbf{b}^{(\ell)}, \qquad \mathbf{h}^{(\ell)} = \sigma\!\left(\mathbf{a}^{(\ell)}\right). \]

The final layer typically uses a task-specific transformation: a softmax for multiclass classification, a sigmoid for binary classification, or the identity for regression. Denoting the network's output as \(f(\mathbf{x};\theta)\) where \(\theta\) collects all weights and biases, training minimizes an empirical risk

\[ \mathcal{L}(\theta) = \frac{1}{N}\sum_{i=1}^N \ell\!\left(f(\mathbf{x}_i;\theta),\, y_i\right) \]

over a dataset \(\{(\mathbf{x}_i, y_i)\}_{i=1}^N\). Common loss functions include cross-entropy for classification and mean squared error for regression.

## 1.4 Universal Approximation

A foundational theoretical result justifies the expressive power of MLPs.

<div class="theorem">
<strong>Universal Approximation Theorem (Cybenko 1989; Hornik 1991).</strong> Let \(\sigma : \mathbb{R} \to \mathbb{R}\) be any continuous, bounded, and nonconstant function (e.g., sigmoid). For any continuous function \(f : \left[0,1\right]^d \to \mathbb{R}\) and any \(\varepsilon > 0\), there exist \(n \in \mathbb{N}\), weights \(\mathbf{w}_j \in \mathbb{R}^d\), biases \(b_j \in \mathbb{R}\), and output weights \(\alpha_j \in \mathbb{R}\) such that the single-hidden-layer network

\[ g(\mathbf{x}) = \sum_{j=1}^n \alpha_j\, \sigma\!\left(\mathbf{w}_j^\top \mathbf{x} + b_j\right) \]

satisfies \(\sup_{\mathbf{x} \in \left[0,1\right]^d} |f(\mathbf{x}) - g(\mathbf{x})| < \varepsilon\).
</div>

<div class="remark">
The Universal Approximation Theorem guarantees existence of an approximating network but makes no claim about the width required, the ease of finding the weights by gradient descent, or the generalization of the learned function. In practice, depth (rather than width) provides more efficient representations: deep networks can represent certain functions exponentially more compactly than shallow ones. This motivates the architecture choices in modern deep learning.
</div>

## 1.5 Computational Graphs and Backpropagation

Training a neural network requires computing gradients of the loss with respect to all parameters. **Backpropagation** is an efficient algorithm for this purpose, implementing the chain rule of calculus over the computational graph of the network.

A **computational graph** represents the computation as a directed acyclic graph (DAG) in which nodes correspond to variables (scalars, vectors, or tensors) and edges represent functional dependencies. Each node stores both its forward-pass value and a rule for propagating gradients backward.

For a scalar loss \(\mathcal{L}\) and a chain of composed functions, the chain rule states:

\[ \frac{\partial \mathcal{L}}{\partial \mathbf{a}^{(\ell)}} = \frac{\partial \mathcal{L}}{\partial \mathbf{h}^{(\ell)}} \odot \sigma'\!\left(\mathbf{a}^{(\ell)}\right), \]

\[ \frac{\partial \mathcal{L}}{\partial \mathbf{W}^{(\ell)}} = \frac{\partial \mathcal{L}}{\partial \mathbf{a}^{(\ell)}} \left(\mathbf{h}^{(\ell-1)}\right)^\top, \qquad \frac{\partial \mathcal{L}}{\partial \mathbf{b}^{(\ell)}} = \frac{\partial \mathcal{L}}{\partial \mathbf{a}^{(\ell)}}, \]

\[ \frac{\partial \mathcal{L}}{\partial \mathbf{h}^{(\ell-1)}} = \left(\mathbf{W}^{(\ell)}\right)^\top \frac{\partial \mathcal{L}}{\partial \mathbf{a}^{(\ell)}}. \]

Here \(\odot\) denotes the elementwise (Hadamard) product. The backward pass proceeds from layer \(L\) to layer \(1\), reusing intermediate activations stored during the forward pass. The total computational cost is \(O(L)\) passes, making backpropagation linear in network depth.

<div class="example">
<strong>Two-layer network gradient.</strong> Consider a two-layer network with ReLU hidden activations and mean squared error loss. Given input \(\mathbf{x}\), hidden pre-activation \(\mathbf{a} = \mathbf{W}^{(1)}\mathbf{x} + \mathbf{b}^{(1)}\), hidden activation \(\mathbf{h} = \text{ReLU}(\mathbf{a})\), and output \(\hat{y} = \mathbf{w}^{(2)\top}\mathbf{h} + b^{(2)}\) with loss \(\mathcal{L} = \frac{1}{2}(\hat{y} - y)^2\), the backward pass gives: \(\delta_{\text{out}} = \hat{y} - y\); gradient of output weights \(\nabla_{\mathbf{w}^{(2)}} = \delta_{\text{out}}\,\mathbf{h}\); hidden error \(\boldsymbol{\delta} = \delta_{\text{out}}\,\mathbf{w}^{(2)} \odot \mathbf{1}\left[\mathbf{a} > 0\right]\); gradient of first-layer weights \(\nabla_{\mathbf{W}^{(1)}} = \boldsymbol{\delta}\,\mathbf{x}^\top\).
</div>

---

# Chapter 2: Optimization and Regularization

## 2.1 Loss Landscapes and Gradient Descent

The loss function \(\mathcal{L}(\theta)\) defines a surface over the high-dimensional parameter space. Unlike convex objectives, neural network loss landscapes are non-convex, containing saddle points, local minima, and flat regions. Empirically, first-order gradient methods find solutions of remarkably good generalization quality, though the theoretical understanding of why remains an active area of research.

**Batch gradient descent** updates parameters by computing the gradient over the entire dataset:

\[ \theta \leftarrow \theta - \eta \nabla_\theta \mathcal{L}(\theta), \]

where \(\eta > 0\) is the learning rate. This is computationally prohibitive for large datasets. **Stochastic gradient descent** (SGD) approximates the true gradient using a single randomly chosen example, while **mini-batch SGD** uses a batch of \(B\) examples:

\[ \theta \leftarrow \theta - \frac{\eta}{B} \sum_{i \in \mathcal{B}} \nabla_\theta \ell(f(\mathbf{x}_i;\theta), y_i). \]

The stochastic noise in mini-batch gradients acts as an implicit regularizer, often helping escape sharp minima.

## 2.2 Momentum and Adaptive Methods

<div class="definition">
<strong>SGD with Momentum.</strong> Momentum accumulates a velocity vector in the direction of persistent gradient flow, damping oscillations across dimensions:

\[ \mathbf{v} \leftarrow \mu\,\mathbf{v} - \eta\,\nabla_\theta \mathcal{L}(\theta), \qquad \theta \leftarrow \theta + \mathbf{v}, \]

where \(\mu \in [0,1)\) is the momentum coefficient (typically 0.9). Nesterov momentum evaluates the gradient at the "lookahead" point \(\theta + \mu\mathbf{v}\), providing slightly better convergence guarantees for convex objectives.
</div>

**RMSProp** addresses the challenge that different parameters may require different effective learning rates. It maintains a running average of squared gradients:

\[ \mathbf{s} \leftarrow \rho\,\mathbf{s} + (1-\rho)\,\left(\nabla_\theta \mathcal{L}\right)^2, \qquad \theta \leftarrow \theta - \frac{\eta}{\sqrt{\mathbf{s} + \varepsilon}} \nabla_\theta \mathcal{L}, \]

where \(\rho \approx 0.9\) and \(\varepsilon\) is a small stabilizing constant.

<div class="definition">
<strong>Adam optimizer.</strong> Adam (Kingma and Ba, 2015) combines momentum and RMSProp. Let \(\mathbf{g}_t = \nabla_\theta \mathcal{L}_t(\theta)\). The algorithm maintains first-moment estimate \(\mathbf{m}\) and second-moment estimate \(\mathbf{v}\):

<ol>
  <li>\(\mathbf{m}_t \leftarrow \beta_1 \mathbf{m}_{t-1} + (1-\beta_1)\mathbf{g}_t\)</li>
  <li>\(\mathbf{v}_t \leftarrow \beta_2 \mathbf{v}_{t-1} + (1-\beta_2)\mathbf{g}_t^2\)</li>
  <li>Bias correction: \(\hat{\mathbf{m}}_t = \mathbf{m}_t / (1 - \beta_1^t)\), \(\hat{\mathbf{v}}_t = \mathbf{v}_t / (1 - \beta_2^t)\)</li>
  <li>\(\theta_t \leftarrow \theta_{t-1} - \eta\, \hat{\mathbf{m}}_t / (\sqrt{\hat{\mathbf{v}}_t} + \varepsilon)\)</li>
</ol>

Default hyperparameters are \(\beta_1 = 0.9\), \(\beta_2 = 0.999\), \(\varepsilon = 10^{-8}\). The bias correction accounts for the initialization of \(\mathbf{m}_0 = \mathbf{v}_0 = \mathbf{0}\), which otherwise biases estimates toward zero in early iterations.
</div>

## 2.3 Learning Rate Schedules

A fixed learning rate is rarely optimal throughout training. Common schedules include step decay (multiply \(\eta\) by a factor after every \(k\) epochs), cosine annealing (\(\eta_t = \eta_{\min} + \frac{1}{2}(\eta_{\max} - \eta_{\min})(1 + \cos(\pi t / T))\)), and warmup followed by decay (used in transformer training). The **linear warmup** phase prevents large gradient steps early in training when parameters are randomly initialized.

## 2.4 Regularization

Regularization encompasses techniques that reduce overfitting by constraining the hypothesis class or introducing noise during training.

**L2 regularization** (weight decay) adds a penalty \(\frac{\lambda}{2}\|\theta\|_2^2\) to the loss, encouraging small weights and effectively shrinking them toward zero. The gradient update becomes \(\theta \leftarrow (1 - \eta\lambda)\theta - \eta\nabla_\theta \mathcal{L}\). **L1 regularization** uses \(\lambda\|\theta\|_1\), which induces sparsity by driving many weights to exactly zero.

<div class="definition">
<strong>Dropout.</strong> Dropout (Srivastava et al., 2014) is a stochastic regularization method. During training, each neuron's activation is independently set to zero with probability \(p\) (the dropout rate), using a Bernoulli mask \(\mathbf{m} \sim \text{Bernoulli}(1-p)^n\):

\[ \tilde{\mathbf{h}} = \frac{\mathbf{m} \odot \mathbf{h}}{1 - p}. \]

The division by \(1-p\) (inverted dropout) ensures that the expected activation magnitude is preserved. At test time, no masking is applied. Dropout can be interpreted as training an exponential ensemble of \(2^n\) subnetworks that share weights, and making predictions via an approximate geometric mean of their outputs.
</div>

<div class="definition">
<strong>Batch Normalization.</strong> Batch normalization (Ioffe and Szegedy, 2015) normalizes each feature across the mini-batch. Given a mini-batch \(\{\mathbf{x}_1, \ldots, \mathbf{x}_B\}\) and a feature dimension \(j\), compute:

\[ \mu_j = \frac{1}{B}\sum_{i=1}^B x_{ij}, \qquad \sigma_j^2 = \frac{1}{B}\sum_{i=1}^B (x_{ij} - \mu_j)^2. \]

The normalized activation is:

\[ \hat{x}_{ij} = \frac{x_{ij} - \mu_j}{\sqrt{\sigma_j^2 + \varepsilon}}, \]

followed by a learned affine transform \(y_{ij} = \gamma_j \hat{x}_{ij} + \beta_j\). At test time, running statistics accumulated during training replace the mini-batch statistics. Batch normalization reduces internal covariate shift, allows higher learning rates, and acts as a regularizer by introducing noise through batch statistics.
</div>

**Layer normalization** normalizes across features within a single example rather than across the batch dimension, making it suitable for recurrent networks and transformers where batch statistics are unreliable. For a single activation vector \(\mathbf{h} \in \mathbb{R}^d\):

\[ \text{LN}(\mathbf{h}) = \gamma \odot \frac{\mathbf{h} - \mu}{\sigma} + \beta, \quad \mu = \frac{1}{d}\sum_j h_j, \quad \sigma^2 = \frac{1}{d}\sum_j (h_j - \mu)^2. \]

**Early stopping** halts training when performance on a held-out validation set begins to degrade, implicitly constraining the effective number of training iterations. It is one of the most practical and widely used regularization strategies.

---

# Chapter 3: Convolutional Neural Networks

## 3.1 The Convolution Operation

Images exhibit strong spatial structure: nearby pixels are correlated, and meaningful patterns (edges, textures, objects) recur across different positions. Convolutional neural networks exploit this structure through three key ideas: local connectivity, weight sharing, and pooling.

<div class="definition">
<strong>Discrete convolution.</strong> For a 2D input \(I : \mathbb{Z}^2 \to \mathbb{R}\) and a filter (kernel) \(K : \mathbb{Z}^2 \to \mathbb{R}\) of size \(f \times f\), the discrete cross-correlation (loosely called convolution in the deep learning literature) at position \((i,j)\) is:

\[ (I \star K)[i,j] = \sum_{m=0}^{f-1}\sum_{n=0}^{f-1} I[i+m,\, j+n]\, K[m,n]. \]

The result is a <em>feature map</em>. In a convolutional layer with \(C_\text{in}\) input channels and \(C_\text{out}\) output channels, each output channel is the sum of cross-correlations over input channels plus a learned bias.
</div>

The number of learnable parameters in a convolutional layer with kernel size \(f\), \(C_\text{in}\) input channels, and \(C_\text{out}\) output channels is \(C_\text{out} \cdot C_\text{in} \cdot f^2 + C_\text{out}\), far fewer than a fully connected layer over the same spatial extent. **Stride** \(s\) reduces the output resolution by sampling every \(s\)-th position; **padding** preserves spatial dimensions by appending zeros around the input border.

<div class="theorem">
<strong>Translation equivariance.</strong> Let \(T_{\mathbf{v}}\) denote a spatial translation operator such that \((T_{\mathbf{v}} I)[\mathbf{x}] = I[\mathbf{x} - \mathbf{v}]\). A convolutional layer \(f\) satisfies

\[ f(T_{\mathbf{v}} I) = T_{\mathbf{v}} f(I). \]

That is, translating the input produces a corresponding translation of the feature map, not a different set of features. This property makes convolutional layers highly efficient for visual recognition tasks.
</div>

## 3.2 Pooling

Pooling layers reduce the spatial resolution of feature maps, providing a form of spatial aggregation and mild translation invariance. **Max pooling** takes the maximum value in each local window; **average pooling** takes the mean. **Global average pooling** collapses each feature map to a single scalar, and is commonly used in modern architectures before the final classification layer.

## 3.3 Classic Architectures

**LeNet-5** (LeCun et al., 1998) was the first successful CNN, comprising two convolutional layers with average pooling followed by fully connected layers. It achieved near-human performance on handwritten digit recognition.

**AlexNet** (Krizhevsky et al., 2012) demonstrated the power of deep CNNs on ImageNet, achieving a top-5 error of 15.3% versus 26.2% for the previous best. Its key contributions included ReLU activations, dropout, data augmentation, and training on GPUs. AlexNet used five convolutional layers and three fully connected layers.

**VGGNet** (Simonyan and Zisserman, 2014) established the principle that deeper networks using only \(3 \times 3\) convolutions outperform shallower networks with larger kernels. A stack of two \(3 \times 3\) convolutions has the same receptive field as one \(5 \times 5\) convolution but fewer parameters. VGG-16 and VGG-19 became standard feature extractors for transfer learning.

## 3.4 Residual Networks

Very deep networks (beyond ~20 layers) suffered from degradation: training accuracy paradoxically decreases with added depth. He et al. (2016) solved this with residual connections.

<div class="definition">
<strong>Residual block.</strong> A residual block with input \(\mathbf{x} \in \mathbb{R}^C\) computes:

\[ \mathbf{y} = \mathcal{F}(\mathbf{x};\, \{\mathbf{W}_i\}) + \mathbf{x}, \]

where \(\mathcal{F}\) is a small subnetwork (typically two convolutional layers with batch normalization and ReLU). The identity shortcut \(\mathbf{x}\) bypasses \(\mathcal{F}\), allowing gradients to flow directly through the skip connection. When dimensions mismatch, a linear projection \(\mathbf{W}_s\mathbf{x}\) is used. This formulation makes it easy to learn the identity mapping: if \(\mathcal{F} \approx \mathbf{0}\), the block passes the input unchanged.
</div>

ResNets enabled training of networks with 50, 101, and 152 layers, setting records on ImageNet and COCO. The residual connection can be interpreted as unrolling a recurrent computation, as an ensemble of exponentially many shorter paths, or as enabling gradient superhighways through skip connections.

## 3.5 Efficient Convolutions and Object Detection

**Depthwise separable convolutions**, used in MobileNet and Xception, factorize a standard convolution into a depthwise convolution (one filter per input channel) followed by a \(1 \times 1\) pointwise convolution. This reduces computation by a factor of roughly \(1/C + 1/f^2\) compared to standard convolutions.

Object detection extends image classification to localizing multiple objects. **Faster R-CNN** uses a region proposal network (RPN) that slides a small network over the convolutional feature map to propose candidate bounding boxes, then classifies each proposal with a separate head. **YOLO** (You Only Look Once) frames detection as a single regression problem: the network directly predicts bounding boxes and class probabilities from the full image in one forward pass, enabling real-time detection.

---

# Chapter 4: Recurrent Neural Networks

## 4.1 Sequence Modeling and Unfolded Computation

Many data modalities — text, speech, time series — are inherently sequential. A recurrent neural network processes sequences by maintaining a hidden state \(\mathbf{h}_t\) that summarizes the history up to time \(t\):

\[ \mathbf{h}_t = f\!\left(\mathbf{h}_{t-1},\, \mathbf{x}_t;\, \theta\right). \]

The same parameters \(\theta\) are applied at every time step, a form of weight sharing across time. Unfolding the computation across a sequence of length \(T\) produces a deep directed graph from \(\mathbf{x}_1, \ldots, \mathbf{x}_T\) to a sequence of predictions \(\hat{y}_1, \ldots, \hat{y}_T\).

For a vanilla RNN, the update equations are:

\[ \mathbf{h}_t = \tanh\!\left(\mathbf{W}_h \mathbf{h}_{t-1} + \mathbf{W}_x \mathbf{x}_t + \mathbf{b}\right), \qquad \hat{y}_t = \text{softmax}\!\left(\mathbf{W}_y \mathbf{h}_t + \mathbf{c}\right). \]

## 4.2 Backpropagation Through Time

Training RNNs requires computing gradients of the loss summed over time steps with respect to shared weights. **Backpropagation through time** (BPTT) unrolls the network over all \(T\) steps and applies standard backpropagation. The gradient of the loss with respect to \(\mathbf{h}_1\) involves a product of Jacobians:

\[ \frac{\partial \mathbf{h}_T}{\partial \mathbf{h}_1} = \prod_{t=2}^T \frac{\partial \mathbf{h}_t}{\partial \mathbf{h}_{t-1}}. \]

<div class="theorem">
<strong>Vanishing and exploding gradients (informal).</strong> Let the recurrence Jacobians \(\partial \mathbf{h}_t / \partial \mathbf{h}_{t-1}\) have spectral norm \(\rho_t\). If \(\rho_t < 1\) for all \(t\), then \(\left\|\partial \mathbf{h}_T / \partial \mathbf{h}_1\right\| \to 0\) exponentially in \(T\), causing gradients from early time steps to vanish. If \(\rho_t > 1\), gradients explode. Vanishing gradients prevent the network from learning long-range dependencies; exploding gradients destabilize training (mitigated by gradient clipping).
</div>

## 4.3 Long Short-Term Memory

The LSTM (Hochreiter and Schmidhuber, 1997) addresses vanishing gradients by introducing a cell state \(\mathbf{c}_t\) that can carry information across many time steps with minimal interference. Four gates regulate information flow:

<div class="definition">
<strong>LSTM cell equations.</strong> Given input \(\mathbf{x}_t\) and previous state \((\mathbf{h}_{t-1}, \mathbf{c}_{t-1})\):

<ul>
  <li><strong>Forget gate:</strong> \(\mathbf{f}_t = \sigma\!\left(\mathbf{W}_f \left[\mathbf{h}_{t-1}; \mathbf{x}_t\right] + \mathbf{b}_f\right)\)</li>
  <li><strong>Input gate:</strong> \(\mathbf{i}_t = \sigma\!\left(\mathbf{W}_i \left[\mathbf{h}_{t-1}; \mathbf{x}_t\right] + \mathbf{b}_i\right)\)</li>
  <li><strong>Cell update:</strong> \(\tilde{\mathbf{c}}_t = \tanh\!\left(\mathbf{W}_c \left[\mathbf{h}_{t-1}; \mathbf{x}_t\right] + \mathbf{b}_c\right)\)</li>
  <li><strong>New cell state:</strong> \(\mathbf{c}_t = \mathbf{f}_t \odot \mathbf{c}_{t-1} + \mathbf{i}_t \odot \tilde{\mathbf{c}}_t\)</li>
  <li><strong>Output gate:</strong> \(\mathbf{o}_t = \sigma\!\left(\mathbf{W}_o \left[\mathbf{h}_{t-1}; \mathbf{x}_t\right] + \mathbf{b}_o\right)\)</li>
  <li><strong>Hidden state:</strong> \(\mathbf{h}_t = \mathbf{o}_t \odot \tanh(\mathbf{c}_t)\)</li>
</ul>

The additive cell update \(\mathbf{c}_t = \mathbf{f}_t \odot \mathbf{c}_{t-1} + \mathbf{i}_t \odot \tilde{\mathbf{c}}_t\) creates a gradient highway: the gradient of \(\mathbf{c}_t\) with respect to \(\mathbf{c}_{t-1}\) is simply \(\mathbf{f}_t\), which avoids repeated matrix multiplication and mitigates vanishing gradients.
</div>

## 4.4 Gated Recurrent Units

The GRU (Cho et al., 2014) simplifies the LSTM by merging the forget and input gates into a single update gate and eliminating the separate cell state:

\[ \mathbf{z}_t = \sigma\!\left(\mathbf{W}_z \left[\mathbf{h}_{t-1}; \mathbf{x}_t\right]\right), \]

\[ \mathbf{r}_t = \sigma\!\left(\mathbf{W}_r \left[\mathbf{h}_{t-1}; \mathbf{x}_t\right]\right), \]

\[ \tilde{\mathbf{h}}_t = \tanh\!\left(\mathbf{W}_h \left[\mathbf{r}_t \odot \mathbf{h}_{t-1};\, \mathbf{x}_t\right]\right), \]

\[ \mathbf{h}_t = (1 - \mathbf{z}_t) \odot \mathbf{h}_{t-1} + \mathbf{z}_t \odot \tilde{\mathbf{h}}_t. \]

The update gate \(\mathbf{z}_t\) interpolates between the previous hidden state and the new candidate, while the reset gate \(\mathbf{r}_t\) controls how much prior information is used. GRUs have fewer parameters than LSTMs and often perform comparably on language tasks.

## 4.5 Encoder–Decoder Sequence-to-Sequence Models

For tasks such as machine translation, the input and output sequences may have different lengths. The **seq2seq** architecture (Sutskever et al., 2014) uses an **encoder** RNN (LSTM or GRU) to read the input sequence and compress it into a fixed-dimensional context vector \(\mathbf{c} = \mathbf{h}_T^{\text{enc}}\), then a **decoder** RNN that generates the output sequence token by token, conditioned on \(\mathbf{c}\):

\[ \mathbf{h}_t^{\text{dec}} = f_{\text{dec}}\!\left(\mathbf{h}_{t-1}^{\text{dec}},\, \hat{y}_{t-1},\, \mathbf{c}\right). \]

A key limitation is the information bottleneck: compressing long sequences into a single vector. Attention mechanisms (Chapter 5) resolve this by allowing the decoder to dynamically focus on different encoder positions.

---

# Chapter 5: Attention Mechanisms and Transformers

## 5.1 Scaled Dot-Product Attention

The **attention mechanism** allows a model to selectively attend to different parts of its input, producing a weighted combination of value vectors based on query–key similarity.

<div class="definition">
<strong>Scaled dot-product attention.</strong> Given a query matrix \(Q \in \mathbb{R}^{n_q \times d_k}\), key matrix \(K \in \mathbb{R}^{n_k \times d_k}\), and value matrix \(V \in \mathbb{R}^{n_k \times d_v}\), the attention output is:

\[ \text{Attention}(Q, K, V) = \text{softmax}\!\left(\frac{QK^\top}{\sqrt{d_k}}\right) V. \]

The scaling factor \(1/\sqrt{d_k}\) prevents the dot products from growing too large in magnitude, which would push the softmax into regions with extremely small gradients. Each row of the output is a convex combination of the rows of \(V\), weighted by the (softmax-normalized) similarity between the corresponding query and all keys.
</div>

For language models with causal (autoregressive) generation, the attention matrix is masked so that position \(i\) cannot attend to positions \(j > i\), setting those entries to \(-\infty\) before the softmax.

## 5.2 Multi-Head Attention

<div class="definition">
<strong>Multi-head attention.</strong> Rather than computing a single attention function, multi-head attention projects queries, keys, and values into \(h\) different subspaces and attends in parallel:

\[ \text{head}_i = \text{Attention}\!\left(QW_i^Q,\, KW_i^K,\, VW_i^V\right), \]

\[ \text{MultiHead}(Q,K,V) = \text{Concat}(\text{head}_1, \ldots, \text{head}_h)\,W^O, \]

where \(W_i^Q \in \mathbb{R}^{d_\text{model} \times d_k}\), \(W_i^K \in \mathbb{R}^{d_\text{model} \times d_k}\), \(W_i^V \in \mathbb{R}^{d_\text{model} \times d_v}\), and \(W^O \in \mathbb{R}^{hd_v \times d_\text{model}}\). Typically \(d_k = d_v = d_\text{model}/h\). Different heads can capture different types of relationships (syntactic, semantic, positional) simultaneously.
</div>

## 5.3 Positional Encoding

Self-attention is permutation equivariant: it treats the input as a set, not a sequence. To inject positional information, the original Transformer adds a sinusoidal positional encoding to each token embedding:

\[ PE_{(pos, 2i)} = \sin\!\left(\frac{pos}{10000^{2i/d_\text{model}}}\right), \]

\[ PE_{(pos, 2i+1)} = \cos\!\left(\frac{pos}{10000^{2i/d_\text{model}}}\right). \]

This encoding is deterministic, not learned, and allows the model to attend by relative position since \(PE_{pos+k}\) is a linear function of \(PE_{pos}\). Rotary positional embeddings (RoPE) and learned absolute embeddings are popular alternatives in modern architectures.

## 5.4 The Full Transformer Block

<div class="definition">
<strong>Transformer encoder block.</strong> A single transformer encoder layer consists of two sub-layers, each wrapped in a residual connection with layer normalization:

<ol>
  <li><em>Multi-head self-attention:</em> \(\mathbf{A} = \text{MultiHead}(X, X, X)\)</li>
  <li><em>Residual + LayerNorm:</em> \(\mathbf{X}' = \text{LN}(X + \mathbf{A})\)</li>
  <li><em>Position-wise feed-forward:</em> \(\text{FFN}(\mathbf{x}) = \mathbf{W}_2\,\text{ReLU}(\mathbf{W}_1\mathbf{x} + \mathbf{b}_1) + \mathbf{b}_2\)</li>
  <li><em>Residual + LayerNorm:</em> \(\mathbf{X}'' = \text{LN}(\mathbf{X}' + \text{FFN}(\mathbf{X}'))\)</li>
</ol>

The decoder adds a third sub-layer for cross-attention over encoder outputs, with causal masking in the first self-attention sub-layer.
</div>

The full Transformer (Vaswani et al., 2017) stacks \(N\) such blocks. Its \(O(n^2 d)\) self-attention cost in sequence length \(n\) is a key scalability challenge addressed in Chapter 6.

## 5.5 BERT

BERT (Devlin et al., 2019) applies bidirectional transformer encoders to language understanding. It is pre-trained on two objectives:

**Masked Language Modeling (MLM):** 15% of input tokens are randomly masked, and the model predicts them from context. Unlike autoregressive language models, BERT can use both left and right context for each masked token.

**Next Sentence Prediction (NSP):** Given two segments A and B, BERT predicts whether B follows A in the original corpus. A special \([CLS]\) token prepends the input, and its final representation is used for classification tasks.

BERT is fine-tuned on downstream tasks (sentiment analysis, question answering, named entity recognition) by appending a task-specific head and training end-to-end on labeled data.

## 5.6 GPT and Autoregressive Language Modeling

GPT (Radford et al., 2018) uses a stack of transformer decoder blocks (causal self-attention only) trained as an autoregressive language model:

\[ p(x_1, x_2, \ldots, x_T) = \prod_{t=1}^T p(x_t \mid x_1, \ldots, x_{t-1}). \]

The model is trained by maximizing the log-likelihood over a large text corpus, with the same parameters used for all positions. **GPT-2** (2019) scaled to 1.5B parameters and demonstrated that language models can generate coherent long-form text. **GPT-3** (Brown et al., 2020) with 175B parameters introduced **in-context learning**: by conditioning on a few examples in the prompt (few-shot learning), the model performs competitively on many tasks without any gradient updates. Scaling laws observed that loss decreases as a power law in model size, dataset size, and compute, providing principled guidance for scaling decisions.

---

# Chapter 6: Performers and Efficient Transformers

## 6.1 The Quadratic Bottleneck

Standard self-attention scales as \(O(n^2)\) in both time and memory with respect to sequence length \(n\), since the attention matrix \(QK^\top / \sqrt{d_k}\) is \(n \times n\). For long sequences (documents, high-resolution images, genomic sequences), this is prohibitive. Efficient transformer variants approximate or replace the full attention matrix.

## 6.2 Performers and FAVOR+

The Performer (Choromanski et al., 2021) approximates the full softmax attention kernel using random feature maps, achieving \(O(n)\) attention complexity.

<div class="definition">
<strong>FAVOR+ (Fast Attention Via positive Orthogonal Random features).</strong> The softmax kernel \(\exp(q^\top k / \sqrt{d})\) is approximated as an expectation over random features \(\phi\):

\[ \exp(q^\top k / \sqrt{d}) \approx \mathbb{E}_\omega\!\left[\phi(q)^\top \phi(k)\right], \]

where \(\phi(x) = \frac{1}{\sqrt{m}} \left[\exp(\omega_1^\top x - \|x\|^2/2), \ldots, \exp(\omega_m^\top x - \|x\|^2/2)\right]\)

with \(\omega_i \sim \mathcal{N}(0, I)\). Using positive random features (rather than trigonometric) ensures non-negative approximations and reduced variance. The key insight is that by swapping the order of operations, one can compute \(\Phi(Q)(\Phi(K)^\top V)\) in \(O(n \cdot m \cdot d)\) rather than \(O(n^2 \cdot d)\), where \(m \ll n\).
</div>

## 6.3 Sparse Attention Patterns

**Sparse transformers** (Child et al., 2019) restrict each token to attend only to a local window and a set of stride-sampled global positions. The attention pattern is a union of local and strided components, reducing complexity to \(O(n\sqrt{n})\). **Longformer** combines a sliding window attention with global tokens (e.g., \([CLS]\)) that attend to the full sequence, scaling to documents of thousands of tokens.

**BigBird** adds random attention edges to local and global patterns, enabling \(O(n)\) attention while retaining theoretical properties of full attention (Turing-completeness).

## 6.4 Flash Attention

Flash Attention (Dao et al., 2022) achieves exact (not approximate) attention while reducing memory from \(O(n^2)\) to \(O(n)\) by restructuring the computation to exploit GPU SRAM hierarchy. Rather than materializing the full \(n \times n\) attention matrix in HBM (high-bandwidth memory), Flash Attention tiles the computation across blocks that fit in SRAM, fusing the softmax normalization with the matrix product. This yields a 2–4× wall-clock speedup in practice, and has become the standard attention implementation in modern LLM training frameworks.

---

# Chapter 7: Autoencoders and Variational Autoencoders

## 7.1 Deterministic Autoencoders

An **autoencoder** is a neural network trained to reconstruct its input via a compressed bottleneck representation. It consists of an encoder \(f_\phi : \mathcal{X} \to \mathcal{Z}\) and a decoder \(g_\theta : \mathcal{Z} \to \mathcal{X}\), trained to minimize a reconstruction loss:

\[ \mathcal{L}(\phi, \theta) = \mathbb{E}_{\mathbf{x}}\!\left[\left\|g_\theta(f_\phi(\mathbf{x})) - \mathbf{x}\right\|^2\right]. \]

When the bottleneck dimension \(\dim(\mathcal{Z}) < \dim(\mathcal{X})\), the encoder is forced to learn a compressed representation. Deterministic autoencoders learn a deterministic mapping and can suffer from discontinuous or irregular latent spaces, making them unsuitable for generation.

## 7.2 The Variational Autoencoder

The **Variational Autoencoder** (VAE; Kingma and Welling, 2014) frames representation learning as probabilistic inference, endowing the latent space with a regular, continuous structure suitable for generation.

<div class="definition">
<strong>VAE generative model.</strong> The VAE posits the joint generative model:

\[ p_\theta(\mathbf{x}, \mathbf{z}) = p_\theta(\mathbf{x} \mid \mathbf{z})\, p(\mathbf{z}), \]

where \(p(\mathbf{z}) = \mathcal{N}(\mathbf{0}, \mathbf{I})\) is the standard Gaussian prior and \(p_\theta(\mathbf{x} \mid \mathbf{z})\) is parameterized by a neural network decoder (e.g., Gaussian with mean \(\mu_\theta(\mathbf{z})\) and diagonal covariance). The posterior \(p_\theta(\mathbf{z} \mid \mathbf{x})\) is intractable, so it is approximated by an encoder network (recognition model) \(q_\phi(\mathbf{z} \mid \mathbf{x}) = \mathcal{N}(\mu_\phi(\mathbf{x}), \text{diag}(\sigma^2_\phi(\mathbf{x})))\).
</div>

## 7.3 The Evidence Lower Bound

Training the VAE maximizes a lower bound on the log-marginal likelihood. By Jensen's inequality applied to the concavity of the logarithm:

\[ \log p_\theta(\mathbf{x}) \geq \mathbb{E}_{q_\phi(\mathbf{z}|\mathbf{x})}\!\left[\log p_\theta(\mathbf{x} \mid \mathbf{z})\right] - D_{\text{KL}}\!\left(q_\phi(\mathbf{z}|\mathbf{x}) \,\|\, p(\mathbf{z})\right). \]

This lower bound, called the **ELBO** (Evidence Lower BOund), decomposes into a reconstruction term (expected log-likelihood of the data given the latent code) and a regularization term (KL divergence between the approximate posterior and the prior). For Gaussian \(q_\phi\) and prior \(p\), the KL divergence has the closed form:

\[ D_{\text{KL}}\!\left(\mathcal{N}(\mu, \sigma^2 I) \| \mathcal{N}(0, I)\right) = \frac{1}{2}\sum_{j}\!\left(\mu_j^2 + \sigma_j^2 - \log \sigma_j^2 - 1\right). \]

## 7.4 The Reparameterization Trick

Naive Monte Carlo estimation of the reconstruction term gradient with respect to \(\phi\) fails because \(\mathbf{z}\) is sampled from \(q_\phi\). The **reparameterization trick** expresses \(\mathbf{z} = \mu_\phi(\mathbf{x}) + \sigma_\phi(\mathbf{x}) \odot \boldsymbol{\varepsilon}\) where \(\boldsymbol{\varepsilon} \sim \mathcal{N}(0,I)\), making \(\mathbf{z}\) a deterministic function of \(\phi\) and a noise variable independent of \(\phi\). Gradients can then be backpropagated through \(\mathbf{z}\) with respect to \(\phi\).

<div class="definition">
<strong>\(\beta\)-VAE.</strong> The \(\beta\)-VAE (Higgins et al., 2017) introduces a coefficient \(\beta > 1\) on the KL term:

\[ \mathcal{L}_\beta = \mathbb{E}_{q_\phi}\!\left[\log p_\theta(\mathbf{x}|\mathbf{z})\right] - \beta\, D_{\text{KL}}\!\left(q_\phi(\mathbf{z}|\mathbf{x}) \| p(\mathbf{z})\right). \]

Increasing \(\beta\) encourages disentangled latent representations where each dimension captures an independent factor of variation, at the cost of reconstruction quality.
</div>

---

# Chapter 8: Deep Generative Models

## 8.1 Generative Adversarial Networks

A **Generative Adversarial Network** (GAN; Goodfellow et al., 2014) frames generative modeling as a two-player minimax game between a generator \(G\) and a discriminator \(D\).

<div class="definition">
<strong>GAN minimax objective.</strong> The generator \(G : \mathcal{Z} \to \mathcal{X}\) maps noise \(\mathbf{z} \sim p(\mathbf{z})\) to generated samples, and the discriminator \(D : \mathcal{X} \to [0,1]\) estimates the probability that an input is real. The minimax game is:

\[ \min_G \max_D\; V(G, D) = \mathbb{E}_{\mathbf{x} \sim p_{\text{data}}}\!\left[\log D(\mathbf{x})\right] + \mathbb{E}_{\mathbf{z} \sim p(\mathbf{z})}\!\left[\log\!\left(1 - D(G(\mathbf{z}))\right)\right]. \]

In practice, the generator minimizes \(-\mathbb{E}\!\left[\log D(G(\mathbf{z}))\right]\) (non-saturating loss) to provide stronger gradients.
</div>

<div class="theorem">
<strong>Optimal discriminator and Jensen–Shannon divergence.</strong> For a fixed generator \(G\), the optimal discriminator is:

\[ D^*(\mathbf{x}) = \frac{p_{\text{data}}(\mathbf{x})}{p_{\text{data}}(\mathbf{x}) + p_G(\mathbf{x})}. \]

Substituting \(D^*\) into \(V(G, D^*)\) yields:

\[ V(G, D^*) = 2\, D_{\text{JS}}\!\left(p_{\text{data}} \| p_G\right) - \log 4, \]

where \(D_{\text{JS}}\) is the Jensen–Shannon divergence. At the global minimum, \(p_G = p_{\text{data}}\) and \(D_{\text{JS}} = 0\).
</div>

## 8.2 Wasserstein GAN

The original GAN objective can produce vanishing gradients when the generator is far from the data distribution (since \(D_{\text{JS}}\) saturates to \(\log 2\)). The **Wasserstein GAN** (WGAN; Arjovsky et al., 2017) uses the Earth Mover's distance instead:

\[ W(p_{\text{data}}, p_G) = \sup_{\|f\|_L \leq 1} \mathbb{E}_{\mathbf{x} \sim p_{\text{data}}}\!\left[f(\mathbf{x})\right] - \mathbb{E}_{\mathbf{z}}\!\left[f(G(\mathbf{z}))\right], \]

where the supremum is over 1-Lipschitz functions. The critic (discriminator without sigmoid) must satisfy the **Lipschitz constraint**, enforced either by weight clipping (original WGAN) or gradient penalty (WGAN-GP):

\[ \mathcal{L}_{\text{GP}} = \lambda\, \mathbb{E}_{\hat{\mathbf{x}}}\!\left[\left(\|\nabla_{\hat{\mathbf{x}}} D(\hat{\mathbf{x}})\|_2 - 1\right)^2\right], \]

where \(\hat{\mathbf{x}}\) is sampled uniformly along lines between real and generated samples. WGAN provides meaningful loss curves that correlate with sample quality.

## 8.3 Conditional GANs and Image Translation

A **Conditional GAN** (Mirza and Osindero, 2014) conditions both generator and discriminator on auxiliary information \(\mathbf{y}\) (class label or another image):

\[ \min_G \max_D\; \mathbb{E}\!\left[\log D(\mathbf{x}, \mathbf{y})\right] + \mathbb{E}\!\left[\log\!\left(1 - D(G(\mathbf{z}, \mathbf{y}), \mathbf{y})\right)\right]. \]

**pix2pix** (Isola et al., 2017) learns image-to-image translation (e.g., semantic labels to street scenes) by conditioning the generator on a full input image, using a U-Net generator and PatchGAN discriminator that classifies \(N \times N\) patches as real or fake. **CycleGAN** (Zhu et al., 2017) learns unpaired image translation by training two generators \(G: X \to Y\) and \(F: Y \to X\) with a cycle consistency loss \(\|F(G(x)) - x\|_1 + \|G(F(y)) - y\|_1\).

Common GAN training instabilities include mode collapse (the generator produces only a few distinct samples), oscillations, and sensitivity to hyperparameters. Spectral normalization, progressive growing, and better loss functions (hinge loss, relativistic loss) mitigate these issues.

---

# Chapter 9: Deep Reinforcement Learning

## 9.1 Markov Decision Processes

<div class="definition">
<strong>Markov Decision Process.</strong> A Markov Decision Process (MDP) is a tuple \((\mathcal{S}, \mathcal{A}, P, R, \gamma)\) where: \(\mathcal{S}\) is the state space; \(\mathcal{A}\) is the action space; \(P(s' \mid s, a)\) is the transition probability; \(R(s, a)\) is the expected reward; and \(\gamma \in [0,1)\) is the discount factor. An agent selects actions according to a policy \(\pi(a \mid s)\) to maximize the expected discounted return:

\[ G_t = \sum_{k=0}^\infty \gamma^k R_{t+k+1}. \]
</div>

The **state value function** \(V^\pi(s) = \mathbb{E}_\pi\!\left[G_t \mid S_t = s\right]\) and **action-value function** \(Q^\pi(s,a) = \mathbb{E}_\pi\!\left[G_t \mid S_t = s, A_t = a\right]\) satisfy the Bellman equations:

\[ V^\pi(s) = \sum_a \pi(a|s)\sum_{s'} P(s'|s,a)\!\left[R(s,a) + \gamma V^\pi(s')\right], \]

\[ Q^\pi(s,a) = \sum_{s'} P(s'|s,a)\!\left[R(s,a) + \gamma \sum_{a'} \pi(a'|s') Q^\pi(s',a')\right]. \]

## 9.2 Q-Learning and Deep Q-Networks

**Q-learning** is an off-policy temporal difference algorithm that estimates the optimal action-value function:

\[ Q(s_t, a_t) \leftarrow Q(s_t, a_t) + \alpha\!\left[r_t + \gamma \max_{a'} Q(s_{t+1}, a') - Q(s_t, a_t)\right]. \]

**DQN** (Mnih et al., 2015) approximates \(Q(s,a;\theta)\) with a deep neural network. Two key innovations enable stable training:

**Experience replay**: Transitions \((s, a, r, s')\) are stored in a replay buffer and sampled uniformly for training, breaking temporal correlations and improving data efficiency.

**Target network**: A periodically updated copy \(\hat{Q}(s,a;\theta^-)\) provides stable regression targets, preventing oscillations from rapidly changing targets. The loss is:

\[ \mathcal{L}(\theta) = \mathbb{E}_{(s,a,r,s') \sim \mathcal{D}}\!\left[\left(r + \gamma \max_{a'} \hat{Q}(s',a';\theta^-) - Q(s,a;\theta)\right)^2\right]. \]

## 9.3 Policy Gradient Methods

Policy gradient methods directly optimize a parameterized policy \(\pi_\theta(a|s)\). The **REINFORCE** algorithm (Williams, 1992) uses the policy gradient theorem:

\[ \nabla_\theta J(\theta) = \mathbb{E}_{\pi_\theta}\!\left[\sum_t \nabla_\theta \log \pi_\theta(a_t|s_t)\, G_t\right], \]

estimating the expectation via Monte Carlo rollouts. A baseline \(b(s_t)\) is subtracted to reduce variance: \(G_t - b(s_t)\).

**Actor-critic** methods combine a policy network (actor) with a value network (critic) that estimates \(V^\pi(s)\) or \(Q^\pi(s,a)\), using the advantage \(A(s,a) = Q(s,a) - V(s)\) as a lower-variance gradient signal.

**Proximal Policy Optimization** (PPO; Schulman et al., 2017) constrains policy updates to remain close to the current policy using a clipped surrogate objective:

\[ \mathcal{L}^{\text{CLIP}}(\theta) = \mathbb{E}_t\!\left[\min\!\left(r_t(\theta)\hat{A}_t,\; \text{clip}(r_t(\theta), 1-\varepsilon, 1+\varepsilon)\hat{A}_t\right)\right], \]

where \(r_t(\theta) = \pi_\theta(a_t|s_t) / \pi_{\theta_\text{old}}(a_t|s_t)\) is the probability ratio. Clipping prevents excessively large updates, providing stability without the computational overhead of KL-constrained trust region methods.

---

# Chapter 10: Graph Neural Networks

## 10.1 Graphs and the Need for Specialized Architectures

Standard deep learning architectures (MLPs, CNNs, RNNs) assume inputs with fixed grid or sequence structure. Many real-world datasets are naturally represented as graphs: social networks, molecular structures, citation networks, knowledge graphs. A graph \(G = (V, E)\) consists of a set of nodes \(v \in V\) with feature vectors \(\mathbf{x}_v \in \mathbb{R}^d\) and edges \((u,v) \in E\). Graph neural networks (GNNs) learn node or graph-level representations by propagating information along edges.

## 10.2 Message Passing Framework

<div class="definition">
<strong>Message passing neural network (MPNN).</strong> At each layer, every node aggregates messages from its neighbors and updates its own representation. For node \(v\) at layer \(k\):

<ul>
  <li><em>Message:</em> \(\mathbf{m}_v^{(k)} = \text{Aggregate}\!\left(\left\{\mathbf{h}_u^{(k-1)} : u \in \mathcal{N}(v)\right\}\right)\)</li>
  <li><em>Update:</em> \(\mathbf{h}_v^{(k)} = \text{Combine}\!\left(\mathbf{h}_v^{(k-1)},\, \mathbf{m}_v^{(k)}\right)\)</li>
</ul>

After \(K\) layers, \(\mathbf{h}_v^{(K)}\) captures information from all nodes within \(K\) hops of \(v\). A graph-level readout pools node representations: \(\mathbf{h}_G = \text{Readout}\!\left(\left\{\mathbf{h}_v^{(K)} : v \in V\right\}\right)\).
</div>

## 10.3 Graph Convolutional Networks

<div class="definition">
<strong>GCN layer.</strong> The Graph Convolutional Network (Kipf and Welling, 2017) layer is:

\[ \mathbf{H}^{(k+1)} = \sigma\!\left(\tilde{D}^{-1/2} \tilde{A}\, \tilde{D}^{-1/2} \mathbf{H}^{(k)} W^{(k)}\right), \]

where \(\tilde{A} = A + I\) is the adjacency matrix with added self-loops, \(\tilde{D}\) is the corresponding degree matrix, and \(W^{(k)}\) is a learnable weight matrix. The symmetric normalization \(\tilde{D}^{-1/2}\tilde{A}\tilde{D}^{-1/2}\) prevents features from exploding as node degree increases.
</div>

## 10.4 GraphSAGE and Graph Attention Networks

**GraphSAGE** (Hamilton et al., 2017) uses inductive learning by sampling a fixed-size neighborhood and aggregating with a learned aggregator (mean, max, or LSTM):

\[ \mathbf{h}_v^{(k)} = \sigma\!\left(\mathbf{W}^{(k)} \cdot \text{Concat}\!\left(\mathbf{h}_v^{(k-1)},\; \text{Aggregate}\!\left(\left\{\mathbf{h}_u^{(k-1)}\right\}_{u \in \mathcal{N}_s(v)}\right)\right)\right), \]

where \(\mathcal{N}_s(v)\) is a sampled subset of neighbors.

<div class="definition">
<strong>Graph Attention Network (GAT).</strong> GAT (Veličković et al., 2018) computes attention coefficients \(\alpha_{uv}\) between neighbors:

\[ e_{uv} = \text{LeakyReLU}\!\left(\mathbf{a}^\top \left[\mathbf{W}\mathbf{h}_v \;\|\; \mathbf{W}\mathbf{h}_u\right]\right), \quad \alpha_{uv} = \frac{\exp(e_{uv})}{\sum_{w \in \mathcal{N}(v)}\exp(e_{wv})}, \]

\[ \mathbf{h}_v^{(k)} = \sigma\!\left(\sum_{u \in \mathcal{N}(v)} \alpha_{uv}\, \mathbf{W}\mathbf{h}_u^{(k-1)}\right). \]

Multi-head attention is applied to stabilize training. GAT is highly effective on tasks where the relative importance of neighbors varies across the graph.
</div>

GNNs have achieved state-of-the-art results in **molecular property prediction** (predicting quantum chemical properties of small molecules), protein structure analysis, drug discovery, and recommendation systems. A key challenge is over-smoothing: with many GNN layers, node representations converge to indistinguishable vectors; in practice 2–4 layers are most effective.

---

# Chapter 11: Diffusion Models

## 11.1 The Forward Diffusion Process

Diffusion models (Ho et al., 2020; Song and Ermon, 2020) define a generative model by learning to reverse a gradual noising process. The **forward process** \(q\) progressively adds Gaussian noise to a data sample \(\mathbf{x}_0\) over \(T\) steps according to a fixed variance schedule \(\{\beta_t\}_{t=1}^T\):

<div class="definition">
<strong>Forward diffusion process.</strong>

\[ q(\mathbf{x}_t \mid \mathbf{x}_{t-1}) = \mathcal{N}\!\left(\mathbf{x}_t;\; \sqrt{1-\beta_t}\,\mathbf{x}_{t-1},\; \beta_t \mathbf{I}\right). \]

Letting \(\alpha_t = 1 - \beta_t\) and \(\bar{\alpha}_t = \prod_{s=1}^t \alpha_s\), the marginal at step \(t\) is available in closed form:

\[ q(\mathbf{x}_t \mid \mathbf{x}_0) = \mathcal{N}\!\left(\mathbf{x}_t;\; \sqrt{\bar{\alpha}_t}\,\mathbf{x}_0,\; (1-\bar{\alpha}_t)\mathbf{I}\right). \]

For large \(T\) with appropriately chosen \(\beta_t\), \(\mathbf{x}_T \approx \mathcal{N}(0, I)\) is essentially pure noise.
</div>

## 11.2 The Reverse Process and ELBO

The **reverse process** is a learned Markov chain that denoises from \(\mathbf{x}_T\) back to \(\mathbf{x}_0\):

<div class="definition">
<strong>Reverse diffusion process.</strong>

\[ p_\theta(\mathbf{x}_{t-1} \mid \mathbf{x}_t) = \mathcal{N}\!\left(\mathbf{x}_{t-1};\; \mu_\theta(\mathbf{x}_t, t),\; \Sigma_\theta(\mathbf{x}_t, t)\right). \]

Training minimizes a variational lower bound on \(-\log p_\theta(\mathbf{x}_0)\). Ho et al. showed this simplifies to a <strong>score-matching</strong> objective: train a neural network \(\epsilon_\theta(\mathbf{x}_t, t)\) to predict the noise \(\boldsymbol{\epsilon}\) added at step \(t\):

\[ \mathcal{L}_{\text{simple}} = \mathbb{E}_{t, \mathbf{x}_0, \boldsymbol{\epsilon}}\!\left[\left\|\boldsymbol{\epsilon} - \epsilon_\theta\!\left(\sqrt{\bar{\alpha}_t}\,\mathbf{x}_0 + \sqrt{1-\bar{\alpha}_t}\,\boldsymbol{\epsilon},\; t\right)\right\|^2\right], \]

where \(\boldsymbol{\epsilon} \sim \mathcal{N}(0,I)\). Sampling is performed by the reverse Markov chain:

\[ \mathbf{x}_{t-1} = \frac{1}{\sqrt{\alpha_t}}\!\left(\mathbf{x}_t - \frac{\beta_t}{\sqrt{1-\bar{\alpha}_t}}\epsilon_\theta(\mathbf{x}_t,t)\right) + \sqrt{\beta_t}\,\mathbf{z}, \quad \mathbf{z} \sim \mathcal{N}(0,I). \]
</div>

## 11.3 DDIM and Deterministic Sampling

Denoising Diffusion Implicit Models (Song et al., 2021) derive a non-Markovian forward process with the same marginals as DDPM, yielding deterministic sampling trajectories. Given \(\mathbf{x}_t\), the DDIM update is:

\[ \mathbf{x}_{t-1} = \sqrt{\bar{\alpha}_{t-1}} \underbrace{\frac{\mathbf{x}_t - \sqrt{1-\bar{\alpha}_t}\,\epsilon_\theta(\mathbf{x}_t,t)}{\sqrt{\bar{\alpha}_t}}}_{\text{predicted }\mathbf{x}_0} + \sqrt{1-\bar{\alpha}_{t-1}}\,\epsilon_\theta(\mathbf{x}_t,t). \]

Crucially, DDIM allows generation with far fewer steps (e.g., 50 rather than 1000) without significant quality loss, and enables a deterministic encoding–decoding useful for image editing.

## 11.4 Classifier-Free Guidance

**Classifier-free guidance** (Ho and Salimans, 2022) enables conditional generation without a separate classifier. A single model is trained both unconditionally (by randomly dropping the conditioning signal \(\mathbf{c}\) with probability \(p_{\text{uncond}}\)) and conditionally. At inference time, the effective score is:

\[ \tilde{\epsilon}_\theta(\mathbf{x}_t, \mathbf{c}) = \epsilon_\theta(\mathbf{x}_t, \varnothing) + w\!\left(\epsilon_\theta(\mathbf{x}_t, \mathbf{c}) - \epsilon_\theta(\mathbf{x}_t, \varnothing)\right), \]

where \(w > 1\) is the guidance scale. Larger \(w\) produces samples more faithful to the conditioning signal at the cost of diversity.

## 11.5 Score-Based Generative Models

Score-based models (Song and Ermon, 2019) learn the score function \(\nabla_\mathbf{x} \log p(\mathbf{x})\) — the gradient of the log-density with respect to the input — using **denoising score matching**. Samples are generated by running Langevin dynamics:

\[ \mathbf{x}_{i+1} = \mathbf{x}_i + \frac{\delta}{2}\nabla_\mathbf{x} \log p(\mathbf{x}_i) + \sqrt{\delta}\,\mathbf{z}, \quad \mathbf{z} \sim \mathcal{N}(0,I). \]

Song et al. (2021) unified score-based and diffusion models under a continuous-time stochastic differential equation (SDE) framework, enabling new samplers and exact likelihood computation.

---

# Chapter 12: Large Language Models

## 12.1 From Pre-Training to Instruction Following

GPT-3 demonstrated remarkable few-shot capabilities but remained a general-purpose text predictor. **Instruction tuning** (Wei et al., 2022) fine-tunes a pre-trained LLM on a large collection of tasks formatted as natural language instructions, dramatically improving zero-shot generalization. Models such as FLAN-T5 and instruction-tuned GPT-4 follow novel instructions without explicit demonstrations.

**Reinforcement Learning from Human Feedback** (RLHF; Christiano et al., 2017; Ouyang et al., 2022) aligns LLMs with human preferences through three stages:

<div class="definition">
<strong>RLHF pipeline.</strong>
<ol>
  <li><em>Supervised fine-tuning (SFT):</em> Fine-tune the pre-trained LLM on a small dataset of human-written demonstrations to obtain a policy \(\pi^{\text{SFT}}\).</li>
  <li><em>Reward model training:</em> Collect human preference data (pairs of completions ranked by human labelers) and train a scalar reward model \(r_\phi(\mathbf{x}, \mathbf{y})\) via the Bradley-Terry model: \(\mathcal{L}_{\text{RM}} = -\mathbb{E}\!\left[\log \sigma(r_\phi(\mathbf{x}, \mathbf{y}_w) - r_\phi(\mathbf{x}, \mathbf{y}_l))\right]\), where \(\mathbf{y}_w\) is the preferred and \(\mathbf{y}_l\) the dispreferred response.</li>
  <li><em>RL optimization:</em> Fine-tune \(\pi^{\text{SFT}}\) with PPO to maximize expected reward while constraining divergence from the SFT policy:
  \[ \max_\pi \mathbb{E}_{(\mathbf{x},\mathbf{y}) \sim \pi}\!\left[r_\phi(\mathbf{x},\mathbf{y})\right] - \beta\, D_{\text{KL}}\!\left(\pi \| \pi^{\text{SFT}}\right). \]
  </li>
</ol>
</div>

**Direct Preference Optimization** (DPO; Rafailov et al., 2023) bypasses explicit reward model training by directly optimizing the preference objective, simplifying the RLHF pipeline.

## 12.2 Chain-of-Thought Prompting

Standard prompting asks LLMs to produce answers directly. **Chain-of-thought** (CoT; Wei et al., 2022) prompting elicits multi-step reasoning by including worked examples with intermediate reasoning steps in the few-shot prompt. Models prompted with CoT dramatically improve performance on arithmetic, commonsense, and symbolic reasoning benchmarks. **Zero-shot CoT** appends the phrase "Let's think step by step" to the query, prompting reasoning without demonstrations. **Self-consistency** samples multiple reasoning chains and aggregates by majority voting, improving reliability.

## 12.3 Emergent Abilities and Scaling Laws

<div class="definition">
<strong>Chinchilla scaling law.</strong> Hoffmann et al. (2022) studied optimal allocation of a compute budget \(C \approx 6ND\) (where \(N\) is parameter count and \(D\) is training tokens). They found that the Chinchilla-optimal model uses roughly \(20\) training tokens per parameter: \(D^* \approx 20\,N^*\). The GPT-3 family was significantly undertrained relative to model size; Chinchilla (70B parameters, 1.4T tokens) matched or exceeded the 280B Gopher model at a fraction of the inference cost.
</div>

**Emergent abilities** are capabilities that appear abruptly above a model scale threshold without continuous improvement below it (Wei et al., 2022). Examples include multi-step arithmetic, multi-lingual translation, and chain-of-thought reasoning. Whether emergence is a genuine phase transition or an artifact of evaluation metrics remains debated.

## 12.4 Mixture of Experts

**Mixture of Experts** (MoE) replaces the dense feed-forward sublayer in each transformer block with a collection of \(E\) expert networks \(\{f_e\}_{e=1}^E\) and a router that routes each token to the top-\(k\) experts:

\[ \text{MoE}(\mathbf{x}) = \sum_{e \in \text{Top}_k(G(\mathbf{x}))} G_e(\mathbf{x})\, f_e(\mathbf{x}), \]

where \(G(\mathbf{x}) = \text{softmax}(\mathbf{x} W_g + \text{noise})\). With \(E\) experts and \(k=2\), the model activates only \(2/E\) of its parameters for each token, allowing parameter count to scale without proportional compute increase. Switch Transformer (Fedus et al., 2022) and Mixtral-8x7B (Mistral, 2023) demonstrated that MoE architectures achieve competitive quality at significantly lower inference cost.

## 12.5 Long Context and Retrieval Augmentation

Modern LLMs extend context windows to 128K or more tokens using techniques like RoPE scaling, ALiBi positional biases, and sliding window attention. **Retrieval-Augmented Generation** (RAG; Lewis et al., 2020) decouples parametric knowledge (stored in weights) from non-parametric knowledge (retrieved at inference time from an external corpus). A retriever (often a bi-encoder dense retrieval model) fetches relevant documents given the query; the generator LLM conditions on retrieved text to produce the final answer. RAG improves factual accuracy, enables access to up-to-date information, and reduces hallucinations without requiring costly retraining.

<div class="remark">
The field of large language models is evolving extremely rapidly. The architectures and training recipes described here — instruction tuning, RLHF, chain-of-thought, mixture of experts — represent the state of practice as of early 2025 but are likely to be supplemented or superseded by the time these notes are used. The underlying principles — representation learning, probabilistic modeling, scalable optimization — remain foundational and provide the conceptual tools needed to understand future developments.
</div>
