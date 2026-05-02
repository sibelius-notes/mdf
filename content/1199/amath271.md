---
title: "AMATH 271: Introduction to Theoretical Mechanics"
subjects: "AMATH"
prof: "Michael L. Waite"
---

*Based on lecture notes by Sibelius Peng — [PDF source](https://pdf.sibeliusp.com/1199/am271_view.pdf)*

## Sources and References

**Primary textbook** — Taylor, J. R. *Classical Mechanics*. University Science Books, 2005.
**Supplementary texts** — Goldstein, H., Poole, C., & Safko, J. *Classical Mechanics*, 3rd ed. Addison-Wesley, 2002. Morin, D. *Introduction to Classical Mechanics*. Cambridge University Press, 2008. Kibble, T. W. B. & Berkshire, F. H. *Classical Mechanics*, 5th ed. Imperial College Press, 2004.
**Online resources** — MIT OCW 8.012 *Physics I: Classical Mechanics* (Kleppner & Kolenkow approach); MIT OCW 8.09 *Classical Mechanics III* (Hamiltonian formalism); Tong, D. *Lectures on Classical Dynamics*, University of Cambridge (damtp.cam.ac.uk/user/tong/dynamics.html); MIT OCW 8.033 *Relativity* lecture notes.

---

# Chapter 1: Newton's Laws and the Language of Mechanics

## Inertial Frames and Reference Frames

Classical mechanics begins not with equations but with a careful statement of what kind of world we are describing. The foundational object is the **reference frame** — a coordinate system equipped with a clock, allowing any event to be assigned a location and a time. Among all conceivable reference frames, a special class stands out: the **inertial frames**, which are reference frames in which a particle subject to no forces moves with constant velocity (or remains at rest).

The content of Newton's first law is precisely this identification: inertial frames exist. It is a non-trivial statement about the universe, one that could in principle have been false. In practice, the surface of the Earth is very nearly an inertial frame for many experiments, though not for all — a pendulum at a rotating Earth is, strictly speaking, in a non-inertial frame, and the Coriolis effect is one manifestation of the correction. Any frame that moves with constant velocity relative to an inertial frame is itself inertial; this equivalence of inertial frames is the principle of Galilean relativity.

## Newton's Three Laws

Newton's **second law** is the engine of classical mechanics. In a single line:

\[
\mathbf{F} = m\ddot{\mathbf{r}}
\]

where \(\mathbf{F}\) is the net force, \(m\) is the mass, and \(\ddot{\mathbf{r}}\) is the acceleration. The dot notation, due to Newton himself, denotes differentiation with respect to time: \(\dot{\mathbf{r}} = d\mathbf{r}/dt\) is the velocity, \(\ddot{\mathbf{r}} = d^2\mathbf{r}/dt^2\) is the acceleration.

Newton's **third law** — equal and opposite reaction — states that if object 1 exerts a force \(\mathbf{F}_{12}\) on object 2, then object 2 simultaneously exerts a force \(\mathbf{F}_{21} = -\mathbf{F}_{12}\) on object 1. This law is what makes conservation of momentum possible in a closed system, and its apparent simplicity conceals deep structure: the action-reaction symmetry is a consequence of translation invariance of space, a theme that resurfaces in much more general form in Noether's theorem (Chapter 4).

The **gravitational force** on an object near the Earth's surface takes the familiar form \(\mathbf{F} = m\mathbf{g}\), where \(g \approx 9.8\) m/s² points downward. More generally, Newton's law of gravitation gives the mutual attraction between masses \(m_1\) and \(m_2\) separated by distance \(r\) as \(F = Gm_1m_2/r^2\), a formula whose implications for planetary orbits we will explore thoroughly in Chapter 5.

## Solving Newton's Second Law

The second law is a second-order ordinary differential equation: given \(\mathbf{F}\), find \(\mathbf{r}(t)\). The solution requires two initial conditions — typically the initial position \(\mathbf{r}(0)\) and velocity \(\dot{\mathbf{r}}(0)\). The existence and uniqueness theorem for ODEs guarantees that, given a sufficiently smooth force, there is exactly one trajectory through each initial condition. This is the determinism of classical mechanics: the present state completely determines the future.

For one-dimensional motion under a constant force, the equations integrate immediately to the familiar kinematic equations:

\[
x(t) = x_0 + v_0 t + \frac{1}{2}\frac{F}{m}t^2, \qquad v(t) = v_0 + \frac{F}{m}t.
\]

For forces that depend on velocity, such as air resistance, the equation becomes more subtle. A linear drag force \(\mathbf{F}_{\rm drag} = -b\mathbf{v}\) yields a first-order linear ODE in velocity, solvable by separation of variables. A quadratic drag force \(F_{\rm drag} = -cv^2\) (relevant at higher speeds) requires a different approach. These are not merely textbook exercises — terminal velocity, the trajectory of a baseball, and the design of parachutes all depend on which drag regime dominates.

## Polar Coordinates

Many important problems — planet orbits, pendula, circular motion — have natural symmetries that make Cartesian coordinates awkward. **Polar coordinates** \((r, \phi)\) in two dimensions are defined by \(x = r\cos\phi\), \(y = r\sin\phi\). The position, velocity, and acceleration in polar coordinates require some care because the unit vectors \(\hat{\mathbf{r}}\) and \(\hat{\boldsymbol{\phi}}\) are not fixed — they rotate with the particle.

The velocity in polar coordinates is:

\[
\mathbf{v} = \dot{r}\,\hat{\mathbf{r}} + r\dot{\phi}\,\hat{\boldsymbol{\phi}}.
\]

The first term is the radial velocity (rate of change of distance from the origin) and the second is the tangential velocity (rate of change of angular position). The acceleration involves an extra subtlety because the unit vectors themselves change in time:

\[
\mathbf{a} = (\ddot{r} - r\dot{\phi}^2)\,\hat{\mathbf{r}} + (r\ddot{\phi} + 2\dot{r}\dot{\phi})\,\hat{\boldsymbol{\phi}}.
\]

The term \(-r\dot{\phi}^2\hat{\mathbf{r}}\) is the centripetal acceleration, pointing inward for circular motion. The term \(2\dot{r}\dot{\phi}\hat{\boldsymbol{\phi}}\) is the **Coriolis acceleration** — it appears even in the absence of rotation of the reference frame, purely because the particle moves along a curved path with changing \(r\). Understanding these terms is indispensable for the two-body problem in Chapter 5.

---

# Chapter 2: Projectile Motion and Charged Particles

## Projectiles with Air Resistance

The classic projectile — a cannonball, a javelin, a tennis ball — moves through air, and air resistance matters. The general equations of motion in two dimensions with linear drag \(\mathbf{F}_{\rm drag} = -b\mathbf{v}\) are:

\[
m\ddot{x} = -b\dot{x}, \qquad m\ddot{y} = -mg - b\dot{y}.
\]

The horizontal and vertical motions decouple, and each is a first-order linear ODE in velocity. Setting \(k = b/m\), the horizontal velocity decays exponentially: \(v_x(t) = v_{x0}e^{-kt}\). The vertical motion includes a constant gravitational acceleration competing against the drag, leading to a terminal velocity \(v_{\rm ter} = mg/b\) as the drag force balances gravity.

With quadratic drag (the more realistic regime for most objects moving faster than a few meters per second), the horizontal and vertical equations are coupled through the speed \(v = \sqrt{v_x^2 + v_y^2}\). There is no closed-form solution; numerical integration is required. This is one of many places where the power of the analytical approach (Lagrangian mechanics, conserved quantities) over brute-force numerical integration becomes apparent — conserved quantities give qualitative information without solving the equations completely.

## Charged Particles in Electromagnetic Fields

A charged particle of charge \(q\) moving with velocity \(\mathbf{v}\) in electric field \(\mathbf{E}\) and magnetic field \(\mathbf{B}\) experiences the **Lorentz force**:

\[
\mathbf{F} = q(\mathbf{E} + \mathbf{v} \times \mathbf{B}).
\]

When the electric field vanishes and the magnetic field is uniform (say \(\mathbf{B} = B\hat{\mathbf{z}}\)), the equations of motion in the \(xy\)-plane reduce to:

\[
m\ddot{x} = qB\dot{y}, \qquad m\ddot{y} = -qB\dot{x}.
\]

These can be solved by introducing the complex combination \(\eta = \dot{x} + i\dot{y}\), which satisfies \(\dot{\eta} = -i\omega\eta\) where \(\omega = qB/m\) is the **cyclotron frequency**. The solution is circular motion at the cyclotron frequency: the particle spirals around the magnetic field lines. This result underpins the design of particle accelerators and the physics of plasmas. The cyclotron radius \(r = mv_\perp/(qB)\) — where \(v_\perp\) is the speed perpendicular to \(\mathbf{B}\) — grows with momentum, which is precisely how a cyclotron separates particles of different momenta.

---

# Chapter 3: Momentum and Angular Momentum

## Linear Momentum and Its Conservation

The **linear momentum** of a particle is \(\mathbf{p} = m\mathbf{v}\). Newton's second law can be written more suggestively as \(\mathbf{F} = \dot{\mathbf{p}}\): force is the rate of change of momentum. For a system of \(N\) particles, the total momentum is \(\mathbf{P} = \sum_i m_i \mathbf{v}_i\). By Newton's third law, the internal forces between particles cancel in pairs, and the equation of motion for total momentum is:

\[
\dot{\mathbf{P}} = \mathbf{F}_{\rm ext}
\]

where \(\mathbf{F}_{\rm ext}\) is the total external force. If the external force is zero, \(\mathbf{P}\) is conserved — this is **conservation of linear momentum**, one of the bedrock principles of mechanics.

The **center of mass** \(\mathbf{R}\) of a system is defined by \(M\mathbf{R} = \sum_i m_i \mathbf{r}_i\), where \(M = \sum_i m_i\) is the total mass. Then \(\dot{\mathbf{P}} = M\ddot{\mathbf{R}}\), so the center of mass moves exactly like a point particle of total mass \(M\) subject to the total external force. No matter how complicated the internal dynamics — explosions, collisions, vibrations — the center of mass obeys this simple equation.

## Angular Momentum

The **angular momentum** of a single particle about the origin is:

\[
\mathbf{L} = \mathbf{r} \times \mathbf{p} = m(\mathbf{r} \times \mathbf{v}).
\]

The rate of change of angular momentum equals the **torque** \(\boldsymbol{\Gamma} = \mathbf{r} \times \mathbf{F}\):

\[
\dot{\mathbf{L}} = \boldsymbol{\Gamma}.
\]

If the force is central — directed along \(\mathbf{r}\), so \(\boldsymbol{\Gamma} = 0\) — then \(\mathbf{L}\) is conserved. This is Kepler's second law in disguise: a planet orbiting the sun, subject only to the radial gravitational force, sweeps out equal areas in equal times precisely because its angular momentum is constant.

For a system of \(N\) particles, the total angular momentum is \(\mathbf{L} = \sum_i \mathbf{r}_i \times \mathbf{p}_i\). The net internal torques cancel when the internal forces are central (act along the line joining the particles), and the equation for the total angular momentum is:

\[
\dot{\mathbf{L}} = \boldsymbol{\Gamma}_{\rm ext}.
\]

This result has immediate astronomical consequences: the angular momentum of the solar system about its center of mass is very nearly constant, since the only significant external force (from distant stars and galaxies) is negligible.

---

# Chapter 4: Energy and Conservative Forces

## Kinetic and Potential Energy

The **kinetic energy** of a particle is \(T = \frac{1}{2}mv^2\). Taking the dot product of Newton's second law with the velocity \(\mathbf{v} = \dot{\mathbf{r}}\):

\[
\mathbf{F} \cdot \mathbf{v} = m\dot{\mathbf{v}} \cdot \mathbf{v} = \frac{d}{dt}\!\left(\frac{1}{2}mv^2\right) = \dot{T}.
\]

The quantity \(\mathbf{F} \cdot \mathbf{v}\) is the **power** delivered by the force. Integrating from time \(t_1\) to \(t_2\):

\[
W_{12} = \int_{t_1}^{t_2} \mathbf{F} \cdot \mathbf{v}\,dt = \int_1^2 \mathbf{F} \cdot d\mathbf{r} = T_2 - T_1.
\]

This is the **work-energy theorem**: the work done by all forces equals the change in kinetic energy.

Not all forces are created equal. A force is **conservative** if the work it does is path-independent — equivalently, if the work done around any closed loop is zero. For such forces, we can define a **potential energy** \(U(\mathbf{r})\) such that:

\[
\mathbf{F} = -\nabla U.
\]

The relationship between conservativeness and the gradient condition is captured by Stokes' theorem: a force is conservative if and only if \(\nabla \times \mathbf{F} = \mathbf{0}\). Gravity (\(\mathbf{F} = -\nabla(-mgy)\)), electrostatics, and spring forces are conservative; friction and drag are not.

## Conservation of Energy

For a system where all forces are conservative, the total **mechanical energy** \(E = T + U\) is constant:

\[
E = \frac{1}{2}mv^2 + U(\mathbf{r}) = \text{const}.
\]

This is one of the most powerful tools in mechanics, because it converts a vector equation (Newton's second law) into a scalar equation. The particle's speed at any point is determined entirely by its position: \(v = \sqrt{2(E-U)/m}\), valid as long as \(E \geq U\).

The energy diagram — a plot of \(U(x)\) versus \(x\) — makes the qualitative behavior of a one-dimensional system immediately transparent. Where \(E > U\), the particle can move (kinetic energy is positive). Where \(E = U\), the particle momentarily stops (a **turning point**). Where \(E < U\), the particle cannot reach. Stable equilibria occur at minima of \(U\); unstable equilibria at maxima. This geometric way of reading dynamics anticipates the much deeper ideas of phase-space portraits and effective potentials.

---

# Chapter 5: Oscillations

Oscillations appear everywhere in physics: a mass on a spring, an atom vibrating in a crystal, a pendulum, an LC circuit, the vibrations of molecules. The unifying framework is that of a particle near a stable equilibrium point.

## Simple Harmonic Motion

Near a minimum \(x_0\) of \(U(x)\), the potential can be approximated as \(U(x) \approx U(x_0) + \frac{1}{2}k(x-x_0)^2\), where \(k = U''(x_0) > 0\). Setting \(x_0 = 0\), Newton's second law becomes:

\[
m\ddot{x} = -kx,
\]

or equivalently \(\ddot{x} = -\omega_0^2 x\) where \(\omega_0 = \sqrt{k/m}\) is the **natural frequency**. The general solution is:

\[
x(t) = A\cos(\omega_0 t) + B\sin(\omega_0 t) = C\cos(\omega_0 t + \delta),
\]

where \(C\) and \(\delta\) are determined by initial conditions. The motion is periodic with period \(\tau = 2\pi/\omega_0\) and the system oscillates indefinitely, exchanging kinetic and potential energy while conserving their sum.

## Damped Oscillations

Real oscillators lose energy to their environment. Including a velocity-proportional damping force \(-b\dot{x}\), Newton's second law becomes:

\[
m\ddot{x} + b\dot{x} + kx = 0.
\]

Defining the damping coefficient \(\beta = b/(2m)\) and natural frequency \(\omega_0^2 = k/m\), the equation is \(\ddot{x} + 2\beta\dot{x} + \omega_0^2 x = 0\). The character of the solution depends on the sign of \(\omega_1^2 = \omega_0^2 - \beta^2\):

- **Underdamped** (\(\beta < \omega_0\)): the system oscillates at the reduced frequency \(\omega_1 = \sqrt{\omega_0^2 - \beta^2}\) while decaying exponentially with time constant \(1/\beta\): \(x(t) = Ce^{-\beta t}\cos(\omega_1 t + \delta)\). This is the case for most physical oscillators — a pendulum, a car's shock absorber (when not over-damped), a ringing bell.

- **Critically damped** (\(\beta = \omega_0\)): the system returns to equilibrium as quickly as possible without oscillating: \(x(t) = (A + Bt)e^{-\beta t}\). Engineers designing door closers and instrument galvanometers often aim for critical damping.

- **Overdamped** (\(\beta > \omega_0\)): the system decays exponentially without oscillating, with two distinct decay rates: \(x(t) = e^{-\beta t}(Ae^{\gamma t} + Be^{-\gamma t})\) where \(\gamma = \sqrt{\beta^2 - \omega_0^2}\).

## Driven Oscillations and Resonance

Now suppose an external sinusoidal force \(F_0\cos(\omega t)\) drives the oscillator. The equation of motion is:

\[
m\ddot{x} + b\dot{x} + kx = F_0\cos(\omega t).
\]

The steady-state solution (the particular solution that persists after transients die away) is:

\[
x_p(t) = A(\omega)\cos(\omega t - \delta(\omega)),
\]

where the amplitude is:

\[
A(\omega) = \frac{F_0/m}{\sqrt{(\omega_0^2 - \omega^2)^2 + 4\beta^2\omega^2}}.
\]

As the driving frequency \(\omega\) approaches the natural frequency \(\omega_0\), the amplitude grows large — this is **resonance**. For light damping, the resonant amplitude can be enormous. The **quality factor** \(Q = \omega_0/(2\beta)\) measures the sharpness of the resonance: a high-\(Q\) oscillator (like a quartz crystal or a laser cavity mode) has a very narrow resonance peak and stores energy for a long time compared to its period. A low-\(Q\) system (like a car suspension) dissipates energy quickly and barely resonates.

Resonance is not just a mathematical curiosity. The collapse of the Tacoma Narrows Bridge in 1940 is often attributed to resonance (though the actual mechanism was more complex — aeroelastic flutter). The tuning of radio receivers exploits resonance to select a single station. NMR (nuclear magnetic resonance), the basis of MRI, works because atomic nuclei in a magnetic field resonate at a sharply defined frequency.

---

# Chapter 6: Calculus of Variations

## The Variational Principle

Lagrangian mechanics rests on a beautiful mathematical framework: the **calculus of variations**. The central question is: given a functional (a function of functions)

\[
S[y] = \int_{x_1}^{x_2} f(y, y', x)\,dx,
\]

for what function \(y(x)\) is \(S[y]\) stationary (a minimum, maximum, or saddle point)?

The answer is the **Euler-Lagrange equation**:

<div class="theorem">
<strong>Theorem (Euler-Lagrange)</strong>: The functional \(S[y] = \int_{x_1}^{x_2} f(y, y', x)\,dx\) with fixed endpoints \(y(x_1) = y_1\), \(y(x_2) = y_2\) is stationary if and only if \(y(x)\) satisfies

\[
\frac{\partial f}{\partial y} - \frac{d}{dx}\frac{\partial f}{\partial y'} = 0.
\]
</div>

The derivation proceeds by considering a one-parameter family of paths \(y(x) + \epsilon\eta(x)\), where \(\eta(x_1) = \eta(x_2) = 0\). Requiring \(dS/d\epsilon\big|_{\epsilon=0} = 0\) and integrating by parts yields the Euler-Lagrange equation.

## Classic Examples

The power of the variational approach is evident from the diversity of problems it handles:

**Shortest path**: The distance between two points is \(S = \int \sqrt{1+y'^2}\,dx\). Here \(f = \sqrt{1+y'^2}\) does not depend on \(y\) explicitly, so \(\partial f/\partial y = 0\). The Euler-Lagrange equation reduces to \(y' = \text{const}\), i.e., the straight line — hardly surprising, but the framework gives it to us for free.

**Brachistochrone**: What curve minimizes the time for a frictionless bead to slide from one point to another under gravity? This is the **brachistochrone problem**, solved independently by Bernoulli, Newton, Leibniz, and l'Hôpital in 1696. The speed of the bead is \(v = \sqrt{2gy}\) (taking \(y = 0\) at the start), and the time is:

\[
T = \int_{x_1}^{x_2} \frac{\sqrt{1+y'^2}}{v}\,dx = \int_{x_1}^{x_2} \frac{\sqrt{1+y'^2}}{\sqrt{2gy}}\,dx.
\]

The Euler-Lagrange equation yields a cycloid — the curve traced by a point on the rim of a rolling circle. The same cycloid is the tautochrone: a bead released from any point on a cycloid reaches the bottom in the same time. Huygens exploited this to design isochronous pendula.

**Geodesics**: Minimizing path length on a surface (great circles on a sphere, geodesics in general relativity) all arise as Euler-Lagrange equations for the appropriate metric.

---

# Chapter 7: Lagrangian Mechanics

## Generalized Coordinates and the Lagrangian

The Euler-Lagrange framework becomes mechanics when we identify the integrand as the **Lagrangian** \(L = T - U\) (kinetic minus potential energy) and the variable of integration as time. The functional to be made stationary is **Hamilton's action**:

\[
S = \int_{t_1}^{t_2} L(q_1, \ldots, q_n, \dot{q}_1, \ldots, \dot{q}_n, t)\,dt.
\]

Here \(q_1, \ldots, q_n\) are **generalized coordinates** — any set of independent coordinates that completely specifies the configuration of the system. They need not be Cartesian. For a pendulum of length \(\ell\), the single generalized coordinate is the angle \(\theta\); for a particle in polar coordinates, \(q_1 = r\) and \(q_2 = \phi\). The beauty is that the form of the Euler-Lagrange equations is the same no matter which coordinates are used:

\[
\frac{d}{dt}\frac{\partial L}{\partial \dot{q}_i} - \frac{\partial L}{\partial q_i} = 0 \qquad (i = 1, \ldots, n).
\]

This is the content of **Hamilton's principle** (also called the principle of stationary action): the actual trajectory is the one that makes \(S\) stationary.

Why is this remarkable? First, it is coordinate-free — the same Lagrangian \(L\) gives the correct equations in any set of generalized coordinates, automatically incorporating constraint forces. Second, it replaces Newton's vector equation (which requires knowing all the forces, including constraints) with a scalar equation derived from just \(T\) and \(U\). For a bead constrained to a wire, a robot arm with multiple joints, or a top spinning on a table, the Lagrangian approach is often dramatically simpler.

## Generalized Momentum and Ignorable Coordinates

The **generalized momentum** conjugate to coordinate \(q_i\) is:

\[
p_i = \frac{\partial L}{\partial \dot{q}_i}.
\]

If the Lagrangian does not depend explicitly on a particular coordinate \(q_j\) (we call such a coordinate **cyclic** or **ignorable**), then the Euler-Lagrange equation for that coordinate is simply:

\[
\frac{d}{dt}\frac{\partial L}{\partial \dot{q}_j} = 0 \quad \Longrightarrow \quad p_j = \frac{\partial L}{\partial \dot{q}_j} = \text{const}.
\]

The corresponding generalized momentum is conserved. This is the Lagrangian form of a conservation law. In polar coordinates, if \(L\) is independent of \(\phi\), then \(p_\phi = mr^2\dot{\phi} = \ell\) is conserved — and this is precisely the angular momentum. The connection between symmetry (independence of a coordinate) and conservation (constancy of the conjugate momentum) is profound and becomes Noether's theorem in its full generality.

## Noether's Theorem

Emmy Noether's 1915 theorem, published in 1918, is among the deepest results in all of theoretical physics. In its classical mechanics formulation:

<div class="theorem">
<strong>Noether's Theorem:</strong> For every continuous symmetry of the action \(S = \int L\,dt\), there is a corresponding conserved quantity.
</div>

The three great symmetries and their associated conserved quantities are:
- **Time translation invariance** (the laws of physics are the same today as yesterday): conservation of **energy**.
- **Spatial translation invariance** (the laws of physics are the same here as there): conservation of **linear momentum**.
- **Rotational invariance** (the laws of physics are the same in all directions): conservation of **angular momentum**.

Noether's theorem explains not merely that these quantities are conserved, but *why* — they are conserved because space and time have these symmetries. When a symmetry is broken (e.g., momentum is not conserved in a system with an external potential), it is precisely because the corresponding translational invariance is absent.

The theorem extends far beyond classical mechanics: in quantum field theory, it predicts the conservation of electric charge (from gauge invariance of the electromagnetic field), baryon number, lepton number, and every other conserved charge in the Standard Model.

---

# Chapter 8: Two-Body Problems and Orbital Mechanics

## Reduction to One Body

The two-body problem — two particles interacting through a central potential — seems to require six coordinates in three dimensions. But it reduces cleanly to a one-body problem. Let \(\mathbf{R}\) be the center-of-mass position and \(\mathbf{r} = \mathbf{r}_1 - \mathbf{r}_2\) the relative position. The Lagrangian separates:

\[
L = \frac{1}{2}M\dot{R}^2 + \underbrace{\frac{1}{2}\mu\dot{r}^2 - U(r)}_{L_{\rm rel}},
\]

where \(M = m_1 + m_2\) is the total mass and:

\[
\mu = \frac{m_1 m_2}{m_1 + m_2}
\]

is the **reduced mass**. The center of mass moves freely (or uniformly), and the relative motion behaves as a single particle of mass \(\mu\) in the potential \(U(r)\). For the Earth-Sun system, \(\mu \approx m_{\rm Earth}\) since \(m_{\rm Earth} \ll m_{\rm Sun}\), which is why the one-body approximation (Earth orbiting a fixed Sun) is excellent.

## The Equations of Motion in Polar Coordinates

In the center-of-mass frame, we use polar coordinates \((r, \phi)\). The Lagrangian for the relative motion is:

\[
L = \frac{1}{2}\mu(\dot{r}^2 + r^2\dot{\phi}^2) - U(r).
\]

The coordinate \(\phi\) is cyclic (does not appear explicitly), so the angular momentum \(\ell = \mu r^2 \dot{\phi}\) is conserved. This is Kepler's second law: since \(\ell = \mu r^2\dot{\phi}\) is constant, the rate of sweeping area \(dA/dt = \frac{1}{2}r^2\dot{\phi} = \ell/(2\mu)\) is constant.

The radial equation of motion is:

\[
\mu\ddot{r} = -\frac{dU}{dr} + \frac{\ell^2}{\mu r^3}.
\]

The second term is the **centrifugal force** \(F_{\rm cf} = \ell^2/(\mu r^3) = \mu r \dot{\phi}^2\). We can absorb it into a centrifugal potential energy \(U_{\rm cf} = \ell^2/(2\mu r^2)\) and define the **effective potential energy**:

\[
U_{\rm eff}(r) = U(r) + \frac{\ell^2}{2\mu r^2}.
\]

Now the radial motion is exactly like a one-dimensional problem in the potential \(U_{\rm eff}(r)\). The conserved energy is:

\[
E = \frac{1}{2}\mu\dot{r}^2 + U_{\rm eff}(r).
\]

The effective potential diagram immediately reveals the qualitative character of the orbit: if \(E < 0\), the particle is trapped between a minimum \(r_{\rm min}\) (perihelion) and a maximum \(r_{\rm max}\) (aphelion) — a bounded orbit. If \(E > 0\), the orbit is unbounded (comet that flies past and escapes to infinity). At \(E = U_{\rm eff,min}\), the orbit is circular.

## The Orbit Equation and Kepler's Laws

To find the shape of the orbit — \(r\) as a function of \(\phi\) rather than \(t\) — we use two tricks. First, substitute \(u = 1/r\) to linearize the equation; second, rewrite time derivatives as \(\phi\) derivatives using \(d/dt = (\ell u^2/\mu)\,d/d\phi\). The radial equation becomes:

\[
u''(\phi) = -u(\phi) - \frac{\mu}{\ell^2 u^2(\phi)}F(1/u),
\]

where \(F(r)\) is the radial force.

For the inverse-square gravitational force \(F = -\gamma/r^2 = -\gamma u^2\) (where \(\gamma = Gm_1m_2\)):

\[
u'' = -u + \frac{\gamma\mu}{\ell^2}.
\]

Setting \(c = \ell^2/(\gamma\mu)\), the general solution is:

\[
r(\phi) = \frac{c}{1 + \epsilon\cos\phi},
\]

where \(\epsilon\) is the **eccentricity**, determined by the energy:

\[
E = \frac{\gamma^2\mu}{2\ell^2}(\epsilon^2 - 1).
\]

This conic-section orbit is:
- A **circle** (\(\epsilon = 0\), \(E = -\gamma^2\mu/(2\ell^2)\))
- An **ellipse** (\(0 < \epsilon < 1\), \(E < 0\)) — Kepler's first law
- A **parabola** (\(\epsilon = 1\), \(E = 0\))
- A **hyperbola** (\(\epsilon > 1\), \(E > 0\)) — trajectory of an unbound comet

From the elliptic orbit solution, one can derive **Kepler's third law**: the square of the orbital period \(\tau\) is proportional to the cube of the semi-major axis \(a\):

\[
\tau^2 = \frac{4\pi^2}{\gamma/\mu} a^3 = \frac{4\pi^2}{GM_{\rm sun}} a^3,
\]

where the last equality holds for a planet of negligible mass orbiting the Sun. All three of Kepler's empirical laws — derived from patient astronomical observation by Kepler in the early 1600s — follow analytically from Newton's law of gravitation.

## Orbital Transfers

An important application is the **Hohmann transfer orbit**, the most fuel-efficient way to move a satellite between two circular orbits. A tangential thrust at perigee changes the angular momentum by a factor \(\lambda = v_2/v_1\), modifying both the eccentricity and the semi-latus rectum. The maneuver requires two firings: one to enter the elliptic transfer orbit at perigee, and one to circularize at apogee. This is the standard technique used to move communications satellites from low Earth orbit to geostationary orbit.

---

# Chapter 9: Hamiltonian Mechanics

## Phase Space and the Hamiltonian

Lagrangian mechanics describes the state of a system by \((q_i, \dot{q}_i)\) — position and velocity in configuration space. Hamiltonian mechanics switches to a different but equivalent description using positions and **conjugate momenta** \(p_i = \partial L/\partial \dot{q}_i\), together forming a \(2n\)-dimensional **phase space**.

The **Hamiltonian** \(H\) is defined by the **Legendre transform** of the Lagrangian:

\[
H(q_1, \ldots, q_n, p_1, \ldots, p_n, t) = \sum_{i=1}^{n} p_i \dot{q}_i - L.
\]

For a conservative system with natural (time-independent) generalized coordinates, \(H = T + U = E\), the total energy expressed as a function of positions and momenta. The critical insight is that all the \(\dot{q}_i\) must be eliminated in favor of the \(p_i\) by inverting the relations \(p_i = \partial L/\partial \dot{q}_i\).

## Hamilton's Equations of Motion

Starting from the Lagrange equations and the definition of \(H\), one derives **Hamilton's equations**:

\[
\dot{q}_i = \frac{\partial H}{\partial p_i}, \qquad \dot{p}_i = -\frac{\partial H}{\partial q_i} \qquad (i = 1, \ldots, n).
\]

These replace \(n\) second-order ODEs (Lagrange's equations) with \(2n\) first-order ODEs. The two descriptions are mathematically equivalent, but the Hamiltonian form has several advantages:

1. It is more symmetric — positions and momenta appear on an equal footing. This symmetry is related to the **canonical transformations**: certain changes of variables in phase space leave Hamilton's equations invariant, with no analog in Lagrangian mechanics.
2. The energy bookkeeping is explicit: from Hamilton's equations, \(dH/dt = \partial H/\partial t\). If \(H\) has no explicit time dependence, energy is conserved.
3. Phase space has a natural geometric structure (symplectic geometry) that generalizes to field theory and quantum mechanics.

## Ignorable Coordinates and Conservation Laws

As in the Lagrangian picture, if \(H\) is independent of some coordinate \(q_j\), then \(\dot{p}_j = -\partial H/\partial q_j = 0\), so \(p_j\) is conserved. The symmetry-conservation connection is explicit in both formulations.

## Phase-Space Orbits and Liouville's Theorem

Each point in phase space \(z = (q_1, \ldots, q_n, p_1, \ldots, p_n)\) represents a complete initial condition for the system, and Hamilton's equations define a unique **phase-space trajectory** through each point. A key topological fact is that no two phase-space trajectories can cross: if they shared a point, they would have to be the same trajectory (by uniqueness of solutions to ODEs).

The most celebrated result about the geometry of phase flow is:

<div class="theorem">
<strong>Liouville's Theorem:</strong> The flow of Hamilton's equations in phase space preserves volume. If a region \(\Omega(0)\) in phase space has volume \(V\), then the evolved region \(\Omega(t)\) has the same volume \(V\) for all \(t\).
</div>

Equivalently, the phase-space density of a swarm of systems with slightly different initial conditions remains constant as the systems evolve. Mathematically, this follows from the fact that the phase-space flow is incompressible: \(\nabla \cdot \dot{z} = \sum_i (\partial \dot{q}_i/\partial q_i + \partial \dot{p}_i/\partial p_i) = \sum_i (\partial^2 H/\partial q_i\partial p_i - \partial^2 H/\partial p_i\partial q_i) = 0\).

Liouville's theorem has deep implications. In statistical mechanics, it is the foundation of the microcanonical ensemble: a closed system in equilibrium explores phase space at a rate consistent with volume preservation. In optics, Liouville's theorem is equivalent to the impossibility of increasing the phase-space density of a beam with passive optics — you cannot focus light to a smaller solid angle without giving up spatial extent (the etendue is conserved). In plasma physics, it describes why particle beams spread in certain ways but not others.

---

# Chapter 10: Special Relativity

## The Failure of Galilean Invariance

Classical mechanics rests on Galilean relativity: if you add a uniform velocity to every particle in a system, the trajectories are still governed by Newton's laws. The **Galilean transformation** between frames \(S\) and \(S'\) (moving at velocity \(V\) along the \(x\)-axis) is:

\[
x' = x - Vt, \quad y' = y, \quad z' = z, \quad t' = t.
\]

Newton's laws, which depend on acceleration \(\ddot{\mathbf{r}}\), are manifestly unchanged under this transformation since \(\ddot{\mathbf{r}}' = \ddot{\mathbf{r}}\).

But Maxwell's equations of electromagnetism are *not* Galilean invariant. They predict that electromagnetic waves travel at speed \(c = 1/\sqrt{\mu_0\epsilon_0} \approx 3 \times 10^8\) m/s — in all directions, relative to *some* preferred frame (the supposed ether). The 1887 **Michelson-Morley experiment** set out to detect Earth's motion through this ether by measuring the difference in the speed of light in perpendicular directions. It found none: the speed of light is the same in all directions regardless of the Earth's velocity. The ether did not exist.

This experimental result forced a complete reexamination of the notions of space and time. Einstein's 1905 resolution: abandon Galilean relativity in favor of a new kinematics in which the speed of light is a universal constant.

## Postulates and Their Consequences

**Special relativity** rests on two postulates:

1. **Principle of relativity**: The laws of physics have the same form in all inertial frames.
2. **Universality of the speed of light**: The speed of light in vacuum is \(c\) in every inertial frame, independent of the motion of the source or observer.

These two postulates, taken together, are logically inconsistent with the Galilean transformation. The resolution is that the Galilean transformation must be replaced by the **Lorentz transformation**.

### Time Dilation

Consider a "light clock": a flash of light bounces between two mirrors separated by height \(h\). In the rest frame \(S'\) of the clock, the round-trip time is \(\Delta t_0 = 2h/c\). In a frame \(S\) relative to which the clock moves at speed \(V\), the light must travel a longer diagonal path. By Pythagoras and the postulate that light travels at \(c\) in \(S\) too:

\[
\left(\frac{c\Delta t}{2}\right)^2 = h^2 + \left(\frac{V\Delta t}{2}\right)^2 \quad \Longrightarrow \quad \Delta t = \frac{\Delta t_0}{\sqrt{1 - V^2/c^2}} = \gamma\Delta t_0.
\]

Here \(\gamma = (1 - \beta^2)^{-1/2}\) with \(\beta = V/c\). Since \(\gamma \geq 1\), the moving clock ticks slower. This is **time dilation**: a moving clock runs slow. The proper time \(\Delta t_0\) is the shortest time measurement, made in the rest frame of the clock.

Time dilation is not a theoretical curiosity. Muons produced in cosmic ray showers at the top of the atmosphere have a proper half-life of about \(2.2\,\mu\mathrm{s}\). At typical speeds \(v \approx 0.99c\), they should travel only \(\sim 660\) m before half decay — yet they are observed in abundance at sea level, about 10 km away. The resolution is time dilation: in Earth's frame, the muon's clock runs slow by a factor \(\gamma \approx 7\), extending its effective lifetime to \(\sim 15\,\mu\mathrm{s}\) and allowing it to traverse the full atmosphere. This was confirmed experimentally by Rossi and Hall in 1941.

### Length Contraction

An object of proper length \(L_0\) (measured in its rest frame) has length \(L = L_0/\gamma\) in a frame relative to which it moves. This **length contraction** is also sometimes called the Lorentz-FitzGerald contraction (since Lorentz and FitzGerald independently proposed it as a dynamical effect before Einstein showed it is purely kinematic).

Lengths perpendicular to the direction of motion are unchanged.

## The Lorentz Transformation

The Lorentz transformation that replaces the Galilean transformation (for relative motion along the \(x\)-axis) is:

\[
x' = \gamma(x - Vt), \quad y' = y, \quad z' = z, \quad t' = \gamma\!\left(t - \frac{Vx}{c^2}\right).
\]

The inverse transformation is obtained by swapping primed and unprimed while replacing \(V\) with \(-V\). Several features deserve attention. First, time transforms non-trivially — it is mixed with the spatial coordinate \(x\). Second, the transformation reduces to the Galilean one when \(V \ll c\) (so \(\gamma \approx 1\) and \(Vx/c^2 \approx 0\)). Third, the **relativity of simultaneity** follows directly: two events at different spatial locations that are simultaneous (\(t_1 = t_2\)) in \(S\) generally have \(t_1' \neq t_2'\) in \(S'\).

The velocity-addition formula follows from differentiating the Lorentz transformation. For a particle moving at velocity \(v_x\) in \(S\), its velocity in \(S'\) is:

\[
v_x' = \frac{v_x - V}{1 - v_x V/c^2}.
\]

When both \(v_x\) and \(V\) are much less than \(c\), this reduces to the Galilean result \(v_x' = v_x - V\). Crucially, if \(v_x = c\) (a photon), then \(v_x' = c\) regardless of \(V\) — confirming that the speed of light is indeed the same in all frames.

## Four-Vectors and Spacetime

The deepest insight of special relativity is that space and time form a unified **spacetime**, and the Lorentz transformation is a "rotation" in this four-dimensional space. Introducing the four-coordinate \(x = (x_1, x_2, x_3, x_4) = (x, y, z, ct)\), the Lorentz transformation acts as a matrix multiplication \(x' = \Lambda x\).

A **four-vector** is any set of four quantities that transforms under Lorentz transformations in the same way as the spacetime coordinates. The **four-momentum** of a particle of mass \(m\) and three-velocity \(\mathbf{v}\) is:

\[
p = (p_1, p_2, p_3, p_4) = (\gamma m\mathbf{v},\; \gamma mc) = \left(\mathbf{p},\; \frac{E}{c}\right),
\]

where \(\mathbf{p} = \gamma m\mathbf{v}\) is the relativistic three-momentum and \(E = \gamma mc^2\) is the **relativistic energy**.

The Lorentz-invariant scalar product of two four-vectors \(x = (x_1, x_2, x_3, x_4)\) and \(y = (y_1, y_2, y_3, y_4)\) is:

\[
x \cdot y = x_1 y_1 + x_2 y_2 + x_3 y_3 - x_4 y_4.
\]

The minus sign on the time component is the signature of Minkowski spacetime. For the four-momentum, the invariant square is:

\[
p \cdot p = |\mathbf{p}|^2 - E^2/c^2 = -(mc)^2,
\]

which gives the fundamental energy-momentum relation:

\[
E^2 = (mc^2)^2 + (|\mathbf{p}|c)^2.
\]

At rest (\(\mathbf{p} = 0\)), this becomes the famous \(E = mc^2\): mass is a form of energy. For a massless particle (photon), \(E = |\mathbf{p}|c\) — consistent with \(v = c\) since \(\beta = pc/E = 1\).

## The Light Cone and Causality

The invariant interval between two spacetime events \(x_A\) and \(x_B\) is:

\[
s^2 = |\mathbf{r}_A - \mathbf{r}_B|^2 - c^2(t_A - t_B)^2.
\]

This is a Lorentz scalar — the same in all inertial frames. Three cases:

- \(s^2 < 0\) (**timelike** separation): the events can be causally related; there exists a frame in which they occur at the same spatial location. The time ordering is the same in all frames — if \(A\) causes \(B\), then \(t_A < t_B\) in every frame.
- \(s^2 = 0\) (**lightlike** or null separation): the events are connected by a light ray.
- \(s^2 > 0\) (**spacelike** separation): the events cannot be causally related; their time ordering depends on the reference frame.

The **light cone** of an event \(O\) divides spacetime into the absolute future (inside the forward cone, \(s^2 < 0\), \(t > 0\)), the absolute past (inside the backward cone), and the **elsewhere** (outside the cone, spacelike). No causal influence can propagate faster than \(c\); this is encoded in the structure of the light cone.

---

# Chapter 11: Beyond This Course

## Natural Next Topics

### Mechanics in Non-inertial Frames

Taylor's Chapter 9 — deliberately omitted from AMATH 271 — concerns what happens when the reference frame itself accelerates or rotates. In a rotating frame (such as the surface of the Earth), Newton's second law acquires fictitious force terms: the centrifugal force \(-m\boldsymbol{\omega} \times (\boldsymbol{\omega} \times \mathbf{r})\) and the Coriolis force \(-2m\boldsymbol{\omega} \times \mathbf{v}\). The Coriolis force is responsible for the deflection of winds (cyclones and anticyclones), the precession of Foucault's pendulum, and the rotation of large-scale ocean currents. Understanding non-inertial frames is essential for geophysical fluid dynamics, the physics of rotating machinery, and the design of inertial navigation systems.

### Rigid Body Rotation

A rigid body has six degrees of freedom: three translations and three rotations. The rotational dynamics are governed by \(\dot{\mathbf{L}} = \boldsymbol{\Gamma}\), but the inertia tensor — a \(3 \times 3\) matrix relating \(\mathbf{L}\) to the angular velocity \(\boldsymbol{\omega}\) — is the new complication. In a frame aligned with the principal axes (the eigenvectors of the inertia tensor), the equations decouple to Euler's equations:

\[
I_1\dot{\omega}_1 = (I_2 - I_3)\omega_2\omega_3, \quad \text{(and cyclic permutations)}.
\]

The free rotation of an asymmetric body is surprisingly rich: Euler's equations exhibit the **tennis racket theorem** (or intermediate axis theorem) — rotation about the intermediate principal axis is unstable, while rotation about the axes of largest and smallest moments is stable. Space probes (notably Explorer 1 in 1958) unexpectedly began tumbling because of this instability. The precession and nutation of a gyroscope are also consequences of rigid-body mechanics and have important applications in astronomy (the precession of the Earth's axis), navigation (gyrocompasses), and quantum mechanics (spin).

### Coupled Oscillators and Normal Modes

When two or more oscillators are coupled, the motion is no longer simple harmonic in general. However, there exist special **normal modes** — collective patterns of oscillation in which all parts of the system oscillate at the same frequency. For \(n\) coupled oscillators, there are \(n\) normal modes with frequencies \(\omega_1, \ldots, \omega_n\). The general motion is a superposition of all normal modes.

The mathematical formulation leads to a generalized eigenvalue problem: \(K\mathbf{a} = \omega^2 M\mathbf{a}\), where \(K\) and \(M\) are the stiffness and mass matrices. This framework underlies the vibration analysis of everything from bridges to molecules to musical instruments. In the continuum limit, discrete normal modes become the standing waves and vibrational modes of continuous bodies — the vibration modes of a drumhead, the resonant modes of a violin body, the acoustic modes of a room.

### Nonlinear Mechanics and Chaos

When oscillations are large enough that the linear approximation breaks down, the dynamics become nonlinear. A nonlinear oscillator like the pendulum (which obeys \(\ddot{\theta} = -(g/L)\sin\theta\) rather than the linearized \(\ddot{\theta} = -(g/L)\theta\)) exhibits period doubling as parameters change, and ultimately **chaos** — aperiodic, seemingly random behavior arising from entirely deterministic equations. The **Poincaré section** (a stroboscopic snapshot of phase space) and the **Lyapunov exponent** (measuring how fast nearby trajectories diverge) are the key diagnostic tools.

The strange attractors of chaotic systems — the Lorenz attractor, the Duffing attractor — have fractal structure. Chaos theory has transformed our understanding of weather prediction (the "butterfly effect"), turbulence, population dynamics, and cardiac arrhythmias. KAM theory (Kolmogorov-Arnold-Moser) provides a rigorous framework for understanding when integrability survives small perturbations and when it gives way to chaos, and is deeply connected to the long-term stability of the solar system.

### Classical Field Theory

The Lagrangian and Hamiltonian frameworks extend naturally from finitely many degrees of freedom to fields — continuous systems with infinitely many degrees of freedom. The action for a field \(\phi(x, t)\) is:

\[
S = \int \mathcal{L}\!\left(\phi, \partial_\mu\phi\right) d^4x,
\]

where \(\mathcal{L}\) is the Lagrangian density and the integral is over spacetime. The Euler-Lagrange equation for a field is:

\[
\frac{\partial \mathcal{L}}{\partial\phi} - \partial_\mu\frac{\partial\mathcal{L}}{\partial(\partial_\mu\phi)} = 0.
\]

This framework encompasses Maxwell's electrodynamics (the electromagnetic field), the Klein-Gordon equation (relativistic scalar field), and — in the quantum version — the entire Standard Model of particle physics.

## Follow-up Courses and Reading

### At the University of Waterloo

**AMATH 361** (*Continuum Mechanics*) treats fluids and elastic solids using Lagrangian and Eulerian field descriptions — the direct continuation of AMATH 271's framework. **AMATH 455** (*Control Theory*) uses Hamiltonian ideas in control and optimization. **PHYS 334** (*Thermal Physics*) connects Liouville's theorem and phase-space ideas to statistical mechanics. **PHYS 342** (*Quantum Mechanics I*) is the quantum counterpart: canonical quantization promotes classical Hamiltonian mechanics to the Schrödinger equation, with Poisson brackets becoming commutators.

### Graduate Level

**AMATH 673** (*Classical Mechanics*) covers the full graduate treatment: canonical transformations, action-angle variables, Hamilton-Jacobi theory, and the geometric formulation of mechanics in terms of symplectic manifolds. The standard texts at this level are Goldstein, Poole & Safko *Classical Mechanics* (3rd ed.) and Arnold *Mathematical Methods of Classical Mechanics* (Springer). Arnold's text, in particular, develops the symplectic geometry perspective with full mathematical rigor and is required reading for anyone going into mathematical physics.

### Comparable Courses at Peer Universities

MIT's **8.09 Classical Mechanics III** (freely available on MIT OCW) covers the full Hamiltonian treatment, Liouville's theorem, and action-angle variables at a level directly comparable to a continuation of AMATH 271. David Tong's *Lectures on Classical Dynamics* (Cambridge, freely available at damtp.cam.ac.uk) are exceptionally well-written and cover Lagrangian mechanics, rigid bodies, normal modes, and Hamiltonian mechanics in a style that bridges physics and mathematics. Morin's *Introduction to Classical Mechanics* (Cambridge, 2008) is famous for its 600 problems ranging from straightforward to extremely challenging and is the standard recommendation for olympiad-style classical mechanics.

### The Path to General Relativity

Special relativity, as covered in AMATH 271, is the kinematics of flat spacetime. The next step is **general relativity** (GR), which introduces the curvature of spacetime as the geometric manifestation of gravity. The conceptual leap is enormous: spacetime itself becomes a dynamic variable, governed by Einstein's field equations:

\[
G_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu},
\]

where \(G_{\mu\nu}\) is the Einstein tensor (encoding curvature) and \(T_{\mu\nu}\) is the stress-energy tensor (encoding matter and energy content). Prerequisites are special relativity (as in AMATH 271), differential geometry, and tensor calculus. Accessible introductions include Hartle *Gravity: An Introduction to Einstein's General Relativity* (for physicists) and Carroll *Spacetime and Geometry* (for mathematicians and physicists wanting rigor). The payoff is understanding black holes, gravitational waves (first detected by LIGO in 2015), the expansion of the universe, and the Big Bang.

### The Path to Quantum Mechanics

Hamilton's formulation of classical mechanics is also the most direct route to quantum mechanics. The Hamiltonian \(H\) becomes the quantum Hamiltonian operator \(\hat{H}\); positions and momenta become operators satisfying \([\hat{q}_i, \hat{p}_j] = i\hbar\delta_{ij}\) (the commutation relations that replace Poisson brackets); and the equation of motion becomes the Schrödinger equation \(i\hbar\partial_t\psi = \hat{H}\psi\). The Lagrangian path integral formulation (due to Feynman) is a quantization of the action \(S = \int L\,dt\): the quantum amplitude for a process is a sum over all classical paths weighted by \(e^{iS/\hbar}\). In the classical limit \(\hbar \to 0\), the dominant contribution comes from paths near the stationary-action path — recovering Newton's second law.

## Open Problems and Active Research

### The \(N\)-Body Problem

The two-body gravitational problem is exactly solvable (as AMATH 271 shows), but the three-body problem is not. **Poincaré** proved in 1890 that the three-body problem does not have a general analytic solution in terms of integrals — more precisely, that there is no convergent power series expansion valid for all time. This is the first rigorous result in the theory of dynamical systems and chaos. Special solutions do exist: the **Lagrange points** (where a small body can orbit stably relative to two larger bodies — L4 and L5 are stable for mass ratios below the Routh criterion), and the figure-eight three-body orbit discovered numerically by Chenciner and Montgomery in 2000. Active research seeks new periodic orbits and studies the long-term stability of the solar system using KAM theory. The celebrated Laskar simulations showed that the solar system is chaotic on timescales of tens of millions of years — the eccentricity of Mercury can grow enough to eject it from the inner solar system or cause a planetary collision within about 5 billion years.

### KAM Theory and the Stability of Integrable Systems

**Kolmogorov-Arnold-Moser (KAM) theory** answers the question: if an integrable Hamiltonian system (one with as many conserved quantities as degrees of freedom) is perturbed by a small non-integrable term, what survives? The KAM theorem (proved in its various forms by Kolmogorov 1954, Arnold 1963, Moser 1962) shows that most invariant tori — the regular trajectories of the integrable system — survive small perturbations, provided the frequencies satisfy a Diophantine non-resonance condition. The surviving tori are dense but form a Cantor-like set; between them, chaotic trajectories weave. This explains why planetary orbits are approximately regular despite mutual perturbations — but also why resonances (Jupiter's 2:1 mean-motion resonance with certain asteroids) can drive chaotic diffusion and eventual escape.

### Geometric Mechanics and Symplectic Topology

The modern mathematical treatment of Hamiltonian mechanics is the theory of **symplectic manifolds** — smooth manifolds equipped with a closed, non-degenerate 2-form \(\omega\). Phase space is the canonical example: \(\omega = \sum_i dq_i \wedge dp_i\). Liouville's theorem is the statement that \(\omega^n\) (the \(n\)-fold exterior product) is preserved by the flow. **Gromov's non-squeezing theorem** (1985) is a striking generalization: a symplectomorphism cannot squeeze a ball of phase-space radius \(r\) into a cylinder of radius \(R < r\) — even though it can squeeze the ball in all other directions arbitrarily. This has implications for the precision of phase-space measurements in quantum mechanics (the uncertainty principle has a classical symplectic precursor). Active research in symplectic topology focuses on counting periodic orbits (Arnold's conjecture, proved by Liu-Tian and others using Floer homology), and on applying symplectic ideas to mirror symmetry in algebraic geometry.

### Celestial Mechanics and Space Mission Design

Modern celestial mechanics uses Hamiltonian perturbation theory, KAM theory, and dynamical systems ideas for practical space mission design. The **Interplanetary Transport Network** (ITN) is a system of low-energy trajectories that exploit the invariant manifolds of Lagrange points. The Genesis and Grail missions used ITN trajectories to dramatically reduce fuel requirements. **Weak stability boundary** transfers (pioneered by Belbruno) exploit the chaotic regions near the Moon's Lagrange points to achieve lunar capture with minimal fuel. The mathematical tools are invariant manifolds of periodic orbits in the circular restricted three-body problem, computed numerically.

### Foundations of Statistical Mechanics

Liouville's theorem says the phase-space density of a Hamiltonian system is constant along trajectories. Yet macroscopic systems approach thermal equilibrium — the Boltzmann distribution, in which the phase-space density is emphatically *not* uniform. The resolution involves **ergodic theory**: for a chaotic system, the time average of a quantity equals its phase-space average (the ergodic hypothesis). But proving ergodicity rigorously for realistic physical systems (hard spheres in a box, for instance) is extraordinarily difficult. Sinai's 1963 proof that the hard-sphere gas is ergodic was a milestone. The **Boltzmann \(H\)-theorem** and the origin of the second law of thermodynamics — the macroscopic arrow of time from microscopically time-reversible laws — remain areas of active foundational research. Recent work by Gallavotti, Cohen, and Jarzynski on **fluctuation theorems** gives exact results about entropy production in non-equilibrium systems, going far beyond the second law's mere statement that entropy increases on average.

### Relativistic Mechanics and Gravitational Waves

The detection of gravitational waves by LIGO in September 2015 — a century after Einstein predicted them — opened a new window on the universe. The waves detected in that first event were produced by the inspiral and merger of two black holes, each about 30 solar masses, roughly 1.3 billion light-years away. The analysis required matching the observed waveform against templates computed by solving the post-Newtonian expansion of the two-body problem in general relativity. AMATH 271's treatment of the two-body Kepler problem is the Newtonian starting point; corrections of order \(v^2/c^2\), \(v^4/c^4\), etc. (post-Newtonian expansion) account for relativistic effects. Active research in gravitational wave astronomy focuses on parameter estimation (measuring masses, spins, distances from waveforms), tests of general relativity in the strong-field regime, and the stochastic gravitational wave background from many overlapping sources — recently detected by pulsar timing arrays.
