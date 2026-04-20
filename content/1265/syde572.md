---
title: "SYDE 572: Introduction to Pattern Recognition"
subjects: "SYDE"
---

## Sources and References

- Duda, Hart, and Stork, *Pattern Classification*.
- Bishop, *Pattern Recognition and Machine Learning*.
- Hastie, Tibshirani, and Friedman, *The Elements of Statistical Learning*.
- Fukunaga, *Introduction to Statistical Pattern Recognition*.
- Theodoridis and Koutroumbas, *Pattern Recognition*.
- Vapnik, *Statistical Learning Theory*.
- Murphy, *Machine Learning: A Probabilistic Perspective*.
- MIT and Stanford public machine-learning and pattern-recognition course materials used for topic calibration.

---

## 1. Pattern Recognition as Data Analysis

Pattern recognition is the discipline of assigning category labels, structural descriptions, or continuous values to observed measurements. A classical working definition treats a pattern as a pair \((x, y)\), where \(x \in \mathbb{R}^d\) is a feature vector summarising the sensed data and \(y\) is an output drawn from a finite set of classes \(\mathcal{Y} = \{\omega_1, \dots, \omega_c\}\) or from a continuous response space. The pattern recognition pipeline turns raw sensor data into such a decision through a chain of stages that are conceptually distinct but statistically entangled.

The canonical pipeline has five stages. Sensing captures a physical signal — pixel intensities, microphone pressure, range returns, spectrometer counts — into a digital array. Preprocessing denoises, deskews, normalises, and segments the signal so that each observation corresponds to a single object of interest. Feature extraction projects the segmented signal into a compact, informative vector that should be invariant to nuisance factors (illumination, scale, vocal pitch) while remaining discriminative. Classification (or regression) maps that vector to a label. Post-processing incorporates context, costs, and sequential or relational structure to combine local decisions into coherent interpretations.

<div style="border: 1px solid #888; padding: 0.6em 0.9em; margin: 0.8em 0; background: #f9f9f9;">
<strong>Design principle.</strong> <em>The feature extractor and the classifier are co-designed.</em> A powerful classifier cannot recover information a feature extractor has destroyed, and a linear classifier can be perfectly adequate when features linearise the class structure. Most real engineering effort is spent on features, validation, and data curation rather than on exotic classifiers.
</div>

A central theme in pattern recognition is that the problem is fundamentally statistical. Even when categories are sharply defined in principle (a handwritten character is a "7"), the mapping from physical signal to category is probabilistic because of sensor noise, articulatory variation, occlusion, and overlapping class distributions. We therefore model features as realisations of a random vector \(X\) and labels as a random variable \(Y\), and design decision rules that minimise an expected cost.

## 2. Features, Vectors, and Distances

A feature vector \(x = (x_1, \dots, x_d)^\top\) can be numerical (pixel moments, MFCCs, statistical texture descriptors) or categorical (phoneme identity, gene present/absent), and mixed features are common. Good features are discriminative (class-conditional distributions differ), robust (invariant to irrelevant transformations), compact (low \(d\)), and cheap to compute. The feature space \(\mathbb{R}^d\) inherits a geometry from a chosen distance function, and the implicit choice of distance shapes every downstream classifier.

The Minkowski family of distances is

\[
d_p(x, z) = \Big(\sum_{i=1}^{d} \lvert x_i - z_i \rvert^{p}\Big)^{1/p}.
\]

Setting \(p=2\) gives Euclidean distance, \(p=1\) gives Manhattan (city-block), and \(p \to \infty\) gives the Chebyshev distance \(\max_i \lvert x_i - z_i \rvert\). Euclidean distance is natural when features share units and scale, but is misleading when variances differ or features are correlated.

The Mahalanobis distance corrects for scale and correlation,

\[
d_M(x, z) = \sqrt{(x - z)^\top \Sigma^{-1} (x - z)},
\]

where \(\Sigma\) is the (pooled or class-conditional) covariance matrix. Under a Gaussian model, level sets of Mahalanobis distance are the isoprobability ellipsoids of the distribution; Mahalanobis distance is therefore the "correct" distance whenever the class is approximately Gaussian.

