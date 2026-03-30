---
title: "PHYS 394: Light-Matter Interactions"
prof: Donna Strickland
subjects: "PHYS"
---

## Sources and References

**Primary textbook** — Svelto, O. (2010). *Principles of Lasers*, 5th ed. Springer. (Available in UW library.)
**Supplementary texts** — Saleh, B. E. A., & Teich, M. C. (2019). *Fundamentals of Photonics*, 3rd ed. Wiley; Siegman, A. E. (1986). *Lasers*. University Science Books; Yariv, A. (1989). *Quantum Electronics*, 3rd ed. Wiley.
**Online resources** — MIT OpenCourseWare 6.007 Applied Electromagnetics; Strickland & Mourou (1985) CPA paper (*Opt. Commun.* 56, 219–221) for historical context on chirped pulse amplification; NIST Atomic Spectra Database (physics.nist.gov/asd).

---

# Chapter 1: Overview — Lasers, Light, and the Electromagnetic Spectrum

## 1.1 Why Study Light-Matter Interactions?

The interaction of electromagnetic radiation with matter underlies an enormous range of technologies: lasers, optical fibers, LEDs, solar cells, spectroscopy, medical imaging, and nonlinear optics. The central question is: when electromagnetic radiation is incident on a material, how does the material respond, and how does that response modify the radiation?

Before the laser (1960), light sources were thermal (incoherent, broadband, low intensity). The laser provided **coherent, highly monochromatic, well-collimated, high-intensity** radiation that enabled nonlinear optics, precision measurement, and ultrafast science.

## 1.2 Electromagnetic Waves and Photons

Classically, light is a transverse electromagnetic wave: oscillating **electric** and **magnetic** fields perpendicular to each other and to the direction of propagation. The dispersion relation in vacuum is \( \omega = ck \), where \( c = 3 \times 10^8 \, \text{m/s} \).

Quantum mechanically, light is quantized into **photons** with energy:
\[ E = \hbar \omega = h\nu \]
and momentum \( p = \hbar k \). For optical frequencies (\( \lambda \sim 500 \, \text{nm} \)), \( E \approx 2.5 \, \text{eV} \).

## 1.3 The Spectrum

| Region | Wavelength range | Photon energy |
|--------|-----------------|--------------|
| X-ray | 0.01–10 nm | keV range |
| UV | 10–400 nm | 3–100 eV |
| Visible | 400–700 nm | 1.8–3.1 eV |
| Near-IR | 0.7–2.5 μm | 0.5–1.8 eV |
| Mid-IR | 2.5–25 μm | 0.05–0.5 eV |
| Far-IR / THz | 25 μm–1 mm | meV range |

---

# Chapter 2: Semi-Classical Theory — Absorption, Stimulated, and Spontaneous Emission

## 2.1 Atoms in a Radiation Field

The interaction of an atom with a near-resonant electromagnetic field is treated semi-classically: the atom is described quantum mechanically, while the field is treated classically (a sinusoidal electric field). This yields the foundational Einstein relations.

Consider a two-level atom with ground state \( \left| 1 \right\rangle \) (energy \( E_1 \)) and excited state \( \left| 2 \right\rangle \) (energy \( E_2 \)), with the resonance frequency \( \omega_0 = (E_2 - E_1)/\hbar \).

## 2.2 Einstein Coefficients

<div class="definition">
<strong>Einstein's three radiative processes:</strong>
<ol>
<li><strong>Absorption:</strong> An atom in state \( \left|1\right\rangle \) absorbs a photon and transitions to \( \left|2\right\rangle \). Rate \( = B_{12} \rho(\omega) N_1 \), where \( B_{12} \) is the Einstein B-coefficient and \( \rho(\omega) \) is the spectral energy density of the field.</li>
<li><strong>Stimulated emission:</strong> An atom in \( \left|2\right\rangle \) is stimulated by the field to emit a photon <em>coherent with the stimulating field</em> (same frequency, phase, direction, polarization) and transitions to \( \left|1\right\rangle \). Rate \( = B_{21} \rho(\omega) N_2 \).</li>
<li><strong>Spontaneous emission:</strong> An atom in \( \left|2\right\rangle \) emits a photon into a <em>random mode</em> and decays to \( \left|1\right\rangle \) without any incident field. Rate \( = A_{21} N_2 \).</li>
</ol>
</div>

