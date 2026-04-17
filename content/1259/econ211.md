---
title: "ECON 211: Introduction to Mathematical Economics"
prof: "Dr. Olivia Mesta"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Hoy, Michael, John Livernois, Chris McKenna, Ray Rees, and Thanasis Stengos. *Mathematics for Economics*, 3rd or 4th ed. MIT Press, 2011/2022. (Standard reference for all topics below.)

**Supplementary texts** — Simon, Carl P. and Lawrence Blume. *Mathematics for Economists*. W.W. Norton, 1994; Chiang, Alpha C. and Kevin Wainwright. *Fundamental Methods of Mathematical Economics*, 4th ed. McGraw-Hill, 2005; Sydsaeter, Knut, Peter Hammond, Atle Seierstad, and Arne Strom. *Further Mathematics for Economic Analysis*, 2nd ed. Prentice Hall, 2008.

**Online resources** — MIT OpenCourseWare 14.102 (Mathematics for Economists), Paul's Online Math Notes (calculus refresher), Khan Academy multivariable calculus, Knut Sydsaeter's companion exercises available through the publisher website.

---

# Chapter 1: Logic, Proof, and Mathematical Foundations

## 1.1 Propositions and Logical Connectives

Mathematics is built on precise logical reasoning. A **proposition** is a declarative statement that is either true or false, but not both. In economic modeling, propositions typically take the form "if the market is competitive, then price equals marginal cost."

The core logical connectives are conjunction (and, \( \wedge \)), disjunction (or, \( \vee \)), negation (not, \( \neg \)), implication (\( \Rightarrow \)), and biconditional (\( \Leftrightarrow \)). The implication \( P \Rightarrow Q \) is false only when \( P \) is true and \( Q \) is false — it says nothing about situations where \( P \) is false.

<div class="definition">
<strong>Implication and its variants:</strong> Given the statement "If \( P \) then \( Q \)" (\( P \Rightarrow Q \)):
<ul>
<li><strong>Converse:</strong> \( Q \Rightarrow P \)</li>
<li><strong>Contrapositive:</strong> \( \neg Q \Rightarrow \neg P \) (logically equivalent to the original)</li>
<li><strong>Inverse:</strong> \( \neg P \Rightarrow \neg Q \) (logically equivalent to the converse)</li>
</ul>
</div>

The contrapositive is especially useful in proof-writing: to prove \( P \Rightarrow Q \), it is equivalent — and sometimes easier — to prove that \( \neg Q \Rightarrow \neg P \).

## 1.2 Methods of Proof

Economic theory relies on several standard proof strategies. The most common are:

**Direct proof:** Assume \( P \) is true and derive \( Q \) by a chain of valid inferences. Most textbook proofs follow this pattern.

**Proof by contraposition:** Assume \( \neg Q \) and derive \( \neg P \). Particularly useful when the negation of the conclusion provides a cleaner starting point.

**Proof by contradiction:** Assume both \( P \) and \( \neg Q \). Derive a logical contradiction (a statement that is necessarily false), thereby establishing that the assumption \( \neg Q \) cannot hold when \( P \) is true.

**Proof by induction:** Used for statements indexed by natural numbers. Establish the base case (typically \( n = 1 \)), then show that if the statement holds for \( n = k \), it holds for \( n = k + 1 \).

<div class="example">
<strong>Example — proof by contradiction:</strong> Prove that \( \sqrt{2} \) is irrational.
<br><em>Proof.</em> Suppose for contradiction that \( \sqrt{2} = p/q \) where \( p, q \in \mathbb{Z} \) and \( \gcd(p,q) = 1 \) (the fraction is in lowest terms). Then \( 2 = p^2/q^2 \), so \( p^2 = 2q^2 \). Thus \( p^2 \) is even, which means \( p \) is even; write \( p = 2m \). Then \( 4m^2 = 2q^2 \), so \( q^2 = 2m^2 \) is even, meaning \( q \) is even. But then \( 2 \mid \gcd(p,q) \), contradicting \( \gcd(p,q) = 1 \). Hence \( \sqrt{2} \) is irrational.
</div>

## 1.3 Sets and Set Operations

A **set** is a collection of objects (elements). Standard notation: \( x \in S \) means \( x \) is an element of \( S \); \( S \subseteq T \) means \( S \) is a subset of \( T \).

Key operations: \( S \cup T \) (union), \( S \cap T \) (intersection), \( S \setminus T \) (set difference), and \( S^c \) (complement relative to some universal set). Cartesian product: \( S \times T = \{(s,t) : s \in S,\, t \in T\} \). The real line is \( \mathbb{R} \), and \( \mathbb{R}^n \) denotes \( n \)-dimensional Euclidean space.

---

# Chapter 2: Functions of a Single Variable

## 2.1 Definition and Properties

