---
title: "AMATH 350: Differential Equations for Business and Economics"
subjects: "AMATH"
prof: "Shahla Aliakbari"
---

## Sources and References

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

\[
y' = f(x,y), \quad y(x_0) = y_0
\]
has a unique solution on some interval containing \(x_0\).
<br><em>Proof sketch.</em> Rewrite the IVP as the integral equation \(y(x) = y_0 + \int_{x_0}^x f(t,y(t))\,dt\). Define a sequence of approximations \(y_0(x) = y_0\), \(y_{n+1}(x) = y_0 + \int_{x_0}^x f(t,y_n(t))\,dt\). The Lipschitz condition on \(f\) (guaranteed by continuity of \(\partial f/\partial y\)) ensures this sequence converges uniformly to a unique fixed point.
</div>

The theorem tells us that pathological behaviour — solutions that blow up, split, or fail to exist — can only arise when the hypotheses fail, for instance when \(f\) is discontinuous or \(\partial f / \partial y\) is unbounded. In practice, the theorem covers nearly every equation we encounter in business and economics applications, and we can proceed to find solutions with confidence.

<div class="example">
<strong>Example — Failure of uniqueness when the Lipschitz condition fails</strong>: Consider the IVP \(y' = y^{2/3}\), \(y(0) = 0\). The right-hand side \(f(x, y) = y^{2/3}\) is continuous everywhere, but \(\partial f/\partial y = \frac{2}{3}y^{-1/3} \to \infty\) as \(y \to 0\), so the Lipschitz condition fails at \(y = 0\). This IVP has infinitely many solutions. Two obvious ones are \(y_1(x) \equiv 0\) and \(y_2(x) = (x/3)^3 = x^3/27\). Verification for \(y_2\): \(y_2' = 3x^2/27 = x^2/9\), and \(y_2^{2/3} = (x^3/27)^{2/3} = x^2/9\). Both satisfy the ODE and the initial condition \(y(0) = 0\). More generally, for any \(a \geq 0\), the function

\[
y_a(x) = \begin{cases} 0 & x \leq a, \\ \left(\dfrac{x-a}{3}\right)^3 & x > a \end{cases}
\]

is differentiable everywhere and solves the IVP. This yields infinitely many distinct solutions from the same initial data, demonstrating that the Lipschitz hypothesis of Picard–Lindelöf is not a formality — it is genuinely necessary for uniqueness.
</div>

## 1.1 Separable Equations

