---
title: "AMATH 350: Differential Equations for Business and Economics"
subjects: "AMATH"
prof: "Shahla Aliakbari"
---

## Sources and References

**Primary sources** — Lecture notes, AMATH 350, University of Waterloo (Fall 2025)

**Supplementary texts** — W.E. Boyce & R.C. DiPrima, *Elementary Differential Equations and Boundary Value Problems* (11th ed., Wiley, 2017); M. Tenenbaum & H. Pollard, *Ordinary Differential Equations* (Dover, 1985); P. Wilmott, S. Howison & J. Dewynne, *The Mathematics of Financial Derivatives* (Cambridge, 1995); S.E. Shreve, *Stochastic Calculus for Finance II: Continuous-Time Models* (Springer, 2004)

**Online resources** — MIT OCW 18.03 Differential Equations; Paul's Online Math Notes (tutorial.math.lamar.edu); Khan Academy Finance series

---

# Chapter 1: First-Order Ordinary Differential Equations

The central object of this course is the **differential equation** — an equation that relates an unknown function to its own rates of change. Rather than asking "what is the value of some quantity?", a differential equation asks "how does that quantity evolve?" This shift in perspective is enormously powerful: most natural and economic phenomena are described far more easily in terms of rates than in terms of static values. A bank account earns interest proportional to its balance. A market price moves toward equilibrium in response to excess demand. A population grows at a rate depending on how large it already is. In each case, the governing law is a differential equation, and the solution is the quantity itself as a function of time.

<div class="definition">
<strong>Definition (Differential Equation)</strong>: A <em>differential equation</em> is an equation involving an unknown function and one or more of its derivatives. The <em>order</em> of a differential equation is the order of the highest derivative that appears. A differential equation is <em>ordinary</em> (ODE) if the unknown function depends on a single independent variable, and <em>partial</em> (PDE) if it depends on two or more.
</div>

The simplest differential equations can be solved by direct integration. If \(\frac{dy}{dx} = f(x)\), then \(y = \int f(x)\,dx + C\). The constant \(C\) represents the freedom we have in specifying where the solution starts — it is pinned down only when we impose an **initial condition** \(y(x_0) = y_0\). The combination of a differential equation plus an initial condition is called an **initial-value problem (IVP)**.

Before computing solutions, we should ask whether a solution even exists, and whether it is unique. The following foundational theorem answers both questions for first-order equations.

