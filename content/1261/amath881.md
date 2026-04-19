---
title: "AMATH 881: Introduction to Mathematical Oncology"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly accessible sources:

- Wodarz, D. & Komarova, N. L. *Dynamics of Cancer: Mathematical Foundations of Oncology*. World Scientific, 2014.
- Murray, J. D. *Mathematical Biology I: An Introduction* and *Mathematical Biology II: Spatial Models and Biomedical Applications*. Springer, 3rd ed.
- Nowak, M. A. *Evolutionary Dynamics: Exploring the Equations of Life*. Harvard University Press, 2006.
- Anderson, A. R. A. & Chaplain, M. A. J. "Continuous and discrete mathematical models of tumor-induced angiogenesis." *Bulletin of Mathematical Biology* 60:857–900 (1998).
- Gatenby, R. A. & Gillies, R. J. "Why do cancers have high aerobic glycolysis?" *Nature Reviews Cancer* 4:891–899 (2004).
- Cristini, V. & Lowengrub, J. *Multiscale Modeling of Cancer: An Integrated Experimental and Mathematical Modeling Approach*. Cambridge University Press, 2010.
- Altrock, P. M., Liu, L. L. & Michor, F. "The mathematics of cancer: integrating quantitative models." *Nature Reviews Cancer* 15:730–745 (2015).

---

# Chapter 1: Introduction to Cancer Biology

## 1.1 What Is Cancer?

Cancer is not a single disease but a vast family of pathological conditions united by one defining feature: the uncontrolled proliferation of cells that have escaped the regulatory mechanisms that govern normal tissue homeostasis. In healthy tissue, cell division is tightly orchestrated by a network of molecular signals, feedback loops, and checkpoints that ensure the population of any given cell type is appropriate to the needs of the organism. Oncogenesis — the process by which a normal cell transforms into a cancer cell — represents a progressive dismantling of these controls, typically through the accumulation of somatic mutations over many years or decades.

Mathematical oncology approaches cancer as a dynamical system amenable to quantitative analysis. Rather than replacing molecular or clinical insight, mathematical models provide a formal language for integrating heterogeneous data, generating testable hypotheses, and exploring the consequences of proposed mechanisms more rapidly and systematically than experiment alone permits. The field draws on ordinary and partial differential equations, stochastic processes, evolutionary game theory, and computational simulation, often in combination.

## 1.2 Hallmarks of Cancer

The conceptual foundation for most mathematical work in oncology is the hallmarks framework articulated by Hanahan and Weinberg. Their landmark synthesis identified a set of acquired biological capabilities that are common to the vast majority of human cancers, regardless of the tissue of origin or the specific molecular pathway disrupted.

The six original hallmarks are: sustaining proliferative signaling, evading growth suppressors, resisting cell death, enabling replicative immortality, inducing angiogenesis, and activating invasion and metastasis. Two additional hallmarks were later added: reprogramming of energy metabolism (the Warburg effect) and evading immune destruction. Alongside these capabilities, two enabling characteristics — genomic instability and tumor-promoting inflammation — facilitate their acquisition.

For a mathematical modeler, the hallmarks serve as a map of the biological processes that deserve mechanistic treatment. Each hallmark corresponds to one or more modules that can be incorporated into a model: a term for autocrine growth-factor signaling, a switching function representing the loss of a tumor suppressor, a phenomenological death rate that diminishes as apoptotic pathways are disabled, and so on.

## 1.3 Oncogenes and Tumor Suppressors

At the molecular level, cancer-promoting mutations fall into two broad categories. **Proto-oncogenes** are genes that in their normal state promote cell division in response to appropriate mitogenic signals. A mutation that renders such a gene constitutively active — so that it signals for proliferation regardless of external cues — converts it into an **oncogene**. Because a single mutant allele suffices to confer a growth advantage, oncogenic mutations are considered dominant. Classic examples include the *RAS* family of GTPases, which are mutated in roughly one-third of all human cancers, and *MYC*, which drives transcription of a broad proliferative program.

**Tumor suppressor genes**, by contrast, normally restrain cell division, promote apoptosis, or monitor genomic integrity. Their inactivation requires loss of both alleles (the "two-hit" model of Knudson), making these mutations functionally recessive at the cellular level. The retinoblastoma protein (Rb) and TP53 are the paradigmatic examples. Rb, as we discuss in Chapter 7, acts as a gatekeeper of the restriction point in the cell cycle, while p53 integrates stress signals and can trigger either cell-cycle arrest or apoptosis. The mathematical modeling of these networks leads naturally to bistability theory and the study of toggle switches.

## 1.4 The Cell Cycle and Its Checkpoints

The **cell cycle** is the ordered sequence of events by which a cell duplicates its contents and divides into two daughter cells. It comprises four phases: G1 (first gap), S (DNA synthesis), G2 (second gap), and M (mitosis). Progression through the cycle is driven by **cyclin-dependent kinases** (CDKs), which associate with regulatory subunits called cyclins that oscillate in concentration across the cell cycle. These kinases phosphorylate key substrates — most importantly Rb — to license progression past critical checkpoints.

Three major checkpoints serve as quality-control nodes. The **G1/S checkpoint** (restriction point) ensures that the cell has reached an appropriate size and that the extracellular environment is conducive to division before committing to replication. The **G2/M checkpoint** verifies that DNA synthesis has been completed without error. The **spindle assembly checkpoint** at metaphase confirms that all chromosomes are correctly attached to the mitotic spindle before sister chromatids are separated. Each checkpoint is mediated by a network of proteins that can detect damage or incompletion and activate inhibitory signals — often involving p53 — to halt progression.

From the perspective of ODE modeling, the cell cycle can be represented as a system of coupled biochemical reactions. A minimal model might track the concentrations of Cyclin B, CDK1, and their complex, with positive feedback producing switch-like transitions between G2 and M phase. More elaborate models incorporate the full cyclin–CDK–CKI (cyclin-dependent kinase inhibitor) network and can reproduce the timing of each phase under varying nutrient and growth-factor conditions.

---

# Chapter 2: Genetic Instability and the Evolutionary Dynamics of Cancer

## 2.1 Cancer as an Evolutionary Process

The transformation of a normal cell into a malignant one is not a single catastrophic event but an evolutionary process operating on somatic cells within the body. Mutations confer heritable phenotypic changes; those changes that increase the net rate of cell division or reduce the rate of death are selectively advantageous in the microenvironmental context of the developing tumor. Over many cell generations — spanning perhaps decades in a human — successive waves of clonal expansion interspersed with diversification drive the progressive acquisition of the hallmarks described in Chapter 1.

This evolutionary perspective is the cornerstone of the mathematical treatment of carcinogenesis. We model the cell population as undergoing a Darwinian process in a finite, structured environment. The key questions become: how many mutations are required for full malignancy? How long does the process take, and how does that duration depend on mutation rates, population sizes, and selective advantages? What does the distribution of clone sizes look like at diagnosis, and what does it imply for treatment?

## 2.2 The Moran Process

The simplest stochastic model of selection in a finite population is the **Moran process**, due to Patrick Alfred Pierce Moran. Consider a population of exactly \(N\) cells, each cell being either of type A (normal) or type B (mutant with relative fitness \(r > 1\)). At each step, one cell is chosen for reproduction proportional to its fitness, and one cell is chosen uniformly at random for death, keeping the total population size constant. This birth–death process on the state space \(\{0, 1, \ldots, N\}\) is a finite Markov chain, with 0 and \(N\) as absorbing states.

The probability that a single mutant of type B, introduced into a population of \(N-1\) wild-type cells, eventually **fixes** (i.e., reaches state \(N\)) is given by the exact formula:

\[
\rho = \frac{1 - r^{-1}}{1 - r^{-N}}.
\]

