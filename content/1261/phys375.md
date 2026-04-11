---
title: "PHYS 375: Stars"
prof: "Avery Broderick"
subjects: "PHYS"
---

## Sources and References

These notes synthesize material from the following textbooks and standard references. They are not transcribed from any specific term's lectures.

**Primary textbook**
- B. W. Ryden and B. M. Peterson, *Foundations of Astrophysics* (Addison-Wesley, 2010)

**Supplementary texts**
- F. H. Shu, *The Physical Universe: An Introduction to Astronomy* (University Science Books, 1982) — Parts II & III
- E. Böhm-Vitense, *Introduction to Stellar Astrophysics*, Vols. 1–3 (Cambridge University Press, 1989–1992)
- R. Kippenhahn and A. Weigert, *Stellar Structure and Evolution* (Springer, 1990)
- D. Prialnik, *An Introduction to the Theory of Stellar Structure and Evolution*, 2nd ed. (Cambridge University Press, 2009)

**Online resources**
- SIMBAD Astronomical Database — simbad.u-strasbg.fr
- NASA ADS (Astrophysics Data System) — ui.adsabs.harvard.edu

---

# Chapter 1: Observational Foundations

## Distances and Parallax

The most fundamental challenge in observational astronomy is determining how far away celestial objects are. Unlike distances on Earth, we cannot pace off the distance to a star — we must infer it from geometry, from the physics of radiation, or from the properties of standard candles. The hierarchy of distance measurement techniques is known as the **cosmic distance ladder**, and its first rung rests on pure geometry: **trigonometric parallax**.

As the Earth orbits the Sun, a nearby star appears to shift its position against the background of more distant stars. This shift is the parallax angle, and its measurement provides a direct, model-independent distance. Formally, if we observe a star at two epochs separated by six months (when Earth is on opposite sides of its orbit), the star traces out a small ellipse on the sky. The semi-major axis of this ellipse, measured in arcseconds, is the **parallax angle** \(p\).

The **parsec** is defined precisely as the distance at which a star has a parallax of exactly one arcsecond. In terms of this definition,

\[
d = \frac{1}{p''}\ \text{pc},
\]

where \(p''\) is the parallax in arcseconds and \(d\) is the distance in parsecs. One parsec equals \(3.086 \times 10^{16}\ \text{m} = 3.26\ \text{ly}\). The nearest star system, Alpha Centauri, has \(p \approx 0.747''\), placing it at \(d \approx 1.34\ \text{pc}\).

The baseline for this measurement is 1 AU (the Earth-Sun distance, \(1\ \text{AU} = 1.496 \times 10^{11}\ \text{m}\)), giving a simple geometric relationship: \(\tan p = 1\ \text{AU}/d\), which for small angles reduces to \(p \approx 1\ \text{AU}/d\). The practical limit of ground-based parallax measurement is around \(p \gtrsim 0.01''\), i.e., distances up to \(\sim 100\ \text{pc}\). The Hipparcos satellite extended this to \(\sim 1000\ \text{pc}\), and the ongoing Gaia mission achieves microarcsecond precision, measuring parallaxes of stars throughout much of the Galaxy.

