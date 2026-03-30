---
title: "PHYS 474: Galaxies"
prof: "Michael Balogh"
---

## Sources and References

These notes synthesize material from the following textbooks and standard references. They are not transcribed from any specific term's lectures.

**Primary textbook**
- L. S. Sparke and J. S. Gallagher III, *Galaxies in the Universe: An Introduction*, 2nd ed. (Cambridge University Press, 2007)

**Supplementary texts**
- J. Binney and M. Merrifield, *Galactic Astronomy* (Princeton University Press, 1998)
- J. Binney and S. Tremaine, *Galactic Dynamics*, 2nd ed. (Princeton University Press, 2008)
- M. S. Longair, *Galaxy Formation*, 2nd ed. (Springer, 2008)
- P. Schneider, *Extragalactic Astronomy and Cosmology: An Introduction*, 2nd ed. (Springer, 2015)

**Online resources**
- NASA/IPAC Extragalactic Database (NED) — ned.ipac.caltech.edu
- arXiv Astrophysics (astro-ph.GA) — arxiv.org

---

# Chapter 1: Fundamentals of Galaxy Astronomy

## Overview and Motivation

Galaxies are the fundamental building blocks of the observable universe. Each is a gravitationally bound system containing anywhere from a few million to several trillion stars, along with gas, dust, and dark matter — all evolving over cosmic time under the influence of gravity, stellar feedback, and the large-scale structure of spacetime itself. The study of galaxies sits at the intersection of stellar physics, fluid dynamics, gravitational theory, and cosmology, making it one of the richest branches of modern astrophysics.

This course approaches galaxies as physical systems to be understood quantitatively. We begin with the units and measurement techniques that allow us to say anything at all about objects billions of light-years away, then build up a physical picture of galaxy structure, dynamics, and evolution. Throughout, we will see that many of the most important discoveries in extragalactic astronomy — the existence of dark matter, the expansion of the universe, the role of supermassive black holes — arose not from planned theoretical predictions but from careful observational work that forced us to revise our understanding of physics on the largest scales.

## Units and Scales

Extragalactic astronomy spans an enormous range of scales, and the first practical task is to develop fluency with the units appropriate to each. The standard unit of length in stellar and galactic astronomy is the **parsec**, defined as the distance at which one astronomical unit (AU) subtends an angle of one arcsecond.

One arcsecond is \(1'' = 1/3600\) degrees \(= \pi/(180 \times 3600)\) radians \(\approx 4.848 \times 10^{-6}\) rad. By the small-angle approximation, a distance \(d\) (in parsecs) corresponds to a parallax angle \(\pi_p\) (in arcseconds) via

\[d = \frac{1}{\pi_p}\]

where \(\pi_p\) is in arcseconds and \(d\) is in parsecs. One parsec equals

\[1 \text{ pc} = \frac{1 \text{ AU}}{\tan(1'')} \approx \frac{1.496 \times 10^{11} \text{ m}}{4.848 \times 10^{-6}} \approx 3.086 \times 10^{16} \text{ m} \approx 3.26 \text{ light-years}.\]

For extragalactic work we use kiloparsecs (\(1 \text{ kpc} = 10^3 \text{ pc}\)), megaparsecs (\(1 \text{ Mpc} = 10^6 \text{ pc}\)), and occasionally gigaparsecs (\(1 \text{ Gpc} = 10^9 \text{ pc}\)). Typical scales: the Milky Way disk has a radius of \(\sim 15\) kpc; the distance to the Andromeda galaxy is \(\sim 780\) kpc; the distance to the Virgo cluster is \(\sim 16\) Mpc; the observable universe spans \(\sim 3\) Gpc in radius (to \(z \approx 1\)).

Masses are conventionally expressed in solar masses, \(M_\odot = 1.989 \times 10^{30}\) kg. The Milky Way has a total (dark + baryonic) mass of order \(10^{12} M_\odot\); a dwarf galaxy might have \(10^7 M_\odot\); a massive elliptical galaxy can reach \(10^{13} M_\odot\). Luminosities are expressed in solar luminosities, \(L_\odot = 3.828 \times 10^{26}\) W, or sometimes in terms of absolute magnitude.

The **magnitude system** is a logarithmic scale for flux (and luminosity) that astronomers inherited from Hipparchus. The apparent magnitude \(m\) of a source with flux \(F\) (energy per unit area per unit time) is defined relative to a standard:

\[m_1 - m_2 = -2.5 \log_{10}\!\left(\frac{F_1}{F_2}\right).\]

The factor \(-2.5\) (sometimes called the Pogson ratio) ensures that a magnitude difference of 5 corresponds to a flux ratio of exactly 100, as was approximately true for the historical first-to-sixth magnitude scale. Brighter objects have smaller (more negative) magnitudes: the Sun has \(m_V \approx -26.7\), the full Moon \(\approx -12.6\), and the faintest objects detectable by the James Webb Space Telescope reach \(m \sim 30\).

The **absolute magnitude** \(M\) is defined as the apparent magnitude a source would have if placed at a distance of exactly 10 pc. The relationship between apparent and absolute magnitude defines the **distance modulus**:

\[\mu \equiv m - M = 5\log_{10}\!\left(\frac{d}{10 \text{ pc}}\right) = 5\log_{10}(d/\text{pc}) - 5.\]

For example, a Cepheid with apparent magnitude \(m = 20\) and absolute magnitude \(M = -3\) has \(\mu = 23\), corresponding to \(d = 10^{(23+5)/5} = 10^{5.6} \approx 398\) kpc — clearly extragalactic.

### Surface Brightness

A critical observable for extended objects like galaxies is **surface brightness**, the flux per unit solid angle on the sky. It is conventionally expressed as magnitudes per square arcsecond (mag arcsec\(^{-2}\)). Unlike total flux, surface brightness is distance-independent in Euclidean space: as an object moves farther away, its total flux decreases as \(d^{-2}\) but its angular size also decreases as \(d^{-2}\), so the ratio (surface brightness) stays constant. (In an expanding universe there is a cosmological surface brightness dimming proportional to \((1+z)^4\), but this is a second-order effect for the nearby galaxies we study first.)

The **effective radius** \(R_e\) (also called the half-light radius) encloses half of a galaxy's total luminosity. It is a key structural parameter: for elliptical galaxies \(R_e\) ranges from \(\sim 1\) kpc for small ellipticals to \(\sim 50\) kpc for brightest cluster galaxies (BCGs). The mean surface brightness within \(R_e\) is

\[\langle I \rangle_e = \frac{L/2}{\pi R_e^2}.\]

### The Electromagnetic Spectrum and Telescopes

Galaxies emit radiation across the full electromagnetic spectrum, and extracting a complete picture requires observations at many wavelengths. Radio observations (centimeter to meter wavelengths) reveal synchrotron emission from relativistic electrons, 21-cm emission from neutral hydrogen (HI), and the cosmic microwave background. Millimeter and submillimeter wavelengths access thermal emission from cold dust and rotational transitions of CO, tracing the molecular gas that fuels star formation. Infrared observations pierce dust obscuration and detect the thermal emission from warm dust heated by star formation. Optical and near-infrared trace the stellar continuum — the integrated light of billions of stars. Ultraviolet emission comes primarily from hot young stars (OB stars), making UV luminosity a direct star-formation indicator. X-ray emission arises from hot plasma in clusters, from accreting black holes (AGN), and from binary X-ray sources.

Each wavelength regime requires its own detector technology and, for many bands, observations from space to avoid atmospheric absorption. The diversity of galaxy properties is only fully appreciated by combining these multi-wavelength perspectives.

## Fundamental Observational Quantities

### Angular Sizes and Physical Sizes

For a source at distance \(d\) with physical size \(\ell\) subtending angle \(\theta\) (in radians),

\[\ell = d\,\theta \quad \text{(small-angle approximation)}.\]

At cosmological distances \(d\) must be replaced by the angular diameter distance \(d_A\), which accounts for the expansion of the universe. For nearby objects (redshift \(z \ll 1\)), \(d_A \approx cz/H_0\) where \(H_0 \approx 70\) km s\(^{-1}\) Mpc\(^{-1}\) is the Hubble constant.

### Redshifts and Recession Velocities

The **redshift** of a galaxy is defined by

\[z = \frac{\lambda_\text{obs} - \lambda_\text{em}}{\lambda_\text{em}},\]

where \(\lambda_\text{em}\) is the rest-frame wavelength of an identified spectral line. For small redshifts, \(z \approx v_r/c\) where \(v_r\) is the line-of-sight (radial) velocity. The Hubble law states that, on average, galaxies recede from us with velocity

\[v_r = H_0\, d,\]

providing a direct conversion from redshift to distance for cosmological purposes (though peculiar velocities of order 100–600 km s\(^{-1}\) complicate this for nearby structures).

### Colors and Stellar Populations

The color of a galaxy — the ratio of its fluxes in two different bandpasses — encodes information about its stellar population age and metallicity. Galaxies with ongoing star formation appear blue because hot, luminous OB stars dominate the optical light; old, quiescent ("red and dead") ellipticals appear red because their stellar populations have evolved off the main sequence, leaving only cool K and M giants. This is the basis of the **color-magnitude diagram** for galaxies: a plot of absolute magnitude vs. color reveals a **red sequence** of quiescent ellipticals, a **blue cloud** of star-forming spirals and irregulars, and a sparsely populated **green valley** of galaxies in transition.

---

# Chapter 2: The Milky Way

## Structure and Components

We live inside the Milky Way galaxy, which gives us an extraordinary close-up view of a spiral galaxy's components but makes it difficult to measure global properties — we cannot step outside and observe it from afar. Inferring the structure of our own galaxy from the inside is one of the great observational challenges of astronomy, requiring multiple complementary techniques.

The Milky Way is a **barred spiral galaxy** of Hubble type SBbc. Its main structural components are:

1. **The thin disk**: A flat, rotating structure with a scale height of \(\sim 300\) pc and a scale length of \(\sim 3.5\) kpc, containing most of the young stars, HII regions, molecular clouds, and the bulk of the interstellar medium.
2. **The thick disk**: A kinematically hotter, older, and more metal-poor disk component with scale height \(\sim 1\) kpc. It contributes a minority of the stellar mass but provides important constraints on the Milky Way's formation history.
3. **The stellar halo**: A roughly spherical, low-density population of old, metal-poor stars extending to \(\sim 100\) kpc. Many are organized into streams and substructures — remnants of disrupted dwarf galaxies accreted over cosmic time.
4. **The central bulge and bar**: A triaxial structure at the center, with dimensions of roughly \(3 \times 1 \times 1\) kpc. The bar extends to \(\sim 4\) kpc from the center.
5. **The dark matter halo**: A roughly spherical halo of non-baryonic dark matter extending to \(\sim 200\) kpc (the virial radius), dominating the total mass.

### The Sun's Position

The Sun lies in the thin disk at a distance of

\[R_0 = 8.2 \pm 0.1 \text{ kpc}\]

from the Galactic center (IAU recommended value: 8.5 kpc; modern measurements from stellar orbits around Sgr A* give \(\sim 8.2\) kpc). The Sun sits slightly above the midplane of the disk by \(\sim 25\) pc. Defining a Galactic coordinate system: Galactic longitude \(\ell\) is measured in the Galactic plane from the direction of the Galactic center, and Galactic latitude \(b\) is measured from the plane. The Galactic center is at \((\ell, b) = (0°, 0°)\).

### Stellar Density Profiles

The stellar number density in the thin disk is well described by a double-exponential profile:

\[n(R, z) = n_0\, \exp\!\left(-\frac{R - R_0}{h_R}\right)\exp\!\left(-\frac{|z|}{h_z}\right),\]

where \(h_R \approx 3.5\) kpc is the radial scale length and \(h_z \approx 300\) pc is the vertical scale height (for the thin disk). The local stellar density \(n_0\) can be measured from star counts in the solar neighborhood.

The stellar halo is better described by a power law or de Vaucouleurs profile:

\[\rho_\text{halo}(r) \propto r^{-n}, \quad n \approx 3.5\text{–}4,\]

or equivalently \(\rho \propto \exp(-7.67(r/r_e)^{1/4})\) — the \(R^{1/4}\) or **de Vaucouleurs profile** that we will encounter again for elliptical galaxies.

## The Galactic Center

The center of the Milky Way is obscured at optical wavelengths by \(\sim 30\) magnitudes of extinction from interstellar dust — a factor of \(10^{12}\) in flux. Infrared and radio observations pierce this curtain. At the dynamical center lies **Sagittarius A*** (Sgr A*), a compact radio source first detected in 1974. Its compactness and the high velocities of orbiting stars around it provide compelling evidence that it harbors a supermassive black hole.

