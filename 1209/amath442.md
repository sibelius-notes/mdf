---
title: "AMATH 442: Computational Methods for PDEs"
layout: toc
parent: Fall 2020
prof: Sander Rhebergen
---

<style>
.embed-container {
  position: relative;
  padding-bottom: 56.25%;
  height: 0;
  overflow: hidden;
  max-width: 100%;
}
.embed-container iframe,
.embed-container object,
.embed-container embed {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
</style>

# AMATH 442: Computational Methods for Partial Differential Equations

These notes cover the core numerical methods for solving partial differential equations (PDEs), developed in AMATH 442/642 at the University of Waterloo. Mathematical models based on PDEs arise throughout science, engineering, finance, and economics. When exact solutions are unavailable, we rely on numerical approximations computed on a computer. The goal is threefold: to understand the theory of numerical methods (with derivations and proofs), to implement them computationally, and to apply them to problems in fluid mechanics, diffusion, wave propagation, and related fields.

The course covers:
- **Section 2**: The continuous Galerkin (CG) finite element method for an elliptic PDE in 1D
- **Section 3**: The CG finite element method for a time-dependent parabolic PDE in 1D
- **Section 4**: Well-posedness and error analysis of the finite element method
- **Section 5**: The CG finite element method for an elliptic PDE in 2D
- **Section 6**: The discontinuous Galerkin (DG) finite element method for scalar hyperbolic conservation laws in 1D
- **Section 7**: Systems of hyperbolic conservation laws in 1D
- **Section 8**: Systems of hyperbolic conservation laws in 2D

---

## Section 1: Lectures 1–6 — Weak Formulations and Convergence (Background)

In the first six lectures, we discuss the weak formulation of elliptic boundary value problems and prove convergence of a finite element method for a 1D boundary value problem. The theoretical foundations — Sobolev spaces, the Lax–Milgram theorem, Galerkin orthogonality, Céa's lemma, and interpolation error estimates — are drawn from Chapters 0–2 of Brenner and Scott, *The Mathematical Theory of Finite Element Methods* (2008). These lectures establish the mathematical foundation for all methods that follow.

---

## Section 2: Implementing the CG Finite Element Method in 1D

*(Lectures 7–10)*

### 2.1 The Boundary Value Problem and Weak Formulation

The **finite element method** (FEM) is a fundamentally different class of numerical methods from finite differences. Where finite differences approximate the PDE directly using difference operators, the FEM instead reformulates the problem as a **weak formulation** (also called a variational formulation) and then approximates this weaker problem.

Consider the following one-dimensional boundary value problem (BVP). Let <span>&#92;(\Omega = (0,1) \subset \mathbb{R}&#92;)</span>. Given a forcing term <span>&#92;(f \in C^0(\bar{\Omega})&#92;)</span>, a diffusion coefficient <span>&#92;(\kappa \in C^1(\bar{\Omega})&#92;)</span>, a Dirichlet boundary value <span>&#92;(\alpha \in \mathbb{R}&#92;)</span>, and a Neumann boundary value <span>&#92;(\beta \in \mathbb{R}&#92;)</span>, we seek <span>&#92;(u : \Omega \to \mathbb{R}&#92;)</span> such that

<span>&#92;[
-\frac{d}{dx}\!\left(\kappa(x)\frac{du}{dx}\right) = f(x) \quad \text{in } \Omega,
&#92;]</span>

with <span>&#92;(u = \alpha&#92;)</span> at <span>&#92;(x = 0&#92;)</span> (Dirichlet condition) and <span>&#92;(-\kappa \frac{du}{dx} = \beta&#92;)</span> at <span>&#92;(x = 1&#92;)</span> (Neumann condition).

A function <span>&#92;(u \in C^2(\Omega) \cap C^1(\bar{\Omega})&#92;)</span> satisfying (2.1) is called a **classical solution**, which exists when the data are sufficiently smooth. In many applications, however, the data are non-smooth and no classical solution exists. For example, the BVP

<span>&#92;[
-\frac{d^2u}{dx^2} = \operatorname{sgn}\!\left(\tfrac{1}{2} - |x|\right) \quad \text{in } (0,1), \quad u = 0 \text{ at } x = 0, 1
&#92;]</span>

has no classical solution in <span>&#92;(C^2(\Omega)&#92;)</span>. To handle such cases, we weaken the differentiability requirements by passing to a **weak formulation**.

**Deriving the weak formulation.** Suppose a function <span>&#92;(G&#92;)</span> exists with <span>&#92;(G = \alpha&#92;)</span> at <span>&#92;(x = 0&#92;)</span>, and set <span>&#92;(w = u - G&#92;)</span> so that <span>&#92;(w(0) = 0&#92;)</span>. Multiplying the PDE by an arbitrary smooth **test function** <span>&#92;(v&#92;)</span> and integrating over <span>&#92;(\Omega&#92;)</span>:

<span>&#92;[
\int_0^1 v(x)\left(-\frac{d}{dx}\!\left(\kappa(x)\frac{du}{dx}\right)\right)dx = \int_0^1 f(x)v(x)\,dx.
&#92;]</span>

Integrating by parts and applying the boundary conditions, we define the **trial and test space**

<span>&#92;[
V = \left\{ v \in L^2(\Omega) : v' \in L^2(\Omega),\; v(0) = 0 \right\}
&#92;]</span>

and the bilinear and linear forms

<span>&#92;[
a(w,v) := \int_0^1 \kappa(x)\frac{dw}{dx}\frac{dv}{dx}\,dx, \qquad
\ell(v) := \int_0^1 f(x)v(x)\,dx - \int_0^1 \kappa(x)\frac{dG}{dx}\frac{dv}{dx}\,dx - v(1)\beta.
&#92;]</span>

**Definition 2.1 (Weak formulation).** Let <span>&#92;(f \in L^2(\Omega)&#92;)</span>, <span>&#92;(\kappa \in L^\infty(\Omega)&#92;)</span>, and assume a function <span>&#92;(G \in L^2(\Omega)&#92;)</span> exists with <span>&#92;(G' \in L^2(\Omega)&#92;)</span> and <span>&#92;(G = \alpha&#92;)</span> at <span>&#92;(x = 0&#92;)</span>. The weak formulation is:

<span>&#92;[
\text{Find } u = w + G,\; w \in V, \quad \text{such that} \quad a(w,v) = \ell(v) \quad \forall v \in V.
&#92;]</span>

The two boundary conditions are incorporated in qualitatively different ways. The **Dirichlet** (essential) boundary condition <span>&#92;(u = \alpha&#92;)</span> at <span>&#92;(x = 0&#92;)</span> is enforced through the function space <span>&#92;(V&#92;)</span>: both the trial function (via <span>&#92;(G&#92;)</span>) and the test function (which vanishes at <span>&#92;(x = 0&#92;)</span>) must satisfy it. The **Neumann** (natural) boundary condition <span>&#92;(-\kappa\frac{du}{dx} = \beta&#92;)</span> at <span>&#92;(x = 1&#92;)</span> is incorporated *implicitly* through the right-hand side. A function satisfying the weak formulation is called a **weak solution**. Every classical solution is a weak solution, but not conversely — a weak solution only needs to lie in <span>&#92;(V&#92;)</span>, not in <span>&#92;(C^2(\Omega)&#92;)</span>.

### 2.2 Approximation of the Weak Formulation

We now discretize the weak formulation. Let <span>&#92;(V_h&#92;)</span> be an <span>&#92;(N&#92;)</span>-dimensional subspace of <span>&#92;(V&#92;)</span> with basis <span>&#92;(\{\phi_1, \ldots, \phi_N\}&#92;)</span>:

<span>&#92;[
V_h = \operatorname{span}\{\phi_1, \ldots, \phi_N\}.
&#92;]</span>

The **finite element approximation** <span>&#92;(u_h = w_h + G&#92;)</span>, <span>&#92;(w_h \in V_h&#92;)</span>, is uniquely associated with coefficients <span>&#92;((U_1, \ldots, U_N)^T&#92;)</span> in

<span>&#92;[
u_h = G + \sum_{j=1}^N U_j \phi_j(x).
&#92;]</span>

The **finite dimensional weak formulation** is: find <span>&#92;(u_h = w_h + G&#92;)</span>, <span>&#92;(w_h \in V_h&#92;)</span>, such that <span>&#92;(a(w_h, v_h) = \ell(v_h)&#92;)</span> for all <span>&#92;(v_h \in V_h&#92;)</span>.

#### 2.2.1 Matrix Form

Substituting the expansions and testing against each basis function yields the **linear system**

<span>&#92;[
AU = F, \quad A \in \mathbb{R}^{N \times N},\; U, F \in \mathbb{R}^N,
&#92;]</span>

where the **stiffness matrix** and **load vector** entries are

<span>&#92;[
a_{ij} = \int_0^1 \kappa(x)\frac{d\phi_j}{dx}\frac{d\phi_i}{dx}\,dx, \qquad
F_i = \int_0^1 f(x)\phi_i(x)\,dx - \phi_i(1)\beta - \int_0^1 \kappa(x)\frac{dG}{dx}\frac{d\phi_i}{dx}\,dx.
&#92;]</span>

#### 2.2.2 Basis Functions

We discretize <span>&#92;([0,1]&#92;)</span> using <span>&#92;(N+1&#92;)</span> points <span>&#92;(0 = x_0 < x_1 < \cdots < x_N = 1&#92;)</span> with elements <span>&#92;(K_j = [x_{j-1}, x_j]&#92;)</span> of length <span>&#92;(h_j = x_j - x_{j-1}&#92;)</span>. We use a **continuous piecewise polynomial** space

<span>&#92;[
V_h^k = \left\{ u \in C^0 : u\big|_{K_j} \in P^k(K_j)\; \forall K_j,\; u(0) = 0 \right\},
&#92;]</span>

where <span>&#92;(P^k(K)&#92;)</span> is the space of polynomials of degree <span>&#92;(k&#92;)</span> on element <span>&#92;(K&#92;)</span>. For <span>&#92;(k = 1&#92;)</span> we use the **hat (nodal) basis**: <span>&#92;(\phi_j(x_i) = \delta_{ij}&#92;)</span> (Kronecker delta), giving piecewise linear functions

<span>&#92;[
\phi_j(x) = \begin{cases} (x - x_{j-1})/(x_j - x_{j-1}), & x_{j-1} \le x \le x_j, \\ (x_{j+1} - x)/(x_{j+1} - x_j), & x_j \le x \le x_{j+1}, \\ 0, & \text{otherwise.} \end{cases}
&#92;]</span>

Each global basis function is nonzero only on the two elements sharing node <span>&#92;(x_j&#92;)</span>. We also introduce **local (element) basis functions** on <span>&#92;(K_k = [x_{k-1}, x_k]&#92;)</span>:

<span>&#92;[
\psi_{k,1}(x) = \frac{x_k - x}{x_k - x_{k-1}}, \qquad \psi_{k,2}(x) = \frac{x - x_{k-1}}{x_k - x_{k-1}},
&#92;]</span>

so <span>&#92;(\psi_{k,1} = \phi_{k-1}&#92;)</span> and <span>&#92;(\psi_{k,2} = \phi_k&#92;)</span> on <span>&#92;(K_k&#92;)</span>. The key feature of these basis functions is their **compact support** — they are nonzero only on a small number of elements, leading to a sparse stiffness matrix.

#### 2.2.3 Imposing the Dirichlet Boundary Condition

We set <span>&#92;(G = \alpha\phi_0(x) = \alpha\psi_{1,1}(x)&#92;)</span>, where <span>&#92;(\phi_0(x_0) = 1&#92;)</span> and <span>&#92;(\phi_0(x_i) = 0&#92;)</span> for <span>&#92;(i = 1, \ldots, N&#92;)</span>. This satisfies the Dirichlet condition exactly.

#### 2.2.4 Element Matrices and Assembly

We introduce **element stiffness matrices** and **element load vectors** for each element <span>&#92;(K_k&#92;)</span>:

<span>&#92;[
A^{(k)}_{ij} = \int_{K_k} \kappa(x)\frac{d\psi_{k,j}}{dx}\frac{d\psi_{k,i}}{dx}\,dx, \qquad
F^{(k)}_i = \int_{K_k} f(x)\psi_{k,i}\,dx.
&#92;]</span>

The global system is assembled by summing element contributions according to the local-to-global node mapping. For interior nodes <span>&#92;(k = 2, \ldots, N-1&#92;)</span>, the assembly yields

<span>&#92;[
A^{(k)}_{21} U_{k-1} + \left(A^{(k)}_{22} + A^{(k+1)}_{11}\right) U_k + A^{(k+1)}_{12} U_{k+1} = F^{(k)}_2 + F^{(k+1)}_1.
&#92;]</span>

The assembled global matrix <span>&#92;(A&#92;)</span> is **symmetric positive definite** and **banded** (tridiagonal for linear elements), making it computationally efficient to solve.

#### 2.2.5 Mapping to the Reference Element

To compute element integrals efficiently, we introduce the **reference element** <span>&#92;(\hat{K} = [0,1]&#92;)</span> and the affine mapping

<span>&#92;[
F_{K_j}: (0,1) \to (x_{j-1}, x_j): \xi \mapsto x = h_j\xi + x_{j-1}.
&#92;]</span>

The reference basis functions are <span>&#92;(\hat{\psi}_1(\xi) = 1 - \xi&#92;)</span> and <span>&#92;(\hat{\psi}_2(\xi) = \xi&#92;)</span>. The element integrals transform to

<span>&#92;[
A^{(k)}_{ij} = \frac{1}{h_k}\int_0^1 \kappa(x(\xi))\frac{d\hat{\psi}_j}{d\xi}\frac{d\hat{\psi}_i}{d\xi}\,d\xi, \qquad
F^{(k)}_i = \int_0^1 f(x(\xi))\hat{\psi}_i(\xi)h_k\,d\xi.
&#92;]</span>

When exact integration is not possible, we use **Gaussian quadrature** on <span>&#92;([0,1]&#92;)</span>:

<span>&#92;[
\int_0^1 g(\xi)\,d\xi \approx \sum_{i=1}^n \tfrac{1}{2}b_i\,g\!\left(\tfrac{1}{2}c_i + \tfrac{1}{2}\right).
&#92;]</span>

For 3-point Gaussian quadrature (<span>&#92;(n = 3&#92;)</span>), the weights and nodes are <span>&#92;(b_1 = 8/9, c_1 = 0&#92;)</span>; <span>&#92;(b_2 = b_3 = 5/9&#92;)</span>, <span>&#92;(c_{2,3} = \mp\sqrt{3/5}&#92;)</span>.

### 2.3 Example: Constant-Coefficient Poisson Problem

**Example 2.3.** Consider the BVP <span>&#92;(-d^2u/dx^2 = f&#92;)</span> on <span>&#92;((0,1)&#92;)</span> with <span>&#92;(u(0) = \alpha&#92;)</span> and <span>&#92;(-du/dx = \beta&#92;)</span> at <span>&#92;(x = 1&#92;)</span>, where <span>&#92;(f, \alpha, \beta&#92;)</span> are constants and we use a uniform mesh <span>&#92;(h_j = h = 1/N&#92;)</span>.

The element matrices and vectors are

<span>&#92;[
A^{(k)}_{ij} = \frac{1}{h}\begin{cases} 1 & \text{if } ij = 11 \text{ or } 22, \\ -1 & \text{if } ij = 12 \text{ or } 21, \end{cases} \qquad F^{(k)}_i = \tfrac{1}{2}fh.
&#92;]</span>

Assembling the global system gives the tridiagonal system <span>&#92;(\frac{1}{h}\operatorname{tridiag}(-1, 2, -1)\,U = F&#92;)</span>, with boundary modifications. Remarkably, **this is exactly the same linear system** produced by the standard second-order finite difference method applied to the same problem (with a ghost point for the Neumann condition). However, the finite element method generalises far more easily to non-uniform grids, non-constant coefficients, and higher dimensions.

---

## Section 3: Time-Dependent PDEs — The Heat Equation

*(Lecture 11)*

Many problems in science involve time-dependent PDEs. We discuss the CG finite element method for the **parabolic** heat equation: given forcing <span>&#92;(f(x,t)&#92;)</span> and initial condition <span>&#92;(g(x)&#92;)</span>, seek <span>&#92;(u&#92;)</span> such that

<span>&#92;[
\partial_t u - \partial_{xx} u = f \quad \text{for } x \in (0,1),\; t > 0,
&#92;]</span>

with <span>&#92;(u(0,t) = u(1,t) = 0&#92;)</span> and <span>&#92;(u(x,0) = g(x)&#92;)</span>.

### 3.1 Weak Formulation via Time Discretization

We adopt the **method of lines** approach: discretize in time first, then in space. Using a uniform time step <span>&#92;(\Delta t&#92;)</span>, the **Backward Euler** scheme approximates <span>&#92;(\partial_t u \approx (u^{n+1} - u^n)/\Delta t&#92;)</span>. Setting <span>&#92;(\tau = \Delta t^{-1}&#92;)</span>, the semi-discrete problem at each time step is: find <span>&#92;(u^{n+1}&#92;)</span> such that

<span>&#92;[
\tau u^{n+1} - \frac{d^2}{dx^2}u^{n+1} = f^{n+1} + \tau u^n \quad \text{in } \Omega.
&#92;]</span>

Multiplying by a test function <span>&#92;(v \in V = \{v \in L^2(0,1) : v' \in L^2(0,1),\; v(0) = v(1) = 0\}&#92;)</span> and integrating:

<span>&#92;[
\tau\int_0^1 u^{n+1}v\,dx + \int_0^1 \frac{du^{n+1}}{dx}\frac{dv}{dx}\,dx = \int_0^1 (f^{n+1} + \tau u^n)v\,dx \quad \forall v \in V.
&#92;]</span>

This has the same structure as the elliptic weak formulation in Section 2, with the addition of a **mass term** <span>&#92;(\tau \int u^{n+1} v&#92;)</span> on the left.

### 3.2 Matrix Form

With the same nodal basis <span>&#92;(\{\phi_1, \ldots, \phi_{N-1}\}&#92;)</span> (no <span>&#92;(\phi_N&#92;)</span> since both endpoints are Dirichlet), the discrete problem is

<span>&#92;[
AU^{n+1} = F^{n+1}, \quad A \in \mathbb{R}^{(N-1)\times(N-1)},
&#92;]</span>

where

<span>&#92;[
a_{ij} = \int_0^1 \left(\tau \phi_j\phi_i + \frac{d\phi_j}{dx}\frac{d\phi_i}{dx}\right)dx, \qquad
F_i^{n+1} = \int_0^1 (f^{n+1} + \tau u_h^n)\phi_i\,dx.
&#92;]</span>

The **stiffness matrix** <span>&#92;(A&#92;)</span> now includes both stiffness and mass contributions; crucially, **it does not change between time steps**, so it need only be assembled and factored once. Only the right-hand side <span>&#92;(F^{n+1}&#92;)</span> changes at each step. The solution advances as <span>&#92;(U^{n+1} = A^{-1}F^{n+1}&#92;)</span>.

---

## Section 4: Well-Posedness and Error Analysis

*(Lectures 11–22)*

Lectures 11–22 develop the mathematical analysis of the finite element method. The key results, drawn from Chapters 1, 2, and 5 of Brenner–Scott, include:

- **Existence and uniqueness** of weak solutions via the **Lax–Milgram theorem**: if <span>&#92;(a(\cdot, \cdot)&#92;)</span> is continuous and coercive and <span>&#92;(\ell(\cdot)&#92;)</span> is continuous, a unique weak solution exists.
- **Galerkin orthogonality**: <span>&#92;(a(u - u_h, v_h) = 0&#92;)</span> for all <span>&#92;(v_h \in V_h&#92;)</span> — the error is orthogonal (in the energy inner product) to the discrete space.
- **Céa's lemma**: the FEM error is quasi-optimal: <span>&#92;(\|u - u_h\|_V \le C \inf_{v_h \in V_h}\|u - v_h\|_V&#92;)</span>.
- **Interpolation estimates**: for smooth <span>&#92;(u&#92;)</span> and piecewise linear elements, <span>&#92;(\|u - u_h\|_{L^2} = O(h^2)&#92;)</span> and <span>&#92;(\|u - u_h\|_{H^1} = O(h)&#92;)</span>.
- **H<sup>1</sup> and L<sup>2</sup> error estimates** via the Aubin–Nitsche duality argument.

---

## Section 5: Implementing the CG Finite Element Method in 2D

*(Lectures 23–25)*

### 5.1 The 2D Poisson Problem and Weak Formulation

We extend the FEM to two dimensions. Consider the **Poisson problem**: let <span>&#92;(\Omega \subset \mathbb{R}^2&#92;)</span> be a polygonal domain with boundary <span>&#92;(\partial\Omega&#92;)</span>. Given <span>&#92;(f: \Omega \to \mathbb{R}&#92;)</span> and Dirichlet data <span>&#92;(g_D: \partial\Omega \to \mathbb{R}&#92;)</span>, find <span>&#92;(u: \Omega \to \mathbb{R}&#92;)</span> such that

<span>&#92;[
-\Delta u = f \quad \text{in } \Omega, \qquad u = g_D \quad \text{on } \partial\Omega.
&#92;]</span>

The Poisson problem models temperature distributions, gravitational and electromagnetic potentials, and inviscid flow. As in 1D, non-smooth data may prevent the existence of a classical solution.

**Example 5.1.** Take <span>&#92;(\Omega = (-1,1)^2&#92;)</span> and let <span>&#92;(f = 1&#92;)</span> on <span>&#92;(\{x > 0\}&#92;)</span> and <span>&#92;(f = 0&#92;)</span> on <span>&#92;(\{x < 0\}&#92;)</span>. Since <span>&#92;(f&#92;)</span> is discontinuous, the solution satisfies <span>&#92;(u \notin C^2(\Omega)&#92;)</span> and no classical solution exists.

To derive the weak formulation, multiply <span>&#92;(-\Delta u = f&#92;)</span> by a smooth test function <span>&#92;(v&#92;)</span> with <span>&#92;(v|_{\partial\Omega} = 0&#92;)</span> and integrate. By **Green's identity**:

<span>&#92;[
\int_\Omega \nabla u \cdot \nabla v\,dx = \int_\Omega vf\,dx.
&#92;]</span>

Define the **Sobolev space**

<span>&#92;[
H^1(\Omega) := \left\{ u: \Omega \to \mathbb{R} \;\middle|\; u,\, \tfrac{\partial u}{\partial x},\, \tfrac{\partial u}{\partial y} \in L^2(\Omega) \right\},
&#92;]</span>

and the trial and test spaces

<span>&#92;[
H^1_g(\Omega) := \{ u \in H^1(\Omega) : u|_{\partial\Omega} = g_D \}, \qquad H^1_0(\Omega) := \{ v \in H^1(\Omega) : v|_{\partial\Omega} = 0 \}.
&#92;]</span>

**Definition 5.4 (Weak formulation).** Let <span>&#92;(f \in L^2(\Omega)&#92;)</span>. Find <span>&#92;(u \in H^1_g(\Omega)&#92;)</span> such that

<span>&#92;[
\int_\Omega \nabla u \cdot \nabla v\,dx = \int_\Omega vf\,dx \quad \forall v \in H^1_0(\Omega).
&#92;]</span>

Unlike the 1D case, the trial function <span>&#92;(u&#92;)</span> and test function <span>&#92;(v&#92;)</span> belong to different spaces (a purely technical simplification for implementation).

### 5.2 Approximation of the Weak Formulation

Let <span>&#92;(V_{0h} \subset H^1_0(\Omega)&#92;)</span> be an <span>&#92;(N&#92;)</span>-dimensional space with basis <span>&#92;(\{\phi_1, \ldots, \phi_N\}&#92;)</span>. To enforce the Dirichlet condition, extend the basis by <span>&#92;(\phi_{N+1}, \ldots, \phi_{N+N_\partial}&#92;)</span> so that <span>&#92;(\sum_{j=N+1}^{N+N_\partial} U_j \phi_j&#92;)</span> interpolates <span>&#92;(g_D&#92;)</span> on <span>&#92;(\partial\Omega&#92;)</span>. The finite element solution is

<span>&#92;[
u_h = \sum_{j=1}^N U_j\phi_j + \sum_{j=N+1}^{N+N_\partial} U_j\phi_j.
&#92;]</span>

**Definition 5.5 (FEM weak formulation).** Let <span>&#92;(f \in L^2(\Omega)&#92;)</span>. Find <span>&#92;(u_h \in V_{gh}&#92;)</span> such that

<span>&#92;[
\int_\Omega \nabla u_h \cdot \nabla v_h\,dx = \int_\Omega v_h f\,dx \quad \forall v_h \in V_{0h}.
&#92;]</span>

This yields the global linear system <span>&#92;(AU = F&#92;)</span> with

<span>&#92;[
a_{ij} = \int_\Omega \nabla\phi_j \cdot \nabla\phi_i\,dx, \qquad
F_i = \int_\Omega \phi_i f\,dx - \sum_{j=N+1}^{N+N_\partial} U_j \int_\Omega \nabla\phi_j \cdot \nabla\phi_i\,dx.
&#92;]</span>

### 5.3 Discretization on Unstructured Triangular Meshes

A key advantage of finite elements is their ability to handle **unstructured grids** on complex geometries. We discretize <span>&#92;(\Omega&#92;)</span> with a triangulation <span>&#92;\mathcal{T}_h&#92;)</span> of triangles <span>&#92;(K_k&#92;)</span> satisfying: <span>&#92;(\cup_k \overline{K_k} = \Omega&#92;)</span>, triangles do not overlap, and vertices of neighboring triangles coincide.

**Local basis functions.** Each triangle <span>&#92;(K_k&#92;)</span> has three local degrees of freedom (one per vertex) with basis set <span>&#92;(\Sigma_k = \{\psi_{k,1}, \psi_{k,2}, \psi_{k,3}\}&#92;)</span>. The local solution in element <span>&#92;(K_k&#92;)</span> is

<span>&#92;[
u_h|_{K_k} = \sum_{i=1}^3 U_i^{(k)}\psi_{k,i}.
&#92;]</span>

#### 5.3.1 Computing Element Matrices via the Reference Triangle

We introduce the reference triangle <span>&#92;(\hat{K}&#92;)</span> with local coordinates <span>&#92;((\xi, \eta)&#92;)</span> and the affine mapping

<span>&#92;[
F_{K_k}: \hat{K} \to K_k: \boldsymbol{\xi} \mapsto \mathbf{x} = \mathbf{q}_1\hat{\psi}_1 + \mathbf{q}_2\hat{\psi}_2 + \mathbf{q}_3\hat{\psi}_3 = \mathbf{q}_1 + J_k\boldsymbol{\xi},
&#92;]</span>

where <span>&#92;(\mathbf{q}_i = (x_i, y_i)&#92;)</span> are the physical vertices and the **Jacobian matrix** is

<span>&#92;[
J_k = \begin{pmatrix} x_2 - x_1 & x_3 - x_1 \\ y_2 - y_1 & y_3 - y_1 \end{pmatrix}, \qquad \det(J_k) = \pm 2|K_k|,
&#92;]</span>

where <span>&#92;(|K_k|&#92;)</span> is the area of triangle <span>&#92;(K_k&#92;)</span>. The reference basis functions are

<span>&#92;[
\hat{\psi}_1 = 1 - \xi - \eta, \quad \hat{\psi}_2 = \xi, \quad \hat{\psi}_3 = \eta.
&#92;]</span>

The physical gradients relate to reference gradients by the chain rule:

<span>&#92;[
\nabla\psi_{k,i}(\mathbf{x}) = J_k^{-T}\hat{\nabla}\hat{\psi}_i(\boldsymbol{\xi}), \qquad
J_k^{-T} = \frac{1}{\det(J_k)}\begin{pmatrix} y_3 - y_1 & y_1 - y_2 \\ x_1 - x_3 & x_2 - x_1 \end{pmatrix}.
&#92;]</span>

The reference gradients of the linear basis functions are constant:

<span>&#92;[
\hat{\nabla}\hat{\psi}_1 = \begin{pmatrix}-1\\-1\end{pmatrix}, \quad \hat{\nabla}\hat{\psi}_2 = \begin{pmatrix}1\\0\end{pmatrix}, \quad \hat{\nabla}\hat{\psi}_3 = \begin{pmatrix}0\\1\end{pmatrix}.
&#92;]</span>

Since these gradients are constant, the element stiffness matrix is **exact** (no quadrature needed for linear elements):

<span>&#92;[
A^{(k)}_{ij} = \int_{K_k}\nabla\psi_{k,i}\cdot\nabla\psi_{k,j}\,dx = \tfrac{1}{2}\det(J_k)\left(J_k^{-T}\hat{\nabla}\hat{\psi}_i\right)\cdot\left(J_k^{-T}\hat{\nabla}\hat{\psi}_j\right).
&#92;]</span>

For the **load vector** with constant <span>&#92;(f&#92;)</span>, integrating over the reference triangle:

<span>&#92;[
F^{(k)}_i = f\det(J_k)\int_0^1\int_0^{1-\xi}\hat{\psi}_i\,d\eta\,d\xi,
&#92;]</span>

which gives <span>&#92;(F^{(k)}_1 = F^{(k)}_2 = F^{(k)}_3 = \frac{1}{3}f|K_k|&#92;)</span>. For non-constant <span>&#92;(f&#92;)</span>, use 7-point Gaussian quadrature on the reference triangle, which is exact for polynomials of degree up to 4.

#### 5.3.2 Global Assembly and Dirichlet Boundary Conditions

Assembly uses the **connectivity matrix** <span>&#92;(P&#92;)</span>: entry <span>&#92;(P(k,i)&#92;)</span> gives the global node number of local node <span>&#92;(i&#92;)</span> in element <span>&#92;(k&#92;)</span>. The global system is assembled as:

```
for k = 1:NumElements
  for j = 1:3
    for i = 1:3
      A_global(P(k,i), P(k,j)) += A(k,i,j)
    end
    F_global(P(k,j)) += F(k,j)
  end
end
```

Dirichlet boundary conditions are imposed by **row elimination**: for each boundary node <span>&#92;(r&#92;)</span>, set <span>&#92;(A_{rr} = 1&#92;)</span>, zero all other entries in row <span>&#92;(r&#92;)</span>, and set <span>&#92;(F_r = g_D(x_r)&#92;)</span>.

---

## Section 6: The Finite Volume and Discontinuous Galerkin Methods for Scalar Hyperbolic Conservation Laws in 1D

*(Lectures 26–34)*

### 6.1 The Scalar Hyperbolic Conservation Law

Let <span>&#92;(\Omega = (0,1)&#92;)</span> and <span>&#92;(I = (0,T]&#92;)</span>. Given initial condition <span>&#92;(u_0: \Omega \to \mathbb{R}&#92;)</span>, we seek <span>&#92;(u: \Omega \times I \to \mathbb{R}&#92;)</span> satisfying

<span>&#92;[
\partial_t u + \partial_x f(u) = 0 \quad \text{in } \Omega \times I, \qquad u(x,0) = u_0(x) \quad \text{in } \Omega,
&#92;]</span>

with suitable boundary conditions. The **eigenvalue** of the scalar conservation law is <span>&#92;(\lambda = \partial f/\partial u&#92;)</span>, which plays a central role in numerical methods.

In **integral form**, integrating over any subinterval <span>&#92;([a,b]&#92;)</span>:

<span>&#92;[
\frac{d}{dt}\int_a^b u(x,t)\,dx = f(u(a,t)) - f(u(b,t)).
&#92;]</span>

This expresses the conservation principle: the rate of change of <span>&#92;(u&#92;)</span> in <span>&#92;([a,b]&#92;)</span> equals the net flux in at <span>&#92;(a&#92;)</span> minus the flux out at <span>&#92;(b&#92;)</span>.

**Prototypical examples:**
- **Linear advection**: <span>&#92;(f(u) = au&#92;)</span>, <span>&#92;(a = \text{const}&#92;)</span>, <span>&#92;(\lambda = a&#92;)</span>.
- **Burgers' equation**: <span>&#92;(f(u) = \tfrac{1}{2}u^2&#92;)</span>, <span>&#92;(\lambda = u&#92;)</span> (nonlinear; can develop shocks).

The finite dimensional space for FV and DG methods allows **discontinuities** at element boundaries:

<span>&#92;[
V_h^d := \left\{ v_h \in L^2(\Omega) : v_h|_{K_j} \in P^k(K_j)\; \forall K_j \right\}.
&#92;]</span>

This differs crucially from the CG space (Section 2), which required continuity across elements.

### 6.1.1 Weak Formulation for FV/DG

Multiplying the conservation law by a smooth test function <span>&#92;(v&#92;)</span> and integrating over element <span>&#92;(K_j = [x_{j-1}, x_j]&#92;)</span> and integrating by parts:

<span>&#92;[
\int_{K_j} v\,\partial_t u\,dx - \int_{K_j} f(u)\,\partial_x v\,dx + f(u(x_j,t))v(x_j) - f(u(x_{j-1},t))v(x_{j-1}) = 0.
&#92;]</span>

Replacing smooth functions by discrete ones in <span>&#92;(V_h^d&#92;)</span>, we encounter the problem that <span>&#92;(u_h&#92;)</span> is **discontinuous** at nodes <span>&#92;(x_j&#92;)</span>: the left-limit <span>&#92;(u_h^j(x_j)&#92;)</span> and right-limit <span>&#92;(u_h^{j+1}(x_j)&#92;)</span> differ. The flux is therefore undefined at node <span>&#92;(x_j&#92;)</span>.

The solution is to replace the exact flux by a **numerical flux** <span>&#92;(\hat{f}^j = \hat{f}(u_h^j(x_j), u_h^{j+1}(x_j))&#92;)</span>. The unified FV/DG method becomes, for each element <span>&#92;(K_j&#92;)</span> and all <span>&#92;(v_h \in V_h^d&#92;)</span>:

<span>&#92;[
\int_{K_j} v_h^j\,\partial_t u_h^j\,dx - \int_{K_j} f(u_h^j)\,\partial_x v_h^j\,dx + \hat{f}^j v_h^j(x_j) - \hat{f}^{j-1}v_h^j(x_{j-1}) = 0.
&#92;]</span>

**Definition 6.2 (Consistent numerical flux).** A numerical flux <span>&#92;(\hat{f}(a,b)&#92;)</span> is *consistent* if <span>&#92;(\hat{f}(u,u) = f(u)&#92;)</span> for all smooth <span>&#92;(u&#92;)</span>.

The FV and DG methods coincide up to this point and diverge only in the choice of polynomial degree <span>&#92;(k&#92;)</span> in <span>&#92;(V_h^d&#92;)</span>.

### 6.2 The Finite Volume Method

Setting <span>&#92;(k = 0&#92;)</span> (piecewise constant approximation), the expansion coefficient <span>&#92;(\hat{u}_1^j(t)&#92;)</span> approximates the **mean** of <span>&#92;(u&#92;)</span> in element <span>&#92;(K_j&#92;)</span>:

<span>&#92;[
\hat{u}_1^j(t) \approx \frac{1}{h_j}\int_{K_j} u(x,t)\,dx.
&#92;]</span>

With forward Euler time stepping and uniform mesh <span>&#92;(h&#92;)</span> and time step <span>&#92;(\Delta t&#92;)</span>, the **finite volume scheme** is

<span>&#92;[
(\hat{u}_1^j)^n = (\hat{u}_1^j)^{n-1} + \frac{\Delta t}{h}\left(\hat{f}^{n-1}_{j-1} - \hat{f}^{n-1}_j\right), \quad j = 1, \ldots, N,\; n = 1, \ldots, M.
&#92;]</span>

This is precisely an approximation to the **second integral form** of the conservation law. The initial condition is <span>&#92;(\hat{u}_1^j(0) = \frac{1}{h_j}\int_{K_j} u_0(x)\,dx&#92;)</span>.

For stability, an explicit time stepping scheme requires the **Courant–Friedrichs–Lewy (CFL) condition**:

<span>&#92;[
\frac{\Delta t}{h}\,\lambda\!\left((\hat{u}_1^j)^{n-1}\right) \le c \quad \forall j, \quad c \le 1.
&#92;]</span>

#### 6.2.1 Discontinuous Solutions and Shocks

A key feature of **nonlinear** hyperbolic conservation laws is that **discontinuities (shocks) can develop from smooth initial conditions**. Burgers' equation with a smooth initial condition can form a shock in finite time as characteristics converge.

**Example 6.3.** Burgers' equation <span>&#92;(\partial_t u + \partial_x(\frac{1}{2}u^2) = 0&#92;)</span> with <span>&#92;(u(x,0) = \frac{1}{4} + \frac{1}{2}\sin(\pi x)&#92;)</span> on <span>&#92;((-1,1)&#92;)</span> with periodic boundary conditions develops a shock at approximately <span>&#92;(t = 0.5&#92;)</span>.

When a shock at <span>&#92;(x = x_d(t)&#92;)</span> propagates with speed <span>&#92;(S = dx_d/dt&#92;)</span>, applying the Leibniz rule to the integral conservation law and taking limits gives the **Rankine–Hugoniot condition**:

<span>&#92;[
S = \frac{f(u(x_L,t)) - f(u(x_R,t))}{u(x_L,t) - u(x_R,t)},
&#92;]</span>

where <span>&#92;(u(x_L,t)&#92;)</span> and <span>&#92;(u(x_R,t)&#92;)</span> are the left and right limits at the shock. This condition is essential for correctly simulating shock propagation.

**Example 6.4** illustrates that manipulating the conservation law (e.g., rewriting Burgers' in terms of <span>&#92;(u^2&#92;)</span> rather than <span>&#92;(u&#92;)</span>) yields a *different* weak solution. Only the original conservation form gives the physically correct shock speed.

#### 6.2.2 Non-Uniqueness and the Entropy Solution

**Example 6.5** shows that an infinite family of weak solutions can exist for the same initial data. Only one is physically relevant: the **entropy solution**, defined as the unique weak solution satisfying the second law of thermodynamics (entropy must be non-decreasing).

#### 6.2.3 Conservative and Monotone Schemes

**Definition 6.7 (Conservative scheme).** A scheme of the form

<span>&#92;[
u_j^n = u_j^{n-1} + \frac{\Delta t}{h}\left(\hat{f}_{j-1}^{n-1} - \hat{f}_j^{n-1}\right)
&#92;]</span>

is *conservative*. The FV method (6.18) is conservative. Conservative schemes ensure that their convergent subsequences converge to **weak solutions** of the conservation law.

**Theorem 6.8 (Lax–Wendroff).** A conservative scheme, if convergent, converges to a weak solution of the conservation law.

However, this does not guarantee convergence to the *entropy* solution. For this, we additionally require **monotonicity**.

**Definition 6.9 (Monotone scheme).** A scheme is *monotone* if: when the initial data satisfies <span>&#92;(v_i^{n-1} \ge u_i^{n-1}&#92;)</span> for all <span>&#92;(i&#92;)</span>, then <span>&#92;(v_i^n \ge u_i^n&#92;)</span> for all <span>&#92;(i&#92;)</span>. Equivalently, the numerical flux must be non-decreasing in its first argument and non-increasing in its second argument.

**Theorem 6.10.** For a monotone scheme, <span>&#92;(\max_i u_i^n \le \max_i u_i^{n-1}&#92;)</span> and <span>&#92;(\min_i u_i^n \ge \min_i u_i^{n-1}&#92;)</span>. This means no new extrema are created — spurious oscillations cannot appear.

**Theorem 6.11.** A consistent monotone scheme with <span>&#92;(\Delta t/h&#92;)</span> fixed converges to the **entropy solution** as <span>&#92;(\Delta t \to 0&#92;)</span>.

**Theorem 6.12 (Godunov's theorem).** A monotone method is *at most first order accurate*.

This fundamental limitation means that monotone (first-order) FV methods suffer from excessive numerical diffusion ("smearing"), motivating the development of higher-order DG methods.

#### 6.2.4 The Local Lax–Friedrichs Numerical Flux

The **local Lax–Friedrichs (LLF)** flux (also known as Rusanov's flux) is:

<span>&#92;[
\hat{f}(a,b) = \tfrac{1}{2}(f(a) + f(b)) - \tfrac{1}{2}\beta(b - a),
&#92;]</span>

where <span>&#92;(\beta = \max_{\min(a,b) \le s \le \max(a,b)} |\lambda(s)|&#92;)</span> and <span>&#92;(\lambda(s) = f'(s)&#92;)</span>. This flux is consistent, non-decreasing in its first argument, and non-increasing in its second argument — satisfying all monotonicity requirements.

**Warning (Example 6.13).** The central flux <span>&#92;(\hat{f}(a,b) = \frac{1}{2}(f(a)+f(b))&#92;)</span> must never be used: while consistent, it lacks the required monotonicity properties and leads to instabilities.

**Boundary conditions** for hyperbolic PDEs are imposed through the numerical flux. A Dirichlet condition <span>&#92;(u(0,t) = u_b(t)&#92;)</span> enters element <span>&#92;(j=1&#92;)</span> via <span>&#92;(\hat{f}(u_b^{n-1}, (\hat{u}_1^1)^{n-1})&#92;)</span>.

**Example 6.14 (Linear advection).** For <span>&#92;(f(u) = \alpha u&#92;)</span>, the LLF flux reduces to the **upwind scheme**: if <span>&#92;(\alpha > 0&#92;)</span>, use the value from the left; if <span>&#92;(\alpha < 0&#92;)</span>, use the value from the right. The CFL condition is <span>&#92;(\Delta t \le ch/|\alpha|&#92;)</span>.

**Example 6.15 (Burgers' equation).** For <span>&#92;(f(u) = \frac{1}{2}u^2&#92;)</span>, <span>&#92;(\beta = \max_{\min(a,b) \le s \le \max(a,b)} |s|&#92;)</span>. The CFL condition is <span>&#92;(\Delta t \le ch/\gamma&#92;)</span> where <span>&#92;(\gamma = \max_j |(\hat{u}_1^j)^{n-1}|&#92;)</span>.

### 6.3 The Discontinuous Galerkin Method, k = 1

Setting <span>&#92;(k = 1&#92;)</span> (piecewise linear approximation), in each element <span>&#92;(K_j&#92;)</span>:

<span>&#92;[
u_h(x,t)|_{K_j} = \hat{u}_1^j(t)\psi_1(x) + \hat{u}_2^j(t)\psi_2(x),
&#92;]</span>

where <span>&#92;(\hat{u}_1^j&#92;)</span> is the local mean and <span>&#92;(\hat{u}_2^j&#92;)</span> captures the slope. We use the **reference element** <span>&#92;(\hat{K} = [-1,1]&#92;)</span> (not <span>&#92;([0,1]&#92;)</span> as in the CG case) with the mapping

<span>&#92;[
F_{K_j}: (-1,1) \to (x_{j-1}, x_j): \xi \mapsto x = \tfrac{1}{2}(x_{j-1} + x_j) + \tfrac{1}{2}h\xi.
&#92;]</span>

**Legendre basis functions:** <span>&#92;(\hat{\psi}_1(\xi) = 1&#92;)</span> and <span>&#92;(\hat{\psi}_2(\xi) = \xi&#92;)</span>. The first two **Legendre polynomials** are chosen because they are **orthogonal** on <span>&#92;((-1,1)&#92;)</span>:

<span>&#92;[
\int_{-1}^1 \hat{\psi}_i(\xi)\hat{\psi}_j(\xi)\,d\xi = \frac{2}{2(i-1)+1}\delta_{ij}.
&#92;]</span>

This orthogonality property dramatically simplifies the algebra: the mass matrix on the reference element is diagonal, and many integrals vanish.

Substituting into the weak formulation and using orthogonality, the DG method simplifies to:

<span>&#92;[
\frac{d}{dt}\hat{u}_1^j(t) = \frac{1}{h}\left[\hat{f}^{j-1} - \hat{f}^j\right], \qquad
\frac{d}{dt}\hat{u}_2^j(t) = \frac{3}{h}\left[\int_{-1}^1 f(u_h^j(x(\xi),t))\,d\xi - \hat{f}^j + \hat{f}^{j-1}\right].
&#92;]</span>

**Remark 6.17.** Setting <span>&#92;(\hat{u}_2^j = 0&#92;)</span> in the DG method recovers exactly the finite volume method. The DG solution with <span>&#92;(k=1&#92;)</span> decomposes as: mean value (FV part) plus higher-order slope information.

**Initial condition** by projecting <span>&#92;(u_0&#92;)</span>:

<span>&#92;[
\hat{u}_1^j(0) = \frac{1}{2}\int_{-1}^1 u_0(x(\xi))\,d\xi, \qquad \hat{u}_2^j(0) = \frac{3}{2}\int_{-1}^1 \xi\,u_0(x(\xi))\,d\xi.
&#92;]</span>

The integrals may be approximated by **2-point Gaussian quadrature**:

<span>&#92;[
\int_{-1}^1 g(\xi)\,d\xi \approx g\!\left(-\tfrac{1}{\sqrt{3}}\right) + g\!\left(\tfrac{1}{\sqrt{3}}\right).
&#92;]</span>

#### 6.3.1 Fully Discrete RKDG Formulation

Since the DG method has <span>&#92;(k=1&#92;)</span> and is second-order in space, we need a **second-order time stepping scheme** of matching accuracy. We use the **2-stage TVD Runge–Kutta** method:

<span>&#92;[
\xi^1 = \hat{u}^{n-1} + \Delta t\,L(\hat{u}^{n-1}), \qquad
\hat{u}^n = \xi^2 = \tfrac{1}{2}\hat{u}^{n-1} + \tfrac{1}{2}\xi^1 + \tfrac{1}{2}\Delta t\,L(\xi^1),
&#92;]</span>

where <span>&#92;(L(\hat{u})&#92;)</span> is the spatial operator. The CFL condition for the DG method with <span>&#92;(k=1&#92;)</span> requires <span>&#92;(c \le 0.3&#92;)</span> (much smaller than the FV requirement of <span>&#92;(c \le 1&#92;)</span>).

The method combining DG spatial discretization with TVD-RK time stepping is called the **Runge–Kutta Discontinuous Galerkin (RKDG)** method.

#### 6.3.2 Convergence and Slope Limiters

By Godunov's theorem, the second-order DG method cannot be monotone. Without additional treatment, it can produce non-physical **oscillations** (overshoots and undershoots) near discontinuities, violating conservation.

To address this, define the **total variation of the means**:

<span>&#92;[
TV((\hat{u}_1)^n) = \sum_{1 \le j \le N-1} |(\hat{u}_1^{j+1})^n - (\hat{u}_1^j)^n|.
&#92;]</span>

**Definition 6.20 (TVDM).** A method is *total variation diminishing in the means* if <span>&#92;(TV((\hat{u}_1)^n) \le TV((\hat{u}_1)^{n-1})&#92;)</span>.

**Example 6.21** demonstrates that the RKDG method without slope limiting is *not* TVDM on Burgers' equation: the total variation in the means grows in time and oscillations appear.

To enforce TVDM, we apply the **minmod slope limiter** after each Runge–Kutta stage. The minmod function is:

<span>&#92;[
m(a_1, a_2, a_3) = \begin{cases} s\min(|a_1|, |a_2|, |a_3|) & \text{if } s = \operatorname{sgn}(a_1) = \operatorname{sgn}(a_2) = \operatorname{sgn}(a_3), \\ 0 & \text{otherwise.} \end{cases}
&#92;]</span>

Applying the limiter, in each element we replace <span>&#92;(u_h|_{K_j} = \hat{u}_1^j + \hat{u}_2^j\psi_2(x)&#92;)</span> by

<span>&#92;[
\tilde{u}_h|_{K_j} = \hat{u}_1^j + m\!\left(\hat{u}_2^j,\; \hat{u}_1^{j+1} - \hat{u}_1^j,\; \hat{u}_1^j - \hat{u}_1^{j-1}\right)\psi_2(x).
&#92;]</span>

The mean <span>&#92;(\hat{u}_1^j&#92;)</span> is preserved (conservation property); only the slope <span>&#92;(\hat{u}_2^j&#92;)</span> is modified. The limiter prevents over- and undershoots by comparing the local slope to differences of neighboring means.

**Theorem 6.23 (TVDM property of RKDG with minmod).** Under the CFL condition and with nonneg-ative RK coefficients summing to 1, the RKDG method with minmod slope limiting satisfies <span>&#92;(TV((\hat{u}_1)^n) \le TV((\hat{u}_1)^0)&#92;)</span> for all <span>&#92;(n \ge 0&#92;)</span>.

**Example 6.22** confirms that with the slope limiter, oscillations vanish and the TVDM property is restored.

**Example 6.26** compares FV, RKDG without limiter, and RKDG with limiter on the advection equation with a step function initial condition. At <span>&#92;(t = 10&#92;)</span>, the FV solution has diffused completely; the RKDG with limiter remains sharp and accurate.

### 6.4 The Discontinuous Galerkin Method, k > 1

For higher-order accuracy, set <span>&#92;(k = m&#92;)</span>. In each element:

<span>&#92;[
u_h(x,t)|_{K_j} = \sum_{i=1}^{m+1} \hat{u}_i^j(t)\psi_i(x),
&#92;]</span>

using the first <span>&#92;(m+1&#92;)</span> **Legendre polynomials** on <span>&#92;(\hat{K} = [-1,1]&#92;)</span>:

<span>&#92;[
\hat{\psi}_1 = 1,\quad \hat{\psi}_2 = \xi,\quad \hat{\psi}_3 = \tfrac{1}{2}(3\xi^2 - 1),\quad \hat{\psi}_4 = \tfrac{1}{2}(5\xi^3 - 3\xi), \ldots
&#92;]</span>

The general ODE for expansion coefficients is:

<span>&#92;[
\frac{d}{dt}\hat{u}_i^j(t) = \frac{2(i-1)+1}{h}\left[\int_{-1}^1 f(u_h^j(x(\xi),t))\frac{d\hat{\psi}_i}{d\xi}\,d\xi - \hat{f}^j\hat{\psi}_i(1) + \hat{f}^{j-1}\hat{\psi}_i(-1)\right].
&#92;]</span>

Setting <span>&#92;(m = 0&#92;)</span> recovers the FV method; setting <span>&#92;(m = 1&#92;)</span> recovers the <span>&#92;(k = 1&#92;)</span> DG method.

**Remark 6.27.** For <span>&#92;(k > 1&#92;)</span>, two-point Gaussian quadrature is insufficient; use three-point quadrature (exact to degree 5):

<span>&#92;[
\int_{-1}^1 g(\xi)\,d\xi \approx \tfrac{5}{9}g\!\left(-\sqrt{3/5}\right) + \tfrac{8}{9}g(0) + \tfrac{5}{9}g\!\left(\sqrt{3/5}\right).
&#92;]</span>

**Remark 6.28.** A DG method with <span>&#92;(k = m&#92;)</span> achieves order <span>&#92;(m+1&#92;)</span> in space: <span>&#92;(\|u - u_h\| = O(h^{m+1})&#92;)</span>. The time stepping scheme must also be of order <span>&#92;(m+1&#92;)</span>. For <span>&#92;(m = 2&#92;)</span>, use the 3-stage TVD Runge–Kutta method.

**Remark 6.29.** For <span>&#92;(k = m > 1&#92;)</span>, slope limiting is applied by projecting <span>&#92;(u_h&#92;)</span> into the <span>&#92;(k=1&#92;)</span> space and applying minmod; if the slope limiter does not modify the projection, keep the original high-order solution.

---

## Section 7: Systems of Hyperbolic Conservation Laws in 1D

*(Lectures 33–34)*

### 7.1 Problem Setup and Weak Formulation

We now consider **systems** of conservation laws. Let <span>&#92;(U: \Omega \times I \to \mathbb{R}^\ell&#92;)</span> be a vector of <span>&#92;(\ell&#92;)</span> conserved variables with flux <span>&#92;(F(U) \in \mathbb{R}^\ell&#92;)</span>:

<span>&#92;[
\partial_t U + \partial_x F(U) = 0 \quad \text{in } \Omega \times I, \qquad U(x,0) = U_0(x).
&#92;]</span>

We assume that the **Jacobian** <span>&#92;(\partial F/\partial U&#92;)</span> has <span>&#92;(\ell&#92;)</span> real eigenvalues and a complete set of linearly independent right eigenvectors — making (7.1) a **hyperbolic** system. Examples include the **Euler equations of gas dynamics** and the **shallow water equations**.

The weak formulation proceeds identically to the scalar case, element by element, now testing against a vector test function <span>&#92;(\mathbf{V}_h&#92;)</span>. Since the component form is simply the scalar weak form applied to each component of the system, the DG method for systems at polynomial degree <span>&#92;(k = m&#92;)</span> is:

<span>&#92;[
\frac{d}{dt}\hat{U}_{i,r}^j(t) = \frac{2(i-1)+1}{h}\left[\int_{-1}^1 F_r(U_h^j(x(\xi),t))\frac{d\hat{\psi}_i}{d\xi}\,d\xi - \hat{F}^j_{r}\hat{\psi}_i(1) + \hat{F}^{j-1}_{r}\hat{\psi}_i(-1)\right]
&#92;]</span>

for <span>&#92;(r = 1, \ldots, \ell&#92;)</span> and <span>&#92;(i = 1, \ldots, m+1&#92;)</span>.

### 7.2 The Finite Volume Method for Systems

Setting <span>&#92;(m = 0&#92;)</span>, the **FV method for systems** with Euler time stepping is:

<span>&#92;[
(\hat{U}_{1,r}^j)^n = (\hat{U}_{1,r}^j)^{n-1} + \frac{\Delta t}{h}\left[\hat{F}^{n-1}_{j-1,r} - \hat{F}^{n-1}_{j,r}\right].
&#92;]</span>

The CFL condition requires <span>&#92;(\frac{\Delta t}{h}\alpha \le c&#92;)</span>, where <span>&#92;(\alpha = \max_{1 \le r \le \ell,\, 1 \le j \le N} |\lambda_r((\hat{U}_1^j)^{n-1})|&#92;)</span> is the maximum eigenvalue magnitude across the domain.

### 7.3 Numerical Fluxes for Systems

#### Local Lax–Friedrichs (LLF) Flux

Generalising the scalar LLF flux, for systems the LLF flux for component <span>&#92;(r&#92;)</span> is

<span>&#92;[
\hat{F}_r(U^L, U^R) = \tfrac{1}{2}(F^L_r + F^R_r) - \tfrac{1}{2}\beta^j(U^R_r - U^L_r), \quad 1 \le r \le \ell,
&#92;]</span>

where <span>&#92;(\beta^j = \max_{1 \le r \le \ell}(|\lambda_r(U^L)|, |\lambda_r(U^R)|)&#92;)</span> is the largest eigenvalue magnitude.

#### HLL Flux

For systems, the LLF flux can be overly dissipative. A better alternative is the **Harten–Lax–van Leer (HLL)** flux, which distinguishes between information travelling left and right.

Define the smallest and largest signal velocities:

<span>&#92;[
S_L^j = \min_{1 \le r \le \ell}\left(\lambda_r(U^L), \lambda_r(U^R)\right), \qquad
S_R^j = \max_{1 \le r \le \ell}\left(\lambda_r(U^L), \lambda_r(U^R)\right).
&#92;]</span>

The HLL intermediate state is derived by applying the Rankine–Hugoniot condition across both <span>&#92;(S_L^j&#92;)</span> and <span>&#92;(S_R^j&#92;)</span>:

<span>&#92;[
U_r^{\text{hll}} = \frac{S_R^j U^R_r - S_L^j U^L_r + F^L_r - F^R_r}{S_R^j - S_L^j}.
&#92;]</span>

The intermediate flux is then:

<span>&#92;[
F_r^* = \frac{S_R^j F^L_r - S_L^j F^R_r + S_L^j S_R^j(U^R_r - U^L_r)}{S_R^j - S_L^j}.
&#92;]</span>

The **HLL numerical flux** is:

<span>&#92;[
\hat{F}_r(U^L, U^R) = \begin{cases} F^L_r & \text{if } S_L^j \ge 0, \\ F_r^* & \text{if } S_L^j < 0 < S_R^j, \\ F^R_r & \text{if } S_R^j \le 0. \end{cases}
&#92;]</span>

#### Example 7.1: Euler Equations of Gas Dynamics

The **Euler equations** are the prototypical system of hyperbolic conservation laws:

<span>&#92;[
U = \begin{pmatrix}\rho \\ \rho v \\ E\end{pmatrix}, \quad F(U) = \begin{pmatrix}\rho v \\ \rho v^2 + p \\ v(E+p)\end{pmatrix},
&#92;]</span>

where <span>&#92;(\rho&#92;)</span> is the density, <span>&#92;(v&#92;)</span> the velocity, <span>&#92;(E = \rho(\frac{1}{2}v^2 + e)&#92;)</span> the total energy, and <span>&#92;(p = (γ-1)\rho e&#92;)</span> the pressure (ideal gas). The eigenvalues are <span>&#92;(\lambda_1 = v - a&#92;)</span>, <span>&#92;(\lambda_2 = v&#92;)</span>, <span>&#92;(\lambda_3 = v + a&#92;)</span>, where <span>&#92;(a = \sqrt{\gamma p/\rho}&#92;)</span> is the speed of sound.

For the LLF flux: <span>&#92;(\beta^j = \max(|v^j - a^j|, |v^{j+1} - a^{j+1}|, |v^j + a^j|, |v^{j+1} + a^{j+1}|)&#92;)</span>.
For the HLL flux: <span>&#92;(S_L^j = \min(v^j - a^j, v^{j+1} - a^{j+1})&#92;)</span> and <span>&#92;(S_R^j = \max(v^j + a^j, v^{j+1} + a^{j+1})&#92;)</span>.

**Example 7.2** solves the Euler equations with a Riemann initial condition (left state <span>&#92;((\rho,\rho v, E) = (1.0, 0.75, 2.78125)^T&#92;)</span>, right state <span>&#92;((0.125, 0, 0.25)^T&#92;)</span>) on 100 elements. The LLF flux produces an excessively smeared solution. The HLL flux provides a significantly sharper approximation, especially for the two shocks in the density profile.

---

## Section 8: The FV Method for Systems of Hyperbolic Conservation Laws in 2D

*(Lecture 35)*

### 8.1 Problem Setup

We generalise to two spatial dimensions. Let <span>&#92;(\Omega \subset \mathbb{R}^2&#92;)</span>. We seek <span>&#92;(U: \Omega \times I \to \mathbb{R}^\ell&#92;)</span> such that

<span>&#92;[
\partial_t U + \nabla \cdot F(U) = 0 \quad \text{in } \Omega \times I, \qquad U(x,y,0) = U_0(x,y),
&#92;]</span>

where <span>&#92;(F(U) \in \mathbb{R}^{\ell \times 2}&#92;)</span> is the flux tensor.

**Example 8.1 (2D shallow water equations):**

<span>&#92;[
U = \begin{pmatrix}h \\ hu \\ hv\end{pmatrix}, \quad
F(U) = \begin{pmatrix}hu & hv \\ hu^2 + \tfrac{1}{2}gh^2 & huv \\ huv & hv^2 + \tfrac{1}{2}gh^2\end{pmatrix},
&#92;]</span>

where <span>&#92;(h&#92;)</span> is the water depth, <span>&#92;(u, v&#92;)</span> are velocity components, and <span>&#92;(g&#92;)</span> is gravity. The eigenvalues in direction <span>&#92;(\mathbf{n} = (n_x, n_y)&#92;)</span> are <span>&#92;(\lambda_1 = q - \sqrt{gh}&#92;)</span>, <span>&#92;(\lambda_2 = q&#92;)</span>, <span>&#92;(\lambda_3 = q + \sqrt{gh}&#92;)</span>, where <span>&#92;(q = un_x + vn_y&#92;)</span>, confirming hyperbolicity.

### 8.2 The 2D Finite Volume Method

We discretize <span>&#92;(\Omega&#92;)</span> with <span>&#92;(N&#92;)</span> elements (triangles or quadrilaterals) <span>&#92;(K_j&#92;)</span>, using piecewise constant approximations. The FV method follows from integrating the conservation law over element <span>&#92;(K_j&#92;)</span> and using Euler time stepping:

<span>&#92;[
(U_{h,r}^j)^n = (U_{h,r}^j)^{n-1} - \frac{\Delta t}{|K_j|}\int_{\partial K_j}\hat{F}^{n-1}_{j,r} \cdot \mathbf{n}\,ds,
&#92;]</span>

where <span>&#92;(\mathbf{n}&#92;)</span> is the outward unit normal on <span>&#92;(\partial K_j&#92;)</span> and <span>&#92;(|K_j|&#92;)</span> is the element area. The CFL condition is <span>&#92;(\frac{\Delta t}{h}\alpha \le c&#92;)</span>, where <span>&#92;(\alpha&#92;)</span> is the maximum eigenvalue (in absolute value) of the flux in the normal direction across all element boundaries.

The **numerical flux in the normal direction** is computed at each element face using the **LLF flux** in the normal direction:

<span>&#92;[
H_r(U^L, U^R) = \tfrac{1}{2}(F^L_r \cdot \mathbf{n} + F^R_r \cdot \mathbf{n}) - \tfrac{1}{2}\beta^j(U^R_r - U^L_r),
&#92;]</span>

where <span>&#92;(\beta^j&#92;)</span> is the largest eigenvalue (in absolute value) on the shared face. Alternatively, the HLL flux may be applied in the normal direction.

**Example 8.2** (reference): For a DG discretization of the 2D shallow water equations, see the NGSolve tutorial at `https://ngsolve.org/docu/latest/i-tutorials/unit-3.4-simplehyp/shallow2D.html`.

---

## Summary of Methods and Key Properties

| Method | Polynomial Degree | Order of Accuracy | Converges to Entropy Solution? |
|--------|------------------|-------------------|-------------------------------|
| Finite Volume (FV) | <span>&#92;(k = 0&#92;)</span> | 1<sup>st</sup> order | Yes (monotone, consistent) |
| DG with <span>&#92;(k=1&#92;)</span> + slope limiter | <span>&#92;(k = 1&#92;)</span> | 2<sup>nd</sup> order | Conjectured (numerical evidence) |
| DG with <span>&#92;(k=m&#92;)</span> + slope limiter | <span>&#92;(k = m&#92;)</span> | <span>&#92;((m+1)&#92;)</span><sup>th</sup> order | Conjectured |
| CG FEM (elliptic) | <span>&#92;(k \ge 1&#92;)</span> | <span>&#92;(O(h^{k+1})&#92;)</span> in <span>&#92;(L^2&#92;)</span> | N/A (not hyperbolic) |

### Key Theorems

- **Lax–Wendroff**: Conservative + convergent ⟹ converges to weak solution.
- **Theorem 6.11**: Consistent + monotone ⟹ converges to entropy solution.
- **Godunov's theorem**: Monotone ⟹ at most 1<sup>st</sup> order.
- **TVDM theorem**: RKDG + minmod under CFL ⟹ total variation of means is non-increasing.

### Final Exam Topics

Key topics from the 2019 review (applicable to the 2020 exam preparation):
1. Dirichlet boundary conditions for scalar conservation laws
2. Method of characteristics
3. Discontinuous solutions as weak solutions
4. Hyperbolicity of systems
5. Derivation of the first-order Godunov scheme
6. Exact Riemann solver / numerical flux for given <span>&#92;(f&#92;)</span>
7. Rankine–Hugoniot condition derivation
8. Exact and numerical domain of dependence
9. CFL condition and proof
10. Time step size for nonlinear PDEs
11. Conservation property of conservation laws
12. Von Neumann stability analysis
13. Dissipation and dispersion errors
14. Definitions: monotone and TVD methods
15. Harten's theorem with proof
16. Weak (Galerkin) formulations (FE and DG)
17. Hat functions
18. Mapping and weak formulations on the computational element (FE and DG)
19. Computation of local mass and stiffness matrices (any order)
20. Assembly of mass and stiffness matrices for FEM with linear basis
21. Higher-order bases: general principles
22. Minmod limiter for DGM
23. Two-dimensional weak forms (DG and FEM)
24. Mapping and weak formulations on triangles
25. Multidimensional quadrature (method of undetermined coefficients)
26. Lagrangian basis functions on triangles

---

## References

1. S. C. Brenner and L. R. Scott. *The Mathematical Theory of Finite Element Methods*. Springer, 3<sup>rd</sup> ed., 2008.
2. B. Cockburn. An introduction to the discontinuous Galerkin method for convection-dominated problems. *Advanced Numerical Approximation of Nonlinear Hyperbolic Equations*, 150–268, 1998.
3. B. Cockburn. Devising discontinuous Galerkin methods for non-linear hyperbolic conservation laws. *J. Comput. Appl. Math.*, 128:187–204, 2001.
4. B. Cockburn and C.-W. Shu. TVB Runge-Kutta local projection discontinuous Galerkin finite element method for conservation laws II. *Math. Comp.*, 52(186):411–435, 1989.
5. B. Cockburn and C.-W. Shu. The Runge-Kutta discontinuous Galerkin method for conservation laws V. *J. Comput. Phys.*, 141(2):199–224, 1998.
6. J. Flaherty. *Finite Element Lecture Notes*.
7. P. D. Lax and B. Wendroff. Systems of conservation laws. *Comm. Pure Appl. Math.*, 13:217–237, 1960.
8. R. J. LeVeque. *Numerical Methods for Conservation Laws*. Birkhäuser, 2<sup>nd</sup> ed., 1992.
9. R. J. LeVeque. *Finite Volume Methods for Hyperbolic Problems*. Cambridge Univ. Press, 2002.
10. C.-W. Shu and S. Osher. Efficient implementation of essentially non-oscillatory shock-capturing schemes. *J. Comput. Phys.*, 77(2):439–471, 1988.
11. E. F. Toro. *Riemann Solvers and Numerical Methods for Fluid Dynamics*. Springer, 3<sup>rd</sup> ed., 2009.
12. J. van Kan, A. Segal, and F. Vermolen. *Numerical Methods in Scientific Computing*. VSSD, 2005.
