---
title: "PHYS 175: Introduction to the Universe"
subjects: "PHYS"
prof: "Richard Epp"
---

## Sources and References
**Primary textbook** — Bennett, J., Donahue, M., Schneider, N., and Voit, M. *The Cosmic Perspective*, 10th ed. Pearson, 2020.
**Online resources** — HyperPhysics at hyperphysics.phy-astr.gsu.edu; NASA Astronomy Picture of the Day at apod.nasa.gov; Fitzpatrick, R. *Classical Mechanics* at farside.ph.utexas.edu (for orbital mechanics); Carroll, B. and Ostlie, D. *Introduction to Modern Astrophysics* (standard undergraduate astrophysics reference)

---

# Chapter 1: The Sky and the Scale of the Cosmos

## 1.1 A Sense of Scale

Humanity's greatest intellectual achievement may be the realization that we can understand the universe at all. We are beings a few meters tall, living on a rocky sphere 12,700 km in diameter, orbiting an ordinary star 150 million kilometers away — which itself sits 26,000 light-years from the center of a galaxy containing some 200 billion stars, which in turn is just one of roughly two trillion galaxies in the observable universe. Yet from this inconsequential vantage point, armed with mathematics and the laws of physics, we have deduced the age and history of the entire cosmos.

The numbers involved in astronomy defy everyday intuition, so we adopt units suited to the scale. The **astronomical unit** (AU) is the mean Earth-Sun distance: \(1\ \mathrm{AU} = 1.496 \times 10^{11}\ \mathrm{m}\). The **light-year** (ly) is the distance light travels in one year: \(1\ \mathrm{ly} = 9.461 \times 10^{15}\ \mathrm{m} \approx 63{,}000\ \mathrm{AU}\). The **parsec** (pc), defined by parallax geometry, is \(1\ \mathrm{pc} \approx 3.086 \times 10^{16}\ \mathrm{m} \approx 3.26\ \mathrm{ly}\).

## 1.2 The Celestial Sphere and the Motion of the Sky

Ancient astronomers conceived of the sky as a **celestial sphere** rotating once per day around an axis passing through Earth's poles. While we now know this rotation is a reflection of Earth's spin, the geometric framework remains useful for describing where objects appear in the sky.

**Right ascension** (RA, measured in hours, minutes, seconds) and **declination** (Dec, measured in degrees) form the celestial coordinate system analogous to longitude and latitude on Earth. The **celestial equator** is the projection of Earth's equator onto the sky; the **ecliptic** is the Sun's apparent annual path against the background stars, inclined to the celestial equator by \(23.5°\) (the obliquity of the ecliptic), which is also the tilt of Earth's rotation axis.

The seasons arise from this axial tilt, not from changes in Earth-Sun distance (which is in fact slightly smaller in January than in July). In summer for the Northern Hemisphere, the Sun is high in the sky, daylight is long, and sunlight strikes at a more direct angle — all contributing to warmer temperatures.

## 1.3 Parallax and Distances

**Parallax** is the apparent shift of a nearby object against a distant background when the observer moves. For stars, astronomers use Earth's orbital motion: a star observed in January and July is viewed from opposite ends of a baseline of 2 AU. A star at distance \(d\) (in parsecs) has a **parallax angle** \(p\) (in arcseconds) satisfying:

\[
d = \frac{1}{p}\quad (\text{in parsecs, with } p \text{ in arcseconds}).
\]

The ESA Gaia satellite has measured parallaxes for over a billion stars to precision of microarcseconds, revolutionizing our three-dimensional map of the Milky Way. For galaxies, the distance is too great for parallax; instead, we rely on the **cosmic distance ladder** — a hierarchy of overlapping methods each calibrated against the previous.

---

# Chapter 2: The Ancient Greeks and the Birth of Scientific Astronomy

## 2.1 The Greek Geometers of the Sky

Long before telescopes, the Greeks made quantitative measurements of extraordinary accuracy using only geometry and careful observation. The result was not merely a catalog of positions but a genuine physical model of the cosmos.

