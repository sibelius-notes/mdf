---
title: "MUSIC 275: Music & Technology"
prof: "Cam McKittrick"
subjects: "MUSIC"
---

## Sources and References
**Primary textbook** — Course materials on digital audio, MIDI, and audio editing.
**Supplementary texts** — Curtis Roads, *The Computer Music Tutorial* (MIT Press); David Miles Huber and Robert E. Runstein, *Modern Recording Techniques*; Alex Case, *Mix Smart*.
**Online resources** — The MIDI Association; Stanford CCRMA educational materials; Ableton learning resources; MIT OCW music technology materials.

---

# Chapter 1: The Physics of Sound

Sound is a mechanical phenomenon. Before we can manipulate audio electronically, we must understand the physical processes that create it, shape it, and deliver it to our ears. This chapter examines the fundamental physics underlying all musical sound, from the vibration of a single string to the complex spectra of orchestral instruments.

## 1.1 What Is Sound?

<div class="definition">
<strong>Sound</strong> is a longitudinal pressure wave that propagates through an elastic medium (such as air, water, or a solid) by means of alternating compressions and rarefactions of the medium's particles.
</div>

When a guitar string is plucked, it displaces adjacent air molecules, pushing them together in regions of **compression** (higher-than-normal pressure) and pulling them apart in regions of **rarefaction** (lower-than-normal pressure). These pressure disturbances travel outward from the source at a speed determined by the properties of the medium. In dry air at 20 degrees Celsius, sound travels at approximately 343 metres per second (about 1,125 feet per second). This is often rounded to 340 m/s for convenience.

It is essential to recognize that sound requires a medium. In a vacuum, there is nothing for the vibration to propagate through, and therefore no sound can exist. The particles of the medium themselves do not travel from source to listener; rather, the energy of the disturbance is transferred from one particle to the next, much like a wave moving through a stadium crowd where each person stands and sits in turn but nobody actually changes seats.

The speed of sound varies with the medium. In water, sound travels roughly 1,480 m/s, approximately four times faster than in air. In steel, it travels at approximately 5,960 m/s. Temperature also matters: warmer air transmits sound slightly faster because the molecules move more energetically and can transfer vibrations more quickly. A useful approximation is that the speed of sound in air increases by about 0.6 m/s for every degree Celsius increase in temperature.

Sound waves are classified as **longitudinal** because the displacement of the medium's particles is parallel to the direction of wave propagation. This contrasts with **transverse** waves (such as those on a vibrating string or electromagnetic radiation), where displacement is perpendicular to propagation. In solids, both longitudinal and transverse (shear) waves can propagate, but in fluids and gases, only longitudinal waves occur.

## 1.2 Frequency, Wavelength, and Pitch

<div class="definition">
<strong>Frequency</strong> is the number of complete cycles of a periodic waveform that occur in one second. It is measured in <strong>Hertz</strong> (Hz), where 1 Hz equals one cycle per second.
</div>

A **cycle** consists of one complete oscillation: from equilibrium, to maximum positive displacement, back through equilibrium, to maximum negative displacement, and back to equilibrium again. The time it takes to complete one cycle is the **period** (T), and frequency (f) and period are inversely related:

f = 1 / T

The human ear can perceive frequencies roughly between 20 Hz and 20,000 Hz (20 kHz), though this upper limit decreases significantly with age. By middle age, most adults cannot hear much above 15 kHz, and individuals with a history of noise exposure may lose sensitivity even earlier. Musical pitch is the perceptual correlate of frequency. Higher frequencies are perceived as higher pitches. The note A above middle C is standardized at 440 Hz (concert pitch A4), and each octave corresponds to a doubling of frequency: A3 is 220 Hz, A5 is 880 Hz.

The relationship between pitch and frequency is not strictly linear in perception. The ear responds roughly logarithmically to frequency, which is why musical intervals are defined as frequency ratios rather than absolute differences. An octave is always a 2:1 ratio, whether it spans 100 Hz to 200 Hz or 4,000 Hz to 8,000 Hz. The equal-tempered tuning system divides the octave into twelve equal semitones, each with a frequency ratio of the twelfth root of 2 (approximately 1.05946). This means each semitone raises the frequency by about 5.95 percent.

**Wavelength** is the physical distance between two successive points of the same phase in the wave (for instance, crest to crest). Wavelength (lambda) relates to frequency and the speed of sound (v) by:

lambda = v / f

At 440 Hz in air, the wavelength is approximately 343 / 440 = 0.78 metres. Low bass frequencies have much longer wavelengths (a 40 Hz tone has a wavelength of about 8.6 metres), which is why they are difficult to contain and why bass traps need to be large. Very high frequencies have very short wavelengths (20 kHz corresponds to about 1.7 centimetres), which means they are easily blocked by small obstacles and absorbed by soft materials.

## 1.3 Amplitude, Intensity, and the Decibel Scale

<div class="definition">
<strong>Amplitude</strong> refers to the maximum displacement of the vibrating medium from its rest position. In terms of air pressure, it is the peak deviation from the ambient atmospheric pressure.
</div>

We perceive amplitude primarily as **loudness**, though the relationship between the two is not linear. The ear responds to an enormous range of pressures: the threshold of hearing (the quietest sound a healthy young person can detect at 1 kHz) corresponds to a pressure of about 20 micropascals, while the threshold of pain is around 20 pascals, a ratio of one million to one.

Because of this immense range, we use a logarithmic scale: the **decibel** (dB). The decibel expresses a ratio between two power or intensity values. For sound pressure level (SPL):

dB SPL = 20 * log10(P / P_ref)

where P_ref is the standard reference pressure of 20 micropascals. On this scale, the threshold of hearing is 0 dB SPL, a quiet whisper is about 30 dB SPL, normal conversation is 60 to 70 dB SPL, a rock concert may reach 110 dB SPL, and the threshold of pain is approximately 130 dB SPL. Every increase of approximately 6 dB represents a doubling of sound pressure, while an increase of roughly 10 dB is perceived as a doubling of subjective loudness.

The **inverse square law** describes how sound intensity decreases with distance from a point source in a free field (an environment with no reflections). Intensity is proportional to 1/r^2, where r is the distance from the source. In practical terms, every doubling of distance from a point source results in a 6 dB reduction in sound pressure level. This is why a singer standing 30 centimetres from a microphone sounds dramatically louder than the same singer at 60 centimetres: not twice as loud, but 6 dB louder, which is clearly perceptible.

<div class="remark">
The decibel is not an absolute unit by itself; it is a ratio. Different reference levels produce different decibel scales: dB SPL uses the threshold of hearing in air; dBu and dBV are used in audio electronics with voltage references; dBFS (decibels relative to full scale) is used in digital audio, where 0 dBFS is the maximum level before clipping. It is essential to specify which reference is being used, because 0 dB means something completely different in each system.
</div>

## 1.4 Waveforms and the Harmonic Series

The simplest waveform is the **sine wave** (also called a pure tone), which contains energy at only one frequency. No acoustic instrument produces a pure sine wave; real sounds contain a fundamental frequency plus a set of additional frequencies called **overtones** or **partials**. When these partials are integer multiples of the fundamental, they are called **harmonics**, and the series they form is the **harmonic series**.

For a fundamental at frequency f, the harmonic series is: f, 2f, 3f, 4f, 5f, and so on. The first harmonic is the fundamental itself. The second harmonic is an octave above, the third harmonic is an octave and a fifth above, the fourth harmonic is two octaves above, and the fifth harmonic approximates a major third two octaves up (though it is slightly flat relative to equal temperament).

Common idealized waveforms include:

| Waveform | Description | Harmonic Content |
|---|---|---|
| Sine | Smooth, single-frequency oscillation | Fundamental only |
| Sawtooth | Ramp-shaped, bright and buzzy | All harmonics, amplitude decreasing as 1/n |
| Square | Rectangular alternation between two values | Odd harmonics only, amplitude decreasing as 1/n |
| Triangle | Linear rise and fall, mellow tone | Odd harmonics only, amplitude decreasing as 1/n squared |
| Pulse | Square wave with variable duty cycle | Harmonic content varies with pulse width |

The relative amplitudes, frequencies, and phases of the partials in a sound determine its **timbre** (or tone colour). This is what allows us to distinguish a clarinet from a trumpet even when both play the same note at the same loudness. The clarinet, with its cylindrical bore behaving as a closed-tube resonator, emphasizes odd harmonics, giving it a hollow quality. The trumpet, with its predominantly conical bore and lip-reed excitation, produces a full harmonic series with strong upper partials that give it brightness and projection.

**Fourier analysis** (named after the French mathematician Jean-Baptiste Joseph Fourier) provides the mathematical foundation for understanding timbre. Fourier's theorem states that any periodic waveform can be decomposed into a sum of sine waves at harmonic frequencies, each with a specific amplitude and phase. This principle underlies virtually all frequency-domain analysis and processing in audio technology, from spectrum analysers to equalizers to perceptual audio codecs.

## 1.5 Resonance, Standing Waves, and the Behaviour of Sound

**Resonance** occurs when a vibrating system is driven at one of its natural frequencies, causing the amplitude of vibration to increase dramatically. Every physical object has natural resonant frequencies determined by its mass, stiffness, and dimensions. A wine glass shatters when a singer matches its resonant frequency because energy is efficiently transferred into the glass's vibrational mode.

In musical instruments, resonance is carefully designed. The body of a violin amplifies the sound of the strings by resonating sympathetically. The air column in a trumpet resonates at specific frequencies determined by the length and shape of the tubing. The soundboard of a piano spreads vibration from the strings into a larger radiating surface.

**Standing waves** form when a wave reflects back on itself in a confined space and the incident and reflected waves interfere constructively at certain points (antinodes) and destructively at others (nodes). The vibrating string of a guitar is a classic example: the endpoints are nodes (they cannot move), and the string vibrates in patterns that correspond to its harmonic series. A string of length L fixed at both ends supports standing waves with wavelengths of 2L/n, where n is a positive integer.

Standing waves also occur in rooms, where they create **room modes**: specific frequencies at which sound builds up or cancels at certain locations. In small, untreated rooms (such as home studios), room modes can create severe peaks and nulls in the bass response, making accurate mixing difficult. Acoustic treatment with bass traps, absorbers, and diffusers is used to mitigate these problems.

Sound also exhibits **diffraction** (bending around obstacles, most noticeable when the obstacle size is comparable to the wavelength), **refraction** (bending due to changes in medium properties such as temperature gradients), **reflection** (bouncing off surfaces, the basis of echoes and reverberation), and **absorption** (conversion of sound energy into heat within materials). Understanding these behaviours is essential for room acoustics, microphone placement, and live sound reinforcement.

---

# Chapter 2: Psychoacoustics and Musical Perception

Psychoacoustics is the scientific study of sound perception. While physics describes what sound is, psychoacoustics describes how we experience it. Understanding psychoacoustics is indispensable for anyone working in music technology because many design decisions in recording, mixing, and mastering are motivated by the peculiarities of human hearing.

## 2.1 The Human Auditory System

Sound enters the ear canal (the **pinna** and **external auditory canal** form the outer ear), strikes the **tympanic membrane** (eardrum), and sets the three tiny bones of the middle ear (the **ossicles**: malleus, incus, and stapes) into motion. These bones act as an impedance-matching transformer, efficiently coupling the low-impedance air vibrations to the high-impedance fluid of the **cochlea** in the inner ear. Without this mechanism, most sound energy would be reflected at the air-fluid boundary, and hearing would be greatly diminished.

The middle ear also contains two small muscles (the tensor tympani and the stapedius) that contract reflexively in response to loud sounds, stiffening the ossicular chain and reducing the transmission of low frequencies. This **acoustic reflex** provides some protection against sustained loud sounds, but it activates too slowly (with a latency of roughly 25 to 150 milliseconds) to protect against sudden impulse sounds such as gunshots or snare drum hits.

Inside the cochlea, a spiral-shaped organ filled with fluid, the vibrations travel along the **basilar membrane**. Different regions of this membrane respond preferentially to different frequencies: the base (near the oval window) responds to high frequencies, and the apex responds to low frequencies. This arrangement is called **tonotopic organization**. The **hair cells** sitting on the basilar membrane convert mechanical vibrations into electrical nerve impulses, which travel via the **auditory nerve** to the brain for interpretation. There are approximately 3,500 inner hair cells (the primary sensory receptors) and 12,000 outer hair cells (which actively amplify and sharpen the frequency selectivity of the basilar membrane) in each ear. Damage to hair cells from noise exposure or aging is irreversible in humans and is the primary cause of sensorineural hearing loss.

## 2.2 Loudness Perception and Equal-Loudness Contours

<div class="definition">
<strong>Loudness</strong> is the subjective perception of sound intensity. It depends not only on amplitude but also on frequency and the duration of the sound.
</div>

The human ear is not equally sensitive to all frequencies. We are most sensitive in the range of roughly 2 kHz to 5 kHz, which corresponds to the resonant frequency of the ear canal and the range most important for speech intelligibility. Low frequencies and very high frequencies must be at considerably higher amplitudes to be perceived as equally loud.

This frequency-dependent sensitivity is described by the **equal-loudness contours** (formerly called Fletcher-Munson curves, after the researchers who first measured them in 1933; now standardized as ISO 226:2003 based on more modern data). Each contour represents a set of frequency-SPL combinations that are perceived as equally loud. The unit of measurement is the **phon**, where by definition the phon level equals the dB SPL of a 1 kHz tone at the same perceived loudness. So a 40-phon contour passes through 40 dB SPL at 1 kHz, but might require 60 dB SPL or more at 100 Hz to seem equally loud.

The **sone** is a unit of perceived loudness designed to be proportional to subjective loudness. By definition, 1 sone equals the loudness of a 1 kHz tone at 40 dB SPL. A doubling in sones corresponds to a doubling in perceived loudness. This roughly corresponds to a 10 dB increase in SPL.

A practical implication for music technology: when mixing at low monitoring volumes, bass and treble appear to drop away relative to the midrange. This is why the "loudness" button on consumer stereos boosts bass and treble at low volumes, and why mixing engineers strive to work at a consistent and moderately loud monitoring level (often around 79 to 85 dB SPL, as suggested by standards like the Dolby reference level of 85 dB SPL calibration for each speaker in film mixing).

## 2.3 Frequency Discrimination, Critical Bands, and Masking

The ear's ability to distinguish two closely spaced frequencies is called **frequency discrimination** or **frequency resolution**. For most of the audible range, trained listeners can detect differences as small as a few Hertz (about 3 Hz for tones below 1 kHz). However, the ear does not operate like a precise spectrum analyser. Instead, it analyses sound through a bank of overlapping filters, each with a certain bandwidth called a **critical band** (or equivalently, an **Equivalent Rectangular Bandwidth**, ERB).

<div class="definition">
A <strong>critical band</strong> is the frequency bandwidth within which the ear integrates energy. Two tones within the same critical band interact differently than two tones in separate bands. Critical bandwidths are roughly 100 Hz wide for frequencies below about 500 Hz and approximately one-third of an octave for higher frequencies. There are approximately 24 critical bands spanning the audible range.
</div>

When two tones are very close in frequency (within the same critical band), they produce **beats**: periodic fluctuations in amplitude at a rate equal to the difference between the two frequencies. As the frequency separation increases, the beats become faster and eventually merge into a sensation of **roughness** or dissonance. When the tones are separated by more than a critical bandwidth, they are perceived as distinct pitches, and the roughness disappears.