For direction-sensitive features (bag-of-words histograms, deep embeddings), cosine similarity \(\cos(x, z) = x^\top z / (\lVert x \rVert \lVert z \rVert)\) and its induced distance \(1 - \cos(x, z)\) ignore magnitude and reward angular alignment. For discrete symbol strings (DNA, tokenised text), the Levenshtein (edit) distance counts the minimum weighted insertions, deletions, and substitutions; dynamic time warping generalises this to continuous time series with local monotone alignment.

<div style="border: 1px solid #888; padding: 0.6em 0.9em; margin: 0.8em 0; background: #f9f9f9;">
<strong>Curse of dimensionality.</strong> <em>In high \(d\), distances concentrate.</em> For i.i.d. coordinates the ratio of the farthest to the nearest neighbour of a query point tends to one as \(d \to \infty\), which destabilises distance-based classifiers. This motivates feature selection, dimensionality reduction, and learned metrics.
</div>

A summary of the main distances:

<table>
<thead><tr><th>Distance</th><th>Formula</th><th>Best used when</th></tr></thead>
<tbody>
<tr><td>Euclidean</td><td>\(\sqrt{\sum_i (x_i - z_i)^2}\)</td><td>Homogeneous, uncorrelated features</td></tr>
<tr><td>Manhattan</td><td>\(\sum_i \lvert x_i - z_i\rvert\)</td><td>Robust to outliers along axes</td></tr>
<tr><td>Chebyshev</td><td>\(\max_i \lvert x_i - z_i\rvert\)</td><td>Worst-case coordinate deviation</td></tr>
<tr><td>Mahalanobis</td><td>\(\sqrt{(x-z)^\top \Sigma^{-1}(x-z)}\)</td><td>Correlated, scale-heterogeneous features</td></tr>
<tr><td>Cosine</td><td>\(1 - x^\top z /(\lVert x\rVert\lVert z\rVert)\)</td><td>Magnitude is uninformative</td></tr>
<tr><td>Edit</td><td>Min weighted insert/delete/sub</td><td>Discrete symbol sequences</td></tr>
</tbody></table>

## 3. Bayesian Decision Theory

Bayesian decision theory is the reference framework against which all pattern recognition methods are measured. Given class priors \(P(\omega_k)\), class-conditional densities \(p(x \mid \omega_k)\), and a loss function \(\lambda(\alpha_i \mid \omega_k)\) for taking action \(\alpha_i\) when the truth is \(\omega_k\), the posterior is obtained from Bayes' theorem,

\[
P(\omega_k \mid x) = \frac{p(x \mid \omega_k) P(\omega_k)}{\sum_{j} p(x \mid \omega_j) P(\omega_j)}.
\]

The conditional risk of action \(\alpha_i\) at observation \(x\) is \(R(\alpha_i \mid x) = \sum_k \lambda(\alpha_i \mid \omega_k) P(\omega_k \mid x)\), and the Bayes decision rule chooses the action that minimises this risk. The corresponding overall risk \(R = \int R(\alpha(x) \mid x) p(x)\, dx\) is called the Bayes risk; no classifier can do better in expectation.

Under 0/1 loss — \(\lambda(\alpha_i \mid \omega_k) = 0\) if \(i = k\) and \(1\) otherwise — minimising conditional risk is equivalent to maximum a posteriori (MAP) classification,

\[
\hat{y}(x) = \arg\max_k P(\omega_k \mid x) = \arg\max_k p(x \mid \omega_k) P(\omega_k),
\]

and the Bayes risk becomes the Bayes error rate, an irreducible lower bound set by class overlap.

For two classes, the decision boundary is the locus \(\{x : P(\omega_1 \mid x) = P(\omega_2 \mid x)\}\), equivalently the likelihood ratio test

\[
\Lambda(x) = \frac{p(x \mid \omega_1)}{p(x \mid \omega_2)} \;\gtrless\; \frac{P(\omega_2)\,\lambda_{12}}{P(\omega_1)\,\lambda_{21}},
\]

where \(\lambda_{ij}\) is the cost of deciding \(\omega_i\) when \(\omega_j\) is true. Asymmetric losses shift the threshold and are essential in medical screening (false negatives vastly more costly than false positives) and fault detection.

