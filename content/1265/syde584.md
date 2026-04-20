---
title: "SYDE 584: Physiological Systems and Biomedical Design"
subjects: "SYDE"
---

## Sources and References

- Hall, <em>Guyton and Hall Textbook of Medical Physiology</em> (Elsevier)
- Tortora and Derrickson, <em>Principles of Anatomy and Physiology</em> (Wiley)
- Saltzman, <em>Biomedical Engineering: Bridging Medicine and Technology</em> (Cambridge)
- Enderle, Blanchard, Bronzino, <em>Introduction to Biomedical Engineering</em> (Academic Press)
- Plonsey and Barr, <em>Bioelectricity: A Quantitative Approach</em> (Springer)

---

# Chapter 1: Foundations of Physiology

## 1.1 Cells, Tissues, and Organs

The human body is organised hierarchically: molecules to organelles to cells to tissues (epithelial, connective, muscle, nervous) to organs to organ systems. Homeostasis — maintenance of internal conditions within narrow bounds — depends on feedback across scales: hormonal, neural, metabolic, and mechanical loops.

## 1.2 Transport and Compartments

Biological transport proceeds by diffusion, bulk flow, and active (ATP-driven) pumping. Compartment models capture the kinetics of drugs, nutrients, and signalling molecules:

\[
\frac{dC}{dt} = \frac{\dot{m}_{in}}{V} - k C,
\]

with elimination constant \( k \). Multi-compartment pharmacokinetic models track how drugs distribute across plasma, tissue, and deep compartments.

<div class="definition">
<strong>Homeostasis</strong> is the dynamic regulation of internal state around setpoints via negative-feedback loops; pathology often arises when these loops are broken or overwhelmed.
</div>

# Chapter 2: Musculoskeletal System

## 2.1 Bones and Joints

