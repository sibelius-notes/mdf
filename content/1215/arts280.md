---
title: "ARTS 280: Statistics for Arts Students"
prof: "Warriner"
subjects: "ARTS"
---

# Primer on Statistical Notation

Before we dive into any actual statistics, let us address the elephant in the room — the one every new student drags into the lecture hall in the form of math anxiety. The instructor has heard it all: "I can't do math," "I've always been terrible at numbers," "I passed high school math but I honestly don't know how." After more than thirty years of teaching statistics to thousands of arts and business students at the University of Waterloo, the evidence is overwhelming: nearly every student admitted to a university program already possesses sufficient mathematical understanding to do well in ARTS 280. The rare failures are almost always a matter of falling behind on cumulative material, not a math skill deficit.

Here is the truth that too many textbooks obscure: ARTS 280 is not a math course in the traditional sense. It is not algebra, it is not geometry, and nobody is asking you to factor polynomials or prove anything. What statistics actually demands is **arithmetic** — adding, subtracting, multiplying, dividing, squaring numbers, and taking square roots, all done with a basic calculator that costs about ten dollars. The real challenge students face when first encountering statistical formulas is not the mathematics; it is the **notation**. Statistical notation is a specialized language unto itself that nobody taught you in high school. A formula looks terrifying when you don't know what the symbols mean. Once the notation is explained, the instructions become clear and the arithmetic almost takes care of itself.

<div class="definition"><strong>Statistical notation:</strong> The system of symbols used to express statistical formulas and operations. Because this notation is unique to statistics and not part of standard high school math curricula, unfamiliarity with it is the primary reason students feel mathematically underprepared — not any genuine lack of arithmetic ability.</div>

## The Mean as a First Example

Consider the <strong>mean</strong>, or arithmetic average. Everyone knows how to calculate an average — you add up all the scores and divide by how many there are. In statistical notation this is written:

\[
\bar{x} = \frac{\sum x_i}{N}
\]

Breaking this down: \(\bar{x}\) (called "x-bar") is the notation for the sample mean, the bar over any letter indicating an average. The capital Greek letter \(\Sigma\) (sigma) is the summation sign and means simply "add up everything that follows." The \(x_i\) refers to each individual score in the sample. Capital \(N\) is the total sample size. So the whole formula is just saying: add up all the individual scores and divide by the total number of scores. That is all an average is. The formula makes it look imposing, but the underlying instruction is something you have been doing since primary school.

Similarly, the <strong>standard deviation</strong> — the average spread of scores around the mean — is written:

\[
s_x = \sqrt{\frac{\sum (x_i - \bar{x})^2}{n - 1}}
\]

Again, this formula provides a set of instructions: for each score, find how far it sits from the mean, square that difference (to get rid of negative signs), add all those squared differences up, divide by \(n-1\), and take the square root to return to the original metric. Tedious? Perhaps. Mathematically sophisticated? Not at all.

## The Summation Sign

Because \(\Sigma\) appears in so many statistical formulas, it deserves special attention. Capital sigma means one thing and one thing only: <strong>add</strong>. When you see it followed by a quantity, you are being instructed to sum that quantity across all members of the sample. In formal notation, \(\sum_{i=1}^{n} x_i\) says to start at the first observation (\(i=1\)) and sum through to the last (\(i=n\)). In practice, in Arts 280, we will always be adding up everything in the sample, so the subscript and superscript on sigma become somewhat ceremonial. They will be progressively dropped as the course proceeds and the intent becomes obvious from context.

One important distinction: \(\sum x_i^2\) means "square each score and then add them all up," whereas \(\left(\sum x_i\right)^2\) means "add all the scores first and then square the total." These are not the same thing and this distinction comes up repeatedly when computing variances and other statistics.

## Statistical Notation Summary

Variables in statistical formulas are denoted by lowercase Roman letters, usually \(x\) or \(y\), where \(x\) most often represents the independent variable and \(y\) the dependent variable. Individual observations in the sample are denoted with a subscript \(i\), so \(x_i\) is the score of the \(i\)th person. When data are organized into subgroups, a second subscript \(j\) is used, so \(x_{ij}\) refers to a specific observation in a specific subgroup.

Sample statistics — quantities calculated from the data — use Roman letters: \(\bar{x}\) for the sample mean, \(s\) for the sample standard deviation, \(r\) for the correlation coefficient, and so on. Population parameters — the true values we are trying to estimate — use Greek letters: \(\mu\) (mu) for the population mean, \(\sigma\) (sigma) for the population standard deviation, and \(\rho\) (rho) for the population correlation. This distinction between sample statistics and population parameters runs through the entire course.

---

# Why Statistics? Introduction to the Field

## Why Arts Students Need Statistics

Statistics is required in a remarkably wide range of university programs — arts and business, knowledge integration, social development studies, sociology, economics, environmental science, health sciences, and many others. There is a good reason for this breadth. <strong>Statistics</strong> is the science of making sense of quantitative evidence, patterns, and trends. In virtually every career where decisions need to be justified and outcomes need to be evaluated, someone has to deal with numbers — and statistics is the toolkit for doing so responsibly.

If you are a humanities student wondering what statistics has to do with philosophy or fine arts, the practical answer is that most Arts students are also in Arts and Business, signaling an intent to work in an organizational context. Businesses, non-profits, governments, hospitals, and universities all generate data and make decisions based on it. Someone needs to assess consumer demand, measure customer satisfaction, track employee morale, distinguish demographic trends, evaluate program outcomes. Statistics is the tool for all of this. Even as a supervisor or manager rather than a hands-on analyst, you need enough statistical literacy to understand what a consultant's report is actually saying — and to know when it is misleading you.

Beyond career applications, statistical reasoning is essential for navigating modern life as an informed citizen. Every day we are confronted with polls, clinical trial results, economic forecasts, and social trend analyses. The ability to read these critically — to know whether a sample was large enough, whether causation has been confused with correlation, whether a percentage change is being reported on a misleadingly small base — is a form of literacy as important as reading and writing.

## The Three Branches of Statistics

All of statistics can be organized into three broad branches, each answering a different kind of question.

<div class="definition"><strong>Descriptive statistics:</strong> Procedures for summarizing and displaying data in order to reveal patterns within the particular sample that was collected. Descriptive statistics describe; they do not generalize.</div>

<div class="definition"><strong>Measures of association:</strong> Procedures that examine whether and how strongly two variables are related to one another within the data. These range from simple cross-tabular comparisons to correlation coefficients and regression models.</div>

<div class="definition"><strong>Inferential statistics:</strong> Procedures that use results from a sample to draw conclusions about the broader population from which that sample was drawn. Inference is what makes statistics scientifically powerful, because it allows us to learn about millions of people by studying only hundreds.</div>

In ARTS 280, all three branches are covered, roughly in this order. Descriptive statistics occupy the first several weeks. The logic of inference is then developed through probability theory and hypothesis testing. Measures of association appear throughout, most prominently in the regression and chi-square sections.

## The Research Cycle

Statistics does not operate in isolation. It fits within a broader <strong>research cycle</strong> that begins with <strong>problem formulation</strong> or theory, moves through <strong>data collection</strong>, <strong>analysis</strong>, and <strong>interpretation</strong>, and then feeds back into new questions and theories. Statistics sits at the analysis stage. Understanding this context matters because it clarifies what statistics can and cannot do: it can analyze information that has been collected, but it cannot compensate for a poorly designed study or a badly worded question. The quality of conclusions is bounded by the quality of the data.

