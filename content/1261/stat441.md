---
title: "STAT 441: Statistical Learning — Classification"
subjects: "STAT"
prof: "Matthias Schonlau"
ai_track: true
---

## Sources and References

**Primary notes** — J. Schnell, STAT 441 student notes, https://student.cs.uwaterloo.ca/~jschnell/uploads/STAT_441.pdf; UWaterloo Data Analytics lecture notes, https://uwaterloo.ca/data-analytics/sites/default/files/uploads/documents/lecture_1.pdf

**Supplementary texts** — James, Witten, Hastie & Tibshirani (2021) *An Introduction to Statistical Learning* (https://www.statlearning.com); Hastie, Tibshirani & Friedman (2009) *The Elements of Statistical Learning* (https://web.stanford.edu/~hastie/ElemStatLearn); Bishop (2006) *Pattern Recognition and Machine Learning*; Schonlau (2023) *Applied Statistical Learning with Case Studies in Stata*, Springer

---

# Chapter 1: Statistical Decision Theory

## The Classification Problem

Statistical learning for classification begins with a deceptively simple question: given an observation \(\mathbf{x} \in \mathcal{X} \subseteq \mathbb{R}^p\), how should we assign it to one of \(K\) discrete categories \(\mathcal{Y} = \{1, 2, \ldots, K\}\)? A classifier is any function \(g : \mathcal{X} \to \mathcal{Y}\), and the discipline of statistical classification is the study of how to learn good classifiers from data, how to measure their quality, and why certain methods work in certain regimes.

The raw ingredients are a training dataset \(\mathcal{D} = \{(\mathbf{x}_i, y_i)\}_{i=1}^n\) of \(n\) independent draws from an unknown joint distribution \(P_{XY}\) over \(\mathcal{X} \times \mathcal{Y}\). The features \(\mathbf{x}_i = (x_{i1}, \ldots, x_{ip})^\top\) encode whatever measurements we have on the \(i\)-th observation, while the label \(y_i\) records its true category. Our goal is to use \(\mathcal{D}\) to build a classifier that generalises well to future observations drawn from the same distribution.

<div class="definition">
<strong>Classifier</strong>: A function \(g : \mathcal{X} \to \mathcal{Y}\) that assigns each feature vector \(\mathbf{x}\) to a predicted class label \(\hat{y} \in \mathcal{Y}\). The <em>decision boundary</em> of \(g\) is the set \(\{ \mathbf{x} \in \mathcal{X} : g \text{ changes its prediction in a neighbourhood of } \mathbf{x} \}\).
</div>

## Loss Functions and Risk

To compare classifiers, we need a way to penalise mistakes. A **loss function** \(L : \mathcal{Y} \times \mathcal{Y} \to [0, \infty)\) quantifies the cost of predicting \(\hat{y}\) when the true label is \(y\). The most common choice is the **0-1 loss**:

\[
L(y, \hat{y}) = \mathbf{1}[y \neq \hat{y}] = \begin{cases} 0 & y = \hat{y} \\ 1 & y \neq \hat{y} \end{cases}
\]

which simply counts whether a mistake was made. Other loss functions capture asymmetric costs: in medical screening, a false negative (missed disease) may be far more costly than a false positive.

The **risk** of a classifier \(g\) under loss \(L\) is its expected loss over the joint distribution:

\[
R(g) = \mathbb{E}_{XY}[L(Y, g(X))] = \sum_{y \in \mathcal{Y}} \int_{\mathcal{X}} L(y, g(\mathbf{x})) \, p(\mathbf{x}, y) \, d\mathbf{x}
\]

For the 0-1 loss this becomes the **misclassification rate** \(R(g) = P(g(X) \neq Y)\). Since the true distribution \(P_{XY}\) is unknown, we cannot compute \(R(g)\) directly; we will return to estimation of risk in the section on model assessment.

## The Bayes Classifier

The most fundamental result in statistical decision theory answers: which classifier minimises the 0-1 risk? By the law of total expectation,

\[
R(g) = \mathbb{E}_X\left[\sum_{k=1}^K L(k, g(X)) \, P(Y = k \mid X)\right] = \mathbb{E}_X\left[1 - P(Y = g(X) \mid X)\right]
\]

This is minimised pointwise: for each \(\mathbf{x}\), we should predict the class with the highest posterior probability.

<div class="definition">
<strong>Bayes Classifier</strong>: The classifier

\[
g^*(\mathbf{x}) = \arg\max_{k \in \mathcal{Y}} P(Y = k \mid X = \mathbf{x})
\]
minimises the 0-1 risk among all classifiers. Its risk

\[
R^* = 1 - \mathbb{E}_X\left[\max_k P(Y=k \mid X)\right]
\]
is called the <em>Bayes error rate</em> — the irreducible minimum achievable by any rule.
</div>

The Bayes error rate measures how much intrinsic overlap exists between the class-conditional distributions. Even with infinite data and a perfect model, we cannot predict better than \(R^*\). The challenge is that \(P(Y = k \mid X = \mathbf{x})\) is unknown; every classification method we study is, in one way or another, an attempt to estimate or approximate these posterior probabilities.

## The Bias-Variance Tradeoff

For regression, the expected mean squared error decomposes cleanly:

\[
\mathbb{E}[(Y - \hat{f}(\mathbf{x}_0))^2] = \underbrace{\operatorname{Var}(\hat{f}(\mathbf{x}_0))}_{\text{variance}} + \underbrace{[\operatorname{Bias}(\hat{f}(\mathbf{x}_0))]^2}_{\text{bias}^2} + \underbrace{\operatorname{Var}(\varepsilon)}_{\text{irreducible}}
\]

The **variance** term measures how much the fitted model fluctuates across different training sets of size \(n\). The **bias** term measures systematic deviation from the truth. The irreducible term \(\operatorname{Var}(\varepsilon)\) represents noise in the outcome that no model can eliminate.

This decomposition motivates a fundamental tradeoff: **flexible** models (many parameters, complex decision boundaries) have low bias but high variance — they fit each training sample closely, including its noise. **Rigid** models (few parameters, simple boundaries) have high bias but low variance — they cannot capture complex patterns but are stable across samples. Selecting the right flexibility level for a given dataset and sample size is at the heart of model selection and regularisation.

For classification, an analogous decomposition holds, though it is somewhat less clean. The key intuition remains: a classifier with too few parameters will systematically misclassify observations near the true boundary (**underfitting**), while one with too many parameters will memorise noise in the training set and fail to generalise (**overfitting**). Overfitting manifests as low training error but high test error.

## Empirical Risk Minimisation

Since the true risk \(R(g)\) is inaccessible, we substitute the **empirical risk**:

\[
\hat{R}(g) = \frac{1}{n} \sum_{i=1}^n L(y_i, g(\mathbf{x}_i))
\]

<div class="definition">
<strong>Empirical Risk Minimisation (ERM)</strong>: Choose the classifier \(\hat{g}\) that minimises \(\hat{R}(g)\) over some hypothesis class \(\mathcal{G}\):

\[
\hat{g} = \arg\min_{g \in \mathcal{G}} \hat{R}(g)
\]
</div>

By the law of large numbers, \(\hat{R}(g) \to R(g)\) as \(n \to \infty\) for any fixed \(g\). The subtlety is that we minimise over \(\mathcal{G}\), which introduces overfitting when \(\mathcal{G}\) is rich enough to perfectly interpolate the training data. Restricting \(\mathcal{G}\) (choosing a smaller function class) or adding regularisation (penalising complexity) brings the empirical risk minimiser closer to a genuine risk minimiser.

## Model Assessment: Cross-Validation and Evaluation Metrics

Because we cannot access the true risk, we estimate generalisation performance by holding out data. **\(k\)-fold cross-validation** partitions the training data into \(k\) roughly equal folds. For each fold \(j\), the model is trained on the remaining \(k-1\) folds and evaluated on fold \(j\). The \(k\) out-of-sample errors are averaged to produce the cross-validation estimate:

\[
\widehat{CV} = \frac{1}{k} \sum_{j=1}^k \hat{R}_j
\]

The limiting case \(k = n\) is **leave-one-out cross-validation** (LOO-CV), which is unbiased but computationally expensive. Common choices are \(k = 5\) or \(k = 10\), which balance variance and computational cost.

For binary classification, the predictions and ground truth are summarised in the **confusion matrix**:

| | Predicted Positive | Predicted Negative |
|---|---|---|
| **Actual Positive** | TP (true positive) | FN (false negative) |
| **Actual Negative** | FP (false positive) | TN (true negative) |

From this table, standard metrics are defined:

\[
\text{Accuracy} = \frac{TP + TN}{N}, \quad \text{Sensitivity} = \frac{TP}{TP + FN}, \quad \text{Specificity} = \frac{TN}{TN + FP}
\]

\[
\text{Precision} = \frac{TP}{TP + FP}, \quad F_1 = \frac{2 \cdot TP}{2 \cdot TP + FP + FN}
\]

Sensitivity (also called recall or true positive rate) and specificity (one minus the false positive rate) jointly characterise a classifier's ability to discriminate. The **ROC curve** plots sensitivity vs. (1 - specificity) as the classification threshold varies, and the **AUC** (area under the ROC curve) summarises this curve in a single number: AUC = 0.5 corresponds to random guessing; AUC = 1 to perfect discrimination.

For multiclass problems, **macro-averaging** computes a metric for each class and averages equally across classes, giving equal weight to rare and common classes alike. **Micro-averaging** pools all predictions into a single confusion matrix, thereby weighting classes by their frequency.

## The Curse of Dimensionality

As the input dimension \(p\) grows, the geometry of high-dimensional spaces becomes treacherous. The volume of a \(p\)-dimensional unit ball relative to the enclosing unit hypercube shrinks to zero exponentially fast:

\[
\frac{\text{Vol}(B_p(1))}{\text{Vol}([0,1]^p)} = \frac{\pi^{p/2} / \Gamma(p/2 + 1)}{1} \to 0 \quad \text{as } p \to \infty
\]

This means that in high dimensions, data points cluster near the corners and edges of their domain rather than the interior. A neighbourhood of any point that captures a fixed fraction of the data must extend so far that it is no longer "local." Distance metrics lose their discriminative power because all pairwise distances converge to the same value. Methods that rely on local similarity (like \(k\)-NN) degrade rapidly unless \(n\) grows exponentially with \(p\). This curse motivates feature selection, dimensionality reduction, and regularisation as essential ingredients in high-dimensional classification.

---

# Chapter 2: Nearest Neighbour Methods

## The k-NN Decision Rule

The simplest nonparametric approach to classification is to estimate the Bayes classifier locally. Rather than modelling the distribution globally, \(k\)-nearest neighbours (\(k\)-NN) finds the \(k\) training points closest to a new query \(\mathbf{x}\) and votes by majority:

<div class="definition">
<strong>\(k\)-Nearest Neighbour Classifier</strong>: Given a training set \(\mathcal{D}\) and distance metric \(d\), define \(\mathcal{N}_k(\mathbf{x})\) as the set of \(k\) training points closest to \(\mathbf{x}\). The \(k\)-NN classifier predicts

\[
\hat{g}(\mathbf{x}) = \arg\max_{k \in \mathcal{Y}} \sum_{(\mathbf{x}_i, y_i) \in \mathcal{N}_k(\mathbf{x})} \mathbf{1}[y_i = k]
\]
</div>

Equivalently, the estimated posterior probability of class \(k\) given \(\mathbf{x}\) is

\[
\hat{P}(Y = k \mid X = \mathbf{x}) = \frac{1}{k} \sum_{(\mathbf{x}_i, y_i) \in \mathcal{N}_k(\mathbf{x})} \mathbf{1}[y_i = k]
\]

The method is beautifully simple: no training phase beyond storing the data (making it a **memory-based** or **lazy** algorithm), no explicit model, no parametric assumptions about the shape of the decision boundary.

The decision boundary of \(1\)-NN is determined by the **Voronoi tessellation** of the training points. Each training point \(\mathbf{x}_i\) owns all query points for which it is the nearest neighbour, forming a convex polytope called its Voronoi cell. The resulting decision boundary can be arbitrarily complex — piecewise linear, with as many pieces as training points.

## Effect of \(k\) on Bias and Variance

The number of neighbours \(k\) controls the bias-variance tradeoff in a transparent way:

- **Small \(k\)** (most extreme: \(k=1\)): Each prediction is determined by a single point, so the decision boundary is very irregular and fits random idiosyncrasies of the training data. The variance is high, but there is essentially no smoothing bias.
- **Large \(k\)** (most extreme: \(k=n\)): Every query point is predicted by the global majority class, ignoring local structure. The variance is very low, but the bias is high wherever local class probabilities deviate from the global prior.

Optimal \(k\) balances these forces and must be chosen by cross-validation. To avoid ties in binary problems, it is conventional to choose \(k\) odd. Ties in majority vote can be broken by random selection among tied classes, by using the prediction of the single nearest neighbour, or by incrementing \(k\) until the tie resolves.

The leave-one-out error is particularly easy to compute for \(k\)-NN: since \(k\)-NN requires no fitting, the LOO prediction for point \(i\) is simply the majority vote among the \(k\) nearest training points *excluding* point \(i\) itself. This makes LOO-CV computationally cheap for \(k\)-NN.

## Distance Metrics

The choice of distance profoundly affects which neighbours are found.

**Euclidean distance**:

\[
d_2(\mathbf{x}, \mathbf{z}) = \|\mathbf{x} - \mathbf{z}\|_2 = \sqrt{\sum_{j=1}^p (x_j - z_j)^2}
\]
This is the default choice, but it treats all features as equally important and on the same scale. When features have different variances, high-variance features dominate the distance. **Standardising** features to zero mean and unit variance before applying \(k\)-NN is therefore essential.

**Mahalanobis distance** accounts for the correlation structure of the features:

\[
d_M(\mathbf{x}, \mathbf{z}) = \sqrt{(\mathbf{x} - \mathbf{z})^\top \Sigma^{-1} (\mathbf{x} - \mathbf{z})}
\]
where \(\Sigma\) is the covariance matrix of the training data. This is equivalent to first applying a whitening transformation \(\tilde{\mathbf{x}} = \Sigma^{-1/2} \mathbf{x}\) and then using Euclidean distance.

**Hamming distance** counts the number of positions at which two binary vectors differ:

\[
d_H(\mathbf{x}, \mathbf{z}) = \sum_{j=1}^p \mathbf{1}[x_j \neq z_j]
\]
This is natural for categorical features. The **Jaccard similarity** (intersection over union) and **cosine similarity**

\[
\text{sim}(\mathbf{x}, \mathbf{z}) = \frac{\langle \mathbf{x}, \mathbf{z} \rangle}{\|\mathbf{x}\|_2 \|\mathbf{z}\|_2}
\]

are also used for binary or bag-of-words representations. Cosine similarity is particularly natural for text data where magnitude (document length) should not affect similarity.

## Weighted \(k\)-NN

A natural extension weights each neighbour's vote by its proximity:

\[
\hat{P}(Y = k \mid X = \mathbf{x}) = \frac{\sum_{i \in \mathcal{N}_k(\mathbf{x})} w_i \, \mathbf{1}[y_i = k]}{\sum_{i \in \mathcal{N}_k(\mathbf{x})} w_i}, \quad w_i = \frac{1}{d(\mathbf{x}, \mathbf{x}_i)^2}
\]

This gives closer neighbours more influence and provides a smoother interpolation than unweighted voting. A related variant uses a **caliper**: instead of fixing the number of neighbours, include all training points within a fixed distance \(\delta\) from the query. The effective \(k\) then adapts to the local density.

## The Cover-Hart Theorem

A celebrated theoretical result by Cover and Hart (1967) establishes that even the crude \(1\)-NN rule is asymptotically competitive with the Bayes classifier:

<div class="definition">
<strong>Cover-Hart Theorem (1967)</strong>: As \(n \to \infty\), the risk of the 1-nearest-neighbour classifier satisfies

\[
R^* \leq R_{1\text{-NN}} \leq 2R^* - \frac{K}{K-1}(R^*)^2 \leq 2R^*
\]
where \(R^*\) is the Bayes error rate and \(K\) is the number of classes. In particular, \(R_{1\text{-NN}} \leq 2R^*\): the 1-NN error is at most twice the Bayes error.
</div>

This result is remarkable: a method with no explicit model and no training phase is provably within a factor of two of the best possible error rate. The key insight is that as \(n \to \infty\), the nearest neighbour \(\mathbf{x}_{(1)}\) converges to \(\mathbf{x}\) itself, so the nearest-neighbour prediction converges to an independent draw from \(P(Y \mid X = \mathbf{x})\) — two independent labels from the same distribution, and a mistake occurs only when they disagree.

For general \(k\)-NN, a similar result holds: as \(n \to \infty\) and \(k \to \infty\) with \(k/n \to 0\), the \(k\)-NN error converges to the Bayes error \(R^*\). The condition \(k/n \to 0\) ensures that the neighbourhood shrinks to a point so that the estimator remains local.

## k-NN in High Dimensions

The preceding theoretical guarantees require \(n\) to grow fast enough relative to \(p\). In practice, to cover a fraction \(r\) of the data volume in \(p\) dimensions, the neighbourhood radius must scale as \(r^{1/p}\). For \(p = 10\) and \(r = 0.01\), one needs a ball of radius \(0.01^{0.1} \approx 0.63\) — more than half the range of each feature, far from being "local." This is the curse of dimensionality in action: \(k\)-NN loses its local character rapidly as \(p\) increases.

Practical remedies include **feature selection** (work in the most relevant subspace), **dimensionality reduction** (PCA or similar), learning **adaptive distance metrics** that emphasise features relevant to the decision boundary, and **ball tree** or **KD-tree** data structures that allow fast approximate nearest-neighbour search.

---

# Chapter 3: Linear Discriminant Analysis

## Generative vs. Discriminative Approaches

Classification methods fall into two broad families. **Discriminative** methods model \(P(Y \mid X)\) directly — logistic regression is the archetype. **Generative** methods model the joint distribution by specifying a prior \(P(Y = k) = \pi_k\) and a class-conditional likelihood \(p(\mathbf{x} \mid Y = k)\), then recover the posterior via Bayes' rule:

\[
P(Y = k \mid \mathbf{x}) = \frac{p(\mathbf{x} \mid Y = k) \pi_k}{\sum_{j=1}^K p(\mathbf{x} \mid Y = j) \pi_j}
\]

Generative models make stronger assumptions and can fail when those assumptions are violated, but they also integrate prior knowledge, handle missing data more naturally, and can be more data-efficient when the model is approximately correct.

## LDA: Derivation from Gaussian Assumptions

**Linear Discriminant Analysis** (LDA) arises from assuming that each class has a multivariate Gaussian density with a **common covariance matrix**:

\[
p(\mathbf{x} \mid Y = k) = \frac{1}{(2\pi)^{p/2} |\Sigma|^{1/2}} \exp\left(-\frac{1}{2}(\mathbf{x} - \boldsymbol{\mu}_k)^\top \Sigma^{-1} (\mathbf{x} - \boldsymbol{\mu}_k)\right)
\]

Applying Bayes' rule and taking logarithms, the **MAP classifier** assigns \(\mathbf{x}\) to the class \(k\) that maximises the **linear discriminant function**:

\[
\delta_k(\mathbf{x}) = \mathbf{x}^\top \Sigma^{-1} \boldsymbol{\mu}_k - \frac{1}{2} \boldsymbol{\mu}_k^\top \Sigma^{-1} \boldsymbol{\mu}_k + \log \pi_k
\]

<div class="definition">
<strong>Linear Discriminant Analysis (LDA)</strong>: Under multivariate Gaussian class conditionals with a common covariance \(\Sigma\), the Bayes classifier reduces to

\[
g^*(\mathbf{x}) = \arg\max_k \delta_k(\mathbf{x})
\]
The decision boundaries between classes are <em>linear</em> in \(\mathbf{x}\), because the quadratic terms \(\mathbf{x}^\top \Sigma^{-1} \mathbf{x}\) cancel when comparing \(\delta_k\) and \(\delta_j\).
</div>

The cancellation of the quadratic term — and hence the linearity of the boundary — depends critically on the equal-covariance assumption. To apply LDA in practice, we estimate the parameters:

\[
\hat{\pi}_k = \frac{n_k}{n}, \quad \hat{\boldsymbol{\mu}}_k = \frac{1}{n_k} \sum_{i: y_i = k} \mathbf{x}_i, \quad \hat{\Sigma} = \frac{1}{n - K} \sum_{k=1}^K \sum_{i: y_i = k} (\mathbf{x}_i - \hat{\boldsymbol{\mu}}_k)(\mathbf{x}_i - \hat{\boldsymbol{\mu}}_k)^\top
\]

The pooled within-class covariance estimate \(\hat{\Sigma}\) uses \(n - K\) degrees of freedom.

## Fisher's Linear Discriminant

An alternative derivation of LDA, due to Fisher (1936), approaches the problem from a projection perspective. For the two-class case, Fisher sought the direction \(\mathbf{w}\) onto which projecting the data maximises the ratio of between-class to within-class variance:

\[
\mathbf{w}^* = \arg\max_{\mathbf{w}} \frac{(\mathbf{w}^\top (\boldsymbol{\mu}_1 - \boldsymbol{\mu}_2))^2}{\mathbf{w}^\top \Sigma \mathbf{w}}
\]

Setting the derivative to zero yields \(\mathbf{w}^* \propto \Sigma^{-1}(\boldsymbol{\mu}_1 - \boldsymbol{\mu}_2)\), exactly the direction of the LDA discriminant. This connection reveals that LDA performs dimensionality reduction: the data are projected onto the \((K-1)\)-dimensional subspace spanned by the between-class mean differences, where classification is then performed.

## Quadratic Discriminant Analysis

When the equal-covariance assumption is relaxed, each class has its own covariance matrix \(\Sigma_k\). The log-posterior is then

\[
\log P(Y = k \mid \mathbf{x}) \propto -\frac{1}{2} \log |\Sigma_k| - \frac{1}{2}(\mathbf{x} - \boldsymbol{\mu}_k)^\top \Sigma_k^{-1} (\mathbf{x} - \boldsymbol{\mu}_k) + \log \pi_k
\]

<div class="definition">
<strong>Quadratic Discriminant Analysis (QDA)</strong>: Under Gaussian class conditionals with class-specific covariances \(\Sigma_k\), the MAP classifier assigns \(\mathbf{x}\) to the class maximising

\[
\delta_k^Q(\mathbf{x}) = -\frac{1}{2}\log|\Sigma_k| - \frac{1}{2}(\mathbf{x}-\boldsymbol{\mu}_k)^\top \Sigma_k^{-1}(\mathbf{x}-\boldsymbol{\mu}_k) + \log\pi_k
\]
The decision boundaries are now <em>quadratic</em> in \(\mathbf{x}\).
</div>

QDA is more flexible than LDA but requires estimating \(K \cdot p(p+1)/2\) covariance parameters versus just \(p(p+1)/2\) for LDA. When \(p\) is large or \(n_k\) is small, QDA may be highly variable. The bias-variance tradeoff between LDA and QDA echoes the general principle: LDA is preferable when the equal-covariance assumption approximately holds or when \(n\) is small; QDA is preferable when covariances genuinely differ and \(n\) is large enough to estimate them reliably.

## Regularised Discriminant Analysis

Friedman (1989) proposed a family of regularised covariance estimators that interpolates between LDA and QDA:

\[
\hat{\Sigma}_k(\alpha) = \alpha \hat{\Sigma}_k + (1 - \alpha) \hat{\Sigma}, \quad \alpha \in [0, 1]
\]

and further shrinks towards the identity:

\[
\hat{\Sigma}_k(\alpha, \gamma) = (1 - \gamma) \hat{\Sigma}_k(\alpha) + \gamma \frac{\text{tr}(\hat{\Sigma}_k(\alpha))}{p} \mathbf{I}
\]

The parameters \(\alpha\) and \(\gamma\) are tuned by cross-validation. This **regularised discriminant analysis** (RDA) is particularly useful in the \(p \gg n\) regime where individual class covariance matrices are singular.

## Naive Bayes Classifier

The naive Bayes classifier makes a drastic but often surprisingly effective simplification: it assumes that all features are **conditionally independent given the class**:

\[
p(\mathbf{x} \mid Y = k) = \prod_{j=1}^p f_{kj}(x_j)
\]

Under this assumption, Bayes' rule gives

\[
P(Y = k \mid \mathbf{x}) \propto \pi_k \prod_{j=1}^p f_{kj}(x_j)
\]

and the classifier predicts the class maximising this product. Each marginal density \(f_{kj}\) can be estimated separately: for continuous features, one often uses a Gaussian; for categorical features with \(d_j\) levels, one uses the empirical frequencies

\[
\hat{P}(X_j = v \mid Y = k) = \frac{|\{i : x_{ij} = v, y_i = k\}| + L}{n_k + d_j L}
\]

where \(L > 0\) is a **Laplace smoothing** parameter. Without smoothing, any (feature value, class) combination not seen in training would assign zero probability to that class — effectively ruling it out regardless of all other features. Laplace smoothing adds virtual observations of every combination, shrinking estimates toward the uniform distribution. The hyperparameter \(L\) can be treated as a tuning parameter and optimised by cross-validation.

Naive Bayes is **fast** (the multivariate problem decomposes into \(p\) independent univariate problems), **stable** (no high-dimensional covariance estimation), and handles mixed feature types gracefully. It works remarkably well for text classification (where the conditional independence assumption is violated by construction, yet the method still discriminates reliably). Its main weakness is that it cannot capture interactions between features.

### Comparison: LDA, QDA, and Naive Bayes

These three methods are all generative classifiers but make different structural assumptions:

| Method | Covariance | Boundary | Parameters | Best when |
|---|---|---|---|---|
| LDA | Common \(\Sigma\) | Linear | \(O(p^2)\) | \(n\) small, classes similar spread |
| QDA | Class-specific \(\Sigma_k\) | Quadratic | \(O(Kp^2)\) | \(n\) large, covariances differ |
| Naive Bayes | Diagonal (independent) | Varies | \(O(Kp)\) | High \(p\), categorical features |

Naive Bayes with Gaussian marginals is a special case of LDA where the covariance is constrained to be diagonal, which results in a linear boundary. The connection to LDA deepens: if the class-conditional Gaussians in LDA happen to have diagonal covariance, the two methods are equivalent.

### Worked Example: LDA on Fisher's Iris Data

Fisher's (1936) iris dataset contains 150 measurements of sepal and petal dimensions across three species: *Iris setosa*, *I. versicolor*, and *I. virginica*. Applying LDA with all four features yields essentially perfect separation of setosa from the other two, with only a few versicolor/virginica observations misclassified. The two discriminant directions can be plotted as a scatter in 2D: the first discriminant separates setosa cleanly from both other classes; the second separates versicolor and virginica along a different axis. QDA achieves slightly better performance on versicolor/virginica due to their different covariance structures, at the cost of estimating three separate \(4 \times 4\) covariance matrices.

---

# Chapter 4: Logistic Regression for Classification

## The Log-Odds Model

Logistic regression is the canonical **discriminative** classifier for binary outcomes. Rather than modelling the full joint distribution \(P(X, Y)\), it directly parameterises the posterior \(P(Y = 1 \mid \mathbf{x})\) via the **log-odds** (logit) link:

\[
\log \frac{P(Y=1 \mid \mathbf{x})}{P(Y=0 \mid \mathbf{x})} = \beta_0 + \beta_1 x_1 + \cdots + \beta_p x_p = \boldsymbol{\beta}^\top \tilde{\mathbf{x}}
\]

where \(\tilde{\mathbf{x}} = (1, x_1, \ldots, x_p)^\top\). Inverting the logit via the **sigmoid** function \(\sigma(t) = e^t/(1 + e^t)\) gives

\[
P(Y = 1 \mid \mathbf{x}) = \sigma(\boldsymbol{\beta}^\top \tilde{\mathbf{x}}) = \frac{e^{\boldsymbol{\beta}^\top \tilde{\mathbf{x}}}}{1 + e^{\boldsymbol{\beta}^\top \tilde{\mathbf{x}}}}
\]

The key interpretation of the coefficients: a one-unit increase in \(x_j\) multiplies the odds of class 1 by \(e^{\beta_j}\). When \(\beta_j > 0\), larger \(x_j\) favours class 1; when \(\beta_j < 0\), it favours class 0.

## Maximum Likelihood Estimation

The log-likelihood of \(\boldsymbol{\beta}\) given the training data is

\[
\ell(\boldsymbol{\beta}) = \sum_{i=1}^n \left[ y_i \log \sigma(\boldsymbol{\beta}^\top \tilde{\mathbf{x}}_i) + (1-y_i) \log(1 - \sigma(\boldsymbol{\beta}^\top \tilde{\mathbf{x}}_i)) \right] = \sum_{i=1}^n \left[ y_i \boldsymbol{\beta}^\top \tilde{\mathbf{x}}_i - \log(1 + e^{\boldsymbol{\beta}^\top \tilde{\mathbf{x}}_i}) \right]
\]

This is a **concave** function of \(\boldsymbol{\beta}\), so any local maximum is global. However, there is no closed-form solution, and we resort to iterative methods.

### Newton-Raphson and IRLS

The score (gradient) and Hessian of \(\ell\) are:

\[
\nabla \ell = \sum_{i=1}^n (y_i - \hat{p}_i) \tilde{\mathbf{x}}_i = \tilde{X}^\top (\mathbf{y} - \hat{\mathbf{p}})
\]

\[
\nabla^2 \ell = -\sum_{i=1}^n \hat{p}_i(1 - \hat{p}_i) \tilde{\mathbf{x}}_i \tilde{\mathbf{x}}_i^\top = -\tilde{X}^\top W \tilde{X}
\]

where \(\hat{p}_i = \sigma(\boldsymbol{\beta}^\top \tilde{\mathbf{x}}_i)\) and \(W = \text{diag}(\hat{p}_1(1-\hat{p}_1), \ldots, \hat{p}_n(1-\hat{p}_n))\). The Newton-Raphson update is

\[
\boldsymbol{\beta}^{\text{new}} = \boldsymbol{\beta}^{\text{old}} + (\tilde{X}^\top W \tilde{X})^{-1} \tilde{X}^\top (\mathbf{y} - \hat{\mathbf{p}})
\]

This can be rewritten as solving a **weighted least squares** problem at each step — hence the name **Iteratively Reweighted Least Squares** (IRLS). The algorithm alternates between computing weights \(W\) given current \(\boldsymbol{\beta}\), and solving the weighted normal equations. It typically converges in 5–10 iterations.

## Multinomial Logistic Regression (Softmax)

For \(K > 2\) classes, one generalisation expresses log-odds relative to a reference class \(K\):

\[
\log \frac{P(Y=k \mid \mathbf{x})}{P(Y=K \mid \mathbf{x})} = \boldsymbol{\beta}_k^\top \tilde{\mathbf{x}}, \quad k = 1, \ldots, K-1
\]

Equivalently, the **softmax parameterisation** is:

\[
P(Y = k \mid \mathbf{x}) = \frac{e^{\boldsymbol{\beta}_k^\top \tilde{\mathbf{x}}}}{\sum_{j=1}^K e^{\boldsymbol{\beta}_j^\top \tilde{\mathbf{x}}}}
\]

with the convention \(\boldsymbol{\beta}_K = \mathbf{0}\) for identifiability. The softmax output is a probability vector that sums to one, making it interpretable as a probabilistic classification. This same form reappears as the output layer of neural networks for multiclass problems.

## Regularised Logistic Regression

Logistic regression with \(L_2\) penalty (Ridge) adds a term to the negative log-likelihood:

\[
\hat{\boldsymbol{\beta}} = \arg\min_{\boldsymbol{\beta}} \left[ -\ell(\boldsymbol{\beta}) + \frac{\lambda}{2} \|\boldsymbol{\beta}\|_2^2 \right]
\]

and the \(L_1\) penalty (Lasso) replaces \(\|\boldsymbol{\beta}\|_2^2\) with \(\|\boldsymbol{\beta}\|_1 = \sum_j |\beta_j|\). The latter induces **sparse solutions** where many \(\hat{\beta}_j = 0\), performing automatic feature selection. The **elastic net** combines both:

\[
\text{penalty} = \alpha \|\boldsymbol{\beta}\|_1 + (1-\alpha) \frac{1}{2}\|\boldsymbol{\beta}\|_2^2
\]

The regularisation strength \(\lambda\) is chosen by cross-validation.

Regularisation in the \(L_1\) case can be understood geometrically: the constraint \(\|\boldsymbol{\beta}\|_1 \leq s\) restricts \(\boldsymbol{\beta}\) to an \(\ell_1\) ball (a diamond in 2D), whose corners lie on the coordinate axes. The minimum of the objective over the constrained set tends to occur at a corner, forcing some coordinates to exactly zero. The \(L_2\) ball (sphere) has no corners, so the minimum lies on the smooth surface and no coefficients are exactly zero (only shrunk).

## Relationship to LDA

There is a deep connection between logistic regression and LDA. If the class-conditional distributions really are Gaussian with equal covariance, then the log-posterior log-odds is *exactly* linear in \(\mathbf{x}\) — the same form as logistic regression. In other words, LDA is a special case of logistic regression, with the constraint that the coefficients must be consistent with Gaussian likelihoods. LDA uses all the data to estimate \(\boldsymbol{\mu}_k\) and \(\Sigma\), whereas logistic regression only uses the boundary-relevant information. In practice, LDA can be more efficient when the Gaussian assumption holds, but logistic regression is more robust when it does not.

## Complete Separation

A troublesome pathology arises when a linear combination of features perfectly separates the two classes in the training data. In this case, the likelihood has no finite maximum: we can make the log-likelihood approach 0 by pushing \(\|\boldsymbol{\beta}\|\) toward infinity along the separating direction. The MLE does not exist, and standard IRLS fails to converge. Remedies include \(L_2\) regularisation (the penalised MLE always exists), Firth's bias-corrected logistic regression, or Bayesian methods with regularising priors.

---

# Chapter 5: Support Vector Machines

## Motivation: The Optimal Separating Hyperplane

When two classes are linearly separable, there exist infinitely many hyperplanes that correctly classify all training points. The SVM selects the one that **maximises the margin** — the perpendicular distance from the decision boundary to the nearest training point of either class.

Encoding the binary response as \(y \in \{-1, +1\}\), a hyperplane is \(\{\mathbf{x} : \beta_0 + \boldsymbol{\beta}^\top \mathbf{x} = 0\}\). A point \(\mathbf{x}_i\) is correctly classified when \(y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) > 0\). The **signed distance** from \(\mathbf{x}_i\) to the hyperplane is \(y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) / \|\boldsymbol{\beta}\|_2\).

