---
title: "PHYS 122: Waves, Electricity and Magnetism Laboratory"
subjects: "PHYS"
prof: "Mikolas Skilandziunas"
---

## Sources and References
**Online resources** — Taylor, J. R. *An Introduction to Error Analysis*, 2nd ed. (standard reference for uncertainty propagation); NIST guidelines on measurement uncertainty at physics.nist.gov; HyperPhysics at hyperphysics.phy-astr.gsu.edu

---

# Chapter 1: The Nature of Experimental Physics

## 1.1 Why Experiment?

Physics is an empirical science. Its most elegant theories — Maxwell's equations, the Schrödinger equation, general relativity — are prized not merely for their mathematical beauty but because they make quantitative predictions that can be tested against the world. Every time a physicist performs an experiment and compares the outcome against theoretical expectation, they are participating in the ongoing negotiation between abstract mathematical models and physical reality.

This laboratory course is designed to induct you into that process. You will not follow recipes whose outcomes are pre-determined; rather, you will learn to design measurements, collect data, identify and quantify uncertainties, build models, and assess whether those models faithfully describe what you observe. These skills — critical thinking about evidence, quantitative reasoning under uncertainty — are transferable to virtually any field of scientific or technical endeavor.

## 1.2 What Makes a Good Measurement?

A measurement without an uncertainty estimate is nearly meaningless. To say that the period of a pendulum is "1.34 seconds" is incomplete; to say it is "\(1.34 \pm 0.02\) s" tells a story: the true value is very likely within 2% of 1.34, and you have enough information to assess whether a particular theory is consistent with your data.

<div class="definition">
<strong>Accuracy</strong> refers to how close a measurement is to the true (accepted) value. <strong>Precision</strong> refers to how reproducible the measurement is — the spread of repeated measurements. A highly precise measurement may still be inaccurate if there is a systematic error; an accurate average may be obtained from imprecise (highly scattered) data.
</div>

---

# Chapter 2: Measurement Uncertainty and Error Analysis

## 2.1 Types of Experimental Error

Experimental errors fall into two fundamentally distinct categories, each requiring a different treatment.

**Random errors** arise from uncontrolled fluctuations in the measurement process — thermal noise in electronics, slight variations in how a scale is read, turbulent air currents. They are, by definition, equally likely to push a reading high or low. With enough repeated measurements, random errors average out, and the true value is approached by the mean. Their magnitude is characterized by the **standard deviation**.

**Systematic errors** shift every measurement in the same direction — an incorrectly calibrated voltmeter always reads slightly high, a ruler whose first millimeter is worn away always underestimates. They do not diminish with repetition. Identifying and correcting systematic errors is one of the most demanding skills in experimental physics, requiring physical insight into every component of the measurement apparatus.

## 2.2 Statistical Description of Random Errors

Suppose a quantity \(x\) is measured \(N\) times, yielding values \(x_1, x_2, \ldots, x_N\). The **sample mean** is:

\[
\bar{x} = \frac{1}{N}\sum_{i=1}^{N} x_i.
\]

The **sample standard deviation** — a measure of the scatter of individual measurements — is:

\[
s = \sqrt{\frac{1}{N-1}\sum_{i=1}^{N}(x_i - \bar{x})^2}.
\]

