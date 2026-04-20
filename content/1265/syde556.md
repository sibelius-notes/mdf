---
title: "SYDE 556: Simulating Neurobiological Systems"
subjects: "SYDE"
---

## Sources and References

- Eliasmith and Anderson, *Neural Engineering: Computation, Representation, and Dynamics in Neurobiological Systems*.
- Eliasmith, *How to Build a Brain: A Neural Architecture for Biological Cognition*.
- Dayan and Abbott, *Theoretical Neuroscience: Computational and Mathematical Modeling of Neural Systems*.
- Gerstner, Kistler, Naud, and Paninski, *Neuronal Dynamics: From Single Neurons to Networks and Models of Cognition*.
- Rieke, Warland, de Ruyter van Steveninck, and Bialek, *Spikes: Exploring the Neural Code*.
- Nengo documentation and tutorial materials (open on the Nengo project site).
- MIT OpenCourseWare 9.40 (Introduction to Neural Computation) for background in single-neuron biophysics and population coding.
- Stanford CS 379C (Computational Models of the Neocortex) for a parallel perspective emphasizing probabilistic and cortical-circuit models.

---

## Orientation: why simulate neurobiological systems?

Neuroscience has spent the last century accumulating an astonishing amount of data: intracellular recordings from single neurons, multi-electrode arrays spanning cortical columns, two-photon imaging of entire zebrafish brains, fMRI of humans performing cognitive tasks, connectomes assembled at nanometer resolution. What it has not, until recently, possessed is a systematic way to convert these data into quantitative models of what the brain actually *does*. A simulation that merely reproduces the statistics of spikes in some recorded population is not yet an explanation; an explanation must show how those spikes realize a computation relevant to an animal's behaviour.

This course adopts one particular framework — the **Neural Engineering Framework (NEF)** — as its organizing spine, supplemented by classical results from computational neuroscience (dynamical-systems analyses of neurons, information theory applied to spike trains, attractor networks, motor control). The NEF's ambition is practical: given a behavioural or cognitive specification stated in the language an engineer already knows (differential equations, transfer functions, vector spaces), produce a spiking neural network that implements it, using neurons whose biophysics match measured properties. The same framework yields working simulations of motor coordination, working memory, decision making, and symbolic reasoning, which lets us evaluate a model the way an engineer evaluates a controller: does it track, is it stable, how much noise can it tolerate?

<div><strong>Guiding thesis.</strong> <em>A neurobiological system can be modelled as a time-varying vector-valued signal, encoded by a population of nonlinear spiking elements, that is transformed through weighted connections and made dynamic through recurrence. The engineer's job is to choose encoders, decoders, and connection weights so the network's collective behaviour matches a target computation.</em></div>

Before any mathematics, it helps to state what the course is *not*. It is not a survey of deep learning, though we will compare NEF models to deep networks at the end. It is not a biophysics course; we will use the leaky integrate-and-fire neuron and occasionally the Izhikevich model, not the Hodgkin–Huxley equations in full. And it is not a theoretical neuroscience course in the strict Dayan–Abbott sense; we take the results of that field (tuning curves, linear decoding, Fokker–Planck descriptions of populations) as inputs rather than outputs. Familiarity with any of those threads will be useful, but linear algebra, probability, and introductory control theory are the genuine prerequisites.

## Part I. The modelling approach and the three principles

The NEF factors the problem of designing a neural simulation into three nearly-independent steps. Each corresponds to a mathematical object the engineer chooses, and each comes with a quantitative criterion for judging how well a biological system (or a simulation thereof) implements the step.

**Principle 1 — Representation.** A population of spiking neurons represents a time-varying vector \( \mathbf{x}(t) \in \mathbb{R}^d \). Each neuron has an encoder \( \mathbf{e}_i \) (a preferred direction in the represented space), a gain \( \alpha_i \), and a bias \( \beta_i \), and produces spikes at a rate

\[ a_i(\mathbf{x}) = G_i\!\left( \alpha_i \, \mathbf{e}_i \cdot \mathbf{x} + \beta_i \right) \]

