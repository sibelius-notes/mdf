---
title: "PSYCH 306: Perception"
prof: "Clara Colombatto"
subjects: "PSYCH"
---

## Sources and References

Primary textbook: Jeremy M. Wolfe et al., *Sensation and Perception*, 7th ed. (Oxford University Press, 2025). ISBN 9780197663844.

---

# Chapter 1: Introduction to Perception

## What Is Perception?

The study of perception begins with a deceptively simple question: how does the brain construct a coherent, meaningful experience of the world from the raw data supplied by the sense organs? A useful first distinction is between **sensation** and **perception**. Sensation refers to the initial encoding of physical energy by the sensory receptors — the conversion of light, pressure waves, or chemical molecules into neural signals. Perception refers to the subsequent interpretation of those signals, the process by which the brain organises, recognises, and assigns meaning to sensory input. The boundary between the two is not sharp; most modern researchers regard sensation and perception as points on a continuum rather than categorically distinct stages.

<div class="definition">
<strong>Sensation</strong> is the detection and transduction of physical energy by specialised receptor cells. <strong>Perception</strong> is the higher-level interpretive process that transforms neural representations into a coherent, meaningful model of the environment.
</div>

An immediate implication of this framework is that perception is not a passive recording of reality. The visual system, for instance, receives a two-dimensional pattern of photons at the retina and must infer the three-dimensional scene that gave rise to it. Helmholtz described perception as a process of **unconscious inference**: the brain applies learned rules about how the world is structured to arrive at the most probable interpretation of ambiguous sensory data. This idea anticipates modern Bayesian approaches to perception, in which the brain is treated as a probabilistic reasoner that combines prior expectations with sensory likelihood to compute a posterior estimate of the world.

## The Inverse Optics Problem

The fundamental challenge facing any visual system is what David Marr and others have called the **inverse optics problem**. Optics tells us how a given three-dimensional scene projects onto a two-dimensional image plane — this is a well-defined, forward problem. The perceptual system, however, must solve the reverse: given a two-dimensional retinal image, recover the three-dimensional structure that produced it. This reverse problem is mathematically **ill-posed** — infinitely many three-dimensional scenes are compatible with any given retinal image. The visual system resolves this underdetermination by implicitly assuming regularities that hold in the natural world (surfaces are usually opaque, light comes from above, objects are rigid, and so forth). When those assumptions are violated, perception fails in characteristic, informative ways — a fact that makes perceptual illusions powerful diagnostic tools.

## Psychophysics: Quantifying the Senses

Psychophysics is the branch of psychology concerned with measuring the relationship between physical stimuli and the sensory and perceptual experiences they produce. The field was founded in the nineteenth century by Ernst Weber and Gustav Fechner, who sought to discover mathematical laws linking the physical world to subjective experience.

### Weber's Law

The most fundamental observation in psychophysics is that the ability to detect a change in stimulus intensity is not absolute but proportional. Weber showed that the **just noticeable difference** (JND) — the smallest detectable change in a stimulus — is a constant fraction of the background intensity.

<div class="definition">
<strong>Weber's Law:</strong> \( \Delta I / I = k \), where \(\Delta I\) is the JND, \(I\) is the background intensity, and \(k\) (the Weber fraction) is a constant specific to each sensory modality. For brightness, \(k \approx 0.02\); for lifted weights, \(k \approx 0.02\); for loudness, \(k \approx 0.1\).
</div>

Weber's Law holds across a wide range of intermediate intensities but breaks down near the absolute threshold and at very high intensities.

### Fechner's Law

Fechner extended Weber's work by assuming that all JNDs are subjectively equal — that is, each barely noticeable increment represents the same psychological step. Integrating Weber's Law under this assumption yields a logarithmic relationship between physical intensity and perceived magnitude.

<div class="definition">
<strong>Fechner's Law:</strong> \( S = k \log(I / I_0) \), where \(S\) is the subjective magnitude, \(I\) is the physical intensity, \(I_0\) is the absolute threshold, and \(k\) is a scaling constant. The logarithmic form means that equal ratios of physical intensity produce equal differences in perceived magnitude.
</div>

Fechner's assumption that JNDs are subjectively equal was challenged by later researchers, most influentially by S. S. Stevens.

### Stevens' Power Law

Stevens developed the method of **magnitude estimation**, in which participants assign numbers proportional to the perceived intensity of stimuli. Across many modalities and conditions, the results follow a power function rather than a logarithm.

<div class="definition">
<strong>Stevens' Power Law:</strong> \( S = k I^n \), where \(n\) is the exponent characteristic of each modality. For brightness, \(n \approx 0.33\) (compressive); for apparent length, \(n \approx 1.0\) (linear); for electric shock, \(n \approx 3.5\) (expansive). When \(n < 1\), large physical changes produce small perceptual changes; when \(n > 1\), the converse holds.
</div>

### Signal Detection Theory

Classical threshold theory assumed a fixed threshold below which stimuli are never detected and above which they are always detected. This model could not account for the fact that detection performance depends on motivational factors — a radiologist searching for tumours under time pressure behaves differently from one working at leisure, even if the signal is identical. Signal Detection Theory (SDT), developed by Tanner, Swets, and Green in the 1950s, provides a more complete framework.

In the SDT framework, the observer's task is to decide whether a weak signal is present against a background of internal neural noise. On each trial, the combined signal-plus-noise (or noise alone) produces a value on an internal response axis. The observer sets a **criterion** (\(\beta\)) — a cut-off value — and responds "yes" if the internal response exceeds that criterion.

<div class="definition">
<strong>Sensitivity (d'):</strong> \( d' = z(\text{hit rate}) - z(\text{false alarm rate}) \), where \(z\) denotes the inverse normal transform. <em>d'</em> measures the separation between the signal-plus-noise and noise-only distributions and is independent of the observer's criterion. A liberal criterion produces many hits but also many false alarms; a conservative criterion produces few false alarms but also few hits.
</div>

The receiver operating characteristic (ROC) curve plots hit rate against false alarm rate as the criterion varies. A discriminating observer traces a curve that bows toward the upper-left corner; a chance observer traces the diagonal. SDT is now applied throughout perception, memory, and medical decision-making.

---

# Chapter 2: From Light to Neural Signals

## Optics of the Eye

Light enters the eye through the **cornea**, the transparent outer surface that contributes most of the eye's refractive power. It then passes through the **aqueous humour**, the **pupil** (an aperture whose diameter is regulated by the iris), and the **crystalline lens**. The lens accomplishes **accommodation** — active adjustment of its curvature by the ciliary muscles to focus near or distant objects on the retina. In youth the lens is elastic and accommodation is fast; with age the lens hardens, reducing near-focusing ability (presbyopia). The image formed on the retina is inverted and reversed — the brain compensates for this in the course of normal visual development.

## Retinal Anatomy

