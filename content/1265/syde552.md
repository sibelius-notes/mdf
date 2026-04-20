---
title: "SYDE 552: Computational Neuroscience"
subjects: "SYDE"
---

## Sources and References

- Dayan and Abbott, *Theoretical Neuroscience*.
- Gerstner, Kistler, Naud, and Paninski, *Neuronal Dynamics*.
- Koch, *Biophysics of Computation*.
- Izhikevich, *Dynamical Systems in Neuroscience*.
- Kandel et al., *Principles of Neural Science*.
- Eliasmith and Anderson, *Neural Engineering*.
- Goodfellow, Bengio, and Courville, *Deep Learning* (for the comparison layer with modern ANN practice).
- MIT OpenCourseWare 9.40 and public Stanford computational-neuroscience materials.

---

Computational neuroscience sits at the intersection of three disciplines that historically spoke different languages. Biophysicists want to explain how ion channels, membranes, and synapses generate the electrical signals that constitute neural activity. Systems neuroscientists want to explain how populations of such neurons encode sensory information, produce motor commands, and store memories. Machine learning researchers want to build artificial systems that perform the same tasks, and to understand why gradient-based optimization of deep networks has proven so effective. This course treats the three levels as a single continuum. It develops the mathematical machinery needed to write down models of single neurons, networks, and plasticity rules, and it uses that machinery as a lens through which to compare biological computation with the artificial neural networks that dominate modern AI.

<div class="callout callout-info"><strong>Guiding questions.</strong> <em>What does a neuron compute? How do populations of neurons represent the world? How do synapses change so that a network can learn? Which parts of deep learning are plausible models of the brain, and which are engineering conveniences with no biological counterpart?</em></div>

## 1. Biophysics of the single neuron

### 1.1 Membrane potential and equilibrium

A neuron is a cell whose membrane separates two ionic solutions with different concentrations of sodium, potassium, calcium, and chloride. The membrane is studded with protein channels that are selectively permeable to particular ions, and with active pumps that maintain the concentration differences by expending ATP. For each ion species \(s\), the concentration gradient across the membrane defines a Nernst equilibrium potential

\[
E_s = \frac{k_B T}{z_s e}\,\ln\!\frac{[s]_{\text{out}}}{[s]_{\text{in}}},
\]

where \(z_s\) is the ionic valence and \(T\) the absolute temperature. At body temperature this evaluates to roughly \(+60\) mV for sodium, \(-90\) mV for potassium, \(+125\) mV for calcium, and \(-65\) mV for chloride. When several permeable species coexist, the steady-state membrane potential is given by the Goldman–Hodgkin–Katz equation, which weights each Nernst potential by the corresponding permeability. In a typical resting neuron the potassium permeability dominates, pulling the resting potential to roughly \(-70\) mV, close to but not equal to \(E_{\mathrm{K}}\).

### 1.2 The passive membrane as an RC circuit

Treating the lipid bilayer as a capacitor and the open channels as parallel leak resistors gives the simplest useful model of a patch of membrane, the RC circuit:

\[
C_m\,\frac{dV}{dt} = -g_L\,(V - E_L) + I_{\text{ext}}(t).
\]

Here \(C_m\) is the specific membrane capacitance (about \(1\;\mu\mathrm{F/cm^2}\) across cell types), \(g_L\) is the leak conductance, and \(I_{\text{ext}}\) represents synaptic or injected current. The characteristic time constant \(\tau_m = C_m/g_L\) sets how quickly the voltage integrates inputs, typically 10–30 ms for cortical pyramidal cells. The passive membrane is therefore a linear low-pass filter.

### 1.3 The cable equation

Real neurons are extended in space; a long dendrite behaves like a leaky telegraph cable. Writing the local axial current as \(I_a = -(1/r_a)\,\partial V/\partial x\) and balancing capacitive, leak, and axial currents yields

\[
\lambda^2\,\frac{\partial^2 V}{\partial x^2} - \tau_m\,\frac{\partial V}{\partial t} - (V - E_L) = 0,
\]

with electrotonic length constant \(\lambda = \sqrt{r_m/r_a}\) and time constant \(\tau_m\). Under steady-state injection the voltage decays exponentially with distance from the source, so distal synaptic inputs are attenuated at the soma unless boosted by active conductances. Rall's equivalent-cylinder result — that a symmetric dendritic tree can, under certain diameter-matching conditions, be collapsed to a single cylinder — provides the theoretical underpinning for compartmental simulators such as NEURON and the dimensional reductions used in most tractable dendritic models.

### 1.4 Hodgkin–Huxley and the action potential