The margin \(M\) satisfies \(y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) \geq M \|\boldsymbol{\beta}\|_2\) for all \(i\). Normalising so that \(M \|\boldsymbol{\beta}\|_2 = 1\), the **hard-margin SVM** primal problem is:

<div class="definition">
<strong>Hard-Margin SVM (Primal)</strong>: Find \((\beta_0, \boldsymbol{\beta})\) that solves

\[
\min_{\beta_0, \boldsymbol{\beta}} \frac{1}{2}\|\boldsymbol{\beta}\|_2^2 \quad \text{subject to} \quad y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) \geq 1 \quad \forall i = 1,\ldots,n
\]
The margin is \(M = 1/\|\boldsymbol{\beta}\|_2\) and the observations on the margin boundary (\(y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) = 1\)) are called <em>support vectors</em>.
</div>

## Dual Formulation

The Lagrangian of the primal problem introduces multipliers \(\alpha_i \geq 0\):

\[
\mathcal{L} = \frac{1}{2}\|\boldsymbol{\beta}\|_2^2 - \sum_{i=1}^n \alpha_i \left[ y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) - 1 \right]
\]

Setting \(\partial \mathcal{L}/\partial \boldsymbol{\beta} = 0\) gives \(\boldsymbol{\beta} = \sum_i \alpha_i y_i \mathbf{x}_i\). Setting \(\partial \mathcal{L}/\partial \beta_0 = 0\) gives \(\sum_i \alpha_i y_i = 0\). Substituting back yields the **dual problem**:

\[
\max_{\boldsymbol{\alpha}} \sum_{i=1}^n \alpha_i - \frac{1}{2} \sum_{i,j} \alpha_i \alpha_j y_i y_j \langle \mathbf{x}_i, \mathbf{x}_j \rangle \quad \text{subject to} \quad \alpha_i \geq 0, \; \sum_i \alpha_i y_i = 0
\]

By the KKT complementary slackness conditions, \(\alpha_i > 0\) only for support vectors (points on the margin boundary or within it). All other training points have \(\alpha_i = 0\) and do not influence the solution. The decision function is

\[
\hat{y} = \text{sign}\left(\beta_0 + \sum_{i=1}^n \alpha_i y_i \langle \mathbf{x}_i, \mathbf{x} \rangle\right)
\]

Critically, the solution depends on the data only through **inner products** \(\langle \mathbf{x}_i, \mathbf{x}_j \rangle\), a fact that enables the kernel trick.

## Soft-Margin SVM

Real data are rarely linearly separable. The **soft-margin** (or \(C\)-SVM) allows some training points to violate the margin constraint by introducing **slack variables** \(\xi_i \geq 0\):

\[
\min_{\beta_0, \boldsymbol{\beta}, \boldsymbol{\xi}} \frac{1}{2}\|\boldsymbol{\beta}\|_2^2 + C \sum_{i=1}^n \xi_i \quad \text{subject to} \quad y_i(\beta_0 + \boldsymbol{\beta}^\top \mathbf{x}_i) \geq 1 - \xi_i, \; \xi_i \geq 0
\]

The parameter \(C > 0\) controls the tradeoff: **large \(C\)** penalises violations heavily, producing a narrow margin with few support vectors (low bias, high variance); **small \(C\)** allows many violations, yielding a wide margin (high bias, low variance). In the dual, the constraint becomes \(0 \leq \alpha_i \leq C\). Points fall into three categories:
- \(\alpha_i = 0\): correctly classified outside the margin — not a support vector.
- \(0 < \alpha_i < C\): on the margin boundary (support vectors in the strict sense).
- \(\alpha_i = C\): within the margin or misclassified.

The soft-margin SVM can also be viewed as minimising the **hinge loss** \(\ell_{\text{hinge}}(y, f) = \max(0, 1 - yf)\) plus \(L_2\) regularisation on \(\boldsymbol{\beta}\).

## The Kernel Trick

The dual SVM depends on the data only through inner products \(\langle \mathbf{x}_i, \mathbf{x}_j \rangle\). If we first map inputs to a high-dimensional feature space \(\phi : \mathbb{R}^p \to \mathcal{H}\), the inner products become \(\langle \phi(\mathbf{x}_i), \phi(\mathbf{x}_j) \rangle_\mathcal{H}\). A **kernel function** \(k(\mathbf{x}_i, \mathbf{x}_j) = \langle \phi(\mathbf{x}_i), \phi(\mathbf{x}_j) \rangle\) computes this inner product **implicitly** without explicitly computing \(\phi\).