<div class="definition">
<strong>Function:</strong> A function \( f: D \to \mathbb{R} \) assigns to each element \( x \) of the domain \( D \subseteq \mathbb{R} \) exactly one real number \( f(x) \), called the image or value of \( f \) at \( x \). The set of all images is the range (or codomain) of \( f \).
</div>

Key properties economists care about:

- **Injectivity (one-to-one):** \( f(x_1) = f(x_2) \Rightarrow x_1 = x_2 \). Injective functions have well-defined inverses on their range.
- **Surjectivity (onto):** Every element of the codomain is the image of some element in the domain.
- **Bijectivity:** Both injective and surjective; admits a unique inverse \( f^{-1} \).
- **Monotonicity:** \( f \) is increasing if \( x_1 < x_2 \Rightarrow f(x_1) \leq f(x_2) \) (strictly increasing if the inequality is strict).

## 2.2 Common Function Classes

**Polynomial functions:** \( f(x) = a_n x^n + a_{n-1} x^{n-1} + \cdots + a_0 \). Linear demand and supply curves are degree-1 polynomials.

**Power functions:** \( f(x) = x^r \) for real \( r \). Cobb-Douglas production functions involve products of power functions.

**Exponential and logarithmic functions:** \( f(x) = e^x \) is its own derivative; \( \ln x \) is its inverse. These appear constantly in growth models and utility functions (log utility \( U = \ln C \) exhibits diminishing marginal utility).

**Inverse functions:** If \( f \) is strictly monotone, then the inverse \( f^{-1} \) satisfies \( f^{-1}(f(x)) = x \) for all \( x \) in the domain. Geometrically, the graph of \( f^{-1} \) is the reflection of the graph of \( f \) across the line \( y = x \).

---

# Chapter 3: Limits and Continuity

## 3.1 The Concept of a Limit

<div class="definition">
<strong>Limit:</strong> We write \( \lim_{x \to a} f(x) = L \) if, for every \( \varepsilon > 0 \), there exists \( \delta > 0 \) such that \( 0 < |x - a| < \delta \Rightarrow |f(x) - L| < \varepsilon \). The function value \( f(a) \) need not equal \( L \), or \( f \) need not even be defined at \( a \).
</div>

The formal \( \varepsilon \)-\( \delta \) definition captures the intuition that \( f(x) \) can be made arbitrarily close to \( L \) by taking \( x \) sufficiently close to \( a \). In practice, limits are computed using algebraic simplification, factoring, and the standard limit rules:

\[
\lim_{x \to a} \left[ f(x) \pm g(x) \right] = \lim_{x \to a} f(x) \pm \lim_{x \to a} g(x)
\]

\[
\lim_{x \to a} \left[ f(x) \cdot g(x) \right] = \lim_{x \to a} f(x) \cdot \lim_{x \to a} g(x)
\]

provided the individual limits exist. Division is valid when the limit of the denominator is non-zero.

**L'Hôpital's Rule:** If \( \lim_{x \to a} f(x) = \lim_{x \to a} g(x) = 0 \) (or both \( \pm\infty \)), and \( g'(x) \neq 0 \) near \( a \), then:

\[
\lim_{x \to a} \frac{f(x)}{g(x)} = \lim_{x \to a} \frac{f'(x)}{g'(x)}
\]

## 3.2 One-Sided Limits and Limits at Infinity

The **right-hand limit** \( \lim_{x \to a^+} f(x) = L \) requires \( x \) to approach \( a \) from above; the **left-hand limit** \( \lim_{x \to a^-} f(x) = L \) from below. The two-sided limit exists if and only if both one-sided limits exist and are equal.

Limits at infinity describe the long-run behavior of a function:

\[
\lim_{x \to \infty} \frac{1}{x} = 0, \quad \lim_{x \to \infty} e^{-x} = 0, \quad \lim_{x \to \infty} \ln x = \infty
\]

These appear in growth theory when studying the behavior of capital-to-labor ratios as the economy matures.

## 3.3 Continuity

<div class="definition">
<strong>Continuity at a point:</strong> A function \( f \) is continuous at \( x = a \) if:
<ol>
<li>\( f(a) \) is defined,</li>
<li>\( \lim_{x \to a} f(x) \) exists,</li>
<li>\( \lim_{x \to a} f(x) = f(a) \).</li>
</ol>
\( f \) is continuous on an interval if it is continuous at every point in the interval.
</div>

Continuous functions enjoy powerful properties used throughout economics:

- **Intermediate Value Theorem (IVT):** If \( f \) is continuous on \( [a,b] \) and \( y \) is between \( f(a) \) and \( f(b) \), then there exists \( c \in (a,b) \) with \( f(c) = y \). Used to establish existence of equilibria.
- **Extreme Value Theorem (EVT):** If \( f \) is continuous on a closed bounded interval \( [a,b] \), then \( f \) attains its maximum and minimum on \( [a,b] \). Guarantees that optimization problems have solutions on compact domains.

---

# Chapter 4: Differentiation

## 4.1 The Derivative

<div class="definition">
<strong>Derivative:</strong> The derivative of \( f \) at \( x \) is:

\[
f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}
\]
provided this limit exists. If the limit exists, \( f \) is called <em>differentiable</em> at \( x \). Alternative notations: \( \frac{df}{dx} \), \( \frac{d}{dx}f(x) \), \( Df(x) \).
</div>