**Eratosthenes** (c. 276–195 BCE) measured the circumference of the Earth by comparing the angle of the Sun at noon in Alexandria (where it cast a shadow at angle \(\theta \approx 7.2°\)) and in Syene (where the Sun shone directly down a well), separated by a known distance. Since \(7.2° / 360° = s / C\), where \(s\) is the Syene-Alexandria distance, he obtained \(C \approx 40{,}000\ \mathrm{km}\) — astonishingly close to the modern value.

**Aristarchus** (c. 310–230 BCE) devised a geometric method to measure the relative distances of the Sun and Moon. At first quarter Moon, the Moon-Earth-Sun angle is 90°, making a right triangle. By measuring the Earth-Moon-Sun angle \(\alpha\), one obtains:

\[
\frac{d_{\mathrm{Sun}}}{d_{\mathrm{Moon}}} = \frac{1}{\cos\alpha}.
\]

Aristarchus measured \(\alpha \approx 87°\), giving a ratio of about 19 — too small by a factor of 20 due to measurement difficulty, but the method was impeccable. He also proposed, centuries ahead of his time, that the Earth orbits the Sun.

## 2.2 The Ptolemaic Model

By the second century CE, the Greek astronomer **Claudius Ptolemy** had assembled the geocentric (Earth-centered) model into its most sophisticated form in the *Almagest*. To account for the observed motion of planets — which occasionally appear to move *backward* (retrograde) against the stars — Ptolemy used a system of **epicycles**: each planet moved in a small circle (epicycle) whose center moved along a larger circle (deferent) around Earth.

The Ptolemaic model made predictions accurate enough that it dominated Western and Islamic astronomy for fourteen centuries. This is worth pausing over: an incorrect physical picture, but one built on careful geometric reasoning, can succeed remarkably well as a predictive tool. The eventual overthrow of geocentrism was driven not primarily by prediction failure but by the demand for a more coherent, economical physical understanding.

---

# Chapter 3: From Copernicus to Newton — The Mechanical Universe

## 3.1 The Copernican Revolution

In 1543, **Nicolaus Copernicus** published *De Revolutionibus Orbium Coelestium*, proposing that the Sun, not the Earth, sits at the center of the cosmos. The heliocentric model immediately explained retrograde motion naturally: a slower outer planet is periodically "lapped" by Earth as we orbit, and it appears to move backward against background stars during closest approach. What Ptolemy needed epicycles to describe, Copernicus obtained from simple geometry.

Copernicus retained circular orbits and was thus forced to keep a diminished version of epicycles to match observations precisely. The true breakthrough — the replacement of circles with ellipses — came a half-century later.

## 3.2 Kepler's Laws

**Johannes Kepler** (1571–1630) inherited the meticulous naked-eye observations of **Tycho Brahe** (1546–1601) and spent years fitting various geometric curves to Mars's orbit. His three empirical laws, extracted from data by patient computation:

<div class="theorem">
<strong>Kepler's First Law:</strong> The orbit of each planet is an ellipse with the Sun at one focus.

<strong>Kepler's Second Law (Law of Equal Areas):</strong> The line segment joining a planet to the Sun sweeps out equal areas in equal times.

<strong>Kepler's Third Law:</strong> The square of the orbital period \(T\) is proportional to the cube of the semi-major axis \(a\):
\[
T^2 \propto a^3, \qquad \text{or } \frac{T^2}{a^3} = \text{const (same for all planets)}.
\]
</div>

Kepler had no physical explanation for these laws — he called the Sun a kind of "soul" that pushed the planets around. The physical underpinning would come from Newton.

## 3.3 Galileo and the Telescope

**Galileo Galilei** (1564–1642) was the first to systematically point a telescope at the sky (from 1609). His discoveries were devastating to Ptolemaic cosmology: the Moon had mountains and craters (it was not a perfect sphere), Venus showed phases (it orbited the Sun, passing between us and the Sun), Jupiter had four moons (something orbited a body other than Earth). Together these observations showed that the heavens were not fundamentally different from the Earth in composition or physics.

