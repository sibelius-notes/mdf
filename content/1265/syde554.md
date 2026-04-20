---
title: "SYDE 554: Nonlinear Dynamic Systems"
subjects: "SYDE"
---

## Sources and References

- Strogatz, <em>Nonlinear Dynamics and Chaos</em> (Westview)
- Khalil, <em>Nonlinear Systems</em> (Prentice Hall)
- Guckenheimer and Holmes, <em>Nonlinear Oscillations, Dynamical Systems, and Bifurcations of Vector Fields</em> (Springer)
- Wiggins, <em>Introduction to Applied Nonlinear Dynamical Systems and Chaos</em> (Springer)
- Younis, <em>MEMS Linear and Nonlinear Statics and Dynamics</em> (Springer)

---

# Chapter 1: Dynamic Systems Fundamentals

## 1.1 Linear vs Nonlinear

A linear time-invariant system satisfies superposition and homogeneity. Nonlinear systems do not: doubling the input need not double the output; combined inputs produce effects beyond the sum of individual responses. Consequences include multiple equilibria, limit cycles, chaos, and amplitude-dependent frequency — phenomena absent from linear theory.

## 1.2 Autonomous and Non-Autonomous

An autonomous system has no explicit time dependence:

\[
\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}).
\]

A non-autonomous system includes time explicitly:

\[
\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}, t).
\]

Forced oscillators and systems with time-varying parameters are non-autonomous, typically analysed by adding time as an extra state variable to produce an equivalent autonomous system in higher dimension.

# Chapter 2: Existence, Uniqueness, and Qualitative Theory

## 2.1 Existence and Uniqueness

Picard-Lindelöf conditions — Lipschitz continuity of \( \mathbf{f} \) — guarantee local existence and uniqueness of solutions to \( \dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}, t) \) through a given initial condition. Without Lipschitz continuity, solutions can branch or fail to exist beyond finite time (finite-time blow-up).

## 2.2 Equilibrium Points

An equilibrium \( \mathbf{x}^{*} \) satisfies \( \mathbf{f}(\mathbf{x}^{*}) = \mathbf{0} \). Local behaviour near an equilibrium is governed by the Jacobian

\[
J = \left. \frac{\partial \mathbf{f}}{\partial \mathbf{x}} \right|_{\mathbf{x}^{*}}.
\]

Eigenvalues of \( J \) classify the equilibrium: stable node or focus (all real parts negative), unstable (any real part positive), saddle (mixed signs), centre (zero real parts — requires nonlinear analysis).

<div class="example">
The damped pendulum has equilibria at \( \theta = 0, \pi \) (for simplicity modulo \( 2\pi \)). At 0 the Jacobian has eigenvalues with negative real parts — a stable focus; at \( \pi \) a saddle. Trajectories from the saddle separate basins of attraction.
</div>

## 2.3 Phase Plane Analysis

Two-dimensional systems are fully characterised by trajectories in the phase plane (state variables on the axes). Nullclines \( \dot{x}_1 = 0 \) and \( \dot{x}_2 = 0 \) partition the plane into regions of characteristic flow. Isoclines, trajectories, and separatrices between basins paint a qualitative picture without numerical solution.

# Chapter 3: Stability of Equilibria and Lyapunov Theory

## 3.1 Lyapunov Stability

An equilibrium is Lyapunov stable if trajectories starting nearby remain nearby; asymptotically stable if they also converge to the equilibrium. Lyapunov's direct method constructs a scalar function \( V(\mathbf{x}) \) that is positive definite and whose time derivative along trajectories,

\[
\dot{V} = \nabla V \cdot \mathbf{f}(\mathbf{x}),
\]

is negative definite (asymptotic) or semidefinite (stable).

## 3.2 LaSalle's Invariance Principle

When \( \dot{V} \leq 0 \), LaSalle's principle says trajectories approach the largest invariant set where \( \dot{V} = 0 \). This extends Lyapunov analysis to systems with damping that is zero at isolated points but still drives asymptotic convergence.

## 3.3 Region of Attraction

Lyapunov functions also bound the region of attraction: the set of initial conditions from which trajectories converge to a given equilibrium. Estimating this region is central to certifying safe operating envelopes for controllers and actuators.

# Chapter 4: Limit Cycles and Bifurcations

## 4.1 Limit Cycles

A limit cycle is an isolated closed orbit in phase space. Van der Pol and other self-excited oscillators exhibit stable limit cycles whose amplitudes are set by nonlinear damping. The Poincaré-Bendixson theorem states that a trajectory trapped in a closed, bounded region of the plane without equilibria must approach a limit cycle — a powerful tool for two-dimensional flows.

## 4.2 Bifurcations

Bifurcations are qualitative changes in dynamics as a parameter varies. Saddle-node bifurcations create or destroy equilibrium pairs; transcritical exchanges stability between two equilibria; pitchfork produces symmetric equilibrium branching; Hopf bifurcations convert stable foci into limit cycles. Normal forms capture the essential local dynamics near each bifurcation type.

