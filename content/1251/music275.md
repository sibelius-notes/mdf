---
title: "MUSIC 275: Music & Technology"
prof: "Cam McKittrick"
subjects: "MUSIC"
---

## Sources and References
**Primary textbook** - Course materials on digital audio, audio editing, and MIDI; standard reference knowledge from contemporary digital music practice.
**Supplementary texts** - Curtis Roads, *The Computer Music Tutorial*; David Miles Huber and Robert E. Runstein, *Modern Recording Techniques*; Alex Case, *Mix Smart*.
**Online resources** - The MIDI Association; Stanford CCRMA educational materials; Ableton learning resources; public university music technology course pages.

# Chapter 1: Beginning with Sound Instead of Software

## 1.1 What the Course Is Actually About

Students often enter music technology expecting a software course. They expect to learn what buttons to press, how to route tracks, where to find effects, and how to export a finished project. Those skills matter, but they are not the real subject. The real subject is how sound becomes something we can shape intentionally.

That is why a good music technology course begins before the DAW. It begins with listening. If a student does not understand what frequency does, what timbre is, how rooms color sound, or why certain sounds mask others, then plugins become a kind of superstition. The student is doing things, but not hearing why they matter.

## 1.2 The Basic Physics of Sound

Sound is vibration moving through a medium, usually air. That vibration reaches the ear, where it is transformed into neural information that the brain interprets as pitch, loudness, timbre, and spatial location.

Three basic concepts organize almost everything that follows:

1. **Frequency** shapes perceived pitch.
2. **Amplitude** shapes perceived loudness.
3. **Spectrum** shapes timbre.

This may sound elementary, but it is already enough to explain a huge amount of practical work in the studio. When a mix is muddy, that often means spectral crowding. When a recorded sound lacks impact, one may be dealing with envelope shape as much as level. When one source overwhelms another, frequency masking may be the problem rather than performance quality.

## 1.3 Psychoacoustics

Human hearing is not passive measurement. The ear-brain system interprets. We hear some frequencies more strongly than others. We can perceive a missing fundamental through its overtone structure. We group sounds into streams by timing and timbre. We can hear the same measured level as louder or softer depending on spectral content.

That means music technology always sits at the intersection of acoustics and **psychoacoustics**. A waveform and a spectrum analyzer can tell us something important, but they do not replace listening. The point of technical knowledge is to sharpen musical perception, not to bypass it.

# Chapter 2: Digital Audio and the Idea of Representation

## 2.1 What Digital Audio Is

Digital audio represents sound as a sequence of numerical samples. A continuous waveform is measured at regular intervals and stored as data. Two basic parameters govern the process: **sample rate** and **bit depth**.

Sample rate tells us how frequently the waveform is measured. Bit depth tells us how finely amplitude is represented. These values affect headroom, noise floor, editability, and the practical quality of a recording environment.

## 2.2 Why These Numbers Matter

Students often learn sample rate and bit depth as abstract specifications, but the practical question is always the same: what kind of work is this session supposed to support? Archival-quality recording, flexible editing, professional release preparation, and classroom experimentation may have different needs.

The important lesson is to avoid technological mysticism. Bigger numbers do not automatically mean better art. Better understanding means better choices.

# Chapter 3: Recording and the Signal Chain

## 3.1 The Journey from Source to File

Once sound leaves a singer, instrument, or loudspeaker, it begins a path. It travels through a room, reaches a microphone, becomes an electrical signal, passes through preamplification and conversion, and eventually enters recording software. This path is the **signal chain**.

<div class="definition">
<strong>Signal chain</strong>: the ordered path through which sound is captured, amplified, converted, processed, and stored.
</div>

The importance of the signal chain is simple: every weakness early in the chain echoes later. A bad room cannot be fully fixed by EQ. A clipped input cannot be restored by mixing. Poor microphone placement cannot be undone simply by adding reverb later.

