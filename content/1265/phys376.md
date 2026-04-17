---
title: "PHYS376: Relativistic Physics"
prof: ""
subjects: "PHYS"
---

## Sources and References

**Primary textbook** — Sean Carroll, *Spacetime and Geometry: An Introduction to General Relativity*, Cambridge University Press, 2019 edition.

**Supplementary texts** — Bernard Schutz, *A First Course in General Relativity*, Cambridge University Press, 3rd edition, 2022. James B. Hartle, *Gravity: An Introduction to Einstein's General Relativity*, Pearson/Addison-Wesley, 2003. Charles W. Misner, Kip S. Thorne, and John Archibald Wheeler, *Gravitation*, Princeton University Press, 2017 reprint.

**Online resources** — Sean Carroll, "Lecture Notes on General Relativity," arXiv:gr-qc/9712019. David Tong, General Relativity lecture notes, University of Cambridge, available at damtp.cam.ac.uk/user/tong/gr.html. Scott Hughes, MIT 8.962 General Relativity, MIT OpenCourseWare. Leonard Susskind, Einstein's General Theory of Relativity, Stanford Continuing Studies lecture series.

---

# Chapter 1: Spacetime and Lorentz Transformations

The story of special relativity begins not with Einstein but with a careful experimental failure. By the late nineteenth century, physicists had constructed a beautiful and consistent theory of electromagnetism in Maxwell's equations, and those equations predicted electromagnetic waves propagating at a definite speed \(c = 1/\sqrt{\mu_0 \varepsilon_0} \approx 3 \times 10^8\) m/s. The natural question was: speed relative to what? The prevailing answer was the luminiferous aether, a medium pervading all of space, and the Earth's motion through this aether should produce a measurable anisotropy in the speed of light. In 1887, Albert Michelson and Edward Morley built an interferometer sensitive enough to detect the expected effect — and found nothing. The null result was not a measurement error. It meant that light travels at the same speed regardless of the motion of the source or the observer. This single experimental fact, replicated to extraordinary precision by subsequent experiments, is the seed from which all of special relativity grows.

## Einstein's Two Postulates

Einstein in 1905 chose to take the Michelson–Morley result as fundamental rather than as a puzzle to be explained away. His first postulate is the principle of relativity: the laws of physics take the same form in all inertial frames of reference. This is an extension of the Galilean principle that was already accepted for mechanics, now promoted to cover electromagnetism and every other branch of physics. His second postulate is the constancy of the speed of light: light propagates through vacuum at speed \(c\) in every inertial frame, independently of the motion of the source. These two postulates together are logically incompatible with Galilean kinematics, which assumed that velocities add linearly. Something in the classical picture of space and time must be wrong, and that something turns out to be the assumption that time is universal and absolute.

## Deriving the Lorentz Transformation

Consider two inertial frames \(S\) and \(S'\), where \(S'\) moves with velocity \(v\) along the \(x\)-axis of \(S\), with origins coinciding at \(t = t' = 0\). We seek the transformation relating \((t, x)\) to \((t', x')\). First, we demand linearity: a particle moving at constant velocity in \(S\) must move at constant velocity in \(S'\), which requires a linear relationship. Write the ansatz \(x' = \gamma(x - vt)\) and \(t' = \gamma(t - \alpha x)\) for constants \(\gamma\) and \(\alpha\) to be determined. To find \(\gamma\), consider a clock stationary at the origin of \(S'\), so \(x' = 0\). Then \(x = vt\) in \(S\). The inverse transformation requires \(x = \gamma(x' + vt')\). Consistency of the two transformations under \(v \to -v\) implies that \(\gamma\) must be the same in both directions, which is guaranteed by symmetry between frames.

To pin down both \(\gamma\) and \(\alpha\), impose the constancy of the speed of light. A light pulse emitted from the common origin satisfies \(x = ct\) in \(S\) and must satisfy \(x' = ct'\) in \(S'\). Substituting \(x = ct\) into the ansatz for \(x'\) and \(t'\) gives \(x' = \gamma t(c - v)\) and \(t' = \gamma t(1 - \alpha c)\). Demanding \(x'/t' = c\) we need \((c - v)/(1 - \alpha c) = c\), which gives \(\alpha = v/c^2\). Repeating for a pulse in the \(-x\) direction (\(x = -ct\)) yields the same \(\alpha\), confirming consistency. Finally, applying both transformations in succession and requiring the composition to be the identity gives:

\[
\gamma^2\!\left(1 - \frac{v^2}{c^2}\right) = 1 \quad \Longrightarrow \quad \gamma = \frac{1}{\sqrt{1 - v^2/c^2}}
\]

The complete Lorentz transformation is therefore:

\[
t' = \gamma\!\left(t - \frac{vx}{c^2}\right), \qquad x' = \gamma(x - vt), \qquad y' = y, \qquad z' = z
\]

This is the fundamental kinematic relation of special relativity, replacing the Galilean \(t' = t\), \(x' = x - vt\) that implicitly assumed \(\gamma = 1\). The factor \(\gamma \geq 1\) is always greater than or equal to unity, with equality only at \(v = 0\). As \(v \to c\), \(\gamma \to \infty\), which reflects the impossibility of accelerating a massive object to the speed of light.

## Minkowski Diagrams and Light Cones

Hermann Minkowski in 1908 showed that the Lorentz transformation has a natural geometric interpretation. In a Minkowski diagram, one plots \(ct\) on the vertical axis and \(x\) on the horizontal axis, so that light rays travel at 45-degree angles and are represented by straight lines through the origin. A particle's worldline is the curve swept out as time advances, and an inertial particle traces a straight line. When frame \(S'\) moves at velocity \(v\) relative to \(S\), its time axis \(x' = 0\) is the line \(x = vt\) (tilted from the vertical toward the light cone), and its space axis \(t' = 0\) is the line \(t = vx/c^2\) (tilted from the horizontal by the same angle). The light cone at any event divides spacetime into the future lightcone (causally accessible future), past lightcone (causally accessible past), and the spacelike exterior (causally disconnected region). This causal structure is frame-independent and is the deepest geometric statement of special relativity.

## Time Dilation and Atmospheric Muons

Consider a clock at rest in \(S'\), which ticks from \(t' = 0\) to \(t' = T\) at position \(x' = 0\). In \(S\), applying the inverse Lorentz transformation gives elapsed time \(t = \gamma T\). Since \(\gamma \geq 1\), the moving clock runs slow. This is time dilation: a moving clock ticks more slowly by a factor of \(\gamma\). The effect is symmetric in the sense that each frame sees the other's clock running slow, but this symmetry is broken when clocks are brought back together.

<div class="example">
<strong>Atmospheric Muons.</strong> Muons are created in the upper atmosphere at altitude \(L_0 = 10\) km when cosmic rays strike atmospheric nuclei. They travel downward at \(v = 0.998c\), giving \(\beta = v/c = 0.998\) and

\[
\gamma = \frac{1}{\sqrt{1 - 0.998^2}} = \frac{1}{\sqrt{0.003996}} \approx 15.8
\]

The muon rest-frame lifetime is \(\tau_0 = 2.2\;\mu\text{s}\). In the ground frame, the muon lives for \(\tau_\text{lab} = \gamma\tau_0 \approx 15.8 \times 2.2\;\mu\text{s} = 34.8\;\mu\text{s}\). In this time it travels \(d = v\tau_\text{lab} = 0.998c \times 34.8\;\mu\text{s} \approx 10.4\) km, just reaching sea level. Without time dilation the muon decays after \(d_0 = v\tau_0 \approx 660\) m, and essentially none would reach detectors. Measured sea-level muon fluxes match the time-dilation prediction to high precision, making atmospheric muons one of the cleanest direct verifications of special relativity.
</div>

## Length Contraction and Relativity of Simultaneity

