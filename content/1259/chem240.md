---
title: "CHEM 240: Mathematical Methods for Chemistry"
subjects: "CHEM"
prof: "W. Scott Hopkins"
---

## Sources and References

**Primary textbook** — Steiner, E. *The Chemistry Maths Book*, 2nd ed. Oxford University Press, 2008.
**Supplementary texts** — Kreyszig, E. *Advanced Engineering Mathematics*, 10th ed. Wiley, 2011; Arfken, G.B., Weber, H.J. *Mathematical Methods for Physicists*, 7th ed. Academic Press, 2012; Griffiths, D.J. *Introduction to Quantum Mechanics*, 2nd ed. Pearson, 2005.
**Online resources** — Wolfram MathWorld (mathworld.wolfram.com); NIST Digital Library of Mathematical Functions (dlmf.nist.gov); Paul's Online Math Notes (tutorial.math.lamar.edu).

---

# Chapter 1: Numbers, Variables, and Units

## Introduction

Mathematics is the language of the physical sciences. Every quantitative statement made in chemistry — whether it concerns a rate constant, an equilibrium position, an orbital energy, or the heat released in a combustion reaction — is expressed through mathematical relationships, and every such statement can be manipulated, tested, and extended only when the underlying mathematics is understood deeply enough to be used fluently. The philosopher Galileo famously wrote that the Book of Nature is written in the language of mathematics; for chemists, this is not merely a metaphor but a daily practical reality. Spectroscopic transitions, reaction mechanisms, thermodynamic cycles, and quantum wavefunctions all require mathematical tools that go well beyond the arithmetic encountered in secondary school.

CHEM 240 assembles, in a single focused term, the mathematical toolkit that will be indispensable throughout your undergraduate chemistry education. The course covers five major domains: the number systems and algebraic structures that underpin all quantitative reasoning; the differential and integral calculus that describes continuous change; the ordinary and partial differential equations that govern dynamic chemical systems; the vector algebra and vector calculus that appear in electrostatics, spectroscopy, and crystallography; and the matrix algebra and determinant theory that are central to group theory, molecular orbital calculations, and the solution of simultaneous equations. Each domain is developed with explicit attention to the chemical applications that motivate it.

These notes are organized to mirror the lecture schedule and to go substantially beyond the level of a formula sheet. Each mathematical tool is derived from first principles, its physical meaning is unpacked carefully, and at least one extended chemical example illustrates how to apply it. The goal is not to produce students who can perform algorithmic manipulations in isolation, but students who understand why each technique works and who can therefore adapt it to unfamiliar situations — the hallmark of genuine mathematical fluency in chemistry.

---

## 1.1 Real Numbers and Their Properties

The real number system, denoted \(\mathbb{R}\), is the foundation of all quantitative chemistry. It consists of the rational numbers — those that can be expressed as a ratio \(p/q\) where \(p\) and \(q\) are integers and \(q \neq 0\) — and the irrational numbers, which cannot be so expressed. The distinction matters in chemistry because physical constants such as \(\pi\) (appearing in the formula for the hydrogen atom wave functions) and \(e\) (the base of natural logarithms, appearing in every exponential rate law) are irrational, yet we reason about them algebraically without difficulty.

The real number line is a complete, ordered field. Completeness means that every bounded sequence of real numbers has a limit that is itself a real number — a property essential for the convergence of the infinite series that arise in quantum mechanics and statistical thermodynamics. The ordered nature of the real line means that for any two real numbers \(a\) and \(b\), exactly one of three relationships holds: \(a < b\), \(a = b\), or \(a > b\). This ordering underlies all thermodynamic inequalities, such as the statement that the Gibbs energy of a spontaneous process at constant temperature and pressure must decrease.

The algebraic laws governing real numbers — commutativity, associativity, and distributivity — are so deeply ingrained that chemists apply them unconsciously. Yet understanding them explicitly becomes important when generalizing to matrices, where multiplication is no longer commutative, and to quantum mechanical operators, where the order of operations carries profound physical significance. The commutator \(\left[A, B\right] = AB - BA\) of two operators vanishes for ordinary numbers but is a non-zero operator in quantum mechanics, a fact that is the mathematical root of the Heisenberg uncertainty principle.

<div class="definition">
A <strong>real number</strong> is any element of the complete ordered field \(\mathbb{R}\). The set \(\mathbb{R}\) includes all integers, all rational numbers, and all irrational numbers. It is geometrically represented by a continuous line on which every point corresponds to exactly one real number.
</div>

Factorization is the decomposition of a number or algebraic expression into a product of simpler factors. The Fundamental Theorem of Arithmetic guarantees that every positive integer greater than one has a unique factorization into prime numbers. In chemistry, factorization arises when working with combinatorial quantities: the degeneracy of an energy level in quantum mechanics, for instance, involves factorials, which are products of all positive integers up to \(n\):

\[
n! = n \times (n-1) \times (n-2) \times \cdots \times 2 \times 1
\]

Stirling's approximation for large factorials, \(\ln n! \approx n \ln n - n\), is used extensively in statistical mechanics to derive expressions for entropy from first principles. Without it, expressions involving the number of microstates \(\Omega\) — which can be of order \(10^{23}\) — would be impossible to evaluate. The approximation follows from taking the logarithm of the factorial and approximating the sum \(\sum_{k=1}^{n} \ln k\) by the integral \(\int_1^n \ln x \, dx = n \ln n - n + 1 \approx n \ln n - n\).

The decimal representation of numbers is relevant to any experimental science because measured quantities are always known only to a finite number of significant figures. The significant figures of a number are those digits that carry physical meaning: they include all certain digits plus the first uncertain digit. The rules for significant figures in arithmetic operations — that addition and subtraction preserve the fewest decimal places, while multiplication and division preserve the fewest significant figures — arise from error propagation formulas derived from calculus, as will be discussed in the statistics section of these notes.

---

## 1.2 Complex Numbers

<div class="definition">
A <strong>complex number</strong> is an expression of the form \(z = a + bi\) where \(a, b \in \mathbb{R}\) and \(i\) is the imaginary unit satisfying \(i^2 = -1\). The real part of \(z\) is \(\text{Re}(z) = a\) and the imaginary part is \(\text{Im}(z) = b\). The set of all complex numbers forms the field \(\mathbb{C}\).
</div>

Complex numbers are not merely mathematical abstractions introduced to solve equations like \(x^2 + 1 = 0\). They are the natural language of wave phenomena, and since chemistry is replete with waves — light waves in spectroscopy, matter waves in quantum mechanics, electromagnetic fields in NMR — complex numbers appear throughout advanced chemistry. The wavefunction \(\Psi\) in quantum mechanics is in general a complex-valued function, and only through complex arithmetic can we correctly compute the probability densities, expectation values, and interference patterns that characterize quantum systems.

The algebra of complex numbers extends ordinary real arithmetic naturally. Addition and subtraction proceed component-wise: \((a + bi) + (c + di) = (a + c) + (b + d)i\). Multiplication uses the distributive law and the definition \(i^2 = -1\): \((a + bi)(c + di) = ac - bd + (ad + bc)i\). Division by a complex number is accomplished by multiplying numerator and denominator by the complex conjugate of the denominator. The complex conjugate of \(z = a + bi\) is \(z^* = a - bi\), and the product \(z z^* = a^2 + b^2\) is always a non-negative real number called the squared modulus \(|z|^2\). The modulus \(|z| = \sqrt{a^2 + b^2}\) is the distance from the origin to the point \((a, b)\) in the complex plane.

The **Argand diagram** represents complex numbers geometrically: the horizontal axis carries the real part and the vertical axis carries the imaginary part. Multiplication of complex numbers has a beautiful geometric interpretation: multiplying \(z_1\) by \(z_2\) scales the modulus of \(z_1\) by \(|z_2|\) and rotates its argument by the argument of \(z_2\). This geometric picture makes the properties of complex exponentials intuitive and will be essential when we encounter quantum mechanical phase factors and gauge transformations.

### 1.2.1 Euler's Formula and the Polar Form

The most powerful representation of complex numbers for chemistry is the polar form. Every complex number \(z = a + bi\) can be written as \(z = r e^{i\theta}\), where \(r = |z|\) is the modulus and \(\theta = \arctan(b/a)\) is the argument (or phase). The conversion between rectangular and polar form is the content of Euler's famous formula:

\[
e^{i\theta} = \cos\theta + i\sin\theta
\]

This remarkable identity, which unifies the exponential function, trigonometry, and complex numbers into a single expression, is not a definition but a consequence of the Taylor series expansions of \(e^x\), \(\cos x\), and \(\sin x\). Writing \(e^{ix}\) as a power series:

\[
e^{ix} = \sum_{n=0}^{\infty} \frac{(ix)^n}{n!} = 1 + ix - \frac{x^2}{2!} - \frac{ix^3}{3!} + \frac{x^4}{4!} + \frac{ix^5}{5!} - \cdots
\]

Separating real and imaginary parts:

\[
\text{Re}(e^{ix}) = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \cdots = \cos x
\]

\[
\text{Im}(e^{ix}) = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \cdots = \sin x
\]

Thus Euler's formula follows rigorously from power series. The special case \(e^{i\pi} + 1 = 0\) (Euler's identity) is often described as the most beautiful equation in mathematics because it unites the five most fundamental constants: \(e\), \(i\), \(\pi\), 1, and 0.

<div class="example">
<strong>Example 1.1: De Moivre's Theorem</strong>

Using Euler's formula, prove that \((\cos\theta + i\sin\theta)^n = \cos(n\theta) + i\sin(n\theta)\).

<em>Solution:</em> We write \(\cos\theta + i\sin\theta = e^{i\theta}\). Then

