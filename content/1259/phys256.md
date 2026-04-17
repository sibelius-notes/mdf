---
title: "PHYS 256: Geometrical and Physical Optics"
subjects: "PHYS"
prof: "Fil Simovic"
---

## Sources and References
**Primary textbook** — Hecht, E. *Optics*, 5th ed. Pearson, 2017.
**Online resources** — Fitzpatrick, R. *Classical Electromagnetism* at farside.ph.utexas.edu; MIT OCW 8.03 (Physics III: Vibrations and Waves); HyperPhysics optics section at hyperphysics.phy-astr.gsu.edu; Born, M. and Wolf, E. *Principles of Optics* (advanced reference)

---

# Chapter 1: Introduction to Optics and the Nature of Light

## 1.1 What Is Light?

Light has been the subject of one of the deepest and most productive debates in the history of physics. In the seventeenth century, Newton argued that light was a stream of corpuscles (particles), while Huygens insisted it was a wave. Young's double-slit experiment (1801) seemed to settle the matter decisively in favor of waves; Maxwell's electromagnetic theory (1865) explained what kind of wave; and then quantum mechanics opened the wave-particle duality that has characterized our understanding ever since.

For the purposes of this course, we will visit three complementary models:

- **Geometrical optics** (ray optics): valid when the wavelength \(\lambda\) is much smaller than all relevant dimensions. Light travels in straight lines (rays), reflecting and refracting at interfaces.
- **Physical optics** (wave optics): necessary when dimensions are comparable to \(\lambda\). Interference and diffraction effects emerge.
- **Electromagnetic optics**: the full Maxwell treatment, required for polarization and the interaction of light with matter at a fundamental level.

The approximate validity of each model is a lesson in the hierarchy of physical theories: simpler models are not wrong, they are limiting cases of more complete ones.

## 1.2 The Electromagnetic Spectrum

Light in the visible range occupies wavelengths approximately 380 nm (violet) to 750 nm (red), a tiny sliver of the **electromagnetic spectrum**. Maxwell's equations predict electromagnetic waves at all frequencies; today we use radio waves (km–m), microwaves (cm–mm), infrared (mm–750 nm), visible, ultraviolet, X-rays, and gamma rays in a vast array of technologies and scientific instruments. The wave speed in vacuum is:

\[
c = \frac{1}{\sqrt{\varepsilon_0 \mu_0}} = 2.998 \times 10^8\ \mathrm{m\,s^{-1}},
\]

and the wavelength-frequency relation is \(c = f\lambda\).

---

# Chapter 2: Reflection, Refraction, and Fermat's Principle

## 2.1 The Laws of Reflection and Refraction

When light encounters an interface between two media with different refractive indices \(n_1\) and \(n_2\), it generally splits into a reflected ray and a refracted (transmitted) ray.

<div class="theorem">
<strong>Law of Reflection:</strong> The angle of incidence \(\theta_i\) equals the angle of reflection \(\theta_r\), both measured from the surface normal:
\[
\theta_i = \theta_r.
\]

<strong>Snell's Law (Law of Refraction):</strong> The refracted ray satisfies
\[
n_1 \sin\theta_i = n_2 \sin\theta_t,
\]
where \(\theta_t\) is the angle of the transmitted ray from the normal.
</div>

The **refractive index** of a medium is defined as:

\[
n = \frac{c}{v} \geq 1,
\]

where \(v\) is the speed of light in the medium. For glass, \(n \approx 1.5\); for diamond, \(n \approx 2.4\); for air, \(n \approx 1.0003\).

## 2.2 Fermat's Principle

Both the law of reflection and Snell's law can be derived from a single, elegant principle proposed by Pierre de Fermat in 1662.

<div class="theorem">
<strong>Fermat's Principle (Principle of Least/Stationary Time):</strong> The path taken by light between two points is the one for which the optical path length (equivalently, the travel time) is stationary — a minimum, maximum, or saddle point — with respect to small variations in the path.
</div>

The **optical path length** (OPL) between two points is:

\[
\mathrm{OPL} = \int_A^B n\,ds,
\]