A reject option can be added: if no posterior exceeds a threshold \(1 - \epsilon\), refuse to decide. The Chow rule minimises expected cost when rejection has a fixed cost \(\lambda_r\) and shows that admitting rejection strictly reduces expected risk whenever \(\lambda_r\) is below the 0/1 loss.

## 4. Discriminant Functions and Decision Boundaries

Any classifier can be written as a set of discriminant functions \(g_1(x), \dots, g_c(x)\) with the rule \(\hat{y}(x) = \arg\max_k g_k(x)\). Under MAP, \(g_k(x) = \log p(x \mid \omega_k) + \log P(\omega_k)\). Monotone transformations of the posterior give equivalent discriminants, so the log is chosen for numerical and algebraic convenience.

For Gaussian class-conditionals \(p(x \mid \omega_k) = \mathcal{N}(x \mid \mu_k, \Sigma_k)\),

\[
g_k(x) = -\tfrac{1}{2}(x - \mu_k)^\top \Sigma_k^{-1} (x - \mu_k) - \tfrac{1}{2}\log \lvert \Sigma_k \rvert + \log P(\omega_k).
\]

Three regimes arise. When \(\Sigma_k = \sigma^2 I\), \(g_k\) reduces to a minimum-distance rule in Euclidean space with priors as offsets, and boundaries are perpendicular bisectors of class means. When \(\Sigma_k = \Sigma\) (shared covariance), the quadratic term cancels and \(g_k\) becomes linear in \(x\); this is linear discriminant analysis (LDA) and decision boundaries are hyperplanes. When \(\Sigma_k\) differs, \(g_k\) retains a quadratic form (QDA) and boundaries are quadrics — hyperplanes, ellipsoids, paraboloids, or hyperboloids depending on the relative eigenstructures.

## 5. Parameter Estimation

Real problems rarely come with known \(p(x \mid \omega_k)\). We estimate parameters \(\theta_k\) from a training sample \(\mathcal{D}_k = \{x_1, \dots, x_{n_k}\}\) of examples drawn i.i.d. from class \(\omega_k\).

Maximum likelihood estimation (MLE) picks \(\hat\theta_{\text{MLE}} = \arg\max_\theta p(\mathcal{D} \mid \theta)\). For a Gaussian, \(\hat\mu = \tfrac{1}{n}\sum_i x_i\) and \(\hat\Sigma = \tfrac{1}{n}\sum_i (x_i - \hat\mu)(x_i - \hat\mu)^\top\). MLE is consistent, asymptotically efficient, and invariant under reparameterisation, but can be ill-conditioned when \(n_k < d\) (singular covariance) or badly biased for small samples.

Maximum a posteriori estimation (MAP) adds a prior \(p(\theta)\) and maximises \(p(\theta \mid \mathcal{D}) \propto p(\mathcal{D} \mid \theta) p(\theta)\). Gaussian priors on means act as Tikhonov regularisers; inverse-Wishart priors on covariances give the popular shrinkage estimator \(\hat\Sigma_{\text{sh}} = (1 - \alpha)\hat\Sigma + \alpha T\) for a target \(T\) (often the diagonal of \(\hat\Sigma\) or the identity), which regularises small-sample covariance.

Full Bayesian estimation treats \(\theta\) as a random variable and computes the predictive density

\[
p(x \mid \mathcal{D}) = \int p(x \mid \theta)\, p(\theta \mid \mathcal{D})\, d\theta,
\]

averaging over uncertainty. For conjugate families (Gaussian-Gaussian, Beta-Bernoulli, Dirichlet-multinomial) this integral is closed-form; otherwise Laplace, variational, or Monte Carlo approximations are used. The predictive density gives wider, better calibrated tails than the plug-in \(p(x \mid \hat\theta)\).

<div style="border: 1px solid #888; padding: 0.6em 0.9em; margin: 0.8em 0; background: #f9f9f9;">
<strong>Plug-in versus predictive.</strong> <em>A MAP classifier built on a plug-in density can be overconfident;</em> a Bayesian predictive classifier automatically widens its decision regions in areas of parameter uncertainty, which matters when training sets are small or classes are rare.
</div>

