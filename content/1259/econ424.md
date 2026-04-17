---
title: "ECON 424: Machine Learning in Economics"
prof: "Mikko Packalen"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — James, G., Witten, D., Hastie, T., Tibshirani, R., & Taylor, J. (2023). *An Introduction to Statistical Learning with Applications in Python* (ISLP), 2nd ed. Springer (free at statlearning.com).

**Supplementary texts** — Hastie, T., Tibshirani, R., & Friedman, J. (2009). *The Elements of Statistical Learning* (ESL), 2nd ed. Springer (free PDF); Mullainathan, S. & Spiess, J. (2017). "Machine Learning: An Applied Econometric Approach." *Journal of Economic Perspectives* 31(2): 87–106; Athey, S. & Imbens, G. (2019). "Machine Learning Methods Economists Should Know About." *Annual Review of Economics* 11: 685–725.

**Online resources** — ISLP companion site (statlearning.com); MIT OCW 6.867 (Machine Learning); fast.ai Practical Deep Learning; Hugging Face documentation for LLMs.

---

# Chapter 1: Machine Learning — Goals, Concepts, and Distinctions

## 1.1 What is Machine Learning?

**Machine learning (ML)** is the study of algorithms that improve their performance on a task through experience (data). In the context of economics, ML methods are primarily used for:

1. **Prediction:** Build a model \( \hat{f}(\mathbf{x}) \approx y \) that accurately predicts outcomes for new observations.
2. **Feature selection / dimensionality reduction:** Identify which variables matter when \( p \) (number of covariates) is large.
3. **Causal heterogeneity:** Estimate how treatment effects vary across subgroups.
4. **Text and image analysis:** Extract structured information from unstructured data.

## 1.2 ML vs. Traditional Econometrics

A crucial distinction for economists:

<div class="definition">
<strong>Prediction vs. Causal Inference:</strong>
<ul>
<li><strong>ML goal:</strong> Minimize out-of-sample prediction error \( E[(y - \hat{f}(\mathbf{x}))^2] \).</li>
<li><strong>Econometrics goal:</strong> Consistently estimate a causal parameter \( \beta_j = \partial E[y \mid \mathbf{x}] / \partial x_j \) under assumptions that give a structural (counterfactual) interpretation.</li>
</ul>
A model with excellent predictive accuracy may have no causal content (e.g., a model exploiting spurious correlations). Conversely, a causally valid estimator (e.g., IV) may predict poorly out of sample.
</div>

ML models are built around the **prediction function** \( \hat{f} \), trading interpretability for accuracy. Economic policy typically requires causal identification, which ML alone cannot provide without additional assumptions.

## 1.3 Supervised vs. Unsupervised Learning

**Supervised learning:** A labeled training set \( \{(\mathbf{x}_i, y_i)\}_{i=1}^n \) is available. The goal is to learn a mapping \( f: \mathbf{x} \mapsto y \). Subdivided into:

- **Regression:** \( y \in \mathbb{R} \) (continuous outcome)
- **Classification:** \( y \in \{0, 1, \ldots, K\} \) (categorical outcome)

**Unsupervised learning:** No labels. Goals include clustering (group similar observations), dimensionality reduction (find low-dimensional structure), and density estimation.

---

# Chapter 2: The Bias-Variance Tradeoff and Overfitting

## 2.1 The Mean Squared Error Decomposition

For a test observation \( (\mathbf{x}_0, y_0) \), the expected prediction error (EPE) of a fitted model \( \hat{f} \) decomposes as:

\[
E\!\left[(y_0 - \hat{f}(\mathbf{x}_0))^2\right] = \underbrace{\left[\text{Bias}(\hat{f}(\mathbf{x}_0))\right]^2}_{\text{systematic error}} + \underbrace{\text{Var}(\hat{f}(\mathbf{x}_0))}_{\text{estimation variance}} + \underbrace{\sigma^2}_{\text{irreducible error}}
\]

where \( \text{Bias}(\hat{f}(\mathbf{x}_0)) = E[\hat{f}(\mathbf{x}_0)] - f(\mathbf{x}_0) \) is the systematic error and \( \text{Var}(\hat{f}(\mathbf{x}_0)) \) is the variance due to sampling.