<div class="definition">
A <strong>Hopf bifurcation</strong> occurs when a pair of complex-conjugate eigenvalues of the Jacobian cross the imaginary axis as a parameter varies; beyond the crossing, a limit cycle emerges whose amplitude grows as the square root of the parameter distance.
</div>

## 4.3 Nonlinear Phenomena

Multistability — multiple coexisting attractors — arises when equilibria, limit cycles, or chaotic sets share state space. Hysteresis follows: the attractor a trajectory settles on depends on its history. Jump phenomena occur when a continuously varied parameter crosses a saddle-node; the system snaps to a distant attractor, a behaviour exploited in switches and avoided in sensitive controls.

# Chapter 5: Advanced Nonlinear Topics

## 5.1 Poincaré Sections

A Poincaré section is a lower-dimensional cross-section of phase space intersected transversely by trajectories. The flow induces a Poincaré map on the section that reduces continuous-time dynamics to discrete-time iteration — a tool for analysing limit cycles (fixed points of the map), period-doubling, and chaos (complex map dynamics).

## 5.2 Multi-Frequency Oscillations

Coupled oscillators with different natural frequencies can synchronise, lock into rational frequency ratios, or exhibit quasi-periodic motion on tori. Devil's staircases and Arnold tongues organise the parameter space of mode-locking; their structure recurs in circadian rhythms, cardiac dynamics, and laser arrays.

## 5.3 Chaos

Chaotic systems are deterministic yet unpredictable due to sensitive dependence on initial conditions (positive Lyapunov exponent). Lorenz, Rössler, and duffing systems exemplify low-dimensional chaos. Strange attractors with fractal geometry are the asymptotic sets. Chaos complicates prediction but can be beneficial — efficient mixing in microfluidics, signal encryption, and exploration in machine learning — or harmful — unpredictable vibrations, irregular heartbeats.

<div class="remark">
Chaos is not noise. It is fully deterministic and, in principle, predictable from exact initial conditions; but real-world measurement precision bounds practical prediction to a finite horizon that shrinks with Lyapunov exponent.
</div>

# Chapter 6: Applications and MEMS/NEMS

## 6.1 Mechanical and Electromechanical Systems

Mechanical systems exhibit nonlinearity through large-amplitude geometric terms, contact and friction, nonlinear springs, and coupling between degrees of freedom. MEMS and NEMS devices — microcantilevers, resonators, capacitive actuators — routinely operate near pull-in, mode-coupling, and parametric resonances. Duffing's equation

\[
\ddot{x} + 2\zeta\omega_0 \dot{x} + \omega_0^{2} x + \alpha x^{3} = F\cos(\Omega t)
\]

captures amplitude-dependent frequency and bistability characteristic of these devices.

## 6.2 Electrical and Chemical Systems

Nonlinear electrical systems include tunnel diodes, Van der Pol oscillators realized in RLC circuits, Chua's circuit (chaotic), and saturating magnetic circuits. Chemical systems — Belousov-Zhabotinsky reaction, glycolytic oscillations, enzyme kinetics — host limit cycles, chaos, and wave patterns. Engineering applications range from oscillator design to biochemical sensing.

## 6.3 Ecological and Biological Systems

Population dynamics, epidemic spread, neural networks, and cardiac dynamics are all nonlinear. The Hodgkin-Huxley equations for nerve impulses exhibit action-potential limit cycles; FitzHugh-Nagumo and Morris-Lecar reduce these to two-dimensional caricatures amenable to phase-plane analysis. Predator-prey, SIR-model, and reaction-diffusion equations yield rich structures including travelling waves, Turing patterns, and chaos.

## 6.4 Design and Control Implications

Engineers design with nonlinearity rather than around it. Nonlinear control — gain scheduling, feedback linearisation, sliding mode, backstepping — handles systems that defy linear approximation. Nonlinear observers, model predictive control, and data-driven methods extend the toolkit. Understanding limit cycles, bifurcations, and chaos guides when to stabilise, when to exploit, and when to avoid.

<div class="example">
A MEMS resonator near its Duffing bistability can amplify small signals by biasing just below the jump; beyond it, the amplitude switches abruptly — the basis of highly sensitive mass-detection sensors and mechanical switches.
</div>

<div class="theorem">
Nonlinear dynamics provides the rigorous language for behaviours linear analysis cannot represent — equilibria, limit cycles, bifurcations, chaos — and the analytical tools (Lyapunov, phase plane, Poincaré, bifurcation theory) to engineer with these behaviours rather than pretend them away.
</div>

Students emerge equipped to analyse and design systems in which nonlinearity is central: sensors, actuators, circuits, biological interfaces, and any domain where richness of dynamics exceeds the reach of linear approximation.