## 3.2 Microphones as Interpretive Devices

Microphones do not neutrally "capture reality." They interpret it. Dynamic microphones, condensers, and other designs respond differently to transients, detail, and level. Polar patterns determine how much of the source and room are included. Placement changes tone, proximity effect, and the perceived distance of the sound.

This is why recording is already a form of arranging. Before any editing or processing, the musician has decided what version of the source the listener will receive.

## 3.3 Good Recording Is Front-Loaded Thinking

Students improve quickly when they stop thinking of recording as an automatic documentation process and start treating it as a sequence of musical decisions:

1. Is this source meant to feel intimate or environmental?
2. Should the room be audible?
3. Is transient clarity more important than warmth?
4. Will this sound need to cut through a dense mix later?

Once those questions are asked early, the whole workflow becomes more intentional.

# Chapter 4: Editing and the Digital Audio Workstation

## 4.1 Seeing Sound

A DAW makes sound visible. Clips, waveforms, meters, automation lanes, and grids let us inspect time and amplitude in a way earlier musicians could not. This is powerful, but it also creates a danger: students may begin trusting the eye more than the ear.

A waveform can show where an attack begins or where silence occurs, but it cannot by itself tell you whether a phrase breathes musically, whether a cut feels natural, or whether an edit destroys groove. The best editors use the screen as a guide while letting listening remain final.

## 4.2 Editing as Musical Time-Shaping

Basic editing operations such as trimming, splitting, moving, fading, and crossfading can sound like clerical work. In reality, they shape musical time. Cut a note too early and you erase resonance. Fade too long and the groove loses precision. Crossfade too abruptly and a click appears. Crossfade too generously and the rhythm blurs.

This is why editing is not separate from musicianship. It is part of interpretation.

## 4.3 Session Management

Digital work falls apart quickly without organization. File names, version control, folder structure, backups, and clear track labeling all protect musical thought. A badly organized session does more than waste time; it interrupts attention.

One of the hidden lessons of music technology is that workflow is an artistic condition. Creative work becomes more possible when the technical environment is calm and legible.

# Chapter 5: Effects, Signal Processing, and Sonic Identity

## 5.1 What Effects Do

Digital signal processing gives the musician post-recording control over tone, space, dynamics, and motion. Equalization changes spectral balance. Compression reshapes dynamics and envelope. Reverb simulates or invents acoustic space. Delay adds repetition and depth. Modulation effects introduce motion. Distortion and saturation alter harmonic character and density.

Students should not learn these as isolated plugin categories only. They should learn them as ways of answering musical questions.

## 5.2 Transparent and Obvious Processing

Some processing aims to disappear. A gentle EQ cut may simply remove harshness. A compressor may stabilize a vocal enough that the listener never notices it directly. Other processing aims to become audible as style: dramatic filter sweeps, heavy distortion, cavernous reverbs, or obviously artificial delays.

Both are valid. What matters is intention. Clear processing is often corrective or supportive. Obvious processing is often expressive, theatrical, or stylistic.

## 5.3 Automation

Automation is one of the most musical powers of the DAW because it lets parameters evolve over time. Volume can swell, panning can move, effects can bloom, filters can open, and textures can transform. Once students grasp automation, they begin to understand that engineering choices can participate directly in musical form.

Automation is therefore not just finishing work. It is composition.

# Chapter 6: MIDI, Sequencing, and Symbolic Control

## 6.1 What MIDI Is and Is Not

MIDI is often misunderstood because it feels like sound while not actually being sound. It is not an audio format. It is a system of instructions: which note begins, how hard it is struck, when it ends, what controller values change, and how performance information is communicated among devices and software.

<div class="definition">
<strong>MIDI</strong>: a protocol for communicating symbolic performance and control data between digital musical devices and software.
</div>

That distinction explains MIDI's extraordinary flexibility. A melody stored as MIDI can be transposed, revoiced, quantized, reassigned to another instrument, or rhythmically reworked without rerecording audio.

