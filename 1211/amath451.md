---
title: "AMATH 451: Introduction to Dynamical Systems"
layout: toc
parent: Winter 2021
prof: "Sue Ann Campbell (2020) & Xinzhi Liu (2021)"
---

<style>
.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; }
.embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
</style>

# AMATH 451: Introduction to Dynamical Systems

These notes integrate two sets of course materials: **Sue Ann Campbell's** lecture notes (Winter 2020, 144 pp.) and **Xinzhi Liu's** course notes (January 2021, 116 pp.). Together they provide a rigorous treatment of continuous dynamical systems, from existence theory through linear analysis, local and global nonlinear behavior, to periodic orbits and bifurcations.

---

## Chapter 1: Introduction and Fundamental Theory

### 1.1 What Is a Dynamical System?

A **dynamical system** describes the evolution of some state over time according to a fixed rule. In continuous time, this rule takes the form of an ordinary differential equation. We concentrate on **autonomous** systems — those where the rule does not depend explicitly on time — of the form

<span>&#92;[  &#92;dot{x} = f(x), &#92;quad x &#92;in &#92;mathbb{R}^n, &#92;]</span>

where <span>&#92;( f: &#92;mathbb{R}^n &#92;to &#92;mathbb{R}^n &#92;)</span> is a smooth (at least <span>&#92;( C^1 &#92;)</span>) vector field. The term *autonomous* means that <span>&#92;( f &#92;)</span> does not depend on <span>&#92;( t &#92;)</span>; the state <span>&#92;( x &#92;)</span> alone determines how the system evolves. A **solution** to this system is a differentiable curve <span>&#92;( x(t) &#92;)</span> satisfying the equation on some interval <span>&#92;( (a, b) &#92;)</span>.

### 1.2 Motivating Examples

#### Competing Species

A classical motivation comes from population dynamics. Suppose two species compete for the same resource, with populations <span>&#92;( x_1(t) &#92;)</span> and <span>&#92;( x_2(t) &#92;)</span>. A simple model is

<span>&#92;[  &#92;begin{aligned} &#92;dot{x}_1 &= a_1 x_1 - b_{11} x_1^2 - b_{12} x_1 x_2, &#92;&#92; &#92;dot{x}_2 &= a_2 x_2 - b_{21} x_1 x_2 - b_{22} x_2^2, &#92;end{aligned} &#92;]</span>

where <span>&#92;( a_i > 0 &#92;)</span> are intrinsic growth rates and <span>&#92;( b_{ij} > 0 &#92;)</span> are competition coefficients. The term <span>&#92;( -b_{ii} x_i^2 &#92;)</span> represents intraspecies competition (logistic self-limiting), while <span>&#92;( -b_{ij} x_i x_j &#92;)</span> captures interspecies competition. This system has up to four equilibria: the origin (mutual extinction), two single-species equilibria, and potentially a coexistence equilibrium. Determining which equilibrium is stable — and hence which species persists or whether coexistence is possible — is a central question of dynamical systems analysis.

#### The Mass-Spring System

A second fundamental example is the damped harmonic oscillator. A mass <span>&#92;( m &#92;)</span> attached to a spring (stiffness <span>&#92;( k &#92;)</span>) with damping coefficient <span>&#92;( c &#92;)</span> satisfies

<span>&#92;[  m &#92;ddot{q} + c &#92;dot{q} + k q = 0. &#92;]</span>

Introducing state variables <span>&#92;( x_1 = q &#92;)</span> and <span>&#92;( x_2 = &#92;dot{q} &#92;)</span>, this becomes the first-order system

<span>&#92;[  &#92;begin{pmatrix} &#92;dot{x}_1 &#92;&#92; &#92;dot{x}_2 &#92;end{pmatrix} = &#92;begin{pmatrix} 0 & 1 &#92;&#92; -k/m & -c/m &#92;end{pmatrix} &#92;begin{pmatrix} x_1 &#92;&#92; x_2 &#92;end{pmatrix}. &#92;]</span>

When <span>&#92;( c = 0 &#92;)</span> (undamped), solutions are periodic oscillations. When <span>&#92;( c > 0 &#92;)</span> (overdamped, critically damped, or underdamped), solutions decay to the rest state at the origin. The mass-spring system thus illustrates the three qualitatively different behaviors of a 2D linear system.

### 1.3 Fundamental Definitions

**Definition 1.1 (Equilibrium).** A point <span>&#92;( x^* &#92;in &#92;mathbb{R}^n &#92;)</span> is an **equilibrium point** (or *fixed point*, *rest point*, *steady state*) of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> if <span>&#92;( f(x^*) = 0 &#92;)</span>. The constant function <span>&#92;( x(t) = x^* &#92;)</span> is then a solution.

**Definition 1.2 (Flow).** Given initial data <span>&#92;( x(t_0) = x_0 &#92;)</span>, the unique solution (when it exists) defines a map <span>&#92;( &#92;phi_t: &#92;mathbb{R}^n &#92;to &#92;mathbb{R}^n &#92;)</span> by <span>&#92;( &#92;phi_t(x_0) = x(t_0 + t) &#92;)</span>. This family of maps is called the **flow** of the system and satisfies the group property

<span>&#92;[  &#92;phi_0 = &#92;text{id}, &#92;qquad &#92;phi_{s+t} = &#92;phi_s &#92;circ &#92;phi_t. &#92;]</span>

**Definition 1.3 (Orbit).** The **orbit** (or *trajectory*) through <span>&#92;( x_0 &#92;)</span> is the set <span>&#92;( &#92;{&#92;phi_t(x_0) : t &#92;in &#92;mathbb{R}&#92;} &#92;)</span>. A **phase portrait** is the collection of all orbits drawn in state space, which is called the **phase space**.

Orbits of autonomous systems never cross. If two orbits shared a point <span>&#92;( x_0 &#92;)</span> at possibly different times, uniqueness of solutions would force them to be the same orbit. This non-crossing property is one of the most powerful structural features of autonomous systems.

### 1.4 Stability

We distinguish several notions of stability for an equilibrium <span>&#92;( x^* &#92;)</span>. Without loss of generality, we may translate so that <span>&#92;( x^* = 0 &#92;)</span>.

**Definition 1.4 (Lyapunov Stability).** The equilibrium <span>&#92;( x^* = 0 &#92;)</span> is **Lyapunov stable** if for every <span>&#92;( &#92;epsilon > 0 &#92;)</span> there exists <span>&#92;( &#92;delta > 0 &#92;)</span> such that

<span>&#92;[  &#92;|x(0)&#92;| < &#92;delta &#92;implies &#92;|x(t)&#92;| < &#92;epsilon &#92;quad &#92;text{for all } t &#92;geq 0. &#92;]</span>

**Definition 1.5 (Asymptotic Stability).** The equilibrium is **asymptotically stable** if it is Lyapunov stable and there exists <span>&#92;( &#92;delta > 0 &#92;)</span> such that <span>&#92;( &#92;|x(0)&#92;| < &#92;delta &#92;)</span> implies <span>&#92;( x(t) &#92;to 0 &#92;)</span> as <span>&#92;( t &#92;to &#92;infty &#92;)</span>.

**Definition 1.6 (Unstable).** An equilibrium that is not Lyapunov stable is called **unstable**.

The distinction between Lyapunov stability and asymptotic stability is important: a center of a conservative system is Lyapunov stable but not asymptotically stable. Asymptotic stability requires both that nearby trajectories stay close *and* that they eventually return to the equilibrium.

### 1.5 Existence and Uniqueness

The theoretical foundation of dynamical systems rests on the following theorem.

**Theorem 1.7 (Picard–Lindelöf / Cauchy–Lipschitz).** Let <span>&#92;( f: U &#92;to &#92;mathbb{R}^n &#92;)</span> be continuous on an open set <span>&#92;( U &#92;subseteq &#92;mathbb{R}^n &#92;)</span>, and suppose <span>&#92;( f &#92;)</span> is **locally Lipschitz** in <span>&#92;( x &#92;)</span>: for each compact <span>&#92;( K &#92;subset U &#92;)</span> there exists <span>&#92;( L > 0 &#92;)</span> such that

<span>&#92;[  &#92;|f(x) - f(y)&#92;| &#92;leq L&#92;|x - y&#92;| &#92;quad &#92;forall x, y &#92;in K. &#92;]</span>

Then for each <span>&#92;( x_0 &#92;in U &#92;)</span> there exists <span>&#92;( T > 0 &#92;)</span> and a unique solution <span>&#92;( x: (-T, T) &#92;to U &#92;)</span> satisfying <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> and <span>&#92;( x(0) = x_0 &#92;)</span>. In particular, if <span>&#92;( f &#92;in C^1(U) &#92;)</span>, then the Lipschitz condition is automatically satisfied.

The proof proceeds by **Picard iteration**: one converts the ODE into the integral equation

<span>&#92;[  x(t) = x_0 + &#92;int_0^t f(x(s)) &#92;, ds, &#92;]</span>

and defines the iterates <span>&#92;( x^{(0)}(t) = x_0 &#92;)</span> and

<span>&#92;[  x^{(k+1)}(t) = x_0 + &#92;int_0^t f(x^{(k)}(s)) &#92;, ds. &#92;]</span>

The Lipschitz condition ensures that <span>&#92;( &#92;{x^{(k)}&#92;} &#92;)</span> is a Cauchy sequence in the space of continuous functions on a sufficiently small interval, and the limit is the unique solution. The Lipschitz constant also controls the rate of convergence: the error after <span>&#92;( k &#92;)</span> steps is bounded by <span>&#92;( (Lt)^k / k! &#92;)</span> times a constant.