<div class="theorem">
<strong>Bias-Variance Tradeoff:</strong> More flexible (complex) models have lower bias but higher variance. Less flexible models have higher bias but lower variance. The optimal model complexity minimizes total EPE.
</div>

**Overfitting** occurs when a model fits the training data too closely — it captures noise rather than signal, leading to poor out-of-sample performance. The training MSE decreases monotonically with model complexity; the test MSE has a U-shaped curve.

## 2.2 The Curse of Dimensionality

As \( p \) (feature dimension) grows, the fraction of the training data within a \( k \)-nearest-neighbor ball shrinks exponentially. For prediction to work with high-dimensional \( \mathbf{x} \), structure must be imposed (sparsity, smoothness, low-rank, etc.). This motivates penalized methods and tree-based approaches.

---

# Chapter 3: Cross-Validation and Model Selection

## 3.1 Training, Validation, and Test Sets

The gold standard splits data into three parts:

1. **Training set:** Fit model parameters.
2. **Validation set:** Select model complexity (hyperparameters).
3. **Test set:** Final unbiased estimate of prediction error.

The test set must never be used during model selection — using it for model selection leads to optimistic bias in the reported error.

## 3.2 \( k \)-Fold Cross-Validation

When data are limited, \( k \)-fold cross-validation efficiently estimates out-of-sample error.

<div class="definition">
<strong>\( k \)-Fold Cross-Validation:</strong>
<ol>
<li>Randomly partition the data into <em>k</em> folds of approximately equal size.</li>
<li>For each fold \( j = 1, \ldots, k \): train the model on all folds except <em>j</em>, then predict on fold <em>j</em>.</li>
<li>CV error: \( CV_k = \frac{1}{k}\sum_{j=1}^k \text{MSE}_j \)</li>
</ol>
</div>

Common choices: \( k = 5 \) or \( k = 10 \). **Leave-one-out CV (LOOCV)** sets \( k = n \) — unbiased but computationally expensive and has high variance. The **one-standard-error rule** selects the simplest model within one standard error of the model with minimum CV error, guarding against overfitting.

For time series data, CV must respect temporal order — **rolling-origin** or **blocked** CV prevents future data leaking into training.

---

# Chapter 4: Regression Trees and Decision Trees

## 4.1 Binary Recursive Partitioning

A **regression tree** partitions the feature space \( \mathcal{X} \subseteq \mathbb{R}^p \) into rectangular regions \( R_1, \ldots, R_J \) and predicts the mean of training observations in each region:

\[
\hat{f}(\mathbf{x}) = \sum_{j=1}^J c_j\, \mathbf{1}(\mathbf{x} \in R_j), \quad c_j = \text{avg}_{i: \mathbf{x}_i \in R_j} y_i
\]

At each step, the algorithm finds the variable \( x_k \) and split point \( s \) minimizing the total within-region sum of squares:

\[
\min_{k,\,s} \left[\sum_{i: x_{ik} < s}(y_i - \bar{y}_{left})^2 + \sum_{i: x_{ik} \geq s}(y_i - \bar{y}_{right})^2\right]
\]

Trees are grown until a stopping criterion (minimum node size or maximum depth), then **pruned** back using cost-complexity regularization with parameter \( \alpha \geq 0 \):

\[
C_\alpha(T) = \sum_{m=1}^{|T|} \sum_{i \in R_m} (y_i - \hat{c}_m)^2 + \alpha|T|
\]

The parameter \( \alpha \) is selected by cross-validation.

## 4.2 Classification Trees

For a \( K \)-class problem, splits minimize the **Gini index** or **cross-entropy** (deviance) rather than squared error:

\[
\text{Gini} = \sum_{k=1}^K \hat{p}_{mk}(1 - \hat{p}_{mk}), \qquad \text{Cross-entropy} = -\sum_{k=1}^K \hat{p}_{mk}\ln\hat{p}_{mk}
\]

where \( \hat{p}_{mk} \) is the fraction of class-\( k \) observations in region \( m \). The Gini index is generally preferred for growing trees; misclassification rate for pruning.

---

# Chapter 5: Penalized Regression

## 5.1 Ridge Regression

When \( p \) is large or predictors are collinear, OLS variance is high. **Ridge regression** adds an \( \ell_2 \) penalty:

\[
\hat{\boldsymbol{\beta}}^{ridge} = \argmin_{\boldsymbol{\beta}} \left\{\sum_{i=1}^n(y_i - \mathbf{x}_i^{\top}\boldsymbol{\beta})^2 + \lambda\sum_{j=1}^p\beta_j^2\right\}
\]

The closed-form solution:

\[
\hat{\boldsymbol{\beta}}^{ridge} = (\mathbf{X}^{\top}\mathbf{X} + \lambda\mathbf{I})^{-1}\mathbf{X}^{\top}\mathbf{y}
\]

Ridge shrinks all coefficients toward zero but never sets any to exactly zero. The **effective degrees of freedom** are \( \text{df}(\lambda) = \sum_{j=1}^p d_j^2/(d_j^2 + \lambda) \) where \( d_j \) are the singular values of \( \mathbf{X} \). The tuning parameter \( \lambda \) is selected by cross-validation.

## 5.2 LASSO

**Least Absolute Shrinkage and Selection Operator (LASSO)** uses an \( \ell_1 \) penalty:

\[
\hat{\boldsymbol{\beta}}^{lasso} = \argmin_{\boldsymbol{\beta}} \left\{\sum_{i=1}^n(y_i - \mathbf{x}_i^{\top}\boldsymbol{\beta})^2 + \lambda\sum_{j=1}^p|\beta_j|\right\}
\]

The non-differentiability of \( |\beta_j| \) at zero means LASSO sets some coefficients **exactly to zero**, performing automatic **variable selection**. The solution path as a function of \( \lambda \) is piecewise linear (LARS algorithm).

<div class="theorem">
<strong>Oracle Property (approximate):</strong> Under sparsity (only \( s \ll p \) coefficients are non-zero) and certain incoherence conditions on \( \mathbf{X} \), LASSO with appropriately chosen \( \lambda \) selects the true sparse support with high probability and estimates non-zero coefficients consistently.
</div>

The **elastic net** combines both penalties:

\[
\hat{\boldsymbol{\beta}}^{EN} = \argmin_{\boldsymbol{\beta}} \left\{\sum_{i}(y_i - \mathbf{x}_i^{\top}\boldsymbol{\beta})^2 + \lambda\left[\alpha\sum_{j}|\beta_j| + (1-\alpha)\sum_{j}\beta_j^2\right]\right\}
\]

Elastic net handles correlated predictors better than pure LASSO (which tends to select only one from a group of correlated variables).

---

# Chapter 6: Feature Engineering and Variable Importance

## 6.1 Feature Engineering

**Feature engineering** transforms raw predictors into more informative representations before model fitting:

- **Basis expansions:** Polynomial features \( x, x^2, x^3, \ldots \); natural splines with knots
- **Interaction terms:** \( x_j \times x_k \) for capturing non-additive effects
- **Dummy encoding:** Expand categorical variables into one-hot vectors
- **Normalization/standardization:** Required for penalized methods (center and scale each feature to have mean 0 and SD 1 before applying LASSO/ridge)

## 6.2 Variable Importance Measures

For tree-based models, **feature importance** is defined as the total reduction in the split criterion (Gini/RSS) attributable to each feature, averaged across all trees and splits. This provides a ranking but not an interpretable causal effect.

The **permutation importance** (Breiman 2001) randomly shuffles the values of feature \( j \) in the test set and measures the increase in prediction error. Features whose permutation causes large error increases are important.

**SHAP values (Shapley Additive Explanations):** Based on cooperative game theory, SHAP assigns each feature a contribution to each individual prediction such that the sum of contributions equals \( \hat{f}(\mathbf{x}) - E[\hat{f}] \). SHAP values satisfy desirable properties (efficiency, symmetry, dummy) and provide consistent local interpretability.

---

# Chapter 7: Ensemble Methods

## 7.1 Bagging

**Bootstrap Aggregating (Bagging)** reduces variance by averaging predictions from \( B \) models trained on bootstrap samples:

\[
\hat{f}^{bag}(\mathbf{x}) = \frac{1}{B}\sum_{b=1}^B \hat{f}^*_b(\mathbf{x})
\]

For regression trees (high-variance, low-bias learners), bagging dramatically reduces variance with little increase in bias. The **out-of-bag (OOB) error** uses predictions from trees for which each observation was not in the bootstrap sample, providing a nearly unbiased test-error estimate without a separate validation set.

## 7.2 Random Forests

