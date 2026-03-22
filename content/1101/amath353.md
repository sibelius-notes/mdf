---
title: "AMATH 353: Partial Differential Equations 1"
prof: "E.R. Vrscay"
---

# Chapter 1: Introduction to Partial Differential Equations

## What is a PDE?

A **partial differential equation** (PDE) is an equation involving an unknown function \( u \) of two or more independent variables and certain of its partial derivatives. If \( u \) is a function of \( x \) and \( y \), then examples include:

\[
\frac{\partial u}{\partial x} + \frac{\partial u}{\partial y} = 0, \qquad
u\frac{\partial^2 u}{\partial x^2} + \frac{\partial u}{\partial y} = 0, \qquad
\frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} = x^2 + y^2.
\]

Notice the contrast with an **ordinary differential equation** (ODE), which involves a function of a single variable and its ordinary derivatives. As soon as the unknown function depends on more than one variable, the equation necessarily becomes a PDE.

<div class="definition"><strong>Definition (Linearity).</strong> A PDE is <em>linear</em> if no expression involving \( u \) or any of its partial derivatives is multiplied by another such expression. Of the three examples above, the first and third are linear; the second is nonlinear because \( u \) multiplies \( \partial^2 u/\partial x^2 \).</div>

<div class="definition"><strong>Definition (Order).</strong> The <em>order</em> of a PDE is the order of the highest derivative appearing in the equation. The first example above is first order; the second and third are second order.</div>

Much of this course is devoted to **linear, second-order PDEs** for two reasons: there is a reasonable mathematical theory for them, and they model an enormous variety of natural phenomena.

## Why PDEs? The Transition from ODEs

ODEs are appropriate for modelling **homogeneous** or **point-like** systems: a mass on a spring, a projectile, a pendulum, or the temperature of a body small enough to be treated as having uniform temperature throughout. The moment spatial variation matters, PDEs become necessary.

Consider the temperature of a large steel ingot cooling in air. The surface cools first, and heat is conducted from the hot interior toward the surface. The temperature \( T \) is a function of both position and time: \( T = T(\mathbf{x}, t) \). Similarly, a chemical dissolving from a lump at the bottom of an unstirred beaker creates a concentration gradient \( c = c(\mathbf{x}, t) \). In both cases, the spatial dependence is the crucial new ingredient, and PDEs are the right tool.

In applications, the unknown function \( u \) typically depends on \( n \) spatial variables \( x_1, \ldots, x_n \) and one time variable \( t \):

\[
u = u(x_1, \ldots, x_n, t), \quad n = 1, 2, \text{ or } 3.
\]

## The Three Canonical Types

### The Heat (Diffusion) Equation

For a function \( u(x,t) \) depending on one spatial variable and time, the **1D heat equation** is

\[
\frac{\partial u}{\partial t} = k \frac{\partial^2 u}{\partial x^2}.
\]

In higher dimensions, the single second derivative in \( x \) is replaced by the **Laplacian** \( \nabla^2 u \):

\[
\frac{\partial u}{\partial t} = k \nabla^2 u.
\]

In two and three dimensions respectively,

\[
\nabla^2 u = \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2}, \qquad
\nabla^2 u = \frac{\partial^2 u}{\partial x^2} + \frac{\partial^2 u}{\partial y^2} + \frac{\partial^2 u}{\partial z^2}.
\]

The heat equation is **parabolic**: it has one time derivative on the left and a second spatial derivative on the right.

### The Wave Equation

The **1D wave equation** is

\[
\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2},
\]

and in higher dimensions, \( \partial^2 u/\partial t^2 = c^2 \nabla^2 u \). This is a **hyperbolic** PDE, characterised by two time derivatives. The constant \( c \) is the wave speed.

### Laplace's Equation

If the heat equation is solved in the **steady state** (time-independent regime), then \( \partial u/\partial t = 0 \) and the equation reduces to **Laplace's equation**:

\[
\nabla^2 u = 0.
\]

This is an **elliptic** PDE. Its solutions, called **harmonic functions**, describe equilibrium temperature distributions, electrostatic potentials, and irrotational fluid flow. When sources are present, the steady-state equation becomes **Poisson's equation**:

\[
\nabla^2 u = f(\mathbf{x}).
\]

### The Schrödinger Equation

An important linear PDE from quantum mechanics is the **Schrödinger equation** for a particle of mass \( m \) in a potential \( V(\mathbf{x}) \):

\[
i\hbar \frac{\partial u}{\partial t} = -\frac{\hbar^2}{2m} \nabla^2 u + V(\mathbf{x}) u,
\]

where \( \hbar = h/(2\pi) \) is the reduced Planck constant and \( u \) is the complex-valued **wavefunction**. This equation has the same structure as the heat equation (first-order in time, second-order in space), but with complex coefficients.

## Initial and Boundary Conditions

A PDE alone does not determine a unique solution; additional data must be prescribed. The appropriate type of data depends on the type of equation.

- **Initial conditions** (for time-dependent problems): prescribe \( u(\mathbf{x}, 0) \), and for the wave equation, also \( u_t(\mathbf{x}, 0) \).
- **Boundary conditions**: specify the behaviour of \( u \) on the spatial domain boundary \( \partial \Omega \).

The three main types of boundary conditions are:
1. **Dirichlet**: \( u = g \) on \( \partial \Omega \) (prescribed values).
2. **Neumann**: \( \partial u / \partial n = h \) on \( \partial \Omega \) (prescribed normal derivative, hence flux).
3. **Robin** (mixed): \( \alpha u + \beta \partial u/\partial n = g \) on \( \partial \Omega \).

<div class="definition"><strong>Definition (Well-posedness).</strong> A problem is <em>well-posed</em> in the sense of Hadamard if: (1) a solution exists, (2) the solution is unique, and (3) the solution depends continuously on the data. Physical models that are not well-posed are suspect as mathematical formulations.</div>

---

# Chapter 2: The Heat Equation in One Dimension

## Physical Derivation

We model heat conduction in a **uniform rod** of length \( L \) and constant cross-sectional area \( A \). The rod lies along the \( x \)-axis, \( 0 \le x \le L \). We assume all heat flow is in the \( x \)-direction (the lateral surface is insulated).

**Step 1: Thermal energy density.** Define \( e(x,t) \) as the thermal energy per unit volume at position \( x \) and time \( t \). For a thin slice of width \( \Delta x \), the total thermal energy is \( \Delta h \approx e(x,t) A \Delta x \), and the total energy in the segment \( [a,b] \) is

\[
h(a,b;t) = \int_a^b e(x,t)\, A\, dx.
\]

**Step 2: Conservation of energy.** Changes in thermal energy in \( [a,b] \) are due only to heat flow across the boundaries and any internal sources:

\[
\frac{d}{dt} \int_a^b e(x,t)\, A\, dx = \phi(a,t) A - \phi(b,t) A + \int_a^b Q(x,t)\, A\, dx,
\]

where \( \phi(x,t) \) is the **heat flux** (thermal energy per unit time per unit area flowing in the positive \( x \)-direction), and \( Q(x,t) \) is the rate of thermal energy generated per unit volume. Applying the Fundamental Theorem of Calculus to the flux terms and combining:

\[
\int_a^b \left( \frac{\partial e}{\partial t} + \frac{\partial \phi}{\partial x} - Q \right) dx = 0.
\]

Since this holds for every interval \( [a,b] \) and the integrand is continuous, the Du Bois-Reymond lemma yields the **differential form of conservation**:

\[
\frac{\partial e}{\partial t} + \frac{\partial \phi}{\partial x} = Q.
\]

<div class="theorem"><strong>Theorem (Du Bois-Reymond Lemma).</strong> If \( f : [0,L] \to \mathbb{R} \) is continuous and \( \int_a^b f(x)\, dx = 0 \) for all \( a, b \in [0,L] \), then \( f(x) = 0 \) for all \( x \in [0,L] \).</div>

This lemma, which converts an integral law into a pointwise (differential) law, is used repeatedly throughout the course.

**Step 3: Relating energy to temperature.** Define the **specific heat** \( c(x) \) as the heat energy required to raise a unit mass by one unit of temperature, and let \( \rho(x) \) be the mass density. Then