where \( G_i \) is the neuron's nonlinear current-to-rate function. Decoding recovers an estimate \( \hat{\mathbf{x}} = \sum_i \mathbf{d}_i \, a_i(\mathbf{x}) \) from the population's activity. The engineer chooses \( \{\mathbf{d}_i\} \) by least squares so that \( \hat{\mathbf{x}} \approx \mathbf{x} \).

**Principle 2 — Transformation.** An arbitrary function \( \mathbf{y} = f(\mathbf{x}) \) is computed from a population representing \( \mathbf{x} \) by using *function decoders*: solve the least-squares problem \( \min_{\mathbf{d}^f} \; \mathbb{E}_\mathbf{x} \| f(\mathbf{x}) - \sum_i \mathbf{d}_i^f \, a_i(\mathbf{x}) \|^2 \). Injecting the decoded estimate into a downstream population's encoders gives a weight matrix \( W_{ji} = \alpha_j \, \mathbf{e}_j \cdot \mathbf{d}_i^f \) that causes the downstream population to represent \( f(\mathbf{x}) \).

**Principle 3 — Dynamics.** Time-dependent computations are realized by recurrent connections. If we want a population to obey \( \dot{\mathbf{x}} = A\mathbf{x} + B\mathbf{u} \), we observe that a post-synaptic filter \( h(t) = \tfrac{1}{\tau} e^{-t/\tau} \) already implements a leaky integrator, so the recurrent weights need only implement \( \mathbf{x} + \tau A\mathbf{x} \) and the input weights \( \tau B \mathbf{u} \) for the network dynamics to match the target.

These three principles are not independent axioms; they are progressively stronger commitments to a geometric picture of neural computation. Principle 1 says there is a vector space worth tracking. Principle 2 says the nonlinearities of neurons, far from being a nuisance, are precisely the basis functions that let linear decoders compute nonlinear maps. Principle 3 says that synaptic filters give us, for free, the primitive operation of integration from which arbitrary linear dynamics (and with Principle 2, nonlinear dynamics) can be composed.

<div><em>A useful analogue: the three principles are to neural modelling what Kirchhoff's laws and the component equations are to circuit analysis. The laws constrain the topology; the components supply the nonlinearities; the engineer chooses values to meet a specification.</em></div>

## Part II. Single-neuron models

### The leaky integrate-and-fire neuron

The workhorse of NEF simulations is the **leaky integrate-and-fire (LIF)** neuron. Its sub-threshold membrane voltage \( V \) obeys

\[ \tau_{RC} \, \dot{V} = -V + R\, I(t), \]

and whenever \( V \) crosses a threshold \( V_\text{th} \), the neuron emits a spike and \( V \) is clamped to a reset value \( V_\text{reset} \) for a refractory period \( \tau_\text{ref} \). For constant input current \( J \) above threshold, the firing rate admits a closed form:

\[ a(J) = \left[ \tau_\text{ref} - \tau_{RC} \ln\!\left( 1 - \frac{V_\text{th}}{J\,R} \right) \right]^{-1}. \]

This is the \( G_i \) that appears in Principle 1. Its shape — zero below a threshold current, a sharp onset, a sub-linear saturation at high currents — is the essential ingredient; the exact biophysics is, for NEF purposes, secondary.

### Richer spiking models

When rapid bursting, adaptation, or rebound firing matter, the **Izhikevich model** supplies them with two coupled ODEs and a discrete reset, parameterized to reproduce regular spiking, intrinsic bursting, chattering, low-threshold spiking, and resonator behaviour. At the other end of biophysical realism sits the **Hodgkin–Huxley** model, whose sodium and potassium conductance variables reproduce the full action-potential waveform. Neuronal Dynamics textbooks treat these in detail; the SYDE 556 practice is to use HH-level detail only when a question genuinely requires it.

### Tuning curves

A neuron's **tuning curve** is its firing rate plotted against a stimulus parameter. For a one-dimensional representation with encoder \( e_i = \pm 1 \), the LIF tuning curve is a rectified monotonic function of \( x \); for a two-dimensional representation with encoder \( \mathbf{e}_i \) on the unit circle, it is a cosine-shaped bump centered on the encoder direction. Heterogeneity — distributing \( \alpha_i \), \( \beta_i \), and \( \mathbf{e}_i \) randomly across the population — is what makes a population capable of representing a continuum of values with a finite number of neurons. A population of identical neurons is a single-bit indicator; a population of heterogeneous ones is a distributed code.

