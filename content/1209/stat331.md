---
title: "STAT 331: Applied Linear Models"
subjects: "STAT"
prof: "Samuel Wong"
---

## Sources and References

**Primary notes** — Cameron Roopnarine (Hextical), *STAT 331: Applied Linear Models, Fall 2020*, [hextical.github.io/university-notes](https://hextical.github.io/university-notes/)
**Supplementary notes** — Richard Wu, *STAT 331 Notes*, [richardwu.ca](https://www.richardwu.ca/notes/stat331-notes.pdf); David Duan, *STAT 331 Master Notes*, [david-duan.me](https://www.david-duan.me/assets/course-notes/4a/stat-331-master.pdf)
**Textbook** — Abraham and Ledolter, *Introduction to Regression Modeling*

# Chapter 1: Simple Linear Regression

## 1.1 Overview and Motivation

Regression analysis is the study of how a **response variable** (also called the dependent variable) relates to one or more **explanatory variables** (also called independent variables, predictors, or covariates). We denote the response by \(Y\) and the predictors by \(x_1, x_2, \ldots, x_p\). A **regression model** captures the functional relationship between the response and the predictors, and in this course the focus is on models that are *linear in the parameters*.

A general **linear model** takes the form

\[
Y = \beta_0 + \beta_1 x_1 + \cdots + \beta_p x_p + \varepsilon,
\]
where \(\beta_0\) is the intercept, \(\beta_1, \ldots, \beta_p\) are regression coefficients that quantify the effect of each predictor on the response, and \(\varepsilon\) is a random error term satisfying \(\varepsilon \sim \mathcal{N}(0, \sigma^2)\). The term "linear" refers to linearity in the parameters \(\beta_j\), not necessarily in the predictors themselves.

## 1.2 The Simple Linear Regression Model

When there is only one explanatory variable, the model becomes the **simple linear regression** (SLR) model. For data pairs \((x_i, y_i)\), \(i = 1, \ldots, n\), we write

\[
Y_i = \beta_0 + \beta_1 x_i + \varepsilon_i, \qquad \varepsilon_i \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2).
\]

The standard assumptions, often remembered by the acronym **LINE**, are:

1. **Linearity**: the expected response is a linear function of \(x\).
2. **Independence**: the error terms \(\varepsilon_1, \ldots, \varepsilon_n\) are independent.
3. **Normality**: each \(\varepsilon_i\) follows a normal distribution.
4. **Equal variance** (homoscedasticity): \(\operatorname{Var}(\varepsilon_i) = \sigma^2\) for all \(i\).

Under these assumptions, each observation satisfies

\[
Y_i \overset{\text{indep}}{\sim} \mathcal{N}(\beta_0 + \beta_1 x_i, \, \sigma^2).
\]

Here \(\beta_0, \beta_1, \sigma^2\) are fixed but unknown parameters; \(\varepsilon_i\) are unobserved random quantities; and \(y_i, x_i\) are observed data (we treat \(x_i\) as fixed constants throughout this course).

### Interpretation of Parameters

- \(\beta_0\) is the expected value of \(Y\) when \(x = 0\). This may not always be scientifically meaningful if \(x = 0\) is outside the range of observed data.
- \(\beta_1\) is the expected change in \(Y\) for a one-unit increase in \(x\): \(\mathbb{E}[Y \mid x = x^* + 1] - \mathbb{E}[Y \mid x = x^*] = \beta_1\).

### Sample Correlation

Before fitting a model, it is wise to examine the **sample correlation coefficient**, which measures the strength and direction of the linear association between \(x\) and \(y\):

\[
r = \frac{S_{xy}}{\sqrt{S_{xx} \, S_{yy}}},
\]
where

\[
S_{xx} = \sum_{i=1}^n (x_i - \bar{x})^2, \qquad S_{xy} = \sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y}), \qquad S_{yy} = \sum_{i=1}^n (y_i - \bar{y})^2.
\]

The correlation satisfies \(-1 \leq r \leq 1\). Values of \(|r|\) near 1 indicate a strong linear relationship, while values near 0 suggest a weak one.

## 1.3 Ordinary Least Squares Estimation

<div class="definition">
<strong>Least Squares Criterion.</strong> The <strong>method of least squares</strong> estimates \(\beta_0\) and \(\beta_1\) by minimizing the sum of squared residuals:

\[
S(\beta_0, \beta_1) = \sum_{i=1}^n \bigl(y_i - (\beta_0 + \beta_1 x_i)\bigr)^2.
\]
</div>

<div class="theorem">
<strong>Least Squares Estimators for SLR.</strong> The OLS estimators are

\[
\hat{\beta}_1 = \frac{S_{xy}}{S_{xx}} = \frac{\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^n (x_i - \bar{x})^2}, \qquad \hat{\beta}_0 = \bar{y} - \hat{\beta}_1 \bar{x}.
\]
</div>

<div class="proof">
Taking partial derivatives and setting them to zero:

\[
\frac{\partial S}{\partial \beta_0} = -2 \sum_{i=1}^n \bigl(y_i - \beta_0 - \beta_1 x_i\bigr) = 0 \quad \Longrightarrow \quad \hat{\beta}_0 = \bar{y} - \hat{\beta}_1 \bar{x}.
\]

\[
\frac{\partial S}{\partial \beta_1} = -2 \sum_{i=1}^n x_i \bigl(y_i - \beta_0 - \beta_1 x_i\bigr) = 0.
\]
Substituting the expression for \(\hat{\beta}_0\) into the second equation and simplifying yields