Galileo also established the principle of inertia and the parabolic motion of projectiles — laying the foundation for Newton's synthesis.

## 3.4 Newton's Gravitational Theory

**Isaac Newton** (1643–1727) asked the inspired question: what force, acting on the Moon, provides the centripetal acceleration needed to keep it in circular orbit? The Moon's centripetal acceleration is:

\[
a_{\mathrm{Moon}} = \frac{v^2}{r_{\mathrm{Moon}}} = \frac{4\pi^2 r_{\mathrm{Moon}}}{T_{\mathrm{Moon}}^2} \approx 2.72 \times 10^{-3}\ \mathrm{m\,s^{-2}}.
\]

Newton then compared this to the gravitational acceleration at Earth's surface, \(g = 9.81\ \mathrm{m\,s^{-2}}\), and the ratio of distances:

\[
\frac{a_{\mathrm{Moon}}}{g} \approx \frac{1}{3600} = \left(\frac{R_E}{r_{\mathrm{Moon}}}\right)^2,
\]

since \(r_{\mathrm{Moon}} \approx 60 R_E\). The force of gravity falls off exactly as the square of distance. The **law of universal gravitation** is:

\[
\mathbf{F} = -\frac{GMm}{r^2}\hat{r},
\]

where \(G = 6.674 \times 10^{-11}\ \mathrm{m^3\,kg^{-1}\,s^{-2}}\) is Newton's gravitational constant. Newton then showed mathematically that this inverse-square law implies Kepler's three laws — a moment of unification unmatched until Maxwell's electromagnetic theory.

From Newton's second law applied to circular orbits:

\[
\frac{GMm}{r^2} = \frac{mv^2}{r} = \frac{4\pi^2 mr}{T^2},
\]

so:

\[
T^2 = \frac{4\pi^2}{GM}a^3.
\]

This is Kepler's third law, with the constant identified: \(T^2/a^3 = 4\pi^2/(GM)\). Given any two bodies in orbit, measuring \(T\) and \(a\) allows us to weigh the central mass \(M\). This is how we determine the mass of the Sun, the planets, and even distant galaxies.

---

# Chapter 4: The Physics of Stars

## 4.1 The Sun as a Typical Star

The Sun is an enormous ball of gas held together by gravity and supported against gravitational collapse by the pressure of hot plasma. At its center, temperatures reach \(\sim 1.5 \times 10^7\ \mathrm{K}\) and densities reach \(\sim 1.5 \times 10^5\ \mathrm{kg\,m^{-3}}\), sufficient for **nuclear fusion** — the process by which four hydrogen nuclei are combined into one helium nucleus, releasing energy.

The net reaction in the Sun's dominant **proton-proton chain** is:

\[
4\,{}^1_1\mathrm{H} \rightarrow {}^4_2\mathrm{He} + 2e^+ + 2\nu_e + 2\gamma.
\]

The mass of four protons (\(4 \times 1.6726 \times 10^{-27}\ \mathrm{kg}\)) exceeds the mass of the helium nucleus by \(\Delta m \approx 4.85 \times 10^{-29}\ \mathrm{kg}\). By Einstein's \(E = mc^2\), this mass difference is released as energy:

\[
E = \Delta m\, c^2 \approx 4.3 \times 10^{-12}\ \mathrm{J}
\]

per fusion event. The Sun's luminosity (\(L_\odot = 3.83 \times 10^{26}\ \mathrm{W}\)) implies a mass loss rate of \(L_\odot/c^2 \approx 4.3 \times 10^9\ \mathrm{kg\,s^{-1}}\) — four million tonnes per second converted from mass to energy. Yet the Sun is so massive (\(M_\odot = 2.0 \times 10^{30}\ \mathrm{kg}\)) that it can sustain this for roughly ten billion years total.

## 4.2 Hydrostatic Equilibrium