\[
(e^{i\theta})^n = e^{in\theta} = \cos(n\theta) + i\sin(n\theta)
\]
This is De Moivre's theorem. It allows us to compute high powers of complex numbers in polar form without multiplying out rectangularly. For example, \((\cos 30° + i\sin 30°)^{12} = \cos 360° + i\sin 360° = 1 + 0i = 1\), which makes geometric sense because rotating by 30° twelve times returns to the starting point.

A chemical application: the \(n\)th roots of unity \(z^n = 1\) are \(z_k = e^{2\pi i k/n}\) for \(k = 0, 1, \ldots, n-1\). These roots are equally spaced on the unit circle in the complex plane and correspond to the solutions of cyclic secular equations in Hückel theory for annulene molecules (cyclic polyenes \(C_nH_n\)), where the orbital energies are \(E_k = \alpha + 2\beta\cos(2\pi k/n)\).
</div>

In chemistry, Euler's formula appears constantly. A traveling plane wave of electromagnetic radiation with frequency \(\nu\) and wavenumber \(\bar{\nu}\) can be written as \(\Psi(x,t) = A e^{i(kx - \omega t)}\) where \(k = 2\pi/\lambda\) and \(\omega = 2\pi\nu\). The physically observable real part is the cosine function, but working with the complex exponential makes differentiation and integration far simpler than working with cosines and sines separately. Similarly, the solutions to the angular portion of the hydrogen-atom Schrödinger equation, the spherical harmonics \(Y_l^m(\theta, \phi)\), involve the factor \(e^{im\phi}\), which is a complex exponential that encodes the angular momentum of the electron.

The periodicity of the complex exponential is also central: \(e^{i(\theta + 2\pi)} = e^{i\theta}\) for all \(\theta\), reflecting the \(2\pi\) periodicity of angles. This periodicity is the mathematical basis for the quantization of angular momentum in quantum mechanics: requiring the wavefunction to be single-valued under a rotation of \(2\pi\) forces the magnetic quantum number \(m_l\) to be an integer.

### 1.2.2 Complex Functions

A complex function \(f(z)\) maps complex numbers to complex numbers and opens the vast field of complex analysis. The functions \(e^z\), \(\sin z\), and \(\cos z\) are defined by their power series (the same series as for real arguments, but now \(z \in \mathbb{C}\)), and Euler's formula shows that \(\sin z = (e^{iz} - e^{-iz})/(2i)\) and \(\cos z = (e^{iz} + e^{-iz})/2\). These definitions extend trigonometry to complex arguments and lead to the hyperbolic functions: \(\sinh z = -i\sin(iz)\) and \(\cosh z = \cos(iz)\), which appear in quantum tunneling problems where the wavefunction inside a classically forbidden barrier region grows and decays exponentially rather than oscillating.

---

## 1.3 Units and Dimensional Analysis

Every physical quantity in chemistry has both a numerical value and a unit, and the unit is not merely a label to be appended after the calculation — it is an integral part of the quantity's identity. The International System of Units (SI) defines seven base units from which all other units are derived: the metre (m) for length, the kilogram (kg) for mass, the second (s) for time, the ampere (A) for electric current, the kelvin (K) for thermodynamic temperature, the mole (mol) for amount of substance, and the candela (cd) for luminous intensity. All energy units, for example, reduce to \(\text{kg} \cdot \text{m}^2 \cdot \text{s}^{-2}\), which is the joule.

Dimensional analysis — the practice of tracking units through every algebraic step of a calculation — serves as one of the most powerful checks in quantitative chemistry. If the units on the left and right sides of an equation do not match, the equation is wrong, regardless of whether the numbers are correct. This is not merely a bookkeeping rule but a deep physical principle: only quantities of the same dimension can be added, subtracted, or set equal to each other. You cannot add a length to a mass, or equate a pressure to an energy. The mathematical reason is that physical quantities form a vector space over the real numbers with the physical dimensions forming the basis; operations between incommensurable quantities violate the rules of this vector space.

The use of dimensionless quantities is equally important. In many chemical and physical equations, variables naturally appear in dimensionless combinations. The reduced temperature \(T/T_c\) (temperature divided by the critical temperature) and the reduced pressure \(P/P_c\) appear in the law of corresponding states. The de Broglie wavelength \(\lambda = h/(mv)\) becomes the dimensionless ratio \(\lambda/a_0\) (where \(a_0\) is the Bohr radius) in atomic units. Working in atomic units — setting \(\hbar = m_e = e = 4\pi\epsilon_0 = 1\) — enormously simplifies the Schrödinger equation for atoms and molecules by eliminating all these fundamental constants numerically. The energies then come out in hartrees (\(1 \text{ Ha} = 27.2 \text{ eV} = 2625 \text{ kJ/mol}\)), the lengths in Bohr radii (\(a_0 = 52.9 \text{ pm}\)), and the conversion back to SI units is straightforward.

---

# Chapter 2: Topics from Calculus

## 2.1 The Concept of a Limit and Continuity

The differential and integral calculus, developed independently by Newton and Leibniz in the seventeenth century, provides the mathematical machinery to describe continuously changing quantities — the very quantities that dominate chemistry. Reaction rates, temperature gradients, pressure-volume work, and the probabilistic density of electron positions are all described by calculus. The fundamental concept underlying all of calculus is the limit.

<div class="definition">
The <strong>limit</strong> of a function \(f(x)\) as \(x\) approaches the value \(a\) is the value \(L\) such that for every \(\varepsilon > 0\), there exists \(\delta > 0\) such that whenever \(0 < |x - a| < \delta\), it follows that \(|f(x) - L| < \varepsilon\). We write \(\lim_{x \to a} f(x) = L\).
</div>

The epsilon-delta definition captures rigorously the intuitive idea that \(f(x)\) can be made arbitrarily close to \(L\) by taking \(x\) sufficiently close to \(a\). Notice that the definition says nothing about the value of \(f\) at \(a\) itself — the limit is a statement about the behavior of \(f\) near \(a\). A function \(f\) is continuous at \(a\) if \(\lim_{x \to a} f(x) = f(a)\), meaning the limit exists, the function is defined at \(a\), and the two agree. Most functions encountered in chemistry — polynomials, exponentials, trigonometric functions, and their compositions — are continuous everywhere on their domains, but discontinuities arise naturally in thermodynamics (phase transitions) and in spectroscopy (line shapes with sharp boundaries).

Two limits that arise frequently deserve special attention. The limit \(\lim_{x \to 0} \frac{\sin x}{x} = 1\) (where \(x\) is measured in radians) is important because it is used in deriving the derivative of the sine function and appears in the sinc function \(\text{sinc}(x) = \sin(\pi x)/(\pi x)\), which describes diffraction patterns in X-ray crystallography and the line shapes of NMR spectral peaks in certain limiting regimes. The limit \(\lim_{n \to \infty} (1 + 1/n)^n = e\) defines Euler's number and is the origin of the connection between exponential growth and the base \(e\), which underlies every first-order kinetic law, every radioactive decay, and every Boltzmann factor.

L'Hôpital's rule provides a practical tool for evaluating indeterminate forms \(0/0\) or \(\infty/\infty\): if \(\lim_{x\to a} f(x)/g(x)\) has an indeterminate form, then (under mild conditions) \(\lim_{x\to a} f(x)/g(x) = \lim_{x\to a} f'(x)/g'(x)\). This rule is used, for example, to show that \(\lim_{T\to\infty} E/(k_BT) \cdot e^{-E/(k_BT)} = 0\) — the high-temperature limit that justifies the classical equipartition theorem.

## 2.2 Differentiation from First Principles

<div class="definition">
The <strong>derivative</strong> of a function \(f(x)\) at the point \(x\) is defined as

\[
f'(x) = \frac{df}{dx} = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}
\]
provided this limit exists. When the limit exists, \(f\) is said to be <strong>differentiable</strong> at \(x\).
</div>