<div><strong>Design note.</strong> <em>In NEF practice the gains and biases are drawn so that each neuron's maximum firing rate lies in a biologically plausible band (say 100–200 Hz) and its x-intercept is uniform in the represented range. Encoders are drawn uniformly on the unit sphere. These three choices essentially determine the representation's quality.</em></div>

## Part III. Population coding and decoding

### The optimal linear decoder

Given a population with activities \( a_i(\mathbf{x}) \), the **optimal linear decoder** solves

\[ \min_{\{\mathbf{d}_i\}} \; \int_\mathbf{x} \left\| \mathbf{x} - \sum_i \mathbf{d}_i \, a_i(\mathbf{x}) \right\|^2 p(\mathbf{x}) \, \mathrm{d}\mathbf{x}. \]

Setting the gradient to zero yields the normal equations \( \Gamma \mathbf{d} = \Upsilon \) with \( \Gamma_{ij} = \int a_i(\mathbf{x}) a_j(\mathbf{x}) p(\mathbf{x}) \,\mathrm{d}\mathbf{x} \) and \( \Upsilon_i = \int a_i(\mathbf{x}) \mathbf{x} \, p(\mathbf{x}) \,\mathrm{d}\mathbf{x} \). In practice the integrals are replaced by Monte-Carlo sums over a grid of sample points.

### Noise and regularization

Real neurons are noisy. A standard assumption is additive Gaussian noise \( \eta_i \sim \mathcal{N}(0, \sigma^2) \) on each neuron's reported rate. The decoder is then found from

\[ \Gamma + \sigma^2 I, \]

so noise acts as Tikhonov regularization. The same regularization mitigates the ill-conditioning that arises when the population is large relative to the dimensionality of \( \mathbf{x} \). The RMS decoding error decomposes into a bias term (how well the family of representable functions covers \( f \)) and a variance term (how well the population averages out noise). The variance term falls as \( 1/N \) with population size — the classical \( \sqrt{N} \) population-coding advantage.

### Decoding under spike trains, not rates

When the code consists of spike trains \( s_i(t) = \sum_k \delta(t - t_{i,k}) \), decoding is performed after filtering with a post-synaptic filter \( h(t) \): \( \hat{\mathbf{x}}(t) = \sum_i \mathbf{d}_i \, (h * s_i)(t) \). The choice of \( h \) is itself a parameter: short filters give fast but noisy estimates; long ones smooth the noise but lag dynamic signals. Optimal filters minimize mean-squared error jointly with the decoders and can be derived in the frequency domain when the signal's spectrum is known.

\lvert Quantity \lvert Symbol \lvert Role \lvert
\lvert --- \lvert --- \lvert --- \lvert
\lvert Encoder \lvert \( \mathbf{e}_i \) \lvert Direction in \( \mathbb{R}^d \) the neuron prefers \lvert
\lvert Gain \lvert \( \alpha_i \) \lvert Sensitivity of rate to current \lvert
\lvert Bias \lvert \( \beta_i \) \lvert Background current; shifts threshold \lvert
\lvert Activity \lvert \( a_i(\mathbf{x}) \) \lvert Steady-state rate at stimulus \( \mathbf{x} \) \lvert
\lvert Decoder \lvert \( \mathbf{d}_i \) \lvert Weight assigned when reconstructing \( \mathbf{x} \) \lvert

## Part IV. An information-theoretic view

Linear decoding answers "how well can we reconstruct \( \mathbf{x} \) from activities?" Information theory answers the complementary "how many bits about \( \mathbf{x} \) does the population carry?" The **mutual information** between a stimulus and a population response is

\[ I(\mathbf{x}; \mathbf{r}) = H(\mathbf{r}) - H(\mathbf{r}\mid\mathbf{x}). \]

For Gaussian signals and Gaussian noise this reduces to a log-determinant of the signal-to-noise covariance, recovering Shannon's channel-capacity formula. For spike trains, the direct method of Strong and colleagues estimates \( H(\mathbf{r}) \) empirically from the distribution of binary words across trials.

