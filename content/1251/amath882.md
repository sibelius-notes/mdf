---
title: "AMATH 882: Mathematical Cell Biology"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly accessible textbooks and references. Students are strongly encouraged to consult the original sources for deeper treatment of individual topics.

- L. Edelstein-Keshet, *Mathematical Models in Biology*, SIAM Classics in Applied Mathematics, 2005. Open PDF available via SIAM.
- J. D. Murray, *Mathematical Biology I: An Introduction* and *Mathematical Biology II: Spatial Models and Biomedical Applications*, Springer, 3rd edition.
- B. Ingalls, *Mathematical Modeling in Systems Biology*, MIT Press. Free PDF available at math.uwaterloo.ca/~bingalls/MMSB/.
- G. B. Ermentrout and D. H. Terman, *Mathematical Foundations of Neuroscience*, Springer, 2010.
- S. H. Strogatz, *Nonlinear Dynamics and Chaos*, Westview Press, 2nd edition.
- J. Keener and J. Sneyd, *Mathematical Physiology*, Springer, 2nd edition.

---

# Chapter 1: Biochemical Kinetics and Enzyme Dynamics

## Law of Mass Action

Every quantitative approach to intracellular biochemistry begins with the **law of mass action**, which asserts that the rate of a chemical reaction is proportional to the product of the concentrations of the reacting species. Consider the elementary bimolecular reaction

\[
A + B \xrightarrow{k} C.
\]

The law of mass action stipulates that the rate at which \(C\) is produced equals \(k[A][B]\), where the square brackets denote molar concentrations and \(k\) is the **rate constant** with appropriate units. This postulate, grounded in the kinetic theory of gases and later extended to dilute solutions, encodes the physical intuition that reaction events occur when molecules collide, and the frequency of collisions between species \(A\) and \(B\) is proportional to both \([A]\) and \([B]\).

For a reversible reaction

\[
A + B \underset{k_{-1}}{\stackrel{k_1}{\rightleftharpoons}} C,
\]

one writes a differential equation for each chemical species. Letting lower-case letters denote concentrations for brevity:

\[
\frac{dc}{dt} = k_1 \, a \, b - k_{-1} \, c, \qquad \frac{da}{dt} = \frac{db}{dt} = -k_1 \, a \, b + k_{-1} \, c.
\]

At thermodynamic equilibrium the rates balance, giving the **equilibrium constant** \(K_{eq} = k_1 / k_{-1} = c^* / (a^* b^*)\). The law of mass action thus converts a list of chemical reactions into a coupled system of ordinary differential equations (ODEs), which forms the bedrock of mathematical cell biology.

## Michaelis-Menten Kinetics

Enzymes are proteins that catalyse specific biochemical reactions by dramatically lowering activation energy barriers. The simplest mechanistic model of enzyme catalysis is the **Michaelis-Menten scheme**, proposed in 1913 by Leonor Michaelis and Maud Menten based on earlier work of Victor Henri. The mechanism reads

\[
E + S \underset{k_{-1}}{\stackrel{k_1}{\rightleftharpoons}} ES \xrightarrow{k_2} E + P,
\]

where \(S\) is substrate, \(E\) is free enzyme, \(ES\) is the enzyme-substrate complex, and \(P\) is product. Applying mass action to each species:

\[
\frac{ds}{dt} = -k_1 e s + k_{-1} c,
\]

\[
\frac{dc}{dt} = k_1 e s - k_{-1} c - k_2 c,
\]

\[
\frac{de}{dt} = -k_1 e s + k_{-1} c + k_2 c,
\]

\[
\frac{dp}{dt} = k_2 c,
\]

where \(c = [ES]\). The total enzyme concentration \(e_T = e + c\) is conserved, so \(e = e_T - c\), reducing the system to three equations in \(s\), \(c\), and \(p\).

### Quasi-Steady-State Approximation

A direct analytical solution is generally unavailable. The key simplification, due to Briggs and Haldane (1925), is the **quasi-steady-state approximation** (QSSA). When the enzyme concentration is much smaller than the substrate concentration (\(e_T \ll s_0\), where \(s_0\) is the initial substrate concentration), the complex \(c\) reaches a quasi-steady state on a time scale much faster than the depletion of substrate. One therefore sets \(dc/dt \approx 0\):

\[
k_1 (e_T - c) s - k_{-1} c - k_2 c = 0.
\]

Solving for \(c\):

\[
c = \frac{e_T s}{s + K_M}, \qquad K_M = \frac{k_{-1} + k_2}{k_1}.
\]

The constant \(K_M\) is the **Michaelis constant**. The rate of product formation is then

\[
\frac{dp}{dt} = k_2 c = \frac{k_2 e_T s}{s + K_M} = \frac{V_{\max} s}{s + K_M},
\]

where \(V_{\max} = k_2 e_T\) is the **maximal velocity** attained when all enzyme molecules are saturated with substrate. This is the celebrated Michaelis-Menten equation. The equation predicts hyperbolic saturation: at low substrate concentrations (\(s \ll K_M\)) the rate is approximately linear in \(s\), while at high concentrations (\(s \gg K_M\)) it saturates at \(V_{\max}\). The Michaelis constant has the interpretation that \(K_M\) equals the substrate concentration at which the reaction rate is half-maximal.

The reduced ODE for substrate dynamics becomes:

\[
\frac{ds}{dt} = -\frac{V_{\max} s}{s + K_M}.
\]

<div class="remark">
<strong>Validity of the QSSA.</strong> A rigorous justification of the QSSA follows from singular perturbation theory. Defining the small parameter \(\varepsilon = e_T / (s_0 + K_M)\), the Briggs-Haldane QSSA is valid when \(\varepsilon \ll 1\). The original Michaelis-Menten derivation assumed an additional condition, that \(k_{-1} \gg k_2\), so that complex formation is rapid relative to catalysis. The Briggs-Haldane condition is strictly weaker and more broadly applicable.
</div>

## Hill Functions and Cooperativity

Many biochemical processes exhibit **cooperativity**, a phenomenon in which the binding of one ligand molecule to a macromolecule alters — often enhances — the affinity for subsequent ligands. The archetypal example is oxygen binding to haemoglobin. A macroscopic description of cooperative binding is given by the **Hill equation**. Suppose \(n\) ligand molecules \(L\) bind simultaneously to a receptor \(R\):

\[
R + nL \rightleftharpoons RL_n.
\]

The fraction of occupied receptor sites at equilibrium is

\[
\theta = \frac{\left[L\right]^n}{K_d + \left[L\right]^n},
\]

where \(K_d\) is the dissociation constant and \(n\) is the **Hill coefficient**. When \(n = 1\) this reduces to a standard hyperbolic (Michaelis-Menten type) binding curve. For \(n > 1\) the dose-response curve is sigmoidal, with a steeper switch-like transition from low to high occupancy. The Hill coefficient provides a measure of cooperativity: \(n > 1\) implies positive cooperativity (binding of one ligand promotes further binding), \(n < 1\) implies negative cooperativity.

In the context of gene regulation and signal transduction, Hill functions appear ubiquitously as phenomenological descriptions of activation and repression. An **activating Hill function** is written

\[
f_+(x) = \frac{x^n}{K^n + x^n},
\]

