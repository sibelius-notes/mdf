---
title: "PSYCH 306: Perception"
prof: Clara Colombatto
---

## Sources and References

**Primary textbook** — Wolfe, J. M., Levi, D. M., Holt, L. L., Bartoshuk, L. M., Herz, R. S., Klatzky, R. L., et al. (2025). *Sensation and Perception*, 7th ed. Oxford University Press. ISBN 9780197663844.
**Supplementary texts** — Goldstein, E. B. (2019). *Sensation and Perception*, 10th ed. Cengage; Kandel, E. R., Koester, J. D., Mack, S. H., & Siegelbaum, S. A. (2021). *Principles of Neural Science*, 6th ed. McGraw-Hill.
**Online resources** — Michael Bach's Visual Phenomena and Optical Illusions (michaelbach.de/ot); Dale Purves lab resources (purves.neuro.duke.edu); MIT OpenCourseWare 9.35 Perception and the Brain.

---

# Chapter 1: Introduction to Sensation and Perception

## 1.1 Distinguishing Sensation and Perception

<div class="definition">
<strong>Sensation</strong> is the process by which sensory receptors detect and transduce physical energy (light, sound, pressure, chemical molecules) into neural signals. <strong>Perception</strong> is the interpretation and organization of sensory information into a coherent, meaningful experience of the world.
</div>

The distinction is blurry in practice — the visual system begins interpreting information at the retinal level — but conceptually useful: sensation refers to the early, detector-level encoding; perception refers to the higher-level representation.

## 1.2 Psychophysics

**Psychophysics** is the study of the relationship between physical stimuli and psychological experience. Founded by Fechner (1860), who systematized Weber's earlier work.

**Detection threshold**: the minimum stimulus intensity required for detection. Operationally defined as the intensity detected 50% of the time.

**Weber's Law**: the just-noticeable difference (JND) is proportional to the background stimulus intensity:
\[ \Delta I / I = k \]
where \( k \) is **Weber's fraction** (constant for a given sense). For brightness: \( k \approx 0.02 \); for weight: \( k \approx 0.02 \); for loudness: \( k \approx 0.1 \).

**Fechner's Law**: integrating Weber's Law gives a logarithmic relationship between physical intensity and perceived magnitude:
\[ S = k \log(I/I_0) \]

**Stevens' Power Law**: a power function better fits data across a wider range:
\[ S = k I^n \]
The exponent \( n \) varies by modality: \( n < 1 \) for brightness (\( n \approx 0.33 \)); \( n > 1 \) for electric shock (\( n \approx 3.5 \)); \( n \approx 1 \) for length estimation.

