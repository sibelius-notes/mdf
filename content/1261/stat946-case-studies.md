---
title: "STAT 946: Case Studies in Data Science"
prof: "Martin Lysy"
subjects: "STAT"
---

## Sources and References
**Primary textbooks** — Hastie, Tibshirani & Friedman, *The Elements of Statistical Learning*, 2nd ed. (Springer, 2009); McCullagh, *Ten Projects in Applied Statistics* (Springer, 2023)
**Supplementary texts** — Timbers, Campbell & Lee, *Data Science: A First Introduction* (2022); Hoffman, *Scientific Writing and Communication* (Oxford, 2019)
**Online resources** — datasciencebook.ca; MIT 6.S191 (Introduction to Deep Learning); Stanford CS229 (Machine Learning, Andrew Ng); tidymodels.org; scikit-learn documentation

---

# Chapter 1: The Data Science Case Study Framework

## 1.1 What Is a Case Study?

The distinction between a textbook exercise and a real-world data science case study is profound and shapes every methodological decision a practitioner makes. In a textbook exercise, the problem is already formulated: a dataset arrives with a declared response variable, a known set of predictors, and often a hint about which model family to apply. The data are typically clean, balanced, and drawn from a well-understood generative process. The student's task is to apply a specified method and interpret the output.

A case study, by contrast, begins with a messy reality. The analyst receives a collection of files — sometimes a tidy CSV, more often a heterogeneous tangle of spreadsheets, database exports, text fields, and timestamps — along with a vague mandate from a domain collaborator: "We want to understand what drives patient readmission," or "Can you tell us whether the new algorithm performs better?" The response variable is not obvious. The predictors may include hundreds of candidates, many correlated, some measured with error, others missing in structured or unstructured ways. The correct estimand — the precise quantity the analysis is meant to estimate — must be negotiated between the statistician and the domain expert, and that negotiation is itself a non-trivial intellectual act.

This ambiguity is not a defect of case studies; it is their defining feature and their primary pedagogical value. Learning to navigate ambiguity — to transform a fuzzy scientific question into a precise statistical problem, to choose among multiple defensible modeling strategies, and to communicate honest uncertainty — is the core skill that STAT 946 develops. McCullagh's *Ten Projects in Applied Statistics* is exemplary in this regard: each project begins with a substantive scientific question, and the statistical machinery emerges organically from the demands of that question rather than being imposed from the outside.

<div class="remark">
<strong>Messiness as a feature, not a bug.</strong> Professional statisticians spend a large fraction of their working time on tasks that are invisible in textbooks: tracking down the codebook for a legacy dataset, discovering that two tables join on different identifier systems, realizing that "missing" in one column means "not applicable" in one cohort and "not measured" in another. Developing tolerance for this kind of ambiguity, and systematic strategies for resolving it, is one of the primary objectives of this course.
</div>

A further hallmark of genuine case studies is that they admit multiple valid answers. Two competent analysts given the same dataset and the same scientific question may produce analyses that differ in model family, variable selection strategy, and uncertainty quantification — and both may be defensible. This is not a sign of statistical failure but of scientific maturity: the analyst who acknowledges the multiplicity of valid approaches and reports sensitivity to those choices is doing better science than the analyst who presents a single model as if it were the uniquely correct one.

## 1.2 The Case Study Lifecycle

The lifecycle of a data science case study is best understood as a cycle rather than a pipeline. The stages do not flow linearly from problem formulation to final report; rather, findings at any stage regularly prompt revisions to earlier stages. With that caveat, it is useful to identify the canonical stages and their relationships.

**Problem formulation** is the process of translating a vague scientific mandate into a precise statistical question. This involves identifying the estimand (the quantity to be estimated), the relevant population, the available data, and the assumptions required to connect the data to the estimand. Poor problem formulation is the most common source of failed data science projects; an analysis that answers a precisely stated but wrong question is worse than no analysis at all.

**Exploratory data analysis (EDA)** is the process of developing an understanding of the dataset's structure before committing to a formal model. This includes univariate summaries, bivariate relationships, identification of outliers and anomalies, assessment of missingness patterns, and visualization. EDA is hypothesis-generating, not hypothesis-confirming; it should influence the choice of methods but should not be used to select among competing hypotheses in a way that inflates false discovery rates.