Bone is a composite of hydroxyapatite mineral in a collagen matrix. Cortical bone is dense and strong; trabecular bone is porous and light. Bone remodels continuously in response to mechanical loading (Wolff's law), guided by osteoblasts (deposition) and osteoclasts (resorption). Joints transfer load and enable motion: fibrous (skull sutures), cartilaginous (intervertebral discs), and synovial (knees, shoulders).

## 2.2 Muscle Mechanics

Skeletal muscle generates force via actin-myosin crossbridge cycling, consuming ATP. The length-tension relation peaks at optimal sarcomere length (~2.2 \(\mu\)m); the force-velocity relation (Hill's equation)

\[
(F + a)(v + b) = (F_0 + a) b,
\]

trades force for velocity. These relations shape everything from gait biomechanics to the design of powered exoskeletons.

## 2.3 Gait and Biomechanics

Human gait alternates stance and swing phases. Ground reaction forces, joint moments, and muscle activations can be reconstructed from motion capture and force plates via inverse dynamics. Biomechanical analysis informs sports performance, injury prevention, orthotics, and prosthetic limb design.

<div class="example">
Replacing a lower limb with a passive-elastic prosthesis stores and returns energy via a carbon-fibre spring; matching spring stiffness to user mass and activity level is central to functional restoration of locomotion.
</div>

# Chapter 3: Nervous System

## 3.1 Excitable Membranes

Neurons maintain a resting potential around −70 mV via Na<sup>+</sup>/K<sup>+</sup> ATPase pumps and selective membrane permeabilities. The Nernst equation

\[
E_{ion} = \frac{R T}{z F}\ln\!\left(\frac{[\text{ion}]_o}{[\text{ion}]_i}\right)
\]

gives the equilibrium potential for each ion. The Goldman-Hodgkin-Katz equation extends to multiple ions weighted by permeability.

## 3.2 Action Potentials

An action potential is a transient depolarisation propagating along an axon. Voltage-gated Na<sup>+</sup> channels open at threshold, depolarising the membrane; K<sup>+</sup> channels then open and Na<sup>+</sup> channels inactivate, returning potential to baseline. The Hodgkin-Huxley equations describe these dynamics quantitatively and remain the standard in computational neuroscience.

## 3.3 Sensory and Motor Pathways

Sensory receptors transduce physical stimuli into neural signals that ascend through dorsal column and spinothalamic pathways. Motor signals descend via corticospinal and reticulospinal tracts. Synaptic transmission — chemical neurotransmitters crossing synapses — provides the plastic connections that underlie learning and memory.

# Chapter 4: Cardiovascular System

## 4.1 Cardiac Function

The heart is a four-chamber pump delivering 5 L/min at rest. Stroke volume (70 mL) times heart rate (70 bpm) gives cardiac output. The cardiac cycle alternates systole (contraction) and diastole (filling), coordinated by spontaneous pacemaker potentials in the sinoatrial node. The electrocardiogram (ECG) records extracellular voltages: P wave (atrial depolarisation), QRS complex (ventricular depolarisation), T wave (ventricular repolarisation).

## 4.2 Vascular Mechanics

Blood flow through a cylindrical vessel follows Poiseuille's law

\[
Q = \frac{\pi R^{4} \Delta P}{8 \mu L},
\]

with vessel radius \( R \), viscosity \( \mu \), and length \( L \). Arteries are elastic, smoothing pulsatile output; arterioles are the main resistance vessels, controlling organ perfusion. Wave reflections and compliance shape the pressure waveform measurable non-invasively.

## 4.3 Regulation

Cardiac output and peripheral resistance are regulated by the autonomic nervous system, humoral signals (renin-angiotensin, vasopressin), and local factors (nitric oxide, metabolic demand). Blood pressure is maintained within narrow limits by the baroreflex — a negative-feedback loop sensing pressure at the carotid sinus and modulating heart rate and vessel tone.

# Chapter 5: Respiratory and Other Systems

## 5.1 Respiratory Mechanics

The lungs ventilate roughly 6 L/min at rest, exchanging O<sub>2</sub> and CO<sub>2</sub> across the alveolar-capillary barrier. Minute ventilation equals tidal volume (500 mL) times respiratory rate (12 breaths/min). Compliance — volume change per pressure change — depends on alveolar surfactant that reduces surface tension preventing collapse. Airway resistance follows vessel-like laws but is actively modulated by smooth-muscle tone.

## 5.2 Gas Exchange

Alveolar-to-capillary diffusion follows Fick's law:

\[
\dot{V}_{gas} = \frac{D A}{T}(P_{alv} - P_{cap}),
\]

where \( D \) is diffusivity, \( A \) surface area, \( T \) membrane thickness. Oxygen binds hemoglobin cooperatively, giving the sigmoidal saturation curve. Pulse oximetry exploits differential optical absorption by oxy- and deoxy-hemoglobin to measure SpO<sub>2</sub> non-invasively.

## 5.3 Renal, Endocrine, and Immune Systems

The kidneys filter blood, regulating volume, electrolytes, and pH. Glomerular filtration rate is a key clinical marker. The endocrine system uses hormones — slower than neural signals but reaching every tissue — for long-term regulation. The immune system distinguishes self from non-self and mounts responses that can be harnessed (vaccines) or hijacked (autoimmune, cancer) in engineering contexts.

<div class="remark">
Biomedical engineers work at interfaces — electrodes to nerves, implants to bone, imaging signals to anatomy, drugs to targets. Each interface is both an engineering challenge and a biological response that must be anticipated and managed.
</div>

# Chapter 6: Modelling and Biomedical Design

## 6.1 Systems-Physiological Models

Mathematical models of physiological systems support diagnosis, device design, and treatment planning. Compartment models (pharmacokinetics), lumped-parameter circulatory models, gas-exchange simulations, neural-network models, and coupled whole-body models each trade detail for tractability. Validation against clinical data, accounting for inter-patient variability, is essential.

## 6.2 Imaging Systems

Medical imaging modalities transduce tissue properties into clinical images. X-ray CT uses density contrast; MRI exploits proton spin relaxation; ultrasound reads acoustic impedance; PET and SPECT follow radiolabeled tracers; optical and near-infrared methods probe superficial tissue. Each modality has physical principles, resolution, penetration, and safety trade-offs that shape clinical use.

## 6.3 Assistive and Diagnostic Devices

Assistive devices — prosthetic limbs, hearing aids, exoskeletons, wheelchairs — restore or augment function. Diagnostic devices — ECG monitors, glucose sensors, blood pressure cuffs, point-of-care tests — convert physiology into actionable information. Design considerations include biocompatibility, safety, reliability, user experience, affordability, and regulatory approval. Human factors and accessibility are especially important when users may be unwell, fatigued, or unfamiliar with technology.

## 6.4 Pathology and Measurement

Every measurement reflects both underlying physiology and measurement context. Motion artefacts, poor electrode contact, skin colour effects on optical sensors, and comorbidities alter signals. Algorithms must be robust across populations or explicitly acknowledge their validated scope. Medical device development obligates engineers to investigate bias, usability, and failure modes in diverse users.

<div class="example">
Pulse oximeters validated primarily on light-skinned participants have been shown to overestimate SpO<sub>2</sub> in patients with darker skin; recognition of this bias has prompted reevaluation of both device calibration and clinical decision protocols.
</div>

<div class="theorem">
Designing biomedical devices requires fluency in physiology (what the body does), measurement physics (how the device transduces signals), signal processing (how data become clinical information), and human factors (how clinicians and patients interact with the system), all framed by ethics and regulation.
</div>

Students completing the course are prepared to engage with multidisciplinary biomedical teams, contribute to device development, and understand patient-facing consequences of engineering decisions in clinical contexts.
