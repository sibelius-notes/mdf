---
title: "GENE 123: Electrical Circuits and Instrumentation"
prof: "Ayman El-Hag"
subjects: "GENE"
---

## Sources and References

- Nilsson, J. W., and Riedel, S. A. *Electric Circuits*. Pearson, 11th ed.
- Irwin, J. D., and Nelms, R. M. *Basic Engineering Circuit Analysis*. Wiley, 12th ed.
- Alexander, C. K., and Sadiku, M. N. O. *Fundamentals of Electric Circuits*. McGraw-Hill, 7th ed.
- Sedra, A. S., and Smith, K. C. *Microelectronic Circuits*. Oxford University Press, 8th ed. (op-amps and instrumentation).
- MIT OpenCourseWare 6.002 *Circuits and Electronics*, and 6.071 *Introduction to Electronics, Signals, and Measurement*.
- Stanford EE 101A/B *Circuits*.
- University of Cambridge Engineering Tripos Part IA, *Electrical and Information Engineering*.

# Chapter 1: Charge, Current, Voltage, Power, and the Lumped-Circuit Abstraction

Electrical engineering begins from a small set of physical quantities: electric charge \(q\) measured in coulombs, current \(i\) defined as the time rate of flow of positive charge through a cross section, and voltage \(v\) defined as the energy per unit charge required to move charge between two points. These are linked by

\[
i(t) = \frac{dq(t)}{dt}, \qquad v(t) = \frac{dw(t)}{dq},
\]

where \(w\) is energy in joules. The instantaneous power delivered to a two-terminal element is \(p(t) = v(t)\,i(t)\), and the energy absorbed over an interval is obtained by integration. The passive sign convention assigns \(v\) and \(i\) so that current enters the terminal marked positive; under this convention a positive value of \(p\) indicates the element absorbs energy, and a negative value indicates it delivers energy to the rest of the circuit.

The lumped-element idealization replaces distributed electromagnetic fields with discrete components connected by ideal wires of zero resistance. This is justified whenever the physical size of the circuit is small compared with the shortest wavelength of interest, so that propagation delays can be neglected. Under this idealization, every element is described by a terminal relation between its voltage and current, and every connection is described by topological rules that encode charge conservation and energy conservation.

Two such rules govern all of circuit analysis. Kirchhoff's current law states that the algebraic sum of currents leaving any node is zero, \(\sum_k i_k = 0\), expressing charge conservation at a node where no charge accumulates. Kirchhoff's voltage law states that the algebraic sum of voltages around any closed loop is zero, \(\sum_k v_k = 0\), expressing that the electrostatic potential is single-valued. Together with the element laws, KCL and KVL determine every branch voltage and current in a circuit uniquely, up to the choice of reference node.

The basic circuit elements include independent voltage sources, which impose a prescribed \(v(t)\) regardless of current; independent current sources, which impose a prescribed \(i(t)\) regardless of voltage; dependent sources, whose output depends linearly on another branch variable and which are the key idealization behind transistors and operational amplifiers; and the three linear passive elements—resistors, capacitors, and inductors—whose terminal laws are developed in later chapters.

# Chapter 2: Resistive Networks, Equivalent Resistance, and Dividers

A linear resistor obeys Ohm's law,

\[
v = R\,i,
\]

where \(R\) is resistance in ohms. The reciprocal \(G = 1/R\) is conductance in siemens. Power dissipated by a resistor is always nonnegative and may be written in three equivalent forms:

\[
p = v\,i = i^2 R = \frac{v^2}{R}.
\]

Because the terminal law is linear, networks built solely from resistors and independent sources are themselves linear: every response is a linear combination of the sources.

Series resistors share the same current and their voltages add, so \(R_\text{eq} = R_1 + R_2 + \cdots + R_N\). Parallel resistors share the same voltage and their currents add, giving \(G_\text{eq} = G_1 + G_2 + \cdots + G_N\), or equivalently

\[
\frac{1}{R_\text{eq}} = \frac{1}{R_1} + \frac{1}{R_2} + \cdots + \frac{1}{R_N}.
\]

