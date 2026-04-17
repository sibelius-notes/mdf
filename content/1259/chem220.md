---
title: "CHEM 220: Intro Analytical Chemistry"
prof: "Stacey Lavery"
subjects: "CHEM"
---

## Sources and References

**Primary textbook** — Douglas A. Skoog, Donald M. West, F. James Holler, Stanley R. Crouch, *Fundamentals of Analytical Chemistry*, 10th ed. (Cengage Learning, 2014)
**Supplementary texts** — Daniel C. Harris, *Quantitative Chemical Analysis*, 10th ed. (W. H. Freeman, 2020); Gary D. Harvey, *Modern Analytical Chemistry* (McGraw-Hill, 2000)
**Online resources** — MIT OCW 5.33 Advanced Chemical Experimentation; LibreTexts Analytical Chemistry (chem.libretexts.org); NIST Chemistry WebBook (webbook.nist.gov)

---

# Chapter 1: The Analytical Process

## 1.1 What Is Analytical Chemistry?

Every time a physician orders a blood panel, a water utility checks a river for lead contamination, or a forensic scientist identifies a white powder found at a crime scene, analytical chemistry is the discipline doing the work behind the scenes. Analytical chemistry is concerned with answering two fundamental questions: *What* is a substance, and *how much* of it is present? The first question falls to **qualitative analysis**, which identifies chemical species; the second belongs to **quantitative analysis**, which determines their amounts. Together, they underpin virtually every branch of applied science and industry, from pharmaceutical quality control to environmental monitoring to semiconductor fabrication.

The discipline is ancient in spirit — alchemists weighed and tested substances for millennia — but it became a rigorous science only in the nineteenth century, when chemists like Berzelius, Fresenius, and Mohr introduced systematic gravimetric and titrimetric procedures. Today, analytical chemistry encompasses methods of staggering diversity: techniques that can detect a single atom in a solid sample, identify a protein at femtomolar concentration in a drop of blood, or map elemental distributions across a cross-section of a meteorite. The unifying thread is the careful, quantitative relationship between a measurable signal and the chemical information it encodes.

It is worth distinguishing analytical chemistry from mere *analysis*. A clinical chemist performing a glucose assay by a well-validated protocol is doing analysis. An analytical chemist is the one who developed that assay, characterized its limitations, and decided which physical principle — enzymatic colorimetry, electrochemical oxidation, NMR — would give the most reliable result for blood serum. Analytical chemistry is therefore an enabling science: it creates the methods that other sciences and industries use. This creative, problem-solving dimension makes it intellectually rich well beyond the manipulation of glassware and instruments.

## 1.2 Classical Versus Instrumental Methods

The history of analytical chemistry can be told as the story of two great families of methods that have grown up alongside each other. **Classical methods**, sometimes called wet chemical methods, include gravimetric and titrimetric (volumetric) analysis. In gravimetric analysis, the analyte is converted to a sparingly soluble precipitate, filtered, dried, and weighed; the mass directly yields the amount of analyte through stoichiometry. In titrimetric analysis, a reagent of known concentration (the titrant) is added until a stoichiometric equivalence point is reached, and the volume consumed reveals the analyte amount. Both methods share the virtue of requiring only a balance or burette — instruments whose calibration can be traced directly to mass and volume standards. For this reason, classical methods remain the gold standard for defining reference values and certifying reference materials.

**Instrumental methods** emerged in the twentieth century as physicists and chemists recognized that the interaction of matter with electromagnetic radiation, electric fields, or magnetic fields could be harnessed to provide analytical information. The key advantages of instrumental methods are sensitivity, speed, and the ability to provide structural or speciation information that classical methods cannot. Spectroscopic methods measure the absorption or emission of radiation at characteristic wavelengths; electroanalytical methods measure current, potential, or charge; chromatographic methods separate complex mixtures before measurement; mass spectrometry identifies molecules by their mass-to-charge ratios. The tradeoff is that instrumental methods generally require calibration with known standards and may be susceptible to matrix interferences in ways that gravimetry is not.

In modern practice, the distinction between classical and instrumental methods has blurred considerably. A gravimetric determination of sulfate as BaSO₄ is a purely classical method, but the analyst may use an inductively coupled plasma spectrometer (ICP-OES) to verify sample preparation. A titrimetric analysis might use a glass electrode (an instrumental detector) to locate the equivalence point. The skilled analytical chemist draws on all available methods and chooses the one best suited to the problem.

## 1.3 The Analytical Process

Whether one is analyzing a geological sample for rare-earth elements or measuring pesticide residues in lettuce, the analytical process follows a common logical structure. Skoog and coauthors describe this as a series of steps that begin long before any instrument is turned on.

The first step is **problem definition**: articulating precisely what chemical information is needed, at what level of accuracy and precision, within what time and budget constraints, and for what ultimate purpose. A poorly defined question leads to wasted effort. If the question is "Is lead present in this water sample?", the answer might be obtained by a simple colorimetric test. If the question is "Does this water sample comply with the EPA action level of 15 µg/L for lead?", a carefully calibrated atomic spectrometry method with appropriate blanks and quality controls is required.

**Sampling** is arguably the most critical and most underappreciated step. A measurement can be no more representative than the sample from which it is drawn. Sampling strategies must account for the heterogeneity of the bulk material: a lake is not uniformly composed; an ore deposit has veins of varying composition; a batch of pharmaceutical tablets has tablet-to-tablet variation. Statistical sampling theory provides guidance on how many samples to take and how to pool or analyze them individually. A common error is to treat the analytical measurement as the source of uncertainty while ignoring the much larger uncertainty introduced by sampling.

**Sample preparation** converts the raw sample into a form compatible with the chosen analytical method. This may involve dissolution (acid digestion, fusion, solvent extraction), matrix removal (solid-phase extraction, precipitation), concentration (evaporation, preconcentration on a sorbent), or derivatization (converting a non-absorbing analyte into one that absorbs UV radiation). Many analytical errors originate in this step: losses of volatile analyte during acid digestion, contamination from reagents, or incomplete extraction.

**Measurement** produces the analytical signal — absorbance, peak area, current, mass spectrum — that is related to analyte concentration. Calibration translates this signal into a concentration value. **Data evaluation** applies statistical tools to assess whether the result is reliable, whether systematic errors are present, and how certain the final reported value is. Finally, the result is communicated to the end user in a form that conveys not just a number but its uncertainty and the conditions under which it is valid.

## 1.4 Figures of Merit

The performance of an analytical method is characterized by a set of **figures of merit** — quantitative descriptors that allow different methods or different laboratories to be compared objectively.

**Accuracy** describes how close a measured result is to the true value. It is often expressed as percent relative error:

\[
\% \text{error} = \frac{x_i - \mu}{\mu} \times 100
\]

where \(x_i\) is the measured value and \(\mu\) is the accepted true value. Accuracy can be assessed by analyzing certified reference materials (CRMs) with known concentrations.

**Precision** describes the reproducibility of measurements made under the same conditions. High precision does not guarantee accuracy (a systematic error can cause all measurements to cluster around the wrong value), but low precision implies low accuracy. Precision is quantified by the standard deviation \(s\) or relative standard deviation (RSD, also called the coefficient of variation, CV).

**Sensitivity** has a specific technical meaning: it is the slope of the calibration curve, \(dS/dc\), where \(S\) is the signal and \(c\) is the concentration. A highly sensitive method produces a large change in signal for a small change in concentration, allowing reliable quantitation at low analyte levels.

**Selectivity** (sometimes called **specificity**) measures how well a method distinguishes the analyte from other species in the sample matrix. A perfectly selective method responds only to the analyte; in practice, interferences must be identified and either eliminated or corrected for. The selectivity coefficient \(k_{A,B}\) quantifies the response to interferent B relative to analyte A.

The **limit of detection (LOD)** is the smallest amount or concentration of analyte that can be distinguished from the blank with a defined statistical confidence, conventionally taken as three standard deviations above the mean blank signal:

\[
\text{LOD} = \frac{3 s_{\text{blank}}}{m}
\]

where \(m\) is the calibration slope. The **limit of quantitation (LOQ)** is the smallest concentration that can be quantified with acceptable precision and accuracy, conventionally \(10 s_{\text{blank}} / m\). The **dynamic range** extends from the LOQ up to the concentration at which the calibration curve departs from linearity; within this range, the method gives reliable quantitative results.

## 1.5 SI Units and Significant Figures

All measurements in analytical chemistry are expressed in SI (Système International) units or their derivatives. The seven SI base units most relevant to this course are the metre (m, length), kilogram (kg, mass), second (s, time), mole (mol, amount of substance), kelvin (K, temperature), ampere (A, electric current), and candela (cd, luminous intensity). Derived units include the pascal (Pa = kg m⁻¹ s⁻²) for pressure, the joule (J = kg m² s⁻²) for energy, and the volt (V = kg m² s⁻³ A⁻¹) for electric potential.

**Significant figures** encode the precision of a measurement by convention. The number of significant figures in a result should reflect the precision of the least precise measurement that contributed to it. For addition and subtraction, the result is rounded to the same number of decimal places as the least precise operand. For multiplication and division, the result is rounded to the same number of significant figures as the least precise factor. Intermediate calculations should retain at least one additional digit beyond what is significant to avoid rounding errors propagating through a multi-step calculation.

---

# Chapter 2: Tools, Measurements, and Chemical Calculations

## 2.1 The Analytical Balance

The analytical balance is the single most important piece of equipment in the classical laboratory. Modern **electronic analytical balances** operate on the electromagnetic force restoration principle: a current in a coil counteracts the gravitational force on the pan, and the current required is proportional to the mass. Top-loading balances typically read to 0.001 g (1 mg), while semi-micro analytical balances read to 0.0001 g (0.1 mg) and micro-analytical balances to 0.001 mg. The readability of a balance, however, is not its uncertainty; the combined uncertainty from linearity, eccentricity, and repeatability is typically 2–3 times the last digit.

**Weighing by difference** is the preferred technique for transferring a solid to a flask. The sample and its container (a weighing boat or weighing bottle) are weighed together, the solid is transferred as completely as possible, and the container is weighed again. The difference is the mass transferred, with the uncertainty of two weighings added in quadrature rather than summing worst-case errors. Direct weighing into a container is acceptable when the container has been tared, but for hygroscopic, volatile, or reactive samples, the weighing bottle technique is essential.

Errors in weighing arise from several sources. Buoyancy corrections are needed for high-accuracy work: an object displaces a volume of air, and the apparent weight in air is less than the true mass by the weight of displaced air. For most laboratory work this correction is negligible, but for calibration of reference masses it must be applied. Electrostatic charge on glassware can attract the pan and give anomalous readings; this is mitigated by using ionizing (polonium or antistatic) strips or by grounding glassware. Thermal drafts from a recently handled object cause fluctuating readings; objects should equilibrate to room temperature before weighing.

## 2.2 Volumetric Glassware

Volumetric glassware is calibrated to contain (TC, or *in*) or to deliver (TD, or *ex*) a specified volume at a defined temperature, conventionally 20 °C. **Class A** glassware meets the tightest tolerances specified by standards bodies (ASTM, ISO, DIN) and is required for high-accuracy work. **Class B** tolerances are typically twice those of Class A; Class B ware is acceptable for most teaching laboratory work but not for certified measurements.

**Volumetric flasks** are calibrated TC (to contain) at their nominal volumes (e.g., 100.00 mL). They have a long neck with a single etched graduation mark; when the meniscus of the solution bottom is tangent to the mark at eye level (avoiding parallax error), the flask contains the stated volume. Volumetric flasks should not be used to store solutions for extended periods because the ground-glass stopper may leach silica or bind analytes.

**Pipettes** are calibrated TD (to deliver). A **transfer (volumetric) pipette** delivers a single fixed volume with the highest accuracy; Class A transfer pipettes (25.00 mL) have tolerances of ±0.03 mL. After draining, the tip is touched to the vessel wall and the last drop is *not* blown out — the calibration accounts for the residual film. **Measuring (Mohr) pipettes** are graduated and can deliver any volume up to their nominal capacity, but with lower accuracy. **Micropipettes** (Eppendorf-type, 1–1000 µL) use air displacement pistons; they require regular calibration by gravimetry (weighing the delivered volume of water and applying the density correction).

**Burettes** are long, graduated tubes used to deliver variable volumes of titrant with high precision. A **Class A 50-mL burette** has 0.1-mL graduations and can be read to ±0.01 mL by interpolation. The initial and final readings must both be recorded, and the zero point checked before each titration. Teflon stopcocks are preferred over glass for alkaline solutions, which can etch glass and cause sticking. The burette must be rinsed with titrant before use to avoid dilution errors.

## 2.3 Concentration Units

The composition of a solution can be expressed in many ways, and the choice among them depends on the application.

**Molarity** (\(c\) or \(M\)) is defined as moles of solute per litre of solution:

\[
c = \frac{n}{V}
\]

It is the most common unit in titrimetry and spectrophotometry because reaction stoichiometry is most naturally expressed in moles, and volumes of solutions are easily measured.