## 6. Non-parametric Density Estimation and Classification

When no parametric family plausibly fits, non-parametric methods estimate \(p(x)\) directly from data. The histogram partitions \(\mathbb{R}^d\) into bins of width \(h\) and counts samples; it is simple but suffers from bin-edge artefacts and scales as \(h^{-d}\).

Kernel (Parzen) windows smooth the histogram by placing a unimodal kernel \(K\) of bandwidth \(h\) at every sample,

\[
\hat p_h(x) = \frac{1}{n h^d} \sum_{i=1}^n K\Big(\frac{x - x_i}{h}\Big).
\]

The Gaussian, Epanechnikov, and uniform kernels are common. Bandwidth \(h\) controls the bias-variance tradeoff: small \(h\) gives a spiky, high-variance estimate; large \(h\) oversmooths. Optimal \(h\) scales as \(n^{-1/(d+4)}\), exposing the curse of dimensionality — adequate density estimation requires exponential sample size in \(d\).

The \(k\)-nearest-neighbour (\(k\)-NN) density estimate inverts the problem: fix \(k\) and let the volume of the smallest ball containing \(k\) neighbours adapt to local density, \(\hat p(x) = k/(n V_k(x))\). The resulting \(k\)-NN classifier simply labels \(x\) with the majority class among its \(k\) nearest neighbours. For \(k=1\) the 1-NN error is bounded by twice the Bayes error as \(n \to \infty\); for larger \(k\) with \(k/n \to 0\) the \(k\)-NN error approaches the Bayes rate. \(k\)-NN is conceptually trivial, requires no training, and adapts to any decision boundary, but it stores the whole training set, is sensitive to irrelevant features and the choice of metric, and degrades rapidly with \(d\).

## 7. Linear Discriminants

Linear discriminants assume \(g_k(x) = w_k^\top x + b_k\) directly, bypassing density estimation.

The perceptron algorithm treats the two-class problem with labels \(y_i \in \{\pm 1\}\) and seeks \((w, b)\) such that \(y_i(w^\top x_i + b) > 0\). The update rule, triggered by any misclassified point \(x_i\), is

\[
w \leftarrow w + \eta\, y_i x_i, \qquad b \leftarrow b + \eta\, y_i,
\]

with learning rate \(\eta > 0\). Novikoff's theorem guarantees convergence in a finite number of updates for linearly separable data, but the perceptron produces no probabilities and its solution depends on initialisation and data order.

Logistic regression models the posterior directly,

\[
P(y=1 \mid x) = \sigma(w^\top x + b), \quad \sigma(z) = \frac{1}{1 + e^{-z}},
\]

and estimates \((w, b)\) by maximising the conditional log-likelihood (equivalently minimising cross-entropy). The loss is convex and is typically optimised with iteratively reweighted least squares or stochastic gradient descent; L2 regularisation produces ridge-logistic, L1 produces sparse features. Logistic regression yields calibrated probabilities and extends naturally to softmax for multiclass.

Fisher's linear discriminant finds the projection \(w\) maximising the ratio of between-class to within-class scatter,

\[
J(w) = \frac{w^\top S_B w}{w^\top S_W w}, \quad S_W = \sum_k \sum_{i \in \omega_k}(x_i - \mu_k)(x_i - \mu_k)^\top, \; S_B = \sum_k n_k (\mu_k - \mu)(\mu_k - \mu)^\top.
\]

The optimum \(w^\star \propto S_W^{-1}(\mu_1 - \mu_2)\) coincides with LDA under equal Gaussian class covariances, tying the generative and discriminative views together.

## 8. Support Vector Machines

The support vector machine (SVM) seeks the maximum-margin separating hyperplane. For linearly separable \(\{(x_i, y_i)\}\) with \(y_i \in \{\pm 1\}\), the primal is

\[
\min_{w, b} \tfrac{1}{2}\lVert w\rVert^2 \quad \text{s.t.} \quad y_i(w^\top x_i + b) \geq 1 \;\forall i.
\]

