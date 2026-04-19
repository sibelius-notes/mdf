---
title: "AMATH 741: Numerical Solution of Partial Differential Equations"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly accessible references:

- Morton, K. W. and Mayers, D. F., *Numerical Solution of Partial Differential Equations*, 2nd ed. Cambridge University Press, 2005.
- Thomas, J. W., *Numerical Partial Differential Equations: Finite Difference Methods*, Springer, 2004.
- Iserles, A., *A First Course in the Numerical Analysis of Differential Equations*, 2nd ed. Cambridge University Press, 2009.
- LeVeque, R. J., *Finite Volume Methods for Hyperbolic Problems*, Cambridge University Press, 2002.
- Hesthaven, J. S., *Numerical Methods for Conservation Laws: From Analysis to Algorithms*, SIAM, 2018.
- Brenner, S. C. and Scott, L. R., *The Mathematical Theory of Finite Element Methods*, 3rd ed. Springer, 2008.
- Braess, D., *Finite Elements: Theory, Fast Solvers, and Applications in Solid Mechanics*, 3rd ed. Cambridge University Press.
- MIT OCW 18.336, *Numerical Methods for Partial Differential Equations* (publicly available at ocw.mit.edu).

---

# Chapter 1: Introduction and Classification of Partial Differential Equations

## The Role of Numerical Methods

Partial differential equations (PDEs) are the mathematical language of classical physics, engineering, and much of modern applied mathematics. The gravitational potential obeys Laplace's equation, diffusion of heat follows the heat equation, and the propagation of sound and electromagnetic waves is governed by the wave equation. In most practical settings, exact analytical solutions are unavailable: the geometry is complicated, the coefficients are spatially varying, or the nonlinearities preclude closed-form integration. Numerical methods for PDEs therefore occupy a central position in computational science, and the three principal methodologies — **finite difference methods (FDM)**, **finite volume methods (FVM)**, and **finite element methods (FEM)** — each offer different trade-offs between geometric flexibility, conservation properties, and mathematical elegance.

## Classification of Second-Order PDEs

A general second-order linear PDE in two independent variables \(x\) and \(y\) takes the form

\[
A u_{xx} + 2B u_{xy} + C u_{yy} + D u_x + E u_y + F u = G,
\]

where the coefficients \(A, B, C, D, E, F, G\) may depend on \(x\) and \(y\). The **discriminant** \(\Delta = B^2 - AC\) classifies the equation:

- If \(\Delta < 0\), the equation is **elliptic**. Laplace's equation \(\Delta u = 0\) and Poisson's equation \(\Delta u = f\) are the canonical examples.
- If \(\Delta = 0\), the equation is **parabolic**. The heat equation \(u_t = \kappa u_{xx}\) falls in this class.
- If \(\Delta > 0\), the equation is **hyperbolic**. The wave equation \(u_{tt} = c^2 u_{xx}\) is the standard example.

This classification is not merely taxonomic. Each class has fundamentally different solution behaviour, requires different types of boundary and initial conditions for well-posedness, and demands distinct numerical treatments.

**Elliptic equations** are associated with steady-state phenomena. Solutions are infinitely smooth if the data are smooth, and boundary conditions must be prescribed on the entire boundary of the domain. The maximum principle holds: solutions attain their extrema on the boundary.

**Parabolic equations** describe diffusion and smoothing processes evolving in time. An initial condition specifies the state at \(t = 0\), and boundary conditions are imposed on the spatial boundary for all \(t > 0\). Solutions become smoother for \(t > 0\) even if the initial data are rough.

**Hyperbolic equations** model wave propagation and transport phenomena. They possess finite domains of dependence and influence, governed by **characteristics**. Discontinuities in the initial data can persist in the solution and even form from smooth data in nonlinear problems.

## Well-Posedness

A problem is **well-posed** in the sense of Hadamard if: (i) a solution exists, (ii) the solution is unique, and (iii) the solution depends continuously on the data. Numerical methods can only hope to approximate the solution of a well-posed problem. Ill-posed problems, such as backward heat conduction, are inherently unstable and require regularisation before meaningful computation is possible.

For the Poisson equation \(-\Delta u = f\) on a bounded domain \(\Omega \subset \mathbb{R}^d\) with Dirichlet boundary condition \(u = g\) on \(\partial\Omega\), existence and uniqueness are guaranteed by the Lax-Milgram theorem provided \(f \in L^2(\Omega)\) and \(g\) is sufficiently regular. The heat equation with \(u(x, 0) = u_0(x)\) and homogeneous Dirichlet conditions is well-posed in the forward time direction.

## The Model Problems

Four model problems recur throughout the analysis of numerical methods.

**The Poisson equation** in \(d\) dimensions:

\[
-\Delta u = -\sum_{i=1}^d \frac{\partial^2 u}{\partial x_i^2} = f \quad \text{in } \Omega, \qquad u = g \quad \text{on } \partial\Omega.
\]

This is the prototype elliptic problem and arises in electrostatics, gravitational potential theory, steady heat conduction, and incompressible fluid mechanics.

**The heat equation** (diffusion equation):

\[
u_t = \kappa \Delta u + f, \qquad (x, t) \in \Omega \times (0, T),
\]

with initial condition \(u(x, 0) = u_0(x)\) and appropriate boundary conditions. Here \(\kappa > 0\) is the diffusion coefficient.

**The wave equation**:

\[
u_{tt} = c^2 \Delta u, \qquad c > 0.
\]

**The scalar advection equation**:

\[
u_t + a u_x = 0, \qquad a \in \mathbb{R},
\]

whose exact solution is \(u(x, t) = u_0(x - at)\), a pure rightward shift at speed \(a\). This seemingly simple equation is a formidable test of numerical methods, as it exposes the competing pathologies of numerical dissipation and dispersion.

---

# Chapter 2: Finite Difference Methods

## Derivation via Taylor Series

The most transparent approach to constructing finite difference approximations is through Taylor series. Suppose \(u\) is a sufficiently smooth function of a single variable \(x\), and we introduce a uniform mesh with spacing \(h > 0\) so that \(x_j = x_0 + jh\). Let \(U_j = u(x_j)\) denote the exact solution at mesh points.

Taylor expanding about \(x_j\):

\[
u(x_j + h) = u(x_j) + h u'(x_j) + \frac{h^2}{2} u''(x_j) + \frac{h^3}{6} u'''(x_j) + O(h^4).
\]

Rearranging immediately gives the **forward difference** approximation:

\[
u'(x_j) = \frac{u(x_j + h) - u(x_j)}{h} - \frac{h}{2} u''(x_j) + O(h^2) = \frac{U_{j+1} - U_j}{h} + O(h).
\]

The term \(-\frac{h}{2} u''\) is the leading **truncation error**; the approximation is first-order accurate. Similarly, the **backward difference**:

\[
u'(x_j) = \frac{U_j - U_{j-1}}{h} + O(h).
\]

Subtracting the Taylor expansion at \(x_j - h\) from that at \(x_j + h\) yields the **centered difference**:

\[
u'(x_j) = \frac{U_{j+1} - U_{j-1}}{2h} + O(h^2),
\]

which achieves second-order accuracy because the \(h\) terms cancel by symmetry. Adding the two expansions gives the **second-order centered difference for the second derivative**:

\[
u''(x_j) = \frac{U_{j+1} - 2U_j + U_{j-1}}{h^2} + O(h^2).
\]

This three-point stencil is the workhorse of finite difference methods for diffusion and elliptic problems.

## Method of Undetermined Coefficients

