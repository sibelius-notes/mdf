---
title: "PHYS 121: Mechanics"
subjects: "PHYS"
prof: "Peter Neathway"
---

## Sources and References
**Primary textbook** — Young, H. D. and Freedman, R. A. *University Physics with Modern Physics*, 15th ed. Pearson, 2020.
**Online resources** — Fitzpatrick, R. *Classical Mechanics* at farside.ph.utexas.edu; MIT OCW 8.01 (Classical Mechanics); HyperPhysics at hyperphysics.phy-astr.gsu.edu

---

# Chapter 1: Doing Physics — Quantities, Dimensions, and Units

## 1.1 The Language of Physics

Physics is, at its core, the art of precise description. Before any equation can be written, we must agree on what we are measuring and how. The history of science is littered with disasters born of unit confusion — spacecraft lost, bridges miscalculated, medicines misdosed — and so the physicist's obsessive concern with dimensions is not pedantry but survival.

Every physical quantity is built from a small set of **base dimensions**. In the International System of Units (SI), these are: length \([L]\), mass \([M]\), time \([T]\), electric current \([I]\), thermodynamic temperature \([\Theta]\), amount of substance \([N]\), and luminous intensity \([J]\). All other quantities — velocity, energy, pressure — are **derived** by combining base dimensions through multiplication and division.

<div class="definition">
<strong>Dimensional analysis</strong> is the technique of tracking the dimensions of every quantity in an equation to verify consistency and to construct physically reasonable expressions. If both sides of an equation do not share the same dimensions, the equation is certainly wrong. If they do agree dimensionally, the equation may still be wrong (by a numerical factor), but it has passed a necessary test.
</div>

## 1.2 Significant Figures and Order-of-Magnitude Estimation

The number of **significant figures** in a measured quantity reflects the precision of the measurement. When multiplying or dividing, the result should carry no more significant figures than the least precise input. When adding or subtracting, the last significant digit is determined by the quantity with the largest absolute uncertainty.

A complementary tool is **order-of-magnitude estimation** — the physicist's skill of obtaining a rough answer (accurate to a factor of ten) from first principles. Enrico Fermi famously estimated the number of piano tuners in Chicago from basic demographic reasoning; the same mode of thinking applies when checking whether a calculated result is physically plausible.

## 1.3 Scalars and Vectors

Physical quantities divide naturally into two kinds. A **scalar** is fully described by a single number with a unit — temperature, mass, speed, energy. A **vector** carries both magnitude and direction — displacement, velocity, force, momentum.

<div class="definition">
A <strong>vector</strong> \(\mathbf{A}\) in three dimensions is an ordered triple of real numbers \((A_x, A_y, A_z)\) representing projections onto a set of mutually perpendicular axes. The magnitude is
\[
A = |\mathbf{A}| = \sqrt{A_x^2 + A_y^2 + A_z^2}.
\]
</div>

### 1.3.1 Vector Algebra

Two fundamental products appear throughout classical mechanics.

The **dot product** (scalar product) of vectors \(\mathbf{A}\) and \(\mathbf{B}\) is:

\[
\mathbf{A} \cdot \mathbf{B} = A_x B_x + A_y B_y + A_z B_z = AB\cos\theta,
\]

where \(\theta\) is the angle between the vectors. The dot product is commutative and yields a scalar. It measures the extent to which two vectors point in the same direction.

The **cross product** (vector product) is:

\[
\mathbf{A} \times \mathbf{B} = \begin{vmatrix} \hat{x} & \hat{y} & \hat{z} \\ A_x & A_y & A_z \\ B_x & B_y & B_z \end{vmatrix} = (A_y B_z - A_z B_y)\hat{x} - (A_x B_z - A_z B_x)\hat{y} + (A_x B_y - A_y B_x)\hat{z}.
\]

Its magnitude is \(|\mathbf{A} \times \mathbf{B}| = AB\sin\theta\) and it points perpendicular to the plane containing \(\mathbf{A}\) and \(\mathbf{B}\) in the direction given by the right-hand rule. The cross product is anti-commutative: \(\mathbf{A} \times \mathbf{B} = -\mathbf{B} \times \mathbf{A}\).

---

# Chapter 2: One-Dimensional Kinematics

