---
title: "PHYS 363: Intermediate Classical Mechanics"
prof: "Avery Broderick"
---

## Sources and References

These notes synthesize material from the following textbooks and standard references. They are not transcribed from any specific term's lectures.

**Primary textbook**
- S. T. Thornton and J. B. Marion, *Classical Dynamics of Particles and Systems*, 5th ed. (Brooks/Cole, 2004)

**Supplementary graduate texts**
- H. Goldstein, C. P. Poole, and J. L. Safko, *Classical Mechanics*, 3rd ed. (Addison-Wesley, 2002)
- L. D. Landau and E. M. Lifshitz, *Mechanics*, Course of Theoretical Physics Vol. 1, 3rd ed. (Butterworth-Heinemann, 1976)

**Online lecture notes**
- D. Tong, *Classical Dynamics* (University of Cambridge, 2005) — damtp.cam.ac.uk/user/tong/dynamics.html
- R. Fitzpatrick, *Classical Mechanics* (University of Texas) — farside.ph.utexas.edu/teaching/336k/Newtonhtml

---

# Chapter 1: Calculus of Variations

## The Variational Problem

Classical mechanics, at its deepest level, is not merely a collection of force laws and equations of motion — it is a statement about how nature extremizes certain quantities. Before we can appreciate this profound insight, we need to develop the mathematical language of the *calculus of variations*, which asks a fundamentally different kind of question than ordinary calculus. While ordinary calculus asks for the value of a variable that extremizes a function, variational calculus asks for the *function* that extremizes a *functional* — a rule that assigns a number to each function in some space.

To make this concrete, consider the following question: among all smooth curves connecting two fixed points \((x_1, y_1)\) and \((x_2, y_2)\) in a plane, which curve minimizes the arc length? Your geometric intuition says the straight line, but how would you prove it? The arc length is

\[L[y] = \int_{x_1}^{x_2} \sqrt{1 + \left(\frac{dy}{dx}\right)^2}\, dx,\]

which is a rule that takes a function \(y(x)\) and returns a number \(L\). This is the prototypical *functional*, and finding the \(y(x)\) that minimizes it is a variational problem. The square brackets in \(L[y]\) denote this functional dependence, distinguishing it from ordinary function notation.

More generally, we are interested in functionals of the form