**Einstein relations** (derived by requiring thermal equilibrium with a Planck distribution):
\[ \frac{A_{21}}{B_{21}} = \frac{\hbar \omega^3}{\pi^2 c^3} \]
\[ B_{12} = B_{21} \quad (\text{for non-degenerate levels}) \]

The ratio \( A_{21}/B_{21} \propto \omega^3 \) explains why spontaneous emission dominates over stimulated emission at high frequencies (X-rays are hard to amplify) and why lasers work best in the optical/IR range.

## 2.3 Transition Rate Probability (Fermi's Golden Rule)

Treating the atom-field interaction as a perturbation, **Fermi's golden rule** gives the transition rate:
\[ W_{12} = \frac{2\pi}{\hbar} \left| \langle 2 | \hat{H}' | 1 \rangle \right|^2 \rho(E_2) \]

For electric dipole transitions, the matrix element is \( \langle 2 | \hat{H}' | 1 \rangle = -e \mathbf{E} \cdot \langle 2 | \mathbf{r} | 1 \rangle \). Forbidden if the matrix element vanishes (**selection rules**).

The **dipole matrix element** \( \mu_{12} = e \langle 2 | \mathbf{r} | 1 \rangle \) determines the strength of the transition. Large \( |\mu_{12}|^2 \) means large \( B_{12} \) and short spontaneous lifetime \( \tau_{sp} = 1/A_{21} \).

## 2.4 Rate Equations for Population Densities

Let \( N_1 \), \( N_2 \) be the population densities (atoms/m³) in states 1 and 2. With total density \( N = N_1 + N_2 \):

\[ \frac{dN_2}{dt} = B_{12} \rho N_1 - B_{21} \rho N_2 - A_{21} N_2 \]
\[ \frac{dN_1}{dt} = -\frac{dN_2}{dt} \]

At steady state, solving for the population difference \( \Delta N = N_2 - N_1 \):
\[ \Delta N = -N \frac{A_{21}}{A_{21} + 2B_{21}\rho} \]

For a two-level system, \( \Delta N < 0 \) always: stimulated emission can at most equalize populations but cannot achieve **population inversion** (\( N_2 > N_1 \)). This is why two-level lasers are not feasible — we need three or four levels.

---

# Chapter 3: Laser Gain and Oscillation

## 3.1 Population Inversion and Gain

<div class="definition">
<strong>Population inversion:</strong> A non-equilibrium state in which \( N_2 > N_1 \) for two levels of interest. Required for net stimulated emission (amplification) to exceed absorption. Not achievable in a two-level system by optical pumping alone.
</div>

**Small-signal gain coefficient**:
\[ g(\omega) = \sigma(\omega) \Delta N \]
where \( \sigma(\omega) \) is the **stimulated emission cross-section** (m²) and \( \Delta N = N_2 - N_1 \). When \( \Delta N > 0 \), \( g > 0 \): the medium amplifies the field.

The cross-section is related to the Einstein B-coefficient:
\[ \sigma(\omega) = \frac{\hbar \omega}{c} B_{21} g(\omega) \]
where \( g(\omega) \) here is the normalized lineshape function (not gain).

## 3.2 Three-Level Laser System

**Example**: Ruby (\( \text{Cr}^{3+}:\text{Al}_2\text{O}_3 \)) — Maiman's first laser (1960).

1. **Pumping**: atoms are pumped from level 1 (ground) to a broad upper pump band (level 3) by flash lamp.
2. **Rapid non-radiative decay**: level 3 → level 2 (upper laser level) via phonon emission (fast).
3. **Lasing transition**: level 2 → level 1 (lower laser level = ground state) with emission at the laser wavelength.

**Problem**: the lower laser level is the ground state, so more than half the atoms must be pumped out of the ground state to achieve inversion. High pump threshold.

Rate equations for three-level system. At pump rate \( R_p \) (into level 2):
\[ \frac{dN_2}{dt} = R_p N_1 - \frac{N_2}{\tau_{21}} - B \rho \Delta N \]

Threshold condition: \( R_p > 1/(2\tau_{21}) \) for inversion.

## 3.3 Four-Level Laser System

**Example**: Nd:YAG, He-Ne, CO₂.

1. Ground state (level 0) → pump band (level 3): fast pumping.
2. Level 3 → upper laser level (level 2): fast non-radiative decay.
3. **Lasing transition**: level 2 → lower laser level (level 1).
4. Level 1 → ground state (level 0): fast non-radiative decay, **keeping level 1 nearly empty**.

Advantage: lower laser level is essentially empty → inversion achieved with much lower pump power than three-level system. Most practical lasers use four-level or quasi-four-level schemes.

<div class="remark">
The spontaneous emission lifetime \( \tau_{21} \) of the upper laser level should be <em>long</em> (metastable level) so that population can accumulate before stimulated emission depletes it. This is satisfied by laser transitions involving forbidden or weakly allowed transitions.
</div>

## 3.4 Saturation of the Gain and Laser Oscillation

With increasing photon flux \( \phi \), the population inversion decreases (gain saturation):
\[ g(\phi) = \frac{g_0}{1 + \phi/\phi_s} \]
where \( g_0 \) is the small-signal gain and \( \phi_s \) is the **saturation photon flux**.

**Laser threshold**: the gain medium must compensate all cavity losses per round trip. The threshold condition is:
\[ G_{rt} = \exp\!\left[ 2 g_0 L \right] \geq \frac{1}{(1-T)(1-\alpha_i)^2} \]
or in simplified form:
\[ g_0 \geq \frac{\delta_{total}}{2L} \]
where \( \delta_{total} \) captures all round-trip loss (output coupling, internal scattering, absorption, diffraction).

Above threshold, the photon flux builds up until gain saturation clamps \( g(\phi) = \delta_{total}/2L \). This is the **steady-state operating point**.

---

# Chapter 4: Coherence

## 4.1 What is Coherence?

<div class="definition">
<strong>Coherence</strong> is a measure of the statistical correlation between the electromagnetic field at different times (temporal coherence) or different spatial points (spatial coherence).
</div>

Coherence determines whether a light source can produce stable interference fringes and is the key property distinguishing laser light from thermal (incoherent) sources.

## 4.2 Temporal Coherence

<div class="definition">
<strong>Temporal coherence</strong> is quantified by the <strong>coherence time</strong> \( \tau_c \) — the characteristic time over which the field maintains a definite phase relationship with itself:
\[ \tau_c \approx \frac{1}{\Delta \nu} \]
where \( \Delta \nu \) is the spectral bandwidth (FWHM). The corresponding <strong>coherence length</strong> is \( \ell_c = c \tau_c \).
</div>

**CW lasers**: single-mode He-Ne laser has \( \Delta \nu \sim 1 \, \text{kHz} \), giving \( \ell_c \sim 300 \, \text{km} \). Thermal source (sodium lamp): \( \Delta \nu \sim 1 \, \text{GHz} \), \( \ell_c \sim 30 \, \text{cm} \).

**Pulsed lasers**: For transform-limited pulses (minimum time-bandwidth product), the coherence time equals the pulse duration:
\[ \Delta \nu \cdot \Delta t \geq \frac{K}{2\pi} \]
where \( K \sim 0.44 \) (Gaussian pulse). A 1 ps transform-limited pulse has \( \Delta \nu \sim 440 \, \text{GHz} \).

The **time-bandwidth product** is a Fourier relationship: shorter pulses require broader spectra. This is not an uncertainty principle but a classical wave property.

## 4.3 Spatial Coherence

<div class="definition">
<strong>Spatial coherence</strong> is quantified by the <strong>coherence area</strong> \( A_c \) — the transverse area over which the field is correlated. Related to the far-field divergence angle \( \theta_d \) by the van Cittert–Zernike theorem.
</div>

A spatially coherent source can be **collimated** into a parallel beam (small divergence). Lasers in the fundamental TEM₀₀ mode have essentially perfect spatial coherence.

**Laser collimation**: The fundamental mode of a laser is a Gaussian beam, which has the minimum possible divergence for a given beam waist:
\[ \theta_d = \frac{\lambda}{\pi w_0} \quad \text{(half-angle)} \]

Thermal sources (incandescent bulbs) have negligible spatial coherence: light is emitted from many independent emitters; diverges in all directions; cannot be focused to a diffraction-limited spot.

---

# Chapter 5: Laser Cavities — Stability and Modes

## 5.1 The Optical Resonator

A laser cavity (resonator) consists of two or more mirrors that trap light and provide feedback for amplification. Most common: **Fabry-Pérot cavity** with two mirrors separated by length \( L \).

**Functions**:
1. Provides optical feedback (recirculates photons through the gain medium).
2. Selects cavity modes (specific frequencies and spatial profiles are supported).
3. Determines the output beam properties.

## 5.2 Cavity Stability

For a cavity to support a stable oscillating mode (rather than losing the beam to diffraction), the round-trip ABCD ray matrix must have a trace satisfying:
\[ -1 \leq \frac{A+D}{2} \leq 1 \]

This is the **stability condition**. For a two-mirror cavity with radii of curvature \( R_1, R_2 \) and length \( L \), define the **g-parameters**:
\[ g_1 = 1 - \frac{L}{R_1}, \quad g_2 = 1 - \frac{L}{R_2} \]

**Stability condition**: \( 0 \leq g_1 g_2 \leq 1 \).

Special cases:

| Configuration | \( g_1, g_2 \) | Stability |
|--------------|--------------|---------|
| Plane–plane | 1, 1 | Marginally stable |
| Concentric | −1, −1 | Marginally stable |
| Confocal | \( g_1 = g_2 = 0 \) | Marginally stable (but robust to misalignment) |
| Hemispherical | \( g_1 = 1, g_2 = 0 \) | Marginally stable |
| General curved | Various | Stable if \( 0 < g_1 g_2 < 1 \) |

<div class="remark">
The confocal cavity has both foci at the cavity centre, giving the lowest diffraction losses and most robust alignment — important for early laser development. Modern lasers often use near-hemispherical or near-concentric geometries optimized for specific mode volumes.
</div>

## 5.3 Cavity Modes

**Longitudinal (axial) modes**: Standing waves along the cavity axis. Resonant frequencies:
\[ \nu_q = \frac{qc}{2L}, \quad q = 1, 2, 3, \ldots \]
Mode spacing: \( \Delta\nu_{FSR} = c/(2L) \) (free spectral range). For \( L = 30 \, \text{cm} \), \( \Delta\nu_{FSR} = 500 \, \text{MHz} \).

The laser will oscillate at longitudinal modes whose frequency falls within the **gain bandwidth** of the medium. Single-mode operation (one longitudinal mode) is achieved by short cavities or intracavity etalons.

**Transverse (spatial) modes — TEM₍ₘₙ₎**: Spatial intensity patterns across the beam cross-section, labelled by indices \( m, n \) (Hermite-Gaussian) or \( p, l \) (Laguerre-Gaussian). The **TEM₀₀** mode is Gaussian (no nodes) and has the highest beam quality (\( M^2 = 1 \)).

Higher-order modes have larger cross-sections and more complex spatial structure; apertures inside the cavity preferentially suppress higher-order modes.

---

# Chapter 6: Confocal Cavity

## 6.1 Confocal Resonator Analysis

The confocal resonator has mirrors of equal radius of curvature \( R \) separated by \( L = R \). The foci of both mirrors coincide at the cavity midplane.

For the confocal cavity, \( g_1 = g_2 = 0 \), so \( g_1 g_2 = 0 \) — on the boundary of stability. Despite marginal stability, it is practically useful because small misalignments do not dramatically increase loss.

**Mode spot size** at the mirrors:
\[ w_m = \left( \frac{\lambda L}{2\pi} \right)^{1/2} \left( 2g_1 g_2 - g_1 - g_2 + \ldots \right)^{1/2} \]

For the confocal case specifically, the waist is at the centre of the cavity with:
\[ w_0 = \sqrt{\frac{\lambda L}{2\pi}} \]

## 6.2 Etalon as a Wavelength Selector

A **Fabry-Pérot etalon** (two parallel, partially reflecting surfaces separated by thickness \( d \)) inside the cavity acts as an additional frequency filter. Its transmission peaks at:
\[ \nu_m = \frac{mc}{2nd\cos\theta}, \quad m = 0, 1, 2, \ldots \]

By tilting the etalon or choosing \( d \) such that only one etalon peak falls within one cavity mode spacing, single longitudinal mode operation is achieved.

The **finesse** of the etalon:
\[ \mathcal{F} = \frac{\pi \sqrt{R_e}}{1 - R_e} \]
determines the ratio of free spectral range to linewidth, and hence the selectivity.

---

# Chapter 7: Gaussian Beams

## 7.1 The Paraxial Wave Equation

The Helmholtz equation \( \nabla^2 E + k^2 E = 0 \) has exact plane-wave solutions, but laser beams are not infinite plane waves. In the **paraxial approximation** (beam divergence \( \ll 1 \) rad), substitute \( E = u(x,y,z) e^{ikz} \) and drop the \( \partial^2 u/\partial z^2 \) term:
\[ \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + 2ik \frac{\partial u}{\partial z} = 0 \]

The simplest solution is the **Gaussian beam** (TEM₀₀ mode).

## 7.2 The Gaussian Beam

<div class="definition">
A <strong>Gaussian beam</strong> is a beam whose transverse intensity profile is a Gaussian function. Its key parameters are the <strong>beam waist</strong> \( w_0 \) (minimum spot radius at \( z = 0 \)) and the <strong>Rayleigh range</strong> \( z_R = \pi w_0^2 / \lambda \).
</div>

The electric field of a Gaussian beam propagating along \( z \):
\[ E(r, z) = E_0 \frac{w_0}{w(z)} \exp\!\left( -\frac{r^2}{w(z)^2} \right) \exp\!\left( -ikz - ik\frac{r^2}{2R(z)} + i\zeta(z) \right) \]

where:
- **Beam radius** at position \( z \): \( w(z) = w_0 \sqrt{1 + (z/z_R)^2} \)
- **Radius of curvature** of the wavefront: \( R(z) = z\left[1 + (z_R/z)^2\right] \)
- **Gouy phase**: \( \zeta(z) = \arctan(z/z_R) \)

The intensity profile: \( I(r,z) \propto \exp\!\left(-2r^2/w(z)^2\right) \)

Key properties:
- At \( z = 0 \): minimum beam radius \( w_0 \), planar wavefront (\( R \to \infty \)).
- For \( z \gg z_R \): beam diverges as \( w(z) \approx w_0 z/z_R = \frac{\lambda z}{\pi w_0} \), half-angle \( \theta \approx \lambda/(\pi w_0) \).
- The **depth of focus** (confocal parameter) is \( 2z_R = 2\pi w_0^2/\lambda \).

<div class="theorem">
<strong>Diffraction limit:</strong> For a Gaussian beam, the product of beam waist and far-field divergence angle achieves the minimum possible value: \( w_0 \theta = \lambda/\pi \). This defines the beam quality parameter \( M^2 = 1 \) for the ideal Gaussian beam. Real beams have \( M^2 \geq 1 \).
</div>

---

# Chapter 8: Gaussian Beam Propagation and ABCD Matrices

## 8.1 The Complex Beam Parameter

It is convenient to describe Gaussian beam propagation using the **complex beam parameter** (q-parameter):
\[ \frac{1}{q(z)} = \frac{1}{R(z)} - i\frac{\lambda}{\pi w(z)^2} \]

At the waist: \( 1/q_0 = -i\lambda/(\pi w_0^2) = -i/z_R \), so \( q_0 = iz_R \).

Free-space propagation by distance \( d \): \( q(z+d) = q(z) + d \).

## 8.2 Ray Transfer (ABCD) Matrices

Paraxial optical systems (lenses, mirrors, interfaces) are described by \( 2\times 2 \) **ray transfer matrices** acting on the column vector \( \begin{pmatrix} r \\ r' \end{pmatrix} \) (ray height and slope):
\[ \begin{pmatrix} r_2 \\ r_2' \end{pmatrix} = \begin{pmatrix} A & B \\ C & D \end{pmatrix} \begin{pmatrix} r_1 \\ r_1' \end{pmatrix} \]

Common matrices:

| Element | ABCD matrix |
|---------|-------------|
| Free space (length \( d \)) | \( \begin{pmatrix} 1 & d \\ 0 & 1 \end{pmatrix} \) |
| Thin lens (focal length \( f \)) | \( \begin{pmatrix} 1 & 0 \\ -1/f & 1 \end{pmatrix} \) |
| Curved mirror (radius \( R \)) | \( \begin{pmatrix} 1 & 0 \\ -2/R & 1 \end{pmatrix} \) |
| Flat interface (indices \( n_1, n_2 \)) | \( \begin{pmatrix} 1 & 0 \\ 0 & n_1/n_2 \end{pmatrix} \) |

## 8.3 ABCD Law for Gaussian Beams

The q-parameter transforms through an ABCD system as:
\[ q_2 = \frac{Aq_1 + B}{Cq_1 + D} \]

This **bilinear (Möbius) transformation** fully describes Gaussian beam propagation through any sequence of paraxial optical elements.

**Application — focusing a Gaussian beam**:

A lens of focal length \( f \) transforms an incident beam with waist \( w_0 \) at distance \( d_1 \) from the lens to a new waist \( w_0' \) at distance \( d_2 \) beyond the lens:
\[ w_0' = \frac{f w_0}{\sqrt{(d_1 - f)^2 + z_R^2}} \]
\[ d_2 = f + \frac{(d_1 - f)f^2}{(d_1 - f)^2 + z_R^2} \]

When \( d_1 \gg z_R \) (beam much larger than Rayleigh range incident on lens):
\[ w_0' \approx \frac{f\lambda}{\pi w_1} \]
where \( w_1 = w(d_1) \) is the beam radius at the lens. To achieve the tightest focus, use a large input beam.

---

# Chapter 9: Lineshapes and Spectral Broadening

## 9.1 Homogeneous Broadening

<div class="definition">
<strong>Homogeneous broadening</strong> occurs when every atom in the gain medium sees the same perturbation, so all atoms have the same Lorentzian lineshape centred at the same frequency.
</div>

**Natural linewidth (lifetime broadening)**: Every excited state has a finite lifetime \( \tau = 1/(A_{21} + \text{other decays}) \). By the energy-time uncertainty relation, the transition has an intrinsic Lorentzian linewidth:
\[ \Delta\nu_N = \frac{1}{2\pi\tau} \]

**Pressure (collision) broadening**: Collisions interrupt the phase of the oscillating dipole, shortening the effective coherence time \( T_2 \) (dephasing time):
\[ \Delta\nu_{pressure} = \frac{1}{\pi T_2} \]

At high pressures, collisions dominate over natural linewidth.

Both natural and pressure broadening produce **Lorentzian** lineshapes:
\[ g(\nu) = \frac{\Delta\nu/(2\pi)}{(\nu - \nu_0)^2 + (\Delta\nu/2)^2} \]

## 9.2 Inhomogeneous Broadening

<div class="definition">
<strong>Inhomogeneous broadening</strong> occurs when different atoms have different resonance frequencies, so the observed lineshape is an envelope over a distribution of shifted homogeneous lines.
</div>

**Doppler broadening** (dominant in gases): Atoms moving with velocity \( v_z \) along the beam see a Doppler-shifted frequency:
\[ \nu' = \nu_0\left(1 + v_z/c\right) \]
The Maxwell-Boltzmann velocity distribution is Gaussian, giving a **Gaussian lineshape**:
\[ g_D(\nu) = \frac{2}{\Delta\nu_D}\sqrt{\frac{\ln 2}{\pi}} \exp\!\left[-4\ln 2\left(\frac{\nu - \nu_0}{\Delta\nu_D}\right)^2\right] \]
with Doppler width:
\[ \Delta\nu_D = \frac{2\nu_0}{c}\sqrt{\frac{2k_BT\ln 2}{M}} \]

The combination of homogeneous (Lorentzian) and inhomogeneous (Gaussian) broadening produces a **Voigt profile** (convolution of Lorentzian and Gaussian).

## 9.3 Spectral and Spatial Hole Burning

**Spectral hole burning** (inhomogeneous media): A strong monochromatic field saturates only those atoms whose Doppler-shifted frequency is resonant with the field. In the gain curve, a "hole" is burned at the oscillating frequency. A second weak probe experiences reduced gain only near that frequency. Allows multiple longitudinal modes to oscillate simultaneously in inhomogeneous media.

**Lamb dip**: In a bidirectional cavity, two counter-propagating modes interact with different velocity classes — except near line centre where both modes interact with the same \( v_z \approx 0 \) atoms. This creates a dip in the gain curve (Lamb dip) at line centre, useful for frequency stabilization.

**Spatial hole burning**: In a standing-wave cavity, the field intensity has nodes and antinodes along the cavity axis. The inversion is depleted at the antinodes but remains at the nodes → spatial periodicity in the population inversion → mode coupling, instabilities in single-mode operation. Eliminated in travelling-wave (ring) cavities or by using very short gain media.

---

# Chapter 10: Transient Behaviour and Q-Switching

## 10.1 Transient Laser Dynamics

When the laser is switched on, the photon density in the cavity undergoes **relaxation oscillations** before reaching steady state. The coupled rate equations for photon density \( \phi \) and population inversion \( \Delta N \):
\[ \frac{d\phi}{dt} = \left(\sigma c \Delta N - \frac{1}{\tau_c}\right)\phi + \frac{N_2}{\tau_{sp}} \]
\[ \frac{d\Delta N}{dt} = R_p - \frac{\Delta N}{\tau_{21}} - 2\sigma c \phi \Delta N \]

where \( \tau_c = L_{eff}/(\delta_{total} c) \) is the photon lifetime in the cavity.

Linearizing around steady state gives damped oscillations at frequency:
\[ \Omega_R \approx \sqrt{\frac{\phi_{ss}}{\tau_c \tau_{21}}} \]
Relaxation oscillation frequency is typically 100 kHz–1 MHz for solid-state lasers.

## 10.2 Q-Switching

<div class="definition">
<strong>Q-switching</strong> is a technique for producing short, high-peak-power laser pulses by modulating the <strong>quality factor</strong> \( Q \) of the cavity.
</div>

\( Q = 2\pi \nu \times (\text{stored energy})/(\text{power loss}) = \omega \tau_c \).

**Operating principle**:
1. **Low-Q phase**: The cavity Q is degraded (high loss) so lasing cannot occur. The pump continues to build up the population inversion far above threshold.
2. **Q-switch**: The loss is suddenly removed (Q switched to high). The large stored inversion leads to rapid build-up of photon density and a **giant pulse** (pulse width ~1–100 ns, peak power MW–GW).

**Q-switching methods**:
- **Rotating mirror** (mechanical): simple but limited repetition rate (~100 Hz).
- **Electro-optic (Pockels cell)**: voltage-controlled birefringence; fast (ns), precise timing.
- **Acousto-optic modulator**: RF-driven diffraction grating; moderate speed.
- **Saturable absorber** (passive Q-switch): absorber bleaches when intensity reaches threshold; self-triggered.

**Pulse energy and peak power**: The Q-switched pulse extracts most of the stored energy in the gain medium. For a four-level laser:
\[ E_{pulse} \approx h\nu \int \Delta N \, dV = h\nu (N_{2,\text{initial}} - N_{2,\text{final}}) V \]

Peak power is much higher than CW power because the energy of many round-trip times is released in a single pass through threshold.

---

# Chapter 11: Mode-Locking and Nonlinear Optics

## 11.1 Mode-Locking

<div class="definition">
<strong>Mode-locking</strong> is a technique in which all oscillating longitudinal modes of the laser cavity are forced into a fixed phase relationship. This produces a periodic train of very short pulses.
</div>

If \( N \) modes each with frequency \( \nu_q = \nu_0 + q\,\Delta\nu_{FSR} \) oscillate with equal amplitudes and phase \( \phi_q = q\varphi_0 \), the total field is:
\[ E(t) = E_0 \sum_{q=0}^{N-1} e^{i2\pi(\nu_0 + q\,\Delta\nu_{FSR})t} = E_0 e^{i2\pi\nu_0 t} \frac{\sin(N\pi\Delta\nu_{FSR} t)}{\sin(\pi\Delta\nu_{FSR} t)} \]

This is a **pulse train** with:
- **Repetition rate**: \( f_{rep} = \Delta\nu_{FSR} = c/(2L) \) (one pulse per round trip).
- **Pulse duration**: \( \Delta t \approx 1/(N\,\Delta\nu_{FSR}) = 1/\Delta\nu_{gain} \) (inverse of total gain bandwidth).
- **Peak power**: \( N^2 \times \) the average power.

**Mode-locking methods**:
- **Active mode-locking**: an intracavity modulator at the round-trip frequency \( f_{rep} \) periodically modulates the gain or loss → sidebands couple modes.
- **Passive mode-locking (saturable absorber or Kerr lens)**: a nonlinear element preferentially amplifies the most intense part of the circulating field → self-consistent pulse formation.

**Typical pulse durations**:

| Laser medium | Bandwidth | Minimum pulse |
|-------------|---------|--------------|
| Nd:YAG | ~120 GHz | ~10 ps |
| Ti:Sapphire | ~100 THz | ~5 fs |
| Dye laser | ~10 THz | ~100 fs |

**Chirped Pulse Amplification (CPA)** — Strickland & Mourou (1985, Nobel Prize 2018): To amplify ultrashort pulses to very high energy without destroying the gain medium by nonlinear effects:
1. Stretch the pulse in time by a factor \( \sim 10^3 \)–\( 10^4 \) using a diffraction grating pair (introducing frequency-dependent group delay → **chirp**).
2. Amplify the stretched, low-peak-power pulse in the gain medium.
3. Recompress the amplified pulse with a matched grating pair → restore short pulse with greatly increased energy.

This enables table-top lasers with peak intensities \( > 10^{20} \, \text{W/cm}^2 \).

## 11.2 Introduction to Nonlinear Optics

### 11.2.1 Why Lasers Enabled Nonlinear Optics

In linear optics, the polarization \( P \) of a medium is proportional to the electric field: \( P = \varepsilon_0 \chi E \). Nonlinear effects arise when \( E \) is large enough that higher-order terms matter:
\[ P = \varepsilon_0 \left( \chi^{(1)} E + \chi^{(2)} E^2 + \chi^{(3)} E^3 + \ldots \right) \]

The ratio of nonlinear to linear response is \( \chi^{(2)} E / \chi^{(1)} \sim E/E_{at} \), where \( E_{at} \sim 10^{11} \, \text{V/m} \) is the atomic field. Thermal light sources have \( E \ll E_{at} \); laser beams can approach and exceed this.

**First observation**: Franken et al. (1961) frequency-doubled a ruby laser in quartz crystal — detected UV at twice the optical frequency. This confirmed \( \chi^{(2)} \neq 0 \) for non-centrosymmetric crystals.

### 11.2.2 Second-Harmonic Generation (SHG / Frequency Doubling)

The \( \chi^{(2)} \) term produces a polarization at \( 2\omega \) when driven at \( \omega \):
\[ P^{(2)}(2\omega) = \varepsilon_0 \chi^{(2)} E(\omega)^2 \]

This acts as a source for a new field at \( 2\omega \).

**Phase matching** is required for efficient SHG: the wavevectors of fundamental and harmonic must be matched:
\[ \Delta k = k(2\omega) - 2k(\omega) = 0 \]
Since most materials are normally dispersive (\( n(2\omega) > n(\omega) \)), phase matching requires **birefringent phase matching** (using different polarization directions in anisotropic crystals) or **quasi-phase matching** (periodic poling of the nonlinear coefficient).

**Conversion efficiency** grows as \( L^2 \) (for perfect phase matching) where \( L \) is the crystal length, making high intensity (tight focusing) and long crystals advantageous.

### 11.2.3 Other \( \chi^{(2)} \) and \( \chi^{(3)} \) Processes

| Process | Order | Description |
|---------|-------|-------------|
| SHG | \( \chi^{(2)} \) | \( \omega + \omega \to 2\omega \) |
| Sum-frequency generation (SFG) | \( \chi^{(2)} \) | \( \omega_1 + \omega_2 \to \omega_3 \) |
| Difference-frequency generation (DFG) | \( \chi^{(2)} \) | \( \omega_1 - \omega_2 \to \omega_3 \) |
| Optical parametric amplification (OPA) | \( \chi^{(2)} \) | Amplifies \( \omega_s, \omega_i \) from pump \( \omega_p \) |
| Self-phase modulation (SPM) | \( \chi^{(3)} \) | Intensity-dependent phase → spectral broadening |
| Stimulated Raman scattering | \( \chi^{(3)} \) | Inelastic photon scattering via molecular vibrations |
| Kerr effect (intensity-dependent \( n \)) | \( \chi^{(3)} \) | \( n = n_0 + n_2 I \) → self-focusing, filamentation |

The Kerr effect in optical fibers (\( n_2 \approx 2.6 \times 10^{-20} \, \text{m}^2/\text{W} \)) combined with dispersion management is the basis of **soliton propagation** and ultrafast fiber lasers.
