---
title: "PHYS 256: Geometrical and Physical Optics"
subjects: "PHYS"
prof: "Fil Simovic"
---

## Sources and References

**Primary textbook** — Hecht, E., *Optics*, 5th ed. (Pearson, 2017). Chapters 4–10.

**Supplementary texts** — Born, M. and Wolf, E., *Principles of Optics*, 7th ed. (Cambridge University Press, 1999); Smith, W. J., *Modern Optical Engineering*, 4th ed. (McGraw-Hill, 2008).

**Online resources** — HyperPhysics Optics, hyperphysics.phy-astr.gsu.edu; Fitzpatrick, R., *Classical Electromagnetism*, farside.ph.utexas.edu; MIT OpenCourseWare 6.014 (Electromagnetic Fields, Forces, and Motion).

---

# Chapter 1: Introduction to Optics and the Nature of Light

## 1.1 The Dual Nature of Light and the Scope of Optics

Light is both a wave and a particle. This paradox — one of the central puzzles of modern physics — has been completely resolved by quantum electrodynamics (QED), which describes light as a quantum field whose excitations (photons) can exhibit both wave and particle characteristics depending on the experiment performed. For the purposes of PHYS 256, however, we operate in two distinct classical regimes that between them account for an enormous range of practical optical phenomena.

**Geometrical optics** — the subject of the first half of the course — applies when the wavelength of light is very small compared to all relevant geometrical dimensions: the size of lenses, mirrors, apertures, and the features of the objects being imaged. In this limit, the wave nature of light is irrelevant, and light can be treated as rays that travel in straight lines in homogeneous media, bend at interfaces according to Snell's law, and are perfectly focused by ideal optical elements. Geometrical optics describes the formation of images by cameras, telescopes, microscopes, and the human eye.

**Physical optics** — the subject of the second half — becomes necessary when the wavelength is comparable to relevant geometrical dimensions, or when we need to understand the detailed structure of images at the resolution limit, the formation of interference fringes, or the separation of light into its spectral components by a diffraction grating. Physical optics treats light as an electromagnetic wave and uses the wave equation and superposition to predict intensity patterns that geometrical optics cannot.

## 1.2 Fermat's Principle

The foundational principle of geometrical optics is **Fermat's Principle of Least Time** (more precisely, the principle of stationary optical path length):

<div class="theorem">
<strong>Fermat's Principle.</strong> The optical path taken by light between two points is such that the optical path length (OPL) is stationary — a minimum, maximum, or saddle point — with respect to small variations of the path.

\[
\delta \text{OPL} = \delta \int_A^B n\, ds = 0
\]
where \(n\) is the refractive index and \(s\) is arc length along the path.
</div>

The **optical path length** \(\text{OPL} = \int n\, ds\) accounts for the fact that light travels more slowly in a medium of refractive index \(n > 1\) — the physical time of flight is proportional to the OPL. Fermat's principle is a variational statement that unifies the two laws of geometric optics and can be used to derive both.

**Derivation of the Law of Reflection.** Consider a mirror lying along the \(x\)-axis. A ray travels from point \(A = (x_A, y_A)\) (above the mirror, \(y_A > 0\)) to a reflection point \(P = (x, 0)\) and then to \(B = (x_B, y_B)\) (\(y_B > 0\)). Since both segments are in the same medium, OPL \(= AP + PB = \sqrt{(x-x_A)^2 + y_A^2} + \sqrt{(x-x_B)^2 + y_B^2}\). Minimising with respect to \(x\): \(d(\text{OPL})/dx = 0\) gives \(\sin\theta_i = \sin\theta_r\), i.e., \(\theta_i = \theta_r\) — the angle of incidence equals the angle of reflection.

**Derivation of Snell's Law.** Consider a ray crossing an interface at \(y = 0\) between media with indices \(n_1\) (above) and \(n_2\) (below). The OPL from \(A = (0, y_A)\) to interface point \(P = (x, 0)\) to \(B = (x_B, -y_B)\) is \(n_1\sqrt{x^2 + y_A^2} + n_2\sqrt{(x_B-x)^2 + y_B^2}\). Setting \(d(\text{OPL})/dx = 0\):

\[
n_1\frac{x}{\sqrt{x^2+y_A^2}} - n_2\frac{x_B - x}{\sqrt{(x_B-x)^2+y_B^2}} = 0 \implies n_1\sin\theta_1 = n_2\sin\theta_2
\]

This is **Snell's Law** — the fundamental law of refraction.

---

# Chapter 2: Reflection, Refraction, and Total Internal Reflection

## 2.1 Reflection and Refraction at Flat Interfaces

When light encounters an interface between two media, it partially reflects and partially transmits (refracts). The reflection and transmission of the electromagnetic wave amplitudes at interfaces are governed by the **Fresnel equations** (derived in Chapter 3), but the directions of the reflected and refracted rays are fixed by Fermat's principle:

- **Law of Reflection**: \(\theta_r = \theta_i\), with the reflected ray in the plane of incidence (the plane containing the incident ray and the surface normal).
- **Snell's Law of Refraction**: \(n_1\sin\theta_1 = n_2\sin\theta_2\), with the refracted ray also in the plane of incidence.

The refractive index \(n\) of a medium is the ratio of the speed of light in vacuum to its speed in the medium: \(n = c/v_\text{phase}\). For glass, \(n \approx 1.5\); for water, \(n \approx 1.33\); for diamond, \(n \approx 2.42\). The refractive index depends on wavelength — **dispersion** — which is the reason a prism separates white light into a spectrum and why chromatic aberration plagues simple lenses.

## 2.2 Total Internal Reflection

When light travels from a denser medium (\(n_1 > n_2\)) toward a less dense medium, Snell's law gives \(\sin\theta_2 = (n_1/n_2)\sin\theta_1 > \sin\theta_1\). As \(\theta_1\) increases, \(\theta_2\) increases faster. At the **critical angle** \(\theta_c\) defined by:

\[
\sin\theta_c = \frac{n_2}{n_1}
\]

the refracted ray grazes the surface (\(\theta_2 = 90°\)). For \(\theta_1 > \theta_c\), no refracted ray exists — all light is **totally internally reflected**. For glass-air interface: \(\theta_c = \arcsin(1/1.5) = 41.8°\). For water-air: \(\theta_c = 48.6°\). For diamond-air: \(\theta_c = 24.4°\) — this small critical angle allows diamond to capture and redirect most incident light through internal reflections, producing the characteristic brilliance.

**Optical fibres** exploit total internal reflection. A glass core (\(n_\text{core} \approx 1.48\)) is surrounded by a cladding (\(n_\text{clad} \approx 1.46\)). Any ray entering the fibre at a steep enough angle (less than the **numerical aperture** \(\text{NA} = \sqrt{n_\text{core}^2 - n_\text{clad}^2} \approx 0.24\) to the fibre axis) undergoes total internal reflection at the core-cladding interface and propagates down the fibre regardless of bends. Modern optical fibres have losses of about 0.2 dB/km — meaning that after 100 km, only half the light remains. They form the backbone of the global internet.

## 2.3 Dispersion and Prisms

The refractive index of glass varies with wavelength — a phenomenon called **dispersion**. For most optical materials, \(n\) decreases with wavelength (**normal dispersion**) in the visible: \(n\) is larger for blue light than for red. When white light passes through a prism, each colour is refracted by a different amount, separating into a spectrum — the rainbow effect Newton analysed in his 1666 experiments.

The **minimum deviation angle** \(\delta_\text{min}\) for a prism of apex angle \(\alpha\) occurs when the light travels symmetrically through the prism (angle of incidence equals angle of emergence). At minimum deviation:

\[
n = \frac{\sin\!\left(\frac{\alpha + \delta_\text{min}}{2}\right)}{\sin\!\left(\frac{\alpha}{2}\right)}
\]

This formula provides one of the most accurate methods of measuring the refractive index of glass: measure the apex angle and the minimum deviation angle, then compute \(n\). The Cauchy dispersion formula gives an approximate description of how \(n\) varies with wavelength \(\lambda\):

\[
n(\lambda) \approx A + \frac{B}{\lambda^2} + \frac{C}{\lambda^4}
\]

where \(A\), \(B\), and \(C\) are constants determined by the glass composition. The **Abbe number** \(V = (n_d - 1)/(n_F - n_C)\) — where \(n_d\), \(n_F\), \(n_C\) are the refractive indices at the sodium D line (589.3 nm), the hydrogen F line (486.1 nm), and the hydrogen C line (656.3 nm) — characterises the dispersive power of a glass. Low-dispersion glasses (crown glass, \(V \approx 60\)) and high-dispersion glasses (flint glass, \(V \approx 30\)) can be combined in **achromatic doublets** to cancel chromatic aberration.

---

# Chapter 3: Mirrors and Lenses — Paraxial Optics

## 3.1 The Paraxial Approximation

The **paraxial approximation** restricts attention to rays making small angles with the optical axis. In this regime, \(\sin\theta \approx \tan\theta \approx \theta\) (with \(\theta\) in radians), and the equations of image formation become linear — enabling a powerful and elegant formalism. All standard mirror and lens formulas are paraxial results; deviations from paraxial behaviour constitute **aberrations** (discussed in Chapter 4).

## 3.2 Spherical Mirrors

A **spherical mirror** has a reflecting surface that is a portion of a sphere of radius \(R\). The **focal length** of a spherical mirror is \(f = R/2\) — rays parallel to the optical axis are reflected through the focal point \(F\) at distance \(f\) from the mirror vertex. The **mirror equation** relates object distance \(s_o\), image distance \(s_i\), and focal length \(f\):

\[
\frac{1}{s_o} + \frac{1}{s_i} = \frac{1}{f} = \frac{2}{R}
\]

The **lateral magnification** is \(m = -s_i/s_o\). A negative magnification means the image is inverted. Using the sign convention where distances are positive in the direction of reflected light (in front of the mirror) and negative behind:
- **Concave mirror** (\(R > 0\)): focal length positive, can form real (in front of mirror) or virtual (behind mirror) images
- **Convex mirror** (\(R < 0\)): focal length negative, always forms virtual, upright, diminished images (used as wide-angle rear-view mirrors)

**Derivation of the mirror equation** (for a concave mirror). Consider a point object on the axis at distance \(s_o\) from the vertex. A ray from the object hits the mirror at a small angle to the axis, reflects by the law of reflection, and passes through the image at distance \(s_i\). By similar triangles applied to the geometry of the reflected ray and the centre of curvature, one derives the formula above. The power of the paraxial approximation is that a single formula describes all ray paths for a given object position.

## 3.3 Thin Lenses

A **thin lens** is a lens whose thickness is negligible compared to its radii of curvature and to the object and image distances. For a thin lens of refractive index \(n\) with radii \(R_1\) and \(R_2\) (positive if the centre of curvature is to the right), the **lensmaker's equation** gives the focal length:

\[
\frac{1}{f} = (n-1)\!\left(\frac{1}{R_1} - \frac{1}{R_2}\right)
\]

The **thin lens equation** has exactly the same form as the mirror equation:

\[
\frac{1}{s_o} + \frac{1}{s_i} = \frac{1}{f}
\]

and the lateral magnification is again \(m = -s_i/s_o\). Converging lenses (\(f > 0\)) are thicker in the middle; diverging lenses (\(f < 0\)) are thinner in the middle.

The **power** of a lens is \(P = 1/f\) in units of diopters (D = m\(^{-1}\)). For two thin lenses in contact, the powers simply add: \(P_\text{total} = P_1 + P_2\). The human eye has a total optical power of about 60 D when focused at infinity (40 D from the cornea, 20 D from the lens), with the ability to accommodate (increase lens power) by about 10 D for close vision.

## 3.4 Ray Tracing

**Ray tracing** is the graphical method for determining image positions and sizes without calculation. For a thin lens, three **principal rays** are easy to trace:

1. A ray parallel to the optical axis passes through the rear focal point after refraction.
2. A ray through the front focal point emerges parallel to the optical axis after refraction.
3. A ray through the optical centre of the lens passes straight through undeviated.

The image is at the intersection (or apparent intersection) of these rays. A real image (formed by converging rays) can be projected onto a screen; a virtual image (formed by diverging rays that appear to diverge from a common point) cannot.

For a **diverging lens** (or convex mirror), all three principal rays must be extrapolated backward on the opposite side of the lens (or mirror). The resulting virtual image is always upright and diminished.

---

# Chapter 4: Matrix Optics — The ABCD Method

## 4.1 Ray Vectors and Transfer Matrices

The **matrix (ABCD) method** is the systematic framework for tracing paraxial rays through any sequence of optical elements. It replaces a series of algebraic manipulations with a single matrix multiplication, making it both computationally efficient and conceptually powerful. The method forms the basis of laser beam analysis, resonator design, and system engineering.

A paraxial ray at any plane is characterised by two numbers: its height \(y\) (perpendicular distance from the optical axis) and its slope \(u = dy/dz \approx \theta\) (angle with the axis, in the paraxial approximation). We represent this as a **ray vector**:

\[
\mathbf{r} = \begin{pmatrix} y \\ u \end{pmatrix}
\]

Each optical element (free space, refracting surface, thin lens, mirror, thick lens) transforms the input ray vector to an output ray vector via a \(2\times 2\) **transfer matrix** (also called the ABCD matrix or system matrix):

\[
\begin{pmatrix} y_2 \\ u_2 \end{pmatrix} = \begin{pmatrix} A & B \\ C & D \end{pmatrix} \begin{pmatrix} y_1 \\ u_1 \end{pmatrix}
\]

## 4.2 Elementary Transfer Matrices

**Free propagation** through a distance \(d\) in a medium of refractive index \(n\) (or in air, \(n = 1\)):

A ray of slope \(u\) travels a distance \(d\), increasing its height by \(y_2 = y_1 + d\cdot u_1\). The slope is unchanged. Therefore:

\[
M_\text{prop} = \begin{pmatrix} 1 & d \\ 0 & 1 \end{pmatrix}
\]

**Thin lens** of focal length \(f\). A ray entering at height \(y\) is bent by angle \(-y/f\) (converging lens bends downward for rays above the axis), so \(u_2 = u_1 - y_1/f\). Height is unchanged at the lens plane:

\[
M_\text{lens} = \begin{pmatrix} 1 & 0 \\ -1/f & 1 \end{pmatrix}
\]

**Refraction at a spherical surface** of radius \(R\) separating media \(n_1\) and \(n_2\). Using the paraxial form of Snell's law, \(n_1\theta_1 = n_2\theta_2\) at the surface, with the surface sag giving an angle increment:

\[
M_\text{refr} = \begin{pmatrix} 1 & 0 \\ -(n_2-n_1)/(n_2 R) & n_1/n_2 \end{pmatrix}
\]

(In reduced-angle notation where the vector component is \(nu\) instead of \(u\), the matrices take a slightly different form, but the physics is the same.)

**Mirror** of radius \(R\) (focal length \(f = R/2\)):

\[
M_\text{mirror} = \begin{pmatrix} 1 & 0 \\ -2/R & 1 \end{pmatrix} = \begin{pmatrix} 1 & 0 \\ -1/f & 1 \end{pmatrix}
\]

## 4.3 System Matrix and Cardinal Points

For a system consisting of sequential elements, the overall transfer matrix is the product of the individual matrices in reverse order (because matrix multiplication is applied right-to-left):

\[
M_\text{sys} = M_N \cdots M_2 M_1
\]

The elements of \(M_\text{sys} = \begin{pmatrix} A & B \\ C & D \end{pmatrix}\) have immediate physical interpretations:
- If \(B = 0\): any ray from a given object plane converges to a single image plane (imaging condition — the system forms a sharp image).
- \(D = 0\): all output rays are parallel (input ray from the front focal plane).
- \(A = 0\): all input rays emerge at the same height (telescope condition, afocal system).
- The effective focal length of the system is \(f_\text{eff} = -1/C\).

The **cardinal points** of an optical system — front and rear **principal planes** \(H\) and \(H'\), and front and rear **focal points** \(F\) and \(F'\) — are defined in terms of the system matrix elements. The power of the matrix method is that any complex multi-element system can be reduced to an equivalent thin lens located at the principal planes, enabling simple image-location calculations.

<div class="example">
<strong>Example 4.1: Two-Lens System.</strong> Two thin lenses of focal lengths \(f_1 = 100\) mm and \(f_2 = 50\) mm are separated by \(d = 60\) mm. Find the system focal length and the location of the rear focal point.

\[
M_\text{sys} = M_2 M_\text{prop} M_1 = \begin{pmatrix}1&0\\-1/50&1\end{pmatrix}\begin{pmatrix}1&60\\0&1\end{pmatrix}\begin{pmatrix}1&0\\-1/100&1\end{pmatrix}
\]

First, \(M_\text{prop} M_1\):

\[
\begin{pmatrix}1&60\\0&1\end{pmatrix}\begin{pmatrix}1&0\\-1/100&1\end{pmatrix} = \begin{pmatrix}1-60/100 & 60\\-1/100 & 1\end{pmatrix} = \begin{pmatrix}0.4 & 60\\-0.01 & 1\end{pmatrix}
\]

Then multiply by \(M_2\):

\[
\begin{pmatrix}1&0\\-0.02&1\end{pmatrix}\begin{pmatrix}0.4&60\\-0.01&1\end{pmatrix} = \begin{pmatrix}0.4 & 60\\-0.02\times0.4-0.01 & -0.02\times60+1\end{pmatrix} = \begin{pmatrix}0.4 & 60\\-0.018 & -0.2\end{pmatrix}
\]

System focal length: \(f_\text{eff} = -1/C = -1/(-0.018) \approx 55.6\) mm. The rear focal distance (from the second lens) is found from \(f_\text{eff}(1-D)/1 = 55.6 \times (1-(-0.2)) = 66.7\) mm from the second lens.
</div>

---

# Chapter 5: Optical Instruments

## 5.1 The Human Eye

The human eye is a remarkable optical instrument that uses a variable-focus lens (the crystalline lens) to accommodate focus from infinity to a near point of about 25 cm (for a young adult). The total optical power is about 60 D, of which about 40 D comes from the air-cornea interface and 20 D from the crystalline lens (which can change shape to add up to 10–12 D of accommodation through the action of the ciliary muscles).

Image formation on the retina is governed by the thin-lens equation. The retina is approximately 17 mm from the lens, so the eye is focused at infinity when \(f = s_i = 17\) mm. For a near object at 25 cm, the image distance must still be 17 mm, requiring a shorter focal length (higher power lens) — this is achieved by accommodation.

