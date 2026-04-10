---
title: "STAT 436: Introduction to the Analysis of Spatial Data in Health Research"
subjects: "STAT"
prof: "Samuel WK Wong"
---

## Sources and References
**Primary texts** — Waller & Gotway (2004) *Applied Spatial Statistics for Public Health Data*; Bivand, Pebesma & Gómez-Rubio (2013) *Applied Spatial Data Analysis with R* 2nd ed
**Supplementary texts** — Lawson (2018) *Bayesian Disease Mapping: From Foundations to Applications* 3rd ed; Cressie & Wikle (2011) *Statistics for Spatio-Temporal Data*; Le & Zidek (2006) *Statistical Analysis of Environmental Space-Time Processes*
**Online resources** — INLA project: https://www.r-inla.org; spatstat documentation; Roger Bivand's CRAN spatial task view; SaTScan software: https://www.satscan.org

---

# Chapter 1: Introduction to Spatial Epidemiology

## 1.1 What Is Spatial Epidemiology?

Spatial epidemiology is the description and analysis of geographic variation in disease risk with respect to demographic, environmental, behavioral, socioeconomic, genetic, and infectious risk factors. Its core premise is that **where** a person lives, works, and recreates shapes their health outcomes, and that spatial patterns in disease carry epidemiological signal.

The field draws on three parent disciplines: classical epidemiology (the study of disease determinants in populations), biostatistics (providing inferential machinery), and geographic information science (GIS — the tools for spatial data representation and manipulation). Applied well, spatial epidemiology can:

- Identify geographic clusters of disease that warrant further investigation.
- Quantify the association between an environmental exposure (e.g., air pollution, proximity to industrial sites) and a health outcome at the area level.
- Guide the allocation of health-care resources to high-need regions.
- Support surveillance systems that detect emerging outbreaks in near-real time.

## 1.2 Types of Spatial Data

Three canonical data types arise in spatial statistics, distinguished by the nature of the domain and the observations.

<div class="definition">
<strong>Geostatistical (continuous surface) data</strong>: observations \( Z(s_1), \ldots, Z(s_n) \) recorded at a <em>fixed but arbitrarily chosen</em> set of locations \( \{s_i\} \subset \mathbb{R}^2 \). The underlying process \( \{Z(s) : s \in \mathcal{D}\} \) is assumed to exist continuously over the domain \(\mathcal{D}\). Examples: blood-lead concentration measured at monitoring stations; radon levels in dwellings; annual mean PM\(_{2.5}\).
</div>

<div class="definition">
<strong>Areal (lattice) data</strong>: observations \( Y_1, \ldots, Y_n \) associated with a <em>fixed, exhaustive partition</em> of the study region into non-overlapping polygons (census tracts, counties, postal-code areas). Each \( Y_i \) is an aggregate (count, rate, or mean) over polygon \( i \). Examples: hospital discharge counts per district; age-standardized mortality rates per local authority.
</div>

<div class="definition">
<strong>Point process data</strong>: the <em>locations themselves</em> are the random objects. Each event (disease case, tree, earthquake epicentre) is a point in \(\mathbb{R}^2\), and the set of all events in the study region constitutes a realization of a spatial point process. The fundamental question is whether events are distributed randomly or exhibit clustering or regularity.
</div>

In health research, these types frequently appear together: individual case addresses (point process) are aggregated to census tracts (areal data), and environmental exposures are interpolated from monitoring networks (geostatistical data).

## 1.3 Health Outcomes and Exposures in Geographic Context

Typical health outcomes in spatial epidemiology include:

- **Disease counts** \( O_i \): the number of incident cases or deaths observed in area \( i \) over a defined time window.
- **Binary outcomes** at the individual level: disease status (case vs. control) geocoded to residential address.
- **Continuous health measures**: blood-pressure readings, lung-function scores, birth weight.

Exposures of interest range from point sources (factory emissions, landfills) to distributed fields (air quality surfaces, temperature grids) to socioeconomic indicators at the area level (deprivation indices, income quintiles).

A key challenge is the **spatial scale mismatch**: an exposure measured continuously must be linked to health counts aggregated over polygons, which introduces ecological bias (Section 7.2).

## 1.4 Standardized Mortality Ratio (SMR)

Raw disease counts are not comparable across areas of different size and age–sex composition. The **indirect standardization** approach removes demographic confounding by computing the number of deaths *expected* under a reference rate schedule.

**Procedure for indirect standardization:**

Let \( r_{jk} \) denote the reference (typically national) death rate for age–sex stratum \( k \) in cause-of-death category \( j \). For area \( i \) with \( n_{ik} \) person-years in stratum \( k \), the expected count is:

\[
E_i = \sum_k r_{jk} \cdot n_{ik}
\]

The SMR is then:

<div class="definition">
<strong>Standardized Mortality Ratio (SMR)</strong>:
\[ \text{SMR}_i = \frac{O_i}{E_i} \]
where \( O_i \) is the observed count and \( E_i \) is the expected count under the reference rates. An SMR \(> 1\) indicates excess mortality; an SMR \(< 1\) indicates a deficit.
</div>

**Worked example.** Suppose area \( i \) has two age strata:

| Stratum | Population \( n_{ik} \) | National rate \( r_k \) |
|---------|------------------------|------------------------|
| 0–64    | 10 000                 | 0.002                  |
| 65+     | 2 000                  | 0.025                  |

Expected deaths: \( E_i = 10000 \times 0.002 + 2000 \times 0.025 = 20 + 50 = 70 \).

If \( O_i = 84 \), then \( \text{SMR}_i = 84/70 = 1.20 \), indicating 20% excess mortality.

## 1.5 Instability of SMR for Small Areas

The SMR is the maximum likelihood estimate (MLE) of the relative risk \(\theta_i\) under the Poisson model \( O_i \sim \text{Poisson}(E_i \theta_i) \). When \( E_i \) is small (sparse rural areas, rare diseases), the SMR is highly variable: areas with \( E_i = 1 \) that happen to observe \( O_i = 3 \) yield \(\text{SMR} = 3.0\), but this estimate has enormous uncertainty.

This *small-area instability problem* motivates the smoothing and shrinkage estimators of Chapter 2.

## 1.6 Choropleth Mapping of Health Data

A choropleth map colours or shades polygons according to the value of a variable. Design choices strongly influence the perceived spatial pattern:

- **Classification scheme**: equal intervals, quantiles, natural breaks (Jenks), standard deviations. Quantile maps are robust to outliers but can obscure bimodality; equal-interval maps preserve the numeric scale but may over-represent extreme values.
- **Number of classes**: 5–7 is standard.
- **Colour palette**: sequential palettes (e.g., light-to-dark blue) for one-sided variables; diverging palettes (e.g., red–white–blue) for variables with a natural midpoint (e.g., SMR = 1).

## 1.7 Modifiable Areal Unit Problem (MAUP)

The MAUP refers to the sensitivity of statistical results to the choice of areal boundaries used to aggregate data. It has two components:

1. **Scale effect**: results change when the same data are aggregated to successively coarser resolution (e.g., census tracts → counties → states).
2. **Zoning effect**: even at a fixed scale, different configurations of the same number of zones yield different estimates.

MAUP is unavoidable with pre-existing administrative boundaries. Analysts should conduct sensitivity analyses across multiple aggregation schemes and be cautious about causal inference from any single areal specification.

## 1.8 Ecological Fallacy

The ecological fallacy (Robinson 1950) is the error of inferring individual-level associations from aggregate-level correlations. A correlation between area-level deprivation and area-level cancer rates does not establish that deprived individuals are more likely to develop cancer — the aggregate association may be produced by confounding, differential migration, or purely compositional effects.

Spatial regression (Chapter 4) and multilevel models can partially address this, but the fundamental challenge of cross-level inference remains (Chapter 7).

## 1.9 Coordinate Reference Systems

Every spatial dataset must declare a coordinate reference system (CRS) that maps real-world locations to mathematical coordinates.

- **Geographic CRS**: uses latitude and longitude on a reference ellipsoid. Common choices: WGS84 (EPSG:4326).
- **Projected CRS**: applies a mathematical projection to flatten the ellipsoid onto a 2D plane (Cartesian \( (x, y) \) in metres). Common choices: UTM zones, StatsCan Lambert (EPSG:3347).

In R, CRS information is stored in `sf` objects and can be inspected with `sf::st_crs()` and transformed with `sf::st_transform()`.

## 1.10 Spatial Analysis Workflow in R

A typical workflow uses the following packages:

```r
library(sf)          # Simple features for vector data
library(spdep)       # Spatial dependence: weights, Moran's I
library(spatstat)    # Point process analysis
library(INLA)        # Integrated Nested Laplace Approximation
library(tmap)        # Thematic mapping
library(dplyr)       # Data wrangling
```