where \(ds\) is the element of arc length. Snell's law follows by requiring \(\delta(\mathrm{OPL}) = 0\) at a planar interface, varying the point of crossing. Fermat's principle is more than a convenient mnemonic: it connects to the Huygens-Fresnel principle in wave optics and anticipates the Lagrangian principle of stationary action in mechanics.

## 2.3 Total Internal Reflection

When light travels from a denser medium (\(n_1 > n_2\)) to a less dense one, Snell's law gives:

\[
\sin\theta_t = \frac{n_1}{n_2}\sin\theta_i > \sin\theta_i.
\]

As \(\theta_i\) increases, \(\theta_t\) approaches 90°. At the **critical angle** \(\theta_c\):

\[
\sin\theta_c = \frac{n_2}{n_1}, \qquad \theta_t = 90°.
\]

For \(\theta_i > \theta_c\), no transmitted ray can exist; all energy is reflected in **total internal reflection** (TIR). This is the principle underlying **optical fibers**: light injected into a glass core (\(n \approx 1.5\)) surrounded by cladding (\(n \approx 1.46\)) remains trapped by TIR, bouncing along the fiber over kilometers with only gradual attenuation. Fiber optic cables carry the majority of the world's internet traffic.

For glass-air: \(\sin\theta_c = 1/1.5 \implies \theta_c \approx 41.8°\). TIR also underlies diamonds' exceptional brilliance: the large refractive index (\(n \approx 2.4\)) gives a small critical angle, and the cut is designed so that nearly all light entering the top surface undergoes TIR before exiting upward.

---

# Chapter 3: Dispersion, Prisms, and Fiber Optics

## 3.1 Dispersion

The refractive index of any real medium varies with wavelength — a phenomenon called **dispersion**. In glass, \(n\) is larger for shorter wavelengths (normal dispersion in the visible):

\[
n(\lambda) \approx n_0 + \frac{dn}{d\lambda}\Big|_{\lambda_0}(\lambda - \lambda_0) + \cdots
\]

The **Cauchy equation** is an empirical approximation:

\[
n(\lambda) \approx A + \frac{B}{\lambda^2} + \frac{C}{\lambda^4},
\]

with constants \(A, B, C\) characteristic of the glass. The **Sellmeier equation** is a more physical form, reflecting the resonances of bound electrons.

Dispersion is why a prism separates white light into a rainbow: Snell's law at each surface bends different wavelengths by different amounts. Red light (longer \(\lambda\), smaller \(n\)) is bent less than violet light.

## 3.2 The Prism

For a prism with apex angle \(\alpha\) and refractive index \(n\), a ray entering one face and exiting the other is deflected by the **deviation angle** \(\delta\). At minimum deviation (the symmetric configuration where the ray passes through the prism parallel to the base):

\[
n = \frac{\sin\left(\frac{\alpha + \delta_{\min}}{2}\right)}{\sin\left(\frac{\alpha}{2}\right)}.
\]

This provides a precise method for measuring \(n\) as a function of wavelength. Spectrometers based on prisms were the workhorses of nineteenth-century spectroscopy.

---

# Chapter 4: Mirrors and Lenses

## 4.1 Mirrors: Reflection and Image Formation

A **spherical mirror** of radius of curvature \(R\) has focal length \(f = R/2\) (for a concave mirror, \(f > 0\); for convex, \(f < 0\)). The **mirror equation** relates object distance \(d_o\), image distance \(d_i\), and focal length:

\[
\frac{1}{d_o} + \frac{1}{d_i} = \frac{1}{f} = \frac{2}{R}.
\]

This equation follows from the geometry of paraxial (small angle) reflection. The **magnification** is:

\[
m = -\frac{d_i}{d_o}.
\]

A negative magnification indicates an inverted image. For a flat mirror, \(R \to \infty\), \(f \to \infty\), and the image is at the same distance behind the mirror as the object is in front — the familiar virtual, upright, same-size reflection.

## 4.2 Thin Lenses: The Lensmaker's Equation

A **thin lens** has two refracting surfaces, each of radius of curvature \(R_1\) and \(R_2\), made of glass with index \(n\) immersed in a medium of index \(n_{\mathrm{med}}\). The **lensmaker's equation** gives the focal length:

\[
\frac{1}{f} = \frac{n - n_{\mathrm{med}}}{n_{\mathrm{med}}}\left(\frac{1}{R_1} - \frac{1}{R_2}\right).
\]

For a lens in air (\(n_{\mathrm{med}} = 1\)):

\[
\frac{1}{f} = (n-1)\left(\frac{1}{R_1} - \frac{1}{R_2}\right).
\]

(Convention: \(R > 0\) if the center of curvature is on the transmission side, \(R < 0\) otherwise.)

The **thin lens equation** (same form as the mirror equation) gives image location:

\[
\frac{1}{d_o} + \frac{1}{d_i} = \frac{1}{f}.
\]

**Converging lenses** (\(f > 0\)) bring parallel rays to a real focus; **diverging lenses** (\(f < 0\)) spread them as if from a virtual focus. The **power** of a lens, measured in diopters (D), is \(P = 1/f\) (with \(f\) in meters). Lenses in contact combine as \(P = P_1 + P_2\).

## 4.3 Ray Tracing

Ray tracing is the geometric method of tracking where specific, strategically chosen rays go to find the image. For a thin converging lens, three principal rays are used:

1. A ray parallel to the optical axis refracts through the far focal point.
2. A ray through the center of the lens passes straight through undeviated.
3. A ray through the near focal point emerges parallel to the axis.

The image is located at the intersection of the refracted rays (real image if they actually cross; virtual image if only their extensions cross).

---

# Chapter 5: Thick Lenses, Lens Systems, and the Paraxial Approximation

## 5.1 The Paraxial Approximation

All of the thin-lens formulas derived so far are valid only in the **paraxial approximation**: rays must make small angles with the optical axis, so that \(\sin\theta \approx \tan\theta \approx \theta\). Outside this regime, rays from a point source are not focused to a single image point — this is the origin of **aberrations**.

## 5.2 Matrix Methods in Ray Optics

The paraxial approximation admits a powerful matrix formalism. A ray at height \(y\) from the axis and angle \(\theta\) (positive upward/away from axis) to the axis is represented as a column vector:

\[
\begin{pmatrix} y \\ \theta \end{pmatrix}.
\]

Propagation through a homogeneous medium of length \(d\) is represented by the **translation matrix**:

\[
M_T = \begin{pmatrix} 1 & d \\ 0 & 1 \end{pmatrix}.
\]

Refraction at a spherical interface (from medium \(n_1\) to \(n_2\), radius of curvature \(R\)) is represented by the **refraction matrix**:

\[
M_R = \begin{pmatrix} 1 & 0 \\ -P & 1 \end{pmatrix}, \qquad P = \frac{n_2 - n_1}{R}.
\]

The system matrix for a sequence of optical elements is the product of their matrices (in reverse order of encounter). This method handles thick lenses, lens doublets, and complex multi-element optical systems with ease.

<div class="theorem">
For a system matrix \(M = \begin{pmatrix} A & B \\ C & D \end{pmatrix}\), the effective focal length is \(f = -1/C\) (in the appropriate medium units), and the positions of the principal planes are determined from the matrix elements. The image and object distances satisfy the generalized conjugate equation derivable from the matrix.
</div>

## 5.3 Introduction to Aberrations

**Aberrations** are failures of the paraxial approximation: real rays do not intersect at the paraxial image point. They are classified as:

**Spherical aberration:** Rays at different heights from the axis are focused at different distances along the axis. It arises from the \(\theta^3\) term in the Taylor expansion of \(\sin\theta\). Corrected by using aspherical surfaces or lens doublets.

**Coma:** Off-axis point sources are imaged as comet-shaped blurs. The image quality varies across the field.

**Astigmatism:** Rays in perpendicular planes through an off-axis point are focused at different distances, creating elongated images.

**Field curvature:** The ideal image surface is not flat but curved. Flat-field objectives correct this.

**Distortion:** Magnification varies with field position, distorting straight lines into curves (pincushion or barrel distortion).