Stars maintain a delicate balance between inward gravitational compression and outward pressure support. Consider a thin shell of gas at radius \(r\), thickness \(dr\), and density \(\rho(r)\). Gravity pulls the shell inward with force per unit area equal to \(GM(r)\rho(r)dr/r^2\), while the pressure difference \(dP\) across the shell acts outward. For equilibrium:

\[
\frac{dP}{dr} = -\frac{GM(r)\rho(r)}{r^2}.
\]

This is the **equation of hydrostatic equilibrium**. Paired with an equation of state (relating pressure to density and temperature) and an energy transport equation, it forms the basis of stellar structure models. The success of such models in predicting stellar luminosities, radii, and lifetimes is one of the great triumphs of twentieth-century astrophysics.

## 4.3 Stellar Spectra and the Hertzsprung-Russell Diagram

Every star emits a **blackbody spectrum** modified by absorption lines from its atmosphere. The peak wavelength is given by **Wien's displacement law**:

\[
\lambda_{\mathrm{max}} = \frac{b}{T}, \qquad b = 2.898 \times 10^{-3}\ \mathrm{m\,K}.
\]

Hot stars appear blue (\(T \sim 30{,}000\ \mathrm{K}\), \(\lambda_{\mathrm{max}} \approx 100\ \mathrm{nm}\)); cool stars appear red (\(T \sim 3{,}000\ \mathrm{K}\), \(\lambda_{\mathrm{max}} \approx 970\ \mathrm{nm}\)). The total power radiated per unit surface area obeys the **Stefan-Boltzmann law**: \(P/A = \sigma T^4\), where \(\sigma = 5.67 \times 10^{-8}\ \mathrm{W\,m^{-2}\,K^{-4}}\). The total stellar luminosity is therefore:

\[
L = 4\pi R^2 \sigma T^4.
\]

In 1910, **Ejnar Hertzsprung** and **Henry Norris Russell** independently discovered that stars are not distributed randomly in the temperature-luminosity plane but instead cluster along a diagonal band (the **main sequence**) and in isolated regions corresponding to giants and white dwarfs. This **Hertzsprung-Russell (HR) diagram** is to stellar astronomy what the periodic table is to chemistry — a pattern that reveals underlying physics. Stars spend most of their lives on the main sequence burning hydrogen in their cores; their position is determined primarily by mass.

---

# Chapter 5: Exotic Stars — White Dwarfs, Neutron Stars, and the Quantum Universe

## 5.1 The Stellar Life Cycle

A star lives and dies according to its mass. When a Sun-like star exhausts the hydrogen in its core, fusion ceases, the core contracts, and the outer layers expand enormously — the star becomes a **red giant**. Helium burning begins at the core, leading to a helium flash; eventually carbon and oxygen accumulate. Shell burning creates complex layered structures. Finally, the outer envelope is expelled as a **planetary nebula**, leaving the hot, dead core exposed as a **white dwarf**.

For massive stars (\(M \gtrsim 8 M_\odot\)), the core successively ignites helium, carbon, neon, oxygen, and silicon, building up an iron core. Iron cannot release energy by fusion (it is the most tightly bound nucleus); when the iron core exceeds the **Chandrasekhar limit** (\(\approx 1.4 M_\odot\)), electron degeneracy pressure can no longer support it against gravity, and the core collapses catastrophically in milliseconds — a **supernova**.

## 5.2 Quantum Degeneracy Pressure

The key to understanding stellar remnants is quantum mechanics. **Wolfgang Pauli's exclusion principle** (1925) states that no two fermions (particles with half-integer spin, including electrons and neutrons) can occupy the same quantum state. This creates a pressure even at zero temperature — not thermal pressure, but **degeneracy pressure** arising from the fundamental quantum incompressibility of fermion systems.

For electrons confined to volume \(V\), the maximum momentum an electron can have at zero temperature is the **Fermi momentum**:

\[
p_F = \hbar\left(3\pi^2 n\right)^{1/3},
\]

