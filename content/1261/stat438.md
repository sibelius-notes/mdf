---
title: "STAT 438: Advanced Methods in Biostatistics"
subjects: "STAT"
prof: "Glen McGee"
---

## Sources and References
**Primary texts** — Hernán & Robins (2020) *Causal Inference: What If* (https://miguelhernan.org/whatifbook); Little & Rubin (2020) *Statistical Analysis with Missing Data* 3rd ed
**Supplementary texts** — Pearl (2009) *Causality: Models, Reasoning, and Inference* 2nd ed; Rosenbaum (2017) *Observation and Experiment: An Introduction to Causal Inference*; VanderWeele (2015) *Explanation in Causal Inference*; Buonaccorsi (2010) *Measurement Error: Models, Methods, and Applications*

---

# Chapter 1: The Causal Inference Framework

## 1.1 Why Causal Thinking Matters in Biostatistics

Classical statistics provides tools for describing associations between variables, but association is not causation. Epidemiology and biomedical research are ultimately concerned with questions of the form: *What would happen to a patient's outcome if we intervened to change their treatment?* These are inherently causal questions, and answering them requires a formal framework that goes beyond regression and correlation.

The **potential outcomes framework**, developed by Neyman (1923) for randomized experiments and extended by Rubin (1974) to observational studies, provides the mathematical language for causal inference. The framework defines causal effects as comparisons between outcomes that *would have been observed* under different treatment assignments — only one of which is actually observed for any given individual.

Glen McGee's STAT 438 is organized around two complementary approaches: the Rubin potential outcomes framework and Pearl's directed acyclic graphs (DAGs). These are mathematically equivalent under standard assumptions but offer different intuitions and tools for researchers.

## 1.2 Potential Outcomes Notation

Let \( A \) denote a binary treatment (e.g., \( A = 1 \) for treated, \( A = 0 \) for untreated) and let \( Y \) denote an outcome of interest (continuous, binary, or survival time).

<div class="definition">
<strong>Potential outcome</strong>: \( Y^a \) is the outcome that <em>would</em> be observed for a unit if, possibly contrary to fact, that unit received treatment level \( a \). For binary treatment, each unit has two potential outcomes: \( Y^1 \) (under treatment) and \( Y^0 \) (under no treatment).
</div>

The fundamental problem of causal inference is that for any individual, we can observe at most one potential outcome — the one corresponding to the treatment actually received. The unobserved potential outcome is called the **counterfactual**.

### 1.2.1 The Consistency Assumption

For causal effects to be identified from observed data, we require that the observed outcome equals the potential outcome under the treatment that was actually received:

\[ Y = Y^A \]

More precisely, for individual \( i \): \( Y_i = Y_i^{A_i} \). This is sometimes called the **consistency assumption** or the **no multiple versions of treatment** condition. It requires that:

1. The treatment is well-defined (no ambiguity about what \( A = 1 \) means).
2. The mechanism of treatment delivery does not affect the outcome (only the treatment value matters, not how it was administered).

Consistency is part of the **Stable Unit Treatment Value Assumption (SUTVA)** introduced by Rubin (1980).

### 1.2.2 SUTVA in Detail

<div class="definition">
<strong>SUTVA (Stable Unit Treatment Value Assumption)</strong> consists of two components:
<ol>
<li><strong>No interference</strong>: The potential outcomes of unit \( i \) do not depend on the treatment assignment of any other unit \( j \neq i \). Formally, \( Y_i^{a_1, \ldots, a_n} = Y_i^{a_i} \).</li>
<li><strong>No multiple versions of treatment</strong>: There is only one version of each treatment level. Receiving \( A = 1 \) via different routes produces the same potential outcome.</li>
</ol>
SUTVA is violated in settings with <em>interference</em> (e.g., vaccine herd immunity, household transmission studies) or when treatment is poorly defined (e.g., "exercise" without a specific protocol).
</div>

## 1.3 Causal Effects: Definitions and Estimands

### 1.3.1 Individual and Average Causal Effects

The **individual causal effect** for unit \( i \) is:
\[ \text{ICE}_i = Y_i^1 - Y_i^0 \]

Since we can never observe both \( Y_i^1 \) and \( Y_i^0 \) for the same individual, individual causal effects are fundamentally unidentifiable without additional assumptions.

Instead, we target population-level estimands.

<div class="definition">
<strong>Average Treatment Effect (ATE)</strong>: The expected difference in potential outcomes across the entire population:
\[ \text{ATE} = E[Y^1 - Y^0] = E[Y^1] - E[Y^0] \]
This answers: "What would happen on average if we moved everyone in the population from \( A=0 \) to \( A=1 \)?"
</div>

<div class="definition">
<strong>Average Treatment Effect in the Treated (ATT)</strong>: The expected difference in potential outcomes among those who actually received treatment:
\[ \text{ATT} = E[Y^1 - Y^0 \mid A = 1] = E[Y^1 \mid A = 1] - E[Y^0 \mid A = 1] \]
The counterfactual component \( E[Y^0 \mid A = 1] \) — what would have happened to the treated had they not been treated — is unobserved and must be estimated.
</div>

### 1.3.2 Causal Effects vs. Associational Parameters

The **associational risk difference** is:
\[ E[Y \mid A = 1] - E[Y \mid A = 0] \]

This equals the ATE only when treated and untreated groups are **exchangeable** — i.e., when treatment assignment is independent of potential outcomes.

In an observational study, \( E[Y \mid A = 1] - E[Y \mid A = 0] \neq \text{ATE} \) in general, because sicker patients may be more likely to receive treatment (**confounding**), healthier patients may be more likely to be in the study (**selection bias**), or outcomes may be inaccurately measured (**information bias**).

**Example**: Suppose \( A = 1 \) represents hospitalization and \( Y = 1 \) represents death within 30 days. Hospitalized patients appear to have higher mortality. But this is because the sickest patients are hospitalized — if the same hospitalized patients had not been hospitalized, their mortality would have been even higher. The associational estimator is severely confounded.

## 1.4 Identification Conditions

To identify the ATE \( E[Y^1] - E[Y^0] \) from observed data \( (Y, A, \mathbf{L}) \), we require three conditions:

### 1.4.1 Exchangeability (Ignorability)

<div class="definition">
<strong>Marginal exchangeability</strong>: \( Y^a \perp A \) for all \( a \). The treated and untreated groups have the same distribution of potential outcomes. This holds in perfectly randomized experiments with no noncompliance.
</div>

<div class="definition">
<strong>Conditional exchangeability (ignorability)</strong>: \( Y^a \perp A \mid \mathbf{L} \) for all \( a \). Given the measured covariates \( \mathbf{L} \), treatment assignment is independent of potential outcomes. Equivalently, all confounders are measured and included in \( \mathbf{L} \).
</div>

Conditional exchangeability is also called the **no unmeasured confounders** assumption or **ignorability** (Rosenbaum & Rubin, 1983). It is untestable from observed data alone — it is a substantive scientific assumption about what variables drive treatment assignment.

### 1.4.2 Positivity

<div class="definition">
<strong>Positivity</strong>: For every level \( \ell \) of \( \mathbf{L} \) with positive probability, both treatment levels have positive probability:
\[ P(A = a \mid \mathbf{L} = \ell) > 0 \quad \text{for all } a, \ell \text{ with } P(\mathbf{L} = \ell) > 0 \]
</div>

Without positivity, we cannot estimate the effect of \( A = a \) for subgroups where \( A = a \) never occurs. This is called **structural non-positivity** (certain treatments are impossible for some patient types) or **random non-positivity** (finite-sample sparsity). Violations lead to extreme IPW weights and instability.

### 1.4.3 Consistency (Revisited)

As defined in Section 1.2.1: \( Y = Y^A \) (observed outcome equals potential outcome under actual treatment received).

### 1.4.4 Identification Result

Under consistency, conditional exchangeability, and positivity, the average potential outcome is identified:

\[ E[Y^a] = E_{\mathbf{L}}\left[ E[Y \mid A = a, \mathbf{L}] \right] = \sum_\ell E[Y \mid A = a, \mathbf{L} = \ell] \, P(\mathbf{L} = \ell) \]

This is the **g-formula** (Robins, 1986). The ATE then follows as:
\[ \text{ATE} = E[Y^1] - E[Y^0] = \sum_\ell \left\{ E[Y \mid A=1, \mathbf{L}=\ell] - E[Y \mid A=0, \mathbf{L}=\ell] \right\} P(\mathbf{L}=\ell) \]

## 1.5 Randomized Experiments

In a **completely randomized experiment**, treatment is assigned by a known random mechanism independent of all subject characteristics (baseline or potential outcomes). As a result:

- Marginal exchangeability holds: \( Y^a \perp A \)
- Positivity holds by design (each unit has positive probability of receiving each treatment)
- Consistency holds if the treatment is well-defined

Under marginal exchangeability:
\[ E[Y^1] - E[Y^0] = E[Y \mid A=1] - E[Y \mid A=0] \]

The simple difference in means is an unbiased estimator of the ATE.

In **stratified** or **covariate-adaptive** randomized experiments, randomization is conditional on \( \mathbf{L} \), so conditional exchangeability holds, and the g-formula applies (with efficiency gains from covariate adjustment).

## 1.6 Observational Studies

In an **observational study**, the investigator does not control treatment assignment. Patients (or subjects) select or are assigned to treatments based on factors that may also affect the outcome. This creates **confounding**.

Rosenbaum (2017) defines an observational study as a study in which the investigator has no control over who receives treatment, yet the goal is to draw causal conclusions. The validity of causal inference in observational studies rests on untestable assumptions (conditional exchangeability) that must be justified by domain knowledge.

The key challenge: distinguish between:
- **Confounders** \( \mathbf{L} \): measured variables that affect both \( A \) and \( Y \)
- **Unmeasured confounders** \( \mathbf{U} \): variables affecting both \( A \) and \( Y \) that are not in the data

Controlling for measured confounders via regression, matching, or weighting can remove measured confounding but cannot address unmeasured confounding.

---

# Chapter 2: Directed Acyclic Graphs

## 2.1 DAGs as Causal Models

A **Directed Acyclic Graph (DAG)** is a graphical representation of causal assumptions about the data-generating process. Introduced to causal inference by Pearl (1995, 2009), DAGs provide a visual language for encoding and reasoning about causal structure.

<div class="definition">
<strong>DAG</strong>: A graph \( \mathcal{G} = (V, E) \) where \( V \) is a set of nodes (variables) and \( E \) is a set of directed edges (arrows) such that there are no directed cycles (no variable is its own ancestor).
</div>

In a causal DAG:
- Each node represents a random variable
- A directed edge \( X \to Y \) encodes the claim that \( X \) is a <em>direct cause</em> of \( Y \) in the context of the other variables
- The absence of an edge encodes that there is no direct causal effect (conditional independence given parents)

## 2.2 Markov Condition and Faithfulness

<div class="definition">
<strong>Causal Markov Condition</strong>: Each variable in the DAG is independent of its non-descendants given its parents. Formally, for variable \( X \) with parent set \( \text{pa}(X) \):
\[ X \perp \text{nd}(X) \mid \text{pa}(X) \]
where \( \text{nd}(X) \) denotes the non-descendants of \( X \).
</div>

<div class="definition">
<strong>Faithfulness</strong>: Every conditional independence in the data distribution corresponds to a d-separation in the DAG (no "accidental" independences due to parameter cancellations).
</div>

Together, the Markov condition and faithfulness imply that the conditional independence structure of the observed data exactly corresponds to the d-separation relations in the DAG. This allows us to read independence/dependence from the graph.

## 2.3 Paths and D-Separation

### 2.3.1 Types of Paths

A **path** between variables \( X \) and \( Y \) is any sequence of nodes connected by edges (ignoring direction). Several types of paths matter for causal reasoning:

- **Directed (causal) path**: \( X \to \cdots \to Y \) — a sequence of edges all pointing from \( X \) toward \( Y \)
- **Backdoor path**: A path from \( X \) to \( Y \) that begins with an arrow *into* \( X \) (i.e., starts as \( X \leftarrow \cdots \))
- **Front-door path**: A directed path \( X \to M \to Y \) through a mediator

### 2.3.2 Colliders and Non-Colliders

At any intermediate node \( Z \) on a path between \( X \) and \( Y \):

<div class="definition">
<strong>Collider</strong>: \( Z \) is a <em>collider</em> on the path if both edges on the path point into \( Z \): \( \cdots \to Z \leftarrow \cdots \). A collider blocks information flow along its path (by default). Conditioning on a collider or its descendant <em>opens</em> the path.
</div>

<div class="definition">
<strong>Non-collider (fork or chain)</strong>: \( Z \) is a <em>non-collider</em> if the path passes through \( Z \) as a chain (\( \to Z \to \)) or a fork (\( \leftarrow Z \to \)). Non-colliders transmit information. Conditioning on a non-collider <em>blocks</em> the path.
</div>

### 2.3.3 D-Separation (Bayes Ball Algorithm)

<div class="definition">
<strong>D-separation</strong>: Two sets of variables \( X \) and \( Y \) are <em>d-separated</em> by a conditioning set \( Z \) (written \( X \perp_d Y \mid Z \)) if every path between any \( x \in X \) and \( y \in Y \) is <em>blocked</em> given \( Z \). A path is blocked given \( Z \) if:
<ol>
<li>It contains a non-collider that is in \( Z \), <strong>or</strong></li>
<li>It contains a collider that is not in \( Z \) and has no descendant in \( Z \).</li>
</ol>
Under the Markov condition and faithfulness, \( X \perp_d Y \mid Z \) implies \( X \perp Y \mid Z \) in the distribution.
</div>

**Bayes Ball Algorithm** (Shachter 1998): To determine whether \( X \) and \( Y \) are d-separated given \( Z \), imagine a "ball" that travels along paths:
1. The ball passes through non-colliders unless they are in \( Z \)
2. The ball is blocked at colliders unless the collider (or a descendant) is in \( Z \)

If no ball can travel from \( X \) to \( Y \), they are d-separated.

## 2.4 Backdoor Criterion

The backdoor criterion formalizes when a set of variables \( \mathbf{L} \) is sufficient to control for confounding when estimating the causal effect of \( A \) on \( Y \).

<div class="definition">
<strong>Backdoor criterion</strong> (Pearl, 1993): A set \( \mathbf{L} \) satisfies the backdoor criterion relative to the ordered pair \( (A, Y) \) if:
<ol>
<li>No node in \( \mathbf{L} \) is a descendant of \( A \).</li>
<li>\( \mathbf{L} \) blocks every backdoor path from \( A \) to \( Y \) (paths that begin with an arrow into \( A \)).</li>
</ol>
If \( \mathbf{L} \) satisfies the backdoor criterion, then:
\[ P(Y^a = y) = \sum_\ell P(Y = y \mid A = a, \mathbf{L} = \ell)\, P(\mathbf{L} = \ell) \]
</div>

**Proof sketch**: Under the backdoor criterion, conditioning on \( \mathbf{L} \) blocks all backdoor paths from \( A \) to \( Y \) without opening new paths through descendants of \( A \). By the rules of d-separation and the Markov condition, this induces \( Y^a \perp A \mid \mathbf{L} \), which is conditional exchangeability. The identification formula then follows by iterated expectations.

More precisely, the backdoor criterion guarantees:
\[ P(Y^a = y \mid \mathbf{L} = \ell) = P(Y = y \mid A = a, \mathbf{L} = \ell) \]
Marginalizing over \( \mathbf{L} \) gives the g-formula.

## 2.5 Common Causal Structures

### 2.5.1 Confounding

The simplest confounding structure:
\[ L \to A \to Y \quad \text{and} \quad L \to Y \]

Here \( L \) is a common cause of \( A \) and \( Y \), creating a backdoor path \( A \leftarrow L \to Y \). Conditioning on \( L \) blocks this path and satisfies the backdoor criterion.

### 2.5.2 Mediation

In mediation analysis:
\[ A \to M \to Y \quad \text{and} \quad A \to Y \]

where \( M \) is a mediator on the causal path from \( A \) to \( Y \). Here conditioning on \( M \) blocks the causal path through \( M \) — a phenomenon called **over-adjustment** or **collider bias** if \( M \) is a collider on another path. The total effect is estimated by the g-formula without conditioning on \( M \); the direct effect requires additional assumptions.

### 2.5.3 Collider Bias (Selection Bias)

Consider:
\[ A \to C \leftarrow Y \]

\( C \) is a collider of \( A \) and \( Y \). By default, \( A \) and \( Y \) are d-separated (independent). But conditioning on \( C \) opens this path, inducing spurious association — this is **collider bias** or **Berkson's bias**. In epidemiology, if \( C \) represents study enrollment, conditioning on \( C \) (by studying only enrolled subjects) creates selection bias.

### 2.5.4 M-Bias

<div class="definition">
<strong>M-bias</strong>: A scenario where the naive analyst controls for a pre-treatment variable that is actually a collider, thereby <em>introducing</em> confounding. Example:
</div>

\[ U_1 \to C \leftarrow U_2, \quad U_1 \to A, \quad U_2 \to Y \]

Here \( C \) is a collider of two unmeasured common causes. Without conditioning on \( C \), the path \( A \leftarrow U_1 \to C \leftarrow U_2 \to Y \) is blocked (the collider \( C \) is not conditioned on). Conditioning on \( C \) opens this path, creating spurious confounding. The "M" shape in the DAG gives the bias its name.

**Implication**: In practice, one should not reflexively include all pre-treatment variables as controls. Variables that are colliders of unmeasured confounders can induce bias if conditioned on.

## 2.6 Front-Door Criterion

When the backdoor criterion cannot be satisfied (unmeasured confounders between \( A \) and \( Y \)), the **front-door criterion** may provide identification via a mediator.

<div class="definition">
<strong>Front-door criterion</strong> (Pearl, 1995): A set \( M \) satisfies the front-door criterion relative to \( (A, Y) \) if:
<ol>
<li>\( M \) intercepts all directed paths from \( A \) to \( Y \) (i.e., all causal paths go through \( M \)).</li>
<li>There are no unblocked backdoor paths from \( A \) to \( M \).</li>
<li>All backdoor paths from \( M \) to \( Y \) are blocked by \( A \).</li>
</ol>
The front-door adjustment formula:
\[ P(Y^a = y) = \sum_m P(M = m \mid A = a) \sum_{a'} P(Y = y \mid A = a', M = m)\, P(A = a') \]
</div>

**Classic example**: Smoking \( (A) \) → tar deposits \( (M) \) → lung cancer \( (Y) \), with unmeasured genotype \( U \) affecting both smoking and lung cancer. Even though \( U \) confounds \( A \leftrightarrow Y \), the front-door formula identifies the causal effect.

## 2.7 Time-Varying DAGs

When treatments and confounders vary over time, DAGs must encode temporal ordering. A time-varying DAG represents:
- \( L_t \): time-varying covariate at time \( t \)
- \( A_t \): treatment at time \( t \)
- \( Y \): final outcome

Key structure: \( A_{t-1} \to L_t \to A_t \to Y \). Here \( L_t \) is simultaneously a **confounder** (affects \( A_t \) and \( Y \)) and a **mediator** (on the path \( A_{t-1} \to L_t \to Y \)). This creates a fundamental problem for conventional regression, addressed in Chapter 4.

---

# Chapter 3: Standardization and Inverse Probability Weighting

## 3.1 Standardization (G-Computation)

**Standardization** (also called the **g-formula** or **g-computation**) estimates \( E[Y^a] \) by averaging the conditional expectation \( E[Y \mid A=a, \mathbf{L}=\ell] \) over the marginal distribution of \( \mathbf{L} \):

\[ \hat{E}[Y^a] = \frac{1}{n} \sum_{i=1}^n \hat{E}[Y \mid A = a, \mathbf{L} = \mathbf{L}_i] \]

**Algorithm**:
1. Fit an outcome model: \( \hat{\mu}(a, \ell) = \hat{E}[Y \mid A = a, \mathbf{L} = \ell] \) (e.g., linear regression, logistic regression, or flexible machine learning)
2. For each observation \( i \), compute the predicted outcome under each treatment value: \( \hat{\mu}(a, \mathbf{L}_i) \) for \( a \in \{0, 1\} \)
3. Average over the sample: \( \hat{E}[Y^a] = n^{-1} \sum_i \hat{\mu}(a, \mathbf{L}_i) \)
4. Estimate ATE: \( \widehat{\text{ATE}} = \hat{E}[Y^1] - \hat{E}[Y^0] \)

**Worked Example (G-computation)**

Suppose we have 8 subjects with binary treatment \( A \), binary confounder \( L \), and continuous outcome \( Y \):

| \( i \) | \( L \) | \( A \) | \( Y \) |
|---|---|---|---|
| 1 | 0 | 0 | 4 |
| 2 | 0 | 0 | 6 |
| 3 | 0 | 1 | 7 |
| 4 | 0 | 1 | 9 |
| 5 | 1 | 0 | 2 |
| 6 | 1 | 0 | 4 |
| 7 | 1 | 1 | 5 |
| 8 | 1 | 1 | 7 |

Step 1. Fit outcome model by group:
- \( E[Y \mid A=0, L=0] = 5 \), \( E[Y \mid A=1, L=0] = 8 \)
- \( E[Y \mid A=0, L=1] = 3 \), \( E[Y \mid A=1, L=1] = 6 \)

Step 2. Marginal distribution of \( L \): \( P(L=0) = 0.5 \), \( P(L=1) = 0.5 \)

Step 3. Standardize:
\[ \hat{E}[Y^1] = 8 \times 0.5 + 6 \times 0.5 = 7 \]
\[ \hat{E}[Y^0] = 5 \times 0.5 + 3 \times 0.5 = 4 \]

Step 4. \( \widehat{\text{ATE}} = 7 - 4 = 3 \)

The naive associational difference (ignoring \( L \)) would give \( (7+5)/2 - (5+3)/2 = 6 - 4 = 2 \), which is confounded (because higher-\( L \) patients are assigned to \( A=0 \) more often).

## 3.2 Inverse Probability Weighting (IPW)

### 3.2.1 The Pseudo-Population

IPW creates a **pseudo-population** in which treatment assignment is independent of \( \mathbf{L} \), mimicking a randomized experiment. The key quantity is the **propensity score**:

<div class="definition">
<strong>Propensity score</strong>: \( e(\mathbf{L}) = P(A = 1 \mid \mathbf{L}) \). By Rosenbaum & Rubin (1983), if \( Y^a \perp A \mid \mathbf{L} \), then also \( Y^a \perp A \mid e(\mathbf{L}) \). The propensity score is the coarsest balancing score.
</div>

The **IPW weights** (Horvitz–Thompson weights) are:

\[ W_i = \frac{1}{P(A_i \mid \mathbf{L}_i)} = \begin{cases} \dfrac{1}{e(\mathbf{L}_i)} & \text{if } A_i = 1 \\[6pt] \dfrac{1}{1 - e(\mathbf{L}_i)} & \text{if } A_i = 0 \end{cases} \]

The IPW estimator of \( E[Y^a] \) is:
\[ \hat{E}^{\text{IPW}}[Y^a] = \frac{\sum_{i: A_i = a} W_i Y_i}{\sum_{i: A_i = a} W_i} \]

or in the Horvitz-Thompson form:
\[ \hat{E}^{\text{IPW}}[Y^a] = \frac{1}{n} \sum_{i=1}^n \frac{\mathbf{1}(A_i = a)}{P(A_i \mid \mathbf{L}_i)} Y_i \]

**Consistency proof sketch**: Under conditional exchangeability and positivity,
\[
E\left[\frac{\mathbf{1}(A=a)}{P(A=a \mid \mathbf{L})} Y\right]
= E\left[\frac{\mathbf{1}(A=a)}{P(A=a \mid \mathbf{L})} Y^a\right]
= E_{L}\left[\frac{P(A=a \mid \mathbf{L})}{P(A=a \mid \mathbf{L})} E[Y^a \mid \mathbf{L}]\right]
= E[Y^a]
\]
where the second equality uses \( Y = Y^A \) (consistency) and \( Y^a \perp A \mid \mathbf{L} \) (conditional exchangeability), and the last equality marginalizes over \( \mathbf{L} \).

### 3.2.2 Stabilized Weights

Unstabilized weights can have high variance when \( P(A \mid \mathbf{L}) \) is close to 0 or 1. **Stabilized weights** bound the variance:

\[ W_i^s = \frac{P(A_i)}{P(A_i \mid \mathbf{L}_i)} \]

where \( P(A) \) is the marginal probability of receiving treatment \( A_i \). For binary treatment, \( P(A=1) \) is the sample proportion treated. Stabilized weights:
- Have mean 1 in expectation
- Are typically less variable than unstabilized weights
- Yield equivalent estimates under correctly specified models
- Are particularly important for time-varying treatments (Chapter 4)

**IPTW calculation example**: Suppose 4 individuals with \( P(A=1 \mid L) \) values:

| \( i \) | \( A \) | \( \hat{e}(\mathbf{L}_i) \) | \( W_i = 1/P(A_i|\mathbf{L}_i) \) | \( W_i^s \) (with \( P(A=1)=0.5 \)) |
|---|---|---|---|---|
| 1 | 1 | 0.8 | \( 1/0.8 = 1.25 \) | \( 0.5/0.8 = 0.625 \) |
| 2 | 0 | 0.8 | \( 1/0.2 = 5.00 \) | \( 0.5/0.2 = 2.500 \) |
| 3 | 1 | 0.3 | \( 1/0.3 = 3.33 \) | \( 0.5/0.3 = 1.667 \) |
| 4 | 0 | 0.3 | \( 1/0.7 = 1.43 \) | \( 0.5/0.7 = 0.714 \) |

Observation 2 has a high weight (5.0) because it is in the untreated group but has a very high propensity — under the pseudo-population, it must "stand in" for many observations.

### 3.2.3 Weight Truncation

To reduce variance at the cost of introducing bias, weights are sometimes **truncated** at the 1st and 99th percentiles (or other thresholds). Truncation reduces MSE in finite samples but introduces bias. A weight truncation sensitivity analysis assesses how results change across truncation thresholds.

## 3.3 Marginal Structural Models

A **Marginal Structural Model (MSM)** is a model for the marginal potential outcomes \( E[Y^a] \) as a function of \( a \):

\[ E[Y^a] = \beta_0 + \beta_1 a \quad \text{(linear MSM for continuous outcome)} \]
\[ \text{logit}\, P(Y^a = 1) = \beta_0 + \beta_1 a \quad \text{(logistic MSM for binary outcome)} \]

MSMs are fit by **IPTW**: solve the weighted estimating equation
\[ \sum_{i=1}^n W_i \frac{\partial}{\partial \boldsymbol{\beta}} \ell(Y_i; \boldsymbol{\beta}, A_i) = 0 \]

where \( \ell \) is the working likelihood for the outcome model. Because the pseudo-population is marginally exchangeable (the weights balance \( \mathbf{L} \) across treatment groups), fitting the MSM on the weighted sample consistently estimates the marginal structural parameters.

**Interpretation of MSM coefficient**: In the linear MSM, \( \hat\beta_1 \) estimates the ATE \( E[Y^1] - E[Y^0] \). This is a marginal (population-averaged) effect, unlike a conditional effect from a standard regression.

## 3.4 Doubly Robust Estimation (AIPW)

The **Augmented Inverse Probability Weighted (AIPW)** estimator combines outcome regression and propensity score models:

\[ \hat{\tau}^{\text{AIPW}} = \frac{1}{n}\sum_{i=1}^n \left[ \hat{\mu}(1, \mathbf{L}_i) - \hat{\mu}(0, \mathbf{L}_i) + \frac{A_i(Y_i - \hat{\mu}(1, \mathbf{L}_i))}{\hat{e}(\mathbf{L}_i)} - \frac{(1-A_i)(Y_i - \hat{\mu}(0, \mathbf{L}_i))}{1 - \hat{e}(\mathbf{L}_i)} \right] \]

<div class="definition">
<strong>Double robustness</strong>: The AIPW estimator is consistent if <em>either</em> the outcome model \( \hat{\mu}(a, \mathbf{L}) \) or the propensity score model \( \hat{e}(\mathbf{L}) \) is correctly specified (but not necessarily both). This provides protection against misspecification of one of the two models.
</div>

The AIPW estimator is also the **locally efficient** semiparametric estimator — it achieves the semiparametric efficiency bound when both models are correctly specified. It is the foundation of modern **targeted learning** (TMLE) methods.

---

# Chapter 4: Marginal Structural Models for Time-Varying Treatments

## 4.1 The Problem of Time-Varying Confounding

In longitudinal studies, both treatment and confounders vary over time. Let:
- \( A_t \): treatment at time \( t \), \( t = 0, 1, \ldots, K \)
- \( L_t \): time-varying covariate at time \( t \)
- \( \bar{A}_t = (A_0, A_1, \ldots, A_t) \): treatment history through time \( t \)
- \( \bar{L}_t = (L_0, L_1, \ldots, L_t) \): covariate history through time \( t \)

The key DAG structure is:
\[ L_0 \to A_0 \to L_1 \to A_1 \to Y \]
with additional paths \( L_0 \to Y \), \( L_1 \to Y \), and potentially \( A_0 \to L_1 \).

When \( A_0 \) affects \( L_1 \) and \( L_1 \) affects both \( A_1 \) and \( Y \), then \( L_1 \) is simultaneously a **confounder** (of the \( A_1 \to Y \) relationship) and an **intermediate variable** (on the causal path \( A_0 \to L_1 \to Y \)).

**Why conventional regression fails**: Controlling for \( L_1 \) in a standard regression of \( Y \) on \( A_0, A_1, L_0, L_1 \):
- Appropriately adjusts for the \( L_1 \)-mediated confounding of \( A_1 \to Y \)
- But simultaneously blocks part of the \( A_0 \to L_1 \to Y \) causal pathway
- Introduces collider bias if \( L_1 \) has unmeasured common causes with \( Y \)

This is the time-varying confounding problem (Robins, 1986). The solution is MSMs estimated by IPTW.

## 4.2 Sequential Exchangeability

<div class="definition">
<strong>Sequential exchangeability</strong>: For each time point \( t \):
\[ Y^{\bar{a}} \perp A_t \mid \bar{A}_{t-1} = \bar{a}_{t-1}, \bar{L}_t \]
for all treatment regimes \( \bar{a} \) and all values of the history. This states that, given the full past history (treatment and covariate history), treatment at time \( t \) is as good as randomly assigned.
</div>

Sequential exchangeability is the time-varying analogue of conditional exchangeability. It permits identification of dynamic treatment regimes (treatment rules that adapt over time based on covariate history).

## 4.3 IPTW for Time-Varying Treatments

The **inverse probability of treatment weight** at time \( t \) is:

\[ w_t = \frac{P(A_t \mid \bar{A}_{t-1})}{P(A_t \mid \bar{A}_{t-1}, \bar{L}_t)} \]

The **cumulative (product) weight** over the full follow-up is:

\[ \bar{W}_i = \prod_{t=0}^{K} \frac{P(A_t \mid \bar{A}_{t-1})}{P(A_t \mid \bar{A}_{t-1}, \bar{L}_t)} \]

The numerator \( P(A_t \mid \bar{A}_{t-1}) \) is the marginal probability of treatment (ignoring time-varying confounders), and the denominator \( P(A_t \mid \bar{A}_{t-1}, \bar{L}_t) \) is the conditional probability given the full history. The ratio is the **stabilized weight** (Hernán et al., 2000).

**Properties of time-varying IPTW**:
- In the pseudo-population created by these weights, \( L_t \) no longer predicts \( A_t \) after conditioning on treatment history (by construction), removing time-varying confounding
- The weights have mean 1 in expectation (for stabilized weights)
- Extreme weights indicate near-violations of positivity and should trigger diagnostics

## 4.4 Fitting MSMs for Time-Varying Treatments

A **Marginal Structural Cox Model** for a survival outcome:
\[ \lambda(t \mid \bar{A}_t) = \lambda_0(t) \exp\left(\beta_1 \bar{A}_t\right) \]

A **Marginal Structural Linear Model** for cumulative effects:
\[ E[Y^{\bar{a}}] = \psi_0 + \psi_1 \sum_{t} a_t \]

where \( \sum_t a_t \) is the cumulative dose (total treatment exposure). These models are fit via **GEE** or **weighted least squares** on the pseudo-population defined by the IPTW weights \( \bar{W}_i \).

## 4.5 Handling Censoring

In longitudinal studies, subjects may be **censored** (lost to follow-up) before the end of follow-up. Censoring introduces selection bias if censoring depends on \( L_t \) or \( A_t \).

The solution is **inverse probability of censoring weights (IPCW)**: \( W^C = 1/P(C_t = 0 \mid \bar{A}_{t-1}, \bar{L}_t) \). The combined weight is \( W = \bar{W}^A \times \bar{W}^C \), the product of treatment and censoring weights.

## 4.6 Application: HIV Treatment and CD4 Count

**Classic application** (Hernán et al., 2000): Estimate the effect of initiation of antiretroviral therapy (ART) on CD4 count trajectories in HIV-positive patients. Confounders include: current CD4 count \( L_t \) (patients with lower CD4 start ART sooner). CD4 count is both a confounder of future treatment decisions and an intermediate outcome.

The IPTW-MSM approach:
1. Model \( P(A_t = 1 \mid \bar{A}_{t-1}, \bar{L}_t) \) using logistic regression (denominator)
2. Model \( P(A_t = 1 \mid \bar{A}_{t-1}) \) using logistic regression (numerator)
3. Compute stabilized cumulative weights
4. Fit a weighted linear model of CD4 count on treatment history and time
5. Standard errors via bootstrap or sandwich estimator

Conventional regression (controlling for \( L_t \)) would attenuate the estimated treatment effect because it blocks the causal pathway through CD4 count improvements due to treatment.

---

# Chapter 5: Instrumental Variables

## 5.1 Motivation: Unmeasured Confounding

Even after adjusting for all measured confounders via IPW or g-computation, unmeasured confounders \( U \) may still bias causal effect estimates. If \( U \) affects both \( A \) and \( Y \) and is not in the data, no standard regression or propensity score method can remove this bias.

**Instrumental variables (IV)** offer identification in the presence of unmeasured confounders by exploiting a variable \( Z \) that affects \( Y \) only through \( A \).

## 5.2 IV Assumptions

Let \( Z \) be the proposed instrument, \( A \) the treatment, \( Y \) the outcome, and \( U \) the unmeasured confounder(s).

<div class="definition">
<strong>Instrumental variable assumptions</strong>:
<ol>
<li><strong>Relevance</strong>: \( Z \) is correlated with \( A \): \( \text{Cov}(Z, A) \neq 0 \). Equivalently, \( P(A = 1 \mid Z = 1) \neq P(A = 1 \mid Z = 0) \). In DAG terms: \( Z \to A \).</li>
<li><strong>Exclusion restriction</strong>: \( Z \) affects \( Y \) only through \( A \). There is no direct path \( Z \to Y \) and no path \( Z \to U \to Y \). In DAG terms: no path from \( Z \) to \( Y \) except through \( A \).</li>
<li><strong>Independence (instrument exogeneity)</strong>: \( Z \perp U \). The instrument is independent of unmeasured confounders. In randomized designs, \( Z \) is randomly assigned.</li>
</ol>
</div>

In DAG form: \( Z \to A \to Y \leftarrow U \to A \), with no \( Z \leftrightarrow U \) edge and no direct \( Z \to Y \) edge. The IV isolates the variation in \( A \) induced by \( Z \) (the "instrumental" variation) which is free of confounding by \( U \).

## 5.3 The IV Estimator

Under the IV assumptions and assuming a **constant treatment effect** \( \beta_1 \) (i.e., \( Y = \beta_0 + \beta_1 A + \epsilon \)):

\[ \hat{\beta}_1^{\text{IV}} = \frac{\text{Cov}(Z, Y)}{\text{Cov}(Z, A)} = \frac{\hat{E}[Y \mid Z=1] - \hat{E}[Y \mid Z=0]}{\hat{E}[A \mid Z=1] - \hat{E}[A \mid Z=0]} \]

The numerator is the reduced-form effect of \( Z \) on \( Y \) (intent-to-treat effect); the denominator is the first-stage effect of \( Z \) on \( A \) (compliance rate). The IV estimator scales the intent-to-treat effect by the degree of compliance.

## 5.4 Two-Stage Least Squares (2SLS)

**2SLS** is the standard implementation of IV estimation with covariates:

**Stage 1**: Regress \( A \) on \( Z \) (and covariates \( \mathbf{X} \)):
\[ \hat{A}_i = \hat{\gamma}_0 + \hat{\gamma}_1 Z_i + \hat{\boldsymbol{\gamma}}_2^\top \mathbf{X}_i \]

**Stage 2**: Regress \( Y \) on \( \hat{A} \) (and covariates \( \mathbf{X} \)):
\[ Y_i = \beta_0 + \beta_1 \hat{A}_i + \boldsymbol{\beta}_2^\top \mathbf{X}_i + \varepsilon_i \]

The 2SLS estimator of \( \beta_1 \) is consistent for the causal effect under the IV assumptions.

**Standard errors**: The Stage 2 standard errors must be corrected because \( \hat{A} \) is estimated. Robust (sandwich) standard errors or standard IV software (e.g., R package `ivreg`) provide correct inference.

## 5.5 Weak Instruments

An instrument is **weak** if \( \text{Cov}(Z, A) \approx 0 \) — i.e., \( Z \) has only a small effect on \( A \). With a weak instrument:
- The IV estimator has large variance and may be severely biased toward the OLS estimator in finite samples
- 95% confidence intervals are unreliable

**F-statistic rule of thumb**: The first-stage F-statistic (testing \( H_0: \gamma_1 = 0 \)) should exceed 10 (Stock, Wright & Yogo, 2002). More recent literature suggests more stringent thresholds (e.g., \( F > 104 \) for 5% bias at 5% significance level for a single IV).

## 5.6 Local Average Treatment Effect (LATE)

Without the constant treatment effect assumption, the IV estimator identifies the **Local Average Treatment Effect (LATE)** = Complier Average Causal Effect (CACE):

<div class="definition">
<strong>LATE</strong>: The average treatment effect among <em>compliers</em> — units whose treatment changes in response to the instrument:
\[ \text{LATE} = E[Y^1 - Y^0 \mid A^{Z=1} = 1, A^{Z=0} = 0] \]
where \( A^{Z=z} \) is the potential treatment under instrument level \( z \).
</div>

Under the IV assumptions plus **monotonicity** (no defiers: \( A^{Z=1} \geq A^{Z=0} \) for all units), the IV estimator identifies the LATE. The LATE applies only to compliers — a subpopulation that may differ from the full population.

**Compliance classes**:
- **Compliers**: \( A^{Z=1} = 1, A^{Z=0} = 0 \) — take treatment when encouraged, don't when not
- **Always-takers**: \( A^{Z=1} = A^{Z=0} = 1 \) — always take treatment regardless of \( Z \)
- **Never-takers**: \( A^{Z=1} = A^{Z=0} = 0 \) — never take treatment regardless of \( Z \)
- **Defiers** (excluded by monotonicity): \( A^{Z=1} = 0, A^{Z=0} = 1 \)

## 5.7 Mendelian Randomization

**Mendelian randomization (MR)** uses genetic variants as instrumental variables. The rationale: alleles are randomly allocated at conception (Mendel's law of independent assortment), providing a natural experiment for causal inference.

**Application — 2SLS example**: Estimate the causal effect of BMI on blood pressure.
- \( Z \): polygenic score for BMI (e.g., weighted sum of 100 BMI-associated SNPs)
- \( A \): observed BMI
- \( Y \): systolic blood pressure

**Stage 1**: Regress BMI on polygenic score:
\[ \widehat{\text{BMI}}_i = \hat{\gamma}_0 + \hat{\gamma}_1 (\text{PGS}_i) \]

Suppose \( \hat{\gamma}_1 = 0.8 \text{ kg/m}^2 \) per SD of PGS, with \( F = 45 > 10 \) (relevant instrument).

**Stage 2**: Regress blood pressure on fitted BMI:
\[ \text{SBP}_i = \beta_0 + \beta_1 \widehat{\text{BMI}}_i + \varepsilon_i \]

Suppose \( \hat{\beta}_1 = 1.2 \text{ mmHg per kg/m}^2 \) (95% CI: 0.8–1.6), interpreted as the causal effect of a 1 kg/m² increase in BMI on SBP.

**MR assumptions**:
1. Relevance: genetic variants must be significantly associated with BMI (validated by GWAS)
2. Exclusion restriction: variants affect BP only through BMI (pleiotropic violations are the main concern)
3. Independence: variants are not associated with confounders (population stratification can violate this)

**MR Sensitivity analyses**: MR-Egger regression (tests for pleiotropy), weighted median estimator, weighted mode estimator.

## 5.8 Regression Discontinuity Design

In a **regression discontinuity (RD) design**, treatment is assigned based on a continuous **running variable** \( V \) crossing a threshold \( c \): \( A = \mathbf{1}(V \geq c) \). The IV is (approximately) the treatment assignment near the threshold.

**Sharp RD**: All units with \( V \geq c \) are treated. The causal effect at the cutoff is identified:
\[ \tau_{\text{RD}} = \lim_{v \downarrow c} E[Y \mid V = v] - \lim_{v \uparrow c} E[Y \mid V = v] \]

This is the **local** effect at the threshold \( V = c \), estimated by fitting flexible regressions of \( Y \) on \( V \) on each side of \( c \). Bandwidth selection (how much data to use near \( c \)) is the main methodological challenge.

---

# Chapter 6: Missing Data Mechanisms and Their Consequences

## 6.1 The Missing Data Problem

Missing data are pervasive in biomedical research. Ignoring missing data — or handling it naively — can produce biased estimates, inflated standard errors, and invalid inference. Understanding the **mechanism** generating the missing data is essential for choosing the appropriate analytic method.

Let \( \mathbf{Y} = (\mathbf{Y}_{\text{obs}}, \mathbf{Y}_{\text{mis}}) \) denote the complete data (observed and missing components), and let \( \mathbf{R} \) be the **missingness indicator**: \( R_i = 1 \) if \( Y_i \) is observed, \( R_i = 0 \) if missing.

## 6.2 Missing Data Patterns

<div class="definition">
<strong>Univariate missingness</strong>: Only one variable has missing values. The simplest pattern.
</div>

<div class="definition">
<strong>Monotone missingness</strong>: Variables can be ordered \( Y_1, Y_2, \ldots, Y_p \) such that if \( Y_j \) is missing, all subsequent \( Y_k \) (\( k > j \)) are also missing. Common in longitudinal studies with dropout.
</div>

<div class="definition">
<strong>General (non-monotone) missingness</strong>: An arbitrary pattern of missingness across variables. Any variable may be missing independently. The most challenging case for imputation.
</div>

## 6.3 Rubin's Mechanisms

Rubin (1976) and Little & Rubin (2002) classify missing data into three mechanisms based on the relationship between missingness \( \mathbf{R} \), observed data \( \mathbf{Y}_{\text{obs}} \), and missing data \( \mathbf{Y}_{\text{mis}} \):

### 6.3.1 Missing Completely at Random (MCAR)

<div class="definition">
<strong>MCAR</strong>: The probability of missingness does not depend on any data (observed or missing):
\[ P(\mathbf{R} \mid \mathbf{Y}_{\text{obs}}, \mathbf{Y}_{\text{mis}}) = P(\mathbf{R}) \]
The missing data are a simple random sample of the complete data.
</div>

**Consequences of MCAR**:
- Complete case analysis (analyzing only records with no missing values) is **unbiased** — the complete cases are a simple random sample
- All methods are valid under MCAR
- Loss of efficiency (reduced sample size) but no bias

**Testing for MCAR**: Little's test (1988) tests whether patterns of missingness are independent of observed data. Rejection indicates at least MAR.

### 6.3.2 Missing at Random (MAR)

<div class="definition">
<strong>MAR</strong>: The probability of missingness depends only on the <em>observed</em> data \( \mathbf{Y}_{\text{obs}} \), not on the missing values \( \mathbf{Y}_{\text{mis}} \):
\[ P(\mathbf{R} \mid \mathbf{Y}_{\text{obs}}, \mathbf{Y}_{\text{mis}}) = P(\mathbf{R} \mid \mathbf{Y}_{\text{obs}}) \]
</div>

**Example**: Income is missing, and missing income is more likely among older respondents (age is observed). Then income is MAR given age — conditioning on age, missingness does not depend on income itself.

**Consequences of MAR**:
- Complete case analysis is **biased** (the complete cases are not representative of the population)
- Likelihood-based methods (using the observed likelihood) are valid under MAR — this is the property of **ignorability** (Rubin, 1976)
- Multiple imputation and FIML (Full Information Maximum Likelihood) are valid under MAR

**Ignorability**: Under MAR, the missing data mechanism is **ignorable** for likelihood-based inference — the likelihood can be written solely in terms of \( \mathbf{Y}_{\text{obs}} \), and maximizing this observed-data likelihood gives consistent estimates.

### 6.3.3 Missing Not at Random (MNAR)

<div class="definition">
<strong>MNAR</strong>: The probability of missingness depends on the missing values themselves, even after conditioning on observed data:
\[ P(\mathbf{R} \mid \mathbf{Y}_{\text{obs}}, \mathbf{Y}_{\text{mis}}) \neq P(\mathbf{R} \mid \mathbf{Y}_{\text{obs}}) \]
</div>

**Example**: Patients with the worst mental health outcomes drop out of a psychiatric study because of their poor outcomes (which are therefore unmeasured). Missingness depends directly on the (unobserved) outcome.

**Consequences of MNAR**:
- All standard methods (complete case, IPW, multiple imputation) are **biased** unless the missingness model is correctly specified
- The mechanism is **non-ignorable**; the joint model for data and missingness must be specified
- Sensitivity analysis is required to assess robustness of conclusions to MNAR assumptions

## 6.4 Approaches Under Each Mechanism

### 6.4.1 Complete Case Analysis

**Complete case (CC) analysis** includes only records with no missing values in the analysis.

| Mechanism | Bias? | Notes |
|---|---|---|
| MCAR | No | Valid, but inefficient |
| MAR | Usually yes | Biased unless missingness is on predictors only |
| MNAR | Yes | Generally biased |

CC analysis is valid under MCAR and under certain MAR scenarios (e.g., outcome is fully observed, missingness is on covariates only). It discards information and reduces precision.

### 6.4.2 Available Case Analysis

**Available case analysis** uses all observations with observed values for each particular analysis. Different analyses may use different subsets, leading to inconsistent effective sample sizes and potential incoherence in joint analyses. Generally not recommended.

### 6.4.3 Likelihood-Based Methods and FIML

Under MAR, the **observed data likelihood**:
\[ L(\boldsymbol{\theta} \mid \mathbf{Y}_{\text{obs}}) = \int L(\boldsymbol{\theta} \mid \mathbf{Y}_{\text{obs}}, \mathbf{Y}_{\text{mis}}) \, d\mathbf{Y}_{\text{mis}} \]

can be maximized to give consistent estimates. **Full Information Maximum Likelihood (FIML)** directly maximizes the observed data likelihood without imputation. FIML is efficient under MAR and is the gold standard for structural equation models and mixed models with missing data.

For monotone missing data under MAR, the likelihood factorizes into sequential regressions that can be fit separately (monotone factorization).

### 6.4.4 Selection Models vs. Pattern-Mixture Models

For MNAR data, two modeling strategies exist:

<div class="definition">
<strong>Selection model</strong>: Models the joint distribution by first specifying the complete-data model \( f(\mathbf{Y}) \) and then the selection mechanism \( P(\mathbf{R} \mid \mathbf{Y}) \). The Heckman selection model is a classic example. The missingness model is conditional on the outcome (including unobserved values), which is typically unidentified without strong assumptions.
</div>

<div class="definition">
<strong>Pattern-mixture model</strong>: Models the joint distribution by stratifying on the missingness pattern \( \mathbf{R} \): \( f(\mathbf{Y} \mid \mathbf{R}) \times P(\mathbf{R}) \). Estimates are computed within each pattern and combined. Extrapolation assumptions (identifying restrictions) are needed because some pattern-specific parameters are unidentified.
</div>

Both approaches require assumptions about the MNAR mechanism that cannot be verified from the data — necessitating sensitivity analysis.

---

# Chapter 7: Multiple Imputation

## 7.1 Overview and Rationale

**Multiple imputation (MI)** is the preferred method for handling missing data under MAR (and MAR-compatible MNAR via sensitivity analysis). Rather than imputing each missing value once (which underestimates uncertainty), MI creates \( m \geq 2 \) complete datasets by drawing imputations from the **posterior predictive distribution** of the missing data.

The key insight (Rubin, 1987): the uncertainty in the imputed values — which reflects both within-imputation uncertainty (sampling variability) and between-imputation uncertainty (imputation uncertainty) — is propagated through Rubin's combining rules to give valid inference.

## 7.2 Bayesian Justification

MI has a Bayesian foundation. Let \( \boldsymbol{\theta} \) be the parameters of the complete-data model. Under a Bayesian framework:

1. Draw \( \tilde{\boldsymbol{\theta}} \sim P(\boldsymbol{\theta} \mid \mathbf{Y}_{\text{obs}}) \) (posterior of \( \boldsymbol{\theta} \) given observed data)
2. Draw \( \tilde{\mathbf{Y}}_{\text{mis}} \sim P(\mathbf{Y}_{\text{mis}} \mid \mathbf{Y}_{\text{obs}}, \tilde{\boldsymbol{\theta}}) \) (predictive distribution of missing values)

Repeating steps 1–2 \( m \) times gives \( m \) imputed datasets. Each represents a draw from the posterior predictive distribution of the missing data.

The analyst then:
3. Fits the analysis model to each of the \( m \) complete datasets to obtain \( \hat{Q}_1, \ldots, \hat{Q}_m \) (estimates of the estimand \( Q \))
4. Combines results using Rubin's rules

## 7.3 Rubin's Combining Rules

Let \( \hat{Q}_l \) and \( \hat{U}_l \) be the estimate and its variance from imputed dataset \( l = 1, \ldots, m \).

**Combined estimate**:
\[ \bar{Q} = \frac{1}{m} \sum_{l=1}^m \hat{Q}_l \]

**Within-imputation variance** (average sampling uncertainty):
\[ \bar{U} = \frac{1}{m} \sum_{l=1}^m \hat{U}_l \]

**Between-imputation variance** (imputation uncertainty):
\[ B = \frac{1}{m-1} \sum_{l=1}^m (\hat{Q}_l - \bar{Q})^2 \]

**Total variance**:
\[ T = \bar{U} + \left(1 + \frac{1}{m}\right) B \]

The \( (1 + 1/m) \) factor corrects for the finite number of imputations. The **combined standard error** is \( \sqrt{T} \).

**Degrees of freedom** (Rubin 1987):
\[ \nu = (m - 1)\left(1 + \frac{\bar{U}}{(1 + m^{-1})B}\right)^2 \]

Inference uses a \( t_\nu \) distribution: \( (\bar{Q} - Q_0)/\sqrt{T} \sim t_\nu \) under \( H_0: Q = Q_0 \).

**Worked example (Rubin's Rules with m = 5)**:

Suppose we estimate the mean outcome \( Q = E[Y] \) from 5 imputed datasets:

| Imputation | \( \hat{Q}_l \) | \( \hat{U}_l \) (SE²) |
|---|---|---|
| 1 | 2.35 | 0.04 |
| 2 | 2.42 | 0.04 |
| 3 | 2.28 | 0.05 |
| 4 | 2.38 | 0.04 |
| 5 | 2.32 | 0.04 |

Step 1. \( \bar{Q} = (2.35 + 2.42 + 2.28 + 2.38 + 2.32)/5 = 2.35 \)

Step 2. \( \bar{U} = (0.04 + 0.04 + 0.05 + 0.04 + 0.04)/5 = 0.042 \)

Step 3. \( B = \frac{1}{4}\left[(2.35-2.35)^2 + (2.42-2.35)^2 + (2.28-2.35)^2 + (2.38-2.35)^2 + (2.32-2.35)^2\right] \)
\[ = \frac{1}{4}[0 + 0.0049 + 0.0049 + 0.0009 + 0.0009] = \frac{0.0116}{4} = 0.0029 \]

Step 4. \( T = 0.042 + (1 + 0.2)(0.0029) = 0.042 + 0.00348 = 0.0455 \)

Step 5. \( \text{SE} = \sqrt{0.0455} = 0.213 \), giving 95% CI: \( 2.35 \pm 1.96 \times 0.213 = (1.93, 2.77) \)

## 7.4 Efficiency and Number of Imputations

**Fraction of missing information** (FMI):
\[ \lambda = \frac{(1 + m^{-1}) B}{T} \approx \frac{B}{T} \text{ for large } m \]

**Relative efficiency** of using \( m \) imputations vs. \( m \to \infty \):
\[ \text{RE} = \left(1 + \frac{\lambda}{m}\right)^{-1} \]

For \( \lambda = 0.3 \) (30% missing information) and \( m = 5 \):
\[ \text{RE} = (1 + 0.3/5)^{-1} = (1.06)^{-1} = 0.943 \approx 94\% \]

**Rule of thumb for number of imputations**: White et al. (2011) recommend \( m \geq 100\lambda \) (i.e., \( m \) should be at least equal to the percentage of missing information). For 30% missing, use at least \( m = 30 \) imputations. Earlier guidance suggested \( m = 5 \) but this is now considered insufficient for stable inference, especially for confidence interval coverage.

## 7.5 Fully Conditional Specification (MICE)

For multivariate missing data, the **Fully Conditional Specification (FCS)** or **Multiple Imputation by Chained Equations (MICE)** algorithm is the most widely used approach:

**Algorithm (van Buuren, 2007)**:
1. Initialize: Fill in starting values for all missing data (e.g., using column means)
2. For each variable \( j = 1, \ldots, p \) with missing values:
   a. Specify a conditional model: \( f(Y_j \mid Y_{-j}, \boldsymbol{\theta}_j) \) (e.g., linear regression for continuous, logistic for binary, predictive mean matching for non-normal continuous)
   b. Draw \( \tilde{\boldsymbol{\theta}}_j \sim P(\boldsymbol{\theta}_j \mid \mathbf{Y}_{j,\text{obs}}, \mathbf{Y}_{-j}) \)
   c. Draw \( \tilde{Y}_{j,\text{mis}} \sim f(Y_j \mid \mathbf{Y}_{-j}, \tilde{\boldsymbol{\theta}}_j) \)
3. Cycle through all variables and repeat for many iterations (typically 10–20)
4. After convergence, save the current imputed dataset
5. Repeat steps 1–4 to generate \( m \) imputed datasets

FCS is not guaranteed to converge to a proper joint distribution (it lacks theoretical justification unless a compatible joint model exists), but in practice it works well. **SMC-FCS** (Substantive Model Compatible FCS, Bartlett et al., 2015) ensures compatibility between the imputation model and the substantive (analysis) model.

## 7.6 Congeniality and Passive Imputation

<div class="definition">
<strong>Congeniality</strong>: The imputation model and analysis model are <em>congenial</em> if the imputation model is at least as general as the analysis model (i.e., the imputation model implies the analysis model). Uncongenial imputation (e.g., imputing without interactions that are in the analysis model) can lead to biased inference.
</div>

**Rule**: Include in the imputation model all variables in the analysis model, interactions and transformations, and auxiliary variables predictive of missingness or the outcome.

<div class="definition">
<strong>Passive imputation</strong>: For derived variables (e.g., \( X_3 = X_1 \times X_2 \), BMI = weight/height²), the derived variable is <em>not</em> imputed directly. Instead, the components \( X_1 \) and \( X_2 \) are imputed, and \( X_3 \) is <em>re-derived</em> from the imputed components at each imputation step. This preserves the logical relationship among variables.
</div>

## 7.7 Diagnostic Checks

After running MI, diagnostics assess whether the imputations are plausible:

1. **Trace plots**: Plot imputed means vs. iteration number for each variable. Should converge and mix well (no trend after 5–10 iterations).
2. **Distribution comparison**: Overlay density plots of observed vs. imputed values for each variable. Imputed values should be broadly consistent with the observed distribution (they may differ if missingness is informative).
3. **Stripplots**: Compare observed and imputed values within each pattern of missingness.
4. **Convergence diagnostics**: Monitor Gelman-Rubin statistics across \( m \) chains.

---

# Chapter 8: Sensitivity Analysis for Unmeasured Confounding

## 8.1 The Limits of Observational Studies

Even after careful adjustment for measured confounders via IPW, g-computation, or regression, the concern remains: **What if there is an unmeasured confounder?** Sensitivity analysis quantifies how strong unmeasured confounding would need to be to alter the substantive conclusions of a study.

This chapter covers three complementary approaches:
1. **E-values** (VanderWeele & Ding, 2017)
2. **Rosenbaum bounds** (Rosenbaum, 2002)
3. **Quantitative bias analysis**

## 8.2 E-Values

### 8.2.1 Definition

The **E-value** answers: "How strong would the association between an unmeasured confounder \( U \) and both the treatment \( A \) and the outcome \( Y \) need to be (on the risk ratio scale) to fully explain away the observed association?"

<div class="definition">
<strong>E-value</strong> (VanderWeele & Ding, 2017): For an observed relative risk \( \text{RR} \) between treatment and outcome (adjusted for measured confounders), the E-value is:
\[ E = \text{RR} + \sqrt{\text{RR} \times (\text{RR} - 1)} \]
Any unmeasured confounder \( U \) that could fully explain away the observed association must have risk ratio associations with both \( A \) and \( Y \) of at least \( E \), conditional on all measured confounders.
</div>

For confidence interval sensitivity, the E-value of the confidence limit closer to the null is:
\[ E_{\text{CI}} = \text{RR}_{\text{limit}} + \sqrt{\text{RR}_{\text{limit}} \times (\text{RR}_{\text{limit}} - 1)} \]

### 8.2.2 Derivation Sketch

Let \( \text{RR}_{AU} = \max_u \frac{P(A=1|U=u)}{P(A=1|U \neq u)} \) and \( \text{RR}_{UY} = \max_u \frac{P(Y=1|U=u)}{P(Y=1|U \neq u)} \) be the maximum risk ratios of \( U \) with \( A \) and \( Y \). The maximum confounding risk ratio is bounded by:
\[ \text{CR} \leq \frac{\text{RR}_{AU} \times \text{RR}_{UY}}{\text{RR}_{AU} + \text{RR}_{UY} - 1} \]

The E-value is the value of \( \text{RR}_{AU} = \text{RR}_{UY} \) that sets this bound equal to RR, giving \( E = \text{RR} + \sqrt{\text{RR} \times (\text{RR}-1)} \).

### 8.2.3 Worked Example

**Setting**: An observational cohort study estimates that statins reduce the risk of myocardial infarction with an adjusted \( \text{RR} = 0.60 \) (95% CI: 0.50–0.72), adjusting for age, sex, BMI, and smoking.

The observed RR is 0.60. To compute the E-value for a protective effect:
- Convert to RR \( > 1 \): use \( 1/0.60 = 1.667 \)

\[ E = 1.667 + \sqrt{1.667 \times (1.667 - 1)} = 1.667 + \sqrt{1.667 \times 0.667} = 1.667 + \sqrt{1.112} = 1.667 + 1.054 = 2.72 \]

**Interpretation**: Any unmeasured confounder that could fully explain away this association would need to be associated with both statin use and MI risk by a risk ratio of at least 2.72-fold, conditional on all measured confounders. If the analyst judges that no unmeasured confounder is this strongly associated with both, the result is robust.

For the CI lower bound (\( \text{RR}_\text{limit} = 1/0.72 = 1.39 \)):
\[ E_{\text{CI}} = 1.39 + \sqrt{1.39 \times 0.39} = 1.39 + \sqrt{0.542} = 1.39 + 0.736 = 2.13 \]

**A second worked example** with a harmful exposure: Suppose an observational study finds \( \text{RR} = 2.5 \) for the association between red meat consumption and colorectal cancer.

\[ E = 2.5 + \sqrt{2.5 \times (2.5 - 1)} = 2.5 + \sqrt{2.5 \times 1.5} = 2.5 + \sqrt{3.75} = 2.5 + 1.936 = 4.44 \]

For the confidence limit at \( \text{RR}_\text{limit} = 1.8 \):
\[ E_{\text{CI}} = 1.8 + \sqrt{1.8 \times 0.8} = 1.8 + \sqrt{1.44} = 1.8 + 1.2 = 3.0 \]

**Interpretation**: An unmeasured confounder would need \( \text{RR}_{AU} = \text{RR}_{UY} \geq 4.44 \) to fully explain away the point estimate of RR = 2.5. The CI lower bound of 1.8 requires \( \text{RR} \geq 3.0 \) to be explained away.

## 8.3 Rosenbaum Bounds

Rosenbaum's sensitivity analysis (2002) assumes a logistic model for the probability that unit \( i \) is treated:
\[ \log \frac{P(A_i = 1 \mid \mathbf{L}_i, U_i)}{P(A_i = 0 \mid \mathbf{L}_i, U_i)} = \kappa(\mathbf{L}_i) + \gamma U_i \]

where \( U_i \in [0, 1] \) is an unmeasured binary confounder and \( \gamma \geq 0 \) governs its effect on treatment. The **sensitivity parameter** \( \Gamma = e^\gamma \geq 1 \) represents the maximum odds ratio by which two units with the same observed covariates \( \mathbf{L} \) could differ in their odds of treatment due to \( U \).

<div class="definition">
<strong>Rosenbaum bounds</strong>: For a given \( \Gamma \geq 1 \), two matched units \( i \) and \( j \) with the same \( \mathbf{L} \) have treatment odds satisfying:
\[ \frac{1}{\Gamma} \leq \frac{P(A_i = 1 \mid \mathbf{L}, U_i) / P(A_i = 0 \mid \mathbf{L}, U_i)}{P(A_j = 1 \mid \mathbf{L}, U_j) / P(A_j = 0 \mid \mathbf{L}, U_j)} \leq \Gamma \]
</div>

The analyst computes the range of p-values (or confidence intervals) for the treatment effect as \( \Gamma \) varies from 1 (no unmeasured confounding) upward. If the p-value remains \( < 0.05 \) for \( \Gamma = 2 \), this means that even if unmeasured confounders doubled the odds of treatment for some subjects, the conclusion of significance holds.

The **sensitivity value** \( \tilde{\Gamma} \) is the largest \( \Gamma \) for which the study conclusion changes — e.g., the p-value crosses 0.05. A larger \( \tilde{\Gamma} \) indicates greater robustness.

## 8.4 Negative Controls

**Negative controls** are outcome or exposure variables that should not be affected by the treatment (or should not be related to the exposure), used to detect unmeasured confounding.

<div class="definition">
<strong>Negative control outcome (NCO)</strong>: An outcome \( Y^* \) that shares the same confounders as \( Y \) but has no causal relationship with \( A \) (by domain knowledge). Any observed association between \( A \) and \( Y^* \) must be due to confounding, providing a way to detect and quantify unmeasured confounding bias.
</div>

<div class="definition">
<strong>Negative control exposure (NCE)</strong>: An exposure \( A^* \) that shares the same confounders as \( A \) but has no causal relationship with \( Y \). Any observed association provides evidence of unmeasured confounding.
</div>

**Example**: To assess whether the association between coffee drinking and lung cancer is confounded by smoking (an unmeasured or poorly measured confounder), use tooth staining as a negative control outcome — tooth staining is associated with coffee drinking through the same route as other coffee-related associations, and shares confounders (e.g., smoking), but is not caused by smoking.

## 8.5 Quantitative Bias Analysis

**Quantitative bias analysis (QBA)** explicitly models the sources of systematic error (selection bias, misclassification, unmeasured confounding) and propagates uncertainty about bias parameters through the analysis.

**Simple bias analysis**: For a single unmeasured binary confounder \( U \) with known or bounded parameters:
- \( \text{RR}_{AU} \): risk ratio of \( U \) on \( A \)
- \( \text{RR}_{UY} \): risk ratio of \( U \) on \( Y \)
- \( P(U = 1 \mid A = 1) \) and \( P(U = 1 \mid A = 0) \): prevalence of \( U \) in treatment groups

The **bias factor** is:
\[ \text{BF} = \frac{\text{RR}_{UY} \times P(U=1 \mid A=1) + P(U=0 \mid A=1)}{\text{RR}_{UY} \times P(U=1 \mid A=0) + P(U=0 \mid A=0)} \]

The **bias-corrected RR** is \( \widehat{\text{RR}}_{\text{corrected}} = \widehat{\text{RR}}_{\text{observed}} / \text{BF} \).

**Probabilistic sensitivity analysis (Monte Carlo bias analysis)**: Rather than fixing bias parameters at a point estimate, assign probability distributions to bias parameters based on prior knowledge. Draw \( S \) samples of bias parameters, compute the bias-corrected estimate for each draw, and summarize the resulting distribution. This produces a **simulation interval** that combines statistical uncertainty (from sampling variability) and systematic uncertainty (from unmeasured confounding).

**Algorithm**:
1. Specify distributions for bias parameters: e.g., \( \text{RR}_{UY} \sim \text{Gamma}(3, 1) \), \( P(U=1|A=1) \sim \text{Beta}(2,3) \)
2. For \( s = 1, \ldots, S \) (e.g., \( S = 10{,}000 \)):
   a. Draw bias parameters from their specified distributions
   b. Compute bias factor BF\( _s \)
   c. Compute bias-corrected estimate: \( \hat{\theta}_s = \hat{\theta}_{\text{obs}} / \text{BF}_s \)
   d. Add sampling variability: \( \hat{\theta}_s^* = \hat{\theta}_s + \text{Normal}(0, \hat{\text{SE}}^2) \)
3. Report the 2.5th–97.5th percentile of \( \{\hat{\theta}_s^*\} \) as the 95% simulation interval

The simulation interval is typically wider than a standard 95% CI, reflecting honest accounting of both sampling and systematic uncertainty.

---

# Chapter 9: Measurement Error and Misclassification

## 9.1 Types of Measurement Error

In biostatistical applications, variables are rarely measured with perfect accuracy. **Measurement error** refers to discrepancies between the observed value \( X^* \) and the true value \( X \):

\[ X^* = X + \varepsilon \]

where \( \varepsilon \) is the measurement error.

<div class="definition">
<strong>Classical measurement error</strong>: \( X^* = X + \varepsilon \) where \( \varepsilon \perp X \) (error is independent of true value). Common in self-reported dietary intake, physical activity measurements.
</div>

<div class="definition">
<strong>Berkson error</strong>: \( X = X^* + \varepsilon \) where \( \varepsilon \perp X^* \) (error is independent of observed assigned value). Occurs when group-average exposures are assigned to individuals (e.g., environmental monitoring stations).
</div>

<div class="definition">
<strong>Misclassification</strong>: Measurement error in categorical variables. A binary variable \( A \) is misclassified when \( A^* \neq A \) for some subjects.
</div>

### 9.1.1 Non-Differential vs. Differential Misclassification

<div class="definition">
<strong>Non-differential misclassification</strong>: The probability of misclassification does not depend on the outcome: \( P(A^* \neq A \mid A, Y) = P(A^* \neq A \mid A) \). Non-differential misclassification of a binary exposure typically biases the relative risk toward the null (attenuation bias).
</div>

<div class="definition">
<strong>Differential misclassification</strong>: The probability of misclassification depends on the outcome (or vice versa). Differential misclassification can bias estimates toward <em>or</em> away from the null, and can even produce spurious associations.
</div>

**Sensitivity and specificity**: For binary misclassified exposure \( A^* \):
- **Sensitivity** (Se): \( P(A^* = 1 \mid A = 1) \)
- **Specificity** (Sp): \( P(A^* = 0 \mid A = 0) \)

## 9.2 Consequences of Measurement Error

**Attenuation bias under classical ME**: For simple linear regression \( Y = \beta_0 + \beta_1 X + \varepsilon_Y \) where \( X^* = X + \varepsilon \) with \( \varepsilon \perp X, \varepsilon_Y \):

\[ \text{plim}\, \hat\beta_1^{\text{OLS}} = \beta_1 \times \underbrace{\frac{\text{Var}(X)}{\text{Var}(X) + \text{Var}(\varepsilon)}}_{\text{attenuation factor (reliability ratio)}} = \beta_1 \times \lambda < \beta_1 \]

The attenuation factor \( \lambda \in [0,1] \) equals the **reliability** of the measurement. OLS underestimates the true effect.

**Misclassification correction**: If Se and Sp are known (from a validation substudy), the corrected exposure proportions can be recovered via:
\[ P(A = 1) = \frac{P(A^* = 1) - (1 - \text{Sp})}{\text{Se} - (1 - \text{Sp})} \]

and cell counts in a 2×2 table can be corrected using the inverse of the misclassification matrix.

## 9.3 Correction Methods

### 9.3.1 Regression Calibration

**Regression calibration** (Carroll et al., 2006): Replace the mismeasured covariate \( X^* \) with the conditional expectation \( E[X \mid X^*, Z] \) estimated from a validation sample. This approximately corrects for attenuation bias and is valid for logistic regression with rare outcomes and for linear regression.

### 9.3.2 SIMEX

**SIMEX (Simulation Extrapolation)** (Cook & Stefanski, 1994): Adds increasing amounts of simulated measurement error to the data, fits the analysis model at each error level, and extrapolates back to zero error. Widely applicable, easy to implement, but approximate.

### 9.3.3 Multiple Imputation for Measurement Error

Measurement error can be framed as a missing data problem: the true \( X \) is "missing," observed only through the error-prone \( X^* \). MI can then impute the true \( X \) using a measurement model (from a validation substudy) and apply Rubin's rules for combining estimates.

---

# Appendix: Key Formulas and Reference Table

## A.1 Identification Formulas Summary

| Quantity | Formula |
|---|---|
| G-formula | \( E[Y^a] = \sum_\ell E[Y \mid A=a, \mathbf{L}=\ell] P(\mathbf{L}=\ell) \) |
| IPW estimator | \( \hat{E}[Y^a] = n^{-1} \sum_i \frac{\mathbf{1}(A_i=a)}{P(A_i \mid \mathbf{L}_i)} Y_i \) |
| Stabilized weight | \( W^s = P(A)/P(A \mid \mathbf{L}) \) |
| Time-varying IPTW | \( \bar{W} = \prod_t P(A_t \mid \bar{A}_{t-1}) / P(A_t \mid \bar{A}_{t-1}, \bar{L}_t) \) |
| IV estimator | \( \hat\beta_{\text{IV}} = \text{Cov}(Z,Y)/\text{Cov}(Z,A) \) |
| E-value | \( E = \text{RR} + \sqrt{\text{RR} \times (\text{RR}-1)} \) |

## A.2 Rubin's Rules Summary

| Quantity | Formula |
|---|---|
| Pooled estimate | \( \bar{Q} = m^{-1}\sum_l \hat{Q}_l \) |
| Within-variance | \( \bar{U} = m^{-1}\sum_l \hat{U}_l \) |
| Between-variance | \( B = (m-1)^{-1}\sum_l (\hat{Q}_l - \bar{Q})^2 \) |
| Total variance | \( T = \bar{U} + (1 + m^{-1})B \) |
| Degrees of freedom | \( \nu = (m-1)[1 + \bar{U}/((1+m^{-1})B)]^2 \) |
| Fraction missing info | \( \lambda = (1+m^{-1})B/T \) |
| Relative efficiency | \( \text{RE} = (1 + \lambda/m)^{-1} \) |

## A.3 Missing Data Mechanisms

| Mechanism | Definition | Complete case valid? | MI valid? |
|---|---|---|---|
| MCAR | \( P(R \mid Y_{\text{obs}}, Y_{\text{mis}}) = P(R) \) | Yes | Yes |
| MAR | \( P(R \mid Y_{\text{obs}}, Y_{\text{mis}}) = P(R \mid Y_{\text{obs}}) \) | Usually no | Yes |
| MNAR | Depends on \( Y_{\text{mis}} \) | No | No (without model) |

## A.4 Notation Glossary

| Symbol | Meaning |
|---|---|
| \( Y^a \) | Potential outcome under treatment \( a \) |
| \( A \) | Treatment (often binary: 0/1) |
| \( \mathbf{L} \) | Measured confounders |
| \( \mathbf{U} \) | Unmeasured confounders |
| \( e(\mathbf{L}) \) | Propensity score \( P(A=1 \mid \mathbf{L}) \) |
| \( W \) | IPW weight |
| \( Z \) | Instrumental variable |
| \( R \) | Missingness indicator (1 = observed) |
| \( \lambda \) | Fraction of missing information |
| \( \Gamma \) | Rosenbaum sensitivity parameter |
| \( E \) | E-value |

---

# Chapter 10: Propensity Score Methods

## 10.1 The Propensity Score

As established in Chapter 3, the **propensity score** \( e(\mathbf{L}) = P(A = 1 \mid \mathbf{L}) \) is the conditional probability of receiving treatment given the observed covariates. Rosenbaum & Rubin (1983) proved two fundamental results:

1. **Balancing property**: \( A \perp \mathbf{L} \mid e(\mathbf{L}) \) — conditional on the propensity score, treatment is independent of covariates. The propensity score is a **balancing score**.
2. **Sufficiency for adjustment**: If \( Y^a \perp A \mid \mathbf{L} \), then also \( Y^a \perp A \mid e(\mathbf{L}) \) — adjusting for the scalar propensity score is sufficient for confounding control, reducing the dimensionality problem.

In practice, \( e(\mathbf{L}) \) is estimated using logistic regression, generalized boosted models, or random forests.

## 10.2 Propensity Score Matching

**Propensity score matching (PSM)** constructs a comparison group by pairing each treated unit with one or more control units having similar propensity scores.

**Common matching algorithms**:
- **Nearest-neighbor matching (1:1)**: Each treated unit is matched to the control unit with the closest propensity score. Can be with or without replacement.
- **Caliper matching**: Nearest-neighbor matching but only if the propensity score difference falls within a caliper (typically 0.2 SD of the logit of the propensity score).
- **Kernel matching**: Each treated unit is matched to a weighted average of all control units, with weights decreasing in distance.
- **Optimal matching**: Minimizes total propensity score distance across all pairs globally.

**Target estimand of PSM**: PSM estimates the ATT (average treatment effect in the treated) rather than the ATE, because only treated units are matched (controls are selected to resemble the treated).

**After matching — balance assessment**: The quality of matching is assessed by checking **covariate balance** in the matched sample. Standardized mean differences (SMD) should be \( < 0.1 \) for all covariates. Love plots (dot plots of SMD before/after matching) are the standard display.

<div class="definition">
<strong>Standardized mean difference</strong>: For covariate \( L \), the SMD is:
\[ \text{SMD} = \frac{\bar{L}_{\text{treated}} - \bar{L}_{\text{control}}}{\sqrt{(s^2_{\text{treated}} + s^2_{\text{control}})/2}} \]
SMD \( < 0.1 \) is typically considered good balance; SMD \( > 0.2 \) indicates poor balance.
</div>

## 10.3 Propensity Score Stratification

**Stratification on the propensity score** divides the sample into \( K \) strata (typically \( K = 5 \)) based on quintiles of \( \hat{e}(\mathbf{L}_i) \). Within each stratum, the propensity score is approximately constant, so treated and control units within a stratum are approximately exchangeable. The within-stratum treatment effect estimates are then pooled.

**Cochran (1968) showed** that 5 strata can remove approximately 90% of the bias due to a single continuous confounder. However, with multiple confounders, 5 strata may be insufficient.

## 10.4 Propensity Score Adjustment

In **propensity score adjustment**, the estimated propensity score is included as a covariate in the outcome regression:

\[ E[Y \mid A, \hat{e}(\mathbf{L})] = \beta_0 + \beta_1 A + \beta_2 \hat{e}(\mathbf{L}) \]

This combines outcome modeling with propensity score adjustment and can be more efficient than matching. However, if the outcome model is misspecified, residual confounding may remain.

## 10.5 Comparison of Methods: G-Computation, IPW, PSM, AIPW

| Method | Model Required | Target Estimand | Doubly Robust? | Efficiency |
|---|---|---|---|---|
| G-computation | Outcome model | ATE or ATT | No | High if outcome model correct |
| IPW (IPTW) | Propensity model | ATE (stabilized: ATT) | No | Moderate, sensitive to extreme weights |
| PSM | Propensity model | ATT | No | Moderate (matched subset only) |
| AIPW/TMLE | Both models | ATE | Yes | Semiparametrically efficient |

**Practical recommendation**: Use AIPW or TMLE with flexible machine learning models for both the outcome and propensity score models. Check positivity and balance diagnostics. Report multiple methods as sensitivity analysis.

---

# Chapter 11: Implementation in R

## 11.1 G-Computation in R

```r
# Fit outcome model
fit <- glm(Y ~ A + L1 + L2, data = dat, family = gaussian())

# Predict under treatment and control for all subjects
dat_treated <- dat; dat_treated$A <- 1
dat_control <- dat; dat_control$A <- 0

EY1 <- mean(predict(fit, newdata = dat_treated, type = "response"))
EY0 <- mean(predict(fit, newdata = dat_control, type = "response"))
ATE_gcomp <- EY1 - EY0

# Bootstrap for standard errors
library(boot)
gcomp_boot <- function(data, idx) {
  d <- data[idx, ]
  m <- glm(Y ~ A + L1 + L2, data = d, family = gaussian())
  d1 <- d; d1$A <- 1; d0 <- d; d0$A <- 0
  mean(predict(m, d1, type="response")) - mean(predict(m, d0, type="response"))
}
boot_res <- boot(dat, gcomp_boot, R = 1000)
boot.ci(boot_res, type = "perc")
```

## 11.2 IPW in R

```r
library(WeightIt)
# Estimate propensity scores and compute weights
w_out <- weightit(A ~ L1 + L2 + L3, data = dat,
                  method = "ps", estimand = "ATE")
summary(w_out)  # Check weight distribution

# Fit weighted outcome model (MSM)
library(survey)
des <- svydesign(ids = ~1, weights = ~w_out$weights, data = dat)
msm_fit <- svyglm(Y ~ A, design = des)
coef(msm_fit)["A"]  # ATE estimate

# Check balance
library(cobalt)
bal.tab(w_out, stats = c("mean.diffs", "variance.ratios"))
love.plot(w_out, thresholds = c(m = .1))
```

## 11.3 Multiple Imputation with MICE in R

```r
library(mice)
# Inspect missing data pattern
md.pattern(dat)

# Run MICE with m=20 imputations, 10 iterations
imp <- mice(dat, m = 20, maxit = 10, method = "pmm", seed = 123)

# Check convergence
plot(imp)  # Trace plots

# Fit analysis model to each imputed dataset
fits <- with(imp, lm(Y ~ A + L1 + L2))

# Pool results using Rubin's rules
pooled <- pool(fits)
summary(pooled)
```

## 11.4 E-Value Computation in R

```r
library(EValue)
# For a risk ratio of 2.5
evalues.RR(est = 2.5, lo = 1.8, hi = 3.5)

# Output:
#           point  lower  upper
# RR        2.500  1.800  3.500
# E-values  4.436  3.000  6.468
```

## 11.5 Instrumental Variables in R

```r
library(ivreg)
# Two-stage least squares
iv_fit <- ivreg(Y ~ A + X1 + X2 | Z + X1 + X2, data = dat)
summary(iv_fit, diagnostics = TRUE)
# diagnostics: Weak instruments F-test, Wu-Hausman endogeneity test

# Mendelian randomization (summary-level data)
library(MendelianRandomization)
MRInput <- mr_input(bx = beta_exposure,
                    bxse = se_exposure,
                    by = beta_outcome,
                    byse = se_outcome)
mr_ivw(MRInput)   # IVW estimate
mr_egger(MRInput) # MR-Egger with intercept test for pleiotropy
```