Rieke et al.'s classical result — that fly H1 interneurons carry on the order of 1–3 bits per spike under naturalistic stimulation — anchored this approach. The pedagogical payoff in SYDE 556 is a dual perspective: the NEF's RMS error is an \( L^2 \) quantity, mutual information is a KL quantity, and the two bound each other in well-understood ways (rate-distortion theory). When a decoder's RMS error is saturated, information-theoretic analyses often reveal unexploited structure — higher moments, temporal correlations — that a linear decoder cannot capture.

## Part V. Nonlinear transformations

Principle 2 is deceptively powerful. Because the tuning curves \( \{a_i(\mathbf{x})\} \) are a rich nonlinear basis, any smooth function \( f : \mathbb{R}^d \to \mathbb{R}^k \) within the population's representational range can be approximated by choosing appropriate **function decoders**: \( \mathbf{d}_i^f \) solves the same least-squares problem as \( \mathbf{d}_i \) but with \( f(\mathbf{x}) \) substituted for \( \mathbf{x} \) on the right-hand side.

### From decoders to weights

The single most consequential observation in the NEF is that an "encoding × decoding" chain collapses into a single weight matrix. If population \( A \) represents \( \mathbf{x} \) and population \( B \) should represent \( f(\mathbf{x}) \), then the connection weight from neuron \( i \in A \) to neuron \( j \in B \) is

\[ W_{ji} = \alpha_j \, \mathbf{e}_j \cdot \mathbf{d}_i^f. \]

This is a rank-\( k \) (or rank-\( d \), depending on which space is smaller) factorization of the full connectivity. Biological connectivity matrices measured in the cortex are, empirically, low-rank when conditioned on population membership — consistent with the factorization the NEF predicts.

### Multiplication, addition, and comparison

Scalar addition is trivial: if two populations \( A \) and \( B \) project convergently onto \( C \) with identity decoders, \( C \) represents \( \mathbf{x}_A + \mathbf{x}_B \). Scalar multiplication requires one population to represent the joint \( (x_A, x_B) \in \mathbb{R}^2 \) and decode the nonlinear function \( f(x_A, x_B) = x_A x_B \). This two-step pattern — bind two scalars into a joint representation, then decode a nonlinear function — reappears throughout: it is how gain modulation, contextual gating, and coordinate transformation are implemented.

## Part VI. Neural dynamics

### The canonical recurrent template

Consider a population whose synaptic filter is \( h(t) = \tfrac{1}{\tau} e^{-t/\tau} \) (a single exponential, a decent first approximation to AMPA or GABA-A kinetics). Let the population represent \( \mathbf{x}(t) \) and receive input currents driven by an input \( \mathbf{u}(t) \). In the Laplace domain the synapse satisfies \( H(s) = 1/(1 + \tau s) \). If we drive the synapse with \( \tau (A\mathbf{x} + B\mathbf{u}) + \mathbf{x} \), the output is

\[ H(s) \left[ \tau (A X(s) + B U(s)) + X(s) \right] = \frac{\tau A X + \tau B U + X}{1 + \tau s}, \]

which, after rearrangement, equals \( X(s) = (sI - A)^{-1} B U(s) \) — the target linear system.

Principle 3 is thus a **recipe**: to simulate \( \dot{\mathbf{x}} = A\mathbf{x} + B\mathbf{u} \), choose recurrent-function decoders for \( f_\text{rec}(\mathbf{x}) = \mathbf{x} + \tau A\mathbf{x} \) and input-function decoders for \( f_\text{in}(\mathbf{u}) = \tau B\mathbf{u} \). Nonlinear dynamics \( \dot{\mathbf{x}} = f(\mathbf{x}, \mathbf{u}) \) proceed by the same construction, decoding \( \mathbf{x} + \tau f(\mathbf{x}, \mathbf{u}) \).

### A control-theoretic reading

