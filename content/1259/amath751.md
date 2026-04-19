---
title: "AMATH 751: Advanced Ordinary Differential Equations"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly accessible references:

- Perko, L. *Differential Equations and Dynamical Systems*. Springer, 3rd ed., 2001.
- Hirsch, M. W., Smale, S., and Devaney, R. L. *Differential Equations, Dynamical Systems, and an Introduction to Chaos*. Academic Press, 3rd ed., 2013.
- Chicone, C. *Ordinary Differential Equations with Applications*. Springer, 2nd ed., 2006.
- Robinson, C. *Dynamical Systems: Stability, Symbolic Dynamics, and Chaos*. CRC Press, 2nd ed., 1998.
- Strogatz, S. H. *Nonlinear Dynamics and Chaos*. Westview Press, 2nd ed., 2015.
- MIT OCW 18.353 Nonlinear Dynamics lecture notes (publicly available at ocw.mit.edu).

---

# Chapter 1: Existence, Uniqueness, and Continuous Dependence

## The Initial Value Problem and Its Setting

The central object of study in ordinary differential equations is the initial value problem (IVP): given a vector field \( f : U \subseteq \mathbb{R} \times \mathbb{R}^n \to \mathbb{R}^n \) defined on an open set \( U \), we seek a differentiable curve \( x : I \to \mathbb{R}^n \), defined on some interval \( I \ni t_0 \), satisfying

\[
\dot{x} = f(t, x), \qquad x(t_0) = x_0,
\]

where \( (t_0, x_0) \in U \). The question of whether such a curve exists, whether it is unique, and how it depends on the data \( (t_0, x_0) \) is the foundational question of the theory.

A solution is a \( C^1 \) function \( x : I \to \mathbb{R}^n \) on an open interval \( I \ni t_0 \) such that \( (t, x(t)) \in U \) for all \( t \in I \) and the differential equation is satisfied pointwise. When \( f \) is only continuous (not Lipschitz), existence can be guaranteed by Peano's theorem, but uniqueness may fail. The classical example \( \dot{x} = x^{2/3} \), \( x(0) = 0 \) has infinitely many solutions, illustrating that continuity alone is insufficient for uniqueness.

## The Picard–Lindelöf Theorem

The remedy is a **Lipschitz condition**. We say \( f \) is locally Lipschitz in \( x \) on \( U \) if for every compact \( K \subset U \) there exists a constant \( L_K > 0 \) such that

\[
\| f(t, x) - f(t, y) \| \leq L_K \| x - y \|
\]

for all \( (t, x), (t, y) \in K \). If \( f \) is \( C^1 \), the mean value theorem implies local Lipschitz continuity. The fundamental existence and uniqueness result is:

<div class="theorem">
<strong>Theorem (Picard–Lindelöf).</strong> Let \( f : U \to \mathbb{R}^n \) be continuous and locally Lipschitz in \( x \) on the open set \( U \subseteq \mathbb{R} \times \mathbb{R}^n \). For any \( (t_0, x_0) \in U \), there exists \( \delta > 0 \) and a unique solution \( x : (t_0 - \delta, t_0 + \delta) \to \mathbb{R}^n \) to the IVP \( \dot{x} = f(t,x) \), \( x(t_0) = x_0 \).
</div>

<div class="proof">
<strong>Proof.</strong> The proof proceeds via the Banach fixed-point theorem applied to the integral operator on a suitable complete metric space. Choose \( a, b > 0 \) so that the closed rectangle \( R = \{ (t,x) : |t - t_0| \leq a,\ \|x - x_0\| \leq b \} \subset U \). Let \( M = \sup_{R} \|f\| \) and \( L \) be the Lipschitz constant of \( f \) in \( x \) on \( R \). Set \( \delta = \min\!\left(a, \frac{b}{M}\right) \).

Define the Picard operator \( \mathcal{T} \) on the space

\[
\mathcal{X} = \left\{ \phi \in C\!\left([t_0 - \delta, t_0 + \delta], \mathbb{R}^n\right) : \|\phi(t) - x_0\| \leq b\ \forall t \right\}
\]

by

\[
(\mathcal{T}\phi)(t) = x_0 + \int_{t_0}^{t} f(s, \phi(s))\, ds.
\]

Equipped with the supremum norm, \( \mathcal{X} \) is a closed subset of the Banach space \( C([t_0 - \delta, t_0 + \delta], \mathbb{R}^n) \), hence itself a complete metric space. We verify two things.

<em>Self-mapping:</em> For \( \phi \in \mathcal{X} \) and \( |t - t_0| \leq \delta \),

\[
\|(\mathcal{T}\phi)(t) - x_0\| \leq \int_{t_0}^{t} \|f(s, \phi(s))\|\, ds \leq M \cdot \delta \leq M \cdot \frac{b}{M} = b.
\]

Hence \( \mathcal{T} : \mathcal{X} \to \mathcal{X} \).

<em>Contraction:</em> For \( \phi, \psi \in \mathcal{X} \),

\[
\|(\mathcal{T}\phi)(t) - (\mathcal{T}\psi)(t)\| \leq \int_{t_0}^{t} L \|\phi(s) - \psi(s)\|\, ds \leq L \delta \|\phi - \psi\|_\infty.
\]

Choosing \( \delta \) smaller if necessary so that \( L\delta < 1 \), say \( \delta < \min\!\left(a, \frac{b}{M}, \frac{1}{2L}\right) \), the operator \( \mathcal{T} \) is a contraction on the complete metric space \( \mathcal{X} \). By the Banach fixed-point theorem, \( \mathcal{T} \) has a unique fixed point \( x^* \in \mathcal{X} \), which satisfies

\[
x^*(t) = x_0 + \int_{t_0}^{t} f(s, x^*(s))\, ds.
\]

Differentiating gives \( \dot{x}^*(t) = f(t, x^*(t)) \) and \( x^*(t_0) = x_0 \). Uniqueness among all solutions on \( [t_0 - \delta, t_0 + \delta] \) follows from the contractive estimate: any two solutions \( x, y \) satisfy \( \|x - y\|_\infty \leq L\delta \|x - y\|_\infty \), and since \( L\delta < 1 \), we conclude \( x = y \). <strong>QED</strong>
</div>

The Picard iterates \( \phi_0 = x_0 \), \( \phi_{k+1} = \mathcal{T}\phi_k \) converge geometrically: \( \|\phi_{k+1} - \phi_k\|_\infty \leq (L\delta)^k \|\phi_1 - \phi_0\|_\infty \). This constructive proof simultaneously yields an algorithm for approximating solutions.

## Grönwall's Inequality

**Grönwall's inequality** is the single most useful technical lemma in ODE theory, appearing in proofs of uniqueness, continuous dependence, and stability estimates.