## Populations and Samples

One of the most important conceptual distinctions in statistics is between a <strong>population</strong> and a <strong>sample</strong>.

<div class="definition"><strong>Population:</strong> The entire set of elements about which conclusions are desired. This could be all Canadian adults, all employees of a particular company, all sales transactions in a given quarter, or any other complete group of interest.</div>

<div class="definition"><strong>Sample:</strong> A subset of the population that is actually measured. Because studying an entire population is almost always prohibitively expensive or logistically impossible, research is conducted on samples with the goal of inferring population characteristics from sample results.</div>

A <strong>random sample</strong> is one in which every member of the population has a known, non-zero chance of being selected. Random sampling is the basis for legitimate inference, because it ensures that no systematic bias governs who ends up in the sample. Without random sampling, the connection between sample and population becomes scientifically dubious.

## Hypotheses, Variables, and Measurement Levels

A <strong>hypothesis</strong> in statistics is a testable proposition specifying a relationship between at least two variables. For example: "Fear of crime among Canadians will decrease as violent crime rates decline." This hypothesis involves two variables — fear of crime and violent crime rate. The <strong>independent variable</strong> is the one theorized to be doing the influencing (violent crime rate in this example), and the <strong>dependent variable</strong> is the outcome being influenced (fear of crime).

Data on variables can be measured at different levels, and these <strong>measurement levels</strong> are critically important because they determine which statistical procedures can legitimately be applied.

<div class="definition"><strong>Nominal level:</strong> Numbers (or labels) that distinguish qualitatively different categories with no implied ordering. Religion, region, and political party affiliation are nominal level variables. Arithmetic operations on these numbers are meaningless.</div>

<div class="definition"><strong>Ordinal level:</strong> Numbers that indicate rank order, but where the intervals between ranks are not necessarily equal. Likert-scale responses ("Strongly Agree" through "Strongly Disagree") and university rankings are ordinal. The numbers tell us ordering but not by how much.</div>

<div class="definition"><strong>Interval/Ratio level (continuous):</strong> Numbers that represent real quantities with meaningful and equal intervals. Age, income, temperature, and test scores measured in points are continuous level variables. The full range of arithmetic operations applies. Ratio level variables additionally have a true zero, but this distinction is generally set aside in introductory statistics, and both interval and ratio data are treated as "continuous."</div>

The difference between discrete (nominal and ordinal) and continuous data is like the difference between labeling and measuring. Every time you see a new statistical procedure in ARTS 280, the first question to ask is: what is the measurement level of the variables involved? The answer determines which test applies.

---

# The Research Process, Descriptive Statistics, and Frequency Distributions

## Descriptive Statistics: An Overview

Descriptive statistics is the first and most commonly encountered branch of statistics. Its purpose is to summarize and display data in ways that reveal patterns. These are the statistics you already encounter daily: bar charts in news reports, averages quoted in financial commentary, pie charts in annual reports. Descriptive statistics are tremendously useful, but carry one important limitation: they describe only the sample they are based on. They say nothing directly about the population.

The starting point for virtually all statistical work is the <strong>frequency distribution</strong> — a table or display showing how often each value of a variable occurs in the sample.

<div class="definition"><strong>Frequency distribution:</strong> A tabular or graphical arrangement showing each possible value (or range of values) of a variable alongside the count of observations taking that value.</div>

From the raw frequency counts, two derived measures are immediately useful. A <strong>relative frequency</strong> (or proportion) is the count for a category divided by the total sample size \(N\), giving a number between 0 and 1 that represents the fraction of the sample in that category. A <strong>percentage</strong> is simply the proportion multiplied by 100. When a variable has many possible values, constructing a grouped frequency distribution — combining adjacent values into intervals or classes — makes the distribution easier to interpret.

## Graphical Displays

For discrete-level variables (nominal and ordinal), the appropriate graphical display is typically a <strong>bar chart</strong>, in which separate, non-touching bars represent each category, with bar height proportional to frequency or percentage. A <strong>pie chart</strong> is an alternative for nominal data, partitioning a circle into slices proportional to each category's share of the total.

For continuous-level variables, the appropriate display is a <strong>histogram</strong>. Unlike a bar chart, histogram bars are adjacent to one another, reflecting the fact that the underlying variable is continuous — there are no natural gaps between the intervals. The width of each bar reflects the class interval, and the area of each bar is proportional to the frequency of observations in that interval. A related display is the <strong>frequency polygon</strong>, which connects the midpoints of each bar's top edge with straight line segments, providing a smoother representation of the distribution's shape.

A <strong>stem-and-leaf plot</strong> is a particularly useful hybrid display that retains the original data values while also showing the overall shape of the distribution. Each observation is split into a "stem" (typically the leading digit or digits) and a "leaf" (the final digit), allowing the full data set to be reconstructed from the display.

For comparing two discrete variables simultaneously, a <strong>cross-tabular (contingency) table</strong> cross-matches the categories of both variables in a grid, with cell entries being the count of observations meeting both conditions. The conventional arrangement in ARTS 280 places the dependent variable as the row variable and the independent variable as the column variable, with percentages computed within each column (i.e., within each category of the independent variable) to allow comparison across groups.

## Percentage Change, Ratios, and Rates

Beyond simple frequencies and proportions, descriptive statistics includes several tools for comparing quantities across groups or over time.

<strong>Percentage change</strong> measures how much a quantity has shifted from one time period (or group) to another. It is calculated as:

\[
\%\Delta = \frac{x_{\text{later}} - x_{\text{earlier}}}{x_{\text{earlier}}} \times 100
\]

A <strong>ratio</strong> expresses the relative size of two quantities — for instance, the number of young adult offenders for every older adult offender. Ratios are purely comparative and do not involve population size.

A <strong>rate</strong> standardizes a count relative to some base population, typically expressed per 1,000 or per 100,000 members of that population. Rates are essential for making valid comparisons between groups of very different sizes — the sheer count of crimes in Ontario will always exceed that in Prince Edward Island simply because Ontario has far more people.

---

# Central Tendency — The Four Moments of a Distribution

## The Moments of a Distribution

No single number perfectly captures an entire distribution, but statisticians have identified four dimensions — called the <strong>moments of the distribution</strong> — that together provide a comprehensive description of its shape and characteristics.

The four moments are: (1) <strong>central tendency</strong>, (2) <strong>dispersion</strong>, (3) <strong>skewness</strong>, and (4) <strong>kurtosis</strong>. Central tendency and dispersion are by far the most important and are used in virtually every statistical procedure in the course. Skewness is easy to compute and provides useful additional information. Kurtosis — the degree to which a distribution is flat or peaked — is definitionally important but not calculated by hand in ARTS 280.

## Measures of Central Tendency

Central tendency refers to the single most representative score in a distribution — the score that best stands in for the whole distribution when you can only report one number.

<div class="definition"><strong>Mode:</strong> The score or category associated with the highest frequency. It is the only measure of central tendency that can be applied to nominal level data. Its weakness is that many distributions have more than one mode (bimodal or multimodal), and in continuous distributions the mode can be highly sensitive to minor fluctuations in frequency.</div>

