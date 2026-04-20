---
title: "SYDE 292: Circuits, Instrumentation, and Measurements"
subjects: "SYDE"
---

## Sources and References

- Hambley, <em>Electrical Engineering: Principles and Applications</em> (Pearson)
- Nilsson and Riedel, <em>Electric Circuits</em> (Pearson)
- Sedra and Smith, <em>Microelectronic Circuits</em> (Oxford)
- Doebelin, <em>Measurement Systems: Application and Design</em> (McGraw-Hill)
- Online: All About Circuits, EEVblog lectures

---

# Chapter 1: Circuit Analysis Fundamentals

## 1.1 Circuit Elements

Resistors, capacitors, and inductors are defined by their voltage-current relations:

\[
v = i R, \qquad i = C\,\frac{dv}{dt}, \qquad v = L\,\frac{di}{dt}.
\]

Energy stored in a capacitor is \( \tfrac{1}{2} C v^{2} \); in an inductor, \( \tfrac{1}{2} L i^{2} \). Ideal sources supply prescribed voltage or current regardless of the load; practical sources have finite internal impedance.

## 1.2 Kirchhoff's Laws

Conservation of charge and energy give

\[
\sum_{\text{node}} i = 0, \qquad \sum_{\text{loop}} v = 0.
\]

Systematic methods — nodal analysis (KCL at each node) and mesh analysis (KVL around each independent loop) — reduce a circuit to a linear system \( \mathbf{A}\mathbf{x} = \mathbf{b} \) that yields all voltages and currents.

## 1.3 Superposition and Thevenin-Norton

Linearity allows superposition: the response to multiple sources is the sum of responses to each source alone. Any linear two-terminal network reduces to a Thevenin equivalent — a voltage source \( V_{th} \) in series with resistance \( R_{th} \) — or a Norton equivalent current source \( I_n = V_{th}/R_{th} \) in parallel with \( R_{th} \). These equivalents simplify iterative design and worst-case analysis.

<div class="example">
A battery with internal resistance 0.05 Ω supplies a load \( R_L \). Maximum power transfer occurs when \( R_L = R_{th} \); for a 12 V battery this peaks at 720 W, but efficiency at that point is only 50%.
</div>

# Chapter 2: Transient Response

## 2.1 First-Order Circuits

An RC circuit charging from rest obeys

\[
v(t) = V_s\!\left(1 - e^{-t/\tau}\right), \qquad \tau = R C.
\]

An RL circuit has \( \tau = L/R \). Step responses reach 63.2% in one time constant and effectively steady state after five. These first-order responses underlie sensor conditioning, switch debouncing, and low-pass filtering.

## 2.2 Second-Order Circuits

RLC circuits obey

\[
L \frac{d^{2}i}{dt^{2}} + R\frac{di}{dt} + \frac{i}{C} = f(t).
\]

The damping ratio \( \zeta = R\sqrt{C/L}/2 \) and natural frequency \( \omega_n = 1/\sqrt{LC} \) classify response as overdamped (\( \zeta > 1 \)), critically damped (\( \zeta = 1 \)), or underdamped (\( \zeta < 1 \)). Underdamped circuits ring before settling.

# Chapter 3: Sinusoidal Steady State

## 3.1 Phasors and Impedance

For sinusoidal excitation \( v(t) = V_m\cos(\omega t + \phi) \), phasor representation \( \tilde{V} = V_m e^{j\phi} \) reduces differential to algebraic equations. Impedances are

\[
Z_R = R, \qquad Z_C = \frac{1}{j\omega C}, \qquad Z_L = j\omega L.
\]

KCL, KVL, and Thevenin-Norton techniques extend directly to phasor analysis.

## 3.2 Power

Average real power delivered to an impedance is

\[
P = V_{rms} I_{rms}\cos\theta,
\]

with \( \theta \) the phase difference. The complex power \( S = P + jQ \) has apparent magnitude \( |S| = V_{rms} I_{rms} \); the ratio \( P/|S| = \cos\theta \) is the power factor. Power factor correction adds reactive components to bring \( \cos\theta \) near unity, reducing line losses.

## 3.3 Transfer Functions and Frequency Response

A linear time-invariant system's transfer function \( H(j\omega) = V_{out}/V_{in} \) describes magnitude and phase response across frequency. Bode plots present \( 20\log_{10}|H| \) and \( \angle H \) against log frequency, revealing poles, zeros, bandwidth, and roll-off.

<div class="remark">
The decibel scale makes multiplicative magnitude changes appear additive on a plot. A 20 dB/decade slope corresponds to a single-pole response; 40 dB/decade, two poles.
</div>

# Chapter 4: Operational Amplifiers

## 4.1 Ideal Op-Amp Model

An ideal op-amp has infinite input impedance, zero output impedance, and infinite open-loop gain. With negative feedback, the two input voltages are driven to equality (virtual short), and input currents are zero. These golden rules analyse most op-amp circuits by inspection.