Common refractive errors: **myopia** (nearsightedness) — the eye is too long or the lens too powerful, causing distant objects to focus in front of the retina. Corrected with a diverging lens of power \(P = -1/f_\text{far}\), where \(f_\text{far}\) is the far point distance. **Hyperopia** (farsightedness) — the eye is too short, causing even distant objects to focus behind the retina. Corrected with a converging lens.

## 5.2 Simple Magnifier, Microscope, and Telescope

The **angular magnification** \(M_\theta\) of an optical instrument is the ratio of the angular size of the image as seen through the instrument to the angular size of the object as seen with the naked eye at the standard near-point distance \(d = 25\) cm.

**Simple magnifier**: a single converging lens of focal length \(f\) used to view an object placed inside the focal length. The virtual image is at the near point or at infinity. Maximum angular magnification (image at near point): \(M_\theta = 1 + d/f\). Standard magnification (image at infinity, most comfortable for extended viewing): \(M_\theta = d/f\).

**Compound microscope**: two converging lenses — an **objective** of short focal length \(f_o\) and an **eyepiece** of focal length \(f_e\) — separated by a tube length \(L\) (the distance between the rear focal plane of the objective and the front focal plane of the eyepiece). The objective forms a magnified, real, inverted image of the specimen; the eyepiece then acts as a magnifier for this intermediate image:

\[
M_\text{scope} = -\frac{L}{f_o}\cdot\frac{d}{f_e}
\]

The negative sign indicates the final image is inverted. Modern microscope objectives are characterised by their **numerical aperture** \(\text{NA} = n\sin\alpha\) (where \(\alpha\) is the half-angle of the light cone entering the objective and \(n\) is the refractive index of the immersion medium). The resolution limit (Rayleigh criterion) for a microscope is approximately:

\[
r_\text{min} = \frac{0.61\lambda}{\text{NA}}
\]

**Refracting telescope** (two converging lenses, objective of long focal length \(f_o\), eyepiece of short focal length \(f_e\)):

\[
M_\theta = -\frac{f_o}{f_e}
\]

The negative sign means the image is inverted (acceptable for astronomical viewing, corrected with a field-reversing prism or lens for terrestrial use). The tube length of an afocal (adjusted for parallel input and output rays) telescope is \(f_o + f_e\).

## 5.3 Aberrations

Real optical systems deviate from paraxial ideal behaviour — these deviations are **aberrations**. They fall into two broad categories.

**Chromatic aberrations** arise from dispersion: the focal length of a lens depends on wavelength. **Longitudinal chromatic aberration** — different colours focus at different distances along the axis — is characterised by the separation \(\Delta f = f/(n_1 - n_2) \cdot (n_F - n_C)/(n - 1) \approx f/V\), where \(V\) is the Abbe number. An **achromatic doublet** — a converging crown glass lens and a diverging flint glass lens — is designed so that the chromatic aberration of one cancels the other. The condition for zero longitudinal chromatic aberration is \(P_1/V_1 + P_2/V_2 = 0\), where \(P_i\) are the powers. Since \(V_\text{crown} > V_\text{flint}\), the crown lens must be converging and the flint lens diverging. The combined power \(P = P_1 + P_2 = P_1(1 - V_1/V_2)\) can still be positive.

**Monochromatic aberrations** — the five **Seidel aberrations** — are deviations from the paraxial ideal at a single wavelength:

1. **Spherical aberration**: rays far from the axis focus at a different point than paraxial rays. All simple lenses and mirrors suffer from this. Parabolic mirrors have no spherical aberration for on-axis objects (this is why telescope mirrors are parabolic). Aspheric lens surfaces can correct it.

2. **Coma**: off-axis point sources form comet-shaped (hence the name) rather than point images. It is the most objectionable aberration in a well-corrected telescope because it asymmetrically distorts star images.

3. **Astigmatism**: a point source off-axis forms two separated line foci at different distances along the axis. A system with astigmatism cannot simultaneously focus radial and tangential ray fans from an off-axis object.

4. **Field curvature** (Petzval curvature): the focal surface is curved rather than flat. A flat detector (photographic plate, CCD) cannot be in focus across the entire field simultaneously.

5. **Distortion**: the image magnification varies with field angle, causing straight lines to appear curved (barrel distortion if magnification decreases with angle, pincushion if it increases).

---

# Chapter 6: The Physical Nature of Light — Electromagnetic Waves

## 6.1 Maxwell's Equations and the Wave Equation

Light is an electromagnetic wave — an oscillating electric and magnetic field propagating through space. This identification, made by Maxwell in 1865, was one of the greatest unifications in physics. The four Maxwell equations in a linear, isotropic, homogeneous medium are:

\[
\boldsymbol{\nabla}\cdot\mathbf{E} = \frac{\rho_\text{free}}{\varepsilon} \qquad \boldsymbol{\nabla}\cdot\mathbf{B} = 0
\]

\[
\boldsymbol{\nabla}\times\mathbf{E} = -\frac{\partial\mathbf{B}}{\partial t} \qquad \boldsymbol{\nabla}\times\mathbf{B} = \mu\mathbf{J}_\text{free} + \mu\varepsilon\frac{\partial\mathbf{E}}{\partial t}
\]

In a source-free medium (\(\rho = 0\), \(\mathbf{J} = 0\)), taking the curl of Faraday's law and substituting Ampere-Maxwell law:

\[
\boldsymbol{\nabla}\times(\boldsymbol{\nabla}\times\mathbf{E}) = -\boldsymbol{\nabla}\times\frac{\partial\mathbf{B}}{\partial t} = -\mu\varepsilon\frac{\partial^2\mathbf{E}}{\partial t^2}
\]

Using the vector identity \(\boldsymbol{\nabla}\times(\boldsymbol{\nabla}\times\mathbf{E}) = \boldsymbol{\nabla}(\boldsymbol{\nabla}\cdot\mathbf{E}) - \nabla^2\mathbf{E} = -\nabla^2\mathbf{E}\) (since \(\boldsymbol{\nabla}\cdot\mathbf{E} = 0\) in source-free region):

\[
\nabla^2\mathbf{E} = \mu\varepsilon\frac{\partial^2\mathbf{E}}{\partial t^2}
\]

This is the vector wave equation with wave speed \(v = 1/\sqrt{\mu\varepsilon}\). In vacuum, \(v = 1/\sqrt{\mu_0\varepsilon_0} = c = 3\times10^8\) m/s. In a medium, \(v = c/n\) where \(n = \sqrt{\mu_r\varepsilon_r}\) — the refractive index.

## 6.2 Plane Waves and the Intensity of Light

A plane wave solution of the wave equation is:

\[
\mathbf{E} = \mathbf{E}_0\cos(\mathbf{k}\cdot\mathbf{r} - \omega t + \phi)
\]

where \(\mathbf{k}\) is the **wave vector** with magnitude \(k = 2\pi n/\lambda_0\) (the vacuum wavelength \(\lambda_0\) relates to the medium wavelength by \(\lambda = \lambda_0/n\)). The magnetic field is perpendicular to both \(\mathbf{E}\) and \(\mathbf{k}\): \(\mathbf{B} = (\mathbf{k}/\omega)\times\mathbf{E}\).

The electromagnetic energy flux is given by the **Poynting vector**: \(\mathbf{S} = \mathbf{E}\times\mathbf{H}/\mu\). For a plane wave, the time-averaged intensity (power per unit area) is:

\[
I = \langle|\mathbf{S}|\rangle = \frac{1}{2}\varepsilon v E_0^2 = \frac{n}{2\mu_0 c} E_0^2 \propto n|E_0|^2
\]

In optics, we typically absorb the proportionality constant and write \(I \propto |E_0|^2\). Since interference involves adding amplitudes and then squaring, it is the electric field amplitude that adds (not the intensity), and \(I = |\mathcal{E}|^2\) where \(\mathcal{E}\) is the complex amplitude.

## 6.3 Fresnel Equations — Reflection and Transmission at Interfaces

The **Fresnel equations** give the amplitudes of reflected and transmitted electric fields at a planar interface between media \(n_1\) and \(n_2\). They are derived by applying the electromagnetic **boundary conditions** — continuity of the tangential components of \(\mathbf{E}\) and \(\mathbf{H}\) across the interface.

We decompose the incident field into two polarisation components: **s-polarisation** (TE: electric field perpendicular to the plane of incidence, parallel to the surface) and **p-polarisation** (TM: electric field in the plane of incidence).

**For s-polarisation** (the electric field is parallel to the interface for all rays), continuity of \(E_t\) at the surface gives \(E_i + E_r = E_t\), and continuity of \(H_t = (n/\mu_0 c)\cos\theta \cdot E\) gives \(n_1\cos\theta_i(E_i - E_r) = n_2\cos\theta_t\,E_t\). Solving:

\[
r_s = \frac{n_1\cos\theta_i - n_2\cos\theta_t}{n_1\cos\theta_i + n_2\cos\theta_t}
\]

\[
t_s = \frac{2n_1\cos\theta_i}{n_1\cos\theta_i + n_2\cos\theta_t}
\]

**For p-polarisation** (the electric field lies in the plane of incidence), the boundary conditions give:

\[
r_p = \frac{n_2\cos\theta_i - n_1\cos\theta_t}{n_2\cos\theta_i + n_1\cos\theta_t}
\]

\[
t_p = \frac{2n_1\cos\theta_i}{n_2\cos\theta_i + n_1\cos\theta_t}
\]

The **reflectance** and **transmittance** (power ratios, accounting for the different beam areas and impedances) are:

\[
R_s = |r_s|^2, \quad R_p = |r_p|^2
\]

\[
T_s = \frac{n_2\cos\theta_t}{n_1\cos\theta_i}|t_s|^2, \quad T_p = \frac{n_2\cos\theta_t}{n_1\cos\theta_i}|t_p|^2
\]

and energy conservation requires \(R + T = 1\) for each polarisation.

**Brewster's angle** is the incidence angle at which \(r_p = 0\) — the reflected light is purely s-polarised. Setting the numerator of \(r_p\) to zero: \(n_2\cos\theta_B = n_1\cos\theta_t\). Combined with Snell's law, this gives \(\theta_B + \theta_t = 90°\), and thus:

\[
\tan\theta_B = \frac{n_2}{n_1}
\]

At Brewster's angle, the reflected beam and the refracted beam are perpendicular. This has a physical interpretation: the dipoles induced in the second medium by the transmitted beam oscillate along the direction that the reflected beam would travel — they cannot radiate in their own oscillation direction, so the p-component of reflected light vanishes. Polaroid sunglasses exploit Brewster's angle: they block the horizontally polarised light preferentially reflected from roads and water surfaces.

---

# Chapter 7: Interference

## 7.1 The Superposition Principle and Interference

When two or more waves overlap in space, the resulting disturbance is the **superposition** (sum) of the individual waves. For light waves from the same monochromatic source, this superposition can produce a static intensity pattern — **interference** — that reveals information about the optical path differences between the waves. The key condition for observable interference is **coherence**: the interfering waves must maintain a definite phase relationship.

Consider two monochromatic waves at the same point in space:

\[
E_1 = E_{01}\cos(\omega t + \phi_1), \qquad E_2 = E_{02}\cos(\omega t + \phi_2)
\]

The total intensity is proportional to \(\langle(E_1 + E_2)^2\rangle = \langle E_1^2 \rangle + \langle E_2^2 \rangle + 2\langle E_1 E_2 \rangle\):

\[
I = I_1 + I_2 + 2\sqrt{I_1 I_2}\cos(\Delta\phi)
\]

where \(\Delta\phi = \phi_2 - \phi_1\) is the phase difference. The **interference term** \(2\sqrt{I_1 I_2}\cos(\Delta\phi)\) oscillates between \(+2\sqrt{I_1 I_2}\) (constructive, \(\Delta\phi = 2m\pi\)) and \(-2\sqrt{I_1 I_2}\) (destructive, \(\Delta\phi = (2m+1)\pi\)). For equal intensities \(I_1 = I_2 = I_0\): \(I = 2I_0(1 + \cos\Delta\phi) = 4I_0\cos^2(\Delta\phi/2)\).

The phase difference arises from an **optical path difference** (OPD): if two beams travel path lengths \(L_1\) and \(L_2\) in media of refractive indices \(n_1\) and \(n_2\), the OPD is \(n_1L_1 - n_2L_2\) and the phase difference is \(\Delta\phi = (2\pi/\lambda)\times\text{OPD}\).

## 7.2 Young's Double-Slit Experiment

In **Young's experiment** (1801), a coherent light source illuminates two narrow parallel slits separated by distance \(d\). The two slits act as secondary sources (by Huygens' principle), emitting coherent spherical waves that interfere on a screen at distance \(L\) from the slits.

At a point \(P\) on the screen at height \(y\) from the axis, the path difference from the two slits is \(\Delta = d\sin\theta \approx dy/L\) for small angles. Bright fringes (constructive interference) occur when \(\Delta = m\lambda\):

\[
y_m = \frac{m\lambda L}{d}, \qquad m = 0, \pm 1, \pm 2, \ldots
\]

The fringe spacing is \(\Delta y = \lambda L/d\). Dark fringes (destructive) occur at \(y_{m+1/2} = (m + 1/2)\lambda L/d\). The **visibility** (contrast) of the fringes is:

\[
V = \frac{I_\text{max} - I_\text{min}}{I_\text{max} + I_\text{min}} = \frac{2\sqrt{I_1 I_2}}{I_1 + I_2} \leq 1
\]

\(V = 1\) for perfectly coherent beams of equal intensity. Reduced visibility indicates partial coherence or unequal intensities.

## 7.3 Thin Film Interference

Light reflected from the two surfaces of a thin film (like a soap bubble or an oil slick on water) can interfere. The film of thickness \(t\) and refractive index \(n\) introduces an OPD of approximately \(2nt\cos\theta_t\) between the two reflected beams. Additionally, a phase shift of \(\pi\) (equivalent to half a wavelength) occurs upon reflection at an interface where the light goes from lower to higher refractive index.

For a film in air (reflection at both surfaces): reflection from the top surface (air-to-film) gives a \(\pi\) phase shift; reflection from the bottom surface (film-to-air) gives no phase shift. The net phase difference is:

\[
\Delta\phi = \frac{4\pi nt\cos\theta_t}{\lambda} + \pi
\]

**Bright fringes** (constructive): \(\Delta\phi = 2m\pi\), giving \(2nt\cos\theta_t = (m - 1/2)\lambda\). **Dark fringes**: \(2nt\cos\theta_t = m\lambda\). At near-normal incidence (\(\theta_t \approx 0\)), a soap film of water (\(n = 1.33\)) appears dark for very small thickness (\(t \to 0\)) because the extra \(\pi\) phase shift ensures destructive interference — the "black" regions seen at the top of a vertical soap film just before it pops.

**Anti-reflection coatings** exploit thin-film interference: a coating of refractive index \(n_c = \sqrt{n_\text{glass}}\) and thickness \(t = \lambda/(4n_c)\) (a quarter-wave layer) produces two reflections of equal amplitude with a \(\pi\) phase difference, resulting in complete cancellation of reflection at the design wavelength. Camera lens coatings reduce reflection from \(\sim 4\%\) per surface (uncoated glass-air) to less than 0.1%.

---

# Chapter 8: Diffraction

## 8.1 Huygens-Fresnel Principle

**Diffraction** is the bending and spreading of waves around obstacles and through apertures. It occurs whenever wavefronts are obstructed, and it is the ultimate limit on the resolution of any optical instrument. Geometrical optics ignores diffraction; wave optics must account for it.

The theoretical foundation is the **Huygens-Fresnel principle**: every point on a wavefront acts as a source of secondary spherical wavelets; the field at any later point is the superposition of all these secondary wavelets, with appropriate amplitude and phase. Kirchhoff's diffraction theory provides a rigorous mathematical formulation:

\[
U(P) = -\frac{i}{\lambda}\iint_\Sigma U_0(Q)\,\frac{e^{ikr}}{r}\,K(\chi)\, dS
\]

where the integral is over the open aperture \(\Sigma\), \(r\) is the distance from aperture point \(Q\) to observation point \(P\), and \(K(\chi)\) is an obliquity factor that accounts for the directionality of secondary emission.

## 8.2 Fraunhofer Diffraction from a Single Slit

**Fraunhofer diffraction** (far-field diffraction) applies when the observation screen is far enough from the aperture that the wavefronts arriving at the screen are essentially planar. The mathematical condition is \(L \gg a^2/\lambda\) where \(a\) is the aperture size.

For a single slit of width \(a\) illuminated by a normally incident plane wave, the diffracted amplitude at angle \(\theta\) is:

\[
E(\theta) = E_0 a\, \text{sinc}(\beta), \qquad \beta = \frac{\pi a\sin\theta}{\lambda}
\]

where \(\text{sinc}(x) = \sin(x)/x\). The intensity pattern is:

\[
I(\theta) = I_0\,\text{sinc}^2\!\left(\frac{\pi a\sin\theta}{\lambda}\right)
\]

The central maximum has width (between first zeros) \(\Delta\theta = 2\lambda/a\) — wider slits give narrower diffraction patterns, and vice versa. The zeros occur at \(a\sin\theta = m\lambda\) for \(m = \pm 1, \pm 2, \ldots\) The secondary maxima have intensities \(I_0/(9\pi^2/4) \approx 0.045 I_0\) (about 4.5% of the central maximum).

## 8.3 The Rayleigh Criterion for Resolution

The **Rayleigh criterion** defines the minimum resolvable angular separation of two point sources. Two incoherent point sources are just resolved when the central maximum of one coincides with the first zero of the other. For a circular aperture of diameter \(D\):

\[
\theta_\text{min} = 1.22\frac{\lambda}{D}
\]

(The factor 1.22 comes from the first zero of the Bessel function \(J_1\), which arises for a circular rather than rectangular aperture.) For a human eye with pupil diameter \(D \approx 3\) mm in daylight and \(\lambda = 550\) nm:

\[
\theta_\text{min} = 1.22\times\frac{550\times10^{-9}}{3\times10^{-3}} = 2.2\times10^{-4} \text{ rad} \approx 0.76'
\]

This corresponds to a spatial resolution of 0.08 mm at a distance of 25 cm — remarkably close to the measured human visual acuity of about 1 arcminute. For the Hubble Space Telescope (\(D = 2.4\) m, \(\lambda = 500\) nm): \(\theta_\text{min} = 0.05''\) — it can resolve features separated by 0.02 pc at the distance of the Galactic Centre.