<div class="definition"><strong>Median:</strong> The middle score when all observations are arranged in order. Exactly half of the observations fall above it and half below. For an odd number of observations, the median is simply the middle value; for an even number, it is the average of the two middle values. The median is appropriate for ordinal level data and above, and is preferred over the mean when a distribution is heavily skewed, since extreme scores do not affect its value.</div>

<div class="definition"><strong>Mean:</strong> The arithmetic average, computed as the sum of all scores divided by the number of scores: \(\bar{x} = \frac{\sum x_i}{N}\). The mean is appropriate only for continuous (interval/ratio) data. It is the preferred measure of central tendency for inferential statistics because it is the most statistically efficient — it accounts for every score and its exact value, minimizing sampling bias relative to the population mean \(\mu\).</div>

The mean is preferred for three reasons: <strong>bias</strong> (the sample mean tends to be closer to the population mean than the sample median or mode), <strong>efficiency</strong> (deviations of sample means from the population mean tend to be smaller), and <strong>consistency</strong> (sample means converge on the population mean as sample size increases). For these reasons, whenever a variable is continuous, the mean is used as the starting point for almost all inferential tests.

One important practical note: the mean is sensitive to <strong>outliers</strong> — extreme scores that pull it toward them. An income distribution in which most people earn between \$30,000 and \$80,000 but a handful earn tens of millions will have a mean substantially above what most individuals actually earn. In such cases the median is a more representative measure of what a "typical" person experiences.

---

# Research Questions, Hypotheses, and Measurement

## Hypotheses and Research Questions

Research questions in the social sciences, business, and related fields are typically derived from theory or existing observation. Basil Bernstein's theory of restricted and elaborated learning codes — proposed to explain why middle-class children in 1960s Britain tended to outperform working-class children academically — is a classic example. From such a theoretical proposition, a researcher derives specific, testable predictions about the relationship between measurable variables.

In statistics, research questions are formalized as <strong>statistical hypotheses</strong>. The convention is to always work with exactly two hypotheses: the <strong>null hypothesis</strong> and the <strong>alternative hypothesis</strong>.

<div class="definition"><strong>Null hypothesis (\(H_0\)):</strong> The default assumption that nothing is happening at the population level — no difference, no relationship, no change. Any observed pattern in the sample is attributed entirely to sampling error. The null hypothesis is what we assume to be true unless the data provide sufficient evidence to doubt it.</div>

<div class="definition"><strong>Alternative hypothesis (\(H_1\)):</strong> The research hypothesis, reflecting what we actually expect to be true based on theory. It states that a difference or relationship does exist at the population level. The alternative hypothesis is accepted only if the null hypothesis is rejected.</div>

This pairing is not optional or arbitrary — it is the logical structure of all inferential testing. There are always exactly two hypotheses: the null and the alternative. They must together cover all possible situations without ambiguity.

## Measurement Levels Redux

Understanding measurement levels is so fundamental to choosing the correct statistical test that the point is worth reinforcing. The overarching distinction is between <strong>discrete</strong> (nominal and ordinal) and <strong>continuous</strong> (interval and ratio) measurement. Discrete variables limit the mathematical operations available; you cannot meaningfully compute an average region of residence or an average political party. Continuous variables open up the full range of arithmetic, including means, variances, and standard deviations.

Throughout the remainder of ARTS 280, measurement level will be the first question to ask when confronted with any new statistical situation. It determines whether a mode or mean is appropriate, whether a bar chart or histogram is correct, and whether a chi-square test or a t-test is required.

---

# Dispersion — Variance and Standard Deviation

## Why Dispersion Matters

Two distributions can have identical means yet be profoundly different in character if one is tightly clustered around the mean while the other is spread out widely. Imagine Canada and the United States having similar average scores on a survey of support for social equality, but with much wider disagreement within the United States. The typical score tells only half the story; the spread around that score tells the other half.

<div class="definition"><strong>Dispersion:</strong> The degree to which scores are spread out across the range of possible values rather than being concentrated around a central point. Higher dispersion means more variability; lower dispersion means more homogeneity.</div>

## Measures of Dispersion for Discrete Data

For nominal level variables, the <strong>Index of Diversity</strong> (ID) measures how spread out observations are across categories. If everyone in the sample fell into a single category, the ID would equal zero (no diversity). If observations were spread perfectly evenly across all categories, the ID would approach its maximum value near 1. A variant, the <strong>Index of Qualitative Variation</strong> (IQV), standardizes the ID by dividing it by its theoretical maximum, producing a value between 0 and 1 regardless of the number of categories, which facilitates comparison across variables with different numbers of groups.

## Measures of Dispersion for Continuous Data

For continuous variables, the most important measures of dispersion are the <strong>variance</strong> and its square root, the <strong>standard deviation</strong>.

The computational path to the variance begins with the concept of a <strong>deviation score</strong>: the distance of each individual observation from the mean, expressed as \((x_i - \bar{x})\). Summing these deviations directly produces zero (because positive and negative deviations cancel), which is why they are squared before summing.

<div class="definition"><strong>Variance (\(s^2\)):</strong> The average of the squared deviation scores:

\[
s^2 = \frac{\sum (x_i - \bar{x})^2}{n - 1}
\]
The denominator is \(n-1\) rather than \(n\) because this produces an unbiased estimate of the population variance \(\sigma^2\).</div>

<div class="definition"><strong>Standard deviation (\(s\)):</strong> The square root of the variance:

\[
s = \sqrt{\frac{\sum (x_i - \bar{x})^2}{n-1}}
\]
Taking the square root returns the measure to the original units of the variable. The standard deviation can be interpreted as the average distance of observations from the mean.</div>

An alternative computational formula that avoids calculating deviation scores explicitly is:

\[
s^2 = \frac{\sum x_i^2 - \frac{(\sum x_i)^2}{n}}{n-1}
\]

This is arithmetically equivalent to the definitional formula and often easier to apply to larger data sets using a calculator's memory function.

For grouped data (where scores have been organized into class intervals), weighted versions of both the mean and the variance are required, multiplying each interval's midpoint by the frequency of observations in that interval before summing.

---

# Graphical Displays for Continuous Data

## Grouped Frequency Distributions and Histograms

When a continuous variable has many distinct values — income to the nearest dollar, age to the nearest year, hours of television watched per week — it is usually necessary to group the data into intervals before constructing a display. The goal is to choose a number of class intervals (typically somewhere between five and fifteen) that is small enough to reveal overall patterns but large enough to preserve meaningful variation.

Each class interval has a <strong>lower class limit</strong>, an <strong>upper class limit</strong>, a <strong>midpoint</strong>, and, importantly, a <strong>true lower limit</strong> and <strong>true upper limit</strong> that close the gap between adjacent intervals. The true limits extend halfway to the next class boundary, ensuring that no score falls between intervals.

A histogram constructed from grouped continuous data differs from a bar chart in that the bars touch one another — there are no gaps between classes because the underlying variable is continuous. The area of each bar represents the proportion of the total sample falling in that interval.

## Distribution Shapes

Histograms and frequency polygons reveal the <strong>shape</strong> of a distribution, which is itself meaningful statistical information. The key dimensions of shape relate to the third and fourth moments of the distribution.

<strong>Skewness</strong> describes asymmetry. A <strong>positively skewed</strong> distribution has a long right tail — most observations cluster at the lower values with a few extreme high values (income in most countries is a classic example). A <strong>negatively skewed</strong> distribution has a long left tail — most observations cluster at higher values with a few extreme low values (age in aging populations like contemporary Canada tends toward negative skew). In a skewed distribution, the mean is pulled toward the tail, making it a less representative summary than the median.

