---
title: "ECE 457B: Fundamentals of Computational Intelligence / Machine Learning"
prof: "Mahesh Tripunitara"
subjects: "ECE"
---

## Sources and References

<strong>Equivalent UW courses</strong> — CS 480/680 (Introduction to Machine Learning), CS 486/686 (Introduction to Artificial Intelligence), STAT 441/841 (Statistical Learning - Classification)

<strong>Primary textbook</strong> — Raschka, Liu, and Mirjalili, <em>Machine Learning with PyTorch and Scikit-Learn</em> (chapters 1-5), available through the UW library.

<strong>Supplementary reference</strong> — Kearns and Vazirani, <em>An Introduction to Computational Learning Theory</em>, Section 1.1 (axis-aligned rectangle learning example).

## Equivalent UW Courses

ECE 457B is the ECE department's introductory machine learning course and overlaps heavily with CS 480/680, which is the single cross-listed Math Faculty introduction to ML. The classical-ML core (linear models, regularization, SVMs, decision trees, kNN, dimensionality reduction) is essentially the same material as STAT 441/841's classification content and roughly the first half of CS 480/680. The broader pattern-recognition and search-based AI framing touches CS 486/686 territory, but CS 486/686 spends far more time on logic, search, planning, and probabilistic reasoning than ECE 457B does. In short, ECE 457B is closest to CS 480/680 with a statistical-classification flavor comparable to STAT 441/841.

## What This Course Adds Beyond the Equivalents

Compared to CS 480/680, ECE 457B stays closer to a practitioner-first presentation: it leans on the Raschka/Mirjalili PyTorch and scikit-learn textbook and walks students through implementation details (standardization, stochastic gradient descent, scikit-learn APIs) that the CS version treats more abstractly. It also opens with computational learning theory using the axis-aligned rectangle PAC example from Kearns and Vazirani, which CS 480/680 typically skips. What ECE 457B omits relative to the Math equivalents is the deeper probabilistic machinery — MLE and MAP derivations, Bayesian methods, EM, graphical models, and kernel-theory proofs — as well as the search and logic content found in CS 486/686. Deep learning beyond the perceptron/Adaline foundation is lighter here than in CS 480/680's current offerings.

## Topic Summary

### Learning theory preliminaries
The course opens with the idea of framing a task as a learning problem, using the axis-aligned rectangle example as a gentle PAC-style introduction. This motivates the notions of hypothesis class, sample complexity, and generalization without committing to a full VC-dimension treatment.

### Perceptron and Adaline
The perceptron is presented as the historical starting point for linear classification, followed by Adaline as the bridge to continuous optimization. The key step is replacing the step activation with a differentiable loss so that weights can be learned by gradient descent rather than the perceptron update rule.

### Gradient descent and SGD
Batch gradient descent is derived on the Adaline squared-error loss. Standardization of features is introduced as a practical prerequisite for stable learning rates, and stochastic gradient descent is motivated as the scalable variant used for larger datasets.

### Logistic regression and regularization
Logistic regression is introduced via the sigmoid and cross-entropy loss, with scikit-learn used to fit models in practice. Regularization is then covered as the standard remedy for overfitting, with \( L_1 \) and \( L_2 \) penalties and the geometric intuition for how they shape solutions.

### Support vector classification
SVMs are developed from the maximum-margin idea, leading to the primal formulation

\[
\min_{w,b}\ \tfrac{1}{2}\|w\|^2 \quad \text{s.t.}\quad y_i(w^\top x_i + b) \ge 1.
\]

Soft margins and the kernel trick are presented at an intuition level so that nonlinear decision boundaries can be obtained without explicit feature maps.

### Decision trees and k-nearest neighbours
Decision trees are built top-down using impurity measures such as Gini and entropy, and pruning is discussed as a bias-variance control. kNN is presented as a nonparametric alternative whose performance depends on the distance metric and on careful preprocessing.

### Data preprocessing and dimensionality reduction
Standardization, missing-value handling, and categorical encoding are framed as essential steps of any real pipeline. Principal component analysis is then introduced as the canonical linear dimensionality-reduction technique, diagonalizing the covariance matrix to obtain directions of maximum variance.

### Model assessment
Throughout the course, performance metrics — accuracy, precision, recall, and the confusion-matrix view — are used to compare models. Cross-validation is the standard protocol for estimating generalization error and for tuning hyperparameters such as the regularization strength or the SVM kernel bandwidth.
