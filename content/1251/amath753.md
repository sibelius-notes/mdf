---
title: "AMATH 753: Advanced Partial Differential Equations"
subjects: "AMATH"
---

## Sources and References

These notes synthesize material from the following publicly accessible graduate-level references:

- Evans, L. C., *Partial Differential Equations*, 2nd ed., American Mathematical Society, 2010. The primary reference for Sobolev spaces, elliptic theory, semigroups, and viscosity solutions.
- Brezis, H., *Functional Analysis, Sobolev Spaces and Partial Differential Equations*, Springer, 2011. The main reference for functional analytic methods, the Lax-Milgram theorem, and compact operators.
- Renardy, M. and Rogers, R. C., *An Introduction to Partial Differential Equations*, 2nd ed., Springer, 2004. Especially useful for hyperbolic systems, characteristics, and power series methods.
- Taylor, M. E., *Partial Differential Equations I–III*, Springer, 1996–1997. Encyclopedic treatment covering semigroup theory, pseudodifferential operators, and regularity theory.
- Folland, G. B., *Introduction to Partial Differential Equations*, Princeton University Press, 1995. Concise and elegant; strong on distributions and fundamental solutions.
- MIT OpenCourseWare 18.152, *Introduction to Partial Differential Equations*, publicly available lecture notes (ocw.mit.edu).

---

# Chapter 1: Well-Posedness and Classification

## 1.1 Hadamard's Notion of Well-Posedness

The modern study of partial differential equations is organized around the question of whether a given problem is **well-posed** in the sense introduced by Jacques Hadamard at the beginning of the twentieth century. Hadamard observed that a physically meaningful mathematical problem should satisfy three conditions simultaneously: a solution must exist, it must be unique, and it must depend continuously on the data prescribed in the problem. A problem failing any one of these conditions is called **ill-posed**, and solutions to such problems, even when they formally exist, cannot be trusted as models of physical reality because small errors in measurement or rounding in computation can lead to arbitrarily large deviations in the purported solution.

<div class="definition">
<strong>Definition 1.1 (Hadamard Well-Posedness).</strong> Let <em>X</em> and <em>Y</em> be Banach spaces and let <em>L : X → Y</em> represent a differential operator together with its boundary and initial conditions. The problem <em>Lu = f</em> is <strong>well-posed</strong> if:
<ol>
<li><em>Existence:</em> For every <em>f ∈ Y</em>, there exists at least one solution <em>u ∈ X</em>.</li>
<li><em>Uniqueness:</em> For every <em>f ∈ Y</em>, there exists at most one solution <em>u ∈ X</em>.</li>
<li><em>Continuous dependence:</em> The solution map <em>f ↦ u</em> is continuous from <em>Y</em> to <em>X</em>; equivalently, there exists a constant <em>C > 0</em> such that ‖<em>u</em>‖<sub><em>X</em></sub> ≤ <em>C</em>‖<em>f</em>‖<sub><em>Y</em></sub>.</li>
</ol>
</div>

The third condition is perhaps the most subtle. It ensures that the problem is **stable**: a small perturbation in the data \( f \) produces a correspondingly small perturbation in the solution \( u \). Hadamard demonstrated by explicit example that the Cauchy problem for Laplace's equation \( \Delta u = 0 \) posed with data on a line is ill-posed in any reasonable topology; the well-known example prescribes data \( u(x, 0) = 0 \) and \( u_y(x, 0) = n^{-1} \sin(nx) \), for which the solution grows like \( n^{-1} \sinh(ny) \), becoming unbounded for any fixed \( y \neq 0 \) as \( n \to \infty \). This example provides the conceptual foundation for understanding why elliptic equations are not suited to Cauchy problems on open sets.

## 1.2 Classification of Second-Order Linear PDEs

A general second-order linear PDE in \( n \) independent variables \( x = (x_1, \ldots, x_n) \) takes the form

\[
\sum_{i,j=1}^{n} a_{ij}(x) \frac{\partial^2 u}{\partial x_i \partial x_j} + \sum_{i=1}^{n} b_i(x) \frac{\partial u}{\partial x_i} + c(x) u = f(x),
\]

where the coefficient matrix \( A(x) = (a_{ij}(x)) \) may be assumed symmetric without loss of generality, since mixed partial derivatives satisfy \( \partial^2 u / \partial x_i \partial x_j = \partial^2 u / \partial x_j \partial x_i \) for smooth solutions. The **principal part** of the operator is the quadratic form \( \sum_{i,j} a_{ij}(x) \xi_i \xi_j \) associated with the matrix \( A(x) \).

<div class="definition">
<strong>Definition 1.2 (Classification).</strong> The second-order operator is classified at a point <em>x</em> according to the signs of the eigenvalues of <em>A(x)</em>:
<ul>
<li><strong>Elliptic</strong> at <em>x</em> if all eigenvalues of <em>A(x)</em> are nonzero and have the same sign.</li>
<li><strong>Hyperbolic</strong> at <em>x</em> if <em>n − 1</em> eigenvalues have one sign and one eigenvalue has the opposite sign.</li>
<li><strong>Parabolic</strong> at <em>x</em> if at least one eigenvalue is zero.</li>
<li><strong>Ultrahyperbolic</strong> if there are at least two positive and two negative eigenvalues.</li>
</ul>
</div>

In two independent variables \( (x, y) \), the operator \( au_{xx} + 2bu_{xy} + cu_{yy} + \cdots \) is elliptic, parabolic, or hyperbolic according as the **discriminant** \( b^2 - ac \) is negative, zero, or positive, respectively, in direct analogy with the classification of conic sections.

The canonical forms illuminate the analogy with conic sections. For constant-coefficient operators in two variables, a linear change of coordinates brings the principal part into one of three standard forms:

- **Elliptic:** \( u_{xx} + u_{yy} \), the Laplacian, with prototype the steady-state heat equation.
- **Parabolic:** \( u_{xx} - u_t \), the heat operator, where one variable plays the role of time.
- **Hyperbolic:** \( u_{xx} - u_{yy} = u_{xx} - u_{tt} \), the wave operator \( \Box u \).

The classification is not merely algebraic; it profoundly determines the correct class of auxiliary conditions (initial or boundary data) that yield a well-posed problem.

## 1.3 Characteristic Curves and Surfaces

The notion of **characteristics** provides a geometric interpretation of the classification. Consider a first-order operator \( L = \sum_{i=1}^n a_i(x) \partial_i + c(x) \). A smooth hypersurface \( \Sigma \) defined by \( \phi(x) = 0 \) is a **characteristic surface** for \( L \) at a point \( x_0 \in \Sigma \) if the principal symbol of \( L \) vanishes on the normal to \( \Sigma \) at \( x_0 \), that is, if

\[
\sum_{i=1}^{n} a_i(x_0) \frac{\partial \phi}{\partial x_i}(x_0) = 0.
\]

For a second-order operator with principal part \( \sum_{i,j} a_{ij} \partial_i \partial_j \), the **characteristic condition** for the surface \( \phi = 0 \) is

\[
\sum_{i,j=1}^{n} a_{ij}(x) \frac{\partial \phi}{\partial x_i} \frac{\partial \phi}{\partial x_j} = 0.
\]

This is the **characteristic equation** or **eikonal equation** associated with the second-order operator. The characteristics carry the information about where the Cauchy problem can or cannot be solved, and where discontinuities in the solution or its derivatives can propagate.

In two dimensions with the wave equation \( u_{tt} = c^2 u_{xx} \), the characteristic condition becomes \( \phi_t^2 - c^2 \phi_x^2 = 0 \), yielding the two families of characteristic curves \( x \pm ct = \text{const} \). These are precisely the curves along which information propagates at speed \( c \), and they correspond to the null directions of the wave operator. The general solution is \( u(x, t) = F(x - ct) + G(x + ct) \) by d'Alembert's formula.

## 1.4 The Cauchy-Kovalevskaya Theorem: Characteristic Form

The classical Cauchy-Kovalevskaya theorem guarantees local existence and uniqueness of analytic solutions when data is prescribed on a non-characteristic surface. Its statement requires the concept of **non-characteristic**: a hypersurface \( \Sigma \) is non-characteristic for the operator \( L \) if the characteristic condition fails on \( \Sigma \).

<div class="theorem">
<strong>Theorem 1.3 (Cauchy-Kovalevskaya, informal).</strong> Let <em>Σ</em> be a real-analytic hypersurface that is non-characteristic for a real-analytic PDE of order <em>m</em>. If the Cauchy data (values of <em>u</em> and its normal derivatives up to order <em>m − 1</em>) is real-analytic on <em>Σ</em>, then the Cauchy problem has a unique real-analytic solution in a neighborhood of <em>Σ</em>.
</div>

The proof proceeds by reducing the PDE to a first-order system of the form \( \partial_t \mathbf{u} = F(x, t, \mathbf{u}, \nabla_x \mathbf{u}) \) using the non-characteristic hypothesis to solve for the highest-order normal derivative, then applying the **majorant method**: one constructs a comparison series with positive coefficients that dominates the formal power series coefficient by coefficient and is known to converge, thereby proving absolute convergence of the formal solution. The theorem is local and applies only in the analytic category; Lewy's example (1957) shows it fails dramatically for smooth non-analytic data even in simple cases.

---

# Chapter 2: First-Order Nonlinear PDEs

## 2.1 The Method of Characteristics

The **method of characteristics** transforms a first-order PDE into a system of ordinary differential equations along curves in the space of independent variables. For the quasilinear first-order equation