**Typical workflow:**
1. Load polygon shapefile: `shp <- st_read("regions.shp")`
2. Join health data: `shp <- left_join(shp, health_data, by = "region_id")`
3. Compute SMR: `shp$SMR <- shp$observed / shp$expected`
4. Map: `tm_shape(shp) + tm_fill("SMR", style = "quantile")`
5. Build neighbour list: `nb <- poly2nb(shp); W <- nb2listw(nb)`
6. Test spatial autocorrelation: `moran.test(shp$SMR, W)`

---

# Chapter 2: Disease Mapping and Small Area Estimation

## 2.1 Poisson Model for Area Counts

The standard model for disease counts in area \( i \), \( i = 1, \ldots, n \), is:

\[
O_i \mid \theta_i \sim \text{Poisson}(E_i \theta_i), \quad \theta_i > 0
\]

where \( E_i \) is the expected count (computed by indirect standardization) and \(\theta_i\) is the unknown area-specific relative risk. The log-likelihood is:

\[
\ell(\boldsymbol{\theta}) = \sum_{i=1}^n \left[ O_i \log(E_i \theta_i) - E_i \theta_i - \log(O_i!) \right]
\]

The MLE of \(\theta_i\) is \(\hat\theta_i = O_i / E_i = \text{SMR}_i\), which is unbiased but highly variable when \(E_i\) is small.

## 2.2 Empirical Bayes Smoothing

### 2.2.1 Gamma–Poisson (Clayton–Kaldor) Model

Assume a gamma prior on each \(\theta_i\):

\[
\theta_i \sim \text{Gamma}(\alpha, \beta), \quad \mathbb{E}[\theta_i] = \alpha/\beta, \quad \text{Var}(\theta_i) = \alpha/\beta^2
\]

The marginal distribution of \(O_i\) is negative binomial. The posterior is:

\[
\theta_i \mid O_i \sim \text{Gamma}(\alpha + O_i,\ \beta + E_i)
\]

The posterior mean (the empirical Bayes estimate) is:

\[
\tilde\theta_i = \frac{\alpha + O_i}{\beta + E_i} = w_i \cdot \text{SMR}_i + (1 - w_i) \cdot \frac{\alpha}{\beta}
\]

where the **shrinkage weight** is:

\[
w_i = \frac{E_i}{\beta + E_i}
\]

This is a **weighted average** of the raw SMR and the global prior mean \(\alpha/\beta\). When \(E_i\) is small, \(w_i \approx 0\) and the estimate shrinks strongly toward the global mean. When \(E_i\) is large, \(w_i \approx 1\) and the estimate is close to the observed SMR.

**Worked example.** Suppose \(\hat\alpha = 1.5\), \(\hat\beta = 1.5\) (estimated from the data by matching moments), giving prior mean 1.0. For a small area with \(E_i = 1\) and \(O_i = 3\):

\[
w_i = \frac{1}{1.5 + 1} = 0.40, \quad \tilde\theta_i = 0.40 \times 3.0 + 0.60 \times 1.0 = 1.8
\]

The raw SMR of 3.0 is shrunk to 1.8 — a substantial reduction.

### 2.2.2 Normal–Normal Model

For log-relative risks \(\phi_i = \log\theta_i\), a normal prior can be used:

\[
\log(\text{SMR}_i) \approx \phi_i + \epsilon_i, \quad \epsilon_i \sim \mathcal{N}(0, \sigma_i^2)
\]
\[
\phi_i \sim \mathcal{N}(\mu, \tau^2)
\]

The posterior mean is a **Kalman-filter type** shrinkage estimator, with the shrinkage determined by the ratio \(\sigma_i^2 / (\sigma_i^2 + \tau^2)\).

## 2.3 Fully Bayesian Models

Empirical Bayes estimates hyperparameters \((\alpha, \beta)\) from the data and treats them as fixed; a fully Bayesian analysis puts hyperpriors on them, propagating all uncertainty into the posterior.

## 2.4 Besag–York–Mollié (BYM) Model

The BYM model (Besag, York & Mollié 1991) is the dominant approach in Bayesian disease mapping. It decomposes the log-relative risk into spatially structured and unstructured components:

\[
O_i \mid \theta_i \sim \text{Poisson}(E_i \theta_i)
\]
\[
\log \theta_i = \mu + u_i + v_i
\]

where:
- \(\mu\) is the global intercept (overall log-relative risk).
- \(u_i\) is the **spatially structured** random effect, capturing local spatial autocorrelation.
- \(v_i \sim \mathcal{N}(0, \sigma_v^2)\) is the **spatially unstructured** (heterogeneous) random effect, capturing area-specific overdispersion.

### 2.4.1 Intrinsic CAR Prior for the Spatial Effect

The spatial component \(\mathbf{u} = (u_1, \ldots, u_n)^\top\) is assigned an **intrinsic conditional autoregressive (ICAR)** prior. Let \(A\) be the binary adjacency matrix, with \(A_{ij} = 1\) if areas \(i\) and \(j\) share a boundary. Let \(m_i = \sum_j A_{ij}\) be the number of neighbours of area \(i\).

The ICAR prior specifies the *conditional* distribution of each \(u_i\) given all others:

\[
u_i \mid \mathbf{u}_{-i} \sim \mathcal{N}\!\left(\frac{1}{m_i}\sum_{j \sim i} u_j,\ \frac{\sigma_u^2}{m_i}\right)
\]

The joint density is proportional to:

\[
p(\mathbf{u} \mid \sigma_u^2) \propto \exp\!\left(-\frac{1}{2\sigma_u^2} \sum_{i \sim j} (u_i - u_j)^2\right)
\]

This is an improper density (the precision matrix \(\mathbf{Q} = \sigma_u^{-2}(\mathbf{D} - \mathbf{A})\), where \(\mathbf{D} = \text{diag}(m_1, \ldots, m_n)\), is singular) — it only defines contrasts between neighbours, not the overall level, which is why \(\mu\) is needed separately and a sum-to-zero constraint \(\sum_i u_i = 0\) is typically imposed for identifiability.

### 2.4.2 BYM2 Reparameterization

The original BYM model has an identifiability issue: \(u_i\) and \(v_i\) are confounded. The **BYM2** parameterization (Riebler et al. 2016) uses:

\[
\log \theta_i = \mu + \frac{1}{\sqrt{\tau}} \left(\sqrt{\phi}\, \tilde u_i + \sqrt{1 - \phi}\, v_i\right)
\]

where \(\tilde u_i\) is the scaled ICAR effect, \(\tau\) is a precision hyperparameter, and \(\phi \in [0,1]\) is a mixing parameter controlling the proportion of spatial to total variation.

## 2.5 Inference via INLA

Markov chain Monte Carlo (MCMC) is computationally expensive for BYM models. **Integrated Nested Laplace Approximation (INLA)** provides fast, accurate approximate Bayesian inference for latent Gaussian models.

The key idea is that the posterior marginals can be approximated via nested Laplace approximations without sampling:

\[
\tilde p(\theta_i \mid \mathbf{y}) = \int \tilde p(\theta_i \mid \boldsymbol{\psi}, \mathbf{y})\, \tilde p(\boldsymbol{\psi} \mid \mathbf{y})\, d\boldsymbol{\psi}
\]

where \(\boldsymbol{\psi}\) are the hyperparameters and \(\tilde p\) denotes Laplace approximations.

```r
library(INLA)
formula <- O ~ 1 + f(area_id, model = "bym2", graph = graph_file)
result  <- inla(formula, family = "poisson", data = dat,
                E = dat$expected,
                control.compute = list(dic = TRUE, waic = TRUE))
```

## 2.6 Exceedance Probabilities

Rather than point estimates, Bayesian analysis provides the full posterior distribution of \(\theta_i\). A useful summary for public health is the **exceedance probability**:

\[
P(\theta_i > c \mid \mathbf{y})
\]

for a threshold \(c\) (commonly \(c = 1\), indicating excess risk, or \(c = 1.5\) for a more extreme threshold). INLA returns these directly via `inla.pmarginal()`.

## 2.7 Mapping Posterior Means vs. MLE

Posterior mean maps show the shrinkage-smoothed relative risks. Compared to SMR maps, they:
- Have smaller variance in sparse areas.
- Exhibit spatial smoothness if the ICAR component is present.
- Are less likely to be dominated by chance fluctuations.

A **probability map** (showing \(P(\theta_i > 1 \mid \mathbf{y})\)) conveys statistical evidence for elevated risk and is often more informative for decision-makers than a point-estimate map.

---

# Chapter 3: Spatial Autocorrelation

## 3.1 Spatial Weights Matrices

Spatial autocorrelation analysis requires specifying a **neighbourhood structure** via a spatial weights matrix \(\mathbf{W} = \{w_{ij}\}\).

### 3.1.1 Contiguity-Based Weights

- **Rook contiguity**: \(w_{ij} = 1\) if polygons \(i\) and \(j\) share a boundary edge (not just a corner point).
- **Queen contiguity**: \(w_{ij} = 1\) if polygons share an edge *or* a corner.

In R:
```r
nb_rook  <- poly2nb(shp, queen = FALSE)
nb_queen <- poly2nb(shp, queen = TRUE)
```