For \(r = 1\) (neutral drift), this reduces to \(\rho = 1/N\), which is simply the initial frequency of the mutant. For \(r > 1\), fixation probability exceeds the neutral value, while for \(r < 1\) (deleterious mutation) it is less. In the large-\(N\) limit with \(r > 1\), the fixation probability approaches \(1 - r^{-1}\), which is a positive constant independent of population size. This result, derived by Nowak, has profound implications: a mutant with even a small selective advantage has a non-negligible probability of sweeping to fixation in a large population.

<div class="definition">
<strong>Fixation Probability (Moran Process).</strong> In a Moran process with population size <em>N</em> and relative fitness <em>r</em> of the mutant type, the probability that a single mutant allele ultimately fixes in the population is

\[
\rho = \frac{1 - r^{-1}}{1 - r^{-N}}.
\]

For neutral drift (<em>r</em> = 1), \(\rho = 1/N\).
</div>

## 2.3 Multi-Step Carcinogenesis

Most carcinomas require not one but several successive mutations to achieve full malignancy. The classic colorectal cancer progression, elucidated by Vogelstein and colleagues, involves sequential mutations in *APC*, *KRAS*, *SMAD4*, and *TP53*, with each step conferring a growth advantage or removing a suppressive constraint. Mathematical models of multi-step carcinogenesis formalize this notion.

Let \(u\) denote the per-base-pair mutation rate per cell division, and suppose that \(k\) specific mutations are required for malignancy. If cells are progressing through a hierarchy of types \(C_0, C_1, \ldots, C_k\) where \(C_k\) is the malignant phenotype, the rate at which \(C_k\) cells are first produced depends on both the rate of mutation at each step and the probability that intermediate clones survive and expand before supplying the next mutation.

For a two-hit model (relevant to tumor suppressors requiring biallelic inactivation), with population size \(N\), cell division rate \(a\), mutation rate \(u\), and neutral intermediate phenotype, the expected waiting time for the first doubly-mutant cell to appear is approximately:

\[
T \approx \frac{1}{N a u^2 + \sqrt{N a u}},
\]

where the two terms capture the direct two-hit path (simultaneous mutations in one lineage) and the path through an intermediate clone that first expands before acquiring the second hit. This formula illustrates the powerful role of population size: larger compartments accumulate mutations faster, explaining why organs with high cell-turnover rates (colon, bone marrow) are disproportionately affected by cancer.

## 2.4 The Luria–Delbrück Experiment and Mutation Before Selection

A critical conceptual question in carcinogenesis is whether mutations arise randomly and are subsequently selected, or whether they arise in directed response to selective pressure. The **Luria–Delbrück experiment** (1943), originally designed to resolve the analogous question in bacteriology, provides a statistical framework that is directly applicable to cancer biology.

In the random-mutation model, mutations arise at a constant per-division rate \(u\) and are present in cells before the selective environment changes. Because some mutants arise early in the growth of a clone (when the clone is small and has not yet divided many times), those early mutants will have had more time to proliferate and will thus give rise to large families — **jackpots** in the distribution of mutant clone sizes. The distribution of the number of mutant cells \(m\) at the time of sampling therefore has a very heavy right tail (approximately a power-law for large \(m\)), and the variance far exceeds the mean.

In the directed-mutation model, by contrast, mutations arise in response to selection after the environment changes. In this case, each culture flask independently generates Poisson-distributed mutants, so the variance equals the mean — a simple Poisson distribution.

The Luria–Delbrück distribution for the number of mutant colonies has the form:

\[
P(m = k) \approx \frac{N_T u}{k(k+1)} \quad \text{for large } k,
\]

where \(N_T\) is the final total population size. The power-law tail \(\sim 1/k^2\) is the hallmark of pre-existing, randomly arising mutation. Experimental data from cancer cells and their response to drugs like chemotherapy and targeted agents consistently show Luria–Delbrück-type variance, supporting the random-mutation model and implying that resistant clones pre-exist therapy rather than arising in response to it. This has profound implications for treatment scheduling and combination therapy.

---

# Chapter 3: Angiogenesis — Mathematical Models of Vascular Network Formation

## 3.1 Biological Overview of Tumor Angiogenesis

A solid tumor growing beyond approximately \(1\text{–}2\) mm in diameter faces a fundamental physical constraint: diffusion alone cannot supply sufficient oxygen and nutrients to its interior. This constraint is overcome by **tumor-induced angiogenesis**, the process by which the tumor co-opts and extends the host vascular network to supply its own metabolic needs. The triggering event is the secretion of pro-angiogenic factors, most prominently **vascular endothelial growth factor (VEGF)**, when hypoxic tumor cells sense low oxygen tension. VEGF diffuses into the surrounding stroma, where it promotes the proliferation, migration, and tube-formation of **endothelial cells** (ECs) that line existing blood vessels.

The resulting tumor vasculature is structurally abnormal: leaky, tortuous, and unevenly distributed. This abnormality has direct therapeutic consequences: poor vascular coverage creates hypoxic and acidic microenvironments that promote genetic instability and treatment resistance, while high interstitial fluid pressure (see Chapter 4) impedes drug delivery. Understanding and controlling angiogenesis is therefore both a scientific and clinical imperative.

## 3.2 The Anderson–Chaplain Continuous Model

Anderson and Chaplain (1998) developed a landmark mathematical framework for tumor-induced angiogenesis that includes both continuous (PDE) and discrete (cellular automaton) formulations. We begin with the continuous model.

Let \(n(\mathbf{x}, t)\) denote the EC density, \(f(\mathbf{x}, t)\) the concentration of fibronectin (an extracellular matrix component that acts as a haptotactic cue), and \(c(\mathbf{x}, t)\) the VEGF (tumor angiogenesis factor, TAF) concentration. The governing equations in non-dimensional form are:

\[
\frac{\partial n}{\partial t} = D_n \nabla^2 n - \nabla \cdot \left( \chi_c(c) n \nabla c \right) - \nabla \cdot \left( \chi_f n \nabla f \right),
\]

\[
\frac{\partial f}{\partial t} = \beta n - \gamma n f,
\]

\[
\frac{\partial c}{\partial t} = D_c \nabla^2 c - \lambda n c.
\]

The first equation governs EC migration as a combination of random diffusion (with coefficient \(D_n\)), chemotaxis toward the VEGF gradient (with chemotactic sensitivity \(\chi_c(c)\)), and haptotaxis toward fibronectin gradients (with sensitivity \(\chi_f\)). The chemotactic sensitivity is often modeled as a receptor-kinetic saturation function:

\[
\chi_c(c) = \frac{\chi_0}{1 + \alpha c},
\]

which accounts for receptor saturation at high VEGF concentrations. The fibronectin equation captures production by ECs at rate \(\beta\) and degradation mediated by ECs at rate \(\gamma\). The VEGF equation describes diffusion and uptake by ECs at rate \(\lambda\), with VEGF maintained at a source boundary representing the tumor surface.

<div class="definition">
<strong>Chemotaxis and Haptotaxis.</strong> <em>Chemotaxis</em> is directed cell migration along a gradient of a soluble chemical signal. <em>Haptotaxis</em> is directed migration along a gradient of a cell-substrate adhesion molecule, such as fibronectin, that is bound to the extracellular matrix. Both enter the continuum model as advective flux terms proportional to the gradient of the respective field.
</div>

Numerical solutions of the continuous model on a two-dimensional domain with a tumor at one boundary and a parent vessel at the opposite boundary reproduce the key qualitative features of angiogenesis: ECs migrate in a wave from the parent vessel toward the tumor, with the density profile sharpening and steepening over time. The inclusion of haptotaxis generates a more irregular, brush-like front compared to pure chemotaxis, consistent with experimental observations.

## 3.3 The Anderson–Chaplain Discrete Model