<strong>Kurtosis</strong> describes whether the distribution is sharply peaked with thin tails (<strong>leptokurtic</strong>) or flat with heavy tails (<strong>platykurtic</strong>), relative to a normal distribution (<strong>mesokurtic</strong>). This is definitional knowledge in ARTS 280 rather than a calculation you will be asked to perform.

The idealized shape underlying most of inferential statistics is the <strong>normal distribution</strong> — perfectly symmetric, unimodal, and bell-shaped — which will occupy center stage from Module 3 onwards.

---

# Rates, Ratios, and Percentage Change in Practice

The application of percentage change, ratios, and rates to real-world data illuminates how seemingly abstract formulas produce actionable insight. Using data from Canadian criminal offences (2008–2009), consider the question of how crime patterns shift across age groups.

A percentage change calculation comparing total offences committed by young adults (ages 18–24) versus older adults (ages 55 and above) reveals the dramatic decline in criminal activity that accompanies aging — a long-documented criminological phenomenon. To compute this:

\[
\%\Delta = \frac{\text{older adults} - \text{young adults}}{\text{young adults}} \times 100
\]

The result is a large negative percentage, confirming that older adults commit substantially fewer crimes than their younger counterparts. But this comparison conflates two things: age effects on criminal propensity and the different sizes of these age groups in the Canadian population. This is precisely where rates become essential. Expressing offences per 100,000 population in each age group removes the size difference and isolates the actual risk by age. The resulting comparison is far more analytically valid and interpretable.

---

# Z-Scores, Skewness, Percentiles, and Boxplots

## Z-Scores and Standardization

One of the most important transformations in all of statistics is the conversion of raw scores into <strong>z-scores</strong>, also called standardized scores.

<div class="definition"><strong>Z-score:</strong> A standardized expression of a raw score indicating how many standard deviations above or below the mean the score falls:

\[
z = \frac{x_i - \bar{x}}{s}
\]
Positive z-scores indicate scores above the mean; negative z-scores indicate scores below the mean. The magnitude indicates distance from the mean in standard deviation units.</div>

The transformative property of z-scores is that any continuous distribution, regardless of its original units, becomes a <strong>z-distribution</strong> with a mean of zero and a standard deviation (and variance) of one. This common metric allows three powerful uses:

First, <strong>comparing across different scales</strong>: A student scoring 75 on an exam with a mean of 70 and standard deviation of 10 has a z-score of 0.5. Another student scoring 55 on an exam with a mean of 40 and standard deviation of 20 has a z-score of 0.75. Despite scoring lower in absolute terms, the second student performed better relative to their peers.

Second, <strong>combining different scales</strong>: To create a composite score combining income (in thousands of dollars) and years of education, simply adding the two would be meaningless because they have wildly different scales and units. Converting both to z-scores first and then adding produces a fair composite that weights each dimension equally.

Third, and most importantly for inferential statistics: <strong>estimating exact probabilities</strong> when the underlying distribution is normal. This application will be developed fully in the probability lessons.

## Skewness

The formula for the <strong>skewness coefficient</strong> is:

\[
\text{Skewness} = \frac{N \sum (x_i - \bar{x})^3}{(N-1)(N-2)s^3}
\]

A skewness of zero indicates a perfectly symmetrical distribution. Positive values indicate a positive (right) skew; negative values indicate a negative (left) skew. In a skewed distribution, the mean, median, and mode will not coincide: in a positively skewed distribution the mode is lowest, then the median, and the mean is pulled highest by the long right tail.

## Percentiles and Boxplots

A <strong>percentile</strong> indicates the value below which a specified percentage of observations fall. The 50th percentile is, by definition, the median. The 25th percentile is the <strong>first quartile</strong> (\(Q_1\)) and the 75th percentile is the <strong>third quartile</strong> (\(Q_3\)).

The <strong>interquartile range (IQR)</strong> is the distance between the first and third quartiles: \(\text{IQR} = Q_3 - Q_1\). It represents the spread of the middle 50 percent of the data and is resistant to the influence of extreme values.

A <strong>boxplot</strong> (box-and-whisker plot) provides a compact graphical summary using five statistics: the minimum, \(Q_1\), the median, \(Q_3\), and the maximum. The box spans from \(Q_1\) to \(Q_3\) with a line at the median. Whiskers extend to the most extreme non-outlier values. Points beyond 1.5 times the IQR from either quartile are plotted individually as suspected outliers. Boxplots are particularly useful for comparing distributions across groups at a glance.

---

# Probability — The Bridge to Inference

## Why Probability?

Descriptive statistics can only describe the sample at hand. Inferential statistics aims to draw conclusions about the population. The bridge between sample and population is <strong>probability</strong>, because inference ultimately requires answering the question: how likely is it that the pattern I see in my sample is merely a chance result of the particular sample I happened to draw, rather than a real pattern in the population?

<div class="definition"><strong>Probability:</strong> A number between 0 and 1 (or equivalently, between 0% and 100%) expressing the likelihood of a particular outcome occurring. It is computed as the number of ways the outcome of interest can occur divided by the total number of possible outcomes in the universe of possibilities.</div>

Probability is less about mathematics than about logical reasoning. The primary task is to correctly enumerate the total number of possible outcomes and then count how many of those correspond to the event of interest. Once those two counts are available, the probability is just their ratio — a proportion.

## Empirical and Theoretical Probability Distributions

An <strong>empirical probability distribution</strong> is simply the relative frequency distribution derived from a sample. If a fair six-sided die is thrown 30 times, the observed proportions for each face constitute an empirical probability distribution. In the short run, due to sampling variability, these proportions will not be perfectly equal even for a fair die.

A <strong>theoretical probability distribution</strong>, by contrast, is the idealized distribution of outcomes we would expect based on the known properties of the process. For a fair six-sided die, the theoretical probability is 1/6 for each face. As the number of trials increases toward infinity, the empirical distribution converges on the theoretical distribution — this is the basis of the <strong>law of large numbers</strong>.

The connection to statistics: when we draw a random sample from a population, the sample's frequency distribution is an empirical probability distribution. The question of inference is whether the empirical distribution from our sample is consistent with a particular theoretical distribution assumed for the population.

## Chebyshev's Theorem

Even when the shape of a population distribution is completely unknown, <strong>Chebyshev's theorem</strong> guarantees that for any distribution, at least \(1 - \frac{1}{k^2}\) of observations fall within \(k\) standard deviations of the mean. For \(k = 2\), at least 75% of observations fall within two standard deviations of the mean; for \(k = 3\), at least 89%.

The theorem is remarkable in requiring no assumptions about distributional shape. However, it provides only a lower bound on probability (a range), not an exact probability. More precise probability estimation requires additional assumptions about distributional shape.

---

# The Normal Distribution and Exact Probabilities

## The Normal Distribution

The <strong>normal distribution</strong> is the most important theoretical probability distribution in statistics. It is:

- <strong>Unimodal</strong>: One peak in the center
- <strong>Symmetrical</strong>: Perfectly balanced around the mean
- <strong>Bell-shaped</strong>: With tails that extend toward (but never reach) zero in either direction

Because of its symmetry, in a perfectly normal distribution the mean, median, and mode all coincide at the center.