The retina is a thin sheet of neural tissue lining the posterior surface of the eye. It contains five classes of neurons arranged in layers: photoreceptors (rods and cones), bipolar cells, horizontal cells, amacrine cells, and retinal ganglion cells. The axons of the ganglion cells converge at the **optic disc** (the blind spot, containing no photoreceptors) and exit the eye as the optic nerve.

### Rods and Cones

The human retina contains approximately 120 million **rods** and 6 million **cones**. Rods are exquisitely sensitive to light and support vision in dim (scotopic) conditions but are achromatic. The single rod photopigment, **rhodopsin**, has peak sensitivity near 498 nm. Cones require higher light levels (photopic vision) and come in three types — S (short-wavelength, ~420 nm peak), M (medium, ~530 nm), and L (long, ~560 nm) — providing the basis for colour vision. The **fovea** is a central pit containing only cones packed at maximum density (~150,000 per mm²) and is the region of highest spatial acuity. Cone density falls steeply with eccentricity; rod density peaks in a ring surrounding the fovea and then declines toward the periphery.

<div class="remark">
The duplex retina — rods for sensitivity, cones for acuity and colour — represents an evolutionary compromise. Because rod convergence (many rods onto one ganglion cell) increases sensitivity at the cost of resolution, peripheral rod vision is excellent for detecting faint motion but poor for fine detail.
</div>

## Phototransduction

Phototransduction is the process by which photons are converted into electrical signals. When a photon is absorbed by a photopigment molecule (e.g., rhodopsin in rods), the chromophore **11-cis-retinal** isomerises to **all-trans-retinal**, activating the G-protein **transducin**. Transducin activates **phosphodiesterase**, which hydrolyses cyclic GMP (cGMP). In darkness, cGMP keeps cation channels open, allowing a steady inward current (the **dark current**). When light reduces cGMP levels, these channels close, hyperpolarising the photoreceptor. This hyperpolarisation reduces glutamate release onto bipolar cells, initiating the visual signal.

### Dark Adaptation

After exposure to bright light, sensitivity to dim light recovers over roughly 30–40 minutes. The first phase (~5–10 min) reflects cone adaptation (cone pigment regeneration). The second, slower phase reflects rod adaptation. The point at which rod sensitivity exceeds cone sensitivity is the **rod-cone break** in the dark adaptation curve. The slower recovery of rods reflects the kinetics of rhodopsin regeneration, which requires the retinal pigment epithelium (RPE) to re-isomerise all-trans-retinal back to 11-cis-retinal.

## Centre-Surround Receptive Fields and Lateral Inhibition

Retinal ganglion cells respond to light falling within a roughly circular region of the retina called their **receptive field**. Most ganglion cells have a concentric **centre-surround** organisation. In an **ON-centre** cell, light in the centre excites the cell and light in the surround suppresses it; an **OFF-centre** cell shows the reverse pattern. This organisation is mediated by **lateral inhibition** via horizontal cells at the outer plexiform layer: horizontal cells allow photoreceptors to inhibit neighbouring photoreceptors via their shared bipolar cells, sharpening the contrast at light-dark borders.

<div class="definition">
<strong>Lateral inhibition</strong> refers to the mechanism by which an activated sensory neuron inhibits the activity of its neighbours. In the retina, it is mediated by horizontal cells and produces the centre-surround receptive field structure of ganglion cells, which enhances edge detection and contrast sensitivity.
</div>

Lateral inhibition explains several visual phenomena, notably **Mach bands** — the appearance of a bright stripe just inside a light-to-dark transition and a dark stripe just inside the dark side — where no such stripes physically exist.

## Magnocellular (M) and Parvocellular (P) Pathways

Retinal ganglion cells can be divided into at least two major functional classes. **Midget (P-type) ganglion cells** have small cell bodies, small receptive fields, and slow conduction velocities; they project to the parvocellular (P) layers of the lateral geniculate nucleus (LGN). P cells are sensitive to fine spatial detail and colour. **Parasol (M-type) ganglion cells** have large cell bodies, large receptive fields, and fast conduction velocities; they project to the magnocellular (M) layers of the LGN. M cells are sensitive to low contrast, motion, and flicker but not colour.

## The Lateral Geniculate Nucleus and V1

The optic nerves from the two eyes meet at the **optic chiasm**, where fibres from the nasal hemiretina of each eye cross to the opposite hemisphere. As a result, each cerebral hemisphere receives visual information from the contralateral visual field, as represented in both eyes. After the chiasm, the optic tract projects to the **LGN** in the thalamus, which has six layers: two ventral magnocellular layers (1–2) and four dorsal parvocellular layers (3–6), with alternating layers receiving input from the ipsilateral and contralateral eyes.

From the LGN, the **optic radiation** projects to primary visual cortex (**V1**, also called striate cortex) in the occipital lobe. V1 neurons respond to oriented edges and spatial frequencies, forming the basis for higher-level form analysis in the extrastriate cortex.

---

# Chapter 3: Spatial Vision

## Spatial Frequency and the Contrast Sensitivity Function

Rather than describing the visual world in terms of isolated points, it is mathematically powerful to describe it as a sum of sinusoidal gratings varying in **spatial frequency** (cycles per degree of visual angle), orientation, and phase. This decomposition is the essence of Fourier analysis. A vertical sine-wave grating is characterised by its spatial frequency (how many light-dark cycles fit in one degree), its contrast (defined as \( C = (L_{\max} - L_{\min})/(L_{\max} + L_{\min}) \), the Michelson contrast), and its phase.

The **contrast sensitivity function** (CSF) describes the minimum contrast required to detect a sinusoidal grating as a function of its spatial frequency. The human CSF has an inverted-U shape: sensitivity is low at very low spatial frequencies (a large, uniform grating is not very visible at low contrast), peaks around 2–5 cycles per degree, and falls steeply at high spatial frequencies, reaching the acuity limit (~30–60 cpd) where even very high-contrast gratings cannot be resolved.

<div class="remark">
The CSF serves as a "window of visibility" for spatial information. Its low-frequency decline is attributed to lateral inhibitory interactions (centre-surround), which suppress responses to large uniform fields. The high-frequency cutoff is set by the optical quality of the eye (diffraction, aberrations) and by photoreceptor spacing at the fovea.
</div>

## Fourier Analysis of Visual Scenes

Any image can be decomposed into a sum of sinusoidal components of different spatial frequencies, orientations, and phases. Low spatial frequencies carry information about the broad, coarse structure of a scene (shapes, overall brightness); high spatial frequencies carry fine detail (edges, texture, fine print). The visual system appears to perform something akin to a local Fourier analysis through the operation of **spatial frequency channels** — populations of neurons tuned to limited ranges of spatial frequency and orientation. Evidence for these channels comes from selective adaptation experiments: adapting to a grating of one spatial frequency selectively elevates the detection threshold for similar spatial frequencies, leaving sensitivity at other frequencies relatively unaffected.

## Orientation Selectivity and Cortical Organisation