A significant limitation of the continuous description is that it cannot capture the discrete capillary network structure — the individual sprout tips, branch points, and anastomoses (loop formation when two tips merge) that characterize the tumor vasculature. Anderson and Chaplain addressed this by developing a discrete analogue in which individual endothelial cell sprout tips execute a biased random walk on a lattice.

The transition probabilities for a sprout tip to move from grid site \((i,j)\) to one of its four neighbors are derived directly from the continuous PDE by discretizing the fluxes. For the upward neighbor \((i, j+1)\), the probability is:

\[
P_\uparrow = k_\uparrow = D_n k_0 + \frac{1}{2}\chi_c(c) \frac{\partial c}{\partial y} + \frac{1}{2}\chi_f \frac{\partial f}{\partial y},
\]

where \(k_0\) is related to the discrete diffusion coefficient and the gradient is approximated by finite differences. The probability of remaining in place is \(1 - \sum_{\text{neighbors}} P_{\text{neighbor}}\). After each migration step, VEGF and fibronectin concentrations are updated by solving the diffusion equations on the lattice.

<div class="example">
<strong>Sprout Branching and Anastomosis.</strong> In the discrete model, new sprout tips are created at existing tips with a probability proportional to the local VEGF concentration, mimicking tip-cell division. When a migrating tip encounters a grid site already occupied by a capillary, anastomosis occurs and the tip is absorbed into the existing vessel. This rule generates the characteristic looping topology of the tumor vasculature and allows computation of quantities like blood vessel density and average loop length that can be compared to experimental histology.
</div>

## 3.4 VEGF Diffusion and Gradient Formation

Understanding the spatial distribution of VEGF is essential for predicting the geometry of the vascular response. In the steady-state limit, the VEGF equation with production in the tumor region \(\Omega_T\) and linear degradation in the stroma reduces to:

\[
D_c \nabla^2 c - \delta c = -S(\mathbf{x}), \quad \mathbf{x} \in \Omega \setminus \Omega_T,
\]

with appropriate boundary conditions at the tumor surface and far field. In one dimension with the tumor as a point source at \(x = 0\), this gives the exponential profile \(c(x) = c_0 e^{-x/\ell}\) where \(\ell = \sqrt{D_c/\delta}\) is the characteristic VEGF diffusion length. Typical values \(D_c \sim 10^{-7} \text{ cm}^2/\text{s}\) and \(\delta \sim 10^{-3} \text{ s}^{-1}\) give \(\ell \sim 300 \, \mu\text{m}\), consistent with the observed range of angiogenic activation.

---

# Chapter 4: Interstitial Fluid Pressure and Drug Delivery

## 4.1 The Physical Microenvironment of Tumors

The architectural abnormalities of tumor vasculature described in Chapter 3 generate a characteristic physical microenvironment that profoundly affects treatment. Tumor blood vessels are hyperpermeable, leaking plasma proteins and fluid into the interstitium at rates far exceeding normal tissue. Because lymphatic vessels — the normal drainage pathway — are largely absent or compressed in the tumor interior, the leaked fluid accumulates and elevates the **interstitial fluid pressure (IFP)**. While normal tissue has IFP of approximately −3 to 0 mmHg, solid tumors often exhibit IFP of 10–40 mmHg, with some measurements exceeding 90 mmHg. This elevated pressure opposes the convective transport of macromolecular drugs into the tumor, creating a therapeutic barrier.

## 4.2 Darcy's Law and Interstitial Flow

The flow of interstitial fluid through the porous extracellular matrix of tumor tissue is governed by **Darcy's law**, which relates the flux of fluid to the pressure gradient:

\[
\mathbf{v} = -\frac{\kappa}{\mu} \nabla P,
\]

where \(\mathbf{v}\) is the Darcy velocity (volume flux per unit area), \(\kappa\) is the hydraulic conductivity of the tissue (permeability), \(\mu\) is the fluid viscosity, and \(P\) is the interstitial fluid pressure. Combined with mass conservation \(\nabla \cdot \mathbf{v} = Q_v - Q_l\) — where \(Q_v\) is the transcapillary filtration rate and \(Q_l\) is the lymphatic absorption rate — one obtains a diffusion equation for pressure:

\[
\nabla \cdot \left(\frac{\kappa}{\mu} \nabla P \right) = Q_v - Q_l.
\]

The transcapillary filtration rate is described by Starling's hypothesis:

\[
Q_v = L_p S_v \left[ (P_v - P) - \sigma (\pi_v - \pi_i) \right],
\]

where \(L_p\) is the hydraulic conductivity of the vessel wall, \(S_v\) is the surface area of vessels per unit volume, \(P_v\) is the intravascular pressure, \(\sigma\) is the reflection coefficient for oncotic pressure, and \(\pi_v, \pi_i\) are the oncotic pressures of plasma and interstitium respectively.

<div class="theorem">
<strong>Steady-State IFP Profile.</strong> In the tumor interior, where lymphatic drainage is absent (\(Q_l = 0\)) and the vascular pressure \(P_v\) is approximately uniform, the steady-state IFP satisfies

\[
\nabla^2 P = \frac{L_p S_v \mu}{\kappa} (P - P_v + \sigma \Delta\pi).
\]

The solution inside a spherical tumor of radius <em>R</em> takes the form \(P(r) = P_{\text{eq}} - A \sinh(\alpha r)/r\), where \(\alpha^2 = L_p S_v \mu / \kappa\) and the boundary condition at <em>r = R</em> matches the peritumoral pressure. This profile is elevated and nearly uniform throughout most of the tumor interior, with a sharp drop near the tumor margin.
</div>

## 4.3 Drug Transport and the Role of IFP

The flux of a drug molecule through tumor tissue has two components: diffusion driven by the concentration gradient, and convection driven by the fluid velocity field. The total flux is:

\[
\mathbf{J} = -D \nabla c_d + \mathbf{v} c_d,
\]

leading to the transport equation:

\[
\frac{\partial c_d}{\partial t} + \nabla \cdot \left( \mathbf{v} c_d \right) = D \nabla^2 c_d + R(c_d),
\]

where \(R\) accounts for binding, internalization, or degradation of the drug. The key insight is that in the tumor interior, where IFP is elevated and nearly uniform, the pressure gradient is essentially zero and therefore the convective velocity \(\mathbf{v} \approx 0\). Drug transport in this region must rely entirely on diffusion, which is slow for large macromolecules like antibodies.

At the tumor periphery, the sharp outward pressure gradient drives an outward fluid flow away from the tumor, which actively opposes the inward convective delivery of drug from the circulating blood. This combination — diffusion-limited interior transport and convection-opposed peripheral transport — explains the experimentally observed heterogeneous and often insufficient drug distribution in solid tumors.

## 4.4 Vascular Normalization

A counterintuitive but now well-established concept in oncology is **vascular normalization**: the idea that judiciously timed anti-angiogenic therapy (e.g., anti-VEGF) can, rather than simply destroying tumor vasculature, transiently normalize it — making it less leaky, more regularly distributed, and better perfused. During this normalization window, IFP decreases, oxygenation improves, and drug delivery is enhanced. Mathematical models incorporating the Starling equations alongside vessel maturation kinetics predict that the normalization window is narrow (days to weeks) and depends critically on the dose and schedule of the anti-angiogenic agent.

---

# Chapter 5: Cancer Cell Metabolism and the Warburg Effect

## 5.1 Normal versus Cancer Cell Metabolism

Normal mammalian cells generate ATP primarily through oxidative phosphorylation: pyruvate produced by glycolysis enters the mitochondria, is oxidized in the Krebs cycle, and drives the electron transport chain, yielding approximately 36 ATP per glucose molecule. Under hypoxic conditions, cells switch to anaerobic glycolysis, converting pyruvate to lactate and gaining only 2 ATP per glucose but avoiding the oxygen requirement.