## 6.2 Sequencing

Sequencing changes compositional thinking because it encourages construction through clips, loops, patterns, and layered repetition. Time becomes editable at the level of blocks. This does not force music to become mechanical, but it does create a new relationship to form. One can build structure iteratively, hearing revisions instantly.

This is one reason sequencing has become central well beyond electronic dance music. It is now one of the dominant compositional environments of contemporary practice.

## 6.3 Synthesis

Software synthesis extends this symbolic world by allowing sound itself to be built or modeled. In subtractive synthesis, one carves away from a harmonically rich source. In FM, timbre emerges from modulation relationships. In sampling, recorded sound becomes playable material. In wavetable and granular approaches, timbre can become morphing and fluid.

Students do not need encyclopedic mastery at the start. What they need is an ear for how oscillator type, filter behavior, envelope shape, and modulation interact to create identity.

# Chapter 7: Mixing, Mastering, and Translation

## 7.1 What a Mix Does

A mix is not just a balance of loudness. It is the creation of a listening perspective. Which sound feels closest? Which is widest? Which occupies the low end? Which is intentionally dry and which lives in a larger acoustic illusion? Level, panning, EQ, dynamics, stereo width, ambience, and automation all work together to answer those questions.

This is why arrangement and mixing are deeply connected. If too many materials occupy the same space, the problem is not merely level. It may be conceptual overcrowding.

## 7.2 Mastering

Mastering asks a different question from mixing. Mixing asks how the piece works internally. Mastering asks how the finished object behaves externally: across systems, formats, playback environments, and distribution contexts.

Students do not need to become full mastering engineers in an introductory course, but they should understand why mastering exists. It is about translation, coherence, and final presentation, not simply volume.

## 7.3 Notation and Hybrid Workflows

Even in a studio-centered course, notation still matters. Notation software can support arrangement, part preparation, and the translation of sequenced or improvised ideas into performable materials. Music technology does not erase older forms of musicianship. It extends them into new workflows.

# Chapter 8: The Musician After the Intro Course

The best outcome of an introductory music technology course is not dependence on one software package. Software changes too quickly for that. The durable outcome is a set of habits:

1. listen carefully,
2. record intentionally,
3. edit musically,
4. understand signal flow,
5. organize work responsibly,
6. choose tools in service of artistic goals.

Students who acquire those habits can move from one DAW or platform to another without losing their footing. That is the real educational goal. Technology changes. Deep listening and strong musical judgment remain.

# Chapter 9: Extended Case Studies in Music Technology Practice

## 9.1 From Analog Habits to Digital Workflows

One of the most useful ways to understand present-day music technology is to remember that many of its core ideas come from earlier studio practices. Multitracking, editing, overdubbing, effects routing, and signal management all have analog precedents. The digital environment did not invent these concerns; it accelerated and democratized them.

This historical awareness is helpful because it prevents students from mistaking convenience for conceptual novelty. Dragging clips in a DAW may feel completely modern, but it still belongs to a longer history of constructing music layer by layer.

## 9.2 A Recording Session as a Musical System

Consider a simple scenario: recording a vocal over a MIDI-based backing track. Even this basic exercise forces the student to integrate most of the course at once. Microphone choice affects sibilance and intimacy. Room sound affects clarity. Gain staging affects noise and headroom. Monitoring affects performance confidence. Editing affects phrasing. Compression affects perceived steadiness. Reverb affects space and emotional distance.

The educational value of such an exercise is that it teaches the student to stop treating each technical choice as isolated. In real practice, every decision influences the next one.

## 9.3 MIDI and the Composition Mindset

MIDI also changes the psychology of writing. Because notes can be moved, duplicated, quantized, reorchestrated, and reassigned instantly, students often compose more iteratively. They test patterns, build sections from loops, and hear arrangement possibilities in real time. This can encourage experimentation, but it can also encourage complacency if every loop is left in place simply because it is convenient.

