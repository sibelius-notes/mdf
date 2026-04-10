---
title: "AMATH 382: Computational Modelling of Cellular Systems"
subjects: "AMATH"
prof: "Brian Ingalls"
---

## Sources and References

**Primary textbook** — B. Ingalls, *Mathematical Modeling in Systems Biology* (MIT Press, 2013; freely available at math.uwaterloo.ca/~bingalls/)

**Supplementary texts** — U. Alon, *An Introduction to Systems Biology: Design Principles of Biological Circuits* (2nd ed., CRC Press, 2019); J.D. Murray, *Mathematical Biology I: An Introduction* (3rd ed., Springer, 2002); J. Keener & J. Sneyd, *Mathematical Physiology* (Springer, 2009)

**Online resources** — XPPAUT documentation (math.pitt.edu/~bard/xpp); BioModels Database (ebi.ac.uk/biomodels); Virtual Cell (vcell.org)

---

# Chapter 1: Biochemical Kinetics and Reaction Networks

## 1.1 Mass Action Kinetics

Living cells are dynamic chemical systems — a human cell contains thousands of distinct molecular species participating in a web of interacting reactions. To reason quantitatively about cell behaviour, we model these reactions using the framework of **chemical kinetics**. The fundamental postulate of chemical kinetics is the **law of mass action**: the rate of an elementary reaction is proportional to the product of the concentrations of its reactants.

For a bimolecular reaction

\[ A + B \xrightarrow{k} C, \]

the reaction rate is \(v = k[A][B]\), where \(k\) is the **rate constant** (units depend on the order of the reaction). For a first-order, unimolecular reaction \(A \xrightarrow{k} B\), the rate is simply \(v = k[A]\). The intuition is elementary: two molecules react only when they collide, and the collision frequency is proportional to the product of their concentrations.

<div class="definition">
<strong>Definition (Mass Action Kinetics)</strong>: For an elementary reaction involving reactants with concentrations <em>X</em><sub>1</sub>, <em>X</em><sub>2</sub>, …, the reaction rate is

\[ v = k \prod_{i} X_i^{n_i}, \]

where <em>n<sub>i</sub></em> is the stoichiometric coefficient of species <em>i</em> on the reactant side, and <em>k</em> is the rate constant.
</div>

## 1.2 ODEs from Reaction Networks

Given a set of reactions and their rates, we construct ordinary differential equations (ODEs) for each molecular species by tracking how every reaction contributes to production or consumption. Consider the reversible reaction

\[ A \underset{k_{-1}}{\stackrel{k_1}{\rightleftharpoons}} B. \]

The forward reaction \(A \to B\) occurs at rate \(k_1[A]\) and the reverse reaction \(B \to A\) at rate \(k_{-1}[B]\). Therefore:

\[ \frac{d[A]}{dt} = -k_1[A] + k_{-1}[B], \qquad \frac{d[B]}{dt} = k_1[A] - k_{-1}[B]. \]

At **thermodynamic equilibrium**, the net rates vanish: \(k_1[A]^* = k_{-1}[B]^*\), giving the equilibrium constant

\[ K_{eq} = \frac{[B]^*}{[A]^*} = \frac{k_1}{k_{-1}}. \]

This ratio of rate constants encodes the thermodynamic favourability of the reaction. The principle of **detailed balance** states that at equilibrium each individual reaction must be balanced by its reverse — this connects kinetic parameters to thermodynamics and constrains the parameters of any physically consistent model.

## 1.3 The Stoichiometric Matrix

For networks with many species and reactions, tracking each ODE separately becomes unwieldy. The **stoichiometric matrix** \(S\) provides a compact, systematic framework. We define:

- Each **column** of \(S\) corresponds to a reaction.
- Each **row** of \(S\) corresponds to a molecular species.
- The entry \(S_{ij}\) equals the net number of molecules of species \(i\) produced per occurrence of reaction \(j\) (negative for consumption, positive for production).

If \(\mathbf{X}\) is the vector of species concentrations and \(\mathbf{v}(\mathbf{X})\) is the vector of reaction rates, then the entire ODE system is compactly expressed as:

\[ \frac{d\mathbf{X}}{dt} = S \cdot \mathbf{v}(\mathbf{X}). \]

<div class="example">
<strong>Example — Three-reaction network</strong>: Consider the network

\[ \emptyset \xrightarrow{v_1} A, \quad A \xrightarrow{v_2} B, \quad B \xrightarrow{v_3} \emptyset. \]

With species ordered \((A, B)\) and reactions ordered \((v_1, v_2, v_3)\):