Passive membranes cannot produce the all-or-none action potential that neurons use to signal at a distance. Hodgkin and Huxley, working on the squid giant axon, showed that two voltage-gated conductances — a fast, inactivating sodium current and a slower, non-inactivating potassium current — suffice. Their equations remain the canonical example of a biophysically grounded neuron model:

\[
C_m\,\frac{dV}{dt} = -\bar g_{\mathrm{Na}}\,m^3 h\,(V-E_{\mathrm{Na}}) - \bar g_{\mathrm{K}}\,n^4\,(V-E_{\mathrm{K}}) - g_L\,(V-E_L) + I.
\]

Each gating variable \(x \in \{m,h,n\}\) obeys a first-order kinetic equation \(\dot x = \alpha_x(V)\,(1-x) - \beta_x(V)\,x\), with voltage-dependent rate constants measured from voltage-clamp recordings. The interaction between rapid \(m\) activation (which depolarizes the cell) and the slower \(h\) inactivation and \(n\) activation (which repolarize it) produces the stereotyped spike. The same structural template — inward activating current plus outward restoring current — reappears in countless channel models for calcium, hyperpolarization-activated cation currents, and various potassium subtypes.

### 1.5 Reduced biophysical models

Integrating Hodgkin–Huxley over many neurons is expensive, and the four-dimensional phase space is hard to reason about. Several reductions preserve the essential spiking behaviour. The FitzHugh–Nagumo and Morris–Lecar models collapse the dynamics to two variables, a fast voltage-like variable and a slow recovery variable, and reveal the spike as a relaxation oscillation in the phase plane. These reductions expose the bifurcation structure of spike generation. Class I excitability — a saddle-node bifurcation on an invariant circle — permits arbitrarily low firing rates and is characteristic of cortical regular-spiking cells. Class II excitability — a subcritical Hopf bifurcation — forces neurons to begin firing at a finite minimum rate and accounts for the resonator behaviour of certain interneurons.

## 2. Simplified neuron models

### 2.1 Leaky integrate-and-fire

For large-network simulations one typically drops the detailed spike shape and keeps only the threshold-and-reset behaviour. The leaky integrate-and-fire (LIF) neuron obeys

\[
\tau_m\,\frac{dV}{dt} = -(V - E_L) + R_m\,I(t),
\]

until \(V\) reaches a threshold \(V_{\text{th}}\); the neuron then emits a spike and \(V\) is reset to \(V_{\text{reset}}\), optionally after an absolute refractory period \(\tau_{\text{ref}}\). For a constant current \(I\) exceeding rheobase, the firing rate is

\[
f(I) = \left[\tau_{\text{ref}} + \tau_m\,\ln\!\frac{R_m I - (V_{\text{reset}}-E_L)}{R_m I - (V_{\text{th}}-E_L)}\right]^{-1}.
\]

This f–I curve captures the saturating, monotonically increasing input-output relation observed in most cortical neurons and is the workhorse of network simulations.

### 2.2 Quadratic and exponential integrate-and-fire

The LIF neuron spikes at an artificial threshold. The quadratic integrate-and-fire (QIF) model replaces the linear leak with \(dV/dt \propto (V-V_{\text{rest}})(V-V_c)\), so that voltage diverges to infinity in finite time once it exceeds \(V_c\); this is the normal form of a saddle-node bifurcation and faithfully reproduces Class I excitability. The exponential integrate-and-fire (EIF) neuron adds a term \(\Delta_T\,\exp((V-V_T)/\Delta_T)\) that matches the smooth spike initiation observed in cortical pyramidal cells and fits real f–I curves more accurately than the LIF under fluctuating inputs.

### 2.3 Izhikevich's two-variable model

Izhikevich proposed a minimal two-variable model that can reproduce, by varying four parameters, essentially every firing pattern observed in cortical recordings — regular spiking, fast spiking, bursting, chattering, rebound, accommodation. Its equations combine a quadratic voltage dynamics with an adaptation variable \(u\) that is incremented at each spike and decays slowly. Because a spike costs only a handful of floating-point operations, networks of millions of Izhikevich neurons are feasible on a laptop.

### 2.4 Generalized linear models

A parallel tradition, originating in systems identification and extended by Pillow and colleagues, models spike trains as point processes with conditional intensity

\[
\lambda(t \mid \mathcal{H}_t) = \exp\!\left(k \ast s(t) + h \ast y(t) + b\right),
\]

where \(k\) is a stimulus filter, \(h\) a post-spike filter capturing refractoriness and bursting, and \(y(t)\) the neuron's own past spike train. These generalized linear models (GLMs) admit convex likelihood maximization and provide the standard tool for fitting retinal ganglion cells and other well-characterized neurons.