In 1924, Otto Warburg made the remarkable observation that tumor cells preferentially use glycolysis even in the presence of abundant oxygen — a phenomenon now called the **Warburg effect** or aerobic glycolysis. Cancer cells convert glucose to lactate at high rates regardless of oxygen availability, yielding far less ATP per glucose than oxidative phosphorylation. This appears metabolically wasteful, and for decades its significance was debated.

## 5.2 Gatenby–Gillies Hypothesis: Acid-Mediated Invasion

Gatenby and Gillies (2004) proposed an influential evolutionary explanation for the Warburg effect. Their hypothesis begins with the observation that the high glycolytic flux of cancer cells produces large quantities of lactic acid and \(\text{CO}_2\), acidifying the tumor microenvironment to pH values of 6.5–6.8 (compared to the physiological pH of 7.2–7.4 in normal interstitium). While acid is toxic to most normal cells, which have not been selected for acid resistance, cancer cells that have acquired acid-tolerant adaptations can exploit the acidic gradient to invade normal tissue.

In this framework, the Warburg effect is not a metabolic defect but an evolved strategy for invasion: cancer cells deliberately acidify their microenvironment, killing normal cells at the advancing margin of the tumor and clearing the way for further invasion. This hypothesis — acid-mediated invasion — is formalized in a series of reaction–diffusion models.

## 5.3 Mathematical Model of pH and Oxygen Distribution

Let \(G(\mathbf{x}, t)\) denote glucose concentration, \(Q(\mathbf{x}, t)\) oxygen partial pressure, \(L(\mathbf{x}, t)\) lactate concentration (a proxy for \(\text{H}^+\) ions), and \(N(\mathbf{x}, t)\) the density of normal cells, \(T(\mathbf{x}, t)\) the density of tumor cells. A prototypical system following the approach of Gatenby and colleagues is:

\[
\frac{\partial G}{\partial t} = D_G \nabla^2 G - \rho_N N G - \rho_T T G,
\]

\[
\frac{\partial Q}{\partial t} = D_Q \nabla^2 Q - \alpha_N N Q - \alpha_T T Q,
\]

\[
\frac{\partial L}{\partial t} = D_L \nabla^2 L + \phi_T T G - \delta_L L,
\]

\[
\frac{\partial N}{\partial t} = r_N N \left(1 - \frac{N + T}{K}\right) - d_N(L) N,
\]

\[
\frac{\partial T}{\partial t} = r_T T \left(1 - \frac{N + T}{K}\right) + d_T(L) T,
\]

where the death rate of normal cells \(d_N(L)\) increases with lactate (proxy for acidity), while the growth of tumor cells \(d_T(L)\) is enhanced at low pH. The glucose and oxygen equations include diffusion from blood vessels plus uptake terms. The normal cell death term represents acid-mediated cell killing.

Traveling wave analysis of this system predicts the speed of the tumor invasion front as a function of the glycolytic rate \(\phi_T\). Increasing \(\phi_T\) increases lactate production, steepens the acid gradient at the tumor boundary, and accelerates invasion — consistent with the observation that highly glycolytic tumors are more aggressive.

<div class="remark">
The pH-pO2 coupled model illustrates a recurring theme in mathematical oncology: the coupling of metabolic state to the physical microenvironment and ultimately to the dynamics of competing cell populations. Models of this type predict that interventions targeting the acidic microenvironment (e.g., systemic buffers such as bicarbonate) could slow invasion speed, a prediction that has been confirmed in mouse models.
</div>

## 5.4 Glycolysis–Respiration Trade-Offs

A complementary view models the metabolic trade-off between glycolysis and oxidative phosphorylation using evolutionary game theory. Define two phenotypes: glycolytic (G) cells that produce acid and respiratory (R) cells that do not. In a spatially well-mixed environment, the payoff matrix depends on local oxygen and glucose availability. Under normoxia and abundant glucose, R cells are more efficient (higher ATP yield) but G cells can outcompete normal neighboring cells through acidification. Under hypoxia, the advantage shifts decisively to G cells.

Evolutionarily stable strategy (ESS) analysis of this game predicts that intermediate mixtures of glycolytic and respiratory phenotypes may persist in certain microenvironments, consistent with the observed intra-tumoral metabolic heterogeneity. This heterogeneity in turn predicts that anti-glycolytic therapies will select for the respiratory phenotype, which may have different invasive properties.

---

# Chapter 6: Cancer Stem Cells and Hierarchical Tumor Organization

## 6.1 The Cancer Stem Cell Hypothesis

The **cancer stem cell (CSC) hypothesis** proposes that not all cells within a tumor are equivalent in their capacity for self-renewal and tumor propagation. Instead, a small subpopulation of cells — cancer stem cells — possesses the ability to divide indefinitely, give rise to the full phenotypic diversity of the tumor, and seed metastases. The bulk of the tumor consists of **transit-amplifying cells** (partially differentiated, limited proliferative potential) and terminally differentiated cells.

This hierarchical model of tumor organization has profound implications for treatment. Standard chemotherapeutic agents preferentially kill rapidly dividing cells, which are predominantly the non-stem compartment. If CSCs are relatively quiescent or express elevated levels of drug-efflux pumps and DNA-repair enzymes, they may survive treatment and repopulate the tumor — explaining the clinical phenomenon of relapse after an initial complete response.

## 6.2 Symmetric and Asymmetric Division

A CSC can divide in three ways. In **symmetric self-renewal**, both daughter cells are CSCs, expanding the stem compartment. In **asymmetric division**, one daughter is a CSC and the other is a transit-amplifying cell, maintaining the stem pool while producing differentiated progeny. In **symmetric commitment**, both daughters are non-stem cells, depleting the stem compartment. The relative probabilities of these outcomes — denoted \(p\), \(\frac{1-p-q}{1}\), and \(q\) respectively, where \(p\) is the probability of symmetric self-renewal and \(q\) is the probability of symmetric commitment — determine the long-term dynamics of the stem compartment.

<div class="definition">
<strong>Division Probability Notation.</strong> For a cancer stem cell at division, let <em>p</em> denote the probability of symmetric self-renewal (both daughters are CSCs), let <em>q</em> denote the probability of symmetric commitment (both daughters differentiate), and let \(1-p-q\) denote the probability of asymmetric division. Net expansion of the CSC compartment occurs if and only if \(p > q\).
</div>

## 6.3 Multi-Compartment ODE Model

A minimal mathematical model of the tumor hierarchy tracks the population of CSCs \(S(t)\), transit-amplifying cells \(T(t)\), and differentiated cells \(D(t)\):

\[
\frac{dS}{dt} = \left(2p - 1\right) a_S S,
\]

\[
\frac{dT}{dt} = 2(1-p-q) a_S S + (2\rho - 1) a_T T - \delta_T T,
\]

\[
\frac{dD}{dt} = 2q a_S S + 2(1-\rho) a_T T - \delta_D D,
\]

where \(a_S\) and \(a_T\) are the division rates of CSCs and transit-amplifying cells respectively, \(\rho\) is the self-renewal probability of transit-amplifying cells, and \(\delta_T, \delta_D\) are death rates. The factor of 2 arises because each division produces two daughter cells.

The CSC compartment grows exponentially when \(2p - 1 > 0\), i.e., \(p > 1/2\). More precisely, the eigenvalue analysis of the linearized system at zero shows that the dominant growth rate of the entire hierarchy is determined by \(a_S(2p-1)\), the net CSC expansion rate. This implies that even small changes in \(p\) — for example, through deregulation of Notch or Wnt signaling that controls fate decisions — can dramatically alter tumor growth kinetics.

## 6.4 Epithelial–Mesenchymal Transition

