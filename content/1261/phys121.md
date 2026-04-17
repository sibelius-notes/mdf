---
title: "PHYS 121: Mechanics"
subjects: "PHYS"
prof: "Peter Neathway"
---

## Sources and References

**Primary textbook** — Young, H. D. and Freedman, R. A., *University Physics with Modern Physics*, 15th ed. (Pearson, 2020). Chapters 1–10.

**Supplementary texts** — Kleppner, D. and Kolenkow, R. J., *An Introduction to Mechanics*, 2nd ed. (Cambridge University Press, 2014); Taylor, J. R., *Classical Mechanics* (University Science Books, 2005).

**Online resources** — Fitzpatrick, R., *Classical Mechanics*, farside.ph.utexas.edu; Tong, D., *Lectures on Classical Dynamics*, damtp.cam.ac.uk; MIT OpenCourseWare 8.01 (Physics I: Classical Mechanics).

---

# Chapter 1: Doing Physics — Quantities, Dimensions, and Units

## 1.1 The Nature of Physical Law

Physics is, at its core, the discipline that attempts to compress the infinite complexity of the natural world into a small number of precise, predictive statements. Every such statement — every physical law — is a mathematical relation between measurable quantities. Before we can write down Newton's second law or the work-energy theorem, we must be absolutely clear about what we mean by a measurable quantity, how quantities are classified by their dimension, and how the choice of units affects the numerical values we assign to those quantities without changing the underlying physical content.

A **physical quantity** is any property of the natural world that can be assigned a numerical value by means of a measurement process. The height of a building, the speed of a car, the temperature of a gas, the mass of an electron — all are physical quantities. Crucially, a physical quantity is not just a number; it is a number together with a unit that specifies the scale of measurement. Writing that the height of a building is "forty-five" is meaningless unless we specify whether those units are metres, feet, or cubits. The number and the unit are inseparable.

Physical quantities are divided into two broad classes. **Scalar quantities** are fully specified by a single number (together with a unit): mass, temperature, electric charge, and speed are scalars. **Vector quantities** require both a magnitude (a non-negative number with a unit) and a direction in space: velocity, force, acceleration, and momentum are vectors. This distinction is not merely terminological. Scalars obey the ordinary algebra of real numbers, while vectors obey the rules of vector algebra — rules that become essential when we move from one-dimensional motion to the richer geometry of motion in two and three dimensions.

## 1.2 Dimensional Analysis

Every physical quantity has a **dimension** — an abstract quality that indicates what kind of quantity it is, independent of the particular units chosen to measure it. In classical mechanics, three independent base dimensions suffice: **length** (symbol \(\mathsf{L}\)), **mass** (symbol \(\mathsf{M}\)), and **time** (symbol \(\mathsf{T}\)). Every mechanical quantity can be expressed as a product of powers of these three base dimensions. Speed has dimension \(\mathsf{L}\,\mathsf{T}^{-1}\); force has dimension \(\mathsf{M}\,\mathsf{L}\,\mathsf{T}^{-2}\); energy has dimension \(\mathsf{M}\,\mathsf{L}^2\,\mathsf{T}^{-2}\).

The **principle of dimensional homogeneity** states that every term in a physically valid equation must have the same dimension. This is not a law of physics but a logical necessity: you cannot add a length to a time any more than you can add apples to oranges. The principle provides a powerful consistency check on derived formulas and can even be used to deduce the form of a result before carrying out a full calculation, a technique known as **dimensional analysis** or Rayleigh's method.

<div class="example">
<strong>Example 1.1: Period of a Simple Pendulum by Dimensional Analysis.</strong> A simple pendulum consists of a mass \(m\) on a string of length \(L\) in a gravitational field of strength \(g\). We wish to find how the period \(T_\text{pend}\) depends on these quantities. The period is a time, so \(\left[T_\text{pend}\right] = \mathsf{T}\). Write \(T_\text{pend} = C\, m^a\, L^b\, g^c\) where \(C\) is a dimensionless constant. Since \(\left[m\right] = \mathsf{M}\), \(\left[L\right] = \mathsf{L}\), and \(\left[g\right] = \mathsf{L}\,\mathsf{T}^{-2}\), dimensional balance requires \(\mathsf{T}^1 = \mathsf{M}^a\,\mathsf{L}^{b+c}\,\mathsf{T}^{-2c}\). Matching exponents: \(a = 0\) (period is independent of mass), \(b + c = 0\), \(-2c = 1\), giving \(c = -1/2\), \(b = 1/2\). Therefore \(T_\text{pend} = C\sqrt{L/g}\). The full calculation gives \(C = 2\pi\), but dimensional analysis alone reveals the functional dependence and the surprising independence from mass.
</div>

The International System of Units (SI) adopts as its base units the metre (m) for length, the kilogram (kg) for mass, and the second (s) for time. All derived units are built from these: the newton (N = kg m s\(^{-2}\)), the joule (J = kg m\(^2\) s\(^{-2}\)), the watt (W = kg m\(^2\) s\(^{-3}\)), and so on. Significant figures represent one of the most practically important skills in experimental science. A quantity reported as 3.7 m has two significant figures and implies a precision of roughly \(\pm 0.05\) m. Rules for propagating significant figures through arithmetic operations ensure that calculated results honestly reflect the precision of the input measurements. The number of significant figures in a product or quotient equals the number in the least precise input; for sums and differences, it is the decimal place of the least precise input that governs.

## 1.3 Vectors and Vector Algebra

Since so many of the central quantities in mechanics are vectors, a firm grasp of vector algebra is prerequisite to everything that follows. A vector \(\mathbf{A}\) in three-dimensional Euclidean space is represented in a Cartesian coordinate system by its three components:

\[
\mathbf{A} = A_x\,\hat{x} + A_y\,\hat{y} + A_z\,\hat{z}
\]

where \(\hat{x}\), \(\hat{y}\), \(\hat{z}\) (also written \(\hat{\imath}\), \(\hat{\jmath}\), \(\hat{k}\)) are the unit vectors pointing along the positive coordinate axes. The **magnitude** of \(\mathbf{A}\) is \(|\mathbf{A}| = \sqrt{A_x^2 + A_y^2 + A_z^2}\). A **unit vector** in the direction of \(\mathbf{A}\) is \(\hat{A} = \mathbf{A}/|\mathbf{A}|\), which has magnitude 1 and carries only directional information.

Vector addition is performed component-by-component: if \(\mathbf{B} = B_x\hat{x} + B_y\hat{y} + B_z\hat{z}\), then \(\mathbf{A} + \mathbf{B} = (A_x+B_x)\hat{x} + (A_y+B_y)\hat{y} + (A_z+B_z)\hat{z}\). Geometrically, vector addition follows the parallelogram law or equivalently the head-to-tail rule. This geometric picture is often more physically transparent than the algebraic one: to find the net displacement after two successive displacements, place the tail of the second arrow at the tip of the first and the resultant vector runs from the tail of the first to the tip of the second. Multiplication of a vector by a scalar \(c\) scales all components without changing direction (if \(c > 0\)) or reversing it (if \(c < 0\)).

Two products between vectors are central to mechanics. The **dot product** (scalar product) is:

\[
\mathbf{A}\cdot\mathbf{B} = A_x B_x + A_y B_y + A_z B_z = |\mathbf{A}||\mathbf{B}|\cos\theta
\]

where \(\theta\) is the angle between the two vectors. The dot product is a scalar, it vanishes when the vectors are perpendicular, and it equals the product of the magnitudes when the vectors are parallel. The dot product appears naturally in the definition of work: the work done by a force \(\mathbf{F}\) over a displacement \(\mathbf{d}\) is \(W = \mathbf{F}\cdot\mathbf{d} = Fd\cos\phi\), where \(\phi\) is the angle between force and displacement. A force perpendicular to the displacement does zero work.

The **cross product** (vector product) produces a new vector perpendicular to both input vectors:

\[
\mathbf{A}\times\mathbf{B} = \begin{vmatrix} \hat{x} & \hat{y} & \hat{z} \\ A_x & A_y & A_z \\ B_x & B_y & B_z \end{vmatrix} = (A_yB_z - A_zB_y)\hat{x} - (A_xB_z - A_zB_x)\hat{y} + (A_xB_y - A_yB_x)\hat{z}
\]

The magnitude is \(|\mathbf{A}\times\mathbf{B}| = |\mathbf{A}||\mathbf{B}|\sin\theta\), and its direction is given by the right-hand rule: point the fingers of the right hand in the direction of \(\mathbf{A}\), curl them toward \(\mathbf{B}\), and the thumb points along \(\mathbf{A}\times\mathbf{B}\). The cross product is anti-commutative: \(\mathbf{A}\times\mathbf{B} = -\mathbf{B}\times\mathbf{A}\). It vanishes when the vectors are parallel. The cross product appears in the definitions of torque (\(\boldsymbol{\tau} = \mathbf{r}\times\mathbf{F}\)) and angular momentum (\(\mathbf{L} = \mathbf{r}\times\mathbf{p}\)), and its magnitude equals the area of the parallelogram spanned by \(\mathbf{A}\) and \(\mathbf{B}\), a geometric interpretation that is often useful in computing areas and volumes.

---

# Chapter 2: Kinematics in One Dimension

## 2.1 Position, Displacement, Velocity, and Acceleration

Kinematics is the description of motion without reference to its causes. We ask: given a specification of how an object moves, what can we say about its position, velocity, and acceleration at every moment? The causal question — why does it move as it does? — is the province of dynamics, treated in the next chapter.

For a particle moving along a straight line, we choose a coordinate axis (say, the \(x\)-axis) and describe the particle's location by its position \(x(t)\), a signed real number that encodes both how far from the origin and on which side. The choice of origin and positive direction is arbitrary, but once made, it must be held fixed throughout a problem. The **displacement** during a time interval from \(t_1\) to \(t_2\) is:

\[
\Delta x = x(t_2) - x(t_1)
\]

This is distinct from the **distance travelled**, which is the total path length and is always non-negative. A particle that travels 5 m to the right and then 3 m to the left has displacement \(+2\) m but has travelled a distance of 8 m. Both quantities are physically meaningful in different contexts: displacement determines where the particle ends up, while distance determines how much ground it has covered.

The **average velocity** over the interval \(\left[t_1, t_2\right]\) is:

\[
\bar{v} = \frac{\Delta x}{\Delta t} = \frac{x(t_2) - x(t_1)}{t_2 - t_1}
\]

The **instantaneous velocity** is the limiting value of this average as the time interval shrinks to zero — it is the derivative of position with respect to time:

\[
v(t) = \lim_{\Delta t \to 0} \frac{\Delta x}{\Delta t} = \frac{dx}{dt}
\]

The magnitude of the instantaneous velocity is the **speed**. Similarly, the **average acceleration** is \(\bar{a} = \Delta v / \Delta t\), and the **instantaneous acceleration** is:

\[
a(t) = \frac{dv}{dt} = \frac{d^2x}{dt^2}
\]

These definitions make no assumption about the form of the motion — they apply whether the particle moves at constant speed, uniformly accelerates, or undergoes complicated oscillatory motion. The fundamental relationship is that velocity is the first time derivative of position and acceleration is the second, connecting kinematic quantities through the machinery of calculus.

## 2.2 Deriving the Kinematic Equations from Calculus

The kinematic equations for **constant acceleration** are so central to introductory mechanics that they deserve a full derivation from the definitions above, not merely a presentation of results. Suppose the acceleration \(a\) is constant. Starting from the definition:

\[
a = \frac{dv}{dt} = \text{const}
\]

Integrating both sides with respect to time from \(t = 0\) to \(t\):

\[
\int_0^t a\, dt' = \int_0^t \frac{dv}{dt'}\, dt' = v(t) - v(0)
\]

The left side is \(at\) (since \(a\) is constant), giving:

\[
v(t) = v_0 + at \tag{K1}
\]

where \(v_0 = v(0)\) is the initial velocity. Now integrate again: since \(v = dx/dt\):

