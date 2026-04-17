---
title: "PHYS 393: Physical Optics"
subjects: "PHYS"
prof: "Kazi Rajibul Islam"
---

## Sources and References
**Primary textbook** — Hecht, E. *Optics*, 5th ed. Pearson, 2017.
**Supplementary texts** — Goodman, J. W. *Introduction to Fourier Optics*, 3rd ed. Roberts & Company, 2005 (graduate-level reference); Bracewell, R. N. *The Fourier Transform and Its Applications*, 3rd ed. McGraw-Hill, 2000; Gaskill, J. D. *Linear Systems, Fourier Transforms, and Optics*. Wiley, 1978.
**Online resources** — MIT OCW 8.03 (Physics III: Vibrations and Waves); Goodman's *Speckle Phenomena* (online supplementary chapters); Born, M. and Wolf, E. *Principles of Optics*, 7th ed. (Cambridge) — comprehensive advanced reference

---

# Chapter 1: Review — Light as an Electromagnetic Wave

## 1.1 Maxwell's Equations and the Wave Equation

The entire structure of classical optics rests on Maxwell's equations. In a linear, isotropic, homogeneous medium with permittivity \(\varepsilon = \varepsilon_r\varepsilon_0\) and permeability \(\mu \approx \mu_0\):

\[
\nabla \cdot \mathbf{E} = \frac{\rho_f}{\varepsilon}, \quad \nabla \cdot \mathbf{B} = 0, \quad \nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}, \quad \nabla \times \mathbf{B} = \mu\mathbf{J}_f + \mu\varepsilon\frac{\partial \mathbf{E}}{\partial t}.
\]

In a source-free region (\(\rho_f = 0\), \(\mathbf{J}_f = 0\)), taking the curl of Faraday's law and using the identity \(\nabla \times (\nabla \times \mathbf{E}) = \nabla(\nabla \cdot \mathbf{E}) - \nabla^2\mathbf{E}\):

\[
\nabla^2\mathbf{E} = \mu\varepsilon\frac{\partial^2\mathbf{E}}{\partial t^2} = \frac{n^2}{c^2}\frac{\partial^2\mathbf{E}}{\partial t^2},
\]

where \(n = \sqrt{\varepsilon_r}\) (for non-magnetic media) is the **refractive index**. This is the **wave equation** for electromagnetic waves propagating at speed \(v = c/n\).

The plane-wave solutions take the complex form:

\[
\mathbf{E}(\mathbf{r}, t) = \mathbf{E}_0\, e^{i(\mathbf{k}\cdot\mathbf{r} - \omega t)},
\]

with \(|\mathbf{k}| = nk_0 = n\omega/c = 2\pi n/\lambda_0\), where \(\lambda_0\) is the free-space wavelength.

## 1.2 Energy, Momentum, and Radiation Pressure

The **Poynting vector** \(\mathbf{S} = \mathbf{E} \times \mathbf{H} = \mathbf{E} \times (\mathbf{B}/\mu_0)\) represents the electromagnetic energy flux (power per unit area). Its time average for a plane wave is:

\[
\langle \mathbf{S} \rangle = \frac{1}{2}\mathrm{Re}(\mathbf{E} \times \mathbf{H}^*) = \frac{c\varepsilon_0 n}{2}|\mathbf{E}_0|^2\hat{k}.
\]

Maxwell predicted that electromagnetic radiation exerts a **radiation pressure**:

\[
P_{\mathrm{rad}} = \frac{I}{c} \quad (\text{for perfect absorption}), \qquad P_{\mathrm{rad}} = \frac{2I}{c} \quad (\text{for perfect reflection}),
\]

where \(I = \langle S \rangle\) is the irradiance. Radiation pressure is fantastically small for ordinary intensities (sunlight exerts \(\sim 5\ \mu\mathrm{Pa}\)), but modern laser technology has made it the basis of **optical tweezers** (which earned the 2018 Nobel Prize in Physics to Arthur Ashkin) and **laser cooling** of atoms to temperatures within nanokelvins of absolute zero.

---

# Chapter 2: Interaction of Light and Matter — Dispersion and Refractive Index

## 2.1 The Classical Oscillator Model