**Epithelial–mesenchymal transition (EMT)** is a developmental program in which epithelial cells lose their adhesive, polarized phenotype and acquire the migratory, invasive properties of mesenchymal cells. In cancer, EMT is associated with the acquisition of stem-cell-like properties, increased resistance to therapy, and the initiation of metastasis. Crucially, EMT is at least partially reversible: mesenchymal cells can revert to an epithelial phenotype through MET (mesenchymal–epithelial transition).

Mathematically, EMT can be incorporated into the compartmental model by allowing bidirectional transitions between epithelial CSC and mesenchymal CSC compartments:

\[
\frac{dE}{dt} = \text{(proliferation terms)} - k_{EM} E + k_{ME} M,
\]

\[
\frac{dM}{dt} = \text{(proliferation terms)} + k_{EM} E - k_{ME} M,
\]

where \(k_{EM}\) and \(k_{ME}\) are the rates of EMT and MET respectively. At steady state, the fraction of cells in the mesenchymal state is \(k_{EM}/(k_{EM} + k_{ME})\), independent of the proliferation dynamics. However, the mesenchymal compartment may have different proliferation, death, and metastatic rates, creating a feedback between the fraction in each state and the overall tumor growth trajectory.

---

# Chapter 7: Cancer Cell Signaling — Bistability and Molecular Switches

## 7.1 Bistability in Cell Fate Decisions

Many critical cell fate decisions — to divide or arrest, to undergo apoptosis or survive, to differentiate or remain stem-like — are not graded but switch-like: the cell switches abruptly between two stable states as a signal crosses a threshold, and the switch exhibits hysteresis. This behavior arises mathematically from **bistability**: the coexistence of two stable steady states in the governing ODE system, separated by an unstable steady state. Bistability requires positive feedback (or mutual inhibition), a common motif in signal transduction networks.

The cell-cycle entry decision at the G1/S boundary — the **restriction point** — is a paradigmatic example. Once a cell commits to division past the restriction point, it proceeds to S phase regardless of whether mitogenic signals are subsequently removed. This irreversibility is a property of the bistable Rb–E2F toggle switch.

## 7.2 The Rb–E2F Restriction Point Model

The retinoblastoma protein Rb restrains cell-cycle progression by binding and inactivating the transcription factor E2F. Cyclin D/CDK4 complexes, activated by mitogenic signals, phosphorylate Rb, releasing E2F. E2F then transcriptionally activates its own expression (positive feedback) as well as Cyclin E, which activates CDK2 to further phosphorylate Rb — creating a second positive feedback loop.

A minimal ODE model of the Rb–E2F switch tracks active (hypophosphorylated) Rb concentration \(R\) and free E2F concentration \(E\):

\[
\frac{dR}{dt} = k_R - \delta_R R - k_{CD} C_D R \frac{1}{K_D + R} - k_{CE} C_E R \frac{1}{K_E + R},
\]

\[
\frac{dE}{dt} = \left(k_{E0} + k_{E1} \frac{E^2}{K_E^2 + E^2}\right)(1 - E) - \delta_E E + k_{RE} (E_T - E - R \cdot E),
\]

where \(C_D\) and \(C_E\) are Cyclin D and Cyclin E concentrations (treated as parameters or coupled dynamical variables), and the sigmoidal term in the E2F equation captures autocatalytic E2F transcription. Bifurcation analysis with respect to the mitogenic signal \(C_D\) reveals a saddle-node bifurcation structure: for low \(C_D\), only the arrested state (high \(R\), low \(E\)) is stable; for high \(C_D\), only the cycling state (low \(R\), high \(E\)) is stable; in between, both are stable and the system is bistable. The restriction point corresponds to the upper saddle-node bifurcation value of \(C_D\), above which the cell irreversibly commits to division.

<div class="theorem">
<strong>Irreversibility at the Restriction Point.</strong> In the bistable Rb–E2F model, once the mitogenic signal <em>C_D</em> is raised above the upper saddle-node bifurcation value <em>C_D*</em> and the system switches to the cycling state, subsequent reduction of <em>C_D</em> below <em>C_D*</em> does not immediately return the system to the arrested state. The system remains in the cycling state until <em>C_D</em> drops below the lower saddle-node bifurcation value, which lies well below <em>C_D*</em>. This hysteresis is the mathematical signature of irreversible commitment to cell division.
</div>

## 7.3 The p53–Akt Network and Apoptotic Decision-Making

The tumor suppressor p53 sits at the hub of the cellular stress response. In response to DNA damage, p53 accumulates rapidly and activates transcriptional programs for cell-cycle arrest, DNA repair, or apoptosis. However, p53 is kept at low levels in unstressed cells through continuous ubiquitylation and proteasomal degradation, mediated by its transcriptional target Mdm2 — creating a negative feedback loop with oscillatory tendencies.

The pro-survival kinase Akt phosphorylates and activates Mdm2, leading to p53 degradation. Simultaneously, Akt activates anti-apoptotic proteins and inhibits pro-apoptotic signals. Thus, the p53–Akt axis forms a mutual inhibition motif: p53 can suppress Akt activity (through PTEN, a phosphatase it transcriptionally activates), while Akt suppresses p53. This double-negative feedback creates bistability in the apoptotic decision:

\[
\frac{dp_{53}}{dt} = k_1 \frac{D}{K_1 + D} - \frac{k_2 p_{53}}{K_2 + p_{53}} \cdot A - k_3 p_{53},
\]

\[
\frac{dA}{dt} = \frac{k_4}{1 + k_5 p_{53}^2} - k_6 A,
\]

where \(D\) represents DNA damage (a parameter), \(A\) is active Akt, and the Hill functions capture cooperative interactions. For low DNA damage, the system has a unique stable fixed point with low p53 and high Akt — the survival state. For high DNA damage, the system transitions to a state of high p53 and low Akt — the death state. The bistability implies that there is a critical damage threshold below which cells can repair and survive, and above which they are committed to apoptosis.

## 7.4 Sensitivity Analysis and Parameter Uncertainty

Mathematical models of signaling networks contain many parameters, often poorly constrained by experiment. **Sensitivity analysis** quantifies how model outputs respond to perturbations in parameters, guiding both experimental prioritization and model simplification.

The local sensitivity coefficient of output \(y\) with respect to parameter \(\theta\) is defined as:

\[
S_{y,\theta} = \frac{\partial y}{\partial \theta} \cdot \frac{\theta}{y},
\]

the relative change in output per unit relative change in parameter. High \(|S_{y,\theta}|\) identifies parameters to which the model is particularly sensitive — these warrant careful experimental determination. For bistable systems, sensitivity analysis near bifurcation points reveals divergence of sensitivity coefficients, reflecting critical slowing down as the system approaches a tipping point.

Global sensitivity methods, such as the Sobol variance-based approach or Morris screening, explore the full parameter space and are particularly important when parameter interactions are strong. In the context of oncology, global sensitivity analysis of signaling models has been used to identify which molecular targets are most likely to push cancer cells across the apoptotic threshold, guiding drug development priorities.

---

# Chapter 8: The Immune System and Cancer

## 8.1 Immunosurveillance and Immune Evasion

The immune system plays a dual role in cancer: it can recognize and destroy emerging tumor cells (**immunosurveillance**), but if tumors evade this surveillance, an **immunosuppressive** microenvironment can develop that paradoxically promotes tumor growth. This dual role is captured by the **three Es of cancer immunoediting**: Elimination, Equilibrium, and Escape.

In the Elimination phase, the innate and adaptive immune systems recognize tumor-associated antigens and cytolytic T lymphocytes (CTLs) destroy cancer cells. In the Equilibrium phase, the immune system contains but cannot eradicate the tumor, selecting for immunosuppressive variants. In the Escape phase, immunosuppressive variants dominate and the tumor grows progressively. Each phase has a distinct mathematical signature.

