---
title: "BIOL 280: Introduction to Biophysics"
subjects: "BIOL"
prof: "Zoya Leonenko"
---

## Sources and References
**Primary textbook** — Srivastava, P. K. (2002). *Elementary Biophysics: An Introduction*. Alpha Science International.
**Supplementary texts** — Hallett, M. T., et al. *Physics for the Biological Sciences*. Thomson Nelson.
**Online resources** — PubMed (biophysics journals); Biophysical Society resources (biophysics.org); NCBI Bookshelf (molecular biology reference)

# Chapter 1: Systemic Biophysics — Biomechanics

## Section 1.1: The Physical Description of Biological Structure

Biophysics occupies the interface of physics and biology, bringing the quantitative tools of mechanics, thermodynamics, electrostatics, and optics to bear on the extraordinary complexity of living systems. At the macro scale — the scale of whole organisms — biophysics asks questions such as: how does a tendon store and release elastic energy during locomotion? What determines the maximum height of a tree? How does the architecture of bone balance strength against weight? At the molecular scale it asks: how does a protein fold? How do ion channels gate? What forces hold a lipid bilayer together? The discipline spans fifteen orders of magnitude in length — from the nanometer scale of molecular machines to the meter scale of whole organisms — and the physical principles that operate at each scale are qualitatively different.

This chapter begins at the macro scale with **biomechanics** — the application of classical mechanics (statics, dynamics, and mechanics of materials) to biological structures.

## Section 1.2: Statics and Forces in the Musculoskeletal System

The human musculoskeletal system is a collection of rigid links (bones) connected at pivot points (joints) and driven by contractile actuators (muscles) that pull on bony levers via tendons. The analysis of forces in this system draws directly on Newton's laws: a body in static equilibrium has zero net force and zero net torque acting on it.

Consider the simple case of holding a weight in the hand with the forearm horizontal. The forearm pivots at the elbow joint. Three forces act: the weight of the held object \( W \) at the palm, the weight of the forearm \( w \) at its center of mass, and the upward pull of the biceps \( F_b \) at its insertion approximately 5 cm from the elbow. Torque equilibrium about the elbow joint gives:

\[ F_b \cdot d_b = W \cdot d_W + w \cdot d_w \]

where \( d_b \), \( d_W \), and \( d_w \) are the perpendicular distances from the elbow to the respective force lines. Because \( d_b \) is much smaller than \( d_W \), the biceps must exert a force several times greater than the held weight. The human body is not optimized for force production but for **speed and range of motion**: the short moment arm of muscle insertion relative to the load means that a small contraction at the muscle produces a large displacement at the hand.

<div class="definition">
A <strong>lever</strong> is a rigid beam that pivots about a fulcrum. Three classes are defined by the relative positions of the fulcrum (F), effort (E), and load (L). In a <strong>Class I lever</strong>, the fulcrum lies between the effort and the load (example: the skull pivoting on the vertebral column). In a <strong>Class II lever</strong>, the load is between the fulcrum and the effort (example: standing on tiptoe, where the ball of the foot is the fulcrum). In a <strong>Class III lever</strong>, the effort lies between the fulcrum and the load (example: the biceps lifting the forearm) — by far the most common arrangement in the human body.
</div>

## Section 1.3: Mechanics of Materials — Bone, Tendon, and Cartilage

Biological materials exhibit rich mechanical behaviors that have been shaped by evolution to meet the demands of their functional roles. **Bone** is a composite material whose mechanical properties arise from the interplay between its mineralized matrix (hydroxyapatite crystals providing stiffness and compressive strength) and collagen fibers (providing flexibility and tensile strength). The **Young's modulus** (E) of cortical bone is approximately 17–20 GPa in the longitudinal direction — comparable to cast iron, but with far greater toughness (resistance to crack propagation) because the hierarchical structure of bone (from nanoscale collagen fibrils to microscale osteons to macroscale bone) deflects cracks at each level.