and a **repressing Hill function** as

\[
f_-(x) = \frac{K^n}{K^n + x^n} = 1 - f_+(x).
\]

Both are bounded between 0 and 1, and the threshold \(K\) sets the input concentration at which the function attains its half-maximum value. The steepness parameter \(n\) controls how switch-like the transition is; in the limit \(n \to \infty\), \(f_+\) approaches a step function \(\Theta(x - K)\).

## Reversible Enzyme Kinetics and Product Inhibition

The elementary Michaelis-Menten scheme treats the catalytic step as irreversible. In many cellular contexts the reverse reaction matters, particularly when product concentrations are substantial or when the enzyme operates near equilibrium. The reversible scheme is

\[
E + S \underset{k_{-1}}{\stackrel{k_1}{\rightleftharpoons}} ES \underset{k_{-2}}{\stackrel{k_2}{\rightleftharpoons}} E + P.
\]

Applying the QSSA to the complex \(ES\) and allowing product rebinding, one derives the **reversible Michaelis-Menten** rate:

\[
v = \frac{V_f s / K_S - V_r p / K_P}{1 + s/K_S + p/K_P},
\]

where \(V_f = k_2 e_T\), \(V_r = k_{-1} e_T\), \(K_S = (k_{-1} + k_2)/k_1\), and \(K_P = (k_{-1} + k_2)/k_{-2}\). When \(p = 0\) (no product present) this reduces to the standard Michaelis-Menten expression. **Product inhibition** occurs because accumulated product competes with substrate for the active site: as \(p\) increases, the denominator grows and the net forward rate decreases, providing a natural negative feedback that prevents runaway substrate depletion in metabolic pathways.

---

# Chapter 2: Metabolic Networks

## Stoichiometric Matrix and Flux Balance Analysis

A metabolic network consists of a set of \(m\) metabolite species interacting through \(r\) reactions. The **stoichiometric matrix** \(N\) is an \(m \times r\) matrix whose entry \(N_{ij}\) is the net stoichiometric coefficient of metabolite \(i\) in reaction \(j\) (positive for products, negative for substrates). The time evolution of the metabolite concentration vector \(\mathbf{c} \in \mathbb{R}^m\) is governed by

\[
\frac{d\mathbf{c}}{dt} = N \mathbf{v}(\mathbf{c}),
\]

where \(\mathbf{v}(\mathbf{c}) \in \mathbb{R}^r\) is the flux vector, each component being the rate of the corresponding reaction.

**Flux balance analysis** (FBA) exploits the empirical observation that, on the time scale of cellular physiology, metabolite concentrations quickly reach a quasi-steady state. Setting \(d\mathbf{c}/dt = \mathbf{0}\) imposes the constraint

\[
N \mathbf{v} = \mathbf{0}.
\]

This is a homogeneous linear system. The solution space — the set of all flux distributions compatible with steady state — is the **null space** of \(N\), which is generally high-dimensional when the number of reactions exceeds the number of metabolites. FBA resolves this degeneracy by optimizing a biologically motivated linear objective (for example, maximizing biomass production rate) subject to the steady-state constraint and additional thermodynamic or capacity bounds:

\[
\max_{\mathbf{v}} \; \mathbf{c}^T \mathbf{v}, \quad \text{subject to} \quad N\mathbf{v} = \mathbf{0}, \quad \mathbf{v}_{\min} \leq \mathbf{v} \leq \mathbf{v}_{\max}.
\]

This linear programme can be solved efficiently even for genome-scale models comprising thousands of reactions, making FBA a cornerstone of systems biology.

## Metabolic Control Analysis

While FBA addresses steady-state fluxes, **metabolic control analysis** (MCA) asks how sensitive the steady-state fluxes and metabolite concentrations are to small perturbations in enzyme activities. Consider a metabolic system at steady state. The **flux control coefficient** of enzyme \(e_j\) on flux \(J_i\) is defined as the fractional change in steady-state flux \(J_i\) caused by a fractional change in the activity of enzyme \(e_j\):

\[
C^J_{e_j} = \frac{\partial \ln J_i}{\partial \ln e_j} = \frac{e_j}{J_i} \frac{\partial J_i}{\partial e_j}.
\]

Analogously, the **concentration control coefficient** of enzyme \(e_j\) on the steady-state concentration \(c_k\) is

\[
C^{c_k}_{e_j} = \frac{\partial \ln c_k}{\partial \ln e_j}.
\]

These coefficients quantify where metabolic control resides: a high \(C^J_{e_j}\) signals that enzyme \(j\) exerts strong control over the overall flux, and its activity is a suitable target for metabolic engineering.

### Summation Theorems

A fundamental theorem of MCA, proved independently by Kacser and Burns (1973) and Heinrich and Rapoport (1974), states that flux control coefficients sum to unity:

\[
\sum_j C^J_{e_j} = 1.
\]

This is the **flux summation theorem**. An analogous result for concentration control coefficients is

\[
\sum_j C^{c_k}_{e_j} = 0.
\]

These theorems have deep conceptual consequences. No single enzyme can have a flux control coefficient exceeding 1, and the coefficients may be positive or negative (the latter arising for enzymes that carry flux away from a branch point). The summation theorem is not merely a mathematical identity but a consequence of the scale invariance of kinetic equations under uniform rescaling of all enzyme concentrations.

<div class="theorem">
<strong>Connectivity Theorem.</strong> MCA also establishes connectivity theorems that relate control coefficients to local kinetic properties (elasticities). The <em>elasticity coefficient</em> of reaction \(j\) with respect to metabolite \(k\) is
\[
\varepsilon^{v_j}_{c_k} = \frac{\partial \ln v_j}{\partial \ln c_k},
\]
and the connectivity theorem states, for each internal metabolite \(k\):

\[
\sum_j C^J_{e_j} \varepsilon^{v_j}_{c_k} = 0.
\]
Together the summation and connectivity theorems form a complete algebraic system that determines all control coefficients from the elasticities.
</div>

## Metabolic Oscillations: The Sel'kov Glycolytic Oscillator

Biochemical oscillations arise in metabolic networks through feedback mechanisms that destabilize steady states. A paradigmatic example is the **Sel'kov model** of glycolytic oscillations (1968), which captures the essential dynamics of phosphofructokinase (PFK), an allosteric enzyme that catalyses a key step in glycolysis. ADP, a product of the PFK reaction, activates the enzyme, creating a positive feedback loop.

The Sel'kov model is a two-variable ODE system:

\[
\frac{du}{dt} = -u + a v + u^2 v,
\]

\[
\frac{dv}{dt} = b - a v - u^2 v,
\]

where \(u\) and \(v\) represent (scaled) concentrations of ADP and F6P (fructose-6-phosphate) respectively, and \(a\) and \(b\) are positive parameters. The nonlinear term \(u^2 v\) encodes the autocatalytic activation: ADP activates PFK, which produces more ADP. The steady state is found by setting the right-hand sides to zero, giving \(u^* = b\), \(v^* = b / (a + b^2)\). A linear stability analysis around this steady state reveals that for appropriate parameter values (\(a\) small and \(b\) in a certain range), the steady state is unstable and the system undergoes a **Hopf bifurcation**, giving rise to a stable limit cycle that corresponds to sustained glycolytic oscillations. These oscillations have been observed experimentally in yeast extracts as periodic variations in NADH fluorescence.