The refractive index of a material is not an arbitrary constant but is determined by the response of its bound electrons to the oscillating electromagnetic field. The **Lorentz model** treats each bound electron as a driven harmonic oscillator with natural frequency \(\omega_0\) and damping constant \(\gamma\):

\[
m_e\ddot{x} + m_e\gamma\dot{x} + m_e\omega_0^2 x = -eE_0 e^{-i\omega t}.
\]

The steady-state displacement amplitude is:

\[
x(\omega) = \frac{-eE_0/m_e}{\omega_0^2 - \omega^2 - i\gamma\omega}.
\]

The polarization density \(P = -Nex\) (where \(N\) is the electron number density) relates to the electric field through the susceptibility \(\chi_e\): \(P = \varepsilon_0\chi_e E\). The complex refractive index \(\tilde{n} = n + i\kappa\) is:

\[
\tilde{n}^2 = 1 + \chi_e = 1 + \frac{Ne^2}{\varepsilon_0 m_e}\frac{1}{\omega_0^2 - \omega^2 - i\gamma\omega}.
\]

## 2.2 Phase and Group Velocity

In a dispersive medium, different frequency components of a wave packet travel at different speeds. The **phase velocity** is the speed of a single-frequency component:

\[
v_p = \frac{\omega}{k} = \frac{c}{n(\omega)}.
\]

The **group velocity** is the speed at which the envelope of a wave packet (and thus information or energy) propagates:

\[
v_g = \frac{d\omega}{dk} = \frac{c}{n + \omega\,dn/d\omega}.
\]

In normal dispersion (\(dn/d\omega > 0\)), \(v_g < v_p\). Near an absorption resonance (anomalous dispersion), \(dn/d\omega < 0\) and \(v_g > v_p\), and in extreme cases \(v_g > c\) or even negative. This does not violate special relativity because it is the group velocity of the leading edge of an absorbed wave packet, not information velocity; the signal velocity (the speed of the front of a pulse) remains bounded by \(c\).

The **group delay dispersion** (GDD) characterizes how different frequency components of a pulse arrive at different times:

\[
\mathrm{GDD} = \frac{d^2\phi}{d\omega^2} = L\frac{d}{d\omega}\left(\frac{n\omega}{c}\right)_{at\,\omega_0} = L\frac{\lambda^3}{2\pi c^2}\frac{d^2 n}{d\lambda^2}.
\]

GDD is central to ultrafast laser pulse shaping.

---

# Chapter 3: Fresnel Equations — Optics at an Interface

## 3.1 Derivation from Boundary Conditions

The behavior of light at an interface between two media is fully determined by Maxwell's boundary conditions: the tangential components of \(\mathbf{E}\) and \(\mathbf{H}\) are continuous across the interface; the normal components of \(\mathbf{D}\) and \(\mathbf{B}\) are continuous. Applying these conditions to an incident plane wave at angle \(\theta_i\), reflected wave at angle \(\theta_r = \theta_i\), and transmitted wave at angle \(\theta_t\) (Snell's law), we decompose the fields into:

- **s-polarization** (TE, transverse electric): \(\mathbf{E}\) perpendicular to the plane of incidence
- **p-polarization** (TM, transverse magnetic): \(\mathbf{E}\) in the plane of incidence

<div class="theorem">
<strong>Fresnel Equations:</strong>

For s-polarization:
\[
r_s = \frac{n_1\cos\theta_i - n_2\cos\theta_t}{n_1\cos\theta_i + n_2\cos\theta_t}, \qquad t_s = \frac{2n_1\cos\theta_i}{n_1\cos\theta_i + n_2\cos\theta_t}.
\]

For p-polarization:
\[
r_p = \frac{n_2\cos\theta_i - n_1\cos\theta_t}{n_2\cos\theta_i + n_1\cos\theta_t}, \qquad t_p = \frac{2n_1\cos\theta_i}{n_2\cos\theta_i + n_1\cos\theta_t}.
\]

Here \(r\) and \(t\) are the amplitude reflection and transmission coefficients. The reflectance and transmittance (ratios of intensities) are \(R = |r|^2\) and \(T = 1 - R\) (energy conservation).
</div>

## 3.2 Physical Consequences

At normal incidence (\(\theta_i = 0\)), the Fresnel equations give:

\[
r = \frac{n_1 - n_2}{n_1 + n_2}, \qquad R = \left(\frac{n_1 - n_2}{n_1 + n_2}\right)^2.
\]

For a glass-air interface (\(n = 1.5\)): \(R = (0.5/2.5)^2 = 4\%\). A camera lens with 6 glass-air surfaces would lose \(1 - 0.96^6 \approx 22\%\) of incident light to reflection — the motivation for anti-reflection coatings.

**Brewster's angle** \(\theta_B = \arctan(n_2/n_1)\) is where \(r_p = 0\): reflected light is purely s-polarized. Physically, at this angle the reflected and transmitted rays are perpendicular, and the dipole oscillators excited in the medium cannot radiate in the direction of reflection for p-polarized light.

At the critical angle, for TIR: the Fresnel coefficients become complex, \(|r_s| = |r_p| = 1\), but with different phase shifts. The phase difference between s and p upon TIR is:

\[
\tan\left(\frac{\delta_p - \delta_s}{2}\right) = \frac{\cos\theta_i\sqrt{\sin^2\theta_i - \sin^2\theta_c}}{\sin^2\theta_i}.
\]

This phase difference converts linear to elliptical polarization and is the basis of the **Fresnel rhomb**, which produces circular polarization from linear.

---

# Chapter 4: Thin Film Interference and Optical Coatings

## 4.1 Multiple Reflections in a Thin Film

For a thin dielectric film of thickness \(d\) and refractive index \(n_f\) between media \(n_1\) and \(n_2\), the exact amplitude reflection coefficient accounts for all multiple reflections:

\[
r = \frac{r_{12} + r_{23}e^{2i\delta}}{1 + r_{12}r_{23}e^{2i\delta}},
\]

where \(\delta = (2\pi/\lambda)n_f d\cos\theta_t\) is the single-pass phase shift in the film, and \(r_{12}\), \(r_{23}\) are the Fresnel reflection coefficients at the first and second interfaces.

The reflectance is:

\[
R = |r|^2 = \frac{r_{12}^2 + r_{23}^2 + 2r_{12}r_{23}\cos 2\delta}{1 + r_{12}^2 r_{23}^2 + 2r_{12}r_{23}\cos 2\delta}.
\]

## 4.2 Anti-Reflection and High-Reflection Coatings

**Anti-reflection (AR) coatings** reduce unwanted reflections. For a single-layer coating (refractive index \(n_f\), thickness \(d\)) on a substrate (\(n_s\)) in air, the reflectance vanishes when:

1. The film thickness satisfies \(n_f d = \lambda/4\) (quarter-wave condition), so that the two reflected beams are \(\pi\) out of phase.
2. The film index satisfies \(n_f = \sqrt{n_s}\) (amplitude matching condition), so the two reflected beams have equal amplitudes.

For glass (\(n_s \approx 1.52\)), the ideal single-layer AR coating has \(n_f = \sqrt{1.52} \approx 1.23\). Magnesium fluoride (\(n \approx 1.38\)) is the closest practical material, reducing reflectance from 4% to about 1%.

**High-reflection (HR) coatings** exploit constructive interference to achieve reflectances above 99.9%. Alternating quarter-wave layers of high- and low-index materials (e.g., TiO\(_2\) and SiO\(_2\)) add coherently, and the reflectance approaches:

\[
R \to \left(\frac{n_H^{2N}}{n_L^{2N}}\right)^2 \quad (\text{for } N \text{ high-low pairs})
\]

as \(N\) increases. Modern laser mirrors can achieve \(R > 99.9999\%\), essential for laser cavities and gravitational-wave interferometers.

---

# Chapter 5: Polarization — Jones Vectors, Stokes Parameters, and Mueller Matrices

## 5.1 Jones Vector Formalism

For a fully polarized, monochromatic wave, the polarization state is completely described by the **Jones vector** — a two-component complex column vector representing the amplitudes and phases of the \(x\)- and \(y\)-components of the electric field:

\[
\mathbf{J} = \begin{pmatrix} E_{0x} e^{i\phi_x} \\ E_{0y} e^{i\phi_y} \end{pmatrix}.
\]