### 3.1.2 Distance-Based and k-Nearest Neighbours

- **Distance band**: \(w_{ij} = 1\) if \(d(i, j) < d_{\max}\), else 0. Sensitive to choice of \(d_{\max}\); may produce islands (areas with no neighbours) if \(d_{\max}\) is too small.
- **k-nearest neighbours (kNN)**: each area has exactly \(k\) neighbours (by centroid distance), guaranteeing a connected graph.

```r
nb_knn <- knearneigh(coords, k = 5) |> knn2nb()
```

### 3.1.3 Row Standardization

Row-standardized weights: \(w_{ij}^* = w_{ij} / \sum_j w_{ij}\). This ensures that the spatially lagged value \(\bar y_i = \sum_j w_{ij}^* y_j\) is a weighted average of neighbours, facilitating interpretation.

## 3.2 Moran's I Statistic

<div class="definition">
<strong>Moran's I</strong> (Moran 1950) is the most widely used global measure of spatial autocorrelation. For a variable \( y_i \) with mean \( \bar y \):

\[
I = \frac{n}{\sum_i \sum_j w_{ij}} \cdot \frac{\sum_i \sum_j w_{ij}(y_i - \bar y)(y_j - \bar y)}{\sum_i (y_i - \bar y)^2}
\]
</div>

The statistic ranges roughly from −1 (perfect negative autocorrelation) through 0 (no autocorrelation) to +1 (perfect positive autocorrelation), though the theoretical bounds depend on the weight matrix.

### 3.2.1 Expected Value and Variance Under Randomization

Under the null hypothesis of spatial randomness (no autocorrelation), the exact moments are:

\[
\mathbb{E}[I] = \frac{-1}{n - 1}
\]

The variance under the randomization assumption (assuming only that \(\mathbf{y}\) is a random permutation of the observed values) is:

\[
\text{Var}(I) = \frac{n^2 S_1 - n S_2 + 3 S_0^2}{S_0^2(n^2 - 1)} - \mathbb{E}[I]^2
\]

where \(S_0 = \sum_{ij} w_{ij}\), \(S_1 = \frac{1}{2}\sum_{ij}(w_{ij} + w_{ji})^2\), \(S_2 = \sum_i(\sum_j w_{ij} + \sum_j w_{ji})^2\).

A standardized test statistic is:

\[
z = \frac{I - \mathbb{E}[I]}{\sqrt{\text{Var}(I)}} \xrightarrow{d} \mathcal{N}(0, 1)
\]

### 3.2.2 Worked Example: Moran's I on a 3×3 Grid

Consider a 3×3 grid of areas with values arranged as:

```
[1, 2, 3]
[4, 5, 6]
[7, 8, 9]
```

Label areas row-by-row: \( y_1 = 1, y_2 = 2, \ldots, y_9 = 9 \). Mean \(\bar y = 5\).

Under **rook contiguity**, the neighbours are: 1↔{2,4}, 2↔{1,3,5}, 3↔{2,6}, 4↔{1,5,7}, 5↔{2,4,6,8}, 6↔{3,5,9}, 7↔{4,8}, 8↔{7,9,5}, 9↔{6,8}.

Total weight sum \(S_0 = 24\). The numerator cross-product \(\sum_{i \sim j} (y_i - 5)(y_j - 5)\):

The deviation vector is \((-4,-3,-2,-1,0,1,2,3,4)\).

Adjacent pairs and their cross-products:
(1,2): \((-4)(-3)=12\); (2,3): \((-3)(-2)=6\); (4,5): \((-1)(0)=0\); (5,6): \((0)(1)=0\); (7,8): \((3)(2) \ldots\)

Actually, the values are **monotonically increasing** from left-to-right and top-to-bottom, a pattern of strong positive autocorrelation. Computing fully:

Cross-products for all 12 undirected adjacent pairs (horizontal + vertical rook edges):
Horizontal: (1,2)=12, (2,3)=6, (4,5)=0, (5,6)=0, (7,8)=6, (8,9)=12. Sum = 36.
Vertical: (1,4)=4, (2,5)=0, (3,6)=0, (4,7)=-2, (5,8)=0, (6,9)=0 ... let me recompute with deviations \( d_i = y_i - 5 \):
\( d = (-4,-3,-2,-1,0,1,2,3,4) \).

Vertical pairs with adjacency: (1,4)=\(d_1 d_4=(-4)(-1)=4\); (2,5)=\((-3)(0)=0\); (3,6)=\((-2)(1)=-2\); (4,7)=\((-1)(2)=-2\); (5,8)=\((0)(3)=0\); (6,9)=\((1)(4)=4\). Vertical sum = 4.

Total for non-row-standardized binary weights: numerator \(= 2 \times (36 + 4) = 80\) (factor 2 for directed weights).

Denominator: \(\sum d_i^2 = 16+9+4+1+0+1+4+9+16 = 60\).

\[
I = \frac{9}{24} \times \frac{80}{60} = 0.375 \times 1.333 = 0.500
\]

This positive value confirms the strong spatial gradient (large values cluster together).

### 3.2.3 Monte Carlo Test

When normality cannot be assumed, a Monte Carlo permutation test is used: randomly permute \(\mathbf{y}\) many times, compute \(I\) each time, and assess where the observed \(I\) falls in the permutation distribution.

```r
W   <- nb2listw(nb_queen)
res <- moran.mc(shp$SMR, listw = W, nsim = 999)
plot(res)  # histogram of permutation distribution
```

### 3.2.4 Spatial Correlogram

A **spatial correlogram** plots Moran's I as a function of distance lag \(d\), analogous to a temporal autocorrelation function. It reveals the range of spatial dependence.

## 3.3 Geary's C

<div class="definition">
<strong>Geary's C</strong> focuses on squared differences between neighbouring values:
\[
C = \frac{(n-1)\sum_i\sum_j w_{ij}(y_i - y_j)^2}{2 S_0 \sum_i (y_i - \bar y)^2}
\]
Under randomization, \(\mathbb{E}[C] = 1\). Values \(C < 1\) indicate positive autocorrelation; \(C > 1\) indicates negative autocorrelation. Geary's C is more sensitive to <em>local</em> spatial autocorrelation than Moran's I.
</div>

## 3.4 Local Indicators of Spatial Association (LISA)

Global statistics mask local heterogeneity. **Local Moran's \(I_i\)** (Anselin 1995) decomposes the global \(I\) into area-specific contributions:

\[
I_i = \frac{(y_i - \bar y)}{m_2} \sum_j w_{ij}(y_j - \bar y), \quad m_2 = \frac{\sum_i (y_i - \bar y)^2}{n}
\]

Note that \(I = \sum_i I_i / S_0\) (approximately).

**Moran scatter plot**: plots \(z_i = (y_i - \bar y)/s\) on the x-axis against the spatially lagged \(W\mathbf{z}_i\) on the y-axis. The four quadrants correspond to:
- **HH** (high-high): a high-value area surrounded by high-value neighbours → positive local autocorrelation (cluster).
- **LL** (low-low): a low-value area surrounded by low-value neighbours → positive local autocorrelation.
- **HL** (high-low): a high-value area surrounded by low-value neighbours → negative local autocorrelation (spatial outlier).
- **LH** (low-high): a low-value area surrounded by high-value neighbours.

```r
lm_res <- localmoran(shp$SMR, W)
shp$local_I <- lm_res[, "Ii"]
shp$quadrant <- NA
# Classify into HH, LL, HL, LH based on sign of z_i and lag_z_i
```

## 3.5 Ripley's K Function

For point process data, Ripley's K function measures the expected number of additional events within distance \(r\) of an arbitrary event, relative to intensity:

\[
K(r) = \frac{1}{\lambda} \mathbb{E}[\text{number of extra events within distance } r \text{ of a typical event}]
\]

Under a homogeneous Poisson process (complete spatial randomness, CSR): \( K(r) = \pi r^2 \).

The **L function** is a variance-stabilized version: \( L(r) = \sqrt{K(r)/\pi} \).

Under CSR: \(L(r) = r\), so \(L(r) - r = 0\). Positive values indicate clustering; negative values indicate regularity.

**Monte Carlo envelopes**: simulate many CSR patterns in the same window, compute \(L(r)\) for each, and construct pointwise upper/lower envelopes. If the observed \(L(r)\) lies outside these envelopes, CSR is rejected.

```r
library(spatstat)
pp <- ppp(x = cases$lon, y = cases$lat, window = study_window)
K  <- Kest(pp)
L  <- Lest(pp)
plot(L, main = "L function with CSR envelope")
env <- envelope(pp, Lest, nsim = 199)
plot(env)
```

---

# Chapter 4: Area Data and Spatial Regression

## 4.1 Why Standard Regression Fails for Spatial Data

Ordinary least squares (OLS) regression assumes independent errors: \( \mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon} \), \( \boldsymbol{\varepsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2 \mathbf{I}) \). When observations are spatial, residuals typically exhibit positive autocorrelation (nearby areas share unmeasured confounders). This violates the independence assumption and causes:

- Underestimated standard errors (inflated Type I error rates).
- Inefficient coefficient estimates.
- Biased inference if spatial autocorrelation is itself associated with predictors.

**Residual Moran test:**
```r
ols_fit   <- lm(rate ~ deprivation + age_pct + smoking_pct, data = shp)
lm.morantest(ols_fit, W)  # Tests for spatial autocorrelation in residuals
```

## 4.2 Spatial Lag Model

The **spatial lag model** (SLM, also called SAR — spatial autoregressive model) includes the spatially lagged dependent variable as a predictor:

\[
\mathbf{y} = \rho \mathbf{W}\mathbf{y} + \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}, \quad \boldsymbol{\varepsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2\mathbf{I})
\]

The reduced form is:

\[
\mathbf{y} = (\mathbf{I} - \rho\mathbf{W})^{-1}\mathbf{X}\boldsymbol{\beta} + (\mathbf{I} - \rho\mathbf{W})^{-1}\boldsymbol{\varepsilon}
\]

**Interpretation**: \(\rho\) is the spatial autocorrelation parameter. If \(\rho > 0\), high values of \(y\) in neighbouring areas raise \(y_i\) — a spillover effect. Note that \(\mathbf{W}\mathbf{y}\) is **endogenous** (it depends on \(y_i\)), so OLS is inconsistent. Maximum likelihood estimation (exploiting the Jacobian \(|\mathbf{I} - \rho\mathbf{W}|\)) or instrumental variables (IV, using \(\mathbf{W}\mathbf{X}\) as instruments) are used.

**Interpretation of coefficients**: In the SLM, the marginal effect of predictor \(x_k\) on \(y_i\) is not simply \(\beta_k\) because of the spatial feedback loop. The total impact (direct + indirect spillovers) is given by the \((i,i)\) element and row sums of \((\mathbf{I} - \rho\mathbf{W})^{-1}\beta_k\).

```r
library(spatialreg)
slm_fit <- lagsarlm(rate ~ deprivation + age_pct, data = shp, listw = W)
summary(slm_fit)
impacts(slm_fit, listw = W)  # Direct, indirect, total effects
```

## 4.3 Spatial Error Model

The **spatial error model** (SEM) places autocorrelation in the error term:

\[
\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{u}, \quad \mathbf{u} = \lambda\mathbf{W}\mathbf{u} + \boldsymbol{\varepsilon}
\]

Reduced form: \(\mathbf{u} = (\mathbf{I} - \lambda\mathbf{W})^{-1}\boldsymbol{\varepsilon}\), so:

\[
\text{Cov}(\mathbf{u}) = \sigma^2 \left[(\mathbf{I} - \lambda\mathbf{W})^\top(\mathbf{I} - \lambda\mathbf{W})\right]^{-1}
\]

**Interpretation**: \(\lambda\) captures spatial autocorrelation in omitted variables. The \(\boldsymbol{\beta}\) coefficients retain their standard OLS interpretation (no spillover effect). GLS estimation is used.

The SEM is appropriate when spatial autocorrelation is a nuisance (not substantively interesting), whereas the SLM is used when a spatial diffusion process is theoretically expected.

```r
sem_fit <- errorsarlm(rate ~ deprivation + age_pct, data = shp, listw = W)
```

## 4.4 Spatial Durbin Model

The **spatial Durbin model** (SDM) includes both a spatial lag of \(\mathbf{y}\) and spatial lags of the predictors:

\[
\mathbf{y} = \rho\mathbf{W}\mathbf{y} + \mathbf{X}\boldsymbol{\beta} + \mathbf{W}\mathbf{X}\boldsymbol{\gamma} + \boldsymbol{\varepsilon}
\]

It nests the SLM (\(\boldsymbol{\gamma} = \mathbf{0}\)) and, under the restriction \(\boldsymbol{\gamma} = -\rho\boldsymbol{\beta}\), the SEM.

## 4.5 Lagrange Multiplier Tests for Spatial Dependence

Anselin's **Lagrange Multiplier (LM) tests** compare the SLM and SEM after OLS fitting, without requiring estimation of either spatial model:

- `LM-lag`: tests \(H_0: \rho = 0\) in the SLM.
- `LM-error`: tests \(H_0: \lambda = 0\) in the SEM.
- **Robust** versions (RLM-lag, RLM-error) adjust for local misspecification of the other model.

Decision rule: if both LM-lag and LM-error are significant, use the robust versions to determine which model is better supported.

```r
lm.LMtests(ols_fit, W, test = c("LMlag", "LMerr", "RLMlag", "RLMerr"))
```

## 4.6 Geographically Weighted Regression

**Geographically Weighted Regression (GWR)** relaxes the stationarity assumption by allowing coefficients to vary spatially:

\[
y_i = \beta_0(s_i) + \sum_k \beta_k(s_i) x_{ik} + \varepsilon_i
\]

Coefficients at location \(s_i\) are estimated by locally weighted least squares, using a kernel function \(K(d_{ij}/h)\) that downweights observations farther from \(s_i\). The bandwidth \(h\) is selected by cross-validation.

## 4.7 Areal Interpolation

**Areal interpolation** transfers data from source zones (e.g., census tracts) to target zones (e.g., health authority boundaries) that do not align. The simplest method is **areal weighting**: assign values proportional to the area of overlap between source and target zones. More sophisticated methods use ancillary data (land-use, population grids) for **dasymetric mapping**.

---

# Chapter 5: Point Process Models

## 5.1 Definitions and Notation

<div class="definition">
A <strong>spatial point process</strong> \( \mathbf{X} \) is a random, countable set of points in a study region \( \mathcal{W} \subset \mathbb{R}^2 \). A realization \(\mathbf{x} = \{x_1, \ldots, x_n\} \subset \mathcal{W}\) is a finite set of locations; \(n\) itself is random.
</div>

<div class="definition">
The <strong>intensity function</strong> \( \lambda(s) \) is the expected number of events per unit area at location \( s \):
\[
\lambda(s) = \lim_{|ds| \to 0} \frac{\mathbb{E}[N(ds)]}{|ds|}
\]
where \( N(B) \) is the count of events in region \( B \). If \( \lambda(s) = \lambda \) (constant), the process is <em>homogeneous</em>; otherwise it is <em>inhomogeneous</em>.
</div>

## 5.2 Homogeneous Poisson Process (Complete Spatial Randomness)

The **homogeneous Poisson process** (HPP) with intensity \(\lambda > 0\) is the baseline model of **complete spatial randomness (CSR)**. It has two defining properties:

1. **Independence**: \(N(A)\) and \(N(B)\) are independent for disjoint \(A, B \subset \mathcal{W}\).
2. **Poisson counts**: \(N(B) \sim \text{Poisson}(\lambda |B|)\) for any bounded region \(B\), where \(|B|\) is the area of \(B\).

Under CSR, conditional on \(N(\mathcal{W}) = n\), the event locations are iid uniform over \(\mathcal{W}\).

## 5.3 Inhomogeneous Poisson Process

If intensity \(\lambda(s)\) varies with location (due to environmental gradients or population heterogeneity), the process is an **inhomogeneous Poisson process** (IPPP). The expected number of events in region \(B\) is:

\[
\mathbb{E}[N(B)] = \int_B \lambda(s)\, ds
\]

Counts in disjoint regions remain independent. In health applications, \(\lambda(s)\) is often modelled as a function of covariates: \(\log\lambda(s) = \mathbf{x}(s)^\top \boldsymbol{\beta}\).

## 5.4 Intensity Estimation via Kernel Smoothing

Given event locations \(\{s_1, \ldots, s_n\}\), the kernel intensity estimator is:

\[
\hat\lambda(s) = \sum_{i=1}^n \frac{1}{h^2} K\!\left(\frac{s - s_i}{h}\right) \cdot c(s)^{-1}
\]

where \(K\) is a bivariate kernel (commonly Gaussian or Epanechnikov), \(h\) is the bandwidth (smoothing parameter), and \(c(s)^{-1}\) is an edge-correction factor accounting for events near the boundary.

**Bandwidth selection**: the critical tuning choice.
- *Fixed bandwidth*: single \(h\) everywhere. Simple but inappropriate if \(\lambda(s)\) varies greatly.
- *Adaptive bandwidth*: smaller \(h\) in dense regions, larger in sparse regions. Implemented in `spatstat::adaptive.density()`.
- *Cross-validation*: minimize the leave-one-out log-likelihood or MISE.

```r
pp <- ppp(x, y, window = owin(c(0,1), c(0,1)))
lambda_hat <- density(pp, sigma = bw.diggle(pp))  # Diggle (1985) bandwidth
plot(lambda_hat)
```

## 5.5 Testing for Complete Spatial Randomness

### 5.5.1 Quadrat Count Test

Partition \(\mathcal{W}\) into \(m\) equal-area quadrats, count events in each quadrat \(n_1, \ldots, n_m\). Under CSR, \(n_j \sim \text{Poisson}(\lambda |\mathcal{W}|/m)\). The chi-squared test statistic is:

\[
\chi^2 = \frac{\sum_{j=1}^m (n_j - \bar n)^2}{\bar n} \sim \chi^2_{m-1} \quad \text{under CSR}
\]

Limitation: sensitive to quadrat size choice and only detects certain departure types.

### 5.5.2 Clark–Evans Test

Based on the mean nearest-neighbour distance \(\bar d\):

\[
R = \frac{\bar d}{\mathbb{E}[\bar d]_{\text{CSR}}} = \frac{\bar d}{0.5/\sqrt{\hat\lambda}}
\]

\(R < 1\) suggests clustering; \(R > 1\) suggests regularity.

## 5.6 Ripley's K and L Functions (Revisited)

The **second-order intensity** approach (Section 3.5) via the K function is more powerful than quadrat counts. Key formulas:

**Estimator of K (Ripley 1976):**
\[
\hat K(r) = \frac{|\mathcal{W}|}{n(n-1)} \sum_{i \neq j} \mathbf{1}(d_{ij} \leq r) \cdot e_{ij}^{-1}
\]

where \(e_{ij}\) is an edge-correction weight (the proportion of the circle of radius \(d_{ij}\) centred at \(s_i\) that lies within \(\mathcal{W}\)).

**L function**: \(L(r) = \sqrt{\hat K(r)/\pi} - r\). A horizontal line at 0 corresponds to CSR.

```r
K <- Kest(pp, correction = "Ripley")
L <- Lest(pp, correction = "Ripley")
env_L <- envelope(pp, Lest, nsim = 199, correction = "Ripley")
plot(env_L, . - r ~ r, shade = c("hi", "lo"), main = "L-r vs r")
```

## 5.7 Cluster Process Models

### 5.7.1 Thomas (Matérn Cluster) Process

A two-stage process:
1. Parent events form a homogeneous Poisson process with intensity \(\kappa\).
2. Each parent independently generates a Poisson\((\mu)\) number of offspring, scattered isotropically around the parent with Gaussian displacement (variance \(\sigma^2\)).

The intensity is \(\lambda = \kappa\mu\) and the pair correlation function is:

\[
g(r) = 1 + \frac{1}{4\pi\kappa\sigma^2}\exp\!\left(-\frac{r^2}{4\sigma^2}\right)
\]

Parameters \((\kappa, \mu, \sigma)\) can be estimated by minimum contrast to the empirical K function.

### 5.7.2 Log-Gaussian Cox Process (LGCP)

The LGCP is a doubly stochastic process where \(\lambda(s) = \exp(Y(s))\) and \(Y(\cdot)\) is a Gaussian random field:

\[
Y(s) \sim \mathcal{GP}(\mu, C(\cdot, \cdot))
\]

This produces flexible, overdispersed point patterns. Inference is via MCMC or INLA with an approximating SPDE mesh.

```r
# LGCP via INLA (R-INLA + inlabru)
library(inlabru)
mesh  <- inla.mesh.2d(loc = coords, max.edge = c(0.05, 0.1))
spde  <- inla.spde2.matern(mesh)
fit   <- lgcp(~ Intercept + covariate, data = pp_sf, samplers = bnd, domain = list(geometry = mesh))
```

## 5.8 Case-Control Analysis: Diggle–Chetwynd Test

In health applications, cases (diseased individuals) and controls (healthy individuals or population at risk) are both geocoded. The test of clustering **of cases relative to controls** proceeds by:

1. Estimate the intensity ratio \(\rho(s) = \lambda_{\text{case}}(s) / \lambda_{\text{control}}(s)\) using kernel smoothing.
2. Test whether \(\rho(s)\) is spatially constant (Diggle & Chetwynd 1991).

The test statistic compares the K function of cases to that of controls:

\[
D(r) = K_{\text{cases}}(r) - K_{\text{controls}}(r)
\]

Under the null hypothesis that cases are a random sample of all subjects, \(\mathbb{E}[D(r)] = 0\).

```r
# In spatstat, using Kcross for bivariate marked point process
pp_marked <- ppp(x, y, marks = factor(c(rep("case", nc), rep("ctrl", nk))), window = wnd)
Ktest <- Kcross(pp_marked, "case", "ctrl")
env   <- envelope(pp_marked, Kcross, i = "case", j = "ctrl", nsim = 199)
```

---

# Chapter 6: Disease Cluster Detection

## 6.1 Types of Cluster Analysis

In spatial epidemiology, "cluster analysis" refers to **statistical inference** about disease clustering, not to algorithmic data clustering (k-means, etc.). Distinct problems:

1. **Is there general clustering?** (Global test for departure from spatial randomness.) No specific location hypothesized.
2. **Is there a cluster at a specified location?** (Focused test, pre-specified putative source such as a factory.)
3. **Where is a cluster?** (Scan statistic, local test with multiple-testing correction.)

## 6.2 Global Tests for Clustering

### 6.2.1 Moran's I (Adapted for Rate Data)

For disease rates \(y_i = O_i/E_i\), Moran's I tests whether rates in neighbouring areas are more similar than expected under spatial independence. However, heterogeneous \(E_i\) invalidates the standard variance formula; a simulation-based approach (permuting observed counts among areas with the same \(E_i\)) is preferred.

### 6.2.2 Potthoff–Whittinghill Test

Tests for extra-Poisson variation in area counts:

\[
T_{\text{PW}} = \sum_i \frac{O_i(O_i - 1)}{E_i}
\]

Under the Poisson model (no clustering), \(\mathbb{E}[T_{\text{PW}}] = \sum_i E_i\). A large \(T_{\text{PW}}\) indicates overdispersion, which may reflect clustering.

## 6.3 Focused Tests

### 6.3.1 Stone's Test

Stone (1988) tests for a monotone decrease in risk with distance from a putative source. Let \(d_{i1} \leq d_{i2} \leq \cdots\) be the ordering of areas by distance from the source. Under the null, the maximum likelihood ratio statistic is:

\[
T_{\text{Stone}} = \max_{k=1,\ldots,n} \frac{\sum_{i=1}^k O_i}{\sum_{i=1}^k E_i}
\]

p-values are obtained by Monte Carlo simulation.

### 6.3.2 Lawson–Waller Score Test

Uses a score statistic derived from the Poisson model with log-link, testing whether risk is a decreasing function of distance from the source:

\[
S = \sum_i O_i f(d_i), \quad f(d) = -\log d \text{ (or other decreasing function)}
\]

Under \(H_0\): \(S\) has a normal distribution with known mean and variance.

## 6.4 Kulldorff's Spatial Scan Statistic

The **spatial scan statistic** (Kulldorff 1997; implemented in SaTScan) is the dominant method for cluster detection in public health.

### 6.4.1 Circular Window Scan

A circular window \(Z\) is moved over the study region, with radius varying from 0 to at most 50% of the total population. For each candidate window, a likelihood ratio test compares:

- **Inside** the window: observed counts \(c_Z\), expected counts \(\mu_Z\) under the null.
- **Outside** the window: observed \(C - c_Z\), expected \(\mu - \mu_Z\).

Under the **Poisson model**, the likelihood ratio statistic is:

\[
\text{LR}(Z) = \left(\frac{c_Z}{\mu_Z}\right)^{c_Z} \left(\frac{C - c_Z}{\mu - \mu_Z}\right)^{C - c_Z} \mathbf{1}\!\left(\frac{c_Z}{\mu_Z} > \frac{C - c_Z}{\mu - \mu_Z}\right)
\]

where \(C\) is the total count and \(\mu\) is the total expected count. The indicator ensures we only flag windows with elevated risk inside.

**Worked example.** Suppose total deaths \(C = 100\), total expected \(\mu = 100\). A candidate window contains \(c_Z = 20\) observed and \(\mu_Z = 10\) expected.

Inside RR = 20/10 = 2.0; Outside RR = 80/90 = 0.89.

\[
\text{LR}(Z) = \left(\frac{20}{10}\right)^{20}\!\left(\frac{80}{90}\right)^{80} = 2^{20} \times 0.889^{80}
\]

\(\log \text{LR}(Z) = 20\log 2 + 80\log(0.889) = 13.86 + 80(-0.1178) = 13.86 - 9.42 = 4.44\)

\(\text{LR}(Z) = e^{4.44} \approx 84.8\)

### 6.4.2 p-value via Monte Carlo

The maximum LR over all candidate windows is the test statistic:

\[
\Lambda = \max_Z \text{LR}(Z)
\]

p-value: simulate \(B = 999\) datasets from the null distribution (Poisson with expected counts \(E_i\)), compute \(\Lambda_b\) for each, and:

\[
p = \frac{\#\{b : \Lambda_b \geq \Lambda_{\text{obs}}\} + 1}{B + 1}
\]

### 6.4.3 Elliptic and Space-Time Scan Statistics

The **elliptic scan** (Kulldorff et al. 2006) allows non-circular clusters by using elliptic windows with varying shapes and orientations, at the cost of increased multiple-testing burden.

The **space-time scan statistic** extends the window to a cylinder in space-time, simultaneously scanning for geographic clusters that are temporally elevated. Useful for outbreak detection.

## 6.5 Multiple Testing in Cluster Detection

The scan statistic simultaneously tests thousands of candidate windows, creating a severe multiple-testing problem. The Monte Carlo approach (Section 6.4.2) correctly controls the **familywise error rate (FWER)** for the most likely cluster. For secondary clusters, Kulldorff recommends reporting those clusters whose centres do not overlap with the primary cluster, with p-values from the same permutation distribution.

## 6.6 Limitations and Misinterpretations

1. **Cluster detection ≠ cause identification**: finding a geographic cluster does not establish its etiology. Post-hoc hypotheses generated by cluster detection require independent validation.

2. **Multiple testing**: running many scan statistics (different diseases, time periods, subgroups) inflates false positives unless corrections are applied.

3. **Cluster shape assumption**: the circular (or elliptic) scan may miss irregularly shaped clusters.

4. **Population heterogeneity**: if expected counts are poorly estimated (wrong reference rates, unaccounted-for confounders), the scan statistic can flag clusters that are artifacts of covariate imbalance.

5. **Ecological fallacy**: area-level clusters may not correspond to individual-level clustering; mobile populations and residential mobility complicate the interpretation.

---

# Chapter 7: Ecological Studies and Spatial Confounding

## 7.1 Ecological Study Designs

An **ecological study** uses populations (areas, time periods, groups) as the unit of analysis rather than individuals. It is the natural design for spatial epidemiology, where individual-level data are often unavailable.

**Types of ecological studies:**
- *Purely spatial*: compare rates across areas at a single time point (e.g., county-level cancer mortality versus county-level smoking prevalence).
- *Purely temporal*: compare rates across time for a single area.
- *Space-time*: compare rates across both areas and time periods.

**Strengths**: large sample sizes, inexpensive, can estimate exposure for rare outcomes; suitable for generating hypotheses.

**Weaknesses**: ecological bias, within-area exposure heterogeneity, limited confounder control.

## 7.2 Ecological Bias

<div class="definition">
<strong>Ecological bias</strong> (also called cross-level bias or aggregation bias) is the difference between the ecological (aggregate) association and the individual-level association it purports to estimate. It arises because the relationship between aggregate exposure and aggregate outcome is not the same as the relationship between individual exposure and individual outcome, in general.
</div>

**Formal framework** (Wakefield 2003): Let \(Y_{ij}\) and \(X_{ij}\) denote the outcome and exposure for individual \(j\) in area \(i\). The individual-level log-relative risk is \(\beta_{\text{ind}}\). The ecological regression of area means \(\bar Y_i\) on \(\bar X_i\) estimates:

\[
\beta_{\text{ecol}} = \beta_{\text{ind}} + \frac{\text{Cov}_i(\text{within-area variance of } X, \text{modifier})}{\text{Var}_i(\bar X_i)}
\]

Ecological bias can be **positive**, **negative**, or zero depending on within-area variability and effect modification. It cannot be eliminated by using more spatial units.

## 7.3 Spatial Confounding

**Spatial confounding** occurs when the exposure of interest is spatially correlated with an unmeasured confounder. Since spatially correlated covariates tend to be collinear with each other (and with spatial random effects in the model), including a spatial random effect can induce collinearity with the predictor of interest.

**Example**: consider a model for lung cancer rates regressing on air pollution \(x_i\) with a BYM spatial random effect:

\[
\log\theta_i = \mu + \beta x_i + u_i + v_i
\]

If smoking prevalence (a strong confounder) is spatially correlated with \(x_i\), and if \(u_i\) can absorb the smoking signal, then \(\hat\beta\) may be attenuated or biased.

## 7.4 Restricted Spatial Regression

**Restricted spatial regression** (Reich et al. 2006; Hodges & Reich 2010) projects the spatial random effect orthogonal to the covariate space before fitting, preventing the spatial effect from absorbing covariate signal:

\[
\tilde{\mathbf{u}} = (\mathbf{I} - \mathbf{H})\mathbf{u}, \quad \mathbf{H} = \mathbf{X}(\mathbf{X}^\top\mathbf{X})^{-1}\mathbf{X}^\top
\]

where \(\mathbf{H}\) is the hat matrix. The restricted model uses \(\tilde{\mathbf{u}}\) instead of \(\mathbf{u}\), so that the spatial component cannot influence the coefficient estimates.

## 7.5 The Spatial+ Approach

The **Spatial+** method (Dupont, Wood & Augustin 2022) takes a two-step approach to spatial confounding:

1. Regress the exposure \(\mathbf{x}\) on a spatial smooth (e.g., a thin-plate spline or ICAR effect), obtaining residuals \(\tilde{\mathbf{x}} = \mathbf{x} - \hat{\mathbf{x}}_{\text{spatial}}\).
2. Fit the outcome model using \(\tilde{\mathbf{x}}\) in place of \(\mathbf{x}\).

This effectively controls for spatially varying confounders by removing the spatial component of the exposure before estimating its health effect.

## 7.6 Case Studies

### 7.6.1 Air Pollution and Respiratory Health

**Study**: English et al. (1999) examined the association between traffic-related air pollution and childhood respiratory illness in California, using residential proximity to major roadways as the exposure proxy.

**Spatial analysis elements**:
- Geocoded residential addresses of children.
- Distance to nearest highway as a surrogate for PM\(_{2.5}\) and NO\(_2\) exposure.
- Logistic regression with spatial random effects (CAR prior) to account for neighbourhood-level clustering of exposures and outcomes.

**Key finding**: children within 75 m of major highways had significantly elevated respiratory symptoms, even after controlling for SES and smoking.

**Spatial confounding issue**: neighbourhood SES was strongly negatively correlated with proximity to highways, requiring careful confounder adjustment.

### 7.6.2 Socioeconomic Deprivation and Cardiovascular Disease

**Study**: ecological regression of small-area cardiovascular mortality (age-sex standardized) on the Townsend deprivation score across electoral wards in England.

**Model**:

\[
O_i \sim \text{Poisson}(E_i \theta_i)
\]
\[
\log\theta_i = \mu + \beta \cdot \text{Townsend}_i + u_i + v_i
\]

where \((u_i, v_i)\) follow the BYM prior.

**Results**: \(\hat\beta = 0.043\) (95% CI: 0.038–0.048), indicating 4.4% higher cardiovascular mortality per unit increase in deprivation score, after accounting for residual spatial variation.

**Ecological interpretation**: The \(\hat\beta\) estimate reflects an area-level association, subject to ecological bias. The spatial random effect captures residual geographical variation not explained by deprivation.

## 7.7 Reporting Standards: STROBE

The **STROBE (Strengthening the Reporting of Observational Studies in Epidemiology)** checklist applies to ecological studies. Key elements specific to spatial analyses include:

- Clearly state the study design and unit of analysis (individuals vs. areas).
- Describe the geographic scale and justify the choice of areal units.
- Report the source and year of population denominators.
- Describe spatial autocorrelation assessment and adjustment.
- Discuss MAUP and ecological fallacy as potential limitations.

---

# Chapter 8: Geostatistics and Kriging

## 8.1 Geostatistical Framework

In geostatistical models, we observe \( \{Z(s_i)\}_{i=1}^n \) at locations \(\{s_i\}\) and wish to predict \(Z(s_0)\) at an unobserved location \(s_0\), or interpolate to a fine grid. The process \(Z(\cdot)\) is modelled as a realization of a Gaussian random field (GRF):

\[
Z(s) = \mu(s) + \delta(s)
\]

where \(\mu(s)\) is a deterministic mean (often modelled as \(\mu(s) = \mathbf{x}(s)^\top\boldsymbol{\beta}\)) and \(\delta(s)\) is a zero-mean GRF with covariance function:

\[
C(s_1, s_2) = \text{Cov}(Z(s_1), Z(s_2))
\]

## 8.2 Stationarity and Isotropy

<div class="definition">
<strong>Second-order stationarity</strong>: the covariance depends only on the separation vector \(\mathbf{h} = s_1 - s_2\), not on the absolute locations:
\[
C(s_1, s_2) = C(\mathbf{h})
\]
</div>

<div class="definition">
<strong>Isotropy</strong>: the covariance depends only on the distance \(h = \|s_1 - s_2\|\), not on the direction:
\[
C(s_1, s_2) = C(h)
\]
</div>

## 8.3 Variogram

The **variogram** (or semivariogram) summarizes spatial autocorrelation:

\[
2\gamma(h) = \text{Var}(Z(s + h) - Z(s)) = 2[C(0) - C(h)]
\]

The **semivariogram** \(\gamma(h)\) has three key parameters (for parametric models):
- **Nugget** \(c_0 = \lim_{h \to 0} \gamma(h)\): represents measurement error and micro-scale variation.
- **Sill** \(c_0 + c_1\): the total variance \(C(0) = \gamma(\infty)\).
- **Range** \(a\): the distance at which \(\gamma(h) \approx c_0 + c_1\) (the sill), beyond which observations are essentially uncorrelated.

**Common parametric models:**

*Exponential*: \(\gamma(h) = c_0 + c_1(1 - e^{-h/a})\)

*Gaussian*: \(\gamma(h) = c_0 + c_1(1 - e^{-h^2/a^2})\)

*Matérn*: \(\gamma(h) = c_0 + c_1\left[1 - \frac{2^{1-\nu}}{\Gamma(\nu)}\left(\frac{h}{a}\right)^\nu K_\nu\!\left(\frac{h}{a}\right)\right]\)

where \(K_\nu\) is a modified Bessel function and \(\nu\) controls smoothness.

## 8.4 Empirical Variogram and Fitting

The **empirical semivariogram** at lag \(h\) is:

\[
\hat\gamma(h) = \frac{1}{2|N(h)|} \sum_{(i,j) \in N(h)} (Z(s_i) - Z(s_j))^2
\]

where \(N(h) = \{(i,j) : \|s_i - s_j\| \approx h\}\) is the set of pairs separated by distance approximately \(h\).

Fitting: weighted least squares or maximum likelihood, minimizing discrepancy between \(\hat\gamma(h)\) and the model \(\gamma(h;\boldsymbol{\theta})\).

```r
library(gstat)
v_emp  <- variogram(Z ~ 1, data = sp_data)
v_fit  <- fit.variogram(v_emp, model = vgm("Exp", nugget = 0))
plot(v_emp, v_fit)
```

## 8.5 Kriging

**Kriging** is optimal linear prediction (BLUP) for geostatistical data. The **ordinary kriging** predictor at location \(s_0\) is:

\[
\hat Z(s_0) = \sum_{i=1}^n \lambda_i Z(s_i)
\]

The weights \(\boldsymbol{\lambda} = (\lambda_1, \ldots, \lambda_n)^\top\) minimize the prediction variance:

\[
\sigma^2_K = \text{Var}(Z(s_0) - \hat Z(s_0))
\]

subject to the unbiasedness constraint \(\sum_i \lambda_i = 1\). This gives the **kriging system**:

\[
\begin{pmatrix} \boldsymbol{\Gamma} & \mathbf{1} \\ \mathbf{1}^\top & 0 \end{pmatrix} \begin{pmatrix} \boldsymbol{\lambda} \\ -\mu \end{pmatrix} = \begin{pmatrix} \boldsymbol{\gamma}_0 \\ 1 \end{pmatrix}
\]

where \(\boldsymbol{\Gamma}_{ij} = \gamma(s_i - s_j)\), \(\boldsymbol{\gamma}_0 = (\gamma(s_0 - s_1), \ldots, \gamma(s_0 - s_n))^\top\), and \(\mu\) is a Lagrange multiplier.

The kriging variance is:

\[
\sigma^2_K(s_0) = \boldsymbol{\lambda}^\top \boldsymbol{\gamma}_0 + \mu
\]

```r
krige_out <- krige(Z ~ 1, locations = sp_data, newdata = pred_grid,
                   model = v_fit)
spplot(krige_out["var1.pred"], main = "Kriging predictions")
spplot(krige_out["var1.var"],  main = "Kriging variance")
```

**Kriging variants:**
- *Simple kriging*: mean \(\mu\) is known.
- *Ordinary kriging*: mean is unknown but constant.
- *Universal kriging*: mean is a polynomial in coordinates; \(\mu(s) = \mathbf{x}(s)^\top\boldsymbol{\beta}\).
- *Co-kriging*: uses spatially correlated auxiliary variables.

---

# Chapter 9: Bayesian Computation

## 9.1 Bayesian Inference Recap

The posterior distribution combines the prior \(p(\boldsymbol{\theta})\) and likelihood \(p(\mathbf{y} \mid \boldsymbol{\theta})\):

\[
p(\boldsymbol{\theta} \mid \mathbf{y}) = \frac{p(\mathbf{y} \mid \boldsymbol{\theta})\, p(\boldsymbol{\theta})}{p(\mathbf{y})} \propto p(\mathbf{y} \mid \boldsymbol{\theta})\, p(\boldsymbol{\theta})
\]

For spatial models, \(\boldsymbol{\theta}\) includes: regression coefficients \(\boldsymbol{\beta}\), spatial random effects \(\mathbf{u}\), variance hyperparameters \((\sigma^2_u, \sigma^2_v)\), and potentially covariance parameters for geostatistical data.

## 9.2 Markov Chain Monte Carlo

For complex spatial models, the posterior is analytically intractable and MCMC simulation is used.

### 9.2.1 Gibbs Sampler

If the full conditional distributions \(p(\theta_j \mid \boldsymbol{\theta}_{-j}, \mathbf{y})\) are available in closed form (as they are in conjugate hierarchical models), the Gibbs sampler cycles through:

\[
\theta_j^{(t+1)} \sim p(\theta_j \mid \boldsymbol{\theta}_{-j}^{(t)}, \mathbf{y})
\]

For the gamma–Poisson BYM model with conjugate priors on hyperparameters, many full conditionals are gamma or normal distributions.

### 9.2.2 Metropolis–Hastings

When full conditionals are non-standard, a Metropolis–Hastings step is used: propose \(\theta_j^* \sim q(\cdot \mid \theta_j^{(t)})\) and accept with probability:

\[
\alpha = \min\!\left(1,\ \frac{p(\theta_j^* \mid \boldsymbol{\theta}_{-j}, \mathbf{y})\, q(\theta_j^{(t)} \mid \theta_j^*)}{p(\theta_j^{(t)} \mid \boldsymbol{\theta}_{-j}, \mathbf{y})\, q(\theta_j^* \mid \theta_j^{(t)})}\right)
\]

For high-dimensional spatial models (hundreds of areas), standard MCMC can be very slow due to the high-dimensional \(\mathbf{u}\) vector and slow mixing.

### 9.2.3 MCMC Diagnostics

- **Trace plots**: should look like stationary noise ("fuzzy caterpillar").
- **Autocorrelation plots**: large lag-1 autocorrelation indicates slow mixing.
- **Gelman–Rubin \(\hat R\)**: compares within-chain and between-chain variance across multiple parallel chains. \(\hat R < 1.05\) is generally considered acceptable.
- **Effective sample size (ESS)**: \(n_{\text{eff}} = n / (1 + 2\sum_{k=1}^\infty \rho_k)\). Should be \(> 200\) for reliable posterior summaries.

```r
library(rstan)
stan_fit <- stan(file = "bym_model.stan", data = stan_data, chains = 4, iter = 2000)
library(bayesplot)
mcmc_trace(stan_fit, pars = c("beta", "sigma_u", "sigma_v"))
print(stan_fit)  # Shows Rhat and n_eff
```

## 9.3 Integrated Nested Laplace Approximation (INLA)

INLA (Rue, Martino & Chopin 2009) exploits the **latent Gaussian model** (LGM) structure:

\[
y_i \mid \mathbf{x}, \boldsymbol{\psi} \sim p(y_i \mid x_i, \boldsymbol{\psi})
\]
\[
\mathbf{x} \mid \boldsymbol{\psi} \sim \mathcal{N}(\boldsymbol{\mu}(\boldsymbol{\psi}),\ \mathbf{Q}(\boldsymbol{\psi})^{-1})
\]

where \(\mathbf{x}\) is the latent Gaussian field (containing random effects and regression coefficients) and \(\boldsymbol{\psi}\) are the hyperparameters. The precision matrix \(\mathbf{Q}\) is **sparse** for Markov random field priors (ICAR), enabling fast sparse linear algebra.

INLA integrates out \(\mathbf{x}\) analytically (using Laplace approximations) and numerically integrates over \(\boldsymbol{\psi}\), yielding marginal posterior distributions in seconds rather than hours.

```r
# BYM model with covariates
formula <- O ~ deprivation + age_prop +
               f(area_id, model = "bym2", graph = "nb_graph.graph",
                 hyper = list(phi = list(prior = "pc", param = c(0.5, 2/3)),
                              prec = list(prior = "pc.prec", param = c(0.3/0.31, 0.01))))
fit <- inla(formula, family = "poisson", data = dat, E = dat$E,
            control.predictor = list(compute = TRUE),
            control.compute = list(dic = TRUE, waic = TRUE, cpo = TRUE))
summary(fit)
```

---

# Chapter 10: Space-Time Modelling

## 10.1 Motivation

Disease surveillance and epidemiological studies often yield data with both spatial and temporal dimensions: counts of a disease in each of \(n\) areas over each of \(T\) time periods, \(\{O_{it}\}\). Questions of interest:

- Are there persistent spatial clusters that are stable over time?
- Are there areas with increasing or decreasing trends?
- Are there space-time interactions — clusters that appear only at specific times (outbreaks)?

## 10.2 Separable Space-Time Models

A **separable** model factors the space-time relative risk:

\[
\theta_{it} = \theta_i^{\text{spatial}} \times \theta_t^{\text{temporal}}
\]

This assumes the spatial pattern is constant over time and the temporal trend is uniform across areas. In log-scale:

\[
\log\theta_{it} = \mu + u_i + v_i + \alpha_t + \delta_t
\]

where \((u_i, v_i)\) are BYM spatial effects and \((\alpha_t, \delta_t)\) are structured and unstructured temporal effects (e.g., first-order random walk for \(\alpha_t\)).

## 10.3 Non-Separable Space-Time Models (Knorr-Held)

Knorr-Held (2000) proposes a general framework allowing four components:

\[
\log\theta_{it} = \mu + u_i + v_i + \alpha_t + \delta_t + \phi_{it}
\]

where \(\phi_{it}\) is a space-time interaction term. Four types of interaction are defined by whether the spatial and temporal effects are structured or unstructured:

| Type | Spatial component | Temporal component |
|------|------------------|-------------------|
| I    | unstructured     | unstructured       |
| II   | structured (ICAR)| unstructured       |
| III  | unstructured     | structured (RW)    |
| IV   | structured (ICAR)| structured (RW)    |

Type IV (the most complex) captures space-time interactions where neighbouring areas share similar temporal trends.

## 10.4 Temporal Smoothing

For \(T\) time points, temporal random effects are often assigned a **random walk (RW)** prior:

*First-order RW*: \(\alpha_t - \alpha_{t-1} \sim \mathcal{N}(0, \sigma_\alpha^2)\), penalizes large changes between adjacent time points.

*Second-order RW*: \((\alpha_t - \alpha_{t-1}) - (\alpha_{t-1} - \alpha_{t-2}) \sim \mathcal{N}(0, \sigma_\alpha^2)\), penalizes non-linearity (equivalent to a penalized cubic spline).

## 10.5 INLA for Space-Time Models

```r
# Space-time BYM: areas x time with interaction
dat$time_id <- as.integer(dat$year)
formula_st <- O ~ f(area_id, model = "bym2", graph = "graph.adj") +
                  f(time_id, model = "rw1") +
                  f(space_time_id, model = "iid")
fit_st <- inla(formula_st, family = "poisson", data = dat, E = dat$E,
               control.compute = list(dic = TRUE))
```

---

# Appendix A: R Reference Card

## A.1 Core Spatial Packages

| Package | Purpose |
|---------|---------|
| `sf` | Simple features: read/write/manipulate vector data |
| `terra` | Raster data (replacing `raster`) |
| `spdep` | Spatial weights, Moran's I, spatial regression tests |
| `spatialreg` | Spatial lag, error, Durbin models |
| `spatstat` | Point process analysis, K functions |
| `gstat` | Variogram, kriging |
| `INLA` | Bayesian inference via INLA |
| `inlabru` | High-level interface to INLA |
| `tmap` | Thematic mapping |
| `mapview` | Interactive mapping |

## A.2 Key Functions

```r
# Spatial weights
nb    <- poly2nb(shp)                  # Contiguity neighbours
W     <- nb2listw(nb, style = "W")     # Row-standardized weights

# Moran's I
moran.test(x, W)                       # Asymptotic test
moran.mc(x, W, nsim = 999)             # Permutation test
localmoran(x, W)                       # LISA: local Moran's I

# Spatial regression (spatialreg package)
lagsarlm(y ~ x, data, listw = W)      # Spatial lag model
errorsarlm(y ~ x, data, listw = W)    # Spatial error model
lm.LMtests(ols, W, test = "all")       # LM tests

# Point processes (spatstat)
ppp(x, y, window = owin(...))          # Create point pattern
density(pp, sigma = h)                 # Kernel intensity
Kest(pp); Lest(pp)                     # K and L functions
envelope(pp, Lest, nsim = 199)         # Monte Carlo envelopes

# Kriging (gstat)
variogram(Z ~ 1, data = sp_data)       # Empirical semivariogram
fit.variogram(v_emp, vgm("Exp"))       # Fit parametric model
krige(Z ~ 1, sp_data, pred_grid, v)    # Ordinary kriging

# INLA
inla(formula, family = "poisson",
     data = dat, E = dat$E)            # Fit BYM model
inla.pmarginal(1, marg)                # P(theta > 1 | y)
inla.smarginal(marg)                   # Summarize marginal
```

---

# Appendix B: Key Formulas Summary

## B.1 SMR and Empirical Bayes

\[
\text{SMR}_i = \frac{O_i}{E_i}, \quad E_i = \sum_k r_k n_{ik}
\]

\[
\tilde\theta_i^{\text{EB}} = \frac{\hat\alpha + O_i}{\hat\beta + E_i} = w_i \text{SMR}_i + (1-w_i)\frac{\hat\alpha}{\hat\beta}
\]

## B.2 BYM Model

\[
O_i \sim \text{Poisson}(E_i e^{\mu + u_i + v_i})
\]
\[
p(\mathbf{u}) \propto \exp\!\left(-\frac{1}{2\sigma_u^2}\sum_{i \sim j}(u_i - u_j)^2\right), \quad v_i \overset{iid}{\sim} \mathcal{N}(0, \sigma_v^2)
\]

## B.3 Moran's I

\[
I = \frac{n}{S_0} \cdot \frac{\sum_{ij} w_{ij}(y_i-\bar y)(y_j-\bar y)}{\sum_i(y_i-\bar y)^2}, \quad \mathbb{E}[I] = \frac{-1}{n-1}
\]

## B.4 Spatial Lag and Error Models

**SLM**: \(\mathbf{y} = \rho\mathbf{W}\mathbf{y} + \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}\)