---

# Chapter 3: Signal Transduction Networks

## Receptor-Ligand Binding and Receptor Downregulation

Cells sense their chemical environment through surface receptors. In the simplest model, a ligand \(L\) binds reversibly to a receptor \(R\) to form a complex \(C\):

\[
R + L \underset{k_{\text{off}}}{\stackrel{k_{\text{on}}}{\rightleftharpoons}} C.
\]

At equilibrium, the fraction of occupied receptors is given by the Langmuir isotherm:

\[
\bar{C} = \frac{\left[L\right]}{K_d + \left[L\right]},
\]

with \(K_d = k_{\text{off}} / k_{\text{on}}\) being the dissociation constant. Cells regulate their sensitivity to persistent ligand stimulation through **receptor downregulation**: prolonged ligand binding triggers receptor internalisation (endocytosis) and subsequent degradation. A minimal ODE model incorporating synthesis, binding, and downregulation is

\[
\frac{d[R]}{dt} = k_s - k_{\text{on}} [R][L] + k_{\text{off}} [C] - k_{\text{deg}}[R],
\]

\[
\frac{d[C]}{dt} = k_{\text{on}} [R][L] - k_{\text{off}} [C] - k_i [C],
\]

where \(k_s\) is the receptor synthesis rate, \(k_{\text{deg}}\) is the free receptor degradation rate, and \(k_i\) is the rate of internalisation of ligand-bound complexes. At steady state, high ligand concentrations deplete surface receptors, reducing the cellular response — the hallmark of receptor desensitisation.

## G-Protein Coupled Receptor Cycle

**G-protein coupled receptors** (GPCRs) constitute the largest family of cell-surface receptors in eukaryotes. Upon ligand binding, an activated receptor catalyses the exchange of GDP for GTP on the \(\alpha\)-subunit of a heterotrimeric G-protein, causing dissociation of the \(G\alpha\)-GTP subunit, which then activates downstream effectors. The \(G\alpha\) subunit possesses intrinsic GTPase activity that hydrolyses GTP to GDP, returning \(G\alpha\) to its inactive state. A mathematical cycle describing GPCR activation can be written as a sequence of enzymatic steps:

\[
R + L \rightleftharpoons RL, \quad RL + G \rightleftharpoons RLG \to RL + G^*, \quad G^* \xrightarrow{k_{\text{hyd}}} G,
\]

where \(G^*\) denotes the active GTP-bound form. The rate of downstream signalling is proportional to \([G^*]\), which in turn depends on ligand concentration and receptor occupancy. The GTPase step introduces a natural timer that limits the duration of signalling, and GTPase-activating proteins (GAPs) can accelerate this inactivation.

## MAPK Cascade and Ultrasensitivity

The **mitogen-activated protein kinase** (MAPK) cascade is a three-tier phosphorylation relay central to cell proliferation, differentiation, and stress responses. The canonical cascade involves the sequential activation of MAPKKK, MAPKK (a dual-specificity kinase), and MAPK. Signal amplification occurs because each kinase is present in many copies, and one activated kinase molecule can phosphorylate many substrate molecules before being deactivated. An important additional property of such cascades is **ultrasensitivity**: the input-output relationship (fraction of activated MAPK as a function of upstream stimulus) is steeper than a Michaelis-Menten hyperbola, often resembling a sigmoidal or switch-like Hill function with an effective coefficient \(n > 1\). Goldbeter and Koshland (1981) showed that this ultrasensitivity can arise from **zero-order ultrasensitivity** (discussed below) operating at each tier of the cascade, and Huang and Ferrell (1996) demonstrated computationally that a three-tier cascade can convert a graded signal into a nearly all-or-none response.

## Phosphorylation-Dephosphorylation Cycles and Zero-Order Ultrasensitivity

A single phosphorylation-dephosphorylation cycle consists of a substrate \(W\) that is phosphorylated by a kinase \(K\) and dephosphorylated by a phosphatase \(P\):

\[
W \underset{K}{\rightleftharpoons} W^*, \quad W^* \underset{P}{\rightleftharpoons} W.
\]

Treating each enzymatic step with Michaelis-Menten kinetics:

\[
\frac{dw^*}{dt} = \frac{V_1 (W_T - w^*)}{K_1 + (W_T - w^*)} - \frac{V_2 w^*}{K_2 + w^*},
\]

where \(W_T\) is the total substrate concentration, \(V_1\) and \(V_2\) are the maximal velocities of the kinase and phosphatase, and \(K_1\), \(K_2\) are the corresponding Michaelis constants.

<div class="theorem">
<strong>Goldbeter-Koshland Zero-Order Ultrasensitivity.</strong> When the Michaelis constants \(K_1\) and \(K_2\) are both much smaller than the total substrate concentration \(W_T\) (the <em>zero-order regime</em>), both enzymes operate near saturation at all times. In this limit the steady-state fraction of phosphorylated substrate \(\phi = w^*/W_T\) exhibits a sigmoidal switch: for \(V_1 < V_2\), almost all substrate is dephosphorylated (\(\phi \approx 0\)); for \(V_1 > V_2\), almost all substrate is phosphorylated (\(\phi \approx 1\)); the transition between these states is sharp (ultrasensitive). The Hill coefficient characterising the steepness of this switch can be much greater than 1, even though the individual enzymatic steps are governed by standard Michaelis-Menten kinetics.
</div>

## Bistability and Switch-Like Behaviour

Many signalling networks exhibit **bistability**: two stable steady states coexist for the same set of external conditions. Bistability typically arises from positive feedback (self-amplification) combined with sufficient nonlinearity. A prototypical example is a phosphorylation cycle in which the active form of the substrate promotes its own phosphorylation. Let \(x\) denote the concentration of an active signalling molecule that catalyses its own activation:

\[
\frac{dx}{dt} = \frac{(a + b x^2)(1-x)}{K_1 + (1-x)} - \frac{V_2 x}{K_2 + x}.
\]

For appropriate parameter values, this equation possesses three steady states: two stable (one near \(x = 0\), one near \(x = 1\)) and one unstable. The system is said to exhibit an **S-shaped bifurcation diagram** in which the steady-state value of \(x\) as a function of stimulus is a multivalued curve with two saddle-node (fold) bifurcations delineating the hysteresis loop. Such bistable switches underlie irreversible cell-fate decisions, the all-or-none character of Xenopus egg fertilisation, and the lysis-lysogeny decision in bacteriophage lambda.

---

# Chapter 4: Gene Regulatory Networks

## Transcription, Translation, and Basic Gene Expression

The **central dogma** of molecular biology describes the flow of genetic information from DNA to mRNA to protein. In a mathematical framework, the simplest model of gene expression treats transcription (mRNA synthesis) and translation (protein synthesis) as first-order processes. Let \(m\) denote mRNA concentration and \(p\) denote protein concentration. The ODE system is

\[
\frac{dm}{dt} = k_m - \delta_m m,
\]

\[
\frac{dp}{dt} = k_p m - \delta_p p,
\]

