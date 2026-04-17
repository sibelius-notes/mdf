---
title: "PHYS 122: Waves, Electricity and Magnetism Laboratory"
subjects: "PHYS"
prof: "Mikolas Skilandziunas"
---

## Sources and References

**Primary textbook** — Young, H. D. and Freedman, R. A., *University Physics with Modern Physics*, 15th ed. (Pearson, 2020). Chapters on electromagnetism, waves, and circuits.

**Supplementary texts** — Taylor, J. R., *An Introduction to Error Analysis*, 2nd ed. (University Science Books, 1997); Bevington, P. R. and Robinson, D. K., *Data Reduction and Error Analysis for the Physical Sciences*, 3rd ed. (McGraw-Hill, 2003); Hughes, I. and Hase, T., *Measurements and their Uncertainties* (Oxford University Press, 2010).

**Online resources** — NIST/SEMATECH e-Handbook of Statistical Methods, itl.nist.gov/div898/handbook/; HyperPhysics, hyperphysics.phy-astr.gsu.edu; MIT OpenCourseWare 8.03 (Physics III: Vibrations and Waves).

---

# Chapter 1: The Philosophy and Practice of Experimental Physics

## 1.1 Why Laboratory Science is Fundamentally Different from Theory

Physics is an experimental science. No matter how elegant and mathematically compelling a theoretical framework may be, it earns the right to be called physics only when it makes testable predictions that can be compared with measurements of the physical world. The history of science is littered with beautiful theories that failed this test — and with apparently inexplicable experimental anomalies that eventually forced theorists to abandon what seemed like perfectly good frameworks. Experiment is the final arbiter.

This laboratory course exists to develop the skills necessary to be a competent experimental physicist. Those skills are not primarily technical — they are not, at the most fundamental level, about knowing how to operate an oscilloscope or use a Vernier caliper, though those skills matter. More deeply, the experimental physicist must know how to design a measurement strategy, how to recognise and quantify uncertainty, how to build a model that describes a physical system and compare that model's predictions to data, and how to extract meaningful conclusions from data that are always, to some degree, imperfect.

The central epistemic challenge of experimental physics is that every measurement of a physical quantity returns not the "true" value but a number that differs from the true value by some amount — the **measurement error** or **uncertainty**. This is not a failure of the apparatus or the experimenter; it is a fundamental feature of the measurement process. The goal is not to eliminate uncertainty (impossible) but to quantify it (so that results can be meaningfully compared with theory and with other experiments) and to minimise it (by good experimental design).

## 1.2 Types of Experimental Uncertainty

Experimental uncertainties fall into two broad categories that require different treatment. **Systematic uncertainties** (sometimes called systematic errors, though the word "error" is misleading since they are not mistakes) are those that shift all measurements in the same direction. A miscalibrated ruler that reads 1.02 m when the true length is 1.00 m introduces a systematic uncertainty of +2% in all length measurements made with that ruler. The measured values are precise (consistent with each other) but not accurate (not close to the true value). Systematic uncertainties are insidious precisely because they cannot be reduced by taking more data — taking a thousand measurements with the miscalibrated ruler does not improve accuracy. They must instead be identified, estimated, and either corrected for or quoted as a one-sided uncertainty.

**Random uncertainties** (statistical errors) cause measurements of the same quantity under ostensibly identical conditions to scatter around some central value. They arise from the inherent limitations of measurement precision (a digital voltmeter that reads to 0.01 V cannot resolve differences smaller than about 0.005 V), from random environmental fluctuations (temperature drifts, vibrations, electrical noise), and from the stochastic nature of quantum processes at the deepest level. Random uncertainties are characterised by their statistical distribution, and they can be reduced by averaging many independent measurements.

A **blunder** or **mistake** is a third category — a misread scale, a transcription error, a conceptual error in the experimental design — that must be identified and corrected rather than accommodated. Systematic checks and cross-comparisons are the primary defences against blunders.

## 1.3 The Language of Uncertainty

A measured value is meaningless without an accompanying statement of uncertainty. The standard format is:

\[
Q = q_\text{best} \pm \delta q
\]

where \(q_\text{best}\) is the best estimate of the quantity \(Q\) and \(\delta q\) is the uncertainty. The statement "\(L = 2.35 \pm 0.03\) m" means that the true value of \(L\) most likely lies in the interval \(\left[2.32, 2.38\right]\) m. What "most likely" means precisely depends on the interpretation: in the frequentist view, a 68% confidence interval means that if the experiment were repeated many times, 68% of the resulting intervals would contain the true value. In the Bayesian view, it means there is a 68% probability (given our prior knowledge and the data) that the true value lies in the interval.

The **absolute uncertainty** \(\delta q\) has the same units as \(q\). The **relative uncertainty** (or fractional uncertainty) \(\delta q / |q_\text{best}|\) is dimensionless and is often more informative for comparing the precision of different measurements. A length measured to within 1 mm in 10 m has a relative uncertainty of 0.01%, while the same 1 mm uncertainty in a 2 cm measurement represents a 5% relative uncertainty — a very different level of precision.

---

# Chapter 2: Statistical Methods and Error Analysis

## 2.1 The Gaussian Distribution and its Properties

When a quantity is measured many times under identical conditions and the errors are random, the distribution of measured values tends toward a **Gaussian (normal) distribution** as the number of measurements grows large. This is a consequence of the **central limit theorem**: the sum of many independent random variables, regardless of their individual distributions, tends toward a Gaussian as the number of variables increases.

The Gaussian distribution is characterised by two parameters: the **mean** \(\mu\) (location of the peak) and the **standard deviation** \(\sigma\) (width). Its probability density function is:

\[
f(x; \mu, \sigma) = \frac{1}{\sigma\sqrt{2\pi}}\exp\!\left(-\frac{(x-\mu)^2}{2\sigma^2}\right)
\]

The probability of a measurement falling within \(\pm\sigma\) of the mean is approximately 68.3%; within \(\pm 2\sigma\), approximately 95.4%; within \(\pm 3\sigma\), approximately 99.7%. These numbers are so important that they should be memorised: a result that differs from a prediction by more than \(3\sigma\) is considered highly significant (probability less than 0.3% if the model is correct), and a \(5\sigma\) deviation is the standard threshold for a discovery claim in particle physics.

## 2.2 Estimating the Mean and Standard Deviation from Data

Given a set of \(N\) measurements \(\{x_1, x_2, \ldots, x_N\}\), the best estimates of \(\mu\) and \(\sigma\) are:

\[
\bar{x} = \frac{1}{N}\sum_{i=1}^N x_i \qquad \text{(sample mean)}
\]

\[
s = \sqrt{\frac{1}{N-1}\sum_{i=1}^N (x_i - \bar{x})^2} \qquad \text{(sample standard deviation)}
\]

The factor \(N-1\) rather than \(N\) in the denominator of \(s\) is a correction for the fact that we estimated \(\mu\) from the data themselves (using one degree of freedom). This **Bessel's correction** ensures that \(s^2\) is an unbiased estimator of \(\sigma^2\): averaging \(s^2\) over many experiments gives the true variance.

The **uncertainty in the mean** (standard error of the mean) is:

\[
\sigma_{\bar{x}} = \frac{s}{\sqrt{N}}
\]

This is the uncertainty in our best estimate of the true mean, given \(N\) measurements. Crucially, this decreases as \(1/\sqrt{N}\): to halve the uncertainty, we must take four times as many measurements. The diminishing returns of taking more data are a fundamental constraint in experimental physics.

## 2.3 Propagation of Uncertainties

In most experiments, the quantity of interest \(Q\) is not measured directly but is calculated from one or more directly measured quantities \(x_1, x_2, \ldots, x_n\). The uncertainty in \(Q\) depends on the uncertainties in the \(x_i\) and on the functional relationship \(Q = f(x_1, x_2, \ldots, x_n)\).

<div class="theorem">
<strong>General Error Propagation Formula.</strong> If \(Q = f(x_1, \ldots, x_n)\) and the uncertainties \(\delta x_i\) are independent and small compared to the \(x_i\), the uncertainty in \(Q\) is:

\[
\delta Q = \sqrt{\left(\frac{\partial f}{\partial x_1}\right)^2\!(\delta x_1)^2 + \left(\frac{\partial f}{\partial x_2}\right)^2\!(\delta x_2)^2 + \cdots + \left(\frac{\partial f}{\partial x_n}\right)^2\!(\delta x_n)^2}
\]
</div>

<div class="proof">
<strong>Derivation.</strong> For small deviations \(\delta x_i\) from the best estimates, expand \(f\) in a Taylor series to first order:

\[
\delta Q \approx \frac{\partial f}{\partial x_1}\delta x_1 + \frac{\partial f}{\partial x_2}\delta x_2 + \cdots
\]
If the errors \(\delta x_i\) are independent random variables each with variance \((\delta x_i)^2\), the variance of \(\delta Q\) is:

\[
(\delta Q)^2 = \left(\frac{\partial f}{\partial x_1}\right)^2\!\!(\delta x_1)^2 + \left(\frac{\partial f}{\partial x_2}\right)^2\!\!(\delta x_2)^2 + \cdots
\]
taking the square root gives the formula. The assumption of independence is crucial: if \(x_1\) and \(x_2\) are correlated, there is an additional cross term \(2(\partial f/\partial x_1)(\partial f/\partial x_2)\text{Cov}(x_1, x_2)\).
</div>

For common functional forms, the propagation formula gives simple rules:

**Addition/Subtraction** (\(Q = x_1 \pm x_2\)): \(\delta Q = \sqrt{(\delta x_1)^2 + (\delta x_2)^2}\). Absolute uncertainties add in quadrature.

**Multiplication/Division** (\(Q = x_1^a x_2^b\)): \(\delta Q/|Q| = \sqrt{a^2(\delta x_1/x_1)^2 + b^2(\delta x_2/x_2)^2}\). Relative uncertainties (multiplied by their powers) add in quadrature.

**Special cases:**
- \(Q = cx\): \(\delta Q = |c|\,\delta x\)
- \(Q = x^n\): \(\delta Q/|Q| = |n|\,\delta x/|x|\)
- \(Q = \ln x\): \(\delta Q = \delta x/|x|\)
- \(Q = e^x\): \(\delta Q/Q = \delta x\)