Common states (normalized):
- Horizontal linear: \(\begin{pmatrix} 1 \\ 0 \end{pmatrix}\)
- Vertical linear: \(\begin{pmatrix} 0 \\ 1 \end{pmatrix}\)
- Linear at \(45°\): \(\frac{1}{\sqrt{2}}\begin{pmatrix} 1 \\ 1 \end{pmatrix}\)
- Right circular: \(\frac{1}{\sqrt{2}}\begin{pmatrix} 1 \\ -i \end{pmatrix}\)
- Left circular: \(\frac{1}{\sqrt{2}}\begin{pmatrix} 1 \\ i \end{pmatrix}\)

## 5.2 Jones Matrices

Any optical element that transforms a polarization state is represented by a \(2 \times 2\) **Jones matrix** \(M\). The output Jones vector is \(\mathbf{J}_{\mathrm{out}} = M\mathbf{J}_{\mathrm{in}}\). For a sequence of elements, \(M = M_n \cdots M_2 M_1\) (rightmost acts first).

Key Jones matrices:
- Linear polarizer along \(x\): \(\begin{pmatrix} 1 & 0 \\ 0 & 0 \end{pmatrix}\)
- Half-wave plate (HWP) with fast axis at angle \(\theta\):
\[
M_{\mathrm{HWP}} = \begin{pmatrix} \cos 2\theta & \sin 2\theta \\ \sin 2\theta & -\cos 2\theta \end{pmatrix}
\]
- Quarter-wave plate (QWP) with fast axis along \(x\): \(\begin{pmatrix} 1 & 0 \\ 0 & i \end{pmatrix}\)

Jones matrices are exact for fully coherent, fully polarized light. They fail for partially polarized or unpolarized light.

## 5.3 Stokes Parameters and Mueller Matrices

For partially polarized light, the polarization state is described by the **Stokes vector** — four real parameters measurable by intensity measurements:

\[
\mathbf{S} = \begin{pmatrix} S_0 \\ S_1 \\ S_2 \\ S_3 \end{pmatrix} = \begin{pmatrix} I_x + I_y \\ I_x - I_y \\ I_{+45°} - I_{-45°} \\ I_R - I_L \end{pmatrix},
\]

where \(S_0\) is the total intensity, \(S_1\) distinguishes horizontal from vertical linear, \(S_2\) distinguishes \(\pm 45°\) linear, and \(S_3\) distinguishes right from left circular polarization. The **degree of polarization** is:

\[
\mathrm{DOP} = \frac{\sqrt{S_1^2 + S_2^2 + S_3^2}}{S_0} \in \left[0, 1\right].
\]

Optical elements are represented by \(4 \times 4\) **Mueller matrices**: \(\mathbf{S}_{\mathrm{out}} = M\mathbf{S}_{\mathrm{in}}\). Mueller matrices can describe polarizers, wave plates, rotators, scattering media, and even partially depolarizing elements. Mueller matrix polarimetry is a powerful tool in microscopy, remote sensing, and the characterization of biological tissues.

## 5.4 Birefringence

**Birefringent** materials (crystals lacking cubic symmetry, stressed glass, liquid crystals) have different refractive indices for different polarization directions. In a uniaxial crystal, the **ordinary** ray (index \(n_o\)) propagates with the same speed regardless of direction, while the **extraordinary** ray (index \(n_e\)) propagates at a speed that depends on the angle with the optical axis.

A wave plate of thickness \(d\) introduces a **retardance** (phase difference between fast and slow axes):

\[
\Gamma = \frac{2\pi}{\lambda}(n_s - n_f)d.
\]

For \(\Gamma = \pi\) (half-wave plate): the polarization direction is rotated. For \(\Gamma = \pi/2\) (quarter-wave plate): linear polarization is converted to circular (or vice versa). Wave plates are the building blocks of polarization optics and are ubiquitous in optical communications and quantum optics.

---

# Chapter 6: Fourier Analysis and Its Role in Optics

## 6.1 The Fourier Transform

The **Fourier transform** is the mathematical engine of physical optics. For a function \(f(x)\), the Fourier transform and its inverse are:

\[
F(u) = \mathcal{F}\{f\}(u) = \int_{-\infty}^{\infty} f(x)\,e^{-2\pi i ux}\,dx,
\]