**Random forests** extend bagging by introducing additional randomness: at each split, only a random subset of \( m \) features is considered (typically \( m \approx \sqrt{p} \) for classification, \( m \approx p/3 \) for regression). This **decorrelates** the trees, further reducing variance relative to bagging.

\[
\hat{f}^{RF}(\mathbf{x}) = \frac{1}{B}\sum_{b=1}^B T_b(\mathbf{x}; \boldsymbol{\Theta}_b)
\]

where \( \boldsymbol{\Theta}_b \) captures the random feature subsampling at each split. Random forests are among the best off-the-shelf predictors for tabular data.

**Economic application (Kleinberg et al. 2018):** Random forests used to predict judge bail decisions, illustrating that prediction models can inform policy even without identifying causal effects.

## 7.3 Boosting

**Boosting** builds an ensemble sequentially, with each new learner focusing on the errors of the previous ensemble. **AdaBoost** reweights observations by their prediction errors; gradient boosting fits each new tree to the residuals (negative gradient of the loss function).

**Gradient Boosting Machine (GBM):**

\[
\hat{f}^{(m)}(\mathbf{x}) = \hat{f}^{(m-1)}(\mathbf{x}) + \nu\, T_m\!\left(\mathbf{x};\, -\nabla_f \mathcal{L}\big|_{f=\hat{f}^{(m-1)}}\right)
\]

The **shrinkage parameter** (learning rate) \( \nu \in (0,1] \) controls the contribution of each tree. Smaller \( \nu \) requires more trees but often improves out-of-sample performance.

**XGBoost (Chen & Guestrin 2016)** implements regularized gradient boosting with second-order Taylor expansion of the loss, L1/L2 regularization, and efficient histogram-based split finding. XGBoost and LightGBM consistently rank among the top methods in Kaggle tabular competitions.

---

# Chapter 8: Unsupervised Learning

## 8.1 Principal Component Analysis

**PCA** finds low-dimensional linear projections that capture maximum variance. The first principal component is:

\[
z_{i1} = \phi_{11}x_{i1} + \phi_{21}x_{i2} + \cdots + \phi_{p1}x_{ip}
\]

where \( \boldsymbol{\phi}_1 = (\phi_{11}, \ldots, \phi_{p1})^{\top} \) (the first **loading vector**) solves:

\[
\max_{\boldsymbol{\phi}: \|\boldsymbol{\phi}\|=1}\, \text{Var}(\mathbf{X}\boldsymbol{\phi})
\]

Equivalently, the loadings are the eigenvectors of the sample covariance matrix \( \hat{\boldsymbol{\Sigma}} \), ordered by decreasing eigenvalue. The proportion of variance explained by the first \( k \) components is \( \sum_{j=1}^k d_j^2 / \sum_{j=1}^p d_j^2 \) (where \( d_j \) are singular values from SVD of \( \mathbf{X} \)).

PCA applications in economics: constructing economic activity indices from many indicators, reducing dimensionality in factor models, denoising financial returns.

## 8.2 Clustering

**\( K \)-means clustering** partitions \( n \) observations into \( K \) clusters \( C_1, \ldots, C_K \) minimizing total within-cluster variance:

\[
\min_{C_1, \ldots, C_K} \sum_{k=1}^K \sum_{i \in C_k} \|\mathbf{x}_i - \bar{\mathbf{x}}_k\|^2
\]

The algorithm alternates between assigning observations to the nearest centroid and updating centroids, converging to a local minimum. The number of clusters \( K \) is chosen using the **elbow method** (plot within-cluster SS vs. \( K \)) or the **silhouette score**.

**Hierarchical clustering** builds a dendrogram — a tree of nested clusters — using a linkage function (single, complete, or average linkage). It does not require specifying \( K \) in advance.

---

# Chapter 9: Neural Networks and Deep Learning

## 9.1 Feedforward Neural Networks

A feedforward neural network (multilayer perceptron) computes:

\[
\mathbf{h}^{(1)} = g\!\left(\mathbf{W}^{(1)}\mathbf{x} + \mathbf{b}^{(1)}\right)
\]

\[
\mathbf{h}^{(l)} = g\!\left(\mathbf{W}^{(l)}\mathbf{h}^{(l-1)} + \mathbf{b}^{(l)}\right), \quad l = 2, \ldots, L-1
\]