## 3. Spike statistics and variability

Repeated presentations of the same stimulus elicit different spike trains. The Fano factor \(F = \mathrm{Var}[N]/\mathbb{E}[N]\) of the spike count \(N\) in a fixed window is typically close to one in cortex, consistent with an approximately Poisson process. The inter-spike interval distribution for an inhomogeneous Poisson process with rate \(r(t)\) is exponential at constant rate, and more generally obeys a renewal density that depends on the refractory structure. The coefficient of variation \(C_V\) of the ISI distribution is one for a pure Poisson process and smaller for more regular firing.

The neural response to a stimulus parameter \(\theta\) is summarized by a tuning curve \(r(\theta) = \mathbb{E}[r \mid \theta]\). Canonical examples include cosine tuning of motor cortical neurons to reach direction, bell-shaped orientation tuning of V1 simple cells, and log-Gaussian frequency tuning of auditory neurons. Tuning-curve width, amplitude, and baseline rate are the primary parameters controlling how much information about \(\theta\) a neuron carries.

<div class="callout callout-note"><strong>Why Poisson?</strong> <em>No biophysical law demands Poisson statistics. Models in which a balanced barrage of excitation and inhibition drives the membrane potential into a fluctuation-dominated regime naturally produce approximately Poisson output even though each cell is deterministic. Variability is therefore an emergent property of network architecture, not a fundamental property of neurons.</em></div>

## 4. Synapses and short-term dynamics

A presynaptic spike triggers vesicle fusion and neurotransmitter release, which opens postsynaptic receptors and produces a transient conductance change. The simplest model superimposes an exponential kernel on each spike:

\[
g_{\text{syn}}(t) = \bar g\,\sum_{t_i<t} e^{-(t-t_i)/\tau_s}.
\]

AMPA-mediated excitation has \(\tau_s \approx 2\) ms, NMDA excitation has a slower kinetics of 50–100 ms with voltage-dependent magnesium block, \(\mathrm{GABA}_A\) inhibition has \(\tau_s \approx 5\)–\(10\) ms, and \(\mathrm{GABA}_B\) inhibition is slower still. The voltage dependence of NMDA receptors makes them effective coincidence detectors and the primary substrate for associative plasticity.

Synapses are not static. The Tsodyks–Markram model treats each terminal as having a finite resource \(x \in [0,1]\) of releasable vesicles and a utilization variable \(u\) that rises with activity and decays slowly; spikes consume \(u x\) of the resource and cause \(u\) to increment. With different parameter settings this yields short-term depression (the dominant behaviour at excitatory cortical synapses onto pyramidal cells), short-term facilitation (at pyramidal-to-interneuron synapses), or both. Short-term plasticity implements a dynamic gain control that emphasizes novel or transient inputs.

## 5. Rate models and mean-field dynamics

For many questions the precise spike times are dispensable and one can track only the instantaneous firing rate \(r_i(t)\) of each population \(i\). Under the relaxation-to-f-I assumption,

\[
\tau_i\,\frac{dr_i}{dt} = -r_i + F_i\!\left(\sum_j W_{ij}\,r_j + I_i^{\text{ext}}\right),
\]

with \(F_i\) a sigmoid or rectified-linear nonlinearity. Rate models are the natural bridge between biophysics and machine learning: they are deterministic ODEs that can be trained by backpropagation through time.

### 5.1 Wilson–Cowan equations

For a single cortical column with one excitatory and one inhibitory population,

\[
\begin{aligned}
\tau_E\,\dot E &= -E + F\!\left(w_{EE} E - w_{EI} I + h_E\right),\\
\tau_I\,\dot I &= -I + F\!\left(w_{IE} E - w_{II} I + h_I\right).
\end{aligned}
\]

Depending on parameters the system has a single low-activity fixed point, bistability between low and high activity, sustained oscillations (a limit cycle arising from a Hopf bifurcation), or more exotic behaviour. Oscillations in the \(\gamma\)-band (30–80 Hz) are a natural explanation of cortical rhythms and have been used to model attentional modulation.

### 5.2 Linear stability and rhythms

Linearizing around a fixed point and computing the eigenvalues of the Jacobian determines whether perturbations decay, grow, or oscillate. A negative real part gives stability; imaginary parts give damped oscillations whose frequency is set by the cross-coupling strengths and time constants. This analysis explains why pyramidal-interneuron networks with delays are natural oscillators — the so-called PING and ING mechanisms.

## 6. Neural coding

### 6.1 Rate versus timing