\[
f(x) = \mathcal{F}^{-1}\{F\}(x) = \int_{-\infty}^{\infty} F(u)\,e^{2\pi i ux}\,du.
\]

Key properties that appear throughout optics:

- **Linearity**: \(\mathcal{F}\{af + bg\} = aF + bG\)
- **Shift theorem**: \(\mathcal{F}\{f(x-a)\} = e^{-2\pi iau}F(u)\) — a spatial shift introduces a linear phase
- **Convolution theorem**: \(\mathcal{F}\{f * g\} = F \cdot G\) — convolution in space becomes multiplication in frequency
- **Parseval's theorem**: \(\int |f|^2\,dx = \int |F|^2\,du\) — energy is conserved

The **2D Fourier transform** extends these results to two transverse dimensions, essential for describing diffraction and imaging:

\[
F(u, v) = \iint f(x, y)\,e^{-2\pi i(ux + vy)}\,dx\,dy.
\]

## 6.2 Important Fourier Transform Pairs in Optics

| Function \(f(x)\) | Transform \(F(u)\) |
|---|---|
| Rectangle: \(\mathrm{rect}(x/a)\) | Sinc: \(a\,\mathrm{sinc}(au)\) where \(\mathrm{sinc}(x) = \sin(\pi x)/(\pi x)\) |
| Gaussian: \(e^{-\pi x^2/a^2}\) | Gaussian: \(a\,e^{-\pi a^2 u^2}\) |
| Comb: \(\sum_n \delta(x - na)\) | Comb: \(\frac{1}{a}\sum_m \delta(u - m/a)\) |
| Delta function: \(\delta(x - x_0)\) | Linear phase: \(e^{-2\pi iu x_0}\) |
| Constant: \(1\) | Delta: \(\delta(u)\) |

The Gaussian is the only function that is its own Fourier transform (up to scaling), which is why Gaussian beams are so prevalent in laser optics.

## 6.3 Bandwidth and the Uncertainty Principle

The Fourier transform encodes a fundamental trade-off between localization in space and in spatial frequency. If \(f(x)\) has spatial extent \(\Delta x\) and its transform \(F(u)\) has bandwidth \(\Delta u\):

\[
\Delta x \cdot \Delta u \geq \frac{1}{4\pi} \quad (\text{Gaussian-limited}).
\]

This is directly analogous to the Heisenberg uncertainty principle (\(\Delta x \cdot \Delta p \geq \hbar/2\), since \(p = \hbar k = h/\lambda = hu\)). In optics: a tightly focused beam (small \(\Delta x\)) necessarily has a wide range of propagation angles (large \(\Delta u\)); a collimated beam (small \(\Delta u\)) must be wide (large \(\Delta x\)).

---

# Chapter 7: Coherence

## 7.1 Temporal Coherence

**Temporal coherence** characterizes the extent to which a wave's phase at one time can predict its phase at a later time. The **mutual coherence function** between the field at time \(t\) and \(t + \tau\) is:

\[
\Gamma(\tau) = \langle E^*(t) E(t+\tau) \rangle,
\]

and the normalized version — the **complex degree of temporal coherence** — is:

\[
\gamma(\tau) = \frac{\Gamma(\tau)}{\Gamma(0)}.
\]

The coherence time \(\tau_c\) is defined as the width of \(|\gamma(\tau)|\). The **Wiener-Khinchin theorem** states that \(\Gamma(\tau)\) and the power spectral density \(S(\nu)\) are Fourier transform pairs:

\[
\Gamma(\tau) = \int_0^\infty S(\nu)\,e^{2\pi i\nu\tau}\,d\nu.
\]

This connects the temporal coherence properties of a source to its spectral profile: a spectrally narrow source (small bandwidth \(\Delta\nu\)) has long coherence time (\(\tau_c \approx 1/\Delta\nu\)) and large coherence length (\(l_c = c\tau_c\)).

## 7.2 Spatial Coherence and the van Cittert-Zernike Theorem

**Spatial coherence** characterizes the correlation between the field at two spatially separated points in the same transverse plane. The **mutual intensity** is:

\[
J(\mathbf{r}_1, \mathbf{r}_2) = \langle E^*(\mathbf{r}_1) E(\mathbf{r}_2) \rangle.
\]