<div class="example">
<strong>Example 2.1: Propagation Through a Period Measurement.</strong> The spring constant of a spring is determined from the period of oscillation: \(k = 4\pi^2 m / T^2\). The mass is \(m = 0.250 \pm 0.001\) kg and the period (average of 10 cycles) is \(T = 0.842 \pm 0.003\) s. Find \(k\) and \(\delta k\).

\(k = 4\pi^2(0.250)/(0.842)^2 = 9.869 \times 0.250 / 0.709 \approx 13.95\) N/m.

Relative uncertainty: \(\delta k/k = \sqrt{(\delta m/m)^2 + (2\delta T/T)^2} = \sqrt{(0.001/0.250)^2 + (2 \times 0.003/0.842)^2}\).

\[
= \sqrt{(0.004)^2 + (0.00712)^2} = \sqrt{0.0000160 + 0.0000507} = \sqrt{0.0000667} = 0.00817 = 0.817\%
\]

\(\delta k = 0.00817 \times 13.95 = 0.114\) N/m, so \(k = 13.95 \pm 0.11\) N/m.

Note that the dominant uncertainty contribution comes from the period measurement (relative contribution 0.712%) rather than the mass (0.400%), because the period appears squared.
</div>

## 2.4 Least-Squares Fitting

The most powerful statistical tool for analysing experimental data is **least-squares fitting** — finding the model parameters that minimise the sum of squared deviations between model predictions and measurements. The theoretical foundation is the **principle of maximum likelihood**: if measurement errors are Gaussian, the parameters that maximise the likelihood of observing the data are exactly those that minimise the weighted sum of squares.

For a linear model \(y = mx + b\), given \(N\) data points \((x_i, y_i)\) with uncertainties \(\sigma_i\) in \(y_i\), the optimal estimates of slope \(m\) and intercept \(b\) minimise:

\[
\chi^2 = \sum_{i=1}^N \frac{(y_i - mx_i - b)^2}{\sigma_i^2}
\]

Setting \(\partial\chi^2/\partial m = 0\) and \(\partial\chi^2/\partial b = 0\) gives the **normal equations**, which can be solved analytically. Define the weighted sums:

\[
S = \sum_i w_i, \quad S_x = \sum_i w_i x_i, \quad S_y = \sum_i w_i y_i, \quad S_{xx} = \sum_i w_i x_i^2, \quad S_{xy} = \sum_i w_i x_i y_i
\]

where \(w_i = 1/\sigma_i^2\). Then the least-squares slope and intercept are:

\[
m = \frac{S\, S_{xy} - S_x S_y}{S\, S_{xx} - S_x^2}, \qquad b = \frac{S_{xx} S_y - S_x S_{xy}}{S\, S_{xx} - S_x^2}
\]

with uncertainties:

\[
\sigma_m = \sqrt{\frac{S}{S\, S_{xx} - S_x^2}}, \qquad \sigma_b = \sqrt{\frac{S_{xx}}{S\, S_{xx} - S_x^2}}
\]

When all \(\sigma_i\) are equal (unweighted fit), these reduce to the familiar Pearson formulas. The **goodness of fit** is assessed by the reduced chi-squared:

\[
\chi^2_\nu = \frac{\chi^2}{N - p}
\]

where \(p\) is the number of fitted parameters. If the model is correct and the error estimates are accurate, \(\chi^2_\nu \approx 1\). Significantly larger values (\(\chi^2_\nu \gg 1\)) indicate that the model is inadequate or that uncertainties are underestimated; significantly smaller values (\(\chi^2_\nu \ll 1\)) indicate overestimated uncertainties.

### Linearising Nonlinear Models

Many physical models are nonlinear in the parameters but can be linearised by an appropriate transformation. For example, a model \(y = A e^{Bx}\) becomes linear after taking logarithms: \(\ln y = \ln A + Bx\). Plotting \(\ln y\) vs. \(x\) should give a straight line with slope \(B\) and intercept \(\ln A\). A model \(y = Cx^D\) becomes linear as \(\log y = \log C + D\log x\), which plots as a straight line on log-log axes with slope \(D\). These linearisation tricks are powerful, but they change the effective uncertainties: if \(\sigma_y\) is the uncertainty in \(y\), the uncertainty in \(\ln y\) is \(\sigma_y/y\), so care must be taken to propagate uncertainties correctly when fitting the linearised form.

---

# Chapter 3: Experiment 1 — Magnets and Magnetic Forces

## 3.1 Theoretical Background: Magnetic Fields and Forces

The magnetic force on a moving charge \(q\) in a magnetic field \(\mathbf{B}\) is:

\[
\mathbf{F}_\text{mag} = q\mathbf{v}\times\mathbf{B}
\]

This force is perpendicular to both the velocity and the magnetic field, has magnitude \(F = qvB\sin\theta\) (where \(\theta\) is the angle between \(\mathbf{v}\) and \(\mathbf{B}\)), and does no work on the charge (since it is always perpendicular to the velocity). The SI unit of magnetic field is the tesla (T = kg s\(^{-2}\) A\(^{-1}\)).

The magnetic field of a **magnetic dipole** (a bar magnet, a small current loop, or an atom) at large distances from the dipole has the form:

\[
\mathbf{B} = \frac{\mu_0}{4\pi}\!\left[\frac{3(\mathbf{m}\cdot\hat{r})\hat{r} - \mathbf{m}}{r^3}\right]
\]

where \(\mathbf{m}\) is the magnetic dipole moment (SI units: A m\(^2\)) and \(r\) is the distance from the dipole. Along the axis of the dipole (the direction of \(\mathbf{m}\)):

\[
B_\text{axial} = \frac{\mu_0}{4\pi}\cdot\frac{2m}{r^3} = \frac{\mu_0 m}{2\pi r^3}
\]

Along the equatorial plane (perpendicular to \(\mathbf{m}\)):

\[
B_\text{equat} = \frac{\mu_0}{4\pi}\cdot\frac{m}{r^3} = \frac{\mu_0 m}{4\pi r^3}
\]

Both field components fall off as \(r^{-3}\), which is the hallmark of a dipole field. This \(1/r^3\) dependence contrasts with the \(1/r^2\) dependence of the Coulomb field of a point charge — the dipole field falls off much more rapidly with distance because the positive and negative "charges" (north and south poles) nearly cancel each other's fields at large distances.

The force between two magnetic dipoles depends on their orientation and on the gradient of the field. Two aligned dipoles attract each other when oriented axially (north pole of one facing south pole of the other) and repel when facing the same way. The force between two identical bar magnets oriented along their common axis at separation \(r\) (for \(r\) large compared to the magnet length) falls off as \(r^{-4}\) — the gradient of the \(r^{-3}\) dipole field.

## 3.2 Experimental Method: Mapping the Magnetic Field of a Bar Magnet

The goal of Experiment 1 is to map the spatial variation of the magnetic field produced by one or more bar magnets, compare the measured field to the theoretical dipole model, and determine the magnetic dipole moment.

A **Hall probe** or **compass needle** serves as the field sensor. A Hall probe uses the Hall effect: a current-carrying conductor in a magnetic field develops a transverse voltage proportional to the component of the field perpendicular to the current. The Hall voltage is:

\[
V_H = \frac{IB}{nqt}
\]

