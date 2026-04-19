---
title: "STAT 442: Data Visualization"
subjects: "STAT"
prof: "Matthias Schonlau"
---

## Sources and References
**Primary texts** — Wilke (2019) *Fundamentals of Data Visualization* (https://clauswilke.com/dataviz); Munzner (2014) *Visualization Analysis and Design*
**Supplementary texts** — Cleveland (1994) *The Elements of Graphing Data*; Tufte (1983) *The Visual Display of Quantitative Information*; Wickham (2016) *ggplot2: Elegant Graphics for Data Analysis*
**Online resources** — Woldford courses page: https://sas.uwaterloo.ca/~rwoldfor/courses/

---

# Chapter 1: Principles of Visual Encoding

## 1.1 What Is Data Visualization?

Data visualization is the systematic mapping of data values to visual properties in order to enable human perception to extract patterns, trends, and anomalies that would be difficult or impossible to detect in raw tabular form. The practice spans disciplines from statistics and computer science to cognitive psychology and graphic design.

A useful framing comes from Munzner (2014), who defines visualization as "computer-based systems that provide visual representations of datasets designed to help people carry out tasks more effectively." Three interacting components define any visualization: the data to be shown, the task to be accomplished, and the idiom — the specific visual encoding chosen. Effective visualization requires matching all three.

Wilke (2019) emphasizes that "all data visualizations map data values into quantifiable features of the resulting graphic." These quantifiable features are called *aesthetics* or *visual channels*, and the mapping from data to aesthetics is governed by *scales*. Every scale must be one-to-one: for each distinct data value there is exactly one aesthetic value, and conversely.

## 1.2 Data Types

Before choosing a visual encoding, one must characterize the nature of the data. The literature converges on five principal types:

<div class="definition">
<strong>Quantitative continuous</strong>: values that can take any real number within a range. Examples: height (1.73 m), temperature (−4.2 °C), income (\$54,320). Arithmetic differences and ratios are meaningful.
</div>

<div class="definition">
<strong>Quantitative discrete</strong>: values restricted to integers or a countable set. Examples: number of children (0, 1, 2, …), count of accidents per day. Differences are meaningful; the density between adjacent values is zero.
</div>

<div class="definition">
<strong>Qualitative nominal (unordered categorical)</strong>: categories with no intrinsic ordering. Examples: species (dog, cat, fish), country of birth, hair color. Only equality/inequality comparisons are meaningful.
</div>

<div class="definition">
<strong>Qualitative ordinal</strong>: categories that carry a meaningful order but where differences between levels are not quantified. Examples: Likert ratings (strongly disagree, disagree, neutral, agree, strongly agree), academic letter grades (A, B, C, D, F), size categories (small, medium, large).
</div>

<div class="definition">
<strong>Temporal</strong>: dates, times, or time intervals. Temporal data is continuous in principle but is often recorded at discrete snapshots. Examples: stock price at daily close, monthly precipitation, timestamps of web server requests.
</div>

A sixth type, **spatial/geographic**, is sometimes treated separately: coordinates (latitude/longitude), regions (postal codes, census tracts), or administrative boundaries. Spatial data introduces the special problem of projection — mapping a curved surface onto a plane.

## 1.3 Visual Channels and Their Properties

Visual channels (also called *visual variables* following Bertin 1967 and *aesthetics* in the grammar of graphics) are the perceptual dimensions along which graphical marks can vary. The major channels and their applicability to data types are:

| Channel | Quantitative | Ordinal | Nominal |
|---|---|---|---|
| Position (common scale) | Excellent | Good | Good |
| Position (separate scales) | Good | Good | Good |
| Length | Good | Good | Poor |
| Angle | Fair | Fair | Poor |
| Area | Fair | Fair | Poor |
| Luminance / value | Fair | Good | Poor |
| Color saturation | Fair | Fair | Poor |
| Color hue | Poor | Poor | Excellent |
| Shape | Poor | Poor | Good |
| Texture | Poor | Poor | Fair |

The key insight is that not all channels are equally effective for every data type. Color hue is ideal for distinguishing nominal categories but conveys no quantitative magnitude. Length encodes quantitative values well but is meaningless for nominal comparisons.

## 1.4 Channel Effectiveness Rankings

Cleveland and McGill (1984) conducted landmark psychophysics experiments measuring how accurately observers decode quantitative information from different visual channels. Their ranked ordering (most to least accurate) for quantitative data:

1. Position along a common scale
2. Positions along identical, nonaligned scales
3. Length
4. Angle / slope
5. Area
6. Volume
7. Color density / saturation
8. Color hue

Mackinlay (1986) extended this work computationally, proposing an expressiveness criterion (a visualization expresses all and only the facts in the data) and an effectiveness criterion (the most important information should be encoded by the most effective channel). Mackinlay's ranking for quantitative data mirrors Cleveland and McGill's, and he provided separate rankings for ordinal and nominal data.

**Practical implication**: encode the most important variable with the most effective channel. In a scatter plot of income vs. age colored by sex, income and age occupy position channels (most effective), while sex uses color hue (appropriate for nominal).

**Numerical example of channel effectiveness**: In a bar chart of four values (100, 80, 60, 40), a reader asked to judge the ratio of the smallest to the largest bar should answer 0.40. Cleveland and McGill's experiments found median error rates of roughly 5–10% for position judgments, 15–25% for angle judgments, and 25–40% for area judgments. The implication: if precise estimation matters, position (bar chart, dot plot) dominates area (bubble chart, pie chart). If only rough ordinal comparison is needed, any channel may suffice.

**The redundant-coding benefit**: encoding the same variable in two channels simultaneously (color + position) can reduce error relative to either channel alone, because the viewer can cross-check both encodings. This is one reason grouped bar charts with colored bars (color redundant with position) are more reliable than a legend-only encoding.

**Interactions among channels**: channels are not fully independent. Color saturation interacts with size: small marks saturated to 100% may appear to "pop" relative to large lightly-colored marks, even if the data do not warrant this contrast. Channel interactions are an active research area in information visualization.

## 1.5 Data-Ink Ratio and Chartjunk

Edward Tufte introduced two foundational concepts in *The Visual Display of Quantitative Information* (1983):

<div class="definition">
<strong>Data-ink ratio</strong>: the proportion of a graphic's total ink (or pixels) devoted to displaying non-redundant data. Formally,
<em>data-ink ratio = data-ink / total ink used to print the graphic.</em>
Tufte's maxim: "Maximize the data-ink ratio, within reason."
</div>

<div class="definition">
<strong>Chartjunk</strong>: visual elements that do not encode information and that impede communication. Examples include decorative 3-D effects on 2-D bar charts, unnecessary grid lines, moiré patterns from cross-hatching, and gratuitous illustrations superimposed on graphs.
</div>

Tufte's prescriptions have been influential but also debated. Bateman et al. (2010) found in user studies that some chartjunk improves recall. The consensus today: eliminate elements that actively mislead or obscure, but do not be dogmatic about minimalism.

## 1.6 Gestalt Principles

Gestalt psychology (Wertheimer, Köhler, Koffka, early 20th century) describes principles by which the human visual system groups elements into coherent wholes. Visualizers exploit these principles deliberately:

<div class="definition">
<strong>Proximity</strong>: elements close together in space are perceived as belonging to the same group. Grouped bar charts work because bars within each group are placed near one another.
</div>

<div class="definition">
<strong>Similarity</strong>: elements sharing visual properties (color, shape, size) are perceived as related. All data points of the same treatment group should share a color.
</div>

<div class="definition">
<strong>Continuity (good continuation)</strong>: the eye tends to follow smooth, continuous contours rather than abrupt changes in direction. Line charts imply temporal or sequential continuity.
</div>

<div class="definition">
<strong>Closure</strong>: the mind fills in incomplete shapes to perceive them as closed, complete objects. Legends with partial borders are still read as bounding boxes.
</div>

<div class="definition">
<strong>Common fate</strong>: elements moving in the same direction are perceived as grouped. In animation, points representing the same entity across time are perceived as tracking a single object.
</div>

<div class="definition">
<strong>Figure-ground</strong>: the visual system distinguishes a primary figure from its background. High contrast between data marks and background ensures the figure reads clearly.
</div>

## 1.7 Grammar of Graphics

Wilkinson (2005) proposed the *grammar of graphics*, a principled framework that decomposes any statistical graphic into a set of orthogonal components:

- **Data**: the dataset and any statistical transformations applied to it (summary statistics, smoothers)
- **Aesthetics (aes)**: the mapping of data variables to visual channels (x position, y position, color, shape, size)
- **Geometry (geom)**: the type of geometric object used to represent data (points, lines, bars, polygons)
- **Scales**: the transformation from data space to aesthetic space (continuous color scale, log scale for axes)
- **Coordinate system**: typically Cartesian, but also polar, geographic projections
- **Facets**: subdivision of data into panels (small multiples)
- **Statistical layer**: transformations applied before rendering (binning for histograms, fitting a smooth)

Wickham (2010) translated this framework into the R package **ggplot2**, which became the dominant tool for statistical graphics in R. The grammar's value is not primarily as a software API but as a conceptual framework: it forces the analyst to think explicitly about what data variables map to what visual properties, rather than choosing a chart type by name ("I need a bar chart") without considering whether bars are the right geometric representation.

A minimal ggplot2 specification:

```
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point()
```

This maps weight (`wt`) to the x-axis and fuel efficiency (`mpg`) to the y-axis using point geometry. Layers are added compositionally with `+`, and every aesthetic can be mapped to a data variable or set to a fixed value.

The grammar enforces a discipline: to make a chart, one must explicitly state what data are shown, how they are mapped, and by what geometric means. This prevents accidental ambiguity and makes it easy to swap geometries (e.g., replace `geom_point` with `geom_line`) without changing the rest of the specification.

**Python equivalents**: Plotnine (`plotnine`) is a faithful Python port of ggplot2 using the grammar of graphics. Altair (Satyanarayan et al.) implements Vega-Lite, a JSON-based grammar of graphics for interactive web visualizations. Matplotlib is a lower-level library (analogous to base R graphics) that gives full control but requires more code for the same output.

**Grammar of graphics vs. chart templates**: most spreadsheet tools (Excel, Google Sheets) offer a gallery of chart types. The user selects "bar chart" and assigns columns to roles. This template approach is intuitive but inflexible: producing a chart not in the gallery requires workarounds, and the underlying mapping between data and aesthetics is implicit. The grammar approach is initially harder to learn but is composable and general.

## 1.8 The Principle of Proportional Ink

Wilke (Chapter 17) states the principle precisely: "The sizes of shaded areas in a visualization need to be proportional to the data values they represent." This is a direct operationalization of the idea that the visual impression should match the data.

**Bar charts**: the bar's baseline must be at zero. If a bar chart of salaries starts the y-axis at \$40,000, a salary of \$45,000 and one of \$80,000 appear to be in a roughly 1:9 ratio visually, when the true ratio is 45:80 ≈ 1:1.8. The visual impression is wildly misleading.

**Line charts and area charts**: for shaded areas under a line (area charts), the baseline must be at zero. However, for line charts (no shading), truncated axes are acceptable because the encoding is position (the y-coordinate of the line) rather than area. Readers can judge differences in y-coordinate correctly regardless of where the axis starts, as long as the axis is labeled.

**Logarithmic bars**: on a log scale, bars should start at 1 (the multiplicative identity), not 0. The bar's length then represents the log of the ratio, which is the natural quantity on a log scale.

**Pie and treemap charts**: these inherently satisfy proportional ink because area is the encoding. However, humans judge area less accurately than length, so proportional ink is a necessary but not sufficient condition for accurate perception.

**3-D charts**: perspective foreshortening violates proportional ink for 3-D bar charts, since the apparent height of a bar depends on its depth position in the scene, not just its data value.

## 1.9 A Taxonomy of Misleading Visualizations

Visualizations can mislead through:

1. **Truncated axes**: starting a bar chart's y-axis above zero amplifies apparent differences, violating proportional ink (see Chapter 2, Section 2.6, and Wilke Chapter 17).
2. **Dual axes**: placing two y-axes with different scales on the same chart makes any apparent crossing or correlation an artifact of scale choice.
3. **Area vs. length confusion**: bubble sizes scale by area if coded correctly, but naive implementations scale radius linearly, causing areas to grow quadratically.
4. **3-D distortions**: perspective 3-D charts obscure length and angle comparisons; foreground bars appear larger than identical background bars.
5. **Choosing the wrong summary**: showing mean only when the distribution is skewed or multimodal hides structure.
6. **Cherry-picking time windows**: selecting start and end dates to flatter a trend.

---

# Chapter 2: Univariate and Distribution Visualization

## 2.1 Why Visualize Distributions?

A single summary statistic — mean, median, range — collapses a distribution to a scalar, necessarily discarding information. Anscombe's Quartet (1973) is the canonical demonstration: four datasets with identical means, variances, and correlations but radically different distributions and relationships. Visualizing distributions reveals modality, skew, outliers, gaps, and shoulders that summaries conceal.

## 2.2 Histograms

A histogram partitions the range of a univariate variable into \( k \) contiguous bins \([b_0, b_1), [b_1, b_2), \ldots, [b_{k-1}, b_k]\) and draws a rectangle over each bin with height proportional to the count (or frequency density) of observations falling in that bin.

### Bin Width Selection

The choice of bin width \( h \) is the central tuning parameter. Too small: the histogram is noisy and lumpy, dominated by sampling variability. Too large: structure is smoothed away.

**Sturges' rule** (1926): \( k = \lceil \log_2 n \rceil + 1 \), so \( h = (\max - \min) / k \). Designed for unimodal symmetric distributions; performs poorly for large \( n \) or skewed distributions.

**Freedman-Diaconis rule** (1981):

\[ h = 2 \cdot \text{IQR}(x) \cdot n^{-1/3} \]

where IQR is the interquartile range. More robust to outliers than Sturges and adapts better to heavy-tailed distributions.

**Scott's rule** (1979):

\[ h = 3.49 \cdot \hat{\sigma} \cdot n^{-1/3} \]

where \( \hat{\sigma} \) is the sample standard deviation. Optimal for normal distributions.

Wilke's practical advice: "When making a histogram, always explore multiple bin widths." A single bin width can hide or create apparent features.

In ggplot2: `geom_histogram(binwidth = 0.5)` sets the bin width explicitly; `bins = 30` sets the number of bins.

### Reading a Histogram

The area of each bar, not its height, represents relative frequency when bin widths differ. If all bins are equal width, height is proportional to count. A frequency density histogram has y-axis \( \text{count} / (n \cdot h) \), so the total area integrates to 1 and can be compared to a density curve.

## 2.3 Kernel Density Estimates

<div class="definition">
<strong>Kernel density estimate (KDE)</strong>: a non-parametric estimate of the probability density function of a random variable. Given observations \( x_1, \ldots, x_n \), the KDE at point \( x \) is

\[
\hat{f}(x) = \frac{1}{n h} \sum_{i=1}^{n} K\!\left(\frac{x - x_i}{h}\right)
\]
where \( K \) is a kernel function satisfying \( \int K(u)\,du = 1 \), and \( h > 0 \) is the bandwidth.
</div>

Common kernels: Gaussian, Epanechnikov (optimal in mean squared error sense), triangular, uniform (rectangular). The Gaussian kernel is the most widely used because it produces smooth estimates.

**Bandwidth selection**: analogous to bin width. The optimal bandwidth under a Gaussian reference distribution (Silverman's rule of thumb) is:

\[
h = 1.06 \hat{\sigma} n^{-1/5}
\]
Broader kernels produce smoother but more biased estimates; narrower kernels capture more detail but introduce variance.

**Boundary bias**: KDEs assign probability mass outside the support of the variable. For age data bounded at 0, the KDE will show a positive density at negative ages unless boundary correction is applied. Always verify that the KDE does not predict impossible values.

In ggplot2: `geom_density(bw = "SJ")` uses the Sheather-Jones bandwidth selector, which generally outperforms Silverman's rule.

## 2.4 Box Plots and Violin Plots

### Box Plots

Tukey's box-and-whisker plot (1977) displays five summary statistics:

- Median (line inside box)
- First quartile Q1 and third quartile Q3 (box edges); the box spans the **interquartile range** IQR = Q3 − Q1
- Whiskers extend to the most extreme observations within \( 1.5 \times \text{IQR} \) of the quartiles
- Points beyond the whiskers are plotted individually as potential outliers

Box plots are compact, allowing many distributions to be compared side-by-side on a single axis. Their limitation: they show only five numbers and are uninformative about multimodality (two separate clusters would produce the same box as a uniform distribution with the same quartiles).

In ggplot2: `geom_boxplot(aes(x = group, y = value))`.

### Violin Plots

A violin plot is a mirrored kernel density estimate rotated 90 degrees, providing a continuous view of the distribution shape that the box plot obscures. Medians and quartiles can be overlaid as points or lines inside the violin.

Violins require a reasonable sample size per group (rule of thumb: at least 30–50 observations) to justify the smooth density approximation. For small samples, the smooth curve may imply more certainty about distribution shape than the data warrant.

In ggplot2: `geom_violin()` with optional `draw_quantiles = c(0.25, 0.5, 0.75)`.

### Combining Representations

A common strategy is to overlay a box plot inside a violin, capturing both the distributional shape (violin) and robust summary statistics (box). An even richer option is the **raincloud plot** (Allen et al. 2019), which combines a half-violin (density), jittered raw points, and a box plot into a single panel, giving the reader access to all three levels of abstraction simultaneously.

## 2.5 Strip Charts and Jitter

For small to moderate datasets (roughly \( n < 200 \) per group), showing the raw data as points is often more informative than any summary. A **strip chart** (dot plot) places each observation as a point along the value axis.

**Overplotting** — multiple observations mapping to the same pixel — is the main challenge. Solutions:

- **Jitter**: add uniform random noise in the non-data dimension, spreading points apart without distorting their values. In ggplot2: `geom_jitter(width = 0.1)`.
- **Beeswarm**: arrange points in a column, stacking horizontally when they would overlap (package `ggbeeswarm`).
- **Sina plot**: spread points proportionally to local density, effectively a jittered violin (package `ggforce`).

## 2.6 Empirical CDF and Q-Q Plots

### Empirical CDF

<div class="definition">
<strong>Empirical cumulative distribution function (ECDF)</strong>: for a sample \( x_1, \ldots, x_n \), the ECDF is

\[ \hat{F}(x) = \frac{1}{n} \sum_{i=1}^{n} \mathbf{1}(x_i \leq x). \]

It is a step function increasing by \( 1/n \) at each observed value.
</div>

The ECDF directly shows what fraction of the data falls below any threshold. Unlike histograms, it requires no binning and is uniquely determined by the data. It is particularly useful for comparing two distributions: if one ECDF lies entirely above another for all \( x \), then one distribution **first-order stochastically dominates** the other.

In ggplot2: `stat_ecdf()`.

### Quantile-Quantile Plots

A **Q-Q plot** compares two distributions by plotting their quantiles against each other. For testing normality, theoretical standard normal quantiles are placed on the x-axis and sample quantiles on the y-axis. If the data are normally distributed, points fall on a straight line with slope \( \sigma \) and intercept \( \mu \).

Deviations from linearity reveal non-normality:
- **Concave-up (right-skewed)**: upper tail heavier than normal
- **S-shaped**: both tails lighter than normal (platykurtic)
- **Heavy-tailed (leptokurtic)**: both ends bow outward from the line

In ggplot2: `geom_qq()` with `geom_qq_line()`.

## 2.7 Comparing Multiple Distributions

When comparing many groups simultaneously, the choice of chart type depends on the number of groups and sample sizes.

**Side-by-side box plots**: efficient for up to ~20 groups; each group gets one box. Standard in ANOVA contexts.

**Ridge plots (joy plots)**: vertically stacked density curves, each group offset along the y-axis. Work well for 10–50 ordered groups (e.g., income distributions by year). The `ggridges` package implements these. Wilke uses them to show movie length distributions across decades.

**Faceted histograms or densities**: place each group in its own panel using `facet_wrap` or `facet_grid`. Spatial separation prevents overplotting at the cost of some between-group comparison difficulty (use fixed scales to maintain comparability).

## 2.8 Time Series and Trend Visualization

A time series plots one or more quantitative measurements against time, typically with time on the x-axis and a line connecting successive observations. Design considerations specific to time series:

**Aspect ratio and banking**: Cleveland's *banking to 45°* principle holds that the median absolute slope of line segments should be oriented near 45°, maximizing the resolution with which rate of change can be judged. For a fixed dataset, adjust the plot's aspect ratio (height-to-width ratio) to achieve this. In R: `banking()` from the `lattice` package computes the optimal ratio.

**Multiple time series**: if two or more series share the same units and scale, overlay them on a single plot using color to distinguish. If they are on vastly different scales, use small multiples (facets) with independent y-axis scales rather than a dual-axis chart. Dual axes (two different y-axes on one plot) are almost always misleading because the apparent crossing or correlation is entirely determined by the arbitrary choice of axis scales.

**Smoothing for noisy series**: overlay a trend smoother using `geom_smooth()`. The `loess` smoother with span parameter \( \alpha \) fits a locally-weighted polynomial; smaller \( \alpha \) follows the data more closely. The `gam` method fits a generalized additive model with a spline basis.

**Seasonal decomposition**: for monthly or quarterly data, decompose the series as \( Y_t = T_t + S_t + \varepsilon_t \) (additive) or \( Y_t = T_t \times S_t \times \varepsilon_t \) (multiplicative), where \( T_t \) is trend, \( S_t \) is seasonal component, and \( \varepsilon_t \) is remainder. Visualize each component separately to see structure at different temporal scales. In R: `stats::stl()` and `forecast::autoplot()`.

## 2.9 Transformations for Skewed Data

When data span multiple orders of magnitude, arithmetic axes compress most observations into a small region. Transformations to consider:

**Log transformation**: \( y' = \log(y) \) (base 10 or natural). Converts multiplicative relationships to additive ones. Appropriate for strictly positive data (income, population, concentration). In ggplot2: `scale_x_log10()` applies the transformation to the axis labels and tick marks.

**Square-root transformation**: \( y' = \sqrt{y} \). Useful for count data (Poisson-like), which have variance proportional to the mean. Gentler compression than log.

**Box-Cox transformation**:

\[ y' = \begin{cases} (y^\lambda - 1)/\lambda & \lambda \neq 0 \\ \log(y) & \lambda = 0 \end{cases} \]

A parametric family encompassing log (\(\lambda = 0\)), square root (\(\lambda = 0.5\)), and identity (\(\lambda = 1\)). The optimal \(\hat{\lambda}\) maximizes normality of the transformed data.

**Asinh transformation**: \( y' = \operatorname{arcsinh}(y/a) \approx \log(2y/a) \) for large \( |y| \) but behaves linearly near zero. Useful for data that include zeros or negative values where log fails.

---

# Chapter 3: Bivariate and Categorical Data

## 3.1 Scatter Plots

The scatter plot is the workhorse of bivariate continuous visualization: each observation is a point with coordinates \((x_i, y_i)\). Position along two quantitative axes is the most effective channel available.

Key design decisions:
- **Aspect ratio**: the slope of a linear trend is perceived relative to 45° (banking to 45° rule, Cleveland 1993). Use `coord_fixed()` in ggplot2 when the two axes share units.
- **Axis limits**: do not truncate unless the range of interest is genuinely restricted.
- **Reference lines**: `geom_abline(slope = 0, intercept = 0)` for y = 0 or y = x lines.

### Regression Lines and Confidence Bands

`geom_smooth(method = "lm")` in ggplot2 overlays a fitted regression line with a \(1 - \alpha\) confidence band. The band is curved even for straight-line fits because the standard error of prediction \( \hat{y} = \hat{\beta}_0 + \hat{\beta}_1 x \) varies with \( x \):

\[
\text{SE}(\hat{y}) = \hat{\sigma} \sqrt{\frac{1}{n} + \frac{(x - \bar{x})^2}{\sum(x_i - \bar{x})^2}}
\]
The band is narrowest at \(\bar{x}\) and widens toward the extremes.

`geom_smooth(method = "loess")` or `method = "gam"` adds a non-parametric smooth, useful for detecting non-linear relationships.

## 3.2 Overplotting Solutions

When \( n \) is large, points overlap and the true density of observations is obscured. Solutions:

**Alpha transparency**: `geom_point(alpha = 0.1)`. Effective when densities vary moderately; fails when stacking hundreds of points at the same location (fully transparent points still appear as a solid blob at 1/alpha overplots).

**Hexbin plots**: partition the plot area into a hexagonal grid and color each hex by the count of points within it. Hexagons tile the plane more efficiently than squares (more neighbors, less orientation bias). In R: `geom_hex()` with `scale_fill_viridis_c()` for perceptually uniform color.

**2D density contours**: `geom_density_2d()` overlays contour lines of a bivariate KDE. `geom_density_2d_filled()` fills the contours. Useful for identifying the modal region.

**Subsampling**: randomly display a representative subset. Fast and honest when the subset is declared.

## 3.3 Bar Charts

Bar charts display a quantitative value for each level of a categorical variable. The bar length is the primary encoding; bars must start at zero (proportional ink principle).

**Orientation**: horizontal bars are preferred when category labels are long (avoids rotated text). In ggplot2: `coord_flip()` or swap x and y in `aes()`.

**Ordering**: for unordered categories, sort bars by descending value to facilitate comparison. Use `reorder(category, value)` in ggplot2. Do not sort when the category has an intrinsic order (e.g., months, age brackets).

### Grouped Bar Charts

Two categorical variables: one mapped to x-position, the other to fill color, with `position = "dodge"`. Grouped bars enable direct comparison within each x-group but make between-group comparison harder.

### Stacked Bar Charts

`position = "stack"` stacks bars, showing the total and the composition. Stacking is appropriate when the total is meaningful. Comparisons of interior segments (not the bottom one) are difficult because the baseline shifts — this is the primary drawback.

**100% stacked bars**: `position = "fill"` normalizes each bar to unit height, showing proportions. The total is hidden; only composition is shown.

### Dot Plots vs. Bar Charts

Cleveland advocated **dot plots** (position of a single dot along a scale) as superior to bar charts for displaying magnitudes, because dot plots do not require a zero baseline and allow the axis range to focus on meaningful variation. In ggplot2: `geom_point()` with discrete x or y.

## 3.4 Visualizing Proportions

**Pie charts** encode proportion as angle (and arc length). Research by Cleveland and McGill (1984) found angle judgment to be less accurate than length judgment, making bar charts quantitatively superior for reading exact proportions. However, pie charts are intuitive for communicating part-of-whole structure to general audiences when there are only 2–4 segments and precision is not required.

Rules for defensible pie charts:
- No more than 5 slices
- Label slices directly with percentages (do not rely solely on a color legend)
- Do not use 3-D perspective effects
- Order slices by size (largest starting at 12 o'clock)

**Waffle charts**: a \( 10 \times 10 \) (or similar) grid of unit squares, each square representing 1% (or some unit fraction). More perceptually accurate than pie charts because counting squares is more reliable than judging angles. The `waffle` package in R provides this.

**Mosaic plots**: visualize the joint distribution of two or more categorical variables. Rectangle widths encode marginal frequencies of one variable; heights encode conditional frequencies of the second variable. Introduced by Hartigan and Kleiner (1981), popularized by Friendly (1994). In R: `mosaic()` from the `vcd` package.

**Spine plots**: a degenerate mosaic — one variable is shown by width (so widths sum to the total), the other by proportion within each column. Useful as an alternative to stacked 100% bars when comparing across groups.

**Treemaps**: partition a rectangle into smaller rectangles, where area encodes a hierarchical quantitative variable (e.g., file system usage, stock market cap by sector). Each level of hierarchy is a nesting of rectangles. The `treemap` package in R and `squarify` algorithm in Python implement these.

## 3.5 Association Visualization for Categorical Data

For a two-way contingency table of counts \( n_{ij} \), several specialized displays exist:

**Balloon plot**: a scatter plot where each cell \((i, j)\) contains a circle whose area is proportional to \( n_{ij} \). Good for sparse tables where most cells are near zero and a few dominate.

**Sieve diagram**: colors cells according to the sign of the Pearson residual \( (n_{ij} - \hat{n}_{ij}) / \sqrt{\hat{n}_{ij}} \). Blue/red (or dark/light) cells signal positive/negative departures from independence.

**Association plot (Cohen-Friendly)**: bar height equals the Pearson residual; width equals \( \sqrt{\hat{n}_{ij}} \), so bar area equals the signed contribution to the chi-squared statistic. A horizontal reference line marks independence; bars above it indicate observed > expected.

In R all three are available in the `vcd` package: `mosaic()`, `sieve()`, `assoc()`.

### Visualizing Independence

The baseline against which categorical associations are measured is **statistical independence**: \( P(X = i, Y = j) = P(X = i) \cdot P(Y = j) \). Under independence, expected cell counts are \( \hat{n}_{ij} = n_{i+} n_{+j} / n \) (row total times column total divided by grand total).

Departures from independence are quantified by Pearson's chi-squared statistic:

\[
\chi^2 = \sum_{i,j} \frac{(n_{ij} - \hat{n}_{ij})^2}{\hat{n}_{ij}}
\]

Visualizations like the sieve diagram and association plot make the *spatial pattern* of these departures visible — which cells are over- or under-represented, not just whether the overall association is significant. This is the crucial advantage of visualization over a single-number test statistic.

**Ordinal categorical associations**: when both variables are ordinal, visualize with a scatter plot where each point's area is proportional to \( n_{ij} \) (a *bubble scatter* for contingency tables). This preserves the ordinal structure that mosaic plots lose by treating all categories as nominal.

## 3.6 Visualizing Continuous Proportions and Compositions

**Compositional data** consists of vectors \(\mathbf{x} = (x_1, \ldots, x_D)\) with \( x_j > 0 \) and \( \sum_j x_j = c \) (usually \( c = 1 \) or 100%). The constraint means the \( D \) components carry only \( D - 1 \) degrees of freedom. Standard statistical methods applied to compositional data without transformation are invalid.

**Ternary diagrams** visualize three-component compositions on an equilateral triangle. Each vertex represents 100% of one component; a point inside the triangle's position encodes the mixture. Used in geology (soil texture triangles: sand, silt, clay), chemistry (phase diagrams), and marketing (brand perception studies). In R: `ggtern` package extends ggplot2 with `coord_tern()`.

**Stacked area charts**: a generalization of stacked bar charts to a continuous time axis. Each component is a filled region; total height represents the sum. Used for time-series proportions (market share over time, budget categories by year). Concerns: baseline shifts make interior layers hard to compare; the top layer is easiest to read. A **streamgraph** (ThemeRiver) centers the stacking around a horizontal axis to improve balance, at the cost of losing a zero baseline.

**Alluvial / parallel sets for proportions**: when tracking how individuals redistribute across categories over time or across multiple classification schemes, alluvial diagrams (Section 5.5) are the most appropriate display. Each ribbon's width encodes the proportion of the population following that path.

**Log-ratio transformation (Aitchison 1986)**: for statistical analysis of compositional data, take pairwise log-ratios \( \log(x_i / x_j) \). These are unconstrained real numbers, suitable for standard methods. For visualization, plot log-ratios on standard axes rather than raw proportions.

---

# Chapter 4: Color Theory and Perception

## 4.1 Color Models

Color is a perceptual phenomenon; the physics of light and the biology of cone photoreceptors (sensitive to roughly 420, 530, 560 nm) together determine what colors humans discriminate.

**RGB**: additive color model used by displays. Each color specified as \((R, G, B) \in [0, 255]^3\). Intuitive for hardware but perceptually non-uniform: equal numeric steps do not correspond to equal perceptual differences.

**HSL / HSV**: Hue–Saturation–Lightness (or Value). Hue is the perceptual color name (0–360°), saturation is colorfulness, lightness/value is brightness. More intuitive for designing palettes than RGB, but still not perceptually uniform.

**CIELAB (L\*a\*b\*)**: a perceptually uniform color space defined by the International Commission on Illumination. \( L^* \) is perceived lightness (0 = black, 100 = white); \( a^* \) encodes green–red axis; \( b^* \) encodes blue–yellow axis. A unit step anywhere in L\*a\*b\* space corresponds to approximately the same perceived color difference. This is the basis for constructing perceptually uniform palettes.

**HCL (Hue–Chroma–Luminance)**: the polar coordinates of L\*a\*b\*, where chroma = \(\sqrt{a^{*2} + b^{*2}}\). The `colorspace` R package builds palettes in HCL space, ensuring that luminance variation is controlled independently of hue.

## 4.2 Palette Types

<div class="definition">
<strong>Sequential palette</strong>: a palette that varies systematically along a luminance gradient (and possibly hue). Used for ordered quantitative data with a natural minimum. Examples: light yellow to dark blue (viridis), white to dark red. The viewer can read magnitude from lightness.
</div>

<div class="definition">
<strong>Diverging palette</strong>: two sequential palettes joined at a neutral midpoint. Used when data have a meaningful center (e.g., 0 for signed deviations, 50% for proportions near parity). The midpoint should be visually neutral (light gray or white). Examples: blue–white–red, brown–white–teal.
</div>

<div class="definition">
<strong>Qualitative palette</strong>: a set of colors that are distinguishable but have no implied ordering or magnitude. All colors should have approximately equal luminance and saturation so that no category appears more prominent than others.
</div>

**ColorBrewer** (Brewer et al.): a set of carefully designed palettes for cartography, available at colorbrewer2.org and in R via `RColorBrewer`. Three types: sequential, diverging, qualitative. Many are colorblind-safe.

**Viridis**: a perceptually uniform sequential palette (Garnier 2018) that is readable in grayscale and distinguishable by the three main types of color-vision deficiency. Available in ggplot2 via `scale_color_viridis_c()` (continuous) and `scale_color_viridis_d()` (discrete).

**Okabe-Ito palette**: eight colors designed to be distinguishable under all forms of color-vision deficiency. Recommended by Wilke as the default qualitative palette.

## 4.3 Color-Vision Deficiency

Approximately 8% of males and 0.5% of females have some form of color-vision deficiency (CVD). Types:
- **Deuteranopia / deuteranomaly**: reduced sensitivity to green (most common)
- **Protanopia / protanomaly**: reduced sensitivity to red
- **Tritanopia**: reduced sensitivity to blue (rare, ~0.003%)

Red and green, the two most commonly confused colors, dominate many default palettes. A scatter plot using red for one group and green for another will be unintelligible to deuteranopic readers.

CVD simulation tools: `colorspace::cvd_emulator()` in R; `daltonize.org`; the Coblis simulator. Always test palettes under at least deuteranopia simulation before publication.

## 4.4 Common Color Mistakes

**Rainbow / jet colormap**: maps the spectrum from violet to red (or reverse) onto a continuous scale. Two serious flaws:
1. *Non-monotone luminance*: the luminance profile has a bright plateau in yellow-green and dark ends in violet and red. Equal data steps map to unequal perceptual steps, creating false patterns and hiding real ones.
2. *Circular hue structure*: minimum and maximum values appear in similar hues (both dark), suggesting falsely that extreme values are similar.

**Too many qualitative colors**: beyond 7–8 colors, color alone cannot distinguish categories. Solutions: use direct labels, encode with shape in addition to color (redundant coding), or use small multiples.

**Overuse of saturation**: highly saturated colors are visually aggressive and make fine detail hard to read. Reserve full saturation for highlighting.

**Ignoring context**: a red-green diverging map of political results will be uninterpretable by a substantial fraction of the male population.

## 4.5 Color for Encoding vs. Decoration

Color should be used purposefully. Wilke distinguishes:
- **Encoding color**: color carries data information. Each hue or shade has a specific meaning. Never use more than one encoding color mapping per figure.
- **Highlighting color**: color draws attention to a subset of the data. Use a muted background palette with one accent color.
- **Decorative color**: color makes the figure attractive without encoding information. Use sparingly; decorative color can distract from data color.

The principle: "use color to communicate, not to decorate."

## 4.6 Redundant Coding

**Redundant coding** means encoding the same information in two or more visual channels simultaneously. For example, in a scatter plot comparing two groups, encode group by both color hue and point shape. This improves accessibility: readers with color-vision deficiency can still distinguish groups by shape; readers printing in grayscale still see two distinct marks.

Wilke (Chapter 20) argues that redundant coding is almost always beneficial: it makes charts more robust to rendering limitations (projector color, photocopy, colorblind viewers) and reduces cognitive load (the viewer does not need to hold the legend in working memory to decode the chart).

Effective redundant encodings: color + shape, color + line type (dashed vs. solid), fill + pattern (for bar charts), position + direct label.

Redundant coding should not be confused with *double encoding* for different variables — mapping the same channel to two different variables produces an ambiguous and uninterpretable chart.

## 4.7 Titles, Labels, Captions, and Tables

**Titles and subtitles**: the title should state the message, not merely describe what is shown. "Income inequality has grown since 1980" is a message title; "Income by year" is a descriptive label. Message titles are preferred in journalism and exploratory communication; descriptive labels are used in scientific journals where the reader draws their own conclusions.

**Axis labels**: use full variable names with units in parentheses: "Household income (USD)" not "income." Avoid abbreviations that require lookup in a legend.

**Captions**: figures in academic papers include a caption that stands alone — the reader should be able to understand the figure without reading the surrounding text. Captions should specify: what is shown, what data were used, what statistical transformations were applied, and what the key takeaway is.

**Tables**: well-designed tables complement visualizations. Zeigler (2020) and Schwabish (2020) give guidelines: align numbers right (right-aligned numbers align decimal points), align text left, eliminate vertical lines (they add visual noise), use thin horizontal rules only at the top, bottom, and below the header. In R: `knitr::kable()` with `kableExtra` for formatting; `gt` package for rich HTML tables.

---

# Chapter 5: Multivariate Visualization

## 5.1 The Challenge of High Dimensions

Human visual perception is fundamentally two-dimensional (the retina is a 2-D surface), with depth cues providing limited additional information. Visualizing data with \( p > 2 \) variables therefore requires either:
1. Projecting into 2-D, accepting information loss
2. Using multiple 2-D views linked by position or identity
3. Encoding additional variables in non-position channels (color, size, shape)
4. Reducing dimensionality before plotting

No single method dominates; the choice depends on \( p \), \( n \), and the analytical goal.

## 5.2 Scatter Plot Matrix (SPLOM)

A scatter plot matrix places all pairwise scatter plots in a \( p \times p \) grid. The cell at row \( i \), column \( j \) shows the scatter plot of variable \( i \) against variable \( j \). The diagonal is typically used for marginal displays (histogram, density, or variable name).

The lower triangle and upper triangle are mirror images; sometimes the lower triangle shows raw scatter plots while the upper triangle shows correlation coefficients or ellipses.

In R: `pairs()` from base R; `GGally::ggpairs()` for a ggplot2-based version with customizable diagonal and off-diagonal geoms.

**Scaling**: SPLOMs scale to roughly \( p \leq 10 \) before individual panels become too small to read. For larger \( p \), use correlation matrices (heat maps) or parallel coordinates.

**Correlation matrices**: compute all \( \binom{p}{2} \) pairwise Pearson (or Spearman) correlations and display as a heat map. The diagonal is 1 by definition. Color is diverging (blue for negative, red for positive, white at 0). In R: `corrplot::corrplot()` or `GGally::ggcorr()`. Reorder rows and columns by hierarchical clustering to place highly correlated variables adjacently, revealing blocks of correlated predictors.

## 5.3 Parallel Coordinate Plots

A **parallel coordinate plot (PCP)** (Inselberg 1985; Wegman 1990) displays each observation as a polyline connecting \( p \) vertical axes, one per variable. Each axis is scaled independently (typically to [0, 1]). Clusters appear as bundles of lines; outliers appear as isolated divergent paths.

Key perceptual issue: adjacent axes can be compared, but non-adjacent axes cannot be compared by eye. The ordering of axes critically affects what structure is visible. Reordering axes to place correlated variables adjacently reveals cluster structure; several algorithms automate this (e.g., optimal leaf ordering).

Overplotting is severe for large \( n \). Mitigation: alpha transparency, subsampling, interactive brushing (select a range on one axis, other lines are filtered), or aggregation (bundled/centred lines for clusters).

In R: `GGally::ggparcoord()`. In Python: `plotly.express.parallel_coordinates()` for interactive PCPs.

### Hammock Plots

A **hammock plot** (Schonlau 2003) is a variant of parallel coordinates designed specifically for a mix of continuous and categorical variables. Categorical variables are represented as vertical bands whose widths are proportional to frequency; lines connecting adjacent bands have widths proportional to joint frequency. This makes the frequency distribution visible rather than relying on line density.

## 5.3a Parallel Coordinates: Axis Ordering and Scaling

Parallel coordinate plots require careful preprocessing and design:

**Axis scaling**: each variable is typically scaled to [0, 1] using min-max normalization: \( x' = (x - \min x) / (\max x - \min x) \). This ensures no single variable dominates due to unit differences. However, min-max scaling is sensitive to outliers; robust scaling using the IQR is preferable: \( x' = (x - Q_1) / (Q_3 - Q_1) \), clipping at [0, 1].

**Axis ordering heuristics**: Friendly (1999) proposed ordering axes to place highly correlated variables adjacently, minimizing the number of crossing lines within clusters. The algorithm: compute all pairwise correlations, then find a linear ordering that maximizes adjacent-pair correlations (equivalent to a traveling salesman problem on the correlation graph, solvable approximately by seriation methods).

**Axis flipping**: reversing the direction of some axes (so that low values are at the top rather than the bottom) can eliminate systematic crossings. If two variables are negatively correlated, flipping one causes cluster lines to become parallel rather than crossing.

**Interactive brushing in PCPs**: the most powerful use of parallel coordinates is interactive. Brushing a range on one axis filters the display to only lines passing through that range, revealing the joint distribution of all other variables conditioned on the brushed variable. In R: `GGally::ggparcoord()` provides static PCPs; interactive PCPs require Plotly, D3.js, or Shiny integration.

## 5.3b Heat Maps

A heat map encodes a matrix \( \mathbf{X} \in \mathbb{R}^{m \times n} \) as a colored grid, where each cell \((i, j)\) receives a color corresponding to \( x_{ij} \). Sequential palettes encode magnitude; diverging palettes encode signed deviation from a center.

**Row and column ordering** is critical. Default row order (arbitrary) obscures structure. Two common approaches:
- **Hierarchical clustering with dendrogram**: cluster rows and columns by Euclidean distance or correlation, reorder by the cluster dendrogram. The resulting heat map shows blocks of similar rows/columns adjacent.
- **Seriation**: algorithms (e.g., optimal leaf ordering, spectral seriation) minimize a measure of total within-neighbor difference, producing the smoothest possible gradient across rows and columns.

In R: `pheatmap::pheatmap()` or `ComplexHeatmap::Heatmap()` (Bioconductor) for clustered heat maps; `heatmaply` for interactive versions.

## 5.4 Andrews Curves

Andrews (1972) proposed encoding a \( p \)-dimensional observation \( \mathbf{x} = (x_1, \ldots, x_p)^\top \) as the Fourier function:

\[
f_{\mathbf{x}}(t) = \frac{x_1}{\sqrt{2}} + x_2 \sin(t) + x_3 \cos(t) + x_4 \sin(2t) + x_5 \cos(2t) + \cdots
\]
for \( t \in [-\pi, \pi] \). Each observation becomes a curve; observations in the same cluster produce similar curves, while outliers produce visually distinct trajectories. Andrews curves preserve distances: \( \|\mathbf{x} - \mathbf{y}\|^2 = \frac{1}{\pi} \int_{-\pi}^{\pi} [f_{\mathbf{x}}(t) - f_{\mathbf{y}}(t)]^2 \, dt \).

The main limitation of Andrews curves is that the visual appearance depends heavily on the ordering of variables (which variable is assigned \( x_1, x_2, \ldots \)) and is difficult to interpret for non-statisticians. They are primarily used in exploratory analysis for detecting clusters and outliers.

## 5.5 Sankey and Alluvial Diagrams

A **Sankey diagram** represents flows between nodes. Node height is proportional to total flow through the node; band width between nodes is proportional to flow volume. Originally used for energy flow analysis (Sankey 1898); widely adapted for showing category transitions, user flows in UX analytics, and migration data.

An **alluvial diagram** is a Sankey diagram where time or an ordered variable is placed on the x-axis and each alluvia (ribbon) represents a group tracking across categories. In R: `ggalluvial` package provides `geom_alluvium()` and `geom_stratum()`.

Both diagrams suffer from visual complexity when the number of categories is large (many crossing ribbons). Interactive versions with hover-to-highlight are strongly preferred.

## 5.6 Chord Diagrams

A chord diagram places categories on a circle; arcs inside the circle connect pairs, with width proportional to the relationship strength (e.g., migration volume between countries). The `circlize` package in R implements chord diagrams. They are visually striking but can be hard to read for more than ~10 categories.

## 5.7 Treemaps and UpSet Plots

**Treemaps**: partition a rectangle hierarchically. Each leaf node is a rectangle whose area encodes a quantity. The `treemap` package in R; `squarify` in Python. Treemaps are space-efficient but make precise area comparisons difficult.

**UpSet plots** (Conway, Lex, Gehlenborg 2017): visualize intersections among multiple sets. The original Venn diagram becomes unreadable for \( p > 4 \) sets. An UpSet plot uses a matrix of filled/empty dots to indicate which sets participate in each intersection, with bar charts showing intersection sizes. In R: `UpSetR::upset()`.

## 5.8 Dimensionality Reduction Visualizations

### PCA Biplot

Principal component analysis (PCA) decomposes the data matrix into orthogonal components \( \mathbf{X} \approx \mathbf{T}\mathbf{P}^\top \), where \( \mathbf{T} \) contains scores (projection of observations onto components) and \( \mathbf{P} \) contains loadings (contribution of original variables).

A **biplot** overlays both in a single 2-D plot: observations as points (scores on PC1 and PC2), original variables as arrows (loading vectors). Arrow direction and length indicate which variables drive each component; observations in the direction of an arrow have high values on that variable.

### t-SNE

t-distributed Stochastic Neighbor Embedding (van der Maaten and Hinton 2008) minimizes a KL divergence between pairwise similarity distributions in high-dimensional space and in the 2-D embedding. t-SNE preserves local neighborhood structure well, revealing clusters, but distances between clusters are not interpretable.

**Perplexity** (typically 5–50) controls the effective number of neighbors. Results are stochastic (random initialization) and not reproducible without fixing the seed. t-SNE should not be used for quantitative inference — only for exploratory cluster visualization.

### UMAP

Uniform Manifold Approximation and Projection (McInnes et al. 2018) is faster than t-SNE and arguably better preserves global structure. Like t-SNE, distances between clusters are not directly interpretable. Both methods are used extensively in genomics (single-cell RNA-seq) and image analysis.

**Caution**: both t-SNE and UMAP can create apparent clusters from uniformly distributed data if hyperparameters are poorly chosen. Always validate with cluster-agnostic analyses.

## 5.9 Radar and Spider Charts (and Their Critique)

A **radar chart** (also called a spider chart or web chart) displays multivariate data on axes radiating from a common center, one axis per variable. Each observation is a polygon connecting its values on all axes. Radar charts seem intuitive for "shape" profiles (athlete performance across speed, strength, endurance, etc.).

However, radar charts have well-documented problems:
1. **Area depends on axis ordering**: the polygon area changes arbitrarily when axes are reordered, even though the data are unchanged.
2. **Angle is the primary encoding**: angle perception is less accurate than length or position (Cleveland and McGill 1984).
3. **Overplotting**: with more than 3–4 overlapping polygons, the chart becomes a muddle.
4. **No common scale**: axes are individually scaled, so apparent size differences within a polygon do not reflect actual data ratios.

For most purposes, a bar chart or parallel coordinate plot is strictly superior to a radar chart. Radar charts are defensible only when the circular/cyclic structure is meaningful (e.g., wind direction profiles) or when the "shape" itself carries substantive meaning recognized by the audience.

---

# Chapter 6: Spatial Data Visualization

## 6.1 Map Projections

Earth's surface is approximately spherical (actually an oblate spheroid). Projecting it onto a flat plane unavoidably introduces one or more types of distortion: area, shape (conformality), distance, or direction.

**Conformal projections** preserve local angles (shapes) at the cost of area distortion. The **Mercator projection** (1569) is conformal; it represents loxodromes (constant-bearing courses) as straight lines. Its area distortion near the poles is severe: Greenland appears roughly the size of Africa, when in reality Africa is ~14 times larger.

**Equal-area projections** preserve areas but distort shapes. The **Goode homolosine** and **Albers equal-area conic** are examples. Recommended for choropleth maps where area encodes density.

**Compromise projections** sacrifice both conformality and equal-area for visual balance. The **Winkel Tripel** projection (used by National Geographic) minimizes overall distortion. The **Robinson projection** was used by Rand McNally.

In R: `sf` package handles coordinate reference systems (CRS); `ggplot2::coord_sf()` applies the projection.

Choosing a projection for a statistical map:
- Use an **equal-area projection** (Albers, Lambert azimuthal) for choropleth maps where visual area should reflect geographic area.
- Use a **conformal projection** (Mercator, stereographic) when local shapes (coastlines, street networks) need to be recognizable.
- For global maps, a **compromise projection** (Winkel Tripel, Robinson) balances distortions.
- For the continental US, the **Albers Equal-Area Conic** (standard parallels 29.5° N and 45.5° N) is standard in US government publications.

**Graticule lines** (lines of latitude and longitude) provide spatial reference on maps. They should be shown as faint grid lines, not as dominant features.

## 6.2 Choropleth Maps

A **choropleth map** assigns a color (or shading) to geographic regions based on a statistical variable. Each region is colored according to a color scale representing, e.g., population density, unemployment rate, or vote share.

<div class="definition">
<strong>Modifiable Areal Unit Problem (MAUP)</strong>: the statistical properties of spatial data depend on how regions are delineated. The same underlying point process can yield different (even contradictory) regional summaries depending on boundary choice. Results from choropleths based on arbitrary administrative units (counties, postal codes) should be interpreted with caution.
</div>

**Class interval selection**: continuous data must be binned into classes for display. Methods:
- *Equal interval*: equal-width bins. Simple but ignores data distribution.
- *Quantile (equal frequency)*: each bin contains the same number of observations. Good for perception (no color wasted on empty ranges) but can group very different values.
- *Natural breaks (Jenks)*: minimizes within-class variance; identifies "natural" groupings.
- *Standard deviation*: bins defined by standard deviations from mean; good for normally distributed data.
- *Manual*: subject-matter knowledge (e.g., legal thresholds).

Use 4–6 classes. More classes increase precision but reduce readability.

**Visual dominance of large regions**: a sparsely populated but geographically large region will visually dominate a choropleth even if it contains few people. This is the fundamental limitation of standard choropleths.

In R: `tmap::tm_fill()` with `tmap::tm_polygons()`; `ggplot2` with `geom_sf(aes(fill = variable))`.

**Normalization**: never map raw counts to a choropleth without normalizing by area or population. A county with high total income but low income per capita will appear to be high-income. Always display densities or rates on choropleth maps, not totals, unless the map specifically intends to show total quantity (in which case a proportional symbol map is usually better).

## 6.3 Dot Density Maps

Each point on the map represents a fixed number of observations, randomly placed within the appropriate region. Unlike choropleth maps, dot density maps do not normalize by area, so raw counts are directly visible. High dot density indicates both a high rate and a large area.

Limitation: individual dot placement is random within each region, so precise location within a region is not informative.

## 6.4 Cartograms

A **cartogram** distorts geographic shapes so that region area is proportional to a data variable (typically population). The result is a recognizable but distorted map where large countries shrink and small but populous ones expand.

Types:
- **Contiguous cartogram**: regions remain connected; boundaries are smoothly deformed (Gastner-Newman algorithm).
- **Non-contiguous cartogram**: regions are shrunk or grown independently, losing adjacency.
- **Dorling cartogram**: each region is replaced by a circle whose area is proportional to the variable, positioned approximately in geographic space.
- **Cartogram heat map / tilegram**: each region is represented as an equal-size square or hexagon arranged in a grid approximating geographic layout.

In R: `cartogram` package. `statebins` and `geofacet` packages implement tile-based approaches in R.

## 6.5 Proportional Symbol Maps

Circles or other symbols are placed at geographic locations with symbol size proportional to a quantity (e.g., population of cities, earthquake magnitude). Unlike dot density maps, each symbol represents the total for the location. Perceptual issue: area judgment is less accurate than length judgment (a circle with double the area looks less than twice as large). Flannery (1971) proposed a correction exponent of 0.5716 to adjust perceived size.

## 6.6 Flow Maps

A **flow map** uses arrows or lines between geographic locations to represent directional movement (migration, trade, network traffic). Arrow width is proportional to flow volume; arrow direction indicates origin to destination.

Challenges:
- **Crossing arrows**: in a dense flow network, many arrows cross, creating visual chaos. Interactive versions allow filtering.
- **Occlusion at hubs**: many arrows converging at a major hub (e.g., London in a European migration map) overlap and become unreadable.

**Edge bundling** techniques (Holten 2006) group spatially proximate arrows into smooth bands, reducing visual clutter while preserving the overall flow pattern.

In R: the `edgebundleR` package; for simpler cases, curved arrows with `geom_curve()` in ggplot2.

## 6.7 Bivariate Choropleth and Small Multiples

A **bivariate choropleth** encodes two variables simultaneously using a 2-D color grid (e.g., a \(3 \times 3\) matrix of colors). Interpretation requires careful legend reading and is difficult for general audiences. Use sparingly.

**Small multiples for space-time data**: produce one choropleth per time period, arranged in a grid. The eye can detect change across panels. In R: `tmap` with `tm_facets()` or ggplot2 with `facet_wrap(~ year)` over an `sf` object.

---

# Chapter 7: Explanatory and Model Visualization

## 7.1 Trellis Plots and Small Multiples (Model-Oriented)

**Trellis plots** (Cleveland et al., Bell Labs, 1993) formalize the principle of small multiples in a statistical context. A trellis display conditions on one or more panel variables, showing a separate plot for each level of the conditioning variable with identical scales, making it easy to compare how a relationship changes across conditions.

The **lattice** package in R (Sarkar 2008) implements trellis graphics directly: `xyplot(y ~ x | condition)` produces a scatter plot of y vs. x for each level of condition. The `|` operator is the conditioning symbol. Multiple conditioning variables produce a 2-D grid of panels: `xyplot(y ~ x | A * B)`.

ggplot2's `facet_grid(rows ~ cols)` and `facet_wrap(~ var)` provide analogous functionality with a ggplot2 grammar.

**Free vs. fixed scales**: by default, facets share the same axis scales (fixed), enabling direct visual comparison across panels. `facet_wrap(scales = "free_y")` allows each panel's y-axis to scale independently — useful when groups have vastly different ranges — but prevents direct magnitude comparison.

**Trellis for conditioning plots**: a key use of trellis displays is examining whether a bivariate relationship is consistent across subgroups. For example, does the correlation between income and life expectancy differ across continents? A trellis scatter plot with one panel per continent answers this immediately. If the within-panel pattern is consistent, the relationship is robust; if it varies, interaction is present.

## 7.2 Visualizing Regression Models

After fitting a model, visualization communicates the model's structure to human audiences far more effectively than tables of coefficients.

**Coefficient plots**: display regression coefficients as points with confidence intervals, sorted by effect size or by predictor group. Superior to tables because the eye immediately grasps which effects are large, which overlap zero, and which are precisely estimated.

In R: `coefplot::coefplot()`, `dotwhisker::dwplot()`, or manual construction with `ggplot2`.

The 95% CI for a coefficient \( \hat{\beta}_j \) is \[ \hat{\beta}_j \pm t_{n-p, 0.025} \cdot \widehat{\text{SE}}(\hat{\beta}_j). \]
A CI that does not include zero corresponds to a two-sided \( p < 0.05 \) test.

**Effect display plots** (Fox 2003): hold all other predictors at their means (or medians, modes for categorical) and plot the fitted response as a function of one predictor. For a GLM with a link function, the response is plotted on the original scale (probability, count) not the linear predictor scale. In R: `effects` package.

## 7.3 Residual Diagnostics

A **residual plot** plots residuals \( e_i = y_i - \hat{y}_i \) against fitted values \( \hat{y}_i \) (or against a predictor). If the model is correctly specified:
- Residuals should scatter randomly around 0 with no pattern.
- Heteroscedasticity shows as a funnel shape (variance increasing with fitted values).
- Non-linearity shows as a curved pattern.

Standard diagnostic quartet (Anscombe 1973 style):
1. Residuals vs. fitted
2. Normal Q-Q plot of residuals
3. Scale-location (√|residuals| vs. fitted) for homoscedasticity
4. Residuals vs. leverage (Cook's distance contours for influence)

In R: `plot(lm.fit)` produces all four automatically.

## 7.4 No-3D Principle

Wilke (Chapter 26) argues strongly against gratuitous three-dimensional effects in statistical graphics. The core problem is that 3-D charts introduce perspective foreshortening: objects further from the viewer appear smaller even if they represent the same data value. This creates systematic perceptual errors:

- A 3-D pie chart distorts slice areas; slices at the front appear larger than slices at the back.
- A 3-D bar chart makes bars in the foreground appear taller than identical bars in the background.
- 3-D surface plots of bivariate functions \( z = f(x, y) \) cause the back of the surface to be partially hidden behind the front.

**When 3-D is legitimate**: physical 3-D data (CT scans, molecular structures, terrain elevation in cartography) can require three spatial dimensions for accurate representation. Even then, interactive 3-D rotation (via `rgl`, `plotly`, or dedicated tools like Paraview) is far preferable to static 3-D projections.

The practical rule: if a chart uses 3-D space but could equivalently be drawn in 2-D (3-D bar chart, 3-D pie, 3-D ribbon chart), the 3-D is pure chartjunk and should be removed. The 2-D version will always be more accurate and usually more attractive.

## 7.5 ROC and Precision-Recall Curves

For binary classification models:

<div class="definition">
<strong>ROC curve</strong>: plots the true positive rate (sensitivity = TP/(TP+FN)) against the false positive rate (1 − specificity = FP/(FP+TN)) as the classification threshold varies from 0 to 1. A random classifier traces the diagonal; a perfect classifier reaches the top-left corner (TPR = 1, FPR = 0). The <em>area under the ROC curve</em> (AUC) summarizes discrimination ability: AUC = 0.5 is random, AUC = 1.0 is perfect.
</div>

<div class="definition">
<strong>Precision-recall curve</strong>: plots precision (TP/(TP+FP)) against recall (= sensitivity) at varying thresholds. Preferred over ROC when classes are heavily imbalanced, because ROC can look optimistic when negatives vastly outnumber positives.
</div>

**Calibration plot**: plots observed event rates (y-axis) against predicted probabilities (x-axis). A well-calibrated model lies along the 45° diagonal. Deviations indicate systematic over- or under-prediction. In R: `calibrate()` from the `rms` package; `CalibrationCurves` package.

## 7.6 Partial Dependence Plots

**Partial dependence plots (PDPs)** (Friedman 2001) show the marginal effect of one (or two) predictors on the model output, averaging over the joint distribution of all other predictors.

For a model \( f(\mathbf{x}) \) and a subset of predictors \( \mathbf{x}_S \) (typically one or two variables):

\[
\hat{f}_S(\mathbf{x}_S) = \mathbb{E}_{\mathbf{x}_C}\left[f(\mathbf{x}_S, \mathbf{x}_C)\right] \approx \frac{1}{n} \sum_{i=1}^{n} f(\mathbf{x}_S, \mathbf{x}_{i,C})
\]
where \( \mathbf{x}_C \) are the complement variables.

PDPs assume feature independence; if predictors are strongly correlated, the averaging over impossible feature combinations produces misleading summaries. The **Accumulated Local Effects (ALE) plot** (Apley and Zhu 2020) addresses this by integrating over conditional rather than marginal distributions.

In R: `pdp::partial()` with `plotPartial()`; `iml::FeatureEffect`.

## 7.7 Individual Conditional Expectation (ICE) Curves

An ICE plot (Goldstein et al. 2015) shows the predicted outcome for each individual observation as the focal predictor varies, holding all others fixed. A PDP is the mean of the ICE curves. When ICE curves cross (heterogeneous effects), the PDP is misleading — different observations respond differently to the same predictor change.

**Centered ICE (c-ICE)**: subtract each curve's value at a reference point \( x_0 \) to place all curves on a common scale, emphasizing individual variation in slope rather than level.

In R: `pdp::partial(ice = TRUE)`.

## 7.8 SHAP Values and Visualizations

**SHAP (SHapley Additive exPlanations)** (Lundberg and Lee 2017) decomposes a model prediction for a single observation into additive contributions from each feature, grounded in game-theoretic Shapley values.

For observation \( i \), the SHAP decomposition is:

\[
f(\mathbf{x}_i) = \phi_0 + \sum_{j=1}^{p} \phi_{ij}
\]
where \( \phi_0 = \mathbb{E}[f(\mathbf{x})] \) is the base rate (average prediction) and \( \phi_{ij} \) is the SHAP value for feature \( j \) on observation \( i \). SHAP values sum exactly to the prediction minus the base rate.

**Properties**: efficiency (values sum to the prediction gap), symmetry (symmetric features get equal contributions), dummy (zero-contribution features get \( \phi = 0 \)), additivity.

### SHAP Visualizations

**Force plot**: a horizontal bar diagram for a single observation. Features pushing prediction above the base rate are colored red (positive SHAP), features pushing below are colored blue (negative SHAP). The bar lengths represent SHAP value magnitude.

**SHAP summary plot**: a dot plot with one row per feature and one dot per observation. The x-axis is the SHAP value; color encodes the actual feature value (from low to high). This plot simultaneously shows:
- Which features are globally important (wide spread of SHAP values)
- The direction of each feature's effect (dots right of zero push prediction up)
- Whether the effect is monotone (color gradient along x-axis) or non-monotone

**SHAP dependence plot**: scatter plot of SHAP value for feature \( j \) (y-axis) against feature \( j \)'s actual value (x-axis), colored by a second feature that most interacts with \( j \). Reveals the shape of the feature-effect relationship and interaction structure.

**SHAP waterfall plot**: step-by-step decomposition from the base rate to the final prediction for a single observation, with each step being one feature's contribution.

**Worked example**: Consider a logistic regression classifier for loan default. The base rate prediction is \( \phi_0 = 0.12 \) (12% average default rate). For a specific applicant, SHAP values might be: income (−0.08), credit score (−0.06), debt-to-income ratio (+0.15), length of employment (−0.02). The final prediction is \( 0.12 + (-0.08) + (-0.06) + 0.15 + (-0.02) = 0.11 \) (11% predicted default probability). The force plot would show debt-to-income as the dominant red bar and income and credit score as blue bars pulling the prediction down.

In Python: `shap` library with `shap.summary_plot()`, `shap.force_plot()`, `shap.dependence_plot()`. In R: `shapviz` package with `sv_importance()`, `sv_waterfall()`.

### Connecting SHAP to Other Model Visualization Tools

SHAP values are more expressive than PDPs but also more computationally expensive (TreeSHAP for tree ensembles runs in \( O(n \cdot p \cdot D) \) where \( D \) is tree depth; Kernel SHAP for arbitrary models runs in \( O(n^2 p) \)). The relationship between tools:

- **Global importance (SHAP)**: mean absolute SHAP value \( \bar{\phi}_j = \frac{1}{n}\sum_i |\phi_{ij}| \). An aggregated version of feature importance that accounts for the direction and magnitude of effects.
- **Global importance (permutation)**: decrease in model performance when feature \( j \) is randomly permuted. Captures total importance including interactions; does not decompose into per-observation contributions.
- **PDP vs. SHAP dependence plot**: both show the relationship between a feature's value and its model contribution. PDPs average over all observations; SHAP dependence plots show individual observations as points. When effects are homogeneous, the two agree; heterogeneity is visible in the scatter of the SHAP dependence plot.

For non-technical communication, the SHAP force plot for a single observation is particularly effective: it reduces the black-box model to a narrative ("your loan application scored 0.11 probability of default; the main factor increasing risk was your debt-to-income ratio; the main factors reducing risk were your high income and credit score").

## 7.9 Visualizing Uncertainty

Uncertainty is a fundamental property of statistical estimates and predictions; communicating it honestly is as important as communicating the estimate itself.

**Error bars**: the most compact representation. A vertical segment from \( \hat{\theta} - \text{error} \) to \( \hat{\theta} + \text{error} \). The error quantity can be:
- \( \pm 1 \) SE (covers ~68% if normal)
- \( \pm 1.96 \) SE (95% CI if normal)
- \( \pm 2 \) SD (shows data spread, not estimation uncertainty — fundamentally different)

Always label error bars: "Error bars: 95% CI" or "Error bars: ±1 SD." Unlabeled error bars are uninterpretable.

**Graded uncertainty**: use a gradient of transparency or line thickness to show multiple confidence levels simultaneously (e.g., 50%, 80%, 95% CIs stacked), conveying that uncertainty is a continuum rather than a binary threshold.

**Gradient intervals** (boxplot-style but with gradient color): a horizontal bar whose opacity fades from the center outward, encoding a continuous credible distribution rather than discrete quantiles.

**Quantile dot plots** (Kay et al. 2016): represent a posterior distribution as \( n \) equal-probability dots arranged in a stack. Because counting discrete objects is more accurate than judging areas, quantile dot plots reduce *deterministic construal error* (the tendency to read uncertain ranges as hard limits).

**Hypothetical outcome plots (HOPs)** (Hullman et al. 2015): animate through a sequence of plausible outcomes sampled from the predictive distribution. The animation makes the range of possible outcomes vivid. Effective for communicating election forecasts, weather models, and economic projections to non-expert audiences.

**Raincloud plots**: combine a half-violin (density), jittered raw data points, and a box plot with CIs in a single display. Preferred by many researchers for communicating both the full distribution and summary statistics.

### Communicating Uncertainty to Non-Expert Audiences

Research by Hullman, Resnick, and colleagues highlights that visualizations of uncertainty are frequently misread. Common misconceptions:
- **Inside the interval is safe, outside is not** (discretization): readers treat the 95% CI boundary as a cliff, attributing certainty to values inside and impossibility to values outside.
- **The CI is the range of the data** (distributional thinking): readers conflate uncertainty in the mean with the spread of individual observations.

Design responses to these misconceptions:
- Use gradient displays that have no hard edge.
- Annotate with text ("95% of similarly conducted studies would find a value in this range") directly on the chart.
- Use HOPs to make the continuous distribution experiential.
- Show the predictive distribution (which includes individual-level variability) alongside the confidence interval for the mean, clearly distinguishing the two.

**Bayesian credible intervals**: in Bayesian analysis, the 95% credible interval (HDI — highest density interval, or equal-tailed interval) *does* have the interpretation that the parameter lies within it with 95% probability (given the prior and data). This interpretation is what most readers incorrectly apply to frequentist CIs. When communicating to general audiences, Bayesian credible intervals can reduce confusion about meaning.

---

# Chapter 8: Interactive and Dynamic Graphics

## 8.1 Image File Formats

Before a visualization reaches an audience, it must be exported in a file format. Wilke (Chapter 27) distinguishes two fundamental categories:

**Raster formats** represent images as grids of pixels. Common types:
- **PNG** (Portable Network Graphics): lossless compression, supports transparency, ideal for figures with sharp edges (bar charts, text). Use for web.
- **JPEG**: lossy compression optimized for photographs (smooth color gradients). Introduces blocking artifacts around sharp edges; never use for charts with text or lines.
- **TIFF**: lossless, large file sizes. Standard for print publication submissions (300–600 DPI minimum for print).
- **BMP**: uncompressed, very large. Avoid.

**Vector formats** represent images as mathematical descriptions of curves and shapes. Scale to any size without pixelation.
- **PDF**: the standard for academic publications in R (default of `ggsave("plot.pdf")`). Can be embedded in LaTeX.
- **SVG** (Scalable Vector Graphics): XML-based, supported in web browsers, editable in Illustrator/Inkscape.
- **EPS** (Encapsulated PostScript): legacy vector format for older publishing workflows.

**Rule**: use vector formats (PDF, SVG) for publication; use PNG (at ≥300 DPI) when a raster format is required. Never submit JPEG for charts with text or sharp geometric elements.

In R: `ggsave("plot.pdf", width = 6, height = 4, units = "in")` saves as PDF. `ggsave("plot.png", dpi = 300)` saves a high-resolution PNG.

## 8.2 Why Interactivity?

Static graphics commit to a single view of the data. Interactivity allows the viewer to:
- **Query** exact values (hover tooltips)
- **Filter** to subsets of interest
- **Zoom** into dense regions
- **Link** multiple views so selections propagate across plots
- **Animate** to show change over time

The tradeoff: interactive graphics require a software runtime (JavaScript in browsers, Shiny server), may not be reproducible, and can overwhelm casual viewers with too many controls. The decision to make a graphic interactive should be deliberate, not reflexive.

Munzner's task taxonomy is useful: some visualization tasks (identify, compare, summarize) are well served by static graphics; others (explore, navigate, reconfigure) benefit from interactivity.

## 8.3 ggplot2 and Plotly

**Plotly** (Sievert 2020) is a JavaScript visualization library with R and Python bindings. The `plotly::ggplotly()` function converts a ggplot2 object into an interactive Plotly figure with hover tooltips and zoom/pan controls added automatically.

Key Plotly features:
- Hover tooltips: display data values on mouseover
- Zoom and pan: click-drag to zoom a region; double-click to reset
- Legend toggling: click legend entries to show/hide groups
- Linked subplots: `subplot()` with `shareX = TRUE` synchronizes x-axis panning

In Python: `plotly.express` provides a high-level API mirroring ggplot2's grammar.

## 8.4 Shiny Reactive Framework

**Shiny** (Chang et al., RStudio) is an R framework for building interactive web applications from R code, without requiring JavaScript knowledge. The core concept is *reactivity*: output expressions automatically re-execute when their input values change.

A minimal Shiny app has two components:

```
ui <- fluidPage(
  sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30),
  plotOutput("distPlot")
)
server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(faithful$eruptions, breaks = input$bins)
  })
}
shinyApp(ui = ui, server = server)
```

**Reactive expressions** (`reactive({})`) cache intermediate computations, preventing unnecessary re-execution when multiple outputs depend on the same input.

**Reactive flow**: inputs → reactive expressions → outputs. Shiny constructs a dependency graph and re-executes only the minimal subgraph affected by a changed input.

Common UI widgets: `sliderInput`, `selectInput`, `checkboxInput`, `dateRangeInput`, `fileInput`. Output renderers: `renderPlot`, `renderTable`, `renderText`, `renderPlotly`.

## 8.5 Linked Views and Brushing

**Brushing**: selecting a region of one plot by click-dragging, which simultaneously highlights the selected observations in all linked plots. This is powerful for identifying multivariate outliers (an outlier in PCA space can be examined in the original scatter plots through brushing).

In Shiny: `plotOutput("plot", brush = "plot_brush")` captures brush coordinates; `brushedPoints(data, input$plot_brush)` returns the selected rows.

**Crosstalk** (Cheng 2020): an R package enabling cross-widget communication between htmlwidgets (Plotly, Leaflet, DT) without a Shiny server. Suitable for static HTML reports with modest interaction needs.

## 8.6 Animation and Transitions

**gganimate** (Pedersen 2020): extends ggplot2 with `transition_*` functions. `transition_time(year)` animates a ggplot over a time variable; `transition_states(group)` transitions between states of a discrete variable. Hans Rosling's famous Gapminder animation (life expectancy vs. income by country over time) is a canonical example.

Key considerations for animation:
- Ensure object *permanence*: the same entity should be represented by the same visual object across frames (Tversky et al. 2002). If a point for France disappears and reappears, the viewer may not realize it is the same country.
- Use smooth transitions (`ease_aes('cubic-in-out')`) to preserve spatial coherence.
- Provide a static reference frame (shadow of previous positions) to show trajectory.
- Animations are hard to read in print; always also provide static panels.

## 8.7 Web-Based Visualization: D3.js

**D3.js** (Data-Driven Documents, Bostock et al. 2011) is a JavaScript library for binding data to DOM elements and applying transformations based on data values. D3 operates at a lower level than Plotly: the developer specifies exactly what SVG or Canvas elements to create and how they should be updated.

D3 excels at custom, bespoke visualizations that cannot be produced by declarative tools: custom network layouts, geographic force simulations, animated treemaps. The learning curve is steep (requires JavaScript proficiency), but the expressive power is essentially unlimited.

Observable notebooks (observablehq.com) provide a reactive notebook environment for D3, used widely in journalism (New York Times graphics desk, The Economist) and scientific communication.

## 8.8 Design Principles for Dashboards

A dashboard presents multiple related charts on a single screen, giving an overview of a system's state. Common uses: business KPIs, public health surveillance, sports analytics.

Design principles:
1. **Most important metric first**: place the primary KPI in the top-left (natural reading order in LTR languages).
2. **Consistency**: use consistent colors, scales, and fonts across all panels. A metric colored blue in one chart must be blue everywhere.
3. **Minimal controls**: limit filters to those that serve genuine user tasks. Every additional widget adds cognitive load.
4. **Alignment**: align chart edges on a grid; ragged layouts create visual noise.
5. **Context**: always show the current value in the context of a trend, target, or comparison. A single number without context is less informative than a sparkline.
6. **Avoid chart overload**: a dashboard with 20 charts is an information dump, not a communication tool. Design for focus: 5–9 panels maximum.

## 8.9 Telling a Story with Data

Wilke (Chapter 29) distinguishes between **explorative visualization** (the analyst searching for patterns) and **explanatory visualization** (the analyst communicating a finding to an audience). Most of this course addresses the former; effective communication requires additional design principles.

**Identify the single most important message**: every explanatory visualization should answer the question, "What do I want the reader to take away?" If the answer is a list of five findings, the figure is probably five figures. Focus ruthlessly.

**Narrative arc**: effective data communication follows a story structure — context (what was the situation before?), conflict (what problem or change occurred?), resolution (what does the data tell us?). Annotating key events directly on a time series chart (e.g., marking a policy change with a vertical line and label) embeds the narrative context within the visualization.

**Annotation over legend**: when there are only 2–4 series on a line chart, label each line directly at its endpoint rather than using a legend. Direct labels eliminate the look-up overhead of matching legend colors to lines and are more accessible.

**Progressive disclosure**: in interactive and presentation contexts, reveal information incrementally. Start with the summary; allow the viewer to drill into detail. This matches human cognition better than presenting all detail simultaneously.

**Accessibility beyond color**: ensure figures are readable by people with color-vision deficiency, in grayscale, at small print sizes, and with screen readers (provide alt-text for publication). Accessibility is not an afterthought; it is a component of communication quality.

## 8.10 Evaluation of Visualizations

How do we know if a visualization is effective? Several complementary methods exist.

### Crowdsourced Evaluation

Amazon Mechanical Turk and similar platforms enable rapid, low-cost recruitment of large participant panels. Heer and Bostock (2010) replicated Cleveland and McGill's (1984) perceptual accuracy studies on Mechanical Turk with 50× more participants, broadly confirming the original rank ordering while adding statistical power to detect smaller differences between adjacent channel types. Their work established that crowdsourced perception studies produce reliable results comparable to laboratory experiments.

Schonlau's STAT 442 course project builds on this tradition: graduate student teams design a survey evaluating a pair of chart designs, administer it to other students during class time (the "data collection" assessment component), and analyze the resulting data as a formal empirical study. This provides hands-on experience with the full pipeline of empirical visualization research: hypothesis generation, experimental design, data collection, and statistical analysis.

### Perception Studies

Controlled experiments measure how accurately and quickly viewers decode information from different visual encodings. Cleveland and McGill (1984) used this method to derive their channel effectiveness ranking. Participants were shown pairs of bars, angles, or areas and asked to estimate the ratio. Error was measured as log absolute percentage error.

### Empirical Evaluation: Schonlau's Framework

A defining feature of the Winter 2026 STAT 442 course is the emphasis on *empirical evaluation* of graphs — a methodology central to Schonlau's research. Rather than relying solely on normative theory, empirical evaluation collects data from viewers.

Empirical evaluation methods:
- **Survey-based Likert ratings**: participants rate charts on dimensions such as clarity, aesthetics, trustworthiness, or ease of reading. Schonlau and colleagues have shown that Likert-based evaluations are reliable and can distinguish good from poor visualizations.
- **Response time**: how quickly does a viewer extract a target value? Shorter extraction time implies more effective encoding.
- **Accuracy**: what proportion of viewers correctly identify the larger of two values, or estimate a ratio within a given tolerance?
- **Eye tracking**: heat maps and scan paths from eye trackers reveal where viewers look first, how they read a legend, whether they notice outliers. This is the most data-rich but also most expensive method.

### Likert Ratings in Practice

A 5- or 7-point Likert scale (e.g., 1 = very hard to read, 7 = very easy to read) is administered to a panel of viewers who are shown multiple chart versions. A within-subjects design (each participant rates all versions) is more powerful than between-subjects (each participant rates only one version) because individual differences in taste are controlled.

Analysis: mixed-effects models with random effects for rater and fixed effects for chart type. Main effect of chart type indicates whether different encodings produce different ratings.

### Visual Inference

**Visual inference** (Buja et al. 2009; Wickham et al. 2010) embeds a real plot among several "lineup" plots generated under the null hypothesis. Viewers are asked which panel looks most different. If the real data panel is selected significantly more often than chance (1/\(m\) for an \(m\)-panel lineup), the feature is judged visually significant.

This converts viewer selections into a \(p\)-value analogue, providing a principled way to test whether a visual pattern is real or due to noise. The lineup protocol is implemented in the `nullabor` package in R.

### A Note on Statistical Testing for Visual Evaluation

When analyzing Likert-scale ratings from a visualization study, several statistical issues arise:

1. **Ordinal vs. interval assumption**: Likert items are ordinal. Parametric tests (t-test, ANOVA) assume interval scaling. In practice, simulation studies (Liddell and Kruschke 2018; Norman 2010) suggest that parametric tests on 5- or 7-point Likert items perform similarly to ordinal alternatives when items are approximately symmetric. However, for 3-point items or heavily skewed distributions, use ordinal logistic regression or Wilcoxon signed-rank test.

2. **Rater as random effect**: because different raters may have different mean ratings (some raters are generally more positive), include rater as a random intercept in a linear mixed-effects model:

\[ \text{rating}_{ij} = \mu + \alpha_j + \beta \cdot \text{chart\_type}_i + \varepsilon_{ij} \]

where \( \alpha_j \sim \mathcal{N}(0, \sigma_\alpha^2) \) is the rater random effect.

3. **Multiple comparisons**: if testing \( k \) chart types against a reference, apply Bonferroni correction or use a mixed model F-test for the overall effect before pairwise comparisons.

In R: `lme4::lmer(rating ~ chart_type + (1 | rater), data = d)` fits the mixed model.

### Taxonomy of Evaluation (Munzner 2009)

Munzner categorizes visualization evaluations along two axes:
- **Type of measure**: perceptual accuracy, time, qualitative feedback, adoption
- **Setting**: lab, crowdsourced (Mechanical Turk), field study, case study

No single evaluation type is universally best. Lab studies have internal validity but limited ecological validity; field studies have the reverse.

---

# Chapter 9: Bad vs. Good — Worked Case Study

## 9.1 Motivation

This chapter presents a structured comparison of poor and improved visualization choices applied to a single dataset: annual median household income by US state (2023). This mirrors the kind of critical evaluation emphasized in STAT 442.

## 9.2 The Dataset

- 50 states + DC
- Variable: median household income in USD
- Range: approximately \$45,000 (Mississippi) to \$100,000 (Maryland)

## 9.3 Version 1: Pie Chart

A 51-slice pie chart. Each slice represents one state's income. Problems:
- 51 slices: no color palette can distinguish 51 categories; the legend is unreadable.
- Income is a quantitative variable, not a proportion of a whole. Pie charts represent parts-of-whole; here the "whole" (total US income) is not meaningful.
- Angle encoding is less accurate than length for quantitative comparisons.

**Verdict**: categorically wrong chart type for this data. The viewer cannot extract any useful information.

## 9.4 Version 2: Truncated-Axis Bar Chart

A horizontal bar chart sorted by state name (alphabetical), with the x-axis starting at \$40,000. Problems:
- Alphabetical ordering of an unordered nominal variable (state) makes trend detection impossible.
- Truncated axis (does not start at zero) visually exaggerates differences between states.
- The proportional ink principle is violated: Mississippi's bar appears to have near-zero income when it actually has \$45,000.

**Verdict**: misleading. The truncation makes the income gap look far more extreme than it is.

## 9.5 Version 3: Choropleth Map

A choropleth map of the United States, colored by income using a 5-class quantile scheme with a yellow-to-green-to-blue sequential palette. Improvements:
- Geographic context is meaningful for state-level data; viewers have geographic intuitions.
- Quantile classification uses the full color range effectively.
- The sequential palette correctly encodes a unidirectional quantity.

Remaining issues:
- Large land-area states (Alaska, Montana) dominate visually even if their income is middle-range.
- Small states (Rhode Island, Delaware) are nearly invisible.
- The map cannot show the exact income value; only the ordinal class.

**Verdict**: appropriate choice for geographic patterns but should be supplemented with a ranked bar chart for precise comparison.

## 9.6 Version 4: Ranked Dot Plot (Best Choice)

A horizontal dot plot with one dot per state, sorted by descending income. The x-axis spans the full range with a zero baseline shown but the axis range focused at \$40,000–\$110,000 using dot plot conventions (dots do not require a zero baseline). State labels on the y-axis. Color encodes Census region (Northeast, South, Midwest, West) using a 4-color qualitative palette.

Improvements over all previous versions:
- Sorted order enables immediate ranking comparison.
- Dot plot avoids the proportional ink issue of bars (no baseline required).
- Regional color grouping reveals that Northeast states cluster at the top, South at the bottom, without hiding individual state values.
- Precise values can be read or extracted by hover tooltip.

**Verdict**: most effective static visualization for this data. Pair with the choropleth for geographic context.

---

## 9.7 Lessons from the Case Study

Several general principles emerge from this comparison:

1. **Match chart type to data type and question**: income is a quantitative variable, not a part-of-whole proportion. The pie chart was wrong not because pie charts are always bad, but because they answer the wrong question.
2. **Order matters**: alphabetical ordering of an unordered nominal variable adds no information and makes patterns invisible.
3. **Proportional ink is a hard constraint**: any bar chart with a truncated axis is misleading, even if the truncation is clearly labeled.
4. **Geographic encoding requires geographic data**: the choropleth was appropriate because state-level geographic patterns (the geographic concentration of high-income states in the Northeast) were part of the question. For purely non-spatial comparisons, the dot plot is better.
5. **Enriching encoding is additive**: adding regional color to the ranked dot plot did not replace the rank information; it added a second layer of structure. This is legitimate redundant coding that serves a real analytical purpose.

---

# Appendix: Quick Reference

## A.1 Visualization Software Ecosystem

| Tool | Language | Paradigm | Strengths |
|---|---|---|---|
| ggplot2 | R | Grammar of graphics | Publication-quality static plots; composable; large extension ecosystem |
| lattice | R | Trellis/conditioning | Multi-panel conditioning plots |
| base R graphics | R | Imperative | Low-level control; no dependencies |
| plotly | R / Python / JS | Interactive grammar | Hover, zoom, linked views; ggplotly conversion |
| Shiny | R | Reactive web app | Full web apps with R backend; reactive programming model |
| matplotlib | Python | Imperative | Foundation of Python plotting; highly flexible |
| seaborn | Python | Declarative statistical | Statistical visualization; built on matplotlib |
| plotnine | Python | Grammar of graphics | Port of ggplot2 to Python |
| Altair | Python | Vega-Lite declarative | Interactive web plots; JSON-based grammar |
| D3.js | JavaScript | Low-level DOM manipulation | Bespoke interactive/animated graphics |
| tmap | R | Map-specific grammar | Thematic maps; integrates with sf and raster |
| leaflet | R / Python / JS | Interactive maps | Slippy maps with tile layers; point/polygon overlays |

For STAT 442, proficiency in ggplot2 (and basic Shiny or plotly) is the primary expectation. Python users may use plotnine or seaborn as functional equivalents.

## A.2 ggplot2 Cheat Sheet Summary

| Task | ggplot2 call |
|---|---|
| Scatter plot | `geom_point(aes(x, y))` |
| Line chart | `geom_line(aes(x, y))` |
| Bar chart | `geom_bar(aes(x))` or `geom_col(aes(x, y))` |
| Histogram | `geom_histogram(aes(x), binwidth = h)` |
| Density | `geom_density(aes(x))` |
| Box plot | `geom_boxplot(aes(x, y))` |
| Violin | `geom_violin(aes(x, y))` |
| ECDF | `stat_ecdf(aes(x))` |
| Q-Q plot | `geom_qq(aes(sample = x))` |
| Heat map | `geom_tile(aes(x, y, fill = z))` |
| Hexbin | `geom_hex(aes(x, y))` |
| Smooth | `geom_smooth(method = "loess")` |
| Facet grid | `facet_grid(rows ~ cols)` |
| Facet wrap | `facet_wrap(~ var, ncol = k)` |
| Log scale | `scale_x_log10()` |
| Colorblind palette | `scale_color_viridis_d()` |
| Diverging fill | `scale_fill_distiller(palette = "RdBu")` |
| Flip coordinates | `coord_flip()` |
| Reorder factor | `reorder(factor, value)` |

## A.3 Bandwidth and Bin Width Formulas

| Rule | Formula | Notes |
|---|---|---|
| Sturges | \(k = \lceil \log_2 n \rceil + 1\) | Good for symmetric, unimodal |
| Scott | \(h = 3.49\hat\sigma n^{-1/3}\) | Optimal for normal |
| Freedman-Diaconis | \(h = 2 \cdot \text{IQR} \cdot n^{-1/3}\) | Robust to outliers |
| Silverman KDE | \(h = 1.06\hat\sigma n^{-1/5}\) | Gaussian kernel |

## A.4 Summary of Chart-Type Selection

| Data structure | Recommended chart | Alternatives |
|---|---|---|
| One quantitative variable | Histogram, KDE | Box plot, ECDF, Q-Q plot |
| One quantitative, comparing groups | Box plot, violin | Ridge plot, raincloud |
| Two quantitative variables | Scatter plot | Hexbin (large n), contour |
| One quantitative over time | Line chart | Area chart, step chart |
| Quantitative by category | Bar chart (sorted) | Dot plot, lollipop chart |
| Proportions of a whole | Stacked bar, waffle | Pie (≤5 categories) |
| Two categorical variables | Mosaic plot | Balloon plot, heatmap |
| Many quantitative variables | SPLOM, parallel coord | Heatmap (correlation) |
| Geographic data | Choropleth, sym map | Cartogram, dot density |
| Hierarchical quantities | Treemap | Nested bar, sunburst |
| Set intersections | UpSet plot | Venn (≤4 sets) |
| Model uncertainty | Error bars, CI band | Gradient interval, HOP |
| Feature importance | SHAP summary plot | PDP, coefficient plot |

## A.5 Key Vocabulary

<div class="definition">
<strong>Aesthetic (visual channel)</strong>: a visual property (position, color, size, shape) to which data is mapped.
</div>

<div class="definition">
<strong>Geom</strong>: the geometric object used to represent data in a plot (point, line, bar, polygon).
</div>

<div class="definition">
<strong>Scale</strong>: the function mapping data values to aesthetic values; must be one-to-one.
</div>

<div class="definition">
<strong>Facet</strong>: a panel in a small-multiples display. Each facet shows a subset of the data using an identical plot specification.
</div>

<div class="definition">
<strong>Overplotting</strong>: a condition in which multiple data points are rendered at the same location, obscuring their true density.
</div>

<div class="definition">
<strong>Proportional ink</strong>: the principle that graphical ink areas must be proportional to the data values they represent.
</div>

<div class="definition">
<strong>MAUP</strong>: Modifiable Areal Unit Problem — the dependence of spatial statistics on the choice of geographic aggregation units.
</div>

<div class="definition">
<strong>SHAP value</strong>: the Shapley additive explanation for one feature's contribution to one prediction, satisfying efficiency, symmetry, dummy, and additivity axioms.
</div>

<div class="definition">
<strong>Visual inference</strong>: a procedure that embeds a real plot among null-hypothesis decoys (a lineup) and uses the frequency of viewer selection to assess statistical significance visually.
</div>

<div class="definition">
<strong>Perceptual uniformity</strong>: a property of a color space where equal numeric differences correspond to equal perceived color differences. CIELAB and HCL are perceptually uniform; RGB is not.
</div>