Beyond parallax, distances are inferred through **spectroscopic parallax** (comparing observed apparent magnitude to absolute magnitude estimated from a star's spectrum), **standard candles** (Cepheid variable stars, Type Ia supernovae), and **standard rulers** (the angular size of objects of known physical size). Each rung of the distance ladder builds on the previous one, propagating uncertainties upward.

## Magnitudes and Filters

### The Magnitude System

The apparent brightness of a star as seen from Earth is its **flux** \(F\), measured in watts per square metre. The human eye, however, responds logarithmically to brightness, a psychophysical fact formalized by Hipparchus in antiquity: he ranked stars from first magnitude (brightest) to sixth magnitude (faintest visible to the naked eye). The modern magnitude system, placed on a rigorous quantitative footing by Norman Pogson in 1856, preserves this logarithmic character and this inverted sense (brighter objects have smaller, or more negative, magnitudes).

The **apparent magnitude** \(m\) is defined such that a difference of 5 magnitudes corresponds exactly to a factor of 100 in flux. Therefore a difference of 1 magnitude corresponds to a flux ratio of \(100^{1/5} = 10^{0.4} \approx 2.512\). The Pogson relation between two stars is

\[
m_1 - m_2 = -2.5 \log_{10}\!\left(\frac{F_1}{F_2}\right).
\]

Equivalently, if we adopt a reference flux \(F_0\) (the flux of a zero-magnitude star), then

\[
m = -2.5 \log_{10}\!\left(\frac{F}{F_0}\right).
\]

Two common magnitude systems are in use. In the **Vega system**, the star Vega (\(\alpha\) Lyrae) is defined to have \(m = 0\) in all photometric bands. In the **AB system**, the reference is a flat spectrum (constant \(F_\nu\)) with \(F_\nu = 3631\ \text{Jy}\) at all frequencies. Modern surveys typically use the AB system.

### Absolute Magnitude and Distance Modulus

The **absolute magnitude** \(M\) is defined as the apparent magnitude a star would have if placed at a standard distance of 10 pc. Since flux falls as \(1/d^2\), moving a star from 10 pc to distance \(d\) decreases its flux by \((10/d)^2\), so

\[
m - M = -2.5 \log_{10}\!\left(\frac{10}{d}\right)^2 = 5 \log_{10}\!\left(\frac{d}{10\ \text{pc}}\right) = 5 \log_{10} d - 5,
\]

where \(d\) is in parsecs. The quantity \(\mu = m - M\) is the **distance modulus**. For nearby stars measured by parallax, \(d = 1/p''\) pc, so

\[
\mu = 5\log_{10}\!\left(\frac{1}{p''}\right) - 5 = -5\log_{10} p'' - 5.
\]

The Sun has \(M_V = +4.83\) and \(m_V = -26.74\). Sirius, the brightest star in the sky, has \(m_V = -1.46\) and \(M_V = +1.43\), placing it at about 2.6 pc.

### Photometric Filters and Colour

Real observations are made through **photometric filters** that transmit only a defined band of wavelengths. The classical **Johnson-Cousins** broadband system uses filters designated \(U\) (ultraviolet, centred near 365 nm), \(B\) (blue, 440 nm), \(V\) (visual, 550 nm), \(R\) (red, 640 nm), and \(I\) (near-infrared, 800 nm). Extended systems include \(J\), \(H\), \(K\) bands in the infrared. The Sloan Digital Sky Survey introduced the \(ugriz\) system now dominant in wide-field surveys.

A star's **colour** is the difference in magnitudes between two bands. The \(B - V\) colour index is the most commonly used:

\[
B - V = m_B - m_V.
\]

Hot, blue stars (like O and B types) have negative \(B - V\), while cool, red stars have large positive \(B - V\). Because colour reflects the shape of the spectral energy distribution, it is directly related to surface temperature. For a blackbody, Wien's displacement law (\(\lambda_\text{max} T = 2.898 \times 10^{-3}\ \text{m\,K}\)) sets the peak wavelength, and the colour indices are monotonic functions of temperature.

### Bolometric Magnitudes

The **bolometric magnitude** \(m_\text{bol}\) accounts for all radiation across all wavelengths. The conversion from \(V\)-band to bolometric magnitude requires a **bolometric correction** \(BC_V\):

\[
m_\text{bol} = m_V + BC_V.
\]

By convention, \(BC_V = 0\) for a star of spectral type F5 V, and \(|BC_V|\) is largest for the hottest and coolest stars (which emit most of their radiation outside the \(V\) band). The **bolometric luminosity** \(L\) of a star is related to absolute bolometric magnitude by

\[
M_\text{bol} - M_{\text{bol},\odot} = -2.5\log_{10}\!\left(\frac{L}{L_\odot}\right),
\]

where \(M_{\text{bol},\odot} = 4.74\) and \(L_\odot = 3.828 \times 10^{26}\ \text{W}\). Since a star of luminosity \(L\) and radius \(R\) radiates as a blackbody at surface temperature \(T_\text{eff}\),

\[
L = 4\pi R^2 \sigma T_\text{eff}^4,
\]

where \(\sigma = 5.671 \times 10^{-8}\ \text{W m}^{-2}\ \text{K}^{-4}\) is the Stefan–Boltzmann constant. This relation connects the four fundamental stellar observables: \(L\), \(R\), \(T_\text{eff}\), and the bolometric magnitude.

## Binary Stars

### Why Binaries Matter

Binary and multiple star systems are invaluable laboratories for stellar physics because they allow us to measure stellar masses, the quantity that most fundamentally determines a star's fate. A single star reveals its luminosity (from flux and distance), its surface temperature (from colour or spectrum), and its radius (from \(L\) and \(T_\text{eff}\)), but not its mass directly. In a gravitationally bound binary, the orbital mechanics encode the masses through Kepler's laws.

Observationally, binary systems are classified by the method of detection:

- **Visual binaries**: both components are separately resolved on the sky. Long-term astrometric monitoring traces out the orbits.
- **Spectroscopic binaries**: the two stars are unresolved but their orbital velocities produce periodic Doppler shifts in their spectral lines. If both components are visible in the spectrum, it is a **double-lined spectroscopic binary** (SB2); if only one is visible, it is SB1.
- **Eclipsing binaries**: the orbital plane is aligned nearly edge-on to our line of sight, so the stars periodically transit in front of one another, producing characteristic light curve dips.
- **Astrometric binaries**: only one star is visible, but its proper motion on the sky wobbles due to the gravitational pull of an unseen companion.

### Masses from Visual Binaries

For a visual binary with measured angular separation, known distance, and measured orbital period \(P\), Kepler's third law in its Newtonian form gives the sum of masses:

\[
M_1 + M_2 = \frac{4\pi^2 a^3}{G P^2},
\]

where \(a\) is the semi-major axis of the relative orbit (in physical units, obtained from the angular separation and the distance). To determine individual masses, we use the centre-of-mass condition: each star orbits the centre of mass, so

\[
M_1 a_1 = M_2 a_2, \qquad a = a_1 + a_2,
\]

where \(a_1\) and \(a_2\) are the distances from each star to the centre of mass. Measuring the angular separations of each star from the system's photocentric barycentre yields the mass ratio \(M_1/M_2 = a_2/a_1\), and combined with the mass sum, gives individual masses.

### Masses from Spectroscopic Binaries

For a spectroscopic binary, we measure radial velocities \(v_{r,1}\) and \(v_{r,2}\) (the components of orbital velocity projected along the line of sight). For circular orbits with inclination \(i\) to the plane of the sky,

\[
v_{r,1} = v_1 \sin i, \qquad v_{r,2} = v_2 \sin i,
\]

where \(v_1 = 2\pi a_1/P\) and \(v_2 = 2\pi a_2/P\) are the orbital speeds. Combining these,

\[
a_1 \sin i = \frac{P v_{r,1}}{2\pi}, \qquad a_2 \sin i = \frac{P v_{r,2}}{2\pi}.
\]

Substituting into Kepler's third law yields the **mass function**:

\[
\frac{(M_2 \sin i)^3}{(M_1 + M_2)^2} = \frac{P(v_{r,1})^3}{2\pi G} \qquad \text{(SB1)},
\]

or, for a double-lined binary,

\[
M_1 \sin^3 i = \frac{P}{2\pi G}(v_{r,1} + v_{r,2})^2 v_{r,2},
\quad
M_2 \sin^3 i = \frac{P}{2\pi G}(v_{r,1} + v_{r,2})^2 v_{r,1}.
\]

The factor \(\sin^3 i\) introduces an inclination ambiguity — unless the orbit is eclipsing (\(i \approx 90^\circ\)), we measure only the minimum masses \(M \sin^3 i\).

### Radii from Eclipsing Binaries

An eclipsing binary provides the inclination (from the shape of the eclipse light curve) and, combined with spectroscopic data, yields masses free of the \(\sin i\) ambiguity. Moreover, the **durations** of the eclipses encode the stellar radii. During ingress (the time for the smaller star to move its own diameter relative to the larger), the radial velocity and orbital geometry give

\[
R_1 + R_2 \approx v_\text{orb} \cdot \frac{t_\text{total}}{2}, \qquad R_1 - R_2 \approx v_\text{orb} \cdot \frac{t_\text{flat}}{2},
\]

where \(t_\text{total}\) is the total eclipse duration and \(t_\text{flat}\) is the duration of totality. In practice, careful modelling of the light curve shape and radial velocity curve simultaneously gives both masses and radii to a few per cent precision. These measurements establish the **mass-radius relation** for main-sequence stars, one of the key empirical inputs to stellar structure theory.

---

# Chapter 2: Radiation and Stellar Atmospheres

## Blackbody Radiation

### Thermodynamic Equilibrium and the Planck Function

The atmosphere of a star is, to a first approximation, a gas in or near **local thermodynamic equilibrium** (LTE). In true thermodynamic equilibrium, every process is exactly balanced by its reverse (detailed balance), and the radiation field is described by the **Planck function** — the specific intensity of blackbody radiation at temperature \(T\):

\[
B_\nu(T) = \frac{2h\nu^3}{c^2} \cdot \frac{1}{e^{h\nu/kT} - 1},
\]

where \(h = 6.626 \times 10^{-34}\ \text{J s}\) is Planck's constant, \(k = 1.381 \times 10^{-23}\ \text{J K}^{-1}\) is Boltzmann's constant, \(c = 3 \times 10^8\ \text{m s}^{-1}\) is the speed of light, and \(\nu\) is the frequency. The units of \(B_\nu\) are \(\text{W m}^{-2}\ \text{Hz}^{-1}\ \text{sr}^{-1}\).

The Planck function can also be expressed per unit wavelength:

\[
B_\lambda(T) = \frac{2hc^2}{\lambda^5} \cdot \frac{1}{e^{hc/\lambda kT} - 1}.
\]

**Limiting forms** of the Planck function are important in different regimes. In the **Rayleigh–Jeans limit** (\(h\nu \ll kT\), the long-wavelength or low-frequency limit), the exponential can be expanded: \(e^{h\nu/kT} - 1 \approx h\nu/kT\), giving

\[
B_\nu(T) \approx \frac{2\nu^2 kT}{c^2} \qquad (h\nu \ll kT).
\]

This was the classical result derived before quantum mechanics, which diverged catastrophically at high frequencies (the "ultraviolet catastrophe"). In the **Wien limit** (\(h\nu \gg kT\)), the exponential dominates:

\[
B_\nu(T) \approx \frac{2h\nu^3}{c^2} e^{-h\nu/kT} \qquad (h\nu \gg kT).
\]

### Wien's Displacement Law and Stefan–Boltzmann Law

The frequency at which \(B_\nu\) peaks is found by solving \(\partial B_\nu/\partial\nu = 0\), yielding

\[
h\nu_\text{max} = 2.821\, kT, \quad \text{i.e.,} \quad \nu_\text{max} = 5.88 \times 10^{10}\ T\ \text{Hz K}^{-1}.
\]

For the wavelength form, \(\partial B_\lambda/\partial\lambda = 0\) gives **Wien's displacement law**:

\[
\lambda_\text{max} T = 2.898 \times 10^{-3}\ \text{m K}.
\]

The Sun's surface temperature is \(T_\odot \approx 5778\ \text{K}\), giving \(\lambda_\text{max} \approx 502\ \text{nm}\) — green light, near the peak sensitivity of the human eye. A star of \(T = 30{,}000\ \text{K}\) peaks at \(\sim 100\ \text{nm}\) in the ultraviolet; a brown dwarf at \(1000\ \text{K}\) peaks at \(2.9\ \mu\text{m}\) in the infrared.

Integrating the Planck function over all frequencies and all upward directions gives the total flux emitted per unit surface area of a blackbody:

\[
F = \int_0^\infty \pi B_\nu \,d\nu = \sigma T^4,
\]

where \(\sigma = 2\pi^5 k^4/(15 c^2 h^3) = 5.671 \times 10^{-8}\ \text{W m}^{-2}\ \text{K}^{-4}\) is the **Stefan–Boltzmann constant**. The luminosity of a star of radius \(R\) and effective temperature \(T_\text{eff}\) therefore follows immediately:

\[
\boxed{L = 4\pi R^2 \sigma T_\text{eff}^4.}
\]

This is one of the most important relations in stellar astrophysics. Note that \(T_\text{eff}\) is defined by this equation — it is the temperature a blackbody of the same radius would need to have in order to produce the observed luminosity. The real stellar atmosphere is not a perfect blackbody, but for most purposes the effective temperature is a useful characterization of the stellar surface.

### Radiation Quantities

To set up radiative transfer, we need precise definitions of several radiation quantities. The **specific intensity** \(I_\nu(\hat{n})\) is the energy transported per unit time, per unit area perpendicular to direction \(\hat{n}\), per unit solid angle, per unit frequency. It has units of \(\text{W m}^{-2}\ \text{Hz}^{-1}\ \text{sr}^{-1}\). Along a ray in empty space, \(I_\nu\) is conserved (it does not fall with distance).

The **mean intensity** averages over all directions:

\[
J_\nu = \frac{1}{4\pi}\int I_\nu\,d\Omega.
\]

The **flux** in a given direction is:

\[
F_\nu = \int I_\nu \cos\theta\,d\Omega,
\]

where \(\theta\) is the angle between the ray and the outward normal. The radiation pressure and energy density involve the second angular moment.

## Spectral Lines and Atomic Physics

### The Bohr Atom and Hydrogen Energy Levels

The discrete **spectral lines** seen in stellar spectra arise from transitions between quantized energy levels of atoms. For hydrogen, the simplest and most abundant atom, the energy levels are given by the Bohr formula:

\[
E_n = -\frac{13.6\ \text{eV}}{n^2}, \qquad n = 1, 2, 3, \ldots
\]

The ground state is \(n=1\) (\(E_1 = -13.6\ \text{eV}\)); the ionization limit is \(E_\infty = 0\). A photon emitted or absorbed in a transition between levels \(n_i\) and \(n_f\) has energy

\[
h\nu = E_{n_i} - E_{n_f} = 13.6\ \text{eV} \left(\frac{1}{n_f^2} - \frac{1}{n_i^2}\right),
\]

which gives the **Rydberg formula**. The series of transitions to/from the ground state (\(n_f = 1\)) are the **Lyman series** (ultraviolet); transitions to/from \(n_f = 2\) are the **Balmer series** (optical: H\(\alpha\) at 656.3 nm, H\(\beta\) at 486.1 nm, ...); transitions to/from \(n_f = 3\) are the **Paschen series** (near-infrared).

### The Boltzmann and Saha Equations

The strengths of spectral lines depend on how many atoms are in the appropriate excitation state and ionization stage. Two statistical mechanics results govern these populations.

The **Boltzmann equation** gives the ratio of the number of atoms in excited state \(b\) (with energy \(E_b\) and degeneracy \(g_b\)) to those in state \(a\) (with energy \(E_a < E_b\)):

\[
\frac{N_b}{N_a} = \frac{g_b}{g_a} e^{-(E_b - E_a)/kT}.
\]

More generally, the fraction of atoms in state \(n\) is \(N_n/N = g_n e^{-E_n/kT}/Z(T)\), where \(Z(T) = \sum_n g_n e^{-E_n/kT}\) is the **partition function**.

The **Saha equation** describes the ionization equilibrium between successive ionization stages. For the transition from stage \(r\) (with \(N_r\) atoms per unit volume) to stage \(r+1\) (with \(N_{r+1}\) atoms) and free electrons (with number density \(n_e\)):

\[
\frac{N_{r+1} n_e}{N_r} = \frac{2 Z_{r+1}}{Z_r}\left(\frac{2\pi m_e kT}{h^2}\right)^{3/2} e^{-\chi_r/kT},
\]

where \(\chi_r\) is the ionization energy from stage \(r\) to stage \(r+1\), \(m_e\) is the electron mass, and \(Z_r\), \(Z_{r+1}\) are partition functions. The factor \((2\pi m_e kT/h^2)^{3/2}\) is the inverse of the thermal de Broglie volume, encoding the quantum statistical weight of the free electrons.

The Saha equation has profound observational consequences: it explains why the Balmer lines of hydrogen are strongest not in the coolest or hottest stars, but at intermediate temperatures around 10,000 K. At \(T < 5000\ \text{K}\), most hydrogen is neutral and in the ground state, so few atoms are in \(n=2\) to absorb Balmer photons. At \(T > 25{,}000\ \text{K}\), most hydrogen is fully ionized and there are again few absorbers. The Balmer series peaks near \(T \approx 10{,}000\ \text{K}\), where a significant fraction of atoms are neutral but excited to \(n=2\) by collisions.

### Line Broadening Mechanisms

Real spectral lines are not infinitely narrow delta functions in frequency. Several physical mechanisms broaden them:

**Natural broadening** arises from the Heisenberg uncertainty principle: because an excited state has a finite lifetime \(\Delta t = 1/A_{ul}\) (where \(A_{ul}\) is the Einstein A coefficient for spontaneous emission), its energy is uncertain by \(\Delta E \approx \hbar/\Delta t\), producing a Lorentzian line profile of width \(\Delta\nu_\text{nat} = A_{ul}/2\pi\). This is typically very narrow (\(\sim 10^{-4}\ \text{nm}\)).

**Thermal (Doppler) broadening** occurs because atoms in a gas have a Maxwell–Boltzmann velocity distribution. The Doppler shift of an atom moving at velocity \(v_r\) along the line of sight is \(\Delta\nu = \nu_0 v_r/c\). Integrating over the Maxwell–Boltzmann distribution gives a Gaussian profile with full width at half maximum

\[
\Delta\nu_D = \frac{\nu_0}{c}\sqrt{\frac{8 kT \ln 2}{m}},
\]

where \(m\) is the atomic mass. This typically dominates over natural broadening.

**Pressure (collisional) broadening** results from collisions between atoms disturbing the quantum states. It produces a Lorentzian profile with width proportional to the collision rate, hence to gas density. In stellar atmospheres this is important in denser, cooler stars.

**Rotational broadening** smears lines because different parts of the stellar disc are Doppler-shifted by the rotation \(v \sin i\). This produces a characteristic flat-bottomed or rounded profile.

The convolution of a Gaussian (Doppler) and a Lorentzian (natural + pressure) profile gives a **Voigt profile**, which is standard in detailed spectral analysis.

## Radiative Transfer

### The Transfer Equation

Radiation propagating through a medium is both absorbed (and scattered out of the beam) and emitted (both thermally and by scattering into the beam). The **equation of radiative transfer** describes how the specific intensity \(I_\nu\) changes along a ray path \(s\):

\[
\frac{dI_\nu}{ds} = -\kappa_\nu \rho\, I_\nu + j_\nu,
\]

where \(\kappa_\nu\) (\(\text{m}^2\ \text{kg}^{-1}\)) is the **opacity** (absorption cross-section per unit mass) and \(j_\nu\) (\(\text{W m}^{-3}\ \text{Hz}^{-1}\ \text{sr}^{-1}\)) is the **emissivity**. The quantity \(\kappa_\nu \rho\) has units of \(\text{m}^{-1}\) and is the absorption coefficient per unit length.

It is conventional to introduce the **optical depth** \(\tau_\nu\) measured inward from the surface:

\[
d\tau_\nu = -\kappa_\nu \rho\,ds,
\]

so that \(\tau_\nu = 0\) at the surface and increases inward. The transfer equation becomes

\[
\frac{dI_\nu}{d\tau_\nu} = I_\nu - S_\nu,
\]

where \(S_\nu = j_\nu/(\kappa_\nu \rho)\) is the **source function**. In LTE, detailed balance requires \(S_\nu = B_\nu(T)\), the Planck function — this is **Kirchhoff's law**.

### Formal Solution

The transfer equation along a ray at angle \(\theta\) to the outward normal (\(\mu = \cos\theta\)) through a plane-parallel atmosphere is

\[
\mu \frac{dI_\nu}{d\tau_\nu} = I_\nu - S_\nu.
\]

The formal solution (integrating inward from the surface to optical depth \(\tau_\nu\)) gives the emergent intensity at the surface:

\[
I_\nu(\tau_\nu = 0, \mu) = \int_0^\infty S_\nu(\tau_\nu') e^{-\tau_\nu'/\mu} \frac{d\tau_\nu'}{\mu}.
\]

This is the **Eddington–Barbier relation** in integral form. The key physical insight is that the emergent intensity is a weighted average of the source function, weighted by the factor \(e^{-\tau_\nu'/\mu}/\mu\), which peaks at \(\tau_\nu' \approx \mu\). In other words, **we see to an optical depth of about unity along any given ray**. When we observe the solar disc at centre (\(\mu = 1\)), we see to \(\tau \approx 1\); at the limb (\(\mu \to 0\)), we see to shallower, cooler layers. This explains **solar limb darkening**: the limb appears darker because we are sampling cooler gas.

The Eddington–Barbier approximation states that the emergent intensity is approximately equal to the source function evaluated at \(\tau_\nu = \mu\):

\[
I_\nu(\tau_\nu = 0, \mu) \approx S_\nu(\tau_\nu = \mu).
\]

If \(S_\nu = B_\nu(T)\) and \(T\) increases inward, the limb (where we see to smaller \(\tau\)) is cooler and therefore darker — exactly as observed.

### Absorption and Emission Lines

The formation of spectral lines is understood from the source function argument. In the continuum, \(S_\nu \approx B_\nu(T)\). At a line frequency, the opacity is greatly enhanced, so the same optical depth is reached at a shallower (cooler) layer. If \(T\) decreases outward (as in normal stellar photospheres), the source function at the line frequency is lower than the continuum source function. The emergent intensity at the line is therefore less than in the continuum — producing an **absorption line**.

Conversely, if the temperature increases outward (a **temperature inversion**), line frequencies probe hotter layers and the emergent intensity exceeds the continuum — producing **emission lines**. The solar chromosphere exhibits this inversion; the cores of the \(\text{Ca\,II}\) H and K lines show central emission reversals.

---

# Chapter 3: Stellar Classification

## The Harvard Spectral Sequence

### The MK Classification System

In the 1880s–1910s, astronomers at Harvard Observatory (principally Annie Jump Cannon, working with Edward Pickering) classified hundreds of thousands of stellar spectra according to the strength of their spectral features. The resulting **Harvard spectral classification** arranges stars into types labelled O, B, A, F, G, K, M (from hottest to coolest). The mnemonic "Oh Be A Fine Girl/Guy, Kiss Me" is traditional. Two extensions have since been added for the coolest objects: **L** (brown dwarfs, \(T \sim 1300{-}2000\ \text{K}\)) and **T** (methane brown dwarfs, \(T < 1300\ \text{K}\)), with **Y** dwarfs extending below \(\sim 500\ \text{K}\).

Each letter type is subdivided into ten subtypes from 0 to 9 (e.g., A0, A1, ..., A9, F0, ...). The Sun is type G2.

The key diagnostic features of each spectral type reflect the temperature-sensitive populations predicted by the Saha and Boltzmann equations:

- **O stars** (\(T_\text{eff} > 30{,}000\ \text{K}\)): highly ionized lines dominate — He\,II absorption, N\,III and O\,III emission in the most luminous examples. Hydrogen lines are present but weak.
- **B stars** (\(T_\text{eff} \approx 10{,}000{-}30{,}000\ \text{K}\)): He\,I lines are the hallmark. Hydrogen Balmer lines are present and strengthen toward later B subtypes.
- **A stars** (\(T_\text{eff} \approx 7{,}500{-}10{,}000\ \text{K}\)): Balmer series of hydrogen reaches maximum strength at A2. Ca\,II lines appear.
- **F stars** (\(T_\text{eff} \approx 6{,}000{-}7{,}500\ \text{K}\)): Balmer lines weaken; Ca\,II H and K lines strengthen; metallic lines appear.
- **G stars** (\(T_\text{eff} \approx 5{,}200{-}6{,}000\ \text{K}\)): Ca\,II H and K lines dominant; many neutral metal lines (Fe\,I, Mg\,I); CH molecular band (the "G band") appears.
- **K stars** (\(T_\text{eff} \approx 3{,}700{-}5{,}200\ \text{K}\)): metal lines dominate; hydrogen weakens; TiO molecular bands begin.
- **M stars** (\(T_\text{eff} < 3{,}700\ \text{K}\)): strong TiO and VO molecular bands; temperature too low for atomic excitation to be significant.

In the 1940s, Morgan and Keenan introduced the **MK system**, adding a **luminosity class** (Roman numeral) to the temperature class. The luminosity class is determined from **pressure-sensitive** spectral features: gravity-sensitive line widths and ratios of certain line strengths. Higher-gravity (denser, smaller) atmospheres exhibit pressure broadening, while lower-gravity giants show narrower lines. The classes are:

- **Ia, Ib**: Supergiants (most and less luminous)
- **II**: Bright giants
- **III**: Giants
- **IV**: Subgiants
- **V**: Main-sequence (dwarf) stars
- **VI** (or **sd**): Subdwarfs
- **VII** (or **D**): White dwarfs

The full MK classification thus gives a star two-dimensional coordinates in temperature and luminosity. The Sun is G2 V; Betelgeuse is M2 Ia; Sirius is A1 V; Arcturus is K1 III.

## The Hertzsprung–Russell Diagram

### Construction and Major Features

The **Hertzsprung–Russell diagram** (H–R diagram, or colour–magnitude diagram when plotted with observational quantities) is the central organizational tool of stellar astrophysics. Independently by Ejnar Hertzsprung (1911) and Henry Norris Russell (1913), astronomers plotted the luminosities or absolute magnitudes of stars against their effective temperatures or spectral types. The result revealed an astonishing structure: stars do not scatter randomly through the (\(T_\text{eff}\), \(L\)) plane but are confined to a few well-defined regions.

The standard H–R diagram has luminosity increasing upward (or equivalently, absolute magnitude increasing downward, since more negative means brighter) and temperature increasing to the left (historical convention, following the spectral sequence).

The major features are:

**The Main Sequence**: A narrow diagonal band running from the upper left (hot, luminous O stars) to the lower right (cool, dim M stars). The vast majority of all observed stars lie on the main sequence, which is why it was also called the **dwarf sequence** before its nature was understood. We now know that the main sequence represents stars burning hydrogen in their cores via thermonuclear fusion. Since hydrogen burning occupies the longest phase of a star's life — the timescale is the **nuclear timescale** \(\tau_\text{nuc} \sim M c^2 \varepsilon / L\) where \(\varepsilon \approx 0.007\) is the hydrogen-burning efficiency — most stars we observe are in this phase. The main sequence is not a sequence in time (a star does not evolve along it) but a sequence in mass: more massive stars are hotter and more luminous.

**The Giant Branch**: Extending to the upper right of the main sequence, the red giant branch consists of cool (\(T_\text{eff} \approx 3{,}000{-}5{,}000\ \text{K}\)), luminous (\(L \sim 10{-}1000\ L_\odot\)) stars with large radii (\(R \sim 10{-}100\ R_\odot\)). These are evolved stars that have exhausted hydrogen in their cores and are burning hydrogen in a shell surrounding an inert (or helium-burning) core. The **horizontal branch** is a nearly horizontal feature at \(L \sim 50\ L_\odot\), consisting of stars burning helium in their cores. The **asymptotic giant branch** (AGB) runs parallel to and above the red giant branch for stars burning helium in a shell.

**The White Dwarf Sequence**: A sparse, faint population in the lower left of the H–R diagram. White dwarfs are the exposed cores of stars that have shed their envelopes; they are hot (\(T_\text{eff} \sim 10{,}000{-}100{,}000\ \text{K}\)) but extremely faint because they are tiny (\(R \sim 0.01\ R_\odot\)). They cool over time, drifting rightward and downward along a cooling track.

**Supergiants**: At the very top of the H–R diagram (\(L \gtrsim 10^5\ L_\odot\)) lie both hot blue supergiants (upper left) and cool red supergiants (upper right). These are the most massive and most luminous stars, burning hydrogen and helium rapidly in their cores and evolving on timescales of millions of years.

### The Mass–Luminosity Relation

Along the main sequence, there is a tight **mass–luminosity relation**. Empirically, for main-sequence stars,

\[
\frac{L}{L_\odot} \approx \left(\frac{M}{M_\odot}\right)^\alpha,
\]

where \(\alpha \approx 4\) over a wide range of masses. We will derive this from stellar structure theory in Chapter 4. The steep dependence on mass has an important consequence: more massive stars are dramatically more luminous and therefore burn through their fuel far faster. The **main-sequence lifetime** is roughly

\[
\tau_\text{MS} \sim \frac{M \varepsilon c^2}{L} \approx \frac{M/M_\odot}{L/L_\odot} \times 10^{10}\ \text{yr} \approx \left(\frac{M}{M_\odot}\right)^{1-\alpha} \times 10^{10}\ \text{yr}.
\]

For \(\alpha = 4\), \(\tau_\text{MS} \propto M^{-3}\): a star ten times more massive than the Sun lives \(10^3 = 1000\) times less long. The Sun has \(\tau_\text{MS} \approx 10^{10}\ \text{yr}\); a 10 \(M_\odot\) star lives only \(\sim 3 \times 10^7\ \text{yr}\).

### The Stellar Mass Range

Main-sequence stars span a range of masses from roughly \(0.08\ M_\odot\) to \(\sim 150\ M_\odot\) (though the upper limit is debated). The lower limit is set by the **hydrogen-burning minimum mass**: below \(\sim 0.08\ M_\odot\), the core temperature never reaches the \(\sim 10^7\ \text{K}\) threshold for sustained hydrogen fusion. Objects below this limit are **brown dwarfs**, which burn deuterium briefly but then cool continuously as they radiate stored thermal energy. The upper mass limit is set by the **Eddington luminosity limit** (see below), beyond which radiation pressure exceeds gravity and the star cannot remain stable.

---

# Chapter 4: Stellar Structure

## Hydrostatic Equilibrium

### The Condition for Equilibrium

A star is, to a very good approximation, a self-gravitating ball of gas in **hydrostatic equilibrium**: the inward pull of gravity on each mass element is exactly balanced by the outward pressure gradient force. To derive the condition, consider a thin shell of gas at radius \(r\) with thickness \(dr\), density \(\rho(r)\), and cross-sectional area \(A\). The mass of the shell is \(dm = \rho A\,dr\).

The gravitational force on this shell is directed inward:

\[
dF_\text{grav} = -\frac{G M(r) dm}{r^2} = -\frac{G M(r) \rho A\,dr}{r^2},
\]

where \(M(r) = \int_0^r 4\pi r'^2 \rho(r')\,dr'\) is the mass enclosed within radius \(r\). The pressure force on the shell arises from the difference in pressure between its inner and outer faces:

\[
dF_\text{pressure} = [P(r) - P(r+dr)] A = -\frac{dP}{dr} A\,dr.
\]

Setting the net force to zero (equilibrium) gives the **equation of hydrostatic equilibrium**:

\[
\boxed{\frac{dP}{dr} = -\frac{G M(r) \rho}{r^2}.}
\]

This is the first of the four fundamental equations of stellar structure. It states that the pressure must decrease outward at a rate that supports the overlying weight of gas. We can also write it as \(dP/dr = -\rho g\), where \(g(r) = GM(r)/r^2\) is the local gravitational acceleration.

The companion equation, the **mass continuity equation**, simply states that the mass enclosed increases as we add up shells:

\[
\boxed{\frac{dM}{dr} = 4\pi r^2 \rho.}
\]

### The Virial Theorem and Central Pressure Estimate

The virial theorem provides a powerful order-of-magnitude tool. For a self-gravitating system in equilibrium, the total kinetic energy \(K\) and gravitational potential energy \(\Omega\) satisfy \(2K + \Omega = 0\), where \(K\) is interpreted as thermal energy for a gas. For an ideal monatomic gas, \(K = \frac{3}{2} N k T\), and \(\Omega \sim -GM^2/R\). This gives

\[
T_c \sim \frac{G M m_p}{k R} \sim 10^7\ \text{K} \left(\frac{M}{M_\odot}\right)\!\left(\frac{R_\odot}{R}\right),
\]

confirming that stellar cores must be at \(\sim 10^7\ \text{K}\), hot enough for nuclear reactions. For the Sun, with \(M_\odot = 1.989 \times 10^{30}\ \text{kg}\) and \(R_\odot = 6.96 \times 10^8\ \text{m}\), this gives \(T_c \sim 1.6 \times 10^7\ \text{K}\), consistent with detailed models.

The **central pressure** can be estimated by integrating hydrostatic equilibrium. Replacing \(g \approx GM/R^2\) and \(\rho \approx M/R^3\) throughout,

\[
P_c \sim \frac{G M^2}{R^4} \sim 2 \times 10^{16}\ \text{Pa} \left(\frac{M}{M_\odot}\right)^2\!\left(\frac{R_\odot}{R}\right)^4.
\]

For the Sun, \(P_c \sim 2 \times 10^{16}\ \text{Pa} \approx 2 \times 10^{11}\ \text{atm}\). Detailed models give \(P_{c,\odot} = 2.5 \times 10^{16}\ \text{Pa}\), so the estimate is remarkably good.

### The Equation of State

To close the system of equations, we need a relation between pressure and density (and temperature). For most stellar interiors (and the entire main sequence), the gas behaves as an **ideal gas** of ions and electrons:

\[
P = \frac{\rho k T}{\mu m_H},
\]

where \(\mu\) is the **mean molecular weight** per particle (including electrons) and \(m_H = 1.673 \times 10^{-27}\ \text{kg}\) is the hydrogen mass. For fully ionized hydrogen, each hydrogen atom contributes one proton and one electron, so \(\mu = 1/2\). For a fully ionized gas of hydrogen mass fraction \(X\), helium fraction \(Y\), and metal fraction \(Z \approx 0\), we have

\[
\mu = \frac{1}{2X + 3Y/4 + Z/2} \approx \frac{4}{5X + 3}.
\]

For solar composition (\(X \approx 0.72\), \(Y \approx 0.26\)), \(\mu \approx 0.62\).

**Radiation pressure** also contributes, especially in hot massive stars:

\[
P_\text{rad} = \frac{a T^4}{3} = \frac{4\sigma T^4}{3c},
\]

where \(a = 4\sigma/c = 7.566 \times 10^{-16}\ \text{J m}^{-3}\ \text{K}^{-4}\) is the radiation constant. The total pressure is \(P = P_\text{gas} + P_\text{rad}\). In the Sun's core, \(P_\text{rad}/P_\text{gas} \sim 10^{-3}\), negligible. In a star of \(M \sim 100\ M_\odot\), radiation pressure can approach the gas pressure.

## Energy Transport

### Three Mechanisms

Energy generated in the stellar core must be transported outward to the surface, where it is radiated away. Three mechanisms operate: **radiation**, **convection**, and **conduction**. In normal stars, conduction is negligible (relevant only in degenerate stellar remnants). The dominant mechanism in any given region depends on whether the temperature gradient required to carry the energy flux by radiation is steeper than the **adiabatic gradient** — in the latter case, convection sets in.

### Radiative Transport

In the **diffusion approximation** (valid deep inside a star where photons scatter many times before escaping), the radiative energy flux is related to the temperature gradient by:

\[
F_\text{rad} = -\frac{4acT^3}{3\kappa\rho}\frac{dT}{dr},
\]

where \(\kappa\) is the **Rosseland mean opacity** (an appropriately frequency-averaged opacity). The luminosity at radius \(r\) carried by radiation is \(L_r = 4\pi r^2 F_\text{rad}\), giving the **equation of radiative transport**:

\[
\boxed{\frac{dT}{dr} = -\frac{3\kappa\rho}{4acT^3}\frac{L_r}{4\pi r^2}.}
\]

This is the third stellar structure equation (the second is mass continuity). The minus sign indicates that temperature decreases outward (energy flows from hot core to cool surface). The opacity \(\kappa\) enters here crucially: a higher opacity impedes photon diffusion, requiring a steeper temperature gradient to carry the same flux.

A useful dimensionless measure is the **radiative temperature gradient**:

\[
\nabla_\text{rad} \equiv \left(\frac{d\ln T}{d\ln P}\right)_\text{rad} = \frac{3\kappa P L_r}{16\pi a c G M T^4}.
\]

### Convective Instability and the Schwarzschild Criterion

Convection occurs when a rising blob of gas remains buoyant compared to its surroundings. Consider a parcel displaced upward adiabatically (no heat exchange). It expands as the pressure decreases; if it remains denser than the ambient gas at its new position, it sinks back — the atmosphere is **stable**. If it is less dense than the surroundings, it continues to rise — the atmosphere is **unstable** and convection occurs.

The condition for instability is the **Schwarzschild criterion**:

\[
\nabla_\text{rad} > \nabla_\text{ad},
\]

where \(\nabla_\text{ad} = (\partial\ln T/\partial\ln P)_S\) is the **adiabatic temperature gradient**. For an ideal monatomic gas, \(\nabla_\text{ad} = (\gamma - 1)/\gamma = 2/5\) (since \(\gamma = 5/3\)). When the radiative gradient exceeds \(2/5\), the layering is convectively unstable.

In convective regions, the actual temperature gradient is very close to the adiabatic gradient (efficient convection), so in practice we often write \(dT/dr = (dT/dr)_\text{ad}\) in convective zones. This is the fourth effective relation that closes the system in convective regions.

In the Sun, the inner \(\sim 70\%\) of the radius is in **radiative equilibrium**, while the outer \(30\%\) is a **convection zone**. This convection zone is visible at the surface as the granulation pattern: bright convective cells \(\sim 1000\ \text{km}\) across that transport heat to the surface. In contrast, in massive O and B stars, the core is convective (because the CNO cycle is very temperature sensitive, leading to a steep luminosity gradient) while the envelope is radiative.

### Opacity

The opacity \(\kappa\) appearing in the transport equation depends on the physical state of the gas. Several processes contribute:

**Electron scattering (Thomson scattering)**: Free electrons scatter photons. The cross-section is the Thomson cross-section \(\sigma_T = 6.65 \times 10^{-29}\ \text{m}^2\), and the opacity is

\[
\kappa_\text{es} = \frac{\sigma_T}{m_H \mu_e} \approx 0.02(1 + X)\ \text{m}^2\ \text{kg}^{-1},
\]

where \(\mu_e\) is the mean molecular weight per electron. This opacity is independent of frequency and temperature, and dominates in hot, highly ionized interiors.

**Free-free absorption (bremsstrahlung)**: A photon is absorbed by a free electron in the Coulomb field of an ion. This gives a **Kramers opacity** scaling:

\[
\kappa_\text{ff} \propto \rho T^{-7/2}.
\]

**Bound-free absorption**: A bound electron absorbs a photon and is ionized. This also gives approximately Kramers scaling: \(\kappa_\text{bf} \propto \rho T^{-7/2}\).

**H\(^-\) opacity**: In cool stellar atmospheres (\(T \lesssim 7000\ \text{K}\)), hydrogen can capture a second electron to form the negative hydrogen ion H\(^-\). This ion is only weakly bound and absorbs photons across a broad wavelength range, dominating the opacity of G, K, and M star atmospheres. The H\(^-\) opacity depends sensitively on temperature and density.

### The Eddington Luminosity

Radiation exerts a pressure force on matter because photons carry momentum. The radiation pressure force per unit mass (the **radiative acceleration**) is

\[
g_\text{rad} = \frac{\kappa F}{c} = \frac{\kappa L}{4\pi r^2 c}.
\]

For the star to be in hydrostatic equilibrium, this must not exceed gravity: \(g_\text{rad} \leq g = GM/r^2\). Setting them equal gives the **Eddington luminosity**:

\[
L_\text{Edd} = \frac{4\pi G M c}{\kappa} \approx 1.3 \times 10^{31}\left(\frac{M}{M_\odot}\right)\text{W} \approx 3.3 \times 10^4 \left(\frac{M}{M_\odot}\right) L_\odot,
\]

for electron-scattering opacity. Stars with \(L > L_\text{Edd}\) cannot be in hydrostatic equilibrium and will shed mass via radiation-driven winds. This sets the upper mass limit of stars at roughly 150 \(M_\odot\).

## Energy Production: Nuclear Reactions

### Nuclear Physics Basics

The energy source of stars is **nuclear fusion**: the conversion of light nuclei into heavier ones, releasing energy because the products have slightly less mass than the reactants (the binding energy per nucleon increases from hydrogen to iron). For hydrogen burning, four hydrogen nuclei (total mass \(4 \times 1.008\ \text{u} = 4.032\ \text{u}\)) fuse to form one helium-4 nucleus (mass \(4.003\ \text{u}\)), with mass deficit \(\Delta m = 0.029\ \text{u}\) and energy release

\[
Q = \Delta m c^2 = 0.029 \times 931.5\ \text{MeV} = 26.7\ \text{MeV}.
\]

The efficiency is \(\varepsilon = Q/(4m_p c^2) = 26.7/(4 \times 938) \approx 0.7\%\). While seemingly small, this is orders of magnitude more efficient than chemical reactions.

The **nuclear timescale** is

\[
\tau_\text{nuc} = \frac{\varepsilon M c^2}{L} \approx 10^{10}\ \text{yr} \left(\frac{M}{M_\odot}\right)\!\left(\frac{L_\odot}{L}\right).
\]

For the Sun, with \(L = L_\odot\), this gives \(\tau_\text{nuc} \approx 10^{10}\ \text{yr}\), consistent with the age of the Solar System.

### The Gamow Peak and Reaction Rates

Nuclear reactions in stellar interiors involve two nuclei of charges \(Z_1 e\) and \(Z_2 e\) overcoming the Coulomb barrier at short range to allow the strong nuclear force to bind them. The Coulomb barrier height at nuclear separation \(r \sim 10^{-15}\ \text{m}\) is

\[
V_C = \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 r} \sim Z_1 Z_2 \times 1.4\ \text{MeV}.
\]

At stellar temperatures, \(kT \sim 1{-}10\ \text{keV}\) — far below the Coulomb barrier. Classically, the reaction cannot occur. However, quantum mechanical **tunnelling** through the Coulomb barrier allows rare reactions. The tunnelling probability is

\[
P_\text{tunnel} \propto \exp\!\left(-2\pi\eta\right), \qquad \eta = \frac{Z_1 Z_2 e^2}{4\pi\varepsilon_0 \hbar v} = \frac{Z_1 Z_2 e^2}{\hbar}\sqrt{\frac{\mu}{2E}},
\]

where \(\mu\) is the reduced mass and \(E\) is the centre-of-mass energy. At high energies, tunnelling is easy but few particles have such energies (Maxwell–Boltzmann suppression). At low energies, particles are plentiful but tunnelling is exponentially suppressed. The product of these two factors produces the **Gamow peak** — a narrow window of energies \(E_0\) that dominate the reaction rate:

\[
E_0 = \left(\frac{\pi Z_1 Z_2 e^2}{\sqrt{2} \hbar}\right)^{2/3} \left(\mu k T\right)^{1/3} \propto (Z_1 Z_2)^{2/3} T^{1/3}.
\]

For the proton-proton chain at \(T = 1.5 \times 10^7\ \text{K}\), \(E_0 \approx 6\ \text{keV}\).

The thermonuclear reaction rate per unit volume is approximately

\[
r_{12} \propto \rho^2 T^n e^{-\tau},
\]

where \(\tau \propto T^{-1/3}\) relates to the Gamow peak and \(n\) is an effective temperature power law. Because of the exponential sensitivity, nuclear reaction rates are very steep functions of temperature. For the pp chain, the effective power law near \(T = 1.5 \times 10^7\ \text{K}\) is \(\varepsilon_\text{pp} \propto T^4\), while for the CNO cycle at higher temperatures, \(\varepsilon_\text{CNO} \propto T^{18}\).

### Hydrogen-Burning Chains

**The proton–proton (pp) chain** is the dominant energy source in stars of mass \(\leq 1.5\ M_\odot\). It proceeds through several branches, the dominant one (pp-I) being:

\[
\text{p} + \text{p} \to \text{d} + e^+ + \nu_e \quad (Q = 0.42\ \text{MeV excluding neutrino})
\]
\[
\text{d} + \text{p} \to {}^3\text{He} + \gamma \quad (Q = 5.49\ \text{MeV})
\]
\[
{}^3\text{He} + {}^3\text{He} \to {}^4\text{He} + 2\text{p} \quad (Q = 12.86\ \text{MeV})
\]

The net result is \(4\text{p} \to {}^4\text{He} + 2e^+ + 2\nu_e + 26.7\ \text{MeV}\). The first step (p+p) is extremely slow because it requires the simultaneous weak-force conversion of a proton to a neutron; this bottleneck gives the Sun its long lifetime.

**The CNO cycle** dominates at temperatures above \(\sim 1.7 \times 10^7\ \text{K}\), which corresponds to stars more massive than \(\sim 1.5\ M_\odot\). It uses carbon, nitrogen, and oxygen as catalysts:

\[
{}^{12}\text{C} + \text{p} \to {}^{13}\text{N} + \gamma
\]
\[
{}^{13}\text{N} \to {}^{13}\text{C} + e^+ + \nu_e
\]
\[
{}^{13}\text{C} + \text{p} \to {}^{14}\text{N} + \gamma
\]
\[
{}^{14}\text{N} + \text{p} \to {}^{15}\text{O} + \gamma \quad (\text{slowest step})
\]
\[
{}^{15}\text{O} \to {}^{15}\text{N} + e^+ + \nu_e
\]
\[
{}^{15}\text{N} + \text{p} \to {}^{12}\text{C} + {}^{4}\text{He}
\]

The carbon is regenerated at the end, and the net result is again \(4\text{p} \to {}^4\text{He}\). The \({}^{14}\text{N} + \text{p}\) reaction is the slowest step, so equilibrium CNO cycling has most of the catalyst material in \({}^{14}\text{N}\). The extreme temperature sensitivity (\(\varepsilon \propto T^{18}\)) means CNO burning is concentrated in a tiny central region, driving convection.

### Helium and Later Burning

When hydrogen in the core is exhausted, the core contracts and heats until helium burning ignites at \(T \sim 10^8\ \text{K}\). The **triple-alpha process** fuses three helium nuclei into carbon:

\[
{}^4\text{He} + {}^4\text{He} \rightleftharpoons {}^8\text{Be} + \gamma \quad (\text{unstable, } \tau_{1/2} = 8.2 \times 10^{-17}\ \text{s})
\]
\[
{}^8\text{Be} + {}^4\text{He} \to {}^{12}\text{C}^* + \gamma \quad (\text{Hoyle resonance at } 7.65\ \text{MeV})
\]
\[
{}^{12}\text{C}^* \to {}^{12}\text{C} + 2\gamma
\]

The existence of the Hoyle resonance (a specific excited state of \({}^{12}\text{C}\) at just the right energy) was predicted by Fred Hoyle before it was experimentally found, because without it carbon could not be synthesized in stars. Carbon can then capture another alpha particle: \({}^{12}\text{C} + {}^4\text{He} \to {}^{16}\text{O} + \gamma\), competing with triple-alpha and setting the C/O ratio in stellar cores.

For stars massive enough to evolve further, subsequent burning stages occur: carbon burning (\(T \sim 5 \times 10^8\ \text{K}\)), neon burning (\(T \sim 10^9\ \text{K}\)), oxygen burning, and silicon burning (\(T \sim 3 \times 10^9\ \text{K}\)), ultimately building up to the iron-group elements. Since iron-56 has the highest binding energy per nucleon, no further energy can be released by fusion — fusion of iron is endothermic. This sets the stage for core collapse.

## The Stellar Structure Equations

### The Complete System

The complete set of **four equations of stellar structure** governs the internal properties of a star in spherical symmetry:

<div class="theorem">
<strong>The Four Equations of Stellar Structure</strong>

<strong>1. Mass continuity:</strong>
\[\frac{dM}{dr} = 4\pi r^2 \rho\]

<strong>2. Hydrostatic equilibrium:</strong>
\[\frac{dP}{dr} = -\frac{G M(r)\rho}{r^2}\]

<strong>3. Energy transport (radiative):</strong>
\[\frac{dT}{dr} = -\frac{3\kappa\rho}{4acT^3}\frac{L_r}{4\pi r^2}\]

<strong>4. Energy conservation:</strong>
\[\frac{dL_r}{dr} = 4\pi r^2 \rho\,\varepsilon\]

where \(\varepsilon\) is the nuclear energy generation rate per unit mass.
</div>

These four ODEs, supplemented by an equation of state \(P(\rho, T)\), an opacity law \(\kappa(\rho, T)\), and a nuclear reaction rate \(\varepsilon(\rho, T, X_i)\), form a complete system for the four unknowns \(M(r)\), \(P(r)\), \(T(r)\), and \(L_r(r)\) as functions of radius.

The **boundary conditions** are:
- At the centre (\(r = 0\)): \(M(0) = 0\), \(L(0) = 0\).
- At the surface (\(r = R\)): \(P(R) = 0\), \(T(R) = T_\text{eff}\) (approximately).

This is a **two-point boundary value problem** (conditions specified at both endpoints), which is why stellar structure cannot be solved by simple forward integration and requires iterative numerical methods.

### The Vogt–Russell Theorem

The structure of the system of equations implies that, for a given composition profile, the entire internal structure of a star is uniquely determined by its total mass. This is the **Vogt–Russell theorem**: a star's mass (and composition) uniquely determine all its properties — radius, luminosity, central temperature, and lifetime. This explains the tight, one-parameter sequences observed in the H–R diagram: the main sequence is a mass sequence.

### Order-of-Magnitude Stellar Structure ("Twiddles")

A powerful technique, advocated by Broderick and common in astrophysics, is to estimate stellar properties using dimensional scaling — "twiddle" (order-of-magnitude) relations. Setting \(r \sim R\), \(M(r) \sim M\), and replacing differentials by ratios:

From hydrostatic equilibrium:

\[
\frac{P_c}{R} \sim \frac{GM\rho}{R^2} \implies P_c \sim \frac{GM\rho}{R} \sim \frac{GM^2}{R^4},
\]

using \(\rho \sim M/R^3\). From the ideal gas equation of state:

\[
T_c \sim \frac{\mu m_H P_c}{k \rho} \sim \frac{\mu m_H G M}{k R}.
\]

From radiative transport and energy conservation (\(L \sim 4\pi R^2 \cdot F\) and \(F \sim aT^4 c/(\kappa\rho R)\)):

\[
L \sim \frac{4\pi R^2 \cdot acT_c^4}{3\kappa\rho} \cdot \frac{1}{R} \sim \frac{4\pi a c T_c^4 R}{\kappa \rho}.
\]

Substituting \(T_c \propto M/R\) and \(\rho \propto M/R^3\):

\[
L \sim \frac{4\pi ac}{\kappa} \cdot \frac{(M/R)^4 R}{M/R^3} = \frac{4\pi ac}{\kappa} M^3 R^{-3} R^{-1} R^3 \propto \frac{M^3}{\kappa}.
\]

If opacity is dominated by electron scattering (\(\kappa = \text{const}\)), then \(L \propto M^3\). Including the factor of \(\mu\) properly and the numerical constants gives \(L \propto M^3\), close to but slightly different from the empirical \(L \propto M^4\). (The discrepancy is because Kramers opacity adds a temperature dependence, and the detailed profiles differ from our twiddle assumptions.) Nevertheless, the twiddle argument correctly captures the scaling.

### The Solar Atmosphere

The solar atmosphere is divided into three layers: the **photosphere**, **chromosphere**, and **corona**.

The **photosphere** is the visible surface, the thin layer (\(\sim 500\ \text{km}\) thick) from which most optical radiation escapes. Its effective temperature is \(T_\text{eff} = 5778\ \text{K}\). The photosphere shows granulation (convective cells), sunspots (cool, magnetically active regions), and is the layer whose spectrum we observe as the solar spectrum.

The **chromosphere** lies just above the photosphere, extending \(\sim 2000\ \text{km}\). Unlike the photosphere, it shows a temperature inversion: temperature rises from \(\sim 4000\ \text{K}\) at the base to \(\sim 20{,}000\ \text{K}\) at the top. This inversion is maintained by mechanical heating (from acoustic waves generated by convection) and magnetic heating. The chromosphere is visible during solar eclipses as a reddish ring (the red colour comes from H\(\alpha\) emission).

The **corona** extends from the top of the chromosphere to millions of kilometres into space. Its temperature is astonishingly high: \(T \sim 10^6{-}3 \times 10^6\ \text{K}\) in active regions. The corona is visible as the pearly white structured glow during total solar eclipses. The coronal heating mechanism (likely magnetic reconnection and wave dissipation) remains an active area of research. The **solar wind** — a continuous outflow of ionized particles — originates in the corona.

---

# Chapter 5: The Interstellar Medium and Star Formation

## The Interstellar Medium

### Overview of ISM Phases

The space between stars is not empty but filled with the **interstellar medium (ISM)**: a complex, multiphase mixture of gas, dust, cosmic rays, and magnetic fields. The mass fraction of the Milky Way's disc in the ISM is about 15%. The gas has widely varying density and temperature, coexisting in rough pressure equilibrium in several distinct phases:

- **Hot ionized medium (HIM)**: \(T \sim 10^6\ \text{K}\), \(n \sim 10^{-3}\ \text{cm}^{-3}\). Heated and maintained by supernova remnants. Fills a large fraction of the Galactic volume.
- **Warm ionized medium (WIM)**: \(T \sim 8000\ \text{K}\), \(n \sim 0.1\ \text{cm}^{-3}\). Photoionized by UV from OB stars. Observed via H\(\alpha\) emission.
- **Warm neutral medium (WNM)**: \(T \sim 8000\ \text{K}\), \(n \sim 0.4\ \text{cm}^{-3}\). Neutral hydrogen, observed in the 21-cm line.
- **Cold neutral medium (CNM)**: \(T \sim 100\ \text{K}\), \(n \sim 40\ \text{cm}^{-3}\). Also neutral hydrogen, observed in 21-cm absorption.
- **Molecular clouds**: \(T \sim 10{-}30\ \text{K}\), \(n \sim 10^2{-}10^6\ \text{cm}^{-3}\). Dense, cold clouds of molecular gas (predominantly H\(_2\)), the birthplaces of stars.

The characteristic pressure is \(P/k \approx n T \approx 3000\ \text{K\ cm}^{-3}\) for the warm and cold neutral phases — they are in rough thermal pressure equilibrium. The phase structure is understood in terms of the **Field criterion**: thermal equilibrium requires heating to balance cooling, and the cooling function \(\Lambda(T)\) has multiple stable equilibria.

### The 21-cm Line and Neutral Hydrogen

Neutral hydrogen in the ground state has the electron's spin aligned or anti-aligned with the proton's spin. The hyperfine splitting of the ground state gives an energy difference \(\Delta E = 5.9 \times 10^{-6}\ \text{eV}\), corresponding to a wavelength of 21.1 cm (frequency 1420.4 MHz). The spontaneous emission rate is tiny (\(A_{10} = 2.9 \times 10^{-15}\ \text{s}^{-1}\)), but in the vast column densities of the ISM, 21-cm emission is readily observable with radio telescopes.

The 21-cm line is invaluable for mapping the Galaxy: neutral hydrogen traces the spiral arms, the rotation curve can be measured (leading to evidence for dark matter), and since the line is in radio, it is not obscured by dust.

### Dust and Extinction

Interstellar **dust** consists of small solid particles — silicates, graphite, and carbonaceous grains — with sizes ranging from a few nanometres to \(\sim 1\ \mu\text{m}\). Dust affects observations through:

**Extinction**: scattering and absorption of starlight. The extinction in magnitudes is approximately \(A_V \approx 3.1 E(B-V)\), where \(E(B-V) = A_B - A_V\) is the colour excess. A typical column through the Galactic disc suffers \(A_V \sim 1\ \text{mag}\ \text{kpc}^{-1}\).

**Reddening**: since smaller grains scatter shorter wavelengths more efficiently (Mie scattering), dust reddens stars — they appear redder (cooler) than they are. This can be corrected if the intrinsic colour is known.

**Thermal emission**: dust absorbs UV and optical photons, heats to \(\sim 15{-}30\ \text{K}\), and re-emits in the far-infrared. Dust emission peaks around 100–200 \(\mu\text{m}\) and is a dominant coolant of the ISM.

## Giant Molecular Clouds and the Jeans Criterion

### Giant Molecular Clouds

Stars form from the cold, dense gas in **giant molecular clouds (GMCs)**. These are the largest distinct objects in the Galaxy: masses \(M \sim 10^4{-}10^6\ M_\odot\), sizes \(R \sim 20{-}200\ \text{pc}\), temperatures \(T \sim 10{-}20\ \text{K}\), and mean densities \(n_{\text{H}_2} \sim 100{-}300\ \text{cm}^{-3}\). The total molecular gas mass in the Milky Way is \(\sim 2 \times 10^9\ M_\odot\).

GMCs are gravitationally bound and exhibit supersonic internal motions (linewidths of \(\sim 1{-}10\ \text{km s}^{-1}\), far exceeding the thermal sound speed \(c_s \sim 0.2\ \text{km s}^{-1}\) at \(T \sim 10\ \text{K}\)). These supersonic motions are interpreted as turbulence, which provides a form of non-thermal pressure supporting the cloud against collapse on large scales, while simultaneously creating overdense regions on small scales where local gravitational collapse can proceed.

### The Jeans Instability

The fundamental question of star formation is: under what conditions does a perturbation in a gas cloud grow rather than oscillate? This is answered by the **Jeans instability analysis**. Consider a uniform, self-gravitating gas of density \(\rho_0\), temperature \(T\), and sound speed \(c_s = \sqrt{\gamma k T/\mu m_H}\). We perturb the density: \(\rho = \rho_0 + \delta\rho\), with \(\delta\rho \propto e^{i\mathbf{k}\cdot\mathbf{r} - i\omega t}\).

From the linearized equations of fluid dynamics and gravity (the **Jeans analysis**), the dispersion relation is

\[
\omega^2 = c_s^2 k^2 - 4\pi G \rho_0.
\]

For \(\omega^2 > 0\), the perturbation oscillates (sound wave) — stable. For \(\omega^2 < 0\), the perturbation grows exponentially — unstable. The condition for instability is

\[
k < k_J = \sqrt{\frac{4\pi G\rho_0}{c_s^2}},
\]

or equivalently, the wavelength exceeds the **Jeans length**:

\[
\lambda_J = \frac{2\pi}{k_J} = \sqrt{\frac{\pi c_s^2}{G\rho_0}} = c_s \sqrt{\frac{\pi}{G\rho_0}}.
\]

The **Jeans mass** is the minimum mass of a perturbation that can collapse, roughly the mass in a sphere of diameter \(\lambda_J\):

\[
M_J = \frac{4\pi}{3}\left(\frac{\lambda_J}{2}\right)^3 \rho_0 \approx \frac{\pi^{5/2}}{6} \frac{c_s^3}{G^{3/2}\rho_0^{1/2}}.
\]

For a typical GMC with \(T = 10\ \text{K}\) and \(n = 100\ \text{cm}^{-3}\),

\[
c_s \approx 0.19\ \text{km s}^{-1}, \qquad M_J \approx 10\ M_\odot, \qquad \lambda_J \approx 1\ \text{pc}.
\]

Perturbations larger than \(\sim 1\ \text{pc}\) and more massive than \(\sim 10\ M_\odot\) are Jeans-unstable and will collapse. This is why molecular cloud cores are the immediate progenitors of individual stars.

The **free-fall time** — the timescale for collapse once Jeans instability sets in — is

\[
t_\text{ff} = \sqrt{\frac{3\pi}{32 G\rho_0}} \approx 3 \times 10^7\ \text{yr} \left(\frac{n_{\text{H}_2}}{100\ \text{cm}^{-3}}\right)^{-1/2}.
\]

## Star Formation

### Collapse and Fragmentation

Once a clump of gas exceeds the Jeans mass, it collapses under gravity. Initially, the collapse proceeds approximately isothermally: the gas is optically thin to the thermal radiation emitted by dust, so the gravitational energy released is radiated away and the temperature remains roughly constant. As isothermal collapse proceeds, the density increases; since \(M_J \propto \rho^{-1/2}\) (for \(T = \text{const}\)), the Jeans mass decreases. New regions within the collapsing clump become Jeans-unstable, leading to **hierarchical fragmentation** — a possible mechanism for the formation of a cluster of stars from a single GMC core.

Eventually, as the density rises sufficiently (\(n \gtrsim 10^{10}\ \text{cm}^{-3}\)), the collapsing core becomes **optically thick** to its own thermal radiation. At this point, the collapse switches from isothermal to approximately **adiabatic**: heat can no longer escape, so the temperature rises with the density. As \(T\) increases, \(M_J \propto T^{3/2}/\rho^{1/2}\) can increase, suppressing further fragmentation. The opaque core is now a **protostar**.

### Protostars and the Pre-Main-Sequence

The protostar continues to accrete material from the surrounding envelope, growing in mass. During this accretion phase, the luminosity is dominated by gravitational energy release:

\[
L_\text{acc} \approx \frac{G M \dot{M}}{R},
\]

where \(\dot{M}\) is the accretion rate. Typical accretion rates are \(\dot{M} \sim 10^{-5}\ M_\odot\ \text{yr}^{-1}\), and the accretion phase lasts \(\sim 10^5\ \text{yr}\) for a solar-mass star. The infalling material forms an **accretion disc** (because the cloud has angular momentum), through which material spirals inward. Bipolar outflows and jets are launched by the magnetic coupling between the disc and the protostar, removing angular momentum.

After accretion ceases, the pre-main-sequence (PMS) star contracts toward the main sequence. In the **Hayashi track** (for stars with convective interiors), the star descends nearly vertically on the H–R diagram at approximately constant \(T_\text{eff}\), radiating its gravitational energy. For more massive PMS stars that develop radiative interiors, the **Henyey track** takes them nearly horizontally (at roughly constant \(L\)) to higher temperatures. Stars reach the zero-age main sequence (ZAMS) when the central temperature first reaches the level needed to sustain hydrogen burning.

The **Kelvin–Helmholtz timescale** (the gravitational contraction time) is

\[
\tau_\text{KH} = \frac{G M^2}{R L} \approx 1.5 \times 10^7\ \text{yr}\ \left(\frac{M}{M_\odot}\right)^2 \left(\frac{R_\odot}{R}\right)\left(\frac{L_\odot}{L}\right).
\]

This sets the time spent on the Hayashi/Henyey track.

---

# Chapter 6: Stellar Evolution

## Main Sequence to Red Giant

### Hydrogen Burning and Main-Sequence Evolution

Once on the ZAMS, a star burns hydrogen in its core, converting hydrogen to helium. As the core composition changes (increasing mean molecular weight \(\mu\)), the pressure of an ideal gas at fixed temperature would drop. To compensate and maintain hydrostatic equilibrium, the core must contract and heat slightly. This **core contraction** increases the luminosity (since \(L \propto T_c^4 R/\kappa\rho\)), causing the star to slowly brighten and expand during its main-sequence life.

The Sun, for example, was about 30% less luminous at the ZAMS 4.6 Gyr ago than it is today. The main sequence therefore has a small finite width: the ZAMS is the lower envelope, with stars evolving to slightly higher luminosity and radius as they age.

### Terminal Age Main Sequence and Shell Burning

When the hydrogen in the core is exhausted (the star reaches the **terminal age main sequence**, TAMS), nuclear burning can no longer occur in the inert helium core. The core contracts rapidly on the Kelvin–Helmholtz timescale, heating the surrounding hydrogen-rich shell until hydrogen ignites in a thin shell around the core (**hydrogen shell burning**).

The shell burning greatly increases the luminosity. The envelope responds by expanding dramatically — the star becomes a **red giant** or **red supergiant**. The physical mechanism behind this expansion is still debated in detail, but the essential point is a **mirror principle**: as the core contracts and heats, the envelope must expand and cool to maintain virial equilibrium. The surface temperature drops to \(\sim 4000{-}5000\ \text{K}\) while the luminosity increases by a factor of \(\sim 100{-}1000\), moving the star to the upper right of the H–R diagram along the **red giant branch (RGB)**.

For low-mass stars (\(M \lesssim 2\ M_\odot\)), the helium core is **degenerate** (electron degeneracy pressure supports it rather than thermal pressure). As the core mass grows by shell burning, the core remains at nearly constant temperature and density until it reaches \(\sim 0.5\ M_\odot\). At this point the central temperature reaches \(T \sim 10^8\ \text{K}\) and helium ignites in a **helium flash** — a runaway thermonuclear event, because degenerate matter cannot thermally expand in response to heating (unlike ideal gas, where expansion cools the gas and regulates burning). The flash converts the helium core from degenerate to non-degenerate in a few hours, and the star settles onto the **horizontal branch** burning helium quietly in the core.

For higher-mass stars (\(M \gtrsim 2\ M_\odot\)), the core never degenerates before helium ignition, so helium burning begins quietly with no flash.

### Asymptotic Giant Branch

After helium is exhausted in the core, the star ascends the **asymptotic giant branch (AGB)**: shell burning of both hydrogen and helium proceeds simultaneously, with the two shells alternately dominating in a phenomenon called **thermal pulses**. The AGB is also where most of the heavy elements produced by slow neutron capture (the **s-process**) are synthesized. Strong stellar winds strip the envelope, exposing the inert carbon-oxygen core, which becomes a **white dwarf** (for initial masses \(M \lesssim 8\ M_\odot\)) or triggers a core-collapse supernova (for \(M \gtrsim 8\ M_\odot\)).

## Variable Stars

### Pulsating Stars and the Instability Strip

Many evolved stars are **pulsating variables** — they oscillate radially, periodically expanding and contracting, producing variations in luminosity, surface temperature, and radius. The **instability strip** is a near-vertical band on the H–R diagram that cuts across the giant and supergiant branches, containing several important classes of pulsating stars.

The physical driver of pulsation is understood through the **kappa mechanism** (\(\kappa\)-mechanism). In most of the star, the opacity decreases as the gas is compressed and heated (so at maximum compression, the layer radiates more, acting as a normal "valve" that damps oscillations). In the **helium ionization zones** (at \(T \sim 3 \times 10^4\ \text{K}\) for He\,II ionization), the opacity increases upon compression because compression partially ionizes helium, which absorbs more photons. This traps heat during compression and releases it during expansion — a thermodynamic engine that drives coherent pulsations. The layer acts like a **heat valve**, or, in Eddington's analogy, like the mechanism of a steam engine.

### Cepheid Variables

**Classical Cepheids** are supergiant F–K stars (\(M \sim 3{-}10\ M_\odot\)) pulsating with periods of \(1{-}100\) days. They are among the most important objects in astrophysics because of the **period–luminosity (PL) relation** discovered by Henrietta Swan Leavitt in 1912:

\[
M_V = -2.81 \log_{10}(P/\text{days}) - 1.43,
\]

with scatter of only \(\sim 0.1\ \text{mag}\). Because a Cepheid's period can be measured from its light curve, the PL relation gives its absolute magnitude, and hence its distance. Cepheids are bright enough (\(L \sim 10^3{-}10^5\ L_\odot\)) to be detected in nearby galaxies, making them the crucial second rung of the extragalactic distance ladder above parallax. Hubble's discovery of Cepheids in the Andromeda "nebula" in 1923 established that it was a separate galaxy.

The PL relation arises from the **Leavitt law** and has a simple physical origin. The pulsation period is approximately the free-fall (dynamical) timescale: \(P \sim \tau_\text{dyn} = \sqrt{R^3/GM} = (G\bar\rho)^{-1/2}\), where \(\bar\rho\) is the mean density. More luminous Cepheids have larger radii and lower mean densities, hence longer periods.

### RR Lyrae Stars

**RR Lyrae** stars are pulsating horizontal-branch stars, with periods of 0.2–1 day and luminosities \(L \approx 40{-}100\ L_\odot\). They are excellent distance indicators in the Local Group because they are nearly standard candles (small range of \(M_V \approx +0.5\)). They are found abundantly in globular clusters, where their periods correlate with metallicity.

### Long-Period Variables and Mira Stars

**Mira variables** (prototype: Mira, o Ceti) are cool, luminous AGB stars pulsating with periods of 100–1000 days and amplitude \(\Delta m_V \sim 2.5{-}10\ \text{mag}\). They are losing mass rapidly via pulsation-driven winds, important for the chemical enrichment of the ISM.

---

# Chapter 7: Stellar Death and Remnants

## White Dwarfs

### Formation and Structure

For stars with initial mass \(M_\text{init} \lesssim 8\ M_\odot\) (the vast majority of all stars), the end product of stellar evolution is a **white dwarf**: the degenerate remnant of the stellar core, composed primarily of carbon and oxygen, with a thin helium and hydrogen atmosphere. White dwarfs have typical masses \(M \sim 0.5{-}1.4\ M_\odot\) and radii \(R \sim 0.01\ R_\odot \sim 5000\ \text{km}\), making them roughly Earth-sized but with solar-like masses. Their mean densities are \(\bar\rho \sim 10^6\ \text{g cm}^{-3}\).

White dwarfs have no nuclear energy source. They are supported against gravity entirely by **electron degeneracy pressure** — a quantum mechanical effect arising from the Pauli exclusion principle. Because no two electrons can occupy the same quantum state, electrons must fill states up to the **Fermi energy** \(E_F\), and the associated momentum gives rise to a pressure even at zero temperature:

\[
P_e \approx \frac{\hbar^2}{m_e}\left(\frac{3\pi^2 n_e}{8}\right)^{5/3} \cdot \frac{1}{5\pi^2} \propto n_e^{5/3} \propto \rho^{5/3},
\]

for non-relativistic electrons. The crucial feature is that this pressure is **independent of temperature** — a white dwarf can cool indefinitely without collapsing, because the degeneracy pressure remains as \(T \to 0\).

### The Chandrasekhar Mass Limit

For sufficiently massive (hence dense) white dwarfs, the electrons become **relativistic**: the Fermi energy approaches \(m_e c^2\). In the relativistic limit, the degeneracy pressure scales as \(P_e \propto n_e^{4/3} \propto \rho^{4/3}\) rather than \(\rho^{5/3}\). This has a dramatic consequence.

In hydrostatic equilibrium, balancing pressure gradient against gravity:

\[
P \sim \frac{GM^2}{R^4}.
\]

For non-relativistic degeneracy (\(P \propto \rho^{5/3} \propto M^{5/3}/R^5\)):

\[
\frac{M^{5/3}}{R^5} \sim \frac{M^2}{R^4} \implies R \sim M^{-1/3}.
\]

The radius *decreases* as mass increases — white dwarfs become smaller as more mass is added. As the mass increases, the electrons become more relativistic, and for \(P \propto \rho^{4/3} \propto M^{4/3}/R^4\):

\[
\frac{M^{4/3}}{R^4} \sim \frac{M^2}{R^4} \implies M^{4/3} \sim M^2.
\]

This is satisfied only for a specific mass — the **Chandrasekhar mass**:

\[
M_\text{Ch} = \frac{5.83}{\mu_e^2}\ M_\odot,
\]

where \(\mu_e\) is the mean molecular weight per electron (\(\mu_e = 2\) for a carbon-oxygen white dwarf). This gives

\[
M_\text{Ch} \approx 1.44\ M_\odot.
\]

At \(M = M_\text{Ch}\), the relativistic degeneracy pressure cannot support the star regardless of radius — the star must collapse. Thus \(M_\text{Ch}\) is a hard upper limit on the white dwarf mass. White dwarfs above this mass do not exist in stable equilibrium; they would collapse to a neutron star or trigger a thermonuclear explosion (Type Ia supernova).

The Chandrasekhar mass can be estimated using a twiddle argument. The characteristic energy scale for relativistic degeneracy is the rest mass energy of the electron divided by the fine-structure constant times a dimensionless combination of fundamental constants. The result depends only on \(\hbar\), \(c\), \(G\), and \(m_p\):

\[
M_\text{Ch} \sim \left(\frac{\hbar c}{G}\right)^{3/2} m_p^{-2} \sim M_\text{Pl}^3/m_p^2,
\]

where \(M_\text{Pl} = \sqrt{\hbar c/G}\) is the Planck mass. This combination, \(\sim M_\text{Pl}^3/m_p^2 \approx 1.7 M_\odot\), is indeed of order the Chandrasekhar mass.

### Cooling of White Dwarfs

Since white dwarfs have no energy source, they cool by radiating away their stored thermal energy. The cooling timescale depends on the heat capacity of the ions (the electrons, being degenerate, have a much reduced heat capacity). The cooling rate gives a **white dwarf luminosity function** — the number of white dwarfs per unit luminosity interval. The low-luminosity end of this function has a cutoff due to the finite age of the Galaxy: white dwarfs have not had time to cool below \(T_\text{eff} \approx 4000\ \text{K}\), so the cooled-out population is not yet visible. The location of this cutoff provides an independent age estimate for the Galactic disc.

## Neutron Stars

### Formation in Core Collapse

When the iron core of a massive star (\(M_\text{core} \gtrsim 1.4\ M_\odot\)) reaches the Chandrasekhar mass, electron degeneracy pressure can no longer support it and it begins a catastrophic collapse. Two processes occur:

1. **Electron capture (neutronization)**: high-energy electrons are absorbed by protons in iron nuclei: \(e^- + p \to n + \nu_e\). This removes electrons (reducing the pressure) and releases neutrinos that carry away energy.
2. **Photodisintegration**: the intense temperatures (\(T \gtrsim 10^{10}\ \text{K}\)) cause iron nuclei to be photodisintegrated into free nucleons and alpha particles, an endothermic process that removes thermal energy.

Both processes accelerate the collapse. In about 0.1 seconds, the core collapses from \(\sim R_\text{WD} \sim 10^4\ \text{km}\) to nuclear density (\(\rho \sim 3 \times 10^{14}\ \text{g cm}^{-3}\)), at which point the **strong nuclear force** becomes repulsive and the core bounces. The bounce drives a shockwave outward, but the shock loses energy by photodisintegrating infalling iron and by neutrino emission. The currently accepted mechanism for the supernova explosion involves **neutrino heating** of the shocked material: the collapsing core radiates \(\sim 3 \times 10^{46}\ \text{J}\) in neutrinos over \(\sim 10\) seconds, and even 1% of this energy deposited in the mantle is sufficient to power the observed explosion (\(10^{44}\ \text{J}\) in kinetic energy).

### Structure and Properties

The remnant of core collapse is a **neutron star**: essentially a giant atomic nucleus held together by gravity, with \(M \sim 1.4{-}2\ M_\odot\) and \(R \sim 10\ \text{km}\). The density at the centre (\(\rho \sim 10^{15}\ \text{g cm}^{-3}\)) exceeds nuclear density, and the composition is complex: an outer crystalline crust of neutron-rich nuclei, a fluid neutron superfluid in the inner crust and core, and possibly exotic phases (strange quark matter, pion condensates) at the very centre.

Neutron stars are supported by **neutron degeneracy pressure**, analogous to electron degeneracy in white dwarfs but for neutrons. By analogy with the Chandrasekhar mass, there is an **Oppenheimer–Volkoff mass limit** for neutron stars:

\[
M_\text{OV} \sim \left(\frac{\hbar c}{G}\right)^{3/2} m_n^{-2} \approx 5\ M_\odot,
\]

where \(m_n\) is the neutron mass. In practice, the strong nuclear force contributes additional pressure, but uncertainties in the nuclear equation of state at super-nuclear densities make the exact value uncertain. Theoretical calculations give \(M_\text{OV} \approx 2{-}3\ M_\odot\). Observationally, neutron stars with \(M \approx 2\ M_\odot\) have been measured from pulsar timing (PSR J1614-2230, PSR J0952-0607), placing a lower bound on \(M_\text{OV}\).

### Pulsars

Most known neutron stars are observed as **pulsars** — sources of highly regular radio pulses. The lighthouse model, now universally accepted, attributes the pulses to a rotating neutron star with a strong magnetic field (\(B \sim 10^8{-}10^{12}\ \text{T}\)) misaligned with the rotation axis. Charged particles are accelerated along the open magnetic field lines above the magnetic poles, emitting a beam of radio waves. As the star rotates, the beam sweeps past Earth like a lighthouse.

Neutron stars are born spinning rapidly (periods of \(\sim\) milliseconds to seconds, from angular momentum conservation during core collapse) and decelerate over time as the rotating magnetic field radiates away energy. The **spindown luminosity** is

\[
\dot{E} = -I\Omega\dot\Omega = 4\pi^2 I \dot{P}/P^3,
\]

where \(I \approx 10^{45}\ \text{g cm}^2\) is the moment of inertia, \(P\) is the pulse period, and \(\dot{P}\) is its time derivative. For the **Crab pulsar** (\(P = 33\ \text{ms}\), \(\dot{P} = 4.2 \times 10^{-13}\ \text{s s}^{-1}\)), the spindown luminosity is \(\dot{E} \sim 5 \times 10^{31}\ \text{W}\), accounting for most of the observed X-ray and optical luminosity of the Crab Nebula.

**Millisecond pulsars** (MSPs) have periods \(P \sim 1{-}10\ \text{ms}\), far faster than their birth spin. They have been **recycled** — spun up by accretion from a binary companion, which transfers angular momentum. MSPs have weak magnetic fields (\(B \sim 10^8\ \text{T}\)) and extremely stable periods, making them the most precise clocks in the universe. Arrays of MSPs are used as gravitational wave detectors (Pulsar Timing Arrays).

## Black Holes

### Formation

If the collapsed core exceeds the Oppenheimer–Volkoff mass, even neutron degeneracy pressure cannot prevent collapse, and the core collapses all the way to form a **black hole** — a region of spacetime from which not even light can escape. For stellar-mass black holes, this typically requires initial stellar masses \(M_\text{init} \gtrsim 25{-}40\ M_\odot\) (though this depends on metallicity and mass loss history). In some cases, the entire star may collapse directly to a black hole without a visible supernova.

### The Schwarzschild Radius

The **Schwarzschild radius** is the radius of the event horizon of a non-rotating black hole of mass \(M\). It is derived from general relativity, but can be estimated using a Newtonian argument (noting that this is fortuitously correct): set the escape velocity equal to the speed of light:

\[
v_\text{esc} = \sqrt{\frac{2GM}{R_S}} = c \implies R_S = \frac{2GM}{c^2}.
\]

For a solar-mass black hole, \(R_{S,\odot} = 2 \times 1.989 \times 10^{30} \times 6.67 \times 10^{-11} / (3 \times 10^8)^2 \approx 3\ \text{km}\). A stellar-mass black hole of \(10\ M_\odot\) has \(R_S \approx 30\ \text{km}\); supermassive black holes in galaxy centres (\(10^6{-}10^{10}\ M_\odot\)) have \(R_S\) ranging from the size of the Solar System to hundreds of AU.

The **Schwarzschild metric** from general relativity describes the spacetime around a non-rotating, spherically symmetric mass:

\[
ds^2 = -\left(1 - \frac{R_S}{r}\right)c^2\,dt^2 + \left(1 - \frac{R_S}{r}\right)^{-1}\!dr^2 + r^2\,d\Omega^2.
\]

At \(r = R_S\), the metric coefficients diverge in these coordinates (a coordinate singularity, not a physical one — physically, the horizon is a null surface that can be crossed). At \(r = 0\), the curvature diverges (a true physical singularity where general relativity breaks down and quantum gravity is expected to apply).

### Observational Evidence

Black holes are observed through their gravitational effects:

- **X-ray binaries**: a stellar-mass black hole accretes material from a companion star, forming an accretion disc heated to \(T \sim 10^7\ \text{K}\), emitting X-rays. The best-studied example is Cygnus X-1, where the compact object has \(M \approx 21\ M_\odot\), far above the neutron star limit.
- **Gravitational waves**: LIGO and Virgo have detected gravitational waves from merging binary black holes and neutron stars. The first detection (GW150914, September 2015) measured a 36 + 29 \(M_\odot\) binary merging into a 62 \(M_\odot\) black hole.
- **Event Horizon Telescope**: the EHT has imaged the "shadow" of supermassive black holes — M87\(^*\) (\(M = 6.5 \times 10^9\ M_\odot\)) and Sgr A\(^*\) (the Galactic centre, \(M = 4 \times 10^6\ M_\odot\)).

## Supernovae and Novae

### Type II (Core-Collapse) Supernovae

A **Type II supernova** (SNe II) occurs when a massive star's iron core undergoes the collapse described above. Observationally, Type II supernovae show hydrogen in their spectra (the star retained its hydrogen envelope) and are characterized by a plateau in the light curve lasting \(\sim 100\) days (powered by the recombination of hydrogen ionized by the shockwave). Their peak luminosity is \(M_V \sim -17\), corresponding to \(L_\text{peak} \sim 10^{43}\ \text{erg s}^{-1}\).

The energy budget: the gravitational energy released during core collapse to a neutron star is

\[
\Delta E \sim \frac{GM_\text{NS}^2}{R_\text{NS}} \approx 3 \times 10^{46}\ \text{J} = 3 \times 10^{53}\ \text{erg}.
\]

Of this, roughly 99% is carried away by neutrinos, leaving \(\sim 10^{44}\ \text{J}\) to power the explosion and \(\sim 10^{43}\ \text{J}\) as optical luminosity. This was spectacularly confirmed by SN 1987A in the Large Magellanic Cloud: about 20 neutrino events were detected by the Kamiokande II and IMB detectors a few hours before the optical brightening, consistent with \(\sim 10^{53}\ \text{erg}\) in neutrinos.

**Type Ib/Ic supernovae** are also core-collapse events, but from stars that lost their hydrogen (Type Ib: from Wolf-Rayet stars with exposed helium cores) or even helium (Type Ic) envelopes before explosion.

### Type Ia Supernovae

**Type Ia supernovae** (SNe Ia) show no hydrogen in their spectra and have a distinctive peak luminosity of \(M_V \approx -19.3\ \text{mag}\) (about \(5 \times 10^9\ L_\odot\)). They occur in all galaxy types, including old ellipticals with no current star formation, indicating progenitors from old stellar populations.

The standard model involves a **white dwarf in a binary system** accreting mass until it approaches the Chandrasekhar mass. As \(M \to M_\text{Ch}\), the central density rises until carbon ignites. Because the electron-degenerate material cannot thermally expand, the ignition leads to a thermonuclear runaway — the entire white dwarf is incinerated in seconds, synthesizing \(\sim 0.6\ M_\odot\) of \({}^{56}\text{Ni}\) (which decays to \({}^{56}\text{Co}\) and then \({}^{56}\text{Fe}\), powering the light curve). The star is completely destroyed, leaving no remnant.

Because they explode at nearly the same mass (\(M_\text{Ch}\)), Type Ia supernovae have a nearly uniform peak luminosity — they are **standard candles** (or more precisely, "standardizable candles": a width-luminosity relation allows corrections). They are the dominant tool for measuring distances to high redshift galaxies, and their use led to the discovery of the **accelerating expansion of the Universe** (Nobel Prize, 2011).

There is debate about the exact progenitor system: single-degenerate (white dwarf accreting from a non-degenerate companion) vs. double-degenerate (merger of two white dwarfs). No unambiguous progenitor system has been identified in pre-explosion images.

### Novae

A **nova** is a thermonuclear explosion on the surface of an accreting white dwarf in a binary system. Unlike a Type Ia supernova, the white dwarf is not destroyed. As hydrogen-rich material accretes onto the surface, it builds up until the base of the accreted layer reaches \(T \sim 10^7\ \text{K}\). At this point hydrogen ignites and the burning front propagates around the surface in a thermonuclear runaway. The white dwarf brightens by \(\sim 9\) magnitudes in a few days, then fades over weeks to months. The mass ejected is small (\(\sim 10^{-5}\ M_\odot\)), and the white dwarf survives to accrete again. **Recurrent novae** (such as RS Ophiuchi) undergo multiple outbursts on timescales of decades.

### Supernova Remnants and the ISM

Supernova explosions inject \(\sim 10^{44}\ \text{J}\) of kinetic energy into the ISM, driving **supernova remnants (SNRs)** — shells of hot, shocked gas expanding at thousands of km/s. SNRs are responsible for:

- Maintaining the hot ionized medium (HIM) of the ISM
- Accelerating cosmic rays to relativistic energies
- Synthesizing and dispersing heavy elements (\({}^{56}\text{Fe}\), \({}^{28}\text{Si}\), etc.) throughout the Galaxy
- Triggering new star formation by compressing nearby molecular clouds

The Crab Nebula (remnant of a supernova observed by Chinese astronomers in 1054 AD), Cassiopeia A, and Tycho's remnant are among the best-studied SNRs. They expand in a characteristic **Sedov–Taylor** self-similar blast wave, with radius growing as \(R \propto t^{2/5}\) once the swept-up mass dominates over the ejected mass.

---

<div class="definition">
<strong>Summary: Key Equations and Scaling Relations</strong>

The following relations are central to stellar astrophysics:

<strong>Stellar luminosity:</strong> \(L = 4\pi R^2 \sigma T_\text{eff}^4\)

<strong>Distance modulus:</strong> \(\mu = m - M = 5\log_{10}(d/10\text{ pc})\)

<strong>Chandrasekhar mass:</strong> \(M_\text{Ch} \approx 1.44\ M_\odot\)

<strong>Schwarzschild radius:</strong> \(R_S = 2GM/c^2\)

<strong>Jeans mass:</strong> \(M_J \approx \frac{\pi^{5/2}}{6}\frac{c_s^3}{G^{3/2}\rho_0^{1/2}}\)

<strong>Main-sequence lifetime:</strong> \(\tau_\text{MS} \approx 10^{10}\text{ yr} \cdot (M/M_\odot)^{1-\alpha}\)

<strong>Four equations of stellar structure:</strong>
\[\frac{dM}{dr} = 4\pi r^2\rho, \quad \frac{dP}{dr} = -\frac{GM\rho}{r^2}, \quad \frac{dT}{dr} = -\frac{3\kappa\rho L_r}{16\pi acT^3 r^2}, \quad \frac{dL_r}{dr} = 4\pi r^2\rho\varepsilon\]
</div>