A rod at rest in \(S'\) has proper length \(L_0 = x_2' - x_1'\). To measure its length in \(S\), one records the positions of both endpoints simultaneously in \(S\), at the same coordinate time \(t\). Using the inverse Lorentz transformation \(x' = \gamma(x - vt)\), simultaneous measurement in \(S\) (with \(\Delta t = 0\)) gives \(\Delta x' = \gamma\,\Delta x\), so the rod's length in \(S\) is \(L = L_0/\gamma\). A moving rod is shortened in the direction of motion by the factor \(1/\gamma\). For the atmospheric muon, the 10 km atmosphere appears length-contracted to \(L = 10/15.8 \approx 0.63\) km in the muon's rest frame — from the muon's perspective, the atmosphere is short enough to cross before decaying.

Relativity of simultaneity follows directly from the transformation \(t' = \gamma(t - vx/c^2)\). Two events at positions \(x_1\) and \(x_2\) that are simultaneous in \(S\) (\(\Delta t = 0\)) are separated in \(S'\) by \(\Delta t' = -\gamma v\,\Delta x/c^2 \neq 0\) whenever \(\Delta x \neq 0\). Einstein's two-lightning-strike thought experiment makes this vivid: lightning strikes both ends of a moving train simultaneously in the ground frame, but the observer on the train, moving toward the front strike, receives the front flash first and concludes the events were not simultaneous. The time difference is quantitatively \(\Delta t' = \gamma v L_0/c^2\), where \(L_0\) is the train's proper length. These three effects — time dilation, length contraction, and relativity of simultaneity — are all consequences of the single Lorentz transformation, which sets the stage for the four-vector formalism developed in Chapter 4.

---

# Chapter 2: Relativistic Kinematics

Having established the Lorentz transformation as the correct kinematics of flat spacetime, it is natural to look for quantities that are invariant under those transformations. In Euclidean geometry, the distance \(d^2 = dx^2 + dy^2 + dz^2\) is invariant under rotations. In Minkowski spacetime, the analogous invariant is the spacetime interval:

\[
ds^2 = -c^2\,dt^2 + dx^2 + dy^2 + dz^2
\]

One can verify directly that this combination is unchanged under Lorentz transformations: substituting \(t' = \gamma(t - vx/c^2)\) and \(x' = \gamma(x - vt)\) yields \(-c^2 dt'^2 + dx'^2 = -c^2 dt^2 + dx^2\) after straightforward algebra. The invariant interval serves as the geometric foundation for all of relativistic kinematics, unifying space and time into a single four-dimensional geometric object.

## Proper Time

For a timelike worldline (where \(ds^2 < 0\)), we define the proper time \(\tau\) by:

\[
d\tau^2 = -\frac{ds^2}{c^2} = dt^2 - \frac{dr^2}{c^2} = dt^2\!\left(1 - \frac{v^2}{c^2}\right) = \frac{dt^2}{\gamma^2}
\]

so that \(d\tau = dt/\gamma\). The proper time is the time measured by a clock carried along the worldline; it is a Lorentz scalar, meaning every observer agrees on its value between two given events. Integrating gives the total elapsed proper time \(\tau = \int dt/\gamma\), which depends on the path taken through spacetime and not merely on the endpoints. This path-dependence — the fact that different worldlines connecting the same two events can have different elapsed proper times — is the geometric origin of the twin paradox.

## Four-Velocity and Its Normalisation

The four-velocity is defined as the derivative of position with respect to proper time:

\[
u^\mu = \frac{dx^\mu}{d\tau} = \left(\frac{dt}{d\tau}, \frac{dx}{d\tau}, \frac{dy}{d\tau}, \frac{dz}{d\tau}\right) = \gamma\left(c, \mathbf{v}\right)
\]

where \(\mathbf{v}\) is the ordinary three-velocity. The Minkowski norm of the four-velocity is computed using the metric \(\eta_{\mu\nu} = \text{diag}(-1,+1,+1,+1)\):

\[
\eta_{\mu\nu}u^\mu u^\nu = -\gamma^2 c^2 + \gamma^2 v^2 = \gamma^2(v^2 - c^2) = -c^2
\]

where in the last step we used \(\gamma^2 = c^2/(c^2 - v^2)\). This normalisation \(u^\mu u_\mu = -c^2\) is a Lorentz-invariant identity that holds in every frame, and it encodes the fact that all massive particles move through spacetime at "speed \(c\)" when measured along their worldline. The four-velocity is always timelike, its zeroth component is always positive, and its magnitude is fixed — only its direction in four-dimensional spacetime changes as a particle accelerates.

## Relativistic Velocity Addition

Suppose frame \(S'\) moves at velocity \(v\) relative to \(S\) along \(x\), and a particle moves at velocity \(u'\) along \(x'\) in \(S'\). We want its velocity \(u\) in \(S\). The strategy is to apply the Lorentz transformation to the spacetime displacements \(dx\) and \(dt\). From the transformation \(dx' = \gamma(dx - v\,dt)\) and \(dt' = \gamma(dt - v\,dx/c^2)\), we divide to get \(u' = dx'/dt'\):

\[
u' = \frac{dx - v\,dt}{dt - v\,dx/c^2} = \frac{u - v}{1 - uv/c^2}
\]

Inverting this to get \(u\) in terms of \(u'\):

\[
u = \frac{u' + v}{1 + u'v/c^2}
\]

This is the relativistic velocity addition formula. When \(u', v \ll c\), the denominator approaches unity and we recover Galilean addition \(u \approx u' + v\). When \(u' = c\), the formula gives \(u = (c + v)/(1 + v/c) = c\), confirming that the speed of light is the same in all frames as required by Einstein's second postulate.

<div class="example">
<strong>Velocity Addition with \(u' = v = 0.9c\).</strong> Using the relativistic formula:

\[
u = \frac{0.9c + 0.9c}{1 + (0.9)(0.9)} = \frac{1.8c}{1 + 0.81} = \frac{1.8c}{1.81} \approx 0.9945c
\]

The result is less than \(c\), as it must be. The Galilean expectation would give \(1.8c\), which exceeds the speed of light and is therefore impossible within special relativity. The relativistic formula reveals that \(c\) acts as an asymptote: no combination of velocities below \(c\) can reach or exceed \(c\), and the closer the individual velocities are to \(c\), the smaller the correction needed to prevent the sum from violating causality. One also sees from the formula that combining any velocity with \(c\) always returns \(c\), which is Einstein's second postulate rephrased as an algebraic identity.
</div>

## Relativistic Doppler Effect

Consider a source moving with velocity \(v\) along the line of sight, emitting light at frequency \(f_0\) in its rest frame. In the ground frame, successive wavefronts are separated in time: each wavefront is emitted one period later, but the source has also moved during that period. For a receding source, the time between wavefront arrivals at the observer is \(T_\text{obs} = \gamma T_0(1 + \beta)\), where \(\beta = v/c\) and the \(\gamma T_0\) factor comes from time dilation while the \((1 + \beta)\) factor comes from the increasing travel time of successive wavefronts. Simplifying using \(\gamma = 1/\sqrt{1-\beta^2} = 1/\sqrt{(1-\beta)(1+\beta)}\):

\[
\frac{f_\text{obs}}{f_0} = \frac{1}{T_\text{obs}/T_0} = \sqrt{\frac{1 - \beta}{1 + \beta}}
\]

For an approaching source, replace \(\beta \to -\beta\), giving a blueshift. The transverse Doppler effect — for a source moving perpendicular to the line of sight — gives \(f_\text{obs} = f_0/\gamma\), a pure redshift with no Newtonian analogue, arising entirely from time dilation. This transverse redshift was first measured by Ives and Stilwell in 1938 using canal ray spectroscopy, and it provides an independent test of time dilation separate from the longitudinal Doppler effect.

## Aberration of Light

An additional kinematic effect is the aberration of starlight — the direction from which light appears to arrive depends on the observer's velocity. If a photon travels at angle \(\theta'\) relative to the \(x'\)-axis in frame \(S'\), the angle \(\theta\) in frame \(S\) is found from the Lorentz transformation of the four-momentum. The result is the aberration formula:

\[
\cos\theta = \frac{\cos\theta' + \beta}{1 + \beta\cos\theta'}
\]

At high velocities \(\beta \to 1\), nearly all photons appear to come from directly ahead — the headlight effect. This has important consequences in astrophysics: a relativistic jet emits radiation that is beamed strongly in the forward direction, dramatically boosting the apparent brightness of objects moving toward us.

## The Twin Paradox

Two twins, Alice and Bob, start on Earth. Alice travels to a star 10 light-years away at \(v = 0.8c\), then returns at the same speed. Bob stays on Earth. The round-trip Earth time is \(2 \times 10\,\text{ly}/0.8c = 25\) years. Alice's proper time on each leg is \(10/0.8 \times \sqrt{1 - 0.64} = 12.5 \times 0.6 = 7.5\) years, giving 15 years total elapsed proper time. When they reunite, Alice is 10 years younger than Bob. This is not a logical contradiction: Alice's worldline involves a turnaround — a genuine acceleration — that breaks the symmetry between the two worldlines. In a spacetime diagram, Bob's worldline is a straight vertical line while Alice's consists of two angled segments. The invariant spacetime arc length (proper time) is longest along the straight path, so Bob ages more. Counting light signals exchanged during the journey, which is entirely frame-independent, confirms the asymmetry quantitatively and shows that Alice receives Bob's signals at a higher frequency during the return leg, completely resolving any apparent paradox.

---

# Chapter 3: Relativistic Dynamics

With the kinematic framework established, we now ask how forces, momenta, and energies transform between frames. The guiding principle is that the equations of motion must be covariant — they must have the same form in all inertial frames. The natural way to achieve this is to write the laws of motion in terms of four-vectors, ensuring that every equation is a relation between objects that transform in the same way under Lorentz transformations.

## Four-Momentum and Rest Mass

The four-momentum of a particle of rest mass \(m\) is defined by:

\[
p^\mu = m u^\mu = m\gamma\left(c, \mathbf{v}\right) = \left(\frac{E}{c}, \mathbf{p}\right)
\]

where \(E = \gamma mc^2\) is the total relativistic energy and \(\mathbf{p} = \gamma m\mathbf{v}\) is the relativistic three-momentum. The rest mass is a Lorentz scalar, invariant under boosts: \(-m^2c^2 = \eta_{\mu\nu}p^\mu p^\nu\). To derive \(E = \gamma mc^2\) rather than just state it, we require that the spatial equation of motion \(dp^i/dt = F^i\) reduces to Newton's second law at low velocities. Expanding \(p^i = m\gamma v^i\) for small \(v/c\):

\[
p^i = mv^i\!\left(1 + \frac{v^2}{2c^2} + \cdots\right)
\]

The leading term is Newtonian momentum. The total energy is the time component of four-momentum times \(c\): \(E = cp^0 = \gamma mc^2\). At rest this gives \(E = mc^2\), the rest-mass energy. The kinetic energy is \(K = E - mc^2 = (\gamma - 1)mc^2\), which for \(v \ll c\) expands to \(K \approx \frac{1}{2}mv^2\), recovering the Newtonian expression. The equivalence of mass and energy encoded in \(E = mc^2\) has been confirmed by nuclear reactions, pair annihilation, and mass-spectrometric measurements of binding energies.

## Energy-Momentum Dispersion Relation

From the normalisation of four-momentum \(p^\mu p_\mu = -m^2c^2\):

\[
-\frac{E^2}{c^2} + |\mathbf{p}|^2 = -m^2c^2 \quad \Longrightarrow \quad E^2 = (pc)^2 + (mc^2)^2
\]

This relation holds in all frames and for all values of \(m\). For a massless particle such as a photon, it gives \(E = pc\). Combining with the quantum mechanical relations \(E = \hbar\omega\) and \(p = \hbar|\mathbf{k}|\) recovers the photon dispersion relation \(\omega = c|\mathbf{k}|\). The dispersion relation also governs the kinematics of particle physics experiments: knowing the beam energy and the rest masses of the particles involved, one can compute which reaction channels are energetically accessible and what the minimum required beam energy is.

## Threshold Energy for Pion Production

A fundamental application of four-momentum conservation is finding the minimum energy required to produce a new particle in a collision. The key technique is to evaluate the Lorentz-invariant Mandelstam variable \(s = -(p_1 + p_2)^2\) in both the lab frame and the centre-of-mass frame and set them equal.

<div class="example">
<strong>Threshold for \(p + p \to p + p + \pi^0\).</strong> A proton beam of energy \(E_\text{beam}\) strikes a stationary proton target. In the lab frame, the target proton has four-momentum \(p_2^\mu = (m_pc, \mathbf{0})\). Then:

\[
s = -\left(\frac{E_\text{beam}}{c} + m_pc\right)^2 c^2 + |\mathbf{p}_\text{beam}|^2 c^2 = -2m_p^2c^4 - 2E_\text{beam}m_pc^2
\]

using \(E_\text{beam}^2 - p_\text{beam}^2c^2 = m_p^2c^4\). At threshold, in the centre-of-mass frame all four final-state particles are at rest, so \(\sqrt{-s} = (2m_p + m_\pi)c^2\). Setting the two expressions equal:

\[
2m_p^2c^4 + 2E_\text{beam}m_pc^2 = (2m_p + m_\pi)^2c^4
\]

Solving with \(m_p c^2 = 938.3\) MeV and \(m_\pi c^2 = 135\) MeV:

\[
E_\text{beam} = \frac{(2m_p + m_\pi)^2c^4 - 2m_p^2c^4}{2m_pc^2} = 2m_pc^2 + 2m_\pi c^2 + \frac{m_\pi^2 c^2}{2m_p} \approx 1218\;\text{MeV}
\]

The threshold kinetic energy is \(K = E_\text{beam} - m_pc^2 \approx 280\) MeV. Fixed-target experiments are thus far less efficient than collider experiments at threshold, since most of the beam energy goes into kinetic energy of the centre of mass rather than into creating new particles.
</div>

## Compton Scattering

Compton scattering — the elastic scattering of a photon off a stationary electron — demonstrates the particle nature of light and the validity of four-momentum conservation in relativistic collisions. An incoming photon with four-momentum \(k^\mu = (\hbar\omega/c)(1, \hat{\mathbf{n}})\) strikes an electron at rest with \(p^\mu = (m_ec, \mathbf{0})\). After scattering, the photon has four-momentum \(k'^\mu\) and the electron has \(p'^\mu\). Conservation gives \(k^\mu + p^\mu = k'^\mu + p'^\mu\), so \(p'^\mu = k^\mu + p^\mu - k'^\mu\). Squaring both sides and using \(k^\mu k_\mu = 0\), \(p^\mu p_\mu = -m_e^2c^2\), and the inner product \(k^\mu k'_\mu = -(\hbar^2\omega\omega'/c^2)(1 - \cos\theta)\):

\[
-m_e^2c^2 = 0 + (-m_e^2c^2) + 0 - 2k_\mu k'^\mu - 2p_\mu k'^\mu + 2k_\mu p^\mu
\]

Working through the algebra, substituting \(k^\mu p_\mu = -\hbar\omega m_e\) and \(k'^\mu p_\mu = -\hbar\omega' m_e\), and solving for the frequency shift:

\[
\frac{1}{\omega'} - \frac{1}{\omega} = \frac{\hbar}{m_ec^2}(1 - \cos\theta) \quad \Longrightarrow \quad \Delta\lambda = \frac{h}{m_ec}(1 - \cos\theta)
\]

The Compton wavelength \(\lambda_C = h/(m_ec) = 2.426 \times 10^{-12}\) m sets the scale of the wavelength shift. At \(\theta = 180^\circ\), the shift is maximal: \(\Delta\lambda = 2\lambda_C\). This formula was verified experimentally by Arthur Compton in 1923 using X-rays scattered from carbon, earning him the 1927 Nobel Prize in Physics and confirming the particle nature of electromagnetic radiation.

## Four-Force

The four-force on a particle is \(f^\mu = dp^\mu/d\tau\). Because \(p^\mu p_\mu = -m^2c^2\) is constant along any worldline of fixed mass, differentiating with respect to \(\tau\) gives \(p_\mu f^\mu = 0\): the four-force is always orthogonal to the four-momentum. In the rest frame of the particle, the zeroth component of the four-force vanishes (no power is delivered in the instantaneous rest frame by a force that conserves rest mass), and the spatial components reduce to the Newtonian force. This orthogonality constrains the allowed forms of forces and is the relativistic generalisation of the work-energy theorem.

---

# Chapter 4: Four-Vector and Tensor Formalism

To extend special relativity beyond single particles and to prepare for general relativity, we need a systematic language for objects that transform consistently under Lorentz transformations. That language is tensor calculus in flat spacetime, and this chapter develops it from first principles before generalising to curved spacetime in later chapters.

## Contravariant and Covariant Components

A contravariant four-vector \(A^\mu\) (index up) transforms under Lorentz transformations \(\Lambda^\mu_{\ \nu}\) as \(A'^\mu = \Lambda^\mu_{\ \nu}A^\nu\). The Minkowski metric \(\eta_{\mu\nu} = \text{diag}(-1, +1, +1, +1)\) allows us to lower an index: \(A_\mu = \eta_{\mu\nu}A^\nu\), giving a covariant four-vector (index down). Explicitly, if \(A^\mu = (A^0, A^1, A^2, A^3)\), then \(A_\mu = (-A^0, A^1, A^2, A^3)\). The inverse metric \(\eta^{\mu\nu} = \text{diag}(-1, +1, +1, +1)\) (numerically identical to \(\eta_{\mu\nu}\) in Cartesian coordinates) raises an index: \(A^\mu = \eta^{\mu\nu}A_\nu\). The Lorentz-invariant inner product is \(A^\mu A_\mu = \eta_{\mu\nu}A^\mu A^\nu = -(A^0)^2 + (A^1)^2 + (A^2)^2 + (A^3)^2\), which is a scalar — its value is the same in every inertial frame.

## General Tensors and Transformation Laws

A tensor of rank \((p, q)\) carries \(p\) contravariant indices and \(q\) covariant indices, and its components transform as:

\[
T'^{\mu_1 \cdots \mu_p}_{\ \ \ \nu_1 \cdots \nu_q} = \Lambda^{\mu_1}_{\ \alpha_1}\cdots\Lambda^{\mu_p}_{\ \alpha_p}\,(\Lambda^{-1})^{\beta_1}_{\ \nu_1}\cdots(\Lambda^{-1})^{\beta_q}_{\ \nu_q}\,T^{\alpha_1\cdots\alpha_p}_{\ \ \ \beta_1\cdots\beta_q}
\]

The metric itself is a rank-(0,2) tensor: \(\eta_{\mu\nu}\) has the same components in every inertial frame, which one can verify using the defining property of Lorentz transformations \(\Lambda^\alpha_{\ \mu}\eta_{\alpha\beta}\Lambda^\beta_{\ \nu} = \eta_{\mu\nu}\). The contraction of two tensors on a shared index reduces the total rank by 2 and produces a tensor of lower rank, which is always a valid tensor operation. An important example is the contraction \(\eta^{\mu\nu}\eta_{\mu\nu} = 4\), the trace of the identity, which is a scalar.

## The Stress-Energy Tensor

The most important tensor in relativistic field theory and in general relativity is the stress-energy tensor \(T^{\mu\nu}\). For a perfect fluid (one with no viscosity or heat conduction), its components have a clear physical interpretation in the fluid's rest frame: \(T^{00} = \rho c^2\) is the energy density, \(T^{i0} = T^{0i} = 0\) (no momentum flux in the rest frame), and \(T^{ij} = P\,\delta^{ij}\) where \(P\) is the isotropic pressure. In a general frame, boosting with four-velocity \(u^\mu\) gives:

\[
T^{\mu\nu} = \frac{\rho c^2 + P}{c^2}u^\mu u^\nu + P\eta^{\mu\nu}
\]

The conservation law \(\partial_\mu T^{\mu\nu} = 0\) encodes both energy and momentum conservation. The \(\nu = 0\) component gives \(\partial_t(\rho c^2) + \nabla\cdot(\rho c^2 \mathbf{v}) = 0\), reducing in the non-relativistic limit to the continuity equation \(\partial_t\rho + \nabla\cdot(\rho\mathbf{v}) = 0\). The \(\nu = i\) component gives the Euler equation \(\rho(\partial_t\mathbf{v} + \mathbf{v}\cdot\nabla\mathbf{v}) = -\nabla P\). This conservation law will be generalised in curved spacetime to \(\nabla_\mu T^{\mu\nu} = 0\), where \(\nabla_\mu\) is the covariant derivative that accounts for the non-trivial connection of curved spacetime.

## The Faraday Tensor and Covariant Maxwell Equations

Maxwell's equations acquire their most elegant and manifestly covariant form as tensor equations. The electromagnetic field is encoded in the antisymmetric Faraday tensor \(F^{\mu\nu} = -F^{\nu\mu}\), whose six independent components are the three electric and three magnetic field components. In terms of the physical fields with \(c = 1\):

\[
F^{\mu\nu} = \begin{pmatrix} 0 & -E_x & -E_y & -E_z \\ E_x & 0 & -B_z & B_y \\ E_y & B_z & 0 & -B_x \\ E_z & -B_y & B_x & 0 \end{pmatrix}
\]

The covariant Maxwell equations take the compact forms:

\[
\partial_\nu F^{\mu\nu} = \mu_0 J^\mu \qquad \text{and} \qquad \partial_{\left[\lambda\right.}F_{\left.\mu\nu\right]} = 0
\]

where \(J^\mu = (c\rho_e, \mathbf{J})\) is the four-current. The first equation, written out for \(\mu = 0\), gives \(\nabla\cdot\mathbf{E} = \rho_e/\varepsilon_0\) (Gauss's law), and for \(\mu = i\) gives Ampère's law with Maxwell's displacement current. The second equation, the Bianchi identity for \(F\), gives Faraday's law (\(\nabla\times\mathbf{E} = -\partial\mathbf{B}/\partial t\)) and the statement \(\nabla\cdot\mathbf{B} = 0\). All four Maxwell equations are thus contained in two tensor equations, making their Lorentz covariance manifest and showing that electric and magnetic fields are not independently Lorentz-invariant objects but rather frame-dependent projections of the single covariant object \(F_{\mu\nu}\). A Lorentz boost mixes \(\mathbf{E}\) and \(\mathbf{B}\) components in the same way that a spatial rotation mixes \(x\) and \(y\) components of a vector — what one observer calls a pure electric field, another moving observer experiences as a combination of electric and magnetic fields. Two Lorentz invariants can be constructed from \(F_{\mu\nu}\): the scalar \(F_{\mu\nu}F^{\mu\nu} = 2(B^2 - E^2/c^2)\) and the pseudoscalar \(F_{\mu\nu}\tilde{F}^{\mu\nu} = -4\mathbf{E}\cdot\mathbf{B}/c\), where \(\tilde{F}^{\mu\nu} = \frac{1}{2}\varepsilon^{\mu\nu\rho\sigma}F_{\rho\sigma}\) is the dual tensor. These invariants are preserved under any Lorentz transformation and therefore classify electromagnetic fields into physically distinct types. With this tensorial machinery fully in place, we are prepared to generalise from flat to curved spacetime — a step that requires understanding why Newtonian gravity must be replaced by a geometric theory, which is the content of the next chapter.

---

# Chapter 5: Gravity as Geometry — the Equivalence Principle

Newton's theory of gravity assigns to every massive body a gravitational field that exerts forces on other massive bodies. This picture sat uneasily with special relativity from the beginning: gravitational interaction in Newton's theory is instantaneous, which conflicts with the speed-of-light limit on the propagation of all influences. More fundamentally, there is a remarkable experimental fact about gravity that has no analogue in electromagnetism — all objects fall with the same acceleration regardless of their mass or composition. This universality is the starting point for Einstein's geometric interpretation of gravity.

## Inertial Versus Gravitational Mass

In Newton's framework, there are two a priori distinct concepts of mass. Inertial mass \(m_i\) appears in Newton's second law \(\mathbf{F} = m_i\mathbf{a}\) and measures resistance to acceleration. Gravitational mass \(m_g\) appears in the gravitational force law \(\mathbf{F} = m_g\mathbf{g}\) and measures how strongly an object couples to a gravitational field. Their ratio could in principle vary from object to object; if it did, objects of different compositions would fall at different rates. Roland Eötvös in 1889 searched for composition-dependent differences in free-fall acceleration to one part in \(10^9\) using a torsion balance, comparing pairs of substances including wood, platinum, and water. Dicke and co-workers in the 1960s improved the limit to \(10^{-11}\), and modern torsion balance and lunar laser ranging experiments push it beyond \(10^{-13}\). No difference has ever been found, confirming the weak equivalence principle: \(m_i = m_g\) exactly for all known matter.

## The Strong Equivalence Principle and Freely Falling Frames

Einstein elevated the equivalence of inertial and gravitational mass to a more powerful statement. The strong equivalence principle asserts that in any sufficiently small region of spacetime, the effects of a gravitational field are locally identical to the effects of being in an accelerating reference frame in flat spacetime, and a freely falling observer experiences no local gravitational effects at all. Equivalently, all physical laws — mechanics, electromagnetism, nuclear physics — take the same form in a freely falling frame as in an inertial frame in gravity-free flat spacetime. The qualifier "sufficiently small" is crucial: the frame must be small enough that tidal effects, arising from the spatial variation of the gravitational field, can be neglected. Tidal effects are the residual signature of genuine spacetime curvature that cannot be removed by any choice of frame, and they form the physical basis for the Riemann curvature tensor introduced in Chapter 6.

## Gravitational Redshift: Rocket Argument and Pound–Rebka

Consider an accelerating rocket in flat spacetime with proper acceleration \(g\). A photon emitted from the floor with frequency \(f_0\) climbs to the ceiling, a distance \(h\) above. During the photon's flight time \(\delta t \approx h/c\), the rocket has gained additional speed \(\Delta v = g\delta t = gh/c\). The ceiling detector is therefore moving away from the incoming photon, so by the Doppler formula the observed frequency is:

\[
\frac{f_\text{obs}}{f_0} \approx 1 - \frac{\Delta v}{c} = 1 - \frac{gh}{c^2}
\]

By the strong equivalence principle, the same shift must occur for a photon climbing height \(h\) in a gravitational field with strength \(g\). More precisely, in a spacetime with gravitational potential \(\Phi\), the gravitational redshift is:

\[
\frac{\Delta f}{f} = -\frac{\Delta\Phi}{c^2}
\]

This was tested by Pound and Rebka at Harvard in 1959, using the Mössbauer effect to achieve the necessary frequency resolution. A \(^{57}\)Fe gamma-ray source was placed at the bottom of a 22.5 m tower and an absorber at the top. The predicted fractional frequency shift was \(\Delta f/f = g\Delta h/c^2 = (9.8 \times 22.5)/(3\times10^8)^2 = 2.46 \times 10^{-15}\). The measured value was \((2.57 \pm 0.26) \times 10^{-15}\), consistent with prediction at the 10% level. Subsequent improvements by Pound and Snider in 1965 confirmed the prediction to 1% precision, providing the first laboratory test of a prediction from general relativity.

## Gravitational Time Dilation and GPS

Gravitational redshift implies gravitational time dilation: a clock at higher gravitational potential runs faster than one at lower potential. If a floor clock emits \(N\) wave cycles per unit time and the ceiling clock receives fewer cycles per unit time, the ceiling clock's second is shorter — it runs faster. The time dilation factor between a clock at Newtonian potential \(\Phi_1\) and one at \(\Phi_2 > \Phi_1\) is:

\[
\frac{d\tau_2}{d\tau_1} = 1 + \frac{\Phi_2 - \Phi_1}{c^2}
\]

For GPS satellites orbiting at altitude \(h \approx 20{,}200\) km with orbital speed \(v \approx 3.87\) km/s, two competing relativistic effects arise simultaneously. Gravitational time dilation causes the satellite clock to run fast by approximately \(\Delta\Phi/c^2 \approx gh/c^2 \approx +45.9\;\mu\text{s/day}\) relative to a ground clock. Special-relativistic time dilation from the satellite's velocity causes the clock to run slow by \(v^2/(2c^2) \approx -7.2\;\mu\text{s/day}\). The net effect is \(+38.7\;\mu\text{s/day}\). Since GPS positioning relies on timing signals accurate to nanoseconds, this drift would cause position errors growing at approximately 11 km per day if uncorrected. GPS clocks are pre-corrected at manufacture for this relativistic rate difference, and every time you use a GPS navigation device, you are relying on general relativistic physics.

## Tidal Forces and the Need for Curved Spacetime

The equivalence principle establishes that gravity can be transformed away locally. But two freely falling observers separated by a finite horizontal distance will accelerate slightly toward each other (because the gravitational field converges toward the Earth's centre), while two observers separated vertically will accelerate apart (because the gravitational field is stronger below). These tidal accelerations, proportional to the second derivative of the gravitational potential, cannot be removed by any choice of reference frame. In Newtonian terms, the tidal acceleration across a separation vector \(\xi^i\) is \(\Delta a^i = -(\partial^2\Phi/\partial x^i\partial x^j)\xi^j\). In general relativity, tidal accelerations correspond to the curvature of spacetime, encoded in the Riemann tensor: two nearby geodesics that start parallel will converge or diverge depending on the local curvature, and this geodesic deviation is the geometric description of tidal forces. The flat spacetime of special relativity is therefore insufficient to describe gravity; we need the full machinery of curved manifolds developed in the next chapter.

---

# Chapter 6: Curved Spacetime

The equivalence principle tells us that gravity must be described by a curved spacetime, but it does not provide the mathematical tools to compute in such a space. This chapter builds those tools systematically: manifolds provide the arena, the metric determines distances, Christoffel symbols encode the connection between nearby tangent spaces, parallel transport reveals holonomy, and the Riemann tensor quantifies curvature.

## Manifolds and the Metric Tensor

A smooth \(n\)-dimensional manifold is a topological space that locally resembles \(\mathbb{R}^n\), covered by coordinate charts \(\{(U_\alpha, \phi_\alpha)\}\) such that the transition maps \(\phi_\beta \circ \phi_\alpha^{-1}\) on overlapping regions are smooth. Curved spacetime is a four-dimensional pseudo-Riemannian manifold equipped with a metric tensor \(g_{\mu\nu}(x)\), a symmetric rank-(0,2) tensor field that generalises the Minkowski metric \(\eta_{\mu\nu}\) of flat spacetime. The metric determines the line element \(ds^2 = g_{\mu\nu}dx^\mu dx^\nu\), giving proper time along timelike curves and proper distance along spacelike curves. The metric is the fundamental dynamical variable of general relativity, playing the role that the Newtonian potential \(\Phi\) plays in Newtonian gravity, but with the crucial difference that the metric has 10 independent components rather than just one. At any point, one can always choose coordinates (Riemann normal coordinates) such that \(g_{\mu\nu} = \eta_{\mu\nu}\) and \(\partial_\lambda g_{\mu\nu} = 0\), corresponding to the locally inertial frame of the equivalence principle.

## Geodesic Equation from the Variational Principle

In flat spacetime, free particles move in straight lines, which are the curves of extremal proper time. In curved spacetime, the generalisation is that free particles follow geodesics: curves that extremise the action \(S = \int ds\). It is more convenient to extremise the equivalent Lagrangian \(\mathcal{L} = g_{\mu\nu}\dot{x}^\mu\dot{x}^\nu\) (where a dot denotes \(d/d\lambda\) for affine parameter \(\lambda\)), since this avoids a square root. The Euler–Lagrange equation for coordinate \(x^\alpha\) is:

\[
\frac{d}{d\lambda}\!\left(g_{\alpha\nu}\dot{x}^\nu\right) - \frac{1}{2}\partial_\alpha g_{\mu\nu}\dot{x}^\mu\dot{x}^\nu = 0
\]

Expanding the derivative: \(g_{\alpha\nu}\ddot{x}^\nu + \partial_\mu g_{\alpha\nu}\dot{x}^\mu\dot{x}^\nu - \frac{1}{2}\partial_\alpha g_{\mu\nu}\dot{x}^\mu\dot{x}^\nu = 0\). Symmetrising the second term (since it is contracted with the symmetric product \(\dot{x}^\mu\dot{x}^\nu\)) and multiplying by the inverse metric \(g^{\beta\alpha}\), one obtains the geodesic equation:

\[
\ddot{x}^\beta + \Gamma^\beta_{\ \mu\nu}\dot{x}^\mu\dot{x}^\nu = 0
\]

where the Christoffel symbols are:

\[
\Gamma^\lambda_{\ \mu\nu} = \frac{1}{2}g^{\lambda\sigma}\!\left(\partial_\mu g_{\nu\sigma} + \partial_\nu g_{\mu\sigma} - \partial_\sigma g_{\mu\nu}\right)
\]

The Christoffel symbols are symmetric in their lower indices (\(\Gamma^\lambda_{\ \mu\nu} = \Gamma^\lambda_{\ \nu\mu}\)) but are not tensor components — they can be made to vanish at any single point by choosing Riemann normal coordinates there.

## Christoffel Symbols on the 2-Sphere

As a concrete illustration, consider the round 2-sphere of radius \(R\) with metric \(ds^2 = R^2\,d\theta^2 + R^2\sin^2\!\theta\,d\phi^2\), so \(g_{\theta\theta} = R^2\), \(g_{\phi\phi} = R^2\sin^2\theta\), and all off-diagonal components vanish. The non-vanishing Christoffel symbols are computed directly from the metric derivatives: since only \(g_{\phi\phi}\) depends on \(\theta\) (via \(\partial_\theta g_{\phi\phi} = 2R^2\sin\theta\cos\theta\)), the non-zero symbols are:

\[
\Gamma^\theta_{\ \phi\phi} = -\sin\theta\cos\theta, \qquad \Gamma^\phi_{\ \theta\phi} = \Gamma^\phi_{\ \phi\theta} = \cot\theta
\]

The geodesic equations with these symbols give great circles as solutions, which is the correct result from elementary spherical geometry.

## Parallel Transport and Holonomy

A vector \(V^\mu\) is parallel-transported along a curve \(x^\mu(\lambda)\) if its covariant derivative along the curve vanishes:

\[
\frac{DV^\mu}{d\lambda} = \frac{dV^\mu}{d\lambda} + \Gamma^\mu_{\ \nu\sigma}\frac{dx^\sigma}{d\lambda}V^\nu = 0
\]

On flat space, parallel transport preserves both the length and the direction of a vector (relative to a fixed Cartesian frame). On a curved manifold, parallel transport around a closed loop generically returns the vector rotated by an angle relative to its initial direction — this angle is the holonomy of the loop, and it is proportional to the curvature enclosed by the loop. On the two-sphere, parallel-transporting a vector around a small loop at latitude \(\theta_0\) enclosing solid angle \(\Omega\) rotates the vector by angle \(\Omega\). This geometric fact underlies the Foucault pendulum (whose precession measures the component of the Earth's rotation through the enclosed solid angle) and has a quantum mechanical analogue in the Berry phase.

## The Riemann Curvature Tensor

The Riemann curvature tensor encodes how spacetime is curved by measuring the failure of covariant derivatives to commute. For any vector field \(V^\mu\), the commutator of covariant derivatives gives:

\[
\left[\nabla_\mu, \nabla_\nu\right]V^\rho = R^\rho_{\ \sigma\mu\nu}V^\sigma
\]

where the Riemann tensor is explicitly:

\[
R^\rho_{\ \sigma\mu\nu} = \partial_\mu\Gamma^\rho_{\ \nu\sigma} - \partial_\nu\Gamma^\rho_{\ \mu\sigma} + \Gamma^\rho_{\ \mu\lambda}\Gamma^\lambda_{\ \nu\sigma} - \Gamma^\rho_{\ \nu\lambda}\Gamma^\lambda_{\ \mu\sigma}
\]

The Riemann tensor vanishes everywhere if and only if the spacetime is flat (equivalent to Minkowski spacetime in some coordinate system). In four dimensions it has 20 independent components, reduced from the naive \(4^4 = 256\) by the symmetries \(R_{\rho\sigma\mu\nu} = -R_{\sigma\rho\mu\nu} = -R_{\rho\sigma\nu\mu} = R_{\mu\nu\rho\sigma}\) and the algebraic Bianchi identity \(R_{\rho[\sigma\mu\nu]} = 0\). The Ricci tensor \(R_{\mu\nu} = R^\lambda_{\ \mu\lambda\nu}\) is obtained by contraction and has 10 independent components; the Ricci scalar \(R = g^{\mu\nu}R_{\mu\nu}\) is a single function. These quantities appear directly in the Einstein field equations that govern how matter determines spacetime curvature. The remaining 10 independent components of the Riemann tensor that are not captured by the Ricci tensor are packaged into the Weyl tensor \(C_{\rho\sigma\mu\nu}\), which encodes curvature in the absence of matter — tidal deformation, gravitational radiation, and the gravitational field of a vacuum Schwarzschild solution are all carried by the Weyl tensor. In vacuum \(R_{\mu\nu} = 0\) and the Riemann tensor equals the Weyl tensor, but the spacetime can still be curved through the non-local effects of distant matter, which is precisely the physical content of Birkhoff's theorem discussed in the next chapter.

---

# Chapter 7: Einstein's Field Equations

The challenge Einstein faced between 1907 and 1915 was to find a relativistic field equation for gravity that reduces to Poisson's equation in the Newtonian limit, is generally covariant (holds in all coordinate systems), and implies energy-momentum conservation automatically. Each of these requirements significantly constrains the form of the equation, and the resolution is one of the most beautiful structures in theoretical physics.

## The Newtonian Limit and Fixing the Constant

In the weak-field slow-motion limit, write the metric as \(g_{00} \approx -(1 + 2\Phi/c^2)\) where \(\Phi\) is the Newtonian potential, with \(g_{ij} \approx \delta_{ij}\). The geodesic equation in this limit gives particle acceleration \(\ddot{\mathbf{x}} \approx -\nabla\Phi\), recovering Newton's second law in a gravitational field. To match the Newtonian field equation \(\nabla^2\Phi = 4\pi G\rho\), we compute the Ricci tensor component \(R_{00}\) in the weak-field limit and find \(R_{00} \approx \nabla^2\Phi/c^2\). The energy density is \(T_{00} \approx \rho c^2\), so matching the two sides of a proposed field equation \(R_{00} = \kappa T_{00}\) gives \(\kappa \nabla^2\Phi/c^2 = \kappa \rho c^2\), and comparing with \(\nabla^2\Phi = 4\pi G\rho\) fixes \(\kappa = 4\pi G/c^4\). However, the naive equation \(R_{\mu\nu} = \kappa T_{\mu\nu}\) is inconsistent: since \(\nabla^\mu R_{\mu\nu} \neq 0\) in general, but \(\nabla^\mu T_{\mu\nu} = 0\) from physics, this equation would overconstrain the system. The correct combination that is automatically divergence-free is the Einstein tensor.

## The Einstein Tensor and Bianchi Identity

The Einstein tensor is defined as:

\[
G_{\mu\nu} = R_{\mu\nu} - \frac{1}{2}g_{\mu\nu}R
\]

The contracted Bianchi identity states that \(\nabla^\mu G_{\mu\nu} = 0\) identically, for any metric, independent of any field equation. This follows from contracting the differential Bianchi identity \(\nabla_{[\lambda}R_{\rho\sigma]\mu\nu} = 0\) twice with the metric. The physical consequence is deep: if the field equations are \(G_{\mu\nu} = \kappa T_{\mu\nu}\), then \(\nabla^\mu T_{\mu\nu} = 0\) is not an additional assumption but an automatic consequence. Stress-energy conservation follows from the geometry of spacetime.

## Einstein's Field Equations

The full field equations are:

\[
G_{\mu\nu} = \frac{8\pi G}{c^4}T_{\mu\nu}
\]

The correct overall coefficient \(8\pi G/c^4\) (rather than \(4\pi G/c^4\) from the naive Newtonian comparison) comes from the trace of the equations: contracting both sides with \(g^{\mu\nu}\) gives \(-R = (8\pi G/c^4)T\), which when substituted back and then checked against the Newtonian limit (where \(T \approx -\rho c^2\) and \(R_{00}\) dominates) correctly reproduces \(\nabla^2\Phi = 4\pi G\rho\). Einstein later added a cosmological constant term \(\Lambda g_{\mu\nu}\) on the left-hand side, giving \(G_{\mu\nu} + \Lambda g_{\mu\nu} = (8\pi G/c^4)T_{\mu\nu}\). Modern cosmological observations from supernovae, the cosmic microwave background, and large-scale structure indicate \(\Lambda > 0\), corresponding to a vacuum energy density \(\rho_\Lambda = \Lambda c^2/(8\pi G)\), driving the current accelerating expansion of the universe. These 10 nonlinear partial differential equations for the 10 components of \(g_{\mu\nu}\) admit the Schwarzschild vacuum solution, derived in the next chapter, as their simplest non-trivial solution.

## Counting Equations and Birkhoff's Theorem

The field equations are 10 in number, one for each independent component of the symmetric tensor \(G_{\mu\nu}\). The Bianchi identity \(\nabla^\mu G_{\mu\nu} = 0\) provides 4 constraints, reducing the number of independent equations from 10 to 6. This matches the 6 physically independent degrees of freedom in the metric (the 10 components minus 4 coordinate freedom from diffeomorphism invariance). In the linearised limit, writing \(g_{\mu\nu} = \eta_{\mu\nu} + h_{\mu\nu}\), the field equations reduce to a wave equation for \(h_{\mu\nu}\), predicting gravitational radiation at the speed of light — the subject of Chapter 10. Birkhoff's theorem states that the only spherically symmetric vacuum solution (\(T_{\mu\nu} = 0\)) to the Einstein equations is the Schwarzschild metric, and that this solution is necessarily static. This means that a spherically symmetric pulsating star does not radiate gravitational waves, which is the gravitational analogue of the electromagnetic result that a spherically symmetric charge distribution has no dipole radiation.

---

# Chapter 8: Schwarzschild Spacetime

The Schwarzschild solution, derived in 1915 by Karl Schwarzschild while serving on the Russian front during World War I, is the unique spherically symmetric static vacuum solution to Einstein's field equations. Despite its origin in a wartime letter to Einstein, it became the cornerstone of observational general relativity, providing the framework for calculating the three classical tests of general relativity: gravitational redshift, perihelion precession, and light deflection.

## The Schwarzschild Metric

In standard Schwarzschild coordinates \((t, r, \theta, \phi)\), the metric is:

\[
ds^2 = -\!\left(1 - \frac{r_s}{r}\right)c^2\,dt^2 + \left(1 - \frac{r_s}{r}\right)^{-1}dr^2 + r^2\,d\Omega^2
\]

where \(r_s = 2GM/c^2\) is the Schwarzschild radius and \(d\Omega^2 = d\theta^2 + \sin^2\theta\,d\phi^2\). The metric component \(g_{tt} = -(1 - r_s/r)\) governs gravitational time dilation: a clock at radius \(r\) runs at rate \(\sqrt{1 - r_s/r}\) relative to a clock at infinity. The component \(g_{rr} = (1 - r_s/r)^{-1}\) governs radial distances: a ruler at radius \(r\) oriented radially is stretched by factor \((1 - r_s/r)^{-1/2}\). The angular part \(r^2 d\Omega^2\) is unmodified, so \(r\) is defined as the areal radius — a sphere at coordinate radius \(r\) has area \(4\pi r^2\). For the Sun, \(r_s \approx 3\) km, far inside the solar radius \(R_\odot \approx 696{,}000\) km, so relativistic corrections to planetary orbits are small but measurable.

## Effective Potential and the ISCO

The geodesic equations for the Schwarzschild metric can be reduced, using the conserved quantities \(E = (1 - r_s/r)c^2\dot{t}\) (energy per unit mass) and \(L = r^2\dot{\phi}\) (angular momentum per unit mass), to the equation \(\dot{r}^2 = E^2/c^2 - V_\text{eff}(r)\) with the effective potential:

\[
V_\text{eff}(r) = \left(1 - \frac{r_s}{r}\right)\!\left(c^2 + \frac{L^2}{r^2}\right)
\]

For \(L \neq 0\), the first two terms of \(V_\text{eff}\) at large \(r\) reproduce the Newtonian gravitational and centrifugal potentials. The third relativistic term \(-r_s L^2/r^3\) is attractive and eventually dominates at small \(r\), causing the potential to decrease without bound inside the photon sphere. Circular orbits exist where \(dV_\text{eff}/dr = 0\). Solving this condition yields a family of circular orbits parameterised by \(L\). Stability requires additionally \(d^2 V_\text{eff}/dr^2 > 0\). Combining these conditions reveals that stable circular orbits exist only for \(r > 6GM/c^2 = 3r_s\): this is the innermost stable circular orbit (ISCO). Between \(r = 3GM/c^2\) (the photon sphere) and \(r = 6GM/c^2\), only unstable circular orbits exist. The ISCO determines the inner edge of accretion disks around black holes and sets the efficiency of gravitational energy release: matter falling from infinity to the ISCO radiates away \(1 - \sqrt{8/9} \approx 5.7\%\) of its rest-mass energy, compared to 0.7% for nuclear fusion.

## Perihelion Precession

For a nearly circular orbit at radius \(r_0\), we perturb \(r = r_0 + \varepsilon(\tau)\) and linearise the effective potential around the circular orbit radius. The radial oscillation frequency \(\Omega_r\) differs from the orbital frequency \(\Omega_\phi\) by the relativistic correction. Working through the perturbation analysis, the angle between successive perihelia is not \(2\pi\) but:

\[
\Delta\phi_\text{orbit} = \frac{2\pi}{\sqrt{1 - 3GM/(c^2 r_0)}} \approx 2\pi\!\left(1 + \frac{3GM}{c^2 r_0}\right)
\]

The excess angle per orbit is \(\delta\phi = 6\pi GM/(c^2 r_0)\), which for an ellipse with semi-major axis \(a\) and eccentricity \(e\) generalises to:

\[
\delta\phi = \frac{6\pi GM}{ac^2(1 - e^2)}
\]

For Mercury, \(a = 5.791 \times 10^{10}\) m, \(e = 0.2056\), and Mercury completes about 415 orbits per century, giving \(\delta\phi_\text{century} = 415 \times 6\pi GM_\odot/(ac^2(1 - e^2)) \approx 43\) arcseconds per century. This precisely accounts for the anomalous precession that had resisted explanation for over 50 years, and its agreement with Einstein's prediction was one of the first confirmations of general relativity.

## Bending of Light

For null geodesics (\(ds^2 = 0\)), the effective potential contains no rest-mass term. A photon passing the Sun with impact parameter \(b\) is deflected by:

\[
\Delta\phi = \frac{4GM}{c^2 b}
\]

This result is twice what would be obtained from a Newtonian calculation treating the photon as a massive particle moving at \(c\). The factor of 2 arises because both spatial curvature (the \(g_{rr}\) term) and temporal curvature (\(g_{tt}\)) contribute equally to the deflection of light, whereas the Newtonian calculation only captures one contribution. For a ray grazing the solar surface, \(b \approx R_\odot = 6.96 \times 10^8\) m, giving \(\Delta\phi = 4 \times 6.67\times10^{-11} \times 1.989\times10^{30}/(c^2 \times 6.96\times10^8) \approx 1.75\) arcseconds. Eddington's 1919 eclipse expedition measured stellar positions near the Sun during totality and obtained a deflection consistent with this value (approximately 1.7–2.0 arcseconds). Modern VLBI radio astrometry confirms the prediction to better than 0.02%, providing one of the most precise tests of general relativity.

## The Event Horizon

The Schwarzschild metric appears to become singular at \(r = r_s = 2GM/c^2\). However, this is a coordinate singularity — the spacetime is regular there, and the apparent divergence of \(g_{rr}\) can be removed by choosing different coordinates. In Kruskal–Szekeres coordinates, the full spacetime is smooth except at \(r = 0\). For an infalling observer carrying a proper-time clock, the proper time to fall from any radius through the horizon is finite and unremarkable — the observer crosses the horizon without noticing anything locally special. For a distant observer, however, light signals from the infalling observer are increasingly gravitationally redshifted and time-dilated, and the infalling observer appears to slow and freeze asymptotically at \(r = r_s\), never crossing in the distant observer's coordinate time. The event horizon is a global structure — a surface of no return defined by the condition that no future-directed causal curve can escape to infinity — and its existence depends on the full extension of the Schwarzschild spacetime, not just on local properties of the metric.

---

# Chapter 9: Rotating Spacetimes

All astrophysical black holes carry angular momentum inherited from the stars that collapsed to form them. The relevant spacetime geometry is not Schwarzschild but Kerr, discovered by Roy Kerr in 1963 after a search for a rotating vacuum solution that had defeated earlier attempts. The Kerr solution is considerably richer than Schwarzschild: it introduces frame dragging, the ergosphere, and mechanisms for extracting rotational energy.

## The Kerr Metric in Boyer–Lindquist Coordinates

In Boyer–Lindquist coordinates \((t, r, \theta, \phi)\), the Kerr metric is:

\[
ds^2 = -\!\left(1 - \frac{2Mr}{\Sigma}\right)c^2\!dt^2 - \frac{4Mar\sin^2\!\theta}{\Sigma}\,c\,dt\,d\phi + \frac{\Sigma}{\Delta}\,dr^2 + \Sigma\,d\theta^2 + \!\left(r^2 + a^2 + \frac{2Ma^2r\sin^2\!\theta}{\Sigma}\right)\!\sin^2\!\theta\,d\phi^2
\]

where \(\Sigma = r^2 + a^2\cos^2\!\theta\), \(\Delta = r^2 - 2Mr + a^2\), and we use units with \(G = c = 1\). The parameter \(M\) is the mass and \(a = J/(Mc)\) is the specific angular momentum, bounded by \(0 \leq a \leq M\) for a physical black hole. Setting \(a = 0\) gives \(\Sigma = r^2\), \(\Delta = r^2 - 2Mr\), and the metric immediately reduces to Schwarzschild. The off-diagonal \(dt\,d\phi\) term proportional to \(a\) is the signature of rotation and the source of all the novel phenomena in Kerr geometry.

## Frame Dragging and ZAMOs

The off-diagonal component \(g_{t\phi} \propto -a\) couples the azimuthal and temporal coordinates, meaning that an observer who starts with zero angular momentum will nonetheless be dragged in the \(\phi\) direction by the rotating spacetime — this is frame dragging, or the Lense–Thirring effect. A zero-angular-momentum observer (ZAMO) is defined operationally as one whose angular momentum \(p_\phi = 0\). Despite having zero angular momentum, such an observer rotates with angular velocity:

\[
\Omega_\text{ZAMO} = \frac{d\phi}{dt} = -\frac{g_{t\phi}}{g_{\phi\phi}} = \frac{2Mar}{\left(r^2 + a^2\right)\Sigma + 2Ma^2r\sin^2\!\theta}
\]

At large \(r\), this goes to zero as \(\Omega_\text{ZAMO} \sim 2Ma/r^3\), recovering the weak-field Lense–Thirring precession frequency. Frame dragging has been measured in the solar system by the Gravity Probe B satellite experiment (2004–2011), which tracked the geodetic and frame-dragging precession of four gyroscopes in polar orbit around Earth, confirming the Lense–Thirring prediction to approximately 19% precision.

## The Ergosphere and Static Limit

The Kerr horizon is located where \(\Delta = 0\): the outer horizon is at \(r_+ = M + \sqrt{M^2 - a^2}\). A separate special surface, called the stationary limit or ergosurface, occurs where \(g_{tt} = 0\):

\[
r_\text{ergo}(\theta) = M + \sqrt{M^2 - a^2\cos^2\!\theta}
\]

Since \(r_\text{ergo} \geq r_+\) (with equality only at the poles), the ergosurface lies outside the event horizon. The region between the two surfaces is the ergosphere. Inside the ergosphere, \(g_{tt} > 0\): the Killing vector \(\partial_t\) is spacelike, so its associated conserved quantity (energy as measured from infinity) can be negative for particles moving in the retrograde direction. No observer can remain stationary (\(d\phi = 0\) along the worldline) inside the ergosphere without moving faster than light; all observers must co-rotate with the black hole. However, unlike the event horizon, the ergosphere is not a surface of no return — an observer can enter and exit it freely.

## The Penrose Process

Roger Penrose realised in 1969 that the ergosphere provides a mechanism for extracting rotational energy from a Kerr black hole. A particle falls from infinity with positive energy \(E_0 > 0\) into the ergosphere. Inside the ergosphere, the particle splits into two fragments. Fragment 1 is given a retrograde (negative angular momentum) trajectory, which inside the ergosphere allows it to have negative energy as measured from infinity: \(E_1 < 0\). This fragment falls through the event horizon into the black hole, reducing the hole's mass and angular momentum. Fragment 2 escapes to infinity with energy \(E_2 = E_0 - E_1 > E_0\): more energy emerges than went in. The excess comes from the rotational energy of the black hole, and the black hole spins down in the process. The area theorem (Hawking, 1971) states that the event horizon area never decreases in any classical process, which places an upper bound on the extractable energy. For a maximally rotating Kerr black hole (\(a = M\)), the maximum fraction of the rest mass that can be extracted is \(1 - 1/\sqrt{2} \approx 29.3\%\).

## The No-Hair Theorem

The no-hair theorem (developed by Israel, Carter, Hawking, and others during 1967–1972) establishes that the most general stationary, asymptotically flat black hole solution to the Einstein–Maxwell equations is the Kerr–Newman family, characterised entirely by three parameters: mass \(M\), angular momentum \(J\), and electric charge \(Q\). All other multipole moments of the external gravitational field are determined by these three numbers. All information about the infalling matter — its baryonic composition, spin state, quantum numbers — is either radiated away during collapse or hidden behind the event horizon. Astrophysical black holes are expected to have \(Q \approx 0\) (since any charge would rapidly neutralise by accreting opposite charges from the interstellar medium), leaving them described by Kerr geometry with just two parameters \(M\) and \(a\). Gravitational wave observations of merging black holes provide tests of the no-hair theorem in the strong-field regime by checking whether the ringdown signal after merger matches the quasi-normal modes predicted for a Kerr black hole with the inferred mass and spin. The quasi-normal mode frequencies and damping times are uniquely determined by \(M\) and \(a\) for a Kerr black hole, so detecting multiple overtones in the ringdown waveform and verifying their consistency with a single Kerr solution is a direct probe of whether the remnant is indeed described by the no-hair theorem. Current LIGO–Virgo data are consistent with Kerr to within observational uncertainties, and next-generation detectors such as LISA and Einstein Telescope will perform precision spectroscopy of merging massive black holes with signal-to-noise ratios hundreds of times larger, enabling far more stringent tests.

---

# Chapter 10: Gravitational Waves

The prediction of gravitational waves — ripples in spacetime curvature that propagate at the speed of light — follows from linearising Einstein's field equations around flat spacetime. Einstein derived this prediction in 1916, one year after publishing the field equations, but the physical reality of gravitational waves remained contested for decades because of subtleties related to gauge freedom and the question of whether the waves carry genuine physical energy. The issue was resolved in the 1950s by Pirani's use of the geodesic deviation equation, and definitively settled by the first direct detection in 2015 by the LIGO interferometers.

## Linearised Gravity

Write the metric as a small perturbation of flat spacetime:

\[
g_{\mu\nu} = \eta_{\mu\nu} + h_{\mu\nu}, \qquad |h_{\mu\nu}| \ll 1
\]

and work throughout to first order in \(h\). The linearised Riemann tensor is:

\[
R_{\mu\nu\rho\sigma} = \frac{1}{2}\!\left(\partial_\nu\partial_\rho h_{\mu\sigma} + \partial_\mu\partial_\sigma h_{\nu\rho} - \partial_\mu\partial_\rho h_{\nu\sigma} - \partial_\nu\partial_\sigma h_{\mu\rho}\right)
\]

and contracting gives the linearised Ricci tensor. To simplify the field equations, define the trace-reversed perturbation \(\bar{h}_{\mu\nu} = h_{\mu\nu} - \frac{1}{2}\eta_{\mu\nu}h\), where \(h = \eta^{\mu\nu}h_{\mu\nu}\) is the trace. In the Lorenz gauge, defined by the condition:

\[
\partial^\mu\bar{h}_{\mu\nu} = 0
\]

the linearised Einstein field equations reduce to the wave equation:

\[
\Box\,\bar{h}_{\mu\nu} = -\frac{16\pi G}{c^4}T_{\mu\nu}
\]

where \(\Box = \eta^{\mu\nu}\partial_\mu\partial_\nu = -(1/c^2)\partial^2/\partial t^2 + \nabla^2\) is the d'Alembertian. This has precisely the same form as the wave equation for the electromagnetic four-potential \(A_\mu\) in Lorenz gauge, with \(\bar{h}_{\mu\nu}\) playing the role of \(A_\mu\) and the stress-energy tensor providing the source. Gravitational waves propagate at the speed of light, and the retarded solution gives the field produced by a time-varying source.

## Plane Waves and TT Gauge

In vacuum (\(T_{\mu\nu} = 0\)), the solutions are plane waves \(\bar{h}_{\mu\nu} = A_{\mu\nu}e^{ik_\sigma x^\sigma}\) with null wavevector \(k^\mu k_\mu = 0\), satisfying \(k^\mu A_{\mu\nu} = 0\) from the Lorenz gauge condition. This leaves 6 of 10 amplitude components free. The remaining gauge freedom within the Lorenz gauge allows further specialisation to the transverse-traceless (TT) gauge by imposing \(h_{0\mu}^\text{TT} = 0\) and \(\eta^{ij}h_{ij}^\text{TT} = 0\). These additional conditions eliminate 8 of the 10 components, leaving only 2 independent physical degrees of freedom, the two polarisations \(h_+\) and \(h_\times\). For a wave propagating along the \(z\)-axis, the TT perturbation is:

\[
h_{\mu\nu}^\text{TT} = \begin{pmatrix} 0 & 0 & 0 & 0 \\ 0 & h_+ & h_\times & 0 \\ 0 & h_\times & -h_+ & 0 \\ 0 & 0 & 0 & 0 \end{pmatrix} \cos(\omega t - kz)
\]

The \(h_+\) polarisation stretches spacetime in the \(x\)-direction while compressing in \(y\) (and vice versa half a period later), forming the "plus" pattern. The \(h_\times\) polarisation does the same rotated 45 degrees, forming the "cross" pattern. These two polarisations are analogous to the two linear polarisations of an electromagnetic wave, with the important difference that gravitational wave polarisation is spin-2 (the pattern repeats after 180 degrees of rotation) rather than spin-1.

## Geodesic Deviation

The physical effect of gravitational waves is described by the geodesic deviation equation, which gives the relative acceleration of two nearby freely falling observers separated by the vector \(\xi^\mu\):

\[
\frac{D^2\xi^\mu}{d\tau^2} = -R^\mu_{\ \nu\rho\sigma}u^\nu\xi^\rho u^\sigma
\]

For test particles initially at rest, the dominant contribution comes from the spatial components of the Riemann tensor in TT gauge, which are proportional to \(\ddot{h}_{ij}^\text{TT}\). The equation tells us that a passing gravitational wave does not move the particles in any absolute sense — there is no absolute displacement in general relativity — but it does change the proper distance between them. A ring of test particles initially arranged in a circle of radius \(\ell\) in the \(xy\)-plane will be deformed into an ellipse: the \(h_+\) polarisation causes the ring to oscillate between a horizontal ellipse (elongated along \(x\)) and a vertical ellipse (elongated along \(y\)), with amplitude \(\Delta\ell = h_+\ell/2\). The \(h_\times\) polarisation produces similar oscillations rotated by 45 degrees. LIGO measures precisely this oscillatory change in the proper distance between its test masses using laser interferometry.

## Quadrupole Radiation

Just as accelerating charges emit electromagnetic radiation dominated by the time-varying electric dipole moment, accelerating mass-energy distributions emit gravitational radiation dominated by the time-varying mass quadrupole moment. Monopole radiation is forbidden by conservation of energy (the total mass-energy is conserved), and dipole radiation is forbidden by conservation of momentum (the centre of mass moves at constant velocity). The leading contribution to gravitational wave emission is therefore quadrupolar. The mass quadrupole moment tensor is:

\[
I_{ij} = \int T^{00}(x) x_i x_j\,d^3x
\]

and the gravitational wave amplitude at large distance \(r\) is \(h_{ij}^\text{TT} \sim (2G/rc^4)\ddot{I}_{ij}^\text{TT}\). The total radiated power is given by the quadrupole formula:

\[
P = \frac{G}{5c^5}\left\langle \dddot{I}_{ij}\dddot{I}^{ij}\right\rangle
\]

The prefactor \(G/c^5 \approx 2.5 \times 10^{-54}\) W s\(^3\)/kg\(^2\) is extraordinarily small, which is why detectable gravitational wave generation requires masses of stellar scale moving at relativistic velocities. For a binary system with component masses \(m_1\) and \(m_2\), orbital separation \(a\), and orbital frequency \(\Omega\), the radiated power drives the orbit to inspiral: \(da/dt < 0\). The Hulse–Taylor binary pulsar PSR B1913+16, discovered in 1974, showed exactly this orbital decay at the rate predicted by the quadrupole formula to 0.2% precision over four decades of observation, providing compelling indirect evidence for gravitational waves and earning Hulse and Taylor the 1993 Nobel Prize.

## GW150914: The First Direct Detection

<div class="example">
<strong>GW150914 Signal Parameters.</strong> On September 14, 2015, the two LIGO detectors simultaneously registered a 0.2-second transient gravitational wave signal. Bayesian parameter estimation identified the source as a binary black hole merger with component masses \(m_1 \approx 36M_\odot\) and \(m_2 \approx 29M_\odot\) at luminosity distance \(d_L \approx 410\) Mpc.

The peak strain was \(h \approx 10^{-21}\). With LIGO arm length \(L = 4\) km, the differential change in arm length is:

\[
\Delta L = \frac{1}{2}h L = \frac{1}{2} \times 10^{-21} \times 4000\;\text{m} = 2 \times 10^{-18}\;\text{m}
\]

This is approximately one-thousandth the diameter of a proton, measured over 4 km — a testament to the precision of LIGO's power-recycled Fabry–Perot Michelson interferometers. The signal frequency swept from 35 Hz to 150 Hz during inspiral; the chirp mass is extracted from the frequency evolution:

\[
\mathcal{M} = \frac{(m_1 m_2)^{3/5}}{(m_1 + m_2)^{1/5}} \approx 28.3M_\odot
\]

The total radiated gravitational wave energy was approximately \(3M_\odot c^2 \approx 5.4 \times 10^{47}\) J, released in a fraction of a second — briefly exceeding the electromagnetic luminosity of all stars in the observable universe by a factor of roughly ten.
</div>

The detection of GW150914 confirmed the existence of gravitational waves one century after Einstein's prediction, demonstrated that binary black hole systems with masses of order \(30M_\odot\) exist and merge within a Hubble time, and opened gravitational wave astronomy as a new observational discipline. Subsequent detections by the LIGO–Virgo–KAGRA network have catalogued dozens of compact binary mergers, including the neutron star merger GW170817 whose coincident gamma-ray burst, optical kilonova, and X-ray afterglow established multi-messenger gravitational wave astronomy. The theoretical tools developed across this course — from Lorentz transformations through tensor calculus, the geodesic equation, Schwarzschild and Kerr geometries, and linearised gravity — form the complete mathematical foundation for understanding, predicting, and interpreting the signals that these detectors continue to collect.
