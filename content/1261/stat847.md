---
title: "STAT 847: Exploratory Data Analysis"
prof: "Michael John Davis"
subjects: "STAT"
---

## Sources and References
**Primary references** — Hadley Wickham and Garrett Grolemund, *R for Data Science* (2nd ed., O'Reilly, 2023); Gareth James, Daniela Witten, Trevor Hastie, and Robert Tibshirani, *An Introduction to Statistical Learning* (2nd ed., Springer, 2021).
**Supplementary** — Hadley Wickham, *ggplot2: Elegant Graphics for Data Analysis* (3rd ed.); Julia Silge and David Robinson, *Text Mining with R* (O'Reilly, 2017).
**Online resources** — Tidyverse documentation (tidyverse.org); CRAN Task View: Natural Language Processing; Yihui Xie's R Markdown documentation.

---

# Chapter 1: R and Tidyverse Fundamentals

## 1.1 R Data Structures

R provides a hierarchy of data structures suited to different analytical tasks. Understanding their properties is essential before working with real datasets.

**Vectors** are the atomic unit of R. Every scalar is a length-one vector. Vectors are homogeneous: all elements share a single type (`logical`, `integer`, `double`, `character`, `complex`, `raw`). Type coercion follows the hierarchy `logical < integer < double < character`.

```r
x <- c(1L, 2L, 3L)        # integer vector
y <- c(1.0, 2.5, 3.7)     # double vector
z <- c(TRUE, FALSE, TRUE)  # logical vector
typeof(x)  # "integer"
```

**Lists** are heterogeneous recursive vectors. Each element may be any R object, including another list. Lists are the backbone of most complex R objects (fitted models, HTTP responses, XML trees).

```r
record <- list(name = "Alice", score = 98.5, passed = TRUE)
record[["name"]]   # "Alice"  -- use [[ rather than dollar-sign accessor where possible
```

**Data frames** are lists of equal-length vectors, displayed as a rectangular table. **Tibbles** (`tbl_df`) from the `tibble` package are a modern reimagining of the data frame: they print concisely (showing only the first 10 rows and as many columns as fit), never silently convert strings to factors, and do not partial-match column names.

```r
library(tibble)
df <- tibble(
  id    = 1:5,
  value = rnorm(5),
  label = letters[1:5]
)
df
```

<div class="definition">
<strong>Tibble.</strong> A tibble is a data frame subclass that enforces consistent subsetting behaviour and explicit type coercion, reducing silent errors in exploratory pipelines. Formally, a tibble is an S3 object with class <code>c("tbl_df", "tbl", "data.frame")</code>.
</div>

**Factors** encode categorical variables as integer codes with an associated character vector of levels. Ordered factors additionally record a linear order on levels, which affects model contrasts.

```r
grade <- factor(c("A", "B", "A", "C"), levels = c("C", "B", "A"))
levels(grade)   # "C" "B" "A"
as.integer(grade)  # 3 2 3 1
```

## 1.2 The Pipe Operator

R 4.1 introduced the native pipe `|>` (mirroring the `magrittr` pipe `%>%`). The pipe passes the left-hand side as the first argument to the right-hand side function, enabling readable left-to-right chains:

```r
mtcars |>
  subset(cyl == 4) |>
  (function(d) d[["mpg"]])() |>
  mean()
```

The native pipe differs from `%>%` in one key respect: the placeholder for non-first-argument insertion is `_` (introduced in R 4.2), whereas `magrittr` uses `.`.

## 1.3 Core dplyr Verbs

The `dplyr` package provides a grammar of data manipulation. Six verbs cover the vast majority of tabular operations:

| Verb | Purpose |
|------|---------|
| `filter()` | Keep rows satisfying a condition |
| `select()` | Keep or drop columns by name |
| `mutate()` | Add or transform columns |
| `group_by()` | Declare grouping structure |
| `summarize()` | Collapse groups to summaries |
| `arrange()` | Reorder rows |

```r
library(dplyr)
library(nycflights13)

flights |>
  filter(month == 1, !is.na(dep_delay)) |>
  group_by(carrier) |>
  summarize(
    mean_delay = mean(dep_delay),
    n_flights   = n()
  ) |>
  arrange(desc(mean_delay))
```

`left_join()`, `inner_join()`, `full_join()`, and `anti_join()` implement the standard relational join operations. The `by` argument specifies the key columns.

```r
flights |>
  left_join(airlines, by = "carrier") |>
  select(flight, name, dep_delay)
```

## 1.4 Reshaping with tidyr

Real datasets arrive in many shapes. **Tidy data** (Wickham 2014) requires each variable in one column and each observation in one row. The two primary reshaping verbs are:

- `pivot_longer()`: collapse multiple columns into key–value pairs (wide → long)
- `pivot_wider()`: spread a key–value pair across multiple columns (long → wide)

```r
library(tidyr)

# Wide to long
billboard |>
  pivot_longer(
    cols      = starts_with("wk"),
    names_to  = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  mutate(week = as.integer(gsub("wk", "", week)))
```

`separate()` and `unite()` handle columns that pack multiple variables into a single string or need to be combined.

## 1.5 Functional Programming with purrr

`purrr` brings consistent, type-stable functional programming to R. The `map()` family applies a function to each element of a list or vector and returns a list; variants `map_dbl()`, `map_chr()`, `map_lgl()`, and `map_df()` return typed atomic vectors or data frames.

```r
library(purrr)

# Fit a linear model for each cylinder group
models <- mtcars |>
  split(mtcars[["cyl"]]) |>
  map(function(d) lm(mpg ~ wt, data = d))

# Extract R-squared from each
models |> map_dbl(function(m) summary(m)[["r.squared"]])
```

`map2()` and `pmap()` iterate over two or more lists in parallel. `walk()` is the side-effect variant (printing, writing files) that returns the input invisibly.

## 1.6 R Markdown for Reproducible Analysis

R Markdown integrates prose, code, and output into a single document. The YAML header specifies the output format; code chunks use fenced backtick syntax with `{r}` as the engine specifier. Chunk options such as `echo`, `eval`, `warning`, and `fig.width` control what appears in the rendered document.

```
---
title: "EDA Report"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk[["set"]](echo = TRUE, warning = FALSE)
```

## Summary statistics

```{r summary}
summary(airquality)
```
```

Quarto (`.qmd`) is the next-generation successor to R Markdown, supporting Python, Julia, and Observable in the same document framework.

---

# Chapter 2: Data Formats and Ingestion

## 2.1 Rectangular Data

The `readr` package provides fast, predictable parsing of delimited text files. Unlike base `read.csv()`, `readr` does not convert strings to factors, uses a progress bar on large files, and emits explicit parse problems rather than silent `NA` substitution.

```r
library(readr)

df <- read_csv(
  "data/survey.csv",
  col_types = cols(
    date     = col_date(format = "%Y-%m-%d"),
    income   = col_double(),
    province = col_character()
  ),
  na = c("", "NA", "N/A", "missing")
)

problems(df)   # inspect any parse failures
```

`readxl` reads `.xlsx` and `.xls` files without a Java dependency. The `sheet` argument accepts either an index or name.

```r
library(readxl)
raw <- read_excel("data/workbook.xlsx", sheet = "Sheet2", skip = 2)
```

## 2.2 JSON

JSON (JavaScript Object Notation) is the de facto interchange format for web APIs. `jsonlite` converts between R objects and JSON strings with `fromJSON()` / `toJSON()`. The `simplifyVector` and `simplifyDataFrame` arguments control automatic flattening.

```r
library(jsonlite)

raw_json <- readLines("data/records.json") |> paste(collapse = "\n")
df <- fromJSON(raw_json, simplifyDataFrame = TRUE)
```

Deeply nested JSON often requires `purrr::map()` chains to extract relevant fields before coercion to a data frame.

## 2.3 XML

XML is prevalent in government open data, bibliographic records, and legacy systems. The `xml2` package provides an XPath-based interface.

```r
library(xml2)

doc  <- read_xml("data/books.xml")
titles <- xml_find_all(doc, ".//title") |> xml_text()
prices <- xml_find_all(doc, ".//price") |> xml_double()

tibble(title = titles, price = prices)
```

<div class="remark">
<strong>XPath basics.</strong> XPath expressions navigate the tree: <code>//node</code> selects all matching nodes anywhere; <code>/root/child</code> is an absolute path; <code>@attr</code> selects an attribute; <code>text()</code> extracts the text content of an element.
</div>

## 2.4 Character Encodings

Encoding mismatches are among the most common ingestion failures. The `readr` functions default to UTF-8. Use `guess_encoding()` on problematic files before specifying `locale = locale(encoding = "latin1")`.

```r
guess_encoding("data/legacy.csv")
df <- read_csv("data/legacy.csv", locale = locale(encoding = "ISO-8859-1"))
```

## 2.5 Dates and Times with lubridate

`lubridate` provides functions that parse date-time strings into `POSIXct` objects regardless of separator style, and arithmetic helpers that respect daylight saving time and time zones.

```r
library(lubridate)

ymd("2026-01-15")                   # "2026-01-15"
dmy_hm("15/01/2026 14:30")          # "2026-01-15 14:30:00 UTC"
ymd("2026-01-15") + months(3)       # "2026-04-15"
floor_date(now(), unit = "week")    # start of current week
```

`year()`, `month()`, `mday()`, `wday()`, `hour()`, and `minute()` extract components. The `interval()` and `duration()` classes handle time spans precisely.

## 2.6 Type Coercion Pitfalls

Common coercion hazards include:

- Excel's numeric representation of dates (serial numbers since 1900-01-01): use `as.Date(x, origin = "1899-12-30")`.
- Factor-to-numeric conversion via `as.numeric(factor_var)` returns the integer codes, not the underlying values; use `as.numeric(as.character(factor_var))` instead.
- Implicit `NA` introduction when `as.double()` encounters non-numeric strings.
- Inconsistent decimal separators (`,` vs `.`) in European-locale data: set `locale(decimal_mark = ",")`.

---

# Chapter 3: Summary Statistics and Regression

## 3.1 Univariate Summaries

For a sample \( x_1, \ldots, x_n \), the standard location and spread measures are:

\[
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i, \qquad
s^2 = \frac{1}{n-1} \sum_{i=1}^{n} (x_i - \bar{x})^2
\]

The **median** is the middle order statistic and is robust to outliers. The **interquartile range** \( \text{IQR} = Q_3 - Q_1 \) measures spread without sensitivity to extremes.

**Skewness** measures asymmetry:

\[
\text{skew} = \frac{1}{n} \sum_{i=1}^{n} \left(\frac{x_i - \bar{x}}{s}\right)^3
\]

Positive skewness indicates a long right tail (common in income and response-time data). **Kurtosis** measures tail heaviness relative to a normal distribution; excess kurtosis subtracts 3.

**Robust alternatives:** the trimmed mean discards the top and bottom \( \alpha \) fraction before averaging. The **median absolute deviation** (MAD) is \( \text{MAD} = \text{median}(|x_i - \text{median}(x)|) \), scaled by 1.4826 to match \( \sigma \) under normality.

```r
library(dplyr)
library(moments)  # skewness(), kurtosis()

airquality |>
  summarize(
    mean_oz   = mean(Ozone, na.rm = TRUE),
    med_oz    = median(Ozone, na.rm = TRUE),
    iqr_oz    = IQR(Ozone, na.rm = TRUE),
    mad_oz    = mad(Ozone, na.rm = TRUE),
    skew_oz   = skewness(Ozone, na.rm = TRUE),
    kurt_oz   = kurtosis(Ozone, na.rm = TRUE)
  )
```

## 3.2 Multivariate Summaries

The **sample covariance matrix** \( \hat{\Sigma} \) and **sample correlation matrix** \( \hat{R} \) summarize pairwise linear relationships among \( p \) variables:

\[
\hat{R}_{jk} = \frac{\hat{\sigma}_{jk}}{\hat{\sigma}_j \hat{\sigma}_k}
\]

```r
library(GGally)

# Pairs plot with correlation coefficients
ggpairs(
  mtcars[, c("mpg", "hp", "wt", "qsec")],
  upper = list(continuous = "cor"),
  lower = list(continuous = "smooth"),
  diag  = list(continuous = "densityDiag")
)
```

## 3.3 Diagnostic Graphs

<div class="definition">
<strong>Histogram.</strong> A histogram partitions the data range into <em>k</em> bins and displays the count (or density) in each bin as a bar. Bin width is the critical choice: Sturges' rule \( k = \lceil \log_2 n \rceil + 1 \) is a common default, but Scott's or Freedman–Diaconis rules adapt to variance and skewness.
</div>

<div class="definition">
<strong>Box-and-whisker plot.</strong> The box spans \( Q_1 \) to \( Q_3 \); the interior line marks the median; whiskers extend to the most extreme observation within \( 1.5 \times \text{IQR} \) of the box; points beyond the whiskers are plotted individually as potential outliers.
</div>

A **QQ-plot** compares the empirical quantiles of the data against theoretical quantiles of a reference distribution (typically standard normal). Points falling on the diagonal reference line indicate good agreement; systematic curvature reveals skewness; heavy tails appear as S-shaped deviation.

```r
library(ggplot2)

ggplot(airquality, aes(sample = Ozone)) +
  stat_qq() +
  stat_qq_line() +
  labs(title = "Normal QQ-plot of Ozone", x = "Theoretical", y = "Sample")
```

## 3.4 Simple and Multiple Linear Regression

**Simple linear regression** models the conditional expectation of \( Y \) given \( X \):

\[
Y_i = \beta_0 + \beta_1 x_i + \varepsilon_i, \quad \varepsilon_i \overset{\text{iid}}{\sim} \mathcal{N}(0, \sigma^2)
\]

The **OLS estimator** minimises the residual sum of squares:

\[
\hat{\boldsymbol{\beta}} = \left(\mathbf{X}^\top \mathbf{X}\right)^{-1} \mathbf{X}^\top \mathbf{y}
\]

where \( \mathbf{X} \) is the \( n \times p \) design matrix with a leading column of ones.

**Coefficient of determination:**

\[
R^2 = 1 - \frac{\text{SS}_{\text{res}}}{\text{SS}_{\text{tot}}} = 1 - \frac{\sum_i (y_i - \hat{y}_i)^2}{\sum_i (y_i - \bar{y})^2}
\]

\( R^2 \) measures the proportion of variance explained by the model. The **adjusted** \( R^2 \) penalises for additional predictors:

\[
R^2_{\text{adj}} = 1 - (1 - R^2) \frac{n-1}{n - p - 1}
\]

```r
fit <- lm(mpg ~ wt + hp + am, data = mtcars)
summary(fit)
```

**Residual diagnostics** assess the four OLS assumptions:

1. *Linearity* — residuals vs. fitted plot should show no systematic curvature.
2. *Homoscedasticity* — scale-location plot (√|residuals| vs. fitted) should have a flat trend.
3. *Normality* — QQ-plot of residuals should be approximately linear.
4. *Independence* — for time-ordered data, the Durbin-Watson statistic tests for serial correlation.

```r
par(mfrow = c(2, 2))
plot(fit)
```

<div class="example">
<strong>Example: Fuel efficiency model.</strong> Fitting <code>mpg ~ wt + hp</code> on <code>mtcars</code> yields \( R^2 = 0.83 \), indicating that weight and horsepower together account for 83% of variance in fuel efficiency. The weight coefficient \( \hat{\beta}_{\text{wt}} \approx -3.88 \) implies that each additional 1000 lbs of vehicle weight is associated with a decrease of roughly 3.9 mpg, holding horsepower fixed.
</div>

---

# Chapter 4: Text Data and Missing Data

## 4.1 Tokenization and Bag-of-Words

**Tokenization** is the process of splitting a text string into a sequence of tokens — typically words, but potentially sentences, characters, or sub-word units.

The **bag-of-words** (BoW) representation discards token order and represents each document as a vector of token counts. For a vocabulary of size \( V \) and a corpus of \( D \) documents, the document-term matrix \( \mathbf{C} \in \mathbb{Z}_{\geq 0}^{D \times V} \) has entry \( c_{dv} \) equal to the count of term \( v \) in document \( d \).

```r
library(tidytext)
library(dplyr)
library(janeaustenr)

tidy_books <- austen_books() |>
  unnest_tokens(word, text) |>
  anti_join(stop_words, by = "word")

tidy_books |>
  count(book, word, sort = TRUE)
```

## 4.2 TF-IDF

Raw term frequency favours frequent but uninformative words. **TF-IDF** (term frequency–inverse document frequency) up-weights terms that are frequent in a document but rare across the corpus.

<div class="definition">
<strong>TF-IDF.</strong> For term <em>t</em> in document <em>d</em> from a corpus of <em>D</em> documents, let <em>f</em><sub>t,d</sub> denote the raw count and <em>df</em><sub>t</sub> the number of documents containing <em>t</em>. Then:

\[
\text{tf-idf}(t, d) = \underbrace{\frac{f_{t,d}}{\sum_{t'} f_{t',d}}}_{\text{term frequency}} \times \underbrace{\log \frac{D}{df_t}}_{\text{inverse document frequency}}
\]

High TF-IDF signals a term that is both locally frequent and globally discriminating.
</div>

```r
tidy_books |>
  count(book, word) |>
  bind_tf_idf(word, book, n) |>
  arrange(desc(tf_idf))
```

## 4.3 Sentiment Analysis and N-grams

Sentiment analysis attaches polarity (positive/negative/neutral) or emotion scores to text. Lexicon-based approaches join tokens with a sentiment dictionary such as AFINN (integer scores −5 to 5), Bing (binary), or NRC (categorical emotions).

```r
tidy_books |>
  inner_join(get_sentiments("afinn"), by = "word") |>
  group_by(book) |>
  summarize(sentiment = sum(value))
```

An **n-gram** is a contiguous sequence of \( n \) tokens. Bigrams capture local context and are useful for negation handling in sentiment analysis (`not good` vs. `good`).

```r
austen_books() |>
  unnest_tokens(bigram, text, token = "ngrams", n = 2) |>
  tidyr::separate(bigram, c("word1", "word2"), sep = " ") |>
  filter(!word1 %in% stop_words[["word"]]) |>
  count(word1, word2, sort = TRUE)
```

## 4.4 Missing Data Taxonomy

<div class="definition">
<strong>MCAR, MAR, MNAR.</strong>

Let \( Y \) be the full data matrix and \( R \) the missingness indicator matrix (\( R_{ij} = 1 \) if \( Y_{ij} \) is observed). Write \( Y_{\text{obs}} \) and \( Y_{\text{mis}} \) for the observed and missing parts.

<ul>
  <li><strong>MCAR (Missing Completely At Random):</strong> \( P(R \mid Y) = P(R) \). Missingness is independent of all data, observed or missing. Listwise deletion is valid but wasteful.</li>
  <li><strong>MAR (Missing At Random):</strong> \( P(R \mid Y) = P(R \mid Y_{\text{obs}}) \). Missingness depends only on observed data. Most imputation methods are valid under MAR.</li>
  <li><strong>MNAR (Missing Not At Random):</strong> \( P(R \mid Y) \) depends on \( Y_{\text{mis}} \). Requires explicit modelling of the missingness mechanism.</li>
</ul>
</div>

## 4.5 Imputation Strategies

**Listwise deletion** drops any observation with at least one missing value. Valid under MCAR; induces bias under MAR.

**Mean/mode imputation** replaces missing values with the column mean (numeric) or mode (categorical). Preserves marginal means but attenuates variance and distorts correlations.

**Regression imputation** fits a model to predict the missing variable from observed variables, substituting the predicted value. Preserves correlations but underestimates uncertainty.

**Multiple imputation** (MI) generates \( m \) complete datasets, each with different imputed values drawn from the posterior predictive distribution of the missing data. Analyses are run on each dataset and combined using Rubin's rules.

```r
library(mice)

imp <- mice(airquality, m = 5, method = "pmm", seed = 42, printFlag = FALSE)
fit_mi <- with(imp, lm(Ozone ~ Solar.R + Wind + Temp))
pool(fit_mi) |> summary()
```

**Visualising missingness** with `naniar`:

```r
library(naniar)
vis_miss(airquality)
gg_miss_var(airquality)
```

---

# Chapter 5: Logistic and Ordinal Models

## 5.1 Logistic Regression

When the response \( Y \in \{0, 1\} \), linear regression violates the Bernoulli constraint \( P(Y=1) \in [0,1]\). Logistic regression models the log-odds:

\[
\log \frac{P(Y=1 \mid \mathbf{x})}{1 - P(Y=1 \mid \mathbf{x})} = \boldsymbol{\beta}^\top \mathbf{x}
\]

which implies:

\[
P(Y=1 \mid \mathbf{x}) = \frac{e^{\boldsymbol{\beta}^\top \mathbf{x}}}{1 + e^{\boldsymbol{\beta}^\top \mathbf{x}}}
\]

Parameters are estimated by maximum likelihood, maximising:

\[
\ell(\boldsymbol{\beta}) = \sum_{i=1}^{n} \left[ y_i \boldsymbol{\beta}^\top \mathbf{x}_i - \log(1 + e^{\boldsymbol{\beta}^\top \mathbf{x}_i}) \right]
\]

<div class="definition">
<strong>Odds ratio.</strong> For a unit increase in predictor \( x_j \), the odds ratio is \( e^{\beta_j} \). If \( \beta_j > 0 \), the odds of the outcome increase; if \( \beta_j < 0 \), they decrease. Odds ratios greater than 1 indicate a positive association.
</div>

**Deviance** is \( D = -2 \ell(\hat{\boldsymbol{\beta}}) \); the **null deviance** uses only an intercept. Their difference follows an approximate chi-squared distribution, forming the basis of likelihood ratio tests.

```r
library(dplyr)

fit_glm <- glm(am ~ wt + hp, data = mtcars, family = binomial)
summary(fit_glm)
exp(coef(fit_glm))   # odds ratios
```

## 5.2 ROC Curve and AUC

The **ROC curve** (Receiver Operating Characteristic) plots the true positive rate against the false positive rate across all classification thresholds. The **AUC** (Area Under the Curve) summarises discriminative ability: AUC = 0.5 is chance, AUC = 1.0 is perfect.

```r
library(pROC)

pred <- predict(fit_glm, type = "response")
roc_obj <- roc(mtcars[["am"]], pred)
auc(roc_obj)
plot(roc_obj, main = "ROC Curve: Transmission Type")
```

## 5.3 Ordered Logistic Regression

When the response is ordinal (e.g., Likert scale, education level), the **proportional odds model** (McCullagh 1980) specifies a common slope across all cumulative cut-points:

\[
\log \frac{P(Y \leq k \mid \mathbf{x})}{P(Y > k \mid \mathbf{x})} = \alpha_k - \boldsymbol{\beta}^\top \mathbf{x}, \quad k = 1, \ldots, K-1
\]

The proportional odds assumption (constant \( \boldsymbol{\beta} \) across cut-points) should be checked with a Brant test.

```r
library(MASS)

fit_ord <- polr(factor(gear) ~ wt + hp, data = mtcars, Hess = TRUE)
summary(fit_ord)
exp(coef(fit_ord))   # proportional odds ratios
```

## 5.4 Poisson and Zero-Inflated Regression

**Poisson regression** models non-negative integer counts with mean \( \mu = e^{\boldsymbol{\beta}^\top \mathbf{x}} \). Overdispersion (variance exceeding mean) can be addressed with quasi-Poisson or negative binomial regression.

**Zero-inflated** models handle data with excess zeros by mixing a point mass at zero with a count distribution:

\[
P(Y = 0) = \pi + (1 - \pi) e^{-\mu}
\]

```r
library(pscl)
fit_zip <- zeroinfl(count ~ x1 + x2 | x1, data = mydata, dist = "poisson")
```

---

# Chapter 6: Regularization and Trees

## 6.1 Ridge and LASSO

Standard OLS can overfit when predictors are highly correlated or when \( p \) is large relative to \( n \). **Regularization** adds a penalty to the loss function to shrink coefficients.

<div class="definition">
<strong>Ridge regression.</strong> The Ridge estimator solves:

\[
\hat{\boldsymbol{\beta}}^{\text{ridge}} = \arg\min_{\boldsymbol{\beta}} \left\{ \sum_{i=1}^{n}(y_i - \boldsymbol{\beta}^\top \mathbf{x}_i)^2 + \lambda \sum_{j=1}^{p} \beta_j^2 \right\}
\]

The \( \ell_2 \) penalty shrinks all coefficients towards zero but does not produce exact zeros.
</div>

<div class="definition">
<strong>LASSO.</strong> The LASSO (Least Absolute Shrinkage and Selection Operator, Tibshirani 1996) replaces the squared penalty with an \( \ell_1 \) norm:

\[
\hat{\boldsymbol{\beta}}^{\text{lasso}} = \arg\min_{\boldsymbol{\beta}} \left\{ \sum_{i=1}^{n}(y_i - \boldsymbol{\beta}^\top \mathbf{x}_i)^2 + \lambda \sum_{j=1}^{p} |\beta_j| \right\}
\]

The \( \ell_1 \) penalty induces sparsity: coefficients of irrelevant predictors are set exactly to zero. LASSO therefore performs simultaneous estimation and variable selection.
</div>

**Geometric intuition:** Ridge penalises within a circular (hyper-sphere) constraint region; LASSO penalises within a diamond (hyper-rhombus) whose corners lie on the coordinate axes. The solution often touches a corner of the LASSO constraint, zeroing out coefficients.

The **elastic net** combines both penalties:

\[
\lambda \left[ \alpha \sum_j |\beta_j| + (1 - \alpha) \sum_j \beta_j^2 \right]
\]

with mixing parameter \( \alpha \in [0,1] \).

**Selecting \( \lambda \)** via cross-validation:

```r
library(glmnet)

X <- model.matrix(mpg ~ . - 1, data = mtcars)
y <- mtcars[["mpg"]]

cv_lasso <- cv.glmnet(X, y, alpha = 1)
plot(cv_lasso)

best_lambda <- cv_lasso[["lambda.min"]]
coef(cv_lasso, s = "lambda.min")
```

## 6.2 Decision Trees (CART)

A **classification and regression tree** (CART, Breiman et al. 1984) recursively partitions the feature space into rectangular regions, fitting a constant within each leaf.

At each node, the algorithm selects the split variable \( j \) and threshold \( s \) that minimise the impurity of the two resulting child nodes.

<div class="definition">
<strong>Gini impurity.</strong> For a node containing observations from \( K \) classes with proportions \( p_1, \ldots, p_K \):

\[
G = \sum_{k=1}^{K} p_k (1 - p_k) = 1 - \sum_{k=1}^{K} p_k^2
\]

Gini impurity is zero for a pure node and maximal when classes are equally represented.
</div>

<div class="definition">
<strong>Information gain (entropy-based).</strong> Using Shannon entropy \( H = -\sum_k p_k \log_2 p_k \), the information gain of split \( s \) is:

\[
\Delta H = H(\text{parent}) - \frac{n_L}{n} H(\text{left}) - \frac{n_R}{n} H(\text{right})
\]
</div>

```r
library(rpart)
library(rpart.plot)

tree_fit <- rpart(am ~ wt + hp + disp, data = mtcars, method = "class")
rpart.plot(tree_fit, type = 4, extra = 101)
```

## 6.3 Random Forests and Gradient Boosting

**Random forests** (Breiman 2001) build \( B \) decorrelated trees by (1) bootstrap-sampling the training data and (2) at each split, considering only a random subset of \( m \approx \sqrt{p} \) features. Predictions are aggregated by majority vote (classification) or mean (regression).

```r
library(randomForest)
rf_fit <- randomForest(factor(am) ~ ., data = mtcars, ntree = 500, importance = TRUE)
varImpPlot(rf_fit)
```

**Gradient boosted trees** (Friedman 2001) build trees sequentially, each fitting the negative gradient of the loss function on the residuals from the ensemble so far. **XGBoost** adds second-order gradient information, column subsampling, and regularisation, making it the workhorse algorithm in tabular data competitions.

```r
library(xgboost)

dtrain <- xgb.DMatrix(data = X, label = y)
params <- list(objective = "reg:squarederror", max_depth = 3, eta = 0.1)
xgb_fit <- xgb.train(params, dtrain, nrounds = 100)
xgb.importance(model = xgb_fit) |> xgb.plot.importance()
```

**Variable importance** in trees is measured by the total reduction in node impurity (Gini or MSE) attributable to splits on a given variable, averaged across all trees.

---

# Chapter 7: Model Selection and Validation

## 7.1 Bias-Variance Decomposition

For a prediction model \( \hat{f} \) trained on data \( \mathcal{D} \), the expected prediction error at a new point \( x_0 \) decomposes as:

\[
\mathbb{E}\left[(y_0 - \hat{f}(x_0))^2\right] = \underbrace{\left(\mathbb{E}[\hat{f}(x_0)] - f(x_0)\right)^2}_{\text{Bias}^2} + \underbrace{\mathbb{E}\left[\left(\hat{f}(x_0) - \mathbb{E}[\hat{f}(x_0)]\right)^2\right]}_{\text{Variance}} + \sigma^2
\]

Complex models (deep trees, low-\( \lambda \) LASSO) have low bias but high variance. Simple models (high-\( \lambda \) ridge, shallow trees) have high bias but low variance. Model selection aims to find the sweet spot.

## 7.2 Training, Validation, and Test Sets

The standard protocol splits available data into three non-overlapping partitions:

- **Training set** (~60–70%): used to fit model parameters.
- **Validation set** (~15–20%): used to select hyperparameters (e.g., \( \lambda \), tree depth, \( k \) in kNN).
- **Test set** (~15–20%): used *once* to report final performance. The test set must never inform any modelling decision.

```r
set.seed(847)
n <- nrow(mydata)
idx <- sample(n)
train_idx <- idx[1:floor(0.7 * n)]
val_idx   <- idx[(floor(0.7 * n) + 1):floor(0.85 * n)]
test_idx  <- idx[(floor(0.85 * n) + 1):n]
```

## 7.3 Cross-Validation

**k-fold cross-validation** partitions the data into \( k \) roughly equal folds. For each fold \( i \), the model is trained on the remaining \( k-1 \) folds and evaluated on fold \( i \). The CV estimate is:

\[
\text{CV}_k = \frac{1}{k} \sum_{i=1}^{k} \text{Err}_i
\]

**Leave-one-out cross-validation** (LOOCV) sets \( k = n \). It is unbiased but computationally expensive and has high variance. For linear models, the LOOCV statistic has a closed form via the hat matrix.

```r
library(caret)

ctrl <- trainControl(method = "cv", number = 10)
cv_fit <- train(mpg ~ ., data = mtcars, method = "lm", trControl = ctrl)
cv_fit[["results"]]
```

## 7.4 Information Criteria

**AIC** (Akaike Information Criterion) penalises log-likelihood by the number of parameters:

\[
\text{AIC} = -2\ell(\hat{\boldsymbol{\beta}}) + 2p
\]

**BIC** (Bayesian Information Criterion) uses a stronger penalty:

\[
\text{BIC} = -2\ell(\hat{\boldsymbol{\beta}}) + p \log n
\]

Lower values indicate preferred models. BIC penalises complexity more heavily and tends to select sparser models.

## 7.5 Stepwise Selection

Forward stepwise selection starts from an intercept-only model and greedily adds the predictor that most improves a criterion (AIC or BIC). Backward stepwise starts from the full model and removes predictors. Neither procedure is guaranteed to find the globally optimal subset.

```r
full_model <- lm(mpg ~ ., data = mtcars)
step_model  <- step(full_model, direction = "backward", trace = FALSE)
```

## 7.6 Classification Metrics

For a binary classifier with predicted probabilities thresholded at 0.5:

<div class="definition">
<strong>Confusion matrix metrics.</strong> Let TP, FP, TN, FN denote true positives, false positives, true negatives, and false negatives.

\[
\text{Precision} = \frac{TP}{TP + FP}, \quad
\text{Recall} = \frac{TP}{TP + FN}, \quad
F_1 = \frac{2 \cdot \text{Precision} \cdot \text{Recall}}{\text{Precision} + \text{Recall}}
\]

<strong>Accuracy</strong> = \( (TP + TN) / n \); useful only when classes are balanced.
</div>

```r
library(caret)
confusionMatrix(predicted_class, actual_class, positive = "1")
```

---

# Chapter 8: Clustering and Dimension Reduction

## 8.1 k-Means Clustering

k-means (Lloyd's algorithm) partitions \( n \) observations into \( k \) clusters by minimising the within-cluster sum of squares:

\[
\underset{C_1, \ldots, C_k}{\min} \sum_{j=1}^{k} \sum_{i \in C_j} \|\mathbf{x}_i - \boldsymbol{\mu}_j\|^2
\]

**Lloyd's algorithm:** (1) Initialise \( k \) centroids (randomly or via k-means++). (2) Assign each observation to its nearest centroid. (3) Recompute centroids as cluster means. (4) Repeat steps 2–3 until convergence.

The algorithm converges to a local minimum; running multiple random initialisations is recommended.

**Choosing \( k \):**
- **Elbow method:** plot the within-cluster sum of squares against \( k \) and look for an "elbow."
- **Silhouette coefficient:** for observation \( i \), compute \( s(i) = (b(i) - a(i)) / \max(a(i), b(i)) \) where \( a(i) \) is average intra-cluster distance and \( b(i) \) is the average distance to the nearest other cluster. \( s(i) \in [-1, 1] \); higher is better.

```r
library(factoextra)

km <- kmeans(scale(mtcars), centers = 3, nstart = 25)
fviz_cluster(km, data = scale(mtcars))
fviz_nbclust(scale(mtcars), kmeans, method = "silhouette")
```

## 8.2 Hierarchical Clustering

Agglomerative hierarchical clustering begins with each observation as its own cluster and merges the closest pair at each step. The result is a dendrogram; clusters are formed by cutting at a chosen height.

**Ward's method** merges the two clusters whose union minimises the increase in total within-cluster variance — generally producing compact, roughly equal-sized clusters.

```r
hc <- hclust(dist(scale(mtcars)), method = "ward.D2")
plot(hc, hang = -1, cex = 0.6)
cutree(hc, k = 3)   # cut into 3 clusters
```

## 8.3 DBSCAN

DBSCAN (Density-Based Spatial Clustering of Applications with Noise, Ester et al. 1996) defines clusters as dense regions of points separated by low-density regions. Two hyperparameters control density: \( \varepsilon \) (neighbourhood radius) and `minPts` (minimum points to form a core point). Points in low-density regions are labelled noise — a key advantage over k-means.

```r
library(dbscan)
db <- dbscan(scale(mtcars[, c("wt", "mpg")]), eps = 0.5, minPts = 4)
plot(scale(mtcars[, c("wt", "mpg")]), col = db[["cluster"]] + 1L)
```

## 8.4 Principal Component Analysis

PCA finds a lower-dimensional linear subspace that maximally explains variance in the data. Formally, the first principal component direction \( \mathbf{v}_1 \) solves:

\[
\mathbf{v}_1 = \arg\max_{\|\mathbf{v}\|=1} \mathbf{v}^\top \hat{\Sigma} \mathbf{v}
\]

and equals the eigenvector of \( \hat{\Sigma} \) corresponding to the largest eigenvalue. Subsequent components are orthogonal to all previous ones and explain decreasing amounts of variance.

**Proportion of variance explained** by component \( j \):

\[
\text{PVE}_j = \frac{\lambda_j}{\sum_{l=1}^{p} \lambda_l}
\]

A **scree plot** displays \( \lambda_j \) against \( j \); the "elbow" suggests how many components to retain.

```r
pca <- prcomp(scale(mtcars))
summary(pca)           # cumulative PVE
screeplot(pca, type = "lines")

library(ggplot2)
autoplot(pca, data = mtcars, colour = "cyl", loadings = TRUE,
         loadings.label = TRUE) +
  theme_minimal()
```

## 8.5 t-SNE

t-SNE (van der Maaten & Hinton 2008) is a non-linear dimensionality reduction method that preserves local neighbourhood structure. It defines a probability distribution over pairs in high-dimensional space using Gaussian kernels, and a second distribution in 2D/3D space using Student's t-kernel (heavy tails prevent crowding). The low-dimensional embedding minimises the KL divergence between these distributions via gradient descent.

<div class="remark">
<strong>Perplexity</strong> is t-SNE's key hyperparameter, loosely corresponding to the effective number of neighbours. Typical values range from 5 to 50. Distances between clusters in a t-SNE plot are not interpretable; only local structure is meaningful. Different random seeds and perplexity values should be compared.
</div>

```r
library(Rtsne)

tsne_out <- Rtsne(scale(mtcars), perplexity = 10, pca = FALSE, check_duplicates = FALSE)
as.data.frame(tsne_out[["Y"]]) |>
  ggplot(aes(V1, V2, colour = factor(mtcars[["cyl"]]))) +
  geom_point(size = 2) +
  labs(colour = "Cylinders", title = "t-SNE of mtcars") +
  theme_minimal()
```

## 8.6 UMAP

UMAP (McInnes et al. 2018) is a manifold learning method that constructs a fuzzy topological representation of the data in high-dimensional space and optimises a low-dimensional counterpart. UMAP is generally faster than t-SNE, better preserves global structure, and supports transforming new data after fitting — making it suitable for supervised dimensionality reduction as well.

```r
library(umap)
umap_out <- umap(scale(mtcars))
as.data.frame(umap_out[["layout"]]) |>
  ggplot(aes(V1, V2, colour = factor(mtcars[["cyl"]]))) +
  geom_point() + theme_minimal()
```

---

# Chapter 9: More Dimensionality Reduction and k-NN

## 9.1 Multidimensional Scaling

**Classical MDS** (also called principal coordinates analysis) finds a low-dimensional configuration \( \mathbf{Z} \in \mathbb{R}^{n \times k} \) such that Euclidean distances in the configuration approximate a given dissimilarity matrix \( \mathbf{D} \). It is equivalent to PCA when \( \mathbf{D} \) contains Euclidean distances on centred data.

**Non-metric MDS** relaxes the requirement to preserve actual distances, requiring only that the rank order of distances is maintained. Stress measures the deviation from perfect rank preservation.

```r
d   <- dist(scale(mtcars))
mds <- cmdscale(d, k = 2)
plot(mds, type = "n"); text(mds, labels = rownames(mtcars), cex = 0.6)
```

## 9.2 Kernel PCA

Standard PCA is restricted to linear projections. **Kernel PCA** implicitly maps observations to a high-dimensional feature space via a kernel function \( k(\mathbf{x}_i, \mathbf{x}_j) \) and applies PCA there. Common kernels include radial basis (\( e^{-\gamma \|\mathbf{x}_i - \mathbf{x}_j\|^2} \)) and polynomial. Kernel PCA can uncover non-linear manifold structure invisible to linear methods.

```r
library(kernlab)
kpca_out <- kpca(~., data = as.data.frame(scale(mtcars)), kernel = "rbfdot",
                 kpar = list(sigma = 0.1), features = 2)
rotated(kpca_out)   # extracted features
```

## 9.3 Factor Analysis vs. PCA

While PCA is a data-reduction technique that explains observed variance through linear combinations, **factor analysis** (FA) posits a generative model: observed variables are linear combinations of a small number of latent **factors** plus unique (error) terms.

\[
\mathbf{x} = \boldsymbol{\Lambda} \mathbf{f} + \boldsymbol{\varepsilon}
\]

where \( \boldsymbol{\Lambda} \) is the \( p \times k \) loading matrix and \( \mathbf{f} \) is the \( k \)-dimensional factor vector. FA distinguishes common variance (explained by factors) from unique variance; PCA does not. Factor loadings are estimated by ML or principal axis factoring, and **rotation** (varimax, promax) is applied to improve interpretability.

## 9.4 k-Nearest Neighbours

The **k-NN classifier** assigns a query point \( \mathbf{x}_0 \) the majority class among its \( k \) nearest training points in feature space:

\[
\hat{y}_0 = \arg\max_c \sum_{i \in \mathcal{N}_k(\mathbf{x}_0)} \mathbf{1}[y_i = c]
\]

**k-NN regression** replaces the vote with the mean of the \( k \) neighbours' responses.

**Choosing k:** small \( k \) gives a highly flexible, noisy decision boundary (low bias, high variance); large \( k \) smooths the boundary (high bias, low variance). Cross-validation selects \( k \).

**Curse of dimensionality:** in high dimensions, all points tend towards equal distance from any query point. The fraction of the unit hypercube that must be sampled to capture a fraction \( r \) of observations grows as \( r^{1/p} \), rapidly approaching the entire space. Feature selection and dimensionality reduction are therefore prerequisites for k-NN in high-dimensional data.

**Distance metrics:** Euclidean (\( \ell_2 \)), Manhattan (\( \ell_1 \)), Minkowski, and Cosine distances are common. Categorical variables require Gower's distance or encoding strategies.

```r
library(class)

X_train <- scale(mtcars[train_idx, -1])
X_test  <- scale(mtcars[test_idx, -1], center = attr(X_train, "scaled:center"),
                                        scale  = attr(X_train, "scaled:scale"))
y_train <- factor(mtcars[train_idx, "am"])
y_test  <- factor(mtcars[test_idx,  "am"])

pred_knn <- knn(X_train, X_test, cl = y_train, k = 5)
mean(pred_knn == y_test)  # accuracy
```

---

# Chapter 10: Visualization and Scientific Writing

## 10.1 Principles of Data Visualization

Effective data visualisation communicates information accurately, clearly, and honestly.

**Tufte's data-ink ratio:** maximise the fraction of ink devoted to data-carrying information. Remove chart junk — decorative elements that add no information (gratuitous 3D effects, redundant gridlines, unnecessary backgrounds).

**Pre-attentive attributes** are visual features processed in parallel before focused attention. Position is the most accurate encoding; followed by length, angle, area, colour saturation, and shape. Encode the most important variables using position; reserve colour for secondary groupings.

**Cleveland's hierarchy** (Cleveland & McGill 1984) ranks perceptual accuracy of encodings: position along a common scale > position along identical non-aligned scales > length > angle > area > colour saturation. Choose encodings accordingly.

<div class="remark">
<strong>Colour accessibility.</strong> Approximately 8% of males and 0.5% of females have red-green colour vision deficiency. Use palettes such as viridis, ColorBrewer, or Okabe-Ito that are distinguishable under colour blindness and in greyscale. Avoid rainbow (jet) colour maps, which create perceptual artefacts.
</div>

## 10.2 Grammar of Graphics and ggplot2

`ggplot2` implements Wilkinson's Grammar of Graphics: a plot is built from a dataset, **aesthetic mappings** (which variables map to which visual properties), **geometric objects** (geoms), **statistical transformations**, **scales**, **coordinate systems**, and **facets**.

```r
library(ggplot2)

ggplot(mpg, aes(x = displ, y = hwy, colour = class, size = cyl)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, colour = "black", linewidth = 0.5) +
  facet_wrap(~drv) +
  scale_colour_brewer(palette = "Set2") +
  labs(
    title    = "Highway fuel economy vs. engine displacement",
    subtitle = "Faceted by drive type",
    x        = "Engine displacement (litres)",
    y        = "Highway MPG",
    colour   = "Vehicle class",
    size     = "Cylinders",
    caption  = "Source: EPA fuel economy data"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")
```

**Common geoms:** `geom_point`, `geom_line`, `geom_bar`, `geom_histogram`, `geom_boxplot`, `geom_violin`, `geom_tile`, `geom_text`, `geom_errorbar`.

**Facets:** `facet_wrap(~variable)` creates a 1D sequence of panels; `facet_grid(rows ~ cols)` creates a 2D grid.

**Themes:** `theme_minimal()`, `theme_classic()`, `theme_bw()` provide clean starting points. Individual elements are adjusted via `theme()`.

## 10.3 Figure Captioning

Every figure in a scientific report must have a self-contained caption. A good caption:

1. Describes what is plotted (dependent and independent variables, units).
2. Identifies the data source or sample size.
3. Explains any important features or annotations.
4. Is interpretable without reading the surrounding text.

Example: *"Figure 2. Relationship between engine displacement and highway fuel economy (MPG) for 234 vehicles in the EPA 2008 dataset, faceted by drive type (4WD, FWD, RWD). Points are coloured by vehicle class. OLS regression lines are shown in black. Larger displacement is consistently associated with lower fuel economy across all drive types."*

## 10.4 Writing About Statistical Results

Reporting conventions for statistical results:

- Report effect sizes alongside p-values. A statistically significant result with a tiny effect size may be practically irrelevant.
- Specify the exact model: "A multiple linear regression with weight and horsepower as predictors..."
- Report confidence intervals: "The weight coefficient was −3.88 (95% CI: −5.17 to −2.59), indicating..."
- State assumptions checked: "Residual plots showed no evidence of heteroscedasticity or non-linearity."
- Avoid causal language for observational data: prefer "associated with" over "causes."
- When writing for non-experts, lead with the substantive finding ("Heavier cars get significantly worse fuel economy") before the statistical details.

---

# Chapter 11: API Access

## 11.1 RESTful APIs

A **REST** (Representational State Transfer) API is a web service interface that maps HTTP methods to CRUD operations on resources:

| HTTP Method | Action |
|-------------|--------|
| GET | Read a resource |
| POST | Create a resource or submit data |
| PUT / PATCH | Update a resource |
| DELETE | Remove a resource |

Resources are identified by URLs. Responses are typically JSON or XML. **Status codes** indicate outcomes: 200 OK, 201 Created, 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests, 500 Internal Server Error.

## 11.2 Authentication

**API keys** are static tokens included in request headers (`Authorization: Bearer <key>`) or as query parameters (`?api_key=...`). Store keys in environment variables, never in code.

```r
Sys.setenv(MY_API_KEY = "your_key_here")   # set in .Renviron for persistence
key <- Sys.getenv("MY_API_KEY")
```

**OAuth 2.0** is the standard for user-delegated authorisation. The typical flow: (1) redirect the user to the provider's authorisation endpoint; (2) user grants access; (3) provider returns an authorisation code; (4) exchange code for an access token; (5) use the access token in subsequent requests. The `httr2` package implements OAuth 2.0 flows.

## 11.3 The httr2 Package

`httr2` is the modern successor to `httr`, providing a request-builder pipeline:

```r
library(httr2)
library(jsonlite)

req <- request("https://api.openalex.org/works") |>
  req_url_query(
    filter      = "title.search:exploratory data analysis",
    per_page    = 25,
    mailto      = Sys.getenv("EMAIL_ADDRESS")
  ) |>
  req_headers(Accept = "application/json") |>
  req_throttle(rate = 10 / 60)   # max 10 requests per minute

resp <- req_perform(req)
body <- resp |> resp_body_json(simplifyVector = TRUE)

works <- body[["results"]]
tibble::as_tibble(works[, c("title", "publication_year", "cited_by_count")])
```

## 11.4 Pagination

Many APIs paginate results to limit response size. Common patterns:

- **Cursor-based:** each response contains a `next_cursor` token to pass to the following request.
- **Offset-based:** `page` and `per_page` parameters control the window.
- **Link headers:** the `Link: <url>; rel="next"` HTTP header contains the URL for the next page.

```r
fetch_all_pages <- function(base_url, per_page = 100) {
  results <- list()
  cursor  <- "*"
  repeat {
    resp <- request(base_url) |>
      req_url_query(per_page = per_page, cursor = cursor) |>
      req_perform() |>
      resp_body_json(simplifyVector = TRUE)
    results <- c(results, list(resp[["results"]]))
    cursor  <- resp[["meta"]][["next_cursor"]]
    if (is.null(cursor)) break
  }
  dplyr::bind_rows(results)
}
```

## 11.5 Rate Limiting

Rate limits restrict the number of requests within a time window. Exceeding limits returns a 429 status; the `Retry-After` header specifies how long to wait. `httr2::req_throttle()` enforces a maximum rate; `req_retry()` adds automatic back-off and retry logic.

```r
req_safe <- request(url) |>
  req_throttle(rate = 5 / 60) |>
  req_retry(max_tries = 3, backoff = ~ 30)
```

## 11.6 Real-World API Examples

**Statistics Canada:** The Statistics Canada Data Portal provides a REST API for CANSIM and census data. Queries specify table codes and reference periods.

**data.gov / open.canada.ca:** Government open data portals expose datasets through CKAN APIs. Resources are identified by package IDs.

**OpenAlex:** A fully open scholarly knowledge graph. Free, no authentication required (but polite pool requests a `mailto` parameter). Useful for bibliometric analysis, literature review, and citation network construction.

---

# Chapter 12: Case Studies

## 12.1 Problem Framing

A well-framed data science problem specifies: (1) the substantive question; (2) the unit of analysis; (3) available data sources; (4) the type of analysis (descriptive, predictive, causal); and (5) how the result will be used or communicated.

<div class="example">
<strong>Case study: Predicting citation counts for academic papers.</strong> We frame the question as: <em>"Which paper-level features are associated with high citation counts within five years of publication?"</em> The unit of analysis is a journal article. Data are obtained from OpenAlex. The analysis is predictive (regression) and exploratory. Results will be visualised in an R Markdown report.
</div>

## 12.2 Data Collection and Ingestion

Using the `httr2` workflow from Chapter 11, we retrieve 2000 papers published in statistics journals between 2015 and 2019.

```r
library(httr2); library(dplyr); library(tidyr)

papers_raw <- fetch_all_pages(
  "https://api.openalex.org/works",
  per_page = 200
)

papers <- papers_raw |>
  transmute(
    id            = id,
    title         = display_name,
    year          = publication_year,
    citations     = cited_by_count,
    n_authors     = lengths(authorships),
    open_access   = open_access[["is_oa"]],
    n_references  = referenced_works_count
  )
```

## 12.3 Cleaning and Exploration

```r
# Check missingness
naniar::vis_miss(papers)

# Remove implausible values
papers_clean <- papers |>
  filter(citations >= 0, n_authors >= 1, year %in% 2015:2019)

# Univariate summaries
papers_clean |>
  summarize(across(where(is.numeric), list(
    mean = mean, median = median, sd = sd, iqr = IQR
  )))

# Citations are heavily right-skewed — log-transform
papers_clean <- papers_clean |>
  mutate(log_citations = log1p(citations))
```

## 12.4 Visualization

```r
library(ggplot2)

# Distribution of citations
ggplot(papers_clean, aes(x = log_citations)) +
  geom_histogram(bins = 40, fill = "steelblue", colour = "white") +
  facet_wrap(~year) +
  labs(title = "Distribution of log(1 + citations) by publication year",
       x = "log(1 + citations)", y = "Count") +
  theme_minimal()

# Authors vs. citations
ggplot(papers_clean, aes(x = n_authors, y = log_citations)) +
  geom_jitter(alpha = 0.3, width = 0.2) +
  geom_smooth(method = "loess", colour = "tomato") +
  labs(title = "Author count vs. citation impact",
       x = "Number of authors", y = "log(1 + citations)") +
  theme_minimal()
```

## 12.5 Model Fitting and Selection

We fit three candidate models: linear regression (baseline), LASSO, and random forest.

```r
library(glmnet); library(randomForest); library(caret)

set.seed(847)
train_rows <- createDataPartition(papers_clean[["log_citations"]], p = 0.8, list = FALSE)

train_df <- papers_clean[train_rows, ]
test_df  <- papers_clean[-train_rows, ]

# Linear baseline
lm_fit <- lm(log_citations ~ year + n_authors + open_access + n_references,
             data = train_df)

# LASSO
X_train <- model.matrix(log_citations ~ year + n_authors + open_access + n_references - 1,
                        data = train_df)
y_train <- train_df[["log_citations"]]

cv_las  <- cv.glmnet(X_train, y_train, alpha = 1, nfolds = 10)
lasso_pred <- predict(cv_las, newx = model.matrix(log_citations ~ . - 1, test_df),
                      s = "lambda.min")

# Random forest
rf_fit <- randomForest(log_citations ~ year + n_authors + open_access + n_references,
                       data = train_df, ntree = 500)
rf_pred <- predict(rf_fit, newdata = test_df)
```

## 12.6 Evaluation and Reporting

```r
rmse <- function(actual, predicted) sqrt(mean((actual - predicted)^2))

tibble(
  Model   = c("Linear", "LASSO", "Random Forest"),
  RMSE    = c(
    rmse(test_df[["log_citations"]], predict(lm_fit,   test_df)),
    rmse(test_df[["log_citations"]], as.vector(lasso_pred)),
    rmse(test_df[["log_citations"]], rf_pred)
  )
)
```

The random forest achieves the lowest test RMSE, with open-access status and number of references emerging as the most important predictors (by Gini impurity reduction). The linear model's coefficient for `open_access` is positive and statistically significant (\( p < 0.001 \)), consistent with the hypothesis that open-access papers accrue more citations.

**Reporting summary:** In this case study, we demonstrated a complete EDA pipeline: RESTful data collection, ingestion and type coercion, missingness analysis, distributional visualisation, feature engineering (log-transform of skewed counts), model fitting and cross-validated selection, and quantitative evaluation. The written summary foregrounds the substantive finding — open-access status and reference count are the strongest predictors of near-term citation impact — before presenting model performance statistics.

---

*End of STAT 847 Course Notes.*