The mechanical behavior of bone under loading is described by the **stress-strain curve**. In the **elastic region** (below the yield stress), stress and strain are linearly proportional (Hooke's law), and the bone returns to its original shape upon unloading. Beyond the yield point, **plastic deformation** occurs — the bone is permanently deformed. At the ultimate stress, fracture occurs. The area under the stress-strain curve to the point of fracture is the **toughness** — the energy absorbed before failure.

**Tendons** are composed primarily of type I collagen fibers aligned parallel to the direction of loading; they exhibit a characteristic **toe region** at low strains (crimp straightening), followed by a nearly linear elastic region. Their low stiffness compared with bone allows them to function as elastic springs — notably the Achilles tendon, which stores and returns approximately 35% of the mechanical energy of each running step.

**Cartilage** is a biphasic material: a solid extracellular matrix (collagen and proteoglycans) and an interstitial fluid phase. Under sustained load, fluid is gradually squeezed out (creep), reducing cartilage stiffness. This viscoelastic behavior is critical for joint lubrication and shock absorption.

---

# Chapter 2: Biophysics of Fluid Flow

## Section 2.1: Fluid Mechanics Applied to Biological Systems

Fluids — both liquids and gases — are the media through which nutrients, oxygen, and hormones are distributed throughout living organisms. The physics of fluid flow in biological systems is governed by the same principles as engineering fluid mechanics, though the geometries and length scales encountered in biology produce some unexpected physical regimes.

A fluid in steady flow through a rigid cylindrical tube obeys the **Hagen-Poiseuille law**, which relates volume flow rate \( Q \) to the pressure gradient:

\[ Q = \frac{\pi r^4 \Delta P}{8 \eta L} \]

where \( r \) is the tube radius, \( \Delta P \) is the pressure difference across the length \( L \) of the tube, and \( \eta \) is the dynamic viscosity of the fluid. The fourth-power dependence on radius is of profound biological importance: a factor-of-two reduction in vessel radius requires a 16-fold increase in pressure to maintain the same flow rate. This relationship explains why arterial narrowing by atherosclerotic plaques dramatically increases cardiac workload and why the regulation of arteriolar radius is the primary mechanism by which the body controls organ blood flow.

<div class="definition">
The <strong>Reynolds number</strong> (\( Re \)) is the dimensionless ratio of inertial to viscous forces in a fluid:
\[ Re = \frac{\rho v d}{\eta} \]
where \( \rho \) is fluid density, \( v \) is mean flow velocity, \( d \) is the characteristic length (vessel diameter), and \( \eta \) is dynamic viscosity. For \( Re \ll 1 \) (as in capillaries and in microorganisms swimming in water), viscous forces dominate and flow is laminar. For \( Re > 4000 \), inertial forces dominate and flow becomes turbulent. In the aorta of a resting adult, \( Re \approx 1000–4000 \), placing the flow near the transition regime.
</div>

## Section 2.2: Blood as a Non-Newtonian Fluid

Blood is not a simple Newtonian fluid but exhibits **non-Newtonian** behavior — its viscosity is not constant but varies with shear rate. At low shear rates (in small vessels and at low flow velocities), red blood cells aggregate into rouleaux (stacks), increasing viscosity. At high shear rates (in large arteries), these aggregates break apart and red blood cells deform to align with the flow streamlines, reducing viscosity. This behavior, called **shear thinning**, means that the Hagen-Poiseuille law must be modified when applied to small blood vessels. The **Fåhræus-Lindqvist effect** describes the paradoxical decrease in apparent blood viscosity in vessels smaller than approximately 500 µm diameter, as red blood cells migrate toward the vessel axis, leaving a low-viscosity plasma layer near the wall.

---

# Chapter 3: Biophysics of Gas Transport

## Section 3.1: Diffusion and Gas Exchange

Gas exchange in biological systems ultimately depends on **diffusion** — the net movement of molecules down their concentration gradient. Fick's first law of diffusion states that the flux \( J \) (amount of substance crossing a unit area per unit time) is proportional to the concentration gradient:

\[ J = -D \frac{dC}{dx} \]

where \( D \) is the diffusion coefficient and \( dC/dx \) is the concentration gradient. The diffusion coefficient for a gas in a liquid is inversely proportional to the square root of the molecular mass (Graham's law) and depends on the viscosity of the medium. In water, diffusion is approximately 10,000 times slower than in air.

The **alveolar-capillary membrane** in the lung is the primary gas exchange surface in mammals. Its extraordinary thinness (0.1–0.2 µm) and enormous surface area (approximately 70 m² — roughly the area of a singles tennis court) minimize the diffusion path length and maximize the area available for exchange, respectively. The rate of diffusion across the membrane follows Fick's law extended by the **diffusing capacity** \( D_L \):

\[ \dot{V}_{O_2} = D_L \cdot (P_{A,O_2} - P_{c,O_2}) \]

where the driving force is the partial pressure gradient between alveolar gas (\( P_{A,O_2} \approx 100 \) mmHg) and pulmonary capillary blood (\( P_{c,O_2} \approx 40 \) mmHg in deoxygenated blood entering the capillary).

## Section 3.2: Oxygen Transport and Hemoglobin Cooperativity

Oxygen's low solubility in plasma (only 0.3 mL O₂ per 100 mL blood at normal arterial \( P_{O_2} \)) is far too small to meet the oxygen demands of active tissues. The solution is the oxygen-carrying protein **hemoglobin** (Hb) present in red blood cells at approximately 150 g/L. Each Hb molecule is a tetramer of four globin chains, each bearing a heme group containing a ferrous iron (Fe²⁺) atom that reversibly binds one oxygen molecule. The four heme groups within a single Hb molecule exhibit **cooperative binding**: binding of oxygen to the first heme increases the affinity of the remaining hemes for oxygen, producing a characteristic sigmoidal (S-shaped) oxygen-hemoglobin dissociation curve rather than the hyperbolic curve of a non-cooperative protein like myoglobin. This cooperativity means that Hb is nearly fully saturated at the high \( P_{O_2} \) of the lungs (approximately 97% saturation at 100 mmHg) yet releases a large fraction of its oxygen at the lower \( P_{O_2} \) of metabolically active tissues (approximately 75% saturation at 40 mmHg, declining further in exercising muscle).

---

# Chapter 4: Physics of Audition

## Section 4.1: Sound Waves and the Ear

Sound is a longitudinal mechanical wave — alternating compressions and rarefactions of a medium (typically air) propagating at approximately 343 m/s at 20°C. Sound intensity is measured in decibels (dB SPL), a logarithmic scale referenced to the threshold of human hearing (\( 2 \times 10^{-5} \) Pa or \( 10^{-12} \) W/m²):

\[ L = 10 \log_{10} \left(\frac{I}{I_0}\right) \text{ dB} \]

The human auditory system performs two fundamental operations: **frequency analysis** (determining the pitch of a sound) and **intensity coding** (determining its loudness). The outer ear (pinna and external auditory canal) channels sound waves to the **tympanic membrane** (eardrum), which vibrates in response. The three **ossicles** of the middle ear — malleus, incus, and stapes — form a mechanical linkage that transmits these vibrations to the oval window of the **cochlea**, while simultaneously providing an impedance matching system that maximizes the transfer of acoustic energy from the low-impedance air medium to the high-impedance fluid of the inner ear. Without this matching, approximately 99.9% of incident sound energy would be reflected at an air-fluid interface.

Within the cochlea, the mechanical vibration of the basilar membrane is the basis of frequency analysis. The basilar membrane is narrow and stiff at the base (responding to high frequencies) and wide and flexible at the apex (responding to low frequencies). This mechanical tuning is described by the **place principle**: different frequencies are encoded at different locations along the basilar membrane, and the corresponding **inner hair cells** — the actual mechanotransducers — are stimulated at specific positions. Active amplification by **outer hair cells** (which can change length in response to electrical stimulation through the protein prestin) sharpens the frequency selectivity and extends the dynamic range of the cochlea.

---

# Chapter 5: Physics of Vision

## Section 5.1: The Eye as an Optical System

The eye is a biological camera that forms an inverted, real image of the visual world on the photosensitive retina. The principal refractive surfaces are the **cornea** (accounting for approximately two-thirds of the eye's refractive power, about +43 diopters) and the **lens** (accounting for the remaining third, approximately +18 diopters in the relaxed state, with accommodation increasing this to about +30 diopters). The total optical power of the eye (\( \approx +60 \) diopters) focuses parallel rays from a distant object to a point on the retina, approximately 17 mm behind the cornea.

<div class="definition">
<strong>Accommodation</strong> is the process by which the eye changes its refractive power to focus objects at different distances. It is achieved by contraction of the <strong>ciliary muscle</strong>, which relaxes the zonular fibers suspending the lens, allowing the elastic lens capsule to pull the lens into a more spherical (more powerful) shape. With age, the lens becomes progressively less elastic (presbyopia), reducing the amplitude of accommodation.
</div>

Light transduction in photoreceptors depends on a conformational change in the visual pigment molecule. In rods, the pigment **rhodopsin** consists of the protein **opsin** covalently bound to **11-cis-retinal** (a derivative of vitamin A). Photon absorption isomerizes 11-cis-retinal to all-trans-retinal, triggering a conformational change in opsin that activates the G-protein **transducin**. Transducin activates phosphodiesterase, which hydrolyzes cGMP; the resulting drop in cGMP concentration closes cGMP-gated cation channels, hyperpolarizing the photoreceptor cell. This hyperpolarization is the photoreceptor's graded electrical signal, transmitted to bipolar and ganglion cells for further processing.

---

# Chapter 6: Physics of Biomolecules

## Section 6.1: Protein Structure and Forces

Proteins are biological polymers of amino acids that fold into precise three-dimensional structures that determine their function. The forces that stabilize the folded structure are numerous and subtle. **Covalent bonds** (peptide bonds linking amino acids; disulfide bonds between cysteine residues) provide the primary structure. **Hydrogen bonds** between backbone amide and carbonyl groups stabilize secondary structures: in an **α-helix**, each amide N-H donates a hydrogen bond to the carbonyl four residues earlier in the sequence; in a **β-sheet**, hydrogen bonds form between extended strands. **Hydrophobic interactions** are the dominant force driving protein folding: nonpolar amino acid side chains avoid contact with water and cluster in the protein core, maximizing the entropy of the surrounding water. **Electrostatic interactions** (salt bridges) and **van der Waals interactions** also contribute.

The energy landscape for protein folding is often depicted as a **funnel**: the unfolded ensemble occupies many high-energy conformations at the rim, and folding proceeds downhill in energy — with many routes and some local minima (traps) — to the unique native state at the bottom. **Molecular dynamics simulations** model protein behavior by numerically integrating Newton's equations of motion for all atoms in the system (typically 10⁴–10⁶ atoms) using classical force fields that parameterize bonded and nonbonded interactions.

---

# Chapter 7: Physics of Biological Membranes

## Section 7.1: The Fluid Mosaic Model and Membrane Biophysics

Biological membranes are quasi-two-dimensional fluid structures — **lipid bilayers** in which phospholipid molecules are organized into two leaflets with their hydrophilic head groups facing the aqueous phases and their hydrophobic acyl chains forming the membrane interior. The **fluid mosaic model** of Singer and Nicolson (1972) described the membrane as a two-dimensional fluid in which proteins float and diffuse laterally. Modern understanding recognizes additional complexities: lipid rafts (ordered microdomains enriched in sphingolipids and cholesterol), protein-induced curvature, and the coupling of membrane composition to organellar identity.

The mechanical properties of membranes are characterized by the **bending modulus** (\( \kappa \)) and the **area compressibility modulus** (K). Bending a membrane of bending modulus \( \kappa \) by a mean curvature \( H \) costs an energy per unit area of \( 2\kappa H^2 \). For typical biological membranes, \( \kappa \approx 10–20 \) \( k_BT \) (where \( k_B \) is Boltzmann's constant and \( T \) is absolute temperature), meaning that thermal fluctuations are sufficient to cause significant undulations — a behavior visible in giant unilamellar vesicles as "flickering" under a phase contrast microscope. **Atomic force microscopy (AFM)** can measure membrane mechanical properties at the nanoscale by indenting membrane-coated substrates with a sharp AFM tip, obtaining force-distance curves that reveal the elastic modulus and breakthrough forces of individual bilayer patches.

---

# Chapter 8: Thermodynamics of Biological Systems

## Section 8.1: Free Energy, Entropy, and the Second Law in Biology

Living organisms appear to defy the Second Law of Thermodynamics by maintaining highly ordered internal states far from thermodynamic equilibrium. In fact, life is entirely consistent with the Second Law: organisms are **open systems** that maintain order by consuming free energy (from sunlight in phototrophs, from chemical bond energy in chemotrophs) and exporting entropy to their surroundings. The global entropy of the universe increases; it is only locally, within the living cell, that order is maintained at the cost of free energy expenditure.

The relevant thermodynamic potential for biological reactions at constant temperature and pressure is the **Gibbs free energy** \( G \):

\[ G = H - TS \]

where \( H \) is enthalpy (energy content), \( T \) is absolute temperature, and \( S \) is entropy. A reaction proceeds spontaneously if \( \Delta G < 0 \). For a biochemical reaction, \( \Delta G \) depends on the concentrations of reactants and products:

\[ \Delta G = \Delta G^\circ + RT \ln Q \]

where \( \Delta G^\circ \) is the standard free energy change, \( R \) is the gas constant, \( T \) is temperature, and \( Q \) is the reaction quotient. At equilibrium, \( \Delta G = 0 \) and \( Q = K_{eq} \), giving \( \Delta G^\circ = -RT \ln K_{eq} \). The coupling of energetically favorable reactions (\( \Delta G < 0 \)) to unfavorable ones (\( \Delta G > 0 \)) — mediated by common intermediates such as ATP — is the fundamental strategy of cellular bioenergetics.

---

# Chapter 9: Bioenergetics

## Section 9.1: ATP and the Energy Currency of the Cell

**Adenosine triphosphate (ATP)** is the universal energy currency of living cells, mediating the coupling of energy-releasing metabolic reactions to energy-requiring processes such as biosynthesis, active transport, and mechanical work. The hydrolysis of ATP to ADP and inorganic phosphate releases approximately −30.5 kJ/mol under standard conditions, though the actual \( \Delta G \) in the cell is closer to −50 to −60 kJ/mol due to the maintained low concentrations of ADP and \( P_i \) relative to ATP.

ATP is regenerated from ADP and phosphate by **substrate-level phosphorylation** (in glycolysis and the citric acid cycle) and by **oxidative phosphorylation** (in the mitochondrial inner membrane). The latter process harnesses the energy of the electron transport chain — the stepwise transfer of electrons from NADH and FADH₂ to O₂ — to pump protons across the inner mitochondrial membrane, creating a **proton-motive force** (PMF) consisting of a pH gradient and a membrane potential. This PMF drives the **ATP synthase** (a molecular motor that rotates at approximately 100 revolutions per second under physiological conditions) to synthesize ATP from ADP and phosphate.

---

# Chapter 10: Neuron Biophysics

## Section 10.1: The Resting Membrane Potential

Neurons generate and propagate electrical signals by exploiting the electrochemical gradients of ions across their plasma membranes. In the resting state, the cytoplasm of a neuron is at approximately −70 mV relative to the extracellular fluid — the **resting membrane potential**. This potential arises from the differential permeability of the membrane to ions (primarily K⁺ outward and Na⁺ blockade) and the unequal distribution of those ions: K⁺ concentration is approximately 140 mM inside versus 5 mM outside; Na⁺ is approximately 15 mM inside versus 140 mM outside. The equilibrium potential for each ion is given by the **Nernst equation**:

\[ E_{ion} = \frac{RT}{zF} \ln \frac{\left[ion\right]_{out}}{\left[ion\right]_{in}} \]

where \( z \) is the valence of the ion and \( F \) is Faraday's constant. For K⁺ at 37°C, \( E_K \approx -90 \) mV; for Na⁺, \( E_{Na} \approx +60 \) mV. The actual resting potential is intermediate, reflecting the weighted contribution of each ion's permeability, as expressed in the **Goldman-Hodgkin-Katz equation**.

## Section 10.2: The Action Potential

The **action potential** is a transient, stereotyped reversal of the membrane potential that propagates without decrement along the axon. It was first quantitatively characterized by Hodgkin and Huxley in the squid giant axon (1952), for which they received the Nobel Prize. The action potential proceeds through several phases. When depolarization reaches the threshold potential (approximately −55 mV), **voltage-gated Na⁺ channels** open rapidly, allowing a massive influx of Na⁺ that drives the membrane potential toward \( E_{Na} \) (+60 mV) — the **depolarization** phase. Within milliseconds, Na⁺ channels inactivate (they enter a non-conducting inactivated state despite remaining in a permissive voltage range) and **voltage-gated K⁺ channels** (which open more slowly) allow K⁺ efflux, driving the membrane back toward \( E_K \) — the **repolarization** phase. A brief **hyperpolarization (undershoot)** follows as K⁺ channels remain open momentarily, transiently driving the potential more negative than the resting level. The **refractory period** — during which a second action potential cannot be generated — arises from Na⁺ channel inactivation (absolute refractory period) and the residual K⁺ conductance (relative refractory period) and ensures that action potentials propagate in only one direction along the axon.

---

# Chapter 11: Physical Methods in Biology and Medicine

## Section 11.1: Spectroscopic Methods

A broad family of analytical techniques exploits the interaction of electromagnetic radiation with biological molecules to probe their structure, dynamics, and composition.

**Absorption spectroscopy** is based on Beer-Lambert law: the absorbance \( A = \varepsilon c l \), where \( \varepsilon \) is the molar extinction coefficient, \( c \) is molar concentration, and \( l \) is the path length. UV-visible spectroscopy is used routinely to quantify nucleic acids (absorbance at 260 nm) and proteins (at 280 nm, from Trp and Tyr residues) and to measure enzyme kinetics.

**Fluorescence spectroscopy** exploits the emission of light at a longer wavelength (lower energy) by fluorescent molecules after photon absorption. Because fluorescence is exquisitely sensitive (capable of detecting single molecules) and environment-dependent (fluorophore quantum yield and emission wavelength shift with solvent polarity), it is widely used to report on protein conformational changes, membrane organization, and intracellular ion concentrations.

**Raman spectroscopy** detects inelastic scattering of photons by molecular vibrations; the resulting Raman spectrum is a fingerprint of a molecule's chemical bonds. Unlike infrared spectroscopy, Raman works well in aqueous solution, making it ideally suited for biological samples.

**NMR spectroscopy** exploits the quantum mechanical spin properties of atomic nuclei (\( ^1H \), \( ^{13}C \), \( ^{15}N \)) in a magnetic field. In solution NMR, through-bond and through-space correlations between nuclear spins provide complete three-dimensional structural information for proteins up to approximately 50 kDa.

**Circular dichroism (CD)** measures the differential absorption of left and right circularly polarized light by chiral molecules. The far-UV CD spectrum (190–250 nm) reports on protein secondary structure content: α-helices give characteristic negative ellipticities at 208 and 222 nm, while β-sheets give a negative minimum near 218 nm.

## Section 11.2: Microscopy Techniques

**Optical microscopy** resolves structures down to approximately 200 nm — the diffraction limit of visible light. Phase contrast and differential interference contrast (DIC) modalities reveal transparent biological structures without staining. **Fluorescence microscopy** uses fluorophore-labeled antibodies or genetically encoded fluorescent proteins (GFP and its variants) to localize specific molecules within cells. **Super-resolution microscopy** techniques (STORM, PALM, STED) circumvent the diffraction limit to achieve resolutions of 10–50 nm by exploiting stochastic switching of individual fluorophores.

**Electron microscopy (EM)** uses electrons (wavelength ~0.004 nm) rather than light to achieve sub-nanometer resolution. **Transmission electron microscopy (TEM)** passes the electron beam through ultra-thin (60–100 nm) sections of specimen to produce projection images; it has been used to determine the structures of ribosomes, viruses, and membrane proteins. **Scanning electron microscopy (SEM)** scans a focused electron beam across the specimen surface, detecting secondary electrons to produce three-dimensional topographic images of cells and tissues.

**Atomic force microscopy (AFM)** uses a nanometer-scale tip attached to a flexible cantilever to scan over a surface, measuring topography with subnanometer resolution and — critically — measuring forces in the piconewton range. AFM has been used to image individual DNA molecules, membrane proteins, and lipid bilayers, as well as to measure the unfolding forces of individual protein molecules and the mechanics of living cells.

## Section 11.3: Medical Imaging

**X-ray imaging** exploits the differential attenuation of X-rays by tissues of different densities: bone attenuates X-rays strongly (producing white areas on the film or detector), while soft tissue attenuates less. Conventional X-ray radiography is a two-dimensional projection technique. **CT (computed tomography)** acquires X-ray projections at many angles and uses filtered back-projection algorithms to reconstruct cross-sectional (tomographic) images, enabling three-dimensional visualization of internal anatomy.

**Magnetic resonance imaging (MRI)** uses strong magnetic fields (1.5–7 Tesla) and radiofrequency pulses to manipulate the nuclear spin states of hydrogen atoms (primarily in water and fat). The relaxation of hydrogen spins back to equilibrium generates a radiofrequency signal that can be spatially encoded to produce cross-sectional images with exquisite soft-tissue contrast. Different pulse sequences (T1-weighted, T2-weighted, FLAIR) highlight different tissue properties.

**Ultrasound imaging** uses high-frequency sound waves (1–15 MHz) that are reflected at interfaces between tissues of different acoustic impedance. The time delay between pulse emission and echo reception allows reconstruction of depth information. Ultrasound is particularly valuable for imaging soft tissues and for real-time imaging of moving structures such as the beating heart and blood flow (using Doppler ultrasound).

**Electrocardiography (ECG)** records the electrical activity of the heart from the body surface. The cardiac action potential propagates in a coordinated wave through the atria and ventricles, creating a dipole that changes in orientation and magnitude with time. The ECG records this dipole as deflections (P wave: atrial depolarization; QRS complex: ventricular depolarization; T wave: ventricular repolarization) from which cardiac rhythm, conduction abnormalities, and ischemic changes can be diagnosed.

**Electroencephalography (EEG)** similarly records the extracranial electrical signals generated by the synchronous activity of millions of cortical neurons. EEG is used clinically in the diagnosis of epilepsy and sleep disorders and in research on cognitive processes.