**Model selection and fitting** is the process of choosing a statistical model or family of models, estimating parameters from the data, and selecting among competing specifications. This stage is informed by both the scientific question (which determines what the model must represent) and the exploratory analysis (which reveals the data's structure and suggests which model families are appropriate).

**Validation** is the process of assessing whether the fitted model is adequate for its intended purpose. This includes checking model assumptions, assessing predictive performance on held-out data, and performing sensitivity analyses to assumptions that cannot be verified from the data.

**Communication** is the process of reporting findings to stakeholders, which may include domain experts, policymakers, the scientific community, or the general public. Effective communication requires adapting the level of technical detail to the audience, presenting uncertainty honestly, and acknowledging limitations without undermining confidence in the analysis.

**Iteration** acknowledges that findings at any stage may prompt revisions to earlier stages. A model validation step that reveals poor calibration may prompt the analyst to return to the problem formulation stage and reconsider the estimand. A communication exercise with domain experts may reveal that the response variable was operationalized incorrectly. This iterative nature is a strength of the case study approach, not a weakness.

## 1.3 Statistical Learning Fundamentals Review

Statistical learning encompasses the methods by which a model is fit to data in order to make predictions or draw inferences. The field is organized around a fundamental dichotomy between supervised and unsupervised learning, with semi-supervised and self-supervised learning occupying an increasingly important middle ground.

In **supervised learning**, each observation in the training set consists of an input vector \( \mathbf{x}_i \in \mathbb{R}^p \) paired with a response \( y_i \). The goal is to learn a function \( f : \mathbb{R}^p \to \mathcal{Y} \) that generalizes well to new observations. When \( y_i \in \mathbb{R} \), the problem is regression; when \( y_i \) takes values in a finite set, the problem is classification.

In **unsupervised learning**, only the inputs \( \mathbf{x}_1, \ldots, \mathbf{x}_n \) are observed. The goal is to learn something about the distribution \( P(\mathbf{X}) \) — its cluster structure, its low-dimensional manifold, its density — without the guidance of a response variable.

The **bias-variance decomposition** is the central theoretical tool for understanding the generalization properties of a supervised learning method. For a squared-error loss regression problem, the expected prediction error at a new point \( \mathbf{x}_0 \) decomposes as:

\[
\mathbb{E}\left[ \left(Y_0 - \hat{f}(\mathbf{x}_0)\right)^2 \right] = \sigma^2 + \left[\text{Bias}(\hat{f}(\mathbf{x}_0))\right]^2 + \text{Var}(\hat{f}(\mathbf{x}_0))
\]

where \( \sigma^2 \) is the irreducible noise variance, \( \text{Bias}(\hat{f}(\mathbf{x}_0)) = \mathbb{E}[\hat{f}(\mathbf{x}_0)] - f(\mathbf{x}_0) \) measures systematic error, and \( \text{Var}(\hat{f}(\mathbf{x}_0)) \) measures sensitivity to the particular training sample. Complex models (many parameters, high flexibility) tend to have low bias but high variance; simple models tend to have high bias but low variance. This **bias-variance tradeoff** motivates regularization, cross-validation, and ensemble methods.

<div class="definition">
<strong>Training, Validation, and Test Sets.</strong> The <em>training set</em> is the data used to fit model parameters. The <em>validation set</em> is the data used to select among competing models or to tune hyperparameters. The <em>test set</em> is the data held out until the very end to provide an unbiased estimate of the selected model's generalization error. Contaminating the test set — using it to make any modeling decision — invalidates it as an honest performance estimate. This principle is violated more often in practice than is commonly acknowledged.
</div>

**Cross-validation** is the workhorse method for estimating generalization error when the dataset is too small to afford a dedicated validation set. In \( k \)-fold cross-validation, the training data are divided into \( k \) folds of approximately equal size. The model is trained on \( k - 1 \) folds and evaluated on the held-out fold, and this process is repeated \( k \) times. The cross-validation estimate of the generalization error is the average of the \( k \) held-out errors. The choice \( k = 5 \) or \( k = 10 \) is conventional; leave-one-out cross-validation (\( k = n \)) is asymptotically unbiased but has high variance and is computationally expensive.

Model selection criteria based on penalized likelihood offer an alternative to cross-validation. The **Akaike Information Criterion** is:

\[
\text{AIC} = -2 \log \hat{L} + 2p
\]

where \( \hat{L} \) is the maximized likelihood and \( p \) is the number of parameters. The **Bayesian Information Criterion** replaces the penalty \( 2p \) with \( p \log n \), which penalizes model complexity more heavily when the sample size is large. AIC targets prediction accuracy; BIC targets model identification consistency (selecting the true model as \( n \to \infty \), under certain conditions). Neither criterion is uniformly superior; the choice depends on the analysis goal.

## 1.4 The Role of Domain Knowledge

Perhaps the most important lesson of applied statistics is that data analysis without domain knowledge is dangerous. A model fit in ignorance of the data-generating process may produce results that are statistically impeccable and scientifically meaningless — or worse, actively misleading.

Domain knowledge enters the analysis at every stage. At the problem formulation stage, it determines which scientific questions are meaningful and which response variables are correctly operationalized. At the exploratory analysis stage, it explains anomalies that would otherwise be treated as noise: a spike in hospital admissions on Monday mornings is an artifact of weekend data batching, not a genuine clinical phenomenon. At the modeling stage, it motivates structural constraints that a data-driven procedure would never discover: the relationship between drug dosage and response is non-decreasing (monotone constraints), the effect of a treatment cannot precede its administration (temporal ordering), an economic elasticity must be negative (sign constraints).

<div class="remark">
<strong>The danger of "fitting the data."</strong> A sufficiently flexible model will always fit the training data well. The question is whether the fitted model captures the true structure of the data-generating process or whether it has learned the noise. Domain knowledge provides the guard against the latter: if a fitted model assigns large importance to a predictor that has no plausible causal pathway to the response, the domain expert's skepticism should prompt the analyst to investigate further.
</div>

The relationship between the statistician and the domain expert is collaborative and requires mutual respect. The statistician brings methodological rigor and awareness of the pitfalls of data analysis; the domain expert brings knowledge of what the data actually measure, what the scientific question actually requires, and what a defensible answer actually looks like in context. Neither partner can succeed without the other, and one of the communication skills that STAT 946 develops is the ability to engage productively with domain collaborators at various levels of statistical sophistication.

---

# Chapter 2: Problem Formulation

## 2.1 Translating Scientific Questions to Statistical Problems

The translation from a scientific question to a statistical problem is one of the most consequential steps in any data science project, and it is one that is routinely undervalued. A poorly chosen estimand — even if estimated with great precision — produces an answer to a question that no one asked.

The process of operationalization involves making a series of choices: which outcome variable to measure, on what population, at what time horizon, and under what intervention or comparison. Each choice reflects a scientific judgment that should be made explicitly and reported transparently. Consider the question "Does exercise reduce mortality?" This question is ambiguous in multiple dimensions: which type of exercise, at what intensity and duration, in which population, over what follow-up period, relative to what comparison condition (sedentary behavior, or some baseline activity level)? An analysis that answers one operationalization of this question may not generalize to another.

<div class="definition">
<strong>Estimand.</strong> The <em>estimand</em> is the precise quantity that the analysis intends to estimate. It should be defined before data analysis begins and should be distinguished from the <em>estimator</em> (the procedure used to estimate it) and the <em>estimate</em> (the value of the estimator applied to the data). The estimand definition includes the target population, the outcome variable, the comparison (for causal questions), and any conditioning events.
</div>

A useful taxonomy distinguishes three broad types of statistical estimands. **Prediction estimands** ask: given the covariates of a new observation, what value of the response do we expect? **Inference estimands** ask: what is the effect of a specific intervention or factor on the response, averaged over a specified population? **Discovery estimands** ask: what structure exists in the data — which clusters, which factors, which anomalies — that we did not know to look for in advance?

Each type of estimand calls for a different analysis strategy, a different validation approach, and a different communication style. Confusing these types is a common source of errors in data science: a model built for prediction is deployed for inference (yielding biased effect estimates), or a model built for inference is evaluated on predictive accuracy (yielding a misleading performance picture).

## 2.2 Exploratory Data Analysis as Hypothesis Generation

Exploratory data analysis is the systematic examination of a dataset prior to formal statistical modeling. Its purpose is to develop intuition about the data's structure, identify anomalies that require investigation, and generate hypotheses that will guide the subsequent analysis. Critically, EDA should be treated as hypothesis-generating rather than hypothesis-confirming: patterns identified in EDA should not be reported as confirmatory findings without accounting for the multiple comparisons implicit in having looked at the data.

Univariate summaries — means, medians, standard deviations, percentiles, histograms, kernel density estimates — provide an initial picture of each variable's distribution. Of particular importance is the shape of the distribution: heavy tails suggest the need for robust methods or transformations; discrete clusters suggest possible mixture structure; boundary effects near zero or one suggest that a beta or Dirichlet distribution may be more appropriate than a Gaussian.

Bivariate summaries — scatterplots, correlation matrices, side-by-side boxplots, mosaic plots — reveal pairwise relationships. Correlation matrices are useful for identifying multicollinearity among predictors, but they capture only linear relationships; it is equally important to examine scatterplots for non-linear patterns and heteroscedasticity.

For high-dimensional data, where the number of predictors \( p \) is large, pairwise summaries become impractical, and dimensionality reduction methods are essential for visualization. **Principal component analysis (PCA)** projects the data onto the subspace spanned by the leading eigenvectors of the sample covariance matrix. A **biplot** overlays the projection of the observations and the projection of the original variables onto the first two principal components, revealing both cluster structure in the observations and correlational structure among the variables.

PCA is a linear method and may miss non-linear structure in the data. **t-distributed Stochastic Neighbor Embedding (t-SNE)** and **Uniform Manifold Approximation and Projection (UMAP)** are non-linear dimensionality reduction methods that are widely used for visualization of high-dimensional data, particularly in genomics and single-cell biology. Both methods define a similarity structure in the high-dimensional space (based on pairwise distances) and optimize a low-dimensional embedding that preserves that similarity structure. t-SNE is particularly effective at revealing local cluster structure; UMAP tends to better preserve global structure and is substantially faster on large datasets.

<div class="remark">
<strong>Interpreting t-SNE and UMAP plots.</strong> The axes of a t-SNE or UMAP plot have no intrinsic meaning; distances between clusters in the embedding space should not be interpreted as distances in the original high-dimensional space. The cluster sizes and shapes in these plots are also affected by hyperparameters (perplexity in t-SNE, number of neighbors in UMAP). These methods are best used as qualitative exploration tools, not as the basis for formal statistical inference.
</div>

## 2.3 The Estimand Framework

The estimand framework, developed largely in the context of clinical trials and causal inference, provides a rigorous structure for problem formulation in any data science context. The framework distinguishes three components: the target of estimation, the assumptions required to identify it from the observed data, and the estimation strategy.

The **target parameter** is the quantity of scientific interest, defined in terms of a hypothetical data-generating process. For a causal question, the target parameter is typically a contrast of potential outcomes: the average treatment effect \( \tau = \mathbb{E}\left[Y^{(1)} - Y^{(0)}\right] \), where \( Y^{(a)} \) is the outcome that would be observed if the treatment were set to \( a \). For a prediction question, the target parameter might be the conditional expectation \( f(\mathbf{x}) = \mathbb{E}[Y \mid \mathbf{X} = \mathbf{x}] \) for a specified distribution of \( \mathbf{x} \).

The **identification strategy** specifies the assumptions under which the target parameter can be expressed as a function of the observed data distribution. For the average treatment effect in an observational study, the key identification assumption is that treatment assignment is unconfounded conditional on the observed covariates: \( Y^{(a)} \perp\!\!\!\perp A \mid \mathbf{X} \) for \( a \in \{0, 1\} \). This is the conditional ignorability or no unmeasured confounding assumption, and it cannot be verified from the data.

The **estimation strategy** is the method used to estimate the target parameter from the data, given the identification assumptions. Different estimation strategies may have different finite-sample properties, robustness to model misspecification, and computational requirements. Doubly robust estimators, for example, are consistent if either the outcome model or the propensity score model is correctly specified — providing a degree of protection against model misspecification.

## 2.4 Confounding and Selection Bias in Observational Data

The majority of real-world data science case studies involve observational data — data generated by a process that the analyst did not control. In observational data, the distinction between correlation and causation is not merely a philosophical nicety but a practical necessity: confounded associations can lead to interventions that are ineffective or harmful.

A **confounder** is a variable that influences both the treatment (or exposure of interest) and the outcome, creating a spurious association between them. In a study of the effect of coffee consumption on cardiovascular disease, smoking is a confounder if smokers are more likely to drink coffee and smoking independently causes cardiovascular disease. Failing to adjust for smoking will produce a biased estimate of the coffee effect.

**Directed acyclic graphs (DAGs)** provide a graphical language for encoding causal assumptions about the data-generating process. In a DAG, nodes represent variables and directed edges represent direct causal relationships. A path between two variables is **blocked** by a collider (a node with two arrowheads pointing into it) unless we condition on the collider, in which case the path is opened. This **d-separation** criterion determines which pairs of variables are independent given any set of conditioning variables.

<div class="definition">
<strong>Backdoor Criterion.</strong> A set of variables <strong>Z</strong> satisfies the backdoor criterion relative to an ordered pair of variables <em>(X, Y)</em> in a DAG if: (i) no node in <strong>Z</strong> is a descendant of <em>X</em>, and (ii) <strong>Z</strong> blocks every path between <em>X</em> and <em>Y</em> that has an arrow into <em>X</em>. If <strong>Z</strong> satisfies the backdoor criterion, then adjusting for <strong>Z</strong> identifies the causal effect of <em>X</em> on <em>Y</em>.
</div>

**Selection bias** arises when the sample is not representative of the target population. In a study of hospital outcomes, patients who are hospitalized are a selected subset of the population — those who are sick enough to require hospitalization. Estimates of treatment effects in this selected sample may not generalize to the broader population. Selection bias is particularly insidious because it can arise from conditioning on a collider: if hospitalization is a common effect of both the exposure and a confounding variable, conditioning on hospitalization (by studying only hospitalized patients) opens a path between the exposure and the confounder, creating a spurious association.

---

# Chapter 3: Statistical and Machine Learning Methods for Case Studies

## 3.1 Regularized Regression

Ordinary least squares (OLS) estimation minimizes the residual sum of squares:

\[
\hat{\boldsymbol{\beta}}_{\text{OLS}} = \arg\min_{\boldsymbol{\beta}} \sum_{i=1}^n \left(y_i - \mathbf{x}_i^\top \boldsymbol{\beta}\right)^2
\]

When the number of predictors \( p \) is large relative to the sample size \( n \), OLS estimates are highly variable (high variance component of the prediction error), and when \( p > n \) the system is underdetermined. Regularization addresses this by adding a penalty term to the objective function that discourages large coefficient values.

**Ridge regression** adds an \( L_2 \) penalty:

\[
\hat{\boldsymbol{\beta}}_{\text{ridge}} = \arg\min_{\boldsymbol{\beta}} \left\{ \sum_{i=1}^n \left(y_i - \mathbf{x}_i^\top \boldsymbol{\beta}\right)^2 + \lambda \sum_{j=1}^p \beta_j^2 \right\}
\]

This has a closed-form solution: \( \hat{\boldsymbol{\beta}}_{\text{ridge}} = (\mathbf{X}^\top \mathbf{X} + \lambda \mathbf{I})^{-1} \mathbf{X}^\top \mathbf{y} \). The addition of \( \lambda \mathbf{I} \) to \( \mathbf{X}^\top \mathbf{X} \) ensures the matrix is invertible regardless of the rank of \( \mathbf{X} \). As \( \lambda \to 0 \), ridge regression approaches OLS; as \( \lambda \to \infty \), all coefficients shrink toward zero. Ridge regression performs **shrinkage** but not variable selection: all predictors remain in the model with non-zero coefficients.

**LASSO** (Least Absolute Shrinkage and Selection Operator) replaces the \( L_2 \) penalty with an \( L_1 \) penalty:

\[
\hat{\boldsymbol{\beta}}_{\text{lasso}} = \arg\min_{\boldsymbol{\beta}} \left\{ \sum_{i=1}^n \left(y_i - \mathbf{x}_i^\top \boldsymbol{\beta}\right)^2 + \lambda \sum_{j=1}^p \left|\beta_j\right| \right\}
\]

The \( L_1 \) penalty is not differentiable at zero, and this geometric property is responsible for LASSO's most important feature: for sufficiently large \( \lambda \), some coefficients are set exactly to zero. LASSO therefore performs simultaneous shrinkage and **variable selection**, producing a sparse model. The LASSO does not have a closed-form solution but can be efficiently computed via coordinate descent, cycling through each predictor and applying the soft-thresholding operator:

\[
\hat{\beta}_j \leftarrow \text{sign}(r_j) \cdot \max\left(|r_j| - \lambda, 0\right)
\]

where \( r_j \) is the partial residual for predictor \( j \) after removing the contributions of all other predictors.

The **elastic net** combines \( L_1 \) and \( L_2 \) penalties:

\[
\hat{\boldsymbol{\beta}}_{\text{enet}} = \arg\min_{\boldsymbol{\beta}} \left\{ \sum_{i=1}^n \left(y_i - \mathbf{x}_i^\top \boldsymbol{\beta}\right)^2 + \lambda_1 \sum_{j=1}^p |\beta_j| + \lambda_2 \sum_{j=1}^p \beta_j^2 \right\}
\]

This combines the sparsity of LASSO with the grouping property of ridge regression (which tends to give similar coefficients to correlated predictors). The elastic net is particularly useful when predictors are highly correlated and LASSO's tendency to select one predictor from each correlated group is undesirable.

The regularization parameter \( \lambda \) is typically selected by cross-validation, minimizing the cross-validated prediction error. In practice, a solution path is computed over a grid of \( \lambda \) values using warm starts, and the cross-validated error is plotted against \( \log \lambda \) to facilitate selection.

## 3.2 Tree-Based Methods

Decision trees partition the predictor space into non-overlapping rectangles and fit a constant within each rectangle. The **CART** (Classification and Regression Trees) algorithm builds trees by recursive binary splitting: at each node, it selects the predictor and split point that minimize the within-node impurity (Gini index for classification, residual sum of squares for regression). Trees are grown large and then pruned back using a complexity parameter that penalizes the number of leaves, selected by cross-validation.

Individual trees have high variance: small perturbations to the training data can produce very different tree structures. **Bootstrap aggregation (bagging)** reduces this variance by averaging predictions from many trees, each fit on a bootstrap sample of the training data. A **random forest** extends bagging by also randomly subsampling a subset of \( m \) predictors at each split (typically \( m \approx \sqrt{p} \) for classification, \( m \approx p/3 \) for regression). This decorrelates the trees and further reduces variance.

<div class="theorem">
<strong>Out-of-Bag Error Estimation.</strong> Because each tree in a random forest is fit on a bootstrap sample, approximately one-third of the training observations are not used to fit any given tree — these are the <em>out-of-bag</em> (OOB) observations for that tree. The OOB error is computed by predicting each training observation using only the trees for which it was OOB. The OOB error is a nearly unbiased estimate of the generalization error and requires no separate cross-validation.
</div>

**Gradient boosted trees** take a fundamentally different approach: instead of building many independent trees in parallel, they build trees sequentially, each one fitting the residuals of the previous ensemble. At iteration \( m \), a new tree \( h_m \) is fit to the negative gradient of the loss function evaluated at the current predictions:

\[
\hat{F}_m(\mathbf{x}) = \hat{F}_{m-1}(\mathbf{x}) + \nu \cdot h_m(\mathbf{x})
\]

where \( \nu \in (0,1] \) is the learning rate (shrinkage). The key hyperparameters are the number of trees \( M \), the learning rate \( \nu \), the maximum tree depth (or number of leaves), and regularization terms. **XGBoost** and **LightGBM** are highly optimized implementations that have become the dominant methods for tabular data in machine learning competitions and industrial applications.

<div class="example">
<strong>Hyperparameter tuning for gradient boosted trees.</strong> A common tuning strategy is to fix the learning rate at a small value (e.g., 0.05 or 0.01) and use early stopping to select the number of trees: the model is trained on a portion of the data, and training stops when the validation error ceases to decrease. The remaining hyperparameters (max depth, min child weight, subsample fraction) are then tuned by grid search or random search over a moderate grid. Bayesian optimization (e.g., using the <em>mlr3mbo</em> or <em>optuna</em> packages) offers a more principled alternative for expensive tuning problems.
</div>

## 3.3 Neural Networks and Deep Learning

A **feedforward neural network** is a parametric function \( f_\theta : \mathbb{R}^p \to \mathcal{Y} \) constructed by composing affine transformations with elementwise nonlinear activation functions. For a network with \( L \) hidden layers of widths \( d_1, \ldots, d_L \):

\[
\mathbf{h}^{(l)} = \sigma\left(\mathbf{W}^{(l)} \mathbf{h}^{(l-1)} + \mathbf{b}^{(l)}\right), \quad l = 1, \ldots, L
\]

where \( \mathbf{h}^{(0)} = \mathbf{x} \) is the input, \( \mathbf{W}^{(l)} \) and \( \mathbf{b}^{(l)} \) are the weight matrix and bias vector for layer \( l \), and \( \sigma \) is the activation function (commonly ReLU: \( \sigma(z) = \max(0,z) \)).

The parameters \( \theta = \{(\mathbf{W}^{(l)}, \mathbf{b}^{(l)})\}_{l=1}^{L+1} \) are estimated by minimizing the empirical loss using **backpropagation** — an efficient application of the chain rule that computes gradients of the loss with respect to all parameters in a single backward pass — combined with stochastic gradient descent (SGD) or an adaptive variant such as Adam.

**Regularization** of neural networks takes several forms. **Weight decay** (analogous to ridge regression) adds \( \lambda \|\theta\|^2 \) to the loss. **Dropout** randomly sets a fraction of neuron activations to zero during each forward pass of training, acting as an ensemble method and reducing co-adaptation of neurons. **Batch normalization** normalizes the activations within each mini-batch, stabilizing training and enabling higher learning rates.

**Transfer learning** applies a model pretrained on a large dataset to a new task with limited data. In structured (tabular) data settings, transfer learning is less mature than in vision and language, but recent work on tabular foundation models (TabPFN, TabNet) and the use of pretrained language models for feature extraction from text columns are increasingly relevant.

## 3.4 Survival Analysis

Survival analysis is the branch of statistics concerned with modeling time-to-event data, where the event of interest (death, failure, disease recurrence, customer churn) may not be observed for all individuals due to **censoring**. An observation is right-censored if the event had not occurred by the end of the study or the individual was lost to follow-up; in this case, we know only that the event time \( T \) exceeds the observed time \( C \).

The **survival function** \( S(t) = P(T > t) \) and the **hazard function** \( h(t) = \lim_{\Delta t \to 0} P(t \leq T < t + \Delta t \mid T \geq t) / \Delta t \) are the primary quantities of interest. The **Kaplan-Meier estimator** is a nonparametric estimator of the survival function:

\[
\hat{S}(t) = \prod_{t_i \leq t} \left(1 - \frac{d_i}{n_i}\right)
\]

where the product is over the ordered event times \( t_i \), \( d_i \) is the number of events at time \( t_i \), and \( n_i \) is the number of individuals at risk just before \( t_i \).

The **Cox proportional hazards model** introduces covariate effects through a multiplicative model for the hazard:

\[
h(t \mid \mathbf{x}) = h_0(t) \cdot \exp\left(\mathbf{x}^\top \boldsymbol{\beta}\right)
\]

where \( h_0(t) \) is an unspecified baseline hazard function and \( \exp(\beta_j) \) is the hazard ratio associated with a one-unit increase in \( x_j \). The parameters \( \boldsymbol{\beta} \) are estimated by maximizing the partial likelihood, which eliminates \( h_0(t) \) and depends only on the ordering of event times. The **proportionality assumption** — that the hazard ratio between any two covariate profiles is constant over time — should be checked using Schoenfeld residuals and log-log survival plots.

## 3.5 Clustering and Dimensionality Reduction

**k-means clustering** partitions \( n \) observations into \( k \) clusters by minimizing the within-cluster sum of squares:

\[
\min_{C_1, \ldots, C_k} \sum_{j=1}^k \sum_{i \in C_j} \left\|\mathbf{x}_i - \boldsymbol{\mu}_j\right\|^2
\]

where \( \boldsymbol{\mu}_j \) is the centroid of cluster \( j \). The algorithm alternates between assigning observations to their nearest centroid and recomputing centroids until convergence. K-means is sensitive to initialization (multiple random restarts are recommended), assumes spherical cluster shapes, and requires specifying \( k \) in advance. The elbow method and silhouette analysis provide heuristics for choosing \( k \).

**Hierarchical clustering** builds a tree (dendrogram) of nested partitions by successively merging (agglomerative) or splitting (divisive) clusters. The choice of linkage criterion — single linkage (minimum distance), complete linkage (maximum distance), average linkage, or Ward's method (minimizing within-cluster variance) — substantially affects the resulting dendrogram. A partition at any level of resolution can be obtained by cutting the dendrogram at the appropriate height.

**Gaussian mixture models (GMMs)** provide a probabilistic generalization of k-means: each observation is assumed to arise from one of \( k \) Gaussian components with component-specific means \( \boldsymbol{\mu}_j \) and covariance matrices \( \boldsymbol{\Sigma}_j \). Parameters are estimated by the expectation-maximization (EM) algorithm, which alternates between computing the posterior probability that each observation belongs to each component (E-step) and updating the parameters to maximize the expected complete-data log-likelihood (M-step). The number of components is selected by BIC or integrated complete-data likelihood.

**PCA** and its limitations deserve emphasis in the context of EDA. PCA finds the linear subspace of dimension \( d \) that maximizes the variance of the projected data. The first \( d \) principal components are the leading eigenvectors of the sample covariance matrix \( \hat{\boldsymbol{\Sigma}} = \frac{1}{n-1}\mathbf{X}^\top \mathbf{X} \) (after centering). PCA is optimal for linear structure but fails to capture non-linear manifolds. It is also sensitive to outliers (which inflate variance), to variables on different scales (which should be standardized), and to the presence of discrete structure (which is better revealed by non-linear methods).

## 3.6 Bayesian Methods in Applied Settings

The Bayesian approach to statistical inference represents all uncertainty — about parameters, about models, about predictions — through probability distributions. Rather than maximizing a likelihood to obtain a point estimate, Bayesian inference combines a **prior distribution** \( \pi(\theta) \) encoding pre-data beliefs about the parameter \( \theta \) with the **likelihood** \( L(\theta; \mathbf{y}) \) to obtain the **posterior distribution**:

\[
\pi(\theta \mid \mathbf{y}) \propto L(\theta; \mathbf{y}) \cdot \pi(\theta)
\]

In applied settings, the prior distribution is not merely a mathematical convenience but an opportunity to incorporate substantive domain knowledge. A clinical pharmacologist knows that drug clearance rates are strictly positive and log-normally distributed in a human population; this knowledge can be encoded directly in the prior, yielding estimates that are more accurate than those obtained by maximum likelihood, particularly when sample sizes are small.

**Posterior predictive checks** are the Bayesian equivalent of model diagnostics. After fitting the model, the analyst simulates replicated datasets from the posterior predictive distribution \( p(\tilde{\mathbf{y}} \mid \mathbf{y}) = \int p(\tilde{\mathbf{y}} \mid \theta) \pi(\theta \mid \mathbf{y}) d\theta \) and compares them to the observed data on test statistics of interest. Systematic discrepancies between the replicated and observed data reveal aspects of the model that are inadequate.

**Bayesian model comparison** uses the marginal likelihood (or model evidence) \( p(\mathbf{y} \mid \mathcal{M}) = \int p(\mathbf{y} \mid \theta, \mathcal{M}) \pi(\theta \mid \mathcal{M}) d\theta \) to compare competing models. The **Bayes factor** \( B_{12} = p(\mathbf{y} \mid \mathcal{M}_1) / p(\mathbf{y} \mid \mathcal{M}_2) \) quantifies the evidence in favor of model \( \mathcal{M}_1 \) relative to \( \mathcal{M}_2 \). Bayesian model averaging combines predictions from multiple models weighted by their posterior model probabilities.

---

# Chapter 4: Model Validation and Uncertainty Quantification

## 4.1 Cross-Validation Strategies

The fundamental principle of cross-validation is that the validation data must be independent of the training data in the same way that future data would be independent of the training data. Violations of this principle — using information from the validation fold during training — produce optimistically biased estimates of generalization performance, sometimes dramatically so.

Standard \( k \)-fold cross-validation treats all observations as exchangeable, which is appropriate for independent and identically distributed data. Many real-world datasets, however, have structure that violates this assumption. **Stratified cross-validation** preserves the class distribution in each fold, which is important when the outcome is imbalanced. **Grouped cross-validation** assigns all observations from the same group (e.g., all measurements from the same patient, all records from the same hospital) to the same fold, preventing information leakage when observations are clustered.

**Temporal cross-validation** is required when observations are ordered in time and future observations are genuinely not available at the time of prediction. In this setting, the training set for fold \( k \) must consist only of observations before a specified cutoff time, and the validation set consists of observations after that cutoff. A common variant is the **expanding window** scheme, where each successive training set includes all data up to a given time point, and validation is performed on the next time period.

<div class="remark">
<strong>The pre-processing pipeline must be cross-validated.</strong> A frequently made error is to apply pre-processing steps — centering, scaling, imputation, feature selection — to the entire dataset before cross-validation. This allows the cross-validation procedure to use information from the held-out fold (e.g., the mean and standard deviation of the predictors are computed using held-out data), producing an optimistically biased estimate. All pre-processing steps that depend on the data must be inside the cross-validation loop.
</div>

## 4.2 Calibration

A probabilistic classifier produces, for each observation, a vector of predicted class probabilities. **Calibration** refers to the alignment between these predicted probabilities and the actual frequencies of the classes: a model that predicts a 70% probability of class 1 should have class 1 occurring approximately 70% of the time among observations with that predicted probability.

A **reliability diagram** plots the observed frequency of the positive class within bins of the predicted probability against the midpoint of each bin. A perfectly calibrated model produces a reliability diagram that falls on the diagonal. Overconfident models (predicted probabilities too extreme) produce curves that are flattened relative to the diagonal; underconfident models produce curves that are too steep.

The **Brier score** is a proper scoring rule for probabilistic classifiers:

\[
\text{BS} = \frac{1}{n} \sum_{i=1}^n \left(\hat{p}_i - y_i\right)^2
\]

where \( \hat{p}_i \) is the predicted probability of the positive class and \( y_i \in \{0, 1\} \) is the observed outcome. The Brier score combines calibration and discrimination (the ability to rank observations by their true risk), and can be decomposed into these two components. The **Expected Calibration Error (ECE)** provides a scalar summary of calibration quality by computing the average absolute deviation between predicted probability and observed frequency across bins.

Calibration is distinct from discrimination. A model can have excellent discrimination (high AUC) but poor calibration (systematically biased probabilities), or vice versa. For applications where the predicted probabilities are used directly in decision-making (e.g., a clinical risk score that determines treatment), calibration is often more important than discrimination.

## 4.3 Conformal Prediction

Conformal prediction is a framework for constructing prediction sets — sets that contain the true response with a guaranteed probability — without assuming a specific form for the data-generating distribution. This distribution-free coverage guarantee is valid in finite samples, not merely asymptotically, and requires only the assumption that the data are exchangeable.

**Split conformal prediction** works as follows. Split the data into a training set and a calibration set. Fit the model on the training set. For each observation \( i \) in the calibration set, compute the **nonconformity score** \( s_i = |y_i - \hat{f}(\mathbf{x}_i)| \) (for regression). For a new observation \( \mathbf{x}_{n+1} \) and a target coverage level \( 1 - \alpha \), compute:

\[
\hat{q} = \text{quantile}\left(s_1, \ldots, s_m; \; \left\lceil (m+1)(1-\alpha) \right\rceil / m \right)
\]

The prediction interval \( \hat{f}(\mathbf{x}_{n+1}) \pm \hat{q} \) has marginal coverage at least \( 1 - \alpha \):

\[
P\left(Y_{n+1} \in \hat{C}(\mathbf{x}_{n+1})\right) \geq 1 - \alpha
\]

The key insight is that this guarantee holds regardless of the distribution of the data and regardless of how well the model \( \hat{f} \) fits, as long as the data are exchangeable. However, the prediction interval width depends on the model quality: a better-fitting model produces smaller nonconformity scores and therefore narrower intervals.

<div class="remark">
<strong>Marginal vs. conditional coverage.</strong> The conformal prediction guarantee is <em>marginal</em>: it holds on average over the distribution of new observations. It does not guarantee <em>conditional</em> coverage — that the interval contains the true response at the specified rate for every possible value of the covariates. Achieving conditional coverage is strictly harder and generally requires stronger assumptions.
</div>

## 4.4 Bootstrap Methods

The bootstrap is a resampling method for estimating the sampling distribution of a statistic. The basic idea is to treat the observed data as a proxy for the population and to simulate the data-collection process by repeatedly drawing samples (with replacement) from the observed data.

In the **nonparametric bootstrap**, \( B \) bootstrap samples \( \mathbf{y}^{*(1)}, \ldots, \mathbf{y}^{*(B)} \) are drawn from the observed data with replacement, and the statistic of interest \( \hat{\theta}^{*(b)} \) is computed for each. The bootstrap distribution of \( \hat{\theta}^* \) approximates the sampling distribution of \( \hat{\theta} \).

The **percentile interval** takes the \( \alpha/2 \) and \( 1-\alpha/2 \) quantiles of the bootstrap distribution: \( \left[\hat{\theta}^{*(\alpha/2)}, \hat{\theta}^{*(1-\alpha/2)}\right] \). The **BCa (bias-corrected and accelerated) interval** applies corrections for both the bias in the bootstrap distribution and the skewness of the sampling distribution, producing more accurate intervals at the cost of additional computation (the acceleration constant requires an influence function calculation).

In the **parametric bootstrap**, new datasets are generated from the fitted parametric model rather than by resampling from the observed data. The parametric bootstrap is more efficient (lower variance) when the parametric model is correct but more sensitive to model misspecification.

## 4.5 Sensitivity Analysis

Any statistical analysis rests on a set of assumptions that cannot be fully verified from the data. Sensitivity analysis examines how conclusions change as these assumptions are relaxed or perturbed. It is not a method for producing conservative estimates but a tool for communicating the robustness of findings.

**Perturbation of assumptions** examines the effect of changing modeling choices: using a different link function, a different variable selection threshold, a different imputation method for missing data. When conclusions are qualitatively stable across a range of defensible assumptions, this provides evidence of robustness. When conclusions change substantially, the analyst must report this sensitivity honestly and, ideally, identify which assumption is most consequential.

**Subset analyses** examine whether conclusions hold within prespecified subgroups of the data. They are particularly important in clinical and social science research, where the target population may be heterogeneous and effects may vary across subgroups. Subset analyses should be prespecified (not data-driven) and reported as exploratory rather than confirmatory when they are post hoc.

**Influence functions** provide a formal framework for assessing the sensitivity of an estimator to individual observations. The influence function of an estimator \( T \) at a distribution \( F \) is:

\[
\text{IF}(x; T, F) = \lim_{\epsilon \to 0} \frac{T((1-\epsilon)F + \epsilon \delta_x) - T(F)}{\epsilon}
\]

where \( \delta_x \) is a point mass at \( x \). Observations with large influence function values have a disproportionate effect on the estimate, and their removal or downweighting may produce substantially different results.

---

# Chapter 5: Data Science Workflow

## 5.1 Reproducible Research Principles

A data analysis is **reproducible** if another analyst, given the same data and the same instructions, can produce identical results. This standard, while seemingly minimal, is violated by a surprisingly large fraction of published data science work. The causes include dependence on undocumented software versions, random seeds that are not set, manual steps that are not recorded, and data cleaning decisions that are not captured in code.

Knuth's concept of **literate programming** proposed interleaving code and prose in a single document, so that the document both explains the analysis and executes it. Modern implementations of this idea — R Markdown, Quarto, and Jupyter notebooks — are now the standard tools for reproducible data science. These tools produce documents that contain the analysis narrative, the code that produced each result, and the output of that code, all in a single file that can be re-executed from scratch to reproduce every number and figure.

An important distinction exists between **computational reproducibility** (given the same software environment and random seed, the same results are produced) and **statistical reproducibility** (different data collected from the same population under the same protocol yield qualitatively similar conclusions). The former is achievable through careful workflow design; the latter is a property of the scientific question and the strength of the statistical signal.

## 5.2 Version Control with Git

Version control is the practice of tracking changes to files over time, enabling the analyst to recover previous versions, compare changes, and collaborate without overwriting each other's work. **Git** is the dominant version control system in data science and software engineering.

Good Git discipline requires **atomic commits**: each commit should represent a single logical change (add a new cleaning step, fix a bug in the model evaluation function, update a figure) and should have a commit message that describes what was changed and why. A commit history consisting of messages like "stuff" or "more changes" provides no benefit over having no version control at all.

**Branching** allows the analyst to develop new features or analyses in isolation from the main codebase. The standard workflow for collaborative projects is to create a new branch for each new feature or bug fix, develop and test on that branch, and then merge back to the main branch via a **pull request**. Pull requests enable code review: a collaborator reads the changed code, asks questions, suggests improvements, and approves the changes before they are merged. Code review is one of the most effective practices for improving code quality and catching errors in data science pipelines.

For data science projects, it is generally not appropriate to version-control large data files in Git (use a data registry, object storage, or DVC instead). Raw data should be treated as read-only: never modified in place, with all transformations captured in code.

## 5.3 Project Organization

A well-organized project directory makes it easier to understand what the project does, where to find each component, and how to reproduce the analysis. The **cookiecutter data science** template provides a widely used convention:

The top-level directory contains a README (describing the project), a `data/` directory (with subdirectories for `raw/`, `processed/`, and `external/` data), a `src/` or `R/` directory (for reusable functions and modules), a `notebooks/` directory (for exploratory analysis), a `reports/` directory (for final outputs), and a `models/` directory (for serialized model objects). This separation enforces the discipline of distinguishing raw data (which should never be modified) from processed data (which is the output of deterministic code), and exploratory code (which may be messy) from production code (which should be clean and tested).

**Dependency management** ensures that the software environment can be reconstructed. In R, `renv` records the packages and their versions in a lockfile. In Python, `conda` environments or `pip` with a `requirements.txt` or `pyproject.toml` serve the same purpose. **Docker** containers go further by capturing the entire operating system environment, enabling exact reproducibility across machines and over time.

## 5.4 Testing Scientific Code

Data science code is subject to the same bugs as any software — off-by-one errors, incorrect data type handling, silent NA propagation, incorrect index ordering — and benefits equally from systematic testing. Yet testing is far less common in data science than in software engineering, partly because of the mistaken belief that correctness can be verified by "eyeballing" outputs.

**Unit tests** verify that individual functions produce correct outputs for known inputs. For data transformation functions, this means testing on simple, hand-constructed examples where the correct output can be computed by hand. For numerical methods, this means testing on cases with known analytical solutions.

**Snapshot tests** (also called golden tests or regression tests) verify that the output of a function has not changed from a previously computed reference value. These are particularly useful for model fitting functions: after verifying that the model produces reasonable output, the analyst saves the output as a snapshot, and future runs verify that the output matches the snapshot. Any change to the model code that changes its output will be detected.

**Continuous integration (CI)** automatically runs the test suite whenever code is pushed to the repository, providing immediate feedback when a change breaks an existing test. GitHub Actions, GitLab CI, and CircleCI are common CI platforms that can be configured to run tests in a clean environment with specified dependencies.

## 5.5 Generative AI in the Data Science Workflow

Large language models (LLMs) have become a significant force in data science practice. Tools such as GitHub Copilot, ChatGPT, and Claude are used for code generation, documentation, exploratory analysis, and even interpretation of results. Understanding how to use these tools effectively, and how to identify their limitations, is now a core professional skill.

LLMs are effective at generating boilerplate code, translating between programming languages, explaining unfamiliar APIs, and suggesting approaches to common tasks. They can substantially accelerate the early stages of a data analysis by generating starter code for data cleaning, visualization, and modeling that the analyst then adapts and refines.

The **"trust but verify" principle** is essential. LLM-generated code may be syntactically correct but semantically wrong: it may use the wrong statistical test, misinterpret the data structure, or silently propagate errors. Every piece of LLM-generated code should be reviewed, understood, and tested before it is incorporated into an analysis. The analyst is responsible for the correctness of the analysis regardless of how it was generated.

<div class="remark">
<strong>Ethical considerations for AI-assisted analysis.</strong> The use of LLMs raises several ethical issues. Submitting data to a cloud-based LLM may violate data privacy agreements. LLM-generated interpretations of statistical results may be confidently wrong, and the plausible-sounding prose may obscure errors that would be obvious in code. Acknowledging the use of AI tools in a methods section is increasingly expected in scientific publishing and should be treated as a standard component of transparency and reproducibility.
</div>

---

# Chapter 6: Communication of Statistical Findings

## 6.1 The Audience Problem

Statistical findings must be communicated to audiences with widely varying backgrounds and expectations, and the same analysis may need to be presented in multiple formats for multiple audiences. A clinical trial result might be communicated to the trial statistician (full methodological detail), the principal investigator (methods summary and key results), the regulatory agency (pre-specified analysis plan and complete numerical output), the journal readership (a methods section and results section following the journal's guidelines), and the patients who participated (a plain-language summary). Each communication is valid; none is a simplified or corrupted version of the others — they are different representations optimized for different purposes.

The central challenge of statistical communication is that the audience's statistical literacy and the analyst's expertise are rarely aligned. Domain experts understand the scientific context deeply but may misinterpret p-values, confidence intervals, or model predictions. Non-specialist audiences may not understand variance, let alone regularization. The analyst must develop fluency in multiple registers: precise technical language for peer communication and accessible narrative language for broader audiences — without sacrificing accuracy in either.

## 6.2 Written Reports

A well-structured written report for a data science case study typically comprises: an **executive summary** of no more than one page that states the scientific question, the key findings, and their practical implications; a **methods section** that describes the data, the statistical methods, and the validation approach in sufficient detail that a competent statistician could reproduce the analysis; a **results section** that presents findings with appropriate uncertainty quantification; and a **discussion** that interprets the findings in scientific context, acknowledges limitations, and suggests directions for future work.

The methods section requires a delicate balance. Over-specification (presenting every modeling decision with full mathematical detail) overwhelms non-specialist readers and consumes space that could be used for results. Under-specification makes the analysis irreproducible and fails the standard of scientific transparency. The convention in most fields is to describe the primary analysis method with sufficient detail for replication, cite references for standard methods rather than deriving them, and note any non-standard modeling choices explicitly.

Writing about statistical uncertainty without losing the reader requires both skill and practice. Confidence intervals should be reported alongside point estimates, but their interpretation should be stated in terms that are meaningful to the audience: "We estimate that the treatment reduces the average length of hospital stay by 1.4 days, with a 95% confidence interval from 0.6 to 2.2 days" conveys the uncertainty in a way that a clinician can act on, without requiring any knowledge of the Neyman-Pearson framework.

## 6.3 Data Visualization Principles

Effective data visualization is not merely aesthetic; it is a primary medium for statistical communication and must be held to the same standard of accuracy and honesty as numerical results. Several organizing principles guide the design of statistical graphics.

Tufte's **data-ink ratio** principle states that the ratio of ink devoted to data to total ink on the figure should be maximized. Chartjunk — decorative elements that do not convey data, such as gridlines, three-dimensional effects, and redundant labels — reduces the data-ink ratio and should be eliminated. A scatter plot conveys the same information as a three-dimensional bar chart but with far less visual clutter.

Wilkinson's **grammar of graphics** provides a compositional framework for describing any statistical graphic in terms of its constituent elements: the data layer, the aesthetic mapping (which variables map to which visual properties — position, color, size, shape), the geometric layer (points, lines, bars, ribbons), the scale transformations, and the coordinate system. The `ggplot2` package in R implements this grammar directly, and `matplotlib` with `seaborn` provides a similar (if less principled) interface in Python.

The choice of chart type should be driven by the nature of the data and the comparison being made. Scatter plots reveal bivariate relationships and individual observation identities. Line plots communicate trends over an ordered axis. Bar charts compare quantities across discrete categories. Histograms and density plots reveal distributional shapes. Heatmaps reveal structure in matrices. Violin plots combine the distributional information of a density plot with the comparative structure of a box plot.

Color choices should be accessible to colorblind readers: approximately 8% of men and 0.5% of women have some form of color vision deficiency. Palettes from ColorBrewer (for discrete and diverging data) and viridis (for continuous data) are specifically designed to be perceptually uniform and colorblind-safe.

## 6.4 Presentations and Posters

A presentation of statistical findings imposes constraints that are quite different from those of a written report. The audience cannot re-read a slide; they must absorb its content in the time you are speaking. Each slide should have a single main idea, stated in the slide title in a declarative sentence (e.g., "Regularized regression outperforms linear models on held-out data" rather than "Model Comparison Results"). The body of the slide should contain one figure or one short table that illustrates that idea.

The **one-idea-per-slide** principle is frequently violated in academic presentations, where slides are used as reading material rather than as visual support for a spoken narrative. A presentation should be designed so that the spoken narrative is the primary carrier of information, with slides providing visual reinforcement. A skilled presenter should be able to give the talk without the slides; the slides exist to make it easier for the audience to follow along.

Poster presentations pose additional challenges. The poster must be comprehensible both when the presenter is available to explain it and when the viewer encounters it independently. The layout should guide the viewer's eye through the content in a logical order. Figures should be large enough to read from a distance of one meter. Text should be minimal: each section should contain one or two key sentences, not paragraphs.

## 6.5 Limitations and Ethical Considerations

Honest communication of limitations is not an optional addendum to a statistical analysis but a fundamental component of scientific integrity. Every model rests on assumptions that may be violated; every analysis is specific to the dataset at hand and may not generalize; every causal claim from observational data depends on untestable identification assumptions. These limitations should be stated clearly and specifically — not in the vague boilerplate of "further research is needed" but in terms that help the reader assess the degree to which the conclusions can be trusted and in which contexts they apply.

The reporting of negative results — findings that do not support the pre-specified hypothesis — is essential for scientific progress and is systematically suppressed by publication incentives. A data science practitioner who discovers that the much-anticipated machine learning model does not outperform a logistic regression baseline has performed a valuable scientific act, even if the finding is not publishable in a top venue.

**Algorithmic fairness** has emerged as a major concern in data science applications that affect individuals. A predictive model trained on historical data may perpetuate historical inequities: a recidivism prediction model trained on data from a justice system with racial disparities will reflect those disparities. Multiple formal definitions of fairness — demographic parity, equalized odds, calibration within groups — are mutually incompatible in general, and the choice among them reflects a value judgment that should be made explicitly and transparently.

<div class="remark">
<strong>Data privacy and consent.</strong> The use of individual-level data raises ethical obligations that statistical methods do not resolve. Differential privacy provides formal guarantees against the disclosure of individual information in published statistics, at the cost of some accuracy. These tradeoffs must be understood and communicated to data subjects and data custodians alike.
</div>

---

# Chapter 7: Case Study Archetypes

## 7.1 Prediction Case Studies

A prediction case study asks: given the observable features of a new unit, what is our best estimate of its response? The operative criterion is predictive accuracy on new data, not interpretability of coefficients or causal validity of the model. This focus on prediction does not mean that interpretability and causality are irrelevant — a prediction model that uses a causal predictor is more likely to generalize to future data distributions that differ from the training data — but it does mean that the primary evaluation criterion is held-out performance.

Building a prediction pipeline begins with defining the prediction task: what is the response variable, what features are available at prediction time, and what is the evaluation metric? The choice of evaluation metric should reflect the actual cost structure of the prediction errors in the application. In a medical diagnosis application, false negatives (failing to detect disease) may be far more costly than false positives; this asymmetry should be reflected in the loss function used to train and evaluate the model.

Prediction models are evaluated on a held-out test set. In competition settings (Kaggle-style), the test set labels are held by the competition organizers and predictions are submitted for scoring. In real-world settings, the test set may be a temporal holdout (future data), a geographic holdout (data from a different region), or a population holdout (data from a different demographic group). The choice of test set determines the type of generalization being assessed.

**Deployment** of prediction models introduces additional challenges that are absent in the competition setting. The distribution of inputs at deployment time may differ from the training distribution (covariate shift); the relationship between inputs and output may change over time (concept drift); and the model's predictions may themselves affect the data-generating process (feedback loops). Monitoring deployed models for performance degradation and distribution shift is an increasingly important part of the data science workflow.

<div class="example">
<strong>Kaggle vs. real-world evaluation.</strong> In Kaggle competitions, the evaluation metric is fixed, the test labels are known to the organizers, and the evaluation is performed once (or a small number of times). In real-world deployment, the model is evaluated continuously on new data, the relevant performance metric may change over time, and the cost of a wrong prediction varies across contexts. A model that achieves the highest AUC on the Kaggle leaderboard may not be the best choice for deployment: it may be poorly calibrated, may not perform well on the subpopulations of greatest clinical interest, or may rely on features that are not reliably available in the deployment environment.
</div>

## 7.2 Inference Case Studies

An inference case study asks: what is the effect of a specific factor or intervention on the outcome, having controlled for confounding? The operative criterion is the accuracy of the effect estimate (low bias, appropriate confidence intervals), not predictive accuracy. A model that perfectly predicts the outcome may give badly biased estimates of causal effects if it absorbs confounding into the coefficient of the treatment variable.

The design of an inference study begins with defining the estimand: which effect is to be estimated, in which population, under which comparison. This definition should be made before data analysis begins and should be driven by the scientific question rather than by the available data. In randomized experiments, the estimand is clearly defined by the randomization: the average treatment effect in the enrolled population. In observational studies, the estimand must be defined with reference to the identifying assumptions, and the analyst should specify what those assumptions are and why they are believed to hold.

**Design-based inference** relies on the randomization mechanism (in experiments) or a model for the sampling mechanism (in surveys) to justify the statistical procedures, rather than on parametric assumptions about the outcome distribution. This approach is particularly appealing in high-stakes inference settings because the justification for the inference procedure is explicit and does not depend on unverifiable distributional assumptions.

**Model-based inference** uses parametric or nonparametric models for the conditional distribution of the outcome given the treatment and covariates to estimate the treatment effect. Doubly robust estimators — such as the augmented inverse probability weighting (AIPW) estimator and the targeted maximum likelihood estimator (TMLE) — combine a model for the outcome with a model for the treatment assignment probability and are consistent if either model is correctly specified.

## 7.3 Exploratory and Descriptive Case Studies

An exploratory case study asks: what structure exists in this dataset that we did not know to look for in advance? This type of analysis has lower formal requirements — no pre-specified estimand, no hypothesis to test — but its own distinct methodological challenges and ethical obligations.

The primary methodological challenge of exploratory analysis is controlling the false discovery rate in a setting where many potential findings are being generated simultaneously. Exploratory findings should be presented as hypotheses to be confirmed in independent data, not as established results. The distinction between exploratory and confirmatory analysis should be clearly stated in any publication or report, and the narrative should reflect this distinction: "This pattern was observed in the data and warrants further investigation" is appropriate; "We found that X causes Y" is not.

Communicating uncertainty in patterns discovered through exploratory analysis requires care. Cluster structures visualized in UMAP plots may be real or may be artifacts of the dimensionality reduction algorithm and its hyperparameters. Apparent outlier clusters may represent genuinely distinct subpopulations or may be individual anomalies. The analyst should report both the pattern and the uncertainty about its interpretation.

The **reproducibility crisis** in exploratory science refers to the widespread failure of scientific findings to replicate in independent datasets. The crisis is partly attributable to the use of exploratory findings as if they were confirmatory — selecting the most striking pattern from an exploratory analysis and reporting it with a p-value calculated as if the pattern had been pre-specified. The data science practitioner should be aware of this history and adopt practices (preregistration, splitting data into discovery and replication sets) that guard against it.

## 7.4 Decision-Making Case Studies

A decision-making case study asks: given the results of the analysis, what action should be taken? This is the most practically consequential type of case study, but it is also the type that most clearly exceeds the boundaries of statistical competence alone: the translation from statistical findings to a decision requires value judgments, cost-benefit assessments, and institutional constraints that are the domain of the decision-maker, not the analyst.

**Decision theory** provides a formal framework for making decisions under uncertainty. A decision \( d \) is evaluated by its expected loss \( \mathbb{E}\left[L(d, \theta)\right] \) where \( \theta \) is the unknown state of the world and \( L(d, \theta) \) is the loss from taking decision \( d \) when the true state is \( \theta \). The Bayesian decision rule selects the decision that minimizes expected loss under the posterior distribution of \( \theta \).

The **value of information** quantifies how much the expected loss would decrease if a particular piece of information were available. The expected value of perfect information (EVPI) is the maximum amount a decision-maker should pay to resolve all remaining uncertainty before making a decision. If the EVPI is small relative to the cost of obtaining additional data, further analysis is not warranted; if the EVPI is large, additional analysis is valuable.

**Cost-benefit framing** of statistical error makes the asymmetry between Type I and Type II errors explicit. In a clinical trial, a Type I error (approving an ineffective drug) and a Type II error (rejecting an effective drug) have very different consequences for public health and for the patients who would have benefited from the drug. The choice of significance level and power in the trial design is fundamentally a cost-benefit decision, not a purely statistical one, and should be made with input from clinical, regulatory, and patient perspectives.

<div class="remark">
<strong>The analyst's role in decision-making.</strong> The statistician's role in a decision-making case study is to provide the best possible characterization of the uncertainty about the state of the world — honest estimates with appropriate uncertainty quantification, sensitivity analyses that reveal the robustness of the findings, and clear communication of what the data can and cannot tell us. The statistician should not pretend that a statistical analysis can substitute for the value judgments required to translate findings into decisions, but neither should the statistician retreat to a purely technical role and disclaim responsibility for how the analysis is used.
</div>

A complete decision-making case study should report not only the statistical findings but also the decision framework that was used to translate those findings into a recommendation, the values and priorities that informed that framework, and the sensitivity of the recommended decision to the key uncertainties in the analysis. This level of transparency is rare but represents the standard that the field should aspire to.

---

*End of STAT 946 Course Notes — Winter 2026. These notes are intended as a supplement to the primary course readings and the case study assignments, not as a substitute for either. The methods described here are most fully understood through application to real datasets with genuine scientific questions.*