\[
\int_0^t v(t')\, dt' = \int_0^t (v_0 + at')\, dt' = v_0 t + \frac{1}{2}at^2
\]

The left side equals \(x(t) - x(0) = x(t) - x_0\), so:

\[
x(t) = x_0 + v_0 t + \frac{1}{2}at^2 \tag{K2}
\]

A third equation, independent of time, is obtained by eliminating \(t\) from (K1) and (K2). From (K1), \(t = (v - v_0)/a\). Substituting into (K2) and simplifying algebraically:

\[
x - x_0 = v_0\!\left(\frac{v-v_0}{a}\right) + \frac{1}{2}a\!\left(\frac{v-v_0}{a}\right)^2 = \frac{v_0(v-v_0)}{a} + \frac{(v-v_0)^2}{2a}
\]

Multiplying through by \(2a\) and expanding:

\[
2a(x - x_0) = 2v_0(v-v_0) + (v-v_0)^2 = 2v_0 v - 2v_0^2 + v^2 - 2v_0 v + v_0^2 = v^2 - v_0^2
\]

Therefore:

\[
v^2 = v_0^2 + 2a(x - x_0) \tag{K3}
\]

A fourth useful relation follows from averaging: when acceleration is constant, the average velocity over any interval equals the average of the initial and final velocities: \(\bar{v} = (v_0 + v)/2\), giving \(x - x_0 = \frac{1}{2}(v_0 + v)t\). These four equations form the complete set of constant-acceleration kinematic equations. Every standard problem involving uniformly accelerating objects — projectiles, cars braking, balls in free fall — is solved by selecting whichever equations connect the known and unknown quantities. It is good practice to identify the five kinematic variables (\(x - x_0\), \(v_0\), \(v\), \(a\), \(t\)) and note which three are given, since any two of the four equations then suffice.

## 2.3 Free Fall Under Gravity

The most important application of constant-acceleration kinematics is **free fall** — motion under the influence of gravity alone, with air resistance neglected. Near the Earth's surface, all objects fall with the same downward acceleration \(g \approx 9.80\) m/s\(^2\), regardless of their mass. This fact, empirically established by Galileo's inclined-plane experiments in the early 17th century and now understood as a consequence of the equivalence of gravitational and inertial mass, is one of the most profound regularities in mechanics.

Taking upward as positive and the release point as origin, an object thrown upward with initial speed \(v_0\) has position \(y(t) = v_0 t - \frac{1}{2}gt^2\) and velocity \(v(t) = v_0 - gt\). The object reaches its maximum height when \(v = 0\), i.e., at time \(t^* = v_0/g\), at which point \(y_\max = v_0^2/(2g)\). By symmetry (the motion is time-reversible in the absence of air resistance), the object returns to its starting height with speed \(v_0\) downward, having been in the air for time \(2t^* = 2v_0/g\).

<div class="example">
<strong>Example 2.1: Ball Thrown Upward.</strong> A ball is thrown straight up with initial speed \(v_0 = 25\) m/s from a height of 2 m above the ground. Find the maximum height above the ground and the time it takes to hit the ground.

Maximum height above throw point: \(H = v_0^2/(2g) = 625/19.6 \approx 31.9\) m. Maximum height above ground: \(31.9 + 2 = 33.9\) m.

Time to hit ground: set \(y(t) = -2\) m (ground is 2 m below throw point): \(-2 = 25t - \frac{1}{2}(9.80)t^2\). Rearranging: \(4.9t^2 - 25t - 2 = 0\). Quadratic formula gives \(t = (25 + \sqrt{625 + 39.2})/9.8 \approx 5.19\) s. The negative root is rejected as it corresponds to time before the throw.
</div>

## 2.4 Graphical Kinematics

The calculus definitions of velocity and acceleration have immediate graphical interpretations. On an \(x\)-vs-\(t\) graph, the **instantaneous velocity** at any time is the **slope** of the tangent line to the curve at that point. A steep positive slope means high speed in the positive direction; a negative slope means the object is moving backward; zero slope means the object is momentarily at rest. On a \(v\)-vs-\(t\) graph, the **instantaneous acceleration** is the slope of the tangent to the velocity curve, and the **displacement** during any time interval \(\left[t_1, t_2\right]\) is the **area under the curve** — that is, \(\int_{t_1}^{t_2} v(t)\, dt = x(t_2) - x(t_1)\). Areas above the \(t\)-axis (positive velocity regions) represent forward displacement; areas below represent backward displacement.

This integral interpretation allows the computation of displacement even when velocity is non-uniform, without necessarily knowing the analytical form of \(v(t)\). Reading a \(v\)-vs-\(t\) graph graphically — measuring slopes and areas — is a fundamental skill that directly connects calculus to physical measurement.

---

# Chapter 3: Kinematics in Two and Three Dimensions

## 3.1 Position, Velocity, and Acceleration Vectors

In two or three dimensions, the position of a particle is described by a position vector \(\mathbf{r}(t)\) pointing from the origin to the particle's location:

\[
\mathbf{r}(t) = x(t)\,\hat{x} + y(t)\,\hat{y} + z(t)\,\hat{z}
\]

The **velocity vector** is the time derivative of the position vector:

\[
\mathbf{v}(t) = \frac{d\mathbf{r}}{dt} = \dot{x}\,\hat{x} + \dot{y}\,\hat{y} + \dot{z}\,\hat{z}
\]

The velocity vector is always **tangent to the trajectory** of the particle — this is a geometric fact that follows from the definition of the derivative as the limit of a difference quotient. As \(\Delta t \to 0\), the direction of \(\Delta\mathbf{r}/\Delta t\) approaches the direction of the tangent to the curve at the current point. The **speed** is the magnitude \(|\mathbf{v}|\). The **acceleration vector** is:

\[
\mathbf{a}(t) = \frac{d\mathbf{v}}{dt} = \frac{d^2\mathbf{r}}{dt^2} = \ddot{x}\,\hat{x} + \ddot{y}\,\hat{y} + \ddot{z}\,\hat{z}
\]

The key insight of vector kinematics is that the three Cartesian components of motion are **independent** of one another. A particle moving in two dimensions under constant acceleration therefore decomposes into two independent one-dimensional problems, each governed by the equations of Chapter 2.

## 3.2 Projectile Motion

The archetypal two-dimensional kinematics problem is **projectile motion**: an object launched with initial speed \(v_0\) at angle \(\theta\) above the horizontal, moving under constant gravitational acceleration \(\mathbf{a} = -g\hat{y}\) with no air resistance. The initial velocity components are \(v_{0x} = v_0\cos\theta\) and \(v_{0y} = v_0\sin\theta\).

Because horizontal and vertical motions are independent, they can be written separately. Horizontally (no acceleration):

\[
x(t) = (v_0\cos\theta)\,t
\]

Vertically (constant downward acceleration \(g\)):

\[
y(t) = (v_0\sin\theta)\,t - \frac{1}{2}g t^2
\]

The trajectory — the curve \(y\) as a function of \(x\) — is found by eliminating \(t\). From the horizontal equation, \(t = x/(v_0\cos\theta)\). Substituting:

\[
y = x\tan\theta - \frac{g}{2v_0^2\cos^2\theta}\,x^2
\]

This is a **parabola** opening downward — the trajectory of projectile motion is always a parabola in the absence of air resistance. The coefficient of \(x^2\) is \(-g/(2v_0^2\cos^2\theta)\), which becomes flatter as \(v_0\) increases (faster launches reach farther before drooping). The **range** \(R\) is found by setting \(y = 0\):

\[
R = \frac{v_0^2\sin 2\theta}{g}
\]

This shows that the maximum range occurs at \(\theta = 45°\) (since \(\sin 2\theta\) is maximized when \(2\theta = 90°\)) and that complementary angles (\(\theta\) and \(90° - \theta\)) give the same range. The **maximum height** is:

\[
H = \frac{v_0^2\sin^2\theta}{2g}
\]

Real projectile motion is significantly modified by air resistance. For a sphere of radius \(r\) and mass \(m\) moving through air at speed \(v\), the drag force is approximately \(F_\text{drag} = \frac{1}{2}C_D\rho_\text{air}\pi r^2 v^2\), where \(C_D \approx 0.47\) for a sphere. The ratio of drag to weight is \(F_\text{drag}/(mg)\), which is small for dense, compact objects (bullets) but large for lightweight objects (badminton shuttlecocks, raindrops). When drag is important, the range-maximizing angle is less than 45° and the trajectory is no longer a parabola.

## 3.3 Circular Motion

A particle moving in a circle of radius \(R\) at constant speed \(v\) traces a position given by:

\[
\mathbf{r}(t) = R\cos(\omega t)\hat{x} + R\sin(\omega t)\hat{y}
\]

where \(\omega = v/R\) is the **angular velocity** (in rad/s). Differentiating:

\[
\mathbf{v}(t) = -R\omega\sin(\omega t)\hat{x} + R\omega\cos(\omega t)\hat{y}, \qquad |\mathbf{v}| = R\omega = v
\]

Differentiating again:

\[
\mathbf{a}(t) = -R\omega^2\cos(\omega t)\hat{x} - R\omega^2\sin(\omega t)\hat{y} = -\omega^2\mathbf{r}(t)
\]

The acceleration points **toward the centre** (centripetal) and has magnitude:

\[
a_c = \omega^2 R = \frac{v^2}{R}
\]

Even at constant speed, circular motion requires an inward acceleration of magnitude \(v^2/R\). The force responsible — whatever keeps the particle on its circular path — must have magnitude:

\[
F_c = m\,\frac{v^2}{R}
\]

directed inward. For a satellite orbiting Earth at radius \(r\), the centripetal force is provided by gravity: \(GMm/r^2 = mv^2/r\), giving \(v = \sqrt{GM/r}\). The orbital period is \(T = 2\pi r/v = 2\pi r^{3/2}/\sqrt{GM}\) — this is Kepler's third law for circular orbits.

When a particle moves in a circle but changes its speed, there is also a tangential acceleration \(a_t = dv/dt\) along the direction of motion. The total acceleration then has two components: \(a_c = v^2/R\) (centripetal, inward) and \(a_t = dv/dt\) (tangential, along the velocity). These are perpendicular, so the total magnitude is \(a = \sqrt{a_c^2 + a_t^2}\).

---

# Chapter 4: Newton's Laws of Motion

## 4.1 Historical Context and the Conceptual Revolution

Newton's three laws of motion, presented in his 1687 masterwork *Philosophiae Naturalis Principia Mathematica*, represent one of the greatest intellectual achievements in human history. They unified terrestrial and celestial mechanics under a single mathematical framework, explained phenomena ranging from the tides to planetary orbits, and provided the foundation on which virtually all of classical physics rests. Understanding their content requires appreciating both what they say and the conceptual context from which they emerged.

Before Newton, the prevailing view of motion — inherited from Aristotle — held that objects require a continuous cause to keep moving. A cart on a road was thought to be pushed by the air rushing in behind it. This view seems natural because in everyday experience, objects do indeed slow down and stop without an applied force — but this deceleration is caused by friction and air resistance, forces that are present but often overlooked. The genius of Galileo and Newton was to mentally strip away these dissipative forces and recognize that motion at constant velocity requires no cause — only changes in motion do.

## 4.2 Newton's First Law

<div class="theorem">
<strong>Newton's First Law (Law of Inertia).</strong> A body remains at rest, or in uniform motion in a straight line, unless it is acted upon by a net external force.
</div>

The first law does two things. First, it defines a special class of reference frames — **inertial reference frames** — in which the law holds. Any frame moving at constant velocity with respect to an inertial frame is itself inertial; any accelerating frame is non-inertial. Second, it establishes that the natural state of matter is motion at constant velocity, not rest. This is deeply non-Aristotelian: there is no fundamental difference between rest and uniform motion — both are states that require no ongoing cause.

**Inertia** is the tendency of an object to resist changes in its state of motion. A more massive object has more inertia — it is harder to accelerate. The first law operationally defines force: a **force** is any influence that changes a body's state of motion. Without this law, the concept of force would be circular.

## 4.3 Newton's Second Law

<div class="theorem">
<strong>Newton's Second Law.</strong> The net force on an object equals the rate of change of its momentum:

\[
\mathbf{F}_\text{net} = \frac{d\mathbf{p}}{dt}
\]
where \(\mathbf{p} = m\mathbf{v}\) is the linear momentum. For constant mass, this reduces to \(\mathbf{F}_\text{net} = m\mathbf{a}\).
</div>

The force is the **net** (resultant) force — the vector sum of all forces acting on the body. The body responds only to this total force. The acceleration is always in the same direction as the net force. Mass \(m\) is the **inertial mass** — the measure of resistance to acceleration. In component form:

\[
F_{\text{net},x} = ma_x, \qquad F_{\text{net},y} = ma_y, \qquad F_{\text{net},z} = ma_z
\]

This component decomposition is the standard starting point for dynamics problems. A careful free-body diagram — showing the object in isolation with all forces acting on it — is an essential preliminary step. The forces that appear in the free-body diagram are exactly those that appear in Newton's second law for that object; no others.

The SI unit of force is the **newton**: 1 N = 1 kg m s\(^{-2}\). A useful benchmark: a force of 1 N equals the weight (gravitational force) of approximately 100 g of mass at the Earth's surface.

## 4.4 Newton's Third Law

<div class="theorem">
<strong>Newton's Third Law (Action-Reaction).</strong> If object A exerts a force on object B, then object B exerts an equal and opposite force on object A:

\[
\mathbf{F}_{A\to B} = -\mathbf{F}_{B\to A}
\]
</div>

The two forces in Newton's third law act on **different objects**. They cannot cancel each other in a free-body diagram because each belongs to a different system. When you push on a wall, the wall pushes back on you with equal force — the two forces affect different objects (you and the wall). The third law ensures that momentum is conserved in isolated systems and that internal forces within a system always cancel in pairs.

## 4.5 Common Forces in Mechanics

**Weight** is the gravitational force on an object near the Earth's surface: \(\mathbf{W} = m\mathbf{g}\), where \(g \approx 9.80\) m/s\(^2\) directed downward. Weight is not the same as mass; mass is an intrinsic property while weight depends on the gravitational environment.

**Normal force** is the contact force exerted by a surface perpendicular to the surface. It adjusts its value to whatever is needed to prevent interpenetration; it is not always equal to the weight. On an inclined plane at angle \(\theta\), if the object is not accelerating perpendicular to the surface, then \(N = mg\cos\theta\).

**Tension** is the pulling force in a string or rope. For a massless, inextensible string, the tension is the same throughout. For a string with mass \(m_\text{string}\) supporting a hanging object of mass \(M\), the tension varies along the string: it equals the weight of everything below a given point.

**Friction** resists relative motion between surfaces. **Static friction** \(f_s \leq \mu_s N\) prevents slipping up to a maximum value; **kinetic friction** \(f_k = \mu_k N\) (with \(\mu_k < \mu_s\) typically) opposes sliding once it begins. Both depend on the normal force but not on the contact area — a remarkable empirical fact first noted by Leonardo da Vinci and later systematized by Coulomb.

**Hooke's Law for Springs**: a spring stretched or compressed by \(x\) from its natural length exerts a restoring force \(F = -kx\), where \(k\) is the spring constant in N/m. This is valid for small deformations; real springs deviate from Hooke's law as \(x\) grows large.

## 4.6 Applications of Newton's Laws

The methodology for applying Newton's second law is systematic. Step one: identify all the objects whose motion is to be analysed. Step two: for each object, draw a complete free-body diagram showing every external force. Step three: choose a convenient coordinate system for each object (often aligned with the expected direction of motion or the surface geometry). Step four: resolve each force into its components along the chosen axes. Step five: apply Newton's second law independently in each coordinate direction. Step six: solve the resulting system of equations for the unknowns.

<div class="example">
<strong>Example 4.1: Block on Inclined Plane with Friction.</strong> A block of mass \(m = 5\) kg sits on a plane inclined at \(\theta = 30°\). The coefficient of kinetic friction is \(\mu_k = 0.2\). Find the acceleration as the block slides down.

Choose axes parallel and perpendicular to the incline. Forces: weight \(mg\) (decompose into \(mg\sin\theta\) down the slope and \(mg\cos\theta\) into the slope), normal force \(N\) perpendicular to slope (outward), kinetic friction \(f_k = \mu_k N\) up the slope (opposing downward sliding).

Perpendicular direction (no acceleration): \(N - mg\cos\theta = 0\), so \(N = mg\cos\theta = 5 \times 9.8 \times \cos 30° \approx 42.4\) N.

Parallel direction (positive down slope): \(mg\sin\theta - f_k = ma\), so:

\[
a = g(\sin\theta - \mu_k\cos\theta) = 9.8(\sin 30° - 0.2\cos 30°) = 9.8(0.500 - 0.173) \approx 3.20 \text{ m/s}^2
\]
</div>

---

# Chapter 5: Conservation of Energy

## 5.1 Work — The Scalar Measure of Force Acting Through Displacement

<div class="definition">
<strong>Work.</strong> The work done by a constant force \(\mathbf{F}\) on an object undergoing displacement \(\mathbf{d}\) is:

\[
W = \mathbf{F}\cdot\mathbf{d} = Fd\cos\phi
\]
where \(\phi\) is the angle between the force and displacement. For a variable force along a curved path, the work is the line integral:

\[
W = \int_{\mathbf{r}_1}^{\mathbf{r}_2} \mathbf{F}\cdot d\mathbf{r}
\]
</div>

Work is a scalar and can be positive, negative, or zero. A force perpendicular to the displacement does zero work. A force opposed to the displacement (like friction) does negative work, removing energy from the object. The unit of work is the joule (J = N m). The concept of work is deeply connected to energy: work done on an object is energy transferred to it.

## 5.2 The Work-Energy Theorem

<div class="theorem">
<strong>Work-Energy Theorem.</strong> The net work done on an object equals the change in its kinetic energy:

\[
W_\text{net} = \Delta K = \frac{1}{2}mv_f^2 - \frac{1}{2}mv_i^2
\]
</div>

<div class="proof">
<strong>Proof.</strong> For a particle of mass \(m\) under net force \(\mathbf{F}_\text{net}\), the net work is:

\[
W_\text{net} = \int_1^2 \mathbf{F}_\text{net}\cdot d\mathbf{r}
\]
By Newton's second law \(\mathbf{F}_\text{net} = m\,d\mathbf{v}/dt\), and writing \(d\mathbf{r} = \mathbf{v}\,dt\):

\[
W_\text{net} = \int_1^2 m\,\frac{d\mathbf{v}}{dt}\cdot\mathbf{v}\,dt = m\int_1^2 \frac{d}{dt}\!\left(\frac{v^2}{2}\right)\,dt = m\left[\frac{v^2}{2}\right]_1^2 = \frac{1}{2}mv_2^2 - \frac{1}{2}mv_1^2
\]
where we used the identity \(\mathbf{v}\cdot(d\mathbf{v}/dt) = \frac{d}{dt}(v^2/2)\).
</div>

The kinetic energy \(K = \frac{1}{2}mv^2\) depends only on speed. The work-energy theorem replaces the vector equation \(\mathbf{F} = m\mathbf{a}\) with a scalar equation, eliminating any need to track directions. It applies for any path, any forces, and any motion, as long as we correctly compute the net work along the actual path.

## 5.3 Conservative Forces and Potential Energy

A force is **conservative** if the work it does between two points is path-independent (equivalently, if the work done along any closed path is zero). Gravity and spring forces are conservative; friction is not.

For any conservative force, we define a **potential energy function** \(U(\mathbf{r})\) by:

\[
W_{1\to 2} = U(\mathbf{r}_1) - U(\mathbf{r}_2) = -\Delta U
\]

or equivalently, the force is the negative gradient of potential energy:

\[
\mathbf{F} = -\boldsymbol{\nabla} U = -\frac{\partial U}{\partial x}\hat{x} - \frac{\partial U}{\partial y}\hat{y} - \frac{\partial U}{\partial z}\hat{z}
\]

This gradient relationship has an intuitive reading: forces point in the direction of steepest decrease of potential energy. Objects naturally accelerate downhill in the potential energy landscape.

Standard potential energies in mechanics:
- Gravitational (near Earth's surface): \(U = mgy\) (zero at \(y = 0\))
- Gravitational (general): \(U = -GMm/r\) (zero at \(r \to \infty\))
- Elastic (spring): \(U = \frac{1}{2}kx^2\) (zero at natural length)

## 5.4 Conservation of Mechanical Energy

<div class="theorem">
<strong>Conservation of Mechanical Energy.</strong> When only conservative forces do work, the total mechanical energy \(E = K + U\) is conserved:

\[
K_i + U_i = K_f + U_f
\]
</div>

The proof follows directly from decomposing \(W_\text{net}\) into conservative and non-conservative parts, applying the work-energy theorem, and noting that \(W_\text{cons} = -\Delta U\). When \(W_\text{non-cons} = 0\), we get \(\Delta K + \Delta U = 0\), i.e., \(\Delta E = 0\).

This conservation law is extraordinarily powerful. It converts what would otherwise be complicated equations of motion into a single algebraic equation relating initial and final states. We need know nothing about the intermediate path.

When non-conservative forces are present, the work-energy theorem gives:

\[
W_\text{non-cons} = \Delta E = \Delta K + \Delta U
\]

The work done by friction is always negative (friction removes mechanical energy), and the removed energy appears as internal (thermal) energy of the surfaces: \(\Delta E_\text{mechanical} + \Delta E_\text{thermal} = 0\). Total energy is always conserved; mechanical energy is conserved only in the absence of non-conservative forces.

<div class="example">
<strong>Example 5.1: Roller Coaster Loop.</strong> A roller coaster car of mass \(m = 500\) kg starts from rest at height \(h = 40\) m and goes around a vertical loop of radius \(R = 10\) m. What is the normal force from the track at the top of the loop?

By energy conservation from start to top of loop (height \(2R = 20\) m):

\[
mgh = \frac{1}{2}mv_t^2 + mg(2R) \implies v_t^2 = 2g(h - 2R) = 2(9.8)(20) = 392 \text{ m}^2/\text{s}^2
\]

At the top, both weight and normal force point inward (downward). Newton's second law in the radial direction:

\[
N + mg = \frac{mv_t^2}{R} \implies N = m\!\left(\frac{v_t^2}{R} - g\right) = 500\!\left(\frac{392}{10} - 9.8\right) = 500 \times 29.4 = 14{,}700 \text{ N}
\]

The minimum speed to maintain contact at the top requires \(N \geq 0\), giving \(v_t^2 \geq gR\), or \(h \geq 5R/2 = 25\) m. Since \(h = 40\) m \(> 25\) m, the car maintains contact.
</div>

---

# Chapter 6: Conservation of Linear Momentum

## 6.1 Linear Momentum and Impulse

The **linear momentum** of a particle is \(\mathbf{p} = m\mathbf{v}\). Newton's second law in its most general form is \(\mathbf{F}_\text{net} = d\mathbf{p}/dt\), which for constant mass reduces to \(\mathbf{F}_\text{net} = m\mathbf{a}\). The more general form applies to variable-mass systems (rockets, rain falling into a moving cart).

The **impulse** of a force over time interval \(\left[t_1, t_2\right]\) is:

\[
\mathbf{J} = \int_{t_1}^{t_2} \mathbf{F}\, dt = \Delta\mathbf{p} = \mathbf{p}_f - \mathbf{p}_i
\]

This impulse-momentum theorem is simply Newton's second law integrated over time. It is especially useful for impulsive forces (very large forces acting for very short times, as in collisions), where the average force \(\bar{F} = J/\Delta t\) during the collision can be enormous even though the impulse is finite.

## 6.2 Conservation of Momentum and Its Symmetry Origin

For a system of \(N\) particles, the total momentum is \(\mathbf{P} = \sum_i m_i\mathbf{v}_i\). By Newton's second and third laws, internal forces cancel in pairs, giving:

\[
\frac{d\mathbf{P}}{dt} = \mathbf{F}_\text{ext,total}
\]

<div class="theorem">
<strong>Conservation of Linear Momentum.</strong> If the net external force on a system is zero, the total linear momentum is constant:

\[
\mathbf{F}_\text{ext} = \mathbf{0} \implies \mathbf{P} = \text{constant}
\]
</div>

This conservation law is deeper than Newton's laws — it is a consequence of the **translational symmetry of space** (Noether's theorem, 1915). Emmy Noether proved that every continuous symmetry of a physical system corresponds to a conserved quantity. If the laws of physics are the same everywhere in space (no preferred location), then linear momentum must be conserved. This is not a coincidence but a deep mathematical necessity. Similarly, time-translation symmetry implies conservation of energy, and rotational symmetry implies conservation of angular momentum.

In practice, conservation of momentum is most powerful when external forces are negligible during a brief collision. The internal collision forces — which can be enormously large — act for a very short time, so their impulse dominates while the external forces contribute negligibly.

## 6.3 Collisions

In an **elastic collision**, both momentum and kinetic energy are conserved. For a one-dimensional elastic collision between mass \(m_1\) moving at \(v_{1i}\) and mass \(m_2\) at rest, the two conservation equations give:

\[
m_1 v_{1i} = m_1 v_{1f} + m_2 v_{2f}
\]

\[
\frac{1}{2}m_1 v_{1i}^2 = \frac{1}{2}m_1 v_{1f}^2 + \frac{1}{2}m_2 v_{2f}^2
\]

Factoring the second equation as \(m_1(v_{1i}-v_{1f})(v_{1i}+v_{1f}) = m_2 v_{2f}^2\) and combining with the first yields:

\[
v_{1f} = \frac{m_1 - m_2}{m_1 + m_2}\,v_{1i}, \qquad v_{2f} = \frac{2m_1}{m_1 + m_2}\,v_{1i}
\]

Limiting cases are illuminating: when \(m_1 = m_2\), \(v_{1f} = 0\) and \(v_{2f} = v_{1i}\) (the balls exchange velocities); when \(m_1 \gg m_2\), \(v_{1f} \approx v_{1i}\) and \(v_{2f} \approx 2v_{1i}\) (heavy ball barely slows, light ball flies off at twice the speed). These limits confirm that kinetic energy is transferred from heavy to light objects during elastic collisions, a principle exploited in billiards and molecular collisions alike.

In a **perfectly inelastic collision**, the objects stick together. Kinetic energy is not conserved (some converts to heat and deformation), but momentum is:

\[
\mathbf{p}_f = m_1\mathbf{v}_{1i} + m_2\mathbf{v}_{2i} = (m_1 + m_2)\mathbf{v}_f
\]

The fraction of kinetic energy lost is \(1 - m_1/(m_1+m_2)\) when the target is initially at rest — always a positive fraction, confirming that kinetic energy is always lost in inelastic collisions.

## 6.4 The Centre of Mass

The **centre of mass** of a system of particles is:

\[
\mathbf{r}_\text{cm} = \frac{\sum_i m_i\mathbf{r}_i}{M_\text{total}}
\]

For a continuous body: \(\mathbf{r}_\text{cm} = \frac{1}{M}\int \mathbf{r}\,\rho\,dV\). The centre of mass velocity is \(\mathbf{v}_\text{cm} = \mathbf{P}/M\), and Newton's second law for the system reads:

\[
\mathbf{F}_\text{ext} = M\mathbf{a}_\text{cm}
\]

The centre of mass moves exactly as if all the mass were concentrated there and all external forces acted on it. Internal forces — no matter how complicated — have zero effect on the motion of the centre of mass. A freely thrown wrench tumbles in complex ways, but its centre of mass follows a perfect parabola.

---

# Chapter 7: Rotational Kinematics and Dynamics

## 7.1 Angular Kinematic Variables

When a rigid body rotates about a fixed axis, all points in the body rotate by the same angle \(\theta\) in any given time. The angular kinematic variables are defined in direct analogy with their linear counterparts:

\[
\omega = \frac{d\theta}{dt}, \qquad \alpha = \frac{d\omega}{dt} = \frac{d^2\theta}{dt^2}
\]

For **constant angular acceleration**, integrating exactly as in the linear case:

\[
\omega(t) = \omega_0 + \alpha t \tag{R1}
\]

\[
\theta(t) = \theta_0 + \omega_0 t + \frac{1}{2}\alpha t^2 \tag{R2}
\]

\[
\omega^2 = \omega_0^2 + 2\alpha(\theta - \theta_0) \tag{R3}
\]

The connections between angular and linear quantities for a point at radius \(r\) from the axis: arc length \(s = r\theta\), tangential speed \(v_t = r\omega\), tangential acceleration \(a_t = r\alpha\), centripetal acceleration \(a_c = r\omega^2 = v_t^2/r\).

## 7.2 Moment of Inertia

The rotational analogue of mass is the **moment of inertia**:

\[
I = \sum_i m_i r_i^2 \quad \text{(discrete)} \qquad I = \int r^2\, dm \quad \text{(continuous)}
\]

where \(r_i\) is the perpendicular distance from the \(i\)th mass element to the rotation axis. The moment of inertia depends on the axis, unlike mass.

Standard results (all about axes through the centre of mass unless noted):

| Object | Axis | \(I\) |
|--------|------|-------|
| Thin rod, length \(L\) | Through centre, perpendicular to rod | \(\frac{1}{12}ML^2\) |
| Thin rod, length \(L\) | Through one end, perpendicular to rod | \(\frac{1}{3}ML^2\) |
| Solid cylinder/disk, radius \(R\) | Along symmetry axis | \(\frac{1}{2}MR^2\) |
| Solid sphere, radius \(R\) | Through centre | \(\frac{2}{5}MR^2\) |
| Thin spherical shell, radius \(R\) | Through centre | \(\frac{2}{3}MR^2\) |
| Thin ring/hoop, radius \(R\) | Along symmetry axis | \(MR^2\) |

The **Parallel Axis Theorem** allows moment of inertia about any axis to be computed from \(I_\text{cm}\):

\[
I = I_\text{cm} + Md^2
\]

where \(d\) is the distance between the two parallel axes.

<div class="proof">
<strong>Proof of Parallel Axis Theorem.</strong> Place the centre of mass at the origin, so \(\sum_i m_i\mathbf{r}_i = \mathbf{0}\). The new axis passes through a point at vector distance \(\mathbf{d}\) from the centre of mass (perpendicular to both axes). The distance from the \(i\)th particle to the new axis is \(|\mathbf{r}_i - \mathbf{d}|\):

\begin{align}
I &= \sum_i m_i|\mathbf{r}_i - \mathbf{d}|^2 = \sum_i m_i(r_i^2 - 2\mathbf{r}_i\cdot\mathbf{d} + d^2) \\
  &= \underbrace{\sum_i m_i r_i^2}_{I_\text{cm}} - 2\mathbf{d}\cdot\underbrace{\left(\sum_i m_i\mathbf{r}_i\right)}_{\mathbf{0}} + d^2\underbrace{\sum_i m_i}_{M} = I_\text{cm} + Md^2
\end{align}
</div>

## 7.3 Newton's Second Law for Rotation

<div class="theorem">
<strong>Rotational Newton's Second Law.</strong>

\[
\tau_\text{net} = I\alpha
\]
where \(\tau_\text{net}\) is the net torque about the rotation axis and \(I\) is the moment of inertia about that axis.
</div>

This can be derived from Newton's second law: for the \(i\)th particle at radius \(r_i\), the tangential component of Newton's second law gives \(F_{i,t} = m_i a_{i,t} = m_i r_i \alpha\). The torque of this force about the axis is \(\tau_i = r_i F_{i,t} = m_i r_i^2 \alpha\). Summing over all particles: \(\tau_\text{net,ext} = \left(\sum_i m_i r_i^2\right)\alpha = I\alpha\). (Internal forces between particles contribute equal and opposite torques that cancel.)

## 7.4 Rotational Kinetic Energy and Rolling

The kinetic energy of a rotating body is:

\[
K_\text{rot} = \frac{1}{2}I\omega^2
\]

This follows from summing \(\frac{1}{2}m_i v_i^2 = \frac{1}{2}m_i(r_i\omega)^2\) over all particles. For a body that both translates and rotates without slipping on a surface, with constraint \(v_\text{cm} = R\omega\):

\[
K_\text{total} = \frac{1}{2}Mv_\text{cm}^2 + \frac{1}{2}I_\text{cm}\omega^2 = \frac{1}{2}Mv_\text{cm}^2\!\left(1 + \frac{I_\text{cm}}{MR^2}\right)
\]

Objects with more rotational inertia (larger \(I_\text{cm}/MR^2\)) roll more slowly down an incline, since a larger fraction of the available gravitational potential energy goes into rotational kinetic energy. A hollow cylinder (\(I_\text{cm} = MR^2\)) rolls more slowly than a solid cylinder (\(I_\text{cm} = \frac{1}{2}MR^2\)), which rolls more slowly than a solid sphere (\(I_\text{cm} = \frac{2}{5}MR^2\)).

## 7.5 Inertia Tensor for Three-Dimensional Rotation

For rotation in three dimensions, the moment of inertia generalises to the **inertia tensor** — a symmetric \(3\times 3\) matrix. Its components are:

\[
I_{jk} = \sum_i m_i\!\left(r_i^2\,\delta_{jk} - r_{i,j}\,r_{i,k}\right)
\]

Explicitly, the diagonal elements are:
\begin{align}
I_{xx} &= \sum_i m_i(y_i^2 + z_i^2) \\
I_{yy} &= \sum_i m_i(x_i^2 + z_i^2) \\
I_{zz} &= \sum_i m_i(x_i^2 + y_i^2)
\end{align}

and the off-diagonal **products of inertia** are \(I_{xy} = -\sum_i m_i x_i y_i\), etc. The angular momentum vector is related to the angular velocity by:

\[
\mathbf{L} = \mathbf{I}\boldsymbol{\omega}
\]

In general, \(\mathbf{L}\) and \(\boldsymbol{\omega}\) are not parallel — the body tends to wobble. They are parallel only when \(\boldsymbol{\omega}\) points along a **principal axis** (an eigenvector of \(\mathbf{I}\)). By rotating to the principal axis frame (which diagonalises \(\mathbf{I}\)), the angular momentum becomes \(\mathbf{L} = (I_1\omega_1,\, I_2\omega_2,\, I_3\omega_3)\), where \(I_1, I_2, I_3\) are the principal moments. The stability of rotation depends on the relative magnitudes of the principal moments: rotation about the axis of largest or smallest principal moment is stable; rotation about the intermediate axis is unstable (the intermediate axis theorem).

---

# Chapter 8: Angular Momentum and Static Equilibrium

## 8.1 Angular Momentum

The **angular momentum** of a particle about a point O is:

\[
\mathbf{L} = \mathbf{r}\times\mathbf{p} = m(\mathbf{r}\times\mathbf{v})
\]

Its time derivative equals the torque:

\[
\frac{d\mathbf{L}}{dt} = \frac{d}{dt}(\mathbf{r}\times\mathbf{p}) = \underbrace{\mathbf{v}\times m\mathbf{v}}_{=\mathbf{0}} + \mathbf{r}\times\frac{d\mathbf{p}}{dt} = \mathbf{r}\times\mathbf{F}_\text{net} = \boldsymbol{\tau}
\]

For a rigid body rotating about a fixed axis, \(L = I\omega\), and the rotational equation of motion \(\tau = I\alpha = d(I\omega)/dt = dL/dt\) follows. For the total angular momentum of a system of particles, internal torques cancel (Newton's third law), giving:

\[
\frac{d\mathbf{L}_\text{total}}{dt} = \boldsymbol{\tau}_\text{ext,total}
\]

## 8.2 Conservation of Angular Momentum

<div class="theorem">
<strong>Conservation of Angular Momentum.</strong> If the net external torque about a point is zero, the angular momentum about that point is conserved:

\[
\boldsymbol{\tau}_\text{ext} = \mathbf{0} \implies \mathbf{L} = \text{constant}
\]
</div>

This is a consequence of the rotational symmetry of space (Noether's theorem). If the laws of physics are the same in all directions (no preferred direction in space), then angular momentum must be conserved. Conservation of angular momentum explains why planets orbit in planes (the gravitational torque from the Sun is zero, so the component of angular momentum perpendicular to the orbital plane is conserved), why a spinning top precesses rather than falling, and why a figure skater spins faster when pulling in her arms.

For the figure skater: when she pulls in her arms, her moment of inertia \(I\) decreases (mass moves closer to the axis). Since \(L = I\omega\) is conserved, \(\omega\) must increase. The kinetic energy \(K = L^2/(2I)\) actually increases — the extra energy comes from the work done by the skater's muscles as she pulls in her arms against the centrifugal tendency.

## 8.3 Gyroscopes and Precession

A rapidly spinning gyroscope has a large angular momentum \(\mathbf{L} = I\boldsymbol{\omega}\) along its spin axis. When a torque \(\boldsymbol{\tau}\) acts on the gyroscope (such as gravity acting on a gyroscope whose spin axis is tilted away from vertical), the angular momentum changes according to:

\[
\frac{d\mathbf{L}}{dt} = \boldsymbol{\tau}
\]

Because \(\mathbf{L}\) is large, the change \(d\mathbf{L} = \boldsymbol{\tau}\,dt\) in any small time \(dt\) is small compared to \(|\mathbf{L}|\). Rather than the spin axis falling (as it would without spin), the angular momentum vector simply rotates, causing the spin axis to **precess** — sweep out a cone around the vertical. The precession angular velocity is:

\[
\Omega_p = \frac{\tau}{L} = \frac{mgr}{I\omega}
\]

where \(r\) is the distance from the pivot to the centre of mass. Gyroscopes are used in navigation (gyrocompasses, inertial guidance systems), in spacecraft attitude control, and in toys. The Earth itself precesses (the precession of the equinoxes) with a period of about 26,000 years due to the gravitational torque exerted by the Moon and Sun on the Earth's equatorial bulge.

## 8.4 Static Equilibrium

A rigid body is in **static equilibrium** when it is at rest and the net force and net torque on it are both zero:

\[
\sum \mathbf{F}_i = \mathbf{0} \qquad \text{and} \qquad \sum \boldsymbol{\tau}_i = \mathbf{0}
\]

In two dimensions, these give three scalar equations (two force components and one torque component). A body in two-dimensional equilibrium has at most three unknowns that can be determined. The choice of torque axis is free — choosing it at the location of an unknown force eliminates that force from the torque equation, simplifying the algebra.

<div class="example">
<strong>Example 8.1: A Bridge Truss.</strong> A uniform horizontal beam of mass \(M = 200\) kg and length \(L = 6\) m is supported at its two ends by vertical supports. A car of mass \(m = 1000\) kg is parked at \(x = 4\) m from the left end. Find the support forces at each end.

Taking torques about the left end (to eliminate the left support force \(F_L\)):

\[
F_R \cdot L - mg \cdot x - Mg \cdot \frac{L}{2} = 0
\]

\[
F_R = \frac{mgx + MgL/2}{L} = \frac{1000(9.8)(4) + 200(9.8)(3)}{6} = \frac{39200 + 5880}{6} = 7513 \text{ N}
\]

From vertical force balance: \(F_L = (M + m)g - F_R = (1200)(9.8) - 7513 = 11760 - 7513 = 4247\) N.

Verification: torque about the right end gives \(F_L \cdot L = mg(L-x) + MgL/2\), so \(F_L = (1000 \times 9.8 \times 2 + 200 \times 9.8 \times 3)/6 = (19600 + 5880)/6 = 4247\) N. Consistent.
</div>

---

# Chapter 9: Simple Harmonic Motion and Oscillations

## 9.1 The Equation of Motion for SHM

**Simple harmonic motion** (SHM) arises whenever the restoring force is proportional to and directed opposite to the displacement from equilibrium — Hooke's law: \(F = -kx\). Applying Newton's second law:

\[
m\ddot{x} + kx = 0 \implies \ddot{x} + \omega_0^2 x = 0, \qquad \omega_0 = \sqrt{\frac{k}{m}}
\]

This linear, second-order ODE has the general solution:

\[
x(t) = A\cos(\omega_0 t) + B\sin(\omega_0 t) = C\cos(\omega_0 t + \phi)
\]

where the amplitude \(C = \sqrt{A^2 + B^2}\) and phase \(\phi = \arctan(-B/A)\) are set by initial conditions. The period \(T = 2\pi/\omega_0 = 2\pi\sqrt{m/k}\) is **independent of amplitude** — a defining property of SHM. This amplitude independence is what makes pendulum clocks and quartz oscillators useful timekeepers: the period stays the same whether the amplitude is large or small.

## 9.2 Energy in SHM

The mechanical energy of an SHM oscillator is:

\[
E = K + U = \frac{1}{2}mv^2 + \frac{1}{2}kx^2 = \frac{1}{2}kA^2 = \text{constant}
\]

To verify: with \(x = A\cos(\omega_0 t + \phi)\) and \(v = -A\omega_0\sin(\omega_0 t + \phi)\):

\[
E = \frac{1}{2}m A^2\omega_0^2\sin^2(\omega_0 t+\phi) + \frac{1}{2}kA^2\cos^2(\omega_0 t+\phi)
\]

Using \(m\omega_0^2 = k\): both terms equal \(\frac{1}{2}kA^2\) times a trigonometric function, and since \(\sin^2+\cos^2=1\), \(E = \frac{1}{2}kA^2\). Kinetic and potential energies oscillate out of phase (one is maximum when the other is zero) while their sum remains constant. The particle is at maximum speed when passing through equilibrium and momentarily at rest at the turning points.

## 9.3 The Simple Pendulum

A simple pendulum of length \(L\) has equation of motion for small angles:

\[
\ddot{\theta} + \frac{g}{L}\theta = 0 \implies T = 2\pi\sqrt{\frac{L}{g}}
\]

This famous result — period independent of mass and (for small angles) amplitude — was used by Huygens in the 17th century to design accurate clocks and allows measurement of \(g\) anywhere on Earth. For larger amplitudes, the exact period requires an elliptic integral: \(T = T_0\left(1 + \frac{1}{16}\theta_0^2 + \cdots\right)\), where \(\theta_0\) is the amplitude in radians. For \(\theta_0 = 10° \approx 0.175\) rad, the correction is about 0.2%.

## 9.4 Damped and Driven Oscillations

Real oscillators lose energy over time. A **viscously damped** oscillator satisfies:

\[
m\ddot{x} + b\dot{x} + kx = 0
\]

where \(b\) is the damping coefficient. Dividing by \(m\) and defining \(\gamma = b/m\) and \(\omega_0 = \sqrt{k/m}\), the characteristic equation \(r^2 + \gamma r + \omega_0^2 = 0\) has roots \(r = -\gamma/2 \pm \sqrt{\gamma^2/4 - \omega_0^2}\).

Three regimes: **underdamping** (\(\gamma < 2\omega_0\)) gives decaying oscillations \(x(t) = Ce^{-\gamma t/2}\cos(\omega_d t + \phi)\) with \(\omega_d = \sqrt{\omega_0^2 - \gamma^2/4}\); **critical damping** (\(\gamma = 2\omega_0\)) gives the fastest return to equilibrium without oscillating — this is the design target for door closers and shock absorbers; **overdamping** (\(\gamma > 2\omega_0\)) gives a slow exponential return without oscillating.

A **driven oscillator** with forcing \(F_0\cos(\omega t)\) has steady-state amplitude:

\[
A(\omega) = \frac{F_0/m}{\sqrt{(\omega_0^2 - \omega^2)^2 + (\gamma\omega)^2}}
\]

The amplitude peaks near \(\omega = \omega_0\) — **resonance**. The quality factor \(Q = \omega_0/\gamma\) quantifies the sharpness: \(Q \gg 1\) gives a tall, narrow resonance peak with energy stored for many cycles; \(Q \ll 1\) gives a broad, flat peak that decays quickly. Resonance appears throughout physics and engineering: in LC circuits, acoustic resonators, lasers, MRI machines, and the structural response of buildings during earthquakes. The 1940 collapse of the Tacoma Narrows Bridge was partly due to an aeroelastic feedback mechanism (not pure resonance, despite popular accounts) that caused large oscillations in the same frequency range as the bridge's natural mode.

The energy stored in a damped oscillator decays as \(E(t) = E_0 e^{-\gamma t}\). This means the Q-factor also equals the number of radians of oscillation over which the energy halves by the factor \(1/e\), specifically \(Q = \omega_0/\gamma = \omega_0 \times \tau_E\) where \(\tau_E = 1/\gamma\) is the energy decay time. High-Q resonators are critical in metrology: the caesium atomic clock, the primary frequency standard, achieves Q values exceeding \(10^{10}\), giving timekeeping accuracy better than one second in 300 million years. Optical cavities for laser stabilisation can reach \(Q \approx 10^{14}\).

## 9.5 Coupled Oscillators and Normal Modes

When two or more oscillators are connected, their motions become interdependent in a profound way. Consider two identical pendulums of natural frequency \(\omega_0\) coupled by a weak spring of constant \(k'\) between their bobs. Denoting displacements \(x_1\) and \(x_2\), Newton's second law gives the system:

\[
m\ddot{x}_1 = -m\omega_0^2 x_1 + k'(x_2 - x_1)
\]

\[
m\ddot{x}_2 = -m\omega_0^2 x_2 - k'(x_2 - x_1)
\]

Rather than solving directly, we introduce the **normal co-ordinates** \(q_+ = x_1 + x_2\) and \(q_- = x_1 - x_2\). Adding and subtracting the two equations:

\[
m\ddot{q}_+ = -m\omega_0^2 q_+ \implies \omega_+ = \omega_0
\]

\[
m\ddot{q}_- = -(m\omega_0^2 + 2k')q_- \implies \omega_- = \sqrt{\omega_0^2 + 2k'/m}
\]

These are the two **normal modes**: in the symmetric mode (\(q_+\)), both pendulums swing together with no spring extension and frequency \(\omega_0\); in the antisymmetric mode (\(q_-\)), they swing in opposite directions and the spring is alternately stretched and compressed, raising the frequency. The general solution is a superposition of these modes, and for initial conditions where only one pendulum is displaced, the energy slowly beats back and forth between the two with period \(T_{\text{beat}} = 2\pi/(\omega_- - \omega_+)\) — a phenomenon called **normal-mode beating** that is directly audible when two tuning forks of slightly different frequency are struck simultaneously.

<div class="theorem">
<strong>Normal Mode Theorem.</strong> A system of \(N\) coupled oscillators has exactly \(N\) normal modes, each oscillating at a definite frequency and with a definite amplitude ratio among the degrees of freedom. Any motion of the system is a linear superposition of normal modes. In the limit of a continuous medium (\(N \to \infty\)), normal modes become the standing wave eigenfunctions of the boundary-value problem.
</div>

The normal mode theorem is the foundation of a vast domain of physics. The vibrational spectrum of molecules (measured by infrared and Raman spectroscopy) is precisely the set of normal mode frequencies of the nuclear motion in the Born-Oppenheimer approximation. The phonon spectrum of a crystal — the quasi-particle excitations of the collective lattice vibrations — derives from the normal modes of the \(\sim 10^{23}\) coupled atomic oscillators in the solid. Heat capacity, thermal conductivity, and sound propagation in solids are all governed by the phonon spectrum. Even the fluctuations of a quantum field are normal modes of the field equations, quantised into particles: photons for the electromagnetic field, gluons for the strong nuclear field, and so forth.

# Chapter 10: The Physics of Forces — A Deeper Analysis

## 10.1 Gravitational Force in Detail

Newton's law of universal gravitation is deceptively simple in form but extraordinarily rich in consequence. Writing it as a vector force on mass \(m_2\) due to mass \(m_1\) located at position \(\mathbf{r}_1\):

\[
\mathbf{F}_{12} = -G\frac{m_1 m_2}{|\mathbf{r}_2 - \mathbf{r}_1|^2}\hat{r}_{12}
\]

where \(\hat{r}_{12}\) is the unit vector from \(m_1\) to \(m_2\). The minus sign indicates attraction. This is an **inverse-square law**: doubling the separation reduces the force by a factor of four.

<div class="definition">
<strong>Gravitational Field.</strong> The gravitational field \(\mathbf{g}(\mathbf{r})\) at position \(\mathbf{r}\) is defined as the gravitational force per unit mass that would be experienced by a test particle placed there: \(\mathbf{g} = \mathbf{F}_{\text{grav}}/m\). For a point mass \(M\), \(\mathbf{g} = -GM/r^2\,\hat{r}\). The field concept eliminates the action-at-a-distance mystery by attributing physical reality to the field itself: the field exists in space and carries energy and momentum.
</div>

The gravitational field concept, introduced conceptually by Faraday and formalised by Maxwell and Einstein, is central to modern physics. In Newtonian gravity, the field satisfies Poisson's equation \(\boldsymbol{\nabla}^2 \Phi = 4\pi G\rho\) where \(\Phi\) is the gravitational potential (\(\mathbf{g} = -\boldsymbol{\nabla}\Phi\)) and \(\rho\) is the mass density. This is mathematically identical to Gauss's law for electrostatics, and many results transfer directly. For a spherically symmetric mass distribution, the shell theorem follows: a uniform spherical shell exerts no net gravitational force on a particle inside it, and exerts a force on an outside particle as if all the mass were concentrated at the centre. This theorem, which Newton proved geometrically with great effort, follows immediately from the divergence theorem applied to Poisson's equation.

The **tidal force** is the spatial gradient of the gravitational field. The Moon exerts a slightly larger gravitational pull on the near side of Earth than on the far side. The differential acceleration across Earth's diameter is \(\Delta g \approx 2GM_{\text{Moon}}R_E/d^3\) where \(d\) is the Earth-Moon distance. This stretches Earth along the Earth-Moon axis and compresses it perpendicular to that axis, causing the oceans to bulge on both the near and far sides and producing the twice-daily tidal cycle. Tidal forces have reshaped the solar system: they have synchronised the Moon's rotation with its orbital period (tidal locking), heated Jupiter's moon Io sufficiently to make it the most volcanically active body in the solar system (through orbital resonance with Europa and Ganymede), and will eventually disrupt satellites that come inside the **Roche limit** \(d_R \approx 2.46 R_{\text{planet}}(\rho_p/\rho_s)^{1/3}\), explaining the origin of planetary ring systems.

## 10.2 Normal Forces, Contact Mechanics, and the Sphere-Leaving Problem

The normal force is a contact force of electromagnetic origin: when two surfaces are pressed together, the outer electron clouds repel, and at equilibrium the repulsion exactly balances the applied load. At the macroscopic level, this appears as an instantaneous constraint force that adjusts to prevent interpenetration. The **sphere-leaving problem** is a classic exercise that reveals when this constraint becomes untenable.

Consider a small block sliding frictionlessly on the outside of a smooth sphere of radius \(R\), starting from rest near the top. At angle \(\theta\) from the vertical, the block has descended a height \(R - R\cos\theta = R(1 - \cos\theta)\). Energy conservation gives \(v^2 = 2gR(1 - \cos\theta)\). The centripetal acceleration \(v^2/R\) must be supplied by the radial component of gravity minus the normal force:

\[
mg\cos\theta - N = \frac{mv^2}{R} = 2mg(1 - \cos\theta)
\]

Solving: \(N = mg(3\cos\theta - 2)\). The block leaves the sphere when \(N = 0\), i.e., \(\cos\theta = 2/3\), or \(\theta \approx 48.2°\). This result illustrates a general principle: **constrained motion requires non-negative normal forces**, and when the required normal force would become negative (meaning the surface would have to pull rather than push), the object leaves the surface and becomes a projectile.

Contact forces also underlie friction. **Static friction** is the tangential component of the contact force that prevents sliding; it is bounded by \(f_s \leq \mu_s N\) where \(\mu_s\) is the coefficient of static friction. At the microscopic level, static friction arises from adhesive junctions between asperities (microscopic surface roughness features) that bond when pressed together. **Kinetic friction** \(f_k = \mu_k N\) acts when surfaces slide; the kinetic coefficient is generally lower than the static one because fewer junctions form and those that do form shear before full bonding. This is why it takes more force to start an object sliding than to keep it moving, and also why anti-lock braking systems (ABS) keep wheel rotation just below the slip threshold to exploit the higher static friction.

## 10.3 Tension in Ropes and Pulleys

An ideal massless rope transmits tension without change. A real rope of mass \(\mu\) per unit length supports its own weight, so the tension varies along its length: \(T(y) = T_{\text{top}} - \mu g y\) where \(y\) is measured from the top. For a hanging chain (catenary problem), the shape that minimises potential energy subject to fixed length is not a parabola but a **catenary** \(y = a\cosh(x/a)\) where \(a = T_H/(\mu g)\) is the catenary constant and \(T_H\) is the horizontal tension component. The catenary is also the optimal form for arches (inverted catenary), a principle used by Robert Hooke in 1671 and exploited architecturally by Antoni Gaudí, who designed the vaults of the Sagrada Família by hanging chains from a model and inverting the result.

A **pulley** changes the direction of a rope's tension. An ideal (massless, frictionless) pulley multiplies the mechanical advantage: a single movable pulley attached to a load halves the required applied force (block-and-tackle). A real pulley with moment of inertia \(I\) and radius \(r\) must be accelerated rotationally, so the tensions on either side of the pulley differ: \((T_1 - T_2)r = I\alpha = I a/r\), giving \(T_1 - T_2 = Ia/r^2 = m_{\text{eff}}a\) where \(m_{\text{eff}} = I/r^2\) is the effective additional inertia of the pulley. This modifies the Atwood machine equations and must be included in laboratory experiments with real pulleys.

# Chapter 11: Work, Energy, and Power — Advanced Topics

## 11.1 Power and Its Applications

Power is the rate at which work is done or energy is transferred:

\[
P = \frac{dW}{dt} = \mathbf{F} \cdot \mathbf{v}
\]

The SI unit of power is the watt (\(1\,\text{W} = 1\,\text{J/s}\)). A useful non-SI unit is the horsepower (\(1\,\text{hp} \approx 746\,\text{W}\)), defined historically as the power an average horse can sustain. A human athlete can sustain about 200–400 W over an hour, but can produce bursts of 1–2 kW for a few seconds.

The power required to maintain a vehicle at constant speed \(v\) against drag force \(F_d = \frac{1}{2}C_D \rho A v^2\) is \(P = F_d v = \frac{1}{2}C_D \rho A v^3\). The cubic dependence on speed has enormous practical consequences: doubling highway speed requires eight times the power (and thus eight times the fuel consumption for a given distance, since distance \(\propto\) time and power \(\propto v^3\), so energy per unit distance \(\propto v^2\)). This is why fuel economy falls sharply at high speeds and why aerodynamics (reducing \(C_D A\)) is the central challenge in vehicle design.

## 11.2 Potential Energy Diagrams and Equilibrium

A potential energy function \(U(x)\) encodes the complete information about conservative forces through \(F_x = -dU/dx\). Plotting \(U(x)\) versus \(x\) — a **potential energy diagram** — allows qualitative analysis of motion without solving differential equations.

<div class="definition">
<strong>Equilibrium Points and Stability.</strong> A point \(x_0\) is an equilibrium if \(dU/dx\big|_{x_0} = 0\) (zero force). It is <em>stable</em> if \(d^2U/dx^2\big|_{x_0} > 0\) (potential minimum: restoring force), <em>unstable</em> if \(d^2U/dx^2\big|_{x_0} < 0\) (potential maximum: destabilising force), and <em>neutral</em> if all higher derivatives vanish (flat potential).
</div>

A particle with total energy \(E\) can only access regions where \(U(x) \leq E\) (kinetic energy must be non-negative). The points where \(U(x) = E\) are **turning points** where the velocity is instantaneously zero and the particle reverses direction. Between two turning points, the particle is **bound** and oscillates. The period of this oscillation can be computed from:

\[
T = 2\int_{x_1}^{x_2} \frac{dx}{\sqrt{2(E - U(x))/m}}
\]

For any smooth potential well, near its minimum \(x_0\) we can write \(U \approx U(x_0) + \frac{1}{2}U''(x_0)(x - x_0)^2\), which is precisely a harmonic oscillator with \(k_{\text{eff}} = U''(x_0)\). This is the **universality of simple harmonic motion**: every stable equilibrium exhibits SHM for sufficiently small displacements, regardless of the detailed shape of the potential. This principle explains why musical instruments produce nearly pure tones, why atoms in a crystal vibrate sinusoidally, why the period of a clock pendulum is well-defined for small swings, and why the phonon concept is universally applicable.

## 11.3 Energy in Rotational Systems

For a rigid body rotating with angular velocity \(\omega\), the rotational kinetic energy is \(K_{\text{rot}} = \frac{1}{2}I\omega^2\). This is a pure kinetic energy; there is no "rotational potential energy" for rigid bodies (though spinning tops have gravitational potential energy by virtue of their centre of mass position).

When a rigid body rolls without slipping on a flat surface, the total kinetic energy is:

\[
K_{\text{total}} = \frac{1}{2}mv_{\text{cm}}^2 + \frac{1}{2}I_{\text{cm}}\omega^2 = \frac{1}{2}mv_{\text{cm}}^2\left(1 + \frac{I_{\text{cm}}}{mR^2}\right)
\]

The factor in parentheses depends only on the shape of the body: for a thin ring \(I = mR^2\) so the factor is 2; for a uniform disk \(I = mR^2/2\) so the factor is 3/2; for a solid sphere \(I = 2mR^2/5\) so the factor is 7/5; for a hollow sphere \(I = 2mR^2/3\) so the factor is 5/3. When released from rest on an incline, objects with smaller \(I/mR^2\) (more mass concentrated near the axis) reach the bottom faster. The solid sphere always beats the hollow sphere, which always beats the disk, which always beats the ring, regardless of their masses or radii. This is a beautiful demonstration that geometry, not mass, governs rolling dynamics.

# Chapter 12: Momentum, Collisions, and Rockets

## 12.1 The Rocket Equation

The rocket problem is one of the most elegant applications of momentum conservation to a variable-mass system. A rocket expels propellant rearward at speed \(v_e\) relative to the rocket. At time \(t\), let the rocket have mass \(m(t)\) and velocity \(v(t)\). In time \(dt\), it expels mass \(|dm| = -dm\) (since \(dm < 0\)) with exhaust velocity \(v - v_e\) in the inertial frame. Conservation of momentum (in the absence of external forces) gives:

\[
mv = (m + dm)(v + dv) + (-dm)(v - v_e)
\]

Expanding and discarding the second-order term \(dm\,dv\):

\[
mv = mv + m\,dv + v\,dm - v\,dm + v_e\,dm
\]

\[
0 = m\,dv + v_e\,dm
\]

<div class="theorem">
<strong>Tsiolkovsky Rocket Equation.</strong> For a rocket in free space (no gravity or drag), integrating \(m\,dv = -v_e\,dm\) from initial mass \(m_0\) (full) to final mass \(m_f\) (empty):

\[
\Delta v = v_e \ln\left(\frac{m_0}{m_f}\right)
\]
The ratio \(m_0/m_f\) is the <em>mass ratio</em>; \(\Delta v\) is the total velocity change achievable.
</div>

The rocket equation has profound and sometimes sobering consequences. To achieve Earth orbit requires \(\Delta v \approx 9.5\,\text{km/s}\) (including gravity and drag losses). Liquid-fuelled rockets achieve \(v_e \approx 4.5\,\text{km/s}\) (specific impulse \(I_{sp} \approx 450\,\text{s}\)). The required mass ratio is \(e^{9.5/4.5} \approx 8.3\), meaning the rocket must be about 88% fuel by mass at launch. The Saturn V moon rocket had a launch mass of 2,970 tonnes and delivered 130 tonnes to low Earth orbit — a mass ratio of 22.8, achieved through multi-staging. Each stage is discarded when empty, so the rocket equation applies to each stage separately; the \(\Delta v\)'s add linearly while the mass ratios multiply, making staging essential for practical rocketry.

With gravity included (constant field \(g\) for simplicity), a rocket launched vertically satisfies:

\[
m\frac{dv}{dt} = -v_e\frac{dm}{dt} - mg
\]

The thrust \(F_T = -v_e(dm/dt) = v_e \dot{m}_{\text{exhaust}}\) must exceed the initial weight \(m_0 g\) for the rocket to lift off. The **thrust-to-weight ratio** must exceed 1 at launch, and typical values for orbital launchers are 1.2–1.5 at liftoff, rising as fuel is consumed and the rocket becomes lighter.

## 12.2 Two-Dimensional Elastic Collisions

In a perfectly elastic collision in 2D, both kinetic energy and momentum are conserved. For two objects of equal mass \(m\), with object 1 initially moving with velocity \(\mathbf{v}_1\) and object 2 at rest:

\[
m\mathbf{v}_1 = m\mathbf{v}_1' + m\mathbf{v}_2' \implies \mathbf{v}_1 = \mathbf{v}_1' + \mathbf{v}_2'
\]

\[
\frac{1}{2}mv_1^2 = \frac{1}{2}m(v_1')^2 + \frac{1}{2}m(v_2')^2 \implies v_1^2 = (v_1')^2 + (v_2')^2
\]

From the momentum equation, \(\mathbf{v}_1' + \mathbf{v}_2' = \mathbf{v}_1\), so squaring both sides: \((v_1')^2 + 2\mathbf{v}_1' \cdot \mathbf{v}_2' + (v_2')^2 = v_1^2\). Substituting the energy equation: \(2\mathbf{v}_1' \cdot \mathbf{v}_2' = 0\), which means \(\mathbf{v}_1' \perp \mathbf{v}_2'\). The two scattered particles always move at right angles to each other. This is the **right-angle rule** for equal-mass elastic collisions, beautifully confirmed in billiards (for nearly head-on collisions) and in nuclear scattering experiments where \(\alpha\)-particles hit helium nuclei.

For unequal masses, the analysis is more complex but yields the result that in the centre-of-mass frame, each particle scatters symmetrically and no kinetic energy is exchanged between frames. Transforming back to the lab frame gives the scattering angles as functions of the mass ratio and impact parameter.

# Chapter 13: Torque, Angular Momentum — Advanced Topics

## 13.1 Rolling Without Slipping — Detailed Analysis

Rolling without slipping requires that the contact point has zero velocity. For a cylinder of radius \(R\) rolling on a flat surface, this means \(v_{\text{cm}} = \omega R\) and \(a_{\text{cm}} = \alpha R\). The friction force at the contact point is static friction (no sliding occurs), and it is this friction that provides the torque accelerating the rotation.

For a cylinder on an incline of angle \(\theta\), applying Newton's second law for translation and rotation about the centre of mass:

\[
mg\sin\theta - f = ma
\]

\[
fR = I_{\text{cm}}\alpha = I_{\text{cm}}\frac{a}{R} \implies f = \frac{I_{\text{cm}}}{R^2}a
\]

Substituting: \(mg\sin\theta = ma + \frac{I_{\text{cm}}}{R^2}a = a\left(m + \frac{I_{\text{cm}}}{R^2}\right)\), so:

\[
a = \frac{mg\sin\theta}{m + I_{\text{cm}}/R^2} = \frac{g\sin\theta}{1 + I_{\text{cm}}/(mR^2)}
\]

The minimum coefficient of friction required to maintain rolling without slipping is:

\[
\mu_s \geq \frac{f}{N} = \frac{I_{\text{cm}}a/(R^2)}{mg\cos\theta} = \frac{g\sin\theta}{g\cos\theta} \cdot \frac{I_{\text{cm}}/mR^2}{1 + I_{\text{cm}}/mR^2} = \tan\theta \cdot \frac{I_{\text{cm}}/mR^2}{1 + I_{\text{cm}}/mR^2}
\]

For a solid sphere (\(I = 2mR^2/5\)), this gives \(\mu_s \geq \frac{2}{7}\tan\theta\). For a ring (\(I = mR^2\)), \(\mu_s \geq \frac{1}{2}\tan\theta\). The ring requires more friction because a greater fraction of its energy goes into rotation, requiring a larger friction force to maintain the no-slip condition. If the incline angle exceeds the maximum supported by the available friction, the object slips, and the motion becomes a combination of translation and rotation with sliding.

## 13.2 Gyroscopes and Precession

A spinning gyroscope exhibits counter-intuitive behaviour that is fully explained by the vector nature of angular momentum. Consider a gyroscope — a spinning disk of moment of inertia \(I\) rotating at angular velocity \(\omega_s\) — supported at one end of its axle of length \(d\). Gravity exerts a torque \(\boldsymbol{\tau} = \mathbf{d} \times m\mathbf{g}\), which points horizontally (perpendicular to both the axle and gravity). By \(\boldsymbol{\tau} = d\mathbf{L}/dt\), this torque changes the direction of \(\mathbf{L} = I\omega_s\hat{s}\) but not its magnitude. The axle sweeps out a cone — the gyroscope **precesses** about the vertical axis with angular velocity:

\[
\Omega_p = \frac{\tau}{L} = \frac{mgd}{I\omega_s}
\]

This result is exact for rapid spin (\(I\omega_s \gg\) nutation angular momentum). Notice that increasing \(\omega_s\) decreases \(\Omega_p\) — a faster spin precesses more slowly, which seems paradoxical but is correct. The gyroscope precesses because gravity cannot tip the axle toward the floor; instead, it rotates the axle in a horizontal plane.

Gyroscopes have important applications. The **gyrocompass** (distinct from a magnetic compass) uses a motorised gyroscope to find true north: a gyroscope mounted to allow rotation about a vertical axis will precess until its spin axis aligns with Earth's rotation axis (geographic north), because Earth's rotation produces a torque on the gyroscope via the normal force from the gimbal support. Gyrocompasses were essential for submarine navigation before GPS. Modern **ring laser gyroscopes** (RLGs) use the Sagnac effect — a phase difference between counter-propagating laser beams in a rotating frame — to measure rotation rates with extraordinary precision; they are the primary attitude sensors in commercial aircraft inertial navigation systems.

## 13.3 Angular Momentum in Quantum Mechanics — A Preview

Classical angular momentum \(\mathbf{L} = \mathbf{r} \times \mathbf{p}\) is quantised in quantum mechanics. The magnitude is restricted to \(|\mathbf{L}| = \hbar\sqrt{\ell(\ell+1)}\) where \(\ell = 0, 1, 2, \ldots\) is the orbital angular momentum quantum number, and the projection along any axis is \(L_z = m_\ell \hbar\) with \(m_\ell = -\ell, -\ell+1, \ldots, \ell\). Particles also possess **intrinsic angular momentum** or **spin**, which has no classical analogue: electrons have spin \(s = 1/2\), meaning \(|\mathbf{S}| = \hbar\sqrt{3}/2\) and \(S_z = \pm\hbar/2\). The fact that spin is half-integer (not an integer multiple of \(\hbar\)) means electrons are **fermions** and obey the Pauli exclusion principle — no two electrons can occupy the same quantum state — which is ultimately why matter is rigid and chemistry exists.

Conservation of angular momentum in quantum mechanics constrains the selection rules for atomic transitions: a photon carries one unit of angular momentum (\(\ell = 1\)), so electric dipole transitions require \(\Delta\ell = \pm 1\). This explains the structure of atomic spectra and the existence of metastable states (from which transitions to the ground state are "forbidden" by angular momentum selection rules). The \(2s \to 1s\) transition in hydrogen requires emission of two photons (each carrying \(\hbar\)) and has a lifetime of \(10^8\) years, making it undetectable in the laboratory but cosmologically significant.

# Chapter 14: Non-Inertial Reference Frames

## 14.1 Fictitious Forces

Newton's second law \(\mathbf{F} = m\mathbf{a}\) holds only in **inertial frames** — frames that are not accelerating. In a non-inertial frame (rotating or linearly accelerating), Newton's law must be modified by the addition of **fictitious forces** (also called pseudo-forces or inertial forces) that have no identifiable physical source but are required to account for the apparent motion of objects.

For a frame accelerating linearly at \(\mathbf{A}\) relative to an inertial frame, a particle appears to experience a fictitious force:

\[
\mathbf{F}_{\text{fict}} = -m\mathbf{A}
\]

This is why you are pushed back into your seat when a car accelerates: in the car's frame, a fictitious backward force \(-mA\) acts on you. Equivalently, you can remain in the inertial frame and note that the car seat is pushing you forward with force \(mA\). Both descriptions are equally valid, and the choice is a matter of computational convenience.

## 14.2 Rotating Frames and the Coriolis Effect

For a frame rotating with angular velocity \(\boldsymbol{\Omega}\) relative to an inertial frame, the relationship between the time derivative of any vector \(\mathbf{A}\) in the inertial and rotating frames is:

\[
\left(\frac{d\mathbf{A}}{dt}\right)_{\text{inertial}} = \left(\frac{d\mathbf{A}}{dt}\right)_{\text{rotating}} + \boldsymbol{\Omega} \times \mathbf{A}
\]

Applying this transformation to the position and velocity of a particle, and using Newton's second law in the inertial frame, yields the equation of motion in the rotating frame:

\[
m\mathbf{a}' = \mathbf{F} - m\boldsymbol{\Omega} \times (\boldsymbol{\Omega} \times \mathbf{r}') - 2m\boldsymbol{\Omega} \times \mathbf{v}' - m\dot{\boldsymbol{\Omega}} \times \mathbf{r}'
\]

where primes denote quantities in the rotating frame. The three fictitious force terms are the **centrifugal force** \(-m\boldsymbol{\Omega} \times (\boldsymbol{\Omega} \times \mathbf{r}') = m\Omega^2 r'_\perp\hat{r}'_\perp\) (pointing outward from the rotation axis), the **Coriolis force** \(-2m\boldsymbol{\Omega} \times \mathbf{v}'\) (perpendicular to both the rotation axis and the velocity), and the **Euler force** \(-m\dot{\boldsymbol{\Omega}} \times \mathbf{r}'\) (relevant only when the rotation rate changes).

<div class="definition">
<strong>Coriolis Force.</strong> The Coriolis force \(\mathbf{F}_{\text{Cor}} = -2m\boldsymbol{\Omega} \times \mathbf{v}'\) acts on any particle moving in a rotating frame. It is always perpendicular to the velocity in the rotating frame and does no work; it deflects trajectories without changing speeds. On Earth, \(\boldsymbol{\Omega} = 7.27 \times 10^{-5}\,\text{rad/s}\) points toward the north celestial pole. In the Northern Hemisphere, it deflects moving objects to the right; in the Southern Hemisphere, to the left.
</div>

The Coriolis effect governs large-scale atmospheric and oceanic circulation. Low-pressure systems (cyclones) rotate counterclockwise in the Northern Hemisphere (air flowing inward is deflected to the right, producing counterclockwise rotation) and clockwise in the Southern Hemisphere. This explains the prevailing wind patterns, the trade winds, and the general circulation of the atmosphere. The common belief that water drains counterclockwise in the Northern Hemisphere due to the Coriolis effect is a myth for household drains: the Coriolis force on bath-scale flows is \(\sim 10^{-5}\) times the gravitational force, far too small to overcome the dominant effects of the initial water motion and basin shape. However, on the scale of oceans and weather systems, the Coriolis effect is the primary organising force.

The **Foucault pendulum** provides a direct demonstration of Earth's rotation. A pendulum swinging in the vertical plane appears to rotate its plane of oscillation over time. The rotation rate (as seen by an observer on Earth) is \(\Omega \sin\lambda\) where \(\lambda\) is the latitude. At the North Pole (\(\lambda = 90°\)), the period of rotation is 24 hours; at the equator (\(\lambda = 0°\)), there is no rotation. At Paris (\(\lambda \approx 49°\)), the period is about 32 hours. Léon Foucault demonstrated this publicly at the Panthéon in 1851 using a 67-metre pendulum, providing the first direct evidence of Earth's rotation that did not rely on astronomical observations.

**GPS corrections** provide a modern application: GPS satellites orbit at 20,200 km altitude where they move fast (3.87 km/s) and are in a weaker gravitational field than ground receivers. Special relativity predicts that moving clocks run slow by \(\Delta t/t = -v^2/(2c^2) \approx -8.3 \times 10^{-11}\) (7.2 μs/day slow); general relativity predicts that clocks in weaker gravity run fast by \(\Delta t/t = gh/c^2 \approx +5.3 \times 10^{-10}\) (45.9 μs/day fast). The net effect is that satellite clocks gain about 38.4 μs/day relative to ground clocks. Without correction, GPS positions would drift by about 10 km/day. This is a direct, practical demonstration that relativistic effects on time must be accounted for in modern technology.

## 14.3 Centrifugal Effects on Earth

Earth's rotation (non-inertial) contributes a centrifugal acceleration \(\Omega^2 R\cos\lambda\) directed outward from the rotation axis, where \(R\) is Earth's radius and \(\lambda\) is the latitude. At the equator, this is \(\Omega^2 R_E \approx 0.034\,\text{m/s}^2\), or about 0.34% of \(g\). The effective gravitational acceleration is:

\[
g_{\text{eff}} = g_{\text{true}} - \Omega^2 R\cos^2\lambda
\]

At the poles, \(g_{\text{eff}} = g_{\text{true}} \approx 9.832\,\text{m/s}^2\); at the equator, \(g_{\text{eff}} = g_{\text{true}} - \Omega^2 R_E \approx 9.780\,\text{m/s}^2\). Earth is also oblate (equatorial radius 6,378 km vs. polar radius 6,357 km) because the rotation causes the equatorial bulge. The variation of \(g\) with latitude is thus due to both the centrifugal effect and the greater distance from the centre at the equator. The geoid — the equipotential surface of \(g_{\text{eff}}\) — defines "sea level" and is the reference surface for all geodetic measurements.

# Chapter 15: Dimensional Analysis, Scaling, and Estimation

## 15.1 The Method of Dimensional Analysis

Every physical quantity has dimensions that can be expressed as products of powers of the base dimensions: mass \([M]\), length \([L]\), time \([T]\), electric current \([I]\), temperature \([\Theta]\), amount of substance \([N]\), and luminous intensity \([J]\). A physical equation must be **dimensionally homogeneous**: every additive term must have the same dimensions. This simple requirement is extraordinarily powerful.

<div class="theorem">
<strong>Buckingham Pi Theorem.</strong> If a physical relationship among \(n\) dimensional quantities involves \(k\) independent base dimensions, then it can be expressed as a relationship among \(n - k\) independent dimensionless groups \(\Pi_i\). That is, \(f(q_1, q_2, \ldots, q_n) = 0\) implies \(\Phi(\Pi_1, \Pi_2, \ldots, \Pi_{n-k}) = 0\).
</div>

To illustrate: the drag force \(F_D\) on a sphere of diameter \(D\) moving at speed \(v\) through a fluid of density \(\rho\) and viscosity \(\eta\) involves 5 quantities (\(F_D, D, v, \rho, \eta\)) and 3 base dimensions (\(M, L, T\)), giving \(5 - 3 = 2\) dimensionless groups. The relevant groups are the drag coefficient \(C_D = F_D/(\frac{1}{2}\rho v^2 D^2)\) and the Reynolds number \(Re = \rho v D/\eta\). The Buckingham Pi theorem guarantees \(C_D = f(Re)\) for some function \(f\), without specifying what that function is. Experiments show that for \(Re < 1\) (Stokes flow), \(C_D = 24/Re\), giving Stokes' drag law \(F_D = 3\pi\eta D v\); for \(Re \sim 10^3\)–\(10^5\), \(C_D \approx 0.4\) (nearly constant), giving Newton's drag law \(F_D \propto \rho v^2 D^2\). The transition between these regimes and the famous drag crisis at \(Re \approx 5 \times 10^5\) (when a turbulent boundary layer reduces \(C_D\) by a factor of ~5, explaining why golf balls have dimples) are revealed by experiment rather than analysis, but the functional form is constrained by dimensional analysis.

## 15.2 Scaling Laws

Dimensional analysis also reveals **scaling laws** — how quantities change when a system is scaled up or down in size. These laws constrain biological and engineering design profoundly.

For a mammal of linear dimension \(L\) (say, leg length), its mass scales as \(m \propto L^3\) (constant density). The compressive stress on its leg bones due to body weight scales as \(\sigma = F/A \propto mg/(L^2) \propto L^3 g/L^2 = gL\). Since bones break at a fixed stress (\(\sigma_{\text{break}} \approx 200\,\text{MPa}\) for compact bone), the maximum size of a terrestrial animal is limited. Galileo first noticed this in 1638: a large animal must have proportionally thicker bones than a small one (its bones cannot simply scale geometrically), giving the allometric scaling of bone diameter as \(d \propto m^{3/8}\) rather than \(m^{1/3}\). This is why an elephant's legs are column-like while a mouse's are slender.

Heat loss from an animal scales as surface area \(\propto L^2\), while heat production from metabolism scales as mass \(\propto L^3\) (assuming constant metabolic rate per unit mass). The ratio of heat loss to production scales as \(L^2/L^3 = 1/L\), meaning smaller animals lose heat much faster relative to their production and must therefore have higher mass-specific metabolic rates to maintain body temperature. This is confirmed by Kleiber's law: metabolic rate \(\propto m^{3/4}\) (empirically measured across species ranging from mice to elephants), which is an active area of theoretical biology (the \(3/4\) exponent, rather than \(2/3\) from naive surface-area arguments, is thought to arise from the fractal geometry of vascular networks).

## 15.3 Fermi Estimation

Fermi estimation — the art of making order-of-magnitude estimates from first principles with minimal data — is an essential scientific skill. The technique was famously used by Enrico Fermi, who estimated the yield of the Trinity nuclear test by observing the displacement of paper scraps dropped from his hand before and after the blast wave arrived.

A canonical example: how many piano tuners are there in Chicago? Population of Chicago: \(\sim 3 \times 10^6\). Fraction owning a piano: \(\sim 1/20\). Number of pianos: \(\sim 1.5 \times 10^5\). Each piano needs tuning once per year, taking \(\sim 2\,\text{h}\). Total tuner-hours per year: \(3 \times 10^5\,\text{h}\). A tuner works \(\sim 250\,\text{days/year}\) at \(\sim 8\,\text{h/day} = 2000\,\text{h/year}\), minus travel: \(\sim 1000\) tuning-hours per year. Number of tuners: \(\sim 150\). The actual number is reportedly around 125–200. Such estimates, accurate to a factor of 2–3, are sufficient for planning, feasibility studies, and identifying whether a more detailed calculation is warranted.

<div class="example">
<strong>Example: Energy released by a supernova.</strong> A core-collapse supernova converts gravitational potential energy of a neutron star (\(M \approx 1.4 M_\odot\), \(R \approx 10\,\text{km}\)) from the original stellar core radius (\(\sim R_\odot \approx 7 \times 10^8\,\text{m}\)) to its final radius. The energy released is:

\[
E = \frac{GM^2}{2R_{\text{final}}} - \frac{GM^2}{2R_{\text{initial}}} \approx \frac{GM^2}{2R_{\text{ns}}} \approx \frac{6.67\times10^{-11} \times (1.4 \times 2\times10^{30})^2}{2 \times 10^4} \approx 3 \times 10^{46}\,\text{J}
\]
This is \(\sim 10^{53}\,\text{erg}\), the canonical supernova energy. About 99% is carried off by neutrinos in the first 10 seconds, while only \(\sim 10^{44}\,\text{J}\) goes into the optical display — yet this is still 100 times the Sun's total energy output over its entire 10-billion-year main-sequence lifetime.
</div>

## 15.4 Chaos and Deterministic Unpredictability

Classical mechanics is deterministic: given exact initial conditions and forces, the future trajectory of any system is uniquely determined by Newton's laws. Yet the 19th-century mathematician Henri Poincaré discovered that even simple, fully deterministic systems can exhibit behaviour so sensitive to initial conditions that long-term prediction becomes practically impossible. This is **chaos**.

<div class="definition">
<strong>Lyapunov Exponent.</strong> For a dynamical system, nearby trajectories that start a distance \(\delta_0\) apart in phase space diverge (on average) as \(\delta(t) \approx \delta_0 e^{\lambda t}\), where \(\lambda\) is the Lyapunov exponent. A positive Lyapunov exponent \(\lambda > 0\) indicates chaos: initial uncertainties grow exponentially, making long-term prediction impossible after a time \(t_\lambda \sim \lambda^{-1}\ln(\Delta/\delta_0)\) where \(\Delta\) is the desired accuracy.
</div>

The simplest mechanical example of chaos is the **double pendulum** — a pendulum with a second pendulum attached to its bob. For small amplitudes, both pendulums execute normal modes and the motion is regular and predictable. For large amplitudes, the motion becomes chaotic: trajectories starting nanometres apart in phase space diverge exponentially, with typical Lyapunov exponent \(\lambda \sim 1\,\text{s}^{-1}\), so that after 60 seconds the trajectories have diverged by a factor of \(e^{60} \sim 10^{26}\) — making reliable prediction beyond \(\sim 30\,\text{s}\) impossible without perfect initial conditions.

The **three-body problem** in celestial mechanics is chaotic for most initial conditions, as Poincaré showed in 1890 (nearly winning the prize that led to the discovery of the error). The solar system itself is weakly chaotic: Lyapunov time estimates range from 5 to 50 million years for the inner planets, meaning that while the solar system is stable on human timescales, its configuration in the very distant future is in principle unpredictable. This has implications for planetary formation models and for understanding the distribution of asteroids and comets.

The concept of chaos resolved a long-standing philosophical debate about determinism and free will. Even in a fully deterministic universe governed by Newton's laws, **computational irreducibility** (Wolfram) and exponential sensitivity to initial conditions mean that the future is not practically predictable from the present, even in principle, because any finite-precision measurement of initial conditions introduces errors that grow exponentially. This is not randomness — quantum mechanics notwithstanding — but a fundamental limitation of classical determinism.

# Chapter 16: Special Topics in Mechanics

## 16.1 Coupled Oscillators — The Wave Equation

The transition from discrete coupled oscillators to continuous waves is one of the most profound passages in physics. Consider \(N\) equal masses \(m\) connected by identical springs of constant \(k\) and natural length \(a\), forming a chain. The equation of motion for mass \(j\) is:

\[
m\ddot{u}_j = k(u_{j+1} - u_j) - k(u_j - u_{j-1}) = k(u_{j+1} - 2u_j + u_{j-1})
\]

We seek normal mode solutions \(u_j(t) = U_j e^{i\omega t}\). Substituting and writing \(u_j = U e^{iqja}\) (travelling wave ansatz):

\[
-\omega^2 m U e^{iqja} = k U\left(e^{iqa} - 2 + e^{-iqa}\right)e^{iqja} = -2k(1 - \cos qa)U e^{iqja}
\]

This gives the **dispersion relation**:

\[
\omega^2 = \frac{2k}{m}(1 - \cos qa) = \frac{4k}{m}\sin^2\!\left(\frac{qa}{2}\right)
\]

or \(\omega = 2\sqrt{k/m}\,|\sin(qa/2)|\). In the **long-wavelength limit** \(qa \ll 1\): \(\sin(qa/2) \approx qa/2\), so \(\omega \approx a\sqrt{k/m}\,q\). This is a linear (non-dispersive) dispersion relation with phase velocity \(c = a\sqrt{k/m}\). Taking the continuum limit (\(a \to 0\), \(N \to \infty\), keeping \(Na = L\) and defining the elastic modulus \(Y = ka\)): the discrete equation becomes the **wave equation**:

\[
\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}, \quad c = \sqrt{Y/\mu}
\]

where \(\mu = m/a\) is the linear mass density. The wave equation is second-order in both space and time, admits plane wave solutions \(u = A\cos(kx - \omega t + \phi)\), and describes transverse waves on strings, longitudinal sound waves in rods, pressure waves in fluids, and — with the appropriate generalisation — electromagnetic waves, gravitational waves, and the de Broglie waves of quantum mechanics.

## 16.2 Energy and Power in Waves

A travelling wave on a string carries energy. For a transverse wave \(y(x,t) = A\cos(kx - \omega t)\) on a string with linear density \(\mu\) and tension \(T\):

The kinetic energy density is \(\frac{1}{2}\mu(\partial y/\partial t)^2 = \frac{1}{2}\mu \omega^2 A^2\sin^2(kx-\omega t)\) and the potential energy density is \(\frac{1}{2}T(\partial y/\partial x)^2 = \frac{1}{2}Tk^2A^2\sin^2(kx-\omega t)\). Since \(T = \mu c^2\) and \(\omega = ck\), the two are equal (kinetic equals potential energy, as in SHM): total energy density \(\bar{u} = \mu\omega^2 A^2/2\). The power (energy flux) carried by the wave is:

\[
P = \bar{u} \cdot c = \frac{1}{2}\mu\omega^2 A^2 c = \frac{1}{2}\sqrt{T\mu}\,\omega^2 A^2
\]

This is proportional to the square of the amplitude and the square of the frequency, a result that generalises to all wave types. In three dimensions, the power per unit area (**intensity**) of a sound wave is \(I = \frac{1}{2}\rho\omega^2 A^2 c_s\) where \(\rho\) is the bulk density and \(c_s\) is the sound speed. The decibel scale for sound intensity is logarithmic: \(\beta = 10\log_{10}(I/I_0)\) dB, with reference intensity \(I_0 = 10^{-12}\,\text{W/m}^2\) (threshold of hearing at 1 kHz).

## 16.3 The Quantum Harmonic Oscillator — A Preview

Quantum mechanics replaces the classical trajectory \((x(t), p(t))\) with a wave function \(\psi(x,t)\) satisfying the Schrödinger equation. For a harmonic oscillator potential \(U = \frac{1}{2}kx^2 = \frac{1}{2}m\omega_0^2 x^2\), the time-independent Schrödinger equation:

\[
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2} + \frac{1}{2}m\omega_0^2 x^2\psi = E\psi
\]

has solutions only for discrete energy eigenvalues:

\[
E_n = \hbar\omega_0\left(n + \frac{1}{2}\right), \quad n = 0, 1, 2, \ldots
\]

The **zero-point energy** \(E_0 = \frac{1}{2}\hbar\omega_0\) is a consequence of the Heisenberg uncertainty principle: if the particle were exactly at rest at \(x = 0\), its position and momentum would both be perfectly defined, violating \(\Delta x \Delta p \geq \hbar/2\). The ground state is a Gaussian wave packet \(\psi_0(x) = (m\omega_0/\pi\hbar)^{1/4}e^{-m\omega_0 x^2/(2\hbar)}\).

The **equal spacing** of energy levels (\(\Delta E = \hbar\omega_0\) between adjacent levels) has deep consequences. It means that a quantum harmonic oscillator can absorb or emit energy only in packets of \(\hbar\omega_0\), and the oscillator in level \(n\) can be thought of as containing \(n\) **quanta** (photons for electromagnetic oscillators, phonons for lattice vibrations, etc.). This is the foundation of quantum field theory: every field mode is a quantum harmonic oscillator, and particles are the quanta of these modes. The zero-point energy of quantum fields (summed over all modes) gives a divergent vacuum energy density, whose physical interpretation remains one of the deepest unsolved problems in theoretical physics — it is intimately connected to the cosmological constant problem and the nature of dark energy.
