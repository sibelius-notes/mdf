---
title: "CHEM 240: Mathematical Methods for Chemistry"
subjects: "CHEM"
prof: "Dr. W. Scott Hopkins"
---

## Sources and References
**Supplementary texts** — Kreyszig, E. *Advanced Engineering Mathematics*, 10th ed. Wiley, 2011. | Boas, M.L. *Mathematical Methods in the Physical Sciences*, 3rd ed. Wiley, 2006. | Stroud, K.A. & Booth, D.J. *Engineering Mathematics*, 8th ed. Macmillan, 2020.
**Online resources** — MIT OpenCourseWare 18.03 (Differential Equations); Wolfram MathWorld (mathworld.wolfram.com); NIST Digital Library of Mathematical Functions (dlmf.nist.gov)

---

# Chapter 1: Numbers, Variables, and Units

## Section 1.1: Real Numbers and Their Properties

The foundation of all quantitative reasoning in chemistry rests upon a clear understanding of the number systems available to us. The **real numbers**, denoted \( \mathbb{R} \), form a complete ordered field — meaning that every Cauchy sequence of real numbers converges to a limit that is itself a real number, a property called completeness that distinguishes \( \mathbb{R} \) from the rationals \( \mathbb{Q} \). For the practicing chemist, real numbers manifest in measured quantities such as bond lengths, dissociation constants, Gibbs energies, and spectroscopic frequencies, each carrying a physical dimension and an associated uncertainty.

The real line can be partitioned into several nested subsets. The **natural numbers** \( \mathbb{N} = \{1, 2, 3, \ldots\} \) describe discrete countable quantities — the number of electrons in a shell, the number of molecules in a stoichiometric ratio. The **integers** \( \mathbb{Z} \) extend the naturals to include zero and negative values, relevant for oxidation states and charge balances. The **rational numbers** \( \mathbb{Q} \) encompass all fractions \( p/q \) where \( p, q \in \mathbb{Z} \) and \( q \neq 0 \); these can always be expressed as terminating or repeating decimals. The **irrational numbers** — quantities like \( \sqrt{2} \), \( \pi \), and \( e \) — cannot be expressed as the ratio of two integers and have non-repeating, non-terminating decimal expansions. Numbers such as \( \pi \) appear pervasively in chemistry: in the normalization of hydrogen wavefunctions, in the expression for the Bohr radius, and in the prefactor of many thermodynamic relations.

### Subsection 1.1.1: Factorization, Factors, and Factorials

**Factorization** refers to the decomposition of an integer or polynomial into a product of simpler components called **factors**. For integers, the Fundamental Theorem of Arithmetic guarantees a unique prime factorization (up to ordering): every integer \( n > 1 \) can be written uniquely as \( n = p_1^{a_1} p_2^{a_2} \cdots p_k^{a_k} \), where each \( p_i \) is prime and each \( a_i \geq 1 \). This theorem undergirds much of combinatorics that appears in statistical mechanics.

The **factorial** of a non-negative integer \( n \) is defined as

\[ n! = n \cdot (n-1) \cdot (n-2) \cdots 2 \cdot 1, \qquad 0! = 1. \]

Factorials arise constantly in combinatorial chemistry and statistical mechanics, particularly in computing the number of microstates \( \Omega \) accessible to a system. **Stirling's approximation** provides a powerful simplification for large \( n \):

\[ \ln n! \approx n \ln n - n, \]

or more precisely \( \ln n! \approx n \ln n - n + \tfrac{1}{2} \ln(2\pi n) \). This approximation is indispensable in deriving the Boltzmann entropy \( S = k_B \ln \Omega \) for macroscopic systems, where \( n \) may be of order \( 10^{23} \).

### Subsection 1.1.2: Decimal Representation and Significant Figures

Every real number possesses a decimal representation, either exact (for rationals that terminate or repeat) or infinite and non-repeating (for irrationals). In experimental chemistry, a measured value such as \( 2.997 \times 10^8 \, \mathrm{m\,s^{-1}} \) reflects not only the numerical value of the speed of light but also the precision with which it has been determined. **Scientific notation** \( a \times 10^b \) (with \( 1 \leq |a| < 10 \)) allows both very large and very small numbers to be written compactly, a practical necessity when the Avogadro constant \( N_A = 6.022 \times 10^{23} \, \mathrm{mol}^{-1} \) and the Bohr radius \( a_0 = 5.292 \times 10^{-11} \, \mathrm{m} \) must appear in the same equation.

## Section 1.2: The Algebra of Real Numbers

The real numbers under addition and multiplication form a **field**: the operations are closed, associative, and commutative; there exist additive and multiplicative identity elements (0 and 1 respectively); every element has an additive inverse, and every non-zero element has a multiplicative inverse. Beyond these field axioms, the ordering relation \( < \) on \( \mathbb{R} \) is compatible with the arithmetic operations — multiplying both sides of an inequality by a negative number reverses the inequality, a fact that must be respected when manipulating thermodynamic stability conditions.

Key algebraic identities that recur throughout physical chemistry include the difference of squares \( a^2 - b^2 = (a+b)(a-b) \), the perfect square expansion \( (a \pm b)^2 = a^2 \pm 2ab + b^2 \), and the binomial theorem

\[ (a + b)^n = \sum_{k=0}^{n} \binom{n}{k} a^{n-k} b^k, \]