\[
\sum_{i=1}^{n} a_i(x, u) \frac{\partial u}{\partial x_i} = b(x, u),
\]

the **characteristic equations** (or **characteristic ODEs**) are the system

\[
\frac{d x_i}{ds} = a_i(x(s), u(s)), \quad \frac{d u}{ds} = b(x(s), u(s)),
\]

where \( s \) is the parameter along the characteristic curve. Given initial data \( u = u_0 \) on a hypersurface \( \Sigma \), one starts a characteristic curve from each point of \( \Sigma \) and transports the value of \( u \) along it. The solution at a general point \( x \) is found by identifying the characteristic passing through \( x \) and tracing it back to \( \Sigma \).

For the **fully nonlinear** first-order equation \( F(x, u, Du) = 0 \), where \( Du = (\partial u / \partial x_1, \ldots, \partial u / \partial x_n) = p \in \mathbb{R}^n \), the method generalizes via the **Charpit-Lagrange equations**:

\[
\frac{dx_i}{ds} = \frac{\partial F}{\partial p_i}, \quad \frac{dp_i}{ds} = -\frac{\partial F}{\partial x_i} - p_i \frac{\partial F}{\partial u}, \quad \frac{du}{ds} = \sum_{i} p_i \frac{\partial F}{\partial p_i}.
\]

This system evolves the position \( x \), the gradient \( p = Du \), and the value \( u \) simultaneously. The key condition for the method to work is that the initial data surface is **non-characteristic** in the sense that \( F(x, u_0, p_0) = 0 \) on \( \Sigma \) can be solved for the normal component of \( p \) from the tangential components and \( u_0 \).

## 2.2 The Eikonal Equation

The **eikonal equation** arises naturally in geometric optics and is the prototypical example of a fully nonlinear first-order PDE. In its simplest form it reads

\[
\left| \nabla u \right|^2 = \frac{1}{c(x)^2},
\]

where \( c(x) > 0 \) is the local wave speed and \( u(x) \) represents the travel time from a source. Equivalently, writing \( n(x) = 1/c(x) \) for the **index of refraction**, the eikonal equation is \( |\nabla u| = n(x) \).

The characteristics of the eikonal equation are the **rays** of geometric optics. Applying the Charpit-Lagrange system with \( F(x, p) = |p|^2 - n(x)^2 \), one finds

\[
\frac{dx}{ds} = 2p, \quad \frac{dp}{ds} = 2n \nabla n = \nabla(n^2),
\]

which, combined with the arc-length parametrization, yields the **ray equations** of geometric optics:

\[
\frac{d}{ds}\left( n(x) \frac{dx}{ds} \right) = \nabla n(x).
\]

These are the Euler-Lagrange equations for the **Fermat functional** \( \int n(x(s)) \, ds \), showing that rays are geodesics of the Riemannian metric \( n(x)|dx| \). The eikonal equation is the Hamilton-Jacobi equation corresponding to the optical Hamiltonian \( H(x, p) = c(x)|p| \).

## 2.3 Hamilton-Jacobi Equations

The **Hamilton-Jacobi equation** is the nonlinear first-order PDE

\[
u_t + H(x, Du) = 0, \quad (x, t) \in \mathbb{R}^n \times (0, \infty),
\]

with initial condition \( u(x, 0) = g(x) \). Here \( H : \mathbb{R}^n \times \mathbb{R}^n \to \mathbb{R} \) is the **Hamiltonian** and \( u : \mathbb{R}^n \times [0,\infty) \to \mathbb{R} \) is the **value function** of an associated optimal control or calculus of variations problem.

The connection to classical mechanics is immediate: if we define the **Lagrangian** \( L(x, v) \) as the Legendre transform of \( H \) in the \( p \)-variable,

\[
L(x, v) = \sup_{p \in \mathbb{R}^n} \left\{ p \cdot v - H(x, p) \right\},
\]

then the value function of the problem

\[
u(x, t) = \inf_{\gamma(t) = x} \left\{ g(\gamma(0)) + \int_0^t L(\gamma(s), \dot{\gamma}(s)) \, ds \right\}
\]

formally satisfies the Hamilton-Jacobi equation. The **Hopf-Lax formula** for the case \( H = H(p) \) (independent of \( x \)) gives the explicit representation

\[
u(x, t) = \min_{y \in \mathbb{R}^n} \left\{ g(y) + t L\!\left(\frac{x - y}{t}\right) \right\}.
\]