## 4.2 Basic Topologies

The inverting amplifier (input through \( R_1 \), feedback \( R_f \)) has gain \( -R_f/R_1 \); the non-inverting amplifier has gain \( 1 + R_f/R_1 \). Buffer (unity-gain follower) provides impedance isolation. Summer and difference amplifiers combine signals. Integrator (feedback capacitor) and differentiator (input capacitor) implement analog calculus and are the building blocks of active filters and PID controllers.

## 4.3 Diode Circuits

Op-amp circuits with diodes in feedback implement precision rectifiers, logarithmic amplifiers, and peak detectors that cannot be built with diodes alone because the diode turn-on voltage introduces error. The feedback loop effectively divides the diode drop by the loop gain, restoring precision.

# Chapter 5: Feedback, Filters, and Oscillators

## 5.1 Positive and Negative Feedback

Negative feedback trades gain for bandwidth, linearity, and stability. Closed-loop gain is \( A/(1 + A\beta) \); for large \( A\beta \), this simplifies to \( 1/\beta \), desensitising gain from the active device. Positive feedback regenerates signals — used in oscillators and comparators (Schmitt triggers) — and must be controlled to avoid unwanted oscillation in amplifiers.

## 5.2 Active Filters

Active filters — Sallen-Key, multiple feedback — implement low-pass, high-pass, band-pass, and band-stop responses with precise corner frequencies and Q factors without large inductors. Butterworth (maximally flat magnitude), Chebyshev (flat phase or steeper roll-off), Bessel (flat group delay), and elliptic types offer distinct trade-offs. Higher-order filters cascade second-order sections to achieve sharper transitions.

## 5.3 Oscillators

Wien-bridge, phase-shift, and LC oscillators satisfy the Barkhausen criterion \( |A\beta| = 1 \) with zero phase around the loop. Amplitude stabilisation (diode or thermistor-based) is essential to avoid clipping. Crystal oscillators achieve part-per-million frequency stability using high-\( Q \) quartz resonators.

# Chapter 6: Instrumentation and Signal Conditioning

## 6.1 Sensors and Transducers

Transducers convert physical quantities into electrical signals. Temperature: thermocouples (Seebeck voltage), RTDs (resistance vs temperature), thermistors (exponential). Strain: foil gauges in Wheatstone bridges. Pressure: piezoresistive, capacitive, piezoelectric. Displacement: LVDT, capacitive, optical. Each transducer has a sensitivity, range, linearity, and noise floor that dictate conditioning needs.

## 6.2 Instrumentation Amplifiers

A three-op-amp instrumentation amplifier provides high CMRR, high input impedance, and adjustable gain for differential small-signal measurements. Common applications include thermocouple amplification, bridge conditioning, and biopotential (ECG, EEG) front ends. Shielding, guarding, and careful grounding extend practical CMRR well beyond op-amp spec sheets.

## 6.3 Active Filters for Conditioning

Anti-alias filters precede ADCs to limit bandwidth below Nyquist. Notch filters remove interference (60 Hz power-line hum). Reconstruction filters smooth ADC output. Order and corner frequencies are chosen to reject noise while preserving signal fidelity.

## 6.4 A/D and D/A Conversion

Analog-to-digital converters sample at rate \( f_s \) and quantise to \( N \) bits, with quantisation SNR \( \approx 6.02 N + 1.76 \) dB. Flash, SAR, sigma-delta, and pipeline architectures span the trade-off between speed, resolution, and power. Digital-to-analog conversion uses resistor ladders or delta-sigma techniques. Digital filtering, oversampling, and calibration compensate imperfections in the analog chain.

<div class="example">
A 16-bit SAR ADC sampling at 1 MS/s converts a bridge output conditioned by a 10-kHz Bessel anti-alias filter; the resulting signal chain captures strain signals with 0.01% resolution while rejecting high-frequency noise.
</div>

## 6.5 Measurement Uncertainty

Every measurement has uncertainty from sensor calibration, signal-chain noise, quantisation, and environmental drift. Propagation-of-uncertainty formulas combine component tolerances into system-level error budgets. GUM (Guide to the Expression of Uncertainty in Measurement) provides a standardised framework that separates random (Type A) and systematic (Type B) contributions.

<div class="theorem">
A successful instrumentation design begins with understanding the measurand and its environment, selects transducers whose physics fit, conditions signals with amplifiers and filters matched to the signal band, converts to digital with adequate resolution, and tracks uncertainty at each stage so that the final measurement is trustworthy, reproducible, and documented.
</div>

Mastery of circuit analysis, op-amp design, filtering, and conversion equips systems engineers to specify, build, and debug the instrumentation that translates physical phenomena into usable digital data across every application from biomedical to industrial automation.