where \( \binom{n}{k} = \frac{n!}{k!(n-k)!} \) is the binomial coefficient. The binomial theorem extends to non-integer exponents via the **generalized binomial series**, valid for \( |x| < 1 \):

\[ (1 + x)^\alpha = \sum_{k=0}^{\infty} \binom{\alpha}{k} x^k = 1 + \alpha x + \frac{\alpha(\alpha-1)}{2!}x^2 + \cdots, \]

a result used, for example, in approximating partition functions in the limit of small perturbations.

## Section 1.3: Complex Numbers

Real numbers are insufficient to describe the full mathematical structure of quantum mechanics and many areas of spectroscopy. The introduction of the **imaginary unit** \( i \), defined by the property \( i^2 = -1 \), allows us to construct the **complex number field** \( \mathbb{C} \).

<div class="definition">
A <strong>complex number</strong> \( z \) is an expression of the form \( z = a + bi \), where \( a, b \in \mathbb{R} \). The quantity \( a = \operatorname{Re}(z) \) is the <em>real part</em> of \( z \) and \( b = \operatorname{Im}(z) \) is the <em>imaginary part</em>. The <em>complex conjugate</em> of \( z \) is \( \bar{z} = a - bi \), and the <em>modulus</em> (or absolute value) is \( |z| = \sqrt{a^2 + b^2} \). The <em>argument</em> (or phase) is the angle \( \theta = \arg(z) = \arctan(b/a) \), measured counterclockwise from the positive real axis.
</div>

### Subsection 1.3.1: Algebra of Complex Numbers

The standard arithmetic operations extend naturally to \( \mathbb{C} \). Addition and subtraction are performed component-wise:

\[ (a + bi) \pm (c + di) = (a \pm c) + (b \pm d)i. \]

Multiplication uses the distributive law together with \( i^2 = -1 \):

\[ (a + bi)(c + di) = (ac - bd) + (ad + bc)i. \]

Division is accomplished by multiplying numerator and denominator by the complex conjugate of the denominator:

\[ \frac{a + bi}{c + di} = \frac{(a + bi)(c - di)}{c^2 + d^2} = \frac{ac + bd}{c^2 + d^2} + \frac{bc - ad}{c^2 + d^2} i. \]

The product of a complex number with its conjugate is always a non-negative real number: \( z \bar{z} = |z|^2 = a^2 + b^2 \). This is exploited when computing probabilities in quantum mechanics, where the probability density for a particle is \( |\psi|^2 = \psi \bar{\psi} \), with \( \psi \) the complex-valued wavefunction.

### Subsection 1.3.2: Euler's Formula and the Exponential Form

One of the most remarkable identities in all of mathematics connects the exponential function to the trigonometric functions through the complex variable.

<div class="theorem">
<strong>Euler's Formula.</strong> For any real angle \( \theta \),
\[ e^{i\theta} = \cos\theta + i\sin\theta. \]
As a special case at \( \theta = \pi \), one obtains <em>Euler's identity</em>: \( e^{i\pi} + 1 = 0 \).
</div>

The derivation follows directly from comparing the Taylor series of \( e^{i\theta} \), \( \cos\theta \), and \( \sin\theta \). Define the exponential series evaluated at \( i\theta \):

\[ e^{i\theta} = \sum_{n=0}^{\infty} \frac{(i\theta)^n}{n!} = 1 + i\theta + \frac{(i\theta)^2}{2!} + \frac{(i\theta)^3}{3!} + \cdots \]

Using \( i^0 = 1, i^1 = i, i^2 = -1, i^3 = -i, i^4 = 1 \) in a four-cycle and collecting real and imaginary parts:

\[ e^{i\theta} = \left(1 - \frac{\theta^2}{2!} + \frac{\theta^4}{4!} - \cdots\right) + i\left(\theta - \frac{\theta^3}{3!} + \frac{\theta^5}{5!} - \cdots\right) = \cos\theta + i\sin\theta. \]

Any complex number can now be written in **polar form** \( z = r e^{i\theta} \), where \( r = |z| \) and \( \theta = \arg(z) \). This form is invaluable when raising complex numbers to powers or extracting roots, since

\[ z^n = r^n e^{in\theta} = r^n(\cos n\theta + i \sin n\theta), \]

a result known as **De Moivre's theorem**. In chemistry, Euler's formula appears naturally in the description of oscillatory phenomena: a simple sinusoidal wave \( A\cos(\omega t + \phi) \) can be represented as the real part of \( A e^{i(\omega t + \phi)} \), dramatically simplifying the algebra of superposition and interference.

### Subsection 1.3.3: Complex Functions and Periodicity

A **complex function** \( f: \mathbb{C} \to \mathbb{C} \) maps complex inputs to complex outputs. The exponential function \( e^z \) for complex \( z = x + iy \) decomposes as \( e^{x+iy} = e^x e^{iy} = e^x(\cos y + i \sin y) \), showing that the real part of the exponent controls the amplitude while the imaginary part controls the phase. The function \( e^{i\theta} \) is **periodic** with period \( 2\pi \): incrementing \( \theta \) by \( 2\pi \) returns the same point on the unit circle in the complex plane. This periodicity is the mathematical origin of the discrete quantum numbers that emerge from boundary conditions on wavefunctions.

