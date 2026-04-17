---
title: "BIOL 280: Introduction to Biophysics"
subjects: "BIOL"
prof: "Zoya Leonenko"
---

## Sources and References

**Primary textbook** — Srivastava, P. K. (2012). *Elementary Biophysics: An Introduction*. Alpha Science International. Hallett, F. R., Stinson, R. H., & Speight, G. G. (2008). *Physics for the Biological Sciences* (5th ed.). Nelson Education.

**Supplementary texts** — Nelson, P. (2014). *Biological Physics: Energy, Information, Life* (updated 1st ed.). W. H. Freeman. Alberts, B., Johnson, A., Lewis, J., Morgan, D., Raff, M., Roberts, K., & Walter, P. (2022). *Molecular Biology of the Cell* (7th ed.). W. W. Norton.

**Online resources** — Biophysical Society (biophysics.org); NCBI Bookshelf (bookshelf.ncbi.nlm.nih.gov); PhysioNet (physionet.org); Nature Methods (nature.com/nmeth).

---

# Chapter 1: Introduction to Biophysics

## 1.1 What Is Biophysics?

Biophysics is the discipline that applies the concepts, principles, and experimental methods of physics to the study of biological systems. It is inherently interdisciplinary — standing at the intersection of physics, biology, chemistry, mathematics, and engineering — and its scope ranges from the macroscopic mechanics of locomotion and fluid flow in living organisms, down through the mesoscale organization of cells and membranes, to the quantum mechanical interactions of individual molecules and their atoms. The field emerged as a coherent discipline in the mid-twentieth century, catalyzed in part by the discovery of the double-helical structure of DNA (which required the X-ray crystallographic techniques of physics), the development of patch clamp electrophysiology (which brought the precision of electronic instrumentation to the study of individual ion channels), and the invention of electron microscopy (which revealed the ultrastructure of cells with unprecedented clarity).

What distinguishes biophysics from biochemistry or cell biology is not primarily the subject matter but the mode of analysis. Biophysicists ask quantitative questions: how much force does a myosin motor molecule exert on an actin filament? At what rate does a drug diffuse across a lipid bilayer? What is the electric field across a nerve membrane immediately before an action potential fires? These questions demand the language of physics — force, energy, flux, potential, entropy — and they demand experimental techniques capable of measuring biological quantities at the relevant spatial and temporal scales. The answers, in turn, constrain and illuminate biological mechanisms in ways that purely descriptive or qualitative biology cannot.

The importance of biophysics to medicine and biotechnology has grown enormously in recent decades. Virtually every modern medical imaging modality — X-ray, CT, MRI, ultrasound, PET — is a direct product of biophysical research and physical measurement science. The structural biology revolution — the determination of the three-dimensional structures of tens of thousands of proteins, nucleic acids, and their complexes by X-ray crystallography, cryo-electron microscopy, and NMR spectroscopy — has been driven by physicists and biophysicists working alongside biochemists. The development of optical tweezers, atomic force microscopy, single-molecule fluorescence, and super-resolution microscopy has opened entirely new windows into the molecular dynamics of living cells. Understanding these methods — their physical principles, capabilities, and limitations — is therefore essential not just for those who use them in research but for any scientist who reads and critically evaluates the modern scientific literature.

## 1.2 Physical Scales in Biology

One of the first skills in biophysics is developing an intuitive sense of the relevant length scales, time scales, energies, and forces at different levels of biological organization. The range of scales encountered is extraordinary: from the 10 meter height of a tree, through the centimeter dimensions of a human heart, the micrometer dimensions of a cell, the nanometer scale of proteins and DNA, down to the sub-nanometer scale of individual chemical bonds.