<div class="definition">
<strong>Mercer's Theorem</strong>: A symmetric function \(k : \mathcal{X} \times \mathcal{X} \to \mathbb{R}\) is a valid (Mercer) kernel if and only if it is positive semi-definite: for any finite set of points \(\{\mathbf{x}_1, \ldots, \mathbf{x}_n\}\), the Gram matrix \(K_{ij} = k(\mathbf{x}_i, \mathbf{x}_j)\) is positive semi-definite.
</div>

Common kernels include:

- **Polynomial**: \(k(\mathbf{x}, \mathbf{z}) = (\langle \mathbf{x}, \mathbf{z} \rangle + c)^d\). For degree \(d = 2\), this corresponds to lifting the input to all degree-\(\leq 2\) monomials.
- **Radial Basis Function (RBF/Gaussian)**: \(k(\mathbf{x}, \mathbf{z}) = \exp\left(-\gamma \|\mathbf{x} - \mathbf{z}\|_2^2\right)\). This corresponds to an infinite-dimensional feature space and is the most commonly used kernel. Smaller \(\gamma\) gives smoother, more globally influenced boundaries.
- **Sigmoid**: \(k(\mathbf{x}, \mathbf{z}) = \tanh(\kappa \langle \mathbf{x}, \mathbf{z} \rangle + c)\). Not always a valid Mercer kernel but used in practice.

The kernelised SVM prediction function is

\[
\hat{y} = \text{sign}\left(\beta_0 + \sum_{i=1}^n \alpha_i y_i \, k(\mathbf{x}_i, \mathbf{x})\right)
\]

### Worked Example: RBF Kernel Margin Calculation

Consider \(n = 4\) points in \(\mathbb{R}^2\) arranged as XOR: \((1,1,-1), (-1,1,+1), (1,-1,+1), (-1,-1,-1)\) — not linearly separable. With an RBF kernel with sufficiently small bandwidth \(\gamma\), the kernel SVM finds a nonlinear boundary separating the classes perfectly. The margin in the kernel feature space satisfies \(M = 1/\|\boldsymbol{\beta}\|_\mathcal{H}\) where \(\|\boldsymbol{\beta}\|_\mathcal{H}^2 = \sum_{i,j} \alpha_i \alpha_j y_i y_j k(\mathbf{x}_i, \mathbf{x}_j)\), computed from the dual optimal \(\boldsymbol{\alpha}\).

**Preprocessing note**: SVMs are highly sensitive to feature scale. All continuous features should be standardised to zero mean and unit variance before training, as large-scale features will dominate the kernel computations.

## Multiclass SVM

SVMs are intrinsically binary. Two standard strategies extend them to \(K > 2\) classes:

- **One-vs-One (OvO)**: Train \(\binom{K}{2}\) binary SVMs, one for each pair of classes. A new point is classified by majority vote across all pairwise classifiers. The method scales quadratically in \(K\) but each individual SVM is trained on only \(2n/K\) points on average.
- **One-vs-All (OvA)**: Train \(K\) binary SVMs, each distinguishing class \(k\) from all others. Assign the class whose margin score is largest. The method scales linearly in \(K\) but each SVM faces imbalanced training data.

## SMO Algorithm

The Sequential Minimal Optimisation (SMO) algorithm of Platt (1998) solves the SVM dual by decomposing the quadratic programming problem into a sequence of minimal sub-problems, each involving only two multipliers \(\alpha_i\) and \(\alpha_j\). These two-variable sub-problems have an analytic solution, making SMO far more efficient than general QP solvers, especially for large \(n\). The algorithm iterates: choose the pair \((i, j)\) that most violates the KKT conditions, solve the 2-variable sub-problem analytically, update, repeat until convergence.

---

# Chapter 6: Decision Trees

## Binary Recursive Partitioning

Decision trees partition the feature space \(\mathcal{X}\) into a collection of axis-aligned hyper-rectangles and fit a constant prediction within each region. The key appeal is **interpretability**: the partition can be visualised as a tree where each internal node specifies a splitting rule (e.g., \(x_j \leq t\)), each branch corresponds to a branch of the rule, and each leaf contains the prediction for all points falling into that region.

The **CART** (Classification and Regression Trees) algorithm of Breiman, Friedman, Olshen & Stone (1984) builds trees by **greedy recursive partitioning**: at each step, search all features and all split points to find the split that most reduces an **impurity criterion**, then recurse on each resulting sub-node.

<div class="definition">
<strong>Node Impurity Measures</strong>: For a node containing \(n_m\) observations with class proportions \(\hat{p}_{mk} = |\{i \in \text{node} : y_i = k\}| / n_m\):
<ul>
<li><strong>Gini index</strong>: \(G_m = \sum_{k=1}^K \hat{p}_{mk}(1 - \hat{p}_{mk})\)</li>
<li><strong>Cross-entropy (deviance)</strong>: \(H_m = -\sum_{k=1}^K \hat{p}_{mk} \log \hat{p}_{mk}\)</li>
<li><strong>Misclassification rate</strong>: \(E_m = 1 - \max_k \hat{p}_{mk}\)</li>
</ul>
All three are minimised when all observations belong to a single class (pure node). Gini and entropy are more sensitive to impurity than misclassification rate and are preferred for growing trees.
</div>

For a proposed split that partitions node \(m\) into left and right children \(m_L\) and \(m_R\) with sizes \(n_L\) and \(n_R\):

\[
\Delta I = I_m - \frac{n_L}{n_m} I_{m_L} - \frac{n_R}{n_m} I_{m_R}
\]

The algorithm chooses the feature \(j\) and threshold \(t\) that maximise \(\Delta I\). For categorical features with \(d\) levels, the search is over all \(2^{d-1} - 1\) possible binary partitions of the levels; for **ordered** categorical features, only \(d-1\) splits need to be considered.

## Tree Prediction

Within each leaf node \(m\), the prediction is the majority class:

\[
\hat{y}_m = \arg\max_k \hat{p}_{mk}
\]

Alternatively, one can output the full probability vector \((\hat{p}_{m1}, \ldots, \hat{p}_{mK})\), which allows AUC computation and probabilistic calibration.

Stopping criteria for tree growth: (1) maximum tree depth reached; (2) minimum node size (leaf has fewer than \(n_{\min}\) observations); (3) improvement \(\Delta I\) falls below a threshold; (4) grow the full tree and then prune (preferred).

## Cost-Complexity Pruning

A fully grown tree typically overfits. Rather than stopping early, it is better to grow a large tree \(T_0\) and then prune it back. **Cost-complexity pruning** considers the family of subtrees \(T \subseteq T_0\) obtained by collapsing internal nodes, and defines the cost-complexity criterion:

\[
C_\alpha(T) = \sum_{m=1}^{|T|} n_m \cdot I_m + \alpha |T|
\]

where \(|T|\) is the number of leaves and \(\alpha \geq 0\) is a complexity parameter. For each \(\alpha\), there exists a unique **minimal cost-complexity subtree** \(T_\alpha\): the smallest subtree minimising \(C_\alpha(T)\). As \(\alpha\) increases, the optimal tree shrinks — larger penalty favours simpler trees. A sequence of nested subtrees \(T_0 \supset T_1 \supset \cdots \supset T_K\) can be found efficiently by the **weakest link pruning** algorithm, which successively removes the internal node with the smallest per-leaf improvement. The optimal \(\alpha\) is chosen by cross-validation.

## Handling Missing Values

Decision trees have several natural strategies for missing feature values:
1. **Missing category**: add a special "missing" level for categorical features.
2. **Default branch**: send missing observations to the larger child node.
3. **Surrogate splits**: find alternative splitting rules on other features that best replicate the primary split. When a primary split variable is missing, use the best surrogate.

These strategies make trees practical for messy real-world data, a significant advantage over many other classifiers.

## Advantages and Disadvantages

Trees are interpretable, handle mixed feature types without preprocessing, are invariant to monotone transformations of features, naturally model interactions, and can handle missing values. Their main weaknesses are high variance (small changes in training data can produce very different trees) and limited predictive accuracy compared to ensemble methods. The high variance of individual trees is precisely what ensemble methods like bagging and random forests exploit.

---

# Chapter 7: Ensemble Methods

## Bias-Variance Decomposition for Classifiers

A single decision tree has low bias (flexible enough to capture complex boundaries) but high variance (the tree changes drastically with different training sets). Ensemble methods reduce variance by averaging over many trees, typically while keeping bias low.

If \(B\) models \(\hat{f}_1, \ldots, \hat{f}_B\) are trained on independent datasets from the same distribution, their average \(\bar{f} = \frac{1}{B}\sum_b \hat{f}_b\) has the same expected prediction but lower variance:

\[
\operatorname{Var}(\bar{f}) = \frac{1}{B} \operatorname{Var}(\hat{f}_b)
\]

In practice, the models are trained on bootstrap samples from the same dataset, so they are correlated with correlation \(\rho\). The variance of the average becomes:

\[
\operatorname{Var}(\bar{f}) = \rho \sigma^2 + \frac{1-\rho}{B} \sigma^2
\]

For large \(B\), the second term vanishes but the first does not: reducing the correlation \(\rho\) between trees becomes the key lever, motivating random forests.

## Bagging

**Bagging** (bootstrap aggregating, Breiman 1996) draws \(B\) bootstrap samples \(\mathcal{D}_1^*, \ldots, \mathcal{D}_B^*\), trains a full unpruned tree on each, and aggregates predictions:

- **Regression**: average the \(B\) predictions \(\hat{y} = \frac{1}{B}\sum_b \hat{f}_b(\mathbf{x})\)
- **Classification**: majority vote, or average the predicted class probabilities across trees

Each bootstrap sample excludes on average \(1 - (1 - 1/n)^n \approx 36.8\%\) of training observations. The excluded observations for tree \(b\) form the **out-of-bag (OOB) sample** \(\mathcal{D} \setminus \mathcal{D}_b^*\).

<div class="definition">
<strong>Out-of-Bag Error</strong>: For each training observation \((\mathbf{x}_i, y_i)\), let \(\mathcal{B}_i = \{b : i \notin \mathcal{D}_b^*\}\) be the set of trees that did not use it. The OOB prediction for \(\mathbf{x}_i\) is the majority vote (or average) over trees in \(\mathcal{B}_i\). The OOB error is the average loss of these OOB predictions. It approximates leave-one-out cross-validation error <em>for free</em>, without additional model fitting.
</div>

Bagging removes interpretability (the ensemble is no longer a single tree) but substantially improves prediction accuracy, especially for high-variance base learners.

## Random Forests

Random forests (Breiman 2001) add a second randomisation on top of bagging: at each node split, only a **random subset** of \(m \ll p\) features is considered as candidates for the split. Common default choices are \(m \approx \sqrt{p}\) for classification and \(m \approx p/3\) for regression.

This feature subsampling **decorrelates** the trees: even if one feature is the strongest predictor, it will not appear in every tree's splits, forcing other features to contribute. The resulting forest has lower inter-tree correlation \(\rho\) than bagging, yielding further variance reduction.

**Hyperparameters**: the number of trees \(B\) (larger is generally better; monitor OOB error for convergence), the subsample size \(m\), and optionally minimum node size and maximum depth.

### Variable Importance

Random forests provide a natural measure of **variable importance** via the OOB samples:

1. Compute the OOB prediction error for the full forest.
2. For each feature \(j\), randomly **permute** its values in the OOB samples and recompute the prediction error with the permuted feature.
3. The variable importance of feature \(j\) is the average increase in OOB error across all trees.

Features with high importance cause large increases in error when permuted; features irrelevant to the decision cause little change. This permutation-based importance is model-agnostic and does not require re-fitting, making it computationally efficient.

An alternative is the **Gini importance**: the total reduction in node impurity attributed to splits on feature \(j\), averaged over all trees. This is faster to compute but can be biased toward high-cardinality features.

The **proximity matrix** is a by-product of the forest: two observations are "close" if they end up in the same leaf across many trees. The \((i,j)\) proximity entry is the fraction of trees where \(\mathbf{x}_i\) and \(\mathbf{x}_j\) share a leaf. This can be used for clustering, missing-value imputation, or outlier detection.

## Boosting

Boosting builds an ensemble **sequentially**: each new learner focuses on the examples that the current ensemble gets wrong. Unlike bagging, boosting is not trivially parallelisable, and the sequence of learners forms a single coherent prediction function.

### AdaBoost

AdaBoost (Freund & Schapire 1995) is the founding algorithm of modern boosting. The key idea is to maintain a **weight distribution** over training examples, initially uniform, and update it after each round to up-weight misclassified examples.