where \(k_m\) is the transcription rate, \(\delta_m\) the mRNA degradation rate, \(k_p\) the translation rate, and \(\delta_p\) the protein degradation rate. This linear system reaches a unique stable steady state \(m^* = k_m / \delta_m\), \(p^* = k_p m^* / \delta_p = k_m k_p / (\delta_m \delta_p)\). The characteristic time scales are \(\tau_m = 1/\delta_m\) and \(\tau_p = 1/\delta_p\). In bacteria, mRNA half-lives are typically on the order of minutes while protein half-lives extend to hours, so \(\tau_m \ll \tau_p\) and one can quasi-steady-state reduce the mRNA equation to obtain a single protein ODE:

\[
\frac{dp}{dt} = \frac{k_m k_p}{\delta_m} - \delta_p p.
\]

## Regulated Gene Expression

### Inducible and Repressible Promoters

Gene expression is rarely constitutive; it is typically regulated by transcription factors that bind to promoter sequences and either activate or repress transcription. Let \(P\) be the concentration of a protein transcription factor. For an **inducible promoter** activated by \(P\):

\[
\frac{dm}{dt} = k_m f_+(P) - \delta_m m, \qquad f_+(P) = \frac{P^n}{K^n + P^n}.
\]

For a **repressible promoter** repressed by \(P\):

\[
\frac{dm}{dt} = k_m f_-(P) - \delta_m m, \qquad f_-(P) = \frac{K^n}{K^n + P^n}.
\]

These Hill-function descriptions arise from thermodynamic models of transcription factor binding to DNA, in which multiple binding sites with cooperativity yield an effective Hill coefficient \(n\) equal to the number of binding sites.

### Autoregulation

When a transcription factor regulates its own gene, the network has a **feedback loop**. Negative autoregulation (the protein represses its own gene) is one of the most abundant network motifs in \(E.\ coli\) and yeast. It accelerates the response to changes in environmental conditions and reduces cell-to-cell variability in protein levels. Positive autoregulation (the protein activates its own gene) can generate bistability: the protein ODE

\[
\frac{dp}{dt} = k_0 + k_1 f_+(p) - \delta p
\]

can have multiple steady states when \(k_1\) is sufficiently large, since the right-hand side is a sigmoidal function of \(p\) that can intersect the linear degradation line \(\delta p\) at three points.

## The Toggle Switch

Gardner, Cantor, and Collins (2000) constructed a synthetic **toggle switch** in \(E.\ coli\) by engineering two mutually repressing transcription factors. Let \(u\) and \(v\) be the concentrations of the two proteins, each repressing the other's gene:

\[
\frac{du}{dt} = \frac{\alpha_1}{1 + v^n} - u,
\]

\[
\frac{dv}{dt} = \frac{\alpha_2}{1 + u^m} - v.
\]

When the cooperativity indices \(n\) and \(m\) and the maximal expression rates \(\alpha_1\) and \(\alpha_2\) are sufficiently large, the nullclines of this system intersect three times: two stable nodes (one with high \(u\)/low \(v\) and one with low \(u\)/high \(v\)) and an unstable saddle separating them. The system thus functions as a bistable memory element that can be flipped between its two states by transient chemical perturbations. This work provided one of the earliest experimental validations of theoretical predictions from dynamical systems analysis of gene circuits.

## The Repressilator and Synthetic Oscillators

Elowitz and Leibler (2000) designed the **repressilator**, a synthetic three-gene network in which three transcription factors mutually repress one another in a ring: gene 1's product represses gene 2, gene 2's product represses gene 3, and gene 3's product represses gene 1. The ODE model (with mRNA dynamics included) is

\[
\frac{dm_i}{dt} = \frac{\alpha}{1 + p_j^n} + \alpha_0 - m_i,
\]

\[
\frac{dp_i}{dt} = \beta (m_i - p_i),
\]

where indices are cycled \(i = 1, 2, 3\) with \(j = i \bmod 3 + 1\). For sufficient repressor cooperativity (\(n \geq 2\)) and a suitable ratio of protein to mRNA decay rates (\(\beta\)), the symmetric steady state (all mRNAs and proteins equal) becomes unstable and the system oscillates, with each gene's expression peaking sequentially. The repressilator provided the first synthetic biological clock, demonstrating that oscillations can arise from the topology of a gene circuit, independent of any dedicated biochemical clock mechanism.

## Feed-Forward Loops and Network Motifs

Systematic analyses of transcription regulatory networks in \(E.\ coli\) and \(S.\ cerevisiae\) have revealed that certain small subgraphs (network motifs) appear far more often than expected by chance. Among the most significant is the **feed-forward loop** (FFL), in which a master regulator \(X\) regulates both a target gene \(Z\) and an intermediate regulator \(Y\), which also regulates \(Z\). Depending on the signs of the regulatory interactions, there are eight distinct FFL types. Two particularly important ones are:

1. **Coherent Type 1 FFL**: Both \(X \to Z\) and \(X \to Y \to Z\) paths are activating. This motif acts as a sign-sensitive delay: \(Z\) is activated only after a sustained (not transient) activation of \(X\), filtering noise.

2. **Incoherent Type 1 FFL**: \(X\) activates both \(Y\) and \(Z\), but \(Y\) represses \(Z\). The resulting pulse-like dynamics in \(Z\) implement an accelerated response to step inputs.

The study of network motifs, pioneered by Alon and colleagues, reveals that evolution has repeatedly selected certain circuit architectures for their functional properties, suggesting a set of recurring computational modules in cellular gene regulation.

---

# Chapter 5: Oscillations and Bifurcations in Cell Biology

## Bifurcation Theory Essentials

A **bifurcation** occurs when a qualitative change in the behaviour of a dynamical system arises as a parameter varies continuously. The most important bifurcations in cell biology involve the creation, destruction, or change in stability of steady states and limit cycles.

The **saddle-node bifurcation** is the generic mechanism for the creation or destruction of steady states. At the bifurcation point, a stable and an unstable equilibrium collide and annihilate. This bifurcation is responsible for the fold points on S-shaped bifurcation diagrams, and therefore for hysteresis and bistability in signalling networks.

The **pitchfork bifurcation** occurs in systems with a symmetry: at the bifurcation a single equilibrium loses stability and two new symmetric equilibria are born. In a supercritical pitchfork the new branches are stable (soft transition); in a subcritical pitchfork they are unstable and coexist with a pair of saddle-node bifurcations.

The **Hopf bifurcation** is the primary mechanism for the emergence of oscillations. At a Hopf bifurcation, a stable equilibrium loses stability and is replaced by a stable limit cycle (supercritical Hopf) or an unstable limit cycle collapses onto a stable equilibrium (subcritical Hopf). The frequency of the nascent oscillation is set by the imaginary part of the critical eigenvalues at the bifurcation point.

<div class="theorem">
<strong>Poincaré-Bendixson Theorem.</strong> In a two-dimensional continuous autonomous ODE system, if a trajectory is bounded and does not approach any equilibrium, it must approach a limit cycle. This theorem, combined with the Bendixson-Dulac criterion (which can rule out limit cycles), provides the primary tools for establishing the existence or non-existence of oscillations in planar systems.
</div>

## Cell-Cycle Models: Novak-Tyson

