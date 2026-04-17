---
title: "PHYS 393: Physical Optics"
subjects: "PHYS"
prof: "Kazi Rajibul Islam"
---

## Sources and References

**Primary textbook** — Hecht, E., *Optics*, 5th ed. (Pearson, 2017). Chapters 3, 7–13.

**Supplementary texts** — Goodman, J. W., *Introduction to Fourier Optics*, 4th ed. (W. H. Freeman, 2017); Born, M. and Wolf, E., *Principles of Optics*, 7th ed. (Cambridge University Press, 1999); Saleh, B. E. A. and Teich, M. C., *Fundamentals of Photonics*, 3rd ed. (Wiley, 2019); Bracewell, R. N., *The Fourier Transform and Its Applications*, 3rd ed. (McGraw-Hill, 2000).

**Online resources** — Fitzpatrick, R., *Classical Electromagnetism*, farside.ph.utexas.edu; MIT OpenCourseWare 8.03 (Physics III: Vibrations and Waves); HyperPhysics, hyperphysics.phy-astr.gsu.edu.

---

# Chapter 1: Electromagnetic Foundations of Physical Optics

## 1.1 Maxwell's Equations in Matter

Physical optics rests on the electromagnetic theory of light — the recognition, due to Maxwell (1865), that light is a propagating disturbance in the electromagnetic field. To understand the interaction of light with matter — which underlies dispersion, absorption, reflection, refraction, and birefringence — we must treat the medium as more than a passive backdrop.

In matter, the full Maxwell equations involve two auxiliary fields: the **electric displacement** \(\mathbf{D} = \varepsilon_0\mathbf{E} + \mathbf{P}\) (where \(\mathbf{P}\) is the polarisation density — the dipole moment per unit volume of the material) and the **magnetic field** \(\mathbf{H} = \mathbf{B}/\mu_0 - \mathbf{M}\) (where \(\mathbf{M}\) is the magnetisation density). For linear, isotropic, non-magnetic optical media (\(\mathbf{M} = 0\)), we have \(\mathbf{P} = \varepsilon_0\chi_e\mathbf{E}\) where \(\chi_e\) is the **electric susceptibility**, and \(\mathbf{D} = \varepsilon_0(1+\chi_e)\mathbf{E} = \varepsilon\mathbf{E}\) with \(\varepsilon = \varepsilon_0 n^2\). The refractive index is \(n = \sqrt{1+\chi_e}\).

The wave equation for the electric field in a linear, isotropic medium follows from Maxwell's equations in the same way as in vacuum, but with \(\varepsilon_0\) replaced by \(\varepsilon\) and wave speed \(v = c/n\). When \(\chi_e\) (and thus \(n\)) depends on frequency, we have **dispersion** — different frequencies propagate at different speeds. When \(n\) depends on polarisation direction, we have **birefringence**. When \(n\) is complex (\(\tilde{n} = n + i\kappa\)), the imaginary part \(\kappa\) describes **absorption** or **gain**.

## 1.2 Plane Wave Propagation and the Wave Vector

A monochromatic plane wave propagating in direction \(\hat{k}\) in a medium of complex refractive index \(\tilde{n} = n + i\kappa\) is:

\[
\mathbf{E} = \mathbf{E}_0\,\exp\!\left[i\!\left(\mathbf{k}\cdot\mathbf{r} - \omega t\right)\right]
\]

where the complex wave vector has magnitude \(\tilde{k} = \tilde{n}\omega/c = (n + i\kappa)\omega/c\). Writing this out for propagation in the \(z\)-direction:

\[
\mathbf{E} = \mathbf{E}_0\,e^{-\kappa\omega z/c}\,e^{i(n\omega z/c - \omega t)}
\]

The factor \(e^{-\kappa\omega z/c}\) shows that the amplitude decays exponentially in the direction of propagation. The intensity (proportional to \(|E|^2\)) decays as \(e^{-\alpha z}\) where the **absorption coefficient** is:

\[
\alpha = \frac{2\kappa\omega}{c} = \frac{4\pi\kappa}{\lambda_0}
\]

This is the **Beer-Lambert law**: \(I(z) = I_0 e^{-\alpha z}\). The characteristic penetration depth (skin depth for optical absorption) is \(\delta = 1/\alpha\). For metals in the visible range, \(\delta \sim 10\) nm — which is why thin metal films are opaque and why electromagnetic shielding by metal enclosures is effective at optical frequencies.

## 1.3 Energy and Momentum in Electromagnetic Fields

The energy density of an electromagnetic field in a medium is:

\[
u = \frac{1}{2}\varepsilon E^2 + \frac{1}{2\mu}B^2
\]

and the energy flux (power per unit area) is the Poynting vector:

\[
\mathbf{S} = \mathbf{E}\times\mathbf{H} = \frac{1}{\mu}\mathbf{E}\times\mathbf{B}
\]

For a plane wave, the time-averaged intensity is \(I = \langle|\mathbf{S}|\rangle = \frac{n}{2\mu_0 c}|E_0|^2 = \frac{c\varepsilon_0 n}{2}|E_0|^2\). The momentum density of the electromagnetic field is \(\mathbf{g} = \mathbf{S}/c^2 = \mathbf{E}\times\mathbf{B}/(\mu_0 c^2)\), giving a radiation pressure \(P_\text{rad} = I/c\) for complete absorption. This **radiation pressure** is not merely a theoretical curiosity: it is used in **laser cooling and trapping** of atoms, where the momentum kicks from photon absorption and emission can slow and confine atoms to microkelvin temperatures.

---

# Chapter 2: Dispersion — The Lorentz Oscillator Model

## 2.1 Microscopic Model of Dispersion

The **Lorentz oscillator model** provides a classical (but remarkably accurate) description of dispersion and absorption. In this model, each atom contains electrons bound to the nucleus by a restoring force, treated as a harmonic oscillator with natural frequency \(\omega_0\) (corresponding to an atomic resonance frequency). An incident electromagnetic wave drives each electron, producing oscillating dipole moments that add to the driving field — the response of the medium.

The equation of motion for a bound electron in the presence of a driving electric field \(E = E_0 e^{-i\omega t}\) (using complex notation):

\[
m_e\ddot{x} + m_e\gamma\dot{x} + m_e\omega_0^2 x = -eE_0 e^{-i\omega t}
\]

where \(\gamma\) is a damping rate (accounting for radiation reaction and collisions) and \(-e\) is the electron charge. The steady-state solution is:

\[
x(t) = \frac{-e E_0/m_e}{\omega_0^2 - \omega^2 - i\gamma\omega}\,e^{-i\omega t}
\]

The complex amplitude shows the Lorentzian resonance familiar from driven oscillators: maximum response (absorption) near \(\omega = \omega_0\), with the response dropping off on either side. The **dipole moment** per electron is \(p = -ex = \frac{e^2 E_0/m_e}{\omega_0^2 - \omega^2 - i\gamma\omega}\,e^{-i\omega t}\).

## 2.2 Complex Susceptibility and Refractive Index

For a medium with \(N\) oscillators per unit volume with natural frequency \(\omega_0\), the polarisation density is \(\mathbf{P} = N(-e)\mathbf{x}\). The complex susceptibility is:

\[
\tilde{\chi}_e(\omega) = \frac{Ne^2}{\varepsilon_0 m_e}\,\frac{1}{\omega_0^2 - \omega^2 - i\gamma\omega}
\]

The complex refractive index is \(\tilde{n}^2 = 1 + \tilde{\chi}_e\). For dilute media (\(|\chi_e| \ll 1\)), \(\tilde{n} \approx 1 + \tilde{\chi}_e/2\), giving:

\[
n(\omega) \approx 1 + \frac{Ne^2}{2\varepsilon_0 m_e}\,\frac{\omega_0^2 - \omega^2}{(\omega_0^2-\omega^2)^2+\gamma^2\omega^2}
\]

\[
\kappa(\omega) \approx \frac{Ne^2}{2\varepsilon_0 m_e}\,\frac{\gamma\omega}{(\omega_0^2-\omega^2)^2+\gamma^2\omega^2}
\]

The real part \(n(\omega)\) determines the phase velocity; the imaginary part \(\kappa(\omega)\) determines absorption. These two are related by the **Kramers-Kronig relations** — integral relations that follow from causality (the material cannot respond before the field arrives). The most important form:

\[
n(\omega) - 1 = \frac{2}{\pi}\,\mathcal{P}\int_0^\infty \frac{\omega'\kappa(\omega')}{\omega'^2 - \omega^2}\,d\omega'
\]

(where \(\mathcal{P}\) denotes the Cauchy principal value). This says that the real and imaginary parts of the susceptibility are not independent — knowing the absorption spectrum at all frequencies determines the refractive index spectrum, and vice versa. This is the physical content of the **dispersion relations** in optics.

## 2.3 Normal and Anomalous Dispersion

Far from resonance, \(\kappa \approx 0\) (transparent medium) and:

\[
n(\omega) \approx 1 + \frac{Ne^2}{2\varepsilon_0 m_e(\omega_0^2 - \omega^2)}
\]

For \(\omega < \omega_0\): \(n > 1\) and \(dn/d\omega > 0\) — **normal dispersion** (higher frequency = higher refractive index). This is the case for most glasses in the visible range, where the nearest UV resonance is at \(\omega_0 > \omega_\text{visible}\). For \(\omega > \omega_0\): \(n\) decreases with increasing frequency — anomalous dispersion in the region of absorption. In real media with multiple resonances, the dispersion can be complex — the Sellmeier equation provides a multi-resonance empirical fit:

\[
n^2(\lambda) = 1 + \sum_j \frac{B_j\lambda^2}{\lambda^2 - C_j}
\]

## 2.4 Phase and Group Velocity

In a dispersive medium, different frequency components of a pulse travel at different speeds. The **phase velocity** is the speed at which surfaces of constant phase propagate:

\[
v_\phi = \frac{\omega}{k} = \frac{c}{n(\omega)}
\]

A pulse (modulated wave) travels at the **group velocity**:

\[
v_g = \frac{d\omega}{dk} = c\left(n + \omega\,\frac{dn}{d\omega}\right)^{-1} = \frac{c}{n_g}
\]

where \(n_g = n + \omega\,dn/d\omega = n - \lambda\,dn/d\lambda\) is the **group index**. In normal dispersion regions (\(dn/d\omega > 0\)): \(n_g > n\) and \(v_g < v_\phi < c\). In anomalous dispersion regions: \(v_g\) can exceed \(c\) near resonances, but this does not violate special relativity because a pulse of light cannot carry information faster than \(c\) — the pulse front (which carries information) propagates at the **front velocity** \(c\), regardless of the group velocity.

**Group velocity dispersion (GVD)** describes how the group velocity itself varies with frequency:

\[
\beta_2 = \frac{d^2k}{d\omega^2} = \frac{d(1/v_g)}{d\omega}
\]

GVD causes a pulse to broaden in time as it propagates — different frequency components drift apart. This is the dominant limitation on the data rate in optical fibre communications: a short pulse spreads, eventually merging with adjacent pulses and causing **intersymbol interference**. Modern optical communications systems operate near the **zero-dispersion wavelength** of silica fibre (around 1310 nm) or use **dispersion-shifted fibre** and **dispersion compensation modules**.

---

# Chapter 3: Fresnel Equations and Thin Films

## 3.1 Boundary Conditions and the Fresnel Coefficients

The Fresnel equations are derived by applying the electromagnetic boundary conditions — continuity of the tangential components of \(\mathbf{E}\) and \(\mathbf{H}\), and continuity of the normal components of \(\mathbf{D}\) and \(\mathbf{B}\) — at a planar interface between two homogeneous, isotropic media with refractive indices \(n_1\) and \(n_2\). The derivation is most systematic for the two principal polarisation states separately.

**Setup:** A plane wave in medium 1 is incident at angle \(\theta_i\) to the interface normal. By Snell's law, the refracted wave in medium 2 makes angle \(\theta_t\) with the normal, where \(n_1\sin\theta_i = n_2\sin\theta_t\). We define the amplitude reflection and transmission coefficients (\(r\) and \(t\)) as the ratios of reflected and transmitted electric field amplitudes to the incident amplitude.

<div class="proof">
<strong>Derivation for s-polarisation (TE).</strong> For s-polarisation, the electric field is perpendicular to the plane of incidence (i.e., parallel to the interface). Let \(E_i\), \(E_r\), \(E_t\) be the complex amplitudes of incident, reflected, and transmitted E-fields, all in the \(\hat{s}\) direction.

Continuity of tangential \(\mathbf{E}\): \(E_i + E_r = E_t\). \quad (i)

The magnetic field \(\mathbf{H}\) lies in the plane of incidence. For a plane wave, \(|\mathbf{H}| = n|\mathbf{E}|/(\mu_0 c)\). The tangential component of \(\mathbf{H}\) is \(H_t = (n/\mu_0 c)\cos\theta \cdot E\). Continuity of tangential \(\mathbf{H}\) (taking care of sign: the reflected wave's H-field has its tangential component reversed):

\[
\frac{n_1\cos\theta_i}{\mu_0 c}(E_i - E_r) = \frac{n_2\cos\theta_t}{\mu_0 c}E_t \quad \Rightarrow \quad n_1\cos\theta_i(E_i - E_r) = n_2\cos\theta_t\,E_t. \quad (ii)
\]

From (i): \(E_t = E_i + E_r\). Substitute into (ii): \(n_1\cos\theta_i(E_i - E_r) = n_2\cos\theta_t(E_i + E_r)\). Solve for \(E_r/E_i\):

\[
r_s = \frac{E_r}{E_i} = \frac{n_1\cos\theta_i - n_2\cos\theta_t}{n_1\cos\theta_i + n_2\cos\theta_t}
\]

Solve for \(E_t/E_i\):

\[
t_s = \frac{E_t}{E_i} = \frac{2n_1\cos\theta_i}{n_1\cos\theta_i + n_2\cos\theta_t}
\]

Note: \(t_s = 1 + r_s\) — this follows from boundary condition (i) and confirms consistency.
</div>

The p-polarisation (TM) coefficients are derived similarly, giving:

\[
r_p = \frac{n_2\cos\theta_i - n_1\cos\theta_t}{n_2\cos\theta_i + n_1\cos\theta_t}, \qquad t_p = \frac{2n_1\cos\theta_i}{n_2\cos\theta_i + n_1\cos\theta_t}
\]

The power reflectances are \(R_s = |r_s|^2\) and \(R_p = |r_p|^2\); the power transmittances are \(T_s = (n_2\cos\theta_t)/(n_1\cos\theta_i)|t_s|^2\) and \(T_p = (n_2\cos\theta_t)/(n_1\cos\theta_i)|t_p|^2\). Energy conservation \(R + T = 1\) holds for each polarisation.

## 3.2 Physical Consequences of the Fresnel Equations

**Normal incidence** (\(\theta_i = 0\)): \(\theta_t = 0\), and the two polarisations are degenerate:

\[
r = \frac{n_1 - n_2}{n_1 + n_2}, \quad t = \frac{2n_1}{n_1 + n_2}, \quad R = \left(\frac{n_1-n_2}{n_1+n_2}\right)^2
\]

For glass (\(n = 1.5\)) in air: \(R = (0.5/2.5)^2 = 0.04\) = 4% per surface. A glass lens with two surfaces reflects about 8% of normally incident light.

**Phase shift on reflection**: for external reflection (\(n_2 > n_1\)), \(r_s < 0\) for all angles — the s-component of the reflected wave is phase-shifted by \(\pi\). For p-polarisation, \(r_p\) changes sign at Brewster's angle: for \(\theta_i < \theta_B\), \(r_p < 0\) (phase shift \(\pi\)), while for \(\theta_i > \theta_B\), \(r_p > 0\) (no phase shift). This phase behaviour has important consequences for the polarisation state of reflected light and for thin-film design.

**Brewster's angle:** \(r_p = 0\) when \(n_2\cos\theta_i = n_1\cos\theta_t\). Combined with Snell's law: \(\tan\theta_B = n_2/n_1\). At Brewster's angle, the reflected beam is 100% s-polarised. This principle is used in **laser cavities**: optical elements tilted at Brewster's angle to the beam introduce zero reflection loss for p-polarised light (thus selecting p-polarisation from the gain medium) while reflecting s-polarised light out of the cavity.

## 3.3 Anti-Reflection and High-Reflection Coatings

Thin-film coatings exploit interference between reflections from multiple interfaces to tailor the reflectance of optical surfaces. The **transfer matrix method** for thin films provides a systematic framework.

For a single thin film of refractive index \(n_1\) and thickness \(d_1\) sandwiched between semi-infinite media of index \(n_0\) (incident) and \(n_s\) (substrate), the reflection coefficient for normal incidence is:

\[
r = \frac{r_{01} + r_{12}\,e^{2i\delta}}{1 + r_{01}\,r_{12}\,e^{2i\delta}}
\]

where \(r_{01} = (n_0-n_1)/(n_0+n_1)\), \(r_{12} = (n_1-n_s)/(n_1+n_s)\), and \(\delta = 2\pi n_1 d_1/\lambda\) is the single-pass phase. For a **quarter-wave layer** (\(\delta = \pi/2\), \(d_1 = \lambda/(4n_1)\)):

\[
r = \frac{r_{01} + r_{12}(-1)}{1 + r_{01}\,r_{12}(-1)} = \frac{r_{01} - r_{12}}{1 - r_{01}\,r_{12}}
\]

Setting \(r = 0\) requires \(r_{01} = r_{12}\), i.e., \(n_1 = \sqrt{n_0 n_s}\). For glass (\(n_s = 1.52\)) in air (\(n_0 = 1\)): the ideal single-layer AR coating has \(n_1 = \sqrt{1.52} \approx 1.23\). The closest available material is magnesium fluoride (MgF\(_2\), \(n = 1.38\)), which gives a residual reflectance of about 1% — much better than the uncoated 4%.

**High-reflection (HR) coatings** use alternating quarter-wave layers of high-index (\(n_H\)) and low-index (\(n_L\)) materials. After \(N\) pairs, the reflectance is:

\[
R = \left(\frac{1 - (n_H/n_L)^{2N}(n_H^2/n_s)}{1 + (n_H/n_L)^{2N}(n_H^2/n_s)}\right)^2
\]

With \(N = 15\) pairs of TiO\(_2\) (\(n_H = 2.35\)) and SiO\(_2\) (\(n_L = 1.46\)), reflectances above 99.999% can be achieved — the "super-mirrors" used in cavity QED experiments and gravitational wave detectors (LIGO mirrors have \(R > 99.999\%\)).

---

# Chapter 4: Polarization — Jones Calculus and Mueller Matrices

## 4.1 Jones Vectors

For fully polarised, coherent light propagating in the \(z\)-direction, the electric field is:

\[
\mathbf{E}(z,t) = \text{Re}\!\left[\begin{pmatrix}E_x\\E_y\end{pmatrix}e^{i(kz-\omega t)}\right]
\]

The complex column vector \(\mathbf{E} = \begin{pmatrix}E_x\\E_y\end{pmatrix}\) is the **Jones vector**. The polarisation state is completely determined by the ratio \(E_y/E_x\) and by the relative phase. Normalised Jones vectors for common polarisation states:

| State | Jones vector |
|-------|-------------|
| Horizontal linear | \(\begin{pmatrix}1\\0\end{pmatrix}\) |
| Vertical linear | \(\begin{pmatrix}0\\1\end{pmatrix}\) |
| Linear at +45° | \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\1\end{pmatrix}\) |
| Right circular | \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\-i\end{pmatrix}\) |
| Left circular | \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\i\end{pmatrix}\) |

Any two orthogonal Jones vectors form a complete basis for the 2D polarisation space.

## 4.2 Jones Matrices

A **Jones matrix** is a \(2\times2\) complex matrix that transforms the input Jones vector to the output Jones vector for a polarisation-modifying optical element:

\[
\mathbf{E}_\text{out} = J\,\mathbf{E}_\text{in}
\]

For a sequence of optical elements, the system Jones matrix is the product of individual matrices:

\[
J_\text{sys} = J_N \cdots J_2 J_1
\]

Standard Jones matrices:

**Linear polariser** with transmission axis at angle \(\theta\) to \(x\):

\[
J_P(\theta) = \begin{pmatrix}\cos^2\theta & \sin\theta\cos\theta\\\sin\theta\cos\theta & \sin^2\theta\end{pmatrix}
\]

**Wave plate** with fast axis at \(\theta\) to \(x\) and phase retardation \(\Gamma\):

\[
J_W(\theta,\Gamma) = \begin{pmatrix}\cos^2\theta + e^{i\Gamma}\sin^2\theta & (1-e^{i\Gamma})\sin\theta\cos\theta \\ (1-e^{i\Gamma})\sin\theta\cos\theta & \sin^2\theta + e^{i\Gamma}\cos^2\theta\end{pmatrix}
\]

For \(\theta = 0\) (fast axis along \(x\)): \(J_W = \begin{pmatrix}1 & 0 \\ 0 & e^{i\Gamma}\end{pmatrix}\). Quarter-wave plate (\(\Gamma = \pi/2\)): \(J_\text{QWP} = \begin{pmatrix}1&0\\0&i\end{pmatrix}\). Half-wave plate (\(\Gamma = \pi\)): \(J_\text{HWP} = \begin{pmatrix}1&0\\0&-1\end{pmatrix}\).