Seen as a controller, a recurrent NEF population implements a state-feedback law whose gains are the synaptic weights. The engineer who has specified \( A \) and \( B \) is doing exactly what a control engineer does when choosing a plant and a controller; Principle 3 tells her how to wire the network so the closed-loop matches her design. LQR-style optimal control — pick the state-feedback gain \( K \) that minimizes \( \int (\mathbf{x}^\top Q \mathbf{x} + \mathbf{u}^\top R \mathbf{u}) \, \mathrm{d}t \) — can therefore be inserted directly into a neural simulation, yielding networks that minimize energy-like cost functions while tracking a reference.

## Part VII. Working memory and integrators

The cleanest exemplar of Principle 3 is the **neural integrator**. Set \( A = 0 \) and \( B = 1 \) for a one-dimensional system: \( \dot{x} = u \). The recurrent decoder solves \( f_\text{rec}(x) = x \) (pure feedback, decoding the identity). The input decoder solves \( f_\text{in}(u) = \tau u \). With \( u = 0 \), whatever value \( x \) last took is held indefinitely (up to decoder error and neural noise). This is the classical continuous-time working-memory buffer.

### Biological correlates

The **oculomotor integrator** in brainstem (nucleus prepositus hypoglossi and medial vestibular nucleus) converts eye-velocity commands into eye-position commands and is the most extensively characterized biological integrator. Cells there show persistent activity on timescales of seconds to tens of seconds, orders of magnitude longer than any individual membrane time constant. The NEF account — recurrent feedback produces an attractor continuum, with activity drifting along the line attractor in response to input — matches the experimental time constants when the recurrent gain is set slightly less than unity, producing a slightly leaky integrator.

### Drift, noise, and robustness

A pure line attractor is not structurally stable: any perturbation of the recurrent gain converts it into a slow exponential decay or divergence. Real integrators therefore rely on some combination of (a) precise weight tuning (a plausible role for error-driven learning), (b) discrete approximations to the continuous attractor (bump-like states at integer eye positions, in sufficiently noisy regimes), and (c) external calibration signals. Simulations expose these trade-offs quantitatively: an engineer can sweep the recurrent gain and plot the time constant of drift, recovering the empirical curves measured in goldfish and monkey.

## Part VIII. Attractor networks

A taxonomy of attractor landscapes organizes many cognitive phenomena:

1. **Point attractors.** A discrete set of stable states. Hopfield networks are the canonical example; in neuroscience, point attractors model associative memory, decision making (each choice is a fixed point), and categorical perception (each phoneme is a basin).
2. **Line attractors.** A continuous manifold of marginally stable states, as in the integrator above. Used for analog working memory and for accumulating evidence in decision tasks.
3. **Ring attractors.** A one-dimensional manifold with the topology of a circle. The head-direction system of rodents and insects is a canonical example; rotational symmetry in the recurrent weights produces a bump of activity whose angular position encodes the heading.
4. **Plane and higher-dimensional continuous attractors.** Grid cells in entorhinal cortex are commonly modelled as two-dimensional continuous attractors with periodic boundary conditions; hippocampal place cells as bumps on a cognitive map.

All of these can be built in the NEF by choosing recurrent-function decoders that enforce the desired vector field: \( \dot{\mathbf{x}} = -\nabla E(\mathbf{x}) \) with \( E \) designed to place minima at the desired attractor locations.

### Decision making as a point-attractor network

Wang's two-population competition model of perceptual decision making is the standard exemplar. Two populations, each representing evidence for one of two alternatives, inhibit each other through a shared inhibitory pool. With moderate excitatory drive, the system has three fixed points: a symmetric unstable one and two asymmetric stable ones. Noise and evidence bias the trajectories toward one basin; the time to convergence matches primate reaction-time distributions in a two-alternative forced-choice task. The NEF reformulation builds the same dynamics from leaky integrate-and-fire neurons with explicit encoders and decoders, making it straightforward to scale to multi-alternative tasks or to modulate the decision threshold via top-down input.

## Part IX. Oscillators and locomotion

### Central pattern generators

Locomotion, respiration, and chewing are driven by **central pattern generators (CPGs)** — small recurrent circuits that produce rhythmic output without rhythmic input. In the NEF they are attractors of another type: stable limit cycles. A minimal CPG is a two-dimensional population implementing