Maximising \(2/\lVert w\rVert\) maximises the margin. The Karush–Kuhn–Tucker (KKT) conditions show that the solution depends only on support vectors — training points for which the constraint is active — yielding sparse, generalisation-friendly models.

Real data are rarely separable; the soft-margin SVM introduces slacks \(\xi_i \geq 0\) and a penalty \(C\),

\[
\min_{w, b, \xi} \tfrac{1}{2}\lVert w\rVert^2 + C\sum_i \xi_i \quad \text{s.t.} \quad y_i(w^\top x_i + b) \geq 1 - \xi_i.
\]

The dual problem depends on data only through inner products \(x_i^\top x_j\), which the kernel trick replaces with \(K(x_i, x_j) = \phi(x_i)^\top \phi(x_j)\) for an implicit nonlinear feature map \(\phi\). Popular kernels include the polynomial \(K(x, z) = (x^\top z + c)^p\), Gaussian RBF \(K(x, z) = \exp(-\gamma \lVert x - z\rVert^2)\), and sigmoid \(K(x, z) = \tanh(\alpha x^\top z + c)\). Mercer's theorem characterises valid kernels as symmetric positive-semidefinite functions.

The SVM is equivalent to minimising the hinge loss \(\max(0, 1 - y_i f(x_i))\) plus a ridge penalty, connecting it to regularised risk minimisation. Parameters \(C\) and kernel bandwidth \(\gamma\) are chosen by cross-validation.

## 9. Neural Network Classifiers

A multilayer perceptron (MLP) stacks affine-plus-nonlinearity layers,

\[
h^{(\ell)} = \phi(W^{(\ell)} h^{(\ell-1)} + b^{(\ell)}),
\]

with \(h^{(0)} = x\) and a softmax output for classification. The universal approximation theorem guarantees that a single hidden layer with sufficient width can approximate any continuous function arbitrarily well, but depth enables compositional feature learning with exponentially fewer parameters for many natural functions.

Training minimises cross-entropy by stochastic gradient descent with backpropagation, which computes all parameter gradients in one forward-backward sweep. Practical success depends on weight initialisation (He, Xavier), non-saturating activations (ReLU, GELU), normalisation (batch, layer), and regularisation (weight decay, dropout, data augmentation, early stopping).

Convolutional neural networks (CNNs) specialise MLPs for grid-structured inputs by imposing local receptive fields, shared weights, and pooling-based translation equivariance, dramatically reducing parameters and boosting sample efficiency on images. Modern CNNs (ResNet, EfficientNet) and transformer-based vision and sequence models dominate practical OCR, speech, and vision recognition, but their training cost, data demands, and opacity make them the heavy end of the toolbox rather than a universal default.

## 10. Decision Trees and Ensembles

A decision tree recursively splits the feature space by axis-aligned tests \(x_j \leq t\), producing a piecewise-constant classifier that is easy to interpret. CART and C4.5 grow trees by greedily choosing splits that maximise impurity reduction, typically measured by Gini impurity \(G = \sum_k p_k(1 - p_k)\) or entropy \(H = -\sum_k p_k \log p_k\), and then prune with cost-complexity criteria to control variance.

Trees are high-variance learners; ensembles tame them. Bagging fits trees to bootstrap samples and averages predictions. Random forests additionally sample a random subset of features at each split, decorrelating the ensemble and improving generalisation. Out-of-bag predictions give near-free cross-validated error estimates, and permutation importance ranks features.

Boosting builds additive ensembles greedily, each new learner focusing on the residual errors. AdaBoost reweights misclassified examples; gradient boosting (XGBoost, LightGBM, CatBoost) fits each weak learner to the negative gradient of a chosen loss. Gradient-boosted trees are the default high-accuracy method for tabular pattern recognition.

## 11. Clustering

Clustering is unsupervised pattern recognition: discover groups in unlabelled data. The problem is only well-defined once a notion of cluster — compact, density-based, hierarchical, model-based — is chosen.

K-means partitions \(\{x_i\}\) into \(K\) clusters \(\{C_k\}\) with centroids \(\{\mu_k\}\) minimising

\[
J(\{\mu_k\}, \{C_k\}) = \sum_{k=1}^{K} \sum_{x_i \in C_k} \lVert x_i - \mu_k \rVert^2.
\]