**Masking** occurs when the presence of one sound makes another sound harder or impossible to hear. **Simultaneous masking** (or frequency masking) happens when a louder sound obscures a quieter one that is close in frequency. The closer the two frequencies, the more masking occurs. A loud tone masks nearby quieter tones more effectively on its high-frequency side than on its low-frequency side, a phenomenon called the **upward spread of masking**.

This phenomenon is exploited extensively in perceptual audio coding formats such as MP3 and AAC: the encoder analyses the audio in short frames, identifies which frequency components would be masked by louder components, and removes or reduces the masked components, reducing the file size without (ideally) audible degradation.

**Temporal masking** occurs when a loud sound renders a quieter one inaudible even if the two do not overlap in time. **Forward masking** (post-masking) can last for 100 to 200 milliseconds after the masking sound ends. **Backward masking** (pre-masking) operates for a few milliseconds before the masking sound begins, because the brain requires processing time to register the quieter stimulus. Perceptual codecs exploit temporal masking as well, particularly to hide quantization noise near the onset of loud transients.

## 2.4 Pitch Perception and the Missing Fundamental

Pitch perception is primarily associated with the fundamental frequency of a sound, but the auditory system can infer pitch even when the fundamental is physically absent. If a set of harmonics at 200 Hz, 300 Hz, 400 Hz, and 500 Hz is presented (all harmonics of a 100 Hz fundamental), the listener perceives a pitch corresponding to 100 Hz even though no energy exists at that frequency. This is called the **missing fundamental** phenomenon (also known as virtual pitch or residue pitch).

This effect has practical consequences for music technology. Small speakers that cannot reproduce low bass frequencies (such as laptop speakers or earbuds) still convey a sense of bass pitch because the harmonics above the fundamental are present. Mix engineers sometimes exploit this by using harmonic exciters or saturation plugins to add upper harmonics to bass instruments, making the bass more audible on small playback systems without adding actual low-frequency energy.

Two main theories attempt to explain pitch perception: the **place theory** (pitch is determined by which location on the basilar membrane is maximally stimulated) and the **temporal theory** (pitch is determined by the timing pattern of neural firings, which lock to the phase of the stimulus waveform). Current understanding is that both mechanisms contribute, with temporal coding dominating for low frequencies (below about 4 to 5 kHz, where neural phase-locking is possible) and place coding becoming more important for higher frequencies.

<div class="remark">
The missing fundamental effect has implications for mix translation. A mix that sounds bass-heavy on full-range studio monitors may sound thin on laptop speakers if the bass relies on fundamental frequencies below 100 Hz that the small speakers cannot reproduce. Adding harmonic content to the bass (through saturation, distortion, or dedicated plugins) can ensure that the perception of bass survives on smaller systems.
</div>

## 2.5 Spatial Hearing

Humans localize sound sources using several cues:

- **Interaural Time Difference (ITD)**: a sound arriving from the left reaches the left ear slightly before the right ear. For low frequencies (below about 1.5 kHz), this time difference is the primary localization cue. The maximum ITD for a sound arriving from directly to one side is approximately 0.6 to 0.7 milliseconds.
- **Interaural Level Difference (ILD)**: the head casts an acoustic shadow, attenuating high-frequency sounds on the far side. For frequencies above about 1.5 kHz, level differences become important localization cues. ILDs can be as large as 20 dB at high frequencies.
- **Head-Related Transfer Function (HRTF)**: the shape of the pinnae (outer ears), head, and torso introduce frequency-dependent filtering that varies with the direction of the incoming sound. The brain uses these spectral cues to determine elevation and to resolve front-back ambiguity. Each person's HRTF is unique due to individual anatomy.

The **precedence effect** (or Haas effect, named after Helmut Haas's 1949 dissertation) is important in room acoustics and audio engineering: when two similar sounds arrive within about 5 to 40 milliseconds of each other, the brain fuses them into a single percept and localizes the sound at the source of the earlier arrival. This allows us to localize sounds correctly in reverberant rooms (where reflections arrive from many directions), and mixing engineers exploit it when using short delays to create width without shifting the perceived source position.

The **cocktail party effect** describes the ability to focus on a single talker in a noisy environment with many competing sound sources. This relies on a combination of spatial separation, spectral differences, and temporal continuity cues that allow the auditory system to segregate overlapping sounds into distinct perceptual streams. This phenomenon is related to the broader field of **auditory scene analysis**, a term coined by Albert Bregman to describe how the brain organizes complex acoustic environments into coherent perceptual objects.

Stereo audio creates the illusion of spatial width by manipulating level and timing differences between the left and right channels. Panning a signal to the left increases its level in the left speaker relative to the right, causing the phantom image to shift leftward. More advanced spatial audio techniques, such as binaural rendering and Ambisonics, attempt to reproduce the full three-dimensional HRTF cues for a more immersive experience. These techniques are discussed further in Chapter 12.

---

# Chapter 3: A History of Electronic and Computer Music

Electronic and computer music did not emerge suddenly. It evolved over more than a century through a series of inventions, artistic movements, and technological breakthroughs. Understanding this history provides essential context for the tools and aesthetic conventions encountered in modern music production.

## 3.1 Early Electrical Instruments (1897 to 1950)

The story begins in the late nineteenth century with Thaddeus Cahill's **Telharmonium** (patented 1897, demonstrated 1906), an enormous instrument weighing nearly 200 tons that generated sound using rotating tone wheels and transmitted it over telephone lines. Though commercially unsuccessful (and reportedly disruptive to the telephone network), it demonstrated the revolutionary principle that electrical signals could be used to create and distribute music.

In 1920, Leon Theremin (born Lev Sergeyevich Termen) invented the **Theremin**, an instrument played without physical contact. Two antennas sense the position of the player's hands, controlling pitch and volume through changes in the electromagnetic field. The theremin remains one of the most iconic early electronic instruments and has been used in genres ranging from classical (the works of Clara Rockmore) to film scores (notably in science fiction soundtracks of the 1950s, such as Bernard Herrmann's score for The Day the Earth Stood Still).

The **Ondes Martenot**, invented by Maurice Martenot in 1928, offered a keyboard interface alongside a ribbon controller for continuous pitch and a variety of timbral controls. Olivier Messiaen wrote prominently for the instrument in numerous works, including its use in his monumental Turangalila-Symphonie (1948) and the Fete des belles eaux (1937) for six Ondes Martenot.

The **Hammond organ** (1935), invented by Laurens Hammond, used rotating tone wheels (similar in principle to the Telharmonium but far more compact) and additive synthesis (drawbars that mixed harmonics at integer ratios) to produce its characteristic sound. It became one of the most commercially successful electronic instruments of the twentieth century, finding homes in churches, jazz clubs (Jimmy Smith), and rock bands (Deep Purple, the Doors, Procol Harum). Paired with the Leslie rotating speaker cabinet, the Hammond organ produced a complex, animated sound that remains widely imitated in software today.

## 3.2 Musique Concrete and Elektronische Musik (1948 to 1960)

Two major schools of electronic music composition emerged in the late 1940s and 1950s, each with a distinct philosophy that continues to influence music production today.

In Paris, **Pierre Schaeffer** and the Radiodiffusion-Television Francaise (RTF) studio pioneered **musique concrete** (1948), a practice based on recording natural and environmental sounds onto disc or tape and then transforming them through techniques such as speed change, reversal, tape splicing, looping, and filtering. Schaeffer's Etude aux chemins de fer (1948) used recordings of trains as raw material. His colleague **Pierre Henry** collaborated with him on the Symphonie pour un homme seul (1950). The fundamental idea was that any recorded sound could serve as musical material, a radical departure from the tradition of composed scores performed on conventional instruments.

Schaeffer developed a theory of listening that categorized sound perception into four modes, from ordinary causal listening (identifying the source of a sound) to what he called "reduced listening" (attending to the sonic qualities of a sound stripped of its source identity). This framework influenced subsequent generations of sound designers, field recordists, and electronic composers.

In Cologne, the Westdeutscher Rundfunk (WDR) studio became the centre of **elektronische Musik**, championed by **Karlheinz Stockhausen**, Herbert Eimert, and others. Their approach was in many ways the opposite of musique concrete: rather than manipulating recorded sounds, they synthesized sound from scratch using electronic oscillators, filters, and modulators. Stockhausen's Studie I (1953) and Studie II (1954) were landmark works composed entirely from sine tones according to strict serial principles. His later Gesang der Junglinge (1956) blended a boy's recorded voice with electronic sounds, bridging the two schools and pioneering spatialized multi-channel audio with sound projected through five loudspeaker groups around the audience.

<div class="remark">
The distinction between musique concrete (recorded sound as source material) and elektronische Musik (electronically generated sound) anticipated a division that persists in music technology today: sampling versus synthesis. Most modern production freely combines both approaches, but the aesthetic tension between "found" sound and "constructed" sound remains a productive creative axis.
</div>

Other important mid-century studios included the Columbia-Princeton Electronic Music Center (est. 1958, with Milton Babbitt, Vladimir Ussachevsky, and Otto Luening), the BBC Radiophonic Workshop (est. 1958, which produced the iconic Doctor Who theme and countless other electronic sound effects and compositions), and the NHK Electronic Music Studio in Tokyo (est. 1955).

## 3.3 The Rise of the Synthesizer (1960 to 1980)

The 1960s brought a revolution in accessibility. **Robert Moog** developed modular voltage-controlled synthesizers beginning in the mid-1960s, introducing concepts that became standard vocabulary for the field: voltage-controlled oscillators (VCOs), voltage-controlled filters (VCFs), voltage-controlled amplifiers (VCAs), and envelope generators. The "one volt per octave" standard for pitch control voltage allowed modules from different sources to interoperate. His collaboration with musician Wendy Carlos resulted in Switched-On Bach (1968), an album of Bach compositions performed entirely on the Moog synthesizer that became a surprise commercial hit (reaching number ten on the Billboard 200) and introduced electronic sound to a mass audience.

**Donald Buchla**, working independently on the West Coast of the United States, developed his own modular systems (the Buchla 100 Series, 1963 onwards) with a markedly different philosophy: Buchla avoided the conventional keyboard, preferring touch plates, pressure-sensitive strips, and step sequencers to encourage exploration beyond traditional Western pitch structures. The Buchla instruments were championed by composers at the San Francisco Tape Music Center, including Morton Subotnick, whose Silver Apples of the Moon (1967) was the first electronic work commissioned by a record label (Nonesuch) and remains a landmark of the medium.

The development of smaller, more affordable synthesizers accelerated in the 1970s. The **Minimoog** (1970) was a compact, portable, three-oscillator instrument with a fixed signal path (no patching required) that became enormously influential in popular music, from progressive rock (Keith Emerson, Rick Wakeman) to funk (Bernie Worrell with Parliament-Funkadelic) to early hip-hop. The **ARP 2600** (1971) offered semi-modular capabilities with normalled connections that could be overridden by patch cables. The **EMS VCS3** (1969) in Britain, designed by Peter Zinovieff and David Cockerell, was used by the BBC Radiophonic Workshop, Pink Floyd, and Brian Eno.

Japanese manufacturers entered the market with transformative impact: **Roland**, **Korg**, and **Yamaha** produced increasingly affordable instruments that democratized electronic sound. The Roland **Jupiter-8** (1981), the **Sequential Circuits Prophet-5** (1978, the first polyphonic synthesizer with programmable memory), and the **Oberheim OB-Xa** (1980) defined the sound of the early 1980s.

The **Yamaha DX7** (1983), based on John Chowning's frequency modulation (FM) synthesis research at Stanford's Center for Computer Research in Music and Acoustics (CCRMA), became one of the best-selling synthesizers of all time (over 160,000 units sold) and marked the transition to fully digital synthesis. Its electric piano, bell, and bass patches became ubiquitous in pop, R&B, and new wave music throughout the decade.

## 3.4 Computer Music and Digital Audio (1957 to 1990)

The use of computers for music began at Bell Telephone Laboratories, where **Max Mathews** wrote the **MUSIC** program (MUSIC I, 1957), the first software to synthesize sound digitally. The program ran on an IBM 704 mainframe and could generate simple waveforms that were converted to analog audio and recorded to tape. Successive versions (MUSIC II through MUSIC V) established the paradigm of **unit generators**: modular software components (oscillators, filters, envelopes, noise sources) that could be connected in arbitrary configurations to generate and process sound. This paradigm persists in modern software synthesis environments and was the direct ancestor of languages such as Csound, SuperCollider, and Max/MSP.

At Stanford CCRMA (founded 1975 under John Chowning), and at IRCAM in Paris (Institut de Recherche et Coordination Acoustique/Musique, founded 1977 under Pierre Boulez), research into computer music flourished with major institutional support. IRCAM's work on real-time digital signal processing led to systems such as the 4X processor and eventually to the **Max** software environment (originally created by Miller Puckette at IRCAM in the late 1980s, later developed into the commercial Max/MSP by Cycling '74, and now distributed by Ableton). Max/MSP became a standard platform for interactive computer music, installations, and multimedia art.

The introduction of the **Compact Disc** (1982) brought digital audio to consumers. The CD's specifications (44.1 kHz sample rate, 16-bit depth, stereo) became a reference point for digital audio quality and remain relevant today. The development of affordable **digital audio workstations** (DAWs) in the late 1980s and 1990s, including Digidesign's Sound Designer (1984), Sound Tools (1989, the first hard-disk recording system for personal computers), and Pro Tools (1991), transformed the recording industry by making non-linear, non-destructive audio editing available on desktop computers.

## 3.5 The DAW Era and Beyond (1990 to Present)

The 1990s and 2000s saw an explosion of software-based music production tools. Steinberg introduced **Cubase** with MIDI sequencing capabilities and later pioneered the **VST** (Virtual Studio Technology) plugin standard (1996), which allowed third-party developers to create software effects and instruments that ran within a host DAW. This single innovation gave rise to an enormous ecosystem of virtual synthesizers, samplers, and effects processors that continues to expand today.

**Ableton Live** (2001) introduced the **Session View**, a non-linear, clip-based approach to arrangement that proved particularly influential for electronic music performance and production. Its design philosophy, which treated composition and performance as a continuum rather than separate activities, reflected the aesthetics of DJ culture and live electronic performance. **Apple Logic Pro**, **Avid Pro Tools**, **Cockos Reaper**, **PreSonus Studio One**, and **Image-Line FL Studio** all found large user bases, each with different strengths and workflows.

The laptop became a legitimate performance instrument. The Princeton Laptop Orchestra (PLOrk, founded by Dan Trueman and Perry Cook in 2005) and similar ensembles explored ensemble performance with computers and custom hemispherical speakers. Meanwhile, the open-source and DIY communities developed tools such as **Pure Data** (Pd, created by Miller Puckette as an open-source alternative to Max), **SuperCollider**, **ChucK**, and **Sonic Pi** for algorithmic composition and live coding.

The rise of **bedroom production** in the 2000s and 2010s, enabled by affordable laptops, free or low-cost DAWs, and widely available sample libraries and presets, transformed the economics and demographics of music creation. Artists such as Billie Eilish (who recorded her debut album primarily in a bedroom with her brother Finneas using Logic Pro) demonstrated that commercial-quality music could be produced outside the traditional studio system.

Today, music production technology continues to evolve rapidly. Cloud-based collaboration, machine-learning-assisted tools for mixing and mastering, generative AI models for music, and immersive spatial audio formats represent the current frontier, each raising new questions about creativity, ownership, and the meaning of musical authorship.

---

# Chapter 4: Digital Audio Fundamentals