The derivative measures the instantaneous rate of change of \(f\) with respect to \(x\). Geometrically, it is the slope of the tangent line to the graph of \(f\) at the point \((x, f(x))\). From a physical standpoint, if \(f(t)\) represents the concentration of a reactant as a function of time, then \(f'(t) = dc/dt\) is the rate of change of concentration — the negative of the reaction rate (for a reactant). If \(f(V)\) represents the internal energy of a gas as a function of volume at constant temperature, then \((\partial U/\partial V)_T\) (a partial derivative, discussed below) is a thermodynamic quantity related to intermolecular interactions.

Let us derive the derivative of \(f(x) = x^n\) for positive integer \(n\) directly from the definition, using the binomial theorem:

\[
f(x+h) = (x+h)^n = \sum_{k=0}^{n} \binom{n}{k} x^{n-k} h^k = x^n + nx^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + h^n
\]

Therefore:

\[
\frac{f(x+h) - f(x)}{h} = \frac{nx^{n-1}h + \binom{n}{2}x^{n-2}h^2 + \cdots + h^n}{h} = nx^{n-1} + \binom{n}{2}x^{n-2}h + \cdots + h^{n-1}
\]

Taking the limit as \(h \to 0\), every term containing \(h\) vanishes, leaving \(f'(x) = nx^{n-1}\). This is the **power rule**, and it extends to all real exponents by continuity and the chain rule.

### 2.2.1 Rules of Differentiation

The fundamental rules of differentiation allow derivatives of complicated functions to be computed from those of simpler ones without returning to the first-principles limit. The **product rule** states that for two differentiable functions \(u(x)\) and \(v(x)\):

\[
\frac{d}{dx}\left[u(x)v(x)\right] = u'(x)v(x) + u(x)v'(x)
\]

The **quotient rule** is a consequence of the product rule applied to \(u \cdot v^{-1}\):

\[
\frac{d}{dx}\left[\frac{u(x)}{v(x)}\right] = \frac{u'(x)v(x) - u(x)v'(x)}{[v(x)]^2}
\]

The **chain rule** handles composite functions \(f(g(x))\):

\[
\frac{d}{dx}\left[f(g(x))\right] = f'(g(x)) \cdot g'(x)
\]

The chain rule is perhaps the single most important differentiation rule in chemistry because so many physical quantities are functions of functions. The exponential decay of a radioactive nucleus gives activity \(A = A_0 e^{-\lambda t}\); differentiating with respect to time using the chain rule yields \(dA/dt = -\lambda A_0 e^{-\lambda t} = -\lambda A\). The Boltzmann factor \(e^{-E/(k_B T)}\) appears as a function of energy \(E\) which is itself a function of coordinates; differentiating with respect to coordinates to find forces requires the chain rule applied to the exponential.

<div class="example">
<strong>Example 2.1: Differentiating the Morse Potential</strong>

The Morse potential models the interaction between two bonded atoms:

\[
V(r) = D_e \left(1 - e^{-a(r - r_e)}\right)^2
\]
where \(D_e\) is the dissociation energy, \(a\) is a parameter related to the vibrational force constant, \(r\) is the internuclear distance, and \(r_e\) is the equilibrium bond length. Find the force \(F = -dV/dr\).

<em>Solution:</em> Let \(u = 1 - e^{-a(r-r_e)}\), so \(V = D_e u^2\). By the chain rule:

\[
\frac{dV}{dr} = 2D_e u \cdot \frac{du}{dr}
\]
Now \(\frac{du}{dr} = -(-a)e^{-a(r-r_e)} = ae^{-a(r-r_e)}\). Therefore:

\[
F = -\frac{dV}{dr} = -2D_e\left(1 - e^{-a(r-r_e)}\right) \cdot ae^{-a(r-r_e)}
\]
At \(r = r_e\): \(u = 0\), so \(F = 0\) — the force vanishes at equilibrium, as expected. For \(r > r_e\): \(u > 0\) and \(e^{-a(r-r_e)} > 0\), so \(F < 0\) (attractive). For \(r < r_e\): \(u < 0\) and \(e^{-a(r-r_e)} > 1\), so \(F > 0\) (repulsive). The Morse potential correctly captures both the attractive and repulsive regimes and correctly predicts anharmonicity in molecular vibrations.
</div>

### 2.2.2 Implicit Differentiation and Stationary Points

Not every relationship between variables can be expressed in the explicit form \(y = f(x)\). The Van der Waals equation of state for a real gas, \(\left(P + \frac{an^2}{V^2}\right)(V - nb) = nRT\), defines \(P\) as an implicit function of \(V\) and \(T\). **Implicit differentiation** — differentiating both sides of such an equation with respect to the desired variable while treating the other variables as defined implicitly — allows us to find derivatives without first solving explicitly. This technique is used to derive the Clausius-Clapeyron equation from the requirement that the chemical potentials of two phases are equal across a phase boundary.

**Stationary points** (critical points) of a function are locations where the derivative vanishes. For a function \(f(x)\), the stationary points satisfy \(f'(x) = 0\). The nature of each stationary point — whether a local minimum, local maximum, or saddle point — is determined by the second derivative: \(f''(x) > 0\) (minimum), \(f''(x) < 0\) (maximum), or \(f''(x) = 0\) (inconclusive). In the Van der Waals equation, the critical point (where gas and liquid phases become identical) corresponds to the conditions \(\left(\partial P/\partial V\right)_T = 0\) and \(\left(\partial^2 P/\partial V^2\right)_T = 0\) simultaneously — a double stationary condition whose solution yields the critical constants \(T_c\), \(P_c\), and \(V_c\) in terms of the Van der Waals parameters \(a\) and \(b\).

## 2.3 Taylor and Maclaurin Series

One of the most powerful tools in applied mathematics is the approximation of an arbitrary smooth function by a polynomial. The **Taylor series** of a function \(f(x)\) about the point \(x = a\) is:

\[
f(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \frac{f'''(a)}{3!}(x-a)^3 + \cdots = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!}(x-a)^n
\]

where \(f^{(n)}(a)\) denotes the \(n\)th derivative of \(f\) evaluated at \(a\). The series converges to \(f(x)\) provided \(f\) is infinitely differentiable in a neighborhood of \(a\) and the remainder term \(R_n(x) = \frac{f^{(n+1)}(\xi)}{(n+1)!}(x-a)^{n+1}\) (for some \(\xi\) between \(a\) and \(x\)) tends to zero as \(n \to \infty\). When \(a = 0\), the series is called a **Maclaurin series**.

The derivation of the Taylor series coefficients is elegant: assuming \(f(x) = c_0 + c_1(x-a) + c_2(x-a)^2 + \cdots\) and differentiating repeatedly at \(x = a\) gives \(f^{(n)}(a) = n! \, c_n\), so \(c_n = f^{(n)}(a)/n!\). The most important Taylor series in chemistry include:

\[
e^x = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \cdots \quad \text{(all } x\text{)}
\]

\[
\ln(1+x) = x - \frac{x^2}{2} + \frac{x^3}{3} - \cdots \quad (-1 < x \leq 1)
\]

\[
\sin x = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \cdots \quad \text{(all } x\text{)}
\]

\[
\cos x = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \cdots \quad \text{(all } x\text{)}
\]

\[
(1+x)^n = 1 + nx + \frac{n(n-1)}{2!}x^2 + \cdots \quad (|x| < 1)
\]

In thermodynamics, the Taylor expansion of the exponential Boltzmann factor for small energies \(E \ll k_BT\) is frequently used: \(e^{-E/(k_BT)} \approx 1 - E/(k_BT) + \frac{1}{2}[E/(k_BT)]^2 - \cdots\). The high-temperature limit of the partition function, the equipartition theorem, and the classical limit of quantum statistics all emerge from truncating this series after the first or second term. The virial expansion of a real gas equation of state, \(PV/nRT = 1 + B/V + C/V^2 + \cdots\), where \(B\) and \(C\) are the second and third virial coefficients, is a Taylor expansion in powers of \(1/V\) that systematically improves upon the ideal gas law.

## 2.4 Partial Differentiation

When a quantity depends on more than one variable — as internal energy depends on temperature and volume, or as the rate constant depends on activation energy and temperature — we need to differentiate with respect to one variable while holding others constant. This operation defines the **partial derivative**.

<div class="definition">
The <strong>partial derivative</strong> of \(f(x, y)\) with respect to \(x\), holding \(y\) constant, is:

\[
\frac{\partial f}{\partial x} = \lim_{h \to 0} \frac{f(x+h, y) - f(x, y)}{h}
\]
The partial derivative with respect to \(y\), holding \(x\) constant, is defined analogously.
</div>

The notation \(\left(\partial f/\partial x\right)_y\) specifies explicitly that \(y\) is held constant, which is essential in thermodynamics where the same function might be differentiated at constant pressure, constant volume, or constant entropy in different contexts. The internal pressure \(\left(\partial U/\partial V\right)_T\) measures how the internal energy changes with volume at constant temperature — it equals zero for an ideal gas and is positive (repulsion-dominated) for real gases below the Boyle temperature.

The **total differential** of a function \(f(x_1, x_2, \ldots, x_n)\) is:

\[
df = \frac{\partial f}{\partial x_1} dx_1 + \frac{\partial f}{\partial x_2} dx_2 + \cdots + \frac{\partial f}{\partial x_n} dx_n
\]

This expression states that a small change in \(f\) arising from small changes \(dx_i\) in all the independent variables is the sum of the contributions from each variable separately. The total differential is an exact differential if the mixed second partial derivatives are equal: \(\partial^2 f/\partial x_i \partial x_j = \partial^2 f/\partial x_j \partial x_i\). This condition, known as the **Euler reciprocity relation**, is the mathematical basis for the Maxwell relations in thermodynamics: from \(dG = -SdT + VdP\), which is an exact differential, we obtain \(\left(\partial S/\partial P\right)_T = -\left(\partial V/\partial T\right)_P\) — a remarkable relation connecting the pressure dependence of entropy to the temperature dependence of volume.

## 2.5 Definite and Indefinite Integrals

The integral is the inverse operation to differentiation in the sense made precise by the Fundamental Theorem of Calculus. The **indefinite integral** (antiderivative) of \(f(x)\) is a function \(F(x)\) such that \(F'(x) = f(x)\). The **definite integral** \(\int_a^b f(x) \, dx\) is the signed area under the curve \(y = f(x)\) between \(x = a\) and \(x = b\), defined as the limit of Riemann sums:

\[
\int_a^b f(x) \, dx = \lim_{n \to \infty} \sum_{k=1}^n f(x_k^*) \Delta x_k
\]

where the interval \([a,b]\) is partitioned into \(n\) subintervals and \(x_k^*\) is a sample point in the \(k\)th subinterval.

<div class="theorem">
<strong>The Fundamental Theorem of Calculus:</strong> If \(f\) is continuous on \([a, b]\) and \(F\) is any antiderivative of \(f\), then

\[
\int_a^b f(x) \, dx = F(b) - F(a)
\]
</div>

This theorem is the cornerstone of calculus: it transforms the problem of computing areas (a limit of sums) into the problem of finding antiderivatives (an algebraic operation). In chemistry, integration appears everywhere: computing the work done in a reversible expansion \(w = -\int_{V_1}^{V_2} P \, dV\), finding the average value of a quantum mechanical observable, calculating the normalization constant of a wavefunction, and converting between rates and amounts in kinetics.

### 2.5.1 Methods of Integration

The most important integration techniques for chemistry are substitution, integration by parts, and partial fractions.

**Substitution** (the reverse chain rule): if \(u = g(x)\), then \(du = g'(x) \, dx\), and \(\int f(g(x)) g'(x) \, dx = \int f(u) \, du\). The Gaussian integral \(\int_{-\infty}^{\infty} e^{-ax^2} dx = \sqrt{\pi/a}\) — derived by squaring the integral and converting to polar coordinates in two dimensions — is one of the most important definite integrals in physics and chemistry. It appears in the translational partition function \(q_{trans} = V(2\pi m k_BT/h^2)^{3/2}\), in the normalization of harmonic oscillator wavefunctions, and in the Maxwell-Boltzmann speed distribution.

**Integration by parts** is the integral analogue of the product rule: \(\int u \, dv = uv - \int v \, du\). This technique is essential for integrals involving products of polynomials with exponentials or trigonometric functions. The generalization — applying integration by parts repeatedly — is needed for the normalization integrals of hydrogen atom wavefunctions, which involve products of polynomials, exponentials, and associated Laguerre polynomials. The recurrence relations for these special functions can often be derived from integration by parts applied to the defining integral.

**Partial fractions** decompose a rational function into a sum of simpler fractions, each of which can be integrated by the substitution technique. For a rational function \(P(x)/Q(x)\) where \(\deg(P) < \deg(Q)\), the partial fraction decomposition writes the function as a sum of terms of the form \(A/(x-r)^k\) and \((Bx+C)/((x^2+px+q)^k)\) for each real root \(r\) and pair of complex conjugate roots of \(Q(x)\). This method is used in chemical kinetics to integrate rate laws for second-order reactions and for opposing reactions at equilibrium.

<div class="example">
<strong>Example 2.2: Pressure-Volume Work in a Reversible Isothermal Expansion</strong>

One mole of an ideal gas expands reversibly and isothermally from volume \(V_1\) to volume \(V_2\) at temperature \(T\). For an ideal gas, \(P = nRT/V\). The work done on the surroundings is:

\[
w = -\int_{V_1}^{V_2} P \, dV = -\int_{V_1}^{V_2} \frac{nRT}{V} \, dV = -nRT \int_{V_1}^{V_2} \frac{dV}{V} = -nRT \left[\ln V\right]_{V_1}^{V_2} = -nRT \ln\frac{V_2}{V_1}
\]

For an expansion, \(V_2 > V_1\), so \(\ln(V_2/V_1) > 0\) and \(w < 0\) — the gas does positive work on the surroundings. For a compression, \(w > 0\) — the surroundings do positive work on the gas. At 298 K with \(V_2/V_1 = 2\): \(w = -(1)(8.314)(298)\ln 2 = -1717 \text{ J} = -1.72 \text{ kJ}\). This result, so fundamental to thermodynamics, depends directly on the integral of \(1/V\) being \(\ln V\).
</div>

### 2.5.2 Multiple Integrals and Volume Elements

Many quantum mechanical normalization integrals extend over three-dimensional space. For a wavefunction \(\psi(x,y,z)\), the normalization condition is:

\[
\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}\int_{-\infty}^{\infty} |\psi(x,y,z)|^2 \, dx \, dy \, dz = 1
\]

For atoms and molecules, spherical coordinates \((r, \theta, \phi)\) are natural. The volume element in spherical coordinates is \(dV = r^2 \sin\theta \, dr \, d\theta \, d\phi\), and the integration limits are \(r \in [0, \infty)\), \(\theta \in [0, \pi]\), \(\phi \in [0, 2\pi]\). A triple integral in spherical coordinates separates if the integrand factors: \(\psi(r,\theta,\phi) = R(r)\Theta(\theta)\Phi(\phi)\), which is precisely the separation of variables structure of the hydrogen atom wavefunctions.

The probability of finding an electron in a thin spherical shell between \(r\) and \(r + dr\) (integrating over all angles) is:

\[
P(r) dr = \left[\int_0^{2\pi}\int_0^{\pi} |Y_l^m(\theta,\phi)|^2 \sin\theta \, d\theta \, d\phi\right] |R_{nl}(r)|^2 r^2 dr = |R_{nl}(r)|^2 r^2 dr
\]

since the spherical harmonics are normalized. The function \(P(r) = |R_{nl}(r)|^2 r^2\) is called the **radial distribution function** and gives the probability density for finding the electron at distance \(r\) from the nucleus. Its maximum defines the most probable radius, which for the 1s orbital of hydrogen is \(r = a_0\) (the Bohr radius) — connecting quantum mechanics to the older Bohr model in the appropriate limit.

---

# Chapter 3: Differential Equations

## 3.1 Introduction and Classification

A **differential equation** is an equation that relates a function to one or more of its derivatives. Differential equations are the fundamental language in which the laws of nature are expressed: Newton's laws of motion, Maxwell's equations of electromagnetism, the Schrödinger equation of quantum mechanics, and the rate laws of chemical kinetics are all differential equations. Understanding how to classify and solve them is therefore one of the most important skills in quantitative chemistry.

<div class="definition">
An <strong>ordinary differential equation (ODE)</strong> is a differential equation in which the unknown function depends on a single independent variable. A <strong>partial differential equation (PDE)</strong> is one in which the unknown function depends on more than one independent variable and the equation involves partial derivatives.
</div>

ODEs are classified by their **order** (the highest derivative appearing), their **degree** (the highest power to which the highest-order derivative is raised), and whether they are **linear** or **nonlinear**. A linear ODE of order \(n\) has the form:

\[
a_n(x) y^{(n)} + a_{n-1}(x) y^{(n-1)} + \cdots + a_1(x) y' + a_0(x) y = f(x)
\]

where the coefficients \(a_k(x)\) and the driving term \(f(x)\) may depend on the independent variable \(x\) but not on the unknown function \(y\) or its derivatives. If \(f(x) = 0\) for all \(x\), the equation is **homogeneous**; otherwise it is **inhomogeneous**.

The general solution of an \(n\)th-order linear ODE contains \(n\) arbitrary constants, which are determined by imposing \(n\) initial or boundary conditions. Initial conditions specify the value of the function and its derivatives up to order \(n-1\) at a single point. Boundary conditions specify the function values at two or more points. The distinction matters physically: the free oscillation of a pendulum is an initial value problem (given position and velocity at \(t = 0\), find motion for \(t > 0\)), while the quantum mechanical particle in a box is a boundary value problem (the wavefunction must vanish at both walls of the box).

## 3.2 Separable First-Order Equations and Chemical Kinetics

<div class="definition">
A first-order ODE is <strong>separable</strong> if it can be written in the form

\[
\frac{dy}{dx} = g(x) h(y)
\]
that is, as a product of a function of \(x\) alone and a function of \(y\) alone.
</div>

Separable equations are solved by algebraically separating the variables and integrating each side independently:

\[
\frac{dy}{h(y)} = g(x) \, dx \implies \int \frac{dy}{h(y)} = \int g(x) \, dx
\]

The most important separable ODE in chemistry is the first-order rate law. For a first-order reaction \(A \to P\) with rate constant \(k\):

\[
-\frac{d[A]}{dt} = k[A] \implies \frac{d[A]}{[A]} = -k \, dt \implies \int_{[A]_0}^{[A]} \frac{d[A]'}{[A]'} = -k\int_0^t dt'
\]

Integrating: \(\ln[A] - \ln[A]_0 = -kt\), so \([A] = [A]_0 e^{-kt}\). This exponential decay is the hallmark of first-order kinetics, and the half-life \(t_{1/2} = \ln 2 / k\) is independent of the initial concentration — a fact that distinguishes first-order from higher-order kinetics and that underlies the use of radiocarbon dating. Atmospheric \(^{14}\text{C}\) is produced by cosmic-ray bombardment at a constant rate and decays with a half-life of 5730 years; the ratio \(^{14}\text{C}/^{12}\text{C}\) in a dead organism decreases according to first-order kinetics, allowing the age to be determined from the ratio's current value.

For a second-order reaction \(A + A \to P\) with rate law \(-d[A]/dt = k[A]^2\):

\[
\frac{d[A]}{[A]^2} = -k \, dt \implies -\frac{1}{[A]} + \frac{1}{[A]_0} = -kt \implies \frac{1}{[A]} = \frac{1}{[A]_0} + kt
\]

The integrated second-order rate law is linear in \(1/[A]\), not in \(\ln[A]\), and the half-life \(t_{1/2} = 1/(k[A]_0)\) depends on the initial concentration — an important diagnostic difference from first-order kinetics. Plotting \([A]\) versus \(t\) (curved for both orders), \(\ln[A]\) versus \(t\) (linear for first order), or \(1/[A]\) versus \(t\) (linear for second order) is the standard graphical method for determining the order of a reaction from concentration-time data.

## 3.3 First-Order Linear Equations: Consecutive Reactions

A first-order linear ODE has the form:

\[
\frac{dy}{dx} + P(x) y = Q(x)
\]

This is solved by multiplying both sides by the **integrating factor** \(\mu(x) = e^{\int P(x) dx}\), which converts the left side into an exact derivative:

\[
\mu(x) \frac{dy}{dx} + \mu(x) P(x) y = \mu(x) Q(x) \implies \frac{d}{dx}\left[\mu(x) y\right] = \mu(x) Q(x)
\]

Integrating both sides: \(\mu(x) y = \int \mu(x) Q(x) \, dx + C\), so \(y = \frac{1}{\mu(x)}\left[\int \mu(x) Q(x) \, dx + C\right]\).

An important chemical application is the equation for a first-order consecutive reaction \(A \to B \to C\), where \(B\) is the desired intermediate. The concentration of \(B\) satisfies:

\[
\frac{d[B]}{dt} = k_1[A] - k_2[B] = k_1[A]_0 e^{-k_1 t} - k_2[B]
\]

\[
\frac{d[B]}{dt} + k_2[B] = k_1[A]_0 e^{-k_1 t}
\]

This is a first-order linear ODE with \(P = k_2\) and \(Q = k_1[A]_0 e^{-k_1 t}\). The integrating factor is \(\mu = e^{k_2 t}\):

\[
\frac{d}{dt}\left[e^{k_2 t}[B]\right] = k_1[A]_0 e^{(k_2 - k_1)t}
\]

Integrating with initial condition \([B]_0 = 0\) (assuming \(k_1 \neq k_2\)):

\[
[B] = \frac{k_1[A]_0}{k_2 - k_1}\left(e^{-k_1 t} - e^{-k_2 t}\right)
\]

This result shows that \([B]\) rises from zero, reaches a maximum at time \(t_{\max} = \ln(k_2/k_1)/(k_2-k_1)\), and then falls toward zero as \(B\) is converted to \(C\). When \(k_2 \gg k_1\) (the intermediate is rapidly consumed), \([B]\) remains small at all times — this is the **steady-state approximation**: \(d[B]/dt \approx 0 \implies [B] \approx k_1[A]/k_2\). The steady-state approximation is used pervasively in enzyme kinetics (the Michaelis-Menten mechanism), in catalysis, and in the analysis of radical chain reactions.

## 3.4 Second-Order Linear ODEs: The Harmonic Oscillator and Quantum Mechanics

The most important class of second-order ODEs for chemistry is:

\[
a y'' + b y' + c y = f(x)
\]
where \(a\), \(b\), \(c\) are constants. For the homogeneous equation, trying \(y = e^{\lambda x}\) yields the **characteristic equation** \(a\lambda^2 + b\lambda + c = 0\) with roots \(\lambda = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}\). Three cases arise:

**Case 1: Two distinct real roots** \(\lambda_1 \neq \lambda_2\). The general solution is \(y_c = C_1 e^{\lambda_1 x} + C_2 e^{\lambda_2 x}\).

**Case 2: Repeated root** \(\lambda_1 = \lambda_2 = \lambda\). The general solution is \(y_c = (C_1 + C_2 x) e^{\lambda x}\).

**Case 3: Complex conjugate roots** \(\lambda = \alpha \pm i\beta\). The general solution in real form is \(y_c = e^{\alpha x}(C_1 \cos\beta x + C_2 \sin\beta x)\).

### 3.4.1 The Harmonic Oscillator

The **simple harmonic oscillator** is governed by:

\[
m\ddot{x} + kx = 0 \implies \ddot{x} + \omega_0^2 x = 0
\]
where \(\omega_0 = \sqrt{k/m}\) is the natural angular frequency. The characteristic equation \(\lambda^2 + \omega_0^2 = 0\) gives \(\lambda = \pm i\omega_0\) (Case 3 with \(\alpha = 0\)), so:

\[
x(t) = A\cos(\omega_0 t) + B\sin(\omega_0 t) = R\cos(\omega_0 t + \phi)
\]

where \(R = \sqrt{A^2 + B^2}\) is the amplitude and \(\phi = \arctan(-B/A)\) is the phase. The period is \(T = 2\pi/\omega_0\).

The harmonic oscillator is the foundational model for molecular vibrations. A diatomic molecule vibrates with frequency \(\nu = \omega_0/(2\pi) = \frac{1}{2\pi}\sqrt{k/\mu}\), where \(\mu = m_1 m_2/(m_1+m_2)\) is the reduced mass and \(k\) is the bond force constant. The force constant reflects bond stiffness: a C≡C triple bond has \(k \approx 1600 \text{ N/m}\), a C=C double bond has \(k \approx 960 \text{ N/m}\), and a C−C single bond has \(k \approx 500 \text{ N/m}\). Heavier isotopes vibrate more slowly at the same force constant, which is the basis for **kinetic isotope effects** in mechanistic studies: replacing H by D in a bond-breaking step slows the reaction by a factor that reflects the ratio \(\sqrt{\mu_{CH}/\mu_{CD}}\), providing experimental evidence for the extent to which bond breaking contributes to the rate-determining step.

The **quantum harmonic oscillator** replaces the classical equation of motion with the Schrödinger equation:

\[
-\frac{\hbar^2}{2\mu}\frac{d^2\psi}{dx^2} + \frac{1}{2}kx^2\psi = E\psi
\]

Substituting the dimensionless variable \(\xi = (\mu\omega/\hbar)^{1/2} x\) (where \(\omega = \sqrt{k/\mu}\)) converts this to the **Hermite equation**:

\[
\frac{d^2\psi}{d\xi^2} + \left(\varepsilon - \xi^2\right)\psi = 0, \quad \varepsilon = \frac{2E}{\hbar\omega}
\]

Seeking solutions as \(\psi(\xi) = H(\xi) e^{-\xi^2/2}\) (the Gaussian factor ensuring the wavefunction decays to zero at large displacements), the equation for \(H(\xi)\) is Hermite's equation: \(H'' - 2\xi H' + (\varepsilon - 1)H = 0\). Polynomial solutions (necessary for normalizability) exist only when \(\varepsilon - 1 = 2v\) for non-negative integer \(v\), giving energy eigenvalues:

\[
E_v = \left(v + \frac{1}{2}\right)\hbar\omega = \left(v + \frac{1}{2}\right)h\nu, \quad v = 0, 1, 2, \ldots
\]

The zero-point energy \(E_0 = \hbar\omega/2\) is the energy at \(v = 0\) and cannot be removed even at absolute zero. The wavefunctions are \(\psi_v(\xi) = N_v H_v(\xi) e^{-\xi^2/2}\), where \(H_v\) is the Hermite polynomial of degree \(v\) and \(N_v = (2^v v! \sqrt{\pi})^{-1/2}\) is the normalization constant. The selection rule \(\Delta v = \pm 1\) (only adjacent levels connected by dipole transitions) follows from the orthogonality of Hermite polynomials and the specific form of the dipole moment operator.

## 3.5 The Particle in a Box and Quantization from Boundary Conditions

The **particle in a one-dimensional box** is the simplest quantum mechanical system and the prototype for understanding quantization. A particle of mass \(m\) is confined to the region \(0 \leq x \leq L\) by infinite potential walls. The Schrödinger equation inside the box is:

\[
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2} = E\psi
\]

Setting \(k^2 = 2mE/\hbar^2\), the general solution is \(\psi(x) = A\sin(kx) + B\cos(kx)\). The boundary conditions \(\psi(0) = 0\) gives \(B = 0\); \(\psi(L) = 0\) gives \(kL = n\pi\) for positive integer \(n\). The quantized energies and normalized wavefunctions are:

\[
E_n = \frac{n^2 h^2}{8mL^2}, \quad \psi_n(x) = \sqrt{\frac{2}{L}}\sin\left(\frac{n\pi x}{L}\right)
\]

The particle in a box reveals several profound principles. The spacing between energy levels \(\Delta E_n = (2n+1)h^2/(8mL^2)\) decreases as \(L\) increases, explaining why macroscopic objects have negligibly spaced energy levels and behave classically. The electronic absorption spectrum of conjugated polyenes (such as carotenoids and cyanine dyes) is approximately described by the particle-in-a-box model: the \(\pi\) electrons are delocalized along the carbon chain (length \(L\)), and transitions from the HOMO (level \(N/2\) for \(N\) electrons) to the LUMO (level \(N/2 + 1\)) correspond to the absorption wavelength \(\lambda = 8mL^2c/[(N+1)h]\), which increases with chain length — qualitatively explaining why longer conjugated systems absorb at longer wavelengths (lower energy, redder color).

## 3.6 Special Functions: Legendre, Hermite, and Laguerre Polynomials

Many important ODEs in chemistry — those arising from the Schrödinger equation in different coordinate systems — do not have solutions expressible in terms of elementary functions. Instead, their solutions define new families of special functions.

**Hermite polynomials** \(H_v(\xi)\) are the polynomial parts of the quantum harmonic oscillator wavefunctions. They satisfy the Hermite equation and are defined by the recurrence \(H_{v+1}(\xi) = 2\xi H_v(\xi) - 2v H_{v-1}(\xi)\) starting from \(H_0 = 1\), \(H_1 = 2\xi\). Explicit expressions: \(H_2 = 4\xi^2 - 2\), \(H_3 = 8\xi^3 - 12\xi\). Hermite polynomials form a complete orthogonal set on \((-\infty, \infty)\) with weight \(e^{-\xi^2}\).

**Legendre polynomials** \(P_l(\cos\theta)\) arise from the angular part of the Laplacian in spherical coordinates. The Legendre equation is \(\frac{d}{du}\left[(1-u^2)\frac{dP}{du}\right] + l(l+1)P = 0\) where \(u = \cos\theta\). Polynomial solutions exist for non-negative integer \(l\): \(P_0 = 1\), \(P_1 = u\), \(P_2 = (3u^2-1)/2\), \(P_3 = (5u^3 - 3u)/2\). The associated Legendre functions \(P_l^m(u)\), defined by \(P_l^m(u) = (1-u^2)^{|m|/2} d^{|m|}P_l/du^{|m|}\), enter the spherical harmonics.

**Associated Laguerre polynomials** \(L_p^q(\rho)\) appear in the radial wavefunctions of the hydrogen atom, where \(\rho = 2r/(na_0)\) (with \(n\) the principal quantum number and \(a_0\) the Bohr radius). The radial function is \(R_{nl}(r) = N_{nl} \rho^l e^{-\rho/2} L_{n-l-1}^{2l+1}(\rho)\).

## 3.7 Fourier Analysis

<div class="definition">
The <strong>Fourier series</strong> of a function \(f(x)\) that is periodic with period \(2L\) is:

\[
f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[a_n \cos\left(\frac{n\pi x}{L}\right) + b_n \sin\left(\frac{n\pi x}{L}\right)\right]
\]
where the Fourier coefficients are:

\[
a_n = \frac{1}{L}\int_{-L}^{L} f(x) \cos\left(\frac{n\pi x}{L}\right) dx, \quad b_n = \frac{1}{L}\int_{-L}^{L} f(x)\sin\left(\frac{n\pi x}{L}\right) dx
\]
</div>

The key mathematical property enabling Fourier analysis is orthogonality. The cosine and sine functions at different integer frequencies are mutually orthogonal:

\[
\int_{-L}^{L}\cos\left(\frac{n\pi x}{L}\right)\cos\left(\frac{m\pi x}{L}\right)dx = L\delta_{nm}, \quad \int_{-L}^{L}\sin\left(\frac{n\pi x}{L}\right)\cos\left(\frac{m\pi x}{L}\right)dx = 0
\]

Multiplying the Fourier series by \(\cos(m\pi x/L)\) and integrating over one period isolates the coefficient \(a_m\) because all cross terms vanish by orthogonality — this is precisely why the integral formula for the coefficients works. The Fourier series can be written more compactly in complex exponential form using Euler's formula: \(f(x) = \sum_{n=-\infty}^{\infty} c_n e^{in\pi x/L}\), where \(c_n = \frac{1}{2L}\int_{-L}^{L} f(x) e^{-in\pi x/L} dx\). The complex Fourier series is particularly convenient in quantum mechanics, where the momentum eigenfunctions are complex exponentials.

The **Fourier transform** extends Fourier analysis to non-periodic functions by taking the period to infinity:

\[
\tilde{f}(k) = \int_{-\infty}^{\infty} f(x) e^{-ikx} dx, \quad f(x) = \frac{1}{2\pi}\int_{-\infty}^{\infty} \tilde{f}(k) e^{ikx} dk
\]

The Fourier transform maps between the position domain and the momentum (wavenumber) domain. A spatially localized function (narrow in position space) has a broadly spread Fourier transform (wide in momentum space), and vice versa. This is the mathematical origin of the Heisenberg uncertainty principle: if a wavefunction is a Gaussian \(\psi(x) = e^{-x^2/(4\sigma^2)}\) (a minimum-uncertainty state), its Fourier transform is also a Gaussian \(\tilde{\psi}(k) \propto e^{-k^2\sigma^2}\), and the product of the position and momentum uncertainties is exactly \(\Delta x \cdot \Delta p = \hbar/2\).

<div class="example">
<strong>Example 3.1: Fourier Series of a Square Wave</strong>

Let \(f(x)\) be the square wave with period \(2\pi\) defined by \(f(x) = +1\) for \(0 < x < \pi\) and \(f(x) = -1\) for \(-\pi < x < 0\). Find its Fourier series.

<em>Solution:</em> Since \(f(x)\) is an odd function, all cosine coefficients \(a_n = 0\). The sine coefficients are:

\[
b_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\sin(nx)dx = \frac{2}{\pi}\int_0^{\pi}\sin(nx)dx = \frac{2}{\pi}\left[-\frac{\cos(nx)}{n}\right]_0^{\pi} = \frac{2}{n\pi}(1 - \cos(n\pi))
\]
Since \(\cos(n\pi) = (-1)^n\): for even \(n\), \(b_n = 0\); for odd \(n\), \(b_n = 4/(n\pi)\). Thus:

\[
f(x) = \frac{4}{\pi}\left(\sin x + \frac{\sin 3x}{3} + \frac{\sin 5x}{5} + \cdots\right) = \frac{4}{\pi}\sum_{k=0}^{\infty}\frac{\sin(2k+1)x}{2k+1}
\]
Setting \(x = \pi/2\): \(1 = \frac{4}{\pi}\left(1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \cdots\right)\), yielding the Leibniz formula \(\pi/4 = 1 - 1/3 + 1/5 - \cdots\). The series exhibits the Gibbs phenomenon near the discontinuities: the partial sums overshoot by approximately 9% of the jump height, an artifact that is important to understand when interpreting digitally processed spectroscopic data.
</div>

In NMR spectroscopy, the free-induction decay (FID) — the time-domain signal after a radiofrequency pulse — is the Fourier transform of the frequency-domain NMR spectrum. The pulse excites all nuclear resonances simultaneously by tipping the net magnetization vector; the FID is recorded as the magnetization precesses and decays, and the inverse Fourier transform converts the oscillating time-domain signal into the familiar spectrum of peaks at characteristic chemical shifts. This is why modern instruments are called FT-NMR spectrometers and why the resolution achievable is limited by the length of the FID (longer acquisition times give better frequency resolution, since \(\Delta\nu \sim 1/t_{acq}\)).

In Fourier transform infrared (FTIR) spectroscopy, the interferogram is the Fourier transform of the infrared spectrum. A Michelson interferometer splits the IR beam into two paths; the path difference \(\delta\) between them is varied by moving one mirror. The detected intensity \(I(\delta) = \int_0^\infty B(\bar{\nu})(1 + \cos(2\pi\bar{\nu}\delta))d\bar{\nu}\) is the cosine Fourier transform of the spectral intensity \(B(\bar{\nu})\), and applying the inverse transform gives the spectrum. The multiplex (Fellgett) advantage — detecting all frequencies simultaneously rather than scanning one at a time — improves signal-to-noise ratio by a factor of \(\sqrt{N}\) where \(N\) is the number of resolution elements.

---

# Chapter 4: Vectors, Vector Spaces, and Vector Algebra

## 4.1 Introduction to Vectors

In chemistry, many physical quantities cannot be fully described by a single number. Displacement, velocity, force, electric field, magnetic field, dipole moment, and angular momentum all have both a magnitude and a direction — these are **vector quantities**. Scalars have magnitude only: temperature, pressure, mass, and energy are scalar quantities. The mathematical structure of vectors allows physical laws to be expressed in a coordinate-independent form, revealing their universal validity regardless of the orientation of the coordinate system chosen for calculation.

<div class="definition">
A <strong>vector</strong> in three-dimensional Euclidean space \(\mathbb{R}^3\) is an ordered triple of real numbers \(\mathbf{v} = (v_x, v_y, v_z)\), equivalently represented as an arrow with a specified magnitude \(|\mathbf{v}| = \sqrt{v_x^2 + v_y^2 + v_z^2}\) and direction.
</div>

The **unit vectors** \(\hat{\mathbf{i}}\), \(\hat{\mathbf{j}}\), \(\hat{\mathbf{k}}\) along the three Cartesian axes form an orthonormal basis: they have unit length and are mutually perpendicular. Every vector can be decomposed into components along these axes: \(\mathbf{v} = v_x\hat{\mathbf{i}} + v_y\hat{\mathbf{j}} + v_z\hat{\mathbf{k}}\). In chemistry, the position vector \(\mathbf{r} = (x, y, z)\) specifies the location of a nucleus or electron. The molecular dipole moment \(\boldsymbol{\mu} = \sum_i q_i \mathbf{r}_i\) (where the sum runs over all charges \(q_i\) at positions \(\mathbf{r}_i\)) is a vector quantity that determines the interaction of the molecule with an electric field and governs the selection rules for rotational spectroscopy.

## 4.2 Vector Algebra: Addition, Subtraction, and Scalar Multiplication

Vector addition follows the triangle law (place the tail of the second vector at the head of the first, then draw the resultant from the tail of the first to the head of the second) or the parallelogram law (place both vectors at the same point and draw the diagonal of the parallelogram as the resultant): \(\mathbf{a} + \mathbf{b} = (a_x + b_x, a_y + b_y, a_z + b_z)\). Vector addition is commutative (\(\mathbf{a} + \mathbf{b} = \mathbf{b} + \mathbf{a}\)) and associative. Scalar multiplication stretches or reverses a vector: \(\alpha\mathbf{v} = (\alpha v_x, \alpha v_y, \alpha v_z)\).

The linear combination (superposition) of vectors \(\mathbf{w} = \alpha\mathbf{a} + \beta\mathbf{b}\) is the mathematical form that appears in orbital hybridization (where sp, sp², and sp³ hybrid orbitals are linear combinations of s and p atomic orbitals), in molecular orbital theory (MOs as linear combinations of AOs), and in quantum mechanical superposition states. The coefficients \(\alpha\) and \(\beta\) play the role of amplitudes whose squares give probabilities.

## 4.3 The Dot Product: Projections and Orthogonality

<div class="definition">
The <strong>scalar (dot) product</strong> of two vectors \(\mathbf{a}\) and \(\mathbf{b}\) is:

\[
\mathbf{a} \cdot \mathbf{b} = a_x b_x + a_y b_y + a_z b_z = |\mathbf{a}||\mathbf{b}|\cos\theta
\]
where \(\theta\) is the angle between them. The dot product yields a scalar.
</div>

The dot product is commutative (\(\mathbf{a} \cdot \mathbf{b} = \mathbf{b} \cdot \mathbf{a}\)) and equals zero when \(\mathbf{a}\) and \(\mathbf{b}\) are perpendicular (\(\theta = 90°\)). The projection of \(\mathbf{b}\) onto \(\mathbf{a}\) is \((\mathbf{a} \cdot \mathbf{b})/|\mathbf{a}|\). The work done by a force \(\mathbf{F}\) on a displacement \(\mathbf{d}\) is \(W = \mathbf{F} \cdot \mathbf{d} = Fd\cos\theta\) — only the component of force parallel to the displacement does work. In NMR, the interaction energy of a magnetic dipole \(\boldsymbol{\mu}\) with an applied field \(\mathbf{B}_0\) is \(E = -\boldsymbol{\mu} \cdot \mathbf{B}_0 = -\mu_z B_0\) (for \(\mathbf{B}_0\) along \(z\)), which is the origin of the nuclear Zeeman effect.

## 4.4 The Cross Product: Angular Momentum and Torque

The **vector (cross) product** of two vectors produces a third vector perpendicular to both:

\[
\mathbf{a} \times \mathbf{b} = (a_y b_z - a_z b_y)\hat{\mathbf{i}} - (a_x b_z - a_z b_x)\hat{\mathbf{j}} + (a_x b_y - a_y b_x)\hat{\mathbf{k}}
\]

compactly written as the determinant

\[
\mathbf{a} \times \mathbf{b} = \begin{vmatrix}\hat{\mathbf{i}} & \hat{\mathbf{j}} & \hat{\mathbf{k}} \\ a_x & a_y & a_z \\ b_x & b_y & b_z\end{vmatrix}
\]

The magnitude is \(|\mathbf{a} \times \mathbf{b}| = |\mathbf{a}||\mathbf{b}|\sin\theta\), equal to the area of the parallelogram spanned by \(\mathbf{a}\) and \(\mathbf{b}\). The cross product is anti-commutative: \(\mathbf{a} \times \mathbf{b} = -\mathbf{b} \times \mathbf{a}\). The direction of \(\mathbf{a} \times \mathbf{b}\) follows the right-hand rule.

The angular momentum \(\mathbf{L} = \mathbf{r} \times \mathbf{p}\) (position crossed with linear momentum) is defined by the cross product. In the Bohr model, the electron's angular momentum magnitude is quantized in units of \(\hbar\). In quantum mechanics, the angular momentum operator \(\hat{\mathbf{L}} = \hat{\mathbf{r}} \times \hat{\mathbf{p}}\) has components that satisfy the commutation relations \(\left[\hat{L}_x, \hat{L}_y\right] = i\hbar\hat{L}_z\) (and cyclic permutations), which are the mathematical origin of the quantization rules \(L = \sqrt{l(l+1)}\hbar\) and \(L_z = m_l\hbar\).

## 4.5 Scalar and Vector Fields; Gradient, Divergence, Curl

A **scalar field** \(f(x,y,z)\) assigns a scalar value to each point in space (e.g., temperature, electric potential, electron density). A **vector field** \(\mathbf{F}(x,y,z)\) assigns a vector to each point (e.g., electric field, magnetic field, velocity of fluid flow).

<div class="definition">
The <strong>gradient</strong> of a scalar field \(f\) is the vector field:

\[
\nabla f = \frac{\partial f}{\partial x}\hat{\mathbf{i}} + \frac{\partial f}{\partial y}\hat{\mathbf{j}} + \frac{\partial f}{\partial z}\hat{\mathbf{k}}
\]
pointing in the direction of steepest ascent of \(f\), with magnitude equal to the rate of increase in that direction.
</div>

The force on a particle in a potential energy field is \(\mathbf{F} = -\nabla V\): the force points in the direction of decreasing potential energy and has magnitude equal to the potential gradient. This is the mathematical form of the classical statement that objects roll downhill. In electrochemistry, the electric field \(\mathbf{E} = -\nabla\phi\) (gradient of the electric potential) drives charge transport, and the current density is \(\mathbf{J} = \sigma\mathbf{E}\) (Ohm's law in vector form, where \(\sigma\) is conductivity).

The **divergence** of a vector field \(\mathbf{F}\) measures its sources and sinks: \(\nabla \cdot \mathbf{F} = \partial F_x/\partial x + \partial F_y/\partial y + \partial F_z/\partial z\). Gauss's law, \(\nabla \cdot \mathbf{E} = \rho/\epsilon_0\), states that positive charges are sources and negative charges are sinks of the electric field. The **Laplacian** \(\nabla^2 f = \nabla \cdot (\nabla f) = \partial^2 f/\partial x^2 + \partial^2 f/\partial y^2 + \partial^2 f/\partial z^2\) appears in the Schrödinger equation's kinetic energy operator and in the diffusion equation \(\partial c/\partial t = D\nabla^2 c\), which describes how concentration gradients spread in time with diffusion coefficient \(D\).

---

# Chapter 5: Operators and Matrices

## 5.1 Determinants: Theory and Chemical Applications

The **determinant** of a square matrix encodes whether the matrix is invertible and represents geometrically the signed volume scaling factor of the linear transformation.

For a \(2 \times 2\) matrix: \(\det\begin{pmatrix}a & b \\ c & d\end{pmatrix} = ad - bc\).

The expansion by cofactors along any row or column:

\[
\det A = \sum_j (-1)^{i+j} a_{ij} M_{ij}
\]
where \(M_{ij}\) is the \((i,j)\) minor (determinant of the submatrix obtained by deleting row \(i\) and column \(j\)).

In Hückel molecular orbital theory, the secular determinant \(\det(\mathbf{H} - E\mathbf{S}) = 0\) yields the MO energies of conjugated \(\pi\) systems. For butadiene (four carbon atoms, four \(\pi\) electrons), the \(4 \times 4\) Hückel determinant in units where \(x = (\alpha - E)/\beta\) is:

\[
\begin{vmatrix}x & 1 & 0 & 0 \\ 1 & x & 1 & 0 \\ 0 & 1 & x & 1 \\ 0 & 0 & 1 & x\end{vmatrix} = x^4 - 3x^2 + 1 = 0
\]

Solving: \(x^2 = (3 \pm \sqrt{5})/2\), giving four orbital energies \(E = \alpha \pm 1.618|\beta|\) and \(E = \alpha \pm 0.618|\beta|\). With four \(\pi\) electrons in the two lowest MOs, the total \(\pi\) energy is \(4\alpha + 4.472|\beta|\), and the delocalization energy relative to two isolated double bonds (\(4\alpha + 4|\beta|\)) is \(0.472|\beta| \approx 60 \text{ kJ/mol}\). This quantifies the stabilization of conjugated systems and correctly predicts that 1,3-butadiene is more stable than two isolated ethylene molecules by about 15 kJ/mol (the experimental resonance energy).

## 5.2 Matrix Algebra: Operations and Properties

Matrix addition (\((A + B)_{ij} = a_{ij} + b_{ij}\)) requires equal dimensions. Matrix multiplication:

\[
(AB)_{ij} = \sum_k a_{ik} b_{kj}
\]
is associative and distributive over addition but generally not commutative. The **transpose** \((A^T)_{ij} = a_{ji}\) and the **Hermitian adjoint** \((A^\dagger)_{ij} = a_{ji}^*\) are essential operations. A matrix is:
- **Symmetric** if \(A^T = A\) (real case)
- **Hermitian** if \(A^\dagger = A\) (complex case) — all physical observables in QM are Hermitian
- **Orthogonal** if \(A^T = A^{-1}\) — symmetry operations (rotations, reflections) are orthogonal
- **Unitary** if \(A^\dagger = A^{-1}\) — unitary matrices preserve inner products in complex vector spaces

The **trace** of a square matrix, \(\text{tr}(A) = \sum_i a_{ii}\), is the sum of diagonal elements. The trace is invariant under cyclic permutation: \(\text{tr}(ABC) = \text{tr}(BCA) = \text{tr}(CAB)\), and importantly, the trace is invariant under similarity transformations: \(\text{tr}(PAP^{-1}) = \text{tr}(A)\). In group theory, the **character** of a symmetry operation in a given representation is the trace of the corresponding representation matrix; the character is the same regardless of which basis is chosen for the representation. The character table of a point group lists these characters and is the fundamental tool for applying symmetry to spectroscopy and bonding.

## 5.3 The Inverse Matrix and Linear Systems

For a square matrix \(A\) with \(\det A \neq 0\), the inverse \(A^{-1}\) satisfies \(AA^{-1} = I\). For a \(2 \times 2\) matrix:

\[
\begin{pmatrix}a & b \\ c & d\end{pmatrix}^{-1} = \frac{1}{ad-bc}\begin{pmatrix}d & -b \\ -c & a\end{pmatrix}
\]

For larger matrices, the inverse is computed by Gaussian elimination or via the adjugate matrix: \(A^{-1} = \text{adj}(A)/\det(A)\), where \(\text{adj}(A)_{ij} = (-1)^{i+j}M_{ji}\).

**Gaussian elimination** solves the system \(\mathbf{Ax} = \mathbf{b}\) by augmenting \(A\) with \(\mathbf{b}\) and reducing to row echelon form. For a system of \(n\) equations:
- If \(\det A \neq 0\): unique solution \(\mathbf{x} = A^{-1}\mathbf{b}\)
- If \(\det A = 0\): either no solution (inconsistent) or infinitely many solutions (underdetermined)

In analytical chemistry, the problem of determining the concentrations of \(n\) species from \(n\) spectrophotometric measurements at \(n\) wavelengths is exactly the problem \(\mathbf{Ax} = \mathbf{b}\), where \(a_{ij}\) is the molar absorptivity of species \(j\) at wavelength \(i\), \(x_j\) is the concentration of species \(j\), and \(b_i\) is the measured absorbance at wavelength \(i\). Solving this linear system (assuming the matrix is non-singular, which requires the spectra to be linearly independent) simultaneously determines all concentrations.

## 5.4 Matrix Eigenvalue Problems in Quantum Chemistry

The matrix eigenvalue problem \(A\mathbf{v} = \lambda\mathbf{v}\) is solved by finding the roots of the characteristic polynomial \(\det(A - \lambda I) = 0\). For a Hermitian matrix, all eigenvalues are real and the eigenvectors form a complete orthonormal set — which is precisely what is needed for a consistent probabilistic interpretation of quantum mechanics.

<div class="example">
<strong>Example 5.1: Hückel MO Theory for Benzene</strong>

Benzene has six equivalent carbon atoms in a ring. By symmetry, the Hückel Hamiltonian matrix is a \(6 \times 6\) circulant matrix (each row is a cyclic shift of the previous). The secular equation factors using the discrete Fourier transform for cyclic systems. The orbital energies are:

\[
E_k = \alpha + 2\beta\cos\left(\frac{2\pi k}{6}\right), \quad k = 0, 1, 2, 3, 4, 5
\]
yielding: \(E_0 = \alpha + 2\beta\) (non-degenerate, \(\pi_1\)); \(E_1 = E_5 = \alpha + \beta\) (doubly degenerate, \(\pi_2, \pi_3\)); \(E_2 = E_4 = \alpha - \beta\) (doubly degenerate, \(\pi_4^*, \pi_5^*\)); \(E_3 = \alpha - 2\beta\) (non-degenerate, \(\pi_6^*\)). With six \(\pi\) electrons filling the three bonding MOs, the total \(\pi\) energy is \(2(\alpha + 2\beta) + 4(\alpha + \beta) = 6\alpha + 8\beta\). Compared to three isolated double bonds (\(6\alpha + 6\beta\)), the delocalization (resonance) energy is \(2|\beta| \approx 480 \text{ kJ/mol}\). This large resonance energy explains benzene's exceptional thermodynamic stability and its tendency to undergo substitution rather than addition reactions.
</div>

## 5.5 Symmetry Operations as Linear Transformations

Every symmetry operation on a molecule can be represented as a linear transformation acting on Cartesian coordinates \((x, y, z)\):

**Identity (E):** \(\begin{pmatrix}1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1\end{pmatrix}\)

**Reflection in the \(xy\)-plane \((\sigma_h\)):** \(\begin{pmatrix}1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & -1\end{pmatrix}\)

**Inversion \((i)\):** \(\begin{pmatrix}-1 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & -1\end{pmatrix}\)

**Rotation by \(2\pi/n\) about \(z\)-axis \((C_n)\):** \(\begin{pmatrix}\cos(2\pi/n) & -\sin(2\pi/n) & 0 \\ \sin(2\pi/n) & \cos(2\pi/n) & 0 \\ 0 & 0 & 1\end{pmatrix}\)

These matrices form a **group** (the point group of the molecule) under matrix multiplication. The **character** (trace) of each matrix depends only on the class of the operation, not on the choice of basis — this is why character tables, not full matrix tables, are sufficient for most applications in spectroscopy and bonding.

The direct product of representations (used to determine the symmetry species of products of orbitals or vibrational modes) follows from the product of character values: \(\chi^{(A \times B)}(R) = \chi^{(A)}(R) \cdot \chi^{(B)}(R)\) for each symmetry operation \(R\). The reduction formula for decomposing a reducible representation into its irreducible components uses the group's orthogonality theorem and involves the traces of all representation matrices — another application of matrix algebra to chemical problems.

---

# Chapter 6: Applying Mathematical Methods to Quantum Chemistry

## 6.1 The Variational Principle

The variational principle states that for any normalized trial wavefunction \(|\tilde{\psi}\rangle\), the expectation value of the Hamiltonian provides an upper bound to the true ground-state energy \(E_0\):

\[
E_{trial} = \frac{\langle\tilde{\psi}|\hat{H}|\tilde{\psi}\rangle}{\langle\tilde{\psi}|\tilde{\psi}\rangle} \geq E_0
\]

The proof follows from expanding \(|\tilde{\psi}\rangle\) in the (unknown) complete orthonormal basis of energy eigenstates \(|\psi_n\rangle\): \(|\tilde{\psi}\rangle = \sum_n c_n|\psi_n\rangle\). Then \(\langle\tilde{\psi}|\hat{H}|\tilde{\psi}\rangle = \sum_n |c_n|^2 E_n \geq E_0 \sum_n |c_n|^2 = E_0\). The variational principle allows the optimization of trial wavefunction parameters to minimize \(E_{trial}\) and thereby approach the true ground-state energy from above.

The **linear variation method** (which leads to the Roothaan-Hall equations of Hartree-Fock theory) expresses the trial wavefunction as a linear combination of basis functions \(|\phi_\mu\rangle\): \(|\tilde{\psi}\rangle = \sum_\mu c_\mu |\phi_\mu\rangle\). Minimizing \(E_{trial}\) with respect to the coefficients \(c_\mu^*\) leads to the generalized eigenvalue problem \(\mathbf{Hc} = E\mathbf{Sc}\), where \(H_{\mu\nu} = \langle\phi_\mu|\hat{H}|\phi_\nu\rangle\) and \(S_{\mu\nu} = \langle\phi_\mu|\phi_\nu\rangle\). This elegant derivation shows how the mathematical framework of matrices and linear algebra directly produces the practical computational methods of quantum chemistry.

## 6.2 Perturbation Theory and Power Series

Many quantum mechanical problems cannot be solved exactly but can be treated by **perturbation theory** when a small parameter \(\lambda\) quantifies the deviation from an exactly solvable problem. The total Hamiltonian is written as \(\hat{H} = \hat{H}^{(0)} + \lambda\hat{H}'\), where \(\hat{H}^{(0)}\) is the unperturbed Hamiltonian (with known eigenvalues \(E_n^{(0)}\) and eigenfunctions \(|\psi_n^{(0)}\rangle\)) and \(\hat{H}'\) is the perturbation.

The energy and wavefunctions are expanded as power series in \(\lambda\):

\[
E_n = E_n^{(0)} + \lambda E_n^{(1)} + \lambda^2 E_n^{(2)} + \cdots
\]

\[
|\psi_n\rangle = |\psi_n^{(0)}\rangle + \lambda|\psi_n^{(1)}\rangle + \lambda^2|\psi_n^{(2)}\rangle + \cdots
\]

Substituting into the Schrödinger equation and collecting powers of \(\lambda\) yields:

- Zeroth order: \(\hat{H}^{(0)}|\psi_n^{(0)}\rangle = E_n^{(0)}|\psi_n^{(0)}\rangle\) (the unperturbed equation)
- First order: \(E_n^{(1)} = \langle\psi_n^{(0)}|\hat{H}'|\psi_n^{(0)}\rangle\) (the first-order energy correction is the expectation value of the perturbation in the unperturbed state)
- Second order: \(E_n^{(2)} = \sum_{m\neq n} \frac{|\langle\psi_m^{(0)}|\hat{H}'|\psi_n^{(0)}\rangle|^2}{E_n^{(0)} - E_m^{(0)}}\)

Perturbation theory is used throughout spectroscopy: the spin-orbit coupling, the Stark effect (energy shift in an electric field), and the Zeeman effect (energy shift in a magnetic field) are all calculated as first or second-order perturbation corrections. The polarizability \(\alpha\) of a molecule (relating the induced dipole to the applied field) is a second-order perturbation property, involving a sum over all excited states weighted by the square of their transition dipole moment divided by the excitation energy — the Kramers-Heisenberg expression.

## 6.3 Statistical Mechanics: Partition Functions and Thermodynamics

The **partition function** \(q\) of a molecule is the central quantity of statistical mechanics, from which all thermodynamic properties can be derived. It is defined as:

\[
q = \sum_i g_i e^{-E_i/(k_BT)}
\]

where the sum runs over all energy levels \(E_i\) with degeneracy \(g_i\). The partition function is essentially the Laplace transform (evaluated at \(s = 1/(k_BT)\)) of the density of states, and its mathematical properties directly determine thermodynamic behavior.

The connection to thermodynamics follows from the relation between the partition function and the Helmholtz free energy: \(A = -Nk_BT\ln q\) (for \(N\) distinguishable non-interacting particles). Differentiating:

\[
U = -N\frac{\partial \ln q}{\partial (1/k_BT)} = Nk_BT^2\frac{\partial \ln q}{\partial T}
\]

\[
S = Nk_B\left(\ln q + T\frac{\partial \ln q}{\partial T}\right) = Nk_B\ln q + \frac{U}{T}
\]

\[
C_V = \frac{\partial U}{\partial T} = Nk_BT\left(2\frac{\partial \ln q}{\partial T} + T\frac{\partial^2 \ln q}{\partial T^2}\right)
\]

The partition function factorizes for independent degrees of freedom: \(q = q_{trans} q_{rot} q_{vib} q_{elec}\), and each factor's contribution to thermodynamic properties is additive. This factorization and its evaluation using the integrals and series of calculus is a central activity in statistical thermodynamics, illustrating how the mathematical methods of CHEM 240 underlie the most quantitative aspects of physical chemistry.

<div class="remark">
The mathematical methods assembled in CHEM 240 — complex numbers, Taylor series, ordinary and partial differential equations, Fourier analysis, vector calculus, and matrix algebra — are not isolated techniques but form a deeply interconnected web. Euler's formula connects complex exponentials to trigonometry; Fourier analysis is the expansion of functions in an orthonormal basis of complex exponentials; the harmonic oscillator ODE has characteristic equation roots that are imaginary, connecting it to oscillatory behavior via Euler's formula; the Schrödinger equation is simultaneously a PDE, an operator eigenvalue problem, and (via the time-dependent formulation) a system of coupled first-order ODEs. Perturbation theory requires Taylor expansion of eigenvalues in a small parameter. The variational principle requires optimization (calculus) of a functional (linear algebra). Mastering this toolkit in its interconnected fullness — understanding not just how to apply each technique but why it works and how it connects to the others — is the lasting intellectual benefit of this course, and the foundation for every quantitative activity in your remaining years as a chemist.
</div>