\[
e(x,t) = c(x)\rho(x)\bigl[u(x,t) - u_0\bigr],
\]

where \( u(x,t) \) is the temperature and \( u_0 \) is a reference temperature (whose choice is irrelevant). Differentiating in time:

\[
c(x)\rho(x) \frac{\partial u}{\partial t} = -\frac{\partial \phi}{\partial x} + Q.
\]

**Step 4: Fourier's law.** From experiment, heat flows from hotter regions to colder regions, at a rate proportional to the temperature gradient:

<div class="definition"><strong>Definition (Fourier's Law of Heat Conduction).</strong>
\[
\phi = -K_0(x) \frac{\partial u}{\partial x},
\]
where \( K_0(x) > 0 \) is the <em>thermal conductivity</em>.</div>

The minus sign ensures that heat flows in the direction of decreasing temperature. Substituting into the conservation equation gives the **generalised heat equation**:

\[
c(x)\rho(x) \frac{\partial u}{\partial t} = \frac{\partial}{\partial x}\!\left( K_0(x) \frac{\partial u}{\partial x} \right) + Q.
\]

For a **homogeneous** rod (constant \( c, \rho, K_0 \)) with no sources (\( Q = 0 \)), this simplifies to

\[
\frac{\partial u}{\partial t} = k \frac{\partial^2 u}{\partial x^2},
\]

where the **thermal diffusivity** is \( k = K_0 / (c\rho) \). This is the 1D heat equation.

<div class="remark"><strong>Remark.</strong> The identical PDE describes molecular diffusion (Fick's law: \( \phi = -k\, \partial u/\partial x \) where \( u \) is concentration). Fourier's law and Fick's law are both examples of <em>transport laws</em>: the flux is proportional to the gradient of the transported quantity. The linearity of this relation — rather than a power law — is a deep empirical fact that keeps the equation tractable.</div>

## Separation of Variables: Dirichlet Boundary Conditions

We solve the 1D heat equation on \( [0,L] \) with **zero-endpoint** (Dirichlet) boundary conditions:

\[
\frac{\partial u}{\partial t} = k \frac{\partial^2 u}{\partial x^2}, \quad
u(0,t) = 0, \quad u(L,t) = 0, \quad u(x,0) = f(x).
\]

We assume a solution of the form \( u(x,t) = \phi(x) G(t) \). Substituting:

\[
\phi(x) G'(t) = k \phi''(x) G(t) \implies \frac{G'(t)}{kG(t)} = \frac{\phi''(x)}{\phi(x)} = -\lambda,
\]

where \( \lambda \) is the **separation constant**. The two ODEs are:

\[
G'(t) + k\lambda G(t) = 0, \qquad \phi''(x) + \lambda \phi(x) = 0, \quad \phi(0) = \phi(L) = 0.
\]

**Case \( \lambda < 0 \):** The solution for \( \phi \) grows exponentially, violating the boundary conditions (only the trivial solution survives). **Case \( \lambda = 0 \):** Similarly, only the trivial solution exists. **Case \( \lambda > 0 \):** The general solution is \( \phi(x) = C_1 \cos(\sqrt{\lambda} x) + C_2 \sin(\sqrt{\lambda} x) \). The condition \( \phi(0) = 0 \) forces \( C_1 = 0 \). The condition \( \phi(L) = 0 \) then requires \( \sin(\sqrt{\lambda} L) = 0 \), so

\[
\sqrt{\lambda_n} L = n\pi \implies \lambda_n = \frac{n^2\pi^2}{L^2}, \quad n = 1, 2, 3, \ldots
\]

The **eigenvalues** are \( \lambda_n \) and the corresponding **eigenfunctions** are

\[
\phi_n(x) = \sin\!\left(\frac{n\pi x}{L}\right).
\]

These are the normal modes of the rod. The time-dependent part gives \( G_n(t) = e^{-k\lambda_n t} = e^{-k(n\pi/L)^2 t} \), so the separated solutions are

\[
u_n(x,t) = \sin\!\left(\frac{n\pi x}{L}\right) e^{-k(n\pi/L)^2 t}, \quad n = 1, 2, 3, \ldots
\]

![First few sine modes of the heat equation](/pics/amath353/heat_equation_modes.png)

## Fourier Sine Series

By the **principle of superposition** (valid for linear homogeneous equations), any linear combination of the \( u_n \) is also a solution. We seek coefficients \( c_n \) such that the initial condition is satisfied:

\[
u(x,0) = \sum_{n=1}^{\infty} c_n \sin\!\left(\frac{n\pi x}{L}\right) = f(x).
\]

The eigenfunctions are **orthogonal** on \( [0,L] \):

\[
\int_0^L \sin\!\left(\frac{m\pi x}{L}\right) \sin\!\left(\frac{n\pi x}{L}\right) dx = \begin{cases} 0, & m \ne n, \\ L/2, & m = n. \end{cases}
\]

Multiplying the expansion by \( \sin(m\pi x/L) \) and integrating gives the **Fourier sine coefficients**:

\[
c_n = \frac{2}{L} \int_0^L f(x) \sin\!\left(\frac{n\pi x}{L}\right) dx.
\]

The complete solution is

\[
u(x,t) = \sum_{n=1}^{\infty} c_n \sin\!\left(\frac{n\pi x}{L}\right) e^{-k(n\pi/L)^2 t}.
\]

<div class="remark"><strong>Remark.</strong> Each mode \( u_n \) decays at rate \( k\lambda_n = k(n\pi/L)^2 \). High-frequency modes (large \( n \)) decay much faster than low-frequency modes. As \( t \to \infty \), the solution approaches the zero steady state, as expected for zero-endpoint temperature conditions where heat escapes through both ends.</div>

## Physical Interpretation of Each Mode

The \( n \)-th mode is a standing wave in space (with \( n \) half-periods fitting in \( [0,L] \)) multiplied by an exponentially decaying envelope in time. The first mode, \( n=1 \), is a single arch: the entire rod cools slowly. The \( n=2 \) mode has a node at \( x = L/2 \): the left half cools while the right half also cools, each independently. Higher modes represent finer spatial structures that decay more rapidly.

## Superposition Principle

<div class="theorem"><strong>Theorem (Superposition).</strong> If \( u_1 \) and \( u_2 \) satisfy the homogeneous linear PDE \( Lu = 0 \) and homogeneous boundary conditions, then \( c_1 u_1 + c_2 u_2 \) is also a solution for any \( c_1, c_2 \in \mathbb{R} \). This property does not hold for nonhomogeneous equations \( Lu = g \) with \( g \ne 0 \), nor for nonhomogeneous boundary conditions.</div>

---

# Chapter 3: Steady-State Solutions and Boundary Conditions

## Equilibrium Temperature Distributions

A **steady-state** or **equilibrium** temperature distribution is one that is time-independent: \( u(x,t) = u_{eq}(x) \). Setting \( \partial u/\partial t = 0 \) in the 1D heat equation gives

\[
k \frac{d^2 u_{eq}}{dx^2} = 0 \implies \frac{d^2 u_{eq}}{dx^2} = 0 \implies u_{eq}(x) = C_1 x + C_2.
\]

The equilibrium solution is always linear in \( x \); the constants are determined by the boundary conditions.

For **Dirichlet conditions** \( u(0) = T_1 \), \( u(L) = T_2 \):

\[
u_{eq}(x) = T_1 + \frac{T_2 - T_1}{L} x.
\]

This is a linear interpolation between the two endpoint temperatures. We expect that all solutions to the heat equation with these boundary conditions will eventually approach this distribution.

## Mixed Boundary Conditions

For a **mixed** problem, say \( u(0) = T_1 \) (fixed temperature at the left) and \( u'(L) = 0 \) (insulated right end), the equilibrium is

\[
u_{eq}(x) = T_1,
\]

a uniform constant temperature. Physically, the insulated right end cannot lose heat, so in steady state the rod equilibrates to the temperature imposed at the left.

## Heat Sources

If a source term \( Q(x) \) is present, the equilibrium satisfies the ODE

\[
K_0 \frac{d^2 u_{eq}}{dx^2} = -Q(x),
\]

which may be integrated twice. The constants of integration are fixed by the boundary conditions.

<div class="example"><strong>Example (Linear Source).</strong> Let \( Q(x) = x \) on \( [0,1] \) with \( K_0 = 1 \) and Dirichlet conditions \( u(0) = u(1) = 0 \). The ODE is \( u'' = -x \). Integrating twice:

\[
u(x) = -\frac{x^3}{6} + C_1 x + C_2.
\]

The condition \( u(0) = 0 \) gives \( C_2 = 0 \). The condition \( u(1) = 0 \) gives \( C_1 = 1/6 \), so

\[
u_{eq}(x) = \frac{1}{6}(x - x^3) = \frac{x(1-x^2)}{6}.
\]

The flux at the endpoints is \( \phi(0) = -u'(0) = -1/6 \) and \( \phi(1) = -u'(1) = 1/3 \). The total rate of heat production is \( \int_0^1 x\, dx = 1/2 \). The net outward heat flow rate is \( \phi(1) - \phi(0) = 1/3 - (-1/6) = 1/2 \), confirming energy balance. \(\blacksquare\)</div>

## Non-existence of Steady State

If the rod is insulated at both ends (\( u'(0) = u'(L) = 0 \)) but has an internal source, energy accumulates indefinitely and no steady state exists. Mathematically, imposing \( u'(0) = 0 \) and \( u'(L) = 0 \) on the general solution \( u_{eq}' = -x^2/3 + C_1 \) forces \( C_1 = 0 \) and then \( L = 0 \), a contradiction. This confirms that heat production with no mechanism for escape precludes equilibrium.

## Nonhomogeneous Boundary Conditions via Change of Variables

Separation of variables requires **homogeneous** boundary conditions. For nonhomogeneous conditions \( u(0) = A \) and \( u(L) = B \), we write \( u(x,t) = u_{eq}(x) + v(x,t) \), where \( u_{eq}(x) = A + (B-A)x/L \) is the unique steady state. Then \( v \) satisfies the homogeneous conditions \( v(0) = v(L) = 0 \) and the same heat equation. We then expand \( v \) in Fourier sine series as before.

---

# Chapter 4: The Heat Equation — Neumann and Other Conditions

## Zero-Flux (Neumann) Boundary Conditions

Neumann boundary conditions model an **insulated** rod: no heat flows in or out through the endpoints. The problem is

\[
\frac{\partial u}{\partial t} = k \frac{\partial^2 u}{\partial x^2}, \quad
\frac{\partial u}{\partial x}(0,t) = 0, \quad \frac{\partial u}{\partial x}(L,t) = 0, \quad u(x,0) = f(x).
\]

Separation of variables with \( u = \phi(x) G(t) \) yields the same ODE for \( G(t) \), and the spatial problem

\[
\phi'' + \lambda \phi = 0, \quad \phi'(0) = 0, \quad \phi'(L) = 0.
\]

Applying the boundary conditions now gives the cosine eigenfunctions:

\[
\phi_n(x) = \cos\!\left(\frac{n\pi x}{L}\right), \quad \lambda_n = \frac{n^2\pi^2}{L^2}, \quad n = 0, 1, 2, \ldots
\]

Notice the crucial difference: the case \( n = 0 \) now produces the nontrivial eigenfunction \( \phi_0(x) = 1 \) (a constant) with eigenvalue \( \lambda_0 = 0 \). The time-dependent factor for \( n = 0 \) is \( G_0(t) = e^{0} = 1 \) — it does not decay. The general solution is

\[
u(x,t) = a_0 + \sum_{n=1}^{\infty} a_n \cos\!\left(\frac{n\pi x}{L}\right) e^{-k(n\pi/L)^2 t}.
\]

## Cosine Series and Conservation

The initial condition \( u(x,0) = f(x) \) requires a **Fourier cosine expansion**:

\[
f(x) = a_0 + \sum_{n=1}^{\infty} a_n \cos\!\left(\frac{n\pi x}{L}\right),
\]

with coefficients

\[
a_0 = \frac{1}{L} \int_0^L f(x)\, dx, \qquad a_n = \frac{2}{L} \int_0^L f(x) \cos\!\left(\frac{n\pi x}{L}\right) dx, \quad n \ge 1.
\]

As \( t \to \infty \), all the oscillatory terms decay and

\[
u(x,t) \to a_0 = \frac{1}{L} \int_0^L f(x)\, dx.
\]

This is the spatial **average** of the initial temperature, which is precisely what conservation of thermal energy predicts: with insulated ends, the total thermal energy \( \int_0^L u(x,t)\, dx \) is constant in time (no heat escapes), so the final uniform temperature must equal the mean of the initial distribution.

## Zero Eigenvalue and Non-uniqueness

The presence of \( \lambda_0 = 0 \) corresponds to the unique constant steady-state distribution \( u_{eq} = a_0 \). Unlike the Dirichlet problem (where \( u_{eq} = 0 \) is the only possibility), the Neumann problem admits a one-parameter family of steady states \( u_{eq} = C \) for any constant \( C \). The specific value to which the system evolves is determined solely by the initial data via conservation.

<div class="remark"><strong>Remark.</strong> Comparing Dirichlet and Neumann problems: In the Dirichlet case, the rod loses heat through the endpoints and all Fourier modes decay to zero. In the Neumann case, the zero mode \( a_0 \) never decays — thermal energy is conserved and the rod slowly equilibrates to a uniform temperature equal to the mean of the initial condition.</div>

---

# Chapter 5: The Heat Equation in Higher Dimensions

## Multidimensional Conservation Law

The derivation of the heat equation in higher dimensions follows the same logic as in one dimension, using the Divergence Theorem in place of the Fundamental Theorem of Calculus. Let \( u(\mathbf{x}, t) \) be the temperature at position \( \mathbf{x} \in \mathbb{R}^n \) and time \( t \). Let \( D \subset \mathbb{R}^n \) be an arbitrary region bounded by a surface \( S \).

The **heat flux vector** \( \Phi(\mathbf{x}, t) \) is defined so that \( \Phi \cdot \hat{n}\, dS \) is the rate of outward heat flow through the surface element \( dS \) with outward unit normal \( \hat{n} \). Conservation of thermal energy states:

\[
\frac{d}{dt} \iiint_D e\, dV = -\iint_S \Phi \cdot \hat{n}\, dS + \iiint_D Q\, dV.
\]

Applying the Divergence Theorem to the surface integral, and using the Du Bois-Reymond lemma on the resulting combined integral over the arbitrary region \( D \):

\[
\frac{\partial e}{\partial t} = -\nabla \cdot \Phi + Q.
\]

<div class="theorem"><strong>Theorem (Gauss Divergence Theorem).</strong> For a vector field \( \mathbf{F} \) and a region \( D \) bounded by a closed surface \( S \),
\[
\iint_S \mathbf{F} \cdot \hat{n}\, dS = \iiint_D \nabla \cdot \mathbf{F}\, dV.
\]
</div>

The multidimensional version of Fourier's law is

\[
\Phi = -K_0(\mathbf{x}) \nabla u,
\]

stating that heat flows in the direction of steepest temperature descent, at a rate proportional to the magnitude of the gradient. Substituting and using \( e = c\rho(u - u_0) \):

\[
c\rho \frac{\partial u}{\partial t} = \nabla \cdot (K_0 \nabla u) + Q.
\]

For a **homogeneous medium** with \( c, \rho, K_0 \) constant and no sources:

\[
\frac{\partial u}{\partial t} = k \nabla^2 u, \quad k = \frac{K_0}{c\rho}.
\]

The same argument for **diffusion** (using Fick's law \( \phi = -k\nabla u \)) yields the identical equation for concentration \( u \). Incorporating chemical reactions leads to **reaction-diffusion** equations such as

\[
\frac{\partial u}{\partial t} = k \nabla^2 u - K u^2,
\]

which is nonlinear. This illustrates why the linearity of transport laws is so valuable.

## 2D Heat Equation on a Rectangle

On the rectangle \( 0 \le x \le L \), \( 0 \le y \le H \) with all edges held at zero temperature, separation of variables \( u = f(x)g(y)h(t) \) gives three ODEs. The result is a doubly-indexed family of normal modes:

\[
u_{mn}(x,y,t) = \sin\!\left(\frac{m\pi x}{L}\right) \sin\!\left(\frac{n\pi y}{H}\right) e^{-k\lambda_{mn} t},
\]

where the **2D eigenvalues** are

\[
\lambda_{mn} = \frac{m^2\pi^2}{L^2} + \frac{n^2\pi^2}{H^2}, \quad m, n = 1, 2, 3, \ldots
\]

The general solution is a double Fourier series:

\[
u(x,y,t) = \sum_{m=1}^{\infty} \sum_{n=1}^{\infty} B_{mn} \sin\!\left(\frac{m\pi x}{L}\right) \sin\!\left(\frac{n\pi y}{H}\right) e^{-k\lambda_{mn} t}.
\]

The coefficients \( B_{mn} \) are determined from the initial condition by double orthogonality.

---

# Chapter 6: The Wave Equation

## Vibrating String: Derivation

Consider a uniform elastic string of length \( L \) stretched under tension \( T_0 \) and displaced slightly from its equilibrium position. Let \( u(x,t) \) denote the transverse displacement. Applying Newton's second law to a small element of the string of length \( \Delta x \) and mass \( \rho_0 \Delta x \) (where \( \rho_0 \) is the linear mass density), and assuming small displacements so that the horizontal component of tension is approximately constant, gives

\[
\rho_0 \frac{\partial^2 u}{\partial t^2} = T_0 \frac{\partial^2 u}{\partial x^2},
\]

or, defining \( c^2 = T_0/\rho_0 \) (the square of the **wave speed**),

\[
\frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}.
\]

This is the **1D wave equation**. For a string clamped at both ends: \( u(0,t) = u(L,t) = 0 \). Initial conditions specify both the shape and velocity: \( u(x,0) = \alpha(x) \) and \( u_t(x,0) = \beta(x) \).

## Normal Modes

Separating variables \( u(x,t) = \phi(x) h(t) \):

\[
\frac{h''(t)}{c^2 h(t)} = \frac{\phi''(x)}{\phi(x)} = -\lambda.
\]

The spatial problem is identical to the Dirichlet heat equation:

\[
\phi_n(x) = \sin\!\left(\frac{n\pi x}{L}\right), \quad \lambda_n = \frac{n^2\pi^2}{L^2}.
\]

The time equation \( h'' + c^2\lambda_n h = 0 \) has oscillatory solutions:

\[
h_n(t) = A_n \cos(\omega_n t) + B_n \sin(\omega_n t), \quad \omega_n = \frac{n\pi c}{L}.
\]

The **natural frequencies** are \( \omega_n = n\pi c / L \), \( n = 1, 2, 3, \ldots \). The fundamental frequency is \( \omega_1 = \pi c/L \), and higher modes are integer multiples thereof. This integer relationship — the **harmonic series** — is the mathematical basis of the musical overtones of a string instrument.

The general solution is:

\[
u(x,t) = \sum_{n=1}^{\infty} \sin\!\left(\frac{n\pi x}{L}\right) \left[ A_n \cos\!\left(\frac{n\pi c t}{L}\right) + B_n \sin\!\left(\frac{n\pi c t}{L}\right) \right],
\]

with \( A_n \) and \( B_n \) determined from the initial conditions by Fourier sine series.

## d'Alembert's Formula

The wave equation on the infinite line \( u_{tt} = c^2 u_{xx} \) admits a beautiful closed-form solution discovered by d'Alembert. Note that the PDE factors as

\[
\left(\frac{\partial}{\partial t} - c\frac{\partial}{\partial x}\right) \left(\frac{\partial}{\partial t} + c\frac{\partial}{\partial x}\right) u = 0.
\]

The general solution is a superposition of a **right-travelling wave** \( F(x - ct) \) and a **left-travelling wave** \( G(x+ct) \):

\[
u(x,t) = F(x - ct) + G(x + ct).
\]

Applying initial conditions \( u(x,0) = \alpha(x) \) and \( u_t(x,0) = \beta(x) \) gives **d'Alembert's formula**:

\[
u(x,t) = \frac{\alpha(x-ct) + \alpha(x+ct)}{2} + \frac{1}{2c} \int_{x-ct}^{x+ct} \beta(s)\, ds.
\]

![d'Alembert formula: two traveling waves](/pics/amath353/dalembert_solution.png)

The quantities \( \xi = x - ct \) and \( \eta = x + ct \) are the **characteristic variables**: the solution is constant along each characteristic. The **domain of dependence** of the point \( (x_0, t_0) \) is the interval \( [x_0 - ct_0, x_0 + ct_0] \): the value of \( u \) at \( (x_0, t_0) \) is determined solely by the initial data in this interval.

<div class="remark"><strong>Remark.</strong> The wave equation, unlike the heat equation, preserves sharp features: a discontinuity in the initial data propagates along characteristics at speed \( c \), remaining sharp for all time. This contrasts sharply with the heat equation, which instantly smooths all discontinuities.</div>

## 2D Wave Equation: Vibrating Membrane

The equation \( u_{tt} = c^2 \nabla^2 u \) in two spatial dimensions models a thin elastic membrane. For a rectangular membrane \( [0,L] \times [0,H] \) clamped at all edges, separation of variables \( u = f(x)g(y)h(t) \) yields doubly-indexed normal modes with frequencies \( \omega_{mn} = c\sqrt{\lambda_{mn}} \), where \( \lambda_{mn} = (m\pi/L)^2 + (n\pi/H)^2 \). Unlike the string, these frequencies are generally not integer multiples of one another, which accounts for the inharmonic sound of drums.

---

# Chapter 7: Laplace's Equation and Harmonic Functions

## Motivation

Laplace's equation \( \nabla^2 u = 0 \) arises as the steady-state limit of the heat equation, as well as in electrostatics (electric potential \( V \) satisfies \( \nabla^2 V = -\rho/\varepsilon_0 \)), irrotational fluid flow, and gravitational potential theory. Solutions are called **harmonic functions**.

## Rectangle: Separation of Variables

Consider \( \nabla^2 u = 0 \) on \( 0 \le x \le L \), \( 0 \le y \le H \) with prescribed boundary temperatures. With four nonhomogeneous conditions, the approach is to decompose \( u = u_1 + u_2 + u_3 + u_4 \), where each \( u_i \) satisfies one nonhomogeneous condition and three zero conditions.

For \( u_1 \), with \( u_1(x,0) = f_1(x) \) and the other three sides at zero, write \( u_1 = h(x)\phi(y) \). Separating:

\[
\frac{h''}{h} = -\frac{\phi''}{\phi} = -\lambda.
\]

The \( h \)-equation with zero boundary conditions at \( x = 0 \) and \( x = L \) gives \( h_n = \sin(n\pi x/L) \) and \( \lambda_n = (n\pi/L)^2 \). The \( \phi \)-equation is then \( \phi'' - (n\pi/L)^2 \phi = 0 \) with \( \phi(H) = 0 \). The solution convenient for imposing the boundary condition at \( y = H \) is

\[
\phi_n(y) = \sinh\!\left(\frac{n\pi}{L}(y - H)\right).
\]

The complete solution for \( u_1 \) is

\[
u_1(x,y) = \sum_{n=1}^{\infty} a_n \sin\!\left(\frac{n\pi x}{L}\right) \sinh\!\left(\frac{n\pi(y-H)}{L}\right),
\]

where the coefficients are

\[
a_n = \frac{-2}{L \sinh(n\pi H/L)} \int_0^L f_1(x) \sin\!\left(\frac{n\pi x}{L}\right) dx.
\]

![Temperature solution on rectangle](/pics/amath353/laplace_rectangle.png)

## Laplace's Equation on a Disk: Poisson Formula

For a circular disk of radius \( a \), it is natural to use polar coordinates \( (r,\theta) \). Laplace's equation becomes

\[
\frac{1}{r}\frac{\partial}{\partial r}\!\left(r \frac{\partial u}{\partial r}\right) + \frac{1}{r^2}\frac{\partial^2 u}{\partial \theta^2} = 0.
\]

We seek \( u(r,\theta) \) satisfying the boundary condition \( u(a,\theta) = f(\theta) \) and the conditions of **boundedness** at \( r = 0 \) and **periodicity** in \( \theta \): \( u(r,-\pi) = u(r,\pi) \).

Setting \( u = G(r)\phi(\theta) \) and separating:

\[
\frac{r}{G}\frac{d}{dr}\!\left(r G'\right) = -\frac{\phi''}{\phi} = \mu_n = n^2, \quad n = 0, 1, 2, \ldots
\]

The periodicity condition on \( \phi \) forces \( \mu = n^2 \) for integer \( n \), with solutions \( \phi_n(\theta) = a_n \cos n\theta + b_n \sin n\theta \). The \( G \)-equation, a **Cauchy-Euler** equation, has solutions \( r^n \) and \( r^{-n} \). Boundedness at \( r = 0 \) excludes \( r^{-n} \) for \( n \ge 1 \). The general bounded solution is

\[
u(r,\theta) = a_0 + \sum_{n=1}^{\infty} r^n \bigl(a_n \cos n\theta + b_n \sin n\theta\bigr).
\]

Applying the boundary condition \( u(a,\theta) = f(\theta) \) and extracting the Fourier coefficients gives the **Poisson integral formula** (after summing the resulting geometric series):

\[
u(r,\theta) = \frac{a^2 - r^2}{2\pi} \int_{-\pi}^{\pi} \frac{f(\theta')}{a^2 - 2ar\cos(\theta - \theta') + r^2}\, d\theta'.
\]

The kernel \( P(r, \theta - \theta') = (a^2 - r^2) / (a^2 - 2ar\cos(\theta-\theta') + r^2) \) is called the **Poisson kernel**.

<div class="theorem"><strong>Theorem (Mean Value Property).</strong> If \( u \) is harmonic on a disk of radius \( a \) centred at the origin, then the value of \( u \) at the centre equals the average of \( u \) over the boundary circle:
\[
u(0) = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(\theta)\, d\theta.
\]
This follows from the Poisson formula by setting \( r = 0 \).
</div>

<div class="theorem"><strong>Theorem (Maximum Principle).</strong> A harmonic function on a bounded domain attains its maximum and minimum on the boundary, not in the interior (unless \( u \) is constant). This immediately implies uniqueness of solutions to Laplace's equation with Dirichlet boundary conditions.</div>

---

# Chapter 8: Sturm-Liouville Theory and the Rayleigh Quotient

## The General Sturm-Liouville Problem

The separation of variables procedure applied to PDEs with non-constant coefficients (e.g., a non-uniform rod with spatially varying \( K_0(x) \), \( c(x) \), \( \rho(x) \)) produces an ODE of the form

\[
\frac{d}{dx}\!\left(p(x) \frac{d\phi}{dx}\right) + q(x)\phi + \lambda \sigma(x) \phi = 0, \quad a < x < b,
\]

with homogeneous boundary conditions

\[
\beta_1 \phi(a) + \beta_2 \phi'(a) = 0, \qquad \beta_3 \phi(b) + \beta_4 \phi'(b) = 0.
\]

This is the **regular Sturm-Liouville eigenvalue problem**, provided \( p(x) > 0 \), \( \sigma(x) > 0 \), and \( p, q, \sigma \) satisfy appropriate smoothness conditions on \( [a,b] \). The standard Fourier problems (sine series, cosine series, full Fourier series) are all special cases corresponding to \( p = 1 \), \( q = 0 \), \( \sigma = 1 \).

<div class="theorem"><strong>Theorem (Sturm-Liouville).</strong> For a regular Sturm-Liouville problem:
<ol>
<li>All eigenvalues \( \lambda_n \) are real.</li>
<li>There are infinitely many eigenvalues: \( \lambda_1 < \lambda_2 < \cdots \), with \( \lambda_n \to \infty \).</li>
<li>The eigenfunction \( \phi_n \) associated with \( \lambda_n \) has exactly \( n-1 \) zeros in \( (a,b) \).</li>
<li>The eigenfunctions are orthogonal with weight \( \sigma(x) \):
\[
\int_a^b \phi_m(x) \phi_n(x) \sigma(x)\, dx = 0 \quad \text{for } m \ne n.
\]</li>
<li>The eigenfunctions form a complete set (basis) for \( L^2_\sigma[a,b] \).</li>
</ol>
</div>

The orthogonality with weight \( \sigma \) arises because the Sturm-Liouville operator \( L = -\frac{d}{dx}(p\frac{d}{dx}) - q \) is **self-adjoint** with respect to the weighted inner product \( \langle f, g \rangle = \int_a^b fg\sigma\, dx \).

## The Rayleigh Quotient

The **Rayleigh quotient** provides a variational characterisation of eigenvalues. For the simplified problem \( \phi'' + \lambda \sigma(x)\phi = 0 \), \( \phi(a) = \phi(b) = 0 \), one multiplies by \( \phi \) and integrates by parts to obtain

\[
\lambda = \frac{\int_a^b (\phi')^2\, dx}{\int_a^b \phi^2 \sigma(x)\, dx} = \text{RQ}(\phi).
\]

For the general Sturm-Liouville equation, the Rayleigh quotient is

\[
\text{RQ}(u) = \frac{-pu\,\frac{du}{dx}\Big|_a^b + \int_a^b \left[p(u')^2 - qu^2\right] dx}{\int_a^b u^2 \sigma\, dx}.
\]

<div class="theorem"><strong>Theorem (Variational Characterisation).</strong> The lowest eigenvalue \( \lambda_1 \) is the minimum of the Rayleigh quotient over all admissible functions:
\[
\lambda_1 = \min\!\left\{\,\text{RQ}(u) \;\Big|\; u \text{ piecewise } C^1, \text{ satisfies BCs}\right\}.
\]
Any trial function \( u_T \) satisfying the boundary conditions yields \( \text{RQ}(u_T) \ge \lambda_1 \): the Rayleigh quotient provides an upper bound.
</div>

<div class="example"><strong>Example (Rayleigh Quotient Estimates).</strong> For \( \phi'' + \lambda\phi = 0 \), \( \phi(0) = \phi(1) = 0 \), the exact first eigenvalue is \( \lambda_1 = \pi^2 \approx 9.8696 \).

- Trial function \( u_T = x(1-x) \): \( \text{RQ} = 10 \), relative error 1.3%.
- Hat function \( u_T \) (piecewise linear): \( \text{RQ} = 12 \), relative error 21%.
- Exact eigenfunction \( u_T = \sin\pi x \): \( \text{RQ} = \pi^2 \) exactly.

For the perturbed problem \( u'' + \lambda(1 + x/10)u = 0 \) on \( [0,\pi] \), the exact \( \lambda_1 \approx 0.8635 \), and the trial function \( \sin x \) gives \( \text{RQ} \approx 0.8642 \), an excellent approximation. \(\blacksquare\)</div>

## Connection to Quantum Mechanics

In quantum mechanics, the time-independent **Schrödinger equation** in one dimension is

\[
-\frac{\hbar^2}{2m} \psi''(x) + V(x)\psi(x) = E\psi(x),
\]

which is exactly a Sturm-Liouville eigenvalue problem with \( p = \hbar^2/(2m) \), \( q = -V(x) \), \( \sigma = 1 \), and eigenvalue \( E \) (the energy). The eigenfunctions \( \psi_n \) are the stationary states (orbitals) and the eigenvalues \( E_n \) are the allowed energy levels. The Rayleigh quotient in this context is the expectation value of the kinetic energy, providing a rigorous basis for the variational principle widely used in computational chemistry.

<div class="remark"><strong>Remark.</strong> The Sturm-Liouville framework developed here recurs in Chapter 9 when we treat the circular membrane, where Bessel's equation plays the role of the eigenvalue problem. The weight function \( \sigma = r \) (arising from the Jacobian in polar coordinates) produces orthogonality of Bessel functions.</div>

---

# Chapter 9: The Circular Membrane and Bessel Functions

## 2D Wave Equation in Polar Coordinates

The vibration of a circular drum membrane of radius \( a \) is described by

\[
\frac{\partial^2 u}{\partial t^2} = c^2 \nabla^2 u = c^2\!\left(\frac{\partial^2 u}{\partial r^2} + \frac{1}{r}\frac{\partial u}{\partial r} + \frac{1}{r^2}\frac{\partial^2 u}{\partial \theta^2}\right),
\]

on \( 0 \le r \le a \), \( -\pi \le \theta \le \pi \), with boundary condition \( u(a,\theta,t) = 0 \) (clamped edge) and initial conditions on displacement and velocity.

## Separation of Variables

We try \( u(r,\theta,t) = f(r)g(\theta)h(t) \). The time equation gives

\[
h''(t) + \lambda c^2 h(t) = 0 \implies h(t) = \cos(\sqrt{\lambda}\, ct) \text{ or } \sin(\sqrt{\lambda}\, ct),
\]

confirming oscillatory motion. The spatial factor satisfies \( \nabla^2\phi + \lambda\phi = 0 \) with \( \phi = f(r)g(\theta) \). Separating further:

\[
\frac{1}{\phi}\!\left(rf\right)'' / (rf) = -\frac{g''}{g} = m^2, \quad m = 0, 1, 2, \ldots
\]

The periodicity condition on \( g(\theta) \) forces \( m \) to be a non-negative integer, with

\[
g_m(\theta) = a_m \cos(m\theta) + b_m \sin(m\theta).
\]

The radial equation becomes

\[
r^2 f'' + r f' + (\lambda r^2 - m^2) f = 0,
\]

which, under the substitution \( s = \sqrt{\lambda}\, r \), transforms to **Bessel's equation of order \( m \)**:

\[
s^2 F'' + s F' + (s^2 - m^2) F = 0.
\]

## Bessel Functions

<div class="definition"><strong>Definition (Bessel Functions of the First Kind).</strong> The <em>Bessel function of the first kind of order \( m \)</em>, denoted \( J_m(s) \), is the bounded solution to Bessel's equation. It has the series representation

\[
J_m(s) = \sum_{k=0}^{\infty} \frac{(-1)^k}{k!\,\Gamma(m+k+1)} \left(\frac{s}{2}\right)^{m+2k}.
\]
</div>

The Bessel function \( Y_m(s) \) of the second kind is singular at \( s = 0 \); it is excluded by the boundedness condition \( |u(0,\theta,t)| < \infty \). Thus \( f_{mn}(r) = J_m(\sqrt{\lambda_{mn}}\, r) \).

The boundary condition \( u(a,\theta,t) = 0 \) requires \( J_m(\sqrt{\lambda_{mn}}\, a) = 0 \), so \( \sqrt{\lambda_{mn}}\, a = z_{mn} \), where \( z_{mn} \) is the \( n \)-th positive zero of \( J_m \). The eigenvalues are

\[
\lambda_{mn} = \left(\frac{z_{mn}}{a}\right)^2.
\]

The natural frequencies are \( \omega_{mn} = c\sqrt{\lambda_{mn}} = cz_{mn}/a \).

## Normal Modes of the Circular Drum

The normal modes are

\[
u_{mn}(r,\theta,t) = J_m\!\left(\frac{z_{mn}}{a} r\right) (a_m \cos m\theta + b_m \sin m\theta) \cos(\omega_{mn} t).
\]

![J_0, J_1, J_2 and drum normal modes](/pics/amath353/bessel_circular_drum.png)

**Radially symmetric modes (\( m = 0 \)):** The mode \( u_{0n} = J_0(z_{0n} r/a) \cos(\omega_{0n} t) \). Since \( J_0 > 0 \) for \( 0 \le s < z_{0,1} \approx 2.405 \), the first mode (\( n=1 \)) has the entire membrane oscillating up and down uniformly — the two-dimensional analogue of the fundamental mode of a string. For \( n = 2 \), a nodal circle at radius \( r = (z_{0,1}/z_{0,2}) a \approx 0.44a \) divides the membrane into inner and outer regions oscillating out of phase.

**Modes with angular dependence (\( m \ge 1 \)):** The factor \( \cos(m\theta) \) introduces \( m \) nodal lines (diameters). For example, \( m = 1 \), \( n = 1 \) gives one nodal diameter, dividing the drum into two halves.

<div class="theorem"><strong>Theorem (Orthogonality of Bessel Functions).</strong> For fixed \( m \), the functions \( J_m(z_{mn} r/a) \) are orthogonal on \( [0,a] \) with weight \( r \):
\[
\int_0^a J_m\!\left(\frac{z_{mn} r}{a}\right) J_m\!\left(\frac{z_{mk} r}{a}\right) r\, dr = 0 \quad \text{for } n \ne k.
\]
</div>

The weight \( r \) arises from the area element \( r\, dr\, d\theta \) in polar coordinates and is the manifestation of the Sturm-Liouville weight function \( \sigma = r \) in this context.

---

# Chapter 10: Fourier Transforms and the Heat Equation on \( \mathbb{R} \)

## From Fourier Series to Fourier Transforms

On a finite interval \( [-L, L] \), a function can be expanded in a Fourier series. As \( L \to \infty \), the discrete set of frequencies \( \omega_n = n\pi/L \) becomes a continuum, and the series becomes an integral. This limiting process motivates the **Fourier transform**.

<div class="definition"><strong>Definition (Fourier Transform).</strong> For a function \( f : \mathbb{R} \to \mathbb{R} \), its Fourier transform is

\[
F(\omega) = \mathcal{F}\{f\}(\omega) = \frac{1}{2\pi} \int_{-\infty}^{\infty} f(x)\, e^{i\omega x}\, dx,
\]

and the inverse Fourier transform is

\[
f(x) = \mathcal{F}^{-1}\{F\}(x) = \int_{-\infty}^{\infty} F(\omega)\, e^{-i\omega x}\, d\omega.
\]
</div>

**Key properties** of the Fourier transform:

- **Linearity:** \( \mathcal{F}\{af + bg\} = a\mathcal{F}\{f\} + b\mathcal{F}\{g\} \).
- **Derivative:** \( \mathcal{F}\{\partial f/\partial x\} = -i\omega\, F(\omega) \), and iterating: \( \mathcal{F}\{\partial^2 f/\partial x^2\} = -\omega^2 F(\omega) \).
- **Convolution:** \( \mathcal{F}\{f * g\} = 2\pi\, \mathcal{F}\{f\} \cdot \mathcal{F}\{g\} \), where the convolution is \( (f*g)(x) = \int_{-\infty}^\infty f(x-s)g(s)\, ds \).

## Solution of the Heat Equation on \( \mathbb{R} \)

The 1D heat equation on the whole real line with initial condition \( u(x,0) = f(x) \) is

\[
\frac{\partial u}{\partial t} = k\frac{\partial^2 u}{\partial x^2}, \quad x \in (-\infty,\infty), \quad u(x,t) \to 0 \text{ as } x \to \pm\infty.
\]

Taking the Fourier transform in \( x \) and using the derivative property:

\[
\frac{\partial U(\omega,t)}{\partial t} = -k\omega^2 U(\omega,t),
\]

where \( U(\omega,t) = \mathcal{F}\{u(\cdot,t)\}(\omega) \). This is a simple first-order ODE in \( t \) with solution

\[
U(\omega,t) = U(\omega,0)\, e^{-k\omega^2 t} = \mathcal{F}\{f\}(\omega)\, e^{-k\omega^2 t}.
\]

To invert, note that \( e^{-k\omega^2 t} \) is the Fourier transform (up to normalisation) of a Gaussian. Using the convolution theorem, the solution is

\[
u(x,t) = \int_{-\infty}^{\infty} f(s)\, h_t(x-s)\, ds = (f * h_t)(x),
\]

where the **heat kernel** (fundamental solution) is

\[
h_t(x) = \frac{1}{\sqrt{4\pi kt}}\, e^{-x^2/(4kt)}, \quad t > 0.
\]

![Gaussian heat kernel at different times](/pics/amath353/heat_kernel.png)

<div class="theorem"><strong>Theorem (Heat Kernel).</strong> The heat kernel \( h_t(x) \) has the following properties:
<ul>
<li>\( h_t(x) > 0 \) for all \( x \in \mathbb{R} \) and \( t > 0 \): diffusion immediately spreads everywhere.</li>
<li>\( \int_{-\infty}^\infty h_t(x)\, dx = 1 \) for all \( t > 0 \): total "probability" is conserved.</li>
<li>As \( t \to 0^+ \), \( h_t(x) \to \delta(x) \): the Gaussian concentrates to a spike.</li>
<li>The width of the Gaussian grows as \( \sqrt{4kt} \): the characteristic diffusion length scales as \( \sqrt{t} \).</li>
</ul>
</div>

<div class="remark"><strong>Remark.</strong> The heat kernel is the fundamental solution: if the initial condition is a point source \( f(x) = \delta(x - x_0) \), then \( u(x,t) = h_t(x - x_0) \). By superposition (convolution), the solution for any initial condition is a weighted average of these point-source solutions.</div>

---

# Chapter 11: The Dirac Delta and Distributions

## The Dirac Delta "Function"

The **Dirac delta** \( \delta(x) \) is not a function in the classical sense. It is defined by its action under integration: for any continuous \( f \),

\[
\int_{-\infty}^{\infty} f(x)\, \delta(x)\, dx = f(0), \qquad \int_{-\infty}^{\infty} f(x)\, \delta(x-x_0)\, dx = f(x_0).
\]

This **sifting property** expresses the fact that \( \delta(x - x_0) \) is a point mass concentrated at \( x_0 \). Informally, \( \delta(x) = 0 \) for \( x \ne 0 \) and \( \delta(0) = \infty \), with \( \int \delta(x)\, dx = 1 \).

The delta function is an example of a **distribution** (generalised function) — an object defined by its integration properties rather than pointwise values.

## Fourier Transform of the Delta Function

Applying the definition of the Fourier transform directly:

\[
\mathcal{F}\{\delta(x)\}(\omega) = \frac{1}{2\pi} \int_{-\infty}^{\infty} \delta(x)\, e^{i\omega x}\, dx = \frac{1}{2\pi}.
\]

This is a remarkable result: a perfectly localised spike in space (\( \delta(x) \)) transforms to a perfectly uniform function in frequency space (\( 1/(2\pi) \)). Conversely, if \( F(\omega) = \delta(\omega) \), then

\[
f(x) = \int_{-\infty}^{\infty} \delta(\omega)\, e^{-i\omega x}\, d\omega = 1,
\]

a uniform function in space. This duality illustrates the **Heisenberg uncertainty principle**: a function that is perfectly concentrated in one domain is necessarily spread out in the other.

## Integral Representation and Completeness

Substituting \( f(x) = \delta(x) \) and \( F(\omega) = 1/(2\pi) \) into the inverse Fourier transform formula yields the **integral representation** of the delta function:

\[
\delta(x) = \frac{1}{2\pi} \int_{-\infty}^{\infty} e^{-i\omega x}\, d\omega,
\]

or, with a shift,

\[
\delta(x - x_0) = \frac{1}{2\pi} \int_{-\infty}^{\infty} e^{-i\omega(x - x_0)}\, d\omega.
\]

This can be viewed as a **completeness** or **resolution of the identity** relation: expressing the kernel of the identity operator in terms of the plane wave basis \( \{e^{-i\omega x}\}_{\omega \in \mathbb{R}} \). The discrete analogue is

\[
\delta(x - x_0) = \sum_{n=1}^{\infty} \chi_n(x_0)\, \chi_n(x),
\]

where \( \{\chi_n\} \) is an orthonormal basis on an interval — this is the **eigenfunction expansion** of the delta function, fundamental to Green's function theory.

## Green's Functions

The connection to PDEs: to solve \( Lu = f \) where \( L \) is a linear differential operator, one seeks the **Green's function** \( G(x, x_0) \) satisfying \( LG = \delta(x - x_0) \) with appropriate boundary conditions. The solution is then

\[
u(x) = \int G(x, x_0)\, f(x_0)\, dx_0.
\]

The heat kernel \( h_t(x - s) \) is precisely the Green's function of the heat operator \( \partial_t - k\partial_{xx} \) on the real line.

## Two-Dimensional Fourier Transform

For \( f : \mathbb{R}^2 \to \mathbb{R} \), the 2D Fourier transform is

\[
F(\omega_1, \omega_2) = \frac{1}{(2\pi)^2} \iint_{\mathbb{R}^2} f(x_1,x_2)\, e^{i(\omega_1 x_1 + \omega_2 x_2)}\, dx_1\, dx_2 = \frac{1}{(2\pi)^2} \int_{\mathbb{R}^2} f(\mathbf{r})\, e^{i\boldsymbol{\omega}\cdot\mathbf{r}}\, d\mathbf{r},
\]

with inverse \( f(\mathbf{x}) = \int_{\mathbb{R}^2} F(\boldsymbol{\omega})\, e^{-i\boldsymbol{\omega}\cdot\mathbf{x}}\, d\boldsymbol{\omega} \). The factored structure allows the 2D problem to be treated as two successive 1D transforms, one in each variable.

---

# Chapter 12: Method of Characteristics

## First-Order Linear PDEs

The **method of characteristics** reduces a first-order PDE to a system of ODEs. Consider the linear PDE

\[
\frac{\partial u}{\partial t} + c(x,t) \frac{\partial u}{\partial x} = Q(x,t,u).
\]

Along a curve \( x = x(t) \), the total derivative of \( u \) is

\[
\frac{du}{dt} = \frac{\partial u}{\partial t} + \frac{dx}{dt}\frac{\partial u}{\partial x}.
\]

If we choose the curve so that \( dx/dt = c \), then \( du/dt = Q \). The PDE reduces to the **characteristic equations**:

\[
\frac{dx}{dt} = c(x,t), \qquad \frac{du}{dt} = Q(x,t,u).
\]

The first equation defines the **characteristic curves** in the \( (x,t) \)-plane; along each characteristic, the second equation is an ODE for \( u \).

## Quasilinear PDEs

For a **quasilinear** equation \( u_t + c(u,x,t)\, u_x = Q(u,x,t) \), the characteristics depend on the solution itself. The same procedure gives

\[
\frac{dx}{dt} = c(u,x,t), \qquad \frac{du}{dt} = Q(u,x,t).
\]

## Traffic Flow

The method of characteristics finds its most vivid application in one-dimensional **traffic flow**. Let \( \rho(x,t) \) be the traffic density (cars per unit length) and \( q(x,t) \) the flux (cars per unit time). Conservation of cars on any interval \( [a,b] \) gives

\[
\frac{\partial \rho}{\partial t} + \frac{\partial q}{\partial x} = 0.
\]

Assuming the velocity \( u = u(\rho) \) is a decreasing function of density (dense traffic is slow), the flux is \( q = \rho u(\rho) = q(\rho) \). The conservation equation becomes

\[
\frac{\partial \rho}{\partial t} + q'(\rho)\frac{\partial \rho}{\partial x} = 0, \qquad c(\rho) = q'(\rho).
\]

This is a **quasilinear PDE**. The characteristic equations are \( d\rho/dt = 0 \) and \( dx/dt = c(\rho) \). Since \( \rho \) is constant along characteristics, \( c(\rho) \) is also constant, so the **characteristics are straight lines**:

\[
x(t) = c(\rho(x_0, 0))\, t + x_0.
\]

![Method of characteristics for traffic flow](/pics/amath353/characteristics_traffic.png)

## The Greenshields Model

A simple model for velocity: \( u(\rho) = u_{\max}(1 - \rho/\rho_{\max}) \), giving

\[
q(\rho) = u_{\max} \rho\!\left(1 - \frac{\rho}{\rho_{\max}}\right), \qquad c(\rho) = u_{\max}\!\left(1 - \frac{2\rho}{\rho_{\max}}\right).
\]

Note that \( c(\rho) \) can be negative for \( \rho > \rho_{\max}/2 \), corresponding to regions of very dense traffic where disturbances propagate backwards (upstream). This is the physical basis of traffic jams that move against the direction of travel.

## Shock Waves and the Rankine-Hugoniot Condition

When initial data has a region where \( \rho(x_0, 0) > \rho(x_1, 0) \) for \( x_0 < x_1 \), the characteristics from \( x_0 \) and \( x_1 \) may converge and eventually intersect. At the intersection, \( \rho \) becomes multi-valued — the solution breaks down. This is the formation of a **shock wave**: a discontinuity in \( \rho \).

The physically correct way to handle shocks is to allow discontinuous solutions and enforce the **Rankine-Hugoniot condition**, which states that the speed \( V_s \) of the shock satisfies

\[
V_s = \frac{q(\rho_R) - q(\rho_L)}{\rho_R - \rho_L},
\]

where \( \rho_L \) and \( \rho_R \) are the densities immediately to the left and right of the shock. This condition arises from demanding that the integral (weak) form of the conservation law hold across the discontinuity.

<div class="example"><strong>Example (Traffic Light).</strong> At \( t = 0 \), traffic is stopped at a red light: \( \rho(x,0) = \rho_{\max} \) for \( x < 0 \) (jammed behind light) and \( \rho(x,0) = 0 \) for \( x > 0 \) (empty road ahead). When the light turns green, the characteristics from the left have slope \( c(\rho_{\max}) = -u_{\max} \) (negative) and from the right have slope \( c(0) = u_{\max} \) (positive). The characteristics fan outward, creating a <strong>rarefaction wave</strong> — a region of expanding, smoothly varying density. This is the opposite of a shock: the solution remains continuous but the density gradient spreads out in time. \(\blacksquare\)</div>

<div class="remark"><strong>Remark.</strong> The method of characteristics illustrates a deep structural difference between first-order PDEs and the second-order equations studied earlier in the course. First-order equations propagate information along characteristic curves; the PDE solution is — in a precise sense — "nothing but" the propagation of initial data along these curves.</div>

---

# Appendix: Electrostatics and the Divergence Theorem

The material in the appendix (Set 2) establishes the Gauss Divergence Theorem and uses it to prove Gauss' Law in electrostatics — an important model for how flux integrals underlie PDEs.

## Gauss' Law from the Divergence Theorem

For a point charge \( Q \) at the origin, the electrostatic field is

\[
\mathbf{E}(\mathbf{r}) = \frac{Q}{4\pi\varepsilon_0} \frac{\mathbf{r}}{r^3}.
\]

It can be shown that \( \nabla \cdot \mathbf{E} = 0 \) everywhere except at the origin. For a sphere \( S_R \) of radius \( R \), the outward flux is

\[
\iint_{S_R} \mathbf{E} \cdot \hat{n}\, dS = \frac{Q}{\varepsilon_0},
\]

independent of \( R \). For an arbitrary surface \( S \) enclosing \( Q \), we introduce a small sphere \( S_\epsilon \) around the charge, apply the Divergence Theorem to the region between the two surfaces (where \( \nabla \cdot \mathbf{E} = 0 \)), and conclude that the flux through \( S \) equals \( Q/\varepsilon_0 \). This is **Gauss' Law**.

In differential form, for a continuous charge distribution \( \rho(\mathbf{r}) \):

\[
\nabla \cdot \mathbf{E} = \frac{\rho}{\varepsilon_0}.
\]

Writing \( \mathbf{E} = -\nabla V \) yields **Poisson's equation** for the electrostatic potential:

\[
\nabla^2 V = -\frac{\rho}{\varepsilon_0}.
\]

This is a fundamental PDE of physics, derivable from Gauss' Law and the Divergence Theorem — the same combination of physical conservation and mathematical machinery that underlies all PDEs studied in this course. The recurring theme: **PDE = conservation law + constitutive relation**.

---

# Summary and Connections

## The Three Canonical PDEs: A Unified View

The three canonical second-order linear PDEs — heat, wave, and Laplace — share a common origin in conservation laws but differ in their time structure:

| PDE | Type | Time | Character |
|-----|------|------|-----------|
| \( u_t = k\nabla^2 u \) | Parabolic | First order | Irreversible diffusion |
| \( u_{tt} = c^2\nabla^2 u \) | Hyperbolic | Second order | Reversible propagation |
| \( \nabla^2 u = 0 \) | Elliptic | None | Equilibrium |

Each was derived from a conservation law (of thermal energy, of momentum, or as a steady state) combined with a constitutive relation (Fourier's law, Newton's second law, or no-source condition). This structure — conservation + constitutive relation — is the template for PDE modelling throughout applied mathematics.

## Fourier's Vision

Joseph Fourier's 1822 treatise *Théorie analytique de la chaleur* introduced the heat equation and the technique of expanding solutions in trigonometric series. The key insight — now called the **completeness** of the trigonometric system — is that virtually any function can be represented as an infinite sum of sines and cosines. This is the foundation of:

- The solution by Fourier sine/cosine series for the heat equation on \( [0,L] \).
- The Poisson integral formula for Laplace's equation on a disk.
- The normal mode decomposition of the wave equation.
- The Fourier transform and the heat kernel on \( \mathbb{R} \).

## Eigenvalues and Physical Quantisation

The discretisation of the separation constant — the appearance of a countable set of eigenvalues \( \lambda_1 < \lambda_2 < \cdots \) — is a mathematical reflection of a physical fact: **bounded domains select preferred frequencies**. This appears in:

- The natural frequencies \( \omega_n = n\pi c/L \) of a vibrating string.
- The energy levels \( E_n \propto n^2 \) of a particle in a box (quantum mechanics).
- The zeros \( z_{mn} \) of Bessel functions determining the drum's frequencies.

All of these are manifestations of the Sturm-Liouville theory developed in Chapter 8. The elegant mathematics — self-adjoint operators, orthogonal eigenfunctions, complete bases — underlies both classical and quantum mechanics.

## From Finite to Infinite: The Fourier Transform

The passage from Fourier series (finite interval) to Fourier transforms (whole real line) replaces a discrete sum over integers by a continuous integral over frequencies. The key parallel:

- Orthogonal eigenfunctions \( \phi_n(x) = \sin(n\pi x/L) \) become plane waves \( e^{-i\omega x} \).
- Coefficients \( c_n \) become the transform function \( F(\omega) \).
- Completeness (Parseval's theorem) in the discrete case becomes the Plancherel theorem in the continuous case.
- The Dirac delta \( \delta(x-x_0) \) is the continuous analogue of the Kronecker delta, expressing the completeness of the plane wave basis.

## Nonlinearity and Shocks

The course ends with first-order quasilinear PDEs and the method of characteristics, introducing the qualitatively new phenomenon of **shock waves**. The linearity enjoyed throughout Chapters 2–11 fails dramatically: nonlinear equations can develop singularities (shocks) in finite time from smooth initial data. The Rankine-Hugoniot condition, derived from the integral form of the conservation law, provides the unique physically consistent shock speed. Traffic flow is a prototype, but the same mathematics governs gas dynamics, water waves, and many other physical systems.

## Remarks on Well-Posedness

Well-posedness (existence, uniqueness, continuous dependence on data) was verified in each chapter:

- For the heat equation with Dirichlet BCs: the Fourier sine series converges and provides a unique smooth solution; small changes in \( f(x) \) produce small changes in \( u(x,t) \).
- For the wave equation: the d'Alembert formula gives explicit existence and uniqueness; stability follows from the energy estimate.
- For Laplace's equation: uniqueness follows from the maximum principle; existence requires more work (generally an integral equation).
- For the heat equation on \( \mathbb{R} \): the convolution formula \( u = f * h_t \) is explicit; \( h_t \in L^1(\mathbb{R}) \) with \( \|h_t\|_1 = 1 \) gives \( \|u(\cdot,t)\|_\infty \le \|f\|_\infty \).

This consistency between physical intuition and mathematical structure — instability in the heat equation run backward in time, the finite speed of wave propagation, the smoothing property of diffusion — is part of what makes PDEs such a powerful and intellectually satisfying subject.