<div class="definition"><strong>Normal distribution:</strong> A theoretical probability distribution specified entirely by two parameters: its mean \(\mu\) and its standard deviation \(\sigma\). Any normally distributed variable can be transformed to a standard normal distribution with mean zero and standard deviation one via the z-score transformation.</div>

The <strong>standard normal distribution</strong> is the normal distribution with \(\mu = 0\) and \(\sigma = 1\). Statistical tables (Appendix A in the course notes) tabulate exact probabilities — specifically, the proportion of the area under the normal curve — for every possible z-score value. For example, approximately 68% of observations in a normal distribution fall within one standard deviation of the mean, approximately 95% within two standard deviations, and approximately 99.7% within three standard deviations.

Once a raw score has been converted to a z-score, Appendix A provides the exact probability of observing a score that extreme (or more extreme) under the assumption that the population is normally distributed.

---

# Sampling Distributions and the Central Limit Theorem

## The Sampling Problem

The fundamental problem of inference is this: any one sample drawn from a large population will, due to random variation, misrepresent the population to some degree. This misrepresentation is called <strong>sampling error</strong> — not an error in the sense of a mistake, but the unavoidable discrepancy between a sample statistic and the corresponding population parameter.

<div class="definition"><strong>Sampling error:</strong> The degree to which a sample statistic (such as the sample mean \(\bar{x}\)) departs from the corresponding population parameter (such as the population mean \(\mu\)) due to random variation in the selection of sample members.</div>

Larger samples have less sampling error on average, but even large samples are not immune. Statistical inference provides a principled way to account for sampling error rather than pretending it does not exist.

## The Central Limit Theorem

Here is where things get genuinely remarkable. The <strong>Central Limit Theorem (CLT)</strong> is arguably the most important result in all of statistics, and it states:

<div class="definition"><strong>Central Limit Theorem:</strong> Regardless of the shape of the population distribution, the sampling distribution of sample means based on samples of sufficiently large size (generally \(n \geq 30\)) will be approximately normally distributed with:
<ul style="margin-top: 0.5em;">
<li>Mean equal to the population mean \(\mu\)</li>
<li>Standard deviation (called the <strong>standard error</strong>) equal to \(\sigma / \sqrt{n}\)</li>
</ul>
</div>

The critical insight is the word "regardless." Even if the original variable is not normally distributed — say, income, which is positively skewed in every country — the distribution of all possible sample means based on samples of size 100 drawn from that population will be essentially normal. This means that whenever we are asking questions about **means**, we can always use the properties of the normal distribution to calculate exact probabilities, no matter what the underlying variable looks like.

The **standard error** (SE) of the mean is:

\[
\text{SE} = \frac{\sigma}{\sqrt{n}}
\]

When the population standard deviation \(\sigma\) is unknown (which it almost always is in practice), it is estimated by the sample standard deviation \(s\), and this is permissible when the sample is large:

\[
\hat{\text{SE}} = \frac{s}{\sqrt{n}}
\]

The standard error decreases as sample size increases — larger samples produce more precise estimates of the population mean, as intuition would suggest.

---

# Probability Distributions and the Logic of Inference

## From Empirical to Theoretical

The CLT provides the justification for using the theoretical normal distribution to answer probability questions about sample means. The logic is as follows. We draw a sample of size \(n\) and compute the sample mean \(\bar{x}\). We want to know how likely we are to observe a mean this far from some hypothesized population mean, if that hypothesis is in fact true. By the CLT, we know the sampling distribution of means is normal with mean \(\mu\) and standard error \(\sigma/\sqrt{n}\). We therefore compute a z-score for our sample mean:

\[
z = \frac{\bar{x} - \mu}{\sigma / \sqrt{n}}
\]

And then use Appendix A to find the exact probability corresponding to that z-score. A small probability means an unusual result under the null hypothesis; a large probability means our observed result is quite compatible with the null hypothesis.

## Types I and II Errors

Statistical decisions involve a binary choice: reject the null hypothesis, or fail to reject it. Because this decision is based on probabilistic evidence rather than certainty, two types of mistakes are possible.

<div class="definition"><strong>Type I error (false positive):</strong> Rejecting the null hypothesis when it is actually true. The probability of committing a Type I error is controlled by the analyst through the choice of <strong>significance level</strong> (\(\alpha\)), typically set at 0.05 or 0.01. A significance level of 0.05 means we are willing to accept a 5% chance of incorrectly rejecting a true null hypothesis.</div>

<div class="definition"><strong>Type II error (false negative):</strong> Failing to reject the null hypothesis when it is actually false. The probability of a Type II error is denoted \(\beta\). The <strong>power</strong> of a test is \(1 - \beta\), representing the probability of correctly detecting a real effect.</div>

There is an inherent trade-off between the two: reducing \(\alpha\) (being more conservative about rejecting the null) increases \(\beta\) (more likely to miss a real effect). In practice, the conventional significance levels of 0.05 and 0.01 represent a balance between these concerns that has become standard across social and business sciences.

## One-Tailed and Two-Tailed Tests

When the alternative hypothesis simply states that the population parameter differs from the null value (either direction), the test is <strong>two-tailed</strong> and the rejection region is split equally between both tails of the sampling distribution. When theory or prior evidence justifies predicting a specific direction of difference, the test is <strong>one-tailed</strong> and the entire rejection region is placed in the predicted tail.

The critical values for two-tailed tests at the 95% confidence level are \(z = \pm 1.96\), and at 99% confidence are \(z = \pm 2.576\). For one-tailed tests at the same confidence levels, these become \(z = 1.645\) and \(z = 2.326\) respectively.

---

# The Normal Distribution and Probabilities in Practice

## Using Appendix A

Appendix A of the course notes tabulates the area under the standard normal curve between the mean (z = 0) and any specified positive z-value. Because the distribution is symmetric, the same table serves for negative z-values by symmetry. Areas in the tails — the probabilities of obtaining a value as extreme as or more extreme than a given z — are found by subtracting tabulated areas from 0.50.

For example, to find the probability that a randomly selected NHL player earns a salary more than 2 standard deviations above the mean: Appendix A gives the area from 0 to \(z = 2.00\) as 0.4772, so the area above \(z = 2.00\) is \(0.5000 - 0.4772 = 0.0228\). Approximately 2.3% of players earn that much above average.

## The t-Distribution

When sample size is small (generally \(n < 30\)) and/or the population standard deviation is unknown, the CLT cannot be invoked. The sampling distribution of the mean in these circumstances is not the standard normal but rather the <strong>t-distribution</strong>, a family of symmetric bell-shaped distributions that differ from the normal in having heavier tails — they spread out more probability into the extreme regions, reflecting the greater uncertainty that comes with small samples.

<div class="definition"><strong>t-distribution:</strong> A family of theoretical probability distributions parameterized by <strong>degrees of freedom</strong> (\(df\)). As degrees of freedom increase (i.e., as sample size increases), the t-distribution approaches the standard normal distribution. Critical values from the t-distribution are larger than their normal counterparts, meaning it is harder to reject the null hypothesis with small samples.</div>

Degrees of freedom for a one-sample t-test are \(df = n - 1\). Critical values are obtained from Appendix B (the t-table) using the appropriate degrees of freedom and chosen significance level.

---

# Lesson 14 and 15: Hypothesis Testing Framework

## Setting Up Statistical Hypotheses

