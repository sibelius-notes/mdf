---
why: |
  UW's numerical PDE curriculum covers finite differences (AMATH 741) and finite elements (AMATH 841) but not boundary integral methods — the third major numerical PDE paradigm. NYU Courant is the world center for this subject (Greengard, Rokhlin, O'Neil), and the fast multipole method was called one of the top ten algorithms of the twentieth century.
made_up: true
title: "AMATH 843: Integral Equation Methods for PDEs"
subjects: "AMATH"
---

*These notes synthesize material from R. Kress, Linear Integral Equations (3rd ed., Springer); K.E. Atkinson, The Numerical Solution of Integral Equations of the Second Kind (Cambridge); S. Sauter and C. Schwab, Boundary Element Methods (Springer); the foundational papers of L. Greengard and V. Rokhlin on the Fast Multipole Method; and NYU Courant MATH-GA 2011 lecture materials on integral equations.*

---

## Chapter 1: Potential Theory and Green's Functions

### 1.1 Fundamental Solutions

The theory of integral equations for partial differential equations rests on a simple but powerful idea: rather than solving a PDE directly in a volume, one can reformulate the problem in terms of integral operators defined on the boundary of the domain. This reformulation reduces the dimension of the problem by one and often yields equations with superior analytical and numerical properties. The starting point for the entire enterprise is the concept of a fundamental solution.

A fundamental solution for a linear partial differential operator \(L\) is a distribution \(\Phi(\mathbf{x}, \mathbf{y})\) satisfying \(L_{\mathbf{x}} \Phi(\mathbf{x}, \mathbf{y}) = \delta(\mathbf{x} - \mathbf{y})\) in the sense of distributions, where \(\delta\) denotes the Dirac delta function. Physically, \(\Phi\) represents the response at the point \(\mathbf{x}\) due to a unit point source located at \(\mathbf{y}\). From the fundamental solution, one constructs layer potentials and representation formulas that form the backbone of boundary integral equation methods.