\[
\hat{y} = \mathbf{w}^{(L)\top}\mathbf{h}^{(L-1)} + b^{(L)}
\]

where \( g \) is a non-linear **activation function**. Common choices:

- **ReLU:** \( g(z) = \max(0, z) \) — computationally cheap, avoids vanishing gradients
- **Sigmoid:** \( g(z) = 1/(1+e^{-z}) \) — used in output layer for binary classification
- **Softmax:** Multi-class output normalization

The **universal approximation theorem** (Cybenko 1989; Hornik 1991) states that a single hidden layer with sufficient width can approximate any continuous function on a compact domain to arbitrary precision. Deeper networks achieve the same approximation with exponentially fewer neurons in many cases.

## 9.2 Training Neural Networks

Parameters \( \boldsymbol{\theta} = \{\mathbf{W}^{(l)}, \mathbf{b}^{(l)}\} \) are learned by minimizing the empirical loss \( \mathcal{L}(\boldsymbol{\theta}) = n^{-1}\sum_i \ell(y_i, \hat{y}_i(\boldsymbol{\theta})) \) using **stochastic gradient descent (SGD)**:

\[
\boldsymbol{\theta}^{(t+1)} = \boldsymbol{\theta}^{(t)} - \eta\, \nabla_{\boldsymbol{\theta}} \mathcal{L}_{B^{(t)}}
\]

where \( B^{(t)} \) is a random mini-batch and \( \eta \) is the **learning rate**. **Backpropagation** efficiently computes gradients using the chain rule.

**Regularization techniques to prevent overfitting:**
- **Dropout:** Randomly zero a fraction \( p \) of activations during training
- **\( L_2 \) weight decay:** Add \( \lambda\|\boldsymbol{\theta}\|^2 \) to the loss
- **Early stopping:** Halt training when validation loss stops decreasing
- **Batch normalization:** Normalize activations within each mini-batch

Optimizers beyond vanilla SGD: **Momentum SGD**, **Adam** (adaptive learning rates via first and second moment estimates), **AdaGrad**.

## 9.3 Deep Learning Architectures

**Convolutional Neural Networks (CNNs)** exploit spatial structure via local filters and pooling, revolutionizing image recognition. The convolution operation:

\[
(f * g)(t) = \sum_\tau f(\tau)\, g(t - \tau)
\]

A CNN layer learns to detect local patterns (edges, textures) regardless of spatial position.

**Recurrent Neural Networks (RNNs)** process sequential data by maintaining a hidden state \( \mathbf{h}_t = g(\mathbf{W}\mathbf{h}_{t-1} + \mathbf{U}\mathbf{x}_t + \mathbf{b}) \). **LSTMs (Long Short-Term Memory)** and **GRUs** use gating mechanisms to address the vanishing gradient problem in long sequences.

**Transformers** (Vaswani et al. 2017) replaced RNNs in NLP via **self-attention**: each token attends to all other tokens with learned attention weights:

\[
\text{Attention}(\mathbf{Q}, \mathbf{K}, \mathbf{V}) = \text{softmax}\!\left(\frac{\mathbf{Q}\mathbf{K}^{\top}}{\sqrt{d_k}}\right)\mathbf{V}
\]

Transformers scale effectively with data and compute, enabling the large language models discussed in Chapter 10.

---

# Chapter 10: Text as Data and Large Language Models

## 10.1 Text Representation

Raw text must be converted to numerical features. Approaches from simple to complex:

- **Bag of Words (BoW):** Represent document as vector of word counts (vocabulary size \( V \)). Loses word order.
- **TF-IDF:** Term frequency × inverse document frequency. Downweights common words.
- **Word embeddings (Word2Vec, GloVe):** Dense vectors in \( \mathbb{R}^d \) (\( d \approx 100\text{-}300 \)) trained on co-occurrence statistics. Captures semantic similarity: \( \text{king} - \text{man} + \text{woman} \approx \text{queen} \).
- **Contextual embeddings (BERT, GPT):** Each token receives a context-dependent embedding from a pre-trained transformer.

## 10.2 Large Language Models

**Large Language Models (LLMs)** are transformer-based neural networks trained on massive text corpora using the **self-supervised** task of predicting the next token. GPT-style (decoder-only) models are trained on:

\[
\mathcal{L}_{LM} = -\sum_{t} \ln P(x_t \mid x_{t-1}, x_{t-2}, \ldots, x_1; \boldsymbol{\theta})
\]

Key innovations enabling modern LLMs:
- **Scaling laws (Kaplan et al. 2020):** Performance improves predictably with model size, data volume, and compute.
- **Instruction fine-tuning (RLHF):** Aligning LLMs to follow instructions via reinforcement learning from human feedback.
- **In-context learning:** LLMs can perform new tasks from a few examples in the prompt without weight updates.

## 10.3 LLM Applications in Economics

Economists use LLMs for:
1. **Sentiment analysis:** Extract positive/negative tone from news, earnings calls, or social media at scale.
2. **Document classification:** Classify large corpora of regulatory documents, patents, or job ads.
3. **Information extraction:** Parse structured information (prices, quantities, dates) from unstructured text.
4. **Proxy for survey data:** Use model predictions of consumer sentiment to supplement or replace costly surveys.

<div class="example">
<strong>Ash & Hansen (2023):</strong> Use BERT embeddings of U.S. Congressional speeches to study political polarization over time. Text-as-data enables studying institutional language at a scale impossible with manual coding.
</div>

---

# Chapter 11: Causal Machine Learning

## 11.1 Why ML Alone Cannot Identify Causal Effects

