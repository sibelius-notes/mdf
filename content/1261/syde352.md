---
title: "SYDE 352: Introduction to Control Systems"
prof: "Nasser Lashgarian Azad"
subjects: "SYDE"
---

## Sources and References

**Primary textbook** — G.F. Franklin, J.D. Powell & A. Emami-Naeini, *Feedback Control of Dynamic Systems*, 8th ed., Pearson, 2019.
**Supplementary** — R.C. Dorf & R.H. Bishop, *Modern Control Systems*, 14th ed., Pearson; K. Ogata, *Modern Control Engineering*, 5th ed., Pearson.
**Online resources** — [Karl Åström & Richard Murray, *Feedback Systems* (open access, Caltech); MIT OCW 6.302; MATLAB Control System Toolbox documentation]

---

# Chapter 1: Introduction and Mathematical Foundations

## 1.1 What Is a Control System?

A control system is an arrangement of physical and computational components organized to regulate, command, or direct the behaviour of another system — the *plant* — so that its output follows a desired reference signal despite the presence of disturbances and model uncertainty. This deceptively simple statement encompasses the heating element in your kitchen oven, the attitude-control thrusters on a satellite, the cruise-control module in an automobile, and the insulin-pump algorithm that keeps a diabetic patient's blood glucose within safe bounds.

From the Systems Design Engineering perspective that defines SYDE 352, control is inseparable from *design*. Every controller is an artefact embedded in a larger sociotechnical system, and the engineer's job is not merely to stabilize a plant but to satisfy a constellation of objectives — speed of response, energy efficiency, robustness to manufacturing variation, cost, and safety — while acknowledging the limits of the mathematical model used during design. This dual perspective — rigorous mathematical analysis combined with engineering judgment about model fidelity — runs throughout the course and its associated laboratory program.

### 1.1.1 Open-Loop vs. Closed-Loop Control

The most fundamental architectural distinction in control is between *open-loop* and *closed-loop* (feedback) systems.

In an **open-loop** system the controller sends a command to the plant based entirely on the reference input, with no measurement of the actual plant output. An electric toaster is a canonical example: the heating element stays on for a preset time regardless of how brown the bread actually becomes. Open-loop control is simple and cheap but fails whenever the plant dynamics differ from the design model or whenever disturbances push the output away from the desired value.

In a **closed-loop** system a sensor measures the plant output \( y(t) \), a comparator forms the *error*

\[
e(t) = r(t) - y(t),
\]

and a controller \( C \) processes \( e(t) \) to generate the control input \( u(t) \) that drives the plant \( P \). The loop of information flow — plant output feeds back to modify the plant input — is why closed-loop control is synonymous with *feedback control*.

<div class="remark">
<strong>SYDE design perspective.</strong> The Lab 1 and Lab 3 system-identification exercises make the importance of feedback viscerally clear. A rotating disc or an inverted pendulum is impossible to stabilize in open loop (the pendulum is inherently unstable), yet a well-designed closed-loop PID controller accomplishes it in real time. The gap between open-loop inadequacy and closed-loop performance is the central engineering motivation for everything in this course.
</div>

### 1.1.2 Components of a Feedback Control System

A standard unity-feedback block diagram contains the following elements:

- **Reference (setpoint)** \( R(s) \): the desired value of the output.
- **Error signal** \( E(s) = R(s) - Y(s) \): the discrepancy between reference and output.
- **Controller** \( C(s) \): the compensator that processes \( E(s) \) to produce the control signal \( U(s) \).
- **Plant** \( G(s) \): the physical process to be controlled.
- **Sensor/measurement** \( H(s) \): transduces the plant output to a feedback signal (often \( H(s) = 1 \) in unity-feedback configurations).
- **Disturbance** \( D(s) \): an unwanted external input that enters the plant.
- **Noise** \( N(s) \): corruption of the sensor measurement.

The closed-loop transfer function from reference to output is

\[
T(s) = \frac{C(s)\,G(s)}{1 + C(s)\,G(s)}.
\]

## 1.2 Mathematical Models of Physical Systems

Before designing a controller we need a mathematical description of the plant. For the lumped-parameter systems treated in this course such a description takes the form of an ordinary differential equation (ODE) relating the output \( y(t) \) to the input \( u(t) \).

### 1.2.1 Mechanical Translational Systems

For a mass-spring-damper system with mass \( m \), damping coefficient \( b \), and spring constant \( k \) driven by force \( u(t) \):

\[
m\ddot{y} + b\dot{y} + ky = u(t).
\]

### 1.2.2 Electrical Circuits

A series RLC circuit with input voltage \( u(t) \) and output voltage across the capacitor \( y(t) = v_C(t) \) obeys

\[
LC\,\ddot{y} + RC\,\dot{y} + y = u(t).
\]

Notice the structural isomorphism with the mechanical system: \( L \leftrightarrow m \), \( R \leftrightarrow b \), \( 1/C \leftrightarrow k \). This universality of the second-order ODE means that the analysis developed once applies across all physical domains.

### 1.2.3 Rotational Systems

For a rotating disc of moment of inertia \( J \) with viscous friction coefficient \( b \) and applied torque \( \tau(t) \):

\[
J\ddot{\theta} + b\dot{\theta} = \tau(t).
\]

<div class="remark">
<strong>Lab connection.</strong> The rotating disc plant used in Labs 1 and 2 is modelled exactly by this equation. System identification (Lab 1) consists of estimating \( J \) and \( b \) from step-response or frequency-sweep data, then validating that the identified transfer function reproduces the measured output accurately before designing the PID controller (Lab 2).
</div>

## 1.3 Laplace Transforms — A Review

The Laplace transform converts a time-domain ODE into an algebraic equation in the complex frequency variable \( s \), which can then be manipulated with the tools of algebra before being inverted back to the time domain.

<div class="definition">
<strong>Laplace Transform.</strong> For a function \( f(t) \) defined for \( t \geq 0 \), the one-sided Laplace transform is

\[
F(s) = \mathcal{L}\{f(t)\} = \int_0^{\infty} f(t)\,e^{-st}\,dt,
\]

where \( s = \sigma + j\omega \) is a complex variable and the integral converges for \( \text{Re}(s) \) sufficiently large.
</div>

Key transform pairs used throughout this course:

| \( f(t) \) | \( F(s) \) |
|---|---|
| \( \delta(t) \) | \( 1 \) |
| \( u_s(t) \) (unit step) | \( 1/s \) |
| \( t \) (unit ramp) | \( 1/s^2 \) |
| \( e^{-at} \) | \( 1/(s+a) \) |
| \( \sin(\omega_0 t) \) | \( \omega_0/(s^2 + \omega_0^2) \) |
| \( \cos(\omega_0 t) \) | \( s/(s^2 + \omega_0^2) \) |
| \( t^n e^{-at} \) | \( n!/(s+a)^{n+1} \) |

The key operational properties are differentiation (\( \mathcal{L}\{\dot{f}\} = sF(s) - f(0^-) \)) and integration (\( \mathcal{L}\{\int_0^t f\,d\tau\} = F(s)/s \)), which allow us to replace derivatives with multiplications by \( s \).

### 1.3.1 Initial and Final Value Theorems

<div class="theorem">
<strong>Initial Value Theorem.</strong> If \( F(s) \) is proper and has no poles on the imaginary axis or in the right half-plane, then

\[
\lim_{t \to 0^+} f(t) = \lim_{s \to \infty} s\,F(s).
\]

<strong>Final Value Theorem.</strong> If all poles of \( sF(s) \) lie in the open left half-plane (i.e., \( f(t) \) has a finite steady-state value), then

\[
\lim_{t \to \infty} f(t) = \lim_{s \to 0} s\,F(s).
\]
</div>

<div class="proof">
<strong>Derivation of the Final Value Theorem.</strong> Begin with the Laplace transform of the derivative:

\[
\mathcal{L}\{\dot{f}(t)\} = sF(s) - f(0^-) = \int_0^{\infty} \dot{f}(t)\,e^{-st}\,dt.
\]

Take the limit \( s \to 0 \) on both sides. The right side becomes

\[
\lim_{s \to 0} \int_0^{\infty} \dot{f}(t)\,e^{-st}\,dt = \int_0^{\infty} \dot{f}(t)\,dt = \lim_{t \to \infty} f(t) - f(0^-),
\]

provided the interchange of limit and integral is justified (which requires that the poles of \( sF(s) \) all lie in the open left half-plane, so that \( \dot{f}(t) \) is absolutely integrable). Therefore

\[
\lim_{s \to 0}\left[sF(s) - f(0^-)\right] = \lim_{t \to \infty} f(t) - f(0^-),
\]

giving \( \lim_{s \to 0} sF(s) = \lim_{t \to \infty} f(t) \). \( \square \)
</div>

<div class="example">
<strong>Example 1.1: Solving a Second-Order ODE by Laplace Transform.</strong>

Find the output \( y(t) \) of the system \( \ddot{y} + 3\dot{y} + 2y = u(t) \) with \( y(0) = \dot{y}(0) = 0 \) and unit step input \( u(t) = u_s(t) \).

<em>Solution.</em> Taking the Laplace transform with zero initial conditions:

\[
s^2 Y(s) + 3s\,Y(s) + 2Y(s) = \frac{1}{s}.
\]

Solving for \( Y(s) \):

\[
Y(s) = \frac{1}{s(s^2 + 3s + 2)} = \frac{1}{s(s+1)(s+2)}.
\]

Partial fractions: \( Y(s) = \frac{A}{s} + \frac{B}{s+1} + \frac{C}{s+2} \).

\[
A = \left.\frac{1}{(s+1)(s+2)}\right|_{s=0} = \frac{1}{2}, \quad B = \left.\frac{1}{s(s+2)}\right|_{s=-1} = -1, \quad C = \left.\frac{1}{s(s+1)}\right|_{s=-2} = \frac{1}{2}.
\]

Therefore \( y(t) = \frac{1}{2} - e^{-t} + \frac{1}{2}e^{-2t} \) for \( t \geq 0 \). The final value theorem confirms: \( \lim_{s \to 0} s \cdot Y(s) = \lim_{s \to 0} \frac{1}{(s+1)(s+2)} = \frac{1}{2} \). Indeed \( y(\infty) = \frac{1}{2} \).
</div>

---

# Chapter 2: Transfer Functions and Block Diagrams

## 2.1 The Transfer Function

<div class="definition">
<strong>Transfer Function.</strong> For a linear, time-invariant (LTI) system with all initial conditions zero, the transfer function \( G(s) \) is the ratio of the Laplace transform of the output to the Laplace transform of the input:

\[
G(s) = \frac{Y(s)}{U(s)}.
\]

Equivalently, \( G(s) \) is the Laplace transform of the system's impulse response \( g(t) \).
</div>

For a system governed by the \( n \)-th order ODE

\[
a_n y^{(n)} + a_{n-1} y^{(n-1)} + \cdots + a_0 y = b_m u^{(m)} + \cdots + b_0 u,
\]

the transfer function is

\[
G(s) = \frac{b_m s^m + b_{m-1} s^{m-1} + \cdots + b_0}{a_n s^n + a_{n-1} s^{n-1} + \cdots + a_0}.
\]

A transfer function is said to be *proper* if \( m \leq n \) and *strictly proper* if \( m < n \). Physical systems are generally strictly proper because real components cannot respond instantaneously.

## 2.2 Poles and Zeros

<div class="definition">
<strong>Poles and Zeros.</strong> The <em>zeros</em> of \( G(s) \) are the values of \( s \) for which \( G(s) = 0 \), i.e., the roots of the numerator polynomial. The <em>poles</em> of \( G(s) \) are the values of \( s \) for which \( G(s) \to \infty \), i.e., the roots of the denominator polynomial.
</div>