Unlike LGN neurons, whose receptive fields are circular, **V1 simple cells** respond selectively to oriented edges. A simple cell's receptive field has elongated ON and OFF subregions arranged side by side, making it maximally responsive to an edge or bar at a specific orientation. **Complex cells** respond to the preferred orientation anywhere within their receptive field, regardless of exact position (suggesting a spatial summation over simple cells).

V1 is organised into a **retinotopic map** — nearby locations on the cortex represent nearby locations in the visual field — with considerable magnification of the foveal representation (**cortical magnification factor**). Superimposed on this map are columns of neurons sharing preferences for **orientation** (orientation columns) and for which eye drives the response (**ocular dominance columns**). A **hypercolumn** is a unit of cortex (~1 mm²) containing a complete set of orientation columns for both eyes and thus a complete neural machinery for analysing one small region of the visual field.

## Ventral and Dorsal Streams

Visual information leaving V1 diverges into two major processing pathways. The **ventral stream** (V1 → V2 → V4 → IT cortex) processes object identity, colour, and form — the "what" pathway. The **dorsal stream** (V1 → V2 → MT/V5 → parietal cortex) processes spatial location, motion, and action guidance — the "where/how" pathway. This distinction, proposed by Ungerleider and Mishkin and elaborated by Goodale and Milner, is supported by double dissociations in patients with visual agnosia (ventral damage: unable to recognise objects but able to use them) and optic ataxia (dorsal damage: poor visually guided reaching despite intact recognition).

---

# Chapter 4: Object Perception

## Gestalt Principles of Perceptual Organisation

Before the brain can recognise an object, it must segregate the visual scene into distinct regions and group elements that belong together. The Gestalt psychologists of the early twentieth century (Wertheimer, Kohler, Koffka) proposed a set of perceptual grouping principles describing how the visual system achieves this organisation.

| Principle | Description |
|---|---|
| Figure-ground | The visual scene is parsed into a figure (the object of interest) and a ground (the background). Figures are seen as having definite shape; grounds extend behind them. |
| Proximity | Elements that are close together tend to be grouped. |
| Similarity | Elements that share features (colour, shape, size) tend to be grouped. |
| Good continuation | Elements that form smooth, continuous contours tend to be grouped, even when partially occluded. |
| Closure | Incomplete shapes tend to be perceived as complete, closed forms. |
| Common fate | Elements that move together tend to be grouped. |
| Symmetry | Symmetric regions tend to be perceived as figure. |

The Gestalt principles capture genuine regularities in natural scenes — objects tend to produce connected, symmetric, smoothly bounded regions — and can be reinterpreted in Bayesian terms as priors over scene structure.

## Marr's Computational Approach

David Marr proposed a three-stage framework for object recognition, each producing a progressively more abstract description of the visual scene.

<div class="definition">
<strong>Primal sketch:</strong> The initial representation, derived from intensity changes in the retinal image, consists of edges, bars, blobs, and terminations, along with their orientations, lengths, and positions. <strong>2.5D sketch:</strong> A viewer-centred description of surface orientation and depth, constructed by combining cues such as binocular disparity, shading, and texture gradient. <strong>3D model representation:</strong> An object-centred description specifying the three-dimensional arrangement of the object's parts, independent of viewing angle — enabling recognition from novel views.
</div>

Marr's framework was prescient in separating computational goals from algorithmic implementation and from neural hardware, a distinction now standard in computational neuroscience.

## Biederman's Recognition-by-Components Theory

Irving Biederman proposed that objects are mentally represented as arrangements of a small vocabulary of volumetric primitives called **geons** (geometric ions) — simple shapes such as cylinders, cones, bricks, and wedges, numbering about 36. A coffee mug, for example, is a cylinder (the body) with a torus (the handle) attached. Because geons are defined by qualitative, viewpoint-invariant properties of edges (curvature, collinearity, symmetry, parallelism, co-termination), they can be recognised from almost any viewpoint.

<div class="remark">
The view-independent approach of RBC contrasts with view-dependent (image-based) models, which propose that objects are represented as collections of stored two-dimensional views. Evidence for both positions exists: geons account well for recognition from unusual views, but recognition performance for complex objects often deteriorates with changes in viewpoint in ways that pure view-invariance would not predict.
</div>

## Face Perception

Faces constitute a special stimulus category that receives disproportionate neural resources. The **fusiform face area** (FFA), identified by Kanwisher and colleagues using fMRI, responds more strongly to faces than to any other object category. Several phenomena underscore the special nature of face processing.

The **face inversion effect** refers to the dramatic impairment in face recognition — but not object recognition — when faces are turned upside down (Yin, 1969). This suggests that face recognition normally relies on holistic or configural processing that is disrupted by inversion. The **other-race effect** (or cross-race effect) is the finding that people recognise own-race faces more accurately than other-race faces, attributed to differential experience with the two groups. **Prosopagnosia** is the selective inability to recognise faces following damage to the ventral occipitotemporal cortex (usually bilateral fusiform/inferior occipital cortex), despite preserved general vision and object recognition. The **N170**, a negative ERP component peaking ~170 ms over occipitotemporal electrodes, is selectively larger for faces than other objects and is delayed and reduced for inverted faces — providing a neural marker of face-selective processing.

---

# Chapter 5: Color Vision

## Trichromacy

The Young-Helmholtz theory of trichromacy holds that colour vision is mediated by three types of cone photoreceptors with overlapping spectral sensitivity functions. Because only three independent signals are generated by the three cone types, any colour can be matched by an appropriate mixture of three primary lights. This is the basis of colour television, photography, and printing. The three human cone types — S (blue-sensitive), M (green-sensitive), and L (red-sensitive) — have spectral sensitivity peaks at approximately 420, 530, and 560 nm, respectively. Critically, the response of each cone type is a single value (the number of photons absorbed per unit time), so colour information is initially encoded as three numbers — the cone excitations \((L, M, S)\).

## Opponent-Process Theory

Ewald Hering observed that some colour combinations are never perceived simultaneously (a reddish-green or a yellowish-blue is impossible), and that afterimages are the colour complement of the adapting colour. He proposed that colour is encoded as three opponent pairs: red vs. green, yellow vs. blue, and black vs. white. At the level of retinal ganglion cells and LGN neurons, opponent channels are found: for example, L−M cells (red-green channel) and (L+M)−S cells (yellow-blue channel). These are computed by the circuitry connecting cones to ganglion cells.

<div class="definition">
<strong>Colour opponency</strong> at the neural level is the principle that some neurons respond with increased firing to one range of wavelengths and decreased firing (below spontaneous rate) to the opponent wavelengths. The <strong>red-green</strong> channel is computed as L − M cone contrast; the <strong>yellow-blue</strong> (S-opponent) channel as S − (L + M).
</div>

Colour-selective neurons in V4 and surrounding areas in the ventral stream appear to encode perceived colour rather than raw cone excitation, contributing to colour constancy.