The eukaryotic **cell cycle** — the sequence of G1, S, G2, and M phases leading to cell division — is controlled by a network of cyclin-dependent kinases (CDKs) and their regulatory partners. Novak and Tyson (1993) developed an influential mathematical model of the budding yeast cell cycle that captures the irreversible, switch-like transitions between cell-cycle phases. The core module involves the mutual antagonism between the mitotic cyclin-CDK complex (Clb2-Cdc28) and its inhibitor (Cdh1/APC complex), together with positive feedback through Cdc20 and other regulators.

A minimal two-variable reduction captures the essential bistability. Let \(y\) denote the concentration of active CDK and \(x\) the concentration of its inhibitor Cdh1. The nullclines of the two-variable system form an S-shaped curve for \(y\) and a monotone decreasing curve for \(x\), intersecting potentially three times. The cell cycle corresponds to a **relaxation oscillation** in which the system alternates between two branches of the S-shaped nullcline, driven by cell growth (which shifts the nullcline). At each transition (G1/S and M/G1) the system undergoes a saddle-node bifurcation, making the transitions irreversible and checkpoint-controlled.

## Calcium Oscillations: Goldbeter IP3 Model

Intracellular **calcium oscillations** are found in nearly every cell type and regulate processes ranging from fertilisation to secretion. A prominent mechanism involves the second messenger inositol trisphosphate (IP3), which triggers calcium release from the endoplasmic reticulum (ER) via IP3-gated calcium channels. Goldbeter, Dupont, and Berridge (1990) formulated a minimal model for IP3-mediated calcium oscillations. Let \(Z = [\text{Ca}^{2+}]_{\text{cyt}}\) and \(Y = [\text{Ca}^{2+}]_{\text{ER}}\):

\[
\frac{dZ}{dt} = v_0 + v_1 \beta - V_2 \frac{Z^n}{K_2^n + Z^n} + V_3 \frac{Z^m}{K_A^m + Z^m} \cdot \frac{Y^p}{K_R^p + Y^p} - k_f Z - kZ,
\]

\[
\frac{dY}{dt} = V_2 \frac{Z^n}{K_2^n + Z^n} - V_3 \frac{Z^m}{K_A^m + Z^m} \cdot \frac{Y^p}{K_R^p + Y^p} - k_f Y.
\]

Here \(v_0 + v_1 \beta\) represents constant calcium influx (with \(\beta\) proportional to IP3), \(V_2\) the ER pump rate, \(V_3\) the IP3-receptor-mediated release rate, and \(k_f\) a leak term. The release term depends cooperatively on both cytosolic calcium (\(Z\), activating) and ER calcium (\(Y\), the store driving force). This **calcium-induced calcium release** (CICR) creates a positive feedback loop. For appropriate \(\beta\) values, the steady state is unstable and the system oscillates, with the oscillation period increasing with decreasing \(\beta\). The model successfully reproduces the observed increase in calcium spike frequency with increasing IP3 (agonist concentration).

---

# Chapter 6: Single Neuron Models

## Conductance-Based Modelling: The Hodgkin-Huxley Equations

The **Hodgkin-Huxley model** (1952) is among the most celebrated achievements of mathematical biology. Working on the giant axon of the squid, Alan Hodgkin and Andrew Huxley elucidated the ionic mechanisms of the action potential and cast them in a precise mathematical form that has guided neuroscience for over seventy years.

The model treats the neuronal membrane as a capacitor in parallel with several conductances. The membrane potential \(V\) satisfies Kirchhoff's current law:

\[
C_m \frac{dV}{dt} = I_{\text{ext}} - I_{\text{Na}} - I_K - I_L,
\]

where \(C_m\) is the membrane capacitance, \(I_{\text{ext}}\) is an applied current, and \(I_{\text{Na}}\), \(I_K\), \(I_L\) are the sodium, potassium, and leak currents, respectively. Each ionic current is modelled as a conductance times a driving force:

\[
I_{\text{Na}} = g_{\text{Na}} m^3 h (V - E_{\text{Na}}),
\]

\[
I_K = g_K n^4 (V - E_K),
\]

\[
I_L = g_L (V - E_L).
\]

Here \(g_{\text{Na}}\), \(g_K\), and \(g_L\) are the maximal conductances, \(E_{\text{Na}}\), \(E_K\), and \(E_L\) are the Nernst reversal potentials, and \(m\), \(h\), \(n\) are **gating variables** taking values in \(\left[0,1\right]\) that represent the fraction of open channel gates.

Each gating variable evolves according to a first-order relaxation equation:

\[
\frac{dx}{dt} = \alpha_x(V)(1-x) - \beta_x(V) x, \quad x \in \{m, h, n\},
\]

which can be rewritten as

\[
\frac{dx}{dt} = \frac{x_\infty(V) - x}{\tau_x(V)},
\]

where \(x_\infty(V) = \alpha_x / (\alpha_x + \beta_x)\) is the steady-state activation (or inactivation) curve and \(\tau_x(V) = 1/(\alpha_x + \beta_x)\) is the voltage-dependent time constant. The empirical rate functions \(\alpha_m(V)\), \(\beta_m(V)\), etc., were fit by Hodgkin and Huxley to voltage-clamp data and have the form of smooth sigmoidal or bell-shaped functions of \(V\).

The complete Hodgkin-Huxley model is thus a four-dimensional ODE system in \((V, m, h, n)\). The mechanism of the action potential in this framework is the following. From the resting potential (approximately \(-65\) mV), a depolarising stimulus opens sodium channels rapidly (large \(\alpha_m\), small \(\tau_m\)), driving \(V\) toward \(E_{\text{Na}} \approx +50\) mV — the rising phase. Sodium inactivation (\(h\) decreasing slowly) and potassium activation (\(n\) increasing) then close Na\(^+\) channels and increase K\(^+\) outflow, repolarising the membrane — the falling phase. The refractory period arises because \(h\) recovers slowly while \(n\) decays, preventing immediate re-firing.

## The FitzHugh-Nagumo Reduction

The Hodgkin-Huxley equations are difficult to analyse directly due to their four-dimensional phase space. FitzHugh (1961) and Nagumo et al. (1962) independently proposed a two-variable caricature that captures the essential excitability dynamics. The **FitzHugh-Nagumo (FHN) model** is:

\[
\frac{dv}{dt} = v - \frac{v^3}{3} - w + I_{\text{ext}},
\]

\[
\frac{dw}{dt} = \varepsilon (v + a - b w),
\]

where \(v\) is a fast variable representing membrane voltage, \(w\) is a slow recovery variable (aggregating \(h\) and \(n\)), \(\varepsilon \ll 1\) enforces the time-scale separation, and \(a\), \(b\) are parameters. The \(v\)-nullcline is a cubic (\(w = v - v^3/3 + I_{\text{ext}}\)) and the \(w\)-nullcline is a line (\(v = bw - a\)).

Phase-plane analysis of the FHN model illuminates the different dynamical regimes. When the nullclines intersect on the middle (unstable) branch of the cubic, the steady state is unstable and the system exhibits repetitive firing (a limit cycle). When they intersect on the left branch, the steady state is stable but the system is **excitable**: a suprathreshold perturbation drives the trajectory on a large excursion through phase space (an action potential) before returning to rest. This is the defining property of excitability: a threshold separates small perturbations, which decay monotonically, from large perturbations, which trigger a full spike.