Poles dominate the transient behaviour of a system. A pole at \( s = -a \) (real, negative) contributes a decaying exponential \( e^{-at} \) to the output. A complex conjugate pole pair at \( s = -\sigma \pm j\omega_d \) contributes a damped sinusoid \( e^{-\sigma t}\sin(\omega_d t + \phi) \).

<div class="remark">
The gain factor \( K \) and the pole-zero locations together completely characterize an LTI transfer function. Writing \( G(s) = K\prod_i(s - z_i)/\prod_j(s - p_j) \), the system's natural frequencies are the poles \( p_j \) and its transmission zeros are \( z_i \). Zeros modify the shape of the transient but do not, by themselves, determine stability — that is the exclusive province of the poles.
</div>

## 2.3 Block-Diagram Reduction

Complex control systems are represented by block diagrams — signal flow graphs in which each block represents a transfer function and arrows represent signal paths. Block-diagram reduction converts a multi-block diagram into a single equivalent transfer function.

The three elementary configurations are:

**Series (cascade):** \( G_{\text{eq}}(s) = G_1(s)\,G_2(s) \).

**Parallel:** \( G_{\text{eq}}(s) = G_1(s) + G_2(s) \).

**Feedback loop:** With forward-path transfer function \( G(s) \) and feedback transfer function \( H(s) \):

\[
T(s) = \frac{G(s)}{1 + G(s)H(s)}.
\]

Additional rules include moving a summing junction past a block, moving a branch (pickoff) point past a block, and combining nested loops from the innermost outward.

<div class="example">
<strong>Example 2.1: Block-Diagram Reduction.</strong>

Reduce the following block diagram to a single transfer function. The forward path contains \( G_1(s) \) in series with \( G_2(s) \); there is a local unity-feedback loop around \( G_2(s) \) only; and an outer unity-feedback loop around the whole system.

<em>Solution.</em> Step 1 — reduce the inner loop around \( G_2 \):

\[
G_{2,\text{cl}}(s) = \frac{G_2(s)}{1 + G_2(s)}.
\]

Step 2 — the combined forward path is \( G_1(s) \cdot G_{2,\text{cl}}(s) \).

Step 3 — reduce the outer unity-feedback loop:

\[
T(s) = \frac{G_1 G_{2,\text{cl}}}{1 + G_1 G_{2,\text{cl}}} = \frac{G_1 G_2}{1 + G_2 + G_1 G_2}.
\]
</div>

## 2.4 First-Order System Step Response

The prototype first-order transfer function is

\[
G(s) = \frac{K}{\tau s + 1},
\]

where \( K \) is the DC gain and \( \tau \) is the time constant. For a unit step input the output is

\[
Y(s) = \frac{K}{s(\tau s + 1)}, \quad y(t) = K\left(1 - e^{-t/\tau}\right), \quad t \geq 0.
\]

The output reaches \( 63.2\% \) of its final value at \( t = \tau \), and is within \( 2\% \) of final value at \( t \approx 4\tau \). The *rise time* (10% to 90% of final value) is \( t_r \approx 2.2\tau \).

<div class="remark">
In Lab 1, fitting a first-order transfer function to the rotating disc step-response data amounts to finding the two parameters \( K \) and \( \tau \) that minimise some error metric (often the sum of squared residuals) between the model output and the measured angular velocity. A second-order model may be necessary if the disc bearing exhibits significant resonance.
</div>

---

# Chapter 3: Time-Domain System Response

## 3.1 The Standard Second-Order System

The vast majority of control specifications are written in terms of the step response of a second-order system. Understanding this prototype is therefore central to the entire subject.

<div class="definition">
<strong>Standard Second-Order Transfer Function.</strong> The unity-DC-gain second-order transfer function is

\[
G(s) = \frac{\omega_n^2}{s^2 + 2\zeta\omega_n s + \omega_n^2},
\]

where \( \omega_n > 0 \) is the <em>undamped natural frequency</em> and \( \zeta \geq 0 \) is the <em>damping ratio</em>.
</div>

The poles are located at

\[
s_{1,2} = -\zeta\omega_n \pm \omega_n\sqrt{\zeta^2 - 1}.
\]

Four regimes are distinguished by the value of \( \zeta \):

| Regime | Condition | Pole type |
|---|---|---|
| Underdamped | \( 0 < \zeta < 1 \) | Complex conjugate, \( s = -\sigma \pm j\omega_d \) |
| Critically damped | \( \zeta = 1 \) | Repeated real, \( s = -\omega_n \) |
| Overdamped | \( \zeta > 1 \) | Two distinct real poles |
| Undamped | \( \zeta = 0 \) | Pure imaginary, \( s = \pm j\omega_n \) |

In the underdamped case the *damped natural frequency* is \( \omega_d = \omega_n\sqrt{1-\zeta^2} \).

## 3.2 Step-Response Specifications

For a unit step input applied to the standard second-order system in the underdamped regime \( (0 < \zeta < 1) \):

\[
y(t) = 1 - \frac{e^{-\zeta\omega_n t}}{\sqrt{1-\zeta^2}}\sin\!\left(\omega_d t + \phi\right), \quad \phi = \arccos(\zeta).
\]

The four canonical performance metrics are:

**Rise time** (0% to 100%):

\[
t_r \approx \frac{1.8}{\omega_n} \quad \text{(for } 0.3 \leq \zeta \leq 0.8 \text{)}.
\]

**Peak time** (time of first overshoot peak):

\[
t_p = \frac{\pi}{\omega_d}.
\]

**Percent overshoot:**

\[
\%OS = 100\,\exp\!\left(\frac{-\pi\zeta}{\sqrt{1-\zeta^2}}\right).
\]

**Settling time** (2% criterion):

\[
t_s \approx \frac{4}{\zeta\omega_n}.
\]

<div class="remark">
These four metrics are coupled through \( \zeta \) and \( \omega_n \). Choosing \( \zeta = 0.707 \) (the Butterworth damping) gives roughly \( 4.3\% \) overshoot with a good balance between speed and damping. In SYDE lab work, specifications such as "overshoot less than 10% and settling time less than 2 s" translate directly into constraints on the allowable region for closed-loop poles — a critical bridge to root-locus design in Chapter 7.
</div>

<div class="example">
<strong>Example 3.1: Computing Step-Response Metrics.</strong>

A closed-loop system has transfer function \( T(s) = \frac{25}{s^2 + 6s + 25} \). Find \( \omega_n \), \( \zeta \), \%OS, \( t_p \), and \( t_s \).

<em>Solution.</em> Matching to the standard form: \( \omega_n^2 = 25 \Rightarrow \omega_n = 5 \) rad/s. Then \( 2\zeta\omega_n = 6 \Rightarrow \zeta = 0.6 \).

\[
\omega_d = 5\sqrt{1 - 0.36} = 5(0.8) = 4 \text{ rad/s}.
\]

\[
\%OS = 100\,\exp\!\left(\frac{-\pi(0.6)}{0.8}\right) = 100\,e^{-2.356} \approx 9.5\%.
\]

\[
t_p = \frac{\pi}{4} \approx 0.785 \text{ s}, \quad t_s \approx \frac{4}{0.6 \times 5} = 1.33 \text{ s}.
\]
</div>

## 3.3 Higher-Order Systems and Dominant Poles

Real plants have more than two poles. The standard approach is to identify a *dominant pole pair* — the pair closest to the imaginary axis — that controls the transient behaviour, and to treat the remaining poles as negligible provided they are at least five times further into the left half-plane.

<div class="definition">
<strong>Dominant Poles.</strong> The poles \( p_{d} \) of a closed-loop transfer function are called <em>dominant</em> if the remaining poles have real parts satisfying \( |\text{Re}(p_i)| \geq 5\,|\text{Re}(p_d)| \). The system then responds approximately as a second-order system with poles at \( p_d \).
</div>

Zeros near the dominant poles can significantly affect overshoot — a zero in the left half-plane close to the dominant pair increases overshoot, while a right-half-plane (non-minimum phase) zero causes an initial undershoot before the response rises.

<div class="example">
<strong>Example 3.2: Dominant Pole Approximation.</strong>

The closed-loop transfer function is

\[
T(s) = \frac{100}{(s^2 + 4s + 25)(s + 20)}.
\]

The third pole at \( s = -20 \) has \( |\text{Re}| = 20 \gg 5 \times 2 = 10 \), so the dominant pair is at \( s = -2 \pm j\sqrt{21} \). The approximate second-order parameters are \( \omega_n = 5 \), \( \zeta = 0.4 \).

The steady-state value from the final value theorem is \( \lim_{s\to 0} s \cdot T(s)/s = 100/(25 \times 20) = 0.2 \). A step input of magnitude 5 would be needed to drive the output to unity at steady state — illustrating that the DC gain here is not unity.
</div>

---

# Chapter 4: Stability Analysis — Routh-Hurwitz and Steady-State Performance

## 4.1 Stability of LTI Systems

<div class="definition">
<strong>BIBO Stability.</strong> A linear, time-invariant system is <em>bounded-input bounded-output (BIBO) stable</em> if every bounded input produces a bounded output. For a rational transfer function this is equivalent to requiring that all poles lie in the open left half of the complex plane (i.e., \( \text{Re}(p_i) < 0 \) for all poles \( p_i \)).
</div>

The characteristic equation of the closed-loop system is

\[
1 + C(s)\,G(s) = 0,
\]

or equivalently the denominator polynomial of \( T(s) \) set to zero. Stability depends entirely on the roots of this polynomial.

## 4.2 Routh-Hurwitz Criterion

Finding the exact roots of a high-degree polynomial is computationally intensive and, more importantly, does not give insight into how design parameters affect stability. The Routh-Hurwitz criterion determines stability without computing roots.

<div class="theorem">
<strong>Routh-Hurwitz Criterion.</strong> Consider the characteristic polynomial

\[
a_n s^n + a_{n-1} s^{n-1} + \cdots + a_1 s + a_0 = 0, \quad a_n > 0.
\]

Construct the Routh array: the first two rows are formed directly from the coefficients (even-indexed and odd-indexed terms), and subsequent rows are computed by the determinant rule. The number of roots in the open right half-plane equals the number of sign changes in the first column of the array. The system is stable if and only if all entries in the first column have the same sign.
</div>

**Constructing the Routh Array.** For a fourth-order polynomial \( a_4 s^4 + a_3 s^3 + a_2 s^2 + a_1 s + a_0 \):

\[
\begin{array}{c|cc}
s^4 & a_4 & a_2 & a_0 \\
s^3 & a_3 & a_1 & 0 \\
s^2 & b_1 & b_2 & 0 \\
s^1 & c_1 & 0 & \\
s^0 & d_1 & &
\end{array}
\]

where

\[
b_1 = \frac{a_3 a_2 - a_4 a_1}{a_3}, \quad b_2 = \frac{a_3 a_0 - a_4 \cdot 0}{a_3} = a_0,
\]

\[
c_1 = \frac{b_1 a_1 - a_3 b_2}{b_1}, \quad d_1 = a_0.
\]

<div class="proof">
<strong>First-column sign-change argument.</strong> The Routh-Hurwitz criterion can be understood through the factored form of the characteristic polynomial. Write

\[
p(s) = a_n \prod_{k=1}^{n} (s - s_k),
\]

where \( s_k \) are the roots. A necessary condition for all roots to have negative real parts is that all coefficients \( a_i \) share the same sign (since expanding a product of terms of the form \( (s + \alpha_k) \) with all \( \alpha_k > 0 \) produces strictly positive coefficients when \( a_n > 0 \)). This necessary condition is checked by inspection; it fails if any coefficient is zero or changes sign.