where \(n = N/V\) is the electron number density. The associated **electron degeneracy pressure** is:

\[
P_e \approx \frac{\hbar^2}{5m_e}\left(3\pi^2\right)^{2/3} n^{5/3}
\]

in the non-relativistic limit. This is the pressure that supports a **white dwarf** against gravity.

## 5.3 The Chandrasekhar Limit

**Subrahmanyan Chandrasekhar** (1910–1995) realized in 1930 that for sufficiently massive white dwarfs, electrons must be relativistic. In the ultra-relativistic limit, the degeneracy pressure scales as \(P \propto n^{4/3}\), not \(n^{5/3}\). A critical analysis shows that above a limiting mass, no stable white dwarf configuration exists. The **Chandrasekhar limit** is:

\[
M_{\mathrm{Ch}} \approx \frac{5.87}{\mu_e^2} M_\odot,
\]

where \(\mu_e\) is the mean molecular weight per electron (\(\approx 2\) for carbon or oxygen). For \(\mu_e = 2\), \(M_{\mathrm{Ch}} \approx 1.46 M_\odot\). White dwarfs above this mass cannot exist — a discovery that earned Chandrasekhar the 1983 Nobel Prize in Physics and that has profound consequences for Type Ia supernovae (used as "standard candles" for cosmology).

## 5.4 Neutron Stars and Pulsars

When the collapsing core of a supernova exceeds the Chandrasekhar limit, electrons are forced to combine with protons (inverse beta decay): \(e^- + p \to n + \nu_e\). The core becomes a ball of neutrons — a **neutron star** — supported by neutron degeneracy pressure. Typical parameters: mass \(\sim 1.4 M_\odot\), radius \(\sim 10\ \mathrm{km}\), central density \(\sim 10^{18}\ \mathrm{kg\,m^{-3}}\) (several times nuclear density). A neutron star packs more than a solar mass into a sphere the size of a city.

Conservation of angular momentum during collapse dramatically spins up the neutron star (just as a figure skater spins faster by pulling in their arms). A neutron star with magnetic field aligned slightly off its rotation axis sweeps lighthouse-like beams of radio emission across space — if a beam sweeps past Earth, we detect a **pulsar**. Pulsars are the most precise natural clocks known; their periods (milliseconds to seconds) are extraordinarily stable, and long-term timing measurements have provided some of the most stringent tests of general relativity (the Hulse-Taylor binary pulsar, 1974, confirmed gravitational radiation and earned a Nobel Prize in 1993).

---

# Chapter 6: Black Holes — Where Gravity Wins

## 6.1 The Schwarzschild Radius

Even within classical physics, John Michell (1784) and Pierre-Simon Laplace (1796) imagined a "dark star" so massive that its escape velocity exceeds the speed of light:

\[
v_{\mathrm{esc}} = \sqrt{\frac{2GM}{R}} = c \implies R_s = \frac{2GM}{c^2}.
\]

This is the **Schwarzschild radius**. For the Sun, \(R_s \approx 3\ \mathrm{km}\); for the Earth, \(R_s \approx 9\ \mathrm{mm}\). If a mass is compressed to within its Schwarzschild radius, the classical argument — and the general relativistic one — tells us it becomes a **black hole**.

## 6.2 General Relativity in Brief

Einstein's **general relativity** (1915) reconceptualizes gravity not as a force but as the curvature of spacetime caused by mass and energy. The fundamental insight is the **equivalence principle**: locally, the effects of gravity are indistinguishable from those of acceleration. A freely falling observer feels no gravity; an accelerating observer feels a pseudo-gravitational field.

The full theory is encapsulated in the **Einstein field equations**:

\[
G_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu},
\]

where \(G_{\mu\nu}\) is the Einstein tensor (encoding spacetime curvature), \(\Lambda\) is the cosmological constant, \(g_{\mu\nu}\) is the metric tensor (encoding distances), and \(T_{\mu\nu}\) is the stress-energy tensor (encoding the distribution of mass-energy). The left side is geometry; the right side is matter. As John Wheeler memorably put it: "Spacetime tells matter how to move; matter tells spacetime how to curve."