\[ S = \begin{pmatrix} 1 & -1 & 0 \\ 0 & 1 & -1 \end{pmatrix}. \]

The ODE system is then:

\[ \frac{d[A]}{dt} = v_1 - v_2, \qquad \frac{d[B]}{dt} = v_2 - v_3, \]

which matches what one would write by inspection.
</div>

## 1.4 Conservation Laws and Moiety Conservation

Many biochemical reaction networks conserve the total amount of certain chemical **moieties** (structural subgroups), even as individual species interconvert. These conservation laws reduce the effective dimension of the system. Mathematically, a conservation law corresponds to a vector \(\mathbf{c}\) such that \(\mathbf{c}^T S = \mathbf{0}\) — that is, \(\mathbf{c}\) lies in the **left null space** of \(S\). Then

\[ \frac{d}{dt}\left(\mathbf{c}^T \mathbf{X}\right) = \mathbf{c}^T S \mathbf{v} = 0, \]

so the quantity \(\mathbf{c}^T \mathbf{X}\) is constant in time.

A ubiquitous example is **enzyme conservation**: a free enzyme \(E\) and its substrate-bound complex \(ES\) together conserve the total enzyme:

\[ [E] + [ES] = E_{tot} = \text{const}. \]

This allows us to eliminate one variable and reduce the system's dimension. Conservation laws are automatically found by computing the left null space of \(S\), a linear algebra operation readily performed by software.

---

# Chapter 2: Enzyme Kinetics

## 2.1 Motivation and the Michaelis–Menten Scheme

Nearly all biochemical reactions in cells are catalysed by **enzymes** — protein catalysts that dramatically accelerate reaction rates without being consumed. Understanding enzyme kinetics is central to modelling cellular metabolism, signalling, and gene regulation.

The canonical model is the **Michaelis–Menten scheme**, proposed by Leonor Michaelis and Maud Menten in 1913. A substrate \(S\) binds reversibly to the enzyme \(E\) to form a complex \(ES\), which then releases product \(P\) and regenerates the free enzyme:

\[ E + S \underset{k_{-1}}{\stackrel{k_1}{\rightleftharpoons}} ES \xrightarrow{k_2} E + P. \]

By mass action kinetics, the ODEs for this scheme are:

\[ \frac{d[S]}{dt} = -k_1[E][S] + k_{-1}[ES], \]

\[ \frac{d[ES]}{dt} = k_1[E][S] - k_{-1}[ES] - k_2[ES], \]

\[ \frac{d[E]}{dt} = -k_1[E][S] + (k_{-1} + k_2)[ES], \]

\[ \frac{d[P]}{dt} = k_2[ES]. \]

The enzyme conservation \([E] + [ES] = E_{tot}\) allows us to eliminate \([E]\). This still leaves a nonlinear system, which motivates the key approximation.

## 2.2 The Quasi-Steady-State Approximation

If the enzyme concentration is much smaller than the substrate concentration (\(E_{tot} \ll [S]\)), the complex \([ES]\) reaches a **quasi-steady state** rapidly and thereafter tracks the slow variable \([S]\). Setting \(d[ES]/dt \approx 0\):

\[ k_1(E_{tot} - [ES])[S] - (k_{-1} + k_2)[ES] = 0. \]

Solving for \([ES]\):

\[ [ES] = \frac{E_{tot}[S]}{K_M + [S]}, \]

where \(K_M = (k_{-1} + k_2)/k_1\) is the **Michaelis constant**. The net rate of product formation is then:

\[ v = k_2[ES] = \frac{V_{max}[S]}{K_M + [S]}, \]

with \(V_{max} = k_2 E_{tot}\). This is the celebrated **Michaelis–Menten equation**.

<div class="definition">
<strong>Definition (Michaelis–Menten Kinetics)</strong>: The reaction rate for an enzyme-catalysed reaction under the quasi-steady-state approximation is

\[ v = \frac{V_{max}[S]}{K_M + [S]}, \]

where <em>V</em><sub>max</sub> is the maximal rate (achieved when all enzyme is saturated) and <em>K<sub>M</sub></em> is the substrate concentration at half-maximal rate: <em>v</em>(<em>K<sub>M</sub></em>) = <em>V</em><sub>max</sub>/2.
</div>

The parameter \(K_M\) has an elegant biological interpretation: it measures the enzyme's **affinity** for the substrate (lower \(K_M\) means higher affinity). When \([S] \ll K_M\), the rate is approximately linear in \([S]\): \(v \approx (V_{max}/K_M)[S]\), resembling first-order kinetics. When \([S] \gg K_M\), the enzyme is saturated and \(v \approx V_{max}\), giving zeroth-order kinetics.

