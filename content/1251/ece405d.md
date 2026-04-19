---
title: "ECE 405D: Superconducting Quantum Circuits"
prof: "Guo-Xing Miao"
subjects: "ECE"
---

*These notes cover the standard ECE 405D syllabus: superconductivity fundamentals, Josephson junction physics, superconducting qubit archetypes, circuit QED, qubit operations, decoherence, and modern quantum computing architectures — developed as a self-contained derivation-focused text from publicly available references.*

---

## Sources and References

1. **A. Blais, A. L. Grimsmo, S. M. Girvin, and A. Wallraff**, "Circuit quantum electrodynamics," *Reviews of Modern Physics* **93**, 025005 (2021). [arXiv:2005.12667]

2. **P. Krantz, M. Kjaergaard, F. Yan, T. P. Orlando, S. Gustavsson, and W. D. Oliver**, "A quantum engineer's guide to superconducting qubits," *Applied Physics Reviews* **6**, 021318 (2019). [arXiv:1904.06560]

3. **J. Koch, T. M. Yu, J. Gambetta, A. A. Houck, D. I. Schuster, J. Majer, A. Blais, M. H. Devoret, S. M. Girvin, and R. J. Schoelkopf**, "Charge-insensitive qubit design derived from the Cooper pair box," *Physical Review A* **76**, 042319 (2007). [arXiv:cond-mat/0703002]

4. **M. H. Devoret and R. J. Schoelkopf**, "Superconducting circuits for quantum information: An outlook," *Science* **339**, 1169–1174 (2013). [arXiv:1602.00851 and related review]

5. **D. D. Stancil and G. T. Byrd**, *Principles of Superconducting Quantum Computers* (Wiley, 2022). [Required textbook for ECE 405D]

6. **J. Bardeen, L. N. Cooper, and J. R. Schrieffer**, "Theory of Superconductivity," *Physical Review* **108**, 1175 (1957).

7. **F. London and H. London**, "The electromagnetic equations of the supraconductor," *Proceedings of the Royal Society A* **149**, 71–88 (1935).

8. **B. D. Josephson**, "Possible new effects in superconductive tunnelling," *Physics Letters* **1**, 251–253 (1962).

9. **F. Arute et al. (Google AI Quantum)**, "Quantum supremacy using a programmable superconducting processor," *Nature* **574**, 505–510 (2019).

10. **C. Macklin, K. O'Brien, D. Hover, M. E. Schwartz, V. Bolkhovsky, X. Zhang, W. D. Oliver, and I. Siddiqi**, "A near-quantum-limited Josephson traveling-wave parametric amplifier," *Science* **350**, 307–310 (2015).

---

# Chapter 1: Fundamentals of Superconductivity

## 1.1 The Phenomenology of the Superconducting State

A superconductor is a material that, when cooled below a critical temperature \(T_c\), exhibits two macroscopic phenomena simultaneously: perfect conductivity and perfect diamagnetism. The first property — vanishing DC electrical resistance — was discovered by Heike Kamerlingh Onnes in 1911 for mercury at \(T_c \approx 4.2\,\mathrm{K}\). The second property — complete expulsion of magnetic flux from the bulk — was found by Walther Meissner and Robert Ochsenfeld in 1933 and cannot be explained by perfect conductivity alone.

<div class="definition">
<strong>Meissner Effect.</strong> When a material in the normal state is cooled through \(T_c\) in the presence of an applied magnetic field \(\mathbf{B}_\mathrm{app}\), the bulk field inside the sample drops to zero:

\[
\mathbf{B}_\mathrm{inside} = 0, \qquad T < T_c.
\]

This expulsion holds provided \(B_\mathrm{app} < B_c(T)\), the thermodynamic critical field. Flux is actively expelled, not merely prevented from entering, distinguishing superconductivity from an ideal conductor.
</div>

The thermodynamic critical field \(B_c(T)\) follows empirically as

\[
B_c(T) \approx B_c(0)\left[1 - \left(\frac{T}{T_c}\right)^2\right],
\]

and the free-energy difference between normal and superconducting states is

\[
G_n(T) - G_s(T) = \frac{B_c^2(T)}{2\mu_0},
\]

which quantifies the condensation energy gained by entering the superconducting state.

## 1.2 The London Equations

Fritz and Heinz London (1935) proposed two phenomenological equations that capture both zero resistance and the Meissner effect.

<div class="theorem">
<strong>London Equations.</strong> Let \(\mathbf{J}_s\) be the supercurrent density and \(n_s\) the number density of superconducting carriers each with charge \(q = -2e\) and mass \(m^* = 2m_e\). The London equations are

\[
\frac{\partial \mathbf{J}_s}{\partial t} = \frac{n_s q^2}{m^*}\,\mathbf{E}
\qquad \text{(First London equation)}
\]

\[
\nabla \times \mathbf{J}_s = -\frac{n_s q^2}{m^*}\,\mathbf{B}
\qquad \text{(Second London equation)}
\]
</div>

The first equation says the supercurrent accelerates freely — no resistive damping. The second is the key to the Meissner effect. Combining it with the magnetostatic Ampère law \(\nabla \times \mathbf{B} = \mu_0 \mathbf{J}_s\) and using \(\nabla \times (\nabla \times \mathbf{B}) = -\nabla^2 \mathbf{B}\), one obtains

\[
\nabla^2 \mathbf{B} = \frac{1}{\lambda_L^2}\,\mathbf{B},
\]

where the <em>London penetration depth</em> is

\[
\lambda_L = \sqrt{\frac{m^*}{\mu_0 n_s q^2}}.
\]

The solution for a planar boundary with vacuum at \(x < 0\) and superconductor at \(x > 0\) is \(\mathbf{B}(x) = \mathbf{B}_0\,e^{-x/\lambda_L}\). Magnetic fields do not abruptly vanish at the surface; they decay exponentially over the London penetration depth \(\lambda_L\). For elemental superconductors \(\lambda_L \sim 20\text{–}500\,\mathrm{nm}\), so macroscopic samples appear field-free in their bulk.

## 1.3 BCS Theory: Cooper Pairs and the Energy Gap

The microscopic theory of superconductivity was developed by Bardeen, Cooper, and Schrieffer (BCS, 1957). Its central insight is that the phonon-mediated interaction between electrons near the Fermi surface can be effectively attractive. Even an arbitrarily weak attractive interaction causes the Fermi sea to be unstable against the formation of bound pairs.

### 1.3.1 Cooper Pairs

Leon Cooper (1956) showed that two electrons added to a filled Fermi sea, interacting via an attractive potential \(-V\) (constant within a Debye shell of thickness \(\hbar\omega_D\) around the Fermi surface, zero otherwise), form a bound state with binding energy

\[
E_b \approx 2\hbar\omega_D\,e^{-2/N(0)V},
\]

where \(N(0)\) is the single-spin density of states at the Fermi level. This bound state — the <em>Cooper pair</em> — has zero total momentum, total spin \(S = 0\) (singlet), and is spread spatially over a length called the coherence length \(\xi_0\).

<div class="definition">
<strong>BCS coherence length.</strong>

\[
\xi_0 = \frac{\hbar v_F}{\pi \Delta},
\]