<div class="example">
<strong>Example 4.1: Creating Circular Polarisation.</strong> Linearly polarised light at +45° passes through a quarter-wave plate with fast axis horizontal. What is the output polarisation state?

Input: \(\mathbf{E}_\text{in} = \frac{1}{\sqrt{2}}\begin{pmatrix}1\\1\end{pmatrix}\).

QWP Jones matrix (fast axis horizontal, \(\Gamma = \pi/2\)): \(J = \begin{pmatrix}1&0\\0&i\end{pmatrix}\).

Output: \(\mathbf{E}_\text{out} = \frac{1}{\sqrt{2}}\begin{pmatrix}1&0\\0&i\end{pmatrix}\begin{pmatrix}1\\1\end{pmatrix} = \frac{1}{\sqrt{2}}\begin{pmatrix}1\\i\end{pmatrix}\) — left circular polarisation.

Checking: for \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\i\end{pmatrix}\), the real electric field is \(\mathbf{E}(t) = \frac{E_0}{\sqrt{2}}(\cos\omega t\hat{x} - \sin\omega t\hat{y})\), which rotates clockwise (when looking toward the source) — left circular polarisation by convention.
</div>

## 4.3 Stokes Parameters and Mueller Matrices

Jones calculus handles fully polarised, coherent light. For partially polarised or incoherent light, we use the **Stokes parameter** formalism. The four Stokes parameters are:

\begin{align}
S_0 &= I_0 = \langle E_x^2 \rangle + \langle E_y^2 \rangle \quad \text{(total intensity)} \\
S_1 &= \langle E_x^2 \rangle - \langle E_y^2 \rangle \quad \text{(H vs.\ V polarisation difference)} \\
S_2 &= 2\langle E_x E_y\cos\delta \rangle \quad \text{(+45° vs.\ -45° difference)} \\
S_3 &= 2\langle E_x E_y\sin\delta \rangle \quad \text{(RCP vs.\ LCP difference)}
\end{align}

where \(\delta\) is the phase difference between \(x\) and \(y\) components and \(\langle\cdot\rangle\) denotes time averaging. For fully polarised light: \(S_0^2 = S_1^2 + S_2^2 + S_3^2\). The **degree of polarisation** \(P = \sqrt{S_1^2+S_2^2+S_3^2}/S_0 \in \left[0,1\right]\).

A **Mueller matrix** is a \(4\times4\) real matrix that transforms the input Stokes vector to the output Stokes vector: \(\mathbf{S}_\text{out} = M\,\mathbf{S}_\text{in}\). This formalism can handle depolarising elements, partial polarisers, and incoherent superpositions — situations that Jones calculus cannot treat.

---

# Chapter 5: Coherence Theory

## 5.1 Temporal Coherence and Coherence Length

**Coherence** is the property of a light field that allows it to produce observable interference. A strictly monochromatic wave is perfectly coherent — it can interfere with a delayed or spatially displaced version of itself for arbitrary delays and displacements. A real light source has finite bandwidth \(\Delta\nu\), and the coherence properties reflect this.

**Temporal coherence** characterises how well a light field is correlated with itself at different times. The **temporal coherence function** (self-coherence function) is:

\[
\Gamma(\tau) = \langle E^*(t)\,E(t+\tau)\rangle
\]

where \(\langle\cdot\rangle\) is a time average. The normalised version is the **complex degree of coherence** \(\gamma(\tau) = \Gamma(\tau)/\Gamma(0)\), with \(|\gamma(\tau)| \in \left[0,1\right]\). The **coherence time** \(\tau_c\) is the characteristic time over which \(|\gamma(\tau)|\) remains significantly non-zero:

\[
\tau_c \sim \frac{1}{\Delta\nu}
\]

The **coherence length** is \(L_c = c\tau_c = c/\Delta\nu = \lambda^2/\Delta\lambda\). For white light (\(\Delta\lambda \approx 300\) nm around 550 nm): \(L_c \approx 550^2/300 \approx 1\;\mu\)m — only about 2 wavelengths! For a HeNe laser (\(\Delta\nu \approx 1\) GHz in single mode): \(L_c \approx 30\) cm. For a stabilised single-mode laser (\(\Delta\nu \approx 1\) kHz): \(L_c \approx 300\) km.

The Wiener-Khinchin theorem relates the coherence function to the power spectral density:

\[
\Gamma(\tau) = \int_0^\infty S(\nu)\,e^{-2\pi i\nu\tau}\,d\nu
\]

This is the Fourier transform of the power spectrum — the coherence function and the spectrum are a Fourier transform pair. A narrow spectrum (monochromatic) gives a long coherence function; a broad spectrum gives a short coherence function.

## 5.2 Spatial Coherence and the van Cittert-Zernike Theorem

**Spatial coherence** characterises correlations between the field at two different spatial points at the same time. The **mutual coherence function** is:

\[
\Gamma(\mathbf{r}_1, \mathbf{r}_2; \tau) = \langle E^*(\mathbf{r}_1, t)\,E(\mathbf{r}_2, t+\tau)\rangle
\]

For \(\tau = 0\), this is the **mutual intensity** \(J(\mathbf{r}_1, \mathbf{r}_2)\). The normalised version is the **complex degree of coherence** \(\mu(\mathbf{r}_1, \mathbf{r}_2) = J(\mathbf{r}_1,\mathbf{r}_2)/\sqrt{J(\mathbf{r}_1,\mathbf{r}_1)J(\mathbf{r}_2,\mathbf{r}_2)}\), and the **spatial coherence radius** \(r_c\) is the characteristic separation over which \(|\mu| \gtrsim 1\).

<div class="theorem">
<strong>van Cittert-Zernike Theorem.</strong> The mutual intensity in the far field of an extended, spatially incoherent, quasi-monochromatic source is related to the Fourier transform of the source intensity distribution:

\[
J(\mathbf{r}_1, \mathbf{r}_2) \propto \int_\text{source} I(\boldsymbol{\rho})\,e^{ik\boldsymbol{\rho}\cdot(\mathbf{r}_1-\mathbf{r}_2)/z}\,d^2\rho
\]
where \(z\) is the source-observation distance and \(\boldsymbol{\rho}\) is a coordinate across the source.
</div>

For a uniform circular source of angular diameter \(\theta_s = D_s/z\) (where \(D_s\) is the source diameter and \(z\) is the distance), the spatial coherence function is the Airy pattern:

\[
|\mu(\Delta\mathbf{r})| = \left|\frac{2J_1(\pi D_s |\Delta\mathbf{r}|/\lambda z)}{\pi D_s|\Delta\mathbf{r}|/\lambda z}\right|
\]

The first zero of this gives the spatial coherence radius:

\[
r_c \approx 1.22\frac{\lambda z}{D_s} = \frac{1.22\lambda}{\theta_s}
\]

For the Sun (\(\theta_s \approx 0.5°\), \(\lambda = 500\) nm): \(r_c \approx 0.07\) mm — the Sun is a very spatially incoherent source, which is why sunlight does not form interference fringes. For a distant star (\(\theta_s \approx 0.05''\)): \(r_c \approx 2\) m — angular diameter measurement by **intensity interferometry** (Hanbury Brown and Twiss) or **long-baseline stellar interferometry** exploits this.

---

# Chapter 6: Diffraction — Fresnel and Fraunhofer

## 6.1 Huygens-Fresnel and Kirchhoff Theories

The rigorous electromagnetic theory of diffraction by Kirchhoff treats each point in an open aperture as a secondary source. The field at observation point \(P\) is:

\[
U(P) = -\frac{i}{\lambda}\iint_\Sigma U(Q)\,\frac{e^{ikr}}{r}\,K(\chi)\,dS
\]

where the integral is over the aperture \(\Sigma\), \(r\) is the distance from aperture point \(Q\) to \(P\), and \(K(\chi) = \frac{1}{2}(1 + \cos\chi)\) is the obliquity factor (\(\chi\) is the angle between the outward normal and the direction \(QP\)). For small angles of diffraction, \(K \approx 1\), simplifying the theory.

The phase accumulated along a path from source \(S\) through aperture point \(Q\) to observation point \(P\) is \(k(SQ + QP)\). Diffraction involves summing contributions with different phases — the pattern reflects the Fourier transform of the aperture function weighted by appropriate phase factors.

Two limiting cases are defined by the **Fresnel number**:

\[
N_F = \frac{a^2}{\lambda L}
\]

where \(a\) is the aperture size and \(L\) is the distance to the observation plane. For \(N_F \gg 1\): **Fresnel (near-field) diffraction** — the wavefronts at the observation plane are significantly curved, and the observed pattern depends on the distance \(L\). For \(N_F \ll 1\): **Fraunhofer (far-field) diffraction** — the wavefronts at the observation plane are essentially plane, and the pattern is the Fourier transform of the aperture function.

## 6.2 Fraunhofer Diffraction — The Fourier Transform Connection

In the Fraunhofer limit, the diffracted field at observation point with angular coordinates \((\xi, \eta)\) (direction cosines from the aperture) is:

\[
U(\xi, \eta) \propto \iint_\text{aperture} t(x, y)\,e^{-i2\pi(x\xi + y\eta)/\lambda}\,dx\,dy = \mathcal{F}\left\{t(x,y)\right\}\!\left(\frac{\xi}{\lambda}, \frac{\eta}{\lambda}\right)
\]

where \(t(x, y)\) is the **aperture transmission function** (1 inside the aperture, 0 outside). The Fraunhofer diffraction pattern is the **Fourier transform** of the aperture function, evaluated at spatial frequencies \(u = \xi/\lambda = \sin\theta_x/\lambda\) and \(v = \eta/\lambda = \sin\theta_y/\lambda\). This is one of the most powerful connections in optics.

**Single slit** of width \(a\): \(t(x) = \text{rect}(x/a)\). The Fourier transform is \(\mathcal{F}\{\text{rect}(x/a)\} = a\,\text{sinc}(a\xi/\lambda)\). Intensity: \(I(\theta) = I_0\,\text{sinc}^2(\pi a\sin\theta/\lambda)\).

**Double slit** of width \(a\), separation \(d\): \(t(x) = \text{rect}(x/a)*[\delta(x-d/2)+\delta(x+d/2)]\). The Fourier transform: \(a\,\text{sinc}(a\xi/\lambda) \cdot 2\cos(\pi d\xi/\lambda)\). Intensity: \(I = 4I_0\,\text{sinc}^2(\pi a\sin\theta/\lambda)\cos^2(\pi d\sin\theta/\lambda)\) — the single-slit envelope modulates the double-slit fringes.

**Diffraction grating** of \(N\) slits of width \(a\), spacing \(d\): \(t(x) = \text{rect}(x/a)*\sum_{n=0}^{N-1}\delta(x-nd)\). The Fourier transform: \(a\,\text{sinc}(a\xi/\lambda)\cdot\frac{\sin(N\pi d\xi/\lambda)}{\sin(\pi d\xi/\lambda)}\). Intensity:

\[
I(\theta) = I_0\,\text{sinc}^2\!\left(\frac{\pi a\sin\theta}{\lambda}\right)\cdot\frac{\sin^2(N\pi d\sin\theta/\lambda)}{\sin^2(\pi d\sin\theta/\lambda)}
\]

The principal maxima occur when \(d\sin\theta = m\lambda\) (grating equation); the single-slit envelope modulates the grating pattern.

## 6.3 Fresnel Diffraction and the Cornu Spiral

**Fresnel diffraction** is the general case where the quadratic phase terms from wavefront curvature are retained. For a one-dimensional aperture and a plane wave, the field at point \(P\) is:

\[
U(P) \propto \int_{-\infty}^{\infty} t(x)\,e^{i\pi x^2/(\lambda L)}\,dx
\]

This integral cannot be evaluated in closed form for general apertures, but the phase factor \(e^{i\pi x^2/(\lambda L)}\) creates a chirped phase that causes interference between different parts of the aperture. Using the **Fresnel integrals**:

\[
C(u) = \int_0^u \cos\!\left(\frac{\pi t^2}{2}\right)\,dt, \qquad S(u) = \int_0^u \sin\!\left(\frac{\pi t^2}{2}\right)\,dt
\]

the diffraction amplitude can be expressed as \(U \propto C(u_2) - C(u_1) + i\left[S(u_2) - S(u_1)\right]\), where \(u_1, u_2\) are the Fresnel-number-scaled aperture boundaries. The **Cornu spiral** is the parametric curve \((C(u), S(u))\) in the complex plane. As \(u\) increases from \(-\infty\) to \(+\infty\), the Cornu spiral winds from the eye of the lower-left spiral (\((-1/2, -1/2)\)) to the eye of the upper-right spiral (\((+1/2, +1/2)\)).

The diffraction amplitude for any aperture is a chord of the Cornu spiral from \(u_1\) to \(u_2\), and the intensity is the square of this chord length. As the observation point moves, the aperture boundaries change, and the chord endpoint sweeps around the spiral — producing the characteristic Fresnel diffraction oscillations near the edges of shadows.

**Fresnel zones**: the wavefront can be divided into concentric annular zones (Fresnel zones) such that the path length from consecutive zone boundaries to the observation point differs by \(\lambda/2\). Adjacent zones contribute amplitudes that are approximately equal in magnitude but opposite in phase, so they tend to cancel. An unobstructed aperture transmits all zones, and the total amplitude is half the amplitude from the first zone alone. Blocking alternate zones (a **zone plate**) doubles the amplitude and quadruples the intensity at the focal point — a zone plate acts as a diffractive lens with focal length \(f = r_1^2/\lambda\), where \(r_1\) is the radius of the first Fresnel zone.

---

# Chapter 7: Fourier Optics

## 7.1 The Lens as a Fourier Transformer

The most powerful result in Fourier optics is that a thin lens performing a Fourier transform operation: a field distribution in the **front focal plane** of a lens is transformed into its Fourier transform in the **rear focal plane**.

<div class="theorem">
<strong>Fourier Transform Property of a Lens.</strong> If the field distribution in the front focal plane (at distance \(f\) in front of the lens) is \(U_\text{in}(x, y)\), then the field in the rear focal plane (at distance \(f\) behind the lens) is:

\[
U_\text{out}(x', y') = \frac{1}{i\lambda f}\iint U_\text{in}(x, y)\,e^{-i2\pi(x'x + y'y)/(\lambda f)}\,dx\,dy = \frac{1}{i\lambda f}\,\mathcal{F}\{U_\text{in}\}\!\left(\frac{x'}{\lambda f}, \frac{y'}{\lambda f}\right)
\]
up to an unimportant quadratic phase factor.
</div>

