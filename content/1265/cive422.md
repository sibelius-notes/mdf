---
title: "CIVE 422: Finite Element Analysis"
subjects: "CIVE"
---

## Sources and References

- Zienkiewicz, O. C., Taylor, R. L., and Zhu, J. Z. *The Finite Element Method: Its Basis and Fundamentals*. 7th ed. Butterworth-Heinemann.
- Zienkiewicz, O. C., Taylor, R. L., and Fox, D. *The Finite Element Method for Solid and Structural Mechanics*. 7th ed. Butterworth-Heinemann.
- Hughes, T. J. R. *The Finite Element Method: Linear Static and Dynamic Finite Element Analysis*. Dover.
- Bathe, K.-J. *Finite Element Procedures*. 2nd ed. Prentice Hall / self-published.
- Reddy, J. N. *An Introduction to the Finite Element Method*. 4th ed. McGraw-Hill.
- Cook, R. D., Malkus, D. S., Plesha, M. E., and Witt, R. J. *Concepts and Applications of Finite Element Analysis*. 4th ed. Wiley.
- Belytschko, T., Liu, W. K., Moran, B., and Elkhodary, K. *Nonlinear Finite Elements for Continua and Structures*. 2nd ed. Wiley.
- Simo, J. C., and Hughes, T. J. R. *Computational Inelasticity*. Springer.
- Brenner, S. C., and Scott, L. R. *The Mathematical Theory of Finite Element Methods*. 3rd ed. Springer.
- Strang, G., and Fix, G. J. *An Analysis of the Finite Element Method*. 2nd ed. Wellesley-Cambridge Press.
- MIT OpenCourseWare 16.810, *Engineering Design and Rapid Prototyping* (finite-element lectures).
- MIT OpenCourseWare 2.092 / 2.093, *Finite Element Analysis of Solids and Fluids* (Bathe lectures).
- Stanford ME 232, *Advanced Finite Element Analysis* public course materials.

---

The finite element method (FEM) is the dominant computational framework for solving boundary-value problems that arise in structural mechanics, heat transfer, fluid flow, and mass transport. Its power lies in a disciplined strategy: replace a continuum governed by partial differential equations with a piecewise-polynomial approximation defined on a mesh, impose either an energy principle or a weighted-residual statement, and reduce the problem to a sparse linear (or nonlinear) algebraic system. These notes develop FEM from the ground up for a civil-engineering audience. We begin with matrix structural analysis because it provides the cleanest setting in which to introduce degrees of freedom, assembly, and boundary conditions; we then generalize to the continuum through variational principles and the method of weighted residuals; and we finish with isoparametric elements, numerical integration, convergence theory, transient analysis, and a short introduction to nonlinear FEM.

# Chapter 1: Matrix Methods and the Direct Stiffness Method

## 1.1 Why start with structures

Long before FEM existed as a general tool, civil and aerospace engineers had developed the direct stiffness method for framed structures. Trusses, beams, and frames are naturally discrete: the geometry is a finite set of joints connected by members, and equilibrium can be written exactly at those joints. The matrix equations that emerge are identical in form to the ones we will later derive from continuous variational principles, which makes structural analysis a conceptually clean entry point to FEM.

## 1.2 Axial bar and the element stiffness

Consider a prismatic bar of length \( L \), cross-sectional area \( A \), and Young's modulus \( E \), aligned with the \( x \)-axis and pin-ended so that only axial deformation occurs. Let \( u_1 \) and \( u_2 \) denote the axial displacements at the two endpoints and \( f_1, f_2 \) the associated nodal forces. Linear elasticity combined with the compatibility relation \( \varepsilon = (u_2 - u_1)/L \) and \( \sigma = E\varepsilon \) yields

\[
\left[ \begin{array}{cc} k & -k \\ -k & k \end{array} \right] \left[ \begin{array}{c} u_1 \\ u_2 \end{array} \right] = \left[ \begin{array}{c} f_1 \\ f_2 \end{array} \right], \qquad k = \frac{EA}{L}.
\]

The symmetric, singular \( 2\times 2 \) matrix on the left is the element stiffness matrix in the local frame. Its singularity reflects rigid-body translation: uniform displacement produces no internal force.

## 1.3 Coordinate transformation

A truss member inclined at angle \( \theta \) to the global \( x \)-axis has two displacement components per node in the global frame. The relation between local axial displacement \( \bar{u} \) and global displacements \( (u, v) \) is

\[
\bar{u}_i = u_i \cos\theta + v_i \sin\theta.
\]

