---
title: "AMATH 390 - Mathematics and Music"
layout: toc
parent: Fall 2020
prof: K.A. Morris
---
<style>
.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; }
.embed-container iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }
</style>

# Chapter 1: Harmonic Motion

The second-order differential equation

<span>&#92;[y'' + &#92;omega^2 y = 0 &#92;tag{1.1}&#92;]</span>

sometimes called the **oscillator equation**, arises in many contexts. For example, for a body with mass <span>&#92;(m&#92;)</span> and an applied force <span>&#92;(F&#92;)</span>, Newton's Second Law implies that the resulting acceleration <span>&#92;(a&#92;)</span> is

<span>&#92;[ma = F &#92;tag{1.2}&#92;]</span>

Letting deflection be <span>&#92;(y&#92;)</span>,

<span>&#92;[my'' = F,&#92;]</span>

where <span>&#92;(y''(t)&#92;)</span> is the second derivative of <span>&#92;(y(t)&#92;)</span> with respect to <span>&#92;(t&#92;)</span>. For many systems, the restoring force is (approximately) proportional to deflection. For example, in a spring the restoring force is <span>&#92;(-ky&#92;)</span>, where <span>&#92;(k&#92;)</span> is known as the **spring constant**. Letting <span>&#92;(k > 0&#92;)</span> indicate a proportionality constant,

<span>&#92;[my'' = -ky. &#92;tag{1.3}&#92;]</span>

Defining <span>&#92;(&#92;omega = &#92;sqrt{&#92;frac{k}{m}}&#92;)</span>, we can rewrite equation (1.3) as (1.1).

The solution to equation (1.1) is, for arbitrary constants <span>&#92;(A&#92;)</span> and <span>&#92;(B&#92;)</span>,

<span>&#92;[y(t) = A&#92;cos(&#92;omega t) + B&#92;sin(&#92;omega t). &#92;tag{1.4}&#92;]</span>

This can be verified by direct substitution:

<span>&#92;[&#92;begin{aligned}
y'(t) &= -A&#92;omega&#92;sin(&#92;omega t) + B&#92;omega&#92;cos(&#92;omega t), &#92;&#92;
y''(t) &= -A&#92;omega^2&#92;cos(&#92;omega t) - B&#92;omega^2&#92;sin(&#92;omega t) &#92;&#92;
&= -&#92;omega^2 y(t).
&#92;end{aligned}&#92;]</span>

In order to fully determine the solution, the initial conditions <span>&#92;(y(0)&#92;)</span> and <span>&#92;(&#92;dot{y}(0)&#92;)</span> are needed. These determine the values of <span>&#92;(A&#92;)</span> and <span>&#92;(B&#92;)</span>.

There is another, often more convenient, way to write the solution to (1.1). Using the sum formula

<span>&#92;[&#92;sin(a + b) = &#92;sin(a)&#92;cos(b) + &#92;cos(a)&#92;sin(b), &#92;tag{1.5}&#92;]</span>

leads to writing

<span>&#92;[y(t) = &#92;beta &#92;cdot &#92;sin(&#92;omega t + &#92;phi), &#92;tag{1.6}&#92;]</span>

as

<span>&#92;[y(t) = &#92;beta&#92;sin(&#92;phi)&#92;cos(&#92;omega t) + &#92;beta&#92;cos(&#92;phi)&#92;sin(&#92;omega t). &#92;tag{1.7}&#92;]</span>

Comparing the coefficients of <span>&#92;(&#92;sin(&#92;omega t)&#92;)</span> and <span>&#92;(&#92;cos(&#92;omega t)&#92;)</span> in (1.4) and (1.7) yields

<span>&#92;[A = &#92;beta&#92;sin(&#92;phi), &#92;quad B = &#92;beta&#92;cos(&#92;phi). &#92;tag{1.8}&#92;]</span>

If we define

<span>&#92;[&#92;beta := &#92;sqrt{A^2 + B^2}, &#92;quad &#92;phi := &#92;arctan&#92;left(&#92;frac{A}{B}&#92;right), &#92;tag{1.9}&#92;]</span>

then

<span>&#92;[y(t) = &#92;beta&#92;sin(&#92;omega t + &#92;phi). &#92;tag{1.10}&#92;]</span>