The Routh array operationalises the sufficient and necessary test by applying successive Gaussian elimination steps to a Bezout matrix built from \( p(s) \) and its derivative \( p'(s) \). Each row corresponds to a polynomial of reduced degree obtained by the elimination. A sign change in the first column arises exactly when a pivot changes sign, which is equivalent to the corresponding auxiliary polynomial having a root with positive real part. The formal proof via the Cauchy index and the argument principle is detailed in Franklin et al., §3.6. \( \square \)
</div>

<div class="example">
<strong>Example 4.1: Routh Array and Stability Range.</strong>

A unity-feedback system has forward path \( G(s) = K/[s(s+2)(s+4)] \). Find the range of \( K > 0 \) for which the closed-loop is stable.

<em>Solution.</em> The characteristic equation is \( 1 + G(s) = 0 \), i.e.,

\[
s(s+2)(s+4) + K = 0 \quad \Rightarrow \quad s^3 + 6s^2 + 8s + K = 0.
\]

Routh array:

\[
\begin{array}{c|cc}
s^3 & 1 & 8 \\
s^2 & 6 & K \\
s^1 & \frac{48 - K}{6} & 0 \\
s^0 & K &
\end{array}
\]

For stability: first column must all be positive. From row \( s^0 \): \( K > 0 \). From row \( s^1 \): \( 48 - K > 0 \Rightarrow K < 48 \). Therefore the system is stable for \( 0 < K < 48 \).

At exactly \( K = 48 \) the \( s^1 \) entry is zero, indicating roots on the imaginary axis. The auxiliary equation from the \( s^2 \) row is \( 6s^2 + 48 = 0 \Rightarrow s^2 = -8 \Rightarrow s = \pm j2\sqrt{2} \), which confirms sustained oscillation at \( \omega = 2\sqrt{2} \) rad/s at the stability boundary.
</div>

## 4.3 Steady-State Error and System Type

Even a stable closed-loop system may exhibit a permanent offset between the reference and the output. Quantifying this offset is the goal of steady-state error analysis.

For a unity-feedback system with open-loop transfer function \( G(s) \) and input \( R(s) \), the steady-state error is

\[
e_{ss} = \lim_{s \to 0} s \cdot E(s) = \lim_{s \to 0} s \cdot \frac{R(s)}{1 + G(s)}.
\]

<div class="definition">
<strong>System Type.</strong> The <em>type number</em> of a control system is the number of pure integrators (poles at \( s = 0 \)) in the open-loop transfer function \( G(s) \). A Type 0 system has no integrators; Type 1 has one; Type 2 has two.
</div>

The error constants are defined as:

\[
K_p = \lim_{s\to 0} G(s) \quad \text{(position constant)}, \qquad K_v = \lim_{s\to 0} s\,G(s) \quad \text{(velocity constant)}, \qquad K_a = \lim_{s\to 0} s^2 G(s) \quad \text{(acceleration constant)}.
\]

<div class="proof">
<strong>Steady-state error for unit step and unit ramp inputs.</strong>

For a unit step \( R(s) = 1/s \):

\[
e_{ss} = \lim_{s\to 0} \frac{s \cdot (1/s)}{1 + G(s)} = \lim_{s\to 0} \frac{1}{1 + G(s)} = \frac{1}{1 + K_p}.
\]

For a Type 0 system, \( G(0) = K_p \) is finite, so \( e_{ss} = 1/(1 + K_p) \neq 0 \). For a Type 1 (or higher) system, \( G(s) \to \infty \) as \( s \to 0 \), so \( K_p = \infty \) and \( e_{ss} = 0 \). This confirms that a single integrator in the forward path eliminates steady-state error to a step.

For a unit ramp \( R(s) = 1/s^2 \):

\[
e_{ss} = \lim_{s\to 0} \frac{s \cdot (1/s^2)}{1 + G(s)} = \lim_{s\to 0} \frac{1}{s + sG(s)} = \frac{1}{\lim_{s\to 0} sG(s)} = \frac{1}{K_v}.
\]

For a Type 0 system \( K_v = 0 \), so \( e_{ss} = \infty \) (ramp error grows without bound). For a Type 1 system \( K_v \) is finite, giving constant ramp error \( 1/K_v \). For Type 2 or higher, \( K_v = \infty \) and ramp error is zero. \( \square \)
</div>

The complete table of steady-state errors:

| Input | Type 0 | Type 1 | Type 2 |
|---|---|---|---|
| Step | \( 1/(1+K_p) \) | 0 | 0 |
| Ramp | \( \infty \) | \( 1/K_v \) | 0 |
| Parabola | \( \infty \) | \( \infty \) | \( 1/K_a \) |

## 4.4 Sensitivity and Disturbance Rejection

Two of the most important benefits of feedback — sensitivity reduction and disturbance rejection — can be quantified precisely.

**Sensitivity to plant gain variations.** Define the *sensitivity function*

\[
S(s) = \frac{1}{1 + C(s)G(s)}.
\]

The fractional change in the closed-loop transfer function \( T \) relative to the fractional change in the plant \( G \) is

\[
S_G^T = \frac{\partial T/T}{\partial G/G} = S(s) = \frac{1}{1 + CG}.
\]

For large loop gain \( |CG| \gg 1 \), \( |S| \ll 1 \): feedback dramatically reduces the sensitivity to plant variation — the core argument for using feedback.

**Disturbance rejection.** If a disturbance \( D(s) \) enters at the plant input, the output response to the disturbance alone is

\[
Y_D(s) = \frac{G(s)}{1 + C(s)G(s)}\,D(s) = S(s)\,G(s)\,D(s).
\]

Again, large loop gain suppresses disturbance response.

<div class="example">
<strong>Example 4.2: System Type and Error Constants.</strong>

The open-loop transfer function is \( G(s) = \frac{10(s+2)}{s(s+5)(s+10)} \). Determine the system type and compute all error constants.

<em>Solution.</em> There is one pole at \( s = 0 \), so this is a <em>Type 1</em> system.

\[
K_p = \lim_{s\to 0} G(s) = \infty \quad \Rightarrow \quad e_{ss,\text{step}} = 0.
\]

\[
K_v = \lim_{s\to 0} sG(s) = \lim_{s\to 0} \frac{10(s+2)}{(s+5)(s+10)} = \frac{10 \times 2}{5 \times 10} = 0.4.
\]

\[
K_a = \lim_{s\to 0} s^2 G(s) = 0 \quad \Rightarrow \quad e_{ss,\text{parabola}} = \infty.
\]

For a unit ramp, \( e_{ss} = 1/K_v = 2.5 \).
</div>

---

# Chapter 5: State-Space Representation

## 5.1 State Variables and the State-Space Model

Transfer functions describe systems from an input-output perspective and are sufficient for many classical design problems. However, they conceal the internal dynamics of a system, cannot directly represent multi-input multi-output (MIMO) plants, and do not immediately reveal properties such as controllability and observability that are critical for modern control. The state-space representation addresses all of these limitations.

<div class="definition">
<strong>State-Space Model.</strong> A linear, time-invariant system can be described by the first-order vector ODE

\[
\dot{\mathbf{x}}(t) = A\mathbf{x}(t) + B\mathbf{u}(t),
\]
\[
\mathbf{y}(t) = C\mathbf{x}(t) + D\mathbf{u}(t),
\]

where \( \mathbf{x}(t) \in \mathbb{R}^n \) is the <em>state vector</em>, \( \mathbf{u}(t) \in \mathbb{R}^p \) is the input, \( \mathbf{y}(t) \in \mathbb{R}^q \) is the output, \( A \in \mathbb{R}^{n \times n} \) is the <em>system matrix</em>, \( B \in \mathbb{R}^{n \times p} \) is the <em>input matrix</em>, \( C \in \mathbb{R}^{q \times n} \) is the <em>output matrix</em>, and \( D \in \mathbb{R}^{q \times p} \) is the <em>feedthrough matrix</em>.
</div>

The state \( \mathbf{x}(t) \) encodes all past history of the system needed to determine future outputs given future inputs. For a mechanical system the natural state variables are positions and velocities; for electrical circuits they are capacitor voltages and inductor currents.

## 5.2 Conversion Between Transfer Function and State Space

<div class="proof">
<strong>State-space to transfer function conversion.</strong> Starting from the state-space equations with zero initial conditions, take the Laplace transform:

\[
s\mathbf{X}(s) = A\mathbf{X}(s) + B\mathbf{U}(s) \quad \Rightarrow \quad \mathbf{X}(s) = (sI - A)^{-1} B\,\mathbf{U}(s).
\]

Substituting into the output equation:

\[
\mathbf{Y}(s) = C\mathbf{X}(s) + D\mathbf{U}(s) = \left[C(sI - A)^{-1}B + D\right]\mathbf{U}(s).
\]

Therefore the transfer function matrix is

\[
G(s) = C(sI - A)^{-1}B + D.
\]

For a SISO system this reduces to a scalar rational function. The poles of \( G(s) \) are the eigenvalues of \( A \) (the roots of \( \det(sI - A) = 0 \)), confirming that stability in state-space and transfer-function formulations are equivalent when the system is both controllable and observable. \( \square \)
</div>

### 5.2.1 Controller Canonical Form

Given the transfer function

\[
G(s) = \frac{b_{n-1}s^{n-1} + \cdots + b_0}{s^n + a_{n-1}s^{n-1} + \cdots + a_0},
\]

the *controller canonical form* (companion form) is:

\[
A = \begin{bmatrix} 0 & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & & & \ddots & \vdots \\ -a_0 & -a_1 & -a_2 & \cdots & -a_{n-1} \end{bmatrix}, \quad B = \begin{bmatrix} 0 \\ 0 \\ \vdots \\ 1 \end{bmatrix},
\]

\[
C = \begin{bmatrix} b_0 & b_1 & \cdots & b_{n-1} \end{bmatrix}, \quad D = 0.
\]

This representation is particularly useful for pole-placement design because the characteristic polynomial coefficients appear explicitly in the last row of \( A \).

<div class="example">
<strong>Example 5.1: State-Space from Transfer Function.</strong>

Find a state-space representation for \( G(s) = \frac{2s + 5}{s^2 + 3s + 2} \).

<em>Solution.</em> Using controller canonical form with \( n = 2 \), \( a_0 = 2 \), \( a_1 = 3 \), \( b_0 = 5 \), \( b_1 = 2 \):

\[
A = \begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix}, \quad B = \begin{bmatrix} 0 \\ 1 \end{bmatrix}, \quad C = \begin{bmatrix} 5 & 2 \end{bmatrix}, \quad D = 0.
\]

Verification: \( C(sI - A)^{-1}B = \begin{bmatrix} 5 & 2 \end{bmatrix} \frac{1}{s^2+3s+2}\begin{bmatrix} s+3 & 1 \\ -2 & s \end{bmatrix}\begin{bmatrix}0\\1\end{bmatrix} = \frac{5 + 2s}{s^2 + 3s + 2} \). Confirmed.
</div>

## 5.3 Controllability and Observability

These two concepts — introduced by Rudolf Kalman in 1960 — determine whether a state-space model is internally adequate for control and estimation.

<div class="definition">
<strong>Controllability.</strong> The system \( (\dot{\mathbf{x}} = A\mathbf{x} + B\mathbf{u}) \) is <em>controllable</em> if for any initial state \( \mathbf{x}(0) \) and any desired final state \( \mathbf{x}_f \), there exists a finite-time input \( \mathbf{u}(t) \) that drives the system from \( \mathbf{x}(0) \) to \( \mathbf{x}_f \).

<strong>Observability.</strong> The system \( (\dot{\mathbf{x}} = A\mathbf{x},\ \mathbf{y} = C\mathbf{x}) \) is <em>observable</em> if, from knowledge of the input and output over a finite time interval, the initial state \( \mathbf{x}(0) \) can be uniquely determined.
</div>

<div class="theorem">
<strong>Kalman Rank Conditions.</strong>