where \(v_F\) is the Fermi velocity and \(\Delta\) is the BCS gap parameter. For aluminium, \(\xi_0 \approx 1.6\,\mu\mathrm{m}\); for niobium, \(\xi_0 \approx 38\,\mathrm{nm}\).
</div>

### 1.3.2 The BCS Ground State and Energy Gap

In the BCS ground state, all electrons near the Fermi surface are paired. The macroscopic wave function of the condensate is described by a single complex order parameter

\[
\Psi(\mathbf{r}) = |\Psi(\mathbf{r})|\,e^{i\phi(\mathbf{r})},
\]

where \(|\Psi|^2 = n_s/2\) is the Cooper-pair density and \(\phi\) is the macroscopic phase. The BCS gap equation at temperature \(T\) is

\[
\Delta(T) = V \sum_{\mathbf{k}} \frac{\Delta(T)}{2E_{\mathbf{k}}} \tanh\!\left(\frac{E_{\mathbf{k}}}{2k_B T}\right), \qquad E_{\mathbf{k}} = \sqrt{\xi_{\mathbf{k}}^2 + \Delta^2},
\]

where \(\xi_{\mathbf{k}} = \varepsilon_{\mathbf{k}} - E_F\) is the single-particle energy measured from the Fermi level. Solving self-consistently yields \(\Delta(0) \approx 1.764\,k_B T_c\) and predicts that \(\Delta(T) \to 0\) as \(T \to T_c\) via

\[
\Delta(T) \approx 3.06\,k_B T_c \sqrt{1 - T/T_c}, \qquad T \lesssim T_c.
\]

The energy gap \(\Delta\) opens symmetrically about the Fermi level in the quasiparticle density of states:

\[
N_s(E) = N(0)\,\frac{|E|}{\sqrt{E^2 - \Delta^2}}\,\Theta(|E| - \Delta).
\]

Quasiparticle excitations (Bogoliubons) have energies \(E_\mathbf{k} \geq \Delta\), so thermal excitations are exponentially suppressed at \(k_B T \ll \Delta\). This is the regime relevant to superconducting quantum circuits, which operate at \(T \sim 10\text{–}20\,\mathrm{mK}\) with \(\Delta/k_B \sim 1\text{–}10\,\mathrm{K}\).

## 1.4 Type I and Type II Superconductors

The ratio of the two characteristic lengths, \(\kappa = \lambda_L / \xi\), is known as the Ginzburg-Landau (GL) parameter.

<div class="definition">
<strong>Type I vs. Type II.</strong> Superconductors with \(\kappa < 1/\sqrt{2}\) are Type I: they exhibit a single critical field \(B_c\) above which superconductivity is abruptly destroyed. Superconductors with \(\kappa > 1/\sqrt{2}\) are Type II: between a lower critical field \(B_{c1}\) and an upper critical field \(B_{c2}\), they admit a mixed state (Abrikosov vortex lattice) in which quantised flux tubes penetrate the bulk.
</div>

Each Abrikosov vortex carries exactly one flux quantum:

\[
\Phi_0 = \frac{h}{2e} = 2.0678 \times 10^{-15}\,\mathrm{Wb}.
\]

The factor \(2e\) in the denominator — rather than \(e\) — is direct macroscopic evidence of pairing. This quantisation of magnetic flux is not a BCS-specific result but follows from the existence of the macroscopic phase \(\phi\) and the requirement that the order parameter be single-valued.

Most materials relevant to quantum circuits are Type II. Aluminium (\(T_c = 1.2\,\mathrm{K}\), \(\kappa \approx 0.01\)) is technically Type I in bulk but behaves as Type II in thin films. Niobium (\(T_c = 9.3\,\mathrm{K}\), \(\kappa \approx 1.5\)) and niobium nitride (\(T_c \approx 16\,\mathrm{K}\)) are Type II.

## 1.5 Microwave Propagation in Superconductors: The Two-Fluid Model

At microwave frequencies \(\omega\), even below \(T_c\) a superconductor is not entirely lossless. The two-fluid model treats the total electron density as a sum of a superfluid component \(n_s\) and a normal component \(n_n = n - n_s\):

\[
\sigma(\omega) = \sigma_1(\omega) - i\sigma_2(\omega),
\]

where \(\sigma_1\) arises from normal-fluid Drude conduction and \(\sigma_2 = n_s e^2 / (m^* \omega)\) from the inertial superfluid. At low temperatures and microwave frequencies \(\hbar\omega \ll 2\Delta\), the imaginary part dominates and the kinetic inductance per unit length of a superconducting wire dominates:

\[
L_k = \frac{m^*}{n_s (2e)^2 A} = \frac{\mu_0 \lambda_L^2}{A},
\]

where \(A\) is the cross-sectional area. This kinetic inductance is central to superconducting microwave resonators and qubits.

---

# Chapter 2: Josephson Junctions

## 2.1 The Josephson Effects

A Josephson junction is formed by placing a weak link between two superconductors. The weak link can be a thin insulating barrier (S-I-S tunnel junction), a normal metal (S-N-S), or a constriction (S-c-S). The order parameters on the two sides have phases \(\phi_1\) and \(\phi_2\), and the gauge-invariant phase difference

\[
\varphi \equiv \phi_2 - \phi_1 - \frac{2e}{\hbar}\int_1^2 \mathbf{A}\cdot d\mathbf{l}
\]

is the fundamental dynamical variable.

<div class="theorem">
<strong>Josephson Relations.</strong> The DC and AC Josephson effects are encoded in two equations:

\[
I = I_c \sin\varphi \qquad \text{(current-phase relation)}
\]

\[
\frac{d\varphi}{dt} = \frac{2e}{\hbar} V = \frac{2\pi}{\Phi_0} V \qquad \text{(voltage-phase relation)}
\]

where \(I_c\) is the junction's critical current, determined by the barrier transparency and temperature.
</div>

The <em>DC Josephson effect</em>: if \(V = 0\) across the junction, a dissipationless supercurrent \(I = I_c \sin\varphi\) flows for any static phase difference \(0 \leq \varphi < \pi/2\). The maximum zero-voltage current is \(I_c\).

The <em>AC Josephson effect</em>: if a constant voltage \(V\) is maintained, then \(\varphi(t) = \varphi_0 + (2eV/\hbar)t\), and the supercurrent oscillates at the Josephson frequency

\[
f_J = \frac{2eV}{h} = \frac{V}{\Phi_0} \approx (483.6\,\mathrm{MHz/\mu V})\times V.
\]

This frequency-to-voltage conversion is exploited in metrology for the SI volt.

## 2.2 The RSJ Model and I-V Characteristics

The resistively and capacitively shunted junction (RCSJ, often just RSJ) model treats the junction as an ideal Josephson element in parallel with a resistance \(R\) (modelling quasiparticle tunnelling) and a capacitance \(C\) (geometric junction capacitance):

\[
I = I_c\sin\varphi + \frac{V}{R} + C\frac{dV}{dt}.
\]

Using \(V = (\hbar/2e)\dot\varphi\), this becomes a nonlinear second-order ODE:

\[
\frac{\hbar C}{2e}\ddot\varphi + \frac{\hbar}{2eR}\dot\varphi + I_c\sin\varphi = I_\mathrm{bias}.
\]

This is mathematically identical to the equation of motion of a particle of mass \(m^* = \hbar^2 C/(4e^2) = \hbar^2/(2E_C)\) in a tilted washboard potential

\[
U(\varphi) = -E_J\cos\varphi - \frac{\hbar I_\mathrm{bias}}{2e}\varphi,
\]

where the Josephson energy is

\[
E_J = \frac{\hbar I_c}{2e} = \frac{\Phi_0 I_c}{2\pi}.
\]

For \(I_\mathrm{bias} < I_c\), the particle sits in a metastable minimum (the zero-voltage state). For \(I_\mathrm{bias} > I_c\), the particle runs down the washboard (finite-voltage state). The I-V characteristic in the overdamped limit (\(Q \ll 1\)) is Ohmic above \(I_c\); in the underdamped limit (\(Q \gg 1\)) a hysteretic I-V appears.

### 2.2.1 Plasma Frequency

Linearising the RSJ equation about \(\varphi = 0\) (small oscillations), the natural frequency of the junction is

\[
\omega_p = \sqrt{\frac{2eI_c}{\hbar C}} = \sqrt{\frac{1}{L_J C}},
\]

the <em>plasma frequency</em>, where the Josephson inductance is

\[
L_J(\varphi) = \frac{\Phi_0}{2\pi I_c \cos\varphi} = \frac{L_{J0}}{\cos\varphi}.
\]

The quantity \(L_{J0} = \Phi_0/(2\pi I_c)\) is the Josephson inductance at zero phase. This inductance is nonlinear — the key property exploited in qubit design.

## 2.3 Flux Quantisation and the SQUID

Consider a closed superconducting loop. Single-valuedness of the order parameter requires the total phase accumulated around the loop to be an integer multiple of \(2\pi\):

\[
\oint \nabla\phi \cdot d\mathbf{l} = 2\pi n, \quad n \in \mathbb{Z}.
\]

Using the relation between the canonical momentum and the gauge-invariant phase, the total magnetic flux threading the loop is quantised:

\[
\Phi = n\Phi_0, \qquad \Phi_0 = h/2e.
\]

A superconducting quantum interference device (SQUID) is a loop interrupted by one (rf-SQUID) or two (dc-SQUID) Josephson junctions. For a dc-SQUID with two junctions of critical currents \(I_{c1}\) and \(I_{c2}\) and loop inductance \(L_\mathrm{loop}\), fluxoid quantisation constrains the phase differences:

\[
\varphi_1 - \varphi_2 = 2\pi\frac{\Phi_\mathrm{ext}}{\Phi_0} + 2\pi n,
\]

and the total critical current of the dc-SQUID is

\[
I_c^\mathrm{SQUID}(\Phi_\mathrm{ext}) = 2I_c\left|\cos\!\left(\pi\frac{\Phi_\mathrm{ext}}{\Phi_0}\right)\right|,
\]

assuming identical junctions and negligible loop inductance. An external flux \(\Phi_\mathrm{ext}\) therefore tunes \(I_c^\mathrm{SQUID}\) continuously, and hence tunes \(E_J\) and \(\omega_p\). This flux-tuning is the mechanism used to adjust transmon and flux-qubit frequencies in situ.

---

# Chapter 3: Circuit Quantisation and Superconducting Qubits

## 3.1 Quantisation of Lumped-Element Circuits