The conversion of sound from a continuous physical phenomenon to a discrete numerical representation is the foundation of all modern music technology. This chapter covers the theory and practice of digital audio, from sampling and quantization to file formats and error correction.

## 4.1 Analog-to-Digital Conversion and Sampling Theory

<div class="definition">
<strong>Sampling</strong> is the process of measuring the amplitude of a continuous (analog) signal at regular intervals in time. Each measurement is called a <strong>sample</strong>. The number of samples taken per second is the <strong>sample rate</strong> (or sampling frequency), measured in Hertz.
</div>

The critical question is: how many samples per second are needed to accurately represent a given analog signal? The answer is provided by the **Nyquist-Shannon sampling theorem**, one of the most important results in information theory, independently derived by Harry Nyquist (1928) and Claude Shannon (1949).

<div class="theorem">
<strong>Nyquist-Shannon Sampling Theorem</strong>: A continuous signal that is band-limited to a maximum frequency of B Hz can be perfectly reconstructed from its samples if and only if the sampling rate is greater than 2B samples per second. The minimum sampling rate, 2B, is called the <strong>Nyquist rate</strong>, and B is the <strong>Nyquist frequency</strong> for a given sample rate.
</div>

Since human hearing extends to approximately 20 kHz, a sample rate slightly above 40 kHz is theoretically sufficient. The CD standard of 44.1 kHz (chosen partly for compatibility with early video-based digital recording systems that used NTSC and PAL video frames to store audio samples) provides a Nyquist frequency of 22.05 kHz, comfortably above the limit of hearing. Other common sample rates include 48 kHz (standard for video and broadcast), 88.2 kHz, 96 kHz, 176.4 kHz, and 192 kHz (used in high-resolution audio production).

Before sampling, the analog signal must pass through a **low-pass anti-aliasing filter** that removes all frequency content above the Nyquist frequency. If frequencies above the Nyquist limit are present during sampling, they are "folded" back into the audible range as spurious frequencies, a distortion artifact known as **aliasing**. Aliasing cannot be removed after the fact because the aliased frequencies are indistinguishable from legitimate signal content.

<div class="example">
<strong>Aliasing example</strong>: If a system samples at 44.1 kHz (Nyquist frequency 22.05 kHz) and a 23 kHz tone is present in the input, the tone will alias to 44.1 - 23 = 21.1 kHz, appearing as a spurious audible tone that was not in the original signal. Similarly, in visual media, aliasing produces the familiar effect of wagon wheels appearing to rotate backwards in film (the stroboscopic effect), because the frame rate undersamples the wheel's rotational frequency.
</div>

The anti-aliasing filter must have an extremely steep rolloff to pass all frequencies up to 20 kHz while completely blocking everything above 22.05 kHz (at a 44.1 kHz sample rate). In early digital systems, these brick-wall analog filters were difficult and expensive to design without introducing phase distortion or passband ripple. Modern systems largely avoid this problem by using **oversampling**: the analog signal is sampled at a much higher rate (often 64x or 128x the final sample rate), filtered digitally (which can be done with much greater precision than analog filtering), and then downsampled (decimated) to the target sample rate.

## 4.2 Quantization and Bit Depth

<div class="definition">
<strong>Quantization</strong> is the process of approximating each continuous sample value to the nearest value in a finite set of discrete levels. The number of available levels is determined by the <strong>bit depth</strong> (also called word length or resolution).
</div>

With n bits, there are 2^n possible quantization levels. For 16-bit audio (the CD standard), there are 65,536 levels. For 24-bit audio (common in professional recording), there are 16,777,216 levels. The difference between the actual sample value and the quantized value is called **quantization error** (or quantization noise), and it behaves as low-level noise added to the signal.

The **dynamic range** of a digital audio system (the ratio between the loudest and quietest representable signals) is approximately 6.02 dB per bit, plus 1.76 dB. Therefore:

| Bit Depth | Approximate Dynamic Range |
|---|---|
| 8-bit | 49.9 dB |
| 16-bit | 98.1 dB |
| 24-bit | 146.2 dB |
| 32-bit float | approximately 1528 dB (theoretical) |

The 16-bit dynamic range of about 98 dB is sufficient for most consumer playback, as it exceeds the dynamic range of typical listening environments. Professional recording at 24-bit provides ample headroom and a noise floor well below the thermal noise of analog electronics. The additional dynamic range is valuable not because the listener needs to hear sounds 146 dB apart, but because it allows the engineer to record at conservative levels (avoiding clipping) without sacrificing signal quality.

**Dithering** is the deliberate addition of very low-level noise (typically shaped white or triangular probability distribution noise) to the signal before quantization. Counter-intuitively, this added noise actually improves audio quality by converting the mathematically correlated quantization distortion into uncorrelated, benign-sounding random noise. Dithering is particularly important when reducing bit depth (for example, converting a 24-bit recording to 16-bit for CD release).

<div class="remark">
Without dither, quiet sounds (those using only the last few bits) exhibit audible distortion because the quantization error is correlated with the signal. With properly applied dither, these quiet sounds fade smoothly into a gentle noise floor rather than breaking up into distortion. The two most common dither types in audio are <strong>TPDF</strong> (Triangular Probability Density Function) dither, which completely eliminates distortion at the cost of a slight increase in noise, and <strong>noise-shaped</strong> dither (such as the Apogee UV22 or POW-r algorithms), which redistributes the dither noise energy into frequency ranges where the ear is less sensitive, further reducing the audible impact.
</div>

## 4.3 Reconstruction and Digital-to-Analog Conversion

To play back digital audio, the samples must be converted back to a continuous analog signal. A **digital-to-analog converter** (DAC) reads the numerical sample values and generates corresponding voltage levels. The resulting signal is a staircase approximation of the original waveform. A **reconstruction filter** (another low-pass filter, also called a smoothing filter) removes the staircase steps and the ultrasonic spectral images created by the conversion process, yielding a smooth continuous waveform.

The sampling theorem guarantees that perfect reconstruction is theoretically possible (the reconstructed signal is identical to the original band-limited signal), but in practice, the quality of the DAC and the reconstruction filter affect the output. Non-linearities in the DAC, clock jitter, and imperfect filtering can introduce subtle distortions and noise.

Modern DACs use **oversampling** to ease the requirements on the reconstruction filter. By interpolating additional samples (for example, upsampling by a factor of 8 or more using digital interpolation filters), the spectral images are pushed to much higher frequencies, allowing the use of a gentler (and less phase-distorting) analog output filter. Most contemporary high-quality DACs combine oversampling with **delta-sigma modulation**, which converts the multi-bit samples into a very high-speed, low-bit-depth stream that is then filtered to produce the analog output.

## 4.4 Digital Audio File Formats

Digital audio can be stored in various formats, broadly categorized as uncompressed, losslessly compressed, and lossy compressed:

| Category | Format | Description |
|---|---|---|
| Uncompressed | WAV (RIFF) | Microsoft/IBM standard; supports various bit depths and sample rates; widely compatible |
| Uncompressed | AIFF | Apple standard; similar capabilities to WAV; commonly used in professional audio on macOS |
| Lossless | FLAC | Free Lossless Audio Codec; typically achieves 50-60% compression with perfect reconstruction |
| Lossless | ALAC | Apple Lossless; similar to FLAC, native to Apple ecosystem |
| Lossy | MP3 | MPEG-1 Audio Layer III; uses psychoacoustic masking models to discard inaudible data; typical bitrates 128-320 kbps |
| Lossy | AAC | Advanced Audio Coding; improved successor to MP3; used by Apple, YouTube, and many streaming services |
| Lossy | OGG Vorbis | Open-source alternative to MP3/AAC; used extensively in games |

Lossy codecs exploit the psychoacoustic masking phenomena described in Chapter 2. They analyse the audio in short frames (typically 576 or 1152 samples for MP3), apply a modified discrete cosine transform (MDCT) to convert to the frequency domain, identify which frequency components are masked (and therefore inaudible), and allocate fewer bits to those components or omit them entirely. At high bitrates (256 to 320 kbps for MP3, or 256 kbps for AAC), the difference from the original is generally inaudible to most listeners in most conditions. At lower bitrates, artifacts such as "swirling" or "warbling" (pre-echo), loss of stereo image, reduced high-frequency detail, and "underwater" timbral qualities become noticeable.

For professional production, uncompressed or lossless formats are always used during recording, editing, and mixing. Lossy formats are used only for final delivery when file size or streaming bandwidth is a constraint.

## 4.5 Clipping, Headroom, and Floating-Point Audio

**Clipping** occurs when a signal exceeds the maximum representable amplitude. In fixed-point digital audio, the waveform is simply truncated (clamped) at the maximum value, producing harsh distortion. Unlike analog clipping (which can have a gradual, sometimes musically pleasing saturation character due to the soft-knee nonlinearity of tubes and transformers), digital clipping is abrupt and almost universally unpleasant, generating a burst of high-frequency harmonic and intermodulation distortion.

**Headroom** is the margin between the nominal operating level and the maximum level before clipping. Professional practice maintains several decibels of headroom during recording and mixing to accommodate unexpected transients. A common recommendation is to record with peaks reaching -12 to -6 dBFS, leaving ample room for surprises.

Modern DAWs typically process audio internally using **32-bit floating-point** (or even 64-bit double-precision floating-point) arithmetic. Floating-point representation separates the number into a mantissa (significand) and an exponent, providing an enormous dynamic range (the 32-bit IEEE 754 format offers about 1528 dB of theoretical dynamic range) and virtually eliminating the risk of internal clipping during processing. The signal can exceed 0 dBFS within the DAW's processing chain without distortion, as long as the final output is brought back below 0 dBFS before digital-to-analog conversion or export to a fixed-point format. This is one of the most liberating aspects of modern digital audio workstations: the internal processing headroom is, for all practical purposes, unlimited.

---

# Chapter 5: Recording

Recording is the act of capturing sound as a permanent representation. In modern practice, this means converting acoustic energy into electrical signals (via microphones), routing those signals through a mixer or audio interface, and converting them to digital data. This chapter covers the equipment, techniques, and decision-making involved.

## 5.1 Microphones: Types and Operating Principles

A microphone is a **transducer**: it converts acoustic energy (sound pressure waves) into electrical energy (an audio signal). The three major types of microphones are dynamic, condenser, and ribbon.

<div class="definition">
A <strong>dynamic microphone</strong> uses a thin diaphragm attached to a coil of wire suspended in a magnetic field. When sound waves move the diaphragm, the coil moves within the field, generating an electrical current by electromagnetic induction. Dynamic microphones are robust, relatively inexpensive, and do not require external power.
</div>

Classic examples include the Shure SM57 (an industry standard for snare drums and guitar amplifiers since 1965) and SM58 (the standard vocal microphone for live sound). The Sennheiser MD421 is another widely used dynamic microphone, prized for its versatility on toms, guitar amps, and broadcast vocals. Dynamic microphones tend to have a somewhat limited high-frequency response and transient accuracy compared to condensers, but their ruggedness and ability to handle extremely high sound pressure levels (over 150 dB SPL in some cases) make them ideal for loud sources.

<div class="definition">
A <strong>condenser microphone</strong> (also called a capacitor microphone) uses a thin, electrically charged diaphragm positioned close to a fixed backplate, forming a capacitor. Sound waves cause the diaphragm to vibrate, changing the distance between the plates and thus the capacitance, which produces a varying voltage signal. Condenser microphones require a power source, either a battery or <strong>phantom power</strong> (typically 48V DC supplied through the microphone cable from the mixer or audio interface).
</div>

Condenser microphones are generally more sensitive, have wider and flatter frequency response, and produce a more detailed, transparent sound than dynamics. Large-diaphragm condensers (with diaphragms typically one inch or larger, such as the Neumann U87, AKG C414, or Audio-Technica AT4050) are standard for studio vocals, acoustic guitar, piano, and other detailed recording applications. Small-diaphragm condensers (with diaphragms typically half an inch or smaller, such as the AKG C451, Neumann KM184, or DPA 4011) are preferred for their accuracy, consistent off-axis response, and fast transient response on sources such as acoustic guitar, strings, drum overheads, and hi-hat.

<div class="definition">
A <strong>ribbon microphone</strong> uses a thin strip (ribbon) of corrugated aluminum or other conductive metal suspended in a magnetic field. Sound waves cause the ribbon to vibrate, generating an electrical signal. Ribbon microphones are known for their warm, smooth character, particularly their gentle high-frequency rolloff, and their natural figure-8 polar pattern.
</div>

Classic models include the RCA 44 and 77 (vintage ribbons from the 1930s-1950s, still prized today) and the Royer R-121 (a modern active ribbon designed for high-SPL sources). Older ribbon microphones are delicate (the ribbon can be stretched or broken by strong blasts of air or by inadvertently applying phantom power), but modern designs from manufacturers such as Royer, AEA, and sE Electronics are considerably more robust. Ribbon microphones are prized for their musicality on sources such as brass instruments, electric guitar cabinets, drum rooms, and strings.

## 5.2 Polar Patterns

A microphone's **polar pattern** (or pickup pattern) describes its sensitivity as a function of the angle of sound incidence.

| Pattern | Description | Characteristics |
|---|---|---|
| Omnidirectional | Equal sensitivity in all directions | Natural low-frequency response; picks up room ambience; no proximity effect |
| Cardioid | Heart-shaped; most sensitive at front, least at rear | Rejects sound from behind; moderate proximity effect; most common pattern for live and studio use |
| Supercardioid | Narrower front lobe than cardioid, with a small rear lobe | Better side rejection than cardioid; null points at 125 degrees off-axis |
| Hypercardioid | Even narrower front lobe, larger rear lobe | Maximum rejection at 110 degrees off-axis rather than 180 degrees |
| Figure-8 (bidirectional) | Equal sensitivity front and back, null on the sides | Natural pattern for ribbon microphones; useful for mid-side stereo recording and duet recording |

Many condenser microphones offer switchable polar patterns (achieved by using a dual-diaphragm capsule and varying the polarization voltages on the front and back diaphragms), providing versatility in a single microphone.

The **proximity effect** is an increase in bass response that occurs when a directional microphone (cardioid, figure-8, or any pattern other than omnidirectional) is placed very close to the sound source (within a few inches). This happens because at close range, the sound wave's curvature is significant, and the pressure gradient across the microphone's diaphragm is altered in a way that enhances low frequencies. Vocalists and voice actors sometimes exploit this for a warmer, more intimate tone, while at other times it must be mitigated with a high-pass filter or increased distance.

## 5.3 Microphone Placement Techniques

The placement of a microphone relative to the sound source has a profound effect on the recorded sound, often more than the choice of microphone itself. General principles include:

**Close miking** (a few centimetres to about 30 cm from the source) captures a direct, present sound with minimal room ambience. It provides good isolation from other instruments in a multi-mic recording session. Close miking is standard for drums (individual mics on snare, kick, toms), guitar amplifiers, and many studio vocals. The trade-off is that close miking tends to emphasize proximity effect, pick up mechanical noise from the instrument, and capture only a small area of the source (which may not represent the instrument's full tonal character).

**Distant miking** (one to several metres from the source) captures more of the room's acoustic character and the instrument's full radiation pattern. It is used for classical recording, choral ensembles, and any situation where the natural reverberance and spatial character of the performance space is desired.

**Stereo miking techniques** capture a spatial image using two (or more) microphones:

- **X/Y (coincident pair)**: two cardioid microphones placed with capsules as close together as possible, angled 90 to 135 degrees apart. Produces a stable mono-compatible stereo image through level differences only (no timing differences). The trade-off is a somewhat narrow stereo width.
- **A/B (spaced pair)**: two microphones (often omnidirectional) spaced some distance apart (typically 30 cm to several metres). Captures time-of-arrival differences that produce a wide, spacious stereo image, but may have phase issues in mono. Often used for orchestral recording, piano, and choir.
- **Mid-Side (M/S)**: one cardioid microphone facing forward (mid) and one figure-8 microphone facing sideways (side). The stereo width can be adjusted after recording by varying the level of the side signal relative to the mid. Offers perfect mono compatibility because collapsing to mono eliminates only the side signal.
- **ORTF**: two cardioid microphones spaced 17 cm apart and angled 110 degrees. Named after the French broadcasting organization that developed it. Combines time and level differences for a natural stereo image.
- **Decca Tree**: three omnidirectional microphones arranged in a triangle (typically with the centre microphone about 1.5 metres in front of the two flanking microphones, which are spaced about 2 metres apart). Used extensively for orchestral recording since the 1950s by Decca Records and remains a standard orchestral miking technique.
- **Blumlein Pair**: two figure-8 microphones arranged in a coincident configuration at 90 degrees. Named after Alan Blumlein, who patented stereo recording in 1931. Captures a remarkably natural and immersive stereo image but requires a good-sounding room because the rear lobes pick up significant ambience.

## 5.4 Mixers, Gain Staging, and Signal Flow

A **mixing console** (or mixer) routes, combines, and processes audio signals. Even in the age of software mixing within DAWs, understanding the signal flow of a hardware mixer is fundamental because the same concepts apply in the virtual domain.

A typical mixer channel strip includes (in signal flow order):

1. **Microphone preamplifier (preamp)**: amplifies the weak microphone-level signal (typically -60 to -20 dBu) to line level (typically +4 dBu professional or -10 dBV consumer). The preamp is often the most sonically important component in the signal chain after the microphone itself.
2. **Phase/polarity invert**: a switch that inverts the signal's polarity (flips the waveform upside down), useful for correcting phase relationships between multiple microphones on the same source.
3. **High-pass filter (HPF)**: removes low-frequency rumble, handling noise, and proximity effect. Typically has a fixed or variable cutoff frequency between 40 and 160 Hz.
4. **Insert point**: a send-return loop for inserting external processors (compressors, EQ) into the signal path at this point in the chain.
5. **Equalization (EQ)**: adjusts the frequency balance. Console EQs range from simple two-band (bass/treble) to fully parametric four-band designs.
6. **Auxiliary sends**: tap the signal to send a copy to effects processors (reverb, delay) or monitor mixes. Sends can be pre-fader (level independent of the channel fader, used for monitor mixes) or post-fader (level follows the channel fader, used for effects sends).
7. **Pan control**: positions the signal in the stereo field.
8. **Fader**: controls the channel's contribution to the mix bus.
9. **Mix bus**: the summing point where all channel outputs are combined into the stereo (or multichannel) master output.

<div class="definition">
<strong>Gain staging</strong> is the practice of setting the signal level at each stage of the audio chain to optimize the signal-to-noise ratio while avoiding distortion. Each amplification or processing stage has a nominal operating level, and the goal is to keep the signal well above the noise floor but well below the clipping threshold at every point.
</div>

Proper gain staging begins at the microphone preamp. The gain should be set so that the loudest expected input produces a healthy level (peaking at perhaps -12 to -6 dBFS on a digital meter) without clipping. Subsequent processing stages should maintain similar headroom. In the analog domain, professional equipment is designed around a nominal operating level of +4 dBu with headroom of approximately 20 dB above that (to +24 dBu). In the digital domain, there is no benefit to "running hot" (recording at levels near 0 dBFS), and the risk of clipping makes conservative levels advisable.

## 5.5 Analog-to-Digital Conversion in Practice

The **audio interface** is the device that performs analog-to-digital and digital-to-analog conversion for a computer-based recording system. Modern audio interfaces connect via USB, Thunderbolt, or networked audio protocols (such as Dante, AVB, or Ravenna) and range from simple two-channel devices suitable for home studios to large multi-channel systems for professional facilities.

Key specifications of an audio interface include:

- **Number of inputs and outputs**: determines how many simultaneous signals can be recorded and monitored. A solo vocalist-songwriter might need only two inputs; a full band recording live might need sixteen or more.
- **Supported sample rates and bit depths**: professional interfaces support at least 24-bit, 96 kHz operation. Note that increasing the sample rate often reduces the available channel count on some interfaces due to bandwidth limitations.
- **Converter quality**: measured by dynamic range (typically 110 to 124 dB for professional converters), total harmonic distortion plus noise (THD+N), and jitter performance.
- **Latency**: the delay introduced by the conversion process and the computer's audio buffer. Low latency (a few milliseconds round-trip) is critical for real-time monitoring during recording. Most interfaces allow the user to adjust the buffer size: smaller buffers reduce latency but increase CPU load and the risk of audio dropouts.
- **Preamp quality**: integrated microphone preamps vary widely in quality, gain range, and tonal character. Some interfaces include preamps modelled on classic hardware designs.

**Jitter** refers to timing errors in the sampling clock. If the interval between samples is not perfectly uniform, the resulting timing uncertainty introduces both noise and distortion. High-quality interfaces use stable crystal oscillators and careful clock distribution to minimize jitter to negligible levels (typically measured in picoseconds). When multiple digital devices are connected, they must share a common clock reference (word clock) to prevent jitter caused by asynchronous clocking.

---

# Chapter 6: Audio Editing

Audio editing is the process of manipulating recorded sound: selecting, cutting, copying, pasting, rearranging, and otherwise shaping audio material. The transition from physical tape editing (literally cutting magnetic tape with a razor blade and splicing it back together) to software-based editing has made the process faster, more flexible, and non-destructive.

## 6.1 The Digital Audio Workstation (DAW) Environment

<div class="definition">
A <strong>Digital Audio Workstation (DAW)</strong> is a software application used for recording, editing, mixing, and producing audio. The DAW integrates multitrack recording, MIDI sequencing, audio editing, effects processing, and mixing into a single environment.
</div>

Major DAWs include Avid Pro Tools (the industry standard in professional recording studios and post-production), Apple Logic Pro (widely used for music production on macOS), Ableton Live (dominant in electronic music and live performance), Steinberg Cubase (strong in MIDI and composition), Cockos Reaper (lightweight, highly customizable, and affordable), PreSonus Studio One (known for intuitive workflow), and Image-Line FL Studio (popular for beat-making and electronic music). While each has a distinct interface and workflow philosophy, they share common fundamental concepts:

- **Tracks**: horizontal lanes that contain audio or MIDI data. Each track has its own controls (volume fader, pan, mute, solo, record enable, input/output routing, insert effects, and send effects).
- **Regions/Clips**: discrete segments of audio or MIDI data that can be placed, moved, and edited on tracks. A single audio file on disk may be referenced by multiple regions, each pointing to different portions of the file.
- **Timeline**: the horizontal axis representing time, typically displayed in bars and beats (for music) or hours, minutes, seconds, and frames (for post-production and film scoring).
- **Transport controls**: play, stop, record, fast-forward, rewind, and loop playback. The playback cursor (playhead) shows the current position.
- **Mixer view**: a virtual mixing console displaying channel strips for all tracks, often with visual representations of plugin interfaces.

## 6.2 Reading and Interpreting Waveforms

When audio is displayed in a DAW, it appears as a **waveform**: a visual representation of amplitude over time. Learning to read waveforms quickly is an essential skill for efficient audio editing.

A waveform's height at any point indicates the signal's amplitude at that moment. Loud passages appear as tall, dense waveforms, while quiet passages are thin. A sharp transient (such as a drum hit or a consonant in speech) appears as a sudden spike. Silence is a flat line at zero. Sustained sounds (such as a held note on a string instrument) appear as consistent, sustained waveforms.

With experience, editors can identify musical features visually: the rhythmic pattern of a drum performance, the phrasing of a vocal take, the attack and decay of plucked string notes, and the location of breaths, plosives, and mouth noises in speech recordings. This visual skill dramatically speeds up the editing process because the editor can navigate to specific moments without needing to listen through the entire recording.

Zooming in reveals the individual cycles of the waveform. At high zoom levels, you can see the sinusoidal character of pure tones or the complex shapes of real instruments. Zooming out shows the overall dynamic envelope of a performance: where it gets louder, where it gets quieter, and where silence occurs.

Many DAWs also display a **spectrogram** view, which shows frequency content over time using a colour-coded representation (typically with frequency on the vertical axis, time on the horizontal axis, and colour or brightness indicating amplitude). This is invaluable for identifying specific sounds (spoken words, noise, individual instruments) within a recording and for spotting problems such as low-frequency hum, clicks, sibilance, or unwanted resonances.

## 6.3 Basic Editing Operations

The fundamental editing operations in a DAW mirror those of a word processor, adapted for audio:

**Selection**: choosing a portion of audio by clicking and dragging across the waveform, or by entering precise start and end times. Most DAWs support selection across multiple tracks simultaneously.

**Cut, Copy, and Paste**: removing, duplicating, and inserting audio segments. Cutting removes the selected audio and (depending on the editing mode) may or may not close the resulting gap. In "shuffle" or "ripple" mode, subsequent material slides forward to close the gap. In "slip" or "spot" mode, a gap remains.

**Trimming**: adjusting the start or end point of a region/clip by dragging its edges. This is a non-destructive operation; the hidden audio still exists and can be revealed by extending the edge back. This is one of the key advantages of non-destructive editing: the original recording is never modified.

**Splitting/Dividing**: separating a region into two or more pieces at the cursor position. This is the digital equivalent of cutting tape with a razor blade, but infinitely more flexible because the split can be undone or the pieces can be reassembled at any time.

**Moving**: dragging a region to a new position on the timeline or to a different track.

**Nudging**: moving a region by small, precise increments (often user-defined in samples, milliseconds, or beat subdivisions) using keyboard shortcuts. This is essential for fine-tuning the timing of individual hits or phrases.

**Consolidation/Bouncing**: rendering a series of edited regions on a track into a single continuous audio file. This is useful for simplifying a heavily edited session, preparing stems for mixing, or ensuring that edits are permanently applied.

## 6.4 Crossfades, Fades, and Transitions

**Fades** are gradual changes in amplitude at the beginning (**fade-in**) or end (**fade-out**) of an audio region. They prevent clicks and pops that would occur if a region started or ended at a non-zero amplitude (creating a discontinuity in the waveform).

A **crossfade** is the overlap of a fade-out on one region with a fade-in on the next, creating a smooth transition. Crossfades are essential when assembling composite takes (comping) or when editing together different sections of a performance. The length and shape of the crossfade affect the character of the transition:

- **Linear crossfade**: amplitude decreases/increases at a constant rate. Can produce a slight dip in perceived loudness at the midpoint because the sum of two linear fades at 50% each is -6 dB.
- **Equal-power crossfade**: maintains constant acoustic energy through the transition by using curved (typically sinusoidal) fade shapes. The sum at the midpoint is approximately 0 dB. Preferred for most musical editing.
- **S-curve crossfade**: slow at the start and end, fast in the middle. Produces a gradual, transparent-sounding transition. Well-suited for editing within sustained passages.

The choice of crossfade length depends on the material. For tight rhythmic editing (drums, percussive material), crossfades of 5 to 20 milliseconds are typical. For sustained sounds (pads, strings, vocals), longer crossfades of 20 to 200 milliseconds or more may be needed to avoid audible artifacts. The ideal crossfade is one the listener never notices.

## 6.5 Time-Stretching, Pitch-Shifting, and Advanced Editing

**Time-stretching** changes the duration of audio without altering its pitch. **Pitch-shifting** changes the pitch without altering the duration. Both operations rely on sophisticated digital signal processing algorithms.

Early approaches used simple techniques: playing a tape faster raises pitch and shortens duration simultaneously (the "chipmunk" effect). Separating these two parameters required the development of algorithms based on several approaches:

- **Granular synthesis methods** (such as WSOLA, Waveform Similarity Overlap-Add): the audio is broken into tiny overlapping segments (grains) that are repositioned in time and crossfaded. Effective for speech and monophonic material but can produce artifacts (phasiness, metallic ringing) with polyphonic content.
- **Phase vocoder**: the audio is analysed in the frequency domain using the Short-Time Fourier Transform (STFT), and the phase and magnitude of each frequency bin are manipulated independently before resynthesis. This approach can produce high-quality results but may introduce "phasiness" or smear transients.
- **Hybrid algorithms**: modern commercial implementations (such as Elastique by zplane, used in many DAWs) combine multiple techniques to handle both transient and tonal material adaptively.

Modern DAWs offer high-quality time-stretching and pitch-shifting that can handle moderate amounts of change (up to perhaps plus or minus a few semitones, or tempo changes of 20 to 30 percent) with minimal audible artifacts. Extreme changes (an octave of pitch-shift, or halving the tempo) typically produce audible artifacts such as metallic ringing, phasiness, or transient smearing.

**Elastic audio** (Pro Tools), **Audio Warp** (Cubase), and **Warp Markers** (Ableton Live) allow per-note or per-transient timing adjustments within a recording, analogous to MIDI quantization but applied to audio. This is invaluable for tightening rhythmic performances without re-recording: individual drum hits, bass notes, or guitar strums can be nudged to align with the grid while leaving the rest of the performance untouched.

**Comping** (composite editing) is the process of recording multiple takes of a performance and assembling the best portions of each take into a single, ideal composite performance. Most DAWs provide dedicated comping workflows with take lanes (or "playlists" in Pro Tools) and quick-switch audition of alternatives, making it easy to select the best phrase, word, or even syllable from each take.

---

# Chapter 7: Digital Signal Processing

Digital signal processing (DSP) is the mathematical manipulation of audio signals after they have been captured in digital form. Effects processors, equalisers, compressors, and reverbs all operate through DSP. This chapter surveys the main categories of audio effects and discusses their transparent and artistic applications.

## 7.1 Equalization (EQ)

<div class="definition">
<strong>Equalization</strong> is the process of adjusting the balance of frequency components in an audio signal. An <strong>equalizer</strong> is a filter (or set of filters) that boosts or attenuates specific frequency ranges.
</div>

EQ types include:

- **High-pass filter (HPF) / Low-cut filter**: passes frequencies above a specified cutoff frequency and attenuates those below it at a specified rate (typically 6, 12, 18, or 24 dB per octave). Commonly used to remove low-frequency rumble, wind noise, proximity effect, and stage vibration.
- **Low-pass filter (LPF) / High-cut filter**: passes frequencies below the cutoff and attenuates those above. Used to tame harshness, remove high-frequency noise, or simulate the effect of distance.
- **Shelving EQ**: boosts or cuts all frequencies above (high shelf) or below (low shelf) a specified frequency by a constant amount. The "treble" and "bass" controls on a consumer stereo are shelving EQs. A shelving EQ affects a broad range while maintaining a flat response within the boosted or cut region.
- **Parametric EQ**: the most flexible type. Each band allows the user to set three parameters: the **centre frequency** (the frequency at which maximum boost or cut occurs), the **gain** (boost or cut in dB), and the **Q** (quality factor, which controls bandwidth). A high Q produces a narrow band of adjustment; a low Q produces a broad adjustment. A fully parametric EQ with four to seven bands can shape virtually any frequency response curve.
- **Graphic EQ**: a bank of fixed-frequency bands (typically spaced at one-third octave intervals, with 31 bands covering the audible range), each with a slider for boost or cut. Common in live sound for room tuning and monitor equalization.

<div class="remark">
The practice of <strong>subtractive EQ</strong> (cutting problem frequencies rather than boosting desired ones) is generally preferred in mixing because it sounds more natural, avoids increasing the overall level (and thus the risk of clipping), and works with the source rather than imposing an artificial character. A widely cited guideline is: "cut to fix, boost to flavour." However, skilled engineers use both approaches as appropriate.
</div>

**Phase and EQ**: all analog-modelled and minimum-phase digital EQs introduce phase shifts at and around the adjusted frequencies. These phase shifts are a natural consequence of the filter mathematics (the Kramers-Kronig relations dictate that any change in amplitude response must be accompanied by a corresponding phase change in a causal, minimum-phase system). The phase shifts are generally inaudible in isolation but can cause problems when the processed signal is combined with an unprocessed copy (as in parallel processing or multi-microphone recordings). **Linear-phase EQs** avoid this issue by using FIR (Finite Impulse Response) filters that apply uniform delay across all frequencies, but at the cost of higher latency and potential pre-ringing artifacts (a brief echo preceding transients).

## 7.2 Dynamics Processing

Dynamics processors control the amplitude envelope of a signal. The primary types are compressors, limiters, expanders, and gates.

<div class="definition">
A <strong>compressor</strong> reduces the dynamic range of a signal by attenuating levels that exceed a set <strong>threshold</strong>. The amount of attenuation is determined by the <strong>ratio</strong>. A ratio of 4:1 means that for every 4 dB the signal exceeds the threshold, only 1 dB passes through to the output.
</div>

Key compressor parameters:

| Parameter | Description |
|---|---|
| Threshold | The level above which compression begins |
| Ratio | The degree of compression (input dB above threshold : output dB above threshold) |
| Attack | How quickly the compressor responds once the signal exceeds the threshold (typically 0.1 to 100 ms) |
| Release | How quickly the compressor stops attenuating after the signal falls below the threshold (typically 10 ms to several seconds) |
| Knee | The transition curve between uncompressed and compressed regions; "hard knee" is abrupt (starts compressing exactly at the threshold), "soft knee" is gradual (compression begins gently below the threshold and increases progressively) |
| Makeup gain | Gain applied after compression to restore the average level, compensating for the gain reduction |

A **limiter** is a compressor with a very high ratio (typically 10:1 or higher, often infinity:1), used to prevent the signal from exceeding a set ceiling. Limiters are essential in mastering to set the final peak level and in broadcast to comply with regulatory loudness limits. A **brickwall limiter** guarantees that no sample exceeds the set ceiling, using look-ahead processing to anticipate and catch the fastest transients.

An **expander** increases the dynamic range by attenuating signals that fall below the threshold, making quiet parts even quieter. A **gate** (or noise gate) is an expander with a very high ratio, used to silence a signal when it drops below the threshold. Gates are commonly used on drums to eliminate bleed from other instruments between hits, and on vocals to reduce room noise and breath sounds during pauses.

**Sidechain compression** uses the level of one signal (the "key" or "sidechain input") to control the compression applied to another signal. A classic application is ducking the bass when the kick drum hits, ensuring both occupy the same low-frequency range without energetic conflict. This technique is also used creatively in electronic dance music to produce the rhythmic "pumping" or "breathing" effect that has become a signature of many subgenres. Sidechain compression can also use an EQ'd version of the sidechain signal (frequency-conscious sidechaining or "de-essing") to make the compressor respond only to specific frequency ranges.

**Multiband compression** splits the signal into separate frequency bands (typically three to six), each with its own compressor. This allows different dynamic treatment for the bass, midrange, and treble, avoiding the interaction problems of broadband compression (where a loud bass note can cause the entire signal, including the treble, to be compressed). Multiband compression is commonly used in mastering and broadcast processing.

## 7.3 Time-Based Effects: Reverb and Delay

**Delay** (or echo) stores a copy of the input signal and plays it back after a specified time interval. Parameters include delay time, feedback (how much of the delayed signal is fed back into the input, creating repeating echoes that decay over multiple repetitions), and wet/dry mix. Short delays (under about 30 ms) create comb-filtering and doubling effects. Medium delays (30 to 100 ms) produce slapback echo (associated with rockabilly and early rock and roll). Long delays (100 ms to several seconds) create distinct rhythmic echoes often synchronized to the song's tempo.

<div class="definition">
<strong>Reverb</strong> (reverberation) is the persistence of sound in an enclosed space after the original sound source has stopped. It results from a dense accumulation of reflections from the walls, ceiling, floor, and objects in the room.
</div>

Natural reverberation has three phases:

1. **Direct sound**: the first arrival from the source, travelling the shortest path to the listener.
2. **Early reflections**: the first few distinct reflections that arrive within about 50 to 80 ms of the direct sound. They convey information about the size, shape, and surface materials of the room. Our perception of room size is largely determined by the timing and pattern of early reflections.
3. **Diffuse tail (late reverberation)**: a dense, statistically random decay of reflected energy where individual reflections are no longer distinguishable. The time it takes for the reverb to decay by 60 dB is called the **RT60** (reverberation time). Typical RT60 values range from about 0.2 seconds (a small, well-damped vocal booth) to 1 to 2 seconds (a typical studio or concert hall) to 5 seconds or more (a large cathedral).

Digital reverb is produced by several methods:

- **Algorithmic reverb**: uses networks of delay lines, all-pass filters, comb filters, and feedback loops to simulate reverberant spaces. The Schroeder reverberator (1961) was the first practical digital reverb algorithm. Modern algorithmic reverbs (such as those by Valhalla, FabFilter, or Lexicon) are highly adjustable (room size, diffusion, damping, pre-delay, decay time, high-frequency and low-frequency decay ratios, early reflection pattern) and computationally efficient.
- **Convolution reverb**: uses an **impulse response** (IR), a recording of a short, broadband sound (such as a starter pistol, balloon pop, or sine sweep) captured in an actual acoustic space. The IR is mathematically convolved with the dry signal to apply the exact reverberant character of that space. Convolution reverb can capture real rooms, concert halls, churches, plate reverbs, spring reverbs, and even the resonant character of physical objects with remarkable fidelity, but offers less flexibility in editing the character after the fact compared to algorithmic reverb.

## 7.4 Modulation Effects

Modulation effects use a low-frequency oscillator (LFO) or other time-varying signal to modulate a parameter of the audio, creating movement and animation in the sound.

- **Chorus**: a short, modulated delay (typically 20 to 50 ms) mixed with the dry signal. The modulation creates subtle pitch and timing variations that simulate the effect of multiple performers playing in unison, each with slightly different intonation and timing. Classic examples include the Boss CE-1 (used extensively by Andy Summers of the Police) and the Roland Juno-106's built-in chorus.
- **Flanger**: a very short, modulated delay (typically 1 to 10 ms) mixed with the dry signal, producing a sweeping, jet-like comb-filter effect as the delay time changes. Originally created in the analog domain by pressing on the flange (rim) of a tape reel to slow it slightly against a duplicate playback.
- **Phaser**: uses a series of all-pass filters (typically 4, 8, or 12 stages) with modulated centre frequencies to create a sweeping notch effect. Similar to flanging but typically smoother and less dramatic, because the notches are not harmonically spaced (as they are in comb filtering).
- **Tremolo**: modulation of amplitude by an LFO, producing a wavering volume effect. Used by guitarists (Fender amplifier tremolo circuits) and in electronic music production.
- **Vibrato**: modulation of pitch by an LFO, producing a wavering pitch effect. Distinct from tremolo (amplitude) though the two are sometimes confused in common parlance.
- **Rotary speaker simulation**: emulates the Leslie speaker cabinet, which uses a rotating horn (for high frequencies) and a rotating drum/baffle (for low frequencies) to create a complex combination of Doppler-shifted pitch modulation, amplitude modulation, and directional filtering. The Leslie speaker is inextricably associated with the Hammond organ sound but has been used on guitars, vocals, and other sources.

## 7.5 Signal Chain, Parallel Processing, and Transparent vs. Artistic Use

The order in which effects are applied matters greatly because each processor changes the signal that the next processor receives. A general (though not rigid) convention for a mixing signal chain is:

1. High-pass filter (remove unwanted low frequencies first)
2. Subtractive EQ (fix problem frequencies)
3. Compression (control dynamics)
4. Additive EQ (enhance desired characteristics)
5. Saturation/distortion (if desired, for warmth or harmonic richness)
6. Modulation effects
7. Time-based effects (delay, reverb) — typically on sends rather than inserts

<div class="remark">
Effects placed on <strong>inserts</strong> process the entire signal passing through the channel, in series. Effects placed on <strong>sends</strong> (auxiliary/bus routing) process a copy of the signal, and the processed (wet) result is blended back in via a return channel. Send-based routing is standard for reverb and delay because it allows multiple tracks to share the same reverb (saving processing power and creating a cohesive acoustic space that places all the elements in the same virtual room). It also allows the effect's return level and processing to be controlled independently of the source track.
</div>

**Parallel processing** (also called "New York compression" when applied to drums, after a technique popularized by mix engineers in New York studios) involves blending a heavily processed copy of a signal with the unprocessed original. This technique retains the dynamics, transient detail, and natural character of the dry signal while adding the sustain, density, and aggression of the compressed version. Parallel processing can also be applied with saturation, EQ, and other effects.

A crucial distinction in music production is between **transparent** and **artistic** use of effects. Transparent processing aims to be invisible to the listener: corrective EQ that removes a room resonance, gentle compression that evens out a vocal performance, or reverb that places an instrument in a realistic space without drawing attention to itself. Artistic processing draws attention to itself as a creative element: extreme distortion on a vocal, rhythmic delay throws timed to the tempo, exaggerated filtering that sweeps across the spectrum, or cavernous reverb tails that define the mood of an entire track. Both approaches are valid and important; what matters is intentionality and awareness of the effect on the listener's experience.

---

# Chapter 8: MIDI

MIDI (Musical Instrument Digital Interface) is a communications protocol that allows electronic musical instruments, computers, and other devices to exchange performance information. Since its introduction in 1983, MIDI has become one of the most enduring and widely used standards in music technology, outlasting virtually every other digital music standard from its era.

## 8.1 History and Purpose of MIDI

Before MIDI, electronic instruments from different manufacturers could not communicate with each other. A sequencer made by Roland could not control a synthesizer made by Korg. Each manufacturer used proprietary control voltages and trigger formats. In 1981, Dave Smith of Sequential Circuits (later joined by Ikutaro Kakehashi of Roland) proposed a Universal Synthesizer Interface at the Audio Engineering Society convention. The resulting specification, MIDI 1.0, was published in August 1983 by the MIDI Manufacturers Association (MMA) and the Japan MIDI Standards Committee (JMSC).

<div class="definition">
<strong>MIDI</strong> (Musical Instrument Digital Interface) is a technical standard that defines a communications protocol, a digital interface, and electrical connectors for connecting electronic musical instruments, computers, and related audio devices. Crucially, MIDI transmits <strong>performance data</strong> (which notes are played, how hard, when they start and stop, which controllers are moved, etc.), not audio. The sound produced depends entirely on the receiving instrument or software.
</div>

The analogy often used is that MIDI is like a piano roll or a sheet of music: it describes what to play, not the sound itself. The actual sound depends on the instrument (or virtual instrument) that receives and interprets the MIDI data. The same MIDI file can sound like a grand piano, a distorted electric guitar, a string orchestra, or a drum kit, depending on what is assigned to play it back.

This separation of performance data from sound has proven extraordinarily powerful. It means that a recorded MIDI performance can be endlessly edited, transposed, reassigned to different instruments, quantized, and transformed without any degradation, because no audio signal is being processed, only numerical data describing the performance.

## 8.2 MIDI Messages

MIDI communication consists of a stream of short digital messages. Each message is one to three bytes long (8 bits per byte). The first byte is the **status byte**, which identifies the message type and (for channel messages) the MIDI channel. Subsequent bytes are **data bytes** containing the message parameters. Messages are divided into **Channel Messages** (tied to a specific MIDI channel, 1 through 16) and **System Messages** (global, not channel-specific).

Key Channel Messages:

| Message | Status Byte | Data | Description |
|---|---|---|---|
| Note On | 1001nnnn | Note number (0-127), Velocity (1-127) | A key has been pressed; velocity indicates how hard |
| Note Off | 1000nnnn | Note number (0-127), Velocity (0-127) | A key has been released; release velocity rarely used |
| Control Change (CC) | 1011nnnn | Controller number (0-127), Value (0-127) | Continuous controllers: mod wheel (CC1), volume (CC7), pan (CC10), expression (CC11), sustain pedal (CC64), etc. |
| Program Change | 1100nnnn | Program number (0-127) | Selects a patch/preset on the receiving instrument |
| Pitch Bend | 1110nnnn | LSB (0-127), MSB (0-127) | Pitch wheel position; 14-bit resolution (0-16383), centred at 8192 |
| Channel Aftertouch | 1101nnnn | Pressure value (0-127) | Pressure applied to keys after initial strike; single value for the whole channel |
| Polyphonic Aftertouch | 1010nnnn | Note number (0-127), Pressure (0-127) | Per-note pressure; rarely supported on older keyboards |

The 'nnnn' bits represent the MIDI channel (0-15 in binary, corresponding to channels 1-16). The 16-channel limitation of MIDI 1.0 means that a single MIDI connection can address up to 16 independent instruments simultaneously. The note number range of 0 to 127 covers over ten octaves (with 60 representing middle C in the most common convention), and the velocity range of 0 to 127 provides 128 levels of dynamic expression.

System Messages include:

- **System Exclusive (SysEx)**: manufacturer-specific data for patch dumps, firmware updates, and device-specific control. The format includes a manufacturer ID so that only the intended device responds.
- **Timing Clock**: 24 pulses per quarter note (PPQN), used for tempo synchronization between devices. The tempo is implicit in the clock rate.
- **Song Position Pointer**: indicates the current position in a song as a number of sixteenth notes from the beginning, allowing synchronized start from any point.
- **System Real-Time**: start, stop, continue, active sensing, and system reset messages. These are single-byte messages with the highest priority and can be inserted between bytes of other messages.

## 8.3 MIDI Channels, Ports, and Connections

The original MIDI hardware specification uses a **5-pin DIN connector** with three types of ports:

- **MIDI Out**: transmits MIDI data generated by the device.
- **MIDI In**: receives MIDI data from another device.
- **MIDI Thru**: passes an exact copy of the data received at MIDI In to another device in a daisy chain, allowing multiple instruments to be connected in series.

The electrical specification is a unidirectional, serial, asynchronous connection running at 31.25 kbaud (kilobits per second). A three-byte Note On message takes approximately 1 millisecond to transmit. In practice, this bandwidth is sufficient for most musical applications, though very dense data (such as multiple channels of continuous controller information simultaneously) can occasionally cause perceptible timing delays, sometimes called "MIDI choke."

In modern practice, MIDI is more commonly transmitted over **USB** (USB-MIDI class-compliant devices require no drivers on most operating systems) or over networks (using protocols such as RTP-MIDI, which Apple has implemented as a standard macOS feature, or MIDI over Bluetooth Low Energy, which enables wireless MIDI connections with low latency). The 5-pin DIN connector remains in use for hardware synthesizers and controllers but is increasingly supplemented or replaced by USB and wireless connections.

**General MIDI (GM)** is a supplementary specification (1991) that standardizes a minimum set of 128 instrument sounds (patches) in a defined order (piano in slot 1, strings in certain slots, etc.) and a standard drum map on channel 10. GM ensures that a MIDI file played on any GM-compatible device will produce a recognizable, if not identical, rendering of the intended arrangement.

## 8.4 MIDI Editing: Quantization, Velocity, and Controllers

Once MIDI data is recorded into a DAW, it can be edited with far greater flexibility than audio. MIDI editing typically takes place in one of several views:

- **Piano roll**: a grid where the horizontal axis represents time and the vertical axis represents pitch (with note names or MIDI note numbers along the side). Each note appears as a horizontal bar; its position indicates pitch and time, its length indicates duration, and its colour or brightness often indicates velocity. Controller data (mod wheel, pitch bend, etc.) is typically displayed as a lane of vertical bars or a continuous curve below the piano roll.
- **Event list**: a spreadsheet-like view showing every MIDI event with its exact parameters (type, channel, note number, velocity, timestamp). Useful for surgical precision editing and debugging.
- **Drum editor**: a specialized piano roll where each row corresponds to a drum sound (kick, snare, hi-hat, etc.) rather than a musical pitch, with cells that can be toggled on or off for step-sequencing.
- **Score editor**: traditional music notation generated from MIDI data, useful for composers who think in conventional notation.

<div class="definition">
<strong>Quantization</strong> is the process of adjusting the timing of MIDI notes to align them with a rhythmic grid (for example, sixteenth notes or eighth-note triplets). It corrects timing inaccuracies in a recorded performance, making it tighter and more metronomically precise.
</div>

Quantization parameters include:

- **Grid resolution**: the note value to which notes are snapped (quarter notes, eighth notes, sixteenth notes, triplets, etc.).
- **Strength (percentage)**: 100% snaps notes exactly to the grid; lower values move notes partway toward the grid, preserving some of the original timing feel. A setting of 50% moves each note halfway to the nearest grid line.
- **Swing**: offsets alternate grid positions to create a shuffle or swing feel. Typically expressed as a percentage where 50% is straight and higher values push the off-beat notes later.
- **Window (sensitivity)**: only notes within a specified distance from a grid line are affected, leaving correctly placed notes untouched and only correcting significant errors.

Over-quantization can make a performance sound mechanical, rigid, and lifeless. Experienced producers often use partial quantization (60 to 80 percent strength) or manually adjust individual notes to maintain the subtle timing variations (sometimes called "feel" or "groove") that give a performance its human character. Some DAWs allow extracting a groove template from an existing performance and applying it to other MIDI data, transferring the timing feel of one musician to another part.

Velocity editing allows the producer to reshape the dynamics of a MIDI performance after recording. A velocity curve can be applied to scale, compress, or expand all velocities, or individual notes can be adjusted. This is particularly important for drum programming, where velocity variations contribute significantly to the realism and groove of the pattern, and for sampled instruments, where velocity typically switches between different sample layers.

## 8.5 MIDI 2.0 and the Future of MIDI

**MIDI 2.0**, ratified in January 2020 by the MIDI Manufacturers Association and the Association of Musical Electronics Industry, is the first major update to the MIDI specification since 1983. It is designed to be backward-compatible with MIDI 1.0 while adding significant new capabilities:

- **Higher resolution**: 32-bit values for velocity, controllers, and pitch bend (compared to 7-bit or 14-bit in MIDI 1.0), enabling much finer gradations of expression. A 32-bit velocity value provides over 4 billion levels versus the 127 levels of MIDI 1.0.
- **Per-note control**: controllers and pitch bend can be applied to individual notes rather than entire channels, enabling true polyphonic expression directly within the protocol.
- **Profile Configuration**: devices can declare their capabilities and intended use (e.g., "I am a piano" or "I am a drawbar organ"), and a controller can automatically configure itself to work with them, reducing setup complexity.
- **Property Exchange**: allows devices to query and set properties (patch names, parameter lists, configuration data) using JSON-based messages, making complex device management possible.
- **Bidirectional communication**: MIDI 2.0 devices negotiate capabilities in both directions using a "MIDI-CI" (Capability Inquiry) protocol, unlike the one-way communication of MIDI 1.0. This means that devices can automatically discover each other's capabilities and configure themselves accordingly.

**MIDI Polyphonic Expression (MPE)**, which predated MIDI 2.0 and was adopted as a standard extension to MIDI 1.0, assigns each note to its own MIDI channel (from a designated zone of channels), allowing per-note pitch bend, slide, and pressure data within the constraints of MIDI 1.0. This enabled expressive controllers such as the Roli Seaboard, Linnstrument, and Sensel Morph to transmit nuanced, multi-dimensional performance data. With MIDI 2.0's native per-note control, the need for the MPE workaround is reduced, though MPE remains important for backward compatibility with existing instruments and software.

---

# Chapter 9: Synthesis

Sound synthesis is the generation of audio signals using electronic or digital means. From the earliest oscillators to modern software instruments, synthesis has provided musicians with an unlimited palette of sounds that no acoustic instrument could produce. This chapter surveys the major synthesis techniques and their historical context.

## 9.1 Subtractive Synthesis

<div class="definition">
<strong>Subtractive synthesis</strong> begins with a harmonically rich waveform (such as a sawtooth or pulse wave) generated by an oscillator, then shapes the sound by removing (subtracting) frequencies using filters and controlling amplitude over time with an envelope generator.
</div>

This is the synthesis method most associated with the classic analog synthesizers of the 1960s and 1970s (Moog, ARP, Buchla, Roland, Sequential Circuits). The signal flow of a basic subtractive synthesizer is:

**Oscillator** (VCO in analog, DCO in digitally controlled analog) generates a raw waveform (sawtooth, pulse, square, triangle, noise) at the desired pitch. Multiple oscillators can be detuned slightly against each other to create a thicker, richer sound through beating and chorus effects. Many synthesizers also offer oscillator synchronization (hard sync), where one oscillator resets the phase of another, creating distinctive harsh, metallic timbres.

**Filter** (VCF) removes frequencies above (low-pass), below (high-pass), or around (band-pass, notch) a cutoff frequency. The low-pass filter is by far the most common in subtractive synthesis and is arguably the most important element in shaping the character of the sound. Different filter designs (Moog ladder, Korg MS-20, Oberheim SEM, Roland IR3109) each have a distinctive sonic character that defines the personality of the instruments they appear in. The filter's **resonance** (or Q) parameter boosts frequencies near the cutoff, creating a characteristic peak. At high resonance, many filters self-oscillate, producing a sine tone at the cutoff frequency that can be pitched and used as an additional oscillator. The filter cutoff is typically modulated by an envelope and/or LFO, creating the dynamic timbral changes that give synthesized sounds their expressiveness.

**Amplifier** (VCA) controls the overall volume, shaped by the **amplitude envelope**. The most common envelope shape is the **ADSR** (Attack, Decay, Sustain, Release):

| Stage | Description |
|---|---|
| Attack | Time from note-on to peak amplitude |
| Decay | Time from peak to sustain level |
| Sustain | Level maintained while key is held (this is a level, not a time value) |
| Release | Time from key release to silence |

<div class="example">
<strong>Classic subtractive patch</strong>: A sawtooth oscillator provides the raw harmonic content. A low-pass filter with moderate resonance sweeps the cutoff frequency downward using a medium-attack, medium-decay envelope, creating a "wah"-like opening effect. The amplitude envelope has a fast attack, short decay, moderate sustain, and medium release, giving the sound a percussive onset that settles into a sustained tone. This is the signature architecture behind countless analog synthesizer leads and basses, from the Minimoog bass sounds of Parliament-Funkadelic to the screaming leads of Jan Hammer.
</div>

**Modulation** adds life and movement to synthesized sounds. Common modulation sources include LFOs (low-frequency oscillators, typically running at sub-audio rates from 0.1 to 20 Hz, used for vibrato, tremolo, and filter sweeps), additional envelopes, velocity (how hard the key is pressed), aftertouch (pressure applied after the initial strike), and mod wheel position. The modulation matrix, a feature of many modern synthesizers, allows any modulation source to be routed to any destination parameter with adjustable depth.

## 9.2 Additive Synthesis

<div class="definition">
<strong>Additive synthesis</strong> builds complex sounds by combining multiple sine waves (partials), each with independently controllable frequency, amplitude, and phase. It is the direct application of Fourier's theorem, which states that any periodic waveform can be represented as a sum of sinusoidal components.
</div>

In theory, additive synthesis offers complete control over timbre: any sound can be constructed by specifying the right combination of sine waves. In practice, it requires a large number of independently controlled oscillators (often hundreds) to produce convincing timbral variations, which historically made it computationally expensive and difficult to program intuitively. Early hardware implementations included the Fairlight CMI (1979) and the Kawai K5 (1987).

The Hammond organ, with its drawbar-based harmonic mixing, can be considered a form of additive synthesis, albeit limited to nine harmonically-related partials with fixed frequency ratios.

Modern computing power has made additive synthesis more practical. Software instruments such as Razor (Native Instruments) and Loom (AIR Music Technology) offer sophisticated additive synthesis with real-time control over hundreds of partials. Additive synthesis is also used in **analysis-resynthesis** systems, where a recorded sound is analysed into its component partials (using techniques such as the Short-Time Fourier Transform or sinusoidal modeling) and then resynthesized with modifications (changing pitch independently of time, morphing between sounds, selectively editing individual partials, or applying transformations that would be impossible with other synthesis methods).

## 9.3 Frequency Modulation (FM) Synthesis

<div class="definition">
<strong>FM synthesis</strong> generates complex timbres by using one oscillator (the <strong>modulator</strong>) to modulate the instantaneous frequency of another oscillator (the <strong>carrier</strong>). When the modulation frequency is in the audio range (above about 20 Hz), new frequency components (sidebands) are created, producing rich and often metallic or bell-like timbres from very simple components.
</div>

FM synthesis was discovered as a musical technique by **John Chowning** at Stanford University in the late 1960s (published 1973) and licensed to Yamaha, which used it as the basis for the enormously successful **DX7** synthesizer (1983). The DX7 used six sine-wave oscillators (called "operators") that could be arranged in 32 different configurations (called "algorithms"), with each operator functioning as either a carrier (producing audible output) or a modulator (modifying the frequency of another operator).

The relationship between the carrier frequency (fc) and modulator frequency (fm) determines the harmonic content:

- When fm/fc is a simple integer ratio (1:1, 2:1, 3:1, etc.), the sidebands fall on harmonic frequencies, producing tonal sounds resembling traditional instruments.
- When fm/fc is not a simple integer ratio (e.g., 1:1.414 or 1:2.76), the sidebands are inharmonic, producing bell-like, metallic, or clangorous sounds characteristic of idiophones (bells, gongs, metallophones).

The **modulation index** (the ratio of the modulator's peak frequency deviation to the modulator's frequency) controls the brightness and complexity of the sound: higher modulation indices produce more and stronger sidebands, creating brighter and more complex timbres. The number of significant sideband pairs is approximately equal to the modulation index plus one.

FM synthesis can produce an extraordinarily wide range of timbres, from electric pianos and vibraphones (the DX7 electric piano patch became one of the most recognizable sounds of the 1980s) to brass, bells, and complex evolving textures. However, it is notoriously difficult to program intuitively, as small parameter changes can produce dramatic and unpredictable timbral shifts. The relationship between modulation index and perceived brightness, for example, is not linear, and the interaction of multiple operators can be difficult to predict without experience.

## 9.4 Wavetable, Granular, and Physical Modeling Synthesis

**Wavetable synthesis** stores a series of single-cycle waveforms in a table and allows the player to scan through them, either manually or under modulation control. As the read position moves through the table, the waveform (and thus the timbre) changes continuously, creating timbral evolution that is difficult to achieve with other synthesis methods. The PPG Wave (1981, designed by Wolfgang Palm) and Waldorf instruments popularized this approach. Modern software implementations (Serum by Xfer Records, Vital by Matt Tytel, and Native Instruments Massive X) allow users to import, draw, or generate custom wavetables from any audio source and morph between them with modulation, making wavetable synthesis one of the most popular and versatile methods in contemporary electronic music production.

<div class="definition">
<strong>Granular synthesis</strong> breaks a sound into tiny fragments called <strong>grains</strong> (typically 1 to 100 milliseconds long), which are then reassembled, overlapped, scattered, and layered to create new textures. By varying the grain size, density, pitch, playback position, randomization, and spatial distribution, granular synthesis can produce effects ranging from smooth time-stretching and pitch-shifting to dense, swirling clouds of sound that bear little resemblance to the original source.
</div>

Granular synthesis was theorized by physicist Dennis Gabor in 1947 (in his paper on acoustic quanta) and developed as a musical technique by Iannis Xenakis (who proposed "clouds of sound" composed of many tiny sonic events) and Curtis Roads (who implemented the first computer-based granular synthesis programs in the 1970s and 1980s). It is used both as a real-time performance technique and as a sound design tool. Software implementations include Granulator II (Robert Henke / Ableton), Quanta (Audio Damage), Emission Control 2 (open-source, from UCSB), and Output Portal.

**Physical modeling synthesis** uses mathematical models of acoustic instruments and physical systems (the vibrating string, the resonating tube, the struck membrane, the bowed surface) to generate sound. Rather than storing or generating waveforms directly, physical modeling computes the behaviour of virtual mechanical and acoustic systems in real time using techniques such as digital waveguides, finite element methods, and modal synthesis.

The Yamaha VL1 (1994) was an early commercial physical modeling synthesizer. The Karplus-Strong algorithm (1983), which uses a short delay line with filtered feedback to simulate plucked strings, is one of the simplest and most elegant physical models. The Stanford CCRMA Synthesis Toolkit (STK) and the Faust programming language provide open research platforms for physical modeling. Applied Acoustics Systems' Chromaphone and Collision, and Modartt's Pianoteq (a physically modeled piano that uses only about 50 megabytes of disk space compared to the tens of gigabytes required by sample-based piano libraries) are notable commercial implementations.

Physical modeling excels at reproducing the subtle, dynamic behaviour of acoustic instruments (the way a plucked string interacts with the body of a guitar, the nonlinear buzzing of a brass player's embouchure, the gradual sympathetic resonance buildup in a piano) and can be controlled expressively because the model responds naturally to changes in input parameters (bowing pressure, breath pressure, lip tension, plucking position).

## 9.5 Sampling and Sample-Based Instruments

<div class="definition">
<strong>Sampling</strong> (as a synthesis technique) uses recordings of real sounds as the basis for playback. A <strong>sampler</strong> maps recorded audio files across a keyboard or controller, transposing them in pitch and triggering them in response to MIDI input.
</div>

The Fairlight CMI (1979, designed by Peter Vogel and Kim Ryrie in Australia) and the E-mu Emulator (1981) were early commercial samplers, initially costing tens of thousands of dollars and limited to a few seconds of recording time. The Akai MPC series (beginning with the MPC60 in 1988, designed by Roger Linn) became legendary for hip-hop and electronic music production, combining sampling with drum-pad-based sequencing and swing quantization that defined the rhythmic feel of an era. The Akai S-series (S900, S1000, S3000) and the E-mu SP-1200 were other landmark hardware samplers.

Modern software samplers such as Native Instruments Kontakt, Spectrasonics Omnisphere (which combines deep sampling with various synthesis methods), Apple's Sampler (successor to the EXS24), and the open-source SFZ format provide vast libraries of multi-sampled instruments. A well-constructed sample library captures an instrument at multiple dynamic levels (**velocity layers**, so that the timbre changes realistically with playing intensity), with multiple variations for each note (**round-robins**, so that repeated notes do not sound identical), and often with different articulations (sustain, staccato, pizzicato, tremolo, harmonics, and many others). This multisampling approach, combined with sophisticated scripting for expression mapping and performance logic, produces highly realistic virtual instruments that respond convincingly to MIDI input.

Sampling also encompasses the creative use of recorded material as raw source material: chopping, rearranging, pitching, reversing, layering, and processing samples from records, field recordings, foley, or other sources. This practice has been central to genres including hip-hop (where producers like J Dilla, DJ Premier, Madlib, and Kanye West built entire aesthetics around the art of sampling), electronic dance music (where breakbeats, vocal stabs, and synthesizer loops are staple material), and experimental music since the 1980s.

---

# Chapter 10: Sequencing and Arrangement

Sequencing is the process of recording, editing, and playing back a series of musical events (notes, controller changes, automation data) in a defined temporal order. Combined with arrangement (the structuring of musical sections into a complete piece), sequencing is the core creative workflow in modern music production.

## 10.1 Tempo, Time Signatures, and the Grid

All sequencing begins with a temporal framework. In most DAWs, this framework is defined by a **tempo** (measured in beats per minute, or BPM) and a **time signature** (such as 4/4, 3/4, 6/8, or 7/8). The tempo determines the speed at which the grid moves, and the time signature determines how the grid is grouped into bars and beats.

The **grid** is the fundamental organizational tool of a sequencer. Notes and events snap to grid lines based on the selected resolution (quarter notes, eighth notes, sixteenth notes, triplets, etc.). Working with the grid provides rhythmic precision and visual clarity but can also impose rigidity; skilled producers learn when to work strictly on the grid and when to deviate from it for musical expression and human feel.

**Tempo automation** (also called tempo mapping) allows the tempo to change over the course of a piece. This is essential for music that accelerates or decelerates (rubato, ritardando, accelerando), for matching a click track to a freely performed recording (a process called "beat mapping"), and for film scoring, where the music must align with visual events that may not fall on regular beat boundaries.

**Time-stretching** (discussed in Chapter 6) allows audio loops and recordings to conform to the session's tempo in real time, making it possible to combine material recorded at different tempos into a cohesive arrangement. Most modern DAWs can automatically time-stretch audio clips when the session tempo changes.

## 10.2 Loops and Beat-Making

A **loop** is a repeating segment of audio or MIDI, typically one, two, four, or eight bars long. Loops are a foundational element of many genres, including electronic dance music, hip-hop, pop, and film scoring.

Loop-based production involves layering multiple loops (drums, bass, chords, melodies, atmospheric textures, effects) to build a textured arrangement. The process often begins with a drum pattern, which establishes the groove and tempo, and adds melodic and harmonic elements progressively.

**Beat-making** typically involves programming drum patterns using MIDI (either step-sequenced on a grid, where each step can be toggled on or off, or performed in real time on pads such as those of the Akai MPC, Native Instruments Maschine, or Ableton Push) and layering them with sampled or synthesized bass, melodic, and textural elements. Common drum pattern structures in popular electronic genres include:

- **Four-on-the-floor**: kick drum on every quarter note, hi-hat on eighth or sixteenth notes, snare on beats 2 and 4. Characteristic of house, techno, disco, and much pop music.
- **Breakbeat**: syncopated kick and snare patterns with irregular placement, often derived from or inspired by sampled funk and soul drum breaks (the "Amen break" from the Winstons, the "Funky Drummer" break from James Brown, the "Think" break from Lyn Collins). Characteristic of drum and bass, breakbeat, jungle, and hip-hop.
- **Half-time**: snare on beat 3 rather than beats 2 and 4, creating a slower, heavier feel at the same tempo. Common in trap, some dubstep subgenres, and certain hip-hop styles.

**Swing** (or shuffle) displaces every other grid division slightly late, creating a lilting, groovy feel. The amount of swing is adjustable from 50 percent (straight, no swing) to around 66 to 67 percent (triplet feel). Classic drum machines such as the Roland TR-808 and TR-909 and the Linn LM-1 each had a distinctive swing implementation and overall timing feel that became characteristic of the genres they helped define. Roger Linn's MPC swing quantization, in particular, became famous for the laid-back, humanized grooves it produced.

## 10.3 Arrangement Structure

**Arrangement** is the organization of musical elements over time to create a complete piece. While arrangement practices vary enormously across genres, common structural elements include:

- **Intro**: establishes the mood, key, and tempo; may introduce elements gradually to build anticipation.
- **Verse**: the main narrative section in song-based music; typically less dense and intense than the chorus.
- **Pre-chorus**: a transitional section that builds energy and harmonic tension leading into the chorus.
- **Chorus (or Hook)**: the most memorable, energetic section; often features the fullest instrumentation and the central melodic idea.
- **Bridge**: a contrasting section (different chord progression, melody, or texture) that provides variety before a final chorus or outro.
- **Breakdown**: a section where elements are removed, creating space and tension before a build-up. Central to electronic dance music structure.
- **Build-up (or Riser)**: a section of increasing energy (rising pitch, accelerating rhythms, added layers, filtering, percussion rolls) leading to a drop.
- **Drop**: the moment of maximum impact, where the full beat and bass return after a build-up. This structure is central to electronic dance music but has influenced pop, hip-hop, and other genres.
- **Outro**: the closing section; may fade out, end decisively, or mirror the intro.

In DAW-based production, arrangement is typically performed by duplicating, moving, and editing regions on the timeline. Ableton Live's Session View provides an alternative approach: clips are triggered freely in a grid of slots, allowing improvised arrangement that can later be captured to the linear Arrangement View. This workflow blurs the line between composition, arrangement, and performance.

## 10.4 Coordinating Audio and MIDI

Most modern productions combine audio recordings (vocals, acoustic instruments, sampled loops, field recordings) with MIDI-driven virtual instruments. Keeping these elements synchronized and musically coherent requires attention to several factors:

**Latency compensation**: DAWs automatically compensate for the processing delay introduced by plugins, ensuring that audio and MIDI tracks remain aligned. This is called **plugin delay compensation** (PDC). However, very high-latency plugins (some linear-phase EQs, look-ahead limiters, or convolution reverbs) may introduce enough delay that manual adjustments or track delay offsets are needed.

**Audio-to-MIDI conversion**: some DAWs and plugins can analyse an audio recording and extract MIDI note data from it. This is useful for transcribing a recorded melody into editable MIDI, converting a drum recording into MIDI triggers for sample replacement or augmentation, or creating a MIDI representation of a bass line for editing. The accuracy of audio-to-MIDI conversion varies with the complexity of the source material; monophonic signals convert most reliably, while polyphonic material remains challenging.

**MIDI-to-audio rendering** (bouncing, freezing, or printing): converting a MIDI track's output to an audio file. This reduces CPU load (the virtual instrument no longer needs to run in real time during playback), frees up system resources, and allows audio-specific editing operations (time-stretching, crossfading, comping) to be applied. Most DAWs offer both "freeze" (temporary, reversible rendering that can be unfrozen to edit the MIDI data again) and "bounce in place" or "render" (permanent conversion to an audio file on a new track).

## 10.5 Music Notation Software

While most contemporary music production uses piano-roll and timeline-based editors, **music notation software** remains important for creating printed scores, parts, lead sheets, and educational materials. Major applications include **Dorico** (Steinberg, developed by the former Sibelius team), **Sibelius** (Avid), **MuseScore** (open-source, free), **Finale** (MakeMusic), and **LilyPond** (a text-based, open-source notation typesetter known for exceptionally high-quality output).

Notation software can import MIDI files from a DAW, though the results often require substantial manual cleanup (quantizing to a readable grid, choosing correct enharmonic spellings, adjusting beam groupings, splitting voices, and adding articulations, dynamics, and expression markings that are not captured in MIDI). Some DAWs include built-in score editors (Logic Pro's Score Editor, Cubase's Score Editor) that provide basic notation capabilities without leaving the production environment.

The **MusicXML** format (developed by Recordare and now maintained by the W3C Music Notation Community Group) is the most widely supported standard for exchanging notation data between different software applications. **MEI** (Music Encoding Initiative) serves scholarly and archival needs, while **LilyPond** uses its own text-based input format that is compiled into publication-quality scores.

---

# Chapter 11: Mixing and Mastering

Mixing and mastering are the final creative and technical stages of music production. Mixing combines individual tracks into a cohesive stereo (or surround) whole; mastering prepares the mix for distribution. Both require a combination of technical skill, critical listening, and artistic judgment.

## 11.1 The Art of Mixing: Objectives and Approach

The goal of mixing is to present all the elements of a production in a way that is clear, balanced, musical, and emotionally effective. A good mix serves the song: every element is audible when it needs to be, the emotional arc of the music is preserved and enhanced, and the overall sound translates well across a variety of playback systems (studio monitors, headphones, car stereos, laptop speakers, phone speakers, Bluetooth earbuds).

Mixing involves decisions in several interconnected domains:

- **Volume balance**: the relative levels of all tracks, which establishes the hierarchy of importance among the musical elements.
- **Frequency balance**: using EQ to ensure that each element occupies its own spectral space and that the overall tonal balance is appropriate for the genre.
- **Dynamics**: using compression, limiting, and automation to control the dynamic range of individual tracks and the overall mix.
- **Spatial placement**: using panning, reverb, and delay to create a sense of width, depth, and (in immersive formats) height.
- **Contrast and movement**: ensuring that the mix evolves over time, with changes in density, intensity, and spatial character to maintain interest and support the musical arrangement.

A common mixing workflow (though highly personal and genre-dependent) is:

1. **Rough static mix**: set initial levels and panning with no processing, listening for the overall balance and the relative importance of each element.
2. **Organization**: colour-code tracks, group related tracks onto submixes (drum bus, vocal bus, instrument bus), set up send effects (reverb, delay).
3. **Bottom-up or top-down approach**: some mixers begin with the most important element (often the vocal or the kick drum) and build the mix around it; others start by getting a broad balance of all elements and then refine individual tracks.
4. **Subtractive EQ**: remove problem frequencies (mud, boxiness, harshness, resonances) from individual tracks.
5. **Compression**: control dynamics on tracks that need it (vocals, bass, drums).
6. **Additive EQ**: enhance the character and presence of individual tracks.
7. **Spatial processing**: add reverb, delay, and other effects to create depth and ambience.
8. **Automation**: fine-tune levels, panning, effect sends, and plugin parameters over time to support the arrangement.
9. **Reference checks**: compare the mix to professional reference tracks in a similar genre, checking on multiple playback systems.

## 11.2 Using EQ in a Mix Context

EQ in mixing is fundamentally about ensuring that every element has its own space in the frequency spectrum and that the overall tonal balance is pleasing and appropriate. When two instruments occupy the same frequency range at the same time, they compete for the listener's attention and create a muddy, unclear mix. The practice of **spectral slotting** (or "frequency carving") involves using EQ to define distinct frequency niches for each element.

Common frequency ranges and their sonic characteristics:

| Range | Frequency | Character |
|---|---|---|
| Sub-bass | 20-60 Hz | Felt more than heard; kick drum and bass fundamentals; rumble |
| Bass | 60-250 Hz | Warmth and fullness; lower body of most instruments |
| Low midrange | 250-500 Hz | Can be "boxy" or "muddy" if excessive; body of vocals, guitars, snare |
| Midrange | 500 Hz - 2 kHz | Presence and body of most instruments; can be "nasal" or "honky" if overemphasized |
| Upper midrange | 2-4 kHz | Presence and clarity; attack of percussion; consonant clarity in vocals; can be fatiguing if excessive |
| Presence | 4-6 kHz | "Bite" and definition; sibilance begins; can be harsh or brittle |
| Brilliance | 6-10 kHz | Sibilance in vocals; shimmer in cymbals; clarity of acoustic guitar |
| Air | 10-20 kHz | Openness and sparkle; very high harmonics; "breathiness" |

A useful technique is the **frequency sweep**: boost a narrow band of EQ (high Q, +6 to +12 dB) dramatically and sweep it slowly across the frequency range while listening. Problem frequencies (resonances, harsh spots, low-frequency buildups) will become painfully obvious when the boosted band passes through them. Those frequencies can then be cut by a moderate amount (typically 2 to 6 dB) at the identified frequency.

The **high-pass filter** is one of the most important EQ tools in mixing. Applying a high-pass filter to every track that does not need low-frequency content (vocals, guitars, keyboards, overhead microphones, effects returns) removes accumulated low-frequency energy that would otherwise muddy the mix and compete with the bass and kick drum. This is sometimes called "cleaning up the low end."

## 11.3 Compression in the Mix

Compression serves several distinct purposes in mixing:

- **Evening out dynamics**: a vocalist whose level varies widely benefits from gentle compression (ratio 2:1 to 4:1, moderate attack and release, moderate threshold) that keeps them consistently present in the mix without obvious pumping or artifacts.
- **Controlling transients**: a fast attack on a compressor can tame the initial transient of a drum hit or picked guitar, making it sit back in the mix. A slow attack allows the transient through and compresses the sustain, adding punch and snap. The attack time setting is arguably the most important parameter for shaping the character of compression on percussive material.
- **Adding sustain and density**: heavy compression increases the average level of a signal relative to its peaks, making it sound "fatter," more present, and more sustained. This is used on bass, electric guitars, and vocals.
- **Gluing**: gentle bus compression (ratio 1.5:1 to 2:1, slow attack of 10 to 30 ms, auto or medium release) on the mix bus or submixes (drums, instruments) can make the elements feel like they belong together, a cohesive whole rather than a collection of separate tracks. The SSL G-Series bus compressor is the classic hardware reference for this application.

<div class="remark">
One of the most common mixing mistakes, particularly among beginners, is over-compression: applying too much compression to individual tracks, buses, and the mix bus, resulting in a lifeless, fatiguing, dynamically flat sound that lacks contrast and excitement. The solution is restraint: use compression only where it is needed, listen critically for the loss of natural dynamics and transient detail, and remember that dynamics are a musical element, not a problem to be eliminated.
</div>

## 11.4 The Stereo Field: Panning and Spatial Processing

The stereo field is the horizontal plane between the left and right speakers (or headphone drivers). Panning distributes elements across this field to create clarity, separation, and a sense of spatial width.

General panning conventions (which vary by genre and personal taste):

- **Centre**: lead vocal, bass, kick drum, snare drum (the "anchor" elements that form the foundation of the mix).
- **Near centre (slight left or right)**: rhythm guitars, keyboards, backing vocals, toms.
- **Wide left and right**: stereo synth pads, room microphones, hard-panned double-tracked guitars (a technique where the same part is performed twice and the two takes are panned to opposite sides, creating width through the natural timing and pitch differences between the performances).
- **Varied**: auxiliary percussion, effects, ear candy, incidental sounds.

The **LCR** (Left-Centre-Right) mixing approach, advocated by some engineers (and rooted in early stereo recording practices), restricts panning to only three positions: hard left, centre, and hard right. This creates a wide, open, and punchy stereo image with clear separation between elements. It can sound dramatic and bold but requires careful frequency management to avoid conflicts between elements sharing the same pan position.

**Depth** in the mix is created primarily by **reverb** (more reverb = further away from the listener), **level** (quieter = further away), and high-frequency roll-off (distant sounds lose high frequencies due to air absorption). Pre-delay on a reverb (a short delay before the onset of the reverb tail) can increase the perceived distance between the source and the reverberant space, creating clarity while maintaining a sense of depth. A mix with good depth creates the illusion of a three-dimensional space: some elements feel close and intimate (dry, loud, full-frequency), others feel at a moderate distance (moderate reverb, moderate level), and others occupy the far background (heavy reverb, lower level, high-frequency roll-off).

**Stereo widening** techniques include mid-side processing (boosting the side component relative to the mid), short stereo delays (Haas effect-based widening, where a very short delay is applied to one channel), and stereo imaging plugins. Care must be taken to check mono compatibility, as many widening techniques cancel or comb-filter when the stereo signal is summed to mono (as happens on many Bluetooth speakers, club sound systems, and older broadcast systems).

## 11.5 Mastering

<div class="definition">
<strong>Mastering</strong> is the final stage of audio post-production. It involves preparing the final stereo mix (or multichannel mix) for distribution by optimizing its overall tonal balance, dynamics, loudness, and stereo image, and by ensuring consistency across an album or EP.
</div>

Mastering serves several functions:

1. **Quality control**: identifying and correcting any remaining issues in the mix (excessive sibilance, low-end rumble, tonal imbalance, stereo problems, clicks, or noise).
2. **Enhancement**: subtle EQ, compression, saturation, and stereo widening to improve the overall sound and bring out the best qualities of the mix.
3. **Loudness optimization**: using limiting to increase the overall loudness to an appropriate level for the intended medium and genre, while preserving as much dynamic range as possible.
4. **Consistency**: ensuring that all tracks on an album have a consistent tonal balance, volume, and character, so that the listening experience is cohesive from track to track.
5. **Format preparation**: encoding to the correct specifications (sample rate, bit depth, loudness targets, metadata) for the delivery medium (CD, streaming, vinyl, broadcast).

A typical mastering signal chain might include:

1. Linear-phase or high-quality minimum-phase EQ for broad tonal adjustments
2. Multiband compression or dynamic EQ for frequency-dependent dynamics control
3. Stereo bus compression for glue and cohesion
4. Stereo imaging adjustment (mid-side EQ or processing)
5. Harmonic saturation or excitation (optional, for warmth or presence)
6. Brickwall limiter to set the final peak level and maximize loudness
7. Dithering (if reducing bit depth, e.g., from 24-bit to 16-bit for CD)

**Loudness standards** have become increasingly important in the streaming era. The historical "loudness war" (a trend from the mid-1990s through the 2010s where mastering engineers competed to make releases as loud as possible, often sacrificing dynamic range and introducing audible distortion) has been partially mitigated by the adoption of **loudness normalization** by streaming platforms. These platforms measure the integrated loudness of each track and adjust playback level so that all tracks play at approximately the same perceived loudness, regardless of how loud they were mastered:

| Platform | Target Loudness | Measurement |
|---|---|---|
| Spotify | -14 LUFS | Integrated loudness (ITU-R BS.1770) |
| Apple Music | -16 LUFS | Integrated loudness |
| YouTube | -14 LUFS | Integrated loudness |
| Tidal | -14 LUFS | Integrated loudness |
| Amazon Music | -14 LUFS | Integrated loudness |
| CD (no normalization) | Varies; often -8 to -14 LUFS | Depends on genre and era |

**LUFS** (Loudness Units relative to Full Scale) is a measurement standard defined by ITU-R BS.1770 and EBU R128 that accounts for the frequency sensitivity of human hearing (using a K-weighting curve) and measures loudness over time (integrated, short-term, and momentary). Because streaming platforms turn down overly loud masters to match their target, there is now less incentive to sacrifice dynamic range for sheer loudness. A track mastered to -14 LUFS with good dynamics will often sound better on Spotify than a track mastered to -8 LUFS that has been crushed by limiting, because the latter will be turned down by 6 dB and will sound flat and lifeless at the reduced playback level.

---

# Chapter 12: New Interfaces and the Future

Music technology has always been shaped by the interfaces between the human performer and the sound-producing system. From the piano keyboard to the touchscreen, each new interface enables different kinds of musical expression and creativity. This chapter examines alternative performance interfaces, emerging technologies, and the future directions of music technology.

## 12.1 Alternative Controllers and Expressive Interfaces

The traditional MIDI keyboard, while ubiquitous and deeply integrated into music production workflows, offers limited expressive dimensions: discrete note on/off, velocity, and (on some keyboards) monophonic or polyphonic aftertouch. A growing family of alternative controllers seeks to capture richer gestural information and enable new modes of musical expression.

**Multi-dimensional controllers** extend the keyboard paradigm:

- The **Roli Seaboard** replaces piano keys with a continuous, pressure-sensitive silicone surface that captures five dimensions of touch (strike, press, glide, slide, and lift), transmitted via MPE. This allows continuous pitch bends between notes, per-note vibrato, and pressure-responsive timbral changes.
- The **Linnstrument** (designed by Roger Linn, creator of the LM-1 and MPC) is an isomorphic grid of pressure-sensitive pads with MPE support, offering continuous control of pitch, pressure, and vertical position per note on a surface that can be tuned to any musical interval.
- The **Sensel Morph** is a thin, reconfigurable pressure-sensitive surface that supports various overlays (piano keys, drum pads, production grid, etc.) and provides high-resolution multi-touch sensing.
- The **Haken Continuum Fingerboard** is a continuous polyphonic controller with extremely high resolution in three dimensions (x, y, z per finger), designed for demanding virtuoso performance.

**Wind controllers** such as the Akai EWI (Electronic Wind Instrument) and the Yamaha WX series capture breath pressure, bite pressure, and fingering, translating the gestures of woodwind playing into MIDI data for controlling synthesizers. These instruments allow wind players to access the full range of electronic sounds while using familiar embouchure and fingering techniques.

**Electronic string instruments** such as MIDI guitar systems (Fishman TriplePlay, Roland GK pickups with guitar synthesizers, and newer polyphonic pickup systems) and the ROLI Blocks attempt to translate the nuanced gestures of string playing into MIDI. Latency and tracking accuracy remain challenges for MIDI guitar, particularly for low strings and complex chords, though technology continues to improve.

**Drum controllers** range from traditional pad-based controllers (Akai MPC series, Roland SPD-SX sample pad) to innovative designs such as the Keith McMillen BopPad (a single pad with continuous position and pressure sensing), the Sunhouse Sensory Percussion (acoustic drum triggers with machine-learning-based hit classification that can distinguish between different playing zones and techniques on a single drum), and the Ableton Push (a grid controller with velocity- and pressure-sensitive pads designed for deep integration with Ableton Live).

## 12.2 Motion Sensing and Gestural Interfaces

Beyond touch-based controllers, motion sensing allows performers to control sound through body movement in three-dimensional space:

- **Accelerometers and gyroscopes**: embedded in devices such as smartphones, wearables, and custom controllers. The **Mi.Mu Gloves** (developed by a team including Imogen Heap) are sensor-equipped gloves that capture hand position, finger bend, and gesture to control musical parameters through user-defined mappings. Tilting, shaking, and rotating gestures map to musical parameters such as pitch, filter cutoff, and volume.
- **Camera-based tracking**: systems such as the Leap Motion controller (which tracks hand and finger position using infrared cameras), depth cameras, and custom computer-vision setups track hand and body position in three-dimensional space. The Theremin can be seen as a historical precursor, using electromagnetic fields rather than cameras to sense hand position.
- **Electromyography (EMG)** and other biosignal sensors detect muscle tension, brain activity (EEG), galvanic skin response, or heart rate and translate them into musical control signals. These approaches remain largely experimental but have been explored in academic research, therapeutic music-making, and performance art contexts.

The challenge with gestural interfaces is designing meaningful **mappings** between physical gestures and sonic parameters. A gesture that feels natural and expressive to the performer may not produce musically coherent results unless the mapping is carefully designed, with appropriate scaling, response curves, and feedback. The field of **New Interfaces for Musical Expression (NIME)**, with its annual conference established in 2001, is dedicated to researching these questions of mapping, interaction design, and musical expressivity.

## 12.3 Live Coding and Algorithmic Performance

**Live coding** is the practice of writing and modifying computer code in real time as a form of musical performance. The code is typically projected onto a screen visible to the audience, making the creative process transparent and the act of programming itself a performative gesture.

Key live coding environments include:

- **SuperCollider**: a powerful, open-source language and environment for audio synthesis and algorithmic composition, developed originally by James McCartney in 1996. Its server-client architecture allows flexible real-time sound generation and processing.
- **Sonic Pi**: designed by Sam Aaron at the University of Cambridge, Sonic Pi is an accessible live coding tool originally created for music education in schools but widely adopted by performers. It emphasizes simplicity, live loops, and time-based sequencing.
- **TidalCycles**: a domain-specific language embedded in Haskell, created by Alex McLean, that excels at pattern-based music and polyrhythmic structures. It interfaces with SuperCollider for sound generation.
- **ChucK**: a strongly-timed, concurrent programming language for real-time sound synthesis and music, created by Ge Wang at Princeton (later Stanford CCRMA). Its unique approach to time management makes it well-suited for precise temporal control.
- **Foxdot**: a Python-based live coding environment that interfaces with SuperCollider, providing Python's accessibility for live performance.
- **Strudel**: a JavaScript port of TidalCycles that runs in the web browser, making live coding accessible without installing any software.

The **TOPLAP** (Temporary Organisation for the Promotion of Live Algorithm Programming) collective and manifesto, and the **Algorave** movement (algorithmically generated dance music performed live, coined by Alex McLean and Nick Collins), have brought live coding into club and festival contexts around the world. Live coding represents a fundamentally different relationship between performer and music: the performer writes and modifies instructions that generate music, rather than directly producing sounds through physical gesture. The audience witnesses the creative process in real time, and the code itself becomes a visible, meaningful element of the performance.

## 12.4 Artificial Intelligence and Machine Learning in Music

Machine learning is increasingly integrated into music production tools and creative workflows, with implications that range from practical utility to profound questions about creativity and authorship.

**Assistive production tools**: AI-powered plugins assist with mixing (iZotope Neutron's Track Assistant analyses a mix and suggests EQ and compression settings; iZotope Ozone provides intelligent mastering assistance), stem separation (iZotope RX, Meta's Demucs, and Lalal.ai use deep neural networks to separate a mixed recording into individual stems such as vocals, drums, bass, and other), and noise reduction. These tools use trained neural networks to make decisions that previously required expert human judgment, making professional-quality processing more accessible.

**Generative music**: systems that create musical material autonomously or in collaboration with human musicians. Google's Magenta project has explored recurrent neural networks and transformer architectures for melody generation, accompaniment, and style transfer. OpenAI's Jukebox (2020) demonstrated raw audio generation in the style of specific artists. More recent systems have used large-scale generative models to produce musical passages from text descriptions, raising significant questions about copyright (are the training data creators compensated?), attribution (who is the author of AI-generated music?), and the nature of musical creativity itself.

**Performance analysis and feedback**: machine learning tools can analyse a student's performance, identify technical errors (intonation, rhythm, tone quality), and provide targeted practice recommendations. Applications in music education include automated accompaniment systems that follow a soloist's tempo and expression.

**Sound design**: neural audio synthesis approaches such as Google Magenta's DDSP (Differentiable Digital Signal Processing) use neural networks to control the parameters of traditional DSP algorithms (oscillators, filters, reverb), enabling intuitive timbre manipulation that bridges the gap between recorded sound and synthesis. DDSP can, for example, convert a voice recording into a violin sound in real time by extracting pitch and loudness from the voice and using them to drive a trained synthesis model.

The integration of AI into music production raises important aesthetic, ethical, and legal questions that the field is actively grappling with. How should AI-generated content be labelled? What rights do the creators of training data hold? Does the availability of AI tools diminish or enhance human creativity? How do we evaluate the musical value of AI-assisted work? These questions do not have settled answers, but engaging with them is essential for any musician working in the contemporary technological landscape.

## 12.5 Spatial Audio and Immersive Formats

The future of music reproduction is increasingly spatial. While stereo has been the dominant consumer format for over six decades, several immersive formats are gaining significant traction in both production and consumer markets.

**Surround sound** (5.1, 7.1) has been standard in cinema since the early 1990s (Dolby Digital, DTS) and is used in some music releases, particularly classical, film scores, and progressive rock remixes. The additional channels (centre, surround left/right, low-frequency effects, and in 7.1, rear surround left/right) allow sounds to be placed around the listener.

<div class="definition">
<strong>Ambisonics</strong> is a full-sphere surround sound technique that captures or creates a complete three-dimensional sound field. Unlike channel-based formats (which assign sounds to specific speakers), Ambisonics encodes the sound field in a speaker-independent format that can be decoded for any speaker arrangement, including headphones via binaural rendering.
</div>

First-order Ambisonics uses four channels (W, X, Y, Z, corresponding to an omnidirectional component and three figure-8 components along the three spatial axes) to capture the sound field at a single point in space. Higher-order Ambisonics (HOA) uses more channels (9 for second order, 16 for third order, and so on) for increased spatial resolution and a larger "sweet spot." Ambisonics is widely used in virtual reality (VR) audio, 360-degree video, and immersive installations, and is supported by platforms such as YouTube for 360-degree video soundtracks.

**Dolby Atmos** is an object-based audio format that represents sounds as individual objects with associated position metadata (three-dimensional coordinates, size, movement), rather than assigning them to fixed channels. A renderer in the playback system positions these objects in three-dimensional space based on the listener's specific speaker configuration or headphone HRTF profile. Dolby Atmos has been adopted for cinema (since 2012), home theatre, headphones (using binaural rendering), and increasingly for music production and distribution. Apple Music's support for Dolby Atmos spatial audio (since 2021) has brought immersive music to a mainstream consumer audience.

**Binaural audio** uses headphones to create a three-dimensional listening experience by applying HRTFs (Head-Related Transfer Functions) to the audio. Each sound is filtered to simulate the way it would be modified by the listener's head, pinnae, and torso if it were arriving from a specific direction. Personalized HRTFs (measured for the individual listener using photographs of their ears or in-ear measurements) improve the accuracy of binaural rendering, and companies like Apple are implementing this technology in consumer products. Binaural rendering is the primary method for delivering spatial audio over headphones, which is how the majority of consumers experience Dolby Atmos music.

**Wave Field Synthesis (WFS)** uses large arrays of closely spaced loudspeakers (sometimes hundreds or thousands) to physically reconstruct the wavefront of a sound source at any point in the listening area. Unlike stereo or surround, which create phantom images between speakers, WFS creates actual wavefronts that all listeners in the space perceive correctly regardless of their position. WFS systems are rare due to the large number of speakers required, but installations exist in research institutions (Technical University of Berlin), concert venues (the 832-speaker system at the House of Music in Aalborg, Denmark), and experimental spaces.

The movement toward immersive audio represents a fundamental shift in how music is created, distributed, and consumed. Producers working in spatial formats must consider not just left-right placement but full three-dimensional positioning, movement of sounds through space, the listener's potential head rotation (in VR and headphone contexts), and the vast differences between playback systems (from a full Atmos speaker setup to a single pair of earbuds with binaural rendering). New creative possibilities emerge: a melody that orbits the listener, bass that rises from below, ambient textures that envelop from all directions, and spatial movement that reinforces musical structure.

As technology continues to evolve, the boundaries between performer, composer, instrument, and listener continue to blur and shift. The tools covered in this course, from fundamental acoustics and psychoacoustics to recording, editing, synthesis, mixing, and new interfaces, provide the conceptual and practical foundation for understanding and participating in this ongoing transformation. The most durable lesson is not mastery of any particular software or hardware, but the development of deep listening skills, clear technical understanding, and a thoughtful relationship between artistic intention and technological capability.

---