<div class="definition">
<strong>AdaBoost Algorithm</strong>: Initialise weights \(w_i = 1/n\). For \(m = 1, \ldots, M\):
<ol>
<li>Fit a classifier \(G_m\) to the weighted training data.</li>
<li>Compute weighted error: \(\text{err}_m = \sum_{i=1}^n w_i \mathbf{1}[y_i \neq G_m(\mathbf{x}_i)] / \sum_i w_i\)</li>
<li>Compute classifier weight: \(\alpha_m = \log\left(\frac{1 - \text{err}_m}{\text{err}_m}\right)\)</li>
<li>Update data weights: \(w_i \leftarrow w_i \cdot \exp\left(\alpha_m \mathbf{1}[y_i \neq G_m(\mathbf{x}_i)]\right)\), then renormalise.</li>
</ol>
Final classifier: \(G(\mathbf{x}) = \text{sign}\left(\sum_{m=1}^M \alpha_m G_m(\mathbf{x})\right)\).
</div>

The weight update has a compelling interpretation: correctly classified examples are unchanged (multiplied by 1), while misclassified examples are multiplied by \(e^{\alpha_m} > 1\) (since \(\text{err}_m < 0.5\)). The learner at step \(m+1\) is fitted to a distribution that emphasises the current errors. The classifier weight \(\alpha_m\) is large when \(\text{err}_m\) is small (confident, accurate classifier) and approaches zero when \(\text{err}_m \to 0.5\) (random guessing).

**Exponential loss interpretation**: Hastie, Tibshirani & Friedman (2009) showed that AdaBoost is equivalent to **forward stagewise additive modelling** minimising the **exponential loss** \(L(y, f) = \exp(-yf)\). This connection reveals that AdaBoost is doing gradient descent in function space, and that its remarkable resistance to overfitting (observed empirically) is related to margin maximisation: the AdaBoost ensemble tends to increase the margin \(y_i f(\mathbf{x}_i)\) on training points even after the training error reaches zero.

### Gradient Boosting

Gradient boosting (Friedman 2001) generalises AdaBoost to arbitrary differentiable loss functions by interpreting boosting as **steepest descent in function space**. At each step \(m\), we seek to reduce the total loss \(L = \sum_i \ell(y_i, f(\mathbf{x}_i))\) by adding a small function \(b_m\).

The key insight: the negative gradient of the loss with respect to the current predictions \(f_{m-1}(\mathbf{x}_i)\) specifies the optimal direction of steepest descent. We fit a regression tree to these **pseudo-residuals**:

\[
r_{im} = -\left.\frac{\partial \ell(y_i, f(\mathbf{x}_i))}{\partial f(\mathbf{x}_i)}\right|_{f = f_{m-1}}
\]

<div class="definition">
<strong>MART / Gradient Boosting Algorithm</strong>:
<ol>
<li>Initialise \(f_0(\mathbf{x}) = \arg\min_c \sum_i \ell(y_i, c)\)</li>
<li>For \(m = 1, \ldots, M\):
  <ul>
    <li>Compute pseudo-residuals \(r_{im}\) for each training point.</li>
    <li>Fit a regression tree \(b_m\) to \(\{(\mathbf{x}_i, r_{im})\}\), producing leaf regions \(R_{jm}\).</li>
    <li>For each leaf \(j\), compute optimal leaf value by Newton step: \(\gamma_{jm} = -\sum_{i \in R_{jm}} r_{im} / \sum_{i \in R_{jm}} \ell''(y_i, f_{m-1}(\mathbf{x}_i))\)</li>
    <li>Update: \(f_m(\mathbf{x}) = f_{m-1}(\mathbf{x}) + \nu \sum_j \gamma_{jm} \mathbf{1}[\mathbf{x} \in R_{jm}]\)</li>
  </ul>
</li>
</ol>
Here \(\nu \in (0,1]\) is the <em>learning rate</em> (shrinkage factor).
</div>

For squared loss, the pseudo-residuals are ordinary residuals; for log-loss (binary cross-entropy), they are \(r_{im} = y_i - \hat{p}_{m-1}(\mathbf{x}_i)\) — the errors in probability. For exponential loss, gradient boosting recovers AdaBoost.

**Tuning**: Number of trees \(M\), learning rate \(\nu\), tree depth (typically 4–8 for gradient boosting, versus stumps for AdaBoost), and optionally the fraction of training data to subsample for each tree (stochastic gradient boosting).

### XGBoost

XGBoost (Chen & Guestrin 2016) augments the standard gradient boosting framework with:

1. **Regularisation**: adds \(L_2\) penalty on leaf values (\(\nu/2 \sum_j \gamma_{jm}^2\)) and a penalty on tree size (\(\alpha |T|\)) directly to the split criterion.
2. **Second-order Taylor expansion**: approximates the loss as \(\ell(y_i, f_{m-1} + \gamma) \approx \ell(y_i, f_{m-1}) + g_i \gamma + \frac{1}{2} h_i \gamma^2\) where \(g_i, h_i\) are first and second derivatives, enabling analytic leaf values and a closed-form **similarity score** for split evaluation:

\[
\text{similarity}(R) = \frac{\left(\sum_{i \in R} g_i\right)^2}{\nu + \sum_{i \in R} h_i}
\]

The gain of a split is \(\text{gain} = \text{similarity}_L + \text{similarity}_R - \text{similarity}_\text{parent} - \alpha\). Only splits with positive gain are retained.

3. **Quantile sketching**: evaluates split points only at feature quantiles rather than every unique value, enabling efficient large-scale computation.
4. **Sparsity-aware splitting**: handles missing values by learning the best default direction for each split during training.
5. **Parallel computation and cache optimisation**.

XGBoost has dominated structured/tabular data competitions and is widely regarded as the best off-the-shelf ensemble method for such data.

## Stacking

**Stacking** (Wolpert 1992) trains a meta-learner whose inputs are the predictions of several base learners. The training procedure:

1. Use \(k\)-fold cross-validation on the training data: for each fold, train each base learner on the remaining folds and predict on the held-out fold.
2. Collect out-of-fold predictions for all base learners across all training points to form a meta-training set.
3. Train a meta-learner (often logistic regression or a small tree) on the meta-training set.
4. Re-train each base learner on the full training data.

At prediction time, each base learner predicts on the test point and the meta-learner combines those predictions. Stacking exploits the complementary strengths of diverse base learners — e.g., logistic regression, random forest, and an SVM. A common variant passes both the base-learner predictions and the original features \(\mathbf{x}\) to the meta-learner.

---

# Chapter 8: Neural Networks for Classification

## Feedforward Architecture

A **multilayer perceptron** (MLP) is a directed acyclic graph of artificial neurons organised in layers. Given input \(\mathbf{x} \in \mathbb{R}^p\), the **forward pass** of an \(L\)-layer network is:

\[
\mathbf{h}^{(0)} = \mathbf{x}, \quad \mathbf{z}^{(\ell)} = W^{(\ell)} \mathbf{h}^{(\ell-1)} + \mathbf{b}^{(\ell)}, \quad \mathbf{h}^{(\ell)} = \sigma(\mathbf{z}^{(\ell)}), \quad \ell = 1, \ldots, L-1
\]

where \(W^{(\ell)}\) is the weight matrix and \(\mathbf{b}^{(\ell)}\) the bias vector at layer \(\ell\), and \(\sigma\) is a non-linear **activation function** applied element-wise. The output layer uses a different activation depending on the task.

<div class="definition">
<strong>Universal Approximation Theorem</strong>: Any continuous function on a compact domain can be approximated arbitrarily closely by a single hidden-layer MLP with a sufficient number of neurons (Cybenko 1989; Hornik 1991). This result justifies using MLPs as flexible function approximators, though it says nothing about the ease of learning.
</div>

## Activation Functions

The choice of activation function has significant implications for gradient flow and training dynamics.

- **Sigmoid**: \(\sigma(z) = 1/(1 + e^{-z}) \in (0,1)\). Historically the default. Saturates for large \(|z\)|, causing **vanishing gradients** — gradients near zero prevent weight updates in early layers.
- **Tanh**: \(\tanh(z) = (e^z - e^{-z})/(e^z + e^{-z}) \in (-1,1)\). Zero-centred, generally preferable to sigmoid for hidden layers. Still saturates.
- **ReLU** (Rectified Linear Unit): \(\sigma(z) = \max(0, z)\). Does not saturate for positive values, enabling efficient gradient flow through deep networks. Dominant in modern deep learning. Drawback: "dying ReLU" — neurons with persistently negative pre-activations produce zero gradient forever.
- **Leaky ReLU**: \(\sigma(z) = \max(0.01z, z)\). Addresses dying ReLU by allowing small negative gradient.
- **GELU** (Gaussian Error Linear Unit): \(\sigma(z) = z \cdot \Phi(z)\) where \(\Phi\) is the Gaussian CDF. Used in transformers (BERT, GPT).
- **Softmax** (output layer for classification): \(\sigma(\mathbf{z})_k = e^{z_k} / \sum_j e^{z_j}\). Produces a probability vector summing to one over \(K\) classes.

## Cross-Entropy Loss

For \(K\)-class classification with softmax output, the loss for a single example \((\mathbf{x}_i, y_i)\) is the **cross-entropy**:

\[
\ell(y_i, \hat{\mathbf{p}}_i) = -\sum_{k=1}^K \mathbf{1}[y_i = k] \log \hat{p}_{ik} = -\log \hat{p}_{i, y_i}
\]

This is equivalent to the negative log-likelihood under the categorical model. The total loss is \(\mathcal{L} = \frac{1}{n}\sum_i \ell(y_i, \hat{\mathbf{p}}_i)\). The cross-entropy gradient with respect to the pre-softmax output \(\mathbf{z}^{(L)}\) has the clean form \(\partial \mathcal{L}/\partial z_k^{(L)} = \hat{p}_k - \mathbf{1}[y = k]\) — the prediction error, exactly analogous to logistic regression.

## Backpropagation

Neural networks are trained by **stochastic gradient descent**: at each step, sample a mini-batch of \(B\) examples, compute the gradient of the loss, and update the weights:

\[
W^{(\ell)} \leftarrow W^{(\ell)} - \eta \frac{\partial \mathcal{L}}{\partial W^{(\ell)}}
\]

The **backpropagation** algorithm computes \(\partial \mathcal{L}/\partial W^{(\ell)}\) efficiently by the chain rule. Define the **error signal** at layer \(\ell\) as \(\boldsymbol{\delta}^{(\ell)} = \partial \mathcal{L}/\partial \mathbf{z}^{(\ell)}\). The backward recurrence is:

\[
\boldsymbol{\delta}^{(L)} = \hat{\mathbf{p}} - \mathbf{y}_{\text{one-hot}}
\]

\[
\boldsymbol{\delta}^{(\ell)} = \left(W^{(\ell+1)}\right)^\top \boldsymbol{\delta}^{(\ell+1)} \odot \sigma'(\mathbf{z}^{(\ell)})
\]

\[
\frac{\partial \mathcal{L}}{\partial W^{(\ell)}} = \boldsymbol{\delta}^{(\ell)} \left(\mathbf{h}^{(\ell-1)}\right)^\top
\]

where \(\odot\) denotes element-wise multiplication and \(\sigma'\) is the derivative of the activation. The key insight is that by propagating errors from the output layer backward through the network, gradients for all layers can be computed in \(O(|\text{parameters}|)\) time — the same order as the forward pass.

**Vanishing and exploding gradients**: In deep networks, the product \(\prod_\ell \sigma'(z^{(\ell)})\) in the chain rule can shrink exponentially (vanishing) or grow exponentially (exploding) with depth. ReLU activations mitigate vanishing gradients for positive pre-activations (\(\sigma'(z) = 1\) for \(z > 0\)). Exploding gradients are handled by **gradient clipping**.

### Weight Initialisation

Naive initialisation (all zeros, or large random values) causes symmetry or exploding/vanishing activations. **Xavier initialisation** (Glorot & Bengio 2010) addresses this: for a layer with \(n_{\text{in}}\) inputs and \(n_{\text{out}}\) outputs, initialise weights as

\[
W_{ij} \sim \mathcal{N}\left(0, \frac{1}{n_{\text{in}}}\right) \quad \text{or} \quad W_{ij} \sim \mathcal{U}\left[-\frac{\sqrt{6}}{\sqrt{n_{\text{in}}+n_{\text{out}}}}, \frac{\sqrt{6}}{\sqrt{n_{\text{in}}+n_{\text{out}}}}\right]
\]

This ensures that the variance of activations and gradients remains roughly constant across layers (in expectation).

## Regularisation for Neural Networks

Neural networks have many more parameters than training examples in many applications, making regularisation essential.

**Weight decay** (\(L_2\) regularisation): adds a penalty \(\lambda \sum_{\ell,i,j} (W_{ij}^{(\ell)})^2\) to the loss, equivalent to placing a Gaussian prior on weights. This discourages large weights and has the same effect as \(L_2\)-regularised logistic regression in the linear case.

**Dropout** (Srivastava et al. 2014): during each training forward pass, each neuron in a hidden layer is independently set to zero with probability \(p_{\text{drop}}\) (typically 0.2–0.5). This prevents co-adaptation of neurons and encourages each neuron to learn independently useful features. At test time, all neurons are active but their outputs are scaled by \(1 - p_{\text{drop}}\) to match expected activations. Dropout is equivalent to training an exponential ensemble of thinned networks and averaging at test time.