\[J[y] = \int_{x_1}^{x_2} f\!\left(y, y', x\right) dx,\]

where \(y' = dy/dx\) and the integrand \(f\) is a given function of three variables. The endpoints \(y(x_1) = y_1\) and \(y(x_2) = y_2\) are fixed. The problem is to find the function \(y(x)\) that renders \(J\) stationary — either a minimum, maximum, or saddle point.

### The Euler-Lagrange Equation

To find the extremizing function, we follow an argument developed independently by Euler and Lagrange in the eighteenth century. Suppose \(y(x)\) is the true extremizing function. Consider a family of nearby functions

\[Y(x, \epsilon) = y(x) + \epsilon\, \eta(x),\]

where \(\eta(x)\) is an arbitrary smooth function satisfying \(\eta(x_1) = \eta(x_2) = 0\) (so that all members of the family share the same endpoints), and \(\epsilon\) is a small parameter. Substituting into the functional,

\[J(\epsilon) = \int_{x_1}^{x_2} f\!\left(Y, Y', x\right) dx = \int_{x_1}^{x_2} f\!\left(y + \epsilon\eta,\, y' + \epsilon\eta',\, x\right) dx.\]

Since \(y(x)\) extremizes \(J\), we must have

\[\left.\frac{dJ}{d\epsilon}\right|_{\epsilon=0} = 0\]

for *all* admissible \(\eta(x)\). Differentiating under the integral sign:

\[\frac{dJ}{d\epsilon} = \int_{x_1}^{x_2} \left(\frac{\partial f}{\partial Y}\eta + \frac{\partial f}{\partial Y'}\eta'\right) dx.\]

The second term is integrated by parts: \(\int \frac{\partial f}{\partial y'}\eta'\, dx = \left[\frac{\partial f}{\partial y'}\eta\right]_{x_1}^{x_2} - \int \frac{d}{dx}\!\left(\frac{\partial f}{\partial y'}\right)\eta\, dx\). The boundary term vanishes because \(\eta(x_1) = \eta(x_2) = 0\). Setting the result to zero:

\[\left.\frac{dJ}{d\epsilon}\right|_{\epsilon=0} = \int_{x_1}^{x_2} \left[\frac{\partial f}{\partial y} - \frac{d}{dx}\!\left(\frac{\partial f}{\partial y'}\right)\right]\eta(x)\, dx = 0.\]

Since this must hold for *every* \(\eta(x)\), the fundamental lemma of the calculus of variations tells us that the bracket must vanish identically:

<div class="theorem">
<strong>The Euler-Lagrange Equation.</strong> The function \(y(x)\) that renders \(J[y] = \int_{x_1}^{x_2} f(y, y', x)\, dx\) stationary satisfies

\[\frac{\partial f}{\partial y} - \frac{d}{dx}\!\left(\frac{\partial f}{\partial y'}\right) = 0.\]
</div>

This single equation encodes an enormous amount of physics. Let us verify the intuitive examples before moving on.

### The Fundamental Lemma

The fundamental lemma of variational calculus deserves its own statement: if \(\int_a^b g(x)\eta(x)\, dx = 0\) for all continuous \(\eta(x)\) vanishing at the endpoints, then \(g(x) = 0\) for all \(x \in [a,b]\). The proof is by contradiction — if \(g\) were nonzero somewhere, say \(g(x_0) > 0\), then by continuity \(g > 0\) in some neighborhood, and we could choose \(\eta\) to be a bump function supported in that neighborhood, making the integral positive. This innocent-looking lemma is the key that converts an integral condition into a differential equation.

## Classical Examples of the Variational Approach

### Shortest Path: The Straight Line

For the arc-length problem, \(f = \sqrt{1 + y'^2}\). Computing the partial derivatives: \(\partial f/\partial y = 0\) and \(\partial f/\partial y' = y'/\sqrt{1 + y'^2}\). The Euler-Lagrange equation gives

\[\frac{d}{dx}\!\left(\frac{y'}{\sqrt{1+y'^2}}\right) = 0,\]

which implies \(y'/\sqrt{1+y'^2} = \text{const}\), hence \(y' = \text{const}\), meaning \(y = mx + b\). The geodesic in flat space is indeed a straight line.

### Brachistochrone: The Fastest Descent

Johann Bernoulli posed this classic problem in 1696: find the curve down which a bead slides from one point to another (not directly below) in minimum time, under gravity. Let the starting point be the origin and the ending point be \((x_2, y_2)\) with \(y\) measured downward. By energy conservation, the speed at depth \(y\) is \(v = \sqrt{2gy}\). The time of travel is

\[T[y] = \int_0^{x_2} \frac{ds}{v} = \int_0^{x_2} \frac{\sqrt{1+y'^2}}{\sqrt{2gy}}\, dx.\]

Here \(f = \sqrt{(1+y'^2)/2gy}\). Since \(f\) has no explicit \(x\) dependence, we can use the **Beltrami identity** (derived below): \(f - y'\,\partial f/\partial y' = \text{const}\). After algebra, this yields the parametric solution

\[x = a(\theta - \sin\theta), \quad y = a(1 - \cos\theta),\]

which is a *cycloid* — the curve traced by a point on the rim of a rolling circle. This beautiful result demonstrates that variational methods can yield non-trivial and surprising answers.

### The Beltrami Identity

When the integrand \(f(y, y', x)\) does not depend explicitly on \(x\), there is a conserved quantity analogous to energy conservation. Consider

\[\frac{df}{dx} = \frac{\partial f}{\partial y}y' + \frac{\partial f}{\partial y'}y'' + \frac{\partial f}{\partial x}.\]

If \(\partial f / \partial x = 0\), using the Euler-Lagrange equation to replace \(\partial f/\partial y = \frac{d}{dx}(\partial f/\partial y')\):

\[\frac{df}{dx} = \frac{d}{dx}\!\left(\frac{\partial f}{\partial y'}\right)y' + \frac{\partial f}{\partial y'}y'' = \frac{d}{dx}\!\left(y'\frac{\partial f}{\partial y'}\right).\]

Therefore \(\frac{d}{dx}\!\left(f - y'\frac{\partial f}{\partial y'}\right) = 0\), giving the **Beltrami identity**:

\[f - y'\frac{\partial f}{\partial y'} = \text{const}.\]

This is the first integral of the Euler-Lagrange equation when \(f\) has no explicit \(x\) dependence, directly analogous to energy conservation.

## Generalization to Multiple Functions

In physics, we almost never deal with a single function. A particle in three dimensions requires three coordinates, a rigid body six. The variational formalism extends naturally. Consider \(n\) functions \(y_1(x), \ldots, y_n(x)\) and a functional

\[J[y_1, \ldots, y_n] = \int_{x_1}^{x_2} f(y_1, \ldots, y_n, y_1', \ldots, y_n', x)\, dx.\]

Varying each \(y_i\) independently, the condition \(\delta J = 0\) yields \(n\) independent Euler-Lagrange equations:

\[\frac{\partial f}{\partial y_i} - \frac{d}{dx}\!\left(\frac{\partial f}{\partial y_i'}\right) = 0, \quad i = 1, 2, \ldots, n.\]

This is the generalization we need for mechanics: the "x" will become time \(t\), the \(y_i\) will become generalized coordinates \(q_i\), and \(f\) will become the Lagrangian \(\mathcal{L} = T - V\).

## Calculus of Variations with Constraints

### Isoperimetric Constraints

A more subtle class of variational problems involves constraints. The **isoperimetric problem** — the oldest such problem — asks: among all closed curves of fixed perimeter \(L\), which encloses the greatest area? (The answer is the circle.) More generally, we may wish to extremize \(J[y] = \int f\, dx\) subject to the constraint \(K[y] = \int g\, dx = \text{const}\).

The method of **Lagrange multipliers** extends beautifully to this setting. Introduce the modified functional

\[\tilde{J}[y] = \int_{x_1}^{x_2} (f + \lambda g)\, dx,\]

where \(\lambda\) is a constant (the Lagrange multiplier). The constrained extremum of \(J\) satisfies the Euler-Lagrange equation for \(f + \lambda g\):

\[\frac{\partial(f + \lambda g)}{\partial y} - \frac{d}{dx}\!\left(\frac{\partial(f + \lambda g)}{\partial y'}\right) = 0.\]

The value of \(\lambda\) is then determined by enforcing the constraint \(K[y] = \text{const}\).

<div class="example">
<strong>Example: Catenary.</strong> A flexible inextensible chain of length \(L\) hangs between two fixed points under gravity. Find the shape that minimizes the potential energy.

The potential energy is \(V = \int \rho g y\, ds = \int \rho g y\sqrt{1+y'^2}\, dx\), so \(f = \rho g y\sqrt{1+y'^2}\). The constraint is that the arc length equals \(L\): \(\int \sqrt{1+y'^2}\, dx = L\), so \(g = \sqrt{1+y'^2}\). The Euler-Lagrange equation for \(f + \lambda g = (\rho g y + \lambda)\sqrt{1+y'^2}\) yields, after calculation, the solution

\[y = a\cosh\!\left(\frac{x-b}{a}\right) + c,\]

where \(a = -\lambda/\rho g\). This **catenary** shape arises naturally whenever a flexible chain or cable hangs under its own weight.
</div>

### Holonomic Constraints via Lagrange Multipliers

The Lagrange multiplier method also handles constraints of the form \(g(y_1, \ldots, y_n, x) = 0\). Rather than eliminating a variable, we add \(\lambda(x) g\) to the integrand with an *undetermined function* \(\lambda(x)\). The resulting system has additional equations (the constraint equations themselves) that determine both the extremizing functions and the multipliers. Importantly, the multipliers carry physical meaning — they represent the forces of constraint.

## Coordinates, Constraints, and Degrees of Freedom

### Generalized Coordinates

Before embarking on Lagrangian mechanics proper, we need the concept of **generalized coordinates**. A mechanical system of \(N\) particles in three dimensions has \(3N\) degrees of freedom in principle, but constraints reduce this number. A **constraint** is a restriction on the system's configuration.

**Holonomic constraints** are those expressible as equations of the form \(f(r_1, r_2, \ldots, r_N, t) = 0\). A bead constrained to a wire, a particle on a surface, and a rigid body (with all inter-particle distances fixed) are holonomic constraints. Each independent holonomic constraint reduces the degrees of freedom by one.

**Non-holonomic constraints** are constraints involving velocities in ways that cannot be integrated to give positional constraints. A ball rolling without slipping on a surface provides the classic example: the rolling condition \(v = \omega R\) cannot be integrated to give a relation between positions alone (because the ball can roll in different directions and return to its starting position having rotated by a net angle). Non-holonomic constraints do not reduce the dimension of configuration space but do restrict the accessible velocities.

If a system has \(3N\) coordinates and \(k\) holonomic constraints, it has \(n = 3N - k\) **degrees of freedom**. We introduce \(n\) generalized coordinates \(q_1, q_2, \ldots, q_n\) that parameterize the configuration space completely and independently. The Cartesian coordinates are then functions of the generalized coordinates: \(\mathbf{r}_i = \mathbf{r}_i(q_1, \ldots, q_n, t)\).

### Virtual Displacements and D'Alembert's Principle

A **virtual displacement** \(\delta\mathbf{r}_i\) is an infinitesimal displacement consistent with the constraints at a fixed instant of time. For holonomic constraints expressed via generalized coordinates,

\[\delta\mathbf{r}_i = \sum_{j=1}^n \frac{\partial \mathbf{r}_i}{\partial q_j}\delta q_j.\]

**D'Alembert's principle** states that the constraint forces do no virtual work for systems with workless constraints:

\[\sum_i \left(\mathbf{F}_i^{(\text{applied})} - m_i\ddot{\mathbf{r}}_i\right) \cdot \delta\mathbf{r}_i = 0.\]

This principle bridges Newtonian mechanics and the Lagrangian formulation. By expressing everything in terms of generalized coordinates and carrying out the algebra (using the "kinematic identity" \(\partial\dot{\mathbf{r}}_i/\partial\dot{q}_j = \partial\mathbf{r}_i/\partial q_j\)), D'Alembert's principle yields the **Lagrange equations of motion** directly, without ever having to introduce or deal with constraint forces explicitly.

---

# Chapter 2: Lagrangian Mechanics

## Hamilton's Principle

The Lagrangian formulation of mechanics rests on a single foundational statement known as **Hamilton's principle** (sometimes called the principle of stationary action):

<div class="theorem">
<strong>Hamilton's Principle.</strong> The motion of a mechanical system from configuration \(q(t_1)\) to \(q(t_2)\) is such that the action functional

\[S[q] = \int_{t_1}^{t_2} \mathcal{L}(q_1, \ldots, q_n, \dot{q}_1, \ldots, \dot{q}_n, t)\, dt\]

is stationary with respect to all variations of the path \(q_i(t)\) that vanish at the endpoints.
</div>

Here \(\mathcal{L} = T - V\) is the **Lagrangian**, the difference between kinetic and potential energy. This is not a derived statement (at the level of Newtonian mechanics) but rather a foundational postulate about how nature works. It is however completely equivalent to Newton's second law for conservative systems.

Applying the Euler-Lagrange equation to the action integral immediately gives the **Lagrange equations of motion**:

\[\frac{\partial\mathcal{L}}{\partial q_i} - \frac{d}{dt}\!\left(\frac{\partial\mathcal{L}}{\partial\dot{q}_i}\right) = 0, \quad i = 1, 2, \ldots, n.\]

These \(n\) second-order ODEs fully determine the motion, given initial conditions.

## Generalized Forces and Momenta

The quantities \(\partial\mathcal{L}/\partial\dot{q}_i\) play the role of momenta in generalized coordinates. We define the **generalized momentum** conjugate to \(q_i\) as

\[p_i = \frac{\partial\mathcal{L}}{\partial\dot{q}_i}.\]

For a Cartesian coordinate \(x\), \(\mathcal{L} = \frac{1}{2}m\dot{x}^2 - V\), so \(p_x = m\dot{x}\) — the ordinary linear momentum. For an angle \(\theta\), if \(\mathcal{L} = \frac{1}{2}I\dot\theta^2 - V\), then \(p_\theta = I\dot\theta\) — the angular momentum. The generalized momentum is whatever appears naturally conjugate to the chosen coordinate.

Similarly, the **generalized force** associated with \(q_i\) is \(Q_i = \partial\mathcal{L}/\partial q_i\), and the Lagrange equation reads \(\dot{p}_i = Q_i\) — Newton's second law in generalized form.

## Cyclic Coordinates and Conservation Laws

One of the most powerful features of the Lagrangian formulation is the transparency with which symmetries lead to conservation laws. If the Lagrangian does not depend explicitly on a particular coordinate \(q_k\) — that is, \(\partial\mathcal{L}/\partial q_k = 0\) — then the Lagrange equation gives

\[\frac{d}{dt}\!\left(\frac{\partial\mathcal{L}}{\partial\dot{q}_k}\right) = 0 \implies p_k = \text{const}.\]

Such a coordinate is called **cyclic** or **ignorable**, and its conjugate momentum is conserved. This is the seed from which Noether's theorem grows.

## Constructing the Lagrangian: Procedure and Examples

### General Procedure

Constructing a Lagrangian for a mechanical system involves three steps:
1. Choose generalized coordinates \(q_i\) that satisfy all holonomic constraints — use the minimum number needed.
2. Express the kinetic energy \(T\) in terms of \(q_i\) and \(\dot{q}_i\).
3. Express the potential energy \(V\) in terms of \(q_i\) (for conservative systems).
4. Form \(\mathcal{L} = T - V\) and apply the Euler-Lagrange equations.

<div class="example">
<strong>Example: Particle on a frictionless inclined plane.</strong> A particle of mass \(m\) slides on a frictionless plane inclined at angle \(\alpha\). Let \(x\) measure distance down the slope. The constraint forces (normal force) are automatically eliminated by working with the single coordinate \(x\).

\[T = \frac{1}{2}m\dot{x}^2, \quad V = -mgx\sin\alpha,\]
\[\mathcal{L} = \frac{1}{2}m\dot{x}^2 + mgx\sin\alpha.\]

The Euler-Lagrange equation: \(mg\sin\alpha - m\ddot{x} = 0\), giving \(\ddot{x} = g\sin\alpha\). The result is immediate and the normal force never appears.
</div>

<div class="example">
<strong>Example: Simple pendulum.</strong> A mass \(m\) at the end of a rigid massless rod of length \(\ell\) swings in a vertical plane. The single generalized coordinate is the angle \(\theta\) from vertical.

\[T = \frac{1}{2}m\ell^2\dot\theta^2, \quad V = -mg\ell\cos\theta,\]
\[\mathcal{L} = \frac{1}{2}m\ell^2\dot\theta^2 + mg\ell\cos\theta.\]

Euler-Lagrange: \(-mg\ell\sin\theta - m\ell^2\ddot\theta = 0\), giving \(\ddot\theta + \frac{g}{\ell}\sin\theta = 0\). For small oscillations, \(\sin\theta \approx \theta\), and the period is \(2\pi\sqrt{\ell/g}\).
</div>

<div class="example">
<strong>Example: Atwood's machine.</strong> Two masses \(m_1\) and \(m_2\) connected by an inextensible string over a frictionless pulley. Let \(x\) be the displacement of \(m_1\) downward (so \(m_2\) moves up by the same amount).

\[T = \frac{1}{2}(m_1 + m_2)\dot{x}^2, \quad V = -m_1 g x + m_2 g x,\]
\[\mathcal{L} = \frac{1}{2}(m_1+m_2)\dot{x}^2 + (m_1-m_2)gx.\]

The equation of motion: \(\ddot{x} = \frac{(m_1-m_2)g}{m_1+m_2}\). The inextensibility constraint and the tension in the string are handled automatically.
</div>

### Curvilinear Kinetic Energies

A fundamental skill in Lagrangian mechanics is expressing \(T\) in curvilinear coordinates. In spherical coordinates \((r, \theta, \phi)\):

\[T = \frac{m}{2}\!\left(\dot{r}^2 + r^2\dot\theta^2 + r^2\sin^2\!\theta\,\dot\phi^2\right).\]

In cylindrical coordinates \((\rho, \phi, z)\):

\[T = \frac{m}{2}\!\left(\dot\rho^2 + \rho^2\dot\phi^2 + \dot{z}^2\right).\]

These follow from the kinematic identity \(v^2 = \dot{\mathbf{r}}\cdot\dot{\mathbf{r}}\) expressed in the appropriate coordinate system.

### The Double Pendulum

The double pendulum illustrates the power of the Lagrangian method for coupled systems. Let mass \(m_1\) hang on a rod of length \(\ell_1\) from a fixed pivot, and mass \(m_2\) hang on a rod of length \(\ell_2\) from \(m_1\). The angles \(\theta_1\) and \(\theta_2\) from vertical are the generalized coordinates.

The positions are:
\[x_1 = \ell_1\sin\theta_1, \quad y_1 = -\ell_1\cos\theta_1,\]
\[x_2 = \ell_1\sin\theta_1 + \ell_2\sin\theta_2, \quad y_2 = -\ell_1\cos\theta_1 - \ell_2\cos\theta_2.\]

The kinetic energy is
\[T = \frac{1}{2}m_1\ell_1^2\dot\theta_1^2 + \frac{1}{2}m_2\!\left[\ell_1^2\dot\theta_1^2 + \ell_2^2\dot\theta_2^2 + 2\ell_1\ell_2\dot\theta_1\dot\theta_2\cos(\theta_1-\theta_2)\right],\]

and the potential energy is
\[V = -(m_1+m_2)g\ell_1\cos\theta_1 - m_2 g\ell_2\cos\theta_2.\]

The resulting equations of motion are highly nonlinear and coupled. The double pendulum exhibits chaotic behavior for large amplitudes — a first hint that even simple mechanical systems can be extraordinarily complex.

## Velocity-Dependent Potentials

Hamilton's principle can be extended to systems with velocity-dependent forces, provided those forces can be derived from a *generalized potential* \(U(q_i, \dot{q}_i, t)\) via

\[Q_i = -\frac{\partial U}{\partial q_i} + \frac{d}{dt}\!\left(\frac{\partial U}{\partial\dot{q}_i}\right).\]

The Lagrangian is then \(\mathcal{L} = T - U\). The most important application is to the **Lorentz force** on a charged particle. A charge \(q\) moving with velocity \(\mathbf{v}\) in fields \(\mathbf{E}\) and \(\mathbf{B}\) experiences \(\mathbf{F} = q(\mathbf{E} + \mathbf{v}\times\mathbf{B})\). With the electromagnetic potentials \(\mathbf{A}\) and \(\phi\) (\(\mathbf{B} = \nabla\times\mathbf{A}\), \(\mathbf{E} = -\nabla\phi - \partial\mathbf{A}/\partial t\)), the generalized potential is

\[U = q\phi - q\mathbf{v}\cdot\mathbf{A},\]

and the Lagrangian \(\mathcal{L} = \frac{1}{2}mv^2 - q\phi + q\mathbf{v}\cdot\mathbf{A}\) reproduces the Lorentz force exactly.

## Symmetry and Conservation Laws: Noether's Theorem

The connection between symmetries and conservation laws is one of the deepest results in all of physics. In the Lagrangian framework, this connection is made precise by **Noether's theorem** (Emmy Noether, 1915).

### Continuous Symmetries

A **symmetry transformation** is a continuous transformation of the generalized coordinates that leaves the action invariant. Consider a one-parameter family of transformations

\[q_i \to q_i + \epsilon\, \delta q_i(q, t) + \mathcal{O}(\epsilon^2).\]

The action is invariant if \(\mathcal{L}\) transforms as \(\mathcal{L} \to \mathcal{L} + \epsilon\, \frac{d\Lambda}{dt}\) for some function \(\Lambda\) (since a total time derivative does not affect the equations of motion).

<div class="theorem">
<strong>Noether's Theorem.</strong> If the action is invariant under the one-parameter transformation \(q_i \to q_i + \epsilon\,\delta q_i\), then the quantity

\[I = \sum_i \frac{\partial\mathcal{L}}{\partial\dot{q}_i}\delta q_i - \Lambda\]

is conserved along any solution of the equations of motion: \(\dot{I} = 0\).
</div>

The proof follows by direct differentiation of \(I\) and using the equations of motion.

### The Energy Function and Conservation of Energy

Consider time translation: \(t \to t + \epsilon\), which for a system with no explicit time dependence (\(\partial\mathcal{L}/\partial t = 0\)) is a symmetry. The corresponding conserved quantity is the **energy function** (or Jacobi integral)

\[h = \sum_i \dot{q}_i\frac{\partial\mathcal{L}}{\partial\dot{q}_i} - \mathcal{L}.\]

For systems where \(T\) is a homogeneous quadratic function of the \(\dot{q}_i\) and \(V\) is independent of \(\dot{q}_i\), Euler's theorem gives \(\sum \dot{q}_i(\partial T/\partial \dot{q}_i) = 2T\), so

\[h = 2T - (T - V) = T + V = E,\]

the total mechanical energy. When \(\partial\mathcal{L}/\partial t = 0\), energy is conserved.

### Momentum Conservation and Translational Symmetry

If the system is invariant under translation in the \(x\) direction — that is, \(x_i \to x_i + \epsilon\) for all particles — then the corresponding conserved quantity is the total linear momentum \(P_x = \sum_i m_i\dot{x}_i\). More formally, if the Lagrangian is unchanged when all particle \(x\)-coordinates are shifted by the same constant, then \(\partial\mathcal{L}/\partial x_i = 0\) for all \(i\) collectively (as a symmetry of the system), giving conservation of \(p_x\).

### Angular Momentum Conservation and Rotational Symmetry

Invariance under rotation about an axis corresponds to conservation of the angular momentum component about that axis. For a rotationally symmetric potential \(V = V(r)\) in spherical coordinates, the Lagrangian is independent of \(\phi\), making \(\phi\) cyclic and conserving \(p_\phi = mr^2\sin^2\!\theta\,\dot\phi = L_z\), the \(z\)-component of angular momentum.

## Lagrangian Mechanics with Non-Conservative Forces

When dissipative forces (friction, drag) are present, they cannot be derived from a potential. We must add them separately. The equations of motion become

\[\frac{\partial\mathcal{L}}{\partial q_i} - \frac{d}{dt}\!\left(\frac{\partial\mathcal{L}}{\partial\dot{q}_i}\right) = Q_i^{(\text{nc})},\]

where \(Q_i^{(\text{nc})} = \sum_j \mathbf{F}_j^{(\text{nc})}\cdot\partial\mathbf{r}_j/\partial q_i\) are the generalized non-conservative forces. For viscous damping forces proportional to velocity (\(F_i = -b_i\dot{q}_i\)), Rayleigh introduced the **dissipation function**

\[\mathcal{F} = \frac{1}{2}\sum_i b_i\dot{q}_i^2,\]

so that \(Q_i^{(\text{nc})} = -\partial\mathcal{F}/\partial\dot{q}_i\).

## Lagrange Multipliers in Mechanics: Constraint Forces

When we want to know the forces of constraint (not just the motion), we can use Lagrange multipliers directly in the equations of motion. For a system with holonomic constraints \(f_k(q, t) = 0\), the modified Lagrange equations are

\[\frac{\partial\mathcal{L}}{\partial q_i} - \frac{d}{dt}\!\left(\frac{\partial\mathcal{L}}{\partial\dot{q}_i}\right) + \sum_k \lambda_k(t)\frac{\partial f_k}{\partial q_i} = 0.\]

The term \(\lambda_k \partial f_k/\partial q_i\) represents the generalized constraint force associated with constraint \(k\). This method is also essential for semi-holonomic constraints (velocity constraints that can be written as \(\sum_i a_{ki}\dot{q}_i + a_{kt} = 0\)) that cannot be integrated to give holonomic constraints.

<div class="example">
<strong>Example: Bead on a rotating hoop.</strong> A bead of mass \(m\) slides on a circular hoop of radius \(R\) that rotates about its vertical diameter with constant angular velocity \(\omega\). The bead's position is described by the single angle \(\theta\) from the top of the hoop. The kinetic energy is

\[T = \frac{1}{2}mR^2\!\left(\dot\theta^2 + \omega^2\sin^2\!\theta\right),\]

and the potential energy is \(V = -mgR\cos\theta\). The Lagrangian gives

\[mR^2\ddot\theta = mR^2\omega^2\sin\theta\cos\theta - mgR\sin\theta = mR\sin\theta\!\left(R\omega^2\cos\theta - g\right).\]

The equilibrium angles satisfy \(\sin\theta = 0\) or \(\cos\theta_0 = g/R\omega^2\). The second solution only exists when \(\omega > \sqrt{g/R}\), giving a non-trivial equilibrium — this is a beautiful example of spontaneous symmetry breaking in classical mechanics.
</div>

---

# Chapter 3: The Kepler Problem

## Central Force Motion

Before solving the Kepler problem, we develop the general theory of central force motion. A **central force** is one directed along the line connecting two bodies, with magnitude depending only on the separation: \(\mathbf{F} = F(r)\hat{r}\). Gravity and electrostatics are central forces.

For a two-body problem, the center-of-mass motion separates exactly. In the center-of-mass frame, the problem reduces to a one-body problem with the **reduced mass**

\[\mu = \frac{m_1 m_2}{m_1 + m_2},\]

moving under the central force. Henceforth we work in this reduced frame.

In polar coordinates \((r, \phi)\), the Lagrangian is

\[\mathcal{L} = \frac{\mu}{2}\!\left(\dot{r}^2 + r^2\dot\phi^2\right) - V(r).\]

Since \(\phi\) is cyclic, the conjugate momentum is conserved:

\[\ell = \mu r^2\dot\phi = \text{const}\]

— this is the **angular momentum**. The energy is also conserved:

\[E = \frac{\mu}{2}\!\left(\dot{r}^2 + r^2\dot\phi^2\right) + V(r) = \frac{\mu}{2}\dot{r}^2 + \frac{\ell^2}{2\mu r^2} + V(r).\]

The term \(\ell^2/(2\mu r^2)\) acts as a **centrifugal potential** — it represents the energy cost of angular motion.

### The Orbit Equation

Eliminating time from the equations of motion (using \(\dot\phi = \ell/\mu r^2\) to change independent variable from \(t\) to \(\phi\)), we obtain the **Binet equation**. With the substitution \(u = 1/r\):

\[\frac{d^2u}{d\phi^2} + u = -\frac{\mu}{\ell^2}\frac{1}{u^2}F(1/u).\]

For an inverse-square force \(F(r) = -k/r^2\) (gravity: \(k = G\mu M\)):

\[\frac{d^2u}{d\phi^2} + u = \frac{\mu k}{\ell^2}.\]

This is a simple harmonic oscillator in \(u\) with a constant forcing term, and its general solution is

\[u = \frac{\mu k}{\ell^2}\!\left(1 + e\cos(\phi - \phi_0)\right) \implies r = \frac{p}{1 + e\cos(\phi - \phi_0)},\]

where \(p = \ell^2/\mu k\) is the **semi-latus rectum** and \(e\) is the **eccentricity**. This is the equation of a **conic section** with the origin at one focus.

## Kepler's Laws and Orbital Mechanics

### First Law: Elliptical Orbits

The shape \(r = p/(1 + e\cos\phi)\) is an ellipse for \(0 \le e < 1\), a parabola for \(e = 1\), and a hyperbola for \(e > 1\). For bound orbits (\(E < 0\)), the eccentricity satisfies

\[e = \sqrt{1 + \frac{2E\ell^2}{\mu k^2}},\]

which is less than one when \(E < 0\). The semi-major axis is \(a = p/(1-e^2) = k/(2|E|)\), independent of \(\ell\) — the energy depends only on the size, not the shape, of the orbit.

### Second Law: Equal Areas

The angular momentum conservation \(\dot\phi = \ell/\mu r^2\) implies that the rate of sweeping area is constant:

\[\frac{dA}{dt} = \frac{1}{2}r^2\dot\phi = \frac{\ell}{2\mu} = \text{const}.\]

This is **Kepler's second law** — the radius vector sweeps equal areas in equal times. It is a direct consequence of angular momentum conservation and holds for *any* central force.

### Third Law: Period-Semimajor Axis Relation

The period \(T\) is the total area of the ellipse divided by the areal velocity: \(T = \pi ab / (\ell/2\mu)\), where \(b = a\sqrt{1-e^2}\) is the semi-minor axis. After simplification:

\[T^2 = \frac{4\pi^2\mu}{k}a^3 = \frac{4\pi^2}{GM}a^3,\]

giving \(T^2 \propto a^3\) — **Kepler's third law**. Crucially, the period depends only on \(a\) (hence on the energy), not on the eccentricity.

### The Effective Potential and Orbit Classification

The **effective potential**

\[V_{\text{eff}}(r) = V(r) + \frac{\ell^2}{2\mu r^2} = -\frac{k}{r} + \frac{\ell^2}{2\mu r^2}\]

governs the radial motion: \(\frac{\mu}{2}\dot{r}^2 = E - V_{\text{eff}}(r)\). The orbit is possible only where \(E \ge V_{\text{eff}}(r)\). The minimum of \(V_{\text{eff}}\) at \(r_0 = \ell^2/\mu k\) corresponds to circular orbit at that radius. For \(E = V_{\text{eff}}(r_0)\), the orbit is circular; for \(V_{\text{eff}}(r_0) < E < 0\), elliptical; for \(E = 0\), parabolic; for \(E > 0\), hyperbolic.

### Orbital Mechanics: Turning Points and Apsides

The radial turning points (where \(\dot{r} = 0\)) are the **apsidal distances** — the periapsis \(r_{\min} = a(1-e)\) and apoapsis \(r_{\max} = a(1+e)\). They satisfy

\[E = V_{\text{eff}}(r_{\min,\max}) \implies E = -\frac{k}{r} + \frac{\ell^2}{2\mu r^2},\]

a quadratic in \(1/r\).

### Stability of Circular Orbits

A circular orbit is stable if small radial perturbations lead to bounded oscillations. For \(V_{\text{eff}}(r)\) with minimum at \(r_0\), the frequency of radial oscillations is

\[\omega_r^2 = \frac{1}{\mu}V_{\text{eff}}''(r_0).\]

For an inverse-square force, \(\omega_r = \omega_\phi\) (the radial and azimuthal frequencies match), so the orbit closes after one revolution — this is the exceptional property of the \(1/r^2\) force (and the harmonic oscillator) that produces closed orbits, known as **Bertrand's theorem**.

---

# Chapter 4: Non-Inertial Reference Frames

## Rotating Frames

In many physical situations, it is most natural to work in a non-inertial frame — a frame that is accelerating or rotating. Earth's surface is the most important example: it rotates with the Earth, making it non-inertial. Understanding how Newton's laws are modified in such frames requires relating time derivatives in the inertial and rotating frames.

### The Operator Identity

Consider a vector \(\mathbf{A}\) and two frames: an inertial frame \(S\) and a frame \(S'\) rotating with angular velocity \(\boldsymbol\Omega\) relative to \(S\). If \(\hat{e}_i'\) are the basis vectors of \(S'\), then

\[\left(\frac{d\mathbf{A}}{dt}\right)_S = \left(\frac{d\mathbf{A}}{dt}\right)_{S'} + \boldsymbol\Omega\times\mathbf{A}.\]

The time derivative in the inertial frame equals the time derivative in the rotating frame plus a correction term \(\boldsymbol\Omega\times\mathbf{A}\) that accounts for the rotation of the basis vectors themselves. This identity is the key to everything that follows.

Denoting \((d/dt)_S = \dot{}\ \) and \((d/dt)_{S'} = \dot{}\big|'\), we write this as the operator relation

\[\left.\frac{d}{dt}\right|_S = \left.\frac{d}{dt}\right|_{S'} + \boldsymbol\Omega\times.\]

### Velocity and Acceleration in the Rotating Frame

Let the position of a particle be \(\mathbf{r}\) relative to the origin of the rotating frame. Applying the operator identity to \(\mathbf{r}\):

\[\dot{\mathbf{r}}_S = \dot{\mathbf{r}}_{S'} + \boldsymbol\Omega\times\mathbf{r} = \mathbf{v}' + \boldsymbol\Omega\times\mathbf{r},\]

where \(\mathbf{v}' = \dot{\mathbf{r}}_{S'}\) is the velocity as measured in the rotating frame.

Applying the identity again to \(\dot{\mathbf{r}}_S\):

\[\ddot{\mathbf{r}}_S = \left.\frac{d}{dt}\right|_{S'}\!\!\left(\mathbf{v}' + \boldsymbol\Omega\times\mathbf{r}\right) + \boldsymbol\Omega\times\!\left(\mathbf{v}' + \boldsymbol\Omega\times\mathbf{r}\right).\]

Expanding (assuming \(\dot{\boldsymbol\Omega} = 0\) for simplicity):

\[\ddot{\mathbf{r}}_S = \ddot{\mathbf{r}}_{S'} + 2\boldsymbol\Omega\times\mathbf{v}' + \boldsymbol\Omega\times(\boldsymbol\Omega\times\mathbf{r}).\]

### The Equation of Motion in the Rotating Frame

Newton's second law in the inertial frame is \(m\ddot{\mathbf{r}}_S = \mathbf{F}\). In the rotating frame, substituting the expression for \(\ddot{\mathbf{r}}_S\):

\[m\ddot{\mathbf{r}}' = \mathbf{F} - 2m\boldsymbol\Omega\times\mathbf{v}' - m\boldsymbol\Omega\times(\boldsymbol\Omega\times\mathbf{r}).\]

The two fictitious forces are:

1. **Coriolis force**: \(\mathbf{F}_{\text{Cor}} = -2m\boldsymbol\Omega\times\mathbf{v}'\). This force is perpendicular to the velocity and causes moving objects to curve. It depends on velocity.

2. **Centrifugal force**: \(\mathbf{F}_{\text{cf}} = -m\boldsymbol\Omega\times(\boldsymbol\Omega\times\mathbf{r}) = m\omega^2\mathbf{r}_\perp\), where \(\mathbf{r}_\perp\) is the component of \(\mathbf{r}\) perpendicular to \(\boldsymbol\Omega\). This force points outward from the rotation axis.

If the rotating frame also translates (origin accelerating with \(\mathbf{a}_0\)), there is an additional **Euler force** \(-m\dot{\boldsymbol\Omega}\times\mathbf{r}\) for time-varying \(\boldsymbol\Omega\), and a **translational fictitious force** \(-m\mathbf{a}_0\).

## Applications: Earth as a Rotating Frame

### Effective Gravity

The effective gravitational field on Earth's surface combines true gravity and the centrifugal acceleration:

\[\mathbf{g}_{\text{eff}} = \mathbf{g}_0 + \omega^2\mathbf{r}_\perp,\]

where \(\mathbf{g}_0\) is the gravitational acceleration toward Earth's center and \(\omega = 7.27\times 10^{-5}\text{ rad/s}\) is Earth's rotation rate. At the equator, the centrifugal contribution is \(\omega^2 R_E \approx 0.034\text{ m/s}^2\), about 0.35% of \(g\). The effective gravity is not directed exactly toward Earth's center, causing a slight equatorial bulge.

### Free Fall and the Coriolis Deflection

For a particle falling freely from height \(h\) above the equator, the Coriolis force \(-2m\boldsymbol\Omega\times\mathbf{v}'\) causes an eastward deflection. To first order in \(\Omega\):

\[\delta x_{\text{east}} = \frac{1}{3}\Omega\sqrt{\frac{8h^3}{g}}\cos\lambda,\]

where \(\lambda\) is the latitude. For \(h = 100\text{ m}\) at the equator, \(\delta x \approx 22\text{ mm}\).

### The Foucault Pendulum

The Foucault pendulum is perhaps the most dramatic demonstration of Earth's rotation. A pendulum bob oscillates while the Coriolis force causes the plane of oscillation to precess. For a pendulum at latitude \(\lambda\), the equation of motion in the horizontal plane becomes

\[\ddot{\mathbf{r}}' + 2(\boldsymbol\Omega\times\mathbf{v}')_\perp + \omega_0^2\mathbf{r} = 0,\]

where \(\omega_0 = \sqrt{g/\ell}\). The effective vertical component of \(\boldsymbol\Omega\) is \(\Omega\sin\lambda\). Using the complex coordinate \(\zeta = x + iy\), the equation becomes

\[\ddot\zeta + 2i\Omega\sin\lambda\,\dot\zeta + \omega_0^2\zeta = 0.\]

The solution shows that the pendulum plane precesses with angular velocity \(\Omega_z = \Omega\sin\lambda\). At the pole (\(\lambda = 90°\)), the period of precession equals the sidereal day (23h 56min). At the equator, there is no precession.

### Cyclones and the Coriolis Effect

Large-scale weather patterns are dramatically affected by the Coriolis force. Air flowing toward a low-pressure center would move radially inward in a non-rotating frame, but the Coriolis force deflects it. In the Northern Hemisphere (\(\boldsymbol\Omega\) has a component out of the ground), the Coriolis force deflects moving air to the right. This causes counter-clockwise rotation around low-pressure systems (cyclones) and clockwise rotation around high-pressure systems (anticyclones) in the Northern Hemisphere — the reverse holds in the Southern Hemisphere.

### The Eötvös Effect

The Coriolis force on a particle moving horizontally on Earth's surface has a vertical component that modifies the apparent weight. A particle moving eastward experiences an upward Coriolis force \(2m\omega v\cos\lambda\), reducing its apparent weight. This **Eötvös effect** is important for precision gravity measurements on moving platforms (ships, aircraft).

---

# Chapter 5: Rigid Body Dynamics

## Kinematics of Rigid Bodies

A **rigid body** is an idealized system in which the distance between any two points remains fixed. A rigid body has up to 6 degrees of freedom: 3 translational (position of center of mass) and 3 rotational (orientation). For motion of the center of mass, Newton's second law applies to the total momentum:

\[M\ddot{\mathbf{R}}_{\text{cm}} = \mathbf{F}_{\text{ext}}.\]

For rotational motion about the center of mass (or any fixed point):

\[\frac{d\mathbf{L}}{dt} = \mathbf{N}_{\text{ext}},\]

where \(\mathbf{L}\) is the angular momentum and \(\mathbf{N}_{\text{ext}}\) is the net external torque. The central challenge of rigid body dynamics is expressing \(\mathbf{L}\) in terms of the body's angular velocity \(\boldsymbol\omega\).

### Angular Velocity and Instantaneous Rotation

For a rigid body, any motion can be decomposed into translation of the center of mass and rotation about it. The velocity of any point \(\mathbf{r}_i\) relative to the center of mass is

\[\mathbf{v}_i' = \boldsymbol\omega\times\mathbf{r}_i',\]

where \(\boldsymbol\omega\) is the instantaneous angular velocity vector, the same for all points in the body. This follows directly from the rigidity constraint.

## Two-Dimensional Rigid Body Motion

In planar (2D) motion, the angular velocity has only one component \(\omega\) (perpendicular to the plane). The angular momentum about the rotation axis is

\[L = I\omega,\]

where \(I\) is the **moment of inertia** about that axis:

\[I = \sum_i m_i r_i'^2 = \int r_\perp^2\, dm,\]

with \(r_\perp\) the perpendicular distance from the rotation axis.

### Parallel Axis Theorem

The moment of inertia about an axis passing through the center of mass is \(I_{\text{cm}}\). For a parallel axis displaced by distance \(d\):

\[I = I_{\text{cm}} + Md^2.\]

This **parallel axis theorem** (Steiner's theorem) is enormously useful. For example, the moment of inertia of a thin rod about one end: \(I_{\text{cm}} = ML^2/12\) (about center), so \(I_{\text{end}} = ML^2/12 + M(L/2)^2 = ML^2/3\).

### Perpendicular Axis Theorem

For a planar (2D) body in the \(xy\)-plane, the moments of inertia satisfy

\[I_z = I_x + I_y.\]

This **perpendicular axis theorem** holds only for flat (laminar) bodies.

### Common Moments of Inertia

- **Thin rod** (length \(L\)) about center: \(I = \frac{1}{12}ML^2\)
- **Thin rod** about one end: \(I = \frac{1}{3}ML^2\)
- **Solid disk/cylinder** (radius \(R\)) about symmetry axis: \(I = \frac{1}{2}MR^2\)
- **Thin ring** (radius \(R\)) about symmetry axis: \(I = MR^2\)
- **Solid sphere** (radius \(R\)) about diameter: \(I = \frac{2}{5}MR^2\)
- **Thin spherical shell** (radius \(R\)) about diameter: \(I = \frac{2}{3}MR^2\)
- **Solid rectangular plate** (\(a\times b\)) about center, perpendicular: \(I = \frac{M(a^2+b^2)}{12}\)

### Equations of Motion in 2D

For plane motion about a fixed axis (or rotation about the center of mass):

\[I\dot\omega = N_{\text{ext}}.\]

This, combined with Newton's second law for the center of mass, gives the full description of 2D rigid body motion.

<div class="example">
<strong>Example: Rolling without slipping.</strong> A uniform solid cylinder of mass \(M\) and radius \(R\) rolls without slipping down an inclined plane (angle \(\alpha\)). The constraint is \(v_{\text{cm}} = R\omega\).

The Lagrangian: \(\mathcal{L} = \frac{1}{2}Mv_{\text{cm}}^2 + \frac{1}{2}I\omega^2 + Mgx\sin\alpha = \frac{1}{2}M\dot{x}^2 + \frac{1}{2}\cdot\frac{MR^2}{2}\cdot\frac{\dot{x}^2}{R^2} + Mgx\sin\alpha = \frac{3}{4}M\dot{x}^2 + Mgx\sin\alpha\).

The equation of motion: \(\ddot{x} = \frac{2}{3}g\sin\alpha\). Compare with sliding (no friction, \(\ddot{x} = g\sin\alpha\)) — rolling is slower because some of the gravitational potential energy goes into rotational kinetic energy.
</div>

## The Inertia Tensor

In three dimensions, the relationship between angular momentum and angular velocity is no longer a simple scalar multiplication. Instead,

\[L_i = \sum_j I_{ij}\omega_j,\]

where \(\mathbf{I}\) is the **inertia tensor** (a symmetric rank-2 tensor):

\[I_{ij} = \sum_\alpha m_\alpha\!\left(r_\alpha^2\delta_{ij} - r_{\alpha i}r_{\alpha j}\right) = \int\!\left(r^2\delta_{ij} - x_i x_j\right)dm.\]

Explicitly, the diagonal components (moments of inertia) are:

\[I_{xx} = \int(y^2 + z^2)\,dm, \quad I_{yy} = \int(x^2 + z^2)\,dm, \quad I_{zz} = \int(x^2 + y^2)\,dm,\]

and the off-diagonal components (products of inertia) are:

\[I_{xy} = -\int xy\,dm, \quad I_{xz} = -\int xz\,dm, \quad I_{yz} = -\int yz\,dm.\]

Note that \(I_{ij} = I_{ji}\) — the inertia tensor is symmetric.

### Principal Axes

Since the inertia tensor is real and symmetric, it can always be diagonalized by choosing the right coordinate system — the **principal axes**. In the principal axis frame, \(\mathbf{I} = \text{diag}(I_1, I_2, I_3)\) with \(I_1, I_2, I_3\) the **principal moments of inertia**. The angular momentum then has the simple form

\[\mathbf{L} = (I_1\omega_1, I_2\omega_2, I_3\omega_3).\]

For a body with symmetry, the principal axes can often be identified by inspection — they are the symmetry axes. For an axisymmetric body (e.g., a spinning top), two principal moments are equal: \(I_1 = I_2 \ne I_3\).

Finding the principal moments requires solving the eigenvalue problem

\[\mathbf{I}\hat{n} = I\hat{n} \implies \det(\mathbf{I} - I\mathbf{1}) = 0.\]

The three roots of this cubic are the principal moments.

## Euler's Equations

In the body frame (rotating with the rigid body, aligned with principal axes), Newton's law for rotational motion \(d\mathbf{L}/dt = \mathbf{N}\) must account for the rotating frame:

\[\left(\frac{d\mathbf{L}}{dt}\right)_{\text{inertial}} = \left(\frac{d\mathbf{L}}{dt}\right)_{\text{body}} + \boldsymbol\omega\times\mathbf{L} = \mathbf{N}.\]

Since in the principal axis body frame \(L_i = I_i\omega_i\), this gives **Euler's equations**:

\[I_1\dot\omega_1 - (I_2 - I_3)\omega_2\omega_3 = N_1,\]
\[I_2\dot\omega_2 - (I_3 - I_1)\omega_3\omega_1 = N_2,\]
\[I_3\dot\omega_3 - (I_1 - I_2)\omega_1\omega_2 = N_3.\]

These are the fundamental equations of rigid body rotation in three dimensions.

### Torque-Free Motion: The Euler Equations for a Free Body

For a torque-free body (\(\mathbf{N} = 0\)), Euler's equations become

\[I_1\dot\omega_1 = (I_2 - I_3)\omega_2\omega_3,\]
\[I_2\dot\omega_2 = (I_3 - I_1)\omega_3\omega_1,\]
\[I_3\dot\omega_3 = (I_1 - I_2)\omega_1\omega_2.\]

Two conserved quantities: \(L^2 = I_1^2\omega_1^2 + I_2^2\omega_2^2 + I_3^2\omega_3^2 = \text{const}\) and \(E = \frac{1}{2}(I_1\omega_1^2 + I_2\omega_2^2 + I_3\omega_3^2) = \text{const}\).

### Stability of Torque-Free Rotation

For a body with distinct principal moments \(I_1 < I_2 < I_3\), consider rotation nearly aligned with principal axis 2 (intermediate moment): \(\omega_2 \approx \omega_0\), \(\omega_1, \omega_3 \ll \omega_2\). Linearizing Euler's equations:

\[I_1\dot\omega_1 \approx (I_2-I_3)\omega_0\omega_3, \quad I_3\dot\omega_3 \approx (I_1-I_2)\omega_0\omega_1.\]

This gives \(\ddot\omega_1 = \frac{(I_2-I_3)(I_1-I_2)}{I_1 I_3}\omega_0^2\omega_1\). Since \(I_1 < I_2 < I_3\), both factors have opposite signs, making the coefficient positive — an exponentially growing instability! Rotation about the intermediate axis is **unstable**. Rotation about the axis of largest or smallest moment is stable (the tennis racket theorem / Dzhanibekov effect).

### The Symmetric Top (Torque-Free)

For an axisymmetric body with \(I_1 = I_2 \equiv I_\perp\) and \(I_3 \equiv I_\parallel\):

\[I_\perp\dot\omega_1 = (I_\perp - I_\parallel)\omega_3\omega_2,\]
\[I_\perp\dot\omega_2 = -(I_\perp - I_\parallel)\omega_3\omega_1,\]
\[I_\parallel\dot\omega_3 = 0.\]

The third equation says \(\omega_3 = \text{const}\). The first two give oscillations of the transverse components with **body-frame precession rate**

\[\Omega_{\text{body}} = \frac{I_\parallel - I_\perp}{I_\perp}\omega_3.\]

In the inertial frame, this appears as **torque-free precession** (Euler precession), where the body's symmetry axis traces a cone around the fixed angular momentum vector \(\mathbf{L}\). For Earth (which is slightly oblate), this predicts a Chandler wobble period of about 305 days.

## Euler Angles and the Heavy Symmetric Top

### Euler Angles

To describe the orientation of a rigid body in space, three angles are needed. The **Euler angles** \((\phi, \theta, \psi)\) provide a standard parameterization:

1. **Precession** angle \(\phi\): rotation about the space \(z\)-axis.
2. **Nutation** angle \(\theta\): rotation about the rotated \(x'\)-axis (the "line of nodes").
3. **Spin** angle \(\psi\): rotation about the body \(z''\)-axis (symmetry axis).

The angular velocity in terms of Euler angles is:

\[\omega_1 = \dot\phi\sin\theta\sin\psi + \dot\theta\cos\psi,\]
\[\omega_2 = \dot\phi\sin\theta\cos\psi - \dot\theta\sin\psi,\]
\[\omega_3 = \dot\phi\cos\theta + \dot\psi.\]

### The Lagrangian for a Symmetric Top

For a symmetric top (axisymmetric body with one point fixed, pivoting under gravity), with pivot at the origin and center of mass at height \(h = \ell\cos\theta\) above pivot:

\[\mathcal{L} = \frac{I_\perp}{2}\!\left(\dot\theta^2 + \dot\phi^2\sin^2\!\theta\right) + \frac{I_\parallel}{2}\!\left(\dot\psi + \dot\phi\cos\theta\right)^2 - Mg\ell\cos\theta.\]

Both \(\phi\) and \(\psi\) are cyclic, giving conserved momenta:

\[p_\phi = (I_\perp\sin^2\!\theta + I_\parallel\cos^2\!\theta)\dot\phi + I_\parallel\dot\psi\cos\theta = L_z = \text{const},\]
\[p_\psi = I_\parallel(\dot\psi + \dot\phi\cos\theta) = I_\parallel\omega_3 = L_3 = \text{const}.\]

The energy is also conserved. The problem reduces to one effective degree of freedom \(\theta(t)\), governed by an effective potential:

\[V_{\text{eff}}(\theta) = Mg\ell\cos\theta + \frac{(L_z - L_3\cos\theta)^2}{2I_\perp\sin^2\!\theta}.\]

### Precession, Nutation, and Sleeping Top

For steady precession (\(\dot\theta = 0\)), the condition \(dV_{\text{eff}}/d\theta = 0\) gives the **precession rate**:

\[\dot\phi = \frac{Mg\ell}{L_3\cos\theta} \quad \text{(slow precession)}, \quad\text{or}\quad \dot\phi = \frac{L_3}{I_\perp\cos\theta} \quad \text{(fast precession)}.\]

For large spin \(L_3\), the slow precession rate \(\dot\phi \approx Mg\ell/L_3\) (independent of \(\theta\) for small \(\theta\)) reproduces the familiar result for a gyroscope.

**Nutation** refers to the oscillation of \(\theta\) about its equilibrium value. The top bobs up and down in \(\theta\) while precessing in \(\phi\), tracing loops or cusps on the unit sphere.

A **sleeping top** is one spinning with its axis exactly vertical (\(\theta = 0\)). The vertical position is stable if the spin exceeds a critical value:

\[\omega_3 > \omega_{\text{crit}} = \frac{2}{I_\parallel}\sqrt{Mg\ell I_\perp}.\]

---

# Chapter 6: Small Oscillations and Perturbation Theory

## Small Oscillations About Equilibrium

Many physical systems spend most of their time near an equilibrium configuration. Understanding small deviations from equilibrium is therefore of central importance. When a system is displaced slightly from equilibrium, the restoring forces are (to first approximation) linear in the displacement, leading to simple harmonic motion — or, for systems with many degrees of freedom, normal mode oscillations.

### Equilibrium and Stability

An **equilibrium configuration** is one where all generalized forces vanish: \(\partial V/\partial q_i = 0\) for all \(i\). If we label the equilibrium values \(q_i^{(0)}\), introduce small displacements \(\eta_i = q_i - q_i^{(0)}\), and expand \(V\) to second order:

\[V = V_0 + \sum_i \frac{\partial V}{\partial q_i}\bigg|_0\eta_i + \frac{1}{2}\sum_{i,j}\frac{\partial^2 V}{\partial q_i\partial q_j}\bigg|_0\eta_i\eta_j + \cdots\]

The first-order terms vanish by the equilibrium condition. Defining the **potential energy matrix** \(K_{ij} = \partial^2 V/\partial q_i\partial q_j\big|_0\), the potential energy in the displaced configuration is

\[V \approx V_0 + \frac{1}{2}\sum_{i,j}K_{ij}\eta_i\eta_j.\]

Similarly, the kinetic energy for motion near equilibrium:

\[T = \frac{1}{2}\sum_{i,j}M_{ij}\dot\eta_i\dot\eta_j,\]

where \(M_{ij} = \sum_\alpha m_\alpha \frac{\partial\mathbf{r}_\alpha}{\partial q_i}\cdot\frac{\partial\mathbf{r}_\alpha}{\partial q_j}\bigg|_{q^{(0)}}\) is the **mass matrix** (evaluated at equilibrium). The Lagrangian for small oscillations is thus

\[\mathcal{L} = \frac{1}{2}\dot{\boldsymbol\eta}^T\mathbf{M}\dot{\boldsymbol\eta} - \frac{1}{2}\boldsymbol\eta^T\mathbf{K}\boldsymbol\eta.\]

## Normal Modes

### The Eigenvalue Equation

The equations of motion for small oscillations are

\[\mathbf{M}\ddot{\boldsymbol\eta} + \mathbf{K}\boldsymbol\eta = 0.\]

Seeking solutions of the form \(\boldsymbol\eta(t) = \mathbf{a}\cos(\omega t - \delta)\), we obtain the **generalized eigenvalue problem**:

\[\mathbf{K}\mathbf{a} = \omega^2\mathbf{M}\mathbf{a}.\]

This is equivalent to the ordinary eigenvalue problem \(\mathbf{M}^{-1}\mathbf{K}\mathbf{a} = \omega^2\mathbf{a}\) (since \(\mathbf{M}\) is positive definite and invertible). The \(n\) eigenvalues \(\omega_r^2\) are the squared **normal mode frequencies**, and the corresponding eigenvectors \(\mathbf{a}^{(r)}\) are the **normal mode vectors**.

The normal modes have the orthogonality property with respect to \(\mathbf{M}\):

\[\mathbf{a}^{(r)T}\mathbf{M}\mathbf{a}^{(s)} = \delta_{rs}\]

(with appropriate normalization). The general solution is a superposition of all normal modes:

\[\boldsymbol\eta(t) = \sum_{r=1}^n c_r\mathbf{a}^{(r)}\cos(\omega_r t - \delta_r),\]

with \(2n\) constants \(c_r, \delta_r\) determined by initial conditions.

### Normal Coordinates

The eigenvectors \(\mathbf{a}^{(r)}\) define a transformation to **normal coordinates** \(\xi_r\):

\[\boldsymbol\eta = \sum_r \mathbf{a}^{(r)}\xi_r.\]

In terms of normal coordinates, both \(T\) and \(V\) are diagonal:

\[T = \frac{1}{2}\sum_r\dot\xi_r^2, \quad V = \frac{1}{2}\sum_r\omega_r^2\xi_r^2\]

(with appropriate normalization). The system decouples into \(n\) independent harmonic oscillators. Each normal coordinate \(\xi_r\) oscillates independently at frequency \(\omega_r\).

<div class="example">
<strong>Example: Two coupled pendulums.</strong> Two identical pendulums of length \(\ell\) and mass \(m\), coupled by a weak spring of constant \(k\) connecting the bobs. Coordinates: \(\theta_1, \theta_2\) (angles from vertical).

\[\mathcal{L} = \frac{m\ell^2}{2}(\dot\theta_1^2 + \dot\theta_2^2) - \frac{mg\ell}{2}(\theta_1^2 + \theta_2^2) - \frac{k\ell^2}{2}(\theta_1 - \theta_2)^2.\]

The \(\mathbf{K}\) and \(\mathbf{M}\) matrices:

\[\mathbf{M} = m\ell^2\begin{pmatrix}1 & 0 \\ 0 & 1\end{pmatrix}, \quad \mathbf{K} = \begin{pmatrix}mg\ell + k\ell^2 & -k\ell^2 \\ -k\ell^2 & mg\ell + k\ell^2\end{pmatrix}.\]

Normal modes: \(\mathbf{a}^{(1)} = (1, 1)/\sqrt{2}\) with \(\omega_1^2 = g/\ell\) (symmetric/in-phase mode), and \(\mathbf{a}^{(2)} = (1, -1)/\sqrt{2}\) with \(\omega_2^2 = g/\ell + 2k/m\) (antisymmetric/out-of-phase mode).

In the in-phase mode, both pendulums swing together and the spring is never stretched. In the out-of-phase mode, the spring is maximally active.
</div>

## Weak Coupling Limit: Beats

When two identical oscillators are weakly coupled (\(k \ll mg/\ell\)), the two normal mode frequencies are nearly equal: \(\omega_1 \approx \omega_2 \approx \omega_0\), with a small difference \(\Delta\omega = \omega_2 - \omega_1 \approx k/m\omega_0\). If initially only one pendulum is displaced, the motion is a superposition of the two close frequencies:

\[\theta_1(t) \propto \cos\!\left(\frac{\omega_1+\omega_2}{2}t\right)\cos\!\left(\frac{\omega_2-\omega_1}{2}t\right),\]
\[\theta_2(t) \propto \sin\!\left(\frac{\omega_1+\omega_2}{2}t\right)\sin\!\left(\frac{\omega_2-\omega_1}{2}t\right).\]

The energy sloshes back and forth between the two oscillators with period \(T_{\text{beat}} = 2\pi/\Delta\omega = 2\pi m\omega_0/k\). This is the phenomenon of **beats** — first one oscillator has all the energy, then the other.

## Perturbation Theory for Oscillations

When a system is close to but not exactly a solvable problem, **perturbation theory** provides a systematic expansion. Consider an oscillator with Lagrangian

\[\mathcal{L} = \frac{1}{2}\dot{q}^2 - \frac{1}{2}\omega_0^2 q^2 - \epsilon V_1(q),\]

where \(\epsilon V_1\) is a small perturbation. We expand the solution as \(q = q_0 + \epsilon q_1 + \epsilon^2 q_2 + \cdots\), substitute, and collect powers of \(\epsilon\). The zeroth-order solution is \(q_0 = A\cos(\omega_0 t + \phi)\). At first order, \(\ddot{q}_1 + \omega_0^2 q_1 = -V_1'(q_0)\). Resonant driving terms (proportional to \(\cos\omega_0 t\)) in the forcing produce secular growth (terms proportional to \(t\cos\omega_0 t\)) — they must be removed by allowing the frequency to shift: \(\omega = \omega_0 + \epsilon\omega_1 + \cdots\).

### Stability Analysis

The stability of an equilibrium depends on the sign of \(V_{\text{eff}}''(q_0)\). If positive, the equilibrium is stable (potential minimum), giving oscillatory motion with frequency \(\sqrt{V_{\text{eff}}''(q_0)/m}\). If negative, the equilibrium is unstable (potential maximum), giving exponential growth. If zero, higher-order terms must be examined.

For the bead-on-rotating-hoop example from Chapter 2, the equilibrium at \(\theta_0\) satisfying \(\cos\theta_0 = g/R\omega^2\) is stable for \(\omega > \sqrt{g/R}\). The oscillation frequency about this equilibrium is

\[\omega_{\text{osc}} = \omega\sqrt{1 - \cos^2\!\theta_0} = \omega\sin\theta_0.\]

---

# Chapter 7: Coupled Harmonic Oscillators

## General Theory of Coupled Oscillators

The theory of small oscillations developed in the previous chapter is completely general. Here we develop it further, focusing on the coupled harmonic oscillator as the paradigmatic example and exploring the richness of behavior that emerges even in simple coupled systems.

### The Mass-Spring Chain

Consider \(n\) identical masses \(m\) connected in a line by identical springs of constant \(k\). Label the displacements of the masses from equilibrium as \(q_1, \ldots, q_n\). The Lagrangian is

\[\mathcal{L} = \frac{m}{2}\sum_i\dot{q}_i^2 - \frac{k}{2}\sum_i(q_{i+1} - q_i)^2.\]

The equations of motion are

\[m\ddot{q}_i = k(q_{i+1} - 2q_i + q_{i-1}),\]

a discrete version of the wave equation. For a chain of \(n\) masses with fixed ends (\(q_0 = q_{n+1} = 0\)), the normal modes are

\[\mathbf{a}_j^{(r)} = \sqrt{\frac{2}{n+1}}\sin\!\left(\frac{jr\pi}{n+1}\right), \quad r = 1, \ldots, n,\]

with frequencies

\[\omega_r^2 = \frac{4k}{m}\sin^2\!\!\left(\frac{r\pi}{2(n+1)}\right).\]

As \(n \to \infty\) (the continuum limit), this becomes the dispersion relation for elastic waves: \(\omega = ck\) (linear dispersion), transitioning to phonon physics in condensed matter.

### Degenerate Normal Modes

When two normal mode frequencies coincide (\(\omega_r = \omega_s\)), any linear combination of those modes is also a normal mode — there is a degeneracy. Physical symmetry usually explains these degeneracies. For example, a symmetric molecule with three identical masses connected symmetrically has degenerate modes related by the symmetry of the molecule.

### Effect of Weak Coupling

In the weak coupling limit, the normal modes of the coupled system are close to the uncoupled modes. The coupling shifts the frequencies slightly and hybridizes the modes — modes that would be exactly degenerate in the uncoupled system split apart, a phenomenon known as **level repulsion** or **avoided crossing**. This is the classical analog of quantum mechanical energy level splitting.

Precisely, for two identical oscillators with natural frequency \(\omega_0\) coupled by strength \(\kappa\):

\[\omega_{\pm}^2 = \omega_0^2 \pm \kappa.\]

The splitting is \(\omega_+ - \omega_- \approx \kappa/\omega_0\) for small \(\kappa\).

## Forced Oscillations in Coupled Systems

When coupled oscillators are driven by an external force, the response is richest near the normal mode frequencies. For a system of \(n\) degrees of freedom driven at frequency \(\Omega\):

\[\mathbf{M}\ddot{\boldsymbol\eta} + \mathbf{K}\boldsymbol\eta = \mathbf{F}_0 e^{i\Omega t}.\]

In normal coordinates, this decouples into \(n\) driven harmonic oscillators, each exhibiting resonance at its own natural frequency. The amplitude diverges at resonance in the absence of damping.

Adding a dissipation matrix \(\mathbf{\Gamma}\) (damping) modifies the response near resonance. The system exhibits \(n\) resonance peaks in the amplitude spectrum, with widths proportional to the damping.

---

# Chapter 8: Hamiltonian Mechanics

## From Lagrange to Hamilton

The Lagrangian formulation works in terms of generalized coordinates \(q_i\) and velocities \(\dot{q}_i\), living in **configuration space** (or its tangent bundle, **state space**). Hamilton's reformulation trades velocities for momenta, working in **phase space** coordinatized by \((q_i, p_i)\). This change of perspective — a Legendre transformation — reveals deep mathematical structure and connects classical mechanics to quantum mechanics.

### The Legendre Transformation

The **Hamiltonian** is defined as the Legendre transform of the Lagrangian with respect to the velocities:

\[H(q_1, \ldots, q_n, p_1, \ldots, p_n, t) = \sum_i p_i\dot{q}_i - \mathcal{L},\]

where the \(\dot{q}_i\) on the right are expressed in terms of \(q\) and \(p\) by inverting \(p_i = \partial\mathcal{L}/\partial\dot{q}_i\). For a standard system with \(\mathcal{L} = T - V\) and \(T\) quadratic in \(\dot{q}\):

\[H = T + V = E.\]

The Hamiltonian equals the total energy (in standard cases).

### Hamilton's Equations

The equations of motion in phase space follow from the differential of \(H\):

<div class="theorem">
<strong>Hamilton's Equations of Motion.</strong>

\[\dot{q}_i = \frac{\partial H}{\partial p_i}, \qquad \dot{p}_i = -\frac{\partial H}{\partial q_i}.\]

These \(2n\) first-order ODEs replace the \(n\) second-order Lagrange equations.
</div>

The derivation: \(dH = \sum_i(p_i\,d\dot{q}_i + \dot{q}_i\,dp_i) - d\mathcal{L} = \sum_i\left(\dot{q}_i\,dp_i - \dot{p}_i\,dq_i\right) - \frac{\partial\mathcal{L}}{\partial t}dt\), where we used \(p_i = \partial\mathcal{L}/\partial\dot{q}_i\) and the Lagrange equations \(\dot{p}_i = \partial\mathcal{L}/\partial q_i\).

Also: \(\frac{\partial H}{\partial t} = -\frac{\partial\mathcal{L}}{\partial t}\), so \(\frac{dH}{dt} = \frac{\partial H}{\partial t}\) — if \(\partial\mathcal{L}/\partial t = 0\) (no explicit time dependence), then \(H\) is conserved.

## Phase Space

Phase space is the \(2n\)-dimensional space with coordinates \((q_1, \ldots, q_n, p_1, \ldots, p_n)\). Each state of the system is a single point in phase space, and Hamilton's equations define a flow — a vector field on phase space. The trajectory through any point is uniquely determined (given smooth \(H\)), so phase space trajectories never cross.

### Liouville's Theorem

One of the most beautiful results in Hamiltonian mechanics is **Liouville's theorem**: the phase space flow is **incompressible**. That is, any volume element in phase space is preserved under the Hamiltonian flow:

\[\frac{d}{dt}\left(\prod_i dq_i\,dp_i\right) = 0.\]

Equivalently, the divergence of the phase-space velocity vector field vanishes:

\[\text{div}\,\mathbf{v} = \sum_i\!\left(\frac{\partial\dot{q}_i}{\partial q_i} + \frac{\partial\dot{p}_i}{\partial p_i}\right) = \sum_i\!\left(\frac{\partial^2 H}{\partial q_i\partial p_i} - \frac{\partial^2 H}{\partial p_i\partial q_i}\right) = 0.\]

Liouville's theorem has profound implications: it means that Hamiltonian dynamics cannot have attractors or repellers — the density of phase-space points is conserved. In statistical mechanics, it underpins the concept of the microcanonical ensemble.

### Poisson Brackets

For two functions \(f(q, p, t)\) and \(g(q, p, t)\), the **Poisson bracket** is defined as

\[\{f, g\} = \sum_i\!\left(\frac{\partial f}{\partial q_i}\frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i}\frac{\partial g}{\partial q_i}\right).\]

The time evolution of any function \(f\) is

\[\frac{df}{dt} = \{f, H\} + \frac{\partial f}{\partial t}.\]

The fundamental Poisson brackets are:

\[\{q_i, q_j\} = 0, \quad \{p_i, p_j\} = 0, \quad \{q_i, p_j\} = \delta_{ij}.\]

A function \(f\) is conserved if and only if \(\{f, H\} = 0\) (and \(\partial f/\partial t = 0\)).

Poisson brackets satisfy all the algebraic properties of commutators, and the correspondence \(\{,\} \leftrightarrow \frac{1}{i\hbar}[,]\) is the bridge to quantum mechanics.

## Canonical Transformations

A **canonical transformation** is a change of phase-space coordinates \((q, p) \to (Q, P)\) that preserves the form of Hamilton's equations — that is, there exists a new Hamiltonian \(K(Q, P, t)\) such that

\[\dot{Q}_i = \frac{\partial K}{\partial P_i}, \quad \dot{P}_i = -\frac{\partial K}{\partial Q_i}.\]

The key condition is that the transformation preserves Poisson brackets: \(\{Q_i, P_j\}_{\text{old}} = \delta_{ij}\), or equivalently, that it preserves the **symplectic structure** — the area elements in each \((q_i, p_i)\) plane are preserved.

### Generating Functions

Canonical transformations can be generated by a **generating function** \(F\). There are four types (Goldstein's classification), depending on which variables are used as the function's arguments:

**Type 1**: \(F_1(q, Q, t)\). Then \(p_i = \partial F_1/\partial q_i\), \(P_i = -\partial F_1/\partial Q_i\), \(K = H + \partial F_1/\partial t\).

**Type 2**: \(F_2(q, P, t)\). Then \(p_i = \partial F_2/\partial q_i\), \(Q_i = \partial F_2/\partial P_i\), \(K = H + \partial F_2/\partial t\).

**Type 3**: \(F_3(p, Q, t)\). Then \(q_i = -\partial F_3/\partial p_i\), \(P_i = -\partial F_3/\partial Q_i\), \(K = H + \partial F_3/\partial t\).

**Type 4**: \(F_4(p, P, t)\). Then \(q_i = -\partial F_4/\partial p_i\), \(Q_i = \partial F_4/\partial P_i\), \(K = H + \partial F_4/\partial t\).

The identity transformation is generated by \(F_2 = \sum_i q_i P_i\).

### Point Transformations

A coordinate transformation \(Q_i = Q_i(q)\) (purely in configuration space) is always canonical. The generating function is \(F_2 = \sum_i Q_i(q)P_i\), and the new momenta are related to the old by \(p_i = \sum_j(\partial Q_j/\partial q_i)P_j\).

### The Harmonic Oscillator: Action-Angle Variables

For the harmonic oscillator \(H = p^2/2m + m\omega^2 q^2/2\), the phase-space trajectories are ellipses. A beautiful canonical transformation puts the system in **action-angle variables** \((J, \theta)\).

The **action variable**: \(J = \frac{1}{2\pi}\oint p\, dq = E/\omega\) (the area of the phase-space ellipse divided by \(2\pi\)).

The **angle variable**: \(\theta\) increases uniformly in time: \(\dot\theta = \partial H/\partial J = \omega\).

In action-angle variables, the Hamiltonian is simply \(H = \omega J\), and the equations of motion are trivially integrated. The action variables are constants of motion; the angle variables increase linearly in time.

## Hamilton-Jacobi Equation

The Hamilton-Jacobi equation represents the most complete integration of Hamilton's equations. The idea is to find a canonical transformation \((q, p) \to (Q, P)\) such that the new Hamiltonian \(K\) vanishes identically. Then \(\dot{Q} = \dot{P} = 0\), so both new variables are constants of motion — a complete solution.

Using a Type 2 generating function \(S(q, P, t)\) (Hamilton's principal function), the condition \(K = 0\) gives:

\[H\!\left(q_1, \ldots, q_n, \frac{\partial S}{\partial q_1}, \ldots, \frac{\partial S}{\partial q_n}, t\right) + \frac{\partial S}{\partial t} = 0.\]

This is the **Hamilton-Jacobi equation** (HJE). For time-independent \(H\), we separate \(S = W(q) - Et\), where \(W\) is **Hamilton's characteristic function** satisfying

\[H\!\left(q, \frac{\partial W}{\partial q}\right) = E.\]

### Separation of Variables

The HJE is often separable when the Hamiltonian is separable. If \(H = H_1(q_1, p_1) + H_2(q_2, p_2) + \cdots\), then \(W = W_1(q_1) + W_2(q_2) + \cdots\), and the HJE factors into independent ODEs.

For the Kepler problem in spherical coordinates, the HJE separates completely:

\[\frac{1}{2m}\!\left[\!\left(\frac{\partial W}{\partial r}\right)^{\!2} + \frac{1}{r^2}\!\left(\frac{\partial W}{\partial\theta}\right)^{\!2} + \frac{1}{r^2\sin^2\!\theta}\!\left(\frac{\partial W}{\partial\phi}\right)^{\!2}\right] - \frac{k}{r} = E.\]

Writing \(W = W_r(r) + W_\theta(\theta) + p_\phi\phi\) (since \(\phi\) is cyclic), the equation separates, yielding the orbital elements as constants of integration.

## Adiabatic Invariants

An **adiabatic invariant** is a quantity that is conserved when system parameters change slowly. For a one-dimensional oscillator with slowly varying parameters, the **action variable** \(J = \oint p\, dq\) is adiabatically invariant.

### The Adiabatic Theorem

Consider a harmonic oscillator with slowly changing frequency \(\omega(t)\) (changing on a time scale much longer than \(1/\omega\)). The energy \(E\) changes with \(\omega\), but the ratio \(E/\omega = J\) remains approximately constant:

\[\frac{E}{\omega} = \text{adiabatic invariant}.\]

This has profound consequences: if you slowly raise the frequency of an oscillator, its energy increases proportionally to maintain constant action. In quantum mechanics, this corresponds to a system remaining in its instantaneous eigenstate under slow perturbations (the quantum adiabatic theorem).

### Physical Examples of Adiabatic Invariance

**Magnetic mirror**: A charged particle spiraling in a magnetic field has a magnetic moment \(\mu = mv_\perp^2/2B\) as an adiabatic invariant. When the particle moves into a stronger-field region, \(v_\perp\) increases (to maintain constant \(\mu\)), eventually reversing the parallel motion — the particle is "reflected." This principle confines plasma in magnetic bottles.

**Pendulum with varying length**: A pendulum whose length changes slowly has \(E/\omega \propto E\sqrt{\ell/g}\) as adiabatic invariant. If the length is shortened adiabatically, the energy increases.

**Charged particle in varying electric field**: The action \(J = \oint p\,dq\) for an oscillating charged particle is invariant under slow changes to the confining field.

---

# Chapter 9: Further Topics

## The Hamilton-Jacobi Equation and Wave-Particle Duality

The Hamilton-Jacobi formulation reveals an extraordinary connection between classical mechanics and wave optics. The surfaces of constant \(S\) (at fixed \(t\)) are the wavefronts of a wave whose rays are the classical trajectories. The gradient of \(S\) gives the momentum:

\[p_i = \frac{\partial S}{\partial q_i}.\]

This is precisely the eikonal approximation of wave optics: geometric optics is the short-wavelength limit of wave optics, just as classical mechanics is the short-wavelength limit of quantum mechanics (the WKB approximation). Hamilton himself noticed this analogy decades before quantum mechanics — the de Broglie relation \(p = \hbar k\) makes the connection explicit.

Schrödinger derived his wave equation by asking what wave equation has classical mechanics as its short-wavelength limit, replacing \(\partial S/\partial t \to i\hbar\partial/\partial t\) and \(\nabla S \to -i\hbar\nabla\) in the Hamilton-Jacobi equation. This is the genesis of quantum mechanics from classical mechanics.

## Integrability and Chaos

A Hamiltonian system with \(n\) degrees of freedom is **integrable** (in the sense of Liouville) if it possesses \(n\) functionally independent conserved quantities \(I_1, \ldots, I_n\) in involution (\(\{I_j, I_k\} = 0\)). Integrable systems can be solved exactly using action-angle variables, and their phase-space trajectories lie on \(n\)-dimensional tori.

Most Hamiltonian systems are not integrable. When a small perturbation breaks an integrable system, the **KAM theorem** (Kolmogorov-Arnold-Moser) states that most of the invariant tori survive, slightly deformed. However, resonant tori break up, and the motion near the broken tori is chaotic — this is the origin of classical chaos. The double pendulum, for large amplitudes, exhibits this behavior.

## Symmetry, Conservation, and Noether's Theorem Revisited

In the Hamiltonian formulation, continuous symmetries manifest as conserved quantities via Poisson brackets. If \(F\) generates a canonical transformation corresponding to a symmetry, then \(\{H, F\} = 0\), meaning \(F\) is conserved.

**Linear momentum** is generated by translations: \(F = p_i\) generates \(\delta q_i = \epsilon\), and if \(H\) is translation-invariant, \(\{H, p_i\} = 0\).

**Angular momentum** \(L_z = xp_y - yp_x\) generates rotations about the \(z\)-axis: \(\{x, L_z\} = -y\), \(\{y, L_z\} = x\). If \(H\) is rotationally symmetric, \(\{H, L_z\} = 0\).

The Poisson bracket algebra of the conserved quantities reflects the symmetry group of the Hamiltonian, directly mirroring the Lie algebra of that group.

## Electromagnetic Analogies and Gauge Invariance

The Lagrangian for a charged particle in an electromagnetic field \(\mathcal{L} = \frac{1}{2}mv^2 - q\phi + q\mathbf{v}\cdot\mathbf{A}\) leads to interesting structure. A gauge transformation \(\mathbf{A} \to \mathbf{A} + \nabla\chi\), \(\phi \to \phi - \partial\chi/\partial t\) changes the Lagrangian by a total time derivative:

\[\mathcal{L} \to \mathcal{L} + q\frac{d\chi}{dt},\]

which does not affect the equations of motion. This is a specific example of the general principle that adding a total time derivative to the Lagrangian is a symmetry.

The canonical momentum \(\mathbf{p} = m\mathbf{v} + q\mathbf{A}\) is gauge-dependent — the *mechanical* momentum \(m\mathbf{v} = \mathbf{p} - q\mathbf{A}\) is gauge-invariant and physically observable. This distinction between canonical and mechanical momentum is crucial in electromagnetism.

## Rigid Body Dynamics: Advanced Topics

### The Euler Equations and Polhode/Herpolhode

For torque-free motion of an asymmetric top, the angular velocity vector \(\boldsymbol\omega\) traces a curve on the energy ellipsoid \(E = \frac{1}{2}(I_1\omega_1^2 + I_2\omega_2^2 + I_3\omega_3^2) = \text{const}\). This curve, seen in the body frame, is the **polhode**. In the inertial frame, the tip of \(\boldsymbol\omega\) traces the **herpolhode** on a sphere of constant \(|\boldsymbol\omega|\) about the direction of \(\mathbf{L}\).

The polhode is the intersection of the energy ellipsoid with the angular momentum sphere \(L^2 = I_1^2\omega_1^2 + I_2^2\omega_2^2 + I_3^2\omega_3^2 = \text{const}\). The shape of the polhode depends on which principal axis the rotation is closest to.

### Poinsot's Construction

Poinsot provided an elegant geometric interpretation of torque-free rigid body motion: the inertia ellipsoid of the body rolls without slipping on a fixed plane perpendicular to the angular momentum vector \(\mathbf{L}\) (the **invariable plane**). The contact point traces the herpolhode on this plane.

### Body Frames and Space Frames

A key distinction in rigid body dynamics is between the **body frame** (fixed in the body, rotating with it) and the **space frame** (fixed in inertial space). Euler's equations are naturally written in the body frame. To find the orientation of the body in space, we must integrate the kinematic relations expressing the Euler angle rates \((\dot\phi, \dot\theta, \dot\psi)\) in terms of the body-frame angular velocity components \((\omega_1, \omega_2, \omega_3)\).

The **rotation matrix** \(\mathbf{R}\) that transforms from body to space frame satisfies

\[\frac{d\mathbf{R}}{dt} = \boldsymbol\omega\times\mathbf{R}\]

(where \(\boldsymbol\omega\times\) denotes the skew-symmetric matrix). Alternatively, **quaternions** provide a singularity-free representation of rotations and are preferred in numerical work because Euler angles have coordinate singularities (gimbal lock).

## Perturbation Theory for Bound Orbits

### Apsidal Angle and Orbit Precession

For a nearly circular orbit in a central force \(F(r) = -k/r^n\), small radial perturbations oscillate with frequency \(\omega_r\), while the angular motion has frequency \(\omega_\phi\). The ratio \(\omega_r/\omega_\phi\) determines the apsidal angle — the angular displacement between successive periapsis passages:

\[\Delta\phi = \pi\frac{\omega_r}{\omega_\phi}.\]

For \(F \propto r^{-2}\) (gravity), \(\omega_r = \omega_\phi\) and the orbit closes (\(\Delta\phi = \pi\)). For other force laws, the orbit is generally not closed — each revolution, the apsides advance or regress by \(\Delta\phi - \pi\). This **apsidal precession** is the Newtonian contribution to Mercury's orbital precession (general relativity provides the remaining famous 43 arcseconds per century).

### General Relativistic Corrections

Including the leading post-Newtonian correction modifies the effective potential:

\[V_{\text{eff}} = -\frac{k}{r} + \frac{\ell^2}{2\mu r^2} - \frac{k\ell^2}{\mu c^2 r^3}.\]

The additional term shifts the force law away from pure inverse-square, causing the perihelion to advance. The precession rate per orbit is

\[\delta\phi = \frac{6\pi G M}{c^2 a(1-e^2)},\]

which for Mercury gives 43 arcseconds per century — the classic test of general relativity.

---

# Chapter 10: Synthesis and Applications

## The Action Principle in Modern Physics

Hamilton's principle \(\delta S = 0\) is far more than a convenient reformulation of Newtonian mechanics. It is the universal template of fundamental physics. Maxwell's equations follow from extremizing the electromagnetic action. Einstein's field equations follow from extremizing the Einstein-Hilbert action \(S = \int R\sqrt{-g}\,d^4x\) (where \(R\) is the Ricci scalar curvature). The Standard Model of particle physics is entirely specified by its action.

The power of the action principle lies in its covariance — the form \(\delta S = 0\) is automatically preserved under any change of coordinates, making it ideal for formulating physics in curved spacetime or with exotic coordinates.

### Noether's Theorem in Field Theory

In field theory, the analog of Noether's theorem gives conserved currents. For a field Lagrangian density \(\mathcal{L}(\phi, \partial_\mu\phi)\), invariance under a continuous transformation generates a conserved current \(J^\mu\) with \(\partial_\mu J^\mu = 0\). Time-translation invariance gives the stress-energy tensor (energy-momentum conservation); spatial translation invariance gives momentum conservation; rotation invariance gives angular momentum conservation; and phase invariance (\(\phi \to e^{i\alpha}\phi\)) gives charge conservation. The entire conserved charge structure of the Standard Model follows from these principles.

## Constraints: Holonomic vs. Non-Holonomic

The treatment of constraints in mechanics deserves additional discussion. **Holonomic constraints** \(f(q, t) = 0\) reduce the number of independent coordinates and can be incorporated by either reducing the coordinate set or introducing Lagrange multipliers. **Semi-holonomic (Pfaffian) constraints** take the form \(\sum_i A_{ij}(q)\dot{q}_j + A_{it} = 0\) and may or may not be integrable.

A constraint is integrable if and only if the curl condition holds: \(\partial A_{ij}/\partial q_k - \partial A_{ik}/\partial q_j = 0\) (for time-independent constraints). Non-integrable constraints (true non-holonomic constraints) cannot be reduced to positional equations, and the Lagrangian method requires Lagrange multipliers with the constraint appearing in velocity form.

Examples of non-holonomic constraints include:
- **Rolling without slipping**: \(v = R\omega\) relates velocity to angular velocity, but the position of the contact point depends on path.
- **Knife edge**: A blade constrained to move in the direction it points — the constraint on \(\dot{x}/\dot{y} = \sin\theta/\cos\theta\) is not integrable in general.
- **Chaplygin sleigh**: A rigid body with a blade attached — a classic non-holonomic system exhibiting interesting dynamics.

## Hamilton's Equations and Phase Space: Deeper Properties

### The Symplectic Structure

The structure that Hamilton's equations preserve is the **symplectic form**

\[\Omega = \sum_i dq_i\wedge dp_i.\]

A transformation is canonical if and only if it preserves \(\Omega\). The symplectic form is analogous to the metric tensor in Riemannian geometry — it provides an inner product on phase space and defines the notion of "area."

The group of canonical transformations is the **symplectic group** Sp(\(2n\)). In two dimensions (\(n=1\)), Sp(2) = SL(2), the group of \(2\times 2\) real matrices with determinant 1 — area-preserving maps. Liouville's theorem states that the full \(2n\)-dimensional symplectic volume is preserved, but so is every lower-dimensional symplectic structure (Gromov's non-squeezing theorem in symplectic geometry).

### Complete Integrability and Action-Angle Variables

For a completely integrable system, the phase space is foliated by invariant \(n\)-tori (the **Liouville-Arnold tori**). On each torus, the motion is quasi-periodic with \(n\) frequencies \(\omega_1, \ldots, \omega_n\). The action-angle variables \((J_i, \theta_i)\) globally cover the phase space (away from singular surfaces), and the Hamiltonian depends only on the actions: \(H = H(J_1, \ldots, J_n)\).

The motion is periodic if all frequency ratios are rational; otherwise it is quasi-periodic and the trajectory densely fills the torus. The Kepler problem is completely integrable (three degrees of freedom, three constants: energy, \(L^2\), \(L_z\)), and in action-angle variables the three frequencies are all equal — explaining why the orbit closes.

## Waves and Coupled Oscillators: Toward Field Theory

The transition from finitely many coupled oscillators to a continuous medium is one of the most important in physics. Starting from \(n\) masses on a string and taking \(n \to \infty\) while keeping the linear mass density and tension fixed, the discrete equations of motion become the **wave equation**:

\[\frac{\partial^2\psi}{\partial t^2} = c^2\frac{\partial^2\psi}{\partial x^2}.\]

The discrete normal mode frequencies \(\omega_r = (r\pi c)/L\) become a continuous spectrum. The Lagrangian becomes a **Lagrangian density**:

\[\mathcal{L} = \frac{1}{2}\left(\frac{\partial\psi}{\partial t}\right)^2 - \frac{c^2}{2}\left(\frac{\partial\psi}{\partial x}\right)^2,\]

and the Euler-Lagrange equations for this functional give the wave equation. This is the prototype of classical field theory.

The canonical momentum density is \(\pi = \partial\mathcal{L}/\partial\dot\psi = \dot\psi\), and the Hamiltonian density is

\[\mathcal{H} = \pi\dot\psi - \mathcal{L} = \frac{1}{2}\pi^2 + \frac{c^2}{2}(\partial_x\psi)^2 = T + V,\]

exactly the total energy density. Quantizing this field theory (replacing \(\psi\) and \(\pi\) by operators satisfying \([\psi(x), \pi(x')] = i\hbar\delta(x-x')\)) gives the quantum field theory of a free scalar boson.

## Summary: The Grand Architecture of Classical Mechanics

Classical mechanics, as developed in this course, reveals an extraordinarily deep and unified structure beneath the apparent diversity of mechanical phenomena. Let us briefly survey the main pillars and their interconnections.

**The variational principle** — Hamilton's principle \(\delta S = 0\) — provides the unifying foundation. From a single scalar function (the Lagrangian), all equations of motion follow by a mechanical procedure. The principle is manifestly coordinate-invariant, making it ideal for constrained systems and curved coordinates.

**Noether's theorem** bridges symmetry and conservation: every continuous symmetry of the action corresponds to a conserved quantity. Time translation gives energy conservation; spatial translation gives linear momentum conservation; rotation gives angular momentum conservation. The existence of other conserved quantities (like the Runge-Lenz vector for the Kepler problem) signals additional hidden symmetries.

**The Hamiltonian formulation** reframes mechanics as geometry in phase space. The symplectic structure, Poisson brackets, and canonical transformations reveal the mathematical richness underlying Newton's second law. Liouville's theorem shows that Hamiltonian mechanics is, at heart, a theory of volume-preserving flow.

**The Hamilton-Jacobi equation** brings mechanics closest to wave mechanics, and its complete integral — Hamilton's principal function — provides the most complete solution of any mechanical problem. The adiabatic invariance of the action variables provides a bridge to quantum mechanics via the old quantum theory.

**Rigid body dynamics** illustrates all these themes in a spectacular way: the Euler equations follow from Hamilton's equations in the body frame, the heavy top's motion involves all aspects of Lagrangian mechanics (cyclic coordinates, conserved momenta, effective potentials), and the stability analysis reveals qualitatively different behaviors depending on the relationship between principal moments of inertia.

**Small oscillations and normal modes** show how complex multi-body systems decompose into independent simple harmonic oscillators near equilibrium, with profound implications for molecular physics, solid-state physics, and quantum field theory.

These are not separate topics but facets of a single coherent structure — one that continues to inform physics at the deepest levels, from celestial mechanics to condensed matter to elementary particles. The methods and intuitions developed in intermediate classical mechanics are not merely historical artifacts but living tools in the physicist's toolkit.

---

# Appendix: Mathematical Methods

## Vector Calculus Review

**Gradient**: \(\nabla f = \sum_i \frac{\partial f}{\partial x_i}\hat{e}_i\). In curvilinear coordinates, the form changes.

**Divergence**: \(\nabla\cdot\mathbf{A} = \sum_i \frac{\partial A_i}{\partial x_i}\). In spherical: \(\nabla\cdot\mathbf{A} = \frac{1}{r^2}\frac{\partial}{\partial r}(r^2 A_r) + \frac{1}{r\sin\theta}\frac{\partial}{\partial\theta}(\sin\theta A_\theta) + \frac{1}{r\sin\theta}\frac{\partial A_\phi}{\partial\phi}\).

**Curl**: \((\nabla\times\mathbf{A})_k = \epsilon_{ijk}\frac{\partial A_j}{\partial x_i}\). Key identity: \(\nabla\times(\nabla f) = 0\).

**Triple products**: \(\mathbf{A}\times(\mathbf{B}\times\mathbf{C}) = \mathbf{B}(\mathbf{A}\cdot\mathbf{C}) - \mathbf{C}(\mathbf{A}\cdot\mathbf{B})\) (BAC-CAB rule).

## Differential Equations

**Second-order linear ODE with constant coefficients**: \(\ddot{x} + 2\beta\dot{x} + \omega_0^2 x = f(t)\). Characteristic equation \(r^2 + 2\beta r + \omega_0^2 = 0\) gives \(r = -\beta \pm \sqrt{\beta^2 - \omega_0^2}\). Underdamped (\(\beta < \omega_0\)): oscillatory solution decaying as \(e^{-\beta t}\). Overdamped: two real decaying exponentials. Critically damped: \(e^{-\beta t}(c_1 + c_2 t)\).

**Method of variation of parameters**: for the particular solution of \(\ddot{x} + p(t)\dot{x} + q(t)x = f(t)\), if \(x_1, x_2\) are homogeneous solutions, the particular solution is

\[x_p = -x_1\int\frac{x_2 f}{W}\,dt + x_2\int\frac{x_1 f}{W}\,dt,\]

where \(W = x_1\dot{x}_2 - x_2\dot{x}_1\) is the Wronskian.

## Linear Algebra for Normal Modes

For the generalized eigenvalue problem \(\mathbf{K}\mathbf{a} = \omega^2\mathbf{M}\mathbf{a}\) with \(\mathbf{M}\) positive definite:

1. Transform \(\mathbf{K}' = \mathbf{M}^{-1/2}\mathbf{K}\mathbf{M}^{-1/2}\) (symmetric).
2. Find eigenvalues of \(\mathbf{K}'\) (standard eigenvalue problem).
3. Transform back: if \(\mathbf{K}'\mathbf{b} = \omega^2\mathbf{b}\), then \(\mathbf{a} = \mathbf{M}^{-1/2}\mathbf{b}\).

All eigenvalues \(\omega^2\) are real (since \(\mathbf{K}'\) is symmetric). They are positive if the equilibrium is stable (minimum of \(V\)).

## Key Formulas Summary

**Euler-Lagrange equation**: \(\frac{\partial\mathcal{L}}{\partial q} - \frac{d}{dt}\frac{\partial\mathcal{L}}{\partial\dot{q}} = 0\)

**Beltrami identity** (when \(\partial f/\partial x = 0\)): \(f - y'\frac{\partial f}{\partial y'} = \text{const}\)

**Noether conserved charge**: \(I = \sum_i p_i\delta q_i - \Lambda\)

**Energy function**: \(h = \sum_i p_i\dot{q}_i - \mathcal{L}\)

**Angular momentum in central force**: \(\ell = \mu r^2\dot\phi\)

**Effective potential**: \(V_{\text{eff}} = V(r) + \frac{\ell^2}{2\mu r^2}\)

**Kepler orbit**: \(r = \frac{p}{1 + e\cos\phi}\), with \(p = \ell^2/\mu k\)

**Rotating frame acceleration**: \(\mathbf{a}_{\text{inertial}} = \mathbf{a}' + 2\boldsymbol\Omega\times\mathbf{v}' + \boldsymbol\Omega\times(\boldsymbol\Omega\times\mathbf{r})\)

**Inertia tensor**: \(I_{ij} = \int(r^2\delta_{ij} - x_i x_j)\,dm\)

**Euler equations**: \(I_k\dot\omega_k = (I_j - I_i)\omega_i\omega_j\) (cyclic in \(i,j,k\))

**Hamilton's equations**: \(\dot{q}_i = \frac{\partial H}{\partial p_i}\), \(\dot{p}_i = -\frac{\partial H}{\partial q_i}\)

**Poisson bracket**: \(\{f,g\} = \sum_i\!\left(\frac{\partial f}{\partial q_i}\frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i}\frac{\partial g}{\partial q_i}\right)\)

**Hamilton-Jacobi equation**: \(H\!\left(q, \frac{\partial S}{\partial q}, t\right) + \frac{\partial S}{\partial t} = 0\)

**Action variable**: \(J = \frac{1}{2\pi}\oint p\,dq\)

**Kepler third law**: \(T^2 = \frac{4\pi^2}{GM}a^3\)

**Parallel axis theorem**: \(I = I_{\text{cm}} + Md^2\)