\[
\hat{\beta}_1 = \frac{\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{\sum_{i=1}^n (x_i - \bar{x})^2} = \frac{S_{xy}}{S_{xx}}.
\]
</div>

### Equivalence with Maximum Likelihood

Under the normal error assumption, the joint likelihood of \(Y_1, \ldots, Y_n\) is

\[
L(\beta_0, \beta_1, \sigma^2) = \prod_{i=1}^n \frac{1}{\sqrt{2\pi\sigma^2}} \exp\!\left(-\frac{(y_i - \beta_0 - \beta_1 x_i)^2}{2\sigma^2}\right).
\]
The log-likelihood is

\[
\ell(\beta_0, \beta_1, \sigma^2) = -\frac{n}{2}\ln(2\pi) - \frac{n}{2}\ln(\sigma^2) - \frac{1}{2\sigma^2}\sum_{i=1}^n (y_i - \beta_0 - \beta_1 x_i)^2.
\]
Maximizing \(\ell\) with respect to \(\beta_0\) and \(\beta_1\) is equivalent to minimizing the sum of squares, so the ML estimators coincide with the LS estimators.

### Fitted Values and Residuals

<div class="definition">
The <strong>fitted values</strong> are \(\hat{\mu}_i = \hat{\beta}_0 + \hat{\beta}_1 x_i\). The <strong>residuals</strong> are \(e_i = y_i - \hat{\mu}_i\).
</div>

Two fundamental constraints on the residuals follow directly from the normal equations:

\[
\sum_{i=1}^n e_i = 0, \qquad \sum_{i=1}^n x_i e_i = 0.
\]
These constraints reduce the degrees of freedom from \(n\) to \(n - 2\), since two parameters have been estimated.

### Estimating the Error Variance

The unbiased estimator of \(\sigma^2\) is

\[
\hat{\sigma}^2 = \frac{\text{SS(Res)}}{n - 2} = \frac{\sum_{i=1}^n e_i^2}{n - 2}.
\]
The denominator \(n - 2\) corrects for the two estimated parameters. The **residual standard error** is \(\hat{\sigma} = \sqrt{\hat{\sigma}^2}\).

## 1.4 Inference on the Slope and Intercept

### Sampling Distribution of the Estimators

Since \(\hat{\beta}_1\) is a linear combination of the normally distributed \(Y_i\), it is itself normal.

<div class="theorem">
<strong>Distribution of the LS Estimators.</strong>

\[
\hat{\beta}_1 \sim \mathcal{N}\!\left(\beta_1, \frac{\sigma^2}{S_{xx}}\right), \qquad \hat{\beta}_0 \sim \mathcal{N}\!\left(\beta_0, \sigma^2\!\left(\frac{1}{n} + \frac{\bar{x}^2}{S_{xx}}\right)\right).
\]
In particular, both estimators are unbiased: \(\mathbb{E}[\hat{\beta}_1] = \beta_1\) and \(\mathbb{E}[\hat{\beta}_0] = \beta_0\).
</div>

<div class="proof">
Write \(\hat{\beta}_1 = \sum_{i=1}^n a_i Y_i\) where \(a_i = (x_i - \bar{x})/S_{xx}\). Then

\[
\mathbb{E}[\hat{\beta}_1] = \sum a_i(\beta_0 + \beta_1 x_i) = \beta_0 \underbrace{\sum a_i}_{=0} + \beta_1 \underbrace{\sum a_i x_i}_{=1} = \beta_1.
\]
For the variance, independence of the \(Y_i\) gives

\[
\operatorname{Var}(\hat{\beta}_1) = \sum a_i^2 \sigma^2 = \sigma^2 \frac{\sum (x_i - \bar{x})^2}{S_{xx}^2} = \frac{\sigma^2}{S_{xx}}.
\]
The result for \(\hat{\beta}_0\) follows similarly from \(\hat{\beta}_0 = \bar{Y} - \hat{\beta}_1 \bar{x}\), using the fact that \(\operatorname{Cov}(\bar{Y}, \hat{\beta}_1) = 0\).
</div>

### Standard Error and the t-Statistic

<div class="definition">
The <strong>standard error</strong> of \(\hat{\beta}_1\) is \(\operatorname{SE}(\hat{\beta}_1) = \hat{\sigma}/\sqrt{S_{xx}}\), obtained by replacing the unknown \(\sigma\) with its estimate \(\hat{\sigma}\).
</div>

Since \(\text{SS(Res)}/\sigma^2 \sim \chi^2(n-2)\) and is independent of \(\hat{\beta}_1\), we obtain

\[
T = \frac{\hat{\beta}_1 - \beta_1}{\operatorname{SE}(\hat{\beta}_1)} \sim t(n-2).
\]

### Confidence Intervals

A \(100(1-\alpha)\%\) confidence interval for \(\beta_1\) is

\[
\hat{\beta}_1 \pm t_{1-\alpha/2, \, n-2} \cdot \operatorname{SE}(\hat{\beta}_1),
\]
where \(t_{1-\alpha/2, \, n-2}\) is the appropriate quantile of the \(t\)-distribution with \(n - 2\) degrees of freedom. An analogous interval exists for \(\beta_0\).

### Hypothesis Testing

To test \(H_0\colon \beta_1 = 0\) against \(H_A\colon \beta_1 \neq 0\), compute the test statistic

\[
t = \frac{\hat{\beta}_1}{\operatorname{SE}(\hat{\beta}_1)} \sim t(n-2) \quad \text{under } H_0.
\]
The two-sided p-value is \(p = \Pr(|T| \geq |t|)\). We reject \(H_0\) at significance level \(\alpha\) when \(p < \alpha\). A rejection implies that there is statistically significant evidence of a linear relationship between \(x\) and \(Y\).

<div class="remark">
A \(100(1-\alpha)\%\) confidence interval and a hypothesis test at the \(\alpha\) significance level are consistent: \(H_0\colon \beta_1 = 0\) is rejected at level \(\alpha\) if and only if \(0\) lies outside the \(100(1-\alpha)\%\) CI for \(\beta_1\).
</div>

## 1.5 ANOVA Decomposition for SLR

The total variability in the response can be decomposed as

\[
\underbrace{\sum_{i=1}^n (y_i - \bar{y})^2}_{\text{SS(Total)}} = \underbrace{\sum_{i=1}^n (\hat{\mu}_i - \bar{y})^2}_{\text{SS(Reg)}} + \underbrace{\sum_{i=1}^n (y_i - \hat{\mu}_i)^2}_{\text{SS(Res)}}.
\]
This identity holds because the cross-product term vanishes: \(\sum e_i(\hat{\mu}_i - \bar{y}) = 0\), a consequence of the orthogonality of the residual and fitted value vectors.

The **coefficient of determination** is

\[
R^2 = \frac{\text{SS(Reg)}}{\text{SS(Total)}} = 1 - \frac{\text{SS(Res)}}{\text{SS(Total)}},
\]
and represents the proportion of variability in \(Y\) explained by the linear model. In simple linear regression, \(R^2 = r^2\), where \(r\) is the sample correlation.

## 1.6 Prediction and Confidence Intervals

### Confidence Interval for the Mean Response

For a new value \(x_0\), the estimated mean response is \(\hat{\mu}_0 = \hat{\beta}_0 + \hat{\beta}_1 x_0\). Its distribution is

\[
\hat{\mu}_0 \sim \mathcal{N}\!\left(\mu_0, \; \sigma^2\!\left(\frac{1}{n} + \frac{(x_0 - \bar{x})^2}{S_{xx}}\right)\right),
\]
so a \(100(1-\alpha)\%\) confidence interval for the mean response \(\mu_0 = \beta_0 + \beta_1 x_0\) is

\[
\hat{\mu}_0 \pm t_{1-\alpha/2,\,n-2}\;\hat{\sigma}\sqrt{\frac{1}{n} + \frac{(x_0 - \bar{x})^2}{S_{xx}}}.
\]

### Prediction Interval for a New Observation

For a future observation \(Y_0 \sim \mathcal{N}(\beta_0 + \beta_1 x_0, \sigma^2)\), the prediction error \(Y_0 - \hat{\mu}_0\) has variance

\[
\operatorname{Var}(Y_0 - \hat{\mu}_0) = \sigma^2 + \sigma^2\!\left(\frac{1}{n} + \frac{(x_0 - \bar{x})^2}{S_{xx}}\right) = \sigma^2\!\left(1 + \frac{1}{n} + \frac{(x_0 - \bar{x})^2}{S_{xx}}\right).
\]
A \(100(1-\alpha)\%\) **prediction interval** for \(Y_0\) is

\[
\hat{\mu}_0 \pm t_{1-\alpha/2,\,n-2}\;\hat{\sigma}\sqrt{1 + \frac{1}{n} + \frac{(x_0 - \bar{x})^2}{S_{xx}}}.
\]

<div class="remark">
The prediction interval is always wider than the confidence interval for the mean because it accounts for two sources of uncertainty: estimation error in the regression line and the inherent variability of a new observation. Both intervals widen as \(x_0\) moves away from \(\bar{x}\). Extrapolating beyond the range of the data is generally unreliable.
</div>

<div class="example">
<strong>Florida Orange Production.</strong> With \(n = 25\) counties, \(r = 0.964\), \(\bar{x} = 16{,}133\) acres, \(\bar{y} = 1{,}798\) (thousands of boxes), \(S_{xx} = 1.245 \times 10^{10}\), and \(S_{xy} = 1.453 \times 10^{9}\), we obtain \(\hat{\beta}_1 = 0.1167\) and \(\hat{\beta}_0 = -85.3\). Testing \(H_0\colon \beta_1 = 0\) gives \(t = 17.3\) on 23 d.f., with p-value \(\approx 1.2 \times 10^{-14}\), providing overwhelming evidence of a linear relationship between acreage and production.
</div>

## 1.7 Correlation and the Pearson Coefficient

The **Pearson correlation coefficient** between \(X\) and \(Y\) is

\[
\rho = \frac{\text{Cov}(X,Y)}{\sqrt{\text{Var}(X)\,\text{Var}(Y)}}.
\]

Its sample estimate is \(r = S_{xy}/\sqrt{S_{xx} S_{yy}}\), which satisfies \(-1 \leq r \leq 1\). In SLR, \(r = \hat\beta_1\sqrt{S_{xx}/S_{yy}}\), and crucially, \(R^2 = r^2\).

### Testing \(H_0\colon \rho = 0\)

Under the assumption of bivariate normality, the statistic

\[
T = \frac{r\sqrt{n-2}}{\sqrt{1-r^2}} \sim t(n-2) \quad \text{under } H_0\colon \rho = 0
\]
is identical to the t-test for \(H_0\colon \beta_1 = 0\) in SLR. Thus testing zero correlation is the same as testing zero slope.

### Confidence Interval for \(\rho\)

For general \(\rho \neq 0\), the distribution of \(r\) is skewed, making a direct CI difficult. Fisher's **z-transformation** stabilises the variance:

\[
z = \frac{1}{2}\ln\!\left(\frac{1+r}{1-r}\right) = \tanh^{-1}(r).
\]
The transformed statistic satisfies \(z \approx \mathcal{N}(\tanh^{-1}(\rho), 1/(n-3))\) for large \(n\). A \(100(1-\alpha)\%\) CI for \(\rho\) is obtained by:
1. Computing \(z \pm z_{\alpha/2}/\sqrt{n-3}\).
2. Back-transforming via \(\rho = (e^{2z}-1)/(e^{2z}+1) = \tanh(z)\).

<div class="example">
<strong>Example.</strong> With \(n = 25\) and \(r = 0.964\) (Florida orange data), Fisher's transform gives \(z = \tanh^{-1}(0.964) = 2.064\). A 95% CI for \(z\) is \(2.064 \pm 1.96/\sqrt{22} = (1.646, 2.482)\). Back-transforming: \(\rho \in (\tanh(1.646), \tanh(2.482)) = (0.927, 0.985)\).
</div>

---

# Chapter 2: Multiple Linear Regression

## 2.1 Matrix Formulation

When there are \(p\) predictors, the model for \(n\) observations is

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \cdots + \beta_p x_{ip} + \varepsilon_i, \qquad \varepsilon_i \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2),
\]
which can be written compactly as

\[
\boldsymbol{Y} = X\boldsymbol{\beta} + \boldsymbol{\varepsilon},
\]
where

\[
\boldsymbol{Y} = \begin{bmatrix} Y_1 \\ \vdots \\ Y_n \end{bmatrix}_{n \times 1}, \quad
X = \begin{bmatrix} 1 & x_{11} & \cdots & x_{1p} \\ \vdots & \vdots & \ddots & \vdots \\ 1 & x_{n1} & \cdots & x_{np} \end{bmatrix}_{n \times (p+1)}, \quad
\boldsymbol{\beta} = \begin{bmatrix} \beta_0 \\ \vdots \\ \beta_p \end{bmatrix}_{(p+1) \times 1}, \quad
\boldsymbol{\varepsilon} = \begin{bmatrix} \varepsilon_1 \\ \vdots \\ \varepsilon_n \end{bmatrix}_{n \times 1}.
\]

The matrix \(X\) is called the **design matrix**. Under the model assumptions, \(\boldsymbol{\varepsilon} \sim \text{MVN}(\boldsymbol{0}, \sigma^2 I_n)\), so \(\boldsymbol{Y} \sim \text{MVN}(X\boldsymbol{\beta}, \sigma^2 I_n)\).

### Random Vectors and Covariance Matrices

<div class="definition">
For a <strong>random vector</strong> \(\boldsymbol{Y} = (Y_1, \ldots, Y_n)^\top\), the <strong>mean vector</strong> is \(\mathbb{E}[\boldsymbol{Y}] = (\mathbb{E}[Y_1], \ldots, \mathbb{E}[Y_n])^\top\) and the <strong>covariance matrix</strong> is the \(n \times n\) matrix with \((i,j)\) entry \(\operatorname{Cov}(Y_i, Y_j)\):