<div class="theorem">
<strong>Theorem (Grönwall's Inequality).</strong> Let \( u, \alpha, \beta : [a, b] \to \mathbb{R} \) be continuous with \( \beta \geq 0 \). If

\[
u(t) \leq \alpha(t) + \int_a^t \beta(s) u(s)\, ds
\]

for all \( t \in [a, b] \), then

\[
u(t) \leq \alpha(t) + \int_a^t \alpha(s)\beta(s) \exp\!\left(\int_s^t \beta(r)\, dr\right) ds.
\]

In the special case \( \alpha(t) \equiv C \) (constant),

\[
u(t) \leq C \exp\!\left(\int_a^t \beta(s)\, ds\right).
\]
</div>

<div class="proof">
<strong>Proof (constant case).</strong> Define \( v(t) = \int_a^t \beta(s) u(s)\, ds \). Then \( \dot{v} = \beta(t) u(t) \leq \beta(t)(C + v(t)) \). This is a linear inequality: \( \dot{v} - \beta(t) v \leq C\beta(t) \). Multiplying by the integrating factor \( e^{-\int_a^t \beta} \) gives \( \frac{d}{dt}\!\left[e^{-\int_a^t \beta} v\right] \leq C\beta(t) e^{-\int_a^t \beta} \). Integrating from \( a \) to \( t \) yields the result. <strong>QED</strong>
</div>

As an immediate application, if \( x(t) \) and \( y(t) \) are both solutions to \( \dot{x} = f(t,x) \) with the same initial condition and \( f \) is Lipschitz with constant \( L \), then

\[
\|x(t) - y(t)\| \leq \int_{t_0}^t L \|x(s) - y(s)\|\, ds,
\]

and Grönwall gives \( \|x(t) - y(t)\| = 0 \), reproving uniqueness. More importantly, if \( x(t) \) and \( y(t) \) have different initial conditions \( x_0 \) and \( y_0 \), Grönwall gives

\[
\|x(t) - y(t)\| \leq \|x_0 - y_0\| e^{L|t - t_0|},
\]

which quantifies **continuous dependence on initial data**: solutions starting nearby remain nearby over any finite time interval, with an exponentially growing bound.

## The Comparison Principle

For the scalar ODE \( \dot{x} = f(t, x) \) with \( f \) locally Lipschitz in \( x \), we have a powerful ordering property. If \( v(t) \) satisfies the differential inequality \( \dot{v} \leq f(t, v) \) and \( u(t) \) is the solution to \( \dot{u} = f(t, u) \) with \( u(t_0) \geq v(t_0) \), then \( u(t) \geq v(t) \) for all \( t \geq t_0 \) (as long as both exist).

<div class="theorem">
<strong>Theorem (Comparison Principle).</strong> Let \( f : [t_0, T] \times \mathbb{R} \to \mathbb{R} \) be continuous and non-decreasing in \( x \). If \( \dot{u} = f(t,u) \), \( \dot{v} \leq f(t,v) \), and \( u(t_0) \geq v(t_0) \), then \( u(t) \geq v(t) \) for all \( t \in [t_0, T] \).
</div>

The proof follows by setting \( w = u - v \) and showing \( w(t) \geq 0 \) via a contradiction argument or by converting the inequality to an integral form and applying Grönwall. The comparison principle enables sharp estimates: instead of solving a nonlinear equation exactly, one often bounds solutions by solving a simpler comparison equation. For instance, if \( \dot{v} \leq \alpha(t) v \), then \( v(t) \leq v(t_0) \exp\!\left(\int_{t_0}^t \alpha(s)\, ds\right) \).

## Maximal Interval of Existence and Blow-Up

The local solution provided by Picard–Lindelöf can typically be extended. Two solutions agreeing on an overlapping interval must agree on their union by uniqueness (a straightforward argument using the Lipschitz condition). This yields a unique **maximal solution** defined on a maximal open interval \( (T_-, T_+) \).

<div class="theorem">
<strong>Theorem (Blow-Up Alternative).</strong> Let \( f : U \to \mathbb{R}^n \) be locally Lipschitz with \( U \subseteq \mathbb{R} \times \mathbb{R}^n \) open. The maximal solution \( x : (T_-, T_+) \to \mathbb{R}^n \) has the property that for any compact \( K \subset U \), there exists \( t_K \) such that \( (t, x(t)) \notin K \) for all \( t > t_K \). In other words, the solution either exists for all time or eventually leaves every compact subset of \( U \).
</div>

For the autonomous system \( \dot{x} = f(x) \) on \( \mathbb{R}^n \), this means that if the maximal time \( T_+ < \infty \), then \( \|x(t)\| \to \infty \) as \( t \to T_+^- \) — a finite-time **blow-up**. The simplest example is \( \dot{x} = x^2 \) with \( x(0) = 1 \), whose solution \( x(t) = 1/(1-t) \) blows up at \( t = 1 \). Global existence on \( (0, \infty) \) is guaranteed whenever the vector field has at most linear growth: if \( \|f(t,x)\| \leq C(1 + \|x\|) \), then Grönwall shows \( \|x(t)\| \leq (\|x_0\| + 1)e^{Ct} \), ruling out finite-time blow-up.

---

# Chapter 2: Linear Systems

## Structure of Linear Systems

We now specialize to linear systems. A **linear system** takes the form

\[
\dot{x} = A(t) x + g(t),
\]

where \( A : I \to M_n(\mathbb{R}) \) and \( g : I \to \mathbb{R}^n \) are continuous on an interval \( I \). The homogeneous system \( \dot{x} = A(t)x \) has solutions forming an \( n \)-dimensional real vector space.

<div class="definition">
<strong>Definition (Fundamental Matrix Solution).</strong> An \( n \times n \) matrix-valued function \( \Phi(t) \) is a <em>fundamental matrix solution</em> of \( \dot{x} = A(t)x \) if each column of \( \Phi \) is a solution and \( \Phi(t) \) is invertible for every \( t \in I \). The solution with \( \Phi(t_0) = I \) is called the <em>principal fundamental matrix solution</em> at \( t_0 \), often denoted \( \Phi(t, t_0) \).
</div>

The **Wronskian** of \( \Phi \) is \( W(t) = \det \Phi(t) \). It satisfies **Abel's identity**:

\[
W(t) = W(t_0) \exp\!\left(\int_{t_0}^t \operatorname{tr} A(s)\, ds\right),
\]

which follows from Jacobi's formula \( \frac{d}{dt} \det \Phi = (\operatorname{tr} A) \det \Phi \). Consequently, \( W(t) \neq 0 \) for all \( t \in I \) provided \( W(t_0) \neq 0 \), confirming that invertibility is preserved.

## Variation of Parameters

For the inhomogeneous system \( \dot{x} = A(t)x + g(t) \), the **variation of parameters formula** gives the general solution in terms of a fundamental matrix:

\[
x(t) = \Phi(t, t_0) x_0 + \int_{t_0}^t \Phi(t, s) g(s)\, ds.
\]

This follows by seeking a solution of the form \( x(t) = \Phi(t, t_0) c(t) \) and solving for \( \dot{c}(t) = \Phi(t, t_0)^{-1} g(t) \). Integrating gives \( c(t) = x_0 + \int_{t_0}^t \Phi(s, t_0)^{-1} g(s)\, ds \), and using \( \Phi(t, t_0) \Phi(s, t_0)^{-1} = \Phi(t, s) \) yields the formula. For the constant-coefficient case \( A(t) = A \), we have \( \Phi(t, t_0) = e^{A(t-t_0)} \), where the matrix exponential \( e^{At} = \sum_{k=0}^\infty \frac{(At)^k}{k!} \) is computed via Jordan normal form or the Cayley–Hamilton theorem.

## Floquet Theory for Periodic Linear Systems

When the coefficient matrix is **periodic**, \( A(t + T) = A(t) \) for some period \( T > 0 \), the system possesses remarkable additional structure captured by Floquet theory.

<div class="theorem">
<strong>Theorem (Floquet's Theorem).</strong> Let \( A(t) \) be continuous and \( T \)-periodic. Then any fundamental matrix solution \( \Phi(t) \) can be written as

\[
\Phi(t) = P(t) e^{Bt},
\]

where \( P(t) \) is \( T \)-periodic and \( B \) is a constant matrix (possibly complex). The matrix \( e^{BT} = \Phi(T, 0) \) is the <em>monodromy matrix</em>, and its eigenvalues \( \mu_1, \ldots, \mu_n \) are the <em>characteristic multipliers</em> (Floquet multipliers).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The key observation is that \( \Phi(t + T) \) is also a fundamental matrix solution, since the periodicity of \( A \) means \( \frac{d}{dt} \Phi(t+T) = A(t+T)\Phi(t+T) = A(t)\Phi(t+T) \). Hence there exists a constant invertible matrix \( C \) (the monodromy matrix) such that \( \Phi(t+T) = \Phi(t) C \). Since \( C \) is invertible, we can write \( C = e^{BT} \) for some (complex) matrix \( B \) (the matrix logarithm exists for invertible matrices, though it may be complex). Setting \( P(t) = \Phi(t) e^{-Bt} \), we compute \( P(t+T) = \Phi(t+T) e^{-B(t+T)} = \Phi(t) C e^{-BT} e^{-Bt} = \Phi(t) e^{-Bt} = P(t) \), confirming periodicity of \( P \). <strong>QED</strong>
</div>

The **characteristic exponents** \( \rho_j \) are defined by \( \mu_j = e^{\rho_j T} \) (they are not unique, but \( \operatorname{Re}(\rho_j) \) is well-defined). The stability of the zero solution is determined entirely by the characteristic multipliers: the system is **asymptotically stable** if all \( |\mu_j| < 1 \), **stable** if all \( |\mu_j| \leq 1 \) with multipliers of modulus one having Jordan blocks of size one, and **unstable** if some \( |\mu_j| > 1 \).

The Floquet substitution \( x(t) = P(t) y(t) \) transforms the periodic system into the constant-coefficient system \( \dot{y} = B y \), reducing questions about the periodic system to the simpler constant-coefficient theory.

### The Mathieu Equation

A classical example of a periodic linear system is the **Mathieu equation**:

\[
\ddot{x} + (\delta + \varepsilon \cos 2t) x = 0,
\]

which governs the motion of a pendulum with a periodically oscillating pivot. Written as a system with \( y = \dot{x} \):

\[
\frac{d}{dt}\begin{pmatrix} x \\ y \end{pmatrix} = \begin{pmatrix} 0 & 1 \\ -\delta - \varepsilon\cos 2t & 0 \end{pmatrix} \begin{pmatrix} x \\ y \end{pmatrix}.
\]

The monodromy matrix \( C = \Phi(\pi, 0) \) (period \( T = \pi \)) has determinant one (since \( \operatorname{tr} A = 0 \) everywhere, Abel's identity gives \( \det C = 1 \)). The characteristic multipliers \( \mu_1, \mu_2 \) satisfy \( \mu_1 \mu_2 = 1 \). Stability is controlled by the trace of \( C \): if \( |\operatorname{tr} C| < 2 \), both multipliers lie on the unit circle and the zero solution is stable; if \( |\operatorname{tr} C| > 2 \), one multiplier satisfies \( |\mu| > 1 \), giving instability (parametric resonance). The regions of stability in the \( (\delta, \varepsilon) \)-parameter plane are separated by curves (stability boundaries) along which \( |\operatorname{tr} C| = 2 \), corresponding to \( T \)-periodic or \( 2T \)-periodic solutions.

---

# Chapter 3: Stability Theory

## Definitions of Stability

Let \( \bar{x} \) be an equilibrium of the autonomous system \( \dot{x} = f(x) \), i.e., \( f(\bar{x}) = 0 \). By translating, we may assume \( \bar{x} = 0 \). Let \( x(t; x_0) \) denote the solution with initial condition \( x_0 \).

<div class="definition">
<strong>Definition (Lyapunov Stability).</strong> The equilibrium \( 0 \) is <em>Lyapunov stable</em> if for every \( \varepsilon > 0 \) there exists \( \delta > 0 \) such that \( \|x_0\| < \delta \) implies \( \|x(t; x_0)\| < \varepsilon \) for all \( t \geq 0 \). It is <em>asymptotically stable</em> if it is Lyapunov stable and additionally \( \|x(t; x_0)\| \to 0 \) as \( t \to \infty \) for all sufficiently small \( \|x_0\| \). It is <em>unstable</em> if it is not Lyapunov stable.
</div>

Asymptotic stability with a global basin of attraction is called **global asymptotic stability**. For linear systems \( \dot{x} = Ax \), the origin is asymptotically stable if and only if all eigenvalues of \( A \) have strictly negative real part; it is Lyapunov stable if and only if all eigenvalues have non-positive real part with semi-simple structure for the purely imaginary ones; and it is unstable if any eigenvalue has positive real part.

## Lyapunov's Direct Method

The central technique for studying stability of nonlinear systems without explicitly solving them is **Lyapunov's direct (second) method**. The idea is to find an energy-like function that decreases along trajectories.

<div class="definition">
<strong>Definition (Lyapunov Function).</strong> A function \( V : \Omega \to \mathbb{R} \) defined on a neighbourhood \( \Omega \) of the origin is a <em>Lyapunov function</em> for \( \dot{x} = f(x) \) if \( V \) is \( C^1 \), \( V(0) = 0 \), \( V(x) > 0 \) for \( x \neq 0 \) in \( \Omega \) (positive definite), and the orbital derivative

\[
\dot{V}(x) = \nabla V(x) \cdot f(x) = \sum_{i=1}^n \frac{\partial V}{\partial x_i} f_i(x)
\]

satisfies \( \dot{V}(x) \leq 0 \) for all \( x \in \Omega \setminus \{0\} \).
</div>

<div class="theorem">
<strong>Theorem (Lyapunov Stability Theorem).</strong> If a Lyapunov function for \( \dot{x} = f(x) \) exists on a neighbourhood \( \Omega \) of the origin, then the origin is Lyapunov stable. If furthermore \( \dot{V}(x) < 0 \) for all \( x \neq 0 \) in \( \Omega \) (negative definite), then the origin is asymptotically stable. If \( V \) is radially unbounded (\( V(x) \to \infty \) as \( \|x\| \to \infty \)) and \( \dot{V} < 0 \) globally, then the origin is globally asymptotically stable.
</div>

<div class="proof">
<strong>Proof.</strong> Fix \( \varepsilon > 0 \) small enough that \( \overline{B_\varepsilon} \subset \Omega \). Let \( m = \min_{\|x\| = \varepsilon} V(x) > 0 \). By continuity of \( V \) and \( V(0) = 0 \), choose \( \delta > 0 \) such that \( \|x\| < \delta \implies V(x) < m \). Suppose \( \|x_0\| < \delta \). Then \( V(x(0)) < m \). Since \( \dot{V}(x(t)) \leq 0 \), the function \( t \mapsto V(x(t)) \) is non-increasing, so \( V(x(t)) \leq V(x_0) < m \) for all \( t \geq 0 \). This means \( x(t) \notin \partial B_\varepsilon \) and, by connectedness, \( x(t) \in B_\varepsilon \) for all \( t \geq 0 \), establishing Lyapunov stability.

For asymptotic stability with \( \dot{V} < 0 \): since \( V(x(t)) \) is strictly decreasing and bounded below by zero, the limit \( \ell = \lim_{t\to\infty} V(x(t)) \) exists. If \( \ell > 0 \), the trajectory stays in the compact set \( \{m \geq V(x) \geq \ell\} \subset \Omega \setminus \{0\} \), but then \( \dot{V} \leq -c < 0 \) on this set for some \( c > 0 \), giving \( V(x(t)) \leq V(x_0) - ct \to -\infty \), a contradiction. Hence \( \ell = 0 \) and \( x(t) \to 0 \). <strong>QED</strong>
</div>

An instability criterion complements these results:

<div class="theorem">
<strong>Theorem (Chetaev's Instability Theorem).</strong> Suppose there exists a \( C^1 \) function \( V : \Omega \to \mathbb{R} \) and an open region \( \Omega' \subset \Omega \) with \( 0 \in \partial\Omega' \) such that \( V(0) = 0 \), \( V > 0 \) in \( \Omega' \), \( V = 0 \) on \( \partial\Omega' \cap \Omega \), and \( \dot{V} > 0 \) in \( \Omega' \). Then the origin is unstable.
</div>

## LaSalle's Invariance Principle

Lyapunov's theorem requires \( \dot{V} < 0 \) for asymptotic stability, but this can often be weakened using the concept of the largest invariant set in the region where \( \dot{V} = 0 \).

<div class="theorem">
<strong>Theorem (LaSalle's Invariance Principle).</strong> Let \( \Omega \subset \mathbb{R}^n \) be a compact positively invariant set for \( \dot{x} = f(x) \). Let \( V : \Omega \to \mathbb{R} \) be \( C^1 \) with \( \dot{V}(x) \leq 0 \) in \( \Omega \). Define \( E = \{ x \in \Omega : \dot{V}(x) = 0 \} \) and let \( M \) be the largest positively invariant subset of \( E \). Then every solution starting in \( \Omega \) satisfies \( x(t) \to M \) as \( t \to \infty \).
</div>

The power of this result is that we need only \( \dot{V} \leq 0 \); asymptotic stability follows if \( M = \{0\} \). For example, for the damped pendulum \( \ddot{\theta} + b\dot{\theta} + \sin\theta = 0 \) with energy \( V = \frac{1}{2}\dot{\theta}^2 + 1 - \cos\theta \), we have \( \dot{V} = -b\dot{\theta}^2 \leq 0 \). The set \( E = \{\dot{\theta} = 0\} \); on any invariant trajectory in \( E \), \( \dot{\theta} \equiv 0 \), so \( \ddot{\theta} \equiv 0 \), giving \( \sin\theta \equiv 0 \), hence \( \theta \equiv 0 \). Thus \( M = \{(0,0)\} \) and the origin is globally asymptotically stable (on the appropriate level sets).

## Linearization and the Hartman–Grobman Theorem

For a \( C^1 \) vector field \( f \) with \( f(0) = 0 \), the **linearization** at the origin is the linear system \( \dot{y} = Df(0) y \). When \( Df(0) \) has no eigenvalues with zero real part (a **hyperbolic** equilibrium), the nonlinear dynamics near the origin are topologically equivalent to the linear dynamics:

<div class="theorem">
<strong>Theorem (Hartman–Grobman).</strong> Let \( 0 \) be a hyperbolic equilibrium of the \( C^1 \) system \( \dot{x} = f(x) \). Then there exist neighbourhoods \( U \) of the origin in \( \mathbb{R}^n \) and \( V \) of the origin in \( \mathbb{R}^n \), and a homeomorphism \( h : U \to V \), such that \( h \) maps orbits of \( \dot{x} = f(x) \) in \( U \) to orbits of \( \dot{y} = Df(0)y \) in \( V \), preserving the direction of time.
</div>

The homeomorphism \( h \) is generally not a diffeomorphism — the smooth structure near the equilibrium can differ from the linear one. However, for hyperbolic equilibria, stability type is determined completely by the signs of the real parts of eigenvalues of \( Df(0) \). If all eigenvalues have negative real part, the origin is asymptotically stable for both the linear and nonlinear systems. If any eigenvalue has positive real part, the origin is unstable for both. The borderline case — some eigenvalues with zero real part — requires higher-order analysis via center manifold theory.

---

# Chapter 4: Periodic Solutions and Poincaré Maps

## The Poincaré Map

For autonomous systems in \( \mathbb{R}^n \), a fundamental tool for analysing periodic orbits is the **Poincaré return map** (or first-return map). Given a periodic orbit \( \gamma \) with period \( T \), one selects a codimension-one transversal section \( \Sigma \) passing through a point \( p \in \gamma \), i.e., a smooth hypersurface that intersects \( \gamma \) transversally at \( p \). The Poincaré map \( P : \Sigma \to \Sigma \) is defined (locally near \( p \)) by following the flow: \( P(x) = \phi_{\tau(x)}(x) \), where \( \tau(x) \) is the first return time to \( \Sigma \). Fixed points of \( P \) correspond to periodic orbits of the flow. The stability of the periodic orbit is encoded in the eigenvalues of \( DP(p) \) (the **characteristic multipliers** of the orbit): the orbit is asymptotically stable if all eigenvalues of \( DP(p) \) lie strictly inside the unit disk, and unstable if any eigenvalue lies strictly outside.

## The Poincaré–Bendixson Theorem

For planar autonomous systems \( \dot{x} = f(x) \), \( x \in \mathbb{R}^2 \), the absence of higher-dimensional complexity leads to a complete classification of long-time behaviour:

<div class="theorem">
<strong>Theorem (Poincaré–Bendixson).</strong> Let \( \Omega \subset \mathbb{R}^2 \) be a compact positively invariant region for the \( C^1 \) system \( \dot{x} = f(x) \). Suppose \( \Omega \) contains no equilibrium. Then \( \Omega \) contains at least one periodic orbit.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Pick any \( x_0 \in \Omega \). Since \( \Omega \) is compact and positively invariant, the forward orbit \( \{ \phi_t(x_0) : t \geq 0 \} \) has non-empty \( \omega \)-limit set \( \omega(x_0) \subset \Omega \). The \( \omega \)-limit set is compact, connected, and positively invariant. Suppose \( p \in \omega(x_0) \). Since \( \Omega \) has no equilibria, the orbit through \( p \) is not a fixed point.

The Jordan curve theorem and the transversality of a local section \( \Sigma \) through \( p \) are used as follows. Since \( \omega(x_0) \) is positively invariant and contains the orbit of \( p \), if \( L^+(p) \subset \omega(x_0) \) is a closed orbit, we are done. If not, one shows that \( \omega(p) \subset \omega(x_0) \) and by a careful analysis using the Jordan curve theorem — specifically, that any crossing of a transversal section must be monotone — the trajectory through any point \( q \in \omega(x_0) \) that is not itself periodic must recur to the same point, forcing \( q \) to lie on a periodic orbit. The details use the fact that in the plane, orbits cannot cross, so successive intersections with a transversal section must be monotone, and a strictly monotone sequence in a compact set converges. The limit must be a periodic orbit. <strong>QED</strong>
</div>

More precisely, the Poincaré–Bendixson theorem states that the \( \omega \)-limit set of any bounded orbit in the plane with finitely many equilibria is one of: an equilibrium, a periodic orbit, or a graphic (a union of equilibria and connecting orbits). The practical consequence is that if one can identify a positively invariant compact region containing no equilibria, a limit cycle must exist inside.

## Index Theory for Planar Systems

**Index theory** provides a topological obstruction to various phase portrait configurations. The **index** of an equilibrium \( p \) of a planar system is an integer measuring the winding number of the vector field along a small loop encircling \( p \):

\[
\text{index}(p) = \frac{1}{2\pi} \oint \, d\!\left(\arctan\frac{f_2}{f_1}\right).
\]

For a saddle point, index \( = -1 \); for a node, focus, or center, index \( = +1 \). The fundamental result is that the index of a closed orbit equals \( +1 \), so any closed orbit must enclose equilibria whose indices sum to \( +1 \). In particular, a region enclosed by a limit cycle must contain at least one equilibrium.

## Non-Existence Criteria for Limit Cycles

Two classical criteria rule out limit cycles in planar systems.

<div class="theorem">
<strong>Theorem (Bendixson's Criterion).</strong> If \( \operatorname{div} f = \frac{\partial f_1}{\partial x_1} + \frac{\partial f_2}{\partial x_2} \) does not change sign and is not identically zero on any open set in a simply connected region \( D \), then \( \dot{x} = f(x) \) has no closed orbits lying entirely in \( D \).
</div>

<div class="proof">
<strong>Proof.</strong> Suppose for contradiction that \( \gamma \) is a closed orbit lying in \( D \), enclosing region \( R \). By Green's theorem:

\[
\iint_R \operatorname{div} f\, dA = \oint_\gamma f \cdot \hat{n}\, ds.
\]

Along \( \gamma \), the vector \( f \) is tangent to \( \gamma \) (it is the velocity of the flow), so \( f \cdot \hat{n} = 0 \) everywhere on \( \gamma \). Hence \( \iint_R \operatorname{div} f\, dA = 0 \). But if \( \operatorname{div} f \) does not change sign and is not identically zero, the integral cannot vanish, a contradiction. <strong>QED</strong>
</div>

A generalization is **Dulac's criterion**: if there exists a \( C^1 \) function \( B : D \to \mathbb{R} \) (a Dulac function) such that \( \operatorname{div}(Bf) \) does not change sign and is not identically zero, then there are no closed orbits. Bendixson's criterion corresponds to \( B \equiv 1 \).

## Averaging Methods

For weakly perturbed oscillators of the form

\[
\ddot{x} + x = \varepsilon g(x, \dot{x}),
\]

one seeks approximate periodic solutions valid for \( O(1/\varepsilon) \) timescales. Writing \( x = r\cos\theta \), \( \dot{x} = -r\sin\theta \) and averaging over the fast oscillation:

\[
\dot{r} = -\frac{\varepsilon}{2\pi} \int_0^{2\pi} g(r\cos\theta, -r\sin\theta)\sin\theta\, d\theta + O(\varepsilon^2).
\]

Fixed points of the averaged equation \( \dot{r} = \varepsilon f_{\text{avg}}(r) = 0 \) correspond, under the **averaging theorem**, to periodic orbits of the original system for small \( \varepsilon > 0 \), provided the fixed point is non-degenerate.

---

# Chapter 5: Hyperbolic Theory and Invariant Manifolds

## Hyperbolic Equilibria

An equilibrium \( \bar{x} \) of \( \dot{x} = f(x) \) is **hyperbolic** if the linearization \( A = Df(\bar{x}) \) has no eigenvalues with zero real part. Denote by \( E^s \) the **stable eigenspace** (span of generalized eigenvectors corresponding to eigenvalues with negative real part) and \( E^u \) the **unstable eigenspace** (corresponding to eigenvalues with positive real part). The dimensions \( \dim E^s + \dim E^u = n \) for a hyperbolic equilibrium.

## Stable and Unstable Manifold Theorem

The linearization gives the tangent spaces, but the actual invariant manifolds are nonlinear objects:

<div class="theorem">
<strong>Theorem (Stable Manifold Theorem).</strong> Let \( 0 \) be a hyperbolic equilibrium of the \( C^k \) (\( k \geq 1 \)) system \( \dot{x} = f(x) \). There exist \( C^k \) immersed submanifolds \( W^s_{\text{loc}} \) and \( W^u_{\text{loc}} \) — the local stable and unstable manifolds — tangent at \( 0 \) to \( E^s \) and \( E^u \) respectively, such that:
<ol>
<li>Every trajectory starting in \( W^s_{\text{loc}} \) satisfies \( \phi_t(x) \to 0 \) exponentially as \( t \to +\infty \), and \( \phi_t(x) \in W^s_{\text{loc}} \) for all \( t \geq 0 \).</li>
<li>Every trajectory starting in \( W^u_{\text{loc}} \) satisfies \( \phi_t(x) \to 0 \) exponentially as \( t \to -\infty \).</li>
<li>The dimensions of \( W^s_{\text{loc}} \) and \( W^u_{\text{loc}} \) equal those of \( E^s \) and \( E^u \) respectively.</li>
</ol>
</div>

The **global stable manifold** \( W^s = \{ x : \phi_t(x) \to 0 \text{ as } t \to \infty \} = \bigcup_{t \leq 0} \phi_t(W^s_{\text{loc}}) \) is an immersed submanifold of the same dimension.

### Proof Sketch via Graph Transform

The local stable manifold is constructed as the graph of a \( C^k \) function \( h : E^s \to E^u \) near the origin. Write the system in the splitting \( x = (u, v) \in E^s \oplus E^u \):

\[
\dot{u} = Au + F(u, v), \qquad \dot{v} = Bv + G(u, v),
\]

where \( \operatorname{Re}\,\sigma(A) < 0 \), \( \operatorname{Re}\,\sigma(B) > 0 \), and \( F, G = O(\|(u,v)\|^2) \). We seek \( W^s_{\text{loc}} = \{(u, h(u))\} \) with \( h(0) = 0 \), \( Dh(0) = 0 \). The invariance condition \( \dot{v} = Dh(u)\dot{u} \) translates to a PDE for \( h \), which is equivalent to an integral equation (via the variation of parameters formula along the stable manifold). One constructs the **graph transform** operator \( \mathcal{G} \) mapping functions \( h : E^s \to E^u \) to themselves, and shows it is a contraction on a suitable Banach space of Lipschitz functions near zero. The unique fixed point of \( \mathcal{G} \) is the desired \( h \), giving \( W^s_{\text{loc}} \). Higher regularity follows by a fiber-contraction argument.

## Center Manifold Theorem

When \( Df(0) \) has eigenvalues with zero real part, the stable manifold theorem is inapplicable for those directions. The **center manifold** captures the long-time behaviour in these neutral directions.

<div class="theorem">
<strong>Theorem (Center Manifold Theorem).</strong> Let \( 0 \) be an equilibrium of the \( C^k \) (\( k \geq 2 \)) system \( \dot{x} = f(x) \), with eigenspace decomposition \( \mathbb{R}^n = E^s \oplus E^c \oplus E^u \). There exists a \( C^{k-1} \) locally invariant submanifold \( W^c_{\text{loc}} \) (the center manifold) tangent to \( E^c \) at the origin. The dynamics of \( \dot{x} = f(x) \) near the origin are determined (up to \( C^{k-1} \) equivalence) by the reduced system on \( W^c_{\text{loc}} \).
</div>

Center manifolds are not unique (in contrast to stable/unstable manifolds), but they all contain the same Taylor expansion to any finite order. The reduction principle states: if the origin is stable/asymptotically stable/unstable for the flow restricted to \( W^c_{\text{loc}} \), it has the same stability type for the full system.

### Center Manifold Computation

In practice, write \( x = (u, v, w) \in E^s \oplus E^c \oplus E^u \):

\[
\dot{u} = Au + F_1(u,v,w), \quad \dot{v} = Cv + F_2(u,v,w), \quad \dot{w} = Bw + F_3(u,v,w),
\]

with \( \operatorname{Re}\,\sigma(A) < 0 \), \( \sigma(C) \subset i\mathbb{R} \), \( \operatorname{Re}\,\sigma(B) > 0 \). The center manifold is parameterized as \( u = h^s(v) \), \( w = h^u(v) \) near \( v = 0 \), with \( h^{s,u}(0) = 0 \), \( Dh^{s,u}(0) = 0 \). These functions satisfy the **invariance equations**:

\[
\frac{\partial h^s}{\partial v}\!\left(Cv + F_2(h^s, v, h^u)\right) = Ah^s + F_1(h^s, v, h^u),
\]

and similarly for \( h^u \). These are solved perturbatively: expand \( h^s(v) = h^s_2(v) + h^s_3(v) + \cdots \) in homogeneous polynomials and match powers of \( v \). The reduced equation on the center manifold is then \( \dot{v} = Cv + F_2(h^s(v), v, h^u(v)) \), an ODE in the (typically low-dimensional) center variables.

## Normal Forms

**Normal form theory** provides systematic coordinate changes that simplify the high-order terms in a vector field near an equilibrium. Suppose \( \dot{x} = Ax + F(x) \) with \( F = O(\|x\|^2) \). One seeks a near-identity change of variables \( x = y + h(y) \) with \( h = O(\|y\|^2) \) that eliminates as many nonlinear terms as possible. At each order \( k \), the obstruction to elimination is determined by the **homological equation**:

\[
[A, h_k] \doteq Dh_k(y) Ay - A h_k(y) = f_k(y),
\]

where \( f_k \) is the degree-\( k \) part of the vector field after previous transformations. Terms in the range of the operator \( \text{ad}_A : h_k \mapsto [A, h_k] \) can be eliminated; terms in the complementary subspace (the **resonant monomials**) must be retained. Two monomials \( x^\alpha e_j \) (where \( e_j \) is a standard basis vector) are **resonant** at degree \( |\alpha| \) if

\[
\langle \alpha, \lambda \rangle = \lambda_j,
\]

where \( \lambda_i \) are the eigenvalues of \( A \) and \( \alpha \in \mathbb{Z}_{\geq 0}^n \) with \( |\alpha| \geq 2 \). These resonance relations determine which nonlinear terms are intrinsic and cannot be removed by smooth coordinate changes.

## Examples: Duffing and Van der Pol Oscillators

The **Duffing oscillator** \( \ddot{x} + \delta\dot{x} + x + \beta x^3 = \gamma\cos(\omega t) \) is a paradigm for forced nonlinear oscillations. In the unforced, undamped case \( \ddot{x} + x + \beta x^3 = 0 \), the system is Hamiltonian with energy \( H = \frac{1}{2}\dot{x}^2 + \frac{1}{2}x^2 + \frac{\beta}{4}x^4 \). The nonlinear frequency-amplitude relationship (backbone curve) deviates from the linear case: the frequency of oscillation depends on the amplitude, a hallmark of nonlinear behavior.

The **van der Pol oscillator** \( \ddot{x} - \mu(1-x^2)\dot{x} + x = 0 \) models a limit cycle oscillator with nonlinear damping. For small \( \mu > 0 \), averaging theory reveals a nearly circular stable limit cycle of amplitude \( \approx 2 \). For large \( \mu \), the limit cycle becomes highly distorted and the oscillation becomes relaxation-type, with slow and fast phases. Center manifold analysis near the (unstable) origin confirms the existence of the limit cycle via the signs of the Floquet multipliers after linearization.

---

# Chapter 6: Bifurcation Theory

## Introduction to Bifurcation

**Bifurcation theory** studies how the qualitative structure of a vector field — its equilibria, periodic orbits, and their stability — changes as parameters are varied. A **bifurcation** occurs at a parameter value \( \mu_0 \) if the phase portrait undergoes a qualitative change at \( \mu_0 \). The codimension of a bifurcation is the number of independent parameter directions needed to encounter it generically.

## Saddle-Node, Transcritical, and Pitchfork Bifurcations

Consider the scalar equation \( \dot{x} = f(x, \mu) \) with \( f(0, 0) = 0 \) and \( f_x(0, 0) = 0 \) (a bifurcation condition).

The **saddle-node bifurcation** is the generic codimension-one bifurcation. Normal form:

\[
\dot{x} = \mu - x^2.
\]

For \( \mu > 0 \) there are two equilibria \( x = \pm\sqrt{\mu} \) (one stable, one unstable); at \( \mu = 0 \) they collide; for \( \mu < 0 \) there are none. The conditions for a saddle-node bifurcation at \( (x_0, \mu_0) \) are \( f = 0 \), \( f_x = 0 \), \( f_{\mu} \neq 0 \), and \( f_{xx} \neq 0 \).

The **transcritical bifurcation** (normal form \( \dot{x} = \mu x - x^2 \)) occurs when equilibria exist for all \( \mu \) but exchange stability as \( \mu \) passes through zero. Two equilibria \( x = 0 \) and \( x = \mu \) cross at \( \mu = 0 \). The conditions are \( f = 0 \), \( f_x = 0 \), \( f_\mu = 0 \), \( f_{x\mu} \neq 0 \), \( f_{xx} \neq 0 \).

The **pitchfork bifurcation** arises in systems with a reflection symmetry \( f(-x, \mu) = -f(x, \mu) \). Normal form: \( \dot{x} = \mu x - x^3 \) (supercritical) or \( \dot{x} = \mu x + x^3 \) (subcritical). In the supercritical case, a stable equilibrium at the origin for \( \mu < 0 \) loses stability at \( \mu = 0 \) as two new stable equilibria \( x = \pm\sqrt{\mu} \) are born. In the subcritical case, two unstable equilibria collide at the origin and destroy its stability.

## The Hopf Bifurcation

The Hopf bifurcation is the mechanism by which a periodic orbit is born from an equilibrium. It arises when a pair of complex conjugate eigenvalues of \( Df(0, \mu) \) crosses the imaginary axis.

<div class="theorem">
<strong>Theorem (Poincaré–Andronov–Hopf).</strong> Let \( \dot{x} = f(x, \mu) \), \( x \in \mathbb{R}^2 \), \( \mu \in \mathbb{R} \), with \( f(0, \mu) = 0 \) for all \( \mu \). Suppose the eigenvalues of \( Df(0, \mu) \) are \( \lambda(\mu) = \alpha(\mu) \pm i\beta(\mu) \) with \( \alpha(0) = 0 \), \( \beta(0) \neq 0 \), and the transversality condition \( \alpha'(0) \neq 0 \). Let \( \ell_1 \) be the first Lyapunov coefficient (see below). Then:
<ul>
<li>If \( \ell_1 < 0 \) (supercritical), a family of stable periodic orbits bifurcates for \( \mu > 0 \) (assuming \( \alpha'(0) > 0 \)), with amplitude \( O(\sqrt{\mu}) \).</li>
<li>If \( \ell_1 > 0 \) (subcritical), a family of unstable periodic orbits bifurcates for \( \mu < 0 \).</li>
</ul>
</div>

### Computation of the First Lyapunov Coefficient

The sign of \( \ell_1 \) determines the direction of bifurcation and is computed from the cubic terms of \( f \). After transforming to Jordan form near the bifurcation, write \( f(x,y) = (-\beta y + f_1, \beta x + f_2) + \text{h.o.t.} \) and denote partial derivatives \( f_{1,ij} = \frac{\partial^2 f_1}{\partial x^i \partial y^j}\big|_0 \) etc. The first Lyapunov coefficient is:

\[
\ell_1 = \frac{1}{16}\!\left[ f_{1,xxx} + f_{1,xyy} + f_{2,xxy} + f_{2,yyy} \right] + \frac{1}{16\beta}\!\left[ f_{1,xy}(f_{1,xx} + f_{1,yy}) - f_{2,xy}(f_{2,xx} + f_{2,yy}) - f_{1,xx} f_{2,xx} + f_{1,yy} f_{2,yy} \right].
\]

This formula, while lengthy, is computable from the Taylor expansion of \( f \) at the bifurcation point. The sign of \( \ell_1 \) is the single quantity that distinguishes supercritical from subcritical Hopf bifurcation.

The proof of the Hopf theorem uses either: (i) reduction to the center manifold (two-dimensional), followed by normal form transformation to eliminate all but the resonant cubic term \( z|z|^2 \) (in complex notation \( z = x + iy \)), or (ii) the Poincaré return map analysis showing that the Poincaré map near the equilibrium has a fixed point for \( \mu \neq 0 \) by the implicit function theorem, with stability determined by \( \ell_1 \).

## Global Bifurcations: Homoclinic and Heteroclinic Orbits

**Global bifurcations** cannot be detected by local analysis near equilibria. A **homoclinic orbit** to a saddle \( p \) is a trajectory in \( W^s(p) \cap W^u(p) \) (the stable and unstable manifolds of the same equilibrium). A **heteroclinic orbit** connects two distinct saddles \( p, q \), lying in \( W^u(p) \cap W^s(q) \).

As a parameter \( \mu \) is varied, the homoclinic orbit appears at \( \mu = 0 \) as a saddle connection (the unstable manifold wraps back to the same saddle). For the planar homoclinic bifurcation, a limit cycle is born or destroyed. The criterion for which direction involves the **saddle quantity** \( \sigma = \lambda_1 + \lambda_2 \) where \( \lambda_1 < 0 < \lambda_2 \) are the eigenvalues of the saddle:

- If \( \sigma < 0 \) (the stable direction dominates), the limit cycle bifurcates from the homoclinic orbit and is stable.
- If \( \sigma > 0 \), the limit cycle is unstable.
- If \( \sigma = 0 \), higher-order analysis is required.

The period of the limit cycle near the homoclinic bifurcation diverges logarithmically: \( T \approx -\frac{1}{\lambda_2} \ln|\mu| + C \) as \( \mu \to 0 \).

## Shilnikov Chaos

In three or more dimensions, homoclinic orbits can generate chaotic dynamics. The **Shilnikov phenomenon** occurs when a three-dimensional system has a homoclinic orbit to a saddle-focus with eigenvalues \( \rho \pm i\omega \) (complex, with \( \rho > 0 \)) and \( -\lambda \) (real negative). Shilnikov's condition is \( |\rho| < \lambda \), i.e., the oscillating expansion near the saddle-focus is faster than the contraction along the returning direction.

<div class="theorem">
<strong>Theorem (Shilnikov).</strong> Under Shilnikov's condition \( \lambda > \rho > 0 \), any neighbourhood of a homoclinic orbit to a saddle-focus contains countably many periodic orbits of arbitrary period, as well as symbolic dynamics with a Bernoulli shift, implying sensitivity to initial conditions (chaos).
</div>

The proof constructs a Poincaré map near the homoclinic orbit as a composition of a local map (near the saddle-focus, a spiral with expansion) and a global map (returning along the homoclinic connection). The local map has a characteristic "Shilnikov folding" structure that creates a horseshoe, and the Smale–Birkhoff theorem then guarantees the presence of chaotic invariant sets.

## Codimension-Two Bifurcations

At isolated points in parameter space, two bifurcation conditions may be simultaneously satisfied, yielding **codimension-two bifurcations** that organize the surrounding codimension-one bifurcation curves. Important examples include:

- **Bogdanov–Takens bifurcation**: a double-zero eigenvalue; unfolds to a curve of saddle-node, Hopf, and homoclinic bifurcations.
- **Bautin (generalized Hopf) bifurcation**: Hopf bifurcation with \( \ell_1 = 0 \); requires computing the second Lyapunov coefficient \( \ell_2 \).
- **Fold-Hopf (zero-Hopf) bifurcation**: one zero eigenvalue and a purely imaginary pair; can generate tori and Shilnikov chaos in its unfolding.
- **Double-Hopf bifurcation**: two pairs of purely imaginary eigenvalues; generates quasiperiodic orbits on tori and complex dynamics.

---

# Chapter 7: Structural Stability and Chaos

## Structural Stability

A vector field \( f \) on a compact manifold \( M \) is **structurally stable** if there is a neighbourhood \( \mathcal{U}(f) \) (in the \( C^1 \) topology) such that every \( g \in \mathcal{U}(f) \) is topologically equivalent to \( f \): there exists a homeomorphism \( h : M \to M \) mapping orbits of \( f \) to orbits of \( g \) preserving time direction. Structural stability means the qualitative phase portrait is robust to small perturbations of the vector field.

<div class="theorem">
<strong>Theorem (Kupka–Smale).</strong> The set of \( C^r \) (\( r \geq 1 \)) vector fields on a compact manifold \( M \) such that (i) all equilibria and periodic orbits are hyperbolic, and (ii) stable and unstable manifolds of all hyperbolic equilibria and periodic orbits intersect transversally, is a residual (hence dense, by the Baire category theorem) subset of the \( C^r \) topology.
</div>

Kupka–Smale vector fields are generic, but they are not all structurally stable. Palis and Smale showed that structural stability requires additionally the absence of homoclinic tangencies and cycles among saddle connections. On two-dimensional manifolds, the Peixoto theorem characterizes structurally stable vector fields completely: they are exactly those satisfying the Kupka–Smale conditions with no heteroclinic connections among saddle points.

## Horseshoe Maps and Smale–Birkhoff

The **Smale horseshoe** is the archetype of chaotic dynamics. It is a diffeomorphism \( f : \mathbb{R}^2 \to \mathbb{R}^2 \) that maps a square \( Q \) by uniformly contracting horizontally, expanding vertically, and folding so that \( f(Q) \cap Q \) consists of two disjoint horizontal strips. Iterating, the points that remain in \( Q \) under all forward and backward iterates form a Cantor set \( \Lambda = \bigcap_{n=-\infty}^\infty f^n(Q) \).

The dynamics on \( \Lambda \) is conjugate to the **Bernoulli shift** on two symbols \( \{0, 1\}^{\mathbb{Z}} \) via the coding map \( \pi : \Lambda \to \{0,1\}^{\mathbb{Z}} \), where \( \pi(x)_n = 0 \) if \( f^n(x) \) is in the left strip and \( 1 \) if in the right. This conjugacy is a homeomorphism, and the Bernoulli shift has positive topological entropy, countably many periodic orbits of every period, and uncountably many non-periodic orbits, all of which are sensitively dependent on initial conditions.

<div class="theorem">
<strong>Theorem (Smale–Birkhoff).</strong> Let \( f \) be a \( C^1 \) diffeomorphism with a hyperbolic periodic point \( p \) such that \( W^u(p) \) and \( W^s(p) \) have a transverse intersection (a transverse homoclinic point). Then \( f \) has a compact invariant set \( \Lambda \) near the orbit of the transverse homoclinic point, on which \( f^k \) (for some iterate \( k \)) is topologically conjugate to a Bernoulli shift. In particular, \( f \) has infinitely many periodic orbits and exhibits sensitive dependence on initial conditions.
</div>

The proof constructs an explicit horseshoe-like structure near the homoclinic orbit using the hyperbolicity of \( p \) to define stable and unstable foliations, and the transversality of the intersection to create the required stretching and folding geometry.

## Lyapunov Exponents

**Lyapunov exponents** quantify the average exponential rate of separation of nearby orbits and are the primary diagnostic for chaos.

<div class="definition">
<strong>Definition (Lyapunov Exponents).</strong> For the flow \( \phi_t \) of \( \dot{x} = f(x) \) and initial condition \( x_0 \), the Lyapunov exponent in the direction \( v \in T_{x_0} M \) is

\[
\lambda(x_0, v) = \lim_{t \to \infty} \frac{1}{t} \ln \| D\phi_t(x_0) v \|,
\]

provided the limit exists. The collection of all such limits (counted with multiplicity) for a basis of \( T_{x_0} M \) forms the <em>Lyapunov spectrum</em> \( \lambda_1 \geq \lambda_2 \geq \cdots \geq \lambda_n \).
</div>

The existence of Lyapunov exponents for almost every point with respect to an ergodic invariant measure is guaranteed by the **Oseledets multiplicative ergodic theorem**. The sum \( \sum_{i=1}^n \lambda_i \) equals the time-averaged divergence \( \int \operatorname{div} f\, d\mu \) (by Liouville's theorem); for a Hamiltonian system, this is zero.

A positive largest Lyapunov exponent \( \lambda_1 > 0 \) implies **sensitive dependence on initial conditions**: trajectories starting exponentially close will diverge exponentially fast, on average. This is the precise quantitative definition of chaos. For the Lorenz system \( (\sigma = 10, r = 28, b = 8/3) \), numerical computation yields \( \lambda_1 \approx 0.906 \), confirming its chaotic nature.

## Sensitive Dependence and the Concept of Chaos

A precise mathematical definition of chaos remains somewhat contentious, but the most widely used formulation (due to Devaney) for a map \( f : X \to X \) on a metric space requires:

1. **Topological transitivity**: there exists a dense orbit.
2. **Dense periodic points**: the periodic points of \( f \) are dense in \( X \).
3. **Sensitive dependence on initial conditions**: there exists \( \delta > 0 \) such that for every \( x \in X \) and every neighbourhood \( U \ni x \), there exists \( y \in U \) and \( n \geq 0 \) with \( d(f^n(x), f^n(y)) > \delta \).

It is a theorem that conditions (1) and (2) together imply (3) on a metric space that is not a single periodic orbit, so sensitive dependence is actually a consequence of the topological mixing properties. In the context of ODEs, the time-\( T \) map of a flow generates a diffeomorphism to which these notions apply.

The **topological entropy** \( h_{\text{top}}(f) \geq \lambda_1 \geq 0 \) provides a coarser measure of complexity: it equals the exponential growth rate of the number of distinguishable orbits. For horseshoe maps, \( h_{\text{top}} = \ln 2 \) (two symbols). For the shift map on \( k \) symbols, \( h_{\text{top}} = \ln k \).

## The Lorenz System as an Example

The **Lorenz system**

\[
\dot{x} = \sigma(y - x), \qquad \dot{y} = rx - y - xz, \qquad \dot{z} = xy - bz
\]

(with \( \sigma = 10 \), \( r = 28 \), \( b = 8/3 \)) is the canonical example of a dissipative chaotic ODE. Several features are worth noting from the perspective of the theory developed above.

The divergence \( \operatorname{div} F = -(\sigma + 1 + b) < 0 \) everywhere, so the flow is volume-contracting: any region \( \Omega \) satisfies \( \frac{d}{dt}\text{Vol}(\phi_t \Omega) = -(\sigma + 1 + b)\text{Vol}(\phi_t \Omega) \), hence volumes decay exponentially. This implies the long-time dynamics is confined to a set of measure zero — the **Lorenz attractor**, whose Hausdorff dimension is approximately \( 2.06 \) by the Kaplan–Yorke conjecture \( d = 2 + \frac{\lambda_1}{|\lambda_3|} \approx 2 + \frac{0.906}{14.57} \).

The Lorenz system has three equilibria for \( r > 1 \): the origin and two symmetric equilibria \( C_\pm = (\pm\sqrt{b(r-1)}, \pm\sqrt{b(r-1)}, r-1) \). The origin undergoes a pitchfork bifurcation at \( r = 1 \), and the two non-trivial equilibria undergo a subcritical Hopf bifurcation at the Hopf parameter \( r_H = \sigma(\sigma + b + 3)/(\sigma - b - 1) \approx 24.74 \). For \( r > r_H \), the non-trivial equilibria are unstable, and the long-time attractor is the chaotic Lorenz attractor. The chaotic dynamics for the geometric Lorenz model was rigorously established by Tucker (2002) using computer-assisted proof.

---

# Appendix: Technical Complements

## Gronwall's Inequality in Integral Form

We record the most general form of Gronwall's lemma used in continuous dependence estimates.

<div class="theorem">
<strong>Theorem (Gronwall–Bellman).</strong> Let \( u, f, g : [a, b] \to [0, \infty) \) be continuous. If

\[
u(t) \leq f(t) + \int_a^t g(s) u(s)\, ds
\]

for all \( t \in [a, b] \), then

\[
u(t) \leq f(t) + \int_a^t f(s) g(s) \exp\!\left(\int_s^t g(r)\, dr\right) ds.
\]
</div>

## Continuous Dependence on Parameters

Let \( f(t, x, \lambda) \) be \( C^1 \) in all arguments on \( U \times \Lambda \) (with \( U \subseteq \mathbb{R} \times \mathbb{R}^n \) open and \( \Lambda \subseteq \mathbb{R}^k \) open). Then the maximal solution \( x(t; t_0, x_0, \lambda) \) is \( C^1 \) in \( (t_0, x_0, \lambda) \). The sensitivity matrices \( \frac{\partial x}{\partial x_0} \) and \( \frac{\partial x}{\partial \lambda} \) satisfy the **variational equations**:

\[
\frac{d}{dt}\frac{\partial x}{\partial x_0} = D_x f(t, x, \lambda) \frac{\partial x}{\partial x_0}, \qquad \frac{\partial x}{\partial x_0}\bigg|_{t=t_0} = I,
\]

\[
\frac{d}{dt}\frac{\partial x}{\partial \lambda} = D_x f \cdot \frac{\partial x}{\partial \lambda} + D_\lambda f, \qquad \frac{\partial x}{\partial \lambda}\bigg|_{t=t_0} = 0.
\]

These are linear ODEs for the sensitivities, driven by the variation of \( f \) itself. Existence and uniqueness for these equations follow from the Picard–Lindelöf theorem applied to the extended system, and Gronwall's inequality gives uniform bounds.

## The Poincaré Map Near a Limit Cycle

Let \( \gamma \) be a periodic orbit of period \( T \) for the autonomous system \( \dot{x} = f(x) \) in \( \mathbb{R}^n \). Choose a point \( p \in \gamma \) and a local codimension-one transversal \( \Sigma \) at \( p \). The implicit function theorem guarantees the existence of a return time function \( \tau : \Sigma \to \mathbb{R} \) near \( p \) with \( \tau(p) = T \), provided \( f(p) \notin T_p\Sigma \) (transversality). The Poincaré map \( P(x) = \phi_{\tau(x)}(x) \) is then \( C^k \) if \( f \) is \( C^k \).

The derivative \( DP(p) \) is related to the monodromy matrix \( M = D_{x_0}\phi_T(p) \) restricted to \( T_p\Sigma \). Specifically, the eigenvalues of \( DP(p) \) are the characteristic multipliers of \( \gamma \); by Abel's identity for the full variational equation, the product of all multipliers equals \( \exp\!\left(\int_0^T \operatorname{div} f(\gamma(t))\, dt\right) \). For Hamiltonian systems, the divergence is zero, so the product of multipliers is one. One multiplier is always \( 1 \) (corresponding to the direction along \( \gamma \)), so for the Poincaré map, all \( (n-1) \) multipliers have product \( \exp\!\left(\int_0^T \operatorname{div} f\right) \).

## Stability of Nonautonomous Systems

For the nonautonomous system \( \dot{x} = f(t, x) \), the equilibrium concept is replaced by a **solution** \( x^*(t) \) (not necessarily constant). Stability of \( x^*(t) \) is defined exactly as for equilibria, with \( x(t; x_0) \) replaced by the difference \( e(t) = x(t) - x^*(t) \). Setting \( y = x - x^* \), the error satisfies

\[
\dot{y} = f(t, x^* + y) - f(t, x^*) = A(t) y + N(t, y),
\]

where \( A(t) = D_x f(t, x^*(t)) \) is the linearization along \( x^*(t) \) and \( N = O(\|y\|^2) \). Uniform asymptotic stability of \( x^* \) can often be established via a **time-varying Lyapunov function** \( V(t, y) \), requiring \( \dot{V} = \partial_t V + \nabla_y V \cdot \dot{y} \leq -\alpha(\|y\|) \) along trajectories, where \( \alpha \) is a class-\( \mathcal{K} \) function (continuous, zero at zero, strictly increasing).

The **comparison principle** for nonautonomous systems extends the scalar theory: if \( \dot{V} \leq g(t, V) \) along solutions, then \( V(t) \leq u(t) \) where \( u \) solves the scalar comparison equation \( \dot{u} = g(t, u) \), \( u(t_0) = V(t_0) \). Combined with explicit solutions of standard scalar equations (e.g., Bernoulli equations), this yields sharp estimates on solution growth.

## Floquet Theory and Hill's Equation

The **Hill equation** \( \ddot{x} + p(t) x = 0 \) with \( p(t + \pi) = p(t) \) generalizes the Mathieu equation. By Floquet theory, the discriminant \( \Delta = \operatorname{tr} C \) (where \( C = \Phi(\pi, 0) \) is the monodromy matrix) determines stability. For the Mathieu equation \( p(t) = \delta + \varepsilon\cos 2t \), the stability diagram in the \( (\delta, \varepsilon) \)-plane consists of alternating tongues of instability (the Arnold tongues) emanating from the points \( \delta = n^2 \) on the \( \varepsilon = 0 \) axis. The width of the \( n \)-th tongue is \( O(\varepsilon^n) \) near \( \delta = n^2 \) by perturbation theory. These instability tongues correspond to **parametric resonance**: the natural frequency of the oscillator is in a rational ratio to the forcing frequency.

## The Method of Characteristics and Comparison Functions

In the study of comparison principles for Lyapunov functions, it is often useful to reduce the stability analysis to a one-dimensional comparison equation. Suppose \( V(x) \) is a Lyapunov function satisfying \( \dot{V}(x) \leq -\alpha(V(x)) \) for all \( x \) in a neighbourhood of the origin, where \( \alpha : [0, \infty) \to [0, \infty) \) is a class-\( \mathcal{K} \) function. Then the comparison equation \( \dot{v} = -\alpha(v) \), \( v(0) = V(x_0) \), has solution \( v(t) \) satisfying \( v(t) \to 0 \) as \( t \to \infty \) (since the only equilibrium of this scalar equation is \( v = 0 \)). By the comparison principle, \( V(x(t)) \leq v(t) \to 0 \), establishing asymptotic stability without knowing the exact solution. The rate of convergence depends on \( \alpha \): if \( \alpha(s) = cs \), convergence is exponential; if \( \alpha(s) = cs^p \) for \( p > 1 \), convergence is algebraic (finite or slow).

## Bifurcation Normal Forms: A Summary Table

The local bifurcation types are summarized by their normal forms and unfoldings, organized by codimension:

Codimension one, single equilibrium: saddle-node (\( \dot{x} = \mu \pm x^2 \)), transcritical (\( \dot{x} = \mu x \pm x^2 \)), pitchfork (supercritical: \( \dot{x} = \mu x - x^3 \); subcritical: \( \dot{x} = \mu x + x^3 \)).

Codimension one, equilibrium-to-cycle: Hopf (supercritical: stable cycle born from stable focus; subcritical: unstable cycle from unstable focus), homoclinic to saddle (cycle born or destroyed with infinite period).

Codimension two: Bogdanov–Takens (\( \dot{x} = y \), \( \dot{y} = \mu_1 + \mu_2 y + x^2 \pm xy \)); cusp (\( \dot{x} = \mu_1 + \mu_2 x \pm x^3 \)); Bautin (degenerate Hopf with \( \ell_1 = 0 \), \( \ell_2 \neq 0 \)).

Each of these normal forms is realized as the reduction of a general smooth vector field to a low-dimensional invariant manifold via the center manifold theorem, followed by normal form transformations to eliminate non-resonant terms.

---

## Closing Remarks

The theory of ordinary differential equations developed in these notes forms a coherent and powerful framework for analysing both the qualitative and quantitative behaviour of nonlinear dynamical systems. The logical structure is layered: existence and uniqueness (Chapter 1) establish the foundations; linear theory and Floquet theory (Chapter 2) provide the tools for linear and periodically forced systems; stability theory via Lyapunov functions (Chapter 3) gives global nonlinear information; the Poincaré–Bendixson theory (Chapter 4) exhausts the planar case; hyperbolic theory and invariant manifolds (Chapter 5) describe the local geometry near non-degenerate invariant sets; bifurcation theory (Chapter 6) explains how qualitative features change with parameters; and structural stability and chaos theory (Chapter 7) describe the deepest and most complex phenomena — the robust presence of complicated, sensitively dependent dynamics.

The unifying themes throughout are the interplay between linear and nonlinear analysis (linearization theorems, centre manifold reduction), the role of hyperbolicity as a generic condition ensuring robustness, and the use of topological methods (fixed-point theorems, index theory, the Jordan curve theorem, symbolic dynamics) to establish existence results when explicit formulas are unavailable. Together, these ideas constitute the core of modern dynamical systems theory.