### Subsection 1.3.4: Graphical Representation in the Argand Plane

The **Argand diagram** (or complex plane) provides a geometric representation of complex numbers by identifying the real part with the horizontal axis and the imaginary part with the vertical axis. A complex number \( z = a + bi \) appears as the point \( (a, b) \), or equivalently as a vector from the origin to that point. Addition of complex numbers corresponds to vector addition; multiplication by \( e^{i\phi} \) corresponds to a rotation of the vector through angle \( \phi \) about the origin. This geometric interpretation is fundamental to understanding the phase relationships in NMR spectroscopy, where the rotating-frame picture treats the magnetization vector as a complex quantity evolving in the transverse plane.

## Section 1.4: Physical Units and Dimensional Analysis

No numerical result in chemistry is meaningful without its associated unit. The **International System of Units (SI)** defines seven base quantities — length (metre, m), mass (kilogram, kg), time (second, s), electric current (ampere, A), thermodynamic temperature (kelvin, K), amount of substance (mole, mol), and luminous intensity (candela, cd) — from which all other physical quantities are derived. For instance, energy has the derived SI unit of joule: \( \mathrm{J} = \mathrm{kg \cdot m^2 \cdot s^{-2}} \).

**Dimensional analysis** exploits the fact that any valid physical equation must be dimensionally homogeneous: every term must carry the same dimensions. This principle provides a powerful check on algebraic manipulations and can even be used to derive the form of physical laws up to dimensionless constants. For example, the kinetic energy of a particle must have dimensions of \( [\mathrm{mass}][\mathrm{length}]^2[\mathrm{time}]^{-2} \), which immediately constrains its form to something proportional to \( mv^2 \).

---

# Chapter 2: Topics from Calculus

## Section 2.1: Limits and Continuity

Calculus is built upon the concept of a **limit**. Intuitively, the limit of a function \( f(x) \) as \( x \) approaches \( c \) describes the value that \( f \) approaches, without necessarily equaling \( f(c) \).

<div class="definition">
We say \( \lim_{x \to c} f(x) = L \) if, for every \( \varepsilon > 0 \), there exists a \( \delta > 0 \) such that whenever \( 0 < |x - c| < \delta \), we have \( |f(x) - L| < \varepsilon \). This \( \varepsilon \)–\( \delta \) definition formalizes the intuitive notion that \( f(x) \) can be made arbitrarily close to \( L \) by choosing \( x \) sufficiently close to \( c \).
</div>

A function \( f \) is **continuous** at \( c \) if (i) \( f(c) \) is defined, (ii) \( \lim_{x \to c} f(x) \) exists, and (iii) the two are equal. Physically, continuity is expected of essentially all measurable properties — a potential energy surface, for instance, must be a continuous function of nuclear coordinates. Discontinuities can arise, however, at phase boundaries or in the sharp-cutoff approximation for a particle-in-a-box potential.

Important limit results that recur throughout physical chemistry include:

\[ \lim_{x \to 0} \frac{\sin x}{x} = 1, \qquad \lim_{x \to \infty} \left(1 + \frac{1}{x}\right)^x = e, \qquad \lim_{n \to \infty} \frac{\ln n}{n} = 0. \]

## Section 2.2: Differentiation

### Subsection 2.2.1: Differentiation from First Principles

The **derivative** of a function \( f \) at a point \( x \) measures the instantaneous rate of change of \( f \) with respect to \( x \). It is defined as the limit of the difference quotient:

\[ f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}. \]