The celebrated **van Cittert-Zernike theorem** states that for an incoherent extended source, the mutual intensity in the observation plane is the Fourier transform of the source intensity distribution:

\[
J(\mathbf{r}_1, \mathbf{r}_2) \propto \mathcal{F}\{I_s\}\left(\frac{\mathbf{r}_1 - \mathbf{r}_2}{\lambda z}\right).
\]

This is profound: even though the source itself is incoherent, the field it produces becomes partially coherent over a transverse coherence area \(\sim (\lambda/\theta_s)^2\), where \(\theta_s\) is the angular subtense of the source. Starlight, though from an incoherent source, is spatially coherent over areas of square millimeters (the "seeing disk"), enabling stellar interferometry (Michelson, 1921) and modern intensity interferometry (Hanbury Brown and Twiss, 1956).

---

# Chapter 8: Diffraction — Fresnel and Fraunhofer

## 8.1 The Huygens-Fresnel Diffraction Integral

The starting point for scalar diffraction theory is the **Huygens-Fresnel diffraction integral**: the field \(U(P)\) at observation point \(P\) due to a field distribution \(U(Q)\) over aperture plane \(\Sigma\) is:

\[
U(P) = \frac{1}{i\lambda}\iint_\Sigma U(Q)\frac{e^{ikr}}{r}\cos\theta\,dS,
\]

where \(r = |P - Q|\) and \(\theta\) is the angle between the outward normal to \(\Sigma\) and the direction to \(P\). For the paraxial case (\(\theta \approx 0\), \(\cos\theta \approx 1\)):

\[
U(x, y, z) = \frac{e^{ikz}}{i\lambda z}\iint U(x', y', 0)\,e^{i\frac{k}{2z}\left[(x-x')^2 + (y-y')^2\right]}\,dx'\,dy'.
\]

This is the **Fresnel diffraction integral** — a 2D convolution of the aperture field with the Fresnel propagator \(h(x,y) = \frac{e^{ikz}}{i\lambda z}e^{ik(x^2+y^2)/(2z)}\).

## 8.2 Fresnel Diffraction

In the **Fresnel regime** (near field), the quadratic phase in the propagator cannot be neglected, and the diffraction pattern changes with propagation distance. The key parameter is the **Fresnel number**:

\[
N_F = \frac{a^2}{\lambda z},
\]

where \(a\) is the aperture half-width and \(z\) is the propagation distance. For \(N_F \gg 1\), we are in the near field (geometric optics regime); for \(N_F \ll 1\), we are in the Fraunhofer regime.

For a slit of half-width \(a\), the Fresnel diffraction intensity involves **Fresnel integrals**:

\[
C(w) = \int_0^w \cos\left(\frac{\pi t^2}{2}\right)dt, \qquad S(w) = \int_0^w \sin\left(\frac{\pi t^2}{2}\right)dt,
\]

whose behavior is visualized by the **Cornu spiral** in the complex \((C, S)\) plane. Each point on the spiral corresponds to a wavefront segment, and the resultant amplitude is a chord of the spiral.

Fresnel diffraction explains the alternating bright and dark fringes seen behind a straight edge — the "shadow" of the edge is not sharp but oscillates with decreasing amplitude. A Fresnel zone plate — a series of alternating opaque and transparent annuli, blocking alternate Fresnel zones — acts as a lens, focusing light at multiple focal lengths; this principle underlies X-ray zone plate optics.

## 8.3 Fraunhofer Diffraction as a Fourier Transform

In the **Fraunhofer (far-field) limit** (\(N_F \ll 1\)), the quadratic phase from the aperture position can be neglected, and the diffraction pattern is simply the **2D Fourier transform** of the aperture function evaluated at spatial frequencies \((u, v) = (x/\lambda z, y/\lambda z)\):

\[
U(x, y) \propto \mathcal{F}\{U_{\mathrm{aperture}}\}\left(\frac{x}{\lambda z}, \frac{y}{\lambda z}\right).
\]

This is one of the deepest results in optics: the far-field diffraction pattern is the Fourier transform of the aperture. Knowing this, all the properties of Fraunhofer diffraction follow directly from the properties of the Fourier transform. Multiple slits give a comb times a single-slit sinc; a circular aperture gives a Bessel function (Airy pattern); a grating gives sharp delta-function-like peaks modulated by the single-slit envelope.