## Colour Constancy and Retinex Theory

The spectral composition of the light reflected by a surface depends on both the surface's reflectance and the spectral power distribution of the illuminant. As illumination changes (from sunlight to fluorescent light), the actual wavelengths reaching the eye change substantially, yet surfaces are perceived as having stable colours. This is **colour constancy**. Edwin Land's **Retinex theory** proposes that the visual system estimates the reflectance of each surface by computing the ratio of light reflected from that surface relative to its neighbours across multiple spectral channels. By discounting the illuminant through spatial comparisons, the brain recovers surface reflectance — the stable, object-specific property. Modern accounts frame colour constancy as a form of Bayesian inference, in which the visual system uses prior knowledge about typical illuminants and surface statistics.

**Simultaneous colour contrast** is a related phenomenon: a grey patch appears slightly tinged with the complementary colour of a surrounding chromatic field, demonstrating that colour perception is always influenced by the surrounding context.

## Colour Anomalies

Colour vision deficiencies arise from absent or altered cone photopigments. About 8% of males (and ~0.5% of females) have some form of colour vision deficiency.

| Type | Affected Cone | Effect |
|---|---|---|
| Protanopia | L cone absent | Red-green confusion; reds appear dim |
| Deuteranopia | M cone absent | Red-green confusion; no luminosity shift |
| Tritanopia | S cone absent | Blue-yellow confusion (rare, ~0.01%) |
| Protanomaly | L cone shifted | Mild red-green; reduced sensitivity to red |
| Deuteranomaly | M cone shifted | Mild red-green (most common deficiency) |
| Achromatopsia | All cones absent/non-functional | Complete colour blindness; poor acuity |

---

# Chapter 6: Space Perception and Depth

## Monocular Depth Cues

The perception of depth from a flat retinal image draws on a rich set of cues, most of which are effective with one eye alone (monocular cues) and many of which have been exploited for centuries in painting and photography.

**Linear perspective** is the convergence of parallel lines toward a vanishing point with increasing distance. **Texture gradient** refers to the compression and increased density of surface texture elements with distance. **Interposition** (occlusion) is the partial covering of one object by another — the occluding object is seen as closer. **Relative size** exploits the fact that familiar objects subtend smaller visual angles when farther away. **Aerial perspective** describes the reduction in contrast and increase in bluish haze for distant objects, due to light scattering by the atmosphere. **Shading and cast shadows** provide information about the three-dimensional shape of surfaces and the spatial relationship between objects and surfaces.

## Binocular Depth: Disparity and Stereopsis

Because the two eyes are horizontally separated by ~6.5 cm, they receive slightly different images of the world — **binocular disparity**. The **horopter** is the locus of points in space that project to corresponding (non-disparate) locations on the two retinas. Points nearer than the horopter produce **crossed disparity** (the image in the left eye is displaced rightward relative to the right eye); points farther produce **uncrossed disparity**. **Panum's fusional area** is the narrow zone around the horopter within which the two eyes' images can be fused into a single percept. Beyond this zone, diplopia (double vision) results.

<div class="definition">
<strong>Stereopsis</strong> is the perception of depth from binocular disparity. It was demonstrated convincingly by Julesz's <strong>random-dot stereograms</strong>, in which two random-dot patterns are identical except that a central region is shifted horizontally in one image. When viewed stereoscopically, the shifted region "floats" above or below the background, demonstrating that disparity alone — in the complete absence of monocular depth cues — is sufficient to generate a compelling depth percept.
</div>

## Vergence and Motion Parallax

**Convergence** (the rotation of the two eyes inward to fixate a near target) provides an extraretinal cue to absolute distance, though it is effective only at short distances. **Motion parallax** is a powerful monocular cue: as an observer moves, near objects move faster and in the opposite direction to head motion; far objects move slower and in the same direction. Gibson regarded motion parallax (and the broader phenomenon of optic flow) as a primary source of depth information in natural locomotion.

## Size Constancy and the Ponzo Illusion

**Size constancy** is the tendency to perceive an object as having a stable size despite changes in viewing distance (and hence retinal image size). The visual system uses perceived distance to scale retinal size: the Emmert's Law relationship is \( \text{Perceived size} \propto \text{Retinal size} \times \text{Perceived distance} \). The **Ponzo illusion** demonstrates this mechanism: two equal horizontal bars placed between converging lines are perceived as different in size, because the converging lines mimic a linear perspective cue (suggesting that the upper bar is farther away and hence must be physically larger to produce the same retinal size).

---

# Chapter 7: Attention

## Selective Attention and the Cocktail Party Effect

At any moment, the senses deliver far more information than the brain can fully process. Attention is the mechanism by which neural resources are selectively allocated to a subset of the available input. The classic demonstration of **selective auditory attention** is Cherry's cocktail party effect (1953): listeners can track a single voice at a party even when multiple conversations are occurring simultaneously. In Cherry's **dichotic listening** paradigm, different messages were delivered to the two ears simultaneously; listeners shadowing (repeating aloud) the attended message could report very little about the unattended ear's content, except for gross physical features (a tone, a change to a different voice). This suggested a selective filter in early auditory processing.

## Models of Selective Attention

Broadbent proposed an **early selection** model in which a bottleneck filter, operating on physical features, blocks unattended information before it reaches semantic analysis. Later work by Moray (hearing one's own name in the unattended ear) and Treisman (finding that meaningful content in the unattended ear could capture attention) required a more flexible account. Treisman proposed an **attenuation** model in which the unattended channel is not completely blocked but merely weakened; high-priority signals (one's name, a cry of danger) have low thresholds and may "break through."