where \(I\) is the current through the Hall element, \(n\) is the charge carrier density, \(q\) is the carrier charge, and \(t\) is the element thickness. The calibration constant \(R_H = 1/(nq)\) is the **Hall coefficient**, which is determined by calibration against a known field (such as the Earth's field at a known location, or a solenoid with precisely known current and geometry).

Measurements are taken at a series of positions along the axial and equatorial directions, typically from \(r = 3\) cm to \(r = 15\) cm from the centre of the magnet. A Cartesian grid of measurements can also be taken to produce a full two-dimensional field map. At each position, the probe orientation is adjusted to maximise the reading (aligning the sensitive axis with the dominant field component), or two orthogonal components are measured separately.

## 3.3 Data Analysis and Expected Results

To test the dipole model, we compare measured field values to the predicted \(B \propto r^{-3}\) dependence. Plotting \(\log B\) vs. \(\log r\) should give a straight line with slope \(-3\). A least-squares fit to the log-log data gives the slope and its uncertainty; a value consistent with \(-3\) confirms the dipole model, while significant deviation (e.g., slope \(-3.5\)) would indicate that we are not yet in the far-field regime (the magnet must be modelled as an extended object at short distances).

From the axial field formula, the magnetic dipole moment is determined:

\[
m = \frac{2\pi}{\mu_0} B_\text{axial}(r)\,r^3
\]

Since \(B_\text{axial}\,r^3\) should be constant in the dipole regime, we can plot \(B_\text{axial}\,r^3\) vs. \(r\) and look for a flat region — the plateau confirms we are in the far field, and its height gives \(m\).

## 3.4 Error Propagation for this Experiment

The dominant sources of uncertainty are: positioning error (uncertainty in \(r\)), field reading uncertainty (from the Hall probe calibration and resolution), and the effect of the Earth's background field (\(B_\text{Earth} \approx 50\;\mu\)T). The Earth's field must be subtracted as a background, and the uncertainty in the subtraction must be propagated. If \(B_\text{measured} = B_\text{magnet} + B_\text{Earth}\) and \(B_\text{Earth}\) is known to \(\pm 2\;\mu\)T, then \(\delta B_\text{magnet} = \sqrt{(\delta B_\text{measured})^2 + (2\;\mu\text{T})^2}\).

---

# Chapter 4: Experiment 2 — Electrical Circuits

## 4.1 Theoretical Background: Ohm's Law and Kirchhoff's Rules

The fundamental relationship governing current flow through a resistive conductor is **Ohm's Law**:

\[
V = IR
\]

where \(V\) is the voltage (potential difference) across the conductor, \(I\) is the current through it, and \(R\) is the **resistance** in ohms (\(\Omega\) = V/A). Ohm's law is not a fundamental law of physics but an empirical model that works well for metallic conductors over a wide range of conditions. At the microscopic level, resistance arises because conduction electrons, accelerated by the electric field, are scattered by lattice vibrations (phonons) and impurities. The Drude model gives \(R = \rho L / A\), where \(\rho\) is the resistivity of the material, \(L\) is the length, and \(A\) is the cross-sectional area.

**Kirchhoff's Current Law (KCL)**: the algebraic sum of currents at any junction (node) is zero:

\[
\sum_i I_i = 0
\]

This is a statement of charge conservation: charge cannot accumulate at a node in steady state. Currents flowing into the node are positive; currents flowing out are negative (or vice versa — the sign convention must be chosen consistently).

**Kirchhoff's Voltage Law (KVL)**: the algebraic sum of voltage drops around any closed loop is zero:

\[
\sum_i V_i = 0
\]

This is a consequence of the conservation of energy (or equivalently, of the existence of a well-defined electric potential in static and quasi-static situations). Going around a loop, each resistor contributes a voltage drop \(-IR\) in the direction of current flow, and each battery contributes \(+\varepsilon\) (EMF) or \(-\varepsilon\) depending on whether you traverse it from negative to positive terminal or vice versa.

For resistors in **series**: \(R_\text{series} = R_1 + R_2 + \cdots + R_n\). The current is the same through all, and voltages add. For resistors in **parallel**:

\[
\frac{1}{R_\text{parallel}} = \frac{1}{R_1} + \frac{1}{R_2} + \cdots + \frac{1}{R_n}
\]

The voltage is the same across all, and currents add. For two resistors in parallel: \(R_\text{parallel} = R_1 R_2/(R_1 + R_2)\).

## 4.2 Measuring Resistance: The Four-Wire Method

A major source of systematic error in resistance measurement is the **contact resistance** between a probe and the circuit element being measured. A standard two-wire measurement using a multimeter passes current through the same leads that measure the voltage, so the probe resistance adds to the measured value. For small resistances (less than about 1 \(\Omega\)), this is a serious problem.

The **four-wire (Kelvin) method** eliminates contact resistance by using separate pairs of leads for current injection and voltage measurement. Current is forced through the element by a pair of **current leads**; the voltage across the element is measured by a separate pair of **voltage leads**. Since the voltage measuring circuit draws negligible current (voltmeter has very high input impedance), the voltage drop in the voltage leads is negligible, and the measured voltage \(V\) accurately reflects the voltage across the element. The resistance is then \(R = V/I\).

## 4.3 The Wheatstone Bridge

The **Wheatstone bridge** is a circuit for measuring an unknown resistance \(R_x\) with very high accuracy. Four resistors \(R_1\), \(R_2\), \(R_3\), and \(R_x\) are arranged in a diamond configuration with a battery across one diagonal and a galvanometer across the other. The bridge is said to be **balanced** when the galvanometer reads zero — at that point, no current flows through the galvanometer and the voltage at the two midpoints of the diamond is equal.

At balance, by KVL applied to each half of the bridge:

\[
\frac{R_1}{R_2} = \frac{R_3}{R_x} \implies R_x = R_3\frac{R_2}{R_1}
\]

The balance condition is independent of the battery voltage (within reason), making the measurement immune to small fluctuations in the supply. One practical implementation uses a **slide wire** — a uniform resistive wire of total resistance \(R_\text{wire}\) and length \(L_\text{wire}\). Two segments of the wire, \(L_1\) and \(L_2 = L_\text{wire} - L_1\), replace \(R_1\) and \(R_2\). Since resistance is proportional to length (for a uniform wire), the balance condition becomes:

\[
R_x = R_3\frac{L_2}{L_1}
\]

## 4.4 Experimental Method and Measurements

In Experiment 2, students construct simple series and parallel circuits and verify Kirchhoff's laws by measuring currents and voltages at multiple points. A digital multimeter (DMM) serves as both ammeter and voltmeter. Important considerations:

An **ammeter** has low internal resistance and must be placed **in series** with the element whose current is being measured. A **voltmeter** has high internal resistance and must be placed **in parallel** with the element whose voltage is being measured. Using them incorrectly (voltmeter in series, ammeter in parallel) either draws excessive current through the voltmeter or creates a short circuit — both are bad.

The **loading effect** of a non-ideal meter: a voltmeter with finite resistance \(R_V\) placed across a resistor \(R\) effectively creates a parallel combination \(R' = RR_V/(R+R_V)\), which is less than \(R\). The measured voltage is lower than the true open-circuit voltage by the factor \(R'/(R' + R_\text{source})\). For a high-quality DMM, \(R_V \approx 10\) M\(\Omega\), making the loading effect negligible for circuits with resistances below a few hundred kilohms.

Students measure the I-V characteristics of a resistor (should be linear, confirming Ohm's law), a light bulb (should be nonlinear — resistance increases with temperature, demonstrating non-Ohmic behaviour), and a diode (exponential I-V characteristic). The diode I-V relationship follows the Shockley equation: \(I = I_0(e^{V/V_T} - 1)\), where \(I_0\) is the saturation current and \(V_T = k_BT/e \approx 26\) mV at room temperature is the thermal voltage.

---

# Chapter 5: Experiment 3 — Standing Waves on a String

## 5.1 Theoretical Background: Wave Mechanics on a String

A wave on a stretched string is a transverse mechanical wave — the string displacement is perpendicular to the direction of wave propagation. The wave equation for the transverse displacement \(y(x,t)\) of a string with linear mass density \(\mu\) (kg/m) under tension \(F_T\) is:

\[
\frac{\partial^2 y}{\partial x^2} = \frac{\mu}{F_T}\frac{\partial^2 y}{\partial t^2}
\]

This is the classic wave equation \(\partial^2 y/\partial x^2 = (1/v^2)\partial^2 y/\partial t^2\) with **wave speed**:

\[
v = \sqrt{\frac{F_T}{\mu}}
\]

This result can be derived from Newton's second law applied to a small element of the string. Consider an infinitesimal string element of length \(dx\) and mass \(\mu\, dx\), with the string making angles \(\theta_1\) and \(\theta_2 = \theta_1 + d\theta\) with the horizontal at its two ends. The net transverse force on the element is \(F_T(\sin\theta_2 - \sin\theta_1) \approx F_T(d\theta) = F_T(\partial^2 y/\partial x^2)\,dx\) for small angles. Setting this equal to \((\mu\,dx)\partial^2 y/\partial t^2\) gives the wave equation directly.

The general solution of the wave equation is \(y(x,t) = f(x - vt) + g(x + vt)\) — arbitrary functions of \(x - vt\) (right-moving wave) and \(x + vt\) (left-moving wave). A sinusoidal right-moving wave is:

\[
y_+(x,t) = A\sin(kx - \omega t + \phi)
\]

where \(k = 2\pi/\lambda\) is the **wave number** (rad/m), \(\omega = 2\pi f\) is the **angular frequency** (rad/s), and the **dispersion relation** connects them: \(\omega = vk\), i.e., \(f\lambda = v\).

## 5.2 Standing Waves and Normal Modes

When two sinusoidal waves of equal amplitude and frequency travel in opposite directions, their superposition produces a **standing wave** — a pattern that oscillates in time but has a fixed spatial structure. Superposing a right-moving and a left-moving wave:

\[
y = A\sin(kx - \omega t) + A\sin(kx + \omega t)
\]

Using the sum-to-product identity \(\sin\alpha + \sin\beta = 2\sin\!\left(\frac{\alpha+\beta}{2}\right)\cos\!\left(\frac{\alpha-\beta}{2}\right)\):

\[
y = 2A\sin(kx)\cos(\omega t)
\]

Every point on the string oscillates in time with amplitude \(|2A\sin(kx)|\). Points where \(\sin(kx) = 0\) (i.e., \(x = 0, \lambda/2, \lambda, \ldots\)) have zero amplitude and are called **nodes**. Points where \(|\sin(kx)| = 1\) have maximum amplitude \(2A\) and are called **antinodes**.

For a string of length \(L\) fixed at both ends, the boundary conditions \(y(0,t) = 0\) and \(y(L,t) = 0\) constrain the allowed wave numbers: \(\sin(kL) = 0\) requires \(kL = n\pi\), i.e., \(k_n = n\pi/L\) for \(n = 1, 2, 3, \ldots\). The corresponding allowed wavelengths are:

\[
\lambda_n = \frac{2L}{n}
\]

and the **resonance frequencies** (**harmonics** or **normal mode frequencies**) are:

\[
f_n = \frac{v}{\lambda_n} = \frac{nv}{2L} = \frac{n}{2L}\sqrt{\frac{F_T}{\mu}}
\]

The fundamental frequency \(f_1 = v/(2L)\) corresponds to \(n = 1\) (one antinode, two nodes at the fixed ends). The \(n\)th harmonic has frequency \(nf_1\) and \(n\) antinodes. This equally spaced harmonic series is the physical basis for the musical intervals of the octave, fifth, fourth, and so on — when a guitar string vibrates, it does so in a superposition of all its harmonics, with the relative amplitudes determining the **timbre** of the note.

## 5.3 Experimental Method

The experimental apparatus consists of a long string (or rubber band) with one end attached to a mechanical vibrator driven by a function generator and the other end hanging over a pulley with weights to provide variable tension. The driving frequency \(f\) is set by the function generator, and the tension \(F_T = Mg\) is set by adding or removing masses \(M\) from the hanger.

To observe the \(n\)th normal mode, either: (a) fix \(F_T\) and adjust \(f\) until a clean standing wave pattern appears, measuring \(f_n\); or (b) fix \(f\) and adjust \(F_T\) until resonance occurs. At resonance, the wave pattern is clear and stationary (in a stroboscopic view), the amplitude is large, and the nodes are sharp and well-defined. Off resonance, the pattern is muddy and the amplitude is small.

Measurements are taken of \(f_n\), \(\lambda_n\) (by measuring the distance between nodes or the total length divided by \(n\)), and \(F_T\). The wave speed is determined two ways: from \(v = f_n\lambda_n\) and from \(v = \sqrt{F_T/\mu}\) (using the measured string mass per unit length \(\mu\)). Agreement between the two determinations validates both the wave model and the measurement technique.

## 5.4 Linearisation and Graphical Analysis

The resonance condition \(f_n = (n/2L)\sqrt{F_T/\mu}\) can be tested graphically. With the string length \(L\) and mode number \(n\) fixed:

\[
f_n = \frac{n}{2L\sqrt{\mu}}\sqrt{F_T} \implies f_n^2 = \frac{n^2}{4L^2\mu}\,F_T
\]

A plot of \(f_n^2\) vs. \(F_T\) should be linear with slope \(n^2/(4L^2\mu)\). From the slope, the linear mass density is:

\[
\mu = \frac{n^2}{4L^2 \times \text{slope}}
\]

Alternatively, with \(F_T\) fixed and \(n\) varied by changing the frequency:

\[
f_n = n\cdot\frac{v}{2L}
\]

so \(f_n\) vs. \(n\) should be a straight line through the origin with slope \(v/(2L)\). The wave speed \(v\) extracted from this slope should agree with \(\sqrt{F_T/\mu}\) within the combined uncertainties.

---

# Chapter 6: Experiment 4 — LCR Circuits and Resonance

## 6.1 Theoretical Background: Inductance and Capacitance

An **inductor** is a coil of wire that stores energy in its magnetic field. When the current \(I\) through it changes, the changing magnetic flux induces an EMF that opposes the change (Faraday's law with Lenz's law):

\[
V_L = L\frac{dI}{dt}
\]

where \(L\) is the **inductance** in henries (H = V s/A = kg m\(^2\) A\(^{-2}\) s\(^{-2}\)). The energy stored in the inductor is \(U_L = \frac{1}{2}LI^2\).

A **capacitor** stores energy in its electric field. When a charge \(Q\) is stored on its plates, the voltage across it is:

\[
V_C = \frac{Q}{C}
\]

where \(C\) is the **capacitance** in farads (F = C/V = A\(^2\) s\(^4\) kg\(^{-1}\) m\(^{-2}\)). Since current is \(I = dQ/dt\), we can write \(V_C = (1/C)\int I\,dt\). The energy stored is \(U_C = \frac{1}{2}CV_C^2 = Q^2/(2C)\).

In an **LCR series circuit** driven by a sinusoidal voltage source \(V(t) = V_0\cos(\omega t)\), Kirchhoff's voltage law gives:

\[
L\frac{dI}{dt} + RI + \frac{Q}{C} = V_0\cos(\omega t)
\]

Since \(I = dQ/dt\), differentiating:

\[
L\ddot{I} + R\dot{I} + \frac{I}{C} = -V_0\omega\sin(\omega t)
\]

This is the driven, damped harmonic oscillator equation (exactly like the mechanical SHM equation \(m\ddot{x} + b\dot{x} + kx = F_0\cos(\omega t)\)), with the **dictionary**: \(m \leftrightarrow L\), \(b \leftrightarrow R\), \(1/k \leftrightarrow C\), \(F_0 \leftrightarrow V_0\omega\), \(x \leftrightarrow Q\), \(\dot{x} \leftrightarrow I\).

The **natural frequency** is:

\[
\omega_0 = \frac{1}{\sqrt{LC}}
\]

and the **resonance** occurs near \(\omega = \omega_0\), where the current amplitude is maximised. At exact resonance in the limit of small damping, the impedances of the inductor and capacitor cancel:

\[
Z_L = j\omega_0 L = j\omega_0 L, \quad Z_C = 1/(j\omega_0 C) = -j\omega_0 L
\]

(since \(\omega_0^2 = 1/(LC)\)), and the only impedance is \(Z_R = R\). The current amplitude at resonance is \(I_0 = V_0/R\) — maximised.

## 6.2 Impedance and Phasors

Complex notation greatly simplifies AC circuit analysis. For a sinusoidal source \(V(t) = V_0\cos(\omega t) = \text{Re}[V_0 e^{j\omega t}]\), all currents and voltages in a linear circuit are also sinusoidal at the same frequency. We represent them as complex amplitudes (phasors): \(\tilde{V} = V_0 e^{j\phi_V}\), \(\tilde{I} = I_0 e^{j\phi_I}\). The **impedance** \(Z = \tilde{V}/\tilde{I}\) is the complex ratio.

For the three passive elements:
- Resistor: \(Z_R = R\) (real; voltage and current in phase)
- Inductor: \(Z_L = j\omega L\) (purely imaginary; voltage leads current by 90°)
- Capacitor: \(Z_C = 1/(j\omega C) = -j/(\omega C)\) (purely imaginary; voltage lags current by 90°)

For a series LCR circuit, the total impedance is:

\[
Z = R + j\omega L + \frac{1}{j\omega C} = R + j\!\left(\omega L - \frac{1}{\omega C}\right)
\]

The magnitude is \(|Z| = \sqrt{R^2 + (\omega L - 1/(\omega C))^2}\) and the current amplitude is \(I_0 = V_0/|Z|\). The phase of the current relative to the voltage is:

\[
\phi = -\arctan\!\left(\frac{\omega L - 1/(\omega C)}{R}\right)
\]

The **quality factor** \(Q = \omega_0 L/R = 1/(\omega_0 CR)\) characterises the sharpness of resonance. The half-power bandwidth is \(\Delta\omega = \omega_0/Q\), so a high-Q circuit has a narrow resonance peak.

## 6.3 Experimental Method

Experiment 4 measures the frequency response of a series LCR circuit. A function generator drives the circuit across a range of frequencies \(\omega\) from well below \(\omega_0\) to well above. At each frequency, the amplitude and phase of the current (measured as the voltage across the resistor \(R\)) are recorded using a dual-channel oscilloscope.

The oscilloscope allows simultaneous display of the driving voltage \(V(t)\) and the resistor voltage \(V_R(t) = RI(t)\). From these traces, students measure:
1. The peak voltage \(V_{R,0}\) (proportional to the current amplitude \(I_0 = V_{R,0}/R\))
2. The phase lag \(\phi\) between \(V_R\) and \(V\) (measured from the horizontal offset between the peaks divided by the period)

At resonance, \(\phi = 0\) (current in phase with source voltage, all reactive impedances cancel) and \(V_{R,0} = V_0\) (all voltage appears across \(R\)). The resonance frequency \(f_0 = \omega_0/(2\pi)\) is precisely determined from the peak of the \(V_{R,0}\) vs. \(f\) curve.

From the measured \(f_0\) and the known \(L\) and \(C\), the relation \(f_0 = 1/(2\pi\sqrt{LC})\) can be tested. The bandwidth \(\Delta f\) (full width at half-maximum power, i.e., at \(V_{R,0} = V_0/\sqrt{2}\)) gives the \(Q\)-factor: \(Q = f_0/\Delta f\). This can be compared to the theoretical value \(Q = \omega_0 L/R\).

## 6.4 Expected Results and Sources of Error

The measured resonance frequency should agree with \(1/(2\pi\sqrt{LC})\) within the uncertainty from the tolerance of \(L\) and \(C\). Commercial inductors and capacitors have tolerances of 5–20%; precision components (1% or better) are needed for quantitative testing of the model.

Important systematic effects: the inductor has a significant series resistance \(R_L\) (from the wire windings) that adds to the nominal \(R\) and affects both the resonance amplitude and the bandwidth. Students should measure \(R_L\) with a DC resistance measurement and incorporate it: \(R_\text{eff} = R + R_L\). The function generator itself has an internal resistance of typically 50 \(\Omega\) that must be accounted for in the circuit model.

---

# Chapter 7: Experiment 5 — Magnetic Field of a Current-Carrying Coil

## 7.1 Theoretical Background: Biot-Savart Law

The magnetic field produced by a steady current is given by the **Biot-Savart Law**:

\[
d\mathbf{B} = \frac{\mu_0 I}{4\pi}\frac{d\mathbf{l}\times\hat{r}}{r^2}
\]

where \(d\mathbf{l}\) is an infinitesimal current element (in the direction of current flow), \(\hat{r}\) is the unit vector from the element to the field point, and \(r\) is the distance. The total field is obtained by integrating over the entire current distribution:

\[
\mathbf{B}(\mathbf{r}) = \frac{\mu_0 I}{4\pi}\int \frac{d\mathbf{l}\times\hat{r}}{r^2}
\]

For a **circular current loop** of radius \(R\) carrying current \(I\), the field at a point \(P\) on the axis at distance \(z\) from the centre can be computed analytically. By symmetry, the off-axis components cancel and only the on-axis component survives:

\[
B_z = \frac{\mu_0 I R^2}{2(R^2 + z^2)^{3/2}}
\]

At the centre of the loop (\(z = 0\)): \(B_\text{centre} = \mu_0 I/(2R)\). Far from the loop (\(z \gg R\)): \(B_z \approx \mu_0 IR^2/(2z^3) = \mu_0 m/(2\pi z^3)\), where \(m = I\pi R^2\) is the magnetic dipole moment — consistent with the dipole field formula.

<div class="proof">
<strong>Derivation of On-Axis Field of a Circular Loop.</strong> Place the loop in the \(xy\)-plane, centred at the origin. A current element at angle \(\phi\) has position \(\mathbf{r}' = R\cos\phi\,\hat{x} + R\sin\phi\,\hat{y}\) and vector element \(d\mathbf{l} = R\,d\phi(-\sin\phi\,\hat{x} + \cos\phi\,\hat{y})\). The field point is at \(\mathbf{r} = z\hat{z}\). The displacement is:

\[
\mathbf{r} - \mathbf{r}' = -R\cos\phi\,\hat{x} - R\sin\phi\,\hat{y} + z\hat{z}, \quad |\mathbf{r}-\mathbf{r}'| = \sqrt{R^2+z^2}
\]

Computing \(d\mathbf{l}\times(\mathbf{r}-\mathbf{r}')\) and integrating from \(0\) to \(2\pi\), the \(x\)- and \(y\)-components vanish by symmetry (equal contributions from opposite sides of the loop), and the \(z\)-component integrates to give:

\[
B_z = \frac{\mu_0 I}{4\pi}\int_0^{2\pi}\frac{R^2\,d\phi}{(R^2+z^2)^{3/2}} = \frac{\mu_0 I R^2}{2(R^2+z^2)^{3/2}}
\]
</div>

For a **Helmholtz coil** pair — two identical circular loops of radius \(R\), separated by distance \(d = R\), each carrying current \(I\) — the field between the loops is remarkably uniform. At the midpoint between the coils:

\[
B_\text{mid} = \left(\frac{4}{5}\right)^{3/2}\frac{\mu_0 I}{R} \approx 0.7155\,\frac{\mu_0 I}{R}
\]

The first and second derivatives of \(B\) vanish at the midpoint (by symmetry), and the third derivative also vanishes at the optimal separation \(d = R\) — making the field uniform to order \((z/R)^4\). Helmholtz coils are widely used to produce controlled, uniform magnetic fields in laboratory settings.

## 7.2 Experimental Method

Students measure the axial field of a circular coil (or Helmholtz coil pair) as a function of position \(z\) using a Hall probe on a translation stage. The coil current \(I\) is supplied by a DC power supply and measured by an ammeter (or by the voltage across a precision resistor). The coil radius \(R\) and number of turns \(N\) are known from construction.

Measurements are taken at positions from \(z = -3R\) to \(z = +3R\) in increments of \(0.1R\). The measured \(B(z)\) profile is compared to the theoretical prediction for \(N\) turns:

\[
B_z(z) = \frac{\mu_0 N I R^2}{2(R^2 + z^2)^{3/2}}
\]

A chi-squared goodness-of-fit test assesses whether the theoretical profile is consistent with the data. If the fit is good, \(\mu_0\) can be extracted from the data and compared to its accepted value of \(4\pi \times 10^{-7}\) T m A\(^{-1}\).

## 7.3 Determination of \(\mu_0\) and Systematic Uncertainties

The measurement of \(\mu_0\) from the field of a known current coil is a classic precision experiment. The dominant systematic uncertainties are:

**Coil geometry**: the effective radius \(R\) must be measured carefully, as \(B \propto R^{-1}\) at the centre and \(B \propto R^2(R^2+z^2)^{-3/2}\) in general. A 1% error in \(R\) propagates to a 1–2% error in \(\mu_0\).

**Hall probe calibration**: the Hall coefficient \(R_H\) of the probe is temperature-dependent and must be calibrated at the operating temperature. Errors in calibration directly translate to errors in the measured field and thus in \(\mu_0\).

**Current measurement**: the ammeter reads the total current but cannot distinguish between the coil current and leakage currents. High-quality ammeters with 0.1% accuracy are needed for a 1% determination of \(\mu_0\).

**Background field**: the Earth's magnetic field (\(\sim 50\;\mu\)T) and stray fields from nearby equipment must be characterised and subtracted. Running the coil in both current directions and averaging cancels the background.

---

# Chapter 8: Writing Laboratory Reports

## 8.1 The Purpose and Structure of a Lab Report

A laboratory report is a scientific document that communicates what was done, what was found, and what it means. It is not a diary of everything that happened in the lab — it is a concise, logically structured argument for a conclusion, supported by evidence in the form of data and analysis. The audience is a competent physicist who did not participate in the experiment; the report must contain enough information for that reader to evaluate and, in principle, reproduce the work.

A complete lab report contains the following sections: **Abstract** (brief summary of the goal, method, key results, and conclusions, in 100–200 words); **Introduction** (the physical question being investigated, the theoretical framework, and what is being tested); **Experimental Method** (a description of the apparatus and procedure precise enough to allow repetition); **Data and Analysis** (the raw measurements, data tables, graphs, calculations, and error analysis); **Discussion** (comparison of results with theory, interpretation of discrepancies, assessment of systematic effects, and suggestions for improvement); and **Conclusion** (the key numerical results with uncertainties and a clear statement of what they confirm or refute).

## 8.2 Graphing Standards

Graphs are the primary means of communicating experimental data. Every graph must have: labelled axes with units; error bars on all data points (unless errors are negligibly small); a fitted curve or line with fitting parameters stated in the caption or legend; a descriptive caption; and an indication of the goodness of fit (\(\chi^2_\nu\) or equivalent).

Error bars represent the uncertainty in each measurement. For the vertical axis, a symmetric error bar of height \(\pm\delta y_i\) centred on the data point \((x_i, y_i)\) visually communicates the uncertainty. If the uncertainties in \(x\) are also significant, horizontal error bars should be shown as well. A data point with a very small error bar should be given more weight in any fit — this is the meaning of weighted least-squares.

## 8.3 Comparing Results with Theory

The most important question in experimental physics is: does my result agree with theory? This question requires a precise, quantitative answer based on the uncertainties. The **discrepancy** between a measured value \(q_\text{meas}\) and a theoretical prediction \(q_\text{theory}\) is:

\[
\text{discrepancy} = |q_\text{meas} - q_\text{theory}|
\]

This is meaningful only when expressed in units of the combined uncertainty:

\[
t = \frac{|q_\text{meas} - q_\text{theory}|}{\sqrt{(\delta q_\text{meas})^2 + (\delta q_\text{theory})^2}}
\]

A discrepancy of \(t < 1\) is entirely consistent with random uncertainty; \(1 < t < 2\) is suspicious but not alarming; \(t > 3\) is strong evidence of a systematic problem (either in the experiment or in the theory). The appropriate language is "the measured value is consistent with the theoretical prediction within \(1.2\sigma\)" or "the measured value differs from the theoretical prediction by \(3.5\sigma\), suggesting a systematic error in the calibration."

---

# Chapter 9: Advanced Statistical Topics

## 9.1 The Chi-Squared Distribution and Goodness of Fit

The **chi-squared statistic** \(\chi^2 = \sum_i (y_i - f(x_i))^2/\sigma_i^2\) follows a **chi-squared distribution** with \(\nu = N - p\) degrees of freedom (where \(N\) is the number of data points and \(p\) is the number of fitted parameters). The expected value of \(\chi^2\) for a correct model with correctly estimated uncertainties is \(\langle\chi^2\rangle = \nu\), so the **reduced chi-squared** \(\chi^2_\nu = \chi^2/\nu \approx 1\) when all is well.

The **p-value** associated with an observed \(\chi^2\) is the probability of obtaining a value at least as large purely by chance, assuming the model is correct:

\[
p = P(\chi^2_\nu \geq \chi^2_{\nu,\text{obs}}) = \int_{\chi^2_{\nu,\text{obs}}}^\infty f_\nu(t)\, dt
\]

where \(f_\nu\) is the chi-squared probability density. A small p-value (e.g., \(p < 0.05\)) indicates that the model is inconsistent with the data at the 5% significance level — though this could result from either a bad model or underestimated uncertainties.

## 9.2 The Student t-Distribution for Small Samples

When the population variance is unknown and is estimated from the sample, the ratio \(t = (\bar{x} - \mu)/(\sigma_{\bar{x}})\) follows a **Student's t-distribution** with \(N-1\) degrees of freedom. The t-distribution has heavier tails than the Gaussian — reflecting greater uncertainty when the variance is estimated from a small sample. As \(N\to\infty\), the t-distribution approaches a Gaussian.

The **confidence interval** for the true mean \(\mu\) at confidence level \(1-\alpha\) is:

\[
\bar{x} - t_{\alpha/2, N-1}\,\frac{s}{\sqrt{N}} \leq \mu \leq \bar{x} + t_{\alpha/2, N-1}\,\frac{s}{\sqrt{N}}
\]

where \(t_{\alpha/2, N-1}\) is the critical value of the t-distribution. For \(N = 10\) and 95% confidence, \(t_{0.025, 9} = 2.262\), somewhat larger than the Gaussian value of 1.960. The difference becomes negligible for \(N > 30\).

## 9.3 Systematic Errors: Detection and Mitigation

Systematic errors are the arch-nemesis of precision measurement. They cannot be reduced by taking more data, but they can be identified and bounded by several techniques.

**Repetition with different apparatus**: if two independent methods of measuring the same quantity give consistent results, it is unlikely (though not impossible) that both suffer from the same systematic error. Inconsistency between methods is strong evidence of a systematic effect in one or both.

**Varying control parameters**: if a measurement systematically depends on a parameter that it should not depend on (e.g., if the measured resistance depends on the direction of current flow for a passive resistor), that indicates a systematic effect. Plotting results vs. suspected systematic variables often reveals the source.

**Checking with known standards**: calibrate instruments against certified reference standards (NIST-traceable where possible) before and after a measurement run. Drift in calibration is a common source of time-dependent systematic errors.

**Blinding**: in high-stakes measurements, hide the value of the key result until the analysis is finalised to prevent unconscious bias toward the expected value. This is standard practice in particle physics and medical trials.

## 9.4 Dimensional Homogeneity as an Error-Catching Tool

Before computing any result, verify that the formula being used is dimensionally consistent. A common mistake is to forget a conversion factor (mixing SI and non-SI units) or to square a quantity that should be unsquared (or vice versa). Dimensional analysis immediately reveals such errors: if the right-hand side of a formula has units of kg m\(^2\) s\(^{-2}\) and the left-hand side should be in newtons, there is definitely an error.

Additionally, always perform **order-of-magnitude estimates** of the expected result before computing it precisely. If your calculation gives \(g = 980\) m/s\(^2\) instead of 9.80 m/s\(^2\), the factor-of-100 discrepancy should immediately trigger a check for a misplaced power of ten or a forgotten unit conversion.

# Chapter 10: Signal Processing and Fourier Methods in the Laboratory

## 10.1 Time-Domain and Frequency-Domain Representations

Every laboratory measurement is, at its core, a time-series — a sequence of values recorded at successive instants. While the time-domain representation is the raw data, the **frequency-domain** representation often reveals structure invisible in the time domain. The mathematical bridge between these representations is the **Fourier transform**.

For a continuous function \(f(t)\), the Fourier transform is:

\[
\tilde{f}(\nu) = \int_{-\infty}^{\infty} f(t)\,e^{-2\pi i \nu t}\,dt
\]

and the inverse transform recovers \(f(t)\) from \(\tilde{f}(\nu)\):

\[
f(t) = \int_{-\infty}^{\infty} \tilde{f}(\nu)\,e^{2\pi i \nu t}\,d\nu
\]

The **power spectral density** (PSD) is \(S(\nu) = |\tilde{f}(\nu)|^2\) and represents how the signal's power (mean-square amplitude) is distributed across frequencies. Parseval's theorem states that the total power is the same whether computed in the time or frequency domain: \(\int |f(t)|^2 dt = \int |\tilde{f}(\nu)|^2 d\nu\). In a laboratory context, if \(f(t)\) is a voltage measurement, \(S(\nu)\) tells you the noise power per unit bandwidth at each frequency, which is crucial for identifying interference sources (e.g., 60 Hz power-line pickup, vibration at the building's HVAC resonance frequency, etc.).

In practice, data are recorded discretely: \(N\) samples at spacing \(\Delta t\), giving total duration \(T = N\Delta t\). The **discrete Fourier transform** (DFT) is computed by the Fast Fourier Transform (FFT) algorithm in \(O(N\log N)\) operations rather than the \(O(N^2)\) of naive matrix multiplication. The DFT resolves frequencies from \(0\) to \(f_{\text{Nyquist}} = 1/(2\Delta t)\) in steps of \(\Delta\nu = 1/T\). The **Nyquist theorem** states that to faithfully represent a signal containing frequencies up to \(f_{\max}\), the sampling rate must be at least \(2f_{\max}\). Violation of this causes **aliasing**: high-frequency components fold back into the low-frequency range and produce spurious signals that are indistinguishable from genuine low-frequency content. In practice, an analog anti-aliasing low-pass filter is applied before digitisation.

## 10.2 Lock-In Detection

Many laboratory signals are buried in noise that overwhelms them in the time domain. **Lock-in amplification** is a phase-sensitive detection technique that exploits the mathematical properties of the Fourier transform to extract a signal at a specific reference frequency with a noise bandwidth determined not by the total measurement bandwidth but by the time constant of a low-pass filter.

The principle is elegant. Suppose the signal of interest is \(V_{\text{sig}}(t) = A\cos(\omega_R t + \phi)\) where \(\omega_R\) is a known reference frequency and \(A, \phi\) are unknown. The lock-in multiplies the measured signal \(V(t) = V_{\text{sig}}(t) + V_{\text{noise}}(t)\) by a reference waveform \(V_R\cos(\omega_R t)\):

\[
V(t) \cdot V_R\cos(\omega_R t) = \frac{AV_R}{2}\cos\phi + \frac{AV_R}{2}\cos(2\omega_R t + \phi) + V_{\text{noise}}(t) \cdot V_R\cos(\omega_R t)
\]

After low-pass filtering to remove the \(2\omega_R\) term and average the noise contribution to zero, the output is \(\frac{AV_R}{2}\cos\phi\). Using a second reference channel shifted by 90°, the quadrature component \(\frac{AV_R}{2}\sin\phi\) is obtained. The amplitude \(A = 2\sqrt{X^2 + Y^2}/V_R\) and phase \(\phi = \arctan(Y/X)\) are recovered precisely. The effective noise bandwidth is \(\Delta f_{\text{noise}} = 1/(4\tau)\) where \(\tau\) is the low-pass filter time constant. By choosing \(\tau = 10\,\text{s}\), one achieves \(\Delta f = 25\,\text{mHz}\) — an extraordinarily narrow bandwidth that rejects virtually all noise outside a tiny window around \(\omega_R\). Lock-in amplifiers routinely detect signals 100 dB below the noise floor.

## 10.3 Oscilloscope Use and Time-Base Calibration

The oscilloscope is the most versatile electronic measurement instrument. It displays voltage as a function of time with a calibrated time base and vertical sensitivity. Key features relevant to physics laboratories include:

**Triggering** is the mechanism by which the oscilloscope synchronises its display to the signal. The trigger circuit fires the time-base sweep when the input crosses a threshold voltage (level triggering) or at an external reference signal (external triggering). For repetitive signals, stable triggering produces a stationary display; for one-shot events, single-shot triggering captures the transient.

**Bandwidth** is the \(-3\,\text{dB}\) frequency of the oscilloscope's input amplifier — the frequency at which the displayed amplitude falls to \(1/\sqrt{2}\) of the true value. For accurate measurement of a waveform with frequency \(f\), the oscilloscope bandwidth should exceed \(5f\) (to avoid both amplitude error and phase distortion). Modern digital oscilloscopes (DSOs) store data digitally and offer powerful features: automatic measurement of period, frequency, amplitude, rise time; FFT display for frequency-domain analysis; and averaging modes that reduce random noise by \(\sqrt{N}\) for \(N\) averages.

**Probe compensation** is a subtle calibration step often overlooked by beginners. A 10× passive probe contains a series resistor (\(9\,\text{M}\Omega\)) forming a voltage divider with the oscilloscope's input impedance (\(1\,\text{M}\Omega\)), attenuating the signal by 10× while increasing the input impedance by 10× (reducing circuit loading). The probe tip has a capacitance (\(\sim 15\,\text{pF}\)) that must be compensated by a trimmer capacitor in the probe to give a flat frequency response. Miscompensation shows as either a square wave with rounded edges (under-compensated) or with overshoot (over-compensated); the trimmer is adjusted until the square wave edges are vertical.

# Chapter 11: Detailed Analysis of Experiment 1 — Magnetic Dipole Field

## 11.1 The Magnetic Dipole in Three Dimensions

The magnetic field of a bar magnet at large distances is well approximated by that of a magnetic dipole. In spherical coordinates \((r, \theta, \phi)\) with the dipole moment \(\mathbf{m} = m\hat{z}\) pointing along the \(z\)-axis:

\[
\mathbf{B} = \frac{\mu_0}{4\pi}\frac{m}{r^3}\left(2\cos\theta\,\hat{r} + \sin\theta\,\hat{\theta}\right)
\]

The magnitude is \(B = \frac{\mu_0 m}{4\pi r^3}\sqrt{3\cos^2\theta + 1}\). Along the dipole axis (\(\theta = 0\)): \(B_{\text{axis}} = \frac{\mu_0}{4\pi}\frac{2m}{r^3}\). Along the equatorial plane (\(\theta = \pi/2\)): \(B_{\text{equat}} = \frac{\mu_0}{4\pi}\frac{m}{r^3}\). The ratio of axis to equatorial field at the same distance is exactly 2 — a clean test of the dipole model.

<div class="example">
<strong>Example: Extracting the dipole moment from measurements.</strong> Measuring \(B(r)\) along the axis gives \(\ln B = \ln\left(\frac{\mu_0 m}{2\pi}\right) - 3\ln r\). A log-log plot should give a straight line with slope \(-3\). The intercept gives \(\ln(\mu_0 m/2\pi)\), from which \(m\) is extracted. If the slope deviates significantly from \(-3\), the magnet cannot be treated as a point dipole at the measured distances; finite-size corrections (involving higher multipole moments) become important.
</div>

In the experiment, a Hall probe measures the component of \(\mathbf{B}\) perpendicular to its active area. Care must be taken to orient the probe so that its sensitive axis aligns with the field direction: measuring a component rather than the full magnitude introduces a systematic angular error. The probe should be mounted on a calibrated ruler and its calibration verified against a known field (e.g., at the centre of a solenoid with known current and geometry).

## 11.2 Error Analysis for the Magnetic Dipole Experiment

The dominant sources of uncertainty in the dipole experiment are: (1) positional uncertainty in \(r\) (the probe is finite-sized and the magnet's magnetic centre does not coincide with its geometric centre); (2) calibration uncertainty of the Hall probe (typically \(\pm 1\%\) of full scale); (3) background field (Earth's magnetic field is \(\sim 50\,\mu\text{T}\), significant for weak sources); (4) deviation from ideal dipole behaviour at small \(r\).

The positional uncertainty can be characterised by introducing an offset parameter: instead of \(B \propto r^{-3}\), fit \(B \propto (r - r_0)^{-3}\) where \(r_0\) is the apparent origin offset. This is a nonlinear fit, best approached iteratively (Levenberg-Marquardt algorithm) or by noting that \(B^{-1/3} \propto (r - r_0)\), so a plot of \(B^{-1/3}\) vs. \(r\) should be linear with slope proportional to the intercept on the \(r\)-axis giving \(r_0\). The background field can be subtracted by measuring at a distance far enough from the magnet that \(B_{\text{dipole}} \ll B_{\text{Earth}}\) and recording this as \(B_{\text{bg}}\); all subsequent measurements subtract this baseline. The uncertainty in the background itself (from probe noise and temporal fluctuations in the Earth's field due to ionospheric currents) typically dominates the uncertainty in weak-field measurements.

# Chapter 12: Detailed Analysis of Experiment 2 — Circuits and Resistance

## 12.1 Kirchhoff's Laws from First Principles

Kirchhoff's current law (KCL) and voltage law (KVL) are macroscopic expressions of charge conservation and energy conservation, respectively. KCL states that the sum of currents entering any node is zero: this follows from the continuity equation \(\partial\rho_q/\partial t + \boldsymbol{\nabla}\cdot\mathbf{J} = 0\) in the steady state (\(\partial\rho_q/\partial t = 0\)), integrated over a closed surface surrounding the node. KVL states that the sum of voltages around any closed loop is zero: this follows from Faraday's law \(\oint\mathbf{E}\cdot d\mathbf{l} = -d\Phi_B/dt\) in the quasi-static limit where the magnetic flux through circuit loops is negligible.

These simple algebraic rules allow systematic analysis of arbitrarily complex circuits. For a circuit with \(N\) nodes and \(B\) branches, there are \(B\) unknown currents. KCL provides \(N-1\) independent equations (the \(N\)-th is redundant), and \(B - (N-1)\) independent loop equations from KVL give the remaining equations. This is the **mesh current method**: choose \(B - N + 1\) independent loops and write KVL for each, solving the resulting system of \(B\) linear equations in \(B\) unknowns.

## 12.2 The Wheatstone Bridge — Full Analysis

The Wheatstone bridge consists of four resistors \(R_1, R_2, R_3, R_x\) in a diamond configuration, with a voltage source across one diagonal and a galvanometer across the other. Applying KCL and KVL, the balance condition (zero galvanometer current) gives:

\[
\frac{R_1}{R_2} = \frac{R_3}{R_x} \implies R_x = \frac{R_2 R_3}{R_1}
\]

At balance, \(R_x\) can be determined solely from the ratio \(R_2/R_1\) and the known resistance \(R_3\), making the result independent of the source voltage (as long as it is nonzero) and the galvanometer resistance. The sensitivity of the bridge — how large a galvanometer deflection results from a small imbalance \(\delta R\) — is analysed by computing the Thévenin equivalent seen by the galvanometer. Near balance, the galvanometer current is approximately proportional to \(\delta R / R\), with a sensitivity that is maximised when all four arms are equal (\(R_1 = R_2 = R_3 = R_x\)).

The practical advantages of the Wheatstone bridge over direct measurement are substantial. Common-mode noise (e.g., power-supply fluctuations) affects all four arms equally and cancels; temperature-dependent drifts cancel if all arms are made of the same material and are in thermal contact; and the null-detection method (finding balance rather than reading a deflected meter) can achieve very high accuracy because sensitive null detectors are easier to make than accurate analog meters. Modern bridge circuits using operational amplifiers achieve parts-per-million accuracy in resistance measurement.

## 12.3 Contact Resistance and the Four-Wire Method

When measuring small resistances (\(< 1\,\Omega\)), contact resistance at the probe tips — due to surface oxidation, probe pressure, and surface roughness — can be of the same magnitude as the resistance being measured. The **four-wire (Kelvin) measurement** eliminates contact resistance: two current-carrying probes (force leads) pass a known current \(I\) through the sample, while two separate voltage-sensing probes (sense leads) measure the voltage drop \(V\) across the sample. Because the sense leads carry negligible current (the voltmeter input impedance is \(\gg R_{\text{sample}}\)), the contact resistance at the sense probes drops negligible voltage and does not contribute to the measurement. The sample resistance is simply \(R = V/I\), free of contact resistance errors. Four-wire measurement is standard in all precision resistance metrology and in the van der Pauw method for measuring sheet resistance of thin films.

# Chapter 13: Detailed Analysis of Experiment 3 — Standing Waves

## 13.1 Normal Modes of a String — Full Derivation

A string of length \(L\), linear density \(\mu\), and tension \(T\) is fixed at both ends. The wave equation \(\partial^2 y/\partial t^2 = c^2 \partial^2 y/\partial x^2\) with \(c = \sqrt{T/\mu}\) and boundary conditions \(y(0,t) = y(L,t) = 0\) admits standing wave solutions. Separating variables \(y(x,t) = X(x)T(t)\):

\[
\frac{T''}{T} = c^2 \frac{X''}{X} = -\omega^2
\]

gives \(T(t) = A\cos\omega t + B\sin\omega t\) and \(X(x) = C\cos(kx) + D\sin(kx)\) with \(\omega = ck\). Applying \(X(0) = 0\) gives \(C = 0\); applying \(X(L) = 0\) gives \(\sin(kL) = 0\), so \(kL = n\pi\) for integer \(n \geq 1\). The **normal mode frequencies** are:

\[
f_n = \frac{n}{2L}\sqrt{\frac{T}{\mu}}, \quad n = 1, 2, 3, \ldots
\]

The \(n = 1\) mode is the **fundamental** (or first harmonic); \(n = 2\) is the first overtone (second harmonic); and so on. The spatial mode shapes are \(X_n(x) = \sin(n\pi x/L)\) — sinusoidal standing waves with \(n - 1\) interior nodes.

<div class="example">
<strong>Example: Determining string density from resonance frequencies.</strong> A 1.00 m string under tension 10.0 N resonates at \(f_1 = 25.0\,\text{Hz}\). From \(f_1 = \frac{1}{2L}\sqrt{T/\mu}\): \(\mu = T/(4L^2 f_1^2) = 10.0/(4 \times 1.00^2 \times 625) = 4.0 \times 10^{-3}\,\text{kg/m}\). Checking with \(f_2\): it should be \(50.0\,\text{Hz}\) exactly. Measuring \(f_n\) for multiple \(n\) and fitting \(f_n\) vs. \(n\) to a straight line through the origin gives a redundant, over-determined system that improves precision and detects inharmonicity (real strings depart from ideal because their finite stiffness raises higher harmonics above the harmonic series).
</div>

## 13.2 Resonance Curves and Q-Factor of a String Resonator

At resonance, the driving frequency equals a natural frequency and the amplitude is maximal. For a lightly damped string (with damping coefficient \(\gamma\)), the amplitude response curve near the \(n\)-th resonance is a Lorentzian:

\[
A_n(f) = \frac{A_0}{\sqrt{(f^2 - f_n^2)^2 + (\gamma f/m)^2}}
\]

The full width at half maximum (FWHM) of the resonance peak in power (amplitude squared) is \(\Delta f = \gamma/m\). The Q-factor is \(Q = f_n/\Delta f\). High-Q strings (small damping) have sharp, narrow resonances; low-Q strings (heavy damping, e.g., from a mute) have broad resonances. In the standing waves experiment, the resonance frequencies are identified by finding the frequencies that produce maximum amplitude for fixed driving force, or by sweeping frequency and recording the amplitude. Measuring the half-power points (\(A = A_{\max}/\sqrt{2}\)) on either side of the peak gives \(\Delta f\) and hence \(Q\).

In musical acoustics, the Q-factor determines sustain: a piano string with \(Q \approx 10^3\)–\(10^4\) sustains for several seconds, while a highly damped guitar string with a mute has \(Q \sim 10\)–\(100\) and decays almost immediately. The inharmonicity of real piano strings (due to stiffness) is what makes piano tuning a subtle art: the octave is tuned "stretched" because the second harmonic of a low note lies slightly above the true harmonic ratio, and matching this with the fundamental of the higher note requires stretching the scale.

# Chapter 14: Detailed Analysis of Experiment 4 — LCR Circuits

## 14.1 Complex Impedance and Phasor Analysis

In the steady-state AC regime at frequency \(\omega = 2\pi f\), all voltages and currents are sinusoidal: \(v(t) = V_0\cos(\omega t + \phi)\). The mathematical convenience of phasor analysis replaces these with complex amplitudes: \(\tilde{V} = V_0 e^{i\phi}\), with the understanding that physical quantities are the real parts. The **complex impedance** of each element is:

\[
Z_R = R, \quad Z_C = \frac{1}{i\omega C} = \frac{-i}{\omega C}, \quad Z_L = i\omega L
\]

Impedances combine exactly like resistances: in series, \(Z_{\text{total}} = \sum_k Z_k\); in parallel, \(1/Z_{\text{total}} = \sum_k 1/Z_k\). The magnitude gives the ratio of voltage to current amplitudes, and the argument gives the phase angle by which voltage leads current. For a capacitor, voltage lags current by 90° (current leads by "ELI the ICE man": \(\mathbf{E}\)MI leads current in an \(\mathbf{L}\)inductor, current leads in a \(\mathbf{C}\)apacitor). For an inductor, voltage leads current by 90°.

For a series LCR circuit driven by voltage \(\tilde{V}_s e^{i\omega t}\), the total impedance is \(Z = R + i(\omega L - 1/\omega C)\) and the current is \(\tilde{I} = \tilde{V}_s/Z\). The magnitude is:

\[
I_0 = \frac{V_s}{\sqrt{R^2 + (\omega L - 1/\omega C)^2}}
\]

Maximum current (resonance) occurs when \(\omega L = 1/\omega C\), i.e., \(\omega_0 = 1/\sqrt{LC}\), and equals \(V_s/R\). The quality factor \(Q = \omega_0 L/R = 1/(\omega_0 CR)\) equals the ratio of the reactive impedance to resistance at resonance, and also equals \(f_0/\Delta f\) where \(\Delta f\) is the FWHM of the power resonance curve. High-Q circuits (small \(R\) for given \(L, C\)) have sharp resonances and are used in radio tuners to select a specific broadcast frequency while rejecting adjacent channels.

## 14.2 Measuring Inductance and Capacitance

In the LCR experiment, \(L\) and \(C\) are measured from the resonance condition and from the frequency dependence of impedance.

**Method 1: Resonance frequency.** From \(\omega_0 = 1/\sqrt{LC}\), measuring \(f_0\) and knowing one of \(L\) or \(C\) gives the other. If both are unknown, measure the resonance frequency with several different capacitors (swapping them in the circuit) and plot \(f_0^2\) vs. \(1/C\): the slope is \(1/(4\pi^2 L)\).

**Method 2: Phase angle.** At frequency \(\omega\), the phase angle between the source voltage and the current is \(\phi = \arctan\left(\frac{\omega L - 1/\omega C}{R}\right)\). Measuring \(\phi\) (from the oscilloscope time delay between voltage and current waveforms: \(\phi = 2\pi f \Delta t\)) at multiple frequencies and fitting to this formula determines \(L\) and \(C\) simultaneously.

**Method 3: Half-power bandwidth.** The bandwidth \(\Delta\omega = R/L\) directly gives \(L\) if \(R\) is known. Combining with the resonance frequency \(\omega_0 = 1/\sqrt{LC}\) gives \(C = 1/(L\omega_0^2)\).

The uncertainty propagation for these methods follows from the formulas derived in Chapter 2. For Method 1, \(\sigma_L/L = 2\sigma_{f_0}/f_0 \oplus \sigma_C/C\) where \(\oplus\) denotes addition in quadrature. The dominant uncertainty is typically the resonance frequency determination, which depends on the precision with which the peak is identified — this is improved by fitting a Lorentzian to the amplitude vs. frequency data rather than simply reading off the maximum.

# Chapter 15: Detailed Analysis of Experiment 5 — Magnetic Field of a Coil

## 15.1 Biot-Savart Law and the Circular Loop

The magnetic field produced by a circular loop of radius \(a\) carrying current \(I\), at a point on the axis at distance \(z\) from the centre, follows from the Biot-Savart law:

\[
\mathbf{B}(z) = \frac{\mu_0 I}{4\pi}\oint \frac{d\mathbf{l} \times \hat{r}}{r^2}
\]

By symmetry, transverse components cancel and only the axial component survives:

\[
B_z = \frac{\mu_0 I a^2}{2(a^2 + z^2)^{3/2}}
\]

At the centre (\(z = 0\)): \(B_0 = \mu_0 I/(2a)\). Far from the loop (\(z \gg a\)): \(B_z \approx \mu_0 I a^2/(2z^3) = \mu_0 m/(2\pi z^3)\) where \(m = \pi a^2 I\) is the magnetic dipole moment — exactly the dipole field result, confirming that a current loop is a magnetic dipole.

## 15.2 Helmholtz Coils

A pair of identical coaxial circular loops separated by a distance equal to their common radius \(a\) forms a **Helmholtz pair**. The field at the midpoint between the two loops is:

\[
B_{\text{mid}} = 2 \times \frac{\mu_0 I a^2}{2(a^2 + (a/2)^2)^{3/2}} = \frac{\mu_0 I a^2}{(a^2 + a^2/4)^{3/2}} = \frac{\mu_0 I a^2}{(5a^2/4)^{3/2}} = \frac{8\mu_0 I}{5^{3/2} a} \approx \frac{0.7155 \mu_0 I}{a}
\]

The key property of Helmholtz coils is the exceptional homogeneity of the field near the midpoint. By symmetry, all odd derivatives of \(B_z\) with respect to \(z\) vanish at the midpoint. The separation \(d = a\) is chosen precisely to make the second derivative vanish as well: \(\partial^2 B_z/\partial z^2 = 0\) at the midpoint. The leading variation is therefore of order \(z^4\), making the field nearly uniform over a region of diameter \(\sim a/2\). This large homogeneous-field region is used to calibrate magnetometers, to apply controlled fields in atomic physics experiments, and to cancel Earth's magnetic field in sensitive measurements.

<div class="proof">
<strong>Proof that \(d^2B/dz^2 = 0\) at midpoint for \(d = a\).</strong> Writing \(B_z(z) = \frac{\mu_0 I a^2}{2}\left[(a^2 + (z-a/2)^2)^{-3/2} + (a^2 + (z+a/2)^2)^{-3/2}\right]\) and computing the second derivative at \(z = 0\) using \(\frac{d^2}{dz^2}(a^2 + z^2)^{-3/2}\big|_{z=0} = \frac{3(4z^2 - 2a^2)}{(a^2+z^2)^{7/2}}\big|_{z=0} = \frac{-6}{(a^2)^{5/2}} = \frac{-6}{a^5}\): setting this equal for both loops at their positions \(\pm a/2\) and summing, then requiring the sum to vanish, gives exactly \(d = a\) as the solution. The calculation is straightforward but algebraically intensive; the result confirms the Helmholtz condition exactly.
</div>

## 15.3 Calibrating a Hall Probe Using a Helmholtz Coil

In the coil experiment, the Helmholtz pair serves as a precision field source for calibrating the Hall probe. The field at the midpoint is known from \(B = 0.7155\mu_0 I/a\) with uncertainty determined by the uncertainty in \(I\) (from the ammeter calibration, typically \(\pm 0.1\%\)) and in \(a\) (from the coil geometry, typically \(\pm 0.5\%\)), giving a combined field uncertainty of about \(\pm 1\%\). This is compared to the Hall probe reading; any offset is subtracted (baseline) and the slope gives the probe sensitivity in V/T.

After calibration, the probe maps the field along and perpendicular to the coil axis, verifying the theoretical profiles and measuring the field homogeneity. The deviation from uniformity between the centre and a point at radius \(r\) from the axis can be predicted from the theoretical field: \(\Delta B/B_0 \approx (r/a)^4\) for \(r \ll a\). Plotting the measured deviation vs. \((r/a)^4\) tests this prediction and characterises the coil geometry.

# Chapter 16: Report Writing and Scientific Communication

## 16.1 Structure and Purpose of a Laboratory Report

A laboratory report is a scientific document that must be reproducible: a reader with access to the same equipment should be able to repeat the experiment exactly from the report alone, and a careful reader should be able to evaluate the validity of the conclusions from the presented data and analysis. These requirements directly dictate the structure of the report.

The **introduction** establishes the scientific context: what quantity or phenomenon is being studied, why it is important, and what approach the experiment takes. It ends with a clear statement of the experimental objective: "The goal of this experiment is to measure the dipole moment of a bar magnet by mapping the field strength as a function of distance along the dipole axis and fitting to the theoretical \(r^{-3}\) dependence." A good introduction is concise — two or three paragraphs — and cites relevant background sources.

The **theory section** derives the equations that will be used in the analysis, starting from fundamental principles. Do not simply state "the field of a magnetic dipole is \(B = \mu_0 m / (2\pi r^3)\)" — derive it, or at minimum indicate where the derivation can be found and what assumptions it rests on. Every symbol used must be defined. The theory section also identifies the linearised form of the relationship that will be used for fitting, e.g., "\(\ln B = \ln(\mu_0 m/2\pi) - 3\ln r\), so a log-log plot of \(B\) vs. \(r\) should give a straight line with slope \(-3\)."

The **experimental section** describes the apparatus and procedure in enough detail for reproduction: equipment model numbers and specifications, circuit diagrams for electrical experiments, photographs or schematic diagrams of the apparatus layout, and the step-by-step procedure followed. It also identifies sources of systematic error and how they were mitigated.

The **results and analysis section** presents the data (tables and graphs), performs the quantitative analysis (fits, calculations, error propagation), and presents the final result with uncertainty. Every graph must have axes labelled with quantity and units, a descriptive caption, error bars where appropriate, and — if a fit is shown — the fit parameters with uncertainties and the reduced chi-squared statistic.

The **conclusion** states the experimental result, compares it to the accepted value (if known) using a discrepancy test (is the difference within \(2\sigma\)? within \(3\sigma\)?), identifies the dominant sources of uncertainty and suggests improvements, and places the result in the context of the introduction's objectives.

## 16.2 Graphical Data Presentation

A graph serves two purposes: displaying data visually and communicating the relationship between variables. Both purposes require careful attention to design.

**Axis scales** should be chosen so that the data fill most of the plot area, not bunched in one corner. Linear scales are appropriate for most data; logarithmic scales are appropriate when the data span several orders of magnitude or when a power-law relationship is expected (since \(\log y = \log A + n\log x\) is linear). **Never** connect data points with straight lines unless the data are a direct time series and interpolation is meaningful; instead, show a theoretical curve or a fit curve.

**Error bars** represent the uncertainty (typically \(\pm 1\sigma\)) in each data point. Omitting error bars in a physics lab report is almost always wrong: without them, the reader cannot assess whether the data are consistent with the theoretical curve. If some data points have error bars much smaller than the point size, state this in the caption. If error bars are asymmetric (e.g., for log-transformed data), use asymmetric error bars.

**Fit residuals** — the differences between measured values and the fitted curve — should be plotted below the main graph. A good fit has residuals that are randomly distributed about zero with no systematic trends; systematic trends in the residuals indicate model inadequacy (e.g., a linear fit applied to a nonlinear relationship). The root-mean-square residual should be comparable to the measurement uncertainty; if it is much larger, either the model is wrong or the uncertainties are underestimated.

## 16.3 Uncertainty Reporting Conventions

Physical measurement results must be reported as \(\text{value} \pm \text{uncertainty}\) with both expressed to the same number of decimal places, and the uncertainty rounded to one or two significant figures. For example: \(g = 9.78 \pm 0.04\,\text{m/s}^2\) (not \(9.78234 \pm 0.0412\,\text{m/s}^2\)). The value and its uncertainty should always be accompanied by units, and the coverage factor (confidence level) stated if different from the standard \(1\sigma\) (68% confidence): \(g = 9.78 \pm 0.08\,\text{m/s}^2 \ (95\%\ \text{C.L.})\).

When comparing a measurement to an accepted value, compute the **normalised residual** or **tension**:

\[
t = \frac{|x_{\text{meas}} - x_{\text{accepted}}|}{\sqrt{\sigma_{\text{meas}}^2 + \sigma_{\text{accepted}}^2}}
\]

A value \(|t| < 1\) indicates agreement within uncertainties (this happens about 68% of the time for correct experiments); \(|t| < 2\) is normally considered acceptable; \(|t| > 3\) is strong evidence of either a systematic error or an underestimated uncertainty. The normalised residual is preferable to simply saying "our result is 5% higher than the accepted value" because it properly accounts for the uncertainties in both values.

# Chapter 17: Advanced Experimental Techniques

## 17.1 Signal Averaging and Noise Reduction

Random noise in a repeated measurement has standard deviation \(\sigma\) independent of the signal. After \(N\) independent measurements, the mean has standard deviation \(\sigma/\sqrt{N}\). This \(\sqrt{N}\) improvement with averaging is the fundamental reason why long measurements are better. However, the improvement is only realised if the noise is truly random (white noise); if there is correlated noise (flicker noise \(\propto 1/f\), drift), averaging beyond a certain optimal averaging time does not help and may even worsen the result.

**Signal averaging in the time domain** (for repetitive signals) is particularly powerful: trigger the acquisition on the signal and average \(N\) traces. White noise averages to zero, while the signal (which is phase-locked to the trigger) adds coherently. After \(N\) averages, SNR improves by \(\sqrt{N}\). For non-repetitive signals (transients), a single-shot acquisition is required, and SNR improvement requires bandwidth reduction (longer measurement time).

**Boxcar integration** is the temporal analogue of lock-in detection for pulsed signals: the output is integrated over a well-defined time gate that is synchronised to the signal pulse, then averaged. Only noise that falls within the gate window degrades the result. Boxcar integrators are used in pulsed laser spectroscopy, time-resolved photoluminescence, and pulsed NMR.

## 17.2 Grounding, Shielding, and Interference Rejection

Laboratory measurements are often degraded by electromagnetic interference from the environment: power-line hum at 60 Hz (and its harmonics), radio-frequency interference from nearby electronics, and ground loops (multiple ground connections at different potentials creating circulating currents).

**Proper grounding** requires that all instruments share a common ground reference (star topology rather than daisy chain), minimising ground-loop area. **Shielding** (Faraday cage) encloses sensitive circuitry in a conducting enclosure that presents a low-impedance path for induced currents, preventing electric fields from penetrating. Magnetic shielding requires high-permeability materials (mu-metal, with \(\mu_r \sim 10^5\)) that redirect flux around the shielded volume; this is more expensive and less effective at high frequencies.

**Differential measurement** (using a differential amplifier) rejects common-mode interference: any noise voltage that appears equally on both inputs is cancelled, while the difference (the signal) is amplified. The **common-mode rejection ratio** (CMRR) of the amplifier, specified in dB, quantifies this: a CMRR of 80 dB means that a 1 V common-mode interference appears as only \(10^{-4}\) V at the output. Twisted-pair cables exploit differential measurement: any interference induces equal voltages in both wires of the pair (since they traverse the same path), which cancel in a differential measurement. This is why professional audio and data communications cables use twisted pairs.

## 17.3 Calibration and Traceability

Every measurement instrument requires calibration: comparison against a more accurate reference standard. The accuracy of the final measurement cannot exceed the accuracy of the calibration standard, so the provenance of standards is important. **Metrological traceability** is the property of a measurement result whereby it is related to a national or international standard through an unbroken chain of calibrations, each with stated uncertainties.

National metrology institutes (NMI) — NIST in the USA, NPL in the UK, NRC in Canada — maintain primary standards for the SI base units. The 2019 redefinition of the SI fixed the values of \(h\) (Planck constant), \(e\) (elementary charge), \(k_B\) (Boltzmann constant), and \(N_A\) (Avogadro constant) to exact values, making the kilogram (redefined in terms of \(h\)), ampere (\(e\)), kelvin (\(k_B\)), and mole (\(N_A\)) reproducible from quantum experiments at any laboratory in the world, rather than depending on physical artefacts. The Josephson effect (\(V = nhf/2e\)) provides a voltage standard; the quantum Hall effect (\(R_H = h/e^2 = 25\,812.807\,\Omega\)) provides a resistance standard; caesium atomic clocks provide a time standard with fractional uncertainty \(< 10^{-16}\).