## 2.1 Position, Displacement, and Velocity

**Kinematics** is the description of motion without reference to its causes. Consider a particle constrained to move along a straight line, which we call the \(x\)-axis. Its **position** \(x(t)\) is a function of time.

<div class="definition">
The <strong>displacement</strong> of a particle between times \(t_1\) and \(t_2\) is
\[
\Delta x = x(t_2) - x(t_1).
\]
Displacement is a vector (here, a signed scalar in 1D); it differs from the total path length, which is always non-negative.
</div>

The **average velocity** over the interval \([t_1, t_2]\) is:

\[
\bar{v} = \frac{\Delta x}{\Delta t} = \frac{x(t_2) - x(t_1)}{t_2 - t_1}.
\]

Taking the limit as \(\Delta t \to 0$ yields the **instantaneous velocity**:

\[
v(t) = \frac{dx}{dt} = \dot{x}(t).
\]

Similarly, the **instantaneous acceleration** is:

\[
a(t) = \frac{dv}{dt} = \frac{d^2 x}{dt^2} = \ddot{x}(t).
\]

## 2.2 Uniform Acceleration: The Kinematic Equations

When \(a\) is constant, integration of the acceleration is straightforward and yields the four **kinematic equations** that form the backbone of introductory mechanics:

\[
v = v_0 + at,
\]

\[
x = x_0 + v_0 t + \tfrac{1}{2}at^2,
\]

\[
v^2 = v_0^2 + 2a(x - x_0),
\]

\[
x - x_0 = \frac{v + v_0}{2}\,t.
\]

These four equations contain five quantities — \(x_0, v_0, v, a, t\) — and any three can be determined from the other two.

<div class="example">
<strong>Free fall.</strong> Near Earth's surface, gravity produces a constant downward acceleration \(g \approx 9.81\ \mathrm{m\,s^{-2}}\). A ball dropped from rest at height \(h\) reaches the ground when \(y = 0\), i.e., when \(h = \tfrac{1}{2}gt^2\), giving time of flight \(t = \sqrt{2h/g}\) and impact speed \(v = \sqrt{2gh}\). Note how these two expressions are consistent with the third kinematic equation.
</div>

---

# Chapter 3: Two- and Three-Dimensional Kinematics

## 3.1 Vectors in Kinematics

When a particle moves in two or three dimensions, position, velocity, and acceleration all become vectors:

\[
\mathbf{r}(t) = x(t)\hat{x} + y(t)\hat{y} + z(t)\hat{z},
\]

\[
\mathbf{v}(t) = \frac{d\mathbf{r}}{dt} = \dot{x}\hat{x} + \dot{y}\hat{y} + \dot{z}\hat{z},
\]

\[
\mathbf{a}(t) = \frac{d\mathbf{v}}{dt} = \ddot{x}\hat{x} + \ddot{y}\hat{y} + \ddot{z}\hat{z}.
\]

Because the component equations are independent, we can analyze multi-dimensional motion by decomposing it into independent 1D problems along each axis.

## 3.2 Projectile Motion

Projectile motion is the archetypal two-dimensional kinematics problem. Launch a particle from the origin with initial speed \(v_0\) at angle \(\theta\) above the horizontal. Gravity acts only in the \(-y\) direction; there is no horizontal acceleration (ignoring air resistance). The components of motion are then independent:

\[
x(t) = v_0 \cos\theta \cdot t, \qquad y(t) = v_0 \sin\theta \cdot t - \tfrac{1}{2}g t^2.
\]

The trajectory is found by eliminating \(t\):

\[
y = x\tan\theta - \frac{g}{2v_0^2\cos^2\theta}\,x^2.
\]

This is a downward-opening parabola. The range (horizontal distance when \(y = 0\) again) is:

\[
R = \frac{v_0^2 \sin 2\theta}{g},
\]

maximized at \(\theta = 45°\) for fixed \(v_0\) and \(g\).

## 3.3 Circular Motion and Centripetal Acceleration

A particle moving in a circle of radius \(r\) at constant speed \(v\) has a velocity vector that continuously changes direction, even though its magnitude is constant. The rate of change of the velocity vector points **toward the center** of the circle:

\[
\mathbf{a}_c = -\frac{v^2}{r}\hat{r} = -\omega^2 r\,\hat{r},
\]

where \(\omega = v/r\) is the **angular velocity** (rad/s) and \(\hat{r}\) points outward from the center. The magnitude of this **centripetal acceleration** is \(a_c = v^2/r = \omega^2 r\).

<div class="remark">
The word "centripetal" means "center-seeking." It describes the <em>direction</em> of the acceleration, not a new kind of force. The centripetal acceleration must be provided by real forces — tension in a string, a normal force on a banked turn, gravity for orbital motion — always directed inward.
</div>

---

# Chapter 4: Newton's Laws of Motion

## 4.1 Historical Context

The year 1687 marks one of the most consequential moments in intellectual history: Isaac Newton published his *Philosophiae Naturalis Principia Mathematica*. In this single work, Newton unified terrestrial and celestial mechanics, demonstrated that the same gravitational force that pulls an apple from a tree keeps the Moon in its orbit, and laid down three laws of motion that would govern physics for more than two centuries. Even today, with the quantum and relativistic revolutions behind us, Newton's laws remain the correct description of macroscopic objects moving at speeds well below the speed of light.

## 4.2 Newton's First Law: Inertia

<div class="theorem">
<strong>Newton's First Law (Law of Inertia):</strong> A body remains at rest, or in uniform rectilinear motion, unless acted upon by a net external force.
</div>

This law defines the concept of an **inertial reference frame** — a frame in which the first law holds. Any frame moving at constant velocity relative to an inertial frame is also inertial. The first law is not simply a special case of the second; it establishes the framework within which forces are meaningful.

## 4.3 Newton's Second Law

<div class="theorem">
<strong>Newton's Second Law:</strong> The net force on a body equals the rate of change of its momentum:
\[
\mathbf{F}_{\mathrm{net}} = \frac{d\mathbf{p}}{dt},
\]
where \(\mathbf{p} = m\mathbf{v}\) is the linear momentum. For constant mass, this reduces to
\[
\mathbf{F}_{\mathrm{net}} = m\mathbf{a}.
\]
</div>

The second law is a vector equation, so it encapsulates three independent scalar equations in Cartesian coordinates:

\[
F_x = ma_x, \qquad F_y = ma_y, \qquad F_z = ma_z.
\]

The unit of force in SI is the **Newton**: \(1\ \mathrm{N} = 1\ \mathrm{kg\,m\,s^{-2}}\).

## 4.4 Newton's Third Law

<div class="theorem">
<strong>Newton's Third Law:</strong> If body A exerts a force \(\mathbf{F}_{AB}\) on body B, then body B exerts a force \(\mathbf{F}_{BA} = -\mathbf{F}_{AB}\) on body A. These action-reaction forces are equal in magnitude, opposite in direction, and act on <em>different</em> bodies.
</div>

The third law is crucial for systems of particles: internal forces between parts of a system cancel in pairs, so only external forces change the total momentum of the system.

## 4.5 Common Forces in Mechanics

**Weight** is the gravitational force on a body of mass \(m\) near Earth's surface: \(\mathbf{W} = m\mathbf{g}\), where \(\mathbf{g}\) points downward with magnitude \(g \approx 9.81\ \mathrm{m\,s^{-2}}\).

**Normal force** \(\mathbf{N}\) is the contact force perpendicular to a surface, which prevents objects from passing through each other. It adjusts automatically to maintain the constraint.

**Friction** acts parallel to a surface and opposes relative motion (kinetic friction) or impending motion (static friction):

\[
f_s \leq \mu_s N, \qquad f_k = \mu_k N,
\]

where \(\mu_s\) and \(\mu_k\) are the coefficients of static and kinetic friction. In general \(\mu_s > \mu_k\).

**Tension** \(T\) in a massless, inextensible string is transmitted unchanged throughout the string's length, changing direction only at pulleys (which also do no work if frictionless).

**Spring force** (Hooke's Law): For a spring with spring constant \(k\) and extension \(x\) from equilibrium,

\[
F_{\mathrm{spring}} = -kx.
\]

---

# Chapter 5: Applications of Newton's Laws

## 5.1 Free-Body Diagrams and Problem Strategy

The most reliable strategy for applying Newton's second law is to isolate a single body, draw every force acting on it (the **free-body diagram**), choose a convenient coordinate system, and write \(F_{\mathrm{net}} = ma\) for each component. The net force is the vector sum of all forces; each force appears only once on one side, while acceleration appears on the other.

## 5.2 Systems of Connected Objects

When multiple objects are connected — by strings, rods, or contacts — we can write Newton's second law for each body separately, or for the system as a whole. Consider two blocks of masses \(m_1\) and \(m_2\) connected by a massless string over a frictionless pulley (Atwood's machine):

For the heavier mass \(m_1\) (accelerating downward):
\[
m_1 g - T = m_1 a.
\]

For the lighter mass \(m_2\) (accelerating upward):
\[
T - m_2 g = m_2 a.
\]

Adding these equations eliminates \(T\) and gives:

\[
a = \frac{(m_1 - m_2)g}{m_1 + m_2}, \qquad T = \frac{2m_1 m_2 g}{m_1 + m_2}.
\]

## 5.3 Circular Motion Dynamics

For a particle executing uniform circular motion, the centripetal acceleration \(a_c = v^2/r\) must be supplied by the net inward force:

\[
F_{\mathrm{net, inward}} = \frac{mv^2}{r} = m\omega^2 r.
\]

For a car rounding a flat horizontal curve, static friction provides this force; for a satellite in circular orbit, gravity does. The condition for circular orbit of radius \(r\) around Earth (mass \(M_E\)):

\[
\frac{GM_E m}{r^2} = \frac{mv^2}{r} \implies v = \sqrt{\frac{GM_E}{r}}.
\]

---

# Chapter 6: Work, Energy, and the Work-Energy Theorem

## 6.1 Work

The concept of **work** connects force and motion in a way that transcends individual coordinate directions. When a constant force \(\mathbf{F}\) acts on a particle that undergoes displacement \(\Delta\mathbf{r}\):

\[
W = \mathbf{F} \cdot \Delta\mathbf{r} = F\,\Delta r\,\cos\theta,
\]

where \(\theta\) is the angle between force and displacement. For a variable force along a curve:

\[
W = \int_{\mathbf{r}_1}^{\mathbf{r}_2} \mathbf{F} \cdot d\mathbf{r}.
\]

Work is a scalar with SI unit **joule**: \(1\ \mathrm{J} = 1\ \mathrm{N\,m} = 1\ \mathrm{kg\,m^2\,s^{-2}}\).

## 6.2 Kinetic Energy and the Work-Energy Theorem

<div class="definition">
The <strong>kinetic energy</strong> of a particle of mass \(m\) and speed \(v\) is
\[
K = \frac{1}{2}mv^2.
\]
</div>

<div class="theorem">
<strong>Work-Energy Theorem:</strong> The net work done on a particle equals the change in its kinetic energy:
\[
W_{\mathrm{net}} = \Delta K = K_f - K_i = \frac{1}{2}mv_f^2 - \frac{1}{2}mv_i^2.
\]
</div>

<div class="proof">
Starting from Newton's second law in one dimension and using the chain rule:
\[
F_{\mathrm{net}} = m\frac{dv}{dt} = m\frac{dv}{dx}\frac{dx}{dt} = mv\frac{dv}{dx}.
\]
Therefore:
\[
W_{\mathrm{net}} = \int_{x_1}^{x_2} F_{\mathrm{net}}\,dx = \int_{v_1}^{v_2} mv\,dv = \frac{1}{2}mv_2^2 - \frac{1}{2}mv_1^2. \qquad \square
\]
</div>

## 6.3 Potential Energy and Conservative Forces

A force is **conservative** if the work it does on a particle moving between two points is independent of the path taken. Equivalently, the work done by a conservative force around any closed loop is zero. Conservative forces can be associated with a **potential energy** \(U\):

\[
W_{\mathrm{conservative}} = -\Delta U = -(U_f - U_i).
\]

The gravitational potential energy near Earth's surface is \(U_g = mgy\) (with \(y\) measured upward from the reference level). The elastic potential energy stored in a spring compressed or stretched by \(x\) from equilibrium is \(U_s = \frac{1}{2}kx^2\).

## 6.4 Conservation of Mechanical Energy

<div class="theorem">
<strong>Conservation of Mechanical Energy:</strong> If only conservative forces do work on a system, the total mechanical energy \(E = K + U\) is constant:
\[
K_i + U_i = K_f + U_f, \qquad \text{or equivalently} \qquad \frac{d}{dt}(K + U) = 0.
\]
</div>

This is a powerful tool because it converts a vector problem (Newton's second law at every point) into a scalar bookkeeping problem. When non-conservative forces (friction, drag) are present, the work-energy theorem must be extended:

\[
W_{\mathrm{non-conservative}} = \Delta E = \Delta K + \Delta U.
\]

The work done by friction is always negative (it removes mechanical energy, converting it to thermal energy), while work done by an applied engine or motor can be positive.

## 6.5 Power

**Power** is the rate at which work is done:

\[
P = \frac{dW}{dt} = \mathbf{F} \cdot \mathbf{v}.
\]

The SI unit of power is the **watt**: \(1\ \mathrm{W} = 1\ \mathrm{J\,s^{-1}}\).

---

# Chapter 7: Conservation of Linear Momentum

## 7.1 Linear Momentum and Impulse

<div class="definition">
The <strong>linear momentum</strong> of a particle is \(\mathbf{p} = m\mathbf{v}\). For a system of \(N\) particles, the total momentum is
\[
\mathbf{P} = \sum_{i=1}^{N} m_i \mathbf{v}_i = M\mathbf{v}_{\mathrm{cm}},
\]
where \(M = \sum m_i\) is the total mass and \(\mathbf{v}_{\mathrm{cm}}\) is the velocity of the center of mass.
</div>

The **impulse-momentum theorem** states that the impulse \(\mathbf{J}\) of a net force equals the change in momentum:

\[
\mathbf{J} = \int_{t_1}^{t_2} \mathbf{F}_{\mathrm{net}}\,dt = \Delta\mathbf{p}.
\]

## 7.2 Conservation of Momentum

<div class="theorem">
<strong>Conservation of Linear Momentum:</strong> If the net external force on a system is zero, the total momentum of the system is constant:
\[
\mathbf{F}_{\mathrm{ext}} = \frac{d\mathbf{P}}{dt} = 0 \implies \mathbf{P} = \mathrm{const}.
\]
</div>

This follows directly from Newton's third law: all internal forces cancel in pairs, so the total momentum changes only due to external forces. Conservation of momentum is more fundamental than Newton's laws: it holds in special relativity and quantum mechanics, arising from the translational symmetry of space (Noether's theorem).

## 7.3 Center of Mass

The **center of mass** (CoM) of a system is the mass-weighted average position of all particles:

\[
\mathbf{r}_{\mathrm{cm}} = \frac{\sum_i m_i \mathbf{r}_i}{\sum_i m_i} = \frac{1}{M}\sum_i m_i \mathbf{r}_i.
\]

For continuous bodies: \(\mathbf{r}_{\mathrm{cm}} = \frac{1}{M}\int \mathbf{r}\,dm\).

The remarkable result is that the CoM of any system moves exactly as if it were a single particle of mass \(M\) acted on by the net external force:

\[
\mathbf{F}_{\mathrm{ext}} = M\mathbf{a}_{\mathrm{cm}}.
\]

## 7.4 Collisions

Collisions are brief, intense force interactions during which the impulse from external forces is negligible compared to the internal collision forces, so momentum is conserved. They are classified by what happens to kinetic energy:

In an **elastic collision**, both momentum and kinetic energy are conserved. For a 1D collision between masses \(m_1\) (initial velocity \(v_{1i}\)) and \(m_2\) (initially at rest):

\[
v_{1f} = \frac{m_1 - m_2}{m_1 + m_2}v_{1i}, \qquad v_{2f} = \frac{2m_1}{m_1 + m_2}v_{1i}.
\]

In a **perfectly inelastic collision**, the objects stick together. Momentum is conserved, but kinetic energy is maximally lost:

\[
m_1 v_{1i} = (m_1 + m_2)v_f \implies v_f = \frac{m_1}{m_1 + m_2}v_{1i}.
\]

---

# Chapter 8: Rotational Kinematics

## 8.1 Angular Variables

For a rigid body rotating about a fixed axis, we introduce angular analogs of the linear kinematic quantities. Let \(\theta\) denote the angular position (radians). Then:

\[
\omega = \frac{d\theta}{dt} \quad (\text{angular velocity, rad/s}), \qquad \alpha = \frac{d\omega}{dt} = \frac{d^2\theta}{dt^2} \quad (\text{angular acceleration, rad/s}^2).
\]

A point at radius \(r\) from the axis has linear speed \(v = r\omega\) and linear (tangential) acceleration \(a_t = r\alpha\). The centripetal acceleration remains \(a_c = r\omega^2 = v^2/r\).

For constant angular acceleration, the rotational kinematic equations mirror exactly the translational ones:

\[
\omega = \omega_0 + \alpha t, \qquad \theta = \theta_0 + \omega_0 t + \tfrac{1}{2}\alpha t^2, \qquad \omega^2 = \omega_0^2 + 2\alpha(\theta - \theta_0).
\]

## 8.2 Moment of Inertia

The rotational analog of mass is the **moment of inertia** \(I\), which quantifies how the mass is distributed relative to the rotation axis:

\[
I = \sum_i m_i r_i^2 \quad \text{(discrete)}, \qquad I = \int r^2\,dm \quad \text{(continuous)}.
\]

The moment of inertia depends not only on the total mass but also on its geometric distribution. Common results include:

- Thin ring (mass \(M\), radius \(R\), axis through center perpendicular to plane): \(I = MR^2\)
- Solid disk (same geometry): \(I = \frac{1}{2}MR^2\)
- Solid sphere (axis through center): \(I = \frac{2}{5}MR^2\)
- Thin rod (mass \(M\), length \(L\), axis through center): \(I = \frac{1}{12}ML^2\)
- Thin rod (axis through end): \(I = \frac{1}{3}ML^2\)

The **parallel-axis theorem** relates the moment of inertia about any axis to the moment about a parallel axis through the CoM:

\[
I = I_{\mathrm{cm}} + Md^2,
\]

where \(d\) is the perpendicular distance between the two axes.

---

# Chapter 9: Rotational Dynamics, Angular Momentum, and Torque

## 9.1 Torque

Just as force is the cause of translational acceleration, **torque** is the cause of angular acceleration. The torque of a force \(\mathbf{F}\) applied at position \(\mathbf{r}\) from the pivot is:

\[
\boldsymbol{\tau} = \mathbf{r} \times \mathbf{F},
\]

with magnitude \(\tau = rF\sin\phi\), where \(\phi\) is the angle between \(\mathbf{r}\) and \(\mathbf{F}\). The quantity \(r\sin\phi\) is the **moment arm** — the perpendicular distance from the pivot to the line of action of the force.

## 9.2 Newton's Second Law for Rotation

<div class="theorem">
For a rigid body rotating about a fixed axis, Newton's second law in rotational form is
\[
\tau_{\mathrm{net}} = I\alpha,
\]
where \(\tau_{\mathrm{net}}\) is the net torque about the axis, \(I\) is the moment of inertia about that axis, and \(\alpha\) is the angular acceleration.
</div>

This is derived by summing \(\mathbf{F} = m\mathbf{a}\) for every mass element in the body, taking the torque of each, and noting that all internal forces cancel (Newton's third law).

## 9.3 Rotational Kinetic Energy and Work

A rotating rigid body has **rotational kinetic energy**:

\[
K_{\mathrm{rot}} = \frac{1}{2}I\omega^2.
\]

For rolling without slipping (a wheel of radius \(R\)), the total kinetic energy is translational plus rotational:

\[
K_{\mathrm{total}} = \frac{1}{2}Mv_{\mathrm{cm}}^2 + \frac{1}{2}I_{\mathrm{cm}}\omega^2 = \frac{1}{2}\left(M + \frac{I_{\mathrm{cm}}}{R^2}\right)v_{\mathrm{cm}}^2,
\]

using the rolling constraint \(v_{\mathrm{cm}} = R\omega\). The work done by a torque is \(W = \int \tau\,d\theta\), and the rotational work-energy theorem is \(\tau_{\mathrm{net}} = I\alpha \implies W = \Delta K_{\mathrm{rot}}\).

## 9.4 Angular Momentum

<div class="definition">
The <strong>angular momentum</strong> of a particle about a point O is
\[
\mathbf{L} = \mathbf{r} \times \mathbf{p} = \mathbf{r} \times m\mathbf{v},
\]
with magnitude \(L = rmv\sin\phi\). For a rigid body rotating about a symmetry axis, \(L = I\omega\).
</div>

<div class="theorem">
<strong>Newton's Second Law for Angular Momentum:</strong>
\[
\boldsymbol{\tau}_{\mathrm{net}} = \frac{d\mathbf{L}}{dt}.
\]
When the net external torque about a point is zero, angular momentum about that point is conserved.
</div>

Conservation of angular momentum explains the remarkable acceleration of a spinning figure skater who pulls in their arms: with no external torque, \(L = I\omega = \mathrm{const}\), so reducing \(I\) (by decreasing the distribution of mass from the axis) forces \(\omega\) to increase.

## 9.5 Static Equilibrium

A rigid body is in **static equilibrium** when it is at rest and remains so. This requires both:

\[
\sum \mathbf{F}_{\mathrm{ext}} = \mathbf{0} \quad \text{(translational equilibrium)},
\]

\[
\sum \boldsymbol{\tau}_{\mathrm{ext}} = \mathbf{0} \quad \text{(rotational equilibrium, about any point)}.
\]

These conditions yield a system of equations for the unknown forces (reaction forces, tensions, normal forces) that maintain the equilibrium. The freedom to choose any point as the torque pivot is a useful tool — choosing the point where an unknown force acts eliminates that force from the torque equation.

<div class="example">
<strong>Ladder problem.</strong> A uniform ladder of mass \(m\) and length \(L\) leans against a frictionless wall at angle \(\theta\) from the floor. The floor provides both normal force \(N_f\) and friction \(f\). Translational equilibrium: \(f = N_w\) (horizontal), \(N_f = mg\) (vertical). Taking torques about the base of the ladder: \(N_w L\sin\theta = mg\frac{L}{2}\cos\theta\), giving \(N_w = \frac{mg}{2\tan\theta}\). The required friction is thus \(f = \frac{mg}{2\tan\theta}\), and the ladder is safe only if \(f \leq \mu_s N_f = \mu_s mg\), i.e., \(\tan\theta \geq \frac{1}{2\mu_s}\).
</div>

---

# Chapter 10: Synthesis and Review

## 10.1 The Conservation Laws as a Unified Framework

Classical mechanics can be seen as the interplay of three great conservation principles:

**Conservation of energy** follows from the time-translation symmetry of the laws of physics — the fact that the rules do not change from day to day (Noether's theorem). When no non-conservative forces act, mechanical energy \(E = K + U\) is a constant of the motion.

**Conservation of linear momentum** follows from spatial translation symmetry — the laws are the same everywhere in space. When the net external force on a system is zero, \(\mathbf{P}\) is constant.

**Conservation of angular momentum** follows from rotational symmetry — the laws are the same in all directions. When the net external torque is zero, \(\mathbf{L}\) is constant.

These conservation laws are not merely useful computational tricks; they express the deepest symmetries of the physical world and continue to hold in the quantum and relativistic realms.

## 10.2 Comparison of Translational and Rotational Mechanics

| Translational | Rotational |
|---|---|
| Position \(x\) | Angle \(\theta\) |
| Velocity \(v = \dot{x}\) | Angular velocity \(\omega = \dot{\theta}\) |
| Acceleration \(a = \dot{v}\) | Angular acceleration \(\alpha = \dot{\omega}\) |
| Mass \(m\) | Moment of inertia \(I\) |
| Force \(F\) | Torque \(\tau\) |
| Newton's 2nd: \(F = ma\) | Rotation: \(\tau = I\alpha\) |
| Momentum \(p = mv\) | Angular momentum \(L = I\omega\) |
| Kinetic energy \(\frac{1}{2}mv^2\) | Rotational K.E. \(\frac{1}{2}I\omega^2\) |
| Work \(W = F\cdot x\) | Rotational work \(W = \tau\cdot\theta\) |

This parallelism is not accidental — it reflects the geometric structure of Newtonian mechanics and provides a powerful mnemonic for rotating the translational results into their rotational counterparts.