This formula yields a Lipschitz function satisfying the Hamilton-Jacobi equation almost everywhere (in the sense of Rademacher's theorem), but classical solutions generally develop singularities in finite time, motivating the concept of viscosity solutions.

## 2.4 Viscosity Solutions

The notion of **viscosity solutions**, introduced by Crandall and Lions in 1983, provides the correct weak framework for Hamilton-Jacobi equations and more generally for fully nonlinear first-order and second-order PDEs.

<div class="definition">
<strong>Definition 2.1 (Viscosity Solution).</strong> A continuous function <em>u</em> is a <strong>viscosity subsolution</strong> of <em>F(x, u, Du) = 0</em> if, for every smooth test function <em>φ</em> and every local maximum point <em>x₀</em> of <em>u − φ</em>, one has

\[F(x_0, u(x_0), D\varphi(x_0)) \leq 0.\]

It is a <strong>viscosity supersolution</strong> if, for every smooth <em>φ</em> and every local minimum of <em>u − φ</em>, one has

\[F(x_0, u(x_0), D\varphi(x_0)) \geq 0.\]

A <strong>viscosity solution</strong> is a function that is simultaneously a viscosity subsolution and a viscosity supersolution.
</div>

The key insight is that wherever \( u \) is touched from above by a smooth function \( \varphi \), the gradient \( D\varphi \) serves as a substitute for the gradient \( Du \), which may not exist. The name "viscosity" derives from the **vanishing viscosity method**: one considers the regularized equation \( F(x, u^\varepsilon, Du^\varepsilon) = \varepsilon \Delta u^\varepsilon \) and passes to the limit \( \varepsilon \to 0 \). The Hopf-Lax formula produces precisely the viscosity solution of the corresponding Hamilton-Jacobi equation, and viscosity solutions can be shown to satisfy a **comparison principle**: if \( u \) is a subsolution and \( v \) is a supersolution with \( u \leq v \) on the boundary, then \( u \leq v \) in the interior. This comparison principle immediately implies uniqueness.

## 2.5 Characteristics for Quasilinear Equations and Shock Formation

For the scalar conservation law \( u_t + f(u)_x = 0 \) in one space dimension with initial data \( u(x, 0) = u_0(x) \), the characteristics are the lines \( x = x_0 + f'(u_0(x_0)) t \) along which \( u \) remains constant. When \( f'(u_0(x_0)) \) is not monotone in \( x_0 \), characteristics from different initial points can **intersect** in finite time, creating a multi-valued "solution" that is physically inadmissible. This is the formation of a **shock**.

The time of shock formation is

\[
T_{\text{shock}} = -\frac{1}{\min_{x} f''(u_0(x)) u_0'(x)},
\]

assuming this minimum is negative. After \( T_{\text{shock}} \), a classical solution ceases to exist, and one must pass to weak solutions satisfying the integral identity obtained by multiplying by test functions and integrating by parts.

<div class="definition">
<strong>Definition 2.2 (Weak Solution).</strong> A bounded measurable function <em>u</em> is a <strong>weak solution</strong> of the conservation law <em>u_t + f(u)_x = 0</em> if for every smooth compactly supported test function <em>φ</em>,

\[
\int_0^\infty \int_{-\infty}^\infty \left( u \varphi_t + f(u) \varphi_x \right) dx \, dt + \int_{-\infty}^\infty u_0(x) \varphi(x, 0) \, dx = 0.
\]
</div>

Weak solutions are not unique in general; the **Rankine-Hugoniot condition** is necessary but not sufficient for physical relevance. If \( u^- \) and \( u^+ \) denote the left and right limits of \( u \) across a shock curve \( x = \sigma(t) \), the condition is

\[
\dot{\sigma}(t) = \frac{f(u^+) - f(u^-)}{u^+ - u^-},
\]

stating that the shock speed equals the ratio of the jump in flux to the jump in \( u \). This condition follows from the weak formulation by testing with functions supported near the shock curve.

---

# Chapter 3: Quasilinear Hyperbolic Systems

## 3.1 Strictly Hyperbolic Systems

Consider a first-order system of PDEs in one space dimension:

\[
\mathbf{u}_t + A(x, t, \mathbf{u}) \mathbf{u}_x = \mathbf{b}(x, t, \mathbf{u}),
\]

where \( \mathbf{u} : \mathbb{R} \times [0, \infty) \to \mathbb{R}^n \) and \( A \) is an \( n \times n \) matrix. The system is **hyperbolic** if \( A \) has \( n \) real eigenvalues \( \lambda_1 \leq \lambda_2 \leq \cdots \leq \lambda_n \) and a complete set of real eigenvectors, and **strictly hyperbolic** if all eigenvalues are distinct.

<div class="definition">
<strong>Definition 3.1 (Strict Hyperbolicity).</strong> The system is <strong>strictly hyperbolic</strong> at a point if the matrix <em>A</em> has <em>n</em> distinct real eigenvalues <em>λ₁ < λ₂ < … < λₙ</em>. In this case <em>A</em> is diagonalizable: there exists an invertible matrix <em>R = (r₁ | r₂ | … | rₙ)</em> of right eigenvectors such that <em>A = R Λ R⁻¹</em>, where <em>Λ = diag(λ₁, …, λₙ)</em>.
</div>

The eigenvalues \( \lambda_k \) are the **characteristic speeds** and the corresponding right eigenvectors \( r_k \) define the characteristic directions in phase space.

## 3.2 Riemann Invariants

For strictly hyperbolic systems with \( n \) characteristics, one seeks functions of \( \mathbf{u} \) that are constant along characteristics. A **Riemann invariant** for the \( k \)-th characteristic field is a function \( w = w(\mathbf{u}) \) satisfying

\[
\nabla_{\mathbf{u}} w \cdot r_k(\mathbf{u}) = 0,
\]

that is, \( w \) is constant in the direction of the \( k \)-th right eigenvector. For a \( 2 \times 2 \) system, each characteristic field has \( n - 1 = 1 \) independent Riemann invariant.

The significance of Riemann invariants is profound: in regions where the solution is smooth, each Riemann invariant for the \( k \)-th field satisfies \( \partial_t w + \lambda_k \partial_x w = 0 \), so \( w \) is advected along \( k \)-th characteristics. If we can express the system entirely in terms of Riemann invariants, the system **decouples** into \( n \) independent transport equations.

<div class="example">
<strong>Example 3.2 (The p-System).</strong> The <em>p-system</em> of isentropic gas dynamics is

\[
v_t - u_x = 0, \quad u_t + p(v)_x = 0,
\]

where <em>v = 1/ρ</em> is the specific volume, <em>u</em> is the velocity, and <em>p(v)</em> is the pressure with <em>p'(v) < 0</em>. The coefficient matrix is

\[
A = \begin{pmatrix} 0 & -1 \\ p'(v) & 0 \end{pmatrix},
\]

with eigenvalues <em>λ± = ±√(−p'(v)) = ±c(v)</em>, where <em>c(v) = √(−p'(v))</em> is the sound speed. The Riemann invariants are

\[
w = u + \int \frac{c(v)}{v} \, dv, \quad z = u - \int \frac{c(v)}{v} \, dv,
\]

satisfying <em>w_t + λ₊ w_x = 0</em> and <em>z_t + λ₋ z_x = 0</em> in smooth regions.
</div>

## 3.3 Simple Waves and Rarefaction Waves

A **simple wave** is a solution in which only one Riemann invariant varies, the other \( n - 1 \) remaining constant throughout the region. In such a region, the solution has a special structure that reduces the \( n \times n \) system to essentially a single nonlinear scalar PDE.

A **rarefaction wave** is a self-similar simple wave connecting two constant states \( u_L \) and \( u_R \). It takes the form \( \mathbf{u} = \mathbf{u}(x/t) \), where the function \( \xi \mapsto \mathbf{u}(\xi) \) is determined by the ODE

\[
\frac{d \mathbf{u}}{d \xi} = r_k(\mathbf{u}(\xi)), \quad \lambda_k(\mathbf{u}(\xi)) = \xi,
\]

with boundary conditions \( \mathbf{u}(-\infty) = u_L \) and \( \mathbf{u}(+\infty) = u_R \). For a rarefaction to exist, the \( k \)-th characteristic field must be **genuinely nonlinear**: \( \nabla \lambda_k \cdot r_k \neq 0 \), and the characteristic speeds must increase from left to right: \( \lambda_k(u_L) < \lambda_k(u_R) \).

## 3.4 Shock Waves and Entropy Conditions

When characteristics converge, a **shock wave** forms. Across a shock with speed \( \sigma \), the **Rankine-Hugoniot conditions** for the system \( \mathbf{u}_t + \mathbf{f}(\mathbf{u})_x = 0 \) read

\[
\sigma (\mathbf{u}^+ - \mathbf{u}^-) = \mathbf{f}(\mathbf{u}^+) - \mathbf{f}(\mathbf{u}^-),
\]

where \( \mathbf{u}^\pm \) denote the states immediately to the right and left of the shock. These are the jump conditions derived from conservation laws by integrating across the shock.

Not all weak solutions satisfying the Rankine-Hugoniot conditions are physically admissible. The **Lax entropy condition** selects the physically correct shocks.

<div class="definition">
<strong>Definition 3.3 (Lax Entropy Condition).</strong> A <em>k</em>-shock with speed <em>σ</em> connecting states <em>u_L</em> on the left and <em>u_R</em> on the right satisfies the <strong>Lax entropy condition</strong> if

\[
\lambda_k(u_L) > \sigma > \lambda_k(u_R),
\]

and if <em>k > 1</em>,

\[
\lambda_{k-1}(u_L) < \sigma, \quad \lambda_{k+1}(u_R) > \sigma.
\]
</div>

The Lax entropy condition states that \( k \)-characteristics impinge on the shock from both sides: characteristics from the left with speed \( \lambda_k(u_L) \) are faster than the shock, and characteristics from the right with speed \( \lambda_k(u_R) \) are slower. Geometrically, information flows into the shock from both sides, which is the correct causal picture for dissipative shocks. It excludes the unphysical "expansion shocks" in which characteristics emanate from the discontinuity.

---

# Chapter 4: Potential Theory and Elliptic PDEs

## 4.1 The Laplace and Poisson Equations

The **Laplace equation** \( \Delta u = 0 \) and the **Poisson equation** \( -\Delta u = f \) in a domain \( \Omega \subseteq \mathbb{R}^n \) are the canonical elliptic PDEs. A \( C^2 \) solution of Laplace's equation is called a **harmonic function**. These equations arise in steady-state heat conduction, electrostatics, gravitational potential theory, and conformal mapping.

The **fundamental solution** of the Laplacian plays a role analogous to the Green's function for ordinary differential equations. It is the solution of \( -\Delta \Phi = \delta_0 \) (distributional equation) in \( \mathbb{R}^n \), given explicitly by

\[
\Phi(x) = \begin{cases} \dfrac{1}{n(n-2)\omega_n} |x|^{2-n} & n \geq 3 \\ -\dfrac{1}{2\pi} \log |x| & n = 2 \end{cases}
\]

where \( \omega_n \) is the volume of the unit ball in \( \mathbb{R}^n \). The solution of the Poisson equation \( -\Delta u = f \) in \( \mathbb{R}^n \) (for appropriate \( f \)) is then given by convolution:

\[
u(x) = (\Phi * f)(x) = \int_{\mathbb{R}^n} \Phi(x - y) f(y) \, dy.
\]

This can be verified by a direct computation using the distributional identity \( -\Delta \Phi = \delta_0 \).

## 4.2 Green's Functions and Representation Formulas

For the Dirichlet problem in a bounded domain \( \Omega \),

\[
-\Delta u = f \text{ in } \Omega, \quad u = g \text{ on } \partial \Omega,
\]

the **Green's function** \( G(x, y) \) is defined as the fundamental solution corrected to vanish on the boundary:

\[
G(x, y) = \Phi(x - y) - \phi^x(y),
\]

where \( \phi^x \) is the unique harmonic function in \( \Omega \) with boundary values \( \phi^x(y) = \Phi(x - y) \) for \( y \in \partial \Omega \). The **Green's representation formula** then gives

\[
u(x) = \int_\Omega G(x, y) f(y) \, dy - \int_{\partial \Omega} g(y) \frac{\partial G}{\partial \nu_y}(x, y) \, dS(y),
\]

where \( \nu_y \) is the outward normal at \( y \in \partial \Omega \). The kernel \( K(x, y) = -\partial G / \partial \nu_y \) is the **Poisson kernel** of the domain.

For the ball \( B(0, R) \subset \mathbb{R}^n \), the Poisson kernel can be computed explicitly:

\[
K(x, y) = \frac{R^2 - |x|^2}{R \omega_n |x - y|^n}, \quad x \in B(0, R), \ y \in \partial B(0, R).
\]

This gives the **Poisson integral formula** \( u(x) = \int_{\partial B} K(x, y) g(y) \, dS(y) \) for the harmonic function with boundary data \( g \).

## 4.3 Mean Value Property and Maximum Principles

The mean value property is one of the most beautiful and powerful features of harmonic functions.

<div class="theorem">
<strong>Theorem 4.1 (Mean Value Property).</strong> Let <em>u</em> be harmonic in an open set <em>Ω ⊆ ℝⁿ</em>. Then for every ball <em>B(x, r) ⊂⊂ Ω</em>,

\[
u(x) = \frac{1}{|\partial B(x,r)|} \int_{\partial B(x,r)} u \, dS = \frac{1}{|B(x,r)|} \int_{B(x,r)} u \, dy.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Define <em>φ(r) = (1/|∂B(x,r)|) ∫_{∂B(x,r)} u dS</em>. By change of variables <em>y = x + rz</em>, one computes <em>φ'(r) = (1/|∂B(0,1)|) ∫_{∂B(0,1)} ∇u(x + rz) · z dS(z)</em>. By the divergence theorem applied on the ball <em>B(0,1)</em>, this equals <em>(r/n) (1/|B(x,r)|) ∫_{B(x,r)} Δu dy = 0</em> since <em>Δu = 0</em>. Thus <em>φ</em> is constant in <em>r</em>, and taking the limit as <em>r → 0</em> gives <em>φ(r) = φ(0) = u(x)</em>. The solid ball formula follows by integrating over <em>r</em>.
</div>

The mean value property immediately implies the following strong maximum principle.

<div class="theorem">
<strong>Theorem 4.2 (Strong Maximum Principle).</strong> Let <em>Ω</em> be a bounded connected open set and let <em>u ∈ C²(Ω) ∩ C(Ω̄)</em> be harmonic in <em>Ω</em>. Then:
<ol>
<li><em>(Weak Maximum Principle)</em> max<sub>Ω̄</sub> u = max<sub>∂Ω</sub> u.</li>
<li><em>(Strong Maximum Principle)</em> If <em>u</em> attains its maximum at an interior point <em>x₀ ∈ Ω</em>, then <em>u</em> is constant on <em>Ω</em>.</li>
</ol>
</div>

<div class="proof">
<strong>Proof Sketch.</strong> Suppose <em>u(x₀) = M = max<sub>Ω̄</sub> u</em> for some <em>x₀ ∈ Ω</em>. The set <em>S = {x ∈ Ω : u(x) = M}</em> is closed in <em>Ω</em> by continuity. For any <em>x ∈ S</em>, the mean value property gives <em>M = u(x) = (1/|B(x,r)|) ∫_{B(x,r)} u dy ≤ M</em>, with equality only if <em>u ≡ M</em> on <em>B(x, r)</em>. Hence <em>S</em> is open in <em>Ω</em>. Since <em>Ω</em> is connected and <em>S</em> is both open and closed in <em>Ω</em> and nonempty, we have <em>S = Ω</em>.
</div>

## 4.4 The Dirichlet Problem via Sobolev Spaces

The classical approach via Green's functions requires explicit knowledge of the domain and is limited to special geometries. The modern approach uses Sobolev spaces and functional analysis, yielding existence results in great generality.

The **Sobolev space** \( H^1(\Omega) = W^{1,2}(\Omega) \) consists of functions \( u \in L^2(\Omega) \) whose weak first derivatives also belong to \( L^2(\Omega) \):

\[
H^1(\Omega) = \left\{ u \in L^2(\Omega) : \frac{\partial u}{\partial x_i} \in L^2(\Omega) \text{ for } i = 1, \ldots, n \right\},
\]

equipped with the inner product

\[
\langle u, v \rangle_{H^1} = \int_\Omega u v \, dx + \int_\Omega \nabla u \cdot \nabla v \, dx.
\]

The subspace \( H^1_0(\Omega) \) is the closure of \( C^\infty_c(\Omega) \) (compactly supported smooth functions) in \( H^1(\Omega) \). Functions in \( H^1_0(\Omega) \) satisfy \( u = 0 \) on \( \partial \Omega \) in the trace sense, making this the correct space for the homogeneous Dirichlet problem.

The **weak formulation** of the Dirichlet problem \( -\Delta u = f \) in \( \Omega \), \( u = 0 \) on \( \partial \Omega \), is: find \( u \in H^1_0(\Omega) \) such that

\[
\int_\Omega \nabla u \cdot \nabla v \, dx = \int_\Omega f v \, dx \quad \text{for all } v \in H^1_0(\Omega).
\]

This is obtained by multiplying the PDE by a test function \( v \in H^1_0(\Omega) \), integrating over \( \Omega \), and applying Green's first identity. The existence and uniqueness of a weak solution follows from the Lax-Milgram theorem.

<div class="theorem">
<strong>Theorem 4.3 (Lax-Milgram).</strong> Let <em>H</em> be a Hilbert space, <em>B : H × H → ℝ</em> a bilinear form satisfying:
<ul>
<li><em>Continuity:</em> |B(u,v)| ≤ M‖u‖‖v‖ for some <em>M > 0</em>.</li>
<li><em>Coercivity:</em> B(u,u) ≥ α‖u‖² for some <em>α > 0</em>.</li>
</ul>
Then for every bounded linear functional <em>F : H → ℝ</em>, there exists a unique <em>u ∈ H</em> such that <em>B(u, v) = F(v)</em> for all <em>v ∈ H</em>.
</div>

For the Dirichlet-Laplacian problem, the bilinear form is \( B(u, v) = \int_\Omega \nabla u \cdot \nabla v \, dx \) and the Hilbert space is \( H^1_0(\Omega) \). Continuity of \( B \) follows from the Cauchy-Schwarz inequality. Coercivity follows from the **Poincaré inequality**.

<div class="theorem">
<strong>Theorem 4.4 (Poincaré Inequality).</strong> Let <em>Ω ⊂ ℝⁿ</em> be a bounded open set. There exists a constant <em>C = C(Ω) > 0</em> such that

\[
\int_\Omega |u|^2 \, dx \leq C \int_\Omega |\nabla u|^2 \, dx \quad \text{for all } u \in H^1_0(\Omega).
\]
</div>

The Poincaré inequality implies that \( \|\nabla u\|_{L^2} \) is an equivalent norm on \( H^1_0(\Omega) \), and with this norm the bilinear form \( B(u,u) = \|\nabla u\|_{L^2}^2 = \|u\|_{H^1_0}^2 \), so coercivity holds with \( \alpha = 1 \). The Lax-Milgram theorem then yields a unique weak solution.

---

# Chapter 5: Hilbert Space Methods and Spectral Theory

## 5.1 Weak Formulations and Sobolev Spaces

The Sobolev space framework extends naturally to more general elliptic operators. Consider the operator

\[
Lu = -\sum_{i,j=1}^n \frac{\partial}{\partial x_i}\left( a_{ij}(x) \frac{\partial u}{\partial x_j} \right) + c(x) u,
\]

where the coefficients are bounded measurable functions and the **uniform ellipticity condition** holds: there exists \( \theta > 0 \) such that

\[
\sum_{i,j=1}^n a_{ij}(x) \xi_i \xi_j \geq \theta |\xi|^2 \quad \text{for a.e. } x \in \Omega, \ \forall \xi \in \mathbb{R}^n.
\]

The bilinear form associated with \( L \) is

\[
B[u, v] = \int_\Omega \left( \sum_{i,j} a_{ij} \partial_i u \, \partial_j v + c \, u v \right) dx,
\]

and the weak formulation of the boundary value problem \( Lu = f \) with zero Dirichlet data is: find \( u \in H^1_0(\Omega) \) with \( B[u, v] = \langle f, v \rangle \) for all \( v \in H^1_0(\Omega) \). Uniform ellipticity and the Poincaré inequality together ensure coercivity when \( c \geq 0 \), and Lax-Milgram applies directly.

## 5.2 The Trace Theorem

The statement \( u = 0 \) on \( \partial \Omega \) for \( u \in H^1_0(\Omega) \) must be interpreted carefully, since functions in \( H^1(\Omega) \) are defined only up to sets of measure zero, and \( \partial \Omega \) has \( n \)-dimensional Lebesgue measure zero.

<div class="theorem">
<strong>Theorem 5.1 (Trace Theorem).</strong> Let <em>Ω</em> be a bounded open set with <em>C¹</em> boundary. There exists a bounded linear operator <em>T : H¹(Ω) → L²(∂Ω)</em>, called the <strong>trace operator</strong>, such that <em>Tu = u|_{∂Ω}</em> for all <em>u ∈ C¹(Ω̄)</em>. Moreover, the kernel of <em>T</em> is exactly <em>H¹₀(Ω)</em>.
</div>

The trace operator allows one to assign boundary values to Sobolev functions in a meaningful way and to formulate non-homogeneous Dirichlet conditions \( u = g \) on \( \partial \Omega \) by writing \( u = u_0 + \tilde{g} \) where \( u_0 \in H^1_0(\Omega) \) and \( \tilde{g} \in H^1(\Omega) \) is any extension of \( g \) into the interior.

## 5.3 Elliptic Regularity

A fundamental question is whether a weak solution is in fact a classical solution. The answer depends on the regularity of the data and the domain.

<div class="theorem">
<strong>Theorem 5.2 (Interior Elliptic Regularity).</strong> Let <em>Lu = f</em> in <em>Ω</em> in the weak sense, with <em>L</em> uniformly elliptic and with <em>C^∞</em> coefficients. If <em>f ∈ H^k(Ω)</em> for some <em>k ≥ 0</em>, then <em>u ∈ H^{k+2}(Ω')</em> for every open set <em>Ω' ⊂⊂ Ω</em>, with the estimate

\[
\|u\|_{H^{k+2}(\Omega')} \leq C \left( \|f\|_{H^k(\Omega)} + \|u\|_{L^2(\Omega)} \right).
\]
</div>

The proof of interior regularity uses **difference quotient methods**: one tests the equation with \( v = -D^{-h}_k(D^h_k u) \), where \( D^h_k u(x) = (u(x + he_k) - u(x))/h \) is the difference quotient in the \( k \)-th direction, and uses uniform ellipticity to bound \( \|D^h_k \nabla u\|_{L^2} \) uniformly in \( h \), then passes to the limit to conclude \( \nabla u \in H^1_{\text{loc}}(\Omega) \). Iterating this procedure yields the full regularity theorem.

**Global regularity** (up to the boundary) requires additional smoothness of \( \partial \Omega \): if \( f \in L^2(\Omega) \) and \( \partial \Omega \in C^2 \), then \( u \in H^2(\Omega) \) with a global \( H^2 \) estimate.

## 5.4 Sturm-Liouville Theory as an Eigenvalue Problem

The classical **Sturm-Liouville problem** on \( [a, b] \) is

\[
-(p(x) u')' + q(x) u = \lambda w(x) u, \quad u(a) = u(b) = 0,
\]

where \( p > 0 \), \( w > 0 \), and \( p, q, w \) are smooth. This is the eigenvalue problem for the operator \( L = -(pu')' + qu \) in the weighted Hilbert space \( L^2([a,b]; w \, dx) \).

In the Sobolev framework, the associated bilinear form is \( B[u, v] = \int_a^b (p u' v' + q u v) \, dx \) on \( H^1_0(a,b) \), and the problem becomes: find \( \lambda \in \mathbb{R} \) and \( u \in H^1_0(a,b) \setminus \{0\} \) such that \( B[u, v] = \lambda \langle u, v \rangle_{L^2_w} \) for all \( v \in H^1_0 \). The resolvent operator \( T : L^2_w \to L^2_w \) defined by \( Tf = u \) (solution of \( Lu = f \)) is compact (by the Rellich-Kondrachov embedding) and self-adjoint, so the spectral theorem for compact self-adjoint operators applies.

<div class="theorem">
<strong>Theorem 5.3 (Spectral Theorem for Compact Self-Adjoint Operators).</strong> Let <em>T : H → H</em> be a compact self-adjoint operator on a Hilbert space <em>H</em>. Then:
<ol>
<li>All eigenvalues of <em>T</em> are real.</li>
<li>The eigenvalues accumulate only at zero.</li>
<li>Eigenvectors corresponding to distinct eigenvalues are orthogonal.</li>
<li>There exists a complete orthonormal basis of <em>H</em> consisting of eigenvectors of <em>T</em>.</li>
</ol>
</div>

Translating back to the Sturm-Liouville operator, this yields a countable sequence of eigenvalues \( \lambda_1 < \lambda_2 < \lambda_3 < \cdots \to +\infty \) and corresponding eigenfunctions \( \{u_k\}_{k=1}^\infty \) forming a complete orthonormal basis for \( L^2_w(a, b) \). The **completeness** statement means that every \( f \in L^2_w \) can be written as

\[
f = \sum_{k=1}^\infty c_k u_k, \quad c_k = \langle f, u_k \rangle_{L^2_w},
\]

with convergence in \( L^2_w \). This eigenfunction expansion is the rigorous foundation for the method of separation of variables.

## 5.5 Eigenfunction Expansion for PDEs

For the multi-dimensional Dirichlet-Laplacian on a bounded domain \( \Omega \), the eigenvalue problem \( -\Delta u = \lambda u \) in \( \Omega \), \( u = 0 \) on \( \partial \Omega \), has eigenvalues \( 0 < \lambda_1 \leq \lambda_2 \leq \cdots \to \infty \) with corresponding \( L^2 \)-orthonormal eigenfunctions \( \{e_k\}_{k=1}^\infty \) that form a complete basis for \( L^2(\Omega) \).

The initial boundary value problem for the heat equation

\[
u_t - \Delta u = 0 \text{ in } \Omega \times (0, \infty), \quad u = 0 \text{ on } \partial \Omega \times (0, \infty), \quad u(\cdot, 0) = g
\]

is solved by eigenfunction expansion:

\[
u(x, t) = \sum_{k=1}^\infty e^{-\lambda_k t} \langle g, e_k \rangle_{L^2} e_k(x).
\]

The exponential decay \( e^{-\lambda_k t} \) ensures convergence for \( t > 0 \) and shows that the solution becomes instantly smooth (regularizing effect of the heat equation). The same expansion applied to the wave equation \( u_{tt} + \Delta u = 0 \) (with the negative sign convention for positive definiteness) gives oscillatory terms \( \cos(\sqrt{\lambda_k} t) \) and \( \sin(\sqrt{\lambda_k} t) \) instead of exponential decay, reflecting the conserved energy and absence of smoothing.

---

# Chapter 6: Semigroup Theory

## 6.1 Strongly Continuous Semigroups

The abstract theory of semigroups provides a unified framework for studying evolution equations \( u_t = Au \) where \( A \) is an unbounded operator on a Banach or Hilbert space. The idea is to define a family of operators \( \{S(t)\}_{t \geq 0} \) representing the solution map \( u(0) \mapsto u(t) \).

<div class="definition">
<strong>Definition 6.1 (C₀-Semigroup).</strong> A family of bounded linear operators <em>{S(t)}_{t≥0}</em> on a Banach space <em>X</em> is a <strong>strongly continuous (C₀) semigroup</strong> if:
<ol>
<li><em>S(0) = I</em> (identity operator).</li>
<li><em>S(t + s) = S(t) S(s)</em> for all <em>t, s ≥ 0</em> (semigroup property).</li>
<li>For each <em>x ∈ X</em>, the map <em>t ↦ S(t)x</em> is continuous from <em>[0,∞)</em> to <em>X</em>.</li>
</ol>
</div>

Every \( C_0 \)-semigroup satisfies a growth bound: there exist constants \( M \geq 1 \) and \( \omega \in \mathbb{R} \) such that \( \|S(t)\| \leq M e^{\omega t} \) for all \( t \geq 0 \). A semigroup is a **contraction semigroup** if \( \|S(t)\| \leq 1 \) for all \( t \geq 0 \), corresponding to \( M = 1 \) and \( \omega = 0 \).

## 6.2 The Infinitesimal Generator

Given a \( C_0 \)-semigroup \( \{S(t)\} \), its **infinitesimal generator** is the operator defined by the limit

\[
Ax = \lim_{t \to 0^+} \frac{S(t)x - x}{t},
\]

on the **domain** \( D(A) = \{ x \in X : \text{the limit exists} \} \). The generator \( A \) is a closed, densely defined operator, and it determines the semigroup uniquely. The heuristic relationship is \( S(t) = e^{tA} \), which is made rigorous by the functional calculus or by the Hille-Yosida theorem.

<div class="theorem">
<strong>Theorem 6.2 (Properties of the Generator).</strong> Let <em>A</em> be the generator of a <em>C₀</em>-semigroup <em>{S(t)}</em> on <em>X</em>. Then:
<ol>
<li>For every <em>x ∈ D(A)</em> and <em>t ≥ 0</em>, <em>S(t)x ∈ D(A)</em> and <em>(d/dt)S(t)x = AS(t)x = S(t)Ax</em>.</li>
<li>For every <em>x ∈ X</em>, <em>∫₀ᵗ S(s)x ds ∈ D(A)</em> and <em>A∫₀ᵗ S(s)x ds = S(t)x − x</em>.</li>
<li>The resolvent set contains the half-plane <em>{λ ∈ ℂ : Re λ > ω}</em>, and the resolvent operator is <em>R(λ, A) = (λI − A)⁻¹ = ∫₀^∞ e^{−λt} S(t) dt</em> (Laplace transform of the semigroup).</li>
</ol>
</div>

## 6.3 The Hille-Yosida Theorem

The central question is: which operators generate \( C_0 \)-semigroups? The answer for contraction semigroups is given by the fundamental Hille-Yosida theorem.

<div class="theorem">
<strong>Theorem 6.3 (Hille-Yosida).</strong> A closed densely defined linear operator <em>A : D(A) ⊆ X → X</em> is the generator of a <em>C₀</em>-contraction semigroup on <em>X</em> if and only if:
<ol>
<li>The real axis <em>(0, ∞)</em> is contained in the resolvent set of <em>A</em>.</li>
<li>For all <em>λ > 0</em>, ‖R(λ, A)‖ = ‖(λI − A)⁻¹‖ ≤ 1/λ.</li>
</ol>
</div>

The key idea of the proof is the construction of **Yosida approximants** \( A_\lambda = \lambda A R(\lambda, A) = \lambda^2 R(\lambda, A) - \lambda I \), which are bounded operators converging to \( A \) strongly on \( D(A) \) as \( \lambda \to \infty \). The semigroups \( S_\lambda(t) = e^{t A_\lambda} \) can be defined using the ordinary matrix exponential (since \( A_\lambda \) is bounded), and one shows they converge strongly to a limit \( S(t) \) which is the desired \( C_0 \)-semigroup.

For the general case (not just contractions), the condition is \( \|R(\lambda, A)^m\| \leq M / (\lambda - \omega)^m \) for all \( m \geq 1 \) and \( \lambda > \omega \), yielding a semigroup satisfying \( \|S(t)\| \leq M e^{\omega t} \).

## 6.4 Application to Parabolic Equations

The abstract Cauchy problem

\[
u'(t) = Au(t) \quad (t > 0), \quad u(0) = u_0,
\]

in a Banach space \( X \) is said to have a **mild solution** if \( u(t) = S(t) u_0 \), where \( \{S(t)\} \) is the \( C_0 \)-semigroup generated by \( A \). A **classical solution** exists when \( u_0 \in D(A) \), in which case \( u \in C^1((0,\infty); X) \cap C([0,\infty); X) \) and \( u(t) \in D(A) \) for all \( t > 0 \).

The heat equation \( u_t = \Delta u \) on \( L^2(\Omega) \) with zero Dirichlet conditions corresponds to the abstract Cauchy problem with generator \( A = \Delta \) on \( D(A) = H^2(\Omega) \cap H^1_0(\Omega) \). The operator \( A \) is negative definite and self-adjoint (in the sense of the Hilbert space), and the generated semigroup is the **heat semigroup** \( S(t) = e^{t\Delta} \). Its action on an eigenfunction expansion is precisely

\[
S(t) \left( \sum_k c_k e_k \right) = \sum_k c_k e^{-\lambda_k t} e_k,
\]

confirming the eigenfunction expansion from Chapter 5 and showing that the heat semigroup is well-defined on all of \( L^2(\Omega) \), not just on \( D(A) \).

## 6.5 Analytic Semigroups

A \( C_0 \)-semigroup \( \{S(t)\}_{t \geq 0} \) is **analytic** (or **holomorphic**) if it extends to a semigroup \( \{S(z)\}_{z \in \Sigma_\delta} \) defined on a sector \( \Sigma_\delta = \{z \in \mathbb{C} : |\arg z| < \delta\} \) for some \( \delta > 0 \), with the map \( z \mapsto S(z) \) analytic in \( \Sigma_\delta \).

Analytic semigroups have dramatically better regularizing properties than general \( C_0 \)-semigroups: for any initial data \( u_0 \in X \), the solution \( u(t) = S(t) u_0 \) is in \( D(A^k) \) for all \( k \geq 1 \) and all \( t > 0 \). This instant smoothing is the hallmark of **parabolic** equations.

<div class="theorem">
<strong>Theorem 6.4 (Analytic Semigroup Generation).</strong> Let <em>A</em> be a densely defined closed operator such that the resolvent set of <em>A</em> contains a sector <em>Σ_θ = {λ ∈ ℂ : |arg λ| < π/2 + θ}</em> for some <em>θ > 0</em>, and ‖R(λ, A)‖ ≤ C/|λ| in this sector. Then <em>A</em> generates an analytic semigroup on <em>X</em>.
</div>

The canonical example is \( A = \Delta \) on \( L^2(\Omega) \); its eigenvalues are \( -\lambda_k < 0 \), so the spectrum of \( A \) lies in \( (-\infty, 0) \), the resolvent condition holds in the complement of a cone around the negative real axis, and the heat semigroup is indeed analytic.

The non-homogeneous problem \( u' = Au + f \) is solved by the **variation of parameters formula** (Duhamel's principle):

\[
u(t) = S(t) u_0 + \int_0^t S(t-s) f(s) \, ds.
\]

This formula defines a mild solution for any \( u_0 \in X \) and \( f \in L^1([0,T]; X) \), and classical solutions can be obtained under additional regularity hypotheses on \( f \) and \( u_0 \).

## 6.6 Semigroups for Hyperbolic Equations

The wave equation can be reformulated as a first-order system in the Hilbert space \( \mathcal{H} = H^1_0(\Omega) \times L^2(\Omega) \): setting \( \mathbf{u} = (u, v)^T \) with \( v = u_t \), the wave equation \( u_{tt} - \Delta u = 0 \) becomes

\[
\frac{d}{dt} \begin{pmatrix} u \\ v \end{pmatrix} = \begin{pmatrix} 0 & I \\ \Delta & 0 \end{pmatrix} \begin{pmatrix} u \\ v \end{pmatrix} = \mathcal{A} \begin{pmatrix} u \\ v \end{pmatrix}.
\]

The operator \( \mathcal{A} \) with domain \( D(\mathcal{A}) = (H^2(\Omega) \cap H^1_0(\Omega)) \times H^1_0(\Omega) \) is skew-adjoint on \( \mathcal{H} \) with respect to the energy inner product. By Stone's theorem, a skew-adjoint operator generates a unitary \( C_0 \)-group, corresponding to the conserved energy of the wave equation:

\[
E(t) = \frac{1}{2} \int_\Omega \left( |\nabla u|^2 + |u_t|^2 \right) dx = E(0).
\]

This illustrates the fundamental distinction between parabolic equations (analytic semigroups, smoothing) and hyperbolic equations (unitary groups, no smoothing, propagation of singularities).

---

# Chapter 7: Integral Equation Methods

## 7.1 Fredholm Integral Equations

Many boundary value problems for PDEs can be reformulated as integral equations. The **Fredholm integral equation of the second kind** is

\[
u(x) - \lambda \int_\Omega K(x, y) u(y) \, dy = f(x), \quad x \in \Omega,
\]

where \( K : \Omega \times \Omega \to \mathbb{R} \) is the **kernel**, \( \lambda \) is a parameter, and \( f \) is a given function. This can be written abstractly as \( (I - \lambda T) u = f \) where \( T \) is the **integral operator** with kernel \( K \).

The **Fredholm integral equation of the first kind** is

\[
\int_\Omega K(x, y) u(y) \, dy = f(x),
\]

which is inherently ill-posed (even with smooth kernels) and considerably harder to analyze than the second kind.

## 7.2 Compact Operators and the Fredholm Alternative

The key functional analytic property of integral operators with \( L^2 \) kernels is compactness.

<div class="theorem">
<strong>Theorem 7.1 (Hilbert-Schmidt Operators).</strong> If the kernel <em>K ∈ L²(Ω × Ω)</em>, then the integral operator <em>T : L²(Ω) → L²(Ω)</em> defined by <em>(Tu)(x) = ∫_Ω K(x,y) u(y) dy</em> is compact (in fact, Hilbert-Schmidt). The Hilbert-Schmidt norm is ‖T‖_{HS} = (∫∫ |K(x,y)|² dx dy)^{1/2}.
</div>

For compact operators, the **Fredholm alternative** describes the solvability theory completely.

<div class="theorem">
<strong>Theorem 7.2 (Fredholm Alternative).</strong> Let <em>T : X → X</em> be a compact operator on a Banach space <em>X</em> and let <em>λ ≠ 0</em>. Then exactly one of the following holds:
<ol>
<li>The equation <em>(I − λT)u = f</em> has a unique solution for every <em>f ∈ X</em>; or</li>
<li>The homogeneous equation <em>(I − λT)u = 0</em> has a nontrivial solution, and in this case the inhomogeneous equation has a solution if and only if <em>f</em> is orthogonal to all solutions of the adjoint homogeneous equation <em>(I − λT*)v = 0</em>.</li>
</ol>
Moreover, if case (2) holds, the null space of <em>I − λT</em> has finite dimension equal to that of <em>I − λT*</em>.
</div>

The Fredholm alternative is the infinite-dimensional analog of the fact that for a square matrix \( A \), either \( Ax = b \) has a unique solution, or the homogeneous system \( Ax = 0 \) has nontrivial solutions and the inhomogeneous system is solvable if and only if \( b \perp \ker(A^*) \).

## 7.3 The Neumann Series

When \( \|\lambda T\| < 1 \) (which holds when \( |\lambda| < 1/\|T\| \)), the operator \( I - \lambda T \) is invertible and the solution of \( (I - \lambda T) u = f \) is given by the **Neumann series**:

\[
u = (I - \lambda T)^{-1} f = \sum_{k=0}^\infty (\lambda T)^k f = f + \lambda T f + \lambda^2 T^2 f + \cdots
\]

This series converges in the operator norm. It is the analog of the geometric series \( 1/(1-x) = \sum x^k \) and provides both an explicit solution formula and an approximation algorithm (successive iterations: \( u^{(k+1)} = f + \lambda T u^{(k)} \)).

## 7.4 Boundary Integral Equations and Green's Functions

The connection between integral equations and the theory of elliptic PDEs comes through potential theory. The solution of the Poisson equation can be represented using single-layer and double-layer potentials.

For the **single-layer potential** with density \( \phi \in L^2(\partial \Omega) \),

\[
(S\phi)(x) = \int_{\partial \Omega} \Phi(x - y) \phi(y) \, dS(y), \quad x \in \mathbb{R}^n,
\]

and the **double-layer potential** with density \( \psi \in L^2(\partial \Omega) \),

\[
(D\psi)(x) = \int_{\partial \Omega} \frac{\partial \Phi}{\partial \nu_y}(x - y) \psi(y) \, dS(y), \quad x \in \mathbb{R}^n \setminus \partial \Omega,
\]

the function \( u = S\phi \) is harmonic in \( \mathbb{R}^n \setminus \partial \Omega \) and satisfies \( -\Delta u = 0 \) in the classical sense away from \( \partial \Omega \). The **jump relations** describe the behavior as \( x \to \partial \Omega \):

\[
\lim_{x \to y, x \text{ from inside}} \frac{\partial (S\phi)}{\partial \nu}(x) = \left( -\frac{1}{2} I + K^* \right) \phi(y),
\]

\[
\lim_{x \to y, x \text{ from inside}} (D\psi)(x) = \left( -\frac{1}{2} I + K \right) \psi(y),
\]

where \( K \) is the **double-layer boundary operator** \( (K\psi)(y) = \int_{\partial \Omega} (\partial \Phi / \partial \nu_z)(y - z) \psi(z) \, dS(z) \). The Dirichlet problem thus reduces to solving the boundary integral equation \( (-\frac{1}{2} I + K) \psi = g \) for the density \( \psi \), which is a Fredholm integral equation of the second kind. The Fredholm alternative guarantees unique solvability when \( \frac{1}{2} \) is not an eigenvalue of \( K \), which can be verified using the maximum principle.

---

# Chapter 8: Power Series and Asymptotic Methods

## 8.1 The Cauchy-Kovalevskaya Theorem: Formal Statement and Proof Sketch

The Cauchy-Kovalevskaya theorem in its precise form applies to the Cauchy problem for a general analytic PDE system. We state it for a single equation in normal form.

<div class="theorem">
<strong>Theorem 8.1 (Cauchy-Kovalevskaya).</strong> Consider the Cauchy problem

\[
\frac{\partial^m u}{\partial t^m} = F\!\left(x, t, \frac{\partial^\alpha u}{\partial x^\alpha \partial t^\beta} : |\alpha| + \beta \leq m, \beta < m\right),
\]

with Cauchy data <em>u(x,0) = φ₀(x)</em>, <em>∂_t u(x,0) = φ₁(x)</em>, …, <em>∂_t^{m−1} u(x,0) = φ_{m−1}(x)</em>. If <em>F</em> is real-analytic in all its arguments near the initial data, and each <em>φⱼ</em> is real-analytic near <em>x₀</em>, then there exists a unique real-analytic solution <em>u</em> in a neighborhood of <em>(x₀, 0)</em>.
</div>

**Proof sketch via the majorant method.** Without loss of generality take \( x_0 = 0 \) and \( m = 1 \). One substitutes the formal power series ansatz \( u(x, t) = \sum_{\alpha, k} c_{\alpha k} x^\alpha t^k / (\alpha! k!) \) and uses the PDE to recursively determine all coefficients from the initial data. The key step is showing that the formal series converges. One constructs a **majorant series** \( U(x, t) \) with non-negative coefficients \( C_{\alpha k} \geq |c_{\alpha k}| \), satisfying a simpler nonlinear PDE of the form

\[
\frac{\partial U}{\partial t} = \frac{M}{1 - (x_1 + \cdots + x_n + t) / R}
\]

for suitable constants \( M, R > 0 \) (the Cauchy-Kovalevskaya majorant). This ODE has an explicit analytic solution, showing the majorant series converges. Since \( 0 \leq |c_{\alpha k}| \leq C_{\alpha k} \), the original series converges absolutely in the same neighborhood.

## 8.2 Fuchsian PDEs and Regular Singular Points

The concept of **regular singular points** from the theory of linear ODEs (Frobenius method) generalizes to PDEs. A Fuchsian PDE in a domain containing the hypersurface \( \{t = 0\} \) is one of the form

\[
t^m \frac{\partial^m u}{\partial t^m} + \sum_{k=0}^{m-1} a_k(x, t) t^k \frac{\partial^k u}{\partial t^k} + \text{lower-order in } \partial_x = 0,
\]

where the coefficients \( a_k \) are analytic near \( t = 0 \) and the singularity at \( t = 0 \) is regular in the sense that the Cauchy data degenerates in a controlled way. The Fuchsian theory (Leray, Baouendi-Goulaouic) guarantees existence of singular solutions of the form \( u = t^\rho v(x, t) \) where \( \rho \) is a root of the **indicial equation** (an analog of the Frobenius exponents for ODEs) and \( v \) is analytic.

The indicial equation arises from substituting \( u = t^\rho \) into the leading-order part of the Fuchsian operator: one obtains the algebraic equation \( \rho(\rho - 1) \cdots (\rho - m + 1) + a_{m-1}(x, 0) \rho(\rho-1) \cdots (\rho-m+2) + \cdots = 0 \). The character of the solutions (convergent power series in \( t \) or logarithmic terms) depends on whether the indicial roots differ by integers, in direct analogy with the Frobenius theory.

## 8.3 Formal Power Series Solutions and Convergence

For linear PDEs with analytic coefficients, the method of undetermined coefficients produces formal power series solutions which, by the Cauchy-Kovalevskaya theorem, converge in some neighborhood of the initial surface. For equations with singular behavior, such as equations degenerating on a boundary, the formal series may diverge but still carry asymptotic information.

The **Borel summation** and related methods allow one to extract actual solutions from divergent formal series in certain cases. For the heat equation \( u_t = u_{xx} \) with formal power series data \( u(0, t) = \sum a_n t^n \) at \( x = 0 \), the formal solution \( u(x, t) = \sum_n a_n \sum_{k=0}^{\lfloor n/2 \rfloor} \binom{n}{2k} (2k)! x^{n-2k} t^{n-2k} / (2^k k! n!) \cdots \) generally diverges, but can be Borel summed to recover an actual solution under appropriate growth conditions on the coefficients \( a_n \).

## 8.4 WKB and Asymptotic Methods for Singular Perturbations

The **WKB (Wentzel-Kramers-Brillouin) method** provides asymptotic approximations to solutions of PDEs containing a small parameter \( \varepsilon \to 0 \). The paradigmatic example is the singularly perturbed elliptic equation

\[
\varepsilon^2 \Delta u - V(x) u = 0 \text{ in } \Omega,
\]

or equivalently (after substitution \( V = -\lambda \)) the **Helmholtz equation** \( \Delta u + (\lambda / \varepsilon^2) u = 0 \) at high frequency. The WKB ansatz is

\[
u^\varepsilon(x) \sim e^{i S(x)/\varepsilon} \left( a_0(x) + \varepsilon a_1(x) + \varepsilon^2 a_2(x) + \cdots \right) \quad \text{as } \varepsilon \to 0,
\]

where \( S \) is the **phase** and \( a_j \) are **amplitude coefficients**. Substituting into the equation and collecting powers of \( \varepsilon \):

- **Order \( \varepsilon^{-2} \):** The **eikonal equation** for the phase:

\[
|\nabla S|^2 = V(x).
\]

- **Order \( \varepsilon^{-1} \):** The **transport equation** for the leading amplitude:

\[
2 \nabla S \cdot \nabla a_0 + a_0 \Delta S = 0.
\]

- **Order \( \varepsilon^{k-2} \):** For \( k \geq 2 \), a transport equation for \( a_k \) with source terms depending on \( a_0, \ldots, a_{k-1} \).

The eikonal equation is solved by the method of characteristics (the ray equations from Chapter 2), and the transport equation for \( a_0 \) determines the amplitude along each ray. The transport equation can be written as a conservation law along rays: if \( J \) is the Jacobian of the ray map (the divergence of the ray bundle), then \( a_0 = C / \sqrt{J} \) for a constant \( C \) determined by initial conditions. When rays **focus** (the Jacobian \( J \to 0 \)), the WKB approximation breaks down and a more refined analysis using **Airy functions** or **Maslov theory** is required.

For the heat equation \( \varepsilon u_t = \varepsilon^2 \Delta u - V(x) u \) in the parabolic scaling, the WKB method connects to the theory of **large deviations** in probability and yields the **heat kernel asymptotics**

\[
K(x, y, t) \sim \frac{1}{(4\pi \varepsilon t)^{n/2}} \exp\!\left( -\frac{d(x,y)^2}{4\varepsilon t} \right) \left( 1 + O(\varepsilon) \right)
\]

as \( \varepsilon \to 0 \), where \( d(x, y) \) is the geodesic distance in the Riemannian metric defined by the inverse of the diffusion tensor. This connects the asymptotic analysis of PDEs with differential geometry.

---

# Chapter 9: Variational Principles and Additional Topics

## 9.1 Variational Formulation of Elliptic Problems

The connection between elliptic PDEs and the calculus of variations is fundamental and historically predates the modern functional analytic approach. The Dirichlet problem \( -\Delta u = f \) with zero boundary conditions is the Euler-Lagrange equation for the **Dirichlet energy functional**

\[
J[v] = \frac{1}{2} \int_\Omega |\nabla v|^2 \, dx - \int_\Omega f v \, dx, \quad v \in H^1_0(\Omega).
\]

The weak solution is precisely the minimizer of \( J \) over \( H^1_0(\Omega) \): one computes the first variation

\[
\frac{d}{d\tau} J[v + \tau \phi] \bigg|_{\tau=0} = \int_\Omega \nabla v \cdot \nabla \phi \, dx - \int_\Omega f \phi \, dx = 0 \quad \forall \phi \in H^1_0(\Omega),
\]

which is exactly the weak form of the PDE. The existence of a minimizer follows from the **direct method of the calculus of variations**: the functional \( J \) is coercive (by the Poincaré inequality) and weakly lower semicontinuous (since the \( L^2 \) norm is weakly lower semicontinuous), so any minimizing sequence has a weakly convergent subsequence in \( H^1_0(\Omega) \) and the limit is the minimizer.

<div class="theorem">
<strong>Theorem 9.1 (Existence of Minimizers).</strong> Let <em>J : H → ℝ</em> be a functional on a reflexive Banach space <em>H</em> that is coercive (J(u) → ∞ as ‖u‖ → ∞) and weakly lower semicontinuous. Then <em>J</em> attains its minimum.
</div>

<div class="proof">
<strong>Proof.</strong> Let <em>m = inf_{u ∈ H} J(u)</em> and let <em>{uₖ}</em> be a minimizing sequence: <em>J(uₖ) → m</em>. Coercivity implies <em>{uₖ}</em> is bounded in <em>H</em>. Since <em>H</em> is reflexive, by Alaoglu's theorem there is a subsequence <em>uₖⱼ ⇀ u*</em> weakly in <em>H</em>. By weak lower semicontinuity, <em>J(u*) ≤ lim inf J(uₖⱼ) = m</em>. Since <em>m</em> is the infimum, <em>J(u*) = m</em>.
</div>

## 9.2 Eigenvalue Variational Characterization

The eigenvalues of the Dirichlet-Laplacian admit elegant variational characterizations. The **Rayleigh quotient** of a function \( v \in H^1_0(\Omega) \setminus \{0\} \) is

\[
R[v] = \frac{\int_\Omega |\nabla v|^2 \, dx}{\int_\Omega |v|^2 \, dx}.
\]

The first eigenvalue is \( \lambda_1 = \min_{v \in H^1_0 \setminus \{0\}} R[v] \), and the minimizer is the first eigenfunction \( e_1 \). More generally, the **min-max principle (Courant-Fischer)**:

\[
\lambda_k = \min_{\substack{V \subseteq H^1_0 \\ \dim V = k}} \max_{v \in V \setminus \{0\}} R[v],
\]

expresses the \( k \)-th eigenvalue as the minimum over all \( k \)-dimensional subspaces of the maximum Rayleigh quotient. This characterization is extremely useful for estimating eigenvalues and for proving **domain monotonicity**: if \( \Omega_1 \subseteq \Omega_2 \), then \( \lambda_k(\Omega_1) \geq \lambda_k(\Omega_2) \) (larger domain, smaller eigenvalues), since \( H^1_0(\Omega_1) \subseteq H^1_0(\Omega_2) \).

## 9.3 The Rellich-Kondrachov Compactness Theorem

The compactness of the embedding \( H^1(\Omega) \hookrightarrow L^2(\Omega) \) is a critical ingredient in the spectral theory and the proof of the Fredholm alternative for elliptic operators.

<div class="theorem">
<strong>Theorem 9.2 (Rellich-Kondrachov).</strong> Let <em>Ω ⊂ ℝⁿ</em> be a bounded open set with Lipschitz boundary. The embedding <em>H¹(Ω) ↪ L²(Ω)</em> is compact: every bounded sequence in <em>H¹(Ω)</em> has a subsequence converging in <em>L²(Ω)</em>.
</div>

The proof uses the Fréchet-Kolmogorov criterion for compactness in \( L^p \) spaces, combined with the Sobolev embedding estimate. The Rellich-Kondrachov theorem ensures that the resolvent of the Dirichlet-Laplacian (and more generally of any strongly elliptic operator with bounded resolvent on \( L^2 \)) is compact, which then implies the spectral theorem with discrete spectrum accumulating only at \( +\infty \).

## 9.4 Connections Between Potential Theory and Integral Equations

The study of the Dirichlet and Neumann problems via potential theory leads naturally to integral equations of the second kind on the boundary. This connection, systematically developed in the late nineteenth century by Fredholm himself, motivated the abstract theory of compact operators and the Fredholm alternative.

For a \( C^2 \) domain \( \Omega \) and the exterior Dirichlet problem (find harmonic \( u \) in \( \mathbb{R}^n \setminus \overline{\Omega} \) with \( u = g \) on \( \partial \Omega \) and \( u \to 0 \) at infinity), the double-layer potential ansatz \( u = D\psi \) leads to the integral equation

\[
\frac{1}{2} \psi(x) + \int_{\partial \Omega} \frac{\partial \Phi}{\partial \nu_y}(x - y) \psi(y) \, dS(y) = g(x), \quad x \in \partial \Omega.
\]

This is a Fredholm equation of the second kind with compact kernel (the kernel \( \partial \Phi / \partial \nu_y \) is in \( L^2(\partial \Omega \times \partial \Omega) \) for \( C^2 \) domains). The Fredholm alternative guarantees unique solvability of the exterior Dirichlet problem, and the maximum principle shows the homogeneous equation has only the trivial solution.

The interior Neumann problem (find harmonic \( u \) in \( \Omega \) with \( \partial u / \partial \nu = h \) on \( \partial \Omega \)) leads to the single-layer potential and a Fredholm integral equation of the second kind for the density, where the solvability condition \( \int_{\partial \Omega} h \, dS = 0 \) (Gauss's law) corresponds to the Fredholm compatibility condition.

## 9.5 Summary: Well-Posedness Across PDE Types

The theory developed in these notes can be summarized in terms of the appropriate function spaces and problem formulations for each PDE type:

For **elliptic equations**, the natural setting is the Sobolev space \( H^1_0(\Omega) \) for the Dirichlet problem. The Lax-Milgram theorem guarantees a unique weak solution which, by elliptic regularity, becomes smooth when the data and domain are smooth. The Fredholm alternative governs solvability at eigenvalues.

For **parabolic equations**, the natural setting is the parabolic Sobolev space \( L^2([0,T]; H^1_0(\Omega)) \cap H^1([0,T]; H^{-1}(\Omega)) \). The abstract framework of \( C_0 \)-semigroups provides both existence and the smoothing property: initial data in \( L^2 \) immediately becomes smooth for \( t > 0 \).

For **hyperbolic equations**, the natural setting for the wave equation is the energy space \( H^1_0(\Omega) \times L^2(\Omega) \). The \( C_0 \)-group generated by the skew-adjoint wave operator preserves the energy norm, giving conservation of energy rather than dissipation. The Lax entropy conditions and Rankine-Hugoniot conditions govern weak solutions after shock formation.

The unifying thread through all these topics is the principle that the correct notion of solution (classical, weak, mild, viscosity) and the correct function space depend intimately on the type of equation, and that the choice of framework determines both the existence theory and the regularity theory. This perspective, which frames PDE theory as the study of operators between function spaces, is the central conceptual contribution of twentieth-century analysis to the subject.

---

# Appendix: Background on Functional Analysis

## A.1 Sobolev Spaces: Key Definitions and Properties

For \( k \geq 0 \) and \( 1 \leq p \leq \infty \), the **Sobolev space** \( W^{k,p}(\Omega) \) consists of functions whose distributional derivatives up to order \( k \) belong to \( L^p(\Omega) \):

\[
W^{k,p}(\Omega) = \left\{ u \in L^p(\Omega) : D^\alpha u \in L^p(\Omega) \text{ for all } |\alpha| \leq k \right\},
\]

with norm \( \|u\|_{W^{k,p}} = \left( \sum_{|\alpha| \leq k} \|D^\alpha u\|_{L^p}^p \right)^{1/p} \). The Hilbert space case \( p = 2 \) gives \( H^k(\Omega) = W^{k,2}(\Omega) \).

The **Sobolev embedding theorem** relates different Sobolev spaces and controls \( L^q \) or \( C^{k,\alpha} \) regularity in terms of \( W^{k,p} \) membership:

\[
W^{k,p}(\mathbb{R}^n) \hookrightarrow L^{p^*}(\mathbb{R}^n), \quad \frac{1}{p^*} = \frac{1}{p} - \frac{k}{n} \quad (kp < n),
\]

\[
W^{k,p}(\mathbb{R}^n) \hookrightarrow C^{0,\alpha}(\mathbb{R}^n), \quad \alpha = k - \frac{n}{p} \quad (kp > n).
\]

The critical exponent \( p^* = np/(n - kp) \) (Sobolev exponent) plays a fundamental role in the calculus of variations and the study of critical phenomena.

## A.2 Distributions and Weak Derivatives

A **distribution** on an open set \( \Omega \subseteq \mathbb{R}^n \) is a continuous linear functional on the test function space \( \mathcal{D}(\Omega) = C^\infty_c(\Omega) \). Every locally integrable function \( f \) defines a distribution via \( \langle f, \phi \rangle = \int_\Omega f \phi \, dx \). The **distributional derivative** \( D^\alpha T \) of a distribution \( T \) is defined by

\[
\langle D^\alpha T, \phi \rangle = (-1)^{|\alpha|} \langle T, D^\alpha \phi \rangle, \quad \phi \in \mathcal{D}(\Omega).
\]

This extends differentiation to functions that are not classically differentiable. The **weak derivative** \( D^\alpha u \in L^p(\Omega) \) exists when this distributional derivative is represented by an \( L^p \) function; Sobolev spaces are precisely the spaces where weak derivatives up to a specified order exist in \( L^p \).

The Dirac delta \( \delta_x \) (the distribution evaluating at \( x \)) satisfies \( \langle \delta_x, \phi \rangle = \phi(x) \) and appears in the fundamental solution: \( -\Delta \Phi = \delta_0 \) holds in the distributional sense, verified by integration against test functions using the divergence theorem on \( \mathbb{R}^n \setminus B(0, \varepsilon) \) and passing \( \varepsilon \to 0 \).

## A.3 The Lax-Milgram Theorem: Proof

We provide a complete proof of the Lax-Milgram theorem, as it is foundational.

<div class="proof">
<strong>Proof of Theorem 4.3.</strong> For each fixed <em>u ∈ H</em>, the map <em>v ↦ B(u, v)</em> is a bounded linear functional on <em>H</em>. By the Riesz representation theorem, there exists a unique element <em>Au ∈ H</em> such that <em>B(u, v) = ⟨Au, v⟩</em> for all <em>v ∈ H</em>. The map <em>u ↦ Au</em> is linear and bounded: ‖Au‖ = sup_{‖v‖≤1} |B(u,v)| ≤ M‖u‖. By coercivity, α‖u‖² ≤ B(u,u) = ⟨Au, u⟩ ≤ ‖Au‖‖u‖, so α‖u‖ ≤ ‖Au‖, showing <em>A</em> is injective with closed range. Since <em>B</em> is not assumed symmetric, we use coercivity of the adjoint: for any <em>w</em> orthogonal to the range of <em>A</em>, <em>0 = ⟨Au, w⟩ = B(u, w)</em> for all <em>u</em>. Setting <em>u = w</em>: <em>0 = B(w, w) ≥ α‖w‖²</em>, so <em>w = 0</em>. Thus <em>A</em> has dense range, hence surjective. The equation <em>B(u, v) = F(v)</em> for all <em>v</em> becomes <em>⟨Au, v⟩ = F(v)</em> for all <em>v</em>, which by Riesz gives <em>Au = f_F</em> where <em>F(v) = ⟨f_F, v⟩</em>. Since <em>A</em> is bijective, <em>u = A⁻¹ f_F</em> exists uniquely.
</div>

This proof is constructive: it reduces the existence of a PDE solution to the invertibility of a bounded operator between Hilbert spaces, leveraging the full power of the Hilbert space structure via the Riesz representation theorem.
