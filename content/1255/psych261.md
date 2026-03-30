---
title: "PSYCH 261: Physiological Psychology"
prof: Daniel Smilek
subjects: "PSYCH"
---

## Sources and References

**Primary textbook** — Kalat, J. W. (2023). *Biological Psychology*, 14th ed. Cengage Learning.
**Supplementary texts** — Kandel, E. R., Koester, J. D., Mack, S. H., & Siegelbaum, S. A. (2021). *Principles of Neural Science*, 6th ed. McGraw-Hill; Bear, M. F., Connors, B. W., & Paradiso, M. A. (2020). *Neuroscience: Exploring the Brain*, 4th ed. Jones & Bartlett.
**Online resources** — Neuroscience Online (neuroscience.uth.edu); MIT OpenCourseWare 9.01 Neuroscience and Behavior.

---

# Chapter 1: Introduction and History of Physiological Psychology

## 1.1 What is Physiological Psychology?

<div class="definition">
<strong>Physiological psychology</strong> (also called <strong>biological psychology</strong> or <strong>neuroscience</strong>) is the scientific study of how the brain and nervous system generate behaviour, cognition, emotion, and consciousness. It seeks biological explanations for psychological phenomena.
</div>

The field rests on a key assumption: every thought, feeling, and action corresponds to some physical process in the nervous system. This is the **mind–brain identity** position, which holds that mental states are identical to (or at minimum realized by) brain states.

### 1.1.1 The Mind–Body Problem

The philosophical tension between **dualism** (Descartes: mind and body are distinct substances) and **monism** (mind is a product of matter) shaped early science. Modern physiological psychology is thoroughly monist: we assume that explaining brain mechanisms will ultimately explain all psychological phenomena, though the **hard problem of consciousness** — why there is subjective experience at all — remains open.

### 1.1.2 Levels of Analysis

Behaviour can be studied at multiple levels simultaneously:

| Level | Example question |
|-------|-----------------|
| Molecular/cellular | Which ion channels generate the action potential? |
| Synaptic | How does dopamine modulate reward processing? |
| Circuit/systems | What neural circuits control fear responses? |
| Behavioural | Why does stress impair spatial memory? |
| Cognitive/computational | What algorithm does the hippocampus implement? |

Physiological psychology integrates all these levels.

## 1.2 Historical Perspectives

### 1.2.1 Ancient and Classical Views

Early thinkers disagreed on which organ houses the mind. **Aristotle** located the psyche in the heart, viewing the brain as a cooling radiator. **Hippocrates** and **Galen** correctly argued for a cerebral seat of mental function. Galen distinguished sensory from motor nerves and described the ventricles.

**Ventricular hypothesis**: Medieval medicine located the faculties (common sense, imagination, memory) in the cerebral ventricles. The hypothesis persisted until the Renaissance when **Vesalius** (1543) showed through dissection that ventricles are simply fluid-filled spaces.

### 1.2.2 Localization versus Holism