Collecting the cosine and sine into a transformation matrix \( \mathbf{T} \), the element stiffness in global coordinates becomes \( \mathbf{K}_e = \mathbf{T}^{\top} \bar{\mathbf{K}}_e \mathbf{T} \). The transformation preserves symmetry and positive semi-definiteness.

## 1.4 Assembly

Global assembly follows from the principle that nodal equilibrium must hold in the global frame and that shared nodes inherit contributions from every element meeting them. Operationally, each element stiffness is scattered into a larger, sparsely populated global stiffness matrix \( \mathbf{K} \) using a connectivity table that maps local degree-of-freedom indices to global ones. The global system

\[
\mathbf{K}\mathbf{u} = \mathbf{F}
\]

is singular until essential boundary conditions (supports) are imposed. Standard treatments include row-column elimination, penalty enforcement (adding a large diagonal term), and Lagrange multipliers.

## 1.5 Euler-Bernoulli beam element

A prismatic beam of flexural rigidity \( EI \) carrying transverse load admits the fourth-order equation \( EI\, w'''' = q(x) \). For a beam segment with nodal transverse displacements \( w_1, w_2 \) and rotations \( \theta_1, \theta_2 \), cubic Hermite interpolation is the minimal polynomial that guarantees \( C^1 \) continuity. Integrating the strain energy \( U = \tfrac{1}{2}\int_0^L EI (w'')^2 \, dx \) over one element yields the classical beam stiffness

\[
\mathbf{K}_e = \frac{EI}{L^3} \left[ \begin{array}{cccc} 12 & 6L & -12 & 6L \\ 6L & 4L^2 & -6L & 2L^2 \\ -12 & -6L & 12 & -6L \\ 6L & 2L^2 & -6L & 4L^2 \end{array} \right].
\]

Distributed loads are lumped into equivalent nodal forces and moments through consistent work-equivalent integrals of the Hermite shape functions against the loading. Frame elements combine axial and bending stiffnesses in a block-diagonal fashion in the local frame, rotated to global coordinates as before.

<div class="note">
<strong>Key idea.</strong> <em>Whether obtained from equilibrium of a truss member or from integration of strain energy in a beam, the element stiffness matrix is always symmetric, always singular in the absence of supports, and always assembles through a connectivity map. This structural-engineering template survives intact into two- and three-dimensional FEM.</em>
</div>

# Chapter 2: Variational Principles

## 2.1 Strong form of a model problem

To prepare for the continuum generalization, consider the one-dimensional steady-state diffusion/advection-free boundary-value problem

\[
-\frac{d}{dx}\!\left(k(x)\,\frac{du}{dx}\right) = f(x), \qquad x\in(0,L),
\]

with mixed boundary conditions \( u(0)=u_0 \) (Dirichlet, or essential) and \( k(L)\,u'(L) = \bar{q} \) (Neumann, or natural). Classical solutions require \( u \) to be twice differentiable, which is restrictive when \( f \) or \( k \) are irregular or when loads are concentrated.

## 2.2 Weak form

Multiplying the strong form by a test function \( v \) vanishing on the Dirichlet boundary and integrating by parts leads to the weak statement: find \( u \) in an admissible trial space such that for every admissible \( v \),

\[
\int_0^L k(x)\, u'(x)\, v'(x)\, dx = \int_0^L f(x)\, v(x)\, dx + \bar{q}\, v(L).
\]

Only first derivatives of \( u \) and \( v \) appear. The natural boundary condition is absorbed into the right-hand side, while the essential condition is built into the trial space. This reduction of regularity is what ultimately permits piecewise-linear finite-element approximations.

## 2.3 Minimum potential energy

For linear elasticity with displacement field \( \mathbf{u} \), strain \( \boldsymbol{\varepsilon}(\mathbf{u}) \), and elastic modulus tensor \( \mathbf{C} \), the total potential energy is

\[
\Pi(\mathbf{u}) = \frac{1}{2}\int_\Omega \boldsymbol{\varepsilon}^{\top} \mathbf{C}\, \boldsymbol{\varepsilon}\, d\Omega - \int_\Omega \mathbf{b}^{\top}\mathbf{u}\, d\Omega - \int_{\Gamma_t} \bar{\mathbf{t}}^{\top}\mathbf{u}\, d\Gamma.
\]

The true displacement field, among all kinematically admissible fields, renders \( \Pi \) a minimum. Taking the first variation \( \delta\Pi = 0 \) reproduces the weak form. Positive-definiteness of \( \mathbf{C} \) guarantees the quadratic form is convex, so the stationary point is a genuine minimum, which is why the resulting discrete stiffness matrix is symmetric positive definite after imposing supports.

## 2.4 Ritz approximation

The Ritz method restricts \( \mathbf{u} \) to a finite-dimensional subspace spanned by globally defined basis functions \( \varphi_i \), writes \( u^h = \sum_i u_i \varphi_i \), and substitutes back into \( \Pi \). Stationarity with respect to the unknown coefficients \( u_i \) gives \( \mathbf{K}\mathbf{u} = \mathbf{F} \). Classical Ritz suffers when the domain is irregular because the globally defined basis functions are hard to construct. FEM repairs this weakness by taking the basis to be piecewise-polynomial on a mesh, each shape function supported only over elements touching one node.

# Chapter 3: Method of Weighted Residuals

## 3.1 A unifying framework

Not every problem admits a variational principle. Convection-diffusion, compressible flow, and several multiphysics problems have non-self-adjoint operators. The method of weighted residuals (MWR) provides a uniform recipe. Given a differential operator \( L \) and source \( f \), approximate \( u \approx u^h = \sum_j c_j \varphi_j \) and define the residual \( R(x) = L\, u^h - f \). Demand that \( R \) be orthogonal to a chosen set of weight functions \( w_i \):

\[
\int_\Omega w_i(x)\, R(x)\, d\Omega = 0, \qquad i = 1,\dots,N.
\]

Each choice of weights defines a distinct method.

## 3.2 Collocation

Choosing \( w_i(x) = \delta(x-x_i) \) (Dirac deltas) forces the residual to vanish at selected collocation points. The resulting system is algebraically cheap but requires derivatives of \( u^h \) that may not exist in a piecewise framework, so collocation is most natural with high-regularity spectral or radial-basis approximations.

## 3.3 Least squares

Selecting \( w_i = \partial R/\partial c_i \) minimizes \( \int R^2\, d\Omega \). The method always produces symmetric positive-definite systems even for non-self-adjoint operators, at the cost of doubling the order of derivatives that appear, which is typically undesirable.

## 3.4 Galerkin's method

The Galerkin choice \( w_i = \varphi_i \) uses the trial functions themselves as weights. For self-adjoint operators it coincides with the Ritz method and inherits the symmetric positive-definite structure. For non-self-adjoint operators, such as convection-dominated transport, the standard Galerkin method still works but can produce oscillatory solutions that must be controlled by Petrov-Galerkin stabilization (e.g., SUPG). Galerkin FEM is the backbone of almost every code discussed in the remainder of these notes.

<div class="warning">
<strong>Self-adjointness matters.</strong> <em>When the underlying operator is self-adjoint and positive, Galerkin produces a symmetric positive-definite stiffness matrix and best approximation in the energy norm. For convection-dominated problems, naive Galerkin loses its best-approximation property, and stabilization becomes essential to avoid spurious oscillations.</em>
</div>

# Chapter 4: The One-Dimensional Bar Element

## 4.1 Linear shape functions

Partition \( [0,L] \) into elements \( [x_i,x_{i+1}] \) and over each element introduce local coordinate \( \xi \in [-1,1] \) through the affine map \( x(\xi) = \tfrac{1}{2}(x_i+x_{i+1}) + \tfrac{1}{2}(x_{i+1}-x_i)\,\xi \). The linear Lagrange shape functions are

\[
N_1(\xi) = \frac{1-\xi}{2}, \qquad N_2(\xi) = \frac{1+\xi}{2},
\]

each equal to one at its own node and zero at the other, summing to unity so that rigid translation is exactly represented. The approximate displacement is \( u^h(\xi) = N_1 u_1 + N_2 u_2 \).

## 4.2 Element stiffness and load vector

With Jacobian \( J = dx/d\xi = (x_{i+1}-x_i)/2 = h/2 \) and strain-displacement operator \( \mathbf{B} = (1/J)[dN_1/d\xi,\, dN_2/d\xi] \), one obtains

\[
\mathbf{K}_e = \int_{-1}^{1} \mathbf{B}^{\top} (EA)\, \mathbf{B}\, J\, d\xi = \frac{EA}{h}\left[ \begin{array}{cc} 1 & -1 \\ -1 & 1 \end{array} \right],
\]

reproducing Section 1.2. The consistent load vector for distributed axial load \( f(x) \) is \( \mathbf{f}_e = \int_{-1}^{1} \mathbf{N}^{\top} f\, J\, d\xi \).

## 4.3 Quadratic and higher-order bars

A three-node quadratic bar uses Lagrange polynomials

\[
N_1 = \tfrac{1}{2}\xi(\xi-1), \qquad N_2 = 1 - \xi^2, \qquad N_3 = \tfrac{1}{2}\xi(\xi+1),
\]

and is exact for quadratic displacement fields, which halves the error compared with linear elements for the same number of degrees of freedom whenever the exact solution is smooth.

# Chapter 5: Two-Dimensional Elements

## 5.1 Plane stress and plane strain

Two-dimensional elasticity emerges in two distinct limits. Plane stress applies to thin plates loaded in their own plane so that \( \sigma_{zz}=\sigma_{xz}=\sigma_{yz}=0 \). Plane strain applies to long prismatic bodies loaded perpendicularly to their axis so that \( \varepsilon_{zz}=\varepsilon_{xz}=\varepsilon_{yz}=0 \). Both yield a linear relation \( \boldsymbol{\sigma} = \mathbf{D}\,\boldsymbol{\varepsilon} \) between in-plane components, with different \( \mathbf{D} \) matrices that differ only in how Poisson's ratio appears.

## 5.2 Constant-strain triangle (CST)

The three-node triangle with linear shape functions is the simplest two-dimensional element. Writing \( u^h = \sum N_i u_i \) and \( v^h = \sum N_i v_i \) with

\[
N_i(x,y) = \frac{1}{2A}\left( a_i + b_i x + c_i y \right),
\]

where \( A \) is the element area and the coefficients \( a_i,b_i,c_i \) are geometric, the strain field is piecewise constant. Hence the name CST. The element stiffness has closed form

\[
\mathbf{K}_e = A\,t\,\mathbf{B}^{\top}\mathbf{D}\,\mathbf{B},
\]

with thickness \( t \) and constant \( \mathbf{B} \). CSTs are robust but suffer from shear locking near incompressibility and converge only linearly.

## 5.3 Linear-strain triangle (LST)

The six-node triangle carries nodes at vertices and midsides, supports complete quadratic polynomials, and produces linear strain. It dramatically reduces the mesh density required for a given accuracy and is far less prone to locking.

## 5.4 Bilinear quadrilateral (Q4)

The four-node quadrilateral uses bilinear shape functions in \( (\xi,\eta)\in[-1,1]^2 \):

\[
N_i(\xi,\eta) = \tfrac{1}{4}(1+\xi_i\xi)(1+\eta_i\eta),
\]

with \( (\xi_i,\eta_i) \) the corner coordinates. The element is not complete in quadratic terms; it handles uniform strain exactly but fails to represent pure bending without artificial incompatible modes or reduced integration tricks.

## 5.5 Quadratic serendipity and Lagrange quadrilaterals (Q8, Q9)

Eight-node serendipity (Q8) and nine-node Lagrange (Q9) quadrilaterals add mid-side and, for Q9, central nodes. They represent complete quadratics and part of the cubic space, excel at bending-dominated problems, and are the workhorse elements for plane problems in structural codes.

<div class="note">
<strong>Element menu summary.</strong> <em>Use CST/Q4 only when mesh refinement is cheap and the solution is smooth. Prefer LST/Q8/Q9 when bending or stress-concentration accuracy matters. For incompressible or nearly-incompressible materials, mixed formulations or reduced integration are usually required to avoid volumetric locking.</em>
</div>

# Chapter 6: Isoparametric Mapping and the Jacobian

## 6.1 The isoparametric concept

An isoparametric element uses the same shape functions to interpolate geometry and field variables:

\[
x(\xi,\eta) = \sum_i N_i(\xi,\eta)\, x_i, \qquad u(\xi,\eta) = \sum_i N_i(\xi,\eta)\, u_i.
\]

This has two consequences: it guarantees that the element can exactly represent the nodal geometry used for its formulation, and it permits curved element edges, which is essential on domains with curved boundaries.

## 6.2 The Jacobian matrix

Derivatives in physical coordinates follow from the chain rule via the Jacobian

\[
\mathbf{J} = \left[ \begin{array}{cc} \partial x/\partial \xi & \partial y/\partial \xi \\ \partial x/\partial \eta & \partial y/\partial \eta \end{array} \right],
\]

so that

\[
\left[ \begin{array}{c} \partial N_i/\partial x \\ \partial N_i/\partial y \end{array} \right] = \mathbf{J}^{-1} \left[ \begin{array}{c} \partial N_i/\partial \xi \\ \partial N_i/\partial \eta \end{array} \right].
\]

The determinant \( \det \mathbf{J} \) rescales area elements: \( dx\,dy = \det\mathbf{J}\, d\xi\, d\eta \). If \( \det\mathbf{J} \) changes sign anywhere inside the element, the element is distorted beyond usable limits; if it vanishes, the element is singular. Mesh-quality metrics in commercial codes monitor \( \det\mathbf{J} \) at every integration point.

## 6.3 Why isoparametric elements dominate

Before isoparametric mapping, curved-boundary modeling required special-purpose elements. With isoparametric formulations, the same code path handles arbitrary polynomial order, arbitrary dimension, and arbitrary smooth distortion. The community settled on this formulation by the mid-1970s, and it remains the cornerstone of every general-purpose FEM code.

# Chapter 7: Numerical Integration

## 7.1 Gauss-Legendre quadrature

Element integrals rarely admit closed form when the Jacobian varies, so numerical integration is essential. Gauss-Legendre quadrature approximates

\[
\int_{-1}^{1} g(\xi)\, d\xi \approx \sum_{\alpha=1}^{n} w_\alpha\, g(\xi_\alpha),
\]

with points \( \xi_\alpha \) and weights \( w_\alpha \) chosen so that the rule is exact for polynomials of degree up to \( 2n-1 \). Two-point Gauss is exact for cubics; three-point Gauss is exact for quintics. Product rules extend to two and three dimensions.

## 7.2 Full versus reduced integration

"Full" integration chooses \( n \) large enough that the stiffness is computed exactly for an undistorted element. This is the safe default. "Reduced" integration uses fewer points, which can relieve shear locking in low-order elements and can speed up computation, but can introduce spurious zero-energy modes ("hourglass modes"). Mixed schemes and selective reduced integration are the standard fix: integrate the volumetric part reduced and the deviatoric part fully, or vice versa, depending on the physics.

## 7.3 Triangles and tetrahedra

Triangles use their own barycentric quadrature rules (Dunavant and related families). One-point integration is exact for linear triangles; three-point for quadratics; seven-point for quartics. Tetrahedra follow analogous patterns.

# Chapter 8: Convergence, Consistency, and the Patch Test

## 8.1 What convergence means

An FEM is convergent if, as the characteristic mesh size \( h \) tends to zero with a fixed polynomial order, the discrete solution approaches the exact solution in the appropriate norm. For a linear elliptic problem with solution smoothness, theory gives

\[
\| u - u^h \|_{H^1} \le C h^p \| u \|_{H^{p+1}},
\]

with \( p \) the polynomial degree of the shape functions. Stress/flux errors typically converge one order slower because they involve a derivative.

## 8.2 Consistency

A method is consistent if, as the mesh is refined, the discrete equations reproduce the continuous equations. Consistency requires that the element be able to represent, exactly, constant fields and constant first derivatives. Violations generate systematic error that does not vanish with refinement.

## 8.3 The patch test

Irons's patch test is the practical means of verifying consistency. A patch of elements, arbitrarily distorted, is subjected to boundary displacements consistent with a constant-strain state. The computed interior strains must match the prescribed constant strains to machine precision. An element that passes the patch test for all constant-strain patterns is guaranteed, under mild conditions, to converge.

## 8.4 Completeness and compatibility

Completeness requires the element's polynomial space to include all polynomials up to the degree required by the strain measure (constants and linears for elasticity). Compatibility requires the approximation to be continuous across element boundaries at the level required by the governing PDE (C0 for second-order problems, C1 for fourth-order problems such as Euler-Bernoulli beams and thin plates).

<div class="warning">
<strong>Nonconforming elements.</strong> <em>An element that fails interelement compatibility can still converge if it passes the patch test. The Wilson incompatible quadrilateral is the classic example: adding two internal bubble modes to the Q4 restores accurate bending while preserving the patch test.</em>
</div>

# Chapter 9: Assembly, Boundary Conditions, and Linear Solvers

## 9.1 Scatter-add assembly

In practice, assembly loops over elements, computes each \( \mathbf{K}_e \) and \( \mathbf{f}_e \), and scatters entries into \( \mathbf{K} \) and \( \mathbf{F} \) using local-to-global degree-of-freedom maps. Storage layouts include dense (pedagogical only), banded, skyline (profile), and compressed sparse row. Modern codes use CSR with a separate symbolic assembly pass that establishes the sparsity pattern before numerical assembly.

## 9.2 Dirichlet and Neumann conditions

Neumann conditions enter the load vector directly through surface integrals of prescribed tractions or fluxes. Dirichlet conditions must be enforced on the trial space. Standard implementation options are: (i) eliminate prescribed rows and columns and modify the right-hand side; (ii) add a large penalty term to the diagonal; (iii) introduce Lagrange multipliers that preserve symmetry but increase system size; (iv) use Nitsche's method, which weakly enforces Dirichlet conditions via consistent boundary terms and is popular for contact and fictitious-domain problems.

## 9.3 Direct solvers

Gaussian elimination with sparse data structures is the dominant choice for moderate problems. Banded solvers cost \( O(N\,b^2) \) for bandwidth \( b \); sparse multifrontal solvers reorder the matrix using approximate minimum degree or nested dissection to reduce fill-in. Cholesky factorization halves the cost and storage for symmetric positive-definite systems.

## 9.4 Iterative solvers

For large three-dimensional problems, iterative Krylov methods (conjugate gradient for symmetric positive-definite systems, GMRES or BiCGStab for nonsymmetric) combined with preconditioners (incomplete Cholesky, algebraic multigrid, domain-decomposition preconditioners) are indispensable. Algebraic multigrid is particularly effective on elliptic problems and scales near-linearly in the number of unknowns.

| Solver family | Best use | Cost | Memory |
|---|---|---|---|
| Banded direct | Small 1D/2D structural | \( O(Nb^2) \) | High |
| Sparse multifrontal | Medium 2D/3D | Near-optimal fill | Moderate-high |
| Conjugate gradient + AMG | Large elliptic 3D | Near-linear | Low |
| GMRES + ILU | Nonsymmetric (convection) | Iteration-dependent | Low-moderate |

# Chapter 10: Heat Transfer and Diffusion

## 10.1 Steady conduction

Fourier's law combined with conservation yields \( -\nabla\cdot(k\,\nabla T) = Q \). The Galerkin weak form parallels the elasticity derivation, with \( \mathbf{B} \) now the gradient operator on scalar shape functions and \( \mathbf{D} = k\,\mathbf{I} \). Robin (convective) boundary conditions \( -k\,\partial T/\partial n = h(T - T_\infty) \) contribute a surface stiffness

\[
\mathbf{K}_h = \int_{\Gamma_c} h\, \mathbf{N}^{\top}\mathbf{N}\, d\Gamma,
\]

and a corresponding load. Radiation introduces nonlinearity through \( \sigma \varepsilon T^4 \) terms and requires iterative linearization.

## 10.2 Transient conduction

Adding the heat-capacity term \( \rho c_p\,\partial T/\partial t \) produces a semi-discrete system \( \mathbf{C}\,\dot{\mathbf{T}} + \mathbf{K}\,\mathbf{T} = \mathbf{F}(t) \) with capacitance matrix \( \mathbf{C} = \int_\Omega \rho c_p\, \mathbf{N}^{\top}\mathbf{N}\, d\Omega \). Backward Euler is unconditionally stable and first-order accurate; Crank-Nicolson is unconditionally stable and second-order but can oscillate if the time step is much larger than a physical diffusion time. Mass-matrix lumping replaces \( \mathbf{C} \) by a diagonal row-sum matrix, which dramatically speeds up explicit schemes at modest accuracy cost.

## 10.3 Mass transport

Advection-diffusion problems \( \partial c/\partial t + \mathbf{v}\cdot\nabla c = \nabla\cdot(D\,\nabla c) + S \) are the workhorse model for contaminant transport in civil engineering. Standard Galerkin fails when the cell Peclet number \( \mathrm{Pe}_h = |\mathbf{v}|\,h/(2D) \) exceeds unity, producing wiggles. Streamline-upwind Petrov-Galerkin (SUPG), Galerkin/least-squares (GLS), and variational multiscale methods add consistent stabilization that removes oscillations while preserving accuracy on smooth solutions.

# Chapter 11: Potential Flow and Seepage

## 11.1 Governing equation

Many civil applications reduce to Laplace's equation \( \nabla^2\phi = 0 \) or Poisson's \( \nabla^2\phi = -S \). Groundwater flow through a homogeneous isotropic aquifer with hydraulic head \( h \) satisfies \( \nabla\cdot(K\,\nabla h) = 0 \) by Darcy's law and mass conservation. Seepage beneath a dam, confined and unconfined flow, and ideal irrotational fluid flow all fit this template.

## 11.2 FE discretization

The weak form is identical in structure to steady conduction. Nodes on no-flow boundaries contribute nothing (the natural condition \( \partial h/\partial n = 0 \) is satisfied automatically). Prescribed-head boundaries are essential conditions. For unconfined flow the free surface is itself unknown and is found iteratively: one guesses the phreatic surface, solves the Laplace problem, updates the surface so that both \( h = z \) and \( \partial h/\partial n = 0 \) hold there, and repeats.

## 11.3 Practical quantities

Post-processing gives seepage discharge by integrating Darcy velocity across chosen surfaces, uplift pressure on foundations, and flow-net equivalents (equipotentials and streamlines) through contour plots of head and stream function.

# Chapter 12: Structural Dynamics

## 12.1 Semi-discrete equations of motion

For a linear elastic body, the same element shape functions used in statics, combined with the virtual-work principle including inertial forces, produce the semi-discrete system

\[
\mathbf{M}\,\ddot{\mathbf{u}} + \mathbf{C}\,\dot{\mathbf{u}} + \mathbf{K}\,\mathbf{u} = \mathbf{F}(t),
\]

where \( \mathbf{M} = \int_\Omega \rho\,\mathbf{N}^{\top}\mathbf{N}\,d\Omega \) is the consistent mass matrix. Lumped mass matrices are diagonal and cheaper, at the cost of a small frequency error that is often acceptable.

## 12.2 Modal analysis

Free undamped vibration obeys \( \mathbf{M}\,\ddot{\mathbf{u}} + \mathbf{K}\,\mathbf{u} = \mathbf{0} \). Substituting \( \mathbf{u} = \boldsymbol{\phi}\, e^{i\omega t} \) yields the generalized eigenproblem

\[
\mathbf{K}\,\boldsymbol{\phi} = \omega^2\,\mathbf{M}\,\boldsymbol{\phi}.
\]

Eigenvalues \( \omega_i^2 \) are the squared natural frequencies; eigenvectors \( \boldsymbol{\phi}_i \) are mode shapes. They are \( \mathbf{M} \)-orthogonal and \( \mathbf{K} \)-orthogonal, which lets one decouple forced response into uncoupled scalar oscillators (modal superposition). Rayleigh damping \( \mathbf{C} = \alpha\mathbf{M} + \beta\mathbf{K} \) preserves this decoupling and is standard in seismic engineering.

## 12.3 Time integration

For step-by-step integration, the Newmark family

\[
\mathbf{u}_{n+1} = \mathbf{u}_n + \Delta t\,\dot{\mathbf{u}}_n + \Delta t^2\left[ (\tfrac{1}{2}-\beta)\,\ddot{\mathbf{u}}_n + \beta\,\ddot{\mathbf{u}}_{n+1} \right],
\]

\[
\dot{\mathbf{u}}_{n+1} = \dot{\mathbf{u}}_n + \Delta t\left[(1-\gamma)\,\ddot{\mathbf{u}}_n + \gamma\,\ddot{\mathbf{u}}_{n+1} \right],
\]

encompasses both explicit and implicit schemes. The average-acceleration choice \( \beta=1/4,\gamma=1/2 \) is unconditionally stable and second-order accurate; central difference (\( \beta=0,\gamma=1/2 \)) is explicit, conditionally stable (CFL), and cheap per step. HHT-\( \alpha \) and generalized-\( \alpha \) schemes add controllable numerical dissipation at high frequencies to suppress spurious oscillations without damping resolved modes.

<div class="note">
<strong>Explicit vs implicit trade-off.</strong> <em>Explicit central-difference integrators are extremely cheap per step but require tiny time steps set by the highest resolved natural frequency. Implicit Newmark schemes can take much larger steps but require solving a linear system every step. Crash and blast analyses use explicit. Earthquake response, tall-building wind, and floor-vibration problems use implicit.</em>
</div>

# Chapter 13: Error Estimation and Adaptive Meshing

## 13.1 A priori estimates

A priori theory tells us the convergence rate but needs the unknown true solution to produce an actual error. It is useful for ranking elements and planning refinement but not for runtime decisions.

## 13.2 A posteriori estimates

A posteriori estimators use the computed solution to bound the error. The Zienkiewicz-Zhu (ZZ) estimator recovers a smoother stress field \( \boldsymbol{\sigma}^* \) by patch-wise nodal averaging or superconvergent patch recovery (SPR), then defines the error indicator

\[
\eta_e^2 = \int_{\Omega_e} (\boldsymbol{\sigma}^* - \boldsymbol{\sigma}^h)^{\top}\, \mathbf{D}^{-1}\,(\boldsymbol{\sigma}^* - \boldsymbol{\sigma}^h)\, d\Omega,
\]

which is cheap to evaluate and remarkably effective. Residual-based estimators, although more mathematically rigorous, are more intrusive to implement.

## 13.3 h-, p-, and hp-adaptivity

Adaptive refinement uses the estimator to decide where to refine and how. h-adaptivity subdivides elements where \( \eta_e \) is large. p-adaptivity raises the polynomial degree on those elements. hp-adaptivity combines both and achieves exponential convergence on smooth problems with point singularities (a common civil-engineering situation near reentrant corners, cracks, and concentrated loads).

# Chapter 14: Introduction to Nonlinear FEA

## 14.1 Sources of nonlinearity

Nonlinear behavior enters FEM through several physical mechanisms:
- material nonlinearity (plasticity, damage, creep, nonlinear elasticity),
- geometric nonlinearity (large displacements and rotations, stress stiffening, buckling),
- boundary nonlinearity (contact, friction, follower loads),
- coupled-field nonlinearity (thermo-mechanical, poromechanical, fluid-structure interaction).

Each leads to a system \( \mathbf{R}(\mathbf{u}) = \mathbf{F}_{\text{int}}(\mathbf{u}) - \mathbf{F}_{\text{ext}} = \mathbf{0} \) where the internal force depends nonlinearly on the displacement.

## 14.2 Newton-Raphson iteration

The standard solver is Newton-Raphson. Linearizing the residual around the current iterate \( \mathbf{u}^{(k)} \) gives the tangent system

\[
\mathbf{K}_T(\mathbf{u}^{(k)})\,\Delta\mathbf{u} = -\mathbf{R}(\mathbf{u}^{(k)}), \qquad \mathbf{u}^{(k+1)} = \mathbf{u}^{(k)} + \Delta\mathbf{u},
\]

with \( \mathbf{K}_T = \partial\mathbf{R}/\partial\mathbf{u} \) the tangent stiffness. Near the solution, convergence is quadratic. Line search, arc-length control (Riks method), and modified Newton variants (using a stale tangent) are used when quadratic convergence fails, particularly near limit points and snap-through instabilities.

## 14.3 Plasticity

Rate-independent plasticity is governed by a yield function \( f(\boldsymbol{\sigma},\mathbf{q}) \le 0 \), a flow rule \( \dot{\boldsymbol{\varepsilon}}^p = \dot{\lambda}\,\partial g/\partial\boldsymbol{\sigma} \), and hardening laws evolving internal variables \( \mathbf{q} \). The radial-return algorithm (closest-point projection) is the canonical integration scheme for \( J_2 \) plasticity: trial elastic prediction, check yield, if violated project back to the yield surface along the gradient. The algorithm is unconditionally stable and first-order accurate, with a consistent tangent operator that preserves the quadratic convergence of the global Newton loop.

## 14.4 Large deformations

Finite-deformation FEM replaces engineering strain by a nonlinear strain measure (Green-Lagrange \( \mathbf{E} \) in a total Lagrangian formulation, or the rate-of-deformation tensor in an updated Lagrangian formulation) and pairs it with its energetically conjugate stress (second Piola-Kirchhoff or Cauchy stress respectively). The tangent stiffness now decomposes as material plus geometric (initial-stress) contributions, the latter responsible for buckling.

## 14.5 Contact

Frictionless contact imposes the Signorini conditions: no penetration, non-adhesive normal force, complementarity between gap and pressure. Penalty, Lagrange-multiplier, and augmented-Lagrangian formulations are standard. Mortar methods handle non-matching meshes consistently and are now the method of choice in large industrial problems.

# Chapter 15: Putting It Together: An Engineer's Checklist

A reliable FE analysis is the product of disciplined decisions at each step of the pipeline. An experienced analyst will ask and answer the following before drawing conclusions from a simulation:

- <strong>Is the physical model right?</strong> Continuum or discrete? Linear or nonlinear? Static or dynamic? Which terms in the balance laws dominate?
- <strong>Are the boundary conditions physical?</strong> Overconstrained models are stiff; underconstrained ones drift. Symmetry boundary conditions must be checked for genuine symmetry of loading, geometry, and material.
- <strong>Is the element choice appropriate?</strong> Low-order elements need finer meshes; higher-order elements tolerate distortion poorly. Incompressible or nearly-incompressible problems demand mixed or B-bar formulations.
- <strong>Is the mesh adequate?</strong> Mesh-convergence studies (h-refinement) or a posteriori estimators with adaptivity are the only way to trust the result, especially near stress concentrations.
- <strong>Is numerical integration correct?</strong> Full integration is safe; reduced integration requires care with hourglass control.
- <strong>Is the time integrator appropriate?</strong> Stability limits for explicit; dissipation choices for implicit; mass-lumping consequences.
- <strong>Are nonlinear iterations converging?</strong> Quadratic convergence of Newton is a health check; loss of it indicates a bad tangent, bifurcation, or step-size problem.
- <strong>Have the results been verified and validated?</strong> Verification asks whether the equations are solved correctly (patch test, manufactured solutions, benchmarks). Validation asks whether the right equations have been solved (comparison with physical experiments).

<div class="note">
<strong>Takeaway.</strong> <em>Finite element analysis is not a black box. Every step, from strong form to matrix assembly to solver choice, has assumptions that must match the problem. The value of this course is precisely that it teaches those assumptions explicitly, so the civil engineer can judge when a commercial code's answer is trustworthy and when it is not.</em>
</div>