Before any inferential test can be conducted, the hypotheses must be formalized in statistical notation. For a single-sample test about a population mean, the null hypothesis takes the form \(H_0: \mu = \mu_0\), where \(\mu_0\) is the specific value being tested (often the historical average or the value expected under no change). The alternative hypothesis is either \(H_1: \mu \neq \mu_0\) (two-tailed) or \(H_1: \mu > \mu_0\) or \(H_1: \mu < \mu_0\) (one-tailed, depending on the theoretical prediction).

## The Four Steps of Hypothesis Testing

Every significance test in ARTS 280 follows the same four-step structure:

<strong>Step 1:</strong> State the null hypothesis (\(H_0\)) and the alternative hypothesis (\(H_1\)), specifying whether the test is one-tailed or two-tailed.

<strong>Step 2:</strong> Calculate the <strong>test statistic</strong> — a standardized value expressing how far the sample result departs from what the null hypothesis predicts, relative to the expected sampling variability.

<strong>Step 3:</strong> Determine the <strong>critical value</strong> from the appropriate sampling distribution (z, t, F, or chi-square) at the chosen significance level (\(\alpha\)).

<strong>Step 4:</strong> Make a <strong>decision</strong>: if the test statistic falls in the rejection region (beyond the critical value), reject \(H_0\) and conclude in favour of \(H_1\) with \((1 - \alpha) \times 100\%\) confidence. If not, fail to reject \(H_0\).

It cannot be overstated: failing to reject the null hypothesis does not prove it is true. Statistics never proves; it either provides grounds for rejection or fails to do so.

---

# Confidence Intervals

## The Logic of Confidence Intervals

A <strong>point estimate</strong> — the sample mean or sample proportion — provides a single best guess for the population parameter, but without any indication of how precise that guess is. A <strong>confidence interval</strong> improves on this by providing a range of plausible values for the population parameter along with a stated level of confidence.

<div class="definition"><strong>Confidence interval:</strong> An interval computed from sample data within which the population parameter is estimated to fall with a specified probability (the confidence level, typically 95% or 99%). The interval is centered on the point estimate and extends a certain distance on either side based on the standard error and the appropriate critical value.</div>

For a large-sample confidence interval for the population mean \(\mu\):

\[
\bar{x} \pm z^* \cdot \frac{s}{\sqrt{n}}
\]

where \(z^*\) is the critical value from the standard normal distribution (1.96 for 95% confidence, 2.576 for 99% confidence).

For a small-sample confidence interval for \(\mu\), replace \(z^*\) with \(t^*\), the critical value from the t-distribution with \(n-1\) degrees of freedom:

\[
\bar{x} \pm t^* \cdot \frac{s}{\sqrt{n}}
\]

Confidence intervals are widely reported in survey research and political polling. When a news outlet reports that "47% of Canadians support the policy, plus or minus 3 percentage points, 19 times out of 20," they are reporting a 95% confidence interval for the population proportion.

There is an important relationship between confidence and precision: widening the confidence level (from 95% to 99%) necessarily widens the interval, making it less precise. Narrowing the interval (increasing precision) requires either accepting a lower confidence level or collecting a larger sample.

---

# Z-Significance Tests

## Significance Tests for a Single Mean (Z-test)

The Z-significance test asks: what is the probability of observing a sample mean as extreme as \(\bar{x}\) if the null hypothesis value \(\mu_0\) is the true population mean? If this probability (the <strong>p-value</strong>) is small enough — specifically, below the chosen \(\alpha\) — we reject the null hypothesis.

The test statistic is:

\[
z = \frac{\bar{x} - \mu_0}{s / \sqrt{n}}
\]

This converts the sample mean into a z-score expressing how many standard errors it sits above or below the hypothesized population mean. If the null hypothesis is true, this z-score should be close to zero. If it falls in the extreme tails, the null hypothesis becomes implausible.

<strong>Example</strong>: Statistics Canada records that before new mortgage restrictions, the average days a home remained on the market across Canada was 42 days. Following the new restrictions, a random sample of 300 home sales shows an average of 49 days with a standard deviation of 60 days. Testing \(H_0: \mu = 42\) against \(H_1: \mu > 42\) (one-tailed):

\[
z = \frac{49 - 42}{60/\sqrt{300}} = \frac{7}{3.46} = 2.02
\]

The critical value for a one-tailed test at \(\alpha = 0.05\) is 1.645. Since 2.02 > 1.645, we reject \(H_0\) and conclude with 95% confidence that homes are staying on the market longer, consistent with the hypothesis that the credit restrictions are cooling the housing market.

## Significance Tests for Proportions

For a population proportion \(\pi\), the null hypothesis takes the form \(H_0: \pi = \pi_0\) and the test statistic is:

\[
z = \frac{p - \pi_0}{\sqrt{\pi_0(1 - \pi_0)/n}}
\]

where \(p\) is the sample proportion. The same z-distribution and critical values apply.

---

# Lesson 18 and 19: Two-Sample Tests — Z and T Tests for Differences of Means

## Comparing Two Groups

Many research questions involve comparing two groups: Are female and male graduates earning different average salaries? Do apps designed for business generate more revenue than gaming apps? Do students in the new curriculum perform better on standardized tests than students in the old curriculum?

These are <strong>difference of means</strong> questions. The null hypothesis for such tests is almost invariably:

\[
H_0: \mu_1 = \mu_2 \quad \text{(equivalently, } \mu_1 - \mu_2 = 0\text{)}
\]

The alternative is either \(H_1: \mu_1 \neq \mu_2\) (two-tailed) or directional (one-tailed) if theory predicts which group will be higher.

## The Z-test for the Difference of Means (Large Samples)

When both samples are large (\(n_1 + n_2 \geq 100\)), the test statistic is:

\[
z = \frac{\bar{x}_1 - \bar{x}_2}{\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}}
\]

The denominator is the combined standard error for the two samples. The same Appendix A critical values apply: \(\pm 1.96\) for a two-tailed test at 95% confidence, etc.

## The T-test for the Difference of Means (Small Samples, Independent Groups)

When the combined sample size is below 100, a t-test is required. In addition to small sample size, the t-test for the difference of means assumes:

1. The two samples are <strong>independent</strong> (not matched, not repeated measures)
2. Both populations are normally distributed
3. <strong>Homoscedasticity</strong>: the two populations have equal variance, \(\sigma_1^2 = \sigma_2^2 = \sigma^2\)

The homoscedasticity assumption is consequential: it means the two sample variances must be <strong>pooled</strong> into a single estimate of the common variance before computing the standard error:

\[
s_p^2 = \frac{(n_1 - 1)s_1^2 + (n_2 - 1)s_2^2}{n_1 + n_2 - 2}
\]

The test statistic is then:

\[
t = \frac{\bar{x}_1 - \bar{x}_2}{s_p\sqrt{\frac{1}{n_1} + \frac{1}{n_2}}}
\]

with degrees of freedom \(df = n_1 + n_2 - 2\). Critical values are obtained from Appendix B (the t-table).

## The Paired T-Test (Dependent Samples)

When the two samples are not independent — for example, when measuring the same individuals before and after a treatment, or when comparing matched pairs — the appropriate test is the <strong>paired t-test</strong> (also called the dependent samples t-test or matched pairs t-test).

The procedure is to compute the <strong>difference score</strong> \(d_i = x_{1i} - x_{2i}\) for each pair, then apply the one-sample t-test to the set of difference scores:

\[
t = \frac{\bar{d}}{s_d / \sqrt{n}}
\]

where \(\bar{d}\) is the mean difference, \(s_d\) is the standard deviation of the differences, and \(n\) is the number of pairs. Degrees of freedom are \(df = n - 1\). The paired design is preferred when pairing can substantially reduce variability, increasing the power of the test.

---

# One-Way ANOVA

## Comparing Three or More Groups

When the research question involves comparing means across three or more groups — retail sales across five Canadian regions, average income across several ethnic groups, job satisfaction across four industry sectors — the appropriate test is <strong>Analysis of Variance (ANOVA)</strong>.

<div class="definition"><strong>One-Way ANOVA:</strong> A significance test for comparing means across three or more groups defined by a multi-categorical nominal-level independent variable, with a continuous-level dependent variable. The test determines whether at least one of the group means differs significantly from at least one other at the population level.</div>

The ANOVA hypotheses are:

\[
H_0: \mu_1 = \mu_2 = \cdots = \mu_k
\]

\[
H_1: \mu_i \neq \mu_j \text{ for at least one pair } (i, j)
\]

The alternative hypothesis is always non-directional in ANOVA — we are not predicting which specific group will be highest, only that the groups are not all equal.

## Partitioning the Sum of Squares

ANOVA's logic hinges on partitioning the total variability in the dependent variable into two sources.

<div class="definition"><strong>Total Sum of Squares (SST):</strong> The total variability across all observations, measuring how much each observation deviates from the overall (grand) mean:

\[
SS_T = \sum_{j=1}^{k}\sum_{i=1}^{n_j}(x_{ij} - \bar{x})^2
\]
</div>

<div class="definition"><strong>Between-Groups Sum of Squares (SSB):</strong> The variability due to differences between group means, measuring how much each group mean deviates from the grand mean:

\[
SS_B = \sum_{j=1}^{k} n_j(\bar{x}_j - \bar{x})^2
\]
</div>

<div class="definition"><strong>Within-Groups Sum of Squares (SSW):</strong> The variability due to differences within groups, measuring how much individual scores deviate from their own group mean:

\[
SS_W = \sum_{j=1}^{k}\sum_{i=1}^{n_j}(x_{ij} - \bar{x}_j)^2
\]
</div>

The fundamental identity: \(SS_T = SS_B + SS_W\). The F-statistic is the ratio of between-groups variance (mean square between) to within-groups variance (mean square within):

\[
F = \frac{SS_B / (k-1)}{SS_W / (N-k)} = \frac{MS_B}{MS_W}
\]

A large F-value indicates that between-group differences are large relative to within-group variability, providing evidence against the null hypothesis. Critical values come from the F-distribution (Appendix B), indexed by degrees of freedom in the numerator (\(k-1\)) and denominator (\(N-k\)).

## Eta-Squared: Effect Size for ANOVA

Statistical significance tells us whether the group differences are real at the population level; it does not tell us how strong or important the relationship is. The <strong>effect size</strong> measure for ANOVA is <strong>eta-squared</strong>:

\[
\eta^2 = \frac{SS_B}{SS_T}
\]

Eta-squared represents the proportion of total variance in the dependent variable explained by the independent variable. A value of 0.20 means the grouping variable accounts for 20% of the variance in the outcome — quite a substantial effect in most social science contexts.

---

# Lessons 21–24: Regression and Correlation

## Bivariate Regression

<strong>Regression analysis</strong> examines the causal relationship between a continuous-level independent variable (\(x\)) and a continuous-level dependent variable (\(y\)). The <strong>simple regression model</strong> (one independent variable) specifies:

\[
y_i = \alpha + \beta x_i + \varepsilon_i
\]