| Position | Representative | Key claim |
|----------|---------------|-----------|
| Strict localization | Franz Josef **Gall** (phrenology, ~1800) | Each mental faculty occupies a distinct brain region; skull bumps reveal character |
| Ablation evidence | Pierre **Flourens** (1820s) | Removing cortical areas in pigeons impaired all functions equally — evidence for holism |
| Clinical localization | Paul **Broca** (1861) | Patient Tan's left frontal lesion → speech production deficit (Broca's area) |
| Clinical localization | Carl **Wernicke** (1874) | Left posterior temporal lesion → speech comprehension deficit (Wernicke's area) |
| Equipotentiality | Karl **Lashley** (1929) | "Law of mass action" — memory impairment proportional to lesion size, not location |

Modern view: the brain is neither strictly localized nor holistic. Distinct regions have specialized roles, but functions emerge from **distributed networks**.

### 1.2.3 The Neuron Doctrine

**Camillo Golgi** (1873) developed the silver stain and initially supported the **reticular theory** (neurons form a continuous network). **Santiago Ramón y Cajal** used the same stain to demonstrate that neurons are discrete cells separated by gaps — the **neuron doctrine**. Both shared the Nobel Prize in 1906 despite holding opposing views.

<div class="remark">
The electron microscope finally confirmed the synaptic cleft (~20 nm) in the 1950s, definitively establishing that neurons do not physically fuse.
</div>

### 1.2.4 Evolution of the Field

- **19th century**: Reflex arc physiology (Sherrington), experimental ablation, case studies.
- **Early 20th century**: Behaviourism dominated psychology; brain mechanisms were bracketed.
- **Mid 20th century**: Single-unit electrophysiology (Hodgkin & Huxley, 1952), psychopharmacology revolution (chlorpromazine, 1952).
- **Late 20th century**: Neuroimaging (CT, PET, fMRI), molecular genetics, optogenetics.
- **21st century**: Connectomics, CRISPR, large-scale neural recording (Neuropixels), neural organoids.

---

# Chapter 2: Neurons, Glia, and the Action Potential

## 2.1 Neuron Structure

<div class="definition">
A <strong>neuron</strong> is an electrically excitable cell specialized for receiving, integrating, and transmitting signals. It consists of: a <strong>soma</strong> (cell body) containing the nucleus; <strong>dendrites</strong> (input processes); an <strong>axon</strong> (output process); and <strong>axon terminals</strong> (presynaptic boutons).
</div>

### 2.1.1 Key Structural Specializations

**Dendritic spines** — small protrusions on dendrites that increase surface area and serve as the postsynaptic site for excitatory synapses. Spine morphology (shape, density) is plastic and changes with learning.

**Axon hillock** — the region where the soma meets the axon; site of action potential initiation because it has the highest density of voltage-gated Na⁺ channels.

**Myelin sheath** — formed by oligodendrocytes (CNS) or Schwann cells (PNS). Wraps around the axon in segments separated by **nodes of Ranvier**. Increases conduction velocity by forcing the action potential to jump between nodes (**saltatory conduction**).

### 2.1.2 Neuron Classification

| By shape | Example |
|----------|---------|
| Multipolar | Motor neurons, most cortical neurons |
| Bipolar | Retinal ganglion cells, auditory neurons |
| Unipolar/pseudounipolar | Sensory neurons in dorsal root ganglia |

| By function | Role |
|-------------|------|
| Sensory (afferent) | Convey information from periphery to CNS |
| Motor (efferent) | Convey commands from CNS to muscles/glands |
| Interneurons | Local processing within CNS (~99% of all neurons) |

## 2.2 Glia

<div class="definition">
<strong>Glial cells</strong> (glia; Greek: "glue") outnumber neurons roughly 1:1 in the human brain and perform essential supportive, metabolic, and signalling functions. Unlike neurons, most glia do not fire action potentials.
</div>

| Cell type | Location | Functions |
|-----------|----------|-----------|
| **Astrocytes** | CNS | Structural support, blood–brain barrier maintenance, glutamate recycling, synaptic modulation |
| **Oligodendrocytes** | CNS | Myelination (one cell myelinates multiple axon segments) |
| **Schwann cells** | PNS | Myelination (one cell per axon segment); guide axon regeneration |
| **Microglia** | CNS | Immune surveillance, phagocytosis of debris and weak synapses (synaptic pruning) |
| **Ependymal cells** | Ventricular walls | Produce and circulate cerebrospinal fluid (CSF) |
| **Radial glia** | Developing brain | Scaffold for neuronal migration; give rise to astrocytes and oligodendrocytes |

<div class="remark">
Astrocytes participate in the <strong>tripartite synapse</strong>: they take up glutamate from the cleft, convert it to glutamine, and return it to the presynaptic terminal — preventing excitotoxicity while sustaining neurotransmitter supply.
</div>

## 2.3 The Resting Membrane Potential

<div class="definition">
The <strong>resting membrane potential</strong> is the electrical potential difference across the neuronal membrane at rest, approximately <strong>−70 mV</strong> (inside negative relative to outside). It arises from the unequal distribution of ions and selective membrane permeability.
</div>

### 2.3.1 Ion Distributions and Driving Forces

| Ion | Intracellular | Extracellular | Equilibrium potential |
|-----|--------------|--------------|----------------------|
| K⁺ | ~140 mM | ~5 mM | −90 mV |
| Na⁺ | ~10 mM | ~145 mM | +60 mV |
| Cl⁻ | ~5–15 mM | ~110 mM | −70 to −80 mV |
| Ca²⁺ | ~0.0001 mM | ~2.5 mM | +125 mV |

The resting potential is set primarily by K⁺ leakage: the membrane is most permeable to K⁺ at rest, so the potential sits close to \( E_{K^+} \approx -90 \, \text{mV} \), but Na⁺ and Cl⁻ permeabilities pull it toward −70 mV.

### 2.3.2 The Sodium–Potassium Pump

The **Na⁺/K⁺-ATPase** actively transports 3 Na⁺ out and 2 K⁺ in per ATP hydrolyzed, generating a small outward current that maintains ion gradients against leakage. Without it, gradients would dissipate and the membrane would depolarize.

## 2.4 The Action Potential

<div class="definition">
An <strong>action potential</strong> is a brief (~1–2 ms), self-regenerating reversal of the membrane potential, during which the membrane rapidly depolarizes to approximately +40 mV and then repolarizes, followed by a brief hyperpolarization (<strong>afterhyperpolarization</strong>). It is the fundamental unit of long-distance neural signalling.
</div>

### 2.4.1 Ionic Mechanism (Hodgkin–Huxley Model, 1952)

1. **Threshold** (~−55 mV): Depolarizing stimuli open some voltage-gated Na⁺ channels. If sufficient current flows, a **positive feedback** loop begins: depolarization → more Na⁺ channels open → more depolarization.
2. **Rising phase**: Massive Na⁺ influx drives the membrane toward \( E_{Na^+} \approx +60 \, \text{mV} \).
3. **Peak** (~+40 mV): Na⁺ channels inactivate (h gate closes) AND voltage-gated K⁺ channels begin to open.
4. **Falling phase**: K⁺ efflux rapidly repolarizes the membrane.
5. **Afterhyperpolarization**: Slow K⁺ channel closure causes brief overshoot below −70 mV.
6. **Refractory periods**: During the **absolute refractory period** (Na⁺ channels inactivated), no stimulus can evoke another AP. During the **relative refractory period**, a stronger-than-normal stimulus is required.

<div class="theorem">
<strong>All-or-None Law:</strong> An action potential either fires at full amplitude or does not fire at all. Stimulus intensity is encoded not in AP amplitude but in <strong>firing rate</strong> (rate coding) and the pattern of active neurons (population coding).
</div>

### 2.4.2 Conduction Velocity

For unmyelinated axons: \( v \propto \sqrt{d} \) where \( d \) is axon diameter. For myelinated axons: saltatory conduction dramatically increases speed — myelinated axons conduct at 70–120 m/s vs. ~0.5–2 m/s for small unmyelinated C fibres.

---

# Chapter 3: The Synapse, Drugs, and Toxins

## 3.1 Synaptic Transmission

<div class="definition">
A <strong>synapse</strong> is a specialized junction between a presynaptic neuron and a postsynaptic cell (neuron, muscle, or gland) at which information is transmitted. <strong>Chemical synapses</strong> use neurotransmitters diffusing across the cleft; <strong>electrical synapses</strong> (gap junctions) allow direct ionic current flow.
</div>

### 3.1.1 Steps in Chemical Synaptic Transmission

1. **AP arrives** at the axon terminal, depolarizing the presynaptic membrane.
2. **Ca²⁺ influx** through voltage-gated Ca²⁺ channels triggers vesicle fusion (via SNARE proteins: synaptobrevin, SNAP-25, syntaxin).
3. **Exocytosis**: Neurotransmitter released into the ~20 nm synaptic cleft.
4. **Receptor binding**: Transmitter binds postsynaptic receptors, generating a postsynaptic potential.
5. **Termination**: Via (a) reuptake transporters, (b) enzymatic degradation, or (c) diffusion.

### 3.1.2 Postsynaptic Potentials

| Type | Mechanism | Effect |
|------|-----------|--------|
| **EPSP** (excitatory postsynaptic potential) | Opening of Na⁺ or Ca²⁺ channels | Depolarization; moves membrane toward threshold |
| **IPSP** (inhibitory postsynaptic potential) | Opening of Cl⁻ channels or K⁺ channels | Hyperpolarization; moves membrane away from threshold |

**Temporal summation**: multiple EPSPs from the same synapse in rapid succession add together. **Spatial summation**: EPSPs from different synapses add simultaneously.

## 3.2 Major Neurotransmitters

| Transmitter | Synthesis precursor | Key pathways | Primary function |
|-------------|--------------------|-----------|--------------------|
| **Glutamate** | Glucose/glutamine | All excitatory CNS synapses | Fast excitation; learning (NMDA receptors) |
| **GABA** | Glutamate (GAD enzyme) | Inhibitory interneurons throughout CNS | Fast inhibition |
| **Dopamine (DA)** | Tyrosine | Mesolimbic, nigrostriatal, mesocortical | Reward, movement, working memory |
| **Serotonin (5-HT)** | Tryptophan | Raphe nuclei → widespread | Mood, appetite, sleep, arousal |
| **Norepinephrine (NE)** | Tyrosine | Locus coeruleus → widespread | Arousal, attention, stress response |
| **Acetylcholine (ACh)** | Choline + acetyl-CoA | NMJ; basal forebrain; autonomic | Movement, memory, autonomic control |
| **Endorphins/Enkephalins** | Pro-opiomelanocortin | Pain modulation circuits | Analgesia, reward |

### 3.2.1 Receptor Types

**Ionotropic receptors** (ligand-gated ion channels): fast (milliseconds). Examples: AMPA, NMDA (glutamate); GABA-A; nAChR; 5-HT₃.

**Metabotropic receptors** (G protein-coupled): slower (seconds to minutes), modulatory. Examples: mGluR; GABA-B; dopamine D1/D2; muscarinic ACh; most serotonin subtypes; adrenergic receptors.

<div class="definition">
<strong>NMDA receptors</strong> are unique: they require simultaneous glutamate binding AND postsynaptic depolarization to remove the Mg²⁺ block from the channel. They are Ca²⁺-permeable and act as <strong>coincidence detectors</strong>, making them central to Hebbian plasticity (long-term potentiation).
</div>

## 3.3 Psychopharmacology

<div class="definition">
<strong>Psychopharmacology</strong> studies how drugs alter brain function and behaviour. Drugs act by modifying synaptic transmission — at the level of synthesis, storage, release, receptor binding, reuptake, or degradation.
</div>

### 3.3.1 Drug Mechanisms

| Drug class | Mechanism | Neurotransmitter affected |
|-----------|-----------|--------------------------|
| **Cocaine, amphetamine** | Block DA/NE/5-HT reuptake (cocaine); reverse transporters (amphetamine) | DA, NE, 5-HT |
| **SSRIs** (e.g., fluoxetine) | Block serotonin reuptake transporter (SERT) | 5-HT |
| **Benzodiazepines** | Positive allosteric modulators at GABA-A receptors (increase Cl⁻ conductance) | GABA |
| **Opioids** (morphine, heroin) | Agonists at μ, δ, κ opioid receptors (Gi-coupled → ↓ cAMP, ↑ K⁺ conductance, ↓ Ca²⁺) | Endogenous opioids |
| **Antipsychotics** (haloperidol) | D2 receptor antagonists | DA |
| **Nicotine** | nAChR agonist | ACh |
| **Alcohol (ethanol)** | Potentiates GABA-A; inhibits NMDA receptors | GABA, glutamate |
| **Caffeine** | Adenosine receptor antagonist | Adenosine (modulates DA/NE) |

### 3.3.2 Tolerance and Dependence

**Tolerance**: reduced drug effect with repeated exposure. Mechanisms include receptor downregulation and compensatory upregulation of opposing systems.

**Physical dependence**: withdrawal symptoms upon cessation reflect rebound of the suppressed system. For opioids: hyperalgesia, anxiety, autonomic storm. For alcohol/benzodiazepines: seizures (rebound CNS hyperexcitability).

### 3.3.3 Toxins

<div class="example">
<strong>Botulinum toxin (BoTox)</strong>: cleaves SNARE proteins (SNAP-25), preventing ACh vesicle fusion at the neuromuscular junction → flaccid paralysis. Therapeutic use: hyperhidrosis, migraine, strabismus.

<strong>Tetrodotoxin (TTX)</strong>: from puffer fish; blocks voltage-gated Na⁺ channels → prevents action potential generation → paralysis.

<strong>Black widow spider venom (α-latrotoxin)</strong>: causes massive ACh release at the NMJ → muscle spasms followed by paralysis.

<strong>Curare</strong>: competitive antagonist at nAChRs at the NMJ → flaccid paralysis. Historical use as an arrow poison.
</div>

---

# Chapter 4: Neuroanatomy — Part 1 (Spinal Cord, Brainstem, Diencephalon)

## 4.1 Organizational Principles

The CNS is organized **caudal to rostral** (spinal cord → brainstem → diencephalon → telencephalon) and **ventral to dorsal** in the spinal cord. **Hierarchical processing** characterizes sensory and motor pathways — each level adds refinement and modulation.

<div class="definition">
<strong>Neuroanatomical axes:</strong> Rostral/caudal (toward head/tail), dorsal/ventral (toward back/belly), medial/lateral (toward midline/sides), ipsilateral/contralateral (same side/opposite side).
</div>

## 4.2 Spinal Cord

The spinal cord relays sensory information to the brain and motor commands to the body, and mediates local reflexes.

**Grey matter** (central butterfly): contains neuron cell bodies. The **dorsal horn** receives sensory input; the **ventral horn** contains motor neurons.

**White matter** (surrounding tracts): myelinated axons organized into ascending (sensory) and descending (motor) tracts.

Key tracts:
- **Dorsal columns** (fasciculus gracilis/cuneatus): fine touch, vibration, proprioception → ascend ipsilaterally, cross in medulla.
- **Spinothalamic tract**: pain, temperature, crude touch → cross near entry level, ascend contralaterally.
- **Corticospinal tract**: voluntary motor control → crosses at the pyramidal decussation in medulla.

**Spinal reflexes**: the stretch reflex (knee jerk) involves monosynaptic excitation of motor neurons by Ia afferents from muscle spindles. The **withdrawal (flexor) reflex** involves polysynaptic circuits and reciprocal inhibition.

## 4.3 Brainstem

The brainstem (medulla oblongata, pons, midbrain) contains **12 cranial nerve nuclei**, major ascending and descending tracts, and critical life-support centers.

### 4.3.1 Medulla Oblongata

Controls breathing (**dorsal respiratory group**, **ventral respiratory group**), heart rate (**cardiovascular center**), vomiting, and swallowing. Cranial nerves IX (glossopharyngeal), X (vagus), XI (accessory), XII (hypoglossal).

### 4.3.2 Pons

Contains nuclei for cranial nerves V (trigeminal), VI (abducens), VII (facial), VIII (vestibulocochlear). The **locus coeruleus** (in pons) is the primary noradrenergic nucleus projecting throughout the brain. The pons participates in REM sleep generation via the **pontine REM-on nuclei** (cholinergic).

### 4.3.3 Midbrain (Mesencephalon)

- **Superior colliculi**: visuomotor reflexes (orienting to visual stimuli).
- **Inferior colliculi**: auditory relay; reflexive orienting to sounds.
- **Substantia nigra pars compacta**: dopaminergic neurons projecting to the striatum (nigrostriatal pathway); degenerate in Parkinson's disease.
- **Ventral tegmental area (VTA)**: dopaminergic neurons of the mesolimbic and mesocortical pathways; reward, motivation.
- **Periaqueductal grey (PAG)**: pain modulation via descending opioid circuits.
- **Red nucleus**: motor coordination.

### 4.3.4 Reticular Formation

A diffuse network running through the brainstem core. Key functions:
- **Ascending reticular activating system (ARAS)**: maintains arousal and consciousness. Damage → coma.
- **Raphe nuclei**: primary source of serotonergic projections to cortex, limbic system, and spinal cord.
- **Motor pattern generation**: for locomotion, breathing.

## 4.4 Diencephalon

### 4.4.1 Thalamus

<div class="definition">
The <strong>thalamus</strong> is the primary relay station for all sensory information (except olfaction) en route to the cortex. It also modulates cortical arousal and consciousness.
</div>

| Thalamic nucleus | Input | Output (cortical destination) |
|-----------------|-------|-------------------------------|
| Lateral geniculate nucleus (LGN) | Optic tract | Primary visual cortex (V1) |
| Medial geniculate nucleus (MGN) | Inferior colliculus | Primary auditory cortex (A1) |
| Ventral posterior lateral (VPL) | Spinothalamic/dorsal column | Primary somatosensory cortex (S1) |
| Ventral anterior/lateral (VA/VL) | Cerebellum, basal ganglia | Motor and premotor cortex |
| Mediodorsal (MD) | Amygdala, brainstem | Prefrontal cortex |
| Anterior nuclei | Mammillary bodies | Cingulate cortex (Papez circuit) |
| Pulvinar | Superior colliculus | Association cortex |
| Reticular nucleus | Cortex | Other thalamic nuclei (inhibitory gating) |

### 4.4.2 Hypothalamus

<div class="definition">
The <strong>hypothalamus</strong> (below the thalamus) is a small but critical structure that regulates homeostasis, the autonomic nervous system, and the endocrine system via the pituitary gland. It links the nervous and endocrine systems.
</div>

Key functions:
- **Temperature regulation**: preoptic area contains thermosensors; fever is mediated by prostaglandins acting here.
- **Hunger/satiety**: lateral hypothalamus (LH) — "hunger center"; ventromedial hypothalamus (VMH) — "satiety center" (lesion → hyperphagia).
- **Circadian rhythms**: **suprachiasmatic nucleus (SCN)** is the master circadian pacemaker, receiving direct retinal input via the retinohypothalamic tract.
- **Stress response**: paraventricular nucleus releases CRH → pituitary → ACTH → adrenal cortex → cortisol.
- **Reproduction/sexual behaviour**: sexually dimorphic nuclei; releases GnRH.
- **Autonomic control**: anterior hypothalamus → parasympathetic; posterior/lateral → sympathetic.

---

# Chapter 5: Neuroanatomy — Part 2 (Telencephalon) and Research Methods

## 5.1 Cerebral Cortex

The cortex is a 2–4 mm thick sheet of grey matter, heavily folded into **gyri** (ridges) and **sulci** (grooves) to fit within the skull. Total surface area ~2,500 cm².

### 5.1.1 Lobes and Primary Areas

| Lobe | Location | Primary area | Key functions |
|------|----------|-------------|---------------|
| **Frontal** | Anterior to central sulcus | Primary motor cortex (M1) | Voluntary movement, planning, working memory, personality |
| **Parietal** | Behind central sulcus | Primary somatosensory cortex (S1) | Touch, proprioception, spatial processing |
| **Temporal** | Lateral, below lateral fissure | Primary auditory cortex (A1) | Hearing, language comprehension, face recognition, memory |
| **Occipital** | Posterior | Primary visual cortex (V1) | Vision |
| **Insular cortex** | Deep to lateral fissure | — | Interoception, pain, taste, emotional processing |

### 5.1.2 Cortical Layers and Cell Types

The neocortex has **6 layers** (I–VI):

| Layer | Name | Cell types | Connections |
|-------|------|-----------|------------|
| I | Molecular | Sparse cells, apical dendrites | Corticocortical |
| II | External granular | Small pyramidal + stellate | Corticocortical (input/output) |
| III | External pyramidal | Medium pyramidal | Corticocortical |
| IV | Internal granular | Stellate (spiny) | **Thalamic input** (primary sensory areas) |
| V | Internal pyramidal | **Large Betz pyramidal cells** | Subcortical output (M1 → spinal cord) |
| VI | Multiform | Mixed | Feedback to thalamus |

### 5.1.3 Cortical Organization

- **Somatotopic** organization in S1 and M1: body surface mapped systematically (**homunculus**). Area devoted is proportional to sensitivity/dexterity, not body size (large hands and lips).
- **Tonotopic** organization in A1: neurons tuned to different frequencies arranged in order.
- **Retinotopic** organization in V1: visual field mapped spatially.
- **Columns**: functional units perpendicular to surface (ocular dominance columns in V1; orientation columns).

### 5.1.4 Cortical Asymmetries

- **Left hemisphere**: typically dominant for language (Broca's area — left inferior frontal gyrus; Wernicke's area — left superior temporal gyrus) and analytical reasoning.
- **Right hemisphere**: dominant for spatial processing, emotional tone in speech (prosody), face recognition.
- **Corpus callosum**: ~200 million axons connecting the two hemispheres. Split-brain studies (Sperry & Gazzaniga) revealed independent hemisphere functions.

## 5.2 Basal Ganglia

<div class="definition">
The <strong>basal ganglia</strong> are a group of subcortical nuclei (caudate, putamen, nucleus accumbens, globus pallidus, subthalamic nucleus, substantia nigra) that modulate movement, habit learning, and reward.
</div>

**Striatum** (caudate + putamen + nucleus accumbens): primary input nucleus; receives cortical glutamatergic input and dopaminergic input from substantia nigra/VTA.

**Direct pathway** (via GPi/SNr → thalamus): facilitates desired movements.
**Indirect pathway** (via GPe → STN → GPi/SNr → thalamus): suppresses competing movements.

Dopamine from SNc facilitates direct and inhibits indirect → net disinhibition of thalamus → movement initiation.

**Clinical relevance**:
- **Parkinson's disease**: loss of dopaminergic neurons in substantia nigra → reduced direct pathway, increased indirect → difficulty initiating movement (bradykinesia, rigidity, resting tremor).
- **Huntington's disease**: degeneration of striatal neurons → loss of indirect pathway inhibition → involuntary choreic movements.

## 5.3 Limbic System

<div class="definition">
The <strong>limbic system</strong> is a set of interconnected structures (hippocampus, amygdala, cingulate cortex, hypothalamus, thalamic nuclei) involved in emotion, motivation, and memory.
</div>

- **Hippocampus**: spatial navigation, episodic memory consolidation. Patient H.M. (bilateral hippocampectomy) could not form new declarative memories but retained procedural memory.
- **Amygdala**: threat appraisal, fear conditioning, emotional enhancement of memory. Fear conditioning requires the **basolateral amygdala**; fear expression requires the **central nucleus**.
- **Cingulate cortex**: anterior cingulate — conflict monitoring, pain; posterior cingulate — default mode, episodic memory retrieval.

## 5.4 Cerebellum

The cerebellum (~80 billion neurons, more than the rest of the brain combined) fine-tunes motor coordination, timing, and procedural learning.

**Inputs**: motor cortex (efference copy via pontine nuclei), sensory feedback (spinocerebellar tracts), vestibular system.
**Outputs**: via deep cerebellar nuclei (dentate, interposed, fastigial) → thalamus → motor cortex.

**Cerebellar damage** (ipsilateral): ataxia (uncoordinated movement), dysmetria (misjudging distance), intention tremor (oscillation during targeted movement), dysdiadochokinesia (inability to perform rapid alternating movements).

## 5.5 Research Methods in Physiological Psychology

### 5.5.1 Lesion Methods

**Ablation studies**: surgical removal of tissue. Limited by inability to isolate structures and by compensatory plasticity.

**Selective lesions**: chemical lesions (ibotenic acid destroys cell bodies sparing axons of passage), neurotoxin-specific lesions (6-OHDA selectively destroys catecholaminergic neurons).

**Clinical lesions**: neuropsychological analysis of patients with strokes, tumours, injuries. Limitation: lesions are rarely circumscribed; cannot infer function from deficit alone.

### 5.5.2 Electrophysiology

- **Single-unit recording**: a fine electrode records one neuron's action potentials; reveals receptive fields and tuning properties (Hubel & Wiesel, 1959, V1).
- **Multi-electrode arrays**: simultaneous recording from hundreds of neurons.
- **Electroencephalography (EEG)**: scalp electrodes record summed synaptic potentials; high temporal resolution (ms), low spatial resolution; used to measure event-related potentials (ERPs), sleep stages, seizures.

### 5.5.3 Neuroimaging

| Technique | What it measures | Spatial res. | Temporal res. | Notes |
|-----------|-----------------|-------------|--------------|-------|
| **CT** | X-ray density | ~1 mm | Minutes | Anatomical; good for bleeds, bone |
| **MRI** | Magnetic resonance of H nuclei | <1 mm | Minutes | Superior soft tissue contrast |
| **fMRI** | BOLD signal (oxyhaemoglobin) | ~3 mm | Seconds | Indirect measure of neural activity; metabolic demand |
| **PET** | Radiotracer uptake | ~5 mm | Minutes | Can measure specific receptors/transmitters |
| **DTI** | Water diffusion anisotropy | ~1 mm | — | White matter tract mapping |
| **MEG** | Magnetic fields from neural currents | ~5 mm | ms | Better spatial res. than EEG |

### 5.5.4 Stimulation Methods

**Transcranial Magnetic Stimulation (TMS)**: non-invasive magnetic pulse temporarily disrupts or activates a cortical region; creates a "virtual lesion."

**Transcranial Direct Current Stimulation (tDCS)**: weak constant current modulates cortical excitability.

**Deep Brain Stimulation (DBS)**: chronically implanted electrode; treats Parkinson's, OCD, depression. Mechanism: probably suppresses pathological oscillations.

**Optogenetics**: light-activated ion channels (channelrhodopsin) expressed in genetically targeted neurons; allows millisecond-precise activation/inhibition. Gold standard for causal circuit dissection in animal models.

---

# Chapter 6: Neurodevelopment

## 6.1 Stages of Brain Development

Brain development proceeds through a programmed sequence, each stage having critical windows when environmental experience is particularly important.

### 6.1.1 Neurulation and Neural Tube Formation

At ~3 weeks gestation, the **neural plate** folds to form the **neural tube** (CNS) and **neural crest** (PNS, melanocytes, adrenal medulla). Failure of closure → **neural tube defects** (spina bifida, anencephaly). Folic acid supplementation during pregnancy reduces risk.

### 6.1.2 Neuronal Proliferation and Migration

**Neurogenesis**: occurs primarily in the **ventricular zone** lining the neural tube. Neurons are born in waves following an **inside-out** gradient in the cortex (early-born neurons form deep layers; late-born neurons migrate past them to form superficial layers).

**Radial migration**: along radial glial processes. Disrupted by reelin gene mutations → **lissencephaly** (smooth cortex, seizures).

### 6.1.3 Differentiation, Axon Guidance, and Synaptogenesis

Axons are guided by chemoattractants (**netrins**, **Slit proteins**) and chemorepellents to reach target regions. **Growth cones** at axon tips explore the environment via filopodia.

**Synaptogenesis** peaks prenatally and in the first postnatal years, generating an excess of synapses.

### 6.1.4 Programmed Cell Death and Synaptic Pruning

**Apoptosis**: ~50% of neurons die during development via competition for **neurotrophic factors** (e.g., **NGF**, **BDNF**). Neurons that successfully innervate targets receive sufficient trophic support to survive.

**Synaptic pruning**: elimination of excess synapses, refinement of connectivity. In visual cortex, pruning is experience-dependent — active synapses are stabilized, inactive synapses eliminated ("use it or lose it"). Microglia participate actively in synaptic pruning via complement-mediated phagocytosis.

## 6.2 Critical Periods

<div class="definition">
A <strong>critical period</strong> is a developmental window during which the brain is especially sensitive to specific environmental inputs that are necessary for normal development. Deprivation during this period can cause lasting deficits.
</div>

**Visual critical period**: ocular dominance plasticity. Monocular deprivation (Hubel & Wiesel) during the critical period → permanent loss of cortical representation of the deprived eye. After the critical period closes, similar deprivation has minimal effect. Reopening the critical period in adults is an active research goal (perineuronal nets, GABA signalling).

**Language**: children learn language easily before puberty; second-language acquisition with native-like accent becomes progressively harder after ~7 years (Lenneberg's critical period hypothesis).

## 6.3 Effects of Teratogens

**Teratogens** are agents that disrupt prenatal brain development:
- **Fetal alcohol spectrum disorders (FASD)**: alcohol inhibits NMDA receptors and potentiates GABA-A → massive apoptosis during synaptogenesis; microencephaly, intellectual disability, impaired executive function.
- **Rubella virus**: first-trimester infection → deafness, visual defects, intellectual disability.
- **Cocaine**: restricts blood flow, disrupts monoamine systems; attention deficits, impaired executive function in children.
- **Maternal stress**: elevated cortisol crosses placenta; alters HPA axis set-point in offspring.

---

# Chapter 7: Neuroplasticity

## 7.1 Synaptic Plasticity

<div class="definition">
<strong>Synaptic plasticity</strong> refers to activity-dependent changes in the strength of synaptic connections. It is considered the cellular basis of learning and memory.
</div>

### 7.1.1 Long-Term Potentiation (LTP)

<div class="definition">
<strong>Long-term potentiation (LTP)</strong> is a long-lasting strengthening of a synapse following high-frequency stimulation. It was first described by Bliss and Lømo (1973) in the hippocampus.
</div>

**Early LTP induction**:
1. High-frequency stimulation releases glutamate.
2. AMPA receptor activation depolarizes the postsynaptic membrane.
3. Depolarization expels the Mg²⁺ block from NMDA receptors.
4. Ca²⁺ enters through NMDA receptors → activates **CaMKII**.
5. CaMKII phosphorylates AMPA receptors (increasing conductance) and triggers trafficking of new AMPA receptors to the synapse.

**Late LTP** (protein synthesis-dependent, hours to days): requires gene transcription and new protein synthesis; associated with structural changes in dendritic spines.

**Hebbian learning rule**: "neurons that fire together, wire together" — the NMDA receptor embodies this as a molecular coincidence detector.

### 7.1.2 Long-Term Depression (LTD)

Low-frequency stimulation or asynchronous activity → modest Ca²⁺ rise → activation of phosphatases → AMPA receptor dephosphorylation and internalization → weakened synapse. Important for synaptic competition and memory specificity.

## 7.2 Structural Plasticity

### 7.2.1 Dendritic Spine Remodeling

Spines grow, retract, and change shape over hours. **LTP** is associated with spine enlargement and the formation of new spines; **LTD** with spine shrinkage. Live imaging in behaving animals shows dramatic spine turnover in motor learning.

### 7.2.2 Adult Neurogenesis

New neurons are born throughout adulthood in two regions:
1. **Hippocampal dentate gyrus** (subgranular zone, SGZ): new granule cells integrate into hippocampal circuits; linked to pattern separation, mood regulation. Enhanced by exercise and enriched environment; reduced by stress and aging.
2. **Olfactory bulb** (subventricular zone, SVZ → rostral migratory stream): new interneurons.

### 7.2.3 Cortical Map Plasticity

The cortex continually reorganizes based on use. Classic demonstrations:
- **Merzenich**: after amputation, the somatosensory cortex zone for the lost limb is taken over by adjacent representations (phantom limb pain may reflect this maladaptive remapping).
- **String musicians**: the cortical representation of the left hand fingers is expanded compared to non-musicians.

## 7.3 Recovery of Function After Brain Injury

Following stroke or traumatic brain injury (TBI), several mechanisms support recovery:
- **Resolution of diaschisis**: initial suppression of distant brain areas by the lesion resolves.
- **Collateral sprouting**: intact axons grow new branches to reinnervate partially denervated target.
- **Unmasking of latent connections**: unused synapses become active.
- **Cortical remapping**: adjacent cortical regions take over functions of damaged areas (enhanced with rehabilitation).
- **Neurogenesis**: limited endogenous neurogenesis; research aim is to promote it therapeutically.

---

# Chapter 8: Vision

## 8.1 The Eye and Retinal Transduction

### 8.1.1 Eye Anatomy

Light passes through: **cornea** → **pupil** (controlled by iris) → **lens** (adjustable, **accommodation**) → **vitreous humour** → **retina**.

The **fovea** (centre of vision) is packed with cones and has a 1:1 ratio with retinal ganglion cells → highest acuity.

### 8.1.2 Photoreceptors

| Type | Number | Distribution | Sensitivity | Function |
|------|--------|-------------|-----------|---------|
| **Rods** | ~120 million | Peripheral retina | High (scotopic) | Night vision, motion, black/white |
| **Cones** | ~6 million | Fovea | Lower (photopic) | Colour, detail, bright-light vision |

**Colour vision**: three cone types with peak sensitivities at ~420 nm (S, blue), ~530 nm (M, green), ~560 nm (L, red). **Trichromacy** (Young–Helmholtz). **Colour opponency** (Hering): downstream processing into R–G and B–Y opponent channels.

### 8.1.3 Phototransduction (Rods)

1. **Rhodopsin** in outer segment disk membrane absorbs a photon.
2. **Retinal** changes from 11-*cis* to all-*trans* → activates **transducin** (G protein).
3. Activated transducin activates **phosphodiesterase (PDE)**.
4. PDE hydrolyzes **cGMP** → cGMP concentration falls.
5. cGMP-gated Na⁺/Ca²⁺ channels close → **hyperpolarization** (unique: photoreceptors hyperpolarize in response to light).
6. Reduced glutamate release onto bipolar cells.

## 8.2 Retinal Processing

**Vertical pathway**: photoreceptors → **bipolar cells** → **retinal ganglion cells (RGCs)**.

**Lateral pathways**: **horizontal cells** (photoreceptor-bipolar interaction) and **amacrine cells** (bipolar-RGC interaction) create **centre-surround receptive fields**.

**ON-centre RGCs**: excited by light in centre, inhibited by light in surround (mediated by ON-bipolar cells via mGluR6 → metabotropic → hyperpolarize without light).
**OFF-centre RGCs**: the reverse.

### 8.2.1 Parallel Channels

| Channel | Cell type | Properties | Carries |
|---------|-----------|-----------|---------|
| **P (parvo)** | Small soma, slow | Colour, fine detail | Form, colour |
| **M (magno)** | Large soma, fast | High contrast sensitivity, motion | Motion, depth |
| **K (konio)** | Intermediate | Colour/luminance | Colour signals to V1 layer 1 |

## 8.3 Central Visual Pathways

RGC axons form the **optic nerve** → **optic chiasm** (nasal fibres cross, temporal fibres stay) → **optic tract** (carries contralateral visual field from both eyes) → **lateral geniculate nucleus (LGN)** of thalamus → **primary visual cortex (V1, striate cortex)**.

A separate path goes to the **superior colliculus** (reflexive visual orienting, eye movements).

<div class="definition">
<strong>Topographic representation</strong>: the left visual hemifield is represented in the right hemisphere and vice versa, due to the partial decussation at the optic chiasm.
</div>

## 8.4 Cortical Visual Processing

**V1 (primary visual cortex)**: responds to oriented line segments, spatial frequency, ocular dominance, direction of motion. Organized in **orientation columns** and **ocular dominance columns**.

**Two-stream hypothesis** (Ungerleider & Mishkin):
- **Ventral ("what") stream**: V1 → V2 → V4 → **inferior temporal cortex (IT)**. Object recognition, face processing, colour. Lesion → **visual agnosia**, **prosopagnosia**.
- **Dorsal ("where/how") stream**: V1 → V2 → V5/MT → **posterior parietal cortex**. Spatial location, motion, visually guided action. Lesion → **optic ataxia**, **hemispatial neglect**.

---

# Chapter 9: Audition, Temperature, Touch, and Pain

## 9.1 Auditory System

### 9.1.1 Physical Properties of Sound

Sound is a pressure wave. **Frequency** (Hz) → perceived pitch; **amplitude** (dB SPL) → perceived loudness; **waveform complexity** → perceived timbre.

**Audible range**: ~20–20,000 Hz in humans. **Threshold of hearing**: 0 dB SPL (reference: 20 μPa at 1 kHz).

### 9.1.2 The Ear

**Outer ear**: pinna collects sound → external auditory canal → **tympanic membrane** vibrates.

**Middle ear**: three **ossicles** (malleus, incus, stapes) amplify and transmit vibrations (~30 dB gain); the oval window couples to the cochlea. The **stapedius reflex** (contraction of stapedius muscle) attenuates loud sounds.

**Inner ear**: **cochlea** (fluid-filled, 2.5 turns). The **basilar membrane** vibrates with frequency-specific peaks (**place code**): high frequencies → base; low frequencies → apex (**tonotopy**).

### 9.1.3 Hair Cell Transduction

**Inner hair cells** (IHCs, ~3,500): the primary auditory sensory cells; deflection of **stereocilia** opens tip-link **mechanosensitive channels** → K⁺ influx → depolarization → Ca²⁺-triggered glutamate release onto auditory nerve fibres (CN VIII).

**Outer hair cells** (OHCs, ~12,000): amplify basilar membrane motion via **electromotility** (prestin protein changes length in response to voltage) → active cochlear amplification (otoacoustic emissions).

### 9.1.4 Central Auditory Pathway

Cochlear nuclei (medulla) → **superior olivary complex** (binaural processing, sound localization) → **inferior colliculus** (midbrain) → **medial geniculate nucleus** (MGN) of thalamus → **primary auditory cortex (A1)**.

Sound localization uses **interaural time differences** (ITDs; low frequency) and **interaural level differences** (ILDs; high frequency).

## 9.2 Somatosensory System: Touch and Proprioception

**Mechanoreceptors** in skin:
- **Meissner's corpuscles**: fingertips; rapid adaptation; texture, grip.
- **Merkel's discs**: slow adaptation; fine spatial detail, sustained pressure.
- **Ruffini endings**: slow adaptation; skin stretch.
- **Pacinian corpuscles**: deep; rapid adaptation; vibration, flutter.

**Proprioceptors**:
- **Muscle spindles** (Ia fibres): muscle length and rate of length change.
- **Golgi tendon organs** (Ib fibres): muscle tension.
- **Joint receptors**: joint angle.

**Pathway**: peripheral afferents → dorsal root ganglion → dorsal columns → **cuneate/gracile nuclei** (medulla) → **medial lemniscus** (crosses at medulla) → **VPL thalamus** → **somatosensory cortex (S1)**.

## 9.3 Pain

<div class="definition">
<strong>Nociception</strong> is the neural encoding of tissue-damaging or potentially damaging stimuli. <strong>Pain</strong> is the subjective experience; it is not simply a linear readout of nociceptor activity but is modulated by context, attention, emotion, and cognition.
</div>

**Nociceptors**: free nerve endings; respond to extreme mechanical, thermal, or chemical stimuli. **Aδ fibres**: myelinated; fast, sharp pain. **C fibres**: unmyelinated; slow, burning, dull pain.

**Spinothalamic tract**: carries pain and temperature; crosses at the spinal level.

### 9.3.1 Gate Control Theory (Melzack & Wall, 1965)

Activity in large-diameter mechanoreceptive fibres (Aβ) activates spinal inhibitory interneurons that "close the gate" to pain signals from small-diameter fibres (Aδ, C). This explains why rubbing an injury reduces pain.

### 9.3.2 Descending Pain Modulation

The **PAG–rostral ventromedial medulla (RVM)–spinal cord** pathway modulates pain transmission. Opioids, serotonin, and norepinephrine mediate analgesia in this circuit. Explains stress-induced analgesia, placebo effect.

**Endorphins**: endogenous opioid peptides (β-endorphin, enkephalins, dynorphins) act on μ, δ, κ receptors.

## 9.4 Temperature Sensation

**Thermoreceptors**: TRP channel family:
- **TRPV1**: activated by temperatures >43°C and by capsaicin (chilli peppers) → burning sensation.
- **TRPM8**: activated by temperatures <25°C and by menthol → cool sensation.

Temperature signals travel via C fibres and Aδ fibres in the spinothalamic tract to the VPM thalamus and then insula/anterior cingulate.

---

# Chapter 10: Sleep

## 10.1 Sleep Architecture

<div class="definition">
<strong>Sleep</strong> is a reversible, behaviourally quiescent state with characteristic EEG changes, reduced responsiveness to external stimuli, and active consolidation of memories and restoration of metabolic resources.
</div>

Sleep is divided into **NREM** (non-rapid eye movement) and **REM** (rapid eye movement) stages:

| Stage | EEG pattern | Physiology | Notes |
|-------|-------------|-----------|-------|
| **NREM Stage 1** | Theta (4–8 Hz) | Light sleep; hypnic jerks | Brief; transition |
| **NREM Stage 2** | Theta + **sleep spindles** (12–15 Hz) + **K-complexes** | Muscle relaxation | Largest proportion of sleep |
| **NREM Stage 3** | **Delta** (0.5–2 Hz, >20%) | **Slow-wave sleep (SWS)**: deep, restorative | Growth hormone release; memory consolidation |
| **REM** | **Desynchronized** (low-amplitude, mixed frequency); sawtooth waves | **Atonia** (brainstem inhibits spinal motor neurons); PGO waves; vivid dreams | Emotional memory processing; synaptic downscaling hypothesis |

A typical night consists of 4–6 **90-minute cycles**, with more SWS early and more REM late.

## 10.2 Neural Regulation of Sleep and Wakefulness

### 10.2.1 Arousal Systems

Multiple ascending systems promote waking:
- **Locus coeruleus** (NE) → cortex/hippocampus.
- **Raphe nuclei** (5-HT) → forebrain.
- **Basal forebrain** (ACh) → cortex.
- **Tuberomammillary nucleus** (histamine, TMN) → widespread. Antihistamines cause drowsiness by blocking this.
- **Orexin/Hypocretin neurons** (lateral hypothalamus) → reinforce all arousal systems; loss → **narcolepsy**.

### 10.2.2 Sleep-Promoting Mechanisms

**Ventrolateral preoptic nucleus (VLPO)**: GABAergic/galaninergic neurons suppress all arousal systems during sleep. A **flip-flop switch** model (Saper et al.) describes mutual inhibition between VLPO (sleep) and TMN/LC/raphe (wake): the system is bistable, with rapid transitions.

**Adenosine**: accumulates during waking (from ATP hydrolysis); acts on A1/A2A receptors in basal forebrain → promotes sleep (sleep pressure). Caffeine blocks adenosine receptors → reduced sleep pressure.

**Circadian clock**: the SCN drives a ~24-hour rhythm of sleep propensity, body temperature, cortisol, and melatonin release, independent of sleep pressure. Melatonin from the **pineal gland** (released in darkness) signals the circadian phase to peripheral tissues.

## 10.3 Functions of Sleep

- **Memory consolidation**: SWS reactivates hippocampal memories and transfers them to cortex (systems consolidation); REM may consolidate procedural and emotional memories.
- **Synaptic homeostasis hypothesis (Tononi & Cirelli)**: wake is associated with net synaptic potentiation; sleep (especially SWS) downscales synapses to basal levels — reducing metabolic cost and improving signal-to-noise.
- **Metabolic waste clearance**: the **glymphatic system** (CSF flowing along perivascular spaces) is most active during sleep; clears amyloid-β, tau, and other metabolites. Disrupted sleep → amyloid accumulation → Alzheimer's risk.
- **Immune function, growth, tissue repair**: growth hormone peaks during SWS; immune cytokines are modulated by sleep.

## 10.4 Sleep Disorders

| Disorder | Description | Mechanism |
|---------|-------------|-----------|
| **Insomnia** | Difficulty falling/staying asleep | Hyperarousal; cognitive rumination |
| **Sleep apnea** | Repeated cessation of breathing | Upper airway collapse (obstructive) or central drive failure; treatment: CPAP |
| **Narcolepsy** | Excessive daytime sleepiness, cataplexy, sleep paralysis, hypnagogic hallucinations | Loss of orexin neurons (autoimmune) |
| **REM sleep behaviour disorder (RBD)** | Acting out dreams (absence of REM atonia) | Brainstem lesions; early marker of Parkinson's/Lewy body dementia |
| **Sleepwalking/night terrors** | NREM Stage 3 parasomnias | Incomplete arousal from SWS |

---

# Chapter 11: Emotion and Mood Disorders

## 11.1 Neural Substrates of Emotion

<div class="definition">
<strong>Emotion</strong> involves coordinated physiological, behavioural, and subjective responses to stimuli of significance to the organism. <strong>Affect</strong> refers to the broader category including both emotion and mood.
</div>

### 11.1.1 The Limbic System and Emotion

The **Papez circuit** (1937): hippocampus → fornix → mammillary bodies → anterior thalamus → cingulate cortex → back to hippocampus. Originally proposed as the emotion circuit; now understood as primarily a memory circuit, but cingulate and amygdala are key for emotion.

### 11.1.2 The Amygdala

<div class="definition">
The <strong>amygdala</strong> (Latin: almond) is an almond-shaped structure in the medial temporal lobe, essential for processing emotionally significant stimuli, particularly threats, and for emotional enhancement of memory.
</div>

**Fear conditioning** (LeDoux): CS (tone) → auditory thalamus/cortex → **lateral nucleus** of amygdala (CS-US association); **central nucleus** → lateral hypothalamus (autonomic: HR ↑, BP ↑), PAG (freezing behaviour), bed nucleus of the stria terminalis (sustained anxiety).

Two routes to the amygdala:
- **"Low road"** (fast, unconscious): thalamus → amygdala; bypasses cortex for rapid response.
- **"High road"** (slower, context-sensitive): thalamus → cortex → amygdala; allows fine-grained evaluation.

**Klüver–Bucy syndrome** (bilateral temporal lobectomy in monkeys, including amygdala): loss of fear, hypersexuality, oral exploration, visual agnosia ("psychic blindness").

## 11.2 Stress and the HPA Axis

**Acute stress response**: stressor → amygdala → hypothalamus → sympathetic activation (fight-or-flight); also CRH → pituitary → ACTH → adrenal cortex → **cortisol** release.

Cortisol: increases blood glucose, suppresses immune function, mobilizes fat. **Glucocorticoid receptors** in hippocampus, amygdala, and PFC provide negative feedback. Chronic stress → hippocampal dendritic atrophy (mediated by excess cortisol); enhanced amygdala reactivity.

## 11.3 Major Depressive Disorder (MDD)

<div class="definition">
<strong>Major depressive disorder</strong> is characterized by persistent low mood, anhedonia, fatigue, cognitive impairment, sleep/appetite disturbances, and feelings of worthlessness, lasting ≥2 weeks and causing functional impairment.
</div>

### 11.3.1 Monoamine Hypothesis

The classic hypothesis: depression results from deficiency of monoamines (especially serotonin, norepinephrine, dopamine). Evidence: SSRIs/SNRIs/MAOIs are effective antidepressants; reserpine (depletes monoamines) can cause depression.

Limitations: antidepressants increase monoamine levels within hours, but therapeutic effects take weeks → monoamine depletion is not the whole story. Focus has shifted to **neuroplasticity** and **BDNF**.

### 11.3.2 Neuroplasticity Hypothesis

Chronic stress and depression → decreased BDNF, hippocampal atrophy. Antidepressants → increased BDNF, neurogenesis in dentate gyrus (required for antidepressant effect in rodents). **Ketamine** (NMDA antagonist): rapid antidepressant effect via burst of AMPA activation and BDNF release — suggests synaptogenesis is key.

### 11.3.3 HPA Axis Dysregulation

Many depressed patients show hypercortisolism, impaired dexamethasone suppression, and reduced hippocampal volume.

### 11.3.4 Treatments

| Treatment | Mechanism | Notes |
|-----------|-----------|-------|
| SSRIs (fluoxetine, sertraline) | Block SERT | First-line; 2–4 week onset; sexual side effects |
| SNRIs (venlafaxine, duloxetine) | Block SERT + NET | Useful for pain comorbidity |
| MAOIs (phenelzine) | Block MAO enzyme | Tyramine interaction; used when others fail |
| Tricyclics (amitriptyline) | Block SERT + NET + multiple receptors | Older; anticholinergic side effects |
| **Ketamine/esketamine** | NMDA antagonist → rapid AMPA/BDNF surge | Hours onset; treatment-resistant depression |
| Electroconvulsive therapy (ECT) | Seizure induction; mechanism unclear | Effective for severe/refractory MDD; memory side effects |
| Psychotherapy (CBT) | Cognitive reappraisal, behavioural activation | Comparable efficacy to medication; combined is best |

## 11.4 Bipolar Disorder

**Bipolar I**: full manic episodes (elevated/irritable mood, decreased sleep need, grandiosity, impulsivity, pressured speech, racing thoughts); depressive episodes. **Bipolar II**: hypomania + major depression.

**Neural basis**: amygdala hyperreactivity; reduced PFC regulation; altered circadian rhythms; mitochondrial dysfunction. Genetic contribution: ~80% heritability.

**Treatment**: **lithium** (gold standard mood stabilizer; mechanism: inhibits inositol monophosphatase and GSK-3β; also increases BDNF); **valproate** and **lamotrigine** (anticonvulsants); atypical antipsychotics for mania.

---

# Chapter 12: Memory and Learning

## 12.1 Memory Systems

<div class="definition">
Memory is not a unitary system; multiple dissociable systems exist, each depending on distinct neural substrates.
</div>

### 12.1.1 Declarative (Explicit) Memory

Consciously accessible memories. Depends on **medial temporal lobe** (hippocampus, entorhinal, perirhinal, parahippocampal cortices).

- **Episodic memory**: personally experienced events in context (when, where). Requires hippocampus for encoding and consolidation.
- **Semantic memory**: general knowledge and facts (no temporal context). More robust to hippocampal damage; supported by neocortex.

### 12.1.2 Non-Declarative (Implicit) Memory

Not consciously accessible:

| Type | Neural substrate | Example |
|------|-----------------|---------|
| **Procedural (skills)** | Basal ganglia + motor cortex + cerebellum | Riding a bike, typing |
| **Priming** | Neocortex (modality-specific) | Faster word identification after prior exposure |
| **Classical conditioning** | Amygdala (fear), cerebellum (eyeblink), basal ganglia | Pavlovian fear conditioning |
| **Habituation/sensitization** | Local circuits at all levels | Simple non-associative learning |

**Patient H.M. (Henry Molaison)**: bilateral removal of hippocampus, amygdala, and surrounding cortex (1953) to treat epilepsy. Severe anterograde amnesia (could not form new declarative memories); intact procedural learning and short-term memory. Demonstrated double dissociation between declarative and procedural memory.

### 12.1.3 Working Memory

**Working memory**: temporary maintenance and manipulation of information for ongoing cognitive processing. Requires **prefrontal cortex** (especially dorsolateral PFC). Baddeley's model: central executive + phonological loop + visuospatial sketchpad + episodic buffer.

## 12.2 Stages of Memory Processing

### 12.2.1 Encoding

Successful encoding requires attention and elaborative processing. Deep semantic encoding produces better long-term retention than shallow structural/phonological encoding (**levels of processing**: Craik & Lockhart).

### 12.2.2 Consolidation

<div class="definition">
<strong>Synaptic consolidation</strong>: stabilization of individual synaptic changes within hours (protein synthesis-dependent LTP). <strong>Systems consolidation</strong>: gradual transfer of memories from hippocampus-dependent to cortex-dependent storage over weeks to years.
</div>

During sleep, hippocampal **sharp-wave ripples** (SWRs) replay newly encoded memories and drive cortical spindles → long-term cortical storage. This is the **two-stage model** of memory consolidation (Buzsáki).

### 12.2.3 Retrieval

**Encoding specificity principle** (Tulving & Thomson): memories are best retrieved in contexts matching encoding. **State-dependent memory**: information learned in a particular physiological state (e.g., intoxicated) is best retrieved in the same state.

**Reconsolidation**: retrieved memories return to a labile state and require protein synthesis to be restabilized. This opens a therapeutic window — reconsolidation blockade can weaken maladaptive memories (e.g., in PTSD).

## 12.3 Molecular Mechanisms of Memory

**CREB (cAMP response element-binding protein)**: transcription factor activated by Ca²⁺/cAMP cascades; drives expression of plasticity-related genes (Arc, zif268, BDNF). Required for long-term memory in many species.

**BDNF (brain-derived neurotrophic factor)**: acts on TrkB receptors; required for LTP expression and synaptic protein synthesis. Exercise increases BDNF; linked to better memory.

**Place cells** (O'Keefe & Moser): hippocampal pyramidal neurons that fire specifically when an animal occupies a particular location — the "cognitive map." **Grid cells** (entorhinal cortex) provide a metric coordinate system. Grid and place cells provide the spatial context for episodic memory.

## 12.4 Memory Disorders

| Disorder | Characteristics | Cause |
|---------|----------------|-------|
| **Alzheimer's disease** | Gradual retrograde + anterograde amnesia; executive deficits; language; visuospatial | Amyloid plaques, tau tangles, neurodegeneration; hippocampus and entorhinal cortex affected first |
| **Korsakoff syndrome** | Severe anterograde amnesia; confabulation | Thiamine deficiency (alcoholism) → mammillary body and thalamus damage |
| **Transient global amnesia** | Sudden, brief (hours) anterograde + retrograde amnesia | Transient hippocampal ischemia; benign |
| **PTSD** | Intrusive traumatic memories; emotional over-consolidation | Amygdala hyperreactivity; PFC hypoactivity; elevated NE/cortisol at encoding |
