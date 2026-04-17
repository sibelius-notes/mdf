---
title: "PHYS 175: Introduction to the Universe"
subjects: "PHYS"
prof: "Richard Epp"
---

## Sources and References

**Primary textbook** — Bennett, J., Donahue, M., Schneider, N., and Voit, M., *The Cosmic Perspective*, 10th ed. (Pearson, 2024).

**Supplementary texts** — Carroll, B. W. and Ostlie, D. A., *An Introduction to Modern Astrophysics*, 2nd ed. (Cambridge University Press, 2017); Prialnik, D., *An Introduction to the Theory of Stellar Structure and Evolution*, 2nd ed. (Cambridge University Press, 2010).

**Online resources** — HyperPhysics, hyperphysics.phy-astr.gsu.edu; Fitzpatrick, R., *Classical Mechanics*, farside.ph.utexas.edu; NASA Astronomy Picture of the Day, apod.nasa.gov; MIT OpenCourseWare 8.286 (The Early Universe).

---

# Chapter 1: The Scale of the Universe and the History of Astronomy

## 1.1 Cosmic Distances and the Scope of Astrophysics

Astrophysics confronts the student immediately with an extraordinary challenge of scale. The universe is inconceivably vast, containing objects ranging from subatomic particles to galaxy superclusters spanning hundreds of millions of light-years. Understanding this range of scales is not merely an intellectual exercise — it is essential for reasoning quantitatively about the cosmos. The physicist's habit of order-of-magnitude estimation, developed in the terrestrial laboratory, must be extended by many powers of ten.

The fundamental unit of astronomical distance is the **astronomical unit** (AU), defined as the mean distance from the Earth to the Sun: 1 AU = 1.496 \(\times\) 10\(^{11}\) m \(\approx\) 150 million km. The nearest star to the Sun, Proxima Centauri, is about 1.3 parsecs or 4.2 light-years away — roughly 270,000 AU. Our galaxy, the Milky Way, is about 30 kiloparsecs (kpc) in diameter, containing roughly 300 billion stars. The nearest large galaxy, Andromeda (M31), is about 770 kpc (2.5 million light-years) away. The observable universe extends to about 14 Gpc (46 billion light-years) in all directions.

A **parsec** (pc) is defined as the distance at which 1 AU subtends an angle of 1 arcsecond: 1 pc = 3.086 \(\times\) 10\(^{16}\) m = 3.26 light-years. The definition connects directly to the method of **trigonometric parallax** — the apparent shift in a star's position as the Earth orbits the Sun — which is the most direct method of measuring stellar distances. The parallax angle \(p\) (in arcseconds) and distance \(d\) (in parsecs) are related by \(d = 1/p\). The European Space Agency's Gaia mission has measured parallaxes for over a billion stars with microarcsecond precision, revolutionising our knowledge of the three-dimensional structure of the Milky Way.

## 1.2 Ancient Astronomy: From Observation to Geometry

The systematic, mathematical study of astronomy began with the ancient Greeks, who brought to the night sky both a passion for observation and a conviction that the motions of celestial bodies could be described by geometric models. This combination of empirical observation and mathematical reasoning is the ancestor of modern scientific method.

**Eratosthenes of Cyrene** (c. 276–195 BCE) made one of the most remarkable measurements in ancient science: he determined the circumference of the Earth with impressive accuracy using only a well, a shadow, and simple geometry. He knew that at noon on the summer solstice, the Sun was directly overhead in Syene (modern Aswan), casting no shadow in a deep well. In Alexandria, 5000 stades (roughly 800 km) to the north, a vertical stick cast a shadow at the same moment, indicating that the Sun's rays were inclined at 7.2° to the vertical. Since 7.2° is 1/50 of a full circle, the circumference of the Earth must be 50 × 800 km = 40,000 km — essentially correct (the actual value is about 40,075 km along the equator). This is a beautiful example of using a geometric model (the Earth is a sphere, the Sun is far enough away that its rays are effectively parallel) and a measurement (the shadow angle) to determine a previously unmeasurable quantity.