The system \( (A, B) \) is controllable if and only if the <em>controllability matrix</em>

\[
\mathcal{C} = \left[ B \mid AB \mid A^2 B \mid \cdots \mid A^{n-1}B \right]
\]

has rank \( n \).

The system \( (A, C) \) is observable if and only if the <em>observability matrix</em>

\[
\mathcal{O} = \left[ C^\top \mid A^\top C^\top \mid (A^\top)^2 C^\top \mid \cdots \mid (A^\top)^{n-1} C^\top \right]^\top
\]

has rank \( n \).
</div>

<div class="remark">
<strong>Physical meaning.</strong> A system that is not controllable has at least one mode (eigenvalue) of \( A \) that cannot be affected by the input — the actuator is physically disconnected from that mode. A system that is not observable has at least one mode that is invisible to the sensor. In controller design this matters greatly: uncontrollable stable modes are benign (they die out), but uncontrollable unstable modes are catastrophic — no controller can stabilize them. Similarly, unobservable unstable modes prevent state estimation.

For the rotating disc and inverted pendulum plants in SYDE labs, the plants are designed to be both controllable and observable, but a mis-chosen set of state variables (e.g., measuring the angle but not its rate) could render the inverted pendulum unobservable from sensor data alone, making state estimation (and hence stabilization via state feedback) impossible without additional sensors or an observer.
</div>

<div class="example">
<strong>Example 5.2: Controllability Check.</strong>

Check controllability of the system

\[
A = \begin{bmatrix} -1 & 0 \\ 0 & -2 \end{bmatrix}, \quad B = \begin{bmatrix} 1 \\ 0 \end{bmatrix}.
\]

<em>Solution.</em>

\[
\mathcal{C} = \left[ B \mid AB \right] = \begin{bmatrix} 1 & -1 \\ 0 & 0 \end{bmatrix}.
\]

\( \text{rank}(\mathcal{C}) = 1 < 2 = n \). The system is <strong>not controllable</strong>. The second state \( x_2 \) (with mode \( e^{-2t} \)) is invisible to the input — physically, the actuator couples only into the first subsystem.
</div>

## 5.4 Solution of the State Equation

The solution of \( \dot{\mathbf{x}} = A\mathbf{x} + B\mathbf{u} \) with initial condition \( \mathbf{x}(0) \) is

\[
\mathbf{x}(t) = e^{At}\mathbf{x}(0) + \int_0^t e^{A(t-\tau)} B\mathbf{u}(\tau)\,d\tau,
\]

where the *matrix exponential* \( e^{At} = I + At + \frac{(At)^2}{2!} + \cdots \) is the *state transition matrix*. The eigenvalues of \( A \) determine the natural frequencies of the state trajectories, mirroring the pole locations in the transfer-function framework.

---

# Chapter 6: PID Control and Ziegler-Nichols Tuning

## 6.1 The PID Controller

The Proportional-Integral-Derivative (PID) controller is the workhorse of industrial process control. It is estimated that more than 90% of all control loops in manufacturing use PID. Its enduring popularity stems from its intuitive structure, ease of tuning, and adequate performance across a vast range of plants.

<div class="definition">
<strong>PID Controller.</strong> In the time domain the PID control law is

\[
u(t) = K_p\,e(t) + K_i\int_0^t e(\tau)\,d\tau + K_d\,\dot{e}(t),
\]

where \( K_p \) is the proportional gain, \( K_i \) is the integral gain, and \( K_d \) is the derivative gain. The corresponding transfer function is

\[
C(s) = K_p + \frac{K_i}{s} + K_d s = \frac{K_d s^2 + K_p s + K_i}{s}.
\]
</div>

Alternative parameterizations use the integral time \( T_i = K_p/K_i \) and derivative time \( T_d = K_d/K_p \):

\[
C(s) = K_p\left(1 + \frac{1}{T_i s} + T_d s\right).
\]

**Proportional action** reduces steady-state error but cannot eliminate it (except for Type 1+ plants). Increasing \( K_p \) speeds response but reduces stability margins.

**Integral action** adds a pole at the origin, raising system type by one and eliminating steady-state error to step inputs. The penalty is a tendency toward overshoot and oscillation — *integral windup* occurs when the integrator saturates while the plant is in saturation.

**Derivative action** provides phase lead, anticipating the error trend and damping oscillations. It amplifies high-frequency noise, which is why practical implementations use a *filtered derivative*: \( K_d s / (\tau_f s + 1) \).

## 6.2 Effects of Each Term on Response

| Action | Rise time | Overshoot | Settling time | Steady-state error |
|---|---|---|---|---|
| Increase \( K_p \) | Decreases | Increases | Slight change | Decreases |
| Increase \( K_i \) | Decreases | Increases | Increases | Eliminated |
| Increase \( K_d \) | Slight change | Decreases | Decreases | No effect |

## 6.3 Ziegler-Nichols Tuning Rules

Two classical tuning methods are due to Ziegler and Nichols (1942), based on characterising the plant by a small number of parameters obtained from a simple experiment.

### 6.3.1 Step-Response Method (Reaction Curve)

Apply a step input to the open-loop plant and fit a first-order plus dead-time (FOPDT) model:

\[
G(s) \approx \frac{K_{\text{dc}}}{Ts + 1}\,e^{-Ls},
\]

where \( L \) is the apparent dead time and \( T \) is the time constant obtained by drawing a tangent to the inflection point of the step response.

Ziegler-Nichols step-response tuning formulas:

| Controller | \( K_p \) | \( T_i \) | \( T_d \) |
|---|---|---|---|
| P | \( T/(K_{\text{dc}}L) \) | — | — |
| PI | \( 0.9\,T/(K_{\text{dc}}L) \) | \( 3.33\,L \) | — |
| PID | \( 1.2\,T/(K_{\text{dc}}L) \) | \( 2L \) | \( 0.5L \) |

### 6.3.2 Ultimate Gain Method

Close the loop with proportional control only and increase \( K_p \) until sustained oscillations occur. The value of gain at that point is the *ultimate gain* \( K_u \) and the period of oscillation is the *ultimate period* \( P_u = 2\pi/\omega_u \).

| Controller | \( K_p \) | \( T_i \) | \( T_d \) |
|---|---|---|---|
| P | \( 0.5\,K_u \) | — | — |
| PI | \( 0.45\,K_u \) | \( 0.83\,P_u \) | — |
| PID | \( 0.6\,K_u \) | \( 0.5\,P_u \) | \( 0.125\,P_u \) |

<div class="remark">
<strong>Lab 2 connection.</strong> In the SYDE lab, having identified the rotating disc transfer function in Lab 1, the PID design in Lab 2 can start with Ziegler-Nichols to get an initial set of parameters, then refine them using the MATLAB Control System Designer to meet the exact overshoot and settling-time specifications. Comparing Ziegler-Nichols performance against the hand-tuned result is instructive: ZN often gives about 25–35% overshoot, which may violate typical spec constraints and requires manual adjustment of \( K_d \) to add more damping.
</div>

<div class="example">
<strong>Example 6.1: Ziegler-Nichols Tuning.</strong>

A plant has step-response parameters \( K_{\text{dc}} = 2 \), \( T = 8 \) s, \( L = 1 \) s. Design a PID controller using the step-response Ziegler-Nichols rules.

<em>Solution.</em>

\[
K_p = \frac{1.2 T}{K_{\text{dc}} L} = \frac{1.2 \times 8}{2 \times 1} = 4.8.
\]

\[
T_i = 2L = 2 \text{ s} \quad \Rightarrow \quad K_i = \frac{K_p}{T_i} = 2.4.
\]

\[
T_d = 0.5L = 0.5 \text{ s} \quad \Rightarrow \quad K_d = K_p T_d = 2.4.
\]

The PID transfer function is:

\[
C(s) = \frac{2.4 s^2 + 4.8 s + 2.4}{s} = \frac{2.4(s+1)^2}{s}.
\]
</div>

---

# Chapter 7: Root-Locus Analysis and Design

## 7.1 Concept and Definition

The root-locus method, introduced by W.R. Evans in 1948, provides a graphical picture of how the closed-loop poles of a system move in the complex plane as a parameter (typically the loop gain \( K \)) varies from zero to infinity. This geometric insight is invaluable for design: instead of solving the characteristic equation for each value of \( K \), we sketch the entire trajectory in one operation.

For the standard closed-loop system with open-loop transfer function \( KG(s)H(s) \), the closed-loop characteristic equation is

\[
1 + KG(s)H(s) = 0 \quad \Rightarrow \quad G(s)H(s) = -\frac{1}{K}.
\]

A point \( s \) lies on the root locus (for \( K \geq 0 \)) if and only if:

\[
\angle G(s)H(s) = \pm 180°(2k+1), \quad k = 0, 1, 2, \ldots \quad \text{(angle condition)},
\]

\[
K = \frac{1}{|G(s)H(s)|} \quad \text{(magnitude condition)}.
\]

## 7.2 Rules for Constructing the Root Locus

<div class="theorem">
<strong>Root-Locus Construction Rules.</strong> Let \( G(s)H(s) \) have \( n \) poles (at \( p_1, \ldots, p_n \)) and \( m \) zeros (at \( z_1, \ldots, z_m \)), with \( n \geq m \).

<strong>Rule 1 — Number of branches:</strong> The root locus has \( n \) branches, one for each closed-loop pole.

<strong>Rule 2 — Starting and ending points:</strong> As \( K \to 0 \), branches begin at the open-loop poles. As \( K \to \infty \), \( m \) branches terminate at the open-loop zeros; the remaining \( n - m \) branches go to infinity.

<strong>Rule 3 — Real-axis segments:</strong> A point on the real axis lies on the root locus if and only if the total number of real poles and zeros to its right is odd.

<strong>Rule 4 — Asymptotes:</strong> The \( n - m \) branches going to infinity do so along asymptotes with angles

\[
\phi_k = \frac{(2k+1)\cdot 180°}{n - m}, \quad k = 0, 1, \ldots, n - m - 1,
\]

centred at the real-axis intersection point (centroid)

\[
\sigma_a = \frac{\sum p_i - \sum z_j}{n - m}.
\]

<strong>Rule 5 — Breakaway and break-in points:</strong> These occur at points where \( dK/ds = 0 \), i.e., at the roots of \( \frac{d}{ds}\left[\frac{1}{G(s)H(s)}\right] = 0 \).

<strong>Rule 6 — Imaginary-axis crossings:</strong> Found by substituting \( s = j\omega \) into the characteristic equation and solving for \( \omega \) and the corresponding \( K \) (or equivalently, from the Routh array by finding the auxiliary equation).

<strong>Rule 7 — Departure angles from complex poles:</strong> The departure angle from a complex pole \( p_i \) is

\[
\phi_d = 180° - \left(\sum \angle (p_i - z_j) - \sum_{k \neq i} \angle (p_i - p_k)\right).
\]
</div>

<div class="example">
<strong>Example 7.1: Root Locus Sketch.</strong>

Sketch the root locus for \( G(s) = \frac{K}{s(s+2)(s+4)} \).

<em>Solution.</em> Poles at \( s = 0, -2, -4 \); no finite zeros; \( n = 3, m = 0 \).

Rule 2: all three branches go to infinity.

Rule 3: Real-axis locus exists for \( s < -4 \) (3 poles to right: odd) and \( -2 < s < 0 \) (1 pole to right: odd).

Rule 4: Three asymptotes at angles \( 60°, 180°, 300° \) (i.e., \( \pm 60° \) and \( 180° \)), centred at

\[
\sigma_a = \frac{0 + (-2) + (-4)}{3} = -2.
\]

Rule 5: Breakaway point — solve \( \frac{d}{ds}[s(s+2)(s+4)] = 0 \Rightarrow 3s^2 + 12s + 8 = 0 \Rightarrow s = \frac{-12 \pm \sqrt{144-96}}{6} = -2 \pm \frac{\sqrt{48}}{6} \approx -0.845 \text{ and } -3.155 \).