Standard ML algorithms optimize predictive accuracy under the joint distribution \( P(\mathbf{x}, y) \). Causal questions require reasoning about interventional distributions \( P(y \mid do(\mathbf{x} = \mathbf{x}')) \) (Pearl's do-calculus) — these differ from the observational \( P(y \mid \mathbf{x} = \mathbf{x}') \) whenever confounding is present.

Concretely: a model trained to predict job search activity may find that unemployment benefits receipt predicts lower search effort. But this does not identify the causal effect of benefits on search — selection into benefit receipt is confounded with personal characteristics.

## 11.2 Double/Debiased Machine Learning

**Double ML (Chernozhukov et al. 2018)** uses ML to control for high-dimensional confounders while maintaining valid inference on a low-dimensional causal parameter. For the partially linear model:

\[
Y_i = \theta D_i + g(\mathbf{X}_i) + U_i, \quad E[U_i \mid D_i, \mathbf{X}_i] = 0
\]

\[
D_i = m(\mathbf{X}_i) + V_i, \quad E[V_i \mid \mathbf{X}_i] = 0
\]

Step 1: Use any ML method to estimate \( \hat{g} \) (outcome on controls) and \( \hat{m} \) (treatment on controls) via cross-fitting.
Step 2: Estimate \( \theta \) by regressing the residualized outcome \( \tilde{Y}_i = Y_i - \hat{g}(\mathbf{X}_i) \) on the residualized treatment \( \tilde{D}_i = D_i - \hat{m}(\mathbf{X}_i) \):

\[
\hat{\theta}_{DML} = \frac{\sum_i \tilde{D}_i\tilde{Y}_i}{\sum_i \tilde{D}_i^2}
\]

Cross-fitting (leave-one-fold-out estimation of nuisance functions) ensures that regularization bias from the ML steps does not contaminate inference on \( \theta \). Under mild conditions, \( \hat{\theta}_{DML} \) is \( \sqrt{n} \)-consistent and asymptotically normal.

## 11.3 Heterogeneous Treatment Effects and Causal Forests

The **Causal Forest (Wager & Athey 2018)** estimates heterogeneous treatment effects \( \tau(\mathbf{x}) = E[Y_i(1) - Y_i(0) \mid \mathbf{X}_i = \mathbf{x}] \) by adapting random forests to the causal problem. Each tree is grown to maximize heterogeneity in treatment effects (rather than prediction accuracy), and the ensemble provides a locally consistent estimator of \( \tau(\mathbf{x}) \).

The **R-learner** (Nie & Wager 2021) estimates heterogeneous effects by minimizing:

\[
\min_\tau \sum_{i=1}^n \left[(Y_i - \hat{m}(\mathbf{X}_i)) - \tau(\mathbf{X}_i)(D_i - \hat{e}(\mathbf{X}_i))\right]^2
\]

where \( \hat{m} \) and \( \hat{e} \) are cross-fit estimates of the conditional mean outcome and propensity score. Any ML algorithm can be used to estimate \( \tau(\cdot) \) in the second step.

---

# Chapter 12: Support Vector Machines

## 12.1 The Maximal Margin Classifier

For binary classification, an **SVM** finds the separating hyperplane \( \{\mathbf{x}: \mathbf{w}^{\top}\mathbf{x} + b = 0\} \) that maximizes the **margin** — the distance between the hyperplane and the nearest training points (**support vectors**):

\[
\min_{\mathbf{w}, b} \frac{1}{2}\|\mathbf{w}\|^2 \quad \text{subject to} \quad y_i(\mathbf{w}^{\top}\mathbf{x}_i + b) \geq 1 \;\; \forall i
\]

## 12.2 Soft Margin and the Kernel Trick

The **soft-margin SVM** allows some misclassifications via slack variables \( \xi_i \geq 0 \):

\[
\min_{\mathbf{w}, b, \boldsymbol{\xi}} \frac{1}{2}\|\mathbf{w}\|^2 + C\sum_{i=1}^n\xi_i \quad \text{s.t.} \quad y_i(\mathbf{w}^{\top}\mathbf{x}_i + b) \geq 1 - \xi_i,\;\; \xi_i \geq 0
\]

The tuning parameter \( C \) controls the bias-variance tradeoff.

The **kernel trick** implicitly maps \( \mathbf{x} \) into a high-dimensional feature space without computing the features explicitly. Common kernels:

- **Polynomial:** \( K(\mathbf{x}, \mathbf{x}') = (\mathbf{x}^{\top}\mathbf{x}' + 1)^d \)
- **Radial Basis Function (RBF/Gaussian):** \( K(\mathbf{x}, \mathbf{x}') = \exp(-\gamma\|\mathbf{x} - \mathbf{x}'\|^2) \)

SVMs with RBF kernels are flexible classifiers with solid theoretical foundations, though they scale poorly to very large datasets.

---

# Chapter 13: Reinforcement Learning

## 13.1 The RL Framework

**Reinforcement learning (RL)** trains an agent to maximize cumulative reward by interacting with an environment. Components:

- **State** \( s_t \in \mathcal{S} \): the environment's current configuration
- **Action** \( a_t \in \mathcal{A} \): the agent's decision
- **Reward** \( r_t = R(s_t, a_t) \): immediate feedback
- **Policy** \( \pi(a \mid s) \): the agent's strategy (probability of taking action \( a \) in state \( s \))
- **Value function** \( V^\pi(s) = E\!\left[\sum_{k=0}^\infty \gamma^k r_{t+k} \mid s_t = s,\, \pi\right] \): expected discounted return

The discount factor \( \gamma \in [0,1) \) weights near-term rewards more heavily. The **Bellman equation** for the value function:

\[
V^\pi(s) = \sum_a \pi(a\mid s)\left[R(s,a) + \gamma\sum_{s'}P(s'\mid s,a)V^\pi(s')\right]
\]

## 13.2 Q-Learning and Deep RL

**Q-learning** learns the action-value function \( Q^*(s,a) = \max_\pi E\!\left[\sum_{k=0}^\infty\gamma^k r_{t+k}\mid s_t=s, a_t=a, \pi\right] \) via temporal difference updates:

\[
Q(s_t, a_t) \leftarrow Q(s_t, a_t) + \alpha\left[r_t + \gamma\max_{a'}Q(s_{t+1}, a') - Q(s_t, a_t)\right]
\]

**Deep Q-Networks (DQN)** approximate \( Q(s,a;\boldsymbol{\theta}) \) with a neural network, enabling RL in high-dimensional state spaces. RL has achieved superhuman performance in games (AlphaGo, AlphaZero) and is increasingly applied to:
- Dynamic pricing
- Algorithmic trading
- Mechanism design and auction theory
- Education and personalized policy recommendation

## 13.3 RL and Economics

RL is conceptually related to dynamic programming in economics. The agent's optimization problem mirrors the consumer's Bellman equation:

\[
V(a) = \max_{c,\,a'} \{u(c) + \beta V(a')\} \quad \text{s.t. budget constraint}
\]

RL provides computational tools to approximate value functions in high-dimensional problems where analytical solutions are intractable.

---

# Chapter 14: AI, the Labor Market, and Economic Growth

## 14.1 The Labor Market Impact of AI

Empirical evidence on the labor market effects of ML/AI is mixed. Key frameworks:

- **Task-based models (Acemoglu & Restrepo 2018):** Automation displaces workers from tasks but creates new tasks. Net effect depends on the creation margin vs. the displacement margin.
- **Complementarity hypothesis:** AI augments high-skill workers, raising their productivity, while substituting for routine tasks performed by middle-skill workers — consistent with observed **labor market polarization**.

Studies using large language models as productivity tools (Brynjolfsson, Li & Raymond 2023 on customer service agents; Noy & Zhang 2023 on writing tasks) find substantial productivity gains that reduce the skill premium in some settings.

## 14.2 AI, Stagnation, and Innovation

Packalen & Bhatt (2023) examine how scientific ideas built on recent versus older knowledge differ in novelty. LLMs enable analysis of large patent and paper corpora to track the frontier of knowledge — ML tools become instruments for studying innovation itself.

The **productivity paradox** (Solow 1987: "You can see the computer age everywhere but in the productivity statistics") may resolve with a lag: general-purpose technologies like AI typically show productivity gains only after complementary investments in human capital, organization, and infrastructure have accumulated.

---

# Chapter 15: Implementation in Python and R

## 15.1 Scikit-learn Workflow (Python)

```python
from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor
from sklearn.linear_model import Lasso, Ridge
from sklearn.model_selection import cross_val_score, GridSearchCV
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline

# LASSO with cross-validation
pipe = Pipeline([
    ('scaler', StandardScaler()),
    ('lasso', Lasso())
])
param_grid = {'lasso__alpha': [0.001, 0.01, 0.1, 1.0]}
gs = GridSearchCV(pipe, param_grid, cv=5, scoring='neg_mean_squared_error')
gs.fit(X_train, y_train)

# Random forest
rf = RandomForestRegressor(n_estimators=500, max_features='sqrt',
                           oob_score=True, random_state=42)
rf.fit(X_train, y_train)
print(rf.oob_score_)  # OOB R-squared
```

## 15.2 Double ML (Python)

```python
from econml.dml import LinearDML, CausalForestDML
from sklearn.ensemble import GradientBoostingRegressor, GradientBoostingClassifier

# Double ML for ATE estimation
dml = LinearDML(
    model_y=GradientBoostingRegressor(),
    model_t=GradientBoostingClassifier(),
    cv=5
)
dml.fit(Y, T, X=X, W=W)
print(dml.ate_inference().summary_frame())

# Causal forest for heterogeneous effects
cf = CausalForestDML(
    model_y=GradientBoostingRegressor(),
    model_t=GradientBoostingClassifier(),
    cv=5, n_estimators=1000
)
cf.fit(Y, T, X=X)
tau_hat = cf.effect(X_test)
```

## 15.3 LLM API Usage (Python)

```python
import anthropic

client = anthropic.Anthropic()

# Text classification using Claude API
def classify_sentiment(text: str) -> str:
    message = client.messages.create(
        model="claude-opus-4-5",
        max_tokens=100,
        messages=[{
            "role": "user",
            "content": f"Classify the sentiment of this text as positive, negative, or neutral. Text: {text}"
        }]
    )
    return message.content[0].text

# Batch processing for economics research
import pandas as pd
texts = pd.read_csv("earnings_calls.csv")["text"]
sentiments = [classify_sentiment(t) for t in texts[:100]]
```

## 15.4 Neural Networks with PyTorch

```python
import torch
import torch.nn as nn

class EconNet(nn.Module):
    def __init__(self, input_dim, hidden_dim=128, output_dim=1):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(input_dim, hidden_dim),
            nn.ReLU(),
            nn.Dropout(0.2),
            nn.Linear(hidden_dim, hidden_dim),
            nn.ReLU(),
            nn.Dropout(0.2),
            nn.Linear(hidden_dim, output_dim)
        )

    def forward(self, x):
        return self.net(x)

# Training loop with Adam optimizer
model = EconNet(input_dim=X_train.shape[1])
optimizer = torch.optim.Adam(model.parameters(), lr=1e-3, weight_decay=1e-4)
criterion = nn.MSELoss()

for epoch in range(200):
    optimizer.zero_grad()
    pred = model(X_tensor)
    loss = criterion(pred.squeeze(), y_tensor)
    loss.backward()
    optimizer.step()
```