A long-running debate concerns whether cortex uses mean firing rate or precise spike timing to carry information. The evidence is mixed and domain-specific. Retinal ganglion cells and auditory nerve fibres exhibit sub-millisecond temporal precision; cortical neurons encode slow analogue variables (luminance, contrast, orientation) primarily in firing rate, but also carry information in oscillatory phase and cross-neuron synchrony. Rather than picking a side, the modern view is that time scales of stimulus statistics determine the relevant code: rapid transients demand temporal codes, slow variables tolerate rate codes.

### 6.2 Population coding

Single neurons are noisy and tuned to a narrow range of stimuli; populations overcome both limitations. If \(N\) neurons have tuning curves \(r_i(\theta)\) and independent Poisson noise, the Fisher information about \(\theta\) is

\[
I_F(\theta) = \sum_{i=1}^N \frac{r_i'(\theta)^2}{r_i(\theta)}.
\]

The Cramér–Rao bound tells us that no unbiased estimator of \(\theta\) achieves lower variance than \(1/I_F\). In well-behaved cases this bound is tight and the population acts as a near-optimal encoder. Correlated noise shared across neurons can reduce \(I_F\) — so-called information-limiting correlations — or leave it unchanged, depending on whether the noise lies along the signal direction in population-response space.

### 6.3 Decoding

Several canonical decoders are used. The population vector (Georgopoulos) sums the preferred directions of each neuron weighted by its firing rate and is optimal only for very specific cosine tuning. Maximum-likelihood decoding chooses \(\hat\theta = \arg\max_\theta \prod_i p(r_i \mid \theta)\) and asymptotically saturates the Cramér–Rao bound. Bayesian decoding combines the likelihood with a prior \(p(\theta)\) and returns the full posterior, which is essential when modelling behavioural biases or Bayes-optimal inference from uncertain inputs.

## 7. Receptive fields and early vision

### 7.1 Linear receptive fields

The receptive field of a visual neuron is the spatiotemporal stimulus kernel that best predicts its response. For retinal ganglion cells and LGN relay neurons the receptive field is well modelled by a centre-surround difference of Gaussians in space and a biphasic temporal kernel, producing band-pass filtering in both domains. Spike-triggered averaging — the mean stimulus preceding a spike — estimates this linear kernel, and spike-triggered covariance recovers higher-order subunits.

### 7.2 Simple and complex cells in V1

Hubel and Wiesel's classic result is that primary visual cortex contains at least two classes of orientation-selective neurons. Simple cells respond linearly to oriented spatial patterns and are well fit by Gabor functions of the form

\[
G(x,y) = \exp\!\left(-\tfrac{x'^2}{2\sigma_x^2} - \tfrac{y'^2}{2\sigma_y^2}\right)\cos(2\pi f x' + \phi),
\]

where \((x',y')\) is a rotated coordinate system. Complex cells retain orientation tuning but are invariant to the position and phase of the grating within their receptive field; they are well modelled as a sum of squared simple-cell responses, an early instance of the quadrature pair construction that motivates hierarchical pooling in convolutional networks. An "energy model" formed by squaring and summing two Gabor-filtered responses in quadrature produces phase-invariant orientation tuning identical to that of complex cells.

### 7.3 Natural image statistics

Why Gabors? Olshausen and Field showed that if one demands a linear generative model of natural images in which only a small fraction of basis vectors is active per image — sparse coding — the learned basis resembles oriented, band-pass, localized filters, that is, Gabors. Independent component analysis, applied to whitened natural image patches, recovers the same basis. This provides a normative explanation of V1 receptive fields: they are a near-optimal dictionary for representing the visual world efficiently.

## 8. Synaptic plasticity I: Hebbian and rate-based rules

### 8.1 Hebb's postulate

Hebb's 1949 postulate — "cells that fire together, wire together" — becomes, in its simplest mathematical form,

\[
\frac{dw_{ij}}{dt} = \eta\,r_i\,r_j.
\]

This rule extracts the first principal component of the input correlation matrix in its fixed points and explains, qualitatively, the development of orientation selectivity from correlated retinal inputs. It is unstable: weights grow without bound unless constrained.

### 8.2 Oja's rule and PCA

Oja's modification,

\[
\dot w_{ij} = \eta\,r_j\,(r_i - r_j\,w_{ij}),
\]

adds a weight-dependent decay that normalizes \(\|w\|\) and causes the weight vector to converge exactly to the leading eigenvector of the input covariance matrix. Stacks of Oja-learning units recover successive principal components. This makes the rule normatively interpretable: Hebbian learning under a specific normalization implements online PCA.

### 8.3 BCM theory

Bienenstock, Cooper, and Munro addressed a different problem: Hebbian rules alone cannot produce selectivity because there is no mechanism to depress rarely active synapses. The BCM rule introduces a sliding threshold \(\theta_M\) that depends on the running average of postsynaptic activity:

\[
\dot w_{ij} = \eta\,r_i\,(r_j - \theta_M)\,r_j,\qquad \theta_M = \mathbb{E}[r_j^2].
\]

Synapses potentiate when the postsynaptic rate exceeds \(\theta_M\) and depress when it falls below. The quadratic moving threshold provides homeostasis: a highly active neuron raises its threshold, making further potentiation harder. BCM reproduces ocular dominance plasticity in visual cortex and provides a rate-based abstraction of LTP/LTD.

## 9. Synaptic plasticity II: STDP and molecular substrates

### 9.1 Spike-timing-dependent plasticity

Recordings by Bi and Poo, and by Markram, showed that the sign and magnitude of synaptic change depend on the relative timing of pre- and postsynaptic spikes. The canonical additive STDP window is

\[
\Delta w = \begin{cases} A_+\,\exp(-\Delta t/\tau_+) & \Delta t > 0,\\ -A_-\,\exp(\Delta t/\tau_-) & \Delta t < 0, \end{cases}
\]

with \(\Delta t = t_{\text{post}} - t_{\text{pre}}\) and time constants of 10–30 ms. Pre-before-post produces LTP, post-before-pre produces LTD. STDP is a temporal generalization of Hebb's rule that captures the causal asymmetry of information flow. With appropriate parameter choices STDP performs a kind of unsupervised feature extraction and, in the limit of slow, low-rate firing, reduces to a BCM-like rule.

### 9.2 LTP, LTD, and NMDA

At the molecular level, long-term potentiation at many glutamatergic synapses depends on NMDA receptor activation. NMDA receptors conduct calcium only when the membrane is depolarized (relieving the magnesium block) and glutamate is bound — they are biochemical AND-gates for coincident pre- and postsynaptic activity. Brief, large calcium influx recruits CaMKII-mediated signalling cascades that insert AMPA receptors, producing LTP. Prolonged, modest calcium influx preferentially activates calcineurin, causing AMPA removal and LTD. The bidirectional dependence on postsynaptic calcium concentration is the biophysical foundation for the BCM sliding threshold.

### 9.3 Homeostatic plasticity

Hebbian rules and STDP are inherently positive-feedback processes. Homeostatic mechanisms — synaptic scaling, intrinsic excitability adjustments, and metaplasticity of plasticity thresholds — counteract runaway dynamics by adjusting whole-cell gain on slow timescales (hours to days). Stable networks require both fast Hebbian learning to extract structure and slow homeostasis to prevent saturation.

## 10. Recurrent networks and attractor dynamics

### 10.1 Hopfield networks

Hopfield's binary recurrent network stores patterns as fixed-point attractors. With \(N\) binary units and weights

\[
W_{ij} = \frac{1}{N}\sum_{\mu=1}^P \xi_i^\mu\,\xi_j^\mu,
\]

each stored pattern \(\xi^\mu\) is a local minimum of the Lyapunov energy \(E = -\tfrac{1}{2}\sum_{ij}W_{ij}s_i s_j\) provided the patterns are approximately orthogonal and \(P \lesssim 0.138 N\). Above this critical capacity the network transitions to a spin-glass phase of spurious attractors. Continuous-valued Hopfield networks with a differentiable energy function are the ancestor of modern energy-based models, and modern Hopfield networks with softmax updates have been shown by Ramsauer et al. to be mathematically equivalent to the attention mechanism of transformers.

### 10.2 Continuous attractors

Head-direction cells in the rodent limbic system, place cells in hippocampus, and oculomotor integrator neurons behave as if they live on a one- or two-dimensional continuous manifold of stable states. Ring attractor networks — recurrent networks with Mexican-hat connectivity — realize such manifolds. An external input nudges the bump of activity along the ring and, in the absence of input, the bump persists, implementing working memory and path integration.

### 10.3 Line attractors and neural integrators

A line attractor is a marginally stable one-dimensional manifold used as an analogue integrator. The oculomotor integrator in the brainstem is the classical example: it integrates velocity commands to produce eye position. Theoretical analysis shows that the integrator requires fine-tuning of recurrent weights to achieve the required eigenvalue of exactly one along the integrator direction, a tuning problem partially solved by homeostatic mechanisms.

### 10.4 Chaos in random networks

Sompolinsky, Crisanti, and Sommers showed that a random recurrent network of rate neurons with weights \(W_{ij} \sim \mathcal N(0, g^2/N)\) undergoes a transition from a silent fixed point to spontaneous chaotic activity as \(g\) exceeds unity. Using a dynamical mean-field theory one can derive the autocorrelation structure of the chaotic regime and show that it possesses a broad spectrum of timescales. Networks operating at the edge of chaos are candidate substrates for the echo-state and reservoir-computing paradigms: the rich intrinsic dynamics provide a high-dimensional temporal basis that a simple readout can use to approximate arbitrary input-output maps.

### 10.5 Balanced networks

Cortical neurons receive thousands of excitatory and inhibitory inputs whose sum is, on average, close to threshold. Van Vreeswijk and Sompolinsky's balanced-network theory shows that large recurrent networks with strong, random excitation and inhibition spontaneously self-organize into a regime where excitation and inhibition cancel on average, leaving firing driven by fluctuations. This naturally produces irregular, Poisson-like firing and linear population input-output curves, reconciling the high variability of cortical spike trains with deterministic neural dynamics.

## 11. Reinforcement learning and dopamine

### 11.1 Classical conditioning and Rescorla–Wagner

Animal learning theorists long before computational neuroscience had a predictive-error rule: the change in associative strength between a conditioned stimulus (CS) and an unconditioned stimulus (US) is proportional to the difference between the actual US and the US predicted by all concurrent cues,

\[
\Delta V_i = \alpha_i\,\beta\,\big(\lambda - \sum_j V_j\big).
\]

This is Rescorla–Wagner, and it accounts for blocking, overshadowing, and conditioned inhibition.

### 11.2 Temporal-difference learning

Sutton's temporal-difference (TD) algorithm generalizes Rescorla–Wagner from episodic to trial-by-trial temporal settings. It updates a value function \(V(s_t)\) using the bootstrapped error

\[
\delta_t = r_{t+1} + \gamma\,V(s_{t+1}) - V(s_t),
\]

with \(\gamma\) a discount factor. Schultz, Dayan, and Montague's landmark result is that the phasic firing of midbrain dopaminergic neurons in the ventral tegmental area and substantia nigra pars compacta closely tracks \(\delta_t\): dopamine rises when reward exceeds expectation, is silent when reward matches expectation, and dips below baseline when expected reward is omitted. Dopamine is, to a first approximation, a broadcast reward-prediction-error signal.

### 11.3 Actor-critic architectures and the striatum

TD-based reinforcement learning is naturally decomposed into a critic that learns \(V(s)\) and an actor that learns a policy \(\pi(a \mid s)\). A standard neural mapping places the critic in ventral striatum and the actor in dorsal striatum, with dopaminergic prediction errors modulating corticostriatal synapses in both structures via three-factor plasticity rules of the form

\[
\Delta w_{ij} \propto \delta\,\text{(eligibility trace of pre}{\times}\text{post)}.
\]

These rules solve the temporal credit assignment problem by combining slow-decaying eligibility traces at each synapse with a globally broadcast scalar reinforcement signal.

## 12. Dynamical mean-field theory and random matrix theory

Large random networks are analytically tractable because many quantities self-average in the limit \(N \to \infty\). Dynamical mean-field theory replaces the inputs to a representative neuron by a Gaussian process whose autocorrelation is determined self-consistently. For the Sompolinsky–Crisanti–Sommers network the autocorrelation \(C(\tau) = \langle x_i(t)x_i(t+\tau)\rangle\) obeys a differential equation that can be solved by quadrature, revealing the chaotic phase and the nature of the transition. Random matrix theory, in turn, predicts that the eigenvalues of a random Gaussian \(N\times N\) connectivity matrix fill a disk of radius \(g\) in the complex plane (the circular law). Loss of stability occurs when this disk pushes past the unit circle, a result that explains the critical coupling \(g=1\).

## 13. Cortical circuits and excitation–inhibition balance

A recurring finding in electrophysiology is that excitatory and inhibitory inputs to cortical neurons co-vary on millisecond timescales: inhibition tracks excitation with a short delay, cancelling most of it and leaving a fluctuation-driven residual that causes spiking. This detailed balance is thought to underlie the linear, fast input-output transformations of cortex, the stability of recurrent dynamics in the face of strong feedback, and the ability of cortical networks to support both reliable averaged responses and rich variability. Several theoretical frameworks — balanced networks, stabilized supralinear networks (SSNs), and inhibition-stabilized networks (ISNs) — make these ideas precise. The SSN model of Ahmadian, Rubin, and Miller explains surround suppression, normalization, and contrast invariance in V1 through a single recurrent mechanism with supralinear input-output curves.

## 14. Deep learning through a neuroscientific lens

### 14.1 Convolutional networks and the ventral stream

The ventral visual stream runs retina → LGN → V1 → V2 → V4 → IT. Each stage exhibits progressively larger receptive fields, more complex tuning, and greater position and scale invariance. This is the hierarchy that Fukushima's Neocognitron and LeCun's convolutional networks were designed to imitate: alternating convolutional (Gabor-like, simple-cell-like) and pooling (complex-cell-like) layers produce representations that become more invariant and more abstract with depth.

The experimental validation of this analogy is the Yamins–DiCarlo result. Deep convolutional networks trained on large-scale image classification develop internal representations that linearly predict the activity of neurons in V4 and IT better than any previous model, and models that perform better on ImageNet also predict neural activity better — up to a point. The hierarchy of layers in a deep CNN aligns, at least in linear-decodability terms, with the hierarchy of ventral stream areas: early layers predict V1 and V2, middle layers predict V4, late layers predict IT. This is one of the most striking convergences between engineered and biological vision.

### 14.2 Recurrent networks and cortex

Recurrent networks in machine learning — LSTMs, GRUs, and more recently transformer-based sequence models — solve temporal credit-assignment problems that cortical networks must also solve. Task-trained RNNs reveal circuit solutions that can be compared with electrophysiological data. Mante, Sussillo, and colleagues trained RNNs on a context-dependent decision task performed by monkeys and found that the trained network and the prefrontal cortex both implement the same solution: a low-dimensional dynamical system with selection vectors that route different input features to a shared decision axis. This style of model-mediated reverse engineering has become a dominant paradigm in systems neuroscience.

### 14.3 Normalization

Divisive normalization — where a neuron's response is divided by a weighted sum of nearby responses — is ubiquitous in cortex and appears in every modern deep network under various names (batch norm, layer norm, group norm, local response norm). Heeger's normalization model of V1 explains contrast-response functions, cross-orientation suppression, and surround suppression through a single divisive stage. That deep networks required similar mechanisms to be trainable at scale is a striking convergence.

## 15. Biologically plausible learning

### 15.1 The credit assignment problem

Backpropagation solves credit assignment by computing, for every weight, the gradient of a global loss. This requires propagating error signals backwards through the exact transpose of the forward weights, a symmetry the brain has no obvious way to enforce, and it requires a separate backward pass that is not observed experimentally. These are the core reasons the brain is generally assumed not to implement literal backpropagation.

### 15.2 Feedback alignment

Lillicrap and colleagues showed that if the backward pass uses random fixed matrices instead of the transposes of the forward weights, deep networks still learn — the forward weights progressively align so that their transposes resemble the random feedback matrices. Feedback alignment relaxes the symmetry requirement of backprop and is much more biologically plausible, though it is less effective on very deep convolutional networks.

### 15.3 Predictive coding

Rao and Ballard's predictive coding theory treats cortex as a hierarchical generative model. Each area generates a prediction of the activity of the area below; only the prediction error is transmitted upward, and each area's state minimizes its own prediction error. The algorithm can be implemented with local Hebbian-like plasticity and produces responses consistent with extra-classical receptive field effects (end-stopping, surround suppression) as natural consequences of explaining away. Whittington and Bogacz proved that certain predictive-coding networks implement backpropagation-equivalent credit assignment under weak assumptions, bridging the plausibility gap.

### 15.4 Three-factor rules and neuromodulation

Local synaptic rules can approximate gradient descent when combined with a globally broadcast third factor — a dopamine-like scalar signal. Rules of the form

\[
\Delta w_{ij} = \eta\,\tilde r_i\,\tilde r_j\,M(t),
\]

where \(\tilde r\) are low-pass-filtered activity traces and \(M(t)\) is a neuromodulatory signal carrying reward, novelty, or error information, can approximate a wide range of supervised and reinforcement objectives. They represent a plausible interface between biological plasticity and the supervised gradients that dominate machine learning.

### 15.5 Equilibrium propagation and energy-based learning

In energy-based models the network state minimizes an energy function; gentle perturbation of the output toward the target and a second minimization produce, by comparing the two equilibria, gradients that coincide with backprop in the small-perturbation limit. Equilibrium propagation provides a mathematically clean, biologically feasible scheme for learning in recurrent networks and has stimulated renewed interest in Hopfield-style dynamics as substrates for learning rather than merely memory.

## 16. Differences between brains and artificial neural networks

Several structural asymmetries between biological and artificial neural networks remain unresolved.

**Energy.** The human brain operates on roughly 20 W. A large modern neural network trained on tensor hardware consumes kilowatts during training and watts at inference for comparable tasks. The brain's efficiency is thought to reflect sparse coding — only a small fraction of neurons are active at any moment — and event-driven asynchronous spiking communication, which neuromorphic hardware such as Intel's Loihi and SpiNNaker attempts to emulate.

**Sparsity.** Cortical firing rates are low (typically 1–10 Hz average, with silent neurons common) and representations are sparse, with only a few percent of neurons strongly active for any given stimulus. Artificial networks with ReLU nonlinearities achieve modest sparsity through activation thresholding, but deliberate sparsity-inducing objectives (Olshausen–Field sparse coding, L1 regularization) remain an area of active research.

**Dale's principle.** Biological neurons release only excitatory or only inhibitory neurotransmitters, constraining the sign of their outgoing connections. Artificial networks have no such constraint. Respecting Dale's principle changes the structure of trainable dynamics and forces different solutions to the same tasks.

**Temporal dynamics.** Biological synapses have rich short- and long-term dynamics; artificial synapses are typically scalar weights updated by SGD. Adding biophysical realism to artificial networks tends to slow learning but can improve temporal credit assignment in sequence tasks.

**Architecture search.** Evolution and development have tuned cortical architecture over hundreds of millions of years; artificial architectures are hand-designed or searched over hours. The implicit priors encoded in cortical architecture — specific inhibitory cell types, laminar structure, specific long-range projections — are largely missing from artificial networks.

**Credit assignment.** Already discussed: the brain lacks a clear substrate for backpropagation, and the extent to which biologically plausible alternatives can close the performance gap with backprop on large tasks is an open research question.

## 17. Putting it together

A useful mental map of the field is as follows. At the bottom sits the biophysics of single neurons — Hodgkin–Huxley, the cable equation, and reductions thereof — which determines the computational primitives available to the system. Above this sit network dynamics, where recurrent interactions among populations produce oscillations, attractors, and chaotic regimes that can be analysed by linearization and mean-field methods. Sitting on top of both is the plasticity layer, where Hebbian, STDP, BCM, and reward-modulated rules modify synapses so that networks come to represent useful quantities. Comparing this stack to the stack of deep learning — linear layers and nonlinearities, backprop-trained recurrent dynamics, and gradient-based plasticity — reveals both parallels and asymmetries. The parallels (hierarchical feature learning, normalization, attractor-like representations) motivate using deep networks as models of the brain. The asymmetries (biological plausibility of learning rules, energy efficiency, sparse coding, temporal dynamics) define the frontier of the field.

<div class="callout callout-success"><strong>A unifying perspective.</strong> <em>Computational neuroscience is not simply "biology with equations" nor "machine learning applied to neurons." It is a disciplined effort to ask, for each neural phenomenon, what problem is being solved, what algorithm solves it, and what biological implementation executes that algorithm — Marr's three levels, applied with the tools of dynamical systems and statistical learning theory.</em></div>

## 18. Reference table of models and scales

| Model | Variables | Scale | Primary use |
| --- | --- | --- | --- |
| Hodgkin–Huxley | \(V, m, h, n\) | single compartment | mechanistic biophysics |
| Cable equation | \(V(x,t)\) | dendritic tree | signal propagation |
| LIF | \(V\) | single neuron | large networks |
| QIF / EIF | \(V\) | single neuron | Class I dynamics, matched f–I |
| Izhikevich | \(V, u\) | single neuron | diverse firing patterns |
| GLM | \(\lambda(t)\) | single neuron | statistical fitting |
| Wilson–Cowan | \(E, I\) | population | oscillations, bistability |
| Hopfield | binary / continuous | network | associative memory |
| Rate RNN | \(r_i(t)\) | network | dynamics, task training |
| Balanced network | spiking | large network | irregular activity, E-I balance |

The quantities \(\tau_m\), \(\lvert E_K\rvert\), \(\lvert E_{\mathrm{Na}}\rvert\), and \(\lvert V_{\text{th}} - E_L\rvert\) are the four parameters that, to first approximation, set the timescale and amplitude of every phenomenon discussed above; internalizing their numerical values is the single most useful piece of dimensional intuition for the field.

## 19. What to take away

Three themes recur across every topic in this course. First, neural systems are fundamentally dynamical: their behaviour is best understood by writing down differential equations, locating fixed points, and analysing stability. Second, learning is plasticity plus an objective: Hebbian rules implement unsupervised correlation extraction, BCM and STDP add homeostatic selectivity, and neuromodulated three-factor rules implement reinforcement learning. Third, representations are the bridge between neuroscience and machine learning: the same ideas — sparse coding, normalization, hierarchical feature extraction, attractor dynamics — appear on both sides of the divide, and each translation in either direction has proven fruitful. The student who leaves this course able to write down a network, analyse its dynamics, attach a plausible plasticity rule, and compare the result with both electrophysiological data and a corresponding deep-learning system has the core competency the field rewards.