**Normality** (\(N\)) is the number of equivalents of solute per litre of solution, where an equivalent is defined by the specific reaction considered (proton-transfer, electron-transfer, or precipitation). For a diprotic acid, the normality is twice the molarity. Normality has largely fallen out of favor in modern analytical chemistry because the "equivalent" is reaction-specific and can cause confusion, but it appears in older literature and in some industrial methods.

**Molality** (\(m\)) is moles of solute per kilogram of *solvent* (not solution). Unlike molarity, molality is independent of temperature (since masses do not change with thermal expansion), making it the preferred unit for precise physical chemistry measurements and for preparing solutions over a wide temperature range.

**Mass fraction** (\(w/w\)) is mass of solute per mass of solution, often expressed as a percentage. It is convenient for expressing the composition of concentrated acid reagents; commercial concentrated hydrochloric acid is approximately 37% HCl by mass. **Volume fraction** (\(v/v\)) applies when both solute and solvent are liquids (e.g., 70% ethanol in water). **Parts per million (ppm)**, **parts per billion (ppb)**, and **parts per trillion (ppt)** are mass-based units commonly used for trace analytes in environmental and clinical contexts. For aqueous solutions, 1 ppm ≈ 1 mg/L ≈ 1 µg/mL; this approximation holds when the solution density is close to 1.000 g/mL.

## 2.4 Dilutions and Solution Preparation

The fundamental relationship governing dilution is conservation of moles of solute:

\[
c_1 V_1 = c_2 V_2
\]

where \(c_1\) and \(V_1\) are the initial concentration and volume, and \(c_2\) and \(V_2\) are those of the diluted solution. To prepare a 0.100 M solution of NaCl in 250 mL, one calculates the required mass: \(n = (0.100 \text{ mol/L})(0.250 \text{ L}) = 0.0250 \text{ mol}\); \(m = (0.0250 \text{ mol})(58.44 \text{ g/mol}) = 1.461 \text{ g}\). This mass is weighed accurately, dissolved in a small volume of deionized water in the volumetric flask, swirled until completely dissolved, and then diluted to the mark with additional deionized water.

When preparing a solution from a concentrated liquid reagent, the density and mass fraction of the stock reagent must be known. Concentrated sulfuric acid is nominally 98.0% H₂SO₄ by mass with a density of 1.840 g/mL. The molarity is:

\[
c = \frac{1000 \text{ mL/L} \times 1.840 \text{ g/mL} \times 0.980}{98.08 \text{ g/mol}} = 18.4 \text{ mol/L}
\]

To prepare 1.00 L of 1.00 M H₂SO₄, one would add \(V_1 = c_2 V_2 / c_1 = (1.00)(1.00)/(18.4) = 54.3\) mL of concentrated acid *to water* — always acid to water to dissipate the large heat of dilution safely.

**Density** and **specific gravity** appear frequently in solution preparation. Specific gravity is the dimensionless ratio of the density of a substance to the density of water at 4 °C (approximately 1.000 g/mL), so specific gravity is numerically equal to density in g/mL. Tables of specific gravity versus mass fraction are available for all common concentrated reagents and are reproduced in the appendices of most analytical chemistry textbooks.

## 2.5 Reagent Grades and Water Purity

Laboratory chemicals are supplied in grades that reflect their purity. **ACS reagent grade** meets the specifications of the American Chemical Society and is suitable for most analytical work. **Trace metal grade** (also called **ultrapure** or **Optima** grade) acids are purified to parts-per-trillion levels of metal contamination and are required for ICP-MS and GFAAS work. **HPLC grade** solvents have low UV absorbance and particulate content. **Primary standard grade** reagents have verified assay values and are used to standardize titrant solutions.

Water used in analytical laboratories must be purified to remove ions, organic compounds, dissolved gases, and microorganisms. **Type I (ultrapure) water** has resistivity ≥ 18.2 MΩ·cm and is produced by reverse osmosis followed by mixed-bed deionization and UV treatment. Type I water is required for trace metal analysis, cell culture media, and HPLC mobile phase preparation. **Type II water** (resistivity ≥ 1 MΩ·cm) is adequate for glassware rinsing and routine reagent preparation.

---

# Chapter 3: Statistics of Analytical Measurements

## 3.1 Types of Error

No measurement is perfect. The deviation of a measured value from the true value is called **error**, and understanding the nature of errors is essential to designing reliable analytical methods and interpreting results responsibly. Errors fall into two fundamental categories: systematic and random.

**Systematic errors** (also called **determinate errors**) are reproducible errors that affect all measurements in the same direction and to approximately the same extent. They arise from instrument miscalibration (a balance that consistently reads 0.5 mg too high), method bias (incomplete extraction of analyte from the matrix), or analyst errors (consistently reading the meniscus from the wrong angle). Systematic errors do not average out with repeated measurements; they produce **inaccuracy**. They can be detected only by comparing results with a known reference — a certified reference material, a spike recovery, or a method comparison.

**Random errors** (also called **indeterminate errors**) fluctuate unpredictably from measurement to measurement. They arise from the fundamental limits of measurement — thermal noise in electronics, slight variations in solution temperature, small differences in how a meniscus is read. Random errors produce **imprecision**; they do average out with repeated measurements, and their behavior is described by the Gaussian (normal) distribution.

A third category, **gross errors**, includes blunders such as mislabeling a sample, arithmetic mistakes, or a contaminant spike. These are not treated statistically; they must be identified and the measurement repeated.

## 3.2 The Gaussian Distribution

When a large number of measurements of the same quantity are made under identical conditions, their distribution approaches the **Gaussian (normal) distribution**:

\[
f(x) = \frac{1}{\sigma\sqrt{2\pi}} \exp\!\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)
\]

The distribution is characterized by its mean \(\mu\) (the true value, approached as the number of measurements \(N \to \infty\)) and its standard deviation \(\sigma\) (a measure of spread). The area under the curve between \(\mu - \sigma\) and \(\mu + \sigma\) is 68.3%; between \(\mu - 2\sigma\) and \(\mu + 2\sigma\) it is 95.4%; between \(\mu - 3\sigma\) and \(\mu + 3\sigma\) it is 99.7%.

In practice, the true values \(\mu\) and \(\sigma\) are unknown and are estimated from a finite sample of \(n\) measurements. The **sample mean** is:

\[
\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i
\]

The **sample standard deviation** is:

\[
s = \sqrt{\frac{\sum_{i=1}^{n}(x_i - \bar{x})^2}{n-1}}
\]

The denominator \(n-1\) (degrees of freedom) corrects for the bias introduced by using \(\bar{x}\) as an estimate of \(\mu\). The **relative standard deviation (RSD)** or **coefficient of variation (CV)** is \(s/\bar{x} \times 100\%\); it provides a dimensionless measure of precision that allows comparison between methods operating at different concentration levels.

## 3.3 Confidence Intervals

The sample mean \(\bar{x}\) is itself a random variable — if we repeated the entire series of \(n\) measurements, we would get a slightly different \(\bar{x}\). The **standard error of the mean** is \(s/\sqrt{n}\), which decreases as more measurements are averaged, reflecting the fact that the mean is a more reliable estimate than any single measurement.

A **confidence interval** states a range within which the true mean \(\mu\) is expected to lie with a specified probability (confidence level). Because \(\sigma\) is unknown, we use the **Student's t-distribution**, which is broader than the Gaussian and accounts for the uncertainty in estimating \(\sigma\) from a small sample. The confidence interval for the mean is:

\[
\mu = \bar{x} \pm \frac{t \cdot s}{\sqrt{n}}
\]

where \(t\) is the critical value from the t-table at the desired confidence level (e.g., 95%) and \(n-1\) degrees of freedom. As \(n\) increases, \(t\) approaches the normal distribution z-value (1.96 for 95% confidence). For \(n = 3\) measurements at 95% confidence, \(t_{2,0.05} = 4.303\) — a very wide multiplier that reflects the large uncertainty in estimating \(\sigma\) from only three values.

The concept is subtle but important: a 95% confidence interval does *not* mean there is a 95% probability that \(\mu\) lies within that particular interval. Rather, if we repeated the experiment many times and computed a confidence interval each time, 95% of those intervals would contain the true mean. In practice, the distinction rarely matters for analytical work, but it is worth understanding.

## 3.4 Statistical Hypothesis Tests

Statistical tests allow us to decide, on the basis of experimental data, whether two quantities are significantly different or whether an observed deviation from expectation could reasonably be attributed to random error.

The **one-sample t-test** tests whether a measured mean differs significantly from a known (true) value \(\mu_0\):

\[
t_{\text{calc}} = \frac{|\bar{x} - \mu_0|}{s/\sqrt{n}}
\]

If \(t_{\text{calc}} > t_{\text{table}}\) at the chosen significance level (typically \(\alpha = 0.05\)), we conclude that a significant systematic error (bias) is present in the method.

The **two-sample t-test** compares the means from two independent sets of measurements (e.g., two methods, two analysts, or two sample populations) to determine whether they are statistically indistinguishable. The pooled standard deviation \(s_p\) is used when the two standard deviations are not significantly different:

\[
s_p = \sqrt{\frac{(n_1-1)s_1^2 + (n_2-1)s_2^2}{n_1+n_2-2}}
\]

The F-test must be performed first to verify that the precisions are comparable before applying the pooled t-test.