**Chromatic aberration:** Since \(n\) varies with \(\lambda\), lenses focus different wavelengths at different points. Corrected by achromatic doublets — a converging crown glass lens cemented to a diverging flint glass lens, chosen so that their dispersions cancel at two wavelengths.

---

# Chapter 6: Optical Instruments

## 6.1 The Human Eye

The **eye** is the original optical instrument. Light enters through the cornea (the primary refracting surface, \(n_{\mathrm{cornea}} \approx 1.376\)), passes through the aqueous humor, lens (variable focal length via ciliary muscles), and vitreous humor, to form an image on the retina's photoreceptors. The cornea provides about two-thirds of the eye's total refracting power; the lens provides the remainder and adjusts (**accommodation**) to focus objects at different distances.

**Nearsightedness** (myopia): the eye's optical system is too powerful (or the eye is too long), forming images in front of the retina. Corrected by a diverging lens.

**Farsightedness** (hyperopia): images form behind the retina. Corrected by a converging lens.

## 6.2 Magnifying Glass, Microscope, and Telescope

The purpose of most optical instruments is to make small or distant objects appear larger, enabling finer detail to be resolved.

A **simple magnifying glass** (converging lens of focal length \(f\)) held near the eye allows an object to be placed at the near point of the instrument rather than the near point of the eye (\(d_0 \approx 25\ \mathrm{cm}\)). The angular magnification for a relaxed eye (image at infinity) is:

\[
M_\theta = \frac{25\ \mathrm{cm}}{f}.
\]

A **compound microscope** uses an objective lens (short focal length \(f_{\mathrm{obj}}\)) to form a magnified real image, which is then further magnified by the eyepiece (focal length \(f_{\mathrm{eye}}\)). The total angular magnification is:

\[
M = -\frac{L}{f_{\mathrm{obj}}} \cdot \frac{25\ \mathrm{cm}}{f_{\mathrm{eye}}},
\]

where \(L\) is the optical tube length (distance from the objective's rear focal point to the eyepiece's front focal point).

An **astronomical refracting telescope** has an objective of long focal length \(f_{\mathrm{obj}}\) and an eyepiece of short focal length \(f_{\mathrm{eye}}\). The angular magnification is:

\[
M_\theta = -\frac{f_{\mathrm{obj}}}{f_{\mathrm{eye}}}.
\]

Modern large telescopes are reflecting (Newtonian, Cassegrain, Gregorian designs) because large-diameter mirrors are easier to fabricate and support than large lenses, and do not suffer from chromatic aberration.

---

# Chapter 7: Physical Properties of Light — Electromagnetic Foundations

## 7.1 Light as an Electromagnetic Wave

Maxwell's equations in vacuum admit plane-wave solutions:

\[
\mathbf{E}(\mathbf{r}, t) = \mathbf{E}_0 \cos(\mathbf{k}\cdot\mathbf{r} - \omega t), \qquad \mathbf{B} = \frac{1}{c}\hat{k} \times \mathbf{E},
\]

where \(\mathbf{k}\) is the wave vector (\(|\mathbf{k}| = \omega/c = 2\pi/\lambda\)), \(\mathbf{E}_0\) is perpendicular to \(\mathbf{k}\), and \(\mathbf{B}\) is perpendicular to both. The wave is transverse, and \(\mathbf{E}\), \(\mathbf{B}\), and \(\hat{k}\) form a right-handed orthogonal triad.

The energy carried by the wave is described by the **Poynting vector**:

\[
\mathbf{S} = \frac{1}{\mu_0}\mathbf{E} \times \mathbf{B}.
\]

The time-averaged intensity (irradiance) is:

\[
I = \langle S \rangle = \frac{c\varepsilon_0}{2}E_0^2 = \frac{E_0^2}{2\mu_0 c}.
\]

## 7.2 Scattering and Absorption

When light propagates through a real medium, some energy is scattered and some is absorbed. The irradiance decreases exponentially with distance (Beer-Lambert law):

\[
I(z) = I_0 e^{-\alpha z},
\]

