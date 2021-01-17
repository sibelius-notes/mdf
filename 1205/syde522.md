---
title: SYDE 522 - Machine Intelligence
layout: toc
parent: Spring 2020
---
# Lecture 1
Objectives of this course:
- basic concepts of AI
- different methods for function approximation
- select the right learning scheme
- difference between shallow & deep learning
- verify the learning capability
- run and evaluate experiments
- write a scientific paper

Lecture Topics:
1. Encoding/embedding: data compression, PCA, t-SNE, Fisher Vector, ..., <span>&#92;(k &#92;)</span>-fold cross validation, leave-one-out
2. Classification/clustering: K-means, FCM, SVM, self-organizing maps
3. Learning: Perceptron, backpropagation, CNN, AEs
4. Reinforcement learning: check [CS 885](/cs/885)
5. Uncertain vs. vague: Probability, FuzzyLogic, DTs, RFs

*Why interest in AI?*
- Recent progress in algorithms
- Availability of data
- Computational power

## History of AI
1901 - PCA (K. Pearson)

1933 - PCA development (H. Hotelling)

1958 - Perceptron (F. Rosenblatt)

1965 - Fuzzy Sets (L. Zadeh)

1969 - Limitation of Perceptron (Minsky/Papert)

1982 - SOM (T. Kohonen)