**Signal Detection Theory (SDT)**: separates sensitivity (\( d' \)) from response criterion (\( \beta \) or \( c \)). Observers' decisions reflect both how well they can detect a signal AND their willingness to report it. Accounts for false alarms and hits independently.

## 1.3 The Visual System: Overview

Vision is the dominant sense in humans. ~30% of the cortex is devoted to visual processing (vs. ~8% for touch, ~3% for hearing). The visual system solves the **inverse optics problem**: reconstructing the 3D world from 2D retinal images, which is fundamentally underdetermined.

---

# Chapter 2: From Light to Neural Signals

## 2.1 The Nature of Light

Visible light is electromagnetic radiation at wavelengths ~380–700 nm. Light has both wave properties (interference, diffraction) and particle properties (photons). The visual system is sensitive to ~1 photon under optimal conditions (dark-adapted rod).

**Key physical properties mapped to perceptual qualities**:
- Wavelength → Hue
- Intensity (amplitude) → Brightness/Luminance
- Spectral complexity → Saturation

## 2.2 The Eye

**Cornea and lens**: refract light to focus it on the retina. The cornea provides ~2/3 of the eye's focusing power (fixed); the lens provides the remaining 1/3 (adjustable via **accommodation** by ciliary muscles — changes curvature of the lens).

**Pupil**: controlled by iris; dilates in dim light (increases sensitivity); constricts in bright light (reduces light, increases depth of field).

**Retina**: a thin sheet of photoreceptors and interneurons at the back of the eye.

## 2.3 Photoreceptors

| Type | Number | Location | Pigment | Function |
|------|--------|---------|---------|---------|
| **Rods** | ~120M | Peripheral | Rhodopsin (peak 498 nm) | Scotopic (dim light) vision; achromatic |
| **Cones (S)** | ~6M | Mostly foveal | S-opsin (peak ~420 nm) | Photopic (bright light); colour |
| **Cones (M)** | | | M-opsin (peak ~530 nm) | Colour |
| **Cones (L)** | | | L-opsin (peak ~560 nm) | Colour; highest density in fovea |
| **ipRGC** | ~1M | Sparse | Melanopsin (peak ~480 nm) | Circadian entrainment; pupil reflex |

**Fovea**: ~2° of central vision; exclusively cones; highest acuity (1:1 cone:ganglion cell ratio).

## 2.4 Phototransduction

Light → photoisomerization of retinal (11-*cis* → all-*trans*) → conformational change of opsin → G-protein (transducin) cascade → PDE activates → cGMP hydrolysis → closure of cGMP-gated Na⁺/Ca²⁺ channels → **hyperpolarization** of photoreceptor → reduced glutamate release.

Dark current: in darkness, cGMP-gated channels are open → depolarized → tonic glutamate release. Light hyperpolarizes → reduced glutamate release.

## 2.5 Retinal Processing and Receptive Fields

**Centre-surround receptive fields**: bipolar cells and retinal ganglion cells (RGCs) respond best to local contrast, not absolute luminance.
- **ON-centre**: excited by light in centre, inhibited by surround.
- **OFF-centre**: inhibited by centre light, excited by surround.

This is achieved through direct (ON) and indirect (OFF) connections through bipolar cells, with lateral inhibition via horizontal cells.

**Ganglion cell types**:
- **P (parvo) cells**: small, slow, colour-sensitive, high spatial resolution — project to parvocellular layers of LGN.
- **M (magno) cells**: large, fast, motion-sensitive, low spatial resolution — project to magnocellular layers of LGN.
- **K (konio) cells**: diverse; project to koniocellular layers of LGN.

---

# Chapter 3: Spatial Vision

## 3.1 Spatial Frequency Analysis

The visual system can be analysed as a set of **spatial frequency** channels (analogous to Fourier decomposition of the retinal image):
\[ I(x, y) = \sum_f A_f \cos(2\pi f x + \phi_f) \]

**Spatial frequency** \( f \) (cycles/degree): the number of complete contrast cycles per degree of visual angle.

**Contrast Sensitivity Function (CSF)**: the visual system's sensitivity as a function of spatial frequency. Peak sensitivity ~4–8 cycles/degree; rolls off at low frequencies (due to lateral inhibition) and at high frequencies (due to diffraction limit and receptor spacing). The CSF is the visual system's **transfer function**.

## 3.2 Cortical Processing of Spatial Information

**V1 (primary visual cortex)**: neurons are selective for:
- **Orientation**: each V1 simple cell has an elongated receptive field selective for bars or gratings at a specific orientation. Organized in **orientation columns**.
- **Spatial frequency**: different V1 cells are tuned to different spatial scales.
- **Ocular dominance**: cells respond to input from one eye or the other; organized in **ocular dominance columns**.
- **Direction of motion**: some V1 cells respond only to motion in one direction.

**Gabor functions**: the optimal mathematical description of V1 simple cell receptive fields is a **Gabor filter** — a Gaussian-windowed sinusoidal grating. These are also the optimal joint representation in position and spatial frequency (uncertainty principle).

**Cortical magnification**: the central visual field (fovea) is represented by a disproportionately large area of V1 (the **cortical magnification factor** is ~6× larger for 1° central vision than for 10° peripheral).

## 3.3 Acuity

**Visual acuity**: the ability to resolve fine spatial detail. Measured as the minimum angle of resolution (MAR) or Snellen acuity (20/20 = normal, resolving 1 arcmin).

Limits on acuity:
- **Optical**: diffraction limit, aberrations, pupil size.
- **Receptoral**: cone density in fovea (~0.5 arcmin spacing).
- **Neural**: cortical processing.

**Vernier acuity** (hyperacuity): alignment detection; threshold ~6 arcsec — 10× better than Snellen acuity. Achieved through population coding across many cortical neurons.

---

# Chapter 4: Object Perception

## 4.1 Gestalt Principles of Perceptual Organization

The Gestalt psychologists (early 20th century) proposed principles by which the visual system groups elements into coherent objects:

| Principle | Description |
|-----------|-------------|
| **Proximity** | Nearby elements are grouped together |
| **Similarity** | Similar elements are grouped together |
| **Continuity** | Continuous lines/contours are preferred over abrupt changes |
| **Closure** | Gaps in figures are perceptually completed |
| **Common fate** | Elements moving together are grouped together |
| **Symmetry** | Symmetric figures are preferred as figures over ground |

These reflect statistical regularities of the natural world (objects tend to be made of similar, proximal, continuous elements) that the visual system exploits as **prior knowledge**.

## 4.2 Figure-Ground Segregation

Before recognizing an object, the visual system must separate the **figure** (the object of interest) from the **ground** (the background). The **Rubin vase** (faces or vase?) is a bistable figure illustrating that figure-ground assignment is ambiguous and fluctuates.

**Cues to figure-ground**:
- **Surroundedness**: smaller, surrounded regions tend to be seen as figure.
- **Convexity**: convex regions tend to be seen as figure.
- **Symmetry**: symmetric regions tend to be figure.
- **Lower region**: regions occupying the lower visual field tend to be figure.

## 4.3 Object Recognition

**Two pathways** (Ungerleider & Mishkin):
- **Ventral ("what") stream**: V1 → V2 → V4 → IT (inferior temporal cortex). Object identity, faces, words.
- **Dorsal ("where/how") stream**: V1 → V2 → V5/MT → parietal cortex. Location, motion, visually-guided action.

**Viewpoint independence**: human object recognition is largely viewpoint-invariant (recognise an object from novel viewpoints). Neural correlates: neurons in IT respond to objects across many orientations.

**Template vs. structural description models**: template matching (compare retinal image to stored exemplars) is computationally expensive and viewpoint-dependent; structural descriptions (represent objects in terms of parts and relations — like Biederman's geons) allow viewpoint-invariant recognition.

---

# Chapter 5: Color Vision

## 5.1 Trichromacy

**Young-Helmholtz trichromacy**: any colour can be matched by a mixture of three primary lights (e.g., R, G, B) — because we have three cone types with overlapping spectral sensitivities. This is confirmed by **color-matching experiments**.

**Metamerism**: two physically different spectral distributions can appear identical if they produce the same tristimulus response.

## 5.2 Colour Opponency

At the level of the LGN and cortex, colour is represented in **opponent channels**:
- **L–M** (red–green opponent channel)
- **(L+M)–S** (yellow–blue opponent channel)
- **(L+M+S)** (luminance/achromatic channel)

This explains Hering's opponent colours (unique red/green/yellow/blue that cannot be perceived simultaneously), afterimages (stare at red, see green), and why we cannot perceive "reddish-green" or "bluish-yellow."

## 5.3 Colour Constancy

Objects maintain an approximately constant perceived colour under different illuminants (incandescent, fluorescent, sunlight), despite dramatically different spectral content in the reflected light. The visual system discounts illuminant colour.

Mechanisms: **chromatic adaptation** (selective bleaching of cone pigments); **retinex algorithm** (compare local ratios of cone responses); **Bayesian inference** (use prior knowledge of illuminant distributions to infer surface reflectance).

---

# Chapter 6: Space Perception

## 6.1 Monocular Depth Cues

| Cue | Description |
|-----|-------------|
| **Relative size** | Familiar objects that project smaller are perceived as farther |
| **Interposition** | Partially occluded objects are seen as farther |
| **Linear perspective** | Converging lines indicate depth (railroad tracks) |
| **Texture gradient** | Texture elements become smaller and denser with distance |
| **Atmospheric perspective** | Distant objects appear hazy/bluish (light scattering) |
| **Shading and shadows** | Shape from shading; cast shadows indicate relative positions |
| **Motion parallax** | As observer moves, nearer objects shift more than far objects |

## 6.2 Binocular Depth Cues

**Convergence**: the eyes rotate inward to fixate nearby objects; proprioceptive signals provide absolute distance cues for distances <2 m.

**Binocular disparity**: the two eyes receive slightly different retinal images (parallax). Objects not at the fixation distance project to non-corresponding retinal points — the disparity is a precise cue to depth relative to the fixation plane.

**Stereopsis**: the brain computes depth from disparity. Cells in V1 are **binocularly selective**; areas V2, V3A, and MT contain disparity-tuned neurons. **Stereoscope** (Wheatstone, 1838): present different images to each eye → vivid 3D perception, confirming binocular disparity is sufficient for depth.

**Random-dot stereogram** (Julesz, 1960): stereo depth perception without any monocular depth cues — demonstrates that disparity is processed at a neural level, not through prior object recognition.

---

# Chapter 8: Motion Perception

## 8.1 Why Motion Perception?

Motion provides information for: detecting predators, navigation (optic flow), segmenting objects from background, guiding reaching and grasping, and social perception (biological motion).

## 8.2 The Motion Correspondence Problem

When a stimulus moves, the visual system must match features across time: which element at time \( t_1 \) corresponds to which element at time \( t_2 \)? This **correspondence problem** is underdetermined — solved using spatial and temporal proximity, similarity, and common fate heuristics.

**Apparent motion** (Wertheimer, 1912): alternating lights in two positions → perceived as a single light moving. Demonstrates that motion perception is constructed by the brain, not simply detected.

## 8.3 Neural Mechanisms

**MT (V5)**: specialized area for motion processing; direction-selective neurons; critical for coherent motion perception. MT lesion → **akinetopsia** (inability to perceive motion; objects seem to teleport).

**The aperture problem**: local motion detectors (V1 simple cells with oriented receptive fields) are ambiguous about direction — only the component of motion perpendicular to the cell's preferred orientation is detected. MT integrates across local V1 detectors to solve the aperture problem.

## 8.4 Optic Flow and Biological Motion

**Optic flow**: the pattern of apparent motion of objects/surfaces in the visual field during observer movement. Gibson (1950): optic flow provides information for heading direction and time-to-contact.

**Biological motion** (Johansson, 1973): point-light displays of walking figures are immediately recognized as human biological motion even without object shape cues. Specialized processing in the **STS** (superior temporal sulcus).

---

# Chapter 7: Attention

## 7.1 What is Attention?

<div class="definition">
<strong>Attention</strong> is the selective allocation of cognitive processing resources to a subset of available information. It determines what enters consciousness and is processed in detail.
</div>

Types:
- **Selective attention**: focus on one source while ignoring others (**cocktail party effect**).
- **Divided attention**: attempting to process multiple sources simultaneously.
- **Sustained attention (vigilance)**: maintaining focus over extended periods.
- **Spatial attention**: directing attention to a location in space.

## 7.2 Spatial Attention

**Covert attention**: shifting attention without moving the eyes. Posner cueing paradigm (1980): a cue indicating where a target will appear speeds detection (valid cue > invalid cue > neutral) — **attentional spotlight**.

**Neural correlates of spatial attention**: attending to a location enhances neural responses in sensory cortex representing that location (Moran & Desimone, 1985 in monkey V4 and IT). Attention modulates contrast sensitivity — attended stimuli appear higher in contrast.

## 7.3 Feature and Object-Based Attention

**Feature search** vs. **conjunction search** (Treisman):
- **Pre-attentive features** (e.g., colour, orientation, size): detected in parallel across the visual field — "pop out."
- **Conjunctions of features** (e.g., red vertical among green vertical + red horizontal): require serial search — attention must bind features at each location.

**Feature Integration Theory (FIT)** (Treisman & Gelade, 1980): features are encoded in separate maps; conjunction detection requires spatial attention to "glue" features at each location.

**Illusory conjunctions**: under divided attention, features can be incorrectly combined → perceiving a red X from a red O and blue X (**feature migration**).

## 7.4 Inattentional Blindness and Change Blindness

**Inattentional blindness** (Simons & Chabris, 1999 — gorilla study): unexpected objects are not consciously perceived when attention is occupied elsewhere. We see far less of the world than we think.

**Change blindness**: large changes in a scene are not detected across saccades or when attention is not directed to the changing object. Demonstrates that the visual system does not maintain a rich internal representation of the entire scene.

---

# Chapter 9–10: Hearing

## 9.1 The Physical Properties of Sound

Sound is a pressure wave. Key properties:
- **Frequency** (Hz) → pitch
- **Amplitude** (dB SPL) → loudness
- **Waveform complexity** → timbre

**Audible range**: 20–20,000 Hz. Threshold of hearing: 0 dB SPL at 1 kHz.

## 9.2 The Auditory System

**Outer ear**: pinna shapes the spectrum for sound localization; external canal amplifies ~2–5 kHz (speech frequencies).

**Middle ear**: tympanic membrane + 3 ossicles (malleus, incus, stapes) → oval window. **Impedance matching** (air → fluid); ~30 dB amplification.

**Cochlea**: basilar membrane resonates at different positions for different frequencies (**place code**; high frequencies at base, low at apex). Inner hair cells transduce basilar membrane motion → neural signals via stereocilia deflection.

## 9.3 Auditory Coding

**Rate code**: firing rate of auditory nerve fibres encodes sound intensity.

**Place code**: position of activated hair cells → frequency. Established by von Békésy's travelling wave theory (Nobel Prize 1961).

**Phase locking (temporal code)**: auditory nerve fibres fire at a specific phase of the stimulus cycle for frequencies below ~4–5 kHz, providing temporal information about frequency.

**Two-stream hypothesis for audition** (analogous to vision):
- **Ventral ("what") stream**: to temporal cortex — sound identity, speech, music.
- **Dorsal ("where") stream**: to parietal cortex — sound location, auditory motion.

## 9.4 Sound Localization

**Interaural time differences (ITD)**: low-frequency cues to azimuth (horizontal angle). The Jeffress model: a delay-line mechanism creates coincidence detectors tuned to specific ITDs.

**Interaural level differences (ILD)**: high-frequency cues; the head casts an acoustic shadow at high frequencies, creating level differences.

**Spectral shape cues**: the pinna filters high frequencies differently depending on elevation and front/back angle — providing cues to these dimensions that are unavailable from ITD/ILD alone.

---

# Chapter 11: Music and Speech Perception

## 11.1 Speech Perception

**The McGurk effect**: watching a mouth articulate /ga/ while hearing /ba/ → perceive /da/. Demonstrates audiovisual integration in speech perception.

**Categorical perception**: acoustic continua are perceived in discrete categories. Between phonetic categories, discrimination is poor; across the boundary, discrimination is excellent. This "sharpening" of phoneme boundaries is learned (language-specific).

**Duplex perception**: the same acoustic signal simultaneously conveys phonetic information (speech stream) and auditory object information (non-speech stream). Speech processing involves specialized, perhaps modular, neural mechanisms (Liberman & Mattingly).

## 11.2 Music Perception

**Pitch**: the subjective correlate of fundamental frequency; more complex for harmonic complex tones (missing fundamental — we hear the pitch corresponding to the absent fundamental when its harmonics are present).

**Timbre**: distinguishes instruments playing the same note. Determined by the spectral envelope (shape of the harmonic spectrum) and temporal envelope (attack-decay-sustain-release).

**Absolute pitch (AP)**: the ability to identify the pitch class of a tone without an external reference. ~1/10,000 in the general population; higher among early musical training and in tonal language speakers.

---

# Chapter 13: Touch and Proprioception

## 13.1 Mechanoreception

Four types of mechanoreceptors in glabrous (hairless) skin:

| Receptor | Adaptation | Receptive field | Sensation |
|---------|-----------|----------------|-----------|
| **Meissner's corpuscles** | Rapidly adapting (RA) | Small | Flutter, slip, texture |
| **Merkel's discs** | Slowly adapting (SA1) | Small | Fine texture, edges, dots |
| **Ruffini endings** | Slowly adapting (SA2) | Large | Skin stretch, grip |
| **Pacinian corpuscles** | Rapidly adapting (RA) | Large | Vibration, fine texture |

**Two-point discrimination threshold**: ~3 mm on fingertips (dense Meissner's); ~40 mm on the back (sparse innervation). Reflects receptor density and cortical magnification.

## 13.2 Pain

**Gate control theory** (Melzack & Wall, 1965): Aβ fibre activity closes a "gate" in the dorsal horn, inhibiting pain signals from Aδ and C fibres. Explains why rubbing reduces pain.

**Phantom limb pain**: pain in an amputated limb. Reflects cortical remapping after amputation and possibly maladaptive plasticity. Mirror therapy (Ramachandran): reflections of the intact limb can reduce phantom limb pain.

---

# Chapter 14–15: Olfaction and Taste

## 14.1 Olfaction

**Olfactory receptor neurons (ORNs)**: ~10 million in the olfactory epithelium. The human genome encodes ~400 functional olfactory receptors (from ~800 genes; ~400 are pseudogenes). Each ORN expresses only one receptor type.

**Combinatorial coding**: each odorant activates a unique combination of receptors → the brain identifies the odorant by the **pattern** of activity across the receptor population, not by any single receptor.

**Direct limbic projection**: olfactory signals project directly to the **piriform cortex** and **amygdala** (via the olfactory bulb) without thalamic relay. This uniquely close link to the limbic system explains the powerful emotional and mnemonic associations of odours (Proust phenomenon).

## 14.2 Taste

**Taste receptor cells** on **taste papillae** (fungiform, foliate, circumvallate) on the tongue. Five **basic tastes** with distinct receptor types:

| Taste | Receptor mechanism | Ecological function |
|-------|-------------------|---------------------|
| **Sweet** | GPCRs (T1R2+T1R3) | Detects carbohydrates/energy |
| **Salty** | Ion channels (Na⁺ transport) | Detects salt/minerals |
| **Sour** | Ion channels (H⁺) | Detects acids/spoilage |
| **Bitter** | GPCRs (TAS2Rs — ~25 receptors) | Detects toxins |
| **Umami** | GPCRs (T1R1+T1R3) | Detects amino acids/protein |

**Supertasters** (Linda Bartoshuk): ~25% of the population with higher fungiform papilla density → more intense taste responses; more sensitive to bitter (PROP/PTC) and to sweet and fat; may benefit from reduced obesity risk or increased risk of aversion to healthy foods.

**Taste–smell integration**: what we experience as "flavour" is a multisensory combination of taste + retronasal olfaction + trigeminal (texture, spice) signals. This is why food tastes bland when you have a cold (blocked nose eliminates retronasal olfaction).

---

# Chapter 16: Visual Illusions and Perceptual Paradoxes

## 16.1 Why Study Illusions?

Illusions reveal the **assumptions and heuristics** the visual system uses to construct perceptions. When those assumptions are violated by artificial stimuli, we see systematic errors.

## 16.2 Geometric Illusions

**Müller-Lyer illusion**: arrows with outward fins appear longer than arrows with inward fins of identical length. Account: the visual system applies **size constancy scaling** — interpreting the fins as perspective cues to depth (corners of a room vs. corner of a building), and scaling size accordingly.

**Ponzo illusion**: upper line between converging rails appears longer. Same account: converging lines as perspective cues; upper line interpreted as farther away → size constancy scaling makes it appear longer.

**Ames Room**: a trapezoidal room constructed to appear rectangular from one viewpoint. Observers who enter opposite corners appear to be of dramatically different sizes.

## 16.3 Lightness Illusions

**Simultaneous lightness contrast**: a grey patch appears lighter on a dark background and darker on a light background. Reflects the lateral inhibition mechanism underlying centre-surround receptive fields.

**Checker-shadow illusion** (Adelson): squares A and B on a checkerboard are the same physical luminance but appear very different. The visual system takes into account the shadow and infers different surface reflectances. Correct inference about the scene; "incorrect" about image luminance.

## 16.4 Perceptual Constancies

**Size constancy**: a person 10 m away who subtends half the visual angle of the same person at 5 m is not perceived as half their size. We rescale perceived size for perceived distance.

**Shape constancy**: a circular coin tilted away from the viewer projects an elliptical retinal image but is perceived as circular.

**Colour constancy**: objects appear to retain their colour under different illuminants.

These constancies reflect the visual system's goal: to perceive properties of objects (size, shape, colour) rather than properties of the retinal image. They are achieved through combining stimulus information with knowledge of viewing conditions.