## 2.3 Enzyme Inhibition

Inhibitors are molecules that reduce enzyme activity. Their mechanisms fall into two main categories.

**Competitive inhibition** occurs when an inhibitor \(I\) binds the active site of \(E\), directly competing with \(S\). The inhibitor cannot bind the \(ES\) complex. The result is that the apparent \(K_M\) is increased to \(K_M^{app} = K_M(1 + [I]/K_I)\), while \(V_{max}\) remains unchanged. At sufficiently high substrate concentrations, competitive inhibition can be overcome.

**Non-competitive inhibition** occurs when \(I\) binds a site distinct from the active site, and the inhibitor–enzyme complex \(EI\) (or \(ESI\)) cannot produce product. This reduces the apparent \(V_{max}\) to \(V_{max}^{app} = V_{max}/(1 + [I]/K_I)\), while \(K_M\) is unaffected. The inhibition cannot be overcome by adding more substrate.

## 2.4 Cooperativity and the Hill Equation

Many enzymes and receptors display **cooperativity**: binding of one ligand molecule alters the affinity of subsequent ligand molecules. A classic example is haemoglobin, where binding of one oxygen molecule increases affinity for subsequent molecules (**positive cooperativity**).

The **Hill equation** phenomenologically captures sigmoidal binding curves:

\[ v = \frac{V_{max}[S]^n}{K_{half}^n + [S]^n}, \]

where \(n\) is the **Hill coefficient** and \(K_{half}\) is the concentration giving half-maximal activity. For \(n = 1\), the Hill equation reduces to Michaelis–Menten kinetics. For \(n > 1\), the response is sigmoidal — the curve rises steeply around \(K_{half}\), creating a **switch-like** response that is highly biologically relevant. Hill coefficients \(n > 1\) indicate positive cooperativity; \(n < 1\) indicates negative cooperativity.

The sigmoidal response from cooperativity is a core design principle in cell biology: it allows biochemical switches that respond sharply to small changes in ligand concentration, filtering noise while amplifying biologically meaningful signals.

---

# Chapter 3: Dynamics and Stability Analysis

## 3.1 Phase Plane Analysis

For a two-dimensional ODE system

\[ \frac{dx}{dt} = f(x, y), \qquad \frac{dy}{dt} = g(x, y), \]

the **phase plane** is the \((x, y)\) space in which the trajectory of a solution is traced. A central tool is the **nullcline**: the \(x\)-nullcline is the set of points where \(dx/dt = 0\) (i.e., \(f(x,y) = 0\)), and the \(y\)-nullcline where \(dy/dt = 0\). **Fixed points** (steady states) occur at the intersections of nullclines.

By drawing nullclines and noting the direction of flow in each region, one can often determine qualitative behaviour without solving equations explicitly. This geometric approach is particularly powerful for biological systems, where precise parameter values may be unknown.

## 3.2 Linearisation and the Jacobian

Near a fixed point \(\mathbf{x}^*\), the dynamics of small perturbations \(\delta\mathbf{x} = \mathbf{x} - \mathbf{x}^*\) are governed by the **linearised system**:

\[ \frac{d\,\delta\mathbf{x}}{dt} \approx J\,\delta\mathbf{x}, \]

where \(J\) is the **Jacobian matrix** evaluated at \(\mathbf{x}^*\):

\[ J_{ij} = \frac{\partial f_i}{\partial x_j}\bigg|_{\mathbf{x}^*}. \]

The stability of the fixed point is determined by the eigenvalues \(\lambda\) of \(J\). If all eigenvalues satisfy \(\text{Re}(\lambda) < 0\), the fixed point is **locally asymptotically stable**: perturbations decay and trajectories return to \(\mathbf{x}^*\). If any eigenvalue has \(\text{Re}(\lambda) > 0\), the fixed point is **unstable**.

<div class="theorem">
<strong>Stability Classification (2D systems)</strong>: For a 2×2 Jacobian with trace <em>τ</em> = tr(<em>J</em>) and determinant <em>Δ</em> = det(<em>J</em>):
<ul>
<li><em>Δ</em> < 0: <strong>saddle point</strong> (always unstable; one eigenvalue positive, one negative)</li>
<li><em>Δ</em> > 0, <em>τ</em> < 0: <strong>stable node or spiral</strong> (perturbations decay)</li>
<li><em>Δ</em> > 0, <em>τ</em> > 0: <strong>unstable node or spiral</strong></li>
<li><em>τ</em> = 0, <em>Δ</em> > 0: <strong>centre</strong> (purely imaginary eigenvalues; linear neutrally stable)</li>
</ul>
</div>