Thus, (1.4) (with <span>&#92;(A&#92;)</span>, <span>&#92;(B&#92;)</span> determined by initial conditions) and (1.10) (with <span>&#92;(&#92;beta&#92;)</span>, <span>&#92;(&#92;phi&#92;)</span> determined by initial conditions) are equivalent ways of writing the solution to (1.1). This is sometimes called **Harmonic Motion**.

The advantage of the second representation (1.10) is that it is clear that the solution is periodic with frequency <span>&#92;(&#92;omega&#92;)</span>. The **amplitude** <span>&#92;(&#92;beta&#92;)</span> and **phase shift** <span>&#92;(&#92;phi&#92;)</span> are determined by initial conditions.

The frequency of the wave corresponds to **pitch** of an audible sound, while the amplitude of the wave corresponds to **loudness**. A difference in phase of two waves (an example is shown in Figure 1.1(a)) is not audible. The frequency of <span>&#92;(&#92;sin(&#92;omega t)&#92;)</span> is <span>&#92;(&#92;omega&#92;)</span> rad/s, or <span>&#92;(&#92;frac{&#92;omega}{2&#92;pi}&#92;)</span> Hz.

![Graphs showing the effect of changing the frequency and wavelength of a sine function: (a) sin(t), (b) sin(3t), (c) sin(3t+1)](/pics/390/390-ch1-sine-waves-2.png)

Differential equations of the form

<span>&#92;[Ay'' + By' + Cy = 0 &#92;tag{1.11}&#92;]</span>

(where <span>&#92;(A&#92;)</span>, <span>&#92;(B&#92;)</span>, <span>&#92;(C&#92;)</span> are constants) are called **linear homogeneous second-order ordinary differential equations**. Equation (1.1) is an example of this.

For linear differential equations, the **Principle of Superposition** states that if <span>&#92;(y_1&#92;)</span> and <span>&#92;(y_2&#92;)</span> are both solutions to some linear homogeneous differential equation, then <span>&#92;(y(t) = c_1 y_1(t) + c_2 y_2(t)&#92;)</span> is also a solution to the equation, where <span>&#92;(c_1&#92;)</span> and <span>&#92;(c_2&#92;)</span> are arbitrary constants. This can be verified by substitution. For example, given that <span>&#92;(y_1(t) = &#92;sin(t)&#92;)</span> and <span>&#92;(y_2(t) = &#92;cos(t)&#92;)</span> are both solutions to the differential equation <span>&#92;(y''(t) = -y(t)&#92;)</span>, then

<span>&#92;[y(t) = A&#92;sin(t) + B&#92;cos(t) &#92;tag{1.12}&#92;]</span>

is also a solution.

## Beats

Consider two waves with the same phase and amplitude, but different frequencies <span>&#92;(&#92;omega_2 > &#92;omega_1&#92;)</span>:

<span>&#92;[y(t) = &#92;sin(&#92;omega_1 t) + &#92;sin(&#92;omega_2 t). &#92;tag{1.13}&#92;]</span>

Define

<span>&#92;[&#92;bar{&#92;omega} = &#92;frac{1}{2}(&#92;omega_2 + &#92;omega_1), &#92;quad &#92;Delta = &#92;frac{1}{2}(&#92;omega_2 - &#92;omega_1), &#92;tag{1.14}&#92;]</span>

and use the sum formula (1.5) to write

<span>&#92;[&#92;begin{aligned}
y(t) &= &#92;sin(&#92;bar{&#92;omega}t - &#92;Delta t) + &#92;sin(&#92;bar{&#92;omega}t + &#92;Delta t) &#92;&#92;
&= 2&#92;cos(&#92;Delta t)&#92;sin(&#92;bar{&#92;omega}t).
&#92;end{aligned}&#92;]</span>

If <span>&#92;(&#92;Delta&#92;)</span> is small, this looks like a sine wave with frequency <span>&#92;(&#92;frac{&#92;bar{&#92;omega}}{2&#92;pi}&#92;)</span> Hz, with a periodic amplitude given by a slow cosine wave. The word **beat** refers to a periodic fluctuation in the amplitude of a wave. Thus, when two waves of slightly different frequencies are superimposed, beats are produced.

Formally, the frequency of the beats produced by the superposition of two waves <span>&#92;(&#92;sin(&#92;omega_1 t)&#92;)</span> and <span>&#92;(&#92;sin(&#92;omega_2 t)&#92;)</span> is <span>&#92;(&#92;Delta&#92;)</span>. However, since it is the amplitude of the envelope that is heard, and this has frequency

<span>&#92;[&#92;omega_{&#92;text{beats}} = &#92;omega_2 - &#92;omega_1. &#92;tag{1.15}&#92;]</span>

This is known as the **beat frequency**.

![440Hz + 442Hz — slow beats with 2Hz beat frequency](/pics/390/390-ch1-beats-440-442.png)

![440Hz + 443Hz — faster beats with 3Hz beat frequency](/pics/390/390-ch1-beats-440-443.png)

![440Hz + 448Hz — rapid beats with 8Hz beat frequency](/pics/390/390-ch1-beats-440-448.png)

## Damping

Actual systems do not oscillate forever; there are dissipative forces. A more realistic model of vibration includes a dissipative term proportional to the speed of motion <span>&#92;(y'&#92;)</span>, and takes the form

<span>&#92;[y'' + 2&#92;xi&#92;omega y' + &#92;omega^2 y = 0, &#92;quad 0 < &#92;xi < 1. &#92;tag{1.16}&#92;]</span>

Equation (1.16) has solution

<span>&#92;[&#92;begin{aligned}
y(t) &= e^{-&#92;xi&#92;omega t}&#92;left(A&#92;cos&#92;left(&#92;sqrt{1-&#92;xi^2}&#92;,&#92;omega t&#92;right) + B&#92;sin&#92;left(&#92;sqrt{1-&#92;xi^2}&#92;,&#92;omega t&#92;right)&#92;right) &#92;&#92;
&= Ce^{-&#92;xi&#92;omega t}&#92;sin&#92;left(&#92;sqrt{1-&#92;xi^2}&#92;,&#92;omega t + &#92;phi&#92;right)
&#92;end{aligned}&#92;]</span>

where <span>&#92;(A&#92;)</span>, <span>&#92;(B&#92;)</span> (or equivalently <span>&#92;(C&#92;)</span>, <span>&#92;(&#92;phi&#92;)</span>) are determined by initial conditions. The damped solution has a decaying amplitude, and a slightly lower frequency. With <span>&#92;(&#92;xi = 0.05&#92;)</span>, frequency is 99.8% of the undamped frequency. If <span>&#92;(&#92;xi = 0.2&#92;)</span>, it's 98%. Since we are typically concerned only with frequency, and damping only slightly affects frequency, we will not generally include damping in the analysis.

![Damped oscillations with frequency ω = 3, damping parameter ξ = 0.05. The green and blue curves show the envelope of the oscillations. Below: comparison of damped and undamped oscillations.](/pics/390/390-ch1-damping-7.png)

## Forced Harmonic Motion

**Forced motion** occurs when the oscillation of one body forces another body to oscillate. With a forcing term <span>&#92;(f(t)&#92;)</span>, the differential equation modelling the motion is

<span>&#92;[y'' + 2&#92;xi&#92;omega y' + &#92;omega^2 y = f(t), &#92;quad 0 < &#92;xi < 1. &#92;tag{1.17}&#92;]</span>

If the forcing is periodic so that <span>&#92;(f(t) = F&#92;sin(&#92;alpha t)&#92;)</span> for some amplitude <span>&#92;(F&#92;)</span> and frequency <span>&#92;(&#92;alpha&#92;)</span>, (1.17) becomes

<span>&#92;[y'' + 2&#92;xi&#92;omega y' + &#92;omega^2 y = F&#92;sin(&#92;alpha t), &#92;quad 0 < &#92;xi < 1, &#92;tag{1.18}&#92;]</span>

for some constant <span>&#92;(F&#92;)</span> and frequency <span>&#92;(&#92;alpha&#92;)</span>.

The forcing adds a term in the solution of equation (1.18) of the form

<span>&#92;[y_p(t) = a&#92;sin(&#92;alpha t) + b&#92;cos(&#92;alpha t). &#92;tag{1.19}&#92;]</span>

Substituting this into the left-hand-side of (1.18) yields the expressions

<span>&#92;[&#92;underbrace{(-a&#92;alpha^2 - 2&#92;xi&#92;omega&#92;alpha b + &#92;omega^2 a)}_{F}&#92;sin(&#92;alpha t) + &#92;underbrace{(-b&#92;alpha^2 - 2&#92;xi&#92;omega&#92;alpha a + &#92;omega^2 b)}_{0}&#92;cos(&#92;alpha t). &#92;tag{1.20}&#92;]</span>

For this to equal the right-hand-side of (1.18),

<span>&#92;[&#92;begin{aligned}
F &= (&#92;omega^2 - &#92;alpha^2)a + (-2&#92;xi&#92;omega&#92;alpha)b &#92;&#92;
0 &= (2&#92;xi&#92;omega&#92;alpha)a + (&#92;omega^2 - &#92;alpha^2)b.
&#92;end{aligned}&#92;]</span>

If <span>&#92;(&#92;alpha &#92;neq &#92;omega&#92;)</span> or <span>&#92;(&#92;xi &#92;neq 0&#92;)</span>,

<span>&#92;[a = &#92;frac{(&#92;omega^2 - &#92;alpha^2)F}{(&#92;omega^2 - &#92;alpha^2)^2 + (2&#92;xi&#92;omega&#92;alpha)^2}, &#92;quad b = &#92;frac{-(2&#92;xi&#92;omega&#92;alpha)F}{(&#92;omega^2 - &#92;alpha^2)^2 + (2&#92;xi&#92;omega&#92;alpha)^2}. &#92;tag{1.21}&#92;]</span>

Writing <span>&#92;(&#92;omega_0 = &#92;sqrt{1 - &#92;xi^2}&#92;,&#92;omega&#92;)</span>, any solution to (1.18) is of the form

<span>&#92;[&#92;begin{aligned}
y(t) &= e^{-&#92;xi&#92;omega t}(A&#92;sin(&#92;omega_0 t) + B&#92;cos(&#92;omega_0 t)) + a&#92;sin(&#92;alpha t) + b&#92;cos(&#92;alpha t) &#92;&#92;
&= e^{-&#92;xi&#92;omega t}C&#92;sin(&#92;omega_0 t + &#92;phi) + M&#92;sin(&#92;alpha t + &#92;phi_f).
&#92;end{aligned}&#92;]</span>

where <span>&#92;(M&#92;)</span> and <span>&#92;(&#92;phi_f&#92;)</span> are determined by the forcing function parameters <span>&#92;(F&#92;)</span> and <span>&#92;(&#92;alpha&#92;)</span>:

<span>&#92;[M = &#92;sqrt{a^2 + b^2} = &#92;frac{F}{&#92;sqrt{(&#92;omega^2 - &#92;alpha^2)^2 + (2&#92;xi&#92;omega&#92;alpha)^2}}.&#92;]</span>

The constants <span>&#92;(C&#92;)</span> and <span>&#92;(&#92;phi&#92;)</span> (or <span>&#92;(A&#92;)</span> and <span>&#92;(B&#92;)</span>) are determined by the initial conditions. Note that as <span>&#92;(t &#92;to &#92;infty&#92;)</span>, <span>&#92;(y(t) &#92;to M&#92;sin(&#92;alpha t + &#92;phi_f)&#92;)</span>.

The response is the sum of two waves: a decaying wave at the natural frequency <span>&#92;(&#92;omega_0&#92;)</span>, and a persistent wave at the forcing frequency <span>&#92;(&#92;alpha&#92;)</span>. Thus, in steady-state, once the effect of the initial conditions has dissipated,

<span>&#92;[y(t) = M&#92;sin(&#92;alpha t + &#92;phi_f),&#92;]</span>

where

<span>&#92;[M = &#92;frac{F}{&#92;sqrt{(&#92;omega^2 - &#92;alpha^2)^2 + (2&#92;xi&#92;omega&#92;alpha)^2}}.&#92;]</span>

The value of <span>&#92;(M&#92;)</span> is the magnitude of the steady-state oscillations. The magnitude increases as the forcing frequency <span>&#92;(&#92;alpha&#92;)</span> approaches the natural frequency <span>&#92;(&#92;omega&#92;)</span>, and the peak is larger for lightly damped systems. A vibrating system that is forced at a frequency close to the natural frequency is said to be in **resonance**. There are many instances of resonance; a famous example is a singer breaking a wine glass with their voice, another is Nuclear Magnetic Resonance.

![Magnitude M of the steady-state response of a forced oscillator with ω = 100Hz, ξ = 0.1 (blue) and ξ = 0.01 (red). The magnitude increases as the forcing frequency α approaches the natural frequency ω.](/pics/390/390-ch1-resonance-8.png)

# Chapter 2: Stringed Instruments

The sound in many musical instruments, for instance guitars and violins, and also pianos, is produced by vibrating strings. In all these instruments a string is stretched and fixed at each end. The sound is produced by plucking, strumming, or striking the string.

![Baroque violin](/pics/390/390-ch2-baroque-violin.png)

## The Dynamics of a Stretched Spring

Consider a string illustrated in Figure 2.2. Let <span>&#92;(u(x,t)&#92;)</span> indicate the deflection from the rest position at position <span>&#92;(x&#92;)</span> along the string and time <span>&#92;(t&#92;)</span>. (Set the deflection <span>&#92;(u = 0&#92;)</span> when the string is not stretched by strumming, striking, etc.) Assume constant tension force <span>&#92;(&#92;tau&#92;)</span>, density <span>&#92;(&#92;rho&#92;)</span>, uniform cross-sectional area <span>&#92;(A&#92;)</span>, and small deflections <span>&#92;(u(x,t)&#92;)</span>.

![Small section of string showing tension τ, angle θ(x), and deflection u(x,t)](/pics/390/390-ch2-string-diagram.png)

Consider a small section of string of length <span>&#92;(&#92;Delta x&#92;)</span>. It has mass <span>&#92;(m = &#92;rho A &#92;Delta x&#92;)</span> and acceleration <span>&#92;(a = &#92;frac{&#92;partial^2 u(x,t)}{&#92;partial t^2}&#92;)</span>. In this case, the function <span>&#92;(u&#92;)</span> depends on both <span>&#92;(t&#92;)</span> and <span>&#92;(x&#92;)</span>. The notation <span>&#92;(&#92;frac{&#92;partial u}{&#92;partial t}&#92;)</span> means take the derivative of <span>&#92;(u&#92;)</span> with respect to <span>&#92;(t&#92;)</span>, regarding <span>&#92;(x&#92;)</span> as constant; and similarly for <span>&#92;(&#92;frac{&#92;partial u}{&#92;partial x}&#92;)</span>. Assume the only force on the stretched string is tension. The vertical component of the force due to tension is

<span>&#92;[F = -&#92;tau&#92;sin(&#92;theta(x)) + &#92;tau&#92;sin(&#92;theta(x + &#92;Delta x)).&#92;]</span>

Newton's second law is <span>&#92;(ma = F&#92;)</span>, and here

<span>&#92;[m = &#92;rho A &#92;Delta x, &#92;quad a = &#92;frac{&#92;partial^2 u(x,t)}{&#92;partial t^2}.&#92;]</span>

Substitute the expressions for mass (<span>&#92;(m&#92;)</span>), acceleration (<span>&#92;(a&#92;)</span>), and force <span>&#92;(F&#92;)</span> and dividing through by <span>&#92;(&#92;Delta x&#92;)</span> yields

<span>&#92;[&#92;rho&#92;frac{&#92;partial^2 u(x,t)}{&#92;partial t^2} = &#92;frac{&#92;tau}{A}&#92;frac{1}{&#92;Delta x}(&#92;sin(&#92;theta(x + &#92;Delta x)) - &#92;sin(&#92;theta(x))).&#92;]</span>

Take the limit as <span>&#92;(&#92;Delta x &#92;to 0&#92;)</span> and define <span>&#92;(c^2 = &#92;frac{&#92;tau}{&#92;rho A}&#92;)</span>:

<span>&#92;[&#92;frac{&#92;partial^2 u(x,t)}{&#92;partial t^2} = c^2 &#92;frac{&#92;partial}{&#92;partial x}&#92;sin(&#92;theta(x)). &#92;tag{2.1}&#92;]</span>

For small deflections, <span>&#92;(&#92;sin(&#92;theta) &#92;approx &#92;tan(&#92;theta) = &#92;frac{&#92;partial u}{&#92;partial x}&#92;)</span>. Equation (2.1) becomes the **wave equation**

<span>&#92;[&#92;frac{&#92;partial^2 u}{&#92;partial t^2} = c^2 &#92;frac{&#92;partial^2 u}{&#92;partial x^2}. &#92;tag{2.2}&#92;]</span>

The wave equation models vibrations <span>&#92;(u&#92;)</span> in a string, such as a guitar or violin string.

Since the string is fixed at each end, the **boundary conditions** are

<span>&#92;[u(0,t) = 0, &#92;quad u(&#92;ell, t) = 0. &#92;tag{2.3}&#92;]</span>

Consider initial conditions given by arbitrary functions <span>&#92;(f&#92;)</span> and <span>&#92;(g&#92;)</span>:

<span>&#92;[u(x,0) = f(x), &#92;quad &#92;frac{&#92;partial u}{&#92;partial t}(x,0) = g(x), &#92;tag{2.4}&#92;]</span>

where <span>&#92;(f&#92;)</span> and <span>&#92;(g&#92;)</span> describe the initial deflection and velocity respectively of the stretched string.

## Solution of the Wave Equation

Partial differential equations are in general very difficult to solve. Try looking for solutions of the form

<span>&#92;[u(x,t) = M(x)N(t).&#92;]</span>

Substitution into (2.2) yields, using <span>&#92;('&#92;)</span> to indicate differentiation,

<span>&#92;[MN'' = c^2 M'' N.&#92;]</span>

Rearranging,

<span>&#92;[&#92;frac{N''}{c^2 N} = &#92;frac{M''}{M}.&#92;]</span>

Since the left-side depends only on time <span>&#92;(t&#92;)</span> and the right-side depends only on space <span>&#92;(x&#92;)</span>, each side must be a constant. Call this constant <span>&#92;(-&#92;lambda&#92;)</span>. This yields two **ordinary** differential equations

<span>&#92;[&#92;begin{aligned}
M''(x) &= -&#92;lambda M(x), &#92;tag{2.7} &#92;&#92;
N'' &= -c^2&#92;lambda N. &#92;tag{2.8}
&#92;end{aligned}&#92;]</span>

The boundary conditions also need to be considered: for all time <span>&#92;(t &#92;geq 0&#92;)</span>,

<span>&#92;[M(0)N(t) = 0, &#92;quad M(&#92;ell)N(t) = 0.&#92;]</span>

The choice <span>&#92;(N(t) &#92;equiv 0&#92;)</span> yields the trivial solution (which in general does not satisfy the initial conditions), so

<span>&#92;[M(0) = 0, &#92;quad M(&#92;ell) = 0.&#92;]</span>

The spatial function <span>&#92;(M&#92;)</span> should satisfy (2.7) and the boundary conditions. The family of all possible solutions to (2.7) is

<span>&#92;[M(x) = A&#92;cos(&#92;sqrt{&#92;lambda}&#92;,x) + B&#92;sin(&#92;sqrt{&#92;lambda}&#92;,x).&#92;]</span>

From the boundary condition at <span>&#92;(x = 0&#92;)</span>, <span>&#92;(A = 0&#92;)</span>. It is also required that

<span>&#92;[B&#92;sin(&#92;sqrt{&#92;lambda}&#92;,&#92;ell) = 0.&#92;]</span>

The equation (2.7) will have non-trivial solutions that satisfy the boundary conditions only if

<span>&#92;[&#92;lambda_k = &#92;left(&#92;frac{&#92;pi k}{&#92;ell}&#92;right)^2, &#92;quad k = 1, 2, &#92;ldots&#92;]</span>

The values <span>&#92;(-&#92;lambda_k = -&#92;left(&#92;frac{&#92;pi k}{&#92;ell}&#92;right)^2&#92;)</span> are called **eigenvalues**, and the corresponding

<span>&#92;[M_k(x) = &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;]</span>

are called **eigenfunctions**. Any constant multiple of <span>&#92;(M_k&#92;)</span> will also be a solution; the constant is set here to 1 for simplicity.

The differential equation for <span>&#92;(N&#92;)</span> (2.8) has solutions

<span>&#92;[N(t) = A_k&#92;cos&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right) + B_k&#92;sin&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right)&#92;]</span>

for constants <span>&#92;(A_k&#92;)</span>, <span>&#92;(B_k&#92;)</span>.

From the calculations, each function of the form

<span>&#92;[u_k(x,t) = &#92;left[A_k&#92;cos&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right) + B_k&#92;sin&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right)&#92;right]&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;]</span>

solves the wave equation and satisfies the boundary conditions. Since the wave equation is a linear equation, any sum of such terms also gives us a solution of the wave equation (2.2):

<span>&#92;[u(x,t) = &#92;sum_{k=1}^{&#92;infty}&#92;left[A_k&#92;cos&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right) + B_k&#92;sin&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right)&#92;right]&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right) &#92;tag{2.9}&#92;]</span>

solves the wave equation and satisfies the boundary conditions <span>&#92;(u(0,t) = 0&#92;)</span>, <span>&#92;(u(&#92;ell,t) = 0&#92;)</span>.

In order for <span>&#92;(u&#92;)</span> to be a solution, constants <span>&#92;(A_k&#92;)</span>, <span>&#92;(B_k&#92;)</span> are needed so that the initial conditions (2.4) are satisfied. The constants <span>&#92;(A_k&#92;)</span> and <span>&#92;(B_k&#92;)</span> in (2.9) need to be chosen so that the initial conditions are satisfied:

<span>&#92;[u(x,0) = f(x) = &#92;sum_{k=1}^{&#92;infty} A_k &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right),&#92;]</span>

<span>&#92;[&#92;frac{&#92;partial u}{&#92;partial t}(x,0) = g(x) = &#92;sum_{k=1}^{&#92;infty} &#92;frac{c&#92;pi k}{&#92;ell} B_k &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right).&#92;]</span>

For initial conditions that are a finite linear combination of functions of the form <span>&#92;(&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;)</span>, this is straightforward. But to include more general initial conditions, arbitrary initial conditions such as the hat function need to be written as a sum of sine functions. It is not clear that this is possible.

The eigenfunctions <span>&#92;(&#92;phi_k(x) = &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;)</span> are **orthogonal**:

<span>&#92;[&#92;int_0^{&#92;ell} &#92;phi_j(x)&#92;phi_k(x)&#92;,dx = &#92;begin{cases} &#92;frac{&#92;ell}{2} & j = k &#92;&#92; 0 & j &#92;neq k &#92;end{cases}.&#92;]</span>

Thus multiply each side of

<span>&#92;[f(x) = &#92;sum_{k=1}^{&#92;infty} A_k &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;]</span>

by <span>&#92;(&#92;phi_j&#92;)</span> and integrate over <span>&#92;([0, &#92;ell]&#92;)</span> to obtain

<span>&#92;[&#92;int_0^{&#92;ell} f(x)&#92;sin&#92;left(k&#92;pi&#92;frac{x}{&#92;ell}&#92;right)dx = A_j &#92;frac{&#92;ell}{2}&#92;]</span>

and so

<span>&#92;[A_j = &#92;frac{2}{&#92;ell}&#92;int_0^{&#92;ell} f(x)&#92;sin&#92;left(j&#92;pi&#92;frac{x}{&#92;ell}&#92;right)dx. &#92;tag{2.10}&#92;]</span>

The series

<span>&#92;[&#92;sum_{k=1}^{&#92;infty} A_k &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right) &#92;tag{2.11}&#92;]</span>

is the **Fourier sine series** for <span>&#92;(f&#92;)</span>.

**Definition 1.** *A function is* piecewise smooth *if it is bounded on <span>&#92;([0, &#92;ell]&#92;)</span> and both <span>&#92;(f&#92;)</span> and its derivative are continuous on <span>&#92;([0, &#92;ell]&#92;)</span> except at a finite number of points.*

Define the partial sums of the Fourier series of <span>&#92;(f&#92;)</span>:

<span>&#92;[&#92;tilde{f}_N(t) = &#92;sum_{n=-N}^{N} A_k &#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;]</span>

where <span>&#92;(A_k&#92;)</span> are determined by (2.10).

**Theorem 2.** *If <span>&#92;(f&#92;)</span> is piecewise smooth on <span>&#92;([0, &#92;ell]&#92;)</span> then at all points <span>&#92;(x &#92;in (0, &#92;ell)&#92;)</span> where <span>&#92;(f&#92;)</span> is continuous*

<span>&#92;[&#92;lim_{N &#92;to &#92;infty} &#92;tilde{f}_N(x) = f(x).&#92;]</span>

*If <span>&#92;(f&#92;)</span> is not continuous at a point <span>&#92;(x_0&#92;)</span> then <span>&#92;(&#92;tilde{f}_N(x_0) &#92;to &#92;frac{f(x_0^-) + f(x_0^+)}{2}&#92;)</span>. Also,*

<span>&#92;[&#92;lim_{N &#92;to &#92;infty}&#92;int_0^{&#92;ell}|f(x) - &#92;tilde{f}_N(x)|^2&#92;,dx = 0.&#92;]</span>

Thus, for piecewise smooth functions, the Fourier series equals the function in the above sense. Also, the corresponding choices of coefficients <span>&#92;(A_k&#92;)</span>, <span>&#92;(B_k&#92;)</span> yield a function where the infinite sum (2.9) solves the wave equation. Thus, this method yields a solution to the wave equation satisfying boundary and initial conditions. This approach to solving a partial differential equation is known as the **Method of Separation of Variables**.

**Example.** Calculate the Fourier sine series for <span>&#92;(f(x) = x&#92;)</span> on <span>&#92;([0, L]&#92;)</span>.

The coefficients of the sine series for <span>&#92;(f(x)&#92;)</span> are

<span>&#92;[&#92;begin{aligned}
&#92;frac{L}{2}B_k &= &#92;int_0^L f(x)&#92;sin&#92;left(&#92;frac{k&#92;pi x}{L}&#92;right)&#92;,dx &#92;&#92;
&= &#92;int_0^L x&#92;sin&#92;left(&#92;frac{k&#92;pi x}{L}&#92;right)&#92;,dx &#92;&#92;
&= &#92;frac{L}{&#92;pi^2 k^2}&#92;left[L&#92;sin&#92;left(&#92;frac{k&#92;pi x}{L}&#92;right) - k&#92;pi x&#92;cos&#92;left(&#92;frac{k&#92;pi x}{L}&#92;right)&#92;right]_0^L &#92;&#92;
&= &#92;frac{L^2}{&#92;pi^2 k^2}&#92;left(&#92;underbrace{&#92;sin(k&#92;pi)}_{=0} - k&#92;pi&#92;underbrace{&#92;cos(k&#92;pi)}_{=(-1)^k}&#92;right) &#92;&#92;
&= &#92;frac{L^2}{&#92;pi^2 k^2}(-k&#92;pi)(-1)^k &#92;&#92;
&= &#92;frac{L^2}{k&#92;pi}(-1)^{k+1}.
&#92;end{aligned}&#92;]</span>

Therefore,

<span>&#92;[f(x) = &#92;frac{2L}{&#92;pi}&#92;sum_{n=1}^{&#92;infty}&#92;frac{(-1)^{k+1}}{k}&#92;sin&#92;left(&#92;frac{k&#92;pi x}{L}&#92;right). &#92;tag{2.12}&#92;]</span>

**Example:** Consider a **hat function** such as shown in Figure 2.3:

<span>&#92;[f(x) = &#92;begin{cases} &#92;frac{x}{x_0} & 0 &#92;leq x < x_0 &#92;&#92; &#92;frac{&#92;ell - x}{&#92;ell - x_0} & x_0 &#92;leq x &#92;leq &#92;ell &#92;end{cases} &#92;tag{2.13}&#92;]</span>

The coefficients <span>&#92;(A_k&#92;)</span> in its Fourier sine series

<span>&#92;[f(x) = &#92;sum_{k=1}^{&#92;infty} A_k &#92;sin&#92;left(k&#92;pi&#92;frac{x}{&#92;ell}&#92;right)&#92;]</span>

are, using the formula (2.10),

<span>&#92;[A_k = &#92;frac{2}{&#92;ell}&#92;int_0^{&#92;ell} f(x)&#92;sin&#92;left(k&#92;pi&#92;frac{x}{&#92;ell}&#92;right)dx = &#92;frac{2&#92;ell^2}{&#92;pi^2 x_0(&#92;ell - x_0)}&#92;frac{&#92;sin&#92;left(k&#92;pi&#92;frac{x_0}{&#92;ell}&#92;right)}{k^2}. &#92;tag{2.14}&#92;]</span>

## Summary and Some Vocabulary

Using the above model, the deflection <span>&#92;(u(x,t)&#92;)</span> of a stretched string, fixed at each end, is

<span>&#92;[u(x,t) = &#92;sum_{k=1}^{&#92;infty}&#92;underbrace{&#92;left[A_k&#92;cos&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right) + B_k&#92;sin&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right)&#92;right]}_{u_k(x,t)}&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right). &#92;tag{2.15}&#92;]</span>

The coefficients <span>&#92;(A_k&#92;)</span> and <span>&#92;(B_k&#92;)</span> are chosen so that the correct initial position and velocity is obtained.

The individual terms <span>&#92;(u_k&#92;)</span> are called the **modes of vibration** or **modes** of the response. Sometimes, just the spatial part

<span>&#92;[&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right)&#92;]</span>

is referred to as a mode. (Context indicates whether the transient behaviour or just the spatial variation is being discussed.) In this course the term **mode shape** will be used to avoid ambiguity.

The solution (2.15) shows that the sound of a vibrating string is the sum of multiple (in theory infinite) frequencies. The lowest frequency in the response is called the **fundamental frequency**. For a stretched string this is <span>&#92;(&#92;frac{&#92;pi c}{&#92;ell}&#92;)</span> rad/s or <span>&#92;(&#92;frac{&#92;pi c}{2&#92;pi&#92;ell}&#92;)</span> Hz. The frequencies above the fundamental frequency are called **overtones**. Note that the individual frequencies in the response are all integer multiples of the lowest frequency. These overtones are called **harmonics**.

![Spectrogram of a guitar string showing harmonics as evenly spaced horizontal bands](/pics/390/390-ch2-spectrogram-07.png)

## Harmonics of Piano and Harpsichord

The harmonics of the harpsichord and piano will be compared. The sound in both instruments is produced by vibrations in strings. However, in a harpsichord the string is plucked while in a piano the string is struck. Although the two instruments look superficially quite similar, the sound is quite different. Let's examine the mathematics of this.

![A harpsichord made in the Flemish style (top) and a modern concert grand piano (bottom)](/pics/390/390-ch2-harpsichord.png)

![Inside of a grand piano](/pics/390/390-ch2-piano-inside.png)

### Harpsichord

When one of the keys on the harpsichord's keyboard is depressed, a mechanism protecting the string pops up, a device plucks the string, and then the mechanism falls back so that the string is only plucked once per keyboard strike. Therefore, the initial position of the string is described by the **hat function**

<span>&#92;[f(x) = &#92;begin{cases} &#92;frac{x}{x_0} & 0 &#92;leq x < x_0 &#92;&#92; &#92;frac{&#92;ell - x}{&#92;ell - x_0} & x_0 &#92;leq x &#92;leq &#92;ell &#92;end{cases} &#92;tag{2.16}&#92;]</span>

<span>&#92;(f(x)&#92;)</span>, shown in Figure 2.3, while the string has a zero initial velocity. The coefficients of the Fourier sine series of <span>&#92;(f(x)&#92;)</span> were calculated above (see (2.14)) as

<span>&#92;[A_k = &#92;frac{2}{&#92;ell}&#92;int_0^{&#92;ell} f(x)&#92;sin&#92;left(k&#92;pi&#92;frac{x}{&#92;ell}&#92;right)dx = &#92;frac{2&#92;ell^2}{&#92;pi^2 x_0(&#92;ell - x_0)}&#92;frac{&#92;sin&#92;left(k&#92;pi&#92;frac{x_0}{&#92;ell}&#92;right)}{k^2}.&#92;]</span>

Thus, with initial conditions <span>&#92;(u(x,0) = f(x)&#92;)</span> and <span>&#92;(&#92;frac{&#92;partial u}{&#92;partial x}(x,0) = 0&#92;)</span>, the deflection of a string (see (2.15)) is

<span>&#92;[u_p(x,t) = &#92;sum_{k=1}^{&#92;infty} A_k &#92;cos&#92;left(&#92;frac{k&#92;pi ct}{&#92;ell}&#92;right)&#92;sin&#92;left(&#92;frac{k&#92;pi x}{&#92;ell}&#92;right). &#92;tag{2.17}&#92;]</span>

Since the coefficients <span>&#92;(A_k&#92;)</span> depend on the point <span>&#92;(x_0&#92;)</span> at which the string is plucked, this implies that the sound of a plucked stringed instrument (guitar, harp, harpsichord, and others) depends heavily on the position at which the string is plucked. This is why some harpsichords employ a mechanism (called a stop) to pluck the strings at different lengths away from the keyboard. This changes the sound of the instrument. Notice in particular that if <span>&#92;(x_0 = &#92;frac{&#92;ell}{2}&#92;)</span>,

<span>&#92;[&#92;begin{aligned}
A_{2k} &= &#92;frac{2L^2}{&#92;pi^2 x_0(L - x_0)}&#92;frac{&#92;sin&#92;left(&#92;frac{(2k)&#92;pi x_0}{L}&#92;right)}{(2k)^2} &#92;&#92;
&= &#92;frac{2L^2}{&#92;pi^2 &#92;frac{L}{2}(L - &#92;frac{L}{2})}&#92;frac{&#92;sin&#92;left(&#92;frac{(2k)&#92;pi&#92;frac{L}{2}}{L}&#92;right)}{(2k)^2} &#92;&#92;
&= &#92;frac{2}{&#92;pi^2}&#92;frac{&#92;sin(k&#92;pi)}{k^2} &#92;&#92;
&= 0,
&#92;end{aligned}&#92;]</span>

since <span>&#92;(&#92;sin(k&#92;pi) = 0&#92;)</span> for <span>&#92;(k &#92;in &#92;mathbb{N}&#92;)</span>. Thus, all the even harmonics will be missing.

### Piano

In a piano, the taut string lies flat, and a hammer strikes the string when a key is depressed. From this, we gather that the initial position of the string is zero, but when the hammer strikes the string, its initial velocity is non-zero. When the string is struck by the hammer, the graph of its initial velocity takes the shape of the hat function <span>&#92;(f(x)&#92;)</span> shown in Figure 2.3 and defined in (2.16).

Since the initial position is the zero function, <span>&#92;(A_k = 0&#92;)</span> for all <span>&#92;(k&#92;)</span> in the expression for the deflections (2.15). Term-by-term differentiation of (2.15) yields

<span>&#92;[&#92;frac{&#92;partial u}{&#92;partial t}(x,t) = &#92;sum_{k=1}^{&#92;infty}&#92;frac{&#92;pi k c}{&#92;ell}&#92;left[-A_k&#92;sin&#92;left(&#92;frac{&#92;pi k ct}{&#92;ell}&#92;right) + B_k&#92;cos&#92;left(&#92;frac{&#92;pi k ct}{&#92;ell}&#92;right)&#92;right]&#92;sin&#92;left(&#92;frac{k&#92;pi x}{&#92;ell}&#92;right).&#92;]</span>

and since <span>&#92;(A_k = 0&#92;)</span>,

<span>&#92;[&#92;frac{&#92;partial u}{&#92;partial t}(x,0) = f(x) = &#92;sum_{k=1}^{&#92;infty}&#92;frac{&#92;pi k c}{&#92;ell}B_k&#92;sin&#92;left(&#92;frac{k&#92;pi x}{&#92;ell}&#92;right). &#92;tag{2.18}&#92;]</span>

Solving for <span>&#92;(B_k&#92;)</span> and using the Fourier series for the hat function calculated in (2.14),

<span>&#92;[&#92;begin{aligned}
B_k &= A_k &#92;frac{&#92;ell}{&#92;pi k c} &#92;&#92;
&= &#92;frac{2&#92;ell^3}{&#92;pi^3 c x_0(&#92;ell - x_0)}&#92;frac{&#92;sin&#92;left(&#92;frac{k&#92;pi x_0}{&#92;ell}&#92;right)}{k^3}.
&#92;end{aligned}&#92;]</span>

Thus, with initial conditions <span>&#92;(u(x,0) = 0&#92;)</span> and <span>&#92;(&#92;frac{&#92;partial u}{&#92;partial x}(x,0) = f(x)&#92;)</span>, the deflection of a string (see (2.15)) is

<span>&#92;[u(x,t) = &#92;sum_{k=1}^{&#92;infty} B_k &#92;sin&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right)&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right).&#92;]</span>

### Comparison

The Fourier coefficients <span>&#92;(A_k&#92;)</span> of the harpsichord vanish as <span>&#92;(A_k &#92;propto &#92;frac{1}{k^2}&#92;)</span>, while the piano's harmonics vanish as <span>&#92;(B_k &#92;propto &#92;frac{1}{k^3}&#92;)</span>. This says that the harpsichord retains more of its higher harmonics than the piano, hence contributing to the vast difference in tone between the two string instruments, simply because of how the strings are sounded (plucked vs struck).

## Modes of Vibration

<span>&#92;[u(x,t) = &#92;sum_{k=1}^{&#92;infty}&#92;left[A_k&#92;cos&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right) + B_k&#92;sin&#92;left(&#92;frac{&#92;pi k c}{&#92;ell}t&#92;right)&#92;right]&#92;sin&#92;left(&#92;frac{&#92;pi k}{&#92;ell}x&#92;right).&#92;]</span>

The individual terms <span>&#92;(u_k&#92;)</span> are the **modes of vibration** of the response. For a vibrating string with fixed ends, each mode of vibration is

<span>&#92;[u_k(x,t) = (A_k&#92;cos(&#92;omega_k t) + B_k&#92;sin(&#92;omega_k t))&#92;sin&#92;left(&#92;frac{&#92;omega_k}{c}x&#92;right)&#92;]</span>

Defining

<span>&#92;[M_k = &#92;sqrt{A_k^2 + B_k^2}, &#92;quad &#92;sin&#92;phi_k = &#92;frac{A_k}{&#92;sqrt{A_k^2 + B_k^2}}, &#92;quad &#92;cos&#92;phi_k = &#92;frac{B_k}{&#92;sqrt{A_k^2 + B_k^2}},&#92;]</span>

<span>&#92;[u_k(x,t) = M_k&#92;sin(&#92;omega_k t + &#92;phi_k)&#92;sin&#92;left(&#92;frac{&#92;omega_k}{c}x&#92;right)&#92;]</span>

The maximum amplitude of each mode is constant with time. The **mode shapes** for a vibrating string where deflection <span>&#92;(u = 0&#92;)</span> at each end are

<span>&#92;[&#92;sin&#92;left(&#92;frac{&#92;omega_k}{c}x&#92;right).&#92;]</span>

In a vibrating string, for each mode of vibration beyond the first mode, there are point(s) <span>&#92;(0 < x < &#92;ell&#92;)</span> where the deflection is 0 at all time. Such points are called **nodes**. The first seven modes are illustrated in Figure 2.8.

![The first seven modes of the vibrating string of length ℓ, showing nodes at L/2, L/3, L/4, etc.](/pics/390/390-ch2-modes-diagram.png)

# Chapter 3: Wind Instruments

The sound in many instruments, such as the clarinet and flute, is made by blowing air into the instrument. Here we consider models where the instrument can be treated as a cylinder much longer than it is wide, so that only one space dimension needs to be considered. This assumption is reasonable for clarinets and flutes.

Consider particles at position <span>&#92;(x&#92;)</span> when undisturbed and denote displacement from the "usual" location <span>&#92;(x&#92;)</span> by <span>&#92;(u(x,t)&#92;)</span>. (Think of a slinky.) Denote similarly pressure <span>&#92;(P(x,t)&#92;)</span>, density <span>&#92;(&#92;rho(x,t)&#92;)</span>. Let <span>&#92;(P_0 = 0&#92;)</span> be the pressure of the undisturbed air and <span>&#92;(&#92;rho_0&#92;)</span> the density. Assume that only motion in the <span>&#92;(x&#92;)</span>-direction is present; then from Newton's Law on a section <span>&#92;([x, x + &#92;Delta x]&#92;)</span>, letting cross-sectional area be <span>&#92;(A&#92;)</span>,

<span>&#92;[&#92;begin{aligned}
ma &= F &#92;&#92;
&#92;rho_0 A(x)&#92;Delta x &#92;frac{&#92;partial^2 u}{&#92;partial t^2} &= A(x)P(x,t) - A(x + &#92;Delta x)P(x + &#92;Delta x, t)
&#92;end{aligned}&#92;]</span>

Assume cross-sectional area <span>&#92;(A&#92;)</span> is constant and divide through by <span>&#92;(A&#92;Delta x&#92;)</span>:

<span>&#92;[&#92;rho_0 &#92;frac{&#92;partial^2 u}{&#92;partial t^2} = -&#92;frac{P(x + &#92;Delta x, t) - P(x,t)}{&#92;Delta x}.&#92;]</span>

Taking the limit as <span>&#92;(&#92;Delta x &#92;to 0&#92;)</span> yields

<span>&#92;[&#92;rho_0 &#92;frac{&#92;partial^2 u}{&#92;partial t^2} = -&#92;frac{&#92;partial P(x,t)}{&#92;partial x}. &#92;tag{3.1}&#92;]</span>

An equation in only one variable is needed. Write <span>&#92;(P'(&#92;rho) = &#92;frac{&#92;partial P}{&#92;partial &#92;rho}&#92;)</span>. Then the linear approximation to <span>&#92;(P&#92;)</span> as a function of <span>&#92;(&#92;rho&#92;)</span> is, recalling that <span>&#92;(P(&#92;rho_0) = P_0 = 0&#92;)</span>,

<span>&#92;[P(&#92;rho) &#92;approx P'(&#92;rho_0)(&#92;rho - &#92;rho_0). &#92;tag{3.2}&#92;]</span>

Also, since <span>&#92;(&#92;rho = &#92;frac{&#92;text{Mass}}{&#92;text{Volume}}&#92;)</span>,

<span>&#92;[&#92;rho(x,t) = &#92;frac{&#92;rho_0 A&#92;Delta x}{A(x + &#92;Delta x + u(x+&#92;Delta x, t) - (x + u(x,t)))} = &#92;frac{&#92;rho_0}{1 + &#92;frac{u(x+&#92;Delta x,t) - u(x,t)}{&#92;Delta x}}.&#92;]</span>

Taking the limit as <span>&#92;(&#92;Delta x &#92;to 0&#92;)</span>, <span>&#92;(&#92;rho(x,t) = &#92;rho_0(1 + &#92;frac{&#92;partial u}{&#92;partial x})^{-1} &#92;approx &#92;rho_0(1 - &#92;frac{&#92;partial u}{&#92;partial x})&#92;)</span>. Substituting into (3.2) yields

<span>&#92;[P(x,t) &#92;approx -P'(&#92;rho_0)&#92;rho_0 &#92;frac{&#92;partial u}{&#92;partial x}. &#92;tag{3.3}&#92;]</span>

Substitute (3.3) into (3.1) to obtain, after dividing by <span>&#92;(&#92;rho_0&#92;)</span> and defining <span>&#92;(c^2 = P'(&#92;rho_0)&#92;)</span>,

<span>&#92;[&#92;frac{&#92;partial^2 u(x,t)}{&#92;partial t^2} = c^2 &#92;frac{&#92;partial^2 u(x,t)}{&#92;partial x^2}. &#92;tag{3.4}&#92;]</span>

**Same equation as for a stretched string!**

The constant <span>&#92;(c&#92;)</span> in equation (3.4) is the **speed of sound** in the given medium, in this case air. It increases strongly with temperature.

## Flute

A flute is essentially a long open tube with constant cross-sectional area, so equation (3.4) applies. Both ends are open, so the pressure <span>&#92;(P(x,t) = P_0 = 0&#92;)</span> at the ends. Using (3.3) this yields the boundary conditions, for a flute of length <span>&#92;(&#92;ell&#92;)</span>,

<span>&#92;[&#92;frac{&#92;partial u}{&#92;partial x}(0,t) = 0, &#92;quad &#92;frac{&#92;partial u}{&#92;partial x}(&#92;ell,t) = 0. &#92;tag{3.5}&#92;]</span>

Since (3.4) is the same equation as studied previously for a vibrating string, the same solution procedure can be used. Separation of variables means substituting <span>&#92;(u(x,t) = M(x)N(t)&#92;)</span> into (3.4) and rearranging to obtain

<span>&#92;[&#92;frac{N''(t)}{c^2 N(t)} = &#92;frac{M''(x)}{M(x)} = -&#92;lambda.&#92;]</span>

This yields the differential equation <span>&#92;(M''(x) + &#92;lambda M(x) = 0&#92;)</span>, and so with arbitrary constants <span>&#92;(c_1&#92;)</span>, <span>&#92;(c_2&#92;)</span>,

<span>&#92;[M(x) = c_1&#92;cos(&#92;sqrt{&#92;lambda}&#92;,x) + c_2&#92;sin(&#92;sqrt{&#92;lambda}&#92;,x).&#92;]</span>

But to satisfy the boundary conditions (3.5), <span>&#92;(M'(0) = 0&#92;)</span> and <span>&#92;(M'(&#92;ell) = 0&#92;)</span>, so <span>&#92;(c_2 = 0&#92;)</span> and <span>&#92;(&#92;sqrt{&#92;lambda}&#92;,&#92;ell = k&#92;pi&#92;)</span> for <span>&#92;(k = 0, 1, 2, &#92;ldots&#92;)</span> Thus

<span>&#92;[M(x) = c_1&#92;cos&#92;left(&#92;frac{k&#92;pi}{&#92;ell}x&#92;right).&#92;]</span>

Defining <span>&#92;(&#92;omega_k = &#92;frac{k&#92;pi c}{&#92;ell}&#92;)</span>, the time equation <span>&#92;(N''(t) + &#92;omega_k^2 N(t) = 0&#92;)</span> has general solution <span>&#92;(N(t) = A_k&#92;cos(&#92;omega_k t) + B_k&#92;sin(&#92;omega_k t)&#92;)</span>. The full solution is

<span>&#92;[u(x,t) = &#92;sum_{k=1}^{&#92;infty}(A_k&#92;cos(&#92;omega_k t) + B_k&#92;sin(&#92;omega_k t))&#92;cos&#92;left(&#92;frac{&#92;omega_k}{c}x&#92;right), &#92;quad &#92;omega_k = &#92;frac{k&#92;pi c}{&#92;ell}&#92;]</span>

where <span>&#92;(A_k&#92;)</span>, <span>&#92;(B_k&#92;)</span> are chosen so initial conditions are satisfied. The **fundamental frequency** is the lowest frequency present:

<span>&#92;[&#92;frac{&#92;pi c}{&#92;ell} &#92;text{ rad/s}, &#92;quad &#92;frac{c}{2&#92;ell} &#92;text{ Hz}.&#92;]</span>

The parameter <span>&#92;(c&#92;)</span> depends on temperature, weakly on humidity. For dry air, <span>&#92;(c = 342&#92;)</span> m/s (20°C), <span>&#92;(c = 345&#92;)</span> m/s (25°C). Using <span>&#92;(c = 344&#92;)</span> m/s,

| Instrument | Length (m) | Theo. pitch (Hz) | Actual pitch (Hz) |
|---|---|---|---|
| flute | 0.66 | 260 | 262 |
| short tube | 0.3 | 573 | 524 |
| long tube | 0.63 | 273 | 262 |

Length clearly corresponds to pitch. The errors, which are more significant for shorter tubes, are due primarily to **end effects**: the pressure is not zero exactly at the ends, but drops to zero at a small distance from the end.

Different notes can be produced by opening and covering various holes, thus changing the effective length of the instrument. This is the case for many woodwind instruments, such as oboe, clarinet, saxophone, and flute. On the flute and many other instruments, different notes are also produced, without changing the fingering, by exciting various overtones or resonant frequencies of the instrument.

The analysis predicts that the frequencies <span>&#92;(&#92;omega_k = &#92;frac{k&#92;pi c}{&#92;ell}&#92;)</span> are present. Writing the fundamental at <span>&#92;(&#92;omega_1&#92;)</span>, the overtones are integer multiples of the fundamental:

<span>&#92;[&#92;omega_2 = 2&#92;omega_1, &#92;quad &#92;omega_3 = 3&#92;omega_1, &#92;ldots&#92;]</span>

Overtones that occur as integer multiples of the fundamental are also called **harmonics**.

## Clarinet

A **clarinet** has a **reed** made of thin cane at the mouthpiece. The player blows into the mouthpiece, causing the reed to vibrate. As the reed bends under the pressure of the airstream, it behaves as a spring, repeatedly closing and opening the mouthpiece. This back-and-forth motion produces vibrations in the air column at the mouthpiece. As with the flute, this initial motion then causes the air column trapped in the clarinet body to vibrate at its natural frequency. The reed is forced by the air column and vibrates at the same frequency.

The wave equation also applies to sound waves in a clarinet. Key facts:

- About the same length as a flute
- Also a cross-section that is approximately constant
- End (<span>&#92;(x = &#92;ell&#92;)</span>) is open

Sound is produced by vibration of the reed against the mouthpiece and pressure at <span>&#92;(x = 0&#92;)</span> is not zero. The small opening and the fluctuations where the reed closes the opening mean that an appropriate set of boundary conditions is

<span>&#92;[u(0,t) = 0, &#92;quad &#92;frac{&#92;partial u}{&#92;partial x}(&#92;ell, t) = 0. &#92;tag{3.6}&#92;]</span>

Separation of variables again is used to solve the wave equation, but now the spatial function <span>&#92;(M&#92;)</span> must satisfy <span>&#92;(M''(x) + &#92;lambda M(x) = 0&#92;)</span> with <span>&#92;(M(0) = 0&#92;)</span>, <span>&#92;(M'(&#92;ell) = 0&#92;)</span>. Solving yields

<span>&#92;[M(x) = c_2&#92;sin(&#92;sqrt{&#92;lambda_k}&#92;,x)&#92;]</span>

where <span>&#92;(&#92;sqrt{&#92;lambda_k} = (k - &#92;frac{1}{2})&#92;frac{&#92;pi}{&#92;ell} = &#92;frac{(2k-1)&#92;pi}{2&#92;ell}&#92;)</span>, <span>&#92;(k = 1, 2, &#92;ldots&#92;)</span> so that <span>&#92;(M'(&#92;ell) = 0&#92;)</span>.

Defining <span>&#92;(&#92;omega_k = &#92;sqrt{&#92;lambda_k}&#92;,c = &#92;frac{(2k-1)&#92;pi c}{2&#92;ell}&#92;)</span>, the solution is

<span>&#92;[u(x,t) = &#92;sum_{k=1}^{&#92;infty}(A_k&#92;cos(&#92;omega_k t) + B_k&#92;sin(&#92;omega_k t))&#92;sin&#92;left(&#92;frac{&#92;omega_k}{c}x&#92;right)&#92;]</span>

The predicted fundamental frequency is

<span>&#92;[&#92;omega_1 = &#92;sqrt{&#92;lambda_1}&#92;,c = &#92;frac{&#92;pi c}{2&#92;ell} = &#92;frac{c}{4&#92;ell} &#92;text{ Hz}&#92;]</span>

| Instrument | Length (m) | Theo. pitch (Hz) | Actual pitch (Hz) |
|---|---|---|---|
| clarinet | 0.6 | 143 | 147 (D3) |
| flute | 0.66 | 260 | 262 (C4) |
| closed short red tube | 0.3 | 286 | 262 (C4) |
| open short red tube | 0.3 | 573 | 524 (C5) |
| open long red tube | 0.63 | 273 | 262 (C4) |

Two key observations:
- The fundamental of the tube with one end closed is half that of the open tube, as predicted by theory.
- The clarinet is about the same length as a flute but the fundamental frequency is nearly half that of a flute.

The analysis predicts that the frequencies <span>&#92;(&#92;omega_k = &#92;frac{(2k-1)c}{4&#92;ell}&#92;)</span> are present. Writing the fundamental at <span>&#92;(&#92;omega_1 = &#92;frac{c}{4&#92;ell}&#92;)</span>:

<span>&#92;[&#92;omega_2 = 3&#92;omega_1, &#92;quad &#92;omega_3 = 5&#92;omega_1, &#92;ldots&#92;]</span>

Although these overtones are harmonics, **only the odd harmonics are present**. This is reflected in the spectrogram of a clarinet.

![Spectrogram of note A4 (440Hz) on a clarinet. The first overtone occurs at 3 times the fundamental, as predicted by the theory.](/pics/390/390-ch3-clarinet-spectrogram-a4-6.png)

## Vocabulary

**Fundamental (frequency)** — lowest frequency of a note/sound. Generally the perceived pitch.

**Overtones** — frequencies above the fundamental frequency. The first component above the fundamental is the first overtone.

**Harmonics** — overtones that are at integer multiples of the fundamental.

**Partials** — the <span>&#92;(m&#92;)</span>th partial is the <span>&#92;(m&#92;)</span>th frequency component present. The fundamental frequency is the first partial.

**Pitch** — perceived frequency of a sound; generally the fundamental frequency (20Hz–20,000Hz is the range audible to humans).

**Timbre** — determined strongly by frequencies present in a sound; in particular overtones and their relative strength. Transients also affect timbre.

**Amplitude** — magnitude of vibration; corresponds to loudness.

**Duration** — length of time a note sounds.

As an example of using these terms, consider a clarinet:
- Fundamental frequency <span>&#92;(&#92;frac{c}{4&#92;ell}&#92;)</span>; also the first harmonic
- Second harmonic <span>&#92;(&#92;frac{2c}{4&#92;ell}&#92;)</span> is not present
- <span>&#92;(&#92;frac{3c}{4&#92;ell}&#92;)</span> is the third harmonic or first overtone

## More Complex Models

The simplest model for oboes, saxophones, and brass instruments is a tube of varying cross-section. The wave equation becomes

<span>&#92;[&#92;frac{&#92;partial^2 u(x,t)}{&#92;partial t^2} = &#92;frac{c^2}{A(x)}&#92;frac{&#92;partial}{&#92;partial x}&#92;left(A(x)&#92;frac{&#92;partial u(x,t)}{&#92;partial x}&#92;right).&#92;]</span>

For some profiles <span>&#92;(A(x)&#92;)</span> this equation can be solved theoretically using separation of variables, but the calculations are more complicated. The precise profile <span>&#92;(A(x)&#92;)</span> affects the fundamental frequency and the overtones. For example, soprano saxophone and clarinet are about the same length, and look similar, but soprano saxophone has a conical profile. The fundamental of a clarinet is almost an octave lower, and the timbre is quite different.

For many instruments, a two- or three-dimensional model needs to be considered because the sound waves travel in more than one direction. Nonlinearities are also often important. For some instruments, such as oboes, other effects such as the vibrations of the reed are important and accurate mathematical models are difficult. Complex models are needed to model the acoustic response of vocal folds and the associated throat area.

# Chapter 4: Drums

A drum is a membrane stretched over a frame and fixed at the frame. Only a model for a simple drum — that is, a single membrane with no enclosure — will be developed. A **bodhrán** is an example of this type of drum. Assuming gravity is negligible compared to the tension, Newton's Law applied to a small region gives

<span>&#92;[&#92;rho&#92;Delta x&#92;Delta y&#92;frac{&#92;partial^2 u}{&#92;partial t^2} = &#92;text{Force of Tension}&#92;]</span>

where <span>&#92;(&#92;rho&#92;)</span> is mass per unit area (kg/m²). The governing equation for a vibrating string was derived assuming constant density, a perfectly flexible string, no resistance, friction or other dissipative forces, and small deflections so nonlinearities are neglected.

Applying these same assumptions to a stretched membrane, and using the same technique as for a string (but with vector calculus), leads to the **2D wave equation**. Defining <span>&#92;(c^2 = &#92;frac{T}{&#92;rho}&#92;)</span> where <span>&#92;(T&#92;)</span> is tension (force per unit length, N/m):

<span>&#92;[&#92;frac{&#92;partial^2 u}{&#92;partial t^2} = c^2&#92;left(&#92;frac{&#92;partial^2 u(x,t)}{&#92;partial x^2} + &#92;frac{&#92;partial^2 u(x,t)}{&#92;partial y^2}&#92;right), &#92;quad (x,y) &#92;in &#92;Omega&#92;]</span>

with boundary condition <span>&#92;(u(x,y,t) = 0&#92;)</span> for <span>&#92;((x,y) &#92;in &#92;partial&#92;Omega&#92;)</span>.

Typically <span>&#92;(&#92;Omega&#92;)</span> is a disk of radius <span>&#92;(a&#92;)</span>. Since <span>&#92;(&#92;Omega&#92;)</span> is a disc, **polar coordinates** are natural. Using <span>&#92;(x = r&#92;cos&#92;theta&#92;)</span>, <span>&#92;(y = r&#92;sin&#92;theta&#92;)</span>, the wave equation in polar coordinates is

<span>&#92;[&#92;frac{&#92;partial^2 u}{&#92;partial t^2} = c^2&#92;left(&#92;frac{1}{r}&#92;frac{&#92;partial}{&#92;partial r}&#92;left(r&#92;frac{&#92;partial u}{&#92;partial r}&#92;right) + &#92;frac{1}{r^2}&#92;frac{&#92;partial^2 u}{&#92;partial&#92;theta^2}&#92;right)&#92;]</span>

Since the membrane is fixed around the edges and is a continuous material, the boundary conditions are

<span>&#92;[u(r, 0, t) = u(r, 2&#92;pi, t) = 0, &#92;quad u(a, &#92;theta, t) = 0, &#92;quad u(0, &#92;theta, t) < &#92;infty&#92;]</span>

## Separation of Variables in Polar Coordinates

Since there are 3 variables, try <span>&#92;(u(r, &#92;theta, t) = R(r)&#92;Theta(&#92;theta)T(t)&#92;)</span>. Substituting into the wave equation and rearranging yields

<span>&#92;[&#92;frac{T''}{c^2 T} = &#92;left[&#92;frac{1}{rR}(rR')' + &#92;frac{1}{r^2}&#92;frac{&#92;Theta''}{&#92;Theta}&#92;right] = -&#92;lambda^2 &#92;tag{4.1}&#92;]</span>

since <span>&#92;(t&#92;)</span>, <span>&#92;(r&#92;)</span>, <span>&#92;(&#92;theta&#92;)</span> are independent. This gives <span>&#92;(T'' + c^2&#92;lambda^2 T = 0&#92;)</span>, the same oscillator equation obtained previously, so

<span>&#92;[T(t) = A_n&#92;cos(c&#92;lambda t) + B_n&#92;sin(c&#92;lambda t).&#92;]</span>

Rearranging (4.1),

<span>&#92;[&#92;frac{r}{R}(rR')' + &#92;lambda^2 r^2 = -&#92;frac{&#92;Theta''}{&#92;Theta}.&#92;]</span>

Since the left side depends only on <span>&#92;(r&#92;)</span> and the right side only on <span>&#92;(&#92;theta&#92;)</span>, each must equal a constant <span>&#92;(&#92;mu^2&#92;)</span>. Thus:

<span>&#92;[&#92;Theta'' + &#92;mu^2&#92;Theta = 0&#92;]</span>

<span>&#92;[(rR')' + &#92;lambda^2 rR - &#92;frac{&#92;mu^2}{r}R = 0&#92;]</span>

The equation for <span>&#92;(&#92;Theta&#92;)</span> is the oscillator equation. For periodicity with period <span>&#92;(2&#92;pi&#92;)</span>, we need <span>&#92;(&#92;mu = n&#92;)</span>, <span>&#92;(n = 0, 1, 2, &#92;ldots&#92;)</span>

## Bessel Functions

The equation for <span>&#92;(R&#92;)</span> is a new differential equation. Any solution has the form, for constants <span>&#92;(D_n&#92;)</span>, <span>&#92;(E_n&#92;)</span>,

<span>&#92;[R(r) = D_n J_n(&#92;lambda r) + E_n Y_n(&#92;lambda r)&#92;]</span>

where <span>&#92;(J_n&#92;)</span>, <span>&#92;(Y_n&#92;)</span> are <span>&#92;(n&#92;)</span>th-order **Bessel functions** of the first and second kind respectively. Since the Bessel functions of the second kind <span>&#92;(Y_n&#92;)</span> are unbounded at <span>&#92;(r = 0&#92;)</span>, <span>&#92;(E_n = 0&#92;)</span> for all <span>&#92;(n&#92;)</span> and

<span>&#92;[R(r) = D_n J_n(&#92;lambda r).&#92;]</span>

The boundary conditions also imply <span>&#92;(R(a) = 0 = J_n(&#92;lambda a)&#92;)</span>.

For each <span>&#92;(n&#92;)</span>, <span>&#92;(J_n&#92;)</span> has an infinite number of zeros. This yields the values of <span>&#92;(&#92;lambda_{n,m}&#92;)</span>, <span>&#92;(m = 1, 2, &#92;ldots&#92;)</span> The zeros of the Bessel functions <span>&#92;(J_n&#92;)</span> have some important properties:

- Each <span>&#92;(J_n&#92;)</span> has an infinite number of zeros, approaching infinity.
- Except for <span>&#92;(r = 0&#92;)</span>, <span>&#92;(J_n&#92;)</span> and <span>&#92;(J_m&#92;)</span>, <span>&#92;(n &#92;neq m&#92;)</span>, have no zeros in common.
- **The zeros are not evenly spaced.**

![Bessel functions J₀, J₁, J₂ of the first kind (top) and Y₀, Y₁, Y₂ of the second kind (bottom)](/pics/390/390-ch4-bessel-5.png)

## Solution for the Drum

Assuming zero initial velocity, the deflections <span>&#92;(u&#92;)</span> of a stretched round membrane are

<span>&#92;[u(r,&#92;theta,t) = &#92;sum_{m=1}^{&#92;infty}&#92;sum_{n=0}^{&#92;infty}(A_{nm}&#92;cos(n&#92;theta) + B_{nm}&#92;sin(n&#92;theta))J_n(&#92;lambda_{n,m}r)&#92;cos(c&#92;lambda_{n,m}t)&#92;]</span>

where <span>&#92;(&#92;lambda_{n,m}&#92;)</span> are such that <span>&#92;(J_n(&#92;lambda_{n,m}a) = 0&#92;)</span>.

The natural frequencies of vibration are <span>&#92;(c&#92;lambda_{n,m}&#92;)</span> where <span>&#92;(&#92;lambda_{n,m}&#92;)</span> are zeros of <span>&#92;(J_n&#92;)</span>. **Because the zeros of <span>&#92;(J_n&#92;)</span> are not evenly spaced, a round drum has overtones, but they are not harmonics.** This is why drums do not produce a clear sense of pitch in the same way that stringed or wind instruments do.

The **mode shape** — the spatial part of the response for the mode <span>&#92;((n, m)&#92;)</span> — is of the form

<span>&#92;[&#92;cos(n&#92;theta)J_n(&#92;lambda_{n,m}r).&#92;]</span>

Some mode shapes depend only on <span>&#92;(&#92;theta&#92;)</span>, some only on <span>&#92;(r&#92;)</span>, most on both. Except for the first mode, each mode has **nodal lines** or curves where the deflection is always zero. These nodal lines are called **Chladni patterns**.

# Chapter 5: Idiophones

In these instruments, the sound is produced by striking a bar. This sets up **transverse vibrations** in the bar, which are different from the longitudinal vibrations that occur in a tube or string.

The force is due to a moment on each element of the bar. Under certain assumptions (no twisting, linearity, constant physical parameters), the governing differential equation is

<span>&#92;[&#92;rho&#92;frac{&#92;partial^2 u}{&#92;partial t^2}(x,t) + EI&#92;frac{&#92;partial^4 u}{&#92;partial x^4}(x,t) = 0, &#92;quad 0 < x < &#92;ell &#92;tag{5.1}&#92;]</span>

where <span>&#92;(E&#92;)</span>, <span>&#92;(I&#92;)</span>, <span>&#92;(&#92;rho&#92;)</span> are physical parameters. Since they are constant, define <span>&#92;(c^2 = &#92;frac{EI}{&#92;rho}&#92;)</span> (m⁴/s²) which yields

<span>&#92;[&#92;frac{&#92;partial^2 u}{&#92;partial t^2}(x,t) + c^2&#92;frac{&#92;partial^4 u}{&#92;partial x^4}(x,t) = 0. &#92;tag{5.2}&#92;]</span>

Equation (5.1) or (5.2) is known as the **Euler–Bernoulli beam equation**, or often just the **beam equation**. Various boundary conditions are possible, depending on how the bars are fastened.

## Separation of Variables

Assuming a solution of the form <span>&#92;(u(x,t) = M(x)T(t)&#92;)</span>, substituting into the beam equation and rearranging yields

<span>&#92;[&#92;frac{T''}{T} = -c^2&#92;frac{M^{IV}}{M}&#92;]</span>

where <span>&#92;(M^{IV}&#92;)</span> indicates the 4th derivative. The equation for <span>&#92;(T&#92;)</span> is the familiar harmonic equation <span>&#92;(T'' + &#92;omega^2 T = 0&#92;)</span> with solution

<span>&#92;[T(t) = A&#92;cos&#92;omega t + B&#92;sin&#92;omega t.&#92;]</span>

The spatial function <span>&#92;(M(x)&#92;)</span> must satisfy the fourth-order ordinary differential equation

<span>&#92;[M^{IV} = &#92;frac{&#92;omega^2}{c^2}M.&#92;]</span>

Since this is 4th order, the general solution involves 4 functions. Defining <span>&#92;(&#92;kappa = &#92;left(&#92;frac{&#92;omega^2}{c^2}&#92;right)^{1/4} = &#92;left(&#92;frac{&#92;omega}{c}&#92;right)^{1/2}&#92;)</span>, it is straightforward to verify that for arbitrary constants <span>&#92;(A&#92;)</span>, <span>&#92;(B&#92;)</span>, <span>&#92;(C&#92;)</span>, <span>&#92;(D&#92;)</span>,

<span>&#92;[M(x) = A&#92;sin&#92;kappa x + B&#92;cos&#92;kappa x + C&#92;sinh&#92;kappa x + D&#92;cosh&#92;kappa x&#92;]</span>

solves the differential equation.

## Clamped–Free Boundary Conditions

Suppose one end is clamped and the other free. This situation occurs in **mbira** and some other instruments. Mathematically, this means

<span>&#92;[u(0,t) = 0, &#92;quad &#92;frac{&#92;partial u}{&#92;partial x}(0,t) = 0, &#92;quad &#92;frac{&#92;partial^2 u}{&#92;partial x^2}(&#92;ell,t) = 0, &#92;quad &#92;frac{&#92;partial^3 u}{&#92;partial x^3}(&#92;ell,t) = 0 &#92;tag{5.3}&#92;]</span>

From the boundary conditions at <span>&#92;(x = 0&#92;)</span>, <span>&#92;(B + D = 0&#92;)</span> and <span>&#92;(A + C = 0&#92;)</span>, so

<span>&#92;[M(x) = A(&#92;sin&#92;kappa x - &#92;sinh&#92;kappa x) + B(&#92;cos&#92;kappa x - &#92;cosh&#92;kappa x).&#92;]</span>

Using the other 2 boundary conditions leads to the linear system

<span>&#92;[&#92;begin{bmatrix} (-&#92;sin&#92;kappa&#92;ell - &#92;sinh&#92;kappa&#92;ell) & (-&#92;cos&#92;kappa&#92;ell - &#92;cosh&#92;kappa&#92;ell) &#92;&#92; (-&#92;cos&#92;kappa&#92;ell - &#92;cosh&#92;kappa&#92;ell) & (&#92;sin&#92;kappa&#92;ell - &#92;sinh&#92;kappa&#92;ell) &#92;end{bmatrix}&#92;begin{bmatrix} A &#92;&#92; B &#92;end{bmatrix} = &#92;begin{bmatrix} 0 &#92;&#92; 0 &#92;end{bmatrix} &#92;tag{5.4}&#92;]</span>

This has non-trivial solutions only if the determinant is zero:

<span>&#92;[1 + &#92;cos&#92;kappa&#92;ell&#92;cosh&#92;kappa&#92;ell = 0. &#92;tag{5.5}&#92;]</span>

## Natural Frequencies

The natural frequencies predicted by this model are <span>&#92;(&#92;omega_j = &#92;kappa_j^2 c&#92;)</span> where <span>&#92;(&#92;kappa_j&#92;)</span> solves (5.5). Now,

<span>&#92;[1 + &#92;cos z&#92;cosh z = 1 + &#92;frac{1}{2}&#92;cos z(e^z + e^{-z})&#92;]</span>

and so for large <span>&#92;(z&#92;)</span>, <span>&#92;(1 + &#92;cos z&#92;cosh z &#92;approx &#92;frac{1}{2}(&#92;cos z)e^z&#92;)</span>. Thus, the zeros of <span>&#92;(1 + &#92;cos z&#92;cosh z&#92;)</span> approach those of <span>&#92;(&#92;cos z&#92;)</span> and so

<span>&#92;[&#92;kappa_j &#92;approx &#92;frac{(2j-1)&#92;pi}{2}.&#92;]</span>

| Natural frequencies | Harmonic approximation |
|---|---|
| 3.52 | 2.47 |
| 22.0 | 22.0 |
| 61.7 | 61.7 |
| 121 | 121 |

Even the first overtone is very close to this harmonic approximation. This is typical of idiophones.

This model neglects a number of factors affecting the sound of idiophones. The pitch and timbre of bars in idiophones are often tuned by shaping the bar; cutting out a notch is common. This can only be modelled by including factors such as torsion (twisting) and thickness. As for drums, some idiophones — for instance the marimba — have a resonator that serves to accentuate certain overtones and reduce others. Also, actual instruments have dissipation and different modes decay at different rates. This transient effect contributes to the timbre of an instrument. Transients are present in all instruments, but their effect on the timbre of idiophones is particularly significant.

# Chapter 6: Frequency Response and Sampling

The first five chapters of this course developed mathematical models for families of musical instruments: strings, wind instruments, drums, and idiophones. These models predict the pitch and overtone structure of each instrument. We now turn to a different but equally important topic: the mathematical framework for analyzing how systems respond to periodic signals, and how continuous sounds can be faithfully captured and reconstructed from discrete samples. These ideas underpin digital audio recording and reproduction.

## Frequency Response

Consider the first-order differential equation with a forcing function <span>&#92;(u&#92;)</span>:

<span>&#92;[&#92;dot{z}(t) = -az(t) + bu(t), &#92;quad a > 0, &#92;quad z(0) = z_o. &#92;tag{6.1}&#92;]</span>

This describes a number of physical situations. For instance, <span>&#92;(z&#92;)</span> can be the temperature of a well-mixed tank and <span>&#92;(u&#92;)</span> is the heat added or removed. The solution to this differential equation is

<span>&#92;[z(t) = e^{-at}z_o + &#92;int_0^t e^{-a(t-&#92;tau)}bu(&#92;tau)&#92;,d&#92;tau.&#92;]</span>

For large time, the initial condition decays and

<span>&#92;[&#92;lim_{t&#92;to&#92;infty} z(t) = &#92;int_0^t e^{-a(t-&#92;tau)}bu(&#92;tau)&#92;,d&#92;tau.&#92;]</span>

The response for large time is entirely due to the forcing function. This is called the **steady-state response**.

Consider a periodic forcing term <span>&#92;(u&#92;)</span>. It is easier to integrate an exponential than a sine or cosine. Using the notation <span>&#92;(i = &#92;sqrt{-1}&#92;)</span>, **Euler's formula** states that for real <span>&#92;(&#92;omega&#92;)</span>,

<span>&#92;[e^{i&#92;omega} = &#92;cos&#92;omega + i&#92;sin(&#92;omega).&#92;]</span>

It follows that

<span>&#92;[&#92;cos(&#92;omega) = &#92;frac{1}{2}(e^{i&#92;omega} + e^{-i&#92;omega}), &#92;quad &#92;sin(&#92;omega) = &#92;frac{1}{2i}(e^{i&#92;omega} - e^{-i&#92;omega}).&#92;]</span>

With the complex exponential input <span>&#92;(u(t) = e^{i&#92;omega t}&#92;)</span>, the solution becomes

<span>&#92;[z(t) = e^{-at}z_o + &#92;frac{-be^{-at}}{a + i&#92;omega} + &#92;frac{be^{i&#92;omega t}}{a + i&#92;omega}.&#92;]</span>

As <span>&#92;(t &#92;to &#92;infty&#92;)</span>, the first two terms become insignificant. The steady-state response is

<span>&#92;[z_{ss}(t) = &#92;frac{be^{i&#92;omega t}}{a + i&#92;omega}. &#92;tag{6.2}&#92;]</span>

Note that the magnitude of this response is

<span>&#92;[|z_{ss}(t)| = &#92;frac{b}{&#92;sqrt{a^2 + &#92;omega^2}}.&#92;]</span>

Since <span>&#92;(&#92;cos(&#92;omega t) = &#92;text{Re}&#92;,e^{i&#92;omega t}&#92;)</span>, the steady-state response to a cosine forcing is the real part of (6.2). This works out to

<span>&#92;[&#92;frac{b(a&#92;cos(&#92;omega t) + &#92;omega&#92;sin(&#92;omega t))}{a^2 + &#92;omega^2},&#92;]</span>

or, defining <span>&#92;(&#92;phi = -&#92;arctan(&#92;frac{&#92;omega}{a})&#92;)</span>,

<span>&#92;[&#92;frac{b}{&#92;sqrt{a^2 + &#92;omega^2}}&#92;cos(&#92;omega t + &#92;phi).&#92;]</span>

For small forcing frequencies, the **phase shift** <span>&#92;(&#92;phi &#92;approx 0&#92;)</span> and the response is about <span>&#92;(&#92;frac{b}{a}&#92;)</span>. As <span>&#92;(&#92;omega&#92;)</span> increases, the phase shift <span>&#92;(&#92;phi&#92;)</span> decreases to <span>&#92;(-90&#92;)</span> degrees and the magnitude decreases to 0. A plot of the response of a system to a periodic forcing function as the frequency of the forcing function changes is called the **frequency response**.

More generally, defining <span>&#92;(f(t) = e^{-at}b&#92;)</span>, the steady-state response to a forcing function <span>&#92;(u&#92;)</span> is described by the convolution

<span>&#92;[&#92;int_0^t f(t - &#92;tau)u(&#92;tau)&#92;,d&#92;tau.&#92;]</span>

This generalizes to systems of ordinary differential equations and also systems modelled by partial differential equations, such as a vibrating string or pressure waves.

## The Fourier Transform

Let <span>&#92;(f&#92;)</span> now be the impulse response of some system so that the effect of an input <span>&#92;(u&#92;)</span> on some quantity <span>&#92;(y&#92;)</span> is described by, for large <span>&#92;(t&#92;)</span> or with zero initial condition,

<span>&#92;[y(t) = &#92;int_0^t f(t-&#92;tau)u(&#92;tau)&#92;,d&#92;tau.&#92;]</span>

If <span>&#92;(u(t) = e^{i&#92;omega t}&#92;)</span>, then

<span>&#92;[y(t) = &#92;int_0^t f(&#92;tau)e^{i&#92;omega(t-&#92;tau)}&#92;,d&#92;tau = e^{i&#92;omega t}&#92;int_0^t f(&#92;tau)e^{-i&#92;omega&#92;tau}&#92;,d&#92;tau &#92;approx e^{i&#92;omega t}&#92;int_{-&#92;infty}^{&#92;infty} f(&#92;tau)e^{-i&#92;omega&#92;tau}&#92;,d&#92;tau.&#92;]</span>

With frequency <span>&#92;(&#92;omega = 2&#92;pi&#92;nu&#92;)</span> where <span>&#92;(&#92;nu&#92;)</span> is the frequency in Hertz, defining

<span>&#92;[&#92;hat{f}(&#92;nu) = &#92;int_{-&#92;infty}^{&#92;infty} f(&#92;tau)e^{-i2&#92;pi&#92;nu&#92;tau}&#92;,d&#92;tau,&#92;]</span>

the steady-state response can be rewritten as <span>&#92;(y(t) = &#92;hat{f}(&#92;nu)e^{i2&#92;pi&#92;nu t}&#92;)</span>. The function <span>&#92;(&#92;hat{f}(&#92;nu)&#92;)</span> is the frequency response, or equivalently, the **Fourier transform**.

The Fourier transform of a real (or complex)-valued function <span>&#92;(f&#92;)</span> of a real variable <span>&#92;(t&#92;)</span> is defined as

<span>&#92;[&#92;hat{f}(&#92;nu) = &#92;int_{-&#92;infty}^{&#92;infty} f(t)e^{-2&#92;pi i&#92;nu t}&#92;,dt &#92;tag{6.3}&#92;]</span>

for any function for which the integral is well-defined. There are many slightly different definitions of the Fourier transform; they vary in their handling of constants but are fundamentally all equivalent.

Clearly the Fourier transform of any function that is only non-zero on a bounded interval and integrable on that interval is well-defined. In fact, if <span>&#92;(&#92;int_{-&#92;infty}^{&#92;infty}|f(t)|&#92;,dt < &#92;infty&#92;)</span>, the Fourier transform is defined.

Conversely, a function of <span>&#92;(t&#92;)</span> can be uniquely constructed from the Fourier transform, or frequency response.

**Theorem (Inverse Fourier Transform).** Let <span>&#92;(f&#92;)</span> be a piecewise smooth function that is also integrable on <span>&#92;((-&#92;infty, &#92;infty)&#92;)</span>. At points where <span>&#92;(f&#92;)</span> is continuous,

<span>&#92;[f(t) = &#92;int_{-&#92;infty}^{&#92;infty}&#92;hat{f}(&#92;nu)e^{2&#92;pi i&#92;nu t}&#92;,d&#92;nu. &#92;tag{6.4}&#92;]</span>

At discontinuities, the value of the above integral is the average of the right and left limits of <span>&#92;(f&#92;)</span>.

There is thus a one-to-one correspondence between a function <span>&#92;(f(t)&#92;)</span> and its Fourier transform <span>&#92;(&#92;hat{f}(&#92;nu)&#92;)</span>. Since the transform is defined via an integral, it is linear: if <span>&#92;(a&#92;)</span> is a scalar and <span>&#92;(f&#92;)</span>, <span>&#92;(g&#92;)</span> have Fourier transforms, then <span>&#92;(&#92;widehat{(af + g)}(&#92;nu) = a&#92;hat{f}(&#92;nu) + &#92;hat{g}(&#92;nu)&#92;)</span>. Similarly, the inverse Fourier transform is also linear.

## The Nyquist Sampling Theorem

In practice, the frequency response of a signal or sound <span>&#92;(f(t)&#92;)</span> is calculated by recording it at a finite number of time instants <span>&#92;(&#92;{f(nT)&#92;}&#92;)</span> where <span>&#92;(T&#92;)</span> is the time between samples. This set of samples is used to obtain the frequency response. It is also used in digital sound reproduction: the samples are stored in memory and reconstructed. Clearly it is possible to recover a sound that sounds to our ears like the original, but how often must the sound be sampled?

**Theorem (Nyquist Sampling Theorem).** Suppose a Fourier-transformable function <span>&#92;(f&#92;)</span> has the property that its Fourier transform is **band-limited**; that is,

<span>&#92;[&#92;hat{f}(&#92;nu) = 0, &#92;quad |&#92;nu| > &#92;sigma.&#92;]</span>

Then <span>&#92;(f&#92;)</span> can be recovered exactly from its samples, provided that the sampling rate <span>&#92;(N > 2&#92;sigma&#92;)</span>. In this case, defining <span>&#92;(T = &#92;frac{1}{N}&#92;)</span>,

<span>&#92;[f(t) = &#92;sum_{n=-&#92;infty}^{&#92;infty} Tf(nT)&#92;frac{&#92;sin(2&#92;pi&#92;sigma(t - nT))}{&#92;pi(t - nT)}. &#92;tag{6.5}&#92;]</span>

If sound is sampled at a rate less than the Nyquist rate, a phenomenon called **aliasing** occurs where frequencies beyond half the sampling rate get distorted into the lower band and the sound is not correctly reconstructed.

## Connection between Fourier Series and Fourier Transform

There is a close connection between Fourier series and Fourier transforms. Consider a real-valued function <span>&#92;(f(t)&#92;)</span> with, for some fundamental frequency <span>&#92;(&#92;omega_0&#92;)</span> (rad/s), the Fourier series

<span>&#92;[&#92;tilde{f}(t) = a_0 + &#92;sum_{n=1}^{&#92;infty}(a_n&#92;cos(n&#92;omega_0 t) + b_n&#92;sin(n&#92;omega_0 t)). &#92;tag{6.6}&#92;]</span>

The individual terms are called **harmonics**. The period of <span>&#92;(&#92;tilde{f}&#92;)</span> is <span>&#92;(T = &#92;frac{2&#92;pi}{&#92;omega_0}&#92;)</span>. The fundamental frequency in Hz is <span>&#92;(&#92;frac{&#92;omega_0}{2&#92;pi}&#92;)</span> or <span>&#92;(&#92;frac{1}{T}&#92;)</span>. Series of this form occurred when solving the wave equation for the response of vibrating strings and wind instruments.

It is convenient to use the exponential form of the Fourier series. Defining <span>&#92;(c_n = &#92;frac{a_n - ib_n}{2}&#92;)</span> and <span>&#92;(c_{-n} = &#92;frac{a_n + ib_n}{2}&#92;)</span>,

<span>&#92;[&#92;tilde{f}(t) = &#92;sum_{n=-&#92;infty}^{&#92;infty} c_n e^{in&#92;omega_0 t}. &#92;tag{6.7}&#92;]</span>

Multiplying both sides by <span>&#92;(e^{-im&#92;omega_0 t}&#92;)</span> and integrating over one period yields

<span>&#92;[c_m = &#92;frac{1}{T}&#92;int_{-T/2}^{T/2}&#92;tilde{f}(t)e^{-im&#92;omega_0 t}&#92;,dt. &#92;tag{6.8}&#92;]</span>

Consider now a function <span>&#92;(f(t)&#92;)</span> defined on the whole real line. If <span>&#92;(f&#92;)</span> is periodic with period <span>&#92;(T&#92;)</span>, then a Fourier series can be defined that equals <span>&#92;(f&#92;)</span>. However, many functions are not periodic. Consider the function on some interval <span>&#92;([-&#92;frac{T}{2}, &#92;frac{T}{2}]&#92;)</span> and use this to define the Fourier series. The corresponding Fourier series <span>&#92;(&#92;tilde{f}_T&#92;)</span> will have period <span>&#92;(T&#92;)</span>. It will equal <span>&#92;(f&#92;)</span> on that interval, but not generally outside it. Defining the integral

<span>&#92;[&#92;hat{f}(&#92;omega) = &#92;int_{-T/2}^{T/2} f(t)e^{-i2&#92;pi&#92;omega t}&#92;,dt,&#92;]</span>

the Fourier coefficients can be written <span>&#92;(c_n = &#92;frac{1}{T}&#92;hat{f}(&#92;frac{n}{T})&#92;)</span>. Substituting into (6.7),

<span>&#92;[&#92;tilde{f}_T(t) = &#92;frac{1}{T}&#92;sum_{n=-&#92;infty}^{&#92;infty}&#92;hat{f}&#92;left(&#92;frac{n}{T}&#92;right)e^{-i2&#92;pi&#92;frac{n}{T}t}.&#92;]</span>

Defining <span>&#92;(&#92;Delta = &#92;frac{2&#92;pi}{T}&#92;)</span>, this can be rewritten as

<span>&#92;[&#92;tilde{f}_T(t) = &#92;frac{1}{2&#92;pi}&#92;sum_{n=-&#92;infty}^{&#92;infty}&#92;hat{f}&#92;left(&#92;frac{1}{2&#92;pi}n&#92;Delta&#92;right)e^{-in&#92;Delta t}&#92;Delta.&#92;]</span>

This is a Riemann sum. Taking <span>&#92;(&#92;Delta &#92;to 0&#92;)</span> (or equivalently, <span>&#92;(T &#92;to &#92;infty&#92;)</span>) yields

<span>&#92;[&#92;frac{1}{2&#92;pi}&#92;int_{-&#92;infty}^{&#92;infty}&#92;hat{f}&#92;left(&#92;frac{1}{2&#92;pi}&#92;omega&#92;right)e^{i&#92;omega t}&#92;,d&#92;omega.&#92;]</span>

Defining <span>&#92;(&#92;nu = &#92;frac{1}{2&#92;pi}&#92;omega&#92;)</span>, a change of variables leads to

<span>&#92;[f(t) = &#92;int_{-&#92;infty}^{&#92;infty}&#92;hat{f}(&#92;nu)e^{2&#92;pi i&#92;nu t}&#92;,d&#92;nu,&#92;]</span>

where <span>&#92;(&#92;hat{f}&#92;)</span> is calculated as the integral in (6.3) as <span>&#92;(T &#92;to &#92;infty&#92;)</span>. This is exactly the Fourier transform (or frequency response), and the above equation is the inverse relationship. In other words, the Fourier transform arises naturally as the limiting case of the Fourier series when the period is taken to infinity.

# Chapter 7: Pythagorean and Just Scales

## The Harmonic Series and Scale Construction

Recall that the fundamental frequency of a sound made by an instrument is the **pitch**. For convenience in reproducing music from one place to another, a pitch is given a name. Note names and the pitch associated with them vary between cultures and also in time. For example, consider the note A in the treble clef (A4): A4 is now standard at 440 Hz in North America, often slightly higher in continental Europe, and in the Baroque era was significantly lower and varied considerably. The crucial point is that all musicians in the room have the same sound corresponding to a given note name. Furthermore, how notes relate to other notes is critical.

Most music has a "home" note, called the **tonic** or sometimes **do**, about which the piece revolves. Most musical pieces are composed with a specified set of notes built on the tonic. This choice of notes is called a **scale**. An **octave** is the frequency double the tonic, and most scales are octave-based. For string and wind instruments, overtones occur in integer multiples of the fundamental frequency. Both amplitude and frequency are perceived on a logarithmic scale.

Although the models developed in the first part of the course neglect many aspects of instruments' behaviour, they do correctly predict the pitch (fundamental frequency) and that the overtones are harmonic, that is, they are integer multiples of the fundamental frequency.

Consider a string with fundamental frequency <span>&#92;(f&#92;)</span>; call this the tonic or do. Another string with half the length has frequency <span>&#92;(2f&#92;)</span> (the first overtone). All the harmonics of <span>&#92;(2f&#92;)</span> are contained in the harmonics of <span>&#92;(f&#92;)</span>, so the sound from two such strings sounds harmonious. The ancient Greeks noticed that strings in the ratio of <span>&#92;(&#92;frac{3}{2}&#92;)</span> also sounded good together: <span>&#92;(&#92;frac{3}{2}f&#92;)</span>. Half of the harmonics of <span>&#92;(&#92;frac{3}{2}f&#92;)</span> are contained in those of <span>&#92;(f&#92;)</span>. This interval is called a **fifth**, also known as **so**.

## The Pythagorean Scale

The **Pythagorean scale** is constructed by filling in notes through iteration on <span>&#92;(&#92;frac{3}{2}f&#92;)</span>, dropping by an octave whenever the note exceeds <span>&#92;(2f&#92;)</span>. Letting <span>&#92;(f = 1&#92;)</span>, the successive applications of the <span>&#92;(&#92;frac{3}{2}&#92;)</span> ratio yield

<span>&#92;[&#92;frac{3}{2}, &#92;quad &#92;frac{3^2}{2^2}&#92;cdot&#92;frac{1}{2}, &#92;quad &#92;frac{3^3}{2^4}, &#92;quad &#92;frac{3^4}{2^5}&#92;cdot&#92;frac{1}{2}, &#92;quad &#92;frac{3^5}{2^7}.&#92;]</span>

Sorting these between 1 and 2 gives the Pythagorean scale:

| do | re | mi | fa | so | la | ti | do |
|---|---|---|---|---|---|---|---|
| <span>&#92;(1&#92;)</span> | <span>&#92;(&#92;frac{9}{8}&#92;)</span> | <span>&#92;(&#92;frac{81}{64}&#92;)</span> | <span>&#92;(&#92;frac{4}{3}&#92;)</span> | <span>&#92;(&#92;frac{3}{2}&#92;)</span> | <span>&#92;(&#92;frac{27}{16}&#92;)</span> | <span>&#92;(&#92;frac{243}{128}&#92;)</span> | <span>&#92;(2&#92;)</span> |

The intervals between successive notes are:

<span>&#92;[&#92;frac{9}{8} &#92;quad &#92;frac{9}{8} &#92;quad &#92;frac{256}{243} &#92;quad &#92;frac{9}{8} &#92;quad &#92;frac{9}{8} &#92;quad &#92;frac{9}{8} &#92;quad &#92;frac{256}{243}&#92;]</span>

giving the pattern big -- big -- small -- (big) -- big -- big -- small. Note that <span>&#92;(&#92;frac{9}{8} = 1.125&#92;)</span> and <span>&#92;(&#92;left(&#92;frac{256}{243}&#92;right)^2 = 1.1098 &#92;approx &#92;frac{9}{8}&#92;)</span>.

All the harmonics of <span>&#92;(2f&#92;)</span> are in common with those of <span>&#92;(f&#92;)</span>. Half of the harmonics of <span>&#92;(&#92;frac{3}{2}f&#92;)</span> are in common with those of <span>&#92;(f&#92;)</span>, and one-third of the harmonics of <span>&#92;(&#92;frac{4}{3}f&#92;)</span> are in common with those of <span>&#92;(f&#92;)</span>. However, most of the notes in the Pythagorean scale are in ratios of large numbers of the root note. One-quarter of the harmonics of <span>&#92;(&#92;frac{5}{4}&#92;)</span> are in common with those of <span>&#92;(f&#92;)</span>; this ratio is close to <span>&#92;(&#92;frac{81}{64}&#92;)</span> but not equal. As a result, intervals other than the octave, fourth, and fifth can sound discordant, and sounds from the same scale often do not sound harmonious together. This limits **polyphony** -- the practice of playing multiple notes simultaneously.

## Just Intonation

**Just intonation** addresses the problem of discordant intervals by creating a scale using low ratios:

| do | re | mi | fa | so | la | ti | do |
|---|---|---|---|---|---|---|---|
| <span>&#92;(1&#92;)</span> | <span>&#92;(&#92;frac{9}{8}&#92;)</span> | <span>&#92;(&#92;frac{5}{4}&#92;)</span> | <span>&#92;(&#92;frac{4}{3}&#92;)</span> | <span>&#92;(&#92;frac{3}{2}&#92;)</span> | <span>&#92;(&#92;frac{5}{3}&#92;)</span> | <span>&#92;(&#92;frac{15}{8}&#92;)</span> | <span>&#92;(2&#92;)</span> |

The interval between the third note and the root (do--mi) is called a **third**; the fourth, fifth, and sixth are defined similarly. The ratios for a third, fourth, fifth, and sixth are all low, and notes sound harmonious together.

Starting on the tonic (do), the ratio of do--mi--so is <span>&#92;(1 : &#92;frac{5}{4} : &#92;frac{3}{2}&#92;)</span>, or equivalently <span>&#92;(4:5:6&#92;)</span>. Starting on the fourth (fa), we have <span>&#92;(&#92;frac{4}{3} : &#92;frac{5}{3} : 2&#92;)</span>, also <span>&#92;(4:5:6&#92;)</span>. Setting the remaining intervals so that starting on so (the fifth), <span>&#92;(&#92;frac{3}{2} : x : y&#92;)</span> is also in the ratio <span>&#92;(4:5:6&#92;)</span> leads to <span>&#92;(x = &#92;frac{15}{8}&#92;)</span> and <span>&#92;(y = &#92;frac{9}{4}&#92;)</span> (or <span>&#92;(&#92;frac{9}{8}&#92;)</span> in the next octave down).

The intervals in the just scale are:

<span>&#92;[&#92;frac{9}{8} &#92;quad &#92;frac{10}{9} &#92;quad &#92;frac{16}{15} &#92;quad &#92;frac{9}{8} &#92;quad &#92;frac{10}{9} &#92;quad &#92;frac{9}{8} &#92;quad &#92;frac{16}{15}&#92;]</span>

The scale does not have the same tone--tone--semitone pattern as the Pythagorean scale. A **chord** is several notes played at the same time to produce an effect, and a **triad** is a chord with three different notes. Movement through chords is an important part of Western music.

Just intonation has more chords with low ratios than the Pythagorean scale. The triads on do, fa, and so (I, IV, V) are in ratios of <span>&#92;(4:5:6&#92;)</span> -- they are "justly" tuned. However, not all chords work: the note re (II) has a fifth of <span>&#92;(&#92;frac{5/3}{9/8} = &#92;frac{40}{27} &#92;neq &#92;frac{3}{2}&#92;)</span>, meaning the triad built on re is not a pure fifth. This fundamental limitation motivates the search for other tuning systems.

# Chapter 8: Transposition

The problem of transposition -- changing the home note of a scale while preserving the relationships between notes -- reveals deep mathematical constraints on any tuning system. In this chapter, we examine why no fixed-pitch tuning system can simultaneously achieve perfect harmony and unlimited transposability, and how different compromises have been reached throughout history.

## The Pythagorean Comma

The Pythagorean scale can be created either by using the recursion formula (<span>&#92;(&#92;frac{3}{2}&#92;)</span>, modulo 2) or by intervals. If we create a new scale by transposing up a fifth -- that is, taking the tonic to have frequency <span>&#92;(&#92;frac{3}{2}&#92;)</span> and building the same interval pattern on it -- we obtain the notes of the original scale except for one new note. Each transposition introduces a new note that was not present before.

Going up 12 fifths is close to 7 octaves. The difference is

<span>&#92;[&#92;frac{(&#92;frac{3}{2})^{12}}{2^7} = &#92;frac{3^{12}}{2^{19}} &#92;approx 1.014.&#92;]</span>

This small discrepancy is called the **Pythagorean comma**. Each time a scale is created by transposition -- starting a new note, either a fifth up or a fifth down from the previous scale -- a new note is introduced. This creates what is known as the **spiral of fifths**: transposition into a scale with a different tonic creates new notes in a never-ending spiral.

The fundamental impossibility can be stated precisely: we need integers <span>&#92;(n, m&#92;)</span> such that

<span>&#92;[&#92;left(&#92;frac{3}{2}&#92;right)^m = 2^n, &#92;quad &#92;text{i.e.,} &#92;quad 3^m = 2^{n+m}.&#92;]</span>

But this requires a power of 3 to equal a power of 2, which is **not possible** since 3 and 2 are distinct primes. It is therefore impossible to go up a number of perfect fifths and eventually return to the original note, modulo an octave. All temperaments will be a compromise.

Transposition is even worse in just intonation. Starting on the fifth note "G" (frequency <span>&#92;(&#92;frac{3}{2}&#92;)</span>) and building a just scale with the same ratios yields two new notes for each transposition, and the spiral of fifths expands even more rapidly.

## Meantone Scales

**Meantone scales** were common in the Renaissance as a compromise that preserves consonances of the octave, fifth, third, and sixth while allowing transposition into different keys and chord progressions. The fundamental idea is to improve thirds over the Pythagorean scale while sacrificing fifths slightly.

One meantone scale is constructed as follows. Ensure that thirds on C, F, and G (I, IV, V) are "just": <span>&#92;(&#92;frac{5}{4}&#92;)</span>. Take the interval within these thirds to be the geometric mean: <span>&#92;(&#92;frac{&#92;sqrt{5}}{2}&#92;)</span>. This yields C--D--E as <span>&#92;(1 : &#92;frac{&#92;sqrt{5}}{2} : &#92;frac{5}{4}&#92;)</span>, with the same ratios for F--G--A and G--A--B. To keep a Pythagorean scale pattern, two semitones are left, determined by

<span>&#92;[&#92;left(&#92;frac{&#92;sqrt{5}}{2}&#92;right)^5 s^2 = 2,&#92;]</span>

so the semitone is <span>&#92;(s = &#92;frac{8}{5^{5/4}}&#92;)</span>.

The fifth in this system is <span>&#92;(r = 5^{1/4} = 1.49535 &#92;approx &#92;frac{3}{2}&#92;)</span>. Transposing four fifths is a third (modulo octaves), and 12 fifths is 3 thirds. Since <span>&#92;(&#92;left(&#92;frac{5}{4}&#92;right)^3 = &#92;frac{125}{64} < 2&#92;)</span>, we do not get a cycle of fifths. One fifth is usually made large in a seldom-used key, yielding a very discordant **wolf fifth**. It was possible that a keyboard was tuned differently for different pieces.

Various modifications of meantone make it easier to play in different keys, with intervals slightly different in different keys so the spiral of fifths becomes a circle, but far-away keys have discordant intervals. Because the intervals are different, different keys have noticeably different character. Such tunings are sometimes called **well-tempered**. Many different schemes existed, with Werckmeister's being particularly popular. Well-tempered tuning was commonly used until roughly 1850--1900.

## Equal Temperament

In the Pythagorean scale, going up 12 fifths and then down 7 octaves goes back to almost where you started: <span>&#92;((&#92;frac{3}{2})^{12} &#92;approx 2^7&#92;)</span>. The major scale has 5 tones and 2 semitones, yielding 12 semitones total. However, a Pythagorean tone is not exactly 2 semitones:

<span>&#92;[&#92;frac{(&#92;frac{256}{243})^2}{&#92;frac{9}{8}} = &#92;frac{2^{16}}{3^{10}} &#92;cdot &#92;frac{3^2}{2^3} = &#92;frac{2^{19}}{3^{12}}.&#92;]</span>

**Equal temperament** resolves all transposition problems by setting each semitone to <span>&#92;(s = 2^{1/12}&#92;)</span>, so a tone is <span>&#92;(s^2 = 2^{1/6}&#92;)</span>. The equal-tempered scale is:

| do | re | mi | fa | so | la | ti | do |
|---|---|---|---|---|---|---|---|
| <span>&#92;(1&#92;)</span> | <span>&#92;(2^{1/6}&#92;)</span> | <span>&#92;(2^{1/3}&#92;)</span> | <span>&#92;(2^{5/12}&#92;)</span> | <span>&#92;(2^{7/12}&#92;)</span> | <span>&#92;(2^{3/4}&#92;)</span> | <span>&#92;(2^{11/12}&#92;)</span> | <span>&#92;(2&#92;)</span> |

The crucial property is that shifting through 12 fifths goes back to the start:

<span>&#92;[(2^{7/12})^{12} = 2^7.&#92;]</span>

The spiral of fifths becomes a **circle of fifths**, and there are no problems with transposition. Every key sounds the same.

## Cents

To compare tuning systems precisely, define a logarithmic measurement of frequency called **cents**: 1200 cents equals one octave. A semitone is 100 cents and a tone is 200 cents. About 10 cents is audible to a reasonably trained ear.

If <span>&#92;(r > 1&#92;)</span> is a frequency ratio in relation to the tonic, its value in cents <span>&#92;(c&#92;)</span> is

<span>&#92;[c = 1200&#92;log_2 r.&#92;]</span>

The perfect fifth is <span>&#92;(1200&#92;log_2(&#92;frac{3}{2}) &#92;approx 702&#92;)</span> cents.

| Note | Perfect Ratio | Just (cents) | Equal (cents) |
|---|---|---|---|
| fifth | <span>&#92;(&#92;frac{3}{2}&#92;)</span> | 702 | 700 |
| fourth | <span>&#92;(&#92;frac{4}{3}&#92;)</span> | 498 | 500 |
| third | <span>&#92;(&#92;frac{5}{4}&#92;)</span> | 386 | 400 |
| sixth | <span>&#92;(&#92;frac{5}{3}&#92;)</span> | 884 | 900 |

| Irregular and Meantone | Equal |
|---|---|
| thirds and sixths harmonic | *almost* harmonic |
| some keys sound "strange" | can play in any key |
| different keys have different character | every key sounds the same |

The *Well-Tempered Clavier* by J.S. Bach was probably written to be performed in an irregular temperament, that is, on a well-tempered clavier, not an equal-tempered one. A recording by Robert Levin on an instrument tuned in Werckmeister tuning is available. Tempering is really only an issue for keyboard instruments; players of other instruments can adjust intonation as they play.

# Chapter 9: Other Scales

The scales discussed thus far -- Pythagorean, just, meantone, and equal-tempered -- are products of the Western musical tradition. However, many other cultures have developed their own scale systems, some of which differ radically from Western assumptions. In this chapter, we survey the Chinese, Indian, and Indonesian traditions, and conclude with a general framework for classifying scales.

## Chinese Scales

Traditional Chinese music used flutes of various materials (pan flutes and recorders), stringed instruments, and bells. The numbers 3 (heaven) and 2 (earth) held special significance, so the ratio <span>&#92;(&#92;frac{3}{2}&#92;)</span> was considered to "harmonize as perfectly as heaven and earth." There was a connection in ancient Chinese and ancient Greek music to mathematics, astronomy, and spirit -- 12 months in the year corresponding to 12 notes in the scale, and 5 elements corresponding to 5 notes in the pentatonic scale.

The construction of the Chinese 12-tone scale, described in the *Lu shih ch'un ch'iu* (240 BC), was based on lengths of a bamboo tube. Starting with tubes of length between <span>&#92;(&#92;ell&#92;)</span> and <span>&#92;(&#92;frac{1}{2}&#92;ell&#92;)</span>, the procedure is as follows: multiply the length by <span>&#92;(&#92;frac{2}{3}&#92;)</span> to get <span>&#92;(&#92;ell_1 = &#92;frac{2}{3}&#92;ell&#92;)</span>. Repeat: <span>&#92;(&#92;frac{2}{3}&#92;ell_1 = &#92;frac{4}{9}&#92;ell&#92;)</span>, which is too short, so double the length to get <span>&#92;(&#92;ell_2 = &#92;frac{8}{9}&#92;ell&#92;)</span>. Continue: <span>&#92;(&#92;ell_3 = &#92;frac{2}{3}&#92;ell_2 = &#92;frac{16}{27}&#92;ell&#92;)</span>, then <span>&#92;(&#92;frac{2}{3}&#92;ell_3 = &#92;frac{32}{81}&#92;ell&#92;)</span>, too short, so <span>&#92;(&#92;ell_4 = &#92;frac{64}{81}&#92;ell&#92;)</span>. This process is repeated, multiplying by <span>&#92;(&#92;frac{2}{3}&#92;)</span> each time and doubling the length if necessary to keep between <span>&#92;(&#92;ell&#92;)</span> and <span>&#92;(&#92;frac{1}{2}&#92;ell&#92;)</span>. Including the octave (<span>&#92;(&#92;frac{1}{2}&#92;)</span>), this produces 12 tubes and notes, called **lu**. The lu are a set of notes from which scales were constructed.

Equal temperament was developed in China slightly before its appearance in Europe but never became popular. Possible reasons include the lack of a "spiritual dimension" to equally-spaced intervals and the perceived blandness of transposition, as well as the absence of keyboard instruments.

## Indian Scales

Indian classical music is primarily centered on the voice, with accompaniment provided by instruments. Harmony is not considered important; the focus is on melody and rhythm. The driving melodic pattern of a piece is called the **raga**, consisting of well-defined ascending and descending portions. The raga used may depend on the time of day, season, origin (hymn, folk music, etc.), and desired mood.

The **sitar** is one instrument used in Indian music. It is a plucked string instrument with between 18 and 21 strings. Seven of the strings are stretched over raised frets; the other strings run under the frets and are dedicated to sympathetic resonance. The frets can be moved to alter the tuning, and the sympathetic strings of the sitar are tuned to the raga desired by the player.

There are 22 notes or **sruti** per octave in the Indian sruti scale. The *Dattilam*, written around 3 BC, discusses *swara* (scales) based on 22 sruti microtones per octave. Continuous pitch instruments can play any subset, and most Indian classical music uses a 12-note scale drawn from these 22. There is no set home note, and temperament is highly variable. Fretted instruments such as the sitar have adjustable frets that are shifted to play different subsets of sruti.

One theory for the origin of the scale is as follows. Start with a root note, then create a set of intervals <span>&#92;((&#92;frac{3}{2})^m&#92;)</span> for <span>&#92;(0 &#92;leq m < 12&#92;)</span> (subtracting octaves to stay within one octave). Create another set of intervals <span>&#92;((&#92;frac{4}{3})^m&#92;)</span> for <span>&#92;(0 < m < 12&#92;)</span> (again subtracting octaves). Remove <span>&#92;(&#92;frac{262144}{177147} = 1.480&#92;)</span>, which is just below <span>&#92;(&#92;frac{3}{2}&#92;)</span>, to leave 22 notes. This set was then adjusted by replacing notes with nearby notes having smaller integer ratios, yielding the 22-note sruti scale:

<span>&#92;[1, &#92;frac{256}{243}, &#92;frac{16}{15}, &#92;frac{10}{9}, &#92;frac{9}{8}, &#92;frac{32}{27}, &#92;frac{6}{5}, &#92;frac{81}{64}, &#92;frac{4}{3}, &#92;frac{27}{20}, &#92;frac{45}{32}, &#92;frac{729}{512}, &#92;frac{3}{2}, &#92;frac{128}{81}, &#92;frac{8}{5}, &#92;frac{5}{3}, &#92;frac{27}{16}, &#92;frac{16}{9}, &#92;frac{9}{5}, &#92;frac{15}{8}, &#92;frac{243}{128}, 2.&#92;]</span>

## Gamelan

**Gamelan** orchestras, found in Indonesia (particularly Bali and Java), are composed of struck instruments, particularly gongs and idiophones. Each idiophone occurs in a pair. There are two systems of tuning: **slendro**, a 5-tone system with intervals of about 200--300 cents, and **pelog**, a 7-tone system of which 5 tones are used in a given piece, with 3 small intervals (80--200 cents) and 2 large intervals (350--450 cents). Pelog is most common in Balinese music, while slendro is used in Java. The size of tones varies considerably from orchestra to orchestra (village to village), particularly for pelog.

The pitch (in cents) averaged over a number of instruments tuned to slendro is:

| 0 | 231 | 474 | 717 | 955 | 1208 |
|---|---|---|---|---|---|

A notable feature is that the octave is not exactly 1200 cents -- it is not exactly twice the lowest note. Early Western measurements only measured tuning of one instrument in a pair and missed the paired tuning, as well as the fact that it was deliberately not octave-based.

For idiophones, overtones do not occur in integer multiples of the fundamental. Measurements of overtones on a **saron** (a particular gamelan instrument) show median ratios of

<span>&#92;[f, &#92;quad 2.76f, &#92;quad 4.72f, &#92;quad 5.92f.&#92;]</span>

Overtones of actual idiophones vary significantly between instruments. The gamelan builder adjusts instruments by careful shaving and shaping so that they work well together.

Paired instruments are tuned during construction so that **beats** of 5--8 Hz are heard. Consider two waves with the same phase and amplitude but differing by a small amount <span>&#92;(&#92;Delta&#92;)</span>:

<span>&#92;[y(t) = &#92;sin(2&#92;pi(&#92;bar{f} - &#92;Delta)t) + &#92;sin(2&#92;pi(&#92;bar{f} + &#92;Delta)t) = 2&#92;cos(2&#92;pi&#92;Delta t)&#92;sin(2&#92;pi&#92;bar{f}t).&#92;]</span>

This sounds like <span>&#92;(&#92;bar{f}&#92;)</span> Hz with amplitude oscillating with frequency <span>&#92;(2&#92;Delta&#92;)</span>: beats. The deliberate use of beating gives gamelan music its characteristic shimmering quality.

## Classification of Scales

There are several broad ways to classify scales. The first is by **frequency range**: most but not all scales are octave-based (gamelan being a notable exception). The second is by **number of tones** (<span>&#92;(n&#92;)</span>-tone): Chinese and Western scales have 12 tones, Indian and Persian scales have more than 12, and the term "microtonal" refers to scales with more than 12 tones, particularly modern avant-garde scales. The third distinction is between **equally-tempered** and **just** scales.

Just scales can be further classified by the integer ratios present. If <span>&#92;(p&#92;)</span> is a prime, then a **<span>&#92;(p&#92;)</span>-limit scale** only uses rational numbers whose denominators and numerators factor as products of prime numbers less than or equal to <span>&#92;(p&#92;)</span>. The Pythagorean scale contains rational numbers whose denominators and numerators are products of 3 and 2 (a 3-limit scale). The classical just scale has ratios with denominators and numerators that are products of 5, 3, and 2 (a 5-limit scale).

# Chapter 10: Music Theory and Modern Scales

As discussed in previous chapters, there are tradeoffs between "harmony" -- being able to play multiple notes at the same time -- and transposition onto different tonics. The appropriate scale depends on the flexibility and overtones of the instrument, and also the type of music. However, the instrument influences the music and vice versa.

Modified keyboards were built in 18th and 19th century Europe to include extra notes created by transposition in just intonation or in meantone, in order to be able to transpose and have just intervals. But they were awkward to build and never became widely used. The difficulty of tuning a keyboard instrument, as opposed to a string instrument for instance, is one reason equal temperament has become popular. However, with electronic instruments, any tuning is possible and in fact any overtones can be created. This has led to an interest in different scales by some modern composers.

## Number of Tones in an Equally-Tempered Scale

When subdividing an octave into <span>&#92;(n&#92;)</span> equal intervals, a "good" scale yields thirds, fourths, fifths, and sixths that are close to their just values. Fifths are particularly important. The number 12 is the smallest number of tones that yields notes close to all the important just intervals. A 19-tone scale yields good thirds, though its fifths are worse (but not bad). A 31-tone scale gives a reasonable fit as well. A 53-tone equal temperament yields very harmonic intervals and was known to the ancient Greeks and Chinese; it was proposed by Mercator in 1608 and mentioned by Helmholtz. Some music has been written with different numbers of notes in the 20th century.

## Just Intonation with More Than 12 Notes

**Harry Partch** (1901--1974) was an American composer who experimented extensively with just scales with different numbers of notes. He also built instruments designed to take advantage of these scales. His system used 43 tones to an octave, idiosyncratic and based on Partch's own theories. It contains the usual just intervals plus others, forming an **11-limit** scale. Partch never used synthesized sounds, instead constructing his own instruments -- which created practical difficulties around performance and wider adoption. His works are rarely played but represent very interesting theories and sounds.

The **12-tone system** of Schoenberg uses all intervals equally to create "atonal music," but is still based on the octave.

## The Tritave Scale

The octave is deeply rooted in the Western perception of music, and many other cultures also have scales based on the octave. Gamelan scales use a scale based on an interval that is not precisely an octave, taking advantage of the overtones of the idiophones used in the orchestra.

For an instrument with odd harmonics, such as a clarinet, the overtones have ratios <span>&#92;(1, 3, 5, 7, 9, 11, 13, 15, 17, 19, &#92;ldots&#92;)</span> The overtones of the octave <span>&#92;(2f&#92;)</span> are <span>&#92;(4f, 6f, 8f, &#92;ldots&#92;)</span>, which are not all present in the odd harmonic series. However, all overtones of <span>&#92;(3f&#92;)</span> are overtones of the fundamental: <span>&#92;(3, 9, 15, 21, &#92;ldots&#92;)</span> This suggests building a scale on 3 times the fundamental instead of 2, creating a **tritave** (octave plus a fifth).

The "harmonic intervals" in this system form two series analogous to the third and fifth:

<span>&#92;[&#92;frac{5}{3}, &#92;quad 5, &#92;quad &#92;frac{25}{3}, &#92;quad &#92;frac{35}{3}, &#92;quad 15, &#92;quad &#92;frac{55}{3}, &#92;quad &#92;ldots &#92;quad &#92;text{("third")}&#92;]</span>

<span>&#92;[&#92;frac{7}{3}, &#92;quad 7, &#92;quad &#92;frac{35}{3}, &#92;quad &#92;frac{49}{3}, &#92;quad 21, &#92;quad &#92;frac{77}{3}, &#92;quad &#92;ldots &#92;quad &#92;text{("fifth")}&#92;]</span>

The important intervals are <span>&#92;(&#92;frac{5}{3}&#92;)</span> and <span>&#92;(&#92;frac{7}{3}&#92;)</span>. For an equally tempered tritave scale, we want <span>&#92;(q&#92;)</span> such that <span>&#92;(3^{m_1/q} &#92;approx &#92;frac{5}{3}&#92;)</span> and <span>&#92;(3^{m_2/q} &#92;approx &#92;frac{7}{3}&#92;)</span> for integers <span>&#92;(m_1, m_2&#92;)</span>. The value <span>&#92;(q = 13&#92;)</span> works well. This is the **Bohlen-Pierce scale**: a 13-tone equal-tempered tritave. A number of pieces have been composed and performed in this system.

## Dissonance and Consonance Theory

Most "definitions" of consonance are quite vague. There is a mathematical theory of consonance that dates back to at least Helmholtz's work in the late 1800s. The basic idea is that sine waves of close frequency will lead to beats and a sensation of "roughness" that is unpleasant.

One simple measure of **dissonance** for a sine wave of frequency <span>&#92;(f_1&#92;)</span> compared to another with frequency <span>&#92;(f_2&#92;)</span> at the same amplitude is

<span>&#92;[&#92;text{dissonance} = e^{-3.5|f_1 - f_2|} - e^{-5.75|f_1 - f_2|}.&#92;]</span>

For two instruments playing different notes, one adds up the dissonance contribution of each overtone, weighted by their amplitude. The resulting **dissonance curve** shows minima at just intervals -- precisely the ratios that sound most consonant. This result is very similar to the dissonance curve for two violins created by Helmholtz.

For a uniform beam with free ends (an idealized idiophone) with fundamental frequency <span>&#92;(f&#92;)</span>, the overtones are <span>&#92;(2.758f, 5.406f, 8.936f, 13.35f, 18.64f, 24.82f, &#92;ldots&#92;)</span> The dissonance curve for such instruments has minima at entirely different frequency ratios than for harmonic instruments.

This analysis yields a key insight: **scales are strongly influenced by the timbres of instruments**. Just intonation and 12-tone equal temperament work well with wind and string instruments' harmonic overtones. The gamelan scale is not based on a pure octave, and it fits the dissonance diagram for inharmonic idiophones. The Bohlen-Pierce scale works well for instruments with odd harmonics. And with electronic instruments, artificial timbres can be created to work with any desired "scale" -- opening up entirely new possibilities for the relationship between instrument design and musical tuning.