1986 - Backpropation ([Rumelhart](https://en.wikipedia.org/wiki/David_Rumelhart)/Hinton)

1986 - ID3 algorithm ([J.R. Quinlan](https://en.wikipedia.org/wiki/Ross_Quinlan))

1993 - C 4.5 algorithm (J.R. Quinlan)

1995 - SVM (Cortes/Vapnik)

1995/2001 - Random Forest (T.K.Ho/L.Breiman)

1995 - CNN (LeCunn/Bengio)

2006 - Fast learning for deep belief Nets (Hinton et al.)

2007 - Greedy layer-wise training for deep Nets (Bengio et al.)

2012 - AlexNet

## Main Tasks for AI
- Classification
- Estimation/Prediction
- Search
- Optimization
- Inference

All these is approximation: you have a black box <span>&#92;(f(x) &#92;)</span>, some <span>&#92;(x &#92;)</span> goes in and some <span>&#92;(y &#92;)</span> goes out. <span>&#92;(f &#92;)</span> is unknown. The simplest approach is regression.

![there should be a image...](/pics/522/AI.svg)

*What is intelligence?*

"the act of knowing" <span>&#92;(\implies &#92;)</span> intelligence <span>&#92;(\stackrel{?}{=} &#92;)</span> knowledge

"the exercise of understanding" <span>&#92;(\implies &#92;)</span> intelligence = understanding

|   | humans | machines     |
|:--| :------------- | :------------- |
|thought | reason       | rational decisions       |
|actions | act | rational actions (AI) |

*Can we measure intelligence?*

![there should be a image...](/pics/522/tguess.svg)

# Lecture 2
Check [this paper](https://www.csee.umbc.edu/courses/471/papers/turing.pdf)

*Can machine think?*

Alan Turing assumed we can build intelligent machines. Measuring intelligence is what he is proposing.

Turing anticipated all AI fields:
- searching. Not like browsing, and you type sth in search engine. We are talking about explicit ones: whenever you see sb and remember the face, that is a search. The challenge is the visual info is stored in a highly complicated way, and search mechanism is very sophisticated.
- reasoning. That's where we failed Turing test. We cannot search intelligently, and we cannot reason based on the knowledge you acquired.
- knowledge representation
- NLP
- computer vision
- learning

## The Chinese Room
J. R. Searle

![there should be a image...](https://miro.medium.com/max/348/0*zA6_zLOjyt0zDeQG)

In the room, the person is non-Chinese. Two books inside: rule and dictionary. From outside, people come, put in Chinese text, and come out (flawless) English text.

*Can this person understand Chinese? Can the room understand Chinese?*

Let's look at an example.

## Tic-Tac-Toe
Version 1: Look-Up Table  [Answer for each situation is hard-coded]

Version 2:
- A: Attempt to place two marks in row
- B: If opponent has two marks in a row, then place a mark in the third position.

Version 3: Represent the **state**(understanding) of the game
- Current board position?
- next legal moves?

Use an evaluation function.
- Rate the next move! (how likely to win?)
- Look-ahead of possible opponent's move!


```
<-----Stupid ----------------------- intelligent----->
Version 1                   2                         3
```

AI = Function Approximation

We need "data" for any approximation. For example, linear regression.

AI = Operation intelligently on data to extract the relationship between in- and outputs.
*  Training data for learning.
*  testing data for validation.

**Problems**
1. Not enough data <span>&#92;(\to &#92;)</span> Augmentation
2. Too much data <span>&#92;(\to &#92;)</span> Dimensionality reduction

**Desired**
1. no correlation
2. high variance

## PCA
<span>&#92;(x' &#92;)</span> passes through the "mean" and delivers max variance when samples are projected into it. Process is repeated until we find <span>&#92;(n &#92;)</span> such axes <span>&#92;(\langle x_1,x_2,\ldots,x_n\rangle &#92;)</span>. intelligent: <span>&#92;(x\in \mathbb R^d \implies n \ll d &#92;)</span>.

Principal Component Analysis (PCA) is the algorithm to find orthogonal axes that diagonalize the covariance matrix. What does this mean?

First let's get used to some notations...

- <span>&#92;(x &#92;)</span>: scalar.
- <span>&#92;(\boldsymbol x &#92;)</span>: vector.
- <span>&#92;(X &#92;)</span>: set.
- <span>&#92;(\boldsymbol X &#92;)</span>: matrix.

Covariance matrix
<span>&#92;[
\Sigma = \operatorname{cov}(\underbrace{x_i} _ {i\text{-th input}}, \underbrace{x_j} _ {j\text{-th input}})
= \mathbb E \left[ (x_ i - \mu _ i) (x _ j - \mu _ j) \right]
&#92;]
</span>
where <span>&#92;(\mu _ i = \mathbb E[ x _ i], \mu _ j = \mathbb E[ x _ j] &#92;)</span>.

Are <span>&#92;(x_i &#92;)</span> and <span>&#92;(x_j &#92;)</span> changing together? (correlated)

Generalization of Covariance: <span>&#92;(\Sigma = E[(\boldsymbol x - E[\boldsymbol x]) (\boldsymbol x - E[\boldsymbol x])^T  ] &#92;)</span>

# Lecture 3
## PCA
main features selection. Which components (=features) are important to keep?
- Significance = variance.
- Intelligence = recognizing the significance

Staring point is a file with a table: where the columns: <span>&#92;(x_ 1, x_ 2,\ldots &#92;)</span> are features and rows: (1, 2, 3, ...) are observations.

Covariance matrix <span>&#92;(C = E[ x x^T] &#92;)</span>

Diagonalizing <span>&#92;(C &#92;)</span> using a suitable orthogonal transformation matrix <span>&#92;(A &#92;)</span> by obtaining <span>&#92;(N &#92;)</span> orthogonal "special vectors" <span>&#92;(u_ i &#92;)</span> with "special parameters" <span>&#92;(\lambda _ i &#92;)</span>

![there should be a image...](https://blog.bioturing.com/wp-content/uploads/2018/11/Blog_pca_6b.png)

[src](https://blog.bioturing.com/2018/06/14/principal-component-analysis-explained-simply/)

Principal components: <span>&#92;(\lambda_ 1 &#92;)</span> most important, <span>&#92;(\lambda _  N &#92;)</span> least important. Pick <span>&#92;(N' \ll N &#92;)</span>, so-called dimensionality reduction.

PCA is
- a linear transformation
- unsupervised
- uses statistics and calculus
- dimensionality reduction algorithm
- a visualization algorithm
- intelligent because it recognizes significance

## AI & Data
**Data types**: numbers/symbols/text/images/videos/audio files...

**Pre-processing**: filtering/normalization/outlier detection/dimensionality reduction/augmentation/...

**Data representation**:
- Hand-crafted features (e.g., stats, [SIFT](https://en.wikipedia.org/wiki/Scale-invariant_feature_transform))
- automatic feature extraction (e.g. deep features)

**Encoding**: (compression/embedding)
- no learning
    - PCA
    - [Fisher Vector](https://en.wikipedia.org/wiki/Fisher_kernel)
    - [LDA](https://en.wikipedia.org/wiki/Latent_Dirichlet_allocation)
    - VLAD (vector of locally aggregated descriptors)
    - ...
- with learning
    - Auto-Encoders. [ML DDoS Detection :)](https://www.sibeliusp.com/research/)
    - t-SNE

Applications of PCA
- Data reduction
- Data visualization
- Data classification
- Factor analysis
- Trend analysis
- Noise removal

A meaningful chain:

![there should be a image...](/pics/522/chain.svg)

You will see that this is not always desirable.

## Project
(not sure if this helps...)
1. Find a problem
2. Analyze the problem (input/output/knowledge)
3. Select approach (architecture, parameters, ...)
4. Design the approach
5. Training
6. Re-train if necessary
7. Recall phrase (unseen data)
8. Compare against other methods

# Lecture 4
## LDA
linear discriminant analysis (operates of feature subspace, linear method, supervised)
- Data <span>&#92;(\langle x _ 1,\ldots,x _ n \rangle &#92;)</span>
- <span>&#92;(N _ 1 (N _ 2) &#92;)</span> samples belonging to class <span>&#92;(C_1 (C _ 2) &#92;)</span>
- Find a line that maximizes the class separation

![there should be a image...](https://sebastianraschka.com/images/blog/2014/linear-discriminant-analysis/lda_1.png)

[src](https://sebastianraschka.com/Articles/2014_python_lda.html)

![there should be a image...](/pics/522/wtx.png)
- Define a good separation measure
- Mean vector

<span>&#92;[
    \mu _ i = {1\over N _ i }\sum _ {x\in C _ i} x, \quad \tilde \mu _ i = { 1\over N _ i}\sum _ {y\in C _ i }y = w^T \mu _ i
&#92;]</span>

- Driving force for separation: <span>&#92;(\operatorname{argmax}_ w &#124;\tilde \mu _ 1 - \tilde \mu _ 2 &#124; &#92;)</span>
- But we are ignoring the **variability inside** classes

Fisher's Approach: Normalize the distance (difference) between the means by intra-class scatter.

scatter = variance: <span>&#92;(\tilde s _ i ^ 2 = \sum _ {y\in C _ i} (y - \tilde \mu _ i)^2 &#92;)</span>

intra-class scatter <span>&#92;(\tilde s _ 1^2 + \tilde s _ 2^2 &#92;)</span>

Fisher Linear Discriminant: <span>&#92;(\dfrac {&#124; \tilde \mu _ 1-\tilde\mu _ 2 &#124;^2} {\tilde s _ 1^2 + \tilde s _ 2^2} &#92;)</span>. To be maximized!

## t-SNE
t-Distributed stochastic neighbor embeddings.
- non-linear data visualizer
- t-test. t-distribution (normal distribution)

t-SNE does not use any norm (=distance metric). It uses Kullback-Leibler Divergence. Given two probability distributions <span>&#92;(p,q &#92;)</span>, the KL divergence  measures the distance
<span>&#92;[
    D(p\&#124;q)= \sum _ {x\in X} p(x)\log {p(x)\over q(x)}
&#92;]</span>
However, <span>&#92;(D (p \&#124; q) \ne D(q \&#124; p) &#92;)</span>. Therefore, KL divergence is not a metric!

Relation to entropy <span>&#92;(H(X) &#92;)</span>.

<span>&#92;[H(X)=\sum _ {x\in X}p(x)\log {1\over p(x)}
= \log N - D(\underbrace{p(x)} _ {\text{true dist'n}} \&#124; p _ U(x))
&#92;]</span>
where <span>&#92;(U &#92;)</span>: uniform.

The Shannon entropy is the number of bits necessary to identify <span>&#92;(X &#92;)</span> from <span>&#92;(N &#92;)</span> equally likely possibilities, less the KL divergence of the uniform distribution from the true distribution.

t-SNE idea: hyper-dimensions <span>&#92;(\to &#92;)</span> two dimensions. Similarity in high dimensions corresponds to short distance in low dimensions.

Challenge: perplexing!

t-SNE minimizes the sum of KL divergences over all data points using a gradient descent method.

<span>&#92;[
    Objective = \sum _ i D(P _ i \&#124; Q  _ i) = \sum _ i \sum _ j p _ {j &#124; i} \log { p _ {j &#124; i}\over q _ {j &#124; i}}
&#92;]</span>

![there should be a image...](/pics/522/pq.png)

# Lecture 5
We'll start by saying: AI is vision! Intelligence is to recognize people/scenes/objects/patters/...
- Face recognition
- object recognition
- Auto-captioning of images
- robot navigation
- ...

Given a digital image, two possible ways for recognition:
1. AI approach: given an image, then pass to some sort of AI black box, then there it comes out classes/text
2. CV/AI approach: given an image, then give it to whitebox (CV), which gives you some features, then goes to blackbox of AI, then classes/text

Feature Extraction:
1. Keypoint-oriented (SIFT, SURF, ...): Several hundreds/thousands features
2. Histogram-oriented (LBP, HOG, ELF ...): one histogram

Example: Harris Corner Detection

![there should be a image...](https://miro.medium.com/max/469/0*gTbWMTKvNF-jLJrM.jpg)

For SIFT, you get many feature vectors of length 128. Thus
<span>&#92;[
    Image = \bigcup _ {i=1} ^ { n \text{ key points}} v _ i
&#92;]</span>
Challenge:
- Data is too large
- Data may not be descriptive

Solution: embedding/pooling/encoding
- Fisher Vectors (embedding/pooling)
- VLAD (encoding/increasing discrimination)

##  Fisher Vectors

We have our dataset: <span>&#92;(X = &#92;left&#92;{ x _ t &#124; t = 1,\ldots, T &#92;right&#92;} &#92;)</span>. And <span>&#92;(u _ \lambda &#92;)</span> = probability density function which models the generative process of elements of <span>&#92;(X &#92;)</span>. And we have <span>&#92;(\lambda \in \mathbb R^M &#92;)</span> which are parameters of <span>&#92;(u_ \lambda &#92;)</span>

In statistics, the "score function" is the gradient (partial derivative) w.r.t. parameter <span>&#92;(\lambda &#92;)</span> of the natural log of the likelihood function. Score function <span>&#92;(= \nabla _ \lambda \log u_ \lambda (X) = \nabla _ \lambda \log P(x | u _ \lambda) &#92;)</span>

Let <span>&#92;(X &#92;)</span> be the set of D-dimensional local descriptors extracted from an image (e.g. SIFT)

<span>&#92;[
    g _ \lambda^X = \sum _ {t=1}^T L _ \lambda \nabla _ \lambda \log u _ \lambda (x _ t)
&#92;]</span>
This is called Fisher Vector. Fisher Vector is a sum of normalized gradients statistics computed for each descriptor (= feature vector). The operation
<span>&#92;[
    x _ t \to f _ {FK}(x _ t) = L _ \lambda \nabla _ \lambda \log u _ \lambda ( x _ t)
&#92;]</span>
is an embedding of local descriptors <span>&#92;(x _ t &#92;)</span> in a higher dimensional space which is easier for classifier.

<span>&#92;(L _ \lambda &#92;)</span>: Cholesky Decomposition
<span>&#92;[
    F _ \lambda ^{-1} = L _ \lambda ^ T L _ \lambda, \qquad K _ {FK}(X,Y) = G _ \lambda ^{X^T} F _ \lambda G _ \lambda ^{X}
&#92;]</span>
where <span>&#92;(K _ {FK} &#92;)</span> is the Fisher Kernel.

## VLAD
Vector for locally aggregated descriptors

How to recognize images? Bag of Visual Words (BoVW)

![there should be a image...](/pics/522/vword.png)

Given an image <span>&#92;(I &#92;)</span>, divide it into small cell/windows of size <span>&#92;(n \times n &#92;)</span> (i.e. 16x16). We vectorize visual words for convenient calculations.

**Theory**: you got a image, apply BoVW, and get millions of visual words, and give that to a classifier, and classifier says that's a cat

**Practice**:
- too many vectors
- redundancy
- noise

**General Approach**: Build a codebook (dictionary) <span>&#92;(C = &#92;left&#92;{ c _ 1,\ldots,c _ n &#92;right&#92;} &#92;)</span> from <span>&#92;(m\gg n &#92;)</span> feature vectors (vectorized visual words)

**Idea**: Use a clustering algorithm like k-means. (<span>&#92;(C _ i &#92;)</span>) is the centre of <span>&#92;(n &#92;)</span> classes found in the data.

**Core Idea of VLAD**: Accumulate, for each visual word <span>&#92;(C _ i &#92;)</span>, the difference of the vectors <span>&#92;(X &#92;)</span> assigned to <span>&#92;(C _ i &#92;)</span>, <span>&#92;(X - C _ i &#92;)</span>, i.e., distribution of data w.r.t. the class centers.

<span>&#92;[
    V _ {i,j}=\sum _ {NN(X)=C_i} X _ j - C _ {i,j}
&#92;]</span>
Here NN is the nearest neighbor. <span>&#92;(X _ j &#92;)</span> is the <span>&#92;(j &#92;)</span>-th component of descriptor. <span>&#92;(C _ {i,j} &#92;)</span> is the corresponding center

Here we do a <span>&#92;(L _ 2 &#92;)</span> normalization.
<span>&#92;(
    V : = {V\over \&#124; V\&#124; _ 2}
&#92;)</span>

Final Chain
![there should be a image...](/pics/522/finalchain.png)

# Lecture 6
How to validate AI algorithms? [How do I use Turing Test in practice?]
- We get the data
- We train our algorithms:
    - how do we know it has learned what is was supposed to learn?
    - We should test it! If good enough, then release it! How do we make sure of this?

First factor to make sure that is good enough is to have target/objective function:
- error (minimize)
- reward (maximize)
- fitness (maximize)
- punishment (minimize)

Given the entire data <span>&#92;(X = &#92;left&#92;{ x _ t &#92;right&#92;} &#92;)</span>

![there should be a image...](/pics/522/super.png)

Given the set of all hypotheses <span>&#92;(H &#92;)</span> (set of all possible solutions), find <span>&#92;(h\in H &#92;)</span> such that
<span>&#92;[
    \sum _ {x _ t\in X} (x _ t^* - x _ t ^ d) = \epsilon \to 0
&#92;]</span>
which is supervised. This constitutes a good fit for the model <span>&#92;(h &#92;)</span> into <span>&#92;(X &#92;)</span>. Any concern?

**Scenario #1**: you have your complex data and simple solution, then you train. It does not converge. Problem is big/non-linear/non-stationary. Solution (hypothesis) is not capable of capturing the complexity.
![there should be a image...](/pics/522/scen1.png)

**Scenario #2**: Problem is small/linear/stationary. Solution is too big such that is completely owns the problem. h is memorizing X.

![there should be a image...](/pics/522/scen2.png)

What is the ultimate sign that the algorithm has really learned? It can generalize the inherent X-Y relationship to "unseen" data.

Validation = test for generalization. Idea: keep one part of data for testing. But this may not be reliable! The split may be lucky/unfortunate. So we have K-fold partition.

Random Sampling, K-fold cross validation:
![there should be a image...](/pics/522/randomsamp.png)

But all this would work if we had a lot of data. What if we don't? We use Leave-one-Out validation.

n-fold cross validation: vert expensive, suitable for small data.

Model complexity = <span>&#92;(&#124;P &#124; &#92;)</span> where <span>&#92;(P &#92;)</span> is the set of parameters of <span>&#92;(h\in H &#92;)</span>. Occam's Razor: Keep it simple! = Regularization
<span>&#92;[
    \min \left( \underbrace{\sum _ {x _ t\in X} (x _ t^* - x _ t^d)} _ {\text{lowest error}} + \underbrace{&#124;P &#124;} _ {\text{smallest solution}}\right)
&#92;]</span>

Augmented error function:
<span>&#92;[
    E' = E _ {total} + \underbrace{\lambda \cdot \text{model complexity}} _ {\substack {\text{penalized complex}&#92;&#92; \text{solutions with} &#92;&#92;
    \text{large variance}}}
&#92;]</span>

If <span>&#92;(\lambda &#92;)</span> too large, then simple models, then increase bias. Hence we use cross validation to optimize <span>&#92;(\lambda &#92;)</span>.

Another model selection approach: Bayesian approach is used if we have prior knowledge.

Bayes Rule:
<span>&#92;[
    P (model &#124; data) = {P(data &#124; model) \cdot P(model)\over P(data)}
&#92;]</span>

Other methods:
- Structural risk minimization
- Minimum description length

![there should be a image...](/pics/522/smallbig.png)

# Lecture 7 - Clustering

idea: Intelligence is the capability of grouping similar objects. Clustering groups "unlabeled" data into "clusters" of similar inputs.

Are clusters well-separated? Are clusters linearly separable?

Difficulties: overlaps / complicated shapes

Clustering algorithms can be divided into 2 types
- need # of clusters
- don't need it

## K-means

We start with K-means algorithm: find the centroids (prototypes)(means) of K clusters
1. Randomly place K centroids
2. Assign each data point to its closest cluster K
3. Update the centroids

![there should be a image...](/pics/522/centroid.png)

Similarity grouping happens via distance measurement. So objective (error):
<span>&#92;[
    E = \sum _ {k=1} ^K \sum _{x\in C _ k} \&#124;x-m _ k\&#124; _ 2
&#92;]</span>
where <span>&#92;(m _ k &#92;)</span> is the centroid of <span>&#92;(k &#92;)</span>-th cluster. Minimize the sum of squared errors to its prototype in each cluster.

When you do the update, centroids are the average of all <span>&#92;(x\in C _ k &#92;)</span> for <span>&#92;(k \in &#92;left&#92;{ 1,2,\ldots, K &#92;right&#92;} &#92;)</span>. Stopping:
1. after some iterations
2. when centroids don't change anymore
3. when few/no data points change cluster

Problems of K-means:
1. Needs K
2. Outlier sensitive
3. Hard clustering

![there should be a image...](/pics/522/hard-cluster.png)

Clustering is unsupervised learning.

## SOM
Use processing units (neurons) to place centroids on an adjustable map: Self-Organizing Maps (SOM). Hypothesis: The model self-organizes based on learning rules and interactions. Processing units maintain proximity relationships as they grow. This is so-called Kohonen Map.

![there should be a image...](/pics/522/SOM.png)
The input is connected with each unit (neuron) of a lattice (map).

Concept of neighborhood:
![there should be a image...](/pics/522/nbr.png)

Goals:
- find weight values such that adjacent units have similar values.
- inputs are assigned to units that are similar to them
- each unit becomes the center of a cluster

Basically SOM is constrained K-means.

Given input <span>&#92;(X &#92;)</span>, find the <span>&#92;(i &#92;)</span>-th unit with closest weight vector by competition. <span>&#92;(w _ i ^T x &#92;)</span> will be maximum.

For each unit <span>&#92;(j &#92;)</span> in the neighborhood <span>&#92;(N(i) &#92;)</span> of the winning neuron <span>&#92;(i &#92;)</span>, we update the weights of <span>&#92;(j &#92;)</span>(<span>&#92;(w _ j &#92;)</span>)

Weights outside of <span>&#92;(N(i) &#92;)</span> are not updated

SOM has 3 stages: 1. competition. 2. collaboration: concept of neighborhood. 3. Weight update.

Competition: find the most similar unit: <span>&#92;(i(x) = \operatorname{argmax} _ j \&#124; x - w _ j \&#124; _ 2 &#92;)</span>, where <span>&#92;(j=1,\ldots,m; &#92;)</span> <span>&#92;(m &#92;)</span> = # of units.

Collaboration: Use the lateral distance <span>&#92;(d _ {ij} &#92;)</span> between the winner unit <span>&#92;(i &#92;)</span> and unit <span>&#92;(j &#92;)</span>
<span>&#92;[
    h _ {ij} (d _ {ij}) = \exp \left(- {d _ {ij}^2\over 2\sigma^2}\right)
&#92;]</span>

![there should be a image...](/pics/522/gauss.png)

Weight updates:
<span>&#92;[
    W _ j (n+1)= W _ j(n) + \Delta W _ j
&#92;]</span>
where <span>&#92;(\Delta W _ j = \underbrace{\eta y_ j } _ {\text{Hebb's Rule}} - \underbrace{g(y _ j) w _ j}_{\text {Forgetting rule}} &#92;)</span>. So complete formula for update:
<span>&#92;[
    W _ j (n+1)= W _ j(n) + \eta (n) h _ {ij(x)}(n)[x-w _ j(n)]
&#92;]</span>
where <span>&#92;(\eta(n) = \eta _ 0\exp(- {n\over T _ 2}) &#92;)</span>

Convergence: many iterations! (e.g., several thousands times the number of units)

Stopping:
- no noticeable change
- No big change in the feature map

Problems:
- convergence may take a long time
- variable results

# Lecture 8
Classification: Intelligence is to distinguish things.

## Support Vector Machines
SVM

![there should be a image...](/pics/522/svm.png)

Assumption: classes <span>&#92;(\in &#92;left&#92;{ \oplus, \ominus &#92;right&#92;} &#92;)</span>. And <span>&#92;(w\cdot x _ \oplus + b \ge 1, w\cdot x _ \ominus + b \le -1 &#92;)</span>

Also introduce a dummy variable: <span>&#92;(y _ i = &#92;begin{cases}
+1 & &#92;text{for }\oplus  &#92;&#92;
  -1 & &#92;text{for } \ominus
&#92;end{cases} &#92;)</span>. Thus for all <span>&#92;(\oplus, \ominus &#92;)</span>,
<span>&#92;[y _ i (w\cdot w + b)-1\ge 0 &#92;]</span>
Best classification: the largest margin!

<span>&#92;[
    &#92;begin{aligned}
    (x _ \oplus - x _ \ominus) \cdot {w\over \&#124; w\&#124;} = {(1-b)+(1+b)\over \&#124; w\&#124;} = {2\over \&#124; w\&#124;}
    &#92;end{aligned}
&#92;]</span>
So we want maximize <span>&#92;({1\over \&#124; w\&#124;} &#92;)</span>, then minimize <span>&#92;({\&#124; w\&#124;} &#92;)</span>.

So our problem: <span>&#92;(\min \&#124; w\&#124; \quad \text{subject to }\quad y _ i(w\cdot x _ i + b)-1\ge 0 &#92;)</span>.

Lagrange Multipliers: <span>&#92;(L = {1\over 2} \&#124;w\&#124;^2 - \sum \alpha _ i[ y _ i (w\cdot x _ i + b) - 1] &#92;)</span>

Derivatives are zero, then we get <span>&#92;(w=\sum _ i \alpha _ i y _ i x _ i &#92;)</span>, and <span>&#92;(\sum \alpha _ i y _ i = 0 &#92;)</span>. Sub <span>&#92;(w &#92;)</span> in <span>&#92;(L &#92;)</span>, we get after simplification:
<span>&#92;[
    L =\sum \alpha _ i - {1\over 2}\sum \sum \underbrace{ \alpha _ j y _ i y _ j} _ {\text{scalars}} \underbrace{x _ i \cdot x _ k} _ {\text{dot product}}
&#92;]</span>
Minimize this via quadratic optimization! Then how to classify?
<span>&#92;[
    \sum \alpha _ i y _ i x _ i\cdot \underbrace{u} _ {\text{new data}} + b &#92;begin{cases}
     \ge 0 &\implies \oplus  &#92;&#92;
      &#92;text{otherwise} & \implies\ominus
    &#92;end{cases}
&#92;]</span>
SVM only works for binary, linearly separable problems.

XOR is a non-linear problem, however, we can do transformations.
![there should be a image...](/pics/522/xor.png)

Trick! Assume <span>&#92;(T(x) &#92;)</span> is a transform that moves <span>&#92;(x &#92;)</span> to higher dimensions and making linear separation possible, then we have to calculate <span>&#92;(T(x _ i)\cdot T(u) &#92;)</span>. But these would be difficult! If we had a function <span>&#92;(K (x_ i , x _ j)&#92;)</span> such that <span>&#92;(K (x _ i, x _ j) = T(x _ i)\cdot T( x _ j) &#92;)</span>, then we won't need <span>&#92;(T &#92;)</span>. All we need is a "Kernel" function <span>&#92;(K &#92;)</span>. We do not need <span>&#92;(T(x) &#92;)</span>! We just need to get <span>&#92;(T (x _ i) \cdot T(x _ j) &#92;)</span>, and **not** <span>&#92;(T(x _ i) &#92;)</span> and <span>&#92;(T(x _ j) &#92;)</span> individually. This is called **The Kernel Trick**.

Popular kernels:
- <span>&#92;(K(u,v) = (u\cdot v+1)^n &#92;)</span>
- <span>&#92;(K(u,v)=\exp(-{\&#124;u-v\&#124;\over \sigma}) &#92;)</span>

# Lecture 9
## Cluster Validity
How do we know the clusters are valid? or, at least, good enough?

Desirable:
1. High inter-class separation
2. High intra-class homogeneity

Define "index of validity" that uses:
1. sum-of-squares within cluster (SSW) = <span>&#92;(\sum _ {i=1}^N \&#124;x _ i - C _ {p _ i}\&#124;^2 &#92;)</span>, where we have <span>&#92;(N &#92;)</span> data points, and <span>&#92;(C _ {p _ i} &#92;)</span> is class prototype for the <span>&#92;(i &#92;)</span>-th data isntance <span>&#92;(x _ i  &#92;)</span>
2. sum-of-squares between clusters (SSB) = <span>&#92;(\sum _ {i=1}^M n _ i\&#124;c _ i - \bar x \&#124;^2 &#92;)</span>, where we have <span>&#92;(M &#92;)</span> clusters, <span>&#92;(n _ i &#92;)</span> is the number of elements in cluster, <span>&#92;(c _ i &#92;)</span> is the current class mean. and <span>&#92;(\bar x &#92;)</span> is mean of means.

SSW and SSB are part of ANOVA (analysis of variance).

Other cluster validity measures:
- Calinski-Harbusz Index <span>&#92;(CH = \dfrac{SSB / (M-1)}{SSW/(N_M)} &#92;)</span>
- Hartigen Index <span>&#92;(H = \left(\dfrac{SSW _ M}{SSW _ {M+1}}-1\right)(N-M-1) &#92;)</span> or <span>&#92;(H = \log _ 2 \dfrac{SSB}{SSW} &#92;)</span>
- Dunn's Index
<span>&#92;[
    D = {
\min _ {i=1} ^M \min _ {j=i+1}^M d(c _ i,c _ j) \over
        \max _ {k=1} ^M diam(c _ k)
    }
&#92;]</span>
where <span>&#92;(d (c _ i,c _ j)= \min _ {x\in c _ i,x'\in c _ j}\&#124;x-x'\&#124;^2 &#92;)</span>, and <span>&#92;(diam(c _ k) = \max _ {x,x'\in c _ k}\&#124;x-x'\&#124;^2 &#92;)</span>
- WB Index <span>&#92;(WB _ M = M\cdot {SSW\over SSB} &#92;)</span>

We have other problems: We made a big assumption: <span>&#92;(x _ i\in C _ k &#92;)</span> and <span>&#92;(x _ i\notin C _ j \quad \forall j\ne k &#92;)</span>. This is hard/dual/crisp clustering.
<span>&#92;[
    \mu _ k (x _ i)\in &#92;left&#92;{ 0,1 &#92;right&#92;} \implies \mu _ k(x _ i)\notin [0,1]
&#92;]</span>

AI deals with imperfect info.

![there should be a image...](/pics/522/imperfect.png)
## A bit of Set theory
<span>&#92;(X = &#92;left&#92;{ x &#92;right&#92;} &#92;)</span> universe of discourse

characteristic function of <span>&#92;(A: f _ A(x)=&#92;begin{cases}
1 & &#92;text{if }x\in A  &#92;&#92;
0   & &#92;text{otherwise}
&#92;end{cases} &#92;)</span>

Logical Laws:
1. The Law of Non-Contradiction: <span>&#92;(A\cap \bar A = \emptyset &#92;)</span>
2. The Law of Excluded Middle: <span>&#92;(A\cup \bar A =X &#92;)</span>

## Fuzzy Sets
<span>&#92;(A = &#92;left&#92;{ (x,\mu _ A(x)) &#124; x\in X, \mu _ A(x)\in [0,1] &#92;right&#92;} &#92;)</span>
or we write <span>&#92;(A = \int _ X {\mu _ A(x)\over X} &#92;)</span>

Simple example: <span>&#92;(X=&#92;left&#92;{ 1,2,\ldots,7 &#92;right&#92;} &#92;)</span>, and we define <span>&#92;(A =  &#92;)</span> "set of neighbors of 4"

<span>&#92;(A _ {crisp} = &#92;left&#92;{ 3,4,5 &#92;right&#92;} &#92;)</span> whereas
<span>&#92;[
    A _ {Fuzzy} = &#92;left&#92;{
{0.3\over 1}, {0.7\over 2}, {1\over 3}, {1\over 4}, {1\over 5}, {0.7\over 6}, {0.3\over 7}
     &#92;right&#92;}
&#92;]</span>
Membership is similarity, intensity, probability, approximation, compatibility.

![there should be a image...](/pics/522/fuzzy.png)

How do we measure fuzziness?

<span>&#92;[
    \gamma = \text{fuzziness} = {1\over N}\sum_ i \min (\mu _ A(x _ i), 1 - \mu _ A( x _ i))
&#92;]</span>

![there should be a image...](/pics/522/fuzziness.png)

## Fuzzy C-Means
FCM
1. Initialize (# of clusters <span>&#92;(M &#92;)</span>, fuzzifier <span>&#92;(m &#92;)</span>, membership function <span>&#92;(\mu &#92;)</span>)
2. Cluster Centers
<span>&#92;[
    C _ i = {
        \sum _ {k=1}^n (\mu _ {ik})^m x _ k\over
        \sum _ {k=1}^n (\mu _ {ik})^m
    }
&#92;]</span>
3. Update Memberships
<span>&#92;[
    \mu _ {ik} = {1\over
\sum _ {j=1}^M \left(d _ {ik}\over d _ {jk}\right)^{2\over m-1}
    }
&#92;]</span>
4. Stopping criterion
<span>&#92;[
    \&#124; \underbrace{U^{current}} _ {\text{Fuzzy Partition}} - U^{before}\&#124;
&#92;]</span>
