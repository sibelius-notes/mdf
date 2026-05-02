---
title: "AMATH 351: Ordinary Differential Equations 2"
subjects: "AMATH"
prof: "Xinzhi Liu"
---

*Based on lecture notes by Sibelius Peng — [PDF source](https://pdf.sibeliusp.com/1209/amath351.pdf)*

## Sources and References

**Primary textbook** — Boyce, W. E. & DiPrima, R. C. *Elementary Differential Equations and Boundary Value Problems*, 11th ed. Wiley, 2017.
**Supplementary texts** — Tenenbaum, M. & Pollard, H. *Ordinary Differential Equations*. Dover, 1985. Simmons, G. F. *Differential Equations with Applications and Historical Notes*, 3rd ed. CRC Press, 2016.
**Online resources** — MIT OCW 18.03 *Differential Equations* (Mattuck, Miller, Orloff — full lecture notes and problem sets); Paul's Online Math Notes, ODEs section (tutorial.math.lamar.edu); NIST Digital Library of Mathematical Functions (dlmf.nist.gov) for special functions.

---

# Chapter 1: Foundations of Differential Equations

## Classification and Basic Concepts

A **differential equation** is any equation relating a function to its derivatives. When the unknown function depends on a single variable — say \(y = y(x)\) — and the equation involves only ordinary derivatives \(y', y'', \ldots\), the equation is an **ordinary differential equation** (ODE). When the unknown depends on multiple variables and the equation involves partial derivatives, it is a **partial differential equation** (PDE). AMATH 351 focuses entirely on ODEs; the partial differential equations that arise from separation of variables in physics will appear in courses like AMATH 353.

The **order** of an ODE is the order of the highest derivative present. A first-order ODE involves only \(y'\); a second-order ODE involves \(y''\) and possibly \(y'\) and \(y\). An ODE is **linear** if it can be written in the form

\[
a_n(x)y^{(n)} + a_{n-1}(x)y^{(n-1)} + \cdots + a_1(x)y' + a_0(x)y = g(x),
\]

where the coefficients \(a_i(x)\) and the forcing function \(g(x)\) depend only on \(x\), not on \(y\) or its derivatives. Linearity means that the superposition principle holds: if \(y_1\) and \(y_2\) are solutions to the homogeneous equation (\(g = 0\)), so is every linear combination \(c_1 y_1 + c_2 y_2\). This principle is the reason linear ODEs are so much more tractable than nonlinear ones.

An **explicit solution** expresses \(y\) directly as a function of \(x\); an **implicit solution** satisfies a relation \(G(x,y) = 0\) from which \(y = y(x)\) can in principle be extracted. A **particular solution** has no free constants; a **general solution** contains all arbitrary constants (equal in number to the order of the equation).

## First-Order ODEs and the Picard Theorem

The canonical first-order initial value problem (IVP) is

\[
y' = f(x, y), \qquad y(x_0) = y_0.
\]

The fundamental existence-uniqueness theorem — due to Picard-Lindelöf — answers when this problem has a solution and when that solution is unique:

<div class="theorem">
<strong>Picard's Theorem:</strong> Let \(D = \{(x,y) : a \leq x \leq b,\; c \leq y \leq d\}\) be a closed rectangle with \((x_0, y_0)\) in its interior. If \(f(x,y)\) and \(\partial f/\partial y\) are continuous on \(D\), then the IVP has a unique solution \(y(x)\) on some interval \(I\) centered at \(x_0\).
</div>

The proof is constructive: define the **Picard iterates** \(y_0(x) = y_0\) and \(y_{n+1}(x) = y_0 + \int_{x_0}^x f(t, y_n(t))\,dt\). Under the Lipschitz condition on \(f\), this sequence converges uniformly to the unique solution. The construction is both theoretically important (it proves existence) and computationally useful (it gives successive approximations to the solution).

The two standard solution methods for first-order ODEs covered in AMATH 251 carry over: **separation of variables** for equations \(y' = g(x)h(y)\), and the **integrating factor method** for linear equations \(y' + p(x)y = f(x)\), where multiplying by \(\mu(x) = \exp(\int p(x)\,dx)\) converts the left side to an exact derivative \((d/dx)(\mu(x)y)\).

---

# Chapter 2: Second-Order Linear ODEs

## Structure of the Solution Space

The general second-order linear ODE in standard form is:

\[
y'' + P(x)y' + Q(x)y = R(x). \tag{2.1}
\]

The associated **homogeneous equation** is \(y'' + P(x)y' + Q(x)y = 0\).

<div class="theorem">
<strong>Existence and Uniqueness:</strong> If \(P(x)\), \(Q(x)\), and \(R(x)\) are continuous on a closed interval \([a,b]\) and \(x_0 \in [a,b]\), then for any prescribed initial values \(y(x_0) = y_0\) and \(y'(x_0) = y_1\), equation (2.1) has a unique solution on all of \([a,b]\).
</div>

The solution space has a clean linear-algebraic structure. For the **homogeneous** equation, any two solutions \(y_1\) and \(y_2\) are **linearly independent** on \([a,b]\) if neither is a constant multiple of the other on the whole interval. When they are linearly independent, every solution is a linear combination \(y_h = c_1 y_1 + c_2 y_2\).

The measure of linear independence is the **Wronskian**:

\[
W(y_1, y_2)(x) = \det \begin{pmatrix} y_1(x) & y_2(x) \\ y_1'(x) & y_2'(x) \end{pmatrix} = y_1 y_2' - y_2 y_1'.
\]

A key lemma shows that the Wronskian satisfies \(W' = -P(x)W\), giving **Abel's formula**:

\[
W(x) = W(x_0)\exp\!\left(-\int_{x_0}^x P(t)\,dt\right).
\]

Since the exponential is never zero, \(W\) is either identically zero or never zero. Two solutions are linearly independent if and only if their Wronskian is non-zero.

For the **non-homogeneous** equation, the **superposition principle** holds: if \(y_h\) is the general solution to the homogeneous equation and \(y_p\) is any particular solution to the full equation, then \(y = y_h + y_p\) is the general solution to (2.1).

## Finding Solutions: Reduction of Order and Variation of Parameters

When one solution \(y_1\) to the homogeneous equation is known, **reduction of order** finds a second linearly independent solution by seeking \(y_2 = v(x)y_1(x)\). Substituting and simplifying yields a first-order ODE for \(v'(x)\):

\[
v'(x) = \frac{1}{y_1^2(x)}\exp\!\left(-\int P(x)\,dx\right),
\]

which can be integrated directly. The resulting \(y_2\) is linearly independent from \(y_1\) by construction.

**Variation of parameters** finds a particular solution to the non-homogeneous equation. Suppose \(y_1\) and \(y_2\) are linearly independent solutions of the homogeneous equation. Seek \(y_p = v_1(x)y_1(x) + v_2(x)y_2(x)\) where \(v_1', v_2'\) satisfy:

\[
\begin{pmatrix} y_1 & y_2 \\ y_1' & y_2' \end{pmatrix}\begin{pmatrix} v_1' \\ v_2' \end{pmatrix} = \begin{pmatrix} 0 \\ R(x) \end{pmatrix}.
\]

Since the coefficient matrix has determinant \(W(y_1, y_2) \neq 0\), this system is solvable, giving:

\[
y_p(x) = y_1(x)\int_{}^{x} \frac{-y_2(t)R(t)}{W(y_1,y_2)(t)}\,dt + y_2(x)\int_{}^{x} \frac{y_1(t)R(t)}{W(y_1,y_2)(t)}\,dt.
\]

Variation of parameters works for any continuous \(R(x)\), making it the most general method for particular solutions — though the integrals may not have closed forms.

## Boundary Value Problems

**Initial value problems** (IVPs) specify both conditions at the same point: \(y(x_0) = \alpha\), \(y'(x_0) = \beta\). **Boundary value problems** (BVPs) specify conditions at different points: \(y(a) = \alpha\), \(y(b) = \beta\). The existence-uniqueness theory is strikingly different: a BVP may have no solution, exactly one solution, or infinitely many solutions, regardless of the smoothness of the coefficients. This richer behavior is tied to the eigenvalue problems explored in Chapter 4.

---

# Chapter 3: Series Solutions and Special Functions

## Power Series at Ordinary Points

When the coefficients of an ODE are not constant, explicit solutions in terms of elementary functions are rare. **Power series methods** give solutions as infinite series \(y = \sum_{n=0}^\infty a_n (x - x_0)^n\), valid wherever the series converges.

A point \(x_0\) is an **ordinary point** of \(y'' + P(x)y' + Q(x)y = 0\) if \(P\) and \(Q\) are analytic at \(x_0\) — that is, representable by convergent power series in a neighborhood of \(x_0\). At an ordinary point, the equation has two linearly independent power series solutions, both convergent at least within the radius of convergence of \(P\) and \(Q\). Substituting \(y = \sum a_n x^n\) into the ODE and equating like powers of \(x\) gives a **recurrence relation** determining all coefficients \(a_n\) from the first two (which encode the two initial conditions).

## Frobenius Method at Singular Points

A point \(x_0\) is a **regular singular point** of the ODE if \(P(x)\) has at most a simple pole and \(Q(x)\) has at most a double pole at \(x_0\). More precisely, requiring \((x-x_0)P(x)\) and \((x-x_0)^2Q(x)\) to be analytic at \(x_0\).

The **Frobenius method** seeks a solution of the form

\[
y = (x - x_0)^r \sum_{n=0}^\infty a_n (x - x_0)^n, \quad a_0 \neq 0,
\]

where the exponent \(r\) need not be an integer or even rational. Substituting into the ODE and extracting the coefficient of the lowest power of \(x - x_0\) gives the **indicial equation**, a quadratic in \(r\) whose roots \(r_1, r_2\) (with \(r_1 \geq r_2\)) determine the character of the solutions:

- If \(r_1 - r_2 \notin \mathbb{Z}\): two independent Frobenius series solutions with exponents \(r_1\) and \(r_2\).
- If \(r_1 = r_2\): one Frobenius series and a second solution involving \(\ln(x - x_0)\).
- If \(r_1 - r_2 \in \mathbb{Z}_{>0}\): the smaller root \(r_2\) may require a logarithmic term in the second solution.

The **extended method of Frobenius** handles all three cases systematically.

## Bessel's Equation and Bessel Functions

The most important ODE with a regular singular point at the origin is **Bessel's equation** of order \(p\):

\[
x^2 y'' + xy' + (x^2 - p^2)y = 0.
\]

This equation arises when solving Laplace's or Helmholtz's equation in cylindrical coordinates — in heat conduction, wave propagation in cylindrical waveguides, and diffraction problems. The Frobenius method applied at \(x = 0\) yields the **Bessel function of the first kind** of order \(p\):

\[
J_p(x) = \sum_{n=0}^\infty \frac{(-1)^n}{n!\,\Gamma(n+p+1)}\left(\frac{x}{2}\right)^{2n+p},
\]

where \(\Gamma\) is the gamma function (the natural extension of the factorial: \(\Gamma(n+1) = n!\) for non-negative integers). For non-integer \(p\), \(J_p\) and \(J_{-p}\) are linearly independent. For integer \(p\), a second solution \(Y_p(x)\) (the Bessel function of the second kind, or Neumann function) involving \(\ln x\) must be constructed.

The large-\(x\) asymptotic behavior of Bessel functions is oscillatory:

\[
J_p(x) \sim \sqrt{\frac{2}{\pi x}}\cos\!\left(x - \frac{p\pi}{2} - \frac{\pi}{4}\right), \quad x \to \infty.
\]

This makes Bessel functions the cylindrical analogue of trigonometric functions. The zeros of \(J_p\) are the eigenvalues for vibration problems on circular membranes, and the zeros of \(J_0\) appear in the resonant modes of circular waveguides.

Other important special functions appearing as solutions to named ODEs include **Legendre polynomials** \(P_n(x)\) (from Legendre's equation \((1-x^2)y'' - 2xy' + n(n+1)y = 0\), fundamental in spherical harmonics), **Laguerre polynomials** (from \(xy'' + (1-x)y' + ay = 0\), appearing in the quantum hydrogen atom's radial wavefunctions), **Hermite polynomials** (from \(y'' - 2xy' + 2ny = 0\), the eigenfunctions of the quantum harmonic oscillator), and the **hypergeometric function** (from Gauss's equation, which subsumes all the above as special cases).

---

# Chapter 4: Sturm-Liouville Theory and Boundary Value Problems

## Qualitative Analysis of ODEs

Before the Sturm-Liouville framework, Sturm established qualitative results about the zeros of solutions to \(y'' + q(x)y = 0\).

<div class="theorem">
<strong>Sturm Comparison Theorem:</strong> Let \(y_1\) and \(y_2\) be non-trivial solutions of \(y'' + q_1(x)y = 0\) and \(y'' + q_2(x)y = 0\) respectively on \([a,b]\), where \(q_2(x) \geq q_1(x) > 0\). Then \(y_2\) has at least one zero between any two consecutive zeros of \(y_1\).
</div>

Intuitively: a larger restoring force \(q_2 > q_1\) causes faster oscillation. The theorem implies that solutions of \(y'' + q(x)y = 0\) oscillate faster wherever \(q\) is larger and slower where \(q\) is smaller — a qualitative statement independent of explicit formulas.

## Sturm-Liouville Problems

The **vibrating string** (or more generally, many physical systems with spatial boundary conditions) leads to eigenvalue problems of the form

\[
\mathcal{L}y + \lambda w(x)y = 0, \qquad y(a) = y(b) = 0,
\]

where \(\mathcal{L}y = (p(x)y')' - q(x)y\) is the **Sturm-Liouville operator** and \(w(x) > 0\) is a weight function. A **regular Sturm-Liouville problem** requires \(p, p', q, w\) to be continuous on \([a,b]\) with \(p > 0\) and \(w > 0\) throughout.

<div class="theorem">
<strong>Sturm-Liouville Theorem:</strong> A regular Sturm-Liouville problem has the following properties:
<ul>
<li>The eigenvalues \(\lambda_1 < \lambda_2 < \lambda_3 < \cdots\) form a real, infinite, strictly increasing sequence with \(\lambda_n \to +\infty\).</li>
<li>To each eigenvalue there corresponds a unique (up to scalar multiple) eigenfunction \(y_n(x)\).</li>
<li>The eigenfunctions are orthogonal with respect to the weight \(w\): \(\int_a^b y_m(x) y_n(x) w(x)\,dx = 0\) for \(m \neq n\).</li>
<li>The eigenfunctions form a complete set: any piecewise smooth function on \([a,b]\) can be expanded in a generalized Fourier series \(f(x) = \sum_{n=1}^\infty c_n y_n(x)\), where \(c_n = \int_a^b f(x)y_n(x)w(x)\,dx / \int_a^b y_n(x)^2 w(x)\,dx\).</li>
</ul>
</div>

The Sturm-Liouville theorem is a sweeping generalization of the Fourier series theorem: ordinary Fourier series (with \(p = w = 1\), \(q = 0\), periodic boundary conditions) are just one special case. The theorem underlies the spectral theory of self-adjoint operators — a connection that extends naturally to quantum mechanics and functional analysis.

---

# Chapter 5: Systems of First-Order Differential Equations

## Reducing Higher-Order ODEs to Systems

Every \(n\)th-order ODE \(y^{(n)} = f(x, y, y', \ldots, y^{(n-1)})\) can be converted to a system of \(n\) first-order equations by introducing \(y_1 = y\), \(y_2 = y'\), \ldots, \(y_n = y^{(n-1)}\):

\[
\mathbf{y}' = \mathbf{F}(x, \mathbf{y}), \qquad \mathbf{y} = (y_1, \ldots, y_n)^T.
\]

This reduction makes systems the most general framework. Existence and uniqueness for systems: if \(\mathbf{F}\) and its partial derivatives with respect to \(\mathbf{y}\) are continuous in a neighborhood of \((x_0, \mathbf{y}_0)\), then there exists a unique local solution.

## The Picard Iteration and Existence

The **Picard method** for systems defines \(\mathbf{y}^{(0)}(x) = \mathbf{y}_0\) and

\[
\mathbf{y}^{(k+1)}(x) = \mathbf{y}_0 + \int_{x_0}^x \mathbf{F}(t, \mathbf{y}^{(k)}(t))\,dt.
\]

Under a Lipschitz condition, \(\|\mathbf{F}(x, \mathbf{u}) - \mathbf{F}(x, \mathbf{v})\| \leq K\|\mathbf{u} - \mathbf{v}\|\), the iterates converge uniformly on a sufficiently small interval. The limit is the unique solution — this is **Picard's theorem for systems**.

## Linear Systems

A **linear first-order system** has the form \(\mathbf{y}' = A(x)\mathbf{y} + \mathbf{g}(x)\), where \(A(x)\) is an \(n \times n\) matrix-valued function. When \(\mathbf{g} = 0\), the system is **homogeneous**.

The solution space of the homogeneous system has dimension \(n\): there are \(n\) linearly independent solutions \(\mathbf{y}_1, \ldots, \mathbf{y}_n\), and the general homogeneous solution is \(\sum c_i \mathbf{y}_i\). The **fundamental matrix** \(\Phi(x)\) is the matrix whose columns are \(\mathbf{y}_1, \ldots, \mathbf{y}_n\); the general homogeneous solution is \(\mathbf{y} = \Phi(x)\mathbf{c}\) for a constant vector \(\mathbf{c}\). The **Wronskian** of the system is \(W(x) = \det\Phi(x)\), satisfying Abel's formula: \(W(x) = W(x_0)\exp\!\bigl(\int_{x_0}^x \mathrm{tr}\,A(t)\,dt\bigr)\).

By variation of parameters, the particular solution to the non-homogeneous system is:

\[
\mathbf{y}_p(x) = \Phi(x)\int_{x_0}^x \Phi^{-1}(t)\mathbf{g}(t)\,dt.
\]

## Eigenvalue Methods for Constant-Coefficient Systems

When \(A\) is constant (\(A(x) = A\)), the system \(\mathbf{y}' = A\mathbf{y}\) has solutions of the form \(\mathbf{y} = e^{\lambda x}\mathbf{v}\), provided \(A\mathbf{v} = \lambda\mathbf{v}\) — that is, \(\lambda\) is an eigenvalue and \(\mathbf{v}\) is a corresponding eigenvector.

- **Distinct real eigenvalues**: \(n\) independent solutions \(e^{\lambda_i x}\mathbf{v}_i\).
- **Complex conjugate eigenvalue pair** \(\lambda = \alpha \pm \beta i\): real solutions formed from the real and imaginary parts of \(e^{(\alpha+\beta i)x}\mathbf{v}\) — giving \(e^{\alpha x}(\cos\beta x)\,\mathrm{Re}\,\mathbf{v} - e^{\alpha x}(\sin\beta x)\,\mathrm{Im}\,\mathbf{v}\) and similarly.
- **Repeated eigenvalues**: generalized eigenvectors (Jordan form) are needed.

## The Matrix Exponential

For constant \(A\), the unique solution to \(\mathbf{y}' = A\mathbf{y}\), \(\mathbf{y}(0) = \mathbf{y}_0\), is \(\mathbf{y}(x) = e^{Ax}\mathbf{y}_0\), where the **matrix exponential** is defined by the convergent series:

\[
e^{Ax} = I + Ax + \frac{A^2x^2}{2!} + \frac{A^3x^3}{3!} + \cdots = \sum_{k=0}^\infty \frac{(Ax)^k}{k!}.
\]

Computing \(e^{Ax}\) directly is often done via diagonalization: if \(A = PDP^{-1}\) with \(D = \mathrm{diag}(\lambda_1, \ldots, \lambda_n)\), then \(e^{Ax} = Pe^{Dx}P^{-1} = P\,\mathrm{diag}(e^{\lambda_1 x}, \ldots, e^{\lambda_n x})P^{-1}\).

## Asymptotic Behavior

For the constant-coefficient system \(\mathbf{y}' = A\mathbf{y}\), the asymptotic behavior of solutions as \(x \to \infty\) is entirely determined by the eigenvalues of \(A\):

- If all eigenvalues have negative real part, then \(\mathbf{y}(x) \to \mathbf{0}\) as \(x \to \infty\) — the equilibrium \(\mathbf{0}\) is **asymptotically stable**.
- If any eigenvalue has positive real part, solutions grow unboundedly — the equilibrium is **unstable**.
- If all eigenvalues have non-positive real part with pure imaginary eigenvalues non-defective, the equilibrium is **stable** (but not asymptotically).

This classification — the stability analysis of linear systems — is the foundation of the qualitative theory of dynamical systems and control theory.

---

# Chapter 6: Laplace Transform Methods

## The Laplace Transform

The **Laplace transform** converts a differential equation into an algebraic equation by transforming the time/space domain into a frequency domain. For a function \(f(t)\) defined for \(t \geq 0\), the Laplace transform is:

\[
F(s) = \mathcal{L}\{f\}(s) = \int_0^\infty e^{-st}f(t)\,dt,
\]

defined for \(s > s_0\) (where \(s_0\) depends on the growth rate of \(f\)). The fundamental property is the differentiation rule:

\[
\mathcal{L}\{f'\}(s) = sF(s) - f(0), \quad \mathcal{L}\{f''\}(s) = s^2F(s) - sf(0) - f'(0).
\]

This converts the ODE \(ay'' + by' + cy = g(t)\) into an algebraic equation for \(F(s) = \mathcal{L}\{y\}\):

\[
(as^2 + bs + c)F(s) = G(s) + \text{(initial conditions)},
\]

which is then solved for \(F(s)\) and inverted using the inverse Laplace transform (typically via partial fractions and a table of transforms).

## The Convolution Theorem

For two functions \(f\) and \(g\), their **convolution** is \((f * g)(t) = \int_0^t f(\tau)g(t-\tau)\,d\tau\).

<div class="theorem">
<strong>Convolution Theorem:</strong> \(\mathcal{L}\{f * g\} = \mathcal{L}\{f\} \cdot \mathcal{L}\{g\}\).
</div>

The convolution theorem is especially useful when the Laplace transform of the forcing function factors into known transforms. It also gives the particular solution to a linear ODE with arbitrary forcing \(g(t)\) in terms of the **impulse response** (the solution with initial conditions zero and \(g(t) = \delta(t)\)).

## The Dirac Delta Function

The **Dirac delta** \(\delta(t - t_0)\) models an impulsive forcing — a unit impulse applied at time \(t_0\). It is not a function in the classical sense but a **distribution**, defined by its action on test functions: \(\int_{-\infty}^\infty \phi(t)\delta(t - t_0)\,dt = \phi(t_0)\) for any continuous \(\phi\). Its Laplace transform is \(\mathcal{L}\{\delta(t-t_0)\} = e^{-st_0}\).

Using the Laplace transform, the response of the system \(y'' + ay' + by = \delta(t - t_0)\) (with zero initial conditions) is the **Green's function** or impulse response \(h(t - t_0)\). By the convolution theorem, the response to any forcing \(g(t)\) is \(y_p(t) = \int_0^t h(t - \tau)g(\tau)\,d\tau\). This is the Laplace-domain expression of variation of parameters.

**Periodic impulse trains** \(\sum_{n=0}^\infty \delta(t - nT)\) model repeated impulsive forcing (resonance in mechanical systems, sampling in signal processing). Their Laplace transforms are geometric series that sum to \(1/(1 - e^{-Ts})\), enabling straightforward analysis of periodically forced systems.

---

# Chapter 7: Perturbation Theory

## Regular Perturbation

Many important equations in science involve a parameter \(\epsilon\) that is small, with the \(\epsilon = 0\) case exactly solvable. **Regular perturbation theory** expands the solution in a power series in \(\epsilon\):

\[
y(x;\epsilon) = y_0(x) + \epsilon y_1(x) + \epsilon^2 y_2(x) + \cdots
\]

Substituting into the equation and equating powers of \(\epsilon\) gives a hierarchy of linear equations for \(y_0, y_1, y_2, \ldots\) — each solvable in terms of the previous ones. For example, the pendulum equation \(\theta'' + (g/L)\sin\theta = 0\) with \(\epsilon = \theta_0\) (small amplitude) gives, to leading order, simple harmonic motion; to next order, the period correction \(T = T_0(1 + \theta_0^2/16 + \cdots)\) explaining why large-amplitude pendula are slightly slower.

The critical limitation of regular perturbation is that the expansion may be non-uniform — valid near \(t = 0\) but breaking down as \(t \to \infty\), or near boundary layers where the solution changes rapidly. **Secular terms** (growing like \(t\sin t\) or similar) signal this failure. **Singular perturbation theory** (matched asymptotic expansions, the method of multiple scales) addresses these failures and is the subject of more advanced courses.

---

# Chapter 8: Beyond This Course

## Natural Next Topics

### Partial Differential Equations

AMATH 351 is the gateway to PDEs, which govern the continuous models of physics: the heat equation \(\partial_t u = \kappa\nabla^2 u\), the wave equation \(\partial_{tt}u = c^2\nabla^2 u\), Laplace's equation \(\nabla^2 u = 0\), and Schrödinger's equation \(i\hbar\partial_t\psi = H\psi\). The Sturm-Liouville theory from Chapter 4 is directly applicable: separation of variables reduces a PDE to an ODE eigenvalue problem, and the Sturm-Liouville theorem guarantees completeness of the resulting eigenfunction expansions (Fourier series, Bessel series, Legendre series — depending on the geometry).

AMATH 353 at Waterloo covers PDEs with exactly this program. The mathematics deepens into Sobolev spaces and weak solutions, fundamental for understanding when "solutions" can be singular.

### Dynamical Systems and Nonlinear ODEs

The eigenvalue-based stability analysis of Chapter 5 (linear systems) generalizes to nonlinear systems via the **Hartman-Grobman theorem**: the local behavior of a nonlinear system near a hyperbolic equilibrium (all eigenvalues with non-zero real part) is topologically conjugate to that of its linearization. Phase-plane analysis — sketching the vector field \((y', z')\) for a two-dimensional system \((y' = f, z' = g)\) — gives global qualitative information without solving the equations.

The two-dimensional phase plane reveals all possible behaviors of autonomous planar systems: stable and unstable nodes, spirals, centers, and saddle points. Limit cycles — isolated periodic orbits — are the hallmark of nonlinear systems; the Poincaré-Bendixson theorem characterizes when they must exist in the plane. In three or more dimensions, chaos becomes possible (the Lorenz system is a famous example of a three-dimensional ODE exhibiting chaotic solutions).

### Delay Differential Equations and Functional Differential Equations

The equation \(y'(t) = f(t, y(t), y(t - \tau))\) — in which the right-hand side depends not just on the current state but on a past state — is a **delay differential equation** (DDE). These arise naturally in biology (population models where gestation takes time), engineering (control systems with feedback delays), and physics (radiation reaction forces). The theory is substantially more complex than for ODEs: the initial data must be specified over an entire interval \([-\tau, 0]\), and the solution operator is infinite-dimensional. Prof. Xinzhi Liu's own research contributions lie in stability analysis of these and more general functional differential equations.

### Numerical Methods for ODEs

Explicit formulas exist only for special equations; the vast majority of ODEs arising in applications must be solved numerically. The Euler method (one-step, first-order accurate: \(y_{n+1} = y_n + hf(x_n, y_n)\)) is the simplest but rarely used in practice. **Runge-Kutta methods** (especially the classical RK4) give higher-order accuracy with good stability; **multistep methods** (Adams-Bashforth, Adams-Moulton) exploit previous steps for efficiency. For **stiff equations** — where some components vary on much faster timescales than others — implicit methods are essential; the backslash solver in MATLAB and scipy's `solve_ivp` use adaptive implicit solvers (Radau, BDF methods) automatically.

## Follow-up Courses and Reading

### At the University of Waterloo

**AMATH 353** (*PDEs for Engineers and Scientists*) covers the wave, heat, and Laplace equations using Fourier and separation-of-variable methods — the natural continuation. **AMATH 451** (*Introduction to Dynamical Systems*) develops the phase-plane and bifurcation theory. **AMATH 455** (*Control Theory*) applies the theory of systems of ODEs to feedback control, stability via Lyapunov theory, and optimal control. For more mathematical depth, **PMATH 353** (*Real Analysis II*) provides the functional-analytic foundations of Sturm-Liouville theory.

### Standard Texts

**Boyce & DiPrima** *Elementary Differential Equations and Boundary Value Problems* (11th ed.) is the standard American undergraduate text, clear and comprehensive. **Tenenbaum & Pollard** *Ordinary Differential Equations* (Dover) is a classic encyclopedic treatment covering an enormous range of methods. **Hirsch, Smale & Devaney** *Differential Equations, Dynamical Systems, and an Introduction to Chaos* (3rd ed., Academic Press) is the best entry point for the dynamical systems perspective. **Strauss** *Partial Differential Equations: An Introduction* (2nd ed., Wiley) is excellent for the PDE follow-up.

## Open Problems and Active Research

### Hilbert's 16th Problem (Part Two)

The second part of **Hilbert's 16th problem** asks: for a polynomial planar vector field of degree \(n\), what is the maximum number of limit cycles? Even for \(n = 2\) (quadratic vector fields), the problem is unsolved; it is not known whether quadratic systems can have more than four limit cycles. This is one of the most famous open problems in ODE theory. Recent work by Ilyashenko and others uses holomorphic foliations and complex function theory to attack the problem, but a complete answer remains out of reach.

### Stability of Delay Differential Equations

The stability analysis of DDEs with time-varying or state-dependent delays, as well as neutral and functional differential equations of infinite delay type, remains active research. The connection to Lyapunov-Krasovskii functionals (infinite-dimensional generalizations of Lyapunov functions) and to robust stability under perturbations is particularly relevant to control theory and neural network dynamics. This is an area where Waterloo's Applied Mathematics faculty (including Prof. Liu) have made significant contributions.

### Geometric Integration

**Geometric integration** seeks numerical methods that exactly preserve geometric properties of the exact flow — symplecticity (for Hamiltonian systems), conservation laws, or reversibility. Standard methods like RK4 do not preserve these properties. **Symplectic integrators** (Störmer-Verlet, Ruth-Forest, SPRK methods) preserve the symplectic structure exactly and are far superior for long-time integration of Hamiltonian systems (planetary mechanics, molecular dynamics). The mathematical framework is Lie group methods and variational integrators — an active area combining numerical analysis, differential geometry, and mechanics.