where \(\alpha\) is the **absorption coefficient** (units: m\(^{-1}\)). **Rayleigh scattering** describes the elastic scattering of light by particles much smaller than the wavelength; its cross-section scales as \(\lambda^{-4}\). This accounts for the blue sky (short wavelengths scatter more, so the sky appears blue) and the red sunset (at shallow angles, blue light is scattered away, leaving the longer wavelengths).

---

# Chapter 8: Coherence and Superposition of Waves

## 8.1 Superposition and the Phasor Representation

The **principle of superposition** states that the total electric field is the vector sum of all constituent fields. For two monochromatic waves of the same frequency and polarization:

\[
E_1 = E_{01}\cos(\omega t - \phi_1), \qquad E_2 = E_{02}\cos(\omega t - \phi_2),
\]

the sum is:

\[
E = E_1 + E_2 = E_0 \cos(\omega t - \phi),
\]

where the amplitude and phase of the resultant can be found by phasor (complex amplitude) addition:

\[
\tilde{E} = E_{01}e^{-i\phi_1} + E_{02}e^{-i\phi_2}.
\]

The intensity of the resultant is:

\[
I = I_1 + I_2 + 2\sqrt{I_1 I_2}\cos(\delta),
\]

where \(\delta = \phi_2 - \phi_1\) is the phase difference. When \(\delta = 0, 2\pi, 4\pi, \ldots\), we have **constructive interference** (\(I = (\sqrt{I_1} + \sqrt{I_2})^2\)); when \(\delta = \pi, 3\pi, \ldots\), **destructive interference** (\(I = (\sqrt{I_1} - \sqrt{I_2})^2\)).

## 8.2 Coherence

For interference to be observable, the two waves must maintain a stable phase relationship. A perfectly monochromatic wave has an infinite **coherence length** — its phase is predictable arbitrarily far into the future. Real sources emit wave trains of finite duration \(\tau_c\) (the **coherence time**), corresponding to a coherence length:

\[
l_c = c\tau_c \approx \frac{\lambda^2}{\Delta\lambda},
\]

where \(\Delta\lambda\) is the bandwidth of the source. A sodium lamp (\(\Delta\lambda \approx 0.5\ \mathrm{nm}\) at \(\lambda = 589\ \mathrm{nm}\)) has \(l_c \approx 0.7\ \mathrm{mm}\); a laser (\(\Delta\lambda \sim 10^{-6}\ \mathrm{nm}\)) has \(l_c \sim 1\ \mathrm{km}\).

**Spatial coherence** describes the correlation of the wave field across its transverse extent. A true point source is perfectly spatially coherent; an extended source (like the Sun) has limited spatial coherence characterized by the coherence area. Both temporal and spatial coherence must be adequate for interference fringes to form.

---

# Chapter 9: Interference and Interferometers

## 9.1 Young's Double-Slit Experiment

Thomas Young's 1801 experiment remains one of the most celebrated in physics. Light from a coherent source (or a small pinhole) illuminates two slits separated by distance \(d\). On a screen at distance \(L \gg d\), the path difference between rays from the two slits to a point \(P\) at height \(y\) from center is:

\[
\Delta = d\sin\theta \approx \frac{dy}{L} \quad (\text{small angle}).
\]

Bright fringes (constructive interference) occur when \(\Delta = m\lambda\):

\[
y_m = \frac{m\lambda L}{d}, \qquad m = 0, \pm 1, \pm 2, \ldots
\]

The fringe spacing is \(\Delta y = \lambda L / d\). The intensity pattern for two equal slits is:

\[
I(\theta) = 4I_0 \cos^2\left(\frac{\delta}{2}\right), \qquad \delta = \frac{2\pi d\sin\theta}{\lambda}.
\]

## 9.2 Thin Film Interference

Interference also occurs between light reflected from the front and back surfaces of a thin film (soap bubble, oil slick, anti-reflection coating). Consider a film of thickness \(t\) and refractive index \(n_f\) between media of indices \(n_1\) (above) and \(n_2\) (below).

The optical path difference between the two reflected beams (for near-normal incidence) is approximately \(2n_f t\). Additional phase shifts of \(\pi\) arise whenever light reflects from a medium of higher index. For a film in air (\(n_1 = n_2 = 1 < n_f\)), both reflected beams suffer a phase shift, so the net extra phase from reflections is zero, and the condition for a **bright fringe** is:

\[
2n_f t = m\lambda, \qquad m = 1, 2, 3, \ldots
\]

For an air wedge (\(n_f = 1\), surrounded by glass), the lower surface reflection alone suffers a \(\pi\) shift, and the condition for a bright fringe becomes \(2t = (m + 1/2)\lambda\). This is the basis of Newton's rings.

## 9.3 The Michelson Interferometer

The **Michelson interferometer** (1887) splits a beam by a half-silvered mirror (beamsplitter), sends the two halves down perpendicular arms of lengths \(L_1\) and \(L_2\), reflects them back, and recombines them. The path difference is \(\Delta = 2(L_1 - L_2)\), and the output intensity varies sinusoidally as one arm length is varied. Moving one mirror by \(\lambda/2\) shifts the fringe pattern by exactly one fringe, allowing length changes to be measured in units of half-wavelengths.

Michelson and Morley used this instrument in 1887 to test for the "luminiferous ether" — the hypothetical medium for light waves. Their null result (no fringe shift as the Earth moved through the ether) was one of the most important experiments in physics history, ultimately pointing toward Einstein's special relativity.

Modern descendants of the Michelson interferometer — the LIGO observatories with 4 km arms — can detect gravitational wave-induced length changes of \(\sim 10^{-18}\ \mathrm{m}\), far smaller than a proton.

---

# Chapter 10: Diffraction

## 10.1 Huygens-Fresnel Principle

**Huygens' principle** (1678) states that every point on a wavefront can be regarded as a secondary source of spherical wavelets, and the new wavefront is the envelope of these wavelets. **Fresnel** (1818) extended this by including the amplitude and phase of the secondary wavelets (including an obliquity factor). The Huygens-Fresnel principle provides the physical basis for diffraction.

**Diffraction** is the bending of waves around obstacles and through apertures. It is a wave phenomenon with no analog in geometric optics. Its observation requires that the wavelength be comparable to the aperture or obstacle size.

## 10.2 Fraunhofer (Far-Field) Diffraction

In the **Fraunhofer** (far-field) limit, both the source and observation point are effectively at infinite distance from the aperture (or equivalently, lenses are used to observe diffraction in the focal plane). The complex amplitude at angle \(\theta\) is proportional to the **Fourier transform** of the aperture function.

For a single slit of width \(a\), the intensity pattern is:

\[
I(\theta) = I_0 \left(\frac{\sin\alpha}{\alpha}\right)^2, \qquad \alpha = \frac{\pi a \sin\theta}{\lambda}.
\]

The central maximum has width \(2\lambda/a\) (first zeros at \(\theta = \pm\lambda/a\)). Secondary maxima are weaker by factors of roughly \(1/(m+1/2)^2\pi^2\).

For a circular aperture of diameter \(D\), the diffraction pattern is the **Airy disk**, with the first dark ring at:

\[
\sin\theta = 1.22\frac{\lambda}{D}.
\]

This determines the **Rayleigh criterion** for angular resolution: two point sources are just resolved when the central maximum of one falls on the first minimum of the other:

\[
\theta_{\mathrm{min}} = 1.22\frac{\lambda}{D}.
\]

The \(200\ \mathrm{inch}\) (5 m) Hale Telescope has a theoretical resolution of \(\sim 0.02^{\prime\prime}\) at visible wavelengths. Atmospheric seeing limits ground-based telescopes to \(\sim 1^{\prime\prime}\), motivating space telescopes (Hubble) and adaptive optics systems.

## 10.3 The Diffraction Grating

A **diffraction grating** consists of \(N\) slits (or grooves) of spacing \(d\). The condition for principal maxima (bright fringes) is:

\[
d\sin\theta = m\lambda, \qquad m = 0, \pm 1, \pm 2, \ldots
\]

The angular dispersion is \(d\theta/d\lambda = m/(d\cos\theta)\), and the resolving power is:

\[
\mathcal{R} = \frac{\lambda}{\delta\lambda} = mN.
\]