Only \( s \approx -0.845 \) lies on the locus (between \( 0 \) and \( -2 \)); it is the breakaway point. The branch at \( s \approx -3.155 \) does not lie on the locus.

Rule 6: From Example 4.1 the imaginary-axis crossing is at \( s = \pm j2\sqrt{2} \) when \( K = 48 \).

Assembling these facts gives a complete qualitative root locus: two branches start at \( s = 0 \) and \( s = -2 \), meet at \( s \approx -0.845 \), then diverge along the \( \pm 60° \) asymptotes; the third branch starts at \( s = -4 \) and goes left along the negative real axis toward \( -\infty \).
</div>

## 7.3 Controller Design Using Root Locus

Given a desired dominant closed-loop pole location \( s_d \), we need a controller whose presence shifts the root locus so that it passes through \( s_d \).

**Gain adjustment alone:** If \( s_d \) already lies on the uncompensated locus, simply find the gain from the magnitude condition:

\[
K = \frac{1}{|G(s_d)|}.
\]

**Phase addition via a lead compensator:** If \( s_d \) is not on the uncompensated locus, the angle deficiency \( \phi_{\text{def}} \) must be supplied by the compensator. A lead compensator \( C(s) = (s+z_c)/(s+p_c) \) with \( p_c > z_c \) adds positive phase; placement of its zero and pole is chosen to provide exactly \( \phi_{\text{def}} \) at \( s_d \).

<div class="example">
<strong>Example 7.2: Root-Locus Controller Design.</strong>

Design a proportional controller to achieve \( \zeta = 0.707 \) (i.e., \%OS \( \approx 4.3\% \)) for the plant \( G(s) = \frac{1}{s(s+3)} \).

<em>Solution.</em> The desired pole locations are at angle \( \theta = \arccos(0.707) = 45° \) from the negative real axis. With no particular \( \omega_n \) specified we find where the existing locus intersects the \( 45° \) line. The closed-loop poles satisfy \( s^2 + 3s + K = 0 \). On the \( 45° \) line, \( s = -a \pm ja \) for some \( a > 0 \).

Substituting: \( (-a + ja)^2 + 3(-a + ja) + K = 0 \).

Substituting \( s = -\sigma + j\sigma \) (so that \( \zeta = 1/\sqrt{2} \approx 0.707 \), making real and imaginary parts equal in magnitude), and solving for \( K \) and \( \sigma \). Let \( s = -\sigma + j\sigma \) (for \( \zeta = 0.707 \), real and imaginary parts equal in magnitude). Then

\[
s^2 + 3s + K = -2j\sigma^2 + 3(-\sigma + j\sigma) + K

\]

Directly: \( s^2 = \sigma^2((-1+j)^2) = \sigma^2(-2j - 0) = -2j\sigma^2\). Hmm — let us just set \( s = -\sigma + j\sigma \):

\[
s^2 = \sigma^2 - 2j\sigma^2 - \sigma^2 = -2j\sigma^2.
\]

Actually \( (-\sigma + j\sigma)^2 = \sigma^2 - 2j\sigma^2 - \sigma^2 = -2j\sigma^2 \). Then:

Imaginary part of characteristic equation: \( -2\sigma^2 + 3\sigma = 0 \Rightarrow \sigma(3 - 2\sigma) = 0 \Rightarrow \sigma = 1.5 \).

Real part: \( 0 + K = 0 + K \) — wait, real part of \( s^2 \) is \( -\sigma^2 - \sigma^2 = ...\). Let us recalculate: \( s = -1.5 + j1.5 \). Then \( s^2 = (-1.5)^2 - (1.5)^2 + 2(-1.5)(j1.5) = 0 - j4.5 \). Characteristic eq: \( (0 - j4.5) + 3(-1.5 + j1.5) + K = 0 \Rightarrow (0 - 4.5 + K) + j(-4.5 + 4.5) = 0 \). Imaginary: 0. Real: \( K = 4.5 \).

So \( K = 4.5 \) places the closed-loop poles at \( s = -1.5 \pm j1.5 \), giving \( \omega_n = 1.5\sqrt{2} \approx 2.12 \) rad/s and \( \zeta = 0.707 \). Settling time \( t_s \approx 4/(0.707 \times 2.12) \approx 2.67 \) s.
</div>

---

# Chapter 8: Frequency-Domain Analysis — Bode and Nyquist

## 8.1 Frequency Response

For a stable LTI system with transfer function \( G(s) \), the *frequency response* \( G(j\omega) \) describes how the system responds to sinusoidal inputs \( u(t) = U_0\sin(\omega t) \). The steady-state output is

\[
y_{ss}(t) = U_0|G(j\omega)|\sin\!\left(\omega t + \angle G(j\omega)\right).
\]

Thus \( |G(j\omega)| \) is the gain and \( \angle G(j\omega) \) is the phase shift at each frequency \( \omega \). Plotting these versus frequency is the *Bode diagram*.

## 8.2 Bode Diagrams

A Bode diagram consists of two plots on a logarithmic frequency axis:

1. **Magnitude plot:** \( 20\log_{10}|G(j\omega)| \) in decibels (dB) vs. \( \log_{10}(\omega) \).
2. **Phase plot:** \( \angle G(j\omega) \) in degrees vs. \( \log_{10}(\omega) \).

The power of the Bode diagram lies in the fact that a transfer function expressed as a product of elementary factors has a magnitude plot that is simply the *sum* of the individual magnitude plots (because \( 20\log_{10}|G_1 G_2| = 20\log_{10}|G_1| + 20\log_{10}|G_2| \)).

### 8.2.1 Elementary Bode Factors

**Constant gain \( K \):** Horizontal line at \( 20\log_{10}K \) dB; zero phase.

**Integrator \( 1/s \):** Slope \( -20 \) dB/decade passing through 0 dB at \( \omega = 1 \) rad/s; phase \( = -90° \).

**Differentiator \( s \):** Slope \( +20 \) dB/decade; phase \( = +90° \).

**First-order factor \( 1/(1 + s/\omega_b) \):** Asymptotic magnitude is 0 dB for \( \omega \ll \omega_b \) and \( -20 \) dB/decade for \( \omega \gg \omega_b \), with corner at \( \omega = \omega_b \) (actual: \( -3 \) dB at corner). Phase transitions from \( 0° \) to \( -90° \) over two decades centred at \( \omega_b \): \( \phi = -\arctan(\omega/\omega_b) \).

**Second-order factor \( \omega_n^2/(s^2 + 2\zeta\omega_n s + \omega_n^2) \):** For \( \omega \ll \omega_n \) the magnitude is 0 dB; for \( \omega \gg \omega_n \) the slope is \( -40 \) dB/decade. At \( \omega = \omega_n \) there is a resonance peak of \( 1/(2\zeta) \) (in linear scale) for small \( \zeta \). Phase goes from \( 0° \) to \( -180° \).

<div class="example">
<strong>Example 8.1: Bode Diagram Construction.</strong>

Sketch the Bode diagram for

\[
G(s) = \frac{10(s + 2)}{s(s + 10)}.
\]

<em>Solution.</em> Write in standard form by factoring out constants:

\[
G(s) = \frac{10 \cdot 2 \cdot (1 + s/2)}{1 \cdot 10 \cdot s(1 + s/10)} = \frac{2(1 + s/2)}{s(1 + s/10)}.
\]

The factors are: constant gain \( 20\log_{10}(2) = 6.02 \) dB; integrator \( 1/s \): slope \( -20 \) dB/dec, phase \( -90° \); zero at \( \omega = 2 \): \( +20 \) dB/dec slope above \( \omega = 2 \), phase \( +90° \) transition; pole at \( \omega = 10 \): \( -20 \) dB/dec slope above \( \omega = 10 \), phase \( -90° \) transition.

Net magnitude: for \( \omega < 2 \), slope \( = -20 \) dB/dec; for \( 2 < \omega < 10 \), slope \( = 0 \) dB/dec; for \( \omega > 10 \), slope \( = -20 \) dB/dec. Net phase: starts at \( -90° \), rises toward \( 0° \) through the zero corner, then falls back toward \( -90° \) through the pole corner.
</div>

## 8.3 Gain and Phase Margins

<div class="definition">
<strong>Gain Margin and Phase Margin.</strong>

The <em>phase crossover frequency</em> \( \omega_{pc} \) is defined by \( \angle G(j\omega_{pc})H(j\omega_{pc}) = -180° \). The <em>gain margin</em> (GM) is

\[
GM = -20\log_{10}|G(j\omega_{pc})H(j\omega_{pc})| \quad \text{(in dB)}.
\]

The <em>gain crossover frequency</em> \( \omega_{gc} \) is defined by \( |G(j\omega_{gc})H(j\omega_{gc})| = 1 \) (0 dB). The <em>phase margin</em> (PM) is

\[
PM = 180° + \angle G(j\omega_{gc})H(j\omega_{gc}).
\]

A system is stable (for minimum-phase plants) when both GM \( > 0 \) dB and PM \( > 0° \).
</div>

Typical design targets for robust control: GM \( \geq 6 \) dB and PM \( \geq 45° \). These margins are not merely mathematical conveniences — they are engineering safety factors that account for unmodelled dynamics, parameter drift, and nonlinearities.

<div class="remark">
Phase margin and damping ratio are related approximately by \( PM \approx 100\zeta \) degrees (for \( 0.3 \leq \zeta \leq 0.8 \)), so a PM of \( 45° \) corresponds to roughly \( \zeta \approx 0.45 \). This link between frequency-domain margins and time-domain damping is one of the most useful cross-domain relationships in the course.
</div>

## 8.4 Resonant Peak and Bandwidth

For a second-order system the *resonant frequency* is

\[
\omega_r = \omega_n\sqrt{1 - 2\zeta^2}, \quad \zeta < \frac{1}{\sqrt{2}} \approx 0.707,
\]

and the *resonant peak magnification* (peak value of \( |T(j\omega)| \)) is

\[
M_r = \frac{1}{2\zeta\sqrt{1-\zeta^2}}.
\]

The *bandwidth* \( \omega_B \) (where \( |T(j\omega_B)| = 1/\sqrt{2} \) of the DC gain) is

\[
\omega_B = \omega_n\sqrt{1 - 2\zeta^2 + \sqrt{4\zeta^4 - 4\zeta^2 + 2}}.
\]

For a first-order system with time constant \( \tau \), the bandwidth is simply \( \omega_B = 1/\tau \).

## 8.5 Polar Plots and the Nyquist Criterion

A *polar plot* (Nyquist plot) is the locus of \( G(j\omega)H(j\omega) \) in the complex plane as \( \omega \) varies from \( -\infty \) to \( +\infty \). Because real systems have conjugate-symmetric frequency responses, the full plot is the reflection of the \( \omega > 0 \) portion about the real axis.

<div class="theorem">
<strong>Nyquist Stability Criterion.</strong> Let the open-loop transfer function \( L(s) = C(s)G(s)H(s) \) have \( P \) poles in the open right half-plane (RHP). If the Nyquist contour (a large D-shaped contour enclosing the entire RHP) maps under \( L(s) \) to a contour that encircles the \( -1 + j0 \) point \( N \) times clockwise, then the number of closed-loop poles in the RHP is

\[
Z = N + P.
\]

The closed-loop system is stable if and only if \( Z = 0 \), i.e., \( N = -P \) (the Nyquist plot encircles \( -1 \) exactly \( P \) times counterclockwise).
</div>