## 3.3 Bifurcation Theory

A **bifurcation** occurs when a qualitative change in system behaviour (number or stability of fixed points, appearance of a limit cycle) happens as a parameter is continuously varied. Bifurcation analysis reveals how biological systems switch between functional states.

**Saddle-node bifurcation**: As a parameter \(\mu\) increases through a critical value \(\mu_c\), two fixed points (one stable, one unstable) collide and annihilate. For \(\mu < \mu_c\) there are two fixed points; for \(\mu > \mu_c\) there are none. This mechanism underlies the sudden appearance or disappearance of stable states in biological switches.

**Hopf bifurcation**: As a parameter varies, a stable spiral fixed point loses stability (\(\text{Re}(\lambda)\) crosses zero) and a stable **limit cycle** is born (supercritical Hopf) or an unstable limit cycle collapses onto the fixed point (subcritical Hopf). This is the primary mechanism generating **sustained oscillations** in biological models — circadian rhythms, cell cycle oscillations, and neural firing all arise through Hopf bifurcations.

## 3.4 Bistability

A system is **bistable** if it has two coexisting stable steady states. In the phase plane, this typically appears as an S-shaped (sigmoidal) nullcline intersecting another nullcline at three points: two stable nodes separated by an unstable saddle. The two stable states correspond to distinct biological phenotypes, and the saddle defines the threshold (separatrix) between the two basins of attraction.

Bistability requires some form of positive feedback or cooperative nonlinearity. Once a bistable system commits to one state, it remains there even if the stimulus that triggered the switch is removed — the system exhibits **hysteresis** as a parameter sweeps back and forth. This irreversibility is fundamental to biological decision-making (cell differentiation, the mitotic switch).

## 3.5 Separation of Time Scales

When a system contains processes occurring at very different rates, one can exploit **separation of time scales** to reduce model complexity. Fast variables relax quickly to a manifold determined by the slow variables; one can then apply a quasi-steady-state approximation for the fast variables and obtain a lower-dimensional system for the slow dynamics. This is the mathematical justification for the Michaelis–Menten QSSA and underlies many model reductions in cell biology.

---

# Chapter 4: Metabolic Networks

## 4.1 Metabolic Pathways and Feedback Inhibition

**Metabolic networks** consist of chains and cycles of enzyme-catalysed reactions that convert nutrient substrates into energy and biosynthetic precursors. A canonical motif is the **linear biosynthetic pathway**:

\[ S \xrightarrow{E_1} M_1 \xrightarrow{E_2} M_2 \xrightarrow{E_3} P, \]

where \(S\) is the substrate, \(M_i\) are intermediates, and \(P\) is the end product. A common regulatory design is **end-product (feedback) inhibition**: the end product \(P\) inhibits the first enzyme \(E_1\), preventing wasteful overproduction of \(P\) when its concentration is already high. This is a classic example of negative feedback securing **homeostasis** — maintaining product levels near a set point despite fluctuating inputs.

The inhibition is often allosteric: \(P\) binds a regulatory site on \(E_1\), inducing a conformational change that reduces activity. The Hill equation captures the sigmoidal dependence of this inhibition on \([P]\).

## 4.2 Metabolic Control Analysis

A central question in metabolic network modelling is: how is control over the steady-state metabolic flux distributed among the enzymes? **Metabolic Control Analysis (MCA)** provides a quantitative framework through dimensionless sensitivity coefficients.

The **flux control coefficient** measures the relative change in steady-state flux \(J\) in response to a relative change in the activity (or level) of enzyme \(E_i\):

\[ C^J_{E_i} = \frac{\partial J}{\partial E_i} \cdot \frac{E_i}{J} = \frac{d\ln J}{d\ln E_i}. \]

A coefficient \(C^J_{E_i} = 0.8\) means that a 1% increase in enzyme \(i\) increases steady-state flux by 0.8% — enzyme \(i\) exerts substantial control.

<div class="theorem">
<strong>Summation Theorem (MCA)</strong>: For any metabolic pathway, the flux control coefficients over all enzymes sum to unity:

\[ \sum_i C^J_{E_i} = 1. \]

This reflects the constraint that control is a collective property of the network, not localised to a single enzyme.
</div>

**Elasticity coefficients** describe how an individual enzyme's rate responds to changes in its substrates or products:

\[ \varepsilon^{v_i}_{S} = \frac{\partial \ln v_i}{\partial \ln [S]}. \]

These are local properties of individual enzymes (measured in isolation), while flux control coefficients are global properties of the network. The **connectivity theorem** relates the two:

\[ \sum_i C^J_{E_i} \varepsilon^{v_i}_{S} = 0, \]

for any intermediate metabolite \(S\). MCA thus provides a powerful framework for understanding how enzymatic parameters determine the behaviour of an entire metabolic system.

## 4.3 Flux Balance Analysis

For large-scale metabolic networks (thousands of reactions), the full kinetic details are unknown. **Flux balance analysis (FBA)** bypasses kinetics by imposing the steady-state constraint \(S \cdot \mathbf{v} = \mathbf{0}\) and then using linear programming to find the flux distribution \(\mathbf{v}\) that maximises a biological objective (typically growth or ATP production), subject to thermodynamic and capacity constraints. FBA has been remarkably successful at predicting growth phenotypes and the effects of gene knockouts in bacteria and yeast.

---

# Chapter 5: Signal Transduction

## 5.1 Receptor–Ligand Binding

Cells communicate through **signal transduction**: extracellular signals (hormones, growth factors, neurotransmitters) bind to cell-surface receptors, triggering intracellular cascades. The basic binding reaction is

\[ R + L \underset{k_{-1}}{\stackrel{k_1}{\rightleftharpoons}} RL, \]

where \(R\) is the free receptor and \(L\) is the ligand. At steady state, the fraction of occupied receptors follows a hyperbolic (Michaelis–Menten-like) curve:

\[ f = \frac{[L]}{K_D + [L]}, \]

where \(K_D = k_{-1}/k_1\) is the **dissociation constant** (lower \(K_D\) means higher affinity). This is the **dose-response** relationship: it describes how the cellular response varies with ligand concentration. The steepness of the dose-response curve — its **sensitivity** — determines how precisely a cell can detect changes in ligand concentration.

## 5.2 Signalling Cascades and Ultrasensitivity

Many signalling pathways employ multi-tier kinase cascades. The **MAPK (MAP kinase) cascade** is a three-tier phosphorylation cascade that amplifies upstream signals and is involved in cell proliferation, differentiation, and stress responses. At each tier, a kinase is activated (by phosphorylation) and in turn activates the next kinase, while phosphatases oppose each activation.

A remarkable property discovered by Goldbeter and Koshland is **zero-order ultrasensitivity**. When the kinase and phosphatase operating on a substrate both work near saturation (zero-order kinetics), the steady-state phosphorylation level is an extremely steep sigmoid function of the kinase-to-phosphatase ratio. The effective Hill coefficient of this response can be much greater than 1 even for non-cooperative enzymes.

<div class="theorem">
<strong>Goldbeter–Koshland Ultrasensitivity</strong>: When both the activating enzyme (kinase) and deactivating enzyme (phosphatase) of a substrate operate at saturation (Michaelis–Menten \([S] \gg K_M\)), the steady-state fraction of activated substrate switches sharply with changes in the kinase/phosphatase activity ratio. This mechanism can generate switch-like responses with high cooperativity (large apparent Hill coefficient) in the absence of allosteric cooperativity.
</div>

## 5.3 Adaptation

Many signalling systems display **perfect adaptation**: after a sustained step change in stimulus, the response returns exactly to its pre-stimulus level, encoding only changes in stimulus rather than absolute level. This is analogous to derivative sensing.

Perfect adaptation requires **integral feedback control** — a special network topology in which the output feeds back through an integrating node. Mathematically, perfect adaptation requires specific network motifs: a regulatory circuit that effectively computes the time integral of the output error. The analysis of adaptation in bacterial chemotaxis (Barkai and Leibler, 1997) showed that near-perfect adaptation can be achieved in a robust, parameter-insensitive manner through a methylation-based integral feedback.

## 5.4 Bistability and Oscillations in Signalling

**Positive feedback** in signalling can generate bistability, creating all-or-nothing switches. The activation of **MPF (Maturation Promoting Factor)** during mitotic entry is bistable: a cell either commits to division or stays in interphase, with hysteresis ensuring the commitment is irreversible.

**Negative feedback** with time delay generates sustained oscillations. The **NF-κB** signalling system oscillates due to negative feedback through the inhibitor IκBα, which is transcriptionally induced by NF-κB itself but requires time for synthesis and translocation. Similarly, **calcium oscillations** arise from the interplay of IP3-mediated calcium release and calcium-dependent inactivation — a system amenable to Hopf bifurcation analysis.