The **spotlight metaphor** captures the spatial selectivity of visual attention: attention can be directed to a region of space, enhancing processing of stimuli within that region (Posner's cueing paradigm). The **zoom-lens model** extends this by proposing that attention can narrow to cover a small, high-resolution region or expand to cover a larger area at lower resolution, with a constant processing "resource."

## Feature Integration Theory

Treisman's **Feature Integration Theory** (FIT) distinguishes two stages of visual processing. In the **pre-attentive stage**, simple features (colour, orientation, spatial frequency, motion, size) are extracted rapidly and in parallel across the visual field, with no need for focused attention. These features are registered in separate cortical **feature maps**. In the **focused attention stage**, attention binds features at a location into a coherent object token by serially scanning locations.

A critical behavioural signature of FIT is the distinction between **pop-out** and **conjunction search**. If a target is defined by a single unique feature (e.g., a red circle among green circles), it "pops out" regardless of the number of distractors — search time is flat (parallel). If the target is defined by a conjunction of features (e.g., a red circle among red squares and green circles), search time increases with the number of distractors — attention must be moved serially to each item to bind its features. **Illusory conjunctions** — erroneous combinations of features from different objects (seeing a red O when there is a red X and a green O) — provide further support for FIT, as they occur when attention is overloaded or misdirected.

<div class="remark">
Subsequent research has qualified FIT. Many conjunction searches are not strictly serial; spatial grouping and higher-level guidance by target templates can make conjunction search much more efficient. Wolfe's <strong>Guided Search</strong> model proposes that feature maps guide attention toward likely target locations, combining bottom-up salience with top-down feature expectations to produce efficient (though not entirely parallel) conjunction search.
</div>

## Inhibition of Return

When attention is first drawn to a peripheral location (by a salient cue) and then returns to fixation, there is a period (~200 ms) during which the originally cued location shows **inhibition of return** (IOR): responses to targets at that location are slower than at an uncued location. IOR is thought to function as a foraging facilitator, preventing attention from repeatedly revisiting recently inspected locations.

## Change Blindness and Inattentional Blindness

The most striking demonstrations of the limits of attention involve failures to perceive dramatic changes or unexpected objects. **Change blindness** is the failure to detect changes in a visual scene when the change occurs during a brief interruption (a flicker, a cut, an eye movement, or a splashing mud occluder) — the **flicker paradigm** of Rensink, O'Regan, and Clark. Participants can fail to notice the disappearance of an entire aeroplane engine or the colour change of a car across a film cut. Change blindness demonstrates that the visual system does not maintain a detailed internal representation of the entire scene; only attended and encoded features are retained across interruptions.

**Inattentional blindness** is the failure to notice an unexpected but fully visible object when attention is occupied with another task. The canonical demonstration is Simons and Chabris's (1999) experiment in which participants counting passes among basketball players completely failed to notice a person in a gorilla suit walking through the scene. Together, change blindness and inattentional blindness illustrate that conscious perception depends on attention — we see far less of the world than naive introspection suggests.

**Perceptual load theory** (Lavie, 1995) provides an integrative framework: when a primary task is cognitively demanding (high perceptual load), irrelevant stimuli fail to be processed because the limited perceptual capacity is exhausted; when the task is easy (low load), spare capacity spills over to process irrelevant stimuli and produce distractor interference.

---

# Chapter 8: Motion Perception

## First-Order and Second-Order Motion

Motion perception is not a single, homogeneous process. **First-order motion** refers to the motion of luminance-defined patterns — a bright bar moving across a dark background. **Second-order motion** refers to the motion of texture or contrast-defined patterns whose average luminance does not change — a region defined by higher-contrast or coarser texture moving across a uniform texture background. First-order motion is detected by simple linear spatiotemporal filters (detectable by Reichardt detectors or energy models). Second-order motion requires a nonlinear preprocessing step to extract the moving feature before motion computation. There is evidence that these two types of motion are processed by partially distinct neural pathways.

## The Aperture Problem and Motion Integration

A fundamental ambiguity in local motion signals is the **aperture problem**: a locally oriented moving contour (as seen through a small aperture) produces ambiguous motion signals — only the component of motion perpendicular to the contour can be measured; motion along the contour is invisible. Because V1 neurons respond within small receptive fields, they are individually subject to the aperture problem and signal only one-dimensional motion. Resolving the aperture problem requires integrating motion signals across multiple orientations and locations — a process accomplished by area **MT (V5)**, which contains neurons with large receptive fields that respond to global motion direction. The pattern-motion cells of MT sum the outputs of component-motion cells to recover the true two-dimensional velocity.

## Motion Aftereffect

After prolonged viewing of motion in one direction, a stationary pattern appears to move in the opposite direction — the **motion aftereffect** (MAE), also called the waterfall illusion (after the observation that rocks beside a waterfall seem to rise after prolonged viewing of the downward-rushing water). The MAE reflects adaptation of directionally selective motion-sensitive neurons: prolonged stimulation reduces their response, causing an imbalance in the neural population representing motion, which is interpreted as motion in the opposite direction. The MAE can be stored in a "motion-sensitive" representation and triggered by a test pattern quite different from the adapting pattern, demonstrating that adaptation occurs at a neural level representing motion rather than just retinal stimulation.

## Biological Motion

Gunnar Johansson (1973) demonstrated that as few as 12 point lights attached to the major joints of a walking person are sufficient for viewers to recognise the walking pattern as human — a phenomenon called **biological motion** perception. Observers can extract gender, emotion, and identity from point-light walkers. Biological motion perception likely involves both the motion system (MT and surrounding areas) and higher-level social perception areas including the superior temporal sulcus (STS), which responds selectively to biological motion.

## Optic Flow and Gibson's Ecological Approach

James Gibson argued that moving observers obtain rich information about the spatial layout of the environment from the structured patterns of retinal motion produced by their own locomotion — **optic flow**. When moving forward through a scene, the pattern of motion radiates outward from the **focus of expansion** (the point in the direction of heading), providing direct information about the direction of self-motion. Gibson's **direct perception** approach holds that optic flow (and other high-order variables in the optic array) directly specifies behaviorally relevant information without requiring mediation by internal representations or inferences.

## MT Lesions and Akinetopsia

Area **MT/V5** is critical for motion perception. Patients with bilateral MT lesions suffer from **akinetopsia** — the inability to perceive visual motion. The world appears as a series of static snapshots: a teapot being filled appears as a series of frozen images of the tea, with no sense that it is flowing. Unilateral MT lesions cause contralesional motion-perception deficits and abnormal pursuit eye movements toward the affected hemifield.

## Apparent Motion and the Phi Phenomenon

When two spatially separated lights are flashed in succession with the appropriate temporal interval (~50–200 ms), an observer perceives a single light moving from one location to the other — **apparent motion** or the **Phi phenomenon** (Wertheimer, 1912). At short intervals, the motion is seen as smooth and fast; at long intervals, two separate flashes are seen. The phenomenon demonstrates that the visual system's motion detection system can be driven by temporal correlation between static frames — the principle exploited by cinema and video.

---

# Chapter 9 & 10: Hearing

## Acoustics

Sound is a pressure wave propagating through a medium (air, water, bone). Its physical properties map onto perceptual dimensions: **frequency** (Hz) corresponds primarily to **pitch**, **amplitude** (dB SPL) corresponds primarily to **loudness**, and **waveform complexity** (the pattern of harmonics) corresponds primarily to **timbre**. The decibel scale is logarithmic: \( L = 20 \log_{10}(p / p_0) \) dB SPL, where \(p_0 = 20\,\mu\text{Pa}\) is the standard reference pressure. The audible range extends from ~20 Hz to ~20,000 Hz, with peak sensitivity near 1,000–4,000 Hz.

## Anatomy of the Ear

The outer ear (**pinna** and ear canal) funnels sound toward the **tympanic membrane** (eardrum), which vibrates in response to pressure fluctuations. Three tiny bones — the **malleus**, **incus**, and **stapes** (collectively the **ossicles**) — form a mechanical lever system in the middle ear that amplifies and transmits vibrations to the **oval window** of the cochlea. The middle ear also contains two muscles (tensor tympani and stapedius) that contract reflexively to loud sounds, attenuating transmission.

The cochlea is a fluid-filled, coiled structure divided into three compartments (scala vestibuli, scala media, scala tympani). The **basilar membrane** runs the length of the cochlea and varies in width and stiffness — narrow and stiff at the base (responsive to high frequencies), wide and floppy at the apex (responsive to low frequencies). The **organ of Corti** sits on the basilar membrane and contains approximately 3,500 inner hair cells and 12,000 outer hair cells. When the basilar membrane deflects, stereocilia on the hair cells bend, opening mechanosensitive ion channels and depolarising the cell, which releases glutamate onto auditory nerve fibres.

## Tonotopic Organisation

The frequency tuning of the basilar membrane produces a **tonotopic map**: each location along the basilar membrane is maximally responsive to a particular frequency, and this spatial organisation is preserved throughout the auditory pathway — in the cochlear nuclei, inferior colliculus, medial geniculate nucleus (MGN) of the thalamus, and primary auditory cortex (A1). High frequencies are represented at the base of the cochlea (and in posterior A1); low frequencies at the apex (and in anterior A1).

## Place Theory vs. Temporal Theory of Pitch

Two theories of pitch encoding have been debated for over a century. **Place theory** (Helmholtz) holds that pitch is determined by which location on the basilar membrane is most excited — i.e., which frequency channel is maximally activated. This account works well for high frequencies (above ~5,000 Hz), where individual auditory nerve fibres fire at rates that do not track the stimulus frequency. **Temporal (volley) theory** holds that pitch is encoded by the temporal pattern of auditory nerve firing — fibres phase-lock to the stimulus waveform, so the timing of action potentials carries pitch information. Individual fibres can phase-lock up to ~1,000 Hz; the **volley principle** extends this to ~5,000 Hz by having different fibres fire on different cycles of the waveform in a staggered pattern. For complex tones, pitch is perceived even when the fundamental frequency is absent (**missing fundamental**), suggesting that the auditory system extracts the fundamental from the pattern of harmonics — a process that depends on temporal fine structure.

## Loudness

Perceived loudness does not scale simply with physical amplitude. The **sone** scale defines loudness such that 1 sone = 40 dB SPL at 1,000 Hz; doubling the sone value corresponds to a doubling of perceived loudness (~10 dB increase in SPL). **Equal loudness contours** (Fletcher-Munson curves) show that at low frequencies and high frequencies, greater sound pressure is required to achieve the same loudness as a 1,000 Hz tone — reflecting the frequency-dependent sensitivity of the auditory system.

## Sound Localisation

The auditory system determines the direction of a sound source using two primary cues. **Interaural level difference** (ILD) is the difference in amplitude between the two ears; because high-frequency sounds have short wavelengths, they are shadowed by the head, producing large ILDs. ILDs are effective for frequencies above ~1,500 Hz. **Interaural time difference** (ITD) is the difference in arrival time between the two ears (up to ~700 µs for a source directly to one side). ITDs are effective at low frequencies where phase locking allows temporal coding. This functional division is implemented in distinct brainstem circuits: ITD is processed in the **medial superior olive** (MSO), ILD in the **lateral superior olive** (LSO). The **pinna** shapes the spectrum of incoming sound in a direction-dependent way, providing cues for elevation and front-back disambiguation.

## Auditory Scene Analysis

In natural environments, multiple sound sources are superimposed in the air, yet listeners effortlessly separate them into distinct **auditory streams**. Bregman's **auditory scene analysis** framework identifies the acoustic cues used for stream segregation: common onset/offset (simultaneous sounds tend to group), harmonicity (components with a common fundamental group as a single source), smooth frequency trajectories (sounds that change frequency gradually group), and spatial location (sounds from the same direction group). **Stream segregation** refers to the perceptual separation of a sequence of sounds into distinct streams: a rapid alternation of high and low tones is heard as one stream at slow rates but segregates into two streams at faster rates.

---

# Chapter 11: Music and Speech

## Music Perception

### Pitch and Octave Equivalence

Musical pitch has two dimensions. **Pitch height** refers to the general low-to-high scale across all frequencies. **Chroma** (or tone quality) refers to the quality shared by notes that are an octave apart — a C4 and a C5 are very different in pitch height but share the same chroma. This two-dimensional structure is captured by the **pitch helix**, which spirals upward while cycling through the 12 chromatic steps. Notes separated by an octave (a 2:1 frequency ratio) are perceived as equivalent in a fundamental sense — the phenomenon of **octave equivalence**.

### Missing Fundamental and Residue Pitch

Complex tones consisting of harmonics of a fundamental frequency are heard as having the pitch of the fundamental even when the fundamental component is entirely absent from the signal — the **missing fundamental** or **residue pitch**. For example, a tone containing 200, 300, and 400 Hz is heard as having a pitch of 100 Hz, despite the absence of any 100 Hz energy. This phenomenon cannot be explained by place theory alone (no 100 Hz activity on the basilar membrane) and demonstrates that pitch is computed centrally from the pattern of harmonics.

### Timbre

**Timbre** is the quality that distinguishes a violin from a clarinet playing the same note at the same loudness. It is primarily determined by the **spectral envelope** — the amplitude distribution across harmonics — and by the **temporal envelope** (attack, sustain, decay). Changing only the attack of a piano tone makes it sound like another instrument; reversing a piano note makes it largely unrecognisable.

### Musical Intervals and Scales

Two notes separated by a small-integer frequency ratio (e.g., 2:1 octave, 3:2 fifth, 4:3 fourth) are perceived as **consonant** and pleasing; non-integer ratios produce **dissonance** and roughness, arising from beating between close harmonics. The Western **equal-tempered scale** divides the octave into 12 equal semitone steps, each a frequency ratio of \(2^{1/12} \approx 1.0595\), a compromise allowing transposition at the cost of slight deviations from pure integer ratios.

## Speech Perception

### Phonemes and Formants

The basic phonological units of speech are **phonemes** — discrete sound categories that contrast meaning (bat vs. pat). Vowels are characterised primarily by the frequencies of the first two **formants** (F1 and F2) — resonances of the vocal tract. Different vowels correspond to different F1-F2 combinations, and the **vowel space** can be plotted as a two-dimensional chart of F1 vs. F2 frequency, with different vowels occupying distinct regions. Consonants are characterised by manner of articulation (stops, fricatives, nasals), place of articulation (bilabial, alveolar, velar), and voicing (voiced vs. unvoiced).

### Categorical Perception

Speech sounds are not perceived along a continuum of physical variation; instead, perception **categorises** them sharply. In the classic experiment, listeners hear a continuum of synthesised syllables varying in voice onset time (VOT) between /ba/ and /pa/. Despite gradual acoustic change, perception shifts abruptly at a boundary — stimuli on one side are consistently heard as /ba/, on the other as /pa/ — and discrimination within a category is worse than discrimination across the boundary, even for physically equal steps. This is **categorical perception**, and it suggests that phoneme categories, once learned, organise auditory perception.

### The McGurk Effect

The McGurk effect demonstrates dramatic audiovisual integration in speech perception. When the audio track of one phoneme (e.g., /ba/) is dubbed onto the video of a mouth articulating a different phoneme (e.g., /ga/), listeners typically perceive a third phoneme (/da/) — a blend that matches neither auditory nor visual input alone. This effect, discovered by McGurk and MacDonald (1976), is compelling and occurs even when observers know about the manipulation, demonstrating that visual articulatory information automatically influences phoneme perception.

### Motor Theory of Speech Perception

Liberman and Mattingly's **motor theory** proposes that speech perception is fundamentally a perception of intended articulatory gestures rather than acoustic signals. The theory was motivated by the finding that the same acoustic signal can be heard differently depending on the visual context (McGurk effect) and by the observation that speech sounds lack invariant acoustic signatures — the same phoneme varies dramatically depending on adjacent sounds (coarticulation). The discovery of **mirror neurons** in monkeys (and proposed homologues in Broca's area in humans) was cited as neural evidence for motor theories of speech perception, though the connection remains contested.