## Integrate-and-Fire Model

For large networks, the Hodgkin-Huxley equations are computationally demanding. The **leaky integrate-and-fire** (LIF) model reduces the neuron to a single linear ODE for the membrane potential, supplemented by a reset rule:

\[
\tau_m \frac{dV}{dt} = -(V - E_L) + R \, I(t),
\]

with the rule that whenever \(V\) reaches a threshold \(V_\theta\), a spike is registered and \(V\) is reset to \(V_r < V_\theta\). Despite its simplicity, the LIF model correctly predicts the mean firing rate as a function of input current and captures subthreshold integration behaviour. The threshold condition \(V = V_\theta\) introduces the essential nonlinearity, even though the subthreshold dynamics are entirely linear.

## Type I vs Type II Neurons

Neurons differ in how their **firing frequency** depends on injected current near threshold. **Type I neurons** (class I excitability) can fire at arbitrarily low frequencies with sufficient but barely suprathreshold current, exhibiting a continuous f-I curve. Mathematically, this corresponds to the emergence of oscillations through a **saddle-node on invariant circle (SNIC) bifurcation**: at threshold, a stable node and a saddle point collide on a limit cycle, giving birth to a periodic orbit with zero frequency at onset. **Type II neurons** (class II excitability) fire at a minimum non-zero frequency with any suprathreshold stimulus, exhibiting a discontinuous jump in firing rate. This corresponds to a subcritical **Hopf bifurcation** at threshold. The distinction has functional implications: Type I neurons are better suited to encode graded information in their firing rate, while Type II neurons are more prone to synchronisation.

---

# Chapter 7: Neural Network Models

## Wilson-Cowan Equations

Modelling the collective activity of large populations of neurons requires a shift from single-cell to population-level descriptions. The **Wilson-Cowan equations** (1972) describe the dynamics of two interacting populations of excitatory (\(E\)) and inhibitory (\(I\)) neurons in terms of their mean firing rates \(e(t)\) and \(i(t)\):

\[
\tau_E \frac{de}{dt} = -e + (1 - r_E e) \, S_E (w_{EE} e - w_{EI} i + I_E),
\]

\[
\tau_I \frac{di}{dt} = -i + (1 - r_I i) \, S_I (w_{IE} e - w_{II} i + I_I),
\]

where \(w_{EE}\), \(w_{EI}\), \(w_{IE}\), \(w_{II}\) are synaptic weight parameters (excitatory-to-excitatory, etc.), \(S_E\) and \(S_I\) are sigmoidal gain functions, \(I_E\) and \(I_I\) are external inputs, and \(r_E\), \(r_I\) are absolute refractory parameters. The term \((1 - r e)\) accounts for the fraction of non-refractory neurons.

### Mean-Field Analysis

Setting \(r_E = r_I = 0\) (ignoring refractoriness) and taking \(\tau_E = \tau_I = \tau\), the Wilson-Cowan equations reduce to a simpler form amenable to phase-plane analysis. The E and I nullclines can intersect in one, two, or three points depending on parameters. One stable fixed point corresponds to low-activity (quiescent) state, another to high-activity state, and a potential third to an intermediate unstable state. Oscillatory solutions also arise, corresponding to gamma-frequency synchronised activity observed in cortex. The Wilson-Cowan framework has been extended to **neural field theories** in which \(e(x,t)\) and \(i(x,t)\) vary continuously in space, leading to integro-differential equations that support travelling waves and spatially structured activity patterns (bumps).

## Pattern Formation in Neural Fields

A spatial extension of the Wilson-Cowan equations treats neural activity as a field. The Amari model considers a single neural layer with lateral interactions:

\[
\tau \frac{\partial u(x,t)}{\partial t} = -u(x,t) + \int_{-\infty}^{\infty} w(x - x') S(u(x', t)) \, dx' + I(x),
\]

where \(w(y)\) is the synaptic weight kernel (typically a "Mexican hat" function with short-range excitation and long-range inhibition) and \(S\) is a sigmoid gain function. Linear stability analysis around the homogeneous steady state shows that spatially periodic patterns emerge when the Fourier transform of \(w\) is positive and maximal at some non-zero wave number \(k^*\), a condition analogous to the Turing instability discussed in Chapter 8. The resulting **activity bumps** are thought to underlie spatial working memory and head-direction cells.

## Synchrony and the Kuramoto Model

Synchrony — the coordinated, coherent firing of large numbers of neurons — is a prominent feature of neural oscillations and is implicated in cognition, motor control, and pathological states such as epilepsy and Parkinson's disease. The **Kuramoto model** (1975) provides an analytically tractable description of synchrony in a population of \(N\) coupled phase oscillators. Each oscillator \(i\) has a natural frequency \(\omega_i\) drawn from a distribution \(g(\omega)\), and is coupled to all others through a sinusoidal coupling:

\[
\frac{d\theta_i}{dt} = \omega_i + \frac{K}{N} \sum_{j=1}^N \sin(\theta_j - \theta_i),
\]

where \(\theta_i\) is the phase of oscillator \(i\) and \(K > 0\) is the coupling strength. The **order parameter** \(r = |N^{-1} \sum_j e^{i\theta_j}|\) measures the degree of synchrony (\(r = 0\): incoherent, \(r = 1\): fully synchronised). In the thermodynamic limit \(N \to \infty\), Kuramoto showed that the incoherent state (\(r = 0\)) is stable for \(K < K_c = 2/(\pi g(0))\) and that synchrony emerges continuously (supercritical) for \(K > K_c\), with \(r \propto \sqrt{K - K_c}\) near the transition. This second-order phase transition has been extensively validated and extended to model neural synchronisation phenomena.

## Synaptic Dynamics and Short-Term Plasticity

Synapses are not merely fixed conductance elements but dynamic entities that change their efficacy on a range of time scales. **Short-term plasticity** refers to use-dependent changes in synaptic strength lasting from milliseconds to seconds. Two canonical forms are **short-term depression** (STD), in which repeated stimulation depletes a readily releasable pool of neurotransmitter vesicles and temporarily weakens the synapse, and **short-term facilitation** (STF), in which residual calcium from prior spikes increases vesicle release probability.

A standard model due to Tsodyks and Markram (1997) tracks the fraction of available resources \(R\) and the fraction in use \(u\):

\[
\frac{dR}{dt} = \frac{1 - R}{\tau_D} - u R \delta(t - t_k),
\]

\[
\frac{du}{dt} = \frac{U - u}{\tau_F} + U(1 - u) \delta(t - t_k),
\]

where \(t_k\) are spike times, \(U\) is the baseline release probability, \(\tau_D\) is the depression (recovery) time constant, and \(\tau_F\) is the facilitation time constant. At each spike, \(u\) jumps by \(U(1-u)\) (facilitation) and \(R\) decrements by \(uR\) (depression). The released neurotransmitter is proportional to \(u R\) at each spike, and the postsynaptic conductance is driven by this product. Depending on which mechanism dominates (\(\tau_D \gg \tau_F\) or \(\tau_F \gg \tau_D\)), the synapse acts as a depressing or facilitating filter of presynaptic spike trains.

---

# Chapter 8: Stochastic and Spatial Methods

## Chemical Master Equation