\[
\operatorname{Var}(\boldsymbol{Y}) = \mathbb{E}\!\left[(\boldsymbol{Y} - \mathbb{E}[\boldsymbol{Y}])(\boldsymbol{Y} - \mathbb{E}[\boldsymbol{Y}])^\top\right].
\]
This matrix is symmetric and positive semi-definite.
</div>

Key properties for a constant matrix \(A\) and a constant vector \(\boldsymbol{b}\):

\[
\mathbb{E}[A\boldsymbol{Y} + \boldsymbol{b}] = A\mathbb{E}[\boldsymbol{Y}] + \boldsymbol{b}, \qquad \operatorname{Var}(A\boldsymbol{Y} + \boldsymbol{b}) = A\operatorname{Var}(\boldsymbol{Y})A^\top.
\]

### Multivariate Normal Distribution

<div class="definition">
A random vector \(\boldsymbol{Y}\) has a <strong>multivariate normal distribution</strong> \(\text{MVN}(\boldsymbol{\mu}, \Sigma)\) if its density is

\[
f(\boldsymbol{y}; \boldsymbol{\mu}, \Sigma) = \frac{1}{(2\pi)^{n/2}|\Sigma|^{1/2}} \exp\!\left\{-\frac{1}{2}(\boldsymbol{y} - \boldsymbol{\mu})^\top \Sigma^{-1}(\boldsymbol{y} - \boldsymbol{\mu})\right\}.
\]
</div>

Important properties of the MVN:

1. Any subset of \(\boldsymbol{Y}\) is also MVN.
2. Any linear transformation \(A\boldsymbol{Y} + \boldsymbol{d}\) is MVN with mean \(A\boldsymbol{\mu} + \boldsymbol{d}\) and covariance \(A\Sigma A^\top\).
3. Components \(Y_i\) and \(Y_j\) are independent if and only if \(\Sigma_{ij} = 0\).

## 2.2 OLS in Matrix Form

<div class="theorem">
<strong>Least Squares Estimator for MLR.</strong> Assuming \(X^\top X\) is invertible (i.e., \(\operatorname{rank}(X) = p + 1\)),

\[
\hat{\boldsymbol{\beta}} = (X^\top X)^{-1} X^\top \boldsymbol{y}.
\]
</div>

<div class="proof">
The sum of squares function is

\[
S(\boldsymbol{\beta}) = (\boldsymbol{y} - X\boldsymbol{\beta})^\top(\boldsymbol{y} - X\boldsymbol{\beta}) = \boldsymbol{y}^\top\boldsymbol{y} - 2\boldsymbol{\beta}^\top X^\top \boldsymbol{y} + \boldsymbol{\beta}^\top X^\top X \boldsymbol{\beta}.
\]
Taking the matrix derivative and setting it to zero:

\[
\frac{\partial S}{\partial \boldsymbol{\beta}} = -2X^\top \boldsymbol{y} + 2X^\top X \boldsymbol{\beta} = \boldsymbol{0} \quad \Longrightarrow \quad \hat{\boldsymbol{\beta}} = (X^\top X)^{-1}X^\top \boldsymbol{y}.
\]
The invertibility of \(X^\top X\) requires the columns of \(X\) to be linearly independent, which holds when \(n \geq p + 1\) and no predictor is a perfect linear combination of others.
</div>

The fitted values and residuals are

\[
\hat{\boldsymbol{\mu}} = X\hat{\boldsymbol{\beta}}, \qquad \boldsymbol{e} = \boldsymbol{y} - \hat{\boldsymbol{\mu}}.
\]

The unbiased estimator of \(\sigma^2\) is

\[
\hat{\sigma}^2 = \frac{\boldsymbol{e}^\top \boldsymbol{e}}{n - p - 1} = \frac{\text{SS(Res)}}{n - p - 1}.
\]

## 2.3 The Hat Matrix

<div class="definition">
The <strong>hat matrix</strong> is defined as

\[
H = X(X^\top X)^{-1}X^\top.
\]
It maps the observed responses to the fitted values: \(\hat{\boldsymbol{\mu}} = H\boldsymbol{y}\).
</div>

Key properties of \(H\):

1. **Symmetric**: \(H^\top = H\).
2. **Idempotent**: \(H^2 = H\).
3. \(I - H\) is also symmetric and idempotent, and \(\boldsymbol{e} = (I - H)\boldsymbol{y}\).
4. \(\operatorname{tr}(H) = p + 1\) and \(\operatorname{tr}(I - H) = n - (p + 1)\).

The fitted values and residuals, viewed as random vectors, have the distributions:

\[
\hat{\boldsymbol{\mu}} \sim \text{MVN}(X\boldsymbol{\beta}, \sigma^2 H), \qquad \boldsymbol{e} \sim \text{MVN}(\boldsymbol{0}, \sigma^2(I - H)).
\]

Moreover, \(\hat{\boldsymbol{\beta}}\) and \(\boldsymbol{e}\) are independent, which is crucial for the validity of \(t\)- and \(F\)-tests.

## 2.4 Distribution of the OLS Estimator and Inference

<div class="theorem">
<strong>Distribution of \(\hat{\boldsymbol{\beta}}\).</strong> Under the normal linear model,

\[
\hat{\boldsymbol{\beta}} \sim \text{MVN}\!\left(\boldsymbol{\beta}, \; \sigma^2 (X^\top X)^{-1}\right).
\]
In particular, for each coefficient \(j = 0, 1, \ldots, p\),

\[
\hat{\beta}_j \sim \mathcal{N}\!\left(\beta_j, \; \sigma^2 V_{jj}\right),
\]
where \(V_{jj} = [(X^\top X)^{-1}]_{jj}\).
</div>

<div class="proof">
Since \(\hat{\boldsymbol{\beta}} = (X^\top X)^{-1}X^\top \boldsymbol{Y}\) is a linear transformation of the MVN vector \(\boldsymbol{Y}\):

\[
\mathbb{E}[\hat{\boldsymbol{\beta}}] = (X^\top X)^{-1}X^\top \mathbb{E}[\boldsymbol{Y}] = (X^\top X)^{-1}X^\top X\boldsymbol{\beta} = \boldsymbol{\beta}.
\]

\[
\operatorname{Var}(\hat{\boldsymbol{\beta}}) = (X^\top X)^{-1}X^\top (\sigma^2 I) \bigl[(X^\top X)^{-1}X^\top\bigr]^\top = \sigma^2(X^\top X)^{-1}.
\]
</div>

### Confidence Intervals and Hypothesis Tests for Individual Coefficients

The standard error of \(\hat{\beta}_j\) is \(\operatorname{SE}(\hat{\beta}_j) = \hat{\sigma}\sqrt{V_{jj}}\). The pivotal quantity

\[
T = \frac{\hat{\beta}_j - \beta_j}{\operatorname{SE}(\hat{\beta}_j)} \sim t(n - p - 1)
\]
yields a \(100(1-\alpha)\%\) confidence interval

\[
\hat{\beta}_j \pm t_{1-\alpha/2, \, n-p-1}\;\operatorname{SE}(\hat{\beta}_j).
\]

To test \(H_0\colon \beta_j = 0\), the test statistic is \(t = \hat{\beta}_j / \operatorname{SE}(\hat{\beta}_j)\) compared to \(t(n-p-1)\).

### Interpretation of Coefficients

- \(\hat{\beta}_0\) estimates the expected response when all predictors equal zero.
- \(\hat{\beta}_j\) estimates the change in the expected response for a one-unit increase in \(x_j\), *holding all other predictors constant*.

### Gauss--Markov Theorem

Among all unbiased linear estimators of \(\boldsymbol{\beta}\), the OLS estimator has the smallest variance. Formally, for any other unbiased estimator \(\hat{\boldsymbol{\beta}}^* = M^*\boldsymbol{Y}\), we have \(\operatorname{Var}(\hat{\boldsymbol{\beta}}^*) - \operatorname{Var}(\hat{\boldsymbol{\beta}})\) positive semi-definite. This result holds without requiring normality of errors.

## 2.5 Prediction in MLR

For a new covariate vector \(\boldsymbol{x}_0 = (1, x_{01}, \ldots, x_{0p})\), the predicted mean response is \(\hat{\mu}_0 = \boldsymbol{x}_0 \hat{\boldsymbol{\beta}}\).

A \(100(1-\alpha)\%\) **confidence interval for the mean** response at \(\boldsymbol{x}_0\) is

\[
\hat{\mu}_0 \pm t_{1-\alpha/2, \, n-p-1}\;\hat{\sigma}\sqrt{\boldsymbol{x}_0 (X^\top X)^{-1} \boldsymbol{x}_0^\top}.
\]

A \(100(1-\alpha)\%\) **prediction interval** for a new observation at \(\boldsymbol{x}_0\) is

\[
\hat{\mu}_0 \pm t_{1-\alpha/2, \, n-p-1}\;\hat{\sigma}\sqrt{1 + \boldsymbol{x}_0 (X^\top X)^{-1} \boldsymbol{x}_0^\top}.
\]

The prediction interval is wider because the variance of the prediction error is \(\sigma^2(1 + \boldsymbol{x}_0(X^\top X)^{-1}\boldsymbol{x}_0^\top)\), incorporating both the inherent noise \(\sigma^2\) and estimation uncertainty.

## 2.6 Partial F-Tests and ANOVA

### ANOVA Decomposition

\[
\text{SS(Total)} = \text{SS(Reg)} + \text{SS(Res)},
\]
where

\[
\text{SS(Total)} = \sum_{i=1}^n (y_i - \bar{y})^2, \quad \text{SS(Reg)} = \sum_{i=1}^n (\hat{\mu}_i - \bar{y})^2, \quad \text{SS(Res)} = \sum_{i=1}^n (y_i - \hat{\mu}_i)^2.
\]