**Batch normalisation** (Ioffe & Szegedy 2015): normalises the pre-activations within each mini-batch to have zero mean and unit variance, then applies learned scale and shift parameters. This stabilises training dynamics, reduces sensitivity to initialisation, and acts as a mild regulariser.

**Early stopping**: monitor performance on a held-out validation set and stop training when validation error starts increasing. This is one of the most effective and computationally cheap regularisation strategies.

**Data augmentation**: artificially expand the training set by applying class-preserving transformations (rotations, flips, crops for images). Extremely effective in computer vision.

## Convolutional Neural Networks

For image classification, fully connected MLPs are impractical: a \(224 \times 224 \times 3\) image has over 150,000 input dimensions, and a fully connected first layer with 1000 units would have 150 million parameters. **Convolutional Neural Networks** (CNNs, LeCun et al. 1989) exploit the spatial structure of images via two key operations.

A **convolutional layer** applies a bank of \(F\) **filters** (small weight matrices of size \(f \times f \times C_{\text{in}}\)) to the input by sliding across spatial positions, computing the dot product at each position:

\[
(W * \mathbf{h})_{i,j,k} = \sum_{u,v,c} W_{u,v,c,k} \cdot h_{i+u, j+v, c} + b_k
\]

This enforces **weight sharing** (the same filter weights are used at every spatial position) and **local connectivity** (each output unit depends on only a small spatial region of the input). A convolutional layer with \(F\) filters of size \(f \times f\) requires only \(F \cdot f^2 \cdot C_{\text{in}}\) weight parameters, regardless of input resolution.

A **pooling layer** reduces spatial dimensions by aggregating over local regions. **Max pooling** takes the maximum of a \(2 \times 2\) block, halving the spatial dimensions while retaining the strongest activations. This provides spatial invariance to small translations.

A typical CNN architecture interleaves convolutional layers (with ReLU activations) and pooling layers to progressively extract higher-level features, then flattens the output and passes it through one or two fully connected layers before the softmax output. The early convolutional layers learn low-level features (edges, textures); deeper layers learn semantic concepts (faces, objects).

## Comparison with Classical Methods

Neural networks require large amounts of training data, substantial computational resources, and careful hyperparameter tuning. For structured/tabular data with hundreds to thousands of observations, gradient boosting (especially XGBoost) typically outperforms neural networks. Neural networks excel when:

- The raw input has spatial, temporal, or sequential structure (images, audio, text).
- The input is very high-dimensional (pixels, waveforms).
- Large labelled datasets are available (\(n \geq 10\,000\) or more).
- Pre-training and transfer learning can be leveraged.

For tabular classification tasks in the \(n < 10\,000\) regime, the order of preference is often: gradient boosting \(\approx\) random forest \(\gg\) logistic regression \(\approx\) SVM \(\gg\) neural network. Neural networks' advantages emerge clearly as \(n\) grows into the millions.

A summary comparing all methods:

| Method | Interpretability | High-dim \(p\) | Large \(n\) | Non-linearity | Prob. outputs |
|---|---|---|---|---|---|
| LDA/QDA | Medium | Poor | Good | None/Quadratic | Yes |
| Logistic Reg. | High | Good (reg.) | Good | None | Yes |
| \(k\)-NN | Low | Poor | Good | High | Yes |
| Naive Bayes | Medium | Excellent | Good | None | Yes |
| Decision Tree | Very High | Good | Fair | High | Yes |
| SVM (kernel) | Low | Good | Poor | High | No (score) |
| Random Forest | Low | Good | Good | Very High | Yes |
| Gradient Boost | Very Low | Good | Good | Very High | Yes |
| Neural Network | Very Low | Good | Excellent | Very High | Yes |

---

# Appendix: Mathematical Foundations and Key Theorems

## The Representer Theorem

The SVM solution \(\hat{\boldsymbol{\beta}} = \sum_i \alpha_i y_i \phi(\mathbf{x}_i)\) is a special case of the **representer theorem**: for any regularised risk minimisation problem of the form

\[
\min_{f \in \mathcal{H}} \left[ \sum_{i=1}^n L(y_i, f(\mathbf{x}_i)) + \lambda \|f\|_\mathcal{H}^2 \right]
\]

where \(\mathcal{H}\) is a reproducing kernel Hilbert space (RKHS) with kernel \(k\), the minimiser has the form \(f^*(\mathbf{x}) = \sum_{i=1}^n \alpha_i k(\mathbf{x}_i, \mathbf{x})\). This reduces an infinite-dimensional optimisation problem over \(\mathcal{H}\) to a finite-dimensional problem in the coefficients \(\boldsymbol{\alpha} \in \mathbb{R}^n\).

## AdaBoost Margin Interpretation

For a training example \((\mathbf{x}_i, y_i)\), define the **functional margin** after \(M\) rounds as

\[
m_i = \frac{y_i \sum_{m=1}^M \alpha_m G_m(\mathbf{x}_i)}{\sum_{m=1}^M \alpha_m}
\]

Schapire, Freund, Bartlett & Lee (1998) proved that the training error of AdaBoost is bounded by \(\exp(-2 \sum_m (\frac{1}{2} - \text{err}_m)^2)\), implying exponential convergence when each weak learner has accuracy better than chance. More deeply, even after reaching zero training error, AdaBoost continues to increase the minimum margin over training points. This margin-maximising property connects AdaBoost to SVMs and partly explains its empirical resistance to overfitting.

## Bias-Variance Tradeoff: Formal Statement

For a regression function \(f^*(\mathbf{x}) = \mathbb{E}[Y \mid X = \mathbf{x}]\) and an estimator \(\hat{f}\) trained on \(n\) observations:

\[
\mathbb{E}\left[(\hat{f}(\mathbf{x}_0) - f^*(\mathbf{x}_0))^2\right] = \left(\mathbb{E}[\hat{f}(\mathbf{x}_0)] - f^*(\mathbf{x}_0)\right)^2 + \operatorname{Var}(\hat{f}(\mathbf{x}_0))
\]

The bias decreases as the hypothesis class enlarges; the variance increases. For \(k\)-NN with fixed \(k\), as \(n \to \infty\), bias decreases because the neighbourhood shrinks toward \(\mathbf{x}_0\), but variance remains \(O(1/k)\). For fixed \(n\), increasing \(k\) trades variance for bias.

## Relationship between Softmax and Logistic Regression

Binary logistic regression with parameters \((\boldsymbol{\beta}_1, \boldsymbol{\beta}_0 = \mathbf{0})\) is the two-class special case of multinomial logistic regression. The softmax output for class 1 simplifies to:

\[
P(Y=1 \mid \mathbf{x}) = \frac{e^{\boldsymbol{\beta}_1^\top \tilde{\mathbf{x}}}}{e^{\boldsymbol{\beta}_1^\top \tilde{\mathbf{x}}} + e^{\mathbf{0}^\top \tilde{\mathbf{x}}}} = \frac{e^{\boldsymbol{\beta}_1^\top \tilde{\mathbf{x}}}}{1 + e^{\boldsymbol{\beta}_1^\top \tilde{\mathbf{x}}}} = \sigma(\boldsymbol{\beta}_1^\top \tilde{\mathbf{x}})
\]

exactly the sigmoid of binary logistic regression.

## Feature Engineering and Text Classification

Real classification problems often require substantial **feature engineering** before applying the methods discussed. For tabular data, this includes encoding categorical variables (one-hot encoding, target encoding), handling missing values (imputation, missingness indicators), and polynomial or interaction features.

For text classification, the **bag-of-words** representation counts word occurrences, producing a sparse high-dimensional vector. **\(n\)-grams** extend this to sequences of \(n\) consecutive words, capturing some word order information. The **TF-IDF** weighting scheme adjusts raw counts for overall word frequency:

\[
\text{TF-IDF}_{t,d} = \text{TF}_{t,d} \times \text{IDF}_t = (1 + \log f_{t,d}) \times \log\frac{N}{N_t}
\]

where \(f_{t,d}\) is the count of term \(t\) in document \(d\), \(N\) is the number of documents, and \(N_t\) is the number of documents containing \(t\). TF-IDF upweights terms that are frequent in a document but rare globally — these are likely the most informative discriminative terms.

The **cosine similarity** between document vectors \(\mathbf{x}_1\) and \(\mathbf{x}_2\) is

\[
\text{sim}(\mathbf{x}_1, \mathbf{x}_2) = \frac{\langle \mathbf{x}_1, \mathbf{x}_2 \rangle}{\|\mathbf{x}_1\|_2 \|\mathbf{x}_2\|_2}
\]

This is invariant to document length and is the natural similarity measure for TF-IDF vectors. Modern text classification increasingly uses dense embedding representations from transformer models (BERT, GPT), bypassing these manual features entirely.

## Regularisation and the Lasso Geometry

Ridge regression (\(L_2\)) and Lasso (\(L_1\)) regularisation correspond geometrically to constrained optimisation over balls of different shapes. The \(L_2\) constraint set \(\{\boldsymbol{\beta} : \|\boldsymbol{\beta}\|_2 \leq s\}\) is a smooth sphere; the \(L_1\) constraint set \(\{\boldsymbol{\beta} : \|\boldsymbol{\beta}\|_1 \leq s\}\) is a diamond with corners on the coordinate axes. Contours of the residual sum of squares expand from the unconstrained minimum until they touch the constraint set. Because the \(L_1\) ball has corners, this contact is much more likely to occur at a corner where some coefficients are exactly zero — this is why Lasso performs automatic feature selection. The \(L_2\) ball has no corners, so the contact point generically has all coordinates nonzero, shrinking coefficients but not zeroing them.

The **elastic net** penalty \(\alpha \|\boldsymbol{\beta}\|_1 + (1-\alpha)\|\boldsymbol{\beta}\|_2^2\) combines both effects: it promotes sparsity (via \(L_1\)) while also handling correlated features more gracefully than pure Lasso (via \(L_2\)). When features are highly correlated, Lasso tends to select one arbitrarily; the elastic net tends to select all of them with similar nonzero coefficients.

---

# Chapter 9: Model Selection, Tuning, and Evaluation

## The Model Selection Problem

Almost every method we have discussed contains at least one hyperparameter that must be set before learning: the number of neighbours \(k\) in \(k\)-NN, the regularisation strength \(\lambda\) in logistic regression, the cost parameter \(C\) in SVMs, the number of trees \(B\) and feature subsample size \(m\) in random forests, the depth and learning rate in gradient boosting. Choosing these hyperparameters by minimising training error leads to overfitting. The correct principle is to choose hyperparameters by minimising an **unbiased estimate** of test error.

The fundamental tool is **cross-validation**. In \(k\)-fold CV, the data are partitioned into \(k\) folds. For each candidate hyperparameter value, the model is trained \(k\) times, each time withholding one fold, and the average held-out error across all \(k\) folds estimates the expected test error at that hyperparameter value. The hyperparameter giving the lowest CV error is selected, and the model is then re-trained on all available data with that value.

A subtlety is that if we select the best among many hyperparameter configurations using a single CV estimate, that estimate is itself optimistically biased — we have effectively fitted to the validation folds. This **double-dipping** problem motivates a nested cross-validation design: an outer loop estimates test error for the final selected model, while an inner loop selects hyperparameters.

## The ROC Curve in Depth

Many classifiers produce a continuous score (posterior probability, distance to margin, ensemble vote fraction) before applying a threshold to produce a class label. The **ROC curve** traces out the (false positive rate, true positive rate) operating point as the threshold varies from \(+\infty\) to \(-\infty\):

\[
\text{TPR}(\tau) = \frac{|\{i : \hat{s}_i \geq \tau, y_i = 1\}|}{|\{i : y_i = 1\}|}, \quad \text{FPR}(\tau) = \frac{|\{i : \hat{s}_i \geq \tau, y_i = 0\}|}{|\{i : y_i = 0\}|}
\]

The ROC curve starts at (0,0) (all negatives, threshold \(= +\infty\)), passes through (1,1) (all positives, threshold \(= -\infty\)), and a perfect classifier passes through the top-left corner (0,1). The area under the ROC curve (AUC) has an elegant probabilistic interpretation:

\[
\text{AUC} = P(\hat{s}(X_1) > \hat{s}(X_0) \mid Y_1 = 1, Y_0 = 0)
\]

That is, AUC equals the probability that a randomly chosen positive example scores higher than a randomly chosen negative example. A random classifier achieves AUC = 0.5; a perfect classifier achieves AUC = 1.

For imbalanced classes (e.g., 99% negatives), the **Precision-Recall curve** is often more informative. Precision \(= TP/(TP + FP)\) and recall \(= TP/(TP + FN)\) are both computed from the positive class only, making the curve insensitive to the large pool of true negatives.

## Calibration

A classifier is **well-calibrated** if predicted probabilities match empirical frequencies: among all examples predicted to have probability \(\hat{p} \approx 0.7\), roughly 70% should actually belong to the positive class. Many classifiers — SVMs, naive Bayes, boosted ensembles — produce scores or probabilities that are poorly calibrated even when their ranking (AUC) is good.