The physical reason: a plane wave making angle \(\theta\) to the optical axis is focused to a point at position \(x' = f\tan\theta \approx f\theta\) in the rear focal plane. Each angular frequency component (plane wave) in the input is focused to a different position — the rear focal plane records the angular spectrum (Fourier transform) of the input field.

This principle underlies **4-f optical systems** and **spatial filtering**. Two lenses in sequence (front focal length of first lens = \(f_1\), rear focal length = \(f_1\); second lens similarly), with the rear focal plane of the first lens coinciding with the front focal plane of the second, form a **4-f system**. A **spatial filter** (an aperture or amplitude/phase mask) placed in the Fourier plane between the two lenses modifies the Fourier components of the image, selectively passing or blocking spatial frequencies.

## 7.2 Spatial Frequency Analysis

A two-dimensional image \(f(x, y)\) can be decomposed into spatial frequency components by the 2D Fourier transform:

\[
F(u, v) = \mathcal{F}\{f\}(u, v) = \iint f(x, y)\,e^{-i2\pi(ux+vy)}\,dx\,dy
\]

The spatial frequencies \(u\) and \(v\) (in cycles per metre) correspond to the angular frequencies \(\xi = u\lambda\) and \(\eta = v\lambda\). Fine spatial detail (sharp edges, fine textures) corresponds to high spatial frequencies; coarse features correspond to low spatial frequencies.

**Low-pass filtering** passes only low spatial frequencies — blurring the image, smoothing away fine detail and noise. **High-pass filtering** passes only high spatial frequencies — sharpening edges. **Band-pass filtering** selects a range of spatial frequencies — used in image processing to enhance features at a particular scale. All of these operations can be implemented optically by placing the appropriate mask in the Fourier plane of a 4-f system.

## 7.3 Coherent and Incoherent Imaging — OTF and MTF

An imaging system is a **linear system** that maps the input object intensity distribution to the output image intensity distribution. The response of the system is characterised by its **Point Spread Function (PSF)** — the image of a point source (a delta function input). For a perfect (diffraction-limited) circular aperture, the PSF is the Airy pattern.

**Coherent imaging** (laser illumination): amplitudes add. The image amplitude is the convolution of the object amplitude with the PSF:

\[
U_\text{image}(x, y) = U_\text{object}(x, y) * h(x, y)
\]

where \(h\) is the amplitude PSF (the Fourier transform of the pupil function). The **coherent transfer function (CTF)** is the Fourier transform of \(h\) — it is simply the pupil function.

**Incoherent imaging** (white light): intensities add. The image intensity is the convolution of the object intensity with the intensity PSF:

\[
I_\text{image}(x, y) = I_\text{object}(x, y) * |h(x, y)|^2
\]

The **Optical Transfer Function (OTF)** is the Fourier transform of the intensity PSF, normalised to unity at zero frequency:

\[
\text{OTF}(u, v) = \frac{\mathcal{F}\{|h|^2\}}{\mathcal{F}\{|h|^2\}\big|_{u=v=0}}
\]

The **Modulation Transfer Function (MTF)** is the magnitude of the OTF: \(\text{MTF}(u, v) = |\text{OTF}(u, v)|\). It describes the contrast (modulation) with which a sinusoidal grating of spatial frequency \((u, v)\) is reproduced in the image: MTF = 1 means perfect contrast reproduction; MTF = 0 means the frequency is completely unresolved.

For a diffraction-limited circular aperture of diameter \(D\) at wavelength \(\lambda\), the cutoff spatial frequency (where MTF drops to zero) is:

\[
u_\text{cutoff} = \frac{D}{\lambda f} = \frac{1}{\lambda(f/\#)}
\]

where \(f/\#\) = \(f/D\) is the f-number. For an f/2 lens at 550 nm: \(u_\text{cutoff} = 1/(550\times10^{-9} \times 2) = 909\) line pairs/mm. The MTF for an incoherent, diffraction-limited circular aperture is:

\[
\text{MTF}(u) = \frac{2}{\pi}\!\left[\arccos\!\left(\frac{u}{u_c}\right) - \frac{u}{u_c}\sqrt{1-\left(\frac{u}{u_c}\right)^2}\,\right], \quad 0 \leq u \leq u_c
\]

where \(u_c = u_\text{cutoff}\). This MTF starts at 1 (for DC), decreases monotonically, and reaches 0 at the cutoff. Aberrations reduce the MTF below this diffraction limit.

## 7.4 Spatial Filtering Applications

**Phase contrast microscopy** (Zernike's invention, 1930s): a phase object (transparent biological specimen) modulates only the phase of the light, not the amplitude, so it is invisible in ordinary bright-field microscopy. By placing a phase-shifting element (the Zernike phase plate) in the Fourier plane to shift the direct (zero-frequency) beam by \(\pi/2\) relative to the diffracted light, the phase modulation is converted to amplitude modulation — making the specimen visible.

**Dark-field imaging**: block the zero-order (direct beam) in the Fourier plane. Only diffracted light (from edges and features) contributes to the image — producing bright features on a dark background, excellent for detecting small particles and surface defects.

**Holography**: record the interference pattern between a reference beam and the diffracted object beam on a photographic plate or digital sensor. Illuminating the developed hologram with the reference beam alone reconstructs the original diffracted wave — reproducing the three-dimensional wavefront of the object. The hologram stores both amplitude and phase information (unlike an ordinary photograph, which stores only intensity). The reconstruction works because the hologram's amplitude transmission function, when multiplied by the reference wave, produces (among other terms) the original object wavefront.

---

# Chapter 8: Gaussian Beam Propagation

## 8.1 The Paraxial Wave Equation and Gaussian Beams

The output of a laser is not a plane wave but a **Gaussian beam** — a beam with a Gaussian transverse intensity profile that propagates according to the paraxial wave equation. To derive it, we seek solutions of the wave equation \(\nabla^2 U + k^2 U = 0\) in the paraxial approximation (slowly varying envelope propagating mainly in the \(z\)-direction). Write \(U(x, y, z) = u(x, y, z)\,e^{ikz}\) where \(u\) varies slowly with \(z\). Substituting and neglecting \(\partial^2 u/\partial z^2\) compared to \(k\partial u/\partial z\):

\[
\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + 2ik\frac{\partial u}{\partial z} = 0
\]

This is the **paraxial wave equation** (identical in form to the Schrödinger equation for a free particle, with \(z\) playing the role of time). The **Gaussian beam** is its fundamental solution:

\[
U(r, z) = \frac{w_0}{w(z)}\exp\!\left(-\frac{r^2}{w(z)^2}\right)\exp\!\left(-i\frac{kr^2}{2R(z)}\right)\exp\!\left(-i\,\phi(z)\right)e^{ikz}
\]

where \(r^2 = x^2 + y^2\), and:

\[
w(z) = w_0\sqrt{1 + (z/z_R)^2} \qquad \text{(beam radius)}
\]

\[
R(z) = z\!\left[1 + (z_R/z)^2\right] \qquad \text{(wavefront radius of curvature)}
\]

\[
\phi(z) = \arctan(z/z_R) \qquad \text{(Gouy phase)}
\]

\[
z_R = \frac{\pi w_0^2}{\lambda} \qquad \text{(Rayleigh range)}
\]

The parameter \(w_0\) is the **beam waist** — the minimum beam radius, which occurs at \(z = 0\) (the focus). The **Rayleigh range** \(z_R\) is the distance from the waist at which the beam radius has increased by \(\sqrt{2}\) and the on-axis intensity has decreased by half.

## 8.2 Properties of Gaussian Beams

The intensity profile is Gaussian at every \(z\):

\[
I(r, z) = I_0\!\left(\frac{w_0}{w(z)}\right)^2\exp\!\left(-\frac{2r^2}{w(z)^2}\right)
\]

The \(1/e^2\) radius (where intensity falls to \(e^{-2}\) of its peak value) is \(w(z)\). The total power is \(P = I_0\pi w_0^2/2\).

For \(z \gg z_R\) (far field), the beam diverges linearly with a half-angle:

\[
\theta_\infty = \frac{w_0}{z_R} = \frac{\lambda}{\pi w_0}
\]

This far-field divergence is inversely proportional to the waist size — a tightly focused beam (small \(w_0\)) diverges quickly; a loosely focused beam (large \(w_0\)) diverges slowly. The product of waist size and far-field divergence angle is:

\[
w_0\,\theta_\infty = \frac{\lambda}{\pi}
\]

This is a form of the Heisenberg uncertainty principle for photons: a photon confined to a transverse extent \(w_0\) has transverse momentum uncertainty \(\delta p_x \sim \hbar/w_0\), corresponding to angular uncertainty \(\delta\theta \sim \hbar/(\hbar k w_0) = \lambda/(2\pi w_0)\) — consistent with the Gaussian result to a factor of order unity.

**The Gouy phase** \(\phi(z) = \arctan(z/z_R)\) is an additional phase shift accumulated as the beam passes through its focus. A Gaussian beam picks up a total extra phase of \(\pi\) as \(z\) goes from \(-\infty\) to \(+\infty\) — compared to a plane wave, it shifts phase by \(\pi\) at focus. This has observable consequences in resonator design (the longitudinal mode spacing) and in the phase of the PSF near the focal plane.

## 8.3 Gaussian Beam Transformation by Lenses

A thin lens of focal length \(f\) transforms a Gaussian beam by applying the phase \(\exp(-ikr^2/2f)\) to the field at the lens plane. If the input beam has waist \(w_{01}\) at distance \(d\) from the lens and Rayleigh range \(z_{R1}\), the output beam has waist:

\[
w_{02} = \frac{f\, w_{01}}{\sqrt{(d-f)^2 + z_{R1}^2}}
\]

at distance from the lens:

\[
d' = f + \frac{(d-f)f^2}{(d-f)^2 + z_{R1}^2}
\]

Note that \(d'\) reduces to the thin-lens equation \(1/d + 1/d' = 1/f\) when \(z_{R1} \to 0\) (geometrical optics limit), but differs significantly when the Rayleigh range is comparable to \(|d - f|\). The Gaussian beam transformation by a lens is described by the **ABCD law**: the complex beam parameter \(q = z + iz_R\) (which encodes both the beam radius and radius of curvature as \(1/q^* = 1/R - i\lambda/\pi w^2\)) transforms as:

\[
q_\text{out} = \frac{Aq_\text{in} + B}{Cq_\text{in} + D}
\]

where \(\begin{pmatrix}A&B\\C&D\end{pmatrix}\) is the ray transfer (ABCD) matrix of the optical system. This is the Möbius transformation that connects geometrical optics ray tracing to Gaussian beam propagation — a deep and beautiful unification.

## 8.4 Resonators and Mode Structure

A **laser resonator** consists of two mirrors facing each other, with the gain medium in between. The resonator must support self-consistent Gaussian beam modes — field distributions that reproduce themselves after a complete round trip through the resonator. Using the ABCD law, the stability condition for a resonator with mirrors of radii \(R_1\) and \(R_2\) separated by length \(L\) is:

\[
0 \leq g_1\,g_2 \leq 1
\]

where \(g_i = 1 - L/R_i\) are the **g-parameters**. The boundaries of the stability region (\(g_1 g_2 = 0\) or \(g_1 g_2 = 1\)) correspond to unstable or marginally stable configurations. The common **hemispherical resonator** (one flat mirror, \(R_1 = \infty\), \(g_1 = 1\); one curved mirror of radius \(R_2 = L\), \(g_2 = 0\)) sits on the boundary of the stable region but is easily aligned and widely used in low-power lasers.

The resonant frequencies of a Gaussian beam resonator include contributions from the longitudinal mode index \(q\), the transverse mode indices \(m\) and \(n\), and the Gouy phase accumulated per round trip:

\[
\nu_{mnq} = \frac{c}{2L}\!\left[q + \frac{1}{\pi}(m+n+1)\arccos\!\left(\sqrt{g_1 g_2}\right)\right]
\]

The Gouy phase term causes the transverse modes (\(m+n > 0\)) to have frequencies shifted from the longitudinal mode spacing — a fact exploited in frequency doubling cavities and in the mode structure of optical frequency combs.

---

# Chapter 9: Common Optical Instruments in Modern Optics Research

## 9.1 The Interferometer as a Precision Measurement Tool

A **Michelson interferometer** splits a beam into two paths with a beamsplitter, reflects each from a mirror, and recombines them. If the path length difference is \(\Delta L\), the output intensity is:

\[
I = I_0\!\left(1 + \cos\frac{2\pi\cdot 2\Delta L}{\lambda}\right) = 2I_0\cos^2\!\left(\frac{2\pi\Delta L}{\lambda}\right)
\]

When one mirror is displaced by \(\delta L\), the output intensity changes by approximately \(I_0 \cdot (4\pi/\lambda)\delta L\) (near the half-fringe point). This gives a measurement sensitivity limited only by shot noise (from the quantum nature of photons) and mirror thermal motion. LIGO measures mirror displacements of \(\sim 10^{-19}\) m — smaller than the diameter of a proton — by using high-finesse Fabry-Pérot cavities inside a Michelson interferometer to enhance the effective path length by a factor of \(\sim 300\).

The **Fabry-Pérot interferometer** consists of two parallel, highly reflective mirrors with reflectance \(R\). Multiple reflections between the mirrors produce a transmitted intensity:

\[
T = \frac{(1-R)^2}{(1-R)^2 + 4R\sin^2(\delta/2)} = \frac{1}{1 + \mathcal{F}\sin^2(\delta/2)}
\]

where \(\delta = 4\pi nL\cos\theta/\lambda\) is the round-trip phase and \(\mathcal{F} = 4R/(1-R)^2\) is the **coefficient of finesse**. The **finesse** is \(\mathcal{F}_\text{res} = \pi\sqrt{R}/(1-R)\). For a high-reflectivity mirror with \(R = 0.99\), \(\mathcal{F}_\text{res} \approx 312\). The Fabry-Pérot resolving power is \(\mathcal{R} = \mathcal{F}_\text{res} \cdot m\), where \(m\) is the interference order — this vastly exceeds the resolving power of diffraction gratings.

## 9.2 The Spectrometer and Spectroscopy

A modern grating spectrometer disperses light by diffraction, focuses different wavelengths onto different positions of a detector array (CCD or photodiode array). The design resolves \(\delta\lambda = \lambda/(mN)\) (Rayleigh criterion for a grating with \(N\) lines in order \(m\)). The **free spectral range** — the wavelength interval \(\Delta\lambda_\text{FSR}\) over which the spectrum repeats (adjacent orders overlap) — is \(\Delta\lambda_\text{FSR} = \lambda/m\).

Raman spectroscopy, fluorescence spectroscopy, and absorption spectroscopy all rely on the ability to precisely resolve spectral features separated by fractions of a nanometre. Laser spectroscopy has pushed the art to the extreme: **optical frequency combs** (generated by mode-locked lasers) provide a "ruler" in frequency space with teeth spaced by the laser repetition rate (\(\sim 100\) MHz to 10 GHz) and known to fractional accuracy better than \(10^{-18}\), enabling absolute frequency measurements and tests of fundamental physics.

## 9.3 Acousto-Optic and Electro-Optic Modulators

**Acousto-optic modulators (AOMs)** use a piezoelectric transducer to launch acoustic waves in a crystal, creating a periodic refractive index grating (a phonon wave). Light diffracted from this grating is both frequency-shifted (by the acoustic frequency \(\Omega \sim 80-200\) MHz) and angularly deflected. AOMs are widely used in laser systems to shift frequencies, control beam power by controlling the diffraction efficiency, and to pulse-pick (select individual pulses from a pulse train).

**Electro-optic modulators (EOMs)** exploit the **Pockels effect**: in non-centrosymmetric crystals (such as lithium niobate LiNbO\(_3\) or potassium titanyl phosphate KTP), an applied electric field changes the refractive index linearly in the field strength. An EOM applies an electric field via electrodes to change the birefringence of the crystal, thereby rotating the polarisation of transmitted light or imposing a phase shift. EOMs can operate from DC to tens of GHz and are essential in optical communications (for encoding data onto a carrier by phase or amplitude modulation) and in laser physics (for locking laser frequencies to reference cavities).

---

# Chapter 10: Maxwell's Equations — A Full Derivation

## 10.1 Maxwell's Equations in Vacuum and in Matter

The physical optics of light is inseparable from its electromagnetic character. To develop the theory from first principles, we begin with Maxwell's equations in their most general macroscopic form. In SI units, for a linear, isotropic medium free of free charges and free currents (the usual assumption for transparent optical media):

\[
\nabla \cdot \mathbf{D} = 0 \qquad \nabla \cdot \mathbf{B} = 0
\]

\[
\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t} \qquad \nabla \times \mathbf{H} = \frac{\partial \mathbf{D}}{\partial t}
\]

The constitutive relations link the macroscopic fields: \(\mathbf{D} = \varepsilon\mathbf{E} = \varepsilon_0\varepsilon_r\mathbf{E}\) and \(\mathbf{B} = \mu\mathbf{H} = \mu_0\mu_r\mathbf{H}\). For non-magnetic optical materials, \(\mu_r = 1\) to very high accuracy in the visible and near-infrared spectrum. The relative permittivity \(\varepsilon_r = n^2\) (for real, lossless media), establishing the central link between the refractive index and the electric susceptibility of matter.

These four equations encode all of classical electrodynamics. Gauss's law for electricity (\(\nabla\cdot\mathbf{D}=0\) in source-free regions) expresses the absence of magnetic monopoles. Faraday's law (\(\nabla\times\mathbf{E} = -\partial\mathbf{B}/\partial t\)) says that a time-varying magnetic field induces a circulating electric field. The Ampère-Maxwell law (\(\nabla\times\mathbf{H} = \partial\mathbf{D}/\partial t\)) says the converse: a time-varying electric field (the "displacement current," Maxwell's key insight of 1865) induces a circulating magnetic field. It was this last term — absent from Ampère's original law — that Maxwell added, and which breaks the asymmetry between the two curl equations, allowing self-sustaining electromagnetic waves.

## 10.2 Derivation of the Electromagnetic Wave Equation

<div class="theorem">
<strong>Theorem (Wave Equation in a Homogeneous Medium).</strong> In a homogeneous, isotropic, linear, non-magnetic, source-free medium with permittivity \(\varepsilon = \varepsilon_0 n^2\), both \(\mathbf{E}\) and \(\mathbf{B}\) satisfy the wave equation

\[
\nabla^2\mathbf{E} = \mu_0\varepsilon\,\frac{\partial^2\mathbf{E}}{\partial t^2} = \frac{n^2}{c^2}\,\frac{\partial^2\mathbf{E}}{\partial t^2}
\]
with propagation speed \(v = c/n\).

<strong>Proof.</strong> Take the curl of Faraday's law:

\[
\nabla\times(\nabla\times\mathbf{E}) = -\nabla\times\frac{\partial\mathbf{B}}{\partial t} = -\frac{\partial}{\partial t}(\nabla\times\mathbf{B})
\]
Apply the vector identity \(\nabla\times(\nabla\times\mathbf{E}) = \nabla(\nabla\cdot\mathbf{E}) - \nabla^2\mathbf{E}\). In a source-free, homogeneous medium \(\nabla\cdot\mathbf{E} = 0\) (from Gauss's law), so the left side reduces to \(-\nabla^2\mathbf{E}\). The right side: since \(\mathbf{B} = \mu_0\mathbf{H}\) (for \(\mu_r=1\)), use the Ampère-Maxwell law \(\nabla\times\mathbf{H} = \partial\mathbf{D}/\partial t\) to write \(\nabla\times\mathbf{B} = \mu_0\partial\mathbf{D}/\partial t = \mu_0\varepsilon\,\partial\mathbf{E}/\partial t\). Therefore:

\[
-\nabla^2\mathbf{E} = -\frac{\partial}{\partial t}\!\left(\mu_0\varepsilon\frac{\partial\mathbf{E}}{\partial t}\right) = -\mu_0\varepsilon\,\frac{\partial^2\mathbf{E}}{\partial t^2}
\]
Rearranging:

\[
\nabla^2\mathbf{E} - \mu_0\varepsilon\,\frac{\partial^2\mathbf{E}}{\partial t^2} = 0
\]
Identifying \(\mu_0\varepsilon_0 = 1/c^2\) and \(\varepsilon = \varepsilon_0 n^2\) gives \(\mu_0\varepsilon = n^2/c^2\). An identical calculation for \(\mathbf{B}\) (by taking the curl of the Ampère-Maxwell law instead) yields the same equation for \(\mathbf{B}\). \(\square\)
</div>

The wave speed \(v = c/n\) is the defining relation linking the macroscopic refractive index to the microscopic permittivity of the medium. In vacuum (\(n = 1\)), \(v = c = 1/\sqrt{\mu_0\varepsilon_0} \approx 2.998\times10^8\) m/s — Maxwell's remarkable 1865 prediction, confirmed to match the then-known speed of light, providing the first definitive identification of light as an electromagnetic wave.

## 10.3 The Helmholtz Equation

For a monochromatic field oscillating at angular frequency \(\omega\), we write \(\mathbf{E}(\mathbf{r},t) = \text{Re}\!\left[\mathbf{E}(\mathbf{r})e^{-i\omega t}\right]\) (complex phasor notation). Substituting into the wave equation and cancelling \(e^{-i\omega t}\):

\[
\nabla^2\mathbf{E}(\mathbf{r}) + k^2\mathbf{E}(\mathbf{r}) = 0 \qquad k = \frac{n\omega}{c} = \frac{2\pi n}{\lambda_0}
\]

This is the **Helmholtz equation** — the time-independent wave equation. The wave number \(k\) in the medium is \(n\) times larger than in vacuum (\(k_0 = \omega/c\)). The general solution of the Helmholtz equation decomposes as a superposition of plane waves \(\mathbf{E}_0\,e^{i\mathbf{k}\cdot\mathbf{r}}\) with \(|\mathbf{k}| = k = n\omega/c\).

The Helmholtz equation is the starting point for nearly all calculations in physical optics: diffraction theory, coherence theory, Gaussian beam propagation, and the design of waveguides, resonators, and periodic photonic structures. The angular spectrum representation, which decomposes a field in the \(z=0\) plane into plane waves and uses the Helmholtz equation to propagate each plane wave independently to any other plane, is particularly powerful for rigorous diffraction calculations.

---

# Chapter 11: The Lorentz Model — A Complete Treatment

## 11.1 The Classical Oscillator Model in Detail

The Lorentz model treats each atom as a classical harmonic oscillator. An atom has \(Z\) electrons, but for optical frequencies, typically only a small number \(f_j\) (the **oscillator strengths**) contribute significantly near each resonance \(\omega_j\). The generalised equation of motion for the \(j\)-th oscillator mode driven by the field \(E = \text{Re}[\tilde{E}_0 e^{-i\omega t}]\) is:

\[
m_e\ddot{x}_j + m_e\gamma_j\dot{x}_j + m_e\omega_j^2 x_j = -eE_0 e^{-i\omega t}
\]

The solution in steady state (particular solution):

\[
\tilde{x}_j = \frac{-e\tilde{E}_0/m_e}{\omega_j^2 - \omega^2 - i\gamma_j\omega}
\]

The displacement is complex because the oscillator response is phase-shifted relative to the driving field — the phase lag is exactly \(\pi\) at resonance, meaning the oscillator dissipates maximum power when driven at its natural frequency.

## 11.2 Building the Complex Permittivity

The total polarisation density is:

\[
\tilde{P} = -Ne\sum_j f_j\tilde{x}_j = \frac{Ne^2}{m_e}\sum_j \frac{f_j}{\omega_j^2 - \omega^2 - i\gamma_j\omega}\,\tilde{E}_0
\]

where \(N\) is the number density of atoms and \(\sum_j f_j = Z\) (sum rule). Since \(\tilde{P} = \varepsilon_0\tilde{\chi}_e\tilde{E}_0\), the complex electric susceptibility is:

\[
\tilde{\chi}_e(\omega) = \frac{Ne^2}{\varepsilon_0 m_e}\sum_j \frac{f_j}{\omega_j^2 - \omega^2 - i\gamma_j\omega}
\]

The complex relative permittivity (dielectric function) is \(\tilde{\varepsilon}_r = 1 + \tilde{\chi}_e\), and the complex refractive index is \(\tilde{n} = \sqrt{\tilde{\varepsilon}_r}\). Writing \(\tilde{n} = n + i\kappa\) and squaring:

\[
n^2 - \kappa^2 = 1 + \text{Re}(\tilde{\chi}_e), \qquad 2n\kappa = \text{Im}(\tilde{\chi}_e)
\]

These two equations link the refractive index \(n\) (controlling phase velocity and refraction) and the extinction coefficient \(\kappa\) (controlling absorption) to the real and imaginary parts of the susceptibility. In the weak-absorption limit (\(\kappa \ll n\)), we recover the simpler expressions from Section 2.2.

## 11.3 The Sellmeier Equation from the Lorentz Model

In transparent media (far from all resonances), \(\gamma_j\omega \ll |\omega_j^2 - \omega^2|\) for all \(j\), so the damping terms can be dropped and \(\kappa \approx 0\). The refractive index becomes real:

\[
n^2(\omega) \approx 1 + \frac{Ne^2}{\varepsilon_0 m_e}\sum_j \frac{f_j}{\omega_j^2 - \omega^2}
\]

Rewriting in terms of wavelength (\(\omega = 2\pi c/\lambda\), \(\omega_j = 2\pi c/\lambda_j\)):

\[
n^2(\lambda) = 1 + \sum_j \frac{B_j\lambda^2}{\lambda^2 - \lambda_j^2}
\]

where \(B_j = (Ne^2 f_j\lambda_j^2)/(4\pi^2 c^2\varepsilon_0 m_e)\) is the oscillator strength parameter for resonance \(j\) and \(\lambda_j = 2\pi c/\omega_j\) is the resonance wavelength. This is the **Sellmeier equation**, first written down empirically by Wilhelm Sellmeier in 1871, more than two decades before the electron was discovered. The fact that the same formula emerged from quantum-mechanical oscillator theory (with the oscillator strengths \(f_j\) re-interpreted quantum-mechanically as transition dipole moments squared times state density) confirms the essential correctness of the classical Lorentz model for dispersion in dielectrics.

For optical glass (e.g., BK7), the Sellmeier equation with three resonance terms (two UV, one IR) fits the measured refractive index from 300 nm to 2500 nm to better than \(5\times10^{-6}\):

\[
n^2(\lambda) = 1 + \frac{B_1\lambda^2}{\lambda^2 - C_1} + \frac{B_2\lambda^2}{\lambda^2 - C_2} + \frac{B_3\lambda^2}{\lambda^2 - C_3}
\]

For BK7: \(B_1 = 1.03961\), \(C_1 = 0.00600\,\mu\text{m}^2\); \(B_2 = 0.23179\), \(C_2 = 0.02002\,\mu\text{m}^2\); \(B_3 = 1.01047\), \(C_3 = 103.56\,\mu\text{m}^2\). The Abbe number \(V = (n_d - 1)/(n_F - n_C)\) (where subscripts \(d\), \(F\), \(C\) refer to the Fraunhofer lines at 587.6, 486.1, 435.8 nm) quantifies dispersive power; for BK7, \(V \approx 64\) — a low-dispersion ("crown") glass.

## 11.4 Anomalous Dispersion and the Causality Connection

Near each resonance \(\omega_j\), the behaviour of \(n(\omega)\) is characteristic and universal. Writing \(\omega = \omega_j + \delta\) for small detuning \(\delta\), the relevant term in the susceptibility is:

\[
\frac{f_j}{\omega_j^2 - \omega^2 - i\gamma_j\omega} \approx \frac{f_j/2\omega_j}{-\delta - i\gamma_j/2} = \frac{-f_j/2\omega_j}{\delta + i\gamma_j/2}
\]

This is a Lorentzian, and its real part (proportional to \(n-1\)) is antisymmetric: \(n-1\) is positive for \(\delta > 0\) (below resonance) and negative for \(\delta < 0\) (above resonance, called **anomalous dispersion** because \(dn/d\omega < 0\)). The imaginary part (proportional to absorption \(\kappa\)) is symmetric and peaked at \(\delta = 0\): absorption is maximum exactly at resonance.

The physical reason for anomalous dispersion is that just above the resonance frequency, the oscillator's response is phase-shifted by more than \(\pi\), so the radiated field from the driven atoms tends to advance rather than retard the phase of the transmitted beam. This reduces the effective optical path length through the medium, giving \(n < 1\) and apparently \(v_\phi > c\). But this does not allow superluminal signal transmission: the phase velocity \(v_\phi = c/n\) is the speed of phase fronts in a perfect monochromatic wave (which extends from \(-\infty\) to \(+\infty\) in time and therefore carries no information). The signal (information) velocity is always \(\leq c\) — a result ultimately protected by the Kramers-Kronig relations, which encode causality.

---

# Chapter 12: Group Velocity and Dispersion — Detailed Treatment

## 12.1 Deriving the Group Velocity from First Principles

Consider a wavepacket built from plane waves near a carrier frequency \(\omega_0\):

\[
E(z, t) = \int_{-\infty}^{\infty} \tilde{A}(\omega)\,e^{i\!\left[k(\omega)z - \omega t\right]}\,\frac{d\omega}{2\pi}
\]

Expand \(k(\omega)\) in a Taylor series around \(\omega_0\):

\[
k(\omega) = k_0 + k_1(\omega-\omega_0) + \frac{1}{2}k_2(\omega-\omega_0)^2 + \cdots
\]

where \(k_0 = k(\omega_0)\), \(k_1 = dk/d\omega\big|_{\omega_0}\), and \(k_2 = d^2k/d\omega^2\big|_{\omega_0}\). Keeping only the linear term (no dispersion):

\[
E(z,t) = e^{i(k_0 z - \omega_0 t)}\int_{-\infty}^{\infty}\tilde{A}(\omega)\,e^{i(\omega-\omega_0)(k_1 z - t)}\,\frac{d\omega}{2\pi}
\]

The integral is the envelope \(A(k_1 z - t)\), showing that the envelope propagates without distortion at velocity \(v_g = 1/k_1 = d\omega/dk\big|_{\omega_0}\). This is the **group velocity**.

From the dispersion relation \(k = n(\omega)\omega/c\):

\[
\frac{dk}{d\omega} = \frac{1}{c}\!\left(n + \omega\frac{dn}{d\omega}\right) = \frac{n_g}{c}
\]

where \(n_g = n + \omega(dn/d\omega)\) is the group index. Therefore \(v_g = c/n_g\).

## 12.2 Group Velocity Dispersion and Pulse Broadening

Including the quadratic term \(k_2\) (group velocity dispersion, GVD):

\[
E(z,t) = e^{i(k_0 z-\omega_0 t)}\int \tilde{A}(\Omega)\,e^{i\Omega(k_1 z - t)}\,e^{i\Omega^2 k_2 z/2}\,\frac{d\Omega}{2\pi}
\]

(where \(\Omega = \omega - \omega_0\)). The factor \(e^{i\Omega^2 k_2 z/2}\) acts as a quadratic phase on the spectrum — it chirps the pulse. For an initially transform-limited Gaussian pulse with intensity envelope \(I(t,0) = I_0\exp(-t^2/T_0^2)\) (temporal 1/e half-width \(T_0\)), the spectrum is \(|\tilde{A}(\Omega)|^2 \propto \exp(-\Omega^2 T_0^2)\). After propagating distance \(z\), the pulse width broadens to:

\[
T(z) = T_0\sqrt{1 + \left(\frac{k_2 z}{T_0^2}\right)^2}
\]

The **dispersion length** \(L_D = T_0^2/|k_2|\) is the propagation distance over which the pulse width increases by \(\sqrt{2}\). For a 100 fs pulse in standard single-mode fibre (\(|k_2| \approx 20\) ps\(^2\)/km at 1550 nm), \(L_D \approx 0.5\) mm — illustrating that femtosecond pulses broaden extremely rapidly in normal silica fibre. Near the zero-GVD wavelength (\(\sim 1310\) nm in silica), \(k_2 \approx 0\) and third-order dispersion \(k_3\) becomes the dominant broadening mechanism.

In the anomalous GVD regime (\(k_2 < 0\)), a balance between GVD and the **Kerr nonlinearity** (intensity-dependent refractive index \(\Delta n = n_2 I\)) gives rise to **optical solitons** — pulses that propagate without broadening. Solitons were first predicted for optical fibres by Hasegawa and Tappert (1973) and demonstrated experimentally by Mollenauer et al. (1980). They are described by the nonlinear Schrödinger equation:

\[
i\frac{\partial A}{\partial z} - \frac{k_2}{2}\frac{\partial^2 A}{\partial t^2} + \gamma|A|^2 A = 0
\]

where \(\gamma = n_2\omega_0/(c A_\text{eff})\) is the nonlinear coefficient. The fundamental soliton solution is \(A(z,t) = \sqrt{P_0}\,\text{sech}(t/T_0)\,e^{i\gamma P_0 z/2}\), where \(P_0 = |k_2|/(\gamma T_0^2)\) is the required peak power.

---

# Chapter 13: Reflection and Refraction — Complete Derivation

## 13.1 The Geometry of the Interface Problem

We consider a monochromatic plane wave \(\mathbf{E}_i = \mathbf{E}_{0i}\exp(i\mathbf{k}_i\cdot\mathbf{r} - i\omega t)\) incident on a planar interface (the \(z=0\) plane) from medium 1 (\(n_1\)) to medium 2 (\(n_2\)). The reflected wave \(\mathbf{E}_r = \mathbf{E}_{0r}\exp(i\mathbf{k}_r\cdot\mathbf{r} - i\omega t)\) propagates back into medium 1, and the transmitted (refracted) wave \(\mathbf{E}_t = \mathbf{E}_{0t}\exp(i\mathbf{k}_t\cdot\mathbf{r} - i\omega t)\) propagates into medium 2. All three waves have the same angular frequency \(\omega\) (required by boundary conditions that must hold for all time).

<div class="theorem">
<strong>Snell's Law from Boundary Conditions.</strong> The tangential component of the wave vector must be continuous across the interface (phase-matching condition). If the interface is the \(z=0\) plane and the plane of incidence is \(xz\), then:

\[
k_{ix} = k_{rx} = k_{tx}
\]
Since \(|\mathbf{k}_i| = |\mathbf{k}_r| = n_1\omega/c\) (both in medium 1) and \(|\mathbf{k}_t| = n_2\omega/c\) (in medium 2):

\[
n_1\frac{\omega}{c}\sin\theta_i = n_1\frac{\omega}{c}\sin\theta_r = n_2\frac{\omega}{c}\sin\theta_t
\]
The first equality gives \(\theta_r = \theta_i\) (law of reflection). The last equality gives \(n_1\sin\theta_i = n_2\sin\theta_t\) — Snell's law.
</div>

The derivation of Snell's law from wave-vector matching is more fundamental than the geometric argument from Huygens' construction: it works for anisotropic, absorbing, and even nonlinear media (with appropriate generalisation), whereas Huygens' principle requires additional care in those cases.

## 13.2 Fresnel Equations — Full Derivation for Both Polarisations

We now carry out the full derivation of the Fresnel amplitude coefficients from the electromagnetic boundary conditions. The boundary conditions at a dielectric-dielectric interface are:

- Tangential \(\mathbf{E}\) continuous: \(E_{t,\parallel}\) continuous
- Tangential \(\mathbf{H}\) continuous: \(H_{t,\parallel}\) continuous (no surface currents)
- Normal \(\mathbf{D}\) continuous: \(\varepsilon E_{n}\) continuous (no free charges)
- Normal \(\mathbf{B}\) continuous: \(B_{n}\) continuous

For the two polarisation cases:

<div class="theorem">
<strong>s-Polarisation (TE) Fresnel Coefficients.</strong> The electric field is perpendicular to the plane of incidence (along \(\hat{y}\) if the plane of incidence is \(xz\)). The magnetic field lies in the plane of incidence.

Applying continuity of \(E_y\) at \(z=0\):

\[
E_{0i} + E_{0r} = E_{0t} \quad (1)
\]
The \(y\)-component of \(\mathbf{H}\) for a plane wave with \(\mathbf{E}\) in \(\hat{y}\) and \(\mathbf{k}\) in the \(xz\) plane: \(H_x = -(n/\mu_0 c)E_y\cos\theta\). Continuity of \(H_x\):

\[
\frac{n_1}{\mu_0 c}\cos\theta_i(E_{0i} - E_{0r}) = \frac{n_2}{\mu_0 c}\cos\theta_t\,E_{0t} \quad (2)
\]
(The minus sign before \(E_{0r}\) arises because the reflected wave travels at angle \(-\theta_r\) to the \(z\)-axis, reversing the sign of \(k_z\), hence the sign of \(H_x\).) From (1), \(E_{0t} = E_{0i}+E_{0r}\). Substituting into (2):

\[
n_1\cos\theta_i(E_{0i} - E_{0r}) = n_2\cos\theta_t(E_{0i} + E_{0r})
\]

\[
E_{0i}(n_1\cos\theta_i - n_2\cos\theta_t) = E_{0r}(n_1\cos\theta_i + n_2\cos\theta_t)
\]

\[
\boxed{r_s = \frac{n_1\cos\theta_i - n_2\cos\theta_t}{n_1\cos\theta_i + n_2\cos\theta_t}}
\]
From (1): \(E_{0t} = E_{0i}(1+r_s)\), so:

\[
\boxed{t_s = \frac{2n_1\cos\theta_i}{n_1\cos\theta_i + n_2\cos\theta_t}}
\]
</div>

<div class="theorem">
<strong>p-Polarisation (TM) Fresnel Coefficients.</strong> The magnetic field is perpendicular to the plane of incidence (\(\hat{y}\)), and \(\mathbf{E}\) lies in the plane of incidence.

The \(x\)-component of \(\mathbf{E}\) (tangential) for the p-polarised incident, reflected, and transmitted waves:

\[
E_{0i}\cos\theta_i - E_{0r}\cos\theta_r = E_{0t}\cos\theta_t \quad (3)
\]
(The sign convention: the p-polarised reflected field has its \(x\)-component in the opposite sense because \(\mathbf{k}_r\) is reflected.) Continuity of tangential \(\mathbf{H}\) (which is purely in \(\hat{y}\)):

\[
\frac{n_1}{\mu_0 c}(E_{0i} + E_{0r}) = \frac{n_2}{\mu_0 c}E_{0t} \quad (4)
\]
From (4): \(E_{0t} = (n_1/n_2)(E_{0i}+E_{0r})\). Substituting into (3):

\[
E_{0i}\cos\theta_i - E_{0r}\cos\theta_i = \frac{n_1}{n_2}(E_{0i}+E_{0r})\cos\theta_t
\]

\[
E_{0i}\!\left(n_2\cos\theta_i - n_1\cos\theta_t\right) = E_{0r}\!\left(n_2\cos\theta_i + n_1\cos\theta_t\right)
\]

\[
\boxed{r_p = \frac{n_2\cos\theta_i - n_1\cos\theta_t}{n_2\cos\theta_i + n_1\cos\theta_t}}
\]

\[
\boxed{t_p = \frac{2n_1\cos\theta_i}{n_2\cos\theta_i + n_1\cos\theta_t}}
\]
</div>

The power reflectance is \(R = |r|^2\) for both polarisations. The power transmittance is found by accounting for the change in beam cross-section and wave impedance:

\[
T_s = \frac{n_2\cos\theta_t}{n_1\cos\theta_i}|t_s|^2, \qquad T_p = \frac{n_2\cos\theta_t}{n_1\cos\theta_i}|t_p|^2
\]

One can verify \(R_s + T_s = 1\) and \(R_p + T_p = 1\) using the Fresnel equations and Snell's law — a proof of energy conservation.

## 13.3 Brewster's Angle — Proof and Physics

Setting \(r_p = 0\):

\[
n_2\cos\theta_B = n_1\cos\theta_t
\]

Combined with Snell's law \(n_1\sin\theta_B = n_2\sin\theta_t\), we divide:

\[
\frac{\sin\theta_B}{\cos\theta_B} = \frac{n_2\cos\theta_t}{n_1\cos\theta_t}\cdot\frac{n_1}{n_2} = \frac{n_2}{n_1}
\]

Wait — let us redo this carefully. From \(r_p = 0\): \(n_2\cos\theta_B = n_1\cos\theta_t\). From Snell: \(\sin\theta_t = (n_1/n_2)\sin\theta_B\). Squaring and summing:

\[
\cos^2\theta_t + \sin^2\theta_t = \frac{n_1^2}{n_2^2}\cos^2\theta_B + \frac{n_1^2}{n_2^2}\sin^2\theta_B = \frac{n_1^2}{n_2^2} = 1
\]

This gives \(n_1 = n_2\), which is trivial — so we need a different approach. Instead: from \(n_2\cos\theta_B = n_1\cos\theta_t\) and Snell's law, divide:

\[
\frac{n_2\cos\theta_B}{n_1\sin\theta_B} = \frac{n_1\cos\theta_t}{n_2\sin\theta_t}
\]

\[
\frac{n_2^2\cos\theta_B\sin\theta_t}{n_1^2\sin\theta_B} = \cos\theta_t
\]

Using Snell's law \(n_2\sin\theta_t = n_1\sin\theta_B\), so \(\sin\theta_t/\sin\theta_B = n_1/n_2\):

\[
\frac{n_2^2}{n_1^2}\cdot\frac{n_1}{n_2}\cos\theta_B = \cos\theta_t \implies \frac{n_2}{n_1}\cos\theta_B = \cos\theta_t
\]

But this contradicts \(n_2\cos\theta_B = n_1\cos\theta_t\) unless \(n_1 = n_2\) — the clean resolution comes from noting that the condition \(r_p = 0\) is equivalent to the refracted and reflected rays being perpendicular to each other (\(\theta_B + \theta_t = 90°\), i.e., \(\theta_t = 90° - \theta_B\)):

\[
n_1\sin\theta_B = n_2\sin(90°-\theta_B) = n_2\cos\theta_B \implies \tan\theta_B = \frac{n_2}{n_1}
\]

For glass (\(n_2 = 1.52\)) in air: \(\theta_B = \arctan(1.52) \approx 56.7°\). The physical reason that \(r_p = 0\) at this angle is that the refracted wave drives atomic dipoles along the direction of the would-be reflected wave. Dipoles do not radiate along their axis, so no reflected wave is generated for p-polarisation at Brewster's angle. The s-polarised reflected wave still exists because the s-dipoles are always transverse to the reflected direction.

## 13.4 Total Internal Reflection and Evanescent Waves

For light going from a denser medium (\(n_1 > n_2\)), Snell's law gives \(\sin\theta_t = (n_1/n_2)\sin\theta_i > \sin\theta_i\). At the **critical angle** \(\theta_c = \arcsin(n_2/n_1)\), \(\theta_t = 90°\). For \(\theta_i > \theta_c\), \(\sin\theta_t > 1\), which has no real solution — the refracted wave becomes evanescent.

To see what happens analytically, write the transmitted wave with complex \(k_{tz}\):

\[
k_{tx} = n_1\frac{\omega}{c}\sin\theta_i, \quad k_{tz} = \sqrt{n_2^2\frac{\omega^2}{c^2} - k_{tx}^2} = i\kappa
\]

where \(\kappa = \frac{\omega}{c}\sqrt{n_1^2\sin^2\theta_i - n_2^2}\) is real and positive for \(\theta_i > \theta_c\). The transmitted field is:

\[
\mathbf{E}_t = \mathbf{E}_{0t}\,e^{-\kappa z}\,e^{i(k_{tx}x - \omega t)}
\]

This is an **evanescent wave**: it propagates along the interface (in \(x\)) but decays exponentially in the \(z\)-direction into medium 2 with a penetration depth \(\delta = 1/\kappa\). The Poynting vector of the evanescent wave has zero time-averaged \(z\)-component — no net energy flows into medium 2 (confirming total internal reflection is truly "total"). However, the instantaneous \(z\)-component oscillates, representing energy that sloshes in and out of medium 2.

The evanescent field is real and measurable. In **frustrated total internal reflection (FTIR)**, bringing a third medium (another prism) close to the interface (within a few \(\delta \sim \lambda\)) allows the evanescent field to couple into propagating waves in the third medium — analogous to quantum tunnelling. **Near-field scanning optical microscopy (NSOM/SNOM)** uses a tapered optical fibre tip brought within the evanescent decay length of a sample surface to achieve sub-diffraction-limited resolution (\(\sim 50\) nm). **Total internal reflection fluorescence microscopy (TIRFM)** uses the evanescent field to excite fluorophores only within \(\sim 100-200\) nm of the coverglass surface, providing exceptional axial sectioning for imaging membrane processes in living cells.

The Fresnel coefficients for TIR become complex — both \(r_s\) and \(r_p\) have magnitude 1 but acquire phase shifts:

\[
r_s = e^{2i\phi_s}, \quad r_p = e^{2i\phi_p}
\]

where \(\tan\phi_s = -\kappa/(n_1\cos\theta_i/\lambda_\text{free})\) and \(\tan\phi_p\) involves both \(n_1\) and \(n_2\). The phase difference \(\Delta\phi = \phi_p - \phi_s\) is the basis of the **Fresnel rhomb** — a glass prism designed to introduce a \(\pi/2\) phase shift between s and p components (converting linear to circular polarisation) using TIR. Unlike a wave plate, a Fresnel rhomb is achromatic (the phase shift is relatively wavelength-independent), making it useful for broadband quarter-wave retardation.

---

# Chapter 14: Birefringence and Crystal Optics

## 14.1 Anisotropic Media and the Dielectric Tensor

In an anisotropic crystal, the polarisation response depends on the direction of the electric field. The constitutive relation becomes tensorial:

\[
D_i = \varepsilon_0\sum_j \varepsilon_{ij} E_j
\]

where \(\boldsymbol{\varepsilon}\) is the **dielectric tensor** (a real, symmetric, \(3\times3\) matrix for a lossless crystal). The principal axes of \(\boldsymbol{\varepsilon}\) define the **crystal axes** along which \(\mathbf{D} \parallel \mathbf{E}\). In these principal coordinates, \(\boldsymbol{\varepsilon} = \text{diag}(\varepsilon_x, \varepsilon_y, \varepsilon_z)\), and the corresponding principal refractive indices are \(n_x = \sqrt{\varepsilon_x/\varepsilon_0}\), etc.

**Uniaxial crystals** (e.g., calcite, quartz, lithium niobate) have \(\varepsilon_x = \varepsilon_y \neq \varepsilon_z\). The axis along \(z\) is the **optic axis**. There are two refractive indices: the **ordinary index** \(n_o = \sqrt{\varepsilon_x/\varepsilon_0}\) (for polarisation perpendicular to the optic axis) and the **extraordinary index** \(n_e = \sqrt{\varepsilon_z/\varepsilon_0}\) (for polarisation along the optic axis). If \(n_e > n_o\), the crystal is positive uniaxial; if \(n_e < n_o\), it is negative uniaxial. Calcite is negative uniaxial (\(n_o = 1.658\), \(n_e = 1.486\) at 589 nm), and is the material in the classic Iceland spar experiments that first revealed double refraction.

## 14.2 Wave Propagation in Uniaxial Crystals

A plane wave propagating at angle \(\theta\) to the optic axis in a uniaxial crystal sees two normal modes with different speeds. The ordinary ray (o-ray) has its polarisation perpendicular to the plane containing \(\mathbf{k}\) and the optic axis, and it experiences the refractive index \(n_o\) regardless of \(\theta\). The extraordinary ray (e-ray) has its polarisation in the plane of \(\mathbf{k}\) and the optic axis, and it experiences an effective index:

\[
\frac{1}{n_e(\theta)^2} = \frac{\cos^2\theta}{n_o^2} + \frac{\sin^2\theta}{n_e^2}
\]

At \(\theta = 0°\) (along the optic axis): \(n_e(0) = n_o\) — no birefringence. At \(\theta = 90°\) (perpendicular to the optic axis): \(n_e(90°) = n_e\) — maximum birefringence \(\Delta n = n_e - n_o\). This angle dependence of the e-ray is the basis for **phase matching** in nonlinear optical processes (second harmonic generation, optical parametric amplification) where one adjusts the crystal orientation to make \(n(\omega) = n(2\omega)\), ensuring coherent build-up of the generated wave.

## 14.3 Wave Plates

A **wave plate** (retarder) exploits birefringence to introduce a controlled phase delay between two orthogonal polarisation components. For a crystal slab of thickness \(d\) with the optic axis perpendicular to the beam (\(\theta = 90°\)), the ordinary and extraordinary components accumulate phases \(\phi_o = n_o\omega d/c\) and \(\phi_e = n_e\omega d/c\). The **retardation** is:

\[
\Gamma = |\phi_e - \phi_o| = \frac{2\pi d|n_e - n_o|}{\lambda}
\]

For a **quarter-wave plate** (QWP), \(\Gamma = \pi/2\); for a **half-wave plate** (HWP), \(\Gamma = \pi\). A QWP with its fast axis at 45° to the input linear polarisation converts it to circular polarisation (as shown in Section 4.2). A HWP rotates the polarisation direction by \(2\theta\) (where \(\theta\) is the angle between the input polarisation and the fast axis). These operations are fundamental in polarimetry, ellipsometry, and optical communications (where polarisation multiplexing requires precise polarisation control).

---

# Chapter 15: Two-Beam Interference — Detailed Treatment

## 15.1 The Interference Condition

Consider two monochromatic plane waves with the same frequency \(\omega\), amplitudes \(E_1\) and \(E_2\), and a constant phase difference \(\delta\):

\[
E_1(t) = E_{01}\cos(\omega t), \quad E_2(t) = E_{02}\cos(\omega t + \delta)
\]

The total field at the observation point is \(E = E_1 + E_2\). The intensity (time-averaged) is:

\[
I = \varepsilon_0 c\langle E^2\rangle = \frac{\varepsilon_0 c}{2}\!\left(E_{01}^2 + E_{02}^2 + 2E_{01}E_{02}\cos\delta\right) = I_1 + I_2 + 2\sqrt{I_1 I_2}\cos\delta
\]

where the cross-term \(2\sqrt{I_1I_2}\cos\delta\) is the **interference term**. For equal amplitudes (\(I_1 = I_2 = I_0\)): \(I = 2I_0(1+\cos\delta) = 4I_0\cos^2(\delta/2)\). Bright fringes appear where \(\delta = 2m\pi\) (\(m\) integer); dark fringes where \(\delta = (2m+1)\pi\). The average intensity \(\langle I\rangle = 2I_0\) — interference redistributes intensity in space but conserves total energy.

The **fringe visibility** (or **contrast**) is:

\[
V = \frac{I_\text{max} - I_\text{min}}{I_\text{max} + I_\text{min}} = \frac{2\sqrt{I_1I_2}}{I_1 + I_2}
\]

For equal intensities (\(I_1 = I_2\)): \(V = 1\) (perfect fringes). For very unequal intensities: \(V \to 0\) (poor fringes). The visibility is also reduced by finite coherence (partial temporal or spatial coherence), as we discuss in Section 15.3.

## 15.2 The Mach-Zehnder Interferometer

The **Mach-Zehnder interferometer (MZI)** splits a beam with a beamsplitter (BS1), sends the two arms through different paths, and recombines them with a second beamsplitter (BS2). Unlike the Michelson, the two output beams of the MZI travel in different directions, making it convenient for transmission experiments and for inserting samples into one arm.

For a path length difference \(\Delta L\) between the two arms, the output intensities at the two ports of BS2 are:

\[
I_1 = I_0\cos^2\!\left(\frac{\pi\Delta L}{\lambda}\right), \quad I_2 = I_0\sin^2\!\left(\frac{\pi\Delta L}{\lambda}\right)
\]

These are complementary — when one port is bright, the other is dark. This is a consequence of energy conservation: the sum \(I_1 + I_2 = I_0\) at all path differences (ignoring losses).

In quantum information science, the MZI is the prototypical device for implementing a quantum beam splitter, and its two output ports are used to demonstrate wave-particle duality: a single photon "interferes with itself" through both arms simultaneously. The visibility of single-photon fringes, in the limit of perfect coherence, is 100% — even though there is never more than one photon in the apparatus at a time.

## 15.3 Newton's Rings

When a plano-convex lens of radius of curvature \(R\) rests on a flat glass plate, the air gap between the curved surface and the plate increases with radial distance \(r\) from the point of contact. At radius \(r\), the gap thickness is:

\[
d(r) \approx \frac{r^2}{2R} \quad (\text{for } r \ll R)
\]

The path difference between the ray reflected from the bottom surface of the lens and the ray reflected from the top of the plate is \(2d(r)\). However, the ray reflecting from the top of the plate (going from less-dense air into denser glass) undergoes a phase shift of \(\pi\) — equivalent to a half-wavelength path difference. Thus the effective path difference is \(2d(r) + \lambda/2\), and the condition for dark rings (destructive interference):

\[
2d(r) + \frac{\lambda}{2} = \left(m + \frac{1}{2}\right)\lambda \implies 2d(r) = m\lambda \implies r_m = \sqrt{m\lambda R}
\]

(where \(m = 0, 1, 2, \ldots\)). The central spot is dark (\(m = 0\)). The bright rings satisfy \(r_m = \sqrt{(m+1/2)\lambda R}\). Newton's rings provide a sensitive test of the spherical quality of the lens surface and can be used to measure \(R\) if \(\lambda\) is known, or to measure \(\lambda\) if \(R\) is known.

If the gap is filled with a liquid of refractive index \(n_l\), the path difference in the liquid becomes \(2n_l d(r)\) and the ring radii scale as \(r_m = \sqrt{m\lambda R/n_l}\) — Newton's rings in a liquid were historically used to measure refractive indices of liquids.

## 15.4 Thin Film Interference

For a film of refractive index \(n_f\) and uniform thickness \(d\) between media of indices \(n_1\) and \(n_3\), reflections from the top and bottom surfaces of the film interfere. The optical path difference between the two reflected beams (at near-normal incidence) is \(2n_f d\), with possible additional phase shifts of \(\pi\) at each interface where light goes from lower to higher index.

The general rule for the **net phase shift from reflections**:
- Reflection at a low-to-high index boundary: phase shift \(\pi\) (hard reflection).
- Reflection at a high-to-low index boundary: no phase shift (soft reflection).

For an air-film-glass system (\(n_1 = 1 < n_f < n_3\)): phase shift at the top surface (air to film) but not at the bottom (film to glass, both greater than air but film-to-glass can be either). For the simplest case where \(n_f < n_3\): one phase shift \(\pi\) at top, one at bottom — net additional phase \(\pi + \pi = 2\pi \equiv 0\). The condition for constructive interference is then:

\[
2n_f d = m\lambda \quad (m = 1, 2, 3, \ldots)
\]

For an air gap between two glass surfaces (Newton's rings): one phase shift at the bottom glass surface — net additional phase \(\pi\) — and the condition for dark rings (destructive) is \(2d = m\lambda\) as derived above.

In the **soap bubble** case (\(n_f > n_1 = n_3 = 1\)): phase shift \(\pi\) at the top surface (air to soap water) but no phase shift at the bottom surface (soap water to air). Net additional phase: \(\pi\). Constructive interference occurs when:

\[
2n_f d = \left(m + \frac{1}{2}\right)\lambda
\]

This is why soap bubbles show colours: for a given bubble wall thickness \(d\), only certain wavelengths are reinforced, producing vivid iridescent colours even in white-light illumination.

---

# Chapter 16: Multiple-Beam Interference — Fabry-Pérot in Detail

## 16.1 Multiple Reflections and the Airy Function

The Fabry-Pérot etalon consists of two parallel mirrors, each with amplitude reflectance \(r\) (for simplicity, real and equal) and amplitude transmittance \(t\), satisfying \(r^2 + t^2 = 1\) (no absorption: \(R + T = 1\) where \(R = r^2\), \(T = t^2\)). The separation is \(L\), the medium between the mirrors has index \(n\), and the angle of incidence inside the cavity is \(\theta\).

An incident wave \(E_0\) generates multiple transmitted beams by successive round trips. The transmitted fields are:

\[
E_1 = t^2 E_0, \quad E_2 = t^2 r^2 e^{i\delta} E_0, \quad E_3 = t^2 r^4 e^{2i\delta} E_0, \quad \ldots
\]

where \(\delta = 4\pi nL\cos\theta/\lambda\) is the round-trip phase shift (including a possible half-wave shift at each mirror for high-reflectivity coatings, which shifts the resonance condition but does not change the shape of the transmission function). Summing the geometric series:

\[
E_\text{tot} = t^2 E_0 \sum_{m=0}^{\infty} (r^2 e^{i\delta})^m = \frac{t^2 E_0}{1 - r^2 e^{i\delta}}
\]

The transmitted intensity \(I_T = |E_\text{tot}|^2\):

\[
I_T = \frac{T^2 I_0}{|1 - Re^{i\delta}|^2} = \frac{T^2 I_0}{(1-R)^2 + 4R\sin^2(\delta/2)}
\]

Dividing by \((1-R)^2/(1-R)^2 = 1\) and defining \(\mathcal{F} = 4R/(1-R)^2\):

\[
\boxed{\frac{I_T}{I_0} = \frac{T^2/(1-R)^2}{1 + \mathcal{F}\sin^2(\delta/2)} = \frac{1}{1+\mathcal{F}\sin^2(\delta/2)}}
\]

(using \(T = 1 - R\), so \(T^2/(1-R)^2 = 1\) for lossless mirrors). This is the **Airy function**. Its maximum value is 1 (perfect transmission) at resonance (\(\delta = 2m\pi\)), and minimum value \(1/(1+\mathcal{F})\) between resonances.

## 16.2 Finesse, Resolution, and Free Spectral Range

The **finesse** \(\mathcal{F}_\text{res}\) is the ratio of the free spectral range to the FWHM of a transmission peak. The FWHM in terms of phase is found by solving \(1 + \mathcal{F}\sin^2(\Delta\delta/4) = 2\), which for high finesse gives \(\Delta\delta \approx 4/\sqrt{\mathcal{F}}\). The free spectral range in phase is \(2\pi\), so:

\[
\mathcal{F}_\text{res} = \frac{2\pi}{\Delta\delta} = \frac{\pi\sqrt{\mathcal{F}}}{2} = \frac{\pi\sqrt{R}}{1-R}
\]

For \(R = 0.99\): \(\mathcal{F}_\text{res} = \pi\times0.995/0.01 \approx 312\). For \(R = 0.9999\) (a super-mirror): \(\mathcal{F}_\text{res} \approx 31{,}415\). In terms of frequency, the free spectral range is:

\[
\Delta\nu_\text{FSR} = \frac{c}{2nL}
\]

(the round-trip frequency for a photon bouncing between the mirrors). The minimum resolvable frequency difference (Rayleigh criterion: two peaks separated by one FWHM) is:

\[
\delta\nu_\text{min} = \frac{\Delta\nu_\text{FSR}}{\mathcal{F}_\text{res}} = \frac{c}{2nL\mathcal{F}_\text{res}}
\]

The resolving power is:

\[
\mathcal{R} = \frac{\nu}{\delta\nu_\text{min}} = \mathcal{F}_\text{res}\cdot m
\]

where \(m = 2nL/\lambda\) is the interference order. A Fabry-Pérot with \(L = 1\) cm, \(n = 1\), \(\mathcal{F}_\text{res} = 300\), and \(\lambda = 500\) nm: \(m = 4\times10^4\), \(\mathcal{R} = 1.2\times10^7\) — orders of magnitude better than a diffraction grating spectrometer, which typically achieves \(\mathcal{R} \sim 10^5\).

## 16.3 Applications of Fabry-Pérot Cavities

The Fabry-Pérot etalon is the workhorse of precision spectroscopy. As a **laser cavity**, it selects longitudinal modes: only frequencies satisfying \(\delta = 2m\pi\), i.e., \(\nu = mc/(2nL)\), experience constructive interference and can lase. Adding a **mode-selecting etalon** inside the laser cavity (an etalon whose FSR is larger than the gain bandwidth) restricts lasing to a single longitudinal mode — achieving single-frequency operation with very narrow linewidth (\(\sim\) kHz or less).

As a **scanning Fabry-Pérot spectrometer**, one ramps the mirror separation (with a piezoelectric actuator) while recording the transmitted intensity — the transmission function sweeps through resonances, recording the spectral profile of the input light. With a calibrated sweep, this is a standard technique for measuring laser linewidths and for observing the mode structure of laser output.

In **optical cavity QED** (cavity quantum electrodynamics), a single atom is placed inside a high-finesse Fabry-Pérot cavity (finesse \(\sim 10^5-10^6\)) so that the coupling rate of the atom to a single photon in the cavity exceeds both the atomic decay rate and the cavity decay rate. In this **strong coupling regime**, the atom-photon system forms new hybrid energy eigenstates — a paradigmatic experiment in quantum optics that has enabled quantum gate operations, single-photon sources, and the study of quantum information storage.

---

# Chapter 17: Diffraction Theory — A Systematic Development

## 17.1 Scalar Diffraction Theory — The Rayleigh-Sommerfeld Formulation

Kirchhoff's diffraction theory, while physically intuitive, has an internal inconsistency: the boundary conditions assumed at the aperture (field and its derivative simultaneously zero outside, and equal to the incident field inside) over-specify the problem and are inconsistent with the wave equation. The **Rayleigh-Sommerfeld (RS) theory** removes this inconsistency by using only one boundary condition (either the field or its normal derivative, but not both).

The first Rayleigh-Sommerfeld diffraction integral is:

\[
U(P) = \frac{1}{i\lambda}\iint_\Sigma U(Q)\,\frac{e^{ikr}}{r}\cos\chi\,dS
\]

where \(\cos\chi = \hat{n}\cdot\hat{r}\) is the cosine of the angle between the aperture normal and the direction from \(Q\) to \(P\), replacing Kirchhoff's obliquity factor \((1+\cos\chi)/2\). For propagation angles much less than 90°, \(\cos\chi \approx 1\) and the two theories give essentially identical results.

The RS integral can be interpreted as a convolution: \(U(P) = U_0 * h_\text{RS}\), where \(h_\text{RS}(x,y;z)\) is the RS propagator (the RS Green's function evaluated at \(z\)). Taking the 2D Fourier transform:

\[
\tilde{U}(u,v;z) = \tilde{U}_0(u,v)\cdot\tilde{h}(u,v;z)
\]

with \(\tilde{h}(u,v;z) = e^{iz\sqrt{k^2-4\pi^2(u^2+v^2)}}\) — this is the **angular spectrum method**, exact within scalar theory. Each spatial frequency \((u,v)\) propagates with a phase \(e^{ik_z z}\) where \(k_z = \sqrt{k^2 - (2\pi u)^2 - (2\pi v)^2}\). For \((2\pi u)^2 + (2\pi v)^2 > k^2\), \(k_z\) becomes imaginary and the wave is evanescent — these are the components beyond the diffraction limit (spatial frequencies greater than \(1/\lambda\)) that decay exponentially and cannot be recovered in the far field.

## 17.2 Fraunhofer Diffraction — Single Slit in Detail

For a single rectangular slit of width \(a\) in the \(x\)-direction and infinite extent in \(y\), the aperture function is \(t(x) = \text{rect}(x/a)\). In the Fraunhofer limit:

\[
U(\theta) \propto \int_{-a/2}^{a/2} e^{-i(2\pi/\lambda)x\sin\theta}\,dx = a\,\frac{\sin(\pi a\sin\theta/\lambda)}{\pi a\sin\theta/\lambda} = a\,\text{sinc}\!\left(\frac{a\sin\theta}{\lambda}\right)
\]

The intensity pattern:

\[
I(\theta) = I_0\,\text{sinc}^2\!\left(\frac{a\sin\theta}{\lambda}\right) = I_0\!\left(\frac{\sin\beta}{\beta}\right)^2, \qquad \beta = \frac{\pi a\sin\theta}{\lambda}
\]

Key features:
- Central maximum at \(\theta = 0\), width (first zeros) at \(\sin\theta = \pm\lambda/a\).
- Secondary maxima at approximately \(\sin\theta \approx \pm 3\lambda/(2a), \pm 5\lambda/(2a), \ldots\), with intensities \(I_0\times4/(9\pi^2), 4/(25\pi^2),\ldots\)
- The angular width of the central maximum is \(2\lambda/a\) — inversely proportional to the slit width. A wide slit gives a narrow diffraction pattern (approaching geometrical optics as \(a/\lambda \to \infty\)); a narrow slit gives a wide diffraction pattern.

The physical interpretation is the wave-optics complement of the uncertainty principle: a slit of width \(a\) confines a photon's \(x\)-position to within \(\Delta x = a\), giving it a transverse momentum uncertainty \(\Delta p_x \sim h/a\), which corresponds to an angular spread \(\Delta\theta \sim \lambda/a\) — exactly the diffraction half-angle. This is not coincidence: Fraunhofer diffraction is a direct realisation of the position-momentum uncertainty principle.

## 17.3 The Diffraction Grating — Resolving Power and Blaze

A diffraction grating with \(N\) slits of width \(a\) and period \(d\) has the intensity pattern:

\[
I(\theta) = I_0\underbrace{\text{sinc}^2\!\left(\frac{\pi a\sin\theta}{\lambda}\right)}_{\text{single-slit envelope}}\cdot\underbrace{\frac{\sin^2(N\pi d\sin\theta/\lambda)}{\sin^2(\pi d\sin\theta/\lambda)}}_{\text{multi-slit interference factor}}
\]

The multi-slit factor has principal maxima (of value \(N^2\)) when \(d\sin\theta = m\lambda\) — the **grating equation**. These principal maxima have FWHM (in \(\sin\theta\)) of approximately \(\lambda/(Nd)\). Adjacent principal maxima are separated by \(\Delta\sin\theta = \lambda/d\). The **chromatic resolving power** is found by the Rayleigh criterion — two wavelengths are just resolved when the principal maximum of one coincides with the first minimum of the other:

\[
\mathcal{R} = \frac{\lambda}{\delta\lambda} = mN
\]

where \(m\) is the diffraction order and \(N\) is the number of illuminated grooves.

<div class="theorem">
<strong>Proof of Resolving Power \(\mathcal{R} = mN\).</strong> The principal maximum of order \(m\) for wavelength \(\lambda\) is at \(\sin\theta_m = m\lambda/d\). The first minimum of the multi-slit factor adjacent to this maximum is at \(\sin\theta = m\lambda/d + \lambda/(Nd)\) (the next zero of \(\sin(N\pi d\sin\theta/\lambda)\)). For wavelength \(\lambda + \delta\lambda\), the order-\(m\) maximum is at \(\sin\theta = m(\lambda+\delta\lambda)/d\). Setting these equal:

\[
\frac{m(\lambda+\delta\lambda)}{d} = \frac{m\lambda}{d} + \frac{\lambda}{Nd}
\]

\[
\frac{m\,\delta\lambda}{d} = \frac{\lambda}{Nd} \implies \delta\lambda = \frac{\lambda}{mN} \implies \mathcal{R} = \frac{\lambda}{\delta\lambda} = mN
\]
</div>

The **blaze condition** optimises the grating efficiency for a particular wavelength by tilting the grating grooves at the **blaze angle** \(\theta_b\) so that the specular reflection direction from each groove face coincides with the desired diffraction order. The blaze wavelength for a grating used in Littrow configuration (incident and diffracted beams collinear, both at angle \(\theta_b\) to the normal) is:

\[
\lambda_b = \frac{2d\sin\theta_b}{m}
\]

At the blaze wavelength, essentially all diffracted energy is concentrated in order \(m\), rather than being spread over many orders. Most modern gratings are blazed gratings produced by diamond ruling or ion etching.

---

# Chapter 18: Coherence — A Rigorous Treatment

## 18.1 The Wiener-Khinchin Theorem and Power Spectral Density

We established in Section 5.1 that the coherence function and the power spectrum are related by a Fourier transform. Let us derive this precisely. For a stationary ergodic random process (time averages equal ensemble averages), the temporal coherence function is:

\[
\Gamma(\tau) = \lim_{T\to\infty}\frac{1}{2T}\int_{-T}^{T} E^*(t)\,E(t+\tau)\,dt
\]

The power spectral density is:

\[
S(\nu) = \lim_{T\to\infty}\frac{1}{2T}\left|\int_{-T}^{T} E(t)\,e^{-2\pi i\nu t}\,dt\right|^2 = \lim_{T\to\infty}\frac{|\tilde{E}_T(\nu)|^2}{2T}
\]

The Wiener-Khinchin theorem states \(S(\nu) = \int_{-\infty}^{\infty}\Gamma(\tau)\,e^{-2\pi i\nu\tau}\,d\tau\), i.e., \(S(\nu) = \mathcal{F}\{\Gamma(\tau)\}\). Conversely, \(\Gamma(\tau) = \mathcal{F}^{-1}\{S(\nu)\}\).

This theorem has profound consequences. For a spectrally narrow source with Gaussian spectral profile \(S(\nu) = S_0\exp\!\left[-(\nu-\nu_0)^2/(2\sigma_\nu^2)\right]\), the coherence function is also Gaussian:

\[
\Gamma(\tau) = S_0\sqrt{2\pi}\sigma_\nu\,e^{-2\pi i\nu_0\tau}\,e^{-2\pi^2\sigma_\nu^2\tau^2}
\]

The coherence time is \(\tau_c = 1/(2\pi\sigma_\nu) = 1/\Delta\nu\) where \(\Delta\nu = 2\sqrt{2\ln 2}\,\sigma_\nu\) is the FWHM bandwidth. For a rectangular spectrum (top-hat) of width \(\Delta\nu\), \(\Gamma(\tau) \propto \text{sinc}(\Delta\nu\tau)\) — the coherence function oscillates and decays, with first zero at \(\tau = 1/\Delta\nu\). In both cases, the coherence time is \(\tau_c \sim 1/\Delta\nu\).

## 18.2 Coherence in Interferometers

In a Michelson interferometer, the fringe visibility as a function of path difference \(\Delta = c\tau\) is:

\[
V(\Delta) = \frac{|\Gamma(\tau)|}{\Gamma(0)} = |\gamma(\tau)|
\]

where \(\gamma(\tau)\) is the normalised coherence function (complex degree of temporal coherence). The **fringe visibility envelope** directly measures the Fourier transform of the spectrum. This is the principle of **Fourier transform spectroscopy (FTS)**: by recording \(I(\Delta)\) as the mirror is scanned, one obtains the spectrum \(S(\nu)\) by Fourier transform. FTS has advantages over dispersive spectrometers for broad-bandwidth sources: it has higher throughput (no entrance slit needed — the Jacquinot advantage) and higher resolving power for a given mirror travel. Modern FTS instruments are the workhorses of atmospheric remote sensing and mid-infrared molecular spectroscopy.

## 18.3 Coherence and Imaging — The Abbe Resolution Criterion

Ernst Abbe (1873) analysed image formation in a microscope as a diffraction process. For an object illuminated coherently (e.g., by a point source at the condenser focus), the imaging condition is that the objective lens must collect at least the first diffraction order from the finest periodic structure in the object. For a structure with spatial period \(p\) (spatial frequency \(u = 1/p\)), the first-order diffracted beam makes angle \(\theta\) with the optical axis where \(\sin\theta = \lambda/p\). The objective lens of numerical aperture \(\text{NA} = n\sin\theta_\text{max}\) collects this order if \(\text{NA} \geq n\lambda/p\), i.e., \(p \geq \lambda/\text{NA}\). The **Abbe resolution limit** (for coherent illumination) is:

\[
\delta_\text{coherent} = \frac{\lambda}{\text{NA}}
\]

For incoherent illumination (Rayleigh criterion applied to the incoherent PSF), the resolution is:

\[
\delta_\text{incoherent} = \frac{0.61\lambda}{\text{NA}}
\]

Incoherent illumination thus gives approximately a factor of 1.6 better resolution than coherent illumination for the same numerical aperture. Abbe's insight was that a perfect lens is not sufficient for high resolution: one must also collect sufficiently high diffraction orders. This led to the design of objectives with higher NA (oil-immersion objectives, \(\text{NA} = 1.4\) for \(n = 1.515\) immersion oil) and the development of **confocal microscopy**, where the point illumination and point detection effectively square the PSF, improving axial sectioning and marginally improving transverse resolution.

Modern **super-resolution** techniques (STED, PALM, STORM, SIM) circumvent the Abbe limit by exploiting nonlinear photophysics of fluorophores or by structured illumination — the 2014 Nobel Prize in Chemistry was awarded for STED and PALM/STORM microscopy.

---

# Chapter 19: Laser Physics

## 19.1 Stimulated Emission and the Einstein Coefficients

Albert Einstein's 1917 paper introduced the three fundamental processes by which atoms interact with radiation:

- **Spontaneous emission**: an atom in excited state \(\vert 2\rangle\) (energy \(E_2\)) spontaneously decays to \(\vert 1\rangle\) (energy \(E_1\)) at rate \(A_{21}\) (Einstein A coefficient), emitting a photon of energy \(\hbar\omega = E_2 - E_1\) in a random direction with random phase.
- **Absorption**: an atom in \(\vert 1\rangle\) absorbs a photon and transitions to \(\vert 2\rangle\) at rate \(B_{12}\rho(\omega)\), where \(\rho(\omega)\) is the spectral energy density of the radiation field and \(B_{12}\) is the Einstein B coefficient for absorption.
- **Stimulated emission**: an atom in \(\vert 2\rangle\) is triggered by an incident photon to emit an identical photon at rate \(B_{21}\rho(\omega)\). The emitted photon is coherent with (same frequency, phase, polarisation, and direction as) the triggering photon.

Einstein showed that in thermal equilibrium (Boltzmann statistics), the A and B coefficients are related:

\[
A_{21} = \frac{\hbar\omega^3}{\pi^2 c^3}\,B_{21}, \qquad B_{12} = B_{21}
\]

The first relation shows that spontaneous emission becomes relatively more important at high frequencies (which is why microwave masers are easier to build than UV lasers). The second relation shows that the stimulated emission cross-section equals the absorption cross-section.

## 19.2 Population Inversion and the Threshold Condition

In thermal equilibrium at temperature \(T\), the ratio of population in state 2 to state 1 follows the Boltzmann distribution: \(N_2/N_1 = g_2/g_1\cdot\exp(-\hbar\omega/k_BT)\). For optical frequencies (\(\hbar\omega \sim 2\) eV) at room temperature (\(k_BT \sim 0.025\) eV): \(N_2/N_1 \sim e^{-80} \approx 0\) — essentially all atoms are in the ground state. Stimulated emission cannot overcome absorption under these conditions.

**Population inversion** (\(N_2 > N_1\)) is required for amplification. It cannot be achieved with a two-level system: the strongest driving produces an equal mixture (\(N_2 = N_1\)), not an inversion. Three- and four-level laser schemes use a third or fourth energy level:

In a **four-level laser** (e.g., Nd:YAG): atoms are pumped from level 0 to level 3 (by optical or electrical pumping). Level 3 decays rapidly and non-radiatively to level 2 (the upper laser level). Stimulated emission occurs from level 2 to level 1. Level 1 decays rapidly to level 0 (which is near-empty in thermal equilibrium). With level 1 nearly empty, inversion between levels 2 and 1 is easy to achieve.

The laser threshold condition: the gain per round trip must equal the round-trip loss. For a laser with gain medium of length \(\ell\) and gain coefficient \(g\) (per unit length), in a cavity of round-trip loss factor \(\mathcal{L}\) (including mirror transmission and internal losses):

\[
R_1 R_2\,(1-\mathcal{L}_i)^2\,e^{2g\ell} = 1
\]

Taking logarithms:

\[
2g\ell = \ln\!\left(\frac{1}{R_1 R_2}\right) + 2\mathcal{L}_i = \delta_\text{total}
\]

The threshold gain coefficient is \(g_\text{th} = \delta_\text{total}/(2\ell)\). Since the gain is proportional to the population inversion, \(g = \sigma_{21}(N_2 - N_1)\) (where \(\sigma_{21}\) is the stimulated emission cross-section), the threshold inversion density is:

\[
\Delta N_\text{th} = N_2 - N_1\big|_\text{th} = \frac{\delta_\text{total}}{2\sigma_{21}\ell}
\]

## 19.3 Rate Equations and the Laser Above Threshold

The coupled rate equations for the upper laser level population \(N_2\) (atoms per unit volume) and the intracavity photon number \(q\) are:

\[
\frac{dN_2}{dt} = R_p - \frac{N_2}{\tau_{21}} - \frac{c\sigma_{21}}{n}\,N_2\,q\cdot\frac{1}{V_\text{mode}}
\]

\[
\frac{dq}{dt} = \frac{c\sigma_{21}}{n}(N_2 - N_1)\,q\cdot V_\text{active} - \frac{q}{\tau_c} + \text{(spontaneous emission term)}
\]

where \(R_p\) is the pump rate (atoms excited per unit volume per second), \(\tau_{21}\) is the upper level lifetime, \(\tau_c = 2nL/(c\delta_\text{total})\) is the photon lifetime in the cavity, and the \(\sigma v q\) terms represent stimulated emission gain. In steady state (\(dN_2/dt = dq/dt = 0\)) above threshold:

\[
N_2|_\text{above threshold} = N_\text{th} = \frac{1}{\sigma_{21}\tau_c\,c/n}
\]

The upper level population is clamped at threshold — any additional pumping above threshold goes into generating more photons rather than increasing the inversion. The intracavity photon number scales linearly with the excess pump rate above threshold:

\[
q = \frac{R_p - R_{p,\text{th}}}{1/\tau_c - \text{const}} \propto (R_p - R_{p,\text{th}})
\]

The output power (through one mirror of reflectance \(R_1 = 1 - T_1\)) is:

\[
P_\text{out} = \frac{\hbar\omega\,q\,T_1}{\tau_c}
\]

This linear relationship between output power and pump rate above threshold is the characteristic "L-I curve" (light-current curve for diode lasers, light-pump curve for solid-state lasers), measured routinely in laser characterisation.

## 19.4 Cavity Modes — Longitudinal and Transverse

The resonant frequencies of a laser cavity are the longitudinal modes at:

\[
\nu_q = \frac{qc}{2nL} \quad (q = 1, 2, 3, \ldots)
\]

separated by the free spectral range \(\Delta\nu_L = c/(2nL)\). For a typical He-Ne laser (\(L = 30\) cm): \(\Delta\nu_L = 500\) MHz. The gain bandwidth of the Ne transition at 632.8 nm is about 1.5 GHz (inhomogeneously broadened by Doppler shifts of the Ne atoms) — so typically 2-3 longitudinal modes fall within the gain bandwidth and lase simultaneously. A short laser cavity (\(L < c/(2\Delta\nu_\text{gain})\)) supports only a single longitudinal mode.

The transverse mode structure is determined by the resonator geometry. For a stable Gaussian resonator, the transverse modes are Hermite-Gaussian (HG) modes (for rectangular symmetry) or Laguerre-Gaussian (LG) modes (for cylindrical symmetry):

- **HG\(_{mn}\) modes**: intensity distributions proportional to \(H_m^2(x/w)H_n^2(y/w)\exp(-2r^2/w^2)\), where \(H_m\) are Hermite polynomials.
- **LG\(_{p\ell}\) modes**: beams with orbital angular momentum \(\ell\hbar\) per photon, carrying a helical phase front \(e^{i\ell\phi}\) and having a doughnut-shaped intensity profile for \(\ell \neq 0\).

The fundamental TEM\(_{00}\) mode (both \(m = n = 0\) or \(p = \ell = 0\)) is the Gaussian beam treated in Chapter 8. Single-mode lasers use an intracavity aperture or a short cavity to suppress all but the TEM\(_{00}\) mode, providing the highest beam quality and smallest beam divergence.

## 19.5 Q-Switching and Mode-Locking

**Q-switching** generates intense nanosecond pulses by rapidly switching the cavity quality factor \(Q\). With the Q initially low (high loss), the gain medium is pumped to a large inversion without lasing. The Q is then suddenly switched high (low loss), and the stored energy is released in a single giant pulse of duration \(\sim\) ns with peak power \(\gg\) the CW output. Practical Q-switches use: electrooptic Pockels cells (very fast, \(<1\) ns switching); acousto-optic modulators; rotating mirrors; or saturable absorbers (passive Q-switching).

**Mode-locking** generates ultrashort pulses (picosecond to femtosecond) by establishing a fixed phase relationship among the \(N\) longitudinal modes that oscillate simultaneously. If all modes oscillate with equal amplitudes and equally spaced frequencies \(\nu_q = \nu_0 + q\Delta\nu_L\) with zero relative phases:

\[
E(t) = E_0\sum_{q=0}^{N-1}e^{i2\pi(\nu_0 + q\Delta\nu_L)t} = E_0\,e^{i2\pi\nu_0 t}\frac{\sin(N\pi\Delta\nu_L t)}{\sin(\pi\Delta\nu_L t)}
\]

The intensity envelope \(\propto \sin^2(N\pi\Delta\nu_L t)/\sin^2(\pi\Delta\nu_L t)\) — identical in form to the multi-slit diffraction pattern — consists of a train of pulses separated by \(T = 1/\Delta\nu_L = 2nL/c\) (the round-trip time), each of duration \(\delta t \approx 1/(N\Delta\nu_L) = 1/\Delta\nu_\text{total}\) (where \(\Delta\nu_\text{total}\) is the total locked bandwidth). A Ti:sapphire laser with a gain bandwidth of \(\sim 100\) THz can generate pulses as short as 5 femtoseconds — about 2-3 optical cycles. Mode-locking is implemented by:

- **Active mode-locking**: an intracavity modulator (acousto-optic or electro-optic) driven at the round-trip frequency \(\Delta\nu_L\) periodically modulates the gain or loss, locking the mode phases.
- **Passive mode-locking (Kerr lens mode-locking, KLM)**: in Ti:sapphire lasers, the Kerr effect focuses intense (mode-locked) pulses more tightly than weak (CW) fields. An intracavity aperture preferentially blocks the CW beam — a nonlinear "soft aperture" — causing the laser to prefer the pulsed regime. KLM is capable of generating the shortest optical pulses.
- **Semiconductor saturable absorber mirrors (SESAMs)**: a mirror whose reflectivity increases at high intensity (saturable absorber behaviour) provides passive mode-locking in solid-state and fibre lasers.

---

# Chapter 20: Advanced Topics in Fourier Optics

## 20.1 The 4-f System and Optical Processing

The **4-f optical system** consists of two thin lenses \(L_1\) and \(L_2\) with focal lengths \(f_1\) and \(f_2\), arranged so that the input plane is at distance \(f_1\) in front of \(L_1\), the Fourier (filter) plane is at distance \(f_1\) behind \(L_1\) (= \(f_2\) in front of \(L_2\)), and the output plane is at distance \(f_2\) behind \(L_2\). The total system length is \(f_1 + f_1 + f_2 + f_2 = 2f_1 + 2f_2\) — hence "4-f."

The field in the Fourier plane is proportional to \(\mathcal{F}\{U_\text{in}\}(x'/\lambda f_1, y'/\lambda f_1)\), the Fourier transform of the input evaluated at spatial frequencies \((u,v) = (x'/\lambda f_1, y'/\lambda f_1)\). A filter mask \(H(x',y')\) placed in the Fourier plane multiplies the spectrum by \(H\). The output field is then:

\[
U_\text{out}(x'',y'') \propto \mathcal{F}^{-1}\!\left\{H(u,v)\cdot\mathcal{F}\{U_\text{in}\}(u,v)\right\} = U_\text{in} * h
\]

where \(h = \mathcal{F}^{-1}\{H\}\) is the impulse response (PSF) of the filtered system. The 4-f system implements **linear shift-invariant filtering** optically, in real time. This is far faster than digital filtering for large image formats: optical processing at the speed of light.

Classic 4-f filter operations:
- **Low-pass filter** (circular aperture in Fourier plane): blurs the image, removes high-frequency noise.
- **High-pass filter** (central stop in Fourier plane, passing only high spatial frequencies): edge enhancement, used in schlieren imaging of density gradients in fluids and gases.
- **Phase contrast filter** (Zernike phase plate: small phase-shifting dot at the centre of the Fourier plane): converts phase modulation (invisible) into amplitude modulation (visible) — the basis of phase contrast microscopy.
- **Matched filter**: \(H(u,v) = \tilde{G}^*(u,v)\) where \(G\) is a target pattern. The output intensity \(|U_\text{out}|^2\) is proportional to the cross-correlation of the input with the target — bright spots indicate where the target appears in the input image. This is the optical implementation of a **correlation filter**, used for pattern recognition.

## 20.2 Resolution Beyond the Diffraction Limit — STED and SIM

Conventional far-field microscopy is limited to a resolution of \(\sim 200\) nm (visible light, high-NA objective) by the Abbe criterion. Several techniques overcome this limit:

**Stimulated Emission Depletion (STED) microscopy**: a Gaussian excitation beam is overlapped with a doughnut-shaped STED beam (a LG mode with azimuthal phase \(e^{i\phi}\), creating a zero-intensity centre). The STED beam drives stimulated emission in the outer annulus of the excitation spot, depleting fluorophores back to the ground state before they can emit spontaneously. Only the very central zero of the STED beam remains fluorescing. By increasing the STED beam power, the effective fluorescence volume can be squeezed far below the diffraction limit:

\[
\delta_\text{STED} \approx \frac{\lambda}{2n\sin\theta\,\sqrt{1 + I_\text{STED}/I_\text{sat}}}
\]

where \(I_\text{sat}\) is the saturation intensity of the STED transition. With \(I_\text{STED}/I_\text{sat} \gg 1\), resolutions of \(\sim 20-30\) nm have been achieved in biological imaging.

**Structured Illumination Microscopy (SIM)**: the sample is illuminated with a sinusoidal pattern \(I_\text{exc}(x) \propto 1 + \cos(2\pi u_0 x)\). The fluorescence image contains **Moiré** terms: \(S(\mathbf{r})\propto f(\mathbf{r})\cdot(1+\cos(2\pi u_0 x))\), which in Fourier space mixes the sample's spectrum \(F(u)\) with copies shifted by \(\pm u_0\). By rotating and phase-shifting the illumination pattern and computationally unmixing the images, one can recover spatial frequencies up to \(u_0 + u_c\) (where \(u_c = \text{NA}/\lambda\) is the conventional cutoff) — achieving a factor of 2 improvement in resolution (to \(\sim 100\) nm). Nonlinear SIM (using saturating illumination) can further extend this to \(\sim 50\) nm.

## 20.3 Holography

Holography (Gabor, 1948; practical with lasers after Leith and Upatnieks, 1962) records the complete wavefront — amplitude and phase — of light scattered by an object, using interference with a reference beam.

**Recording**: object wave \(O(\mathbf{r}) = |O|e^{i\phi_O}\) and reference wave \(R(\mathbf{r}) = |R|e^{i\phi_R}\) interfere at the holographic plate. The recorded intensity (hologram) is:

\[
I_H(\mathbf{r}) = |R + O|^2 = |R|^2 + |O|^2 + R^*O + RO^*
\]

The amplitude transmittance of the developed hologram is \(t \propto I_H\).

**Reconstruction**: illuminate the hologram with the reference wave \(R\):

\[
t\cdot R \propto \left(|R|^2 + |O|^2\right)R + |R|^2 O + R^2 O^*
\]

The third term \(|R|^2 O\) is proportional to the original object wave — it reconstructs the wavefront exactly as though the object were still present. An observer looking through the hologram sees a perfect three-dimensional virtual image of the object. The fourth term \(R^2 O^*\) generates a conjugate (real) image on the opposite side of the hologram. In off-axis holography (Leith-Upatnieks), the reference beam is tilted so that the three terms are angularly separated, avoiding overlap.

The information density of a hologram is enormous: a \(10\times10\) cm hologram stores not just a 2D image but full 3D parallax information. The storage density is limited by the spatial frequency bandwidth of the holographic recording material — holographic emulsions can resolve \(\sim 5000\) lines/mm (vs. \(\sim 100\) lines/mm for ordinary photographic film), allowing the storage of wavelength-scale interference fringes.

---

# Chapter 21: Optical Coherence and Interferometry in Measurement

## 21.1 Optical Coherence Tomography

**Optical Coherence Tomography (OCT)** combines the depth-sectioning capability of coherence gating with the sensitivity of interferometry to produce three-dimensional images of scattering media (biological tissue, semiconductor wafers) with micron-scale axial resolution without physical sectioning.

The principle is **white-light (low-coherence) interferometry**: a broadband source (superluminescent diode, mode-locked laser, or supercontinuum) with coherence length \(L_c \ll\) sample depth is used in a Michelson interferometer. The reference mirror is scanned in depth (time-domain OCT) or the reference is fixed and the spectrum is recorded (spectral-domain OCT, SD-OCT). Interference (bright fringe) occurs only when the path length from the sample matches the reference path within \(L_c\). By scanning the sample, a depth profile (A-scan) and ultimately a 3D volumetric image are obtained.

In SD-OCT, instead of scanning the reference mirror, the interference spectrum \(I(\nu) = |E_R(\nu) + E_S(\nu)|^2\) is recorded on a spectrometer. The depth profile is obtained by Fourier transform of \(I(\nu)\) — since each depth layer in the sample produces a sinusoidal modulation of the spectrum with frequency proportional to the depth, the Fourier transform maps frequency to depth. SD-OCT offers dramatically higher speed (no mechanical scanning) and sensitivity compared to TD-OCT. Modern ophthalmic OCT systems image the retina with \(\sim 3\;\mu\text{m}\) axial resolution at acquisition rates of \(>200{,}000\) A-scans/second.

The axial resolution of OCT is determined entirely by the coherence length of the source:

\[
\delta z = \frac{2\ln 2}{\pi}\,\frac{\lambda^2}{\Delta\lambda}
\]

where \(\Delta\lambda\) is the source bandwidth. For a 840 nm source with 50 nm bandwidth: \(\delta z \approx 6\;\mu\text{m}\). The lateral resolution is determined by the focusing optics (NA of the objective), just as in a conventional microscope. OCT is particularly powerful for imaging the retina, cornea, and anterior eye segment; for coronary artery imaging via catheter (intracoronary OCT); and for non-destructive testing of multilayer coatings and semiconductor devices.

## 21.2 Gravitational Wave Detection — LIGO

The **Laser Interferometer Gravitational-Wave Observatory (LIGO)** represents the ultimate application of optical interferometry: measuring spacetime distortions due to passing gravitational waves — ripples in the fabric of spacetime predicted by general relativity and first detected directly on 14 September 2015 (GW150914, from the merger of two black holes \(\sim 1.3\) billion light-years away).

LIGO is a Michelson interferometer with arm lengths \(L = 4\) km, enhanced by:

1. **Fabry-Pérot arm cavities**: mirrors at the far end of each arm form a high-finesse cavity (finesse \(\sim 450\)) with the input test mass, increasing the effective arm length to \(\sim 1700\) km and thus the sensitivity.
2. **Power recycling**: a recycling mirror between the laser and the beamsplitter reflects the light that returns toward the laser (normally, at the dark fringe, all light exits toward the laser and is wasted) back into the interferometer, building up the intracavity power to \(\sim 750\) kW.
3. **Signal recycling**: another mirror at the output port of the beamsplitter enhances the signal in a chosen frequency band.
4. **Squeezed light injection**: quantum noise (shot noise from photon counting statistics and radiation pressure noise from photon momentum fluctuations) limits sensitivity. Injecting **squeezed vacuum** (a quantum state with reduced fluctuations in one quadrature) at the dark port reduces shot noise below the standard quantum limit for a given laser power.

The strain sensitivity of Advanced LIGO is \(h \sim 10^{-23}/\sqrt{\text{Hz}}\) near 100 Hz — corresponding to a mirror displacement sensitivity of \(\delta L = hL/2 \sim 10^{-19}\) m per root-hertz, three orders of magnitude smaller than a proton. This extraordinary performance is a triumph of every aspect of physical optics: interference, coherence, polarisation, laser physics, Gaussian beam propagation, and the quantum optics of light.

---

# Chapter 22: Nonlinear Optics — An Introduction

## 22.1 The Nonlinear Polarisation

At sufficiently high intensities, the polarisation response of a medium is no longer linear in the electric field. Writing the polarisation as a power series:

\[
\mathbf{P} = \varepsilon_0\!\left[\chi^{(1)}\mathbf{E} + \chi^{(2)}\mathbf{E}^2 + \chi^{(3)}\mathbf{E}^3 + \cdots\right]
\]

The linear term \(\chi^{(1)}\) gives the ordinary refractive index and absorption. The second-order term \(\chi^{(2)}\) (non-zero only in non-centrosymmetric crystals) gives rise to **second harmonic generation (SHG)**, **sum and difference frequency generation**, and the **linear electro-optic (Pockels) effect**. The third-order term \(\chi^{(3)}\) (non-zero in all media) gives **third harmonic generation**, the **Kerr effect** (intensity-dependent refractive index \(\Delta n = n_2 I\)), **four-wave mixing**, **stimulated Raman scattering**, and **cross-phase modulation**.

## 22.2 Second Harmonic Generation

For an input field \(E = E_0\cos(\omega t - kz)\) in a crystal with non-zero \(\chi^{(2)}\):

\[
P^{(2)} = \varepsilon_0\chi^{(2)}E^2 = \varepsilon_0\chi^{(2)}E_0^2\cos^2(\omega t - kz) = \frac{\varepsilon_0\chi^{(2)}E_0^2}{2}\!\left[1 + \cos(2\omega t - 2kz)\right]
\]

The oscillating part at \(2\omega\) acts as a source for a wave at the second harmonic. The efficiency of SHG depends critically on **phase matching**: the second-harmonic wave must remain in phase with the driving polarisation as both propagate through the crystal. The intensity of the generated second harmonic grows as:

\[
I_{2\omega} \propto L^2\,\text{sinc}^2\!\left(\frac{\Delta k\, L}{2}\right)
\]

where \(\Delta k = 2k(\omega) - k(2\omega) = (2\omega/c)[n(\omega) - n(2\omega)]\) is the phase mismatch and \(L\) is the crystal length. Perfect phase matching (\(\Delta k = 0\)) gives \(I_{2\omega} \propto L^2\) (quadratic growth). Phase matching is achieved by angle tuning (exploiting birefringence: choosing \(\theta\) so that the ordinary \(n_o(\omega)\) equals the extraordinary \(n_e(2\omega,\theta)\)), by temperature tuning, or by **quasi-phase matching (QPM)** (periodic poling of the crystal domain orientation with period \(\Lambda = 2\pi/\Delta k\), so that the sign of \(\chi^{(2)}\) alternates, preventing destructive interference). Periodically poled lithium niobate (PPLN) is the standard QPM material for efficient SHG and OPO operation.

---

# Appendix A: Mathematical Tools

## A.1 Fourier Transform Conventions

Throughout these notes, we use the following convention for the Fourier transform pair:

\[
\tilde{f}(\nu) = \int_{-\infty}^{\infty} f(t)\,e^{-2\pi i\nu t}\,dt \qquad f(t) = \int_{-\infty}^{\infty}\tilde{f}(\nu)\,e^{2\pi i\nu t}\,d\nu
\]

The angular-frequency convention (\(\tilde{f}(\omega) = \int f(t)e^{i\omega t}dt\)) is also used; the two differ by a factor of \(2\pi\) in the argument. Common Fourier transform pairs in optics:

| \(f(t)\) | \(\tilde{f}(\nu)\) |
|---|---|
| \(\text{rect}(t/T) = \begin{cases}1,&\vert t\vert <T/2\\0,&\text{otherwise}\end{cases}\) | \(T\,\text{sinc}(\nu T)\) |
| \(\text{sinc}(Bt)\) | \(\frac{1}{B}\text{rect}(\nu/B)\) |
| \(e^{-t^2/(2\sigma^2)}\) | \(\sigma\sqrt{2\pi}\,e^{-2\pi^2\sigma^2\nu^2}\) |
| \(e^{-\alpha t}u(t)\) | \(\frac{1}{\alpha + 2\pi i\nu}\) |
| \(\sum_n \delta(t-nT)\) | \(\frac{1}{T}\sum_k\delta\!\left(\nu - \frac{k}{T}\right)\) |

The convolution theorem: \(\mathcal{F}\{f*g\} = \tilde{f}\cdot\tilde{g}\), and the correlation theorem: \(\mathcal{F}\{f\star g\}(\nu) = \tilde{f}^*(\nu)\cdot\tilde{g}(\nu)\), where \((f\star g)(\tau) = \int f^*(t)g(t+\tau)dt\).

## A.2 ABCD Matrix Optics

The ray transfer matrix (ABCD matrix) method tracks paraxial rays through optical systems by the transformation:

\[
\begin{pmatrix}y_2\\theta_2\end{pmatrix} = \begin{pmatrix}A & B \\ C & D\end{pmatrix}\begin{pmatrix}y_1\\theta_1\end{pmatrix}
\]

where \(y\) is the ray height and \(\theta\) the paraxial ray angle. Fundamental matrices:

| Element | ABCD matrix |
|---|---|
| Free propagation, distance \(d\) | \(\begin{pmatrix}1&d\\0&1\end{pmatrix}\) |
| Thin lens, focal length \(f\) | \(\begin{pmatrix}1&0\\-1/f&1\end{pmatrix}\) |
| Flat interface (index \(n_1\to n_2\)) | \(\begin{pmatrix}1&0\\0&n_1/n_2\end{pmatrix}\) |
| Curved mirror, radius \(R\) | \(\begin{pmatrix}1&0\\-2/R&1\end{pmatrix}\) |

For a sequence of elements, the system matrix is the product of individual matrices (right to left: the first element encountered by the beam is written last). The determinant of any ABCD matrix satisfies \(AD - BC = n_1/n_2\) (ratio of input to output refractive indices); for systems in air, \(\det M = 1\).

The Gaussian beam complex parameter \(q = z - iz_R\) (where \(z\) is the position relative to the beam waist and \(z_R = \pi w_0^2/\lambda\) is the Rayleigh range) transforms as the Möbius transformation \(q_2 = (Aq_1 + B)/(Cq_1 + D)\). The beam radius and radius of curvature are recovered from \(1/q^* = 1/R - i\lambda/(\pi w^2)\).

## A.3 Stokes Parameters — Measurement Protocol

To measure the Stokes parameters experimentally, one uses a polariser and quarter-wave plate (QWP):

\[
S_0 = I(0°,0°) + I(90°,0°) \qquad \text{(total intensity, no QWP)}
\]

\[
S_1 = I(0°,0°) - I(90°,0°) \qquad \text{(H minus V)}
\]

\[
S_2 = I(45°,0°) - I(135°,0°) \qquad \text{(+45° minus -45°)}
\]

\[
S_3 = I(45°,\pi/2) - I(135°,\pi/2) \qquad \text{(QWP at 0°, then polariser at ±45°)}
\]

where the notation \(I(\alpha,\Gamma)\) denotes the intensity measured after a QWP with fast axis at \(0°\) and retardation \(\Gamma\) followed by a linear polariser at angle \(\alpha\). The four measurements \(I(0°,0°)\), \(I(90°,0°)\), \(I(45°,0°)\), \(I(45°,\pi/2)\) suffice to determine all four Stokes parameters.

The **Poincaré sphere** is a geometric representation of polarisation states: each point on the unit sphere \((\hat{S}_1, \hat{S}_2, \hat{S}_3) = (S_1,S_2,S_3)/S_0\) corresponds to a fully polarised state. The north and south poles are right and left circular polarisation; the equator represents all linear polarisations; all other points represent elliptical polarisations. Propagation through an optical element corresponds to a rotation of the Poincaré sphere — a quarter-wave plate with fast axis at \(\theta\) rotates the sphere by \(\pi/2\) about the axis at angle \(2\theta\) in the equatorial plane.

---

# Appendix B: Key Results Summary

The following table collects the most important quantitative results from the course.

| Result | Formula |
|---|---|
| Wave equation in medium | \(\nabla^2\mathbf{E} = (n^2/c^2)\,\partial^2\mathbf{E}/\partial t^2\) |
| Helmholtz equation | \(\nabla^2 U + k^2 U = 0\), \(k = n\omega/c\) |
| Lorentz oscillator susceptibility | \(\tilde{\chi}_e = (Ne^2/\varepsilon_0 m_e)\sum_j f_j/(\omega_j^2 - \omega^2 - i\gamma_j\omega)\) |
| Sellmeier equation | \(n^2 = 1 + \sum_j B_j\lambda^2/(\lambda^2 - C_j)\) |
| Group velocity | \(v_g = c/n_g\), \(n_g = n - \lambda\,dn/d\lambda\) |
| Fresnel \(r_s\) | \((n_1\cos\theta_i - n_2\cos\theta_t)/(n_1\cos\theta_i + n_2\cos\theta_t)\) |
| Fresnel \(r_p\) | \((n_2\cos\theta_i - n_1\cos\theta_t)/(n_2\cos\theta_i + n_1\cos\theta_t)\) |
| Brewster's angle | \(\tan\theta_B = n_2/n_1\) |
| Critical angle | \(\theta_c = \arcsin(n_2/n_1)\) |
| Thin film constructive (no net \(\pi\) shift) | \(2n_f d = m\lambda\) |
| Fabry-Pérot Airy function | \(T = 1/\left[1 + \mathcal{F}\sin^2(\delta/2)\right]\) |
| Fabry-Pérot finesse | \(\mathcal{F}_\text{res} = \pi\sqrt{R}/(1-R)\) |
| Grating resolving power | \(\mathcal{R} = mN\) |
| Coherence length | \(L_c = \lambda^2/\Delta\lambda\) |
| Fraunhofer single slit | \(I = I_0\,\text{sinc}^2(\pi a\sin\theta/\lambda)\) |
| Gaussian beam waist | \(w(z) = w_0\sqrt{1+(z/z_R)^2}\) |
| Rayleigh range | \(z_R = \pi w_0^2/\lambda\) |
| Far-field divergence | \(\theta_\infty = \lambda/(\pi w_0)\) |
| Abbe resolution (incoherent) | \(\delta = 0.61\lambda/\text{NA}\) |
| Laser threshold inversion | \(\Delta N_\text{th} = \delta_\text{total}/(2\sigma_{21}\ell)\) |

---

# Appendix C: Physical Interpretation Essays

## C.1 Why Does a Prism Disperse White Light?

The answer, from the Lorentz model, is that glass has its dominant electronic resonances in the ultraviolet — the bound electrons in glass (SiO\(_2\)) oscillate most naturally at UV frequencies corresponding to the Si-O bond stretching and the electronic transitions of oxygen. In the visible range, we are on the low-frequency side of these resonances (\(\omega < \omega_\text{UV}\)), which means \(n > 1\) and, crucially, \(dn/d\omega > 0\) — normal dispersion. Higher frequencies (blue, violet) see a refractive index closer to the UV resonance, so they experience a larger \(n\) than lower frequencies (red, orange). Snell's law \(n_1\sin\theta_i = n_2(\omega)\sin\theta_t\) then gives a smaller refraction angle for red light (smaller \(n_2\)) and a larger angle for violet light (larger \(n_2\)). This is why the prism fans the colours of white light into a spectrum with violet at the steepest refraction angle and red at the shallowest.

Newton (1666) established experimentally that a prism does not add colour to white light but separates colours that were already present. This was a profound conceptual advance: colour is a property of light itself, not something imposed by material interaction. The spectrum of sunlight is continuous in the visible (generated by the 5800 K blackbody emission of the solar photosphere), superposed on which are the Fraunhofer absorption lines — dark narrow lines at specific wavelengths where solar atmospheric atoms absorb. These lines (labelled A through K by Fraunhofer) were the first spectra of extraterrestrial matter, enabling the determination of solar elemental composition long before space travel.

The achromatic doublet lens — combining a positive (converging) crown glass lens with a negative (diverging) flint glass lens — corrects chromatic aberration by exploiting the different Abbe numbers of the two glasses. The crown glass (low dispersion, high Abbe number \(V_1\)) provides the primary converging power; the flint glass (high dispersion, low \(V_2\)) corrects the colour by providing opposite dispersion without undoing all the optical power. For two thin lenses in contact with focal lengths \(f_1, f_2\) and Abbe numbers \(V_1, V_2\), the condition for zero chromatic aberration (same focal length for the Fraunhofer \(F\) and \(C\) lines) is \(f_1/V_1 + f_2/V_2 = 0\), giving \(f_2 = -f_1 V_2/V_1\).

## C.2 The Physical Meaning of the Coherence Function

The temporal coherence function \(\Gamma(\tau)\) has a meaning that goes beyond mere mathematics: it quantifies the ability of a light field to interfere with a time-delayed copy of itself. When a beam is split into two copies and one is delayed by time \(\tau = \Delta L/c\) (as in a Michelson interferometer), the fringe visibility in the recombined beam is exactly \(|\gamma(\tau)| = |\Gamma(\tau)|/\Gamma(0)\). This is a measurable, physical quantity.

The coherence function is related to the spectrum by the Wiener-Khinchin theorem (\(\Gamma(\tau) = \mathcal{F}^{-1}\{S(\nu)\}\)), which means that measuring fringe visibility versus path difference is equivalent to measuring the power spectrum — but without a spectrometer. This is the idea behind Fourier transform spectroscopy: scan the path difference, measure the visibility at each \(\tau\), Fourier-transform to get \(S(\nu)\). The advantage over a grating spectrometer is the Fellgett (multiplex) advantage: all spectral elements are measured simultaneously rather than one by one, giving a \(\sqrt{N}\) improvement in signal-to-noise for \(N\) spectral elements. This is why FTS dominates infrared spectroscopy, where detectors are noisy and shot noise is not the limiting factor.

The spatial coherence function quantifies correlations between field amplitudes at spatially separated points. It is bounded by \(|\mu(\mathbf{r}_1,\mathbf{r}_2)| \leq 1\), with equality for a perfectly monochromatic point source and zero for spatially incoherent extended sources. The van Cittert-Zernike theorem tells us that propagation from an incoherent extended source converts spatial incoherence into partial spatial coherence in the far field — a remarkable result that says even an incoherent source can produce partially coherent light far away, because the geometry of propagation (different points on the source contributing to the field at two observation points with different relative phases) produces the coherence. Stars are spatially incoherent at their surfaces but produce partially coherent light at Earth's surface — that partial coherence was what allowed Michelson to measure stellar diameters using his stellar interferometer in 1920.

## C.3 What Makes a Laser Different from a Lamp?

A lamp (incandescent, fluorescent, or LED) emits light by spontaneous emission: atoms or molecules in excited states decay independently, each emitting a photon at a random time, in a random direction, with a random phase. The emitted light is therefore spatially incoherent (many independent sources), temporally incoherent (short coherence length determined by the emission linewidth), and unpolarised (random polarisation states). The brightness of a lamp is limited by the blackbody radiation law at the operating temperature — no lamp can be brighter, per unit area per unit solid angle per unit frequency, than a blackbody at that temperature.

A laser, by contrast, generates light by stimulated emission: one photon triggers the emission of a second, identical photon with the same frequency, phase, polarisation, and direction. The emitted photons are therefore coherent — they form a classical wave with well-defined phase. Moreover, because the laser cavity selects a specific set of modes (defined by the mirror geometry and the gain bandwidth), all photons emerge in essentially the same transverse and longitudinal mode. The result is a beam with: (i) extremely high spatial coherence (the wavefront is well-defined across the entire beam cross-section); (ii) very high temporal coherence (narrow linewidth, long coherence length); (iii) defined polarisation (determined by the cavity and gain medium); and (iv) very high intensity that can be further concentrated by focusing. A 1 mW HeNe laser, focused to the diffraction limit (\(\sim (\lambda/\text{NA})^2\)), produces a brightness (radiance) many orders of magnitude higher than the Sun.

The laser's high coherence enables interference experiments (holography, interferometry, speckle) that are impossible with incoherent sources. Its narrow bandwidth enables spectroscopic resolution of individual atomic lines. Its high focusability enables cutting, welding, surgery, and lithography at micron scales. Its coherence in time enables ultrashort pulse generation (mode-locking) and optical communications. The laser is, in short, the realisation of coherent light — an entity that exists because quantum mechanics permits stimulated emission, but whose properties are best understood through classical wave optics.

---

# Appendix D: Derivation of the van Cittert-Zernike Theorem

## D.1 Setup and Notation

We derive the van Cittert-Zernike theorem for a planar, quasi-monochromatic, spatially incoherent source \(\Sigma\) at \(z=0\), and compute the mutual coherence function \(J(\mathbf{r}_1,\mathbf{r}_2)\) in the plane \(z = R\) far from the source.

The field at observation point \(\mathbf{r}_j = (\mathbf{x}_j, R)\) due to the source is:

\[
E(\mathbf{r}_j) = \int_\Sigma E_s(\boldsymbol{\rho})\,\frac{e^{ik|\mathbf{r}_j - \boldsymbol{\rho}|}}{|\mathbf{r}_j - \boldsymbol{\rho}|}\,d^2\rho
\]

(propagator from source point \(\boldsymbol{\rho}\) to observation point \(\mathbf{r}_j\), from Huygens-Fresnel theory).

The source is spatially incoherent:

\[
\langle E_s^*(\boldsymbol{\rho})\,E_s(\boldsymbol{\rho}')\rangle = I_s(\boldsymbol{\rho})\,\delta^{(2)}(\boldsymbol{\rho} - \boldsymbol{\rho}')
\]

where \(I_s(\boldsymbol{\rho})\) is the source intensity distribution.

## D.2 The Derivation

The mutual intensity at the observation plane:

\[
J(\mathbf{r}_1,\mathbf{r}_2) = \langle E^*(\mathbf{r}_1)\,E(\mathbf{r}_2)\rangle
\]

Substituting the propagator and using the incoherence condition:

\[
J(\mathbf{r}_1,\mathbf{r}_2) = \int_\Sigma \int_\Sigma \langle E_s^*(\boldsymbol{\rho})\,E_s(\boldsymbol{\rho}')\rangle\,\frac{e^{-ik|\mathbf{r}_1-\boldsymbol{\rho}|}}{|\mathbf{r}_1-\boldsymbol{\rho}|}\,\frac{e^{ik|\mathbf{r}_2-\boldsymbol{\rho}'|}}{|\mathbf{r}_2-\boldsymbol{\rho}'|}\,d^2\rho\,d^2\rho'
\]

The incoherence condition collapses the double integral to a single one (the \(\delta\)-function sets \(\boldsymbol{\rho} = \boldsymbol{\rho}'\)):

\[
J(\mathbf{r}_1,\mathbf{r}_2) = \int_\Sigma I_s(\boldsymbol{\rho})\,\frac{e^{-ik|\mathbf{r}_1-\boldsymbol{\rho}|}}{|\mathbf{r}_1-\boldsymbol{\rho}|}\,\frac{e^{ik|\mathbf{r}_2-\boldsymbol{\rho}|}}{|\mathbf{r}_2-\boldsymbol{\rho}|}\,d^2\rho
\]

In the paraxial (Fresnel) approximation, \(|\mathbf{r}_j - \boldsymbol{\rho}| \approx R + |\mathbf{x}_j - \boldsymbol{\rho}|^2/(2R)\), so:

\[
|\mathbf{r}_1 - \boldsymbol{\rho}| - |\mathbf{r}_2 - \boldsymbol{\rho}| \approx \frac{|\mathbf{x}_1 - \boldsymbol{\rho}|^2 - |\mathbf{x}_2 - \boldsymbol{\rho}|^2}{2R} = \frac{(\mathbf{x}_1 - \mathbf{x}_2)\cdot(2\boldsymbol{\rho} - \mathbf{x}_1 - \mathbf{x}_2)}{2R}
\]

In the far field where \(|\boldsymbol{\rho}|^2 \ll R\lambda\) (the source is small compared to its distance), the \(\boldsymbol{\rho}\)-quadratic terms are negligible and:

\[
k(|\mathbf{r}_2-\boldsymbol{\rho}| - |\mathbf{r}_1-\boldsymbol{\rho}|) \approx -k\boldsymbol{\rho}\cdot\frac{\mathbf{x}_1 - \mathbf{x}_2}{R}
\]

The denominator factors become approximately \(R^2\). Therefore:

\[
J(\mathbf{r}_1,\mathbf{r}_2) \approx \frac{1}{R^2}\int_\Sigma I_s(\boldsymbol{\rho})\,e^{-ik\boldsymbol{\rho}\cdot(\mathbf{x}_1-\mathbf{x}_2)/R}\,d^2\rho = \frac{1}{R^2}\,\tilde{I}_s\!\left(\frac{k(\mathbf{x}_1-\mathbf{x}_2)}{2\pi R}\right)
\]

where \(\tilde{I}_s\) denotes the 2D Fourier transform of the source intensity distribution evaluated at the spatial frequency \(\mathbf{u} = (\mathbf{x}_1 - \mathbf{x}_2)/(\lambda R)\). This is the van Cittert-Zernike theorem: <em>the mutual coherence in the far field of an incoherent source is the Fourier transform of the source intensity distribution</em>. The spatial coherence radius corresponds to the angular resolution element \(\lambda/D_s\) of the source, which is why larger sources (larger \(D_s\)) produce smaller coherence radii.

---

# Appendix E: Problem-Solving Strategies

## E.1 Fresnel vs. Fraunhofer Diffraction

The key decision in any diffraction problem is whether to use Fresnel or Fraunhofer theory. Compute the Fresnel number:

\[
N_F = \frac{a^2}{\lambda L}
\]

where \(a\) is the largest relevant aperture dimension and \(L\) is the propagation distance.

- If \(N_F \gg 1\): use Fresnel diffraction (near-field). The aperture is many Fresnel zones wide at the observation point; the pattern resembles a projected shadow with edge diffraction ripples.
- If \(N_F \lesssim 1\): use Fraunhofer diffraction (far-field). The pattern is the Fourier transform of the aperture function. This condition is also equivalent to the **far-field condition** \(L \gg a^2/\lambda\).
- In a lens system: Fraunhofer diffraction is produced in the back focal plane of a lens for any input plane distance (the lens brings the far field to a finite distance).

## E.2 Thin Film Problems

For any thin film interference problem, the algorithm is:
1. Identify the refractive indices \(n_1\) (incident medium), \(n_f\) (film), \(n_3\) (substrate).
2. Determine the phase shift at each interface:
   - Lower to higher \(n\): phase shift \(\pi\) (half-wave loss).
   - Higher to lower \(n\): no phase shift.
3. Count the total extra half-wavelengths from phase shifts.
4. The optical path difference is \(2n_f d\cos\theta_f\) (where \(\theta_f\) is the angle inside the film, from Snell's law).
5. Add the extra OPD from phase shifts (each \(\pi\) phase shift = \(\lambda/2\) OPD).
6. Set total OPD \(= m\lambda\) for constructive, \(= (m+1/2)\lambda\) for destructive interference.

## E.3 Fabry-Pérot Problems

Given a Fabry-Pérot with mirror reflectance \(R\), spacing \(L\), and medium index \(n\):

1. Compute the coefficient of finesse: \(\mathcal{F} = 4R/(1-R)^2\).
2. Compute the finesse: \(\mathcal{F}_\text{res} = \pi\sqrt{R}/(1-R) \approx \pi\sqrt{\mathcal{F}}/2\).
3. The free spectral range: \(\Delta\nu_\text{FSR} = c/(2nL)\) in frequency, \(\Delta\lambda_\text{FSR} = \lambda^2/(2nL)\) in wavelength.
4. The FWHM of a transmission peak: \(\delta\nu = \Delta\nu_\text{FSR}/\mathcal{F}_\text{res}\).
5. Resolving power: \(\mathcal{R} = \nu_0/\delta\nu = m\mathcal{F}_\text{res}\) where \(m = 2nL/\lambda\) is the order.
6. Transmission at frequency offset \(\Delta\nu\) from a peak: \(T = 1/\left[1 + \mathcal{F}\sin^2(\pi\Delta\nu/\Delta\nu_\text{FSR})\right]\).

## E.4 Jones Calculus Problems

To find the output polarisation state through a sequence of optical elements:
1. Write the input as a Jones vector (column vector of complex amplitudes).
2. Write each optical element as a Jones matrix.
3. Multiply: \(\mathbf{E}_\text{out} = J_N \cdots J_2 J_1 \mathbf{E}_\text{in}\) (rightmost matrix acts first).
4. The output Jones vector gives the polarisation state. To find the polarisation ellipse: compute \(|E_x|\), \(|E_y|\), and the phase difference \(\delta = \arg(E_y) - \arg(E_x)\); the ellipse has semi-axes \(a,b\) given by \(\tan(2\psi) = 2|E_x||E_y|\cos\delta/(|E_x|^2-|E_y|^2)\) and \(\sin(2\chi) = 2|E_x||E_y|\sin\delta/(|E_x|^2+|E_y|^2)\), where \(\psi\) is the orientation and \(\chi\) is the ellipticity angle.
5. For incoherent or partially polarised light, convert to Stokes vectors and multiply by Mueller matrices instead.

---

# Appendix F: Historical Context and Key Experiments

## F.1 The Nature of Light — Wave vs. Particle

The debate over whether light is a wave or a particle has a long and instructive history. Newton's corpuscular theory (1704) explained reflection and refraction but could not naturally account for interference and diffraction, which Grimaldi had observed in 1665 and Young had quantified in 1801-1803. Young's double-slit experiment — probably the most important experiment in optics — demonstrated unambiguously that two beams of light can cancel each other (destructive interference), something impossible for a stream of particles but natural for waves.

Augustin-Jean Fresnel (1816-1819) placed diffraction on a firm mathematical footing, deriving the Huygens-Fresnel integral and using it to predict the bright spot at the centre of the shadow of a circular obstacle (the "Poisson spot," named after the mathematician who predicted it as a reductio ad absurdum argument against Fresnel's theory — and was confounded when Arago verified it experimentally). The wave theory reached its apex with Maxwell's identification of light as an electromagnetic wave (1865) and Hertz's experimental confirmation (1887).

The twentieth century brought quantum mechanics and the wave-particle duality. Einstein's explanation of the photoelectric effect (1905) established that light comes in discrete quanta (photons) of energy \(E = h\nu\). Yet quantum mechanics resolves rather than deepens the paradox: a photon is neither a classical wave nor a classical particle but a quantum object whose detection probability is governed by the intensity of the classical electromagnetic wave. Interference, diffraction, and coherence are quantum phenomena (the photon interferes with itself), yet they are correctly described by classical wave optics in the regime of many photons — a remarkable example of the correspondence principle.

## F.2 The Development of the Laser

The theoretical groundwork for the laser was laid by Einstein (1917, stimulated emission), but the practical development required quantum mechanics, spectroscopy, and microwave technology to mature. The **maser** (microwave amplification by stimulated emission of radiation) was demonstrated independently by Gordon, Zeiger, and Townes (1954, Columbia University) and by Prokhorov and Basov (Soviet Union) — work for which Townes, Prokhorov, and Basov shared the 1964 Nobel Prize in Physics.

The extension to optical frequencies was proposed by Schawlow and Townes (1958) and independently by Prokhorov. The first operating laser was demonstrated by Theodore Maiman in May 1960, using a synthetic ruby crystal (\(\text{Cr}^{3+}:\text{Al}_2\text{O}_3\)) pumped by a flashlamp, emitting at 694.3 nm. The helium-neon laser (Javan, Bennett, and Herriott, 1960) was the first continuous-wave (CW) laser and produced the familiar red 632.8 nm beam. The CO\(_2\) laser (Patel, 1964) at 10.6 \(\mu\)m became the most powerful CW laser system. The semiconductor diode laser (Hall et al., 1962; Nathan et al., 1962) — initially operated only in pulsed mode at cryogenic temperatures, achieving room-temperature CW operation in 1970 — is now the most widely produced laser, present in every optical disc drive, barcode scanner, laser printer, and fibre-optic communication system.

The development of ultrashort-pulse lasers proceeded from Q-switching (millisecond to nanosecond pulses) through mode-locking. The dye laser (Sorokin and Lankard, 1966) enabled tunable visible wavelength operation and, crucially, femtosecond pulses via passive mode-locking (Ippen, Shank, Dienes, 1972). The Ti:sapphire laser (Moulton, 1982), with its enormous gain bandwidth (650-1100 nm), became the workhorse for ultrafast science, enabling 5-femtosecond pulses and attosecond pulse generation by high-harmonic generation — pulses short enough to observe electron dynamics within atoms and molecules.

## F.3 Optical Fibre Communications

The idea of using optical fibres for communications was proposed by Kao and Hockham (1966), who recognised that if fibre attenuation could be reduced below 20 dB/km, optical communications would become practical. Kao was awarded the 2009 Nobel Prize in Physics for this insight. The challenge was to reduce impurities (primarily transition metal ions) in silica to below parts per billion — a feat achieved by Corning Glass Works in 1970 (Kapron, Keck, Maurer), producing fibres with 20 dB/km attenuation. Modern single-mode fibres have minimum attenuation of \(\approx 0.15\) dB/km at 1550 nm — limited by Rayleigh scattering from density fluctuations (unavoidable) and infrared absorption from Si-O bond vibrations.

The data capacity of fibre has grown exponentially, driven by wavelength-division multiplexing (WDM) — transmitting many independent channels at different wavelengths simultaneously. The erbium-doped fibre amplifier (EDFA, Desurvire and Payne, 1987) amplifies all WDM channels simultaneously in a 30-40 nm band near 1550 nm, without optical-electrical-optical conversion, enabling transoceanic fibre links. Modern submarine cables carry \(>100\) Tbit/s of data (hundreds of WDM channels, each at \(\sim 100\) Gbit/s) across the Pacific and Atlantic Oceans, forming the physical backbone of the global internet. The physics underlying all of this — Fresnel equations (splice losses), dispersion (pulse broadening in fibre), coherence (phase-modulated transmission formats), diffraction gratings (WDM multiplexers), Gaussian beams (fibre coupling), and stimulated emission (EDFA amplification) — is precisely the content of PHYS 393.

---

# Appendix G: Extended Derivations and Supplementary Material

## G.1 The Transfer Matrix Method for Multilayer Films

The **transfer matrix method (TMM)** provides a systematic and general framework for computing the reflectance and transmittance of any stack of thin films at any angle of incidence and polarisation. It is the foundation of thin-film optical coating design software.

For a stack of \(N\) layers labelled \(1, 2, \ldots, N\), with the incident medium labelled 0 and the substrate labelled \(N+1\), each layer \(j\) is characterised by its refractive index \(n_j\), thickness \(d_j\), and the single-pass phase \(\delta_j = (2\pi/\lambda)n_j d_j\cos\theta_j\) (where \(\theta_j\) is the angle of refraction in layer \(j\), determined by Snell's law from the incident angle). The characteristic matrix of each layer is:

\[
M_j = \begin{pmatrix}\cos\delta_j & -i\sin\delta_j/\eta_j \\ -i\eta_j\sin\delta_j & \cos\delta_j\end{pmatrix}
\]

where \(\eta_j = n_j\cos\theta_j/(\mu_0 c)\) for s-polarisation (TE) and \(\eta_j = n_j/(\mu_0 c\cos\theta_j)\) for p-polarisation (TM). The total transfer matrix of the stack is:

\[
M = M_1 M_2 \cdots M_N = \begin{pmatrix}m_{11} & m_{12} \\ m_{21} & m_{22}\end{pmatrix}
\]

The amplitude reflection and transmission coefficients are:

\[
r = \frac{m_{11}\eta_0 + m_{12}\eta_0\eta_{N+1} - m_{21} - m_{22}\eta_{N+1}}{m_{11}\eta_0 + m_{12}\eta_0\eta_{N+1} + m_{21} + m_{22}\eta_{N+1}}
\]

\[
t = \frac{2\eta_0}{m_{11}\eta_0 + m_{12}\eta_0\eta_{N+1} + m_{21} + m_{22}\eta_{N+1}}
\]

The power reflectance and transmittance are \(R = |r|^2\) and \(T = (\eta_{N+1}/\eta_0)|t|^2\). One can verify \(R + T = 1\) for lossless coatings (all \(n_j\) real).

For a single quarter-wave layer (\(\delta_1 = \pi/2\)): \(\cos(\pi/2) = 0\) and \(\sin(\pi/2) = 1\), so \(M_1 = \begin{pmatrix}0 & -i/\eta_1 \\ -i\eta_1 & 0\end{pmatrix}\). Substituting into the formula for \(r\):

\[
r = \frac{-i\eta_0/\eta_1\cdot\eta_{N+1} - (-i\eta_1)}{-i\eta_0/\eta_1\cdot\eta_{N+1} + (-i\eta_1)} = \frac{\eta_1^2 - \eta_0\eta_{N+1}}{\eta_1^2 + \eta_0\eta_{N+1}}
\]

(At normal incidence, \(\eta_j = n_j\).) Setting \(r = 0\): \(n_1^2 = n_0 n_{N+1}\), or \(n_1 = \sqrt{n_0 n_s}\) — exactly the single-layer AR condition derived in Section 3.3, confirming the matrix method.

For a stack of \(M\) pairs of quarter-wave layers (alternating \(n_H\), \(n_L\)):

\[
M^{2M} = \begin{pmatrix}0 & -i/\eta_H \\ -i\eta_H & 0\end{pmatrix}^M \begin{pmatrix}0 & -i/\eta_L \\ -i\eta_L & 0\end{pmatrix}^M
\]

Each pair \(M_H M_L = \begin{pmatrix}-(n_H/n_L) & 0 \\ 0 & -(n_L/n_H)\end{pmatrix}\), so after \(M\) pairs the matrix is diagonal with entries \((-1)^M(n_H/n_L)^M\) and \((-1)^M(n_L/n_H)^M\). The reflectance becomes:

\[
R = \left(\frac{n_0(n_H/n_L)^{2M} - n_s}{n_0(n_H/n_L)^{2M} + n_s}\right)^2
\]

For large \(M\), \((n_H/n_L)^{2M} \gg 1\) and \(R \to 1\) — the stack becomes a near-perfect mirror. This is the principle of the **distributed Bragg reflector (DBR)** used in vertical-cavity surface-emitting lasers (VCSELs), semiconductor laser cavities, and high-finesse Fabry-Pérot cavities for quantum optics experiments.

## G.2 Polarimetry and Ellipsometry

**Ellipsometry** is a surface characterisation technique that measures changes in the polarisation state of light upon reflection from a surface to determine film thicknesses and optical constants with sub-nanometre accuracy. The measured quantities are \(\Psi\) and \(\Delta\), defined by:

\[
\tilde{\rho} = \frac{r_p}{r_s} = \tan\Psi\,e^{i\Delta}
\]

where \(r_p\) and \(r_s\) are the complex Fresnel reflection coefficients for p and s polarisations, and \(\tan\Psi = |r_p|/|r_s|\) (amplitude ratio), \(\Delta = \delta_p - \delta_s\) (phase difference). The pair \((\Psi, \Delta)\) is measured experimentally by recording the transmitted intensity through a polariser-sample-analyser arrangement (null ellipsometry) or by rotating a compensator and Fourier-analysing the detected signal (rotating compensator ellipsometry).

From a known model of the sample structure (substrate plus \(N\) layers of known materials with Sellmeier-equation dispersion), one computes \(\Psi_\text{model}(\lambda)\) and \(\Delta_\text{model}(\lambda)\) and fits the parameters (film thicknesses, volume fractions in composite layers, etc.) to the measured \(\Psi_\text{exp}(\lambda)\) and \(\Delta_\text{exp}(\lambda)\) by nonlinear least-squares optimisation. Modern spectroscopic ellipsometers measure \(\Psi(\lambda)\) and \(\Delta(\lambda)\) simultaneously over a broad wavelength range (200-1700 nm), providing enormous information content for robust parameter extraction. Film thickness uncertainties below 0.1 nm are routinely achieved — this is the standard characterisation technique in semiconductor manufacturing for measuring gate oxide and photoresist layer thicknesses.

## G.3 The Angular Spectrum Representation and Evanescent Waves

Any field \(U(x,y,0)\) in the plane \(z=0\) can be decomposed into plane waves via the 2D Fourier transform:

\[
U(x,y,0) = \int\!\!\int_{-\infty}^{\infty} \tilde{U}(u,v)\,e^{i2\pi(ux+vy)}\,du\,dv
\]

where \(\tilde{U}(u,v) = \mathcal{F}\{U(x,y,0)\}\) is the **angular spectrum**. Each component \(\tilde{U}(u,v)e^{i2\pi(ux+vy)}\) is a plane wave with transverse wave vector \((k_x, k_y) = 2\pi(u,v)\). For the Helmholtz equation \(\nabla^2 U + k^2 U = 0\) to be satisfied, the \(z\)-component of the wave vector must be:

\[
k_z = \sqrt{k^2 - (2\pi u)^2 - (2\pi v)^2} = \begin{cases}+\sqrt{k^2 - 4\pi^2(u^2+v^2)} & u^2+v^2 < (k/2\pi)^2 = 1/\lambda^2 \\ +i\sqrt{4\pi^2(u^2+v^2) - k^2} & u^2+v^2 > 1/\lambda^2\end{cases}
\]

For spatial frequencies below \(1/\lambda\): real \(k_z\), propagating plane waves. For spatial frequencies above \(1/\lambda\): imaginary \(k_z\), evanescent waves that decay exponentially in \(z\). The field at arbitrary \(z > 0\) is:

\[
U(x,y,z) = \int\!\!\int \tilde{U}(u,v)\,e^{ik_z z}\,e^{i2\pi(ux+vy)}\,du\,dv
\]

This exact result (the angular spectrum propagator) shows that the evanescent components (\(u^2+v^2 > 1/\lambda^2\)) are lost exponentially during propagation — this is the origin of the diffraction limit. The near-field of a small object contains evanescent waves with arbitrarily high spatial frequencies, encoding arbitrarily fine detail; but this information is lost within a distance \(\sim\lambda/2\) from the object, and conventional far-field optics can never recover it.

**Near-field optics** circumvents this by using a probe (tapered fibre tip, aperture, or scattering tip) brought within \(\sim 10-50\) nm of the sample surface to either emit or collect the evanescent field before it decays. The resolution is then limited by the probe tip size rather than the wavelength of light, achieving \(\sim 10-100\) nm spatial resolution. Scattering-type SNOM (s-SNOM) using a metallic tip can achieve \(\sim 10\) nm resolution and has been used to image graphene plasmonic modes, protein secondary structure, and nano-scale crystalline domains.

## G.4 Optical Vortices and Orbital Angular Momentum

Light can carry both spin angular momentum (SAM) associated with circular polarisation, \(\pm\hbar\) per photon) and **orbital angular momentum (OAM)**, associated with the spatial structure of the beam. A beam with an azimuthal phase dependence \(e^{i\ell\phi}\) (where \(\phi\) is the azimuthal angle in cylindrical coordinates and \(\ell\) is an integer) carries \(\ell\hbar\) of OAM per photon. Such beams are called **optical vortices** or **vortex beams**, and the integer \(\ell\) is the **topological charge**.

The intensity of a vortex beam has a doughnut shape — the phase is undefined at the beam axis (where \(e^{i\ell\phi}\) is undefined), and destructive interference produces a dark core. The simplest vortex beams are the Laguerre-Gaussian (LG) modes \(\text{LG}_{p}^\ell\):

\[
u_{p\ell}(r,\phi,z) \propto \left(\frac{r\sqrt{2}}{w(z)}\right)^{|\ell|} L_p^{|\ell|}\!\!\left(\frac{2r^2}{w(z)^2}\right)\exp\!\left(-\frac{r^2}{w(z)^2}\right)e^{i\ell\phi}e^{i(2p+|\ell|+1)\arctan(z/z_R)}
\]

where \(L_p^{|\ell|}\) is the associated Laguerre polynomial, \(p\) is the radial mode index, and the last phase factor is the generalised Gouy phase.

Optical vortices are generated by spatial light modulators (SLMs) displaying a helical phase pattern, by spiral phase plates, or by mode conversion from HG to LG modes using astigmatic lens pairs. Their applications include optical tweezers (OAM is transferred to trapped particles, causing them to spin — an "optical spanner"), stimulated emission depletion (STED) microscopy (the doughnut-shaped STED beam is typically an \(\ell=1\) vortex), classical and quantum optical communications (OAM modes form an infinite-dimensional orthogonal basis, potentially allowing massive spatial multiplexing), and fundamental tests of quantum mechanics (two-photon entanglement in the OAM degree of freedom).

The total angular momentum per photon in a general polarised vortex beam is \((\ell \pm 1)\hbar\) — the plus sign for left circular, minus for right circular polarisation. This spin-orbit coupling in paraxial beams has been extensively studied and has analogies to the spin-orbit coupling of electrons in atomic physics and condensed matter.