Length scales in biology span roughly twelve orders of magnitude. A human being is approximately 1–2 meters tall. Individual organs range from a few centimeters (the adrenal gland) to several tens of centimeters (the intestine). Individual cells range from approximately 1 micrometer (small bacteria) to approximately 100 micrometers (a large mammalian cell) to over a meter (the axons of motor neurons in a giraffe's spinal cord). Organelles within cells range from approximately 0.5 to 5 micrometers. Individual protein molecules have dimensions of a few nanometers. DNA has a diameter of 2 nm. The bond lengths connecting atoms are approximately 0.1–0.3 nm (1–3 Angstroms).

Time scales are equally diverse. A human heartbeat occurs over approximately one second. A nerve action potential lasts approximately 1 millisecond. The fastest enzymatic reactions occur in microseconds. Conformational changes of proteins occur over nanoseconds to milliseconds. The time scale of an electron transfer reaction in photosynthesis is femtoseconds (10<sup>−15</sup> s). A human lifetime is approximately 2.5 × 10<sup>9</sup> seconds; the evolutionary history of life on Earth spans approximately 1.2 × 10<sup>17</sup> seconds. Understanding the appropriate time scale for a given biological process is essential for designing experiments to observe it.

<div class="definition">
The characteristic energy scale of biological processes at the molecular level is the <strong>thermal energy</strong> \( k_B T \), where \( k_B = 1.38 \times 10^{-23} \) J/K is the Boltzmann constant and \( T \) is the absolute temperature in Kelvin. At physiological temperature (310 K), \( k_B T \approx 4.3 \times 10^{-21} \) J \( \approx \) 4.1 pN·nm \( \approx \) 0.62 kcal/mol. Molecular motors such as myosin and kinesin exert forces of a few piconewtons and generate mechanical energy of a few \( k_B T \) per step. The energy stored in a single ATP molecule (approximately 20 \( k_B T \) under physiological conditions) represents the "fuel" for most cellular work. Thermal fluctuations are always present at this scale, meaning that biological machines operate in a regime where random thermal noise is not negligible — understanding how molecular machines function reliably despite constant thermal bombardment is one of the central problems of molecular biophysics.
</div>

---

# Chapter 2: Biomechanics

## 2.1 Mechanics of the Musculoskeletal System

Biomechanics is the application of mechanical principles — statics, dynamics, fluid mechanics, and materials science — to biological organisms. At the organismal level, the skeletal muscles and bones of vertebrates function as a system of levers, the laws of which directly determine the forces, speeds, and mechanical advantages available for locomotion, manipulation, and posture. The musculoskeletal system represents an elegant engineering solution to the challenge of controlled movement in a gravitational field, and its analysis using Newtonian mechanics reveals why the body has evolved the proportions it has.

A **lever** is a rigid structure that pivots about a fixed point (the **fulcrum**) and transmits forces. In the musculoskeletal system, the **bone** acts as the rigid bar, the **joint** acts as the fulcrum, the **muscle** provides the effort force (at the muscle insertion point), and the weight of the body segment or an external load provides the resistance force. Levers are classified by the relative positions of the fulcrum, effort, and resistance. A **first-class lever** has the fulcrum between the effort and resistance (like a see-saw; the atlanto-occipital joint, where the skull pivots on the neck, is an example — the neck extensors provide effort, the skull weight provides resistance, and the joint is between them). A **second-class lever** has the resistance between the fulcrum and the effort (like a wheelbarrow; the ankle joint during tiptoeing is an example — the toes form the fulcrum, the body weight the resistance, and the calf muscles provide effort at the heel). A **third-class lever** — the most common in the human body — has the effort between the fulcrum and the resistance (the elbow joint with biceps curling the forearm is the classic example — the elbow joint is the fulcrum, the biceps insertion on the radius is the effort point, and the hand holding the weight is the resistance).

The **mechanical advantage** (MA) of a lever is defined as the ratio of the output force (resistance) to the input force (effort), which equals the inverse ratio of the corresponding moment arms (distances from the fulcrum to the lines of action of the effort and resistance respectively):

\[
\text{MA} = \frac{F_\text{resistance}}{F_\text{effort}} = \frac{d_\text{effort}}{d_\text{resistance}}
\]

Most human joints are third-class levers with a mechanical advantage considerably less than 1 — meaning the muscle must exert a force much larger than the weight being lifted. This seems mechanically inefficient, but it is actually advantageous because it trades force for speed and range of motion: a small contraction of the muscle moves the hand through a large arc at high velocity. This is the biomechanical basis of throwing — a small angular displacement of the shoulder joint is amplified to produce a very high velocity at the fingertips.

## 2.2 Stress, Strain, and the Mechanical Properties of Biological Materials

When a force is applied to a biological material, it deforms. The material properties that determine how a material deforms under load are characterized by stress, strain, and the elastic moduli. **Stress** (\( \sigma \)) is the force per unit area applied to a material:

\[
\sigma = \frac{F}{A}
\]

**Strain** (\( \varepsilon \)) is the fractional deformation:

\[
\varepsilon = \frac{\Delta L}{L_0}
\]

For most biological materials in the linear elastic regime (small deformations), stress and strain are related by **Young's modulus** (\( E \)) — also called the elastic modulus:

\[
\sigma = E \varepsilon
\]

Biological materials span an enormous range of elastic moduli. Cortical bone has a Young's modulus of approximately 20 GPa — comparable to some metals and making it one of the stiffest biological materials. Cartilage is orders of magnitude softer (approximately 1–10 MPa). Individual cells typically have moduli on the order of 0.1–10 kPa — comparable to a soft rubber — which is important for cell migration and mechanosensing. The lipid bilayer of a cell membrane has a bending modulus (the energy cost of bending the membrane into a sphere) of approximately 20 \( k_B T \) — just barely above the threshold where thermal fluctuations would spontaneously disrupt the membrane's flat structure. This value is not accidental: a membrane that was too rigid would resist the deformations necessary for endocytosis, exocytosis, and cell division; a membrane that was too soft would be continuously disrupted by thermal noise.

<div class="example">
The mechanical properties of bone beautifully illustrate the concept of a composite material. Bone consists of a mineral phase (hydroxyapatite, Ca<sub>10</sub>(PO<sub>4</sub>)<sub>6</sub>(OH)<sub>2</sub>) providing compressive stiffness and hardness, and an organic phase (type I collagen fibers) providing tensile strength and fracture toughness. Neither component alone would be adequate: pure hydroxyapatite ceramic is brittle and shatters under impact; pure collagen is flexible but weak in compression. Together, the collagen fibers arrest crack propagation (cracks must go around the fibers rather than through them) and the mineral provides the rigidity needed for weight-bearing. This composite architecture — mineral platelets embedded in a collagen matrix — achieves both high stiffness and high toughness that neither component alone could provide, a solution that materials engineers have spent decades trying to replicate synthetically.
</div>

## 2.3 Muscle Force Generation: The Sliding Filament Theory

Skeletal muscle generates force through the **sliding filament mechanism**: the thick filaments (made of myosin) and thin filaments (made of actin) in each sarcomere slide past each other, driven by the cyclic attachment and detachment of myosin **cross-bridges** to actin in a power stroke fueled by ATP hydrolysis. The force generated by a single myosin cross-bridge is approximately 3–5 pN, measurable by optical tweezers experiments with single molecules. Each sarcomere contains hundreds of myosin molecules arranged in the thick filament, and a single muscle fiber contains thousands of sarcomeres in series, allowing the cumulative contraction to generate macroscopic force and displacement.

The **force-velocity relationship** of muscle — where force decreases monotonically as contraction velocity increases, and where maximum force is generated at zero velocity (isometric contraction) — is described by the **Hill equation**:

\[
(F + a)(v + b) = (F_0 + a) b
\]

where \( F \) is the force, \( v \) is the shortening velocity, \( F_0 \) is the maximum isometric force, and \( a \) and \( b \) are constants with units of force and velocity respectively. The maximum velocity \( V_{max} = F_0 b / a \) (at zero force) is determined by the rate-limiting step of the cross-bridge cycle — typically the release of ADP after the power stroke. The Hill equation has been confirmed experimentally for many muscle types and has important implications for exercise physiology: the maximum mechanical power (force × velocity) is generated at approximately one-third of maximum force and one-third of maximum velocity, which is why optimal athletic performance in many activities involves selecting resistances that maximize power output.

---

# Chapter 3: Biophysics of Fluid and Gas Flow

## 3.1 Fluid Flow in Biological Systems

Blood circulation, lymph flow, airflow in the lungs, and the movement of cytoplasm within cells are all examples of fluid flow governed by the same physical principles as any other fluid system. The key physical quantity characterizing a fluid's resistance to flow is its **viscosity** — the internal friction between adjacent fluid layers moving at different velocities. The dynamic viscosity (\( \eta \)) of water at 37°C is approximately 0.69 × 10<sup>−3</sup> Pa·s; whole blood has an effective viscosity of approximately 3–4 × 10<sup>−3</sup> Pa·s at low shear rates (blood is non-Newtonian because red blood cells aggregate at low shear, increasing apparent viscosity).

For steady, laminar flow through a rigid cylindrical tube — the idealized model of blood flow in a blood vessel — the relationship between pressure, flow, and geometry is given by the **Hagen-Poiseuille equation**:

\[
Q = \frac{\pi r^4 \Delta P}{8 \eta L}
\]

where \( Q \) is the volumetric flow rate, \( r \) is the tube radius, \( \Delta P \) is the pressure difference between the two ends of the tube, \( \eta \) is the dynamic viscosity, and \( L \) is the tube length. The \( r^4 \) dependence of flow rate on tube radius is one of the most important results in cardiovascular physiology: a 50% reduction in a vessel's radius (a common degree of stenosis in atherosclerosis) reduces flow by \( (0.5)^4 = 1/16 \) — a factor of sixteen — at the same driving pressure. Conversely, a small increase in vessel radius (achieved by vasodilation in response to neural or hormonal signals) dramatically increases blood flow to the target organ.

The dimensionless **Reynolds number** (\( Re \)) determines whether flow will be laminar (smooth, parallel streamlines) or turbulent (chaotic, with eddies and vortices):

\[
Re = \frac{\rho v d}{\eta}
\]

where \( \rho \) is the fluid density, \( v \) is the mean flow velocity, \( d \) is the tube diameter, and \( \eta \) is the dynamic viscosity. Flow is typically laminar for \( Re < 2000 \) and turbulent for \( Re > 4000 \). In the aorta at rest, \( Re \) is approximately 1,500–3,000 (borderline laminar); during vigorous exercise, aortic flow becomes turbulent (\( Re > 4000 \)). Turbulent flow dramatically increases vascular resistance and can damage the endothelium, contributing to atherosclerosis. The turbulent flow produced by atherosclerotic plaques (which protrude into the lumen and disturb streamlines) further accelerates damage at the plaque site and immediately downstream.

## 3.2 The Cardiovascular System as a Fluid Circuit

The cardiovascular system can be modeled as an electrical circuit in which **pressure difference** (\( \Delta P \)) is analogous to voltage, **blood flow rate** (\( Q \)) is analogous to current, and **vascular resistance** (\( R \)) is analogous to electrical resistance. **Ohm's law for fluid flow** states:

\[
Q = \frac{\Delta P}{R}
\]

where resistance \( R = 8\eta L / (\pi r^4) \) from the Hagen-Poiseuille equation. Vessels in series have additive resistances; vessels in parallel have combined conductances (reciprocal resistances) that add. This parallel arrangement is critical to cardiovascular physiology: the systemic circulation distributes blood flow to all organs in parallel (not in series), so that each organ receives its fraction of cardiac output without requiring the full driving pressure. Local vascular resistance can be varied independently by each organ's arterioles, allowing the distribution of cardiac output to shift between organs as metabolic demand changes.

The **heart** generates the pressure difference that drives circulation. The left ventricle ejects blood into the aorta at approximately 120 mmHg systolic pressure, and the systemic capillary pressure is approximately 25–35 mmHg. The pressure drop from the aorta to the capillaries occurs primarily across the **arterioles** — the smallest, most muscular arteries — which are therefore the primary site of systemic vascular resistance regulation and blood pressure control. Mean arterial pressure (MAP) is approximately:

\[
\text{MAP} \approx \text{diastolic pressure} + \frac{1}{3}(\text{pulse pressure})
\]

where pulse pressure is the difference between systolic and diastolic pressure. In a healthy adult at rest, MAP is approximately 70–100 mmHg.

## 3.3 Gas Transport and Respiratory Mechanics

Oxygen delivery to tissues and carbon dioxide removal require both convective transport (by the cardiovascular system) and diffusive exchange (across the alveolar membranes and the tissue capillary walls). The driving force for gas diffusion is the partial pressure gradient — from high partial pressure on the side with more gas to low partial pressure on the side with less gas. In the alveoli, the partial pressure of oxygen (\( P_{O_2} \)) is approximately 100 mmHg; in the venous blood arriving at the alveoli, \( P_{O_2} \) is approximately 40 mmHg. The resulting gradient drives O<sub>2</sub> diffusion from alveolus to blood across the extremely thin respiratory membrane (approximately 0.5 µm).

**Fick's law of diffusion** relates the diffusive flux of a substance to its concentration gradient:

\[
J = -D \frac{dC}{dx}
\]

where \( J \) is the flux (amount of substance per unit area per unit time), \( D \) is the diffusion coefficient, and \( dC/dx \) is the concentration gradient. For gas exchange across the alveolar membrane, the diffusing capacity of the lung (\( D_L \)) is:

\[
\dot{V}_{O_2} = D_L \cdot (P_{A,O_2} - P_{c,O_2})
\]

where \( \dot{V}_{O_2} \) is the O<sub>2</sub> uptake rate, \( P_{A,O_2} \) is the alveolar \( P_{O_2} \), and \( P_{c,O_2} \) is the mean capillary \( P_{O_2} \). The diffusing capacity is proportional to the alveolar surface area and inversely proportional to the membrane thickness — explaining why emphysema (which destroys alveolar walls, reducing surface area) and pulmonary fibrosis (which thickens the alveolar membrane) both severely impair gas exchange.

The mechanics of breathing involve the elastic properties of the lung and chest wall. The lungs are elastic structures that collapse inward when not supported; the chest wall springs outward when not constrained. At the functional residual capacity (FRC) — the lung volume at the end of a passive exhalation — the inward elastic recoil of the lungs exactly balances the outward elastic recoil of the chest wall, and the respiratory muscles are relaxed. **Lung compliance** (\( C \)) is defined as the change in volume per unit change in pressure:

\[
C = \frac{\Delta V}{\Delta P}
\]

Normal lung compliance is approximately 200 mL/cmH<sub>2</sub>O. Decreased compliance (stiff lungs) in fibrosis requires greater respiratory muscle effort for each breath, increasing the work of breathing. The energy required to breathe is also influenced by airway resistance (increased in asthma and COPD due to bronchoconstriction and excess mucus) and by the surface tension at the air-liquid interface of the alveoli (reduced by pulmonary surfactant, as discussed in the anatomy section).

---

# Chapter 4: Physics of Audition

## 4.1 Sound as a Physical Wave

**Sound** is a longitudinal mechanical wave — a periodic compression and rarefaction of a medium (air, water, or solid) propagating outward from a vibrating source. The physical properties of sound that determine its perceived qualities are its **frequency** (determining pitch, measured in Hertz — cycles per second), its **amplitude** (determining loudness, related to the maximum displacement or pressure variation), and its **waveform** (determining timbre — the blend of harmonics that distinguishes a violin from a clarinet playing the same note).

The speed of sound in air at 20°C is approximately 343 m/s. The speed of sound in biological tissues is approximately 1,540 m/s (similar to water), which is important for ultrasound imaging. The intensity of a sound wave is the power per unit area carried by the wave:

\[
I = \frac{P_{rms}^2}{\rho v}
\]

where \( P_{rms} \) is the root-mean-square pressure amplitude, \( \rho \) is the medium density, and \( v \) is the sound speed. The human ear can detect sounds ranging in intensity from approximately 10<sup>−12</sup> W/m<sup>2</sup> (the threshold of hearing) to approximately 1 W/m<sup>2</sup> (the threshold of pain) — a dynamic range of twelve orders of magnitude. Because of this enormous range, sound intensity is measured on a logarithmic scale in **decibels** (dB):

\[
\text{SPL (dB)} = 10 \log_{10} \left(\frac{I}{I_0}\right)
\]

where \( I_0 = 10^{-12} \) W/m<sup>2</sup> is the reference intensity (threshold of hearing). A normal conversation is approximately 60 dB; a jet engine at close range is approximately 140 dB; prolonged exposure to sounds above 85 dB causes permanent hearing damage by destroying cochlear hair cells.

## 4.2 The Physics of the Human Ear

The human ear converts sound waves into electrical signals transmitted to the brain with remarkable efficiency and frequency discrimination. The process involves three anatomical stages: the **outer ear** (pinna and ear canal) collects and directs sound; the **middle ear** (tympanic membrane and ossicular chain) impedance-matches the air medium to the fluid-filled cochlea; and the **inner ear** (cochlea) performs spectral analysis of the sound and transduces the mechanical signal into electrical nerve impulses.

The **impedance matching** function of the middle ear is critically important because of the large acoustic impedance difference between air and the fluid of the cochlea. If sound passed directly from air into the cochlear fluid without impedance matching, approximately 99.9% of the sound energy would be reflected (analogous to light striking a glass-air interface). The middle ear overcomes this by combining two mechanisms: the **area ratio** between the large tympanic membrane (approximately 55 mm<sup>2</sup>) and the small oval window (approximately 3.2 mm<sup>2</sup>) amplifies pressure by a factor of approximately 17; and the **lever action** of the ossicular chain (malleus, incus, and stapes — the three smallest bones in the body) provides additional mechanical advantage of approximately 1.3. Together, these mechanisms amplify the pressure transmitted to the oval window by approximately 22-fold — recovering most of the energy that would otherwise be reflected and permitting efficient sound transmission to the cochlea.

<div class="definition">
The <strong>cochlea</strong> is a fluid-filled, snail-shaped organ in the inner ear that performs Fourier analysis of the incoming sound — decomposing complex sounds into their component frequencies. The basilar membrane running along the cochlea varies in width and stiffness: it is narrow and stiff at the base (near the oval window) and wide and flexible at the apex. High-frequency sounds cause maximum displacement of the narrow, stiff basal end of the basilar membrane, while low-frequency sounds cause maximum displacement near the flexible apex — a spatial mapping of frequency called <strong>tonotopy</strong>. This arrangement reflects the physics of traveling waves on a membrane of varying mechanical properties. The <strong>hair cells</strong> of the organ of Corti (approximately 3,500 inner hair cells and 12,000 outer hair cells) sitting on the basilar membrane detect the local displacement, converting it into graded receptor potentials and ultimately into action potentials in the auditory nerve through a process that involves mechanically gated ion channels (primarily TMIE protein complexes) at the tips of the stereocilia.
</div>

## 4.3 Frequency Discrimination and the Limits of Hearing

The human auditory system can discriminate frequencies differing by less than 1 Hz under optimal conditions — a resolution comparable to, and in some ways exceeding, any artificial sensing system. The frequency range of human hearing extends from approximately 20 Hz to 20,000 Hz (20 kHz), though the upper limit declines significantly with age (a process called presbycusis, affecting essentially all individuals by late middle age). The **just noticeable difference** (JND) in frequency — the smallest frequency change detectable — is approximately 1–3 Hz in the range most important for speech (500–4000 Hz), rising to tens or hundreds of Hz at the extremes of the hearing range.

The **decibel scale** of loudness and the **mel scale** of perceived pitch both reflect the logarithmic nature of auditory perception — consistent with the broader principle (Weber-Fechner law) that the perceived magnitude of a sensory stimulus is proportional to the logarithm of the stimulus intensity. This logarithmic compression is implemented in part by the outer hair cells, which amplify small-amplitude basilar membrane vibrations nonlinearly through an active electromechanical process (prestin-mediated somatic electromotility), dramatically improving sensitivity and frequency selectivity at low sound levels while compressing the dynamic range at high levels.

---

# Chapter 5: Physics of Vision

## 5.1 Light and the Eye as an Optical Instrument

The eye is an optical instrument that forms an image of the external world on the retina — a biological analogue of a camera. The physics of image formation in the eye follows the same **thin lens equation** as any other converging optical system:

\[
\frac{1}{f} = \frac{1}{d_o} + \frac{1}{d_i}
\]

where \( f \) is the focal length of the lens system, \( d_o \) is the object distance, and \( d_i \) is the image distance (the distance from the lens to the retina). The total power of the eye's optical system is approximately 60 diopters (where 1 diopter = 1/m, so a lens of 1 diopter focal length focuses parallel rays at 1 meter). The cornea contributes approximately 43 diopters and the crystalline lens approximately 17 diopters (at maximum power for near vision). The eye adjusts focus for different distances by changing the shape of the crystalline lens — a process called **accommodation** — achieved by the contraction and relaxation of the ciliary muscles, which change the tension on the zonular fibers attached to the lens capsule.

**Refractive errors** of the eye result from mismatches between the optical power of the eye and the axial length of the eyeball. In **myopia** (nearsightedness), the eyeball is too long (or the cornea too curved), causing the image of distant objects to form in front of the retina; close objects are seen clearly. In **hyperopia** (farsightedness), the eyeball is too short, causing the image to focus behind the retina; both near and far objects require accommodative effort. **Astigmatism** results from non-uniform curvature of the cornea (different radii of curvature in different meridians), causing different portions of the image to focus at different distances. All three are corrected by external lenses (spectacles or contact lenses) or by laser refractive surgery (LASIK, PRK) that reshapes the corneal curvature.

## 5.2 Phototransduction and Visual Perception

Vision begins with the absorption of photons by photosensitive pigment molecules (**opsins** combined with the chromophore **retinal**, a derivative of vitamin A) in the outer segments of rod and cone photoreceptors. The absorption of a single photon by rhodopsin (the rod photopigment) is sufficient to trigger a detectable signal — a remarkable sensitivity that results from a cascade of enzymatic amplification. Photon absorption isomerizes retinal from the 11-*cis* to the all-*trans* configuration, activating the opsin and initiating a **G-protein signaling cascade** (via transducin) that activates phosphodiesterase, which hydrolyzes cyclic GMP (cGMP). The drop in cGMP concentration causes the closure of cGMP-gated cation channels in the outer segment plasma membrane, reducing the influx of Na<sup>+</sup> and Ca<sup>2+</sup> and hyperpolarizing the photoreceptor. This hyperpolarization reduces the tonic release of glutamate at the synaptic terminal, changing the signal to the downstream bipolar cells.

The **trichromatic theory** of color vision states that human color perception arises from the differential stimulation of three types of cone photoreceptors: S-cones (peak sensitivity approximately 420 nm, perceived as blue), M-cones (peak sensitivity approximately 530 nm, perceived as green), and L-cones (peak sensitivity approximately 560 nm, perceived as red). The sensation of any color is determined by the ratio of activation of these three cone types, allowing a huge range of colors to be perceived from three channels of information — the basis of color television, photography, and printing, all of which exploit the trichromatic nature of human color vision. **Color blindness** (affecting approximately 8% of males and 0.5% of females) results from the absence or altered sensitivity of one or more cone types, most commonly involving the M or L cones (red-green color blindness, inherited as an X-linked recessive trait).

---

# Chapter 6: Physics of Biomolecules

## 6.1 Protein Structure and Physical Forces

Proteins are the molecular machines of life — enzymes catalyzing chemical reactions, structural elements organizing the cell, motors performing mechanical work, receptors responding to signals, and transporters moving substances across membranes. The three-dimensional structure of a protein — which determines its function — is encoded in the linear sequence of amino acids and is determined by the complex interplay of physical forces: **electrostatic interactions** (both attractive and repulsive, between charged amino acid side chains and the peptide bond dipoles), **hydrogen bonds** (between the backbone carbonyl oxygen and the amide hydrogen, forming the secondary structures of alpha helices and beta sheets), **hydrophobic interactions** (the energetically favorable burying of non-polar side chains away from water, the primary driving force for protein folding), and **van der Waals interactions** (short-range attractive forces between all atoms, providing the specificity of the protein interior's close packing).

<div class="definition">
The <strong>hydrophobic effect</strong> is the primary thermodynamic driving force for protein folding and the self-assembly of lipid bilayers. When non-polar molecules or amino acid side chains are surrounded by water, the water molecules must adopt ordered arrangements around them (forming a "cage" or clathrate structure) to maximize hydrogen bonding, reducing the entropy of the water. Burying hydrophobic groups together — as occurs in protein folding or lipid bilayer formation — releases the ordered water molecules back to the bulk solution, greatly increasing the total entropy of the system. This favorable entropy gain, rather than direct attraction between hydrophobic groups, is the dominant thermodynamic contribution to the hydrophobic effect. The free energy of transfer of a non-polar group from water to a non-polar environment is approximately −0.03 to −0.12 \( k_B T \) per Å<sup>2</sup> of hydrophobic surface area buried.
</div>

The **Ramachandran plot** maps the allowed conformations of the protein backbone in terms of the dihedral angles phi (\( \phi \)) and psi (\( \psi \)) about the N-C\(_\alpha\) and C\(_\alpha\)-C bonds respectively. Certain combinations of \( \phi \) and \( \psi \) are sterically forbidden because adjacent atoms would clash; the allowed regions correspond to the conformations observed in alpha helices, beta sheets, and turns. The Ramachandran plot thus provides a physical rationalization for the dominance of these secondary structural elements in protein architecture: they are the only conformations in which the bulky side chains can be accommodated without steric conflict.

## 6.2 DNA Structure and Biophysics

The **DNA double helix** is one of the most elegant and consequential molecular structures in biology. Its physical properties — the stiffness of the double-stranded DNA molecule, the stability of the base-pair stacking, the topological constraints imposed by the helical winding — all have direct biological consequences. Physically, double-stranded DNA behaves as a semiflexible polymer characterized by its **persistence length** (\( L_p \)) — the length scale over which the molecule retains directional memory. For dsDNA, \( L_p \approx 50 \) nm (approximately 150 base pairs), meaning that on length scales shorter than 50 nm, the molecule appears roughly straight (rod-like), while on longer scales it becomes random and flexible (coil-like).

The **persistence length** is related to the bending stiffness (\( \kappa \)) and the thermal energy:

\[
L_p = \frac{\kappa}{k_B T}
\]

This relationship encapsulates the competition between the mechanical stiffness (which tends to keep the molecule straight) and thermal fluctuations (which tend to bend it randomly). Proteins that must bend DNA to act on it — transcription factors, histones, topoisomerases — must supply enough energy to overcome this bending stiffness. The packaging of the human genome (\( \sim \)2 meters of DNA) into the nucleus (diameter \( \sim \)10 µm) requires the DNA to be compressed by approximately 200,000-fold, achieved through progressively higher orders of chromatin structure: the nucleosome (DNA wound around a histone octamer), the 30 nm chromatin fiber, and higher-order loops and domains maintained by cohesin and CTCF proteins.

## 6.3 Molecular Motors

**Molecular motors** are proteins that convert chemical energy (from ATP hydrolysis) into mechanical work. They fall into three superfamilies: **myosin** (moving along actin filaments, powering muscle contraction and intracellular cargo transport), **kinesin** (moving along microtubules, primarily toward the plus end, transporting organelles and vesicles in axons and other cells), and **dynein** (moving along microtubules toward the minus end, powering flagellar and ciliary beating and returning cargo from the cell periphery to the nucleus). All three families are **mechanoenzymes** — ATPases whose catalytic cycle is tightly coupled to a conformational change that produces mechanical displacement.

The single-molecule mechanics of molecular motors have been revealed by **optical tweezers** experiments, in which a motor protein attached to a bead is held in a focused laser beam while it walks along its polymer track, and the forces and displacements of individual steps are recorded with sub-nanometer precision and sub-piconewton force resolution. Kinesin takes steps of 8 nm (one tubulin dimer spacing) and generates approximately 6 pN of stall force; myosin II takes steps of approximately 5–25 nm and generates 3–5 pN. These measurements have confirmed the **hand-over-hand** walking mechanism for kinesin (analogous to the alternating use of two hands in climbing a rope) and have provided detailed insight into how mechanical force regulates the motor's biochemical cycle through load-dependent gating of ADP release.

---

# Chapter 7: Biophysics of Membranes

## 7.1 Structure and Physical Properties of Lipid Bilayers

The **plasma membrane** of all cells and the membranes of organelles are lipid bilayers — two-dimensional fluid assemblies of amphipathic lipid molecules (primarily phospholipids, sphingolipids, and cholesterol) in which the hydrophobic tails are sequestered in the interior and the hydrophilic head groups face the aqueous environments on both sides. The spontaneous self-assembly of lipid bilayers from phospholipids in water is driven by the hydrophobic effect: the energy cost of exposing the non-polar fatty acid chains to water is minimized by closing the bilayer into a sealed vesicle with no exposed edges.

The **fluid mosaic model** (proposed by Singer and Nicolson in 1972) describes the membrane as a two-dimensional fluid in which protein molecules are embedded. Both lipids and proteins undergo lateral diffusion within the plane of the membrane; the lateral diffusion coefficient of a lipid molecule in a biological membrane is approximately 1–5 µm<sup>2</sup>/s, meaning a lipid molecule traverses the entire surface of a 10 µm cell in a few seconds. This lateral mobility is essential for many membrane functions, including signaling (receptors must be able to diffuse to find their ligands), transport (channels must be correctly positioned), and membrane fusion (lipids must be able to flow and rearrange during vesicle fusion). The "fluid" character of the membrane depends on temperature and lipid composition; membranes undergo a gel-to-liquid crystalline phase transition at a temperature (\( T_m \)) determined by the degree of unsaturation of the fatty acid chains.

<div class="remark">
The concept of <strong>lipid rafts</strong> — dynamic, nanoscale membrane domains enriched in cholesterol, sphingolipids, and specific proteins — has been intensely debated since its proposal in the late 1990s. The evidence is that biological membranes are not perfectly homogeneous fluids but rather show fluctuating domains of different compositions and physical properties that may play important roles in organizing signaling complexes and sorting membrane proteins. The biophysical methods most productive in characterizing these domains include single-molecule tracking, super-resolution microscopy (PALM/STORM), fluorescence correlation spectroscopy (FCS), and Förster resonance energy transfer (FRET) — all of which are sensitive to molecular dynamics at nanometer scales and microsecond timescales where classic fluorescence microscopy is blind.
</div>

## 7.2 Membrane Potential and Ion Transport

The **membrane potential** — the electrical potential difference across the plasma membrane — is one of the most fundamental properties of living cells and is the basis of nerve conduction, muscle contraction, sensory transduction, and many aspects of cellular signaling. The membrane potential arises from the unequal distribution of ions across the membrane combined with the selective permeability of the membrane to different ions.

The equilibrium potential for each ion species is given by the **Nernst equation**:

\[
E_{ion} = \frac{RT}{zF} \ln \left(\frac{[\text{ion}]_o}{[\text{ion}]_i}\right)
\]

where \( R \) is the gas constant, \( T \) is the absolute temperature, \( z \) is the ion's valence (with sign), \( F \) is the Faraday constant, and the subscripts \( o \) and \( i \) denote outside and inside concentrations respectively. At 37°C, \( RT/F \approx 26.7 \) mV, so for a monovalent cation (z = +1):

\[
E_{ion} \approx 26.7 \text{ mV} \times \ln \left(\frac{[\text{ion}]_o}{[\text{ion}]_i}\right)
\]

For K<sup>+</sup> in a typical mammalian cell (\( [\text{K}^+]_i \approx 140 \) mM, \( [\text{K}^+]_o \approx 4 \) mM), \( E_{K^+} \approx -94 \) mV. For Na<sup>+</sup> (\( [\text{Na}^+]_i \approx 10 \) mM, \( [\text{Na}^+]_o \approx 145 \) mM), \( E_{Na^+} \approx +70 \) mV. The **resting membrane potential** of a typical neuron (approximately −70 mV) lies between these values, reflecting the relative permeability of the resting membrane (primarily permeable to K<sup>+</sup> through leak channels).

The **Goldman-Hodgkin-Katz equation** accounts for multiple permeant ions simultaneously:

\[
V_m = \frac{RT}{F} \ln \left(\frac{P_{K^+}[K^+]_o + P_{Na^+}[Na^+]_o + P_{Cl^-}[Cl^-]_i}{P_{K^+}[K^+]_i + P_{Na^+}[Na^+]_i + P_{Cl^-}[Cl^-]_o}\right)
\]

where \( P_{ion} \) is the membrane permeability to each ion. The Na<sup>+</sup>-K<sup>+</sup> ATPase (sodium-potassium pump) is essential for maintaining the ionic gradients underlying the resting membrane potential: it actively transports 3 Na<sup>+</sup> out and 2 K<sup>+</sup> in per ATP hydrolyzed, keeping intracellular Na<sup>+</sup> low and intracellular K<sup>+</sup> high. The pump consumes approximately 25–40% of the ATP in a resting neuron — testament to the metabolic cost of maintaining electrochemical gradients.

---

# Chapter 8: Thermodynamics in Biological Systems

## 8.1 The Laws of Thermodynamics Applied to Life

Living organisms are **open systems** that exchange both matter and energy with their environment. They maintain a state of low entropy (high organization) by continuously consuming high-quality energy (from food, sunlight, or chemical oxidations) and dissipating low-quality energy (heat) to the environment — in full compliance with the second law of thermodynamics. The apparent paradox between the second law (entropy of an isolated system always increases) and the observed high order of living systems is resolved by recognizing that organisms are not isolated systems: they decrease their own entropy only at the cost of a larger increase in the entropy of their surroundings.

The relevant thermodynamic potential for processes occurring at constant temperature and pressure — the conditions prevailing inside cells — is the **Gibbs free energy** (\( G \)):

\[
G = H - TS
\]

where \( H \) is the enthalpy, \( T \) is the absolute temperature, and \( S \) is the entropy. A process is spontaneous if it decreases the Gibbs free energy of the system (\( \Delta G < 0 \)). For a chemical reaction at constant \( T \) and \( P \):

\[
\Delta G = \Delta G^0 + RT \ln Q
\]

where \( \Delta G^0 \) is the standard free energy change (at 1 M concentrations, 298 K, pH 7.0 for biochemistry) and \( Q \) is the reaction quotient (ratio of product to reactant concentrations). At equilibrium, \( \Delta G = 0 \) and \( Q = K_{eq} \), giving:

\[
\Delta G^0 = -RT \ln K_{eq}
\]

The hydrolysis of ATP (ATP → ADP + P<sub>i</sub>) has a standard free energy change \( \Delta G^0 = -30.5 \) kJ/mol, but under cellular conditions (where [ATP] >> [ADP][P<sub>i</sub>]) the actual \( \Delta G \) is approximately −50 to −60 kJ/mol — approximately 12–15 \( k_B T \) per molecule — making ATP hydrolysis thermodynamically favorable enough to drive a wide variety of otherwise unfavorable biochemical reactions and mechanical processes.

## 8.2 Bioenergetics: ATP Synthesis

The synthesis of ATP — the universal energy currency of life — is accomplished by two major pathways in eukaryotes: **substrate-level phosphorylation** (in glycolysis and the citric acid cycle, where ATP is produced directly by transfer of a phosphate group from a phosphorylated substrate to ADP) and **oxidative phosphorylation** (in the inner mitochondrial membrane, where the electrochemical proton gradient generated by the electron transport chain is used to drive ATP synthase). Oxidative phosphorylation is by far the more productive pathway, generating approximately 30–32 ATP per glucose molecule in eukaryotes (compared to 2 ATP from substrate-level phosphorylation in glycolysis).

The **chemiosmotic theory** of ATP synthesis, proposed by Peter Mitchell in 1961 (for which he received the Nobel Prize in Chemistry in 1978), posits that the electron transport chain establishes a **proton motive force** (\( \Delta\mu_{H^+} \)) across the inner mitochondrial membrane, consisting of both an electrical potential (\( \Delta\Psi \), inside negative) and a chemical gradient (\( \Delta\text{pH} \), inside alkaline):

\[
\Delta\mu_{H^+} = F\Delta\Psi - 2.303 RT \Delta\text{pH}
\]

In actively respiring mitochondria, \( \Delta\mu_{H^+} \approx 200 \) mV, with approximately 150 mV from the electrical component and approximately 50 mV from the pH gradient. Protons flow down this electrochemical gradient through the **ATP synthase** (also known as Complex V or the F<sub>0</sub>F<sub>1</sub>-ATPase), a remarkable rotary molecular motor in which the flow of protons through the membrane-embedded F<sub>0</sub> subunit drives the rotation of a central rotor, which in turn drives the conformational changes in the F<sub>1</sub> catalytic domain that synthesize ATP from ADP and inorganic phosphate. Approximately 3 protons flow through the ATP synthase per ATP synthesized (determined by the stoichiometry of the enzyme's rotary mechanism).

---

# Chapter 9: Neuron Biophysics

## 9.1 The Action Potential

The **action potential** is the electrical signal by which neurons transmit information over long distances. It is a transient reversal of the membrane potential — from the resting value of approximately −70 mV to a peak of approximately +40 mV, lasting approximately 1 ms — that propagates along the axon at speeds of 0.5–120 m/s. The action potential is an all-or-nothing event: once the membrane potential reaches the threshold (approximately −55 mV), a positive feedback cycle is initiated that generates the full action potential regardless of the magnitude of the triggering stimulus.

The ionic basis of the action potential was established by Alan Hodgkin and Andrew Huxley in a series of brilliant voltage clamp experiments on the giant axon of the squid (*Loligo pealii*) in the early 1950s. Using voltage clamp technology (which holds the membrane potential at a set value by passing the exact amount of current needed to prevent it from changing, allowing the measurement of the ionic currents directly), they demonstrated that the action potential involves two sequential ionic currents: first, a transient increase in Na<sup>+</sup> permeability (through voltage-gated Na<sup>+</sup> channels that open when the membrane depolarizes), causing Na<sup>+</sup> to rush in down its electrochemical gradient and driving the membrane potential toward \( E_{Na^+} \approx +70 \) mV; then, a delayed increase in K<sup>+</sup> permeability (through voltage-gated K<sup>+</sup> channels that open more slowly), causing K<sup>+</sup> to rush out and repolarize the membrane back toward \( E_{K^+} \approx −94 \) mV. The Na<sup>+</sup> channels also inactivate rapidly after opening, contributing to repolarization, and the membrane briefly hyperpolarizes below the resting potential (**after-hyperpolarization**) before returning to the resting state.

The **Hodgkin-Huxley model** — a system of four coupled differential equations — quantitatively describes these ionic currents and accurately predicts the time course and propagation of the action potential:

\[
C_m \frac{dV}{dt} = -g_{Na} m^3 h (V - E_{Na}) - g_K n^4 (V - E_K) - g_L (V - E_L) + I_{ext}
\]

where \( C_m \) is the membrane capacitance, \( g_{Na} \), \( g_K \), \( g_L \) are the maximum conductances for Na<sup>+</sup>, K<sup>+</sup>, and leak channels respectively, \( m \), \( h \), \( n \) are dimensionless gating variables (obeying their own first-order kinetic equations describing the voltage-dependent opening and inactivation of channels), and \( I_{ext} \) is the externally applied current. This model, derived from experimental data obtained with the simplest biophysical tools available, remains one of the greatest achievements of biophysics — the first complete quantitative description of a fundamental biological phenomenon.

## 9.2 Propagation of Action Potentials and Myelination

An action potential initiated at one point on an axon propagates along the axon because the local current flowing from the depolarized region to adjacent resting membrane brings that region to threshold, triggering an action potential there, and so on. The **propagation velocity** depends on the axon diameter and the membrane's electrical properties (resistance and capacitance). For unmyelinated axons, propagation velocity scales approximately with the square root of axon diameter; for myelinated axons (where the axon is wrapped in layers of myelin, an electrically insulating sheath of compacted glial cell membranes), propagation is dramatically faster and more efficient.

**Myelination** works by dramatically increasing the effective membrane resistance (because the myelin layers act as an insulating wrap) and by restricting action potential generation to the **nodes of Ranvier** — the small gaps in the myelin sheath spaced approximately 1–2 mm apart. The action potential "jumps" from node to node (**saltatory conduction**) rather than propagating continuously along the axon, drastically reducing the membrane area that must be depolarized and the amount of ionic current that must flow (and subsequently be pumped back by the Na<sup>+</sup>-K<sup>+</sup> ATPase). Myelinated axons achieve propagation velocities of up to 120 m/s (compared to 0.5–2 m/s for the largest unmyelinated axons) while consuming far less metabolic energy. The disruption of myelin sheaths in **multiple sclerosis** (MS) slows or blocks action potential propagation, causing the characteristic and unpredictable neurological symptoms of this autoimmune disease.

---

# Chapter 10: Physical Methods in Biology and Medicine — Part I

## 10.1 Microscopy: Optical, Fluorescence, and Super-Resolution

**Optical microscopy** has been the primary tool of cell biology since the seventeenth century, when Antonie van Leeuwenhoek first observed "animalcules" (bacteria and protists) with his hand-ground lenses. The fundamental resolution limit of optical microscopy is set by the **diffraction limit** — the inability to resolve features smaller than approximately half the wavelength of the light used (\( \lambda/2 \approx 200–300 \) nm for visible light). This limit arises from the wave nature of light: waves diffracted by small objects produce Airy disk patterns whose overlapping central maxima can be distinguished only if separated by at least the Rayleigh criterion distance:

\[
r_{Rayleigh} = \frac{0.61 \lambda}{NA}
\]

where \( NA \) is the **numerical aperture** of the objective lens (\( NA = n \sin\theta \), where \( n \) is the refractive index of the medium and \( \theta \) is the half-angle of the light cone). High-NA immersion objective lenses (NA up to approximately 1.45) and short-wavelength light (blue or near-UV) push the diffraction limit to approximately 150–200 nm — still insufficient to resolve molecular details within cells.

**Fluorescence microscopy** — using fluorescent dyes or genetically encoded fluorescent proteins (GFP, mCherry, and their many derivatives) as labels — dramatically improves specificity (labeling only the structure of interest against a dark background) and can exploit photophysical tricks to surpass the diffraction limit. **Super-resolution microscopy** techniques developed in the 2000s overcome the diffraction limit by exploiting the ability to detect and precisely localize individual fluorescent molecules: **PALM** (Photo-Activated Localization Microscopy) and **STORM** (Stochastic Optical Reconstruction Microscopy) use photoswitchable fluorescent molecules that are activated one at a time, fitted to a 2D Gaussian function to localize their centroid to approximately 10–30 nm, and accumulated over thousands of frames to reconstruct an image with 10–30 nm resolution. **STED** (Stimulated Emission Depletion) microscopy uses a second donut-shaped beam to selectively de-excite fluorophores outside a very small central spot, confining the effective fluorescent volume to below the diffraction limit. The 2014 Nobel Prize in Chemistry was awarded to Betzig, Moerner, and Hell for the development of super-resolution fluorescence microscopy.

## 10.2 Atomic Force Microscopy

**Atomic Force Microscopy** (AFM) was invented by Binnig, Quate, and Gerber in 1986 and has become an indispensable tool for imaging and mechanically probing biological samples — particularly lipid membranes, proteins, DNA, and living cells — in their native aqueous environments. The basic principle involves a very sharp tip (radius of curvature 1–20 nm) mounted on a flexible cantilever (spring constant typically 0.01–100 N/m) that is scanned across the sample surface. The interaction forces between the tip and the sample deflect the cantilever; this deflection is detected by the reflection of a laser beam off the cantilever back onto a position-sensitive photodiode. By maintaining a constant cantilever deflection (contact mode) or a constant oscillation amplitude (tapping mode) via a feedback loop, the scanner moves the sample up and down to follow the surface topography, recording a topographic map of the sample with nanometer lateral resolution and Angstrom vertical resolution.

AFM can also be used in **force spectroscopy mode** — the tip is brought into contact with the sample and then retracted while the force is monitored as a function of distance. This produces **force-distance curves** from which the mechanical properties of the sample (Young's modulus, adhesion, stiffness) can be extracted. Single-molecule force spectroscopy — in which a protein or nucleic acid molecule is attached between the tip and the substrate and stretched — reveals the mechanical response of individual biomolecules, including the force required to unfold a protein, the energetics of receptor-ligand binding, and the mechanics of DNA overstretching.

## 10.3 Electron Microscopy

**Scanning Electron Microscopy** (SEM) and **Transmission Electron Microscopy** (TEM) use beams of electrons rather than photons as the imaging radiation. Because the de Broglie wavelength of electrons at typical accelerating voltages is approximately 0.004 nm — three orders of magnitude shorter than visible light — the diffraction limit on electron microscope resolution is far below the dimensions of individual protein molecules. In practice, the resolution of TEM is limited to approximately 0.1–0.2 nm by lens aberrations, sample preparation artifacts, and radiation damage to biological samples.

In **SEM**, a focused electron beam is scanned across the sample surface, and the secondary electrons emitted from the surface at each point are detected by an Everhart-Thornley detector. SEM produces topographic images of surfaces with remarkable three-dimensional detail and depth of field. In **TEM**, the electron beam passes through an ultra-thin sample (typically 50–100 nm thick), and electrons scattered by the sample form a two-dimensional projection image of the internal structure on a detector. **Cryo-electron microscopy** (cryo-EM) — the technique of freezing biological samples in vitreous (non-crystalline) ice and imaging them at liquid nitrogen temperatures — has revolutionized structural biology by allowing the determination of protein structures at near-atomic resolution without the need for crystallization, earning the 2017 Nobel Prize in Chemistry for Dubochet, Frank, and Henderson.

## 10.4 X-ray Diffraction and NMR Spectroscopy

**X-ray crystallography** has determined the structures of more than 200,000 biological macromolecules deposited in the Protein Data Bank. Crystals of purified protein are illuminated by a monochromatic X-ray beam; the electrons in the crystal diffract the X-rays coherently in specific directions determined by **Bragg's law**:

\[
n\lambda = 2d\sin\theta
\]

where \( n \) is an integer (order of diffraction), \( \lambda \) is the X-ray wavelength, \( d \) is the spacing between crystal planes, and \( \theta \) is the angle of incidence. The diffraction pattern (recorded on a detector) contains information about the crystal structure in reciprocal space; mathematical Fourier transformation converts this pattern into an electron density map in real space, from which the atomic positions of all atoms in the protein can be determined.

**NMR spectroscopy** (Nuclear Magnetic Resonance) determines protein structures in solution — without the need for crystals — and also provides unique information about molecular dynamics. In an NMR magnet, the nuclei of certain atoms (primarily <sup>1</sup>H, <sup>13</sup>C, and <sup>15</sup>N) align with the applied magnetic field and precess (spin) at a characteristic **Larmor frequency** proportional to the field strength. Radiofrequency pulses excite these nuclei; when they relax back to equilibrium, they emit a radiofrequency signal that is detected and Fourier transformed to give the **NMR spectrum**. The chemical shift of each nucleus — its Larmor frequency relative to a reference — is highly sensitive to the local electronic environment, providing detailed information about molecular structure, protein-ligand interactions, hydrogen bonding, and dynamics on timescales from picoseconds to seconds.

---

# Chapter 11: Physical Methods in Biology and Medicine — Part II

## 11.1 Mass Spectrometry and Electrophoresis

**Mass spectrometry** (MS) measures the mass-to-charge ratio (\( m/z \)) of ions, allowing the precise determination of molecular masses, the identification of proteins from peptide fragment masses, and the quantitative profiling of complex protein mixtures (**proteomics**). Modern biological mass spectrometers use **electrospray ionization** (ESI) or **matrix-assisted laser desorption/ionization** (MALDI) to gently ionize large biomolecules without fragmenting them, and then separate the ions by mass using time-of-flight (TOF), Orbitrap, or ion trap analyzers. The resolution and mass accuracy of modern instruments are extraordinary — Orbitrap-based instruments can measure protein masses to within a few ppm, sufficient to distinguish proteins differing by a single amino acid.

**Electrophoresis** separates charged molecules (proteins, DNA, RNA) based on their migration through a gel matrix under an applied electric field. The driving force is the electric force on the charged molecule, balanced by the frictional resistance of the gel. **SDS-PAGE** (sodium dodecyl sulfate polyacrylamide gel electrophoresis) denatures proteins and coats them uniformly with the negatively charged detergent SDS, eliminating differences in charge-to-mass ratio and making migration rate dependent only on molecular size. This allows protein molecular weight to be determined by comparison to standards of known molecular weight. **Agarose gel electrophoresis** is used for DNA — linear dsDNA migrates through agarose at a rate approximately inversely proportional to the logarithm of its molecular weight (base pair number).

## 11.2 Spectroscopy: Absorption, Fluorescence, Circular Dichroism, and Raman

**UV-visible absorption spectroscopy** measures the wavelength-dependent absorption of light by molecules. The **Beer-Lambert law** relates absorbance to concentration:

\[
A = \varepsilon c l
\]

where \( A \) is the absorbance (dimensionless, also called optical density), \( \varepsilon \) is the molar extinction coefficient (L mol<sup>−1</sup> cm<sup>−1</sup>), \( c \) is the molar concentration, and \( l \) is the path length (cm). Proteins absorb strongly at 280 nm (due to aromatic amino acids, primarily tryptophan and tyrosine) and 230 nm (due to the peptide bond); nucleic acids absorb at 260 nm (due to the aromatic bases). The ratio \( A_{260}/A_{280} \) is used to assess the purity of a nucleic acid preparation — pure DNA gives a ratio of approximately 1.8, and pure RNA approximately 2.0.

**Circular Dichroism** (CD) spectroscopy measures the differential absorption of left- and right-circularly polarized light by chiral molecules, providing information about secondary structure. Alpha helices have a characteristic CD spectrum with minima at 222 nm and 208 nm and a maximum at 193 nm; beta sheets have different characteristic features; and random coil conformations have a large negative band near 200 nm. CD is thus a rapid and non-destructive method for assessing protein secondary structure content and for monitoring structural changes upon binding of ligands, changes in temperature, or changes in pH.

**Fluorescence spectroscopy** exploits the ability of certain molecules (**fluorophores**) to absorb a photon of one wavelength and emit a photon of longer wavelength (lower energy) after a very brief excited-state lifetime. The difference in wavelength between the absorption maximum and the emission maximum is the **Stokes shift**. Fluorescence is exquisitely sensitive (individual fluorescent molecules can be detected), highly specific (the excitation and emission spectra of different fluorophores are distinct), and provides dynamic information through **fluorescence anisotropy** (reporting molecular rotation and flexibility), **FRET** (Förster resonance energy transfer, reporting distances between 1–10 nm), and **fluorescence lifetime** measurements.

## 11.3 Patch Clamp Electrophysiology and Optical Tweezers

**Patch clamp electrophysiology**, developed by Neher and Sakmann (Nobel Prize 1991), enables the measurement of ionic currents through individual ion channel proteins — the most sensitive current measurement in biology, resolving single-channel currents of a few picoamperes. A fire-polished glass micropipette is pressed against the plasma membrane of a cell and gentle suction applied, causing the membrane to seal against the glass with an extremely high resistance (>1 GΩ — the "gigaseal"). This electrically isolates the membrane patch inside the pipette from the bulk solution, reducing background noise sufficiently to resolve the opening and closing of individual ion channels as discrete current steps. The voltage across the membrane can be controlled by the amplifier, allowing analysis of the voltage-dependence of channel gating. Patch clamp has revealed the single-channel conductance, selectivity, gating kinetics, and pharmacological properties of virtually every class of ion channel in biology.

**Optical tweezers** (laser tweezers) trap small objects (beads, cells, organelles) at the focus of a tightly focused laser beam through the gradient force exerted by the intense electric field on the polarizable particle. A particle in the laser focus experiences a restoring force approximately proportional to its displacement from the focus, making the optical trap equivalent to a Hookean spring with stiffness typically 0.01–1 pN/nm. Single molecules (motor proteins, DNA, RNA polymerase) attached to the trapped bead can be studied with sub-nanometer spatial resolution and sub-piconewton force resolution, revealing the step size and stall forces of molecular motors, the elasticity of single DNA and protein molecules, and the force generation of individual RNA polymerase molecules transcribing DNA.

## 11.4 Medical Imaging: MRI, Ultrasound, and Electrocardiography

**Magnetic Resonance Imaging** (MRI) is based on the NMR phenomenon applied to the hydrogen nuclei (<sup>1</sup>H) of water in biological tissues. In a strong magnetic field, water protons align with the field and precess at the Larmor frequency (\( \omega_0 = \gamma B_0 \), where \( \gamma \) is the gyromagnetic ratio and \( B_0 \) is the field strength). Radiofrequency pulses excite the protons; after the pulse, the protons relax back to equilibrium with characteristic **longitudinal relaxation time** (\( T_1 \)) and **transverse relaxation time** (\( T_2 \)) that depend on the local molecular environment of the water — and therefore on tissue type (fat, muscle, gray matter, white matter, tumor, etc.). Spatial encoding is achieved by applying linear gradient magnetic fields in three orthogonal directions, making the resonance frequency a linear function of position and allowing the signal to be deconvolved into a three-dimensional image by Fourier transformation. MRI provides outstanding soft tissue contrast without ionizing radiation and is the modality of choice for brain, spinal cord, joints, and soft tissue pathology.

**Ultrasound imaging** uses high-frequency sound waves (1–20 MHz) transmitted into the body by a piezoelectric transducer; reflections from tissue interfaces are detected by the same transducer and used to construct a real-time image based on the time of flight of each echo (depth) and the amplitude of the reflected signal (tissue reflectivity). The spatial resolution of ultrasound is approximately \( \lambda/2 \) of the sound wavelength; at 10 MHz in tissue (\( v \approx 1540 \) m/s, \( \lambda \approx 0.15 \) mm), resolution is approximately 0.15 mm. Ultrasound is radiation-free, portable, inexpensive, and provides real-time imaging, making it the first-line modality for fetal imaging, cardiac imaging (echocardiography), and abdominal organ assessment. **Doppler ultrasound** uses the Doppler frequency shift of reflected sound waves from moving structures (red blood cells) to measure blood flow velocity and direction — essential for assessing cardiac valve function and detecting arterial stenosis.

**Electrocardiography** (ECG) records the electrical activity of the heart from electrodes placed on the body surface. The depolarization wavefront propagating through the myocardium generates a current dipole that produces a changing electrical potential measurable at the skin surface. The characteristic **P wave** (atrial depolarization), **QRS complex** (ventricular depolarization), and **T wave** (ventricular repolarization) of the normal ECG are produced by the sequential activation of the sinoatrial node, atrioventricular node, bundle of His, bundle branches, and Purkinje fibers. Abnormalities of these waves — their amplitude, duration, morphology, and timing — provide diagnostic information about myocardial infarction (ST elevation or depression, Q waves), arrhythmias (abnormal QRS morphology or irregular rhythm), conduction defects (prolonged PR or QRS intervals), and electrolyte disturbances.

## 11.5 Dynamic Light Scattering and Surface Plasmon Resonance

**Dynamic Light Scattering** (DLS, also called photon correlation spectroscopy or quasi-elastic light scattering) measures the Brownian motion of particles in solution by analyzing the time-dependent fluctuations of scattered laser light. As particles diffuse randomly due to thermal motion, the constructive and destructive interference of light scattered from different particles fluctuates in time; the **autocorrelation function** of these intensity fluctuations decays with a characteristic time related to the diffusion coefficient (\( D \)) of the particle. The **Stokes-Einstein equation** relates the diffusion coefficient to the hydrodynamic radius (\( r_h \)) and the solvent properties:

\[
D = \frac{k_B T}{6\pi\eta r_h}
\]

DLS thus provides the hydrodynamic size distribution of particles in solution without any prior separation. It is widely used to characterize nanoparticle size in drug delivery research, protein aggregation, and the size of viruses and liposomes.

**Surface Plasmon Resonance** (SPR) is a label-free optical technique for measuring molecular interactions in real time. When light undergoes total internal reflection at the interface between a glass prism and a thin gold film, the evanescent electromagnetic wave at the interface can couple with surface plasmons (collective oscillations of electrons) in the gold film at a specific resonance angle that depends sensitively on the refractive index immediately above the gold surface. When a molecule (the ligand) is immobilized on the gold surface and an analyte flows past, binding of the analyte changes the local refractive index and shifts the resonance angle — a shift detectable with high sensitivity (\( \sim \)1 pg/mm<sup>2</sup> of surface mass). By monitoring the resonance angle over time as analyte is flowed on and then washed off, SPR provides real-time kinetic data on the association and dissociation rates (\( k_{on} \) and \( k_{off} \)) and the equilibrium dissociation constant (\( K_D = k_{off}/k_{on} \)) of molecular interactions — from antibody-antigen binding to drug-protein interactions to protein-DNA recognition.

<div class="example">
The application of SPR to drug discovery illustrates the power of physical methods in biomedicine. When developing a new therapeutic targeting a specific protein, chemists synthesize hundreds or thousands of candidate molecules and need to rapidly determine which bind the target protein with high affinity (low \( K_D \)) and the correct kinetics (slow dissociation rate — \( k_{off} \) — meaning the drug stays bound long enough to be effective). SPR allows the screening of binding affinity and kinetics of hundreds of compounds per day, ranking them quantitatively and revealing the structural determinants of binding (through structure-activity relationship analysis). This information guides medicinal chemists in designing improved compounds — iteratively applying the biophysical feedback to optimize the drug candidate before committing to expensive cell-based and animal studies.
</div>