\[ \dot{\mathbf{x}} = \begin{pmatrix} \omega \\ -\omega \end{pmatrix} \times \mathbf{x} + \lambda (1 - \|\mathbf{x}\|^2) \mathbf{x}, \]

a Stuart–Landau oscillator with angular frequency \( \omega \) and radial attraction rate \( \lambda \). Principle 3 supplies the weights. Coupled CPGs — one per limb, with phase-locking connections — generate alternating and quadrupedal gaits; the same structure was proposed for the lamprey spinal cord by Ijspeert and collaborators, and it furnishes a template for bio-inspired legged robot controllers.

### From CPG to joint trajectory

Connecting a CPG's output to a representation of desired joint angles, then feeding that representation into an inverse-kinematics transformation, closes the loop from rhythmic neural activity to limb movement. A case study in SYDE 556 builds an arm model of this sort: a CPG generates a cyclic reference in task space, a population computes inverse kinematics, and a final population computes the feedforward joint torques. Every stage is an application of Principles 1–3; the final model is a handful of populations producing a smooth reaching-and-drawing motion.

## Part X. Motor control

### Inverse models and internal forward models

Classical motor-control theory holds that the nervous system uses **forward models** (predicting sensory consequences of motor commands) and **inverse models** (computing the motor commands required to achieve a target) as complementary halves of a control loop. NEF populations can implement both. A forward model for a limb is a dynamical system whose state is the predicted joint configuration; an inverse model is a static nonlinear map from desired configuration to required torques. Both are standard Principle-2 and Principle-3 constructions.

### Muscle synergies

Movement neuroscientists observe that the space of muscle activations during behaviour is low-dimensional — a few "synergies" span most of the variance. A synergy is just a vector in muscle-activation space; controlling a handful of synergy coefficients is equivalent to representing a low-dimensional vector and decoding a linear map into the high-dimensional muscle space. The NEF framing makes this explicit and suggests why synergies are computationally advantageous: they trade representational dimension for decoder simplicity.

### Optimal feedback control

Todorov and Jordan's **optimal feedback control** theory derives motor commands as the solution to an LQR problem minimizing task-relevant error while leaving task-irrelevant degrees of freedom uncontrolled. Mapping OFC onto an NEF network yields a spiking implementation whose recurrent weights are precisely the feedback gains, and whose performance degrades gracefully with neural noise — recovering the famed "minimum intervention principle" of biological motor control as an emergent property.

## Part XI. Statistical inference in neural populations

### Probabilistic population codes

A population's activity, jointly with a noise model, defines an implicit posterior over stimuli: \( p(\mathbf{x} \mid \mathbf{r}) \propto p(\mathbf{r} \mid \mathbf{x}) \, p(\mathbf{x}) \). For Poisson spiking with tuning curves \( f_i(\mathbf{x}) \), the log-likelihood is

\[ \log p(\mathbf{r} \mid \mathbf{x}) = \sum_i \left[ r_i \log f_i(\mathbf{x}) - f_i(\mathbf{x}) \right] + \text{const}. \]

When tuning curves form an exponential family — bells with widths independent of amplitude — the log-likelihood is linear in \( \mathbf{r} \), and *summing* two populations' activities is equivalent to *multiplying* their likelihoods. Ma, Beck, Latham, and Pouget promoted this as the **probabilistic population code (PPC)** account of cue combination: the nervous system needs no explicit Bayes' rule, because its basic operation — linear summation of spike counts — already is Bayes' rule, for codes of this form.

### Kalman filters in neurons

Recursive Bayesian estimation — the Kalman filter for linear-Gaussian systems — factors into a prediction step (a linear dynamical system) and an update step (a weighted sum of prediction and measurement). Both are directly realizable by Principles 2 and 3. A population running the Kalman-filter recursion over an internal state variable is indistinguishable, behaviourally, from an optimal observer; NEF simulations of sensorimotor integration (Kalman-filter models of spatial localization) fit human psychophysics with neuron counts in the hundreds.

<div><strong>Reading question.</strong> <em>When is a Poisson PPC the right model of a brain area, and when is a linear decoder enough? The answer hinges on whether downstream computations depend on the full posterior or merely its mean — and thus on whether uncertainty is behaviourally relevant.</em></div>