<div class="remark">
For the common case of an open-loop stable plant (\( P = 0 \)), the Nyquist criterion simplifies to: the closed-loop is stable if and only if the Nyquist plot does not encircle \( -1 + j0 \). The gain and phase margins read directly from the Nyquist plot: GM is the reciprocal of the magnitude at the point where the plot crosses the negative real axis; PM is the angle between the negative real axis and the vector to the \( -1 \) point from the origin, measured at the point where the plot crosses the unit circle.
</div>

<div class="example">
<strong>Example 8.2: Nyquist Analysis.</strong>

Sketch the Nyquist plot and determine stability for \( L(s) = \frac{K}{s(s+1)(s+2)} \), \( K = 3 \).

<em>Solution.</em> \( L(j\omega) = \frac{3}{j\omega(j\omega + 1)(j\omega + 2)} \). At \( \omega = 0^+ \), \( |L| \to \infty \) at angle \( -90° \) (from the single integrator). At \( \omega \to \infty \), \( |L| \to 0 \) at \( -270° \).

Phase crossover: \( \angle L(j\omega) = -90° - \arctan(\omega) - \arctan(\omega/2) = -180° \Rightarrow \arctan(\omega) + \arctan(\omega/2) = 90° \). Taking tangent of both sides: \( \omega\cdot\frac{\omega}{2}\cdot 1 - 1 = 0 \) (from \( \tan(\alpha + \beta) \to \infty \)): \( \omega^2/2 = 1 \Rightarrow \omega = \sqrt{2} \).

At \( \omega = \sqrt{2} \): \( |L(j\sqrt{2})| = \frac{3}{\sqrt{2}\cdot\sqrt{3}\cdot\sqrt{6}} = \frac{3}{\sqrt{36}} = \frac{3}{6} = 0.5 \).

The Nyquist plot crosses the negative real axis at \( -0.5 \). Since \( |-0.5| < 1 \), the plot does not encircle \( -1 \). With \( P = 0 \) poles in RHP, \( N = 0 \), \( Z = 0 \): the closed-loop is stable.

GM \( = 1/0.5 = 2\), i.e., \( 20\log_{10}(2) \approx 6 \) dB. (Note: \( K = 6 \) would be the stability boundary, matching the Routh result.)
</div>

## 8.6 Bode Stability Criterion

<div class="theorem">
<strong>Bode Stability Criterion.</strong> For a minimum-phase open-loop transfer function \( L(j\omega) \) (all poles and zeros in the open left half-plane), the closed-loop system is stable if and only if the phase of \( L(j\omega) \) is greater than \( -180° \) at the gain crossover frequency \( \omega_{gc} \) where \( |L(j\omega_{gc})| = 1 \). Equivalently, PM \( > 0° \) and GM \( > 0 \) dB.
</div>

For non-minimum-phase plants (which have RHP zeros, e.g., from right-half-plane transmission zeros or time delays) the Bode criterion must be applied with care — the simple encirclement count may differ, and one must use the full Nyquist criterion.

---

# Chapter 9: Phase-Lead and Phase-Lag Controller Design

## 9.1 Frequency-Domain Design Framework

In the frequency domain, controller design amounts to reshaping the Bode diagram of the open-loop transfer function \( L(j\omega) = C(j\omega)G(j\omega) \) so that the compensated system meets specifications on gain crossover frequency \( \omega_{gc} \) (related to bandwidth and speed), phase margin PM (related to damping), and DC gain (related to steady-state error).

Two fundamental compensator types accomplish this shaping: phase-lead (adds phase near the crossover frequency, improving PM) and phase-lag (boosts DC gain without significantly affecting high-frequency behaviour, improving steady-state error).

## 9.2 Phase-Lead Compensator

<div class="definition">
<strong>Phase-Lead Compensator.</strong> The transfer function is

\[
C_{\text{lead}}(s) = K_c \alpha \frac{Ts + 1}{\alpha Ts + 1}, \quad \alpha < 1.
\]

In Bode form this is a first-order system with a zero at \( s = -1/T \) and a pole at \( s = -1/(\alpha T) \), where the pole is at higher frequency than the zero (since \( \alpha < 1 \)). The maximum phase added is

\[
\phi_{\max} = \arcsin\!\left(\frac{1-\alpha}{1+\alpha}\right),
\]

occurring at the geometric mean of zero and pole frequencies:

\[
\omega_{\max} = \frac{1}{T\sqrt{\alpha}}.
\]
</div>

**Design procedure for phase-lead:**

1. From the specifications, determine the required PM and the desired gain crossover frequency \( \omega_{gc}^* \).
2. Evaluate the uncompensated phase margin \( PM_{\text{uncomp}} = 180° + \angle G(j\omega_{gc}^*) \).
3. The phase to be added is \( \phi_{\text{add}} = PM_{\text{desired}} - PM_{\text{uncomp}} + \epsilon \) (where \( \epsilon \approx 5°\text{–}10° \) accounts for the shift in crossover frequency).
4. Compute \( \alpha = (1 - \sin\phi_{\text{add}})/(1 + \sin\phi_{\text{add}}) \).
5. Set \( \omega_{\max} = \omega_{gc}^* \). Then \( T = 1/(\omega_{gc}^*\sqrt{\alpha}) \).
6. Adjust \( K_c \) so that \( |C_{\text{lead}}(j\omega_{gc}^*)G(j\omega_{gc}^*)| = 1 \). Since the lead compensator adds magnitude \( 1/\sqrt{\alpha} \) at \( \omega_{\max} \), we typically set \( K_c = 1/\alpha \) (to keep the crossover frequency unchanged) and then fine-tune.

<div class="example">
<strong>Example 9.1: Phase-Lead Design.</strong>

Design a phase-lead compensator for the plant \( G(s) = \frac{4}{s(s+2)} \) to achieve PM \( = 50° \) at \( \omega_{gc} = 4 \) rad/s.

<em>Solution.</em>

Step 1: Evaluate \( G(j4) = \frac{4}{j4(j4+2)} = \frac{4}{j4(2+j4)} = \frac{4}{8j - 16} = \frac{4}{-16 + 8j} \).

\[
|G(j4)| = \frac{4}{\sqrt{256 + 64}} = \frac{4}{\sqrt{320}} = \frac{4}{17.9} = 0.224.
\]

\[
\angle G(j4) = -90° - \arctan(4/2) = -90° - 63.4° = -153.4°.
\]

Uncompensated PM at \( \omega = 4 \) (if crossover were here): \( PM = 180° - 153.4° = 26.6° \). We need 50°, so phase addition needed: \( \phi_{\text{add}} = 50° - 26.6° + 5° = 28.4° \).

Step 2: \( \alpha = \frac{1 - \sin(28.4°)}{1 + \sin(28.4°)} = \frac{1 - 0.475}{1 + 0.475} = \frac{0.525}{1.475} = 0.356 \).

Step 3: Set \( \omega_{\max} = 4 \): \( T = 1/(4\sqrt{0.356}) = 1/(4 \times 0.597) = 0.419 \) s.

Step 4: Lead compensator zero at \( 1/T = 2.39 \) rad/s, pole at \( 1/(\alpha T) = 6.71 \) rad/s.

Step 5: Gain correction — at \( \omega = 4 \), \( |G| = 0.224 \) so we need \( K_c = 1/|C_{\text{lead}}(j4)G(j4)| \); \( |C_{\text{lead}}(j\omega_{\max})| = 1/\sqrt{\alpha} = 1/0.597 = 1.676 \). So \( K_c = 1/(1.676 \times 0.224) = 2.66 \).

Final controller: \( C(s) = 2.66 \times 0.356 \times \frac{0.419s + 1}{0.356 \times 0.419 s + 1} = \frac{2.66(0.419s+1)}{0.149s+1} \).
</div>

## 9.3 Phase-Lag Compensator

<div class="definition">
<strong>Phase-Lag Compensator.</strong> The transfer function is

\[
C_{\text{lag}}(s) = K_c \beta \frac{Ts + 1}{\beta Ts + 1}, \quad \beta > 1.
\]

The zero is at \( -1/T \) and the pole is at \( -1/(\beta T) \), which is closer to the origin (lower frequency). At high frequencies the lag compensator attenuates by a factor \( 1/\beta \) (i.e., \( -20\log_{10}\beta \) dB), allowing the loop gain crossover to occur at a lower frequency where more phase is available.
</div>

**Design procedure for phase-lag:**

1. Find the gain crossover frequency \( \omega_{gc}^* \) such that \( \angle G(j\omega_{gc}^*) = -180° + PM_{\text{desired}} + 5°\text{–}12° \) (the extra angle is a buffer against the phase lag added by the compensator at crossover).
2. Set the high-frequency attenuation: \( \beta = |G(j\omega_{gc}^*)| \) (so that compensated gain crossover occurs at \( \omega_{gc}^* \)).
3. Place the lag zero one decade below crossover: \( 1/T = \omega_{gc}^*/10 \).
4. The lag pole is then at \( 1/(\beta T) \).

Phase-lag design is preferred when the uncompensated system already has adequate phase margin at a sufficiently low frequency, and the only problem is that the gain is too high (causing the crossover to occur where there is insufficient phase). Lag compensation *does not add phase*; it repositions the crossover to a frequency with better phase.

<div class="example">
<strong>Example 9.2: Phase-Lag Design for Steady-State Improvement.</strong>

The plant is \( G(s) = \frac{1}{s(s+1)} \) (Type 1). An uncompensated proportional controller with \( K = 1 \) gives PM \( = 45° \) at \( \omega_{gc} = 0.786 \) rad/s, and velocity constant \( K_v = 1 \) s\(^{-1}\) (ramp error = 1). We want PM \( = 40° \) and \( K_v \geq 5 \) s\(^{-1}\).

<em>Solution.</em> To raise \( K_v \) to 5 we need \( K = 5 \) in the forward path. But \( K = 5 \) with proportional control destroys the phase margin. Instead, use a lag compensator that provides the DC gain boost of \( \beta = 5 \) while keeping crossover at a lower frequency where enough phase exists.

With lag compensator \( C_{\text{lag}}(s) = \frac{Ts + 1}{\beta Ts + 1} \) and \( K_c \beta = 5 \): find \( \omega_{gc}^* \) such that \( \angle G(j\omega) = -180° + 40° + 10° = -130° \).

\( \angle G(j\omega) = -90° - \arctan(\omega) = -130° \Rightarrow \arctan(\omega) = 40° \Rightarrow \omega \approx 0.839 \) rad/s.

At \( \omega = 0.839 \): \( |G(j0.839)| = 1/(0.839\sqrt{1+0.839^2}) = 1/(0.839 \times 1.304) = 0.915 \).

Set \( K_c\beta/|G| = 1 \Rightarrow K_c = 1/(5 \times 0.915)^{-1} ... \) With \( K_c \beta = 5 \) and crossover at 0.839, the compensated gain at crossover must be 1, so \( |C_{\text{lag}}(j0.839)| = 1/(K_c \beta |G|) \approx 1/5 \): the lag attenuates by \( 1/\beta = 1/5 \) at high frequency. Place the zero at \( 1/T = 0.0839 \) (one decade below). The lag pole is at \( 1/(\beta T) = 0.0168 \) rad/s.
</div>

## 9.4 Comparison of Lead and Lag Compensation

| Property | Phase-Lead | Phase-Lag |
|---|---|---|
| Primary effect | Adds phase at crossover | Attenuates gain at high \( \omega \) |
| Bandwidth | Increases | Decreases |
| Transient response | Faster, better damping | Slower |
| Steady-state error | Slight improvement | Significant improvement |
| Noise sensitivity | Higher (boosts high frequencies) | Lower |
| Typical use | Speed up slow system | Fix steady-state error |

---

# Chapter 10: Laboratory Methods — System Identification and Controller Validation

## 10.1 The Role of the Laboratory in SYDE 352