The ODE formalism assumes that molecular concentrations are large and that stochastic fluctuations are negligible. Inside living cells, many key regulatory proteins are present in small copy numbers (sometimes fewer than 100 molecules), making **intrinsic noise** a crucial feature of gene expression and signalling. The proper framework for discrete, stochastic chemical kinetics is the **chemical master equation** (CME).

Let the state of the system be described by a vector \(\mathbf{n} = (n_1, n_2, \ldots, n_m)\) of molecular copy numbers, and let \(P(\mathbf{n}, t)\) be the probability that the system is in state \(\mathbf{n}\) at time \(t\). Each reaction channel \(r\) with propensity function \(a_r(\mathbf{n})\) (proportional to the number of distinct reactive molecular pairs in state \(\mathbf{n}\)) changes the state by a stoichiometric vector \(\boldsymbol{\nu}_r\). The CME is

\[
\frac{\partial P(\mathbf{n},t)}{\partial t} = \sum_r \left[ a_r(\mathbf{n} - \boldsymbol{\nu}_r) P(\mathbf{n} - \boldsymbol{\nu}_r, t) - a_r(\mathbf{n}) P(\mathbf{n}, t) \right].
\]

The CME is a system of ordinary differential equations for the probabilities, but the state space is typically enormous (all non-negative integer vectors \(\mathbf{n}\)), rendering direct solution infeasible for most systems. Analytical solutions are available only for simple cases such as linear reaction networks or birth-death processes.

<div class="remark">
<strong>Relationship to the deterministic ODE.</strong> The macroscopic ODE \(d\mathbf{c}/dt = N\mathbf{v}(\mathbf{c})\) can be derived from the CME by taking the thermodynamic limit \(\Omega \to \infty\) (system volume \(\Omega \to \infty\) with concentrations \(\mathbf{c} = \mathbf{n}/\Omega\) held fixed). In this limit fluctuations scale as \(1/\sqrt{\Omega}\) and become negligible. For small \(\Omega\) (i.e., small cellular compartments) the fluctuations are significant and can qualitatively alter system behaviour.
</div>

## Gillespie Algorithm

The **Gillespie algorithm** (1977) provides an exact stochastic simulation method for systems governed by the CME. The key insight is that the waiting time until the next reaction is exponentially distributed with rate \(a_0 = \sum_r a_r(\mathbf{n})\), and the identity of the next reaction is chosen with probability \(a_r / a_0\). The algorithm proceeds as follows:

1. Initialise \(\mathbf{n}\) and \(t = 0\).
2. Compute all propensities \(a_r(\mathbf{n})\) and their sum \(a_0\).
3. Draw two uniform random numbers \(u_1, u_2 \in (0,1)\).
4. Set the time to the next reaction as \(\tau = -\ln(u_1)/a_0\).
5. Select the reaction index \(\mu\) such that \(\sum_{r < \mu} a_r < u_2 a_0 \leq \sum_{r \leq \mu} a_r\).
6. Update \(t \to t + \tau\) and \(\mathbf{n} \to \mathbf{n} + \boldsymbol{\nu}_\mu\).
7. Repeat from step 2.

The Gillespie algorithm generates exact realisations of the stochastic process defined by the CME. It is exact but computationally expensive when many reactions occur in rapid succession. Accelerated methods such as the \(\tau\)-leap algorithm trade some accuracy for speed by allowing multiple reactions to fire in each time step.

## Noise-Induced Phenomena

Stochasticity in gene expression produces **cell-to-cell variability** even in genetically identical populations, a phenomenon measurable by single-cell fluorescence. The variance in protein number \(\sigma_p^2\) can be decomposed into intrinsic noise (arising from the randomness of the gene expression process itself) and extrinsic noise (from fluctuations in upstream regulators). For a simple birth-death process the Fano factor \(\sigma_p^2 / \langle p \rangle = 1\) (Poisson statistics), but transcriptional bursting — in which a gene alternates stochastically between active and inactive states — generates super-Poissonian distributions (\(\sigma_p^2 / \langle p \rangle > 1\)) consistent with experimental single-cell data.

Noise can also induce qualitative phenomena absent in the deterministic limit. **Noise-induced oscillations** occur when a deterministic system is near but below a Hopf bifurcation: stochastic fluctuations drive the system around the stable spiral point, creating apparent periodic behaviour. **Stochastic resonance** is the counterintuitive phenomenon by which adding an optimal amount of noise to a subthreshold signal enhances the detection of that signal. In cell biology, stochastic resonance has been proposed to play a role in signal detection in sensory hair cells and intracellular Ca\(^{2+}\) signalling.

## Reaction-Diffusion Equations

When chemical species are not uniformly distributed in space, one must account for **diffusion** in addition to reactions. For a set of species with concentrations \(\mathbf{c}(x,t)\) in a spatial domain \(\Omega \subseteq \mathbb{R}^d\), the **reaction-diffusion** (RD) equations are:

\[
\frac{\partial c_i}{\partial t} = D_i \nabla^2 c_i + f_i(\mathbf{c}), \quad i = 1, \ldots, m,
\]

where \(D_i\) is the diffusion coefficient of species \(i\) and \(f_i\) encodes the reaction kinetics. The coupling between diffusion and nonlinear reactions can generate spatially non-uniform steady states (Turing patterns), travelling waves, and spiral waves.

## Turing Instability in Cellular Context

Alan Turing's seminal 1952 paper "The Chemical Basis of Morphogenesis" proposed that spatial patterns in biological systems could arise through a **diffusion-driven instability**: a homogeneous steady state that is stable in the absence of diffusion becomes unstable when an activator species diffuses much more slowly than an inhibitor. The canonical analysis considers two species, an activator \(u\) and an inhibitor \(v\), with linearised kinetics:

\[
\frac{\partial u}{\partial t} = f_u u + f_v v + D_u \nabla^2 u,
\]

\[
\frac{\partial v}{\partial t} = g_u u + g_v v + D_v \nabla^2 v,
\]

where \(f_u = \partial f / \partial u|^*\) etc. are partial derivatives evaluated at the homogeneous steady state. Writing perturbations as \(e^{\sigma t} e^{ik \cdot x}\) and seeking conditions under which \(\text{Re}(\sigma) > 0\) for some wave number \(k\), one finds the Turing conditions:

\[
f_u + g_v < 0, \quad f_u g_v - f_v g_u > 0,
\]

\[
D_v f_u + D_u g_v > 2\sqrt{D_u D_v (f_u g_v - f_v g_u)}.
\]

The first two conditions ensure stability in the absence of diffusion (stable homogeneous state), while the third condition requires \(D_v > D_u\) (the inhibitor must diffuse faster than the activator) and specifies the minimum inhibitor-to-activator diffusivity ratio required for instability. The critical wave number \(k_c^2 = \sqrt{(f_u g_v - f_v g_u)/(D_u D_v)}\) determines the spatial scale of the emerging pattern.

In the cellular context, Turing instability has been invoked to explain skin pigmentation patterns, digit formation in limb development, and, most notably, intracellular polarity establishment.

## Cell Polarisation Models