Many important first-order ODEs have the form \(y' = f(x)\,g(y)\), where the right-hand side factors into a function of \(x\) alone times a function of \(y\) alone. Such equations are called **separable** because we can separate the variables onto opposite sides of the equation.

<div class="definition">
<strong>Definition (Separable ODE)</strong>: A first-order ODE is <em>separable</em> if it can be written as

\[
\frac{dy}{dx} = f(x)\,g(y).
\]
The general solution is obtained by separating variables and integrating both sides:

\[
\int \frac{dy}{g(y)} = \int f(x)\,dx + C.
\]
</div>

The separation step is formally justified by writing \(dy = g(y)\,f(x)\,dx\) and dividing through by \(g(y)\) (wherever \(g(y) \neq 0\)). Note that any value \(y = y^*\) with \(g(y^*) = 0\) is a constant (equilibrium) solution, and it should be checked separately.

<div class="example">
<strong>Example (Continuous Compounding)</strong>: Let \(A(t)\) be the value of a bank account at time \(t\) (in years), earning interest at a continuously compounded annual rate \(r\). The rate of growth of the account is proportional to its current value:

\[
\frac{dA}{dt} = rA, \quad A(0) = A_0.
\]
Separating variables: \(\frac{dA}{A} = r\,dt\). Integrating both sides: \(\ln|A| = rt + C_1\), so \(A(t) = A_0 e^{rt}\). This is the fundamental law of continuous compounding. For a present value calculation: if we want a future value \(FV\) at time \(T\), its present value is \(PV = FV \cdot e^{-rT}\). The factor \(e^{-rT}\) is the <em>discount factor</em> — it reflects that a dollar today is worth more than a dollar tomorrow.
</div>

<div class="example">
<strong>Example — Logistic population growth</strong>: The exponential growth model \(dP/dt = rP\) predicts unbounded growth, which is unrealistic. The <strong>logistic model</strong> introduces a carrying capacity \(K\):

\[
\frac{dP}{dt} = rP\!\left(1 - \frac{P}{K}\right), \quad P(0) = P_0.
\]

This is separable. Separating variables:

\[
\frac{dP}{P(1 - P/K)} = r\,dt.
\]

Using partial fractions on the left side: \(\frac{1}{P(1-P/K)} = \frac{1}{P} + \frac{1/K}{1 - P/K}\). Integrating:

\[
\ln|P| - \ln\left|1 - \frac{P}{K}\right| = rt + C \implies \ln\frac{P}{K - P} = rt + C.
\]

Exponentiating and applying the initial condition \(P(0) = P_0\):

\[
P(t) = \frac{K}{1 + \left(\dfrac{K - P_0}{P_0}\right)e^{-rt}}.
\]

<em>Numerical example</em>: Let \(r = 0.1\,\text{yr}^{-1}\), \(K = 1000\), \(P_0 = 10\). Then the solution is

\[
P(t) = \frac{1000}{1 + 99\,e^{-0.1t}}.
\]

As \(t \to \infty\), \(e^{-0.1t} \to 0\), so \(P(t) \to 1000 = K\). The population converges to the carrying capacity regardless of initial size.

<em>Time to reach 50% of carrying capacity</em>: We want \(P(t_{1/2}) = 500\):

\[
500 = \frac{1000}{1 + 99\,e^{-0.1t_{1/2}}} \implies 1 + 99\,e^{-0.1t_{1/2}} = 2 \implies e^{-0.1t_{1/2}} = \frac{1}{99}.
\]

Therefore \(t_{1/2} = \ln(99)/0.1 \approx 4.595/0.1 \approx 46\) years. The logistic model is widely used in market saturation models (a new technology reaches half its maximum market share), epidemic modelling (cumulative infections follow a logistic curve before herd immunity), and resource management.
</div>

## 1.2 First-Order Linear ODEs

Not all first-order equations are separable. The next most tractable class is **first-order linear** equations, which arise naturally in finance whenever the rate of change of a quantity depends linearly on both the quantity itself and an external forcing term.

<div class="definition">
<strong>Definition (First-Order Linear ODE)</strong>: An ODE of the form

\[
\frac{dy}{dx} + P(x)\,y = Q(x)
\]
is called a <em>first-order linear ODE</em>. When \(Q(x) = 0\) it is <em>homogeneous</em>; otherwise <em>inhomogeneous</em> (or nonhomogeneous).
</div>

The key technique for solving first-order linear ODEs is the **integrating factor**. The idea is to multiply both sides by a cleverly chosen function \(\mu(x)\) so that the left-hand side becomes a perfect derivative.

<div class="theorem">
<strong>Theorem (Integrating Factor Method)</strong>: For the first-order linear ODE \(y' + P(x)y = Q(x)\), let

\[
\mu(x) = e^{\int P(x)\,dx}.
\]
Multiplying both sides by \(\mu(x)\) yields \(\frac{d}{dx}[\mu(x)y] = \mu(x)Q(x)\). Integrating:

\[
y = \frac{1}{\mu(x)}\left[\int \mu(x)Q(x)\,dx + C\right].
\]
<br><em>Proof sketch.</em> Note that \(\mu'(x) = P(x)\mu(x)\). Then \(\frac{d}{dx}[\mu y] = \mu y' + \mu' y = \mu(y' + Py) = \mu Q\). The result follows by integration.
</div>

<div class="example">
<strong>Example (Debt Dynamics)</strong>: Let \(D(t)\) denote government debt at time \(t\), \(r\) the interest rate, and \(T(t)\) the rate of tax revenue. Then

\[
\frac{dD}{dt} = rD - T(t).
\]
This is a first-order linear ODE with \(P(t) = -r\) and \(Q(t) = -T(t)\). The integrating factor is \(\mu(t) = e^{-rt}\). Multiplying through: \(\frac{d}{dt}[e^{-rt}D] = -e^{-rt}T(t)\). Integrating: \(D(t) = e^{rt}D(0) - e^{rt}\int_0^t e^{-rs}T(s)\,ds\). The first term is the compounded initial debt; the second term represents the accumulated present value of tax revenues. Sustainable debt requires the second term to eventually dominate the first.
</div>

<div class="example">
<strong>Example — Debt with exponentially growing tax revenue</strong>: Let \(r = 0.05\) and \(T(t) = 100\,e^{0.02t}\) (tax revenues growing at 2% per year). The debt equation becomes:

\[
\frac{dD}{dt} = 0.05\,D - 100\,e^{0.02t}.
\]

The integrating factor is \(\mu(t) = e^{-0.05t}\). Multiplying through and integrating from 0 to \(t\):

\[
e^{-0.05t}D(t) - D(0) = -100\int_0^t e^{-0.03s}\,ds = -\frac{100}{0.03}\!\left(1 - e^{-0.03t}\right).
\]

Solving for \(D(t)\):

\[
D(t) = D(0)\,e^{0.05t} + \frac{100}{0.03}\!\left(e^{0.05t} - e^{0.02t}\right).
\]

As \(t \to \infty\), since \(0.05 > 0.02\), the \(e^{0.05t}\) terms dominate and \(D(t) \to +\infty\), regardless of \(D(0)\). Despite growing revenues, debt grows without bound — the interest rate exceeds the revenue growth rate, so the debt-to-revenue ratio diverges. This is the mathematical expression of the Domar fiscal sustainability criterion: long-run debt stability requires the interest rate not to exceed the growth rate of the economy. The condition \(r > g\), made famous by Piketty, signals precisely this explosive dynamic.
</div>

## 1.3 Logistic Growth and Newton's Law of Cooling

Not every important first-order ODE is linear. Two nonlinear equations that appear throughout economics, ecology, and applied science are the logistic equation and Newton's law of cooling.

<div class="definition">
<strong>Definition (Logistic Growth)</strong>: The <em>logistic differential equation</em> is

\[
\frac{dP}{dt} = rP\!\left(1 - \frac{P}{K}\right),
\]
where \(P(t)\) is a population (or market share, or adoption level), \(r > 0\) is the intrinsic growth rate, and \(K > 0\) is the <em>carrying capacity</em> (the maximum sustainable level). The factor \((1 - P/K)\) acts as a drag: growth slows as \(P\) approaches \(K\), and is negative when \(P > K\).
</div>

The logistic equation is separable. Separating variables:

\[
\frac{dP}{P(1 - P/K)} = r\,dt.
\]
Using partial fractions: \(\frac{1}{P(1-P/K)} = \frac{1}{P} + \frac{1/K}{1 - P/K}\). Integrating both sides and applying the initial condition \(P(0) = P_0\):

\[
P(t) = \frac{K}{1 + \left(\dfrac{K - P_0}{P_0}\right)e^{-rt}}.
\]

<div class="example">
<strong>Example — Logistic growth with market saturation</strong>: Suppose a new technology is adopted in a market of size \(K = 1000\) firms, with intrinsic adoption rate \(r = 0.2\,\text{yr}^{-1}\) and initial adopters \(P_0 = 100\). Then

\[
P(t) = \frac{1000}{1 + 9\,e^{-0.2t}}.
\]

At \(t = 10\) years:

\[
P(10) = \frac{1000}{1 + 9\,e^{-2}} = \frac{1000}{1 + 9 \times 0.1353} = \frac{1000}{1 + 1.218} = \frac{1000}{2.218} \approx 451.
\]

At \(t = 50\) years:

\[
P(50) = \frac{1000}{1 + 9\,e^{-10}} = \frac{1000}{1 + 9 \times 4.54 \times 10^{-5}} \approx \frac{1000}{1.0004} \approx 999.6.
\]

The market is nearly fully saturated by year 50. Notice that the inflection point — the time of fastest growth — occurs when \(P = K/2 = 500\), i.e., when \(1 + 9e^{-0.2t^*} = 2\), giving \(t^* = \ln(9)/0.2 = 2.197/0.2 \approx 11\) years. After the inflection, growth decelerates as saturation approaches.

<em>Economic interpretation</em>: In innovation diffusion (Bass model), the logistic equation captures the S-shaped adoption curve observed in markets for consumer goods, telecommunications technology, and pharmaceuticals. The carrying capacity \(K\) represents potential market size; \(r\) reflects the effectiveness of word-of-mouth or marketing. Policymakers use this model to forecast when a market will approach saturation and plan capacity accordingly.
</div>

<div class="remark">
<strong>Remark</strong>: The logistic equation has two equilibria: \(P = 0\) (unstable) and \(P = K\) (stable). Linearising near \(P = K\): let \(p = P - K\), then \(dp/dt \approx -rp\), so small deviations from the carrying capacity decay at rate \(r\). The system regulates itself: overshoot is corrected by negative growth, undershoot by positive growth. This negative feedback is the mathematical essence of market saturation and ecological carrying-capacity limits.
</div>

<div class="example">
<strong>Example — Newton's law of cooling</strong>: Let \(T(t)\) be the temperature of an object and \(A\) the ambient temperature. Newton's law of cooling states

\[
\frac{dT}{dt} = k(A - T), \quad k > 0.
\]
This is a first-order linear ODE with integrating factor \(\mu(t) = e^{kt}\). The solution is:

\[
T(t) = A + (T_0 - A)e^{-kt}.
\]

<em>Numerical instance</em>: A cup of coffee starts at \(T_0 = 90°\text{C}\), the room is at \(A = 20°\text{C}\), and the cooling constant is \(k = 0.1\,\text{min}^{-1}\). Then \(T(t) = 20 + 70\,e^{-0.1t}\).

At \(t = 10\) min: \(T(10) = 20 + 70e^{-1} = 20 + 70 \times 0.3679 \approx 20 + 25.8 = 45.8°\text{C}\).

Time to cool to \(50°\text{C}\): solve \(20 + 70e^{-0.1t} = 50\), so \(e^{-0.1t} = 30/70 = 3/7\), giving \(t = -10\ln(3/7) = 10\ln(7/3) \approx 10 \times 0.847 = 8.47\) minutes.

<em>Economic analogy</em>: The same equation governs the rate at which a price \(P(t)\) adjusts toward a new equilibrium level \(A\) following a shock — the "price adjustment speed" parameter \(k\) plays the role of the cooling constant. The exponential approach to equilibrium is the simplest model of market convergence.
</div>

## 1.4 Substitution Methods

Some equations are neither separable nor linear in their original form, but a change of variables transforms them into one of these tractable classes.

A **Bernoulli equation** has the form \(y' + P(x)y = Q(x)y^n\) for some \(n \neq 0, 1\). The substitution \(v = y^{1-n}\) linearises it: differentiating, \(v' = (1-n)y^{-n}y'\), and substituting into the Bernoulli equation yields a linear ODE for \(v\).

A **homogeneous equation** (in the sense of this substitution method) has the form \(y' = f(y/x)\). The substitution \(v = y/x\), so \(y = vx\) and \(y' = v + xv'\), converts this to a separable equation in \(v\) and \(x\):

\[
v + xv' = f(v) \implies \int \frac{dv}{f(v) - v} = \int \frac{dx}{x}.
\]

**Dimensional homogeneity** is a useful modelling principle: every term in a physical or economic equation must have the same units. This constrains the form of equations and provides a check on algebra. For example, in an equation relating dollars, time, and rates, each additive term must have units of dollars (or dollars per unit time, consistently). Violations of dimensional homogeneity indicate errors in model formulation.

<div class="example">
<strong>Example — Bernoulli equation: logistic death model</strong>: Consider the Bernoulli equation

\[
\frac{dP}{dt} + P = P^2, \quad P(0) = 2.
\]

This has \(n = 2\). The substitution \(v = P^{1-2} = P^{-1} = 1/P\) linearises the equation. Differentiating: \(v' = -P^{-2}P'\). Dividing the Bernoulli equation by \(P^2\):

\[
P^{-2}P' + P^{-1} = 1 \implies -v' + v = 1 \implies v' - v = -1.
\]

This is a first-order linear ODE. The integrating factor is \(e^{-t}\):

\[
\frac{d}{dt}\!\left[e^{-t}v\right] = -e^{-t} \implies e^{-t}v = e^{-t} + C \implies v = 1 + Ce^t.
\]

Therefore \(P(t) = 1/(1 + Ce^t)\). Applying the initial condition \(P(0) = 2\): \(2 = 1/(1 + C)\), so \(1 + C = 1/2\), giving \(C = -1/2\). The solution is:

\[
P(t) = \frac{1}{1 - \tfrac{1}{2}e^t} = \frac{2}{2 - e^t}.
\]

<em>Finite-time blowup</em>: The denominator vanishes when \(e^t = 2\), i.e., at \(t^* = \ln 2 \approx 0.693\). The solution \(P(t) \to +\infty\) as \(t \to \ln 2^-\). The quadratic death term \(P^2\) (modelling e.g. competition for limited resources causing mass die-off, or runaway positive feedback) overwhelms the linear birth term, driving the population to infinity in finite time. This phenomenon — finite-time blowup — is impossible for linear ODEs but is generic in nonlinear equations with superlinear growth terms.
</div>

---

# Chapter 2: Applications to Finance and Economics

The differential equations developed in Chapter 1 are not merely mathematical abstractions — they are the natural language for modelling how economic quantities evolve over time. This chapter develops several core applications, building intuition for how the choice of equation structure encodes economic assumptions.

## 2.1 Supply-Demand Dynamics

In introductory economics, supply and demand determine a static equilibrium price. But in reality, prices adjust over time in response to excess demand. A simple dynamic model captures this:

<div class="definition">
<strong>Definition (Price Adjustment Dynamics)</strong>: Let \(P(t)\) be the market price at time \(t\), \(D(P)\) the demand function, and \(S(P)\) the supply function. The <em>price adjustment equation</em> is

\[
\frac{dP}{dt} = \alpha\left[D(P) - S(P)\right], \quad \alpha > 0.
\]
The parameter \(\alpha\) is the speed of adjustment. Equilibrium occurs at \(P^*\) where \(D(P^*) = S(P^*)\).
</div>

To analyse stability, linearise near \(P^*\). Let \(p = P - P^*\) be the deviation. Then to first order:

\[
\frac{dp}{dt} \approx \alpha\left[D'(P^*) - S'(P^*)\right]p.
\]
In a normal market, demand slopes downward (\(D' < 0\)) and supply slopes upward (\(S' > 0\)), so \(D'(P^*) - S'(P^*) < 0\). Setting \(\beta = -\alpha[D'(P^*) - S'(P^*)] > 0\), the linearised equation is \(dp/dt = -\beta p\), with solution \(p(t) = p(0)e^{-\beta t} \to 0\). The equilibrium is **stable**: prices converge exponentially to \(P^*\).

<div class="example">
<strong>Example (Linear Supply and Demand)</strong>: Suppose \(D(P) = a - bP\) and \(S(P) = c + dP\) with \(a, b, c, d > 0\). The equilibrium price is \(P^* = (a-c)/(b+d)\). The price adjustment ODE is

\[
\frac{dP}{dt} = \alpha\left[(a - bP) - (c + dP)\right] = \alpha(a - c) - \alpha(b+d)P.
\]
This is a first-order linear ODE. Setting \(\beta = \alpha(b+d)\) and \(\gamma = \alpha(a-c)\):

\[
\frac{dP}{dt} + \beta P = \gamma.
\]
The integrating factor is \(e^{\beta t}\). The solution is \(P(t) = P^* + (P_0 - P^*) e^{-\beta t}\), confirming exponential convergence.
</div>

## 2.2 The Domar Model of Public Debt Sustainability

A classic application of first-order linear ODEs in macroeconomics is the **Domar (1944) model** of public debt dynamics. If the government runs a primary deficit that grows at rate \(g\) and the existing debt accumulates interest at rate \(r\), the evolution of the debt stock \(D(t)\) is:

\[
\frac{dD}{dt} = rD + G_0 e^{gt},
\]

where \(G_0 e^{gt}\) is the (growing) primary deficit. This is a first-order linear ODE with \(P(t) = -r\) and \(Q(t) = G_0 e^{gt}\). The integrating factor is \(\mu(t) = e^{-rt}\).

Multiplying through: \(\frac{d}{dt}[e^{-rt}D] = G_0 e^{(g-r)t}\).

<em>Case 1: \(g \neq r\)</em>. Integrating:

\[
e^{-rt}D = \frac{G_0}{g - r}e^{(g-r)t} + C.
\]
Applying \(D(0) = D_0\): \(C = D_0 - G_0/(g-r)\). Therefore:

\[
D(t) = e^{rt}\left[D_0 - \frac{G_0}{g-r}\right] + \frac{G_0}{g-r}e^{gt}.
\]

<em>Case 2: \(g = r\)</em>. Then \(\frac{d}{dt}[e^{-rt}D] = G_0\), giving \(D(t) = e^{rt}(D_0 + G_0 t)\) — debt grows faster than exponential.

The key quantity is the **debt-to-GDP ratio** \(d = D/Y\). If GDP grows at rate \(g\) (so \(Y = Y_0 e^{gt}\)), then \(d\) stabilises when the growth rate of \(D\) equals \(g\). Analysis of the solution shows:

- If \(r < g\): the term \(e^{rt}\) grows slower than \(e^{gt}\), and the deficit term dominates. The debt ratio stabilises at a finite level.
- If \(r > g\): the compounding interest on debt outpaces GDP growth, and the debt-to-GDP ratio grows without bound — debt is unsustainable.

<div class="theorem">
<strong>Domar Sustainability Condition</strong>: Public debt is sustainable (the debt-to-GDP ratio remains bounded) if and only if the real interest rate \(r\) is strictly less than the growth rate of GDP \(g\). When \(r \geq g\), the debt ratio diverges and fiscal consolidation (reducing \(G_0\)) is necessary for stability.
</div>

This result — that \(r < g\) is the sustainability condition — has been central to debates about fiscal policy since Olivier Blanchard's 2019 American Economic Association presidential lecture, in which he argued that for most advanced economies in recent decades, \(r < g\) has held, making some level of deficit spending sustainable.

## 2.3 The Evans Price Adjustment Model

The **Evans model** extends price dynamics to include inventory adjustments, leading to second-order behaviour. Let \(P(t)\) be the market price, \(D(P)\) demand, and \(S(P)\) supply. Inventories \(I(t)\) accumulate according to \(I' = S(P) - D(P)\). If prices respond to both excess demand and the rate of inventory change:

\[
P'' + \alpha P' + \beta P = \gamma,
\]
this is a second-order constant-coefficient ODE, analysed in Chapter 3. The roots of the characteristic equation determine whether prices oscillate to equilibrium (complex roots with negative real part) or converge monotonically (real negative roots). The Evans model thus predicts **price cycles** in commodity markets as a natural consequence of inventory dynamics, not market irrationality.

## 2.4 The Solow Growth Model

One of the most influential models in macroeconomics is the Solow growth model, which describes how capital accumulates in an economy over time.

Let \(k = K/L\) be capital per worker, \(f(k)\) be output per worker (a concave production function such as \(f(k) = k^\alpha\)), \(s\) the savings rate, \(n\) the population growth rate, and \(\delta\) the depreciation rate. Capital per worker evolves according to:

\[
\frac{dk}{dt} = sf(k) - (n + \delta)k.
\]

The steady state \(k^*\) satisfies \(sf(k^*) = (n+\delta)k^*\) — investment exactly offsets the dilution of capital from population growth and depreciation. Linearising near \(k^*\) shows the steady state is stable when \(sf'(k^*) < n + \delta\), which is guaranteed by the concavity of \(f\). This ODE is a Bernoulli equation when \(f(k) = k^\alpha\), and can be solved explicitly by the substitution \(v = k^{1-\alpha}\).

<div class="remark">
<strong>Remark (Convergence and its limits)</strong>: The Solow model predicts <em>absolute convergence</em> — if all countries share the same technology, savings rate, and population growth rate, they all converge to the same capital per worker \(k^*\), regardless of their starting point. Poorer countries should therefore grow faster and catch up to richer ones. Empirically, this prediction fails globally: poor Sub-Saharan African countries have not converged toward US or European levels over the past six decades. However, within more homogeneous groups — OECD countries, or US states — conditional convergence is observed at a rate of approximately 2% per year, consistent with Solow's linearised dynamics. The failure of absolute convergence globally motivates extensions: the Mankiw–Romer–Weil model adds human capital and explains the cross-country income distribution more accurately; endogenous growth models (Romer, Lucas) make technology endogenous rather than exogenous; and geography and institutions explain much of the residual variation. The Solow model thus serves as an indispensable baseline from which its own failures point toward richer theories.
</div>

<div class="example">
<strong>Example — Solow model with Cobb-Douglas production</strong>: Take \(f(k) = k^{1/2}\) (so \(\alpha = 1/2\)), \(s = 0.3\), \(n = 0.02\), \(\delta = 0.08\), so \(n + \delta = 0.10\). The equation is \(dk/dt = 0.3 k^{1/2} - 0.10 k\). The steady state satisfies \(0.3(k^*)^{1/2} = 0.10 k^*\), giving \((k^*)^{1/2} = 3\), so \(k^* = 9\).

To solve explicitly, set \(v = k^{1/2}\), so \(k = v^2\) and \(dk/dt = 2v\,dv/dt\). The equation becomes \(2v\,dv/dt = 0.3v - 0.10v^2\), i.e., \(dv/dt = 0.15 - 0.05v\). This is a first-order linear ODE! The integrating factor gives \(v(t) = 3 + (v_0 - 3)e^{-0.05t}\), so:

\[
k(t) = \left[3 + (k_0^{1/2} - 3)e^{-0.05t}\right]^2.
\]

Starting from \(k_0 = 1\) (so \(k_0^{1/2} = 1\)):

\[
k(t) = \left[3 - 2e^{-0.05t}\right]^2.
\]

At \(t = 20\): \(k(20) = [3 - 2e^{-1}]^2 = [3 - 0.736]^2 = [2.264]^2 \approx 5.13\). At \(t = 100\): \(k(100) = [3 - 2e^{-5}]^2 \approx [3 - 0.013]^2 \approx 8.92\), close to the steady state \(k^* = 9\). The half-life of convergence is \(\ln(2)/0.05 \approx 13.9\) years — consistent with empirical estimates of convergence rates in cross-country growth regressions.
</div>

## 2.5 The IS-LM Model as a System of ODEs

The **IS-LM model** of macroeconomic equilibrium — the workhorse of undergraduate macro — can be cast as a dynamic system. Let \(Y(t)\) be national income and \(r(t)\) the interest rate. In a simple dynamic version:

\[
\frac{dY}{dt} = \alpha\left[I(r) + G - S(Y)\right], \qquad \frac{dr}{dt} = \beta\left[L(Y, r) - M\right],
\]

where \(I(r)\) is investment (decreasing in \(r\)), \(G\) government spending, \(S(Y)\) saving (increasing in \(Y\)), \(L(Y,r)\) money demand (increasing in \(Y\), decreasing in \(r\)), and \(M\) the money supply. Near the IS-LM equilibrium, linearising gives a 2D linear system whose eigenvalues determine whether adjustment is monotone or oscillatory. In typical parameterisations both eigenvalues are negative (stable node or spiral), so the economy converges to its IS-LM equilibrium.

---

# Chapter 3: Higher-Order Linear ODEs

First-order equations describe systems with a single degree of freedom — one piece of initial data. Many physical and economic systems have richer dynamics: oscillations, resonance, and complex transients that require higher-order equations to capture.

<div class="definition">
<strong>Definition (n-th Order Linear ODE)</strong>: An ODE of the form

\[
a_n(x)y^{(n)} + a_{n-1}(x)y^{(n-1)} + \cdots + a_1(x)y' + a_0(x)y = g(x)
\]
is called an <em>n-th order linear ODE</em>. It is <em>homogeneous</em> when \(g(x) = 0\) and <em>inhomogeneous</em> when \(g(x) \neq 0\).
</div>

A central result is that the solution set of the homogeneous equation forms a **vector space** of dimension \(n\): there exist \(n\) linearly independent solutions \(y_1, \ldots, y_n\), and every solution is a linear combination \(y = c_1 y_1 + \cdots + c_n y_n\). The **general solution** of the inhomogeneous equation is then \(y = y_h + y_p\), where \(y_h\) is the general homogeneous solution and \(y_p\) is any particular solution.

## 3.1 The Wronskian

The question of whether \(n\) solutions are linearly independent is answered by the Wronskian determinant.

<div class="definition">
<strong>Definition (Wronskian)</strong>: For \(n\) functions \(y_1, \ldots, y_n\), the <em>Wronskian</em> is

\[
W(y_1,\ldots,y_n)(x) = \det \begin{pmatrix} y_1 & y_2 & \cdots & y_n \\ y_1' & y_2' & \cdots & y_n' \\ \vdots & & & \vdots \\ y_1^{(n-1)} & y_2^{(n-1)} & \cdots & y_n^{(n-1)} \end{pmatrix}.
\]
If \(y_1, \ldots, y_n\) are solutions of a linear ODE with continuous coefficients, they are linearly independent if and only if \(W(x_0) \neq 0\) for some (equivalently, every) \(x_0\) in the interval.
</div>

<div class="example">
<strong>Example — Verifying linear independence via the Wronskian</strong>: Verify that \(e^x\) and \(e^{2x}\) are linearly independent solutions of \(y'' - 3y' + 2y = 0\).

<em>Check that both are solutions</em>: For \(y_1 = e^x\): \(y_1'' - 3y_1' + 2y_1 = e^x - 3e^x + 2e^x = 0\). For \(y_2 = e^{2x}\): \(y_2'' - 3y_2' + 2y_2 = 4e^{2x} - 6e^{2x} + 2e^{2x} = 0\). Both are indeed solutions.

<em>Wronskian</em>:

\[
W(e^x, e^{2x}) = \det \begin{pmatrix} e^x & e^{2x} \\ e^x & 2e^{2x} \end{pmatrix} = e^x \cdot 2e^{2x} - e^{2x} \cdot e^x = 2e^{3x} - e^{3x} = e^{3x}.
\]

Since \(W(x) = e^{3x} \neq 0\) for all \(x\), the two solutions are linearly independent. The general solution is therefore \(y = c_1 e^x + c_2 e^{2x}\).

<em>Remark on Abel's theorem</em>: For a second-order ODE \(y'' + p(x)y' + q(x)y = 0\), Abel's theorem guarantees \(W(x) = W(x_0)\exp(-\int_{x_0}^x p(t)\,dt)\). For our equation \(y'' - 3y' + 2y = 0\), \(p = -3\), so \(W(x) = W(0) e^{3x} = 1 \cdot e^{3x}\), confirming our direct calculation. Abel's theorem shows that if \(W\) is nonzero at one point, it is nonzero everywhere on the interval — independence is all-or-nothing.
</div>

## 3.2 The Damped Oscillator: Three Cases

A paradigmatic second-order ODE arising in mechanics, electronics, and economic cycle theory is the **damped oscillator**:

\[
y'' + 2\gamma y' + \omega_0^2 y = 0,
\]
where \(\gamma \geq 0\) is the damping coefficient and \(\omega_0 > 0\) is the natural frequency. The characteristic equation is \(r^2 + 2\gamma r + \omega_0^2 = 0\), giving roots

\[
r = -\gamma \pm \sqrt{\gamma^2 - \omega_0^2}.
\]

The behaviour splits into three qualitatively different cases:

<div class="example">
<strong>Example — Three damping cases</strong>: Take \(\omega_0 = 2\) and consider varying \(\gamma\).

<em>Case 1: Overdamped</em> (\(\gamma > \omega_0\), take \(\gamma = 3\)). The roots are \(r = -3 \pm \sqrt{9-4} = -3 \pm \sqrt{5}\), both real and negative: \(r_1 = -3 + \sqrt{5} \approx -0.76\) and \(r_2 = -3 - \sqrt{5} \approx -5.24\). General solution:

\[
y(t) = c_1 e^{-0.76t} + c_2 e^{-5.24t}.
\]
The solution decays to zero without oscillating — it is exponential decay with two time scales. The system returns to equilibrium sluggishly.

<em>Case 2: Critically damped</em> (\(\gamma = \omega_0 = 2\)). Repeated root \(r = -2\). General solution:

\[
y(t) = (c_1 + c_2 t)e^{-2t}.
\]
This decays to zero faster than the overdamped case (for the same \(\omega_0\)) and without oscillation. Critical damping is the threshold: it gives the fastest non-oscillatory return to equilibrium, and is the design target for shock absorbers and galvanometers.

<em>Case 3: Underdamped</em> (\(\gamma < \omega_0\), take \(\gamma = 1\)). The roots are complex: \(r = -1 \pm i\sqrt{4-1} = -1 \pm i\sqrt{3}\). General solution:

\[
y(t) = e^{-t}\!\left(A\cos\!\sqrt{3}\,t + B\sin\!\sqrt{3}\,t\right).
\]
The solution oscillates at frequency \(\omega_d = \sqrt{\omega_0^2 - \gamma^2} = \sqrt{3} \approx 1.73\) (the <strong>damped natural frequency</strong>), with exponentially decaying amplitude \(e^{-t}\).
</div>

<em>Economic interpretation (Cobweb model)</em>: In the cobweb model of agricultural markets, suppliers make production decisions based on last period's price. The second-order ODE analogy captures the oscillatory price dynamics: overdamped markets have sluggish convergence (e.g., housing markets with slow supply response); underdamped markets exhibit price cycles (e.g., hog cycles in agricultural economics); critically damped markets would represent the ideal — fastest convergence without overshoot. The damping parameter \(\gamma\) is related to the relative slopes of supply and demand.

## 3.3 Resonance and Investment Cycles

<div class="example">
<strong>Example — Resonance: forcing at the natural frequency</strong>: Consider the undamped harmonic oscillator driven at its own natural frequency \(\omega\):

\[
y'' + \omega^2 y = F_0 \cos(\omega t).
\]
Since \(\cos(\omega t)\) solves the homogeneous equation, the standard guess \(y_p = A\cos(\omega t)\) fails. The method of undetermined coefficients with the multiplicity factor \(s = 1\) gives:

\[
y_p = \frac{F_0}{2\omega} t\sin(\omega t).
\]
The general solution is \(y(t) = c_1\cos(\omega t) + c_2\sin(\omega t) + \frac{F_0}{2\omega}t\sin(\omega t)\). The amplitude grows <em>linearly</em> in time — there is no saturation. Physically, energy is pumped into the system at exactly the rate it can absorb, leading to unbounded oscillations.
</div>

<div class="remark">
<strong>Remark (Economic resonance)</strong>: In economic cycle theory, resonance corresponds to a scenario where an exogenous forcing cycle (e.g., a periodic investment shock from a sector with a fixed cycle length) matches the natural oscillation period of the economy's capital-adjustment dynamics. The Samuelson multiplier-accelerator model of business cycles can exhibit resonance when the government spending cycle matches the natural period of the system, leading to amplifying boom-bust cycles. In practice, small amounts of damping (friction in adjustment) prevent true divergence but can still produce persistent, large-amplitude cycles.
</div>

## 3.5 Constant-Coefficient Homogeneous Equations

When the coefficients \(a_i\) are constants, we can solve the homogeneous equation completely by substituting the trial solution \(y = e^{rx}\).

<div class="theorem">
<strong>Theorem (Characteristic Equation)</strong>: For the constant-coefficient homogeneous ODE

\[
a_n y^{(n)} + \cdots + a_1 y' + a_0 y = 0,
\]
substituting \(y = e^{rx}\) gives the <em>characteristic (auxiliary) equation</em>

\[
a_n r^n + a_{n-1} r^{n-1} + \cdots + a_1 r + a_0 = 0.
\]
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

## 3.6 Method of Undetermined Coefficients

When the inhomogeneous term \(g(x)\) is a polynomial, exponential, or sinusoidal function (or a product of these), we can find a particular solution by guessing its form and determining the coefficients.

The guessing rules are:
- If \(g(x) = P_m(x)e^{ax}\) (polynomial of degree \(m\) times exponential), guess \(y_p = x^s Q_m(x) e^{ax}\) where \(s\) is the multiplicity of \(a\) as a root of the characteristic equation (0 if not a root).
- If \(g(x) = e^{ax}(P_m(x)\cos bx + R_k(x)\sin bx)\), guess \(y_p = x^s e^{ax}(Q_n(x)\cos bx + S_n(x)\sin bx)\) where \(n = \max(m,k)\) and \(s\) is the multiplicity of \(a+bi\) as a characteristic root.

The factor of \(x^s\) corrects for resonance — when the driving frequency matches a natural frequency of the homogeneous equation.

<div class="example">
<strong>Example — Resonance: \(y'' + 4y = \cos(2x)\)</strong>: The complementary solution is \(y_h = A\cos(2x) + B\sin(2x)\), with characteristic roots \(r = \pm 2i\). The right-hand side \(\cos(2x)\) corresponds to frequency \(\omega = 2\), which <em>equals</em> the natural frequency — this is the resonance case. The standard guess \(y_p = C\cos(2x) + D\sin(2x)\) would duplicate the homogeneous solution and yield \(0 = 1\) upon substitution, so we must multiply by \(x\):

\[
y_p = x\!\left(C\cos(2x) + D\sin(2x)\right).
\]

Computing derivatives:

\[
y_p' = C\cos(2x) + D\sin(2x) + x(-2C\sin(2x) + 2D\cos(2x)),
\]

\[
y_p'' = -2C\sin(2x) + 2D\cos(2x) - 2C\sin(2x) + 2D\cos(2x) + x(-4C\cos(2x) - 4D\sin(2x)).
\]

\[
y_p'' = -4C\sin(2x) + 4D\cos(2x) - 4x\!\left(C\cos(2x) + D\sin(2x)\right).
\]

Substituting into \(y_p'' + 4y_p\):

\[
y_p'' + 4y_p = -4C\sin(2x) + 4D\cos(2x) - 4x(\cdots) + 4x(\cdots) = -4C\sin(2x) + 4D\cos(2x).
\]

Setting this equal to \(\cos(2x)\): \(-4C = 0\) and \(4D = 1\), giving \(C = 0\), \(D = 1/4\). Therefore:

\[
y_p = \frac{x}{4}\sin(2x).
\]

The general solution is \(y(x) = A\cos(2x) + B\sin(2x) + \frac{x}{4}\sin(2x)\). The particular solution \(\frac{x}{4}\sin(2x)\) has amplitude growing linearly with \(x\) — there is no saturation. This is the signature of resonance: energy is pumped into the system at exactly the rate it can absorb, leading to unbounded oscillations.
</div>

<div class="remark">
<strong>Remark (Economic interpretation of resonance)</strong>: Resonance in economics corresponds to a fiscal or monetary policy applied at exactly the natural frequency of the business cycle. The Samuelson multiplier-accelerator model of business cycles predicts a natural oscillation period determined by the product of the multiplier and accelerator coefficients. If a government applies countercyclical fiscal stimulus — tax cuts or spending increases — at the wrong timing so that the stimulus cycle matches the natural cycle, the response can grow without bound rather than damping the oscillation. This is sometimes called the "Keynesian beauty contest" problem: poorly timed stimulus amplifies rather than smooths the cycle. In practice, small amounts of damping (adjustment frictions) prevent true divergence, but resonance remains a real risk when the stimulus frequency matches the economy's natural period, and is one argument for automatic stabilisers (which respond continuously) over discretionary policy (which may be mistimed).
</div>

## 3.7 Variation of Parameters

The method of undetermined coefficients works only for special forms of \(g(x)\). A more general technique, **variation of parameters**, works whenever the homogeneous solutions are known and \(g(x)\) is continuous.

<div class="theorem">
<strong>Theorem (Variation of Parameters)</strong>: Given the second-order ODE \(y'' + p(x)y' + q(x)y = g(x)\), with homogeneous solutions \(y_1, y_2\) (Wronskian \(W \neq 0\)), a particular solution is

\[
y_p = -y_1(x)\int \frac{y_2(x)g(x)}{W(x)}\,dx + y_2(x)\int \frac{y_1(x)g(x)}{W(x)}\,dx.
\]
<br><em>Proof sketch.</em> Assume \(y_p = u_1(x)y_1 + u_2(x)y_2\). Impose the constraint \(u_1' y_1 + u_2' y_2 = 0\) (to simplify \(y_p''\)). Substituting into the ODE yields \(u_1' y_1' + u_2' y_2' = g\). Solving this \(2\times 2\) system by Cramer's rule gives \(u_1' = -y_2 g/W\) and \(u_2' = y_1 g/W\). Integrating gives \(y_p\).
</div>

## 3.8 Reduction of Order

If one solution \(y_1\) of a homogeneous second-order ODE is known, a second linearly independent solution can always be found. The substitution \(y = y_1(x) v(x)\) reduces the ODE to a first-order equation for \(v'\). Setting \(w = v'\), we obtain a first-order linear ODE for \(w\), which can be solved by the integrating factor method. The second solution is \(y_2 = y_1 \int v'(x)\,dx\).

---

# Chapter 4: Systems of Linear ODEs

Many economic models involve not one but several interacting quantities — prices in multiple markets, stocks of multiple goods, or components of a macroeconomic model — that evolve simultaneously. The natural framework is a **system of first-order linear ODEs**.

<div class="definition">
<strong>Definition (Linear System)</strong>: A <em>first-order linear system</em> has the form

\[
\mathbf{X}' = A(t)\mathbf{X} + \mathbf{F}(t),
\]
where \(\mathbf{X}(t) \in \mathbb{R}^n\) is the unknown vector, \(A(t)\) is an \(n \times n\) matrix of coefficients, and \(\mathbf{F}(t)\) is a forcing vector. When \(\mathbf{F} = \mathbf{0}\) the system is <em>homogeneous</em>.
</div>

Any \(n\)-th order linear ODE can be converted to a first-order system of dimension \(n\) by introducing new variables for the successive derivatives. This means the theory of systems is fully general.

## 4.1 Converting a Higher-Order ODE to a System

Any \(n\)-th order linear ODE can be written as a first-order system by introducing state variables for the successive derivatives. This reduction is important both theoretically (it unifies the theory) and computationally (numerical solvers work with first-order systems).

<div class="example">
<strong>Example — Converting a second-order ODE to a system</strong>: Consider \(y'' + py' + qy = g(t)\). Introduce \(X_1 = y\) and \(X_2 = y'\). Then \(X_1' = X_2\) and \(X_2' = y'' = g(t) - py' - qy = g(t) - pX_2 - qX_1\). The first-order system is:

\[
\begin{pmatrix} X_1' \\ X_2' \end{pmatrix} = \begin{pmatrix} 0 & 1 \\ -q & -p \end{pmatrix} \begin{pmatrix} X_1 \\ X_2 \end{pmatrix} + \begin{pmatrix} 0 \\ g(t) \end{pmatrix}.
\]
The companion matrix \(A = \begin{pmatrix} 0 & 1 \\ -q & -p \end{pmatrix}\) has characteristic polynomial \(\lambda^2 + p\lambda + q = 0\) — exactly the characteristic equation of the original second-order ODE. The eigenvalues of \(A\) are identical to the roots of the characteristic equation, confirming the consistency of the two approaches.
</div>

This reduction clarifies why the three cases of the damped oscillator (Section 3.2) correspond to node, spiral, and centre/node in the phase portrait of the companion system: overdamped gives a stable node; critically damped gives a degenerate node; underdamped gives a stable spiral.

## 4.2 The Lotka-Volterra Trade Model

The eigenvalue method applies beyond ecological systems to economic models of international trade and comparative advantage.

<div class="example">
<strong>Example — Two-country export dynamics</strong>: Let \(X_1(t)\) and \(X_2(t)\) denote export volumes of countries 1 and 2, respectively. Suppose exports grow or decline based on comparative advantage and trade barriers:

\[
\begin{pmatrix} X_1' \\ X_2' \end{pmatrix} = \begin{pmatrix} -0.5 & 0.3 \\ 0.4 & -0.6 \end{pmatrix} \begin{pmatrix} X_1 \\ X_2 \end{pmatrix}.
\]
The matrix has trace \(\tau = -1.1\) and determinant \(\Delta = (-0.5)(-0.6) - (0.3)(0.4) = 0.30 - 0.12 = 0.18 > 0\). Since \(\tau < 0\) and \(\Delta > 0\), both eigenvalues have negative real part, and the equilibrium \((X_1, X_2) = (0,0)\) is a stable node or stable spiral.

Eigenvalues: \(\lambda = (-1.1 \pm \sqrt{1.21 - 0.72})/2 = (-1.1 \pm \sqrt{0.49})/2 = (-1.1 \pm 0.7)/2\). So \(\lambda_1 = -0.2\) and \(\lambda_2 = -0.9\).

Both eigenvalues are real and negative — a stable node. Both countries' exports decay to zero in this model, reflecting a contractionary trade scenario. The eigenvector for \(\lambda_1 = -0.2\) (the slow mode) has the interpretation that a particular combination of \(X_1\) and \(X_2\) decays slowly, while the fast mode (eigenvector of \(\lambda_2 = -0.9\)) decays quickly. In a trade context, the slow mode represents a long-run structural imbalance that persists after the short-run adjustment has completed.
</div>

## 4.3 Homogeneous Systems: The Eigenvalue Method

For the autonomous homogeneous system \(\mathbf{X}' = A\mathbf{X}\) with constant matrix \(A\), we seek solutions of the form \(\mathbf{X}(t) = e^{\lambda t}\mathbf{v}\). Substituting:

\[
\lambda e^{\lambda t}\mathbf{v} = A e^{\lambda t}\mathbf{v} \implies A\mathbf{v} = \lambda\mathbf{v}.
\]
So \(\lambda\) must be an eigenvalue of \(A\) and \(\mathbf{v}\) a corresponding eigenvector.

<div class="theorem">
<strong>Theorem (General Solution via Eigenvalues)</strong>: If \(A\) is an \(n\times n\) matrix with \(n\) linearly independent eigenvectors \(\mathbf{v}_1, \ldots, \mathbf{v}_n\) corresponding to eigenvalues \(\lambda_1, \ldots, \lambda_n\) (not necessarily distinct), the general solution of \(\mathbf{X}' = A\mathbf{X}\) is

\[
\mathbf{X}(t) = c_1 e^{\lambda_1 t}\mathbf{v}_1 + c_2 e^{\lambda_2 t}\mathbf{v}_2 + \cdots + c_n e^{\lambda_n t}\mathbf{v}_n.
\]
When \(A\) has a repeated eigenvalue \(\lambda\) with deficient eigenspace, generalised eigenvectors (Jordan chains) must be used; a repeated eigenvalue \(\lambda\) with multiplicity 2 and only one eigenvector \(\mathbf{v}\) contributes solutions \(e^{\lambda t}\mathbf{v}\) and \(e^{\lambda t}(t\mathbf{v} + \mathbf{w})\) where \((A - \lambda I)\mathbf{w} = \mathbf{v}\).
</div>

For \(2 \times 2\) systems, the **phase portrait** gives qualitative insight: if both eigenvalues are real negative, trajectories converge to the origin (stable node); if real positive, they diverge (unstable node); if of opposite sign, the origin is a saddle (unstable); if complex with negative real part, a stable spiral; if purely imaginary, a centre (neutrally stable).

<div class="example">
<strong>Example — Solving a 2×2 system via eigenvalues with initial condition</strong>: Solve the system

\[
\mathbf{X}' = \begin{pmatrix} 0 & 1 \\ -2 & -3 \end{pmatrix}\mathbf{X}, \qquad \mathbf{X}(0) = \begin{pmatrix} 1 \\ 0 \end{pmatrix}.
\]

<em>Characteristic polynomial</em>: \(\det(A - \lambda I) = \det\begin{pmatrix} -\lambda & 1 \\ -2 & -3-\lambda \end{pmatrix} = \lambda(\lambda+3) + 2 = \lambda^2 + 3\lambda + 2 = (\lambda+1)(\lambda+2) = 0\).

Eigenvalues: \(\lambda_1 = -1\), \(\lambda_2 = -2\). Both negative — the origin is a stable node.

<em>Eigenvectors</em>: For \(\lambda_1 = -1\): \((A + I)\mathbf{v} = \begin{pmatrix}1&1\\-2&-2\end{pmatrix}\mathbf{v} = \mathbf{0}\), giving \(\mathbf{v}_1 = (1, -1)^T\).

For \(\lambda_2 = -2\): \((A + 2I)\mathbf{v} = \begin{pmatrix}2&1\\-2&-1\end{pmatrix}\mathbf{v} = \mathbf{0}\), giving \(\mathbf{v}_2 = (1, -2)^T\).

<em>General solution</em>:

\[
\mathbf{X}(t) = c_1 e^{-t}\begin{pmatrix}1\\-1\end{pmatrix} + c_2 e^{-2t}\begin{pmatrix}1\\-2\end{pmatrix}.
\]

<em>Initial condition</em>: At \(t = 0\): \(c_1 + c_2 = 1\) and \(-c_1 - 2c_2 = 0\). From the second equation \(c_1 = -2c_2\). Substituting: \(-2c_2 + c_2 = -c_2 = 1\), so \(c_2 = -1\) and \(c_1 = 2\). The solution is:

\[
x(t) = 2e^{-t} - e^{-2t}, \qquad y(t) = -2e^{-t} + 2e^{-2t}.
\]

Both components decay to zero. The fast mode (\(e^{-2t}\)) relaxes first, leaving the slow mode (\(e^{-t}\)) to dominate at large times. In an economic context where \(x\) and \(y\) are deviations of output and investment from equilibrium, the slow mode represents the long-run adjustment path toward equilibrium, while the fast mode represents rapid initial transients.
</div>

<div class="example">
<strong>Example — Repeated eigenvalue and generalised eigenvector</strong>: Solve

\[
\mathbf{X}' = \begin{pmatrix} 2 & 1 \\ 0 & 2 \end{pmatrix}\mathbf{X}.
\]

The characteristic polynomial is \((\lambda - 2)^2 = 0\), giving the repeated eigenvalue \(\lambda = 2\) with multiplicity 2.

<em>Eigenvector</em>: \((A - 2I)\mathbf{v} = \begin{pmatrix}0&1\\0&0\end{pmatrix}\mathbf{v} = \mathbf{0}\) gives \(\mathbf{v}_1 = (1, 0)^T\).

<em>Generalised eigenvector</em>: Solve \((A - 2I)\mathbf{w} = \mathbf{v}_1\):

\[
\begin{pmatrix}0&1\\0&0\end{pmatrix}\mathbf{w} = \begin{pmatrix}1\\0\end{pmatrix} \implies w_2 = 1.
\]

Taking \(w_1 = 0\): \(\mathbf{w} = (0, 1)^T\).

<em>General solution</em>: The two linearly independent solutions are \(e^{2t}\mathbf{v}_1\) and \(e^{2t}(t\mathbf{v}_1 + \mathbf{w})\):

\[
\mathbf{X}(t) = c_1 e^{2t}\begin{pmatrix}1\\0\end{pmatrix} + c_2 e^{2t}\!\left(t\begin{pmatrix}1\\0\end{pmatrix} + \begin{pmatrix}0\\1\end{pmatrix}\right) = e^{2t}\begin{pmatrix}c_1 + c_2 t \\ c_2\end{pmatrix}.
\]

The \(c_2 t\,e^{2t}\) term grows super-exponentially relative to pure exponential growth — the repeated eigenvalue introduces polynomial growth multiplying the exponential. In economics, such dynamics can model a linearly escalating instability (e.g., a hyperinflation spiral where the rate of inflation itself accelerates linearly before the eventual stabilisation).
</div>

## 4.4 Inhomogeneous Systems: Variation of Parameters

For the inhomogeneous system \(\mathbf{X}' = A\mathbf{X} + \mathbf{F}(t)\), the **fundamental matrix** \(\Phi(t)\) is the matrix whose columns are \(n\) linearly independent solutions of the homogeneous system. A particular solution is given by:

\[
\mathbf{X}_p(t) = \Phi(t)\int \Phi^{-1}(t)\mathbf{F}(t)\,dt.
\]

The general solution is \(\mathbf{X} = \Phi(t)\mathbf{c} + \mathbf{X}_p(t)\), where \(\mathbf{c}\) is a constant vector determined by initial conditions.

<div class="example">
<strong>Example (Coupled Price Dynamics)</strong>: Suppose two goods have prices \(P_1(t)\) and \(P_2(t)\) that interact — excess demand in market 1 is affected by both prices. A linearised model might give

\[
\begin{pmatrix} P_1' \\ P_2' \end{pmatrix} = \begin{pmatrix} -2 & 1 \\ 1 & -2 \end{pmatrix} \begin{pmatrix} P_1 \\ P_2 \end{pmatrix} + \begin{pmatrix} a_1 \\ a_2 \end{pmatrix}.
\]
The eigenvalues of the coefficient matrix are \(\lambda_1 = -1\) and \(\lambda_2 = -3\). Since both are negative, the system is stable: both prices converge to their joint equilibrium. The eigenvector for \(\lambda_1 = -1\) is \((1,1)^T\) (both prices move together) and for \(\lambda_2 = -3\) is \((1,-1)^T\) (prices move in opposite directions). Any initial disequilibrium is a superposition of these two modes, both decaying exponentially.
</div>

## 4.5 The Samuelson Multiplier-Accelerator Model

The **Samuelson (1939) multiplier-accelerator model** of business cycles generates oscillatory output through the interaction of consumption multiplier effects and investment accelerator effects. In continuous time, if \(Y(t)\) is aggregate income, \(c \in (0,1)\) the marginal propensity to consume, and \(a > 0\) the accelerator coefficient:

\[
Y'' - (c - 1 + a)Y' + (1 - c)Y = G_0,
\]

where \(G_0\) is autonomous government expenditure. This is a second-order constant-coefficient ODE with forcing. The characteristic roots are:

\[
r = \frac{(c - 1 + a) \pm \sqrt{(c-1+a)^2 - 4(1-c)}}{2}.
\]

<div class="example">
<strong>Example — Business cycle classification</strong>: Take \(c = 0.8\) and \(a = 0.5\). Then the characteristic equation coefficients give: \(c - 1 + a = 0.3\) and \(1 - c = 0.2\). Discriminant: \((0.3)^2 - 4(0.2) = 0.09 - 0.80 = -0.71 < 0\). The roots are complex: \(r = 0.15 \pm i\sqrt{0.71}/2 \approx 0.15 \pm 0.421i\).

Since the real part \(0.15 > 0\), the homogeneous solution grows: \(Y_h(t) = e^{0.15t}(A\cos(0.421t) + B\sin(0.421t))\). The output oscillates with exponentially growing amplitude — an <strong>unstable business cycle</strong> in this parameterisation. The period of oscillation is \(2\pi/0.421 \approx 14.9\) years. Samuelson showed that by tuning \(c\) and \(a\), one can obtain damped cycles (stable spiral), explosive cycles (unstable spiral), or exact periodicity (\(\text{Re}(r) = 0\)). The model thus provides a theoretical basis for the observation that capitalist economies exhibit persistent but irregular business cycles.
</div>

<div class="remark">
<strong>Remark (Economic interpretation of eigenvalues)</strong>: The real part of the characteristic root determines whether fluctuations grow (\(\text{Re}(r) > 0\)) or decay (\(\text{Re}(r) < 0\)). The imaginary part determines the frequency of oscillation: \(\text{Im}(r) = \beta\) gives period \(2\pi/\beta\). A root with \(\text{Re}(r) = 0\) and \(\text{Im}(r) \neq 0\) gives undamped oscillation — the "knife-edge" case. In economic modelling, this decomposition provides immediate qualitative insight: negative real part means the economy self-stabilises (automatic stabilisers dominate), while positive real part means exogenous stabilisation (fiscal or monetary policy) is required.
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

\[
\frac{dx}{ds} = a, \quad \frac{dt}{ds} = b, \quad \frac{du}{ds} = c.
\]
Along each characteristic, the PDE reduces to an ODE in the parameter \(s\). The solution surface is swept out by the family of characteristics emanating from the initial data curve.
</div>

<div class="example">
<strong>Example (Transport Equation)</strong>: Consider \(u_t + c\,u_x = 0\) with initial condition \(u(x,0) = f(x)\). The characteristics satisfy \(dx/ds = c\), \(dt/ds = 1\), \(du/ds = 0\). So along each characteristic, \(t = s\), \(x = cs + x_0\) (i.e., \(x - ct = x_0 = \text{const}\)), and \(u = \text{const}\). The solution is \(u(x,t) = f(x - ct)\): the initial profile \(f\) simply translates to the right at speed \(c\). This is the <em>wave equation</em> in one dimension.
</div>

<div class="example">
<strong>Example — Characteristics with a source term</strong>: Consider the PDE \(u_t + 2u_x = u\) with initial condition \(u(x,0) = e^{-x^2}\). The characteristic equations are \(dx/ds = 2\), \(dt/ds = 1\), \(du/ds = u\). Integrating: \(t = s\), \(x = 2s + x_0\), and \(u = u_0 e^s\) where \(u_0 = u(x_0, 0)\). Along the characteristic through \((x_0, 0)\): \(x_0 = x - 2t\), so \(u_0 = e^{-(x-2t)^2}\). Since \(u = u_0 e^t\):

\[
u(x,t) = e^t \cdot e^{-(x-2t)^2}.
\]
The initial Gaussian profile translates to the right at speed 2 (the advection part) while its amplitude grows as \(e^t\) (the source term amplifies the signal). This example is economically relevant as a model of information propagation in a market where the information itself grows in value over time.
</div>

## 5.2 Classification of Second-Order Linear PDEs

The most important second-order linear PDE in two variables has the form:

\[
A u_{xx} + B u_{xt} + C u_{tt} + D u_x + E u_t + Fu = G.
\]

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

\[
\frac{T'}{T\kappa} = \frac{X''}{X} = -\lambda \quad (\text{separation constant}).
\]
The spatial equation \(X'' + \lambda X = 0\) with \(X(0) = X(L) = 0\) has solutions only for \(\lambda_n = (n\pi/L)^2\), giving eigenfunctions \(X_n(x) = \sin(n\pi x/L)\). The temporal part gives \(T_n(t) = e^{-\kappa\lambda_n t}\). The general solution is the **Fourier series**:

\[
u(x,t) = \sum_{n=1}^\infty b_n \sin\!\left(\frac{n\pi x}{L}\right) e^{-\kappa (n\pi/L)^2 t},
\]
where the coefficients \(b_n = \frac{2}{L}\int_0^L f(x)\sin(n\pi x/L)\,dx\) are determined by the initial condition \(u(x,0) = f(x)\). The exponential decay factor ensures the solution smooths out and decays to zero as \(t \to \infty\).

<div class="example">
<strong>Example — Computing the first Fourier sine coefficient for \(f(x) = x\) on \([0,\pi]\)</strong>: With \(L = \pi\), the Fourier sine coefficients of the initial condition \(f(x) = x\) are:

\[
b_n = \frac{2}{\pi}\int_0^\pi x\sin(nx)\,dx.
\]

Integrating by parts with \(u = x\), \(dv = \sin(nx)\,dx\):

\[
\int_0^\pi x\sin(nx)\,dx = \left[-\frac{x\cos(nx)}{n}\right]_0^\pi + \frac{1}{n}\int_0^\pi \cos(nx)\,dx = -\frac{\pi\cos(n\pi)}{n} + \frac{1}{n}\left[\frac{\sin(nx)}{n}\right]_0^\pi.
\]

Since \(\sin(n\pi) = 0\) for all integers \(n\):

\[
\int_0^\pi x\sin(nx)\,dx = -\frac{\pi\cos(n\pi)}{n} = \frac{\pi(-1)^{n+1}}{n}.
\]

Therefore:

\[
b_n = \frac{2}{\pi}\cdot\frac{\pi(-1)^{n+1}}{n} = \frac{2(-1)^{n+1}}{n}.
\]

<em>First coefficient</em>: \(b_1 = 2(-1)^2/1 = 2\). <em>Second coefficient</em>: \(b_2 = 2(-1)^3/2 = -1\). <em>Third</em>: \(b_3 = 2/3\). The full solution to the heat equation with \(f(x) = x\) is:

\[
u(x,t) = \sum_{n=1}^\infty \frac{2(-1)^{n+1}}{n}\sin(nx)\,e^{-n^2 t}.
\]

At \(t = 0\), this recovers the Fourier sine series of \(x\) on \([0, \pi]\). As \(t\) increases, the higher modes (large \(n\)) decay much faster than the fundamental (\(n=1\)) because the decay rate is \(e^{-n^2 t}\), so the solution rapidly becomes dominated by the first term \(2e^{-t}\sin(x)\). The "sawtooth" initial profile is smoothed into a single half-arch.
</div>

<div class="example">
<strong>Example — Heat equation on \([0,\pi]\) with two-mode initial condition</strong>: Consider the problem

\[
u_t = u_{xx}, \quad 0 < x < \pi, \quad t > 0,
\]

\[
u(0,t) = u(\pi,t) = 0, \quad u(x,0) = \sin(x) + 0.5\sin(2x).
\]

With \(L = \pi\) and \(\kappa = 1\), the eigenvalues are \(\lambda_n = n^2\) and the Fourier series formula gives:

\[
u(x,t) = \sum_{n=1}^\infty b_n \sin(nx)\,e^{-n^2 t}.
\]

The initial condition \(u(x,0) = \sin(x) + 0.5\sin(2x)\) is already a finite sum of eigenfunctions. Matching coefficients: \(b_1 = 1\), \(b_2 = 0.5\), \(b_n = 0\) for \(n \geq 3\). The exact solution is therefore:

\[
u(x,t) = e^{-t}\sin(x) + 0.5\,e^{-4t}\sin(2x).
\]

This is an <em>exact</em> closed-form solution — no approximation is made.

<em>Interpretation</em>: The first mode \(e^{-t}\sin(x)\) decays with time constant \(\tau_1 = 1\). The second mode \(0.5\,e^{-4t}\sin(2x)\) decays four times faster, with time constant \(\tau_2 = 1/4\). By \(t = 1\), the first mode has lost a factor \(e^{-1} \approx 0.37\) of its amplitude, while the second has lost a factor \(e^{-4} \approx 0.018\) — it is nearly gone. At large times, the solution is well approximated by just the first mode: \(u(x,t) \approx e^{-t}\sin(x)\).
</div>

<div class="remark">
<strong>Remark (Higher modes decay faster)</strong>: The \(n\)-th mode decays as \(e^{-n^2 t}\). This means spatially oscillatory components (high \(n\)) decay much faster than smooth components (low \(n\)). Physically: sharp features in the initial temperature distribution are smoothed out rapidly, while the broad overall temperature profile persists longer. This is the mathematical expression of the intuition that "heat spreads out" — the diffusion operator is a low-pass filter in space. In finance, the same principle applies to the Black-Scholes equation: rapidly oscillating payoff features (like barrier discontinuities) are smoothed quickly, while broad features persist to near-expiry.
</div>

## 5.4 Steady-State Solutions of the Heat Equation

A **steady-state solution** of the heat equation satisfies \(u_t = 0\), which reduces the PDE to an ODE:

\[
u_{xx} = 0.
\]

<div class="theorem">
<strong>Theorem (Steady-State of the 1D Heat Equation)</strong>: The general steady-state solution of \(u_{xx} = 0\) is the linear function

\[
u_{ss}(x) = ax + b,
\]
where the constants \(a\) and \(b\) are determined by the boundary conditions. For Dirichlet boundary conditions \(u(0) = T_1\) and \(u(L) = T_2\), the unique steady state is:

\[
u_{ss}(x) = T_1 + \frac{T_2 - T_1}{L}\,x.
\]
This is the linear interpolation between the two boundary temperatures.
</div>

This result is the one-dimensional version of Laplace's equation. The steady state represents the long-time behaviour of the heat equation: regardless of the initial condition, the solution converges to \(u_{ss}(x)\) as \(t \to \infty\) (assuming fixed, nonzero boundary conditions).

<div class="example">
<strong>Example — Convergence to steady state</strong>: Suppose \(u_t = u_{xx}\) on \([0,1]\) with \(u(0,t) = 0\), \(u(1,t) = 1\), and initial condition \(u(x,0) = 0\) (rod initially at zero temperature, one end suddenly raised to 1). The steady state is \(u_{ss}(x) = x\). Defining \(w = u - u_{ss}\) gives a heat equation for \(w\) with homogeneous boundary conditions \(w(0,t) = w(1,t) = 0\) and initial condition \(w(x,0) = -x\). The Fourier series for \(w\) has coefficients \(b_n = \frac{2}{1}\int_0^1 (-x)\sin(n\pi x)\,dx = 2(-1)^n/(n\pi)\). Therefore:

\[
u(x,t) = x + \frac{2}{\pi}\sum_{n=1}^\infty \frac{(-1)^n}{n}\sin(n\pi x)\,e^{-n^2\pi^2 t}.
\]
All transient modes decay exponentially; the solution converges to \(x\) as \(t\to\infty\).
</div>

---

# Chapter 6: The Fourier Transform

Separation of variables works beautifully on a finite interval, but many problems — including the Black-Scholes equation — are posed on the entire real line. The right tool for these problems is the **Fourier Transform**, which converts the spatial PDE into an ODE in time, exactly as the Laplace transform converts ODEs into algebraic equations.

<div class="definition">
<strong>Definition (Fourier Transform)</strong>: For a function \(f(x)\) defined on \(\mathbb{R}\), the <em>Fourier Transform</em> is

\[
\hat{f}(\omega) = \int_{-\infty}^{\infty} f(x)\,e^{-i\omega x}\,dx,
\]
provided the integral converges. The <em>inverse Fourier Transform</em> recovers \(f\) from \(\hat{f}\):

\[
f(x) = \frac{1}{2\pi}\int_{-\infty}^{\infty} \hat{f}(\omega)\,e^{i\omega x}\,d\omega.
\]
</div>

The Fourier Transform has several key properties that make it ideal for solving constant-coefficient linear PDEs:

- **Linearity**: \(\widehat{af + bg} = a\hat{f} + b\hat{g}\).
- **Derivative rule**: \(\widehat{f^{(n)}}(\omega) = (i\omega)^n \hat{f}(\omega)\). In particular, differentiation in \(x\) corresponds to multiplication by \(i\omega\) in frequency space.
- **Convolution theorem**: if \(h(x) = \int f(x-y)g(y)\,dy\), then \(\hat{h}(\omega) = \hat{f}(\omega)\hat{g}(\omega)\). Convolution in \(x\)-space is multiplication in \(\omega\)-space.

<div class="example">
<strong>Example — Fourier transform of the Gaussian</strong>: Compute \(\mathcal{F}\{e^{-x^2}\}(\omega)\).

By definition:

\[
\hat{f}(\omega) = \int_{-\infty}^{\infty} e^{-x^2} e^{-i\omega x}\,dx = \int_{-\infty}^{\infty} e^{-(x^2 + i\omega x)}\,dx.
\]

Complete the square in the exponent: \(x^2 + i\omega x = \left(x + \frac{i\omega}{2}\right)^2 + \frac{\omega^2}{4} - \frac{(i\omega)^2}{4}\). Wait — more carefully: \(x^2 + i\omega x = \left(x + \frac{i\omega}{2}\right)^2 - \left(\frac{i\omega}{2}\right)^2 = \left(x + \frac{i\omega}{2}\right)^2 + \frac{\omega^2}{4}\). Therefore:

\[
\hat{f}(\omega) = e^{-\omega^2/4}\int_{-\infty}^{\infty} \exp\!\left(-\left(x + \frac{i\omega}{2}\right)^2\right)dx.
\]

The integral \(\int_{-\infty}^{\infty} e^{-u^2}\,du = \sqrt{\pi}\) (the Gaussian integral) holds for complex shifts by analyticity (contour deformation). Therefore:

\[
\mathcal{F}\{e^{-x^2}\}(\omega) = \sqrt{\pi}\,e^{-\omega^2/4}.
\]

This result is fundamental: <em>the Fourier transform of a Gaussian is a Gaussian</em>. The Gaussian \(e^{-x^2}\) has "width" of order 1 in \(x\)-space and "width" of order 2 in \(\omega\)-space — wider in frequency space, reflecting the uncertainty principle. This is the mathematical origin of the heat kernel: in the heat equation solution \(\hat{u}(\omega, t) = \hat{f}(\omega)e^{-\kappa\omega^2 t}\), the factor \(e^{-\kappa\omega^2 t}\) is a Gaussian in \(\omega\) whose inverse transform gives the Gaussian heat kernel \(G(x,t) \propto e^{-x^2/(4\kappa t)}\).
</div>

## 6.1 Solving the Heat Equation on the Real Line

Consider the heat equation on the entire real line:

\[
u_t = \kappa u_{xx}, \quad x \in \mathbb{R},\; t > 0, \quad u(x,0) = f(x).
\]

Take the Fourier Transform in \(x\), denoting \(\hat{u}(\omega, t) = \mathcal{F}[u]\):

\[
\frac{\partial \hat{u}}{\partial t} = \kappa(i\omega)^2 \hat{u} = -\kappa\omega^2 \hat{u}.
\]

This is now an ordinary differential equation in \(t\) for each fixed \(\omega\):

\[
\hat{u}(\omega, t) = \hat{f}(\omega)\,e^{-\kappa\omega^2 t}.
\]

To invert, note that \(e^{-\kappa\omega^2 t}\) is itself a Gaussian in \(\omega\): its inverse Fourier Transform is the **heat kernel** (or **Gaussian kernel**):

\[
G(x,t) = \frac{1}{\sqrt{4\pi\kappa t}}\,e^{-x^2/(4\kappa t)}.
\]

By the convolution theorem:

\[
u(x,t) = \int_{-\infty}^{\infty} f(y)\,G(x-y,t)\,dy = \frac{1}{\sqrt{4\pi\kappa t}}\int_{-\infty}^{\infty} f(y)\,\exp\!\left(-\frac{(x-y)^2}{4\kappa t}\right)dy.
\]

<div class="theorem">
<strong>Theorem (Heat Kernel Solution)</strong>: The unique bounded solution of the heat equation \(u_t = \kappa u_{xx}\) on \(\mathbb{R}\) with initial condition \(u(x,0) = f(x)\) is the convolution

\[
u(x,t) = \frac{1}{\sqrt{4\pi\kappa t}}\int_{-\infty}^{\infty} f(y)\,\exp\!\left(-\frac{(x-y)^2}{4\kappa t}\right)dy.
\]
Interpretation: the heat kernel \(G(x-y,t)\) is a Gaussian centred at \(y\) with variance \(2\kappa t\). The solution at time \(t\) is a weighted average of the initial condition, where the weights are Gaussian of width \(\sqrt{2\kappa t}\). As time increases, the Gaussian spreads: initial sharp features are smoothed out, reflecting the diffusive nature of heat conduction.
</div>

This formula is not just elegant — it is precisely the structure that underpins the solution to the Black-Scholes equation. The analogy between heat diffusion and the uncertainty in future asset prices is deep and deliberate.

<div class="example">
<strong>Example — Fourier Transform solution with a Gaussian initial condition</strong>: Suppose \(f(x) = e^{-x^2/(4\sigma^2)}\), a Gaussian of width \(\sigma\). Its Fourier Transform is \(\hat{f}(\omega) = 2\sigma\sqrt{\pi}\,e^{-\sigma^2\omega^2}\). After time \(t\) (with \(\kappa = 1\)):

\[
\hat{u}(\omega,t) = 2\sigma\sqrt{\pi}\,e^{-\sigma^2\omega^2}\cdot e^{-\omega^2 t} = 2\sigma\sqrt{\pi}\,e^{-(\sigma^2+t)\omega^2}.
\]
This is another Gaussian in \(\omega\), corresponding to a spatial Gaussian of width \(\sqrt{\sigma^2 + t}\):

\[
u(x,t) = \frac{\sigma}{\sqrt{\sigma^2+t}}\,e^{-x^2/(4(\sigma^2+t))}.
\]

The initial Gaussian spreads: its width grows as \(\sqrt{\sigma^2 + t}\). For \(t \gg \sigma^2\), the width is \(\approx \sqrt{t}\) — the characteristic diffusive scaling. The height of the Gaussian decreases as \(\sigma/\sqrt{\sigma^2+t}\) to conserve the total "heat" \(\int u\,dx = 2\sigma\sqrt{\pi} = \text{const}\). This example cleanly illustrates that the Fourier Transform diagonalises the diffusion operator: each Fourier mode evolves independently and exponentially.
</div>

## 6.2 The Black-Scholes Equation as a Heat Equation

The **Black-Scholes PDE** for the price \(V(S,t)\) of a European option on a stock following Geometric Brownian Motion is:

\[
\frac{\partial V}{\partial t} + \frac{1}{2}\sigma^2 S^2 \frac{\partial^2 V}{\partial S^2} + rS\frac{\partial V}{\partial S} - rV = 0,
\]
with terminal condition \(V(S,T) = \text{Payoff}(S)\) at expiry \(T\). The variable coefficient \(S^2\) makes this look different from the heat equation, but a change of variables transforms it exactly.

<div class="theorem">
<strong>Theorem (Black-Scholes Reduces to the Heat Equation)</strong>: Define the change of variables

\[
x = \ln S, \qquad \tau = T - t, \qquad V(S,t) = e^{\alpha x + \beta \tau}\,u(x,\tau),
\]
where \(\alpha = -\frac{1}{2}\!\left(\frac{2r}{\sigma^2} - 1\right)\) and \(\beta = -\frac{\sigma^2}{2}\!\left(\alpha + \frac{1}{2}\right)^2\). Then \(u(x,\tau)\) satisfies the standard heat equation:

\[
\frac{\partial u}{\partial \tau} = \frac{\sigma^2}{2}\frac{\partial^2 u}{\partial x^2}, \quad x \in \mathbb{R},\; \tau > 0,
\]
with initial condition \(u(x,0)\) determined by the option payoff. The transformed initial condition for a European call with strike \(K\) is \(u(x,0) = e^{-\alpha x}\max(e^x - K, 0)\).
</div>

<div class="proof">
<strong>Proof (sketch).</strong> The substitution \(S = e^x\) converts the \(S\)-derivatives: \(\partial/\partial S = e^{-x}\partial/\partial x\) and \(S^2\partial^2/\partial S^2 = \partial^2/\partial x^2 - \partial/\partial x\). The Black-Scholes PDE becomes a constant-coefficient parabolic equation in \((x,t)\) with first- and zeroth-order terms. Time reversal \(\tau = T-t\) converts the terminal condition to an initial condition. The exponential factor \(e^{\alpha x + \beta\tau}\) is chosen to kill the first-derivative term (\(\alpha\)) and the zeroth-order term (\(\beta\)), leaving the pure heat equation.
</div>

Once \(u(x,\tau)\) is found via the heat kernel formula, we recover \(V\) by reversing the substitution. Carrying through this inversion for the call payoff yields the celebrated Black-Scholes formula:

\[
C(S,t) = S\,N(d_1) - K e^{-r(T-t)} N(d_2),
\]
where \(N\) is the standard normal CDF and

\[
d_1 = \frac{\ln(S/K) + (r + \sigma^2/2)(T-t)}{\sigma\sqrt{T-t}}, \qquad d_2 = d_1 - \sigma\sqrt{T-t}.
\]

<div class="remark">
<strong>Remark (The heat kernel as a pricing kernel)</strong>: In the Black-Scholes framework, the heat kernel \(G(x-y,\tau)\) plays the role of the <strong>risk-neutral transition density</strong>: the probability density (under the risk-neutral measure) that the log-price \(\ln S_T\) equals \(y\) given that it is currently \(x\). The option price is literally the expected payoff under this density, discounted at the risk-free rate. The Gaussian shape of the kernel reflects the log-normal distribution of stock prices under Geometric Brownian Motion, and the spreading of the kernel with \(\sqrt{\tau}\) reflects increasing uncertainty with longer time to expiry. This is why options with longer maturities command higher prices: the heat kernel is wider, meaning more probability weight in the tails where the payoff is large.
</div>

---

# Chapter 7: The Black-Scholes Equation

The previous chapters have been building toward one of the most celebrated results in financial mathematics: the Black-Scholes model for option pricing. This chapter derives the Black-Scholes PDE from first principles, solves it using the heat equation connection, and interprets the result economically. The mathematical tools developed throughout the course — ODEs, linear algebra, separation of variables, the Fourier transform — all converge here.

## 7.1 Stochastic Models for Asset Prices

A fundamental challenge in finance is modelling the future price of an asset. Prices are not deterministic — they are subject to random fluctuations. The standard model is **Geometric Brownian Motion (GBM)**, which posits that the log-return of an asset over a short time interval is normally distributed and independent of the past.

<div class="definition">
<strong>Definition (Geometric Brownian Motion)</strong>: The stock price \(S(t)\) follows <em>Geometric Brownian Motion</em> if it satisfies the stochastic differential equation

\[
dS = \mu S\,dt + \sigma S\,dW_t,
\]
where \(\mu\) is the <em>drift</em> (expected instantaneous return), \(\sigma > 0\) is the <em>volatility</em> (standard deviation of log-returns per unit time), and \(W_t\) is a standard Wiener process (Brownian motion).
</div>

The Wiener process \(W_t\) has the properties: \(W_0 = 0\); increments \(W_{t+s} - W_t \sim \mathcal{N}(0, s)\) for \(s > 0\); increments over non-overlapping intervals are independent. The \(\sigma S\,dW_t\) term introduces randomness proportional to the current price — consistent with the empirical observation that percentage changes in price, not absolute changes, are approximately normally distributed.

The solution to the GBM SDE is \(S(t) = S(0)\exp\!\left((\mu - \tfrac{1}{2}\sigma^2)t + \sigma W_t\right)\), so \(\ln S(t)\) is normally distributed — hence the name "geometric" Brownian motion.

## 7.2 Itô's Lemma

To price derivatives — contracts whose payoff depends on \(S\) — we need to know how smooth functions of \(S\) evolve over time. In ordinary calculus, if \(V = V(S)\) and \(S\) evolves deterministically, then \(dV = V'(S)\,dS\). For a stochastic process, however, the ordinary chain rule is modified by a second-order correction term, because \((dW_t)^2 = dt\) in the Itô calculus (not zero as in ordinary calculus).

<div class="theorem">
<strong>Theorem (Itô's Lemma)</strong>: Let \(S\) follow \(dS = \mu S\,dt + \sigma S\,dW_t\), and let \(V(S,t)\) be twice continuously differentiable in \(S\) and once in \(t\). Then

\[
dV = \left(\frac{\partial V}{\partial t} + \mu S\frac{\partial V}{\partial S} + \frac{1}{2}\sigma^2 S^2 \frac{\partial^2 V}{\partial S^2}\right)dt + \sigma S\frac{\partial V}{\partial S}\,dW_t.
\]
<br><em>Heuristic derivation.</em> Expand \(dV\) by the multivariable Taylor theorem: \(dV \approx V_t\,dt + V_S\,dS + \tfrac{1}{2}V_{SS}(dS)^2 + \cdots\). Substituting \(dS = \mu S\,dt + \sigma S\,dW_t\) and using the Itô rule \((dW_t)^2 = dt\), \((dt)^2 = 0\), \(dt\,dW_t = 0\):

\[
(dS)^2 = \sigma^2 S^2 (dW_t)^2 = \sigma^2 S^2\,dt.
\]
Collecting \(dt\) and \(dW_t\) terms gives the formula above.
</div>

The crucial extra term \(\frac{1}{2}\sigma^2 S^2 V_{SS}\,dt\) is the **Itô correction**. It vanishes in the deterministic limit \(\sigma \to 0\), recovering ordinary calculus.

## 7.3 Delta-Hedging and the Black-Scholes PDE

Consider a financial institution that has sold an option on a stock and wants to hedge the risk. The **delta-hedging** strategy constructs a portfolio \(\Pi\) consisting of the option \(V\) and a short position of \(\Delta\) shares of stock:

\[
\Pi = V - \Delta\cdot S.
\]

By Itô's Lemma, the change in portfolio value over \(dt\) is:

\[
d\Pi = dV - \Delta\,dS = \left(V_t + \mu S V_S + \tfrac{1}{2}\sigma^2 S^2 V_{SS}\right)dt + \sigma S V_S\,dW_t - \Delta\left(\mu S\,dt + \sigma S\,dW_t\right).
\]

Choosing \(\Delta = \frac{\partial V}{\partial S}\) **eliminates the stochastic term** \(dW_t\):

\[
d\Pi = \left(V_t + \tfrac{1}{2}\sigma^2 S^2 V_{SS}\right)dt.
\]

This portfolio is now **instantaneously risk-free** — its return over \(dt\) is deterministic. In an arbitrage-free market, a risk-free portfolio must earn exactly the risk-free rate \(r\):

\[
d\Pi = r\Pi\,dt = r(V - \Delta S)\,dt = r(V - S V_S)\,dt.
\]

Setting the two expressions for \(d\Pi\) equal and rearranging:

<div class="theorem">
<strong>Theorem (Black-Scholes PDE)</strong>: Under the GBM model, in an arbitrage-free market with risk-free rate \(r\), the price \(V(S,t)\) of any European derivative satisfies the <em>Black-Scholes PDE</em>:

\[
\frac{\partial V}{\partial t} + \frac{1}{2}\sigma^2 S^2 \frac{\partial^2 V}{\partial S^2} + rS\frac{\partial V}{\partial S} - rV = 0.
\]
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

\[
\frac{\partial u}{\partial \tau} = \frac{\sigma^2}{2}\frac{\partial^2 u}{\partial x^2}.
\]

This is exactly the heat equation with diffusivity \(\kappa = \sigma^2/2\)! The initial condition \(u(x, 0)\) is determined by the payoff function.

## 7.5 The Black-Scholes Formula

Applying the heat kernel solution (Chapter 6) to the transformed initial value problem and reversing the change of variables yields the celebrated Black-Scholes formula.

<div class="theorem">
<strong>Theorem (Black-Scholes Formula)</strong>: The price at time \(t\) of a European <em>call</em> option with strike \(K\), expiry \(T\), on a stock with current price \(S\), volatility \(\sigma\), with risk-free rate \(r\), is

\[
C(S,t) = S\,N(d_1) - K e^{-r(T-t)} N(d_2),
\]
where \(N(\cdot)\) is the standard normal cumulative distribution function and

\[
d_1 = \frac{\ln(S/K) + \left(r + \tfrac{1}{2}\sigma^2\right)(T-t)}{\sigma\sqrt{T-t}}, \qquad d_2 = d_1 - \sigma\sqrt{T-t}.
\]
By put-call parity (\(C - P = S - Ke^{-r(T-t)}\)), the European put price is

\[
P(S,t) = Ke^{-r(T-t)}N(-d_2) - S\,N(-d_1).
\]
</div>

The formula has a beautiful economic interpretation. \(N(d_2)\) is the risk-neutral probability that the option expires in the money (\(S_T > K\)) — the probability, computed under a risk-neutral measure that replaces the drift \(\mu\) with the risk-free rate \(r\). The term \(Ke^{-r(T-t)}N(d_2)\) is the discounted expected strike payment. The term \(S\,N(d_1)\) accounts for the expected receipt of the stock, adjusted for the probability weighting. The option price is the present value of the expected net benefit from exercising.

<div class="remark">
<strong>Remark (The risk-neutral pricing interpretation)</strong>: One of the deepest insights of the Black-Scholes framework is that the option price formula contains no reference to the actual drift \(\mu\) of the stock — only the risk-free rate \(r\), the volatility \(\sigma\), and the current price \(S\). This seems paradoxical: how can the price of a stock option not depend on whether the stock is expected to rise quickly (\(\mu\) large) or slowly (\(\mu\) small)?

The resolution is the <em>risk-neutral measure</em> (or equivalent martingale measure). The delta-hedging argument shows that any option risk can be perfectly replicated by a dynamic portfolio of stock and bond. The cost of this replicating portfolio — which is the option price — depends only on the statistical structure of the stock's fluctuations (encoded in \(\sigma\)), not on the expected return (\(\mu\)), because the hedge eliminates all directional exposure. In the language of measure theory: we change from the physical (real-world) probability measure \(\mathbb{P}\) (under which the stock drifts at rate \(\mu\)) to the risk-neutral measure \(\mathbb{Q}\) (under which the stock drifts at the risk-free rate \(r\)). Under \(\mathbb{Q}\), the discounted stock price \(e^{-rt}S(t)\) is a martingale, and the option price is simply the discounted expected payoff: \(V = e^{-r(T-t)}\mathbb{E}^{\mathbb{Q}}\!\left[\text{Payoff}(S_T)\right]\).

This is the fundamental theorem of asset pricing. Its economic interpretation is: in a complete, arbitrage-free market, every agent — regardless of their risk preferences or beliefs about \(\mu\) — agrees on option prices, because those prices are set by the cost of replication, not by expected utility maximisation. This consensus is why options markets are so liquid: buyers and sellers can transact without needing to agree on the stock's future return, only on its current volatility.
</div>

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

## 7.8 Numerical Black-Scholes Example

<div class="example">
<strong>Example — Pricing a European call option</strong>: A stock currently trades at \(S = 100\). A call option has strike \(K = 105\), time to expiry \(T - t = 0.5\) years, risk-free rate \(r = 0.05\), and volatility \(\sigma = 0.20\). Compute the call price.

<em>Step 1: Compute \(d_1\) and \(d_2\)</em>:

\[
d_1 = \frac{\ln(100/105) + (0.05 + 0.02)(0.5)}{0.20\sqrt{0.5}} = \frac{-0.04879 + 0.035}{0.1414} \approx -0.0975.
\]

\[
d_2 = d_1 - \sigma\sqrt{T-t} = -0.0975 - 0.1414 \approx -0.239.
\]

<em>Step 2: Normal CDF values</em>: \(N(-0.098) \approx 0.461\) and \(N(-0.239) \approx 0.406\).

<em>Step 3: Call price</em>:

\[
C = 100 \times 0.461 - 105 \times e^{-0.025} \times 0.406 = 46.1 - 105 \times 0.9753 \times 0.406 \approx 46.1 - 41.6 = 4.50.
\]

The call is worth approximately \$4.50. By put-call parity: \(P = C - S + Ke^{-r\tau} \approx 4.50 - 100 + 102.4 = 6.90\). The put commands a higher price because it is in-the-money while the call is out-of-the-money.
</div>

<div class="remark">
<strong>Remark (Volatility and option value)</strong>: The Black-Scholes formula is increasing in \(\sigma\). An option holder benefits from large upside moves (unbounded payoff) but is protected from downside (payoff floored at 0). Higher volatility spreads the terminal distribution, putting more probability in the right tail — without hurting the holder symmetrically. This option convexity, quantified by Gamma \((\Gamma > 0)\), explains why options are universally more expensive in high-volatility regimes.
</div>

## 7.9 The Arc from ODEs to Black-Scholes

It is worth pausing to appreciate the mathematical arc of this course. We began with the simplest differential equations — separable ODEs describing exponential growth in a bank account — and progressively built the tools needed to handle more complex phenomena. First-order linear ODEs gave us the integrating factor and debt dynamics. Higher-order linear ODEs introduced the characteristic equation and superposition. Systems of ODEs introduced eigenvalues and phase portraits. PDEs introduced the method of characteristics and the classification of equations. The Fourier Transform gave us the heat kernel. And finally, Itô's lemma and the delta-hedging argument produced the Black-Scholes PDE — which, through a clever change of variables, reduces to the very heat equation we solved in Chapter 6.

The Black-Scholes formula is thus the culmination of a long chain of mathematical ideas, each building on the last. The diffusion of heat and the diffusion of uncertainty in financial markets are not merely analogous — they are governed by the same equation, and the same mathematical techniques solve both.

---

# Chapter 8: Phase Plane Analysis and Nonlinear Systems

The eigenvalue method of Chapter 4 gives exact solutions for linear systems. But most real systems — ecological interactions, epidemic spread, market dynamics — are genuinely nonlinear, and exact solutions are rarely available. The phase plane is the tool that compensates for this: it provides a complete qualitative picture of all trajectories without requiring closed-form expressions.

## 8.1 Phase Portraits and Equilibrium Classification

For a two-dimensional autonomous system \(\mathbf{x}' = \mathbf{f}(\mathbf{x})\), a **phase portrait** is the family of solution curves in the \((x_1, x_2)\) plane, with arrows indicating the direction of increasing \(t\). The key objects are the **nullclines** — curves where one component of \(\mathbf{f}\) is zero — and the **equilibria** (or fixed points) where \(\mathbf{f}(\mathbf{x}^*) = \mathbf{0}\).

<div class="definition">
<strong>Definition (Nullclines and Equilibria)</strong>: For the system \(x_1' = f_1(x_1, x_2)\), \(x_2' = f_2(x_1, x_2)\):
<ul>
  <li>The <em>\(x_1\)-nullcline</em> is the set \(\{f_1(x_1,x_2) = 0\}\); on this curve, \(x_1\) is momentarily stationary.</li>
  <li>The <em>\(x_2\)-nullcline</em> is the set \(\{f_2(x_1,x_2) = 0\}\); on this curve, \(x_2\) is momentarily stationary.</li>
  <li>An <em>equilibrium</em> is a point where both nullclines intersect: \(f_1 = f_2 = 0\).</li>
</ul>
Between nullclines, the signs of \(f_1\) and \(f_2\) are constant, so trajectories move consistently in one of four diagonal directions. Nullclines divide the plane into regions and make the global flow pattern visible by inspection.
</div>

For linear systems \(\mathbf{x}' = A\mathbf{x}\), the origin is always an equilibrium. The character of all other trajectories is determined entirely by the eigenvalues of \(A\). Writing \(\tau = \mathrm{tr}(A)\) and \(\Delta = \det(A)\), the **trace-determinant criterion** gives a complete classification.

<div class="theorem">
<strong>Theorem (Trace-Determinant Stability Criterion)</strong>: For the system \(\mathbf{x}' = A\mathbf{x}\) with \(\tau = \mathrm{tr}(A)\) and \(\Delta = \det(A)\), the eigenvalues are \(\lambda = \frac{\tau \pm \sqrt{\tau^2 - 4\Delta}}{2}\). The origin is classified as follows:
<ul>
  <li><em>Stable node</em>: \(\Delta > 0\), \(\tau < 0\), \(\tau^2 - 4\Delta > 0\). Both eigenvalues real and negative.</li>
  <li><em>Unstable node</em>: \(\Delta > 0\), \(\tau > 0\), \(\tau^2 - 4\Delta > 0\). Both eigenvalues real and positive.</li>
  <li><em>Saddle point</em>: \(\Delta < 0\). Eigenvalues real with opposite signs; the equilibrium is always unstable.</li>
  <li><em>Stable spiral</em>: \(\Delta > 0\), \(\tau < 0\), \(\tau^2 - 4\Delta < 0\). Complex eigenvalues with negative real part.</li>
  <li><em>Unstable spiral</em>: \(\Delta > 0\), \(\tau > 0\), \(\tau^2 - 4\Delta < 0\). Complex eigenvalues with positive real part.</li>
  <li><em>Centre</em>: \(\Delta > 0\), \(\tau = 0\). Purely imaginary eigenvalues; neutrally stable closed orbits.</li>
  <li><em>Degenerate (star/improper) node</em>: \(\tau^2 - 4\Delta = 0\). Repeated eigenvalue.</li>
</ul>
Stability requires \(\tau < 0\) and \(\Delta > 0\). Instability is guaranteed when \(\tau > 0\) or \(\Delta < 0\).
</div>

<div class="remark">
<strong>Remark (Poincaré diagram)</strong>: The \((\tau, \Delta)\) plane is the <em>Poincaré diagram</em>. The parabola \(\Delta = \tau^2/4\) separates nodes from spirals. The \(\tau\)-axis (\(\Delta = 0\)) is the boundary of saddle points (below) and the degenerate centre/node cases (on the axis). The left half-plane (\(\tau < 0\)) is stable and the right half-plane (\(\tau > 0\)) unstable. A single glance at where \((\tau, \Delta)\) falls in this diagram tells the full qualitative story of the system.
</div>

<div class="example">
<strong>Example — Classifying equilibria via the trace-determinant criterion</strong>: For each matrix, determine the type of the equilibrium at the origin.

<em>(a)</em> \(A = \begin{pmatrix}0&1\\-2&-3\end{pmatrix}\): \(\tau = -3\), \(\Delta = 2\). Since \(\tau < 0\), \(\Delta > 0\), and \(\tau^2 - 4\Delta = 9 - 8 = 1 > 0\): <strong>stable node</strong>. Eigenvalues \(\lambda = (-3 \pm 1)/2\), giving \(\lambda_1 = -1\), \(\lambda_2 = -2\). (This is the matrix from Section 4.3.)

<em>(b)</em> \(A = \begin{pmatrix}-1&2\\-2&-1\end{pmatrix}\): \(\tau = -2\), \(\Delta = 1 + 4 = 5\). \(\tau^2 - 4\Delta = 4 - 20 < 0\): <strong>stable spiral</strong>. Eigenvalues \(\lambda = -1 \pm 2i\). Trajectories spiral inward.

<em>(c)</em> \(A = \begin{pmatrix}1&1\\4&1\end{pmatrix}\): \(\tau = 2\), \(\Delta = 1 - 4 = -3 < 0\): <strong>saddle point</strong>. One positive, one negative eigenvalue. Trajectories approach along the stable manifold and diverge along the unstable manifold.

<em>(d)</em> \(A = \begin{pmatrix}0&1\\-4&0\end{pmatrix}\): \(\tau = 0\), \(\Delta = 4 > 0\): <strong>centre</strong>. Eigenvalues \(\lambda = \pm 2i\). The system exhibits closed orbits (ellipses). This is the undamped harmonic oscillator.
</div>

## 8.2 Competitive Species and Predator-Prey Models

The power of phase plane analysis lies in its application to genuinely nonlinear systems. A canonical example is the **Lotka-Volterra competition model**, which describes two species competing for the same resource.

Let \(x(t)\) and \(y(t)\) be the populations of two competing species. Each grows logistically in isolation, but each inhibits the other:

\[
\frac{dx}{dt} = r_1 x\!\left(1 - \frac{x}{K_1} - \frac{\alpha_{12} y}{K_1}\right), \qquad \frac{dy}{dt} = r_2 y\!\left(1 - \frac{y}{K_2} - \frac{\alpha_{21} x}{K_2}\right).
\]

The parameter \(\alpha_{12}\) measures how much a unit of species 2 "costs" species 1 in terms of carrying-capacity units; \(\alpha_{21}\) is the reciprocal effect. Equilibria occur where both nullclines intersect. The \(x\)-nullclines are \(x = 0\) and \(x + \alpha_{12} y = K_1\); the \(y\)-nullclines are \(y = 0\) and \(\alpha_{21} x + y = K_2\).

<div class="example">
<strong>Example — Competitive exclusion vs. coexistence</strong>: Take \(r_1 = r_2 = 1\), \(K_1 = K_2 = 100\), \(\alpha_{12} = 0.5\), \(\alpha_{21} = 0.5\).

The \(x\)-nullcline (for \(x > 0\)): \(x + 0.5y = 100\), i.e., \(x = 100 - 0.5y\).
The \(y\)-nullcline (for \(y > 0\)): \(0.5x + y = 100\), i.e., \(y = 100 - 0.5x\).

Setting both equal to zero: \(100 - 0.5y = 0\) and \(100 - 0.5x = 0\) at the corner equilibria \((100, 0)\) and \((0, 100)\). The interior equilibrium satisfies:

\[
x + 0.5y = 100, \quad 0.5x + y = 100.
\]
Adding: \(1.5(x + y) = 200\), so \(x + y = 133.3\). Subtracting the second from the first: \(0.5(x - y) = 0\), so \(x = y\). Then \(1.5x = 100\), giving \(x^* = y^* = 200/3 \approx 66.7\).

To classify the interior equilibrium, linearise. The Jacobian at \((x^*, y^*)\) is:

\[
J = \begin{pmatrix} -r_1 x^*/K_1 & -r_1\alpha_{12}x^*/K_1 \\ -r_2\alpha_{21}y^*/K_2 & -r_2 y^*/K_2 \end{pmatrix} = \begin{pmatrix} -2/3 & -1/3 \\ -1/3 & -2/3 \end{pmatrix}.
\]

\(\tau = -4/3 < 0\), \(\Delta = 4/9 - 1/9 = 3/9 = 1/3 > 0\), \(\tau^2 - 4\Delta = 16/9 - 4/3 = 4/9 > 0\): <strong>stable node</strong>. The two species <em>coexist</em> at the interior equilibrium. When \(\alpha_{12}\alpha_{21} < 1\) (interspecific competition weaker than intraspecific), coexistence is always stable. When \(\alpha_{12}\alpha_{21} > 1\), the interior equilibrium is a saddle and one species excludes the other — the initial conditions determine which.

<em>Economic interpretation</em>: This model applies directly to two firms competing in a market. \(K_i\) is the market share firm \(i\) could capture alone; \(\alpha_{ij}\) is the competitive impact ratio. Stable coexistence corresponds to product differentiation reducing direct competition (\(\alpha\) small); competitive exclusion corresponds to undifferentiated commodity markets where one firm drives the other out.
</div>

---

# Chapter 9: Linearisation of Nonlinear Systems and the Hartman-Grobman Theorem

The trace-determinant analysis applies directly to linear systems. For nonlinear systems, the key insight is that near a hyperbolic equilibrium, the nonlinear system looks like its linearisation — and the phase portrait of the linearisation accurately represents that of the nonlinear system.

<div class="theorem">
<strong>Theorem (Hartman-Grobman)</strong>: Let \(\mathbf{x}^*\) be an equilibrium of the smooth system \(\mathbf{x}' = \mathbf{f}(\mathbf{x})\), and let \(J = D\mathbf{f}(\mathbf{x}^*)\) be the Jacobian matrix at the equilibrium. If \(\mathbf{x}^*\) is <em>hyperbolic</em> — meaning no eigenvalue of \(J\) has zero real part — then there exists a homeomorphism (a continuous map with continuous inverse) from a neighbourhood of \(\mathbf{x}^*\) in the nonlinear flow to a neighbourhood of the origin in the linear flow \(\mathbf{y}' = J\mathbf{y}\). In particular, the qualitative type of the equilibrium (stable node, saddle, unstable spiral, etc.) is determined by the eigenvalues of \(J\).
</div>

<div class="remark">
<strong>Remark</strong>: The theorem fails for non-hyperbolic equilibria (when an eigenvalue is purely imaginary or zero). In these borderline cases — centres in linear systems, for example — nonlinear terms determine whether the equilibrium is a true centre, a stable spiral, or an unstable spiral. The famous Hopf bifurcation theorem addresses exactly this borderline case.
</div>

The Jacobian at an equilibrium is computed by differentiating \(\mathbf{f}\) and evaluating at the equilibrium point.

## 9.1 The SIR Epidemic Model

The **SIR model** (Kermack-McKendrick, 1927) is the canonical model of epidemic spread. A population of fixed size \(N\) is divided into: \(S\) (susceptibles), \(I\) (infectives), \(R\) (recovered/removed). The dynamics are:

\[
\frac{dS}{dt} = -\beta S I, \qquad \frac{dI}{dt} = \beta S I - \gamma I, \qquad \frac{dR}{dt} = \gamma I,
\]

where \(\beta > 0\) is the transmission rate and \(\gamma > 0\) is the recovery rate. Since \(S + I + R = N\) is conserved, \(R\) is determined by \(S\) and \(I\), so we work in the two-dimensional \((S, I)\) plane.

<div class="definition">
<strong>Definition (Basic Reproduction Number \(\mathcal{R}_0\))</strong>: The <em>basic reproduction number</em> is

\[
\mathcal{R}_0 = \frac{\beta N}{\gamma}.
\]
It represents the expected number of secondary infections produced by a single infective in an otherwise fully susceptible population. If \(\mathcal{R}_0 > 1\), an epidemic can occur; if \(\mathcal{R}_0 \leq 1\), the infection dies out.
</div>

<div class="example">
<strong>Example — Equilibria and stability of the SIR model</strong>: Find all equilibria and classify their stability.

<em>Equilibria</em>: Setting \(dS/dt = 0\) and \(dI/dt = 0\):
- \(\beta SI = 0\) requires \(S = 0\) or \(I = 0\).
- \(\beta SI - \gamma I = I(\beta S - \gamma) = 0\) requires \(I = 0\) or \(S = \gamma/\beta\).

The only equilibria with \(I \geq 0\) and \(S \geq 0\) are the <strong>disease-free equilibria</strong> \((S^*, 0)\) for any \(0 \leq S^* \leq N\). (There is no interior equilibrium with \(I > 0\) that is a fixed point; the epidemic must end at some \(S^* < N\).)

<em>Jacobian</em>: At a disease-free equilibrium \((S^*, 0)\):

\[
J = \begin{pmatrix} \frac{\partial}{\partial S}(-\beta SI) & \frac{\partial}{\partial I}(-\beta SI) \\ \frac{\partial}{\partial S}(\beta SI - \gamma I) & \frac{\partial}{\partial I}(\beta SI - \gamma I) \end{pmatrix}\Bigg|_{(S^*, 0)} = \begin{pmatrix} 0 & -\beta S^* \\ 0 & \beta S^* - \gamma \end{pmatrix}.
\]

The eigenvalues are \(\lambda_1 = 0\) and \(\lambda_2 = \beta S^* - \gamma\).

<em>Stability threshold</em>: The equilibrium \((S^*, 0)\) is stable (the infection dies out) when \(\lambda_2 < 0\), i.e., \(\beta S^* < \gamma\), i.e., \(S^* < \gamma/\beta = N/\mathcal{R}_0\).

When the population is fully susceptible (\(S^* = N\)), stability requires \(\beta N < \gamma\), i.e., \(\mathcal{R}_0 < 1\). If \(\mathcal{R}_0 > 1\), the disease-free state is unstable and an epidemic occurs. The threshold \(\mathcal{R}_0 = 1\) is the epidemic threshold: vaccination campaigns aim to reduce the effective susceptible fraction below \(1/\mathcal{R}_0\) (herd immunity threshold \(p^* = 1 - 1/\mathcal{R}_0\)).

<em>Numerical example</em>: Suppose \(N = 10{,}000\), \(\beta = 0.0003\), \(\gamma = 0.1\). Then \(\mathcal{R}_0 = 0.0003 \times 10{,}000 / 0.1 = 30\). This is a highly transmissible pathogen (comparable to measles). The herd immunity threshold is \(1 - 1/30 \approx 96.7\%\). The Jacobian at the disease-free equilibrium \((10{,}000, 0)\) gives \(\lambda_2 = 0.0003 \times 10{,}000 - 0.1 = 3 - 0.1 = 2.9 > 0\): the disease-free state is strongly unstable, confirming that without immunisation, an epidemic is inevitable.
</div>

<div class="remark">
<strong>Remark (Economic interpretation of \(\mathcal{R}_0\))</strong>: The reproduction number has a direct economic analogue in network economics: the spectral radius of the influence matrix. In financial contagion models, \(\mathcal{R}_0 > 1\) corresponds to the condition under which a bank failure cascades through the interbank network. The SIR structure — where "infected" banks pass distress to their counterparties at rate \(\beta\) and "recover" (fail or are resolved) at rate \(\gamma\) — provides the formal basis for systemic risk measures used by regulators.
</div>

---

# Chapter 10: The IS-LM Model as a Dynamical System

The IS-LM framework introduced in Chapter 2 deserves a more careful dynamical treatment. In the static version, national income \(Y\) and the interest rate \(r\) are simultaneously determined by goods market equilibrium (the IS curve) and money market equilibrium (the LM curve). In the dynamic version, these adjust at finite speeds, generating a system of ODEs.

## 10.1 Dynamic IS-LM

Let income and the interest rate satisfy:

\[
\frac{dY}{dt} = \alpha\bigl[I(r) + G - sY\bigr], \qquad \frac{dr}{dt} = \beta\bigl[kY - \bar{M}/P - hr\bigr],
\]
where \(s\) is the marginal propensity to save, \(k > 0\) is the income sensitivity of money demand, \(h > 0\) is the interest sensitivity of money demand, \(\bar{M}/P\) is the real money supply, \(I(r) = I_0 - br\) is investment (decreasing in \(r\)), and \(\alpha, \beta > 0\) are adjustment speeds. Linearising near the IS-LM equilibrium \((Y^*, r^*)\):

\[
\frac{d}{dt}\begin{pmatrix}Y - Y^* \\ r - r^*\end{pmatrix} = \begin{pmatrix} -\alpha s & -\alpha b \\ \beta k & -\beta h \end{pmatrix}\begin{pmatrix}Y - Y^* \\ r - r^*\end{pmatrix}.
\]

<div class="theorem">
<strong>Theorem (IS-LM Stability)</strong>: The IS-LM equilibrium is stable if and only if \(\tau < 0\) and \(\Delta > 0\), where

\[
\tau = -\alpha s - \beta h < 0 \quad\text{(always negative)}, \qquad \Delta = \alpha\beta(sh + bk) > 0 \quad\text{(always positive)}.
\]
Therefore the IS-LM equilibrium is always a stable node or stable spiral: the economy always converges to its Keynesian equilibrium, regardless of initial conditions.
</div>

<div class="example">
<strong>Example — IS-LM with a fiscal policy shock</strong>: Suppose \(\alpha = 1\), \(\beta = 0.5\), \(s = 0.2\), \(b = 0.5\), \(k = 0.1\), \(h = 1\). The linearised matrix is:

\[
A = \begin{pmatrix} -0.2 & -0.5 \\ 0.05 & -0.5 \end{pmatrix}.
\]
\(\tau = -0.7\), \(\Delta = 0.1 + 0.025 = 0.125\). Since \(\tau^2 - 4\Delta = 0.49 - 0.5 = -0.01 < 0\): <strong>stable spiral</strong>. Income and interest rates converge to equilibrium through damped oscillations.

Eigenvalues: \(\lambda = (-0.7 \pm \sqrt{-0.01})/2 = -0.35 \pm 0.05i\). The period of oscillation is \(2\pi/0.05 \approx 125.6\) time units. The decay rate is \(e^{-0.35t}\); after \(t = 10\), the amplitude has fallen by factor \(e^{-3.5} \approx 0.030\). This represents a business cycle of very long period — consistent with the observation that IS-LM adjustment in calibrated macro models takes several years to complete.

<em>Fiscal multiplier</em>: At the steady state, \(G\) enters through the IS equation. Setting \(dY/dt = 0\) and \(dr/dt = 0\) simultaneously and solving for \(\partial Y^*/\partial G\):

\[
\frac{\partial Y^*}{\partial G} = \frac{h}{sh + bk} = \frac{1}{s + bk/h}.
\]
With the numbers above: \(bk/h = 0.05\), so the multiplier is \(1/(0.2 + 0.05) = 4\). A unit increase in government spending raises equilibrium income by 4 units — this is the Keynesian multiplier, modified downward from \(1/s = 5\) by the crowding-out effect (higher \(G\) raises \(r\), reducing \(I\)). The eigenvalue ratio \(\lambda_1/\lambda_2\) encodes the relative speeds at which the goods market and money market adjust — a deeper connection between the dynamical and comparative-static analyses.
</div>

---

# Chapter 11: The Solow Model with Human Capital

The standard Solow model of Chapter 2 explains convergence in physical capital \(k\) but leaves an uncomfortably large residual — "total factor productivity" — unexplained. Mankiw, Romer, and Weil (1992) extended the model by adding **human capital** \(h\) (skills, education) as a separate accumulable factor. This MRW extension resolves the empirical puzzle and is solvable as a two-dimensional linear system after log-linearisation.

## 11.1 The MRW Equations

With a Cobb-Douglas production function \(Y = K^\alpha H^\phi L^{1-\alpha-\phi}\) (where \(\alpha + \phi < 1\)), fractions \(s_k\) and \(s_h\) of output invested in physical and human capital, and common depreciation and population growth \((n + \delta)\), the dynamics of \(k = K/L\) and \(h = H/L\) are:

\[
\frac{dk}{dt} = s_k k^\alpha h^\phi - (n+\delta)k, \qquad \frac{dh}{dt} = s_h k^\alpha h^\phi - (n+\delta)h.
\]

The steady state \((k^*, h^*)\) satisfies both equations simultaneously. Taking logs and setting \(\hat{k} = \ln k - \ln k^*\) and \(\hat{h} = \ln h - \ln h^*\) (log-deviations from steady state), the linearised system is:

\[
\frac{d}{dt}\begin{pmatrix}\hat{k}\\hat{h}\end{pmatrix} = (n+\delta)\begin{pmatrix}\alpha - 1 & \phi \\ \alpha & \phi - 1\end{pmatrix}\begin{pmatrix}\hat{k}\\hat{h}\end{pmatrix}.
\]

<div class="theorem">
<strong>Theorem (MRW Convergence Speed)</strong>: Let \(\mu = (n+\delta)(1 - \alpha - \phi)\). The eigenvalues of the linearised MRW system are \(\lambda_1 = -(n+\delta)(1 - \alpha - \phi) = -\mu\) and \(\lambda_2 = 0\). The nonzero eigenvalue \(-\mu\) gives the convergence rate: deviations from steady state decay as \(e^{-\mu t}\). The half-life of convergence is \(t_{1/2} = \ln(2)/\mu\).
</div>

<div class="example">
<strong>Example — Convergence rate with human capital</strong>: Standard calibrations give \(\alpha = 1/3\), \(\phi = 1/3\), \(n = 0.02\), \(\delta = 0.05\), so \(n + \delta = 0.07\). Then \(\mu = 0.07 \times (1 - 2/3) = 0.07/3 \approx 0.0233\). The half-life of convergence is \(\ln(2)/0.0233 \approx 29.7\) years.

For comparison, the standard Solow model (without human capital) gives \(\mu_{\text{Solow}} = (n+\delta)(1-\alpha) = 0.07 \times 2/3 \approx 0.0467\), corresponding to a half-life of about 14.8 years. Adding human capital roughly doubles the convergence half-life, because human capital must also adjust — the system has more "inertia". This is consistent with cross-country data showing convergence rates of roughly 2% per year (implying half-lives around 35 years), much slower than the pure Solow prediction.

<em>Golden rule capital stock</em>: The golden rule maximises steady-state consumption per worker \(c^* = f(k^*, h^*) - (n+\delta)(k^* + h^*)\). Optimising over \((s_k, s_h)\) gives the golden rule condition: the marginal product of each capital type equals \(n+\delta\). With Cobb-Douglas production: \(\alpha Y^*/k^* = n + \delta\) and \(\phi Y^*/h^* = n + \delta\), so at the golden rule, \(s_k = \alpha\) and \(s_h = \phi\). If the economy saves too little (\(s_k < \alpha\)), capital is below the golden rule and increasing savings raises long-run welfare; if \(s_k > \alpha\), the economy is dynamically inefficient.
</div>

---

# Chapter 12: Laplace Transforms

While the Fourier Transform is the right tool for problems on the entire real line, the **Laplace Transform** is designed for initial-value problems on the half-line \(t \geq 0\). It converts an ODE with initial conditions into an algebraic equation, solves it in "transform space," and inverts. The power of the Laplace Transform lies especially in handling **discontinuous** or **impulsive** forcing — a sudden policy change, a tax reform implemented at \(t = t_0\), or a sharp shock to investment.

<div class="definition">
<strong>Definition (Laplace Transform)</strong>: The <em>Laplace Transform</em> of a function \(f(t)\) defined for \(t \geq 0\) is

\[
\mathcal{L}\{f\}(s) = F(s) = \int_0^\infty f(t)\,e^{-st}\,dt,
\]
provided the integral converges for some \(s \in \mathbb{C}\). The <em>region of convergence</em> is a right half-plane \(\mathrm{Re}(s) > a\) for some abscissa of convergence \(a\).
</div>

The transform is linear: \(\mathcal{L}\{af + bg\} = a\mathcal{L}\{f\} + b\mathcal{L}\{g\}\). Its defining property for ODEs is the **derivative rule**: \(\mathcal{L}\{f'\}(s) = sF(s) - f(0)\), and more generally \(\mathcal{L}\{f^{(n)}\}(s) = s^n F(s) - s^{n-1}f(0) - \cdots - f^{(n-1)}(0)\). Initial conditions are automatically incorporated.

## 12.1 Table of Key Transforms

The following table collects the transforms needed for most applications:

| \(f(t)\) | \(F(s) = \mathcal{L}\{f\}(s)\) | Condition |
|---|---|---|
| \(1\) | \(1/s\) | \(s > 0\) |
| \(e^{at}\) | \(1/(s-a)\) | \(s > a\) |
| \(t^n\) | \(n!/s^{n+1}\) | \(s > 0\) |
| \(\sin(\omega t)\) | \(\omega/(s^2+\omega^2)\) | \(s > 0\) |
| \(\cos(\omega t)\) | \(s/(s^2+\omega^2)\) | \(s > 0\) |
| \(e^{at}\sin(\omega t)\) | \(\omega/((s-a)^2+\omega^2)\) | \(s > a\) |
| \(e^{at}\cos(\omega t)\) | \((s-a)/((s-a)^2+\omega^2)\) | \(s > a\) |
| \(u_c(t) = \mathbf{1}_{t \geq c}\) | \(e^{-cs}/s\) | \(s > 0\) |
| \(u_c(t)f(t-c)\) | \(e^{-cs}F(s)\) | (Second shifting theorem) |
| \(\delta(t - c)\) | \(e^{-cs}\) | (Dirac delta) |
| \((f*g)(t) = \int_0^t f(\tau)g(t-\tau)d\tau\) | \(F(s)G(s)\) | (Convolution theorem) |

Here \(u_c(t)\) is the **Heaviside step function** that switches on at \(t = c\): \(u_c(t) = 0\) for \(t < c\) and \(u_c(t) = 1\) for \(t \geq c\).

<div class="theorem">
<strong>Theorem (First and Second Shifting Theorems)</strong>:
<ul>
  <li><em>First shifting theorem (s-shift)</em>: \(\mathcal{L}\{e^{at}f(t)\}(s) = F(s-a)\). Multiplication by \(e^{at}\) in \(t\)-space shifts the transform by \(a\) in \(s\)-space.</li>
  <li><em>Second shifting theorem (t-shift)</em>: \(\mathcal{L}\{u_c(t)\,f(t-c)\}(s) = e^{-cs}F(s)\). A time-delay of \(c\) units in \(t\)-space multiplies the transform by \(e^{-cs}\).</li>
  <li><em>Convolution theorem</em>: \(\mathcal{L}\{(f*g)(t)\}(s) = F(s)G(s)\). Convolution in \(t\)-space is multiplication in \(s\)-space.</li>
</ul>
</div>

## 12.2 Solving an IVP with Discontinuous Forcing

<div class="example">
<strong>Example — Second-order IVP with a Heaviside step forcing</strong>: Solve

\[
y'' + 4y = u_2(t), \quad y(0) = 0,\; y'(0) = 0,
\]
where \(u_2(t)\) is the Heaviside function switching on at \(t = 2\) (a sudden injection of stimulus at time \(t = 2\)).

<em>Step 1 — Take the Laplace Transform</em>: Applying \(\mathcal{L}\) to both sides:

\[
s^2 Y - sy(0) - y'(0) + 4Y = \frac{e^{-2s}}{s}.
\]
Applying initial conditions \(y(0) = y'(0) = 0\):

\[
(s^2 + 4)Y = \frac{e^{-2s}}{s}, \qquad Y(s) = \frac{e^{-2s}}{s(s^2+4)}.
\]

<em>Step 2 — Partial fractions</em>: Decompose \(1/(s(s^2+4))\):

\[
\frac{1}{s(s^2+4)} = \frac{A}{s} + \frac{Bs + C}{s^2+4}.
\]
Multiplying through: \(1 = A(s^2+4) + (Bs+C)s\). Setting \(s = 0\): \(A = 1/4\). Comparing \(s^2\): \(0 = A + B\), so \(B = -1/4\). Comparing \(s^1\): \(0 = C\). Therefore:

\[
\frac{1}{s(s^2+4)} = \frac{1}{4s} - \frac{s/4}{s^2+4} = \frac{1}{4}\!\left(\frac{1}{s} - \frac{s}{s^2+4}\right).
\]

Let \(G(s) = \frac{1}{s(s^2+4)}\), so \(g(t) = \mathcal{L}^{-1}\{G\}(t) = \frac{1}{4}(1 - \cos(2t))\).

<em>Step 3 — Apply the second shifting theorem</em>: Since \(Y(s) = e^{-2s}G(s)\):

\[
y(t) = \mathcal{L}^{-1}\{e^{-2s}G(s)\}(t) = u_2(t)\,g(t-2) = u_2(t)\cdot\frac{1}{4}\bigl(1 - \cos(2(t-2))\bigr).
\]

<em>Full solution</em>:

\[
y(t) = \begin{cases} 0 & t < 2, \\ \dfrac{1}{4}\!\left(1 - \cos(2t - 4)\right) & t \geq 2. \end{cases}
\]

For \(t < 2\): no forcing has occurred, so the system remains at rest. At \(t = 2\), the forcing switches on, exciting oscillations at the natural frequency \(\omega_0 = 2\). The solution oscillates with amplitude \(1/4\) around the constant particular solution \(1/4\). Note: this is close to (but not exactly) resonance — the forcing is a step function, which has Fourier content at all frequencies, including \(\omega = 2\).

<em>Numerical values</em>: At \(t = 3\): \(y(3) = \frac{1}{4}(1 - \cos(2)) \approx \frac{1}{4}(1 - (-0.416)) \approx \frac{1.416}{4} \approx 0.354\). At \(t = 5\): \(y(5) = \frac{1}{4}(1 - \cos(6)) \approx \frac{1}{4}(1 - 0.960) \approx 0.010\). The oscillation persists indefinitely (no damping).
</div>

## 12.3 Economic Application: Policy Shock

<div class="example">
<strong>Example — Tax reform as a step change in fiscal policy</strong>: Consider the dynamic IS equation for income \(Y(t)\):

\[
Y' + \alpha(s - c)Y = \alpha G(t), \quad Y(0) = Y_0,
\]
where \(s - c > 0\) is the net "saving drag," \(\alpha > 0\) the adjustment speed, and \(G(t) = G_0 + \Delta G \cdot u_{t_0}(t)\) models government spending that is raised permanently by \(\Delta G\) at time \(t_0\). Let \(\lambda = \alpha(s-c)\) for brevity.

Taking the Laplace Transform:

\[
sY - Y_0 + \lambda Y = \alpha\!\left(\frac{G_0}{s} + \frac{\Delta G\,e^{-t_0 s}}{s}\right),
\]

\[
Y = \frac{Y_0}{s + \lambda} + \frac{\alpha G_0}{s(s+\lambda)} + \frac{\alpha\,\Delta G\,e^{-t_0 s}}{s(s+\lambda)}.
\]

Partial fractions: \(\frac{1}{s(s+\lambda)} = \frac{1}{\lambda s} - \frac{1}{\lambda(s+\lambda)}\). Inverting:

\[
Y(t) = Y_0 e^{-\lambda t} + \frac{\alpha G_0}{\lambda}\!\left(1 - e^{-\lambda t}\right) + \frac{\alpha\,\Delta G}{\lambda}\,u_{t_0}(t)\!\left(1 - e^{-\lambda(t-t_0)}\right).
\]

For \(t < t_0\): \(Y\) decays from \(Y_0\) toward \(Y^*_{\text{pre}} = \alpha G_0/\lambda\). After \(t_0\): \(Y\) makes a further transition toward \(Y^*_{\text{post}} = \alpha(G_0 + \Delta G)/\lambda\). The policy multiplier on the new long-run income is \(\alpha/\lambda = 1/(s-c)\) — the standard Keynesian multiplier restated in these units. The Laplace approach makes it mechanical to handle piecewise-constant policy paths, which would be cumbersome to analyse by the method of variation of parameters.
</div>

---

# Chapter 13: Power Series and the Method of Frobenius

Not every ODE with variable coefficients can be solved by the previous methods. When the coefficient functions are analytic (expressible as convergent power series), we can seek solutions as power series too. This is particularly relevant for the **Euler equation** and its generalisations, which arise in the Solow model and in spatial economics when problems are posed in polar or spherical coordinates.

<div class="definition">
<strong>Definition (Ordinary and Singular Points)</strong>: For the ODE \(y'' + P(x)y' + Q(x)y = 0\), a point \(x_0\) is:
<ul>
  <li>An <em>ordinary point</em> if \(P\) and \(Q\) are both analytic at \(x_0\) (i.e., expandable in convergent Taylor series). Near an ordinary point, two linearly independent power series solutions \(y = \sum_{n=0}^\infty a_n(x-x_0)^n\) exist, convergent in the radius of analyticity.</li>
  <li>A <em>regular singular point</em> if \(P\) has at most a simple pole and \(Q\) at most a double pole at \(x_0\): \((x-x_0)P(x)\) and \((x-x_0)^2 Q(x)\) are both analytic at \(x_0\). The <em>method of Frobenius</em> applies.</li>
  <li>An <em>irregular singular point</em> otherwise.</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem (Method of Frobenius)</strong>: If \(x_0 = 0\) is a regular singular point of \(y'' + P(x)y' + Q(x)y = 0\), the <em>indicial equation</em> is

\[
r(r-1) + p_0 r + q_0 = 0,
\]
where \(p_0 = \lim_{x\to 0} xP(x)\) and \(q_0 = \lim_{x\to 0} x^2 Q(x)\). If the two roots \(r_1 \geq r_2\) of the indicial equation do not differ by an integer, there are two Frobenius series solutions \(y_j = x^{r_j}\sum_{n=0}^\infty a_n^{(j)} x^n\), \(a_0^{(j)} \neq 0\). If \(r_1 - r_2\) is a non-negative integer, the second solution may involve a logarithm: \(y_2 = y_1 \ln x + x^{r_2}\sum a_n x^n\).
</div>

## 13.1 The Euler Equation

The **Euler equation** (or equidimensional equation) is

\[
x^2 y'' + \alpha x y' + \beta y = 0, \quad x > 0.
\]

The origin \(x_0 = 0\) is a regular singular point with \(p_0 = \alpha\) and \(q_0 = \beta\). The indicial equation is \(r(r-1) + \alpha r + \beta = 0\), i.e.,

\[
r^2 + (\alpha - 1)r + \beta = 0.
\]

The substitution \(x = e^t\) (i.e., \(t = \ln x\)) converts the Euler equation into a constant-coefficient ODE in \(t\), which can be solved by the characteristic equation method.

<div class="example">
<strong>Example — Euler equation with two real roots</strong>: Solve \(x^2 y'' + 3xy' + y = 0\) for \(x > 0\).

<em>Indicial equation</em>: \(r^2 + (3-1)r + 1 = r^2 + 2r + 1 = (r+1)^2 = 0\). Repeated root \(r = -1\).

<em>First solution</em>: \(y_1 = x^{-1}\).

<em>Second solution</em> (logarithmic case — repeated root): \(y_2 = x^{-1}\ln x\).

<em>Verification of \(y_2\)</em>: \(y_2' = x^{-2}(\ln x \cdot (-1) \cdot x^{-1} \cdot x + 1 \cdot 1) \). More carefully: \(y_2 = x^{-1}\ln x\), so \(y_2' = -x^{-2}\ln x + x^{-2} = x^{-2}(1 - \ln x)\), and \(y_2'' = -2x^{-3}(1-\ln x) + x^{-2}(-x^{-1}) = x^{-3}(-2 + 2\ln x - 1) = x^{-3}(2\ln x - 3)\). Substituting into the ODE:

\[
x^2 \cdot x^{-3}(2\ln x - 3) + 3x \cdot x^{-2}(1 - \ln x) + x^{-1}\ln x = x^{-1}(2\ln x - 3) + 3x^{-1}(1 - \ln x) + x^{-1}\ln x.
\]

\[
= x^{-1}(2\ln x - 3 + 3 - 3\ln x + \ln x) = x^{-1} \cdot 0 = 0. \checkmark
\]

<em>General solution</em>: \(y = c_1 x^{-1} + c_2 x^{-1}\ln x = x^{-1}(c_1 + c_2 \ln x)\).

<em>Example with distinct roots</em>: Solve \(x^2 y'' - 2y = 0\). Indicial equation: \(r(r-1) - 2 = r^2 - r - 2 = (r-2)(r+1) = 0\). Roots \(r_1 = 2\), \(r_2 = -1\) (differ by 3, not by 0 or 1, so no logarithm). General solution: \(y = c_1 x^2 + c_2 x^{-1}\).

<em>Economic interpretation</em>: Euler equations arise naturally in optimal control problems with scale-invariant technologies (constant returns to scale). In growth theory, the Ramsey-Cass-Koopmans optimal savings problem reduces to a second-order ODE for the capital stock; near the steady state, the linearised equation is approximately of Euler type, and the indicial roots determine the stable and unstable manifolds.
</div>

<div class="remark">
<strong>Remark (Connection to the Frobenius method)</strong>: Every Euler equation is the prototype of a regular singular point. Other equations with regular singular points — Bessel's equation, Legendre's equation, the hypergeometric equation — arise throughout physics and economic geography (e.g., Bessel functions describe the spatial distribution of economic activity in a circular city). The Frobenius method reduces all such equations to the systematic computation of the indicial equation and power series coefficients.
</div>

## 13.2 Power Series Solution Near an Ordinary Point

Near an ordinary point, the method of power series is simpler than Frobenius — no indicial equation is needed.

<div class="example">
<strong>Example — Power series solution of \(y'' - xy' - y = 0\) about \(x = 0\)</strong>: The coefficient functions \(P(x) = -x\) and \(Q(x) = -1\) are both analytic everywhere, so \(x = 0\) is an ordinary point and we assume \(y = \sum_{n=0}^\infty a_n x^n\).

Computing term by term:

\[
y' = \sum_{n=1}^\infty n a_n x^{n-1}, \quad y'' = \sum_{n=2}^\infty n(n-1)a_n x^{n-2} = \sum_{n=0}^\infty (n+2)(n+1)a_{n+2}x^n.
\]

\[
xy' = \sum_{n=1}^\infty n a_n x^n = \sum_{n=0}^\infty n a_n x^n.
\]

Substituting into \(y'' - xy' - y = 0\):

\[
\sum_{n=0}^\infty \bigl[(n+2)(n+1)a_{n+2} - n a_n - a_n\bigr]x^n = 0.
\]

Setting each coefficient to zero: \((n+2)(n+1)a_{n+2} = (n+1)a_n\), so

\[
a_{n+2} = \frac{a_n}{n+2}, \quad n = 0, 1, 2, \ldots
\]

This recurrence connects even and odd coefficients separately. Starting from free constants \(a_0\) and \(a_1\):

\[
a_2 = \frac{a_0}{2},\quad a_4 = \frac{a_2}{4} = \frac{a_0}{8},\quad a_6 = \frac{a_4}{6} = \frac{a_0}{48}, \ldots
\]

\[
a_3 = \frac{a_1}{3},\quad a_5 = \frac{a_3}{5} = \frac{a_1}{15},\quad a_7 = \frac{a_5}{7} = \frac{a_1}{105}, \ldots
\]

The general pattern for even terms: \(a_{2k} = a_0/(2^k k!)\) (verifiable by induction). The two linearly independent solutions are:

\[
y_1(x) = a_0\sum_{k=0}^\infty \frac{x^{2k}}{2^k k!} = a_0\,e^{x^2/2}, \qquad y_2(x) = a_1\sum_{k=0}^\infty \frac{x^{2k+1}}{1 \cdot 3 \cdot 5 \cdots (2k+1)}.
\]

Indeed, \(y_1 = e^{x^2/2}\) can be verified directly: \(y_1' = xe^{x^2/2}\), \(y_1'' = (1+x^2)e^{x^2/2}\), and \(y_1'' - xy_1' - y_1 = (1+x^2)e^{x^2/2} - x^2 e^{x^2/2} - e^{x^2/2} = 0\). The power series method has efficiently produced both solutions, and the even-indexed one turns out to be an elementary function while the odd-indexed one is a non-elementary special function related to the error function \(\mathrm{erf}(x)\).
</div>

---

# Chapter 14: Travelling Waves and the Fisher-KPP Equation

The final topic brings together nonlinear ODEs, phase plane analysis, and PDE theory in an application with direct epidemiological and economic interpretations: **travelling wave solutions** to reaction-diffusion equations.

## 14.1 The Fisher-KPP Equation

Consider a population \(u(x,t)\) — the density of infected individuals in a spatial domain, or the density of adopters of a new technology — that both diffuses and grows logistically:

\[
\frac{\partial u}{\partial t} = D\frac{\partial^2 u}{\partial x^2} + ru\!\left(1 - u\right),
\]
where we have scaled so that the carrying capacity is 1. This is the **Fisher-KPP equation** (Fisher 1937; Kolmogorov, Petrovsky, Piskunov 1937). The key feature is that it admits **travelling wave solutions** of the form \(u(x,t) = \varphi(x - ct)\) — a front that moves at constant speed \(c\) while maintaining its shape.

<div class="definition">
<strong>Definition (Travelling Wave Solution)</strong>: A <em>travelling wave</em> of the Fisher-KPP equation is a solution of the form \(u(x,t) = \varphi(\xi)\) where \(\xi = x - ct\), connecting the unstable equilibrium \(u = 0\) ahead of the front to the stable equilibrium \(u = 1\) behind it:

\[
\lim_{\xi \to +\infty}\varphi(\xi) = 0, \qquad \lim_{\xi \to -\infty}\varphi(\xi) = 1.
\]
The parameter \(c > 0\) is the <em>wave speed</em>.
</div>

Substituting \(u = \varphi(\xi)\) into the PDE: \(-c\varphi' = D\varphi'' + r\varphi(1-\varphi)\), or

\[
D\varphi'' + c\varphi' + r\varphi(1-\varphi) = 0.
\]
This is a second-order nonlinear ODE for \(\varphi(\xi)\). Setting \(p = \varphi'\), we convert to a first-order system in the phase plane \((\varphi, p)\):

\[
\frac{d\varphi}{d\xi} = p, \qquad \frac{dp}{d\xi} = -\frac{c}{D}p - \frac{r}{D}\varphi(1-\varphi).
\]

The equilibria are \((\varphi, p) = (0, 0)\) and \((1, 0)\). A travelling wave corresponds to a trajectory in the \((\varphi, p)\) phase plane connecting \((1,0)\) to \((0,0)\) — a **heteroclinic orbit**.

<div class="theorem">
<strong>Theorem (Minimal Wave Speed)</strong>: The Fisher-KPP equation admits monotone travelling wave solutions connecting \(u = 1\) to \(u = 0\) if and only if the wave speed \(c\) satisfies

\[
c \geq c^* = 2\sqrt{Dr}.
\]
The minimal speed \(c^* = 2\sqrt{Dr}\) is selected by initial conditions with compact support (spatially localised perturbation). Waves with \(c < c^*\) do not exist as monotone fronts.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Linearise near the equilibrium \((\varphi, p) = (0,0)\):

\[
\frac{d}{d\xi}\begin{pmatrix}\varphi\\p\end{pmatrix} = \begin{pmatrix}0&1\\-r/D&-c/D\end{pmatrix}\begin{pmatrix}\varphi\\p\end{pmatrix}.
\]
The eigenvalues are \(\lambda = \frac{-c/D \pm \sqrt{c^2/D^2 - 4r/D}}{2}\). For the wave to approach zero monotonically (without oscillation in \(\varphi\)), we need real eigenvalues: \(c^2/D^2 \geq 4r/D\), i.e., \(c^2 \geq 4Dr\), i.e., \(c \geq 2\sqrt{Dr}\). If \(c < 2\sqrt{Dr}\), the eigenvalues are complex and \(\varphi\) oscillates near zero — but \(\varphi < 0\) is not a valid population density, ruling out such waves.
</div>

<div class="example">
<strong>Example — Wave speed in an epidemic spatial model</strong>: Suppose infected individuals diffuse with coefficient \(D = 0.01\) km\(^2\)/day and the logistic growth rate (net infection minus recovery) is \(r = 0.5\) per day. Then:

\[
c^* = 2\sqrt{Dr} = 2\sqrt{0.01 \times 0.5} = 2\sqrt{0.005} = 2 \times 0.0707 \approx 0.141 \text{ km/day} \approx 51.5 \text{ km/year}.
\]

This is the minimum speed at which an epidemic front advances spatially. Historical data on the Black Death (1347-1353) gives an observed wave speed of roughly 500 km/year, suggesting much higher effective diffusion (\(D \sim 40\,\text{km}^2/\text{day}\)) consistent with long-range travel by trade routes rather than pure local diffusion.

<em>Stability of the wave speed</em>: Initial conditions with compact support always generate the minimal-speed wave. Faster initial conditions (e.g., a function decaying algebraically rather than exponentially as \(x \to \infty\)) can generate faster waves, but minimal waves are the generic outcome. This explains why epidemic fronts typically advance at a characteristic, reproducible speed even when initial seeding conditions vary.

<em>Economic application — Diffusion of innovation</em>: The same equation models the spatial spread of a new technology or agricultural practice. \(u(x,t)\) is the adoption fraction at location \(x\), \(D\) is the rate of information diffusion (via trade networks, media), and \(r\) is the intrinsic adoption advantage. The wave speed \(c^* = 2\sqrt{Dr}\) predicts how fast the adoption frontier advances geographically. Ryan and Gross's famous study of hybrid corn adoption in the 1930s US Midwest observed precisely this wave-like spread, with a speed consistent with the Fisher-KPP prediction.
</div>

<div class="remark">
<strong>Remark (Connection to earlier material)</strong>: The minimal wave speed computation is essentially a stability analysis of the equilibrium \((\varphi, p) = (0,0)\) in the phase plane — the same eigenvalue calculation from Chapter 8. The condition \(c \geq 2\sqrt{Dr}\) ensures the equilibrium is a stable node (real eigenvalues) rather than a stable spiral (complex eigenvalues with oscillating tails). The Fisher-KPP equation thus brings together reaction-diffusion PDEs, phase plane analysis of the travelling wave ODE, and the eigenvalue criterion from linear systems — a fitting capstone to the course's mathematical arc.
</div>

---

## Appendix: Key Formulas and Solution Methods

### First-Order ODEs: Solution Map

| Equation type | Solution method | Result |
|---|---|---|
| \(y' = ry\) | Separation | \(y = y_0 e^{rt}\) |
| \(y' = ry(1-y/K)\) | Separation (logistic) | \(y = K/(1+Ae^{-rt})\), \(A = (K-y_0)/y_0\) |
| \(y' + P(x)y = Q(x)\) | Integrating factor \(\mu = e^{\int P}\) | \(y = \mu^{-1}(\int \mu Q\,dx + C)\) |
| \(y' + P(x)y = Q(x)y^n\) | Bernoulli: \(v = y^{1-n}\) | Linear ODE for \(v\) |
| Newton cooling \(T' = k(A-T)\) | Linear 1st order | \(T = A + (T_0-A)e^{-kt}\) |

### Second-Order ODE: Characteristic Roots

For \(ay'' + by' + cy = 0\) with discriminant \(\Delta = b^2 - 4ac\):
- \(\Delta > 0\) (overdamped / distinct real): \(y = c_1 e^{r_1 x} + c_2 e^{r_2 x}\)
- \(\Delta = 0\) (critically damped / repeated): \(y = (c_1 + c_2 x)e^{rx}\)
- \(\Delta < 0\) (underdamped / complex): \(y = e^{\alpha x}(A\cos\beta x + B\sin\beta x)\)

Resonance: multiply particular solution guess by \(x^s\) where \(s\) = multiplicity of the forcing frequency as a characteristic root.

### Economic Models Summary

| Model | ODE/System | Key result |
|---|---|---|
| Continuous compounding | \(A' = rA\) | \(A = A_0e^{rt}\) |
| Logistic adoption | \(P' = rP(1-P/K)\) | S-curve; inflection at \(P = K/2\) |
| Public debt (Domar) | \(D' = rD + G_0e^{gt}\) | Sustainable iff \(r < g\) |
| Solow growth | \(k' = sk^\alpha - (n+\delta)k\) | Stable \(k^*\) via Bernoulli substitution |
| Samuelson cycle | \(Y'' - (c-1+a)Y' + (1-c)Y = G_0\) | Oscillatory iff \((c-1+a)^2 < 4(1-c)\) |
| Price adjustment | \(P' = \alpha(D(P)-S(P))\) | Stable iff \(D'(P^*) < S'(P^*)\) |
| SIR epidemic | \(S' = -\beta SI,\; I' = \beta SI - \gamma I\) | Epidemic iff \(\mathcal{R}_0 = \beta N/\gamma > 1\) |
| IS-LM dynamic | \(Y' = \alpha[I(r)+G-sY],\; r' = \beta[kY-hr-\bar{M}/P]\) | Always stable; node/spiral by \(\tau^2 - 4\Delta\) |
| MRW (Solow + human capital) | \(dk/dt = s_k k^\alpha h^\phi - (n+\delta)k\) | Convergence rate \(\mu = (n+\delta)(1-\alpha-\phi)\) |
| Fisher-KPP (spatial spread) | \(u_t = Du_{xx} + ru(1-u)\) | Wave speed \(c^* = 2\sqrt{Dr}\) |

### Black-Scholes Quick Reference

**PDE**: \(V_t + \frac{1}{2}\sigma^2 S^2 V_{SS} + rSV_S - rV = 0\)

**Formula** (European call, \(\tau = T-t\)):

\[
C = SN(d_1) - Ke^{-r\tau}N(d_2), \quad d_1 = \frac{\ln(S/K)+(r+\sigma^2/2)\tau}{\sigma\sqrt{\tau}}, \quad d_2 = d_1 - \sigma\sqrt{\tau}.
\]

**Put-call parity**: \(C - P = S - Ke^{-r\tau}\).

**Delta**: \(\Delta = N(d_1)\). **Vega**: \(\mathcal{V} = S\sqrt{\tau}N'(d_1)\).

### Laplace Transform Quick Reference

**Key pairs**: \(\mathcal{L}\{e^{at}\} = 1/(s-a)\); \(\mathcal{L}\{\sin\omega t\} = \omega/(s^2+\omega^2)\); \(\mathcal{L}\{\cos\omega t\} = s/(s^2+\omega^2)\); \(\mathcal{L}\{t^n\} = n!/s^{n+1}\); \(\mathcal{L}\{u_c(t)f(t-c)\} = e^{-cs}F(s)\).

**Derivative rule**: \(\mathcal{L}\{y''\} = s^2Y - sy(0) - y'(0)\). Converts an IVP to an algebraic equation for \(Y(s)\).

**Solving procedure**: (1) Transform the ODE; (2) solve for \(Y(s)\) algebraically; (3) apply partial fractions; (4) invert using the table and shifting theorems.

### Trace-Determinant Quick Reference

For \(\mathbf{x}' = A\mathbf{x}\) with \(\tau = \mathrm{tr}(A)\), \(\Delta = \det(A)\):
- \(\Delta < 0\): saddle (always unstable)
- \(\Delta > 0\), \(\tau < 0\): stable (\(\tau^2 > 4\Delta\): node; \(\tau^2 < 4\Delta\): spiral)
- \(\Delta > 0\), \(\tau > 0\): unstable (\(\tau^2 > 4\Delta\): node; \(\tau^2 < 4\Delta\): spiral)
- \(\Delta > 0\), \(\tau = 0\): centre

### Euler Equation Quick Reference

\(x^2y'' + \alpha x y' + \beta y = 0\): substitute \(y = x^r\), indicial equation \(r^2 + (\alpha-1)r + \beta = 0\).
- Distinct real roots \(r_1 \neq r_2\): \(y = c_1 x^{r_1} + c_2 x^{r_2}\).
- Repeated root \(r\): \(y = x^r(c_1 + c_2\ln x)\).
- Complex roots \(r = \mu \pm \nu i\): \(y = x^\mu(c_1\cos(\nu\ln x) + c_2\sin(\nu\ln x))\).

**Heat equation connection**: \(x = \ln S\), \(\tau = T-t\), exponential substitution \(\Rightarrow\) \(u_\tau = \frac{\sigma^2}{2}u_{xx}\), solved by the heat kernel.