| Source | d.f. | SS | MS | F |
|---|---|---|---|---|
| Regression | \(p\) | SS(Reg) | SS(Reg)/\(p\) | MS(Reg)/MS(Res) |
| Residual | \(n - p - 1\) | SS(Res) | SS(Res)/\((n-p-1)\) | |
| Total | \(n - 1\) | SS(Total) | | |

### Overall F-Test

To test whether *any* predictor is related to the response, we test

\[
H_0\colon \beta_1 = \beta_2 = \cdots = \beta_p = 0 \qquad \text{vs.} \qquad H_A\colon \text{at least one } \beta_j \neq 0.
\]

Under \(H_0\), the reduced model is \(Y_i = \beta_0 + \varepsilon_i\), so \(\text{SS(Res)}_A = \text{SS(Total)}\). The F-statistic is

\[
F = \frac{\text{SS(Reg)}/p}{\text{SS(Res)}/(n-p-1)} = \frac{\text{MS(Reg)}}{\text{MS(Res)}} \sim F(p, n-p-1) \quad \text{under } H_0.
\]

### Partial F-Test (Comparing Nested Models)

More generally, to test \(H_0\colon A\boldsymbol{\beta} = \boldsymbol{0}\) where \(A\) is an \(\ell \times (p+1)\) matrix of rank \(\ell\) specifying \(\ell\) linear constraints, fit both the full model and the reduced model (under \(H_0\)). The test statistic is

\[
F = \frac{(\text{SS(Res)}_A - \text{SS(Res)})/\ell}{\text{SS(Res)}/(n-p-1)} \sim F(\ell, n-p-1) \quad \text{under } H_0.
\]

<div class="remark">
When \(\ell = 1\), the F-test is equivalent to the two-sided t-test: \(F = t^2\). The F-test is essential when testing several constraints simultaneously (e.g., whether a group of predictors is jointly significant).
</div>

### Coefficient of Determination

\[
R^2 = \frac{\text{SS(Reg)}}{\text{SS(Total)}} = 1 - \frac{\text{SS(Res)}}{\text{SS(Total)}}.
\]
\(R^2\) always increases (or stays the same) when predictors are added. It is bounded between 0 and 1, but a high \(R^2\) does not imply the model is appropriate.

## 2.7 Confidence Region for the Coefficient Vector

Individual confidence intervals for \(\beta_j\) do not account for the joint distribution of all coefficients. A **confidence region** for the entire vector \(\boldsymbol{\beta}\) (or a subvector) is an ellipsoid.

<div class="theorem">
<strong>Theorem (confidence ellipsoid).</strong> Under the normal linear model, a \(100(1-\alpha)\%\) confidence region for \(\boldsymbol{\beta}\) is the set of all \(\boldsymbol{b}\) satisfying

\[
\frac{(\hat{\boldsymbol{\beta}} - \boldsymbol{b})^\top (X^\top X)(\hat{\boldsymbol{\beta}} - \boldsymbol{b})}{(p+1)\hat\sigma^2} \leq F_{1-\alpha,\, p+1,\, n-p-1}.
\]
</div>

This ellipsoid is centred at \(\hat{\boldsymbol\beta}\) and has axes determined by the eigenvectors of \((X^\top X)^{-1}\). When predictors are correlated, the ellipsoid is elongated, reflecting the joint uncertainty in the coefficients.

A **joint confidence region** for a subvector \(({\beta}_j, \beta_k)\) is obtained by projecting the full ellipsoid onto the \((\beta_j, \beta_k)\)-plane. This region can be a non-axis-aligned ellipse, illustrating that the individual \(t\)-based confidence intervals for \(\beta_j\) and \(\beta_k\) do not fully capture the joint uncertainty.

<div class="remark">
<strong>Simultaneity caution.</strong> The individual 95% CIs \(\hat\beta_j \pm t^* \operatorname{SE}(\hat\beta_j)\) for \(j = 1, \ldots, p\) do not together constitute a 95% confidence region for \(\boldsymbol\beta\). For simultaneous inference across all \(p\) coefficients, one uses the Bonferroni correction (replace \(\alpha\) by \(\alpha/p\) in each individual CI) or, for the joint ellipsoid, the F-critical value above.
</div>

## 2.8 Worked Example: Real Estate Data

<div class="example">
<strong>House price regression.</strong> Model house selling price (\(Y\), in \$1000s) from floor area (\(x_1\), in m\(^2\)) and number of bathrooms (\(x_2\)). For \(n = 25\) houses, OLS yields \(\hat{\boldsymbol\beta} = (-18.4, 1.72, 22.3)^\top\) with \(\hat\sigma = 34.5\) on 22 degrees of freedom. The design matrix \(X\) satisfies

\[
(X^\top X)^{-1} = \begin{bmatrix} 0.81 & -0.0043 & -0.21 \\ -0.0043 & 0.000012 & 0.00061 \\ -0.21 & 0.00061 & 0.093 \end{bmatrix}.
\]

Individual inferences:
<ul>
<li>Each additional m\(^2\) of floor area is associated with a \$1,720 increase in price (95% CI: \$950 to \$2,490), adjusting for bathrooms. This is highly significant (\(t = 1.72/(34.5\sqrt{0.000012}) = 14.4\)).</li>
<li>Each additional bathroom adds \$22,300 on average (95% CI: \$0.8K to \$43.8K), adjusting for floor area (\(t = 2.13\), \(p = 0.044\)).</li>
</ul>

Overall F-test: \(F = \text{MS(Reg)}/\text{MS(Res)} = 198.9\) on \((2, 22)\) df, \(p < 0.0001\). Adjusted \(R^2 = 0.944\). The residuals vs. fitted plot shows no obvious patterns.
</div>

---

# Chapter 3: Categorical Predictors and Interactions

## 3.1 Indicator (Dummy) Variables

When an explanatory variable is categorical with \(k\) levels, we encode it using \(k - 1\) **indicator** (or **dummy**) variables. One level is designated as the **reference category** and is absorbed into the intercept.

<div class="example">
<strong>Promotion Study.</strong> Suppose 30 stores are assigned to one of three promotion types (promo1, promo2, control). We define

\[
x_{i1} = \begin{cases} 1 & \text{if store } i \text{ uses promo1} \\ 0 & \text{otherwise} \end{cases}, \qquad
x_{i2} = \begin{cases} 1 & \text{if store } i \text{ uses promo2} \\ 0 & \text{otherwise} \end{cases}.
\]
The model becomes \(Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \varepsilon_i\). Here:
<ul>
<li>\(\beta_0\) is the mean response for the control group (reference).</li>
<li>\(\beta_1\) is the difference in mean response between promo1 and control.</li>
<li>\(\beta_2\) is the difference between promo2 and control.</li>
<li>\(\beta_1 - \beta_2\) is the difference between promo1 and promo2.</li>
</ul>
</div>

### Why Not Use All \(k\) Indicators?

If we create an indicator for every level, the column of ones (intercept) becomes a linear combination of the indicator columns, making \(X^\top X\) singular. With \(k\) levels, we always use \(k - 1\) indicator variables plus an intercept.

### ANOVA as Regression

A one-way ANOVA comparing \(k\) group means is equivalent to a regression model with \(k-1\) indicator variables and an intercept. The F-test for overall group differences corresponds to the partial F-test for the joint significance of all \(k-1\) indicator coefficients.

### Comparing Two Non-Reference Groups

To test \(H_0\colon \beta_j = \beta_k\), the standard error of the contrast is

\[
\operatorname{SE}(\hat{\beta}_j - \hat{\beta}_k) = \hat{\sigma}\sqrt{V_{jj} + V_{kk} - 2V_{jk}},
\]
where \(V = (X^\top X)^{-1}\).

## 3.2 Interaction Terms

An **interaction** between two predictors means the effect of one predictor on the response depends on the level of the other. For continuous predictors \(x_1\) and \(x_2\), the interaction model is

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \beta_3 x_{i1} x_{i2} + \varepsilon_i.
\]

This can be rewritten as

\[
Y_i = \beta_0 + (\beta_1 + \beta_3 x_{i2}) x_{i1} + \beta_2 x_{i2} + \varepsilon_i,
\]
showing that the slope of \(Y\) with respect to \(x_1\) changes with \(x_2\).

### Interactions with Categorical Variables

When a categorical variable interacts with a continuous variable, the model allows different slopes for different groups. For example, with a continuous predictor \(x_1\) and a categorical predictor (using indicator \(x_2\)):

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \beta_3 x_{i1} x_{i2} + \varepsilon_i.
\]
- For group 0 (\(x_{i2} = 0\)): \(\mathbb{E}[Y] = \beta_0 + \beta_1 x_1\) (intercept \(\beta_0\), slope \(\beta_1\)).
- For group 1 (\(x_{i2} = 1\)): \(\mathbb{E}[Y] = (\beta_0 + \beta_2) + (\beta_1 + \beta_3)x_1\) (different intercept, different slope).

<div class="remark">
The <strong>hierarchical principle</strong> dictates that if an interaction term is included, the corresponding main effects should also be retained. Similarly, if \(x^3\) is included, then \(x^2\) and \(x\) should also appear.
</div>

## 3.3 Analysis of Covariance (ANCOVA)

**Analysis of covariance** combines a continuous predictor (the covariate) with a categorical predictor to adjust group comparisons for differences in the covariate. The ANCOVA model with one covariate \(x_1\) and a binary group indicator \(x_2\) (no interaction) is

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \varepsilon_i.
\]

Under this model the two groups have **parallel regression lines** with different intercepts: the difference in adjusted group means is \(\beta_2\), and it is estimated holding \(x_1\) constant.

<div class="example">
<strong>Exam score example.</strong> Students are divided into two teaching methods (control: \(x_2 = 0\), new method: \(x_2 = 1\)). The covariate \(x_1\) is a pre-test score. Without adjustment, the new method appears to have a higher mean final score. Adding the covariate, the adjusted difference \(\hat\beta_2 = 4.3\) (SE = 1.1) remains significant, indicating that the new method improves scores even after accounting for pre-test ability. The ANCOVA estimate has lower variance than a simple group comparison because the covariate explains part of the residual variation.
</div>