---

# Chapter 6: Gene Regulatory Networks

## 6.1 Transcription, Translation, and the Basic Gene Expression Model

Gene expression involves two main steps: **transcription** (synthesis of mRNA from a DNA template) and **translation** (synthesis of protein from the mRNA template). A minimal model treats mRNA concentration \(m\) and protein concentration \(p\) as dynamic variables:

\[ \frac{dm}{dt} = \beta_m - \gamma_m m, \qquad \frac{dp}{dt} = \beta_p m - \gamma_p p, \]

where \(\beta_m\) is the mRNA transcription rate, \(\gamma_m\) the mRNA degradation rate constant, \(\beta_p\) the translation rate constant (protein produced per mRNA per time), and \(\gamma_p\) the protein degradation rate constant. The steady-state protein level is:

\[ p^* = \frac{\beta_m \beta_p}{\gamma_m \gamma_p}. \]

The timescales are set by the half-lives: \(\tau_m = \ln 2 / \gamma_m\) and \(\tau_p = \ln 2 / \gamma_p\). In many bacteria, \(\tau_m \approx\) 2–5 minutes while \(\tau_p\) can be hours (protein is diluted by cell division as well as degraded). The separation of these timescales justifies a further quasi-steady-state approximation: setting \(m \approx \beta_m/\gamma_m\) gives an effective single-equation model for protein.

## 6.2 The Toggle Switch

The **toggle switch** (Gardner et al., *Nature* 2000) is a synthetic gene circuit comprising two mutually repressing genes. Gene A encodes a repressor of gene B, and gene B encodes a repressor of gene A. With Hill-function repression:

\[ \frac{dm_A}{dt} = \frac{\alpha_A}{1 + \left([P_B]/K_B\right)^n} - \gamma_{m_A} m_A, \]

\[ \frac{dm_B}{dt} = \frac{\alpha_B}{1 + \left([P_A]/K_A\right)^n} - \gamma_{m_B} m_B. \]

Phase plane analysis reveals that for sufficiently strong repression (large Hill coefficient \(n\) or high repressor production), this network is bistable: either gene A is highly expressed and gene B suppressed, or vice versa. The two stable states correspond to distinct cellular phenotypes. Transient stimuli can flip the circuit from one state to the other. The toggle switch illustrates how bistability emerges from positive feedback (mutual repression creates a double-negative, equivalent to positive, feedback loop).

## 6.3 The Repressilator

The **repressilator** (Elowitz & Leibler, *Nature* 2000) is a three-gene synthetic circuit where gene A represses gene B, gene B represses gene C, and gene C represses gene A — forming a ring of three repressors. This negative feedback loop with an odd number of elements (here, three) generates sustained oscillations, as confirmed experimentally via GFP fluorescence.

The minimal protein-only model:

\[ \frac{dp_i}{dt} = \frac{\alpha}{1 + p_j^n} - \gamma p_i, \quad (i, j) \in \{(A,C), (B,A), (C,B)\}. \]

For large \(n\) (strong cooperativity), the system undergoes a Hopf bifurcation as the repression strength increases, giving rise to limit cycle oscillations. The repressilator demonstrates that oscillations do not require explicit positive feedback — they can arise from delayed negative feedback alone.

## 6.4 Noise in Gene Expression

In single cells, many proteins are present at low copy numbers (tens to hundreds of molecules), and biochemical reactions are inherently stochastic. **Intrinsic noise** arises from random fluctuations in the timing of individual transcription, translation, and degradation events — even genetically identical cells in identical environments will show cell-to-cell variability. **Extrinsic noise** arises from fluctuations in upstream components (transcription factors, ribosomes, polymerases) shared by many genes.

The **Gillespie algorithm** provides an exact method for simulating the stochastic dynamics of a well-mixed chemical system. At each step, two random numbers determine (i) the time to the next reaction event and (ii) which reaction fires, with probabilities proportional to the reaction propensities. For large molecule numbers, the stochastic simulations converge to the deterministic ODE predictions, but for low copy numbers, stochastic effects dominate.

For a simple gene expression model (birth–death process for protein), the stationary distribution of protein number is Poisson with mean \(\langle p \rangle = \beta/\gamma\) — intrinsic noise satisfies \(CV^2 = \sigma^2/\langle p\rangle^2 = 1/\langle p\rangle\), so noise is inversely proportional to mean protein number.

## 6.5 Circadian Oscillators