## 8.2 Predator–Prey Models of Tumor–Immune Dynamics

The qualitative dynamics of the interaction between a tumor cell population \(T(t)\) and an immune effector population \(E(t)\) (primarily CTLs and natural killer cells) can be captured by a predator–prey-type ODE system:

\[
\frac{dT}{dt} = r T \left(1 - \frac{T}{K}\right) - k_{TE} E T,
\]

\[
\frac{dE}{dt} = \sigma + \frac{\rho E T}{\alpha + T} - \delta_E E - k_{ET} E T,
\]

where the first equation describes logistic tumor growth with a killing term proportional to the product of tumor and effector densities. The immune equation includes a constant source \(\sigma\) of effectors (naive T cells entering from the periphery), proliferative expansion driven by tumor antigen proportional to \(\rho ET/(\alpha + T)\), natural death at rate \(\delta_E\), and inactivation of effectors by tumor-derived immunosuppressive factors at rate \(k_{ET}\).

This system can exhibit multiple stable steady states depending on parameters. For small tumors, the immune response is sufficient to eliminate them (the system converges to \(T = 0\)). For larger tumors or in the face of strong immunosuppression, the system may settle into a non-trivial coexistence equilibrium (tumor dormancy) or allow unbounded tumor growth. Bifurcation analysis with respect to the immunosuppression parameter \(k_{ET}\) reveals that tumor dormancy can be maintained over a wide parameter range — consistent with clinical observations of patients who carry small tumors for years without progression.

<div class="remark">
The predator–prey framing should not be taken too literally: unlike ecological predators, immune effectors do not gain energy or reproductive capacity from killing tumor cells in a way that directly scales their growth. The proliferative expansion term \(\rho ET/(\alpha + T)\) models antigen-driven clonal expansion of antigen-specific T cells, which is biologically distinct from the energy-based growth of ecological predators. Nevertheless, the mathematical structure produces qualitatively similar phase portraits and provides a tractable entry point for understanding dormancy and escape.
</div>

## 8.3 Tumor Dormancy and the Balance of Angiogenesis

Beyond immune dormancy, tumors can be held in a non-growing state by the balance between pro- and anti-angiogenic factors. A key observation is that avascular micro-metastases can remain dormant for years, with proliferation balanced by apoptosis due to the limited diffusion of oxygen and nutrients. Disruption of this balance — for example, by oncogenic upregulation of VEGF or stromal remodeling — can trigger the **angiogenic switch** and initiate rapid tumor growth.

A simple model of the angiogenic switch treats the tumor as a sphere of radius \(R(t)\) whose growth is determined by the balance between proliferation in the oxygenated rim (width \(\delta\)) and necrosis in the hypoxic core:

\[
\frac{dR}{dt} = \lambda_P \delta - \lambda_N \left(R - \delta\right)^+,
\]

where \(\lambda_P\) and \(\lambda_N\) are proliferation and necrosis rates, and the notation \((\cdot)^+\) denotes the positive part. Dormancy occurs when \(dR/dt = 0\), which gives \(R^* = \delta(1 + \lambda_P/\lambda_N)\). Induction of angiogenesis effectively increases \(\delta\) by improving oxygen delivery, pushing the tumor past the dormant radius and triggering exponential-phase growth.

## 8.4 Checkpoint Inhibitor Immunotherapy

The most transformative recent development in cancer treatment is **checkpoint inhibitor immunotherapy**, which targets inhibitory receptors — primarily CTLA-4, PD-1, and PD-L1 — that are co-opted by tumors to suppress CTL activity. By blocking these checkpoints with monoclonal antibodies, the T cell response can be re-activated.

Mathematically, the effect of a PD-1 checkpoint inhibitor can be incorporated into the tumor–immune model by modifying the inactivation term:

\[
k_{ET} \rightarrow k_{ET} \cdot (1 - f_I(C)),
\]

where \(C\) is the concentration of the checkpoint inhibitor and \(f_I(C)\) is a pharmacodynamic function (often a Hill function) representing fractional inhibition of the suppressive pathway. With this modification, the ODE system predicts that sufficient drug concentrations can destabilize the dormancy equilibrium and push the system toward immune elimination of the tumor — but also that excessive immune activation can lead to autoimmune toxicity, captured by terms for bystander T cell activation.

Computational models integrating tumor growth kinetics, T cell dynamics, and drug pharmacokinetics have been fitted to clinical data from checkpoint inhibitor trials, enabling prediction of which patients (based on baseline tumor size and immune infiltration) are likely to respond.

---

# Chapter 9: Metastasis — Invasion and Migration Modeling

## 9.1 The Metastatic Cascade

Metastasis — the spread of cancer cells from the primary tumor to distant organs — is responsible for the vast majority of cancer mortality. The metastatic cascade is a multi-step process: cancer cells must first **invade** the surrounding extracellular matrix (ECM), then **intravasate** into blood or lymph vessels, survive transit, **extravasate** into a distant organ, and finally establish and grow a secondary tumor. Each step is biologically demanding; the probability of a single cancer cell completing the entire cascade is estimated at less than one in \(10^6\). Nevertheless, the enormous number of cells shed daily by advanced tumors makes metastasis statistically inevitable without treatment.

## 9.2 Chemotaxis and Haptotaxis in Invasion

The initial step of invasion — local migration through the ECM — involves the same chemotactic and haptotactic mechanisms introduced in Chapter 3, now applied to cancer cells rather than endothelial cells. The motility of cancer cells along chemical gradients plays a central role in invasion; the relevant attractants include hepatocyte growth factor (HGF), epidermal growth factor (EGF), and components of the ECM (fibronectin, collagen, vitronectin).

The continuum model for cancer cell invasion, following Chaplain and Lolas, incorporates cancer cell density \(n\), matrix metalloproteinase (MMP) concentration \(m\), and ECM density \(v\):

\[
\frac{\partial n}{\partial t} = D_n \nabla^2 n - \nabla \cdot \left(\chi_v n \nabla v\right) + \mu_n n (1 - n - v),
\]

\[
\frac{\partial m}{\partial t} = D_m \nabla^2 m + \alpha_m n - \beta_m m,
\]

\[
\frac{\partial v}{\partial t} = -\gamma_m m v + \mu_v v(1 - n - v),
\]

where the first equation models cancer cell diffusion and haptotaxis toward ECM, the second models MMP secretion by cancer cells and diffusion/degradation, and the third models ECM degradation by MMPs and ECM remodeling. The haptotaxis term \(-\nabla \cdot (\chi_v n \nabla v)\) drives cancer cells up the ECM gradient — toward denser matrix that has not yet been degraded — creating a directed invasive front.

Traveling wave solutions of this system describe the advancing invasion front. The minimum wave speed is:

\[
c_{\min} = 2\sqrt{D_n \mu_n},
\]

a result analogous to the Fisher wave speed, modified by the haptotactic interaction. The invasion speed depends on cancer cell motility and proliferation but also on the ECM degradation rate, which determines how quickly a fresh ECM gradient is re-established ahead of the front.

## 9.3 Hybrid Discrete–Continuum Models

While continuum PDE models provide analytical tractability and describe population-level behavior, they cannot resolve the individual cell decisions — such as the choice to intravasate, the fate of individual circulating tumor cells, or the stochastic colonization of micro-metastatic niches — that determine metastatic success. Hybrid discrete–continuum models address this by treating individual cancer cells as discrete agents that migrate according to rules derived from continuum field equations, while chemical species and ECM are treated as continuous fields.

In the Anderson hybrid framework, the ECM and MMP fields are solved on a spatial grid, and individual cancer cells execute biased random walks with transition probabilities derived from the local gradient of ECM (haptotaxis) and MMP fields. Each cell carries an internal state (phenotype, mutation profile, metabolic state) that can evolve over time. When a cell reaches a blood vessel grid point, it has a probability \(p_{\text{intra}}\) of intravasating per time step.