Calibration is assessed via the **reliability diagram**: partition predictions into probability bins (e.g., [0, 0.1), [0.1, 0.2), ...) and plot the mean predicted probability vs. the observed fraction of positives in each bin. A perfectly calibrated classifier lies on the diagonal.

Two post-hoc recalibration methods are widely used:
- **Platt scaling**: fit a logistic regression model with the raw score as the single input, training on a held-out calibration set.
- **Isotonic regression**: fit a piecewise constant non-decreasing function mapping raw scores to calibrated probabilities, using the pool adjacent violators algorithm.

## Comparing Classifiers Statistically

Given two classifiers' error rates \(\hat{R}_A\) and \(\hat{R}_B\) estimated on a common test set, we may want to test whether one is significantly better. The **McNemar test** exploits the pairing: let \(n_{01}\) be the number of examples where classifier A is wrong and B is right, and \(n_{10}\) where A is right and B is wrong. Under the null hypothesis of equal error rates, by the exact binomial or the approximate statistic:

\[
\chi^2 = \frac{(n_{01} - n_{10})^2}{n_{01} + n_{10}} \sim \chi^2_1
\]

This test accounts for the correlation induced by evaluating both classifiers on the same data, unlike a naive two-proportion z-test.

---

# Chapter 10: Generative Models and Probabilistic Classification

## The Generative Modelling Paradigm

The generative approach to classification explicitly models the joint distribution \(P(X, Y)\) by specifying:
1. **Class priors** \(\pi_k = P(Y = k)\) for \(k = 1, \ldots, K\).
2. **Class-conditional distributions** \(p(\mathbf{x} \mid Y = k)\) for each class.

Given these, the posterior used for classification follows from Bayes' rule. The advantage of the generative approach is that it can answer a broader range of queries: it can generate new synthetic examples from class \(k\), detect out-of-distribution inputs (via the marginal likelihood \(p(\mathbf{x}) = \sum_k \pi_k p(\mathbf{x} \mid k)\)), and naturally incorporate unlabelled data (semi-supervised learning).

## Gaussian Mixture Models as Soft LDA

When the class-conditional distributions are mixtures of Gaussians rather than single Gaussians, the generative model becomes more flexible. A **Gaussian Mixture Model** (GMM) represents the marginal density as

\[
p(\mathbf{x}) = \sum_{j=1}^J \pi_j \, \mathcal{N}(\mathbf{x} \mid \boldsymbol{\mu}_j, \Sigma_j)
\]

Within each class, one may use a separate GMM, fitting it by Expectation-Maximisation (EM). Each mixture component in each class creates a locally linear decision region; the overall boundary is a smooth union of quadratic pieces. This provides a powerful middle ground between the rigidity of LDA/QDA and the full nonparametric flexibility of \(k\)-NN.

## Naive Bayes for Text: The Multinomial Model

For text classification, the standard naive Bayes model is not the Gaussian but the **multinomial** model. A document of \(n_d\) words is treated as a bag-of-words, and the probability of the document given class \(k\) is

\[
p(\mathbf{x} \mid Y = k) = \frac{n_d!}{\prod_{j=1}^p x_j!} \prod_{j=1}^p \theta_{kj}^{x_j}
\]

where \(x_j\) is the count of word \(j\) and \(\theta_{kj} = P(\text{word } j \mid Y = k)\). The MLE is simply \(\hat{\theta}_{kj} = (\text{count of word } j \text{ in class } k \text{ docs}) / (\text{total words in class } k \text{ docs})\). With Laplace smoothing (\(+L\) pseudo-counts), this becomes:

\[
\hat{\theta}_{kj} = \frac{\text{count}_{kj} + L}{\sum_{j'} \text{count}_{kj'} + pL}
\]

The **Bernoulli** naive Bayes variant instead models presence/absence of each word (binary feature) and is better suited when document length is unimportant relative to which words appear.

## The EM Algorithm for Latent Variable Models

The **Expectation-Maximisation** algorithm (Dempster, Laird & Rubin 1977) provides a general framework for maximum likelihood estimation in models with latent variables. For a model with observed data \(\mathbf{x}\), latent variables \(\mathbf{z}\), and parameters \(\boldsymbol{\theta}\), EM iterates between:

**E-step**: Compute the expected complete-data log-likelihood under the current parameter estimate:

\[
Q(\boldsymbol{\theta} \mid \boldsymbol{\theta}^{\text{old}}) = \mathbb{E}_{\mathbf{z} \mid \mathbf{x}, \boldsymbol{\theta}^{\text{old}}}[\log p(\mathbf{x}, \mathbf{z} \mid \boldsymbol{\theta})]
\]

**M-step**: Maximise \(Q\) over \(\boldsymbol{\theta}\):

\[
\boldsymbol{\theta}^{\text{new}} = \arg\max_{\boldsymbol{\theta}} Q(\boldsymbol{\theta} \mid \boldsymbol{\theta}^{\text{old}})
\]

It can be shown that the observed-data log-likelihood \(\log p(\mathbf{x} \mid \boldsymbol{\theta})\) is non-decreasing along the EM sequence. For GMMs, the E-step computes posterior probabilities (soft assignments) of each point to each component; the M-step updates component means, covariances, and weights using weighted MLE. EM converges to a local maximum, and multiple restarts are advisable.

## LDA as a Special Case of Generative Modelling

It is instructive to see how LDA emerges from the generative framework. Suppose we assume:
- \(Y \sim \text{Categorical}(\boldsymbol{\pi})\) with \(\pi_k = P(Y=k)\).
- \(X \mid Y = k \sim \mathcal{N}(\boldsymbol{\mu}_k, \Sigma)\) with a common \(\Sigma\).

The log-posterior ratio between classes \(k\) and \(j\) is:

\[
\log \frac{P(Y=k \mid \mathbf{x})}{P(Y=j \mid \mathbf{x})} = \mathbf{x}^\top \Sigma^{-1}(\boldsymbol{\mu}_k - \boldsymbol{\mu}_j) - \frac{1}{2}(\boldsymbol{\mu}_k + \boldsymbol{\mu}_j)^\top \Sigma^{-1}(\boldsymbol{\mu}_k - \boldsymbol{\mu}_j) + \log\frac{\pi_k}{\pi_j}
\]

This is **linear** in \(\mathbf{x}\), confirming the decision boundary is a hyperplane. The coefficients of \(\mathbf{x}\) are \(\Sigma^{-1}(\boldsymbol{\mu}_k - \boldsymbol{\mu}_j)\) — the Mahalanobis direction between the two class means.

In high dimensions where \(p > n - K\), the pooled covariance estimate \(\hat{\Sigma}\) is singular and cannot be inverted. Regularisation via RDA, or using the Moore-Penrose pseudoinverse, or reducing dimension via PCA first, are all standard remedies.

---

# Chapter 11: Practical Considerations and Case Studies

## Data Preprocessing Pipeline

Successful classification in practice depends as much on preprocessing as on algorithm choice. A standard pipeline:

1. **Handle missing values**: for tree methods, built-in strategies suffice; for LDA, logistic regression, SVMs, impute missing values (mean, median, or model-based imputation) or use missingness indicators.
2. **Encode categorical features**: for linear models and SVMs, use one-hot encoding; for tree methods, use ordinal encoding or leave as-is (CART handles categorical splits natively).
3. **Scale features**: required for \(k\)-NN, SVMs, logistic regression (affects convergence speed and regularisation), and neural networks. Use **standardisation** \((x - \bar{x})/s\) or **min-max scaling** \((x - \min)/ (\max - \min)\). Tree methods are scale-invariant.
4. **Feature selection / dimensionality reduction**: wrapper methods (recursive feature elimination), filter methods (correlation, mutual information), embedded methods (Lasso), or PCA.

## Handling Class Imbalance

In many real applications, classes are severely imbalanced: e.g., 99% negative, 1% positive. A naive classifier that always predicts the majority class achieves 99% accuracy, yet is useless. Strategies:

- **Resampling**: **oversampling** the minority class (with or without replacement), or **undersampling** the majority class. **SMOTE** (Synthetic Minority Over-sampling Technique) creates synthetic minority examples by interpolating between existing ones.
- **Cost-sensitive learning**: assign higher misclassification cost to the minority class, modifying the loss function.
- **Threshold adjustment**: for classifiers producing probability outputs, lower the decision threshold from 0.5 to a value that achieves the desired recall-precision tradeoff, informed by the ROC or Precision-Recall curve.
- **Evaluation**: use AUC, F1 score, or Precision-Recall AUC rather than accuracy, which is dominated by the majority class.

## The No Free Lunch Theorem

The No Free Lunch (NFL) theorem (Wolpert 1996) establishes that, averaged over all possible data-generating distributions, no learning algorithm outperforms any other. In other words, there is no universally best classifier. Every method that performs better on some distributions must perform worse on others. This does not imply that all classifiers are equally good in practice — the real world concentrates on a small subset of distributions (smooth, structured, low-intrinsic-dimension) where methods with appropriate inductive biases excel — but it does caution against proclaiming any algorithm universally superior.

## A Kaggle-Style Classification Workflow

The course's project component follows a competitive prediction setting (similar to Kaggle). A robust workflow:

1. **Exploratory data analysis**: class distribution, missing value rates, feature correlations, target leakage checks.
2. **Baseline model**: fit a logistic regression and a simple decision tree to establish reference performance.
3. **Feature engineering**: domain-specific transformations, interaction terms, target encoding for high-cardinality categoricals.
4. **Model comparison**: evaluate LDA, naive Bayes, \(k\)-NN, SVM, random forest, gradient boosting via stratified \(k\)-fold CV.
5. **Hyperparameter tuning**: grid search or random search within cross-validation.
6. **Ensemble / stacking**: combine the best 3–5 models via stacking with logistic regression meta-learner.
7. **Calibration**: check probability calibration if well-calibrated probabilities are needed.
8. **Final submission**: retrain on all available labelled data with selected hyperparameters; submit to the competition evaluation server.

In practice, for structured tabular data, XGBoost or LightGBM (with good feature engineering) typically tops the leaderboard. Neural networks rarely outperform these on tabular data unless the dataset is very large or has spatial/temporal structure.

## Summary: Choosing a Classifier

Rather than seeking a universally best method, experienced practitioners ask: what does this dataset look like? The following heuristics apply:

- **\(n < 500\)**: logistic regression (regularised), LDA, naive Bayes, or \(k\)-NN. Avoid deep trees and neural networks.
- **\(n \sim 1{,}000\)–\(10{,}000\)**: random forest or gradient boosting are usually best. SVM with RBF kernel is competitive.
- **\(n > 100{,}000\)** with tabular structure: XGBoost/LightGBM. Neural networks become viable.
- **\(n > 10^6\)** with image/text/audio: deep neural networks with appropriate architecture.
- **High \(p\) with sparse structure** (text): logistic regression with \(L_1\) penalty or naive Bayes.
- **Interpretability required**: logistic regression or a shallow decision tree.
- **Calibrated probabilities required**: logistic regression or random forest with Platt scaling.
- **Categorical features with high cardinality**: gradient boosting with target encoding.

The most robust practical strategy is to try several diverse methods, combine them via stacking, and let the data decide via rigorous cross-validation.

---

# Chapter 12: Theoretical Perspectives and Advanced Topics

## VC Dimension and Generalisation Bounds

The **Vapnik-Chervonenkis (VC) dimension** provides a combinatorial measure of a classifier's complexity. A classifier \(g\) **shatters** a set \(S = \{\mathbf{x}_1, \ldots, \mathbf{x}_m\}\) if for every labelling \(y \in \{0,1\}^m\), there exists a classifier in the class that produces that labelling. The VC dimension of a hypothesis class \(\mathcal{G}\) is the maximum size of any set it can shatter:

\[
\text{VC}(\mathcal{G}) = \max\{m : \exists S \text{ with } |S| = m \text{ shattered by } \mathcal{G}\}
\]

For linear classifiers in \(\mathbb{R}^p\), \(\text{VC} = p + 1\). For the class of halfspaces (hard-margin SVMs), VC dimension is also \(p + 1\) — but the soft-margin SVM with a large margin \(M\) has a much lower effective VC dimension, roughly \(O(R^2/M^2)\) where \(R\) is the radius of the smallest enclosing sphere. This is the key insight: by maximising the margin, the SVM implicitly minimises its effective complexity, providing generalisation guarantees independent of the input dimension \(p\).

The **PAC learning bound** (Vapnik & Chervonenkis 1971; Valiant 1984) states that for a hypothesis class of VC dimension \(d\), with probability at least \(1 - \delta\) over training sets of size \(n\):

\[
R(\hat{g}) \leq \hat{R}(\hat{g}) + \sqrt{\frac{d \log(2n/d) + \log(2/\delta)}{n}}
\]

The second term is the **generalisation gap** — it decreases with \(n\) and increases with \(d\). This formalises the intuition that more complex hypothesis classes require more data to learn reliably.

## The Kernel Method: RKHS Perspective