The factor \(N-1\) rather than \(N\) in the denominator corrects for the fact that \(\bar{x}\) is estimated from the same data (Bessel's correction).

The best estimate of the true value is \(\bar{x}\), and the uncertainty on this estimate — the **standard error of the mean** — is:

\[
\sigma_{\bar{x}} = \frac{s}{\sqrt{N}}.
\]

This expression captures the intuition that averaging more measurements reduces uncertainty: the denominator grows as \(\sqrt{N}\), so quadrupling the number of measurements halves the uncertainty.

## 2.3 Propagation of Uncertainty

In most experiments, the quantity of interest \(f\) is not measured directly but is calculated from several measured quantities \(x, y, z, \ldots\), each with its own uncertainty \(\sigma_x, \sigma_y, \sigma_z, \ldots\). If these measurements are independent (uncorrelated), the uncertainty in \(f\) is found by **error propagation**:

\[
\sigma_f = \sqrt{\left(\frac{\partial f}{\partial x}\right)^2\sigma_x^2 + \left(\frac{\partial f}{\partial y}\right)^2\sigma_y^2 + \left(\frac{\partial f}{\partial z}\right)^2\sigma_z^2 + \cdots}.
\]

This formula is exact when the partial derivatives are evaluated at the measured values and the uncertainties are small relative to the values themselves (the linear approximation holds).

<div class="example">
<strong>Product of two quantities.</strong> If \(f = xy\), then \(\partial f/\partial x = y\) and \(\partial f/\partial y = x\), so
\[
\sigma_f = \sqrt{y^2\sigma_x^2 + x^2\sigma_y^2} = xy\sqrt{\left(\frac{\sigma_x}{x}\right)^2 + \left(\frac{\sigma_y}{y}\right)^2} = f\sqrt{\left(\frac{\sigma_x}{x}\right)^2 + \left(\frac{\sigma_y}{y}\right)^2}.
\]
The <strong>relative uncertainty</strong> in a product (or quotient) is the quadrature sum of the relative uncertainties in the factors. For a power law \(f = x^n\), the relative uncertainty satisfies \(\sigma_f/f = |n|\,\sigma_x/x\).
</div>

## 2.4 Significant Figures in Uncertainty

By convention, uncertainties are typically quoted to one or two significant figures. Once the uncertainty is established, the central value should be rounded to match the same decimal place. Writing \(T = 1.34217 \pm 0.02\) s is misleading — it implies more precision than the uncertainty permits. The correct form is \(T = 1.34 \pm 0.02\) s.

---

# Chapter 3: Scientific Data Analysis and Model Building

## 3.1 Graphical Analysis and Linear Fits

One of the most powerful tools in experimental physics is graphical analysis. If theory predicts a relationship \(y = mx + b\) between two quantities, then plotting the measured \(y\) values against \(x\) should yield points scattered about a straight line. The **least-squares linear fit** determines the slope \(m\) and intercept \(b\) that minimize the sum of squared deviations from the line:

\[
\chi^2 = \sum_{i=1}^{N} \left(\frac{y_i - mx_i - b}{\sigma_{y_i}}\right)^2.
\]

The closed-form solution, using the notation \(S = \sum (1/\sigma_i^2)\), \(S_x = \sum (x_i/\sigma_i^2)\), etc., gives optimal estimates of \(m\) and \(b\) along with their uncertainties. The quality of the fit is assessed by the reduced chi-squared:

\[
\chi^2_\nu = \frac{\chi^2}{N - 2},
\]

where \(N - 2\) is the number of degrees of freedom (subtracting 2 for the two fitted parameters). A reduced chi-squared near 1 indicates that the data scatter is consistent with the claimed uncertainties and the model is a plausible description. A value much greater than 1 suggests either that the model is wrong or that uncertainties have been underestimated; a value much less than 1 suggests overestimated uncertainties.

## 3.2 Linearization of Non-Linear Relationships

Many physical laws are not linear in the natural variables, but can be **linearized** by an appropriate change of variables. For example:

- The exponential decay \(N(t) = N_0 e^{-\lambda t}\) becomes linear by plotting \(\ln N\) vs. \(t\): the slope is \(-\lambda\) and the intercept is \(\ln N_0\).
- A power law \(y = ax^n\) becomes linear by plotting \(\log y\) vs. \(\log x\): slope is \(n\) and intercept is \(\log a\).
- The resonance frequency of an \(LC\) circuit, \(f_0 = 1/(2\pi\sqrt{LC})\), becomes linear in \(f_0^2\) vs. \(1/C\) (for fixed \(L\)): slope is \(1/(4\pi^2 L)\).

Linearization allows the powerful and well-understood machinery of linear regression to be applied to curved relationships.

## 3.3 Keeping Laboratory Notes

Good laboratory notes are not merely a bureaucratic requirement; they are an extension of the scientist's memory and a record of the experimental process that enables reproducibility. A complete set of notes should include:

- A clear statement of the purpose and the physical principle under investigation
- A schematic diagram of the experimental apparatus, labeling all components
- A record of instrument model numbers and calibration information
- All raw data in tabular form, with units and estimated uncertainties
- All intermediate calculations, clearly labeled
- Plots with labeled axes, error bars, and fitted curves
- A discussion comparing results with theoretical expectations, identifying sources of systematic error, and suggesting improvements

---

# Chapter 4: Experiment 1 — Magnetic Fields and Magnetostatics

## 4.1 Physics of Magnetic Fields

Magnetism arises from moving electric charges. The **Biot-Savart law** gives the infinitesimal magnetic field \(d\mathbf{B}\) produced at position \(\mathbf{r}\) by a current element \(Id\mathbf{l}\) at position \(\mathbf{r}'\):

\[
d\mathbf{B} = \frac{\mu_0}{4\pi}\frac{I\,d\mathbf{l} \times \hat{\mathbf{r}}'}{|\mathbf{r} - \mathbf{r}'|^2},
\]

where \(\mu_0 = 4\pi \times 10^{-7}\ \mathrm{T\,m\,A^{-1}}\) is the permeability of free space and \(\hat{\mathbf{r}}' = (\mathbf{r} - \mathbf{r}')/|\mathbf{r} - \mathbf{r}'|\) points from the source element to the field point.

For a long, straight wire carrying current \(I\), integration of the Biot-Savart law gives a field that circles the wire with magnitude:

\[
B = \frac{\mu_0 I}{2\pi d},
\]

where \(d\) is the perpendicular distance from the wire.

## 4.2 Magnetic Dipoles and Bar Magnets

A small current loop of area \(A\) carrying current \(I\) behaves as a **magnetic dipole** with moment:

\[
\mathbf{m} = I A\,\hat{n},
\]

where \(\hat{n}\) is the normal to the loop (right-hand rule). Along the dipole axis at distance \(r\) far from the loop:

\[
B \approx \frac{\mu_0}{4\pi}\frac{2m}{r^3}.
\]

A permanent bar magnet is a macroscopic collection of aligned atomic magnetic dipoles. It produces a dipole field at large distances, characterized by a north pole (field lines emerge) and a south pole (field lines enter). The goal of the magnets experiment is to characterize the field of a magnet arrangement and compare the measured field profile to theoretical predictions.

## 4.3 Measurement Techniques

A **Hall probe** measures the component of \(\mathbf{B}\) perpendicular to its sensing surface by exploiting the Hall effect: charge carriers moving in the magnetic field experience a Lorentz force \(\mathbf{F} = q\mathbf{v} \times \mathbf{B}\) that deflects them to one face of the conductor, building up a transverse voltage \(V_H = IB/(nqt)\) (where \(n\) is the carrier density and \(t\) is the thickness).

Systematic errors to consider include the background field of Earth (\(\approx 50\ \mu\mathrm{T}\)), the spatial variation of the field across the finite probe area, and any remanent magnetization of metallic lab components.

---

# Chapter 5: Experiment 2 — DC Circuits

## 5.1 Ohm's Law and Circuit Elements

**Ohm's law** relates the voltage \(V\) across a conductor to the current \(I\) through it:

\[
V = IR,
\]

where \(R\) is the **resistance** (unit: ohm, \(\Omega = \mathrm{V\,A^{-1}}\)). While many materials obey Ohm's law over a wide range of conditions, it is a phenomenological relation, not a fundamental law — its microscopic origin lies in the scattering of conduction electrons by lattice vibrations.

For resistors in **series**, the same current passes through each; the equivalent resistance is:

\[
R_{\mathrm{series}} = R_1 + R_2 + \cdots + R_N.
\]

For resistors in **parallel**, the same voltage is applied across each; the equivalent resistance satisfies:

\[
\frac{1}{R_{\mathrm{parallel}}} = \frac{1}{R_1} + \frac{1}{R_2} + \cdots + \frac{1}{R_N}.
\]

## 5.2 Kirchhoff's Laws

For circuits that cannot be reduced by simple series-parallel combinations, **Kirchhoff's laws** provide a systematic framework:

<div class="theorem">
<strong>Kirchhoff's Current Law (KCL):</strong> The algebraic sum of currents at any node is zero (conservation of charge):
\[
\sum_k I_k = 0.
\]

<strong>Kirchhoff's Voltage Law (KVL):</strong> The algebraic sum of voltage drops around any closed loop is zero (conservation of energy):
\[
\sum_k V_k = 0.
\]
</div>

## 5.3 Measuring Voltage and Current

A **voltmeter** measures the potential difference between two points and must be connected in **parallel** with the element of interest. It must have a very high internal resistance (ideally infinite) so it draws negligible current and does not perturb the circuit.

An **ammeter** measures current and must be connected in **series** in the branch of interest. It must have a very low internal resistance (ideally zero) so it introduces negligible additional voltage drop.

In practice, finite instrument impedances introduce systematic errors. If a voltmeter of resistance \(R_V\) is placed across a resistor \(R\), the parallel combination draws more current than \(R\) alone, and the measured voltage corresponds to \(R_{\mathrm{eff}} = RR_V/(R + R_V) < R\). Good experimental practice requires checking that \(R_V \gg R\) (or applying the correction).

---

# Chapter 6: Experiment 3 — Standing Waves

## 6.1 The Wave Equation and Superposition

Waves on a stretched string obey the **wave equation**:

\[
\frac{\partial^2 y}{\partial x^2} = \frac{1}{v^2}\frac{\partial^2 y}{\partial t^2},
\]

where \(y(x, t)\) is the transverse displacement and \(v = \sqrt{T/\mu}\) is the wave speed (\(T\) is the string tension, \(\mu\) is the linear mass density). The general solution is a superposition of rightward- and leftward-traveling waves.

When a rightward wave reflects off a fixed boundary (node condition \(y = 0\)), the reflected wave travels leftward with a phase shift of \(\pi\). The **principle of superposition** tells us to add the two waves:

\[
y(x,t) = A\sin(kx - \omega t) + A\sin(kx + \omega t + \pi) = 2A\sin(kx)\cos(\omega t).
\]

This is a **standing wave**: a spatially fixed pattern that oscillates in time. The **nodes** (points of zero displacement) occur where \(\sin(kx) = 0\), i.e., at \(x = 0, \lambda/2, \lambda, \ldots\). The **antinodes** (points of maximum displacement) occur midway between nodes.

## 6.2 Resonance Conditions

For a string of length \(L\) fixed at both ends, standing waves require nodes at \(x = 0\) and \(x = L\). This constrains the allowed wavelengths:

\[
L = n\frac{\lambda_n}{2}, \qquad n = 1, 2, 3, \ldots
\]

giving **harmonic frequencies**:

\[
f_n = \frac{nv}{2L} = \frac{n}{2L}\sqrt{\frac{T}{\mu}}.
\]

The lowest frequency \(f_1 = v/(2L)\) is the **fundamental** (first harmonic); higher frequencies are overtones (second harmonic at \(f_2 = 2f_1\), etc.). Measuring how \(f_n\) depends on \(T\), \(\mu\), and \(L\) provides a quantitative test of the formula above, and allows the determination of any one quantity (e.g., the tension) if the others are known.

## 6.3 Experimental Considerations

Standing waves on a string are excited by driving one end with an oscillator at a controlled frequency. The amplitude of the standing wave peaks sharply when the driving frequency matches one of the resonant frequencies — the response is a **resonance curve** with a peak width \(\Delta f\) related to the damping (energy loss) of the system. The **quality factor**:

\[
Q = \frac{f_n}{\Delta f}
\]

characterizes how sharp the resonance is. High \(Q\) means sharp, easily identified resonances; low \(Q\) means broad, harder-to-locate peaks.

---

# Chapter 7: Experiment 4 — LCR Circuits and Electromagnetic Resonance

## 7.1 Circuit Elements and Impedance

In AC circuits driven at angular frequency \(\omega\), each circuit element is characterized by its **impedance** — the complex ratio of voltage to current:

\[
Z_R = R, \qquad Z_C = \frac{1}{i\omega C} = \frac{-i}{\omega C}, \qquad Z_L = i\omega L.
\]

The real part of \(Z\) is the resistance (dissipative), and the imaginary part is the reactance (energy-storing). For a series \(LCR\) circuit, the impedances add:

\[
Z = R + i\left(\omega L - \frac{1}{\omega C}\right).
\]

The magnitude is \(|Z| = \sqrt{R^2 + (\omega L - 1/(\omega C))^2}\) and the current amplitude for a driving voltage \(V_0\cos(\omega t)\) is:

\[
I_0 = \frac{V_0}{|Z|} = \frac{V_0}{\sqrt{R^2 + (\omega L - 1/(\omega C))^2}}.
\]

## 7.2 Resonance in LCR Circuits

<div class="definition">
The <strong>resonant frequency</strong> of a series <em>LCR</em> circuit is the frequency at which the inductive and capacitive reactances cancel:
\[
\omega_0 L = \frac{1}{\omega_0 C} \implies \omega_0 = \frac{1}{\sqrt{LC}}, \qquad f_0 = \frac{1}{2\pi\sqrt{LC}}.
\]
At resonance, \(|Z| = R\) is minimized and the current is maximized.
</div>

The quality factor of the \(LCR\) resonance is:

\[
Q = \frac{\omega_0 L}{R} = \frac{1}{\omega_0 CR} = \frac{1}{R}\sqrt{\frac{L}{C}}.
\]

Near resonance, the current as a function of frequency traces a **Lorentzian** profile with full width at half-maximum \(\Delta\omega = \omega_0/Q\). High-\(Q\) circuits are used in radio tuners to select a single station's narrow frequency band while rejecting others.

## 7.3 Transient Response and Energy Storage

After a step change in voltage, the \(LCR\) circuit undergoes a **transient** governed by the second-order ODE:

\[
L\frac{d^2q}{dt^2} + R\frac{dq}{dt} + \frac{q}{C} = V(t),
\]

where \(q\) is the charge on the capacitor. For the underdamped case (\(R < 2\sqrt{L/C}\)), the natural response is a damped sinusoid:

\[
q(t) = q_0 e^{-\gamma t}\cos(\omega_d t + \phi),
\]

where \(\gamma = R/(2L)\) is the damping rate and \(\omega_d = \sqrt{\omega_0^2 - \gamma^2}\) is the damped oscillation frequency. By measuring the exponential decay of oscillations, \(R\) and \(L\) can be determined independently of the circuit's steady-state response.

---

# Chapter 8: Experiment 5 — Magnetic Field of a Coil

## 8.1 The Magnetic Field on the Axis of a Current Loop

The Biot-Savart law, integrated around a circular loop of radius \(R\) carrying current \(I\), gives the field at a point on the axis at distance \(x\) from the center:

\[
B(x) = \frac{\mu_0 I R^2}{2(R^2 + x^2)^{3/2}}.
\]

At the center (\(x = 0\)), this reduces to \(B = \mu_0 I/(2R)\). Far from the loop (\(x \gg R\)), the field falls off as a magnetic dipole: \(B \approx \mu_0 IR^2/(2x^3) = \mu_0 m/(2\pi x^3)\) where \(m = I\pi R^2\) is the dipole moment.

## 8.2 Helmholtz Coils

A **Helmholtz coil pair** consists of two identical coaxial coils, each of radius \(R\), separated by distance \(R\), carrying the same current in the same direction. At this particular separation, the second derivatives of \(B\) on axis cancel, producing a region of remarkably uniform magnetic field between the coils. The field at the midpoint is:

\[
B_{\mathrm{mid}} = \frac{8\mu_0 NI}{5^{3/2}R} \approx \frac{0.7155\mu_0 NI}{R},
\]

where \(N\) is the number of turns on each coil.

## 8.3 Experimental Strategy

By measuring the axial field profile \(B(x)\) with a calibrated Hall probe and comparing against the theoretical prediction, you can:

1. Determine whether the geometry matches the theoretical assumption (verify that the coil radius, turn count, and separation have been correctly measured)
2. Extract the current \(I\) (or verify it against the ammeter reading)
3. Assess the uniformity of the field in the central region and characterize how rapidly the field varies

Error analysis should include the calibration uncertainty of the Hall probe, position measurement uncertainty, and the effect of the Earth's background field (which must be subtracted as a systematic effect by rotating the probe or by measuring without current flowing).

---

# Chapter 9: Synthesis — Science as a Process

## 9.1 The Interplay of Theory and Experiment

In each of the five experiments of this course, you followed a common arc: you brought a theoretical prediction into contact with a physical measurement and assessed the degree of agreement. This interplay is the engine of scientific progress. When agreement is found, confidence in the theory increases. When disagreement persists after careful error analysis, the discrepancy demands explanation — sometimes revealing a new physical effect, sometimes exposing a flaw in the theoretical model.

## 9.2 Communicating Results

A result that cannot be communicated is a result that cannot be scrutinized, replicated, or built upon. Clear, quantitative reporting — stating the result, its uncertainty, the method by which it was obtained, and a frank assessment of dominant error sources — is as much a part of the scientific method as the measurement itself.

The conventions of scientific communication (standard deviation, error propagation, chi-squared testing, graphical presentation with error bars) are not arbitrary formalities but tools that allow scientists worldwide to rapidly assess the reliability of a reported result and to incorporate it appropriately into the accumulated body of knowledge.

## 9.3 Building Intuition from Experiments

One of the less-celebrated but most important outcomes of experimental physics training is the development of **physical intuition** — the ability to sense immediately when a calculated result is implausible. Spending hours working with actual circuits, strings, and magnets builds an appreciation for realistic magnitudes, for the sensitivity of instruments, and for the many ways that ideal theoretical descriptions are complicated by the material world. This intuition is an irreplaceable asset in any future scientific or engineering work.