---

# Chapter 13: Touch

## Mechanoreceptors

The glabrous (hairless) skin of the hand contains four types of mechanoreceptors, each with distinct spatial and temporal response properties.

| Receptor | Adaptation | Receptive Field | Best Stimulus |
|---|---|---|---|
| Meissner corpuscle (RA1) | Rapidly adapting | Small | Edges, light touch, low-frequency flutter (~2–40 Hz) |
| Merkel disc (SA1) | Slowly adapting | Small | Sustained pressure, fine spatial detail (braille) |
| Ruffini ending (SA2) | Slowly adapting | Large | Skin stretch, finger position |
| Pacinian corpuscle (RA2) | Rapidly adapting | Large | High-frequency vibration (~200–300 Hz), tool use |

Spatial acuity in touch is assessed by **two-point discrimination** — the minimum distance at which two simultaneous tactile stimuli are perceived as distinct. Two-point thresholds are smallest (~2 mm) on the fingertips and tongue, and largest (~40 mm) on the back, mirroring the density of mechanoreceptors and the area of cortical representation in the primary somatosensory cortex (S1).

## The Somatosensory Homunculus

The somatosensory cortex (parietal lobe, areas 3a, 3b, 1, 2) contains a topographic map of the body surface — the **somatosensory homunculus**. The representation is dramatically distorted relative to body surface area: the hands and lips command disproportionately large cortical areas (reflecting high receptor density and fine discriminative ability), while the trunk and legs occupy small regions. The distortion reflects **cortical magnification** — more cortical area per unit of body surface for body parts with high innervation density.