where \(\alpha\) is the <strong>intercept</strong> (the population value of \(y\) when \(x = 0\)), \(\beta\) is the <strong>slope</strong> (the expected change in \(y\) per unit increase in \(x\)), and \(\varepsilon_i\) is the <strong>error term</strong> (the deviation of the actual observation from the model's prediction). At the sample level, the model is estimated as:

\[
\hat{y}_i = a + b x_i
\]

where \(a\) is the sample intercept and \(b\) is the sample slope. The difference between an observed value and its predicted value, \(e_i = y_i - \hat{y}_i\), is called a <strong>residual</strong>.

## Calculating the Regression Statistics

The slope and intercept are calculated using the <strong>method of ordinary least squares (OLS)</strong>, which minimizes the sum of squared residuals. The formulas are:

\[
b = \frac{\sum x_i y_i - \frac{(\sum x_i)(\sum y_i)}{n}}{\sum x_i^2 - \frac{(\sum x_i)^2}{n}}
\]

\[
a = \bar{y} - b\bar{x}
\]

The slope \(b\) is the most substantively interesting result: it tells you by how much \(y\) is predicted to change, on average, for each one-unit increase in \(x\). In the example running through the course notes — predicting student debt from years of education — the slope was found to be approximately \$1,093, meaning each additional year in school predicted about a thousand dollars more in debt. The intercept \(a\) is the predicted value of \(y\) when \(x = 0\); it may or may not be substantively meaningful depending on whether \(x = 0\) is a realistic value.

## Assessing Model Quality

Three criteria determine whether a regression model is any good:

<strong>Specification</strong>: Does the model make theoretical sense? Is the independent variable a plausible cause of the dependent variable? Predicting debt from height would be poorly specified — there is no theoretical reason why height should matter.

<strong>Parsimony</strong>: Is the model as simple as possible while still doing the job? Adding independent variables always improves fit mechanically, but models with too many predictors become hard to interpret and may overfit the sample.

<strong>Goodness of Fit</strong>: The <strong>coefficient of determination</strong> \(r^2\) quantifies how well the model fits the data:

\[
r^2 = 1 - \frac{SS_{\text{residual}}}{SS_{\text{total}}} = \frac{SS_{\text{regression}}}{SS_{\text{total}}}
\]

\(r^2\) ranges from 0 to 1 and represents the proportion of total variance in \(y\) that is explained by the linear relationship with \(x\). An \(r^2\) of 0.52 means 52% of the variation in debt is accounted for by years of education — a substantial result.

## The Pearson Product Moment Correlation

The <strong>Pearson r</strong> is the standardized measure of linear association between two continuous variables:

\[
r = \frac{\sum (x_i - \bar{x})(y_i - \bar{y})}{(n-1)s_x s_y}
\]

Unlike the slope \(b\), the Pearson r ranges from \(-1\) to \(+1\) and is unitless. A value of \(+1\) indicates a perfect positive linear relationship; \(-1\) indicates a perfect negative linear relationship; 0 indicates no linear relationship. The coefficient of determination \(r^2\) is literally the square of the Pearson r, which is one reason \(r^2\) has the appealing variance-explained interpretation.

Note that correlation does not require assuming one variable causes the other — it measures only the degree of linear co-variation. Regression, by contrast, is explicitly a causal model.

## Significance Tests for Regression Parameters

The regression coefficients derived from a sample (\(a\), \(b\), \(r\), and \(r^2\)) describe only the sample. To determine whether these patterns generalize to the population, significance tests must be performed for each parameter.

The significance test for \(r^2\) uses an F-statistic:

\[
F = \frac{r^2}{1 - r^2} \cdot (n - 2)
\]

with degrees of freedom 1 and \(n-2\), compared against the F-distribution (Appendix B). Significance tests for the slope \(\beta\) and intercept \(\alpha\) use t-statistics with \(n-2\) degrees of freedom. The significance test for the population correlation \(\rho\) also uses a t-statistic.

---

# Lessons 25–26: Chi-Square Tests and Measures of Association

## The Chi-Square Test of Independence

When both the independent and dependent variables are at the discrete level of measurement (nominal or ordinal), neither z, t, nor F tests are appropriate. Instead, the <strong>chi-square test of independence</strong> (\(\chi^2\)) is used to determine whether two discrete variables are related at the population level.

<div class="definition"><strong>Chi-square test of independence:</strong> A significance test applied to cross-tabular (contingency) tables to determine whether the distribution of the row variable differs across categories of the column variable — in other words, whether the two variables are statistically independent at the population level.</div>

The null hypothesis states that the two variables are <strong>independent</strong> in the population: knowing a case's category on one variable provides no information about its category on the other. The alternative hypothesis states that they are <strong>dependent</strong> (associated).

The test compares <strong>observed cell frequencies</strong> (\(f_o\)) from the sample to <strong>expected cell frequencies</strong> (\(f_e\)) — what the cell counts would be if the null hypothesis were exactly true. Expected frequencies are calculated as:

\[
f_e = \frac{(\text{row marginal})(\text{column marginal})}{N}
\]

The test statistic sums the squared discrepancies between observed and expected frequencies, weighted by the expected frequencies:

\[
\chi^2 = \sum \frac{(f_o - f_e)^2}{f_e}
\]

This statistic follows the chi-square distribution with degrees of freedom \(df = (r-1)(c-1)\), where \(r\) is the number of rows and \(c\) the number of columns in the table. Critical values come from Appendix C (the chi-square table).

## The Chi-Square Goodness of Fit Test

The <strong>goodness of fit</strong> test is a variant applied to a single discrete variable rather than a cross-tabular table. It asks whether the observed distribution of a variable in the sample is consistent with some theorized population distribution. For example, if a die is fair, each face should come up one-sixth of the time. Throwing the die 60 times and computing:

\[
\chi^2 = \sum_{i=1}^{k} \frac{(f_{o,i} - f_{e,i})^2}{f_{e,i}}
\]

where the expected frequency for each of the \(k\) categories is \(N \cdot p_i\) (\(p_i\) being the theorized proportion), tests whether the observed frequencies are consistent with the theoretical distribution. Degrees of freedom are \(k - 1\).

## Measures of Association for Discrete Variables

Statistical significance tells us that a relationship exists and generalizes to the population; it says nothing about how strong that relationship is. For continuous variables we have \(\eta^2\), \(r^2\), and \(r\). For discrete variables, a number of alternative measures have been developed, with somewhat different interpretations.

<strong>Phi (\(\phi\))</strong> is appropriate for 2×2 tables and is calculated as:

\[
\phi = \sqrt{\frac{\chi^2}{N}}
\]

It ranges from 0 to 1 (for 2×2 tables with no sign convention) or \(-1\) to \(+1\) in some formulations. <strong>Adjusted phi</strong> corrects for tables larger than 2×2.

<strong>Cramer's V</strong> extends phi to larger tables:

\[
V = \sqrt{\frac{\chi^2}{N \cdot \min(r-1, c-1)}}
\]

Cramer's V ranges from 0 to 1 and allows comparison across tables of different sizes.

<strong>Yule's Q</strong> applies specifically to 2×2 tables and produces a value between \(-1\) and \(+1\), with a Proportionate Reduction in Error (PRE) interpretation: a Q of 0.6 means knowing the independent variable reduces prediction errors about the dependent variable by 60%.

<strong>The Point-Biserial Correlation</strong> is used when one variable is dichotomous (two categories) and the other is continuous, and is equivalent to the Pearson r computed on the two scores. <strong>Spearman's r</strong> (\(r_s\)) is a rank-order correlation appropriate when both variables are ordinal, and is computed by:

\[
r_s = 1 - \frac{6 \sum d_i^2}{n(n^2-1)}
\]

where \(d_i\) is the difference between the ranks of each individual on the two variables.

An important interpretive caution: because these measures are based on limited mathematics compared to their continuous-level counterparts, they do not carry the same clean PRE interpretation as \(r^2\) or \(\eta^2\). They still provide a useful common metric for comparing the strength of associations, but their interpretations are more subjective. A reasonable rule of thumb: values near zero indicate little to no association; values above 0.5 or 0.6 (in absolute value) indicate a moderately strong to strong association; values near 1 indicate a very strong association.

## Statistical Significance vs. Substantive Significance

This distinction is worth emphasizing at the conclusion of the course. <strong>Statistical significance</strong> means a result is generalizable from the sample to the population — the observed pattern is unlikely to be a mere product of sampling chance. <strong>Substantive significance</strong> (or practical importance) refers to whether the relationship is strong enough to matter in the real world.

These two things are not the same. With a very large sample size, even a trivially small relationship can achieve statistical significance. Conversely — though this is logically impossible — something that fails to achieve statistical significance cannot be considered substantively significant either, because if it fails the significance test we cannot even conclude there is a relationship at the population level. The proper sequence is always: test for statistical significance first, and only if the relationship is significant proceed to evaluate its substantive importance via an effect size measure.

---

## Quick Reference: Key Formulas

<strong>Sample Mean:</strong>

\[
\bar{x} = \frac{\sum x_i}{n}
\]

<strong>Sample Variance and Standard Deviation:</strong>

\[
s^2 = \frac{\sum(x_i - \bar{x})^2}{n-1} \qquad s = \sqrt{s^2}
\]

<strong>Z-score:</strong>

\[
z = \frac{x_i - \bar{x}}{s}
\]

<strong>Standard Error of the Mean:</strong>

\[
\text{SE} = \frac{s}{\sqrt{n}}
\]

<strong>One-Sample Z-test for a Mean:</strong>

\[
z = \frac{\bar{x} - \mu_0}{s/\sqrt{n}}
\]

<strong>Confidence Interval for \(\mu\) (large sample):</strong>

\[
\bar{x} \pm z^* \cdot \frac{s}{\sqrt{n}}
\]

<strong>Pooled Variance (two-sample t-test):</strong>

\[
s_p^2 = \frac{(n_1-1)s_1^2 + (n_2-1)s_2^2}{n_1+n_2-2}
\]

<strong>Paired T-test:</strong>

\[
t = \frac{\bar{d}}{s_d / \sqrt{n}}, \quad df = n-1
\]

<strong>ANOVA F-statistic:</strong>

\[
F = \frac{SS_B/(k-1)}{SS_W/(N-k)}
\]

<strong>Eta-squared:</strong>

\[
\eta^2 = \frac{SS_B}{SS_T}
\]

<strong>Regression Slope:</strong>

\[
b = \frac{\sum x_i y_i - \frac{(\sum x_i)(\sum y_i)}{n}}{\sum x_i^2 - \frac{(\sum x_i)^2}{n}}
\]

<strong>Coefficient of Determination:</strong>

\[
r^2 = \frac{SS_{\text{regression}}}{SS_{\text{total}}}
\]

<strong>Chi-square Test Statistic:</strong>

\[
\chi^2 = \sum \frac{(f_o - f_e)^2}{f_e}
\]

<strong>Cramer's V:</strong>

\[
V = \sqrt{\frac{\chi^2}{N \cdot \min(r-1, c-1)}}
\]