The five laboratories in SYDE 352L form an integrated sequence that mirrors the complete control engineering design cycle: model the plant, design a controller using the model, implement the controller, and validate its performance against specifications. Two physical plants are used: a *rotating disc* (Labs 1–2) and an *inverted pendulum* (Labs 3–4), preceded by a MATLAB/Simulink orientation (Lab 0).

This sequence is not merely an illustration of lecture material — it is where the engineering judgment that transforms mathematical techniques into working solutions is developed. Discrepancies between the model prediction and the physical response are not failures; they are opportunities to understand model fidelity, sensor noise, actuator nonlinearity, and computational constraints.

## 10.2 Lab 0: MATLAB and Simulink Orientation

The orientation acquaints students with the MATLAB Control System Toolbox and Simulink. Key functions encountered throughout the labs include:

- `tf(num, den)` — create a transfer function model.
- `step(sys)`, `impulse(sys)` — time-domain response plots.
- `bode(sys)` — Bode diagram.
- `nyquist(sys)` — Nyquist plot.
- `rlocus(sys)` — root locus.
- `margin(sys)` — gain and phase margins.
- `pole(sys)`, `zero(sys)` — poles and zeros.
- `feedback(G, H)` — close a feedback loop.
- `pid(Kp, Ki, Kd)` — create a PID controller object.
- `sisotool` or `controlSystemDesigner` — interactive design GUI.

In Simulink, students build block diagrams of the feedback loop, add saturation blocks to model actuator limits, and use the Real-Time Workshop interface to download controllers to the lab hardware.

## 10.3 Lab 1: System Identification — Rotating Disc Plant

### 10.3.1 The Plant Model

The rotating disc is a motor-driven inertial disc with a tachometer providing angular velocity feedback. Neglecting coulomb friction, the governing equation is

\[
J\ddot{\theta} + b\dot{\theta} = K_m u(t),
\]

where \( K_m \) is the motor gain constant. Taking the angular velocity \( \omega_{\text{disc}} = \dot{\theta} \) as output and the input voltage \( u \) as input:

\[
G_{\text{disc}}(s) = \frac{\Omega(s)}{U(s)} = \frac{K_m/J}{s + b/J} = \frac{K}{s + a},
\]

a first-order plant with DC gain \( K/a = K_m/b \) and time constant \( \tau = J/b \).

### 10.3.2 Step-Response Identification

Apply a known step voltage \( u_0 \) to the motor and record \( \omega(t) \). The response is

\[
\omega(t) = \frac{K_m u_0}{b}\left(1 - e^{-(b/J)t}\right).
\]

From the data:

- **DC gain**: \( K/a = \omega_{\text{final}}/u_0 \).
- **Time constant**: \( \tau = J/b \) is the time to reach \( 63.2\% \) of final value.

A more robust estimate uses least-squares fitting: parametrise the model output as \( \hat{\omega}(t; K, a) = (K/a)(1 - e^{-at}) \cdot u_0 \) and minimise \( \sum_k (\omega_{\text{meas}}(t_k) - \hat{\omega}(t_k))^2 \) over \( K \) and \( a \).

### 10.3.3 Frequency-Domain Identification

Alternatively, apply a chirp signal (a sinusoid whose frequency sweeps from low to high) and estimate \( |G(j\omega)| \) and \( \angle G(j\omega) \) at each frequency. The MATLAB command `frd` creates a *frequency response data* object, and `tfest` or `invfreqs` can fit a rational transfer function to it. This approach captures resonances and non-minimum-phase behaviour that a step-response fit may miss.

<div class="remark">
<strong>What system identification reveals about the disc plant.</strong> In practice the identified model often has a slightly higher-order response than the pure \( K/(s + a) \) first-order model — the motor amplifier introduces additional dynamics, and coulomb friction causes a nonlinear dead zone around zero velocity. For the purpose of PID design in Lab 2, the linearized first-order model is usually adequate, but students who observe a poor fit should consider a second-order model \( G(s) = K\omega_n^2/[(s+a)(s^2 + 2\zeta\omega_n s + \omega_n^2)] \) with an additional resonant mode.
</div>

## 10.4 Lab 2: PID Controller Design for the Rotating Disc

Having identified the transfer function \( G_{\text{disc}}(s) = K/(s + a) \), the closed-loop with unity feedback and PID controller is

\[
T(s) = \frac{C_{\text{PID}}(s) G_{\text{disc}}(s)}{1 + C_{\text{PID}}(s) G_{\text{disc}}(s)}.
\]

### 10.4.1 Design Workflow

1. **Specify requirements**: e.g., rise time \( t_r < 0.3 \) s, overshoot \( < 10\% \), zero steady-state error.
2. **Translate to frequency domain**: PM target \( \approx 50°\text{–}60° \), bandwidth \( \omega_B \approx 1.8/t_r \approx 6 \) rad/s.
3. **Initial PID tuning**: Use Ziegler-Nichols (Section 6.3) for a starting point.
4. **Refinement in MATLAB**: Use `pidtune(G, 'PID')` or the Control System Designer to iterate toward specifications.
5. **Robustness check**: Verify GM and PM in Bode; check pole locations in root locus.
6. **Simulink validation**: Simulate the closed-loop step response; add actuator saturation to check for integrator windup and enable anti-windup if needed.
7. **Hardware implementation**: Download controller to the lab interface; collect step-response data; compare with simulation.

### 10.4.2 Anti-Windup

When the actuator saturates (voltage limited), the integrator continues to accumulate error, causing large overshoot on recovery. Anti-windup schemes (back-calculation or conditional integration) stop the integrator from winding up beyond the actuator limits:

\[
u = \text{sat}(u_{\text{PID}}) + \frac{1}{T_t}(u_{\text{sat}} - u_{\text{PID}}),
\]

where \( T_t \) is the tracking time constant and \( u_{\text{sat}} = \text{sat}(u_{\text{PID}}) \).

## 10.5 Lab 3: System Identification — Inverted Pendulum

### 10.5.1 Physics of the Inverted Pendulum

The inverted pendulum is inherently unstable: an upright rigid rod of mass \( m \), length \( L \), hinged at its base, with a cart or motor providing a horizontal force \( u \). Linearizing about the upright equilibrium (\( \theta \approx 0 \)):

\[
\ddot{\theta} = \frac{g}{l}\,\theta + \frac{1}{ml^2}\,u,
\]

where \( l = L/2 \) is the distance to the centre of mass. This is an unstable second-order system with a pole in the right half-plane at \( s = +\sqrt{g/l} \).

The transfer function (angle output, force input) is

\[
G_{\text{pend}}(s) = \frac{1/(ml^2)}{s^2 - g/l} = \frac{K_p}{s^2 - \omega_p^2},
\]

where \( \omega_p = \sqrt{g/l} \approx \sqrt{9.81/0.25} \approx 6.26 \) rad/s for \( l = 0.25 \) m.

### 10.5.2 Identification Strategy

Because the pendulum is open-loop unstable it cannot be subjected to a step input without a stabilizing controller already active. The identification is therefore performed with a *provisional* stabilizing controller (e.g., a simple proportional controller designed from the nominal model), and system identification is then done on the closed-loop data using closed-loop system identification techniques (prediction error methods or correlation analysis). MATLAB's System Identification Toolbox `tfest` function handles this workflow.

<div class="remark">
<strong>Lab 3 engineering lesson.</strong> The inverted pendulum illustrates that not all plants can be identified in open loop. Closed-loop identification introduces a conceptual subtlety: the identified model captures the plant, not the closed loop, but the data is corrupted by the loop structure. This is a microcosm of the challenges of industrial process identification, where plants often cannot be operated in open loop for safety or economic reasons.
</div>

## 10.6 Lab 4: PID Controller Design for the Inverted Pendulum

Stabilizing and controlling an inverted pendulum with PID requires careful attention because:

1. The RHP pole at \( +\omega_p \) means the open-loop Nyquist plot encircles \( -1 \) when the gain is too high, leading to instability from both sides of the gain range. There is a *finite gain margin* — the system is stable only within a range \( K_{\min} < K < K_{\max} \).
2. Root-locus analysis is essential: the two open-loop poles at \( \pm\omega_p \) (one in RHP) must be pulled into the LHP by the PID controller. The root locus departs from the RHP pole and must be brought across the imaginary axis for stability.
3. Derivative action is almost always necessary because it provides the phase lead needed to stabilize the RHP pole — pure P or PI control generally cannot achieve stability for the inverted pendulum.

### 10.6.1 Root-Locus Analysis for the Unstable Plant

The characteristic equation with proportional control \( C(s) = K \) is

\[
s^2 - \omega_p^2 + K K_p = 0 \quad \Rightarrow \quad s^2 = \omega_p^2 - K K_p.
\]

For \( K K_p > \omega_p^2 \), the roots are imaginary: the proportional controller can only reach the imaginary axis, not achieve damped response. Adding derivative action \( C(s) = K_p(1 + T_d s) \) gives

\[
s^2 + K K_p T_d s + (K K_p - \omega_p^2) = 0.
\]

For \( K K_p > \omega_p^2 \) and \( K K_p T_d > 0 \) (both conditions easily satisfied), the roots have negative real parts — the PD controller stabilizes the pendulum and places both poles in the LHP.

Adding integral action then addresses the steady-state error. The complete PID design follows the same workflow as Lab 2 but with additional attention to the stability boundaries on all three gains.

---

# Appendix: Key Formulas and Reference Tables

## A.1 Standard Laplace Transform Pairs

| Time function \( f(t) \) | Transform \( F(s) \) | ROC |
|---|---|---|
| \( \delta(t) \) | 1 | All \( s \) |
| \( u_s(t) \) | \( 1/s \) | \( \text{Re}(s) > 0 \) |
| \( t^n u_s(t) \) | \( n!/s^{n+1} \) | \( \text{Re}(s) > 0 \) |
| \( e^{-at}u_s(t) \) | \( 1/(s+a) \) | \( \text{Re}(s) > -a \) |
| \( t e^{-at}u_s(t) \) | \( 1/(s+a)^2 \) | \( \text{Re}(s) > -a \) |
| \( \sin(\omega_0 t) u_s(t) \) | \( \omega_0/(s^2+\omega_0^2) \) | \( \text{Re}(s) > 0 \) |
| \( \cos(\omega_0 t) u_s(t) \) | \( s/(s^2+\omega_0^2) \) | \( \text{Re}(s) > 0 \) |
| \( e^{-at}\sin(\omega_0 t) \) | \( \omega_0/[(s+a)^2+\omega_0^2] \) | \( \text{Re}(s) > -a \) |
| \( e^{-at}\cos(\omega_0 t) \) | \( (s+a)/[(s+a)^2+\omega_0^2] \) | \( \text{Re}(s) > -a \) |

## A.2 Second-Order System Summary

For \( T(s) = \omega_n^2/(s^2 + 2\zeta\omega_n s + \omega_n^2) \), unit step input:

\[
\%OS = 100\,e^{-\pi\zeta/\sqrt{1-\zeta^2}}, \quad t_p = \pi/\omega_d, \quad t_s \approx 4/(\zeta\omega_n), \quad \omega_d = \omega_n\sqrt{1-\zeta^2}.
\]

Inverse relation: from %OS specification,

\[
\zeta = \frac{-\ln(\%OS/100)}{\sqrt{\pi^2 + \ln^2(\%OS/100)}}.
\]

## A.3 Routh Array Special Cases

**Zero in first column:** Replace the zero with a small \( \varepsilon > 0 \) and evaluate stability as \( \varepsilon \to 0^+ \). A sign change of \( \varepsilon \) indicates a root in the RHP.

**Row of all zeros:** An entire row of zeros indicates roots symmetrically placed about the origin (on the imaginary axis or in symmetric RHP/LHP pairs). Form the *auxiliary polynomial* from the row above the zero row; its roots are the symmetric root locations. Replace the zero row with the derivative of the auxiliary polynomial and continue.