## Pain Pathways and Gate Control Theory

Pain (nociception) is mediated by unmyelinated **C fibres** (conducting ~0.5–2 m/s; mediating dull, burning, aching pain) and thinly myelinated **A-delta fibres** (conducting ~5–30 m/s; mediating sharp, well-localised first pain). Both classes of nociceptive afferents synapse in the dorsal horn of the spinal cord and project via the spinothalamic tract to the thalamus and cortex.

<div class="definition">
<strong>Gate control theory</strong> (Melzack and Wall, 1965) proposes that a neural "gate" in the dorsal horn of the spinal cord regulates the transmission of pain signals to the brain. Activity in large-diameter, fast-conducting touch fibres (A-beta) closes the gate, reducing pain transmission; activity in small-diameter nociceptive fibres (C and A-delta) opens the gate. Descending pathways from the brainstem (endogenous opioid systems) can also close the gate, explaining the analgesic effects of distraction, placebo, and stress-induced analgesia.
</div>

Gate control theory was the first to recognise that pain is not simply a direct readout of nociceptor activity but is actively modulated by the nervous system. It led to the development of transcutaneous electrical nerve stimulation (TENS) as a pain management technique.

## Phantom Limb Pain and Mirror Therapy

Following amputation, many patients report continuing sensation — and often excruciating pain — in the missing limb (**phantom limb pain**). Ramachandran and colleagues proposed that phantom pain arises partly from **cortical reorganisation**: the somatosensory cortical area previously representing the amputated limb is invaded by neighbouring representations (e.g., the face area expands into the hand area), producing anomalous neural activity interpreted as arising from the absent limb. **Mirror therapy** (Ramachandran and Rogers-Ramachandran, 1996) places a mirror so that the intact limb's reflection appears where the amputated limb would be; by moving the intact limb and watching the reflection, patients can "unclench" a phantom fist and reduce phantom pain, demonstrating the influence of visual feedback on bodily sensation.

## Proprioception

**Proprioception** — the sense of limb position and movement — is provided by **muscle spindles** (intrafusal fibres innervated by Ia afferents, sensitive to muscle stretch and velocity of stretch) and **Golgi tendon organs** (in tendons, sensitive to muscle force). Proprioceptive signals project via the dorsal column–medial lemniscal pathway to the thalamus and S1. Tendon vibration activates muscle spindles and creates powerful proprioceptive illusions of limb movement or impossible body configurations, demonstrating the primacy of proprioceptive signals in body-state perception.

---

# Chapter 14 & 15: Olfaction and Taste

## Olfaction

### Olfactory Receptors and Combinatorial Coding

Olfactory receptor neurons (ORNs) in the olfactory epithelium express one of ~400 functional olfactory receptor (OR) proteins in humans (from a gene family of ~800 genes, with ~50% pseudogenes). Each ORN expresses only one OR type, but each OR type responds to multiple odorants (with different affinities), and each odorant activates multiple OR types. The identity and concentration of an odorant is encoded by the **combinatorial pattern** of activated ORNs — the distributed across-fibre pattern. This combinatorial code allows the ~400 receptor types to discriminate potentially trillions of distinct odorants.

All ORNs expressing the same receptor type converge on the same two **glomeruli** in the **olfactory bulb**, creating a spatially stereotyped map. Mitral cells in the olfactory bulb relay signals to the **piriform cortex** and **amygdala** (for emotional valence of odours), bypassing the thalamus — making olfaction unique among the senses in its direct access to limbic structures. This anatomical arrangement is thought to explain the unusually strong emotional and mnemonic quality of odour-evoked associations (Proust phenomena).

### Orthonasal vs. Retronasal Olfaction

Odorants can reach the olfactory epithelium via two routes. **Orthonasal olfaction** occurs when odorant molecules enter the nose from the external environment during sniffing. **Retronasal olfaction** occurs when volatile compounds released by food in the mouth travel via the nasopharynx to the olfactory epithelium during eating and swallowing. Retronasal olfaction contributes crucially to the flavour of food — most of what people call "taste" is in fact retronasal smell, as demonstrated by the dramatic flavour loss that accompanies nasal congestion.

