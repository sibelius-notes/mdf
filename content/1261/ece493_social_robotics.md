---
title: "ECE 493: Social Robotics — Foundations, Technology and Applications of Human-Centered Robotics"
prof: "Kerstin Dautenhahn"
subjects: "ECE"
ai_track: true
---

## Sources and References

**Primary textbook** — Bartneck, C., Belpaeme, T., Eyssel, F., Kanda, T., Keijsers, M., & Šabanović, S. (2020). *Human-Robot Interaction: An Introduction*. Cambridge University Press. (Available free online at human-robot-interaction.org)

**Supplementary texts** — Siciliano, B., & Khatib, O. (Eds.). (2016). *Springer Handbook of Robotics* (2nd ed.). Springer. — Fong, T., Nourbakhsh, I., & Dautenhahn, K. (2003). A survey of socially interactive robots. *Robotics and Autonomous Systems*, 42(3–4), 143–166. — Breazeal, C. (2004). *Designing Sociable Robots*. MIT Press. — Mataric, M. J. (2007). *The Robotics Primer*. MIT Press.

**Online resources** — MIT Media Lab, Personal Robots Group (media.mit.edu/groups/personal-robots); CMU Robotics Institute lecture notes on HRI; ACM/IEEE HRI Conference proceedings (ieeexplore.ieee.org); Dautenhahn, K. (2007). Socially intelligent robots: dimensions of human-robot interaction. *Philosophical Transactions of the Royal Society B*, 362(1480), 679–704.

---

# Chapter 1: What Is a Social Robot?

## 1.1 Defining Social Robots

The term "social robot" is used across a surprisingly broad spectrum of systems, from toy companions to industrial collaborative arms. Arriving at a precise definition requires disentangling several related concepts: *sociality*, *embodiment*, and *interaction*.

A **social robot** is a physically embodied autonomous agent that engages humans or other agents using social cues, norms, and conventions drawn from human interpersonal behavior. This distinguishes social robots from classical industrial manipulators (which interact with objects, not people) and from virtual agents or chatbots (which lack physical embodiment). The physical body matters: the presence of a robot in shared space triggers social expectations that a screen-based agent does not.

Fong, Nourbakhsh, and Dautenhahn (2003) proposed an influential taxonomy that organizes socially interactive robots along several axes:

- **Socially evocative**: designed to trigger social responses in humans by resembling social beings — stuffed-animal-like therapeutic robots such as PARO fall here.
- **Socially situated**: operating in environments shared with humans, able to perceive and respond to the social context without necessarily modeling it explicitly.
- **Sociable**: proactively engaging with humans, possessing social goals of their own such as sustaining conversation or seeking assistance.
- **Socially intelligent**: integrating cognitive, emotional, and behavioral models that support rich, sustained social interaction.

These categories are not mutually exclusive, and many deployed robots combine properties from multiple tiers.

## 1.2 Why Embodiment Matters

The "robot embodiment" debate in HRI draws on philosophical work in embodied cognition. Bodies are not just carriers for brains; they shape how an agent perceives, acts, and is perceived. A physical robot introduces several interaction primitives unavailable to purely virtual systems:

- **Proxemics** — the robot occupies real space and its position relative to a human communicates status, intimacy, and intent.
- **Haptic affordance** — a robot can be touched, handed objects, and physically guided, enabling a class of interaction unavailable on screens.
- **Social presence** — humans reliably attribute greater agency and moral consideration to physically present entities than to equivalent virtual ones.

Experiments comparing physically present robots with video-projected equivalents consistently find stronger engagement, higher task compliance, and more pronounced emotional responses to the physical robot, even when the behavior is identical — a phenomenon known as the **physical presence effect**.

## 1.3 The Uncanny Valley

Masahiro Mori's 1970 concept of the *bukimi no tani* (uncanny valley) posits that human affinity toward a robot rises as its appearance becomes more human-like, until a threshold region where near-human but imperfect likeness provokes discomfort or eeriness. Affinity recovers to its peak only at true human appearance or movement. The effect is especially pronounced for motion: a physically realistic android with slightly jerky movement generates stronger negative affect than a clearly non-human robot moving smoothly.