For two resistors in parallel the compact form \(R_1 \parallel R_2 = R_1 R_2/(R_1+R_2)\) is useful in hand analysis. Large networks may be reduced by alternately collapsing series and parallel groupings until a single equivalent resistance remains.

The voltage divider expresses the voltage across one of several series resistors fed by a voltage source \(v_s\):

\[
v_k = v_s \cdot \frac{R_k}{R_1 + R_2 + \cdots + R_N}.
\]

The current divider expresses the current through one of several parallel resistors fed by a current source \(i_s\):

\[
i_k = i_s \cdot \frac{G_k}{G_1 + G_2 + \cdots + G_N} = i_s \cdot \frac{R_\text{eq}}{R_k}.
\]

Loading effects must be kept in mind: a divider intended to supply a signal to another stage is only accurate when the input resistance of that next stage is much larger than the divider's Thévenin resistance, a principle that motivates the use of buffer amplifiers in instrumentation.

# Chapter 3: Nodal and Mesh Analysis

For circuits too large to reduce by inspection, systematic analysis relies on either a node-voltage formulation or a mesh-current formulation. In nodal analysis, one node is designated the reference (ground), and the remaining \(N-1\) node voltages \(v_1,\ldots,v_{N-1}\) serve as unknowns. Writing KCL at each nonreference node and expressing branch currents through resistors by Ohm's law yields a system

\[
\mathbf{G}\,\mathbf{v} = \mathbf{i}_s,
\]

where \(\mathbf{G}\) is the symmetric conductance matrix, with diagonal entries equal to the sum of conductances incident at each node and off-diagonal entries equal to the negative of the conductance between two nodes. The source vector \(\mathbf{i}_s\) collects the net current injected by independent sources at each node. Voltage sources require either a supernode treatment, in which KCL is written around a surface that encloses both terminals, or the modified nodal analysis approach, in which the current through each voltage source is added as an auxiliary unknown.

In mesh analysis, which applies to planar circuits, a mesh current is assigned to each independent loop and KVL is written around each mesh. Branch currents are recovered as algebraic sums of mesh currents, and Ohm's law expresses each resistor voltage. The resulting system

\[
\mathbf{R}\,\mathbf{i}_m = \mathbf{v}_s
\]

features a symmetric resistance matrix with diagonal entries equal to the total resistance around each mesh and off-diagonal entries equal to the negative of the shared resistance between two meshes. Current sources demand a supermesh treatment analogous to the supernode.

Both formulations are consequences of the same physics and yield identical answers; the choice between them is a matter of bookkeeping. A good heuristic is to count nodes versus meshes and pick the smaller system, while also noting that nodal analysis meshes naturally with computer implementations used in simulation tools such as SPICE.

# Chapter 4: Linearity, Superposition, and Source Transformation

Linearity of resistive networks has two consequences that underpin the remaining analysis techniques. The homogeneity property states that scaling every independent source by a factor \(\alpha\) scales every branch voltage and current by \(\alpha\). The additivity property states that the response to a sum of sources equals the sum of responses to each source considered individually. Combined, these yield the superposition theorem: in any linear circuit driven by multiple independent sources, the voltage across or current through any element equals the algebraic sum of the contributions from each source acting alone, with all other independent sources deactivated. Deactivation means replacing voltage sources by short circuits and current sources by open circuits; dependent sources are left in place because they are not independent excitations.

Superposition turns a problem with several sources into several problems with one source each, which is often simpler and also isolates how each source affects each response. The cost is that power, being a quadratic function of voltage and current, does not superpose; it must be computed from the total voltages and currents.

Source transformation converts a practical voltage source—an ideal voltage source \(v_s\) in series with a resistance \(R\)—into an equivalent practical current source \(i_s = v_s/R\) in parallel with the same \(R\), and vice versa. Terminal behavior is preserved, so any network external to the pair sees the same voltage and current. Repeated source transformations often collapse a tangle of sources and resistors into a single equivalent pair, simplifying subsequent analysis and setting the stage for Thévenin and Norton equivalents.

# Chapter 5: Thévenin, Norton, and Maximum Power Transfer