**Hipparchus of Nicaea** (c. 190–120 BCE) developed trigonometry as a tool for astronomy, constructed the first comprehensive star catalogue, discovered the precession of the equinoxes (the slow change in the orientation of the Earth's rotation axis with a period of about 26,000 years), and estimated the distance to the Moon using the geometry of lunar eclipses. His estimate of the Moon's distance as about 60 Earth radii (the actual value is 60.3) is remarkably accurate.

**Claudius Ptolemy** (c. 100–170 CE) synthesised the accumulated Greek astronomical knowledge in his *Almagest* — a comprehensive mathematical treatise presenting a geocentric model of the solar system. In Ptolemy's model, each planet moves on a small circle (an **epicycle**) whose centre moves on a larger circle (a **deferent**) centred near the Earth. By choosing the epicycle and deferent parameters appropriately, Ptolemy could describe the apparent motion of the planets, including their retrograde motion, with reasonable accuracy. The Ptolemaic model remained the dominant framework for celestial mechanics for over 1300 years — a tribute to its mathematical sophistication, if not its physical accuracy.

## 1.3 The Copernican Revolution

The displacement of the Earth from the centre of the universe by **Nicolaus Copernicus** (1473–1543) is rightly regarded as one of the great conceptual revolutions in intellectual history. His heliocentric model, published in *De Revolutionibus Orbium Coelestium* (1543) — cautiously timed to appear on the day of his death — placed the Sun at the centre of the planetary system, with the Earth as just one of several planets orbiting it.

The heliocentric model provided a natural explanation for the most puzzling feature of planetary motion: **retrograde motion**, the apparent backward drift of the outer planets against the background stars. In the geocentric model, this required special mechanisms (epicycles); in the heliocentric model, it arises automatically when the Earth overtakes an outer planet in its faster inner orbit. As the Earth passes, the outer planet appears to briefly move backward against the stars before resuming its forward motion — exactly as a faster car overtaking a slower one on a highway appears to the faster car's occupants to briefly move backward relative to distant objects.

The Copernican model also immediately explained why the orbits of Mercury and Venus are confined to within a certain angular distance of the Sun (they are **inferior planets** — their orbits lie inside the Earth's) while the outer planets (**superior planets**) can appear at any angular position relative to the Sun.

---

# Chapter 2: Kepler's Laws and Newtonian Gravity

## 2.1 Tycho Brahe's Observational Legacy

**Tycho Brahe** (1546–1601) was the greatest naked-eye observational astronomer of the pre-telescopic era. Working from his observatory on the island of Hven (and later in Prague), he amassed 20 years of systematic, precise measurements of planetary positions — accurate to about 1 arcminute, ten times better than any previous observer. This precision was crucial: it was large enough to distinguish between competing planetary theories, and the data were of high enough quality to enable his assistant Johannes Kepler to discover the true geometric structure of planetary orbits.

Tycho himself could not accept the full Copernican model (he had sound physical objections — if the Earth moved, why did we not detect stellar parallax?) and proposed his own compromise: a geo-heliocentric model in which the planets orbit the Sun, which in turn orbits the Earth. This model was kinematically equivalent to the Copernican model but preserved a fixed Earth. The resolution of Tycho's objection required recognising that the stars are so far away that their parallax is too small to detect with the naked eye — Tycho's precision was impressive, but not nearly sufficient.

## 2.2 Kepler's Three Laws — Derivation and Significance

**Johannes Kepler** (1571–1630) spent years trying to fit Tycho's Mars data to a circular orbit and failing — the residuals were consistently too large to be measurement error. His eventual recognition that the orbit was an **ellipse** — a seemingly small modification — broke the 2000-year tradition of requiring celestial motion to be composed of circles, the "perfect" figure.

<div class="theorem">
<strong>Kepler's First Law.</strong> Each planet moves in an ellipse with the Sun at one focus.
</div>

An **ellipse** is the set of points such that the sum of distances from two fixed points (the **foci**) is constant: \(r_1 + r_2 = 2a\), where \(a\) is the **semi-major axis**. The shape of the ellipse is characterised by the **eccentricity** \(e = c/a\), where \(c\) is the distance from the centre to a focus. For a circle, \(e = 0\); for Earth's orbit, \(e = 0.017\) (nearly circular); for Mercury, \(e = 0.206\).

In polar coordinates with the Sun at the focus, the ellipse equation is:

\[
r = \frac{a(1-e^2)}{1 + e\cos\theta}
\]

The **perihelion** (closest approach to the Sun) is at \(\theta = 0\): \(r_\text{peri} = a(1-e)\). The **aphelion** (farthest point) is at \(\theta = \pi\): \(r_\text{aph} = a(1+e)\).

<div class="theorem">
<strong>Kepler's Second Law.</strong> A line from the Sun to a planet sweeps out equal areas in equal times.
</div>

This is equivalent to the conservation of angular momentum. In a time \(dt\), the planet moves through angle \(d\theta\) and sweeps a triangular area:

\[
dA = \frac{1}{2}r^2\,d\theta
\]

So the rate of area swept is \(dA/dt = \frac{1}{2}r^2\dot{\theta}\). The angular momentum per unit mass is \(L/m = r^2\dot{\theta} = \text{const}\) (since gravity is a central force). Therefore \(dA/dt = L/(2m) = \text{const}\). Kepler's second law is thus a direct consequence of the central nature of gravitational attraction — Newton later showed this elegantly.

The consequence is that a planet moves faster when close to the Sun (at perihelion) and slower when far away (at aphelion). Specifically, by conservation of angular momentum: \(v_\text{peri}\, r_\text{peri} = v_\text{aph}\, r_\text{aph}\), so \(v_\text{peri}/v_\text{aph} = r_\text{aph}/r_\text{peri} = (1+e)/(1-e)\). For Earth (\(e = 0.017\)), the speed at perihelion (January) is about 3.4% faster than at aphelion (July) — enough to make northern hemisphere winters slightly shorter than northern hemisphere summers.

<div class="theorem">
<strong>Kepler's Third Law.</strong> The square of the orbital period is proportional to the cube of the semi-major axis:

\[
T^2 = \frac{4\pi^2}{GM_\odot}\,a^3
\]
where \(G\) is Newton's gravitational constant and \(M_\odot\) is the Sun's mass. In convenient units (with \(T\) in years and \(a\) in AU): \(T^2 = a^3\).
</div>

<div class="proof">
<strong>Derivation for Circular Orbits.</strong> For a planet in a circular orbit of radius \(r = a\), gravity provides the centripetal force:

\[
\frac{GM_\odot m}{r^2} = \frac{mv^2}{r} = m\,\frac{(2\pi r/T)^2}{r} = \frac{4\pi^2 mr}{T^2}
\]
Solving for \(T^2\):

\[
T^2 = \frac{4\pi^2 r^3}{GM_\odot} = \frac{4\pi^2}{GM_\odot}\,a^3
\]
The derivation for elliptical orbits uses the same result with \(a\) replacing \(r\), which requires showing that the total energy determines the period and depends only on \(a\) — a result that comes from the full solution of the Kepler problem.
</div>

Kepler's third law has profound utility: it allows the mass of any object to be determined from the orbital parameters of something orbiting it. For binary stars, \(T^2 = 4\pi^2 a^3/[G(M_1+M_2)]\). For a planet's moons, the planet's mass is determined from \(T^2 = 4\pi^2 a^3/(GM_\text{planet})\). This is how we know the masses of all planets with natural satellites, and of countless binary star systems.

## 2.3 Newton's Law of Gravitation

**Isaac Newton** (1643–1727) provided the physical explanation for Kepler's laws: universal gravitation. His law states that any two point masses \(m_1\) and \(m_2\) separated by distance \(r\) attract each other with force:

\[
F = \frac{Gm_1 m_2}{r^2}
\]

where \(G = 6.674 \times 10^{-11}\) N m\(^2\) kg\(^{-2}\) is the gravitational constant. Newton showed that this inverse-square law, combined with his laws of motion, implies all three of Kepler's laws. This is the first great unification in physics: the same law that governs the fall of an apple governs the motion of the Moon and the planets.

The **gravitational potential energy** of two masses is:

\[
U = -\frac{Gm_1 m_2}{r}
\]

The choice of zero at \(r \to \infty\) makes \(U\) negative (attractive interaction). The total mechanical energy of an orbiting body is:

\[
E = K + U = \frac{1}{2}mv^2 - \frac{GMm}{r}
\]

For a circular orbit, \(K = GMm/(2r)\) and \(E = -GMm/(2r) < 0\). The negative total energy reflects the fact that the orbit is bound — the planet cannot escape to infinity. For \(E = 0\) (parabolic trajectory) or \(E > 0\) (hyperbolic trajectory), the object is unbound and passes by only once.

The **escape velocity** from the surface of a body of mass \(M\) and radius \(R\) is found by setting \(E = 0\):

\[
\frac{1}{2}mv_\text{esc}^2 = \frac{GMm}{R} \implies v_\text{esc} = \sqrt{\frac{2GM}{R}}
\]

For Earth: \(v_\text{esc} = \sqrt{2 \times 6.67 \times 10^{-11} \times 5.97 \times 10^{24} / 6.37 \times 10^6} \approx 11.2\) km/s. For the Sun: \(v_\text{esc,\odot} \approx 617\) km/s. The concept of escape velocity leads directly to the idea of a **black hole**: a body so massive and compact that the escape velocity exceeds the speed of light, \(v_\text{esc} \geq c\). The Schwarzschild radius below which this occurs is \(R_S = 2GM/c^2\).

---

# Chapter 3: The Sun and the Physics of Stars

## 3.1 Stellar Luminosity, Temperature, and the Stefan-Boltzmann Law

A star is a luminous ball of gas held together by its own gravity and powered by nuclear fusion in its core. The most fundamental observable properties of a star are its **luminosity** (total radiated power), its **surface temperature**, and its **apparent brightness** as seen from Earth.

A **blackbody** is an idealised object that absorbs all incident radiation and emits thermal radiation with a spectrum determined only by its temperature. The **Planck distribution** gives the spectral energy density:

\[
B_\nu(T) = \frac{2h\nu^3}{c^2}\frac{1}{e^{h\nu/k_BT} - 1}
\]

where \(h\) is Planck's constant, \(\nu\) is frequency, \(c\) is the speed of light, and \(k_B\) is Boltzmann's constant. Integrating over all frequencies gives the total radiated power per unit area — the **Stefan-Boltzmann Law**:

\[
j = \sigma T^4
\]

where \(\sigma = 5.67 \times 10^{-8}\) W m\(^{-2}\) K\(^{-4}\) is the Stefan-Boltzmann constant. For a star of radius \(R\) and surface temperature \(T\), the total luminosity is:

\[
L = 4\pi R^2 \sigma T^4
\]

This simple formula connects the three fundamental stellar properties. The Sun has \(L_\odot = 3.83 \times 10^{26}\) W, \(R_\odot = 6.96 \times 10^8\) m, and \(T_\odot \approx 5778\) K.

**Wien's Displacement Law** states that the wavelength of peak emission is inversely proportional to temperature:

\[
\lambda_\text{max} T = b_W = 2.898 \times 10^{-3} \text{ m K}
\]

The Sun peaks at \(\lambda_\text{max} = 502\) nm (green), which is why the Sun appears yellowish-white — the human eye perceives the superposition of the broad blackbody spectrum as white. A hot blue star with \(T = 30{,}000\) K peaks at 97 nm (ultraviolet); a cool red giant with \(T = 3000\) K peaks at 966 nm (near-infrared) and appears reddish.

## 3.2 The Hertzsprung-Russell Diagram

The **Hertzsprung-Russell (H-R) diagram** is the central organisational tool of stellar astronomy. It is a scatter plot of stars with luminosity (or absolute magnitude) on the vertical axis and surface temperature (or spectral type or colour index) on the horizontal axis — with temperature **decreasing** to the right (a historical convention). When nearby stars of known distance (and thus known luminosity) are plotted, the vast majority fall along a diagonal band called the **Main Sequence** running from hot, luminous blue stars in the upper left to cool, dim red stars in the lower right. The Main Sequence is a sequence of stellar mass: high-mass stars are hot and luminous; low-mass stars are cool and dim.

The Sun lies at about the middle of the Main Sequence, with spectral type G2V. Well above the Main Sequence, in the upper right, are the **red giants** and **red supergiants** — stars with low temperatures but high luminosities, implying they must have enormous radii (from \(L = 4\pi R^2\sigma T^4\)). Betelgeuse, with \(T \approx 3500\) K and \(L \approx 100{,}000\, L_\odot\), has a radius of about 1000 \(R_\odot\). In the lower left are **white dwarfs** — hot but dim, implying they are tiny (radius comparable to Earth's).

A star spends most of its life on the Main Sequence, fusing hydrogen to helium in its core. The position on the Main Sequence is determined primarily by mass; the **mass-luminosity relation** for Main Sequence stars is approximately \(L \propto M^4\). A star ten times more massive than the Sun is roughly 10,000 times more luminous — it burns its fuel 10 times faster but has only 10 times more fuel, giving it a lifetime 1000 times shorter.

## 3.3 Stellar Nucleosynthesis: The Energy Source of Stars

The energy source of the Sun puzzled physicists until the 20th century. Simple calculations showed that chemical combustion or gravitational contraction (Kelvin-Helmholtz contraction) could sustain the Sun's luminosity for at most tens of millions of years — far less than geological evidence demanded for the age of the Earth. The resolution came with nuclear physics: the **proton-proton (pp) chain** converts four hydrogen nuclei (protons) into one helium-4 nucleus, releasing energy equal to the mass defect times \(c^2\).

The net reaction of the pp-I chain is:

\[
4\,\text{p} \to {}^4\text{He} + 2e^+ + 2\nu_e + 2\gamma
\]

The mass of four protons is \(4 \times 1.6726 \times 10^{-27}\) kg = \(6.690 \times 10^{-27}\) kg. The mass of \(^4\)He is \(6.644 \times 10^{-27}\) kg. The mass defect is \(\Delta m = 4.6 \times 10^{-29}\) kg, corresponding to an energy release of:

\[
Q = \Delta m\, c^2 = 4.6 \times 10^{-29} \times (3\times10^8)^2 = 4.1 \times 10^{-12} \text{ J} = 26.7 \text{ MeV}
\]

(Some energy is carried away by neutrinos and not available to heat the star.) The Sun converts about \(6.2 \times 10^{11}\) kg of hydrogen to helium every second and loses about \(4.3 \times 10^9\) kg as energy per second (from \(E = mc^2\)). At this rate, with \(M_\odot \approx 2 \times 10^{30}\) kg and roughly 10% of the mass available for fusion (only the core conditions are hot enough), the Sun has a Main Sequence lifetime of:

\[
t_\text{MS} = \frac{0.1 M_\odot c^2 \times \eta}{L_\odot} \approx \frac{0.1 \times 2\times10^{30} \times (3\times10^8)^2 \times 0.007}{3.83 \times 10^{26}} \approx 1.1 \times 10^{10} \text{ yr} = 11 \text{ Gyr}
\]

where the efficiency factor \(\eta \approx 0.007\) (0.7% of rest mass is released). The Sun is about 4.6 Gyr old, roughly halfway through its Main Sequence life.

## 3.4 Stellar Structure — The Equations of Stellar Equilibrium

A star in equilibrium is maintained by a balance between gravity (which tries to collapse it) and the pressure of the hot gas (which tries to expand it). The four equations of stellar structure govern this equilibrium.

**Hydrostatic equilibrium**: the pressure gradient supports the weight of the overlying layers. For a shell of thickness \(dr\) at radius \(r\) with local density \(\rho\):

\[
\frac{dP}{dr} = -\frac{G M(r)\rho}{r^2}
\]

where \(M(r) = \int_0^r 4\pi r'^2 \rho(r')\, dr'\) is the mass enclosed within radius \(r\).

**Mass continuity**: the enclosed mass increases with radius as:

\[
\frac{dM}{dr} = 4\pi r^2 \rho
\]

**Energy transport**: for stars in radiative equilibrium (energy transported by photon diffusion):

\[
\frac{dT}{dr} = -\frac{3\kappa\rho L(r)}{16\pi a c r^2 T^3}
\]

where \(\kappa\) is the opacity (cross section per unit mass) and \(a = 4\sigma/c\) is the radiation density constant.

**Energy generation**: the local luminosity increases as energy is generated by nuclear reactions:

\[
\frac{dL}{dr} = 4\pi r^2 \rho \varepsilon
\]

where \(\varepsilon\) is the energy generation rate per unit mass (W/kg).

These four coupled differential equations, together with boundary conditions (\(M(0) = 0\), \(L(0) = 0\), \(P(R) = 0\), \(T(R) = T_\text{eff}\)) and an equation of state, equation of opacity, and nuclear reaction rates as input physics, completely determine the structure of a star given its mass and composition. The fact that mass alone (plus composition) determines a star's structure is the **Vogt-Russell theorem**.

---

# Chapter 4: Stellar Evolution and Exotic Stars

## 4.1 Post-Main-Sequence Evolution

When a star exhausts hydrogen in its core, nuclear burning ceases there and the core begins to contract. The contraction releases gravitational potential energy (**Kelvin-Helmholtz mechanism**), heating the core until conditions for helium burning are met. Meanwhile, hydrogen continues to burn in a shell surrounding the contracting core. This shell-burning phase causes the outer layers of the star to expand enormously, cooling as they do — the star becomes a **red giant** (for low-mass stars) or **red supergiant** (for high-mass stars), occupying the upper-right region of the H-R diagram.

For a star like the Sun (\(M \lesssim 8M_\odot\)), helium burning in the core produces carbon and oxygen. When helium is exhausted in the core, carbon-oxygen burning requires temperatures that are not achieved in low-mass stars. The star instead ejects its outer layers as a **planetary nebula** — a beautiful shell of glowing gas — leaving behind the dense, hot **white dwarf** remnant.

## 4.2 White Dwarfs and the Chandrasekhar Limit

A white dwarf is the exposed core of a former low-mass star, composed primarily of carbon and oxygen ions and electrons, at densities of \(10^6\)–\(10^{10}\) kg/m\(^3\). At such extreme densities, the **electron degeneracy pressure** — a quantum mechanical effect arising from the Pauli exclusion principle — provides the pressure that supports the white dwarf against gravitational collapse.

The Pauli exclusion principle forbids two electrons from occupying the same quantum state. When electrons are packed to high density, they are forced into successively higher energy states even at zero temperature. The resulting **Fermi pressure** (degeneracy pressure) is independent of temperature (unlike gas pressure), making white dwarfs stable against thermal perturbations.

The electron degeneracy pressure for a non-relativistic electron gas is:

\[
P_\text{deg,NR} = \frac{\hbar^2}{5m_e}\left(\frac{3\pi^2 n_e}{1}\right)^{5/3}
\]

where \(n_e\) is the electron number density. For a white dwarf of mass \(M\) and mean molecular weight per electron \(\mu_e\), the electron density is \(n_e = \rho/(\mu_e m_u)\), where \(m_u\) is the atomic mass unit. Setting the degeneracy pressure equal to the gravitational pressure gives a mass-radius relation: \(R \propto M^{-1/3}\). More massive white dwarfs are actually smaller!

As the mass increases, electrons become **relativistic** — they approach speeds comparable to \(c\). In the relativistic limit, the degeneracy pressure becomes:

\[
P_\text{deg,R} = \frac{\hbar c}{4}\left(3\pi^2 n_e\right)^{4/3}
\]

The softer \(\rho^{4/3}\) scaling (compared to \(\rho^{5/3}\) in the non-relativistic case) means the pressure grows more slowly than the gravitational force as the star contracts. Subrahmanyan Chandrasekhar showed in 1930 that beyond a critical mass, the relativistic degeneracy pressure cannot support the star at any radius — the white dwarf must collapse. The **Chandrasekhar limit** is:

\[
M_\text{Ch} = \left(\frac{5.83}{\mu_e^2}\right) M_\odot \approx 1.4\, M_\odot \quad (\text{for } \mu_e = 2)
\]

<div class="proof">
<strong>Rough Derivation of the Chandrasekhar Limit.</strong> We compare the relativistic degeneracy pressure with the gravitational pressure for a white dwarf of mass \(M\), radius \(R\), and uniform density \(\rho = 3M/(4\pi R^3)\). The electron number density is \(n_e \approx \rho/(m_u \mu_e)\), so:

\[
n_e \sim \frac{M}{\mu_e m_u R^3}
\]

The relativistic degeneracy pressure scales as:

\[
P_\text{deg} \sim \hbar c\, n_e^{4/3} \sim \hbar c\!\left(\frac{M}{\mu_e m_u R^3}\right)^{4/3}
\]

The mean gravitational pressure scale (pressure needed to support the star) is:

\[
P_\text{grav} \sim \frac{GM^2}{R^4}
\]

Setting \(P_\text{deg} \sim P_\text{grav}\) and solving for \(M\) (noting both sides have the same \(R\) dependence, \(R^{-4}\), so \(R\) cancels):

\[
\hbar c\left(\frac{M}{\mu_e m_u}\right)^{4/3} \sim G M^2
\implies M^{4/3-2} \sim \frac{G\mu_e^{4/3} m_u^{4/3}}{\hbar c}
\implies M^{-2/3} \sim \frac{G \mu_e^{4/3} m_u^{4/3}}{\hbar c}
\]

\[
M_\text{Ch} \sim \left(\frac{\hbar c}{G}\right)^{3/2}\frac{1}{(\mu_e m_u)^2}
\]

Inserting numbers: \((\hbar c/G)^{3/2} \approx (1.055\times10^{-34} \times 3\times10^8 / 6.67\times10^{-11})^{3/2}\). The combination \(\hbar c/G\) has dimensions of mass squared in natural units; numerically \(M_\text{Ch} \approx 1.4\, M_\odot\) for \(\mu_e = 2\).
</div>

## 4.3 Neutron Stars and Pulsars

A star more massive than about \(8 M_\odot\) evolves through multiple stages of nuclear burning — hydrogen, helium, carbon, oxygen, neon, magnesium, silicon — building up an onion-layered core structure. When the iron core (the end product of silicon burning, beyond which no further energy can be released by fusion because iron has the maximum binding energy per nucleon) exceeds the Chandrasekhar mass, it collapses catastrophically in less than a second. The inner core reaches nuclear densities (\(\sim 10^{17}\) kg/m\(^3\)) and bounces, sending a shock wave outward through the infalling material. This bounce, supplemented by an enormous flux of neutrinos from the newly formed **neutron star**, drives the outer layers off in a **Type II supernova** explosion — among the most energetic events in the universe, briefly outshining an entire galaxy.

The **neutron star** remnant is held up by **neutron degeneracy pressure** (analogous to electron degeneracy pressure but for neutrons). A typical neutron star has mass \(\sim 1.4 M_\odot\), radius \(\sim 10\) km, and density \(\sim 5 \times 10^{17}\) kg/m\(^3\) — greater than the density of an atomic nucleus. The surface gravity is \(\sim 2 \times 10^{11}\) times Earth's. Neutron stars are predicted to have a maximum mass of about \(2-3\, M_\odot\) (the **Tolman-Oppenheimer-Volkoff limit**), above which collapse to a black hole is inevitable.

**Pulsars** are rotating neutron stars that emit beams of radio waves from their magnetic poles. If a beam sweeps across Earth with each rotation, we detect regular pulses. The first pulsar (PSR 1919+21) was discovered in 1967 by Jocelyn Bell Burnell and Antony Hewish; the pulses were so regular (period 1.3373 s, stable to 1 part in 10\(^7\)) that they were initially nicknamed "LGM" (Little Green Men). The **millisecond pulsars** — recycled pulsars spun up by accretion from a companion star — rotate hundreds of times per second and are the most precise natural clocks known, rivalling atomic clocks in stability.

## 4.4 Black Holes

When a neutron star exceeds its maximum mass — either through accretion or from a massive progenitor — it collapses to a **black hole**. The escape velocity from the surface equals the speed of light, so no information can escape. The boundary is the **event horizon** at the Schwarzschild radius:

\[
R_S = \frac{2GM}{c^2}
\]

For a stellar-mass black hole of \(M = 10 M_\odot\): \(R_S = 2 \times 6.67\times10^{-11} \times 10 \times 2\times10^{30} / (3\times10^8)^2 \approx 30\) km. For the supermassive black hole at the centre of the Milky Way (Sgr A\(^*\)), \(M \approx 4\times10^6 M_\odot\) and \(R_S \approx 0.08\) AU.

The concept of a black hole follows from general relativity, Einstein's theory of gravity, which describes gravity not as a force but as the curvature of spacetime caused by mass-energy. The Schwarzschild metric describes the spacetime geometry outside a non-rotating, spherically symmetric mass:

\[
ds^2 = -\!\left(1 - \frac{R_S}{r}\right)c^2\,dt^2 + \left(1 - \frac{R_S}{r}\right)^{-1}dr^2 + r^2\,d\Omega^2
\]

At \(r = R_S\), the \(g_{tt}\) component of the metric vanishes and the \(g_{rr}\) component diverges — the **coordinate singularity** that marks the event horizon. Time dilation near the horizon is extreme: a clock near the horizon runs arbitrarily slow as measured by a distant observer.

---

# Chapter 5: The Milky Way and Galaxies

## 5.1 Structure of the Milky Way

Our galaxy, the **Milky Way**, is a barred spiral galaxy with a total mass of about \(10^{12} M_\odot\) (including dark matter) and a disk diameter of about 50 kpc. The Sun is located about 8.5 kpc from the galactic centre, in the Orion arm. The galaxy has several principal components: the thin disk (mostly young stars, gas, and dust); the thick disk (older stars); the central bulge (older stars and a supermassive black hole Sgr A\(^*\)); and the stellar halo (old stars and globular clusters surrounding the disk in a roughly spherical distribution).

The galactic rotation curve — the orbital speed of stars and gas as a function of distance from the galactic centre — provides compelling evidence for dark matter. Naively, if most of the mass were concentrated in the central bulge, we would expect the orbital speed to fall off as \(v \propto r^{-1/2}\) (Keplerian decline) beyond the bulge, just as the planets' speeds fall off in the outer solar system. Instead, the rotation curve is **flat** — orbital speed remains roughly constant (\(\sim 220\) km/s for the Milky Way) out to the edge of the observable disk and beyond. This flatness implies that the enclosed mass continues to increase as \(M(r) \propto r\) far beyond the visible disk — there must be an invisible **dark matter halo** extending far out.

## 5.2 Galaxy Types and the Hubble Sequence

Galaxies come in three broad morphological classes in the **Hubble sequence**: **elliptical galaxies** (smooth, featureless ellipsoidal systems, ranging from nearly spherical E0 to highly elongated E7); **spiral galaxies** (disk galaxies with spiral arms, either normal Sa-Sc or barred SBa-SBc); and **lenticular (S0) galaxies** (intermediate between ellipticals and spirals — a disk without prominent spiral structure).

Elliptical galaxies are composed mainly of old, red stars with little gas or dust and very low current star formation rates. Spiral galaxies have ongoing star formation in their arms (traceable by the presence of H II regions, young blue stars, and molecular clouds). The Milky Way and Andromeda are large spiral galaxies; the Magellanic Clouds are irregular dwarf galaxies. Giant ellipticals and **cD galaxies** at the centres of galaxy clusters can be hundreds of times more massive than the Milky Way.

---

# Chapter 6: Cosmology — The Big Bang and the Evolution of the Universe

## 6.1 Hubble's Law and the Expanding Universe

In the 1920s, Edwin Hubble measured the distances to a number of "spiral nebulae" using Cepheid variable stars as standard candles (their pulsation period is related to their absolute luminosity — the period-luminosity relation discovered by Henrietta Leavitt in 1908). He found that these objects were not part of the Milky Way but were external galaxies at vast distances — confirming the "island universe" hypothesis.

More remarkably, Hubble found that nearly all galaxies are **receding** from us, with recession velocity \(v\) proportional to their distance \(d\):

\[
v = H_0\,d
\]

This is **Hubble's Law**, and \(H_0\) is the **Hubble constant**, currently measured to be about \(H_0 \approx 67-73\) km s\(^{-1}\) Mpc\(^{-1}\) (the discrepancy between different measurement methods is the "Hubble tension" — an active area of cosmological research).

The recession velocity is measured via the **cosmological redshift**: the wavelengths of spectral lines from distant galaxies are stretched by the expansion of space. The **redshift** \(z\) is defined as:

\[
z = \frac{\lambda_\text{obs} - \lambda_\text{emit}}{\lambda_\text{emit}} = \frac{\Delta\lambda}{\lambda}
\]

For small recession velocities (\(v \ll c\)), the Doppler formula gives \(z \approx v/c\), so \(v = cz\) and Hubble's law becomes \(cz = H_0 d\). For cosmological distances, the relationship between \(z\) and distance requires the full machinery of general relativistic cosmology.

The cosmic expansion implies that the universe was denser and hotter in the past — extrapolating backward leads to the **Big Bang** singularity approximately \(t_0 = 1/H_0 \approx 14\) Gyr ago (the exact age is \(13.8\) Gyr from CMB analysis). This was not an explosion into existing space but an expansion of space itself; every point in the universe receded from every other point, with no preferred centre.

## 6.2 Cosmic Microwave Background Radiation

The most powerful evidence for the Big Bang is the **cosmic microwave background (CMB)** — the thermal radiation left over from the early universe. About 380,000 years after the Big Bang, the universe had cooled to \(\sim 3000\) K, cool enough for electrons and protons to combine into neutral hydrogen (the epoch of **recombination** or photon **decoupling**). Before recombination, the universe was an opaque plasma; at decoupling, it became transparent and the photons streamed freely. These photons now reach us from all directions, redshifted by the expansion of the universe to a temperature of 2.725 K — a nearly perfect blackbody spectrum peaked in the microwave.

The CMB was predicted by George Gamow, Ralph Alpher, and Robert Herman in 1948 and discovered accidentally by Arno Penzias and Robert Wilson in 1965. The COBE satellite (1989–1993) confirmed that the CMB spectrum is an essentially perfect blackbody, the most precise blackbody spectrum ever measured. The WMAP (2001–2010) and Planck (2009–2013) satellites mapped the **temperature anisotropies** — tiny variations in the CMB temperature of order \(\delta T/T \sim 10^{-5}\) — across the sky with high precision.

These anisotropies encode a wealth of information about the early universe. The **acoustic peaks** in the CMB power spectrum — oscillations in the temperature contrast as a function of angular scale — are caused by sound waves (acoustic oscillations) in the photon-baryon fluid before decoupling. The position of the first acoustic peak constrains the total energy density of the universe (and thus its spatial geometry); the heights of successive peaks constrain the baryon density and dark matter density. The Planck satellite data give: \(\Omega_\text{total} \approx 1.000 \pm 0.002\) (universe is spatially flat), \(\Omega_b h^2 \approx 0.022\) (baryonic matter), \(\Omega_\text{DM} h^2 \approx 0.120\) (dark matter), and \(\Omega_\Lambda \approx 0.68\) (dark energy).

## 6.3 Big Bang Nucleosynthesis

Within the first few minutes of the Big Bang, when the temperature exceeded \(10^9\) K, nuclear reactions produced the light elements — primarily hydrogen, helium, and small amounts of lithium. This **Big Bang Nucleosynthesis (BBN)** is one of the great triumphs of the Standard Model of cosmology: it predicts the primordial abundances of hydrogen and helium with no free parameters (given the baryon-to-photon ratio \(\eta = n_b/n_\gamma \approx 6 \times 10^{-10}\)) and these predictions agree with observations of the oldest, least-processed astrophysical environments.

The key prediction is that the primordial **helium mass fraction** is \(Y_p \approx 0.25\) — one quarter of all baryonic mass in the universe is helium-4. This is determined by the neutron-to-proton ratio at the onset of BBN (\(\sim 1:7\)) and the fact that virtually all neutrons end up bound in He-4 nuclei (the most stable nucleus available). Stars produce helium through hydrogen fusion, but the stellar contribution (over the age of the universe) raises the helium fraction by only about 0.02, well below the primordial value. The fact that the universe contains so much helium regardless of stellar processing is compelling evidence for hot early conditions.

## 6.4 Dark Matter and Dark Energy

The standard cosmological model, \(\Lambda\)CDM, includes two components that have not been directly detected in the laboratory. **Dark matter** (CDM: cold dark matter) accounts for about 27% of the total energy density of the universe. Its existence is inferred from multiple independent lines of evidence: galactic rotation curves (as discussed for the Milky Way), the dynamics and lensing of galaxy clusters, the structure of the CMB anisotropies, and the growth of large-scale structure. Dark matter is "dark" because it does not interact with photons (no electromagnetic interaction) and "cold" because it was non-relativistic at the time of matter-radiation equality.

The leading candidates for dark matter particles include **Weakly Interacting Massive Particles (WIMPs)** — hypothetical particles with masses of tens to hundreds of GeV and interactions mediated by the weak force (predicted by supersymmetric extensions of the Standard Model) — and **axions** — very light particles originally proposed to solve the strong CP problem in QCD. Despite decades of searching, no dark matter candidate has been directly detected. The Large Underground Xenon (LUX) and XENON1T experiments set the most stringent limits on WIMP-nucleon cross sections, while the ADMX experiment searches for axions via their coupling to photons in a microwave cavity.

**Dark energy** accounts for about 68% of the total energy density and is responsible for the **accelerated expansion** of the universe discovered in 1998 by two teams of astronomers measuring the apparent brightness of Type Ia supernovae as cosmological standard candles. The most natural candidate for dark energy is the **cosmological constant** \(\Lambda\) — an energy density of the vacuum — with equation of state parameter \(w = P/(\rho c^2) = -1\). A positive vacuum energy density acts as an anti-gravity force, causing the expansion to accelerate. The discovery of cosmic acceleration earned Saul Perlmutter, Brian Schmidt, and Adam Riess the 2011 Nobel Prize in Physics.

## 6.5 Inflation and the Large-Scale Structure of the Universe

The standard Big Bang model, while enormously successful, has three puzzles that it cannot solve internally: the **horizon problem** (why is the CMB so uniform — to 1 part in 10\(^5\) — across regions that were never in causal contact?), the **flatness problem** (why is the total energy density of the universe so close to the critical density, to a precision of 0.2%?), and the **monopole problem** (Grand Unified Theories predict abundant magnetic monopoles that are not observed).

**Inflation** — a period of exponentially rapid expansion in the earliest fraction of a second (at \(t \sim 10^{-36}\) to \(10^{-33}\) s) driven by the energy density of an inflaton field — resolves all three puzzles simultaneously. During inflation, a region initially in causal contact expanded by a factor of at least \(e^{60}\) — so what appears to us as the observable universe was once a tiny, causally connected, thermalized region. Inflation also stretched any spatial curvature flat (the flatness problem) and diluted any relics from Grand Unified Theory phase transitions (the monopole problem).

Furthermore, quantum fluctuations during inflation — inherent to any quantum field — were stretched to macroscopic scales and became the **primordial density perturbations** that seeded all subsequent structure formation: galaxies, galaxy clusters, and the cosmic web of filaments and voids seen in large galaxy surveys like the Sloan Digital Sky Survey (SDSS). The nearly scale-invariant spectrum of these perturbations (as predicted by single-field slow-roll inflation) is one of the key predictions confirmed by CMB observations.

---

# Chapter 7: Special and General Relativity in Astrophysics

## 7.1 Special Relativity: Key Results

**Special relativity** (Einstein, 1905) rests on two postulates: (1) the laws of physics are the same in all inertial reference frames; (2) the speed of light in vacuum is the same in all inertial frames. These seemingly innocent postulates have radical consequences.

**Time dilation**: a clock moving at speed \(v\) relative to an observer runs slow by the Lorentz factor \(\gamma = 1/\sqrt{1-v^2/c^2}\):

\[
\Delta t = \gamma\,\Delta t_0
\]

where \(\Delta t_0\) is the **proper time** (time elapsed in the rest frame of the clock). For \(v = 0.99c\), \(\gamma \approx 7.1\) — a muon created at the top of the atmosphere and moving at near-light-speed lives about 7 times longer (in the lab frame) than at rest, allowing it to reach the ground despite having a proper lifetime of only \(2.2\;\mu\)s.

**Length contraction**: an object of proper length \(L_0\) moving at speed \(v\) appears contracted along the direction of motion to:

\[
L = \frac{L_0}{\gamma}
\]

**Relativistic energy and momentum**:

\[
E = \gamma mc^2, \qquad \mathbf{p} = \gamma m\mathbf{v}, \qquad E^2 = (pc)^2 + (mc^2)^2
\]

The rest energy \(E_0 = mc^2\) is perhaps the most famous equation in physics. For a photon (\(m = 0\)), \(E = pc = h\nu\).

In astrophysics, special relativity governs the behaviour of **relativistic jets** (streams of plasma ejected at nearly light speed from AGN and gamma-ray burst sources), **cosmic ray particles** (protons and nuclei accelerated to ultra-high energies), and **pulsar emission** (electrons emitting synchrotron radiation in the powerful magnetic fields of neutron stars).

## 7.2 General Relativity: Gravity as Spacetime Curvature

**General relativity** (Einstein, 1915) generalises special relativity to include gravity. The central insight is the **equivalence principle**: gravity is locally equivalent to acceleration. A freely falling observer does not feel gravity; an observer standing on a planetary surface feels a pseudo-force equivalent to being accelerated upward.

Einstein elevated this physical observation to a geometric principle: gravity is not a force but the curvature of four-dimensional **spacetime**, and free-fall trajectories are the **geodesics** — straightest possible paths — in this curved spacetime. The curvature is sourced by mass-energy according to the **Einstein field equations**:

\[
G_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu}
\]

where \(G_{\mu\nu}\) is the Einstein curvature tensor, \(g_{\mu\nu}\) is the metric tensor, \(T_{\mu\nu}\) is the stress-energy tensor (the source of curvature), and \(\Lambda\) is the cosmological constant.

Key predictions of GR confirmed by observation:

**Gravitational lensing**: light follows geodesics in curved spacetime, so the path of light is bent by massive objects. The apparent positions of background stars and galaxies are shifted — a spectacular demonstration captured by Eddington's 1919 solar eclipse expedition. Strong gravitational lensing by galaxy clusters produces arcs and multiple images of background galaxies; weak lensing produces a coherent distortion of background galaxy shapes that can be used to map the dark matter distribution.

**Gravitational waves**: accelerating masses produce ripples in spacetime that propagate at the speed of light. The LIGO and Virgo detectors made the first direct detection of gravitational waves in September 2015 — from the merger of two black holes of about 29 and 36 solar masses, producing a final black hole of about 62 solar masses (the 3 solar masses of "missing" mass radiated as gravitational waves in about 0.1 seconds). This detection opened an entirely new window on the universe.

**Gravitational redshift**: clocks in deeper gravitational potential wells run slower. The **gravitational redshift** of photons climbing out of a potential well is \(\Delta\nu/\nu = -\Delta\phi/c^2\), where \(\Delta\phi\) is the difference in gravitational potential. Near a black hole, the redshift diverges at the event horizon — photons from just outside the horizon are shifted to arbitrarily long wavelengths. GPS satellites must account for both special-relativistic time dilation (clocks run slow due to orbital speed) and general-relativistic time dilation (clocks run fast due to weaker gravity at altitude) to maintain positional accuracy.

The **perihelion precession of Mercury** was a longstanding anomaly: Newtonian gravity predicted a precession of the orbital perihelion due to perturbations from other planets, but the observed precession exceeded the Newtonian prediction by 43 arcseconds per century. This residual is precisely accounted for by general relativity — the first quantitative success of GR — and confirmed that the theory was physically correct rather than merely a mathematical curiosity.

# Chapter 8: The Solar System — Formation, Structure, and Exploration

## 8.1 Formation of the Solar System

The solar system formed about 4.6 billion years ago from the gravitational collapse of a portion of a molecular cloud — a cold, dense region of interstellar gas and dust. The trigger for collapse may have been a nearby supernova, whose shock wave compressed the cloud and provided the radioactive nuclides (\(^{26}\text{Al}\), \(^{60}\text{Fe}\)) whose decay heat in early planetesimals is recorded in meteorites.

<div class="definition">
<strong>Nebular Hypothesis.</strong> The solar nebula — the rotating disk of gas and dust from which the solar system formed — flattened by conservation of angular momentum during collapse. The Sun formed at the centre from the densest region; planets formed by sequential accretion in the disk. The temperature gradient in the nebula set the composition gradient: within the <em>frost line</em> (at \(\sim 2.7\,\text{AU}\), where water ice is stable), only refractory materials (silicates, metals) could condense, producing the rocky terrestrial planets. Beyond the frost line, ice could condense, providing abundant solid material for rapid core accretion and the formation of gas giants.
</div>

The **core accretion model** for giant planet formation proceeds in three stages. First, solid grains in the nebula stick together by electrostatic and van der Waals forces, growing from microns to centimetres. Second, metre-sized objects experience a "metre-size barrier" — they drift inward due to aerodynamic drag from the pressure-supported gas (which orbits slightly slower than Keplerian speed) before growing to kilometre-sized planetesimals. Third, once bodies grow to kilometre scale, gravitational focusing amplifies the collision cross-section and **runaway growth** occurs: the largest bodies grow fastest (their gravitational cross-section grows as the square of radius), reaching planet-sized objects in \(\sim 10^5\) years. Giant planet cores (~10 Earth masses) then accrete gas from the nebula rapidly; the disk dissipates by UV photoevaporation from the young Sun in \(\sim 10^6\)–\(10^7\) years, halting gas accretion and setting the final planet masses.

The **Nice model** (2005) proposes that the giant planets formed in a more compact configuration and underwent orbital migration driven by resonant interactions with a massive outer disk of planetesimals (the primordial Kuiper belt). A dynamical instability ~600 million years after formation caused Jupiter to migrate inward and Saturn, Uranus, and Neptune to migrate outward, scattering most of the outer disk into the inner solar system and producing the **Late Heavy Bombardment** — a period of intense cratering recorded on the Moon's surface. This explains the current orbital architecture of the giant planets and the orbital structure of the asteroid belt and Kuiper belt.

## 8.2 The Terrestrial Planets

Mercury, Venus, Earth, and Mars share a rocky composition (silicate mantle, iron core) but differ dramatically in surface conditions. Mercury, with no atmosphere, has a surface that swings between 430°C (day) and −180°C (night) and is heavily cratered. Its anomalously large iron core (85% of its radius) is thought to result from a giant impact that stripped most of its mantle, or from preferential condensation near the Sun. Its magnetic field — weak but present — is generated by a dynamo in its partially liquid outer core.

Venus is almost Earth's twin in size and mass but has evolved to an extreme greenhouse: its thick \(\text{CO}_2\) atmosphere (surface pressure 92 bar) maintains surface temperatures of 462°C — hotter than Mercury — and its surface is geologically active with vast lava plains and hundreds of volcanoes. The absence of plate tectonics on Venus is thought to be related to the absence of liquid water, which lubricates subduction zones on Earth. Venus rotates retrograde (opposite to its orbital direction) very slowly (243 Earth days per rotation), possibly due to a giant impact or atmospheric tidal coupling.

Mars has a thin \(\text{CO}_2\) atmosphere (pressure ~600 Pa, about 0.6% of Earth's) and a surface shaped by ancient volcanism (Olympus Mons, the solar system's largest volcano, 22 km high), the Valles Marineris canyon system (4000 km long, 7 km deep), and evidence of ancient liquid water (river valleys, delta deposits, hydrated minerals). The two polar ice caps contain water ice mixed with frozen \(\text{CO}_2\). Mars lost its magnetic field ~4 Gyr ago when its small iron core solidified, after which the solar wind stripped most of its atmosphere — a cautionary tale for planetary habitability. NASA's Perseverance rover (2021) is currently searching for biosignatures in the Jezero crater delta.

## 8.3 The Giant Planets and Their Moons

Jupiter is the solar system's largest planet (318 Earth masses, 11 Earth radii), composed primarily of hydrogen and helium with a probable rocky/icy core of 10–40 Earth masses. Its interior is compressed to metallic hydrogen — a state where hydrogen behaves as a metal, conducting electricity — at pressures above 2 Mbar, generating Jupiter's powerful magnetic field (10× Earth's) and its synchrotron radiation. Jupiter radiates more energy than it receives from the Sun, indicating slow gravitational contraction or helium rain in its deep interior.

Jupiter's four Galilean moons (Io, Europa, Ganymede, Callisto) were discovered by Galileo in 1610 — the first satellites known to orbit another planet, directly falsifying the Ptolemaic model. Io is the most volcanically active body in the solar system, heated by tidal dissipation from its orbital resonance with Europa and Ganymede (1:2:4 Laplace resonance). Europa has a global subsurface ocean beneath an ice shell ~10–30 km thick, maintained liquid by tidal heating, and is one of the most promising places in the solar system to search for extraterrestrial life. Ganymede is the solar system's largest moon (larger than Mercury) and the only moon with its own intrinsic magnetic field.

Saturn's ring system — the solar system's most spectacular feature — consists of billions of ice and rock particles ranging from centimetres to metres in size, spanning 282,000 km but only 10–100 m thick. The rings are geologically young (100–400 Myr old, based on their mass and the rate they are spreading and falling onto Saturn) and are thought to be the remnant of a large icy moon that was disrupted by tidal forces. Saturn's moon Titan has a thick nitrogen atmosphere and liquid methane/ethane lakes at its poles — the only extraterrestrial surface liquids known — and may have prebiotic chemistry analogous to early Earth.

## 8.4 Small Bodies and Impacts

The **asteroid belt** between Mars and Jupiter contains millions of rocky and metallic objects, the remnants of planetesimals that failed to accrete into a planet due to gravitational perturbations from Jupiter. The total mass is only about 4% of the Moon's mass — most of the original material was scattered. The largest asteroid, Ceres (now classified as a dwarf planet, diameter 939 km), contains about 25% of the belt's total mass and is thought to harbour a subsurface liquid water layer.

Comets are icy bodies from the outer solar system (Kuiper belt and Oort cloud) that develop bright tails when they approach the Sun — sublimation of ices produces gas and dust that are swept away from the Sun by radiation pressure and the solar wind. Short-period comets (orbital period < 200 yr, e.g., Comet Halley) originate from the Kuiper belt; long-period comets from the Oort cloud. The Rosetta mission (ESA, 2014–2016) orbited and landed on comet 67P/Churyumov-Gerasimenko, revealing a "rubber duck" shape (indicative of a gentle merger of two planetesimals), organic molecules (including glycine, an amino acid), and D/H ratios suggesting that comets from the outer solar system did not deliver most of Earth's water (which appears to have come from asteroid-like sources).

**Impact cratering** has shaped all solid surfaces in the solar system and played key roles in Earth's history. The Chicxulub impactor (\(\sim 10\,\text{km}\) diameter, 66 Myr ago) released \(\sim 10^{23}\,\text{J}\), excavated a 180-km crater in Mexico, caused global fires, a years-long impact winter, and the mass extinction that ended the Cretaceous period, eliminating non-avian dinosaurs and about 75% of all species. Probabilistic analysis suggests that a Chicxulub-scale event occurs every \(\sim 10^8\) years; smaller but still civilization-threatening impacts (\(>1\,\text{km}\) diameter) occur every \(\sim 10^6\) years. NASA's DART mission (2022) successfully deflected the asteroid Dimorphos by deliberately impacting it, demonstrating planetary defence capability.

# Chapter 9: Stars — Physics in Detail

## 9.1 Stellar Spectra and the Classification System

The temperature, composition, and luminosity class of a star are encoded in its spectrum. The Harvard spectral classification (OBAFGKM, ordered by decreasing temperature) organises stars by the absorption lines present: O stars (>30,000 K) show ionised helium; B stars (10,000–30,000 K) show neutral helium; A stars (7,500–10,000 K) show strong hydrogen Balmer lines; F and G stars show ionised metals (Ca II H and K lines dominate in G stars); K stars show neutral metals; M stars (<3,500 K) show molecular bands (TiO). The Sun is a G2V star (G spectral type, luminosity class V = main sequence).

The **MK luminosity classification** adds a Roman numeral for luminosity class: I (supergiant), II (bright giant), III (giant), IV (subgiant), V (main sequence dwarf), VI or sd (subdwarf). The luminosity class is determined from the pressure-sensitive widths of spectral lines: in giant stars, the lower atmospheric pressure gives narrower lines (less pressure broadening). This allows **spectroscopic parallax** — estimating the distance to a star from its spectrum alone, since the spectral type and luminosity class together determine the absolute magnitude, and comparison with the apparent magnitude gives the distance modulus \(\mu = m - M = 5\log_{10}(d/10\,\text{pc})\).

## 9.2 The Proton-Proton Chain and Stellar Energy

Main-sequence stars derive their energy from hydrogen fusion. The dominant mechanism in the Sun and lower-mass stars is the **proton-proton (pp) chain**:

\[
p + p \to {}^2\text{H} + e^+ + \nu_e \quad (\text{rate-limiting step})
\]

\[
{}^2\text{H} + p \to {}^3\text{He} + \gamma
\]

\[
{}^3\text{He} + {}^3\text{He} \to {}^4\text{He} + 2p \quad (\text{pp-I chain})
\]

Net: \(4p \to {}^4\text{He} + 2e^+ + 2\nu_e + 2\gamma\), with energy release \(Q = 26.73\,\text{MeV}\) (after accounting for positron annihilation). The rate-limiting step is the weak interaction \(p + p \to d + e^+ + \nu_e\), which has an extraordinarily small cross-section (\(\sigma \sim 10^{-48}\,\text{m}^2\)) because it requires conversion of a proton to a neutron. A proton in the Sun's core has a mean free time of \(\sim 10^{10}\) years before undergoing this reaction — the Sun converts only about \(3.6 \times 10^{38}\) protons per second into helium, producing a power of \(3.8 \times 10^{26}\,\text{W}\).

The **CNO cycle** dominates in stars more massive than about 1.3 solar masses (core temperature > \(1.7 \times 10^7\,\text{K}\)): carbon, nitrogen, and oxygen act as catalysts for fusing hydrogen to helium. The CNO cycle has a much steeper temperature dependence (\(\varepsilon \propto T^{16}\)) than the pp chain (\(\varepsilon \propto T^4\)), which is why massive stars have convective cores (the steep temperature sensitivity causes a steep energy generation profile, driving convection) while lower-mass stars have convective envelopes.

The **solar neutrino problem** — the fact that early experiments detected only one-third the expected solar neutrino flux — was resolved by the discovery of **neutrino oscillations**: neutrinos change flavour as they propagate, so electron neutrinos produced in the pp chain partly convert to muon and tau neutrinos, which early detectors could not detect. The SNO experiment in Sudbury (2001) used heavy water to detect all neutrino flavours and confirmed that the total neutrino flux matched the solar model; the deficit was entirely due to oscillations. This discovery (Ahmad et al. 2001, Nobel Prize 2015) proved that neutrinos have non-zero mass.

## 9.3 Stellar Evolution in Detail — The Main Sequence to the Giant Branch

A zero-age main sequence (ZAMS) star is in thermal and hydrostatic equilibrium: the pressure gradient supports it against gravity, and nuclear energy replaces the energy radiated from the surface. As hydrogen burns in the core, the mean molecular weight increases (four protons become one helium nucleus), so for fixed pressure, the density increases and the core contracts slightly. By the virial theorem, contraction heats the core, and the higher temperature raises the luminosity, so main-sequence stars gradually brighten over time.

The Sun has brightened by about 30% since it joined the main sequence 4.6 Gyr ago. This created the **faint young Sun paradox**: geological and biological evidence shows that Earth had liquid water and life even 3.8 Gyr ago, when the Sun was 20–25% less luminous than today. The resolution likely involves a warmer early atmosphere (more \(\text{CO}_2\) and \(\text{CH}_4\) before photosynthetic oxygen production), possible lower albedo from the lack of continents, and perhaps a slightly more massive early Sun (losing mass via a stronger solar wind).

When hydrogen is exhausted in the core, the core contracts and heats up while a hydrogen-burning shell ignites around it. The shell's energy output increases the luminosity dramatically; simultaneously, the star's outer layers expand dramatically and cool — it becomes a **red giant** with luminosity 100–1000 times the main-sequence value and temperature \(\sim 4000\,\text{K}\). For the Sun, this will occur in ~5 Gyr; the Sun will expand to about 200 solar radii and swallow Mercury and Venus. The tip of the red giant branch (TRGB) is a nearly universal luminosity (\(M_I \approx -4.05\) in the I band) because helium ignition occurs at a nearly fixed core mass (\(\sim 0.45 M_\odot\)) — making the TRGB a useful standard candle for extragalactic distances.

## 9.4 Supernovae — Types and Physics

**Type Ia supernovae** occur when a white dwarf in a binary system accretes enough mass from its companion to approach the Chandrasekhar limit. At this point, carbon fusion ignites off-centre in the degenerate core and propagates as a thermonuclear deflagration that burns the entire white dwarf to \(^{56}\text{Ni}\) in about a second, releasing \(\sim 10^{44}\,\text{J}\). The radioactive decay chain \(^{56}\text{Ni} \to ^{56}\text{Co} \to ^{56}\text{Fe}\) (half-lives 6.1 d and 77.2 d) powers the optical light curve. Because the explosion always occurs at approximately the same mass, Type Ia supernovae have a nearly fixed peak absolute magnitude (\(M_B \approx -19.3\)), making them excellent standard candles — the tool that led to the discovery of the accelerating expansion of the Universe in 1998 (Nobel Prize 2011).

**Core-collapse supernovae** (Types II, Ib, Ic) occur in massive stars (\(>8 M_\odot\)) when the iron core exceeds the Chandrasekhar mass and collapses in milliseconds. The outer layers follow, compress the core to nuclear density (\(\rho \sim 3 \times 10^{17}\,\text{kg/m}^3\)), and bounce off the incompressible nuclear matter, generating a shock wave that propagates outward. The shock stalls at \(\sim 150\,\text{km}\) due to energy loss from photodisintegration of iron nuclei and neutrino losses. It is revived — in the currently favoured neutrino-driven mechanism — by absorption of \(\sim 1\%\) of the \(\sim 3 \times 10^{46}\,\text{J}\) of neutrinos emitted during neutronisation of the core. The revival, after hundreds of milliseconds of numerical simulation, ultimately produces the supernova explosion. The \(3 \times 10^{46}\,\text{J}\) carried by neutrinos is 100 times the Sun's total main-sequence energy output and about 100 times the kinetic energy of the ejecta — the neutrino burst from Supernova 1987A was detected by three underground neutrino detectors (Kamiokande II, IMB, and Baksan), confirming this picture.

# Chapter 10: Cosmology — Precision Era

## 10.1 The Cosmic Microwave Background in Detail

The CMB is a nearly perfect blackbody spectrum at \(T = 2.7255\,\text{K}\) permeating the entire sky. Its discovery by Penzias and Wilson (1964, Nobel 1978) provided incontrovertible evidence for the hot Big Bang. Its spectrum, measured by the FIRAS instrument on the COBE satellite (1990), matches a blackbody to within 0.01% — the most perfect blackbody known in nature — ruling out alternative models that predicted spectral distortions.

The **angular anisotropies** of the CMB — temperature fluctuations of order \(\Delta T/T \sim 10^{-5}\) — encode a wealth of cosmological information. First detected by COBE (1992) at degree scales, they were mapped in extraordinary detail by WMAP (2001–2010) and Planck (2009–2013). The angular power spectrum \(C_\ell\) (the variance of temperature fluctuations at angular scale \(\theta \approx 180°/\ell\)) shows a series of **acoustic peaks** — oscillations of the primordial plasma between last scattering and the present.

The physics is straightforward to describe qualitatively. Before recombination, the photon-baryon fluid underwent acoustic oscillations: gravity compressed overdense regions while radiation pressure resisted compression, producing oscillations that propagated as sound waves at speed \(c_s = c/\sqrt{3(1 + 3\rho_b/4\rho_\gamma)}\) (close to \(c/\sqrt{3}\) in the radiation-dominated era). Regions that happened to be at maximum compression (minimum temperature, since compression heats) or maximum rarefaction (maximum temperature) at the time of recombination appear bright or dark on the CMB sky. The **sound horizon** — the comoving distance sound could travel by recombination — sets the scale of the first acoustic peak. Measuring the angular position of the first peak (\(\ell_1 \approx 220\), \(\theta_1 \approx 1°\)) and knowing the physical sound horizon (\(\sim 147\,\text{Mpc}\)) from theory gives the angular diameter distance to the last scattering surface, which constrains the total energy density of the Universe to be \(\Omega_{\text{total}} = 1.0002 \pm 0.0026\) — the Universe is spatially flat to extraordinary precision.

The relative heights of successive acoustic peaks constrain the baryon density (the second peak relative to the first), dark matter density, and the spectral index of primordial fluctuations. Planck (2018) results give: baryon density \(\Omega_b h^2 = 0.02237\), cold dark matter density \(\Omega_c h^2 = 0.1200\), Hubble constant \(H_0 = 67.4\,\text{km/s/Mpc}\), spectral index \(n_s = 0.965\) (slightly less than 1, consistent with simple inflationary models), and optical depth to reionisation \(\tau = 0.054\). The precision of these measurements — many at the sub-percent level — makes modern cosmology a precision science rather than an order-of-magnitude field.

## 10.2 The Hubble Tension

The CMB measurement of \(H_0 = 67.4 \pm 0.5\,\text{km/s/Mpc}\) (Planck 2018) is in \(\sim 5\sigma\) tension with the **Cepheid+supernovae distance ladder** measurement of \(H_0 = 73.2 \pm 1.3\,\text{km/s/Mpc}\) (Riess et al. 2022). This "Hubble tension" is one of the most significant open problems in modern cosmology.

The Cepheid-based measurement proceeds through several rungs: (1) geometric parallax distances to nearby Cepheids in the Milky Way; (2) Cepheid distances to galaxies in the Local Group containing Type Ia supernovae; (3) Type Ia supernova distances to the Hubble flow. Each rung has been scrutinised extensively without finding a systematic error large enough to explain the discrepancy. The CMB measurement, by contrast, derives \(H_0\) by fitting the Standard Model of cosmology (\(\Lambda\)CDM) to the angular power spectrum; if the model is incomplete (e.g., if dark energy evolves with time, or if there is a non-standard radiation component), the inferred \(H_0\) would be biased. The James Webb Space Telescope has recently confirmed the Cepheid distance ladder result with independent systematics, strengthening the tension.

## 10.3 Dark Matter — Evidence and Candidates

Dark matter constitutes about 27% of the energy density of the Universe but interacts only gravitationally (and possibly weakly) with ordinary matter. Evidence for its existence is overwhelming and comes from multiple independent lines:

**Galaxy rotation curves**: Stars in spiral galaxies should orbit the galactic centre with velocities \(v(r) = \sqrt{GM(r)/r}\) where \(M(r)\) is the mass enclosed within radius \(r\). If the visible mass (stars and gas, concentrated in the disk) dominated, \(v\) should decline as \(r^{-1/2}\) (Keplerian falloff) beyond the visible edge. Instead, rotation curves are observed to be **flat** (\(v \approx\) const.) out to large radii — implying \(M(r) \propto r\) and a dark mass component with density profile \(\rho \propto r^{-2}\) at large radii. Vera Rubin's meticulous rotation curve measurements in the 1970s made this evidence compelling.

**Gravitational lensing**: The total mass distribution in galaxy clusters, measured from the bending of background galaxy images, far exceeds the visible mass in galaxies and hot gas (the latter detectable in X-rays). The **Bullet Cluster** (1E 0657-56), a collision of two galaxy clusters, provides particularly direct evidence: the hot gas (which interacts electromagnetically and slows down) is offset from the dark matter (inferred from weak lensing, which shows it passed through almost without interaction), demonstrating that dark matter does not self-interact strongly and is distinct from ordinary matter.

**Big Bang nucleosynthesis**: The observed abundances of \(^4\text{He}\), \(^2\text{H}\) (deuterium), \(^3\text{He}\), and \(^7\text{Li}\) are consistent with a baryon density of \(\Omega_b h^2 = 0.022\), much less than the total matter density \(\Omega_m h^2 = 0.143\). The missing matter must be non-baryonic.

The leading dark matter candidates are **Weakly Interacting Massive Particles** (WIMPs) with masses of 10–1000 GeV, motivated by supersymmetric extensions of the Standard Model; **axions** (extremely light pseudo-Goldstone bosons originally proposed to solve the strong CP problem of QCD, with masses \(\sim 10^{-5}\,\text{eV}\)); and **sterile neutrinos**. Direct detection experiments (LUX-ZEPLIN, XENONnT) search for WIMP-nucleus scattering in deep underground detectors; despite exquisite sensitivity, no WIMP signal has been detected, placing strong upper limits on the WIMP-nucleon cross-section and constraining the WIMP mass range.

## 10.4 Exoplanet Astronomy

The detection of planets around other stars — exoplanets — has revolutionised planetary science and the search for life. The first confirmed exoplanet around a main-sequence star, 51 Pegasi b, was discovered by Mayor and Queloz (1995, Nobel 2019) using the **radial velocity method**: the gravitational pull of the planet causes the star to wobble, Doppler-shifting its spectral lines. For a planet of mass \(m_p\) in a circular orbit of radius \(a\) around a star of mass \(M_*\), the stellar reflex velocity amplitude is:

\[
K_* = \frac{m_p \sin i}{\sqrt{M_*(m_p + M_*)}} \sqrt{\frac{G}{a}} \approx \frac{m_p \sin i}{M_*}\sqrt{\frac{GM_*}{a}}
\]

where \(i\) is the orbital inclination. For 51 Peg b (\(m_p \sin i \approx 0.47 M_J\), \(a = 0.052\,\text{AU}\), \(P = 4.2\,\text{d}\)), \(K_* \approx 56\,\text{m/s}\), readily measurable with spectrographs achieving 1 m/s precision.

The **transit method** — detecting the brightness dip when a planet crosses the star's disk — was employed by the Kepler space telescope (2009–2018) to discover over 2,600 confirmed exoplanets. The transit depth is \(\delta = (R_p/R_*)^2\); for an Earth-Sun analogue, \(\delta = (6400/696{,}000)^2 \approx 84\,\text{ppm}\), requiring photometric precision of \(\sim 20\,\text{ppm}\) over 13 hours — achievable only from space. Kepler revealed that super-Earths and mini-Neptunes (radii 1–4 \(R_\oplus\)) are the most common type of planet in the Galaxy, and that the frequency of Earth-sized planets in the habitable zone (where liquid water could exist on the surface) is of order 10–20% for Sun-like stars.

The James Webb Space Telescope (launched December 2021) can measure exoplanet atmospheres by **transmission spectroscopy**: during transit, starlight passes through the planet's atmosphere and is absorbed at wavelengths corresponding to atmospheric molecules. JWST has detected \(\text{CO}_2\) and other molecules in several exoplanet atmospheres and is beginning to characterise potentially habitable planets — the first steps toward detecting biosignatures (e.g., \(\text{O}_2\), \(\text{O}_3\), \(\text{CH}_4\) in biological disequilibrium) in Earth-like worlds.

# Chapter 11: The Search for Life and Multi-Messenger Astronomy

## 11.1 Habitability and the Drake Equation

The **Drake equation** (Frank Drake, 1961) estimates the number of communicating civilisations in the Galaxy:

\[
N = R_* \cdot f_p \cdot n_e \cdot f_l \cdot f_i \cdot f_c \cdot L
\]

where \(R_*\) is the star formation rate (~3/yr), \(f_p\) is the fraction of stars with planets (~1, from Kepler), \(n_e\) is the number of habitable planets per planetary system (~0.1–0.4 from Kepler eta-Earth estimates), \(f_l\) is the fraction on which life arises (completely unknown), \(f_i\) is the fraction that develops intelligence, \(f_c\) is the fraction that communicate, and \(L\) is the lifetime of the communicating phase (in years). The dramatic uncertainty in \(f_l f_i f_c\) makes \(N\) range from \(<1\) to millions depending on assumptions — the equation is best seen as a taxonomy of ignorance rather than an estimate. The **Fermi paradox** (Fermi, 1950): "Where is everybody?" — if intelligent life is common, the Galaxy should have been colonised by now, yet we have no evidence of extraterrestrial civilisations. The resolution may lie in the rarity of intelligence, the brevity of communicating civilisations, the difficulty of interstellar travel, or in observational limitations.

## 11.2 Multi-Messenger Astronomy

The 2017 binary neutron star merger GW170817 marked the dawn of **multi-messenger astronomy**: the event was detected simultaneously in gravitational waves (LIGO/Virgo), gamma rays (Fermi GBM, 1.7 s after the GW signal), ultraviolet-optical-infrared (the kilonova AT2017gfo, observed by hundreds of telescopes), X-rays (Chandra, 9 days later), and radio (VLA, 16 days later). This single event confirmed: (1) neutron star mergers are the sites of short gamma-ray bursts; (2) they are prolific producers of r-process heavy elements (gold, platinum, lanthanides — visible in the kilonova spectrum); (3) the neutron star equation of state at nuclear density can be constrained from the tidal deformability measured in the GW signal; and (4) an independent measurement of \(H_0 = 70^{+12}_{-8}\,\text{km/s/Mpc}\) was obtained by comparing the gravitational-wave luminosity distance to the optical redshift of the host galaxy, providing a completely new "standard siren" distance indicator.

The next-generation ground-based detectors (Einstein Telescope in Europe, Cosmic Explorer in the USA, planned for the 2030s) will detect binary neutron star mergers throughout the observable Universe (\(z \sim 2\)), enabling precise measurements of \(H_0\), constraints on the neutron star equation of state from thousands of events, and tests of GR in the strong-field regime. The LISA space interferometer (planned for launch 2037) will detect gravitational waves from supermassive black hole mergers at cosmological distances, providing a qualitatively new window on galaxy formation and evolution.