## A.4 Gain and Phase Margin from Bode

\[
GM\,[\text{dB}] = 0 - 20\log_{10}|L(j\omega_{pc})|, \quad PM = 180° + \angle L(j\omega_{gc}).
\]

Stable minimum-phase systems: GM \( > 0 \) dB and PM \( > 0° \).

## A.5 State-Space Quick Reference

| Property | Test | Tool |
|---|---|---|
| Stability | All eigenvalues of \( A \) in open LHP | \( \text{eig}(A) \) |
| Controllability | \( \text{rank}(\mathcal{C}) = n \) | \( \text{rank}([B,AB,\ldots]) \) |
| Observability | \( \text{rank}(\mathcal{O}) = n \) | \( \text{rank}([C;CA;\ldots]) \) |
| Transfer function | \( C(sI - A)^{-1}B + D \) | `ss2tf` in MATLAB |

## A.6 PID Ziegler-Nichols Quick Reference

**Step-response method** (parameters: \( K_{\text{dc}}, T, L \)):

\[
K_p^{\text{PID}} = \frac{1.2T}{K_{\text{dc}}L}, \quad T_i = 2L, \quad T_d = 0.5L.
\]

**Ultimate gain method** (parameters: \( K_u, P_u \)):

\[
K_p^{\text{PID}} = 0.6K_u, \quad T_i = 0.5P_u, \quad T_d = 0.125P_u.
\]

## A.7 Root-Locus Angle and Magnitude Conditions

For \( s_d \) on the root locus:

\[
\sum_j \angle(s_d - z_j) - \sum_i \angle(s_d - p_i) = \pm 180°(2k+1),
\]

\[
K = \frac{\prod_i |s_d - p_i|}{\prod_j |s_d - z_j|}.
\]

## A.8 Phase-Lead Design Equations

\[
\phi_{\max} = \arcsin\!\left(\frac{1-\alpha}{1+\alpha}\right), \quad \alpha = \frac{1 - \sin\phi_{\max}}{1 + \sin\phi_{\max}}, \quad \omega_{\max} = \frac{1}{T\sqrt{\alpha}}.
\]

Magnitude at \( \omega_{\max} \): \( |C_{\text{lead}}(j\omega_{\max})| = 1/\sqrt{\alpha} \).

---

## Additional Worked Examples

<div class="example">
<strong>Example A.1: Complete PID Design via Root Locus.</strong>

Design a PID controller for the plant \( G(s) = \frac{1}{(s+1)(s+3)} \) to meet: (a) zero steady-state error to step, (b) \%OS \( \leq 5\% \), (c) \( t_s \leq 4 \) s.

<em>Solution.</em>

From (b): \( \zeta \geq 0.69 \). From (c): \( \zeta\omega_n \geq 1 \). Choose desired poles at \( s = -1.5 \pm j1.5 \) (giving \( \zeta = 0.707 \), \( \omega_n = 2.12 \), \( t_s = 4/1.5 = 2.67 \) s, \%OS \( = 4.3\% \)).

Condition (a) requires integral action, so add an integrator in the controller: \( C(s) = K(s + z_c)^2/s \) (a PID form with a double zero).

PID zero placement: to cancel the plant pole at \( s = -1 \) (simplifying the root locus), place one zero at \( z_c = 1 \): \( C(s) = K(s+1)(s+z_2)/s \). Choose \( z_2 \) so that \( s_d = -1.5 + j1.5 \) lies on the locus. Angle from the plant poles, compensator poles, and zeros:

\[
\angle(s_d + 1) + \angle(s_d + z_2) - \angle s_d - \angle(s_d + 1) - \angle(s_d + 3) = \pm 180°.
\]

After the pole-zero cancellation at \( s = -1 \): remaining angle condition from \( \angle(s_d + z_2) - \angle(s_d) - \angle(s_d + 3) = -180° \).

\( \angle(s_d) = 180° - \arctan(1.5/1.5) = 180° - 45° = 135° \). \( \angle(s_d + 3) = \arctan(1.5/1.5) = 45° \).

Required: \( \angle(s_d + z_2) = -180° + 135° + 45° = 0° \). This means \( s_d + z_2 \) is real and positive, so \( \text{Im}(s_d + z_2) = 0 \Rightarrow z_2 = -\text{Im}(s_d)/0 \)... Since \( \text{Im}(s_d + z_2) = 1.5 \neq 0 \), a zero angle of \( 0° \) is impossible for a complex \( s_d \). We instead need \( \angle(s_d + z_2) = -180° + 135° + 45° = 0° \), which means \( s_d + z_2 \) points along the positive real axis — impossible for complex \( s_d \). Therefore place \( z_2 \) via numerical computation or choose \( z_2 = 3 \) (cancelling the second plant pole) and adjust gain: with both poles cancelled, \( C(s)G(s) = K/s \), a pure integrator. Desired \( s_d = -1.5 + j1.5 \) is not on the locus of \( K/s \) (which lies on the imaginary axis). So pole cancellation is not optimal here.

In practice, use MATLAB's `pidtune(G, 'PID', wc)` with target bandwidth \( \omega_c = 2.5 \) rad/s to obtain a numerically optimised PID — \( K_p \approx 8, K_i \approx 5, K_d \approx 3 \) — then verify with `step(feedback(pid(Kp,Ki,Kd)*G, 1))`.
</div>

<div class="example">
<strong>Example A.2: Nyquist Criterion with RHP Open-Loop Pole.</strong>

The open-loop transfer function is \( L(s) = \frac{K(s+2)}{(s-1)(s+5)} \). Determine the range of \( K > 0 \) for closed-loop stability using the Nyquist criterion.

<em>Solution.</em> \( L(s) \) has one RHP pole at \( s = +1 \), so \( P = 1 \). For stability we need \( Z = N + P = 0 \Rightarrow N = -1 \), meaning the Nyquist plot must encircle \( -1 \) exactly once counterclockwise.

Evaluate \( L(j\omega) \) at key frequencies. At \( \omega = 0 \): \( L(0) = K(2)/((-1)(5)) = -2K/5 \). At \( \omega \to \infty \): \( L \to 0 \). The plot starts at \( -2K/5 \) on the negative real axis and spirals to the origin.

Phase crossover: \( \angle L(j\omega) = \arctan(\omega/2) - 90° - \arctan(\omega/5) - \arctan... \). More systematically: \( L(j\omega) = K(j\omega + 2)/[(j\omega - 1)(j\omega + 5)] \). Numerator angle: \( \arctan(\omega/2) \). Denominator angles: \( 180° - \arctan(\omega/1) \) (from the RHP pole) \( + \arctan(\omega/5) \). Net phase: \( \arctan(\omega/2) - (180° - \arctan\omega) - \arctan(\omega/5) \).

At \( \omega = 0 \): phase \( = 0° - 180° - 0° = -180° \). So the entire negative-real-axis crossing at \( \omega = 0^+ \) has magnitude \( 2K/5 \). The Nyquist plot starts on the negative real axis.

For one CCW encirclement of \( -1 \): we need \( -2K/5 < -1 \Rightarrow K > 5/2 = 2.5 \). For stability when \( K > 2.5 \), verify no additional crossings cause extra encirclements. Checking via Routh: characteristic equation \( (s-1)(s+5) + K(s+2) = 0 \Rightarrow s^2 + 4s - 5 + Ks + 2K = 0 \Rightarrow s^2 + (4+K)s + (2K-5) = 0 \). Routh: \( s^1 \): \( 4 + K > 0 \) always; \( s^0 \): \( 2K - 5 > 0 \Rightarrow K > 2.5 \). Confirmed: closed-loop stable for \( K > 2.5 \).
</div>

<div class="example">
<strong>Example A.3: Observability and State Estimation.</strong>

For the system

\[
A = \begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix}, \quad C = \begin{bmatrix} 1 & 0 \end{bmatrix},
\]

check observability and interpret physically.

<em>Solution.</em>

\[
\mathcal{O} = \begin{bmatrix} C \\ CA \end{bmatrix} = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix}.
\]

\( \text{rank}(\mathcal{O}) = 2 = n \): the system is <strong>observable</strong>. Physically, measuring only \( x_1 \) (position, say) is sufficient to reconstruct \( x_2 \) (velocity) because \( x_2 \) appears in the dynamics of \( x_1 \). This underpins the design of a *Luenberger observer* (state estimator) — a topic encountered in graduate control courses (SYDE 652) that extends the SYDE 352 foundation.

If instead \( C = \begin{bmatrix} 0 & 1 \end{bmatrix} \) (measuring only velocity):

\[
\mathcal{O} = \begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix},
\]

\( \det(\mathcal{O}) = 0 \cdot(-3) - 1 \cdot(-2) = 2 \neq 0 \): still observable. For this system, either state alone is sufficient for observability because the \( A \) matrix couples the two states bidirectionally.
</div>

<div class="example">
<strong>Example A.4: Bode Design — Gain Adjustment.</strong>

For the plant \( G(s) = \frac{10}{s(0.1s + 1)(0.5s + 1)} \), find the gain \( K \) that yields PM \( = 45° \).

<em>Solution.</em> Factored form: poles at \( s = 0, -10, -2 \). Phases: integrator gives \( -90° \); pole at \( \omega = 10 \) gives \( \phi = -\arctan(\omega/10) \); pole at \( \omega = 2 \) gives \( \phi = -\arctan(\omega/2) \).

For PM \( = 45° \): need \( \angle G(j\omega) = -180° + 45° = -135° \) at \( \omega_{gc} \).

\[
-90° - \arctan(\omega/10) - \arctan(\omega/2) = -135°.
\]

\[
\arctan(\omega/10) + \arctan(\omega/2) = 45°.
\]

Let \( x = \omega/10, y = \omega/2 = 5x \). Then \( \arctan(x) + \arctan(5x) = 45° \). Using \( \tan(45°) = 1 \):

\[
\frac{x + 5x}{1 - 5x^2} = 1 \quad \Rightarrow \quad 6x = 1 - 5x^2 \quad \Rightarrow \quad 5x^2 + 6x - 1 = 0.
\]

\[
x = \frac{-6 + \sqrt{36 + 20}}{10} = \frac{-6 + \sqrt{56}}{10} = \frac{-6 + 7.483}{10} = 0.148.
\]

So \( \omega_{gc} = 10x = 1.48 \) rad/s.

Magnitude of \( G(j1.48) \): \( |G| = 10/(1.48\cdot\sqrt{1+(0.148)^2}\cdot\sqrt{1+(0.74)^2}) = 10/(1.48 \times 1.011 \times 1.247) = 10/1.864 = 5.37 \).

Required: \( K \cdot 5.37 = 1 \Rightarrow K = 1/5.37 = 0.186 \). So the adjusted gain is \( K = 0.186 \), giving PM \( = 45° \) at \( \omega_{gc} = 1.48 \) rad/s.
</div>

<div class="remark">
<strong>Connecting the chapters — a systems view.</strong> SYDE 352 covers four interlocking perspectives on the same underlying physical reality. The <em>time-domain</em> (Chapters 1–3) provides intuition about how systems respond and sets the language of design specifications. The <em>algebraic stability analysis</em> (Chapter 4) provides exact stability boundaries without simulation. The <em>state-space</em> (Chapter 5) reveals the internal structure and enables modern design methods. The <em>frequency domain</em> (Chapters 8–9) connects model uncertainty to performance robustness in a way that time-domain and root-locus methods cannot easily do.

None of these perspectives is complete alone. A good control engineer fluently translates among all four — reading a Bode diagram and simultaneously thinking about the corresponding root locus, state-space eigenvalue placement, and time-domain overshoot — and anchors all calculations in physical experimentation through the laboratory program. This integrative fluency is the central learning goal of SYDE 352.
</div>