Any linear two-terminal network containing sources and resistors can be represented, as seen from a pair of terminals, by an equivalent of just two elements. The Thévenin equivalent consists of a voltage source \(v_\text{Th}\) in series with a resistance \(R_\text{Th}\); the Norton equivalent consists of a current source \(i_\text{N}\) in parallel with the same \(R_\text{Th}\). The two forms are related by \(v_\text{Th} = R_\text{Th}\,i_\text{N}\).

The Thévenin voltage is found as the open-circuit voltage between the terminals, and the Norton current is found as the short-circuit current. The Thévenin resistance is found in any of three ways: (i) from \(R_\text{Th} = v_\text{oc}/i_\text{sc}\); (ii) if no dependent sources are present, by deactivating all independent sources and computing the equivalent resistance between the terminals; or (iii) in the presence of dependent sources, by deactivating independent sources, applying a test source \(v_t\) at the terminals, measuring the response current \(i_t\), and taking \(R_\text{Th} = v_t/i_t\).

Thévenin equivalents allow a load to be analyzed without re-solving the entire circuit each time the load changes. They also lead directly to the maximum power transfer theorem: for a fixed Thévenin equivalent \((v_\text{Th}, R_\text{Th})\) and a variable resistive load \(R_L\), the power delivered to the load

\[
p_L(R_L) = \left(\frac{v_\text{Th}}{R_\text{Th} + R_L}\right)^2 R_L
\]

is maximized when \(R_L = R_\text{Th}\), and the corresponding maximum power is \(p_{L,\max} = v_\text{Th}^2/(4 R_\text{Th})\). In communication systems, matching the load to the source in this way maximizes signal transfer; in power systems, however, efficiency usually trumps absolute transferred power, and loads are deliberately not matched to source impedance.

# Chapter 6: The Operational Amplifier and Instrumentation Circuits

The operational amplifier is a high-gain differential voltage amplifier that, together with feedback, forms the backbone of analog signal conditioning. The idealized model assumes infinite open-loop gain, infinite input resistance, zero output resistance, and zero output voltage when the inputs are equal. When the amplifier is embedded in a negative-feedback loop and operated in its linear region, two virtual-short conditions follow from the ideal model: the voltages at the inverting and noninverting inputs are equal, \(v^- = v^+\), and the currents flowing into both input terminals are zero, \(i^- = i^+ = 0\). These two rules, together with KCL and KVL, are sufficient to analyze almost every op-amp circuit encountered in a first course.

The inverting amplifier, with input resistor \(R_1\) from source to the inverting node and feedback resistor \(R_f\) from output to the inverting node while the noninverting node is grounded, obeys

\[
\frac{v_o}{v_i} = -\frac{R_f}{R_1}.
\]

The noninverting amplifier, with the input applied to the noninverting terminal and the inverting terminal tied through a divider \(R_1\), \(R_f\) to ground and output, obeys

\[
\frac{v_o}{v_i} = 1 + \frac{R_f}{R_1}.
\]

A unity-gain buffer is the limiting case \(R_f = 0\), \(R_1 = \infty\), providing unity voltage gain and extremely high input impedance; it isolates a high-impedance signal source from a heavy load and prevents divider loading errors. The summing amplifier adds weighted copies of several inputs, the difference amplifier subtracts two signals with user-set gain, and the integrator and differentiator respectively produce outputs proportional to the time integral and derivative of their inputs by replacing one resistor with a capacitor.

Practical instrumentation often demands a difference amplifier with very high input impedance at both inputs and accurately matched gains. This is supplied by the three-op-amp instrumentation amplifier, which places a pair of buffer amplifiers ahead of a standard difference amplifier and uses a single gain-setting resistor to trade off gain against bandwidth. Such circuits are used to amplify small differential signals from bridge transducers such as strain gauges and thermocouples while rejecting common-mode interference.

# Chapter 7: Capacitors, Inductors, and Energy Storage

The resistor dissipates energy but stores none. The capacitor and inductor are the dual energy-storage elements of linear circuit theory. A capacitor of capacitance \(C\) farads stores energy in its electric field and obeys