**Anosmia** (the inability to smell) can be congenital (~1 in 5,000 people) or acquired (following head injury, viral infection, or neurodegeneration — anosmia was an early symptom of COVID-19). Specific anosmias — the inability to detect a particular odorant while olfaction is otherwise normal — reflect polymorphisms in individual OR genes and are extremely common.

## Taste

### Basic Tastes and Receptor Mechanisms

The tongue and palate contain **taste buds**, each consisting of ~50–100 taste receptor cells (TRCs). There are five broadly accepted **basic tastes**, each with a distinct receptor mechanism.

| Taste | Stimulus | Receptor Mechanism |
|---|---|---|
| Sweet | Sugars, artificial sweeteners | T1R2 + T1R3 GPCR heterodimer |
| Umami | Glutamate, nucleotides | T1R1 + T1R3 GPCR heterodimer |
| Bitter | Toxins, alkaloids | TAS2R family (~25 types) GPCRs |
| Salty | NaCl | Epithelial sodium channels (ENaC) |
| Sour | Acids (H+) | Otopetrin-1 proton channel |

Taste information is relayed from the tongue via cranial nerves VII (chorda tympani, anterior tongue), IX (posterior tongue), and X (palate, epiglottis) to the **nucleus of the solitary tract** in the brainstem, then to the **thalamus** and **primary gustatory cortex** (anterior insula and frontal operculum).

### Supertasters

Approximately 25% of the population are **supertasters** — individuals who experience tastes with much greater intensity than average. Supertasters have a higher density of fungiform papillae (mushroom-shaped structures on the tongue that house taste buds) and are especially sensitive to bitter compounds such as PROP (6-n-propylthiouracil) and PTC. Many supertasters find very sweet, very salty, or very fatty foods overwhelming; supertasters tend to eat less of bitter vegetables and fats, with possible implications for dietary choices and health.

### Flavour as Multisensory Integration

**Flavour** is a multisensory construct integrating taste (gustatory), retronasal smell (olfactory), texture and temperature (somatosensory, via the trigeminal nerve), and visual appearance. The interactions among these modalities are not simply additive. Colour influences perceived sweetness (red-coloured beverages are judged sweeter than identical colourless ones). Expectations based on the visual appearance of food bias taste perception. The crunch of food (transmitted through bone conduction to the jaw and ear) influences perceived freshness. These multisensory interactions occur at the level of the orbitofrontal cortex, which integrates gustatory and olfactory signals and is considered the primary cortical site for flavour perception.

---

# Chapter 16: Illusions

## Why Study Illusions?

Perceptual illusions are not mere curiosities or failures of the visual system — they are windows into the mechanisms of normal perception. When the visual system is "fooled," it reveals the assumptions and heuristics it normally applies. Because perception is ultimately inferential, the same inferential machinery that usually serves us well will systematically err when those assumptions are violated.

## Geometric Illusions and Size Constancy Scaling

**The Muller-Lyer illusion** consists of two equal-length lines, one with fins pointing inward (arrowhead), one with fins pointing outward. The line with inward fins appears shorter. Gregory's size constancy scaling theory proposes that the fins function as perspective cues: the inward-pointing fins resemble the inside corner of a room (near surface), while the outward-pointing fins resemble the outside corner of a building (far surface). The visual system, applying size constancy scaling, treats the line flanked by outward fins as if it were a far edge, and therefore scales it up — making it appear longer. This "misapplied size constancy" occurs automatically, even when the viewer knows the lines are equal.

**The Ponzo illusion** (two horizontal bars between converging lines) is explained by the same mechanism: the converging lines activate linear perspective processing, the upper bar is treated as if farther away, and size constancy scaling makes it appear larger.

**The Ames room** dramatically demonstrates the role of size constancy: two people of equal height at different distances in a trapezoidal room (constructed to look rectangular from a particular viewpoint) appear wildly different in size because the viewer applies the assumption that the room is rectangular and interprets the apparent size difference as a real difference in body height.

<div class="example">
<strong>Ponzo Illusion Demo:</strong> Place two identical horizontal lines between two converging diagonal lines (as in railway tracks receding into the distance). The upper line appears longer than the lower line despite being physically identical. The demonstration reveals that the brain interprets the converging lines as a perspective cue for depth and automatically scales the apparent size of objects accordingly.
</div>

## Lightness Illusions

**Simultaneous contrast** is the shift in perceived brightness (or colour) of a patch as a function of the surrounding field's luminance. A grey patch on a white background appears darker than the same patch on a black background. The effect reflects lateral inhibitory interactions: the white surround activates more inhibition of the grey-patch neurons than the black surround does, shifting the apparent brightness.

**Adelson's checker-shadow illusion** is perhaps the most dramatic lightness illusion: two squares on a chessboard — one in shadow, one not — that are physically identical in luminance but appear strikingly different in lightness. Square A appears dark brown; square B appears light grey. The visual system, correctly inferring the presence of a shadow from surrounding cues (shadow edge, context), discounts the shadow's contribution to the luminance and "corrects" the perceived lightness of square B upward — concluding that its true reflectance (lightness) must be high. This is not a failure of perception but a triumph of the visual system's attempt to recover true surface properties; the illusion is compelling precisely because the interpretation is usually correct.

<div class="remark">
Adelson's checker-shadow illusion provides perhaps the clearest proof that the visual system is not measuring luminance but inferring lightness (surface reflectance) by separating illumination from reflectance. The two squares remain perceptually different even when the viewer knows they are physically identical — demonstrating that the underlying computation is automatic and encapsulated from conscious knowledge.
</div>

## Perceptual Constancies as the Visual System's Goal

The major perceptual constancies — **size constancy**, **shape constancy**, and **colour constancy** — share a common computational goal: recover stable, object-specific properties of the world (size, shape, reflectance) despite the fact that the proximal stimulus (the retinal image) changes continuously with viewing angle, distance, and illumination. Illusions arise as a consequence of applying these constancy mechanisms in impoverished or conflicting contexts, in which the visual system must rely on imperfect cues and arrives at the wrong answer. The perceptual constancies reveal that the visual system's primary task is not to faithfully represent the proximal stimulus but to infer the distal cause — the true structure of the world.

<div class="definition">
<strong>Perceptual constancy</strong> is the tendency to perceive the stable properties of objects (size, shape, colour, lightness) as unchanging despite changes in the retinal image caused by variations in viewing distance, orientation, or illumination. Constancies depend on the visual system combining the proximal stimulus with contextual information about viewing conditions to compute an estimate of the distal stimulus.
</div>

The study of illusions thus brings us full circle to the themes of Chapter 1: perception is a constructive, inferential process whose product is not a copy of the retinal image but a model of the world — a model that is usually accurate enough for adaptive behaviour, occasionally wrong in characteristic, revealing ways, and always a remarkable achievement of neural computation.

---

*Notes compiled for PSYCH 306: Perception, Winter 2026, University of Waterloo. Textbook: Wolfe et al., Sensation and Perception, 7th ed. (Oxford University Press, 2025).*