---

# Chapter 9: Fourier Optics — The Lens as a Fourier Transformer

## 9.1 Thin Lens Phase Transformation

A thin lens of focal length \(f\) imposes a quadratic phase shift on a transmitted field:

\[
U_{\mathrm{after}}(x, y) = U_{\mathrm{before}}(x, y)\cdot e^{-i\frac{k}{2f}(x^2 + y^2)}.
\]

This phase shift precisely cancels the quadratic phase accumulated during free-space propagation, enabling exact Fourier transformation in a finite (not infinite) distance.

## 9.2 Fourier Transform by a Lens

Consider a field \(U_0(x, y)\) in the front focal plane of a lens of focal length \(f\). After propagating distance \(f\) to the lens and another distance \(f\) to the back focal plane, the field is:

\[
U_f(x, y) = \frac{e^{i2kf}}{i\lambda f}\mathcal{F}\{U_0\}\left(\frac{x}{\lambda f}, \frac{y}{\lambda f}\right).
\]

The back focal plane of the lens contains the exact 2D Fourier transform of the input field (up to quadratic phases and a constant). This is the **4f system** principle: two lenses separated by \(2f\) implement a complete Fourier cycle, imaging the input to the output with unit magnification (but inverted).

<div class="theorem">
<strong>The Lens as a Fourier Transformer:</strong> A converging lens of focal length \(f\) performs a 2D Fourier transform between its front focal plane and back focal plane. The spatial coordinates \((x, y)\) in the back focal plane correspond to spatial frequencies \((u, v) = (x/\lambda f, y/\lambda f)\) in the input plane.
</div>

## 9.3 Spatial Filtering and Optical Processing

The 4f system makes possible **spatial filtering** — selective manipulation of the Fourier components of an image. A mask placed in the Fourier (back focal) plane of the first lens multiplies the frequency spectrum by a transfer function \(H(u, v)\); the second lens takes the inverse Fourier transform, implementing the linear filtering operation:

\[
U_{\mathrm{out}}(x, y) = \mathcal{F}^{-1}\left\{H(u, v)\cdot\mathcal{F}\{U_{\mathrm{in}}\}(u, v)\right\} = (h * U_{\mathrm{in}})(x, y),
\]

where \(h\) is the point spread function corresponding to \(H\). Applications include:

- **Low-pass filtering** (remove high frequencies): blurring, noise reduction
- **High-pass filtering** (remove low frequencies): edge detection, dark-field microscopy
- **Phase contrast microscopy** (Zernike): convert phase variations into amplitude variations, making transparent phase objects visible
- **Schlieren imaging**: visualize refractive index gradients in fluids

## 9.4 Optical Transfer Function and Imaging Resolution

For an incoherent imaging system, the image intensity is the convolution of the object intensity with the **point spread function** (PSF) \(|h(x,y)|^2\):

\[
I_{\mathrm{image}}(x, y) = |h|^2 * I_{\mathrm{object}}.
\]

In frequency space, the image spectrum equals the object spectrum multiplied by the **optical transfer function** (OTF):

\[
\tilde{I}_{\mathrm{image}}(u, v) = \mathrm{OTF}(u, v) \cdot \tilde{I}_{\mathrm{object}}(u, v).
\]

The OTF is the autocorrelation of the pupil function (the aperture in the Fourier plane):

\[
\mathrm{OTF}(u, v) = \frac{\iint P(x, y)P^*(x - \lambda f u, y - \lambda f v)\,dx\,dy}{\iint |P(x,y)|^2\,dx\,dy}.
\]

For a circular pupil of diameter \(D\), the OTF is the overlap area of two shifted disks; it cuts off at spatial frequency \(u_c = D/(\lambda f)\), the **diffraction-limited cutoff**. Beyond this frequency, no information passes through the system — spatial detail finer than \(1/u_c = \lambda f/D\) cannot be resolved.

The **modulation transfer function** (MTF) is the magnitude of the OTF, characterizing contrast as a function of spatial frequency. A perfect aberration-free system has the largest possible MTF for a given aperture; aberrations reduce the MTF, degrading contrast before the cutoff frequency.

