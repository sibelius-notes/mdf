---
title: "AMATH 455/655 - Control Theory"
prof: "Jun Liu"
---
## Week 1: Introduction and State-Space Models

### Lecture 1: Introduction and State-Space Models

#### A Minimal Set of Notation

Before entering the substance of the course, it is useful to fix notation. We denote by <span>&#92;(&#92;mathbb{R}&#92;)</span> the set of real numbers, and by <span>&#92;(&#92;mathbb{R}^n&#92;)</span> the <span>&#92;(n&#92;)</span>-dimensional Euclidean space. For a vector <span>&#92;(x &#92;in &#92;mathbb{R}^n&#92;)</span>, the **Euclidean norm** (also called the <span>&#92;(L^2&#92;)</span> norm or 2-norm) is defined by

<span>&#92;[&#92;|x&#92;| = &#92;sqrt{&#92;sum_{i=1}^{n} x_i^2}.&#92;]</span>

We write <span>&#92;(&#92;mathbb{R}^{n &#92;times m}&#92;)</span> for the space of real matrices with <span>&#92;(n&#92;)</span> rows and <span>&#92;(m&#92;)</span> columns, and <span>&#92;(&#92;mathbb{C}&#92;)</span> for the set of complex numbers, where the imaginary unit is denoted <span>&#92;(j&#92;)</span>. The time derivative of a function <span>&#92;(x&#92;)</span> of time is written <span>&#92;(x'&#92;)</span>; alternative notations include <span>&#92;(&#92;frac{dx}{dt}&#92;)</span> and <span>&#92;(&#92;dot{x}&#92;)</span>. Transposes of a vector <span>&#92;(x&#92;)</span> and a matrix <span>&#92;(A&#92;)</span> are written <span>&#92;(x^T&#92;)</span> and <span>&#92;(A^T&#92;)</span>, respectively.

#### Introduction

Feedback is ubiquitous in nature and engineering. It is a fundamental principle that underpins the effects of influence and dependence throughout both biological and technological systems. It is perhaps not an exaggeration to say that living organisms would not exist without feedback, and that most if not all advanced technologies must rely on feedback to achieve their intended functionalities. Control theory can be seen as the systematic mathematical study of feedback.

To make this study mathematically precise, we employ **mathematical models**. The models introduced in this course are the so-called **state-space models**, which are systems of ordinary differential equations equipped with inputs and outputs. Like ordinary differential equations, they may be classified as linear or nonlinear, and as time-varying or time-invariant.

#### Linear Time-Varying (LTV) Systems

A control system of the form

<span>&#92;[&#92;begin{aligned}
x'(t) &= A(t)x(t) + B(t)u(t), &#92;tag{1.1a} &#92;&#92;
y(t) &= C(t)x(t) + D(t)u(t), &#92;tag{1.1b}
&#92;end{aligned}&#92;]</span>

is called a **linear time-varying (LTV) system**. Here <span>&#92;(x(t) &#92;in &#92;mathbb{R}^n&#92;)</span>, <span>&#92;(u(t) &#92;in &#92;mathbb{R}^k&#92;)</span>, and <span>&#92;(y(t) &#92;in &#92;mathbb{R}^m&#92;)</span> are called the **state**, **input**, and **output** of the system, respectively. The coefficient matrices <span>&#92;(A(t) &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span>, <span>&#92;(B(t) &#92;in &#92;mathbb{R}^{n &#92;times k}&#92;)</span>, <span>&#92;(C(t) &#92;in &#92;mathbb{R}^{m &#92;times n}&#92;)</span>, and <span>&#92;(D(t) &#92;in &#92;mathbb{R}^{m &#92;times k}&#92;)</span> are time-varying. The integer <span>&#92;(n&#92;)</span> is called the **dimension** or **order** of the state space.

#### Linear Time-Invariant (LTI) Systems

A special and especially important case arises when all coefficient matrices are constant. An **linear time-invariant (LTI) system** has the form

<span>&#92;[&#92;begin{aligned}
x'(t) &= Ax(t) + Bu(t), &#92;tag{1.2a} &#92;&#92;
y(t) &= Cx(t) + Du(t), &#92;tag{1.2b}
&#92;end{aligned}&#92;]</span>

where <span>&#92;(A&#92;)</span>, <span>&#92;(B&#92;)</span>, <span>&#92;(C&#92;)</span>, <span>&#92;(D&#92;)</span> are constant matrices of appropriate dimensions. We often write the system in the compact form

<span>&#92;[&#92;begin{aligned}
x' &= Ax + Bu, &#92;tag{1.3a} &#92;&#92;
y &= Cx + Du, &#92;tag{1.3b}
&#92;end{aligned}&#92;]</span>

or simply denote it by the quadruple <span>&#92;((A, B, C, D)&#92;)</span>. LTI systems will be our primary focus throughout the course.

#### Nonlinear Systems

More generally, a continuous-time control system can be described by a system of ordinary differential equations with inputs and outputs of the form

<span>&#92;[&#92;begin{aligned}
x' &= f(x, u), &#92;tag{1.4a} &#92;&#92;
y &= h(x, u), &#92;tag{1.4b}
&#92;end{aligned}&#92;]</span>

where <span>&#92;(x &#92;in &#92;mathbb{R}^n&#92;)</span> is the state, <span>&#92;(u &#92;in &#92;mathbb{R}^k&#92;)</span> the input, <span>&#92;(y &#92;in &#92;mathbb{R}^m&#92;)</span> the output, and

<span>&#92;[f &#92;colon &#92;mathbb{R}^n &#92;times &#92;mathbb{R}^k &#92;to &#92;mathbb{R}^n, &#92;qquad h &#92;colon &#92;mathbb{R}^n &#92;times &#92;mathbb{R}^k &#92;to &#92;mathbb{R}^m&#92;]</span>

are potentially nonlinear functions defining the **state equation** (1.4a) and the **output equation** (1.4b), respectively. We refer to system (1.4) as a **nonlinear system**. We typically assume that both <span>&#92;(f&#92;)</span> and <span>&#92;(h&#92;)</span> are sufficiently smooth, for instance continuously differentiable with respect to both variables. By input, state, and output signals we mean functions <span>&#92;(u(t)&#92;)</span>, <span>&#92;(x(t)&#92;)</span>, and <span>&#92;(y(t)&#92;)</span> satisfying equations (1.4a) and (1.4b).

#### Linearization around a Trajectory

A general nonlinear system can be difficult to analyze directly. A standard technique is **linearization**, which aims to approximate the behavior of the nonlinear system (1.4) in some neighborhood of a given solution. Let <span>&#92;((&#92;bar{x}(t), &#92;bar{u}(t))&#92;)</span> be a solution to (1.4), meaning this pair of functions satisfies the state equation. The linearization of (1.4) around the trajectory <span>&#92;((&#92;bar{x}(t), &#92;bar{u}(t))&#92;)</span> is the LTV system

<span>&#92;[&#92;begin{aligned}
x' &= A(t)x + B(t)u, &#92;&#92;
y &= C(t)x + D(t)u,
&#92;end{aligned}&#92;]</span>

where the coefficient matrices are the Jacobians of <span>&#92;(f&#92;)</span> and <span>&#92;(h&#92;)</span> evaluated along the trajectory:

<span>&#92;[A(t) = &#92;left.&#92;frac{&#92;partial f}{&#92;partial x}&#92;right|_{&#92;substack{x=&#92;bar{x}(t)&#92;&#92; u=&#92;bar{u}(t)}}, &#92;qquad B(t) = &#92;left.&#92;frac{&#92;partial f}{&#92;partial u}&#92;right|_{&#92;substack{x=&#92;bar{x}(t)&#92;&#92; u=&#92;bar{u}(t)}},&#92;]</span>

<span>&#92;[C(t) = &#92;left.&#92;frac{&#92;partial h}{&#92;partial x}&#92;right|_{&#92;substack{x=&#92;bar{x}(t)&#92;&#92; u=&#92;bar{u}(t)}}, &#92;qquad D(t) = &#92;left.&#92;frac{&#92;partial h}{&#92;partial u}&#92;right|_{&#92;substack{x=&#92;bar{x}(t)&#92;&#92; u=&#92;bar{u}(t)}}.&#92;]</span>

Here <span>&#92;(&#92;frac{&#92;partial f}{&#92;partial x}&#92;)</span> denotes the **Jacobian matrix** of <span>&#92;(f&#92;)</span> with respect to <span>&#92;(x&#92;)</span>, defined entry-wise by

<span>&#92;[&#92;frac{&#92;partial f}{&#92;partial x} = &#92;left(&#92;frac{&#92;partial f_i}{&#92;partial x_j}&#92;right) = &#92;begin{bmatrix} &#92;frac{&#92;partial f_1}{&#92;partial x_1} &amp; &#92;cdots &amp; &#92;frac{&#92;partial f_1}{&#92;partial x_n} &#92;&#92; &#92;vdots &amp; &#92;ddots &amp; &#92;vdots &#92;&#92; &#92;frac{&#92;partial f_n}{&#92;partial x_1} &amp; &#92;cdots &amp; &#92;frac{&#92;partial f_n}{&#92;partial x_n} &#92;end{bmatrix}.&#92;]</span>

The Jacobians <span>&#92;(&#92;frac{&#92;partial f}{&#92;partial u}&#92;)</span>, <span>&#92;(&#92;frac{&#92;partial h}{&#92;partial x}&#92;)</span>, and <span>&#92;(&#92;frac{&#92;partial h}{&#92;partial u}&#92;)</span> are similarly defined.

#### Linearization around an Equilibrium Point

A particularly important special case of the above is linearization around an **equilibrium point**. A pair of vectors <span>&#92;((x^*, u^*) &#92;in &#92;mathbb{R}^n &#92;times &#92;mathbb{R}^k&#92;)</span> is said to be an **equilibrium point (EP)** of the system (1.4) if <span>&#92;(f(x^*, u^*) = 0&#92;)</span>. At an equilibrium, the state does not change if the input is held fixed at <span>&#92;(u^*&#92;)</span>. The linearization of (1.4) around the equilibrium <span>&#92;((x^*, u^*)&#92;)</span> yields the LTI system

<span>&#92;[&#92;begin{aligned}
x' &= Ax + Bu, &#92;&#92;
y &= Cx + Du,
&#92;end{aligned}&#92;]</span>

where the constant matrices are

<span>&#92;[A = &#92;left.&#92;frac{&#92;partial f}{&#92;partial x}&#92;right|_{&#92;substack{x=x^*&#92;&#92; u=u^*}}, &#92;qquad B = &#92;left.&#92;frac{&#92;partial f}{&#92;partial u}&#92;right|_{&#92;substack{x=x^*&#92;&#92; u=u^*}}, &#92;qquad C = &#92;left.&#92;frac{&#92;partial h}{&#92;partial x}&#92;right|_{&#92;substack{x=x^*&#92;&#92; u=u^*}}, &#92;qquad D = &#92;left.&#92;frac{&#92;partial h}{&#92;partial u}&#92;right|_{&#92;substack{x=x^*&#92;&#92; u=u^*}}.&#92;]</span>

A large body of control theory is concerned with the analysis and design of controllers for stabilizing an otherwise unstable equilibrium — a classical example being the task of balancing an inverted pendulum with one's hand. Because an LTI system accurately captures the local behavior of a nonlinear system near an equilibrium point, the study of LTI systems is of central importance, and this course will primarily focus on them.

#### Some Terminology

A control system of the form (1.2), (1.3), or (1.4) is called **single input (SI)** if <span>&#92;(k = 1&#92;)</span>, that is, if <span>&#92;(u &#92;in &#92;mathbb{R}&#92;)</span>, and **multiple input (MI)** if <span>&#92;(k > 1&#92;)</span>. Similarly, it is **single output (SO)** if <span>&#92;(m = 1&#92;)</span> and **multiple output (MO)** if <span>&#92;(m > 1&#92;)</span>. Using this terminology, a system with a single input and single output is called a **SISO system**, while a system with multiple inputs and multiple outputs is called a **MIMO system**.

---

### Lecture 2: Matrix Exponential and Solutions to LTI Systems

#### The Matrix Exponential

For a square matrix <span>&#92;(A &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span>, the **matrix exponential** of <span>&#92;(A&#92;)</span> is defined by the power series

<span>&#92;[e^A = &#92;sum_{k=0}^{&#92;infty} &#92;frac{A^k}{k!}.&#92;]</span>

It can be shown that this infinite series is well defined and converges element-wise to a fixed matrix. The matrix exponential is the key tool for solving LTI systems explicitly.

**Proposition 2.1** (Properties of Matrix Exponential). *Let <span>&#92;(A &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span>. The following properties hold.*

*(1) <span>&#92;(e^0 = I&#92;)</span>, where <span>&#92;(0&#92;)</span> and <span>&#92;(I&#92;)</span> are the <span>&#92;(n &#92;times n&#92;)</span> zero and identity matrices, respectively.*

*(2) <span>&#92;(&#92;frac{d}{dt} e^{At} = A e^{At} = e^{At} A&#92;)</span> for all <span>&#92;(t &#92;in &#92;mathbb{R}&#92;)</span>.*

*(3) If <span>&#92;(P^{-1}AP = B&#92;)</span> for some matrices <span>&#92;(P&#92;)</span> and <span>&#92;(B&#92;)</span>, then <span>&#92;(e^A = P e^B P^{-1}&#92;)</span>.*

*(4) If <span>&#92;(AB = BA&#92;)</span>, then <span>&#92;(e^A B = B e^A&#92;)</span>.*

*(5) If <span>&#92;(AB = BA&#92;)</span>, then <span>&#92;(e^A e^B = e^B e^A&#92;)</span>.*

*(6) <span>&#92;(e^{A(t_1 + t_2)} = e^{At_1} e^{At_2} = e^{At_2} e^{At_1}&#92;)</span> for all <span>&#92;(t_1, t_2 &#92;in &#92;mathbb{R}&#92;)</span>.*

*(7) <span>&#92;([e^{At}]^{-1} = e^{-At}&#92;)</span> for all <span>&#92;(t &#92;in &#92;mathbb{R}&#92;)</span>.*

*Proof.* Items (1), (2), (3), and (4) can be verified directly using the definition. We verify item (2) as an illustration. Differentiating term by term,

<span>&#92;[&#92;frac{d}{dt} e^{At} = &#92;frac{d}{dt} &#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k A^k}{k!} = &#92;sum_{k=0}^{&#92;infty} &#92;frac{t^{k-1}}{(k-1)!} A^k = A &#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k A^k}{k!} = &#92;left(&#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k A^k}{k!}&#92;right) A = Ae^{At} = e^{At}A.&#92;]</span>

Item (5) can be proved using Theorem 2.2 below (left as an exercise). Items (6) and (7) follow from (5) together with (1) and (2). <span>&#92;(&#92;square&#92;)</span>

#### The Fundamental Theorem for LTI Systems

The preceding properties of the matrix exponential allow us to solve the unforced LTI system exactly.

**Theorem 2.2** (Fundamental Theorem for LTI Systems). *The unique solution of*

<span>&#92;[x' = Ax, &#92;qquad x(0) = x_0,&#92;]</span>

*is given by*

<span>&#92;[x(t) = e^{At} x_0, &#92;qquad t &#92;in &#92;mathbb{R}.&#92;]</span>

*Proof.* We first verify that <span>&#92;(x(t) = e^{At}x_0&#92;)</span> is indeed a solution. By Proposition 2.1(2),

<span>&#92;[x'(t) = Ae^{At}x_0 = Ax(t),&#92;]</span>

and by Proposition 2.1(1), <span>&#92;(x(0) = e^0 x_0 = I x_0 = x_0&#92;)</span>. To prove uniqueness, suppose <span>&#92;(y(t)&#92;)</span> is any other solution defined on some interval <span>&#92;(I&#92;)</span> containing <span>&#92;(0&#92;)</span>, satisfying <span>&#92;(y'(t) = Ay(t)&#92;)</span> and <span>&#92;(y(0) = x_0&#92;)</span>. Define

<span>&#92;[z(t) = e^{-At} y(t).&#92;]</span>

By Proposition 2.1(1) and (2), we have <span>&#92;(z(0) = y(0) = x_0&#92;)</span> and

<span>&#92;[z'(t) = -Ae^{-At}y(t) + e^{-At}Ay(t) = -e^{-At}Ay(t) + e^{-At}Ay(t) = 0, &#92;qquad t &#92;in I.&#92;]</span>

It follows that <span>&#92;(z(t) = x_0&#92;)</span> is constant, and therefore <span>&#92;(y(t) = e^{At}x_0&#92;)</span> for all <span>&#92;(t &#92;in I&#92;)</span>. <span>&#92;(&#92;square&#92;)</span>

#### Solutions to LTI Systems with Input

When a control input is present, the solution is given by the **variation of constants** (or Duhamel) formula.

**Corollary 2.3** (Solutions to LTI Systems). *Given a control input <span>&#92;(u &#92;colon [0,&#92;infty) &#92;to &#92;mathbb{R}^k&#92;)</span>, the unique solution to the LTI system*

<span>&#92;[x' = Ax + Bu, &#92;qquad y = Cx + Du&#92;]</span>

*with initial condition <span>&#92;(x(0) = x_0 &#92;in &#92;mathbb{R}^n&#92;)</span> is given by*

<span>&#92;[x(t) = e^{At}x_0 + &#92;int_0^t e^{A(t-&#92;tau)} Bu(&#92;tau)&#92;,d&#92;tau, &#92;tag{2.1a}&#92;]</span>

<span>&#92;[y(t) = Ce^{At}x_0 + &#92;int_0^t Ce^{A(t-&#92;tau)}Bu(&#92;tau)&#92;,d&#92;tau + Du(t). &#92;tag{2.1b}&#92;]</span>

*Proof.* One can directly verify that (2.1a) satisfies the state equation and initial condition, and then invoke the uniqueness argument from the proof of Theorem 2.2. Alternatively, (2.1a) can be derived directly from Theorem 2.2 by the method of variation of constants. The output formula (2.1b) then follows by substituting (2.1a) into the output equation. <span>&#92;(&#92;square&#92;)</span>

The formula (2.1a) has a natural interpretation: the first term <span>&#92;(e^{At}x_0&#92;)</span> is the **free response**, describing how the initial state evolves under the unforced dynamics, while the integral term is the **forced response** (or convolution), capturing the effect of the input accumulated over time. In particular, the quantity <span>&#92;(Ce^{At}&#92;)</span> in (2.1b) is the **impulse response** of the output due to the initial state, and the kernel <span>&#92;(Ce^{A(t-&#92;tau)}B&#92;)</span> is the **system's impulse response matrix**.

#### Computing Matrix Exponentials

Given <span>&#92;(A &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span>, how does one compute <span>&#92;(e^{At}&#92;)</span> in practice? For numerical work, one uses a computer algebra system. For example, the following MATLAB script computes <span>&#92;(e^{At}&#92;)</span> symbolically for <span>&#92;(A = &#92;begin{bmatrix} 1 &amp; 1 &#92;&#92; 0 &amp; 1 &#92;end{bmatrix}&#92;)</span>:

```matlab
A = [1 1; 0 1];
syms t;
Q = expm(A*t);
```

The result is

<span>&#92;[e^{At} = &#92;begin{bmatrix} e^t &amp; te^t &#92;&#92; 0 &amp; e^t &#92;end{bmatrix}.&#92;]</span>

How to compute matrix exponentials analytically is an important theoretical question. A general and systematic approach uses the **Jordan normal form**. Every square matrix <span>&#92;(A&#92;)</span> is similar to a block diagonal matrix

<span>&#92;[J = &#92;begin{bmatrix} J_1 &amp; 0 &amp; &#92;cdots &amp; 0 &#92;&#92; 0 &amp; J_2 &amp; &#92;ddots &amp; &#92;vdots &#92;&#92; &#92;vdots &amp; &#92;ddots &amp; &#92;ddots &amp; 0 &#92;&#92; 0 &amp; &#92;cdots &amp; 0 &amp; J_k &#92;end{bmatrix},&#92;]</span>

where each **Jordan block** <span>&#92;(J_i&#92;)</span> is a <span>&#92;(k_i &#92;times k_i&#92;)</span> upper-bidiagonal matrix of the form

<span>&#92;[J_i = &#92;begin{bmatrix} &#92;lambda_i &amp; 1 &amp; 0 &amp; &#92;cdots &amp; 0 &#92;&#92; 0 &amp; &#92;lambda_i &amp; &#92;ddots &amp; &#92;ddots &amp; &#92;vdots &#92;&#92; &#92;vdots &amp; &#92;ddots &amp; &#92;ddots &amp; &#92;ddots &amp; 0 &#92;&#92; 0 &amp; &#92;ddots &amp; &#92;ddots &amp; &#92;lambda_i &amp; 1 &#92;&#92; 0 &amp; 0 &amp; &#92;cdots &amp; 0 &amp; &#92;lambda_i &#92;end{bmatrix}_{k_i &#92;times k_i},&#92;]</span>

and <span>&#92;(&#92;lambda_i&#92;)</span> is a (possibly complex) eigenvalue of <span>&#92;(A&#92;)</span>. The exponential of the full Jordan form is block diagonal:

<span>&#92;[e^{Jt} = &#92;begin{bmatrix} e^{J_1 t} &amp; 0 &amp; &#92;cdots &amp; 0 &#92;&#92; 0 &amp; e^{J_2 t} &amp; &#92;ddots &amp; &#92;vdots &#92;&#92; &#92;vdots &amp; &#92;ddots &amp; &#92;ddots &amp; 0 &#92;&#92; 0 &amp; &#92;cdots &amp; 0 &amp; e^{J_p t} &#92;end{bmatrix},&#92;]</span>

and the exponential of a single Jordan block is given explicitly by

<span>&#92;[e^{J_i t} = e^{&#92;lambda_i t} &#92;begin{bmatrix} 1 &amp; t &amp; &#92;frac{t^2}{2!} &amp; &#92;cdots &amp; &#92;frac{t^{k_i-1}}{(k_i-1)!} &#92;&#92; 0 &amp; 1 &amp; &#92;ddots &amp; &#92;ddots &amp; &#92;vdots &#92;&#92; &#92;vdots &amp; &#92;ddots &amp; &#92;ddots &amp; &#92;ddots &amp; &#92;frac{t^2}{2!} &#92;&#92; 0 &amp; &#92;ddots &amp; &#92;ddots &amp; 1 &amp; t &#92;&#92; 0 &amp; 0 &amp; &#92;cdots &amp; 0 &amp; 1 &#92;end{bmatrix}.&#92;]</span>

The procedure for computing <span>&#92;(e^{At}&#92;)</span> is thus as follows. First, find an invertible matrix <span>&#92;(P&#92;)</span> such that <span>&#92;(P^{-1}AP = J&#92;)</span> is in Jordan normal form. Second, compute <span>&#92;(e^{Jt}&#92;)</span> using the block formula above. Third, use Proposition 2.1(3) to obtain <span>&#92;(e^{At} = P e^{Jt} P^{-1}&#92;)</span>.

#### Structure of the Matrix Exponential

One important consequence of the Jordan normal form computation is the following structural result.

**Corollary 2.4.** *Each entry of <span>&#92;(e^{At}&#92;)</span> is a linear combination of terms of the form*

<span>&#92;[t^k e^{&#92;alpha t} &#92;cos &#92;beta t &#92;qquad &#92;text{or} &#92;qquad t^k e^{&#92;alpha t} &#92;sin &#92;beta t,&#92;]</span>

*where <span>&#92;(&#92;lambda = &#92;alpha + j&#92;beta&#92;)</span> is an eigenvalue of <span>&#92;(A&#92;)</span> and <span>&#92;(k&#92;)</span> is a non-negative integer. Consequently, if all eigenvalues of <span>&#92;(A&#92;)</span> have strictly negative real parts, then <span>&#92;(e^{At} &#92;to 0&#92;)</span> as <span>&#92;(t &#92;to &#92;infty&#92;)</span> (entry-wise).*

This corollary has profound implications for stability: the long-term behavior of the free response <span>&#92;(x(t) = e^{At}x_0&#92;)</span> is entirely governed by the eigenvalues of <span>&#92;(A&#92;)</span>. If every eigenvalue has negative real part, the state decays to zero regardless of the initial condition; if any eigenvalue has positive real part, there exist initial conditions for which the state grows without bound.

---

## Week 2: Controllability

### Lecture 3: Controllability

#### The Controllability Question

Consider the LTI system

<span>&#92;[x' = Ax + Bu, &#92;qquad x &#92;in &#92;mathbb{R}^n, &#92;quad u &#92;in &#92;mathbb{R}^k,&#92;]</span>

which we denote simply by <span>&#92;((A, B)&#92;)</span>, omitting the output equation for now. From Lecture 2, we know that given a control input <span>&#92;(u(t)&#92;)</span> and an initial condition <span>&#92;(x_0&#92;)</span>, the unique solution is

<span>&#92;[x(t) = e^{At}x_0 + &#92;int_0^t e^{A(t-&#92;tau)}Bu(&#92;tau)&#92;,d&#92;tau.&#92;]</span>

**Controllability** asks a fundamental question about the capabilities of this system: given any initial state <span>&#92;(x_0&#92;)</span> and any desired final state <span>&#92;(x_1&#92;)</span>, can we always find a control input <span>&#92;(u(t)&#92;)</span> that steers the system from <span>&#92;(x_0&#92;)</span> to <span>&#92;(x_1&#92;)</span> in finite time? The answer depends on the structure of the matrices <span>&#92;(A&#92;)</span> and <span>&#92;(B&#92;)</span>, and characterizing exactly when such steering is possible is the central problem of this lecture.

**Definition 3.1.** The LTI system <span>&#92;((A, B)&#92;)</span> is said to be **controllable** if for any initial state <span>&#92;(x_0 &#92;in &#92;mathbb{R}^n&#92;)</span>, any final state <span>&#92;(x_1 &#92;in &#92;mathbb{R}^n&#92;)</span>, and any time <span>&#92;(t_1 > 0&#92;)</span>, there exists an input <span>&#92;(u &#92;colon [0, t_1] &#92;to &#92;mathbb{R}^k&#92;)</span> such that the solution satisfies <span>&#92;(x(0) = x_0&#92;)</span> and <span>&#92;(x(t_1) = x_1&#92;)</span>.

#### The Main Controllability Theorem

The following theorem provides four equivalent characterizations of controllability, each offering a different perspective and practical utility.

**Theorem 3.2** (Controllability). *The following statements are equivalent:*

*(1) The LTI system <span>&#92;((A, B)&#92;)</span> is controllable.*

*(2) The **controllability Gramian***

<span>&#92;[W(t) = &#92;int_0^t e^{A&#92;tau} BB^T e^{A^T &#92;tau}&#92;,d&#92;tau&#92;]</span>

*is positive definite for all <span>&#92;(t > 0&#92;)</span>.*