**Circadian oscillators** are biochemical clocks that generate ~24-hour oscillations in cellular activity, enabling organisms to anticipate daily environmental cycles. The simplest mathematical model capturing the core mechanism is the **Goodwin oscillator**: a negative feedback loop with a single gene producing a protein that represses its own transcription, with multiple intermediate steps introducing sufficient delay.

The **Drosophila circadian oscillator** involves the Period (PER) and Timeless (TIM) proteins, which dimerize and translocate to the nucleus to repress their own transcription. A key kinetic feature is the multi-step phosphorylation of PER (catalysed by the kinase DBT), which introduces the delay needed for oscillations. The mathematical analysis involves finding the Hopf bifurcation boundary in parameter space as the number of phosphorylation steps and the repression strength are varied.

---

# Chapter 7: Electrophysiology

## 7.1 Membrane Potential and Ion Channels

Neurons and muscle cells are electrically excitable: they can generate rapid, transient changes in their transmembrane voltage — **action potentials** — that propagate along cell membranes to transmit information. The transmembrane voltage \(V\) arises from differences in ion concentrations across the lipid bilayer, maintained by active transporters (ion pumps).

The electrochemical equilibrium potential for a single ion species is given by the **Nernst equation**:

\[ E_{ion} = \frac{RT}{zF} \ln\frac{[ion]_{out}}{[ion]_{in}}, \]

where \(R\) is the gas constant, \(T\) temperature (Kelvin), \(F\) the Faraday constant, and \(z\) the ion valence. For \(K^+\) at body temperature with typical physiological concentrations, \(E_K \approx -90\) mV; for \(Na^+\), \(E_{Na} \approx +60\) mV. The **resting membrane potential** of a typical neuron (~−70 mV) lies between these extremes because multiple ion species contribute, weighted by their respective membrane permeabilities. The **Goldman equation** accounts for this:

\[ V_{rest} = \frac{RT}{F} \ln\frac{P_K[K^+]_{out} + P_{Na}[Na^+]_{out} + P_{Cl}[Cl^-]_{in}}{P_K[K^+]_{in} + P_{Na}[Na^+]_{in} + P_{Cl}[Cl^-]_{out}}, \]

where \(P_X\) denotes the membrane permeability to ion species \(X\). Ion flow across the membrane is mediated by **ion channels** — protein pores that open and close in response to voltage, ligands, or mechanical stimuli.

## 7.2 The Hodgkin–Huxley Model

The **Hodgkin–Huxley (HH) model** (1952, Nobel Prize 1963) is the quantitative foundation of modern computational neuroscience. Alan Hodgkin and Andrew Huxley developed the model from voltage-clamp experiments on the squid giant axon. The membrane is modelled as a capacitor in parallel with conductance elements for each ion species:

\[ C_m \frac{dV}{dt} = I_{app} - I_{Na} - I_K - I_L, \]

where \(C_m\) is the membrane capacitance, \(I_{app}\) an applied current, and the ionic currents are:

\[ I_{Na} = g_{Na} m^3 h (V - E_{Na}), \]

\[ I_K = g_K n^4 (V - E_K), \]

\[ I_L = g_L (V - E_L). \]

Here \(g_{Na}\), \(g_K\), \(g_L\) are maximal conductances, and \(m\), \(h\), \(n\) are **gating variables** between 0 and 1 representing the probabilities that individual channel gates are open. Each gating variable obeys a first-order kinetic equation:

\[ \frac{dw}{dt} = \frac{w_\infty(V) - w}{\tau_w(V)}, \quad w \in \{m, h, n\}, \]

where \(w_\infty(V)\) is the voltage-dependent steady-state gate value and \(\tau_w(V)\) is the voltage-dependent time constant, both determined from experimental data.

<div class="definition">
<strong>Definition (Gating Variables)</strong>: The gating variable <em>m</em> represents fast Na<sup>+</sup> channel activation (activates rapidly on depolarisation), <em>h</em> represents slow Na<sup>+</sup> channel inactivation (inactivates slowly after activation), and <em>n</em> represents K<sup>+</sup> channel activation (activates slowly on depolarisation). The Na<sup>+</sup> channel requires three <em>m</em> gates and one <em>h</em> gate to be open simultaneously (hence <em>m</em><sup>3</sup><em>h</em>), and the K<sup>+</sup> channel requires four <em>n</em> gates (hence <em>n</em><sup>4</sup>).
</div>