**SEM**: \(\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + (\mathbf{I}-\lambda\mathbf{W})^{-1}\boldsymbol{\varepsilon}\)

## B.5 Kriging System

\[
\begin{pmatrix}\boldsymbol{\Gamma} & \mathbf{1} \\ \mathbf{1}^\top & 0\end{pmatrix}\begin{pmatrix}\boldsymbol{\lambda} \\ -\mu\end{pmatrix} = \begin{pmatrix}\boldsymbol{\gamma}_0 \\ 1\end{pmatrix}
\]

## B.6 Kulldorff Scan Statistic

\[
\text{LR}(Z) = \left(\frac{c_Z}{\mu_Z}\right)^{c_Z}\!\left(\frac{C-c_Z}{\mu-\mu_Z}\right)^{C-c_Z}\cdot\mathbf{1}\!\left(\frac{c_Z}{\mu_Z}>\frac{C-c_Z}{\mu-\mu_Z}\right)
\]

---

# Appendix C: Glossary

<div class="definition">
<strong>Areal data</strong>: observations aggregated over non-overlapping polygons that partition the study region.
</div>

<div class="definition">
<strong>BYM model</strong>: Besag–York–Mollié model; a Bayesian hierarchical Poisson model with ICAR + IID spatial random effects.
</div>