The mature technological musician therefore learns when to exploit repeatability and when to resist it. The question is never whether looping is valid. The question is whether the structure remains musically alive.

## 9.4 What Other Courses Emphasize

Public university and conservatory courses in music technology often converge around the same basic topics even when their software differs. Berklee's foundational technology courses, for example, explicitly foreground MIDI, signal flow, audio engineering, and live electronic performance as core transferable skills rather than software-specific tricks. That emphasis is worth adopting because it matches the realities of contemporary music work: platforms change, but principles persist.

## 9.5 Why Depth Matters in Notes Like These

An introductory music technology course can be deceptively dense because it compresses several fields into one: acoustics, psychoacoustics, recording practice, editing, symbolic sequencing, synthesis, mixing, and workflow management. A shallow note set may capture the vocabulary but miss the relationships. Textbook-scale notes are valuable here because they allow the student to see how concepts recur across different stages of production. Hearing, recording, editing, sequencing, and mixing are not separate islands. They are one evolving chain of musical decision-making.

# Chapter 10: Walkthrough of the Course's Practical Sequence

## 10.1 Sound and Digital Fundamentals

The opening topics on sound, digital sound, and listening are not filler. They are the conceptual base that makes later studio work intelligible.

## 10.2 Recording and Editing

The middle units on microphones, recording, waveform reading, and editing are where students first discover that technological decisions are musical decisions. Timing, space, and clarity become editable parameters.

## 10.3 Effects, MIDI, and Synthesis

The next sequence moves from captured sound to designed sound. Signal processing, MIDI, sequencing, and synthesis show that the studio can function not just as a recording environment but as a compositional environment.

## 10.4 Mixing, Mastering, and Future Tools

The later modules on mixing, mastering, notation software, and alternative interfaces complete the arc. Ideally by this point the student recognizes that all the earlier topics were leading here. The finished track is the cumulative result of many interlocking listening decisions.

# Chapter 11: Case-Based Listening for Technology Students

## 11.1 Hearing a Vocal Recording

A simple vocal recording can teach almost the whole course if a student listens correctly. Is the room dry or live? Is the microphone intimate or distant? Does the compressor flatten the dynamic shape or simply stabilize it? Is the sibilance controlled? Does the reverb place the voice in a believable space or stylize it? Does editing preserve breath and phrase or over-correct the human shape of the line?

Asking these questions turns the student from consumer into analyst.

## 11.2 Hearing an Electronic Track

An electronic or MIDI-heavy track poses a different set of listening tasks. Which materials are sequenced? Which are sampled? What is loop-based and what is linear? Are filter changes part of the arrangement or just added movement? Does the low end feel designed or merely accumulated? How does automation articulate form?

This listening habit is essential because many students can name the tools but still fail to hear their results structurally.

## 11.3 The Studio as Compositional Environment

One of the biggest conceptual shifts in modern music technology is that the studio is no longer merely a place where finished music is captured. It is a place where music can be conceived, built, revised, and even performed. Once students understand that, they stop treating recording, sequencing, and mixing as after-the-fact tasks. They become central musical actions.

# Chapter 12: Why This Subject Requires Long Notes

## 12.1 Technical Vocabulary Is Not Enough

Students can memorize terms such as sample rate, bit depth, compression, MIDI, or automation very quickly. The harder task is understanding how those ideas relate. For example, compression is not just a plugin category. It is tied to envelope, perception of loudness, performance control, and genre style. MIDI is not just a note-entry format. It changes how composition and revision work.

## 12.2 Transferable Musicianship

The educational value of music technology lies in its transferability. A student who really understands signal flow, listening, editing, sequencing, and sonic intention can move between software platforms and future tools. That is why expansive notes are worthwhile. They teach principles instead of shortcuts.