*(3) (**Kalman's rank condition**) The **controllability matrix***

<span>&#92;[&#92;mathcal{C}(A,B) = &#92;begin{bmatrix} B &amp; AB &amp; &#92;cdots &amp; A^{n-1}B &#92;end{bmatrix}&#92;]</span>

*has rank <span>&#92;(n&#92;)</span> (i.e., full row rank).*

*(4) (**Popov-Belevitch-Hautus test**) The matrix*

<span>&#92;[&#92;begin{bmatrix} A - &#92;lambda I &amp; B &#92;end{bmatrix}&#92;]</span>

*has rank <span>&#92;(n&#92;)</span> for every <span>&#92;(&#92;lambda &#92;in &#92;mathbb{C}&#92;)</span>.*

*Proof.* We prove the equivalences in the order <span>&#92;((2) &#92;Rightarrow (1) &#92;Rightarrow (2) &#92;Rightarrow (3) &#92;Leftrightarrow (2)&#92;)</span>, leaving the PBH test to Lecture 4.

**<span>&#92;((2) &#92;Rightarrow (1)&#92;)</span>:** Suppose <span>&#92;(W(t)&#92;)</span> is positive definite for all <span>&#92;(t > 0&#92;)</span>. For any <span>&#92;(x_0, x_1 &#92;in &#92;mathbb{R}^n&#92;)</span> and <span>&#92;(t_1 > 0&#92;)</span>, define the control input

<span>&#92;[u(t) = -B^T e^{A^T(t_1-t)} W^{-1}(t_1) &#92;left[e^{At_1}x_0 - x_1&#92;right].&#92;]</span>

Substituting into the solution formula and recalling the definition of <span>&#92;(W(t_1)&#92;)</span>,

<span>&#92;[&#92;begin{aligned}
x(t_1) &= e^{At_1}x_0 + &#92;int_0^{t_1} e^{A(t_1-&#92;tau)} B &#92;left[-B^T e^{A^T(t_1-&#92;tau)} W^{-1}(t_1)(e^{At_1}x_0 - x_1)&#92;right] d&#92;tau &#92;&#92;
&= e^{At_1}x_0 - &#92;left[&#92;int_0^{t_1} e^{A(t_1-&#92;tau)} BB^T e^{A^T(t_1-&#92;tau)}&#92;,d&#92;tau&#92;right] W^{-1}(t_1)(e^{At_1}x_0 - x_1) &#92;&#92;
&= e^{At_1}x_0 - W(t_1)W^{-1}(t_1)(e^{At_1}x_0 - x_1) = x_1.
&#92;end{aligned}&#92;]</span>

Hence <span>&#92;((A,B)&#92;)</span> is controllable.

**<span>&#92;((1) &#92;Rightarrow (2)&#92;)</span>:** Suppose that <span>&#92;(W(t_1)&#92;)</span> is not positive definite for some <span>&#92;(t_1 > 0&#92;)</span>. Since <span>&#92;(W(t_1)&#92;)</span> is positive semi-definite by definition, there exists a nonzero vector <span>&#92;(v &#92;in &#92;mathbb{R}^n&#92;)</span> such that

<span>&#92;[v^T W(t_1) v = &#92;int_0^{t_1} &#92;|v^T e^{A&#92;tau} B&#92;|^2&#92;,d&#92;tau = 0,&#92;]</span>

which implies <span>&#92;(v^T e^{A&#92;tau} B = 0&#92;)</span> for all <span>&#92;(&#92;tau &#92;in [0, t_1]&#92;)</span>. Because <span>&#92;((A,B)&#92;)</span> is controllable, there exists an input <span>&#92;(u(&#92;cdot)&#92;)</span> on <span>&#92;([0, t_1]&#92;)</span> steering <span>&#92;(x(0) = e^{-At_1}v&#92;)</span> to <span>&#92;(x(t_1) = 0&#92;)</span>, which means

<span>&#92;[0 = e^{At_1}(e^{-At_1}v) + &#92;int_0^{t_1} e^{A(t_1-&#92;tau)}Bu(&#92;tau)&#92;,d&#92;tau = v + &#92;int_0^{t_1} e^{A(t_1-&#92;tau)}Bu(&#92;tau)&#92;,d&#92;tau.&#92;]</span>

Left-multiplying by <span>&#92;(v^T&#92;)</span> and using <span>&#92;(v^T e^{A&#92;tau}B = 0&#92;)</span>,

<span>&#92;[0 = v^T v + &#92;int_0^{t_1} v^T e^{A(t_1-&#92;tau)}Bu(&#92;tau)&#92;,d&#92;tau = &#92;|v&#92;|^2,&#92;]</span>

so <span>&#92;(v = 0&#92;)</span>, a contradiction. Therefore <span>&#92;(W(t)&#92;)</span> is positive definite for all <span>&#92;(t > 0&#92;)</span>.

**<span>&#92;((2) &#92;Rightarrow (3)&#92;)</span>:** We require the following lemma.

**Lemma 3.3.** *Let <span>&#92;(A &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span>. There exist scalar functions <span>&#92;(&#92;alpha_0(t), &#92;alpha_1(t), &#92;ldots, &#92;alpha_{n-1}(t)&#92;)</span> such that*

<span>&#92;[e^{At} = &#92;sum_{i=0}^{n-1} &#92;alpha_i(t) A^i, &#92;qquad &#92;forall t &#92;in &#92;mathbb{R}.&#92;]</span>

*Proof of Lemma.* By the Cayley-Hamilton theorem, <span>&#92;(A&#92;)</span> satisfies its own characteristic polynomial:

<span>&#92;[A^n + a_1 A^{n-1} + a_2 A^{n-2} + &#92;cdots + a_{n-1}A + a_n I = 0,&#92;]</span>

where <span>&#92;(P(&#92;lambda) = &#92;lambda^n + a_1 &#92;lambda^{n-1} + &#92;cdots + a_{n-1}&#92;lambda + a_n&#92;)</span> is the characteristic polynomial of <span>&#92;(A&#92;)</span>. It follows that every power <span>&#92;(A^k&#92;)</span> for <span>&#92;(k &#92;geq n&#92;)</span> can be written as a linear combination of <span>&#92;(I, A, A^2, &#92;ldots, A^{n-1}&#92;)</span>. Writing <span>&#92;(A^k = &#92;sum_{i=0}^{n-1} b_i(k) A^i&#92;)</span>, we obtain

<span>&#92;[e^{At} = &#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k}{k!} A^k = &#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k}{k!} &#92;sum_{i=0}^{n-1} b_i(k) A^i = &#92;sum_{i=0}^{n-1} &#92;left(&#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k}{k!} b_i(k)&#92;right) A^i = &#92;sum_{i=0}^{n-1} &#92;alpha_i(t) A^i,&#92;]</span>

where we define <span>&#92;(&#92;alpha_i(t) = &#92;sum_{k=0}^{&#92;infty} &#92;frac{t^k}{k!} b_i(k)&#92;)</span>. <span>&#92;(&#92;square&#92;)</span>

Returning to <span>&#92;((2) &#92;Rightarrow (3)&#92;)</span>: suppose that <span>&#92;(&#92;mathrm{rank}&#92;,[B&#92; AB&#92; &#92;cdots&#92; A^{n-1}B] < n&#92;)</span>. Then there exists a nonzero <span>&#92;(v &#92;in &#92;mathbb{R}^n&#92;)</span> such that <span>&#92;(v^T [B&#92; AB&#92; &#92;cdots&#92; A^{n-1}B] = 0&#92;)</span>, which means <span>&#92;(v^T A^i B = 0&#92;)</span> for all <span>&#92;(i = 0, 1, &#92;ldots, n-1&#92;)</span>. By Lemma 3.3,

<span>&#92;[v^T e^{At} B = &#92;sum_{i=0}^{n-1} &#92;alpha_i(t)&#92;, v^T A^i B = 0, &#92;qquad &#92;forall t &#92;in &#92;mathbb{R}.&#92;]</span>

Hence <span>&#92;(v^T e^{At} BB^T e^{A^Tt} v = 0&#92;)</span> for all <span>&#92;(t&#92;)</span>, so

<span>&#92;[v^T W(t) v = &#92;int_0^t v^T e^{A&#92;tau} BB^T e^{A^T&#92;tau} v&#92;,d&#92;tau = 0&#92;]</span>

for all <span>&#92;(t&#92;)</span>. This shows <span>&#92;(W(t)&#92;)</span> is not positive definite for any <span>&#92;(t&#92;)</span>.

**<span>&#92;((3) &#92;Rightarrow (2)&#92;)</span>:** Suppose <span>&#92;(W(t)&#92;)</span> is not positive definite for some <span>&#92;(t > 0&#92;)</span>. As shown in the proof of <span>&#92;((1) &#92;Rightarrow (2)&#92;)</span>, there exists a nonzero <span>&#92;(v&#92;)</span> with <span>&#92;(v^T e^{A&#92;tau} B = 0&#92;)</span> for all <span>&#92;(&#92;tau &#92;in [0, t]&#92;)</span>. Differentiating repeatedly with respect to <span>&#92;(&#92;tau&#92;)</span> and evaluating at <span>&#92;(&#92;tau = 0&#92;)</span>,

<span>&#92;[v^T A^i B = 0, &#92;qquad &#92;forall i = 0, 1, 2, &#92;ldots,&#92;]</span>

and in particular <span>&#92;(v^T [B&#92; AB&#92; &#92;cdots&#92; A^{n-1}B] = 0&#92;)</span>, so the controllability matrix has rank less than <span>&#92;(n&#92;)</span>. The proof of the PBH test (statement (4)) is deferred to Lecture 4. <span>&#92;(&#92;square&#92;)</span>

#### The PBH Test in Practice

**Remark 3.4.** The Popov-Belevitch-Hautus test is commonly referred to as the **PBH test**. To apply it, one need only check <span>&#92;(&#92;mathrm{rank}[A - &#92;lambda I&#92; &#92; B] = n&#92;)</span> for eigenvalues <span>&#92;(&#92;lambda&#92;)</span> of <span>&#92;(A&#92;)</span>, because for any <span>&#92;(&#92;lambda&#92;)</span> that is not an eigenvalue of <span>&#92;(A&#92;)</span>, the matrix <span>&#92;(A - &#92;lambda I&#92;)</span> is already invertible and hence has rank <span>&#92;(n&#92;)</span> on its own.

#### Examples

**Example 3.5.** Consider the LTI system

<span>&#92;[x' = &#92;begin{bmatrix} 0 &amp; 1 &#92;&#92; 1 &amp; 0 &#92;end{bmatrix} x + &#92;begin{bmatrix} 1 &#92;&#92; 1 &#92;end{bmatrix} u.&#92;]</span>

The controllability matrix is

<span>&#92;[&#92;mathcal{C}(A,B) = &#92;begin{bmatrix} B &amp; AB &#92;end{bmatrix} = &#92;begin{bmatrix} 1 &amp; 1 &#92;&#92; 1 &amp; 1 &#92;end{bmatrix},&#92;]</span>

which has rank 1. Hence <span>&#92;((A, B)&#92;)</span> is not controllable. We can confirm this with the PBH test. The eigenvalues of <span>&#92;(A&#92;)</span> are <span>&#92;(&#92;lambda = -1&#92;)</span> and <span>&#92;(&#92;lambda = 1&#92;)</span>. For <span>&#92;(&#92;lambda = -1&#92;)</span>,

<span>&#92;[&#92;mathrm{rank}[A - &#92;lambda I &#92;quad B] = &#92;mathrm{rank}&#92;begin{bmatrix} 1 &amp; 1 &amp; 1 &#92;&#92; 1 &amp; 1 &amp; 1 &#92;end{bmatrix} = 1 < 2.&#92;]</span>

The matrix fails to have full rank, confirming that <span>&#92;((A,B)&#92;)</span> is not controllable.

**Example 3.6** (Coupled cart-spring system). A coupled cart-spring system consists of two masses <span>&#92;(m_1 = 1&#92;)</span> and <span>&#92;(m_2 = 1/2&#92;)</span> connected by a spring with constant <span>&#92;(k = 1&#92;)</span>. The equations of motion are

<span>&#92;[m_1 &#92;ddot{y}_1 = u_1 + k(y_2 - y_1), &#92;qquad m_2 &#92;ddot{y}_2 = u_2 + k(y_1 - y_2).&#92;]</span>

Introducing the state vector <span>&#92;(x = (x_1, x_2, x_3, x_4)^T = (y_1, &#92;dot{y}_1, y_2, &#92;dot{y}_2)^T&#92;)</span>, the system takes the form <span>&#92;(x' = Ax + Bu&#92;)</span> with

<span>&#92;[A = &#92;begin{bmatrix} 0 &amp; 1 &amp; 0 &amp; 0 &#92;&#92; -1 &amp; 0 &amp; 1 &amp; 0 &#92;&#92; 0 &amp; 0 &amp; 0 &amp; 1 &#92;&#92; 2 &amp; 0 &amp; -2 &amp; 0 &#92;end{bmatrix}, &#92;qquad B = &#92;begin{bmatrix} 0 &amp; 0 &#92;&#92; 1 &amp; 0 &#92;&#92; 0 &amp; 0 &#92;&#92; 0 &amp; 2 &#92;end{bmatrix}.&#92;]</span>

The controllability matrix <span>&#92;(&#92;mathcal{C}(A,B) = [B&#92; AB&#92; A^2B&#92; A^3B]&#92;)</span> is the <span>&#92;(4 &#92;times 8&#92;)</span> matrix

<span>&#92;[&#92;mathcal{C}(A,B) = &#92;begin{bmatrix} 0 &amp; 0 &amp; 1 &amp; 0 &amp; 0 &amp; 0 &amp; -1 &amp; 2 &#92;&#92; 1 &amp; 0 &amp; 0 &amp; 0 &amp; -1 &amp; 2 &amp; 0 &amp; 0 &#92;&#92; 0 &amp; 0 &amp; 0 &amp; 2 &amp; 0 &amp; 0 &amp; 2 &amp; -4 &#92;&#92; 0 &amp; 2 &amp; 0 &amp; 0 &amp; 2 &amp; -4 &amp; 0 &amp; 0 &#92;end{bmatrix}.&#92;]</span>

This matrix has rank 4, so <span>&#92;((A,B)&#92;)</span> is controllable. When both carts are independently actuated, the system can be steered to any desired configuration.

**Example 3.7.** Consider the same cart-spring system but with only a single input <span>&#92;(u&#92;)</span> applied to both carts simultaneously (Figure 3.2). The question of whether this single-input system remains controllable is an important practical one — can a single actuator still achieve full control? The analysis follows the same procedure, and the answer depends on the specific structure of <span>&#92;(B&#92;)</span> in that configuration.

---

### Lecture 4: Controllability (continued)

#### Controllability under State Transformation

Before proving the PBH test, we establish that controllability is a property intrinsic to the system and not an artifact of the particular choice of state coordinates. Consider the **state transformation** <span>&#92;(z = Px&#92;)</span>, where <span>&#92;(P &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span> is a non-singular matrix. Differentiating and substituting the state equation,

<span>&#92;[z' = Px' = PAx + PBu = PAP^{-1}z + PBu.&#92;]</span>

We obtain the transformed LTI system <span>&#92;((PAP^{-1}, PB)&#92;)</span>.

**Theorem 4.8** (Controllability is invariant under state transformation). *Let <span>&#92;(P &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span> be non-singular. Then <span>&#92;((A, B)&#92;)</span> is controllable if and only if <span>&#92;((PAP^{-1}, PB)&#92;)</span> is controllable.*

*Proof.* Observe that

<span>&#92;[&#92;begin{aligned}
&#92;mathcal{C}(PAP^{-1}, PB) &= &#92;begin{bmatrix} PB &amp; PAP^{-1} &#92;cdot PB &amp; &#92;cdots &amp; (PAP^{-1})^{n-1} PB &#92;end{bmatrix} &#92;&#92;
&= &#92;begin{bmatrix} PB &amp; PAB &amp; &#92;cdots &amp; PA^{n-1}B &#92;end{bmatrix} &#92;&#92;
&= P&#92;begin{bmatrix} B &amp; AB &amp; &#92;cdots &amp; A^{n-1}B &#92;end{bmatrix} = P&#92;,&#92;mathcal{C}(A,B).
&#92;end{aligned}&#92;]</span>

Since <span>&#92;(P&#92;)</span> is non-singular, left-multiplying by <span>&#92;(P&#92;)</span> does not change the rank. The conclusion follows from Kalman's rank condition. <span>&#92;(&#92;square&#92;)</span>

**Remark 4.9.** The above proof also shows that <span>&#92;(&#92;mathcal{C}(A,B)&#92;)</span> and <span>&#92;(&#92;mathcal{C}(PAP^{-1}, PB)&#92;)</span> have the same rank for any non-singular <span>&#92;(P&#92;)</span>.

#### Controllable Decomposition

When <span>&#92;((A,B)&#92;)</span> is not controllable, the state space can be decomposed into a part that is reachable by the input and a part that evolves freely and cannot be influenced. This decomposition is formalized as follows.

Suppose <span>&#92;((A,B)&#92;)</span> is not controllable, so the controllability matrix <span>&#92;(&#92;mathcal{C}(A,B) = [B&#92; AB&#92; &#92;cdots&#92; A^{n-1}B]&#92;)</span> has rank <span>&#92;(n_1 < n&#92;)</span>. Let <span>&#92;(v_1, v_2, &#92;ldots, v_{n_1}&#92;)</span> be <span>&#92;(n_1&#92;)</span> linearly independent columns of <span>&#92;(&#92;mathcal{C}(A,B)&#92;)</span>, and choose additional vectors <span>&#92;(v_{n_1+1}, &#92;ldots, v_n&#92;)</span> so that <span>&#92;(P^{-1} = [v_1&#92; v_2&#92; &#92;cdots&#92; v_n]&#92;)</span> is invertible. Introduce the state transformation <span>&#92;(z = Px&#92;)</span>.

A key structural observation is that the image of the controllability matrix is invariant under <span>&#92;(A&#92;)</span>: that is, <span>&#92;(A &#92;cdot &#92;mathrm{Im}(&#92;mathcal{C}(A,B)) &#92;subseteq &#92;mathrm{Im}(&#92;mathcal{C}(A,B))&#92;)</span>. This follows from the Cayley-Hamilton theorem, since every column of <span>&#92;(A^n B&#92;)</span> lies in the span of the columns of <span>&#92;([B&#92; AB&#92; &#92;cdots&#92; A^{n-1}B]&#92;)</span>. Consequently, in the new coordinates, <span>&#92;(PAP^{-1}&#92;)</span> and <span>&#92;(PB&#92;)</span> take the block forms

<span>&#92;[PAP^{-1} = &#92;begin{pmatrix} A_c &amp; A_{12} &#92;&#92; 0 &amp; A_u &#92;end{pmatrix}, &#92;qquad PB = &#92;begin{pmatrix} B_c &#92;&#92; 0 &#92;end{pmatrix}, &#92;tag{4.1, 4.2}&#92;]</span>

where <span>&#92;(A_c &#92;in &#92;mathbb{R}^{n_1 &#92;times n_1}&#92;)</span> and <span>&#92;(B_c &#92;in &#92;mathbb{R}^{n_1 &#92;times k}&#92;)</span>. Writing the new state as <span>&#92;(z = (z_1^T, z_2^T)^T&#92;)</span> with <span>&#92;(z_1 &#92;in &#92;mathbb{R}^{n_1}&#92;)</span> and <span>&#92;(z_2 &#92;in &#92;mathbb{R}^{n-n_1}&#92;)</span>, the system in the new coordinates becomes

<span>&#92;[&#92;begin{aligned}
z_1' &= A_c z_1 + A_{12} z_2 + B_c u, &#92;tag{4.3a} &#92;&#92;
z_2' &= A_u z_2. &#92;tag{4.3b}
&#92;end{aligned}&#92;]</span>

The subsystem (4.3b) evolves autonomously, entirely independent of the input <span>&#92;(u&#92;)</span>. No matter what control is applied, <span>&#92;(z_2&#92;)</span> cannot be influenced. The subsystem (4.3a) is driven by the input, and the pair <span>&#92;((A_c, B_c)&#92;)</span> is called the **controllable part** of <span>&#92;((A,B)&#92;)</span>.

We claim that <span>&#92;((A_c, B_c)&#92;)</span> is itself controllable. To see this, compute the controllability matrix of <span>&#92;((PAP^{-1}, PB)&#92;)</span> using the block structure:

<span>&#92;[&#92;mathcal{C}(PAP^{-1}, PB) = &#92;begin{bmatrix} B_c &amp; A_c B_c &amp; A_c^2 B_c &amp; &#92;cdots &amp; A_c^{n-1}B_c &#92;&#92; 0 &amp; 0 &amp; 0 &amp; &#92;cdots &amp; 0 &#92;end{bmatrix}.&#92;]</span>

This matrix clearly has the same rank as <span>&#92;(&#92;mathcal{C}(A_c, B_c) = [B_c&#92; A_c B_c&#92; &#92;cdots&#92; A_c^{n_1-1}B_c]&#92;)</span>. By Remark 4.9, the rank of <span>&#92;(&#92;mathcal{C}(PAP^{-1}, PB)&#92;)</span> equals the rank of <span>&#92;(&#92;mathcal{C}(A,B)&#92;)</span>, which is <span>&#92;(n_1&#92;)</span>. Therefore <span>&#92;(&#92;mathcal{C}(A_c, B_c)&#92;)</span> has rank <span>&#92;(n_1&#92;)</span>, which is full row rank for a system of dimension <span>&#92;(n_1&#92;)</span>. By Kalman's rank condition, <span>&#92;((A_c, B_c)&#92;)</span> is controllable.

**Theorem 4.10** (Controllable Decomposition). *If <span>&#92;((A,B)&#92;)</span> is not controllable, then there exists a non-singular matrix <span>&#92;(P&#92;)</span> such that*

<span>&#92;[PAP^{-1} = &#92;begin{bmatrix} A_c &amp; A_{12} &#92;&#92; 0 &amp; A_u &#92;end{bmatrix}, &#92;qquad PB = &#92;begin{bmatrix} B_c &#92;&#92; 0 &#92;end{bmatrix},&#92;]</span>

*where <span>&#92;((A_c, B_c)&#92;)</span> is controllable (provided <span>&#92;(n_1 > 0&#92;)</span).*

#### Example of Controllable Decomposition

**Example 4.11.** Consider the LTI system

<span>&#92;[x' = &#92;begin{bmatrix} 1 &amp; 1 &amp; 0 &#92;&#92; 0 &amp; 1 &amp; 0 &#92;&#92; 0 &amp; 1 &amp; 1 &#92;end{bmatrix} x + &#92;begin{bmatrix} 0 &amp; 1 &#92;&#92; 1 &amp; 0 &#92;&#92; 0 &amp; 1 &#92;end{bmatrix} u.&#92;]</span>

The controllability matrix is

<span>&#92;[&#92;mathcal{C}(A,B) = &#92;begin{bmatrix} B &amp; AB &amp; A^2B &#92;end{bmatrix} = &#92;begin{bmatrix} 0 &amp; 1 &amp; 1 &amp; 1 &amp; 2 &amp; 1 &#92;&#92; 1 &amp; 0 &amp; 1 &amp; 0 &amp; 1 &amp; 0 &#92;&#92; 0 &amp; 1 &amp; 1 &amp; 1 &amp; 2 &amp; 1 &#92;end{bmatrix},&#92;]</span>

which has rank 2. Hence <span>&#92;((A,B)&#92;)</span> is not controllable. To find the controllable decomposition, pick two linearly independent columns of <span>&#92;(&#92;mathcal{C}(A,B)&#92;)</span> spanning its column space and one additional vector:

<span>&#92;[v_1 = &#92;begin{bmatrix} 0 &#92;&#92; 1 &#92;&#92; 0 &#92;end{bmatrix}, &#92;quad v_2 = &#92;begin{bmatrix} 1 &#92;&#92; 0 &#92;&#92; 1 &#92;end{bmatrix}, &#92;quad v_3 = &#92;begin{bmatrix} 1 &#92;&#92; 0 &#92;&#92; 0 &#92;end{bmatrix}.&#92;]</span>

Then

<span>&#92;[P^{-1} = &#92;begin{bmatrix} 0 &amp; 1 &amp; 1 &#92;&#92; 1 &amp; 0 &amp; 0 &#92;&#92; 0 &amp; 1 &amp; 0 &#92;end{bmatrix} &#92;implies P = &#92;begin{bmatrix} 0 &amp; 1 &amp; 0 &#92;&#92; 0 &amp; 0 &amp; 1 &#92;&#92; 1 &amp; 0 &amp; -1 &#92;end{bmatrix}.&#92;]</span>

Computing the transformed matrices,

<span>&#92;[PAP^{-1} = &#92;begin{bmatrix} 1 &amp; 0 &amp; 0 &#92;&#92; 1 &amp; 1 &amp; 0 &#92;&#92; 0 &amp; 0 &amp; 1 &#92;end{bmatrix}, &#92;qquad PB = &#92;begin{bmatrix} 1 &amp; 0 &#92;&#92; 0 &amp; 1 &#92;&#92; 0 &amp; 0 &#92;end{bmatrix}.&#92;]</span>

The controllable part is <span>&#92;((A_c, B_c) = &#92;left(&#92;begin{bmatrix}1 &amp; 0 &#92;&#92; 1 &amp; 1&#92;end{bmatrix}, &#92;begin{bmatrix}1 &amp; 0 &#92;&#92; 0 &amp; 1&#92;end{bmatrix}&#92;right)&#92;)</span>, and it is straightforward to verify that this pair is indeed controllable by checking that its controllability matrix has rank 2.

#### Proof of the PBH Test

We can now prove the PBH test, restated here for completeness.

**Theorem 4.12** (PBH Test). *Let <span>&#92;(A &#92;in &#92;mathbb{R}^{n &#92;times n}&#92;)</span> and <span>&#92;(B &#92;in &#92;mathbb{R}^{n &#92;times k}&#92;)</span>. The pair <span>&#92;((A,B)&#92;)</span> is controllable if and only if*

<span>&#92;[&#92;mathrm{rank}&#92;begin{bmatrix} A - &#92;lambda I &amp; B &#92;end{bmatrix} = n &#92;qquad &#92;text{for all } &#92;lambda &#92;in &#92;mathbb{C}.&#92;]</span>

*Proof.* We prove both directions.

**(<span>&#92;(&#92;Rightarrow&#92;)</span> contrapositive):** Suppose <span>&#92;([A - &#92;lambda I&#92; &#92; B]&#92;)</span> does not have full rank for some <span>&#92;(&#92;lambda &#92;in &#92;mathbb{C}&#92;)</span>. Then there exists a nonzero complex vector <span>&#92;(v&#92;)</span> such that

<span>&#92;[v^T [A - &#92;lambda I &#92;quad B] = &#92;begin{bmatrix} v^T A - &#92;lambda v^T &amp; v^T B &#92;end{bmatrix} = 0,&#92;]</span>

so <span>&#92;(v^T A = &#92;lambda v^T&#92;)</span> (meaning <span>&#92;(v&#92;)</span> is a **left eigenvector** of <span>&#92;(A&#92;)</span> with eigenvalue <span>&#92;(&#92;lambda&#92;)</span>) and <span>&#92;(v^T B = 0&#92;)</span>. It follows that

<span>&#92;[v^T A^i B = &#92;lambda^i v^T B = 0, &#92;qquad i = 0, 1, &#92;ldots, n-1,&#92;]</span>

so <span>&#92;(v^T [B&#92; AB&#92; &#92;cdots&#92; A^{n-1}B] = 0&#92;)</span>. The controllability matrix fails to have full row rank, so <span>&#92;((A,B)&#92;)</span> is not controllable by Kalman's rank condition.

**(<span>&#92;(&#92;Leftarrow&#92;)</span> contrapositive):** Now suppose <span>&#92;((A,B)&#92;)</span> is not controllable. By the Controllable Decomposition Theorem (Theorem 4.10), there exists a non-singular <span>&#92;(P&#92;)</span> such that

<span>&#92;[PAP^{-1} = &#92;begin{bmatrix} A_c &amp; A_{12} &#92;&#92; 0 &amp; A_u &#92;end{bmatrix}, &#92;qquad PB = &#92;begin{bmatrix} B_c &#92;&#92; 0 &#92;end{bmatrix}.&#92;]</span>

Let <span>&#92;(&#92;lambda&#92;)</span> be an eigenvalue of <span>&#92;(A_u&#92;)</span> and let <span>&#92;(v^T&#92;)</span> be the corresponding left eigenvector, so <span>&#92;(v^T A_u = &#92;lambda v^T&#92;)</span>. Then

<span>&#92;[&#92;begin{bmatrix} 0 &amp; v^T &#92;end{bmatrix} &#92;begin{bmatrix} PAP^{-1} - &#92;lambda I &amp; PB &#92;end{bmatrix} = &#92;begin{bmatrix} 0 &amp; v^T &#92;end{bmatrix} &#92;begin{bmatrix} A_c - &#92;lambda I_{n_1} &amp; A_{12} &amp; B_c &#92;&#92; 0 &amp; A_u - &#92;lambda I_{n-n_1} &amp; 0 &#92;end{bmatrix} = &#92;begin{bmatrix} 0 &amp; v^T A_u - &#92;lambda v^T &amp; 0 &#92;end{bmatrix} = 0.&#92;]</span>

Setting <span>&#92;(w = [0&#92; v^T] P&#92;)</span>, we have <span>&#92;(w &#92;neq 0&#92;)</span> and

<span>&#92;[w [A - &#92;lambda I &#92;quad B] = &#92;begin{bmatrix} 0 &amp; v^T &#92;end{bmatrix} P [A - &#92;lambda I &#92;quad B] = &#92;begin{bmatrix} 0 &amp; v^T &#92;end{bmatrix} [PAP^{-1} - &#92;lambda I &#92;quad PB] P_{&#92;mathrm{aug}} = 0,&#92;]</span>

where the last step uses the block calculation above (right-multiplying <span>&#92;([PAP^{-1} - &#92;lambda I&#92;quad PB]&#92;)</span> by <span>&#92;(P&#92;)</span> in the state part). Hence <span>&#92;(&#92;mathrm{rank}[A - &#92;lambda I&#92; &#92; B] < n&#92;)</span>. The proof is complete. <span>&#92;(&#92;square&#92;)</span>

The PBH test has an elegant interpretation: the system <span>&#92;((A,B)&#92;)</span> is uncontrollable if and only if there exists a left eigenvector of <span>&#92;(A&#92;)</span> that is orthogonal to the range of <span>&#92;(B&#92;)</span>. In other words, if the input cannot excite some eigendirection of the dynamics, that mode is forever inaccessible to control.
## Week 3: Observability and Transfer Functions

### Lecture 5: Observability

The preceding lectures established the theory of controllability, which concerns whether a system's state can be driven to any desired value by choosing an appropriate input. The complementary concept, **observability**, addresses the dual question: can the internal state of the system be reconstructed from external measurements? This is of central practical importance, since the state <span>&#92;( x(t) &#92;)</span> is often not directly accessible to measurement; only the output <span>&#92;( y(t) &#92;)</span> is observed.

Consider the LTI system <span>&#92;( (A, B, C, D) &#92;)</span>, that is,

<span>&#92;[&#92;begin{aligned}
x'(t) &= Ax(t) + Bu(t) &#92;&#92;
y(t) &= Cx(t) + Du(t),
&#92;end{aligned}&#92;]</span>

where <span>&#92;( x(t) \in &#92;mathbb{R}^n &#92;)</span>, <span>&#92;( u(t) \in &#92;mathbb{R}^k &#92;)</span>, and <span>&#92;( y(t) \in &#92;mathbb{R}^m &#92;)</span>.

**Definition 5.1 (Observability).** The LTI system is said to be **observable** if, for any <span>&#92;( t_1 > 0 &#92;)</span>, one can uniquely determine <span>&#92;( x(0) &#92;)</span> from the input <span>&#92;( u : [0, t_1] \to &#92;mathbb{R}^k &#92;)</span> and the output <span>&#92;( y : [0, t_1] \to &#92;mathbb{R}^m &#92;)</span>.

To understand what this definition entails, recall the variation-of-constants formula for the output:

<span>&#92;[ y(t) = Ce^{At}x(0) + \int_0^t Ce^{A(t-\tau)}Bu(\tau)\,d\tau + Du(t). &#92;]</span>

Rearranging, we isolate the term involving the unknown initial condition:

<span>&#92;[ Ce^{At}x(0) = y(t) - \int_0^t Ce^{A(t-\tau)}Bu(\tau)\,d\tau - Du(t). &#92;]</span>

The right-hand side is a known signal whenever <span>&#92;( u(\cdot) &#92;)</span> and <span>&#92;( y(\cdot) &#92;)</span> are known. Hence the observability problem reduces to determining <span>&#92;( x(0) &#92;)</span> from the signal <span>&#92;( Ce^{At}x(0) &#92;)</span> on the interval <span>&#92;( [0, t_1] &#92;)</span>. This is entirely equivalent to observability of the autonomous system

<span>&#92;[&#92;begin{aligned}
x'(t) &= Ax(t) &#92;&#92;
y(t) &= Cx(t),
&#92;end{aligned}&#92;]</span>

and therefore observability of <span>&#92;( (A, B, C, D) &#92;)</span> depends only on the pair <span>&#92;( (A, C) &#92;)</span>. We accordingly say that **the pair <span>&#92;( (A, C) &#92;)</span> is observable**.

#### The Observability Gramian

The first characterization of observability uses an integral criterion analogous to the controllability Gramian.

**Theorem 5.2.** The pair <span>&#92;( (A, C) &#92;)</span> is observable if and only if the **observability Gramian**

<span>&#92;[ W_o(t) = \int_0^t e^{A^T\tau} C^T C e^{A\tau}\,d\tau &#92;]</span>

is positive definite for all <span>&#92;( t > 0 &#92;)</span>.

*Proof.* We first prove the sufficiency direction. Suppose <span>&#92;( W_o(t) &#92;)</span> is positive definite for all <span>&#92;( t > 0 &#92;)</span>. Left-multiplying both sides of <span>&#92;( Ce^{A\tau}x(0) = y(\tau) &#92;)</span> by <span>&#92;( e^{A^T\tau}C^T &#92;)</span> and integrating over <span>&#92;( [0, t] &#92;)</span> gives

<span>&#92;[ \int_0^t e^{A^T\tau}C^T C e^{A\tau}x(0)\,d\tau = \int_0^t e^{A^T\tau}C^T y(\tau)\,d\tau, &#92;]</span>

that is,

<span>&#92;[ W_o(t)\,x(0) = \int_0^t e^{A^T\tau}C^T y(\tau)\,d\tau. &#92;]</span>

Since <span>&#92;( W_o(t) &#92;)</span> is positive definite (hence invertible), we can uniquely recover the initial condition as

<span>&#92;[ x(0) = W_o^{-1}(t)\int_0^t e^{A^T\tau}C^T y(\tau)\,d\tau. &#92;]</span>

This establishes observability.

For the necessity direction, suppose that <span>&#92;( W_o(t_1) &#92;)</span> is not positive definite for some <span>&#92;( t_1 > 0 &#92;)</span>. Then there exists a nonzero vector <span>&#92;( v \neq 0 &#92;)</span> such that <span>&#92;( v^T W_o(t_1)v = 0 &#92;)</span>, which implies

<span>&#92;[ \int_0^{t_1} v^T e^{A^T\tau}C^T C e^{A\tau}v\,d\tau = \int_0^{t_1} \|Ce^{A\tau}v\|^2\,d\tau = 0. &#92;]</span>

It follows that <span>&#92;( Ce^{At}v = 0 &#92;)</span> for all <span>&#92;( t \in [0, t_1] &#92;)</span>. Now consider two initial conditions <span>&#92;( x(0) = 0 &#92;)</span> and <span>&#92;( x(0) = v &#92;)</span>. Both produce the identical output <span>&#92;( y(t) = Ce^{At}x(0) = 0 &#92;)</span> for <span>&#92;( t \in [0, t_1] &#92;)</span>. Since two distinct initial conditions produce indistinguishable outputs, <span>&#92;( x(0) &#92;)</span> cannot be uniquely determined and the pair <span>&#92;( (A,C) &#92;)</span> is not observable. <span>&#92;( \square &#92;)</span>

The observability Gramian is structurally parallel to the controllability Gramian

<span>&#92;[ W_c(t) = \int_0^t e^{A\tau}BB^T e^{A^T\tau}\,d\tau, &#92;]</span>

and the analogy between the two runs deeper than mere structural resemblance, as the next theorem reveals.

#### Duality of Observability and Controllability

**Theorem 5.3 (Duality).** The pair <span>&#92;( (A, C) &#92;)</span> is observable if and only if the pair <span>&#92;( (A^T, C^T) &#92;)</span> is controllable.

*Proof.* By Theorem 5.2, <span>&#92;( (A, C) &#92;)</span> is observable if and only if

<span>&#92;[ \int_0^t e^{A^T\tau}C^T C e^{A\tau}\,d\tau &#92;]</span>

is positive definite for all <span>&#92;( t > 0 &#92;)</span>. Comparing with the controllability Gramian applied to the pair <span>&#92;( (A^T, C^T) &#92;)</span>, namely

<span>&#92;[ \int_0^t e^{A^T\tau}(C^T)(C^T)^T e^{(A^T)^T\tau}\,d\tau = \int_0^t e^{A^T\tau}C^T C e^{A\tau}\,d\tau, &#92;]</span>

the condition for observability of <span>&#92;( (A, C) &#92;)</span> is exactly the condition for controllability of <span>&#92;( (A^T, C^T) &#92;)</span>. <span>&#92;( \square &#92;)</span>

This elegant duality allows the rich theory of controllability to be immediately translated into results about observability, simply by transposing the relevant matrices.

#### Equivalent Conditions for Observability

**Theorem 5.4 (Observability — equivalent conditions).** The following statements are equivalent:

1. The pair <span>&#92;( (A, C) &#92;)</span> is observable.

2. The observability Gramian <span>&#92;( W_o(t) = \int_0^t e^{A^T\tau}C^T Ce^{A\tau}\,d\tau &#92;)</span> is positive definite for all <span>&#92;( t > 0 &#92;)</span>.

3. **(Kalman's rank condition)** The **observability matrix**

<span>&#92;[ &#92;mathcal{O}(A, C) = &#92;begin{bmatrix} C &#92;&#92; CA &#92;&#92; CA^2 &#92;&#92; &#92;vdots &#92;&#92; CA^{n-1} &#92;end{bmatrix} &#92;]</span>

has rank <span>&#92;( n &#92;)</span>, i.e., full column rank.

4. **(PBH test)** The matrix

<span>&#92;[ &#92;begin{bmatrix} A - &#92;lambda I &#92;&#92; C &#92;end{bmatrix} &#92;]</span>

has rank <span>&#92;( n &#92;)</span> for every <span>&#92;( &#92;lambda \in &#92;mathbb{C} &#92;)</span>.

The proof of the equivalences follows by duality from the analogous controllability theorem: applying the controllability rank and PBH conditions to the transposed pair <span>&#92;( (A^T, C^T) &#92;)</span> and translating back yields conditions (3) and (4) above.

**Example 5.5.** Consider

<span>&#92;[ A = &#92;begin{bmatrix} 1 & 0 & 0 &#92;&#92; 0 & 0 & 0 &#92;&#92; 0 & 0 & -1 &#92;end{bmatrix}, \quad C = [c_1 \; c_2 \; c_3]. &#92;]</span>

We ask: for which values of <span>&#92;( c_1, c_2, c_3 &#92;)</span> is <span>&#92;( (A, C) &#92;)</span> observable? The observability matrix is

<span>&#92;[ &#92;mathcal{O}(A, C) = &#92;begin{bmatrix} C &#92;&#92; CA &#92;&#92; CA^2 &#92;end{bmatrix} = &#92;begin{bmatrix} c_1 & c_2 & c_3 &#92;&#92; c_1 & 0 & -c_3 &#92;&#92; c_1 & 0 & c_3 &#92;end{bmatrix}. &#92;]</span>

For this <span>&#92;( 3 \times 3 &#92;)</span> matrix to have rank 3, its determinant must be nonzero. Expanding along the second column gives

<span>&#92;[ \det(&#92;mathcal{O}(A,C)) = -c_2 \det&#92;begin{bmatrix} c_1 & -c_3 &#92;&#92; c_1 & c_3 &#92;end{bmatrix} = -c_2(2c_1 c_3) = -2c_1 c_2 c_3. &#92;]</span>

Hence <span>&#92;( (A, C) &#92;)</span> is observable if and only if <span>&#92;( c_1 c_2 c_3 \neq 0 &#92;)</span>; in other words, all three output coefficients must be nonzero.

#### Observable Decomposition

The duality between observability and controllability also produces an analog to the controllable decomposition. Suppose that <span>&#92;( (A, C) &#92;)</span> is not observable, so that the observability matrix

<span>&#92;[ &#92;mathcal{O}(A, C) = &#92;begin{bmatrix} C &#92;&#92; CA &#92;&#92; &#92;vdots &#92;&#92; CA^{n-1} &#92;end{bmatrix} &#92;]</span>

has rank <span>&#92;( n_1 < n &#92;)</span>. Let <span>&#92;( v_1, \ldots, v_{n_1} &#92;)</span> be <span>&#92;( n_1 &#92;)</span> linearly independent rows of <span>&#92;( \mathcal{O}(A, C) &#92;)</span> and choose additional vectors <span>&#92;( v_{n_1+1}, \ldots, v_n &#92;)</span> so that the matrix

<span>&#92;[ P = &#92;begin{bmatrix} v_1 &#92;&#92; v_2 &#92;&#92; &#92;vdots &#92;&#92; v_n &#92;end{bmatrix} &#92;]</span>

is invertible. Under the state transformation <span>&#92;( z = Px &#92;)</span>, the LTI system <span>&#92;( (A, B, C, D) &#92;)</span> becomes

<span>&#92;[&#92;begin{aligned}
z'(t) &= PAP^{-1}z(t) + PBu(t) &#92;&#92;
y(t) &= CP^{-1}z(t) + Du(t),
&#92;end{aligned}\tag{5.1}&#92;]</span>

where the transformed system matrix has the block structure

<span>&#92;[ PAP^{-1} = &#92;begin{pmatrix} A_o & 0 &#92;&#92; A_{21} & A_u &#92;end{pmatrix} \tag{5.2} &#92;]</span>

with the blocks partitioned according to dimensions <span>&#92;( n_1 &#92;)</span> and <span>&#92;( n - n_1 &#92;)</span>, and the transformed output matrix takes the form

<span>&#92;[ CP^{-1} = (C_o \;\; 0). \tag{5.3} &#92;]</span>

The pair <span>&#92;( (A_o, C_o) &#92;)</span> is called the **observable part** of the system. By duality, <span>&#92;( (A_o, C_o) &#92;)</span> is indeed observable whenever <span>&#92;( n_1 > 0 &#92;)</span>. The crucial structural feature is that the unobservable states (those corresponding to the zero block in <span>&#92;( CP^{-1} &#92;)</span>) do not appear in the output at all; no measurement can reveal their values.

**Example 5.6.** Consider

<span>&#92;[ A = &#92;begin{bmatrix} 1 & 0 & 0 &#92;&#92; 0 & 0 & 0 &#92;&#92; 0 & 0 & -1 &#92;end{bmatrix}, \quad C = [1 \; 0 \; 1]. &#92;]</span>

The observability matrix is

<span>&#92;[ &#92;mathcal{O}(A, C) = &#92;begin{bmatrix} 1 & 0 & 1 &#92;&#92; 1 & 0 & -1 &#92;&#92; 1 & 0 & 1 &#92;end{bmatrix}, &#92;]</span>

which has rank 2 (since row 3 equals row 1). We choose <span>&#92;( v_1 = [1\;0\;1] &#92;)</span>, <span>&#92;( v_2 = [1\;0\;-1] &#92;)</span> (two linearly independent rows) and augment with <span>&#92;( v_3 = [0\;1\;0] &#92;)</span> to obtain the invertible matrix

<span>&#92;[ P = &#92;begin{bmatrix} 1 & 0 & 1 &#92;&#92; 1 & 0 & -1 &#92;&#92; 0 & 1 & 0 &#92;end{bmatrix}, \quad P^{-1} = &#92;begin{bmatrix} \tfrac{1}{2} & \tfrac{1}{2} & 0 &#92;&#92; 0 & 0 & 1 &#92;&#92; \tfrac{1}{2} & -\tfrac{1}{2} & 0 &#92;end{bmatrix}. &#92;]</span>

Computing the transformed matrices gives

<span>&#92;[ PAP^{-1} = &#92;begin{bmatrix} 0 & 1 & 0 &#92;&#92; 1 & 0 & 0 &#92;&#92; 0 & 0 & 0 &#92;end{bmatrix}, \qquad CP^{-1} = [1\;0\;0]. &#92;]</span>

The observable part is therefore

<span>&#92;[ (A_o, C_o) = &#92;left(&#92;begin{bmatrix} 0 & 1 &#92;&#92; 1 & 0 &#92;end{bmatrix},\; [1\;0]&#92;right). &#92;]</span>

One can verify directly that this two-dimensional pair is observable.

---

### Lecture 6: Transfer Functions

The preceding lectures developed state-space methods for analyzing LTI systems, working entirely in the time domain. A complementary approach operates in the **frequency domain**, representing signals and systems in terms of their frequency content rather than their time-domain trajectories. The central tool for frequency-domain analysis is the **transfer function**, which we develop rigorously via the Laplace transform.

#### Laplace Transforms

Consider a signal <span>&#92;( x : [0, \infty) \to &#92;mathbb{R}^n &#92;)</span>. The **Laplace transform** of <span>&#92;( x &#92;)</span> is defined by

<span>&#92;[ \hat{x}(s) = &#92;mathcal{L}[x(t)] = \int_0^\infty x(t)e^{-st}\,dt, &#92;]</span>

where <span>&#92;( s &#92;)</span> is a complex variable. The Laplace transform thus maps a time-domain signal to a function of the complex variable <span>&#92;( s &#92;)</span>. Several standard pairs are frequently used:

<span>&#92;[&#92;begin{aligned}
&#92;mathcal{L}[t^k] &= &#92;frac{k!}{s^{k+1}}, \quad k = 0, 1, 2, &#92;ldots &#92;&#92;
&#92;mathcal{L}[e^{at}] &= &#92;frac{1}{s-a} &#92;&#92;
&#92;mathcal{L}[&#92;sin(&#92;omega t)] &= &#92;frac{&#92;omega}{s^2 + &#92;omega^2} &#92;&#92;
&#92;mathcal{L}[&#92;cos(&#92;omega t)] &= &#92;frac{s}{s^2 + &#92;omega^2}.
&#92;end{aligned}&#92;]</span>

The transform of derivatives, which is the key property for analyzing differential equations, is given by

<span>&#92;[&#92;begin{aligned}
&#92;mathcal{L}[x'(t)] &= s\hat{x}(s) - x(0) &#92;&#92;
&#92;mathcal{L}[x''(t)] &= s^2\hat{x}(s) - s\,x(0) - x'(0).
&#92;end{aligned}&#92;]</span>

The appearance of the initial condition <span>&#92;( x(0) &#92;)</span> in the first formula is crucial: it separates the effects of the initial state from the effects of the input signal.

#### Laplace Transform of the LTI System

Consider the LTI system <span>&#92;( (A, B, C, D) &#92;)</span>:

<span>&#92;[&#92;begin{aligned}
x'(t) &= Ax(t) + Bu(t) &#92;&#92;
y(t) &= Cx(t) + Du(t).
&#92;end{aligned}&#92;]</span>

Taking the Laplace transform of both equations and applying the derivative rule yields

<span>&#92;[&#92;begin{aligned}
s\hat{x}(s) - x(0) &= A\hat{x}(s) + B\hat{u}(s) &#92;&#92;
\hat{y}(s) &= C\hat{x}(s) + D\hat{u}(s).
&#92;end{aligned}&#92;]</span>

Solving the first equation for <span>&#92;( \hat{x}(s) &#92;)</span> gives

<span>&#92;[ \hat{x}(s) = (sI - A)^{-1}x(0) + (sI - A)^{-1}B\hat{u}(s). &#92;]</span>

Substituting into the output equation:

<span>&#92;[ \hat{y}(s) = \underbrace{C(sI-A)^{-1}x(0)}_{\text{zero-input response}} + \underbrace{[C(sI-A)^{-1}B + D]\hat{u}(s)}_{\text{zero-state response}}. &#92;]</span>

The **zero-state response** captures the input-output relationship when the system starts from rest. Setting <span>&#92;( x(0) = 0 &#92;)</span> gives

<span>&#92;[ \hat{y}(s) = \underbrace{[C(sI - A)^{-1}B + D]}_{\text{transfer function}}\hat{u}(s). &#92;]</span>

#### Transfer Functions

**Definition 6.7 (Transfer function).** The **transfer function** (matrix) of the LTI system <span>&#92;( (A, B, C, D) &#92;)</span> is defined by

<span>&#92;[ G(s) = C(sI - A)^{-1}B + D. &#92;]</span>

Using this notation, the zero-state input-output relation in the Laplace domain is simply

<span>&#92;[ \hat{y}(s) = G(s)\hat{u}(s). &#92;]</span>

To compute <span>&#92;( G(s) &#92;)</span> explicitly, one applies Cramer's rule for matrix inversion:

<span>&#92;[ G(s) = C\,\frac{\text{adj}(sI - A)}{\det(sI - A)}\,B + D, &#92;]</span>

where <span>&#92;( \text{adj}(\cdot) &#92;)</span> denotes the adjugate matrix. Since <span>&#92;( \det(sI - A) &#92;)</span> is a polynomial in <span>&#92;( s &#92;)</span> and each entry of <span>&#92;( \text{adj}(sI - A) &#92;)</span> is also a polynomial in <span>&#92;( s &#92;)</span>, every entry of <span>&#92;( G(s) &#92;)</span> is a rational function of <span>&#92;( s &#92;)</span>.

**Example 6.8.** Consider the system

<span>&#92;[ x' = &#92;begin{bmatrix} 0 & 1 &#92;&#92; 1 & 0 &#92;end{bmatrix}x + &#92;begin{bmatrix} 0 &#92;&#92; 1 &#92;end{bmatrix}u, \qquad y = [1 \; 0]x. &#92;]</span>

Computing <span>&#92;( (sI - A)^{-1} &#92;)</span>:

<span>&#92;[ G(s) = [1\;0]\begin{bmatrix} s & -1 &#92;&#92; -1 & s &#92;end{bmatrix}^{-1}\begin{bmatrix} 0 &#92;&#92; 1 &#92;end{bmatrix} = [1\;0]\,\frac{1}{s^2-1}\begin{bmatrix} s & 1 &#92;&#92; 1 & s &#92;end{bmatrix}\begin{bmatrix} 0 &#92;&#92; 1 &#92;end{bmatrix} = \frac{1}{s^2 - 1}. &#92;]</span>

**Example 6.9.** Consider the <span>&#92;( n &#92;)</span>th-order scalar differential equation

<span>&#92;[ x^{(n)}(t) + b_{n-1}x^{(n-1)}(t) + \cdots + b_0 x(t) = u(t), &#92;]</span>

with output

<span>&#92;[ y(t) = a_0 x(t) + a_1 x'(t) + \cdots + a_{n-1}x^{(n-1)}(t). &#92;]</span>

Taking the Laplace transform with zero initial conditions gives <span>&#92;( (s^n + b_{n-1}s^{n-1} + \cdots + b_0)\hat{x}(s) = \hat{u}(s) &#92;)</span>, and consequently

<span>&#92;[ \hat{y}(s) = (a_0 + a_1 s + \cdots + a_{n-1}s^{n-1})\hat{x}(s) = \frac{a_{n-1}s^{n-1} + \cdots + a_1 s + a_0}{s^n + b_{n-1}s^{n-1} + \cdots + b_0}\,\hat{u}(s). &#92;]</span>

Hence the transfer function of this higher-order scalar system is

<span>&#92;[ G(s) = \frac{a_{n-1}s^{n-1} + \cdots + a_1 s + a_0}{s^n + b_{n-1}s^{n-1} + \cdots + b_0}. &#92;]</span>

This example shows explicitly that the transfer function of a scalar system described by a linear ODE with constant coefficients is a rational function whose denominator degree equals the order of the equation.

#### Impulse Response

The Laplace transform connects elegantly to a time-domain representation of the input-output map. Taking the inverse Laplace transform of <span>&#92;( \hat{y}(s) = G(s)\hat{u}(s) &#92;)</span> gives

<span>&#92;[ y(t) = (g * u)(t), &#92;]</span>

where <span>&#92;( g(t) = &#92;mathcal{L}^{-1}[G(s)] &#92;)</span> and <span>&#92;( * &#92;)</span> denotes convolution. The function <span>&#92;( g(t) &#92;)</span> is the **impulse response** of the system.

To understand its physical meaning, consider the approximate impulse given by the pulse

<span>&#92;[ P_\varepsilon(t) = &#92;begin{cases} 0 & t < 0 &#92;&#92; \tfrac{1}{\varepsilon} & 0 \leq t < \varepsilon &#92;&#92; 0 & t \geq \varepsilon, &#92;end{cases} &#92;]</span>

which has duration <span>&#92;( \varepsilon &#92;)</span>, amplitude <span>&#92;( 1/\varepsilon &#92;)</span>, and unit area. The **Dirac delta function** <span>&#92;( \delta(t) &#92;)</span> is defined as the limiting distribution <span>&#92;( \delta(t) = \lim_{\varepsilon \to 0} P_\varepsilon(t) &#92;)</span>, a generalized function of zero duration, infinite amplitude, and unit area.

**Definition 6.10 (Impulse response).** The **impulse response** <span>&#92;( g(t) &#92;)</span> of the system <span>&#92;( (A, B, C, D) &#92;)</span> is the output corresponding to an impulse input with zero initial condition:

<span>&#92;[ g(t) = C\int_0^t e^{A(t-\tau)}B\,\delta(\tau)\,d\tau + D\delta(t) = Ce^{At}B + D\delta(t). &#92;]</span>

The general output can then be interpreted as a superposition of impulse responses scaled by the input values:

<span>&#92;[&#92;begin{aligned}
y(t) &= C\int_0^t e^{A(t-\tau)}Bu(\tau)\,d\tau + Du(t) &#92;&#92;
&= \int_0^t g(t-\tau)u(\tau)\,d\tau &#92;&#92;
&= (g * u)(t).
&#92;end{aligned}&#92;]</span>

Since <span>&#92;( \hat{y}(s) = G(s)\hat{u}(s) &#92;)</span>, it follows that <span>&#92;( \mathcal{L}[g(t)] = G(s) &#92;)</span>: the transfer function is precisely the Laplace transform of the impulse response.

#### Realizations of Transfer Functions

We have seen how to compute <span>&#92;( G(s) &#92;)</span> from a state-space model <span>&#92;( (A, B, C, D) &#92;)</span>. The converse question — finding a state-space model for a prescribed transfer function — is equally important.

**Definition 6.11 (Realization).** An LTI system <span>&#92;( (A, B, C, D) &#92;)</span> is said to be a **realization** of a transfer function <span>&#92;( G(s) &#92;)</span> if

<span>&#92;[ C(sI - A)^{-1}B + D = G(s). &#92;]</span>

**Example 6.12 (Realizability of proper transfer functions).** From Example 6.9, the nth-order system

<span>&#92;[ x^{(n)}(t) + b_{n-1}x^{(n-1)}(t) + \cdots + b_0 x(t) = u(t), \quad y(t) = a_0 x(t) + a_1 x'(t) + \cdots + a_{n-1}x^{(n-1)}(t) &#92;]</span>

is a realization of

<span>&#92;[ G(s) = \frac{a_{n-1}s^{n-1} + \cdots + a_1 s + a_0}{s^n + b_{n-1}s^{n-1} + \cdots + b_0}. &#92;]</span>

A natural question is whether the realization of a given transfer function is unique. One immediate source of non-uniqueness is a state transformation: any invertible change of coordinates in state space preserves the transfer function.

**Proposition 6.13 (Invariance under state transformation).** If <span>&#92;( (A, B, C, D) &#92;)</span> is a realization of <span>&#92;( G(s) &#92;)</span>, then so is <span>&#92;( (PAP^{-1}, PB, CP^{-1}, D) &#92;)</span> for any invertible matrix <span>&#92;( P &#92;)</span>.

*Proof.* The result follows directly from the computation

<span>&#92;[ (CP^{-1})(sI - PAP^{-1})^{-1}(PB) + D = CP^{-1}(P(sI-A)P^{-1})^{-1}PB + D = C(sI-A)^{-1}B + D = G(s). \quad &#92;square &#92;]</span>

In other words, transfer functions are invariant under state transformation. The question of whether realization is unique modulo state transformation — that is, whether every two realizations of the same transfer function are related by an invertible state transformation — leads naturally to the concept of minimality developed in the next lecture.

---

## Week 4: Realizations and Frequency Response

### Lecture 7: Realizations of Transfer Functions

In the previous lecture we introduced the notion of a realization and observed that any proper rational function arises as the transfer function of some LTI system. This lecture develops that idea systematically. We characterize precisely which transfer functions are realizable, explain a canonical construction that produces a realization from any proper rational function, and then address the fundamental question of uniqueness: when are two realizations related by a state transformation?

#### Proper Rational Functions and Realizability

**Definition 7.1.** A **rational function** is a ratio of two polynomials, <span>&#92;( r(s) = p(s)/q(s) &#92;)</span>. It is called **strictly proper** if <span>&#92;( \deg(p) < \deg(q) &#92;)</span>, and **proper** if <span>&#92;( \deg(p) \leq \deg(q) &#92;)</span>. A rational function matrix is (strictly) proper if every entry is (strictly) proper.

**Theorem 7.2 (Realizability).** A transfer function <span>&#92;( G(s) &#92;)</span> is realizable (i.e., it is the transfer function of some LTI system) if and only if <span>&#92;( G(s) &#92;)</span> is proper.

*Proof.* We first show necessity. If <span>&#92;( G(s) = C(sI-A)^{-1}B + D &#92;)</span>, then

<span>&#92;[ G(s) = C\,\frac{\text{adj}(sI - A)}{\det(sI - A)}\,B + D. &#92;]</span>

Since each entry of <span>&#92;( \text{adj}(sI - A) &#92;)</span> is a polynomial of degree at most <span>&#92;( n-1 &#92;)</span> while <span>&#92;( \det(sI - A) &#92;)</span> is a polynomial of degree <span>&#92;( n &#92;)</span>, the term <span>&#92;( C(sI-A)^{-1}B &#92;)</span> is strictly proper, and hence <span>&#92;( G(s) &#92;)</span> is proper.

For sufficiency, we construct realizations explicitly. Every proper <span>&#92;( G(s) &#92;)</span> can be decomposed as <span>&#92;( G(s) = G_{sp}(s) + D &#92;)</span>, where <span>&#92;( \lim_{s \to \infty} G(s) = D &#92;)</span> and <span>&#92;( G_{sp}(s) &#92;)</span> is strictly proper.

**SISO case.** A general proper SISO transfer function takes the form

<span>&#92;[ G(s) = \frac{a_{n-1}s^{n-1} + a_{n-2}s^{n-2} + \cdots + a_0}{s^n + b_{n-1}s^{n-1} + \cdots + b_1 s + b_0} + D. &#92;]</span>

One verifies directly that the nth-order system

<span>&#92;[&#92;begin{cases} x^{(n)}(t) + b_{n-1}x^{(n-1)}(t) + b_{n-2}x^{(n-2)}(t) + \cdots + b_0 x(t) = u(t) &#92;&#92; y(t) = a_0 x(t) + a_1 x'(t) + \cdots + a_{n-1}x^{(n-1)}(t) + Du(t) &#92;end{cases}&#92;]</span>

realizes <span>&#92;( G(s) &#92;)</span>. Writing this as a first-order system with state vector <span>&#92;( x = [x', x'', \ldots, x^{(n-1)}]^T &#92;)</span> yields the **companion form** matrices:

<span>&#92;[ A = &#92;begin{bmatrix} 0 & 1 & 0 & \cdots & 0 &#92;&#92; 0 & 0 & 1 & \cdots & 0 &#92;&#92; &#92;vdots & &#92;vdots & &#92;vdots & &#92;ddots & &#92;vdots &#92;&#92; 0 & 0 & 0 & \cdots & 1 &#92;&#92; -b_0 & -b_1 & -b_2 & \cdots & -b_{n-1} &#92;end{bmatrix}, \quad B = &#92;begin{bmatrix} 0 &#92;&#92; 0 &#92;&#92; &#92;vdots &#92;&#92; 0 &#92;&#92; 1 &#92;end{bmatrix}, \quad C = [a_0 \; a_1 \; \cdots \; a_{n-1}]. &#92;]</span>

**MIMO case.** A general proper MIMO transfer function of dimension <span>&#92;( m \times k &#92;)</span> can be written as <span>&#92;( G(s) = G_{sp}(s) + D &#92;)</span>, where

<span>&#92;[ G_{sp}(s) = \frac{A_{r-1}s^{r-1} + A_{r-2}s^{r-2} + \cdots + A_1 s + A_0}{s^r + b_{r-1}s^{r-1} + \cdots + b_1 s + b_0} &#92;]</span>

with scalar coefficients <span>&#92;( b_0, \ldots, b_{r-1} &#92;)</span> and <span>&#92;( m \times k &#92;)</span> matrix coefficients <span>&#92;( A_0, \ldots, A_{r-1} &#92;)</span>. A realization <span>&#92;( (A, B, C, D) &#92;)</span> is given by the block companion form

<span>&#92;[ A = &#92;begin{bmatrix} 0 & I & 0 & \cdots & 0 &#92;&#92; 0 & 0 & I & \cdots & 0 &#92;&#92; &#92;vdots & &#92;vdots & &#92;vdots & &#92;ddots & &#92;vdots &#92;&#92; 0 & 0 & 0 & \cdots & I &#92;&#92; -b_0 I & -b_1 I & -b_2 I & \cdots & -b_{r-1}I &#92;end{bmatrix}, \quad B = &#92;begin{bmatrix} 0 &#92;&#92; 0 &#92;&#92; &#92;vdots &#92;&#92; 0 &#92;&#92; I &#92;end{bmatrix}, \quad C = [A_0 \; A_1 \; \cdots \; A_{r-1}], &#92;]</span>

where <span>&#92;( 0 &#92;)</span> and <span>&#92;( I &#92;)</span> are <span>&#92;( k \times k &#92;)</span> matrices, <span>&#92;( A &#92;)</span> is <span>&#92;( rk \times rk &#92;)</span>, <span>&#92;( B &#92;)</span> is <span>&#92;( rk \times k &#92;)</span>, and <span>&#92;( C &#92;)</span> is <span>&#92;( m \times rk &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Remark 7.3.** The realizations constructed in the proof above are called **controllable canonical realizations**. It can be verified that they are indeed controllable.

**Remark 7.4.** Since any proper transfer function decomposes as <span>&#92;( G(s) = G_{sp}(s) + D &#92;)</span>, we have

<span>&#92;[ \lim_{s \to \infty} G(s) = \lim_{s \to \infty} G_{sp}(s) + D = D. &#92;]</span>

This gives a direct method to read off the <span>&#92;( D &#92;)</span> matrix: it is the limit of the transfer function as <span>&#92;( s \to \infty &#92;)</span>.

**Example 7.5.** Consider the strictly proper SISO transfer function

<span>&#92;[ G(s) = \frac{s}{s^2 + s + 1}. &#92;]</span>

Here <span>&#92;( D = \lim_{s \to \infty} G(s) = 0 &#92;)</span>. The controllable canonical realization is

<span>&#92;[ A = &#92;begin{bmatrix} 0 & 1 &#92;&#92; -1 & -1 &#92;end{bmatrix}, \quad B = &#92;begin{bmatrix} 0 &#92;&#92; 1 &#92;end{bmatrix}, \quad C = [0 \; 1], \quad D = 0. &#92;]</span>

For the improper transfer function <span>&#92;( G(s) = (s+1)^2/(s^2 + s + 1) = s/(s^2+s+1) + 1 &#92;)</span>, we extract <span>&#92;( D = 1 &#92;)</span> and use the same state matrices with <span>&#92;( D = 1 &#92;)</span>.

**Example 7.6.** Find a realization for the MIMO transfer function

<span>&#92;[ G(s) = &#92;begin{bmatrix} \dfrac{s}{s+1} &#92;&#92;[6pt] \dfrac{1}{s+2} &#92;end{bmatrix}. &#92;]</span>

We compute <span>&#92;( D = \lim_{s \to \infty} G(s) = [1, \; 0]^T &#92;)</span> and write the strictly proper part

<span>&#92;[ G_{sp}(s) = G(s) - D = &#92;begin{bmatrix} -\tfrac{1}{s+1} &#92;&#92;[4pt] \tfrac{1}{s+2} &#92;end{bmatrix} = \frac{1}{(s+1)(s+2)}&#92;begin{bmatrix} -(s+2) &#92;&#92; (s+1) &#92;end{bmatrix} = \frac{1}{s^2 + 3s + 2}\left(&#92;begin{bmatrix}-1 &#92;&#92; 1&#92;end{bmatrix}s + &#92;begin{bmatrix}-2 &#92;&#92; 1&#92;end{bmatrix}&#92;right). &#92;]</span>

Identifying <span>&#92;( b_1 = 3 &#92;)</span>, <span>&#92;( b_0 = 2 &#92;)</span>, <span>&#92;( A_1 = [-1, \; 1]^T &#92;)</span>, <span>&#92;( A_0 = [-2, \; 1]^T &#92;)</span>, the controllable canonical realization (with <span>&#92;( m=2 &#92;)</span>, <span>&#92;( k=1 &#92;)</span>) is

<span>&#92;[ A = &#92;begin{bmatrix} 0 & 1 &#92;&#92; -2 & -3 &#92;end{bmatrix}, \quad B = &#92;begin{bmatrix} 0 &#92;&#92; 1 &#92;end{bmatrix}, \quad C = &#92;begin{bmatrix} -2 & -1 &#92;&#92; 1 & 1 &#92;end{bmatrix}, \quad D = &#92;begin{bmatrix} 1 &#92;&#92; 0 &#92;end{bmatrix}. &#92;]</span>

**Example 7.7.** Consider

<span>&#92;[ G(s) = &#92;begin{bmatrix} \dfrac{-2}{s+1} & \dfrac{1}{s+1} &#92;end{bmatrix}. &#92;]</span>

Here <span>&#92;( D = \lim_{s \to \infty} G(s) = [2 \; 1] &#92;)</span> and the strictly proper part factors as

<span>&#92;[ G_{sp}(s) = G(s) - D = \frac{1}{s+1}[-2 \;\; 1]. &#92;]</span>

The controllable canonical realization is

<span>&#92;[ A = -I_{2\times 2} = &#92;begin{bmatrix} -1 & 0 &#92;&#92; 0 & -1 &#92;end{bmatrix}, \quad B = I_{2\times 2} = &#92;begin{bmatrix} 1 & 0 &#92;&#92; 0 & 1 &#92;end{bmatrix}, \quad C = [-2 \;\; 1], \quad D = [2 \;\; 1]. &#92;]</span>

#### Controllable and Observable Realizations

The controllable canonical realizations may not be the most compact realizations one can find. If a realization is not observable, one can apply observable decomposition to obtain a lower-dimensional system with the same transfer function.

**Theorem 7.8.** The controllable decomposition <span>&#92;( (A_c, B_c, C_c, D) &#92;)</span> and the observable decomposition <span>&#92;( (A_o, B_o, C_o, D) &#92;)</span> of an LTI system <span>&#92;( (A, B, C, D) &#92;)</span> have the same transfer function as <span>&#92;( (A, B, C, D) &#92;)</span>.

*Proof.* Recall that the controllable decomposition takes the form

<span>&#92;[ (P_1 AP_1^{-1},\, P_1 B,\, CP_1^{-1},\, D) = &#92;left(&#92;begin{bmatrix} A_c & A_{12} &#92;&#92; 0 & A_u &#92;end{bmatrix},\; &#92;begin{bmatrix} B_c &#92;&#92; 0 &#92;end{bmatrix},\; [C_c \;\; C_u],\; D&#92;right) &#92;]</span>

and the observable decomposition takes the form

<span>&#92;[ (P_2 AP_2^{-1},\, P_2 B,\, CP_2^{-1},\, D) = &#92;left(&#92;begin{bmatrix} A_o & 0 &#92;&#92; A_{21} & A_u &#92;end{bmatrix},\; &#92;begin{bmatrix} B_o &#92;&#92; B_u &#92;end{bmatrix},\; [C_o \;\; 0],\; D&#92;right). &#92;]</span>

For the controllable decomposition, the block-triangular structure of <span>&#92;( sI - P_1 AP_1^{-1} &#92;)</span> implies

<span>&#92;[ (sI - P_1 AP_1^{-1})^{-1} = &#92;begin{pmatrix} (sI - A_c)^{-1} & * &#92;&#92; 0 & (sI - A_u)^{-1} &#92;end{pmatrix}, &#92;]</span>

and multiplying out gives

<span>&#92;[ [C_c \;\; C_u](sI - P_1AP_1^{-1})^{-1}&#92;begin{bmatrix} B_c &#92;&#92; 0 &#92;end{bmatrix} + D = C_c(sI - A_c)^{-1}B_c + D = G(s). &#92;]</span>

The observable decomposition case is analogous. <span>&#92;( \square &#92;)</span>

By Theorem 7.8, if a system is not controllable or not observable, one can always find a lower-dimensional system realizing the same transfer function through decomposition. This process terminates when a realization that is simultaneously controllable and observable is found, motivating the central concept below.

#### Minimal Realization

**Definition 7.9 (Minimal realization).** A realization of <span>&#92;( G(s) &#92;)</span> is called **minimal** if no other realization of <span>&#92;( G(s) &#92;)</span> has smaller state dimension.

The following theorem is the cornerstone result on minimality: it characterizes minimal realizations by a simple structural property and establishes their uniqueness up to state transformation.

**Theorem 7.10.** Let <span>&#92;( G(s) &#92;)</span> be a transfer function. Then:

1. A realization of <span>&#92;( G(s) &#92;)</span> is minimal if and only if it is both controllable and observable.

2. If <span>&#92;( (A, B, C, D) &#92;)</span> and <span>&#92;( (A_1, B_1, C_1, D_1) &#92;)</span> are both minimal realizations of <span>&#92;( G(s) &#92;)</span>, then there exists a non-singular matrix <span>&#92;( P &#92;)</span> such that

<span>&#92;[ PAP^{-1} = A_1, \quad PB = B_1, \quad CP^{-1} = C_1, \quad D = D_1. &#92;]</span>

*Proof of part (1).* For the direction "minimal implies controllable and observable": suppose <span>&#92;( (A, B, C, D) &#92;)</span> is minimal but fails to be controllable or observable. By Theorem 7.8, we could then apply controllable or observable decomposition to obtain a strictly lower-dimensional realization of <span>&#92;( G(s) &#92;)</span>, contradicting minimality.

For the converse, suppose <span>&#92;( (A, B, C, D) &#92;)</span> is controllable and observable of order <span>&#92;( n &#92;)</span>, but is not minimal, so there exists another realization <span>&#92;( (A_1, B_1, C_1, D_1) &#92;)</span> of order <span>&#92;( n_1 < n &#92;)</span>. Let <span>&#92;( \mathcal{C} &#92;)</span> and <span>&#92;( \mathcal{O} &#92;)</span> be the controllability and observability matrices of <span>&#92;( (A, B, C, D) &#92;)</span>. Since <span>&#92;( \text{rank}\,\mathcal{O} = \text{rank}\,\mathcal{C} = n &#92;)</span>, one shows that <span>&#92;( \text{rank}(\mathcal{O}\mathcal{C}) = n &#92;)</span>.

The key tool is the following lemma.

**Lemma 7.11.** Two systems <span>&#92;( (A, B, C, D) &#92;)</span> and <span>&#92;( (A_1, B_1, C_1, D_1) &#92;)</span> share the transfer function <span>&#92;( G(s) &#92;)</span> if and only if <span>&#92;( D = D_1 &#92;)</span> and <span>&#92;( CA^i B = C_1 A_1^i B_1 &#92;)</span> for all <span>&#92;( i = 0, 1, 2, \ldots &#92;)</span>

*Proof of Lemma 7.11.* Using the matrix exponential series, the transfer function expands as

<span>&#92;[ G(s) = C(sI - A)^{-1}B + D = C\,\mathcal{L}[e^{At}]B + D = C\,\mathcal{L}&#92;left[&#92;\sum_{k=0}^\infty \frac{t^k A^k}{k!}&#92;\right]B + D = \sum_{k=0}^\infty CA^k B\,s^{-(k+1)} + D. &#92;]</span>

By uniqueness of the Laurent expansion in <span>&#92;( s^{-1} &#92;)</span>, two transfer functions are identical if and only if all coefficients match: <span>&#92;( D_1 = D &#92;)</span> and <span>&#92;( CA^k B = C_1 A_1^k B_1 &#92;)</span> for all <span>&#92;( k \geq 0 &#92;)</span>. <span>&#92;( \square &#92;)</span>

Returning to the proof of Theorem 7.10 part (1): by Lemma 7.11, <span>&#92;( \mathcal{O}\mathcal{C} = \mathcal{O}_1 \mathcal{C}_1 &#92;)</span>, so

<span>&#92;[ \text{rank}(\mathcal{O}\mathcal{C}) = \text{rank}(\mathcal{O}_1 \mathcal{C}_1) \leq \min(\text{rank}\,\mathcal{O}_1, \text{rank}\,\mathcal{C}_1) \leq n_1 < n, &#92;]</span>

contradicting <span>&#92;( \text{rank}(\mathcal{O}\mathcal{C}) = n &#92;)</span>. <span>&#92;( \square &#92;)</span>

*Proof of part (2).* From Lemma 7.11 and the condition that both systems realize <span>&#92;( G(s) &#92;)</span), we have <span>&#92;( \mathcal{O}\mathcal{C} = \mathcal{O}_1\mathcal{C}_1 &#92;)</span>. We use the following algebraic fact.

**Lemma 7.12.** A full column rank matrix <span>&#92;( M &#92;)</span> has a left inverse <span>&#92;( (M^T M)^{-1}M^T &#92;)</span>, and a full row rank matrix <span>&#92;( N &#92;)</span> has a right inverse <span>&#92;( N^T(NN^T)^{-1} &#92;)</span>.

Since <span>&#92;( \mathcal{C} &#92;)</span> has full row rank and <span>&#92;( \mathcal{O} &#92;)</span> has full column rank, we define

<span>&#92;[ P = \mathcal{C}_1\mathcal{C}^T(\mathcal{C}\mathcal{C}^T)^{-1}. &#92;]</span>

One can verify that <span>&#92;( P &#92;)</span> is non-singular, with inverse <span>&#92;( P^{-1} = (\mathcal{O}^T\mathcal{O})^{-1}\mathcal{O}^T\mathcal{O}_1 &#92;)</span>. Right-multiplying <span>&#92;( \mathcal{O}\mathcal{C} = \mathcal{O}_1\mathcal{C}_1 &#92;)</span> by the right inverse of <span>&#92;( \mathcal{C} &#92;)</span> gives

<span>&#92;[ \mathcal{O} = \mathcal{O}_1\mathcal{C}_1\mathcal{C}^T(\mathcal{C}\mathcal{C}^T)^{-1} = \mathcal{O}_1 P. \tag{7.1} &#92;]</span>

From the definition of the observability matrix, equation (7.1) implies <span>&#92;( C = C_1 P &#92;)</span>, i.e., <span>&#92;( CP^{-1} = C_1 &#92;)</span>. Left-multiplying (7.1) by the left inverse of <span>&#92;( \mathcal{O}_1 &#92;)</span> yields <span>&#92;( P = (\mathcal{O}_1^T\mathcal{O}_1)^{-1}\mathcal{O}_1^T\mathcal{O} &#92;)</span>, and using this together with <span>&#92;( \mathcal{O}\mathcal{C} = \mathcal{O}_1\mathcal{C}_1 &#92;)</span> gives <span>&#92;( P\mathcal{C} = \mathcal{C}_1 &#92;)</span>, hence <span>&#92;( PB = B_1 &#92;)</span>.

Finally, Lemma 7.11 gives <span>&#92;( \mathcal{O}A\mathcal{C} = \mathcal{O}_1 A_1 \mathcal{C}_1 &#92;)</span>. Left-multiplying by the left inverse of <span>&#92;( \mathcal{O}_1 &#92;)</span> and right-multiplying by the right inverse of <span>&#92;( \mathcal{C} &#92;)</span> produces <span>&#92;( PA = A_1 P &#92;)</span>, i.e., <span>&#92;( PAP^{-1} = A_1 &#92;)</span>. <span>&#92;( \square &#92;)</span>

In summary, the minimal realization is uniquely determined by the transfer function up to an invertible state transformation. To find a minimal realization in practice, one constructs any realization (e.g., controllable canonical), then applies controllable and observable decomposition to reduce the state dimension until the result is both controllable and observable.

**Example 7.13.** Find a minimal realization for

<span>&#92;[ G(s) = &#92;begin{bmatrix} \dfrac{-2}{s+1} & \dfrac{1}{s+1} &#92;end{bmatrix}. &#92;]</span>

We already found the controllable canonical realization (see Example 7.7):

<span>&#92;[ A = -I_{2\times 2}, \quad B = I_{2\times 2}, \quad C = [-2 \;\; 1], \quad D = [2 \;\; 1]. &#92;]</span>

One verifies that this realization is controllable. Computing the observability matrix:

<span>&#92;[ \mathcal{O}(A, C) = &#92;begin{bmatrix} C &#92;&#92; CA &#92;end{bmatrix} = &#92;begin{bmatrix} -2 & 1 &#92;&#92; 2 & -1 &#92;end{bmatrix}, &#92;]</span>

which has rank 1 since row 2 is <span>&#92;( -1 &#92;)</span> times row 1. The system is not observable, so we apply observable decomposition. Let

<span>&#92;[ P = &#92;begin{bmatrix} -2 & 1 &#92;&#92; 0 & 1 &#92;end{bmatrix}, \quad P^{-1} = &#92;begin{bmatrix} -\tfrac{1}{2} & \tfrac{1}{2} &#92;&#92; 0 & 1 &#92;end{bmatrix}. &#92;]</span>

Computing:

<span>&#92;[ PAP^{-1} = &#92;begin{bmatrix} -1 & 0 &#92;&#92; 0 & -1 &#92;end{bmatrix}, \quad PB = &#92;begin{bmatrix} -2 & 1 &#92;&#92; 0 & 1 &#92;end{bmatrix}, \quad CP^{-1} = [1 \;\; 0]. &#92;]</span>

The observable decomposition reveals that the observable part is

<span>&#92;[ A_o = -1, \quad B_o = [-2 \;\; 1], \quad C_o = 1, \quad D = [2 \;\; 1]. &#92;]</span>

This one-dimensional realization is both controllable and observable, hence minimal. One can verify directly that <span>&#92;( C_o(sI - A_o)^{-1}B_o + D = \frac{1}{s+1}[-2\;\;1] + [2\;\;1] = G(s) &#92;)</span>.

---

### Lecture 8: Frequency Response and Bode Plots

The **time response** of a control system describes how the output evolves in time for a given time-varying input. The **frequency response** is the complementary description: it characterizes how the steady-state output amplitude and phase depend on the frequency of a sinusoidal input. This frequency-domain perspective is indispensable for engineering analysis and design, because it provides an intuitive and graphically accessible summary of system behaviour across all frequencies simultaneously. We focus on SISO systems throughout.

#### Frequency Response

Consider an exponential input of the form

<span>&#92;[ u(t) = e^{st}, \quad s = \sigma + j\omega \in &#92;mathbb{C}. &#92;]</span>

Note that sinusoidal inputs are special cases; for instance, <span>&#92;( \cos(\omega t) = (e^{j\omega t} + e^{-j\omega t})/2 &#92;)</span>. Starting from the variation-of-constants formula and assuming <span>&#92;( s \notin \lambda(A) &#92;)</span> (i.e., <span>&#92;( s &#92;)</span> is not an eigenvalue of <span>&#92;( A &#92;)</span>), one computes the state trajectory:

<span>&#92;[&#92;begin{aligned}
x(t) &= e^{At}x(0) + \int_0^t e^{A(t-\tau)}Be^{s\tau}\,d\tau &#92;&#92;
&= e^{At}x(0) + e^{At}(sI - A)^{-1}\left[e^{(sI-A)t} - I\right]B &#92;&#92;
&= e^{At}[x(0) - (sI - A)^{-1}B] + (sI - A)^{-1}Be^{st}.
&#92;end{aligned}&#92;]</span>

The output is then

<span>&#92;[ y(t) = \underbrace{Ce^{At}[x(0) - (sI-A)^{-1}B]}_{\text{transient response}} + \underbrace{[C(sI-A)^{-1}B + D]e^{st}}_{\text{steady-state response}}. &#92;]</span>

Since all eigenvalues of <span>&#92;( A &#92;)</span> have negative real parts for a stable system, the transient term decays to zero as <span>&#92;( t \to \infty &#92;)</span>. The **steady-state response** is then

<span>&#92;[ y_{ss}(t) = G(s)\,e^{st}, &#92;]</span>

where <span>&#92;( G(s) &#92;)</span> is the transfer function. This elegant result shows that a stable LTI system transmits an exponential signal <span>&#92;( e^{st} &#92;)</span> with its amplitude and phase modified by <span>&#92;( G(s) &#92;)</span>.

For the purely imaginary case <span>&#92;( s = j\omega &#92;)</span> (a sinusoidal input), we write

<span>&#92;[ G(j\omega) = M e^{j\phi}, &#92;]</span>

where <span>&#92;( M = |G(j\omega)| &#92;)</span> is the **gain** and <span>&#92;( \phi = \angle G(j\omega) = \arctan\dfrac{\operatorname{Im} G(j\omega)}{\operatorname{Re} G(j\omega)} &#92;)</span> is the **phase**. The steady-state response becomes

<span>&#92;[ y_{ss}(t) = Me^{j(\omega t + \phi)} = M[\cos(\omega t + \phi) + j\sin(\omega t + \phi)]. &#92;]</span>

By linearity, for a real sinusoidal input <span>&#92;( u(t) = \cos(\omega t) &#92;)</span>, the steady-state output is

<span>&#92;[ y_{ss}(t) = M\cos(\omega t + \phi). &#92;]</span>

If <span>&#92;( \phi > 0 &#92;)</span>, the output **leads** the input; if <span>&#92;( \phi < 0 &#92;)</span>, the output **lags** the input.

**Definition 8.14 (Frequency response).** The **frequency response** of the system is the transfer function evaluated on the imaginary axis,

<span>&#92;[ G(j\omega) = Me^{j\phi}, &#92;]</span>

where <span>&#92;( M = |G(j\omega)| &#92;)</span> is the gain and <span>&#92;( \phi = \angle G(j\omega) &#92;)</span> is the phase. Since <span>&#92;( G(-j\omega) = \overline{G(j\omega)} &#92;)</span>, it suffices to consider <span>&#92;( \omega \geq 0 &#92;)</span>.

**Example 8.15.** Consider the first-order transfer function <span>&#92;( G(s) = \dfrac{1}{s+1} &#92;)</span>. The frequency response is

<span>&#92;[ G(j\omega) = \frac{1}{j\omega + 1} = Me^{j\phi}, \quad M = |G(j\omega)| = \frac{1}{\sqrt{\omega^2 + 1}}, \quad \phi = \angle G(j\omega) = -\arctan(\omega). &#92;]</span>

For <span>&#92;( \omega = 1 &#92;)</span>, the gain is <span>&#92;( M = 1/\sqrt{2} \approx 0.707 &#92;)</span> and the phase lag is <span>&#92;( 45^\circ &#92;)</span>. For <span>&#92;( \omega = 10 &#92;)</span>, the gain is much smaller (<span>&#92;( M \approx 0.1 &#92;)</span>) and the phase lag approaches <span>&#92;( 90^\circ &#92;)</span>. This illustrates that higher-frequency inputs are attenuated more strongly, and that the output always lags the input for this system.

More generally, the frequency response provides comprehensive information about a system: a large gain <span>&#92;( |G(j\omega)| &#92;)</span> at a particular frequency <span>&#92;( \omega &#92;)</span> means the system amplifies sinusoidal inputs at that frequency, while a small gain means the system attenuates them.

#### Bode Plots

The frequency response can be measured experimentally by sweeping through a range of frequencies <span>&#92;( \omega = \omega_1, \omega_2, \ldots, \omega_N &#92;)</span>, applying a sinusoid at each frequency, waiting for the transient to die out, and measuring the steady-state amplitude ratio and phase shift. The result can be displayed in several ways. Plotting the real and imaginary parts of <span>&#92;( G(j\omega) &#92;)</span> as a curve in the complex plane as <span>&#92;( \omega &#92;)</span> varies is called a **Nyquist plot**. Plotting both the gain <span>&#92;( |G(j\omega)| &#92;)</span> and the phase <span>&#92;( \angle G(j\omega) &#92;)</span> as functions of <span>&#92;( \omega &#92;)</span> separately is called a **Bode plot**.

**Definition 8.16 (Bode plot).** A **Bode plot** for the frequency response <span>&#92;( G(j\omega) &#92;)</span> consists of two curves: the **gain curve** (or magnitude plot), which shows <span>&#92;( |G(j\omega)| &#92;)</span> as a function of <span>&#92;( \omega &#92;)</span>, and the **phase curve** (or phase plot), which shows <span>&#92;( \angle G(j\omega) &#92;)</span> as a function of <span>&#92;( \omega &#92;)</span>.

**Remark 8.17.** In standard engineering practice, the Bode gain curve is plotted on a log/log scale (i.e., both axes are logarithmic) and the phase curve on a log/linear scale (logarithmic frequency axis, linear phase axis). The magnitude is expressed in **decibels (dB)**:

<span>&#92;[ |G(j\omega)|_{\rm dB} = 20\log_{10}|G(j\omega)|. &#92;]</span>

Bode plots are particularly powerful because of the following multiplicative property. For a transfer function <span>&#92;( G(s) = G_1(s)G_2(s)/G_3(s) &#92;)</span>, we have

<span>&#92;[&#92;begin{aligned}
\log|G(j\omega)| &= \log|G_1(j\omega)| + \log|G_2(j\omega)| - \log|G_3(j\omega)| &#92;&#92;
\angle G(j\omega) &= \angle G_1(j\omega) + \angle G_2(j\omega) - \angle G_3(j\omega).
&#92;end{aligned}&#92;]</span>

The Bode gain and phase of a composite transfer function are thus obtained by **addition and subtraction** of the individual component curves. Since any polynomial factors into terms of the form

<span>&#92;[ k, \quad s, \quad s + a, \quad s^2 + 2\zeta\omega_0 s + \omega_0^2, &#92;]</span>

it suffices to understand the Bode plots of these four elementary building blocks and then combine them.

**Example 8.18 (Constant gain).** For <span>&#92;( G(s) = k &#92;)</span>, the frequency response is the constant <span>&#92;( k &#92;)</span>, giving

<span>&#92;[ \text{gain (dB)} = 20\log|k|, \qquad \angle k = &#92;begin{cases} 0^\circ & k > 0 &#92;&#92; 180^\circ & k < 0. &#92;end{cases} &#92;]</span>

The gain curve is a horizontal line at <span>&#92;( 20\log|k| &#92;)</span> dB and the phase curve is constant at <span>&#92;( 0^\circ &#92;)</span> or <span>&#92;( 180^\circ &#92;)</span>.

**Example 8.19 (Pure integrator/differentiator).** For <span>&#92;( G(s) = s^k &#92;)</span> where <span>&#92;( k &#92;)</span> is an integer, evaluating at <span>&#92;( s = j\omega &#92;)</span> gives <span>&#92;( G(j\omega) = (j\omega)^k = \omega^k e^{jk\pi/2} &#92;)</span>, so

<span>&#92;[ \text{gain (dB)} = 20\log|G(j\omega)| = 20k\log\omega, \qquad \text{phase (deg)} = \angle G(j\omega) = k \cdot 90^\circ. &#92;]</span>

The gain curve is a straight line with slope <span>&#92;( 20k &#92;)</span> dB per decade on the log-log scale, passing through 0 dB at <span>&#92;( \omega = 1 &#92;)</span>. The phase is a constant <span>&#92;( k \cdot 90^\circ &#92;)</span>. For an integrator (<span>&#92;( k = -1 &#92;)</span>), the gain falls at <span>&#92;( -20 &#92;)</span> dB/decade and the phase is a constant <span>&#92;( -90^\circ &#92;)</span>.

**Example 8.20 (First-order system).** Consider the first-order transfer function

<span>&#92;[ G(s) = \frac{a}{s + a}. &#92;]</span>

Evaluating at <span>&#92;( s = j\omega &#92;)</span>:

<span>&#92;[ \text{gain (dB)} = 20\log a - 10\log(\omega^2 + a^2), \qquad \text{phase (deg)} = -\frac{180^\circ}{\pi}\arctan\frac{\omega}{a}. &#92;]</span>

At low frequencies <span>&#92;( \omega \ll a &#92;)</span>, the gain is approximately <span>&#92;( 20\log(a/a) = 0 &#92;)</span> dB (normalized) and the phase approaches <span>&#92;( 0^\circ &#92;)</span>. At the **corner frequency** (or **break frequency**) <span>&#92;( \omega = a &#92;)</span>, the gain is <span>&#92;( -3 &#92;)</span> dB and the phase is <span>&#92;( -45^\circ &#92;)</span>. At high frequencies <span>&#92;( \omega \gg a &#92;)</span>, the gain rolls off at <span>&#92;( -20 &#92;)</span> dB/decade and the phase asymptotically approaches <span>&#92;( -90^\circ &#92;)</span>. The asymptotic Bode approximation models the gain curve as two straight-line segments: 0 dB for <span>&#92;( \omega < a &#92;)</span>, and a line of slope <span>&#92;( -20 &#92;)</span> dB/decade for <span>&#92;( \omega > a &#92;)</span>.

**Example 8.21 (Second-order system).** Consider the second-order transfer function

<span>&#92;[ G(s) = \frac{\omega_0^2}{s^2 + 2\zeta\omega_0 s + \omega_0^2}, &#92;]</span>

where <span>&#92;( \omega_0 > 0 &#92;)</span> is the **natural frequency** and <span>&#92;( \zeta > 0 &#92;)</span> is the **damping ratio**. The gain and phase of the frequency response are

<span>&#92;[ \text{gain (dB)} = 40\log\omega_0 - 10\log&#92;\!\left(\omega^4 + 2\omega_0^2\omega^2(2\zeta^2 - 1) + \omega_0^4&#92;\right), &#92;]</span>

<span>&#92;[ \text{phase (deg)} = -\frac{180^\circ}{\pi}\arctan\frac{2\zeta\omega_0\,\omega}{\omega_0^2 - \omega^2}. &#92;]</span>

For <span>&#92;( \omega \ll \omega_0 &#92;)</span>, the gain is approximately 0 dB and the phase approaches <span>&#92;( 0^\circ &#92;)</span>. For <span>&#92;( \omega \gg \omega_0 &#92;)</span>, the gain falls at <span>&#92;( -40 &#92;)</span> dB/decade and the phase approaches <span>&#92;( -180^\circ &#92;)</span>. The transition near <span>&#92;( \omega = \omega_0 &#92;)</span> depends strongly on the damping ratio: for small <span>&#92;( \zeta &#92;)</span> (lightly damped systems), a sharp **resonance peak** appears in the gain curve near <span>&#92;( \omega_0 &#92;)</span>, while large <span>&#92;( \zeta &#92;)</span> (heavily damped systems) produces a much smoother roll-off. The height of the resonance peak grows as <span>&#92;( \zeta \to 0 &#92;)</span>, approaching infinity for an undamped system (which has poles on the imaginary axis at <span>&#92;( \pm j\omega_0 &#92;)</span>). The higher the damping ratio, the flatter the Bode curves.

In MATLAB, for a defined transfer function object `G`, the command `bode(G)` generates the Bode plot automatically. For instance, to plot the Bode diagram for the second-order system with <span>&#92;( \omega_0 = 1 &#92;)</span> and <span>&#92;( \zeta = 0.1 &#92;)</span>:

```matlab
s = tf('s');
zeta = 0.1;
G = 1/(s^2 + 2*zeta*s + 1);
bode(G);
```

The resulting Bode plot shows the characteristic resonance peak in the gain curve near <span>&#92;( \omega = 1 &#92;)</span> rad/s and the transition in the phase curve from <span>&#92;( 0^\circ &#92;)</span> to <span>&#92;( -180^\circ &#92;)</span>.
## Week 5: Poles, Zeros, and Internal Stability

### Lecture 9: Poles and Zeros

The input-output behavior of a linear control system is shaped, to a remarkable degree, by the locations of certain special points in the complex plane associated with its transfer function. These points — the **poles** and **zeros** — encode information about the system's natural frequencies, resonances, and the signals it can block. In this lecture we define poles and zeros precisely, relate them to the underlying state-space realization, and examine their influence on the step response.

#### Poles and Zeros for a SISO Transfer Function

**Definition 9.1 (Poles and zeros).** Consider a SISO transfer function written in the coprime form

<span>&#92;[ G(s) = \frac{n(s)}{d(s)}, &#92;]</span>

where <span>&#92;(n(s)&#92;)</span> and <span>&#92;(d(s)&#92;)</span> are coprime polynomials (i.e., their greatest common divisor is 1). The roots of the numerator <span>&#92;(n(s)&#92;)</span> are called the **zeros** of <span>&#92;(G(s)&#92;)</span>, and the roots of the denominator <span>&#92;(d(s)&#92;)</span> are called the **poles** of <span>&#92;(G(s)&#92;)</span>.

This definition parallels the notion of poles and zeros from complex analysis. Note that complex poles and zeros always appear in conjugate pairs when the coefficients of <span>&#92;(n(s)&#92;)</span> and <span>&#92;(d(s)&#92;)</span> are real.

**Example 9.2.** Consider

<span>&#92;[ G(s) = \frac{s+1}{s^2 + s + 1}. &#92;]</span>

There is a single zero at <span>&#92;(s = -1&#92;)</span> and two poles at <span>&#92;(s = \frac{-1 \pm j\sqrt{3}}{2}&#92;)</span>. Tools such as `pzplot` or `pzmap` in MATLAB render these graphically: poles are indicated by a cross (<span>&#92;\(\times&#92;)</span>) and zeros by a circle (<span>&#92;(\circ&#92;)</span>).

#### Relationship with the Frequency Response

Any SISO transfer function can be factored as

<span>&#92;[ G(s) = k \frac{(s - z_1)(s - z_2)\cdots(s - z_r)}{(s - p_1)(s - p_2)\cdots(s - p_n)}, &#92;]</span>

where <span>&#92;(z_1, \ldots, z_r&#92;)</span> are the zeros, <span>&#92;(p_1, \ldots, p_n&#92;)</span> are the poles, and <span>&#92;(k&#92;)</span> is a scalar gain. Evaluating on the imaginary axis at <span>&#92;(s = j\omega&#92;)</span> yields

<span>&#92;[ G(j\omega) = k \frac{(j\omega - z_1)(j\omega - z_2)\cdots(j\omega - z_r)}{(j\omega - p_1)(j\omega - p_2)\cdots(j\omega - p_n)}. &#92;]</span>

Taking logarithms and arguments, we obtain

<span>&#92;[&#92;begin{aligned}
\log |G(j\omega)| &= \log k + \sum_{i=1}^{r} |j\omega - z_i| - \sum_{i=1}^{n} |j\omega - p_i|, &#92;&#92;
\angle G(j\omega) &= \sum_{i=1}^{r} \angle(j\omega - z_i) - \sum_{i=1}^{n} \angle(j\omega - p_i).
&#92;end{aligned}&#92;]</span>

In other words, both the magnitude and phase of the frequency response are completely determined by the pole-zero locations up to an overall gain constant. The geometric interpretation — each term is the angle or distance from <span>&#92;(j\omega&#92;)</span> to a specific pole or zero in the complex plane — provides an intuitive way to reason about Bode plots without explicit computation.

#### Relationship with State-Space Realizations

##### Poles Versus Eigenvalues

Let <span>&#92;((A, B, C, D)&#92;)</span> be a state-space realization of <span>&#92;(G(s)&#92;)</span>. Recall that

<span>&#92;[ G(s) = C(sI - A)^{-1}B + D = \frac{C\,\mathrm{adj}(sI - A)B + D\det(sI - A)}{\det(sI - A)} = \frac{n(s)}{d(s)}. &#92;]</span>

It is possible for <span>&#92;(C\,\mathrm{adj}(sI-A)B + D\det(sI-A)&#92;)</span> and <span>&#92;(\det(sI-A)&#92;)</span> to share common factors, which must be cancelled to reach the coprime form. Nevertheless, every root of <span>&#92;(d(s)&#92;)</span> is always a root of <span>&#92;(\det(sI-A)&#92;)</span>, the characteristic polynomial of <span>&#92;(A&#92;)</span>. Hence every pole of <span>&#92;(G(s)&#92;)</span> is an eigenvalue of <span>&#92;(A&#92;)</span>. The converse holds precisely when the realization is minimal.

**Theorem 9.3.** Let <span>&#92;((A, B, C, D)&#92;)</span> be a realization of a SISO transfer function <span>&#92;(G(s)&#92;)</span>. Then every pole of <span>&#92;(G(s)&#92;)</span> is an eigenvalue of <span>&#92;(A&#92;)</span>. Furthermore, the following statements are equivalent:

- All eigenvalues of <span>&#92;(A&#92;)</span> are poles of <span>&#92;(G(s)&#92;)</span>.
- <span>&#92;((A, B, C, D)&#92;)</span> is a minimal realization of <span>&#92;(G(s)&#92;)</span>.
- <span>&#92;(C\,\mathrm{adj}(sI-A)B&#92;)</span> and <span>&#92;(\det(sI-A)&#92;)</span> are coprime.

The proof follows from the observation that if <span>&#92;((A_1, B_1, C_1, D_1)&#92;)</span> is a minimal realization, then its denominator has strictly smaller degree than <span>&#92;(\det(sI-A)&#92;)</span> whenever <span>&#92;((A, B, C, D)&#92;)</span> is non-minimal, so <span>&#92;(\det(sI-A)&#92;)</span> and <span>&#92;(C\,\mathrm{adj}(sI-A)B&#92;)</span> cannot be coprime in that case.

##### Zeros Versus Invariant Zeros

Let <span>&#92;(u(t) = e^{st}u_0&#92;)</span> be an exponential input with <span>&#92;(u_0 \in \mathbb{R}&#92;)</span> and let <span>&#92;(s \neq \lambda(A)&#92;)</span> (i.e., <span>&#92;(s&#92;)</span> is not an eigenvalue of <span>&#92;(A&#92;)</span>). A computation using the variation-of-parameters formula shows that if one chooses the initial condition <span>&#92;(x_0 = (sI - A)^{-1}Bu_0&#92;)</span>, then

<span>&#92;[&#92;begin{aligned}
x(t) &= (sI - A)^{-1}B\,e^{st}u_0, &#92;&#92;
y(t) &= \bigl[C(sI-A)^{-1}B + D\bigr]e^{st}u_0 = G(s)\,e^{st}u_0.
&#92;end{aligned}&#92;]</span>

If <span>&#92;(s&#92;)</span> is a zero of <span>&#92;(G(s)&#92;)</span>, then <span>&#92;(y(t) = 0&#92;)</span> for all <span>&#92;(t \geq 0&#92;)</span>: the system completely blocks the transmission of the exponential <span>&#92;(e^{st}&#92;)</span>. Substituting <span>&#92;(x(t) = e^{st}x_0&#92;)</span> back into the state equations yields

<span>&#92;[ \begin{bmatrix} sI - A & -B \\ -C & -D \end{bmatrix} \begin{bmatrix} x_0 \\ u_0 \end{bmatrix} = 0, &#92;]</span>

which has a nonzero solution only if the matrix on the left loses rank. This motivates the following definition.

**Definition 9.4 (Invariant zeros).** A complex number <span>&#92;(s&#92;)</span> is called an **invariant zero** of the state-space model <span>&#92;((A, B, C, D)&#92;)</span> if

<span>&#92;[ \mathrm{rank}\begin{bmatrix} sI - A & -B \\ -C & -D \end{bmatrix} < n + 1. &#92;]</span>

**Theorem 9.5.** Let <span>&#92;((A, B, C, D)&#92;)</span> be a realization of a SISO transfer function <span>&#92;(G(s)&#92;)</span>. Then every zero of <span>&#92;(G(s)&#92;)</span> is an invariant zero of <span>&#92;((A, B, C, D)&#92;)</span>. Furthermore, the following statements are equivalent:

- All invariant zeros of <span>&#92;((A, B, C, D)&#92;)</span> are zeros of <span>&#92;(G(s)&#92;)</span>.
- <span>&#92;((A, B, C, D)&#92;)</span> is a minimal realization of <span>&#92;(G(s)&#92;)</span>.
- <span>&#92;(C\,\mathrm{adj}(sI-A)B&#92;)</span> and <span>&#92;(\det(sI-A)&#92;)</span> are coprime.

*Proof.* Let <span>&#92;(s&#92;)</span> be a zero of <span>&#92;(G(s)&#92;)</span>, so that <span>&#92;(C\,\mathrm{adj}(sI-A)B + D\det(sI-A) = 0&#92;)</span>. By Cramer's rule one verifies that

<span>&#92;[ C\,\mathrm{adj}(sI-A)B + D\det(sI-A) = \det\begin{bmatrix} sI-A & -B \\ -C & -D \end{bmatrix}. &#92;]</span>

Hence this determinant vanishes, meaning the matrix loses rank and <span>&#92;(s&#92;)</span> is an invariant zero. The remainder of the equivalences follows by an argument parallel to that for Theorem 9.3.

**Proposition 9.6 (Transmission blocking).** Consider a SISO system <span>&#92;((A, B, C, D)&#92;)</span> with transfer function <span>&#92;(G(s)&#92;)</span>. Let <span>&#92;(s_0&#92;)</span> be an invariant zero of <span>&#92;((A, B, C, D)&#92;)</span> that is not an eigenvalue of <span>&#92;(A&#92;)</span>. Then there exists a nonzero input of the form <span>&#92;(u(t) = e^{s_0 t}u_0&#92;)</span> and an initial condition <span>&#92;(x_0&#92;)</span> such that the corresponding output <span>&#92;(y(t) = 0&#92;)</span> for all <span>&#92;(t \geq 0&#92;)</span>. In particular, the same conclusion holds for any zero of <span>&#92;(G(s)&#92;)</span>.

*Proof.* Since <span>&#92;(s_0&#92;)</span> is an invariant zero, there exists a nonzero vector <span>&#92;((x_0, u_0) \in \mathbb{R}^{n+1}&#92;)</span> satisfying

<span>&#92;[ \begin{bmatrix} s_0 I - A & -B \\ -C & -D \end{bmatrix} \begin{bmatrix} x_0 \\ u_0 \end{bmatrix} = 0. &#92;]</span>

Because <span>&#92;(s_0&#92;)</span> is not an eigenvalue of <span>&#92;(A&#92;)</span>, we can write <span>&#92;(x_0 = (s_0 I - A)^{-1}Bu_0&#92;)</span>; in particular <span>&#92;(u_0 \neq 0&#92;)</span>. Setting <span>&#92;(x(t) = e^{s_0 t}x_0&#92;)</span> and <span>&#92;(u(t) = e^{s_0 t}u_0&#92;)</span>, the condition <span>&#92;(s_0 x_0 = Ax_0 + Bu_0&#92;)</span> ensures <span>&#92;(x'(t) = Ax(t) + Bu(t)&#92;)</span>, and the condition <span>&#92;(Cx_0 + Du_0 = 0&#92;)</span> gives <span>&#92;(y(t) = 0&#92;)</span> for all <span>&#92;(t \geq 0&#92;)</span>.

#### Effects of Zeros and Poles on the Step Response

The **unit step response** is the output produced by the input <span>&#92;(u(t) = 1&#92;)</span> for <span>&#92;(t \geq 0&#92;)</span> and zero initial conditions. Its Laplace transform is <span>&#92;(\hat{u}(s) = 1/s&#92;)</span>, so the step response in the frequency domain is <span>&#92;(\hat{y}(s) = G(s)/s&#92;)</span>.

**Example 9.7 (Step response of a first-order system).** A general first-order strictly proper transfer function is

<span>&#92;[ G(s) = \frac{a_0}{s + b_0} = \frac{k}{\tau s + 1}, &#92;]</span>

where <span>&#92;(k = a_0/b_0&#92;)</span> is the **DC gain** (also called the steady-state gain) and <span>&#92;(\tau = 1/b_0&#92;)</span> is the **time constant**. With a unit step input, <span>&#92;(\hat{y}(s) = k/(s(\tau s+1))&#92;)</span>, and taking the inverse Laplace transform yields the step response

<span>&#92;[ y(t) = k\!\left[1 - e^{-t/\tau}\right], \quad t \geq 0. &#92;]</span>

The system rises monotonically from zero to the steady state <span>&#92;(k&#92;)</span>, reaching approximately <span>&#92;(63\%&#92;)</span> of its final value after one time constant.

**Example 9.8 (Step response of a second-order system).** Consider

<span>&#92;[ G(s) = k\frac{\omega_n^2}{s^2 + 2\zeta\omega_n s + \omega_n^2}, &#92;]</span>

where <span>&#92;(k&#92;)</span> is the DC gain, <span>&#92;(\omega_n = \sqrt{b_0}&#92;)</span> is the **natural frequency**, and <span>&#92;(\zeta = b_1/(2\omega_n)&#92;)</span> is the **damping ratio**. In the underdamped case <span>&#92;(\zeta < 1&#92;)</span>, the step response is

<span>&#92;[ y(t) = k\!\left[1 - \frac{1}{\beta}e^{-\zeta\omega_n t}\sin(\beta\omega_n t + \theta)\right], &#92;]</span>

where <span>&#92;(\beta = \sqrt{1-\zeta^2}&#92;)</span> and <span>&#92;(\theta = \arctan(\beta/\zeta)&#92;)</span>.

**Adding a pole.** Inserting an additional pole at location <span>&#92;(-a&#92;)</span> gives

<span>&#92;[ G_n(s) = \frac{ka\,\omega_n^2}{(s^2 + 2\zeta\omega_n s + \omega_n^2)(s+a)}, &#92;]</span>

where the factor <span>&#92;(a&#92;)</span> in the numerator preserves the DC gain. Partial-fraction decomposition introduces an additional decaying exponential <span>&#92;(Ae^{-at}&#92;)</span> in the step response. If <span>&#92;(a&#92;)</span> is small (pole near the origin), this term dominates and slows the response considerably. As <span>&#92;(a&#92;)</span> grows large (pole far in the left half-plane), the term <span>&#92;(Ae^{-at}&#92;)</span> decays very rapidly and the original behavior is largely recovered. In general, adding a left-half-plane pole makes the step response **slower**, with the effect diminishing as the pole moves away from the origin.

**Adding a zero.** Inserting a zero at <span>&#92;(-a&#92;)</span> gives

<span>&#92;[ G_n(s) = k\frac{\omega_n^2(s + a)}{a(s^2 + 2\zeta\omega_n s + \omega_n^2)} = \left[\frac{s}{a} + 1\right]G(s). &#92;]</span>

In the time domain the step response becomes

<span>&#92;[ y_n(t) = \frac{\dot{y}(t)}{a} + y(t), &#92;]</span>

where <span>&#92;(y(t)&#92;)</span> is the original step response. Two cases arise. When <span>&#92;(a > 0&#92;)</span> (the zero lies in the left half-plane), the derivative contribution increases the overshoot and speeds up the response; larger <span>&#92;(a&#92;)</span> diminishes this effect. When <span>&#92;(a < 0&#92;)</span> (the zero lies in the right half-plane), the derivative contribution opposes the initial rise, reducing overshoot or even introducing an **undershoot** — a phenomenon in which the response initially moves in the wrong direction before ultimately settling. Right-half-plane zeros are often called **non-minimum phase zeros** and impose fundamental limitations on achievable closed-loop performance.

---

### Lecture 10: Internal Stability

From this lecture onward the focus turns from modeling to the analysis and design of control systems. The most fundamental property a control system must possess is **stability**: loosely, the assurance that trajectories do not grow without bound. Among the several stability notions in the literature, we study here **internal stability**, which concerns the free evolution of the state under no external input.

#### Definition of Internal Stability

**Definition 10.9.** An <span>&#92;(n \times n&#92;)</span> matrix <span>&#92;(A&#92;)</span> is said to be **Hurwitz** if <span>&#92;(\mathrm{Re}(\lambda) < 0&#92;)</span> for every eigenvalue <span>&#92;(\lambda&#92;)</span> of <span>&#92;(A&#92;)</span>. Equivalently, all eigenvalues of <span>&#92;(A&#92;)</span> lie in the open left half of the complex plane, denoted <span>&#92;(\mathbb{C}^-&#92;)</span>.

**Definition 10.10.** An LTI system <span>&#92;((A, B, C, D)&#92;)</span> is said to be **internally stable** if <span>&#92;(A&#92;)</span> is Hurwitz.

The terminology "internal" distinguishes this notion from input-output stability (which concerns whether bounded inputs produce bounded outputs) and from the stability of specific equilibria for nonlinear systems. For an unforced linear system <span>&#92;(x'= Ax&#92;)</span>, the question reduces entirely to the spectral properties of <span>&#92;(A&#92;)</span>.

**Example 10.11.** Consider the inverted pendulum, whose equations of motion linearized about the hanging equilibrium <span>&#92;((\pi, 0)&#92;)</span> are

<span>&#92;[ x' = \begin{bmatrix} 0 & 1 \\ -g/\ell & -b/(m\ell^2) \end{bmatrix} x + \begin{bmatrix} 0 \\ 1 \end{bmatrix} u, \quad y = \begin{bmatrix} 1 & 0 \end{bmatrix} x. &#92;]</span>

The eigenvalues of the system matrix satisfy

<span>&#92;[ \lambda\!\left(\lambda + \frac{b}{m\ell^2}\right) + \frac{g}{\ell} = 0 \implies \lambda = -\frac{b}{2m\ell^2} \pm \sqrt{\left(\frac{b}{2m\ell^2}\right)^2 - \frac{g}{\ell}}. &#92;]</span>

Both eigenvalues have negative real parts, so the hanging equilibrium is internally stable. In contrast, the linearization about the upright equilibrium <span>&#92;((0,0)&#92;)</span> has system matrix

<span>&#92;[ A = \begin{bmatrix} 0 & 1 \\ g/\ell & -b/(m\ell^2) \end{bmatrix}, &#92;]</span>

with eigenvalues

<span>&#92;[ \lambda = -\frac{b}{2m\ell^2} \pm \sqrt{\left(\frac{b}{2m\ell^2}\right)^2 + \frac{g}{\ell}}. &#92;]</span>

One eigenvalue has positive real part, confirming that the upright equilibrium is internally unstable and requires active control to stabilize.

#### The Internal Stability Theorem

The following central result provides four equivalent characterizations of internal stability, connecting the spectral condition on <span>&#92;(A&#92;)</span> to the long-run behavior of solutions and to the existence of a quadratic Lyapunov function.

**Theorem 10.12 (Internal stability).** The following statements are equivalent:

1. <span>&#92;(A&#92;)</span> is Hurwitz (all eigenvalues have negative real parts).
2. <span>&#92;(\lim_{t\to\infty} e^{At}x_0 = 0&#92;)</span> for all <span>&#92;(x_0 \in \mathbb{R}^n&#92;)</span>.
3. There exist constants <span>&#92;(M, c > 0&#92;)</span> such that <span>&#92;(\|x(t)\| \leq M e^{-ct}\|x_0\|&#92;)</span> for all <span>&#92;(t \geq 0&#92;)</span>, where <span>&#92;(x(t) = e^{At}x_0&#92;)</span> solves <span>&#92;(x' = Ax&#92;)</span> with <span>&#92;(x(0) = x_0&#92;)</span>.
4. For every positive definite matrix <span>&#92;(Q&#92;)</span>, there exists a unique positive definite matrix <span>&#92;(P&#92;)</span> satisfying the **Lyapunov equation**

<span>&#92;[ A^T P + PA = -Q. &#92;]</span>

**Remark 10.13.** Item (2) is called **asymptotic stability** and item (3) is called **exponential stability**. For unforced linear systems these two notions coincide, and both are equivalent to the existence of the quadratic **Lyapunov function** <span>&#92;(V(x) = x^T P x&#92;)</span> solving the Lyapunov equation in (4). The matrix <span>&#92;(P&#92;)</span> and the function <span>&#92;(V&#92;)</span> play a central role not only in linear analysis but also in the stability theory of nonlinear systems.

*Proof (selected directions).*

**(1) <span>&#92;(\Rightarrow&#92;)</span> (3) <span>&#92;(\Rightarrow&#92;)</span> (2).** Every entry of <span>&#92;(e^{At}&#92;)</span> is a linear combination of terms of the form <span>&#92;(e^{\alpha t}\cos\beta t&#92;)</span> and <span>&#92;(e^{\alpha t}\sin\beta t&#92;)</span>, where <span>&#92;(\lambda = \alpha + j\beta&#92;)</span> is an eigenvalue of <span>&#92;(A&#92;)</span>. Since all eigenvalues satisfy <span>&#92;(\alpha < 0&#92;)</span>, these entries decay exponentially, giving (3) and then (2).

**(4) <span>&#92;(\Rightarrow&#92;)</span> (2).** Take <span>&#92;(Q = I&#92;)</span> and let <span>&#92;(V(x) = x^T Px&#92;)</span>. Along any trajectory <span>&#92;(x(t)&#92;)</span> of <span>&#92;(x' = Ax&#92;)</span>,

<span>&#92;[ \frac{dV(x(t))}{dt} = x^T(t)\bigl[A^T P + PA\bigr]x(t) = -\|x(t)\|^2 \leq 0. &#92;]</span>

To convert this into decay of <span>&#92;(x(t)&#92;)</span> itself, we invoke the following lemma.

**Lemma 10.14.** If <span>&#92;(P \in \mathbb{R}^{n\times n}&#92;)</span> is positive definite, then

<span>&#92;[ \lambda_{\min}(P)\|x\|^2 \leq x^T Px \leq \lambda_{\max}(P)\|x\|^2, \quad \forall\, x \in \mathbb{R}^n, &#92;]</span>

where <span>&#92;(\lambda_{\min}(P)&#92;)</span> and <span>&#92;(\lambda_{\max}(P)&#92;)</span> are the smallest and largest eigenvalues of <span>&#92;(P&#92;)</span>.

*Proof of Lemma.* Since <span>&#92;(P&#92;)</span> is real symmetric it is orthogonally diagonalizable: there exists an orthogonal matrix <span>&#92;(W&#92;)</span> with <span>&#92;(W^T P W = \mathrm{diag}(\lambda_1, \ldots, \lambda_n)&#92;)</span> and all <span>&#92;(\lambda_i > 0&#92;)</span>. Then

<span>&#92;[ x^T P x = (W^T x)^T \mathrm{diag}(\lambda_1,\ldots,\lambda_n)(W^T x) \leq \lambda_{\max}(P)\,\|W^Tx\|^2 = \lambda_{\max}(P)\|x\|^2, &#92;]</span>

with the lower bound following similarly.

Using Lemma 10.14 in the Lyapunov derivative inequality gives

<span>&#92;[ \frac{dV(x(t))}{dt} = -\|x(t)\|^2 \leq -\frac{1}{\lambda_{\max}(P)} x^T(t)Px(t) = -\frac{1}{\lambda_{\max}(P)} V(x(t)). &#92;]</span>

Hence

<span>&#92;[ \frac{d}{dt}\!\left[e^{t/\lambda_{\max}(P)} V(x(t))\right] \leq 0, &#92;]</span>

so the quantity <span>&#92;(e^{t/\lambda_{\max}(P)}V(x(t))&#92;)</span> is non-increasing. This implies

<span>&#92;[ V(x(t)) \leq e^{-t/\lambda_{\max}(P)} V(x(0)), \quad \forall\, t \geq 0. &#92;]</span>

Applying Lemma 10.14 once more yields

<span>&#92;[ \|x(t)\| \leq \sqrt{\frac{\lambda_{\max}(P)}{\lambda_{\min}(P)}}\,e^{-t/(2\lambda_{\max}(P))}\|x(0)\|, &#92;]</span>

which establishes (3).

**(2) <span>&#92;(\Rightarrow&#92;)</span> (1) (Sketch).** Suppose some eigenvalue <span>&#92;(\lambda&#92;)</span> of <span>&#92;(A&#92;)</span> satisfies <span>&#92;(\mathrm{Re}(\lambda) \geq 0&#92;)</span>. Then there exists <span>&#92;(x_0 \in \mathbb{R}^n&#92;)</span> such that <span>&#92;(e^{At}x_0&#92;)</span> does not tend to zero (since the corresponding Jordan block contributes a non-decaying term), contradicting (2).

**(1) <span>&#92;(\Rightarrow&#92;)</span> (4).** Define

<span>&#92;[ P = \int_0^\infty e^{A^T t} Q\, e^{At}\,dt. &#92;]</span>

Since <span>&#92;(A&#92;)</span> is Hurwitz, the integrand decays exponentially and <span>&#92;(P&#92;)</span> is well-defined and positive definite. Differentiating under the integral,

<span>&#92;[&#92;begin{aligned}
A^T P + PA &= \int_0^\infty \frac{d}{dt}\!\left[e^{A^T t}Q\,e^{At}\right]dt &#92;&#92;
&= e^{A^T t}Q\,e^{At}\Big|_0^\infty = 0 - Q = -Q,
&#92;end{aligned}&#92;]</span>

where the boundary term at infinity vanishes because <span>&#92;(A&#92;)</span> and <span>&#92;(A^T&#92;)</span> are both Hurwitz.

---

## Week 6: Stabilizability and Stabilization

### Lecture 11: Stabilizability

Having established what internal stability means, a natural question arises: if a system is not internally stable, can we design a control input to drive all trajectories to zero? This question is not always answerable in the affirmative — the answer depends on a structural property of the pair <span>&#92;((A, B)&#92;)</span> called **stabilizability**.

#### Definition and Basic Properties

Consider an LTI system <span>&#92;(x' = Ax + Bu&#92;)</span>.

**Definition 11.1.** The system <span>&#92;((A, B)&#92;)</span> is said to be **stabilizable** if, for every initial state <span>&#92;(x_0 \in \mathbb{R}^n&#92;)</span>, there exists a control input <span>&#92;(u: [0,\infty) \to \mathbb{R}^k&#92;)</span> such that

<span>&#92;[ \lim_{t\to\infty} x(t) = \lim_{t\to\infty}\!\left[e^{At}x_0 + \int_0^t e^{A(t-\tau)}Bu(\tau)\,d\tau\right] = 0. &#92;]</span>

In other words, for every initial condition a control exists that asymptotically steers the state to the origin.

**Proposition 11.2.** The following hold:

- If <span>&#92;((A, B)&#92;)</span> is controllable, then <span>&#92;((A, B)&#92;)</span> is stabilizable, because controllability allows one to drive the state exactly to zero in finite time, after which the zero input keeps it there.
- If <span>&#92;(A&#92;)</span> is Hurwitz, then <span>&#92;((A, B)&#92;)</span> is stabilizable, because all trajectories decay to zero even under zero input.
- Stabilizability is invariant under state transformation: if <span>&#92;(P&#92;)</span> is nonsingular, then <span>&#92;((A, B)&#92;)</span> is stabilizable if and only if <span>&#92;((PAP^{-1}, PB)&#92;)</span> is stabilizable.

#### Equivalent Characterizations

The following theorem gives six equivalent ways to detect stabilizability, each illuminating a different facet of the concept.

**Theorem 11.3 (Stabilizability).** The following statements are equivalent:

1. <span>&#92;((A, B)&#92;)</span> is stabilizable.
2. The uncontrollable part <span>&#92;(A_u&#92;)</span> of <span>&#92;((A, B)&#92;)</span> (the matrix governing the uncontrollable modes in the Kalman decomposition, if it exists) is Hurwitz.
3. **(Stabilization by state feedback)** There exists a matrix <span>&#92;(K \in \mathbb{R}^{k \times n}&#92;)</span> such that <span>&#92;(A + BK&#92;)</span> is Hurwitz.
4. **(PBH test)** <span>&#92;(\mathrm{rank}[A - \lambda I \;\; B] = n&#92;)</span> for every complex number <span>&#92;(\lambda&#92;)</span> with <span>&#92;(\mathrm{Re}(\lambda) \geq 0&#92;)</span>.
5. **(Eigenvector test)** Every eigenvector of <span>&#92;(A^T&#92;)</span> corresponding to an eigenvalue <span>&#92;(\lambda&#92;)</span> with <span>&#92;(\mathrm{Re}(\lambda) \geq 0&#92;)</span> is not in the kernel of <span>&#92;(B^T&#92;)</span>.
6. **(Lyapunov test)** There exists a positive definite matrix <span>&#92;(P&#92;)</span> such that

<span>&#92;[ AP + PA^T - BB^T < 0. &#92;]</span>

*Proof (selected directions).*

**(6) <span>&#92;(\Rightarrow&#92;)</span> (3).** Let <span>&#92;(K = -\tfrac{1}{2}B^T P^{-1}&#92;)</span>. Then

<span>&#92;[&#92;begin{aligned}
(A + BK)P + P(A + BK)^T &= \left(A - \tfrac{1}{2}BB^T P^{-1}\right)P + P\left(A - \tfrac{1}{2}BB^T P^{-1}\right)^T &#92;&#92;
&= AP + PA^T - BB^T < 0.
&#92;end{aligned}&#92;]</span>

Left- and right-multiplying by <span>&#92;(Q = P^{-1}&#92;)</span> gives <span>&#92;(Q(A+BK) + (A+BK)^T Q < 0&#92;)</span>, which by the Lyapunov characterization (Theorem 10.12, item (4)) shows that <span>&#92;(A + BK&#92;)</span> is Hurwitz.

**(3) <span>&#92;(\Rightarrow&#92;)</span> (1).** With the state feedback <span>&#92;(u(t) = Kx(t)&#92;)</span>, the closed-loop system becomes <span>&#92;(x' = (A + BK)x&#92;)</span>. Since <span>&#92;(A + BK&#92;)</span> is Hurwitz, all solutions decay exponentially to zero for any initial condition.

**(4) <span>&#92;(\Rightarrow&#92;)</span> (5).** Suppose there is a left eigenvector <span>&#92;(v \neq 0&#92;)</span> of <span>&#92;(A^T&#92;)</span> for an unstable eigenvalue <span>&#92;(\lambda&#92;)</span> (meaning <span>&#92;(\mathrm{Re}(\lambda) \geq 0&#92;)</span>) with <span>&#92;(B^T v = 0&#92;)</span>. Then

<span>&#92;[ \begin{bmatrix} B^T \\ A^T - \lambda I \end{bmatrix} v = 0, &#92;]</span>

so the matrix has less than full column rank, and after transposing, <span>&#92;([A - \lambda I \;\; B]&#92;)</span> fails to have full row rank, violating (4).

**(5) <span>&#92;(\Rightarrow&#92;)</span> (4).** Essentially the reverse of the argument above.

**(2) <span>&#92;(\Rightarrow&#92;)</span> (5).** If no uncontrollable part exists, <span>&#92;((A,B)&#92;)</span> is controllable and the eigenvector test for controllability yields the conclusion. Otherwise, via a nonsingular transformation <span>&#92;(P&#92;)</span>, write

<span>&#92;[ PAP^{-1} = \begin{bmatrix} A_c & A_{12} \\ 0 & A_u \end{bmatrix}, \quad PB = \begin{bmatrix} B_c \\ 0 \end{bmatrix}. &#92;]</span>

Suppose for contradiction that <span>&#92;(A^T&#92;)</span> has an eigenvector <span>&#92;(v&#92;)</span> in <span>&#92;(\ker(B^T)&#92;)</span> for an unstable eigenvalue <span>&#92;(\lambda&#92;)</span>. Translating via <span>&#92;((P^T)^{-1}&#92;)</span>, one finds that the lower block component <span>&#92;(v_u \neq 0&#92;)</span> and <span>&#92;(A_u^T v_u = \lambda v_u&#92;)</span>, giving <span>&#92;(\lambda&#92;)</span> as an eigenvalue of <span>&#92;(A_u&#92;)</span> with <span>&#92;(\mathrm{Re}(\lambda) \geq 0&#92;)</span>, contradicting that <span>&#92;(A_u&#92;)</span> is Hurwitz.

**(1) <span>&#92;(\Rightarrow&#92;)</span> (2).** If <span>&#92;(A_u&#92;)</span> exists and is not Hurwitz, the coordinate change <span>&#92;(z = Px&#92;)</span> decouples the uncontrollable subsystem <span>&#92;(z_2' = A_u z_2&#92;)</span>. Since <span>&#92;(A_u&#92;)</span> is not Hurwitz, <span>&#92;(z_2&#92;)</span> cannot be driven to zero, and hence <span>&#92;((A, B)&#92;)</span> is not stabilizable.

**(4) <span>&#92;(\Rightarrow&#92;)</span> (2).** If <span>&#92;(A_u&#92;)</span> is not Hurwitz, pick an unstable eigenvalue <span>&#92;(\lambda&#92;)</span> of <span>&#92;(A_u^T&#92;)</span> with eigenvector <span>&#92;(v&#92;)</span>. Setting <span>&#92;(w = [0 \;\; v^T]&#92;)</span> and computing <span>&#92;(w[PAP^{-1} - \lambda I \;\; PB]&#92;)</span> gives the zero row vector, so <span>&#92;(wP[A - \lambda I \;\; B] = 0&#92;)</span> with <span>&#92;(wP \neq 0&#92;)</span>, and <span>&#92;(\mathrm{rank}[A - \lambda I \;\; B] < n&#92;)</span>.

The proof of **(2) <span>&#92;(\Rightarrow&#92;)</span> (6)** is deferred to Lecture 12, where it follows from the Lyapunov test for controllability.

**Example 11.4.** Consider the system

<span>&#92;[ x' = \begin{bmatrix} 1 & -1 \\ 0 & -1 \end{bmatrix} x + \begin{bmatrix} 1 \\ 0 \end{bmatrix} u. &#92;]</span>

The controllability matrix is <span>&#92;(\begin{bmatrix}1 & 1 \\ 0 & 0\end{bmatrix}&#92;)</span>, which has rank 1 < 2, so the system is **not controllable**. However, a controllable decomposition reveals the uncontrollable part <span>&#92;(A_u = -1&#92;)</span>, which is Hurwitz, so the system is **stabilizable** by statement (2) of Theorem 11.3.

Verification via the PBH test: the eigenvalues of <span>&#92;(A&#92;)</span> are <span>&#92;(\pm 1&#92;)</span>. The only unstable eigenvalue is <span>&#92;(\lambda = 1&#92;)</span>, and

<span>&#92;[ [A - I \;\; B] = \begin{bmatrix} 0 & -1 & 1 \\ 0 & 1 & 0 \end{bmatrix} &#92;]</span>

has rank 2 = n, confirming stabilizability.

For a direct construction, let <span>&#92;(K = [k_1 \;\; k_2]&#92;)</span>. Then

<span>&#92;[ A + BK = \begin{bmatrix} 1+k_1 & -1+k_2 \\ 0 & -1 \end{bmatrix}. &#92;]</span>

Choosing <span>&#92;(k_1 < -1&#92;)</span> makes both diagonal entries negative, rendering <span>&#92;(A + BK&#92;)</span> Hurwitz. Notice that the uncontrollable eigenvalue <span>&#92;(-1&#92;)</span> cannot be altered by state feedback, but since it is already stable, stabilization is achievable.

---

### Lecture 12: Stabilization of Controllable Systems

Theorem 11.3 tells us that a stabilizable system can be stabilized by a state feedback <span>&#92;(u = Kx&#92;)</span> making <span>&#92;(A + BK&#92;)</span> Hurwitz. For controllable systems, a much stronger result holds: not only can the closed-loop matrix be made Hurwitz, but its eigenvalues can be placed **anywhere** in the complex plane (subject to the conjugate-pair constraint). This lecture establishes that claim and provides a constructive proof via the **controllable canonical form**.

#### Lyapunov Tests for Controllability and Stabilizability

Before reaching the main theorem, we establish two Lyapunov-based characterizations that complete the proof of Theorem 11.3 and prepare the ground for eigenvalue placement.

**Proposition 12.5 (Eigenvalue test for controllability).** The pair <span>&#92;((A, B)&#92;)</span> is controllable if and only if no eigenvector of <span>&#92;(A^T&#92;)</span> lies in the kernel of <span>&#92;(B^T)&#92;)</span>.

*Proof.* Suppose some eigenvector <span>&#92;(v \neq 0&#92;)</span> of <span>&#92;(A^T&#92;)</span> satisfies <span>&#92;(B^T v = 0&#92;)</span> and <span>&#92;(A^T v = \lambda v&#92;)</span>. Then

<span>&#92;[ \begin{bmatrix} B^T \\ A^T - \lambda I \end{bmatrix} v = 0, &#92;]</span>

so this matrix lacks full column rank; transposing, <span>&#92;([A - \lambda I \;\; B]&#92;)</span> lacks full row rank, and by the PBH test <span>&#92;((A, B)&#92;)</span> is uncontrollable. The "if" direction follows by reversing the argument.

**Proposition 12.6 (Lyapunov test for controllability).** Suppose <span>&#92;(A&#92;)</span> is Hurwitz. The pair <span>&#92;((A, B)&#92;)</span> is controllable if and only if there exists a unique positive definite solution <span>&#92;(W&#92;)</span> to the Lyapunov equation

<span>&#92;[ AW + WA^T = -BB^T. &#92;]</span>

*Proof.* (<span>&#92;(\Rightarrow&#92;)</span>) Define

<span>&#92;[ W = \int_0^\infty e^{A\tau} BB^T e^{A^T\tau}\,d\tau. &#92;]</span>

Since <span>&#92;(A&#92;)</span> is Hurwitz the integral converges. Controllability of <span>&#92;((A, B)&#92;)</span> ensures <span>&#92;(W&#92;)</span> is positive definite (it is the **controllability Gramian**). A computation analogous to the proof of Theorem 10.12 shows <span>&#92;(AW + WA^T = -BB^T&#92;)</span>. For uniqueness, suppose <span>&#92;(\hat{W}&#92;)</span> also satisfies the equation. Then <span>&#92;(A(W - \hat{W}) + (W-\hat{W})A^T = 0&#92;)</span>. Left- and right-multiplying by <span>&#92;(e^{At}&#92;)</span> and <span>&#92;(e^{A^T t}&#92;)</span> shows that <span>&#92;(e^{At}(W - \hat{W})e^{A^T t}&#92;)</span> is constant in <span>&#92;(t&#92;)</span>; since both <span>&#92;(A&#92;)</span> and <span>&#92;(A^T&#92;)</span> are Hurwitz this expression tends to zero as <span>&#92;(t \to \infty&#92;)</span>, forcing it to be identically zero; at <span>&#92;(t = 0&#92;)</span> we get <span>&#92;(W = \hat{W}&#92;)</span>.

(<span>&#92;(\Leftarrow&#92;)</span>) Let <span>&#92;(v&#92;)</span> be an eigenvector of <span>&#92;(A^T&#92;)</span> with eigenvalue <span>&#92;(\lambda&#92;)</span>. Then

<span>&#92;[ v^*(AW + WA^T)v = 2\,\mathrm{Re}(\lambda)\,v^*Wv = -\|B^Tv\|^2. &#92;]</span>

Since <span>&#92;(W&#92;)</span> is positive definite, <span>&#92;(v^*Wv > 0&#92;)</span>. Hence <span>&#92;(\|B^Tv\|^2 > 0&#92;)</span>, i.e., <span>&#92;(v \notin \ker(B^T)&#92;)</span>. By Proposition 12.5, <span>&#92;((A, B)&#92;)</span> is controllable.

#### Stabilization with Arbitrary Decay Rate

**Theorem 12.7 (Stabilization by state feedback for controllable systems).** The following statements are equivalent:

1. <span>&#92;((A, B)&#92;)</span> is controllable.
2. For every <span>&#92;(\mu > 0&#92;)</span>, there exists a matrix <span>&#92;(K&#92;)</span> such that <span>&#92;(A + BK&#92;)</span> is Hurwitz and <span>&#92;(\mathrm{Re}(\lambda) \leq -\mu&#92;)</span> for all eigenvalues <span>&#92;(\lambda&#92;)</span> of <span>&#92;(A + BK&#92;)</span>.

*Proof.* (<span>&#92;(\Rightarrow&#92;)</span>) Since eigenvectors of <span>&#92;(A^T&#92;)</span> and <span>&#92;(-\mu I - A^T&#92;)</span> are in bijection (via <span>&#92;(A^T v = \lambda v \Leftrightarrow (-\mu I - A^T)v = -(\mu+\lambda)v&#92;)</span>), the pair <span>&#92;((A, B)&#92;)</span> is controllable if and only if <span>&#92;((-\mu I - A, B)&#92;)</span> is controllable for any <span>&#92;(\mu \in \mathbb{R}&#92;)</span>. Choose <span>&#92;(\mu&#92;)</span> large enough that <span>&#92;(-\mu I - A&#92;)</span> is Hurwitz. By the Lyapunov test for controllability, there exists a positive definite <span>&#92;(W&#92;)</span> such that

<span>&#92;[ W(-\mu I - A)^T + (-\mu I - A)W = -BB^T, \tag{12.1} &#92;]</span>

which simplifies to

<span>&#92;[ AW + WA^T - BB^T = -2\mu W. &#92;]</span>

Setting <span>&#92;(P = W^{-1}&#92;)</span> and multiplying through, this becomes

<span>&#92;[ P(A + BK) + (A + BK)^T P = -2\mu P, \quad K = -\tfrac{1}{2}B^T P. &#92;]</span>

The quadratic Lyapunov function <span>&#92;(V(x) = x^T P x&#92;)</span> then satisfies <span>&#92;(V(x(t)) = V(x(0))e^{-2\mu t}&#92;)</span>, so <span>&#92;(\|x(t)\|&#92;)</span> decays at rate <span>&#92;(\mu&#92;)</span> and all eigenvalues of <span>&#92;(A + BK&#92;)</span> have real part at most <span>&#92;(-\mu&#92;)</span>.

(<span>&#92;(\Leftarrow&#92;)</span>) If <span>&#92;((A, B)&#92;)</span> is not controllable, a coordinate transformation gives the decomposed form

<span>&#92;[ PAP^{-1} = \begin{bmatrix} A_c & A_{12} \\ 0 & A_u \end{bmatrix}, \quad PB = \begin{bmatrix} B_c \\ 0 \end{bmatrix}. &#92;]</span>

For any <span>&#92;(K&#92;)</span>, the closed-loop matrix in the new coordinates is

<span>&#92;[ P(A+BK)P^{-1} = \begin{bmatrix} A_c + B_c K_1 & A_{12} + B_c K_2 \\ 0 & A_u \end{bmatrix}, &#92;]</span>

which is block upper triangular with <span>&#92;(A_u&#92;)</span> unchanged in the lower-right corner. The eigenvalues of <span>&#92;(A_u&#92;)</span> remain eigenvalues of <span>&#92;(A + BK&#92;)</span> and cannot be shifted, so statement (2) fails.

#### The Lyapunov Test for Stabilizability (Completing Theorem 11.3)

**Corollary 12.8 (Lyapunov test for stabilizability).** The pair <span>&#92;((A, B)&#92;)</span> is stabilizable if and only if there exists a positive definite matrix <span>&#92;(P&#92;)</span> such that

<span>&#92;[ AP + PA^T - BB^T < 0. &#92;]</span>

*Proof.* The "if" direction is the implication (6) <span>&#92;(\Rightarrow&#92;)</span> (3) in Theorem 11.3. For the "only if" direction, suppose <span>&#92;((A, B)&#92;)</span> is stabilizable. If it is also controllable, equation (12.1) gives a positive definite <span>&#92;(W&#92;)</span> satisfying <span>&#92;(AW + WA^T - BB^T = -2\mu W < 0&#92;)</span>. If it is not controllable, the Kalman decomposition gives controllable pair <span>&#92;((A_c, B_c)&#92;)</span> and Hurwitz uncontrollable part <span>&#92;(A_u&#92;)</span>. Let <span>&#92;(W_c > 0&#92;)</span> satisfy <span>&#92;(A_c W_c + W_c A_c^T - B_c B_c^T = -2\mu W_c&#92;)</span>, and let <span>&#92;(W_u > 0&#92;)</span> satisfy <span>&#92;(W_u A_u^T + A_u W_u = -I&#92;)</span> (by the Lyapunov stability test for <span>&#92;(A_u&#92;)</span>). Set

<span>&#92;[ W = \begin{bmatrix} W_c & 0 \\ 0 & \rho W_u \end{bmatrix}. &#92;]</span>

Then

<span>&#92;[ A_1 W + WA_1^T - B_1 B_1^T = \begin{bmatrix} -2\mu W_c & \rho A_{12}W_u \\ \rho W_u A_{12}^T & -\rho I \end{bmatrix}, &#92;]</span>

where <span>&#92;(A_1 = PAP^{-1}&#92;)</span> and <span>&#92;(B_1 = PB&#92;)</span>. For <span>&#92;(\rho > 0&#92;)</span> chosen sufficiently small (completing the square in the off-diagonal blocks shows this is feasible), the right-hand side is negative definite, completing the proof.

#### Eigenvalue Assignment by State Feedback

Theorem 12.7 guarantees that a controllable system can be stabilized with eigenvalues pushed as far left as desired. The following theorem sharpens this to full freedom of eigenvalue placement.

**Theorem 12.9 (Eigenvalue assignment by state feedback for controllable systems).** The following statements are equivalent:

1. The pair <span>&#92;((A, B)&#92;)</span> is controllable.
2. For every set of complex numbers <span>&#92;(\{\lambda_1, \lambda_2, \ldots, \lambda_n\}&#92;)</span> in which complex values appear in conjugate pairs, there exists a matrix <span>&#92;(K \in \mathbb{R}^{k \times n}&#92;)</span> such that the eigenvalues of <span>&#92;(A + BK&#92;)</span> are exactly <span>&#92;(\{\lambda_1, \ldots, \lambda_n\}&#92;)</span>.

This is the **pole placement theorem**, one of the foundational results of linear control theory. The condition that complex eigenvalues appear in conjugate pairs is required to ensure <span>&#92;(K&#92;)</span> is real.

*Proof.* (2) <span>&#92;(\Rightarrow&#92;)</span> (1) follows from the same argument as the converse direction in Theorem 12.7: uncontrollable eigenvalues are immune to state feedback.

For (1) <span>&#92;(\Rightarrow&#92;)</span> (2), we prove the single-input case. The multi-input case is in [AM06]. The proof uses the **controllable canonical form**.

**Lemma 12.10 (Controllable canonical form).** If <span>&#92;((A, B)&#92;)</span> is controllable (with <span>&#92;(B \in \mathbb{R}^{n\times 1}&#92;)</span>), there exists a nonsingular matrix <span>&#92;(P&#92;)</span> such that

<span>&#92;[ PAP^{-1} = \begin{bmatrix} 0 & 1 & 0 & \cdots & 0 \\ 0 & 0 & 1 & \cdots & 0 \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & 0 & \cdots & 1 \\ -b_0 & -b_1 & -b_2 & \cdots & -b_{n-1} \end{bmatrix}, \quad PB = \begin{bmatrix} 0 \\ \vdots \\ 0 \\ 1 \end{bmatrix}, &#92;]</span>

where <span>&#92;(b_0, b_1, \ldots, b_{n-1}&#92;)</span> are the coefficients of the characteristic polynomial

<span>&#92;[ \det(sI - A) = b_0 + b_1 s + \cdots + b_{n-1}s^{n-1} + s^n. &#92;]</span>

*Proof of Lemma.* Since <span>&#92;((A, B)&#92;)</span> is controllable, the columns of the controllability matrix <span>&#92;([B \;\; AB \;\; A^2 B \;\; \cdots \;\; A^{n-1}B]&#92;)</span> are linearly independent and form a square invertible matrix. Define new basis vectors

<span>&#92;[&#92;begin{aligned}
v_n &= B, &#92;&#92;
v_{n-1} &= Av_n + b_{n-1}v_n = AB + b_{n-1}B, &#92;&#92;
v_{n-2} &= Av_{n-1} + b_{n-2}v_n = A^2B + b_{n-1}AB + b_{n-2}B, &#92;&#92;
&\vdots &#92;&#92;
v_1 &= Av_2 + b_1 v_n = A^{n-1}B + b_{n-1}A^{n-2}B + \cdots + b_1 B.
&#92;end{aligned}&#92;]</span>

These vectors <span>&#92;(\{v_1, \ldots, v_n\}&#92;)</span> are linearly independent because they are related to <span>&#92;(\{B, AB, \ldots, A^{n-1}B\}&#92;)</span> by a triangular change of basis. Setting <span>&#92;(P^{-1} = [v_1 \;\; v_2 \;\; \cdots \;\; v_n]&#92;)</span>, one has <span>&#92;(PB = e_n&#92;)</span> (the last standard basis vector). For <span>&#92;(PAP^{-1}&#92;)</span>, the Cayley-Hamilton theorem gives <span>&#92;(A^n B = -b_0 B - b_1 AB - \cdots - b_{n-1}A^{n-1}B&#92;)</span>, from which

<span>&#92;[&#92;begin{aligned}
Av_1 &= -b_0 v_n, &#92;&#92;
Av_2 &= v_1 - b_1 v_n, &#92;&#92;
&\vdots &#92;&#92;
Av_n &= v_{n-1} - b_{n-1}v_n,
&#92;end{aligned}&#92;]</span>

yielding exactly the companion matrix form above.

*Completion of proof of Theorem 12.9.* In the canonical coordinates, with <span>&#92;(\hat{K} = [\hat{k}_0 \;\; \hat{k}_1 \;\; \cdots \;\; \hat{k}_{n-1}]&#92;)</span>, the matrix <span>&#92;(PAP^{-1} + PB\hat{K}&#92;)</span> is again companion-form with last row <span>&#92;([-b_0 + \hat{k}_0, \; -b_1 + \hat{k}_1, \; \ldots, \; -b_{n-1}+\hat{k}_{n-1}]&#92;)</span>, so its characteristic polynomial is

<span>&#92;[ s^n + (b_{n-1} - \hat{k}_{n-1})s^{n-1} + \cdots + (b_1 - \hat{k}_1)s + (b_0 - \hat{k}_0). &#92;]</span>

Given any target polynomial <span>&#92;((s - \lambda_1)(s-\lambda_2)\cdots(s-\lambda_n) = s^n + a_{n-1}s^{n-1} + \cdots + a_1 s + a_0&#92;)</span>, we simply choose <span>&#92;(\hat{k}_i = b_i - a_i&#92;)</span> for each <span>&#92;(i&#92;)</span>. Setting <span>&#92;(K = \hat{K}P&#92;)</span> gives <span>&#92;(P(A+BK)P^{-1} = PAP^{-1} + PB\hat{K}&#92;)</span>, so <span>&#92;(A + BK&#92;)</span> has the desired eigenvalues.

**Example 12.11.** Let

<span>&#92;[ A = \begin{bmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 2 & 3 \end{bmatrix}, \quad B = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}. &#92;]</span>

We want the eigenvalues of <span>&#92;(A + BK&#92;)</span> to be <span>&#92;(-1, -2\pm j&#92;)</span>. The target characteristic polynomial is

<span>&#92;[ (\lambda+1)(\lambda+2-j)(\lambda+2+j) = \lambda^3 + 5\lambda^2 + 9\lambda + 5. &#92;]</span>

Since <span>&#92;(A&#92;)</span> is already in controllable canonical form with coefficients <span>&#92;(b_0 = -1, b_1 = -2, b_2 = -3&#92;)</span> (note the signs from the last row <span>&#92;([1, 2, 3]&#92;)</span>), setting <span>&#92;(K = [k_0 \;\; k_1 \;\; k_2]&#92;)</span> gives

<span>&#92;[ A + BK = \begin{bmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1+k_0 & 2+k_1 & 3+k_2 \end{bmatrix} &#92;]</span>

with characteristic polynomial <span>&#92;(\lambda^3 - (3+k_2)\lambda^2 - (2+k_1)\lambda - (1+k_0)&#92;)</span>. Matching coefficients:

<span>&#92;[ 1 + k_0 = -5, \quad 2 + k_1 = -9, \quad 3 + k_2 = -5, &#92;]</span>

giving <span>&#92;(k_0 = -6, \; k_1 = -11, \; k_2 = -8&#92;)</span>.

**Example 12.12.** Let

<span>&#92;[ A = \begin{bmatrix} 0 & 1 & 1 \\ 1 & 5 & 2 \\ -1 & -4 & -2 \end{bmatrix}, \quad B = \begin{bmatrix} 0 \\ 1 \\ -1 \end{bmatrix}. &#92;]</span>

Again targeting eigenvalues <span>&#92;(-1, -2 \pm j&#92;)</span> with characteristic polynomial <span>&#92;(\lambda^3 + 5\lambda^2 + 9\lambda + 5&#92;)</span>, with <span>&#92;(K = [k_0 \;\; k_1 \;\; k_2]&#92;)</span> one computes

<span>&#92;[ \det(\lambda I - (A + BK)) = \lambda^3 + (k_2 - k_1 - 3)\lambda^2 + (-k_2 - 2)\lambda + (-k_0 - 1). &#92;]</span>

Matching gives <span>&#92;(k_0 = -6, \; k_1 = -19, \; k_2 = -11&#92;)</span>.

**Remark 12.13.** For SISO systems, the gain matrix <span>&#92;(K&#92;)</span> for eigenvalue assignment is uniquely determined. In some textbooks the state feedback is written as <span>&#92;(u = -Kx&#92;)</span> rather than <span>&#92;(u = Kx&#92;)</span>, leading to the closed-loop matrix <span>&#92;(A - BK&#92;)</span> instead of <span>&#92;(A + BK&#92;)</span>. These are purely notational conventions and completely equivalent in content. Be aware that MATLAB's `place(A, B, P)` command uses the convention <span>&#92;(A - BK&#92;)</span> and returns <span>&#92;(K&#92;)</span> such that <span>&#92;(A - BK&#92;)</span> has eigenvalues listed in the vector `P`.
## Week 7: Detectability and External Stability

### Lecture 13: Detectability and Stabilization by Output Feedback

In previous lectures we examined how state feedback of the form <span>&#92;( u = Kx &#92;)</span> can be used to stabilize a linear time-invariant (LTI) system. In many practical situations, however, it is impossible or prohibitively expensive to measure the full state vector. This lecture addresses how stabilization can still be achieved when only the output <span>&#92;( y &#92;)</span> is accessible, by coupling a state estimator — called an **observer** — with a state-feedback controller.

#### Observers and the Estimation Error

Suppose the governing state equation is <span>&#92;( x'(t) = Ax(t) + Bu(t) &#92;)</span> and we use it directly to build a copy of the dynamics:

<span>&#92;[
\hat{x}' = A\hat{x} + Bu. \tag{13.1}
&#92;]</span>

This system, driven by the same input <span>&#92;( u &#92;)</span> but without correction from observations, is the simplest **state observer** (or **state estimator**). To assess how well <span>&#92;( \hat{x} &#92;)</span> tracks the true state, define the **estimation error**

<span>&#92;[
e = \hat{x} - x. \tag{13.2}
&#92;]</span>

Differentiating and substituting the state equation yields

<span>&#92;[
e' = \hat{x}' - x' = A\hat{x} + Bu - (Ax + Bu) = A(\hat{x} - x) = Ae.
&#92;]</span>

If <span>&#92;( A &#92;)</span> is Hurwitz, then <span>&#92;( e(t) \to 0 &#92;)</span> as <span>&#92;( t \to \infty &#92;)</span>, and the observer provides an asymptotically accurate estimate of the true state. When <span>&#92;( A &#92;)</span> is not Hurwitz, however, this open-loop observer fails to converge.

To remedy this, we exploit the measured output. Let <span>&#92;( y = Cx + Du &#92;)</span> be the observed output and <span>&#92;( \hat{y} = C\hat{x} + Du &#92;)</span> the output predicted by the estimator. The discrepancy <span>&#92;( \hat{y} - y &#92;)</span> is fed back to correct the estimator:

<span>&#92;[
\hat{x}' = A\hat{x} + Bu + L(\hat{y} - y), \tag{13.3}
&#92;]</span>

where <span>&#92;( L &#92;)</span> is the **observer gain** matrix, to be designed. Because <span>&#92;( \hat{y} - y = C\hat{x} - Cx = Ce &#92;)</span>, the error dynamics become

<span>&#92;[
e' = \hat{x}' - x' = A\hat{x} + Bu + L(\hat{y} - y) - (Ax + Bu) = (A + LC)e. \tag{13.4}
&#92;]</span>

The estimation error converges to zero asymptotically if and only if <span>&#92;( A + LC &#92;)</span> is Hurwitz. The central question is therefore: can we find a matrix <span>&#92;( L &#92;)</span> such that <span>&#92;( A + LC &#92;)</span> has all eigenvalues strictly in the open left-half plane?

#### Detectability

This question is precisely the dual of stabilizability. Recall that <span>&#92;( (A, B) &#92;)</span> is stabilizable if and only if there exists a matrix <span>&#92;( K &#92;)</span> such that <span>&#92;( A + BK &#92;)</span> is Hurwitz. By analogy we make the following definition.

**Definition 13.1 (Detectability).** We call <span>&#92;( (A, C) &#92;)</span> **detectable** if there exists some matrix <span>&#92;( L &#92;)</span> such that <span>&#92;( A + LC &#92;)</span> is Hurwitz.

The precise duality between stabilizability and detectability is captured in the next result.

**Proposition 13.2.** The pair <span>&#92;( (A, B) &#92;)</span> is stabilizable if and only if <span>&#92;( (A^T, B^T) &#92;)</span> is detectable.

*Proof.* The pair <span>&#92;( (A, B) &#92;)</span> is stabilizable if and only if there exists a matrix <span>&#92;( K &#92;)</span> such that <span>&#92;( A + BK &#92;)</span> is Hurwitz. Since a matrix is Hurwitz if and only if its transpose is Hurwitz, <span>&#92;( A + BK &#92;)</span> is Hurwitz if and only if <span>&#92;( A^T + K^T B^T &#92;)</span> is Hurwitz. Setting <span>&#92;( L = K^T &#92;)</span> shows this is precisely the definition of <span>&#92;( (A^T, B^T) &#92;)</span> being detectable. <span>&#92;( \square &#92;)</span>

This duality immediately transfers the algebraic characterizations of stabilizability to detectability.

**Theorem 13.3 (Detectability).** The following statements are equivalent:

1. <span>&#92;( (A, C) &#92;)</span> is detectable.
2. The unobservable part <span>&#92;( A_u &#92;)</span> of the system (if it exists) is Hurwitz.
3. **(PBH test)** For every complex number <span>&#92;( \lambda &#92;)</span> with <span>&#92;( \mathrm{Re}(\lambda) \geq 0 &#92;)</span>,

<span>&#92;[
\mathrm{rank}\begin{bmatrix} A - \lambda I \\ C \end{bmatrix} = n.
&#92;]</span>

The equivalence of these conditions follows by duality from the corresponding characterizations of stabilizability (via the PBH test and the Kalman decomposition). Condition 2 says that any mode which cannot be observed must at least be stable on its own. Condition 3 says that the only modes that can be "hidden" from the output — those for which the rank drops — must lie in the stable left-half plane.

#### Stabilization by Output Feedback

With an observer in hand, we can construct a state-feedback law that uses the estimated state in place of the true state. Set

<span>&#92;[
u = K\hat{x}, \tag{13.5}
&#92;]</span>

where <span>&#92;( \hat{x} &#92;)</span> is generated by the observer (13.3). Substituting into the state equation and writing <span>&#92;( \hat{x} = x + e &#92;)</span> gives

<span>&#92;[
x' = Ax + Bu = Ax + BK\hat{x} = Ax + BK(x + e) = (A + BK)x + BKe.
&#92;]</span>

Combining this with the error dynamics <span>&#92;( e' = (A + LC)e &#92;)</span> from (13.4), the closed-loop system is

<span>&#92;[&#92;begin{aligned}
\begin{bmatrix} x' \\ e' \end{bmatrix} = \begin{bmatrix} A + BK & BK \\ 0 & A + LC \end{bmatrix} \begin{bmatrix} x \\ e \end{bmatrix}. \tag{13.6}
&#92;end{aligned}&#92;]</span>

Because the closed-loop matrix is block upper triangular, its characteristic polynomial factors as the product of the characteristic polynomials of the two diagonal blocks. This observation is the content of the following fundamental theorem.

**Theorem 13.4 (Separation Principle).** The closed-loop system (13.6) has characteristic polynomial

<span>&#92;[
\lambda(s) = \det(sI - (A + BK)) \cdot \det(sI - (A + LC)).
&#92;]</span>

Consequently, the eigenvalues of the closed-loop system are precisely the union of the eigenvalues of <span>&#92;( A + BK &#92;)</span> (determined by the state-feedback gain <span>&#92;( K &#92;)</span>) and the eigenvalues of <span>&#92;( A + LC &#92;)</span> (determined by the observer gain <span>&#92;( L &#92;)</span>). The separation principle allows the controller design and the observer design to be carried out **independently**.

**Corollary 13.5 (Stabilization by Output Feedback).** If <span>&#92;( (A, B) &#92;)</span> is stabilizable and <span>&#92;( (A, C) &#92;)</span> is detectable, then the output feedback law (13.5) with the observer (13.3) stabilizes the system.

Under the stronger assumption of full controllability and observability, eigenvalue placement is entirely free.

**Theorem 13.6 (Eigenvalue Assignment by Output Feedback).** If <span>&#92;( (A, B) &#92;)</span> is controllable and <span>&#92;( (A, C) &#92;)</span> is observable, then any desired characteristic polynomial for the closed-loop system (13.6) can be achieved by appropriate choice of the gain matrices <span>&#92;( K &#92;)</span> and <span>&#92;( L &#92;)</span>.

**Example 13.7.** Consider the double-integrator system

<span>&#92;[
x' = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix} x + \begin{bmatrix} 0 \\ 1 \end{bmatrix} u, \qquad y = \begin{bmatrix} 1 & 0 \end{bmatrix} x. \tag{13.7, 13.8}
&#92;]</span>

The controllability matrix is <span>&#92;( \begin{bmatrix} B & AB \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ 1 & 0 \end{bmatrix} &#92;)</span>, which has rank 2, so the system is controllable. The observability matrix is <span>&#92;( \begin{bmatrix} C \\ CA \end{bmatrix} = \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} &#92;)</span>, which also has rank 2, so the system is observable.

To illustrate the design procedure, choose <span>&#92;( L = \begin{bmatrix} \ell_1 \\ \ell_2 \end{bmatrix} &#92;)</span>. Then

<span>&#92;[
A + LC = \begin{bmatrix} \ell_1 & 1 \\ \ell_2 & 0 \end{bmatrix},
&#92;]</span>

with characteristic polynomial <span>&#92;( s^2 - \ell_1 s - \ell_2 &#92;)</span>. By choosing <span>&#92;( \ell_1 &#92;)</span> and <span>&#92;( \ell_2 &#92;)</span> appropriately, any degree-2 polynomial can be achieved. Similarly, with <span>&#92;( K = \begin{bmatrix} k_1 & k_2 \end{bmatrix} &#92;)</span>,

<span>&#92;[
A + BK = \begin{bmatrix} 0 & 1 \\ k_1 & k_2 \end{bmatrix},
&#92;]</span>

with characteristic polynomial <span>&#92;( s^2 - k_2 s - k_1 &#92;)</span>. Again any desired polynomial is achievable. The closed-loop system resulting from this procedure is called **observer-based dynamic output feedback**, because the output is processed via a dynamic state estimator rather than fed back directly.

#### Static Output Feedback

A natural follow-up question is whether one can dispense with the dynamic observer entirely and use a **static output feedback** law <span>&#92;( u = KCx &#92;)</span>, seeking a gain <span>&#92;( K &#92;)</span> such that <span>&#92;( A + BKC &#92;)</span> is Hurwitz. Remarkably, this question — known as the **stabilization by static output feedback problem** — remains one of the fundamental open problems in control theory. Its difficulty is believed to be rooted in deep combinatorial complexity; in particular, pole placement via static output feedback has been shown to be NP-hard in general.

---

### Lecture 14: External Stability

The preceding lectures established a theory of **internal stability**: conditions on the system matrix <span>&#92;( A &#92;)</span> (or the poles of the state-space realization) that guarantee the free response decays to zero. We now turn to **external stability**, also called **input-output stability**, which characterizes how the magnitude of the output signal is bounded relative to the magnitude of the input signal when the initial conditions are set to zero. An externally stable system produces well-behaved outputs for all well-behaved inputs.

#### Signal Norms and <span>&#92;( L^p &#92;)</span> Spaces

To make precise what "well-behaved" means, we assign norms to signals. First recall that the **<span>&#92;( p &#92;)</span>-norm** of a vector <span>&#92;( x \in \mathbb{R}^k &#92;)</span> is

**Definition 14.8.** For <span>&#92;( p \geq 1 &#92;)</span>, the <span>&#92;( p &#92;)</span>-norm of a vector <span>&#92;( x \in \mathbb{R}^k &#92;)</span> is

<span>&#92;[
\|x\|_p = \left( \sum_{i=1}^k |x_i|^p \right)^{1/p}.
&#92;]</span>

The case <span>&#92;( p = 2 &#92;)</span> is the **Euclidean norm**, written simply as <span>&#92;( \|x\| &#92;)</span>. The **infinity norm** (or maximum norm) is

<span>&#92;[
\|x\|_\infty = \max_{1 \leq i \leq k} |x_i|.
&#92;]</span>

These vector norms extend to signal norms for functions <span>&#92;( u : [0,\infty) \to \mathbb{R}^k &#92;)</span>.

**Definition 14.9.** Let <span>&#92;( u : [0,\infty) \to \mathbb{R}^k &#92;)</span>. Define

<span>&#92;[&#92;begin{aligned}
\|u\|_\infty &= \sup_{t \geq 0} \|u(t)\|_\infty = \sup_{t \geq 0} \max_{1 \leq i \leq k} |u_i(t)|, \\[6pt]
\|u\|_2 &= \sqrt{\int_0^\infty \|u(t)\|_2^2\, dt} = \sqrt{\int_0^\infty u^T(t)u(t)\, dt}, \\[6pt]
\|u\|_1 &= \int_0^\infty \|u(t)\|_1\, dt = \int_0^\infty \sum_{i=1}^k |u_i(t)|\, dt.
&#92;end{aligned}&#92;]</span>

More generally, for <span>&#92;( 1 \leq p < \infty &#92;)</span>,

<span>&#92;[
\|u\|_p = \left( \int_0^\infty \|u(t)\|_p^p\, dt \right)^{1/p} = \left( \int_0^\infty \sum_{i=1}^k |u_i(t)|^p\, dt \right)^{1/p}.
&#92;]</span>

The signal space <span>&#92;( L^p[0,\infty) &#92;)</span> consists of all signals with finite <span>&#92;( \|\cdot\|_p &#92;)</span>.

**Definition 14.10 (<span>&#92;( L^p &#92;)</span>-stability).** An LTI system is **<span>&#92;( L^p &#92;)</span>-stable** if there exists a constant <span>&#92;( \gamma &#92;)</span> such that

<span>&#92;[
\|y\|_p \leq \gamma \|u\|_p
&#92;]</span>

for all input-output pairs <span>&#92;( u, y &#92;)</span> with zero initial condition.

**Remark 14.11.** The constant <span>&#92;( \gamma &#92;)</span> is an upper bound on the **<span>&#92;( L^p &#92;)</span>-gain** of the system; the gain itself is the infimum of all such constants. For finite-dimensional LTI systems, all notions of <span>&#92;( L^p &#92;)</span>-stability (for different <span>&#92;( p &#92;)</span>) turn out to be equivalent, although the corresponding gains may differ.

#### BIBO Stability

Because all <span>&#92;( L^p &#92;)</span>-stability notions are equivalent for LTI systems, we focus on the case <span>&#92;( p = \infty &#92;)</span>, which yields **bounded-input, bounded-output (BIBO) stability**. A system is BIBO stable if every bounded input produces a bounded output (from zero initial conditions). The terminology "input-output stability" and "external stability" are used interchangeably with BIBO stability throughout this course.

#### Time-Domain Conditions for BIBO Stability

Recall that the zero-state output is given by the convolution

<span>&#92;[
y(t) = \int_0^t g(t - \tau) u(\tau)\, d\tau,
&#92;]</span>

where the **impulse response** is

<span>&#92;[
g(t) = Ce^{At}B + D\delta(t).
&#92;]</span>

**Theorem 14.12.** The LTI system <span>&#92;( (A, B, C, D) &#92;)</span> is BIBO stable if and only if every entry of <span>&#92;( g(t) &#92;)</span> is absolutely integrable, i.e.,

<span>&#92;[
\int_0^\infty |g_{ij}(t)|\, dt < \infty
&#92;]</span>

for all <span>&#92;( 1 \leq i \leq m &#92;)</span> and <span>&#92;( 1 \leq j \leq k &#92;)</span>.

*Proof.* (<span>&#92;( \Leftarrow &#92;)</span>) Suppose each entry of <span>&#92;( g &#92;)</span> is absolutely integrable. Then

<span>&#92;[&#92;begin{aligned}
\|y(t)\|_\infty &= \left\| \int_0^t g(t-\tau) u(\tau)\, d\tau \right\|_\infty \\
&= \max_{1 \leq i \leq m} \left| \int_0^t \sum_{j=1}^k g_{ij}(t-\tau) u_j(\tau)\, d\tau \right| \\
&\leq \max_{1 \leq i \leq m} \int_0^t \sum_{j=1}^k |g_{ij}(t-\tau)|\, |u_j(\tau)|\, d\tau \\
&\leq \max_{1 \leq i \leq m} \int_0^t \sum_{j=1}^k |g_{ij}(t-\tau)|\, d\tau \cdot \sup_{\tau \geq 0} \max_{1 \leq j \leq k} |u_j(\tau)| \\
&\leq \max_{1 \leq i \leq m} \sum_{j=1}^k \int_0^\infty |g_{ij}(\tau)|\, d\tau \cdot \|u\|_\infty.
&#92;end{aligned}&#92;]</span>

Setting <span>&#92;( \gamma = \max_{1 \leq i \leq m} \sum_{j=1}^k \int_0^\infty |g_{ij}(t)|\, dt &#92;)</span>, which is finite by assumption, we obtain <span>&#92;( \|y\|_\infty \leq \gamma \|u\|_\infty &#92;)</span>, so the system is BIBO stable.

(<span>&#92;( \Rightarrow &#92;)</span>) Suppose instead that <span>&#92;( \int_0^\infty |g_{ij}(t)|\, dt &#92;)</span> diverges for some indices <span>&#92;( i, j &#92;)</span>. Then for each <span>&#92;( M > 0 &#92;)</span> there exists <span>&#92;( t > 0 &#92;)</span> such that <span>&#92;( \int_0^t |g_{ij}(\tau)|\, d\tau > M &#92;)</span>. Fix such a <span>&#92;( t &#92;)</span> and define the bounded input

<span>&#92;[
u(\tau) = \begin{cases} e_j & \text{if } g_{ij}(t-\tau) \geq 0, \\ -e_j & \text{if } g_{ij}(t-\tau) < 0, \end{cases}
&#92;]</span>

where <span>&#92;( e_j &#92;)</span> is the standard basis vector in <span>&#92;( \mathbb{R}^k &#92;)</span> with 1 in position <span>&#92;( j &#92;)</span>. Then the <span>&#92;( i &#92;)</span>-th component of the output satisfies <span>&#92;( y_i(t) = \int_0^t |g_{ij}(\tau)|\, d\tau > M &#92;)</span>. Setting <span>&#92;( u(\tau) = 0 &#92;)</span> for <span>&#92;( \tau \geq t &#92;)</span> gives <span>&#92;( \|u\|_\infty = 1 &#92;)</span> yet <span>&#92;( \|y\|_\infty > M &#92;)</span>. Since <span>&#92;( M &#92;)</span> is arbitrary, the system is not BIBO stable. <span>&#92;( \square &#92;)</span>

**Remark 14.13.** Suppose the system is BIBO stable, so <span>&#92;( \gamma = \max_{1 \leq i \leq m} \sum_{j=1}^k \int_0^\infty |g_{ij}(t)|\, dt < \infty &#92;)</span>. For any <span>&#92;( \varepsilon > 0 &#92;)</span>, one can construct an input with <span>&#92;( \|u\|_\infty = 1 &#92;)</span> such that <span>&#92;( \|y\|_\infty > \gamma - \varepsilon &#92;)</span>, by choosing input signs to align with the sign of each <span>&#92;( g_{ij} &#92;)</span> entry. This shows that <span>&#92;( \gamma &#92;)</span> as defined is exactly the <span>&#92;( L^\infty &#92;)</span>-gain of the system — the smallest constant for which <span>&#92;( \|y\|_\infty \leq \gamma \|u\|_\infty &#92;)</span> holds.

**Corollary 14.14.** If <span>&#92;( A &#92;)</span> is Hurwitz (i.e., the system is internally stable), then the system is BIBO stable.

*Proof.* Since <span>&#92;( g(t) = Ce^{At}B + D\delta(t) &#92;)</span> and <span>&#92;( A &#92;)</span> Hurwitz implies the entries of <span>&#92;( e^{At} &#92;)</span> decay exponentially, each entry <span>&#92;( g_{ij}(t) &#92;)</span> is absolutely integrable on <span>&#92;( [0,\infty) &#92;)</span>. The conclusion follows from Theorem 14.12. <span>&#92;( \square &#92;)</span>

The converse of Corollary 14.14 is false in general, as the following example demonstrates.

**Example 14.15.** Consider the system

<span>&#92;[
x' = \begin{bmatrix} 2 & 0 \\ 0 & -1 \end{bmatrix} x + \begin{bmatrix} 0 \\ 1 \end{bmatrix} u, \qquad y = \begin{bmatrix} 1 & 1 \end{bmatrix} x.
&#92;]</span>

The matrix exponential is <span>&#92;( e^{At} = \begin{bmatrix} e^{2t} & 0 \\ 0 & e^{-t} \end{bmatrix} &#92;)</span>, and the impulse response entry is

<span>&#92;[
Ce^{At}B = \begin{bmatrix} 1 & 1 \end{bmatrix} \begin{bmatrix} e^{2t} & 0 \\ 0 & e^{-t} \end{bmatrix} \begin{bmatrix} 0 \\ 1 \end{bmatrix} = e^{-t}.
&#92;]</span>

Since <span>&#92;( e^{-t} &#92;)</span> is absolutely integrable, the system is BIBO stable by Theorem 14.12. However, the eigenvalue <span>&#92;( \lambda = 2 &#92;)</span> of <span>&#92;( A &#92;)</span> lies in the right-half plane, so the system is not internally stable. The unstable mode at <span>&#92;( s = 2 &#92;)</span> is hidden from the input-output map because of a structural pole-zero cancellation in the transfer function.

#### Frequency-Domain Conditions for BIBO Stability

Taking the Laplace transform, the transfer matrix is

<span>&#92;[
G(s) = \mathcal{L}[g(t)] = C(sI - A)^{-1}B + D.
&#92;]</span>

Each scalar entry <span>&#92;( G_{ij}(s) &#92;)</span> can be written in partial fraction form with poles <span>&#92;( p_1, p_2, \ldots, p_r &#92;)</span>. Its inverse Laplace transform <span>&#92;( g_{ij}(t) &#92;)</span> involves terms of the form <span>&#92;( t^k e^{p_\ell t} &#92;)</span>, which are absolutely integrable on <span>&#92;( [0,\infty) &#92;)</span> if and only if <span>&#92;( \mathrm{Re}(p_\ell) < 0 &#92;)</span>. This analysis yields the frequency-domain characterization.

**Theorem 14.16.** The LTI system <span>&#92;( (A, B, C, D) &#92;)</span> is BIBO stable if and only if all poles of <span>&#92;( G(s) &#92;)</span> (meaning all poles of every entry <span>&#92;( G_{ij}(s) &#92;)</span>) have negative real parts.

**Example 14.17.** For the system of Example 14.15 with <span>&#92;( A = \begin{bmatrix} 2 & 0 \\ 0 & -1 \end{bmatrix} &#92;)</span>, <span>&#92;( B = \begin{bmatrix} 0 \\ 1 \end{bmatrix} &#92;)</span>, <span>&#92;( C = \begin{bmatrix} 1 & 1 \end{bmatrix} &#92;)</span>, <span>&#92;( D = 0 &#92;)</span>, the transfer function is

<span>&#92;[
G(s) = C(sI - A)^{-1}B = \begin{bmatrix} 1 & 1 \end{bmatrix} \frac{1}{(s-2)(s+1)} \begin{bmatrix} s+1 & 0 \\ 0 & s-2 \end{bmatrix} \begin{bmatrix} 0 \\ 1 \end{bmatrix} = \frac{s-2}{(s-2)(s+1)} = \frac{1}{s+1}.
&#92;]</span>

The only pole is at <span>&#92;( p = -1 &#92;)</span>, so the system is BIBO stable, consistent with Example 14.15. The pole at <span>&#92;( s = 2 &#92;)</span> cancelled with the zero at <span>&#92;( s = 2 &#92;)</span> in the transfer function.

**Corollary 14.18.** If <span>&#92;( (A, B, C, D) &#92;)</span> is a **minimal realization** (i.e., both controllable and observable), then BIBO stability is equivalent to internal stability.

In a minimal realization there are no hidden pole-zero cancellations: every eigenvalue of <span>&#92;( A &#92;)</span> appears as a pole of <span>&#92;( G(s) &#92;)</span>. The equivalence then follows from Theorems 14.12 and 14.16. When a realization is non-minimal, unstable modes may be cancelled in the transfer function (as in Example 14.15), making BIBO stability a strictly weaker property than internal stability.

---

## Week 8: Closed-loop Stability and Nyquist Criterion

### Lecture 15: Closed-loop Stability

Having established the foundations of state-space analysis and design, we now shift to **frequency-domain** analysis. The central goal remains ensuring stability of the closed-loop system when a controller is placed in feedback around a plant.

#### The Unity Feedback Configuration

Consider the standard unity feedback configuration in which a controller with transfer function <span>&#92;( C(s) &#92;)</span> is placed in series with a plant <span>&#92;( P(s) &#92;)</span>. The exogenous signals driving the system are the **reference input** <span>&#92;( r &#92;)</span>, the **plant disturbance** <span>&#92;( d &#92;)</span>, and the **measurement noise** <span>&#92;( n &#92;)</span>. The internal signals are:

- <span>&#92;( e &#92;)</span>: tracking error,
- <span>&#92;( u &#92;)</span>: control signal,
- <span>&#92;( v &#92;)</span>: actuating signal entering the plant,
- <span>&#92;( \eta &#92;)</span>: plant output (the physical variable to be controlled),
- <span>&#92;( y &#92;)</span>: measured output signal.

The transfer function <span>&#92;( C(s) &#92;)</span> maps <span>&#92;( e &#92;)</span> to <span>&#92;( u &#92;)</span>, and <span>&#92;( P(s) &#92;)</span> maps <span>&#92;( v &#92;)</span> to <span>&#92;( \eta &#92;)</span>. All signals are treated in the <span>&#92;( s &#92;)</span>-domain.

**Example 15.1.** To compute the transfer function from <span>&#92;( r &#92;)</span> to <span>&#92;( y &#92;)</span>, trace signals around the loop:

<span>&#92;[
e = r - y, \quad u = Ce, \quad v = u + d, \quad \eta = Pv, \quad y = \eta + n.
&#92;]</span>

Substituting gives <span>&#92;( y = P(C(r - y) + d) + n &#92;)</span>, so

<span>&#92;[
y = \frac{PC}{1+PC}\, r + \frac{1}{1+PC}\, n + \frac{P}{1+PC}\, d.
&#92;]</span>

The transfer function from <span>&#92;( r &#92;)</span> to <span>&#92;( y &#92;)</span> is therefore <span>&#92;( G_{yr}(s) = \frac{PC}{1+PC} &#92;)</span>, and as by-products we obtain <span>&#92;( G_{yn}(s) = \frac{1}{1+PC} &#92;)</span> and <span>&#92;( G_{yd}(s) = \frac{P}{1+PC} &#92;)</span>.

#### The Gang of Four

By similar loop-tracing arguments, one can compute all transfer functions from <span>&#92;( (r, d, n) &#92;)</span> to every signal of interest <span>&#92;( (y, \eta, v, u, e) &#92;)</span>. The full matrix of 15 transfer functions is actually determined by just four fundamental functions, sometimes called the **gang of four**:

- The **sensitivity function** <span>&#92;( S = \dfrac{1}{1+PC} &#92;)</span>, which measures how a relative change in the plant affects the closed-loop behavior. Indeed, computing <span>&#92;( \frac{dT/T}{dP/P} &#92;)</span> where <span>&#92;( T = \frac{PC}{1+PC} &#92;)</span> gives exactly <span>&#92;( S &#92;)</span>.

- The **complementary sensitivity function** <span>&#92;( T = \dfrac{PC}{1+PC} &#92;)</span>, so named because <span>&#92;( T + S = 1 &#92;)</span>.

- The **load sensitivity function** <span>&#92;( \dfrac{P}{1+PC} = PS &#92;)</span> (transfer from disturbance <span>&#92;( d &#92;)</span> to output <span>&#92;( y &#92;)</span>).

- The **noise sensitivity function** <span>&#92;( \dfrac{C}{1+PC} = CS &#92;)</span> (transfer from noise <span>&#92;( n &#92;)</span> to control signal <span>&#92;( u &#92;)</span>).

**Definition 15.2.** The system depicted in the unity feedback configuration is **closed-loop stable** if all four transfer functions <span>&#92;( S &#92;)</span>, <span>&#92;( T &#92;)</span>, <span>&#92;( PS &#92;)</span>, and <span>&#92;( CS &#92;)</span> are BIBO stable, i.e., all their poles lie in the open left-half plane.

#### The Characteristic Polynomial

Let <span>&#92;( P(s) = n_p(s)/d_p(s) &#92;)</span> and <span>&#92;( C(s) = n_c(s)/d_c(s) &#92;)</span> where each pair is coprime. Define the **characteristic polynomial**

<span>&#92;[
\kappa(s) = n_p(s)n_c(s) + d_p(s)d_c(s).
&#92;]</span>

**Theorem 15.3 (Closed-loop Stability).** The system is closed-loop stable if and only if all zeros of <span>&#92;( \kappa(s) &#92;)</span> have negative real parts.

*Proof.* (<span>&#92;( \Leftarrow &#92;)</span>) All poles of the four gang-of-four transfer functions are zeros of <span>&#92;( \kappa &#92;)</span>, so if all zeros of <span>&#92;( \kappa &#92;)</span> lie in the open LHP, all four are stable.

(<span>&#92;( \Rightarrow &#92;)</span>) We show that every zero of <span>&#92;( \kappa &#92;)</span> is actually a pole of at least one of the four transfer functions. Writing them in terms of <span>&#92;( \kappa &#92;)</span>,

<span>&#92;[&#92;begin{aligned}
S &= \frac{d_p d_c}{\kappa}, &\quad T &= \frac{n_p n_c}{\kappa}, \\
PS &= \frac{n_p d_c}{\kappa}, &\quad CS &= \frac{n_c d_p}{\kappa}.
&#92;end{aligned}&#92;]</span>

Let <span>&#92;( s_0 &#92;)</span> be a zero of <span>&#92;( \kappa &#92;)</span>. If <span>&#92;( s_0 &#92;)</span> were not a pole of any of the four functions, then all four numerators would vanish at <span>&#92;( s_0 &#92;)</span>, giving <span>&#92;( d_p(s_0)d_c(s_0) = 0 &#92;)</span>, <span>&#92;( n_p(s_0)n_c(s_0) = 0 &#92;)</span>, etc. But <span>&#92;( d_p(s_0) = 0 &#92;)</span> implies <span>&#92;( n_p(s_0) \neq 0 &#92;)</span> (by coprimeness), which forces <span>&#92;( n_c(s_0) = 0 &#92;)</span> and also <span>&#92;( d_c(s_0) = 0 &#92;)</span>, contradicting the coprimeness of <span>&#92;( (n_c, d_c) &#92;)</span>. The same contradiction arises from <span>&#92;( d_c(s_0) = 0 &#92;)</span>. Hence <span>&#92;( s_0 &#92;)</span> must be a pole of at least one transfer function. <span>&#92;( \square &#92;)</span>

#### PID and PI Controllers

**Example 15.4 (PI Controller).** A **PID controller** in the time domain has the form

<span>&#92;[
u(t) = k_p e(t) + k_i \int_0^t e(\tau)\, d\tau + k_d \frac{de}{dt},
&#92;]</span>

with transfer function

<span>&#92;[
C_{\mathrm{pid}}(s) = k_p + \frac{k_i}{s} + k_d s.
&#92;]</span>

The special case with <span>&#92;( k_d = 0 &#92;)</span> is the **PI controller**,

<span>&#92;[
C_{\mathrm{pi}}(s) = k_p + \frac{k_i}{s} = \frac{k_p s + k_i}{s}.
&#92;]</span>

For a first-order plant <span>&#92;( P(s) = b/(s+a) &#92;)</span>, the characteristic polynomial becomes

<span>&#92;[
\kappa(s) = s(s+a) + b(k_p s + k_i) = s^2 + (a + bk_p)s + bk_i.
&#92;]</span>

Provided <span>&#92;( b \neq 0 &#92;)</span>, the coefficients <span>&#92;( k_p &#92;)</span> and <span>&#92;( k_i &#92;)</span> can be chosen to achieve any desired degree-2 characteristic polynomial.

#### Routh–Hurwitz Stability Criterion

The **Routh–Hurwitz criterion** provides an algebraic test — without computing roots explicitly — for whether all roots of a polynomial lie in the open LHP. Given a polynomial

<span>&#92;[
p(s) = a_n s^n + a_{n-1} s^{n-1} + \cdots + a_1 s + a_0,
&#92;]</span>

construct the **Routh table** (also called the Routh–Hurwitz table) as follows. The first two rows are filled with alternating coefficients:

<span>&#92;[&#92;begin{aligned}
&\text{Row 1:} \quad a_n,\; a_{n-2},\; a_{n-4},\; \ldots \\
&\text{Row 2:} \quad a_{n-1},\; a_{n-3},\; a_{n-5},\; \ldots
&#92;end{aligned}&#92;]</span>

Each subsequent entry <span>&#92;( \star &#92;)</span> is computed from the four surrounding entries <span>&#92;( x, y &#92;)</span> (row above) and <span>&#92;( z, w &#92;)</span> (current row) by

<span>&#92;[
\star = -\frac{1}{z} \begin{vmatrix} x & y \\ z & w \end{vmatrix}.
&#92;]</span>

Missing entries are replaced by zero.

**Theorem 15.5 (Routh–Hurwitz Stability Criterion).** All roots of <span>&#92;( p(s) &#92;)</span> are in the open LHP (i.e., have negative real parts) if and only if all entries in the first column of the Routh table have the same sign.

The number of sign changes in the first column equals the number of roots with positive real parts.

**Example 15.6.** Consider <span>&#92;( p(s) = s^4 + s^3 + 2s + 1 &#92;)</span>. The Routh table is

<span>&#92;[
\begin{array}{cccc}
1 & 2 \\
1 & 1 \\
1 & 0 \\
1 & 0
\end{array}
&#92;]</span>

All entries in the first column are positive, so by the Routh–Hurwitz criterion all roots have negative real parts.

**Example 15.7.** Consider <span>&#92;( p(s) = s^4 + s^3 + 2s + 2 &#92;)</span>. The Routh table begins

<span>&#92;[
\begin{array}{cc}
1 & 2 \\
1 & 2 \\
0 & \cdots
\end{array}
&#92;]</span>

A zero appears in the first column, indicating that not all roots have negative real parts; the system fails the stability test.

**Example 15.8.** For a general degree-2 polynomial <span>&#92;( p(s) = s^2 + a_1 s + a_0 &#92;)</span>, the Routh table is

<span>&#92;[
\begin{array}{cc}
1 & a_0 \\
a_1 & 0 \\
a_0 & 0
\end{array}
&#92;]</span>

The first-column entries are <span>&#92;( 1, a_1, a_0 &#92;)</span>. All have the same sign if and only if <span>&#92;( a_0 > 0 &#92;)</span> and <span>&#92;( a_1 > 0 &#92;)</span>. This is the familiar necessary-and-sufficient stability condition for a second-order system.

**Example 15.9.** For a degree-3 polynomial <span>&#92;( p(s) = s^3 + a_2 s^2 + a_1 s + a_0 &#92;)</span>, the Routh table is

<span>&#92;[
\begin{array}{cc}
1 & a_1 \\
a_2 & a_0 \\
\frac{a_1 a_2 - a_0}{a_2} & 0 \\
a_0 & 0
\end{array}
&#92;]</span>

All roots have negative real parts if and only if <span>&#92;( a_0 > 0 &#92;)</span>, <span>&#92;( a_2 > 0 &#92;)</span>, and <span>&#92;( a_0 < a_1 a_2 &#92;)</span>. In particular, the Routh–Hurwitz conditions require positivity of all coefficients as a necessary (but not sufficient for degree <span>&#92;( n \geq 3 &#92;)</span>) condition, plus additional determinantal inequalities.

---

### Lecture 16: Nyquist Criterion

The Routh–Hurwitz criterion tells us whether the roots of the characteristic polynomial lie in the open LHP, but it offers limited geometric insight into why a system is unstable or how to modify the controller. The **Nyquist criterion** addresses this gap by providing a graphical tool that reveals the relationship between the loop transfer function and closed-loop stability.

#### The Loop Transfer Function

Feedback can destabilize a system that would otherwise be stable in open loop. The **loop transfer function** captures the cumulative gain and phase accumulated by a signal traversing the entire feedback loop.

**Definition 16.10 (Loop Transfer Function).** For the unity feedback configuration, the function

<span>&#92;[
L(s) = P(s)C(s)
&#92;]</span>

is called the **loop transfer function**.

The loop transfer function has a clear physical interpretation: if the feedback loop is broken at some point, <span>&#92;( L(s) &#92;)</span> is the transfer function from the break point input to the break point output (multiplied by <span>&#92;( -1 &#92;)</span> to account for the negative feedback sign). In particular, if <span>&#92;( L(j\omega) = -1 &#92;)</span> for some frequency <span>&#92;( \omega &#92;)</span>, then a sinusoidal signal injected at the break point returns with exactly the same amplitude and phase, leading to sustained oscillations. This makes the **critical point** <span>&#92;( -1 &#92;)</span> in the complex plane the focal object of the Nyquist analysis.

While the characteristic polynomial <span>&#92;( \kappa(s) = d_p d_c + n_p n_c &#92;)</span> can always be used to check stability, the loop transfer function provides the additional insight needed for loop-shaping design: one can visualize directly how modifying the controller bends the Nyquist plot of <span>&#92;( L &#92;)</span> away from the critical point.

#### The Nyquist Contour and Nyquist Plot

**Definition 16.11 (Nyquist Contour).** The **Nyquist contour** <span>&#92;( \Gamma &#92;)</span> is a D-shaped contour enclosing the closed right-half plane of <span>&#92;( \mathbb{C} &#92;)</span>, consisting of:

1. The imaginary axis traversed from <span>&#92;( -j\infty &#92;)</span> to <span>&#92;( +j\infty &#92;)</span>.
2. A semicircular arc of radius <span>&#92;( R \to \infty &#92;)</span> connecting <span>&#92;( j\infty &#92;)</span> back to <span>&#92;( -j\infty &#92;)</span> through the right-half plane.
3. Small semicircular indentations of radius <span>&#92;( r \to 0 &#92;)</span> around any poles of <span>&#92;( L(s) &#92;)</span> that lie on the imaginary axis, detouring into the right-half plane to keep those poles outside the contour.

**Definition 16.12 (Nyquist Plot).** The **Nyquist plot** of the loop transfer function <span>&#92;( L(s) &#92;)</span> is the image in the complex plane traced by <span>&#92;( L(s) &#92;)</span> as <span>&#92;( s &#92;)</span> traverses the Nyquist contour <span>&#92;( \Gamma &#92;)</span>. In other words, it is the curve <span>&#92;( \{L(s) : s \in \Gamma\} \subset \mathbb{C} &#92;)</span>.

When <span>&#92;( L &#92;)</span> is strictly proper (degree of denominator exceeds degree of numerator), the portion of the Nyquist contour at infinity maps to the origin, since <span>&#92;( L(s) \to 0 &#92;)</span> as <span>&#92;( |s| \to \infty &#92;)</span>. The Nyquist plot is therefore effectively determined by the frequency response <span>&#92;( L(j\omega) &#92;)</span> for <span>&#92;( \omega \in (-\infty, \infty) &#92;)</span>. The positive-frequency portion (<span>&#92;( \omega > 0 &#92;)</span>) and negative-frequency portion (<span>&#92;( \omega < 0 &#92;)</span>) are complex conjugates of each other, so one typically plots <span>&#92;( L(j\omega) &#92;)</span> for <span>&#92;( \omega \geq 0 &#92;)</span> as the solid curve and its reflection as the dashed curve.

**Example 16.13.** For the loop transfer function <span>&#92;( L(s) = \dfrac{1}{(s+1)^3} &#92;)</span>, the Nyquist plot spirals from the point <span>&#92;( (1, 0) &#92;)</span> at <span>&#92;( \omega = 0 &#92;)</span>, spiraling inward and clockwise as <span>&#92;( \omega \to \infty &#92;)</span>. The critical point <span>&#92;( -1 &#92;)</span> is indicated with a marker. Nyquist plots can be generated in MATLAB with the command `nyquist(L)`.

#### Cauchy's Argument Principle

The Nyquist stability criterion is a corollary of the following classical result from complex analysis.

**Lemma 16.14 (Cauchy's Argument Principle).** Let <span>&#92;( D &#92;)</span> be a closed region in <span>&#92;( \mathbb{C} &#92;)</span> with boundary <span>&#92;( \Gamma &#92;)</span>. Assume the function <span>&#92;( f : \mathbb{C} \to \mathbb{C} &#92;)</span> is analytic in <span>&#92;( D &#92;)</span> and on <span>&#92;( \Gamma &#92;)</span>, except at a finite number of poles and zeros, and that <span>&#92;( f &#92;)</span> has no poles or zeros on <span>&#92;( \Gamma &#92;)</span> itself. Then the **winding number** <span>&#92;( w_n &#92;)</span> — the net number of times the image <span>&#92;( f(\Gamma) &#92;)</span> winds counterclockwise around the origin — satisfies

<span>&#92;[
w_n = \frac{1}{2\pi} \Delta_\Gamma \arg f(z) = \frac{1}{2\pi j} \oint_\Gamma \frac{f'(z)}{f(z)}\, dz = Z - P,
&#92;]</span>

where <span>&#92;( \Delta_\Gamma &#92;)</span> denotes the net change in argument as <span>&#92;( z &#92;)</span> traverses <span>&#92;( \Gamma &#92;)</span> counterclockwise, <span>&#92;( Z &#92;)</span> is the number of zeros of <span>&#92;( f &#92;)</span> inside <span>&#92;( D &#92;)</span>, and <span>&#92;( P &#92;)</span> is the number of poles of <span>&#92;( f &#92;)</span> inside <span>&#92;( D &#92;)</span> (each counted according to multiplicity).

The key insight is that encirclements of the origin by the image of <span>&#92;( f &#92;)</span> count the net excess of zeros over poles inside the contour.

#### The Nyquist Stability Criterion

We apply Cauchy's argument principle with <span>&#92;( f(s) = 1 + L(s) &#92;)</span> and <span>&#92;( \Gamma &#92;)</span> the Nyquist contour, which encloses the entire closed right-half plane. The zeros of <span>&#92;( 1 + L(s) &#92;)</span> in the RHP are exactly the RHP closed-loop poles, and encirclements of the origin by the image of <span>&#92;( 1 + L(s) &#92;)</span> correspond to encirclements of <span>&#92;( -1 &#92;)</span> by the image of <span>&#92;( L(s) &#92;)</span>.

**Theorem 16.15 (Nyquist Stability Criterion).** Consider a closed-loop system with loop transfer function <span>&#92;( L(s) &#92;)</span> having <span>&#92;( P &#92;)</span> poles in the region enclosed by the Nyquist contour <span>&#92;( \Gamma &#92;)</span> (i.e., in the closed RHP). Let <span>&#92;( N &#92;)</span> be the net number of **clockwise** encirclements of <span>&#92;( -1 &#92;)</span> by the Nyquist plot of <span>&#92;( L(s) &#92;)</span>. Assume there are no RHP pole-zero cancellations in forming <span>&#92;( L(s) = P(s)C(s) &#92;)</span> (i.e., <span>&#92;( d_p &#92;)</span> and <span>&#92;( n_c &#92;)</span> have no common RHP roots, and neither do <span>&#92;( d_c &#92;)</span> and <span>&#92;( n_p &#92;)</span>), and assume the Nyquist plot does not pass through <span>&#92;( -1 &#92;)</span>. Then the number of RHP poles of the closed-loop system is

<span>&#92;[
Z = N + P.
&#92;]</span>

*Proof.* We first establish that, under the no-cancellation assumption, the closed-loop poles are precisely the zeros of <span>&#92;( 1 + L(s) &#92;)</span> in the RHP. Any zero <span>&#92;( s_0 &#92;)</span> of <span>&#92;( 1 + L(s) &#92;)</span> satisfies

<span>&#92;[
0 = 1 + L(s_0) = 1 + \frac{n_p n_c}{d_p d_c} \implies \kappa(s_0) = d_p(s_0)d_c(s_0) + n_p(s_0)n_c(s_0) = 0,
&#92;]</span>

so <span>&#92;( s_0 &#92;)</span> is a closed-loop pole. Conversely, if <span>&#92;( \kappa(s_0) = 0 &#92;)</span> and there are no RHP cancellations, then <span>&#92;( d_p(s_0)d_c(s_0) \neq 0 &#92;)</span>, and dividing by <span>&#92;( d_p d_c &#92;)</span> gives <span>&#92;( 1 + L(s_0) = 0 &#92;)</span>.

Now apply Cauchy's argument principle to <span>&#92;( f(s) = 1 + L(s) &#92;)</span> on the Nyquist contour <span>&#92;( \Gamma &#92;)</span>. The winding number <span>&#92;( w_n = Z - P &#92;)</span> equals the number of counterclockwise encirclements of <span>&#92;( 0 &#92;)</span> by the image of <span>&#92;( 1 + L(s) &#92;)</span> as <span>&#92;( s &#92;)</span> traverses <span>&#92;( \Gamma &#92;)</span> counterclockwise. Equivalently, traversing <span>&#92;( \Gamma &#92;)</span> clockwise (as is conventional for the Nyquist contour), the net number of clockwise encirclements of <span>&#92;( 0 &#92;)</span> by the image of <span>&#92;( 1 + L(s) &#92;)</span> equals <span>&#92;( Z - P &#92;)</span>. Since the image of <span>&#92;( 1 + L(s) &#92;)</span> encircles <span>&#92;( 0 &#92;)</span> exactly when the Nyquist plot of <span>&#92;( L(s) &#92;)</span> encircles <span>&#92;( -1 &#92;)</span>, we conclude <span>&#92;( N = Z - P &#92;)</span>, hence <span>&#92;( Z = N + P &#92;)</span>. <span>&#92;( \square &#92;)</span>

**Corollary 16.16 (Nyquist Stability Criterion — Stability Form).** The closed-loop system is stable if and only if all three of the following conditions hold: (1) the net number of **counterclockwise** encirclements of <span>&#92;( -1 &#92;)</span> by the Nyquist plot of <span>&#92;( L(s) &#92;)</span> equals <span>&#92;( P &#92;)</span> (the number of RHP poles of <span>&#92;( L(s) &#92;)</span>); (2) the Nyquist plot does not pass through <span>&#92;( -1 &#92;)</span>; and (3) there are no RHP pole-zero cancellations in <span>&#92;( L(s) = P(s)C(s) &#92;)</span>.

*Proof.* (<span>&#92;( \Rightarrow &#92;)</span>) First, any RHP pole-zero cancellation in <span>&#92;( L(s) &#92;)</span> forces the characteristic polynomial <span>&#92;( \kappa &#92;)</span> to vanish at the cancellation point, which lies in the RHP, giving a closed-loop RHP pole — so the system cannot be stable. Second, if the Nyquist plot passes through <span>&#92;( -1 &#92;)</span>, then <span>&#92;( 1 + L(j\omega) = 0 &#92;)</span> for some real <span>&#92;( \omega &#92;)</span>, placing a closed-loop pole on the imaginary axis. Finally, by <span>&#92;( Z = N + P &#92;)</span>, stability requires <span>&#92;( Z = 0 &#92;)</span>, i.e., <span>&#92;( -N = P &#92;)</span>, meaning the number of counterclockwise encirclements equals <span>&#92;( P &#92;)</span>.

(<span>&#92;( \Leftarrow &#92;)</span>) Follows directly from Theorem 16.15. <span>&#92;( \square &#92;)</span>

#### Applications of the Nyquist Criterion

**Example 16.17.** Consider <span>&#92;( P(s) = \frac{1}{s} &#92;)</span> and <span>&#92;( C(s) = \frac{s}{s+1} &#92;)</span>, giving

<span>&#92;[
L(s) = \frac{1}{s} \cdot \frac{s}{s+1} = \frac{1}{s+1}.
&#92;]</span>

There is a pole-zero cancellation at <span>&#92;( s = 0 &#92;)</span>, which lies on the imaginary axis (the boundary of the RHP). By Corollary 16.16, this implies closed-loop instability. To confirm, while the transfer function from <span>&#92;( r &#92;)</span> to <span>&#92;( y &#92;)</span> is <span>&#92;( T = \frac{1}{s+2} &#92;)</span> (which is stable), the load sensitivity <span>&#92;( PS = \frac{P}{1+PC} = \frac{s+1}{s(s+2)} &#92;)</span> has a pole at <span>&#92;( s = 0 &#92;)</span>. The lesson is that **RHP pole-zero cancellation (including the imaginary axis) is always detrimental** and leads to closed-loop instability in at least one channel.

**Example 16.18.** For <span>&#92;( L(s) = \frac{1}{s+1} &#92;)</span> (no RHP cancellations), the Nyquist plot does not encircle <span>&#92;( -1 &#92;)</span> and there are no RHP poles for <span>&#92;( L &#92;)</span>. By Corollary 16.16 with <span>&#92;( P = 0 &#92;)</span> and counterclockwise encirclements <span>&#92;( = 0 = P &#92;)</span>, the closed-loop system is stable. Valid realizations achieving this loop transfer function include, for instance, <span>&#92;( P(s) = \frac{1}{s+2} &#92;)</span> with <span>&#92;( C(s) = \frac{s+2}{s+1} &#92;)</span>, or <span>&#92;( P(s) = \frac{1}{s+1} &#92;)</span> with <span>&#92;( C(s) = 1 &#92;)</span>.

**Example 16.19 (Inverted Pendulum).** The linearized normalized inverted pendulum has transfer function

<span>&#92;[
P(s) = \frac{1}{s^2 - 1},
&#92;]</span>

with a RHP pole at <span>&#92;( s = 1 &#92;)</span>. A PD controller <span>&#92;( C(s) = k(s+2) &#92;)</span> gives loop transfer function

<span>&#92;[
L(s) = P(s)C(s) = \frac{k(s+2)}{s^2 - 1},
&#92;]</span>

which also has a RHP pole at <span>&#92;( s = 1 &#92;)</span>, so <span>&#92;( P = 1 &#92;)</span>. For <span>&#92;( k = 1 &#92;)</span>, the Nyquist plot encircles <span>&#92;( -1 &#92;)</span> counterclockwise exactly once, matching <span>&#92;( P = 1 &#92;)</span>, so the closed-loop system is stable. As <span>&#92;( k &#92;)</span> is reduced, the Nyquist plot scales proportionally. At <span>&#92;( k = \frac{1}{2} &#92;)</span> the plot passes through <span>&#92;( -1 &#92;)</span>, and for <span>&#92;( k < \frac{1}{2} &#92;)</span> the counterclockwise encirclement count drops to zero, so the system becomes unstable. This can be verified by the Routh–Hurwitz criterion: the closed-loop characteristic polynomial is <span>&#92;( \kappa(s) = s^2 + ks + 2k - 1 &#92;)</span>, and the Routh–Hurwitz conditions require <span>&#92;( k > 0 &#92;)</span> and <span>&#92;( 2k - 1 > 0 &#92;)</span>, i.e., <span>&#92;( k > \frac{1}{2} &#92;)</span>.

**Example 16.20.** Consider

<span>&#92;[
L(s) = \frac{(s-1)(s+2)}{(s+1)^2}.
&#92;]</span>

Here <span>&#92;( L(s) &#92;)</span> has no RHP poles, so <span>&#92;( P = 0 &#92;)</span>. However, the Nyquist plot encircles <span>&#92;( -1 &#92;)</span> clockwise exactly once, giving <span>&#92;( N = 1 &#92;)</span>. By the Nyquist criterion, <span>&#92;( Z = N + P = 1 > 0 &#92;)</span>, so the closed-loop system has a RHP pole and is unstable.

**Example 16.21.** To check closed-loop stability for

<span>&#92;[
P(s) = \frac{s+1}{s(s-1)}, \qquad C(s) = k,
&#92;]</span>

the loop transfer function is <span>&#92;( L(s) = \frac{k(s+1)}{s(s-1)} &#92;)</span>. This has RHP poles at <span>&#92;( s = 1 &#92;)</span> (and a pole on the imaginary axis at <span>&#92;( s = 0 &#92;)</span>, handled by an imaginary-axis indentation in the Nyquist contour). The Nyquist criterion can be applied by computing the number of counterclockwise encirclements of <span>&#92;( -1 &#92;)</span> as a function of <span>&#92;( k &#92;)</span> and comparing with <span>&#92;( P &#92;)</span> (the number of RHP poles, here <span>&#92;( P = 1 &#92;)</span>). The range of <span>&#92;( k &#92;)</span> for which the counterclockwise encirclements equal 1 gives the stabilizing gains.
## Week 9: Robust Stability and Asymptotic Tracking

### Lecture 17: Robust Stability

A mathematical model is only an approximation to a real physical system. The gap between model and reality is captured by the notion of **modeling uncertainty**, which refers to approximation errors of all kinds. In this lecture we study **robust stability**, meaning stability that is guaranteed not merely for a single nominal plant but for an entire family of plants representing the range of possible modeling errors. Our treatment is confined to SISO transfer functions.

#### Plant Uncertainty

Uncertainties are broadly classified as **structured** or **unstructured**. Structured uncertainty arises when one or more physical parameters of the model are known only to within a bounded interval, so the set of all admissible plants can be described explicitly.

**Example 17.1.** Consider a plant of the form

<span>&#92;[ P(s) = \frac{1}{s^2 + as + 1}, &#92;]</span>

where <span>&#92;(a/2&#92;)</span> represents the damping ratio. Suppose the parameter <span>&#92;(a&#92;)</span> is only known to lie in an interval <span>&#92;([a_{\min}, a_{\max}]&#92;)</span>. The entire family of admissible plants is then the structured set

<span>&#92;[ \mathcal{P} = \left\{ \frac{1}{s^2 + as + 1} : a_{\min} \leq a \leq a_{\max} \right\}. &#92;]</span>

This kind of structured uncertainty is tractable: suppose we use a PI controller of the form <span>&#92;(C(s) = k\bigl(1 + \tfrac{1}{s}\bigr)&#92;)</span>. The closed-loop characteristic polynomial is

<span>&#92;[ \kappa(s) = k(s+1) + s(s^2 + as + 1) = s^3 + as^2 + (k+1)s + k. &#92;]</span>

Applying the Routh–Hurwitz criterion, the necessary and sufficient conditions for stability are <span>&#92;(k > 0&#92;)</span>, <span>&#92;(a > 0&#92;)</span>, and <span>&#92;(\tfrac{k}{k+1} < a&#92;)</span>. Therefore, for closed-loop stability to hold for every <span>&#92;(P \in \mathcal{P}&#92;)</span>, we require <span>&#92;(a_{\min} > 0&#92;)</span> and <span>&#92;\(\tfrac{k}{k+1} < a_{\min}&#92;)</span>.

#### Multiplicative Uncertainty

A general and widely used way to parameterise unstructured uncertainty is the **multiplicative uncertainty model**.

**Definition 17.2 (Multiplicative uncertainty).** We consider a plant with multiplicative uncertainty of the form

<span>&#92;[ \tilde{P} = (1 + \Delta W_2)\,P, &#92;]</span>

where <span>&#92;(P&#92;)</span> is a nominal plant transfer function, <span>&#92;(W_2&#92;)</span> is a fixed stable transfer function called the **uncertainty weight**, and <span>&#92;(\Delta&#92;)</span> is a variable stable transfer function satisfying <span>&#92;(\|\Delta\|_\infty < 1&#92;)</span>, where the <span>&#92;(\mathcal{H}_\infty&#92;)</span>-norm of a transfer function <span>&#92;(G&#92;)</span> is defined by

<span>&#92;[ \|G\|_\infty = \sup_{\omega} |G(j\omega)|. &#92;]</span>

We assume there are no right-half-plane zero–pole cancellations when forming <span>&#92;(\tilde{P}&#92;)</span>. For a plant perturbed by multiplicative uncertainty, one computes

<span>&#92;[ \left|\frac{\tilde{P}(j\omega)}{P(j\omega)} - 1\right| = |\Delta(j\omega)|\,|W_2(j\omega)|, &#92;]</span>

so the condition <span>&#92;(\|\Delta\|_\infty \leq 1&#92;)</span> is equivalent to

<span>&#92;[ \left|\frac{\tilde{P}(j\omega)}{P(j\omega)} - 1\right| \leq |W_2(j\omega)|, \qquad \forall\,\omega. &#92;]</span>

This shows that <span>&#92;(W_2(j\omega)&#92;)</span> bounds the relative error of the perturbed plant at each frequency. A structured uncertainty can always be embedded into a multiplicative uncertainty description, as the next example illustrates.

**Example 17.3.** Consider <span>&#92;(\tilde{P}(s) = \tfrac{a}{s-10}&#92;)</span> with <span>&#92;(a \in [0.1, 10]&#92;)</span>, and a nominal model <span>&#92;(P(s) = \tfrac{a_0}{s-10}&#92;)</span>. To represent this as multiplicative uncertainty we require

<span>&#92;[ \max_{0.1 \leq a \leq 10} \left|\frac{a}{a_0} - 1\right| \leq |W_2(j\omega)|, \qquad \forall\,\omega. &#92;]</span>

The left-hand side is minimised over the choice of <span>&#92;(a_0&#92;)</span> when <span>&#92;(a_0 = 5.05&#92;)</span>, giving the constant weight <span>&#92;(W_2(s) = \tfrac{4.95}{5.05}&#92;)</span>.

#### Robust Stability Theorem for Multiplicative Uncertainty

**Definition 17.4 (Robust stability).** A controller <span>&#92;(C&#92;)</span> is said to provide **robust stability** to a family of plants <span>&#92;(\mathcal{P}&#92;)</span> if it provides closed-loop stability to every plant in this family.

Recall that the **complementary sensitivity function** is

<span>&#92;[ T = 1 - S = \frac{PC}{1 + PC}, &#92;]</span>

where <span>&#92;(S = \tfrac{1}{1+PC}&#92;)</span> is the **sensitivity function**, and <span>&#92;(L = PC&#92;)</span> is the **loop transfer function**.

**Theorem 17.5 (Multiplicative uncertainty model).** Assume that a controller <span>&#92;(C&#92;)</span> provides stability to the nominal model <span>&#92;(P&#92;)</span>. Then <span>&#92;(C&#92;)</span> provides robust stability for the multiplicative uncertainty model of <span>&#92;(P&#92;)</span> if and only if

<span>&#92;[ \|W_2 T\|_\infty < 1. &#92;]</span>

*Proof (outline).* Let <span>&#92;(L = PC&#92;)</span>. Since the nominal model is stable under <span>&#92;(C&#92;)</span>, the Nyquist plot of <span>&#92;(L&#92;)</span> does not pass through <span>&#92;(-1&#92;)</span> and makes the correct number of counterclockwise encirclements of <span>&#92;(-1&#92;)</span> equal to the number of right-half-plane poles of <span>&#92;(P&#92;)</span>. Now consider the Nyquist plot of the perturbed loop <span>&#92;(\tilde{P}C = (1 + \Delta W_2)L&#92;)</span>. Since <span>&#92;(\Delta&#92;)</span> and <span>&#92;(W_2&#92;)</span> are both stable, they introduce no poles on the imaginary axis. The key observation is that the pointwise distance between <span>&#92;((1+\Delta W_2)L&#92;)</span> and <span>&#92;(L&#92;)</span> is <span>&#92;(|\Delta W_2 L|&#92;)</span>. If this distance is strictly less than the distance from <span>&#92;(L(j\omega)&#92;)</span> to the critical point <span>&#92;(-1&#92;)</span>, i.e.

<span>&#92;[ |\Delta W_2 L| < |1 + L|, &#92;]</span>

then the perturbed Nyquist plot cannot pass through or change its encirclement count of <span>&#92;(-1&#92;)</span>. Dividing both sides by <span>&#92;(|1+L|&#92;)</span> and taking the supremum over all admissible <span>&#92;(\Delta&#92;)</span> (with <span>&#92;(\|\Delta\|_\infty < 1&#92;)</span>) yields the condition

<span>&#92;[ \left\|W_2 \frac{L}{1+L}\right\|_\infty = \|W_2 T\|_\infty < 1. &#92;]</span>

**Example 17.6.** Let <span>&#92;(\tilde{P} = (1 + \Delta W_2)P&#92;)</span> with <span>&#92;(P(s) = \tfrac{1}{s-1}&#92;)</span>, <span>&#92;(W_2(s) = \tfrac{1}{s+10}&#92;)</span>, and <span>&#92;(\|\Delta\|_\infty \leq 1&#92;)</span>. For the proportional controller <span>&#92;(C(s) = k&#92;)</span>, robust stability requires

<span>&#92;[ \|W_2 T\|_\infty = \sup_\omega \left|\frac{1}{j\omega + 10} \cdot \frac{k}{j\omega - 1 + k}\right| = \sup_\omega \frac{k}{\sqrt{(k+9)^2\omega^2 + (10k - \omega^2 - 10)^2}} < 1. &#92;]</span>

The controller must also stabilise the nominal plant; the characteristic polynomial of the nominal closed loop gives the necessary condition <span>&#92;(k > 1&#92;)</span>. The precise condition for robust stability is obtained by maximising the left-hand side with respect to <span>&#92;(\omega&#92;)</span> and requiring the result to remain below one.

#### Additive Uncertainty

A second fundamental model is **additive uncertainty**.

**Definition 17.7 (Additive uncertainty).** We consider a plant with additive uncertainty of the form

<span>&#92;[ \tilde{P} = P + \Delta W_2, &#92;]</span>

where <span>&#92;(P&#92;)</span>, <span>&#92;(W_2&#92;)</span>, and <span>&#92;(\Delta&#92;)</span> are as before, with <span>&#92;(\|\Delta\|_\infty < 1&#92;)</span>.

**Theorem 17.8 (Additive uncertainty model).** Assume that <span>&#92;(C&#92;)</span> provides stability to the nominal model <span>&#92;(P&#92;)</span>. Then <span>&#92;(C&#92;)</span> provides robust stability for the additive uncertainty model of <span>&#92;(P&#92;)</span> if and only if

<span>&#92;[ \|W_2 C S\|_\infty < 1. &#92;]</span>

*Proof.* By the same Nyquist argument as in Theorem 17.5, the perturbed loop is <span>&#92;(\tilde{P}C = (P + \Delta W_2)C&#92;)</span>, whose pointwise distance from <span>&#92;(L = PC&#92;)</span> is <span>&#92;(|\Delta W_2 C|&#92;)</span>. Requiring this to be strictly less than <span>&#92;(|1+L|&#92;)</span> and dividing by <span>&#92;(|1+L|&#92;)</span> yields

<span>&#92;[ \left\|W_2 C \frac{1}{1+L}\right\|_\infty = \|W_2 CS\|_\infty < 1. &#92;]</span>

**Example 17.9.** Let <span>&#92;(\tilde{P} = P + \Delta W_2&#92;)</span> with <span>&#92;(P(s) = \tfrac{1}{s-1}&#92;)</span>, <span>&#92;(W_2(s) = \tfrac{1}{s+10}&#92;)</span>, <span>&#92;(\|\Delta\|_\infty \leq 1&#92;)</span>, and <span>&#92;(C(s) = k&#92;)</span>. The robust stability condition <span>&#92;(\|W_2 CS\|_\infty < 1&#92;)</span> becomes

<span>&#92;[ \sup_\omega \sqrt{\frac{k^2(\omega^2+1)}{(k+9)^2\omega^2 + (10k - 10 - \omega^2)^2}} < 1. &#92;]</span>

Again the nominal stability requirement gives <span>&#92;(k > 1&#92;)</span>, and the exact robust-stability condition is left as an exercise.

---

### Lecture 18: Asymptotic Tracking

#### Tracking Error and the Sensitivity Function

Consider the SISO unity-feedback system with a feedforward filter <span>&#92;(F(s)&#92;)</span>, feedback controller <span>&#92;(C(s)&#92;)</span>, and plant <span>&#92;(P(s)&#92;)</span>. External inputs are the reference <span>&#92;(r&#92;)</span>, process disturbance <span>&#92;(d&#92;)</span>, and measurement noise <span>&#92;(n&#92;)</span>. For simplicity we set <span>&#92;(d = n = 0&#92;)</span>. Recall that the transfer function from the reference <span>&#92;(r&#92;)</span> to the **tracking error** <span>&#92;(e = r - y&#92;)</span> is

<span>&#92;[ G_{er}(s) = \frac{1}{1 + P(s)C(s)} = \frac{1}{1 + L(s)} =: S(s), &#92;]</span>

the sensitivity function, where <span>&#92;(L(s) = P(s)C(s)&#92;)</span> is the loop transfer function. In practice we wish not merely to bound the tracking error but to drive it to zero asymptotically. This is the notion of **asymptotic tracking**: the requirement that <span>&#92;(\lim_{t \to \infty} e(t) = 0&#92;)</span> for the prescribed class of reference signals.

#### The Final Value Theorem

The main analytic tool for computing the **steady-state error** directly in the frequency domain, without first inverting the Laplace transform, is the Final Value Theorem.

**Theorem 18.10 (Final Value Theorem).** Suppose that <span>&#92;(y(t)&#92;)</span> is integrable on <span>&#92;([0,\infty)&#92;)</span> and that <span>&#92;(\lim_{t \to \infty} y(t)&#92;)</span> exists. Let <span>&#92;(\hat{y}(s)&#92;)</span> be its Laplace transform. Then

<span>&#92;[ \lim_{t \to \infty} y(t) = \lim_{s \to 0} s\,\hat{y}(s). &#92;]</span>

*Proof.* Let <span>&#92;(\alpha = \lim_{t\to\infty} y(t)&#92;)</span>. For real <span>&#92;(s > 0&#92;)</span>,

<span>&#92;[&#92;begin{aligned}
|s\hat{y}(s) - \alpha|
&= \left|s\int_0^\infty y(t)e^{-st}\,dt - s\int_0^\infty \alpha e^{-st}\,dt\right| \\
&= \left|s\int_0^\infty (y(t)-\alpha)e^{-st}\,dt\right| \\
&\leq s\int_0^\infty |y(t)-\alpha|\,e^{-st}\,dt \\
&\leq s\int_0^T |y(t)-\alpha|\,dt + \sup_{t \geq T}|y(t)-\alpha|,
&#92;end{aligned}&#92;]</span>

where we used <span>&#92;(s\int_T^\infty e^{-st}\,dt = e^{-sT} < 1&#92;)</span> for <span>&#92;(s,T > 0&#92;)</span>. For any <span>&#92;(\varepsilon > 0&#92;)</span>, choose <span>&#92;(T&#92;)</span> so that <span>&#92;(\sup_{t \geq T}|y(t)-\alpha| \leq \varepsilon/2&#92;)</span>, then choose <span>&#92;(\delta > 0&#92;)</span> so that <span>&#92;(s\int_0^T |y(t)-\alpha|\,dt \leq \varepsilon/2&#92;)</span> for all <span>&#92;(|s| \leq \delta&#92;)</span>. It follows that <span>&#92;(|s\hat{y}(s)-\alpha| \leq \varepsilon&#92;)</span>, proving <span>&#92;(\lim_{s\to 0} s\hat{y}(s) = \alpha&#92;)</span>.

#### Step and Ramp Tracking

Two prototypical reference signals are the **step** <span>&#92;(r(t) = c&#92;)</span> (for <span>&#92;(t \geq 0&#92;)</span>) with Laplace transform <span>&#92;(\hat{r}(s) = c/s&#92;)</span>, and the **ramp** <span>&#92;(r(t) = ct&#92;)</span> with <span>&#92;(\hat{r}(s) = c/s^2&#92;)</span>.

**Theorem 18.11.** Consider the SISO unity-feedback system with <span>&#92;(d = n = 0&#92;)</span>. Suppose the closed-loop system is stable. Then:

1. The system tracks a step input with zero steady-state error if and only if <span>&#92;(S(s) = \tfrac{1}{1+L(s)}&#92;)</span> has at least one zero at the origin.
2. The system tracks a ramp input with zero steady-state error if and only if <span>&#92;(S(s)&#92;)</span> has at least two zeros at the origin.

*Proof.* For part 1, the Laplace transform of the error is <span>&#92;(\hat{e}(s) = S(s)\cdot c/s&#92;)</span>. By the Final Value Theorem,

<span>&#92;[ e_{ss} = \lim_{t\to\infty} e(t) = \lim_{s\to 0} s \cdot S(s) \cdot \frac{c}{s} = c\,S(0). &#92;]</span>

Hence <span>&#92;(e_{ss} = 0&#92;)</span> if and only if <span>&#92;(S(0) = 0&#92;)</span>, i.e. <span>&#92;(S&#92;)</span> has a zero at the origin. Part 2 follows analogously for the ramp, whose transform is <span>&#92;(c/s^2&#92;)</span>.

**Example 18.12.** Let <span>&#92;(P(s) = 1/s&#92;)</span> and <span>&#92;(C(s) = 1&#92;)</span>. Then

<span>&#92;[ S(s) = \frac{1}{1 + \tfrac{1}{s}} = \frac{s}{s+1}. &#92;]</span>

Since <span>&#92;(S&#92;)</span> has exactly one zero at <span>&#92;(s = 0&#92;)</span>, the system can track a step signal but not a ramp.

**Example 18.13.** Let <span>&#92;(P(s) = 1/s&#92;)</span> and <span>&#92;(C(s) = 1/s + 1 = (s+1)/s&#92;)</span>. Then

<span>&#92;[ S(s) = \frac{1}{1 + \frac{1}{s}\cdot\frac{s+1}{s}} = \frac{s^2}{s^2 + s + 1}. &#92;]</span>

Since <span>&#92;(S&#92;)</span> has two zeros at the origin, the system tracks both step and ramp inputs perfectly.

**Example 18.14 (Steady-state error of a PI controller).** Let <span>&#92;(P(s) = 1/s&#92;)</span> and <span>&#92;(C(s) = k_i/s + k_p&#92;)</span>. By the Final Value Theorem, for a unit step input the steady-state error is

<span>&#92;[ e_{ss} = \lim_{s\to 0} S(s) = \lim_{s\to 0} \frac{1}{1+P(s)C(s)} = \lim_{s\to 0} \frac{s}{s + P(s)(k_p s + k_i)} = \begin{cases} 0, & k_i \neq 0,\; P(0) \neq 0, \\ \dfrac{1}{1+P(0)k_p}, & k_i = 0. \end{cases} &#92;]</span>

When <span>&#92;(k_i = 0&#92;)</span> (purely proportional control), the steady-state error cannot be eliminated unless <span>&#92;(P(0) = \infty&#92;)</span>. The integral action of a PI controller forces a zero at <span>&#92;(s=0&#92;)</span> in <span>&#92;(S&#92;)</span>, thereby guaranteeing zero steady-state error for step inputs.

#### Tracking in State-Space Formulation

The frequency-domain analysis of tracking has a clean counterpart in the state-space framework. Consider the LTI system

<span>&#92;[&#92;begin{aligned}
x'(t) &= Ax(t) + Bu(t), \\
y(t) &= Cx(t) + Du(t).
&#92;end{aligned}&#92;]</span>

We wish the output <span>&#92;(y(t)&#92;)</span> to satisfy <span>&#92;(\lim_{t\to\infty} y(t) = y_d \in \mathbb{R}&#92;)</span>. Consider the **state-feedback law**

<span>&#92;[ u = r + Kx, &#92;]</span>

where <span>&#92;(r \in \mathbb{R}&#92;)</span> is a constant reference. The closed-loop dynamics become

<span>&#92;[&#92;begin{aligned}
x' &= (A+BK)x + Br, \\
y &= (C+DK)x + Dr.
&#92;end{aligned}&#92;]</span>

The transfer function from <span>&#92;(r&#92;)</span> to <span>&#92;(y&#92;)</span> is

<span>&#92;[ G_{yr}(s) = (C+DK)(sI - (A+BK))^{-1}B + D. &#92;]</span>

Applying the Final Value Theorem to a unit step in <span>&#92;(r&#92;)</span> gives

<span>&#92;[ \lim_{t\to\infty} y(t) = G_{yr}(0)\,r, &#92;]</span>

where <span>&#92;(G_{yr}(0)&#92;)</span> is called the **DC gain** of the closed-loop system. To achieve <span>&#92;(\lim_{t\to\infty} y(t) = y_d&#92;)</span>, one simply sets <span>&#92;(r = [G_{yr}(0)]^{-1} y_d&#92;)</span>.

**Example 18.15.** Let

<span>&#92;[ A = \begin{bmatrix} 0 & 1 \\ 0 & 0 \end{bmatrix},\quad B = \begin{bmatrix} \gamma \\ 1 \end{bmatrix}\;(\gamma > 0),\quad C = \begin{bmatrix} 1 & 0 \end{bmatrix},\quad D = 0. &#92;]</span>

Design a state-feedback law <span>&#92;(u = r + Kx&#92;)</span> with <span>&#92;(K = [k_1\; k_2]&#92;)</span> so that (i) the closed-loop eigenvalues are at <span>&#92;(-1 \pm j&#92;)</span> and (ii) <span>&#92;(y&#92;)</span> asymptotically tracks a unit step. The desired characteristic polynomial is <span>&#92;(s^2 + 2s + 2&#92;)</span>. Computing <span>&#92;(|sI - (A+BK)|&#92;)</span> and matching coefficients gives <span>&#92;(k_1 = -2&#92;)</span> and <span>&#92;(k_2 = 2(\gamma-1)&#92;)</span>. The DC gain is

<span>&#92;[ G_{yr}(0) = -(C+DK)(A+BK)^{-1}B + D = -\frac{1}{k_1} = \frac{1}{2}. &#92;]</span>

To track a unit step (<span>&#92;(y_d = 1&#92;)</span>), set <span>&#92;(r = [G_{yr}(0)]^{-1} \cdot 1 = 2&#92;)</span>. Wait — more precisely, <span>&#92;(r = [G_{yr}(0)]^{-1}y_d = \tfrac{1}{2}&#92;)</span> since <span>&#92;(G_{yr}(0) = 2&#92;)</span>.

#### Asymptotic Tracking with Output Feedback

The same principle applies when only the output is measured. Recall that a **state estimator** (observer) is constructed as

<span>&#92;[&#92;begin{aligned}
\hat{x}' &= A\hat{x} + Bu + L(\hat{y} - y), \\
\hat{y} &= C\hat{x} + Du,
&#92;end{aligned}&#92;]</span>

with estimation error <span>&#92;(e = \hat{x} - x&#92;)</span> satisfying <span>&#92;(e' = (A + LC)e&#92;)</span>. An **output-feedback law** of the form <span>&#92;(u = r + K\hat{x}&#92;)</span> leads to the closed-loop dynamics

<span>&#92;[ \begin{bmatrix} x' \\ e' \end{bmatrix} = \begin{bmatrix} A+BK & BK \\ 0 & A+LC \end{bmatrix} \begin{bmatrix} x \\ e \end{bmatrix} + \begin{bmatrix} B \\ 0 \end{bmatrix} r. &#92;]</span>

This block-triangular structure is the foundation of the **separation principle**: the gains <span>&#92;(K&#92;)</span> and <span>&#92;(L&#92;)</span> can be designed independently. Furthermore, the transfer function from <span>&#92;(r&#92;)</span> to <span>&#92;(y&#92;)</span> is exactly the same as in the state-feedback case,

<span>&#92;[ G_{yr}(s) = (C+DK)(sI-(A+BK))^{-1}B + D, &#92;]</span>

so the DC-gain-based pre-compensation formula <span>&#92;(r = [G_{yr}(0)]^{-1}y_d&#92;)</span> remains valid.

**Example 18.16.** Let

<span>&#92;[ A = \begin{bmatrix} 0 & 1 \\ 2 & 1 \end{bmatrix},\quad B = \begin{bmatrix} 0 \\ 1 \end{bmatrix},\quad C = \begin{bmatrix} 1 & 0 \end{bmatrix},\quad D = 0. &#92;]</span>

Design an output-feedback law <span>&#92;(u = r + K\hat{x}&#92;)</span> so that (i) the eigenvalues of <span>&#92;(A+BK&#92;)</span> are at <span>&#92;(-1\pm j&#92;)</span>, (ii) the eigenvalues of <span>&#92;(A+LC&#92;)</span> are at <span>&#92;(-1,-1&#92;)</span>, and (iii) <span>&#92;(y&#92;)</span> tracks a desired output <span>&#92;(y_d&#92;)</span>. Setting <span>&#92;(K = [k_1\; k_2]&#92;)</span> and matching to the desired polynomial <span>&#92;(s^2+2s+2&#92;)</span> gives <span>&#92;(k_1 = -4&#92;)</span>, <span>&#92;(k_2 = -3&#92;)</span>. Setting <span>&#92;(L = [l_1\; l_2]^T&#92;)</span> and matching to <span>&#92;((s+1)^2 = s^2+2s+1&#92;)</span> gives <span>&#92;(l_1 = -3&#92;)</span>, <span>&#92;(l_2 = -6&#92;)</span>. The DC gain is <span>&#92;(G_{yr}(0) = \tfrac{1}{2}&#92;)</span>, so the reference input required to track <span>&#92;(y_d&#92;)</span> is <span>&#92;(r = 2y_d&#92;)</span>.

---

## Week 10: PID Control and Frequency Domain Design

### Lecture 19: PID Control

Proportional–integral–derivative (PID) controllers are by far the most widely deployed controllers in industrial practice; it is estimated that more than 90% of all industrial control loops use PID feedback. In this lecture we introduce PID controller design and the effects of each individual gain on closed-loop performance.

#### The PID Controller

Consider the standard unity-feedback loop with plant <span>&#92;(P(s)&#92;)</span> and controller <span>&#92;(C(s)&#92;)</span>. A **PID controller** generates its control signal as

<span>&#92;[ u(t) = k_P\,e(t) + k_I\int_0^t e(\tau)\,d\tau + k_D\,e'(t), &#92;]</span>

where <span>&#92;(k_P&#92;)</span>, <span>&#92;(k_I&#92;)</span>, and <span>&#92;(k_D&#92;)</span> are the **proportional**, **integral**, and **derivative gains**, respectively. Taking the Laplace transform yields the transfer function

<span>&#92;[ C(s) = k_P + \frac{k_I}{s} + k_D s = \frac{k_D s^2 + k_P s + k_I}{s}. &#92;]</span>

Note that this transfer function is not strictly proper (it is improper because of the derivative term). In practice the derivative term is always paired with a first-order low-pass filter to make the controller proper. In MATLAB, a PID controller can be created with the command `pid(kP, kI, kD)`.

#### Effects of Each Gain

The table below summarises the qualitative effects of independently increasing each gain. These are useful guidelines that hold in most cases but not universally.

| Gain | Rise time | Overshoot | Settling time | Steady-state error |
|------|-----------|-----------|---------------|--------------------|
| <span>&#92;(k_P&#92;)</span> | Decrease | Increase | Small change | Decrease |
| <span>&#92;(k_I&#92;)</span> | Decrease | Increase | Increase | Decrease |
| <span>&#92;(k_D&#92;)</span> | Small change | Decrease | Decrease | No change |

Increasing <span>&#92;(k_P&#92;)</span> improves tracking speed and reduces steady-state error but at the cost of increased overshoot. The integral term <span>&#92;(k_I&#92;)</span> eliminates steady-state error (because it introduces a pole at the origin in <span>&#92;(C(s)&#92;)</span>, forcing a zero of <span>&#92;(S(s)&#92;)</span> at the origin) but tends to slow the transient response. The derivative term <span>&#92;(k_D&#92;)</span> damps oscillations and reduces overshoot and settling time but has little influence on steady-state error.

#### Design Example

**Example 19.1.** Consider the second-order plant

<span>&#92;[ P(s) = \frac{1}{s^2 + 5s + 10}. &#92;]</span>

The open-loop step-response steady-state value, computed via the Final Value Theorem, is

<span>&#92;[ \lim_{s\to 0} s\cdot P(s)\cdot\frac{1}{s} = P(0) = \frac{1}{10}, &#92;]</span>

giving a steady-state error of <span>&#92;(1 - 0.1 = 0.9&#92;)</span> — quite large. The rise time is approximately 0.9 s and the settling time approximately 2 s.

**P control** (<span>&#92;(k_P = 200&#92;)</span>, <span>&#92;(k_I = k_D = 0&#92;)</span>). The closed-loop transfer function from <span>&#92;(r&#92;)</span> to <span>&#92;(y&#92;)</span> is

<span>&#92;[ \frac{200}{s^2 + 5s + 210}. &#92;]</span>

This reduces the rise time and steady-state error but increases the overshoot.

**PD control** (<span>&#92;(k_P = 200&#92;)</span>, <span>&#92;(k_D = 10&#92;)</span>, <span>&#92;(k_I = 0&#92;)</span>). The closed-loop transfer function is

<span>&#92;[ \frac{10s + 200}{s^2 + 15s + 210}. &#92;]</span>

Adding the derivative term reduces both overshoot and settling time with negligible effect on rise time or steady-state error.

**PI control** (<span>&#92;(k_P = 50&#92;)</span>, <span>&#92;(k_I = 70&#92;)</span>, <span>&#92;(k_D = 0&#92;)</span>). The closed-loop transfer function is

<span>&#92;[ \frac{50s + 70}{s^3 + 5s^2 + 60s + 70}. &#92;]</span>

The integral gain eliminates the steady-state error. The proportional gain is reduced from 200 to 50 because integral action already reduces rise time and adding too much proportional gain would worsen overshoot.

**Full PID control** (<span>&#92;(k_P = 200&#92;)</span>, <span>&#92;(k_I = 170&#92;)</span>, <span>&#92;(k_D = 30&#92;)</span>). Combining all three terms yields a closed-loop system with no overshoot, fast rise time, and zero steady-state error. MATLAB's automatic tuning command `pidtune(P,'pid')` finds the gains <span>&#92;(k_P \approx 23.5&#92;)</span>, <span>&#92;(k_I \approx 51&#92;)</span>, <span>&#92;(k_D \approx 2.42&#92;)</span> for this plant.

#### PID Design Procedure

A standard iterative procedure for PID design proceeds as follows. First, determine the control objectives from the open-loop step response, identifying deficiencies in rise time, overshoot, settling time, and steady-state error. Second, add proportional control and increase <span>&#92;(k_P&#92;)</span> to improve rise time. Third, add derivative control and increase <span>&#92;(k_D&#92;)</span> to reduce overshoot and settle the transient. Fourth, add integral control and tune <span>&#92;(k_I&#92;)</span> to eliminate steady-state error. Fifth, iterate on all three gains until the overall closed-loop response satisfies the specifications. Automated tuning methods exist, with MATLAB's `pidtune` being a convenient example.

---

### Lecture 20: Frequency Domain Design

In this lecture we develop a more systematic frequency-domain perspective on controller design. The starting point is the **gang of four**: the four closed-loop transfer functions

<span>&#92;[&#92;begin{aligned}
S &= \frac{1}{1+PC} \quad \text{(sensitivity)}, \\
T &= \frac{PC}{1+PC} \quad \text{(complementary sensitivity)}, \\
PS &= \frac{P}{1+PC} \quad \text{(load sensitivity, from } d \text{ to } y\text{)}, \\
CS &= \frac{C}{1+PC} \quad \text{(noise sensitivity, from } n \text{ to } u\text{)},
&#92;end{aligned}&#92;]</span>

which together characterise the closed-loop behaviour.

#### Design Specifications

Three overarching requirements govern feedback design.

**Stability.** The designed controller must render the closed-loop system stable. This can be verified via the characteristic polynomial or via the Nyquist criterion applied to <span>&#92;(L(s) = P(s)C(s)&#92;)</span>: the zeros of <span>&#92;(1 + L(s)&#92;)</span> are precisely the closed-loop poles (assuming no pole–zero cancellations).

**Robustness.** We have seen that robust stability for multiplicative uncertainty requires <span>&#92;(\|W_2 T\|_\infty < 1&#92;)</span> and for additive uncertainty <span>&#92;(\|W_2 CS\|_\infty < 1&#92;)</span>. The Nyquist plot offers an intuitive measure of robustness through the **gain margin** <span>&#92;(g_m&#92;)</span> and **phase margin** <span>&#92;(\phi_m&#92;)</span>. The gain margin is the factor by which the loop gain can be increased before the system loses stability (measured at the frequency where <span>&#92;(\angle L(j\omega) = -180^\circ&#92;)</span>). The phase margin is the amount of additional phase lag at the gain crossover frequency (where <span>&#92;(|L(j\omega)| = 1&#92;)</span>) that would bring the system to the verge of instability. The **stability margin** <span>&#92;(s_m&#92;)</span> is the shortest Euclidean distance from the Nyquist curve of <span>&#92;(L&#92;)</span> to the critical point <span>&#92;(-1&#92;)</span>. These margins can be read from both the Nyquist plot and the Bode plot.

**Performance.** Performance requirements capture how the system should respond to references, disturbances, and noise. To track a reference at frequency <span>&#92;(\omega&#92;)</span> with small error, <span>&#92;(|S(j\omega)|&#92;)</span> must be small at that frequency. In particular, for low-frequency tracking and load-disturbance rejection (the load sensitivity from disturbance <span>&#92;(d&#92;)</span> to output <span>&#92;(y&#92;)</span> is <span>&#92;(P/(1+PC)&#92;)</span>), one requires <span>&#92;(|L(j\omega)|&#92;)</span> to be large at low frequencies. Conversely, measurement noise is typically concentrated at high frequencies; since the transfer function from noise <span>&#92;(n&#92;)</span> to control <span>&#92;(u&#92;)</span> is <span>&#92;(-C/(1+PC) = -T/P&#92;)</span> and the transfer function from noise to output is <span>&#92;(T&#92;)</span>, one requires <span>&#92;(|T(j\omega)|&#92;)</span> — and hence <span>&#92;(|L(j\omega)|&#92;)</span> — to be small at high frequencies. Because <span>&#92;(S + T = 1&#92;)</span>, these low-frequency and high-frequency requirements do not conflict with each other.

#### Loop Shaping

Motivated by the discussion above, the design goal can be summarised as making the loop gain <span>&#92;(|L(j\omega)|&#92;)</span> large at low frequencies (for disturbance rejection and tracking) and small at high frequencies (for noise rejection), with an appropriate crossover region that preserves adequate stability margins. This philosophy is called **loop shaping**. A convenient family of compensators is the lead–lag family

<span>&#92;[ C(s) = k\frac{s + a}{s + b}. &#92;]</span>

When <span>&#92;(a < b&#92;)</span> the compensator is a **lead compensator** (adds positive phase near the crossover frequency, improving phase margin). When <span>&#92;(a > b&#92;)</span> it is a **lag compensator** (increases low-frequency gain, reducing steady-state error). A PI controller is a special case of a lag compensator with <span>&#92;(b = 0&#92;)</span>.

Loop shaping is an iterative procedure. One typically begins with the Bode plot of <span>&#92;(P(s)&#92;)</span> and attempts to shape <span>&#92;(L(s)&#92;)</span> by adding poles and zeros to the controller, evaluating each candidate controller against the full set of specifications.

#### Bode's Integral Formula and Fundamental Limitations

A profound constraint on what feedback can achieve is captured by Bode's integral formula.

**Theorem 20.2 (Bode's integral formula).** Assume that the loop transfer function <span>&#92;(L(s)&#92;)</span> of a feedback system goes to zero faster than <span>&#92;(1/s&#92;)</span> as <span>&#92;(s \to \infty&#92;)</span>. Let <span>&#92;(S&#92;)</span> be the sensitivity function and let <span>&#92;\{p_k\}&#92;)</span> be the right-half-plane poles of <span>&#92;(L&#92;)</span>. Then

<span>&#92;[ \int_0^\infty \log|S(j\omega)|\,d\omega = \int_0^\infty \log\frac{1}{|1+L(j\omega)|}\,d\omega = \pi\sum_k p_k. &#92;]</span>

In the special case where <span>&#92;(L&#92;)</span> has no right-half-plane poles, the formula reduces to

<span>&#92;[ \int_0^\infty \log|S(j\omega)|\,d\omega = 0. &#92;]</span>

This result, sometimes called the **waterbed effect**, reveals a fundamental limitation: if the sensitivity function is made smaller (better tracking or disturbance rejection) at some frequencies, it must necessarily become larger (worse performance) at other frequencies so that the integral of <span>&#92;(\log|S(j\omega)|&#92;)</span> remains constant. Equivalently, control design can be viewed as a redistribution of disturbance attenuation across frequencies rather than a free improvement at all frequencies simultaneously.

The X-29 aircraft provides a striking illustration. The X-29 has longitudinal dynamics with right-half-plane poles at approximately <span>&#92;(\pm 6&#92;)</span> and a zero at <span>&#92;(26&#92;)</span>, with desired pitch control bandwidth <span>&#92;(\omega_1 = 3&#92;)</span> rad/s and actuator bandwidth <span>&#92;(\omega_a = 40&#92;)</span> rad/s. Analysis by Gunter Stein using Bode's formula shows that achieving low sensitivity below <span>&#92;(\omega_1&#92;)</span> forces a sensitivity peak <span>&#92;(M_s&#92;)</span> somewhere between <span>&#92;(\omega_1&#92;)</span> and <span>&#92;(\omega_a&#92;)</span>, quantifying the unavoidable cost of controlling an unstable plant.

---

## Week 11: Linear Quadratic Regulator

### Lecture 21: Linear Quadratic Regulator

The frequency-domain and PID methods studied so far rely heavily on physical intuition and iterative tuning. In this lecture and the next we turn to a systematic state-space optimisation approach: the **Linear Quadratic Regulator (LQR)**, which computes the optimal state-feedback gain by minimising a quadratic performance index.

#### Problem Formulation

Consider the linear time-invariant system

<span>&#92;[ x'(t) = Ax(t) + Bu(t), &#92;]</span>

where <span>&#92;(x \in \mathbb{R}^n&#92;)</span> is the state and <span>&#92;(u \in \mathbb{R}^k&#92;)</span> is the control input. The **LQR problem** is to find the control signal <span>&#92;(u(\cdot)&#92;)</span> that minimises the **cost functional**

<span>&#92;[ J = \int_0^\infty \bigl(x(t)^T Q\,x(t) + u(t)^T R\,u(t)\bigr)\,dt, &#92;]</span>

where <span>&#92;(Q \in \mathbb{R}^{n\times n}&#92;)</span> and <span>&#92;(R \in \mathbb{R}^{k\times k}&#92;)</span> are symmetric **weighting matrices** with <span>&#92;(Q \geq 0&#92;)</span> (positive semi-definite) and <span>&#92;(R > 0&#92;)</span> (positive definite). The matrix <span>&#92;(Q&#92;)</span> penalises the state excursion and <span>&#92;(R&#92;)</span> penalises control effort; adjusting their relative magnitudes allows the designer to trade off performance against control cost.

#### Completing the Square and the Algebraic Riccati Equation

The derivation of the optimal controller hinges on a lemma that allows the cost integral to be expressed in terms of the initial condition alone.

**Lemma 21.1.** For every symmetric matrix <span>&#92;(P&#92;)</span>, the functional

<span>&#92;[ H(x(\cdot), u(\cdot)) := -\int_0^\infty \bigl[(Ax+Bu)^T P\,x(t) + x(t)^T P(Ax+Bu)\bigr]\,dt &#92;]</span>

depends only on the initial condition <span>&#92;(x_0 = x(0)&#92;)</span>, provided <span>&#92;(\lim_{t\to\infty} x(t) = 0&#92;)</span>.

*Proof.* By the product rule,

<span>&#92;[ H = -\int_0^\infty \frac{d}{dt}[x(t)^T P\,x(t)]\,dt = -x(t)^T P\,x(t)\Big|_0^\infty = x_0^T P\,x_0. &#92;]</span>

Using this lemma, introduce an arbitrary symmetric matrix <span>&#92;(P&#92;)</span> and rewrite the cost as

<span>&#92;[&#92;begin{aligned}
J &= H(x(\cdot),u(\cdot)) + \int_0^\infty \bigl[x^T Q x + u^T R u + (Ax+Bu)^T P x + x^T P(Ax+Bu)\bigr]\,dt \\
&= H(x(\cdot),u(\cdot)) + \int_0^\infty \bigl[x^T(A^T P + PA + Q)x + u^T R u + 2u^T B^T P x\bigr]\,dt.
&#92;end{aligned}&#92;]</span>

Completing the square in <span>&#92;(u&#92;)</span> with respect to the positive-definite matrix <span>&#92;(R&#92;)</span>,

<span>&#92;[ u^T R u + 2u^T B^T P x = (u - Kx)^T R(u - Kx) - (Kx)^T R(Kx), \qquad K = -R^{-1}B^T P, &#92;]</span>

gives

<span>&#92;[ J = H(x(\cdot),u(\cdot)) + \int_0^\infty \bigl[x^T(A^T P + PA + Q - PBR^{-1}B^T P)x + (u-Kx)^T R(u-Kx)\bigr]\,dt. \tag{21.1} &#92;]</span>

If there exists a symmetric matrix <span>&#92;(P&#92;)</span> satisfying the **Algebraic Riccati Equation (ARE)**

<span>&#92;[ A^T P + PA + Q - PBR^{-1}B^T P = 0, \tag{21.2} &#92;]</span>

and if <span>&#92;(A - BR^{-1}B^T P&#92;)</span> is Hurwitz (all eigenvalues in the open left half-plane), then the quadratic term in <span>&#92;(x&#92;)</span> in the integrand of (21.1) vanishes identically. The state-feedback law <span>&#92;(u = Kx&#92;)</span> with <span>&#92;(K = -R^{-1}B^T P&#92;)</span> makes the closed-loop system asymptotically stable (so Lemma 21.1 applies), reducing the cost to

<span>&#92;[ J = H(x(\cdot),u(\cdot)) = x_0^T P x_0. &#92;]</span>

Moreover, since <span>&#92;((u-Kx)^T R(u-Kx) \geq 0&#92;)</span> for all <span>&#92;(u&#92;)</span> (because <span>&#92;(R > 0&#92;)</span>), equation (21.1) shows that any other stabilising control satisfies <span>&#92;(J \geq x_0^T P x_0&#92;)</span>. Therefore <span>&#92;(u = Kx&#92;)</span> is optimal among all stabilising inputs.

**Theorem 21.2.** Suppose there exists a symmetric matrix <span>&#92;(P \in \mathbb{R}^{n\times n}&#92;)</span> solving the algebraic Riccati equation (21.2) such that <span>&#92;(A - BR^{-1}B^T P&#92;)</span> is Hurwitz. Then the state-feedback law

<span>&#92;[ u = Kx, \qquad K = -R^{-1}B^T P, &#92;]</span>

stabilises the system and minimises the LQR cost among all stabilising controllers. The optimal cost is

<span>&#92;[ J^* = x_0^T P x_0. &#92;]</span>

*Proof.* For any stabilising control, equation (21.1) together with Lemma 21.1 gives

<span>&#92;[ J = x_0^T P x_0 + \int_0^\infty (u-Kx)^T R(u-Kx)\,dt. &#92;]</span>

Since <span>&#92;(A + BK = A - BR^{-1}B^T P&#92;)</span> is Hurwitz, <span>&#92;(u = Kx&#92;)</span> is stabilising. Since <span>&#92;(R > 0&#92;)</span>, the integral is non-negative and vanishes precisely when <span>&#92;(u = Kx&#92;)</span>.

#### Existence, Uniqueness, and the Role of Stabilisability and Detectability

Theorem 21.2 raises natural questions: when does the ARE (21.2) admit a symmetric positive-semi-definite solution <span>&#92;(P&#92;)</span>, is that solution unique, and when is <span>&#92;(A - BR^{-1}B^T P&#92;)</span> Hurwitz? The answers require two structural conditions on the system matrices.

**Theorem 21.3.** Assume <span>&#92;(Q \geq 0&#92;)</span> and <span>&#92;(R > 0&#92;)</span>. The algebraic Riccati equation (21.2) has a unique solution <span>&#92;(P&#92;)</span> that is (1) symmetric and positive semi-definite and (2) makes <span>&#92;(A - BR^{-1}B^T P&#92;)</span> Hurwitz, if and only if <span>&#92;((A,B)&#92;)</span> is **stabilisable** and <span>&#92;((A,Q)&#92;)</span> is **detectable**. Under these conditions the state-feedback law <span>&#92;(u = -R^{-1}B^T P x&#92;)</span> stabilises the system and achieves the optimal cost <span>&#92;(J^* = x_0^T P x_0&#92;)</span>.

The following examples illustrate why both conditions are necessary.

**Example 21.4.** Consider <span>&#92;(x' = u&#92;)</span> (so <span>&#92;(A = 0&#92;)</span>, <span>&#92;(B = 1&#92;)</span>) with cost <span>&#92;(J = \int_0^\infty u^2\,dt&#92;)</span> (<span>&#92;(Q = 0&#92;)</span>, <span>&#92;(R = 1&#92;)</span>). Here <span>&#92;((A,Q)&#92;)</span> is not detectable (the state is unobservable through the cost). The ARE reduces to <span>&#92;(-P^2 = 0&#92;)</span>, giving <span>&#92;(P = 0&#92;)</span>, and the control law <span>&#92;(u = 0&#92;)</span> is not stabilising. The cost is zero, but no stabilising controller can attain it: using <span>&#92;(u = -\varepsilon x&#92;)</span> for <span>&#92;(\varepsilon > 0&#92;)</span> gives cost <span>&#92;(J_\varepsilon = \varepsilon x_0^2/2 \to 0&#92;)</span> as <span>&#92;(\varepsilon \to 0&#92;)</span>, but the infimum is not achieved by any stabilising law.

**Example 21.5.** Consider <span>&#92;(x' = x + u&#92;)</span> (<span>&#92;(A=1&#92;)</span>, <span>&#92;(B=1&#92;)</span>) with <span>&#92;(J = \int_0^\infty u^2\,dt&#92;)</span>. Again <span>&#92;((A,Q)&#92;)</span> is not detectable. The ARE is <span>&#92;(2P - P^2 = 0&#92;)</span>, with solutions <span>&#92;(P = 0&#92;)</span> (non-stabilising) and <span>&#92;(P = 2&#92;)</span> (stabilising). With <span>&#92;(P = 2&#92;)</span> the law <span>&#92;(u = -2x&#92;)</span> gives closed-loop system <span>&#92;(x' = -x&#92;)</span>, and the cost is <span>&#92;(J = 2x_0^2&#92;)</span>.

**Example 21.6 (Double integrator).** Consider <span>&#92;(y'' = u&#92;)</span>, written in state-space form as

<span>&#92;[ x' = \begin{bmatrix}0 & 1\\0 & 0\end{bmatrix}x + \begin{bmatrix}0\\1\end{bmatrix}u, \qquad y = \begin{bmatrix}1 & 0\end{bmatrix}x. &#92;]</span>

Let <span>&#92;(Q = C^T C = \begin{bmatrix}1&0\\0&0\end{bmatrix}&#92;)</span> and <span>&#92;(R = r > 0&#92;)</span>. One can verify that <span>&#92;((A,Q)&#92;)</span> is detectable and <span>&#92;((A,B)&#92;)</span> is stabilisable, so Theorem 21.3 applies. Writing <span>&#92;(P = \begin{bmatrix}p_1 & p_2\\p_2 & p_3\end{bmatrix}&#92;)</span> (symmetric) and substituting into the ARE yields the system

<span>&#92;[&#92;begin{aligned}
-\frac{1}{r}p_2^2 + 1 = 0 &\implies p_2 = \sqrt{r}, \\
p_1 - \frac{1}{r}p_2 p_3 = 0 &\implies p_1 = \frac{1}{r}p_2 p_3 = \sqrt{2}\,r^{1/4}, \\
2p_2 - \frac{1}{r}p_3^2 = 0 &\implies p_3 = \sqrt{2r\,p_2} = \sqrt{2}\,r^{3/4},
&#92;end{aligned}&#92;]</span>

where the positive semi-definiteness constraint selects the positive roots. Hence

<span>&#92;[ P = \begin{bmatrix} \sqrt{2}\,r^{1/4} & \sqrt{r} \\ \sqrt{r} & \sqrt{2}\,r^{3/4} \end{bmatrix}, &#92;]</span>

and the optimal gain is

<span>&#92;[ K = -R^{-1}B^T P = -\frac{1}{r}\begin{bmatrix} \sqrt{r} & \sqrt{2}\,r^{3/4} \end{bmatrix} = \begin{bmatrix} -r^{-1/2} & -\sqrt{2}\,r^{-1/4} \end{bmatrix}. &#92;]</span>

The closed-loop matrix <span>&#92;(A + BK&#92;)</span> has characteristic polynomial <span>&#92;(s^2 + \sqrt{2}/r^{1/4}\,s + 1/\sqrt{r}&#92;)</span>, whose roots have negative real parts for all <span>&#92;(r > 0&#92;)</span>, confirming stability.

---

#### Lecture 22: The Algebraic Riccati Equation — Existence and Uniqueness

In this lecture we investigate in detail the conditions under which the ARE (21.2) admits a stabilising solution and prove Theorem 21.3. The central tool is the **Hamiltonian matrix** associated with the LQR problem.

**Example 22.7.** Let

<span>&#92;[ A = \begin{bmatrix}2&0\\1&0\end{bmatrix},\quad B = \begin{bmatrix}1\\0\end{bmatrix},\quad C = \begin{bmatrix}1 & -1\end{bmatrix},\quad Q = C^T C,\quad R = 1. &#92;]</span>

One can verify from the PBH test that <span>&#92;((A,B)&#92;)</span> is controllable and <span>&#92;((A,C)&#92;)</span> is observable, hence <span>&#92;((A,Q)&#92;)</span> is detectable. The ARE has three solutions (listed explicitly in the notes), but only one is symmetric and positive semi-definite:

<span>&#92;[ P = \begin{bmatrix} 2+\sqrt{7} & 1 \\ 1 & 1+\sqrt{7} \end{bmatrix}. &#92;]</span>

With this <span>&#92;(P&#92;)</span>, the matrix <span>&#92;(A - BR^{-1}B^T P&#92;)</span> is Hurwitz and the optimal gain is <span>&#92;(K = -(2+\sqrt{7})\; -1&#92;)</span>.

#### The Hamiltonian Matrix

**Definition.** The **Hamiltonian matrix** associated with the LQR problem is

<span>&#92;[ \mathcal{H} = \begin{bmatrix} A & -BR^{-1}B^T \\ -Q & -A^T \end{bmatrix}. \tag{22.3} &#92;]</span>

A key algebraic identity connects the ARE to an invariant subspace of <span>&#92;(\mathcal{H}&#92;)</span>: one can show by direct computation that

<span>&#92;[ \begin{bmatrix} I & 0 \\ -P & I \end{bmatrix} \mathcal{H} \begin{bmatrix} I & 0 \\ P & I \end{bmatrix} = \begin{bmatrix} A - BR^{-1}B^T P & -BR^{-1}B^T \\ 0 & -A^T + PBR^{-1}B^T \end{bmatrix}. \tag{22.4} &#92;]</span>

The ARE (21.2) is exactly the condition obtained by equating the lower-left block of the right-hand side to zero.

**Lemma 22.8.** <span>&#92;(P&#92;)</span> solves the ARE (21.2) if and only if

<span>&#92;[ \mathcal{H}\begin{bmatrix}I\\P\end{bmatrix} = \begin{bmatrix}I\\P\end{bmatrix} \mathcal{H}_-, \tag{22.5} &#92;]</span>

for some matrix <span>&#92;(\mathcal{H}_-&#92;)</span>. If this holds, then <span>&#92;(\mathcal{H}_- = A - BR^{-1}B^T P&#92;)</span>.

*Proof.* Equation (22.4) is equivalent to

<span>&#92;[ \mathcal{H}\begin{bmatrix}I\\P\end{bmatrix} = \begin{bmatrix}I\\P\end{bmatrix}\mathcal{H}_-, &#92;]</span>

obtained by equating the first column on both sides of (22.4) after left-multiplying by <span>&#92;(\begin{bmatrix}I&0\\P&I\end{bmatrix}^{-1} = \begin{bmatrix}I&0\\-P&I\end{bmatrix}&#92;)</span>. Equation (22.5) states that the column space of <span>&#92;(\begin{bmatrix}I\\P\end{bmatrix}&#92;)</span> is an <span>&#92;(n&#92;)</span>-dimensional invariant subspace of <span>&#92;(\mathcal{H}&#92;)</span>.

#### Symmetry, Positive Semi-definiteness, and Uniqueness of the Stabilising Solution

Three fundamental properties of the stabilising solution of the ARE follow from Lemma 22.8.

**Symmetry.** Let <span>&#92;(P&#92;)</span> be a stabilising solution (so <span>&#92;(\mathcal{H}_-&#92;)</span> is Hurwitz). By (22.5),

<span>&#92;[ [-P^T\;\;I]\,\mathcal{H}\begin{bmatrix}I\\P\end{bmatrix} = (P - P^T)\mathcal{H}_-. &#92;]</span>

Direct computation shows the left-hand side equals <span>&#92;(-P^T A + P^T BR^{-1}B^T P - Q - A^T P&#92;)</span>, which is symmetric. Hence <span>&#92;((P - P^T)\mathcal{H}_-&#92;)</span> is symmetric, giving <span>&#92;(\mathcal{H}_-^T(P^T - P) + (P^T - P)\mathcal{H}_- = 0&#92;)</span>. Multiplying on the left by <span>&#92;(e^{t\mathcal{H}_-^T}&#92;)</span> and on the right by <span>&#92;(e^{t\mathcal{H}_-}&#92;)</span> shows that <span>&#92;(e^{t\mathcal{H}_-^T}(P^T - P)e^{t\mathcal{H}_-}&#92;)</span> is constant. Since <span>&#92;(\mathcal{H}_-&#92;)</span> is Hurwitz, both <span>&#92;(e^{t\mathcal{H}_-} \to 0&#92;)</span> and <span>&#92;(e^{t\mathcal{H}_-^T} \to 0&#92;)</span> as <span>&#92;(t \to \infty&#92;)</span>, forcing <span>&#92;(P^T - P = 0&#92;)</span>.

**Positive semi-definiteness.** This follows from symmetry and Theorem 21.2 (exercise).

**Uniqueness.** Let <span>&#92;(P_1&#92;)</span> and <span>&#92;(P_2&#92;)</span> both be stabilising solutions. By Lemma 22.8 each column space <span>&#92;(\operatorname{Im}\begin{bmatrix}I\\P_i\end{bmatrix}&#92;)</span> is an <span>&#92;(n&#92;)</span>-dimensional invariant subspace of <span>&#92;(\mathcal{H}&#92;)</span>, and because <span>&#92;(\mathcal{H}_-^{(i)} = A - BR^{-1}B^T P_i&#92;)</span> is Hurwitz, these are stable invariant subspaces. Identity (22.4) shows that <span>&#92;(\mathcal{H}&#92;)</span> is similar to a matrix with diagonal blocks <span>&#92;(\mathcal{H}_-&#92;)</span> and <span>&#92;(-A^T + PBR^{-1}B^T&#92;)</span>, which are negatives of each other's transpose; hence <span>&#92;(\mathcal{H}&#92;)</span> has exactly <span>&#92;(n&#92;)</span> eigenvalues with negative real parts and <span>&#92;(n&#92;)</span> with positive real parts. The <span>&#92;(n&#92;)</span>-dimensional stable invariant subspace of <span>&#92;(\mathcal{H}&#92;)</span> is therefore unique, so <span>&#92;(\operatorname{Im}\begin{bmatrix}I\\P_1\end{bmatrix} = \operatorname{Im}\begin{bmatrix}I\\P_2\end{bmatrix}&#92;)</span>, which implies <span>&#92;(P_1 = P_2&#92;)</span>.

#### Construction of the Stabilising Solution via the Stable Subspace

The preceding uniqueness argument suggests a constructive approach: find the stable invariant subspace of <span>&#92;(\mathcal{H}&#92;)</span> and extract <span>&#92;(P&#92;)</span> from it.

**Lemma 22.9.** The algebraic Riccati equation has a solution <span>&#92;(P&#92;)</span> such that <span>&#92;(A - BR^{-1}B^T P&#92;)</span> is Hurwitz if and only if <span>&#92;(\mathcal{H}&#92;)</span> has no eigenvalues on the imaginary axis and <span>&#92;((A,B)&#92;)</span> is stabilisable. Any such solution is symmetric and unique.

*Proof (construction).* If <span>&#92;(\mathcal{H}&#92;)</span> has no imaginary-axis eigenvalues, one can verify (using <span>&#92;(J^{-1}\mathcal{H}J = -\mathcal{H}^T&#92;)</span> for <span>&#92;(J = \begin{bmatrix}0&-I\\I&0\end{bmatrix}&#92;)</span>, which shows <span>&#92;(\mathcal{H}&#92;)</span> and <span>&#92;(-\mathcal{H}&#92;)</span> have the same eigenvalues) that exactly <span>&#92;(n&#92;)</span> eigenvalues lie in the open left half-plane. Let <span>&#92;(V \in \mathbb{R}^{2n \times n}&#92;)</span> be a matrix whose columns span the stable invariant subspace of <span>&#92;(\mathcal{H}&#92;)</span>, partitioned as <span>&#92;(V = \begin{bmatrix}X\\Y\end{bmatrix}&#92;)</span> with <span>&#92;(X,Y \in \mathbb{R}^{n\times n}&#92;)</span>. Then <span>&#92;(\mathcal{H}V = V\mathcal{H}_-&#92;)</span> for some Hurwitz <span>&#92;(\mathcal{H}_-&#92;)</span>.

The key step is showing that <span>&#92;(X&#92;)</span> is invertible. Suppose for contradiction that <span>&#92;(Xz = 0&#92;)</span> for some nonzero <span>&#92;(z&#92;)</span>. The upper block of <span>&#92;(\mathcal{H}V = V\mathcal{H}_-&#92;)</span> gives <span>&#92;(AX - BR^{-1}B^T Y = X\mathcal{H}_-&#92;)</span>. Multiplying by <span>&#92;(z&#92;)</span> and using <span>&#92;(X^TY = Y^TX&#92;)</span> (proved by an argument analogous to the symmetry proof above), together with the lower block equation <span>&#92;(-QX - A^T Y = Y\mathcal{H}_-&#92;)</span>, one deduces via the PBH test that <span>&#92;((A,B)&#92;)</span> is not stabilisable — a contradiction. Hence <span>&#92;(X&#92;)</span> is invertible and one can set <span>&#92;(P = YX^{-1}&#92;)</span>, which by Lemma 22.8 is a stabilising solution to the ARE.

#### The Condition for No Imaginary-Axis Eigenvalues of <span>&#92;(\mathcal{H}&#92;)</span>

**Lemma 22.10.** The Hamiltonian matrix <span>&#92;(\mathcal{H}&#92;)</span> has no eigenvalues on the imaginary axis if and only if <span>&#92;((A,B)&#92;)</span> is stabilisable and <span>&#92;((A,Q)&#92;)</span> is detectable.

*Proof.* Suppose <span>&#92;(\mathcal{H}&#92;)</span> has an imaginary eigenvalue <span>&#92;(\lambda = j\omega&#92;)</span> with eigenvector <span>&#92;((x_1,x_2)^T \neq 0&#92;)</span>. Forming the inner product

<span>&#92;[ [x_2^*\;\;x_1^*]\mathcal{H}\begin{bmatrix}x_1\\x_2\end{bmatrix} + [x_1^*\;\;x_2^*]\mathcal{H}\begin{bmatrix}x_2\\x_1\end{bmatrix} = (x_1^* x_2 + x_2^* x_1)(j\omega - j\omega) = 0, &#92;]</span>

and expanding the left-hand side using the definition of <span>&#92;(\mathcal{H}&#92;)</span> gives

<span>&#92;[ -2x_1^* Q x_1 - 2x_2^* BR^{-1}B^T x_2 = 0. &#92;]</span>

Since <span>&#92;(R > 0&#92;)</span> and <span>&#92;(Q \geq 0&#92;)</span>, this forces <span>&#92;(Qx_1 = 0&#92;)</span> and <span>&#92;(B^T x_2 = 0&#92;)</span>. Combined with the eigenvalue equation, the PBH test then shows that either <span>&#92;((A,Q)&#92;)</span> is not detectable or <span>&#92;((A^T,B^T)&#92;)</span> is not detectable (the latter being equivalent to <span>&#92;((A,B)&#92;)</span> not stabilisable). Conversely, if either condition fails, the PBH test provides an imaginary-axis eigenvector for <span>&#92;(\mathcal{H}&#92;)</span>.

#### Proof of Theorem 21.3

The proof of Theorem 21.3 now follows directly from Lemmas 22.9 and 22.10. Under the assumptions that <span>&#92;((A,B)&#92;)</span> is stabilisable and <span>&#92;((A,Q)&#92;)</span> is detectable, Lemma 22.10 guarantees that <span>&#92;(\mathcal{H}&#92;)</span> has no imaginary-axis eigenvalues. Lemma 22.9 then guarantees the existence, symmetry, and uniqueness of a stabilising solution <span>&#92;(P&#92;)</span> to the ARE. The positive semi-definiteness follows from Theorem 21.2. The converse (necessity of the two conditions) is immediate from Lemma 22.10.

The original sufficiency result is due to Kalman (1960, 1964), who required the stronger conditions of controllability and observability. Wonham (1968) weakened these to stabilisability and detectability, and Kucera (1972) established their necessity. In MATLAB, the stabilising solution of the ARE and the optimal LQR gain are computed by the command `lqr(A, B, Q, R)`.