A more systematic approach constructs finite difference formulas of prescribed accuracy. To approximate \(u'(x_j)\) using a stencil \(\{U_{j-1}, U_j, U_{j+1}\}\), write

\[
D_h u(x_j) = \alpha U_{j-1} + \beta U_j + \gamma U_{j+1}
\]

and require that the formula be exact for polynomials of degree up to \(p\). Substituting the Taylor expansions and collecting powers of \(h\):

\[
\alpha + \beta + \gamma = 0, \quad -\alpha + \gamma = \frac{1}{h}, \quad \alpha + \gamma = 0.
\]

Solving: \(\alpha = -1/(2h)\), \(\beta = 0\), \(\gamma = 1/(2h)\), recovering the centered formula. This method generalises straightforwardly to higher-order stencils and to derivatives of any order.

## Truncation Error

<div class="definition">
<strong>Truncation Error.</strong> For a finite difference operator \(L_h\) approximating a differential operator \(L\), the <em>local truncation error</em> \(\tau_h\) at a mesh point is defined by

\[
\tau_h = L_h u - L u,
\]

where \(u\) is the exact solution. The method is said to be <em>consistent of order \(p\)</em> if \(\|\tau_h\| \to 0\) as \(h \to 0\), and more specifically if \(\|\tau_h\| = O(h^p)\).
</div>

Consistency alone does not guarantee that the numerical solution converges to the exact solution; we also require stability.

## The Lax Equivalence Theorem

<div class="theorem">
<strong>Lax Equivalence Theorem.</strong> For a well-posed linear initial value problem and a consistent finite difference approximation, <em>stability</em> is the necessary and sufficient condition for <em>convergence</em>.
</div>

<div class="proof">
The proof proceeds as follows. Let \(e_h = U_h - u_h\) be the error, where \(U_h\) is the numerical solution and \(u_h\) is the restriction of the exact solution to the mesh. The error satisfies \(L_h e_h = -\tau_h\), so \(e_h = -L_h^{-1} \tau_h\). If the method is stable — meaning \(\|L_h^{-1}\| \leq C\) uniformly in \(h\) — then

\[
\|e_h\| \leq C \|\tau_h\| \to 0 \quad \text{as } h \to 0,
\]

establishing convergence. Conversely, convergence for all consistent problems can be shown to imply stability by a functional-analytic argument.
</div>

The theorem is fundamental: it reduces the analysis of convergence to the verification of consistency (a straightforward Taylor series calculation) and stability (which requires more work).

## Finite Difference Discretization of the Poisson Equation in 2D

On the unit square \(\Omega = (0,1)^2\), the Poisson equation is \(-\Delta u = f\) with \(u = 0\) on \(\partial\Omega\). Introduce a uniform mesh with \(N+1\) points in each direction, spacing \(h = 1/(N+1)\), with interior points \((x_i, y_j) = (ih, jh)\) for \(1 \leq i, j \leq N\).

Replacing each second derivative by the centered difference gives the **five-point Laplacian**:

\[
-\frac{U_{i+1,j} - 2U_{i,j} + U_{i-1,j}}{h^2} - \frac{U_{i,j+1} - 2U_{i,j} + U_{i,j-1}}{h^2} = f_{i,j}.
\]

This stencil involves five grid points and achieves \(O(h^2)\) truncation error. The resulting linear system has the form \(A\mathbf{U} = \mathbf{f}\), where \(A\) is the \(N^2 \times N^2\) matrix arising from the tensor product structure. Specifically, if \(T\) is the \(N \times N\) tridiagonal matrix with \(-2\) on the diagonal and \(1\) on the super- and sub-diagonals, then

\[
A = \frac{1}{h^2}\left(T \otimes I + I \otimes T\right),
\]

where \(I\) is the \(N \times N\) identity. This matrix is symmetric, positive definite, and sparse (at most five non-zeros per row), making it amenable to efficient iterative solvers.

**Boundary conditions** enter naturally. For homogeneous Dirichlet conditions, boundary values are zero and do not appear as unknowns. For non-homogeneous Dirichlet conditions \(u = g\) on \(\partial\Omega\), the known boundary values are moved to the right-hand side. For **Neumann conditions** \(\partial u / \partial n = g_N\) on part of the boundary, a standard approach uses a **ghost point** outside the domain to approximate the normal derivative: if the boundary is at \(x = 0\) and the normal derivative is approximated by the centered difference \((U_1 - U_{-1})/(2h) = g_N\), then the ghost value \(U_{-1} = U_1 - 2h g_N\) can be substituted into the interior equation at \(j=1\).

## The Heat Equation: Time Discretization

Consider the one-dimensional heat equation \(u_t = \kappa u_{xx}\) on \([0,1]\) with homogeneous Dirichlet boundary conditions. Let \(U_j^n\) approximate \(u(x_j, t^n)\) with spatial step \(h\) and time step \(\Delta t\).

**Explicit Euler (Forward Euler in time):**

\[
\frac{U_j^{n+1} - U_j^n}{\Delta t} = \kappa \frac{U_{j+1}^n - 2U_j^n + U_{j-1}^n}{h^2}.
\]

This is explicit: given the solution at time \(t^n\), each \(U_j^{n+1}\) is computed independently. The **mesh ratio** \(r = \kappa \Delta t / h^2\) governs stability. Von Neumann analysis (detailed in Chapter 3) shows the method is stable if and only if \(r \leq 1/2\).

**Implicit Euler (Backward Euler in time):**

\[
\frac{U_j^{n+1} - U_j^n}{\Delta t} = \kappa \frac{U_{j+1}^{n+1} - 2U_j^{n+1} + U_{j-1}^{n+1}}{h^2}.
\]

Here the right-hand side is evaluated at the new time level \(t^{n+1}\), leading to a tridiagonal linear system at each time step. Implicit Euler is unconditionally stable for any \(r > 0\), but is only first-order accurate in time. This unconditional stability makes it attractive for diffusion problems where the spatial step is dictated by accuracy requirements rather than stability, potentially allowing large time steps.

**Crank-Nicolson:**

\[
\frac{U_j^{n+1} - U_j^n}{\Delta t} = \frac{\kappa}{2}\left(\frac{U_{j+1}^n - 2U_j^n + U_{j-1}^n}{h^2} + \frac{U_{j+1}^{n+1} - 2U_j^{n+1} + U_{j-1}^{n+1}}{h^2}\right).
\]

Crank-Nicolson averages the explicit and implicit Euler spatial operators, achieving \(O(\Delta t^2)\) accuracy in time and \(O(h^2)\) in space. It is also unconditionally stable. This second-order accuracy in both time and space makes it the standard choice for parabolic problems.

## The Advection Equation: Upwind, Lax-Friedrichs, and Lax-Wendroff

The scalar advection equation \(u_t + a u_x = 0\) with \(a > 0\) and periodic boundary conditions requires special care because numerical schemes can introduce spurious oscillations (dispersion) or excessive damping (dissipation).

**Upwind scheme:**

\[
\frac{U_j^{n+1} - U_j^n}{\Delta t} + a \frac{U_j^n - U_{j-1}^n}{h} = 0.
\]

The backward spatial difference is used for \(a > 0\) because information propagates from left to right. The truncation error is \(O(\Delta t, h)\), and von Neumann analysis shows stability requires the **CFL condition** \(\nu = a \Delta t / h \leq 1\), where \(\nu\) is the **Courant number**. The upwind scheme introduces numerical dissipation proportional to \(ah/2\), which smooths the solution.

**Lax-Friedrichs scheme:**

\[
U_j^{n+1} = \frac{1}{2}(U_{j+1}^n + U_{j-1}^n) - \frac{\nu}{2}(U_{j+1}^n - U_{j-1}^n).
\]

This can be written as a centered-in-space scheme where the \(U_j^n\) term is replaced by the average of its neighbours. Stable under \(|\nu| \leq 1\), but first-order accurate and highly dissipative.

**Lax-Wendroff scheme:**

\[
U_j^{n+1} = U_j^n - \frac{\nu}{2}(U_{j+1}^n - U_{j-1}^n) + \frac{\nu^2}{2}(U_{j+1}^n - 2U_j^n + U_{j-1}^n).
\]

This derives from a Taylor expansion \(u^{n+1} = u^n + \Delta t u_t + \frac{\Delta t^2}{2} u_{tt} + \ldots\), replacing \(u_t = -a u_x\) and \(u_{tt} = a^2 u_{xx}\). The result is second-order accurate in both space and time, stable under \(|\nu| \leq 1\), but exhibits dispersive oscillations near discontinuities.

---

# Chapter 3: Stability Analysis

## Von Neumann Stability Analysis

Von Neumann stability analysis applies to linear finite difference schemes with **constant coefficients** on a uniform periodic mesh. The key insight is that Fourier modes are eigenfunctions of the translation operators appearing in finite difference stencils.

Suppose \(U_j^n\) satisfies a linear finite difference scheme. Substitute the ansatz \(U_j^n = g^n e^{i\xi j h}\), where \(\xi\) is a spatial frequency (wavenumber) and \(g = g(\xi)\) is the **amplification factor**. Stability requires that \(|g(\xi)| \leq 1\) for all \(\xi \in [-\pi/h, \pi/h]\) (or, for multiple time steps, the spectral radius condition).

**Application to the heat equation (explicit Euler):**

Substituting \(U_j^n = g^n e^{i\xi j h}\) into the explicit scheme and dividing by \(g^n e^{i\xi j h}\):

\[
g = 1 + r(e^{i\xi h} - 2 + e^{-i\xi h}) = 1 + r \cdot 2(\cos(\xi h) - 1) = 1 - 4r\sin^2\left(\frac{\xi h}{2}\right).
\]

The maximum of \(|g|\) occurs at \(\xi h = \pi\) (the highest frequency), giving \(|g|_{\max} = |1 - 4r|\). Stability requires \(|1 - 4r| \leq 1\), which yields \(0 \leq r \leq 1/2\), confirming the earlier condition.

**Application to implicit Euler:**

\[
g = \frac{1}{1 + 4r\sin^2(\xi h/2)} \leq 1 \quad \text{for all } r > 0.
\]

Unconditional stability follows immediately.

**Application to Crank-Nicolson:**

\[
g = \frac{1 - 2r\sin^2(\xi h/2)}{1 + 2r\sin^2(\xi h/2)}.
\]

Since \(|g| < 1\) for all \(r > 0\), Crank-Nicolson is unconditionally stable. Moreover, \(|g| \leq 1\) with equality only when \(r = 0\) or \(\xi h = 0\), so the scheme has excellent damping properties for high frequencies while preserving low frequencies accurately.

## The CFL Condition

The **Courant-Friedrichs-Lewy (CFL) condition** is a necessary condition for convergence of explicit finite difference schemes for hyperbolic equations. It states that the numerical domain of dependence must contain the analytical domain of dependence.

<div class="theorem">
<strong>CFL Condition.</strong> For the advection equation \(u_t + a u_x = 0\), the numerical domain of dependence of a scheme must include the point \(x - a\Delta t\) (the characteristic foot). For an explicit scheme that uses spatial stencil points within distance \(ph\) of \(x_j\), this requires

\[
\left|\frac{a \Delta t}{h}\right| = |\nu| \leq p.
\]

For the upwind, Lax-Friedrichs, and Lax-Wendroff schemes, this yields \(|\nu| \leq 1\).
</div>

The CFL condition is necessary but not sufficient for stability. It constrains the time step relative to the spatial step as \(\Delta t \leq h/|a|\), which for explicit schemes on fine meshes can impose severe computational constraints.

## The Matrix Method and Spectral Radius

For finite difference schemes applied to initial-boundary value problems (where periodicity is not available), the von Neumann analysis does not directly apply. The **matrix method** provides an alternative. The scheme can be written as \(\mathbf{U}^{n+1} = B \mathbf{U}^n\), and stability (in the \(\ell^2\) norm) requires that \(\|B^n\|\) remains bounded. A sufficient condition is \(\rho(B) \leq 1\), where \(\rho(B)\) is the spectral radius, though for non-normal matrices this must be handled with care using **Kreiss matrix theorem**.

## Numerical Dissipation and Dispersion

To understand the qualitative behaviour of finite difference approximations to hyperbolic equations, one examines how they modify the phase speed and amplitude of Fourier modes. The exact solution of \(u_t + a u_x = 0\) propagates the mode \(e^{i(\xi x - a\xi t)}\) without change in amplitude or phase speed.

**Modified equation analysis** expands the truncation error in Fourier space to reveal the effective equation being solved. For the upwind scheme with \(\nu = a\Delta t/h\), the modified equation is approximately

\[
u_t + a u_x = \frac{ah}{2}(1 - \nu) u_{xx} - \frac{ah^2}{6}(1 - \nu)(1 - 2\nu) u_{xxx} + O(h^3).
\]

The first correction term is a **diffusion** term with coefficient \(\frac{ah}{2}(1-\nu) > 0\), causing **numerical dissipation** that damps short-wavelength modes. The second correction is a **dispersion** term causing different wavelengths to propagate at different speeds.

For Lax-Wendroff, the leading error term is pure dispersion (no diffusion), explaining why it produces oscillatory artefacts near discontinuities while being more accurate for smooth solutions.

## Maximum Principle for Discrete Operators

<div class="theorem">
<strong>Discrete Maximum Principle.</strong> The five-point finite difference operator for the Poisson equation satisfies a discrete maximum principle: if \(L_h U_{i,j} \geq 0\) at all interior points, then the maximum of \(U\) over the interior is attained on the boundary.
</div>

This follows from the observation that the five-point Laplacian has non-positive off-diagonal entries and positive diagonal entries, making the associated matrix an M-matrix. The maximum principle ensures monotone behaviour of the numerical solution and provides a stability estimate independent of Fourier analysis.

---

# Chapter 4: Finite Volume Methods for Hyperbolic Problems

## Conservation Laws and Their Integral Form

Many physical laws are statements of conservation: in any control volume, the rate of change of a quantity equals the net flux through the boundary plus any source terms. The fundamental form is

\[
\frac{d}{dt} \int_{V} u \, dV + \oint_{\partial V} \mathbf{F}(u) \cdot \hat{n} \, dS = \int_V s \, dV,
\]

where \(u\) is the conserved quantity per unit volume, \(\mathbf{F}(u)\) is the flux function, and \(s\) is a source. In one space dimension with \(V = [x_{i-1/2}, x_{i+1/2}]\) and no source, the integral conservation law is

\[
\frac{d}{dt} \int_{x_{i-1/2}}^{x_{i+1/2}} u \, dx + f(u(x_{i+1/2}, t)) - f(u(x_{i-1/2}, t)) = 0,
\]

where \(f(u)\) is the scalar flux. This motivates the definition of the **cell average**:

\[
\bar{U}_i^n = \frac{1}{\Delta x} \int_{x_{i-1/2}}^{x_{i+1/2}} u(x, t^n) \, dx,
\]

which the finite volume method evolves in time. The key advantage of this approach is that it automatically preserves conservation: the integral form is used directly, rather than the differential form, which may not be satisfied by weak solutions (solutions containing shocks).

## Cell Averages and Numerical Flux

A general explicit finite volume scheme for the conservation law \(u_t + f(u)_x = 0\) takes the form

\[
\bar{U}_i^{n+1} = \bar{U}_i^n - \frac{\Delta t}{\Delta x}\left(\hat{f}_{i+1/2} - \hat{f}_{i-1/2}\right),
\]

where \(\hat{f}_{i+1/2} = \hat{f}(\bar{U}_i^n, \bar{U}_{i+1}^n)\) is the **numerical flux function** at the cell interface \(x_{i+1/2}\). The choice of numerical flux function determines the accuracy, stability, and monotonicity of the scheme.

A numerical flux is **consistent** if \(\hat{f}(u, u) = f(u)\) for all \(u\), i.e., the numerical flux reduces to the exact flux when no jump is present. A scheme is **conservative** if it can be written in the above flux-difference form, ensuring that the total sum of conserved quantities changes only through boundary fluxes.

## The Riemann Problem and the Godunov Scheme

The **Riemann problem** for the conservation law \(u_t + f(u)_x = 0\) is the initial value problem with piecewise constant data:

\[
u(x, 0) = \begin{cases} u_L & x < 0 \\ u_R & x > 0 \end{cases}.
\]

For the linear advection equation \(f(u) = au\), the exact solution is simply

\[
u(x, t) = \begin{cases} u_L & x < at \\ u_R & x > at \end{cases}.
\]

The **Godunov scheme** uses the exact solution of the Riemann problem at each cell interface to define the numerical flux. For linear advection with \(a > 0\):

\[
\hat{f}_{i+1/2} = a \bar{U}_i^n,
\]

which is precisely the upwind scheme. For a general scalar conservation law with convex flux (so that \(f'' > 0\)), the Riemann problem has a unique entropy solution, and the Godunov flux is:

\[
\hat{f}_{i+1/2} = \begin{cases} \min_{u_L \leq u \leq u_R} f(u) & \text{if } u_L \leq u_R \\ \max_{u_R \leq u \leq u_L} f(u) & \text{if } u_L > u_R \end{cases}.
\]

The Godunov scheme is monotone and first-order accurate, satisfying a discrete entropy condition that selects the physically relevant weak solution.

## Common Numerical Flux Functions

**Upwind flux:** For linear advection \(f(u) = au\):

\[
\hat{f}_{i+1/2} = a^+ \bar{U}_i + a^- \bar{U}_{i+1}, \quad a^+ = \max(a, 0), \quad a^- = \min(a, 0).
\]

**Lax-Friedrichs flux:**

\[
\hat{f}_{i+1/2} = \frac{1}{2}\left(f(\bar{U}_i) + f(\bar{U}_{i+1})\right) - \frac{\Delta x}{2\Delta t}\left(\bar{U}_{i+1} - \bar{U}_i\right).
\]

This is first-order accurate and highly dissipative; the \(\Delta x/(2\Delta t)\) term corresponds to numerical diffusion.

**Roe linearization:** For a general conservation law, Roe's scheme replaces the nonlinear flux difference \(f(U_R) - f(U_L)\) by \(\hat{A}(U_R - U_L)\), where the **Roe matrix** \(\hat{A} = \hat{A}(U_L, U_R)\) is a matrix satisfying:

1. \(\hat{A}(U_L, U_R)(U_R - U_L) = f(U_R) - f(U_L)\),
2. \(\hat{A}(U, U) = f'(U)\) (consistency),
3. \(\hat{A}\) is diagonalisable with real eigenvalues.

For the scalar case, \(\hat{A} = (f(U_R) - f(U_L))/(U_R - U_L)\) (the divided difference). The Roe flux is:

\[
\hat{f}_{i+1/2}^{\text{Roe}} = \frac{1}{2}\left(f(U_L) + f(U_R)\right) - \frac{1}{2}|\hat{A}|(U_R - U_L).
\]

## MUSCL Reconstruction and Slope Limiters

First-order schemes are excessively dissipative for smooth solutions. The **MUSCL (Monotone Upstream-Centred Scheme for Conservation Laws)** framework improves accuracy to second order by replacing the piecewise constant reconstruction of Godunov's scheme with a **piecewise linear reconstruction**.

Within cell \(i\), the reconstructed values at the left and right interfaces are:

\[
U_i^- = \bar{U}_i - \frac{\Delta x}{2} \sigma_i, \qquad U_i^+ = \bar{U}_i + \frac{\Delta x}{2} \sigma_i,
\]

where \(\sigma_i\) is a **limited slope** that prevents the creation of new extrema (**monotonicity**). The numerical flux then uses these reconstructed values in the Riemann solver:

\[
\hat{f}_{i+1/2} = \hat{f}(U_i^+, U_{i+1}^-).
\]

**Slope limiters** are chosen to satisfy the **TVD (Total Variation Diminishing)** property, which ensures that oscillations do not grow. Several limiters are in common use:

- **Minmod limiter:**

\[
\sigma_i = \text{minmod}\left(\frac{\bar{U}_{i+1} - \bar{U}_i}{\Delta x}, \frac{\bar{U}_i - \bar{U}_{i-1}}{\Delta x}\right),
\]

where \(\text{minmod}(a, b) = 0\) if \(ab \leq 0\) and \(\text{minmod}(a,b) = \min(|a|,|b|)\text{sgn}(a)\) otherwise. This is the most conservative limiter and reduces to first order near extrema.

- **Superbee limiter:**

\[
\sigma_i = \text{maxmod}(\text{minmod}(2s_L, s_R), \text{minmod}(s_L, 2s_R)),
\]

where \(s_L = (\bar{U}_i - \bar{U}_{i-1})/\Delta x\) and \(s_R = (\bar{U}_{i+1} - \bar{U}_i)/\Delta x\). Superbee is less diffusive than minmod and sharpens discontinuities, though it can over-steepen smooth extrema.

- **van Leer limiter:** \(\sigma_i = \frac{2 s_L s_R}{s_L + s_R}\) (harmonic mean), which is smooth and second-order at smooth extrema.

## Entropy Conditions

Weak solutions to conservation laws are not unique; the physically relevant solution is the **entropy solution**, which satisfies additional entropy inequalities. For a convex scalar conservation law, the **Lax entropy condition** requires that characteristics converge into shock waves: the shock speed \(s\) must satisfy \(f'(u_L) > s > f'(u_R)\). Numerical schemes should be designed to capture the entropy solution and not introduce spurious "expansion shocks."

A scheme is called **E-scheme** (entropy-satisfying) or **monotone** if it is non-decreasing in each argument separately. Monotone schemes converge to the entropy solution (Crandall-Majda theorem) but are at most first-order accurate by Godunov's order barrier theorem. High-resolution schemes that are second-order accurate for smooth solutions but reduce to first order near discontinuities (via limiters) aim to combine the best of both worlds.

---

# Chapter 5: Finite Volume Methods for Elliptic and Parabolic PDEs

## FVM for the Poisson Equation

The finite volume method for elliptic equations is motivated by integrating the differential equation over each control volume, yielding a scheme that exactly preserves local fluxes. Consider the Poisson equation \(-\nabla \cdot (k \nabla u) = f\) with variable coefficient \(k(x,y) > 0\).

On a structured mesh with cells \(C_{i,j} = (x_{i-1/2}, x_{i+1/2}) \times (y_{j-1/2}, y_{j+1/2})\) and cell widths \(\Delta x, \Delta y\), integrating over the cell and applying the divergence theorem:

\[
-\oint_{\partial C_{i,j}} k \nabla u \cdot \hat{n} \, ds = \int_{C_{i,j}} f \, dA.
\]

The boundary integral splits into four face contributions. On the right face at \(x_{i+1/2}\):

\[
\int_{y_{j-1/2}}^{y_{j+1/2}} k(x_{i+1/2}, y) \frac{\partial u}{\partial x}(x_{i+1/2}, y) \, dy \approx \Delta y \cdot k_{i+1/2, j} \frac{U_{i+1,j} - U_{i,j}}{\Delta x},
\]

where \(k_{i+1/2,j}\) is an average of \(k\) at the face. For discontinuous or rapidly varying \(k\), the **harmonic mean** \(k_{i+1/2,j} = \frac{2 k_{i,j} k_{i+1,j}}{k_{i,j} + k_{i+1,j}}\) is preferred because it correctly handles the limit of two materials in series (the harmonic mean of resistances).

The assembled discrete system for constant \(k=1\) recovers the five-point Laplacian, showing that FDM and FVM coincide for uniform meshes and constant coefficients. The FVM derivation, however, immediately generalises to non-uniform meshes and variable coefficients in a conservative manner.

## FVM on Unstructured Meshes

On unstructured triangular or polyhedral meshes, the FVM framework remains elegant. The mesh consists of cells \(\{C_i\}\), and for each interior face \(e_{ij}\) shared by cells \(C_i\) and \(C_j\):

\[
F_{ij} = -k \frac{u_j - u_i}{d_{ij}} |e_{ij}|,
\]

where \(d_{ij}\) is the distance between cell centres and \(|e_{ij}|\) is the face length (area in 3D). The scheme is:

\[
\sum_{j \sim i} F_{ij} = \int_{C_i} f \, dA \approx |C_i| f_i.
\]

This **cell-centred FVM** approximation is second-order accurate when the mesh is sufficiently regular (the orthogonality condition: the line connecting cell centres is orthogonal to the face). For non-orthogonal meshes, a correction term involving a reconstruction of the gradient is required, leading to the **non-orthogonal correction** approach used in OpenFOAM and other industrial CFD codes.

## Boundary Conditions in FVM

**Dirichlet conditions** are handled by placing a fictitious cell outside the boundary face and setting its value to enforce the boundary condition. If the boundary face is at distance \(d_b\) from the interior cell centre and the Dirichlet value is \(g\), the boundary flux is:

\[
F_b = -k \frac{g - U_i}{d_b} |e_b|.
\]

**Neumann conditions** specify the normal flux directly: \(F_b = -g_N |e_b|\), which is inserted directly into the balance equation without additional unknowns. This direct incorporation is one of the natural advantages of the FVM framework.

---

# Chapter 6: Finite Element Methods: Theory

## Motivation for the Weak Formulation

The classical formulation of a PDE requires the solution to be sufficiently smooth for all derivatives to exist in the pointwise sense. Real solutions — especially those involving jumps in coefficients or irregular geometries — may fail to satisfy the equation in this classical sense. The **variational (weak) formulation** enlarges the solution space to include functions that satisfy the equation in an averaged sense against test functions, and is the natural setting for finite element analysis.

## Derivation of the Weak Form

Consider the boundary value problem: find \(u\) such that

\[
-\Delta u = f \quad \text{in } \Omega, \qquad u = 0 \quad \text{on } \partial\Omega.
\]

Multiply by an arbitrary test function \(v\) from a suitable function space, and integrate over \(\Omega\):

\[
-\int_\Omega (\Delta u) v \, dx = \int_\Omega f v \, dx.
\]

Applying Green's first identity:

\[
\int_\Omega \nabla u \cdot \nabla v \, dx - \int_{\partial\Omega} \frac{\partial u}{\partial n} v \, ds = \int_\Omega f v \, dx.
\]

If \(v = 0\) on \(\partial\Omega\) (which will be required of test functions), the boundary term vanishes, leaving the **weak formulation**: find \(u \in H_0^1(\Omega)\) such that

\[
a(u, v) = \ell(v) \quad \forall v \in H_0^1(\Omega),
\]

where the **bilinear form** and **linear functional** are:

\[
a(u, v) = \int_\Omega \nabla u \cdot \nabla v \, dx, \qquad \ell(v) = \int_\Omega f v \, dx.
\]

## Sobolev Spaces

The appropriate function spaces for weak formulations are **Sobolev spaces**. The space \(L^2(\Omega)\) consists of square-integrable functions with norm \(\|u\|_{L^2} = \left(\int_\Omega |u|^2 \, dx\right)^{1/2}\). The Sobolev space \(H^1(\Omega)\) contains functions whose first weak derivatives are also in \(L^2\):

\[
H^1(\Omega) = \left\{ u \in L^2(\Omega) : \frac{\partial u}{\partial x_i} \in L^2(\Omega), \; i = 1, \ldots, d \right\},
\]

with norm \(\|u\|_{H^1}^2 = \|u\|_{L^2}^2 + \sum_i \|\partial u/\partial x_i\|_{L^2}^2\). The subspace \(H_0^1(\Omega)\) enforces vanishing trace on the boundary:

\[
H_0^1(\Omega) = \overline{C_c^\infty(\Omega)}^{H^1},
\]

the closure of smooth compactly supported functions in the \(H^1\) norm. By the **Poincaré inequality**, the \(H^1\) seminorm \(|u|_{H^1}^2 = \int_\Omega |\nabla u|^2 \, dx\) is a full norm on \(H_0^1(\Omega)\), equivalent to \(\|\cdot\|_{H^1}\).

## The Lax-Milgram Theorem

<div class="theorem">
<strong>Lax-Milgram Theorem.</strong> Let \(V\) be a Hilbert space, \(a: V \times V \to \mathbb{R}\) a bilinear form, and \(\ell: V \to \mathbb{R}\) a bounded linear functional. Suppose that:

<ol>
<li><em>Continuity:</em> there exists \(M > 0\) such that \(|a(u,v)| \leq M \|u\|_V \|v\|_V\) for all \(u, v \in V\).</li>
<li><em>Coercivity:</em> there exists \(\alpha > 0\) such that \(a(v,v) \geq \alpha \|v\|_V^2\) for all \(v \in V\).</li>
</ol>

Then there exists a unique \(u \in V\) satisfying \(a(u,v) = \ell(v)\) for all \(v \in V\), and \(\|u\|_V \leq \frac{1}{\alpha} \|\ell\|_{V'}\).
</div>

For the Poisson problem, \(V = H_0^1(\Omega)\), continuity of \(a(\cdot, \cdot)\) follows from the Cauchy-Schwarz inequality, and coercivity with \(\alpha = 1\) follows from the Poincaré inequality (taking \(\|v\|_V = |v|_{H^1}\)). Well-posedness is thus guaranteed by the Lax-Milgram theorem.

## The Galerkin Method

The **Galerkin method** approximates the weak problem by restricting to a finite-dimensional subspace \(V_h \subset V\). The discrete problem is: find \(u_h \in V_h\) such that

\[
a(u_h, v_h) = \ell(v_h) \quad \forall v_h \in V_h.
\]

This is again a well-posed problem (by Lax-Milgram applied to \(V_h\)), and the solution \(u_h\) is the best approximation to \(u\) in \(V_h\) in the energy norm. More precisely:

<div class="theorem">
<strong>Galerkin Orthogonality.</strong> The error \(e = u - u_h\) satisfies

\[
a(u - u_h, v_h) = 0 \quad \forall v_h \in V_h.
\]

The Galerkin error is orthogonal to the approximation space \(V_h\) in the inner product induced by \(a(\cdot, \cdot)\).
</div>

## Céa's Lemma

<div class="theorem">
<strong>Céa's Lemma.</strong> Under the assumptions of the Lax-Milgram theorem,

\[
\|u - u_h\|_V \leq \frac{M}{\alpha} \inf_{v_h \in V_h} \|u - v_h\|_V.
\]

The Galerkin solution is quasi-optimal: the error is within a factor \(M/\alpha\) (which equals 1 for the Poisson problem since \(a\) is symmetric and \(M/\alpha = 1\)) of the best approximation error in \(V_h\).
</div>

<div class="proof">
By coercivity, the triangle inequality, and Galerkin orthogonality:

\[
\alpha \|u - u_h\|_V^2 \leq a(u - u_h, u - u_h) = a(u - u_h, u - v_h) \leq M \|u - u_h\|_V \|u - v_h\|_V
\]

for any \(v_h \in V_h\), since \(a(u - u_h, u_h - v_h) = 0\) by Galerkin orthogonality. Dividing by \(\|u - u_h\|_V\) and taking the infimum over \(v_h\) completes the proof.
</div>

## Piecewise Linear Finite Elements in 1D

On the interval \([0, 1]\), introduce a mesh \(0 = x_0 < x_1 < \ldots < x_N < x_{N+1} = 1\). The **space of piecewise linear functions** is:

\[
V_h = \{ v \in C^0([0,1]) : v|_{[x_j, x_{j+1}]} \text{ is linear for each } j, \; v(0) = v(1) = 0 \}.
\]

This is a subspace of \(H_0^1(0,1)\) of dimension \(N\). A natural basis is provided by the **hat functions** (Lagrange basis functions):

\[
\phi_j(x) = \begin{cases} (x - x_{j-1})/(x_j - x_{j-1}) & x \in [x_{j-1}, x_j] \\ (x_{j+1} - x)/(x_{j+1} - x_j) & x \in [x_j, x_{j+1}] \\ 0 & \text{otherwise} \end{cases}, \quad j = 1, \ldots, N.
\]

Each \(\phi_j\) satisfies \(\phi_j(x_k) = \delta_{jk}\) (the Kronecker delta property), so the coefficient of \(\phi_j\) in the expansion \(u_h = \sum_{j=1}^N U_j \phi_j\) is exactly the nodal value \(U_j = u_h(x_j)\).

## Stiffness and Mass Matrices

Substituting \(u_h = \sum_j U_j \phi_j\) and \(v_h = \phi_i\) into the Galerkin problem yields the linear system \(K \mathbf{U} = \mathbf{f}\), where the **stiffness matrix** \(K\) and **load vector** \(\mathbf{f}\) have entries:

\[
K_{ij} = a(\phi_j, \phi_i) = \int_0^1 \phi_j'(x) \phi_i'(x) \, dx, \qquad f_i = \ell(\phi_i) = \int_0^1 f(x) \phi_i(x) \, dx.
\]

For a uniform mesh with \(h = 1/(N+1)\), the stiffness matrix is the familiar tridiagonal matrix:

\[
K = \frac{1}{h} \begin{pmatrix} 2 & -1 & & \\ -1 & 2 & -1 & \\ & \ddots & \ddots & \ddots \\ & & -1 & 2 \end{pmatrix}.
\]

For time-dependent problems with the weak formulation \((u_t, v) + a(u, v) = \ell(v)\), we also encounter the **mass matrix** \(M\) with entries:

\[
M_{ij} = \int_0^1 \phi_j(x) \phi_i(x) \, dx.
\]

For uniform meshes, the mass matrix is tridiagonal with entries \(h/6\) on the off-diagonals and \(2h/3\) on the diagonal, arising from the \(L^2\) inner products of the hat functions.

---

# Chapter 7: Finite Element Methods: Implementation

## Triangulation and Lagrange Elements in 2D

In two dimensions, the domain \(\Omega \subset \mathbb{R}^2\) is partitioned into a **triangulation** \(\mathcal{T}_h\): a collection of non-overlapping triangles \(\{K\}\) such that \(\bigcup_K \overline{K} = \overline{\Omega}\), and any two triangles either do not intersect or share a complete edge or vertex. The mesh parameter \(h = \max_K h_K\) where \(h_K = \text{diam}(K)\).

**P1 Lagrange elements** use the space of functions that are continuous and piecewise linear on each triangle. On a triangle with vertices \(\mathbf{x}_1, \mathbf{x}_2, \mathbf{x}_3\), the three **barycentric coordinates** \(\lambda_1, \lambda_2, \lambda_3\) with \(\lambda_1 + \lambda_2 + \lambda_3 = 1\) define local linear functions, and the local basis functions are \(\phi_i^K = \lambda_i\), satisfying \(\phi_i^K(\mathbf{x}_j) = \delta_{ij}\).

**P2 Lagrange elements** use continuous piecewise quadratic functions. On each triangle, the six degrees of freedom correspond to values at the three vertices and three edge midpoints. The local basis functions are quadratic polynomials that are 1 at one node and 0 at all others. P2 elements achieve \(O(h^2)\) error in \(H^1\) and \(O(h^3)\) in \(L^2\) for smooth solutions, compared with \(O(h)\) and \(O(h^2)\) for P1.

## Reference Element and Isoparametric Mapping

To simplify the computation of element matrices, one uses a **reference element**. For triangles, the reference element \(\hat{K}\) has vertices \(\hat{\mathbf{x}}_1 = (0,0)\), \(\hat{\mathbf{x}}_2 = (1,0)\), \(\hat{\mathbf{x}}_3 = (0,1)\). Every physical triangle \(K\) is the image of \(\hat{K}\) under the affine map

\[
\mathbf{x} = F_K(\hat{\mathbf{x}}) = B_K \hat{\mathbf{x}} + \mathbf{b}_K,
\]

where \(B_K\) is a \(2 \times 2\) matrix determined by the triangle geometry and \(\mathbf{b}_K = \mathbf{x}_1\). Gradients transform as \(\nabla_x v = B_K^{-T} \hat{\nabla} \hat{v}\), and the Jacobian of the map is \(|\det B_K| = 2|K|\) where \(|K|\) is the area of the triangle.

In the **isoparametric** approach, the same basis functions used to approximate the solution are also used to describe the geometry. This allows accurate representation of curved boundaries and is essential when the mesh contains elements with curved edges.

## Element Matrix Assembly

The global stiffness matrix is assembled from **element stiffness matrices** \(K^e\). On element \(K\), the entry is:

\[
K^e_{ij} = \int_K \nabla \phi_j^K \cdot \nabla \phi_i^K \, dx = \int_{\hat{K}} (B_K^{-T} \hat{\nabla} \hat{\phi}_j) \cdot (B_K^{-T} \hat{\nabla} \hat{\phi}_i) |\det B_K| \, d\hat{x}.
\]

The global matrix \(K\) is assembled by looping over all elements and adding element contributions to the appropriate global entries:

```
for each element K with global node indices (n1, n2, n3):
    compute local stiffness matrix K^e (3x3 for P1)
    for i = 1, 2, 3:
        for j = 1, 2, 3:
            K[n_i, n_j] += K^e[i, j]
        f[n_i] += f^e[i]
```

The resulting global stiffness matrix is **sparse**: each row has at most \(O(1)\) non-zero entries relative to the total matrix size, since each node is shared by only a bounded number of elements in a shape-regular mesh. The sparsity is crucial for the efficiency of linear solvers.

## Numerical Integration by Gauss Quadrature

The element integrals are typically computed using **Gaussian quadrature** on the reference element. A quadrature rule approximates:

\[
\int_{\hat{K}} g(\hat{x}) \, d\hat{x} \approx \sum_{q=1}^Q w_q g(\hat{x}_q),
\]

where \(\hat{x}_q\) are **quadrature points** and \(w_q > 0\) are **weights**. For integration over triangles, standard rules are available. The 1-point rule (centroid rule) is exact for polynomials of degree 1; the 3-point rule with quadrature points at edge midpoints is exact for degree 2; and so on.

For P1 elements with linear basis functions, the stiffness matrix entries are constant over each element (since \(\nabla \phi_i^K\) are constant on each triangle), so no quadrature is needed for the stiffness matrix — it can be computed exactly. The load vector entries \(\int_K f \phi_i \, dx\), however, require quadrature unless \(f\) is polynomial.

## Treatment of Boundary Conditions

**Dirichlet boundary conditions** \(u = g\) on \(\partial\Omega_D\) are imposed by modifying the linear system. Nodes on \(\partial\Omega_D\) are identified, and the corresponding equations are replaced by \(U_j = g(\mathbf{x}_j)\). The stiffness matrix row corresponding to node \(j\) on the Dirichlet boundary is set to the identity row, and the right-hand side entry is set to \(g(\mathbf{x}_j)\). This modification preserves the symmetry of the system. Alternatively, the known Dirichlet values can be substituted into the system, reducing its size by the number of Dirichlet nodes.

**Neumann boundary conditions** \(\frac{\partial u}{\partial n} = g_N\) on \(\partial\Omega_N\) are **natural boundary conditions** in the FEM framework: they enter the weak formulation automatically through the boundary term that arises upon integration by parts. The weak form of the Poisson problem with mixed boundary conditions is:

\[
\int_\Omega \nabla u \cdot \nabla v \, dx = \int_\Omega f v \, dx + \int_{\partial\Omega_N} g_N v \, ds \quad \forall v \in V_h,
\]

where \(V_h\) now only enforces zero values on \(\partial\Omega_D\). The Neumann boundary integral is assembled by looping over boundary edges on \(\partial\Omega_N\) and adding contributions to the right-hand side vector.

## Sparse Matrix Solvers

The assembled stiffness matrix \(K\) is symmetric, positive definite, and sparse. For moderate-sized problems, **direct solvers** based on sparse Cholesky or LU factorisation are efficient. For large-scale 3D problems, **iterative solvers** — particularly the **conjugate gradient (CG) method** preconditioned by incomplete Cholesky (ICC), algebraic multigrid (AMG), or domain decomposition preconditioners — are necessary.

The condition number of the stiffness matrix scales as \(\kappa(K) \sim h^{-2}\) for P1 elements, which deteriorates as the mesh is refined. Effective preconditioning is therefore essential for efficiency on fine meshes.

---

# Chapter 8: Error Analysis and Convergence

## A Priori Error Estimates for FEM

A priori error estimates bound the discretisation error in terms of the mesh parameter \(h\) and the regularity of the exact solution. For the Poisson problem with P1 elements on a quasi-uniform mesh, combining Céa's lemma with approximation theory gives the fundamental estimate:

<div class="theorem">
<strong>A Priori \(H^1\) Error Estimate.</strong> Suppose \(u \in H^2(\Omega)\). Then the P1 Galerkin solution \(u_h\) satisfies

\[
\|u - u_h\|_{H^1} \leq C h \|u\|_{H^2},
\]

where \(C\) depends on the shape regularity of the mesh but not on \(h\).
</div>

The proof combines Céa's lemma with the standard interpolation estimate \(\inf_{v_h \in V_h} \|u - v_h\|_{H^1} \leq C h |u|_{H^2}\), which follows from the Bramble-Hilbert lemma: any functional that vanishes on polynomials of degree \(k\) and is continuous on \(H^{k+1}\) is bounded by the \(H^{k+1}\) seminorm multiplied by \(h^k\).

For Pk elements with polynomial degree \(k\), the estimate generalises to:

\[
\|u - u_h\|_{H^1} \leq C h^k |u|_{H^{k+1}}.
\]

## The Aubin-Nitsche Duality Argument

The Galerkin method naturally gives first-order convergence in \(H^1\) for P1 elements. To obtain a sharper estimate in the \(L^2\) norm, one uses the **Aubin-Nitsche (duality) argument**.

<div class="theorem">
<strong>Aubin-Nitsche \(L^2\) Estimate.</strong> Suppose the domain is such that the dual problem \(-\Delta \psi = e\) with \(\psi = 0\) on \(\partial\Omega\) has the elliptic regularity property \(\|\psi\|_{H^2} \leq C \|e\|_{L^2}\). Then

\[
\|u - u_h\|_{L^2} \leq C h^2 |u|_{H^2}.
\]
</div>

<div class="proof">
Let \(e = u - u_h\). By the Riesz representation theorem, \(\|e\|_{L^2}^2 = (e, e) = a(e, \psi)\) where \(\psi\) solves the dual problem with right-hand side \(e\). By Galerkin orthogonality and elliptic regularity:

\[
\|e\|_{L^2}^2 = a(e, \psi) = a(e, \psi - \pi_h \psi) \leq \|e\|_{H^1} \|\psi - \pi_h \psi\|_{H^1} \leq Ch \|e\|_{H^1} \cdot Ch \|e\|_{L^2},
\]

where \(\pi_h\) is the nodal interpolant and the last step uses elliptic regularity. Dividing by \(\|e\|_{L^2}\) and applying the \(H^1\) estimate completes the argument.
</div>

The gain of a full power of \(h\) in the \(L^2\) norm compared to the \(H^1\) norm is the hallmark of this **elliptic lift** argument and holds whenever the dual problem has full \(H^2\) regularity (e.g., convex polygonal domains).

## A Posteriori Error Estimators

A priori estimates require knowledge of the exact solution's regularity, which is generally unavailable. **A posteriori error estimators** compute a bound on the error using only the computed solution \(u_h\) and the data, providing a practical tool for **adaptive mesh refinement (AMR)**.

The **residual-based error estimator** of Babuška and Rheinboldt defines element and edge residuals. For the Poisson problem:

- **Element residual:** \(R_K = f + \Delta u_h\) on each element \(K\) (the equation residual inside the element).
- **Edge/face residual:** \(J_e = \left[\!\left[\frac{\partial u_h}{\partial n}\right]\!\right]_e\) (the jump in normal derivative across interior edge \(e\)).

The global error estimator is:

\[
\eta^2 = \sum_K \eta_K^2, \qquad \eta_K^2 = h_K^2 \|R_K\|_{L^2(K)}^2 + \sum_{e \subset \partial K} h_e \|J_e\|_{L^2(e)}^2.
\]

<div class="theorem">
<strong>Reliability and Efficiency.</strong> There exist constants \(C_1, C_2 > 0\) (independent of \(h\)) such that

\[
C_1 \eta \leq \|u - u_h\|_{H^1} \leq C_2 \eta + \text{data oscillation}.
\]

Reliability (\(\leq C_2 \eta\)) means the estimator controls the error; efficiency (\(\geq C_1 \eta\)) means it does not over-refine.
</div>

## Adaptive Mesh Refinement

In AMR, the mesh is locally refined in regions where the error estimator \(\eta_K\) is large, and potentially coarsened where it is small. The standard adaptive loop is:

\[
\text{SOLVE} \to \text{ESTIMATE} \to \text{MARK} \to \text{REFINE},
\]

iterated until \(\eta < \text{TOL}\). The **Dörfler marking strategy** (bulk criterion) marks a subset of elements such that the sum of \(\eta_K^2\) over marked elements exceeds a fixed fraction \(\theta \in (0,1)\) of the total estimator. This ensures a guaranteed reduction in the error at each adaptive step.

## Comparison of FDM, FVM, and FEM Error Rates

For smooth solutions, all three methods achieve the expected polynomial convergence rates. On uniform meshes:

- FDM with centered differences: \(O(h^2)\) in the maximum norm for elliptic problems.
- FVM with piecewise constant reconstruction: \(O(h^1)\) for hyperbolic, \(O(h^2)\) for elliptic on orthogonal meshes.
- FEM with Pk elements: \(O(h^k)\) in \(H^1\) and \(O(h^{k+1})\) in \(L^2\) for smooth solutions.

For problems with singularities (re-entrant corners, discontinuous coefficients), the convergence rate degrades unless the mesh is appropriately refined. FEM with AMR is particularly well-suited to such problems, achieving optimal convergence rates even for singular solutions.

**Superconvergence** is the phenomenon where the error is higher-order accurate at certain special points than the global estimate suggests. For 1D FEM with uniform meshes, the nodal errors satisfy \(|u(x_j) - U_j| = O(h^{2k})\) for Pk elements, one order better than the global \(H^1\) estimate. Superconvergence is used in gradient recovery methods (e.g., the Zienkiewicz-Zhu patch recovery) to construct enhanced a posteriori error estimators.

---

# Chapter 9: Nonlinear and Time-Dependent Problems

## Newton Iteration for Nonlinear Elliptic PDEs

Many applications lead to nonlinear elliptic PDEs of the form \(-\nabla \cdot (k(u) \nabla u) = f\), where the diffusion coefficient depends on the solution. The weak formulation is: find \(u \in H_0^1(\Omega)\) such that

\[
a(u; u, v) = \ell(v) \quad \forall v \in V_h,
\]

where \(a(u; \cdot, \cdot)\) is now a nonlinear bilinear-like form. After Galerkin discretisation, this becomes a nonlinear system \(F(\mathbf{U}) = 0\).

**Newton's method** linearises \(F\) about the current iterate \(\mathbf{U}^{(k)}\):

\[
J(\mathbf{U}^{(k)}) \delta\mathbf{U} = -F(\mathbf{U}^{(k)}), \qquad \mathbf{U}^{(k+1)} = \mathbf{U}^{(k)} + \delta\mathbf{U},
\]

where \(J = \nabla_\mathbf{U} F\) is the **Jacobian matrix** (or **tangent stiffness matrix** in structural mechanics). For the nonlinear diffusion equation, the Jacobian has entries:

\[
J_{ij} = \int_\Omega \left(k'(u_h) (\nabla u_h \cdot \nabla \phi_j) \phi_i + k(u_h) \nabla \phi_j \cdot \nabla \phi_i\right) dx.
\]

Newton's method converges quadratically in a neighbourhood of the solution, provided the Jacobian is non-singular. For mildly nonlinear problems, **Picard iteration** (replacing \(k(u)\) by \(k(u^{(k)})\) from the previous iterate and solving the resulting linear problem) is sometimes preferred for its robustness.

## Method of Lines

For time-dependent problems, the **method of lines (MOL)** first discretises in space (using FDM, FVM, or FEM), converting the PDE into a system of ODEs in time:

\[
M \dot{\mathbf{U}} + K \mathbf{U} = \mathbf{f}(t),
\]

where \(M\) is the mass matrix and \(K\) is the stiffness matrix. This ODE system can then be solved by any ODE integrator (Runge-Kutta, BDF, etc.). The advantage of MOL is the separation of spatial discretisation from time integration, allowing the use of adaptive time-stepping, error control, and stiff ODE solvers.

For the heat equation with P1 FEM in 1D, the semi-discrete system is:

\[
M \dot{\mathbf{U}} + K \mathbf{U} = \mathbf{f},
\]

which is a stiff linear ODE system. The **stiffness** of this system (the ratio of the largest to smallest eigenvalue of \(M^{-1}K\)) is \(O(h^{-2})\), requiring either implicit time integrators or very small time steps for explicit methods.

## Operator Splitting

For problems with multiple physical processes acting on different time scales, **operator splitting** decomposes the time integration into a sequence of simpler subproblems. For the convection-diffusion equation \(u_t + au_x = \kappa u_{xx}\), the **Lie splitting** (or **Strang splitting**) proceeds as:

1. Solve the advection subproblem \(u_t + au_x = 0\) over \([t^n, t^{n+1}]\).
2. Solve the diffusion subproblem \(u_t = \kappa u_{xx}\) over \([t^n, t^{n+1}]\) using the output of step 1 as initial data.

The **Strang splitting** uses the sequence \((L_1/2)(L_2)(L_1/2)\) — half-step of operator 1, full step of operator 2, half-step of operator 1 — and achieves second-order accuracy.

Operator splitting is particularly effective when the two subproblems have very different optimal solvers: hyperbolic transport is best handled by upwind FVM with slope limiters, while diffusion is best handled by implicit methods.

## IMEX Schemes

**Implicit-Explicit (IMEX)** methods treat stiff terms implicitly and non-stiff terms explicitly within the same time step. For the convection-diffusion equation with a nonlinear source \(u_t + au_x = \kappa u_{xx} + g(u)\), an IMEX scheme might treat the diffusion \(\kappa u_{xx}\) implicitly and the source \(g(u)\) explicitly:

\[
\frac{U^{n+1} - U^n}{\Delta t} + a D_x U^n = \kappa D_{xx} U^{n+1} + g(U^n).
\]

This avoids the time step restriction imposed by the diffusion term while maintaining the simplicity of explicit treatment of the nonlinear source. IMEX Runge-Kutta schemes provide high-order IMEX integration within the method of lines framework.

## Stiff Systems in PDEs

The **stiffness** of a PDE discretisation refers to the presence of widely separated time scales in the spectrum of the spatial discretisation operator. For the heat equation, the eigenvalues of the discrete Laplacian range from \(O(1)\) (long-wave modes) to \(O(h^{-2})\) (short-wave modes). Explicit Euler applied to the MOL system requires \(\Delta t \leq C h^2\), while implicit methods such as BDF2 or Crank-Nicolson allow \(\Delta t = O(h)\) or larger.

For reaction-diffusion systems \(\mathbf{u}_t = D \nabla^2 \mathbf{u} + \mathbf{f}(\mathbf{u})\), the stiffness may arise from both the diffusion operator (scale \(O(h^{-2})\)) and the reaction kinetics (scale \(O(\lambda)\) where \(\lambda\) is a large reaction rate). Fully implicit methods or IMEX schemes are necessary for efficiency.

## Multigrid Methods

For the large sparse linear systems arising from the discretisation of elliptic PDEs, **multigrid methods** achieve \(O(N)\) complexity (where \(N\) is the number of degrees of freedom), far superior to direct methods (\(O(N^{3/2})\) in 2D) or standard iterative methods (\(O(N^2)\)).

The key insight is that **relaxation methods** (Gauss-Seidel, weighted Jacobi) are effective at eliminating **high-frequency error components** but stagnate on low-frequency (smooth) error components. On a **coarser mesh**, these smooth errors become high-frequency and can be efficiently eliminated. The multigrid algorithm proceeds as follows:

1. **Pre-smoothing:** Apply \(\nu_1\) relaxation sweeps on the fine mesh to eliminate high-frequency errors.
2. **Restriction:** Transfer the residual to the coarser mesh using a restriction operator \(R_h^{2h}\).
3. **Coarse grid correction:** Solve (recursively) the coarse-mesh problem for the error.
4. **Prolongation:** Interpolate the coarse-mesh correction to the fine mesh using a prolongation operator \(P_{2h}^h\).
5. **Post-smoothing:** Apply \(\nu_2\) relaxation sweeps to eliminate errors introduced by the prolongation.

The **two-grid correction** already reduces the error by a constant factor independent of \(h\), and the recursive V-cycle or W-cycle extension achieves the same reduction on all levels. The total work per V-cycle is \(O(N)\), and for standard elliptic problems, only a small number of V-cycles are needed, giving overall \(O(N)\) complexity.

**Algebraic multigrid (AMG)** constructs the coarse levels based on the algebraic structure of the matrix rather than geometric information, making it applicable to problems on unstructured meshes and systems of PDEs.

## Convergence of Newton-Multigrid Methods

For nonlinear elliptic PDEs, the combination of Newton iteration (for outer nonlinear iterations) and multigrid (for inner linear solves) provides a powerful solver. **Newton-Krylov-multigrid** methods use a Krylov method (GMRES or CG) with multigrid as preconditioner for each Newton step, achieving mesh-independent convergence rates. The total computational complexity for a solve on an \(N\)-point mesh is \(O(N \log N)\) or even \(O(N)\), depending on the problem and implementation.

---

# Chapter 10: Synthesis and Perspectives

## Comparative Summary of Methods

The three principal methods — FDM, FVM, and FEM — each have characteristic strengths and limitations that guide their use in practice.

**Finite difference methods** offer simplicity of implementation and analysis. On structured Cartesian meshes with smooth solutions, they provide high-order approximations with minimal computational overhead. Von Neumann stability analysis provides sharp stability criteria. However, FDM is poorly suited to complex geometries and unstructured meshes, and it does not automatically enforce conservation for hyperbolic problems.

**Finite volume methods** are the natural choice for hyperbolic conservation laws and for any problem where local conservation is physically important (fluid dynamics, transport phenomena, electromagnetics). The integral formulation accommodates discontinuous solutions and shocks in a mathematically principled way. FVM extends naturally to unstructured meshes through the cell-centred discretisation. The main difficulty is achieving high-order accuracy for smooth solutions without introducing non-physical oscillations, addressed through reconstruction and slope limiting.

**Finite element methods** provide the most flexible and mathematically rigorous framework. The variational formulation naturally accommodates complex geometries, varying mesh density, and high-order polynomial approximations. The mathematical theory — Sobolev spaces, Lax-Milgram, Céa's lemma, a posteriori estimators, adaptive refinement — provides a complete toolkit for analysis and practical computation. FEM is the dominant method in structural mechanics, electromagnetics, and many other engineering fields. Its main limitation is greater implementation complexity and, for certain hyperbolic problems, the lack of natural upwinding that comes with FVM.

## Duality and Connections

Beneath the surface differences, the three methods are deeply connected. On uniform Cartesian meshes, the five-point FDM Laplacian, the cell-centred FVM discretisation, and the P1 FEM stiffness matrix all coincide, up to a uniform scaling. The lumped mass matrix for P1 FEM on uniform meshes produces a finite difference approximation of the time derivative. These connections illuminate the underlying structure and help transfer analysis from one method to another.

The **discontinuous Galerkin (DG) method** can be viewed as a hybrid that combines the flexibility of FEM (high-order polynomial approximations, unstructured meshes) with the local conservation and upwinding of FVM. The DG solution is allowed to be discontinuous across element interfaces, with interface fluxes defined using numerical flux functions borrowed from the FVM framework. DG methods have become widely used for hyperbolic problems and for problems where adaptivity and high-order accuracy are simultaneously required.

## Open Problems and Active Research

Several fundamental challenges remain active areas of research. For hyperbolic systems with shocks, achieving high-order accuracy while maintaining stability and positivity-preservation remains difficult, particularly in multiple space dimensions. For nonlinear elliptic and parabolic problems in complex geometries, the design of robust, scalable preconditioners is an ongoing challenge. For stochastic PDEs, where the coefficients or forcing are random, the interaction between spatial discretisation and stochastic approximation raises new questions of consistency and convergence. Finally, the integration of machine learning with classical numerical methods — for data-driven model discovery, mesh adaptation, and preconditioner design — is a rapidly developing direction with both promise and open theoretical questions.

The study of numerical methods for PDEs remains a discipline that requires equal facility with functional analysis, linear algebra, and physical intuition. The interplay between the mathematical structure of the continuous problem and the algebraic structure of its discretisation is the central theme, and mastery of this interplay — understanding why a method works, when it fails, and how to recover — is the goal of this course.

---

## Appendix: Key Formulas and Estimates

The following table summarises the principal convergence estimates derived in these notes. Here \(u\) is the exact solution, \(u_h\) the numerical approximation on a mesh with parameter \(h\), and the regularity index \(s\) indicates the Sobolev smoothness \(u \in H^s(\Omega)\).

**Finite Difference Methods (uniform mesh):**

- Centered FD for \(u'\): truncation error \(O(h^2)\).
- Five-point Laplacian: truncation error \(O(h^2)\) in \(\ell^\infty\) norm.
- Heat equation (Crank-Nicolson): \(O(h^2 + \Delta t^2)\) error.
- Advection (Lax-Wendroff): \(O(h^2 + \Delta t^2)\), stable for \(|\nu| \leq 1\).

**Finite Element Methods (Pk elements, \(u \in H^{k+1}\)):**

- Energy norm: \(\|u - u_h\|_{H^1} \leq C h^k |u|_{H^{k+1}}\).
- \(L^2\) norm (elliptic regularity): \(\|u - u_h\|_{L^2} \leq C h^{k+1} |u|_{H^{k+1}}\).

**CFL Conditions:**

- Advection (upwind, Lax-Friedrichs, Lax-Wendroff): \(|a \Delta t / h| \leq 1\).
- Heat equation (explicit Euler): \(\kappa \Delta t / h^2 \leq 1/2\) (1D), \(\kappa \Delta t / h^2 \leq 1/(2d)\) (\(d\)D).

**Stability conditions (von Neumann):**

- Explicit Euler for heat: \(r = \kappa \Delta t/h^2 \leq 1/2\).
- Implicit Euler, Crank-Nicolson: unconditionally stable.
- Upwind advection: \(|\nu| \leq 1\).