**Remark.** The local Lipschitz condition (implied by <span>&#92;( C^1 &#92;)</span>) is sufficient for local existence and uniqueness but does not prevent solutions from blowing up in finite time. For example, <span>&#92;( &#92;dot{x} = x^2 &#92;)</span> with <span>&#92;( x(0) = 1 &#92;)</span> has the solution <span>&#92;( x(t) = 1/(1-t) &#92;)</span>, which blows up as <span>&#92;( t &#92;to 1^- &#92;)</span>. The **maximal interval of existence** is the largest interval on which the solution remains in <span>&#92;( U &#92;)</span>.

**Theorem 1.8 (Continuation).** If <span>&#92;( f &#92;)</span> is locally Lipschitz on <span>&#92;( U &#92;)</span>, the maximal interval of existence is open. If it is bounded, say <span>&#92;( (a, b) &#92;)</span> with <span>&#92;( b < &#92;infty &#92;)</span>, then <span>&#92;( x(t) &#92;)</span> must leave every compact subset of <span>&#92;( U &#92;)</span> as <span>&#92;( t &#92;to b^- &#92;)</span>.

---

## Chapter 2: Linear Systems

### 2.1 The Matrix Exponential

A **linear system** takes the form

<span>&#92;[  &#92;dot{x} = Ax, &#92;quad x &#92;in &#92;mathbb{R}^n, &#92;]</span>

where <span>&#92;( A &#92;)</span> is an <span>&#92;( n &#92;times n &#92;)</span> real matrix. The unique solution with initial condition <span>&#92;( x(0) = x_0 &#92;)</span> is

<span>&#92;[  x(t) = e^{At} x_0, &#92;]</span>

where the **matrix exponential** is defined by the convergent series

<span>&#92;[  e^{At} = &#92;sum_{k=0}^{&#92;infty} &#92;frac{(At)^k}{k!} = I + At + &#92;frac{A^2 t^2}{2!} + &#92;cdots &#92;]</span>

This series converges absolutely for all <span>&#92;( t &#92;)</span> and all matrices <span>&#92;( A &#92;)</span>. The matrix exponential satisfies several key properties:

- <span>&#92;( e^{A \cdot 0} = I &#92;)</span>
- <span>&#92;( &#92;frac{d}{dt} e^{At} = A e^{At} = e^{At} A &#92;)</span>
- If <span>&#92;( AB = BA &#92;)</span>, then <span>&#92;( e^{(A+B)t} = e^{At} e^{Bt} &#92;)</span>
- <span>&#92;( (e^{At})^{-1} = e^{-At} &#92;)</span>

The last property shows that <span>&#92;( e^{At} &#92;)</span> is always invertible, so the flow of a linear system is a bijection. Note that <span>&#92;( e^{At} e^{Bt} = e^{(A+B)t} &#92;)</span> holds *only* when <span>&#92;( A &#92;)</span> and <span>&#92;( B &#92;)</span> commute — a common source of error.

### 2.2 Computing the Matrix Exponential

For an <span>&#92;( n &#92;times n &#92;)</span> matrix <span>&#92;( A &#92;)</span>, the series definition is impractical. We instead use the eigenstructure of <span>&#92;( A &#92;)</span>.

**Case 1: Diagonalizable.** If <span>&#92;( A = P D P^{-1} &#92;)</span> where <span>&#92;( D = &#92;text{diag}(&#92;lambda_1, &#92;ldots, &#92;lambda_n) &#92;)</span>, then

<span>&#92;[  e^{At} = P e^{Dt} P^{-1} = P &#92;begin{pmatrix} e^{&#92;lambda_1 t} & & &#92;&#92; & &#92;ddots & &#92;&#92; & & e^{&#92;lambda_n t} &#92;end{pmatrix} P^{-1}. &#92;]</span>

The columns of <span>&#92;( P &#92;)</span> are eigenvectors. The solution is then a linear combination of modes <span>&#92;( e^{&#92;lambda_i t} v_i &#92;)</span> where <span>&#92;( v_i &#92;)</span> is the <span>&#92;( i &#92;)</span>-th eigenvector.

**Case 2: Complex conjugate eigenvalues.** If <span>&#92;( A &#92;)</span> is real and has complex eigenvalues <span>&#92;( &#92;lambda = &#92;alpha &#92;pm &#92;beta i &#92;)</span>, write the complex eigenvector as <span>&#92;( v = a + bi &#92;)</span>. The real solutions form the pair

<span>&#92;[  e^{&#92;alpha t}(&#92;cos(&#92;beta t) a - &#92;sin(&#92;beta t) b), &#92;qquad e^{&#92;alpha t}(&#92;sin(&#92;beta t) a + &#92;cos(&#92;beta t) b). &#92;]</span>

### 2.3 Jordan Canonical Form

When <span>&#92;( A &#92;)</span> is not diagonalizable, it may still be brought to **Jordan canonical form** by a change of basis over <span>&#92;( &#92;mathbb{C} &#92;)</span>.

**Theorem 2.1 (Jordan Normal Form).** For any <span>&#92;( n &#92;times n &#92;)</span> matrix <span>&#92;( A &#92;)</span> over <span>&#92;( &#92;mathbb{C} &#92;)</span>, there exists an invertible matrix <span>&#92;( P &#92;)</span> such that <span>&#92;( P^{-1}AP = J &#92;)</span> where <span>&#92;( J &#92;)</span> is block-diagonal with **Jordan blocks**:

<span>&#92;[  J_k(&#92;lambda) = &#92;begin{pmatrix} &#92;lambda & 1 & & &#92;&#92; & &#92;lambda & &#92;ddots & &#92;&#92; & & &#92;ddots & 1 &#92;&#92; & & & &#92;lambda &#92;end{pmatrix}_{k &#92;times k}. &#92;]</span>

The matrix exponential of a Jordan block satisfies

<span>&#92;[  e^{J_k(&#92;lambda)t} = e^{&#92;lambda t} &#92;begin{pmatrix} 1 & t & &#92;frac{t^2}{2!} & &#92;cdots & &#92;frac{t^{k-1}}{(k-1)!} &#92;&#92; 0 & 1 & t & &#92;cdots & &#92;frac{t^{k-2}}{(k-2)!} &#92;&#92; &#92;vdots & & &#92;ddots & & &#92;vdots &#92;&#92; 0 & &#92;cdots & & & 1 &#92;end{pmatrix}. &#92;]</span>

The presence of Jordan blocks introduces polynomial growth factors <span>&#92;( t^j e^{&#92;lambda t} &#92;)</span>, which appear in solutions corresponding to repeated eigenvalues.

**Definition 2.2.** The **generalized eigenspace** corresponding to eigenvalue <span>&#92;( &#92;lambda &#92;)</span> is

<span>&#92;[  V_&#92;lambda = &#92;ker(A - &#92;lambda I)^n. &#92;]</span>

Generalized eigenvectors <span>&#92;( v &#92;)</span> of rank <span>&#92;( r &#92;)</span> satisfy <span>&#92;( (A - &#92;lambda I)^r v = 0 &#92;)</span> but <span>&#92;( (A - &#92;lambda I)^{r-1} v &#92;neq 0 &#92;)</span>. They are found by solving the chain of equations <span>&#92;( (A - &#92;lambda I) w_r = w_{r-1}, &#92;ldots, (A - &#92;lambda I) w_1 = 0 &#92;)</span>, where <span>&#92;( w_1 &#92;)</span> is a genuine eigenvector.

### 2.4 Classification of 2D Linear Systems

The long-term behavior of solutions to <span>&#92;( &#92;dot{x} = Ax &#92;)</span> is determined by the eigenvalues of <span>&#92;( A &#92;)</span>. For <span>&#92;( n = 2 &#92;)</span>, let <span>&#92;( &#92;lambda_1, &#92;lambda_2 &#92;)</span> be the eigenvalues (real or complex conjugates). Define the trace <span>&#92;( &#92;tau = &#92;text{tr}(A) = &#92;lambda_1 + &#92;lambda_2 &#92;)</span> and determinant <span>&#92;( &#92;Delta = &#92;det(A) = &#92;lambda_1 &#92;lambda_2 &#92;)</span>.

**Real distinct eigenvalues** (<span>&#92;( &#92;Delta > 0 &#92;)</span>, <span>&#92;( &#92;tau^2 > 4&#92;Delta &#92;)</span>):
- Both negative (<span>&#92;( &#92;lambda_1 < &#92;lambda_2 < 0 &#92;)</span>): **stable node**. All trajectories approach the origin tangent to the eigenvector of the less negative eigenvalue.
- Both positive (<span>&#92;( 0 < &#92;lambda_1 < &#92;lambda_2 &#92;)</span>): **unstable node**. Time-reversed version.
- Opposite signs (<span>&#92;( &#92;Delta < 0 &#92;)</span>): **saddle**. The unstable manifold aligns with the eigenvector of the positive eigenvalue, the stable manifold with that of the negative eigenvalue.

**Complex conjugate eigenvalues** <span>&#92;( &#92;lambda = &#92;alpha &#92;pm &#92;beta i &#92;)</span> (<span>&#92;( &#92;beta &#92;neq 0 &#92;)</span>):
- <span>&#92;( &#92;alpha < 0 &#92;)</span>: **stable spiral**. Trajectories spiral inward.
- <span>&#92;( &#92;alpha > 0 &#92;)</span>: **unstable spiral**. Trajectories spiral outward.
- <span>&#92;( &#92;alpha = 0 &#92;)</span>: **centre**. Trajectories are ellipses. Lyapunov stable but not asymptotically stable.

**Repeated eigenvalues** (<span>&#92;( &#92;tau^2 = 4&#92;Delta &#92;)</span>):
- Diagonalizable (<span>&#92;( A = &#92;lambda I &#92;)</span>): **star node**. All lines through the origin are invariant.
- One Jordan block: **improper node** (degenerate node). Trajectories approach tangent to the single eigenvector direction.

The stability of the origin is summarized by the sign of the real parts: the origin is asymptotically stable if and only if all eigenvalues have strictly negative real part, i.e., <span>&#92;( &#92;tau < 0 &#92;)</span> and <span>&#92;( &#92;Delta > 0 &#92;)</span>.

### 2.5 Contractions and Expansions

Liu's notes emphasize the geometric interpretation of linear flows in terms of *volume* and *distance*.

**Definition 2.3.** The linear system <span>&#92;( &#92;dot{x} = Ax &#92;)</span> is called a **contraction** if all eigenvalues of <span>&#92;( A &#92;)</span> have negative real parts, and an **expansion** if all eigenvalues have positive real parts.

For a contraction, the flow <span>&#92;( e^{At} &#92;)</span> shrinks distances: there exist constants <span>&#92;( C > 0 &#92;)</span> and <span>&#92;( &#92;alpha > 0 &#92;)</span> such that

<span>&#92;[  &#92;|e^{At} x&#92;| &#92;leq C e^{-&#92;alpha t} &#92;|x&#92;| &#92;quad &#92;text{for all } t &#92;geq 0. &#92;]</span>

This exponential decay rate is related to the **spectral abscissa** <span>&#92;( &#92;mu(A) = &#92;max_i &#92;text{Re}(&#92;lambda_i) &#92;)</span>. Any <span>&#92;( &#92;alpha < |&#92;mu(A)| &#92;)</span> works as the decay rate, with the constant <span>&#92;( C &#92;)</span> absorbing the transient polynomial factors from Jordan blocks.

The **Liouville formula** connects the determinant of the flow to the trace of <span>&#92;( A &#92;)</span>:

<span>&#92;[  &#92;det(e^{At}) = e^{&#92;text{tr}(A) &#92;cdot t}. &#92;]</span>

Since <span>&#92;( &#92;text{tr}(A) = &#92;sum_i &#92;lambda_i &#92;)</span>, the flow expands volumes if <span>&#92;( &#92;text{tr}(A) > 0 &#92;)</span>, preserves them if <span>&#92;( &#92;text{tr}(A) = 0 &#92;)</span>, and contracts them if <span>&#92;( &#92;text{tr}(A) < 0 &#92;)</span>.

### 2.6 Nonhomogeneous Systems: Variation of Parameters

For the nonhomogeneous system <span>&#92;( &#92;dot{x} = Ax + g(t) &#92;)</span>, the solution with <span>&#92;( x(0) = x_0 &#92;)</span> is given by the **variation of parameters** formula:

<span>&#92;[  x(t) = e^{At} x_0 + &#92;int_0^t e^{A(t-s)} g(s) &#92;, ds. &#92;]</span>

This formula follows from multiplying both sides of the equation by the integrating factor <span>&#92;( e^{-At} &#92;)</span> and integrating. It shows that the response is a superposition of the free motion <span>&#92;( e^{At} x_0 &#92;)</span> and the convolution of the impulse response <span>&#92;( e^{At} &#92;)</span> with the forcing <span>&#92;( g(t) &#92;)</span>.

### 2.7 Stability of Linear Systems

The long-term behavior of <span>&#92;( &#92;dot{x} = Ax &#92;)</span> is completely characterized by the eigenvalues of <span>&#92;( A &#92;)</span>:

- The equilibrium <span>&#92;( x^* = 0 &#92;)</span> is **asymptotically stable** if and only if all eigenvalues of <span>&#92;( A &#92;)</span> have strictly negative real parts.
- It is **Lyapunov stable** (but not asymptotically stable) if all eigenvalues have non-positive real parts and all purely imaginary eigenvalues correspond to diagonalizable blocks.
- It is **unstable** if any eigenvalue has positive real part, or if there is a purely imaginary eigenvalue with a non-trivial Jordan block.

**Definition 2.4 (Stable, Unstable, Centre Subspaces).** Decompose <span>&#92;( &#92;mathbb{R}^n &#92;)</span> according to the eigenvalues of <span>&#92;( A &#92;)</span>:

<span>&#92;[  E^s = &#92;bigoplus_{&#92;text{Re}(&#92;lambda) < 0} V_&#92;lambda, &#92;quad E^u = &#92;bigoplus_{&#92;text{Re}(&#92;lambda) > 0} V_&#92;lambda, &#92;quad E^c = &#92;bigoplus_{&#92;text{Re}(&#92;lambda) = 0} V_&#92;lambda. &#92;]</span>

These are <span>&#92;( A &#92;)</span>-invariant subspaces satisfying <span>&#92;( E^s &#92;oplus E^u &#92;oplus E^c = &#92;mathbb{R}^n &#92;)</span>. Trajectories starting in <span>&#92;( E^s &#92;)</span> decay to zero exponentially; those in <span>&#92;( E^u &#92;)</span> grow; those in <span>&#92;( E^c &#92;)</span> neither grow nor decay (they oscillate, or remain constant).

### 2.8 Coupled Oscillators and Normal Modes

The linear systems framework extends naturally to mechanical systems with multiple interacting bodies. Consider <span>&#92;( n &#92;)</span> masses coupled by springs. Each mass obeys Newton's second law, but the forces depend on the positions of neighboring masses, coupling the equations of motion.

**Equations of Motion.** For two masses <span>&#92;( m_1, m_2 &#92;)</span> connected by three springs (spring constants <span>&#92;( k_1, k_2, k_3 &#92;)</span>) between two walls, application of Hooke's law and Newton's second law gives

<span>&#92;[  &#92;begin{pmatrix} m_1 & 0 &#92;&#92; 0 & m_2 &#92;end{pmatrix} &#92;begin{pmatrix} &#92;ddot{y}_1 &#92;&#92; &#92;ddot{y}_2 &#92;end{pmatrix} + &#92;begin{pmatrix} k_1 + k_2 & -k_2 &#92;&#92; -k_2 & k_2 + k_3 &#92;end{pmatrix} &#92;begin{pmatrix} y_1 &#92;&#92; y_2 &#92;end{pmatrix} = &#92;underline{c}, &#92;]</span>

which in operator notation is <span>&#92;( &#92;hat{O}[y] = &#92;underline{c} &#92;)</span> with <span>&#92;( &#92;hat{O} &#92;equiv MD^2 + K &#92;)</span>. Here <span>&#92;( M &#92;)</span> is the **mass matrix** (diagonal, positive definite), <span>&#92;( K &#92;)</span> is the **stiffness matrix** (symmetric, positive semi-definite), and <span>&#92;( &#92;underline{c} &#92;)</span> is a constant vector encoding the natural lengths of the springs.

**Reduction to Homogeneous Form.** By linearity, the general solution is the particular (equilibrium) solution plus the homogeneous solution. Setting <span>&#92;( y_i = &#92;eta_i + x_i &#92;)</span> where <span>&#92;( K&#92;underline{&#92;eta} = &#92;underline{c} &#92;)</span> defines the **equilibrium positions** <span>&#92;( &#92;eta_i &#92;)</span>, the displacements <span>&#92;( x_i(t) &#92;)</span> from equilibrium satisfy

<span>&#92;[  M&#92;ddot{x} + Kx = 0. &#92;]</span>

For equal unit masses <span>&#92;( M = I &#92;)</span>, this simplifies to <span>&#92;( &#92;ddot{x} + Gx = 0 &#92;)</span> with <span>&#92;( G = K &#92;)</span>. (When <span>&#92;( M &#92;neq I &#92;)</span>, one rescales coordinates to reduce to this form.)

**Normal Mode Analysis.** Substituting the trial solution <span>&#92;( x(t) = &#92;underline{p}&#92;cos(&#92;omega t - &#92;phi) &#92;)</span> into <span>&#92;( &#92;ddot{x} + Gx = 0 &#92;)</span> gives

<span>&#92;[  &#92;left[G - &#92;omega^2 I&#92;right]&#92;underline{p} = 0. &#92;]</span>

This is an **eigenvalue problem**: <span>&#92;( &#92;underline{p} &#92;)</span> must be an eigenvector of <span>&#92;( G &#92;)</span> with eigenvalue <span>&#92;( &#92;lambda = &#92;omega^2 &#92;)</span>. Non-trivial solutions exist only when <span>&#92;( &#92;det(G - &#92;lambda I) = 0 &#92;)</span>. Since <span>&#92;( G &#92;)</span> is real symmetric, all eigenvalues are real and eigenvectors are orthogonal.

**Symmetric Example.** Take <span>&#92;( m_1 = m_2 = 1 &#92;)</span> and <span>&#92;( k_1 = k_3 &#92;)</span> (left-right symmetric system). Then

<span>&#92;[  G = &#92;begin{pmatrix} k_1 + k_2 & -k_2 &#92;&#92; -k_2 & k_1 + k_2 &#92;end{pmatrix}. &#92;]</span>

The characteristic equation <span>&#92;( (k_1 + k_2 - &#92;lambda)^2 - k_2^2 = 0 &#92;)</span> gives two eigenvalues:

<span>&#92;[  &#92;lambda_1 = k_1, &#92;qquad &#92;lambda_2 = k_1 + 2k_2, &#92;]</span>

with corresponding normalized eigenvectors (normal modes):

<span>&#92;[  &#92;underline{p}^{(1)} = &#92;frac{1}{&#92;sqrt{2}}&#92;begin{pmatrix}1&#92;&#92;1&#92;end{pmatrix}, &#92;qquad &#92;underline{p}^{(2)} = &#92;frac{1}{&#92;sqrt{2}}&#92;begin{pmatrix}1&#92;&#92;-1&#92;end{pmatrix}. &#92;]</span>

**Physical Interpretation.**

- **Mode 1** (frequency <span>&#92;( &#92;omega_1 = &#92;sqrt{k_1} &#92;)</span>): the two masses oscillate *in phase* — <span>&#92;( x_1(t) = x_2(t) &#92;)</span>. The central spring neither stretches nor compresses, so only the wall springs <span>&#92;( k_1 = k_3 &#92;)</span> determine the frequency.
- **Mode 2** (frequency <span>&#92;( &#92;omega_2 = &#92;sqrt{k_1 + 2k_2} &#92;)</span>): the two masses oscillate *in antiphase* — <span>&#92;( x_1(t) = -x_2(t) &#92;)</span>. The central spring stretches twice as much as the wall springs, and both <span>&#92;( k_1 &#92;)</span> and <span>&#92;( k_2 &#92;)</span> contribute to the frequency.

**General Solution.** The general solution is a superposition of the two normal modes:

<span>&#92;[  x(t) = &#92;beta^{(1)} &#92;underline{p}^{(1)} &#92;cos&#92;left(&#92;omega_1 t - &#92;phi^{(1)}&#92;right) + &#92;beta^{(2)} &#92;underline{p}^{(2)} &#92;cos&#92;left(&#92;omega_2 t - &#92;phi^{(2)}&#92;right), &#92;]</span>

where the four constants <span>&#92;( &#92;beta^{(1)}, &#92;beta^{(2)}, &#92;phi^{(1)}, &#92;phi^{(2)} &#92;)</span> are determined by the four initial conditions <span>&#92;( x_1(0), x_2(0), &#92;dot{x}_1(0), &#92;dot{x}_2(0) &#92;)</span>. Any motion of the system, however complex, decomposes uniquely into these two fundamental oscillations.

**Connection to Linear Systems Theory.** The normal mode analysis connects directly to the eigenstructure of the matrix <span>&#92;( A &#92;)</span> in the first-order reformulation. Writing <span>&#92;( z = (x, &#92;dot{x})^T &#92;)</span>, the system <span>&#92;( &#92;ddot{x} + Gx = 0 &#92;)</span> becomes <span>&#92;( &#92;dot{z} = Az &#92;)</span> with

<span>&#92;[  A = &#92;begin{pmatrix} 0 & I &#92;&#92; -G & 0 &#92;end{pmatrix}. &#92;]</span>

The eigenvalues of <span>&#92;( A &#92;)</span> are <span>&#92;( &#92;pm i&#92;omega_j &#92;)</span> — purely imaginary, confirming that the undamped oscillator is a centre (Lyapunov stable but not asymptotically stable). The normal mode eigenvectors of <span>&#92;( G &#92;)</span> encode the spatial patterns of oscillation, while the eigenvalues <span>&#92;( &#92;omega_j^2 &#92;)</span> give the squared frequencies.

---

## Chapter 3: Nonlinear Local Theory

### 3.1 Linearization

The fundamental idea of local analysis is to approximate a nonlinear system near an equilibrium by its linearization.

**Definition 3.1.** Let <span>&#92;( x^* &#92;)</span> be an equilibrium of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span>. Writing <span>&#92;( x = x^* + u &#92;)</span> and expanding,

<span>&#92;[  &#92;dot{u} = f(x^* + u) = f(x^*) + Df(x^*) u + O(&#92;|u&#92;|^2) = Df(x^*) u + O(&#92;|u&#92;|^2), &#92;]</span>

since <span>&#92;( f(x^*) = 0 &#92;)</span>. The **linearization** at <span>&#92;( x^* &#92;)</span> is the linear system <span>&#92;( &#92;dot{u} = Df(x^*) u &#92;)</span> where <span>&#92;( Df(x^*) &#92;)</span> is the Jacobian matrix evaluated at the equilibrium.

**Definition 3.2 (Hyperbolic Equilibrium).** An equilibrium <span>&#92;( x^* &#92;)</span> is **hyperbolic** if no eigenvalue of <span>&#92;( Df(x^*) &#92;)</span> has zero real part — that is, <span>&#92;( E^c = &#92;{0&#92;} &#92;)</span>.

### 3.2 The Hartman–Grobman Theorem

The Hartman–Grobman theorem is one of the cornerstones of dynamical systems theory. It states that, near a hyperbolic equilibrium, the nonlinear flow is *topologically equivalent* to the linearized flow.

**Theorem 3.3 (Hartman–Grobman).** Let <span>&#92;( x^* &#92;)</span> be a hyperbolic equilibrium of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> with <span>&#92;( f &#92;in C^1 &#92;)</span>. Then there exists a neighborhood <span>&#92;( U &#92;)</span> of <span>&#92;( x^* &#92;)</span> and a homeomorphism <span>&#92;( h: U &#92;to V &#92;)</span> (a continuous bijection with continuous inverse) mapping orbits of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> to orbits of the linearization <span>&#92;( &#92;dot{u} = Df(x^*) u &#92;)</span>, preserving the direction of time.

The theorem says that near a hyperbolic equilibrium, the qualitative phase portrait of the nonlinear system is *the same* as that of its linearization — the two are related by a continuous (but generally not differentiable) change of coordinates. In particular:

- A **hyperbolic stable equilibrium** (all eigenvalues with negative real parts) of the linearization remains a stable equilibrium of the nonlinear system.
- A **hyperbolic unstable equilibrium** or **saddle** retains its character.
- If the equilibrium is non-hyperbolic (has purely imaginary eigenvalues), the Hartman–Grobman theorem does *not* apply, and the nonlinear terms can change the qualitative behavior (e.g., a center for the linearization might be a spiral for the nonlinear system).

### 3.3 Stable and Unstable Manifold Theorem

For hyperbolic equilibria, the linear stable and unstable subspaces generalize to *curved* manifolds in the nonlinear setting.

**Theorem 3.4 (Stable Manifold Theorem).** Let <span>&#92;( x^* &#92;)</span> be a hyperbolic equilibrium of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span>, with linearization having stable subspace <span>&#92;( E^s &#92;)</span> and unstable subspace <span>&#92;( E^u &#92;)</span>. Then there exist locally invariant manifolds <span>&#92;( W^s_{&#92;text{loc}}(x^*) &#92;)</span> and <span>&#92;( W^u_{&#92;text{loc}}(x^*) &#92;)</span> (the **local stable** and **unstable manifolds**) such that:

1. <span>&#92;( W^s_{&#92;text{loc}}(x^*) &#92;)</span> is tangent to <span>&#92;( E^s &#92;)</span> at <span>&#92;( x^* &#92;)</span>, and every trajectory starting in <span>&#92;( W^s_{&#92;text{loc}}(x^*) &#92;)</span> satisfies <span>&#92;( x(t) &#92;to x^* &#92;)</span> as <span>&#92;( t &#92;to +&#92;infty &#92;)</span>.
2. <span>&#92;( W^u_{&#92;text{loc}}(x^*) &#92;)</span> is tangent to <span>&#92;( E^u &#92;)</span> at <span>&#92;( x^* &#92;)</span>, and every trajectory starting in <span>&#92;( W^u_{&#92;text{loc}}(x^*) &#92;)</span> satisfies <span>&#92;( x(t) &#92;to x^* &#92;)</span> as <span>&#92;( t &#92;to -&#92;infty &#92;)</span>.
3. Both manifolds are <span>&#92;( C^r &#92;)</span> if <span>&#92;( f &#92;in C^r &#92;)</span>.

The **global stable manifold** <span>&#92;( W^s(x^*) &#92;)</span> is obtained by flowing the local manifold backwards in time. Similarly, the global unstable manifold <span>&#92;( W^u(x^*) &#92;)</span> flows the local manifold forward. These objects organize the global phase portrait; the stable and unstable manifolds of saddle points in particular act as *separatrices* dividing the phase plane into qualitatively different regions.

### 3.4 Centre Manifold Theory

When the equilibrium is non-hyperbolic — when <span>&#92;( Df(x^*) &#92;)</span> has eigenvalues with zero real parts in addition to the stable/unstable ones — we cannot immediately apply Hartman–Grobman. The dynamics on the centre subspace <span>&#92;( E^c &#92;)</span> are not determined by the linear terms alone; nonlinear terms are crucial. The **Centre Manifold Theorem** allows us to reduce the study of the full system to a lower-dimensional system on the centre manifold.

**Theorem 3.5 (Centre Manifold Theorem).** Let the origin be an equilibrium of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> with <span>&#92;( f &#92;in C^r &#92;)</span>, <span>&#92;( r &#92;geq 2 &#92;)</span>, and write the system in block form using the decomposition <span>&#92;( &#92;mathbb{R}^n = E^c &#92;oplus E^s &#92;oplus E^u &#92;)</span>:

<span>&#92;[  &#92;dot{u} = Cu + F(u, v, w), &#92;quad &#92;dot{v} = Sv + G(u, v, w), &#92;quad &#92;dot{w} = Uw + H(u, v, w), &#92;]</span>

where <span>&#92;( C &#92;)</span> has eigenvalues with zero real part, <span>&#92;( S &#92;)</span> has eigenvalues with negative real part, and <span>&#92;( U &#92;)</span> has eigenvalues with positive real part. Then there exists a **<span>&#92;( C^r &#92;)</span> centre manifold** <span>&#92;( W^c &#92;)</span> of the form

<span>&#92;[  W^c = &#92;{(u, v, w) : v = h_1(u), &#92; w = h_2(u), &#92; h_i(0) = 0, &#92; Dh_i(0) = 0&#92;} &#92;]</span>

for smooth functions <span>&#92;( h_i &#92;)</span> defined in a neighborhood of the origin. The centre manifold is locally invariant and tangent to <span>&#92;( E^c &#92;)</span> at the origin.

The reduced system on the centre manifold is <span>&#92;( &#92;dot{u} = Cu + F(u, h_1(u), h_2(u)) &#92;)</span>, which is a system on <span>&#92;( &#92;dim E^c &#92;)</span> dimensions. If the origin is stable for this reduced system, it is stable for the full system; if unstable on the centre manifold, it is unstable in the full system.

**Finding the Centre Manifold.** The functions <span>&#92;( h_i &#92;)</span> satisfy a quasilinear PDE called the **centre manifold equation**, obtained by differentiating <span>&#92;( v = h_1(u) &#92;)</span>:

<span>&#92;[  Dh_1(u)(Cu + F(u,h_1(u), h_2(u))) = Sh_1(u) + G(u, h_1(u), h_2(u)). &#92;]</span>

This is typically solved approximately by expanding in power series, matching terms order by order. At leading order, <span>&#92;( h_i(u) = O(&#92;|u&#92;|^2) &#92;)</span>, and higher-order terms can be computed iteratively.

### 3.5 Lyapunov Functions

Lyapunov's direct method provides stability information without requiring an explicit formula for solutions.

**Definition 3.6.** A function <span>&#92;( V: U &#92;to &#92;mathbb{R} &#92;)</span> defined on a neighborhood <span>&#92;( U &#92;)</span> of the origin is called a **Lyapunov function** for <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> if:
1. <span>&#92;( V(0) = 0 &#92;)</span> and <span>&#92;( V(x) > 0 &#92;)</span> for <span>&#92;( x &#92;neq 0 &#92;)</span> in <span>&#92;( U &#92;)</span> (positive definite).
2. The **orbital derivative** <span>&#92;( &#92;dot{V}(x) = &#92;nabla V(x) &#92;cdot f(x) &#92;leq 0 &#92;)</span> in <span>&#92;( U &#92;)</span> (non-increasing along trajectories).

**Theorem 3.7 (Lyapunov Stability Theorem).** If a Lyapunov function <span>&#92;( V &#92;)</span> exists with <span>&#92;( &#92;dot{V}(x) &#92;leq 0 &#92;)</span>, the origin is Lyapunov stable. If additionally <span>&#92;( &#92;dot{V}(x) < 0 &#92;)</span> for <span>&#92;( x &#92;neq 0 &#92;)</span> (strictly negative definite), the origin is asymptotically stable.

The intuition is elegant: <span>&#92;( V &#92;)</span> measures a generalized "energy" or "distance from the origin." If the energy is always non-increasing along orbits, the system cannot escape from level sets of <span>&#92;( V &#92;)</span>, ensuring stability.

**Example.** For the nonlinear system <span>&#92;( &#92;dot{x}_1 = -x_1 + x_2^2 &#92;)</span>, <span>&#92;( &#92;dot{x}_2 = -x_2 &#92;)</span>, take <span>&#92;( V(x) = x_1^2 + x_2^2 &#92;)</span>. Then

<span>&#92;[  &#92;dot{V} = 2x_1(-x_1 + x_2^2) + 2x_2(-x_2) = -2x_1^2 + 2x_1 x_2^2 - 2x_2^2. &#92;]</span>

Near the origin, the term <span>&#92;( 2x_1 x_2^2 &#92;)</span> is dominated by <span>&#92;( -2x_1^2 - 2x_2^2 &#92;)</span>, so <span>&#92;( &#92;dot{V} < 0 &#92;)</span> in a sufficiently small neighborhood, confirming asymptotic stability.

### 3.6 La Salle's Invariance Principle

Lyapunov's direct method requires <span>&#92;( &#92;dot{V} < 0 &#92;)</span> for asymptotic stability. La Salle's principle weakens this requirement by using the geometric properties of the flow.

**Theorem 3.8 (La Salle's Invariance Principle).** Let <span>&#92;( V: &#92;mathbb{R}^n &#92;to &#92;mathbb{R} &#92;)</span> be a <span>&#92;( C^1 &#92;)</span> function with <span>&#92;( &#92;dot{V}(x) &#92;leq 0 &#92;)</span> along trajectories of <span>&#92;( &#92;dot{x} = f(x) &#92;)</span>. Let <span>&#92;( &#92;Omega_c = &#92;{x: V(x) &#92;leq c&#92;} &#92;)</span> be a compact positively invariant set. Define <span>&#92;( E = &#92;{x &#92;in &#92;Omega_c : &#92;dot{V}(x) = 0&#92;} &#92;)</span> and let <span>&#92;( M &#92;)</span> be the largest invariant set contained in <span>&#92;( E &#92;)</span>. Then every solution starting in <span>&#92;( &#92;Omega_c &#92;)</span> converges to <span>&#92;( M &#92;)</span> as <span>&#92;( t &#92;to &#92;infty &#92;)</span>.

La Salle's principle is particularly useful when <span>&#92;( &#92;dot{V} = 0 &#92;)</span> on a set larger than just the equilibrium. For instance, in the mass-spring system with linear damping, <span>&#92;( &#92;dot{V} = 0 &#92;)</span> only when the velocity is zero; but checking that the only invariant set in <span>&#92;( E &#92;)</span> is the origin confirms asymptotic stability even when <span>&#92;( &#92;dot{V} &#92;)</span> is not strictly negative definite everywhere.

### 3.7 Introduction to Bifurcations

A **bifurcation** occurs when a qualitative change in the phase portrait takes place as a parameter passes through a critical value. We introduce here the three primary codimension-one bifurcations for equilibria.

Consider a one-parameter family <span>&#92;( &#92;dot{x} = f(x, &#92;mu) &#92;)</span> where <span>&#92;( &#92;mu &#92;in &#92;mathbb{R} &#92;)</span> is a parameter, and suppose the origin is an equilibrium with one zero eigenvalue of <span>&#92;( D_x f(0, 0) &#92;)</span>.

**Saddle-Node Bifurcation.** This is the generic way in which two equilibria (one stable, one unstable) collide and annihilate, or are created. The normal form on the centre manifold is

<span>&#92;[  &#92;dot{x} = &#92;mu - x^2. &#92;]</span>

For <span>&#92;( &#92;mu < 0 &#92;)</span>, no equilibria exist; at <span>&#92;( &#92;mu = 0 &#92;)</span>, a semi-stable equilibrium appears at the origin; for <span>&#92;( &#92;mu > 0 &#92;)</span>, two equilibria exist at <span>&#92;( x = &#92;pm&#92;sqrt{&#92;mu} &#92;)</span> (one stable, one unstable).

**Transcritical Bifurcation.** Two equilibria exist for all parameter values near <span>&#92;( &#92;mu = 0 &#92;)</span> but exchange stability as <span>&#92;( &#92;mu &#92;)</span> passes through zero. The normal form is

<span>&#92;[  &#92;dot{x} = &#92;mu x - x^2 = x(&#92;mu - x). &#92;]</span>

For any <span>&#92;( &#92;mu &#92;)</span>, there are equilibria at <span>&#92;( x = 0 &#92;)</span> and <span>&#92;( x = &#92;mu &#92;)</span>. When <span>&#92;( &#92;mu < 0 &#92;)</span>, <span>&#92;( x = 0 &#92;)</span> is stable and <span>&#92;( x = &#92;mu &#92;)</span> is unstable; when <span>&#92;( &#92;mu > 0 &#92;)</span>, the stabilities exchange.

**Pitchfork Bifurcation.** A symmetric bifurcation where one equilibrium splits into three. The normal form (supercritical) is

<span>&#92;[  &#92;dot{x} = &#92;mu x - x^3. &#92;]</span>

For <span>&#92;( &#92;mu &#92;leq 0 &#92;)</span>, only <span>&#92;( x = 0 &#92;)</span> is an equilibrium (stable). For <span>&#92;( &#92;mu > 0 &#92;)</span>, the origin becomes unstable and two new stable equilibria appear at <span>&#92;( x = &#92;pm&#92;sqrt{&#92;mu} &#92;)</span>. The subcritical pitchfork has the form <span>&#92;( &#92;dot{x} = &#92;mu x + x^3 &#92;)</span>, where for <span>&#92;( &#92;mu < 0 &#92;)</span> the origin is stable with two flanking unstable equilibria at <span>&#92;( x = &#92;pm&#92;sqrt{-&#92;mu} &#92;)</span>, and for <span>&#92;( &#92;mu > 0 &#92;)</span> only the unstable origin remains.

---

## Chapter 4: Nonlinear Global Theory and Periodic Solutions

### 4.1 Periodic Solutions

While local theory studies behavior near equilibria, global theory concerns the long-time behavior for general initial conditions. A particularly important class of behavior consists of **periodic solutions**.

**Definition 4.1.** A solution <span>&#92;( x(t) &#92;)</span> is **periodic** with period <span>&#92;( T > 0 &#92;)</span> if <span>&#92;( x(t + T) = x(t) &#92;)</span> for all <span>&#92;( t &#92;)</span>. The smallest such <span>&#92;( T &#92;)</span> is the **minimal period**. The orbit of a periodic solution is a closed curve in phase space called a **closed orbit** or **cycle**.

Periodic solutions are especially important in two-dimensional systems, where they are the only type of recurrent behavior besides equilibria (by the Poincaré–Bendixson theorem, treated below).

### 4.2 Floquet Theory

When a periodic solution exists, one can study the stability of *nearby* solutions using Floquet theory. Consider a system with a known periodic solution <span>&#92;( &#92;gamma(t) &#92;)</span> of period <span>&#92;( T &#92;)</span>. Write <span>&#92;( x(t) = &#92;gamma(t) + u(t) &#92;)</span> and linearize to obtain the **variational equation**:

<span>&#92;[  &#92;dot{u} = Df(&#92;gamma(t)) u, &#92;]</span>

a linear system with <span>&#92;( T &#92;)</span>-periodic coefficients.

**Theorem 4.2 (Floquet).** Let <span>&#92;( &#92;Phi(t) &#92;)</span> be the **fundamental matrix solution** of <span>&#92;( &#92;dot{u} = A(t) u &#92;)</span> with <span>&#92;( &#92;Phi(0) = I &#92;)</span>, where <span>&#92;( A(t) &#92;)</span> is <span>&#92;( T &#92;)</span>-periodic. Then

<span>&#92;[  &#92;Phi(t + T) = &#92;Phi(t) M, &#92;]</span>

where <span>&#92;( M = &#92;Phi(T) &#92;)</span> is the **monodromy matrix**. There exists a (possibly complex) matrix <span>&#92;( B &#92;)</span> with <span>&#92;( e^{BT} = M &#92;)</span> and a <span>&#92;( T &#92;)</span>-periodic matrix function <span>&#92;( P(t) &#92;)</span> such that

<span>&#92;[  &#92;Phi(t) = P(t) e^{Bt}. &#92;]</span>

The eigenvalues of the monodromy matrix <span>&#92;( M &#92;)</span> are called **Floquet multipliers** (or *characteristic multipliers*). Their logarithms divided by <span>&#92;( T &#92;)</span> are the **Floquet exponents** (or *characteristic exponents*).

**Stability via Floquet multipliers.** A periodic solution is **asymptotically stable** (orbitally) if all Floquet multipliers except one lie strictly inside the unit circle <span>&#92;( |&#92;mu| < 1 &#92;)</span>. (One multiplier is always exactly 1, corresponding to perturbations along the periodic orbit itself.) It is unstable if any multiplier has <span>&#92;( |&#92;mu| > 1 &#92;)</span>.

**Proposition 4.3 (Product Formula for Floquet Multipliers).** For the <span>&#92;( n &#92;times n &#92;)</span> variational equation, the product of all Floquet multipliers is

<span>&#92;[  &#92;prod_{i=1}^n &#92;mu_i = &#92;det(&#92;Phi(T)) = &#92;exp&#92;left(&#92;int_0^T &#92;text{tr}(Df(&#92;gamma(t))) &#92;, dt&#92;right). &#92;]</span>

This follows from Liouville's formula. For a 2D system <span>&#92;( &#92;dot{x} = f(x) &#92;)</span>, one multiplier is always <span>&#92;( &#92;mu_1 = 1 &#92;)</span>, so the other is

<span>&#92;[  &#92;mu_2 = &#92;exp&#92;left(&#92;int_0^T &#92;text{tr}(Df(&#92;gamma(t))) &#92;, dt&#92;right) = &#92;exp&#92;left(&#92;int_0^T (&#92;partial_{x_1} f_1 + &#92;partial_{x_2} f_2) &#92;, dt&#92;right). &#92;]</span>

The sign of this exponent determines the orbital stability: <span>&#92;( |&#92;mu_2| < 1 &#92;)</span> (stable) if and only if <span>&#92;( &#92;int_0^T &#92;text{div}(f) &#92;, dt < 0 &#92;)</span>.

### 4.3 Poincaré Maps and Limit Cycles

An important tool for studying periodic solutions is the **Poincaré map** (or *first return map*). Given a periodic orbit <span>&#92;( &#92;Gamma &#92;)</span>, choose a codimension-one **section** <span>&#92;( &#92;Sigma &#92;)</span> transverse to <span>&#92;( &#92;Gamma &#92;)</span>. For points <span>&#92;( x &#92;in &#92;Sigma &#92;)</span> near <span>&#92;( &#92;Gamma &#92;cap &#92;Sigma &#92;)</span>, the forward orbit returns to <span>&#92;( &#92;Sigma &#92;)</span> at a point <span>&#92;( P(x) &#92;)</span>. The map <span>&#92;( P: &#92;Sigma &#92;to &#92;Sigma &#92;)</span> is the **Poincaré map**.

Fixed points of <span>&#92;( P &#92;)</span> correspond to periodic orbits of the flow. The stability of the periodic orbit is determined by the eigenvalues of <span>&#92;( DP(x^*) &#92;)</span> at the fixed point — these are precisely the non-trivial Floquet multipliers.

**Definition 4.4 (Limit Cycle).** An **isolated closed orbit** — a periodic orbit that has no other closed orbits in a neighborhood — is called a **limit cycle**. A limit cycle is **stable** (or attracting) if nearby trajectories spiral toward it as <span>&#92;( t &#92;to +&#92;infty &#92;)</span>, **unstable** (or repelling) if they spiral away, and **semi-stable** if attracted from one side and repelled from the other.

Limit cycles are a purely nonlinear phenomenon; linear systems cannot have isolated closed orbits (in a linear center, every closed orbit is part of a family parameterized by initial conditions, not isolated).

### 4.4 The Poincaré–Bendixson Theorem

In the plane, the possible long-term behaviors of trajectories are highly restricted.

**Theorem 4.5 (Poincaré–Bendixson).** Let <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> be a <span>&#92;( C^1 &#92;)</span> system in <span>&#92;( &#92;mathbb{R}^2 &#92;)</span>. If a trajectory <span>&#92;( x(t) &#92;)</span> remains in a compact region <span>&#92;( D &#92;)</span> for all <span>&#92;( t &#92;geq 0 &#92;)</span>, and <span>&#92;( D &#92;)</span> contains only finitely many equilibria, then the **<span>&#92;( &#92;omega &#92;)</span>-limit set** <span>&#92;( &#92;omega(x) &#92;)</span> is one of:
1. An equilibrium point,
2. A periodic orbit,
3. A **homoclinic** or **heteroclinic cycle** — a collection of equilibria connected by orbits.

Here the **<span>&#92;( &#92;omega &#92;)</span>-limit set** of a trajectory is <span>&#92;( &#92;omega(x) = &#92;{y : &#92;exists t_n &#92;to &#92;infty, &#92;phi_{t_n}(x) &#92;to y&#92;} &#92;)</span>.

**Proof sketch.** The key insight uses the *Jordan curve theorem*: any closed curve in <span>&#92;( &#92;mathbb{R}^2 &#92;)</span> divides the plane into an interior and exterior. If the <span>&#92;( &#92;omega &#92;)</span>-limit set contains a point that is not an equilibrium, any trajectory in the <span>&#92;( &#92;omega &#92;)</span>-limit set that starts at such a point must have its own <span>&#92;( &#92;omega &#92;)</span>-limit set again within <span>&#92;( D &#92;)</span>. Using the non-crossing property of orbits and the topology of the plane, one shows the only possibilities are closed orbits or connections between equilibria.

The Poincaré–Bendixson theorem is a powerful tool for proving the existence of periodic orbits: if one can construct an **annular trapping region** — a compact set bounded by two curves such that the vector field points inward on both boundaries — and this region contains no equilibria, then it must contain a periodic orbit.

### 4.5 Dulac's Criterion

Dulac's criterion provides a sufficient condition for the *absence* of closed orbits.

**Theorem 4.6 (Dulac's Criterion).** Let <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> be a <span>&#92;( C^1 &#92;)</span> system on a simply connected region <span>&#92;( D &#92;subseteq &#92;mathbb{R}^2 &#92;)</span>. If there exists a <span>&#92;( C^1 &#92;)</span> function <span>&#92;( B(x) &#92;)</span> (a **Dulac function**) such that

<span>&#92;[  &#92;text{div}(B f) = &#92;frac{&#92;partial (B f_1)}{&#92;partial x_1} + &#92;frac{&#92;partial (B f_2)}{&#92;partial x_2} &#92;]</span>

is of one sign (does not change sign and is not identically zero) in <span>&#92;( D &#92;)</span>, then <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> has no closed orbits in <span>&#92;( D &#92;)</span>.

**Proof.** Suppose for contradiction that <span>&#92;( &#92;Gamma &#92;)</span> is a closed orbit in <span>&#92;( D &#92;)</span>, enclosing a region <span>&#92;( R &#92;)</span>. By Green's theorem (divergence theorem in 2D),

<span>&#92;[  &#92;iint_R &#92;text{div}(Bf) &#92;, dA = &#92;oint_{&#92;Gamma} B f &#92;cdot n &#92;, ds. &#92;]</span>

But since <span>&#92;( &#92;Gamma &#92;)</span> is an orbit of <span>&#92;( f &#92;)</span>, the vector <span>&#92;( f &#92;)</span> is tangent to <span>&#92;( &#92;Gamma &#92;)</span>, so <span>&#92;( f &#92;cdot n = 0 &#92;)</span> on <span>&#92;( &#92;Gamma &#92;)</span>. Thus the right side is zero. But the left side is nonzero since <span>&#92;( &#92;text{div}(Bf) &#92;)</span> has one sign. Contradiction.

**Special case: Bendixson's criterion.** Taking <span>&#92;( B &#92;equiv 1 &#92;)</span>, we get: if <span>&#92;( &#92;text{div}(f) = &#92;partial f_1/&#92;partial x_1 + &#92;partial f_2/&#92;partial x_2 &#92;)</span> has one sign on a simply connected region <span>&#92;( D &#92;)</span>, there are no closed orbits in <span>&#92;( D &#92;)</span>.

### 4.6 Liénard Systems and the Van der Pol Equation

A broad class of oscillator models fits the **Liénard equation**:

<span>&#92;[  &#92;ddot{x} + f(x) &#92;dot{x} + g(x) = 0, &#92;]</span>

or equivalently in system form with <span>&#92;( y = &#92;dot{x} &#92;)</span>:

<span>&#92;[  &#92;dot{x} = y, &#92;qquad &#92;dot{y} = -f(x)y - g(x). &#92;]</span>

The **Van der Pol equation** is the canonical example, with <span>&#92;( f(x) = &#92;mu(x^2 - 1) &#92;)</span> and <span>&#92;( g(x) = x &#92;)</span>:

<span>&#92;[  &#92;ddot{x} + &#92;mu(x^2 - 1)&#92;dot{x} + x = 0. &#92;]</span>

For <span>&#92;( &#92;mu > 0 &#92;)</span>, the damping is negative for <span>&#92;( |x| < 1 &#92;)</span> (energy input) and positive for <span>&#92;( |x| > 1 &#92;)</span> (energy dissipation). This self-sustaining oscillation is responsible for the existence and uniqueness of a stable limit cycle for any <span>&#92;( &#92;mu > 0 &#92;)</span>.

**Theorem 4.7 (Liénard, Uniqueness of Limit Cycle).** For the Van der Pol equation with <span>&#92;( &#92;mu > 0 &#92;)</span>, there exists a unique stable limit cycle, and all non-equilibrium orbits tend to this cycle as <span>&#92;( t &#92;to &#92;infty &#92;)</span>.

More generally, for a Liénard system, suppose:
1. <span>&#92;( g &#92;)</span> is odd: <span>&#92;( g(-x) = -g(x) &#92;)</span>, and <span>&#92;( g(x) > 0 &#92;)</span> for <span>&#92;( x > 0 &#92;)</span>.
2. <span>&#92;( f &#92;)</span> is even: <span>&#92;( f(-x) = f(x) &#92;)</span>.
3. <span>&#92;( F(x) = &#92;int_0^x f(s) &#92;, ds &#92;)</span> has exactly one positive zero at <span>&#92;( x = a &#92;)</span>, is negative for <span>&#92;( 0 < x < a &#92;)</span>, and tends to <span>&#92;( +&#92;infty &#92;)</span> for <span>&#92;( x &#92;to &#92;infty &#92;)</span>.

**Theorem 4.8 (Liénard's Theorem).** Under the above conditions, the Liénard system has exactly one limit cycle, and it is stable.

### 4.7 Hamiltonian Systems

**Definition 4.9.** A **Hamiltonian system** on <span>&#92;( &#92;mathbb{R}^{2n} &#92;)</span> with coordinates <span>&#92;( (q, p) &#92;in &#92;mathbb{R}^n &#92;times &#92;mathbb{R}^n &#92;)</span> is defined by a smooth function <span>&#92;( H(q, p) &#92;)</span> (the **Hamiltonian** or *total energy*) via

<span>&#92;[  &#92;dot{q}_i = &#92;frac{&#92;partial H}{&#92;partial p_i}, &#92;qquad &#92;dot{p}_i = -&#92;frac{&#92;partial H}{&#92;partial q_i}, &#92;quad i = 1, &#92;ldots, n. &#92;]</span>

The Hamiltonian is a **first integral** (conserved quantity): <span>&#92;( &#92;dot{H} = &#92;sum_i (&#92;partial H/&#92;partial q_i) &#92;dot{q}_i + (&#92;partial H/&#92;partial p_i) &#92;dot{p}_i = 0 &#92;)</span> along any solution. Thus every trajectory lies on a level set <span>&#92;( H = &#92;text{const} &#92;)</span>.

**Proposition 4.10 (No Asymptotically Stable Equilibria).** A Hamiltonian system has no asymptotically stable equilibria. More strongly, it is **volume-preserving**: the divergence of the vector field is

<span>&#92;[  &#92;text{div}(f) = &#92;sum_i &#92;left(&#92;frac{&#92;partial^2 H}{&#92;partial q_i &#92;partial p_i} - &#92;frac{&#92;partial^2 H}{&#92;partial p_i &#92;partial q_i}&#92;right) = 0. &#92;]</span>

By Liouville's theorem, the flow <span>&#92;( &#92;phi_t &#92;)</span> preserves phase-space volume. This rules out attracting limit cycles and attracting equilibria alike.

**Corollary 4.11 (No Limit Cycles).** A Hamiltonian system in <span>&#92;( &#92;mathbb{R}^2 &#92;)</span> has no limit cycles. Any closed orbit is a member of a continuous family parameterized by the energy level.

**Proposition 4.12 (Centers near Stable Equilibria).** In a 2D Hamiltonian system, if <span>&#92;( (q^*, p^*) &#92;)</span> is an equilibrium and the Hessian of <span>&#92;( H &#92;)</span> at <span>&#92;( (q^*, p^*) &#92;)</span> is positive definite (a local energy minimum), then the equilibrium is a **center** — it is surrounded by closed orbits.

### 4.8 Gradient Systems

**Definition 4.13.** A system <span>&#92;( &#92;dot{x} = f(x) &#92;)</span> is a **gradient system** if there exists a smooth function <span>&#92;( V: &#92;mathbb{R}^n &#92;to &#92;mathbb{R} &#92;)</span> such that <span>&#92;( f(x) = -&#92;nabla V(x) &#92;)</span>.

Gradient systems are in many ways opposite to Hamiltonian systems: they dissipate energy and have no closed orbits.

**Proposition 4.14.** A gradient system has no closed orbits.

**Proof.** Suppose <span>&#92;( x(t) &#92;)</span> is a periodic solution with period <span>&#92;( T &#92;)</span>. Then

<span>&#92;[  0 = V(x(T)) - V(x(0)) = &#92;int_0^T &#92;frac{d}{dt} V(x(t)) &#92;, dt = &#92;int_0^T &#92;nabla V(x) &#92;cdot &#92;dot{x} &#92;, dt = -&#92;int_0^T &#92;|&#92;nabla V(x)&#92;|^2 &#92;, dt. &#92;]</span>

This forces <span>&#92;( &#92;nabla V = 0 &#92;)</span> along the entire orbit, so every point on the orbit is an equilibrium. But a periodic orbit consists of non-equilibrium points, contradiction.

**Proposition 4.15.** Every <span>&#92;( &#92;omega &#92;)</span>-limit set of a gradient system consists entirely of equilibria. Generically (when all equilibria are isolated), every bounded trajectory converges to an equilibrium.

This is because <span>&#92;( &#92;dot{V} = -&#92;|&#92;nabla V&#92;|^2 &#92;leq 0 &#92;)</span>, so <span>&#92;( V &#92;)</span> decreases along orbits. The <span>&#92;( &#92;omega &#92;)</span>-limit set lies on the set where <span>&#92;( &#92;dot{V} = 0 &#92;)</span>, i.e., where <span>&#92;( &#92;nabla V = 0 &#92;)</span> — precisely the equilibria.

### 4.9 Homoclinic and Heteroclinic Orbits

**Definition 4.16.** A **homoclinic orbit** is an orbit whose <span>&#92;( &#92;alpha &#92;)</span>-limit set and <span>&#92;( &#92;omega &#92;)</span>-limit set are both the same equilibrium — it connects an equilibrium to itself. A **heteroclinic orbit** connects two distinct equilibria, with one as the <span>&#92;( &#92;alpha &#92;)</span>-limit and the other as the <span>&#92;( &#92;omega &#92;)</span>-limit.

A **homoclinic cycle** (or *saddle connection*) consists of a homoclinic orbit together with its equilibrium. In the plane, such connections form the third possibility in the Poincaré–Bendixson theorem. They can appear at bifurcation points, and their presence or destruction plays a role in creating or destroying limit cycles.

### 4.10 Structural Stability

A dynamical system is **structurally stable** if its qualitative behavior is preserved under small perturbations of the vector field. More precisely:

**Definition 4.17.** A <span>&#92;( C^1 &#92;)</span> vector field <span>&#92;( f &#92;)</span> on a compact region <span>&#92;( D &#92;)</span> is **structurally stable** if for every <span>&#92;( &#92;epsilon > 0 &#92;)</span>, there exists <span>&#92;( &#92;delta > 0 &#92;)</span> such that any vector field <span>&#92;( g &#92;)</span> with <span>&#92;( &#92;|f - g&#92;|_{C^1} < &#92;delta &#92;)</span> is topologically equivalent to <span>&#92;( f &#92;)</span> on <span>&#92;( D &#92;)</span>.

**Theorem 4.18 (Peixoto, 1962).** A <span>&#92;( C^1 &#92;)</span> vector field on a compact 2-manifold is structurally stable if and only if:
1. All equilibria are hyperbolic.
2. All periodic orbits are hyperbolic (non-unit Floquet multipliers other than the trivial one).
3. There are no homoclinic or heteroclinic connections.

Structurally unstable systems — those with non-hyperbolic equilibria, non-hyperbolic periodic orbits, or saddle connections — are the "bifurcation points" in the space of all vector fields. They represent the codimension-one boundaries between structurally stable regions in function space.

### 4.11 Bifurcation Theory

We return to bifurcations, now in the global context. A **bifurcation** of a parametrized family <span>&#92;( &#92;dot{x} = f_&#92;mu(x) &#92;)</span> occurs at a parameter value <span>&#92;( &#92;mu_0 &#92;)</span> where the system is not structurally stable. We have already encountered codimension-one equilibrium bifurcations (saddle-node, transcritical, pitchfork). We now discuss bifurcations involving periodic orbits.

**Saddle-Node Bifurcation of Periodic Orbits.** Two periodic orbits (one stable, one unstable) collide and disappear, analogous to the equilibrium case. The Poincaré map's fixed point undergoes a fold bifurcation.

**Period-Doubling Bifurcation.** A Floquet multiplier passes through <span>&#92;( -1 &#92;)</span>. The original periodic orbit loses stability, and a new orbit of twice the period is born.

**Torus Bifurcation (Neimark–Sacker).** Two complex conjugate Floquet multipliers cross the unit circle. A periodic orbit loses stability and is replaced by an invariant torus (quasi-periodic or periodic motion on the torus).

### 4.12 Hopf Bifurcation

The **Hopf bifurcation** is the most important mechanism by which equilibria give birth to periodic orbits. It occurs when, as a parameter <span>&#92;( &#92;mu &#92;)</span> varies, a pair of complex conjugate eigenvalues of the linearization crosses the imaginary axis.

**Setup.** Consider <span>&#92;( &#92;dot{x} = f(x, &#92;mu) &#92;)</span> in <span>&#92;( &#92;mathbb{R}^2 &#92;)</span> (or in the plane of the centre manifold for higher-dimensional systems). Suppose the origin is an equilibrium for all <span>&#92;( &#92;mu &#92;)</span>, and the linearization <span>&#92;( A(&#92;mu) = D_x f(0, &#92;mu) &#92;)</span> has complex conjugate eigenvalues

<span>&#92;[  &#92;lambda(&#92;mu) = &#92;alpha(&#92;mu) &#92;pm i &#92;beta(&#92;mu) &#92;]</span>

with <span>&#92;( &#92;alpha(0) = 0 &#92;)</span>, <span>&#92;( &#92;beta(0) = &#92;beta_0 &#92;neq 0 &#92;)</span>, and the **transversality condition** <span>&#92;( &#92;alpha'(0) = d&#92;alpha/d&#92;mu|_{&#92;mu=0} &#92;neq 0 &#92;)</span>.

**Example (polar coordinates).** The canonical Hopf bifurcation is:

<span>&#92;[  &#92;dot{r} = &#92;mu r - r^3, &#92;qquad &#92;dot{&#92;theta} = 1. &#92;]</span>

In Cartesian coordinates, this is <span>&#92;( &#92;dot{x}_1 = &#92;mu x_1 - x_2 - x_1(x_1^2 + x_2^2) &#92;)</span>, <span>&#92;( &#92;dot{x}_2 = x_1 + &#92;mu x_2 - x_2(x_1^2 + x_2^2) &#92;)</span>. The radial equation decouples: for <span>&#92;( &#92;mu &#92;leq 0 &#92;)</span>, <span>&#92;( r = 0 &#92;)</span> is the only non-negative equilibrium of <span>&#92;( &#92;dot{r} = r(&#92;mu - r^2) &#92;)</span> and it is stable. For <span>&#92;( &#92;mu > 0 &#92;)</span>, a new equilibrium appears at <span>&#92;( r^* = &#92;sqrt{&#92;mu} &#92;)</span>, corresponding to a periodic orbit of the original system with radius <span>&#92;( &#92;sqrt{&#92;mu} &#92;)</span> and frequency <span>&#92;( 1 &#92;)</span>.

**Theorem 4.19 (Poincaré–Andronov–Hopf).** Under the above transversality condition, there exists a family of periodic orbits bifurcating from the origin at <span>&#92;( &#92;mu = 0 &#92;)</span>. Define the **first Lyapunov coefficient** <span>&#92;( &#92;sigma &#92;)</span> via the Taylor expansion of <span>&#92;( f &#92;)</span> at the origin:

<span>&#92;[  &#92;sigma = &#92;frac{1}{16}&#92;left[ f^1_{xxx} + f^1_{xyy} + f^2_{xxy} + f^2_{yyy} &#92;right] + &#92;frac{1}{16&#92;beta_0}&#92;left[ f^1_{xy}(f^1_{xx} + f^1_{yy}) - f^2_{xy}(f^2_{xx} + f^2_{yy}) - f^1_{xx}f^2_{xx} + f^1_{yy}f^2_{yy} &#92;right], &#92;]</span>

where superscripts denote components and subscripts denote partial derivatives evaluated at the origin.

- **Supercritical Hopf bifurcation** (<span>&#92;( &#92;sigma < 0 &#92;)</span>): For <span>&#92;( &#92;mu < 0 &#92;)</span>, the origin is a stable spiral. At <span>&#92;( &#92;mu = 0 &#92;)</span> it is a stable (weakly) nonlinear center. For <span>&#92;( &#92;mu > 0 &#92;)</span>, a **stable** limit cycle of radius <span>&#92;( O(&#92;sqrt{&#92;mu}) &#92;)</span> is born, and the origin becomes an unstable spiral.
- **Subcritical Hopf bifurcation** (<span>&#92;( &#92;sigma > 0 &#92;)</span>): For <span>&#92;( &#92;mu < 0 &#92;)</span>, an **unstable** limit cycle surrounds the stable equilibrium. At <span>&#92;( &#92;mu = 0 &#92;)</span>, the cycle collapses onto the origin. For <span>&#92;( &#92;mu > 0 &#92;)</span>, the origin is unstable with no limit cycle nearby — trajectories may escape to large amplitude.

The Hopf bifurcation is fundamentally important in applications: it is the generic mechanism by which oscillations arise spontaneously in physical, biological, and engineering systems as a parameter (such as a feedback gain or flow rate) is varied.

---

## Appendix: Key Theorems Reference

The table below collects the principal results of the course.

| Theorem | Statement | Context |
|---------|-----------|---------|
| Picard–Lindelöf | Local existence and uniqueness for locally Lipschitz <span>&#92;( f &#92;)</span> | Ch. 1 |
| Hartman–Grobman | Nonlinear flow ≈ linearized flow near hyperbolic equilibria | Ch. 3 |
| Stable Manifold | <span>&#92;( W^s, W^u &#92;)</span> are <span>&#92;( C^r &#92;)</span> manifolds tangent to <span>&#92;( E^s, E^u &#92;)</span> | Ch. 3 |
| Centre Manifold | Reduce dynamics to the centre subspace | Ch. 3 |
| Lyapunov | <span>&#92;( V > 0, &#92;dot{V} &#92;leq 0 &#92;Rightarrow &#92;)</span> stable | Ch. 3 |
| La Salle | Trajectories converge to largest invariant set where <span>&#92;( &#92;dot{V} = 0 &#92;)</span> | Ch. 3 |
| Floquet | Periodic linear systems via monodromy matrix | Ch. 4 |
| Floquet (product) | <span>&#92;( &#92;prod &#92;mu_i = \exp&#92;int_0^T &#92;text{tr}(Df(&#92;gamma)) &#92;, dt &#92;)</span> | Ch. 4 |
| Poincaré–Bendixson | <span>&#92;( &#92;omega &#92;)</span>-limit sets in <span>&#92;( &#92;mathbb{R}^2 &#92;)</span>: equilibrium, periodic orbit, or connection | Ch. 4 |
| Dulac's Criterion | <span>&#92;( &#92;text{div}(Bf) &#92;)</span> of one sign <span>&#92;( &#92;Rightarrow &#92;)</span> no closed orbits | Ch. 4 |
| Liénard | Conditions for unique stable limit cycle | Ch. 4 |
| Hopf Bifurcation | Eigenvalues cross imaginary axis <span>&#92;( &#92;Rightarrow &#92;)</span> limit cycle born | Ch. 4 |
| No Cycles (Hamiltonian) | Volume-preserving <span>&#92;( &#92;Rightarrow &#92;)</span> no asymptotically stable sets | Ch. 4 |
| No Cycles (Gradient) | <span>&#92;( f = -&#92;nabla V &#92;Rightarrow &#92;)</span> no closed orbits | Ch. 4 |
| Peixoto | Characterization of structurally stable 2D flows | Ch. 4 |