The kernel trick is most cleanly understood through the theory of **reproducing kernel Hilbert spaces** (RKHS). A Hilbert space \(\mathcal{H}\) of functions \(f : \mathcal{X} \to \mathbb{R}\) is a reproducing kernel Hilbert space with kernel \(k\) if:
1. For every \(\mathbf{x} \in \mathcal{X}\), the function \(k(\cdot, \mathbf{x})\) belongs to \(\mathcal{H}\).
2. The reproducing property holds: \(f(\mathbf{x}) = \langle f, k(\cdot, \mathbf{x}) \rangle_\mathcal{H}\) for all \(f \in \mathcal{H}\).

The kernel \(k\) uniquely determines the RKHS and vice versa. The norm \(\|f\|_\mathcal{H}^2\) measures the complexity of \(f\) in a way that is intrinsic to the kernel — smoother functions have lower norm. Ridge regression and SVMs with kernel \(k\) are equivalent to optimising over \(\mathcal{H}\) with \(L_2\) regularisation \(\lambda\|f\|_\mathcal{H}^2\), and the representer theorem guarantees the optimal solution lives in the span of \(\{k(\cdot, \mathbf{x}_1), \ldots, k(\cdot, \mathbf{x}_n)\}\).

Different kernels encode different notions of similarity, and hence different inductive biases:
- **RBF kernel**: similarity decays exponentially with Euclidean distance. Encodes the assumption that nearby points in input space should have similar labels. The bandwidth parameter \(\gamma = 1/(2\sigma^2)\) controls how quickly similarity falls off.
- **Polynomial kernel**: all polynomial interactions up to degree \(d\). Appropriate when feature interactions are informative.
- **String kernels** (for text): count matching substrings of varying lengths, capturing shared n-gram patterns without explicit feature computation.

## Random Forests: Why They Work

Breiman's theoretical analysis of random forests identifies two key properties that explain their success:

1. **Strength**: the generalisation error of a forest is bounded by \(\rho(1 - s^2)/s^2\) where \(s\) is the average accuracy of individual trees (strength) and \(\rho\) is the average pairwise correlation. The bound decreases as \(s\) increases or \(\rho\) decreases. Adding more trees reduces the finite-sample fluctuation around this bound but does not change the asymptotic error.

2. **Decorrelation via feature subsampling**: by restricting each split to a subset of \(m\) features, random forests reduce \(\rho\) while approximately preserving \(s\). The optimal \(m\) balances these: too small reduces both \(\rho\) and \(s\); too large increases \(\rho\).

An important empirical observation: random forests do not overfit as \(B \to \infty\). Adding more trees always reduces or maintains the OOB error. This contrasts sharply with single trees, where adding depth monotonically increases overfitting. The intuition is that the forest error converges to the law-of-large-numbers limit \(\rho(1-s^2)/s^2\) from above.

## Gradient Boosting: Convergence and Regularisation

The function-space gradient descent view of boosting (Friedman 2001; Mason et al. 2000) suggests the following picture. Define the functional gradient of the loss:

\[
\mathbf{g}_m = \left.\nabla_{f} \sum_i \ell(y_i, f(\mathbf{x}_i))\right|_{f = f_{m-1}}
\]

Gradient boosting takes a step in the direction \(-\mathbf{g}_m\), projected onto the space of regression trees. The projection is imperfect (trees are not dense in function space), so this is really a **projected gradient descent** in function space. The learning rate \(\nu\) controls step size; small \(\nu\) requires more iterations but produces smoother descent and often better generalisation.

The **stochastic variant** (random subsampling of training cases for each tree) introduces randomness analogous to mini-batching in SGD for neural networks. This has two effects: it reduces computation per tree (each tree sees only a fraction of the data), and it decorrelates consecutive trees (analogous to random forests). In practice, subsampling 50% of the training data per iteration often provides a useful regularisation effect.

The **partial dependence plot** (PDP) is a standard diagnostic for gradient boosting (and any ensemble):

\[
\hat{f}_S(\mathbf{x}_S) = \frac{1}{n} \sum_{i=1}^n \hat{f}(\mathbf{x}_S, \mathbf{x}_{i, \bar{S}})
\]

where \(S\) is a subset of 1–2 features and \(\bar{S}\) is the complement. The PDP marginalises out the other features by averaging over the training distribution. This reveals the marginal effect of \(x_j\) on the prediction, controlling for all other features.

## Neural Network Optimisation

Training a neural network is a non-convex optimisation problem — the loss landscape has many local minima, saddle points, and flat regions. Despite this, modern deep networks trained with SGD-based methods reliably converge to solutions with low generalisation error.

Several factors contribute to good optimisation in practice:

**Momentum**: SGD with momentum maintains a running average of past gradients, which smooths the trajectory through narrow ravines in the loss landscape:

\[
\mathbf{v}_{t+1} = \mu \mathbf{v}_t + \nabla \mathcal{L}_t, \quad W \leftarrow W - \eta \mathbf{v}_{t+1}
\]

**Adam optimiser** (Kingma & Ba 2015): maintains per-parameter adaptive learning rates, using exponentially weighted moving averages of both the gradient and its squared magnitude:

\[
m_t = \beta_1 m_{t-1} + (1-\beta_1)g_t, \quad v_t = \beta_2 v_{t-1} + (1-\beta_2)g_t^2
\]

\[
W \leftarrow W - \frac{\eta}{\sqrt{v_t/(1-\beta_2^t)} + \epsilon} \cdot \frac{m_t}{1-\beta_1^t}
\]

Adam is more robust to poorly scaled gradients and typically requires less tuning of the learning rate than vanilla SGD.

**Learning rate scheduling**: start with a large learning rate for rapid initial progress, then decay it (step decay, cosine annealing, or warm restarts) to converge to a sharper minimum.

**Batch size effects**: large batches reduce gradient noise but often lead to sharper minima that generalise worse (the "sharp minima" phenomenon of Keskar et al. 2017). Mini-batch sizes of 32–256 are typical for classification.

## Transfer Learning and Pre-trained Models

One of the most practically impactful developments in modern classification is **transfer learning**: taking a model pre-trained on a large general dataset and fine-tuning it on a smaller task-specific dataset. The pre-trained model has already learned low-level feature representations (edge detectors, colour blobs for images; subword patterns and syntactic structures for text) that are useful across many downstream tasks.

For image classification, CNNs pre-trained on ImageNet (1.2 million images, 1000 classes — Deng et al. 2009) are routinely fine-tuned for medical imaging, satellite imagery, and other domains, often with only a few thousand labelled examples in the target domain. The standard protocol is to freeze early layers (which capture generic features) and fine-tune later layers (which capture task-specific features), or in extreme data scarcity simply retrain only the final classification head.

For text classification, transformer models pre-trained on large corpora (BERT, RoBERTa, GPT variants) have dramatically shifted the state of the art. Fine-tuning BERT on a classification task typically requires only adding a linear layer on top of the [CLS] token representation and training for 3–5 epochs, achieving performance that vastly exceeds classical bag-of-words approaches on most benchmark datasets.

## Interpretability and Explainability

As machine learning classifiers are deployed in high-stakes settings (medical diagnosis, credit scoring, criminal justice), the ability to explain individual predictions becomes as important as accuracy. Several post-hoc explanation methods apply to any black-box classifier:

**LIME** (Local Interpretable Model-agnostic Explanations, Ribeiro et al. 2016): for a query point \(\mathbf{x}\), generate perturbed neighbours \(\{\mathbf{z}_j\}\), obtain the black-box predictions \(\hat{f}(\mathbf{z}_j)\), and fit a locally weighted linear model to approximate \(\hat{f}\) near \(\mathbf{x}\). The linear model's coefficients explain which features drove the prediction at \(\mathbf{x}\).

**SHAP** (SHapley Additive exPlanations, Lundberg & Lee 2017): assigns each feature \(j\) a Shapley value \(\phi_j\) satisfying the game-theoretic axioms of fairness. The Shapley value for feature \(j\) is its average marginal contribution to the prediction across all possible orderings of features:

\[
\phi_j = \sum_{S \subseteq [p] \setminus \{j\}} \frac{|S|!(p-|S|-1)!}{p!} \left[\hat{f}(S \cup \{j\}) - \hat{f}(S)\right]
\]

SHAP values are additive: \(\hat{f}(\mathbf{x}) = \mathbb{E}[\hat{f}] + \sum_j \phi_j(\mathbf{x})\). For tree ensembles, TreeSHAP (Lundberg et al. 2018) computes exact Shapley values in \(O(TLD^2)\) time where \(T\) is the number of trees, \(L\) is the maximum number of leaves, and \(D\) is the maximum depth.

These tools allow practitioners to audit model behaviour, identify spurious correlations, and build trust with stakeholders — critical steps before deploying any classifier in production.

---

# Reference Summary: Algorithms and Formulae

## Quick-Reference: Key Decision Rules

| Classifier | Decision rule |
|---|---|
| Bayes | \(\arg\max_k P(Y=k\mid\mathbf{x})\) |
| LDA | \(\arg\max_k \mathbf{x}^\top \hat{\Sigma}^{-1}\hat{\boldsymbol{\mu}}_k - \tfrac{1}{2}\hat{\boldsymbol{\mu}}_k^\top\hat{\Sigma}^{-1}\hat{\boldsymbol{\mu}}_k + \log\hat{\pi}_k\) |
| QDA | \(\arg\max_k -\tfrac{1}{2}\log\vert \hat{\Sigma}_k\vert - \tfrac{1}{2}(\mathbf{x}-\hat{\boldsymbol{\mu}}_k)^\top\hat{\Sigma}_k^{-1}(\mathbf{x}-\hat{\boldsymbol{\mu}}_k)+\log\hat{\pi}_k\) |
| Naive Bayes | \(\arg\max_k \log\hat{\pi}_k + \sum_j \log\hat{f}_{kj}(x_j)\) |
| Logistic (binary) | \(\hat{y} = \mathbf{1}[\hat{\sigma}(\boldsymbol{\beta}^\top\tilde{\mathbf{x}}) \geq \tau]\) |
| \(k\)-NN | majority vote in \(\mathcal{N}_k(\mathbf{x})\) |
| SVM | \(\text{sign}(\beta_0 + \sum_i \alpha_i y_i k(\mathbf{x}_i, \mathbf{x}))\) |
| Decision Tree | follow splits to leaf, predict majority class |
| Random Forest | average softmax probabilities across trees |
| AdaBoost | \(\text{sign}(\sum_m \alpha_m G_m(\mathbf{x}))\) |
| Gradient Boost | \(\text{sign}(f_M(\mathbf{x}))\) or \(\text{softmax}(\mathbf{f}_M(\mathbf{x}))\) |

## Quick-Reference: Key Loss Functions

| Name | Formula \(\ell(y, f)\), \(y \in \{-1,+1\}\) | Used by |
|---|---|---|
| 0-1 loss | \(\mathbf{1}[yf \leq 0]\) | Bayes error, evaluation |
| Squared error | \((y-f)^2\) | Regression, gradient boosting |
| Cross-entropy | \(-y\log f - (1-y)\log(1-f)\) | Logistic regression, neural networks |
| Hinge loss | \(\max(0, 1-yf)\) | SVM |
| Exponential loss | \(e^{-yf}\) | AdaBoost |
| Log-loss | \(\log(1+e^{-yf})\) | Logit boost |

## Key Hyperparameters Summary

| Method | Key hyperparameters | Typical tuning range |
|---|---|---|
| \(k\)-NN | \(k\), distance metric | \(k \in \{1,3,5,\ldots,\sqrt{n}\}\) |
| Logistic Reg. | \(\lambda\) (regularisation), penalty type | \(\lambda \in [10^{-4}, 10^2]\) |
| SVM | \(C\), kernel, \(\gamma\) (RBF) | \(C \in [10^{-2}, 10^3]\), \(\gamma \in [10^{-4}, 10^1]\) |
| Decision Tree | max depth, min leaf size, \(\alpha\) (pruning) | depth \(\in \{2,\ldots,20\}\) |
| Random Forest | \(B\), \(m\) (features per split) | \(B \geq 100\), \(m \approx \sqrt{p}\) |
| Gradient Boost | \(M\), \(\nu\), tree depth, subsample rate | \(M \in [50, 2000]\), \(\nu \in [0.01, 0.3]\) |
| Neural Network | hidden units, layers, \(\eta\), dropout, \(\lambda\) | highly problem-dependent |

## Notation Glossary

| Symbol | Meaning |
|---|---|
| \(n\) | number of training observations |
| \(p\) | number of input features |
| \(K\) | number of classes |
| \(\mathbf{x} \in \mathbb{R}^p\) | feature vector |
| \(y \in \{1,\ldots,K\}\) | class label |
| \(\pi_k\) | prior probability of class \(k\) |
| \(\boldsymbol{\mu}_k\) | mean of class \(k\) |
| \(\Sigma\) | common covariance matrix (LDA) |
| \(\Sigma_k\) | class-specific covariance (QDA) |
| \(\boldsymbol{\beta}\) | weight vector (logistic reg., SVM) |
| \(\alpha_i\) | dual variable / support vector coefficient |
| \(k(\mathbf{x},\mathbf{z})\) | kernel function |
| \(R^*\) | Bayes error rate |
| \(\hat{R}(g)\) | empirical risk of classifier \(g\) |
| \(R(g)\) | true risk (expected loss) |