The action potential mechanism in the HH model: A sufficiently large depolarisation (membrane potential increasing from rest) rapidly opens Na\(^+\) channels (fast \(m\) activation), causing an inward Na\(^+\) current that further depolarises the membrane — a positive feedback loop driving the rapid **upstroke**. The rising voltage simultaneously begins to inactivate Na\(^+\) channels (slow \(h\) inactivation) and activate K\(^+\) channels (slow \(n\) activation), both of which drive repolarisation back toward rest. The **refractory period** following an action potential arises because the \(h\) gates remain inactivated for a time, preventing immediate re-firing.

## 7.3 The FitzHugh–Nagumo Model

The full 4-dimensional HH model is difficult to analyse analytically. The **FitzHugh–Nagumo (FHN) model** is a 2-dimensional caricature that retains the essential excitability:

\[ \frac{dv}{dt} = v - \frac{v^3}{3} - w + I_{app}, \]

\[ \frac{dw}{dt} = \varepsilon(v + a - bw), \]

where \(v\) is a fast voltage-like variable, \(w\) is a slow recovery variable, \(I_{app}\) is the applied current, and \(\varepsilon \ll 1\) enforces the time-scale separation.

The \(v\)-nullcline is a cubic \(w = v - v^3/3 + I_{app}\); the \(w\)-nullcline is the line \(w = (v + a)/b\). Their intersection defines the fixed point. For small \(I_{app}\), the system is at a stable resting state (**excitable**: a sufficiently large perturbation initiates a large excursion before returning to rest). As \(I_{app}\) increases, a subcritical Hopf bifurcation occurs and the fixed point becomes unstable, giving **repetitive firing** (limit cycle). The phase plane of FHN is analytically tractable and reveals the threshold separatrix, refractory period, and oscillatory regime in a transparent geometric way.

## 7.4 Bursting Neurons

Many neurons do not fire regular spike trains but produce **bursts** — clusters of action potentials separated by quiescent periods. Bursting can be understood through **slow-fast analysis**: the fast subsystem (voltage and fast gates) is HH-like, while a slow variable (e.g., slow K\(^+\) current or intracellular Ca\(^2+\)) modulates the fast subsystem's bifurcation parameter on a slower time scale.

As the slow variable evolves, it drives the fast subsystem through a bifurcation: when the fast subsystem is in its oscillatory regime, spikes fire (the burst); when the slow variable has accumulated enough to push the fast subsystem back to quiescence (via a fold bifurcation or homoclinic bifurcation), firing stops until the slow variable recovers and the next burst begins. This geometrical decomposition of slow-fast dynamics is central to the computational analysis of neuronal diversity.

## 7.5 Synaptic Transmission

Neurons communicate at **synapses**. An action potential in the **presynaptic** neuron causes Ca\(^{2+}\)-mediated release of neurotransmitter into the synaptic cleft. Neurotransmitter binds postsynaptic receptors, opening ion channels and generating a **postsynaptic potential**: an **EPSP** (excitatory postsynaptic potential) if the reversal potential drives depolarisation, or an **IPSP** (inhibitory postsynaptic potential) if it drives hyperpolarisation.

The simplest model of a postsynaptic neuron is the **integrate-and-fire** model:

\[ C_m \frac{dV}{dt} = -g_L(V - E_L) + I_{syn}(t), \]

with the rule that whenever \(V\) reaches a threshold \(V_{th}\), a spike is recorded and \(V\) is reset to \(V_{reset}\). Despite its simplicity, the integrate-and-fire model captures many features of neural coding and is widely used in network-scale simulations.

---

## Appendix: Computational Tools

### Python / Google Colab

Numerical integration of ODE systems uses `scipy.integrate.solve_ivp` (or the older `odeint`). Phase portraits are generated by plotting nullclines (solving \(f = 0\) and \(g = 0\) using `numpy`) and overlaying vector fields with `matplotlib.pyplot.quiver`. Stochastic simulations use custom Gillespie algorithm implementations or the `gillespy2` library.

### MATLAB

MATLAB's `ode45` (explicit Runge–Kutta 4/5 adaptive step) is the workhorse solver for non-stiff systems; `ode15s` is preferred for stiff systems (e.g., fast-slow systems or systems with widely varying time scales). The `pplane` package provides an interactive phase-plane graphical interface.

### XPPAUT

XPPAUT (X-Windows Phase Plane plus AUTO) is the standard tool for bifurcation analysis in mathematical biology. AUTO, embedded in XPPAUT, performs numerical continuation: it follows a branch of steady states or limit cycles as a parameter varies, detecting bifurcation points automatically. XPPAUT `.ode` files specify the model symbolically, and the software handles numerical continuation, stability computation, and phase portrait generation interactively.