---

# Chapter 10: Advanced Topics — Coherence in Imaging and Modern Optical Instruments

## 10.1 Coherent vs. Incoherent Imaging

The coherence of the illumination fundamentally determines how images are formed:

In **coherent imaging** (laser illumination), amplitudes add. The image amplitude is a convolution: \(U_{\mathrm{image}} = h * U_{\mathrm{object}}\). Interference effects occur between contributions from different object points. Edge-ringing artifacts (Gibbs phenomenon) appear at sharp boundaries.

In **incoherent imaging** (thermal or LED illumination), intensities add. The image intensity is a convolution with the PSF: \(I_{\mathrm{image}} = \mathrm{PSF} * I_{\mathrm{object}}\). No inter-point interference. The OTF is always real and non-negative for a diffraction-limited system (for coherent systems the coherent transfer function is the pupil, which can have complex values).

Incoherent systems typically have higher resolution than coherent ones for the same aperture (the incoherent cutoff frequency is twice the coherent cutoff), and do not suffer from speckle — a granular interference pattern characteristic of coherent imaging of rough surfaces.

## 10.2 Laser Beams and Gaussian Optics

A **Gaussian beam** — the TEM\(_{00}\) mode of a laser resonator — has a transverse field distribution:

\[
E(r, z) = E_0\frac{w_0}{w(z)}\exp\left(-\frac{r^2}{w(z)^2}\right)\exp\left(-ikz - ik\frac{r^2}{2R(z)} + i\zeta(z)\right),
\]

where \(w(z) = w_0\sqrt{1 + (z/z_R)^2}\) is the beam radius, \(R(z) = z(1 + (z_R/z)^2)\) is the wavefront radius of curvature, \(z_R = \pi w_0^2/\lambda\) is the **Rayleigh range**, and \(\zeta(z) = \arctan(z/z_R)\) is the **Gouy phase**.

The Gaussian beam is a self-consistent solution to the paraxial wave equation. Its remarkable property: a Gaussian beam transforms into another Gaussian beam through any optical system. The ABCD matrix of the system propagates the **complex beam parameter**:

\[
q(z) = z + iz_R = \frac{1}{1/R - i\lambda/(\pi w^2)},
\]

via the transformation \(q' = (Aq + B)/(Cq + D)\). This makes Gaussian beam optics analytically tractable for designing laser resonators, beam expanders, and fiber coupling systems.

## 10.3 Selected Modern Applications

The concepts developed in this course underpin a broad range of modern technologies and research fields:

**Optical coherence tomography (OCT):** Uses low-coherence interferometry (Michelson interferometer with a broad-bandwidth source, \(l_c \sim 10\ \mu\mathrm{m}\)) to achieve depth-resolved imaging of biological tissue without physical sectioning. The coherence length determines the axial resolution; the focusing optics determine the transverse resolution. OCT is now standard in ophthalmology for retinal imaging.

**Adaptive optics:** Measures the wavefront distortion introduced by atmospheric turbulence (using a guide star or laser beacon) and corrects it in real time with a deformable mirror. The wavefront sensor (Shack-Hartmann: an array of lenslets, each measuring local tilt) samples the pupil; the deformable mirror conjugates the distortion. Modern adaptive optics systems achieve diffraction-limited imaging at the world's largest telescopes.

**Holography:** Records the complete amplitude and phase of the field scattered by an object (using interference with a reference beam) in a photosensitive medium. Illuminating the hologram with the reference beam reconstructs the scattered wavefront, producing a three-dimensional image. Digital holography captures the interference pattern on a CCD and reconstructs numerically using the Fresnel diffraction integral.

**Structured illumination microscopy (SIM):** Projects a sinusoidal illumination pattern onto a sample; the Moiré effect between the illumination pattern and the sample's fine structure down-converts high-frequency information into the passband of the imaging system. Computational reconstruction doubles the conventional resolution limit — achieving \(\sim 100\ \mathrm{nm}\) with visible light.

These applications are united by the same theoretical framework — Maxwell's equations, Fourier analysis, coherence theory — that we have developed throughout this course. The physical content of optics is stable; only the technological manifestations continue to evolve.