When we allow the groups to have different slopes, the **interaction ANCOVA** model is

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \beta_3 (x_{i1} x_{i2}) + \varepsilon_i.
\]
The group difference \(\beta_2 + \beta_3 x_1\) now varies with the covariate, and the interpretation requires specifying the value of \(x_1\).

## 3.4 General Linear Hypotheses and Extra Sum of Squares

Any hypothesis expressible as \(H_0\colon C\boldsymbol{\beta} = \boldsymbol{0}\) for a matrix \(C\) of rank \(r\) can be tested with the partial F-statistic:

\[
F = \frac{(\text{SS(Reg, Full)} - \text{SS(Reg, Reduced)})/r}{\text{SS(Res, Full)}/(n - p - 1)} \sim F(r, n - p - 1).
\]

The numerator, \(\text{SS(Reg, Full)} - \text{SS(Reg, Reduced)}\), is the **extra sum of squares** attributed to the restricted coefficients. Under \(H_0\), this quantity divided by \(\sigma^2\) follows a \(\chi^2(r)\) distribution, which leads to the F-test after dividing by the independent \(\chi^2(n-p-1)/\sigma^2\) in the denominator.

<div class="example">
<strong>Coffee Example.</strong> A model for coffee quality rating uses acidity (\(x_1\)), and two indicator variables for processing method: semi (\(x_2\)) and wet (\(x_3\)), with dry as reference. The full model is

\[
Y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \beta_3 x_{i3} + \varepsilon_i.
\]
To test whether processing method matters at all (\(H_0\colon \beta_2 = \beta_3 = 0\)):

\[
C = \begin{bmatrix} 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{bmatrix},
\]
the F-statistic has \(r = 2\) and \(n - 4\) degrees of freedom. To test whether wet and semi have the same effect (\(H_0\colon \beta_2 = \beta_3\)), use \(C = [0 \; 0 \; 1 \; -1]\) with \(r = 1\), which coincides with a \(t\)-test.
</div>

### Connecting Extra SS to the Coefficient of Determination

The extra SS framework unifies multiple special cases:

| Hypothesis | Extra SS | F-test |
|---|---|---|
| All slopes zero: \(\beta_1 = \cdots = \beta_p = 0\) | SS(Reg, Full) | Overall F in ANOVA table |
| Subset of slopes zero: \(\beta_{q+1} = \cdots = \beta_p = 0\) | SS(Reg, Full) \(-\) SS(Reg, Reduced) | Partial F-test |
| Single coefficient: \(\beta_j = 0\) | SS(\(\beta_j\) \(\mid\) others) | \(F = t_j^2\) |

In all cases, the numerator is a difference in SS(Reg) between the full and reduced model.

---

# Chapter 4: Model Checking and Diagnostics

## 4.1 Residual Analysis

The fundamental purpose of residual analysis is to assess whether the LINE assumptions hold. Since the true errors \(\varepsilon_i\) are unobservable, we use the residuals \(e_i = y_i - \hat{y}_i\) as surrogates. However, residuals are not identical to errors: \(\boldsymbol{e} = (I - H)\boldsymbol{\varepsilon}\), so the residuals are correlated and have unequal variances even when the errors are iid.

### Ordinary vs. Studentized Residuals

The ordinary residuals \(e_i\) satisfy \(e_i \sim \mathcal{N}(0, \sigma^2(1 - h_{ii}))\), where \(h_{ii}\) is the \(i\)-th diagonal element of the hat matrix. Since the variances differ, it is more informative to examine **studentized residuals**:

\[
r_i = \frac{e_i}{\hat{\sigma}\sqrt{1 - h_{ii}}}.
\]
These have approximately constant variance (approximately \(t\)-distributed in finite samples), making them more appropriate for diagnostic plots.

### Key Diagnostic Plots

1. **Residuals vs. fitted values** (\(e_i\) or \(r_i\) vs. \(\hat{\mu}_i\)): should show a random scatter with no pattern. A funnel shape indicates heteroscedasticity; a curve indicates nonlinearity.
2. **Residuals vs. each predictor** (\(e_i\) vs. \(x_{ij}\)): helps detect nonlinear relationships with specific predictors.
3. **Normal QQ plot** of residuals: points should fall approximately along a straight line. Departures suggest non-normality.
4. **Residuals vs. observation order**: useful for detecting autocorrelation in time-ordered data.

## 4.2 Non-Constant Variance and Data Transformations

When residual plots reveal non-constant variance (heteroscedasticity), a **variance-stabilizing transformation** on the response may help. The idea is to find a function \(g(\cdot)\) such that \(\operatorname{Var}(g(Y_i)) \approx \text{constant}\).