The uncanny valley has methodological implications for robot design. Many successful social robots (NAO, Pepper, PARO, Cozmo) deliberately occupy non-human but warm, expressive aesthetics that avoid the valley while remaining strongly anthropomorphized.

---

# Chapter 2: Hardware Foundations — Sensors, Actuators, and Platforms

## 2.1 Sensory Systems for Social Robots

Social robots require sensor suites capable of perceiving humans in real time across multiple modalities.

**Visual perception** is typically provided by RGB cameras, often stereo pairs for depth estimation, and increasingly by structured-light or time-of-flight depth cameras (e.g., Intel RealSense, Microsoft Azure Kinect). Key perception tasks include:

- Face detection and recognition
- Gaze estimation (where a person is looking)
- Facial action coding (mapping facial muscle movements to emotions via the Facial Action Coding System, FACS)
- Body pose estimation (skeleton tracking; OpenPose, MediaPipe)
- Gesture recognition

**Auditory perception** includes microphone arrays for sound localization, automatic speech recognition (ASR) pipelines, and paralinguistic analysis (pitch, rate, energy) for affective state inference. Close-talk microphones on the robot's body or directional arrays on its head handle the cocktail-party problem in naturalistic settings.

**Proximity and touch sensors** — capacitive touch strips, bump sensors, force/torque sensors in joints, and tactile skins (e.g., the iCub's distributed capacitive skin) allow a robot to detect contact, distinguish friendly touch from collision, and modulate responses accordingly.

**Physiological sensing** — some therapeutic and companion robots incorporate galvanic skin response (GSR), pulse oximetry, or thermographic cameras to infer user arousal and valence without requiring explicit input.

## 2.2 Actuation and Expression

Social robots express internal states primarily through three channels:

**Head and face** — degrees of freedom (DOF) in the neck, jaw, eyelids, eyebrows, and lip corners create the richest emotional expressivity. Animatronic heads (used in robots like Sophia by Hanson Robotics) employ servos mapped to FACS action units. Even without a face, head orientation signals attention: a robot that turns toward a speaker conveys engagement; one that looks away conveys disinterest.

**Arms and hands** — deictic gestures (pointing), beat gestures (rhythmic hand movements synchronized with speech), and iconic gestures (shape-forming movements) all carry meaning in human communication. Social robots that integrate expressive arm motion (Pepper, Baxter) feel substantially more communicative than those restricted to head motion alone.

**Locomotion and proxemics** — mobile robots can approach, retreat, and orient their body to signal conversational roles. Hall's proxemic zones (intimate < 0.5 m, personal 0.5–1.2 m, social 1.2–3.7 m, public > 3.7 m) inform when a robot should stop approaching, and when it should yield space.

## 2.3 Representative Platforms

| Platform | Developer | Key Features | Typical Use |
|---|---|---|---|
| NAO | SoftBank Robotics | 25 DOF, omnidirectional walk, LED eyes, microphone array | Education, autism therapy |
| Pepper | SoftBank Robotics | Tablet chest, omnidirectional base, emotion recognition | Reception, retail, research |
| PARO | AIST Japan | Harp-seal form, touch/light/audio sensors, JISQ 0032 certified | Elder care, dementia therapy |
| iCub | IIT Genova | Full-body torque control, skin sensors, binocular vision | Cognitive science research |
| Cozmo / Vector | Anki / Digital Dream Labs | Cube manipulators, expressive OLED face, home companion | Consumer companion |
| Spot | Boston Dynamics | Quadruped locomotion, extendable payload bay | Industrial inspection, research |

---

# Chapter 3: Multimodal Interaction

## 3.1 Verbal Interaction — Speech and Dialogue

Human conversation is not merely information exchange; it is a finely choreographed joint activity governed by **turn-taking**, **grounding**, and **repair**. A socially competent robot must participate in this activity, not merely respond to queries.

**Turn-taking cues** that humans use include: final intonation drop, gaze aversion before yielding the floor, filled pauses ("uh", "um") to hold the turn, and back-channels ("mm", "yeah") to signal continued attention. Robots that fail to produce appropriate back-channels are perceived as inattentive; those that mis-time turn-taking feel rude or awkward.

Modern dialogue management for social robots typically combines:

1. **Speech recognition** — statistical or deep-learning ASR (Whisper, Google Speech-to-Text) converts audio to text.
2. **Natural language understanding (NLU)** — intent classification and slot-filling identify what the user wants.
3. **Dialogue state tracking** — maintains a belief state over the conversation history.
4. **Response generation** — template-based, retrieval-based, or generative (large language model) methods produce the robot's next utterance.
5. **Speech synthesis (TTS)** — converts generated text to audio with appropriate prosody.

Large language models (GPT-4, LLaMA) have recently been integrated as conversational backends, dramatically improving fluency but introducing challenges around grounding (the robot may say things it cannot actually do) and turn-taking latency.

## 3.2 Non-Verbal Interaction

Non-verbal communication (NVC) accounts for the majority of social information exchanged in human interaction. Key NVC channels for social robots:

**Facial expressions** — Ekman's six basic emotions (happiness, sadness, anger, fear, disgust, surprise) are cross-culturally recognizable and have been implemented in animatronic robot faces. Beyond basic emotions, **complex emotions** (contempt, shame, embarrassment) and **social expressions** (agreement nods, thinking faces) are equally important in sustained interaction.

**Gaze** — mutual gaze establishes connection and signals conversational intent. Robots that maintain appropriate gaze toward the person speaking and shift gaze toward a referred object produce more natural interaction than robots with fixed stares or averted gaze. Gaze direction also communicates referential intent in joint attention tasks.

**Gesture** — McNeill's gesture taxonomy distinguishes:
- *Iconic*: shape the referent in space (hand outlines a circle for "wheel")
- *Metaphoric*: shape abstract concepts (hands rise for "more important")
- *Deictic*: point to locations or objects
- *Beat*: rhythmic, speech-synchronous emphasis markers

Robots that produce co-speech gesture are perceived as more engaging and communicate more clearly than gesture-silent robots.

**Head movements** — nodding (agreement, back-channel), head shake (negation), head tilt (curiosity, empathy), and head orientation (attention direction) are processed rapidly and involuntarily by human observers.

## 3.3 Spatial Interaction — Proxemics and Navigation

Proxemics in HRI concerns how robots manage their position, orientation, and movement relative to humans in shared space. Socially acceptable navigation is distinct from collision-free navigation: a robot that legally navigates through a conversation group is socially disruptive even if it avoids physical contact.

Key spatial interaction principles:

- **Social force models** — augment traditional navigation cost functions with repulsive terms encoding personal space bubbles around humans. Helbing and Molnár's social force model (1995) is widely used as a baseline.
- **F-formations** — Kendon (1990) described recurrent spatial arrangements humans adopt in conversation ("vis-à-vis", "L-shape", "side-by-side"). Robots that enter and maintain appropriate F-formation positions are perceived as group members; those that stand outside the formation are perceived as excluded observers.
- **Approaching speed and trajectory** — direct, rapid approach is perceived as aggressive; curved, decelerating approaches feel natural. Robots should announce their intent to approach before entering personal space.

---

# Chapter 4: Affect, Emotion, and Engagement

## 4.1 Affective Computing and the Wheel of Emotions

Picard's *Affective Computing* (1997) established the paradigm of machines that recognize, express, and have emotions. In social robotics this paradigm manifests in two directions:

**Emotion recognition from users** draws on facial expression analysis, vocal affect detection, physiological signals, and body posture. Supervised classifiers or deep networks map sensor data to discrete emotion categories (Ekman) or to dimensions of the **circumplex model of affect** (Russell, 1980), which represents emotional states in a two-dimensional space of **valence** (positive–negative) and **arousal** (high–low).

**Emotion expression by robots** involves generating robot behaviors that communicate internal states. Even robots without faces can express emotion through motion: Laban Movement Analysis (LMA) provides a vocabulary for describing movement qualities (effort, space, time, flow) that maps to perceived affect. A robot moving with high effort and direct spatial intent is perceived as determined; one moving with light effort and indirect spatial pathways is perceived as playful.

## 4.2 Engagement and the Human-Robot Bond

**Engagement** in HRI refers to the process by which two agents establish, maintain, and end their connections through mutual attention, shared focus, and responsive behavior. Engagement is not a single variable but a multi-component construct:

- **Physical engagement**: proximity and orientation
- **Behavioral engagement**: activity coordination, co-manipulation
- **Social engagement**: mutual gaze, turn-taking, back-channeling
- **Emotional engagement**: expressed affect, rapport

The **CASA (Computers Are Social Actors)** framework (Nass & Reeves, 1996) established that humans reflexively apply social rules to any entity that presents social cues, regardless of conscious beliefs about its nature. This explains why users thank robots, feel guilty about switching them off, and attribute intentions to Roomba vacuums.

**Parasocial attachment** — the bond formed with media figures or fictional characters — has a homologue in HRI. Users of therapeutic companion robots like PARO report genuine emotional attachment, express distress at the robot's removal, and sometimes anthropomorphize it to the degree that they attribute genuine suffering or happiness to it.

## 4.3 Designing for Engagement — The Interaction Loop

Successful social interaction follows a perception-cognition-action loop tuned to the timescales of human behavior. Social robots must:

1. Perceive the human's state at multiple timescales (immediate gaze, ongoing affect, long-term preference).
2. Update an internal model of the interaction state (joint attention, rapport level, role assignments).
3. Select and execute a response behavior that advances the interaction goal while maintaining social norms.
4. Adapt the model based on the human's reaction.

This loop must operate at real-time rates (perception at 10–30 Hz, response onset < 500 ms for conversational turns) while integrating slow-timescale memory of previous interactions and user preferences.

---

# Chapter 5: Cognitive Architectures for Social Robots

## 5.1 Why Cognitive Architectures?

A **cognitive architecture** provides an organizing framework that specifies how perception, memory, reasoning, and action are integrated in an intelligent system. For social robots, the choice of architecture determines how the robot represents knowledge about people and situations, how it learns from interaction, and how it handles the complexity of simultaneous interaction goals.

Key requirements for a social cognitive architecture include:

- Real-time reactivity to social cues
- Long-term memory of individuals and interaction history
- Goal-directed behavior that pursues social objectives
- Emotional state representation that influences behavior
- Learning from interaction without catastrophic forgetting

## 5.2 Classical Architectures

**Subsumption architecture** (Brooks, 1986) proposed behavior-based control organized as a hierarchy of reactive behaviors that compete for action selection, with higher layers suppressing lower ones. Subsumption excels at reactive, robust behavior in dynamic environments but struggles with complex, goal-directed social tasks.

**BDI (Belief-Desire-Intention)** architectures model agents with explicit representations of their beliefs about the world, desires (long-term goals), and intentions (active plans). BDI systems support reasoning about social goals and modeling other agents' mental states (theory of mind), but are typically too slow for real-time social reaction.

**ACT-R (Adaptive Control of Thought — Rational)** (Anderson, 2007) is a cognitive architecture rooted in cognitive psychology, modeling human performance in tasks involving procedural and declarative memory. ACT-R has been used to build robot controllers that predict and mimic human task performance, enabling more natural robot behavior in joint human-robot tasks.

## 5.3 Architectures Designed for HRI

**LIDA (Learning Intelligent Distribution Agent)** models cognition as a cyclic process of *sensing*, *understanding*, and *acting*, integrating attention, learning, and action selection in a biologically plausible framework.

**DIARC** (Developed at Tufts and Brandeis) is an architecture built explicitly for dialogue-capable robots, integrating natural language processing, task planning, and social norm reasoning. DIARC supports robots that can negotiate task assignments, request help, and explain their actions — capacities essential for collaborative human-robot work.

**Sociable robot architectures** — Breazeal's work on Kismet and later Leonardo at MIT Media Lab developed architectures that integrate drives (fatigue, social engagement need, stimulation), emotions (fear, joy, satisfaction), and social goals into a single framework. The robot's behavior emerges from the interplay of these factors, producing apparently spontaneous social engagement.

## 5.4 Theory of Mind and Social Reasoning

**Theory of Mind (ToM)** — the capacity to attribute mental states (beliefs, desires, intentions) to others — is central to human social intelligence. Robots equipped with ToM models can anticipate human behavior, take perspectives, and respond to implicit social cues rather than only explicit commands.

Computational models of ToM range from simple belief-desire-inference systems to hierarchical Bayesian models of belief updating. In HRI, ToM capabilities enable:

- **Shared plan recognition**: inferring that a human is performing a particular task and offering appropriate assistance
- **Communicative intent modeling**: distinguishing deliberate signals from incidental behavior
- **Gaze following and joint attention**: tracking where a human is attending and directing the robot's own attention accordingly

---

# Chapter 6: Research Methods in Human-Robot Interaction

## 6.1 Designing HRI Studies

HRI research is empirical: claims about robot behavior, user experience, or social phenomena must be grounded in systematic observation. Designing a valid HRI study requires decisions at multiple levels:

**Research question and hypothesis** — the study must specify what phenomenon is being investigated and what comparison or measurement will test it. Studies may be descriptive (characterizing what happens during interaction), comparative (testing two robot designs against each other), or evaluative (measuring whether a robot achieves a specified outcome).

**Experimental design** — common designs in HRI:
- *Between-subjects*: different participants assigned to different conditions (robot design A vs. B). Avoids order effects but requires larger samples.
- *Within-subjects*: each participant experiences all conditions. More statistical power but susceptible to learning and fatigue effects.
- *Wizard-of-Oz (WoZ)*: a human operator controls the robot's behavior in real time, without the participant's knowledge. Allows testing interaction designs before full autonomy is implemented, at the cost of ecological validity.

**Participant recruitment** — HRI studies use **opportunity sampling** (students, lab visitors), **purposive sampling** (specific user populations such as older adults or children with autism), or **online platforms** (crowdsourced video-based evaluations). Sample size is determined by power analysis based on expected effect size.

## 6.2 Measurement Instruments

**Self-report questionnaires** are the dominant measurement tool in HRI due to their ease of administration. Key validated instruments include:

- **Godspeed Questionnaire Series** (Bartneck et al., 2009): five subscales measuring anthropomorphism, animacy, likeability, perceived intelligence, and perceived safety.
- **Negative Attitudes toward Robots Scale (NARS)** (Nomura et al., 2006): measures anxiety and discomfort toward robots.
- **Robot Anxiety Scale (RAS)**: quantifies situational anxiety during robot interaction.
- **User Experience Questionnaire (UEQ)**: broader measure of attractiveness, perspicuity, efficiency, dependability, stimulation, novelty.
- **Technology Acceptance Model (TAM)** adaptations: perceived usefulness and ease of use for specific robot applications.

**Behavioral measures** — objective, non-reactive measures of interaction quality:
- Interaction duration and re-engagement frequency
- Response latency and turn-taking timing
- Proxemic behavior (approach distance, orientation)
- Facial expression frequency (coded from video via FACS or automated tools)
- Touch frequency and type

**Physiological measures** — galvanic skin response, heart rate variability, and facial electromyography (fEMG) provide continuous, non-conscious indicators of arousal and affect.

## 6.3 Ethics in HRI Research

HRI studies typically require institutional ethics review. Particular concerns include:

- **Informed consent**: participants must understand they are interacting with a robot.
- **Deception**: WoZ studies involve deception about robot autonomy — participants must be debriefed.
- **Vulnerable populations**: studies with children, older adults, or individuals with cognitive disabilities require additional safeguards.
- **Data privacy**: video recordings that capture faces require participant consent and controlled storage.
- **Robot deception**: robots that simulate emotional connection without genuine internal states raise ethical questions about exploitation — particularly in therapeutic contexts.

---

# Chapter 7: Evaluating Usability, User Experience, and Acceptance

## 7.1 Usability in HRI

**Usability** in HRI adapts Nielsen's classical framework (efficiency, effectiveness, satisfaction, learnability, memorability) to the particularities of robot interaction. A robot system is usable when:

- Users can accomplish their intended goals (effectiveness)
- The interaction requires manageable cognitive and physical effort (efficiency)
- The experience is satisfying and not frustrating (subjective satisfaction)

HRI-specific usability challenges include: robot speech recognition errors that users must correct, navigation failures in cluttered environments, and interaction modalities (touch, gesture) that differ from user expectations.

**Think-aloud protocols** — participants verbalize their reasoning while interacting — are useful for identifying usability breakdowns but interfere with natural social interaction. Post-task retrospective protocols or stimulated recall (watching video playback) are often preferred in HRI.

## 7.2 User Experience Beyond Usability

User experience (UX) extends beyond task completion to encompass the holistic hedonic and pragmatic qualities of interacting with a system. In the context of social robots, UX dimensions of particular relevance include:

- **Social presence**: the sense of sharing space with a social being
- **Engagement**: the degree of involvement and attention sustained during interaction
- **Trust**: the willingness to rely on the robot's capabilities and intentions
- **Rapport**: the feeling of connection and mutual understanding

These dimensions interact: high social presence can amplify both positive (engagement, rapport) and negative (uncanny valley discomfort, privacy concern) responses.

## 7.3 Acceptance and Adoption

Technology acceptance in the HRI domain is modeled by frameworks adapted from the broader HCI literature:

**TAM-based models** predict that perceived usefulness and perceived ease of use jointly determine intention to use. In social robotics, perceived usefulness is strongly mediated by trust and by the match between robot capabilities and user needs; ease of use is mediated by the naturalness of the interaction modality.

**UTAUT (Unified Theory of Acceptance and Use of Technology)** adds social influence (what others think about using the technology) and facilitating conditions (organizational and technical infrastructure) as predictors. In elder-care deployments, social influence from family members and caregivers is a significant predictor of resident acceptance.

**Long-term acceptance** — most HRI studies are short (single session, < 30 min). Field deployments reveal acceptance dynamics invisible in lab studies: novelty effects that inflate initial engagement, habituation that reduces engagement over weeks, and task relevance that determines whether interaction is maintained. Longitudinal studies and diary methods are required to characterize long-term acceptance trajectories.

---

# Chapter 8: Applications of Social Robots

## 8.1 Robot-Assisted Therapy

**Autism Spectrum Disorder (ASD)** — social robots are used as mediators in therapy for children with ASD. The hypothesis is that robots, being socially simpler and more predictable than humans, reduce the social-cognitive load for children who struggle with the complexity of human interaction. Studies with NAO and KASPAR (a minimally expressive child-sized robot developed at Hertfordshire by Dautenhahn's group) show improvements in imitation, joint attention, and eye contact. The robots serve as social scaffolds: skills learned with the robot can transfer to human interaction.

**Dementia and elder care** — companion robots such as PARO are deployed in nursing homes and memory care units. Evaluated in randomized controlled trials, PARO interaction has been associated with reductions in agitation and anxiety, decreased need for PRN (as-needed) psychotropic medication, and improved affect in residents with dementia. The mechanism is likely activation of nurturing and attachment behaviors through tactile and behavioral stimulation.

**Rehabilitation** — socially interactive robots serve as coaches in physical rehabilitation (post-stroke motor recovery, pediatric physiotherapy) and cognitive rehabilitation (memory aids, attention training). The robot's social presence and encouragement improves adherence to repetitive exercise protocols compared to non-social computerized coaches.

## 8.2 Education

Robots in educational settings serve as **tutors**, **peers**, and **tools**:

- *Tutor role*: the robot provides instruction, models skill performance, and gives feedback. NAO-based literacy and mathematics tutoring with young children has shown learning gains comparable to human tutoring in some studies, though effects are domain- and design-specific.
- *Peer role*: the robot is positioned as a fellow learner, sometimes making deliberate errors to prompt children to explain and teach. Teaching another agent deepens understanding — the **learning-by-teaching** effect.
- *Tool role*: the robot is an artifact to be programmed and controlled, serving as a motivating substrate for STEM education.

## 8.3 Human-Robot Collaboration at Work

**Collaborative robots (cobots)** — systems like Universal Robots' UR series and Rethink Robotics' Baxter — operate in shared workspace with human workers, handling repetitive or physically demanding tasks while humans handle tasks requiring dexterity or judgment. Social-robot features (gaze, head orientation, expressive lighting) communicate the robot's intent to human co-workers, reducing safety incidents from unexpected motion.

**Social navigation** — mobile service robots (delivery robots in hospitals and hotels, museum guide robots) must navigate among pedestrians using social conventions: yielding right of way, avoiding cutting through conversations, and communicating intent through direction of travel and speed modulation.

## 8.4 Companion Robots for Wellbeing

Beyond clinical contexts, companion robots are designed to provide social stimulation, reduce loneliness, and support wellbeing for isolated individuals. Key design principles:

- **Consistent personality**: users attribute stable personality traits and expect consistency — a robot that changes demeanor unpredictably is unsettling.
- **Adaptability**: the robot should learn user preferences over time, personalizing interaction.
- **Privacy-respecting intimacy**: companion robots collect sensitive behavioral and verbal data; transparency and data minimization are ethical requirements.

---

# Chapter 9: Ethics, Society, and the Future of Social Robots

## 9.1 Ethical Issues in Social Robotics

**Deception and authenticity** — social robots necessarily simulate social cues without the inner life those cues represent in humans. When is this deception ethically problematic? The debate distinguishes *productive deception* (a PARO-like robot calming a distressed dementia patient) from *exploitative deception* (a companion robot manipulating a user's attachment to drive purchases or compliance). The key variables are: does the user consent, is the user vulnerable, and does the deception serve the user's interests?

**Substitution vs. augmentation** — critics argue that deploying robots in care settings substitutes genuine human connection with simulacra, reducing the quality of care even if measurable outcomes improve. Proponents argue that robots augment care by freeing human caregivers from repetitive tasks. The ethical question is whether robot-provided social interaction meets a human need in morally equivalent ways to human-provided interaction.

**Labor displacement** — as social robots take on roles (reception, retail assistance, companionship) currently filled by humans, the distributional effects on employment and the quality of displaced work must be considered alongside efficiency gains.

**Safety and liability** — a robot that physically harms a user or provides incorrect medical guidance raises legal and ethical questions about responsibility attribution between designer, operator, and robot.

## 9.2 Privacy and Data

Social robots gather rich behavioral data about individuals in intimate contexts (home, care settings). Privacy concerns include:

- **Data minimization**: collect only the data necessary for function.
- **On-device processing**: emotion recognition and face identification conducted locally rather than transmitted to cloud servers reduces exposure.
- **Consent granularity**: users should be able to consent to some data uses but not others.
- **Retention limits**: personal behavioral profiles should not be retained indefinitely.

The EU AI Act classifies certain social robot applications (those used in sensitive contexts such as childcare or elder care) as high-risk AI systems, requiring conformity assessment, transparency, and human oversight.

## 9.3 Cultural Variation in HRI

Acceptance of and preferences for social robots vary substantially across cultures. Japan's Shinto tradition of attributing *kami* (spirit) to inanimate objects is often cited as a reason for Japanese openness to humanoid and zoomorphic robots, though empirical evidence for this cultural explanation is contested. More reliably documented are differences in:

- **Personal space norms**: cultures vary in preferred interpersonal distance; robots must adapt proxemic behavior to cultural context.
- **Gaze norms**: sustained mutual gaze is a dominance or intimacy signal in some cultures and a politeness signal in others.
- **Touch acceptability**: the degree to which physical contact from a robot is welcomed varies across cultural groups and demographic factors.

## 9.4 Futures for Social Robotics

The near-term trajectory of social robotics is shaped by three converging developments:

**Large language models as conversational backbones** — integrating LLMs (GPT-4, Gemini, Claude) into robot dialogue systems dramatically improves conversational fluency and breadth of knowledge. Remaining challenges include hallucination (the robot asserts things it cannot do or that are false), latency (LLM inference introduces response delays), and grounding (language about the physical world must be connected to robot perception and action).

**Generative behavior and motion** — generative models trained on human motion capture and social video can produce contextually appropriate non-verbal behavior, reducing the need for hand-crafted gesture scripting.

**Personalization and lifelong learning** — robots that learn individual user preferences, update models of the user's state over months-long deployments, and adapt their behavior accordingly will shift from novelty to genuine utility in companion and therapeutic applications.

The central challenge remains the **gap between laboratory and field**: results from controlled studies with short interaction sessions often fail to replicate in naturalistic long-term deployments. Advancing the field requires sustained investment in longitudinal field studies, open datasets, and standardized evaluation protocols that support comparison across systems and contexts.