The transition from a classical superconducting circuit to a quantum Hamiltonian follows a systematic Lagrangian procedure. Consider a node \(n\) in the circuit with node flux \(\Phi_n(t) = \int_{-\infty}^t V_n(t')\,dt'\). The branch flux across a two-terminal element is \(\tilde\Phi = \Phi_i - \Phi_j\).

### 3.1.1 Quantum LC Oscillator

The LC circuit has Lagrangian

\[
\mathcal{L} = \frac{C}{2}\dot\Phi^2 - \frac{\Phi^2}{2L},
\]

with \(\Phi\) the flux across the inductor. The conjugate momentum is the charge \(Q = \partial\mathcal{L}/\partial\dot\Phi = C\dot\Phi\), giving Hamiltonian

\[
H = \frac{Q^2}{2C} + \frac{\Phi^2}{2L}.
\]

Promoting to operators \(\hat Q\) and \(\hat\Phi\) with canonical commutation relation \([\hat\Phi, \hat Q] = i\hbar\), and introducing the characteristic impedance \(Z_0 = \sqrt{L/C}\) and oscillator frequency \(\omega_r = 1/\sqrt{LC}\):

\[
\hat\Phi = \Phi_\mathrm{zpf}(\hat a + \hat a^\dagger), \qquad \hat Q = iQ_\mathrm{zpf}(\hat a^\dagger - \hat a),
\]

where the zero-point fluctuations are

\[
\Phi_\mathrm{zpf} = \sqrt{\frac{\hbar Z_0}{2}}, \qquad Q_\mathrm{zpf} = \sqrt{\frac{\hbar}{2Z_0}}.
\]

The Hamiltonian becomes

\[
\hat H = \hbar\omega_r\!\left(\hat a^\dagger \hat a + \frac{1}{2}\right),
\]

a quantum harmonic oscillator. All energy levels are equally spaced by \(\hbar\omega_r\), so a harmonic oscillator cannot serve as a qubit — we cannot selectively address any single transition.

## 3.2 The Cooper-Pair Box: Charge Qubit

The Cooper-pair box (CPB) replaces the linear inductor with a Josephson junction. The relevant energy scales are the charging energy

\[
E_C = \frac{e^2}{2C_\Sigma}, \qquad C_\Sigma = C_J + C_g,
\]

and the Josephson energy \(E_J = \Phi_0 I_c/(2\pi)\). The number of Cooper pairs \(\hat n\) on the island and the gauge-invariant phase \(\hat\varphi\) are conjugate variables: \([\hat\varphi, \hat n] = i\).

The Hamiltonian in the charge basis is

\[
\hat H_\mathrm{CPB} = 4E_C(\hat n - n_g)^2 - E_J\cos\hat\varphi,
\]

where \(n_g = C_g V_g/(2e)\) is the offset charge induced by a gate voltage \(V_g\). In the charge basis \(\{|N\rangle\}\), the Josephson term couples neighbouring charge states:

\[
-E_J\cos\hat\varphi = -\frac{E_J}{2}\sum_N \left(|N+1\rangle\langle N| + \mathrm{h.c.}\right).
\]

### 3.2.1 Energy Spectrum at the Charge Degeneracy Point

At \(n_g = 1/2\), the states \(|0\rangle\) and \(|1\rangle\) are degenerate in charging energy. Diagonalising the \(2\times 2\) subspace gives eigenstates

\[
|+\rangle = \frac{|0\rangle + |1\rangle}{\sqrt{2}}, \qquad |-\rangle = \frac{|0\rangle - |1\rangle}{\sqrt{2}},
\]

with energies \(E_\pm = E_C \mp E_J/2\). The transition frequency is \(\omega_{01} = E_J/\hbar\), insensitive to \(n_g\) to first order at this "sweet spot". The charge qubit is maximally sensitive to charge noise away from the sweet spot.

## 3.3 The Transmon Qubit

Koch et al. (2007) observed that the charge dispersion of the CPB — the sensitivity of energy levels to \(n_g\) — falls off exponentially with \(E_J/E_C\), while the anharmonicity decreases only algebraically. Operating at large \(E_J/E_C \gg 1\) (typically \(E_J/E_C \sim 50\text{–}100\)) gives the <em>transmon</em>, which is essentially charge-noise insensitive.

<div class="theorem">
<strong>Transmon Energy Levels.</strong> In the transmon limit \(E_J \gg E_C\), the phase \(\hat\varphi\) is well-localised near a minimum of \(-E_J\cos\hat\varphi\). Expanding to fourth order:

\[
-E_J\cos\hat\varphi \approx -E_J + \frac{E_J}{2}\hat\varphi^2 - \frac{E_J}{24}\hat\varphi^4 + \cdots
\]

The result is a weakly anharmonic oscillator with plasma frequency \(\omega_p = \sqrt{8E_J E_C}/\hbar\) and anharmonicity

\[
\alpha = E_{12} - E_{01} \approx -E_C.
\]

The charge dispersion of the \(m\)-th level is exponentially suppressed:

\[
\varepsilon_m \propto (-1)^m \frac{E_C}{2^{2m-3}}\sqrt{\frac{2}{\pi}}\left(\frac{E_J}{2E_C}\right)^{m/2+3/4} e^{-\sqrt{8E_J/E_C}}.
\]
</div>

In practice, \(E_C/h \approx 200\,\mathrm{MHz}\) and \(E_J/h \approx 15\,\mathrm{GHz}\), giving \(\omega_{01}/2\pi \approx 4\text{–}6\,\mathrm{GHz}\) and \(\alpha/2\pi \approx -200\,\mathrm{MHz}\). The anharmonicity is small but sufficient to resolve the \(|0\rangle \to |1\rangle\) transition from the \(|1\rangle \to |2\rangle\) transition when driving with pulses of duration \(\sim 1/|\alpha|\).

### 3.3.1 Flux-Tunable Transmon (Split Transmon)

Replacing the single junction with a dc-SQUID allows tuning \(E_J(\Phi_\mathrm{ext}) = E_{J,\mathrm{max}}|\cos(\pi\Phi_\mathrm{ext}/\Phi_0)|\), and hence tuning the qubit frequency. This is essential for two-qubit gate implementations. For an asymmetric SQUID with junction energies \(E_{J1} \neq E_{J2}\), the tunable effective Josephson energy is

\[
E_J^\mathrm{eff}(\Phi_\mathrm{ext}) = \sqrt{(E_{J1}+E_{J2})^2\cos^2\!\left(\pi\frac{\Phi_\mathrm{ext}}{\Phi_0}\right) + (E_{J1}-E_{J2})^2\sin^2\!\left(\pi\frac{\Phi_\mathrm{ext}}{\Phi_0}\right)}.
\]

The asymmetry ratio \(d = (E_{J1}-E_{J2})/(E_{J1}+E_{J2})\) sets the minimum-to-maximum frequency ratio and controls sensitivity to flux noise at the flux sweet spot \(\Phi_\mathrm{ext} = 0\).

## 3.4 The Flux Qubit

The flux qubit (Mooij et al. 1999) uses a superconducting loop interrupted by three junctions. Two junctions have area \(A\) and critical current \(I_c\), and the third is smaller by a factor \(\alpha \approx 0.6\text{–}0.8\). When the external flux is near \(\Phi_0/2\), the loop develops two nearly degenerate energy minima corresponding to circulating currents in opposite directions (persistent-current states \(|\circlearrowleft\rangle\) and \(|\circlearrowright\rangle\)). The effective two-level Hamiltonian is

\[
\hat H_\mathrm{flux} = -\frac{\epsilon}{2}\hat\sigma_z - \frac{\Delta}{2}\hat\sigma_x,
\]

where \(\epsilon = 2I_p(\Phi_\mathrm{ext} - \Phi_0/2)\) is the flux detuning (\(I_p\) is the persistent current), and \(\Delta\) is the tunnel splitting set by the junction parameters. The flux qubit has a much larger anharmonicity than the transmon and a larger coupling to external flux, but is also more sensitive to flux noise.

## 3.5 The Phase Qubit

The phase qubit uses a single, current-biased Josephson junction. At bias current \(I_b \lesssim I_c\), the washboard potential \(U(\varphi) = -E_J\cos\varphi - (\hbar I_b/2e)\varphi\) has a shallow local minimum supporting a small number of bound states. Transitions between the ground state \(|0\rangle\) and first excited state \(|1\rangle\) define the qubit, while \(|1\rangle \to |2\rangle\) transitions trigger measurable macroscopic quantum tunnelling. Phase qubits have strong anharmonicity but poor coherence due to intrinsic junction noise.

## 3.6 The Fluxonium Qubit

Fluxonium (Manucharyan et al. 2009) consists of a small Josephson junction shunted by an array of \(N \sim 100\) larger junctions acting as a superinductance \(L_s \gg L_{J0}\). The Hamiltonian is

\[
\hat H_\mathrm{fluxonium} = 4E_C\hat n^2 + \frac{E_L}{2}(\hat\varphi - 2\pi\Phi_\mathrm{ext}/\Phi_0)^2 - E_J\cos\hat\varphi,
\]

where the inductive energy \(E_L = (\Phi_0/2\pi)^2/L_s \ll E_J\). At half-flux (\(\Phi_\mathrm{ext} = \Phi_0/2\)), the potential is a symmetric double-well. Fluxonium features long coherence times and strong anharmonicity, with the transition frequency reaching the MHz range in the "heavy fluxonium" regime.

---

# Chapter 4: Circuit Quantum Electrodynamics

## 4.1 Cavity QED Background

Cavity quantum electrodynamics (cavity QED) studies the interaction between single atoms and discrete photon modes of a cavity. The hallmark is the strong coupling regime, where the atom-photon coupling \(g\) exceeds both the cavity decay rate \(\kappa\) and the atomic decay rate \(\gamma\):

\[
g \gg \kappa, \gamma.
\]

In this regime, excitation is coherently exchanged between the atom and field — vacuum Rabi splitting — and phenomena like photon-number-dependent qubit frequencies become measurable.

## 4.2 The Jaynes-Cummings Model

The Jaynes-Cummings model is the quantum optical archetype for atom-cavity coupling. For a two-level system (qubit) with transition frequency \(\omega_q\) coupled to a harmonic oscillator (cavity) at frequency \(\omega_r\):

<div class="theorem">
<strong>Jaynes-Cummings Hamiltonian.</strong>

\[
\hat H_\mathrm{JC} = \hbar\omega_r \hat a^\dagger \hat a + \frac{\hbar\omega_q}{2}\hat\sigma_z + \hbar g(\hat a^\dagger\hat\sigma^- + \hat a\,\hat\sigma^+),
\]

where \(\hat\sigma^\pm = (\hat\sigma_x \pm i\hat\sigma_y)/2\) are qubit raising/lowering operators, \(\hat a, \hat a^\dagger\) are cavity photon operators, and \(g\) is the vacuum coupling strength. The rotating-wave approximation (RWA) has been applied: counter-rotating terms \(\hat a\hat\sigma^- + \hat a^\dagger\hat\sigma^+\) are dropped.
</div>

The Hamiltonian is block-diagonal in the dressed-state basis \(\{|n, g\rangle, |n-1, e\rangle\}\). In each block the eigenvalues are

\[
E_\pm^{(n)} = \hbar\omega_r n \pm \hbar\sqrt{g^2 n + (\Delta/2)^2},
\]

where \(\Delta = \omega_q - \omega_r\) is the detuning. At zero detuning (\(\Delta = 0\)), the dressed states are superpositions of atom and photon excitation, split by \(2g\sqrt{n}\) — the <em>vacuum Rabi splitting</em> is \(2g\) (for \(n=1\)).

## 4.3 Circuit QED Implementation

In circuit QED (Blais et al. 2004), the "atom" is a superconducting qubit (typically a transmon) and the "cavity" is a microwave resonator — either a lumped-element LC resonator or a coplanar waveguide (CPW) resonator of length \(\ell = \lambda/2\) or \(\ell = \lambda/4\).

The coupling arises from the capacitive coupling \(C_g\) between the qubit and the resonator. The coupling energy is

\[
g = \frac{C_g}{C_\Sigma} \frac{eV_\mathrm{zpf}}{\hbar} \left(\frac{\partial \omega_q}{\partial n_g}\right),
\]

which for a transmon simplifies to

\[
g = \frac{C_g}{C_\Sigma}\sqrt{\frac{\omega_r}{2\hbar C_r}}\cdot e \cdot \left(\frac{E_J}{8E_C}\right)^{1/4}.
\]

Typical circuit QED parameters: \(\omega_r/2\pi \approx 6\,\mathrm{GHz}\), \(\omega_q/2\pi \approx 5\,\mathrm{GHz}\), \(g/2\pi \approx 50\text{–}200\,\mathrm{MHz}\), \(\kappa/2\pi \approx 1\text{–}10\,\mathrm{MHz}\), \(\gamma/2\pi \approx 1\text{–}100\,\mathrm{kHz}\). These satisfy \(g \gg \kappa \gg \gamma\), the strong-coupling regime.

## 4.4 Dispersive Regime and Dispersive Readout

When the qubit-cavity detuning satisfies \(|\Delta| \gg g\), a second-order perturbative transformation (the dispersive transformation, or Jaynes-Cummings dispersive limit) yields an effective Hamiltonian:

<div class="theorem">
<strong>Dispersive Hamiltonian.</strong> To second order in \(g/\Delta\):

\[
\hat H_\mathrm{disp} = \hbar\omega_r' \hat a^\dagger \hat a + \frac{\hbar\omega_q'}{2}\hat\sigma_z + \hbar\chi\,\hat a^\dagger\hat a\,\hat\sigma_z,
\]