The derivative measures the instantaneous rate of change of \( f \) with respect to \( x \). Geometrically, \( f'(x_0) \) is the slope of the tangent line to the graph of \( f \) at the point \( (x_0, f(x_0)) \).

**Differentiability implies continuity:** If \( f \) is differentiable at \( a \), then \( f \) is continuous at \( a \). The converse fails — for example, \( f(x) = |x| \) is continuous but not differentiable at \( x = 0 \).

## 4.2 Rules of Differentiation

The following rules are the workhorses of calculus in economics. Let \( f \) and \( g \) be differentiable functions.

**Constant rule:** \( \frac{d}{dx} c = 0 \)

**Power rule:** \( \frac{d}{dx} x^n = n x^{n-1} \) for any real \( n \)

**Sum/difference rule:** \( (f \pm g)' = f' \pm g' \)

**Constant multiple rule:** \( (cf)' = c f' \)

<div class="theorem">
<strong>Product Rule:</strong> If \( f \) and \( g \) are differentiable, then:

\[
(fg)' = f'g + fg'
\]
</div>

<div class="theorem">
<strong>Quotient Rule:</strong> If \( g(x) \neq 0 \), then:

\[
\left(\frac{f}{g}\right)' = \frac{f'g - fg'}{g^2}
\]
</div>

<div class="theorem">
<strong>Chain Rule:</strong> If \( g \) is differentiable at \( x \) and \( f \) is differentiable at \( g(x) \), then the composite function \( h(x) = f(g(x)) \) is differentiable at \( x \), with:

\[
h'(x) = f'(g(x)) \cdot g'(x)
\]
In Leibniz notation, if \( y = f(u) \) and \( u = g(x) \), then \( \frac{dy}{dx} = \frac{dy}{du} \cdot \frac{du}{dx} \).
</div>

<div class="example">
<strong>Worked example — chain rule:</strong> Let \( f(x) = (3x^2 + 5)^4 \). Set \( u = 3x^2 + 5 \), so \( f = u^4 \).

\[
f'(x) = 4u^3 \cdot \frac{du}{dx} = 4(3x^2+5)^3 \cdot 6x = 24x(3x^2+5)^3
\]
</div>

**Standard derivatives:**

\[
\frac{d}{dx} e^x = e^x, \quad \frac{d}{dx} e^{ax} = a e^{ax}
\]

\[
\frac{d}{dx} \ln x = \frac{1}{x} \quad (x > 0)
\]

\[
\frac{d}{dx} \ln f(x) = \frac{f'(x)}{f(x)} \quad \text{(logarithmic derivative)}
\]

The logarithmic derivative \( \frac{d \ln f}{dx} = \frac{f'}{f} \) gives the proportional rate of change of \( f \) — the foundation of elasticity analysis.

## 4.3 Higher-Order Derivatives

The second derivative is obtained by differentiating \( f'(x) \):

\[
f''(x) = \frac{d^2 f}{dx^2} = \frac{d}{dx} f'(x)
\]

Higher-order derivatives: \( f^{(n)}(x) = \frac{d^n f}{dx^n} \). The second derivative measures the rate of change of the slope — it captures curvature.

<div class="example">
<strong>Example:</strong> For \( f(x) = x^5 - 3x^3 + 2x \):

\[
f'(x) = 5x^4 - 9x^2 + 2
\]

\[
f''(x) = 20x^3 - 18x
\]

\[
f'''(x) = 60x^2 - 18
\]
</div>

---

# Chapter 5: Concavity, Convexity, and Shape Analysis

## 5.1 Definitions

<div class="definition">
<strong>Concavity and Convexity:</strong> A twice-differentiable function \( f \) is:
<ul>
<li><strong>Concave</strong> on an interval if \( f''(x) \leq 0 \) for all \( x \) in that interval. The graph bends downward; the chord between any two points lies <em>at or below</em> the graph.</li>
<li><strong>Convex</strong> on an interval if \( f''(x) \geq 0 \). The graph bends upward; the chord lies <em>at or above</em> the graph.</li>
<li><strong>Strictly concave/convex</strong> if the inequality is strict (\( < \) or \( > \)).</li>
</ul>
</div>

An equivalent characterization using the definition of concavity: \( f \) is concave if for all \( x_1, x_2 \) in the domain and all \( \lambda \in [0,1] \):

\[
f(\lambda x_1 + (1-\lambda) x_2) \geq \lambda f(x_1) + (1-\lambda) f(x_2)
\]

This is the **Jensen's inequality** for concave functions — the function value at a weighted average exceeds (or equals) the weighted average of function values.

## 5.2 Inflection Points

<div class="definition">
<strong>Inflection Point:</strong> A point \( x_0 \) where \( f \) changes concavity — from concave to convex or vice versa. A necessary condition is \( f''(x_0) = 0 \), but this is not sufficient (check that the sign of \( f'' \) actually changes).
</div>

<div class="example">
<strong>Example:</strong> For \( f(x) = x^3 \), \( f''(x) = 6x \). Then \( f''(0) = 0 \), and \( f'' < 0 \) for \( x < 0 \), \( f'' > 0 \) for \( x > 0 \). So \( x = 0 \) is an inflection point.
</div>

## 5.3 Elasticity

The **elasticity** of \( y = f(x) \) with respect to \( x \) is:

\[
\varepsilon = \frac{dy/y}{dx/x} = \frac{x}{y} \cdot \frac{dy}{dx} = \frac{d \ln y}{d \ln x}
\]

Elasticity measures the proportional responsiveness: a 1% change in \( x \) leads to an \( \varepsilon \)% change in \( y \). Price elasticity of demand \( \varepsilon_D = \frac{\partial Q}{\partial P} \cdot \frac{P}{Q} \) is typically negative; when \( |\varepsilon_D| > 1 \), demand is elastic; when \( |\varepsilon_D| < 1 \), inelastic.

---

# Chapter 6: Unconstrained Optimization

## 6.1 Critical Points

A point \( x^* \) is a **critical point** (or stationary point) of \( f \) if \( f'(x^*) = 0 \). Critical points are candidates for local maxima, local minima, or inflection points.

<div class="theorem">
<strong>First-Order Necessary Condition (FOC):</strong> If \( f \) is differentiable and \( x^* \) is a local extremum, then:

\[
f'(x^*) = 0
\]
</div>

The FOC is necessary but not sufficient. A critical point may be a maximum, minimum, or neither.

## 6.2 Second-Order Conditions

<div class="theorem">
<strong>Second-Order Sufficient Conditions (SOC):</strong> Let \( f''(x^*) \) exist and \( f'(x^*) = 0 \).
<ul>
<li>If \( f''(x^*) < 0 \), then \( x^* \) is a <strong>local maximum</strong>.</li>
<li>If \( f''(x^*) > 0 \), then \( x^* \) is a <strong>local minimum</strong>.</li>
<li>If \( f''(x^*) = 0 \), the test is <strong>inconclusive</strong>; higher-order derivatives or other methods are needed.</li>
</ul>
</div>

\[
\text{FOC: } f'(x^*) = 0
\]

\[
\text{SOC for max: } f''(x^*) < 0
\]

\[
\text{SOC for min: } f''(x^*) > 0
\]

For a **global maximum** on an open unbounded domain, it suffices to find a unique critical point and verify that \( f \) is globally concave (\( f'' < 0 \) everywhere).

<div class="example">
<strong>Worked example — profit maximization:</strong> A competitive firm has revenue \( R(q) = pq \) and cost \( C(q) = q^3/3 - 2q^2 + 5q + 10 \). Profit is:

\[
\pi(q) = pq - q^3/3 + 2q^2 - 5q - 10
\]
FOC: \( \pi'(q) = p - q^2 + 4q - 5 = 0 \). With \( p = 4 \):

\[
q^2 - 4q + 1 = 0 \implies q = 2 \pm \sqrt{3}
\]
SOC: \( \pi''(q) = -2q + 4 \). At \( q = 2 + \sqrt{3} \approx 3.73 \): \( \pi'' = -2(3.73)+4 = -3.46 < 0 \). Confirmed maximum. At \( q = 2 - \sqrt{3} \approx 0.27 \): \( \pi'' > 0 \), a minimum.
</div>

## 6.3 Global vs. Local Extrema

For a continuous function on a **closed bounded interval** \( [a,b] \), the global extrema are found by:
1. Evaluating \( f \) at all critical points in \( (a,b) \)
2. Evaluating \( f \) at the endpoints \( a \) and \( b \)
3. Comparing all values

On unbounded domains, check behavior as \( x \to \pm\infty \) to rule out the objective function being unbounded.

---

# Chapter 7: Optimization with Equality Constraints — The Lagrangian Method

## 7.1 Setup and Motivation

Many economic optimization problems involve constraints. The canonical form is:

\[
\max_{x, y} \; f(x, y) \quad \text{subject to} \quad g(x, y) = c
\]

Direct substitution (solving the constraint for one variable and substituting into the objective) works for simple cases but becomes algebraically intractable for more complex problems. The **Lagrangian method** provides a systematic approach.

## 7.2 The Lagrangian Function

<div class="definition">
<strong>Lagrangian:</strong> Form the Lagrangian function:

\[
\mathcal{L}(x, y, \lambda) = f(x, y) - \lambda \left[ g(x, y) - c \right]
\]
where \( \lambda \) is the <strong>Lagrange multiplier</strong>, an additional variable introduced for each constraint.
</div>

The first-order conditions for an interior optimum are:

\[
\frac{\partial \mathcal{L}}{\partial x} = \frac{\partial f}{\partial x} - \lambda \frac{\partial g}{\partial x} = 0
\]

\[
\frac{\partial \mathcal{L}}{\partial y} = \frac{\partial f}{\partial y} - \lambda \frac{\partial g}{\partial y} = 0
\]

\[
\frac{\partial \mathcal{L}}{\partial \lambda} = -(g(x, y) - c) = 0
\]

The third condition simply restates the constraint. From the first two:

\[
\frac{\partial f / \partial x}{\partial f / \partial y} = \frac{\partial g / \partial x}{\partial g / \partial y}
\]

This says that at the optimum, the ratio of marginal contributions to the objective (the **marginal rate of substitution** in consumer theory) equals the ratio of marginal contributions to the constraint (the **marginal rate of transformation** for a production frontier).

## 7.3 Economic Interpretation of the Lagrange Multiplier

The multiplier \( \lambda^* \) at the optimum has a precise economic meaning:

\[
\lambda^* = \frac{df^*}{dc}
\]

where \( f^* \) is the optimized value of the objective. Thus \( \lambda^* \) measures the marginal value of relaxing the constraint by one unit — the **shadow price** of the constraint.

<div class="remark">
<strong>Consumer theory example:</strong> Maximize utility \( U(x_1, x_2) \) subject to the budget constraint \( p_1 x_1 + p_2 x_2 = m \). The Lagrangian is:

\[
\mathcal{L} = U(x_1, x_2) - \lambda(p_1 x_1 + p_2 x_2 - m)
\]
FOC: \( U_1 = \lambda p_1 \) and \( U_2 = \lambda p_2 \), giving the tangency condition \( MRS = U_1/U_2 = p_1/p_2 \). The multiplier \( \lambda^* \) is the marginal utility of income.
</div>

## 7.4 Second-Order Conditions for Constrained Optimization

For a constrained problem, the SOC involves the **bordered Hessian**. For the two-variable case with one constraint:

\[
\bar{H} = \begin{vmatrix} 0 & g_x & g_y \\ g_x & \mathcal{L}_{xx} & \mathcal{L}_{xy} \\ g_y & \mathcal{L}_{yx} & \mathcal{L}_{yy} \end{vmatrix}
\]

where subscripts denote partial derivatives. If \( |\bar{H}| > 0 \) at the critical point, we have a local maximum (for a maximization problem); if \( |\bar{H}| < 0 \), a local minimum.

---

# Chapter 8: Matrices and Determinants

## 8.1 Matrix Operations

<div class="definition">
<strong>Matrix:</strong> An \( m \times n \) matrix \( A \) is a rectangular array of real numbers with \( m \) rows and \( n \) columns. The entry in row \( i \) and column \( j \) is denoted \( a_{ij} \).
</div>

**Matrix addition:** \( A + B \) is defined when \( A \) and \( B \) have the same dimensions; add corresponding entries: \( (A+B)_{ij} = a_{ij} + b_{ij} \).

**Scalar multiplication:** \( (cA)_{ij} = c \cdot a_{ij} \).

**Matrix multiplication:** \( C = AB \) where \( A \) is \( m \times n \) and \( B \) is \( n \times p \); the result is \( m \times p \). The \( (i,j) \) entry of \( C \) is:

\[
c_{ij} = \sum_{k=1}^{n} a_{ik} b_{kj}
\]

Matrix multiplication is generally **not commutative**: \( AB \neq BA \) in general.

**Transpose:** The transpose \( A^T \) is the matrix with rows and columns swapped: \( (A^T)_{ij} = a_{ji} \). A **symmetric** matrix satisfies \( A = A^T \).

**Identity matrix:** The \( n \times n \) identity \( I_n \) has 1s on the diagonal and 0s elsewhere; \( AI = IA = A \) for any compatible \( A \).

## 8.2 Determinants

<div class="definition">
<strong>Determinant:</strong> The determinant of a square matrix \( A \), written \( \det(A) \) or \( |A| \), is a scalar that encodes important structural information. For a \( 2 \times 2 \) matrix:

\[
\det \begin{pmatrix} a & b \\ c & d \end{pmatrix} = ad - bc
\]
</div>

For a \( 3 \times 3 \) matrix, expand along the first row using **cofactor expansion**:

\[
\det(A) = a_{11} C_{11} + a_{12} C_{12} + a_{13} C_{13}
\]

where the **cofactor** \( C_{ij} = (-1)^{i+j} M_{ij} \) and \( M_{ij} \) is the \( (n-1) \times (n-1) \) minor obtained by deleting row \( i \) and column \( j \).

Key properties: \( \det(AB) = \det(A)\det(B) \); \( \det(A^T) = \det(A) \); swapping two rows multiplies the determinant by \( -1 \); if two rows are identical, \( \det(A) = 0 \).

A square matrix \( A \) is **invertible** (non-singular) if and only if \( \det(A) \neq 0 \).

## 8.3 The Inverse of a Matrix

If \( \det(A) \neq 0 \), the inverse \( A^{-1} \) satisfies \( A A^{-1} = A^{-1} A = I \). For a \( 2 \times 2 \) matrix:

\[
\begin{pmatrix} a & b \\ c & d \end{pmatrix}^{-1} = \frac{1}{ad - bc} \begin{pmatrix} d & -b \\ -c & a \end{pmatrix}
\]

For larger matrices, the inverse is computed via the adjugate (matrix of cofactors, transposed) divided by the determinant, or by Gaussian elimination.

---

# Chapter 9: Linear Systems and Cramer's Rule

## 9.1 Systems of Linear Equations

A system of \( n \) linear equations in \( n \) unknowns can be written in matrix form as:

\[
A \mathbf{x} = \mathbf{b}
\]

where \( A \) is an \( n \times n \) matrix of coefficients, \( \mathbf{x} \) is the vector of unknowns, and \( \mathbf{b} \) is the vector of constants. If \( \det(A) \neq 0 \), the system has a **unique solution**: \( \mathbf{x} = A^{-1} \mathbf{b} \).

## 9.2 Cramer's Rule

<div class="theorem">
<strong>Cramer's Rule:</strong> If \( \det(A) \neq 0 \), the unique solution to \( A\mathbf{x} = \mathbf{b} \) is given by:

\[
x_i = \frac{\det(A_i)}{\det(A)}
\]
where \( A_i \) is the matrix \( A \) with the \( i \)-th column replaced by the vector \( \mathbf{b} \).
</div>

<div class="example">
<strong>Worked example:</strong> Solve the system:

\[
2x + y = 5, \quad x - 3y = -4
\]
In matrix form: \( A = \begin{pmatrix} 2 & 1 \\ 1 & -3 \end{pmatrix} \), \( \mathbf{b} = \begin{pmatrix} 5 \\ -4 \end{pmatrix} \).
\( \det(A) = 2(-3) - 1(1) = -7 \).

\[
x = \frac{\det\begin{pmatrix} 5 & 1 \\ -4 & -3 \end{pmatrix}}{-7} = \frac{(5)(-3)-(1)(-4)}{-7} = \frac{-11}{-7} = \frac{11}{7}
\]

\[
y = \frac{\det\begin{pmatrix} 2 & 5 \\ 1 & -4 \end{pmatrix}}{-7} = \frac{(2)(-4)-(5)(1)}{-7} = \frac{-13}{-7} = \frac{13}{7}
\]
</div>

Cramer's Rule is theoretically elegant but computationally expensive for large systems. In economics, it is most useful for deriving **comparative statics** analytically in small models.

---

# Chapter 10: The Implicit Function Theorem

## 10.1 Statement

Many economic relationships are implicitly defined. A supply curve, for instance, may arise from a profit-maximization condition that defines quantity as an implicit function of price. The Implicit Function Theorem (IFT) tells us when an implicit relationship \( F(x, y) = 0 \) defines \( y \) as a differentiable function of \( x \) in a neighborhood of a given point.

<div class="theorem">
<strong>Implicit Function Theorem (single equation):</strong> Let \( F(x, y) \) be a continuously differentiable function in a neighborhood of \( (x_0, y_0) \) with \( F(x_0, y_0) = 0 \). If \( \frac{\partial F}{\partial y}(x_0, y_0) \neq 0 \), then there exists a differentiable function \( y = \phi(x) \) defined in a neighborhood of \( x_0 \) such that \( \phi(x_0) = y_0 \) and \( F(x, \phi(x)) = 0 \). Moreover:

\[
\frac{dy}{dx} = -\frac{\partial F / \partial x}{\partial F / \partial y}
\]
</div>

## 10.2 Application to Comparative Statics

The IFT is the theoretical foundation of **comparative statics analysis** — examining how the equilibrium of a model changes when an exogenous parameter shifts.

<div class="example">
<strong>Market equilibrium comparative statics:</strong> Supply and demand equilibrium satisfies \( F(P, t) = Q^D(P) - Q^S(P, t) = 0 \), where \( t \) is a tax on suppliers. By the IFT:

\[
\frac{dP^*}{dt} = -\frac{\partial F / \partial t}{\partial F / \partial P} = -\frac{-\partial Q^S / \partial t}{Q^{D'} - Q^{S'}_P} = \frac{\partial Q^S / \partial t}{Q^{D'} - Q^{S'}_P}
\]
Since \( Q^{D'} < 0 \), \( Q^{S'}_P > 0 \), and \( \partial Q^S/\partial t < 0 \) (a tax shifts supply left), we get \( dP^*/dt > 0 \): a tax raises the equilibrium price.
</div>

## 10.3 IFT in Two Variables

For a system of two equations \( F(x_1, x_2, \alpha) = 0 \) and \( G(x_1, x_2, \alpha) = 0 \) where \( \alpha \) is a parameter, the comparative statics are:

\[
\begin{pmatrix} F_{x_1} & F_{x_2} \\ G_{x_1} & G_{x_2} \end{pmatrix} \begin{pmatrix} dx_1/d\alpha \\ dx_2/d\alpha \end{pmatrix} = - \begin{pmatrix} F_\alpha \\ G_\alpha \end{pmatrix}
\]

Applying Cramer's Rule to this system yields the comparative static derivatives \( dx_1/d\alpha \) and \( dx_2/d\alpha \) in terms of the partial derivatives of \( F \) and \( G \). The system is solvable when the Jacobian determinant \( |J| = F_{x_1} G_{x_2} - F_{x_2} G_{x_1} \neq 0 \).

---

# Chapter 11: Homogeneous Functions and Euler's Theorem

## 11.1 Homogeneous Functions

<div class="definition">
<strong>Homogeneous Function of Degree \( k \):</strong> A function \( f(x_1, x_2, \ldots, x_n) \) is homogeneous of degree \( k \) if for all \( t > 0 \):

\[
f(tx_1, tx_2, \ldots, tx_n) = t^k f(x_1, x_2, \ldots, x_n)
\]
</div>

**Economic examples:**

- **Constant returns to scale (CRS):** A production function \( F(K, L) \) is CRS if it is homogeneous of degree 1: doubling both capital and labor doubles output. Example: \( F(K,L) = K^\alpha L^{1-\alpha} \) (Cobb-Douglas with \( \alpha + (1-\alpha) = 1 \)).
- **Increasing returns to scale (IRS):** Homogeneous of degree \( > 1 \): doubling inputs more than doubles output.
- **Decreasing returns to scale (DRS):** Homogeneous of degree \( < 1 \).

## 11.2 Euler's Theorem

<div class="theorem">
<strong>Euler's Theorem:</strong> If \( f \) is homogeneous of degree \( k \) and differentiable, then:

\[
x_1 \frac{\partial f}{\partial x_1} + x_2 \frac{\partial f}{\partial x_2} + \cdots + x_n \frac{\partial f}{\partial x_n} = k \cdot f(x_1, x_2, \ldots, x_n)
\]
</div>

In a two-input production context with \( k = 1 \) (CRS):

\[
K \frac{\partial F}{\partial K} + L \frac{\partial F}{\partial L} = F(K, L)
\]

Since \( \partial F/\partial K = MP_K \) and \( \partial F/\partial L = MP_L \), this says:

\[
K \cdot MP_K + L \cdot MP_L = Q
\]

**Economic interpretation:** Under perfect competition, factors are paid their marginal products. With CRS, Euler's theorem guarantees that paying each factor its marginal product exactly exhausts the total output — there is no surplus or deficit. This is the **adding-up theorem** (or product exhaustion theorem) in distribution theory.

<div class="proof">
<strong>Proof of Euler's Theorem.</strong> Differentiate both sides of \( f(tx_1, \ldots, tx_n) = t^k f(x_1, \ldots, x_n) \) with respect to \( t \):

\[
\sum_{i=1}^{n} x_i \frac{\partial f}{\partial (tx_i)} = k t^{k-1} f(x_1, \ldots, x_n)
\]
Setting \( t = 1 \): \( \sum_{i=1}^{n} x_i \frac{\partial f}{\partial x_i} = k f(x_1, \ldots, x_n) \). \( \square \)
</div>

## 11.3 Properties of Partial Derivatives of Homogeneous Functions

If \( f \) is homogeneous of degree \( k \), then each partial derivative \( \partial f / \partial x_i \) is homogeneous of degree \( k - 1 \). This follows immediately by differentiating the homogeneity condition with respect to \( x_i \). Applied to production theory: if \( F(K,L) \) is CRS (degree 1), then \( MP_K = \partial F/\partial K \) and \( MP_L = \partial F/\partial L \) are homogeneous of degree 0 — they depend only on the capital-to-labor ratio \( k = K/L \), not on the scale of production. This is the foundation of the per-worker production function \( f(k) = F(k, 1) \) used in the Solow growth model.

---

# Chapter 12: Comparative Statics and Economic Applications

## 12.1 The General Framework

Comparative statics asks: when an exogenous parameter \( \alpha \) changes, how does the equilibrium endogenous variable \( x^*(\alpha) \) respond? The equilibrium condition is \( F(x^*, \alpha) = 0 \) (which could be an FOC from an optimization problem). By the IFT:

\[
\frac{dx^*}{d\alpha} = -\frac{\partial F / \partial \alpha}{\partial F / \partial x}
\]

The sign of this expression gives the **qualitative** prediction; the magnitude gives the **quantitative** prediction.

## 12.2 The Envelope Theorem

The **Envelope Theorem** describes how the optimized value of an objective function changes with a parameter, without re-solving the optimization problem.

<div class="theorem">
<strong>Envelope Theorem (unconstrained):</strong> Let \( V(\alpha) = \max_x f(x, \alpha) \) be the value function, where \( x^*(\alpha) \) is the optimal choice. Then:

\[
\frac{dV}{d\alpha} = \frac{\partial f}{\partial \alpha} \bigg|_{x = x^*(\alpha)}
\]
The total derivative of the value function with respect to \( \alpha \) equals the partial derivative of the objective with respect to \( \alpha \), evaluated at the optimum.
</div>

For constrained optimization with Lagrangian \( \mathcal{L} = f(x,y,\alpha) - \lambda g(x,y,\alpha) \):

\[
\frac{dV}{d\alpha} = \frac{\partial \mathcal{L}}{\partial \alpha} \bigg|_{\text{optimum}}
\]

**Application — Hotelling's Lemma:** For a profit-maximizing firm with profit function \( \pi^*(p, w) \), the output supply and input demand functions are obtained by differentiating with respect to output price and input prices respectively.

## 12.3 Worked Example: Labor Supply

A worker chooses leisure \( \ell \) and consumption \( c \) to maximize utility \( U(\ell, c) = \ln \ell + \ln c \) subject to the time constraint \( \ell + h = T \) (where \( h \) is hours worked) and the budget constraint \( c = wh \) (where \( w \) is the wage). Substituting: maximize \( \ln(T - h) + \ln(wh) \) with respect to \( h \).

FOC: \( \frac{-1}{T-h} + \frac{1}{h} = 0 \implies h^* = T/2 \).

The optimal hours worked is \( T/2 \), independent of the wage. The income and substitution effects exactly cancel with log utility — the **uncompensated labor supply curve is perfectly inelastic** in this model. Comparative static: \( \frac{dh^*}{dw} = 0 \).

---

# Chapter 13: Partial Differentiation and Multivariable Optimization

## 13.1 Partial Derivatives

For \( f(x_1, x_2) \), the partial derivative with respect to \( x_1 \) is:

\[
\frac{\partial f}{\partial x_1} = \lim_{h \to 0} \frac{f(x_1 + h, x_2) - f(x_1, x_2)}{h}
\]

holding \( x_2 \) fixed. All rules of single-variable differentiation apply when the other variables are treated as constants.

**Second-order partial derivatives:**

\[
\frac{\partial^2 f}{\partial x_1^2} = f_{11}, \quad \frac{\partial^2 f}{\partial x_2^2} = f_{22}, \quad \frac{\partial^2 f}{\partial x_1 \partial x_2} = f_{12}, \quad \frac{\partial^2 f}{\partial x_2 \partial x_1} = f_{21}
\]

**Young's Theorem:** If \( f \) is twice continuously differentiable, then mixed partials are equal: \( f_{12} = f_{21} \).

## 13.2 The Hessian Matrix

<div class="definition">
<strong>Hessian Matrix:</strong> The Hessian of \( f(x_1, x_2) \) is:

\[
H = \begin{pmatrix} f_{11} & f_{12} \\ f_{21} & f_{22} \end{pmatrix}
\]
</div>

The Hessian generalizes the second derivative to multiple dimensions. The sign of the Hessian (via its eigenvalues or leading principal minors) determines concavity/convexity:

- **Negative definite** (\( f_{11} < 0 \) and \( \det(H) > 0 \)): \( f \) is strictly concave.
- **Positive definite** (\( f_{11} > 0 \) and \( \det(H) > 0 \)): \( f \) is strictly convex.
- **Indefinite** (\( \det(H) < 0 \)): \( f \) is neither concave nor convex.

## 13.3 Unconstrained Optimization in Multiple Variables

FOC for an interior critical point: all partial derivatives equal zero:

\[
\frac{\partial f}{\partial x_1} = 0, \quad \frac{\partial f}{\partial x_2} = 0
\]

SOC: If the Hessian evaluated at the critical point is negative definite, the point is a local maximum; if positive definite, a local minimum.

<div class="example">
<strong>Example:</strong> Minimize \( f(x,y) = x^2 + y^2 - xy - 3x \).
FOC: \( f_x = 2x - y - 3 = 0 \) and \( f_y = 2y - x = 0 \). From the second equation: \( x = 2y \). Substituting: \( 4y - y - 3 = 0 \), so \( y = 1 \), \( x = 2 \). Hessian: \( H = \begin{pmatrix} 2 & -1 \\ -1 & 2 \end{pmatrix} \). \( f_{11} = 2 > 0 \), \( \det(H) = 4 - 1 = 3 > 0 \). Positive definite — confirmed minimum.
</div>