<div class="definition">
<strong>Definition 1.1 (Fundamental Solution for the Laplacian).</strong> The <em>fundamental solution</em> (or free-space Green's function) for the Laplace operator \(\Delta = \nabla^2\) in \(\mathbb{R}^n\) is the function \(\Phi(\mathbf{x}, \mathbf{y})\) satisfying

\[
\Delta_{\mathbf{x}} \Phi(\mathbf{x}, \mathbf{y}) = \delta(\mathbf{x} - \mathbf{y}).
\]
Explicitly, for \(\mathbf{x} \neq \mathbf{y}\),

\[
\Phi(\mathbf{x}, \mathbf{y}) = \begin{cases} -\dfrac{1}{2\pi} \log |\mathbf{x} - \mathbf{y}|, & n = 2, \\[6pt] \dfrac{1}{4\pi |\mathbf{x} - \mathbf{y}|}, & n = 3. \end{cases}
\]
</div>

The logarithmic singularity in two dimensions and the Coulomb-type singularity in three dimensions reflect the different geometries of the respective spaces. The sign convention varies across the literature; we follow Kress, where the two-dimensional fundamental solution carries a negative sign so that the Laplacian (not its negative) equals the delta function.

<div class="definition">
<strong>Definition 1.2 (Fundamental Solution for the Helmholtz Equation).</strong> The <em>fundamental solution</em> for the Helmholtz equation \(\Delta u + k^2 u = 0\), with wavenumber \(k > 0\), is the function satisfying

\[
\Delta_{\mathbf{x}} \Phi_k(\mathbf{x}, \mathbf{y}) + k^2 \Phi_k(\mathbf{x}, \mathbf{y}) = \delta(\mathbf{x} - \mathbf{y}).
\]
In free space, the outgoing fundamental solution is

\[
\Phi_k(\mathbf{x}, \mathbf{y}) = \begin{cases} \dfrac{i}{4} H_0^{(1)}(k|\mathbf{x} - \mathbf{y}|), & n = 2, \\[6pt] \dfrac{e^{ik|\mathbf{x} - \mathbf{y}|}}{4\pi |\mathbf{x} - \mathbf{y}|}, & n = 3, \end{cases}
\]
where \(H_0^{(1)}\) denotes the Hankel function of the first kind of order zero.
</div>

The choice of the Hankel function \(H_0^{(1)}\) (rather than \(H_0^{(2)}\)) enforces the Sommerfeld radiation condition, which selects outgoing waves at infinity. This is the physically relevant choice for scattering problems. As \(k \to 0\), the Helmholtz fundamental solution degenerates (up to constants) to the Laplace fundamental solution, a fact that provides a useful consistency check and connects the static and time-harmonic theories.

<div class="remark">
<strong>Remark 1.3.</strong> The Sommerfeld radiation condition in three dimensions requires that the scattered field \(u^s\) satisfy

\[
\lim_{r \to \infty} r \left( \frac{\partial u^s}{\partial r} - ik u^s \right) = 0,
\]
uniformly in all directions, where \(r = |\mathbf{x}|\). This condition is essential for the well-posedness of exterior Helmholtz problems and for the uniqueness of boundary integral formulations in the exterior domain.
</div>

<div class="example">
<strong>Example 1.4.</strong> In two dimensions, the Helmholtz fundamental solution has the small-argument expansion

\[
\Phi_k(\mathbf{x}, \mathbf{y}) = -\frac{1}{2\pi}\log|\mathbf{x} - \mathbf{y}| + \frac{i}{4} - \frac{1}{2\pi}\left(\log\frac{k}{2} + \gamma\right) + O(k^2 |\mathbf{x} - \mathbf{y}|^2 \log|\mathbf{x} - \mathbf{y}|),
\]
where \(\gamma \approx 0.5772\) is the Euler-Mascheroni constant. This expansion shows explicitly how the Helmholtz fundamental solution reduces to the Laplace fundamental solution as \(k \to 0\), with the additional constant terms reflecting the oscillatory character of the Helmholtz equation. The logarithmic singularity is identical in both cases, which means that the singular part of the boundary integral operators is the same for Laplace and Helmholtz, and only the smooth part differs. This observation is the basis for using Laplace-kernel quadrature corrections in Helmholtz BIE codes.
</div>

### 1.2 Green's Representation Formula

The bridge between volume-based PDE theory and boundary integral equations is the Green's representation formula, which expresses a solution of a PDE inside a domain entirely in terms of boundary data and the fundamental solution. The derivation relies on Green's second identity, a classical tool from vector calculus.

<div class="theorem">
<strong>Theorem 1.4 (Green's Second Identity).</strong> Let \(\Omega \subset \mathbb{R}^n\) be a bounded domain with \(C^1\) boundary \(\Gamma = \partial\Omega\), and let \(u, v \in C^2(\overline{\Omega})\). Then

\[
\int_\Omega (u \Delta v - v \Delta u) \, d\mathbf{x} = \int_\Gamma \left( u \frac{\partial v}{\partial \nu} - v \frac{\partial u}{\partial \nu} \right) dS(\mathbf{x}),
\]
where \(\nu\) denotes the outward unit normal to \(\Gamma\) and \(dS\) is the surface measure on \(\Gamma\).
</div>

<div class="proof">
<strong>Proof.</strong> Apply the divergence theorem to the vector field \(\mathbf{F} = u \nabla v - v \nabla u\). We have \(\nabla \cdot \mathbf{F} = u \Delta v + \nabla u \cdot \nabla v - v \Delta u - \nabla v \cdot \nabla u = u \Delta v - v \Delta u\). The divergence theorem gives \(\int_\Omega \nabla \cdot \mathbf{F} \, d\mathbf{x} = \int_\Gamma \mathbf{F} \cdot \nu \, dS\), and \(\mathbf{F} \cdot \nu = u \frac{\partial v}{\partial \nu} - v \frac{\partial u}{\partial \nu}\). \(\square\)
</div>

By choosing \(v(\mathbf{x}) = \Phi(\mathbf{x}, \mathbf{y})\) in Green's second identity and carefully excising a small ball around the singularity at \(\mathbf{y}\), one obtains the celebrated Green's representation formula. This formula is the Rosetta Stone of the boundary integral equation method: it translates between volume PDE information and boundary integral data.

<div class="theorem">
<strong>Theorem 1.5 (Green's Representation Formula).</strong> Let \(\Omega \subset \mathbb{R}^n\) (\(n = 2\) or \(3\)) be a bounded domain with \(C^2\) boundary \(\Gamma\), and let \(u \in C^2(\overline{\Omega})\) satisfy \(\Delta u = 0\) in \(\Omega\). Then for \(\mathbf{y} \in \Omega\),

\[
u(\mathbf{y}) = \int_\Gamma \left[ \frac{\partial u}{\partial \nu}(\mathbf{x}) \Phi(\mathbf{x}, \mathbf{y}) - u(\mathbf{x}) \frac{\partial \Phi(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{x})} \right] dS(\mathbf{x}).
\]
For \(\mathbf{y}\) in the exterior \(\mathbb{R}^n \setminus \overline{\Omega}\), the right-hand side evaluates to zero.
</div>

This representation expresses any harmonic function inside \(\Omega\) in terms of its boundary values \(u|_\Gamma\) and its normal derivative \(\frac{\partial u}{\partial \nu}\big|_\Gamma\). For a well-posed boundary value problem, one of these quantities is given as data and the other is unknown; the task of the boundary integral equation is to determine the unknown boundary quantity.

### 1.3 Single-Layer and Double-Layer Potentials

The two integrals appearing in Green's representation formula motivate the definition of two fundamental objects: the single-layer and double-layer potentials. These potentials, defined for arbitrary densities on the boundary, are the building blocks from which all boundary integral formulations are constructed.

<div class="definition">
<strong>Definition 1.6 (Single-Layer Potential).</strong> Given a continuous density \(\varphi \in C(\Gamma)\), the <em>single-layer potential</em> with density \(\varphi\) is

\[
(\mathcal{S}\varphi)(\mathbf{y}) = \int_\Gamma \Phi(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{x}) \, dS(\mathbf{x}), \quad \mathbf{y} \notin \Gamma.
\]
</div>

<div class="definition">
<strong>Definition 1.7 (Double-Layer Potential).</strong> Given a continuous density \(\psi \in C(\Gamma)\), the <em>double-layer potential</em> with density \(\psi\) is

\[
(\mathcal{D}\psi)(\mathbf{y}) = \int_\Gamma \frac{\partial \Phi(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{x})} \psi(\mathbf{x}) \, dS(\mathbf{x}), \quad \mathbf{y} \notin \Gamma.
\]
</div>

Physically, the single-layer potential represents the field generated by a continuous distribution of point sources of strength \(\varphi\) on the boundary, while the double-layer potential represents the field generated by a distribution of dipoles. The single-layer potential produces a continuous field across \(\Gamma\) but with a discontinuous normal derivative, while the double-layer potential itself is discontinuous across \(\Gamma\) but has a continuous normal derivative. These complementary regularity properties are precisely captured by the jump relations.

<div class="example">
<strong>Example 1.8.</strong> Consider the unit circle \(\Gamma = \{(\cos\theta, \sin\theta) : \theta \in [0, 2\pi)\}\) in \(\mathbb{R}^2\) with constant density \(\varphi(\mathbf{x}) = 1\). The single-layer potential at the center \(\mathbf{y} = \mathbf{0}\) is

\[
(\mathcal{S}\varphi)(\mathbf{0}) = \int_0^{2\pi} \left(-\frac{1}{2\pi}\right) \log|(\cos\theta, \sin\theta)| \, d\theta = -\frac{1}{2\pi} \int_0^{2\pi} \log 1 \, d\theta = 0.
\]
For \(\mathbf{y} = \mathbf{0}\) inside the unit disk and constant density \(\psi = 1\), the double-layer potential evaluates to

\[
(\mathcal{D}\psi)(\mathbf{0}) = \int_0^{2\pi} \frac{\partial}{\partial \nu_{\mathbf{x}}} \left(-\frac{1}{2\pi} \log|\mathbf{x}|\right) \bigg|_{|\mathbf{x}|=1} d\theta = \int_0^{2\pi} \left(-\frac{1}{2\pi}\right) d\theta = -1.
\]
This illustrates the classical result that the double-layer potential with constant density \(1\) evaluates to \(-1\) inside a smooth closed curve and \(0\) outside, reflecting the solid angle subtended by the boundary.
</div>

### 1.4 Jump Relations Across Boundaries

The behavior of layer potentials as the evaluation point \(\mathbf{y}\) approaches the boundary \(\Gamma\) is one of the central results in potential theory. The jump relations govern this limiting behavior and are essential for deriving boundary integral equations from representation formulas.

<div class="theorem">
<strong>Theorem 1.9 (Jump Relations for Layer Potentials).</strong> Let \(\Gamma\) be a \(C^2\) boundary and let \(\varphi, \psi \in C(\Gamma)\). Denote by \(\mathbf{y}^+\) and \(\mathbf{y}^-\) the limits as \(\mathbf{y}\) approaches a point \(\mathbf{y}_0 \in \Gamma\) from the exterior and interior, respectively. Then:

(i) The single-layer potential \(\mathcal{S}\varphi\) is continuous across \(\Gamma\):

\[
\lim_{\mathbf{y} \to \mathbf{y}_0^\pm} (\mathcal{S}\varphi)(\mathbf{y}) = \int_\Gamma \Phi(\mathbf{x}, \mathbf{y}_0) \varphi(\mathbf{x}) \, dS(\mathbf{x}).
\]

(ii) The normal derivative of the single-layer potential has a jump:

\[
\lim_{\mathbf{y} \to \mathbf{y}_0^\pm} \frac{\partial (\mathcal{S}\varphi)}{\partial \nu(\mathbf{y}_0)}(\mathbf{y}) = \mp \frac{1}{2}\varphi(\mathbf{y}_0) + \int_\Gamma \frac{\partial \Phi(\mathbf{x}, \mathbf{y}_0)}{\partial \nu(\mathbf{y}_0)} \varphi(\mathbf{x}) \, dS(\mathbf{x}).
\]

(iii) The double-layer potential has a jump:

\[
\lim_{\mathbf{y} \to \mathbf{y}_0^\pm} (\mathcal{D}\psi)(\mathbf{y}) = \pm \frac{1}{2}\psi(\mathbf{y}_0) + \int_\Gamma \frac{\partial \Phi(\mathbf{x}, \mathbf{y}_0)}{\partial \nu(\mathbf{x})} \psi(\mathbf{x}) \, dS(\mathbf{x}).
\]
</div>

The \(\pm \frac{1}{2}\) terms arise from the solid angle subtended by the boundary at a point on itself. For smooth boundaries, this solid angle is exactly \(2\pi\) (in 2D) or \(2\pi\) steradians (in 3D, corresponding to a half-sphere), leading to the factor of \(\frac{1}{2}\). At corners or edges of non-smooth boundaries, the solid angle differs from \(2\pi\) and the coefficient \(\frac{1}{2}\) is replaced by a geometry-dependent value \(\frac{\omega(\mathbf{x}_0)}{2\pi}\), where \(\omega(\mathbf{x}_0)\) is the interior solid angle at the boundary point \(\mathbf{x}_0\). For a two-dimensional domain with a corner of interior angle \(\alpha\), the coefficient becomes \(\frac{\alpha}{2\pi}\).

These jump relations were first established rigorously by Carl Neumann in the 1870s for smooth boundaries, and their extension to Lipschitz domains was completed in the 1980s by Verchota, Dahlberg, and Kenig. They remain the cornerstone of the boundary integral equation method.

<div class="remark">
<strong>Remark 1.10.</strong> The sign convention in the jump relations depends on the orientation of the normal. We adopt the convention that \(\nu\) points outward from the interior domain \(\Omega\), so the "+" superscript denotes the exterior limit and "-" the interior limit. The reader should be careful when consulting different references, as Kress and Atkinson use slightly different conventions for the normal direction.
</div>

The jump relations immediately yield boundary integral equations. For instance, if \(u\) is harmonic in \(\Omega\) and we represent it as a double-layer potential \(u = \mathcal{D}\psi\), then taking the interior limit and using the jump relation gives

\[
u(\mathbf{y}_0) = -\frac{1}{2}\psi(\mathbf{y}_0) + \int_\Gamma \frac{\partial \Phi(\mathbf{x}, \mathbf{y}_0)}{\partial \nu(\mathbf{x})} \psi(\mathbf{x}) \, dS(\mathbf{x}), \quad \mathbf{y}_0 \in \Gamma.
\]
If \(u|_\Gamma = f\) is prescribed (Dirichlet problem), this becomes a second-kind Fredholm integral equation for the unknown density \(\psi\). This observation, due to Carl Neumann, launched the entire field.

<div class="example">
<strong>Example 1.11.</strong> To illustrate the jump relations concretely, consider the double-layer potential on the unit circle in \(\mathbb{R}^2\) with density \(\psi(\theta) = \cos(n\theta)\) for integer \(n \geq 1\). Using the expansion of the double-layer kernel in Fourier modes, one can show that the boundary operator satisfies \(D[\cos(n\theta)] = -\frac{1}{2}\cos(n\theta)\) for all \(n \geq 1\), while \(D[1] = -\frac{1}{2}\). Thus the eigenvalues of \(D\) on the circle are all equal to \(-\frac{1}{2}\), which is a degenerate situation peculiar to the circle. For general smooth convex curves, the eigenvalues of \(D\) cluster at \(-\frac{1}{2}\) as the curve approaches a circle, but spread out as the eccentricity increases.
</div>

<div class="remark">
<strong>Remark 1.12.</strong> The jump relations extend to domains with Lipschitz boundaries, though the analysis is considerably more involved. The foundational work of Verchota (1984) and Dahlberg, Kenig, and others established that the layer potentials are bounded on \(L^2(\Gamma)\) for Lipschitz domains, with the Cauchy principal value integral existing almost everywhere. For \(C^{1,\alpha}\) boundaries (Holder-continuously differentiable), the operators are compact on \(C(\Gamma)\) and the classical Fredholm theory applies directly. The Lipschitz case requires the more subtle tools of Calderon-Zygmund theory.
</div>

## Chapter 2: Fredholm Theory

### 2.1 Compact Operators on Banach Spaces

The boundary integral equations that arise from potential theory are, in favorable circumstances, Fredholm integral equations of the second kind. The analysis of such equations relies on the spectral theory of compact operators, a beautiful and complete theory developed by Ivar Fredholm (1903), Frigyes Riesz (1918), and Juliusz Schauder (1930). This chapter develops the abstract functional-analytic framework before we return to its application to boundary integral equations.

<div class="definition">
<strong>Definition 2.1 (Compact Operator).</strong> Let \(X\) and \(Y\) be Banach spaces. A bounded linear operator \(T: X \to Y\) is called <em>compact</em> if it maps bounded sets to relatively compact sets, i.e., if for every bounded sequence \((x_n)\) in \(X\), the sequence \((Tx_n)\) in \(Y\) has a convergent subsequence.
</div>

Compact operators can be thought of as "almost finite-dimensional" operators: they are limits (in the operator norm) of finite-rank operators when \(X\) is a Hilbert space, and they enjoy spectral properties reminiscent of finite-dimensional linear algebra. The prototypical example in our setting is an integral operator with a continuous or weakly singular kernel.

<div class="example">
<strong>Example 2.2.</strong> Let \(\Gamma\) be a smooth compact surface in \(\mathbb{R}^3\) and let \(K(\mathbf{x}, \mathbf{y})\) be a continuous kernel on \(\Gamma \times \Gamma\). The integral operator

\[
(T\varphi)(\mathbf{x}) = \int_\Gamma K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y})
\]
defines a compact operator \(T: C(\Gamma) \to C(\Gamma)\). This follows from the Arzel\`a--Ascoli theorem: the image of the unit ball under \(T\) is equicontinuous (by uniform continuity of \(K\) on the compact set \(\Gamma \times \Gamma\)) and uniformly bounded.
</div>

More generally, integral operators with weakly singular kernels — kernels that blow up at the diagonal but are integrable — are also compact. This is the case for the single-layer boundary operator on smooth boundaries.

<div class="definition">
<strong>Definition 2.3 (Weakly Singular Kernel).</strong> A kernel \(K(\mathbf{x}, \mathbf{y})\) on \(\Gamma \times \Gamma\) is called <em>weakly singular</em> if there exist constants \(C > 0\) and \(0 < \alpha < n-1\) (where \(n-1 = \dim\Gamma\)) such that

\[
|K(\mathbf{x}, \mathbf{y})| \leq \frac{C}{|\mathbf{x} - \mathbf{y}|^\alpha}, \quad \mathbf{x} \neq \mathbf{y}.
\]
More generally, in two dimensions, a kernel with a logarithmic singularity \(|K(\mathbf{x}, \mathbf{y})| \leq C|\log|\mathbf{x} - \mathbf{y}||\) is also considered weakly singular. Integral operators with weakly singular kernels are compact on \(C(\Gamma)\) and on \(L^2(\Gamma)\).
</div>

The compactness of weakly singular integral operators follows from a refinement of the Arzela-Ascoli argument: although the kernel is unbounded, the integrability of the singularity ensures that the operator still maps bounded sets to equicontinuous sets. This result, due to various authors including Kress and Atkinson, underpins the applicability of Fredholm theory to boundary integral operators.

<div class="theorem">
<strong>Theorem 2.4 (Schauder, 1930).</strong> Let \(X\) and \(Y\) be Banach spaces and \(T: X \to Y\) a compact linear operator. Then the adjoint operator \(T^*: Y^* \to X^*\) is also compact.
</div>

This result is important because it allows us to pass between an integral equation and its adjoint (or transpose) equation, a maneuver that is frequently necessary in indirect boundary integral formulations.

### 2.2 Fredholm Integral Equations

The integral equations that arise from boundary value problems fall into two main classes. Understanding their distinct characters is essential for choosing appropriate solution strategies.

<div class="definition">
<strong>Definition 2.5 (Fredholm Integral Equations).</strong> Let \(K\) be a continuous or weakly singular kernel on \(\Gamma \times \Gamma\) and \(f \in C(\Gamma)\). A <em>Fredholm integral equation of the first kind</em> is

\[
\int_\Gamma K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y}) = f(\mathbf{x}), \quad \mathbf{x} \in \Gamma.
\]
A <em>Fredholm integral equation of the second kind</em> is

\[
\varphi(\mathbf{x}) - \lambda \int_\Gamma K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y}) = f(\mathbf{x}), \quad \mathbf{x} \in \Gamma,
\]
where \(\lambda \in \mathbb{C}\) is a parameter.
</div>

First-kind equations are inherently ill-posed in the sense of Hadamard: small perturbations in \(f\) can lead to large changes in \(\varphi\), because the compact operator \(T\) has eigenvalues accumulating at zero. Second-kind equations, by contrast, enjoy the full power of the Fredholm alternative and are generally well-posed. This is why the indirect and direct formulations of boundary integral equations strive to produce second-kind equations whenever possible.

In operator notation, a second-kind equation reads \((I - \lambda T)\varphi = f\), where \(T\) is the compact integral operator and \(I\) is the identity. The structure \(I - \lambda T\) (identity minus a compact perturbation) is the key that unlocks the Fredholm theory.

<div class="remark">
<strong>Remark 2.6.</strong> The distinction between first-kind and second-kind equations has profound practical consequences. For a first-kind equation \(T\varphi = f\), the compactness of \(T\) means that \(T^{-1}\) (if it exists) is necessarily unbounded — an inevitable consequence of the open mapping theorem combined with the fact that a compact bijection between infinite-dimensional spaces cannot have bounded inverse. This unboundedness manifests as ill-conditioning: the condition number of the \(N \times N\) discretization matrix grows without bound as \(N \to \infty\). Regularization techniques (Tikhonov, truncated SVD) are therefore essential for the stable numerical solution of first-kind equations.
</div>

### 2.3 The Fredholm Alternative

The Fredholm alternative is the central result of the theory. It provides a complete dichotomy: either the equation \((I - \lambda T)\varphi = f\) has a unique solution for every right-hand side, or the homogeneous equation has nontrivial solutions and solvability of the inhomogeneous equation is governed by a finite-dimensional compatibility condition. There is no middle ground.

<div class="theorem">
<strong>Theorem 2.7 (Fredholm Alternative).</strong> Let \(X\) be a Banach space, \(T: X \to X\) a compact linear operator, and \(\lambda \neq 0\). Then exactly one of the following holds:
<ol>
<li>The equation \((I - \lambda T)\varphi = f\) has a unique solution \(\varphi \in X\) for every \(f \in X\). In this case, the inverse operator \((I - \lambda T)^{-1}\) is bounded.</li>
<li>The homogeneous equation \((I - \lambda T)\varphi = 0\) has a finite-dimensional space of nontrivial solutions. In this case, \((I - \lambda T)\varphi = f\) is solvable if and only if \(f\) is orthogonal to all solutions of the adjoint homogeneous equation \((I - \lambda T^*)\psi = 0\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> We outline the main steps following Riesz's approach. The key idea is that \(I - \lambda T\) is a Fredholm operator of index zero. 

Step 1: The kernel \(\ker(I - \lambda T)\) is finite-dimensional. Indeed, on \(\ker(I - \lambda T)\), the identity \(I = \lambda T\), so the identity acts as a compact operator on this subspace, which is only possible if the subspace is finite-dimensional.

Step 2: The range \(\mathrm{ran}(I - \lambda T)\) is closed. This follows from the fact that on the quotient space \(X / \ker(I - \lambda T)\), the induced operator is bounded below (by a compactness argument).

Step 3: The Fredholm index is zero: \(\dim \ker(I - \lambda T) = \dim \ker(I - \lambda T^*)\). This is proved by a continuity argument: the index of \(I - tT\) is continuous in \(t \in [0,1]\) and equals zero at \(t = 0\) (where the operator is the identity), hence equals zero at \(t = \lambda\).

Step 4: Combining these steps, if \(\ker(I - \lambda T) = \{0\}\), then \(I - \lambda T\) is bijective and the bounded inverse follows from the open mapping theorem. If \(\ker(I - \lambda T) \neq \{0\}\), then solvability of \((I - \lambda T)\varphi = f\) requires \(f \perp \ker(I - \lambda T^*)\) by the closed range theorem. \(\square\)
</div>

The Fredholm alternative reduces the question of solvability of an integral equation to a finite-dimensional problem: one must check whether the homogeneous equation has nontrivial solutions and, if so, verify a finite number of orthogonality conditions. For the boundary integral equations of potential theory, uniqueness of the underlying PDE boundary value problem often (but not always) guarantees that the first alternative holds.

<div class="example">
<strong>Example 2.8.</strong> Consider the integral equation on \([0,1]\):

\[
\varphi(x) - \lambda \int_0^1 e^{x+y} \varphi(y) \, dy = f(x).
\]
The kernel \(K(x,y) = e^{x+y} = e^x e^y\) has rank one, so the integral operator \(T\) has a single nonzero eigenvalue. Indeed, \(T\varphi = e^x \int_0^1 e^y \varphi(y) \, dy\), so the only eigenfunction is \(\varphi_0(x) = e^x\) with eigenvalue \(\lambda_0 = \int_0^1 e^{2y} \, dy = \frac{1}{2}(e^2 - 1)\). By the Fredholm alternative, the equation is uniquely solvable for \(\lambda \neq 1/\lambda_0 = 2/(e^2 - 1)\), and for \(\lambda = 2/(e^2 - 1)\), it is solvable if and only if \(\int_0^1 e^y f(y) \, dy = 0\).
</div>

<div class="remark">
<strong>Remark 2.9.</strong> Fredholm's original 1903 paper established this alternative for integral equations with continuous kernels using determinant-theoretic methods, constructing what are now called Fredholm determinants. Riesz later gave a purely functional-analytic proof that extended the result to abstract compact operators on Banach spaces. The abstract approach is far more flexible and is the one we present here.
</div>

### 2.4 Spectral Theory of Compact Operators

The spectral theory of compact operators on Banach (and especially Hilbert) spaces provides detailed information about the eigenvalues and eigenfunctions that govern the behavior of integral equations.

<div class="theorem">
<strong>Theorem 2.10 (Riesz-Schauder).</strong> Let \(T: X \to X\) be a compact operator on a Banach space \(X\). Then:
<ol>
<li>The spectrum \(\sigma(T)\) is at most countable, with \(0\) as its only possible accumulation point.</li>
<li>Every nonzero \(\lambda \in \sigma(T)\) is an eigenvalue of finite algebraic multiplicity.</li>
<li>For each nonzero eigenvalue \(\lambda\), there exists a smallest integer \(p \geq 1\) (the <em>ascent</em>) such that \(\ker(I - \lambda^{-1} T)^p = \ker(I - \lambda^{-1} T)^{p+1}\). The algebraic multiplicity equals \(\dim \ker(I - \lambda^{-1} T)^p\).</li>
</ol>
</div>

For self-adjoint compact operators on Hilbert spaces, the spectral theorem takes an especially elegant form that is directly relevant to the analysis of symmetric kernels.

<div class="theorem">
<strong>Theorem 2.11 (Spectral Theorem for Compact Self-Adjoint Operators).</strong> Let \(H\) be a separable Hilbert space and \(T: H \to H\) a compact self-adjoint operator. Then there exists an orthonormal sequence \((\varphi_n)\) of eigenvectors with corresponding real eigenvalues \((\lambda_n)\) satisfying \(\lambda_n \to 0\), such that

\[
T = \sum_{n=1}^\infty \lambda_n \langle \cdot, \varphi_n \rangle \varphi_n,
\]
where the series converges in the operator norm.
</div>

<div class="example">
<strong>Example 2.12.</strong> Consider the integral operator on \(L^2([0,1])\) defined by

\[
(T\varphi)(x) = \int_0^1 \min(x,y) \, \varphi(y) \, dy.
\]
The kernel \(K(x,y) = \min(x,y)\) is the Green's function for \(-u'' = f\) on \([0,1]\) with boundary conditions \(u(0) = u'(1) = 0\). This operator is compact and self-adjoint. Its eigenvalues are \(\lambda_n = \frac{1}{(n - \frac{1}{2})^2 \pi^2}\) with eigenfunctions \(\varphi_n(x) = \sqrt{2}\sin\!\big((n - \frac{1}{2})\pi x\big)\), \(n = 1, 2, \ldots\). The eigenvalues decay as \(O(n^{-2})\), which is typical for second-order elliptic Green's functions.
</div>

The rate of decay of eigenvalues is intimately connected to the smoothness of the kernel: smoother kernels have faster-decaying eigenvalues, and this in turn controls the conditioning of the integral equation and the convergence rates of numerical methods.

<div class="remark">
<strong>Remark 2.13.</strong> For a second-kind equation \((I - \lambda T)\varphi = f\) with \(|\lambda| \|T\| < 1\), the Neumann series \(\varphi = \sum_{n=0}^\infty \lambda^n T^n f\) converges geometrically. Even when \(|\lambda| \|T\| \geq 1\), the series may still converge if the spectral radius \(r(T) < 1/|\lambda|\). For compact operators, the spectral radius can be much smaller than the operator norm. In the context of boundary integral equations, the Neumann series corresponds to the classical method of successive approximations introduced by Carl Neumann in 1877 for the Laplace equation on convex domains, where the double-layer operator has spectral radius strictly less than \(\frac{1}{2}\). Neumann's method thus converges for the interior Dirichlet problem, though modern iterative methods (GMRES) are far more efficient in practice.
</div>

### 2.5 Riesz-Schauder Theory and the Resolvent

The resolvent operator \(R(\lambda; T) = (I - \lambda T)^{-1}\), when it exists, is a bounded operator that depends analytically on \(\lambda\) in the resolvent set. The Riesz-Schauder theory provides a complete description of the singularities of this analytic operator-valued function.

<div class="theorem">
<strong>Theorem 2.14 (Analytic Fredholm Theorem).</strong> Let \(T: X \to X\) be a compact operator on a Banach space \(X\). The resolvent \(R(\lambda; T) = (I - \lambda T)^{-1}\) is a meromorphic operator-valued function on \(\mathbb{C}\). The poles of \(R(\lambda; T)\) are precisely the reciprocals of the nonzero eigenvalues of \(T\), and the Laurent expansion at each pole involves the Riesz projection onto the corresponding generalized eigenspace.
</div>

This theorem is essential in the analysis of integral equations depending on a parameter (such as the wavenumber \(k\) in the Helmholtz equation). It guarantees that failure of unique solvability can only occur at isolated parameter values, and the behavior near these exceptional values is completely controlled by finite-dimensional linear algebra.

<div class="remark">
<strong>Remark 2.15.</strong> The analytic Fredholm theorem has far-reaching consequences in scattering theory. The poles of the resolvent in the complex \(k\)-plane correspond to resonances of the scattering problem. The distribution of these poles governs the time-decay of waves and the structure of scattering resonances, connecting the integral equation formulation to deep questions in mathematical physics.
</div>

## Chapter 3: Boundary Integral Equations

### 3.1 Direct and Indirect Methods

With the functional-analytic machinery of Fredholm theory in hand, we now return to the boundary integral equations that arise from potential theory. There are two fundamentally different approaches to formulating boundary integral equations for a given PDE boundary value problem: the direct method and the indirect method. Each has its own advantages, and the choice between them depends on the problem at hand.

The direct method starts from Green's representation formula (Theorem 1.5) and uses the prescribed boundary data directly. The resulting integral equation involves the physical boundary data (values of \(u\) and \(\frac{\partial u}{\partial \nu}\)), and the unknown is the missing piece of boundary data. This approach is natural and yields equations with clear physical interpretations.

The indirect method, by contrast, represents the solution as a single-layer or double-layer potential with an unknown density function that typically has no direct physical meaning. The boundary condition then yields an integral equation for this fictitious density. The indirect method often produces simpler integral equations at the cost of a less transparent physical interpretation.

<div class="definition">
<strong>Definition 3.1 (Boundary Integral Operators).</strong> For a domain \(\Omega\) with \(C^2\) boundary \(\Gamma\), define the following boundary integral operators acting on densities \(\varphi \in C(\Gamma)\):

The <em>single-layer boundary operator</em>:

\[
(S\varphi)(\mathbf{x}) = \int_\Gamma \Phi(\mathbf{y}, \mathbf{x}) \varphi(\mathbf{y}) \, dS(\mathbf{y}), \quad \mathbf{x} \in \Gamma.
\]
The <em>double-layer boundary operator</em>:

\[
(D\varphi)(\mathbf{x}) = \int_\Gamma \frac{\partial \Phi(\mathbf{y}, \mathbf{x})}{\partial \nu(\mathbf{y})} \varphi(\mathbf{x}) \, dS(\mathbf{y}), \quad \mathbf{x} \in \Gamma.
\]
The <em>adjoint double-layer operator</em>:

\[
(D'\varphi)(\mathbf{x}) = \int_\Gamma \frac{\partial \Phi(\mathbf{y}, \mathbf{x})}{\partial \nu(\mathbf{x})} \varphi(\mathbf{y}) \, dS(\mathbf{y}), \quad \mathbf{x} \in \Gamma.
\]
The <em>hypersingular operator</em>:

\[
(N\varphi)(\mathbf{x}) = \frac{\partial}{\partial \nu(\mathbf{x})} \int_\Gamma \frac{\partial \Phi(\mathbf{y}, \mathbf{x})}{\partial \nu(\mathbf{y})} \varphi(\mathbf{y}) \, dS(\mathbf{y}), \quad \mathbf{x} \in \Gamma.
\]
</div>

These four operators — \(S\), \(D\), \(D'\), and \(N\) — are collectively known as the Calderon projector operators or boundary integral operators. They satisfy important algebraic relations (the Calderon identities) that connect the interior and exterior problems and provide consistency checks for numerical implementations.

<div class="theorem">
<strong>Theorem 3.2 (Calderon Identities).</strong> The boundary integral operators for the Laplace equation satisfy the following relations on \(\Gamma\):

\[
D^2 = \tfrac{1}{4}I + S N, \quad (D')^2 = \tfrac{1}{4}I + NS, \quad DS = SD', \quad ND = D'N.
\]
These identities express the fact that the Calderon projector

\[
\mathcal{C} = \begin{pmatrix} -D & S \\ -N & D' \end{pmatrix} + \frac{1}{2}I
\]
is idempotent: \(\mathcal{C}^2 = \mathcal{C}\). Geometrically, \(\mathcal{C}\) projects the space of all boundary Cauchy data \((u|_\Gamma, \partial_\nu u|_\Gamma)\) onto the subspace of Cauchy data that extend to harmonic functions in the interior.
</div>

The Calderon identities have important implications for the conditioning of boundary integral equations and for the construction of preconditioners. For instance, the relation \(D^2 = \frac{1}{4}I + SN\) suggests that \(S\) can serve as a preconditioner for \(N\) (and vice versa), an idea that underlies the operator preconditioning approach of Steinbach and Wendland.

### 3.2 Interior Dirichlet Problem for the Laplace Equation

We begin with the most classical boundary value problem: the interior Dirichlet problem for Laplace's equation.

<div class="definition">
<strong>Definition 3.3 (Interior Dirichlet Problem).</strong> Given a bounded domain \(\Omega \subset \mathbb{R}^n\) with \(C^2\) boundary \(\Gamma\) and data \(f \in C(\Gamma)\), the <em>interior Dirichlet problem</em> is to find \(u \in C^2(\Omega) \cap C(\overline{\Omega})\) satisfying

\[
\Delta u = 0 \quad \text{in } \Omega, \qquad u = f \quad \text{on } \Gamma.
\]
</div>

The existence and uniqueness of solutions to this problem are guaranteed by classical potential theory (the maximum principle gives uniqueness; Perron's method gives existence for general domains).

**Direct method.** Green's representation formula, combined with the jump relation for the double-layer potential, yields the boundary integral equation

\[
\frac{1}{2} u(\mathbf{x}) + \int_\Gamma \frac{\partial \Phi(\mathbf{y}, \mathbf{x})}{\partial \nu(\mathbf{y})} u(\mathbf{y}) \, dS(\mathbf{y}) = \int_\Gamma \Phi(\mathbf{y}, \mathbf{x}) \frac{\partial u}{\partial \nu}(\mathbf{y}) \, dS(\mathbf{y}), \quad \mathbf{x} \in \Gamma.
\]
Here \(u|_\Gamma = f\) is known, and the unknown is the Neumann data \(g = \frac{\partial u}{\partial \nu}\big|_\Gamma\). Rearranging, this is a first-kind equation \(Sg = \frac{1}{2}f + Df\) for \(g\).

**Indirect method (double-layer ansatz).** Represent the solution as a double-layer potential:

\[
u(\mathbf{y}) = \int_\Gamma \frac{\partial \Phi(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{x})} \psi(\mathbf{x}) \, dS(\mathbf{x}), \quad \mathbf{y} \in \Omega.
\]
Taking the interior limit and applying the jump relation gives the second-kind Fredholm equation

\[
-\frac{1}{2}\psi(\mathbf{x}) + (D\psi)(\mathbf{x}) = f(\mathbf{x}), \quad \mathbf{x} \in \Gamma.
\]

<div class="theorem">
<strong>Theorem 3.4 (Solvability of the Interior Dirichlet Problem).</strong> For a bounded domain \(\Omega\) with \(C^2\) boundary, the integral equation \(-\frac{1}{2}\psi + D\psi = f\) is uniquely solvable for every \(f \in C(\Gamma)\). The operator \(D\) is compact on \(C(\Gamma)\), so this is a second-kind Fredholm equation to which the Fredholm alternative applies. Uniqueness of the PDE (by the maximum principle) transfers to uniqueness of the integral equation, and the first Fredholm alternative holds.
</div>

<div class="proof">
<strong>Proof.</strong> Suppose \(-\frac{1}{2}\psi_0 + D\psi_0 = 0\). Then the double-layer potential \(u\) with density \(\psi_0\) satisfies \(u = 0\) on \(\Gamma\) from the interior, hence \(u = 0\) in \(\Omega\) by the maximum principle. From the exterior, the jump relation gives \(u^+ = \psi_0 + u^- = \psi_0\) on \(\Gamma\). We must show \(\psi_0 = 0\). The double-layer potential is harmonic in the exterior domain and vanishes at infinity (in 3D). Since the normal derivative is continuous across \(\Gamma\) for a double-layer potential, we have \(\frac{\partial u}{\partial \nu}\big|^+ = \frac{\partial u}{\partial \nu}\big|^- = 0\) (using \(u^- = 0\)). The exterior function \(u^+\) is harmonic with vanishing normal derivative on \(\Gamma\), so by the exterior uniqueness theorem (using the decay at infinity), \(u^+ = 0\) in the exterior, giving \(\psi_0 = u^+ - u^- = 0\) on \(\Gamma\). By the Fredholm alternative, unique solvability for all \(f\) follows. \(\square\)
</div>

### 3.3 Interior Neumann Problem

<div class="definition">
<strong>Definition 3.5 (Interior Neumann Problem).</strong> Given data \(g \in C(\Gamma)\) satisfying the compatibility condition \(\int_\Gamma g \, dS = 0\), find \(u \in C^2(\Omega) \cap C^1(\overline{\Omega})\) satisfying

\[
\Delta u = 0 \quad \text{in } \Omega, \qquad \frac{\partial u}{\partial \nu} = g \quad \text{on } \Gamma.
\]
The solution is unique up to an additive constant.
</div>

For the Neumann problem, the indirect method uses a single-layer ansatz \(u = \mathcal{S}\varphi\). Taking the interior normal derivative and using the jump relation gives

\[
\frac{1}{2}\varphi(\mathbf{x}) + (D'\varphi)(\mathbf{x}) = g(\mathbf{x}), \quad \mathbf{x} \in \Gamma.
\]
This is again a second-kind Fredholm equation, but now the homogeneous equation \(\frac{1}{2}\varphi_0 + D'\varphi_0 = 0\) has the one-dimensional solution space spanned by the constant function (reflecting the non-uniqueness of the Neumann problem up to constants). By the Fredholm alternative, solvability requires \(g \perp \ker(\frac{1}{2}I + D) = \text{span}\{1\}\), which is precisely the compatibility condition \(\int_\Gamma g \, dS = 0\).

<div class="example">
<strong>Example 3.6.</strong> Consider the interior Neumann problem on the unit disk in \(\mathbb{R}^2\) with data \(g(\theta) = \cos\theta\). The compatibility condition \(\int_0^{2\pi} \cos\theta \, d\theta = 0\) is satisfied. The solution is \(u(r,\theta) = r\cos\theta + C\) for arbitrary constant \(C\), and the single-layer density solving the integral equation is \(\varphi(\theta) = -\frac{1}{\pi}\cos\theta\). One can verify this by direct computation using the Fourier expansion of the single-layer kernel on the circle.
</div>

### 3.4 Exterior Problems and Uniqueness

Exterior boundary value problems require special care because the unbounded domain introduces complications not present in the interior case. For the Laplace equation, one must impose a decay condition at infinity to ensure uniqueness; for the Helmholtz equation, one imposes the Sommerfeld radiation condition.

<div class="definition">
<strong>Definition 3.7 (Exterior Dirichlet Problem).</strong> Let \(\Omega\) be a bounded domain with \(C^2\) boundary \(\Gamma\) and let \(\Omega^+ = \mathbb{R}^n \setminus \overline{\Omega}\). Given \(f \in C(\Gamma)\), find \(u \in C^2(\Omega^+) \cap C(\overline{\Omega^+})\) satisfying

\[
\Delta u = 0 \quad \text{in } \Omega^+, \qquad u = f \quad \text{on } \Gamma,
\]
with the decay condition \(u(\mathbf{x}) = O(|\mathbf{x}|^{2-n})\) as \(|\mathbf{x}| \to \infty\) for \(n = 3\), or \(u(\mathbf{x}) = o(1)\) as \(|\mathbf{x}| \to \infty\) for \(n = 2\) (or boundedness, depending on the convention).
</div>

The indirect double-layer formulation for the exterior Dirichlet problem leads to the equation

\[
\frac{1}{2}\psi(\mathbf{x}) + (D\psi)(\mathbf{x}) = f(\mathbf{x}), \quad \mathbf{x} \in \Gamma,
\]
where the sign in front of the \(\frac{1}{2}\) has changed relative to the interior problem due to the reversal of the limiting direction. However, this equation has a nontrivial kernel: the constant function satisfies the homogeneous equation in two dimensions. This reflects the fact that the exterior Laplace Dirichlet problem in 2D requires careful handling of the logarithmic capacity.

<div class="theorem">
<strong>Theorem 3.8 (Uniqueness Failure and Remedies).</strong> For the exterior Dirichlet problem in \(\mathbb{R}^2\), the double-layer integral equation \(\frac{1}{2}\psi + D\psi = f\) fails to be uniquely solvable when the logarithmic capacity of \(\Gamma\) equals \(1\). This deficiency can be remedied by using a combined single- and double-layer ansatz:

\[
u(\mathbf{y}) = \int_\Gamma \left[ \frac{\partial \Phi(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{x})} - i\eta \Phi(\mathbf{x}, \mathbf{y}) \right] \psi(\mathbf{x}) \, dS(\mathbf{x}),
\]
with \(\eta \in \mathbb{R} \setminus \{0\}\). The resulting integral equation is uniquely solvable for all \(f\).
</div>

The idea of the combined-layer approach is to break the symmetry that causes the nullspace of the double-layer operator to be nontrivial. This idea, due to Brakhage and Werner (1965) and independently to Leis (1965) and Panich (1965), is one of the most important practical devices in the boundary integral equation method.

### 3.5 Integral Equations for the Helmholtz Equation

The Helmholtz equation \(\Delta u + k^2 u = 0\) arises in the study of time-harmonic wave propagation at frequency \(\omega = ck\), where \(c\) is the wave speed. The boundary integral formulations for the Helmholtz equation are closely analogous to those for the Laplace equation, but with the Helmholtz fundamental solution \(\Phi_k\) replacing \(\Phi\).

For the exterior Dirichlet problem (sound-soft scattering), the indirect double-layer formulation yields

\[
\frac{1}{2}\psi(\mathbf{x}) + (D_k\psi)(\mathbf{x}) = f(\mathbf{x}), \quad \mathbf{x} \in \Gamma,
\]
where \(D_k\) is the double-layer operator formed with the Helmholtz kernel. This equation suffers from the notorious problem of irregular frequencies (also called spurious resonances or fictitious eigenvalues): at wavenumbers \(k\) corresponding to Dirichlet eigenvalues of the Laplacian in the interior domain \(\Omega\), the integral equation fails to be uniquely solvable even though the exterior scattering problem itself is well-posed.

<div class="theorem">
<strong>Theorem 3.9 (Burton-Miller Formulation, 1971).</strong> The combined boundary integral equation

\[
\frac{1}{2}\psi(\mathbf{x}) + (D_k\psi)(\mathbf{x}) + i\eta (S_k\psi)(\mathbf{x}) = f(\mathbf{x}) + i\eta (S_k g)(\mathbf{x}), \quad \mathbf{x} \in \Gamma,
\]
or more commonly the direct combined formulation involving both the hypersingular and single-layer operators, is uniquely solvable for all wavenumbers \(k > 0\) and all \(\eta \in \mathbb{R} \setminus \{0\}\). The standard choice \(\eta = k\) yields a well-conditioned system.
</div>

<div class="remark">
<strong>Remark 3.10.</strong> The irregular frequency problem was first identified by Kupradze (1956) and analyzed in detail by Schenck (1968), whose CHIEF method attempted to cure the problem by adding interior collocation points. The Burton-Miller approach provides a theoretically clean solution by combining the standard BIE with its normal derivative on the boundary, at the cost of introducing the hypersingular operator \(N_k\). In practice, dealing with the hypersingularity is one of the main implementation challenges for the Helmholtz Burton-Miller formulation.
</div>

<div class="example">
<strong>Example 3.11.</strong> Consider scattering of a plane wave \(u^i(\mathbf{x}) = e^{ik\mathbf{d} \cdot \mathbf{x}}\) by a sound-soft sphere of radius \(a\) in \(\mathbb{R}^3\). The scattered field \(u^s\) satisfies \(\Delta u^s + k^2 u^s = 0\) in the exterior, \(u^s = -u^i\) on \(|\mathbf{x}| = a\), and the Sommerfeld radiation condition. The exact solution is given by the Mie series:

\[
u^s(r,\theta) = -\sum_{n=0}^\infty (2n+1)i^n \frac{j_n(ka)}{h_n^{(1)}(ka)} h_n^{(1)}(kr) P_n(\cos\theta),
\]
where \(j_n\) and \(h_n^{(1)}\) are spherical Bessel and Hankel functions, and \(P_n\) are Legendre polynomials. The irregular frequencies occur at the zeros of \(j_n(ka)\), which are precisely the interior Dirichlet eigenvalues. This exact solution serves as a benchmark for testing boundary integral equation codes.
</div>

## Chapter 4: Numerical Methods — Nystrom and Collocation

### 4.1 The Nystrom Method

We turn now to the numerical solution of the boundary integral equations developed in Chapters 1-3. The Nystrom method, named after E.J. Nystrom who introduced it in 1930, is one of the simplest and most elegant approaches: it replaces the integral in the integral equation by a quadrature rule. The method is particularly effective for equations with smooth or mildly singular kernels on smooth geometries.

<div class="definition">
<strong>Definition 4.1 (Nystrom Method).</strong> Consider the second-kind Fredholm equation

\[
\varphi(\mathbf{x}) - \int_\Gamma K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y}) = f(\mathbf{x}), \quad \mathbf{x} \in \Gamma.
\]
Given a quadrature rule with nodes \(\mathbf{x}_1, \ldots, \mathbf{x}_N \in \Gamma\) and weights \(w_1, \ldots, w_N\), the <em>Nystrom method</em> replaces the integral by the quadrature sum and collocates at the quadrature nodes:

\[
\varphi_N(\mathbf{x}_i) - \sum_{j=1}^N w_j K(\mathbf{x}_i, \mathbf{x}_j) \varphi_N(\mathbf{x}_j) = f(\mathbf{x}_i), \quad i = 1, \ldots, N.
\]
This is a linear system \((I - K_N)\boldsymbol{\varphi} = \mathbf{f}\), where \(K_N\) is the \(N \times N\) matrix with entries \((K_N)_{ij} = w_j K(\mathbf{x}_i, \mathbf{x}_j)\).
</div>

The beauty of the Nystrom method is that it simultaneously provides both the discrete approximation at the nodes and, through interpolation, an approximation everywhere on \(\Gamma\). Once the values \(\varphi_N(\mathbf{x}_j)\) are computed, the Nystrom interpolation formula

\[
\varphi_N(\mathbf{x}) = f(\mathbf{x}) + \sum_{j=1}^N w_j K(\mathbf{x}, \mathbf{x}_j) \varphi_N(\mathbf{x}_j)
\]
gives the approximate solution at any point \(\mathbf{x} \in \Gamma\).

<div class="theorem">
<strong>Theorem 4.2 (Convergence of the Nystrom Method).</strong> Let \(T\) be a compact operator on \(C(\Gamma)\) with continuous kernel, and let \(T_N\) be the Nystrom approximation using a convergent quadrature rule (i.e., \(\|T_N\varphi - T\varphi\|_\infty \to 0\) for all \(\varphi \in C(\Gamma)\)). Suppose \((I - T)^{-1}\) exists. Then for \(N\) sufficiently large, \((I - T_N)^{-1}\) exists, is uniformly bounded, and

\[
\|\varphi - \varphi_N\|_\infty \leq C \|T\varphi - T_N\varphi\|_\infty,
\]
where \(C\) depends only on \(\|(I-T)^{-1}\|\) and the constant in the collectively compact convergence.
</div>

<div class="proof">
<strong>Proof.</strong> The proof relies on the collectively compact operator approximation theory developed by Anselone (1971). The operators \(T_N\) converge pointwise to \(T\) and the set \(\{T_N\varphi : N \geq 1, \|\varphi\| \leq 1\}\) is relatively compact in \(C(\Gamma)\). Under these conditions, invertibility of \(I - T\) implies invertibility of \(I - T_N\) for large \(N\), with uniformly bounded inverses. The error estimate then follows from the identity \(\varphi - \varphi_N = (I - T_N)^{-1}(T\varphi - T_N\varphi)\). \(\square\)
</div>

The key message of this theorem is that the convergence rate of the Nystrom method is controlled by the convergence rate of the underlying quadrature rule applied to the specific integrand \(K(\mathbf{x}, \cdot)\varphi(\cdot)\). For smooth kernels and smooth solutions on smooth boundaries, using a high-order quadrature rule yields spectral (superalgebraic) convergence.

<div class="remark">
<strong>Remark 4.3.</strong> The Nystrom method has a remarkable property that distinguishes it from collocation and Galerkin methods: the approximate solution \(\varphi_N\) is defined at every point of \(\Gamma\), not just at the discretization nodes. The Nystrom interpolation formula provides this extension automatically and at no additional cost. Moreover, the off-node accuracy is typically of the same order as the on-node accuracy, which is a consequence of the smoothing property of the integral operator. This makes the Nystrom method particularly convenient when pointwise evaluation of the solution is required at many post-processing points.
</div>

<div class="example">
<strong>Example 4.4.</strong> Consider the second-kind equation \(\varphi(x) - \int_0^{2\pi} K(x,y)\varphi(y)\,dy = f(x)\) where \(K(x,y) = \frac{1}{2\pi}(1 + \cos(x-y))\) is a smooth periodic kernel. The Nystrom method with the trapezoidal rule and \(N\) equispaced nodes on \([0,2\pi)\) produces a matrix with entries \((K_N)_{ij} = \frac{1}{N}(1 + \cos(x_i - x_j))\). Since the kernel has only three nonzero Fourier modes, the Nystrom matrix is rank-3 plus a diagonal, and the method produces the exact solution for \(N \geq 3\). This extreme case illustrates the spectral accuracy of the trapezoidal-rule Nystrom method for smooth periodic problems.
</div>

### 4.2 Quadrature Rules for Smooth and Singular Kernels

The choice of quadrature rule is the heart of the Nystrom method. For smooth periodic integrands (as arise on smooth closed curves in 2D), the trapezoidal rule is optimal in a precise sense.

<div class="theorem">
<strong>Theorem 4.5 (Superalgebraic Convergence of the Trapezoidal Rule).</strong> For a smooth \(2\pi\)-periodic function \(g\), the trapezoidal rule with \(N\) equispaced nodes converges superalgebraically:

\[
\left| \int_0^{2\pi} g(t) \, dt - \frac{2\pi}{N} \sum_{j=1}^N g(t_j) \right| \leq C_m N^{-m} \quad \text{for all } m \geq 1,
\]
where \(t_j = 2\pi j/N\). If \(g\) is analytic in a strip \(|\operatorname{Im} t| < \delta\), the convergence is exponential: the error is \(O(e^{-c N})\) for some \(c > 0\).
</div>

For singular kernels, one must modify the quadrature to handle the singularity. The most important case is the logarithmic singularity that arises from the single-layer operator in two dimensions. After parametrizing the boundary, the kernel takes the form \(K(s,t) = A(s,t) \log|s - t| + B(s,t)\), where \(A\) and \(B\) are smooth.

<div class="definition">
<strong>Definition 4.6 (Kapur-Rokhlin Quadrature).</strong> The <em>Kapur-Rokhlin quadrature</em> modifies the trapezoidal rule by replacing the weights near the diagonal (i.e., for \(|i - j|\) small) with specially computed correction weights that account for the logarithmic singularity. For the integral

\[
\int_0^{2\pi} A(s,t) \log\left|2\sin\frac{s-t}{2}\right| \varphi(t) \, dt,
\]
the corrected trapezoidal rule achieves \(O(N^{-p})\) convergence for a \(p\)-th order correction, while preserving the simplicity of equispaced nodes.
</div>

<div class="example">
<strong>Example 4.7.</strong> Consider the second-kind integral equation on the unit circle arising from the interior Dirichlet problem for Laplace's equation:

\[
-\frac{1}{2}\psi(\theta) + \frac{1}{2\pi}\int_0^{2\pi} \psi(\theta') \frac{\partial}{\partial \nu'} \log|\mathbf{x}(\theta) - \mathbf{x}(\theta')| \, d\theta' = f(\theta).
\]
On the unit circle, the double-layer kernel is identically \(-\frac{1}{2\pi}\) (a constant), so the operator \(D\) has a particularly simple form. The Nystrom method with the trapezoidal rule and \(N\) equispaced nodes yields the exact solution (up to machine precision) for trigonometric polynomial data of degree less than \(N/2\), a manifestation of the spectral convergence of the method.
</div>

### 4.3 Collocation Methods

Collocation methods provide an alternative to the Nystrom approach, particularly suited to integral equations on surfaces in three dimensions where the geometry is typically represented by a mesh of panels (triangles or quadrilaterals).

<div class="definition">
<strong>Definition 4.8 (Collocation Method).</strong> Let \(X_N \subset C(\Gamma)\) be a finite-dimensional approximation space with basis functions \(\phi_1, \ldots, \phi_N\) and let \(\mathbf{x}_1, \ldots, \mathbf{x}_N \in \Gamma\) be collocation points. The <em>collocation method</em> seeks an approximate solution \(\varphi_N = \sum_{j=1}^N \alpha_j \phi_j\) satisfying the integral equation exactly at the collocation points:

\[
\varphi_N(\mathbf{x}_i) - \int_\Gamma K(\mathbf{x}_i, \mathbf{y}) \varphi_N(\mathbf{y}) \, dS(\mathbf{y}) = f(\mathbf{x}_i), \quad i = 1, \ldots, N.
\]
</div>

The resulting linear system is \((I_N - K_N)\boldsymbol{\alpha} = \mathbf{f}\), where \((I_N)_{ij} = \phi_j(\mathbf{x}_i)\) and \((K_N)_{ij} = \int_\Gamma K(\mathbf{x}_i, \mathbf{y}) \phi_j(\mathbf{y}) \, dS(\mathbf{y})\). The matrix entries \((K_N)_{ij}\) require evaluating integrals of the kernel against the basis functions, which must be done carefully when the kernel is singular.

The most common choice of approximation space is the space of piecewise constant or piecewise linear functions on a triangulation of \(\Gamma\). For piecewise constant basis functions, the collocation method is equivalent to the Nystrom method with a particular quadrature rule (the midpoint rule on each panel).

<div class="theorem">
<strong>Theorem 4.9 (Convergence of Collocation).</strong> Let \(\Gamma\) be a smooth closed curve in \(\mathbb{R}^2\), and let the collocation method use piecewise polynomial basis functions of degree \(p\) on a uniform mesh of size \(h = 2\pi/N\), with collocation points at the midpoints of each element. For a second-kind equation with smooth kernel, the collocation approximation satisfies

\[
\|\varphi - \varphi_N\|_\infty \leq C h^{p+1} \|\varphi\|_{C^{p+1}(\Gamma)}.
\]
For even-degree splines with certain symmetry properties, superconvergence occurs at the collocation points, with the error of order \(O(h^{2p+2})\) — double the expected rate.
</div>

This superconvergence phenomenon, first discovered by Sloan and Chandler in the 1980s, is one of the pleasant surprises of the collocation method and partially explains its excellent performance in practice.

### 4.4 Galerkin Boundary Element Method

The Galerkin method is the most mathematically principled approach to discretizing boundary integral equations. It provides a variational framework that yields optimal error estimates and is the method of choice when rigorous error analysis is required.

<div class="definition">
<strong>Definition 4.10 (Galerkin BEM).</strong> Let \(X_N \subset L^2(\Gamma)\) be a finite-dimensional subspace. The <em>Galerkin boundary element method</em> for the second-kind equation \(\varphi - T\varphi = f\) seeks \(\varphi_N \in X_N\) such that

\[
\langle \varphi_N - T\varphi_N, \psi_N \rangle = \langle f, \psi_N \rangle \quad \text{for all } \psi_N \in X_N,
\]
where \(\langle \cdot, \cdot \rangle\) denotes the \(L^2(\Gamma)\) inner product.
</div>

The resulting linear system is \((\mathbf{M} - \mathbf{K})\boldsymbol{\alpha} = \mathbf{f}\), where the mass matrix \(\mathbf{M}_{ij} = \langle \phi_j, \phi_i \rangle\) and the stiffness matrix \(\mathbf{K}_{ij} = \langle T\phi_j, \phi_i \rangle = \int_\Gamma \int_\Gamma K(\mathbf{x}, \mathbf{y}) \phi_j(\mathbf{y}) \phi_i(\mathbf{x}) \, dS(\mathbf{y}) \, dS(\mathbf{x})\). The Galerkin matrix entries involve double integrals over the boundary, making them more expensive to compute than collocation or Nystrom entries but yielding superior error estimates.

<div class="theorem">
<strong>Theorem 4.11 (Galerkin Error Estimate).</strong> Let \(T: L^2(\Gamma) \to L^2(\Gamma)\) be compact and suppose \((I - T)^{-1}\) exists. Let \(X_N\) be a sequence of finite-dimensional subspaces with the property that \(\inf_{\psi_N \in X_N} \|\varphi - \psi_N\| \to 0\) for all \(\varphi \in L^2(\Gamma)\). Then for \(N\) sufficiently large, the Galerkin approximation \(\varphi_N\) exists, is unique, and satisfies

\[
\|\varphi - \varphi_N\|_{L^2(\Gamma)} \leq C \inf_{\psi_N \in X_N} \|\varphi - \psi_N\|_{L^2(\Gamma)}.
\]
If \(X_N\) is the space of piecewise polynomials of degree \(p\) on a mesh of size \(h\), and if \(\varphi \in H^{p+1}(\Gamma)\), then \(\|\varphi - \varphi_N\| = O(h^{p+1})\).
</div>

The constant \(C\) in the error estimate depends on \(\|(I-T)^{-1}\|\), and can be large when the integral equation is poorly conditioned. This occurs, for instance, near irregular frequencies in the Helmholtz case or for domains with corners or edges where the solution has reduced regularity.

<div class="example">
<strong>Example 4.12.</strong> Consider the interior Dirichlet problem for Laplace's equation on a domain with smooth boundary in \(\mathbb{R}^3\), discretized using the Galerkin BEM with piecewise linear basis functions on a triangulation of mesh size \(h\). The solution density \(\psi\) is smooth (since \(\Gamma\) is smooth), so \(\psi \in H^s(\Gamma)\) for all \(s\). The Galerkin approximation converges as \(\|\psi - \psi_h\|_{L^2(\Gamma)} = O(h^2)\) and \(\|\psi - \psi_h\|_{H^{-1/2}(\Gamma)} = O(h^{5/2})\), with the extra half-order gained from the Aubin-Nitsche duality argument. The pointwise evaluation of the solution at interior points gains additional orders of convergence from the smoothing property of the representation integral.
</div>

<div class="remark">
<strong>Remark 4.13.</strong> The Aubin-Nitsche trick, also known as the duality argument, is a standard technique for obtaining error estimates in weaker norms. For the boundary integral equation, it works as follows. Let \(e = \varphi - \varphi_h\) be the error. To estimate \(\|e\|_{H^{-1/2}}\), consider the adjoint problem \((I - T^*)\psi = e/\|e\|_{H^{-1/2}}\) and use the Galerkin orthogonality of \(e\) to the discrete space. The extra order of convergence arises from the approximation of \(\psi\) in \(X_N\), and the smoothing effect of the compact operator \(T^*\) guarantees that \(\psi\) is smoother than the right-hand side. This argument was first applied to boundary element methods by Hsiao and Wendland.
</div>

<div class="remark">
<strong>Remark 4.14.</strong> The relationship between Nystrom, collocation, and Galerkin methods can be summarized as follows: Nystrom is simplest to implement and gives spectral accuracy for smooth problems in 2D; collocation is intermediate in complexity and is widely used in engineering BEM codes; Galerkin is the most expensive per degree of freedom but provides optimal error estimates and is the method of choice for rigorous analysis and problems requiring adaptivity. In practice, the choice often depends on the geometry (smooth vs. non-smooth), the spatial dimension, and the required accuracy.
</div>

## Chapter 5: Singular and Hypersingular Integrals

### 5.1 Cauchy Principal Value Integrals

The boundary integral operators introduced in Chapter 3 involve kernels with various types of singularities. The single-layer kernel is weakly singular (integrable), the double-layer kernel has a Cauchy-type singularity, and the hypersingular kernel is more singular still. The rigorous definition and practical computation of these singular integrals is one of the main technical challenges of the boundary element method.

<div class="definition">
<strong>Definition 5.1 (Cauchy Principal Value).</strong> Let \(\Gamma\) be a smooth curve or surface and let \(K(\mathbf{x}, \mathbf{y})\) have a non-integrable singularity at \(\mathbf{x} = \mathbf{y}\). The <em>Cauchy principal value</em> of the integral is defined by

\[
\text{p.v.}\int_\Gamma K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y}) = \lim_{\varepsilon \to 0^+} \int_{\Gamma \setminus B_\varepsilon(\mathbf{x})} K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y}),
\]
provided the limit exists, where \(B_\varepsilon(\mathbf{x})\) is the ball of radius \(\varepsilon\) centered at \(\mathbf{x}\).
</div>

The double-layer kernel \(\frac{\partial \Phi(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{y})}\) in three dimensions has a singularity of order \(|\mathbf{x} - \mathbf{y}|^{-2}\) times the surface measure, which makes the integral conditionally convergent. The Cauchy principal value is the correct interpretation: the contributions from opposite sides of the singularity cancel due to the antisymmetry of the kernel, and the limit exists for Holder-continuous densities.

<div class="theorem">
<strong>Theorem 5.2 (Existence of the Cauchy Principal Value).</strong> Let \(\Gamma\) be a \(C^2\) surface in \(\mathbb{R}^3\) and let \(\varphi \in C^{0,\alpha}(\Gamma)\) for some \(\alpha > 0\). Then the double-layer boundary integral

\[
(D\varphi)(\mathbf{x}) = \text{p.v.}\int_\Gamma \frac{\partial \Phi(\mathbf{y}, \mathbf{x})}{\partial \nu(\mathbf{y})} \varphi(\mathbf{y}) \, dS(\mathbf{y})
\]
exists for all \(\mathbf{x} \in \Gamma\) and defines a bounded operator \(D: C^{0,\alpha}(\Gamma) \to C^{0,\alpha}(\Gamma)\).
</div>

<div class="proof">
<strong>Proof.</strong> Write \(\varphi(\mathbf{y}) = \varphi(\mathbf{x}) + [\varphi(\mathbf{y}) - \varphi(\mathbf{x})]\). The integral of the second term converges absolutely because the Holder continuity supplies a factor \(|\mathbf{x} - \mathbf{y}|^\alpha\) that overcomes the singularity. For the first term, \(\varphi(\mathbf{x})\) factors out and we must evaluate \(\text{p.v.}\int_\Gamma \frac{\partial \Phi}{\partial \nu_\mathbf{y}} \, dS(\mathbf{y})\). By a solid-angle argument, this integral equals \(-\frac{1}{2}\) for \(\mathbf{x} \in \Gamma\) (the exterior solid angle at a smooth boundary point), establishing both existence and the value of the free term in the jump relations. \(\square\)
</div>

### 5.2 Hadamard Finite-Part Integrals

The hypersingular operator \(N\) involves the kernel \(\frac{\partial^2 \Phi(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{x}) \partial \nu(\mathbf{y})}\), which has a singularity of order \(|\mathbf{x} - \mathbf{y}|^{-3}\) in \(\mathbb{R}^3\) — too singular even for the Cauchy principal value to exist. The correct interpretation is the Hadamard finite-part integral, introduced by Jacques Hadamard in his 1923 treatise on Cauchy's problem.

<div class="definition">
<strong>Definition 5.3 (Hadamard Finite-Part Integral).</strong> Let \(f\) be smooth away from \(t = 0\) with an expansion \(f(t) = a_{-p} t^{-p} + \cdots + a_{-1} t^{-1} + a_0 + a_1 t + \cdots\) near \(t = 0\). The <em>Hadamard finite part</em> of \(\int_0^1 f(t) \, dt\) is defined as

\[
\text{f.p.}\int_0^1 f(t) \, dt = \lim_{\varepsilon \to 0^+} \left[ \int_\varepsilon^1 f(t) \, dt - \sum_{k=1}^{p} \frac{a_{-k} \varepsilon^{-k+1}}{-k+1} - a_{-1} \log\varepsilon \right],
\]
i.e., one subtracts the divergent terms and takes the limit. This operation is also called <em>regularization</em> of the divergent integral.
</div>

The Hadamard finite part is not an integral in the Lebesgue sense; it is a distribution acting on smooth densities. Nevertheless, it defines a bounded operator between appropriate Sobolev spaces. The hypersingular operator \(N: H^1(\Gamma) \to L^2(\Gamma)\) is bounded, and its Galerkin discretization is well-defined because the test and trial functions in \(H^1(\Gamma)\) provide enough regularity to make the double integral convergent.

<div class="example">
<strong>Example 5.4.</strong> On the real line, the simplest Hadamard finite-part integral is

\[
\text{f.p.}\int_{-1}^{1} \frac{1}{t^2} \, dt = \lim_{\varepsilon \to 0^+} \left[ \int_{-1}^{-\varepsilon} \frac{dt}{t^2} + \int_\varepsilon^1 \frac{dt}{t^2} - \frac{2}{\varepsilon} \right] = \lim_{\varepsilon \to 0^+} \left[ 2\left(\frac{1}{\varepsilon} - 1\right) - \frac{2}{\varepsilon} \right] = -2.
\]
This illustrates the fundamental mechanism: the divergent \(1/\varepsilon\) terms cancel, leaving a finite value.
</div>

### 5.3 Regularization of Singular Kernels

A powerful approach to handling singular integrals in practice is regularization: rewriting the singular integral in a form that is amenable to standard quadrature. Several regularization techniques exist, each with its own advantages.

<div class="theorem">
<strong>Theorem 5.5 (Maue's Integration-by-Parts Regularization, 1949).</strong> The hypersingular operator for the Helmholtz equation in \(\mathbb{R}^3\) can be regularized as

\[
(N_k\varphi)(\mathbf{x}) = \text{f.p.}\int_\Gamma \frac{\partial^2 \Phi_k(\mathbf{x}, \mathbf{y})}{\partial \nu(\mathbf{x}) \partial \nu(\mathbf{y})} \varphi(\mathbf{y}) \, dS(\mathbf{y}) = -\int_\Gamma \Phi_k(\mathbf{x}, \mathbf{y}) \left[ \nabla_\Gamma \cdot (\nu(\mathbf{y}) \times \nabla_\Gamma \varphi(\mathbf{y})) \right] dS(\mathbf{y}) - k^2 \int_\Gamma \Phi_k(\mathbf{x}, \mathbf{y}) (\nu(\mathbf{x}) \cdot \nu(\mathbf{y})) \varphi(\mathbf{y}) \, dS(\mathbf{y}),
\]
where \(\nabla_\Gamma\) denotes the surface gradient. The right-hand side involves only weakly singular integrals (the fundamental solution \(\Phi_k\) itself), at the cost of requiring surface derivatives of \(\varphi\).
</div>

Maue's identity transfers the hypersingularity from the kernel to the density through integration by parts on the surface. The resulting integrals involve only the weakly singular kernel \(\Phi_k\) and are amenable to standard quadrature techniques. This regularization is the basis for many practical BEM implementations. The price paid is that the density \(\varphi\) must now have surface gradients, which means the trial space must be at least \(H^1(\Gamma)\) (e.g., piecewise linear rather than piecewise constant). In the Galerkin framework, this is natural: both trial and test functions are taken from \(H^1(\Gamma)\), and the double surface integral converges in the classical sense after Maue's regularization.

An alternative and widely used regularization in two dimensions exploits the fact that the logarithmic kernel can be decomposed into a smooth part and a standard singular part.

<div class="definition">
<strong>Definition 5.6 (Kernel Splitting).</strong> For a smooth parameterized curve \(\Gamma = \{\mathbf{x}(t) : t \in [0, 2\pi]\}\), the single-layer kernel in 2D can be written as

\[
\Phi(\mathbf{x}(s), \mathbf{x}(t)) = -\frac{1}{2\pi}\log\left|2\sin\frac{s-t}{2}\right| \cdot R_1(s,t) + R_2(s,t),
\]
where \(R_1\) and \(R_2\) are smooth \(2\pi\)-periodic functions with \(R_1(t,t) = 1\). The logarithmic singularity has been isolated in a standard form, allowing the use of specialized quadrature rules.
</div>

<div class="remark">
<strong>Remark 5.7.</strong> The splitting in Definition 5.6 is the starting point for the Kress quadrature (R. Kress, 1991), which combines the trapezoidal rule with explicit quadrature weights for the logarithmic singularity. The resulting scheme achieves spectral accuracy for smooth boundaries and is the method of choice for high-accuracy 2D computations. The quadrature weights are derived from the Fourier series of \(\log|2\sin(t/2)|\), which is \(-\sum_{m=1}^\infty \frac{\cos(mt)}{m}\).
</div>

### 5.4 Numerical Quadrature for Singular Integrals

The practical computation of weakly singular, singular, and hypersingular integrals requires specialized quadrature methods. The choice of quadrature is one of the most critical implementation decisions in any boundary element code, as it directly determines both the accuracy and the efficiency of the method. We survey the main approaches, beginning with classical techniques and progressing to modern high-order methods.

<div class="definition">
<strong>Definition 5.8 (Generalized Gaussian Quadrature).</strong> For an integral of the form \(\int_a^b w(t) f(t) \, dt\), where \(w(t)\) is a fixed weight function (possibly singular) and \(f\) is smooth, a <em>generalized Gaussian quadrature</em> rule with \(n\) nodes is a set of nodes \(t_1, \ldots, t_n \in [a,b]\) and weights \(w_1, \ldots, w_n\) such that

\[
\int_a^b w(t) p(t) \, dt = \sum_{j=1}^n w_j p(t_j) \quad \text{for all polynomials } p \text{ of degree} \leq 2n-1.
\]
For \(w(t) = t^\alpha\) (\(-1 < \alpha < 0\)), these are the Gauss-Jacobi quadrature rules.
</div>

For weakly singular integrals in 2D with a logarithmic singularity, the standard approach is the log-weighted Gaussian quadrature: one uses Gaussian rules for the weight function \(w(t) = -\log t\) on \([0,1]\), which integrate \((-\log t) p(t)\) exactly for polynomials \(p\) of degree up to \(2n - 1\). These rules were tabulated by Stroud and Secrest and are now computed to arbitrary precision using the Golub-Welsch algorithm.

<div class="example">
<strong>Example 5.9.</strong> Consider the weakly singular integral

\[
I = \int_0^1 \log(t) \cos(\pi t) \, dt.
\]
Using a 4-point Gauss-Laguerre-type rule for the weight \(-\log t\), one obtains the approximation \(I \approx -1.07439\), which agrees with the exact value \(I = -\text{Si}(\pi)/\pi - \log(1)/1 = -(1 + \gamma + \log\pi)/\pi^2 \approx -1.07080\) (here \(\gamma\) is the Euler-Mascheroni constant and \(\text{Si}\) is the sine integral). More precisely, the exact value is

\[
I = -\frac{1}{\pi^2}(\pi^2 + 1) \cdot (\text{terms involving } \gamma \text{ and } \log\pi).
\]
Integration by parts and special function identities give the closed form; the point is that even a low-order specialized quadrature achieves good accuracy for this type of integrand.
</div>

### 5.5 Panel-Based Quadrature

For three-dimensional problems on general geometries, the boundary \(\Gamma\) is discretized into a mesh of panels (typically flat or curved triangles). Near-field interactions — where the source and target panels are close together or coincide — require careful treatment of the kernel singularity.

<div class="definition">
<strong>Definition 5.10 (Panel-Based Adaptive Quadrature).</strong> In <em>panel-based quadrature</em>, the boundary is decomposed into panels \(\Gamma = \bigcup_k \Gamma_k\), and each integral \(\int_{\Gamma_k} K(\mathbf{x}, \mathbf{y}) \varphi(\mathbf{y}) \, dS(\mathbf{y})\) is computed by a quadrature rule adapted to the distance from \(\mathbf{x}\) to \(\Gamma_k\):
<ul>
<li>Self-interactions (\(\mathbf{x} \in \Gamma_k\)): singular quadrature (Duffy transform, generalized Gaussian rules, or semi-analytic methods).</li>
<li>Near-field (\(\mathbf{x}\) close to \(\Gamma_k\)): upsampled or adaptive quadrature.</li>
<li>Far-field (\(\mathbf{x}\) far from \(\Gamma_k\)): standard Gaussian quadrature on the panel.</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 5.11 (Duffy Transform, 1982).</strong> Let \(T\) be a triangle in \(\mathbb{R}^2\) and consider the weakly singular integral

\[
I = \int_T \frac{f(\mathbf{y})}{|\mathbf{y} - \mathbf{x}_0|^\alpha} \, dA(\mathbf{y}), \quad 0 < \alpha < 2, \quad \mathbf{x}_0 \text{ a vertex of } T.
\]
The Duffy transformation maps \(T\) to the unit square \([0,1]^2\) via the substitution \(\mathbf{y} = \mathbf{x}_0 + t(\mathbf{v}_1 + s(\mathbf{v}_2 - \mathbf{v}_1))\), where \(\mathbf{v}_1, \mathbf{v}_2\) are the other vertices. The Jacobian contributes a factor of \(t\) that cancels the singularity when \(\alpha < 2\), rendering the transformed integrand smooth and amenable to tensor-product Gaussian quadrature.
</div>

The Duffy transform is one of the most widely used tools in practical BEM implementations. For edge-adjacent and vertex-adjacent panel pairs, analogous coordinate transformations reduce the singular integrals to smooth integrals on the unit hypercube, though the number of required subdivisions increases with the type of adjacency. A self-interaction on a single triangle requires one Duffy transform (splitting into three sub-triangles, each with the singularity at a vertex), while an edge-adjacent pair requires four sub-integrals and a vertex-adjacent pair requires two.

<div class="example">
<strong>Example 5.12.</strong> To illustrate the Duffy transform, consider the self-interaction integral for the 3D Laplace single-layer operator on a flat triangle \(T\) with vertices at \((0,0,0)\), \((1,0,0)\), and \((0,1,0)\):

\[
I = \int_T \int_T \frac{1}{4\pi|\mathbf{x} - \mathbf{y}|} \, dA(\mathbf{x}) \, dA(\mathbf{y}).
\]
This 4-dimensional integral has a \(1/r\) singularity on the 2-dimensional diagonal \(\mathbf{x} = \mathbf{y}\). After the Duffy transform (which maps the singular region to a smooth domain), one obtains a regular 4-dimensional integral that can be evaluated by tensor-product Gaussian quadrature. With a \(4^4 = 256\)-point rule, the result is \(I \approx 0.019675\), which agrees with semi-analytic evaluations to 5 significant digits.
</div>

<div class="remark">
<strong>Remark 5.13.</strong> Modern high-order quadrature schemes for singular integrals on surfaces, such as the Quadrature by Expansion (QBX) method of Klockner, Barnett, Greengard, and O'Neil (2013), take a fundamentally different approach: they evaluate the layer potential at a point \(\mathbf{x}_c\) slightly away from the surface (the "expansion center") using a local expansion, and then evaluate this expansion on the surface. Since the layer potential is smooth away from \(\Gamma\), the off-surface evaluation requires only smooth quadrature, and the local expansion can be evaluated cheaply. QBX achieves high-order accuracy and is compatible with fast algorithms such as the FMM.
</div>

## Chapter 6: Fast Algorithms

### 6.1 The Need for Fast Algorithms

The boundary integral equation method reduces a PDE in \(d\) dimensions to an integral equation on a \((d-1)\)-dimensional boundary, but the resulting dense linear system of \(N\) equations has an \(O(N^2)\) storage cost and an \(O(N^3)\) cost for direct solution by Gaussian elimination (or \(O(N^2)\) per iteration of an iterative solver). For large-scale problems with \(N = 10^5\) to \(10^8\) unknowns, these costs are prohibitive. Indeed, storing a dense \(10^6 \times 10^6\) matrix of double-precision numbers requires approximately 8 terabytes of memory, far exceeding the capacity of any single workstation. Fast algorithms exploit the structure of the kernel to reduce the cost of matrix-vector products to \(O(N)\) or \(O(N \log N)\), making iterative solution feasible even for very large problems.

The key structural property is that the kernel \(K(\mathbf{x}, \mathbf{y})\) is smooth (and hence numerically low-rank) when \(\mathbf{x}\) and \(\mathbf{y}\) are well-separated. This means that the interaction between a cluster of sources and a well-separated cluster of targets can be accurately approximated by a low-rank factorization, and the cost of evaluating this interaction is proportional to the rank rather than the product of cluster sizes.

### 6.2 The Fast Multipole Method

The Fast Multipole Method (FMM), introduced by Greengard and Rokhlin in their landmark 1987 paper, is a systematic algorithm for exploiting the low-rank structure of far-field interactions. It was selected by the journal Computing in Science and Engineering as one of the "Top 10 Algorithms of the 20th Century."

<div class="definition">
<strong>Definition 6.1 (Multipole Expansion).</strong> For the 2D Laplace kernel, the <em>multipole expansion</em> of the potential due to sources \(q_j\) at positions \(\mathbf{y}_j\) inside a disk of radius \(r\) centered at \(\mathbf{y}_0\), evaluated at a point \(\mathbf{x}\) with \(|\mathbf{x} - \mathbf{y}_0| > r\), is

\[
\sum_{j} q_j \log|\mathbf{x} - \mathbf{y}_j| = q \log|\mathbf{x} - \mathbf{y}_0| + \operatorname{Re} \sum_{m=1}^{\infty} \frac{a_m}{(z - z_0)^m},
\]
where \(z = x_1 + ix_2\), \(z_0 = (y_0)_1 + i(y_0)_2\), \(q = \sum_j q_j\), and the multipole coefficients are

\[
a_m = -\frac{1}{m} \sum_j q_j (z_j - z_0)^m, \quad m = 1, 2, \ldots.
\]
Truncation to \(p\) terms introduces an error of order \(O((r/R)^p)\), where \(R = |\mathbf{x} - \mathbf{y}_0|\).
</div>

The FMM organizes the computation using a hierarchical tree decomposition of space (a quadtree in 2D, an octree in 3D). At each level of the tree, it computes multipole expansions for each box, translates them to local (Taylor) expansions at well-separated target boxes, and passes information between levels. The key operations are:

(a) Multipole-to-multipole (M2M) translation: shifting a multipole expansion from a child box center to its parent.

(b) Multipole-to-local (M2L) translation: converting a multipole expansion at a source box to a local expansion at a well-separated target box.

(c) Local-to-local (L2L) translation: shifting a local expansion from a parent box to its child.

<div class="theorem">
<strong>Theorem 6.2 (Greengard-Rokhlin, 1987).</strong> For the 2D Laplace equation, the FMM computes the potential

\[
u(\mathbf{x}_i) = \sum_{j=1}^N q_j \log|\mathbf{x}_i - \mathbf{y}_j|, \quad i = 1, \ldots, N,
\]
at all \(N\) target points to precision \(\varepsilon\) in \(O(N)\) operations, where the constant depends on \(\log(1/\varepsilon)\). More precisely, the cost is \(O(N p^2)\) where \(p = O(\log(1/\varepsilon))\) is the expansion order.
</div>

The \(O(N)\) complexity is achieved because each source and target interacts with only a bounded number of boxes at each level of the tree, and the total number of translations is proportional to the number of boxes, which is \(O(N)\) for a quasi-uniform distribution.

<div class="example">
<strong>Example 6.3.</strong> Consider evaluating the discrete single-layer potential

\[
u(\mathbf{x}_i) = \sum_{j=1}^N q_j \Phi(\mathbf{x}_i, \mathbf{y}_j), \quad i = 1, \ldots, N,
\]
on the unit circle in 2D with \(N = 10^6\) equispaced sources and targets. Direct computation requires \(N^2 = 10^{12}\) kernel evaluations. With an FMM using \(p = 16\) terms (giving roughly 10 digits of accuracy), the cost is approximately \(50N \approx 5 \times 10^7\) operations — a speedup of roughly \(20{,}000\times\). On modern hardware, this computation takes seconds rather than days.
</div>

The extension of the FMM to the Helmholtz equation requires different expansion types depending on the distance between source and target. At low frequencies (\(k \cdot \text{box size} \ll 1\)), the multipole expansion is similar to the Laplace case but with complex coefficients. At high frequencies, the multipole expansion must be replaced by a plane wave expansion or a diagonal translation operator, leading to the "wideband FMM" that handles all frequency regimes.

<div class="theorem">
<strong>Theorem 6.4 (Helmholtz FMM Complexity).</strong> For the 3D Helmholtz equation at wavenumber \(k\), the FMM applied to a surface discretization with \(N\) unknowns achieves \(O(N)\) complexity when the number of unknowns per wavelength is bounded. The expansion order at each level of the tree is \(p \sim k \cdot h_\ell\), where \(h_\ell\) is the box size at level \(\ell\). The total work is dominated by the M2L translations at the finest levels and is proportional to \(N\) with a constant that depends on the prescribed accuracy.
</div>

<div class="remark">
<strong>Remark 6.5.</strong> The original Greengard-Rokhlin FMM (1987) was for the Laplace equation. The extension to Helmholtz was carried out by Rokhlin (1990) using a diagonal translation operator based on the addition theorem for spherical harmonics. The resulting algorithm is efficient at moderate frequencies but suffers from stability issues at low frequencies, where the plane wave expansion breaks down. The wideband FMM of Cheng, Crutchfield, Gimbutas, Greengard, et al. (2006) resolves this by switching between low-frequency (multipole) and high-frequency (plane wave) representations depending on the electrical size of each box.
</div>

### 6.3 Hierarchical Matrices

An alternative framework for exploiting the low-rank structure of integral equation matrices is provided by hierarchical matrices (\(\mathcal{H}\)-matrices), developed primarily by Wolfgang Hackbusch and collaborators beginning in the late 1990s.

<div class="definition">
<strong>Definition 6.6 (\(\mathcal{H}\)-Matrix).</strong> An <em>\(\mathcal{H}\)-matrix</em> is a hierarchical block partition of a dense matrix in which each admissible off-diagonal block is approximated by a low-rank factorization \(A_b \approx U_b V_b^T\), where \(U_b \in \mathbb{R}^{m \times k}\), \(V_b \in \mathbb{R}^{n \times k}\), and the rank \(k\) is small (independent of \(m\) and \(n\)). The admissibility condition for a block corresponding to index sets \(I\) and \(J\) is typically

\[
\min(\text{diam}(\Omega_I), \text{diam}(\Omega_J)) \leq \eta \, \text{dist}(\Omega_I, \Omega_J)
\]
for some parameter \(\eta > 0\), where \(\Omega_I\) and \(\Omega_J\) are the geometric clusters associated with \(I\) and \(J\).
</div>

The \(\mathcal{H}\)-matrix framework provides not only fast matrix-vector products (in \(O(N \log N)\) or \(O(N)\) time) but also approximate matrix arithmetic: addition, multiplication, inversion, and LU factorization can all be performed in nearly linear complexity. This makes \(\mathcal{H}\)-matrices a powerful tool for constructing fast direct solvers, which can be far more robust than iterative methods for ill-conditioned problems.

<div class="theorem">
<strong>Theorem 6.7 (Approximation Property of \(\mathcal{H}\)-Matrices).</strong> Let \(K(\mathbf{x}, \mathbf{y})\) be a kernel that is asymptotically smooth, i.e., satisfying bounds of the form

\[
|\partial_\mathbf{x}^\alpha \partial_\mathbf{y}^\beta K(\mathbf{x}, \mathbf{y})| \leq C_{|\alpha|+|\beta|} \frac{(|\alpha|+|\beta|)!}{|\mathbf{x} - \mathbf{y}|^{|\alpha|+|\beta|+s}}
\]
for separated \(\mathbf{x}\) and \(\mathbf{y}\), where \(s\) is the singularity order. Then the off-diagonal blocks corresponding to admissible cluster pairs can be approximated to precision \(\varepsilon\) by rank-\(k\) matrices with \(k = O(|\log\varepsilon|^d)\) in \(d\) dimensions.
</div>

<div class="remark">
<strong>Remark 6.8.</strong> The distinction between the FMM and \(\mathcal{H}\)-matrices is partly one of perspective. The FMM is an algorithm tailored to a specific kernel (or class of kernels) that exploits analytic expansions, while \(\mathcal{H}\)-matrices are a general algebraic framework that can handle any asymptotically smooth kernel. In practice, the FMM is often faster for standard kernels (Laplace, Helmholtz, Stokes), while \(\mathcal{H}\)-matrices are more flexible and support operations (inversion, factorization) that the classical FMM does not. Hybrid approaches combining analytic FMM translations with algebraic compression are an active area of research.
</div>

### 6.4 The Proxy Point Method

The proxy point method is an elegant technique for compressing far-field interactions without explicitly computing analytic expansions. It is a key ingredient in modern fast direct solvers and kernel-independent FMM variants.

<div class="definition">
<strong>Definition 6.9 (Proxy Point Method).</strong> Let \(I\) be a set of source indices contained in a box \(B\), and let \(J\) be a set of target indices well-separated from \(B\). Choose a set of <em>proxy points</em> \(\{\mathbf{p}_1, \ldots, \mathbf{p}_P\}\) on a circle (2D) or sphere (3D) enclosing \(B\). The interaction matrix \(K_{JI}\) can be factored approximately as

\[
K_{JI} \approx K_{JP} \cdot K_{PI}^{+},
\]
where \(K_{JP}\) and \(K_{PI}\) are the kernel matrices between the targets/sources and the proxy points, and \(K_{PI}^{+}\) denotes a pseudoinverse or interpolation operator. The rank of this approximation equals the number of proxy points \(P\), which is independent of \(|I|\) and \(|J|\).
</div>

The proxy point method works because any potential generated by sources inside \(B\) that is observed at well-separated targets can be equivalently generated by an equivalent source distribution on the proxy surface. This is a consequence of the classical equivalence principle: from the perspective of well-separated observers, the detailed source distribution inside \(B\) is indistinguishable from a suitably chosen distribution on the proxy surface. The number of proxy points needed depends on the expansion order (accuracy) but not on the number of original sources, which is precisely what makes the method useful for compression. This makes the proxy point method particularly useful for kernel-independent algorithms that cannot exploit analytic expansions, including algorithms for kernels arising from oscillatory (Helmholtz), tensorial (Stokes, elasticity), or layered-medium Green's functions.

<div class="example">
<strong>Example 6.10.</strong> For the 2D Laplace kernel with a box of side length \(h\) and proxy points on a circle of radius \(1.5h\) centered at the box, using \(P = 2p\) equispaced proxy points achieves roughly \(p\) digits of accuracy for interactions with boxes separated by at least one box width. With \(P = 40\) proxy points, one obtains approximately 10 digits of accuracy, which is sufficient for most practical computations. The proxy point method reduces the task of compressing the interaction to a purely numerical linear algebra problem (e.g., an interpolative decomposition or pivoted QR factorization of \(K_{PI}\)).
</div>

### 6.5 O(N) and O(N log N) Solvers

Combining the fast matrix-vector product (via FMM or \(\mathcal{H}\)-matrices) with an iterative linear algebra method yields an \(O(N \log N)\) or \(O(N)\) solver for boundary integral equations. The typical workflow is:

(1) Discretize the integral equation to obtain a dense \(N \times N\) linear system \(A\mathbf{x} = \mathbf{b}\).

(2) Apply GMRES (or another Krylov subspace method) to solve the system iteratively, using the FMM to compute each matrix-vector product in \(O(N)\) time.

(3) The total cost is \(O(N \cdot n_{\text{iter}})\), where \(n_{\text{iter}}\) is the number of GMRES iterations.

<div class="theorem">
<strong>Theorem 6.11 (Iteration Count for Second-Kind Equations).</strong> For a well-posed second-kind Fredholm integral equation \((I - T)\varphi = f\) with compact operator \(T\), the spectrum of \(T\) clusters at zero and the spectrum of \(I - T\) clusters at \(1\). The GMRES iteration for the discretized system converges in a number of iterations that is bounded independently of \(N\) (the discretization parameter), depending only on the spectrum of \(T\).
</div>

This is one of the great advantages of second-kind integral equations over first-kind equations: the condition number of the discrete system is bounded as \(N \to \infty\), so iterative methods converge in \(O(1)\) iterations. Combined with an \(O(N)\) fast matrix-vector product, the total solution cost is \(O(N)\) — optimal complexity.

<div class="example">
<strong>Example 6.13.</strong> For the interior Dirichlet problem for Laplace's equation on a starfish-shaped domain in \(\mathbb{R}^2\) (a smooth domain with moderate eccentricity), the GMRES iteration applied to the second-kind double-layer formulation typically converges to 10-digit accuracy in 15-25 iterations, regardless of the number of unknowns \(N\). This has been verified computationally for \(N\) ranging from \(100\) to \(10^7\). Each iteration costs \(O(N)\) with the FMM, so the total solve time scales linearly from \(N = 10^3\) (milliseconds) to \(N = 10^7\) (minutes on a single workstation). By contrast, a first-kind formulation for the same problem requires \(O(\sqrt{N})\) iterations with GMRES, illustrating the dramatic advantage of second-kind formulations.
</div>

<div class="remark">
<strong>Remark 6.12.</strong> For ill-conditioned problems (first-kind equations, near-resonance Helmholtz problems, high-frequency scattering), the number of iterations can grow with the problem parameters. In such cases, fast direct solvers based on \(\mathcal{H}\)-matrix LU factorization or recursive skeletonization provide a robust alternative. These methods compute an approximate factorization in \(O(N^{3/2})\) (2D) or \(O(N^2)\) (3D) time and then solve each right-hand side in \(O(N \log N)\) time, making them effective for problems with many right-hand sides.
</div>

## Chapter 7: Applications

The preceding chapters have developed the theoretical and computational foundations of integral equation methods. We now turn to applications, surveying the major areas where boundary integral equations have proven most effective. In each application, the key ingredients are: (i) a fundamental solution for the governing PDE, (ii) a boundary integral formulation that is well-posed and well-conditioned, and (iii) efficient numerical methods (quadrature, fast algorithms, iterative solvers) to handle practical problem sizes.

### 7.1 Acoustic Scattering

The prototypical application of boundary integral equations for the Helmholtz equation is acoustic scattering: the determination of how a sound wave interacts with an obstacle. The total field \(u = u^i + u^s\) consists of an incident field \(u^i\) (a known solution of the Helmholtz equation, typically a plane wave) and a scattered field \(u^s\) that satisfies the Helmholtz equation in the exterior domain, the boundary condition on the scatterer, and the Sommerfeld radiation condition at infinity.

<div class="definition">
<strong>Definition 7.1 (Sound-Soft and Sound-Hard Scattering).</strong> Let \(\Omega \subset \mathbb{R}^3\) be a bounded obstacle with boundary \(\Gamma\). The <em>sound-soft scattering problem</em> (Dirichlet) is: find \(u^s\) satisfying

\[
\Delta u^s + k^2 u^s = 0 \text{ in } \mathbb{R}^3 \setminus \overline{\Omega}, \quad u^s = -u^i \text{ on } \Gamma, \quad \text{Sommerfeld radiation condition.}
\]
The <em>sound-hard scattering problem</em> (Neumann) replaces the boundary condition with \(\frac{\partial u^s}{\partial \nu} = -\frac{\partial u^i}{\partial \nu}\) on \(\Gamma\).
</div>

Using the Burton-Miller formulation (Theorem 3.9), one obtains a well-posed second-kind integral equation for all wavenumbers. After discretization by a Galerkin or Nystrom method and acceleration by the FMM, the resulting system can be solved for problems involving millions of unknowns. State-of-the-art BIE solvers for acoustic scattering can handle problems with \(N > 10^8\) unknowns, corresponding to scattering objects hundreds of wavelengths in diameter. The far-field pattern (or scattering amplitude) is then obtained by evaluating the representation formula in the asymptotic regime.

<div class="theorem">
<strong>Theorem 7.2 (Far-Field Pattern).</strong> The scattered field \(u^s\) has the asymptotic behavior

\[
u^s(\mathbf{x}) = \frac{e^{ik|\mathbf{x}|}}{|\mathbf{x}|} u_\infty(\hat{\mathbf{x}}) + O(|\mathbf{x}|^{-2}), \quad |\mathbf{x}| \to \infty,
\]
where \(\hat{\mathbf{x}} = \mathbf{x}/|\mathbf{x}|\) and \(u_\infty\) is the <em>far-field pattern</em> (or scattering amplitude). For a single-layer representation \(u^s = \mathcal{S}_k\varphi\), the far-field pattern is

\[
u_\infty(\hat{\mathbf{x}}) = \frac{1}{4\pi} \int_\Gamma e^{-ik\hat{\mathbf{x}} \cdot \mathbf{y}} \varphi(\mathbf{y}) \, dS(\mathbf{y}).
\]
</div>

The far-field pattern contains all the information about the scattering process that is observable at large distances. It is the primary quantity of interest in radar cross-section computation, sonar target classification, and non-destructive testing. The far-field pattern also determines the total scattering cross-section via the optical theorem:

\[
\sigma_{\text{total}} = \frac{4\pi}{k} \operatorname{Im}\left[ u_\infty(\hat{\mathbf{d}}) \right],
\]
where \(\hat{\mathbf{d}}\) is the direction of the incident wave. This remarkable identity, which connects the total power scattered in all directions to the imaginary part of the forward-scattering amplitude, provides both a physical check on numerical solutions and a mathematically elegant consequence of energy conservation.

<div class="example">
<strong>Example 7.3.</strong> Scattering of a plane wave \(u^i = e^{ik\hat{\mathbf{d}} \cdot \mathbf{x}}\) by a sound-soft unit sphere. The exact far-field pattern is given by the Mie series

\[
u_\infty(\hat{\mathbf{x}}) = -\frac{1}{ik} \sum_{n=0}^\infty (2n+1) \frac{j_n(k)}{h_n^{(1)}(k)} P_n(\hat{\mathbf{x}} \cdot \hat{\mathbf{d}}).
\]
At low frequencies (\(ka \ll 1\)), the far-field pattern is approximately isotropic (Rayleigh scattering), with \(|u_\infty| \propto (ka)^2\). At high frequencies (\(ka \gg 1\)), the pattern shows a strong forward diffraction peak and complex oscillatory structure in other directions, requiring \(O(k^2)\) unknowns on the surface for accurate BEM resolution.
</div>

The computational cost of solving the acoustic scattering problem by BIE methods is governed by two factors: the number of unknowns \(N\) (which must be proportional to \(k^{d-1}\) to resolve the oscillatory surface field, where \(d\) is the spatial dimension) and the number of GMRES iterations (which grows with \(k\) for the standard second-kind formulation). Research on high-frequency methods seeks to reduce both costs. Hybrid asymptotic-numerical methods partition the surface into illuminated, shadow, and transition regions, using asymptotic approximations in regions where the field varies predictably and BIE discretization only where needed.

<div class="remark">
<strong>Remark 7.4.</strong> The challenge of high-frequency acoustic scattering has driven much of the recent development in integral equation methods. At frequency \(k\), a standard BIE discretization requires \(O(k^2)\) unknowns on the surface (in 3D), leading to very large systems. The search for methods that require only \(O(k)\) or even \(O(1)\) unknowns — by incorporating asymptotic information into the basis functions — has been pursued by Chandler-Wilde, Langdon, Bruno, Geuzaine, and others. These frequency-independent methods represent one of the frontiers of the field.
</div>

### 7.2 Stokes Flow

Boundary integral equations are particularly natural for Stokes flow (creeping or low-Reynolds-number flow), where the governing equations are linear and the free-space Green's function is known explicitly. Applications include microorganism locomotion, microfluidics, and sedimentation of particles.

<div class="definition">
<strong>Definition 7.5 (Stokes Equations).</strong> The <em>Stokes equations</em> for an incompressible viscous fluid at zero Reynolds number are

\[
-\mu \Delta \mathbf{u} + \nabla p = \mathbf{f}, \quad \nabla \cdot \mathbf{u} = 0,
\]
where \(\mathbf{u}\) is the velocity field, \(p\) is the pressure, \(\mu\) is the dynamic viscosity, and \(\mathbf{f}\) is a body force.
</div>

<div class="definition">
<strong>Definition 7.6 (Stokeslet).</strong> The fundamental solution (or <em>Stokeslet</em>) for the Stokes equations in \(\mathbb{R}^3\) is the tensor

\[
G_{ij}(\mathbf{x}, \mathbf{y}) = \frac{1}{8\pi\mu} \left( \frac{\delta_{ij}}{|\mathbf{r}|} + \frac{r_i r_j}{|\mathbf{r}|^3} \right), \quad \mathbf{r} = \mathbf{x} - \mathbf{y},
\]
and the associated pressure vector is

\[
p_j(\mathbf{x}, \mathbf{y}) = \frac{1}{4\pi} \frac{r_j}{|\mathbf{r}|^3}.
\]
The Stokeslet \(G_{ij}\) gives the \(i\)-th component of velocity at \(\mathbf{x}\) due to a unit point force in the \(j\)-th direction at \(\mathbf{y}\).
</div>

The Stokeslet has two key properties that distinguish it from the Laplace fundamental solution: it is a tensor (reflecting the vector nature of the velocity field), and it decays more slowly at infinity (\(O(1/r)\) versus \(O(1/r)\) for Laplace in 3D, but the Stokeslet has an additional algebraic structure that couples different components of the force and velocity). The associated pressure field \(p_j\) decays as \(O(1/r^2)\), faster than the velocity.

The boundary integral formulation for Stokes flow is entirely analogous to the scalar Laplace case, with the scalar kernel replaced by the Stokeslet tensor. The single-layer and double-layer Stokes potentials are defined as

\[
(\mathcal{S}\mathbf{f})_i(\mathbf{x}) = \int_\Gamma G_{ij}(\mathbf{x}, \mathbf{y}) f_j(\mathbf{y}) \, dS(\mathbf{y}), \quad (\mathcal{D}\boldsymbol{\mu})_i(\mathbf{x}) = \int_\Gamma T_{ijk}(\mathbf{x}, \mathbf{y}) \mu_j(\mathbf{y}) \nu_k(\mathbf{y}) \, dS(\mathbf{y}),
\]
where the stress tensor kernel \(T_{ijk}\) (or "stresslet") is

\[
T_{ijk}(\mathbf{x}, \mathbf{y}) = -\frac{3}{4\pi} \frac{r_i r_j r_k}{|\mathbf{r}|^5}.
\]

<div class="theorem">
<strong>Theorem 7.7 (Power-Kim Formulation for Stokes).</strong> The completed double-layer formulation for the interior Dirichlet problem for Stokes flow supplements the double-layer representation with a finite number of single-layer terms (Stokeslets and rotlets placed inside the domain) to remove the nullspace. For a rigid body with prescribed velocity \(\mathbf{U}\) and angular velocity \(\boldsymbol{\Omega}\), the completed integral equation is uniquely solvable and the drag and torque on the body can be computed from the solution density.
</div>

<div class="example">
<strong>Example 7.8.</strong> The Stokes drag on a sphere of radius \(a\) translating with velocity \(\mathbf{U}\) in an unbounded fluid of viscosity \(\mu\) is given by Stokes' law:

\[
\mathbf{F} = -6\pi\mu a \mathbf{U}.
\]
This can be derived analytically from the boundary integral formulation: the single-layer density on the sphere is the uniform traction \(\mathbf{f} = -\frac{3\mu}{2a}\mathbf{U}\), and integrating this density gives the total force. More generally, for non-spherical bodies, the drag must be computed numerically using the BIE formulation, and the resulting force depends on the body's orientation through the resistance tensor.
</div>

One of the most striking applications of Stokes BIE methods is to the simulation of suspensions of many particles. When \(M\) rigid particles are suspended in a Stokes flow, the boundary integral formulation involves surfaces of all \(M\) particles simultaneously. With FMM acceleration, the cost per time step is \(O(M \cdot N_p)\), where \(N_p\) is the number of unknowns per particle, enabling simulations with thousands to millions of particles. This capability has transformed the study of blood flow (red blood cells as deformable capsules), sedimentation, and microfluidic sorting.

<div class="example">
<strong>Example 7.9.</strong> Consider the sedimentation of two identical rigid spheres of radius \(a\), initially side by side at the same height, falling under gravity in a Stokes fluid. By symmetry, both spheres fall at the same speed, but due to hydrodynamic interaction (captured by the BIE formulation), each sphere falls faster than an isolated sphere would. The sedimentation velocity is

\[
U_{\text{pair}} = U_0 \left(1 + \frac{3a}{2d} + O(a^2/d^2)\right),
\]
where \(U_0 = \frac{2a^2 (\rho_s - \rho_f) g}{9\mu}\) is the Stokes settling velocity of an isolated sphere and \(d\) is the center-to-center distance. The \(3a/(2d)\) correction is the leading-order hydrodynamic interaction, and it arises naturally from the off-diagonal blocks of the BIE linear system.
</div>

### 7.3 Electromagnetic Scattering

The boundary integral formulation for Maxwell's equations is considerably more complex than for scalar equations, owing to the vector nature of the fields and the need for surface vector calculus. Nevertheless, boundary integral methods are among the most effective tools for computational electromagnetics, particularly for scattering by perfectly conducting or dielectric bodies.

<div class="definition">
<strong>Definition 7.10 (Time-Harmonic Maxwell's Equations).</strong> In a homogeneous medium with permittivity \(\epsilon\) and permeability \(\mu_0\), the time-harmonic Maxwell equations (with \(e^{-i\omega t}\) convention) reduce to the vector Helmholtz equations

\[
\nabla \times \nabla \times \mathbf{E} - k^2 \mathbf{E} = 0, \quad \nabla \times \nabla \times \mathbf{H} - k^2 \mathbf{H} = 0,
\]
where \(k = \omega\sqrt{\epsilon\mu_0}\) is the wavenumber and \(\nabla \cdot \mathbf{E} = \nabla \cdot \mathbf{H} = 0\).
</div>

The free-space dyadic Green's function for Maxwell's equations is constructed from the scalar Helmholtz Green's function:

\[
\overline{\overline{G}}(\mathbf{x}, \mathbf{y}) = \left(I + \frac{1}{k^2}\nabla\nabla\right) \Phi_k(\mathbf{x}, \mathbf{y}).
\]
This leads to the electric field integral equation (EFIE) and the magnetic field integral equation (MFIE) for the surface current \(\mathbf{J} = \hat{\nu} \times \mathbf{H}\) on a perfect conductor.

<div class="definition">
<strong>Definition 7.11 (EFIE and MFIE).</strong> For scattering by a perfect electric conductor (PEC) with boundary \(\Gamma\), the <em>electric field integral equation</em> (EFIE) is

\[
-\hat{\nu}(\mathbf{x}) \times \hat{\nu}(\mathbf{x}) \times \left[ ik\mu_0 \int_\Gamma \overline{\overline{G}}(\mathbf{x}, \mathbf{y}) \cdot \mathbf{J}(\mathbf{y}) \, dS(\mathbf{y}) \right] = \hat{\nu}(\mathbf{x}) \times \hat{\nu}(\mathbf{x}) \times \mathbf{E}^i(\mathbf{x}), \quad \mathbf{x} \in \Gamma.
\]
The <em>magnetic field integral equation</em> (MFIE) is

\[
\frac{1}{2}\mathbf{J}(\mathbf{x}) + \hat{\nu}(\mathbf{x}) \times \text{p.v.}\int_\Gamma \nabla_{\mathbf{x}} \Phi_k(\mathbf{x}, \mathbf{y}) \times \mathbf{J}(\mathbf{y}) \, dS(\mathbf{y}) = \hat{\nu}(\mathbf{x}) \times \mathbf{H}^i(\mathbf{x}), \quad \mathbf{x} \in \Gamma.
\]
</div>

The EFIE is a first-kind equation (and hence ill-conditioned), while the MFIE is second-kind but only valid for closed surfaces. For open surfaces (such as thin plates or slot antennas), only the EFIE applies. The combined field integral equation (CFIE), a weighted average of the EFIE and MFIE, is both uniquely solvable at all frequencies and applicable to closed surfaces. The standard CFIE takes the form

\[
\alpha \cdot \text{EFIE} + (1 - \alpha) \cdot \text{MFIE},
\]
with the conventional choice \(\alpha = 0.5\). The CFIE is the electromagnetic analog of the Burton-Miller formulation for the Helmholtz equation (Theorem 3.9), and it eliminates the interior resonance problem that plagues both the EFIE and MFIE individually. The conditioning of the CFIE grows only as \(O(k)\) with frequency, compared to \(O(k^2)\) for the EFIE, making it far more amenable to iterative solution.

<div class="remark">
<strong>Remark 7.12.</strong> The numerical discretization of the EFIE requires divergence-conforming basis functions — the Rao-Wilton-Glisson (RWG) elements, introduced in 1982 — to properly represent the surface current. The RWG basis functions are vector-valued, piecewise linear functions defined on pairs of triangles, with the crucial property that their surface divergence is piecewise constant. This ensures that the discretized EFIE respects the divergence condition and avoids spurious solutions. The Galerkin testing of the EFIE with RWG elements produces the standard method of moments (MoM) system used throughout computational electromagnetics.
</div>

### 7.4 Elasticity

Linear elasticity is another classical domain of boundary integral equations, with a long history going back to the work of Betti (1872) and Somigliana (1886). The boundary integral equation method extends naturally to the equations of linear elastostatics and elastodynamics. The fundamental solution for the Navier-Cauchy equations of linear elasticity (the Kelvin solution) plays the same role that the Laplace fundamental solution plays for potential theory.

<div class="definition">
<strong>Definition 7.13 (Kelvin Solution).</strong> The fundamental solution for the Navier-Cauchy equations of linear elastostatics in \(\mathbb{R}^3\),

\[
\mu \Delta \mathbf{u} + (\lambda + \mu) \nabla(\nabla \cdot \mathbf{u}) + \mathbf{f} = 0,
\]
where \(\lambda\) and \(\mu\) are the Lame parameters, is the displacement field due to a point force:

\[
U_{ij}(\mathbf{x}, \mathbf{y}) = \frac{1}{16\pi\mu(1-\nu)|\mathbf{r}|} \left[ (3-4\nu)\delta_{ij} + \frac{r_i r_j}{|\mathbf{r}|^2} \right],
\]
where \(\nu = \lambda/[2(\lambda + \mu)]\) is the Poisson ratio and \(\mathbf{r} = \mathbf{x} - \mathbf{y}\).
</div>

The structure of the elasticity boundary integral equation is identical in spirit to the Stokes case (indeed, the Stokes equations are the incompressible limit \(\nu \to 1/2\) of the elasticity equations). The single-layer potential involves the Kelvin solution \(U_{ij}\), and the double-layer kernel involves the associated traction tensor.

<div class="theorem">
<strong>Theorem 7.14 (Somigliana Identity).</strong> Let \(\Omega \subset \mathbb{R}^3\) be a bounded domain with \(C^2\) boundary \(\Gamma\), and let \(\mathbf{u}\) satisfy the Navier-Cauchy equations with no body force in \(\Omega\). Then for \(\mathbf{y} \in \Omega\),

\[
u_i(\mathbf{y}) = \int_\Gamma \left[ U_{ij}(\mathbf{x}, \mathbf{y}) t_j(\mathbf{x}) - T_{ijk}(\mathbf{x}, \mathbf{y}) \nu_k(\mathbf{x}) u_j(\mathbf{x}) \right] dS(\mathbf{x}),
\]
where \(t_j = \sigma_{jk}\nu_k\) is the traction on \(\Gamma\), \(U_{ij}\) is the Kelvin solution, and \(T_{ijk}\) is the associated stress kernel. This is the elasticity analog of Green's representation formula for the Laplacian.
</div>

The Somigliana identity expresses the displacement at interior points in terms of boundary displacements and tractions. For the interior Dirichlet problem (prescribed displacement), the unknown traction is determined by a boundary integral equation obtained by taking the limit \(\mathbf{y} \to \Gamma\) and applying the jump relations for the elasticity layer potentials.

<div class="example">
<strong>Example 7.15.</strong> Consider a spherical cavity of radius \(a\) in an infinite elastic body under uniform far-field stress \(\sigma_{ij}^\infty\). The stress concentration factor around the cavity is a classical result of Goodier (1933): the maximum hoop stress on the cavity surface is

\[
\sigma_{\theta\theta}^{\max} = \frac{3(9-5\nu)}{2(7-5\nu)} \sigma_{11}^\infty
\]
for uniaxial tension, which equals \(\frac{27}{14}\sigma_{11}^\infty \approx 1.929\sigma_{11}^\infty\) for \(\nu = 0.3\). This benchmark solution can be reproduced to high accuracy by the boundary element method with a relatively coarse mesh on the cavity surface, illustrating the efficiency of BIE methods for exterior elasticity problems.
</div>

### 7.5 Comparison with FEM and FDM

To conclude these notes, we briefly compare the boundary integral equation / boundary element method (BIE/BEM) with the two dominant volume discretization approaches: the finite element method (FEM) and the finite difference method (FDM). This comparison is not about declaring a winner — each method has its natural domain of applicability — but about understanding which tools are best suited to which problems.

The principal advantage of the BIE/BEM approach is dimensional reduction: only the boundary \(\Gamma\) is discretized, reducing a 3D problem to a 2D one. This is particularly beneficial for exterior problems in unbounded domains, where volume methods require artificial truncation of the domain and absorbing boundary conditions. BIE methods automatically enforce the correct behavior at infinity (radiation condition, decay conditions) through the choice of fundamental solution.

<div class="theorem">
<strong>Theorem 7.16 (Dimension Count Comparison).</strong> For a boundary value problem on a domain \(\Omega \subset \mathbb{R}^3\) with boundary \(\Gamma\), discretized with mesh size \(h\):
<ul>
<li>FEM/FDM: \(O(h^{-3})\) unknowns (volume mesh).</li>
<li>BEM: \(O(h^{-2})\) unknowns (surface mesh).</li>
</ul>
For exterior problems in \(\mathbb{R}^3\), FEM requires an artificial boundary at distance \(R\), adding \(O((R/h)^3)\) unknowns that do not improve the solution on \(\Gamma\). BEM requires no artificial boundary.
</div>

A second important advantage of BIE methods is the high accuracy achievable on the boundary itself. Since the integral equation is solved directly on \(\Gamma\), boundary quantities (such as surface stresses, heat fluxes, or surface currents) are computed as primary unknowns rather than being recovered by differentiation of a volume solution. This avoids the loss of accuracy inherent in numerical differentiation and makes BIE methods the preferred choice for problems where boundary quantities are the primary interest, such as fracture mechanics (stress intensity factors) and electromagnetic compatibility (surface currents and charges).

However, the BIE/BEM approach has significant disadvantages as well. The system matrix is dense (\(O(N^2)\) storage for \(N\) unknowns, compared to \(O(N)\) for sparse FEM matrices), although fast algorithms reduce this to \(O(N)\) or \(O(N \log N)\). The method is restricted to linear, homogeneous-medium problems for which a fundamental solution is known (or can be efficiently computed). Non-linear problems, variable coefficients, and multi-physics coupling are difficult to handle. Finally, the implementation of BEM codes is considerably more complex than FEM codes, owing to the singular integrals, specialized quadrature, and fast algorithms required.

<div class="remark">
<strong>Remark 7.17.</strong> In practice, the BIE/BEM approach excels for linear homogeneous problems in exterior domains (scattering, radiation, potential flow, geophysics), problems requiring high accuracy on the boundary (fracture mechanics, electromagnetic compatibility), and problems with moving boundaries (Stokes flow, shape optimization). FEM excels for problems with heterogeneous materials, nonlinear constitutive laws, and complex interior structures. Hybrid FEM-BEM coupling methods combine the strengths of both approaches: FEM for the interior (where the medium may be inhomogeneous and nonlinear) and BEM for the exterior (where the medium is homogeneous and the domain is unbounded).
</div>

<div class="example">
<strong>Example 7.18.</strong> To make the comparison concrete, consider solving the exterior Helmholtz equation (sound-soft scattering) on a sphere of radius \(a = 5\lambda\) (10 wavelengths in diameter) in \(\mathbb{R}^3\).

For FEM with linear elements: the computational domain must extend to at least \(R = 10\lambda\) with an absorbing boundary condition (PML). The volume mesh requires approximately \(10\) elements per wavelength, giving \(N_{\text{FEM}} \approx (20\lambda/(\lambda/10))^3 = 200^3 = 8 \times 10^6\) unknowns. The sparse system requires \(O(N_{\text{FEM}})\) storage and \(O(N_{\text{FEM}}^{4/3})\) work for a sparse direct solver.

For BEM with the Burton-Miller formulation: only the sphere surface is meshed, requiring approximately \(10\) elements per wavelength on the surface, giving \(N_{\text{BEM}} \approx (10 \times 10)^2 \times 4\pi \approx 1.3 \times 10^5\) unknowns. With FMM acceleration, the iterative solution requires \(O(N_{\text{BEM}})\) work per iteration and typically converges in \(O(1)\) iterations for this well-conditioned problem.

The BEM approach requires roughly 60 times fewer unknowns and proportionally less computation time, illustrating the dimensional reduction advantage for this class of problems.
</div>

<div class="example">
<strong>Example 7.19.</strong> The following table summarizes the asymptotic complexity of the main methods for a 3D boundary value problem with \(N\) boundary unknowns:

| Operation | BEM (dense) | BEM + FMM | FEM |
|-----------|-------------|-----------|-----|
| Storage | \(O(N^2)\) | \(O(N)\) | \(O(N^{3/2})\) |
| Matrix-vector product | \(O(N^2)\) | \(O(N)\) | \(O(N^{3/2})\) |
| Direct solve | \(O(N^3)\) | N/A | \(O(N^{3})\) (volume) |
| Iterative solve (total) | \(O(N^2 \cdot n_{\text{iter}})\) | \(O(N \cdot n_{\text{iter}})\) | \(O(N^{3/2} \cdot n_{\text{iter}})\) |

Here the FEM complexities refer to the volume problem with \(O(N^{3/2})\) volume unknowns (since \(N\) surface unknowns correspond to \(O(N^{3/2})\) volume unknowns on a quasi-uniform mesh in 3D). The \(\mathcal{H}\)-matrix LU factorization of the BEM system requires \(O(N^{3/2})\) work in 2D and \(O(N^2)\) work in 3D, providing a fast direct solver that is competitive with sparse direct solvers for FEM.
</div>

<div class="remark">
<strong>Remark 7.20.</strong> The development of integral equation methods for PDEs spans more than 150 years, from the pioneering work of Green (1828), Gauss, and Neumann through Fredholm's theory (1903), the numerical boundary element methods of the 1960s-70s, and the fast algorithms of Greengard and Rokhlin (1987). The field continues to advance rapidly, with recent developments in high-order discretizations, fast direct solvers, and integral equation methods for wave propagation in complex media. The combination of elegant mathematical theory with practical computational power makes this one of the most rewarding areas of applied mathematics.
</div>