Lloyd's algorithm alternates assignment (each \(x_i\) to its nearest centroid) and update (each \(\mu_k\) to the mean of its members). It converges to a local minimum that depends on initialisation; k-means++ seeds centroids proportional to squared distance from existing ones and gives an expected \(O(\log K)\) approximation.

Gaussian mixture models (GMMs) generalise k-means to a probabilistic setting, \(p(x) = \sum_k \pi_k \mathcal{N}(x \mid \mu_k, \Sigma_k)\), and are fit by the expectation-maximisation (EM) algorithm. E-step computes responsibilities \(\gamma_{ik} = \pi_k \mathcal{N}(x_i \mid \mu_k, \Sigma_k) / p(x_i)\); M-step updates \((\pi_k, \mu_k, \Sigma_k)\) as responsibility-weighted statistics. EM monotonically increases the likelihood but can trap in local optima, and the number of components must be selected by BIC, AIC, or cross-validation.

Hierarchical clustering builds a dendrogram either agglomeratively (merge nearest clusters) or divisively (split farthest). Linkage criteria — single, complete, average, Ward — produce qualitatively different trees and cut at any level to yield a partition. DBSCAN defines clusters as density-connected regions and labels the rest as noise; it finds clusters of arbitrary shape without pre-specifying \(K\) but requires a neighbourhood radius \(\varepsilon\) and minimum density \(m_{\min}\).

## 12. Feature Extraction and Dimensionality Reduction

Principal component analysis (PCA) finds an orthonormal basis \(\{u_j\}\) of directions of maximum variance. The first principal component solves \(u_1 = \arg\max_{\lVert u\rVert = 1} u^\top \Sigma u\) and equals the eigenvector of \(\Sigma\) with largest eigenvalue; subsequent components are orthogonal eigenvectors. Projecting \(x\) onto the top \(m\) eigenvectors yields a best rank-\(m\) linear reconstruction in squared-error sense. PCA is unsupervised: it maximises reconstruction, not class separation, and can discard the very directions that carry label information.

Linear discriminant analysis (LDA) as a dimensionality reduction solves the Fisher problem in its multiclass form. The leading generalised eigenvectors of \(S_W^{-1} S_B\) form a subspace of dimension at most \(c - 1\) that maximises between/within-class scatter and is explicitly supervised.

Independent component analysis (ICA) recovers latent non-Gaussian sources that were linearly mixed; it is essential in blind source separation (EEG, audio). Manifold learning methods — Isomap, LLE, Laplacian eigenmaps, t-SNE, UMAP — assume data lie on a low-dimensional nonlinear manifold and preserve local geometry when embedding into low dimensions, useful for visualisation and as preprocessing for classifiers.

Feature selection differs from extraction: it keeps a subset of the original features. Filter methods score features individually (mutual information, ANOVA F, correlation) and are fast but ignore interactions. Wrapper methods (forward, backward, stepwise selection; recursive feature elimination) evaluate subsets by cross-validated classifier performance and capture interactions at quadratic cost. Embedded methods integrate selection with learning — L1-penalised models (lasso, L1-logistic), tree-based impurity importances, and elastic net — and give the best balance of accuracy and cost in practice.

## 13. Performance Evaluation

A classifier is judged by how well it generalises, not by how well it fits. The confusion matrix tabulates true against predicted labels; from it derive accuracy, per-class precision \(\mathrm{TP}/(\mathrm{TP}+\mathrm{FP})\), recall \(\mathrm{TP}/(\mathrm{TP}+\mathrm{FN})\), specificity, and \(F_1 = 2\,PR/(P+R)\). Balanced accuracy and Matthews correlation coefficient are robust to class imbalance, which otherwise inflates raw accuracy.

For binary scorers, varying the decision threshold traces the receiver operating characteristic (ROC) curve — true positive rate against false positive rate — whose area under the curve (AUC) equals the probability that a random positive scores above a random negative. Precision–recall curves are preferred under severe class imbalance.