where

\[
\chi = \frac{g^2\alpha}{\Delta(\Delta + \alpha)}, \qquad \omega_r' = \omega_r + \frac{g^2}{\Delta}, \qquad \omega_q' = \omega_q + \frac{g^2}{\Delta}.
\]

Here \(\alpha < 0\) is the transmon anharmonicity, and \(\Delta = \omega_q - \omega_r\).
</div>

The \(\hbar\chi\hat a^\dagger\hat a\hat\sigma_z\) term shifts the cavity frequency by \(\pm\chi\) depending on the qubit state. Measuring the transmission phase of a weak probe tone at \(\omega_r'\) therefore reveals the qubit state without directly driving the qubit transition — this is <em>dispersive readout</em>. The two cavity frequencies are

\[
\omega_r^\pm = \omega_r' \pm \chi,
\]

separated by \(2\chi\). Readout fidelity improves with \(|\chi|/\kappa\) and the signal-to-noise ratio of the amplification chain.

<div class="remark">
<strong>Photon-number-dependent qubit frequency.</strong> The \(\hbar\chi\hat a^\dagger\hat a\hat\sigma_z\) term also means the qubit frequency shifts by \(2\chi\) per photon in the cavity. This photon-number splitting can be resolved spectroscopically when \(2\chi > \kappa\), enabling photon-number-state discrimination ("cat qubit" readout).
</div>

## 4.5 Coplanar Waveguide Resonators

A coplanar waveguide (CPW) resonator consists of a centre conductor flanked by two ground planes on a planar substrate. The distributed electromagnetic modes of a length-\(\ell\) CPW resonator are analogous to a stretched string: mode \(n\) has frequency \(\omega_n = n\pi v_p/\ell\) where \(v_p = c/\sqrt{\varepsilon_\mathrm{eff}}\) is the phase velocity.

The resonator is coupled to external feedlines via coupling capacitors \(C_c\), which set the external quality factor

\[
Q_\mathrm{ext} = \frac{\omega_r C_r}{C_c^2/C_r} \approx \frac{1}{\omega_r^2 Z_0 C_c^2 / C_r},
\]

and the loaded quality factor \(Q_L^{-1} = Q_\mathrm{int}^{-1} + Q_\mathrm{ext}^{-1}\). Modern Al-on-Si resonators achieve internal quality factors \(Q_\mathrm{int} > 10^6\) at single-photon powers.

---

# Chapter 5: Single-Qubit Operations

## 5.1 Microwave Drive and the Rotating Frame

To drive a superconducting qubit, a microwave tone at angular frequency \(\omega_d \approx \omega_q\) is applied via a gate capacitor or the readout feedline. The drive Hamiltonian is

\[
\hat H_d(t) = \hbar\Omega_R\cos(\omega_d t + \phi_d)\,\hat\sigma_x,
\]

where \(\Omega_R\) is proportional to the drive amplitude and \(\phi_d\) is the phase of the tone. Moving to the rotating frame with the unitary \(\hat U = e^{i\omega_d t \hat\sigma_z/2}\) and applying the rotating-wave approximation (RWA, discarding terms oscillating at \(2\omega_d\)):

\[
\hat H_\mathrm{rot} = \frac{\hbar\delta}{2}\hat\sigma_z + \frac{\hbar\Omega_R}{2}(\cos\phi_d\,\hat\sigma_x + \sin\phi_d\,\hat\sigma_y),
\]

where \(\delta = \omega_q - \omega_d\) is the drive detuning. On resonance (\(\delta = 0\)), the Hamiltonian generates rotation about an axis in the \(xy\)-plane of the Bloch sphere, with angular frequency \(\Omega_R\) — the <em>Rabi frequency</em>.

## 5.2 Rabi Oscillations

If the drive is turned on at \(t = 0\) with the qubit in \(|0\rangle\), the probability of finding the qubit in \(|1\rangle\) at time \(t\) is

\[
P_e(t) = \frac{\Omega_R^2}{\Omega_R^2 + \delta^2}\sin^2\!\left(\frac{\sqrt{\Omega_R^2 + \delta^2}}{2}\,t\right).
\]

On resonance this simplifies to \(P_e(t) = \sin^2(\Omega_R t/2)\). The generalised Rabi frequency is \(\tilde\Omega = \sqrt{\Omega_R^2 + \delta^2}\).

A pulse of duration \(t_\pi = \pi/\Omega_R\) (a "\(\pi\)-pulse") flips the qubit state \(|0\rangle \leftrightarrow |1\rangle\). A pulse of duration \(t_{\pi/2} = \pi/(2\Omega_R)\) prepares an equal superposition — an essential gate for most algorithms. Typical Rabi frequencies in transmon systems: \(\Omega_R/2\pi \approx 10\text{–}100\,\mathrm{MHz}\), giving gate times \(t_\pi \approx 5\text{–}50\,\mathrm{ns}\).

## 5.3 DRAG: Derivative Removal via Adiabatic Gate

Transmons have small but finite anharmonicity \(|\alpha|\). A rectangular \(\pi\)-pulse excites the \(|1\rangle \to |2\rangle\) transition off-resonantly with probability \(\sim (\Omega_R/\alpha)^2\). The DRAG (Derivative Removal via Adiabatic Gate) technique adds a quadrature component proportional to the time derivative of the in-phase envelope:

\[
\Omega_x(t) = \varepsilon(t), \qquad \Omega_y(t) = -\frac{\dot\varepsilon(t)}{\alpha},
\]

where \(\varepsilon(t)\) is the pulse envelope. This cancels leakage to \(|2\rangle\) to first order in \(\Omega_R/|\alpha|\), and is standard in experimental implementations.

## 5.4 Virtual Z Gates

Rotations about the \(z\)-axis on the Bloch sphere can be implemented exactly by shifting the phase of all subsequent drive pulses by the desired angle. Since \(R_z(\theta) = e^{-i\theta\hat\sigma_z/2}\), and phase-shifting the drive by \(\theta\) is equivalent to conjugating by \(R_z(\theta)\), virtual Z gates have zero error and zero duration — they are implemented in software.

---

# Chapter 6: Two-Qubit Gates

## 6.1 Cross-Resonance Gate

The cross-resonance (CR) gate is the primary two-qubit gate in fixed-frequency transmon architectures (IBM Q). Two transmons at frequencies \(\omega_1\) and \(\omega_2\) are coupled capacitively with coupling \(J\). Qubit 1 (control) is driven at the frequency of qubit 2 (target), \(\omega_d = \omega_2\).

In the rotating frame of both qubits, the effective Hamiltonian after RWA contains the term

\[
\hat H_\mathrm{CR} \approx \hbar\zeta\,\hat\sigma_z^{(1)}\hat\sigma_x^{(2)},
\]

where \(\zeta \propto J\Omega_R/(\omega_1 - \omega_2)\). This \(ZX\) interaction generates the CNOT gate (up to local rotations) after evolution for a time \(t = \pi/(4\zeta)\). Additional calibration pulses (echo sequences) suppress single-qubit error terms. CR gate times are \(\sim 200\text{–}500\,\mathrm{ns}\) with two-qubit fidelities \(> 99\%\) in leading systems.

## 6.2 The iSWAP Gate and Parametric Modulation

When two transmons share a flux-tunable coupler or one qubit is directly tunable, the \(\sqrt{\mathrm{iSWAP}}\) gate is natural. With both qubits at the same frequency (\(\omega_1 = \omega_2\)) and direct capacitive coupling \(J\), the XY interaction

\[
\hat H_{XY} = J(\hat\sigma^+_1\hat\sigma^-_2 + \hat\sigma^-_1\hat\sigma^+_2)
\]

generates iSWAP in time \(t = \pi/(4J)\). Two consecutive iSWAP applications give a SWAP.

Alternatively, parametric modulation of a flux-tunable qubit at the difference frequency \(|\omega_1 - \omega_2|\) activates the sideband interaction even when qubits are off-resonant, enabling the gate while maintaining frequency isolation during idle.

## 6.3 CZ Gate via Conditional Phase

Another widely used two-qubit gate is the controlled-Z (CZ), which applies a \(\pi\) phase to \(|11\rangle\) only. In a transmon-transmon system, one approach is the adiabatic CZ: tune the \(|11\rangle\) state through the avoided crossing with \(|02\rangle\) (or \(|20\rangle\)) using a fast flux pulse. The avoided crossing energy is

\[
g_{12} = \sqrt{2}\,g,
\]

where \(g\) is the linear coupling. A properly shaped flux pulse causes \(|11\rangle\) to accumulate a relative phase of \(\pi\) compared to \(|00\rangle, |01\rangle, |10\rangle\), implementing CZ in \(\sim 50\text{–}100\,\mathrm{ns}\).

---

# Chapter 7: Coherence, Decoherence, and Noise

## 7.1 Open Quantum Systems and the Lindblad Master Equation

Real qubits interact with an environment, causing decoherence. The Lindblad master equation for the qubit density matrix \(\hat\rho\) is

\[
\frac{d\hat\rho}{dt} = -\frac{i}{\hbar}[\hat H, \hat\rho] + \sum_k \Gamma_k\!\left(\hat L_k\hat\rho\hat L_k^\dagger - \frac{1}{2}\hat L_k^\dagger\hat L_k\hat\rho - \frac{1}{2}\hat\rho\hat L_k^\dagger\hat L_k\right),
\]

where \(\hat L_k\) are jump operators and \(\Gamma_k\) their rates.

## 7.2 Energy Relaxation — \(T_1\)

Energy relaxation (amplitude damping) is described by the jump operator \(\hat L_1 = \hat\sigma^-\) with rate \(\Gamma_1 = 1/T_1\). The excited-state population decays as

\[
\rho_{ee}(t) = \rho_{ee}(0)\,e^{-t/T_1}.
\]

The relaxation rate \(\Gamma_1\) is given by Fermi's golden rule:

\[
\Gamma_1 = \frac{1}{\hbar^2}|g_{01}|^2 S_X(\omega_{01}),
\]

where \(S_X(\omega)\) is the spectral density of the environment's coupling operator at the qubit frequency.

### 7.2.1 Purcell Effect

The Purcell effect is cavity-enhanced relaxation: a qubit coupled to a resonator at rate \(g\) inherits a decay rate through the cavity of

\[
\Gamma_1^\mathrm{Purcell} = \left(\frac{g}{\Delta}\right)^2\kappa.
\]

This is the dominant \(T_1\) limit in many circuit QED systems without a Purcell filter. The Purcell filter (a bandpass filter between qubit and feedline) suppresses this by several orders of magnitude while preserving readout bandwidth.

### 7.2.2 Dielectric Loss

Dielectric loss in substrate materials (Si, sapphire, SiO\(_2\)) and interfaces (metal–substrate, substrate–air) contributes

\[
\Gamma_1^\mathrm{diel} = \omega_q\,\tan\delta\cdot p,
\]

where \(\tan\delta\) is the loss tangent and \(p\) is the participation ratio of the electric field in the lossy dielectric volume. Reducing dielectric loss is a primary substrate and fabrication engineering challenge.

## 7.3 Dephasing — \(T_2\) and \(T_2^*\)

Dephasing describes loss of phase coherence without energy exchange. The off-diagonal element of \(\hat\rho\) decays as

\[
|\rho_{ge}(t)| = |\rho_{ge}(0)|\,e^{-t/T_2}, \qquad \frac{1}{T_2} = \frac{1}{2T_1} + \frac{1}{T_\phi},
\]

where \(T_\phi\) is the pure dephasing time. Spin-echo experiments extend the effective coherence to \(T_2^\mathrm{echo}\), which filters out low-frequency noise. The FID coherence \(T_2^*\) includes inhomogeneous broadening from slowly fluctuating offsets:

\[
\frac{1}{T_2^*} = \frac{1}{2T_1} + \frac{1}{T_\phi^\mathrm{inhom}}.
\]

### 7.3.1 Charge Noise

Gate-voltage fluctuations \(\delta n_g\) couple to the qubit via

\[
\Gamma_\phi^\mathrm{charge} = \left(\frac{\partial\omega_q}{\partial n_g}\right)^2 S_{n_g}(0+),
\]

where \(S_{n_g}(\omega)\) is the charge noise spectral density. For a transmon, the charge dispersion is exponentially suppressed: \(\partial\omega_q/\partial n_g \propto e^{-\sqrt{8E_J/E_C}}\), making charge dephasing negligible at large \(E_J/E_C\).

### 7.3.2 Flux Noise

Flux noise couples to frequency-tunable qubits through

\[
\Gamma_\phi^\mathrm{flux} = \left(\frac{\partial\omega_q}{\partial\Phi_\mathrm{ext}}\right)^2 S_\Phi,
\]

where \(S_\Phi \propto 1/f\) is the \(1/f\) flux noise power spectral density. At the flux sweet spot, \(\partial\omega_q/\partial\Phi_\mathrm{ext} = 0\) to first order, giving a factor of \(\sim 10\text{–}100\times\) improvement in \(T_\phi\). The \(1/f\) noise leads to logarithmic time decay of the coherence under free induction and is well characterised by the echo-decay envelope.

### 7.3.3 \(1/f\) Noise and the Physical Mechanism

\(1/f\) noise in Josephson junction devices is believed to arise from two-level fluctuators (TLFs) in amorphous oxide layers at metal surfaces and interfaces. Each TLF is modelled as a thermally activated transition between two potential wells with switching rate \(\gamma_\mathrm{TLF}\). An ensemble of TLFs with exponentially distributed switching rates \(\gamma_\mathrm{TLF}\) gives a spectral density

\[
S(\omega) = A/\omega^\alpha, \quad \alpha \approx 1.
\]

Reducing TLF density through surface treatments (HF etching, MBE growth of crystalline Al) is an active research direction.

## 7.4 The T1 Budget

State-of-the-art transmon qubits (2024) achieve \(T_1 \sim 0.1\text{–}1\,\mathrm{ms}\). The dominant loss mechanisms in order of typical contribution are: (1) dielectric/interface loss, (2) Purcell decay (mitigated by filters), (3) quasiparticle poisoning (non-equilibrium quasiparticles generated by cosmic rays or infrared radiation that tunnel across the junction and break pair coherence), and (4) radiative decay into substrate phonons. Mitigation strategies include phonon traps, infrared shielding, improved substrate preparation, and Purcell-filter-coupled readout architectures.

---

# Chapter 8: Readout of Superconducting Qubits

## 8.1 Dispersive Readout Protocol

The standard readout sequence is:

1. Apply a short microwave pulse (duration \(\sim 1/\kappa\)) at the cavity frequency \(\omega_r\).
2. The reflected (or transmitted) signal acquires a phase shift of \(\pm\arctan(2\chi/\kappa)\) depending on the qubit state.
3. The signal is amplified and downconverted, and the resulting quadrature voltages are time-integrated to determine the qubit state.

The signal-to-noise ratio per readout is

\[
\mathrm{SNR} = \frac{4g^2/\kappa^2\cdot(\bar n_\mathrm{phot}/\kappa)}{\text{amplifier noise}},
\]

where \(\bar n_\mathrm{phot}\) is the mean readout photon number. This is bounded by the quantum limit: the minimum added noise of a phase-insensitive amplifier is \(N_\mathrm{add} \geq 1/2\) photon.

## 8.2 Homodyne and Heterodyne Detection

In <em>homodyne detection</em>, the signal is mixed with a local oscillator (LO) at the same frequency \(\omega_r\), measuring a single quadrature \(I\) or \(Q\). This is a phase-sensitive measurement: the qubit information is maximally encoded in the phase, so a suitably phased LO achieves the highest SNR.

In <em>heterodyne detection</em>, the LO is detuned by an intermediate frequency \(\omega_\mathrm{IF}\), and both \(I\) and \(Q\) quadratures are recorded simultaneously. This is phase-insensitive, requiring at least 3 dB more noise compared to the ideal homodyne limit.

## 8.3 Quantum-Limited Amplifiers

The quantum noise limit for amplification makes high-gain, low-noise amplifiers essential. Two superconducting amplifier technologies dominate:

### 8.3.1 Josephson Parametric Amplifier (JPA)

A JPA uses a parametrically pumped Josephson junction circuit. The Hamiltonian is

\[
\hat H_\mathrm{JPA} = \hbar\omega_r \hat a^\dagger\hat a - \frac{E_J}{24}\hat\varphi_0^4(\hat a + \hat a^\dagger)^4 + \hat H_\mathrm{pump}.
\]

Pumping at \(\omega_p = 2\omega_r\) (degenerate parametric amplification) generates the squeezing interaction

\[
\hat H_\mathrm{sq} = \hbar\lambda(\hat a^2 + \hat a^{\dagger 2}),
\]

which amplifies one quadrature with gain \(G\) and de-amplifies the conjugate quadrature by \(1/G\), achieving the quantum limit of zero added noise for the amplified quadrature. JPAs have gain \(\sim 20\text{–}30\,\mathrm{dB}\) but limited bandwidth (\(\sim\)tens of MHz) and dynamic range.

### 8.3.2 Travelling-Wave Parametric Amplifier (TWPA)

The TWPA (Macklin et al. 2015) is a long chain (\(N \sim 1000\)) of Josephson junctions acting as a distributed nonlinear medium. A pump at \(\omega_p\) generates four-wave mixing between signal (\(\omega_s\)), idler (\(\omega_i = 2\omega_p - \omega_s\)), and pump, amplifying the signal with gain \(G \sim 20\,\mathrm{dB}\) over bandwidth \(\sim 4\,\mathrm{GHz}\). Phase matching is achieved by periodic loading with shunt capacitors (resonant phase matching), which shifts the dispersion relation. The TWPA approaches quantum-limited operation and can simultaneously readout multiple qubits.

---

# Chapter 9: Quantum Systems — IBM Q and Google Sycamore

## 9.1 Architecture Principles

A scalable superconducting quantum processor requires: (i) a qubit array with controllable nearest-neighbour (or longer-range) coupling; (ii) individual microwave control lines for each qubit; (iii) dedicated readout resonators multiplexed on feedlines; (iv) a cryogenic wiring hierarchy to deliver control signals from room temperature; (v) a quantum error correction (QEC) layer, or at minimum, post-selection for near-term NISQ operation.

### 9.1.1 Wiring and Thermal Budget

A dilution refrigerator with base temperature \(T_\mathrm{base} \sim 10\text{–}15\,\mathrm{mK}\) is the operating environment. Each control line contributes thermal noise power \(P = k_B T \Delta f\) if not properly attenuated. Typical wiring hierarchy:

- Room temperature (300 K): DAC/AWG, LO sources, digitisers.
- 4 K stage: HEMT amplifier for readout return signal.
- Still (\(\sim\)700 mK): further attenuation.
- Cold plate (\(\sim\)100 mK): low-pass filters, attenuators.
- Base plate (10–15 mK): qubit chip, JPAs.

Attenuators on each input line (typically \(-20\) to \(-30\,\mathrm{dB}\) at each stage) thermalise the line to the stage temperature. The total input noise temperature at the qubit frequency is set by the attenuation ratio.

## 9.2 IBM Q System One

IBM Q System One is IBM's commercial quantum computing system based on fixed-frequency transmon qubits. Key architectural choices:

- <strong>Fixed-frequency transmons:</strong> each qubit operates at a fixed frequency, avoiding flux-noise from tunable elements.
- <strong>Cross-resonance gates:</strong> two-qubit interaction via CR pulses through capacitive coupling.
- <strong>Heavy-hex connectivity:</strong> IBM's "heavy-hexagon" lattice with qubit connectivity designed to support surface code error correction with nearest-neighbour CNOT chains.
- <strong>Multiplexed readout:</strong> groups of 5–7 qubits share a readout feedline via frequency-multiplexed resonators.
- <strong>Qubit parameters (127-qubit Eagle processor):</strong> \(\omega_q/2\pi \approx 4.5\text{–}5.5\,\mathrm{GHz}\), \(T_1 \approx 100\text{–}400\,\mu\mathrm{s}\), two-qubit gate fidelity \(\gtrsim 99\%\).

The key scalability challenge for fixed-frequency designs is frequency crowding: placing many transmons in a narrow frequency band risks frequency collisions and spurious ZZ interactions.

## 9.3 Google Sycamore

Google's Sycamore processor (Arute et al. 2019, "quantum supremacy") introduced a 53-qubit chip with a novel coupler design:

- <strong>Gmon/frequency-tunable qubits:</strong> transmons with individual flux-bias lines for fast frequency tuning.
- <strong>Tunable couplers:</strong> each qubit pair is connected by an additional flux-tunable transmon coupler, allowing the effective coupling to be tuned continuously from \(J_\mathrm{eff} = 0\) (off) to \(\sim 30\,\mathrm{MHz}\) (on).
- <strong>iSWAP-like gates:</strong> the coupler generates fSWAP (fermionic SWAP) and CZ gates in \(\sim 12\text{–}40\,\mathrm{ns}\) with fidelity \(\gtrsim 99.5\%\).
- <strong>Random circuit sampling:</strong> the supremacy demonstration used 53 qubits and 20 cycles of random two-qubit gates, producing a distribution estimated (classically) to require \(\sim 10^{4}\,\mathrm{years}\) on the Summit supercomputer at the time.

The tunable coupler architecture suppresses residual ZZ coupling to \(\sim 10\text{–}100\,\mathrm{kHz}\) when the coupler is in the off state, dramatically reducing always-on crosstalk that limits circuit depth.

## 9.4 Scalability Challenges

<div class="remark">
<strong>The wiring bottleneck.</strong> Current superconducting quantum computers are limited by the number of room-temperature-to-cryostat connections. A 1000-qubit processor requires \(\sim 3000\text{–}5000\) coaxial lines, each with passive components at every temperature stage. Potential solutions include: (1) cryo-CMOS classical control electronics at the 4 K stage; (2) microwave multiplexing (frequency division, time division) on shared feedlines; (3) superconducting digital (SFQ) logic at millikelvin for on-chip control; (4) 3D integration for vertical interconnects between qubit and classical layers.
</div>

Other scalability challenges include: qubit frequency calibration and drift (each qubit must be individually characterised and recalibrated); crosstalk (residual ZZ, parasitic microwave coupling); quantum error correction overhead (surface code requires \(\sim 10^3\) physical qubits per logical qubit at current gate fidelities); and the need for real-time classical decoding of syndrome measurements within the coherence time.

---

# Chapter 10: Selected Advanced Topics

## 10.1 Quantum Error Correction Basics for Superconducting Qubits

The surface code is the leading QEC scheme for superconducting qubits because it requires only nearest-neighbour interactions and has a high threshold error rate (\(p_\mathrm{th} \approx 1\%\)). The code encodes one logical qubit in a 2D array of \(d^2\) data qubits and \((d-1)^2 + d^2-1\) ancilla qubits, where \(d\) is the code distance. Syndrome measurements are performed by ancilla qubits that measure stabilisers:

\[
A_v = \prod_{i \in v}\hat\sigma_x^{(i)}, \qquad B_p = \prod_{i \in p}\hat\sigma_z^{(i)},
\]

where \(v\) runs over vertex qubits and \(p\) over plaquette qubits in the surface code lattice. Detection of non-trivial syndromes signals errors, and a classical decoder (minimum-weight perfect matching) infers and corrects them.

The logical error rate for a distance-\(d\) surface code is approximately

\[
p_L \approx A\left(\frac{p}{p_\mathrm{th}}\right)^{\lfloor(d+1)/2\rfloor},
\]

so exponential suppression of logical errors with code distance is possible when \(p < p_\mathrm{th}\).

## 10.2 Bosonic Qubit Encodings

An alternative to the surface code is to encode a logical qubit in the Hilbert space of a harmonic oscillator (microwave cavity), exploiting the large Hilbert space of a resonator mode. The cat qubit encodes \(|0_L\rangle \propto |\alpha\rangle + |-\alpha\rangle\) and \(|1_L\rangle \propto |\alpha\rangle - |-\alpha\rangle\) (even/odd coherent-state superpositions). Bit-flip errors are exponentially suppressed with \(|\alpha|^2\), while phase-flip errors grow linearly, biasing the error channel towards a more correctable form.

The GKP (Gottesman-Kitaev-Preskill) code encodes logical qubits in a grid of displaced Fock states in phase space, achieving error correction for small displacements and admitting transversal logical gates.

## 10.3 Quasiparticle Poisoning

Non-equilibrium quasiparticles (QPs) are generated in the superconducting material by cosmic-ray muons, gamma radiation, phonons, and infrared photon absorption. A QP tunnelling across the Josephson junction changes the parity of the island charge state from even to odd, mixing the qubit subspace with higher-lying "odd" states and causing relaxation. The QP-induced relaxation rate is

\[
\Gamma_1^\mathrm{QP} \approx \frac{8E_J}{\pi h}\,x_\mathrm{QP}\sqrt{\frac{2\Delta}{\omega_q}},
\]

where \(x_\mathrm{QP} = n_\mathrm{QP}/n_\mathrm{CP}\) is the quasiparticle density normalised to the Cooper-pair density. Typical residual \(x_\mathrm{QP} \sim 10^{-7}\text{–}10^{-6}\) limits \(T_1\) to \(\sim 1\,\mathrm{ms}\). Mitigation: normal-metal QP traps placed at the boundaries of the superconducting island absorb QPs before they reach the junction.

