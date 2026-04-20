---
title: "ENVE 176: Microbial Biology for Environmental Engineers"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Madigan, M. T., Bender, K. S., Buckley, D. H., Sattley, W. M., and Stahl, D. A., *Brock Biology of Microorganisms*; Rittmann, B. E. and McCarty, P. L., *Environmental Biotechnology: Principles and Applications*.

**Supplementary texts** — Metcalf & Eddy, *Wastewater Engineering: Treatment and Resource Recovery*; Willey, J. M., Sandman, K., and Wood, D., *Prescott's Microbiology*; Maier, R. M. and Pepper, I. L., *Environmental Microbiology*.

**Online resources** — MIT OpenCourseWare 1.018J *Fundamentals of Ecology* and 7.014 *Introductory Biology*; NCBI Bookshelf open microbiology texts; Joint Genome Institute (JGI) genome portal public resources; EMBL-EBI bioinformatics training materials; US EPA *Method 1604* and microbial water quality guidance.

---

# Chapter 1: Microbes and Their World

Microbes — bacteria, archaea, fungi, protists, and viruses — run the biogeochemistry of the planet. Environmental engineers harness, direct, or contain their activity in treatment plants, remediation systems, and monitoring programs. A solid grasp of microbial structure, physiology, and diversity is essential.

## 1.1 Scope and Scales

Microorganisms span sizes from \(20\ \text{nm}\) viruses to \(500\ \mu\text{m}\) filamentous bacteria. Their biomass rivals that of plants; their collective metabolic capacity includes virtually every energy-yielding reaction thermodynamically feasible on Earth. Engineering systems — aeration tanks, anaerobic digesters, drinking-water filters — are designed to cultivate or suppress specific microbial communities.

## 1.2 Three Domains of Life

Carl Woese's molecular phylogeny established three domains: **Bacteria**, **Archaea**, and **Eukarya**. Archaea include extremophiles and methanogens central to anaerobic treatment. Eukaryotic microbes (fungi, algae, protozoa) contribute to wastewater treatment and cause waterborne diseases.

<div class="definition">
<strong>Prokaryote.</strong> A cellular organism whose genetic material is not enclosed in a nucleus. Bacteria and Archaea are prokaryotes; their cellular architecture differs in membrane lipids, cell-wall chemistry, and ribosome structure.
</div>

# Chapter 2: Cell Structure and Function

## 2.1 The Bacterial Cell

A typical bacterial cell contains a cytoplasmic membrane (phospholipid bilayer with proteins), cytoplasm with ribosomes and a single circular chromosome, and often plasmids. External structures include the peptidoglycan cell wall (thick in Gram-positive, thin in Gram-negative with an outer membrane), capsules or slime layers (biofilm formation), flagella (motility), and pili (adhesion, conjugation).

## 2.2 Membrane Transport and Energetics

Active transport moves solutes against gradients using ATP or proton-motive force (PMF). The PMF combines a pH gradient and a membrane potential:

\[
\Delta p = \Delta\psi - \frac{2.3\,RT}{F}\,\Delta\mathrm{pH}
\]

and powers ATP synthesis via ATP synthase, flagellar rotation, and symport/antiport.

## 2.3 Archaeal Specializations

Archaeal membranes use ether-linked isoprenoid lipids, often with monolayer structures that stabilize cells under high temperature or low pH. Cell walls use pseudopeptidoglycan or S-layers. These adaptations allow archaea to dominate environments from hydrothermal vents to hypersaline brines.

# Chapter 3: Cultivation and Characterization

## 3.1 Growth Requirements

Culture media provide carbon, nitrogen, phosphorus, trace elements, and, for heterotrophs, a reduced carbon source. Oxygen requirements span **obligate aerobes**, **facultative anaerobes**, **microaerophiles**, **aerotolerant anaerobes**, and **obligate anaerobes** (which often use alternative terminal electron acceptors). Temperature optima define psychrophiles, mesophiles, thermophiles, and hyperthermophiles.

## 3.2 Growth Kinetics

In batch culture, a population grows exponentially during the log phase:

\[
X(t) = X_0 e^{\mu t}
\]

with specific growth rate \(\mu\). At low substrate concentration \(\mu\) depends on substrate by the **Monod equation**:

\[
\mu = \mu_{\max}\,\frac{S}{K_S + S}
\]

Biomass yield \(Y = \Delta X/\Delta S\) ties growth to substrate consumption. The inverse of the mean residence time in a chemostat equals the dilution rate, which at steady state equals \(\mu\), producing

\[
S = \frac{K_S\,D}{\mu_{\max} - D}
\]

a workhorse relation in reactor engineering.

## 3.3 Cultivation-Independent Characterization

Because most environmental microbes are not cultivable on standard media — the **great plate count anomaly** — engineers increasingly rely on molecular methods. DNA extraction, PCR amplification of the 16S rRNA gene, and high-throughput sequencing characterize communities without cultivation. Fluorescence in situ hybridization (FISH) uses fluorescent probes targeting rRNA for in situ visualization.

# Chapter 4: Genetics, Phylogeny, and Taxonomy

## 4.1 Genome Organization

Bacterial chromosomes are typically a single circular DNA molecule of \(0.5\text{–}10\ \text{Mbp}\). Plasmids carry accessory genes (antibiotic resistance, catabolic pathways, virulence). Gene expression is regulated via operons — clusters of genes under a single promoter, such as the \(lac\) operon.