Generalisation is estimated by cross-validation. \(k\)-fold CV partitions the data into \(k\) equal folds, trains on \(k-1\), tests on the held-out fold, and averages. Stratification preserves class proportions; leave-one-out is unbiased but high-variance; repeated k-fold reduces variance; nested CV separates hyperparameter selection from performance estimation.

The expected squared error of a regression estimator decomposes as

\[
\mathbb{E}[(y - \hat f(x))^2] = \underbrace{(\mathbb{E}[\hat f(x)] - f(x))^2}_{\text{bias}^2} + \underbrace{\mathrm{Var}[\hat f(x)]}_{\text{variance}} + \sigma^2,
\]

with \(\sigma^2\) the irreducible noise. Simple models (LDA, linear SVM) are biased but low variance; flexible models (deep nets, k-NN with small \(k\)) are low-bias but high-variance. Regularisation, ensembling, and data augmentation shift this trade-off favourably.

<div style="border: 1px solid #888; padding: 0.6em 0.9em; margin: 0.8em 0; background: #f9f9f9;">
<strong>Evaluation discipline.</strong> <em>Never tune on the test set.</em> Split train/validation/test before any exploration. Report confidence intervals from repeated CV or bootstrap. For time series use forward-chaining (walk-forward) CV to respect causality.
</div>

## 14. Applications

Optical character recognition (OCR) was historically the birthplace of feature engineering: zoning, moment invariants, and skeleton topology fed into LDA, nearest neighbour, and early MLPs for postal address reading. Modern OCR pipelines use CNN or transformer encoders over rectified text lines with connectionist temporal classification or attention decoders, and they illustrate all pipeline stages — segmentation, feature learning, sequence decoding, and language-model post-processing.

Automatic speech recognition extracts short-time spectral features (mel-frequency cepstral coefficients, mel filterbanks) from overlapping frames, handles variable duration by hidden Markov models or attention-based encoder-decoders, and integrates acoustic, pronunciation, and language models in decoding. The pattern recognition problem sits inside a temporal statistical model and exemplifies post-processing via beam search with language-model rescoring.

Industrial robot vision uses range cameras, structured light, and stereo to build feature vectors of edges, blobs, and shape descriptors for part localisation, bin picking, and defect detection. Calibration, lighting invariance, and real-time throughput dominate the engineering constraints; nearest-neighbour and random-forest classifiers remain popular for their predictable latency.

Medical diagnosis combines heterogeneous features — imaging biomarkers, laboratory values, genomic profiles — with highly asymmetric misclassification costs. Bayesian decision theory with explicit loss matrices, calibration curves, and decision-curve analysis is more appropriate than raw accuracy. Model interpretability, robustness across sites, and regulatory validation are first-class concerns.

Remote sensing and satellite image analysis classify multi- and hyperspectral pixels into land-cover categories. Mahalanobis-based Gaussian classifiers, spectral angle mappers (a cosine distance on radiance spectra), support vector machines with RBF kernels, and CNNs on image patches each have a role. Spatial context is exploited by Markov random fields and segmentation-based post-processing.

Fault detection and diagnosis in complex systems — power grids, chemical plants, rotating machinery — frame the problem as novelty or one-class classification when faults are rare. PCA-based \(T^2\) and \(Q\) statistics, one-class SVMs, isolation forests, and autoencoder reconstruction errors flag anomalies; classification of fault types then uses labelled faulty episodes, often with strong class imbalance and concept drift over a machine's lifecycle.

## 15. A Unifying View

Across all of these methods the same core ideas recur. Every classifier is, explicitly or implicitly, estimating a posterior and acting through a loss; the differences lie in what is parameterised (the density, the posterior, or the decision boundary) and how regularisation controls capacity. Features and metrics determine what the learner can represent; estimation theory determines how reliably parameters are identified from data; decision theory determines how those parameters are used under uncertainty; evaluation determines what we believe about performance.

A disciplined pattern recognition engineer treats the pipeline as an iterative loop: pose the problem probabilistically, engineer or learn features, pick a family of classifiers matched to the signal and the data budget, regularise to the sample size, evaluate with honest cross-validation, and revisit features when performance saturates. The ceiling is not a particular algorithm but the Bayes error set by the features; lifting that ceiling is where pattern recognition becomes genuinely creative work.