This approach naturally captures the extreme stochasticity of metastasis — in particular, the jackpot distribution of cells that succeed in establishing metastases — and can generate quantitative predictions about the size distribution and number of metastases at diagnosis, which have been compared to autopsy data.

## 9.4 Phenotypic Plasticity and the Go-or-Grow Dichotomy

An important empirical observation is that cancer cells appear to trade off between proliferating and migrating — the so-called **go-or-grow** dichotomy. Highly motile cells tend to proliferate slowly, while rapidly dividing cells are less migratory. This trade-off may reflect underlying resource constraints or the incompatibility of cell-cycle progression with the cytoskeletal reorganization required for migration.

The go-or-grow dichotomy can be modeled by allowing cells to switch stochastically between a proliferative phenotype \(P\) and a migratory phenotype \(M\), with switching rates \(\nu_{PM}\) (go) and \(\nu_{MP}\) (grow):

\[
\frac{\partial P}{\partial t} = D_P \nabla^2 P + r_P P \left(1 - \frac{P+M}{K}\right) - \nu_{PM} P + \nu_{MP} M,
\]

\[
\frac{\partial M}{\partial t} = D_M \nabla^2 M - \nu_{MP} M + \nu_{PM} P,
\]

with \(D_M \gg D_P\) (migratory cells disperse more rapidly). Analysis of this system reveals that the spatial spread of the tumor is determined primarily by the migratory subpopulation, while the bulk growth is driven by the proliferative subpopulation. The go-or-grow trade-off therefore predicts that tumors can simultaneously develop a proliferating core and a migrating invasive rim — a morphology observed in glioblastoma and other invasive cancers.

<div class="example">
<strong>Glioblastoma Invasion.</strong> Glioblastoma multiforme (GBM) is the most aggressive primary brain tumor, characterized by diffuse infiltration of the brain parenchyma. Swanson and colleagues applied a two-population go-or-grow model to MRI data, fitting the diffusion coefficients \(D_P\) and \(D_M\) and the proliferation rate \(r_P\) to longitudinal imaging from individual patients. The model predicted the spatial extent of tumor infiltration beyond the MRI-visible boundary, which was subsequently confirmed by pathology. This patient-specific modeling approach exemplifies the translational potential of mathematical oncology.
</div>

---

# Chapter 10: Artificial Intelligence and Machine Learning in Mathematical Oncology

## 10.1 The Data Landscape in Oncology

The past decade has seen an explosion of high-dimensional oncological data: genomic sequencing, transcriptomic profiling (bulk and single-cell), proteomic and metabolomic measurements, digital pathology images, radiological imaging, electronic health records, and longitudinal clinical trial data. The complexity and dimensionality of these datasets far exceeds the capacity of traditional statistical approaches or low-dimensional mechanistic models. This has driven rapid adoption of machine learning (ML) and deep learning (DL) methods in oncology, spanning applications from diagnosis and prognosis to drug response prediction and treatment planning.

At the same time, there is growing recognition that purely data-driven models — trained on observational data without mechanistic constraints — may fail to generalize to new patient populations, new treatment regimens, or interventional settings that differ from the training distribution. The frontier of computational oncology therefore lies in **hybrid approaches** that combine the interpretability and generalizability of mechanistic models with the flexibility and data-handling capacity of deep learning.

## 10.2 Systems Biology-Informed Neural Networks

**Physics-informed neural networks (PINNs)** and their biological analogue, **systems biology-informed neural networks (SBINNs)**, constrain the neural network training process with the requirement that the network's outputs satisfy known governing equations — typically ODEs or PDEs derived from mechanistic models. This allows the network to learn from sparse experimental data while being regularized by the physics of the system.

Formally, a neural network \(\hat{u}(t;\theta)\) is trained to approximate the solution of a system of ODEs:

\[
\frac{d\mathbf{u}}{dt} = \mathbf{f}(\mathbf{u}, t; \boldsymbol{\lambda}),
\]

where \(\boldsymbol{\lambda}\) are model parameters that may also be unknown. The training loss comprises a data fidelity term and a physics residual term:

\[
\mathcal{L}(\theta, \boldsymbol{\lambda}) = \sum_{i} \left\| \hat{u}(t_i;\theta) - u_i^{\text{obs}} \right\|^2 + \omega \int_{t_0}^{T} \left\| \frac{d\hat{u}}{dt} - \mathbf{f}(\hat{u}, t; \boldsymbol{\lambda}) \right\|^2 dt,
\]

where \(\omega\) balances the two terms. The integral is approximated by collocation points distributed over the time domain. Minimizing \(\mathcal{L}\) simultaneously fits the network to the data and enforces the ODE constraints, enabling joint identification of the network architecture (which encodes the state trajectory) and the biological parameters \(\boldsymbol{\lambda}\).

Applied to tumor growth dynamics, SBINNs have been used to identify growth parameters and drug sensitivities from longitudinal tumor volume measurements, outperforming standard curve-fitting approaches when data are sparse or noisy.

## 10.3 Deep Learning for Diagnosis and Prognosis

Convolutional neural networks (CNNs) have achieved remarkable performance on image-based diagnostic tasks. In histopathology, CNNs trained on digitized tissue slides can identify tumor subtypes, grade tumors, predict molecular features (such as microsatellite instability or EGFR mutation status) directly from morphology, and estimate patient survival — often matching or exceeding the performance of expert pathologists on defined tasks.

The standard architecture for survival prediction from imaging is a multi-instance learning (MIL) framework. A whole-slide image is divided into many small patches (tiles); a CNN (typically pretrained on ImageNet and fine-tuned on pathology data) extracts feature vectors from each tile; an attention-based aggregation module combines tile-level features into a slide-level representation; and a final survival model (e.g., a Cox proportional-hazards head) predicts the hazard function.

\[
h(t | \mathbf{z}) = h_0(t) \exp\left(\boldsymbol{\beta}^{\top} \mathbf{z}\right),
\]

where \(\mathbf{z}\) is the slide-level embedding, \(\boldsymbol{\beta}\) are learned weights, and \(h_0(t)\) is the baseline hazard. The network is trained by maximizing the Cox partial likelihood over the patient cohort.

## 10.4 Radiomics and Imaging Biomarkers

**Radiomics** refers to the extraction of large numbers of quantitative features — shape, texture, intensity statistics, wavelet-based descriptors — from medical images (CT, MRI, PET) for use as biomarkers. These features can capture tumor heterogeneity that is invisible to the naked eye and may reflect underlying biological processes such as hypoxia, cell density, or necrosis.

When radiomics features are combined with mechanistic growth models, the resulting framework is called **mechanistic–radiomics integration**. For example, diffusion-weighted MRI provides apparent diffusion coefficient (ADC) maps that are inversely proportional to cell density. By treating the ADC map as a spatial measurement of the cell density field predicted by a Fisher–KPP growth model, one can estimate spatially resolved growth and diffusion parameters — enabling patient-specific tumor simulations.

## 10.5 Integration of ML with Mechanistic Models: A Framework

The relationship between mechanistic models and ML can be structured along a spectrum. At one extreme, **purely mechanistic models** make quantitative predictions from first principles but may miss important biological effects not captured by the assumed mechanisms. At the other extreme, **purely data-driven models** are flexible and can discover unexpected patterns but may not generalize outside the training distribution and offer limited interpretability.

Several integration strategies have emerged:

**Surrogate modeling**: Train a neural network as a fast emulator of an expensive mechanistic model (e.g., a PDE-based tumor growth simulation). The surrogate can then be used for rapid parameter sweeps, uncertainty quantification, or optimization.