Using a first-order Taylor expansion, if \(\operatorname{Var}(Y_i) = h(\mu_i)\sigma^2\), we need \([g'(\mu_i)]^2 \propto 1/h(\mu_i)\), which gives:

| Variance structure | \(h(\mu)\) | Transformation \(g(y)\) |
|---|---|---|
| \(\operatorname{Var} \propto \mu\) | \(\mu\) | \(\sqrt{y}\) |
| \(\operatorname{Var} \propto \mu^2\) | \(\mu^2\) | \(\ln(y)\) |
| General power | \(\mu^C\) | Box-Cox |

### Box-Cox Transformations

The **Box-Cox** family of power transformations is

\[
g(y_i) = \begin{cases} (y_i^\lambda - 1)/\lambda & \lambda \neq 0 \\ \ln(y_i) & \lambda = 0 \end{cases}.
\]
The parameter \(\lambda\) is chosen to maximize the profile log-likelihood. Special cases include \(\lambda = 1/2\) (square root), \(\lambda = 0\) (log), \(\lambda = 1\) (identity), and \(\lambda = -1\) (reciprocal).

<div class="remark">
After transforming the response, the interpretation of coefficients changes. For example, with \(g(y) = \ln(y)\), the coefficient \(\hat{\beta}_j\) represents the estimated change in \(\ln(Y)\) for a one-unit increase in \(x_j\), so \(e^{\hat{\beta}_j}\) is the estimated multiplicative effect on the original scale.
</div>

### Transforming Predictors and Adding Polynomial Terms

Nonlinearity can also be addressed by transforming predictors (e.g., \(\ln(x_j)\), \(\sqrt{x_j}\)) or by adding polynomial terms:

\[
Y_i = \beta_0 + \beta_1 x_i + \beta_2 x_i^2 + \varepsilon_i.
\]
This model is still *linear in the parameters* \(\beta_0, \beta_1, \beta_2\) and can be fit by OLS.

## 4.3 Weighted Least Squares

When the error variances are known to differ across observations, \(\operatorname{Var}(\varepsilon_i) = \sigma_i^2\), **weighted least squares** (WLS) provides more efficient estimates by minimizing

\[
\sum_{i=1}^n w_i (y_i - \boldsymbol{x}_i^\top \boldsymbol{\beta})^2, \qquad w_i = \frac{1}{\sigma_i^2}.
\]

In matrix form, \(\hat{\boldsymbol{\beta}}_W = (X^\top W X)^{-1}X^\top W \boldsymbol{y}\), where \(W = \operatorname{diag}(w_1, \ldots, w_n)\). The WLS estimator is unbiased with variance \((X^\top W X)^{-1}\).

An equivalent viewpoint is to premultiply the model by \(W^{1/2}\), producing a transformed model \(\boldsymbol{y}_w = X_w \boldsymbol{\beta} + \boldsymbol{\varepsilon}_w\) where the new errors satisfy \(\boldsymbol{\varepsilon}_w \sim \mathcal{N}(\boldsymbol{0}, I)\).

In practice, the weights are often unknown and must be estimated, leading to an **iteratively reweighted least squares** procedure:

1. Fit OLS to obtain initial residuals \(e_i\).
2. Estimate \(\sigma_i^2\) from the residuals and fitted values (e.g., by regressing \(|e_i|\) or \(e_i^2\) on \(\hat{y}_i\)).
3. Set \(w_i = 1/\hat{\sigma}_i^2\) and compute \(\hat{\boldsymbol{\beta}}_W\).
4. Repeat until convergence.

## 4.4 Outliers, Leverage, and Influence

### Leverage

The **leverage** of observation \(i\) is \(h_{ii}\), the \(i\)-th diagonal of the hat matrix. It measures how far \(\boldsymbol{x}_i\) is from the center of the predictor space. Properties:

- \(1/n \leq h_{ii} \leq 1\).
- \(\sum_{i=1}^n h_{ii} = p + 1\), so the average leverage is \(\bar{h} = (p+1)/n\).
- A point is considered **high leverage** if \(h_{ii} > 2\bar{h} = 2(p+1)/n\).

In SLR, leverage has the explicit form \(h_{ii} = 1/n + (x_i - \bar{x})^2/S_{xx}\), confirming that points far from the mean of \(x\) have high leverage.

### Outliers

An observation is an **outlier** if its studentized residual is unusually large, typically \(|r_i| > 2.5\) or \(|r_i| > 3\). High-leverage points can mask outliers because their residuals are pulled toward zero.

### Externally Studentized (Jackknife) Residuals

To address the masking issue, **leave-one-out** (or jackknife) residuals use \(\hat{\sigma}_{(-i)}^2\) (the error variance estimate computed without observation \(i\)):

\[
r_{i(-i)} = \frac{e_i}{\hat{\sigma}_{(-i)}\sqrt{1 - h_{ii}}} = r_i \left[\frac{n - p - 2}{n - p - 1 - r_i^2}\right]^{1/2}.
\]
This can be computed from a single model fit without refitting \(n\) times.

### Cook's Distance

**Cook's distance** combines leverage and residual size into a single measure of influence:

\[
D_i = \frac{h_{ii}}{1 - h_{ii}} \cdot \frac{r_i^2}{p + 1}.
\]
Values of \(D_i\) near or exceeding 1 indicate a highly influential observation whose removal would substantially change the fitted model. Cook's distance can also be expressed as

\[
D_i = \frac{(\hat{\boldsymbol{\beta}} - \hat{\boldsymbol{\beta}}_{(-i)})^\top (X^\top X)(\hat{\boldsymbol{\beta}} - \hat{\boldsymbol{\beta}}_{(-i)})}{(p+1)\hat{\sigma}^2},
\]
which directly measures how much the entire coefficient vector shifts when observation \(i\) is deleted.

<div class="remark">
Outlier detection should be followed by investigation, not automatic deletion. Observations may be outliers because of data entry errors, unusual but valid circumstances, or indicators that the model is misspecified. Examining the impact via Cook's distance is more informative than simply removing extreme points.
</div>

### DFFITS and DFBETAS

Cook's distance measures global influence. Two related per-observation diagnostics provide more focused information:

- **DFFITS\(_i\)**: the standardized change in the fitted value at observation \(i\) when it is deleted:

\[
\text{DFFITS}_i = \frac{\hat{y}_i - \hat{y}_{i(-i)}}{\hat\sigma_{(-i)}\sqrt{h_{ii}}} = r_{i(-i)}\sqrt{\frac{h_{ii}}{1 - h_{ii}}}.
\]
A rule of thumb flags \(|\text{DFFITS}_i| > 2\sqrt{(p+1)/n}\).

- **DFBETAS\(_{ij}\)**: the standardized change in the \(j\)-th coefficient when observation \(i\) is deleted:

\[
\text{DFBETAS}_{ij} = \frac{\hat\beta_j - \hat\beta_{j(-i)}}{\hat\sigma_{(-i)}\sqrt{[(X^\top X)^{-1}]_{jj}}}.
\]
Flagged when \(|\text{DFBETAS}_{ij}| > 2/\sqrt{n}\). This pinpoints *which* coefficient is most affected by each influential observation.

<div class="example">
<strong>Influence diagnostics example.</strong> In a study of 20 companies predicting profit (\(Y\)) from R&D spending (\(x_1\)) and employee count (\(x_2\)), observation 4 has leverage \(h_{44} = 0.42\) (flagged as high, since \(2\bar{h} = 2\cdot 3/20 = 0.30\)) and studentized residual \(r_4 = -2.8\) (flagged as a possible outlier). Cook's distance \(D_4 = 0.42/(1-0.42)\cdot 2.8^2/3 = 1.89 > 1\) confirms that observation 4 is highly influential. Inspection reveals that company 4 had a one-time accounting restatement inflating its profit; it is replaced with a corrected value and the analysis is re-run.
</div>

## 4.5 What to Do When Assumptions Fail

When diagnostic plots reveal assumption violations, several remedies are available:

| Violation | Diagnostic Signal | Remedy |
|---|---|---|
| Non-linearity | Curved residual vs. fitted | Add polynomial terms, transform \(x\) or \(y\) |
| Heteroscedasticity | Fanning in residual plot | WLS, log transform, Box-Cox |
| Non-normality | Heavy tails in QQ plot | Robust regression (Huber, LAD), GLMs |
| Outliers | Large \(\|r_i\|\) or \(D_i\) | Investigate, correct if erroneous; otherwise report sensitivity |
| Autocorrelation | Runs pattern in time-ordered residuals | Include time trend, time series models |
| Multicollinearity | Large VIF | Remove correlated predictors, ridge regression, PCA |

### Robust Regression

When errors are heavy-tailed or outliers cannot be removed, **robust regression** minimises a robust loss function instead of sum of squares. The **M-estimator** with Huber loss

\[
\rho_k(e) = \begin{cases} e^2/2 & |e| \leq k \\ k|e| - k^2/2 & |e| > k \end{cases}
\]
transitions from squared loss (for small residuals) to absolute loss (for large residuals), downweighting outliers without discarding them. The parameter \(k\) (typically \(k = 1.345\hat\sigma\)) is chosen to achieve 95% efficiency under normality. Estimation proceeds by IRLS: iteratively reweight observations by \(w_i \propto \rho_k'(e_i)/e_i\) and solve a WLS problem.

---

# Chapter 5: Model Selection

## 5.1 The Model Selection Problem

Given \(p\) candidate predictors, there are \(2^p\) possible subsets of predictors. Model selection aims to identify a subset that balances goodness of fit with parsimony. Motivations for preferring simpler models include:

- **Interpretability**: fewer parameters are easier to understand.
- **Precision**: including irrelevant predictors inflates \(\hat{\sigma}^2 = \text{SS(Res)}/(n - k - 1)\), which increases standard errors.
- **Prediction**: overly complex models overfit the training data and predict poorly on new data.

## 5.2 Selection Criteria

### Adjusted \(R^2\)

Since \(R^2\) can only increase when predictors are added, the **adjusted** \(R^2\) penalizes for model complexity:

\[
R^2_{\text{adj}} = 1 - \frac{\text{SS(Res)}/(n - k - 1)}{\text{SS(Total)}/(n - 1)} = 1 - \frac{\hat{\sigma}^2}{s^2},
\]
where \(k\) is the number of predictors in the model and \(s^2 = \text{SS(Total)}/(n-1)\) is the sample variance of \(Y\). Equivalently,

\[
R^2_{\text{adj}} = R^2 - \frac{k}{n - k - 1}(1 - R^2).
\]
Maximizing \(R^2_{\text{adj}}\) is equivalent to minimizing \(\hat{\sigma}^2\). Unlike \(R^2\), the adjusted version can decrease when a useless predictor is added.

### Akaike Information Criterion (AIC)

\[
\text{AIC} = 2q - 2\ln L(\hat{\theta}),
\]
where \(q = p + 2\) is the total number of estimated parameters (including the intercept and \(\sigma^2\)), and \(L(\hat{\theta})\) is the maximized likelihood. For comparing nested normal-error models, differences in AIC simplify to

\[
\text{AIC} = n \ln\!\left(\frac{\text{SS(Res)}}{n}\right) + 2q.
\]
Lower AIC is preferred. AIC penalizes complexity through the \(2q\) term.

### Bayesian Information Criterion (BIC)

\[
\text{BIC} = q \ln(n) - 2\ln L(\hat{\theta}).
\]
BIC applies a stronger penalty than AIC (since \(\ln n > 2\) for \(n \geq 8\)), so it tends to select simpler models.

### Mallow's \(C_p\)

For a model with \(k\) predictors,

\[
C_p = \frac{\text{SS(Res)}_k}{\text{MS(Res)}_{\text{full}}} + 2(k + 1) - n,
\]
where \(\text{MS(Res)}_{\text{full}}\) is the residual mean square from the full \(p\)-predictor model. A model is considered suitable if \(C_p \leq k + 1\). When \(C_p\) is much larger than \(k+1\), the model suffers from substantial bias.

## 5.3 Search Strategies

### Forward Selection

1. Start with only the intercept.
2. Among all \(p\) one-predictor models, choose the one that best improves the criterion.
3. With the chosen predictor fixed, evaluate all two-predictor models, and add the next best.
4. Continue until no further improvement is achieved.

### Backward Elimination

1. Start with all \(p\) predictors.
2. Remove the predictor whose removal least worsens the criterion (or improves it).
3. Continue until all remaining predictors are deemed important.

### Stepwise Selection

Combine forward and backward steps: after each addition, check whether any previously included predictor can now be dropped. This prevents variables from being "locked in" early.

### Exhaustive Search

Fit all \(2^p\) possible models and select the best by the chosen criterion. Computationally feasible only for moderate \(p\) (e.g., \(p \leq 20\) with modern algorithms like the branch-and-bound method in the `leaps` package).

<div class="remark">
After using data to select a model, the usual inference (p-values, confidence intervals) is no longer strictly valid because the model was chosen to fit the data well. The standard errors from the selected model tend to be too small, leading to overly optimistic conclusions. Cross-validation provides a more honest assessment of predictive performance.
</div>

## 5.4 Multicollinearity and Variance Inflation Factors

**Multicollinearity** occurs when predictor variables are strongly linearly related. It inflates the variances of the OLS estimates (the diagonal entries of \(\sigma^2(X^\top X)^{-1}\)), making individual coefficients unreliable without substantially affecting overall prediction.

<div class="definition">
The <strong>variance inflation factor</strong> for the \(j\)-th predictor is

\[
\text{VIF}_j = \frac{1}{1 - R_j^2},
\]
where \(R_j^2\) is the coefficient of determination from regressing \(x_j\) on all other predictors. The variance of \(\hat{\beta}_j\) can be expressed as

\[
\operatorname{Var}(\hat{\beta}_j) = \frac{\hat{\sigma}^2}{\sum_{i=1}^n (x_{ij} - \bar{x}_j)^2} \cdot \text{VIF}_j.
\]
</div>

Guidelines:

- \(\text{VIF}_j = 1\) means no collinearity with other predictors.
- \(\text{VIF}_j > 10\) (i.e., \(R_j^2 > 0.9\)) indicates serious multicollinearity.
- Remedies include removing redundant predictors, combining correlated predictors, or using regularization methods (ridge, LASSO).

---

# Chapter 6: Cross-Validation and Prediction

## 6.1 Prediction Error and Overfitting

Criteria like \(R^2\) measure *in-sample* fit. A model that fits the training data too closely (overfitting) will perform poorly on new data. The key quantity is the **mean squared prediction error** (MSPE):

\[
\text{MSPE} = \mathbb{E}\!\left[(Y_{\text{new}} - \hat{y}_{\text{new}})^2\right],
\]
which we wish to estimate honestly.

## 6.2 Holdout Validation

Split the data into a **training set** (used to fit the model) and a **test set** (used to evaluate prediction):

\[
\text{MSE}_{\text{test}} = \frac{1}{n_{\text{test}}} \sum_{i \in S_{\text{test}}} (y_i - \hat{y}_i)^2.
\]
The disadvantage is that a large portion of data is not used for fitting, potentially increasing variance.

## 6.3 Leave-One-Out Cross-Validation (LOOCV)

For each observation \(i\), fit the model on all data except \((x_i, y_i)\), then predict \(\hat{y}_{i(-i)}\). The LOOCV estimate of prediction error is

\[
\text{MSE}_{\text{CV}} = \frac{1}{n} \sum_{i=1}^n (y_i - \hat{y}_{i(-i)})^2.
\]

A remarkable computational shortcut for linear regression avoids fitting \(n\) separate models: the LOOCV error for the \(i\)-th observation equals the PRESS residual squared:

\[
y_i - \hat{y}_{i(-i)} = \frac{e_i}{1 - h_{ii}},
\]
where \(e_i\) is the ordinary residual and \(h_{ii}\) is the leverage. Thus

\[
\text{MSE}_{\text{CV}} = \frac{1}{n}\sum_{i=1}^n \left(\frac{e_i}{1 - h_{ii}}\right)^2,
\]
which requires fitting the model only once.

## 6.4 \(K\)-Fold Cross-Validation

Randomly partition the data into \(K\) roughly equal subsets (folds). For each fold \(k\):

1. Fit the model on the remaining \(K - 1\) folds.
2. Predict the held-out fold and compute \(\text{MSE}_k = \frac{1}{n_k}\sum_{i \in S_k}(y_i - \hat{y}_i)^2\).

The overall CV estimate is

\[
\text{MSE}_{\text{CV}} = \frac{1}{K}\sum_{k=1}^K \text{MSE}_k.
\]
Common choices are \(K = 5\) or \(K = 10\). Setting \(K = n\) recovers LOOCV.

## 6.5 Combining Cross-Validation with Model Selection

When selecting among models, the recommended workflow involves three conceptual data splits:

1. **Training set**: used to fit candidate models.
2. **Validation set** (or CV folds within training): used to compare models and choose the best.
3. **Test set**: reserved exclusively for estimating the prediction error of the final selected model.

Cross-validation can replace the validation set by repeatedly splitting the training data. After selecting the best model by CV, refit it on the full training data, then report the test-set error as the final performance estimate.

<div class="remark">
A common mistake is to use the CV error of the selected model as the final estimate of predictive performance. This leads to optimistic bias because the model was chosen partly based on CV error. A held-out test set (not used in any selection step) gives an unbiased estimate.
</div>

### The One-Standard-Error Rule

When multiple models have similar CV errors, the **one-standard-error rule** recommends choosing the simplest model whose CV error is within one standard error of the minimum:

\[
\text{select the most parsimonious model with} \quad \widehat{\text{MSPE}} \leq \widehat{\text{MSPE}}_{\min} + \widehat{\text{SE}}_{\min}.
\]
This guards against overfitting by preferring simpler models when the evidence for a more complex one is not compelling.

### Worked Example: Variable Selection via CV

<div class="example">
<strong>Apartment rent data.</strong> Consider predicting monthly rent from 8 candidate predictors. We perform 10-fold CV on each of the \(2^8 = 256\) subsets. The model with predictors (floor area, bedrooms, distance to transit, year built) achieves a CV-MSPE of 1,840, essentially tied with the five-predictor model (CV-MSPE = 1,823). By the one-standard-error rule (SE \(\approx 85\)), we select the four-predictor model as it is more parsimonious and the performance difference is within noise. The test-set MSPE (on a 20% holdout) for the four-predictor model is 1,917, close to the CV estimate, confirming no substantial overfitting.
</div>

## 6.6 Bias-Variance Tradeoff

The expected prediction error for a new observation at \(\boldsymbol{x}_0\) decomposes as

\[
\mathbb{E}\!\left[(Y_0 - \hat{y}_0)^2\right] = \operatorname{Var}(Y_0) + \operatorname{Bias}^2(\hat{y}_0) + \operatorname{Var}(\hat{y}_0).
\]

- **Irreducible error** \(\operatorname{Var}(Y_0) = \sigma^2\): cannot be reduced by any model.
- **Bias**: model underfitting (too few predictors) introduces systematic error. Decreases as model complexity increases.
- **Variance of prediction**: overfitting means \(\hat{\boldsymbol\beta}\) varies considerably across training samples. Increases with model complexity.

Adding predictors always decreases in-sample RSS, but may increase MSPE if the variance increase outweighs the bias reduction. This is the fundamental tension that cross-validation addresses empirically.

### Connection to Information Criteria

When the true model is in the candidate set and the sample is large, cross-validation and information criteria are asymptotically equivalent:

- **AIC** minimizes estimated prediction error: \(\text{AIC} = n\ln(\hat\sigma^2) + 2(p+1)\).
- **BIC** minimizes \(n\ln(\hat\sigma^2) + (p+1)\ln(n)\), applying a heavier penalty that favours sparser models.
- **LOOCV** is approximately equivalent to AIC for linear models (Stone, 1977): \(\text{LOOCV-MSPE} \approx \text{AIC-selected model error}\).

In small samples, CV provides a more direct and distribution-free estimate of predictive performance than AIC or BIC.

---

# Chapter 7: Generalized Linear Models

## 7.1 Motivation: Beyond the Normal Linear Model

The normal linear model assumes \(Y_i \sim \mathcal{N}(\mu_i, \sigma^2)\) with \(\mu_i = \boldsymbol{x}_i^\top \boldsymbol{\beta}\). However, many practical situations involve responses that are not normally distributed:

- **Binary responses** (\(Y_i \in \{0, 1\}\)): success/failure outcomes.
- **Count data** (\(Y_i \in \{0, 1, 2, \ldots\}\)): number of events in a fixed period.

**Generalized linear models** (GLMs) extend the linear model framework to handle such responses.

## 7.2 Exponential Family and Link Functions

A GLM consists of three components:

1. **Random component**: \(Y_i\) follows a distribution from the exponential family (e.g., Normal, Bernoulli, Binomial, Poisson).
2. **Systematic component**: a linear predictor \(\eta_i = \boldsymbol{x}_i^\top \boldsymbol{\beta}\).
3. **Link function**: a monotone differentiable function \(g\) relating the mean to the linear predictor: \(g(\mu_i) = \eta_i\).

| Response type | Distribution | Link function \(g(\mu)\) | Link name |
|---|---|---|---|
| Continuous | Normal | \(\mu\) | Identity |
| Binary | Bernoulli | \(\ln(\mu/(1-\mu))\) | Logit |
| Count | Poisson | \(\ln(\mu)\) | Log |

## 7.3 Logistic Regression

When \(Y_i \in \{0, 1\}\) is a **binary response** with \(P(Y_i = 1) = \pi_i\), we model \(\pi_i\) as a function of the predictors using the **logit link**:

\[
\ln\!\left(\frac{\pi_i}{1 - \pi_i}\right) = \boldsymbol{x}_i^\top \boldsymbol{\beta}.
\]
Equivalently, the **sigmoid function** gives

\[
\pi_i = \frac{e^{\boldsymbol{x}_i^\top \boldsymbol{\beta}}}{1 + e^{\boldsymbol{x}_i^\top \boldsymbol{\beta}}}.
\]

Since \(Y_i \sim \text{Bernoulli}(\pi_i)\), we have \(\mathbb{E}[Y_i] = \pi_i\) and \(\operatorname{Var}(Y_i) = \pi_i(1 - \pi_i)\). Note that the variance is a function of the mean; the errors are inherently heteroscedastic.

### Parameter Estimation

The log-likelihood for logistic regression is

\[
\ell(\boldsymbol{\beta}) = \sum_{i=1}^n \bigl[y_i \ln(\pi_i) + (1 - y_i)\ln(1 - \pi_i)\bigr] = \sum_{i=1}^n \bigl[y_i \boldsymbol{x}_i^\top \boldsymbol{\beta} - \ln(1 + e^{\boldsymbol{x}_i^\top \boldsymbol{\beta}})\bigr].
\]
There is no closed-form solution. The MLE is found by **iteratively reweighted least squares** (IRLS), a form of Newton-Raphson applied to the score equations.

### Interpretation of Coefficients

<div class="definition">
In logistic regression, \(\beta_j\) represents the change in the <strong>log-odds</strong> of the response for a one-unit increase in \(x_j\), holding other predictors constant. The quantity \(e^{\beta_j}\) is the <strong>odds ratio</strong>: for every one-unit increase in \(x_j\), the odds of success are multiplied by \(e^{\beta_j}\).
</div>

<div class="example">
<strong>Death Penalty Study.</strong> In a logistic regression of death penalty outcome on aggravation level (\(x_1\)) and race of victim (\(x_2 = 1\) if White, 0 otherwise), the estimated coefficient for race is \(\hat{\beta}_2 = 1.8106\), giving an odds ratio of \(e^{1.8106} \approx 6.11\). After adjusting for crime severity, the odds of a death penalty sentence are approximately 6.11 times higher when the victim is White compared to when the victim is Black.
</div>

### Binomial Count Data

When the response is a count of successes out of \(n_i\) trials, \(Y_i \sim \text{Binomial}(n_i, \pi_i)\), the same logit link applies. The log-likelihood becomes

\[
\ell(\boldsymbol{\beta}) = \sum_{i=1}^m \bigl[y_i \ln(\pi_i) + (n_i - y_i)\ln(1 - \pi_i)\bigr] + C.
\]

## 7.4 Poisson Regression

For count data without a fixed number of trials, the **Poisson regression** model uses \(Y_i \sim \text{Poisson}(\mu_i)\) with the **log link**:

\[
\ln(\mu_i) = \boldsymbol{x}_i^\top \boldsymbol{\beta},
\]
so \(\mu_i = e^{\boldsymbol{x}_i^\top \boldsymbol{\beta}}\). Here \(\mathbb{E}[Y_i] = \operatorname{Var}(Y_i) = \mu_i\).

The coefficient \(\beta_j\) has a multiplicative interpretation: a one-unit increase in \(x_j\) multiplies the expected count by \(e^{\beta_j}\).

### Offset Terms

When counts are observed over varying exposure periods or areas, an **offset** adjusts for differing exposure. If \(t_i\) is the exposure time for unit \(i\) and \(\lambda_i\) is the rate per unit time, then \(\mu_i = t_i \lambda_i\) and

\[
\ln(\mu_i) = \ln(t_i) + \boldsymbol{x}_i^\top \boldsymbol{\beta},
\]
where \(\ln(t_i)\) is the offset (a known constant, not an estimated coefficient). This models the *rate* \(\lambda_i\) as a log-linear function of predictors.

<div class="example">
<strong>Bicycle accident counts.</strong> We model the number of bicycle accidents \(Y_i\) at 30 intersections as a function of traffic volume (\(x_1\), in thousands of vehicles/day) and presence of a bike lane (\(x_2 = 1\) if yes). Intersections are observed for varying numbers of months, so \(\ln(\text{months}_i)\) is included as an offset.

Fitted Poisson model:

\[
\ln(\hat\mu_i) = -2.10 + 0.31 x_{i1} - 0.47 x_{i2} + \ln(\text{months}_i).
\]

Interpretation:
<ul>
<li>Each 1,000-vehicle increase in daily traffic multiplies the expected accident rate by \(e^{0.31} = 1.36\) (36% increase).</li>
<li>Presence of a bike lane multiplies the rate by \(e^{-0.47} = 0.62\) (38% reduction), adjusting for traffic volume.</li>
</ul>

A likelihood ratio test comparing this model to the intercept-only model gives \(\Delta D = 41.2\) on 2 df (\(p < 0.001\)), confirming the joint significance of both predictors.
</div>

## 7.5 Inference in GLMs

### Wald Statistic

For large samples, the MLE \(\hat{\beta}_j\) is approximately normal:

\[
z = \frac{\hat{\beta}_j}{\operatorname{SE}(\hat{\beta}_j)} \;\dot{\sim}\; \mathcal{N}(0, 1) \quad \text{under } H_0\colon \beta_j = 0.
\]
The squared Wald statistic \(z^2 \sim \chi^2_1\) can also be used.

### Deviance

The **deviance** measures goodness of fit by comparing the fitted model to the saturated model (a model with one parameter per observation):

\[
D = 2\bigl[\ell(\text{saturated}) - \ell(\text{fitted})\bigr].
\]
For a well-fitting model, \(D/(n - p - 1) \approx 1\). More precisely, under the null hypothesis that the model is correct, \(D \;\dot{\sim}\; \chi^2(n - p - 1)\) for sufficiently large sample sizes.

### Comparing Models via Deviance

To compare a reduced model (with deviance \(D_{\text{red}}\)) against a full model (deviance \(D_{\text{full}}\)):

\[
D_{\text{red}} - D_{\text{full}} = 2\bigl[\ell(\text{full}) - \ell(\text{reduced})\bigr] \;\dot{\sim}\; \chi^2(df_{\text{red}} - df_{\text{full}}).
\]
This is the **likelihood ratio test** and is analogous to the partial F-test in normal linear models.

### AIC for GLMs

Model selection in GLMs also uses AIC:

\[
\text{AIC} = 2(p + 1) - 2\ell(\hat{\boldsymbol{\beta}}).
\]
Lower AIC is preferred. Stepwise selection can be carried out using AIC as the criterion, as implemented in R's `stepAIC` function.

## 7.6 Diagnostics for GLMs

Ordinary residuals \(y_i - \hat\mu_i\) are not meaningful for GLMs because the variance of \(Y_i\) depends on \(\mu_i\). Instead, standardised residuals are based on the **Pearson residual** or **deviance residual**.

The **Pearson residual** for observation \(i\) is

\[
r_i^P = \frac{y_i - \hat\mu_i}{\sqrt{V(\hat\mu_i)}},
\]
where \(V(\mu)\) is the variance function (\(V(\mu) = \mu(1-\mu)/n_i\) for binomial, \(V(\mu) = \mu\) for Poisson). Plotting \(r_i^P\) against the linear predictor \(\hat\eta_i\) or against predictors checks for lack of fit and heterogeneity.

The **deviance residual** for observation \(i\) is \(d_i = \text{sign}(y_i - \hat\mu_i)\sqrt{2[l_i^{\text{sat}} - l_i^{\text{fit}}]}\), where \(l_i^{\text{sat}}\) is the saturated log-likelihood and \(l_i^{\text{fit}}\) is the fitted model log-likelihood. The sum of squares of deviance residuals equals the total deviance \(D\).

**Overdispersion** occurs when the observed variance exceeds the assumed variance function. For binary data (logistic regression), this manifests as \(\sum (r_i^P)^2 / (n - p - 1) > 1\). Solutions include quasi-likelihood models (estimate a dispersion parameter) or beta-binomial regression.

<div class="remark">
The normal linear model is a special case of a GLM with Gaussian response and identity link. All the OLS theory from Chapters 1--2 can be recovered from the GLM framework. The key advantage of GLMs is the unified treatment of diverse response types while retaining the interpretability of the linear predictor.
</div>

---

# Appendix: Notation, Key Results, and Model Comparison Summary

## Notation

| Symbol | Meaning |
|---|---|
| \(Y_i\) | Response for the \(i\)-th observation |
| \(\boldsymbol{X}\) | \(n \times (p+1)\) design matrix (includes column of 1s) |
| \(\boldsymbol{\beta}\) | \((p+1)\)-vector of regression coefficients |
| \(\hat{\boldsymbol{\beta}} = (X^\top X)^{-1}X^\top\boldsymbol{y}\) | OLS (MLE) estimator |
| \(\boldsymbol{H} = X(X^\top X)^{-1}X^\top\) | Hat (projection) matrix |
| \(\boldsymbol{e} = (I - H)\boldsymbol{y}\) | Vector of OLS residuals |
| \(h_{ii}\) | \(i\)-th diagonal of \(H\) (leverage) |
| \(\hat{\sigma}^2 = \|\boldsymbol{e}\|^2/(n-p-1)\) | Unbiased estimator of \(\sigma^2\) |
| \(r_i = e_i / (\hat\sigma\sqrt{1-h_{ii}})\) | Studentized residual |

## Key Distributional Results

<div class="theorem">
<strong>Theorem (Sampling distributions under normality).</strong> If \(\boldsymbol{Y} = X\boldsymbol{\beta} + \boldsymbol\varepsilon\) with \(\boldsymbol\varepsilon \sim \mathcal{N}(\boldsymbol{0}, \sigma^2 I)\):
<ol>
<li>\(\hat{\boldsymbol\beta} \sim \mathcal{N}(\boldsymbol\beta, \sigma^2(X^\top X)^{-1})\).</li>
<li>\((n-p-1)\hat\sigma^2/\sigma^2 \sim \chi^2(n-p-1)\), independent of \(\hat{\boldsymbol\beta}\).</li>
<li>\(\hat\beta_j / (\hat\sigma\sqrt{[(X^\top X)^{-1}]_{jj}}) \sim t(n-p-1)\) under \(H_0\colon \beta_j = 0\).</li>
<li>The partial F-statistic \(\sim F(r, n-p-1)\) under \(H_0\colon C\boldsymbol\beta = \boldsymbol 0\).</li>
</ol>
</div>

## Model Comparison Criteria Summary

| Criterion | Formula | Direction | Focus |
|---|---|---|---|
| \(R^2\) | \(1 - \text{SS(Res)}/\text{SS(Tot)}\) | Maximize | In-sample fit |
| Adjusted \(R^2\) | \(1 - \hat\sigma^2/s^2\) | Maximize | Fit adjusted for complexity |
| AIC | \(n\ln(\text{SS(Res)}/n) + 2(p+2)\) | Minimize | Predictive loss |
| BIC | \(n\ln(\text{SS(Res)}/n) + (p+2)\ln n\) | Minimize | Model posterior |
| Mallow's \(C_p\) | \(\text{SS(Res)}_k/\hat\sigma_{\text{full}}^2 + 2(k+1) - n\) | Minimize (\(\leq k+1\)) | Total MSE |
| LOOCV-MSPE | \(\frac{1}{n}\sum_i \bigl(e_i/(1-h_{ii})\bigr)^2\) | Minimize | Prediction |

## Glossary of Key Terms

**Gauss-Markov Theorem**: OLS estimator is BLUE (Best Linear Unbiased Estimator) under the assumptions of linearity, independence, zero-mean errors, and homoscedasticity. Normality is *not* required for BLUE.

**Leverage**: A high-leverage point has unusual predictor values. It is not necessarily an outlier (if it lies on the regression surface) but has the potential to strongly influence the fitted line.

**Influential point**: A point is influential if removing it substantially changes the fitted model. Cook's distance combines leverage and residual size into a single diagnostic.

**Multicollinearity**: Near-linear dependence among predictors inflates \(\operatorname{Var}(\hat\beta_j)\) and makes coefficient estimates unstable, but does not affect prediction accuracy when the correlation structure is preserved in new data.

**Identifiability**: A parameter is identifiable if distinct values lead to distinct distributions. In MLR, \(\boldsymbol\beta\) is identifiable if and only if \(X^\top X\) is invertible (the columns of \(X\) are linearly independent).