\[
i(t) = C\,\frac{dv(t)}{dt}, \qquad w_C(t) = \tfrac{1}{2} C\,v(t)^2.
\]

Its voltage cannot change instantaneously without an infinite current, so in a physical circuit \(v_C(t)\) is continuous across a switching event. An inductor of inductance \(L\) henries stores energy in its magnetic field and obeys

\[
v(t) = L\,\frac{di(t)}{dt}, \qquad w_L(t) = \tfrac{1}{2} L\,i(t)^2.
\]

Its current cannot change instantaneously without an infinite voltage, so \(i_L(t)\) is continuous across a switching event. Together these two continuity constraints provide the initial conditions for transient analysis.

Series and parallel combinations follow dual rules: capacitances add in parallel and combine reciprocally in series, while inductances add in series and combine reciprocally in parallel. At DC steady state, where all derivatives are zero, a capacitor looks like an open circuit and an inductor looks like a short circuit; this provides a quick way to find initial and final states of switching problems before solving the differential equation that governs the transient.

# Chapter 8: First-Order Transient Response

A circuit containing exactly one independent energy-storage element and any number of resistors and sources gives rise to a first-order linear differential equation with constant coefficients. Writing the equation for a generic response \(x(t)\)—either a capacitor voltage or an inductor current—yields

\[
\tau\,\frac{dx(t)}{dt} + x(t) = x_\infty,
\]

where \(\tau\) is the time constant and \(x_\infty\) is the final steady-state value. For an RC circuit driven by a Thévenin equivalent \((v_\text{Th}, R_\text{Th})\) across the capacitor, \(\tau = R_\text{Th}\,C\). For an RL circuit driven by a Norton equivalent \((i_\text{N}, R_\text{N})\) in parallel with the inductor, \(\tau = L/R_\text{N}\). The resistance that enters the time constant is always the Thévenin resistance seen from the storage element with the independent sources deactivated.

The general solution takes the compact form

\[
x(t) = x_\infty + (x_0 - x_\infty)\,e^{-(t-t_0)/\tau}, \qquad t \geq t_0,
\]

where \(x_0\) is the value of \(x\) just after the switching event at \(t_0\), obtained from continuity of capacitor voltage or inductor current. Physically, \(\tau\) is the characteristic time over which the circuit forgets its initial condition and approaches its forced value: after one time constant the response has closed roughly 63% of the gap, and after five time constants the remaining deviation is under 1%. Natural and forced components may also be discussed separately—the natural response being the solution of the homogeneous equation that decays from the initial mismatch, and the forced response being a particular solution driven by the source—but the single exponential formula above is usually the most efficient tool.

# Chapter 9: Sinusoidal Steady State and Phasors

When a linear circuit is driven by a sinusoidal source \(v_s(t) = V_m \cos(\omega t + \phi)\), the long-term response in every branch is itself sinusoidal at the same angular frequency \(\omega\), differing from the source only in amplitude and phase. The efficient way to compute these amplitudes and phases is the phasor method, which exploits the identity

\[
V_m\cos(\omega t + \phi) = \Re\!\left[V_m\,e^{j\phi}\,e^{j\omega t}\right].
\]

Dropping the common factor \(e^{j\omega t}\) defines the phasor \(\mathbf{V} = V_m\,e^{j\phi}\), a complex number that encodes both amplitude and phase. Because differentiation in time becomes multiplication by \(j\omega\) in the phasor domain, the element laws of \(R\), \(L\), and \(C\) reduce to algebraic relations \(\mathbf{V} = Z\,\mathbf{I}\), where the complex impedance \(Z\) is

\[
Z_R = R, \qquad Z_L = j\omega L, \qquad Z_C = \frac{1}{j\omega C}.
\]

The impedance generalizes resistance to sinusoidal steady state; its real part is the resistance proper and its imaginary part, the reactance, accounts for energy storage. Admittance \(Y = 1/Z\) plays the role of conductance. Kirchhoff's laws apply unchanged to phasors, so every technique developed for resistive networks—series and parallel reduction, voltage and current dividers, nodal and mesh analysis, superposition, Thévenin and Norton equivalents, source transformation—carries over to sinusoidal steady-state analysis with \(R\) replaced by \(Z\). After the phasors \(\mathbf{V}\) and \(\mathbf{I}\) are found, the physical time-domain signals are recovered by \(v(t) = \Re\left[\mathbf{V}\,e^{j\omega t}\right]\).