## 8.4 Diffraction Gratings

A **diffraction grating** is an optical element with a large number \(N\) of equally spaced slits (or ruled grooves) of spacing \(d\). It is the principal tool for spectroscopy. The condition for **principal maxima** (constructive interference from all \(N\) slits simultaneously) is the **grating equation**:

\[
d\sin\theta_m = m\lambda, \qquad m = 0, \pm 1, \pm 2, \ldots
\]

where \(m\) is the **diffraction order**. The grating separates different wavelengths because different wavelengths satisfy the grating equation at different angles. The **angular dispersion** is:

\[
\frac{d\theta}{d\lambda} = \frac{m}{d\cos\theta}
\]

Higher orders and smaller slit spacings give larger angular dispersion.

The **resolving power** of a diffraction grating — its ability to separate two closely spaced wavelengths \(\lambda\) and \(\lambda + \delta\lambda\) — is:

\[
\mathcal{R} = \frac{\lambda}{\delta\lambda} = mN
\]

<div class="proof">
<strong>Derivation of Resolving Power.</strong> The intensity pattern from \(N\) equally spaced slits of spacing \(d\) at angle \(\theta\) near the \(m\)th-order principal maximum is:

\[
I(\theta) \propto \left(\frac{\sin(N\phi/2)}{\sin(\phi/2)}\right)^2, \qquad \phi = \frac{2\pi d\sin\theta}{\lambda}
\]

At the principal maximum, \(\phi = 2m\pi\). The first zero adjacent to the maximum occurs when \(N\phi/2 = (Nm+1)\pi\), i.e., when \(\phi = 2m\pi + 2\pi/N\), i.e., when \(d\sin\theta = m\lambda + \lambda/N\).

By the Rayleigh criterion, two wavelengths \(\lambda\) and \(\lambda + \delta\lambda\) are just resolved when the maximum of the \(\lambda+\delta\lambda\) pattern falls on the first zero of the \(\lambda\) pattern. The maximum of \(\lambda+\delta\lambda\) occurs at \(d\sin\theta = m(\lambda+\delta\lambda)\). Setting this equal to \(m\lambda + \lambda/N\):

\[
m(\lambda+\delta\lambda) = m\lambda + \frac{\lambda}{N} \implies m\,\delta\lambda = \frac{\lambda}{N} \implies \frac{\lambda}{\delta\lambda} = mN
\]
</div>

A grating with \(N = 50{,}000\) rulings used in first order has resolving power \(\mathcal{R} = 50{,}000\), sufficient to resolve the sodium D doublet at 589.0/589.6 nm (\(\delta\lambda = 0.6\) nm requires \(\mathcal{R} \approx 1000\)).

---

# Chapter 9: Polarization

## 9.1 Polarization States of Light

Electromagnetic waves are transverse — the electric field oscillates perpendicular to the propagation direction \(\hat{k}\). Since there are two independent perpendicular directions, light has two independent polarisation states. Any polarisation state is a superposition of these two basis states.

**Linear polarisation**: the electric field oscillates along a fixed direction in the plane perpendicular to propagation. For a wave propagating in the \(z\)-direction:

\[
\mathbf{E} = E_x\cos(kz - \omega t)\hat{x} + E_y\cos(kz - \omega t + \delta)\hat{y}
\]

For \(\delta = 0\) or \(\pi\): linear polarisation at angle \(\arctan(E_y/E_x)\) to the \(x\)-axis.

**Circular polarisation**: \(E_x = E_y = E_0\) and \(\delta = \pm\pi/2\). The electric field vector rotates in a circle as the wave propagates. **Right circular polarisation** (\(\delta = +\pi/2\)): the field rotates counterclockwise when viewed by an observer facing the source. **Left circular polarisation** (\(\delta = -\pi/2\)): clockwise.

**Elliptical polarisation**: the general case — the tip of the electric field vector traces an ellipse. The axial ratio and orientation of the ellipse are determined by \(E_x\), \(E_y\), and \(\delta\).

**Natural (unpolarised) light**: light from thermal sources (the Sun, a light bulb, a candle) has \(\delta\) fluctuating randomly with a correlation time comparable to the coherence time (\(\tau_c \sim 1/\Delta\nu\), where \(\Delta\nu\) is the source bandwidth). On timescales long compared to \(\tau_c\), all polarisation directions are equally represented and the light appears unpolarised.

## 9.2 Polarizers and Malus's Law

A **linear polarizer** transmits only the component of the electric field along its transmission axis. For incident light with electric field amplitude \(E_0\) at angle \(\theta\) to the transmission axis, the transmitted amplitude is \(E_0\cos\theta\) and the transmitted intensity is:

\[
I = I_0\cos^2\theta
\]

This is **Malus's Law** (1809). For unpolarised light with intensity \(I_0\), after passing through a polarizer, \(I = I_0/2\) (since \(\langle\cos^2\theta\rangle = 1/2\) averaged over all orientations).

Two polarizers with transmission axes at angle \(\theta\) to each other: the first polarizer transmits intensity \(I_0/2\); the second (analyser) further reduces this by \(\cos^2\theta\), giving \(I = (I_0/2)\cos^2\theta\). For crossed polarizers (\(\theta = 90°\)): \(I = 0\) — no light passes.

## 9.3 Birefringence and Wave Plates

**Birefringent** materials have different refractive indices for different polarisation directions — a consequence of anisotropy in the crystal structure. An optical wave plate is a birefringent crystal cut so that one polarisation (along the **fast axis** with lower \(n\)) travels faster than the other (along the **slow axis** with higher \(n\)). After propagating through a plate of thickness \(d\), the two components acquire a relative phase difference:

\[
\Gamma = \frac{2\pi d}{\lambda}(n_\text{slow} - n_\text{fast}) = \frac{2\pi d\,\Delta n}{\lambda}
\]

A **quarter-wave plate** introduces \(\Gamma = \pi/2\): it converts linearly polarised light at 45° to either axis into circularly polarised light, and vice versa. A **half-wave plate** introduces \(\Gamma = \pi\): it rotates the polarisation direction of linearly polarised light by twice the angle between the input polarisation and the fast axis. These wave plates are used to manipulate polarisation states in optical experiments and in display technologies (LCD screens rely on twisted nematic liquid crystals as electrically controllable wave plates).

## 9.4 Wave-Particle Duality and the Photon

The quantum of light is the **photon**, with energy \(E = hf = \hbar\omega\) and momentum \(p = h/\lambda = \hbar k\). The wave-particle duality of light means that diffraction and interference patterns are built up from individual photon detections, each arriving at a random position governed by the quantum probability amplitude — which is the square of the classical wave amplitude. In Young's experiment with a very weak source, individual photons arrive one at a time, and over many detections the familiar fringe pattern emerges — each photon "interferes with itself" in the sense that its probability distribution reflects the wave nature of the light.

The **photoelectric effect** — the ejection of electrons from a metal surface by light above a threshold frequency — was the first definitive evidence that light is quantized. Einstein's 1905 explanation (which won him the Nobel Prize) requires that photons have energy \(E = hf\), so that only photons above the threshold frequency \(f > \phi/h\) (where \(\phi\) is the work function of the metal) have enough energy to eject electrons. The maximum kinetic energy of the ejected electrons is \(K_\text{max} = hf - \phi\), independent of the light intensity. This linear relationship between \(K_\text{max}\) and \(f\) is one of the cleanest verifications of the quantum nature of light.

---

# Chapter 10: Fermat's Principle — A Deeper Treatment

## 10.1 Historical Background and Physical Meaning

The history of optics is, in many ways, a dialogue between two great ideas: light as a particle (corpuscle) and light as a wave. Newton championed the corpuscular view in his 1704 *Opticks*, arguing that light consisted of fast-moving particles whose interactions with surfaces obeyed mechanical laws. His authority was so great that the corpuscular theory dominated for over a century, even in the face of difficulties explaining Newton's own rings (a striking interference phenomenon Newton himself observed but could not satisfactorily account for). Huygens, Newton's contemporary, proposed in 1690 that light was a longitudinal wave in the ether — an idea that was correct in spirit but wrong in the nature of the wave. Young's double-slit experiment (1801) and Fresnel's rigorous wave theory of diffraction (1818) decisively vindicated the wave picture in the early nineteenth century. Maxwell's identification of light as an electromagnetic wave in 1865 seemed to settle the matter — until Planck's blackbody spectrum (1900) and Einstein's photoelectric effect (1905) forced the quantum revival of the particle concept.

For geometrical optics, the dust settled long before these quantum debates. The fundamental organising principle is **Fermat's principle**, first stated in its modern form by Pierre de Fermat in 1662. Fermat was a mathematician of extraordinary ability — he is best remembered for "Fermat's Last Theorem," but his contribution to optics is equally profound. He noticed that the known laws of reflection and refraction (Snell's law had been discovered empirically by Willebrord Snellius around 1621 and independently by Descartes) could be unified by demanding that light always chooses the path of **least time** between two points. This was a startling idea: it implied that light somehow "knows" in advance which path is fastest, suggesting a kind of teleological intelligence in nature. The correct modern interpretation is variational: not that light knows where it is going, but that the wave amplitude constructively reinforces along the path of stationary phase, and destructively cancels elsewhere. Fermat's principle is thus a high-frequency limit of wave optics, valid when wavelengths are short compared to all other scales.

Formally, the optical path length along any path from \(A\) to \(B\) is \(\text{OPL} = \int_A^B n(\mathbf{r})\,ds\), where \(n(\mathbf{r})\) is the spatially varying refractive index and \(ds\) is the arc-length element. The actual path taken by light makes this integral stationary: \(\delta\,\text{OPL} = 0\). In a uniform medium this reduces to the statement that light travels in straight lines (the minimum-distance path). At an interface it gives the law of reflection and Snell's law, as derived in Chapter 1. In a continuously varying medium — such as the atmosphere, where temperature gradients cause density and hence refractive-index gradients — the light path curves; the result is mirages, looming, and other atmospheric optical phenomena.

## 10.2 Eikonal Equation

The wave-optical derivation of geometrical optics proceeds through the **eikonal equation**. Write the electric field as \(\mathbf{E} = \mathbf{E}_0(\mathbf{r})\,e^{ik_0 S(\mathbf{r})}\), where \(S(\mathbf{r})\) is the **eikonal** (phase function divided by \(k_0\)) and \(k_0 = 2\pi/\lambda_0\). Substituting into the Helmholtz equation \(\nabla^2\mathbf{E} + k_0^2 n^2\mathbf{E} = 0\) and collecting terms by order in \(1/k_0\):

\[
|\boldsymbol{\nabla}S|^2 = n^2(\mathbf{r})
\]

This is the **eikonal equation** — the fundamental equation of geometrical optics. Its solutions are surfaces of constant phase \(S = \text{const}\), which are the **wavefronts**. The rays are the orthogonal trajectories to these wavefronts — the curves along which \(d\mathbf{r}/ds = \boldsymbol{\nabla}S/n\). The eikonal equation is the Hamilton-Jacobi equation of classical mechanics with \(n(\mathbf{r})\) playing the role of the momentum magnitude. This deep analogy between ray optics and classical mechanics — exploited by Hamilton in the 1830s — led directly to the development of quantum mechanics, where the Schrödinger equation stands in the same relation to classical mechanics that the Helmholtz equation stands to the eikonal equation.

---

# Chapter 11: Sign Conventions and Image Formation — Detailed Treatment

## 11.1 The Cartesian Sign Convention

Ambiguities in sign conventions are responsible for more student errors in optics than any other single cause. We adopt the **Cartesian sign convention** throughout:

1. All distances are measured from the optical element (mirror vertex or lens centre) along the optical axis.
2. Distances in the direction of the incoming light (typically left to right) are **positive**; distances against the incoming light are **negative**.
3. Heights above the optical axis are positive; heights below are negative.
4. Radii of curvature are positive if the centre of curvature is to the right of the surface, negative if to the left.

Under this convention, the mirror equation \(1/s_o + 1/s_i = 2/R\) holds with:
- \(s_o > 0\) for a real object (light coming from the left)
- \(s_i > 0\) for a real image (formed to the left of a mirror, since reflected light goes left)
- \(R > 0\) for a concave mirror (centre of curvature to the left of the vertex)

For lenses, with light conventionally traveling left to right:
- \(s_o > 0\) for a real object (to the left of the lens)
- \(s_i > 0\) for a real image (to the right of the lens)
- \(R_1 > 0\) if the first surface's centre of curvature is to the right; \(R_2 < 0\) if the second surface's centre of curvature is to the left (for a standard biconvex lens)

## 11.2 Derivation of the Lensmaker's Equation

The lensmaker's equation is derived by applying the refraction formula at a single spherical surface twice — once at each surface of the lens — and combining results.

**Refraction at a single spherical surface** separating media of indices \(n_1\) (left) and \(n_2\) (right), with radius \(R\): using the paraxial approximation, a point object at distance \(s_o\) from the surface forms an image at distance \(s_i\) satisfying:

\[
\frac{n_1}{s_o} + \frac{n_2}{s_i} = \frac{n_2 - n_1}{R}
\]

**Derivation.** For a ray from the object at height \(h\) hitting the surface (approximately at height \(h\) from the axis for paraxial rays), the normal to the spherical surface at that point makes angle \(\alpha = h/R\) with the axis. The angle of incidence \(\theta_i \approx h/s_o + h/R\) and angle of refraction \(\theta_t \approx h/s_i - h/R\) (with appropriate signs). Applying Snell's law in paraxial form \(n_1\theta_i = n_2\theta_t\):

\[
n_1\!\left(\frac{h}{s_o} + \frac{h}{R}\right) = n_2\!\left(\frac{h}{s_i} - \frac{h}{R}\right)
\]

Dividing by \(h\): \(\frac{n_1}{s_o} + \frac{n_2}{s_i} = \frac{n_2 - n_1}{R}\). This is the single-surface refraction formula.

**For a thin lens** in medium \(n = 1\) (air) with surfaces of radii \(R_1\) and \(R_2\) and glass index \(n_g\):

First surface (air to glass, radius \(R_1\)):

\[
\frac{1}{s_o} + \frac{n_g}{s_i'} = \frac{n_g - 1}{R_1}
\]

The image from the first surface at \(s_i'\) serves as the (virtual) object for the second surface. Since the lens is thin, the object distance for the second surface is \(s_o'' = -s_i'\) (the image is on the same side as the outgoing light from the first surface). Second surface (glass to air, radius \(R_2\)):

\[
\frac{n_g}{s_o''} + \frac{1}{s_i} = \frac{1 - n_g}{R_2} = -\frac{n_g - 1}{R_2}
\]

Substituting \(s_o'' = -s_i'\) and adding the two equations (the \(n_g/s_i'\) and \(n_g/s_o''\) terms cancel):

\[
\frac{1}{s_o} + \frac{1}{s_i} = (n_g - 1)\!\left(\frac{1}{R_1} - \frac{1}{R_2}\right) \equiv \frac{1}{f}
\]

This is the **lensmaker's equation**: \(1/f = (n-1)(1/R_1 - 1/R_2)\). Setting \(s_o \to \infty\) gives \(s_i = f\), confirming that \(f\) is the back focal length for parallel incident rays.

## 11.3 Thick Lenses and Principal Planes

A **thick lens** cannot be treated as a single thin lens because the two refracting surfaces are separated by a non-negligible distance. The matrix method from Chapter 4 provides the natural framework. The system matrix for a thick lens of index \(n_g\), central thickness \(d\), and radii \(R_1\), \(R_2\) is:

\[
M_\text{thick} = M_{\text{refr},2}\, M_\text{prop}\, M_{\text{refr},1}
\]

\[
= \begin{pmatrix}1 & 0\\-(1-n_g)/R_2 & 1/n_g\end{pmatrix}\begin{pmatrix}1 & d\\0 & 1\end{pmatrix}\begin{pmatrix}1 & 0\\-(n_g-1)/R_1 & n_g\end{pmatrix}
\]

After multiplying out, one finds:

\[
M_\text{thick} = \begin{pmatrix}A & B \\ C & D\end{pmatrix}
\]