**Parameter identification**: Use ML (e.g., Bayesian neural networks, Gaussian processes) to infer the spatial or temporal distribution of parameters in a mechanistic model from imaging or multi-omics data.

**Model augmentation**: Add a neural network term to a mechanistic ODE/PDE to account for unmeasured or poorly understood processes, learning the residual dynamics from data.

**Digital twins**: Construct a patient-specific computational model — combining imaging-derived anatomy, mechanistic tumor growth equations, and ML-estimated parameters — that can be used to simulate the effect of different treatment protocols and select the optimal schedule.

<div class="remark">
The digital twin framework is particularly appealing because it embodies the precision medicine paradigm: treatment decisions are guided by a computational representation calibrated to the individual patient rather than population averages. Current challenges include the need for large, high-quality longitudinal datasets for model calibration, uncertainty quantification in the face of model error and measurement noise, and regulatory approval of model-guided clinical decision-making.
</div>

---

# Chapter 11: Synthesis — Multi-Scale Integration and Future Directions

## 11.1 The Multi-Scale Nature of Cancer

One of the central challenges in mathematical oncology is that cancer is inherently a multi-scale phenomenon. At the intracellular scale (nanometers to micrometers), mutations in signaling networks alter cell behavior. At the cellular scale (micrometers), individual cells divide, migrate, die, and communicate with neighbors. At the tissue scale (millimeters), population dynamics, mechanical forces, and diffusing chemical gradients govern tumor growth and invasion. At the organism scale (centimeters), interactions with the vasculature, immune system, and distant organs determine metastatic spread and treatment outcome.

Mechanistic models operating at a single scale inevitably miss processes occurring at other scales. The Anderson–Chaplain angiogenesis model, for example, describes EC dynamics but takes VEGF secretion by tumor cells as a given boundary condition rather than modeling the intracellular hypoxia-sensing mechanism that drives VEGF expression. Full multi-scale models couple descriptions at multiple scales, either through homogenization (upscaling from cell-level rules to tissue-level PDEs) or through direct simulation (hybrid agents whose internal state is governed by a sub-model at the cellular scale).

## 11.2 Sharp Interface and Phase-Field Models of Tumor Growth

A complementary macroscale approach treats the tumor as a continuum mechanical object with a well-defined boundary and formulates equations for the coupled evolution of the tumor shape, the intratumoral pressure, and the nutrient and waste fields. The sharp interface approach tracks the tumor boundary as a surface \(\Gamma(t)\) evolving by a normal velocity:

\[
V_n = \left(\lambda_P \sigma - \lambda_A\right)\Big|_{\Gamma},
\]

where \(\sigma\) is the local nutrient concentration evaluated at the tumor surface, \(\lambda_P\) is the proliferation rate, and \(\lambda_A\) is the apoptosis rate. The nutrient satisfies a diffusion equation in the tumor domain with appropriate boundary conditions at the tumor surface and at infinity.

The **Cristini–Lowengrub phase-field model** replaces the sharp interface with a diffuse interface parameterized by a phase variable \(\phi(\mathbf{x},t)\) that transitions smoothly from 1 (tumor) to 0 (host) over a thin layer. The evolution equation for \(\phi\) is:

\[
\frac{\partial \phi}{\partial t} = M \nabla^2 \left(\frac{\partial F}{\partial \phi} - \varepsilon^2 \nabla^2 \phi\right) + S(\phi, \sigma),
\]

where \(F(\phi)\) is a double-well free energy (with minima at \(\phi = 0\) and \(\phi = 1\)), \(\varepsilon\) is the interface thickness parameter, and \(S\) is a source/sink term driven by nutrient availability. This Cahn–Hilliard-type equation with nutrient coupling can reproduce complex tumor morphologies including lobular growth, fingering instabilities, and the formation of necrotic cores, depending on the balance of cell–cell adhesion (surface tension) and nutrient-driven proliferation.

## 11.3 Tumor-Induced Instabilities: The Morphological Stability Problem

Even spherically symmetric steady-state solutions of tumor growth models may be unstable to non-spherical perturbations, leading to irregular, finger-like tumor shapes. A classical stability analysis considers small perturbations to a spherical tumor of radius \(R_0\):

\[
R(\theta, \phi, t) = R_0 + \epsilon Y_\ell^m(\theta, \phi) e^{\beta t},
\]

where \(Y_\ell^m\) are spherical harmonics of mode \(\ell\) and \(\beta\) is the growth rate of the perturbation. Linearizing the free-boundary problem in \(\epsilon\) and solving for \(\beta(\ell)\), one finds that modes with large \(\ell\) (high frequency, fingering modes) are stabilized by surface tension (cell–cell adhesion) and destabilized by nutrient gradients. The critical mode \(\ell^*\) that first becomes unstable as the tumor grows provides a prediction of the characteristic spatial scale of tumor surface irregularity, which can in principle be measured from imaging and used to estimate biological parameters.

## 11.4 Toward Patient-Specific Mathematical Oncology

The ultimate ambition of mathematical oncology is not merely to explain the general principles of cancer progression but to make actionable patient-specific predictions. This goal requires several components that are now becoming tractable:

**Model personalization**: Fitting model parameters to individual patient data (tumor volume time series, pharmacokinetic profiles, imaging biomarkers) using Bayesian inference. Markov chain Monte Carlo (MCMC) methods or variational inference algorithms can provide posterior distributions over parameters, quantifying uncertainty.

**Treatment optimization**: Using the calibrated patient model to optimize treatment schedules. For a cytotoxic drug with concentration \(C(t)\), the tumor kill rate is often modeled by a pharmacodynamic function \(E(C) = E_{\max} C^n / (EC_{50}^n + C^n)\). The optimal dosing problem can be formulated as an optimal control problem:

\[
\min_{C(t)} \int_0^T T(t)\, dt \quad \text{subject to} \quad \text{toxicity constraints},
\]

where the objective minimizes cumulative tumor burden and the state \(T(t)\) evolves according to the tumor-growth ODE with the PD kill term.

**Adaptive therapy**: Rather than targeting maximum tumor reduction, **adaptive therapy** aims to maintain a stable, controlled tumor burden by managing the competition between drug-sensitive and drug-resistant cells. This ecological-control strategy, formalized by Gatenby and colleagues using evolutionary game theory, exploits the competitive advantage that drug-sensitive cells hold over resistant cells in the absence of drug. By withdrawing treatment when the sensitive population becomes dominant and re-applying it when resistance begins to emerge, adaptive therapy can maintain stable equilibrium indefinitely in mathematical models — a prediction that has been supported by initial clinical trials.

## 11.5 Closing Perspective

Mathematical oncology has matured from a collection of isolated models into a coherent, multi-scale scientific enterprise. The models discussed in these notes — from the Moran process description of somatic evolution, through the reaction–diffusion equations of angiogenesis and invasion, to the bistable switches governing cell fate and the neural network surrogates of patient-specific dynamics — are united by the conviction that cancer is a quantitative phenomenon amenable to mathematical analysis.

The clinical impact of this enterprise is beginning to be realized. Mechanistic models have contributed to the design of adaptive therapy trials, the prediction of immunotherapy response, the identification of biomarkers for vascular normalization windows, and the rational design of combination schedules that exploit tumor ecology rather than simply maximizing drug dose. As data quality and computational power continue to improve, the integration of mechanistic and machine learning approaches — embodied in the digital twin framework — holds promise for genuinely individualized cancer management.

The open challenges are significant: heterogeneity at every scale, the stochasticity of rare events like metastatic seeding, the complexity of the tumor immune microenvironment, and the rapidly evolving landscape of targeted therapies all demand continued mathematical innovation. But the trajectory is clear: quantitative, model-driven approaches are becoming indispensable tools in the oncologist's arsenal.