## 4.2 Horizontal Gene Transfer

**Transformation** (uptake of free DNA), **conjugation** (plasmid transfer via pili), and **transduction** (viral-mediated transfer) allow genes to move between lineages. Horizontal gene transfer accelerates adaptation and complicates phylogenetic reconstruction.

## 4.3 Phylogenetic Inference

Phylogenies are reconstructed from conserved gene alignments (classically 16S rRNA) using maximum-likelihood or Bayesian methods. Operational taxonomic units (OTUs) or amplicon sequence variants (ASVs) cluster sequences at a similarity threshold; taxonomy assigns names against curated databases (SILVA, GTDB, Greengenes).

## 4.4 Taxonomy for Engineering

Wastewater engineers care about specific taxa: ammonia oxidizers (Nitrosomonas), nitrite oxidizers (Nitrospira), denitrifiers, polyphosphate-accumulating organisms, methanogens (Methanosaeta, Methanosarcina), filamentous bulking organisms. Knowing who is doing what in a reactor guides troubleshooting and design.

# Chapter 5: Metabolic and Genetic Diversity

## 5.1 Energy Metabolism

Chemoorganotrophs oxidize organic compounds; chemolithotrophs oxidize inorganic electron donors (H\(_2\), NH\(_3\), NO\(_2^-\), Fe\(^{2+}\), S\(^{2-}\)); phototrophs harvest light. Electron acceptors range from O\(_2\) through NO\(_3^-\), Mn(IV), Fe(III), SO\(_4^{2-}\), to CO\(_2\), with standard potentials decreasing in that order. Free-energy yields decline along this series, defining the **redox ladder** observed in aquifers and sediments.

## 5.2 Carbon Metabolism

Glycolysis, the TCA cycle, and oxidative phosphorylation produce ATP and reducing equivalents in aerobic heterotrophs. Fermentation pathways generate ATP under anaerobic conditions, with organic products (lactate, ethanol, acetate, butyrate, H\(_2\), CO\(_2\)) depending on the organism. Methanogenesis from acetate or H\(_2\)/CO\(_2\) completes anaerobic digestion.

## 5.3 Nitrogen Metabolism

**Nitrification** oxidizes ammonia to nitrate in two steps, historically by Nitrosomonas and Nitrobacter, now known also to proceed through comammox Nitrospira. **Denitrification** reduces nitrate to N\(_2\). **Anammox** (anaerobic ammonium oxidation) couples \(\mathrm{NH_4^+}\) and \(\mathrm{NO_2^-}\) to produce N\(_2\), with substantial energy and aeration savings when exploited in partial-nitritation/anammox reactors.

<div class="example">
<strong>Nitrification stoichiometry.</strong> The overall ammonia oxidation reaction <em>NH<sub>4</sub><sup>+</sup> + 2O<sub>2</sub> &rarr; NO<sub>3</sub><sup>-</sup> + H<sub>2</sub>O + 2H<sup>+</sup></em> consumes 4.57 kg O<sub>2</sub> per kg of N oxidized and produces acidity, helping explain both the large aeration demand and the alkalinity loss in biological nitrogen removal.
</div>

# Chapter 6: Genomics, Bioinformatics, and Pathogenesis

## 6.1 Genomics and Metagenomics

Whole-genome sequencing of isolates reveals full metabolic potential. **Metagenomics** sequences community DNA directly, reconstructing metagenome-assembled genomes (MAGs) from environmental samples. **Metatranscriptomics** and **metaproteomics** reveal what genes are expressed.

## 6.2 Bioinformatics Tools

Engineers interact with tools including BLAST (sequence similarity), QIIME 2 and mothur (amplicon analysis), SPAdes and MEGAHIT (assembly), MetaBAT (binning), Prokka (annotation), KEGG (metabolic pathways). Results support rational design of treatment processes, bioaugmentation, and monitoring programs.

## 6.3 Pathogens and Public Health

Water-borne pathogens include bacteria (*Escherichia coli*, *Salmonella*, *Campylobacter*, *Legionella*), viruses (noroviruses, rotaviruses, enteroviruses, SARS-CoV-2 in wastewater surveillance), and protozoan (oo)cysts (*Giardia*, *Cryptosporidium*). Indicator organisms (*E. coli*, enterococci) serve as tractable surrogates for faecal contamination. Disinfection — chlorination, ozonation, UV — and physical removal (filtration, membranes) combine to achieve required log-removal values.

## 6.4 Biofilms and Engineered Communities

Microbes overwhelmingly live attached in **biofilms**, embedded in self-produced extracellular polymeric substances. Biofilms dominate engineered systems: fixed-film biological reactors, biofilters, membrane biofilm reactors, drinking-water distribution surfaces. They confer protection against disinfection and predation, which can be engineered to advantage or represent a treatment challenge.

<div class="remark">
<strong>Microbes as collaborators.</strong> In environmental engineering practice, the competent practitioner designs systems to recruit, cultivate, and direct appropriate microbial communities. That is easier when the designer reads the organisms' biology fluently — their nutrition, redox preferences, kinetics, and genetic repertoire.
</div>

This course lays down the biological literacy needed to engineer with, rather than around, the microbial world that runs the biogeochemistry of our water, air, and soil.