**Cell polarisation** — the breaking of spatial symmetry to establish a front and back, or a single patch of activity — is essential for directed cell migration, asymmetric cell division, and morphogenesis. A minimal model for yeast bud-site selection involves the Rho GTPase Cdc42, which cycles between an active membrane-bound form (\(u\)) and an inactive cytosolic form (\(v\)). Positive feedback (active Cdc42 recruits its own guanine nucleotide exchange factor) combined with a slowly diffusing active form and a rapidly diffusing inactive form creates the conditions for a Turing instability.

A two-component model by Mori, Jilkine, and Edelstein-Keshet (2008) for the **wave-pinning** mechanism of cell polarisation is:

\[
\frac{\partial u}{\partial t} = D_u \frac{\partial^2 u}{\partial x^2} + f(u,v),
\]

\[
\frac{\partial v}{\partial t} = D_v \frac{\partial^2 v}{\partial x^2} - f(u,v),
\]

with \(f(u,v) = \left( k_0 + \gamma \frac{u^2}{K^2 + u^2} \right) v - \delta u\) and \(D_v \gg D_u\). The conservation law \(\int (u+v) \, dx = \text{const}\) ensures that activation at one end depletes the pool of cytosolic Cdc42 globally, thereby preventing activation elsewhere. A wave of active Cdc42 is initiated and then **pinned** in place by the global depletion mechanism, establishing a stable polarity axis. This wave-pinning mechanism does not require a Turing instability per se but instead relies on bistability in the local kinetics of \(f(u,v)\): for appropriate total protein amounts, the system supports a stationary front separating a high-\(u\) region from a low-\(u\) region.

<div class="example">
<strong>Scaling analysis for Turing instability.</strong> Consider a cell of length \(L = 10\, \mu\text{m}\). For a Turing pattern to fit within the cell, the critical wavelength \(\lambda_c = 2\pi / k_c\) must be comparable to \(L\). With typical membrane-bound diffusion coefficients \(D_u \sim 0.1 \, \mu\text{m}^2/\text{s}\) and cytosolic \(D_v \sim 10 \, \mu\text{m}^2/\text{s}\), the diffusivity ratio is \(D_v/D_u = 100\), comfortably satisfying the Turing condition. Setting \(k_c^2 L^2 \sim \pi^2\) and using \(k_c^2 = \sqrt{f_u g_v - f_v g_u} / \sqrt{D_u D_v}\) constrains the kinetic parameters required for polarisation on cellular length scales.
</div>

---

# Appendix: Mathematical Tools and Methods

## Phase-Plane Analysis

**Phase-plane analysis** is the primary qualitative tool for two-dimensional ODE systems. For \(\dot{x} = f(x,y)\), \(\dot{y} = g(x,y)\), the **nullclines** are the curves \(f = 0\) (\(x\)-nullcline) and \(g = 0\) (\(y\)-nullcline). Their intersections are the equilibrium points. The direction field on each nullcline is vertical or horizontal, respectively, and in each region between nullclines the signs of \(\dot{x}\) and \(\dot{y}\) are fixed, enabling one to sketch the qualitative behaviour of trajectories.

Stability of an equilibrium \((x^*, y^*)\) is determined by the Jacobian matrix

\[
J = \begin{pmatrix} f_x & f_y \\ g_x & g_y \end{pmatrix} \bigg|_{(x^*,y^*)}
\]

and its eigenvalues \(\lambda_{1,2} = \frac{1}{2}\left[ \text{tr}(J) \pm \sqrt{\text{tr}(J)^2 - 4\det(J)} \right]\). The equilibrium is a **stable node** or **spiral** if both eigenvalues have negative real part, an **unstable node** or **spiral** if both have positive real part, and a **saddle** if the eigenvalues are real with opposite signs.

## Linearisation and Stability

For an \(n\)-dimensional ODE system \(\dot{\mathbf{x}} = \mathbf{F}(\mathbf{x})\) with equilibrium \(\mathbf{x}^*\), linearising around the equilibrium gives \(\dot{\boldsymbol{\xi}} = J \boldsymbol{\xi}\) where \(\boldsymbol{\xi} = \mathbf{x} - \mathbf{x}^*\) and \(J = D\mathbf{F}|_{\mathbf{x}^*}\). By the **Hartman-Grobman theorem**, the local qualitative behaviour of the nonlinear system near a hyperbolic equilibrium (no eigenvalues with zero real part) is topologically equivalent to that of the linearised system. The equilibrium is **linearly stable** if all eigenvalues of \(J\) have strictly negative real parts, which is equivalent (by the Routh-Hurwitz criterion for polynomials of degree \(n\)) to sign conditions on the coefficients of the characteristic polynomial.

## Singular Perturbation and Multiple Time Scales

Many biophysical systems contain variables evolving on well-separated time scales, a feature exploited systematically by **singular perturbation theory**. Consider a system with fast variable \(x\) and slow variable \(y\):

\[
\varepsilon \frac{dx}{dt} = f(x, y), \qquad \frac{dy}{dt} = g(x, y),
\]

with \(0 < \varepsilon \ll 1\). The **slow manifold** is the curve \(f(x,y) = 0\) in the \((x,y)\) plane, which the fast variable reaches rapidly. On the slow manifold \(x = h(y)\) satisfies \(f(h(y), y) = 0\), and the reduced (outer) dynamics is \(\dot{y} = g(h(y), y)\). This reduction is valid on the stable branches of the slow manifold (where \(\partial f / \partial x < 0\)) and breaks down near fold points where \(\partial f / \partial x = 0\), giving rise to the rapid jumps characteristic of relaxation oscillations (as in the van der Pol oscillator and the cell-cycle models of Chapter 5). The FitzHugh-Nagumo model is itself a singular perturbation system with \(\varepsilon \ll 1\) controlling the ratio of recovery to excitation rates.

## Numerical Methods in Cell Biology

Analytical results provide indispensable qualitative insight but are typically available only for low-dimensional or specially structured systems. Quantitative predictions for realistic models require **numerical integration** of ODE and PDE systems. Standard methods include explicit Runge-Kutta schemes (RK4 for non-stiff problems), implicit or semi-implicit methods (VODE, LSODA, or Radau for stiff systems arising from disparate time scales in biochemical networks), and operator-splitting methods for reaction-diffusion PDEs.

Bifurcation diagrams — tracing equilibria and periodic orbits as parameters vary — are constructed using **numerical continuation** software such as AUTO or XPPAUT. These tools compute solution branches, detect bifurcation points, and switch between branches, enabling systematic exploration of parameter space for ODE models of gene circuits, signalling pathways, and neural networks.

---

<div class="remark">
<strong>A Note on Model Complexity and Biological Realism.</strong> Throughout these notes, models have been presented at varying levels of complexity, from the two-variable Sel'kov model to the four-dimensional Hodgkin-Huxley equations to genome-scale metabolic networks. An important principle in mathematical cell biology is that the appropriate level of complexity depends on the question being asked. Highly simplified models reveal the minimal ingredients needed for a qualitative phenomenon (bistability, oscillations, pattern formation) and yield analytical insight. Detailed mechanistic models incorporate more molecular components and are required for quantitative predictions and comparison with specific experimental data. The interplay between these two modelling philosophies — reductionist analysis and mechanistic specificity — is at the heart of the discipline, and the ability to move fluidly between them is the hallmark of a mathematical cell biologist.
</div>