<div class="definition">
<strong>CAR prior</strong>: conditional autoregressive prior; specifies each spatial random effect conditionally on its neighbours.
</div>

<div class="definition">
<strong>Complete spatial randomness (CSR)</strong>: the null hypothesis for point process analysis; a homogeneous Poisson process with intensity \(\lambda\).
</div>

<div class="definition">
<strong>Ecological fallacy</strong>: error of inferring individual-level associations from group-level (aggregate) data.
</div>

<div class="definition">
<strong>ICAR</strong>: intrinsic CAR; an improper prior for spatially structured random effects with precision matrix \(\mathbf{Q} = \sigma^{-2}(\mathbf{D}-\mathbf{A})\).
</div>

<div class="definition">
<strong>INLA</strong>: integrated nested Laplace approximation; a fast algorithm for approximate Bayesian inference in latent Gaussian models.
</div>

<div class="definition">
<strong>Kriging</strong>: optimal linear spatial prediction (BLUP) using a fitted variogram model.
</div>

<div class="definition">
<strong>LGCP</strong>: log-Gaussian Cox process; a Cox process whose log-intensity is a Gaussian random field.
</div>

<div class="definition">
<strong>LISA</strong>: local indicators of spatial association; area-level decomposition of a global spatial autocorrelation statistic.
</div>

<div class="definition">
<strong>MAUP</strong>: modifiable areal unit problem; sensitivity of results to the choice of geographic boundaries used for aggregation.
</div>

<div class="definition">
<strong>Moran's I</strong>: global measure of spatial autocorrelation; the spatial analogue of Pearson correlation.
</div>

<div class="definition">
<strong>SMR</strong>: standardized mortality ratio; observed deaths divided by expected deaths under a reference rate schedule.
</div>

<div class="definition">
<strong>Spatial scan statistic</strong>: a likelihood ratio test over all candidate circular windows to detect geographic clusters of elevated disease risk (Kulldorff 1997).
</div>

<div class="definition">
<strong>Variogram</strong>: function \(\gamma(h)\) describing how variance between observations increases with distance \(h\).
</div>