# Chapter 10: AC Power and Complex Power

For sinusoidal voltages and currents the instantaneous power \(p(t) = v(t)\,i(t)\) oscillates at twice the source frequency and is not a convenient figure of merit. Two averaged quantities replace it. The root-mean-square value \(V_\text{rms} = V_m/\sqrt{2}\), and likewise for current, is defined so that a DC voltage of magnitude \(V_\text{rms}\) delivers the same average power to a resistor as the AC waveform. The average power absorbed by a general passive element is

\[
P = V_\text{rms}\,I_\text{rms}\,\cos\theta,
\]

where \(\theta\) is the phase angle by which the voltage leads the current, i.e., the angle of the element's impedance. The factor \(\cos\theta\) is the power factor, lying between zero (pure reactive load) and one (pure resistive load).

Complex power bundles together the real and reactive parts of the energy flow into a single complex quantity

\[
\mathbf{S} = \mathbf{V}_\text{rms}\,\mathbf{I}_\text{rms}^{\ast} = P + j Q,
\]

where \(P\) is the average (real) power measured in watts, \(Q\) is the reactive power measured in volt-amperes reactive, and \(|\mathbf{S}|\) is the apparent power in volt-amperes. A positive \(Q\) corresponds to an inductive load that absorbs reactive power, and a negative \(Q\) corresponds to a capacitive load that delivers it. In power-system practice, loads with low power factor draw larger currents than necessary for a given real-power delivery, wasting transmission capacity; power-factor correction by parallel capacitors is a routine application of the theory.

# Chapter 11: Sensors, Transducers, and Data Acquisition

Instrumentation systems convert physical quantities into voltages and currents that a circuit can process. A transducer is a device that exchanges energy between domains: temperature, strain, pressure, displacement, light, or chemical concentration are converted into an electrical signal, which is then conditioned, digitized, and interpreted. Common resistive transducers include thermistors, whose resistance varies with temperature; strain gauges, whose resistance changes with mechanical elongation; and photoresistors, whose resistance depends on illumination. Capacitive and inductive transducers turn displacement into a change of reactance, while thermocouples and piezoelectric elements directly generate a small voltage from temperature differences and mechanical strain.

The Wheatstone bridge is the standard interface for small resistance changes. Four resistors in a diamond arrangement are driven by a DC excitation across one diagonal and the output voltage is measured across the other. When the bridge is balanced, the output is zero; a small fractional change \(\Delta R/R\) in one arm produces an output voltage approximately proportional to \(\Delta R/R\) and to the excitation, providing high sensitivity to small changes on top of a large baseline resistance. Bridge outputs are typically in the millivolt range and are handed off to an instrumentation amplifier for further processing.

Three metrological terms recur in instrumentation practice and should not be confused. Resolution is the smallest change in the measured quantity that the system can discern, set largely by the converter's quantization step and the noise floor of the analog front end. Precision is the degree to which repeated measurements of the same quantity cluster together, characterized by a standard deviation. Accuracy is the degree to which measurements agree with the true value, characterized by the total error including both random fluctuations and systematic bias. A system can be precise without being accurate if a calibration error biases every reading by the same amount, and it can be accurate only in an average sense if it is imprecise.

Data acquisition systems combine the sensor, the amplifier, an anti-aliasing low-pass filter, a sample-and-hold circuit, an analog-to-digital converter, and a digital interface. The filter bounds the signal's spectrum below half the sampling rate in accordance with the Nyquist criterion; the sample-and-hold freezes the input during the conversion interval; and the analog-to-digital converter produces a binary word whose number of bits sets the fundamental resolution. The full-scale range, the number of bits, the linearity of the converter, and the noise of the analog chain together determine whether the system meets the application's specifications, closing the loop back to the circuit-analysis tools developed in the earlier chapters.