Geometrically, \( f'(x) \) is the slope of the tangent line to the graph of \( f \) at the point \( (x, f(x)) \). In chemistry, derivatives describe rates: the rate of a chemical reaction \( r = -d[\mathrm{A}]/dt \), the dependence of Gibbs energy on pressure \( (\partial G/\partial P)_T = V \), and the force on a nucleus as the negative gradient of the potential energy surface.

### Subsection 2.2.2: Rules of Differentiation

The rules of differentiation streamline the computation of derivatives without returning to the limit definition each time.

<div class="theorem">
<strong>Standard Differentiation Rules.</strong>

<em>Sum rule:</em> \( (f \pm g)' = f' \pm g' \)

<em>Product rule:</em> \( (fg)' = f'g + fg' \)

<em>Quotient rule:</em> \( (f/g)' = (f'g - fg')/g^2 \)

<em>Chain rule:</em> If \( h(x) = f(g(x)) \), then \( h'(x) = f'(g(x)) \cdot g'(x) \)

<em>Power rule:</em> \( \frac{d}{dx} x^n = n x^{n-1} \) for any real \( n \)
</div>

The derivatives of the elementary functions are:

\[ \frac{d}{dx} e^x = e^x, \quad \frac{d}{dx} \ln x = \frac{1}{x}, \quad \frac{d}{dx} \sin x = \cos x, \quad \frac{d}{dx} \cos x = -\sin x. \]

### Subsection 2.2.3: Implicit Functions and Implicit Differentiation

When a relationship between \( x \) and \( y \) is given implicitly by \( F(x, y) = 0 \) rather than explicitly as \( y = f(x) \), one differentiates both sides with respect to \( x \) treating \( y \) as a function of \( x \) and then solves for \( dy/dx \). The van der Waals equation of state, \( (P + a/V_m^2)(V_m - b) = RT \), provides a natural example: finding how \( V_m \) changes with \( P \) at constant \( T \) requires implicit differentiation.

### Subsection 2.2.4: Stationary Points and Optimization

A point \( x_0 \) where \( f'(x_0) = 0 \) is called a **stationary point**. The **second derivative test** distinguishes local minima \( (f''(x_0) > 0) \) from local maxima \( (f''(x_0) < 0) \) and from saddle points \( (f''(x_0) = 0, \) further analysis required\()\). In physical chemistry, locating stationary points on potential energy surfaces is the central challenge of transition-state theory: the saddle point connecting reactant and product valleys corresponds to the **transition state**, and its energy above the reactant minimum equals the activation barrier \( E_a \).

## Section 2.3: Integration

### Subsection 2.3.1: Definite and Indefinite Integrals

The **indefinite integral** (or antiderivative) of \( f \) is a function \( F \) such that \( F'(x) = f(x) \), written \( F(x) = \int f(x)\,dx + C \), where \( C \) is an arbitrary constant. The **definite integral** \( \int_a^b f(x)\,dx \) is defined as the limit of Riemann sums and represents the signed area between the curve \( y = f(x) \) and the \( x \)-axis from \( a \) to \( b \). The **Fundamental Theorem of Calculus** unites differentiation and integration:

\[ \int_a^b f(x)\,dx = F(b) - F(a), \]

where \( F \) is any antiderivative of \( f \). This theorem makes the computation of definite integrals tractable by reducing it to evaluation of antiderivatives at the endpoints.

### Subsection 2.3.2: Static Properties of Matter and Pressure–Volume Work

Integration is the natural language for computing extensive properties that require summing contributions from each infinitesimal volume element or mass element. The **center of mass** of a continuous body of mass density \( \rho(\mathbf{r}) \) is

\[ \mathbf{r}_{\mathrm{cm}} = \frac{1}{M} \int \mathbf{r}\, \rho(\mathbf{r})\, dV, \qquad M = \int \rho(\mathbf{r})\, dV. \]

Similarly, the moment of inertia tensor, essential for interpreting rotational spectra, involves integrals of the form \( I_{xx} = \int (y^2 + z^2) \rho\,dV \).

In thermodynamics, the reversible **pressure–volume work** done on a system is \( w = -\int_{V_i}^{V_f} P\,dV \). For an ideal gas undergoing isothermal expansion, \( P = nRT/V \), so

\[ w = -\int_{V_i}^{V_f} \frac{nRT}{V}\,dV = -nRT \ln\frac{V_f}{V_i}. \]

The sign convention (work done on the system is positive) is consistent with the IUPAC convention adopted in modern physical chemistry texts.

### Subsection 2.3.3: Methods of Integration

Several systematic methods extend the repertoire beyond direct antidifferentiation.

**Integration by substitution** (the reverse of the chain rule): if \( u = g(x) \), then \( \int f(g(x)) g'(x)\,dx = \int f(u)\,du \). This is employed, for instance, to evaluate Gaussian integrals of the form \( \int_0^\infty x^{2n} e^{-\alpha x^2}\,dx \) that appear in the Maxwell–Boltzmann speed distribution.

**Integration by parts** (the reverse of the product rule): 

\[ \int u\,dv = uv - \int v\,du. \]

This is essential for integrals like \( \int x e^{-ax}\,dx \) that arise in normalization of hydrogen-like wavefunctions, and for deriving the recursion relations among special functions.

**Partial fractions**: a rational function \( P(x)/Q(x) \) (with \( \deg P < \deg Q \)) can be decomposed into simpler fractions corresponding to the roots of \( Q \), making the integral tractable. This technique appears in the analytical integration of rate laws, for example when solving the integrated rate equation for a second-order reaction.

The **Gaussian integral** deserves special mention:

\[ \int_{-\infty}^{\infty} e^{-ax^2}\,dx = \sqrt{\frac{\pi}{a}}, \quad a > 0. \]

This result is derived by squaring the integral, converting to polar coordinates, and integrating. It is the foundation for the normalization of harmonic oscillator wavefunctions and for the Maxwell–Boltzmann speed distribution.

---

# Chapter 3: Differential Equations

## Section 3.1: Foundations and Classification

A **differential equation** is an equation relating an unknown function to one or more of its derivatives. Differential equations are the natural language in which the dynamical laws of chemistry are expressed: rate equations describe the time evolution of concentration, the Schrödinger equation governs the spatial distribution of electron density, and heat conduction equations describe temperature gradients in a reacting system.

<div class="definition">
An <strong>ordinary differential equation</strong> (ODE) involves a function of a single independent variable and its ordinary derivatives. A <strong>partial differential equation</strong> (PDE) involves a function of two or more independent variables and its partial derivatives. The <strong>order</strong> of a differential equation is the order of the highest derivative appearing in it. A differential equation is <strong>linear</strong> if the unknown function and all its derivatives appear only to the first power and are not multiplied together.
</div>

The **general solution** of an \( n \)th-order ODE contains \( n \) arbitrary constants; a **particular solution** satisfies additional boundary or initial conditions that fix those constants.

## Section 3.2: First-Order Equations

### Subsection 3.2.1: Separable Equations

A first-order ODE is **separable** if it can be written in the form \( \frac{dy}{dx} = f(x)g(y) \), allowing the variables to be separated:

\[ \frac{dy}{g(y)} = f(x)\,dx \implies \int \frac{dy}{g(y)} = \int f(x)\,dx. \]

The most important chemical application is the **first-order rate law**: if the concentration \( [\mathrm{A}] = c(t) \) decays as \( dc/dt = -kc \), then separation and integration give \( c(t) = c_0 e^{-kt} \), establishing the familiar exponential decay. The half-life \( t_{1/2} = \ln 2 / k \) is independent of initial concentration, a signature of first-order kinetics.

Radioactive decay, fluorescence decay, and first-order conformational interconversion all obey this same mathematical law.

### Subsection 3.2.2: First-Order Linear Equations

The general first-order linear ODE has the form

\[ \frac{dy}{dx} + P(x)y = Q(x). \]

It is solved by the **integrating factor** method: multiplying both sides by \( \mu(x) = e^{\int P(x)\,dx} \) converts the left side into an exact derivative \( d(\mu y)/dx \), yielding

\[ \mu(x)y = \int \mu(x) Q(x)\,dx + C. \]

This technique applies directly to first-order RC circuits (relevant to NMR signal decay) and to the analysis of sequential first-order reactions, where species A converts to B which converts to C.

### Subsection 3.2.3: Electric Circuit Analogy

The charge \( q(t) \) on a capacitor in a simple RC circuit satisfies \( R\,dq/dt + q/C = \mathcal{E}(t) \), where \( R \) is resistance, \( C \) is capacitance, and \( \mathcal{E}(t) \) is the applied electromotive force. This is precisely a first-order linear ODE; its solution describes the charging and discharging of the capacitor with time constant \( \tau = RC \). In electrochemistry and impedance spectroscopy, the ability to solve such equations is fundamental to interpreting frequency-domain data.

## Section 3.3: Second-Order Linear Equations

### Subsection 3.3.1: Homogeneous Linear Equations with Constant Coefficients

The general second-order homogeneous linear ODE with constant coefficients is

\[ ay'' + by' + cy = 0. \]

The solution strategy is to try \( y = e^{rx} \), which converts the ODE into the **characteristic equation** \( ar^2 + br + c = 0 \). The three cases, depending on the discriminant \( \Delta = b^2 - 4ac \), are:

- \( \Delta > 0 \): two distinct real roots \( r_1, r_2 \); general solution \( y = C_1 e^{r_1 x} + C_2 e^{r_2 x} \) — overdamped.
- \( \Delta = 0 \): one repeated root \( r = -b/2a \); general solution \( y = (C_1 + C_2 x)e^{rx} \) — critically damped.
- \( \Delta < 0 \): complex conjugate roots \( r = \alpha \pm i\beta \); general solution \( y = e^{\alpha x}(C_1 \cos\beta x + C_2 \sin\beta x) \) — underdamped oscillation.

### Subsection 3.3.2: The Harmonic Oscillator

The **simple harmonic oscillator** describes a mass \( m \) subject to a restoring force \( F = -kx \), yielding Newton's equation \( m\ddot{x} + kx = 0 \), or equivalently

\[ \ddot{x} + \omega_0^2 x = 0, \qquad \omega_0 = \sqrt{k/m}. \]

The general solution \( x(t) = A\cos(\omega_0 t + \phi) \) represents oscillation at angular frequency \( \omega_0 \). In molecular spectroscopy, the classical harmonic oscillator model for a diatomic bond predicts a vibrational frequency \( \tilde{\nu} = \frac{1}{2\pi c}\sqrt{k/\mu} \) (in wavenumbers), where \( \mu \) is the reduced mass. The quantum-mechanical harmonic oscillator, obtained by quantizing this system, yields vibrational energy levels \( E_v = \hbar\omega_0(v + 1/2) \) with \( v = 0, 1, 2, \ldots \)

The **damped harmonic oscillator** adds a velocity-dependent damping term:

\[ m\ddot{x} + \gamma\dot{x} + kx = 0, \]

whose characteristic roots are \( r = -\gamma/2m \pm \sqrt{(\gamma/2m)^2 - \omega_0^2} \). The underdamped case gives the oscillation envelope \( e^{-\gamma t/2m} \), directly analogous to the exponential decay of NMR or fluorescence signals.

## Section 3.4: The Particle in a Box

The **particle-in-a-box** (infinite square well) is the simplest quantum-mechanical system and illustrates how boundary conditions quantize the energy spectrum. The time-independent Schrödinger equation for a particle of mass \( m \) confined to \( 0 \leq x \leq L \) with infinite walls is

\[ -\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2} = E\psi. \]

Defining \( k = \sqrt{2mE}/\hbar \), the general solution inside the box is \( \psi(x) = A\sin(kx) + B\cos(kx) \). The boundary conditions \( \psi(0) = \psi(L) = 0 \) require \( B = 0 \) and \( kL = n\pi \) for integer \( n \geq 1 \), giving quantized energies

\[ E_n = \frac{n^2\pi^2\hbar^2}{2mL^2} = \frac{n^2 h^2}{8mL^2}. \]

The normalized wavefunctions are \( \psi_n(x) = \sqrt{2/L}\sin(n\pi x/L) \). The ground-state zero-point energy \( E_1 = h^2/(8mL^2) \) is non-zero, a direct consequence of the Heisenberg uncertainty principle: confining the particle to length \( L \) introduces a momentum uncertainty \( \Delta p \sim \hbar/L \), and therefore a kinetic energy of at least \( \sim \hbar^2/(2mL^2) \).

## Section 3.5: Partial Differential Equations

### Subsection 3.5.1: The Hydrogen Atom

The Schrödinger equation for the electron in a hydrogen atom is a **partial differential equation** in the three spatial coordinates \( (r, \theta, \phi) \) in spherical polars:

\[ -\frac{\hbar^2}{2m_e}\nabla^2\psi - \frac{e^2}{4\pi\varepsilon_0 r}\psi = E\psi. \]

The Laplacian in spherical polar coordinates is

\[ \nabla^2 = \frac{1}{r^2}\frac{\partial}{\partial r}\left(r^2\frac{\partial}{\partial r}\right) + \frac{1}{r^2\sin\theta}\frac{\partial}{\partial\theta}\left(\sin\theta\frac{\partial}{\partial\theta}\right) + \frac{1}{r^2\sin^2\theta}\frac{\partial^2}{\partial\phi^2}. \]

The method of **separation of variables** assumes \( \psi(r,\theta,\phi) = R(r)\Theta(\theta)\Phi(\phi) \), splitting the PDE into three ODEs. The angular parts yield the **spherical harmonics** \( Y_\ell^m(\theta,\phi) \), characterized by quantum numbers \( \ell = 0, 1, 2, \ldots \) (azimuthal) and \( m = -\ell, \ldots, +\ell \) (magnetic). The radial part involves **associated Laguerre polynomials** and yields the principal quantum number \( n = 1, 2, 3, \ldots \) with \( \ell < n \). The energy eigenvalues are

\[ E_n = -\frac{m_e e^4}{8\varepsilon_0^2 h^2} \cdot \frac{1}{n^2} = -\frac{13.6 \, \mathrm{eV}}{n^2}. \]

### Subsection 3.5.2: The Vibrating String and Fourier Analysis

The one-dimensional wave equation for a string of length \( L \), fixed at both ends, is

\[ \frac{\partial^2 u}{\partial t^2} = c^2 \frac{\partial^2 u}{\partial x^2}, \qquad u(0,t) = u(L,t) = 0. \]

Separation of variables gives spatial modes \( X_n(x) = \sin(n\pi x/L) \) and temporal modes \( T_n(t) = A_n \cos(\omega_n t) + B_n \sin(\omega_n t) \) with \( \omega_n = n\pi c/L \). The general solution is a superposition of these normal modes.

**Fourier analysis** is the powerful generalization of this decomposition. Any piecewise continuous, periodic function \( f(x) \) of period \( 2L \) can be represented as a **Fourier series**:

\[ f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty}\left(a_n \cos\frac{n\pi x}{L} + b_n \sin\frac{n\pi x}{L}\right), \]

where the coefficients are determined by the orthogonality of the trigonometric functions:

\[ a_n = \frac{1}{L}\int_{-L}^{L} f(x)\cos\frac{n\pi x}{L}\,dx, \qquad b_n = \frac{1}{L}\int_{-L}^{L} f(x)\sin\frac{n\pi x}{L}\,dx. \]

The Fourier series converges to \( f(x) \) at all points of continuity. For non-periodic functions, the **Fourier transform** extends the representation to a continuous spectrum of frequencies:

\[ \tilde{f}(\nu) = \int_{-\infty}^{\infty} f(t) e^{-2\pi i \nu t}\,dt. \]

The Fourier transform is the mathematical basis of Fourier-transform infrared spectroscopy (FTIR) and Fourier-transform NMR: the time-domain free induction decay (FID) and the frequency-domain spectrum are related by Fourier transformation, a relationship that allows the simultaneous collection of all frequency components in a single time-domain experiment.

---

# Chapter 4: Vectors, Vector Spaces, and Vector Algebra

## Section 4.1: Vectors and Their Algebra

A **vector** is a mathematical object characterized by both a magnitude (length) and a direction, in contrast to a **scalar**, which is characterized by magnitude alone. In three-dimensional Euclidean space, a vector \( \mathbf{a} \) is represented by an ordered triple of components \( (a_x, a_y, a_z) \) in a Cartesian coordinate system, or equivalently as a linear combination of the standard basis vectors \( \hat{\mathbf{i}}, \hat{\mathbf{j}}, \hat{\mathbf{k}} \):

\[ \mathbf{a} = a_x\hat{\mathbf{i}} + a_y\hat{\mathbf{j}} + a_z\hat{\mathbf{k}}. \]

The **magnitude** of \( \mathbf{a} \) is \( |\mathbf{a}| = \sqrt{a_x^2 + a_y^2 + a_z^2} \). Vector addition obeys the parallelogram law, and scalar multiplication scales the magnitude without changing the direction (for positive scalars). These operations make the set of all three-dimensional vectors into a **vector space** over \( \mathbb{R} \).

## Section 4.2: Dot Product and Cross Product

<div class="definition">
The <strong>scalar (dot) product</strong> of two vectors \( \mathbf{a} \) and \( \mathbf{b} \) is defined as \( \mathbf{a} \cdot \mathbf{b} = |\mathbf{a}||\mathbf{b}|\cos\theta \), where \( \theta \) is the angle between them, or equivalently in components as \( \mathbf{a} \cdot \mathbf{b} = a_x b_x + a_y b_y + a_z b_z \). The dot product is commutative (\( \mathbf{a} \cdot \mathbf{b} = \mathbf{b} \cdot \mathbf{a} \)) and equals zero when the two vectors are orthogonal.
</div>

<div class="definition">
The <strong>vector (cross) product</strong> \( \mathbf{a} \times \mathbf{b} \) is a vector perpendicular to both \( \mathbf{a} \) and \( \mathbf{b} \), with magnitude \( |\mathbf{a}||\mathbf{b}|\sin\theta \) and direction given by the right-hand rule. In components,
\[ \mathbf{a} \times \mathbf{b} = \begin{vmatrix} \hat{\mathbf{i}} & \hat{\mathbf{j}} & \hat{\mathbf{k}} \\ a_x & a_y & a_z \\ b_x & b_y & b_z \end{vmatrix} = (a_y b_z - a_z b_y)\hat{\mathbf{i}} - (a_x b_z - a_z b_x)\hat{\mathbf{j}} + (a_x b_y - a_y b_x)\hat{\mathbf{k}}. \]
The cross product is anti-commutative: \( \mathbf{a} \times \mathbf{b} = -\mathbf{b} \times \mathbf{a} \).
</div>

In physical chemistry, the dot product appears in the work done by a force \( W = \int \mathbf{F} \cdot d\mathbf{r} \) and in the Beer–Lambert absorbance when expressed in terms of the electric field of the light and the molecular transition dipole moment. The cross product appears in angular momentum \( \mathbf{L} = \mathbf{r} \times \mathbf{p} \), the quantity that is quantized in atomic and molecular spectroscopy.

## Section 4.3: Scalar and Vector Fields

A **scalar field** \( \phi(\mathbf{r}) \) assigns a real number to every point in space; examples include the electrostatic potential \( V(\mathbf{r}) \) and the electron density \( \rho(\mathbf{r}) \). A **vector field** \( \mathbf{F}(\mathbf{r}) \) assigns a vector to every point; examples include the electric field \( \mathbf{E}(\mathbf{r}) = -\nabla V(\mathbf{r}) \) and the probability current in quantum mechanics.

### Subsection 4.3.1: Gradient, Divergence, and Curl

The **gradient** of a scalar field \( \phi \) is the vector field

\[ \nabla\phi = \frac{\partial\phi}{\partial x}\hat{\mathbf{i}} + \frac{\partial\phi}{\partial y}\hat{\mathbf{j}} + \frac{\partial\phi}{\partial z}\hat{\mathbf{k}}. \]

The gradient points in the direction of steepest ascent of \( \phi \) and its magnitude equals the rate of change in that direction. In quantum chemistry, the force on a nucleus is \( \mathbf{F}_I = -\nabla_I E \), where \( E \) is the total electronic energy and \( \nabla_I \) is the gradient with respect to the coordinates of nucleus \( I \). This negative gradient of the Born–Oppenheimer potential energy surface drives geometry optimization and molecular dynamics simulations.

The **divergence** of a vector field \( \mathbf{F} = (F_x, F_y, F_z) \) is the scalar field

\[ \nabla \cdot \mathbf{F} = \frac{\partial F_x}{\partial x} + \frac{\partial F_y}{\partial y} + \frac{\partial F_z}{\partial z}. \]

A positive divergence at a point indicates that field lines originate there (a source); a negative divergence indicates a sink. In electrostatics, \( \nabla \cdot \mathbf{E} = \rho/\varepsilon_0 \) (Gauss's law), connecting the divergence of the electric field to the charge density.

The **curl** of \( \mathbf{F} \) is the vector field

\[ \nabla \times \mathbf{F} = \left(\frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z}\right)\hat{\mathbf{i}} + \left(\frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x}\right)\hat{\mathbf{j}} + \left(\frac{\partial F_y}{\partial x} - \frac{\partial F_x}{\partial y}\right)\hat{\mathbf{k}}. \]

A non-zero curl at a point indicates rotational circulation of the field around that point. The curl appears in Faraday's law \( \nabla \times \mathbf{E} = -\partial\mathbf{B}/\partial t \) and underpins the theory of magnetic shielding in NMR.

## Section 4.4: Abstract Vector Spaces

The concept of a vector space extends far beyond geometric vectors in three-dimensional space. An abstract **vector space** over a field \( \mathbb{F} \) (typically \( \mathbb{R} \) or \( \mathbb{C} \)) is a set \( V \) with operations of addition and scalar multiplication satisfying eight axioms (closure, associativity, commutativity of addition, existence of zero vector, existence of additive inverses, distributivity, and compatibility with scalar multiplication). The most important example for quantum chemistry is the space of square-integrable functions \( L^2(\mathbb{R}^3) \), the Hilbert space in which wavefunctions live.

An **inner product** generalizes the dot product: for functions \( f, g \in L^2 \), the inner product is \( \langle f | g \rangle = \int f^* g\,d\tau \), where the integration is over all space. The **norm** \( \|f\| = \sqrt{\langle f|f\rangle} \). Two functions are **orthogonal** if \( \langle f | g \rangle = 0 \). The eigenfunctions of a Hermitian operator form a complete orthonormal set — this is the mathematical basis for expanding any wavefunction in the basis of energy eigenstates, a procedure that underlies much of time-dependent quantum mechanics and spectroscopy.

---

# Chapter 5: Operators and Matrices

## Section 5.1: Operators in Quantum Chemistry

An **operator** \( \hat{A} \) is a rule that transforms one function into another. In quantum mechanics, every observable is represented by a Hermitian operator, and measurement of the observable for a system in state \( \psi \) yields an expectation value \( \langle A \rangle = \langle \psi | \hat{A} | \psi \rangle \). The **eigenvalue equation** \( \hat{A}\phi_n = a_n \phi_n \) states that measurement of \( A \) on a system in eigenstate \( \phi_n \) always yields the eigenvalue \( a_n \) with certainty.

## Section 5.2: Determinants

The **determinant** is a scalar function of a square matrix that encodes fundamental geometric and algebraic information. For a \( 2 \times 2 \) matrix,

\[ \det\begin{pmatrix}a & b \\ c & d\end{pmatrix} = ad - bc. \]

For a \( 3 \times 3 \) matrix, the determinant is computed by cofactor expansion along any row or column. The determinant of an \( n \times n \) matrix \( A \) is:

- Zero if and only if the rows (or columns) are linearly dependent — the matrix is singular.
- Equal in absolute value to the volume of the parallelepiped spanned by the row vectors.
- Multiplied by \( (-1) \) when any two rows (or columns) are interchanged.

In chemistry, determinants appear in the **Slater determinant** representation of many-electron wavefunctions, which automatically encodes the antisymmetry required by the Pauli exclusion principle:

\[ \Psi = \frac{1}{\sqrt{N!}} \begin{vmatrix} \chi_1(1) & \chi_2(1) & \cdots & \chi_N(1) \\ \chi_1(2) & \chi_2(2) & \cdots & \chi_N(2) \\ \vdots & & \ddots & \vdots \\ \chi_1(N) & \chi_2(N) & \cdots & \chi_N(N) \end{vmatrix}. \]

## Section 5.3: Matrix Algebra

A **matrix** is a rectangular array of numbers. Matrix algebra extends ordinary arithmetic to two-dimensional arrays, providing a compact notation for systems of linear equations, linear transformations, and quantum mechanical operators.

<div class="definition">
Matrix <strong>addition</strong> is defined element-wise: \( (A + B)_{ij} = A_{ij} + B_{ij} \). Matrix <strong>multiplication</strong> \( (AB)_{ij} = \sum_k A_{ik}B_{kj} \) is generally non-commutative; the product \( AB \neq BA \) in general. An \( m \times n \) matrix can multiply an \( n \times p \) matrix to give an \( m \times p \) matrix.
</div>

The **transpose** of \( A \) is \( A^T_{ij} = A_{ji} \). The **Hermitian conjugate** (or adjoint) is \( A^\dagger = (A^T)^* \). A matrix is **Hermitian** if \( A^\dagger = A \), **unitary** if \( A^\dagger = A^{-1} \), and **orthogonal** if \( A^T = A^{-1} \) (i.e., unitary with real entries).

The **inverse matrix** \( A^{-1} \) of a square matrix \( A \) satisfies \( AA^{-1} = A^{-1}A = I \) and exists if and only if \( \det A \neq 0 \). The solution to the linear system \( A\mathbf{x} = \mathbf{b} \) is \( \mathbf{x} = A^{-1}\mathbf{b} \) when \( A \) is invertible.

## Section 5.4: Eigenvalue Problems

The **matrix eigenvalue equation** \( A\mathbf{v} = \lambda\mathbf{v} \) determines the **eigenvalues** \( \lambda \) and corresponding **eigenvectors** \( \mathbf{v} \). The eigenvalues are the roots of the **characteristic polynomial** \( \det(A - \lambda I) = 0 \). For a Hermitian matrix, all eigenvalues are real and the eigenvectors corresponding to distinct eigenvalues are orthogonal — the matrix analogue of the spectral theorem for Hermitian operators.

In molecular orbital theory, the **Hückel matrix** for a conjugated \( \pi \) system is a Hermitian matrix whose eigenvalues are the MO energies (in units of the resonance integral \( \beta \)) and whose eigenvectors are the MO coefficients. Diagonalizing the Hückel matrix is therefore equivalent to finding the molecular orbital energies and wavefunctions.

## Section 5.5: Symmetry Operations as Matrices

The **symmetry operations** of a molecule (rotations, reflections, improper rotations, inversions) can be represented as orthogonal matrices acting on the Cartesian coordinates of the atoms. For example, the reflection \( \sigma_{xy} \) through the \( xy \)-plane is represented by

\[ \sigma_{xy} = \begin{pmatrix}1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & -1\end{pmatrix}. \]

The complete set of symmetry operations of a molecule forms a **group** (in the algebraic sense), and **group theory** classifies molecules by their symmetry and determines selection rules for spectroscopic transitions. The **character table** of a point group lists the traces (characters) of the matrix representations for each symmetry operation — traces are invariant under a similarity transformation and fully characterize the irreducible representations. This mathematical framework explains, for example, why the \( \nu_1 \) symmetric stretch of CO\(_2\) is Raman-active but IR-inactive.