## 6.3 Key Predictions of General Relativity

Several predictions of GR have been strikingly confirmed:

**Gravitational time dilation:** Clocks run slower in stronger gravitational fields. A clock at the surface of the Earth runs slower than one in orbit by approximately \(\Delta t/t \sim GM/(Rc^2) \sim 7 \times 10^{-10}\), or about 45 microseconds per day. GPS satellites must account for both this effect and the special-relativistic time dilation due to their velocity; without these corrections, GPS would accumulate errors of kilometers per day.

**Gravitational redshift:** Light climbing out of a gravitational well loses energy and is redshifted. A photon emitted at radius \(r_1\) from a mass \(M\) and observed at radius \(r_2 > r_1\) has its frequency reduced by:

\[
\frac{\nu_2}{\nu_1} = \sqrt{\frac{1 - 2GM/(r_1 c^2)}{1 - 2GM/(r_2 c^2)}}.
\]

**Perihelion precession:** The orbit of Mercury precesses by 43 arcseconds per century beyond what Newtonian gravity predicts, perfectly accounted for by GR.

**Gravitational waves:** Accelerating masses produce ripples in spacetime fabric. The LIGO-Virgo collaboration detected gravitational waves in 2015 — from the merger of two black holes, 1.3 billion light-years away — confirming a century-old prediction and opening an entirely new observational window on the universe.

---

# Chapter 7: The Milky Way Galaxy

## 7.1 Structure and Scale

Our galaxy, the **Milky Way**, is a barred spiral galaxy approximately 100,000 light-years in diameter. It contains some 200–400 billion stars, a comparable mass in cold gas and dust, and an enormous amount of **dark matter** extending far beyond the visible disk.

The Sun sits about 26,000 light-years from the galactic center, in the Orion Arm — a minor spiral arm between two major ones. The Sun orbits the galactic center with a period of about 225 million years (a "galactic year") at a speed of roughly 220 km/s.

## 7.2 Rotation Curves and Dark Matter

If the Milky Way's mass were concentrated in the visible stars, orbital speeds in the outer galaxy should fall off as \(v \propto r^{-1/2}\) (Keplerian decline, just as planetary speeds decline with distance from the Sun). Instead, observations show the rotation curve is nearly **flat**: \(v \approx \mathrm{const}\) out to the largest measured radii. This implies:

\[
\frac{GM(r)}{r^2} = \frac{v^2}{r} \implies M(r) \propto r.
\]

Mass continues to grow linearly with radius, far beyond the visible stellar disk. This is the evidence for a vast **dark matter halo** — matter that neither emits nor absorbs light but exerts gravitational effects. The nature of dark matter remains one of the most profound open questions in physics.

## 7.3 The Galactic Center and Sgr A*

