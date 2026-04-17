---
title: "PSYCH 420: Introduction to Computational Neuroscience Methods"
subjects: "PSYCH"
prof: "Britt Anderson"
---

## Sources and References

**Supplementary texts** — Dayan & Abbott, *Theoretical Neuroscience*; Izhikevich, *Dynamical Systems in Neuroscience*; Gerstner et al., *Neuronal Dynamics*; Haykin, *Neural Networks and Learning Machines*; Hertz, Krogh & Palmer, *Introduction to the Theory of Neural Computation*

**Online resources** — Course GitHub repository (Comp-Neuro-420, racket-book branch); MIT OpenCourseWare Computational Neuroscience resources; Neuromatch Academy open materials; Scholarpedia articles on computational neuroscience models

---

# Chapter 1: Introduction to Computational Neuroscience

## What Is Computational Neuroscience?

Computational neuroscience is a branch of neuroscience that uses mathematical models, theoretical analysis, and computer simulations to understand the principles governing the development, structure, physiology, and cognitive abilities of the nervous system. It sits at the intersection of neuroscience, mathematics, physics, and computer science, drawing methods and intuitions from each.

At its core, computational neuroscience asks: **how does the brain compute?** This question can be unpacked at multiple levels. We might ask how individual neurons process and transmit information, how networks of neurons give rise to perception and action, or how the large-scale architecture of the brain supports cognition, learning, and memory.

### Computational Neuroscience vs. Computational Cognitive Modeling

It is important to distinguish between two closely related but distinct enterprises:

**Computational neuroscience** focuses on understanding the brain as a biological organ. Models in computational neuroscience are typically grounded in the biophysics of neurons and synapses. They aim to explain phenomena such as action potential generation, synaptic transmission, neural oscillations, and sensory processing. The level of description ranges from molecular and cellular to systems and whole-brain.

**Computational cognitive modeling**, by contrast, focuses on understanding the mind as an information-processing system. Cognitive models need not be biologically detailed; they may instead capture abstract computational principles that explain behavioral data. Examples include connectionist models of language processing, Bayesian models of perception, and reinforcement learning models of decision making.

These two approaches are complementary. Computational neuroscience provides the biological substrate; computational cognitive modeling provides the functional description. This course explores both, with an emphasis on equipping psychology students with the mathematical and programming tools needed to engage with either tradition.

### A Brief History

The history of computational neuroscience can be traced through several landmark developments:

- **1907**: Louis Lapicque proposes the integrate-and-fire model of the neuron, one of the first mathematical descriptions of neural excitability.
- **1943**: Warren McCulloch and Walter Pitts publish their paper on logical calculi of neural activity, showing that networks of simplified neurons can compute any logical function.
- **1949**: Donald Hebb proposes the Hebbian learning rule in *The Organization of Behavior*, articulating the idea that "cells that fire together, wire together."
- **1952**: Alan Hodgkin and Andrew Huxley publish their Nobel Prize-winning model of the action potential in the squid giant axon.
- **1958**: Frank Rosenblatt introduces the perceptron, an early neural network capable of learning to classify patterns.
- **1969**: Marvin Minsky and Seymour Papert publish *Perceptrons*, highlighting limitations of single-layer networks and contributing to the first "AI winter."
- **1982**: John Hopfield introduces the Hopfield network, reviving interest in neural computation.
- **1986**: David Rumelhart, Geoffrey Hinton, and Ronald Williams popularize the backpropagation algorithm for training multilayer neural networks.
- **2000s–present**: The deep learning revolution, large-scale brain simulation projects, and the development of computational psychiatry as a clinical discipline.

### Levels of Analysis

David Marr's influential framework (1982) proposed three levels at which any information-processing system can be understood:

1. **Computational level**: What problem is the system solving, and why?
2. **Algorithmic level**: What representations and processes does the system use to solve the problem?
3. **Implementational level**: How are the algorithms physically realized in neural hardware?

Computational neuroscience operates primarily at the implementational and algorithmic levels, while computational cognitive modeling often operates at the computational and algorithmic levels. A complete understanding of the brain and mind requires integration across all three levels.

## Modeling Approaches

### What Is a Model?

A **model** is a simplified representation of a system that captures its essential features while omitting irrelevant detail. In computational neuroscience, models are expressed mathematically and implemented in code. Every model involves trade-offs between biological realism, mathematical tractability, and computational efficiency.

### Types of Models

Models in computational neuroscience can be organized along a spectrum of biological detail:

<div class="definition">
<strong>Biophysical models</strong> capture the detailed biophysics of neurons, including ion channel kinetics, dendritic morphology, and synaptic dynamics. The Hodgkin-Huxley model is the paradigmatic example.
</div>

<div class="definition">
<strong>Reduced models</strong> simplify the biophysics to a small number of variables that capture essential dynamics. Examples include the FitzHugh-Nagumo and Izhikevich models.
</div>

<div class="definition">
<strong>Abstract models</strong> treat neurons as simple input-output units, emphasizing network-level computation over single-neuron biophysics. Artificial neural networks and rate-based models fall into this category.
</div>

<div class="definition">
<strong>Normative models</strong> derive what the brain <em>should</em> compute from first principles (e.g., Bayesian inference, optimal control), then ask whether neural circuits implement those computations.
</div>

### The Modeling Cycle

Good computational neuroscience follows a cycle:

1. **Observe** a biological or psychological phenomenon.
2. **Hypothesize** a mechanism using mathematical formalism.
3. **Simulate** the model computationally.
4. **Predict** new experimental outcomes from the model.
5. **Test** predictions against empirical data.
6. **Refine** the model based on discrepancies.

This cycle is what gives computational neuroscience its explanatory power: models are not merely descriptive but generate testable predictions.

## Why Should Psychology Students Care?

Psychology students may wonder why they should learn about differential equations and linear algebra. There are several compelling reasons:

First, many psychological phenomena have been given rigorous computational accounts. Theories of attention, learning, memory, perception, and decision making all have mathematical formulations. Understanding these formulations is necessary for engaging with the primary literature.

Second, computational models provide a disciplined way to formalize verbal theories. Psychology has a long tradition of verbal theorizing, but verbal theories can be vague, ambiguous, or internally inconsistent. Translating a theory into a computational model forces precision.

Third, computational methods are increasingly central to clinical psychology and psychiatry. Computational psychiatry uses formal models to characterize individual differences in cognition and to develop personalized treatments.

---

# Chapter 2: Mathematical Foundations

## Differential Equations Review

Many neural models are expressed as differential equations. A **differential equation** is an equation that relates a function to its derivatives. In neuroscience, the function typically describes some quantity (membrane potential, firing rate, synaptic weight) that changes over time.

### Ordinary Differential Equations

An **ordinary differential equation** (ODE) involves a function of one independent variable (usually time) and its derivatives. The general first-order ODE has the form:

\[
\frac{dx}{dt} = f(x, t)
\]

where \( x(t) \) is the unknown function and \( f \) specifies how \( x \) changes with time. The order of a differential equation refers to the highest derivative that appears.

<div class="example">
<strong>Example: Exponential decay.</strong> The simplest ODE relevant to neuroscience describes exponential decay:

\[
\frac{dx}{dt} = -\frac{x}{\tau}
\]

where \( \tau \) is the <em>time constant</em>. The solution is \( x(t) = x_0 \, e^{-t/\tau} \), where \( x_0 = x(0) \) is the initial value. This equation describes how a neuron's membrane potential returns to rest after a perturbation.
</div>

### Equilibrium Points and Stability

An **equilibrium point** (or fixed point) of the ODE \( \frac{dx}{dt} = f(x) \) is a value \( x^* \) such that \( f(x^*) = 0 \). At an equilibrium, the system does not change.

The stability of an equilibrium can be determined by examining the derivative of \( f \) at the fixed point:

- If \( f'(x^*) < 0 \), the equilibrium is **stable** (perturbations decay back to \( x^* \)).
- If \( f'(x^*) > 0 \), the equilibrium is **unstable** (perturbations grow away from \( x^* \)).

<div class="definition">
<strong>Linear stability analysis</strong> is the technique of linearizing the dynamics near an equilibrium point to determine its stability. For a one-dimensional system, this amounts to checking the sign of \( f'(x^*) \). For higher-dimensional systems, it requires examining the eigenvalues of the Jacobian matrix.
</div>

### Numerical Methods for ODEs

Most neural models cannot be solved analytically; we must resort to numerical integration. The simplest method is **Euler's method**:

\[
x(t + \Delta t) \approx x(t) + \Delta t \cdot f(x(t), t)
\]

Euler's method approximates the continuous dynamics by taking small discrete time steps of size \( \Delta t \). While simple, it can be inaccurate or unstable for stiff systems. More sophisticated methods include:

- **Runge-Kutta methods** (especially the fourth-order method, RK4), which achieve higher accuracy by evaluating \( f \) at multiple points within each time step.
- **Implicit methods** (e.g., backward Euler), which are more stable for stiff equations but require solving an equation at each step.

In pseudocode, Euler's method is:

```
initialize x = x0, t = 0
while t < T:
    x = x + dt * f(x, t)
    t = t + dt
    record (t, x)
```

The fourth-order Runge-Kutta method:

```
initialize x = x0, t = 0
while t < T:
    k1 = f(x, t)
    k2 = f(x + 0.5*dt*k1, t + 0.5*dt)
    k3 = f(x + 0.5*dt*k2, t + 0.5*dt)
    k4 = f(x + dt*k3, t + dt)
    x = x + (dt/6)*(k1 + 2*k2 + 2*k3 + k4)
    t = t + dt
    record (t, x)
```

## Linear Algebra Review

Linear algebra is essential for understanding neural networks and for analyzing systems of differential equations. Here we review the key concepts needed throughout this course.

### Vectors and Matrices

A **vector** in \( \mathbb{R}^n \) is an ordered list of \( n \) real numbers. Vectors represent quantities such as firing rates of a population of neurons, synaptic weights, or input features.

A **matrix** is a rectangular array of numbers. An \( m \times n \) matrix \( A \) has \( m \) rows and \( n \) columns. Matrices represent linear transformations: the product \( A\mathbf{x} \) transforms the vector \( \mathbf{x} \) by the linear map encoded in \( A \).

### Matrix Multiplication

Given a matrix \( A \) of size \( m \times n \) and a vector \( \mathbf{x} \) of size \( n \times 1 \), the product \( A\mathbf{x} \) is a vector of size \( m \times 1 \) whose \( i \)-th component is:

\[
(A\mathbf{x})_i = \sum_{j=1}^{n} A_{ij} x_j
\]

This operation is fundamental in neural networks, where the activity of one layer is computed as a matrix-vector product of weights and inputs, followed by a nonlinear activation function.

### Eigenvalues and Eigenvectors

An **eigenvector** of a square matrix \( A \) is a nonzero vector \( \mathbf{v} \) such that:

\[
A\mathbf{v} = \lambda \mathbf{v}
\]

where \( \lambda \) is the corresponding **eigenvalue**. Eigenvalues and eigenvectors are crucial for stability analysis: the eigenvalues of the Jacobian matrix at an equilibrium determine whether the equilibrium is stable, unstable, or oscillatory.

<div class="theorem">
<strong>Stability criterion for linear systems.</strong> For the linear system \( \frac{d\mathbf{x}}{dt} = A\mathbf{x} \), the equilibrium at the origin is:
<ul>
<li>Stable if all eigenvalues of \( A \) have negative real parts</li>
<li>Unstable if any eigenvalue has a positive real part</li>
<li>A center (neutrally stable) if all eigenvalues are purely imaginary</li>
</ul>
</div>

### Dot Products and Projections

The **dot product** (or inner product) of two vectors \( \mathbf{u} \) and \( \mathbf{v} \) in \( \mathbb{R}^n \) is:

\[
\mathbf{u} \cdot \mathbf{v} = \sum_{i=1}^{n} u_i v_i
\]

The dot product measures the extent to which two vectors point in the same direction. It appears in neural models as the weighted sum of inputs to a neuron.

## Dynamical Systems Basics

A **dynamical system** is a mathematical system that describes how a point in a state space evolves over time according to a fixed rule. In computational neuroscience, the state might represent the membrane potential of a neuron, the firing rates of a population, or the weights of a neural network during learning.

### Phase Space and Trajectories

The **phase space** (or state space) of a dynamical system is the set of all possible states. For a system with \( n \) state variables, the phase space is \( \mathbb{R}^n \). A **trajectory** is the path traced out by the state of the system as it evolves in time.

For a two-dimensional system:

\[
\frac{dx}{dt} = f(x, y), \quad \frac{dy}{dt} = g(x, y)
\]

the phase space is the \( xy \)-plane, and trajectories are curves in this plane. The direction and speed of motion at each point are given by the vector field \( (f(x,y), g(x,y)) \).

### Bifurcations

A **bifurcation** occurs when a small change in a parameter causes a qualitative change in the system's behavior, such as the appearance or disappearance of equilibria, or the onset of oscillations. Bifurcations are important in neuroscience because they can explain how neurons switch between resting and firing states.

Common bifurcation types include:

- **Saddle-node bifurcation**: Two equilibria (one stable, one unstable) collide and annihilate.
- **Hopf bifurcation**: A stable equilibrium loses stability and a limit cycle (oscillation) is born.
- **Pitchfork bifurcation**: A symmetric system splits one equilibrium into three.

---

# Chapter 3: The Neuron: Biology and Models

## Biological Neurons

The **neuron** is the fundamental information-processing unit of the nervous system. The human brain contains approximately 86 billion neurons, each making thousands of synaptic connections. Despite tremendous diversity in morphology and function, most neurons share a common structural plan.

### Anatomy of a Neuron

A typical neuron consists of:

- **Dendrites**: Branching structures that receive synaptic inputs from other neurons. The dendritic tree integrates thousands of incoming signals.
- **Soma (cell body)**: Contains the nucleus and metabolic machinery. Integrates dendritic inputs and, if sufficiently excited, initiates an action potential.
- **Axon**: A long, thin projection that carries the action potential away from the soma to other neurons. Axons can extend from micrometers to over a meter in length.
- **Axon terminals (synaptic boutons)**: The endpoints of the axon, where neurotransmitter is released onto target neurons at synapses.

### The Cell Membrane

The cell membrane is a lipid bilayer that separates the intracellular and extracellular environments. It is studded with **ion channels**, proteins that allow specific ions to flow across the membrane. The membrane acts as a capacitor (storing charge) and a resistor (ion channels provide conductance pathways).

## Membrane Potential

The **membrane potential** \( V_m \) is the voltage difference between the inside and outside of the cell. At rest, a typical neuron maintains a resting potential of approximately \( -70 \) mV, meaning the inside of the cell is negatively charged relative to the outside.

### The Nernst Equation

The equilibrium potential for a single ion species is given by the **Nernst equation**:

\[
E_{\text{ion}} = \frac{RT}{zF} \ln \frac{\left[\text{ion}\right]_{\text{out}}}{\left[\text{ion}\right]_{\text{in}}}
\]

where \( R \) is the gas constant, \( T \) is temperature in Kelvin, \( z \) is the valence of the ion, and \( F \) is Faraday's constant. At body temperature, this simplifies to approximately:

\[
E_{\text{ion}} \approx \frac{61.5 \text{ mV}}{z} \log_{10} \frac{\left[\text{ion}\right]_{\text{out}}}{\left[\text{ion}\right]_{\text{in}}}
\]

<div class="example">
<strong>Example: Potassium equilibrium potential.</strong> For potassium (\( K^+ \)), with typical concentrations \( \left[K^+\right]_{\text{in}} = 140 \) mM and \( \left[K^+\right]_{\text{out}} = 5 \) mM, and \( z = +1 \):

\[
E_K \approx 61.5 \, \text{mV} \cdot \log_{10} \frac{5}{140} \approx -89 \, \text{mV}
\]
</div>

### The Goldman-Hodgkin-Katz Equation

When multiple ion species contribute to the membrane potential, the resting potential is approximated by the **Goldman-Hodgkin-Katz (GHK) voltage equation**:

\[
V_m = \frac{RT}{F} \ln \frac{P_K \left[K^+\right]_{\text{out}} + P_{Na} \left[Na^+\right]_{\text{out}} + P_{Cl} \left[Cl^-\right]_{\text{in}}}{P_K \left[K^+\right]_{\text{in}} + P_{Na} \left[Na^+\right]_{\text{in}} + P_{Cl} \left[Cl^-\right]_{\text{out}}}
\]

where \( P_K \), \( P_{Na} \), and \( P_{Cl} \) are the membrane permeabilities to potassium, sodium, and chloride, respectively.

## Ion Channels

**Ion channels** are transmembrane proteins that form pores allowing ions to cross the membrane. They are the molecular basis of electrical signaling in the nervous system.

### Types of Ion Channels

| Channel Type | Gating Mechanism | Examples |
|---|---|---|
| Leak channels | Always open | Potassium leak channels |
| Voltage-gated | Opened/closed by membrane potential | Na\(_v\), K\(_v\) channels |
| Ligand-gated | Opened by neurotransmitter binding | AMPA, NMDA, GABA\(_A\) receptors |
| Mechanically gated | Opened by physical force | Hair cell channels in cochlea |

### Conductance-Based Models

Ion channels are modeled as variable conductances. The current through a population of channels carrying ion \( X \) is:

\[
I_X = g_X (V_m - E_X)
\]

where \( g_X \) is the conductance (which may depend on voltage and time) and \( E_X \) is the reversal potential. This is simply Ohm's law applied to the ionic current.

## Action Potentials

The **action potential** is a rapid, transient reversal of the membrane potential that propagates along the axon. It is the primary means by which neurons communicate over long distances.

### The Action Potential Mechanism

The action potential involves a stereotyped sequence of events:

1. **Depolarization**: An excitatory input raises the membrane potential above the **threshold** (approximately \( -55 \) mV).
2. **Rising phase**: Voltage-gated sodium channels open rapidly, allowing Na\(^+\) to rush into the cell. The membrane potential shoots toward \( E_{Na} \approx +50 \) mV.
3. **Falling phase**: Sodium channels inactivate, and voltage-gated potassium channels open, allowing K\(^+\) to flow out. The membrane potential returns toward \( E_K \).
4. **Undershoot (hyperpolarization)**: Potassium channels remain open briefly, causing the membrane potential to dip below the resting level.
5. **Recovery**: Channels return to their resting states, and the membrane potential returns to rest.

### The Refractory Period

After an action potential, the neuron enters a **refractory period** during which it is difficult or impossible to fire another action potential. The **absolute refractory period** (during which firing is impossible, regardless of stimulus strength) lasts approximately 1 ms. The **relative refractory period** (during which a stronger-than-normal stimulus is required) lasts several more milliseconds. These refractory periods limit the maximum firing rate to approximately 500-1000 Hz and ensure that action potentials propagate in one direction.

---

# Chapter 4: Spiking Neuron Models

This chapter surveys the major mathematical models of spiking neurons, ranging from simple integrate-and-fire models to the biophysically detailed Hodgkin-Huxley model.

## The Integrate-and-Fire Model

The **integrate-and-fire (IF)** model is the simplest spiking neuron model. It captures the essential feature that a neuron integrates its inputs until reaching a threshold, then fires and resets.

### Leaky Integrate-and-Fire (LIF)

The most common variant is the **leaky integrate-and-fire** model:

\[
\tau_m \frac{dV}{dt} = -(V - V_{\text{rest}}) + R_m I(t)
\]

where \( \tau_m = R_m C_m \) is the membrane time constant, \( V_{\text{rest}} \) is the resting potential, \( R_m \) is the membrane resistance, \( C_m \) is the membrane capacitance, and \( I(t) \) is the input current.

The firing rule is:

\[
\text{If } V(t) \geq V_{\text{th}}, \text{ then } V \to V_{\text{reset}} \text{ and a spike is recorded.}
\]

<div class="remark">
The LIF model has the circuit interpretation of a parallel RC circuit driven by a current source. The "leaky" in the name refers to the fact that the membrane potential decays back to rest in the absence of input, with time constant \( \tau_m \).
</div>

### Strengths and Limitations

The LIF model is computationally efficient and analytically tractable. For a constant input current \( I \), the firing rate can be computed analytically:

\[
r = \left[\tau_m \ln \frac{R_m I - (V_{\text{th}} - V_{\text{rest}})}{R_m I - (V_{\text{reset}} - V_{\text{rest}})} + \tau_{\text{ref}} \right]^{-1}
\]

where \( \tau_{\text{ref}} \) is the absolute refractory period (if included). This is the **f-I curve** (firing rate as a function of input current).

However, the LIF model has notable limitations: it does not produce realistic spike shapes, cannot exhibit bursting or adaptation, and the spike is not a dynamic event but an imposed rule.

## The Hodgkin-Huxley Model

The **Hodgkin-Huxley (HH) model** (1952) is the gold standard of biophysical neuron modeling. It describes the action potential in terms of voltage-dependent sodium and potassium conductances.

### The Equations

The HH model consists of four coupled ODEs:

\[
C_m \frac{dV}{dt} = -g_{Na} m^3 h (V - E_{Na}) - g_K n^4 (V - E_K) - g_L (V - E_L) + I(t)
\]

\[
\frac{dm}{dt} = \alpha_m(V)(1 - m) - \beta_m(V)m
\]

\[
\frac{dh}{dt} = \alpha_h(V)(1 - h) - \beta_h(V)h
\]

\[
\frac{dn}{dt} = \alpha_n(V)(1 - n) - \beta_n(V)n
\]

Here:
- \( V \) is the membrane potential
- \( m \) is the sodium activation variable (fast)
- \( h \) is the sodium inactivation variable (slow)
- \( n \) is the potassium activation variable (slow)
- \( g_{Na} \), \( g_K \), \( g_L \) are maximal conductances for sodium, potassium, and leak
- \( E_{Na} \), \( E_K \), \( E_L \) are reversal potentials
- \( \alpha \) and \( \beta \) are voltage-dependent rate functions

The gating variables \( m \), \( h \), and \( n \) range between 0 and 1 and represent the probability that individual channel gates are in their open state.

<div class="definition">
<strong>Gating kinetics.</strong> Each gating variable \( x \in \{m, h, n\} \) satisfies first-order kinetics that can equivalently be written as:

\[
\tau_x(V) \frac{dx}{dt} = x_\infty(V) - x
\]

where \( x_\infty(V) = \frac{\alpha_x(V)}{\alpha_x(V) + \beta_x(V)} \) is the steady-state value and \( \tau_x(V) = \frac{1}{\alpha_x(V) + \beta_x(V)} \) is the time constant at voltage \( V \).
</div>

### Original Parameter Values

Hodgkin and Huxley fitted their model to data from the squid giant axon:

| Parameter | Value |
|---|---|
| \( C_m \) | 1 \( \mu \)F/cm\(^2\) |
| \( g_{Na} \) | 120 mS/cm\(^2\) |
| \( g_K \) | 36 mS/cm\(^2\) |
| \( g_L \) | 0.3 mS/cm\(^2\) |
| \( E_{Na} \) | +50 mV |
| \( E_K \) | \(-77\) mV |
| \( E_L \) | \(-54.4\) mV |

### Simulating the HH Model

Simulating the Hodgkin-Huxley model requires numerically integrating the four coupled ODEs. In pseudocode:

```
initialize V, m, h, n to resting values
for each time step dt:
    compute alpha_m, beta_m, alpha_h, beta_h, alpha_n, beta_n from V
    I_Na = g_Na * m^3 * h * (V - E_Na)
    I_K  = g_K  * n^4 * (V - E_K)
    I_L  = g_L  * (V - E_L)
    dV = (-I_Na - I_K - I_L + I_ext) / C_m
    dm = alpha_m*(1-m) - beta_m*m
    dh = alpha_h*(1-h) - beta_h*h
    dn = alpha_n*(1-n) - beta_n*n
    V = V + dt * dV
    m = m + dt * dm
    h = h + dt * dh
    n = n + dt * dn
    record V
```

A time step of \( \Delta t = 0.01 \) ms is typically sufficient for Euler's method; RK4 allows larger steps.

## The FitzHugh-Nagumo Model

The **FitzHugh-Nagumo (FHN) model** is a two-dimensional reduction of the Hodgkin-Huxley model that retains the essential qualitative dynamics while being much easier to analyze.

\[
\frac{dv}{dt} = v - \frac{v^3}{3} - w + I
\]

\[
\frac{dw}{dt} = \epsilon(v + a - bw)
\]

where \( v \) is a voltage-like variable, \( w \) is a recovery variable (analogous to the slow potassium and sodium inactivation dynamics), \( I \) is external current, and \( \epsilon \ll 1 \) ensures that \( w \) changes much more slowly than \( v \).

<div class="remark">
The FHN model was developed independently by Richard FitzHugh (1961) and Jin-ichi Nagumo et al. (1962). FitzHugh derived it as a simplification of the HH equations; Nagumo built an electronic circuit that implemented the same equations.
</div>

### Phase Plane Analysis of the FHN Model

Because the FHN model is two-dimensional, it is amenable to **phase plane analysis**. The key constructs are:

- **Nullclines**: The \( v \)-nullcline is the curve where \( dv/dt = 0 \), i.e., \( w = v - v^3/3 + I \). The \( w \)-nullcline is the line where \( dw/dt = 0 \), i.e., \( w = (v + a)/b \).
- **Equilibria** occur where the nullclines intersect.
- The shape and relative position of the nullclines determine whether the system has a stable rest state, oscillates, or exhibits excitable behavior.

For small \( I \), the system is **excitable**: it rests at a stable equilibrium but, given a sufficiently large perturbation, executes a large excursion through phase space (corresponding to an action potential) before returning to rest. As \( I \) increases, a **Hopf bifurcation** occurs and the system enters sustained oscillations (repetitive firing).

## The Izhikevich Model

Eugene Izhikevich (2003) proposed a model that is nearly as computationally efficient as the LIF model but can reproduce the firing patterns of virtually all known cortical neuron types.

\[
\frac{dv}{dt} = 0.04v^2 + 5v + 140 - u + I
\]

\[
\frac{du}{dt} = a(bv - u)
\]

with the reset rule:

\[
\text{If } v \geq 30 \text{ mV, then } v \to c, \; u \to u + d
\]

The four parameters \( (a, b, c, d) \) control different aspects of the dynamics:

| Parameter | Controls |
|---|---|
| \( a \) | Time scale of recovery variable \( u \) |
| \( b \) | Sensitivity of \( u \) to subthreshold fluctuations of \( v \) |
| \( c \) | After-spike reset value of \( v \) |
| \( d \) | After-spike increment of \( u \) |

<div class="example">
<strong>Example firing patterns.</strong> By choosing different parameter values, the Izhikevich model reproduces:
<ul>
<li><strong>Regular spiking</strong> (\( a=0.02, b=0.2, c=-65, d=8 \)): The most common cortical excitatory neuron type.</li>
<li><strong>Fast spiking</strong> (\( a=0.1, b=0.2, c=-65, d=2 \)): Characteristic of cortical inhibitory interneurons.</li>
<li><strong>Chattering</strong> (\( a=0.02, b=0.2, c=-50, d=2 \)): Produces rhythmic bursts of spikes.</li>
<li><strong>Intrinsically bursting</strong> (\( a=0.02, b=0.2, c=-55, d=4 \)): An initial burst followed by regular spiking.</li>
</ul>
</div>

### Comparing Neuron Models

| Model | Dimensions | Biological Realism | Computational Cost | Spike Shape |
|---|---|---|---|---|
| Leaky IF | 1 + reset | Low | Very low | Artificial |
| FitzHugh-Nagumo | 2 | Moderate | Low | Qualitative |
| Izhikevich | 2 + reset | Moderate | Low | Qualitative |
| Hodgkin-Huxley | 4 | High | Moderate | Realistic |

---

# Chapter 5: Differential Equations in Neural Modeling

## Phase Planes

For two-dimensional systems of ODEs, the **phase plane** is a powerful visual tool for understanding dynamics without solving the equations explicitly.

### Constructing a Phase Portrait

Given a system:

\[
\frac{dx}{dt} = f(x, y), \quad \frac{dy}{dt} = g(x, y)
\]

the phase portrait consists of:

1. **The vector field**: At each point \( (x, y) \), draw an arrow with components \( (f(x,y), g(x,y)) \).
2. **Nullclines**: The \( x \)-nullcline is the set of points where \( f(x,y) = 0 \); the \( y \)-nullcline is where \( g(x,y) = 0 \).
3. **Equilibria**: Points where both nullclines intersect, so \( f = g = 0 \).
4. **Trajectories**: Curves that are everywhere tangent to the vector field.

Nullclines divide the phase plane into regions where the signs of \( dx/dt \) and \( dy/dt \) are constant. This allows one to determine the direction of flow in each region without computation.

## Stability Analysis

### Linear Systems

For a linear system \( \frac{d\mathbf{x}}{dt} = A\mathbf{x} \) with \( \mathbf{x} \in \mathbb{R}^2 \), the behavior near the origin is completely determined by the eigenvalues \( \lambda_1, \lambda_2 \) of \( A \).

| Eigenvalues | Behavior | Name |
|---|---|---|
| Both real, both negative | Trajectories converge to origin | Stable node |
| Both real, both positive | Trajectories diverge from origin | Unstable node |
| Real, opposite signs | One direction converges, one diverges | Saddle point |
| Complex with negative real part | Spiraling inward | Stable spiral (focus) |
| Complex with positive real part | Spiraling outward | Unstable spiral |
| Purely imaginary | Closed orbits | Center |

### Linearization of Nonlinear Systems

For a nonlinear system, we can study local stability by **linearizing** around an equilibrium \( (x^*, y^*) \). The **Jacobian matrix** at the equilibrium is:

\[
J = \begin{pmatrix} \frac{\partial f}{\partial x} & \frac{\partial f}{\partial y} \\ \frac{\partial g}{\partial x} & \frac{\partial g}{\partial y} \end{pmatrix} \Bigg|_{(x^*, y^*)}
\]

The eigenvalues of \( J \) determine the local behavior, just as for linear systems. This is the **Hartman-Grobman theorem**: near a hyperbolic equilibrium (one with no eigenvalues on the imaginary axis), the nonlinear system behaves qualitatively like its linearization.

## Bifurcations in Neural Models

Bifurcations explain how neurons transition between quiescence and repetitive firing as parameters (such as applied current) change.

### Saddle-Node Bifurcation

In a **saddle-node bifurcation**, a stable and an unstable equilibrium collide and disappear. In the context of neural models, this transition often corresponds to the onset of firing. The canonical form is:

\[
\frac{dx}{dt} = r + x^2
\]

For \( r < 0 \), there are two equilibria: \( x^* = \pm \sqrt{-r} \). At \( r = 0 \), they merge. For \( r > 0 \), there are no equilibria. Neurons that begin firing through a saddle-node bifurcation are called **Type I neurons** and can fire at arbitrarily low rates near onset.

### Hopf Bifurcation

In a **Hopf bifurcation**, a stable equilibrium loses stability and gives birth to a limit cycle (periodic orbit). The canonical form in polar coordinates is:

\[
\frac{dr}{dt} = \mu r - r^3, \quad \frac{d\theta}{dt} = \omega
\]

For \( \mu < 0 \), the origin is a stable spiral. At \( \mu = 0 \), it becomes a center. For \( \mu > 0 \), a stable limit cycle of radius \( r = \sqrt{\mu} \) surrounds the now-unstable origin. Neurons that begin firing through a Hopf bifurcation are called **Type II neurons** and begin firing at a nonzero minimum frequency.

<div class="theorem">
<strong>Excitability classification.</strong> The dynamical mechanism by which a neuron transitions from rest to repetitive firing determines its excitability class:
<ul>
<li><strong>Type I</strong>: Onset via saddle-node bifurcation. Continuous f-I curve. Arbitrary low frequencies possible.</li>
<li><strong>Type II</strong>: Onset via Hopf bifurcation. Discontinuous f-I curve. Minimum firing frequency at onset.</li>
</ul>
This classification, due to Hodgkin (1948) and formalized by Rinzel and Ermentrout, has important consequences for neural coding.
</div>

## Numerical Methods in Practice

### Choosing a Time Step

The time step \( \Delta t \) must be small enough to accurately capture the dynamics. For the Hodgkin-Huxley model, the fastest time scale is the sodium activation variable \( m \), with a time constant as small as 0.1 ms. A rule of thumb is that \( \Delta t \) should be at least 5-10 times smaller than the fastest time constant.

### Stiffness

A system is **stiff** when it contains dynamics on vastly different time scales. The HH model is mildly stiff: \( m \) changes on a sub-millisecond time scale while \( n \) and \( h \) change over several milliseconds. Stiff systems may require implicit methods or adaptive step-size algorithms for stable numerical integration.

### Adaptive Methods

Adaptive step-size methods (such as the Dormand-Prince variant of RK45) adjust \( \Delta t \) automatically: smaller steps when the solution changes rapidly, larger steps when it changes slowly. Most scientific computing libraries (e.g., SciPy's `solve_ivp`) use adaptive methods by default.

---

# Chapter 6: Neural Networks: Foundations

## From Biological to Artificial Neural Networks

The study of artificial neural networks (ANNs) was inspired by the brain, though modern ANNs have diverged considerably from biological reality. Nevertheless, the foundational ideas connect directly to neuroscience.

### The McCulloch-Pitts Neuron (1943)

The simplest model of a neuron as a computational element is the **McCulloch-Pitts (MCP) neuron**. It takes binary inputs, computes a weighted sum, and outputs 1 if the sum exceeds a threshold, 0 otherwise:

\[
y = \begin{cases} 1 & \text{if } \sum_{i} w_i x_i \geq \theta \\ 0 & \text{otherwise} \end{cases}
\]

McCulloch and Pitts showed that networks of such neurons can compute any logical function, establishing a foundational connection between neural computation and logic.

## Perceptrons

### The Single-Layer Perceptron

Frank Rosenblatt's **perceptron** (1958) extended the MCP neuron by adding a learning rule. The perceptron computes:

\[
y = \sigma\left(\sum_{i=1}^{n} w_i x_i + b\right) = \sigma(\mathbf{w} \cdot \mathbf{x} + b)
\]

where \( \sigma \) is a step function (or, in modern networks, a differentiable activation function), \( \mathbf{w} \) is the weight vector, and \( b \) is the bias.

<div class="definition">
<strong>Perceptron learning rule.</strong> Given a training example \( (\mathbf{x}, t) \) where \( t \) is the target output, the perceptron updates its weights:

\[
w_i \leftarrow w_i + \eta (t - y) x_i
\]

where \( \eta > 0 \) is the <em>learning rate</em> and \( y \) is the current output. This rule increases weights for inputs that should contribute to firing and decreases weights for inputs that should not.
</div>

<div class="theorem">
<strong>Perceptron convergence theorem.</strong> If the training data is linearly separable, the perceptron learning rule is guaranteed to converge to a set of weights that correctly classifies all examples in a finite number of steps.
</div>

### Limitations of the Perceptron

Minsky and Papert (1969) proved that a single-layer perceptron cannot learn functions that are not linearly separable. The classic example is the **XOR function**:

| \( x_1 \) | \( x_2 \) | XOR |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

No single hyperplane can separate the 0 outputs from the 1 outputs. This limitation can be overcome by using multiple layers.

## Learning Rules

### Hebbian Learning

**Hebbian learning** is the oldest and most biologically grounded learning rule. Hebb's postulate (1949) states: when neuron A repeatedly participates in firing neuron B, the synaptic connection from A to B is strengthened.

Mathematically, the simplest Hebbian rule is:

\[
\Delta w_{ij} = \eta \, x_i \, y_j
\]

where \( x_i \) is the presynaptic activity, \( y_j \) is the postsynaptic activity, and \( \eta \) is the learning rate.

<div class="remark">
Pure Hebbian learning is unstable: weights grow without bound because correlated activity always increases the weight. Biologically plausible variants include <strong>Oja's rule</strong> (which includes a normalization term) and <strong>BCM theory</strong> (which introduces a sliding threshold for potentiation vs. depression).
</div>

**Oja's rule** adds a decay term to stabilize learning:

\[
\Delta w_i = \eta \, y(x_i - y \, w_i)
\]

This rule causes the weight vector to converge to the first principal component of the input data, providing a neural implementation of PCA.

### Spike-Timing-Dependent Plasticity (STDP)

A more biologically realistic form of Hebbian learning is **spike-timing-dependent plasticity (STDP)**. The sign and magnitude of the synaptic change depend on the relative timing of pre- and postsynaptic spikes:

\[
\Delta w = \begin{cases} A_+ \exp\left(-\frac{\Delta t}{\tau_+}\right) & \text{if } \Delta t > 0 \text{ (pre before post: potentiation)} \\ -A_- \exp\left(\frac{\Delta t}{\tau_-}\right) & \text{if } \Delta t < 0 \text{ (post before pre: depression)} \end{cases}
\]

where \( \Delta t = t_{\text{post}} - t_{\text{pre}} \). This temporal asymmetry provides a mechanism for learning causal relationships.

## Backpropagation

### Multilayer Networks

A **multilayer perceptron** (MLP) consists of an input layer, one or more hidden layers, and an output layer. Each layer applies a linear transformation followed by a nonlinear activation function:

\[
\mathbf{h}^{(l)} = \sigma\left(W^{(l)} \mathbf{h}^{(l-1)} + \mathbf{b}^{(l)}\right)
\]

where \( W^{(l)} \) is the weight matrix for layer \( l \), \( \mathbf{b}^{(l)} \) is the bias vector, and \( \sigma \) is the activation function applied element-wise.

### The Backpropagation Algorithm

**Backpropagation** (Rumelhart, Hinton, Williams, 1986) is an efficient method for computing the gradient of a loss function with respect to all weights in a multilayer network. It applies the chain rule of calculus, layer by layer, from the output back to the input.

Given a loss function \( L \) (e.g., mean squared error or cross-entropy), the gradient with respect to a weight in layer \( l \) is:

\[
\frac{\partial L}{\partial W^{(l)}} = \frac{\partial L}{\partial \mathbf{h}^{(l)}} \cdot \frac{\partial \mathbf{h}^{(l)}}{\partial W^{(l)}}
\]

The key insight is that the error signal \( \frac{\partial L}{\partial \mathbf{h}^{(l)}} \) at layer \( l \) can be computed from the error signal at layer \( l+1 \) using the chain rule:

\[
\delta^{(l)} = \left((W^{(l+1)})^T \delta^{(l+1)}\right) \odot \sigma'\left(W^{(l)} \mathbf{h}^{(l-1)} + \mathbf{b}^{(l)}\right)
\]

where \( \odot \) denotes element-wise multiplication and \( \sigma' \) is the derivative of the activation function.

In pseudocode:

```
Forward pass:
    for l = 1 to L:
        z[l] = W[l] * h[l-1] + b[l]
        h[l] = sigma(z[l])
    compute loss L(h[L], target)

Backward pass:
    delta[L] = dL/dh[L] * sigma'(z[L])
    for l = L-1 down to 1:
        delta[l] = (W[l+1]^T * delta[l+1]) * sigma'(z[l])
    
    for l = 1 to L:
        dW[l] = delta[l] * h[l-1]^T
        db[l] = delta[l]

Weight update:
    for l = 1 to L:
        W[l] = W[l] - eta * dW[l]
        b[l] = b[l] - eta * db[l]
```

### Activation Functions

Common activation functions include:

| Function | Formula | Range | Notes |
|---|---|---|---|
| Sigmoid | \( \sigma(x) = \frac{1}{1+e^{-x}} \) | (0, 1) | Historically popular, saturates |
| Tanh | \( \tanh(x) = \frac{e^x - e^{-x}}{e^x + e^{-x}} \) | (-1, 1) | Zero-centered, saturates |
| ReLU | \( \max(0, x) \) | \( \left[0, \infty\right) \) | Simple, avoids saturation |
| Softmax | \( \frac{e^{x_i}}{\sum_j e^{x_j}} \) | (0, 1) | Output layer for classification |

### Biological Plausibility of Backpropagation

Backpropagation is extremely effective for training neural networks, but its biological plausibility is debated. Key concerns include:

- **Weight transport problem**: Backpropagation requires that the feedback pathway uses the transpose of the forward weights, which has no known biological mechanism.
- **Non-local computation**: Each synapse must know the global error signal, whereas biological synapses have access only to local information.
- **Symmetric derivatives**: The algorithm requires knowledge of the derivative of the activation function, which may not be available to biological neurons.

Research on biologically plausible credit assignment (e.g., feedback alignment, predictive coding, equilibrium propagation) seeks to bridge this gap.

---

# Chapter 7: Types of Neural Networks

## Feedforward Networks

A **feedforward neural network** is one in which information flows in a single direction, from input to output, with no cycles. The multilayer perceptron described in Chapter 6 is a feedforward network.

### Universal Approximation

<div class="theorem">
<strong>Universal approximation theorem</strong> (Cybenko, 1989; Hornik, 1991). A feedforward network with a single hidden layer containing a finite number of neurons can approximate any continuous function on a compact subset of \( \mathbb{R}^n \) to arbitrary accuracy, given a suitable activation function.
</div>

This theorem guarantees that feedforward networks are, in principle, powerful enough to represent any continuous input-output mapping. However, it says nothing about how easy it is to find the right weights or how many neurons are needed.

### Deep Networks

In practice, **deep networks** (those with many hidden layers) have been found to be far more efficient than shallow networks for many tasks. Deep networks can learn hierarchical representations: early layers learn simple features, and later layers compose them into increasingly abstract representations.

## Recurrent Neural Networks

**Recurrent neural networks (RNNs)** contain feedback connections, allowing information to persist over time. This makes them suitable for sequential data such as time series, language, and neural spike trains.

### Basic RNN Architecture

The simplest RNN updates its hidden state according to:

\[
\mathbf{h}(t) = \sigma\left(W_h \mathbf{h}(t-1) + W_x \mathbf{x}(t) + \mathbf{b}\right)
\]

where \( \mathbf{h}(t) \) is the hidden state at time \( t \), \( \mathbf{x}(t) \) is the input, \( W_h \) is the recurrent weight matrix, \( W_x \) is the input weight matrix, and \( \mathbf{b} \) is a bias.

### The Vanishing Gradient Problem

Training RNNs with backpropagation through time (BPTT) is difficult because gradients can vanish or explode as they are propagated backward through many time steps. If the largest singular value of \( W_h \) is less than 1, gradients shrink exponentially; if it is greater than 1, they grow exponentially.

### Long Short-Term Memory (LSTM)

The **LSTM** architecture (Hochreiter and Schmidhuber, 1997) addresses the vanishing gradient problem by introducing gating mechanisms:

\[
\mathbf{f}(t) = \sigma(W_f \left[\mathbf{h}(t-1), \mathbf{x}(t)\right] + \mathbf{b}_f) \quad \text{(forget gate)}
\]

\[
\mathbf{i}(t) = \sigma(W_i \left[\mathbf{h}(t-1), \mathbf{x}(t)\right] + \mathbf{b}_i) \quad \text{(input gate)}
\]

\[
\mathbf{o}(t) = \sigma(W_o \left[\mathbf{h}(t-1), \mathbf{x}(t)\right] + \mathbf{b}_o) \quad \text{(output gate)}
\]

\[
\tilde{\mathbf{c}}(t) = \tanh(W_c \left[\mathbf{h}(t-1), \mathbf{x}(t)\right] + \mathbf{b}_c) \quad \text{(candidate cell state)}
\]

\[
\mathbf{c}(t) = \mathbf{f}(t) \odot \mathbf{c}(t-1) + \mathbf{i}(t) \odot \tilde{\mathbf{c}}(t) \quad \text{(cell state update)}
\]

\[
\mathbf{h}(t) = \mathbf{o}(t) \odot \tanh(\mathbf{c}(t)) \quad \text{(hidden state)}
\]

The cell state \( \mathbf{c}(t) \) acts as a memory that can be selectively written, read, and erased through the gates.

### RNNs as Models of Neural Circuits

RNNs are increasingly used as models of biological neural circuits. By training RNNs to perform cognitive tasks (e.g., working memory, decision making, motor control), researchers can study the emergent dynamics and compare them to neural recordings. This approach treats the RNN as a "virtual brain" whose activity can be analyzed with the same tools used for real neural data.

## Convolutional Neural Networks

**Convolutional neural networks (CNNs)** are specialized for processing data with spatial structure, such as images. They are inspired by the hierarchical organization of the visual cortex, where simple cells detect local features and complex cells combine them.

### Key Components

- **Convolutional layers**: Apply a set of learnable filters (kernels) that slide across the input, computing local dot products. This implements translational weight sharing.
- **Pooling layers**: Reduce spatial dimensions by taking the maximum or average over local regions, providing a degree of translation invariance.
- **Fully connected layers**: After feature extraction, standard feedforward layers perform classification.

The operation of a convolutional layer is:

\[
h_{ij}^{(k)} = \sigma\left(\sum_{m,n} W_{mn}^{(k)} x_{i+m, j+n} + b^{(k)}\right)
\]

where \( W^{(k)} \) is the \( k \)-th filter and the sum runs over the spatial extent of the filter.

### Connection to Visual Neuroscience

Hubel and Wiesel's (1962) discovery of simple and complex cells in cat visual cortex provided the biological inspiration for CNNs. Modern CNNs trained on image recognition tasks develop internal representations that are remarkably similar to the tuning properties of neurons in the ventral visual stream (V1, V2, V4, IT cortex).

## Autoencoders

An **autoencoder** is a neural network trained to reconstruct its input from a compressed internal representation. The network consists of an **encoder** that maps the input to a lower-dimensional **latent representation** and a **decoder** that reconstructs the input from the latent code.

\[
\text{Encoder: } \mathbf{z} = f_{\text{enc}}(\mathbf{x}), \quad \text{Decoder: } \hat{\mathbf{x}} = f_{\text{dec}}(\mathbf{z})
\]

The training objective minimizes the reconstruction error:

\[
L = \|\mathbf{x} - \hat{\mathbf{x}}\|^2
\]

Autoencoders learn efficient data representations and are related to dimensionality reduction techniques like PCA. **Variational autoencoders (VAEs)** add a probabilistic framework, learning a distribution over latent codes.

---

# Chapter 8: Linear Algebra in Neural Systems

## Eigenvalues and Eigenvectors in Depth

### Computing Eigenvalues

The eigenvalues of an \( n \times n \) matrix \( A \) are the roots of the **characteristic polynomial**:

\[
\det(A - \lambda I) = 0
\]

For a \( 2 \times 2 \) matrix:

\[
A = \begin{pmatrix} a & b \\ c & d \end{pmatrix}
\]

the characteristic equation is:

\[
\lambda^2 - (a+d)\lambda + (ad - bc) = 0
\]

or equivalently \( \lambda^2 - \text{tr}(A)\lambda + \det(A) = 0 \), where \( \text{tr}(A) = a + d \) is the trace and \( \det(A) = ad - bc \) is the determinant. This directly connects to the stability analysis of two-dimensional systems.

<div class="example">
<strong>Example: Stability of a neural circuit.</strong> Consider a two-neuron circuit with dynamics:

\[
\frac{d\mathbf{x}}{dt} = A\mathbf{x}, \quad A = \begin{pmatrix} -2 & 1 \\ 1 & -2 \end{pmatrix}
\]

The eigenvalues are \( \lambda = -2 \pm 1 \), i.e., \( \lambda_1 = -1 \) and \( \lambda_2 = -3 \). Both are negative, so the origin is a stable node. The eigenvectors are \( \mathbf{v}_1 = (1, 1)^T \) (slow mode) and \( \mathbf{v}_2 = (1, -1)^T \) (fast mode). The system decays most slowly along the symmetric mode where both neurons have equal activity.
</div>

### Eigendecomposition and Matrix Exponential

If \( A \) has a complete set of eigenvectors, it can be decomposed as:

\[
A = V \Lambda V^{-1}
\]

where \( V \) is the matrix of eigenvectors and \( \Lambda \) is the diagonal matrix of eigenvalues. The solution to \( \frac{d\mathbf{x}}{dt} = A\mathbf{x} \) is then:

\[
\mathbf{x}(t) = e^{At} \mathbf{x}(0) = V e^{\Lambda t} V^{-1} \mathbf{x}(0)
\]

Each eigenvector component evolves independently as \( e^{\lambda_i t} \), growing or decaying according to the sign of the real part of \( \lambda_i \).

## Principal Component Analysis (PCA)

**Principal Component Analysis** is one of the most widely used tools in computational neuroscience for analyzing high-dimensional neural data.

### The Idea

Given a dataset of \( N \) observations in \( d \) dimensions (e.g., the firing rates of \( d \) neurons recorded over \( N \) time points), PCA finds the directions of maximum variance. These directions, the **principal components**, provide a low-dimensional summary of the data.

### Mathematical Formulation

Let \( X \) be the \( N \times d \) data matrix (mean-centered). The **covariance matrix** is:

\[
C = \frac{1}{N-1} X^T X
\]

PCA computes the eigendecomposition of \( C \):

\[
C \mathbf{v}_i = \lambda_i \mathbf{v}_i
\]

The eigenvectors \( \mathbf{v}_1, \mathbf{v}_2, \ldots \) are the principal components, ordered by decreasing eigenvalue. The eigenvalue \( \lambda_i \) gives the variance explained by the \( i \)-th component.

The projection of the data onto the first \( k \) principal components is:

\[
Z = X V_k
\]

where \( V_k = \left[\mathbf{v}_1, \ldots, \mathbf{v}_k\right] \) is the \( d \times k \) matrix of the top \( k \) eigenvectors.

### PCA in Neuroscience

PCA is used extensively in neuroscience to:

- **Reduce dimensionality**: Neural population recordings may involve hundreds or thousands of neurons, but the population activity often lies on a much lower-dimensional manifold.
- **Visualize population dynamics**: Projecting neural trajectories onto the first 2-3 principal components reveals structured dynamics during behavior (e.g., rotational dynamics during motor planning).
- **Identify coding dimensions**: The principal components can reveal which patterns of neural co-activation carry the most information.

<div class="remark">
The connection between Hebbian learning and PCA is deep. As noted in Chapter 6, Oja's rule causes a single neuron's weight vector to converge to the first principal component of its input. A network of neurons with lateral inhibition and Oja's rule can extract multiple principal components, providing a biologically plausible implementation of PCA.
</div>

## Linear Systems Analysis

### Coupled Linear ODEs

Many neural models, especially those describing network dynamics, involve systems of coupled linear ODEs:

\[
\frac{d\mathbf{x}}{dt} = A\mathbf{x} + \mathbf{b}
\]

where \( \mathbf{x} \) is a vector of state variables (e.g., firing rates) and \( A \) encodes the connectivity. The homogeneous solution \( (\mathbf{b} = 0) \) is determined by the eigenvalues and eigenvectors of \( A \), as discussed above.

### Linear Rate Models

A common model for neural population dynamics is the **linear firing rate model**:

\[
\tau \frac{d\mathbf{r}}{dt} = -\mathbf{r} + W\mathbf{r} + \mathbf{h}
\]

where \( \mathbf{r} \) is the vector of firing rates, \( W \) is the connectivity matrix, and \( \mathbf{h} \) is external input. This can be rewritten as:

\[
\tau \frac{d\mathbf{r}}{dt} = (W - I)\mathbf{r} + \mathbf{h}
\]

The stability of the network depends on the eigenvalues of \( W - I \): the network is stable if all eigenvalues of \( W \) have real parts less than 1.

### Normal Modes

The eigenvectors of the connectivity matrix \( W \) define the **normal modes** of the network. Each mode evolves independently, with a rate determined by its eigenvalue. Understanding the normal modes reveals which patterns of activity the network amplifies, sustains, or suppresses.

---

# Chapter 9: Computation and the Mind

## What Is Computation?

The question "what is computation?" is fundamental to both computer science and cognitive science. Computation, in the formal sense, refers to the manipulation of symbols according to rules. But what does it mean for a physical system -- such as a brain -- to compute?

### Intuitive Notion

Informally, computation is any process that transforms inputs into outputs according to a well-defined procedure. Adding two numbers, sorting a list, recognizing a face, and deciding what to eat for lunch are all, on some accounts, computational processes.

### Formal Notion

The formal theory of computation was developed in the 1930s by several mathematicians working independently:

- **Alan Turing** defined computation in terms of an abstract machine (the Turing machine).
- **Alonzo Church** defined computation in terms of lambda calculus.
- **Kurt Godel** defined computation in terms of recursive functions.

These three formalisms were shown to be equivalent: they define the same class of computable functions. This equivalence is the basis of the **Church-Turing thesis**.

## The Church-Turing Thesis

<div class="definition">
<strong>Church-Turing thesis.</strong> Any function that can be computed by an effective procedure (an algorithm) can be computed by a Turing machine.
</div>

The Church-Turing thesis is not a theorem (it cannot be proved, because "effective procedure" is an informal notion) but a widely accepted hypothesis. It implies that Turing machines capture the full extent of what is algorithmically computable.

### Implications for Cognitive Science

The Church-Turing thesis has profound implications for theories of mind:

1. If the mind is a computational system, then it can be simulated by a Turing machine. This is the foundation of **strong AI**: the claim that an appropriately programmed computer can have genuine mental states.

2. Conversely, if there are mental processes that cannot be captured by Turing machines, then the mind is not purely computational. This is the position of some critics of computationalism, including Roger Penrose, who has argued (controversially) that consciousness involves non-computable quantum processes.

## The Computational Theory of Mind

The **computational theory of mind (CTM)** holds that the mind is a computational system: mental states are computational states, and cognitive processes are computations over mental representations.

### Key Claims

1. **Mental representations** are structured symbolic entities (like sentences in a language of thought).
2. **Cognitive processes** are rule-governed transformations of these representations.
3. The mind can be understood at the computational and algorithmic levels (in Marr's sense) independently of its physical implementation.

### The Language of Thought Hypothesis

Jerry Fodor's **language of thought hypothesis (LOTH)** is a specific version of CTM. It claims that thinking occurs in a mental language ("mentalese") with a combinatorial syntax and a compositional semantics. Just as sentences in English are built from words according to grammatical rules, thoughts are built from mental symbols according to computational rules.

### Challenges to CTM

Several challenges have been raised against CTM:

- **The frame problem**: How does a computational system determine which of its representations are relevant to a given situation?
- **The symbol grounding problem**: How do mental symbols acquire their meanings? Symbols in a computer are meaningless without an external interpreter.
- **Embodied and situated cognition**: Critics argue that cognition is not just symbol manipulation but is fundamentally shaped by the body and the environment.
- **Consciousness**: It is unclear how subjective experience arises from computation. This is the "hard problem" of consciousness (Chalmers, 1995).

---

# Chapter 10: Turing Machines

## Formal Definition

<div class="definition">
<strong>Turing machine.</strong> A Turing machine is a mathematical model of computation defined by a 7-tuple \( (Q, \Sigma, \Gamma, \delta, q_0, q_{\text{accept}}, q_{\text{reject}}) \) where:
<ul>
<li>\( Q \) is a finite set of <strong>states</strong></li>
<li>\( \Sigma \) is the <strong>input alphabet</strong> (not including the blank symbol)</li>
<li>\( \Gamma \) is the <strong>tape alphabet</strong> (\( \Sigma \subseteq \Gamma \), and \( \Gamma \) includes a blank symbol \( \sqcup \))</li>
<li>\( \delta: Q \times \Gamma \to Q \times \Gamma \times \{L, R\} \) is the <strong>transition function</strong></li>
<li>\( q_0 \in Q \) is the <strong>start state</strong></li>
<li>\( q_{\text{accept}} \in Q \) is the <strong>accept state</strong></li>
<li>\( q_{\text{reject}} \in Q \) is the <strong>reject state</strong> (\( q_{\text{reject}} \neq q_{\text{accept}} \))</li>
</ul>
</div>

### How It Works

A Turing machine operates on an infinite tape divided into cells, each containing a symbol from \( \Gamma \). A read/write head is positioned over one cell. At each step, the machine:

1. Reads the symbol under the head.
2. Based on the current state and the symbol read, the transition function specifies: a new symbol to write, a direction to move (left or right), and a new state to enter.
3. The machine halts if it enters \( q_{\text{accept}} \) or \( q_{\text{reject}} \).

<div class="example">
<strong>Example: A Turing machine for binary increment.</strong> To add 1 to a binary number written on the tape:
<ul>
<li>Start at the rightmost digit.</li>
<li>If the digit is 0, change it to 1 and halt (accept).</li>
<li>If the digit is 1, change it to 0 and move left (carry).</li>
<li>If the head reads a blank (we have carried past the most significant bit), write 1 and halt.</li>
</ul>
This simple procedure illustrates how a Turing machine implements an algorithm through state transitions and tape operations.
</div>

### Programming a Turing Machine

In this course, students implement a simple Turing machine in code. The transition function can be represented as a lookup table:

```
transitions = {
    (state, symbol): (new_state, new_symbol, direction),
    ...
}

function run_turing_machine(tape, transitions, start_state, accept, reject):
    state = start_state
    head = 0
    while state not in {accept, reject}:
        symbol = tape[head]
        if (state, symbol) not in transitions:
            halt with error
        (new_state, new_symbol, direction) = transitions[(state, symbol)]
        tape[head] = new_symbol
        state = new_state
        head = head + (1 if direction == R else -1)
    return state == accept
```

## The Universal Turing Machine

A **universal Turing machine (UTM)** is a Turing machine that can simulate any other Turing machine. It takes as input a description (encoding) of a Turing machine \( M \) and an input string \( w \), and simulates \( M \) running on \( w \).

The existence of the UTM shows that a single, fixed machine can perform any computation -- it is a general-purpose computer. Modern digital computers are essentially physical implementations of universal Turing machines.

<div class="remark">
The UTM is the theoretical ancestor of the stored-program computer. The key insight is that programs (descriptions of Turing machines) and data (input strings) are both sequences of symbols that can be written on the same tape. This is the foundation of the von Neumann architecture.
</div>

## The Halting Problem

<div class="theorem">
<strong>The halting problem is undecidable</strong> (Turing, 1936). There is no Turing machine that, given a description of an arbitrary Turing machine \( M \) and input \( w \), can always correctly determine whether \( M \) halts on \( w \).
</div>

### Proof Sketch

The proof is by contradiction. Suppose there exists a Turing machine \( H \) that decides the halting problem: \( H(M, w) = \text{accept} \) if \( M \) halts on \( w \), and \( H(M, w) = \text{reject} \) otherwise.

Construct a new machine \( D \) that, given input \( M \):
1. Runs \( H(M, M) \).
2. If \( H \) accepts (i.e., \( M \) halts on \( M \)), then \( D \) loops forever.
3. If \( H \) rejects (i.e., \( M \) does not halt on \( M \)), then \( D \) halts.

Now ask: does \( D \) halt on input \( D \)?
- If \( D \) halts on \( D \), then \( H(D, D) = \text{accept} \), so by construction \( D \) loops forever -- contradiction.
- If \( D \) does not halt on \( D \), then \( H(D, D) = \text{reject} \), so by construction \( D \) halts -- contradiction.

Either way we reach a contradiction, so no such \( H \) can exist.

## Implications for Cognitive Science

The theory of computation has several important implications for cognitive science:

1. **Limits of computation**: The halting problem shows that there are well-defined questions that no algorithm can answer. If the mind is computational, there may be cognitive limits analogous to undecidability.

2. **Computational complexity**: Even among problems that are computable, some require infeasible amounts of time or memory. The theory of NP-completeness suggests that many real-world problems (scheduling, optimization, constraint satisfaction) are computationally intractable in the worst case. How the brain solves such problems efficiently (if it does) is a major open question.

3. **Godel's incompleteness theorems**: Closely related to the halting problem, Godel's theorems show that any sufficiently powerful formal system is either incomplete or inconsistent. Some philosophers (notably J. R. Lucas and Roger Penrose) have argued that this implies the mind transcends formal computation, though this argument remains controversial.

---

# Chapter 11: Symbolic vs. Connectionist Approaches

## Classical AI and Symbolic Systems

### The Physical Symbol System Hypothesis

Allen Newell and Herbert Simon (1976) proposed the **Physical Symbol System Hypothesis (PSSH)**: "A physical symbol system has the necessary and sufficient means for general intelligent action." In other words, intelligence is symbol manipulation, and any system that manipulates symbols in the right way is intelligent.

This hypothesis was the foundation of **classical AI** (also known as **Good Old-Fashioned AI**, or **GOFAI**). Classical AI programs represent knowledge symbolically (using logical expressions, production rules, semantic networks, frames) and manipulate these representations using search and inference algorithms.

### Production Systems

A **production system** consists of:

1. **Working memory**: A set of facts representing the current state.
2. **Production rules**: Condition-action pairs of the form "IF condition THEN action."
3. **Conflict resolution strategy**: A method for choosing which rule to fire when multiple rules match.

<div class="example">
<strong>Example: A simple production system for diagnosis.</strong>

<em>Working memory:</em> {patient has fever, patient has cough}

<em>Rules:</em>
<ul>
<li>IF patient has fever AND patient has cough THEN conclude flu</li>
<li>IF patient has fever AND patient has rash THEN conclude measles</li>
<li>IF conclude flu THEN recommend rest and fluids</li>
</ul>

Rule 1 matches the current working memory, fires, and adds "conclude flu" to working memory. Then Rule 3 fires, adding the recommendation.
</div>

Production systems like ACT-R (Anderson, 1993) and Soar (Laird, Newell, Rosenbloom, 1987) remain influential in cognitive modeling. They provide explicit, interpretable accounts of cognitive processes and have been used to model problem solving, learning, memory retrieval, and skill acquisition.

### Strengths of Symbolic Approaches

- **Compositionality**: Complex representations can be built from simpler ones.
- **Systematicity**: The ability to represent and process one structure implies the ability to handle structurally similar ones.
- **Transparency**: Symbolic models are interpretable; we can inspect and understand their reasoning.
- **Logical inference**: Symbolic systems naturally support deduction, abduction, and induction.

### Weaknesses of Symbolic Approaches

- **Brittleness**: Small deviations from expected inputs can cause failures.
- **The knowledge acquisition bottleneck**: Symbolic systems require hand-crafted rules and knowledge.
- **Poor generalization**: Symbolic systems struggle with noisy, ambiguous, or novel inputs.
- **Difficulty with perception and motor control**: Tasks like vision and movement, which are effortless for humans, proved extremely difficult for symbolic AI.

## Connectionism

### The Connectionist Alternative

**Connectionism** (also called parallel distributed processing, or PDP) emerged in the 1980s as an alternative to symbolic AI. Connectionists argue that cognition is better modeled by networks of simple, neuron-like processing units that learn from data rather than follow explicit rules.

Key features of connectionist models:

- **Distributed representations**: Knowledge is encoded in patterns of activity across many units, not in discrete symbols.
- **Learning from data**: The network's connection weights are adjusted by learning algorithms (e.g., backpropagation) rather than programmed by hand.
- **Graceful degradation**: Damage to a few units degrades performance gradually rather than causing catastrophic failure.
- **Generalization**: Connectionist networks can generalize to novel inputs that are similar to training examples.

### The Connectionism Debate

The debate between symbolic and connectionist approaches was one of the most important intellectual controversies in cognitive science during the late 1980s and 1990s.

Fodor and Pylyshyn (1988) argued that connectionist models cannot account for the **systematicity** and **compositionality** of thought. If a system can think "John loves Mary," it can also think "Mary loves John." This productivity and systematicity, they argued, requires a language-like system with combinatorial syntax, which connectionist networks lack.

Connectionists responded that distributed representations can implement compositional structure (e.g., through tensor product representations or recursive auto-associative memories) without explicit symbolic machinery.

### Hybrid Approaches

Many modern cognitive models combine symbolic and connectionist elements:

- **Neural-symbolic integration**: Systems that use neural networks for perception and pattern recognition but symbolic reasoning for planning and inference.
- **Vector symbolic architectures**: Represent symbolic structures as high-dimensional vectors, enabling both the compositionality of symbolic systems and the learning and generalization of connectionist ones.
- **Transformer architectures**: Modern large language models can be viewed as connectionist systems that have learned to perform something resembling symbolic reasoning, blurring the traditional boundary.

## Embodied Cognition

**Embodied cognition** challenges both symbolic and traditional connectionist approaches by arguing that cognition cannot be understood apart from the body and its interactions with the environment.

### Key Claims

1. **Cognition is shaped by the body**: The specific sensory and motor capabilities of an organism constrain and enable its cognitive processes.
2. **Cognition is situated**: Cognitive processes are deeply influenced by the immediate physical and social environment.
3. **Cognition is extended**: In some cases, cognitive processes may extend beyond the brain to include bodily actions and environmental structures (e.g., using pen and paper for arithmetic).
4. **Cognition is enacted**: Perception is not passive reception but active exploration of the environment.

### Implications for Modeling

Embodied cognition suggests that realistic cognitive models must include a body and an environment. This has led to interest in **robotic models** of cognition, **sensorimotor approaches** to perception, and **dynamical systems approaches** that model cognition as the continuous, real-time interaction of brain, body, and world.

---

# Chapter 12: Applications in Cognitive Modeling

## Decision Making

### Drift-Diffusion Models

One of the most successful applications of computational modeling in psychology is the **drift-diffusion model (DDM)** of two-choice decision making. The model assumes that evidence accumulates over time as a noisy process until it reaches one of two decision boundaries.

The evidence variable \( x(t) \) evolves according to:

\[
dx = v \, dt + s \, dW
\]

where \( v \) is the **drift rate** (reflecting the strength and direction of the evidence), \( s \) is the noise intensity, and \( dW \) is a Wiener process (Brownian noise). The decision is made when \( x(t) \) first reaches either the upper boundary \( a \) (choose option A) or the lower boundary \( 0 \) (choose option B).

<div class="definition">
<strong>Parameters of the DDM.</strong>
<ul>
<li><strong>Drift rate</strong> \( v \): Speed and direction of evidence accumulation. Larger drift rates lead to faster, more accurate decisions.</li>
<li><strong>Boundary separation</strong> \( a \): Distance between the two decision boundaries. Larger values lead to slower but more accurate decisions (speed-accuracy tradeoff).</li>
<li><strong>Starting point</strong> \( z \): Where the evidence variable begins. Bias toward one option shifts the starting point.</li>
<li><strong>Non-decision time</strong> \( T_{\text{er}} \): Time for encoding and motor execution, not involved in evidence accumulation.</li>
</ul>
</div>

The DDM accounts for both response time distributions and accuracy in a unified framework. It has been applied to a wide range of tasks, from simple perceptual discrimination to complex value-based choice.

### Neural Implementation

The DDM has been linked to neural data in several brain regions:

- **Lateral intraparietal cortex (LIP)**: Neurons show ramping activity during perceptual decisions, consistent with evidence accumulation.
- **Frontal eye fields (FEF)**: Activity reflects the decision variable and reaches a threshold before saccadic eye movements.
- **Basal ganglia**: May implement the decision threshold, controlling the speed-accuracy tradeoff.

## Learning

### Reinforcement Learning

**Reinforcement learning (RL)** provides a computational framework for understanding how organisms learn from reward and punishment. The core idea is that an agent learns a **policy** (a mapping from states to actions) that maximizes cumulative reward.

### The Rescorla-Wagner Model

The **Rescorla-Wagner model** (1972) is the foundational model of associative learning. It describes how the associative strength \( V \) of a conditioned stimulus (CS) changes with experience:

\[
\Delta V = \alpha \beta (\lambda - V)
\]

where \( \alpha \) is the salience of the CS, \( \beta \) is the learning rate associated with the unconditioned stimulus (US), and \( \lambda \) is the maximum associative strength supported by the US. The term \( (\lambda - V) \) is the **prediction error**: the discrepancy between what was expected and what occurred.

<div class="remark">
The Rescorla-Wagner model is mathematically equivalent to the delta rule (Widrow-Hoff rule) used in machine learning. The prediction error \( (\lambda - V) \) is directly analogous to the error signal in gradient descent.
</div>

### Temporal Difference Learning

**Temporal difference (TD) learning** extends the Rescorla-Wagner model to sequential tasks. The key innovation is that predictions are updated based on the difference between successive predictions, not just the final outcome:

\[
V(s_t) \leftarrow V(s_t) + \alpha \left[r_{t+1} + \gamma V(s_{t+1}) - V(s_t)\right]
\]

where \( V(s_t) \) is the predicted value of state \( s_t \), \( r_{t+1} \) is the reward received, \( \gamma \) is a discount factor, and the bracketed expression is the **TD error**.

The TD error has been identified with the phasic activity of **dopamine neurons** in the midbrain. Schultz, Dayan, and Montague (1997) showed that dopamine neurons fire in a pattern consistent with a TD prediction error signal: they respond to unexpected rewards, cease responding to fully predicted rewards, and show a depression in activity when expected rewards are omitted.

### Q-Learning

**Q-learning** (Watkins, 1989) learns action values rather than state values:

\[
Q(s_t, a_t) \leftarrow Q(s_t, a_t) + \alpha \left[r_{t+1} + \gamma \max_a Q(s_{t+1}, a) - Q(s_t, a_t)\right]
\]

The agent selects actions based on the Q-values, typically using an \( \epsilon \)-greedy policy: with probability \( 1 - \epsilon \), choose the action with the highest Q-value; with probability \( \epsilon \), choose randomly (exploration).

## Memory Models

### Hopfield Networks

The **Hopfield network** (1982) is a recurrent neural network that functions as a **content-addressable memory**. Given a partial or noisy version of a stored pattern, the network converges to the nearest stored pattern.

The network consists of \( N \) binary units with symmetric weights:

\[
w_{ij} = \frac{1}{N} \sum_{\mu=1}^{p} \xi_i^{\mu} \xi_j^{\mu}
\]

where \( \xi^{\mu} \) is the \( \mu \)-th stored pattern and \( p \) is the number of patterns. This is a Hebbian learning rule applied to all patterns.

The update rule is:

\[
s_i \leftarrow \text{sgn}\left(\sum_j w_{ij} s_j\right)
\]

The network has an associated **energy function**:

\[
E = -\frac{1}{2} \sum_{i \neq j} w_{ij} s_i s_j
\]

Each update decreases or preserves the energy, so the dynamics converge to a local minimum. The stored patterns are (ideally) the local minima of the energy landscape.

<div class="theorem">
<strong>Storage capacity.</strong> A Hopfield network of \( N \) units can reliably store approximately \( p \approx 0.14N \) random binary patterns. Beyond this capacity, retrieval becomes unreliable due to interference between stored patterns (spurious minima in the energy landscape).
</div>

### Complementary Learning Systems

The **complementary learning systems (CLS)** theory (McClelland, McNaughton, O'Reilly, 1995) proposes that the brain uses two complementary memory systems:

1. **Hippocampus**: Supports rapid learning of specific episodes using sparse, pattern-separated representations. Analogous to a network with fast, one-shot learning.
2. **Neocortex**: Supports gradual learning of structured knowledge using distributed, overlapping representations. Analogous to a network trained slowly with interleaved replay.

This architecture solves the **catastrophic interference** problem: if a neural network learns new information too quickly, it overwrites old information. The hippocampus stores new episodes quickly and then gradually transfers them to the neocortex through replay (e.g., during sleep), allowing the neocortex to integrate new knowledge without disrupting existing representations.

## Attention Models

### Feature Integration Theory

Anne Treisman's **feature integration theory (FIT)** (1980) proposes that visual features (color, orientation, size) are processed in parallel across the visual field, but binding features into coherent objects requires focused spatial attention.

Computational implementations of FIT typically involve:
1. A set of **feature maps** (one for each feature dimension) computed in parallel.
2. A **saliency map** that combines feature maps to identify locations of interest.
3. A serial **spotlight of attention** that selects one location at a time for feature binding.

### Biased Competition Model

The **biased competition model** (Desimone and Duncan, 1995) proposes that visual objects compete for neural representation, and attention biases the competition in favor of task-relevant objects.

This can be modeled as a recurrent neural network with mutual inhibition between representations of different objects. Top-down signals (from prefrontal cortex) add excitatory input to the representation of the attended object, giving it a competitive advantage.

Mathematically, a simplified version can be expressed as:

\[
\tau \frac{dr_i}{dt} = -r_i + f\left(w_{\text{ext}} s_i + w_{\text{td}} a_i - w_{\text{inh}} \sum_{j \neq i} r_j\right)
\]

where \( r_i \) is the activity of the \( i \)-th object representation, \( s_i \) is the bottom-up sensory input, \( a_i \) is the top-down attentional signal, \( w_{\text{inh}} \) controls mutual inhibition, and \( f \) is a nonlinear activation function.

### Normalization Models of Attention

More recent models describe attention as operating through **divisive normalization**, a canonical neural computation:

\[
r_i = \frac{\alpha_i \cdot s_i^n}{\sigma^n + \sum_j \alpha_j \cdot s_j^n}
\]

where \( \alpha_i \) is an attentional gain factor, \( s_i \) is the stimulus drive, \( n \) is an exponent, and \( \sigma \) is a semi-saturation constant. Attention increases the gain for the attended stimulus, which naturally suppresses unattended stimuli through the normalization denominator. This model unifies a wide range of attentional phenomena within a single computational framework.

## Integrating Approaches

The models surveyed in this chapter illustrate the diversity of computational approaches to cognition. A key theme is the interplay between different levels of description:

- **Normative models** (e.g., Bayesian inference, optimal control) specify what the system should compute.
- **Algorithmic models** (e.g., drift-diffusion, TD learning) specify how the computation is carried out.
- **Implementational models** (e.g., spiking networks, biophysical models) specify how the algorithms are realized in neural hardware.

Progress in computational neuroscience often comes from connecting these levels: showing that a normatively optimal computation can be implemented by a biologically plausible algorithm, which in turn is realized by a specific neural circuit. This multilevel approach is the hallmark of the field and the aspiration of this course.