## Part XII. Cognitive architectures and vector symbolic representation

### The Semantic Pointer Architecture

Low-dimensional scalars and 2-D bumps carry us through sensorimotor and short-term memory tasks. Symbolic cognition — language, reasoning, planning — seems to demand something different: structured representations with variable-slot bindings. The **Semantic Pointer Architecture (SPA)** extends the NEF to this regime by choosing the represented space \( \mathbb{R}^d \) with \( d \) large (typically 256 or 512) and populating it with high-dimensional random vectors that stand for symbols.

### Binding via circular convolution

Holographic Reduced Representations use **circular convolution** \( \mathbf{c} = \mathbf{a} \circledast \mathbf{b} \) as a binding operation: two random vectors combine into a third that is approximately orthogonal to both, and approximate unbinding \( \mathbf{a} \approx \mathbf{c} \circledast \mathbf{b}^{-1} \) recovers a noisy copy of \( \mathbf{a} \). Because circular convolution is a nonlinear but smooth function of its operands, a Principle-2 decoder implements it across two populations. A clean-up memory — an associative lookup that maps noisy vectors back to stored ones — is then required downstream; it is typically a point-attractor network whose basins are the stored vectors.

### Symbolic reasoning with spikes

Stacking binding and unbinding into a pipeline yields spiking networks that perform question-answering, list traversal, and induction of patterns in sequences (the Raven's Progressive Matrices model is a canonical demo). The Spaun model assembles 2.5 million spiking neurons into a system that performs eight disparate cognitive tasks — copy drawing, digit memorization, pattern induction, serial working memory, among others — by routing semantic pointers through a fixed cortical-basal-ganglia architecture. Whatever its limitations, Spaun is an existence proof that cognitive-scale symbolic behaviour can be implemented in biologically plausible spiking networks by repeated application of the three NEF principles.

## Part XIII. The Nengo workflow

Nengo is the reference software environment for NEF simulations, now in its third major version with a Python API, a NumPy-based reference simulator, and back-ends for GPUs and neuromorphic hardware. A typical Nengo script

1. defines a `Network` context;
2. instantiates one or more `Ensembles` — each is a population with a specified number of neurons, representational dimensionality, neuron model, encoder distribution, and gain/bias scheme;
3. specifies inputs via `Nodes` (Python functions evaluated each time-step) and feeds them into ensembles;
4. wires ensembles together with `Connections`, each of which carries an optional `function` argument — the nonlinearity to be computed, which Nengo converts into decoders behind the scenes;
5. adds `Probes` to record activities, decoded values, or spikes;
6. runs a simulator for a specified time.

The same source code runs on CPU, GPU, FPGA (Nengo-FPGA), Intel's Loihi neuromorphic chip (NengoLoihi), and SpiNNaker. This hardware-agnostic workflow is a pedagogical virtue: a student who writes a working-memory model on her laptop can, in principle, deploy the identical model on a neuromorphic chip without rewriting the neural equations.

### Probing, debugging, and tuning

The practical art of Nengo modelling consists of three moves: (i) check the decoder RMS error on each connection to catch representational gaps early; (ii) probe raw spikes as well as decoded values so you can spot saturated or silent neurons; (iii) sweep neuron counts and radii to find the minimum scale at which the model's behaviour is stable. These mirror the discipline of ordinary numerical-simulation debugging — verifying conservation laws, watching condition numbers — and should feel familiar to any engineer who has used a circuit or control-system simulator.

## Part XIV. Case studies

### Working-memory buffer

The simplest worthwhile NEF simulation is a one-dimensional integrator holding a target value across a delay. The network is a single recurrently connected ensemble with a brief input. Students use it to investigate: how many neurons are needed for a given retention precision? How does drift scale with neuron count, recurrent gain, and synaptic time constant? What happens if a subset of neurons is silenced mid-trial? The answers reproduce canonical experimental observations (e.g., the roughly \( 1/\sqrt{N} \) scaling of drift standard deviation).

### Decision-making diffusion model

Next is the two-choice decision network: two ensembles competing via a shared inhibitory pool, with noisy evidence driving each. The decoded difference-variable behaves as a drift-diffusion process, and reaction-time distributions obtained from the simulation overlay primate data. Manipulating the difficulty of the stimulus, the urgency of the task (a ramping top-down drive), or the evidence bias produces the signature psychometric and chronometric curves of decision-making experiments.

### Motor control model

A single-joint pendulum is the smallest non-trivial motor task. One ensemble represents joint angle and velocity; another receives a desired trajectory and decodes the torque that drives the system toward it via PD control. Adding a feedforward inverse model stabilizes tracking in the presence of gravity. Students observe how the control bandwidth trades against the synaptic time constant and neuron count — an instance of the general fact that neural controllers are bandwidth-limited by their representational machinery.

### Arm kinematics via CPG

Combining a two-dimensional CPG, a joint-space inverse-kinematics map, and a torque decoder produces a simulation that draws arbitrary closed curves in task space. Variants — phase-lagged CPGs coupled across multiple limbs, periodic modulation of gait frequency — reproduce canonical motor-control experiments while staying within the three-principle framework.

## Part XV. NEF models and deep learning

Deep networks and NEF networks both consist of weighted connections between units whose output is a nonlinear function of a weighted sum of inputs. The differences are substantive:

\lvert Aspect \lvert Deep networks \lvert NEF networks \lvert
\lvert --- \lvert --- \lvert --- \lvert
\lvert Neuron model \lvert Rectified linear, sigmoid \lvert LIF, Izhikevich, or HH spiking \lvert
\lvert Weight choice \lvert End-to-end gradient descent \lvert Closed-form least squares per connection \lvert
\lvert Unit of time \lvert Layer (or discrete step) \lvert Continuous time with synaptic filters \lvert
\lvert Objective \lvert Task loss on a dataset \lvert Match a pre-specified dynamical system \lvert
\lvert Biological claim \lvert Loose analogy \lvert Tuning curves and dynamics matched to data \lvert

The contrast is less a rivalry than a division of labour. Deep networks excel when the mapping from inputs to outputs is unknown but training data is abundant; NEF networks excel when the mapping is known (a controller, a dynamical model, an attractor) but the engineer wants a spiking, biologically plausible implementation. Hybrid workflows — training a deep network, then compiling it into a spiking NEF network for deployment on neuromorphic hardware — have become routine. More ambitiously, one can use gradient descent to fine-tune the decoders in an NEF network, training the connection weights end-to-end while preserving the factorization structure that gives NEF models their interpretability.

## Part XVI. Synthesis

The course trains a particular stance toward neurobiological modelling. Faced with an experimental finding — a persistent-activity bump in entorhinal cortex, a bistable firing pattern in parietal cortex during a decision task, an evolving phase relationship between spinal interneurons during swimming — the student should ask three questions, in order:

1. **What vector-valued signal is the population representing?** This fixes Principle 1. It forces the modeller to state clearly what \( \mathbf{x} \) is and what its representational range is.
2. **What static nonlinear function is being computed between populations?** This engages Principle 2. It converts claims about "this area transforms that area's signal" into a concrete function whose decoder error can be checked numerically.
3. **What differential equation does the recurrent circuit implement?** This is Principle 3. It ties the neural phenomenon to a dynamical system in the engineer's language — a filter, an integrator, a limit cycle, an attractor — and thereby to the vast machinery of control and signal-processing theory.

Answers to these three questions constitute a model — not an end in itself, but a prediction-generating machine. Every NEF simulation yields falsifiable predictions: tuning curves in each ensemble, correlations between pairs of neurons, the effect of silencing subsets, the response to perturbations away from the operating point. The final skill the course inculcates is treating simulations as instruments: running them to make quantitative predictions, taking the predictions to the data, and iterating when the two disagree.

<div><strong>Closing reflection.</strong> <em>No framework captures everything the brain does. What the Neural Engineering Framework offers is a workflow — a disciplined way to convert quantitative questions about neural computation into simulations that can be tested and criticized. Whether the brain literally solves least-squares problems to choose its decoders is beside the point; what matters is that if we model it as if it did, the resulting networks match measured tuning curves, predict lesion effects, and scale up to cognitive behaviour. Simulation, in this sense, is less a substitute for theory than its executable form.</em></div>