The **S-stars** — a cluster of young, massive stars in tight orbits around Sgr A* — have been monitored with near-infrared adaptive optics for over two decades by groups at UCLA (Ghez et al.) and MPE Garching (Genzel et al.; 2020 Nobel Prize in Physics). The star S2 has an orbital period of \(\sim 16\) years and approaches within \(\sim 120\) AU of Sgr A* at periapsis. Applying Kepler's third law to these stellar orbits gives

\[M_\bullet = \frac{4\pi^2 a^3}{G P^2},\]

where \(a\) is the semimajor axis and \(P\) is the orbital period. The result: \(M_\bullet \approx 4 \times 10^6\, M_\odot\), confined to a region smaller than the solar system.

## The Rotation Curve

The **rotation curve** of the Milky Way — circular velocity \(v_c\) as a function of Galactocentric radius \(R\) — is one of its most fundamental dynamical properties. For a spherically symmetric mass distribution, the circular velocity is determined by

\[v_c^2(R) = \frac{GM(R)}{R},\]

where \(M(R)\) is the mass enclosed within radius \(R\). If the mass were concentrated at the center (like a point mass), we would expect a **Keplerian decline**: \(v_c \propto R^{-1/2}\). If the mass were distributed like the light — concentrated in the disk and bulge — we would expect a rise then a fall. Instead, observations show that the rotation curve is **roughly flat** at \(v_c \approx 220\) km s\(^{-1}\) out to the largest measurable radii (\(\sim 60\) kpc, traced by gas and halo stars). This flat rotation curve implies that \(M(R) \propto R\), meaning the enclosed mass continues to grow linearly even where there is little visible matter. This is evidence for an extended dark matter halo, a theme we will return to in Chapter 8.

Measuring the Galactic rotation curve from the inside requires careful technique. For gas in the disk on circular orbits, the radial velocity relative to the local standard of rest (LSR) is

\[v_r = \left[\frac{v_c(R)}{R} - \frac{v_c(R_0)}{R_0}\right] R_0 \sin\ell,\]

where \(R_0\) and \(v_c(R_0) = \Theta_0 \approx 220\) km s\(^{-1}\) are the Sun's Galactocentric distance and circular speed. For lines of sight that pass inside the solar circle (\(R < R_0\)), the maximum radial velocity along each line of sight occurs at the **tangent point**, where the line of sight is tangent to a circle of radius \(R_\text{min} = R_0 \sin\ell\). At this point, \(v_{r,\text{max}} = v_c(R_\text{min}) - v_c(R_0)\sin\ell\), allowing us to infer \(v_c(R)\) for \(R < R_0\) from 21-cm HI emission spectra.

## Star Formation in the Milky Way

The Milky Way is currently forming stars at a rate of \(\sim 1\text{–}2\, M_\odot\) yr\(^{-1}\). Star formation occurs in molecular clouds — dense, cold (\(T \sim 10\) K), predominantly molecular (H\(_2\)) regions. The molecular gas traces a thin layer in the disk with a scale height of only \(\sim 50\) pc. Star formation is discussed further in the chapter on the interstellar medium.

---

# Chapter 3: The Interstellar Medium

## Overview

The **interstellar medium** (ISM) is the gas and dust that occupies the space between stars. Far from being empty, the ISM is a multiphase, magnetized, turbulent medium that plays a central role in the life cycle of galaxies. It is the reservoir from which stars form, and to which they return their processed material via stellar winds and supernovae. Understanding the ISM is prerequisite to understanding star formation rates, chemical enrichment, and galaxy evolution.

The ISM constitutes roughly 10–15% of the baryonic mass of a typical spiral galaxy like the Milky Way, corresponding to \(\sim 5 \times 10^9\, M_\odot\) of gas. By mass it is \(\sim 75\%\) hydrogen, \(\sim 24\%\) helium (by mass), and \(\sim 1\%\) everything heavier (metals, in astronomical parlance). The interstellar dust, though only \(\sim 1\%\) of the ISM mass, has an outsized effect on observations through extinction and reddening of background sources.

## Phases of the ISM

The ISM exists in a range of density and temperature states that are roughly in pressure equilibrium with one another. The **three-phase model** of McKee and Ostriker (1977) identifies:

<div class="definition">
<strong>Hot Ionized Medium (HIM):</strong> Temperature \(T \sim 10^6\) K, density \(n \sim 10^{-3}\) cm\(^{-3}\), filling factor \(\sim 50\%\) of the disk volume. Produced by supernova remnants. Detectable in soft X-ray emission and far-UV absorption.
</div>

<div class="definition">
<strong>Warm Ionized Medium (WIM):</strong> Temperature \(T \sim 10^4\) K, density \(n \sim 0.1\) cm\(^{-3}\). Ionized hydrogen maintained by UV photons from massive stars. Occupies \(\sim 20\%\) of disk volume. Traced by H\(\alpha\) emission and dispersion of pulsar signals.
</div>

<div class="definition">
<strong>Warm Neutral Medium (WNM):</strong> Temperature \(T \sim 8000\) K, density \(n \sim 0.5\) cm\(^{-3}\). Neutral atomic hydrogen (HI). Fills \(\sim 30\%\) of disk volume. Detected in 21-cm emission and absorption.
</div>

<div class="definition">
<strong>Cold Neutral Medium (CNM):</strong> Temperature \(T \sim 80\) K, density \(n \sim 50\) cm\(^{-3}\). Dense HI clouds in pressure equilibrium with the WNM. Fills only \(\sim 1\text{–}2\%\) of disk volume by volume but represents significant mass. Detected in 21-cm absorption.
</div>

<div class="definition">
<strong>Molecular Gas:</strong> Temperature \(T \sim 10\text{–}30\) K, density \(n \gtrsim 100\) cm\(^{-3}\). Dense, cold clouds of H\(_2\), CO, and other molecules. Sites of active star formation. Traced by CO rotational emission and dust continuum.
</div>

These phases coexist because the thermal equilibrium curve of the ISM (heating rate = cooling rate as a function of density) has two stable branches at a given pressure — the WNM branch and the CNM branch — with an unstable intermediate regime. The ISM is dynamically driven between these phases by turbulence, supernova shocks, and stellar UV radiation.

## The 21-cm Hydrogen Line

The most important tracer of the neutral ISM in galaxies is the **21-cm line** of atomic hydrogen, arising from the hyperfine transition between the triplet (\(F=1\)) and singlet (\(F=0\)) ground states of hydrogen. The energy difference is tiny:

\[\Delta E = h\nu_{21} = 5.87 \times 10^{-6} \text{ eV}, \quad \nu_{21} = 1420.406 \text{ MHz}, \quad \lambda_{21} = 21.106 \text{ cm}.\]

The spontaneous emission rate is extremely slow: the Einstein A coefficient is \(A_{10} = 2.87 \times 10^{-15}\) s\(^{-1}\), giving a mean lifetime of \(\sim 10^7\) yr. Nevertheless, because hydrogen is so abundant, 21-cm emission is easily detectable from the entire Galaxy and from external galaxies out to \(z \sim 0.4\) with current radio telescopes.

The 21-cm line provides: (1) a kinematic tracer of galaxy rotation via the Doppler shift; (2) a measure of HI column density and mass; (3) information about the temperature and spin temperature of neutral gas; and (4) in absorption against background continuum sources, constraints on the CNM fraction. A fundamental result: the **HI mass** of a galaxy detected in 21-cm emission at distance \(d\) (Mpc) with integrated line flux \(S\) (Jy km s\(^{-1}\)) is

\[M_\text{HI} = 2.356 \times 10^5\, M_\odot \left(\frac{d}{\text{Mpc}}\right)^2 \left(\frac{S}{\text{Jy km s}^{-1}}\right).\]

## Interstellar Dust

Interstellar dust consists of solid grains — silicates and carbonaceous material — ranging in size from nanometers to micrometers. Despite comprising only \(\sim 1\%\) of the ISM by mass, dust has a profound observational effect: it **absorbs** and **scatters** light from background sources (extinction) and **re-emits** the absorbed energy in the infrared.

**Extinction** at wavelength \(\lambda\) is characterized by

\[A_\lambda = -2.5\log_{10}\left(\frac{F_\lambda^\text{obs}}{F_\lambda^\text{intrinsic}}\right) = 1.086\,\tau_\lambda,\]

where \(\tau_\lambda\) is the optical depth at wavelength \(\lambda\). Extinction is wavelength-dependent: \(A_\lambda \propto \lambda^{-1}\) approximately (steeper in UV, flatter in NIR). This means dust preferentially extinguishes blue light, making reddened sources appear redder — **interstellar reddening**.

The ratio of total to selective extinction is

\[R_V = \frac{A_V}{E(B-V)},\]

where \(E(B-V) = A_B - A_V\) is the color excess. For the diffuse ISM in the Milky Way, \(R_V \approx 3.1\). Denser regions tend to have larger \(R_V\). This parameter characterizes the dust grain size distribution: larger \(R_V\) implies larger mean grain size.

For practical work, the column density of hydrogen and the \(V\)-band extinction are related by

\[N_H \approx 2.0 \times 10^{21}\, A_V\, \text{cm}^{-2} \text{ mag}^{-1}.\]

## Molecular Gas and Star Formation

Molecular hydrogen H\(_2\) is the most abundant molecule in the ISM but is nearly impossible to observe directly in cold gas: the H\(_2\) molecule has no permanent electric dipole moment, so its lowest rotational transitions require \(T \gtrsim 500\) K to excite — far hotter than typical molecular clouds. Instead, molecular gas is traced indirectly by the second most abundant molecule, **carbon monoxide** (CO), whose lowest rotational transition CO(\(J=1\to0\)) at 2.6 mm is easily excited at \(T \sim 10\) K.

The conversion between CO luminosity and H\(_2\) mass is called the **\(X_{CO}\) factor**:

\[M_{H_2} = X_{CO} \cdot L'_{CO},\]

with \(X_{CO} \approx 2 \times 10^{20}\) cm\(^{-2}\) (K km s\(^{-1}\))\(^{-1}\) in Milky Way-like conditions. This conversion factor is uncertain by a factor of \(\sim 2\text{–}3\) and is known to vary with metallicity and the radiation field.

The **Schmidt-Kennicutt law** is an empirical relation between the surface density of star formation and the surface density of gas:

\[\Sigma_\text{SFR} \propto \Sigma_\text{gas}^N, \quad N \approx 1.4\]

where \(\Sigma_\text{SFR}\) is in \(M_\odot\) yr\(^{-1}\) kpc\(^{-2}\) and \(\Sigma_\text{gas}\) includes both atomic and molecular gas. The physical interpretation of the roughly \(N=1.5\) slope is related to gravitational instability on the **Jeans length** timescale: a parcel of gas of density \(\rho\) collapses in a free-fall time \(t_\text{ff} \propto \rho^{-1/2}\), giving \(\Sigma_\text{SFR} \propto \Sigma_\text{gas}/t_\text{ff} \propto \Sigma_\text{gas}^{3/2}\) if \(t_\text{ff} \propto \Sigma_\text{gas}^{-1/2}\). The Schmidt-Kennicutt law spans many orders of magnitude from quiescent disks to starburst galaxies and even star-forming galaxies at high redshift.

## HII Regions and Ionized Gas

Massive stars (types O and B, with \(M > 8\, M_\odot\)) produce copious ionizing UV photons (\(h\nu > 13.6\) eV) that create **HII regions** — bubbles of fully ionized hydrogen surrounding young stellar clusters. The size of an HII region is set by the **Strömgren radius**, found by balancing the ionization rate with the recombination rate:

\[\frac{4}{3}\pi r_S^3 n_e n_p \alpha_B = Q_0,\]

where \(n_e \approx n_p\) is the electron/proton density, \(\alpha_B \approx 2.6 \times 10^{-13}\) cm\(^3\) s\(^{-1}\) is the case-B recombination coefficient (recombination to all levels except the ground state), and \(Q_0\) is the number of ionizing photons per second emitted by the central star(s). Solving:

\[r_S = \left(\frac{3 Q_0}{4\pi n^2 \alpha_B}\right)^{1/3}.\]

For a single O star with \(Q_0 \sim 10^{49}\) s\(^{-1}\) in a medium of density \(n \sim 10\) cm\(^{-3}\), \(r_S \sim 30\) pc. HII regions are traced by recombination lines (H\(\alpha\), H\(\beta\), ...) and free-free (bremsstrahlung) radio continuum emission. They are excellent tracers of recent star formation in galaxies.

---

# Chapter 4: The Distance Ladder

## The Problem of Extragalactic Distances

Measuring distances to galaxies is among the most technically challenging and historically contentious problems in astronomy. Unlike laboratory physics, we cannot travel to the objects of interest; we can only collect the radiation they emit. The method of **standard candles** — objects whose intrinsic luminosity is known — together with the measurement of apparent flux, allows us to infer distance through the inverse-square law:

\[F = \frac{L}{4\pi d^2}, \quad \therefore \quad d = \sqrt{\frac{L}{4\pi F}}.\]

The challenge is that no single method works across all distance scales. Instead, astronomers have built a **cosmic distance ladder** — a sequence of overlapping techniques, each calibrated by the one below it and reaching farther into the universe. An error in any rung propagates upward, and the history of cosmology is punctuated by controversies about whether the ladder was correctly constructed.

## Rung 1: Geometric Distances

The foundation of the distance ladder is **trigonometric parallax** — the only method that requires no assumptions about the physics of the target object. As the Earth orbits the Sun, nearby stars appear to shift back and forth against the background of more distant stars. The parallax angle \(p\) (half the annual shift) satisfies

\[d = \frac{1\,\text{AU}}{\tan p} \approx \frac{1\,\text{AU}}{p} = \frac{1}{p(\text{arcsec})} \text{ pc}.\]

Ground-based parallax measurements are limited by atmospheric seeing to distances of \(\sim 100\) pc (for \(p \gtrsim 10\) mas). The ESA Hipparcos satellite (1989–1993) measured parallaxes for \(\sim 10^5\) stars to \(\sim 1\) mas, extending reliable parallaxes to \(\sim 1\) kpc. The Gaia mission (2013–present) has revolutionized this: parallaxes for \(> 10^9\) stars with precision \(\sim 20\,\mu\)as, reaching the Magellanic Clouds and providing the most precise anchor for the entire distance ladder.

A complementary geometric method is **statistical parallax** and **moving cluster parallax** (used for the Hyades), which use the proper motions and radial velocities of stellar clusters to infer their distances without individual parallax measurements.

## Rung 2: Main Sequence Fitting

Stars on the main sequence (MS) of the Hertzsprung-Russell diagram have a well-defined relationship between spectral type (or color) and absolute magnitude. By comparing the apparent magnitudes of MS stars in a cluster to the standard MS established for nearby clusters (calibrated by parallax), one can determine the **distance modulus** of the cluster. This is **main sequence fitting** (or the **method of spectroscopic parallax** when applied to individual stars).

The precision of MS fitting is limited by: (a) differential reddening within the cluster; (b) metallicity differences between the target cluster and the calibrating cluster; (c) binarity (unresolved binary stars appear brighter, biasing the fit). Careful correction for all these effects can yield distances precise to \(\sim 10\%\).

## Rung 3: Cepheid Variable Stars

**Cepheid variable stars** are pulsating supergiant stars that vary in brightness with periods of 1 to 100 days. They obey the **Leavitt period-luminosity relation** (discovered by Henrietta Swan Leavitt in 1908 from observations of Cepheids in the Small Magellanic Cloud):

\[\langle M_V \rangle = -2.81 \log_{10}(P/\text{days}) - 1.43.\]

The physical reason for the Leavitt law: Cepheids pulsate in their fundamental radial mode. More luminous (and physically larger) stars have longer pulsation periods. The instability strip in the HR diagram where Cepheids live is nearly vertical in \(\log T\), so stars of different luminosities but similar temperature pulsate with predictable regularity.

Measuring the period of a Cepheid — trivial, requiring only regular time-series photometry — immediately gives its absolute magnitude and hence, combined with the apparent magnitude, its distance. With the Hubble Space Telescope, Cepheids can be detected in galaxies out to \(\sim 25\) Mpc. The HST Key Project used Cepheids in 18 galaxies to calibrate secondary distance indicators and measure \(H_0\).

A critical calibration issue: because Cepheid luminosity depends on metallicity, one must apply metallicity corrections when comparing Cepheids in metal-poor SMC-type environments to those in metal-rich inner spirals. The modern calibration uses Galactic Cepheids with Gaia parallaxes.

## Rung 4: Secondary Distance Indicators

Secondary distance indicators are empirical relations calibrated using Cepheids (or other primary methods) in nearby galaxies, then applied to more distant ones.

### The Tully-Fisher Relation

The **Tully-Fisher relation** (TFR, 1977) connects the rotational velocity of a spiral galaxy to its total luminosity:

\[L \propto v_\text{max}^4.\]

Physically, this arises from the virial theorem (Chapter 7) and the fact that spiral galaxies lie on a well-defined mass-to-light scaling relation. In practice, \(v_\text{max}\) is measured from the width of the 21-cm HI line profile (since HI extends to the flat part of the rotation curve, the line width \(\Delta v \approx 2v_\text{max}\sin i\) where \(i\) is the inclination). The TFR has scatter of \(\sim 0.3\) mag, giving distance precision of \(\sim 15\%\) per galaxy, improving to \(\sim 5\%\) for a cluster. It is applicable to \(z \lesssim 1\).

### The Faber-Jackson Relation

The analog for elliptical galaxies is the **Faber-Jackson relation** (1976):

\[L \propto \sigma_0^4,\]

where \(\sigma_0\) is the central stellar velocity dispersion. The scatter is larger (\(\sim 0.5\) mag) because ellipticals span a range of surface brightness at fixed \(L\) and \(\sigma_0\). The tighter **Fundamental Plane** relation, which includes surface brightness as a third parameter, reduces the scatter to \(\sim 0.1\) mag and provides better distance precision.

<div class="definition">
<strong>The Fundamental Plane:</strong> Elliptical galaxies obey the relation

\[\log R_e = \alpha \log \sigma_0 + \beta \log\langle I \rangle_e + \gamma,\]

with \(\alpha \approx 1.24\), \(\beta \approx -0.82\), and \(\gamma\) a zeropoint set by a reference sample. The deviation from a pure virial \(M/L = \text{const}\) relation (which would give \(\alpha = 2\), \(\beta = -1\)) reflects the systematic variation of stellar mass-to-light ratio along the sequence.
</div>

### Type Ia Supernovae

**Type Ia supernovae** (SNe Ia) are the most powerful rungs of the distance ladder, reaching cosmological distances (\(z \gtrsim 1\)). They arise when a carbon-oxygen white dwarf, through accretion from a companion or white dwarf merger, reaches the Chandrasekhar mass (\(\sim 1.4\, M_\odot\)) and undergoes runaway thermonuclear fusion. The peak luminosity is approximately standard (\(M_V \approx -19.3\)), with a remaining scatter of \(\sim 0.4\) mag.

The scatter is dramatically reduced by applying the **Phillips relation** (1993): the peak luminosity of a SN Ia correlates with the rate at which it declines after peak, parameterized by \(\Delta m_{15}\) (the magnitude drop in 15 days after peak):

\[M_B^\text{max} \approx -21.73 + 2.70\, \Delta m_{15}.\]

Slower-declining supernovae are more luminous. After this **light-curve shape correction** (and a color correction for host-galaxy dust), the corrected SNe Ia have a dispersion of only \(\sim 0.12\) mag, making them the best standard candles available. It was observations of SNe Ia at \(z \sim 0.5\) by the Supernova Cosmology Project and the High-Z Supernova Search Team in 1998–1999 that provided the first evidence for **cosmic acceleration** — the discovery that the expansion of the universe is speeding up, implying dark energy. This work earned the 2011 Nobel Prize in Physics.

## The Hubble Constant Tension

The present-day value of the Hubble constant \(H_0\) quantifies the expansion rate of the universe. Measurements using the distance ladder (calibrated by Cepheids, anchored to geometric distances) consistently give \(H_0 \approx 73\) km s\(^{-1}\) Mpc\(^{-1}\) (Riess et al. and others). Measurements using the early universe — specifically fitting the CMB power spectrum within the standard \(\Lambda\)CDM model — give \(H_0 \approx 67.4\) km s\(^{-1}\) Mpc\(^{-1}\) (Planck 2018). The discrepancy is at the \(5\sigma\) level and is known as the **Hubble tension**. Its resolution — whether systematic errors in the distance ladder, new physics beyond \(\Lambda\)CDM, or unknown CMB systematics — is one of the most actively debated questions in cosmology.

---

# Chapter 5: Stellar Populations and Galaxy Classification

## Hubble's Classification Scheme

Edwin Hubble's 1926 classification system, the **Hubble sequence** or **Hubble tuning fork**, organized galaxies into a morphological sequence that, despite its age, remains a useful first-order description. The sequence runs:

- **Ellipticals (E)**: Smooth, featureless light profiles, roughly elliptical isophotes. Classified E0 (round) through E7 (highly elongated), where the number indicates \(10(1 - b/a)\) with \(b/a\) the apparent axis ratio. Note that the apparent shape depends on the viewing angle of a triaxial object.

- **Lenticulars (S0)**: A transitional type with a disk like a spiral but no spiral arms and little gas. They have bulge + disk structure without ongoing star formation.

- **Spirals (S)**: A luminous central bulge surrounded by a flat, rotating disk with spiral arms. Subclassified Sa (large bulge, tightly wound arms, little gas) through Sd (small bulge, loosely wound arms, abundant gas and young stars). Barred spirals, where a linear bar structure extends from the nucleus, are denoted SB.

- **Irregulars (Irr)**: Galaxies with no regular symmetry, often gas-rich and actively star-forming. The Magellanic Clouds are the prototypical examples.

Hubble believed his sequence represented an **evolutionary sequence** from ellipticals (which he called "early type") to spirals ("late type"). We now know this is incorrect — morphology is not primarily an age sequence. However, the terminology "early-type" and "late-type" galaxies has stuck, with ellipticals and lenticulars grouped as early-types and spirals and irregulars as late-types.

The distribution of galaxies among types in the local universe is roughly: 20% ellipticals, 15% lenticulars, 60% spirals, 5% irregulars — though this strongly depends on environment (galaxy clusters are dominated by early-types).

## Stellar Population Synthesis

The integrated light of a galaxy is a superposition of the light from all its stars, each at a different evolutionary stage. **Stellar population synthesis** (SPS) models decompose this light into stellar populations of known age and metallicity to infer the star formation history.

The fundamental building block is the **simple stellar population** (SSP) — a collection of stars all formed at the same time from gas of the same metallicity, evolving passively. The spectrum of an SSP at age \(t\) and metallicity \(Z\) is computed by integrating stellar spectra along a theoretical isochrone:

\[F_\lambda^\text{SSP}(t, Z) = \int_{M_\text{low}}^{M_\text{up}(t)} F_\lambda(T_\text{eff}, g, Z)\, \phi(M)\, dM,\]

where \(\phi(M) \propto M^{-2.35}\) is the **Salpeter initial mass function** (IMF), \(F_\lambda(T_\text{eff}, g, Z)\) is the spectrum of a star with effective temperature, surface gravity, and metallicity given by the isochrone at mass \(M\) and age \(t\), and \(M_\text{up}(t)\) is the turnoff mass at age \(t\).

A real galaxy's star formation history can then be modeled as a sum of SSPs:

\[F_\lambda^\text{galaxy}(t_0) = \int_0^{t_0} \text{SFR}(t_0 - t')\, F_\lambda^\text{SSP}(t', Z(t'))\, dt',\]

where the SFR may vary with time and the metallicity \(Z(t')\) increases as the ISM is enriched by stellar processing.

### Age-Metallicity Degeneracy

A fundamental challenge in SPS modeling is the **age-metallicity degeneracy**: older, metal-poor stellar populations can mimic the colors and low-resolution spectra of younger, metal-rich ones. Both age and metallicity affect the spectral energy distribution in similar ways — increasing either produces redder colors. Breaking this degeneracy requires either high-resolution spectroscopy (to measure individual line strengths, which have different age and metallicity sensitivities) or observations at multiple wavelengths.

Key spectral diagnostic indices include the **\(\text{H}\beta\) Balmer absorption line** (sensitive to age: A stars dominate near the main sequence turnoff at \(\sim 1\) Gyr, producing strong Balmer absorption) and the **Mg\(_b\)** and **Fe** metal lines (sensitive to metallicity and \(\alpha\)-element enhancement ratio).

## Stellar Mass-to-Light Ratios

The stellar mass-to-light ratio \(\Upsilon_* = M_*/L\) converts an observed luminosity into a stellar mass. It depends strongly on the star formation history and IMF:

- Old, red, quiescent ellipticals: \(\Upsilon_{*,V} \sim 5\text{–}10\, M_\odot/L_\odot\)
- Young, blue star-forming galaxies: \(\Upsilon_{*,V} \sim 0.1\text{–}1\, M_\odot/L_\odot\)

The steep dependence on IMF (particularly the contribution of faint, low-mass stars that contribute mass but little light) makes \(\Upsilon_*\) uncertain by a factor of \(\sim 2\) in well-studied galaxies and much more in extreme star-forming systems.

## Light Profiles of Galaxies

### Elliptical Galaxies: the Sérsic Profile

The surface brightness profile of elliptical galaxies is well described by the **Sérsic (1963) profile**:

\[I(R) = I_e\,\exp\!\left(-b_n\left[\left(\frac{R}{R_e}\right)^{1/n} - 1\right]\right),\]

where \(R_e\) is the effective (half-light) radius, \(I_e\) is the surface brightness at \(R_e\), \(n\) is the **Sérsic index**, and \(b_n \approx 2n - 1/3\) (for \(n \gg 1\)) is a normalization constant ensuring \(R_e\) encloses half the total light.

The Sérsic profile is a generalization: \(n=1\) gives an exponential profile, \(n=4\) gives the classic **de Vaucouleurs \(R^{1/4}\) profile** found to describe luminous ellipticals. Dwarf ellipticals tend to have \(n \sim 1\text{–}2\); the most massive BCGs can reach \(n \sim 10\). The Sérsic index is therefore a useful measure of the concentration of a galaxy's light.

### Spiral Galaxies: Disk + Bulge

The light profile of a spiral galaxy is decomposed into two components. The **disk** is well described by an exponential:

\[I_\text{disk}(R) = I_0\, e^{-R/h_R},\]

where \(h_R\) is the disk scale length (typically 2–5 kpc). The **bulge** follows a Sérsic profile (often with \(n \approx 4\) for classical bulges, \(n \approx 1\) for pseudobulges). The **bulge-to-total ratio** (B/T) is high for Sa-type galaxies (\(B/T \sim 0.6\)) and decreases along the Hubble sequence to \(B/T < 0.1\) for Scd galaxies.

**Pseudobulges** — bulges with disk-like properties (low Sérsic index, rotation-dominated kinematics, ongoing star formation, the presence of nuclear bars or rings) — are thought to form via secular evolution of disk material, rather than by merger-driven hierarchical assembly as in classical bulges. The distinction between classical and pseudo-bulges has important implications for galaxy formation theory.

---

# Chapter 6: The Distribution of Galaxies

## Large-Scale Structure

Galaxies are not distributed uniformly in space. On scales of tens to hundreds of Mpc, they are organized into a cosmic web of **filaments**, **sheets** (walls), **clusters**, and **voids**. This **large-scale structure** (LSS) grew from tiny quantum fluctuations in density during inflation, amplified by gravitational instability over the \(\sim 13.8\) Gyr age of the universe.

The CfA Redshift Survey (1977–1982, de Lapparent, Geller & Huchra) and subsequent surveys (2dF Galaxy Redshift Survey, Sloan Digital Sky Survey) revealed this structure in three dimensions by combining galaxy positions on the sky with redshift-based distances. The SDSS catalogued over a million galaxy spectra and showed: the **Sloan Great Wall** (a filamentary superstructure \(\sim 420\) Mpc long), the characteristic scale of baryon acoustic oscillations (\(\sim 150\) Mpc), and the statistical properties of galaxy clustering in exquisite detail.

## Galaxy Counts and the Luminosity Function

The **galaxy luminosity function** (GLF) \(\Phi(L)\, dL\) gives the number density of galaxies per unit volume with luminosities in the interval \(\left[L, L+dL\right]\). The Schechter (1976) function provides an excellent empirical fit:

\[\Phi(L)\, dL = \Phi^*\, \left(\frac{L}{L^*}\right)^\alpha\, \exp\!\left(-\frac{L}{L^*}\right)\, \frac{dL}{L^*},\]

where \(L^*\) is a characteristic luminosity (\(M^*_B \approx -20.5\) for \(B\)-band), \(\Phi^*\) is a normalization (\(\sim 2 \times 10^{-2}\) Mpc\(^{-3}\)), and \(\alpha\) is the faint-end slope (typically \(\alpha \approx -1.2\), so there are many more faint galaxies than bright ones per unit luminosity interval, but the number diverges only logarithmically at \(L\to 0\)).

The Schechter function has a characteristic shape: a power-law rise at low luminosities, exponential cutoff at \(L^*\). The total luminosity density is dominated by galaxies near \(L^*\). The steep faint end implies a very large number of faint dwarf galaxies per bright galaxy — a fact that has significant consequences for understanding dark matter substructure (the **missing satellites problem**).

## Galaxy Environments

Galaxy properties depend strongly on environment. In dense environments (galaxy clusters), galaxies are predominantly early-type (elliptical and lenticular), red, gas-poor, and quiescent. In the field, late-type (spiral and irregular), blue, gas-rich, star-forming galaxies dominate. This is the **morphology-density relation**, first quantified by Dressler (1980).

The physical mechanisms driving environmental effects are discussed in Chapter 15 (galaxy clusters), but include: ram pressure stripping (hot intracluster gas strips cold ISM from infalling galaxies), tidal stripping, galaxy harassment (cumulative effect of many high-speed encounters), and strangulation/starvation (removal of hot halo gas that would otherwise cool and replenish the ISM).

## Galaxy Groups

Most galaxies live not in isolated field environments but in **galaxy groups** — bound collections of 3 to \(\sim 50\) galaxies with total masses \(\sim 10^{13}\) M\(_\odot\). The **Local Group** is our own galaxy group, containing the Milky Way, Andromeda (M31), Triangulum (M33), and \(\sim 80\) dwarf galaxies within a radius of \(\sim 1.5\) Mpc. The Local Group has a total mass of \(\sim 3 \times 10^{12}\, M_\odot\), roughly equally divided between the Milky Way and M31 halos.

---

# Chapter 7: The Great Debate

## Historical Context

The question of the true nature and scale of "spiral nebulae" — fuzzy extended objects visible in telescopes since the 18th century — was one of the great unresolved controversies of early 20th-century astronomy. The **Great Debate** of 1920, held at the Smithsonian Institution in Washington D.C. between Harlow Shapley and Heber Curtis, crystallized the two competing views.

## Shapley vs. Curtis

**Harlow Shapley** argued that the universe was essentially the Milky Way alone — a large "galaxy" of unprecedented scale. He had recently (1918) used Cepheid variable stars in globular clusters to determine that the Galactic center was far from the Sun (he found a distance of \(\sim 50\) kpc, an overestimate due to uncorrected dust extinction, but the correct qualitative result). His model had the Milky Way \(\sim 100\) kpc in diameter, which would make the spiral nebulae internal objects or relatively nearby companions. He also cited Adriaan van Maanen's claimed measurements of angular rotation of the spiral M101 — if real, the implied linear rotation speed at cosmic distances would be superluminal.

**Heber Curtis** argued for the **island universe hypothesis** — that spiral nebulae were external galaxies comparable to the Milky Way, at distances of hundreds of thousands to millions of light-years. He noted: (1) novae in the Andromeda Nebula appeared much fainter than typical Galactic novae, implying great distance; (2) the distribution of spirals on the sky avoided the Galactic plane (the "zone of avoidance"), suggesting they were external objects attenuated by Galactic dust; (3) the spiral nebulae showed Doppler shifts too large to be Galactic objects.

## Resolution: Hubble's 1923 Discovery

The debate was settled definitively in 1923 when **Edwin Hubble** used the 100-inch Hooker Telescope at Mount Wilson to resolve individual Cepheid variable stars in the Andromeda Nebula (M31). Applying the Leavitt period-luminosity relation (calibrated by Shapley for Galactic Cepheids), Hubble derived a distance of \(\sim 285\) kpc (his calibration was off due to the unrecognized distinction between Type I and Type II Cepheids, but this was corrected by Walter Baade in 1952 to \(\sim 500\) kpc — close to the modern value of 780 kpc). Andromeda was unambiguously well outside any reasonable boundary for the Milky Way.

The implications were staggering. The universe was vastly larger than previously supposed, filled with billions of galaxies each comparable to our own. Van Maanen's rotation measurements were subsequently shown to be erroneous (the angular rotations he "measured" were spurious, likely a result of systematic errors in his plate measurements).

## Hubble's Law and the Expanding Universe

Between 1924 and 1929, Hubble combined his extragalactic distances with Vesto Slipher's earlier spectroscopic measurements of galaxy radial velocities (most showing redshifts — recession). In 1929 Hubble published the velocity-distance relation that bears his name:

\[v = H_0\, d.\]

This linear relationship, now called **Hubble's law**, had been predicted theoretically by Alexander Friedmann (1922) and Georges Lemaître (1927) as a consequence of Einstein's general relativistic equations for a homogeneous, isotropic, expanding universe. It provided the first direct observational evidence for cosmic expansion — the discovery that redefined our cosmological worldview and led eventually to the Big Bang model.

---

# Chapter 8: Gravity and the Virial Theorem

## Self-Gravitating Systems

Galaxies are self-gravitating systems: the dominant force shaping their structure is the mutual gravitational attraction of their constituent matter. To understand galaxy dynamics, we must apply Newtonian gravity (and, where necessary, general relativity) to systems of \(\sim 10^{11}\) particles — far too many to simulate individually. Statistical approaches are required.

## The Gravitational Potential

For a continuous mass distribution with density \(\rho(\mathbf{r})\), the **gravitational potential** \(\Phi(\mathbf{r})\) satisfies Poisson's equation:

\[\nabla^2\Phi = 4\pi G\rho.\]

The potential is related to the force per unit mass (gravitational acceleration) by \(\mathbf{g} = -\nabla\Phi\). For a spherically symmetric distribution, the only component of \(\mathbf{g}\) is radial:

\[g_r = -\frac{d\Phi}{dr} = -\frac{GM(r)}{r^2},\]

where \(M(r) = \int_0^r 4\pi r'^2 \rho(r')\, dr'\) is the mass enclosed within radius \(r\).

The **circular velocity** in the equatorial plane of an axisymmetric mass distribution is

\[v_c^2(R) = R \frac{\partial\Phi}{\partial R}\bigg|_{z=0} = \frac{GM(R)}{R}\]

for a spherical distribution. For a disk-dominated system, the full calculation requires integrating over the disk potential, but the enclosed-mass formula remains a useful approximation.

## Potential Energy of a Self-Gravitating System

The **gravitational potential energy** (or gravitational self-energy) of a system is the work done in assembling it from dispersed material at infinity:

\[W = -\frac{1}{2}\int \rho(\mathbf{r})\,\Phi(\mathbf{r})\, d^3r.\]

The factor of \(1/2\) avoids double-counting each pair. For a uniform sphere of mass \(M\) and radius \(R\):

\[W = -\frac{3GM^2}{5R}.\]

For a more concentrated distribution (like an \(R^{1/4}\) profile), the coefficient is larger: \(W \approx -0.4 GM^2/R_e\).

## The Virial Theorem

The **virial theorem** is one of the most powerful tools in astrophysics. Consider a gravitationally bound system in **dynamical equilibrium** (neither collapsing nor dispersing). The theorem states:

<div class="theorem">
<strong>Virial Theorem.</strong> For a gravitationally bound system in steady state,

\[2K + W = 0,\]

where \(K\) is the total kinetic energy and \(W\) is the total gravitational potential energy. Equivalently, \(K = -W/2 = -E/1\) where \(E = K + W\) is the total energy.
</div>

**Derivation.** Define the scalar moment of inertia \(\mathcal{I} = \sum_i m_i r_i^2\). Its second time derivative is

\[\ddot{\mathcal{I}} = 2\sum_i m_i \dot{\mathbf{r}}_i^2 + 2\sum_i m_i \mathbf{r}_i \cdot \ddot{\mathbf{r}}_i = 4K + 2\sum_i m_i \mathbf{r}_i \cdot \mathbf{F}_i/m_i.\]

The last term, by Newton's law for gravity, equals \(2W\) (this step requires the \(r^{-2}\) force law — it works for any power-law force \(F \propto r^n\) by Euler's homogeneous function theorem). For a system in steady state, \(\ddot{\mathcal{I}} = 0\), giving \(2K + W = 0\).

### Applications of the Virial Theorem

**Galaxy masses from velocity dispersions.** For an elliptical galaxy in virial equilibrium with stellar velocity dispersion \(\sigma\), the virial theorem gives

\[M \sim \frac{5\sigma^2 R_e}{G},\]

where the numerical coefficient \(\sim 5\) depends on the geometry and the density profile. This provides a **dynamical mass estimate** without assuming anything about the mass-to-light ratio.

**Cluster masses from galaxy velocities.** For a galaxy cluster with \(N\) member galaxies with velocity dispersion \(\sigma_\text{cl}\) and radius \(R_\text{cl}\),

\[M_\text{cl} \approx \frac{5\sigma_\text{cl}^2 R_\text{cl}}{G}.\]

Fritz Zwicky applied exactly this logic in 1933 to the Coma cluster, obtaining a mass hundreds of times larger than what was visible in stars — the **first evidence for dark matter** in an external system.

**Crossing time and relaxation.** The **crossing time** of a self-gravitating system is the time for a typical member to cross the system:

\[t_\text{cross} \sim \frac{R}{\sigma} \sim \sqrt{\frac{R^3}{GM}}.\]

For the Milky Way disk (\(R \sim 10\) kpc, \(\sigma \sim 50\) km s\(^{-1}\)): \(t_\text{cross} \sim 200\) Myr, much less than the Hubble time \(\sim 14\) Gyr. So galaxies have completed many dynamical crossings and can be in approximate dynamical equilibrium. Globular clusters (\(R \sim 5\) pc, \(\sigma \sim 10\) km s\(^{-1}\)): \(t_\text{cross} \sim 0.5\) Myr; also well-relaxed.

The **two-body relaxation time** — the timescale for gravitational encounters between pairs of stars to significantly alter individual orbits — is much longer:

\[t_\text{relax} \sim \frac{N}{8\ln N}\, t_\text{cross}.\]

For a galaxy with \(N \sim 10^{11}\) stars, \(t_\text{relax} \sim 10^{21}\) yr — vastly longer than the age of the universe. This means galaxy-scale stellar systems are **collisionless**: individual star-star gravitational scatterings are negligible, and the dynamics is governed entirely by the smooth mean-field gravitational potential. This is the key simplification that makes the next chapter possible.

---

# Chapter 9: The Collisionless Boltzmann Equation

## From N-Body to Phase Space

Because galaxies are collisionless (\(t_\text{relax} \gg t_\text{Hubble}\)), the statistical state of a stellar system is fully described by the **distribution function** (DF) \(f(\mathbf{x}, \mathbf{v}, t)\), defined such that

\[dN = f(\mathbf{x}, \mathbf{v}, t)\, d^3x\, d^3v\]

is the number of stars in the phase-space volume element \(d^3x\, d^3v\) around position \(\mathbf{x}\) and velocity \(\mathbf{v}\) at time \(t\). The DF is a non-negative function on 6-dimensional phase space.

The mass density is recovered by integrating over velocities:

\[\rho(\mathbf{x}, t) = m\int f(\mathbf{x}, \mathbf{v}, t)\, d^3v,\]

where \(m\) is the stellar mass (assuming identical stars for simplicity). The mean streaming velocity (bulk flow) is

\[\overline{\mathbf{v}}(\mathbf{x}, t) = \frac{1}{n}\int \mathbf{v}\, f\, d^3v,\]

where \(n = \rho/m\).

## Deriving the CBE

In a collisionless system, stars move under the influence of the smooth mean-field potential \(\Phi(\mathbf{x}, t)\) only — no sudden kicks from individual encounters. The phase-space fluid is therefore **incompressible** in the sense of Liouville's theorem: the 6-dimensional phase-space density along a stellar orbit is constant. Mathematically, this is the **Collisionless Boltzmann Equation** (CBE), also called the **Vlasov equation**:

<div class="theorem">
<strong>Collisionless Boltzmann Equation (CBE).</strong>

\[\frac{\partial f}{\partial t} + \mathbf{v}\cdot\frac{\partial f}{\partial \mathbf{x}} - \nabla\Phi\cdot\frac{\partial f}{\partial \mathbf{v}} = 0.\]

Equivalently, \(df/dt = 0\) following the flow in phase space.
</div>

**Derivation from continuity.** The CBE is simply the continuity equation in 6-dimensional phase space. The "fluid" has density \(f\) and velocity \((\dot{\mathbf{x}}, \dot{\mathbf{v}}) = (\mathbf{v}, -\nabla\Phi)\). Continuity gives

\[\frac{\partial f}{\partial t} + \frac{\partial}{\partial \mathbf{x}}\cdot(f\mathbf{v}) + \frac{\partial}{\partial \mathbf{v}}\cdot(-f\nabla\Phi) = 0.\]

Since \(\partial v_i/\partial x_i = 0\) (velocity and position are independent coordinates) and \(\partial(\partial\Phi/\partial x_i)/\partial v_i = 0\) (the potential doesn't depend on velocity), the divergences act only on \(f\), giving the CBE.

## The Jeans Equations

Directly solving the CBE for \(f\) is generally intractable. A more practical approach is to take **velocity moments** of the CBE, integrating over all velocities. The zeroth moment gives the **continuity equation**:

\[\frac{\partial\rho}{\partial t} + \nabla\cdot(\rho\overline{\mathbf{v}}) = 0.\]

The first moment (multiply CBE by \(v_j\), integrate) gives the **Jeans equations** — the stellar-dynamics analog of the Euler equations of fluid dynamics:

\[\rho\frac{\partial \overline{v}_j}{\partial t} + \rho(\overline{\mathbf{v}}\cdot\nabla)\overline{v}_j = -\rho\frac{\partial\Phi}{\partial x_j} - \frac{\partial(\rho\sigma_{ij}^2)}{\partial x_i},\]

where \(\sigma_{ij}^2 = \overline{v_i v_j} - \overline{v}_i\, \overline{v}_j\) is the **velocity dispersion tensor**. The last term is the divergence of the stress tensor — the "pressure" in the stellar fluid — arising from the random motions of stars.

### The Spherical Jeans Equation

For a spherically symmetric, non-rotating, steady-state system with isotropic velocity dispersion \(\sigma_r = \sigma_\theta = \sigma_\phi = \sigma\), the Jeans equations reduce to

\[\frac{d(\rho\sigma_r^2)}{dr} + \frac{2\beta\rho\sigma_r^2}{r} = -\rho\frac{d\Phi}{dr} = \frac{\rho G M(r)}{r^2},\]

where \(\beta \equiv 1 - \sigma_\theta^2/\sigma_r^2\) is the **anisotropy parameter**: \(\beta = 0\) for isotropic dispersions, \(\beta = 1\) for purely radial orbits, \(\beta \to -\infty\) for purely tangential orbits.

This is the key equation for **mass modeling** of elliptical galaxies and galaxy clusters. Observationally, we measure the **line-of-sight velocity dispersion** \(\sigma_\text{los}(R)\) as a function of projected radius \(R\). To extract the 3D mass profile \(M(r)\), we must assume a form for \(\beta(r)\) (often \(\beta = 0\) as a starting point) and project the 3D Jeans equation solution onto the sky. The result is

\[\sigma_\text{los}^2(R) = \frac{2}{I(R)}\int_R^\infty \left(1 - \beta\frac{R^2}{r^2}\right)\frac{\rho\sigma_r^2\, r\, dr}{\sqrt{r^2 - R^2}},\]

which can be solved numerically given models for \(\rho(r)\), \(\beta(r)\), and \(\Phi(r)\).

### The Mass-Anisotropy Degeneracy

A fundamental limitation of the Jeans equation approach is the **mass-anisotropy degeneracy**: different combinations of mass profile \(M(r)\) and anisotropy profile \(\beta(r)\) can produce the same projected velocity dispersion profile. This degeneracy cannot be broken with \(\sigma_\text{los}(R)\) alone. Methods to break it include: (1) measuring the full line-of-sight velocity distribution (LOSVD), including higher moments like skewness \(h_3\) and kurtosis \(h_4\); (2) comparing multiple tracer populations; (3) measuring proper motions.

## Jeans Theorem and Integrals of Motion

In a steady-state, collisionless system, the CBE requires \(df/dt = 0\). A natural class of solutions has \(f\) depending on phase-space coordinates only through **integrals of motion** — quantities that are conserved along orbits. For a time-independent potential, the energy \(E = \frac{1}{2}v^2 + \Phi(\mathbf{r})\) is always an integral. For a spherically symmetric potential, the magnitude of angular momentum \(L = |\mathbf{r}\times\mathbf{v}|\) is also an integral. For an axisymmetric potential (like a disk galaxy), the \(z\)-component \(L_z\) is conserved but \(L\) is not.

<div class="theorem">
<strong>Jeans Theorem.</strong> Any steady-state solution of the CBE in a given potential depends on the phase-space coordinates only through the isolating integrals of motion in that potential. Conversely, any non-negative function of the isolating integrals is a steady-state solution.
</div>

The simplest application: for a spherical system, \(f = f(E)\) gives an isotropic DF (\(\beta = 0\)); \(f = f(E, L^2)\) can give any anisotropy profile. The **isotropic King models** (\(f \propto e^{-E/\sigma^2} - 1\) for \(E < 0\), zero for \(E > 0\)) are widely used to model globular clusters.

---

# Chapter 10: Dark Matter

## Evidence for Dark Matter

Dark matter — matter that does not emit, absorb, or scatter light but exerts gravitational force — is one of the most profound discoveries in modern astrophysics. Evidence comes from many independent observations spanning an enormous range of scales.

### Galaxy Rotation Curves

As discussed in Chapter 2, the rotation curves of spiral galaxies are **flat** (or gently rising) at large radii, rather than declining as expected if the visible matter (stars + gas) were the only mass. For a stellar disk with surface density \(\Sigma(R) \propto e^{-R/h_R}\), the resulting rotation curve peaks near \(R \sim 2h_R\) then declines. The observed flat rotation curves require an additional mass component whose density profile \(\rho_\text{DM}(r) \propto r^{-2}\) at large radii (since flat \(v_c\) requires \(M(r) \propto r\) which requires \(\rho \propto r^{-2}\)).

The mass discrepancy grows with radius: at \(R \sim h_R\), the disk and dark matter contribute comparably, but at \(R \sim 10h_R\), dark matter dominates by a factor of \(\sim 10\). This is the basis for the concept of a **dark matter halo** surrounding the visible galaxy.

The **NFW profile** (Navarro, Frenk & White 1996), derived from N-body simulations of dark matter halos, has the form

\[\rho_\text{NFW}(r) = \frac{\rho_s}{(r/r_s)(1 + r/r_s)^2},\]

where \(r_s\) is the scale radius and \(\rho_s\) is the characteristic density. This profile has \(\rho \propto r^{-1}\) (a "cusp") at small radii and \(\rho \propto r^{-3}\) at large radii, with the transition near \(r_s\). The NFW profile is specified by two parameters: \(r_s\) and the **concentration** \(c = r_{200}/r_s\), where \(r_{200}\) is the virial radius (inside which the mean density is 200 times the critical density).

<div class="example">
<strong>Example: Milky Way dark matter halo.</strong> Fitting the rotation curve of the Milky Way with an NFW profile and the observed baryonic (stars + gas) distribution, one finds: \(r_s \approx 20\) kpc, \(r_{200} \approx 200\) kpc, \(c \approx 10\), and a total virial mass \(M_{200} \approx 10^{12}\, M_\odot\). Only \(\sim 5\%\) of this is in visible baryonic matter.
</div>

### Clusters of Galaxies: Zwicky's Argument

In 1933, Fritz Zwicky applied the virial theorem to the Coma cluster, a rich cluster of \(\sim 1000\) galaxies at \(\sim 100\) Mpc. He measured galaxy radial velocities and found a velocity dispersion \(\sigma \approx 1000\) km s\(^{-1}\). With an estimated cluster radius \(R \sim 1\) Mpc, the virial mass estimate gives:

\[M_\text{vir} \sim \frac{5\sigma^2 R}{G} \approx \frac{5 \times (10^6 \text{ m/s})^2 \times 3 \times 10^{22} \text{ m}}{6.67 \times 10^{-11}} \approx 2 \times 10^{45} \text{ kg} \approx 10^{15} M_\odot.\]

The luminosity in stars implied a mass of only \(\sim 10^{13} M_\odot\), a factor of \(\sim 100\) discrepancy. Zwicky coined the term **dunkle Materie** (dark matter) for the missing mass. Though the precise factor is now revised (due to better measurements and the recognition that much of the cluster mass is in hot X-ray gas, not just stars), the factor-of-\(\sim 5\) discrepancy between total virial mass and baryonic mass remains.

### Gravitational Lensing

General relativity predicts that mass curves spacetime, deflecting the paths of light rays. A mass distribution acting as a **gravitational lens** distorts the images of background sources. The **Einstein radius** of a point mass \(M\) at lens distance \(D_L\) acting on a source at distance \(D_S\) is

\[\theta_E = \sqrt{\frac{4GM}{c^2}\frac{D_{LS}}{D_L D_S}},\]

where \(D_{LS}\) is the lens-to-source distance. For a galaxy cluster with \(M \sim 10^{14} M_\odot\), \(\theta_E \sim\) arcminutes. The lensing mass (derived from the geometry of arcs, arclets, and Einstein rings) consistently matches the virial mass and significantly exceeds the baryonic mass.

The **Bullet Cluster** (1E 0657-558) provides perhaps the most direct visual evidence for dark matter. It is a post-collision system of two galaxy clusters where: (a) the hot X-ray gas (traced by Chandra) was decelerated by ram pressure and sits between the two galaxy concentrations; (b) the dark matter halos (traced by weak gravitational lensing) passed through each other essentially undecelerated, remaining co-located with the galaxies. The spatial offset between the gas (baryonic) and the lensing mass directly demonstrates that most of the cluster mass is in a collisionless (non-interacting) component.

### Cosmological Evidence

On the largest scales, dark matter is required by: (1) the power spectrum of CMB temperature anisotropies — the relative heights of acoustic peaks constrain the baryon-to-dark-matter ratio, yielding \(\Omega_m h^2 \approx 0.143\) with \(\Omega_b h^2 \approx 0.022\), implying \(\Omega_\text{DM} \approx 0.27\); (2) the matter power spectrum of galaxy clustering, which peaks at the scale set by the horizon at matter-radiation equality (determined by dark matter density); (3) Big Bang nucleosynthesis, which constrains \(\Omega_b h^2\) and shows there is insufficient baryonic matter to account for all gravitating matter.

## Dark Matter Candidates

The identity of dark matter is unknown. Constraints rule out most Standard Model particles, requiring new physics. The main candidates are:

**WIMPs (Weakly Interacting Massive Particles):** Hypothetical particles with mass \(\sim\) 10–1000 GeV and weak-scale interactions. Theoretically motivated by supersymmetry (e.g., neutralinos). They naturally achieve the observed relic abundance through the **WIMP miracle**: if a particle with weak-scale cross section \(\langle\sigma v\rangle \sim 3 \times 10^{-26}\) cm\(^3\) s\(^{-1}\) freezes out in the early universe, it has \(\Omega_\text{DM} \approx 0.27\). Despite extensive direct detection experiments (LUX, XENON1T, PandaX), indirect detection searches (Fermi-LAT), and LHC searches, WIMPs remain undetected as of 2025.

**Axions:** Ultra-light pseudoscalar particles (\(m \sim 10^{-5}\) eV) originally proposed to solve the strong CP problem in QCD. If they exist, they would form a Bose-Einstein condensate as cold dark matter. The CASPEr and ADMX experiments are searching for axions.

**Primordial Black Holes (PBHs):** Black holes formed in the early universe before nucleosynthesis. LIGO detections of merging \(\sim 30 M_\odot\) black holes renewed interest, but microlensing surveys (MACHO, EROS, Subaru Hyper Suprime-Cam) strongly constrain the fraction of dark matter in PBHs across most of the mass range.

**Sterile neutrinos, fuzzy dark matter, self-interacting dark matter:** Various other candidates addressing tensions in the standard CDM model (core-cusp problem, missing satellites problem, too-big-to-fail problem).

The **\(\Lambda\)CDM paradigm** — dark energy (\(\Lambda\)) plus cold dark matter — remains the standard cosmological model, successfully explaining structure formation from CMB scales to galaxy clusters, despite the unresolved question of the particle identity of dark matter.

---

# Chapter 11: Galaxy Formation and the Baryon Cycle

## The Cosmological Context

Galaxies form when baryons cool and condense at the centers of dark matter halos. This process is embedded in the hierarchical growth of cosmic structure: small dark matter halos form first (at high redshift), then merge and accrete to form larger halos over cosmic time. The **merger tree** of a present-day massive galaxy includes thousands of progenitor halos spanning a wide range of masses and formation epochs.

The key question galaxy formation theory must answer is: why do galaxies have the properties they do? Why is there a bimodal color distribution? Why does the stellar mass function differ so dramatically from the dark matter halo mass function? Why are the most massive halos so inefficient at forming stars?

## Cooling and the Formation of Disks

Gas accreted onto dark matter halos is shock-heated to the **virial temperature** of the halo:

\[T_\text{vir} = \frac{\mu m_p}{2 k_B} \frac{GM}{r} \approx \frac{\mu m_p \sigma^2}{k_B},\]

where \(\mu\) is the mean molecular weight (\(\approx 0.6\) for fully ionized gas). For a Milky Way-mass halo (\(M \sim 10^{12} M_\odot\), \(\sigma \sim 150\) km s\(^{-1}\)): \(T_\text{vir} \sim 10^6\) K. For a cluster (\(\sigma \sim 1000\) km s\(^{-1}\)): \(T_\text{vir} \sim 10^7\)\text{–}\(10^8\) K.

For the halo gas to condense into stars, it must first **cool** — radiate away its thermal energy on a timescale shorter than the dynamical (free-fall) time. The dominant cooling processes are:

- **Bremsstrahlung** (free-free): dominant for \(T > 10^7\) K; \(\Lambda \propto T^{1/2}\)
- **Metal-line cooling**: dominant for \(10^4 < T < 10^7\) K; depends on metallicity
- **Hydrogen and helium recombination/excitation**: important near \(10^4\) K

The cooling rate per unit volume is \(n^2 \Lambda(T, Z)\) where \(\Lambda\) is the cooling function. The **cooling time** is

\[t_\text{cool} = \frac{(3/2) n k_B T}{n^2 \Lambda(T,Z)} = \frac{3 k_B T}{2 n \Lambda(T,Z)}.\]

The condition for gas to cool and collapse is \(t_\text{cool} < t_\text{ff} \sim (G\rho)^{-1/2}\). This condition is met efficiently in halos with \(M \lesssim 10^{12} M_\odot\) (where \(T_\text{vir} \lesssim 10^6\) K and cooling by metal lines is efficient) but not in massive cluster halos (where \(T_\text{vir} \sim 10^8\) K and cooling is slow). This **cooling threshold** helps explain why massive halos host few stars relative to their total mass.

If angular momentum is conserved as the gas cools (since cold dense gas can no longer exchange angular momentum efficiently with the dark matter), it settles into a rotating **disk** whose radius is set by the centrifugal balance:

\[r_\text{disk} \sim \frac{j_\text{gas}}{v_c},\]

where \(j_\text{gas}\) is the specific angular momentum of the gas. The angular momentum of dark matter halos is characterized by the **spin parameter** \(\lambda = J |E|^{1/2}/(G M^{5/2})\), with \(\lambda \sim 0.03\text{–}0.1\) in simulations. This naturally gives disk scale radii of a few kpc in Milky Way-mass halos, consistent with observations.

## Stellar Feedback

Without additional physics, cooling models predict far too many stars: virtually all baryons in halos with \(t_\text{cool} < t_\text{ff}\) would cool and form stars. Observed galaxies have star formation efficiencies (\(M_*/M_\text{halo}\)) of at most a few percent. The suppression of star formation is attributed to **feedback**: energy and momentum input from stars and AGN that heats and expels gas, disrupting the cooling flow.

### Supernova Feedback

Core-collapse supernovae (Type II) occur when massive stars (\(M > 8\, M_\odot\)) exhaust their nuclear fuel and implode. Each supernova releases \(\sim 10^{44}\) J in kinetic energy of the ejecta (the total energy release is \(\sim 10^{46}\) J, mostly in neutrinos). The supernova **remnant** shocks the ISM, heating it to \(\sim 10^7\) K. In low-mass galaxies (dwarf galaxies), the potential well is shallow enough that supernova-driven outflows can expel the gas entirely — this is the mechanism for **supernova-driven winds** that quench star formation in dwarfs.

The energy available from supernovae per unit stellar mass formed is

\[E_\text{SN}/M_* \approx \frac{10^{44} \text{ J}}{100\, M_\odot} = 10^{42} \text{ J}/M_\odot,\]

using a rough rate of one supernova per 100 \(M_\odot\) of stars formed (for a Salpeter IMF, roughly one supernova per 100 \(M_\odot\) of stars). Whether this energy can couple efficiently to the ISM to drive outflows is a question of feedback efficiency \(\epsilon_\text{SN}\), which varies from \(\sim 1\%\) in dense starbursts to \(\sim 40\%\) in dwarf galaxies.

### AGN Feedback

In massive halos (\(M \gtrsim 10^{12} M_\odot\)) where supernovae are insufficient (the halo binding energy exceeds the SN energy budget), **AGN feedback** is invoked to suppress star formation and maintain the quiescence of massive elliptical galaxies. Two modes are distinguished:

- **Quasar mode** (radiative mode): During gas-rich mergers or accretion episodes, the central black hole accretes at near-Eddington rates, producing a luminous quasar. The broad absorption line winds and quasar radiation can drive outflows of \(\sim 1000\) km s\(^{-1}\), sweeping out the ISM.

- **Radio mode** (kinetic/jet mode): At low accretion rates, the AGN launches relativistic jets that heat the diffuse hot gas in cluster halos. This prevents the hot gas from cooling and feeding the galaxy — a form of **maintenance-mode feedback** that keeps the galaxy red and dead.

Evidence for AGN feedback includes: cavities (bubbles) in X-ray cluster gas coincident with radio jet lobes; correlations between black hole mass and stellar velocity dispersion (the \(M_\bullet\text{–}\sigma\) relation); the truncation of the galaxy luminosity function at high masses.

## The Baryon Cycle

The **baryon cycle** describes the flow of gas through the galaxy ecosystem: cosmological accretion from the cosmic web → cooling → the ISM → star formation → stellar evolution and feedback (winds, supernovae, AGB mass loss) → enrichment of the ISM and circumgalactic medium → potential re-accretion. The **circumgalactic medium** (CGM) — gas extending from the disk edge to the virial radius — is the interface between the galaxy and the cosmic web, and plays a central role in regulating the baryon cycle.

Key observational probes of the CGM: UV absorption spectroscopy of quasar sightlines passing through galaxy halos (detecting Lyman-\(\alpha\), OVI, CIV, MgII); X-ray emission from hot halo gas around massive galaxies; radio 21-cm emission from cold halo clouds.

## The \(M_\bullet\)-\(\sigma\) Relation

One of the most striking empirical correlations in extragalactic astronomy is the tight relation between the mass of a galaxy's supermassive black hole and the stellar velocity dispersion of its bulge:

\[M_\bullet \approx 1.5 \times 10^8 M_\odot \left(\frac{\sigma}{200 \text{ km/s}}\right)^5.\]

The scatter is remarkably small (\(\sim 0.3\) dex). Given that the black hole's gravitational sphere of influence (\(r_\text{infl} = G M_\bullet/\sigma^2 \sim 10\text{–}100\) pc) is tiny compared to the bulge (\(\sim\) kpc), this relation implies a **co-evolution** between black hole growth and galaxy formation — likely mediated by AGN feedback. Building a self-consistent model of this co-evolution remains an active area of research.

---

# Chapter 12: Active Galactic Nuclei

## Overview

An **Active Galactic Nucleus** (AGN) is a compact, luminous region at the center of a galaxy powered by accretion of matter onto a supermassive black hole. AGN span a vast range of luminosities and observed properties, but all share the common engine: a black hole of \(10^6\)\text{–}\(10^{10}\, M_\odot\) surrounded by an **accretion disk**.

The bolometric luminosity available from accretion is

\[L = \epsilon \dot{M} c^2,\]

where \(\dot{M}\) is the mass accretion rate and \(\epsilon \sim 0.1\) is the **radiative efficiency** (fraction of rest-mass energy radiated). For a Schwarzschild black hole, \(\epsilon \approx 0.057\); for a maximally spinning Kerr black hole, \(\epsilon \approx 0.42\). This makes black hole accretion vastly more efficient than nuclear fusion (\(\epsilon_\text{fusion} \approx 0.007\)).

The **Eddington luminosity** is the maximum luminosity for which radiation pressure does not exceed gravity on infalling gas (assuming electron scattering opacity):

\[L_\text{Edd} = \frac{4\pi G M_\bullet m_p c}{\sigma_T} \approx 1.3 \times 10^{38} \frac{M_\bullet}{M_\odot} \text{ erg s}^{-1} \approx 3.2 \times 10^4 \frac{M_\bullet}{M_\odot} L_\odot.\]

Defining the **Eddington ratio** \(\lambda_\text{Edd} = L/L_\text{Edd}\), most quasars near peak activity have \(\lambda_\text{Edd} \sim 0.1\text{–}1\). Low-luminosity AGN (LLAGNs) and radio galaxies can have \(\lambda_\text{Edd} \ll 0.01\).

## The Unified Model

The rich taxonomy of AGN — Seyfert 1 and 2 galaxies, quasars, BL Lac objects, flat-spectrum and steep-spectrum radio sources, blazars — is largely understood through the **unified model** of Antonucci (1993) and Urry & Padovani (1995). In this model, all AGN share the same basic structure:

1. **Supermassive black hole** at the center.
2. **Accretion disk**: radiates thermally from UV to soft X-rays; the "big blue bump" in quasar SEDs. The disk temperature profile follows \(T(r) \propto r^{-3/4}\) for a standard Shakura-Sunyaev thin disk.
3. **Broad Line Region (BLR)**: dense (\(n \sim 10^9\text{–}10^{12}\) cm\(^{-3}\)), fast-moving (\(\sigma \sim 1000\text{–}10{,}000\) km s\(^{-1}\)) clouds close to the black hole (\(\sim 0.01\text{–}0.1\) pc), producing broad permitted emission lines (Ly\(\alpha\), H\(\alpha\), CIV, MgII).
4. **Dusty torus**: a parsec-scale torus of gas and dust surrounding the BLR. At optical/UV wavelengths it is opaque, blocking direct views of the BLR along equatorial sightlines.
5. **Narrow Line Region (NLR)**: lower-density gas (\(n \sim 10^3\text{–}10^6\) cm\(^{-3}\)) at larger distances (\(\sim\) 100 pc to kpc), ionized by the AGN. Produces narrow forbidden lines (\(\left[\text{OIII}\right]\), \(\left[\text{NII}\right]\), \(\left[\text{OII}\right]\)) visible in both Type 1 and Type 2 AGN.
6. **Jets**: in \(\sim 10\%\) of AGN (radio-loud), relativistic jets are launched perpendicular to the disk, extending from parsec to Mpc scales.

**Orientation determines observed type**: when viewed face-on (pole-on to the torus), we see the BLR and call the object a **Type 1** (Seyfert 1 or quasar). When the torus obscures the BLR, we see only the NLR (Type 2: Seyfert 2, obscured quasar). When the jet points toward us, relativistic Doppler boosting amplifies the emission and we see a **blazar** (BL Lac or flat-spectrum radio quasar, depending on the properties). This orientation-based unification elegantly accounts for most of the observed diversity.

## Accretion Disk Physics

The standard **Shakura-Sunyaev thin disk** (1973) models the accretion disk as concentric annuli of gas in circular Keplerian orbits, with viscosity transporting angular momentum outward and allowing mass to flow inward. In each annulus, the viscous dissipation produces a blackbody flux:

\[T(r) = T_*\left(\frac{r}{r_\text{in}}\right)^{-3/4}\left[1 - \left(\frac{r_\text{in}}{r}\right)^{1/2}\right]^{1/4},\]

where \(T_*\) is a characteristic temperature and \(r_\text{in}\) is the innermost stable circular orbit (ISCO). The disk SED is the sum of blackbodies at different radii:

\[F_\nu \propto \nu^{1/3} \quad \text{for } \nu_\text{min} \ll \nu \ll \nu_\text{max},\]

which produces the characteristic "big blue bump" peaking in the UV. For a \(10^8 M_\odot\) black hole accreting at the Eddington rate, \(T_\text{max} \sim 10^5\) K, corresponding to extreme UV/soft X-ray emission.

## Emission Line Diagnostics

The emission lines of AGN provide powerful diagnostics of the physical conditions in the ionized gas. The **Baldwin-Phillips-Terlevich (BPT) diagram** uses line ratios to separate AGN-ionized gas from HII region (star formation) ionized gas:

\[\text{BPT diagram: } \log\!\left(\frac{\left[\text{OIII}\right]\lambda5007}{\text{H}\beta}\right) \text{ vs. } \log\!\left(\frac{\left[\text{NII}\right]\lambda6583}{\text{H}\alpha}\right).\]

HII regions occupy the left branch (low ionization parameter, stellar UV spectrum), while AGN-ionized gas occupies the right branch (harder spectrum, higher ionization). The BPT diagram is widely used to identify AGN in galaxy surveys and to map AGN-driven outflows within galaxies.

**Reverberation mapping** exploits the light travel time between the accretion disk and the BLR to measure BLR sizes. The time lag \(\tau\) between variations in the continuum (disk) and the response of broad emission lines (BLR) gives \(R_\text{BLR} = c\tau \sim 0.01\text{–}0.1\) pc. Combined with the line width \(\sigma_\text{line}\) as a velocity measure, one can estimate the black hole mass:

\[M_\bullet = f \frac{c\tau \sigma_\text{line}^2}{G},\]

where \(f\) is a geometric factor of order unity. This is one of the primary methods for measuring black hole masses in AGN.

## AGN and Galaxy Evolution

The co-evolution of AGN activity and galaxy star formation over cosmic time provides one of the clearest connections between black hole growth and galaxy growth. Both the **cosmic star formation rate density** and the **AGN luminosity function** peak at \(z \approx 1\text{–}2\) ("cosmic noon") and decline steeply to the present day. The ratio of the integrated black hole mass density to the stellar mass density is roughly constant with redshift — suggesting parallel growth.

Massive quiescent elliptical galaxies were likely quenched by AGN-driven outflows during a luminous quasar phase at \(z \sim 2\text{–}3\), then maintained in quiescence by radio-mode AGN feedback at later times. This "two-phase" model of galaxy quenching is a central paradigm of modern galaxy evolution.

---

# Chapter 13: Galaxy Interactions and Mergers

## Tidal Forces

Galaxies are not isolated — they interact gravitationally with their neighbors. When two galaxies approach, the **differential gravitational force** (tidal force) across one galaxy due to the other distorts the stars and gas from their equilibrium orbits. The tidal acceleration across a galaxy of radius \(R_1\) due to a companion at distance \(d\) is

\[\Delta a \approx \frac{2GM_2 R_1}{d^3},\]

for \(d \gg R_1\). The ratio of the tidal force to the galaxy's self-gravity (\(GM_1/R_1^2\)) gives the **tidal parameter**:

\[\frac{\text{tidal force}}{\text{self-gravity}} \approx 2\frac{M_2}{M_1}\left(\frac{R_1}{d}\right)^3.\]

This is small for well-separated galaxies but becomes order unity when \(d \sim R_1(M_2/M_1)^{1/3}\) — the **tidal (or Roche) limit**. Tidal interactions produce spectacular morphological features: **tidal tails** (stars pulled out into long streams along the orbit), **bridges** (material connecting the two galaxies), and **shells** (arc-like features in the outer envelopes of ellipticals, remnants of disrupted disk galaxies).

## Dynamical Friction

When a massive object (e.g., a satellite galaxy of mass \(M_\text{sat}\)) moves through a background of lighter particles (stars or dark matter), it exerts gravitational attraction on them, creating a trailing density wake. The gravitational back-reaction of this wake on the satellite decelerates it — this is **dynamical friction** (Chandrasekhar 1943). The Chandrasekhar formula for the frictional deceleration is

\[\mathbf{a}_\text{df} = -\frac{4\pi G^2 M_\text{sat} \rho \ln\Lambda}{v^2} \left[\text{erf}(X) - \frac{2X}{\sqrt{\pi}}e^{-X^2}\right] \hat{\mathbf{v}},\]

where \(\rho\) is the background density, \(\ln\Lambda\) is the **Coulomb logarithm** (\(\ln\Lambda \approx \ln(M_\text{host}/M_\text{sat}) \approx 5\text{–}10\)), \(X = v/(\sqrt{2}\sigma)\), and \(\sigma\) is the velocity dispersion of the background. The key scaling is \(a_\text{df} \propto M_\text{sat}\): more massive satellites decelerate faster. The dynamical friction timescale for a satellite on a circular orbit of radius \(r_0\) is

\[t_\text{df} \approx \frac{1.17}{\ln\Lambda}\frac{r_0^2 v_c}{G M_\text{sat}} \approx f(\text{orbit})\, t_\text{cross} \frac{M_\text{host}}{M_\text{sat}}.\]

For a satellite with \(M_\text{sat}/M_\text{host} = 0.01\) on an orbit of \(r_0 = 50\) kpc, \(t_\text{df} \sim 5\) Gyr — comparable to the Hubble time. Massive satellites (\(M_\text{sat}/M_\text{host} \gtrsim 0.1\)) sink rapidly and **merge** within a few dynamical times.

## Major and Minor Mergers

Mergers are classified by the mass ratio:

- **Major mergers**: mass ratio \(\gtrsim 1:4\). Dramatic morphological transformation; both galaxies are severely disrupted. Disk galaxies undergoing a major merger pass through a chaotic **starburst** phase (enhanced star formation as gas is driven to the center by tidal torques) then merge into an elliptical-like remnant. The **Antennae galaxies** (NGC 4038/4039) are the prototypical ongoing major merger, with tidal tails \(\sim 100\) kpc long and a nuclear starburst rate of \(\sim 10\, M_\odot\) yr\(^{-1}\).

- **Minor mergers**: mass ratio \(\lesssim 1:10\). The larger galaxy is less disrupted; the satellite is tidally disrupted and absorbed. Repeated minor mergers can puff up stellar disks (increasing scale height) and contribute to the thick disk and stellar halo. The mass of the Milky Way's stellar halo (\(\sim 10^9\, M_\odot\)) is consistent with the accumulated stellar mass from disrupted dwarf galaxies.

## The Merger Rate

In the \(\Lambda\)CDM model, galaxies grow hierarchically: small galaxies form first and merge to form larger ones. The **merger rate** per galaxy per unit time is predicted to increase with redshift roughly as \((1+z)^{2-3}\). The observed merger fraction (fraction of galaxies showing merger morphology) at \(z \sim 2\) is \(\sim 20\text{–}40\%\), compared to \(\sim 1\text{–}5\%\) in the local universe, consistent with this picture. N-body simulations (the Millennium Simulation, IllustrisTNG, EAGLE) quantify merger histories in detail.

## Formation of Elliptical Galaxies

The standard model holds that massive elliptical galaxies form primarily through major mergers of disk galaxies. Evidence: (1) the kinematic structure of ellipticals (slowly rotating, pressure-supported) matches merger remnants in simulations; (2) ellipticals contain stellar shells, tidal features, and kinematically decoupled cores — all signatures of past mergers; (3) the scaling relations of ellipticals (fundamental plane) are consistent with the virial equilibrium established after violent relaxation in a merger.

**Violent relaxation** (Lynden-Bell 1967) is the rapid phase mixing that occurs during a merger: as the potential fluctuates wildly, stars exchange energy with the time-varying potential, erasing memory of their initial conditions. This drives the system toward a quasi-Maxwellian energy distribution — explaining why merger remnants look smooth and have well-defined Sérsic profiles.

---

# Chapter 14: Galaxy Clusters

## Overview

Galaxy clusters are the most massive gravitationally bound objects in the universe, with total masses of \(10^{14}\text{–}10^{15}\, M_\odot\), hundreds to thousands of member galaxies, and gas temperatures of \(10^7\text{–}10^8\) K. They sit at the nodes of the cosmic web and are powerful cosmological probes because their abundance and evolution are sensitive to cosmological parameters (\(\Omega_m\), \(\sigma_8\)).

The mass budget of a typical cluster is:

- Dark matter: \(\sim 80\%\)
- Intracluster medium (ICM — hot X-ray gas): \(\sim 15\text{–}17\%\)
- Stellar mass in galaxies: \(\sim 2\text{–}5\%\)

## The Intracluster Medium

The ICM is a diffuse, hot, fully ionized plasma trapped in the cluster potential well. At temperatures \(T \sim 10^7\text{–}10^8\) K (\(kT \sim 1\text{–}10\) keV), it is luminous in X-rays via thermal bremsstrahlung:

\[L_X \propto n^2 T^{1/2} V \propto T^2,\]

where the last step uses the virial relation \(T \propto M/R\) and the self-similar scaling \(n \propto M/R^3\). In practice, the observed **\(L_X\text{–}T\)** relation has slope \(L_X \propto T^3\), steeper than the self-similar prediction \(L_X \propto T^2\), due to the entropy injection by AGN and supernovae (non-gravitational heating) that reduces the central density in lower-mass clusters.

X-ray observations with Chandra and XMM-Newton resolve the temperature and density profiles of clusters, allowing **hydrostatic mass estimation**: assuming the ICM is in hydrostatic equilibrium in the cluster potential,

\[\frac{1}{\rho_\text{gas}}\frac{dP}{dr} = -\frac{GM(r)}{r^2},\]

where \(P = n k_B T\) for an ideal gas. Rearranging:

\[M(r) = -\frac{k_B T(r) r}{G \mu m_p}\left(\frac{d\ln\rho_\text{gas}}{d\ln r} + \frac{d\ln T}{d\ln r}\right).\]

This is widely used to measure cluster masses from X-ray data. The hydrostatic mass is typically \(10\text{–}30\%\) lower than the lensing mass, a difference attributed to non-thermal pressure support (bulk motions, turbulence) in the ICM.

## Cluster Mass Measurements

Multiple independent methods are used to measure cluster masses:

1. **Virial analysis of galaxy velocities** (Zwicky 1933): \(M \sim 5\sigma^2 R / G\).
2. **Hydrostatic X-ray mass**: from ICM temperature and density profiles.
3. **Weak gravitational lensing**: statistical shape distortions of background galaxies.
4. **Strong gravitational lensing**: geometry of arcs and Einstein rings near cluster cores.
5. **Sunyaev-Zel'dovich (SZ) effect**: inverse Compton scattering of CMB photons by hot ICM electrons, producing a spectral distortion. The SZ signal is proportional to the integrated pressure (thermal energy) of the ICM and is redshift-independent — making it a powerful mass proxy at high redshift.

These methods generally agree to within \(\sim 20\%\) when applied to relaxed (undisturbed) clusters, providing confidence in the mass estimates.

## Cool Core Clusters and AGN Feedback

In many clusters, the ICM density is high enough near the center that \(t_\text{cool} < t_\text{Hubble}\). Without a heat source, the gas should be cooling and condensing — this was the original "cooling flow" model, predicting central mass deposition rates of \(\sim 100\text{–}1000\, M_\odot\) yr\(^{-1}\). X-ray spectroscopy (particularly with XMM-Newton's Reflection Grating Spectrometer) showed that the observed cooling is far less than predicted: the temperature drops by a factor of \(\sim 3\) toward the center, not to zero. The "missing" cooling is attributed to **AGN feedback** from the central brightest cluster galaxy (BCG).

In **cool core clusters** like Perseus and Virgo (M87), the central radio galaxy drives jets that inflate lobes of relativistic plasma visible as cavities/bubbles in the X-ray image. The mechanical power of the jets (\(P_\text{jet} = 4pV/t\) where \(p\) is the ICM pressure, \(V\) is the bubble volume, and \(t\) is the buoyancy rise time) is of the same order as the cluster cooling luminosity, suggesting that AGN heating balances cooling in a **feedback loop**. This is the observational basis of radio-mode AGN feedback.

## Environmental Effects on Galaxies in Clusters

As galaxies fall into clusters from the field, they experience several environmentally-driven processes that transform their properties:

**Ram pressure stripping**: The hot ICM acts as a headwind on the cold ISM of infalling galaxies. If the ICM ram pressure \(\rho_\text{ICM} v^2\) exceeds the restoring gravitational force per unit area \(\Sigma_* G \Sigma_\text{gas}\), the ISM is stripped:

\[\rho_\text{ICM} v^2 > 2\pi G \Sigma_* \Sigma_\text{gas}.\]

For cluster galaxies with \(v \sim 1000\) km s\(^{-1}\) moving through ICM of density \(n \sim 10^{-3}\) cm\(^{-3}\), even disk gas at \(\sim 10\) kpc can be stripped. **Jellyfish galaxies** — galaxies with spectacular one-sided tails of stripped gas \(\sim 100\) kpc long — are the dramatic observational manifestation of this process, visible in H\(\alpha\), HI, and sometimes X-rays.

**Strangulation (starvation)**: The hot gas corona of an infalling galaxy — the gas reservoir that would replenish the ISM via cooling — is stripped by tidal forces and ram pressure before the disk gas itself. Without resupply, star formation declines over a timescale of \(\sim 1\text{–}2\) Gyr as existing ISM is consumed. This is probably the dominant quenching mechanism for intermediate-mass galaxies in clusters.

**Tidal harassment**: High-speed encounters (\(v_\text{rel} \sim 1000\) km s\(^{-1}\)) between cluster galaxies are too brief to cause dramatic morphological transformation in a single encounter (unlike slow mergers), but cumulative effects over multiple encounters heat the stellar disk, scatter stars to large radii, and strip loosely bound outer material.

---

# Chapter 15: Gravitational Lensing

## Principles of Gravitational Lensing

Einstein's general theory of relativity predicts that mass curves spacetime, causing light rays to follow curved paths. For a mass \(M\), the deflection angle of a light ray passing with impact parameter \(b\) is

\[\hat{\alpha} = \frac{4GM}{c^2 b},\]

a factor of 2 larger than the Newtonian prediction (which misses the contribution from the curvature of space as well as time). This factor of 2 was famously confirmed by Eddington's 1919 solar eclipse expedition, providing the first observational confirmation of GR.

## The Lens Equation

The geometry of gravitational lensing involves a source at angular diameter distance \(D_S\), a lens at \(D_L\), and the source-lens angular diameter distance \(D_{LS}\). An undeflected ray at impact parameter \(b = D_L \theta\) (where \(\theta\) is the observed angle from the lens) would arrive at angular position \(\beta = \theta - \alpha\) on the source plane, where \(\alpha\) is the reduced deflection angle:

\[\alpha(\theta) = \frac{D_{LS}}{D_S} \hat{\alpha} = \frac{4GM}{c^2 D_L \theta} \frac{D_{LS}}{D_S}.\]

The **lens equation** is

\[\beta = \theta - \alpha(\theta).\]

For a point mass, this has two solutions when \(\beta \neq 0\): two images on opposite sides of the lens. When \(\beta = 0\) (perfect alignment), the solution is a ring — the **Einstein ring** — at the Einstein radius

\[\theta_E = \sqrt{\frac{4GM}{c^2}\frac{D_{LS}}{D_L D_S}}.\]

For a galaxy-scale lens (\(M \sim 10^{11} M_\odot\), \(D_L \sim D_S \sim 1\) Gpc): \(\theta_E \sim 1''\). For a cluster (\(M \sim 10^{14} M_\odot\)): \(\theta_E \sim 1'\).

## Strong Lensing

**Strong lensing** occurs when a source falls within the Einstein radius of a lens, producing multiple images, arcs, or Einstein rings. The number and configuration of images depends on the lens mass distribution. Key results:

- **Image magnification**: the lens magnifies the apparent flux of the source. For a point mass, each image is magnified by \(\mu_\pm = (\theta_\pm/\beta)(d\theta_\pm/d\beta)\). The total magnification diverges as \(\beta \to 0\) (caustic crossing).

- **Time delays**: different image paths have different lengths and travel through different depths of the potential. The time delay between images A and B is

\[\Delta t_{AB} = \frac{(1+z_L)}{c}\frac{D_L D_S}{D_{LS}}\left[\frac{1}{2}(\theta_A^2 - \theta_B^2) - (\theta_A - \theta_B)\beta - (\psi(\theta_A) - \psi(\theta_B))\right],\]

where \(\psi(\theta)\) is the projected lens potential. Time delays measured in multiply-imaged quasars (where variability tracks through multiple images) allow measurement of the **Hubble constant** — this is the \(H_0\) measurement from strong lensing (the H0LiCOW program finds \(H_0 \approx 73\) km s\(^{-1}\) Mpc\(^{-1}\), consistent with the distance ladder and in tension with Planck).

## Weak Lensing

**Weak lensing** occurs when the convergence is small (\(\kappa \ll 1\)) and lensing produces only a slight distortion (shear) of background galaxy images. A single galaxy is too noisy (intrinsic ellipticity \(\sigma_\epsilon \sim 0.25\)), but averaging over many galaxies allows the statistical shear signal to be measured. The **convergence** \(\kappa\) is the projected mass surface density in units of the critical surface density:

\[\kappa(\boldsymbol{\theta}) = \frac{\Sigma(\boldsymbol{\theta})}{\Sigma_\text{cr}}, \quad \Sigma_\text{cr} = \frac{c^2}{4\pi G}\frac{D_S}{D_L D_{LS}}.\]

The **shear** \(\gamma\) produces an anisotropic distortion: tangential alignment of background galaxies around a foreground mass concentration. The observed ellipticity of background galaxies has two components: \(\gamma_t\) (tangential shear, related to \(\kappa\)) and \(\gamma_\times\) (cross shear, which is zero for a round lens and serves as a systematic error check).

### Galaxy-Galaxy Lensing

By stacking the weak lensing signal around many lens galaxies of similar type, one can measure the **galaxy-galaxy lensing** signal — the mean projected mass profile of a class of galaxies. This provides:

- The total mass (including dark matter) as a function of galaxy luminosity or stellar mass.
- The **stellar-to-halo mass relation** (SHMR): at fixed halo mass, how much stellar mass does a galaxy typically have? The SHMR peaks at \(M_\text{halo} \sim 10^{12} M_\odot\) where \(M_*/M_\text{halo} \sim 0.03\), declining steeply toward both lower and higher halo masses — reflecting the increasing importance of supernova feedback (low mass) and AGN feedback (high mass) in suppressing star formation.

### Cosmic Shear

**Cosmic shear** is the weak lensing of background galaxies by the entire foreground large-scale structure. It is sensitive to the matter power spectrum (amplitude \(\sigma_8\) and shape) and the expansion history (through \(D_A(z)\) and the growth factor). Current surveys (KiDS, DES, HSC) find \(S_8 = \sigma_8 (\Omega_m/0.3)^{0.5} \approx 0.76\text{–}0.78\), slightly lower than the Planck CMB value of \(S_8 \approx 0.83\) — a \(\sim 2\text{–}3\sigma\) tension that, if real, could indicate new physics in the dark sector.

---

# Chapter 16: Outstanding Questions in Galaxy Science

## The Missing Satellites Problem

\(\Lambda\)CDM predicts that a Milky Way-sized halo should contain hundreds to thousands of subhalos with masses down to \(\sim 10^7 M_\odot\). However, only \(\sim 50\) satellite galaxies are known around the Milky Way. This **missing satellites problem** can be partially resolved by: (1) the suppression of star formation in low-mass halos by reionization (UV heating of the IGM photoevaporates gas from halos with \(v_c \lesssim 20\) km s\(^{-1}\) after \(z \sim 6\)); (2) supernova feedback expelling gas from shallow potential wells; (3) observational incompleteness — deep surveys (SDSS, DES) have discovered many "ultra-faint" dwarf galaxies. Nevertheless, tension with predictions remains at the low-mass end.

## The Core-Cusp Problem

As discussed in Chapter 10, CDM N-body simulations predict **cuspy** NFW profiles (\(\rho \propto r^{-1}\) at small radii), while observations of dark matter-dominated dwarf galaxies consistently show **cored** profiles (\(\rho = \text{const}\) at small radii). This discrepancy — the **core-cusp problem** — may be resolved by baryonic feedback: repeated cycles of gas inflow and outflow driven by supernovae create fluctuating potentials that can scatter dark matter particles outward, converting cusps to cores. Alternatively, it could indicate that dark matter self-interacts (SIDM).

## The Too-Big-to-Fail Problem

Several of the most massive predicted subhalos of the Milky Way appear to have no observed stellar counterpart, even though they should be massive enough to form stars. These are the halos that are "too big to fail" at forming galaxies. Like the missing satellites problem, this is likely (at least partly) a consequence of baryonic feedback.

## Galaxy Quenching and the Green Valley

What causes galaxies to stop forming stars and transition from the blue cloud to the red sequence? The green valley is sparsely populated, suggesting this transition is rapid (\(\ll 1\) Gyr). Proposed mechanisms: AGN feedback (quasar-mode outflows), environmental quenching (ram pressure, strangulation), morphological quenching (formation of a massive bulge that stabilizes the disk against star formation). The relative importance of these mechanisms, and how they depend on mass, environment, and redshift, remain active research areas.

## The First Galaxies

The first generation of stars and galaxies formed in the first few hundred million years of the universe (\(z \gtrsim 10\)). These **first galaxies** are too faint for current telescopes at the highest redshifts, but the James Webb Space Telescope (JWST, launched 2021) has spectacularly extended our view, detecting galaxies at \(z > 10\) and finding some surprisingly massive galaxies (\(M_* \sim 10^{10} M_\odot\)) at \(z \sim 10\text{–}12\) that challenge standard formation models. The reionization of the intergalactic hydrogen by UV photons from the first galaxies (completing by \(z \sim 6\)) is directly connected to the properties of these first galaxies: their UV photon output, escape fraction of ionizing photons, and total abundance.

## The Nature of Dark Energy

Observations of SNe Ia, the CMB, and large-scale structure all converge on a universe with \(\sim 68\%\) dark energy (\(\Omega_\Lambda \approx 0.68\)), \(\sim 27\%\) dark matter (\(\Omega_m \approx 0.27\)), and \(\sim 5\%\) baryons. The dark energy drives the accelerated expansion discovered in 1998. In the standard model, it is the **cosmological constant** \(\Lambda\) — vacuum energy with equation of state \(w = p/(\rho c^2) = -1\). The theoretical prediction for the vacuum energy density from quantum field theory exceeds the observed value by \(\sim 120\) orders of magnitude — the **cosmological constant problem**, arguably the worst fine-tuning problem in physics. Whether dark energy is truly \(\Lambda\) or a dynamical field (quintessence) with time-varying \(w(z)\) is being actively tested by galaxy surveys (DESI, Euclid, Rubin Observatory LSST).

## Tensions in \(\Lambda\)CDM

Beyond the \(H_0\) and \(S_8\) tensions discussed earlier, several other anomalies challenge the standard model: the axis of evil (alignments of CMB multipoles); the KBC void (possible local underdensity affecting \(H_0\)); anomalously massive galaxies at high redshift (JWST); and the Hubble sequence's survival in an era of frequent mergers (the fraction of disk galaxies in the universe is higher than early simulations predicted, though recent high-resolution hydrodynamical simulations do better). None of these are definitive crises, but collectively they motivate continued scrutiny of \(\Lambda\)CDM and searches for new physics.

---

*These notes cover the full topic schedule of PHYS 474: Galaxies as taught at the University of Waterloo. The treatment draws on Sparke & Gallagher "Galaxies in the Universe" (2nd edition), Binney & Merrifield "Galactic Astronomy", Binney & Tremaine "Galactic Dynamics" (2nd edition), and Mo, van den Bosch & White "Galaxy Formation and Evolution". For derivations and deeper coverage, students are encouraged to consult these primary references.*