The **F-test** (also called **Snedecor's F-test**) compares the precisions (variances) of two methods:

\[
F_{\text{calc}} = \frac{s_1^2}{s_2^2}
\]

where by convention \(s_1 > s_2\), giving \(F_{\text{calc}} \geq 1\). If \(F_{\text{calc}} > F_{\text{table}}\) at the chosen significance level and the appropriate degrees of freedom, the precisions are significantly different.

The **Grubbs test** (Q-test) identifies a potential outlier in a small data set. For a suspected outlier \(x_q\):

\[
G_{\text{calc}} = \frac{|x_q - \bar{x}|}{s}
\]

If \(G_{\text{calc}} > G_{\text{table}}\) at the desired confidence level, the suspect value may be rejected. Outlier rejection should always be used cautiously; indiscriminate rejection of inconvenient data is a form of scientific misconduct.

## 3.5 Propagation of Uncertainty

When a result is calculated from several measured quantities, each with its own uncertainty, those uncertainties combine to produce uncertainty in the final result. The formal treatment is based on the first-order Taylor expansion of the result function.

For **addition and subtraction**, the absolute uncertainty of the result is found by adding the absolute uncertainties in quadrature:

\[
s_R = \sqrt{s_1^2 + s_2^2 + \cdots}
\]

For **multiplication and division**, the relative uncertainty of the result is found by adding the relative uncertainties in quadrature:

\[
\frac{s_R}{R} = \sqrt{\left(\frac{s_1}{x_1}\right)^2 + \left(\frac{s_2}{x_2}\right)^2 + \cdots}
\]

For a general function \(R = f(x_1, x_2, \ldots)\), the general formula is:

\[
s_R = \sqrt{\left(\frac{\partial f}{\partial x_1}\right)^2 s_1^2 + \left(\frac{\partial f}{\partial x_2}\right)^2 s_2^2 + \cdots}
\]

These rules assume that the individual uncertainties are independent (uncorrelated). When uncertainties are correlated — for example, when the same balance is used for all weighings and has a systematic offset — the covariance terms must also be included.

<div class="example">
<strong>Example 3.1 — Propagation in a Titration</strong>

A titration uses a burette reading of 24.37 ± 0.02 mL to deliver titrant. The initial reading was 0.15 ± 0.02 mL. The volume delivered is:

V = 24.37 − 0.15 = 24.22 mL

The uncertainty is:

s<sub>V</sub> = √(0.02² + 0.02²) = √(0.0008) = 0.028 mL ≈ 0.03 mL

The relative uncertainty is 0.03/24.22 × 100% = 0.12%, which is entirely acceptable for titrimetric work.
</div>

---

# Chapter 4: Quality Assurance and Calibration

## 4.1 Quality Assurance in the Analytical Laboratory

The term **quality assurance (QA)** refers to the entire system of policies, procedures, and practices that ensure the reliability of analytical data. **Quality control (QC)** is the subset of QA that involves the specific measurements used to monitor whether a method is performing within its defined specifications. The distinction matters: QA is proactive (designing systems to prevent errors), while QC is reactive (detecting errors that have occurred). Both are indispensable in regulated analytical laboratories — those operating under Good Laboratory Practice (GLP), ISO/IEC 17025 accreditation, or regulatory oversight from agencies such as the EPA, FDA, or Health Canada.

**Blanks** are critical QC tools. A **reagent blank** (or method blank) is prepared by taking all reagents through the entire analytical procedure in the absence of sample; it measures contamination introduced by reagents, glassware, and the laboratory environment. A **field blank** is a sample of pure matrix (e.g., ultrapure water for water analysis) that accompanies field samples through collection, transport, and analysis; it measures contamination introduced during sampling. A **calibration blank** is the zero-standard in the calibration curve. The signal from the reagent blank must be subtracted from all sample signals before calculation.

**Spike-and-recovery experiments** (matrix spikes) assess whether the sample matrix enhances or suppresses the analytical signal. A known amount of analyte is added to a portion of the sample before analysis, and the recovery is calculated:

\[
\% \text{Recovery} = \frac{c_{\text{spiked sample}} - c_{\text{sample}}}{c_{\text{added}}} \times 100
\]

Acceptable recovery typically lies in the range 80–120% for most environmental and pharmaceutical methods. Recoveries outside this range indicate matrix effects that must be corrected.

**Certified reference materials (CRMs)** are substances whose analyte concentrations have been certified by an authoritative body (NIST, IRMM, NRC) using multiple independent methods. Analyzing a CRM alongside samples provides an independent check on method accuracy. When the result for the CRM falls outside the certified range (accounting for measurement uncertainty), a systematic error is indicated.

## 4.2 Control Charts

A **control chart** (Shewhart chart) is a graphical tool for monitoring whether an analytical process remains in statistical control over time. Control limits are typically set at the mean ± 2s (warning limits) and mean ± 3s (action limits) based on measurements during a period when the method is known to be performing correctly. Each subsequent measurement of a control sample is plotted; if it falls outside the action limits, or if a non-random pattern appears (e.g., seven consecutive points on the same side of the mean — the "Western Electric rules"), the method is considered out of control and analysis must stop until the problem is identified and corrected.

Control charts serve two distinct purposes. For **precision control**, a replicate control sample is analyzed with each batch to monitor random variation. For **accuracy control**, a CRM or a spiked sample is analyzed to monitor for drift in the calibration or the development of systematic bias. The Shewhart chart transformed manufacturing quality control in the 1920s (W.A. Shewhart at Bell Laboratories) and was subsequently adopted throughout analytical science.

## 4.3 Linear Calibration and Least-Squares Regression

The standard approach to calibration in analytical chemistry is to prepare a series of **calibration standards** spanning the expected concentration range, measure the signal for each, and fit a straight line to the signal-versus-concentration data. The line is then used to convert unknown signals to concentrations.

The **method of least squares** finds the line \(\hat{y} = mx + b\) that minimizes the sum of squared vertical residuals \(\sum (y_i - \hat{y}_i)^2\). The analytical solutions for the slope and intercept are:

\[
m = \frac{\sum x_i y_i - n\bar{x}\bar{y}}{\sum x_i^2 - n\bar{x}^2}
\]

\[
b = \bar{y} - m\bar{x}
\]

The uncertainty in the slope and intercept depend on the scatter of the calibration data, quantified by the residual standard deviation:

\[
s_r = \sqrt{\frac{\sum(y_i - \hat{y}_i)^2}{n-2}}
\]

The standard uncertainty in the slope is \(s_m = s_r / \sqrt{\sum(x_i - \bar{x})^2}\), and in the intercept is \(s_b = s_r \sqrt{\sum x_i^2 / (n \sum(x_i - \bar{x})^2)}\). The **coefficient of determination** \(R^2\) is often used as a goodness-of-fit measure; while \(R^2 > 0.999\) is commonly required in regulated methods, a high \(R^2\) does not guarantee that the calibration is appropriate (outliers, nonlinearity, or heteroscedasticity can be missed).

## 4.4 Standard Additions and Internal Standards

When the sample matrix significantly alters the analytical signal — a phenomenon called the **matrix effect** — external calibration using standards prepared in pure solvent will give biased results. Two alternative calibration strategies address this problem.

In the **method of standard additions**, known amounts of analyte are added to the actual sample, and the signals of the spiked samples are measured. By extrapolating back to zero signal (or using the algebraic equivalent), the original analyte concentration is obtained. If \(S_0\) is the signal of the unspiked sample (volume \(V_0\)) and \(S_s\) is the signal after adding standard of concentration \(c_s\) to give a total volume \(V_t\):

\[
c_x = \frac{S_0 \cdot c_s \cdot V_s}{S_s V_t - S_0 V_t}
\]

The method of standard additions corrects for multiplicative matrix effects (signal enhancement or suppression) but not for additive effects (background signal) unless blanks are also run in the same matrix.

The **internal standard method** adds a constant known amount of a compound (the internal standard, IS) to all samples, blanks, and calibration standards. The response ratio (analyte signal / IS signal) is plotted against analyte concentration. Variations in sample preparation efficiency, injection volume, or signal drift affect both the analyte and the internal standard equally, so they cancel in the ratio. The IS must be chemically similar to the analyte (so it suffers the same matrix effects) but chromatographically or spectrally distinguishable. In isotope-dilution analysis, the IS is an isotopically labelled version of the analyte — the gold standard for high-accuracy quantitative analysis.

## 4.5 Limits of Detection and Quantitation

The **limit of detection (LOD)** and **limit of quantitation (LOQ)** are among the most important and most frequently misused figures of merit in analytical chemistry. The IUPAC definition relates them to the blank signal:

\[
\text{LOD} = \frac{3 s_{\text{blank}}}{m}, \quad \text{LOQ} = \frac{10 s_{\text{blank}}}{m}
\]

where \(s_{\text{blank}}\) is the standard deviation of repeated blank measurements and \(m\) is the calibration sensitivity (slope). The LOD corresponds to a signal-to-noise ratio of 3; it represents the minimum detectable signal with a specified risk of false positives and false negatives. The LOQ is the minimum signal that can be reliably quantified; below the LOQ, relative uncertainties exceed approximately 30% and results should be reported as "detected but not quantified."

It is critical that the blank is measured under the same conditions as samples — same reagents, same preparation procedure, same instrument settings — so that \(s_{\text{blank}}\) reflects all sources of noise present in real analysis. Reporting an LOD calculated from just a few blank measurements or from a clean solvent blank rather than a method blank is a common source of overoptimistic detection claims.

---

# Chapter 5: Gravimetric Analysis

## 5.1 Principles and Requirements of Precipitation Gravimetry

Gravimetric analysis is one of the oldest and most accurate techniques in quantitative chemistry. Its appeal lies in directness: the mass of a weighed product, combined with stoichiometry, yields the analyte amount with no calibration against external standards. The limiting factor in gravimetric analysis is not instrumental noise but the purity, completeness, and stoichiometric fidelity of the chemical transformation.

Precipitation gravimetry requires that the analyte be converted quantitatively to a **precipitate** with three key properties. First, the precipitate must be *sparingly soluble* — its equilibrium solubility must be low enough that the fraction remaining in solution is negligible (< 0.1 mg for most work). Second, it must be *easily filterable* — a crystalline, coarse-grained solid passes through a fine-pored frit with minimal loss and clogging, while a gelatinous colloid such as Fe(OH)₃ is difficult to filter and wash. Third, it must be either directly weighable in its collected form or convertible to a stable **weighing form** of known composition by drying or ignition.

The classical example is the gravimetric determination of sulfate as barium sulfate, BaSO₄. Excess BaCl₂ is added to the acidified sample solution; SO₄²⁻ precipitates quantitatively because \(K_{sp}(\text{BaSO}_4) = 1.1 \times 10^{-10}\). The precipitate is filtered through a sintered-glass crucible or ashless filter paper, washed, dried at 120 °C, and weighed. The **gravimetric factor (GF)** converts the mass of precipitate to the mass of analyte:

\[
\text{GF} = \frac{M_{\text{analyte}} \times a}{M_{\text{precipitate}} \times b}
\]

where \(a\) and \(b\) are stoichiometric coefficients relating analyte to precipitate.

<div class="example">
<strong>Example 5.1 — Gravimetric Sulfate Determination</strong>

A 0.4812 g sample produces 0.6003 g of BaSO<sub>4</sub> precipitate (M = 233.39 g/mol). The sulfate content is:

GF = M(SO<sub>4</sub><sup>2−</sup>) / M(BaSO<sub>4</sub>) = 96.06 / 233.39 = 0.4117

Mass of SO<sub>4</sub><sup>2−</sup> = 0.6003 g × 0.4117 = 0.2471 g

%SO<sub>4</sub><sup>2−</sup> = (0.2471 / 0.4812) × 100% = 51.35%
</div>

## 5.2 Particle Size, Supersaturation, and Digestion

The physical form of the precipitate — whether it is a coarse crystalline solid or a fine, turbid colloid — depends on the conditions of precipitation, particularly on the **relative supersaturation (RSS)** at the moment of mixing:

\[
\text{RSS} = \frac{Q - S}{S}
\]

where \(Q\) is the instantaneous concentration of solute at the point of mixing and \(S\) is the equilibrium solubility. The **von Weimarn ratio**, as this ratio is sometimes called, controls the nucleation-to-crystal-growth competition. At high RSS, nucleation dominates and many tiny colloidal particles form; at low RSS, relatively few nuclei form and each grows into a larger crystal that is easier to filter.

The practical implication is that precipitation should be performed under conditions that minimize RSS: dilute solutions, slow addition of precipitant, stirring, elevated temperature (which increases \(S\)), and appropriate pH. Adding precipitant rapidly to a concentrated solution at room temperature gives a colloidal BaSO₄ precipitate that passes through filter paper; adding it slowly to a dilute, hot, acidic solution gives a filterable crystalline precipitate.

**Digestion** (also called aging) dramatically improves precipitate quality after the initial precipitation. The precipitate is left in contact with the mother liquor (often at elevated temperature) for 30–60 minutes or longer. During this time, **Ostwald ripening** operates: small crystals, which have higher surface energy and higher effective solubility than large crystals, dissolve and the material redeposits on larger crystals. The net result is fewer, larger, purer crystals. For BaSO₄, overnight digestion in the hot mother liquor is a routine procedure in high-precision gravimetry.

## 5.3 Coprecipitation and Homogeneous Precipitation

Despite careful technique, a precipitate always carries down some impurities from the solution — a phenomenon called **coprecipitation**. This can occur through several mechanisms. **Surface adsorption** occurs when ions from solution adsorb onto the large surface area of the freshly precipitated solid. For ionic precipitates, the primary adsorbed layer is the lattice ion in excess (following the Paneth-Fajans-Hahn rule), and a secondary layer of counter-ions follows. **Occlusion** (mechanical entrapment) occurs when rapidly growing crystals incorporate pockets of mother liquor within their lattice. **Mixed crystal (isomorphous substitution) formation** occurs when an impurity ion has the same charge and similar size as a lattice ion and substitutes into the crystal structure; SrSO₄ can coprecipitate with BaSO₄ because Sr²⁺ and Ba²⁺ are isomorphous.

**Homogeneous precipitation** is a powerful technique for minimizing coprecipitation by avoiding localized supersaturation. Instead of adding a precipitating reagent directly, the reagent is generated uniformly throughout the solution by a slow chemical reaction. For example, sulfate can be precipitated as BaSO₄ by dissolving the sample in a solution containing dimethylsulfate, which slowly hydrolyzes to release SO₄²⁻ uniformly at low, controlled concentration. Aluminum hydroxide can be precipitated homogeneously by the controlled hydrolysis of urea:

\[
(\text{NH}_2)_2\text{CO} + 3\,\text{H}_2\text{O} \xrightarrow{\Delta} \text{CO}_2 + 2\,\text{NH}_3 + \text{H}_2\text{O}
\]

raising the pH slowly and uniformly. The resulting Al(OH)₃ precipitate is much more crystalline and filterable than that obtained by direct base addition.

## 5.4 Combustion Analysis and Thermogravimetry

**Combustion elemental analysis** (the **Dumas method**) determines the carbon, hydrogen, nitrogen, and sulfur content of organic compounds by burning a small sample (1–3 mg) in excess pure oxygen at high temperature (~900–1050 °C) in a ceramic tube packed with oxidation and reduction catalysts. The combustion products — CO₂, H₂O, N₂, and SO₂/SO₃ — are separated chromatographically and detected by a thermal conductivity detector. From the peak areas, the mass fractions of C, H, N, and S are calculated. Oxygen is determined by difference. Modern combustion analyzers (e.g., LECO, Elementar) complete an analysis in 5–10 minutes with a precision of ±0.3% absolute. Combustion analysis remains the primary method for determining molecular formulas of synthetic organic compounds.

**Thermogravimetric analysis (TGA)** records the mass of a sample as it is heated at a controlled rate under a defined atmosphere (air, nitrogen, or oxygen). A TGA curve shows steps corresponding to discrete decomposition events: loss of adsorbed water, loss of crystal water (hydrates), decomposition of carbonates, and oxidation of organic material. TGA is used to determine the water content of hydrated salts, the thermal stability of polymers, the ash content of materials, and the stoichiometry of thermal decomposition reactions. When combined with differential scanning calorimetry (DSC) or coupled to a mass spectrometer to identify evolved gases (TGA-MS), TGA becomes a powerful characterization tool.

---

# Chapter 6: Chemical Equilibrium and Activity

## 6.1 Activity and the Debye-Hückel Theory

The equilibrium constant expressions taught in introductory chemistry are written in terms of molar concentrations, but this is an approximation valid only at infinite dilution. In real solutions, ions are surrounded by an ionic atmosphere of opposite-charge ions that partially screens each ion's electric field. As a result, the effective concentration — the **thermodynamic activity** — of an ion is less than its stoichiometric concentration. The activity \(a_i\) is related to concentration by:

\[
a_i = \gamma_i [i]
\]

where \(\gamma_i\) is the **activity coefficient**, a dimensionless quantity that approaches 1 as the solution is diluted. All thermodynamically correct equilibrium constants must be written in terms of activities, not concentrations.

The key variable controlling activity coefficients is the **ionic strength**, \(I\):

\[
I = \frac{1}{2}\sum_i c_i z_i^2
\]

where the sum runs over all ions in solution, \(c_i\) is the molar concentration, and \(z_i\) is the charge number. Ionic strength weights multiply charged ions more heavily: a 0.01 M solution of MgSO₄ has \(I = \frac{1}{2}(0.01 \times 4 + 0.01 \times 4) = 0.04\) M, four times the ionic strength of 0.01 M NaCl.

The **Debye-Hückel limiting law (DHLL)** provides a theoretical relationship between activity coefficient and ionic strength for dilute solutions (\(I < 0.01\) M):

\[
\log \gamma_i = -0.509 z_i^2 \sqrt{I} \quad (25°\text{C, aqueous})
\]

The constant 0.509 (sometimes written as \(A\)) arises from fundamental physical constants, the dielectric constant of water, and temperature. The DHLL predicts that activity coefficients decrease (i.e., ions behave as if less concentrated than they are) as ionic strength increases, and that the effect is larger for more highly charged ions.

For solutions up to about \(I = 0.1\) M, the **extended Debye-Hückel equation** is more accurate:

\[
\log \gamma_i = \frac{-0.509 z_i^2 \sqrt{I}}{1 + \alpha_i \beta \sqrt{I}}
\]

where \(\alpha_i\) is an ion-size parameter (in picometres) and \(\beta = 0.0328\) nm⁻¹ M⁻¹/². Values of \(\alpha_i\) for common ions are tabulated; for most purposes, \(\alpha_i\beta \approx 1\) when \(I\) is in mol/L, simplifying the denominator to \(1 + \sqrt{I}\).

## 6.2 Equilibrium Calculations with Activity

The impact of ionic strength on solubility can be dramatic. Consider the solubility of AgCl (\(K_{sp} = 1.8 \times 10^{-10}\)) in a solution of KNO₃. The thermodynamic \(K_{sp}\) is:

\[
K_{sp} = a_{\text{Ag}^+} \cdot a_{\text{Cl}^-} = \gamma_{\text{Ag}^+}[\text{Ag}^+] \cdot \gamma_{\text{Cl}^-}[\text{Cl}^-]
\]

Adding an inert electrolyte (KNO₃) increases \(I\), decreases the activity coefficients, and therefore requires a higher concentration of Ag⁺ and Cl⁻ at equilibrium to maintain the same thermodynamic \(K_{sp}\). This is the **salting-in effect** (more properly the primary salt effect): the solubility of a sparingly soluble salt increases with ionic strength.

A systematic approach to multiequilibria problems — the type encountered constantly in analytical chemistry — begins by writing all relevant equilibria, the mass balance (conservation of analytical concentration), and the charge balance (conservation of charge). The charge balance for an aqueous solution of weak acid HA contains:

\[
[\text{H}^+] = [\text{A}^-] + [\text{OH}^-]
\]

These equations, combined with the equilibrium constant expressions, form a system that can be solved exactly (numerically) or approximately (by making justified simplifications). The skill of knowing which simplifications are valid — and checking them afterward — is central to analytical chemistry problem-solving.

## 6.3 Complex Formation and Its Effect on Solubility

Many metal ions form **coordination complexes** with ligands in solution, and the stability of these complexes profoundly affects solubility, speciation, and titrimetric reactions. The **formation constant** \(K_f\) (also called \(\beta\) or the stability constant) for a 1:1 metal-ligand complex ML is:

\[
K_f = \frac{[\text{ML}]}{[\text{M}][\text{L}]}
\]

Stepwise formation constants \(K_1, K_2, \ldots, K_n\) describe the sequential addition of ligands. The cumulative formation constant \(\beta_n = K_1 K_2 \cdots K_n\) gives the overall stability.

The solubility of a precipitate can increase dramatically in the presence of a complexing ligand. AgCl dissolves in concentrated ammonia because Ag⁺ forms the diamine complex \([\text{Ag(NH}_3)_2]^+\) with \(\beta_2 = 1.7 \times 10^7\). The effective solubility product in ammonia solution is \(K_{sp}' = K_{sp} \cdot \beta_2 \cdot [\text{NH}_3]^2\), which at 1 M NH₃ is \(1.8 \times 10^{-10} \times 1.7 \times 10^7 = 3.1 \times 10^{-3}\), giving a solubility of ~55 mg/L compared to the 1.9 mg/L in pure water.

---

# Chapter 7: Acid–Base Equilibria

## 7.1 Brønsted–Lowry Theory and pH

The **Brønsted-Lowry theory** defines an acid as any species capable of donating a proton (H⁺) and a base as any species capable of accepting a proton. This broader view supersedes the Arrhenius model (acids produce H₃O⁺ in water; bases produce OH⁻) and encompasses reactions in non-aqueous solvents and in the gas phase. Every Brønsted acid HA has a **conjugate base** A⁻, which is the species formed after proton loss; every base B has a conjugate acid BH⁺. The acid and its conjugate base are related by:

\[
K_a \cdot K_b = K_w = 1.01 \times 10^{-14} \quad (25°\text{C})
\]

The **pH** is defined as \(-\log a_{\text{H}^+}\), where \(a_{\text{H}^+}\) is the hydrogen ion activity. In practice, the distinction between activity and concentration is important for precise pH measurements but is often neglected for routine buffer calculations.

For a weak monoprotic acid HA at concentration \(C_a\), the equilibrium \(\text{HA} \rightleftharpoons \text{H}^+ + \text{A}^-\) gives:

\[
K_a = \frac{x^2}{C_a - x}
\]

where \(x = [\text{H}^+]\). If \(x \ll C_a\) (valid when \(C_a/K_a > 100\)), this simplifies to \(x \approx \sqrt{K_a C_a}\) and \(\text{pH} \approx \frac{1}{2}(\text{p}K_a - \log C_a)\). For stronger weak acids or very dilute solutions, the quadratic must be solved.

## 7.2 Buffers and the Henderson–Hasselbalch Equation

A **buffer** is a solution that resists changes in pH upon addition of small amounts of strong acid or base. Buffers consist of a conjugate acid-base pair, typically a weak acid HA and its conjugate base A⁻ (provided, e.g., as sodium salt NaA), present in comparable concentrations.

The **Henderson-Hasselbalch equation** can be derived directly from the Ka expression:

\[
K_a = \frac{[\text{H}^+][\text{A}^-]}{[\text{HA}]}
\]

Taking the negative logarithm of both sides:

\[
\text{pH} = \text{p}K_a + \log\frac{[\text{A}^-]}{[\text{HA}]}
\]

This equation is exact within the Brønsted-Lowry framework; its only approximation is the use of concentrations rather than activities. The pH of a buffer equals the pKa when \([\text{A}^-] = [\text{HA}]\); at this point, the **buffer capacity** — the moles of strong acid or base needed to change the pH by one unit per litre of buffer — is maximized. Effective buffering occurs in the range \(\text{p}K_a \pm 1\), corresponding to concentration ratios from 1:10 to 10:1. A well-designed buffer should have its pKa within 1 unit of the desired pH.

**Buffer capacity** \(\beta\) is defined as:

\[
\beta = \frac{dn_b}{d\text{pH}} = 2.303 C_a \frac{K_a[\text{H}^+]}{(K_a + [\text{H}^+])^2}
\]

where \(C_a\) is the total analytical buffer concentration and \(n_b\) is the moles of strong base added per litre. Buffer capacity increases with total buffer concentration and is maximum at \(\text{pH} = \text{p}K_a\).

## 7.3 Polyprotic Acids and Alpha Fractions

Many analytically important acids are **polyprotic** — they can donate more than one proton. Phosphoric acid (\(\text{H}_3\text{PO}_4\), p\(K_a\) = 2.15, 7.20, 12.35), carbonic acid (\(\text{H}_2\text{CO}_3\), p\(K_a\) = 6.35, 10.33), and amino acids with ionizable side chains all fall into this category.

For a diprotic acid H₂A (p\(K_{a1}\), p\(K_{a2}\)), the fraction of the total analytical concentration present as each species is given by the **alpha fractions**:

\[
\alpha_0 = \frac{[\text{H}^+]^2}{D}, \quad \alpha_1 = \frac{K_{a1}[\text{H}^+]}{D}, \quad \alpha_2 = \frac{K_{a1}K_{a2}}{D}
\]

where \(D = [\text{H}^+]^2 + K_{a1}[\text{H}^+] + K_{a1}K_{a2}\). **Distribution diagrams** plot these fractions as a function of pH; they provide an immediate visual picture of which species predominates at any given pH and are indispensable for understanding titration curves, solubility, and complex formation.

An **amphiprotic species** can act as either an acid or a base. The hydrogen carbonate ion HCO₃⁻ is amphoteric: it can accept a proton to form H₂CO₃ or donate a proton to form CO₃²⁻. The pH of a solution of a pure amphiprotic salt (e.g., NaHCO₃) is approximately:

\[
\text{pH} \approx \frac{1}{2}(\text{p}K_{a1} + \text{p}K_{a2})
\]

provided the species is reasonably concentrated. This result follows from the fact that the proton transfer from HCO₃⁻ to another HCO₃⁻ (autoprotolysis of the amphiprote) dominates the pH. The **isoelectric point (pI)** of an amino acid is the pH at which the net charge is zero; for a simple amino acid with \(\alpha\)-amino and \(\alpha\)-carboxyl groups, \(\text{pI} = \frac{1}{2}(\text{p}K_{a1} + \text{p}K_{a2})\), exactly analogous to the amphiprotic salt case.

---

# Chapter 8: Titrimetric Methods

## 8.1 Principles of Titrimetry and Primary Standards

**Titrimetry** encompasses all analytical methods in which a reagent of known concentration (the **titrant**) is added to a solution of the analyte until the reaction between them is complete. The volume of titrant at the **equivalence point** — the point at which stoichiometrically equivalent amounts of analyte and titrant have been combined — is used to calculate the analyte amount. The experimentally detected **endpoint** (detected by an indicator, a pH electrode, or a conductivity change) ideally coincides with the equivalence point, but in practice there is always a small difference called the **titration error**.

The titrant is a **standard solution** of precisely known concentration. This concentration is established either by dissolving a carefully weighed mass of a **primary standard** directly in a volumetric flask, or by **standardization** — titrating a secondary standard solution against a primary standard. A primary standard must satisfy strict criteria: it must be available in high purity (> 99.9%), have a high molar mass (to minimize weighing relative error), be stable indefinitely in air without absorbing moisture or CO₂, and react quantitatively and rapidly with the titrant. Common primary standards include potassium hydrogen phthalate (KHP, \(M = 204.23\) g/mol) for acid solutions, sodium carbonate for base solutions, potassium dichromate for oxidizing titrants, and sodium oxalate for permanganate.

## 8.2 Acid-Base Titration Curves

Understanding the shape of a **titration curve** — a plot of pH versus volume of titrant added — is essential for choosing appropriate indicators, detecting unusual behavior, and locating endpoints.

For the **strong acid/strong base** case, the calculation is straightforward. Before any base is added, pH = −log[H⁺] for a strong acid. After the equivalence point, pH is determined by the excess strong base. At the equivalence point, both the acid and base have been consumed, and the solution is pure water; pH = 7.00 at 25 °C. The titration curve is sigmoidal, with a steep inflection at the equivalence point spanning roughly ±0.1 mL of the endpoint for a 25 mL titration of 0.1 M solutions.

For the **weak acid/strong base** case, the curve has a different character. Before any base is added, the weak acid partially dissociates and pH is calculated from the Ka expression. In the **buffer region** (between the start and the equivalence point), the Henderson-Hasselbalch equation applies: at exactly the half-equivalence point, pH = pKa. This is a useful relationship for determining pKa values from titration data. At the equivalence point, all the weak acid has been converted to its conjugate base (e.g., acetate); the solution is basic, and pH is calculated from the Kb of the conjugate base. After the equivalence point, the excess strong base dominates and pH is the same as for the strong acid/strong base case. The equivalence point pH for a weak acid titration is always greater than 7.

The **Gran plot** is a linearization technique for locating the equivalence point without needing to identify the inflection of the sigmoid curve directly. For an acid-base titration beyond the equivalence point, the Gran function is:

\[
(V_0 + V)[\text{OH}^-] = V \cdot c_b - V_e \cdot c_b
\]

where \(V\) is the volume of strong base added, \(V_e\) is the volume at equivalence, and \(c_b\) is the base concentration. A plot of this function versus \(V\) is linear, and the x-intercept gives \(V_e\) precisely. Gran plots are especially valuable for titrations of weak acids or bases where the pH change at the equivalence point is poorly defined.

**Acid-base indicators** are weak acids (HIn) whose conjugate base (In⁻) has a distinctly different color. The transition between the two colors occurs over approximately \(\text{p}K_{\text{HIn}} \pm 1\). The visual endpoint is perceived at the pH where [In⁻]/[HIn] ≈ 10/1 (for a transition toward the basic color) or 1/10 (for a transition toward the acid color), spanning a visible color range of about 2 pH units. For a titration of a weak acid with Ka = 10⁻⁵, the equivalence point occurs near pH 9; an indicator like phenolphthalein (transition range pH 8.2–10.0) is appropriate, while methyl orange (transition pH 3.1–4.4) is not.

## 8.3 EDTA and Complexometric Titrations

**Ethylenediaminetetraacetic acid (EDTA)**, whose systematic name is 2,2',2'',2'''-(ethane-1,2-diyldinitrilo)tetraacetic acid, was introduced as an analytical reagent in the 1940s by Gerold Schwarzenbach, who recognized that its hexadentate nature (two nitrogen donors and four carboxylate oxygens) allowed it to form extremely stable 1:1 chelate complexes with virtually all metal ions. The EDTA molecule has six ionizable protons (the tetraacid, H₄Y, with two ammonium protons), with pKa values of 0.0, 1.5, 2.0, 2.68, 6.11, and 10.17. The fully deprotonated form Y⁴⁻ is the one that forms the most stable complexes.

The overall **formation constant** \(K_f\) for the metal-EDTA complex MY is:

\[
K_f = \frac{[\text{MY}]}{[\text{M}][\text{Y}^{4-}]}
\]

Values range from \(10^8\) (Mg²⁺) to \(10^{25}\) (Fe³⁺). The large values ensure quantitative complexation at the equivalence point, producing sharp titration curves. However, because the concentration of Y⁴⁻ depends strongly on pH (with \(\alpha_{Y^{4-}}\) dropping from nearly 1 at pH > 12 to \(3.7 \times 10^{-7}\) at pH 4), the titration must be buffered. The **conditional formation constant** \(K_f'\) accounts for the pH dependence:

\[
K_f' = \alpha_{Y^{4-}} \cdot K_f
\]

where \(\alpha_{Y^{4-}} = [\text{Y}^{4-}]/C_{\text{EDTA,free}}\) is the fraction of uncomplexed EDTA present as Y⁴⁻ at a given pH. The minimum pH for a successful EDTA titration depends on \(K_f\): metals with large \(K_f\) can be titrated at low pH; those with small \(K_f\) require alkaline conditions.

**Metallochromic indicators** such as Eriochrome Black T (EBT) and Calmagite are dyes that form colored complexes with metal ions, with the metal-dye complex and the free dye having distinctly different colors. At the endpoint, EDTA displaces the metal from the indicator, causing a sharp color change. The condition for a sharp endpoint is that \(K_f'(\text{MY}) > K_f'(\text{MIn}) \times 10^2\); otherwise, the indicator remains bound to the metal even after the equivalence point. **Auxiliary complexing agents** such as ammonia or tartrate are sometimes added to prevent hydroxide precipitation at high pH while keeping the metal in solution for EDTA titration.

## 8.4 Precipitation Titrations

Precipitation titrations determine analytes that form sparingly soluble salts upon reaction with the titrant. The most important is the **argentometric titration** of halides using silver nitrate as titrant.

The **Mohr method** uses CrO₄²⁻ as the indicator for the direct titration of Cl⁻ with AgNO₃ in neutral solution. When all Cl⁻ has been precipitated as white AgCl, the first slight excess of Ag⁺ precipitates brick-red Ag₂CrO₄, signaling the endpoint. For the endpoint to coincide closely with the equivalence point, the CrO₄²⁻ concentration must be carefully controlled (approximately 0.005 M). The method requires near-neutral pH (6.5–9); at low pH, CrO₄²⁻ converts to Cr₂O₇²⁻ and the endpoint is obscured.

The **Volhard method** is a back-titration in which excess AgNO₃ is added to precipitate all Cl⁻ (or other anion), and the excess Ag⁺ is titrated with standard KSCN in acid solution using Fe³⁺ as indicator. The endpoint is the appearance of the red Fe(SCN)²⁺ complex. Because the method is performed in acid solution, it is applicable to situations where the Mohr method fails (low pH, presence of PO₄³⁻, AsO₄³⁻, or other anions that precipitate with Ag⁺ at neutral pH). A correction must be applied because AgCl partially redissolves during the SCN⁻ back-titration (since \(K_{sp}(\text{AgSCN}) < K_{sp}(\text{AgCl})\)); this is avoided by filtering AgCl before back-titration or by adding a large volume of indicator.

The **Fajans method** uses **adsorption indicators** — dyes such as fluorescein or dichlorofluorescein that adsorb onto the precipitate surface after the equivalence point when the precipitate surface charge reverses. Before the equivalence point, AgCl particles are coated with excess Cl⁻ (negative surface, which repels the anionic fluorescein dye). After the equivalence point, excess Ag⁺ reverses the surface charge to positive, fluorescein adsorbs, and its color changes from green-yellow to pink. The method is rapid and direct, but requires a colloidal suspension (not coarse precipitate) to maximize surface area.

---

# Chapter 9: Spectroscopy and Optical Instrumentation

## 9.1 The Electromagnetic Spectrum and Atomic/Molecular Energy

The electromagnetic spectrum spans an enormous range of frequencies and energies, from radio waves with wavelengths of meters and photon energies of nanoelectronvolts to gamma rays with wavelengths of picometres and photon energies of megaelectronvolts. The energy of a photon is related to its frequency and wavelength by:

\[
E = h\nu = \frac{hc}{\lambda}
\]

where \(h = 6.626 \times 10^{-34}\) J·s is Planck's constant, \(\nu\) is frequency in Hz, \(c = 2.998 \times 10^8\) m/s is the speed of light, and \(\lambda\) is wavelength. The **wavenumber** \(\tilde{\nu} = 1/\lambda\) (in cm⁻¹) is proportional to energy and is favored in infrared spectroscopy.

Atoms and molecules exist in discrete energy states; transitions between states involve absorption or emission of photons whose energy exactly matches the energy gap \(\Delta E = E_2 - E_1\). Molecular energy has three main contributions: **electronic transitions** (rearrangement of electrons between molecular orbitals, UV-Vis region, 1–10 eV), **vibrational transitions** (stretching and bending of bonds, IR region, 0.05–0.5 eV), and **rotational transitions** (end-over-end rotation of the molecular framework, microwave region, 10⁻⁴–10⁻² eV). In analytical chemistry, we most commonly exploit electronic transitions (UV-Vis, fluorescence, AAS/AES) and vibrational transitions (FTIR).

**Absorption spectroscopy** measures the fraction of incident radiation absorbed by the sample at each wavelength. **Emission spectroscopy** measures radiation emitted by excited atoms or molecules as they relax to lower energy states. **Scattering** redirects photons without changing their energy (elastic, Rayleigh) or with a frequency shift (inelastic, Raman). Each of these interactions provides complementary information about molecular structure and identity.

## 9.2 Beer-Lambert Law

The **Beer-Lambert law** is the quantitative foundation of absorption spectroscopy. To derive it, consider a thin layer of solution of thickness \(dx\) at position \(x\) along the light path. The power lost, \(dP\), is proportional to the incident power \(P\), the concentration of absorbing species \(c\), and the thickness:

\[
dP = -\varepsilon c \, P \, dx
\]

Integrating from \(x = 0\) (incident power \(P_0\)) to \(x = b\) (transmitted power \(P\)):

\[
\ln\frac{P}{P_0} = -\varepsilon c b \cdot \ln 10
\]

Converting to log base 10 and defining **absorbance** \(A = -\log(P/P_0) = \log(P_0/P)\):

\[
A = \varepsilon b c
\]

where \(\varepsilon\) is the **molar absorptivity** (L mol⁻¹ cm⁻¹), \(b\) is the path length in cm, and \(c\) is the molar concentration. The **transmittance** \(T = P/P_0\) ranges from 0 (complete absorption) to 1 (no absorption). Because absorbance is directly proportional to concentration (the linear form of the Beer-Lambert law), it is the preferred form for quantitative work. Note that transmittance is not linearly related to concentration: \(A = -\log T\), so equal intervals of absorbance correspond to multiplicative intervals of transmittance.

Deviations from the linear Beer-Lambert law arise from both instrumental and chemical sources. **Instrumental deviations** include polychromatic radiation (a real monochromator transmits a finite bandwidth; if the molar absorptivity varies significantly across this bandwidth, the apparent calibration is nonlinear) and **stray light** (radiation reaching the detector without passing through the sample gives a positive signal that causes a negative deviation at high absorbances, limiting the useful range to \(A < 2\) for most instruments). **Chemical deviations** arise from concentration-dependent changes in the chemistry of the analyte: association at high concentration, pH changes, or equilibria that produce absorbing and non-absorbing forms of the same analyte.

## 9.3 Optical Components of a Spectrophotometer

Every spectrophotometric instrument contains the same basic components in sequence: a radiation source, a wavelength selector, a sample container (cuvette), a detector, and a signal processing/readout system.

**Radiation sources** must provide sufficient intensity across the wavelength range of interest. For the UV region (190–360 nm), a **deuterium arc lamp** provides a continuous spectrum; its high-pressure hydrogen plasma emits a continuum from ~ 160 nm to ~ 380 nm. For the visible and near-IR region (320–2500 nm), a **tungsten-halogen lamp** provides a continuous spectrum arising from blackbody radiation; the halogen cycle (iodine regenerates the tungsten filament) allows higher operating temperatures and longer lamp life. Modern instruments often use **LEDs** as stable, long-life sources for specific wavelength ranges, though their bandwidth is wider than a continuous source filtered through a monochromator.

**Wavelength selectors** isolate a narrow band of wavelengths for the measurement. **Absorption filters** (colored glass or interference filters) transmit broad bandpasses (10–200 nm) and are simple and inexpensive but provide poor wavelength resolution. **Prism monochromators** disperse light by refraction; the angular dispersion is nonlinear (greater at short wavelengths) because the refractive index of glass varies nonlinearly with wavelength. **Diffraction grating monochromators** disperse light by interference from a ruled or holographically produced grating surface. The grating equation is:

\[
n\lambda = d(\sin\theta_i + \sin\theta_r)
\]

where \(n\) is the diffraction order, \(d\) is the grating ruling spacing, and \(\theta_i\) and \(\theta_r\) are the angles of incidence and diffraction. Gratings provide nearly linear angular dispersion with wavelength and are used in virtually all modern instruments.

**Detectors** convert photons to an electrical signal. The **photomultiplier tube (PMT)** uses the photoelectric effect (photocathode) followed by a cascade of secondary emissions from successive dynodes (each dynode at a higher potential multiplies the electron count by a factor of 3–5), achieving current gains of 10⁶–10⁸. PMTs are extremely sensitive, fast, and have low noise, making them the detector of choice for fluorescence spectroscopy and low-light applications. **Photodiode array (PDA)** and **charge-coupled device (CCD)** detectors are multichannel devices: an entire spectrum is captured simultaneously by dispersing the radiation across an array of detector elements, allowing rapid spectral acquisition without scanning. The tradeoff versus PMTs is lower sensitivity and higher dark current.

---

# Chapter 10: UV–Vis Absorption and Fluorometry

## 10.1 Electronic Transitions and Chromophores

The absorption of UV and visible radiation by organic molecules involves the promotion of an electron from a filled molecular orbital to an unfilled orbital of higher energy. The two most analytically important transitions are \(\pi \to \pi^*\) (from a bonding \(\pi\) orbital to an antibonding \(\pi^*\) orbital in conjugated systems) and \(n \to \pi^*\) (from a non-bonding orbital on a heteroatom such as O, N, or S to a \(\pi^*\) orbital). A **chromophore** is the part of a molecule responsible for absorption; common chromophores include the carbonyl group (\(n \to \pi^*\) at ~280 nm, \(\varepsilon \sim 10\)–100; \(\pi \to \pi^*\) at ~190 nm, \(\varepsilon \sim 10^4\)), aromatic rings (\(\pi \to \pi^*\) multiple bands, 200–280 nm), and conjugated dienes (\(\pi \to \pi^*\) around 250 nm, \(\varepsilon \sim 10^4\)).

**Solvatochromism** is the shift in absorption maximum with solvent polarity. Polar solvents stabilize polar excited states more than ground states, causing bathochromic (red) shifts for \(n \to \pi^*\) transitions in polar solvents. Conversely, non-polar solvents may cause hypsochromic (blue) shifts. These effects must be considered when designing UV-Vis methods that require a specific wavelength of maximum absorption (\(\lambda_{\max}\)).

For quantitative UV-Vis analysis, the measurement wavelength is chosen at \(\lambda_{\max}\) of the analyte to maximize sensitivity (highest \(\varepsilon\)) and to be on the flat part of the absorption peak (minimizing sensitivity to small wavelength errors, since \(d\varepsilon/d\lambda \approx 0\) at the maximum). Samples should be prepared in matched cuvettes (same optical path length, same material) with solvent in the reference cuvette; the instrument then measures the ratio \(P/P_0\) automatically.

## 10.2 Multi-Component Spectrophotometric Analysis

If two analytes X and Y absorb at the same wavelength, the total absorbance is additive (Beer-Lambert law is a linear relationship):

\[
A_\lambda = \varepsilon_{X,\lambda} b c_X + \varepsilon_{Y,\lambda} b c_Y
\]

By measuring absorbance at two wavelengths \(\lambda_1\) and \(\lambda_2\) and solving the resulting system of two equations for \(c_X\) and \(c_Y\), both analytes can be quantified simultaneously without prior separation. This can be generalized to \(n\) components by measuring at \(n\) wavelengths and solving the matrix equation \(\mathbf{A} = \mathbf{E} \mathbf{c}\), where \(\mathbf{E}\) is the matrix of molar absorptivities. The method works well when the absorption spectra of the components are sufficiently different (i.e., the matrix \(\mathbf{E}\) is well-conditioned).

## 10.3 Fluorescence and the Jablonski Diagram

**Fluorescence** is the emission of a photon as a molecule relaxes from an excited singlet electronic state (S₁) back to the ground state (S₀). The sequence of events is elegantly depicted in the **Jablonski diagram**. After absorption of a photon to reach an upper vibrational level of S₁ (or S₂), **internal conversion** and **vibrational relaxation** (both radiationless, occurring in 10⁻¹² to 10⁻¹⁰ s) bring the molecule to the lowest vibrational level of S₁. From S₁, the molecule can relax by: fluorescence emission (radiative, ~10⁻⁹ s, **k_f**), intersystem crossing to the triplet state T₁ (spin-forbidden but can occur via spin-orbit coupling, **k_{ISC}**), internal conversion directly to S₀ (**k_{IC}**), or radiationless quenching by interaction with solvent or quencher (**k_q[Q]**).

The **Stokes shift** is the red shift of the emission maximum relative to the absorption maximum, arising from vibrational relaxation in S₁ and the fact that the emitting geometry is slightly different from the absorbing geometry. It is what allows fluorescence detection: one can irradiate with light at \(\lambda_{ex}\) and observe emission at longer \(\lambda_{em}\) using an emission filter or monochromator, blocking the excitation source signal.

The **fluorescence quantum yield** \(\Phi_f\) is the fraction of absorbed photons that result in emitted photons:

\[
\Phi_f = \frac{k_f}{k_f + k_{IC} + k_{ISC} + k_q[\text{Q}]}
\]

In highly fluorescent compounds (fluorophores) such as fluorescein (\(\Phi_f = 0.95\)) or rhodamine B, fluorescence emission is very efficient. Small, rigid, aromatic, planar molecules tend to have high quantum yields; flexible molecules lose energy through bond rotations.

**Phosphorescence** is emission from the T₁ state after intersystem crossing. Because the T₁ → S₀ transition is spin-forbidden, it occurs slowly (microseconds to seconds), resulting in the characteristic long afterglow of phosphorescent materials. In solution at room temperature, T₁ is usually quenched before it can emit; phosphorescence is typically observed in rigid matrices (frozen solutions, polymers, or surfaces) that prevent quencher diffusion.

## 10.4 Stern–Volmer Quenching

**Quenching** reduces the fluorescence intensity of a fluorophore. In **dynamic (collisional) quenching**, the excited fluorophore is deactivated by collision with a quencher Q before it can emit. The **Stern-Volmer equation** describes how fluorescence intensity ratio varies with quencher concentration:

\[
\frac{I_0}{I} = 1 + K_{SV}[\text{Q}]
\]

where \(I_0\) and \(I\) are fluorescence intensities in the absence and presence of quencher, and \(K_{SV} = k_q \tau_0\) is the Stern-Volmer quenching constant (\(k_q\) is the bimolecular quenching rate constant and \(\tau_0\) is the unquenched fluorescence lifetime). A plot of \(I_0/I\) vs. [Q] is linear for pure dynamic quenching, with slope \(K_{SV}\).

In **static quenching**, the quencher forms a non-fluorescent complex with the fluorophore in the ground state. Static quenching gives a similar Stern-Volmer plot but can be distinguished from dynamic quenching by temperature dependence (static quenching decreases with temperature as the complex dissociates) or by fluorescence lifetime measurements (dynamic quenching shortens \(\tau\); static quenching does not affect \(\tau\) of the free fluorophore).

---

# Chapter 11: Atomic Spectroscopy

## 11.1 Flame Atomization and Atomic Absorption

In atomic spectroscopy, samples are first atomized — converted to a population of free, gaseous atoms — and those atoms are then probed by their interaction with radiation. The element concentration in the original sample is related to the atomic population, which is related to the absorption or emission signal. Atomic spectroscopy methods are among the most powerful tools for trace elemental analysis: they are element-specific (each element has unique atomic transitions), sensitive (detection limits reach parts per trillion for some elements), and fast (seconds per element for flame methods, minutes for ICP-MS multi-element scans).

The **Boltzmann distribution** governs the fraction of atoms in an excited state at thermal equilibrium:

\[
\frac{N^*}{N_0} = \frac{g^*}{g_0} \exp\!\left(-\frac{E^*}{kT}\right)
\]

where \(N^*\) and \(N_0\) are the populations of the excited and ground states, \(g^*\) and \(g_0\) are their statistical weights, \(E^*\) is the excitation energy, \(k\) is the Boltzmann constant, and \(T\) is the temperature. At flame temperatures (2000–3000 K), only a small fraction of atoms are thermally excited; most remain in the ground state. This means the atomic absorption signal (proportional to ground-state population) is nearly equal to the total atom population — a major reason why AAS is quantitative.

In **flame atomic absorption spectrometry (FAAS)**, the sample solution is nebulized into a fine aerosol by a pneumatic nebulizer, mixed with fuel (acetylene) and oxidant (air or N₂O) in a spray chamber (where large droplets are removed by impact), and introduced as a thin mist into a premixed laminar-flow burner. The flame atomizes the sample over a path length of typically 10 cm. A **hollow-cathode lamp (HCL)** containing the element of interest serves as the source; it emits the sharp atomic lines of that element (because the cathode is made of the same element), which match the absorption lines of the analyte atoms precisely. The fraction of the HCL radiation absorbed by the atomized sample gives the absorbance, which follows Beer-Lambert law.

## 11.2 Graphite Furnace AAS

The **graphite furnace atomic absorption spectrometer (GFAAS)**, also called electrothermal AAS (ETAAS), replaces the flame with a small graphite tube (typically 20–30 mm long, 5 mm diameter) that is resistively heated in a controlled, programmed sequence. A few microlitres of sample are injected directly into the tube. The heating program has four stages:
1. **Drying** (~120 °C): removes solvent
2. **Ashing (pyrolysis)** (~400–900 °C): destroys organic matrix and volatile inorganic species
3. **Atomization** (~1700–2600 °C, rapid ramp): vaporizes and atomizes the analyte; absorbance is measured here
4. **Cleaning** (>2600 °C): removes residual sample

The **L'vov platform** is a small graphite shelf inside the furnace tube. Injecting sample onto the platform rather than the tube wall delays atomization until the gas phase above the platform has reached thermal equilibrium with the tube walls, reducing chemical interferences from matrix vapors. Detection limits for GFAAS are 100–1000 times lower than for FAAS (typically 0.001–0.1 µg/L), because the entire sample is atomized in the confined tube volume rather than being rapidly swept through a flame.

**Background correction** is essential in GFAAS because molecular absorption and light scattering from unvolatilized matrix constituents can produce significant apparent absorbance at the atomization temperature. **Zeeman background correction** uses a magnetic field to split the atomic absorption line by the Zeeman effect; measurements with and without the field allow the baseline (background) to be measured at essentially the same wavelength as the analytical line, providing ideal correction. The **Smith-Hieftje correction** uses high current pulsing of the HCL to cause self-reversal of the emission line; the reversed lamp profile passes around the analyte absorption line, measuring background near the peak.

## 11.3 ICP-OES and ICP-MS

The **inductively coupled plasma (ICP)** is the most widely used atomization and excitation source in modern elemental analysis. The ICP is generated by passing argon gas through a torch consisting of three concentric quartz tubes while coupling radiofrequency energy (typically 1.2 kW at 27 or 40 MHz) through an induction coil surrounding the outer tube. Once initiated by a spark, the plasma self-sustains through resistive (Ohmic) heating of the ionized gas. The plasma reaches temperatures of 6000–8000 K in the analytical zone — far hotter than any chemical flame — which completely atomizes and efficiently excites even refractory elements such as tungsten, tantalum, and boron that flame AAS handles poorly.

In **ICP optical emission spectrometry (ICP-OES)**, the intense light emitted by excited atoms and ions in the plasma is spectrally resolved and detected. Because virtually all elements emit simultaneously in the ICP, ICP-OES can determine 20–60 elements simultaneously in a single aspiration. The plasma can be viewed **axially** (along the axis of the plasma torch, aligned with the spectrometer) or **radially** (from the side). Axial viewing provides longer path lengths and thus higher sensitivity (up to 10× lower detection limits) but suffers more from matrix effects and background emission from the hotter tail flame. Radial viewing is less susceptible to matrix effects and is preferred for high-matrix samples. Detection limits for ICP-OES are typically 0.1–100 µg/L, significantly better than flame AAS for most elements, and comparable to GFAAS for many.

---

# Chapter 12: Principles of Chromatographic Separation

## 12.1 Fundamental Concepts and Retention

Chromatography is a family of separation techniques in which components of a mixture are distributed between two phases: a stationary phase (which is fixed) and a mobile phase (which moves through or over the stationary phase). Components that interact more strongly with the stationary phase move more slowly; those with greater affinity for the mobile phase move more quickly. The result is that components emerge from the chromatographic system at different times (elution mode) or migrate to different positions (planar mode).

The **retention time** \(t_r\) is the time between sample injection and the peak maximum for a given component. The **dead time** (also called the holdup time or void time) \(t_M\) is the retention time of an unretained species — one with no affinity for the stationary phase — and reflects the time required simply to travel through the void volume of the column. The **adjusted retention time** \(t'_r = t_r - t_M\) corrects for this dead time and reflects only the time the analyte spends adsorbed on (or dissolved in) the stationary phase.

The **retention factor** (capacity factor) \(k\) is a dimensionless measure of retention:

\[
k = \frac{t'_r}{t_M} = \frac{n_s}{n_m}
\]

where the last ratio is the number of moles of analyte in the stationary phase to the number in the mobile phase at equilibrium. Analytes with \(k < 1\) are poorly retained and elute close to the dead time; those with \(k > 10\) are strongly retained and elute late with broad peaks. The ideal range for GC and HPLC separations is typically \(2 \leq k \leq 10\). The **selectivity factor** \(\alpha = k_2/k_1\) (with \(k_2 > k_1\)) measures how well two adjacent analytes are separated by the stationary phase; \(\alpha = 1\) means the stationary phase cannot distinguish them.

## 12.2 Column Efficiency and the van Deemter Equation

The **peak width** in a chromatogram reflects the spread of analyte molecules about their average retention time. This spreading — called **zone broadening** or **band broadening** — is quantified by the **plate number** \(N\):

\[
N = \left(\frac{t_r}{w_{1/2}}\right)^2 \times 5.545 = \left(\frac{t_r}{\sigma}\right)^2
\]

where \(w_{1/2}\) is the peak width at half-maximum height and \(\sigma\) is the Gaussian standard deviation of the peak. The **height equivalent to a theoretical plate** \(H\) is:

\[
H = \frac{L}{N}
\]

where \(L\) is the column length. A high \(N\) (small \(H\)) means narrow peaks and better separation.

The **van Deemter equation** describes how \(H\) depends on mobile phase velocity \(u\):

\[
H = A + \frac{B}{u} + Cu
\]

The three terms arise from three distinct physical processes. The **A term** (Eddy diffusion or multiple path term) arises because different flow paths through the irregularly packed column have different lengths; solute molecules taking longer paths are delayed relative to those taking shorter paths. \(A = 2\lambda d_p\), where \(d_p\) is the particle diameter and \(\lambda\) is a packing irregularity factor. The **B term** (longitudinal diffusion term) arises from diffusion of solute along the column axis from higher to lower concentration regions: at low flow velocities, solute spends more time in the column and diffuses more. \(B \approx 2\gamma D_m\), where \(D_m\) is the diffusion coefficient in the mobile phase. The **C term** (mass transfer term) arises from the finite rate of equilibration between mobile and stationary phases: solute in the mobile phase moves ahead of stationary-phase equilibrium, and the slow mass transfer broadens the peak. At the **van Deemter minimum** (\(u_{opt} = \sqrt{B/C}\)), the plate height \(H\) is minimized (\(H_{min} = A + 2\sqrt{BC}\)).

## 12.3 Resolution and the Master Equation

The goal of a chromatographic separation is to resolve adjacent peaks. **Resolution** \(R_s\) is defined as:

\[
R_s = \frac{t_{r2} - t_{r1}}{\frac{1}{2}(w_1 + w_2)}
\]

where \(w_1\) and \(w_2\) are peak widths at base. An \(R_s\) of 1.0 gives approximately 2% overlap; \(R_s = 1.5\) gives baseline resolution (< 0.1% overlap). The **master resolution equation** expresses resolution in terms of the three fundamental chromatographic parameters — efficiency, selectivity, and retention:

\[
R_s = \frac{\sqrt{N}}{4} \cdot \frac{\alpha - 1}{\alpha} \cdot \frac{k_2}{1 + k_2}
\]

This equation reveals the leverage of each parameter. Because \(R_s \propto \sqrt{N}\), doubling resolution by increasing plate number requires quadrupling \(N\) (a 4× longer column or 4× smaller particles). Because \(R_s\) is highly sensitive to \(\alpha\) near 1 (the selectivity term \((\alpha-1)/\alpha\) goes to zero when \(\alpha \to 1\)), even a small change in stationary phase chemistry or temperature that increases \(\alpha\) from 1.05 to 1.10 can dramatically improve separation. The retention term \(k_2/(1+k_2)\) approaches 1 when \(k_2 > 10\), so further increases in \(k\) beyond this range do not significantly improve resolution but do increase analysis time.

---

# Chapter 13: Gas Chromatography and SPME

## 13.1 Columns and Stationary Phases

Gas chromatography separates volatile compounds by partitioning them between an inert gaseous mobile phase and a liquid or polymer stationary phase coated on the inner wall of a narrow tube (open-tubular column) or packed on a solid support (packed column). GC is limited to analytes with appreciable vapor pressure at achievable column temperatures (typically up to 400 °C) and thermal stability. This encompasses the majority of organic compounds up to about 1000 g/mol, including hydrocarbons, solvents, pesticides, flavor compounds, and drugs of abuse, making GC one of the most widely used separation techniques in both industry and research.

Modern GC uses predominantly **open-tubular (capillary) columns** of two types. **Wall-coated open-tubular (WCOT) columns** have the stationary phase applied as a thin film (0.1–5 µm) directly to the inner wall of a fused-silica capillary (0.10–0.53 mm i.d., 15–60 m long). **Support-coated open-tubular (SCOT) columns** have the stationary phase coated on a support deposited on the wall; they can hold more stationary phase but are less efficient than WCOT. Because open-tubular columns have no packing, the Golay form of the van Deemter equation applies (no A term):

\[
H = \frac{B}{u} + Cu
\]

yielding higher efficiency (\(N > 10^5\) per column) than packed columns (\(N \sim 10^3\)–\(10^4\)).

**Stationary phase polarity** determines which compounds are separated and how. Non-polar phases such as polydimethylsiloxane (PDMS, e.g., SE-30, DB-1) retain non-polar compounds longest. Polar phases such as polyethylene glycol (PEG, Carbowax) retain polar compounds. The **McReynolds constants** provide a quantitative polarity scale based on retention indices for probe compounds; they allow objective comparison of stationary phase selectivities. The general rule is to choose a column whose polarity matches the polarity of the analytes (like dissolves like), which maximizes selectivity between similar compounds.

**Temperature programming** is used when the sample contains compounds with a wide range of boiling points. Running the analysis at constant temperature (isocratic) causes early-eluting compounds to have poor resolution (small \(k\)) and late-eluting compounds to be overly broad and delayed. Ramping the column temperature during the run — starting low (to retain and resolve early peaks) and ending high (to elute late compounds quickly) — compresses the range of \(k\) values and gives uniformly sharp peaks across the entire chromatogram.

## 13.2 Injection and Detection

GC sample introduction requires careful technique to avoid discrimination (preferential loss of high-boiling components in the inlet) and peak broadening. **Split injection** is used for concentrated samples: a small fraction (typically 1/20 to 1/1000) of the vaporized sample enters the column, and the rest is vented. **Splitless injection** injects the entire sample onto the column and is used for trace-level analysis. **On-column injection** deposits the liquid sample directly into the cool column inlet (with no vaporization step), minimizing thermal discrimination for thermally labile compounds.

GC detectors differ enormously in selectivity and sensitivity. The **flame ionization detector (FID)** burns the column effluent in a hydrogen/air flame; organic molecules produce ions that are collected by a biased electrode, generating a current proportional to the number of carbon atoms entering the flame per second. The FID responds to virtually all organic compounds with C-H bonds (with an insignificant response to CO₂, H₂O, and fully halogenated compounds) and has a linear dynamic range of ~10⁷. The **thermal conductivity detector (TCD)** measures changes in the thermal conductivity of the column effluent relative to a reference stream of carrier gas; it is universal (responds to all compounds including inorganic gases) but ~1000 times less sensitive than the FID.

The **electron capture detector (ECD)** is selective for electronegative compounds (halogenated pesticides, PCBs, drugs). A radioactive ⁶³Ni foil emits beta particles that ionize the carrier gas (N₂), generating a standing current; electron-capturing analytes reduce this current. The ECD is exquisitely sensitive (detection limits in the femtogram range for DDT) but has a small linear range (~10³). The **nitrogen-phosphorus detector (NPD)** is selective for nitrogen- and phosphorus-containing compounds; it uses a rubidium bead in a hydrogen/air flame to produce catalytically ionized products from N and P. The **photoionization detector (PID)** uses a UV lamp to ionize analytes with low ionization potentials, offering high sensitivity for aromatic hydrocarbons and alkenes.

## 13.3 Solid-Phase Microextraction

**Solid-phase microextraction (SPME)** is a solvent-free sample preparation technique introduced by Pawliszyn and coworkers at the University of Waterloo in 1990 (a connection of historical pride for CHEM 220 students). A fused-silica fiber coated with a polymeric stationary phase is exposed to the sample — either immersed in the liquid (**direct immersion SPME**) or held above the sample in the vapor headspace (**headspace SPME**) — and analytes partition from the matrix into the fiber coating.

Common fiber coatings include polydimethylsiloxane (PDMS, non-polar), polyacrylate (PA, polar), Carbowax/polyethylene glycol (polar), and blended coatings such as DVB/CAR/PDMS (divinylbenzene/Carboxen/PDMS), which provide broad-spectrum extraction for both volatile and semi-volatile analytes. After extraction, the fiber is inserted into the GC injector port, where thermal desorption (250–300 °C) quantitatively transfers the analytes to the column. SPME can also be coupled to HPLC using a special desorption interface with solvent.

SPME is an **equilibrium technique**: the amount of analyte extracted is not the total amount in the sample but the amount that partitions into the fiber at equilibrium. The amount extracted \(n\) is:

\[
n = \frac{K_{fs} V_f C_0 V_s}{K_{fs} V_f + V_s}
\]

where \(K_{fs}\) is the fiber/sample distribution coefficient, \(V_f\) and \(V_s\) are fiber coating and sample volumes, and \(C_0\) is the initial analyte concentration. When \(V_s \gg K_{fs} V_f\) (large sample, dilute analyte, or small fiber), \(n \approx K_{fs} V_f C_0\), meaning the extracted amount is proportional to the initial concentration — the basis of quantitation.

---

# Chapter 14: High-Performance Liquid Chromatography

## 14.1 HPLC Modes and Stationary Phases

High-performance liquid chromatography (HPLC) separates compounds dissolved in a liquid mobile phase by distributing them between the mobile phase and a solid or liquid stationary phase packed into a stainless-steel column. Unlike GC, HPLC is not limited to volatile compounds; it can separate proteins, carbohydrates, pharmaceuticals, inorganic ions, and essentially any species that can be dissolved in a compatible solvent. For this reason, HPLC has become the dominant analytical separation technique in the pharmaceutical industry, food analysis, environmental monitoring, and clinical chemistry.

**Normal-phase HPLC (NP-HPLC)** uses a polar stationary phase (silica, NH₂, CN, or cyano-propyl) and a non-polar organic mobile phase (hexane, dichloromethane). Polar compounds are retained longest; non-polar compounds elute first. Normal phase is used for separating lipids, vitamins, and geometric isomers.

**Reversed-phase HPLC (RP-HPLC)** uses a non-polar bonded stationary phase (octadecylsilane, C18, or shorter chains C8, C4, phenyl) and a polar aqueous-organic mobile phase (water–methanol, water–acetonitrile). The reversed-phase name reflects the reversal of polarity compared to normal-phase: non-polar compounds are retained longest. RP-HPLC accounts for more than 70% of all HPLC analyses because water-based mobile phases are compatible with biological samples, and the broad range of C18 stationary phase chemistries allows fine-tuning of selectivity. Mobile phase strength is adjusted by varying the organic modifier fraction: pure water (weakest), increasing acetonitrile or methanol increases eluting strength.

**Ion-exchange chromatography (IEC)** uses stationary phases with ionizable functional groups (strongly acidic sulfonate: SCX; weakly acidic carboxylate: WCX; strongly basic quaternary ammonium: SAX; weakly basic amino: WAX) that exchange with sample ions of the same sign. IEC is used for inorganic ion analysis (ion chromatography), amino acid analysis, and protein purification. **Size-exclusion chromatography (SEC)** separates by molecular size using porous beads; large molecules cannot enter the pores and elute first; small molecules penetrate the pores and elute later. SEC is used for polymer molecular weight determination (gel permeation chromatography, GPC) and protein separation (gel filtration chromatography, GFC).

## 14.2 HPLC Instrumentation and Detection

A modern HPLC system consists of a solvent delivery system, an injector, a column, a detector, and data acquisition software. High-pressure pumps (typically reciprocating piston design) deliver solvent at precisely controlled flow rates (0.1–5 mL/min) against pressures of up to 40 MPa (400 bar) for conventional HPLC and up to 140 MPa for ultra-high-performance HPLC (UHPLC). Gradient elution (varying mobile phase composition during the run) is analogous to temperature programming in GC: it compresses the range of retention factors and gives uniformly resolved peaks across the entire run.

HPLC detectors exploit different physical and chemical properties of the eluting analytes. The **UV-Vis absorbance detector** (single wavelength or variable wavelength) is the most common; it is simple, reliable, and offers good sensitivity for UV-absorbing compounds. The **diode array detector (DAD)** records a full UV-Vis spectrum at every point in the chromatogram, allowing peak identity confirmation (by spectral matching), detection of co-eluting impurities (by peak purity analysis), and choice of the optimal detection wavelength after the fact. The **fluorescence detector** is more selective and 10–1000 times more sensitive than UV for fluorescent analytes; it is widely used for polycyclic aromatic hydrocarbons (PAHs), aflatoxins, and derivatized amino acids.

The **evaporative light scattering detector (ELSD)** nebulizes the column effluent into a heated drift tube to evaporate the mobile phase; the residual analyte particles scatter light and are detected. The ELSD responds to any non-volatile analyte regardless of UV absorption, making it suitable for lipids, carbohydrates, and surfactants. The **refractive index (RI) detector** measures the change in refractive index of the eluent as analyte passes; it is universal but has poor sensitivity and cannot be used with gradient elution (which changes the RI of the mobile phase). **LC-MS** coupling (using electrospray ionization) is increasingly the method of choice for pharmaceutical and bioanalytical work, providing both retention time and mass spectral identity confirmation.

**UHPLC** uses sub-2-µm particles (versus the 3–5 µm of conventional HPLC). Smaller particles give smaller \(H\) (from the A and C terms of van Deemter), higher column efficiency, and — because the van Deemter minimum occurs at higher velocities for smaller particles — allow much faster analyses at the optimum. The penalty is higher operating pressure (100–140 MPa vs. 20–40 MPa), requiring purpose-built instrument hardware. A typical UHPLC analysis that would take 30 minutes on conventional HPLC can often be completed in 3–5 minutes on UHPLC.

---

# Chapter 15: Mass Spectrometry

## 15.1 Ionization Methods

Mass spectrometry (MS) determines the mass-to-charge ratio (m/z) of gas-phase ions produced from the analyte. The molecular or fragment ion masses provide molecular weight and structural information unmatched by any other technique. Modern MS instruments are extraordinarily sensitive (attomole to femtomole quantities are routinely detectable) and can be coupled to GC or HPLC for simultaneous separation and identification of complex mixtures.

**Electron ionization (EI)** is the classical ionization method for volatile, thermally stable compounds analyzed by GC-MS. A beam of 70 eV electrons ionizes analyte molecules in the gas phase, producing a radical cation \(M^{+\bullet}\) (the **molecular ion**) that often fragments extensively. Because 70 eV is standardized across instruments, EI spectra are highly reproducible and can be matched against library databases of over 300,000 reference spectra (NIST/EPA/NIH database). The highest-intensity peak in the spectrum is the **base peak** (normalized to 100%). Fragment peaks arise from bond cleavages: McLafferty rearrangement (six-membered transition state for \(\gamma\)-hydrogen migration to a carbonyl), alpha-cleavage, and retro-Diels-Alder. The even-electron rule states that a fragment formed by simple cleavage from a radical cation is an odd-electron radical (and vice versa), which helps in mechanistic interpretation. Isotope patterns are diagnostic: chlorine (³⁵Cl:³⁷Cl = 3:1) gives a characteristic M:(M+2) ratio of ~3:1; bromine (⁷⁹Br:⁸¹Br ≈ 1:1) gives M:(M+2) ≈ 1:1.

**Chemical ionization (CI)** uses a reagent gas (methane, isobutane, or ammonia) at high pressure in the ion source. The reagent gas is ionized by electrons and generates reactive ions (CH₅⁺, C₂H₅⁺ for methane CI) that transfer protons to the analyte by ion-molecule reactions, producing \([M+H]^+\). CI is a "soft" technique that produces predominantly the quasi-molecular ion with minimal fragmentation, providing molecular weight information even for molecules that fragment completely under EI.

**Electrospray ionization (ESI)** is the most important ionization method for LC-MS and for large biomolecules. The solution-phase analyte is pumped through a charged metal capillary; as the liquid emerges, the electric field (3–6 kV) draws it into a Taylor cone, which elongates into a filament that breaks up into charged droplets. Solvent evaporation and Coulombic repulsion progressively reduce the droplet size until gas-phase ions are released, either by ion evaporation or by the charged residue mechanism. ESI is remarkable for producing **multiply charged ions** from large proteins: a protein of mass 50,000 Da may be observed as \([M+50H]^{50+}\) at m/z = 1001, well within the range of a standard quadrupole instrument. **MALDI** (matrix-assisted laser desorption/ionization) is another soft technique for high molecular weight analytes; the analyte is co-crystallized with a UV-absorbing matrix, and a pulsed UV laser desorbs and ionizes the analyte, typically producing \([M+H]^+\) in the gas phase.

## 15.2 Mass Analyzers

**Quadrupole mass filters** are the workhorses of routine LC-MS and GC-MS instruments. Four parallel rods are arranged in a square array and subjected to a combination of DC and RF voltages. For a given ratio of DC to RF voltage, only ions of a specific m/z follow stable trajectories through the rods and reach the detector; all others are deflected and neutralized on the rods. By scanning the DC/RF ratio, a mass spectrum is acquired. Quadrupoles offer unit mass resolution (typically \(\Delta m = 1\) at half-height) and fast scan speed, but are limited to about m/z 3000.

**Time-of-flight (TOF)** mass analyzers accelerate ions through the same electric potential \(V\) and then measure the time to travel a field-free drift region of length \(L\). Because all ions receive the same kinetic energy \(eV = \frac{1}{2}mv^2\), lighter ions travel faster. The flight time is:

\[
t = \frac{L}{\sqrt{2eV/m}} = L\sqrt{\frac{m}{2eV}}
\]

so \(m/z \propto t^2\). TOF instruments have theoretically unlimited mass range and can record complete spectra from a single ionization event (pulsed sources). A **reflectron** (ion mirror) reverses the kinetic energy spread of ions of the same m/z created with slightly different initial energies, dramatically improving mass resolution (from ~1000 to > 20,000). TOF is the analyzer of choice for MALDI and is widely used in GC-TOF-MS and LC-QTOF-MS.

**Tandem mass spectrometry (MS/MS)** combines two stages of mass analysis with an intermediate collision cell where ions fragment by collision-induced dissociation (CID). In a **triple quadrupole** instrument (QqQ), the first quadrupole (Q1) selects the precursor ion, the collision cell (q2) fragments it, and the third quadrupole (Q3) scans the product ions. The **multiple reaction monitoring (MRM)** mode of QqQ — selecting one precursor ion and one product ion simultaneously — is the gold standard for quantitative LC-MS/MS of drugs, metabolites, and pesticides, offering exceptional selectivity and sensitivity (detection limits in the pg/mL range in biological matrices).

---

# Chapter 16: Electrochemical Fundamentals and Electroanalysis

## 16.1 Electrochemical Cells and the Nernst Equation

Electroanalytical methods measure electrical quantities — potential, current, charge — that are directly related to the chemical composition of a solution. They are fast, sensitive, require little or no sample preparation for solution-phase analytes, and are readily miniaturized. The ubiquitous glucose meter (a device found in billions of homes worldwide) is an electroanalytical instrument, as is the pH meter in every undergraduate laboratory. Understanding these devices begins with the thermodynamics of electrochemical cells.

An electrochemical cell consists of two **half-cells**, each containing an electrode immersed in an electrolyte solution. In a **galvanic cell**, a spontaneous redox reaction drives current through an external circuit; in an **electrolytic cell**, an external potential is applied to drive a non-spontaneous reaction. Each half-cell is characterized by its **electrode potential** \(E\), defined relative to the **standard hydrogen electrode (SHE)**:

\[
\text{H}^+(aq, a=1) + e^- \rightleftharpoons \frac{1}{2}\text{H}_2(g, p=1 \text{ bar}); \quad E^\circ = 0.000 \text{ V}
\]

**Standard reduction potentials** \(E^\circ\) are tabulated for half-reactions at unit activity (25 °C, 1 bar). Larger (more positive) \(E^\circ\) indicates a stronger tendency to be reduced; larger (more negative) \(E^\circ\) indicates a stronger reducing agent. The cell potential is:

\[
E_{\text{cell}} = E_{\text{cathode}} - E_{\text{anode}}
\]

The free energy change is \(\Delta G = -nFE_{\text{cell}}\), where \(n\) is the number of electrons transferred per mole of reaction and \(F = 96,485\) C/mol is the Faraday constant.

The **Nernst equation** corrects the standard potential for non-unit activities. Starting from \(\Delta G = \Delta G^\circ + RT\ln Q\) and substituting \(\Delta G = -nFE\):

\[
E = E^\circ - \frac{RT}{nF}\ln Q
\]

At 25 °C, \(RT/F = 0.02569\) V, and converting to log base 10:

\[
E = E^\circ - \frac{0.05916}{n}\log Q
\]

For a copper half-cell (\(\text{Cu}^{2+} + 2e^- \rightleftharpoons \text{Cu}\), \(E^\circ = +0.337\) V):

\[
E = 0.337 - \frac{0.05916}{2}\log\frac{1}{[\text{Cu}^{2+}]} = 0.337 + \frac{0.02958}{1}\log[\text{Cu}^{2+}]
\]

Each 10-fold change in \([\text{Cu}^{2+}]\) changes \(E\) by 29.58 mV — the theoretical Nernstian response for a 2-electron couple.

## 16.2 Reference Electrodes

Practical potentiometric measurements require a **reference electrode** — an electrode with a stable, well-defined, and reproducible potential that does not change when current flows through it. The SHE is the fundamental reference but is impractical for laboratory use (requires pure H₂ gas at exactly 1 bar and H⁺ at unit activity).

The **saturated calomel electrode (SCE)** uses the Hg/Hg₂Cl₂/KCl(sat.) couple:

\[
\text{Hg}_2\text{Cl}_2(s) + 2e^- \rightleftharpoons 2\text{Hg}(l) + 2\text{Cl}^-(aq); \quad E = +0.241 \text{ V vs. SHE}
\]

The constant activity of Hg₂Cl₂ (a solid) and the constant Cl⁻ activity (set by the saturated KCl solution) give a stable reference potential. The SCE was the dominant laboratory reference electrode for most of the twentieth century.

The **silver/silver chloride electrode (Ag/AgCl)** uses the Ag/AgCl/KCl(sat.) couple:

\[
\text{AgCl}(s) + e^- \rightleftharpoons \text{Ag}(s) + \text{Cl}^-(aq); \quad E = +0.197 \text{ V vs. SHE}
\]

Ag/AgCl electrodes are less toxic than mercury-containing SCEs and are the standard reference in modern instruments, including the glucose meters and other clinical analyzers mentioned above.

## 16.3 The Glass Electrode and pH Measurement

The **glass electrode** is the defining device of modern pH measurement. Its operation depends on the ion-selective properties of a special glass membrane composed of SiO₂, Na₂O, and CaO or La₂O₃. When hydrated, a thin gel layer forms on both sides of the membrane, and H⁺ can exchange with Na⁺ in the glass lattice — a process of ion exchange rather than electron transfer. The potential across the membrane obeys:

\[
E_{\text{glass}} = \text{const} + 0.05916\,\log[\text{H}^+]_{\text{external}} = \text{const} - 0.05916\,\text{pH}
\]

A glass electrode consists of a thin-walled glass bulb filled with an internal reference solution (typically 0.1 M HCl) and an internal reference electrode (Ag/AgCl). A separate external reference electrode (SCE or Ag/AgCl) is placed in the same solution as the glass electrode bulb. The measured cell voltage is the sum of the membrane potential and all junction and reference electrode potentials; because most of these are constant, changes in voltage are proportional to changes in pH.

**Two-point calibration** with buffer solutions of known pH is required before each series of pH measurements. The **Nernstian slope** (−59.16 mV/pH at 25 °C) may deviate slightly from theoretical; a calibration factor (or "slope efficiency") accounts for this. The **alkaline error** of the glass electrode occurs at high pH (> 12) where Na⁺ from highly alkaline solutions responds similarly to H⁺, giving an artificially low pH reading. The **acid error** occurs at very low pH (< 0) where activity of water departs from unity.

## 16.4 Potentiometric Titrations

While a visual indicator is adequate for routine titrations, the **potentiometric titration** — monitoring electrode potential versus volume of titrant — provides a more accurate, automatable, and information-rich endpoint detection. The equivalence point is located at the inflection of the sigmoid potential-volume curve, at the maximum of the first derivative \(d(E)/d(V)\) curve, or at the zero crossing of the second derivative \(d^2(E)/dV^2\). Computer-controlled automatic titrators perform this differentiation in real time and stop addition at the endpoint.

For a pH titration, the glass electrode monitors the progress of the acid-base reaction; the equivalence point corresponds to the steepest region of the titration curve. For a redox titration (e.g., permanganate titration of oxalate), an inert platinum indicator electrode monitors the Nernst potential of the redox couple; the large jump in \(E_{\text{cell}}\) at the equivalence point (when the potential is determined by the MnO₄⁻/Mn²⁺ couple rather than the C₂O₄²⁻/CO₂ couple) locates the endpoint precisely. For a precipitation titration (e.g., AgNO₃/Cl⁻), a silver indicator electrode is used; pAg changes sharply at the equivalence point.

## 16.5 Introduction to Voltammetry

**Voltammetry** measures the current that flows through an electrochemical cell as a function of applied potential. Unlike potentiometry (which measures potential at essentially zero current), voltammetric methods exploit the potential-dependent reduction or oxidation of analyte at a working electrode. When the applied potential is sufficient to drive electrochemical reduction of a species (say Cd²⁺ to Cd), a **faradaic current** flows; this current is proportional to the rate of the electrode reaction, which at large overpotentials is limited by the rate of mass transport of analyte to the electrode surface.

The **limiting current** \(i_L\) in a linear diffusion experiment is given by:

\[
i_L = nFAD\frac{dc}{dx}
\bigg|_{x=0}
\approx nFAD\frac{c^*}{\delta}
\]

where \(A\) is the electrode area, \(D\) is the diffusion coefficient, \(c^*\) is the bulk analyte concentration, and \(\delta\) is the diffusion layer thickness. Because \(i_L \propto c^*\), voltammetric methods are quantitative. The **half-wave potential** \(E_{1/2}\) (where the current is half the limiting current) is characteristic of a given redox couple and provides qualitative identification (analogous to retention time in chromatography). Linear sweep, cyclic, pulse, square-wave, and stripping voltammetry are all members of this family, differing in the waveform of the applied potential and the mode of current measurement; each offers different compromises among sensitivity, speed, and information content.

<div class="definition">
<strong>Key Definitions Summary</strong>

<strong>Absorbance:</strong> A = εbc = −log T; dimensionless; linear with concentration.

<strong>Activity:</strong> a<sub>i</sub> = γ<sub>i</sub>[i]; thermodynamically correct concentration variable.

<strong>Buffer capacity:</strong> moles of strong acid or base per litre that changes pH by 1 unit; maximum at pH = pK<sub>a</sub>.

<strong>Conditional formation constant:</strong> K<sub>f</sub>' = α<sub>Y⁴⁻</sub> · K<sub>f</sub>; accounts for pH dependence of EDTA speciation.

<strong>Gravimetric factor:</strong> GF = (M<sub>analyte</sub> × stoichiometry) / M<sub>precipitate</sub>; converts precipitate mass to analyte mass.

<strong>LOD:</strong> 3σ<sub>blank</sub>/m; minimum detectable concentration.

<strong>LOQ:</strong> 10σ<sub>blank</sub>/m; minimum quantifiable concentration.

<strong>Nernst equation:</strong> E = E° − (0.05916/n) log Q at 25 °C.

<strong>Plate height:</strong> H = L/N = A + B/u + Cu; lower H means better column efficiency.

<strong>Resolution:</strong> R<sub>s</sub> = (√N/4)(α−1/α)(k₂/(1+k₂)); dimensionless separation quality metric.

<strong>Retention factor:</strong> k = t'<sub>r</sub>/t<sub>M</sub>; dimensionless; ideal range 2–10.

<strong>Stern-Volmer constant:</strong> K<sub>SV</sub> = k<sub>q</sub>τ₀; units M⁻¹; characterizes collisional quenching efficiency.
</div>

<div class="theorem">
<strong>Key Equations Reference</strong>

Beer-Lambert law: A = εbc

Nernst equation (25°C): E = E° − (0.05916/n) log Q

Henderson-Hasselbalch: pH = pK<sub>a</sub> + log([A⁻]/[HA])

Debye-Hückel: log γ = −0.509 z² √I

van Deemter: H = A + B/u + Cu

Resolution: R<sub>s</sub> = (√N/4) · (α−1)/α · k₂/(1+k₂)

Confidence interval: μ = x̄ ± t·s/√n

LOD: 3σ<sub>blank</sub>/m; LOQ: 10σ<sub>blank</sub>/m

Calibration slope: m = (Σx<sub>i</sub>y<sub>i</sub> − nx̄ȳ) / (Σx<sub>i</sub>² − nx̄²)

Ionic strength: I = ½Σc<sub>i</sub>z<sub>i</sub>²

Stern-Volmer: I₀/I = 1 + K<sub>SV</sub>[Q]

Gravimetric factor: GF = (n<sub>a</sub>/n<sub>p</sub>) × M<sub>analyte</sub>/M<sub>precipitate</sub>
</div>