where \(C = -1/f_\text{eff}\) gives the effective focal length. The positions of the **principal planes** \(H\) and \(H'\) relative to the lens surfaces are:

\[
\delta H = \frac{1-A}{C} \quad (\text{front principal plane from front surface})
\]

\[
\delta H' = \frac{D-1}{C} \quad (\text{rear principal plane from rear surface})
\]

Once the principal planes are located, the thick lens behaves like a thin lens with focal length \(f_\text{eff}\) located at the principal planes: \(1/s_o + 1/s_i = 1/f_\text{eff}\), where \(s_o\) is measured from \(H\) and \(s_i\) from \(H'\).

---

# Chapter 12: Matrix Optics — Advanced Topics and Resonators

## 12.1 Cardinal Points from the System Matrix

The **cardinal points** of an arbitrary optical system (not just a thick lens) are completely determined by the four elements \(A, B, C, D\) of the system matrix. Recall that \(\det(M) = AD - BC = 1\) for any system of refracting elements in air (this follows from conservation of the Lagrange invariant \(n y u = \text{const}\)).

<div class="theorem">
<strong>Cardinal Points from ABCD Matrix.</strong> For a system matrix \(M = \begin{pmatrix}A & B \\ C & D\end{pmatrix}\) with input and output in air (\(n=1\)):

<em>Effective focal length:</em> \(f = -1/C\)

<em>Front focal distance</em> (from first surface to front focal point \(F\)): \(f_\text{front} = (D-1)/C\)

<em>Rear focal distance</em> (from last surface to rear focal point \(F'\)): \(f_\text{rear} = (1-A)/C\)

<em>Front principal plane</em> \(H\) is at distance \((D-1)/C\) from the first surface.

<em>Rear principal plane</em> \(H'\) is at distance \((1-A)/C\) from the last surface.

<em>Nodal points</em> coincide with the principal planes when input and output media have the same index.
</div>

These formulas allow any system — no matter how many elements, thick or thin lenses, mirrors (with appropriate unfolding), or gradient-index elements — to be replaced by an equivalent thin lens at the principal planes for image-location purposes.

## 12.2 Optical Resonator Stability

Laser resonators confine light by repeatedly bouncing it between two mirrors. The condition for a **stable resonator** — one in which a ray never escapes to infinite transverse distance regardless of the number of round trips — is derived using the ABCD matrix for a single round trip.

For a resonator of length \(L\) with mirror radii \(R_1\) and \(R_2\), define the dimensionless parameters \(g_1 = 1 - L/R_1\) and \(g_2 = 1 - L/R_2\). The round-trip matrix is a product of two mirror matrices and two free-propagation matrices. After multiplying out, the trace of the round-trip matrix is:

\[
\text{tr}(M_\text{RT}) = 2(2g_1 g_2 - 1)
\]

For a stable resonator, a paraxial ray must not diverge after many round trips. This requires that the round-trip matrix has eigenvalues on the unit circle (not diverging to infinity), which holds when:

\[
\left|\frac{\text{tr}(M_\text{RT})}{2}\right| \leq 1 \implies \left|2g_1 g_2 - 1\right| \leq 1 \implies 0 \leq g_1 g_2 \leq 1
\]

<div class="theorem">
<strong>Resonator Stability Condition:</strong>

\[
0 \leq g_1 g_2 \leq 1
\]
where \(g_i = 1 - L/R_i\). A resonator satisfying this is stable; one violating it is unstable (rays eventually walk off the mirrors).
</div>

Special cases: the **plane-plane resonator** (\(R_1 = R_2 = \infty\), \(g_1 = g_2 = 1\)) sits on the boundary of stability — geometrically stable but sensitive to misalignment. The **confocal resonator** (\(R_1 = R_2 = L\), \(g_1 = g_2 = 0\)) also sits on the boundary but is insensitive to misalignment because every ray retraces itself after two round trips. The **concentric (spherical) resonator** (\(R_1 = R_2 = L/2\), \(g_1 = g_2 = -1\)) is also at the stability boundary.

---

# Chapter 13: Apertures, Stops, and Radiometry

## 13.1 Aperture Stop and Field Stop

In any optical system, not all surfaces are equally important to controlling the light. Two types of aperture serve distinct functions:

The **aperture stop** (AS) is the physical element that limits the diameter of the axial bundle of rays passing through the system from an on-axis object point. It determines how much light reaches the detector and controls the depth of focus. For a camera, the aperture stop is typically the adjustable iris diaphragm behind the front lens elements.

The **field stop** (FS) is the element that limits the angular field of view — it determines how large an object can be imaged. For a camera, the field stop is the film frame or sensor boundary. For a telescope, it might be a diaphragm placed at the intermediate focal plane.

The images of the aperture stop formed by all lens elements preceding it (in object space) give the **entrance pupil**; those formed by all elements following it (in image space) give the **exit pupil**. The entrance pupil is what an observer looking into the front of the system sees as the apparent aperture. In a camera, the entrance pupil is visible as the bright circular disc seen through the front of the lens — it is not the iris itself but its image formed by the front elements.

## 13.2 F-number and Numerical Aperture

The **F-number** (or f-ratio) of a lens is:

\[
N = \frac{f}{D_\text{EP}}
\]

where \(f\) is the focal length and \(D_\text{EP}\) is the diameter of the entrance pupil. It is written as f/N (e.g., f/2.8, f/8, f/16). The exposure time required for a given exposure is proportional to \(N^2\) (the exposure factor quadruples when \(N\) doubles, which is why successive f-stops differ by a factor of \(\sqrt{2}\)).

The **numerical aperture** \(\text{NA} = n\sin\alpha\) is the preferred measure in microscopy, where \(\alpha\) is the half-angle of the marginal ray cone and \(n\) is the index of the medium. It is related to the F-number (for an object at infinity in air) by \(\text{NA} = 1/(2N)\). For oil-immersion microscope objectives (\(n \approx 1.515\)), NA values up to 1.4 are achievable, giving resolution \(r_\text{min} = 0.61\lambda/\text{NA} \approx 240\) nm for \(\lambda = 550\) nm.

## 13.3 Depth of Field and Depth of Focus

The **depth of focus** \(\delta z\) is the axial range over which the image can be displaced while keeping the image blurred spot below some acceptable diameter (the **circle of confusion** \(c\)). For a lens of focal length \(f\) at F-number \(N\), imaging an object at the focused distance \(s_o\):

\[
\delta z = \pm N c
\]

The **depth of field** (the corresponding range of object distances that appear sharp) is:

\[
\Delta s_o = \frac{2 N c s_o^2}{f^2 - (Nc)^2} \approx \frac{2Nc s_o^2}{f^2}
\]

for typical conditions. Wide-aperture lenses (small \(N\)) have shallow depth of field — useful for portraiture where the background should be blurred (bokeh) to separate the subject. Small apertures (large \(N\)) give extended depth of field — useful for landscape photography where sharpness from foreground to horizon is desired.

---

# Chapter 14: Coherence

## 14.1 Temporal Coherence

A truly monochromatic wave would have infinite coherence — a fixed phase relationship at all separations in time and space. Real sources emit light over a finite bandwidth \(\Delta\nu\), which limits the coherence. The **temporal coherence** of a source is characterised by the **coherence time** \(\tau_c\) and the corresponding **coherence length** \(l_c = c\tau_c\):

\[
\tau_c \sim \frac{1}{\Delta\nu}, \qquad l_c \sim \frac{\lambda^2}{\Delta\lambda}
\]

For two-beam interference to produce visible fringes, the OPD between the two beams must be much less than the coherence length. This is why white light (broad bandwidth, short coherence length \(\sim 1\,\mu\text{m}\)) produces only a few fringes near zero OPD, while a stabilised HeNe laser (\(\Delta\nu \sim 1\) kHz, \(l_c \sim 300\) km) can produce fringes at OPDs of many kilometres.

The **Wiener-Khinchin theorem** relates the power spectral density of the source to the temporal coherence function (mutual coherence function at zero spatial separation):

\[
\Gamma(\tau) = \langle E^*(t)E(t+\tau)\rangle = \int S(\nu)e^{-2\pi i\nu\tau}d\nu
\]

The degree of temporal coherence is \(\gamma(\tau) = \Gamma(\tau)/\Gamma(0)\), and the visibility of fringes in a Michelson interferometer with path-length difference \(\Delta = c\tau\) is \(V = |\gamma(\tau)|\). Scanning the Michelson mirror while recording the fringe visibility maps out \(|\gamma(\tau)|\) — equivalently (by the Wiener-Khinchin theorem) the Fourier transform of the spectral density. This is the basis of **Fourier transform spectroscopy**.

## 14.2 Spatial Coherence

**Spatial coherence** describes the correlation of the field at two different points in space at the same instant. An extended incoherent source (like the Sun) radiates many independent point sources; the spatial coherence across a transverse plane at distance \(z\) extends over a lateral distance:

\[
l_\text{spatial} \sim \frac{\lambda z}{\Delta x_\text{source}} = \lambda / \theta_\text{source}
\]

where \(\theta_\text{source}\) is the angular size of the source. This is the **van Cittert-Zernike theorem**: the spatial coherence function of an incoherent source equals (in form) the Fourier transform of the source intensity distribution.

For Young's double-slit experiment to produce fringes, the two slits must be within the spatial coherence radius. If the source subtends angle \(\theta_s\), the slit separation must satisfy \(d < \lambda/\theta_s\). This condition is how the van Cittert-Zernike theorem is exploited in stellar interferometry: by finding the maximum slit separation at which fringes just disappear, one can measure the angular diameter of a star that is far too small to resolve directly (Michelson's measurement of Betelgeuse in 1920 — the first direct measurement of a stellar diameter — used exactly this method).

---

# Chapter 15: Interferometers

## 15.1 The Michelson Interferometer

The **Michelson interferometer** divides a beam of light into two, sends each along a different arm, and recombines them to produce interference. It is the archetype of a two-beam amplitude-division interferometer.

**Setup**: A partially reflective beam splitter (50:50) divides the input beam. One beam travels to mirror M1 at distance \(d_1\); the other to mirror M2 at distance \(d_2\). After reflection, both beams return to the beam splitter and are recombined. The OPD between the two arms is \(2(d_1 - d_2)\).

**Intensity at the detector**: \(I = 2I_0(1 + \cos(4\pi(d_1-d_2)/\lambda))\). As one mirror is moved, the detected intensity oscillates — each half-wavelength of mirror movement produces one complete fringe cycle.

The Michelson interferometer has a spectacular history. In 1887, Michelson and Morley used it to search for the luminiferous ether — the hypothetical medium through which light was thought to propagate — by looking for a difference in the speed of light along the Earth's orbital velocity direction versus transverse to it. Their null result (no fringe shift as the apparatus was rotated) demolished the ether hypothesis and was one of the principal motivations for Einstein's 1905 special theory of relativity. The same fundamental instrument, scaled up by a factor of a million, formed the basis of the **LIGO** detectors that made the first direct observation of gravitational waves in 2015: LIGO has 4 km arms, measures mirror displacements of \(10^{-18}\) m (one-thousandth the diameter of a proton), and detected the gravitational wave strain from a binary black hole merger 1.3 billion light years away.

The **sensitivity** of a Michelson interferometer to mirror displacements is determined by the fringe period (\(\lambda/2\)) and the detector's ability to measure fractional fringe shifts. With phase-sensitive readout (homodyne detection), displacements of \(\lambda/1000\) are routinely achievable. Thermal noise in the mirror coatings and quantum noise of the light field (shot noise) set the ultimate limits in LIGO.

## 15.2 Fabry-Pérot Interferometer — Multiple-Beam Interference

The **Fabry-Pérot (FP) interferometer** uses two partially reflective, parallel, flat mirrors (the **etalon**) to produce interference by multiple reflections. Unlike the Michelson (two-beam), the FP involves infinitely many successive beams, each weaker than the last, and the resulting transmission function is qualitatively different — much sharper resonances.

**Derivation of the Airy function.** Let the mirrors have amplitude reflectance \(r\) and transmittance \(t\) (with \(|r|^2 + |t|^2 = 1\) for lossless mirrors), separated by distance \(d\) in a medium of index \(n\). Consider a monochromatic wave incident on the first mirror. The transmitted amplitude after the first pass is \(t^2\,E_0\). The first internally reflected round trip accumulates phase \(\delta = 4\pi n d\cos\theta/\lambda\) and amplitude factor \(r^2\) per round trip. The total transmitted field is a geometric series:

\[
E_T = t^2 E_0 \sum_{m=0}^\infty (r^2 e^{i\delta})^m = \frac{t^2 E_0}{1 - r^2 e^{i\delta}}
\]

The transmitted **intensity** (using \(T = |t|^2 = 1 - R\) where \(R = |r|^2\)):

\[
I_T = |E_T|^2 = \frac{(1-R)^2}{|1-Re^{i\delta}|^2} \cdot I_0 = \frac{(1-R)^2}{(1-R)^2 + 4R\sin^2(\delta/2)} \cdot I_0
\]

This can be written as the **Airy function**:

<div class="theorem">
<strong>Airy Function (Fabry-Pérot transmission):</strong>

\[
\mathcal{T}(\delta) = \frac{I_T}{I_0} = \frac{1}{1 + \mathcal{F}\sin^2(\delta/2)}
\]
where the <strong>coefficient of finesse</strong> is \(\mathcal{F} = 4R/(1-R)^2\).
</div>

The Airy function has transmission maxima of unity at \(\delta = 2m\pi\) (i.e., whenever \(2nd\cos\theta = m\lambda\)) and minima of \(1/(1+\mathcal{F})\) at \(\delta = (2m+1)\pi\). For high reflectivity (\(R \to 1\), \(\mathcal{F} \to \infty\)), the minima approach zero and the maxima become extremely sharp — needle-like transmission peaks separated by broad dark regions.

**Finesse.** The ratio of the free spectral range (FSR) to the full-width at half-maximum (FWHM) of each transmission peak defines the **finesse**:

\[
\mathcal{F}_\text{fin} = \frac{\text{FSR}}{\text{FWHM}} = \frac{\pi\sqrt{R}}{1-R} = \frac{\pi\sqrt{\mathcal{F}}}{2}
\]

For \(R = 0.99\) (high-quality mirrors): \(\mathcal{F}_\text{fin} = \pi\sqrt{0.99}/(0.01) \approx 312\). The FSR in frequency is \(\Delta\nu_\text{FSR} = c/(2nd\cos\theta)\). A 1 cm FP etalon has FSR \(\approx 15\) GHz; finesse 312 gives a FWHM of \(15\,\text{GHz}/312 \approx 48\) MHz — enough to resolve individual longitudinal modes of a laser.

The **resolving power** of a FP is:

\[
\mathcal{R} = \frac{\lambda}{\delta\lambda} = m\mathcal{F}_\text{fin} = \frac{2nd\cos\theta}{\lambda}\cdot\frac{\pi\sqrt{R}}{1-R}
\]

For \(d = 1\) cm, \(\lambda = 600\) nm, \(R = 0.99\): \(\mathcal{R} \approx (2\times10^{-2}/6\times10^{-7})\times312 \approx 10^7\) — far exceeding any diffraction grating at comparable size. This is why FP etalons are used in atomic and molecular spectroscopy, and why Fabry-Pérot cavities are the building blocks of lasers.

---

# Chapter 16: Diffraction — Extended Treatment

## 16.1 Fresnel Zones and Qualitative Understanding

Before treating Fraunhofer diffraction mathematically, it is worth understanding qualitatively how diffraction arises from the Huygens-Fresnel principle. Divide the wavefront at an aperture into concentric **Fresnel zones** — annular rings such that the path length from adjacent zone boundaries to the observation point differs by \(\lambda/2\). Zone 1 is the innermost disc, zone 2 the next ring, and so on.

The amplitude from each zone has roughly equal magnitude (areas increase approximately linearly, but the obliquity factor and \(1/r\) factor both decrease, nearly compensating). The phase alternates: odd zones contribute positively and even zones contribute negatively. For an unobstructed wavefront, all zones are present and the total amplitude is half the amplitude from zone 1 alone — the famous result that the amplitude at a point is half what the nearest zone alone would produce if all others were blocked. When an opaque obstacle blocks some zones, or an aperture admits only some zones, the redistribution of amplitude creates the diffraction pattern.

A **zone plate** is a holographic optical element that blocks alternate Fresnel zones. With even zones blocked, the contributions from all odd zones add constructively, producing an intensity at the focus equal to the square of the sum — dramatically higher than for an unobstructed wavefront. Zone plates thus act as diffractive lenses with focal length \(f = r_1^2/\lambda\), where \(r_1\) is the radius of the first zone. They are used in X-ray microscopy where conventional refractive lenses are impractical (\(n \approx 1\) for all materials at X-ray wavelengths).

## 16.2 Derivation of Single-Slit Diffraction Pattern

Consider a single slit of width \(a\) centred on the optical axis, illuminated by a monochromatic plane wave of wavelength \(\lambda\) at normal incidence. We want the amplitude at angle \(\theta\) on a distant screen. By the Huygens-Fresnel principle, each element \(dx'\) of the slit at position \(x'\) contributes a secondary wavelet of amplitude proportional to \(dx'\) and with phase \(k x'\sin\theta\) (the path difference relative to the slit centre is \(x'\sin\theta\)):

\[
E(\theta) = E_0 \int_{-a/2}^{a/2} e^{ikx'\sin\theta}\,dx' = E_0 a\,\frac{\sin(\pi a\sin\theta/\lambda)}{\pi a\sin\theta/\lambda} = E_0 a\,\text{sinc}\!\left(\frac{a\sin\theta}{\lambda}\right)
\]

The intensity is:

\[
I(\theta) = I_0\,\text{sinc}^2\!\left(\frac{a\sin\theta}{\lambda}\right), \qquad \text{where sinc}(x) = \frac{\sin(\pi x)}{\pi x}
\]

**Zeros** of the pattern: \(\text{sinc}(a\sin\theta/\lambda) = 0\) when \(a\sin\theta/\lambda = \pm 1, \pm 2, \ldots\), i.e., \(a\sin\theta_m = m\lambda\), \(m = \pm 1, \pm 2, \ldots\)

**Width of central maximum**: The first zeros occur at \(\sin\theta = \pm\lambda/a\). For a narrow slit (\(a \ll \lambda\)): \(\theta \approx \pm\lambda/a\) radians — the central maximum spreads to nearly \(\pm 90°\). For a wide slit (\(a \gg \lambda\)): the central maximum is very narrow, approaching the geometrical shadow. This reciprocal relationship between slit width and diffraction angle width is the hallmark of Fourier transform pairs — the diffraction pattern is the Fourier transform of the aperture function.

**Secondary maxima** occur approximately at \(a\sin\theta/\lambda = \pm 3/2, \pm 5/2, \ldots\) (actually slightly shifted from these due to the sinc function). The first secondary maximum has intensity:

\[
I_1 = I_0\,\text{sinc}^2(3/2) = I_0\left(\frac{\sin(3\pi/2)}{3\pi/2}\right)^2 = I_0\left(\frac{1}{3\pi/2}\right)^2 = \frac{4I_0}{9\pi^2} \approx 0.045 I_0
\]

Thus the first secondary maximum is only 4.5% of the central peak — much weaker, though not negligible for precision applications.

## 16.3 Double-Slit Diffraction with Finite Width

The intensity pattern for two slits of width \(a\) separated (centre to centre) by distance \(d\) is the product of the single-slit diffraction envelope and the two-slit interference fringes:

\[
I(\theta) = I_0\,\text{sinc}^2\!\left(\frac{a\sin\theta}{\lambda}\right)\cos^2\!\left(\frac{\pi d\sin\theta}{\lambda}\right)
\]

The \(\cos^2\) factor produces interference fringes of spacing \(\Delta\theta \approx \lambda/d\); the sinc\(^2\) envelope modulates their heights. A missing order occurs when an interference maximum coincides with a diffraction zero: \(d/a = m_\text{int}/m_\text{diff}\) (integer ratio). For example, if \(d = 4a\), then every 4th interference order is missing. This is a simple but powerful illustration of how aperture effects (diffraction) and array effects (interference) multiply to give the observed pattern.

## 16.4 Echelle Gratings

An **echelle grating** is a special type of diffraction grating used at high diffraction orders (\(m \gg 1\)) to achieve very high resolving power. The grooves are cut at a steep angle (the **blaze angle** \(\theta_B\)) so that the blaze condition — specular reflection from each groove face — coincides with a high diffraction order. The grating equation \(d\sin\theta = m\lambda\) at high order means the angular dispersion \(d\theta/d\lambda = m/(d\cos\theta)\) is large, and the resolving power \(\mathcal{R} = mN\) can reach \(10^5\)–\(10^6\).

Echelle gratings are typically used in cross-dispersion: a second grating or prism at right angles separates the overlapping high orders in the perpendicular direction, spreading the spectrum in two dimensions. This design is used in high-resolution astronomical spectrographs (HARPS, ESPRESSO, HIRES on Keck) that achieve radial velocity precision of 1 m/s — sufficient to detect Earth-mass planets through the Doppler shifts they induce in stellar spectra.

---

# Chapter 17: Resolution and the Limits of Imaging

## 17.1 Rayleigh Criterion — Detailed Derivation

The **Rayleigh criterion** addresses the following question: given two incoherent point sources of equal intensity, separated by an angle \(\alpha\), and imaged by a lens or aperture of diameter \(D\), what is the minimum \(\alpha\) for which they can be distinguished?

Each point source produces an **Airy disc** pattern on the image plane — the diffraction pattern of a circular aperture:

\[
I(\theta) = I_0\left[\frac{2J_1(\pi D\sin\theta/\lambda)}{\pi D\sin\theta/\lambda}\right]^2
\]

where \(J_1\) is the Bessel function of the first kind of order 1. The first zero of \(J_1(x)\) occurs at \(x \approx 1.220\pi\), so the first dark ring is at:

\[
\pi D\sin\theta_\text{min}/\lambda = 1.220\pi \implies \sin\theta_\text{min} = 1.220\frac{\lambda}{D}
\]

For small angles, \(\theta_\text{min} = 1.220\lambda/D\). Rayleigh defined two point sources as **just resolved** when the central maximum of one Airy disc falls on the first minimum of the other. For equal-intensity sources, the combined intensity at the midpoint between the two peaks is approximately 0.735 of the peak intensity — producing a barely visible saddle (dip) between the two peaks. This 73.5% intensity dip is the origin of the traditional criterion.

The Rayleigh criterion is a resolution criterion, not a fundamental limit. With careful image processing (deconvolution, CLEAN algorithm in radio astronomy, STED in fluorescence microscopy), features separated by less than the Rayleigh criterion can be resolved. The true information-theoretic limit on resolution is given by the **Fisher information** and is related to the signal-to-noise ratio of the measurement.

## 17.2 Abbe Resolution Criterion

Ernst Abbe, working for Carl Zeiss in Jena in 1873, derived a fundamentally different and more rigorous resolution criterion for **coherently illuminated objects** (as in a microscope with condenser illumination). Abbe's insight was that a periodic object (a diffraction grating) can only be resolved if at least two diffraction orders (the zeroth order and the first order, or the two first orders with dark-field illumination) are collected by the objective lens.

A grating of period \(p\) produces a first diffraction order at angle \(\sin\theta_1 = \lambda/p\). For this to enter a lens of numerical aperture NA:

\[
\sin\theta_1 = \frac{\lambda}{p} \leq \text{NA} \implies p \geq \frac{\lambda}{\text{NA}}
\]

Thus the minimum resolvable grating period (the **Abbe limit**) is:

\[
p_\text{min} = \frac{\lambda}{\text{NA}} \quad \text{(coherent, oblique illumination)}
\]

With incoherent illumination (where the condenser also contributes a cone of light of its own NA), the criterion becomes:

\[
p_\text{min} = \frac{\lambda}{\text{NA}_\text{obj} + \text{NA}_\text{cond}}
\]

For matched condenser and objective NA: \(p_\text{min} = \lambda/(2\text{NA})\). The Rayleigh and Abbe criteria agree to within a factor of order unity, but they arise from quite different reasoning — the Rayleigh criterion is about the overlap of two diffraction-limited images, while the Abbe criterion is about the spatial frequency content of the object that can pass through the optical system.

---

# Chapter 18: Fourier Optics — Introduction

## 18.1 The Lens as a Fourier Transformer

The connection between diffraction and Fourier analysis is not merely a mathematical convenience — it is a deep physical identity. The Fraunhofer diffraction pattern of any aperture is precisely the **two-dimensional Fourier transform** of the aperture's transmission function, evaluated at spatial frequencies \((f_x, f_y) = (\sin\theta_x/\lambda, \sin\theta_y/\lambda)\).

A converging lens of focal length \(f\) placed immediately after an aperture takes the Fraunhofer condition from infinity to a finite distance: in the **back focal plane** of the lens, the field distribution is the exact Fourier transform of the field in the front focal plane. This is the key theorem of Fourier optics:

<div class="theorem">
<strong>Fourier Transform Property of a Lens.</strong> If a field distribution \(U(x, y)\) exists in the front focal plane of a thin lens of focal length \(f\), then in the rear focal plane the field is:

\[
U'(x', y') = \frac{e^{i2kf}}{i\lambda f}\iint U(x,y)\,e^{-i2\pi(x\cdot x' + y\cdot y')/(\lambda f)}\,dx\,dy = \frac{e^{i2kf}}{i\lambda f}\,\tilde{U}\!\left(\frac{x'}{\lambda f},\,\frac{y'}{\lambda f}\right)
\]
where \(\tilde{U}\) is the 2D Fourier transform of \(U\), evaluated at spatial frequencies \(f_x = x'/(\lambda f)\), \(f_y = y'/(\lambda f)\).
</div>

This property is the basis of **spatial filtering**: by placing a mask in the Fourier plane (the back focal plane of the first lens), one can selectively remove or enhance specific spatial frequencies in the image. A pinhole in the Fourier plane acts as a **low-pass filter** — it removes high spatial frequencies (fine detail, noise, edges) and transmits only the slowly varying parts of the image. This is the principle of **spatial filtering** used to clean up laser beams: the laser beam, full of diffraction speckle from dust and optical imperfections, is focused through a pinhole of diameter matching the Airy disc of the focused beam; all high-spatial-frequency noise is blocked, and the beam emerging from the pinhole is an essentially ideal Gaussian beam.

## 18.2 Spatial Frequencies and the Optical Transfer Function

Every image can be decomposed into a sum of sinusoidal gratings of different spatial frequencies \(f_s = 1/p\) (cycles per unit length). The **optical transfer function** (OTF) of an imaging system characterises how faithfully each spatial frequency is transmitted from object to image. The OTF is the autocorrelation of the pupil function of the system:

\[
\text{OTF}(f_s) = \int\int P(\boldsymbol{\rho})\,P^*(\boldsymbol{\rho} - \lambda f_s z_i)\,d^2\boldsymbol{\rho}
\]

where \(P(\boldsymbol{\rho})\) is the pupil function (1 inside the aperture, 0 outside) and \(z_i\) is the image distance. The modulus of the OTF is the **modulation transfer function** (MTF), which gives the contrast reduction at each spatial frequency. For a diffraction-limited circular aperture, the MTF is:

\[
\text{MTF}(f_s) = \frac{2}{\pi}\left[\arccos\!\left(\frac{f_s}{f_c}\right) - \frac{f_s}{f_c}\sqrt{1-\left(\frac{f_s}{f_c}\right)^2}\right]
\]

for \(f_s \leq f_c\), where the **cutoff frequency** is \(f_c = D/(\lambda z_i) = 1/(\lambda N)\) (N is the F-number). Above \(f_c\), no information is transmitted — this is the diffraction limit. The MTF is unity at \(f_s = 0\) (DC, uniform fields), and falls to zero at the cutoff. Aberrations reduce the MTF at intermediate frequencies.

---

# Chapter 19: Polarization — Extended Treatment

## 19.1 Jones Calculus

The **Jones vector** representation describes the complex amplitude of a fully polarised wave:

\[
\mathbf{J} = \begin{pmatrix} E_x \\ E_y \end{pmatrix} = \begin{pmatrix} E_{0x}e^{i\phi_x} \\ E_{0y}e^{i\phi_y} \end{pmatrix}
\]

Jones vectors for common polarisation states (normalised):

| State | Jones vector |
|---|---|
| Linear, horizontal | \(\begin{pmatrix}1\\0\end{pmatrix}\) |
| Linear, vertical | \(\begin{pmatrix}0\\1\end{pmatrix}\) |
| Linear at 45° | \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\1\end{pmatrix}\) |
| Right circular | \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\-i\end{pmatrix}\) |
| Left circular | \(\frac{1}{\sqrt{2}}\begin{pmatrix}1\\i\end{pmatrix}\) |

**Jones matrices** describe the action of optical elements on the polarisation state. Multiplication of Jones vectors by Jones matrices gives the output polarisation.

| Element | Jones matrix |
|---|---|
| Horizontal polarizer | \(\begin{pmatrix}1&0\\0&0\end{pmatrix}\) |
| Vertical polarizer | \(\begin{pmatrix}0&0\\0&1\end{pmatrix}\) |
| QWP (fast axis horizontal) | \(e^{i\pi/4}\begin{pmatrix}1&0\\0&-i\end{pmatrix}\) |
| HWP (fast axis horizontal) | \(e^{i\pi/2}\begin{pmatrix}1&0\\0&-1\end{pmatrix}\) |
| General retarder (fast axis at angle \(\theta\)) | \(e^{i\Gamma/2}\begin{pmatrix}\cos^2\!\theta + e^{-i\Gamma}\sin^2\!\theta & (1-e^{-i\Gamma})\sin\theta\cos\theta \\ (1-e^{-i\Gamma})\sin\theta\cos\theta & \sin^2\!\theta + e^{-i\Gamma}\cos^2\!\theta\end{pmatrix}\) |

The Jones calculus is exact for fully polarised light. For partially polarised or unpolarised light, the **Mueller calculus** (4×4 real matrices operating on 4-element Stokes vectors) is required.

## 19.2 Stokes Parameters and the Poincaré Sphere

The **Stokes parameters** describe any polarisation state, including partially polarised and unpolarised light:

\[
S_0 = \langle|E_x|^2\rangle + \langle|E_y|^2\rangle \quad (\text{total intensity})
\]

\[
S_1 = \langle|E_x|^2\rangle - \langle|E_y|^2\rangle \quad (\text{horizontal vs. vertical})
\]

\[
S_2 = 2\text{Re}\langle E_x^* E_y\rangle \quad (\text{+45° vs. -45°})
\]

\[
S_3 = 2\text{Im}\langle E_x^* E_y\rangle \quad (\text{right vs. left circular})
\]

For fully polarised light, \(S_0^2 = S_1^2 + S_2^2 + S_3^2\). The degree of polarisation is \(\mathcal{P} = \sqrt{S_1^2+S_2^2+S_3^2}/S_0 \in [0,1]\). The **Poincaré sphere** maps each polarisation state to a point on (or inside) a unit sphere with coordinates \((S_1/S_0, S_2/S_0, S_3/S_0)\): the equator represents linear polarisation states at various angles, the poles represent right and left circular polarisation, and interior points represent partially polarised or unpolarised light.

## 19.3 Optical Activity and Applications

**Optical activity** is the rotation of the plane of linearly polarised light as it passes through certain chiral media (sugar solutions, quartz). It arises from a difference in refractive indices for right and left circular polarisation (\(n_R \neq n_L\)):

\[
\phi_\text{rotation} = \frac{\pi d (n_L - n_R)}{\lambda}
\]

where \(d\) is the path length. The specific rotation \([\alpha]\) (degrees per unit path length per unit concentration) is a characteristic of the molecule. Polarimetry — measurement of the optical rotation — is used to measure sugar concentrations in quality control, to determine the enantiomeric purity of pharmaceutical compounds, and to detect glucose in the blood.

**Liquid crystal displays (LCDs)** exploit electro-optic control of the polarisation state. A twisted nematic liquid crystal layer (thickness \(\sim 5\,\mu\)m) rotates the plane of polarisation by 90° in its natural state. Sandwiched between crossed polarisers, it transmits light (the twist rotates the polarisation to align with the second polariser's axis). Applying a voltage aligns the LC molecules, removing the twist and blocking the light. The voltage-controlled transmission creates each pixel of the display. Modern LCD-based LiDAR systems use electrically tunable liquid crystal retarders to steer laser beams without mechanical moving parts.

---

# Chapter 20: Scattering and Absorption of Light

## 20.1 Rayleigh Scattering

**Rayleigh scattering** occurs when light interacts with particles (atoms, molecules, small aerosols) much smaller than the wavelength. The induced dipole in the particle oscillates at the frequency of the incident light and re-radiates. The key result is that the scattering cross-section scales as \(\lambda^{-4}\):

\[
\sigma_\text{Rayleigh} \propto \frac{1}{\lambda^4}
\]

The physical origin is that the oscillating electric dipole radiates power proportional to the fourth power of the frequency (which is \(\propto \lambda^{-4}\)). This extremely steep wavelength dependence explains why the sky is blue: the atmosphere scatters blue light (\(\lambda \approx 450\) nm) roughly \((700/450)^4 \approx 6\) times more than red light (\(\lambda \approx 700\) nm). The sky appears blue because we are looking at scattered sunlight (short wavelengths scattered more) rather than the sun directly. The same effect makes sunsets red: at large zenith angles, the sunlight traverses a long atmospheric path and all the blue has been scattered out, leaving predominantly red.

## 20.2 Mie Scattering and Absorption

When particle sizes become comparable to or larger than the wavelength, Rayleigh's simple dipole approximation fails. **Mie scattering** (G. Mie, 1908) is the exact solution of Maxwell's equations for scattering by a dielectric sphere of arbitrary size parameter \(x = 2\pi a/\lambda\) (where \(a\) is the radius). The solution is a series of vector spherical harmonics (Mie coefficients \(a_n, b_n\)):

\[
\sigma_\text{ext} = \frac{2\pi}{k^2}\sum_{n=1}^\infty (2n+1)\,\text{Re}(a_n + b_n)
\]

For \(x \ll 1\) (small particles), Mie theory reduces to Rayleigh scattering. For \(x \gg 1\) (large particles), the extinction cross-section approaches twice the geometric cross-section (\(\sigma_\text{ext} \to 2\pi a^2\)) — the factor of 2 comes from diffraction around the sphere adding to the geometric shadow. Clouds are white because water droplets (\(a \sim 10\,\mu\text{m}\), \(x \sim 100\) at visible wavelengths) scatter all wavelengths almost equally — the Mie cross-section is nearly wavelength-independent at large \(x\).

**Absorption** is characterised by the imaginary part of the refractive index \(\tilde{n} = n + i\kappa\), where \(\kappa\) is the **extinction coefficient**. A plane wave in an absorbing medium has amplitude decaying as \(e^{-\kappa k_0 z}\), so intensity decays as \(e^{-\alpha z}\) with **absorption coefficient** \(\alpha = 4\pi\kappa/\lambda_0\). **Beer-Lambert law**: \(I = I_0 e^{-\alpha c l}\) where \(c\) is concentration and \(l\) is path length — the basis of optical absorption spectroscopy.

---

# Chapter 21: Comprehensive Problem-Solving Strategies and Summary

## 21.1 Systematic Approach to Geometrical Optics Problems

Optics problems, despite their diversity, admit a systematic solution strategy. The most important discipline is careful bookkeeping of sign conventions.

**For single-interface or thin-lens problems:**
1. Draw a labelled ray diagram — not just as a check, but as the primary guide to which distances are positive and negative.
2. Write down the relevant formula (\(1/s_o + 1/s_i = 1/f\) or the single-surface formula).
3. Apply sign conventions carefully and solve algebraically before substituting numbers.
4. Compute the lateral magnification \(m = -s_i/s_o\) and determine whether the image is real or virtual, erect or inverted.

**For multi-element systems (using matrices):**
1. Write the ray vector at the input.
2. Identify each element and write its transfer matrix.
3. Multiply matrices in order (right to left) to get the system matrix.
4. Extract the cardinal points from the matrix elements.
5. Use the thin-lens equation with the cardinal points to locate the final image.

## 21.2 Key Formulas — Quick Reference

**Snell's Law:** \(n_1\sin\theta_1 = n_2\sin\theta_2\)

**Critical angle:** \(\sin\theta_c = n_2/n_1\) (for \(n_1 > n_2\))

**Mirror equation:** \(1/s_o + 1/s_i = 2/R = 1/f\)

**Thin lens:** \(1/s_o + 1/s_i = 1/f\)

**Lensmaker's:** \(1/f = (n-1)(1/R_1 - 1/R_2)\)

**Lateral magnification:** \(m = -s_i/s_o\)

**Angular magnification (magnifier):** \(M_\theta = d/f\) (image at infinity)

**Telescope:** \(M_\theta = -f_o/f_e\)

**Microscope:** \(M = -Ld/(f_o f_e)\)

**Double-slit bright fringe:** \(y_m = m\lambda L/d\)

**Single-slit dark fringe:** \(a\sin\theta_m = m\lambda\)

**Grating equation:** \(d\sin\theta_m = m\lambda\)

**Grating resolving power:** \(\mathcal{R} = mN\)

**Rayleigh criterion:** \(\theta_\text{min} = 1.22\lambda/D\)

**Airy function (FP):** \(\mathcal{T} = [1 + \mathcal{F}\sin^2(\delta/2)]^{-1}\), \(\mathcal{F} = 4R/(1-R)^2\)

**Finesse:** \(\mathcal{F}_\text{fin} = \pi\sqrt{R}/(1-R)\)

**Brewster's angle:** \(\tan\theta_B = n_2/n_1\)

**Malus's law:** \(I = I_0\cos^2\theta\)

**Quarter-wave plate retardance:** \(\Gamma = \pi/2\)

**Resonator stability:** \(0 \leq g_1 g_2 \leq 1\)

## 21.3 Conceptual Connections Across the Course

The unifying thread running through all of geometrical and physical optics is the concept of **path** and **phase**. In geometrical optics, Fermat's principle — stationarity of optical path length — determines the paths of rays and hence the locations of images. In physical optics, the phase difference accumulated along different paths determines whether waves interfere constructively or destructively, producing bright fringes, dark fringes, diffraction peaks, and spectral resolution. The matrix method bridges the two: it is the systematic linear-algebraic implementation of Fermat's principle for paraxial rays, and its transfer matrices are the geometrical-optics analogue of the propagator in quantum mechanics.

The reciprocal relationship between real space and frequency (spatial frequency or temporal frequency) space appears at every turn. A narrow slit diffracts widely; a wide slit diffracts narrowly. A short light pulse (narrow time extent) has a broad spectrum; a long pulse has a narrow spectrum. A lens with a small aperture has poor resolution; a large aperture has good resolution. The uncertainty principle — \(\Delta x\,\Delta k_x \geq 1/2\) — is not merely a quantum mechanical statement; it is a Fourier analysis theorem, and it operates identically in optics. Understanding this duality is the key to understanding why there is an inescapable diffraction limit to the resolution of any optical instrument, and why coherence (both temporal and spatial) determines the visibility of interference fringes.

Finally, the electromagnetic nature of light — manifest in the Fresnel equations, polarisation phenomena, and the wave equation — reminds us that optics is a branch of electromagnetism. Fermat's principle and the wave equation are not competing pictures but limiting descriptions of the same physical reality: Maxwell's equations for the electromagnetic field. The geometrical limit (short \(\lambda\)) gives ray optics; the wave picture (finite \(\lambda\)) gives interference and diffraction; the quantum limit (photons) gives the photoelectric effect and the shot noise that ultimately limits the sensitivity of every optical measurement.

---

# Appendix A: Mathematical Tools for Optics

## A.1 The sinc Function

The sinc function appears pervasively in diffraction calculations. Two conventions are in common use:

\[
\text{sinc}_\text{unnorm}(x) = \frac{\sin x}{x} \qquad \text{sinc}_\text{norm}(x) = \frac{\sin(\pi x)}{\pi x}
\]

These notes use the unnormalised convention. Key properties:
- \(\text{sinc}(0) = 1\)
- Zeros at \(x = \pm\pi, \pm 2\pi, \ldots\)
- \(\int_{-\infty}^\infty \text{sinc}(x/\pi)\,dx = \pi\)
- The Fourier transform of a rectangular pulse of width \(a\) is \(a\,\text{sinc}(ka/2)\)

## A.2 Bessel Functions in Optics

The diffraction pattern of a circular aperture involves **Bessel functions of the first kind**. The amplitude pattern is:

\[
U(r) = \frac{2J_1(k\,r\,D/(2z))}{k\,r\,D/(2z)}
\]

where \(r\) is the radial distance on the screen, \(D\) is the aperture diameter, and \(z\) is the propagation distance. Key properties of \(J_1(x)\):
- \(J_1(0) = 0\)
- Maximum at \(x \approx 1.841\)
- First zero at \(x \approx 3.832 = 1.220\pi\)

The ratio of \(J_1\)'s first zero to \(\pi\) — namely 1.220 — is the origin of the numerical factor in the Rayleigh criterion \(\theta_\text{min} = 1.220\lambda/D\).

## A.3 Complex Notation for Waves

The standard technique for handling superpositions of waves is to represent the real field \(E(t) = E_0\cos(\omega t + \phi)\) as the real part of a complex phasor \(\tilde{E} = E_0 e^{i(\omega t + \phi)}\). The intensity is then \(I = |\tilde{E}|^2/2\) (the factor of 1/2 is absorbed into the definition of intensity, or one works with peak amplitudes and inserts it explicitly). The key advantage: addition of waves with the same frequency becomes vector addition of complex numbers.

For two waves \(\tilde{E}_1 = E_{01}e^{i\phi_1}\) and \(\tilde{E}_2 = E_{02}e^{i\phi_2}\):

\[
I = |\tilde{E}_1 + \tilde{E}_2|^2 = E_{01}^2 + E_{02}^2 + 2E_{01}E_{02}\cos(\phi_2 - \phi_1)
\]

This is the fundamental interference formula. The phase difference \(\Delta\phi = (2\pi/\lambda)\times\text{OPD}\) connects the geometry of the experiment (OPD) to the observable (intensity pattern).

---

# Appendix B: Practical Optics — Notes on Laboratory Techniques

## B.1 Alignment of Optical Systems

Proper alignment is the foundation of experimental optics. The beam must propagate along the optical axis — otherwise, aberrations are introduced and the calculated image positions will not match observation. The standard procedure is:

1. **Establish the optical axis**: use a laser beam (or a target illuminated by a pinhole) as a reference. Adjust the height and tilt of the laser so the beam passes through reference irises at two well-separated locations along the bench.

2. **Align each element**: for each lens or mirror, adjust height, lateral position, and tilt until the beam passes through the element centre and the back-reflected spot (for lenses) or reflected beam (for mirrors) returns along the incident path. For a lens, the back-reflected image of the source should overlap the source.

3. **Check collimation**: a well-collimated beam from a lens shows a flat wavefront — check with a shear-plate interferometer or by verifying that the beam diameter does not change over a long propagation distance.

## B.2 Measuring the Focal Length of a Lens

**Method 1 (direct)**: place the lens on the optical bench and project the image of a distant source (window, distant lamp) onto a screen. The image distance equals the focal length (since the object is at infinity).

**Method 2 (conjugate points)**: use the thin-lens equation \(1/s_o + 1/s_i = 1/f\). Place an illuminated object at distance \(s_o\), find the sharp image at \(s_i\), and compute \(f = s_o s_i/(s_o + s_i)\). Repeat for several object distances and average.

**Method 3 (Bessel's method)**: for a fixed separation \(D\) between object and screen (\(D > 4f\)), there are exactly two lens positions that give a sharp image. If the lens is moved by distance \(d\) between the two positions, the focal length is \(f = (D^2 - d^2)/(4D)\). This method is self-calibrating and eliminates systematic errors from uncertain reference positions.

## B.3 Observing Diffraction and Interference

Young's double-slit fringes are easily observed using a laser pointer and a double slit made with two razor blade cuts in an aluminium foil mounted on a microscope slide. The fringe spacing \(\Delta y = \lambda L/d\) is on the order of millimetres for \(\lambda \approx 650\) nm, \(L \approx 1\) m, \(d \approx 0.5\) mm.

Single-slit diffraction requires a slit of adjustable width (a variable slit from an optical catalogue, or a gap between two razor blades mounted on a translation stage). As the slit is narrowed, the central maximum broadens — a vivid demonstration of the uncertainty principle.

Newton's rings are produced by pressing a convex lens (large radius of curvature, \(R \sim 1\) m) on a flat glass plate and illuminating from above with a sodium lamp. The ring radii are \(r_m = \sqrt{m\lambda R}\) (for dark rings in reflected light), allowing measurement of \(R\) to high precision if the wavelength is known.

---

# Appendix C: Historical Timeline of Optics

| Year | Development |
|---|---|
| ~300 BCE | Euclid discusses reflection in *Catoptrica* |
| 1021 | Ibn al-Haytham's *Book of Optics* — first correct theory of vision |
| ~1590 | Janssen brothers invent the compound microscope |
| ~1608 | Lippershey invents the telescope; Galileo improves it (1609) |
| 1621 | Snell discovers the law of refraction (published posthumously) |
| 1637 | Descartes publishes the law of refraction independently (*La Dioptrique*) |
| 1657 | Fermat states the principle of least time |
| 1665 | Hooke observes colours in thin films (*Micrographia*) |
| 1666 | Newton disperses white light into a spectrum with a prism |
| 1678 | Huygens proposes the wave theory of light (*Traité de la Lumière*, published 1690) |
| 1704 | Newton publishes *Opticks* (corpuscular theory) |
| 1801 | Young performs the double-slit experiment |
| 1815 | Brewster discovers the angle of polarisation |
| 1818 | Fresnel develops a rigorous wave theory of diffraction (submission to the French Academy) |
| 1849 | Fizeau measures the speed of light in a laboratory |
| 1851 | Foucault measures the speed of light in water (slower than in air — confirms wave theory) |
| 1873 | Abbe derives the resolution limit for the microscope |
| 1887 | Michelson-Morley experiment; Hertz confirms electromagnetic waves |
| 1899 | Fabry and Pérot describe the multi-beam etalon |
| 1905 | Einstein explains the photoelectric effect (photons) |
| 1908 | Mie solves scattering from a sphere |
| 1920 | Michelson measures the angular diameter of Betelgeuse |
| 1947 | Dennis Gabor invents holography |
| 1953 | Zernike awarded Nobel Prize for phase-contrast microscopy |
| 1960 | Maiman demonstrates the first laser (ruby, 694 nm) |
| 1979–1982 | Development of single-mode optical fibres for telecommunications |
| 2015 | LIGO detects the first gravitational wave (GW150914) |
| 2018 | Nobel Prize to Ashkin (optical tweezers), Mourou and Strickland (chirped-pulse amplification)

---

# Chapter 22: Geometrical Optics — Physical Interpretation and Extended Discussion

## 22.1 Why the Ray Approximation Works

The ray approximation is far more than a convenient fiction — it arises rigorously from Maxwell's equations in the limit \(\lambda/L \to 0\), where \(L\) is the smallest relevant geometric scale (aperture radius, feature size, radius of curvature of a wavefront). Understanding when and why it fails is just as important as understanding when it holds.

Consider a pinhole camera: a small hole of diameter \(a\) in an opaque screen, forming an image of a distant scene on a detector at distance \(L\). Geometrical optics predicts that a smaller hole gives a sharper image, because each image point corresponds to a narrower cone of rays. But experiment shows that below a certain hole diameter, the image becomes blurrier as the hole shrinks — diffraction spreads the beam. The optimal hole size balances geometric and diffraction blur: geometric spot size \(\sim a\) and diffraction spreading \(\sim \lambda L/a\). Setting them equal gives the optimal pinhole diameter \(a_\text{opt} = \sqrt{\lambda L}\). For \(\lambda = 500\) nm and \(L = 0.5\) m: \(a_\text{opt} \approx 0.5\) mm. The pinhole camera is thus an instructive example of the transition between geometrical and physical optics — and a practical application of the condition \(a \gg \sqrt{\lambda L}\) for ray optics to be valid.

The eikonal equation \(|\nabla S|^2 = n^2\) becomes invalid at caustics — surfaces where many rays converge to a common point or curve. At a caustic, the geometrical-optics amplitude diverges (the Jacobian of the ray mapping goes to zero), while the true wave-optics intensity is finite. The standard example is the bright pattern of light at the bottom of a swimming pool on a sunny day: the distorted water surface focuses sunlight into bright caustic curves. Geometrical optics predicts infinite intensity at these curves; wave optics gives a finite, Airy-like distribution controlled by the coherence of the sunlight and the scale of the water ripples.

## 22.2 The Vector Form of Snell's Law

Snell's law \(n_1\sin\theta_1 = n_2\sin\theta_2\) is a scalar relation valid in the plane of incidence. For computational ray-tracing through three-dimensional surfaces, it is essential to have the vector form. Let \(\hat{k}\) be the unit direction vector of the incident ray, \(\hat{n}\) the inward surface normal, \(n_1\) the incident-medium index, and \(n_2\) the transmitted-medium index.

<div class="theorem">
<strong>Vector Snell's Law.</strong> The unit direction vector of the refracted ray is:

\[
\hat{k}_t = \frac{n_1}{n_2}\hat{k} + \left(\frac{n_1}{n_2}\cos\theta_1 - \cos\theta_2\right)\hat{n}
\]
where \(\cos\theta_1 = -\hat{k}\cdot\hat{n}\) and \(\cos\theta_2 = \sqrt{1 - (n_1/n_2)^2(1 - \cos^2\theta_1)}\).

The reflected ray direction is: \(\hat{k}_r = \hat{k} - 2(\hat{k}\cdot\hat{n})\hat{n}\).
</div>

These vector forms are the starting point of **sequential ray-tracing** in optical design software (Zemax, Code V, Oslo). Tens of thousands of rays are traced through the complete optical system, each following its own path according to the vector Snell's law at every surface. The resulting spot diagrams — the distribution of ray intersections in the image plane — give a complete characterisation of the aberrations of the system.

## 22.3 Non-imaging Optics and Étendue

A concept of profound importance in practical optics — often neglected in introductory courses — is **étendue** (also called throughput or brightness): the product of beam area and solid angle:

\[
\mathcal{E} = n^2 A\,\Omega
\]

Étendue is **conserved** by any lossless optical system. This is the optical analogue of the Liouville theorem in classical mechanics — the phase-space volume occupied by a beam of light cannot be reduced by any combination of lenses, mirrors, or other optical elements. Only light absorbers or scatterers can increase it (by spreading rays into new directions). This places a fundamental limit on **concentration of light**: no optical system can focus sunlight to an intensity exceeding the surface brightness of the Sun. Practical concentration systems (solar furnaces, concentrating photovoltaic collectors) must have an acceptance solid angle large enough to match the étendue of the sunlight they are trying to collect.

**Non-imaging optics** — the design of optical systems optimised for light collection rather than image formation — exploits étendue to design compound parabolic concentrators (CPCs), Winston cones, and other devices that approach the thermodynamic concentration limit. A CPC can concentrate light from an acceptance half-angle \(\theta\) by a factor of \(1/\sin^2\theta\) in two dimensions — the theoretical maximum given by étendue conservation.

---

# Chapter 23: Coherence — Mathematical Framework

## 23.1 The Mutual Coherence Function

The **mutual coherence function** generalises the concept of temporal coherence to the full space-time domain:

\[
\Gamma(\mathbf{r}_1, \mathbf{r}_2; \tau) = \langle E^*(\mathbf{r}_1, t)\,E(\mathbf{r}_2, t+\tau)\rangle
\]

where the angular brackets denote a time average. This function encodes all information about the coherence of the field — temporal coherence appears when \(\mathbf{r}_1 = \mathbf{r}_2\), spatial coherence when \(\tau = 0\). The **complex degree of coherence** is the normalised version:

\[
\gamma(\mathbf{r}_1, \mathbf{r}_2; \tau) = \frac{\Gamma(\mathbf{r}_1, \mathbf{r}_2; \tau)}{\sqrt{I(\mathbf{r}_1)\,I(\mathbf{r}_2)}}
\]

with \(|\gamma| \leq 1\). The fringe visibility in Young's experiment with sources at \(\mathbf{r}_1\) and \(\mathbf{r}_2\) is \(V = |\gamma(\mathbf{r}_1, \mathbf{r}_2; \tau)|\), where \(\tau\) is the time delay corresponding to the path difference between the two pinholes to the observation point. The measurement of fringe visibility thus gives a direct measurement of the degree of coherence.

## 23.2 Propagation of Coherence

The van Cittert-Zernike theorem describes how spatial coherence develops as light propagates. Consider an extended, planar, spatially incoherent source (like a gas discharge lamp with a diffuser, or the Sun). In the far field (at distance \(z\) from the source), the mutual coherence function at two points separated by \(\boldsymbol{\Delta\rho}\) is:

\[
\Gamma(\boldsymbol{\Delta\rho}) \propto \int I(\boldsymbol{\rho}_s)\,e^{ik\boldsymbol{\rho}_s\cdot\boldsymbol{\Delta\rho}/z}\,d^2\boldsymbol{\rho}_s = \tilde{I}\!\left(\frac{k\boldsymbol{\Delta\rho}}{z}\right)
\]

The coherence function is the Fourier transform of the source intensity distribution — the same mathematical structure as the Fraunhofer diffraction pattern of an aperture equal to the source. This means the spatial coherence radius at distance \(z\) is \(\rho_c \approx \lambda z / D_s\), where \(D_s\) is the source diameter. For the Sun (\(D_s = 1.39\times10^9\) m, \(z = 1.5\times10^{11}\) m): \(\rho_c \approx (500\times10^{-9}\times1.5\times10^{11})/(1.39\times10^9) \approx 54\,\mu\text{m}\). This is the coherence radius of sunlight at the Earth's surface — two points separated by more than about 50 micrometres are illuminated by essentially incoherent sunlight.

---

# Chapter 24: Newton's Rings and Interference in Wedge-Shaped Films

## 24.1 Newton's Rings — Quantitative Analysis

Newton's rings arise from the air gap between a plano-convex lens of large radius of curvature \(R\) and a flat glass plate. At radial distance \(r\) from the point of contact, the air gap thickness is:

\[
t(r) \approx \frac{r^2}{2R} \quad (\text{for } r \ll R)
\]

In reflected light, with a phase shift of \(\pi\) at the lower glass surface (air-to-glass) and no phase shift at the upper surface (glass-to-air), the condition for dark rings (destructive interference) is:

\[
2t(r_m) = m\lambda \implies r_m = \sqrt{m\lambda R}
\]

and for bright rings:

\[
r_m = \sqrt{(m - 1/2)\lambda R}
\]

At the centre (\(r = 0\), \(t = 0\)), the dark centre is immediately visible — a distinctive diagnostic for Newton's rings versus other fringe patterns. The ring pattern is circular because the air gap has circular symmetry.

Measuring the ring radii allows precise determination of the radius of curvature of the lens: \(R = r_m^2/(m\lambda)\). This is a standard technique for quality control of lenses in optical manufacturing. The wavelength of the illuminating source can also be determined if \(R\) is known — this was historically important before spectral lamps had independently calibrated wavelengths.

If the gap between the surfaces is filled with a liquid of refractive index \(n_l\), the ring radii scale as \(r_m = \sqrt{m\lambda R/n_l}\) — the rings shrink. By measuring the ratio of ring radii before and after filling with a liquid, the liquid's refractive index can be measured precisely. This is the principle of the **immersion method** for refractive index measurement.

## 24.2 Wedge-Shaped Films and Tilt Fringes

A wedge-shaped air film (formed between two flat glass plates making a small angle \(\alpha\)) produces straight, parallel fringes of equal thickness. The \(m\)th dark fringe in reflected light occurs where:

\[
2nt_m = m\lambda \implies t_m = \frac{m\lambda}{2n} \implies x_m = \frac{m\lambda}{2n\alpha}
\]

The fringe spacing is \(\Delta x = \lambda/(2n\alpha)\). For a 0.01 mrad wedge in air with \(\lambda = 589\) nm: \(\Delta x = 29.5\) mm — widely spaced, easily resolved fringes. As the wedge angle increases, the fringes become more closely spaced.

Wedge fringes are used to test the flatness of optical surfaces: any deviation from flatness appears as a localised distortion of the otherwise straight fringes. A deviation of half a fringe width corresponds to a surface height error of \(\lambda/4\) — this is the basis of the \(\lambda/4\) flatness specification for high-quality optical flats and laser mirror substrates.

---

# Chapter 25: Optical Fibre Optics — Detailed Treatment

## 25.1 Guided Modes and the V-Number

Optical fibres support a discrete set of **guided modes** — field patterns that propagate without diffraction because they are confined by total internal reflection at the core-cladding interface. The number of guided modes is characterised by the **V-number** (normalised frequency):

\[
V = \frac{2\pi a}{\lambda}\sqrt{n_\text{core}^2 - n_\text{clad}^2} = \frac{2\pi a}{\lambda}\,\text{NA}
\]

where \(a\) is the core radius. For \(V < 2.405\) (the first zero of \(J_0\)), only the fundamental \(\text{HE}_{11}\) mode propagates — the fibre is **single-mode**. For \(V \gg 1\), the approximate number of guided modes is \(N \approx V^2/2\).

**Single-mode fibres** (core diameter \(\sim 8\,\mu\text{m}\), \(V \approx 2\) at 1550 nm) carry signals with no intermodal dispersion — the fundamental limitation on bandwidth in multi-mode fibres. They are used in all long-haul telecommunications. **Multi-mode fibres** (core diameter \(\sim 50\,\mu\text{m}\), V \(\gg 1\)) are used in short-distance data links (data centres) where their larger core makes coupling easier.

## 25.2 Fibre Dispersion and Bandwidth

Even in single-mode fibres, the group velocity of the guided mode depends on wavelength (**chromatic dispersion**), causing optical pulses to spread during propagation. The key parameter is the **group velocity dispersion** (GVD):

\[
\beta_2 = \frac{d^2\beta}{d\omega^2}
\]

where \(\beta = n_\text{eff}\omega/c\) is the mode propagation constant. A pulse of spectral width \(\Delta\omega\) spreads in time as \(\Delta T = |\beta_2| L\,\Delta\omega\) after propagation distance \(L\). For standard single-mode fibre (SSMF) at 1550 nm: \(\beta_2 \approx -20\) ps\(^2\)/km. A 10 Gbit/s pulse stream with \(\Delta\lambda \approx 0.1\) nm spreads by \(\Delta T \approx 0.16\) ps/km — acceptable for distances up to \(\sim 500\) km without regeneration or dispersion compensation.

Dispersion-shifted fibres (DSF) move the zero-dispersion wavelength from 1310 nm (standard) to 1550 nm (the low-loss window) by adjusting the refractive index profile. Dispersion-compensating fibres (DCF) have \(\beta_2 > 0\) at 1550 nm and are used as short (but high-dispersion) segments to cancel the dispersion accumulated in long spans of SSMF.

---

# Chapter 26: Nonlinear and Modern Optics — Brief Introduction

## 26.1 Beyond Linear Optics

All the phenomena studied in PHYS 256 — reflection, refraction, diffraction, interference, polarisation — operate in the **linear optical regime**: the optical response of the material is proportional to the applied electric field. This means that two beams passing through the same region of space do not interact (in the absence of a material medium). This is why you can see two laser beams crossing in free space without them affecting each other.

At very high intensities (such as those achievable with pulsed lasers), the polarisation of the material \(\mathbf{P}\) acquires terms nonlinear in \(\mathbf{E}\):

\[
\mathbf{P} = \varepsilon_0\!\left(\chi^{(1)}\mathbf{E} + \chi^{(2)}\mathbf{E}\mathbf{E} + \chi^{(3)}\mathbf{E}\mathbf{E}\mathbf{E} + \cdots\right)
\]

The \(\chi^{(2)}\) term (present only in non-centrosymmetric crystals) is responsible for **second-harmonic generation** (SHG): two photons of frequency \(\omega\) combine in the crystal to produce one photon of frequency \(2\omega\). This is how green laser pointers work — an infrared Nd:YAG laser at 1064 nm is frequency-doubled in a KTP crystal to give 532 nm green output. The efficiency of SHG depends critically on **phase matching**: the condition that the phase velocities of the fundamental and second-harmonic waves are equal, so that the second-harmonic contributions generated at different points in the crystal add constructively.

## 26.2 Lasers — Key Principles

Although the laser is a quantum device, its optical properties are governed by exactly the physics covered in PHYS 256. A laser consists of:

1. A **gain medium** (the active medium: atoms, molecules, semiconductors, or rare-earth-doped glass) that amplifies light by **stimulated emission** — the quantum process by which an excited atom, stimulated by a passing photon, emits an identical second photon. The Einstein coefficients quantify the rates of stimulated emission and absorption.

2. A **pump** that maintains the gain medium in a state of **population inversion** — more atoms in the upper laser level than in the lower — so that stimulated emission exceeds absorption.

3. A **resonator** (an optical cavity, typically two mirrors) that provides optical feedback: light bounces back and forth through the gain medium, building up in intensity each round trip until the round-trip gain equals the round-trip loss (threshold condition).

The resonator modes — the frequencies at which the cavity supports a standing wave — are separated by the **free spectral range** \(\Delta\nu = c/(2L)\). The gain bandwidth of the medium determines how many modes are above threshold. A laser with a short, high-Q cavity may operate on a single longitudinal mode; a broad-gain laser with a long cavity may operate on hundreds of modes simultaneously (mode-locked operation, producing ultrashort pulses).

The connection to Fabry-Pérot theory is direct: the laser cavity is precisely an FP resonator with an active (gain) medium inside. The threshold condition is that the round-trip amplification factor exactly compensates the round-trip loss factor: \(G^2 R_1 R_2 = 1\) (for a cavity with mirror reflectivities \(R_1, R_2\) and single-pass power gain \(G\)).

---

# Chapter 27: Detailed Derivations — Supplement

## 27.1 Deriving the Mirror Equation from Geometry

A rigorous paraxial derivation of the mirror equation avoids any vague "similar triangles" argument. Place a concave spherical mirror of radius \(R\) with its vertex at the origin, and the centre of curvature \(C\) at \(z = R\) (using the convention that the mirror faces in the \(-z\) direction, so the reflecting surface has \(z = y^2/(2R)\) paraxially).

A point object \(O\) is at \(z = -s_o\) (to the left, \(s_o > 0\)). A ray from \(O\) hits the mirror at height \(y\). By the law of reflection, the normal at that point passes through \(C\) (since the surface is spherical). The angles of incidence and reflection are measured from this normal.

The incident ray has slope \(\alpha \approx y/s_o\) (positive, since it goes upward to reach height \(y\) from the object on the left). The normal at the mirror point makes angle \(\beta \approx y/R\) with the axis (positive upward, since the normal points toward \(C\)). The angle of incidence \(\theta_i = \beta - \alpha\) (if \(\beta > \alpha\), the ray hits the mirror "inside" the normal direction). The reflected ray makes angle \(\theta_r = \theta_i\) below the normal, so its slope with the axis is \(\gamma = \beta - 2\alpha + \beta = 2\beta - \alpha\) (measuring downward as positive for a ray going toward the image on the left). Wait — let us work more carefully.

All angles measured from the axis, with the convention that rays going from left to right and upward have positive slope:
- Object ray slope from axis: \(\alpha_1 = -y/s_o\) (going leftward to the mirror means going in \(-z\), and upward, so for the mirror analysis we take magnitudes: the ray from \(O\) at height \(-s_o\) to the mirror at height \(y > 0\) has slope \(+y/s_o\) in the object-to-mirror direction).

The result of careful geometry: after reflection, the ray passes through image point \(I\) at distance \(s_i\) from the vertex satisfying:

\[
\frac{y}{s_o} + \frac{y}{s_i} = \frac{2y}{R} \implies \frac{1}{s_o} + \frac{1}{s_i} = \frac{2}{R}
\]

which is the mirror equation. The derivation is explicitly paraxial: it holds only when \(y \ll R, s_o, s_i\), i.e., when all angles are small. Rays at large angles (\(y \sim R\)) focus at different points — this is **spherical aberration of the mirror**.

## 27.2 Derivation of the Grating Equation from Path Differences

Consider \(N\) slits, with adjacent slits separated by \(d\). A plane wave of wavelength \(\lambda\) is incident at angle \(\theta_i\) to the grating normal, and we observe the diffracted intensity at angle \(\theta_d\). The path length difference between rays from adjacent slits is:

\[
\Delta = d\sin\theta_d - d\sin\theta_i
\]

(the first term is the path difference on the outgoing side; the second subtracts the path difference on the incoming side, since the incoming wave is also a plane wave at an angle). For constructive interference from all \(N\) slits:

\[
\Delta = m\lambda \implies d(\sin\theta_d - \sin\theta_i) = m\lambda
\]

This is the **general grating equation** for oblique incidence. For normal incidence (\(\theta_i = 0\)): \(d\sin\theta_d = m\lambda\). For a **reflection grating** used in the Littrow configuration (\(\theta_i = \theta_d = \theta_L\)): \(2d\sin\theta_L = m\lambda\) — the grating is used such that the diffracted beam returns along the incident beam direction. The Littrow configuration maximises the effective path difference and is the standard configuration for high-resolution spectrographs.

## 27.3 Phase Matching in Thin Films — Careful Accounting

The phase-shift-upon-reflection rule deserves careful treatment because it is a source of common errors. The electromagnetic boundary conditions (Fresnel equations) give:

- \(r_s = (n_1\cos\theta_i - n_2\cos\theta_t)/(n_1\cos\theta_i + n_2\cos\theta_t)\)

For \(n_1 < n_2\) (going from lower to higher index, e.g., air to glass): \(r_s < 0\) for all angles \(\theta_i\), meaning the reflected amplitude is negative — a phase shift of exactly \(\pi\) (equivalent to half a wavelength). This is the **hard reflection** analogous to a wave on a string reflecting from a fixed end.

For \(n_1 > n_2\) (going from higher to lower index, e.g., glass to air): \(r_s > 0\) for \(\theta_i < \theta_c\), meaning no phase shift. This is the **soft reflection** analogous to a wave reflecting from a free end.

For a thin film of index \(n_f\) in medium of index \(n_m\) (\(n_f > n_m\)):
- Top surface (medium to film): hard reflection, phase shift \(\pi\).
- Bottom surface (film to medium): soft reflection, no phase shift.
- Net extra phase: \(\pi\) from reflections, plus \(4\pi n_f t\cos\theta_t/\lambda\) from the round trip through the film.

**Bright fringe** (destructive → constructive after the \(\pi\) phase shift of the bottom path):

\[
2n_f t\cos\theta_t = (m - 1/2)\lambda, \quad m = 1, 2, 3, \ldots
\]

**Dark fringe** (net destructive, the \(\pi\) shift makes the \(m=0\) condition destructive):

\[
2n_f t\cos\theta_t = m\lambda, \quad m = 0, 1, 2, \ldots
\]

At \(t = 0\) (contact point): \(2n_f\cdot 0 = 0 = 0\cdot\lambda\) — dark. This explains the dark centre of Newton's rings and the dark edge of a soap film draining toward zero thickness just before it breaks.

---

# Chapter 28: Worked Examples

## 28.1 Thin Lens System — Two-Lens Combination

**Problem.** A converging lens of focal length \(f_1 = 20\) cm is placed 30 cm to the left of a diverging lens of focal length \(f_2 = -10\) cm. An object is placed 40 cm to the left of the first lens. Find (a) the position of the final image, (b) the total lateral magnification.

**Solution.**

*Step 1: Image from lens 1.*

\[
\frac{1}{s_{i1}} = \frac{1}{f_1} - \frac{1}{s_{o1}} = \frac{1}{20} - \frac{1}{40} = \frac{1}{40} \implies s_{i1} = 40\text{ cm}
\]

The first image is 40 cm to the right of lens 1. Magnification: \(m_1 = -s_{i1}/s_{o1} = -40/40 = -1\).

*Step 2: Object for lens 2.*
Lens 2 is 30 cm to the right of lens 1. The first image is 40 cm to the right of lens 1, which is 10 cm to the **right** of lens 2. Since light is still traveling to the right, this is a **virtual object** for lens 2, so \(s_{o2} = -10\) cm.

*Step 3: Image from lens 2.*

\[
\frac{1}{s_{i2}} = \frac{1}{f_2} - \frac{1}{s_{o2}} = \frac{1}{-10} - \frac{1}{-10} = -\frac{1}{10} + \frac{1}{10} = 0
\]

This gives \(s_{i2} \to \infty\). The final image is at infinity — the system produces a collimated output beam (afocal system). Magnification: \(m_2 = -s_{i2}/s_{o2} \to \infty\) (the angular magnification is \(M_\theta = f_1/|f_2| = 20/10 = 2\), consistent with this being a Galilean telescope configuration with an object inside the first focal length).

*Physical interpretation.* The object at 40 cm from a 20 cm lens is exactly at twice the focal length — the image is also at twice the focal length, exactly 40 cm to the right. But the second lens, placed only 30 cm away, receives a converging beam aimed at a point 10 cm beyond it. That converging beam is equivalent to a virtual object. With \(f_2 = -10\) cm, the diverging power of the second lens exactly cancels the remaining convergence of the beam, producing a collimated output — a useful result for beam expansion.

## 28.2 Diffraction Grating Resolution

**Problem.** A diffraction grating has \(N = 10{,}000\) lines and is ruled at \(d = 2\,\mu\text{m}\) spacing. (a) Find the maximum diffraction order for \(\lambda = 500\) nm. (b) What is the resolving power in third order? (c) Can it resolve the sodium D doublet (589.0 nm and 589.6 nm) in third order?

**Solution.**

*(a)* Maximum order: \(d\sin\theta = m\lambda\) requires \(\sin\theta \leq 1\), so \(m_\text{max} = d/\lambda = (2\times10^{-6})/(5\times10^{-7}) = 4\).

*(b)* Resolving power in \(m = 3\): \(\mathcal{R} = mN = 3 \times 10{,}000 = 30{,}000\).

*(c)* To resolve the sodium doublet: \(\mathcal{R}_\text{needed} = \lambda/\delta\lambda = 589.3/0.6 \approx 982\). Since \(30{,}000 \gg 982\), yes — the grating easily resolves the sodium D doublet in third order, with about 30 times the required resolving power.

## 28.3 Fabry-Pérot Etalon

**Problem.** A FP etalon has mirror reflectivity \(R = 0.95\), plate separation \(d = 5\) mm, refractive index \(n = 1\). (a) Find the finesse. (b) Find the FSR in frequency. (c) Find the FWHM in frequency. (d) Find the resolving power at \(\lambda = 633\) nm.

**Solution.**

*(a)* Finesse: \(\mathcal{F}_\text{fin} = \pi\sqrt{R}/(1-R) = \pi\sqrt{0.95}/0.05 = \pi\times0.9747/0.05 \approx 61.3\).

*(b)* FSR: \(\Delta\nu_\text{FSR} = c/(2nd) = (3\times10^8)/(2\times1\times5\times10^{-3}) = 30\) GHz.

*(c)* FWHM: \(\delta\nu = \Delta\nu_\text{FSR}/\mathcal{F}_\text{fin} = 30/61.3 \approx 0.49\) GHz.

*(d)* Order at \(\lambda = 633\) nm: \(m = 2nd/\lambda = 2\times5\times10^{-3}/(633\times10^{-9}) \approx 15{,}800\). Resolving power: \(\mathcal{R} = m\mathcal{F}_\text{fin} = 15{,}800\times61.3 \approx 9.7\times10^5\). This is sufficient to resolve features separated by \(\delta\lambda = \lambda/\mathcal{R} = 633\,\text{nm}/970{,}000 \approx 6.5\times10^{-4}\) nm = 0.65 pm.

## 28.4 Polarisation — Jones Calculus

**Problem.** Horizontally polarised light (\(I_0 = 1\)) passes through (1) a quarter-wave plate with fast axis at 45°, then (2) a linear polariser with transmission axis at 45°. Find the output intensity.

**Solution.**

Input Jones vector: \(\mathbf{J}_0 = \begin{pmatrix}1\\0\end{pmatrix}\).

QWP with fast axis at 45°: rotate to the fast-axis frame, apply the retardance, rotate back. Equivalently, the Jones matrix is:

\[
M_\text{QWP,45°} = \frac{e^{i\pi/4}}{\sqrt{2}}\begin{pmatrix}1&-i\\-i&1\end{pmatrix}
\]

(This is the standard result for a QWP with fast axis at 45°.) After the QWP:

\[
\mathbf{J}_1 = M_\text{QWP,45°}\begin{pmatrix}1\\0\end{pmatrix} = \frac{e^{i\pi/4}}{\sqrt{2}}\begin{pmatrix}1\\-i\end{pmatrix}
\]

This is right-circular polarisation (up to a global phase). The Jones matrix for a polariser at 45°:

\[
M_P = \frac{1}{2}\begin{pmatrix}1&1\\1&1\end{pmatrix}
\]

Output:

\[
\mathbf{J}_2 = M_P\mathbf{J}_1 = \frac{e^{i\pi/4}}{\sqrt{2}}\cdot\frac{1}{2}\begin{pmatrix}1&1\\1&1\end{pmatrix}\begin{pmatrix}1\\-i\end{pmatrix} = \frac{e^{i\pi/4}}{2\sqrt{2}}\begin{pmatrix}1-i\\1-i\end{pmatrix}
\]

Intensity: \(I = |\mathbf{J}_2|^2 = \frac{1}{8}|1-i|^2 + \frac{1}{8}|1-i|^2 = \frac{1}{8}\times2 + \frac{1}{8}\times2 = \frac{1}{2}\).

The output intensity is \(I = I_0/2 = 0.5\). This can be understood qualitatively: right-circular polarisation has equal components along any linear direction; the 45° polariser passes exactly half the intensity. (The same result holds for left-circular, confirming that circular polarisation is a "balanced" superposition of all linear polarisations.)

---

# Chapter 29: Connecting Geometrical and Physical Optics

## 29.1 The Diffraction Limit as a Consequence of the Wave Nature

In geometrical optics, a perfect (aberration-free) lens forms a perfect point image from a point object. In physical optics, this is impossible: diffraction spreads the image into an Airy disc of finite size. The resolution limit is a fundamental consequence of the wave nature of light, not of imperfections in the optical system.

The physical argument is simple. To resolve fine detail (small spatial period \(p\)), the lens must collect diffracted light at large angles: \(\sin\theta_1 = \lambda/p\). A lens of diameter \(D\) at distance \(f\) collects angles up to \(\sin\theta_\text{max} = D/(2f) = 1/(2N)\). So the minimum resolvable period is \(p_\text{min} = \lambda/\sin\theta_\text{max} = 2N\lambda\). Equivalently, the minimum resolvable angular separation for two point sources is \(\theta_\text{min} = 1.22\lambda/D\) (Rayleigh). This is not a technological limitation — it is a bound set by the laws of physics (specifically, Fourier analysis applied to the aperture function).

The **super-resolution** techniques developed in recent decades (STED, STORM, PALM in fluorescence microscopy; CLEAN in radio astronomy; compressed sensing) do not break the Abbe/Rayleigh limit. Rather, they exploit prior knowledge about the object (sparsity, known point-spread function) or nonlinear optical effects (saturable absorption in STED) to infer sub-diffraction information. The fundamental information-theoretic bound remains: you cannot extract more information from a signal than it contains, and diffraction limits the spatial bandwidth of the optical signal.

## 29.2 Wavefronts, Rays, and the Concept of Aberration

The connection between wavefronts and rays provides the most illuminating framework for understanding aberrations. A **perfect** lens converts a spherical wavefront diverging from a point object into a spherical wavefront converging to the corresponding image point — the rays are then the straight lines perpendicular to these spherical wavefronts.

An **aberrated** lens deforms the converging wavefront: instead of a perfect sphere, the wavefront has bumps and dips. The deviation of the wavefront from the ideal sphere is the **wavefront aberration** \(W(x, y)\), where \((x, y)\) are coordinates in the exit pupil plane. The image quality is determined by \(W\): the intensity in the focal plane is the squared modulus of the Fourier transform of the pupil function \(P(x,y)\exp[i(2\pi/\lambda)W(x,y)]\).

The **Strehl ratio** is the ratio of the on-axis intensity of the aberrated image to that of the perfect (diffraction-limited) image. For small aberrations:

\[
S \approx 1 - \left(\frac{2\pi}{\lambda}\right)^2\sigma_W^2
\]

where \(\sigma_W^2 = \langle W^2\rangle - \langle W\rangle^2\) is the variance of the wavefront aberration. The **Maréchal criterion** for a diffraction-limited system is \(S \geq 0.80\), which requires \(\sigma_W \leq \lambda/(14.1)\) — often approximated as \(\lambda/14\). This is why telescope mirror specifications are given in units of \(\lambda\): a mirror with \(\lambda/10\) surface error (peak-to-valley wavefront error \(\lambda/5\)) has \(\sigma_W \approx \lambda/25\) and a Strehl ratio of about 0.94 — excellent optical quality.

The five Seidel aberrations can each be expressed as specific polynomial forms of \(W\):

\[
W(h, \rho, \theta) = W_{040}\rho^4 + W_{131}h\rho^3\cos\theta + W_{222}h^2\rho^2\cos^2\theta + W_{220}h^2\rho^2 + W_{311}h^3\rho\cos\theta
\]

where \(h\) is the image height (field), \(\rho\) is the normalised pupil radius, and \(\theta\) is the azimuthal pupil angle. The five terms correspond to spherical aberration (\(W_{040}\rho^4\)), coma (\(W_{131}h\rho^3\cos\theta\)), astigmatism (\(W_{222}h^2\rho^2\cos^2\theta\)), field curvature (\(W_{220}h^2\rho^2\)), and distortion (\(W_{311}h^3\rho\cos\theta\)).

---

# Chapter 30: Summary of Key Physical Insights

## 30.1 Recapitulation of Part I — Geometrical Optics

Geometrical optics rests on a single, powerful variational principle — Fermat's principle of stationary optical path length. From it, we derived Snell's law and the law of reflection without any reference to the wave nature of light. The paraxial approximation (\(\sin\theta \approx \theta\)) linearises the ray equations, enabling the elegant matrix (ABCD) formalism in which any sequence of optical elements, no matter how complex, is reduced to a \(2\times2\) matrix. The cardinal points extracted from this matrix — principal planes and focal points — allow the system to be treated as an equivalent thin lens for image-location purposes.

The key image-forming formulas (\(1/s_o + 1/s_i = 1/f\), the lensmaker's equation, the mirror equation) are all paraxial results. Real systems deviate from these because: (a) rays at large apertures are not truly paraxial (Seidel aberrations); (b) the refractive index depends on wavelength (chromatic aberrations). Correcting aberrations is the central challenge of optical engineering, and it requires balancing multiple competing effects — a lens with zero spherical aberration often has residual coma, correcting coma may introduce astigmatism, and so on. Modern optical design is inherently a computer-aided optimisation problem.

## 30.2 Recapitulation of Part II — Physical Optics

Physical optics begins with the electromagnetic wave equation, from which all optical phenomena flow. The Poynting vector gives the intensity; the plane wave solution describes propagation; the Fresnel equations give the amplitudes of reflected and transmitted waves at interfaces. Polarisation states — linear, circular, elliptical — are described by the Jones vector formalism, and their transformation through optical elements is computed by multiplying Jones matrices.

Interference arises from the superposition of coherent waves. Young's double slit is the canonical two-beam experiment; the Michelson interferometer is its practical incarnation in a division-of-amplitude geometry. The Fabry-Pérot interferometer extends two-beam to multiple-beam interference, producing the sharply peaked Airy function and the high resolving power needed for precision spectroscopy. The key parameter is the finesse, which depends only on the mirror reflectivity: \(\mathcal{F}_\text{fin} = \pi\sqrt{R}/(1-R)\).

Diffraction is interference from a continuous distribution of secondary sources (Huygens-Fresnel principle). The Fraunhofer diffraction pattern from any aperture is its Fourier transform — a result that unifies all of diffraction theory. Single-slit diffraction gives a sinc\(^2\) pattern; circular apertures give the Airy disc; the diffraction grating gives sharp principal maxima with resolving power \(\mathcal{R} = mN\). All resolution criteria — Rayleigh, Abbe — ultimately express the finite spatial bandwidth imposed by a finite aperture.

The full arc of the course traces how light, starting from Maxwell's equations as an electromagnetic wave, develops its observable properties through refraction, reflection, interference, diffraction, and polarisation. The geometrical picture and the wave picture are not opposed: they are complementary descriptions, each valid in its own domain, both arising from the same fundamental physics.

---

# Chapter 31: Optical Instruments — Detailed Physical Analysis

## 31.1 The Camera — From Pinhole to Modern Lens

The evolution from the pinhole camera to the modern photographic lens is a story of progressively more sophisticated management of diffraction and aberration. The pinhole camera forms images with no lens and therefore no lens aberrations, but diffraction limits the sharpness — the optimal pinhole diameter scales as \(a_\text{opt} \approx \sqrt{\lambda L}\). For a camera with the pinhole 10 cm from the film (\(L = 0.1\) m) and \(\lambda = 550\) nm: \(a_\text{opt} \approx 0.23\) mm, giving an effective F-number of \(N = L/a_\text{opt} = 435\). At this extreme aperture, depth of field is enormous (essentially infinite) but exposure times are impractically long.

A lens replaces the pinhole, increasing the light-gathering power by factors of thousands while maintaining or improving sharpness. The price is aberrations. A simple single-element lens (singlet) has substantial spherical aberration, coma, astigmatism, and chromatic aberration — unusable for high-quality imaging. A **doublet** (two cemented or air-spaced elements) can be designed to be free of both spherical aberration and chromatic aberration at a single wavelength pair, with greatly reduced coma. A **triplet** (three elements, independently developed by H. D. Taylor in 1893 — the "Cooke Triplet") can in principle correct all five Seidel aberrations simultaneously, and it remains the basis of most camera lens designs to this day.

Modern camera lenses for full-frame sensors may contain 12–18 elements in 9–12 groups, incorporating aspherical surfaces (which eliminate spherical aberration far more efficiently than additional spherical elements), extra-low dispersion (ED or LD) glass (with anomalous partial dispersion that allows better correction of secondary chromatic aberration than is possible with ordinary glass), and floating elements (that shift their spacing as the lens is focused to maintain correction across the focus range). The final optical performance of such a lens — measured by its MTF — can approach the diffraction limit across the full image frame.

## 31.2 The Telescope — Angular Resolution and Magnification

The astronomical telescope faces a dual requirement: large light-gathering power (for faint objects) and high angular resolution (for fine detail). Both are served by a large objective diameter \(D\). Light-gathering power scales as \(D^2\); angular resolution scales as \(1/D\) (Rayleigh criterion). These twin motivations have driven the construction of ever-larger telescopes across four centuries.

For a **refracting telescope** (objective lens + eyepiece), the angular magnification is \(M = f_o/f_e\). The largest refracting telescope ever built is the Yerkes 40-inch (1.0 m), completed in 1897 — the lens is so large that gravitational sag deforms it, and no larger achromatic refractor has been built since. For astronomical telescopes with apertures above about 30 cm, reflecting telescopes (using mirrors rather than lenses) are preferred: mirrors have no chromatic aberration (reflection is wavelength-independent), can be supported from behind to avoid sag, and can be made far larger.

The **Cassegrain telescope** — the standard design for research observatories — uses a large concave primary mirror with a small convex secondary that reflects the converging beam back through a hole in the primary to a focal point behind it. The effective focal length of a Cassegrain is \(f_\text{eff} = f_p/(1 - d/f_p)\times(f_p/f_s)\) (approximately), giving a system focal length much longer than the physical length of the telescope tube. The Very Large Telescope (VLT) in Chile has four primary mirrors of 8.2 m diameter, each with an effective focal length of 450 m (F/56) at the Coudé focus — sufficient to resolve individual stars in globular clusters at the distance of the Andromeda galaxy.

The **resolving power** of a telescope on the ground is not limited by diffraction for apertures larger than about 10 cm — atmospheric turbulence (seeing) blurs stellar images to a disc (the "seeing disc") typically 1–2 arcseconds in diameter at good observing sites. Adaptive optics (AO) systems compensate for atmospheric turbulence in real time: a bright reference star (or an artificial laser guide star) is monitored by a wavefront sensor; a deformable mirror conjugate to the telescope pupil is commanded at rates of hundreds of Hz to cancel the measured wavefront error. Modern AO systems on 8–10 m telescopes routinely deliver images approaching the diffraction limit (\(\sim 0.05''\) at infrared wavelengths), revealing structures that are inaccessible without correction.

## 31.3 The Microscope — From Compound Microscope to Super-Resolution

The compound microscope uses an objective of very short focal length (1–40 mm) to form a magnified intermediate image, which is then further magnified by the eyepiece. The total magnification is:

\[
M = M_\text{obj}\times M_\text{eye} = \frac{L}{f_\text{obj}}\times\frac{d}{f_\text{eye}}
\]

where \(L\) is the tube length (fixed at 160 mm in the older DIN standard, or effectively infinity in modern infinity-corrected objectives), \(d = 25\) cm is the near-point distance. A \(100\times\) oil-immersion objective (\(f_\text{obj} \approx 2\) mm, NA = 1.4) paired with a \(10\times\) eyepiece gives total magnification \(1000\times\) — the practical upper limit for light microscopy, since magnification beyond the Abbe limit produces empty magnification (no new detail revealed).

**Phase-contrast microscopy** (Zernike, Nobel Prize 1953) converts invisible phase variations in a transparent specimen into visible amplitude (intensity) variations. The key insight is that when light passes through a thin transparent object, it acquires a phase shift proportional to the local optical path length but (for small phase shifts) almost no amplitude change — the specimen is essentially invisible in bright-field illumination. The phase-contrast method places an annular phase plate in the back focal plane of the objective (the Fourier plane) that shifts the phase of the unscattered (direct) beam by \(\lambda/4\) relative to the scattered light. The resulting interference between scattered and phase-shifted direct beams converts phase into amplitude contrast. Phase-contrast enabled the visualisation of live, unstained cells — a revolution in cell biology.

**Confocal microscopy** achieves optical sectioning (three-dimensional imaging) by placing a pinhole in the image plane before the detector. Light from out-of-focus planes is defocused at the pinhole and largely rejected. As the specimen is scanned (or the beam is scanned across the specimen), a three-dimensional image is built up voxel by voxel. The axial resolution of a confocal microscope is approximately:

\[
\Delta z \approx \frac{1.4\lambda n}{\text{NA}^2}
\]

For NA = 1.4 and \(\lambda = 500\) nm: \(\Delta z \approx 350\) nm — sufficient to optically section cells and visualise subcellular structures in three dimensions without physical sectioning.

**STED microscopy** (stimulated emission depletion, Nobel Prize 2014) breaks the Abbe diffraction limit by using a doughnut-shaped depletion beam to switch off fluorophores everywhere except a subdiffraction-sized region at the centre of the doughnut. The resolution is:

\[
\Delta r_\text{STED} = \frac{1.22\lambda/\text{NA}}{\sqrt{1 + I/I_\text{sat}}}
\]

where \(I\) is the STED beam intensity and \(I_\text{sat}\) is the saturation intensity of the fluorophore. For \(I/I_\text{sat} = 1000\): \(\Delta r_\text{STED} \approx \Delta r_\text{diffraction}/32 \approx 10\) nm — resolving individual protein complexes within a living cell.

## 31.4 Spectrometers and Spectroscopy

The spectrometer is the primary analytical instrument of atomic and molecular physics, astrophysics, chemistry, and materials science. All spectrometers measure the wavelength distribution of light — the **spectrum** — by dispersing different wavelengths to different positions. The two main dispersive elements are prisms (refraction) and gratings (diffraction).

**Prism spectrometers** have high throughput (no diffraction orders to waste light) but non-uniform dispersion (the angular separation per unit wavelength increases at shorter wavelengths, because \(dn/d\lambda\) is larger at shorter wavelengths for normal dispersion). The resolving power of a prism is:

\[
\mathcal{R} = b\left|\frac{dn}{d\lambda}\right|
\]

where \(b\) is the base length of the prism and \(dn/d\lambda\) is the dispersion of the glass. For a 5 cm flint glass prism (\(dn/d\lambda \approx 1.1\times10^5\) m\(^{-1}\) at 589 nm): \(\mathcal{R} \approx 5500\). This is modest compared to a diffraction grating.

**Grating spectrometers** are preferred for high resolving power. The Czerny-Turner layout (one concave collimating mirror, a plane grating, one concave focusing mirror) is the standard design. Modern high-resolution spectrographs (HARPS at the ESO La Silla Observatory) use an echelle grating in a cross-dispersed configuration, achieving \(\mathcal{R} = 115{,}000\) across the full optical band (380–690 nm) in a single exposure. This resolving power allows measurement of stellar radial velocities to \(\pm 0.5\) m/s — the technology behind the detection of Earth-mass exoplanets.

**Fourier transform spectrometers** (FTS) — essentially Michelson interferometers with a scanning mirror — measure the temporal coherence function \(\Gamma(\tau)\) and recover the spectrum by Fourier transformation (Wiener-Khinchin theorem). The advantages over dispersive spectrometers are the **Fellgett advantage** (all spectral elements are measured simultaneously, improving SNR by \(\sqrt{N}\) where \(N\) is the number of resolved spectral elements) and the **Jacquinot advantage** (no entrance slit needed, allowing larger étendue). FTS dominates infrared spectroscopy, where detector noise (rather than photon noise) is limiting — the Fellgett advantage is decisive in this regime.

---

# Chapter 32: Light Propagation in Anisotropic and Gradient-Index Media

## 32.1 Birefringence — Crystal Optics

In an anisotropic medium (a crystal without cubic symmetry), the dielectric constant is a tensor rather than a scalar: \(\mathbf{D} = \boldsymbol{\varepsilon}\cdot\mathbf{E}\). This means that the electric displacement \(\mathbf{D}\) is not in general parallel to \(\mathbf{E}\). The consequence is **birefringence**: a wave propagating in the crystal (in general) splits into two orthogonally polarised eigenwaves — the **ordinary** (o) wave and the **extraordinary** (e) wave — which travel at different phase velocities.

For a **uniaxial crystal** (with one unique symmetry axis, the **optic axis** or **c-axis**), the ordinary refractive index \(n_o\) is the same for all propagation directions, while the extraordinary index \(n_e(\theta)\) depends on the angle \(\theta\) between the propagation direction and the optic axis:

\[
\frac{1}{n_e^2(\theta)} = \frac{\cos^2\theta}{n_o^2} + \frac{\sin^2\theta}{n_e^2}
\]

where \(n_e = n_e(90°)\) is the principal extraordinary index. For calcite (the classical example): \(n_o = 1.658\), \(n_e = 1.486\) — a large birefringence \(\Delta n = n_o - n_e = 0.172\). A 1 mm thick calcite plate introduces a path difference of \(\Delta n \times d = 0.172\) mm \(= 172{,}000\) nm — about 310 wavelengths at 550 nm, or 310 wave plate orders. This is why a calcite crystal placed on printed text shows a double image with the naked eye — the o and e images are displaced by a visible amount.

**Positive uniaxial crystals** (\(n_e > n_o\): quartz, ice, rutile) and **negative uniaxial crystals** (\(n_e < n_o\): calcite, sodium nitrate, lithium niobate) differ in the sign of birefringence. The distinction matters for phase-matching in nonlinear optics: the o and e indices can cross at a specific angle \(\theta_\text{PM}\) (the phase-matching angle), enabling efficient second-harmonic generation.

## 32.2 Gradient-Index Optics

A **gradient-index** (GRIN) medium has a continuously varying refractive index \(n(\mathbf{r})\). The ray equation in such a medium is:

\[
\frac{d}{ds}\!\left(n\frac{d\mathbf{r}}{ds}\right) = \nabla n
\]

This describes curved ray paths — the ray bends toward higher-index regions. For a **radial gradient** \(n(r) = n_0(1 - \alpha^2 r^2/2)\) (parabolic profile, smaller \(n\) at the edges):

The ray equation becomes a simple harmonic oscillator equation, \(\ddot{r} + \alpha^2 n_0 r = 0\), with solution \(r(z) = r_0\cos(\alpha z) + (u_0/\alpha)\sin(\alpha z)\) — the ray undergoes sinusoidal oscillations. This is the **GRIN lens**: a radially varying refractive index focuses light without any curved surfaces. The transfer matrix for a GRIN lens of length \(L\) is:

\[
M_\text{GRIN} = \begin{pmatrix}\cos(\alpha L) & \sin(\alpha L)/\alpha \\ -\alpha\sin(\alpha L) & \cos(\alpha L)\end{pmatrix}
\]

At length \(L = \pi/(2\alpha)\) (a quarter-pitch GRIN rod): \(M = \begin{pmatrix}0 & 1/\alpha \\ -\alpha & 0\end{pmatrix}\) — this acts like a thin lens with focal length \(f = 1/\alpha\). GRIN rods (Selfoc lenses) are used as fibre-coupling elements in telecommunications: they are small cylindrical rods, flat on both ends, that focus or collimate light without requiring any curved surfaces. GRIN optics is also the basis of the mammalian eye lens, which has a higher refractive index at its centre (\(n \approx 1.40\)) than at its periphery (\(n \approx 1.37\)), providing additional focusing power without the strong curvature that would be needed for a homogeneous lens of the same power.