A grating with \(N = 10{,}000\) grooves used in first order can resolve wavelength differences of \(\lambda/10{,}000\) — enough to separate the sodium D doublet (\(\Delta\lambda = 0.6\ \mathrm{nm}\)) and much finer spectral features. Gratings are the backbone of modern spectroscopy, from the analysis of atomic spectra to the measurement of stellar radial velocities.

---

# Chapter 11: Polarization

## 11.1 The Polarization State of Light

Because light is a transverse electromagnetic wave, the electric field vector can point in any direction perpendicular to the propagation direction. **Polarization** describes the behavior of this direction in time.

**Linear polarization:** The electric field oscillates along a fixed direction. For a wave propagating in the \(z\)-direction:

\[
\mathbf{E} = E_0\cos(kz - \omega t)\,\hat{x}.
\]

**Circular polarization:** The field rotates in the transverse plane:

\[
\mathbf{E} = E_0\left[\cos(kz - \omega t)\,\hat{x} \pm \sin(kz - \omega t)\,\hat{y}\right].
\]

Left and right circular polarizations differ in the sense of rotation.

**Elliptical polarization:** The general case, where the field traces an ellipse in the transverse plane. Both linear and circular polarization are special cases.

**Unpolarized light:** The polarization direction varies randomly on timescales shorter than the detector integration time. Sunlight and incandescent bulb light are unpolarized (or very nearly so).

## 11.2 Polarizers and Malus's Law

An **ideal linear polarizer** transmits the component of the electric field along its transmission axis and blocks the perpendicular component. When linearly polarized light of intensity \(I_0\) passes through a polarizer whose transmission axis makes angle \(\phi\) with the polarization direction:

\[
I = I_0 \cos^2\phi \qquad \text{(Malus's Law)}.
\]

When unpolarized light passes through a polarizer, it emerges as linearly polarized with intensity \(I_0/2\).

## 11.3 Brewster's Angle

At a particular angle of incidence, called **Brewster's angle** \(\theta_B\), the reflected light is completely linearly polarized (the \(s\)- and \(p\)-polarization components have different reflectances, and the \(p\)-component reflectance vanishes):

\[
\tan\theta_B = \frac{n_2}{n_1}.
\]

At this angle, the reflected and refracted rays are perpendicular to each other. Brewster's angle is exploited in laser windows (Brewster windows) to transmit one polarization without reflection loss.

---

# Chapter 12: Wave-Particle Duality

## 12.1 The Photoelectric Effect and Photons

Classical electromagnetic theory predicts that the energy absorbed from a wave should increase continuously with intensity. But the **photoelectric effect** — the ejection of electrons from a metal by light — displays a threshold: below a certain frequency, no electrons are emitted regardless of intensity. Above the threshold, the maximum electron kinetic energy increases linearly with frequency:

\[
K_{\mathrm{max}} = hf - \phi,
\]

where \(h = 6.626 \times 10^{-34}\ \mathrm{J\,s}\) is Planck's constant and \(\phi\) is the work function of the metal. Einstein's 1905 explanation — that light consists of discrete quanta (photons), each of energy \(E = hf\) — earned him the Nobel Prize in 1921 and established the particle nature of light.

## 12.2 de Broglie Waves

In 1924, Louis de Broglie extended wave-particle duality to matter: a particle of momentum \(p\) has an associated **de Broglie wavelength**:

\[
\lambda = \frac{h}{p}.
\]

For an electron accelerated through potential difference \(V\), \(p = \sqrt{2m_e eV}\), giving:

\[
\lambda = \frac{h}{\sqrt{2m_e eV}} \approx \frac{1.226}{\sqrt{V}}\ \mathrm{nm} \quad (V \text{ in volts}).
\]

At \(V = 100\ \mathrm{V}\), \(\lambda \approx 0.12\ \mathrm{nm}\) — comparable to atomic spacings. This underlies **electron microscopy** and **X-ray crystallography**, tools that have revealed the structure of DNA, proteins, and materials.

The wave-particle duality of light is not a contradiction but a sign that light (and matter) are neither classical particles nor classical waves — they are quantum objects that display wave behavior when probed on scales comparable to their wavelength, and particle behavior in individual interaction events.