At the very center of the Milky Way lurks a **supermassive black hole**, named **Sagittarius A*** (Sgr A*). Its mass has been measured by tracking the orbits of stars around the galactic center — in particular, the star S2, which orbits Sgr A* with a period of about 16 years and passes within 1400 Schwarzschild radii. From the orbital period and semi-major axis (Kepler's third law):

\[
M_{\mathrm{Sgr\,A*}} = \frac{4\pi^2 a^3}{GT^2} \approx 4 \times 10^6 M_\odot.
\]

The Event Horizon Telescope published the first image of Sgr A*'s shadow in 2022, directly resolving the region around the black hole's event horizon.

---

# Chapter 8: Galaxies Across the Universe

## 8.1 Island Universes

Until the 1920s, the nature of "spiral nebulae" was debated: were they nearby gas clouds within our galaxy, or distant "island universes" comparable to the Milky Way itself? The **Great Debate** (1920) between Harlow Shapley and Heber Curtis remained unresolved until **Edwin Hubble** (1924) measured Cepheid variable stars in the Andromeda Nebula (M31) and determined it was roughly 900,000 light-years away — far beyond the Milky Way, a separate galaxy comparable in size to our own.

The universe was suddenly revealed to be billions of times larger than even the most expansive previous estimates.

## 8.2 Hubble's Law and the Expanding Universe

In 1929, Hubble published a startling observation: the recession velocity of galaxies (measured from the Doppler redshift of their spectral lines) is proportional to their distance:

\[
v = H_0 d,
\]

where \(H_0\) is the **Hubble constant**. The modern best value is \(H_0 \approx 70\ \mathrm{km\,s^{-1}\,Mpc^{-1}}\) (though there is active debate about whether the value from the cosmic microwave background and from local distance indicators are consistent). Hubble's law means that the universe is **expanding**: every galaxy is moving away from every other, not because galaxies are moving through space toward an edge, but because space itself is stretching. The Andromeda Galaxy is a notable exception — it is falling toward us under mutual gravity and will merge with the Milky Way in about 4.5 billion years.

---

# Chapter 9: The Big Bang and Cosmology

## 9.1 The Origin of the Universe

If the universe is expanding, running the clock backward implies that it was once smaller, hotter, and denser. Extrapolating to the beginning, all the matter and energy in the observable universe was compressed into an incredibly hot, dense state — the **Big Bang**. The universe is not expanding from a central point in space; rather, space itself was born at the Big Bang and has been expanding ever since. Every point in the universe was at the "center."

The age of the universe is related to the Hubble constant by \(t \approx 1/H_0 \approx 14\ \mathrm{Gyr}\) (a rough estimate; the precise value requires knowing how the expansion rate has changed). The accepted age, from detailed fitting of the cosmic microwave background, is \(13.8\ \mathrm{Gyr}\).

## 9.2 The First Three Minutes

The first seconds of the universe were dominated by radiation — photons, neutrinos, and their antiparticles — in thermal equilibrium with baryons. The sequence of events is remarkable:

- At \(t \sim 10^{-35}\ \mathrm{s}\): **Inflation** — an exponential expansion by a factor of at least \(10^{26}\), smoothing the universe and generating the seeds of structure.
- At \(t \sim 1\ \mathrm{s}\): The universe cools below the threshold for electron-positron pair production; neutrinos decouple.
- At \(t \sim 1-3\ \mathrm{min}\): **Big Bang nucleosynthesis** (BBN): protons and neutrons fuse to form helium nuclei (and traces of deuterium, helium-3, and lithium-7). About 25% of baryonic mass ends up as helium-4, consistent with observations in the most metal-poor stars today.
- At \(t \sim 380{,}000\ \mathrm{yr}\): **Recombination**: the universe cools to \(\sim 3000\ \mathrm{K}\), electrons and protons combine into neutral hydrogen, and the universe becomes transparent. The photons released at this moment travel freely ever since — we observe them today as the **cosmic microwave background** (CMB).

## 9.3 The Cosmic Microwave Background

The CMB is the afterglow of the Big Bang, a nearly perfect blackbody spectrum at temperature \(T = 2.725\ \mathrm{K}\), permeating all of space. Its peak wavelength (Wien's law) is in the microwave region:

\[
\lambda_{\mathrm{max}} = \frac{2.898 \times 10^{-3}}{2.725} \approx 1.06\ \mathrm{mm}.
\]

The CMB was discovered accidentally in 1965 by Arno Penzias and Robert Wilson, who found an unexplained isotropic background noise in their radio antenna — earning them the 1978 Nobel Prize. The COBE satellite (1989) showed the spectrum to be a perfect blackbody to extraordinary precision; subsequent missions (WMAP, Planck) mapped tiny temperature fluctuations at the level of \(\delta T / T \sim 10^{-5}\), which are the seeds from which all cosmic structure — galaxies, clusters, cosmic web — grew by gravitational collapse.

## 9.4 Dark Energy and the Accelerating Universe

In 1998, two independent teams studying Type Ia supernovae as standard candles discovered that distant supernovae are **fainter than expected** for a universe decelerating under gravity. The expansion of the universe is **accelerating**. This acceleration is attributed to **dark energy** — a form of energy with negative pressure that drives the expansion. The simplest model identifies dark energy with the **cosmological constant** \(\Lambda\) in Einstein's field equations, equivalent to an energy density of empty space. Dark energy comprises about 68% of the universe's total energy budget; dark matter about 27%; ordinary baryonic matter only about 5%.

## 9.5 The Composition of the Universe and Open Mysteries

The modern **\(\Lambda\)CDM model** (Lambda Cold Dark Matter) describes the large-scale structure and expansion history of the universe with remarkable precision. Its six parameters, fitted to CMB data, successfully predict the abundance of galaxy clusters, the baryon acoustic oscillation scale, and the universe's large-scale geometry (spatially flat to high precision).

Yet the model rests on two profound mysteries: the nature of dark matter (proposed candidates include weakly interacting massive particles — WIMPs — or axions, none of which have been directly detected) and the nature of dark energy (the observed value of \(\Lambda\) is some 120 orders of magnitude smaller than naive quantum field theory estimates — the worst prediction in all of physics).

These mysteries are not embarrassments but invitations. They mark the frontier of human knowledge, the places where our deepest theories fail and where the next revolution in physics awaits.

---

# Chapter 10: Thinking Like a Physicist — Special Relativity and Quantum Mechanics in Astrophysics

## 10.1 Special Relativity: The Speed Limit of the Universe

Einstein's **special relativity** (1905) arose from the incompatibility of Newtonian mechanics with Maxwell's electromagnetic theory. The two postulates:

1. The laws of physics are the same in all inertial reference frames.
2. The speed of light in vacuum, \(c = 2.998 \times 10^8\ \mathrm{m\,s^{-1}}\), is the same in all inertial frames.

From these postulates follow the Lorentz transformations, and from these follow **time dilation**, **length contraction**, and the **relativistic energy-momentum relation**:

\[
E^2 = (pc)^2 + (mc^2)^2.
\]

For a particle at rest (\(p = 0\)), \(E = mc^2\) — the famous rest energy. For a massless photon (\(m = 0\)), \(E = pc = hf\) (linking to quantum mechanics).

The relativistic kinetic energy is \(K = (\gamma - 1)mc^2\), where \(\gamma = 1/\sqrt{1 - v^2/c^2}\) is the Lorentz factor. In supernovae, ejecta move at \(v \sim 0.1c\), so relativistic corrections are significant; in jets from active galactic nuclei, \(\gamma > 10\) is common, and relativistic effects are essential to understanding the observations.

## 10.2 Dimensional Analysis as a Physicist's Tool

One of the most powerful tools in astrophysics is dimensional analysis — using the known dimensions of physical constants to estimate results without knowing the full theory. As an example, estimate the Schwarzschild radius:

The only length that can be constructed from \(G\), \(M\), and \(c\) is:

\[
R \sim \frac{GM}{c^2}.
\]

This is indeed the Schwarzschild radius (up to a factor of 2). Similarly, estimate the temperature of the cosmic microwave background today: the photon energy scale \(kT\) should equal the photon rest energy at recombination (\(kT \sim 0.3\ \mathrm{eV}\)), redshifted by the expansion factor \(z_{\mathrm{rec}} \approx 1100\): \(kT_{\mathrm{today}} \approx 0.3/1100\ \mathrm{eV} \approx 2.5 \times 10^{-4}\ \mathrm{eV}\), giving \(T \approx 2.9\ \mathrm{K}\) — in good agreement with the measured 2.725 K.

The universe is, in a profound sense, a physics problem. And it yields to the same tools — Newton's laws, thermodynamics, quantum mechanics, general relativity, and careful reasoning — that we use in the laboratory. The sky is not a separate domain from the equations on our blackboards; it is the grandest possible arena for physics.