<div class="theorem">
<strong>Theorem (Picard–Lindelöf Existence and Uniqueness)</strong>: Suppose \(f(x,y)\) and \(\frac{\partial f}{\partial y}\) are continuous on an open rectangle containing \((x_0, y_0)\). Then the IVP
\[ y' = f(x,y), \quad y(x_0) = y_0 \]
has a unique solution on some interval containing \(x_0\).
<br><em>Proof sketch.</em> Rewrite the IVP as the integral equation \(y(x) = y_0 + \int_{x_0}^x f(t,y(t))\,dt\). Define a sequence of approximations \(y_0(x) = y_0\), \(y_{n+1}(x) = y_0 + \int_{x_0}^x f(t,y_n(t))\,dt\). The Lipschitz condition on \(f\) (guaranteed by continuity of \(\partial f/\partial y\)) ensures this sequence converges uniformly to a unique fixed point.
</div>

The theorem tells us that pathological behaviour — solutions that blow up, split, or fail to exist — can only arise when the hypotheses fail, for instance when \(f\) is discontinuous or \(\partial f / \partial y\) is unbounded. In practice, the theorem covers nearly every equation we encounter in business and economics applications, and we can proceed to find solutions with confidence.

## 1.1 Separable Equations

Many important first-order ODEs have the form \(y' = f(x)\,g(y)\), where the right-hand side factors into a function of \(x\) alone times a function of \(y\) alone. Such equations are called **separable** because we can separate the variables onto opposite sides of the equation.

<div class="definition">
<strong>Definition (Separable ODE)</strong>: A first-order ODE is <em>separable</em> if it can be written as
\[ \frac{dy}{dx} = f(x)\,g(y). \]
The general solution is obtained by separating variables and integrating both sides:
\[ \int \frac{dy}{g(y)} = \int f(x)\,dx + C. \]
</div>

The separation step is formally justified by writing \(dy = g(y)\,f(x)\,dx\) and dividing through by \(g(y)\) (wherever \(g(y) \neq 0\)). Note that any value \(y = y^*\) with \(g(y^*) = 0\) is a constant (equilibrium) solution, and it should be checked separately.

<div class="example">
<strong>Example (Continuous Compounding)</strong>: Let \(A(t)\) be the value of a bank account at time \(t\) (in years), earning interest at a continuously compounded annual rate \(r\). The rate of growth of the account is proportional to its current value:
\[ \frac{dA}{dt} = rA, \quad A(0) = A_0. \]
Separating variables: \(\frac{dA}{A} = r\,dt\). Integrating both sides: \(\ln|A| = rt + C_1\), so \(A(t) = A_0 e^{rt}\). This is the fundamental law of continuous compounding. For a present value calculation: if we want a future value \(FV\) at time \(T\), its present value is \(PV = FV \cdot e^{-rT}\). The factor \(e^{-rT}\) is the <em>discount factor</em> — it reflects that a dollar today is worth more than a dollar tomorrow.
</div>

## 1.2 First-Order Linear ODEs

Not all first-order equations are separable. The next most tractable class is **first-order linear** equations, which arise naturally in finance whenever the rate of change of a quantity depends linearly on both the quantity itself and an external forcing term.

<div class="definition">
<strong>Definition (First-Order Linear ODE)</strong>: An ODE of the form
\[ \frac{dy}{dx} + P(x)\,y = Q(x) \]
is called a <em>first-order linear ODE</em>. When \(Q(x) = 0\) it is <em>homogeneous</em>; otherwise <em>inhomogeneous</em> (or nonhomogeneous).
</div>

The key technique for solving first-order linear ODEs is the **integrating factor**. The idea is to multiply both sides by a cleverly chosen function \(\mu(x)\) so that the left-hand side becomes a perfect derivative.

<div class="theorem">
<strong>Theorem (Integrating Factor Method)</strong>: For the first-order linear ODE \(y' + P(x)y = Q(x)\), let
\[ \mu(x) = e^{\int P(x)\,dx}. \]
Multiplying both sides by \(\mu(x)\) yields \(\frac{d}{dx}[\mu(x)y] = \mu(x)Q(x)\). Integrating:
\[ y = \frac{1}{\mu(x)}\left[\int \mu(x)Q(x)\,dx + C\right]. \]
<br><em>Proof sketch.</em> Note that \(\mu'(x) = P(x)\mu(x)\). Then \(\frac{d}{dx}[\mu y] = \mu y' + \mu' y = \mu(y' + Py) = \mu Q\). The result follows by integration.
</div>

<div class="example">
<strong>Example (Debt Dynamics)</strong>: Let \(D(t)\) denote government debt at time \(t\), \(r\) the interest rate, and \(T(t)\) the rate of tax revenue. Then
\[ \frac{dD}{dt} = rD - T(t). \]
This is a first-order linear ODE with \(P(t) = -r\) and \(Q(t) = -T(t)\). The integrating factor is \(\mu(t) = e^{-rt}\). Multiplying through: \(\frac{d}{dt}[e^{-rt}D] = -e^{-rt}T(t)\). Integrating: \(D(t) = e^{rt}D(0) - e^{rt}\int_0^t e^{-rs}T(s)\,ds\). The first term is the compounded initial debt; the second term represents the accumulated present value of tax revenues. Sustainable debt requires the second term to eventually dominate the first.
</div>

## 1.3 Substitution Methods

Some equations are neither separable nor linear in their original form, but a change of variables transforms them into one of these tractable classes.

A **Bernoulli equation** has the form \(y' + P(x)y = Q(x)y^n\) for some \(n \neq 0, 1\). The substitution \(v = y^{1-n}\) linearises it: differentiating, \(v' = (1-n)y^{-n}y'\), and substituting into the Bernoulli equation yields a linear ODE for \(v\).

A **homogeneous equation** (in the sense of this substitution method) has the form \(y' = f(y/x)\). The substitution \(v = y/x\), so \(y = vx\) and \(y' = v + xv'\), converts this to a separable equation in \(v\) and \(x\):
\[ v + xv' = f(v) \implies \int \frac{dv}{f(v) - v} = \int \frac{dx}{x}. \]

**Dimensional homogeneity** is a useful modelling principle: every term in a physical or economic equation must have the same units. This constrains the form of equations and provides a check on algebra. For example, in an equation relating dollars, time, and rates, each additive term must have units of dollars (or dollars per unit time, consistently). Violations of dimensional homogeneity indicate errors in model formulation.

---

# Chapter 2: Applications to Finance and Economics

The differential equations developed in Chapter 1 are not merely mathematical abstractions — they are the natural language for modelling how economic quantities evolve over time. This chapter develops several core applications, building intuition for how the choice of equation structure encodes economic assumptions.

## 2.1 Supply-Demand Dynamics

In introductory economics, supply and demand determine a static equilibrium price. But in reality, prices adjust over time in response to excess demand. A simple dynamic model captures this:

<div class="definition">
<strong>Definition (Price Adjustment Dynamics)</strong>: Let \(P(t)\) be the market price at time \(t\), \(D(P)\) the demand function, and \(S(P)\) the supply function. The <em>price adjustment equation</em> is
\[ \frac{dP}{dt} = \alpha\left[D(P) - S(P)\right], \quad \alpha > 0. \]
The parameter \(\alpha\) is the speed of adjustment. Equilibrium occurs at \(P^*\) where \(D(P^*) = S(P^*)\).
</div>

To analyse stability, linearise near \(P^*\). Let \(p = P - P^*\) be the deviation. Then to first order:
\[ \frac{dp}{dt} \approx \alpha\left[D'(P^*) - S'(P^*)\right]p. \]
In a normal market, demand slopes downward (\(D' < 0\)) and supply slopes upward (\(S' > 0\)), so \(D'(P^*) - S'(P^*) < 0\). Setting \(\beta = -\alpha[D'(P^*) - S'(P^*)] > 0\), the linearised equation is \(dp/dt = -\beta p\), with solution \(p(t) = p(0)e^{-\beta t} \to 0\). The equilibrium is **stable**: prices converge exponentially to \(P^*\).

<div class="example">
<strong>Example (Linear Supply and Demand)</strong>: Suppose \(D(P) = a - bP\) and \(S(P) = c + dP\) with \(a, b, c, d > 0\). The equilibrium price is \(P^* = (a-c)/(b+d)\). The price adjustment ODE is
\[ \frac{dP}{dt} = \alpha\left[(a - bP) - (c + dP)\right] = \alpha(a - c) - \alpha(b+d)P. \]
This is a first-order linear ODE. Setting \(\beta = \alpha(b+d)\) and \(\gamma = \alpha(a-c)\):
\[ \frac{dP}{dt} + \beta P = \gamma. \]
The integrating factor is \(e^{\beta t}\). The solution is \(P(t) = P^* + (P_0 - P^*) e^{-\beta t}\), confirming exponential convergence.
</div>

## 2.2 The Solow Growth Model

One of the most influential models in macroeconomics is the Solow growth model, which describes how capital accumulates in an economy over time.

Let \(k = K/L\) be capital per worker, \(f(k)\) be output per worker (a concave production function such as \(f(k) = k^\alpha\)), \(s\) the savings rate, \(n\) the population growth rate, and \(\delta\) the depreciation rate. Capital per worker evolves according to:
\[ \frac{dk}{dt} = sf(k) - (n + \delta)k. \]

The steady state \(k^*\) satisfies \(sf(k^*) = (n+\delta)k^*\) — investment exactly offsets the dilution of capital from population growth and depreciation. Linearising near \(k^*\) shows the steady state is stable when \(sf'(k^*) < n + \delta\), which is guaranteed by the concavity of \(f\). This ODE is a Bernoulli equation when \(f(k) = k^\alpha\), and can be solved explicitly by the substitution \(v = k^{1-\alpha}\).

---

# Chapter 3: Higher-Order Linear ODEs

First-order equations describe systems with a single degree of freedom — one piece of initial data. Many physical and economic systems have richer dynamics: oscillations, resonance, and complex transients that require higher-order equations to capture.

<div class="definition">
<strong>Definition (n-th Order Linear ODE)</strong>: An ODE of the form
\[ a_n(x)y^{(n)} + a_{n-1}(x)y^{(n-1)} + \cdots + a_1(x)y' + a_0(x)y = g(x) \]
is called an <em>n-th order linear ODE</em>. It is <em>homogeneous</em> when \(g(x) = 0\) and <em>inhomogeneous</em> when \(g(x) \neq 0\).
</div>

A central result is that the solution set of the homogeneous equation forms a **vector space** of dimension \(n\): there exist \(n\) linearly independent solutions \(y_1, \ldots, y_n\), and every solution is a linear combination \(y = c_1 y_1 + \cdots + c_n y_n\). The **general solution** of the inhomogeneous equation is then \(y = y_h + y_p\), where \(y_h\) is the general homogeneous solution and \(y_p\) is any particular solution.

## 3.1 The Wronskian

The question of whether \(n\) solutions are linearly independent is answered by the Wronskian determinant.

<div class="definition">
<strong>Definition (Wronskian)</strong>: For \(n\) functions \(y_1, \ldots, y_n\), the <em>Wronskian</em> is
\[ W(y_1,\ldots,y_n)(x) = \det \begin{pmatrix} y_1 & y_2 & \cdots & y_n \\ y_1' & y_2' & \cdots & y_n' \\ \vdots & & & \vdots \\ y_1^{(n-1)} & y_2^{(n-1)} & \cdots & y_n^{(n-1)} \end{pmatrix}. \]
If \(y_1, \ldots, y_n\) are solutions of a linear ODE with continuous coefficients, they are linearly independent if and only if \(W(x_0) \neq 0\) for some (equivalently, every) \(x_0\) in the interval.
</div>

## 3.2 Constant-Coefficient Homogeneous Equations

When the coefficients \(a_i\) are constants, we can solve the homogeneous equation completely by substituting the trial solution \(y = e^{rx}\).

<div class="theorem">
<strong>Theorem (Characteristic Equation)</strong>: For the constant-coefficient homogeneous ODE
\[ a_n y^{(n)} + \cdots + a_1 y' + a_0 y = 0, \]
substituting \(y = e^{rx}\) gives the <em>characteristic (auxiliary) equation</em>
\[ a_n r^n + a_{n-1} r^{n-1} + \cdots + a_1 r + a_0 = 0. \]
The structure of the general solution depends on the roots:
<ul>
  <li><em>Distinct real roots</em> \(r_1, \ldots, r_n\): general solution \(y = c_1 e^{r_1 x} + \cdots + c_n e^{r_n x}\).</li>
  <li><em>Repeated root</em> \(r\) of multiplicity \(k\): contributes \((c_1 + c_2 x + \cdots + c_k x^{k-1})e^{rx}\).</li>
  <li><em>Complex conjugate pair</em> \(\alpha \pm \beta i\): contributes \(e^{\alpha x}(A\cos\beta x + B\sin\beta x)\).</li>
</ul>
</div>

<div class="example">
<strong>Example (Second-Order Constant Coefficient)</strong>: Solve \(y'' - 5y' + 6y = 0\). The characteristic equation is \(r^2 - 5r + 6 = (r-2)(r-3) = 0\), giving roots \(r_1 = 2\), \(r_2 = 3\). The general solution is \(y = c_1 e^{2x} + c_2 e^{3x}\). Now solve \(y'' + 4y = 0\). The characteristic equation \(r^2 + 4 = 0\) gives \(r = \pm 2i\), so \(\alpha = 0\), \(\beta = 2\). The general solution is \(y = A\cos 2x + B\sin 2x\), representing undamped oscillation.
</div>

## 3.3 Method of Undetermined Coefficients

When the inhomogeneous term \(g(x)\) is a polynomial, exponential, or sinusoidal function (or a product of these), we can find a particular solution by guessing its form and determining the coefficients.

The guessing rules are:
- If \(g(x) = P_m(x)e^{ax}\) (polynomial of degree \(m\) times exponential), guess \(y_p = x^s Q_m(x) e^{ax}\) where \(s\) is the multiplicity of \(a\) as a root of the characteristic equation (0 if not a root).
- If \(g(x) = e^{ax}(P_m(x)\cos bx + R_k(x)\sin bx)\), guess \(y_p = x^s e^{ax}(Q_n(x)\cos bx + S_n(x)\sin bx)\) where \(n = \max(m,k)\) and \(s\) is the multiplicity of \(a+bi\) as a characteristic root.

The factor of \(x^s\) corrects for resonance — when the driving frequency matches a natural frequency of the homogeneous equation.

## 3.4 Variation of Parameters

The method of undetermined coefficients works only for special forms of \(g(x)\). A more general technique, **variation of parameters**, works whenever the homogeneous solutions are known and \(g(x)\) is continuous.

<div class="theorem">
<strong>Theorem (Variation of Parameters)</strong>: Given the second-order ODE \(y'' + p(x)y' + q(x)y = g(x)\), with homogeneous solutions \(y_1, y_2\) (Wronskian \(W \neq 0\)), a particular solution is
\[ y_p = -y_1(x)\int \frac{y_2(x)g(x)}{W(x)}\,dx + y_2(x)\int \frac{y_1(x)g(x)}{W(x)}\,dx. \]
<br><em>Proof sketch.</em> Assume \(y_p = u_1(x)y_1 + u_2(x)y_2\). Impose the constraint \(u_1' y_1 + u_2' y_2 = 0\) (to simplify \(y_p''\)). Substituting into the ODE yields \(u_1' y_1' + u_2' y_2' = g\). Solving this \(2\times 2\) system by Cramer's rule gives \(u_1' = -y_2 g/W\) and \(u_2' = y_1 g/W\). Integrating gives \(y_p\).
</div>

## 3.5 Reduction of Order

If one solution \(y_1\) of a homogeneous second-order ODE is known, a second linearly independent solution can always be found. The substitution \(y = y_1(x) v(x)\) reduces the ODE to a first-order equation for \(v'\). Setting \(w = v'\), we obtain a first-order linear ODE for \(w\), which can be solved by the integrating factor method. The second solution is \(y_2 = y_1 \int v'(x)\,dx\).

---

# Chapter 4: Systems of Linear ODEs

Many economic models involve not one but several interacting quantities — prices in multiple markets, stocks of multiple goods, or components of a macroeconomic model — that evolve simultaneously. The natural framework is a **system of first-order linear ODEs**.

<div class="definition">
<strong>Definition (Linear System)</strong>: A <em>first-order linear system</em> has the form
\[ \mathbf{X}' = A(t)\mathbf{X} + \mathbf{F}(t), \]
where \(\mathbf{X}(t) \in \mathbb{R}^n\) is the unknown vector, \(A(t)\) is an \(n \times n\) matrix of coefficients, and \(\mathbf{F}(t)\) is a forcing vector. When \(\mathbf{F} = \mathbf{0}\) the system is <em>homogeneous</em>.
</div>

Any \(n\)-th order linear ODE can be converted to a first-order system of dimension \(n\) by introducing new variables for the successive derivatives. This means the theory of systems is fully general.

## 4.1 Homogeneous Systems: The Eigenvalue Method

For the autonomous homogeneous system \(\mathbf{X}' = A\mathbf{X}\) with constant matrix \(A\), we seek solutions of the form \(\mathbf{X}(t) = e^{\lambda t}\mathbf{v}\). Substituting:
\[ \lambda e^{\lambda t}\mathbf{v} = A e^{\lambda t}\mathbf{v} \implies A\mathbf{v} = \lambda\mathbf{v}. \]
So \(\lambda\) must be an eigenvalue of \(A\) and \(\mathbf{v}\) a corresponding eigenvector.

<div class="theorem">
<strong>Theorem (General Solution via Eigenvalues)</strong>: If \(A\) is an \(n\times n\) matrix with \(n\) linearly independent eigenvectors \(\mathbf{v}_1, \ldots, \mathbf{v}_n\) corresponding to eigenvalues \(\lambda_1, \ldots, \lambda_n\) (not necessarily distinct), the general solution of \(\mathbf{X}' = A\mathbf{X}\) is
\[ \mathbf{X}(t) = c_1 e^{\lambda_1 t}\mathbf{v}_1 + c_2 e^{\lambda_2 t}\mathbf{v}_2 + \cdots + c_n e^{\lambda_n t}\mathbf{v}_n. \]
When \(A\) has a repeated eigenvalue \(\lambda\) with deficient eigenspace, generalised eigenvectors (Jordan chains) must be used; a repeated eigenvalue \(\lambda\) with multiplicity 2 and only one eigenvector \(\mathbf{v}\) contributes solutions \(e^{\lambda t}\mathbf{v}\) and \(e^{\lambda t}(t\mathbf{v} + \mathbf{w})\) where \((A - \lambda I)\mathbf{w} = \mathbf{v}\).
</div>

For \(2 \times 2\) systems, the **phase portrait** gives qualitative insight: if both eigenvalues are real negative, trajectories converge to the origin (stable node); if real positive, they diverge (unstable node); if of opposite sign, the origin is a saddle (unstable); if complex with negative real part, a stable spiral; if purely imaginary, a centre (neutrally stable).

## 4.2 Inhomogeneous Systems: Variation of Parameters

For the inhomogeneous system \(\mathbf{X}' = A\mathbf{X} + \mathbf{F}(t)\), the **fundamental matrix** \(\Phi(t)\) is the matrix whose columns are \(n\) linearly independent solutions of the homogeneous system. A particular solution is given by:
\[ \mathbf{X}_p(t) = \Phi(t)\int \Phi^{-1}(t)\mathbf{F}(t)\,dt. \]

The general solution is \(\mathbf{X} = \Phi(t)\mathbf{c} + \mathbf{X}_p(t)\), where \(\mathbf{c}\) is a constant vector determined by initial conditions.

<div class="example">
<strong>Example (Coupled Price Dynamics)</strong>: Suppose two goods have prices \(P_1(t)\) and \(P_2(t)\) that interact — excess demand in market 1 is affected by both prices. A linearised model might give
\[ \begin{pmatrix} P_1' \\ P_2' \end{pmatrix} = \begin{pmatrix} -2 & 1 \\ 1 & -2 \end{pmatrix} \begin{pmatrix} P_1 \\ P_2 \end{pmatrix} + \begin{pmatrix} a_1 \\ a_2 \end{pmatrix}. \]
The eigenvalues of the coefficient matrix are \(\lambda_1 = -1\) and \(\lambda_2 = -3\). Since both are negative, the system is stable: both prices converge to their joint equilibrium. The eigenvector for \(\lambda_1 = -1\) is \((1,1)^T\) (both prices move together) and for \(\lambda_2 = -3\) is \((1,-1)^T\) (prices move in opposite directions). Any initial disequilibrium is a superposition of these two modes, both decaying exponentially.
</div>

---

# Chapter 5: Introduction to Partial Differential Equations

So far, all functions have depended on a single independent variable. Many phenomena in finance and physics — heat diffusion, wave propagation, option pricing — involve functions of two or more variables, and the equations governing them involve **partial derivatives**. These are **partial differential equations (PDEs)**.

<div class="definition">
<strong>Definition (Partial Differential Equation)</strong>: A <em>partial differential equation</em> is an equation involving an unknown function \(u\) of two or more independent variables and its partial derivatives. The <em>order</em> is the highest partial derivative present. A PDE is <em>linear</em> if it is linear in \(u\) and its partial derivatives.
</div>

The new feature of PDEs, compared to ODEs, is that initial/boundary data must be specified along curves or surfaces, and the structure of the solution depends crucially on the geometry of these data sets relative to the equation's characteristics.

## 5.1 First-Order Linear PDEs and the Method of Characteristics

The simplest first-order linear PDE in two variables is \(a u_x + b u_t = c\), where \(a, b, c\) may be functions of \(x\), \(t\), and \(u\). The **method of characteristics** converts this PDE into a system of ODEs.

<div class="theorem">
<strong>Theorem (Method of Characteristics)</strong>: For the first-order linear PDE \(a(x,t)u_x + b(x,t)u_t = c(x,t,u)\), the solution is constant along <em>characteristic curves</em> defined by the system
\[ \frac{dx}{ds} = a, \quad \frac{dt}{ds} = b, \quad \frac{du}{ds} = c. \]
Along each characteristic, the PDE reduces to an ODE in the parameter \(s\). The solution surface is swept out by the family of characteristics emanating from the initial data curve.
</div>

<div class="example">
<strong>Example (Transport Equation)</strong>: Consider \(u_t + c\,u_x = 0\) with initial condition \(u(x,0) = f(x)\). The characteristics satisfy \(dx/ds = c\), \(dt/ds = 1\), \(du/ds = 0\). So along each characteristic, \(t = s\), \(x = cs + x_0\) (i.e., \(x - ct = x_0 = \text{const}\)), and \(u = \text{const}\). The solution is \(u(x,t) = f(x - ct)\): the initial profile \(f\) simply translates to the right at speed \(c\). This is the <em>wave equation</em> in one dimension.
</div>

## 5.2 Classification of Second-Order Linear PDEs

The most important second-order linear PDE in two variables has the form:
\[ A u_{xx} + B u_{xt} + C u_{tt} + D u_x + E u_t + Fu = G. \]

<div class="definition">
<strong>Definition (Classification)</strong>: The second-order linear PDE above is classified by the <em>discriminant</em> \(\Delta = B^2 - 4AC\):
<ul>
  <li><strong>Elliptic</strong> (\(\Delta < 0\)): e.g., Laplace's equation \(u_{xx} + u_{yy} = 0\). Models steady-state phenomena. Solutions are smooth.</li>
  <li><strong>Parabolic</strong> (\(\Delta = 0\)): e.g., the heat equation \(u_t = \kappa u_{xx}\). Models diffusion. Has a preferred time direction.</li>
  <li><strong>Hyperbolic</strong> (\(\Delta > 0\)): e.g., the wave equation \(u_{tt} = c^2 u_{xx}\). Models wave propagation. Has two families of real characteristics.</li>
</ul>
</div>

This classification is not merely taxonomic — it determines which boundary conditions are appropriate, what solution methods apply, and what physical behaviours are possible. The Black-Scholes equation, as we will see, is parabolic, which is why its solution methods mirror those of the heat equation.

## 5.3 The Heat Equation

The heat equation \(u_t = \kappa u_{xx}\) (where \(\kappa > 0\) is the diffusivity) models the spread of heat in a rod or, more abstractly, the diffusion of any quantity — concentration of a chemical, probability distributions in stochastic processes.

**Separation of variables** on a finite domain \(0 \leq x \leq L\) with boundary conditions \(u(0,t) = u(L,t) = 0\): assume \(u(x,t) = X(x)T(t)\). Substituting:
\[ \frac{T'}{T\kappa} = \frac{X''}{X} = -\lambda \quad (\text{separation constant}). \]
The spatial equation \(X'' + \lambda X = 0\) with \(X(0) = X(L) = 0\) has solutions only for \(\lambda_n = (n\pi/L)^2\), giving eigenfunctions \(X_n(x) = \sin(n\pi x/L)\). The temporal part gives \(T_n(t) = e^{-\kappa\lambda_n t}\). The general solution is the **Fourier series**:
\[ u(x,t) = \sum_{n=1}^\infty b_n \sin\!\left(\frac{n\pi x}{L}\right) e^{-\kappa (n\pi/L)^2 t}, \]
where the coefficients \(b_n = \frac{2}{L}\int_0^L f(x)\sin(n\pi x/L)\,dx\) are determined by the initial condition \(u(x,0) = f(x)\). The exponential decay factor ensures the solution smooths out and decays to zero as \(t \to \infty\).

---

# Chapter 6: The Fourier Transform

Separation of variables works beautifully on a finite interval, but many problems — including the Black-Scholes equation — are posed on the entire real line. The right tool for these problems is the **Fourier Transform**, which converts the spatial PDE into an ODE in time, exactly as the Laplace transform converts ODEs into algebraic equations.

<div class="definition">
<strong>Definition (Fourier Transform)</strong>: For a function \(f(x)\) defined on \(\mathbb{R}\), the <em>Fourier Transform</em> is
\[ \hat{f}(\omega) = \int_{-\infty}^{\infty} f(x)\,e^{-i\omega x}\,dx, \]
provided the integral converges. The <em>inverse Fourier Transform</em> recovers \(f\) from \(\hat{f}\):
\[ f(x) = \frac{1}{2\pi}\int_{-\infty}^{\infty} \hat{f}(\omega)\,e^{i\omega x}\,d\omega. \]
</div>

The Fourier Transform has several key properties that make it ideal for solving constant-coefficient linear PDEs:

- **Linearity**: \(\widehat{af + bg} = a\hat{f} + b\hat{g}\).
- **Derivative rule**: \(\widehat{f^{(n)}}(\omega) = (i\omega)^n \hat{f}(\omega)\). In particular, differentiation in \(x\) corresponds to multiplication by \(i\omega\) in frequency space.
- **Convolution theorem**: if \(h(x) = \int f(x-y)g(y)\,dy\), then \(\hat{h}(\omega) = \hat{f}(\omega)\hat{g}(\omega)\). Convolution in \(x\)-space is multiplication in \(\omega\)-space.

## 6.1 Solving the Heat Equation on the Real Line

Consider the heat equation on the entire real line:
\[ u_t = \kappa u_{xx}, \quad x \in \mathbb{R},\; t > 0, \quad u(x,0) = f(x). \]

Take the Fourier Transform in \(x\), denoting \(\hat{u}(\omega, t) = \mathcal{F}[u]\):
\[ \frac{\partial \hat{u}}{\partial t} = \kappa(i\omega)^2 \hat{u} = -\kappa\omega^2 \hat{u}. \]

This is now an ordinary differential equation in \(t\) for each fixed \(\omega\):
\[ \hat{u}(\omega, t) = \hat{f}(\omega)\,e^{-\kappa\omega^2 t}. \]

To invert, note that \(e^{-\kappa\omega^2 t}\) is itself a Gaussian in \(\omega\): its inverse Fourier Transform is the **heat kernel** (or **Gaussian kernel**):
\[ G(x,t) = \frac{1}{\sqrt{4\pi\kappa t}}\,e^{-x^2/(4\kappa t)}. \]

By the convolution theorem:
\[ u(x,t) = \int_{-\infty}^{\infty} f(y)\,G(x-y,t)\,dy = \frac{1}{\sqrt{4\pi\kappa t}}\int_{-\infty}^{\infty} f(y)\,\exp\!\left(-\frac{(x-y)^2}{4\kappa t}\right)dy. \]

<div class="theorem">
<strong>Theorem (Heat Kernel Solution)</strong>: The unique bounded solution of the heat equation \(u_t = \kappa u_{xx}\) on \(\mathbb{R}\) with initial condition \(u(x,0) = f(x)\) is the convolution
\[ u(x,t) = \frac{1}{\sqrt{4\pi\kappa t}}\int_{-\infty}^{\infty} f(y)\,\exp\!\left(-\frac{(x-y)^2}{4\kappa t}\right)dy. \]
Interpretation: the heat kernel \(G(x-y,t)\) is a Gaussian centred at \(y\) with variance \(2\kappa t\). The solution at time \(t\) is a weighted average of the initial condition, where the weights are Gaussian of width \(\sqrt{2\kappa t}\). As time increases, the Gaussian spreads: initial sharp features are smoothed out, reflecting the diffusive nature of heat conduction.
</div>

This formula is not just elegant — it is precisely the structure that underpins the solution to the Black-Scholes equation. The analogy between heat diffusion and the uncertainty in future asset prices is deep and deliberate.

---

# Chapter 7: The Black-Scholes Equation

The previous chapters have been building toward one of the most celebrated results in financial mathematics: the Black-Scholes model for option pricing. This chapter derives the Black-Scholes PDE from first principles, solves it using the heat equation connection, and interprets the result economically. The mathematical tools developed throughout the course — ODEs, linear algebra, separation of variables, the Fourier transform — all converge here.

## 7.1 Stochastic Models for Asset Prices

A fundamental challenge in finance is modelling the future price of an asset. Prices are not deterministic — they are subject to random fluctuations. The standard model is **Geometric Brownian Motion (GBM)**, which posits that the log-return of an asset over a short time interval is normally distributed and independent of the past.

<div class="definition">
<strong>Definition (Geometric Brownian Motion)</strong>: The stock price \(S(t)\) follows <em>Geometric Brownian Motion</em> if it satisfies the stochastic differential equation
\[ dS = \mu S\,dt + \sigma S\,dW_t, \]
where \(\mu\) is the <em>drift</em> (expected instantaneous return), \(\sigma > 0\) is the <em>volatility</em> (standard deviation of log-returns per unit time), and \(W_t\) is a standard Wiener process (Brownian motion).
</div>

The Wiener process \(W_t\) has the properties: \(W_0 = 0\); increments \(W_{t+s} - W_t \sim \mathcal{N}(0, s)\) for \(s > 0\); increments over non-overlapping intervals are independent. The \(\sigma S\,dW_t\) term introduces randomness proportional to the current price — consistent with the empirical observation that percentage changes in price, not absolute changes, are approximately normally distributed.

The solution to the GBM SDE is \(S(t) = S(0)\exp\!\left((\mu - \tfrac{1}{2}\sigma^2)t + \sigma W_t\right)\), so \(\ln S(t)\) is normally distributed — hence the name "geometric" Brownian motion.

## 7.2 Itô's Lemma

To price derivatives — contracts whose payoff depends on \(S\) — we need to know how smooth functions of \(S\) evolve over time. In ordinary calculus, if \(V = V(S)\) and \(S\) evolves deterministically, then \(dV = V'(S)\,dS\). For a stochastic process, however, the ordinary chain rule is modified by a second-order correction term, because \((dW_t)^2 = dt\) in the Itô calculus (not zero as in ordinary calculus).

<div class="theorem">
<strong>Theorem (Itô's Lemma)</strong>: Let \(S\) follow \(dS = \mu S\,dt + \sigma S\,dW_t\), and let \(V(S,t)\) be twice continuously differentiable in \(S\) and once in \(t\). Then
\[ dV = \left(\frac{\partial V}{\partial t} + \mu S\frac{\partial V}{\partial S} + \frac{1}{2}\sigma^2 S^2 \frac{\partial^2 V}{\partial S^2}\right)dt + \sigma S\frac{\partial V}{\partial S}\,dW_t. \]
<br><em>Heuristic derivation.</em> Expand \(dV\) by the multivariable Taylor theorem: \(dV \approx V_t\,dt + V_S\,dS + \tfrac{1}{2}V_{SS}(dS)^2 + \cdots\). Substituting \(dS = \mu S\,dt + \sigma S\,dW_t\) and using the Itô rule \((dW_t)^2 = dt\), \((dt)^2 = 0\), \(dt\,dW_t = 0\):
\[ (dS)^2 = \sigma^2 S^2 (dW_t)^2 = \sigma^2 S^2\,dt. \]
Collecting \(dt\) and \(dW_t\) terms gives the formula above.
</div>

The crucial extra term \(\frac{1}{2}\sigma^2 S^2 V_{SS}\,dt\) is the **Itô correction**. It vanishes in the deterministic limit \(\sigma \to 0\), recovering ordinary calculus.

## 7.3 Delta-Hedging and the Black-Scholes PDE

Consider a financial institution that has sold an option on a stock and wants to hedge the risk. The **delta-hedging** strategy constructs a portfolio \(\Pi\) consisting of the option \(V\) and a short position of \(\Delta\) shares of stock:
\[ \Pi = V - \Delta\cdot S. \]

By Itô's Lemma, the change in portfolio value over \(dt\) is:
\[ d\Pi = dV - \Delta\,dS = \left(V_t + \mu S V_S + \tfrac{1}{2}\sigma^2 S^2 V_{SS}\right)dt + \sigma S V_S\,dW_t - \Delta\left(\mu S\,dt + \sigma S\,dW_t\right). \]

Choosing \(\Delta = \frac{\partial V}{\partial S}\) **eliminates the stochastic term** \(dW_t\):
\[ d\Pi = \left(V_t + \tfrac{1}{2}\sigma^2 S^2 V_{SS}\right)dt. \]

This portfolio is now **instantaneously risk-free** — its return over \(dt\) is deterministic. In an arbitrage-free market, a risk-free portfolio must earn exactly the risk-free rate \(r\):
\[ d\Pi = r\Pi\,dt = r(V - \Delta S)\,dt = r(V - S V_S)\,dt. \]

Setting the two expressions for \(d\Pi\) equal and rearranging:

<div class="theorem">
<strong>Theorem (Black-Scholes PDE)</strong>: Under the GBM model, in an arbitrage-free market with risk-free rate \(r\), the price \(V(S,t)\) of any European derivative satisfies the <em>Black-Scholes PDE</em>:
\[ \frac{\partial V}{\partial t} + \frac{1}{2}\sigma^2 S^2 \frac{\partial^2 V}{\partial S^2} + rS\frac{\partial V}{\partial S} - rV = 0. \]
The terminal condition is \(V(S,T) = \text{Payoff}(S)\), where \(T\) is the expiry date.
<br>For a European call option with strike \(K\): Payoff\((S) = \max(S-K, 0)\).
<br>For a European put option: Payoff\((S) = \max(K-S, 0)\).
</div>

Notice the structure: this is a second-order linear PDE, backward in time (the terminal condition is given at \(t = T\), and we solve backward to \(t < T\)). The coefficients involve \(S\), making it variable-coefficient — but a change of variables will transform it into the heat equation.

## 7.4 Reduction to the Heat Equation

We transform the Black-Scholes PDE into the standard heat equation through a sequence of changes of variables.

**Step 1**: Let \(S = e^x\), so \(x = \ln S \in \mathbb{R}\). The log-price is a more natural variable since it ranges over all of \(\mathbb{R}\).

**Step 2**: Reverse time. Let \(\tau = T - t \geq 0\). The terminal condition at \(t = T\) becomes an initial condition at \(\tau = 0\).

**Step 3**: Remove the exponential growth by writing \(V = e^{\alpha x + \beta \tau} u(x, \tau)\) for constants \(\alpha\) and \(\beta\) to be determined.

After careful substitution into the Black-Scholes PDE, and choosing \(\alpha = -\frac{1}{2}\left(\frac{2r}{\sigma^2} - 1\right)\) and \(\beta = -\frac{1}{4}\sigma^2\left(\frac{2r}{\sigma^2} + 1\right)^2\) (or equivalently values that remove the first-derivative and zeroth-order terms), the PDE for \(u\) becomes:
\[ \frac{\partial u}{\partial \tau} = \frac{\sigma^2}{2}\frac{\partial^2 u}{\partial x^2}. \]

This is exactly the heat equation with diffusivity \(\kappa = \sigma^2/2\)! The initial condition \(u(x, 0)\) is determined by the payoff function.

## 7.5 The Black-Scholes Formula

Applying the heat kernel solution (Chapter 6) to the transformed initial value problem and reversing the change of variables yields the celebrated Black-Scholes formula.

<div class="theorem">
<strong>Theorem (Black-Scholes Formula)</strong>: The price at time \(t\) of a European <em>call</em> option with strike \(K\), expiry \(T\), on a stock with current price \(S\), volatility \(\sigma\), with risk-free rate \(r\), is
\[ C(S,t) = S\,N(d_1) - K e^{-r(T-t)} N(d_2), \]
where \(N(\cdot)\) is the standard normal cumulative distribution function and
\[ d_1 = \frac{\ln(S/K) + \left(r + \tfrac{1}{2}\sigma^2\right)(T-t)}{\sigma\sqrt{T-t}}, \qquad d_2 = d_1 - \sigma\sqrt{T-t}. \]
By put-call parity (\(C - P = S - Ke^{-r(T-t)}\)), the European put price is
\[ P(S,t) = Ke^{-r(T-t)}N(-d_2) - S\,N(-d_1). \]
</div>

The formula has a beautiful economic interpretation. \(N(d_2)\) is the risk-neutral probability that the option expires in the money (\(S_T > K\)) — the probability, computed under a risk-neutral measure that replaces the drift \(\mu\) with the risk-free rate \(r\). The term \(Ke^{-r(T-t)}N(d_2)\) is the discounted expected strike payment. The term \(S\,N(d_1)\) accounts for the expected receipt of the stock, adjusted for the probability weighting. The option price is the present value of the expected net benefit from exercising.

## 7.6 The Greeks

The partial derivatives of the option price with respect to its parameters are called the **Greeks**, and they quantify the sensitivities used by traders to manage risk.

<div class="definition">
<strong>Definition (The Greeks)</strong>: For a European call option \(C(S, t)\):
<ul>
  <li><strong>Delta</strong>: \(\Delta = \frac{\partial C}{\partial S} = N(d_1)\). Measures sensitivity to stock price. This is exactly the hedge ratio used in the Black-Scholes derivation.</li>
  <li><strong>Gamma</strong>: \(\Gamma = \frac{\partial^2 C}{\partial S^2} = \frac{N'(d_1)}{S\sigma\sqrt{T-t}}\). Measures the rate of change of delta. High gamma means delta changes rapidly, requiring frequent rehedging.</li>
  <li><strong>Theta</strong>: \(\Theta = \frac{\partial C}{\partial t}\). The time decay of the option — how much the option loses in value as one day passes, all else equal.</li>
  <li><strong>Vega</strong>: \(\mathcal{V} = \frac{\partial C}{\partial \sigma} = S\sqrt{T-t}\,N'(d_1)\). Sensitivity to volatility. Options become more valuable when volatility increases, since the upside from large moves outweighs the downside for a call holder.</li>
  <li><strong>Rho</strong>: \(\rho = \frac{\partial C}{\partial r} = K(T-t)e^{-r(T-t)}N(d_2)\). Sensitivity to the interest rate.</li>
</ul>
</div>

Note that the Black-Scholes PDE can be written in terms of the Greeks as \(\Theta + \frac{1}{2}\sigma^2 S^2 \Gamma + rS\Delta - rC = 0\). This form has the interpretation: the time decay \(\Theta\) is offset by the gain from Gamma (the curvature of the option's value in \(S\)) and the return earned on the delta hedge.

## 7.7 Assumptions and Limitations

The Black-Scholes model rests on several idealising assumptions worth understanding critically:

- **Constant volatility**: In reality, implied volatility varies with strike and maturity (the "volatility smile" or "volatility surface"). Models such as stochastic volatility (Heston) or local volatility (Dupire) extend Black-Scholes to address this.
- **Continuous trading**: The delta-hedging argument requires instantaneous and costless rebalancing. In practice, transaction costs and discrete rebalancing introduce hedging error.
- **Log-normal distribution**: Empirical returns exhibit heavier tails than the normal distribution — so-called "fat tails" or excess kurtosis — meaning extreme events occur more often than the model predicts.
- **No dividends, constant interest rate**: These can be incorporated by straightforward modifications to the formula.
- **Complete markets**: The assumption that all risk can be perfectly hedged is an idealisation.

Despite these limitations, Black-Scholes remains the universal benchmark in options markets. Practitioners quote option prices in terms of "implied volatility" — the value of \(\sigma\) that makes the Black-Scholes formula reproduce the observed market price — as a common language, even when more sophisticated models are used for actual pricing.

## 7.8 The Arc from ODEs to Black-Scholes

It is worth pausing to appreciate the mathematical arc of this course. We began with the simplest differential equations — separable ODEs describing exponential growth in a bank account — and progressively built the tools needed to handle more complex phenomena. First-order linear ODEs gave us the integrating factor and debt dynamics. Higher-order linear ODEs introduced the characteristic equation and superposition. Systems of ODEs introduced eigenvalues and phase portraits. PDEs introduced the method of characteristics and the classification of equations. The Fourier Transform gave us the heat kernel. And finally, Itô's lemma and the delta-hedging argument produced the Black-Scholes PDE — which, through a clever change of variables, reduces to the very heat equation we solved in Chapter 6.

The Black-Scholes formula is thus the culmination of a long chain of mathematical ideas, each building on the last. The diffusion of heat and the diffusion of uncertainty in financial markets are not merely analogous — they are governed by the same equation, and the same mathematical techniques solve both.
