---
made_up: true
title: "MUSIC 276: Psychoacoustics and the Science of Musical Sound"
subjects: "MUSIC"
---

*These notes draw on Thomas D. Rossing, Richard F. Moore, and Paul A. Wheeler's The Science of Sound (3rd ed., 2002), Brian C. J. Moore's An Introduction to the Psychology of Hearing (6th ed., 2012), Arthur H. Benade's Fundamentals of Musical Acoustics (2nd ed., 1990), William M. Hartmann's Principles of Musical Acoustics (2013), and supplementary material from Stanford University MUSIC 150 (Musical Acoustics) and MUSIC 151 (Psychoacoustics) course materials and MIT OpenCourseWare 21M.380.*

---

## Chapter 1: Vibrations, Waves, and Sound

The study of musical acoustics begins with the most elemental physical phenomenon in all of music: vibration. Every sound — the warmth of a cello, the attack of a snare drum, the shimmer of a cymbal — originates in the back-and-forth mechanical oscillation of some physical object. To understand the richness and variety of musical sound, we must first develop a precise and quantitative language for describing vibration, and then understand how vibrational energy propagates through air to reach a listener's ear. This chapter lays that foundation, moving from the simplest idealization of oscillatory motion through the wave equation and the decibel scale, to the perceptual landmark of the equal-loudness contour. Throughout, we will keep one foot in the physics and the other in the experience of music, because the two are inseparable.

### 1.1 Simple Harmonic Motion

The simplest and most fundamental type of vibration is *simple harmonic motion* (SHM). A mass on a spring, a pendulum swinging through a small angle, the cone of a loudspeaker driven at a single frequency — all are well described by SHM. The essential ingredient is a *restoring force*: whenever the object is displaced from its equilibrium position, a force acts to push or pull it back, proportional to how far it has moved.

<div class="definition">
A mechanical system exhibits <strong>simple harmonic motion</strong> when the net restoring force \(F\) on the oscillating object is proportional to its displacement \(x\) from equilibrium and directed opposite to that displacement:

\[
F = -kx,
\]
where \(k > 0\) is the <em>spring constant</em> (or stiffness) of the system, measured in newtons per metre (N/m). Newton's second law, \(F = m\ddot{x}\), then gives the <em>equation of motion</em>

\[
m\ddot{x} + kx = 0,
\]
whose general solution is

\[
x(t) = A\cos(\omega t + \phi),
\]
where \(A\) is the <strong>amplitude</strong> (the maximum displacement from equilibrium, in metres), \(\omega\) is the <strong>angular frequency</strong> (in radians per second), and \(\phi\) is the <strong>initial phase</strong>, determined by the initial conditions \(x(0)\) and \(\dot{x}(0)\).
</div>

{{< score id="music276/31-shm-tuning-fork" caption="A tuning fork sounding A4 (440 Hz): the same pitch at different time resolutions, illustrating the periodicity of simple harmonic motion." >}}

The angular frequency is entirely determined by the mechanical properties of the system:

\[
\omega = \sqrt{\frac{k}{m}}.
\]
The motion repeats with period \(T = 2\pi/\omega\), so the ordinary (cyclic) frequency in hertz is

\[
f = \frac{1}{T} = \frac{\omega}{2\pi} = \frac{1}{2\pi}\sqrt{\frac{k}{m}}.
\]
This formula encodes an important physical principle: stiffer systems (larger \(k\)) vibrate faster, while more massive systems (larger \(m\)) vibrate more slowly. Instrument makers have exploited this for millennia. Tightening a guitar string raises \(k\) (by increasing tension, which acts as an effective spring constant for transverse displacement) and raises the pitch. Winding bass strings with extra wire raises \(m\) per unit length, lowering the pitch without requiring an impractically long string.

The velocity and acceleration in SHM follow directly by differentiation:

\[
\dot{x}(t) = -A\omega\sin(\omega t + \phi), \qquad \ddot{x}(t) = -A\omega^2\cos(\omega t + \phi).
\]
Notice that velocity is 90° out of phase with displacement (the particle moves fastest when it passes through equilibrium and is momentarily at rest at the extremes), and acceleration is exactly 180° out of phase with displacement (the restoring force is always directed toward equilibrium).

<div class="example">
<strong>Example 1.1.</strong> A tuning fork vibrating at concert pitch \(A_4 = 440\) Hz has angular frequency

\[
\omega = 2\pi \times 440 \approx 2764 \text{ rad/s}.
\]
If the tip of the fork moves with amplitude \(A = 0.1\) mm \(= 10^{-4}\) m, its displacement at time \(t\) (taking \(\phi = 0\) for convenience) is

\[
x(t) = 10^{-4}\cos(2764\, t) \text{ m}.
\]
The maximum velocity is \(v_{\max} = A\omega = 10^{-4} \times 2764 \approx 0.276\) m/s, occurring as the tip passes through equilibrium. The maximum acceleration is \(a_{\max} = A\omega^2 \approx 763\) m/s\(^2\), about 78 times the acceleration due to gravity — yet this all happens in the tiny space of a tenth of a millimetre.
</div>

{{< score id="music276/31-shm-tuning-fork" caption="Example 1.1: Concert-pitch A4 (440 Hz) tuning fork — the paradigm of simple harmonic motion." >}}

### 1.2 Damping and Resonance

Real oscillating systems lose energy over time due to friction, air resistance, and internal material losses. The equation of motion for a *damped* harmonic oscillator is

\[
m\ddot{x} + b\dot{x} + kx = 0,
\]
where \(b\) is the *damping coefficient* (N·s/m). Defining the natural frequency \(\omega_0 = \sqrt{k/m}\) and the damping ratio \(\zeta = b/(2m\omega_0)\), the solution for an underdamped system (\(\zeta < 1\)) is

\[
x(t) = A e^{-\zeta\omega_0 t}\cos(\omega_d t + \phi), \quad \omega_d = \omega_0\sqrt{1 - \zeta^2}.
\]
The amplitude decays exponentially with time constant \(\tau = 1/(\zeta\omega_0) = 2m/b\). In acoustics, the decay rate of a resonator is often characterized by the *quality factor*

\[
Q = \frac{\omega_0}{2\zeta\omega_0} = \frac{m\omega_0}{b} = \frac{f_0}{\Delta f},
\]
where \(\Delta f\) is the half-power bandwidth of the resonance peak (the frequency range over which the response is within 3 dB of its maximum). Thus \(Q\) quantifies both temporal selectivity (how long the system rings) and spectral selectivity (how narrowly it responds in frequency): these are not independent properties but two faces of the same coin, related by the time-bandwidth product \(\Delta t \cdot \Delta f \approx Q/(\pi f_0) \cdot f_0/Q = 1/\pi\).

A high-\(Q\) resonator rings for a long time and has a very sharp frequency response; a low-\(Q\) resonator decays quickly and responds broadly. A guitar string may have \(Q \sim 1000\); a drum membrane \(Q \sim 10\); the ear canal resonance \(Q \sim 10\). The body of a violin, which must respond broadly enough to reinforce strings tuned to different pitches, has body resonances with \(Q \sim 20\)–50. In contrast, a tuning fork, designed to maintain a single precise frequency, has \(Q \sim 10{,}000\)–\(30{,}000\) depending on alloy and geometry.

When an external periodic force \(F(t) = F_0\cos(\omega_{\text{drive}} t)\) is applied, the system reaches a *forced steady-state* response at the driving frequency \(\omega_{\text{drive}}\):

\[
x_{\text{ss}}(t) = \frac{F_0/m}{\sqrt{(\omega_0^2 - \omega_{\text{drive}}^2)^2 + (b\omega_{\text{drive}}/m)^2}}\cos(\omega_{\text{drive}} t - \delta),
\]
where \(\delta = \arctan\!\bigl(b\omega_{\text{drive}}/m(\omega_0^2 - \omega_{\text{drive}}^2)\bigr)\) is the phase lag. The amplitude is maximized when \(\omega_{\text{drive}} \approx \omega_0\) — this is *resonance*. The sharpness of the resonance peak is governed by \(Q\): the frequency bandwidth at which the amplitude falls to \(1/\sqrt{2}\) of its peak value is \(\Delta\omega = \omega_0/Q\). Every musical instrument exploits resonance: the body of a guitar resonates at and near the string frequencies, efficiently transferring vibrational energy to the surrounding air.

### 1.3 The Wave Equation

Sound is not a local phenomenon — it is the propagation of mechanical disturbance through a medium. When a vibrating surface displaces the air immediately in contact with it, a chain reaction of compression and rarefaction propagates outward. The mathematical description of this propagation is the wave equation.

For a one-dimensional medium (a string, or a narrow tube of air), the transverse displacement \(y(x, t)\) satisfies

\[
\frac{\partial^2 y}{\partial t^2} = c^2 \frac{\partial^2 y}{\partial x^2},
\]

where \(c\) is the phase speed of the wave. The general solution (d'Alembert, 1747) is a superposition of a right-traveling wave and a left-traveling wave:

\[
y(x, t) = f(x - ct) + g(x + ct),
\]
for arbitrary (twice-differentiable) functions \(f\) and \(g\) determined by the initial conditions \(y(x, 0)\) and \(\partial_t y(x, 0)\). A purely sinusoidal solution takes the form

\[
y(x, t) = A\cos(kx - \omega t + \phi),
\]
where \(k = \omega/c = 2\pi/\lambda\) is the *wavenumber* and \(\lambda = c/f\) is the *wavelength*. At 440 Hz in air, \(\lambda = 343/440 \approx 0.78\) m — roughly the length of a standard ruler. At 20 Hz (the lower limit of hearing), \(\lambda \approx 17\) m; at 20 kHz (the upper limit), \(\lambda \approx 1.7\) cm.

In free air, sound waves are *longitudinal*: air molecules are displaced parallel to the direction of propagation, creating alternating regions of compression (elevated pressure) and rarefaction (reduced pressure). The three-dimensional wave equation governing the acoustic pressure fluctuation \(p(x, y, z, t)\) is

\[
\frac{\partial^2 p}{\partial t^2} = c^2 \nabla^2 p.
\]

<div class="remark">
The speed of sound in an ideal gas is given by

\[
c = \sqrt{\frac{\gamma P_0}{\rho_0}},
\]
where \(\gamma\) is the adiabatic index (\(\gamma \approx 1.4\) for diatomic air), \(P_0\) is the ambient pressure, and \(\rho_0\) is the ambient density. At \(20^\circ\)C and standard atmospheric pressure (\(101{,}325\) Pa), this gives \(c \approx 343\) m/s. The temperature dependence is approximately linear for modest deviations from room temperature:

\[
c(T) \approx 331 + 0.6\, T \text{ m/s},
\]
where \(T\) is in degrees Celsius. A wind instrument tuned at \(20^\circ\)C will be flat by roughly 0.3% (about 5 cents) if the player has not warmed the bore first, because \(c\) — and hence the resonant frequencies — scale with the speed of sound.
</div>

{{< score id="music276/03-octave-equivalence" caption="C at five octave registers (C2–C6): the same pitch class at frequencies 65, 131, 262, 523, and 1047 Hz." >}}

### 1.4 Sound Intensity and the Decibel Scale

The physical strength of a sound wave is measured by its *intensity*, defined as the average power transmitted per unit area perpendicular to the direction of propagation. For a plane wave in air with pressure amplitude \(p_0\), the intensity is

\[
I = \frac{p_0^2}{2\rho_0 c}.
\]
The human auditory system responds to an extraordinary range of intensities — from the threshold of hearing near \(I_0 = 10^{-12}\) W/m\(^2\) to the threshold of pain near \(1\)–\(10\) W/m\(^2\), a ratio exceeding \(10^{13}\). A linear scale is entirely impractical for this range; instead, we use a logarithmic one.

<div class="definition">
The <strong>sound pressure level</strong> (SPL) in decibels is defined as

\[
L = 10\log_{10}\!\left(\frac{I}{I_0}\right) \text{ dB},
\]
where \(I_0 = 10^{-12}\) W/m\(^2\) is the internationally agreed reference intensity. Since intensity is proportional to the square of pressure amplitude, the equivalent definition in terms of root-mean-square pressure \(p_{\text{rms}}\) is

\[
L = 20\log_{10}\!\left(\frac{p_{\text{rms}}}{p_0}\right) \text{ dB},
\]
where \(p_0 = 20\;\mu\text{Pa} = 2 \times 10^{-5}\) Pa is the reference pressure corresponding to \(I_0\).
</div>

{{< score id="music276/19-loudness-dynamics" caption="The same pitch (A4) notated at ppp, mp, and fff: different dynamic levels correspond to different sound pressure levels on the decibel scale." >}}

The logarithmic scale has several important properties. An increase of 10 dB corresponds to a tenfold increase in intensity. An increase of 3 dB (more precisely 3.01 dB) corresponds to a doubling of intensity. When two incoherent sound sources of levels \(L_1\) and \(L_2\) dB act simultaneously, the combined level is

\[
L_{\text{total}} = 10\log_{10}\!\left(10^{L_1/10} + 10^{L_2/10}\right).
\]
Two identical sources each at 70 dB combine to give 73 dB, not 140 dB — a consequence that surprises many students encountering acoustic addition for the first time.

Typical SPL values in musical contexts: a single violin playing pianissimo at 2 m is approximately 40–45 dB; a full symphony orchestra at fortissimo in the front seats is 100–105 dB; a rock concert near the speakers can reach 110–120 dB. The OSHA standard for safe continuous exposure is 90 dB over 8 hours; each 5 dB increase halves the permissible exposure time.

### 1.5 Equal-Loudness Contours

The decibel level tells us the physical intensity of a sound, but *loudness* is a perceptual quantity — it describes how intense a sound seems to a listener. The crucial insight of Harvey Fletcher and Wilden Munson (1933) is that the ear is not equally sensitive at all frequencies. The auditory system is most sensitive in the frequency range 1–5 kHz, where the outer ear canal resonance (around 3–4 kHz) provides a boost of up to 10–15 dB.

The *equal-loudness contours* (standardized as ISO 226:2023) map the combinations of frequency and SPL that are perceived as equally loud. Each contour is labeled in *phons*, where \(N\) phons at any frequency means the sound is as loud as a 1 kHz tone at \(N\) dB SPL.

{{< score id="music276/19-loudness-dynamics" caption="Loudness and dynamics: ppp, mp, fff on A4 — illustrating the SPL range relevant to the equal-loudness contours." >}}

<div class="remark">
At 30 phons, the equal-loudness contour passes through approximately 50 dB SPL at 100 Hz — meaning 50 dB of acoustic energy at 100 Hz sounds only as loud as 30 dB at 1 kHz. The ear requires roughly 20 dB more physical energy to achieve the same loudness at low bass frequencies. At very high levels (around 90 phons), the contours flatten considerably: bass frequencies are perceived as nearly as loud (relative to 1 kHz) as at low levels. This is the acoustic basis for the "loudness" switch on vintage hi-fi amplifiers, which boosted bass and treble at low listening volumes to compensate for the ear's reduced sensitivity.
</div>

{{< score id="music276/03-octave-equivalence" caption="Octave equivalence across C2–C6: the equal-loudness contours show how much more SPL is needed at low frequencies to match the loudness of mid-range tones." >}}

The *sone* is the unit of subjective loudness magnitude (not to be confused with loudness level in phons). By convention, 1 sone is defined as the loudness of a 1 kHz tone at 40 dB SPL. A doubling of sones corresponds to a doubling of perceived loudness, which empirically requires an increase of approximately 10 phons. The relationship is approximately

\[
S = 2^{(L_p - 40)/10},
\]
where \(L_p\) is the loudness level in phons and \(S\) is loudness in sones. Thus 50 phons \(\approx 2\) sones; 60 phons \(\approx 4\) sones; 70 phons \(\approx 8\) sones.

---

## Chapter 2: The Harmonic Series and Timbre

{{< score id="music276/02-pure-tone-vs-complex" caption="Pure tone vs. complex tone: upper staff shows C4 alone (262 Hz, a single sinusoid); lower staff shows C4 with harmonics 2–5 — the complex tone has timbre, the pure tone has none." >}}

If Chapter 1 gives us the physics of a single sinusoidal tone, Chapter 2 confronts a central fact of musical reality: almost no musical sound is a pure sinusoid. The rich, distinctive quality of a violin versus an oboe, of a bright trumpet versus a mellow French horn, cannot be encoded in a single frequency. It lives in the *structure* of the sound's component frequencies — in the harmonic series and the distribution of energy among its members. Fourier's theorem tells us that this description is not just convenient but mathematically complete.

### 2.1 Fourier's Theorem

<div class="theorem">
<strong>Fourier's Theorem.</strong> Any periodic function \(s(t)\) with fundamental period \(T_0 = 1/f_1\) that satisfies the Dirichlet conditions (finitely many discontinuities and extrema in any period, and absolute integrability over one period) can be represented as a convergent sum of sinusoids:

\[
s(t) = \frac{a_0}{2} + \sum_{n=1}^{\infty} \left[ a_n \cos(2\pi n f_1 t) + b_n \sin(2\pi n f_1 t) \right],
\]
where the Fourier coefficients are

\[
a_n = \frac{2}{T_0}\int_0^{T_0} s(t)\cos(2\pi n f_1 t)\, dt, \quad b_n = \frac{2}{T_0}\int_0^{T_0} s(t)\sin(2\pi n f_1 t)\, dt.
\]
In amplitude-phase form, this is equivalently

\[
s(t) = \sum_{n=1}^{\infty} A_n \cos(2\pi n f_1 t + \phi_n),
\]
where \(A_n = \sqrt{a_n^2 + b_n^2}\) is the amplitude of the \(n\)th harmonic and \(\phi_n = \arctan(-b_n/a_n)\) is its phase.
</div>

{{< score id="music276/01-harmonic-series" caption="The harmonic series on C2: partials 1–8 notated with their frequencies and ratios, from bass through treble clef." >}}

The integer \(n\) indexes the *harmonics* of the fundamental frequency \(f_1\): the \(n\)th harmonic has frequency

\[
f_n = n f_1, \quad n = 1, 2, 3, \ldots
\]
The set \(\{f_1, 2f_1, 3f_1, 4f_1, \ldots\}\) is the *harmonic series*. The first harmonic (\(n = 1\)) is the fundamental; the second (\(n = 2\)) is the octave; the third (\(n = 3\)) is the perfect twelfth (octave plus fifth); the fourth (\(n = 4\)) is the double octave; the fifth (\(n = 5\)) is a major third above the double octave; and so on. Musicians have recognized the special consonance of these ratios intuitively for millennia — the harmonic series is the acoustic origin of just intonation.

{{< score id="music276/11-overtone-chord" caption="The first six partials of C2 voiced as a chord across grand staff: partials 1–3 in bass clef, partials 4–7 in treble clef." >}}

<div class="example">
<strong>Example 2.1.</strong> A sawtooth wave with fundamental frequency \(f_1\) and unit amplitude has the Fourier series

\[
s(t) = \frac{2}{\pi}\sum_{n=1}^{\infty} \frac{(-1)^{n+1}}{n}\sin(2\pi n f_1 t),
\]
so \(A_n = 2/(\pi n)\). The amplitude spectrum falls as \(1/n\) (equivalently, \(-6\) dB per octave). The sawtooth approximates the spectrum of many bowed string and brass instrument tones, where energy decreases steadily with harmonic number. A square wave, by contrast, contains only odd harmonics with amplitudes \(1/n\) for \(n = 1, 3, 5, \ldots\), producing a characteristic hollow timbre.
</div>

{{< score id="music276/30-sawtooth-spectrum" caption="Example 2.1: Sawtooth spectrum — harmonic amplitudes falling as 1/n, shown as noteheads at successive octave/fifth levels." >}}

### 2.2 Timbre and the Spectral Envelope

The sequence \(\{A_n\}\) of harmonic amplitudes is the *amplitude spectrum* of the sound. The *timbre* of a steady-state periodic tone is determined primarily by the shape of this spectrum — specifically by the *spectral envelope*, the smooth curve interpolating the peaks \(A_n\) as a function of frequency \(nf_1\). Two tones with the same fundamental frequency but different spectral envelopes will have the same pitch but very different timbres.

The *mel-frequency cepstral coefficients* (MFCCs) are one widely used mathematical representation of the spectral envelope that is motivated by auditory physiology. The cepstrum of a signal is the inverse Fourier transform of the log-magnitude spectrum:

\[
c(n) = \mathcal{F}^{-1}\!\left\{\log\left|\hat{S}(f)\right|\right\},
\]
and the MFCCs are the first dozen or so coefficients of the cepstrum computed on a mel-frequency scale (a perceptually motivated frequency scale that is approximately linear below 1 kHz and logarithmic above). MFCCs are the dominant feature representation in automatic speech recognition and music classification systems, and they capture timbre more compactly and robustly than the raw amplitude spectrum.

<div class="remark">
The phases \(\phi_n\) play a surprisingly minor role in the perception of steady-state timbre for natural sounds. Plomp and Steeneken (1969) demonstrated that randomly shuffling the phases of harmonics — which drastically changes the waveform's shape — produced tones judged as having virtually identical timbre to the original. This <em>phase insensitivity</em> of timbre (for sustained, noise-free tones) means the amplitude spectrum is the primary perceptual description of steady-state timbre. The situation is different for transient sounds or for waveforms with sharp features, where phase relationships can influence perceived harshness or roughness.
</div>

{{< score id="music276/17-spectral-envelope" caption="Spectral envelope sketch: harmonic amplitudes as noteheads at H1–H6, notehead size representing relative amplitude (forte to ppp)." >}}

{{< score id="music276/16-timbre-same-pitch" caption="Timbre comparison: A4 (440 Hz) as played by violin, clarinet, and flute — same pitch, different harmonic envelopes." >}}

Different instrument families have characteristic spectral shapes. The *clarinet* in its chalumeau register suppresses even harmonics (for reasons we will explain in Chapter 4), giving a spectrum dominated by the odd harmonics \(f_1, 3f_1, 5f_1, \ldots\) — a hollow, reedy quality. The *trumpet* at fortissimo has a brilliantly rich spectrum with significant energy in harmonics 10–20, produced by nonlinear wave steepening in the bore at high amplitudes. The *flute* at soft dynamic levels has a spectrum dominated by the fundamental with comparatively little energy in the upper harmonics — a cool, pure quality. The *oboe* has a highly complex spectrum with strong harmonics 3–8 relative to the fundamental, contributing to its penetrating nasal character.

### 2.3 Transient Timbre and the ADSR Envelope

Steady-state timbre — the spectrum of the sustained portion of a note — is only part of the story. The *attack transient*, the first few tens of milliseconds of a sound, carries disproportionate perceptual weight. In classic experiments (Grey, 1977), listeners who heard instrument tones with the attack portions removed or spliced onto mismatched sustained tones identified instruments far less accurately than with intact tones. When the attack of a piano was prepended to the sustained body of a harpsichord tone, listeners most often identified the sound as a piano — the attack dominated perception.

The amplitude envelope of a musical tone is often modeled in synthesis and electroacoustic contexts by the four-stage *ADSR* model.

<div class="definition">
The <strong>ADSR envelope</strong> decomposes the amplitude trajectory of a musical note into four stages:
<ul>
<li><strong>Attack</strong> (duration \(t_A\)): amplitude rises from 0 to its peak value \(A_{\max}\).</li>
<li><strong>Decay</strong> (duration \(t_D\)): amplitude falls from \(A_{\max}\) to the sustain level \(A_S\).</li>
<li><strong>Sustain</strong> (level \(A_S\)): amplitude remains at \(A_S\) while the key or note is held.</li>
<li><strong>Release</strong> (duration \(t_R\)): amplitude falls from \(A_S\) back to 0 after the note is released.</li>
</ul>
A simplified piecewise-linear model is:

\[
E(t) = \begin{cases}
A_{\max}\, t/t_A & 0 \le t < t_A \\
A_{\max} - (A_{\max} - A_S)(t - t_A)/t_D & t_A \le t < t_A + t_D \\
A_S & t_A + t_D \le t < t_{\mathrm{off}} \\
A_S\bigl(1 - (t - t_{\mathrm{off}})/t_R\bigr) & t_{\mathrm{off}} \le t < t_{\mathrm{off}} + t_R.
\end{cases}
\]
</div>

A piano note has an extremely short attack (a few milliseconds), a rapid decay, effectively zero sustain (the hammer rebounds immediately from the string), and a long natural decay determined by string damping. A bowed string can maintain indefinite sustain and shape the release deliberately with a diminuendo. A pipe organ can maintain perfectly flat sustain (as long as the key is held and the bellows supply sufficient air pressure) with an essentially instantaneous release. These envelope differences are perceptually decisive in shaping the expressive character of each instrument.

{{< score id="music276/32-adsr-piano-vs-organ" caption="ADSR envelopes contrasted: piano (rapid decay shown as diminuendo) versus organ (sustained flat level) on the same pitch C4." >}}

### 2.4 Spectrograms and Time-Frequency Analysis

The spectrogram is the standard tool for visualizing how the spectrum of a sound evolves in time. It displays time on the horizontal axis, frequency on the vertical axis, and intensity (in dB) as a color or gray value at each point. Formally, the spectrogram is derived from the *short-time Fourier transform* (STFT):

\[
\mathrm{STFT}(t, f) = \int_{-\infty}^{\infty} s(\tau)\, w(\tau - t)\, e^{-2\pi i f \tau}\, d\tau,
\]

where \(w\) is a window function (commonly a Hann, Hamming, or Gaussian window) that localizes the analysis around time \(t\). The spectrogram is

\[
\mathcal{S}(t, f) = \left|\mathrm{STFT}(t, f)\right|^2.
\]

There is a fundamental *time-frequency uncertainty* in any spectrogram: a narrow time window gives good time resolution but poor frequency resolution, while a wide window gives good frequency resolution but poor time resolution. Formally, the time resolution \(\Delta t\) and frequency resolution \(\Delta f\) satisfy

\[
\Delta t \cdot \Delta f \ge \frac{1}{4\pi},
\]
with equality for a Gaussian window. In practice, a window of 20 ms gives a frequency resolution of roughly 50 Hz — adequate for separating harmonics of a low note but merging the harmonics of a high note. Spectrograms of music reveal the onset and decay of individual notes, the presence of vibrato (a periodic frequency modulation that appears as a wavy harmonic track), and the formant structure of the voice.

---

## Chapter 3: Acoustics of String and Keyboard Instruments

The vibrating string is among the most ancient and universal of musical sound sources, and it is also among the most tractable analytically. The physics of the ideal string leads directly to the harmonic series, explaining why plucked and bowed string instruments blend so naturally with one another and with the voice. The departure from the ideal — through string stiffness, bridge coupling, and soundboard resonances — is where the distinctive character of individual keyboard instruments emerges.

### 3.1 Modes of the Ideal Vibrating String

Consider a string of length \(L\), tension \(T\) (in newtons), and linear mass density \(\mu\) (mass per unit length, in kg/m), fixed at both ends. The transverse displacement \(y(x, t)\) satisfies the one-dimensional wave equation with wave speed

\[
c_s = \sqrt{\frac{T}{\mu}}.
\]
The boundary conditions \(y(0, t) = 0\) and \(y(L, t) = 0\) (fixed ends) restrict the allowed solutions to standing waves with nodes at both ends:

\[
y_n(x, t) = A_n\sin\!\left(\frac{n\pi x}{L}\right)\cos(2\pi f_n t + \phi_n), \quad n = 1, 2, 3, \ldots
\]

<div class="theorem">
The <strong>modal frequencies</strong> of an ideal, perfectly flexible string of length \(L\), tension \(T\), and linear density \(\mu\) fixed at both ends are

\[
f_n = \frac{n}{2L}\sqrt{\frac{T}{\mu}}, \quad n = 1, 2, 3, \ldots
\]
These are exact integer multiples of the fundamental \(f_1 = \frac{1}{2L}\sqrt{T/\mu}\), so the ideal string produces a perfectly harmonic spectrum.
</div>

{{< score id="music276/01-harmonic-series" caption="Modal frequencies of an ideal string: the harmonic series C2 through its 8th partial, mirroring the string's overtone structure." >}}

The mode shapes \(\sin(n\pi x/L)\) are the normal modes of the string: the first mode has no internal nodes (maximum displacement at the center); the second mode has one node at the center; the \(n\)th mode has \(n-1\) internal nodes. The general motion is a superposition of all modes, with coefficients determined by the initial shape and velocity of the string (i.e., where and how the string was plucked, struck, or bowed).

<div class="example">
<strong>Example 3.1.</strong> A guitar string (open \(A\)) has length \(L = 0.65\) m, tension \(T = 70\) N, and linear density \(\mu = 3.5 \times 10^{-3}\) kg/m. Its fundamental frequency is

\[
f_1 = \frac{1}{2 \times 0.65}\sqrt{\frac{70}{3.5 \times 10^{-3}}} = \frac{1}{1.30}\sqrt{20{,}000} \approx \frac{141.4}{1.30} \approx 108.8 \text{ Hz} \approx A_2.
\]
Depressing the string at the fifth fret reduces the effective length to \(L' \approx 0.488\) m, raising the frequency by a factor of \(0.65/0.488 \approx 1.333 = 4/3\), corresponding to a perfect fourth — just as the fret positions on a guitar approximate the ratios of just intonation.
</div>

{{< score id="music276/07-just-intonation-scale" caption="Just intonation scale: C major with ratio annotations 1/1 through 2/1, illustrating the fret-ratio relationship." >}}

The formula \(f_n = \frac{n}{2L}\sqrt{T/\mu}\) encodes the three classical means of controlling pitch: length (stopping), tension (tuning pegs, capo), and linear density (wound strings for bass). A string twice as long, at equal tension and density, vibrates one octave lower. A string under twice the tension vibrates \(\sqrt{2}\) times faster — roughly a tritone (six semitones) higher in equal temperament.

### 3.2 Inharmonicity and Piano Tuning

Real strings are not perfectly flexible — they have *bending stiffness*, which adds a restoring force proportional to the curvature of the string rather than its tension. This stiffness raises each partial above its ideal position by an amount that grows with harmonic number.

<div class="theorem">
For a string with bending stiffness characterized by the dimensionless <strong>inharmonicity coefficient</strong>

\[
B = \frac{\pi^3 E d^4}{64 T L^2},
\]
where \(E\) is Young's modulus of the string material and \(d\) is the string diameter, the \(n\)th partial frequency is approximately

\[
f_n \approx n f_1 \sqrt{1 + B n^2}.
\]
For small \(B\), this is approximately \(f_n \approx n f_1 (1 + \frac{1}{2}Bn^2)\), so the \(n\)th partial is raised above the ideal harmonic position by the fraction \(\frac{1}{2}Bn^2\).
</div>

For typical piano treble strings, \(B \sim 10^{-4}\); for bass strings wound with copper or steel, \(B\) can reach \(10^{-3}\) or even \(10^{-2}\). For the lowest bass notes on a concert grand, the inharmonicity is large enough that the 16th partial may be 60–80 cents sharper than the ideal 16th harmonic — more than half a semitone.

This inharmonicity creates the phenomenon of *octave stretch* in piano tuning. Because the second partial of note \(A_3\) is somewhat sharper than exactly twice the fundamental of \(A_3\), tuning \(A_4\) so that its fundamental coincides with that raised second partial gives an \(A_4\) that is slightly higher than exactly twice the frequency of \(A_3\). This effect accumulates across the full range, so a well-tuned piano has its highest notes about 30–40 cents sharper, and its lowest notes about 30 cents flatter, than strict equal temperament would specify. Octave stretch is not an error — it is what makes a piano sound in tune with itself.

### 3.3 Wolf Tones and Body Resonances in Bowed Instruments

The interaction between string and instrument body is not always benign. In bowed string instruments, when a string's modal frequency coincides closely with a strong body resonance, the result can be a *wolf tone*: a note that refuses to sustain steadily, instead wavering and "howling" between two nearby pitches. The physical mechanism is a coupling instability between the string (driven by the bow) and the body resonator: energy transfers back and forth between the two resonators at a rate comparable to the bowing frequency, causing the amplitude to fluctuate at low frequency.

The wolf tone most commonly appears on cellos around E3–F3 (approximately 165–175 Hz), where a strong body resonance (the "main body" or "main air" mode) coincides with a string fundamental. Cellists manage the wolf tone through a combination of subtle bowing technique (adjusted bow speed and pressure), the use of a *wolf suppressor* (a small metal cylinder with a piece of felt, clamped to the after-length of the G string to detune the string's secondary resonance and shift the coupling away from the wolf frequency), and instrument selection (some instruments are worse than others depending on the exact coincidence of body modes and string pitches).

### 3.4 Coupling, Soundboards, and Instrument Families

The string alone radiates very little sound: its cross-sectional diameter is far too small to push air efficiently, and the acoustic radiation resistance of a string-diameter object at audio frequencies is negligible. The *bridge* transfers the string's vibrational energy to a much larger radiating surface — the *soundboard* (in guitars and violins) or the *rim and back plates* (in pianos).

The bridge is not a passive transmission element but an active filter: its mechanical impedance, which varies strongly with frequency, shapes how efficiently the string loses energy at each partial. A string coupled to a bridge loses energy most rapidly at frequencies near the bridge resonances, which shortens the sustain at those frequencies. The ideal bridge has an impedance high enough that the string vibrates freely (low energy loss per cycle, long sustain) but low enough that sufficient power flows to the soundboard to produce adequate volume — a compromise that Stradivari and the great violin makers resolved empirically through centuries of experiment.

<div class="remark">
The harpsichord, clavichord, and piano all use strings and a soundboard, but their excitation mechanisms differ fundamentally in ways that shape their spectra and expressive capabilities. The <strong>harpsichord</strong> plucks the string with a quill or plastic plectrum that snaps past the string tangentially; the string's initial displacement (triangular shape) produces a spectrum rich in high harmonics regardless of key velocity, giving the harpsichord its bright, clangorous attack and limited dynamic range. The <strong>clavichord</strong> uses a metal tangent that strikes the string from below and remains in contact as long as the key is depressed; this permits the player to subtly modulate pitch and amplitude through key pressure (the <em>Bebung</em> effect), but the volume is so small that the instrument is only audible in very quiet rooms. The <strong>piano</strong> (pianoforte, literally "soft-loud") strikes the string with a felt hammer that immediately rebounds; the softness and shape of the felt, combined with hammer velocity, control the balance of high and low harmonics and the overall amplitude, giving the piano its unrivaled dynamic range.
</div>

{{< score id="music276/32-adsr-piano-vs-organ" caption="Attack-decay contrast: piano (fast decay) vs. organ (flat sustain) — illustrating the keyboard instruments' opposite ADSR profiles." >}}

---

## Chapter 4: Acoustics of Wind and Brass Instruments

Wind instruments produce their tones by establishing standing-wave resonances in a column of air. Unlike strings, where the resonator and radiation mechanism are distinct, in wind instruments the air column is both the resonator and — through its open end or bell — the primary radiator. The bore geometry determines which resonant frequencies are excited and which notes and timbres are available to the player.

### 4.1 Standing Waves in Cylindrical Pipes

Consider a rigid cylindrical pipe of length \(L\) containing air at speed of sound \(c\). The acoustic pressure \(p(x, t)\) satisfies the one-dimensional wave equation. The boundary conditions at each end depend on whether it is open (pressure node: \(p = 0\)) or closed (velocity node, equivalently pressure antinode: \(\partial p/\partial x = 0\)).

<div class="theorem">
For an <strong>open-open</strong> cylindrical pipe (open at both ends), the resonant frequencies form a complete harmonic series:

\[
f_n = \frac{nc}{2L}, \quad n = 1, 2, 3, \ldots
\]
For a <strong>closed-open</strong> pipe (rigidly closed at one end, open at the other), only odd harmonics are supported:

\[
f_n = \frac{(2n-1)\,c}{4L}, \quad n = 1, 2, 3, \ldots
\]
The fundamental of the closed-open pipe (\(f_1 = c/4L\)) is half that of the open-open pipe of the same length, so the closed-open pipe "sounds" an octave lower than an open pipe of equal length.
</div>

{{< score id="music276/33-pipe-modes" caption="Open vs. closed pipe modes: open pipe supports f₁, 2f₁, 3f₁ (all harmonics); closed pipe supports only f₁, 3f₁, 5f₁ (odd harmonics only)." >}}

In real pipes, the open end is not a perfect pressure node — the effective acoustic length of the pipe is slightly longer than the physical length, because the acoustic field extends a short distance beyond the open end before it can radiate freely. This *end correction* is approximately \(\Delta L \approx 0.6\, a\), where \(a\) is the radius of the pipe. For a clarinet with bore radius \(a \approx 7\) mm, the end correction adds approximately 4 mm to the effective length — a small but acoustically significant amount that must be accounted for in the design of fingering systems.

### 4.2 The Flute and the Clarinet

The *flute* is an open-open cylindrical pipe: the embouchure hole acts as one open end, and the foot joint (or the first open tone hole) acts as the other. It therefore supports all harmonics and overblows at the octave (moving from first to second register by increasing air speed). The flute's spectrum, particularly in the low and middle register, is dominated by the fundamental and the second harmonic, giving its characteristic pure and cool tone.

The *clarinet* behaves acoustically as a closed-open pipe in its fundamental (chalumeau) register: the reed end is a nearly rigid pressure antinode, and the first open tone hole (or the bell) acts as an open end. It therefore supports only odd harmonics (\(f_1, 3f_1, 5f_1, \ldots\)) and overblows at the twelfth — the interval of an octave plus a fifth — corresponding to the jump from the fundamental to the third harmonic \(3f_1\). This is why the clarinet has three distinct registers (chalumeau, clarion, altissimo) rather than the two of most other woodwinds, and why the gap between the high chalumeau and low clarion registers (the so-called "break") requires a different fingering strategy.

<div class="example">
<strong>Example 4.1.</strong> A B-flat clarinet has a sounding length of approximately \(L \approx 0.595\) m in its lowest register. As a closed-open pipe:

\[
f_1 = \frac{c}{4L} = \frac{343}{4 \times 0.595} \approx 144 \text{ Hz}.
\]
Accounting for the instrument's transposition (B-flat instruments sound a major second lower than written), the concert pitch fundamental is near \(D_3\) (147 Hz), consistent with the actual lowest note of the standard clarinet. The lowest odd partial above the fundamental is at \(3 \times 144 \approx 432\) Hz, which corresponds (after transposition) to approximately A\(_4\) — and indeed, the lowest note of the clarion register is written B\(_4\) (concert A\(_4\)).
</div>

{{< score id="music276/33-pipe-modes" caption="Example 4.1: Clarinet as closed-open pipe — fundamental and odd overtones (f₁, 3f₁, 5f₁) correspond to chalumeau, clarion, and altissimo registers." >}}

### 4.3 Brass Instruments: Impedance and the Bell

Brass instruments are neither simple open nor simple closed pipes — they are complex hybrids of cylindrical and conical tubing, widening to a dramatically flared bell. The acoustic behavior is most naturally described through the *input impedance* \(Z_{\mathrm{in}}(f)\), the ratio of acoustic pressure to volume velocity at the mouthpiece. High impedance peaks correspond to frequencies at which the mouthpiece pressure builds up most efficiently — these are the resonant frequencies that the player can "lock on to" with the lip reed.

The *bell* of a brass instrument transforms the impedance curve in two crucial ways. First, it raises the *cutoff frequency* \(f_c\) above which the impedance peaks flatten out and sound radiates efficiently outward; at frequencies below \(f_c\), energy is largely reflected at the bell and remains in the resonator. Second — and more importantly for musical usability — the curved taper of the bell corrects the otherwise non-harmonic spacing of the impedance peaks of a simple truncated cone, pushing them toward an even harmonic series. The player can thus play the entire harmonic series with predictable, musically useful pitches.

<div class="remark">
A purely conical tube, open at both ends, supports all harmonics (just like an open cylindrical pipe), which is why the oboe and saxophone (both conical) overblow at the octave and support complete harmonic series. The <em>French horn</em> and <em>trombone</em> are dominantly cylindrical with a flared bell, while the <em>trumpet</em> has a more complex profile combining a cylindrical bore with a conical leadpipe and a strongly flared bell. The detailed shaping of these transitions — every millimetre of the leadpipe profile and every arc of the bell taper — is the accumulated craft knowledge of centuries of brass instrument making, now subject to computational optimization using finite element and transmission line acoustic models.
</div>

{{< score id="music276/01-harmonic-series" caption="The complete harmonic series as played by a brass instrument: partials 1–8 of C2 from fundamental through the 8th overtone." >}}

### 4.4 The Lip Reed and Embouchure

The air column resonances do not self-oscillate — they must be driven by the player's *lip reed*. In brass instruments, the player's lips are pressed against the mouthpiece cup and form a valve that opens and closes in synchrony with the pressure oscillations in the mouthpiece. This is a *regenerative feedback* system: the pressure peak in the mouthpiece pushes the lips apart, admitting a pulse of high-velocity air; the subsequent pressure trough tends to close the lips; and the cycle repeats at the resonant frequency of the air column.

The lips behave as an *outward-striking reed* (opening when mouthpiece pressure is high), which is the appropriate valve type to maintain oscillation at a pressure impedance peak. By adjusting lip tension (via embouchure muscles), the player shifts the natural resonant frequency of the lip system. When the lip resonance is near one of the air-column impedance peaks, the two resonators couple and the system oscillates stably at that frequency. Moving from one note to another in a harmonic series requires the player to shift lip tension to the neighborhood of the next impedance peak, a skill developed through years of practice.

The *mouthpiece* plays a specific acoustic role beyond simply holding the lips in place. The mouthpiece cup volume acts as a Helmholtz resonator in conjunction with the backbore, creating a strong resonance (the "popping frequency") in the range 500–900 Hz. This resonance, positioned between the second and third harmonics of the instrument's playable range, helps the player lock onto notes in the upper register and contributes to the characteristic "bite" and projection of the brass tone. Different mouthpiece depths and cup volumes shift this resonance, and players adjust mouthpiece choice to suit their embouchure and preferred register range.

### 4.5 Woodwind Tone Hole Acoustics

In woodwind instruments, the pitch is controlled primarily by opening and closing *tone holes* — openings in the bore that effectively terminate the resonating air column at the position of the first open hole. When a tone hole is open, the acoustic pressure is approximately zero at that location (open boundary condition), shortening the effective resonating length. When all tone holes are closed, the full tube length resonates at the lowest note.

The acoustic effect of a single open tone hole is not a perfect pressure node — the hole has finite size and its acoustic behavior depends on the ratio of hole diameter to bore diameter and on the height of the chimney (the tube connecting the hole opening to the interior of the bore). For a hole of radius \(a_h\) and chimney height \(t\), the acoustic length correction provided by the open hole (the amount by which it shortens the effective bore length) is approximately

\[
\Delta L \approx \frac{a^2}{a_h^2}\left(t + 0.7 a_h\right),
\]
where \(a\) is the bore radius at the hole location. Larger holes give shorter length corrections (more effective cutoff), while smaller holes are less effective at terminating the bore. In the saxophone, the large tone holes (approaching the bore diameter) are extremely effective and give excellent octave behavior; in the baroque flute, the smaller holes produce significant length corrections and require careful adjustment of finger position and embouchure to achieve correct intonation.

---

## Chapter 5: Percussion and the Human Voice

The previous chapters dealt with one-dimensional resonators — strings and tubes — whose modes are harmonic or nearly so. Percussion instruments introduce richer geometry: the two-dimensional membrane and the three-dimensional plate or bell. The modes of these systems are generally not harmonic. The human voice is in a category of its own: it uses a biological source-filter system to produce the extraordinarily nuanced and flexible timbres of speech and singing.

### 5.1 Vibrating Circular Membranes

A circular membrane of radius \(a\), surface tension \(\sigma\) (N/m), and surface mass density \(\sigma_s\) (kg/m\(^2\)) vibrates according to the two-dimensional wave equation in polar coordinates \((r, \theta)\):

\[
\frac{\partial^2 z}{\partial t^2} = c_m^2 \left(\frac{\partial^2 z}{\partial r^2} + \frac{1}{r}\frac{\partial z}{\partial r} + \frac{1}{r^2}\frac{\partial^2 z}{\partial \theta^2}\right), \quad c_m = \sqrt{\frac{\sigma}{\sigma_s}}.
\]
The normal modes are separable in \((r, \theta)\) and are given by products of Bessel functions and trigonometric functions:

\[
z_{mn}(r, \theta, t) = J_m\!\left(\frac{z_{mn}^{(m)}}{a}\, r\right)\cos(m\theta + \psi_{mn})\cos(2\pi f_{mn} t + \varphi_{mn}),
\]
where \(J_m\) is the Bessel function of the first kind of order \(m\), and \(z_{mn}^{(m)}\) is the \(n\)th positive zero of \(J_m\).

<div class="theorem">
The <strong>modal frequencies</strong> of a circular membrane of radius \(a\) with fixed boundary conditions (\(z = 0\) at \(r = a\)) are

\[
f_{mn} = \frac{z_{mn}^{(m)}}{2\pi a}\, c_m, \quad m = 0, 1, 2, \ldots;\; n = 1, 2, 3, \ldots
\]
The first few Bessel zeros are \(z_{01}^{(0)} \approx 2.405\), \(z_{11}^{(1)} \approx 3.832\), \(z_{21}^{(2)} \approx 5.136\), \(z_{02}^{(0)} \approx 5.520\). The ratios of modal frequencies to the lowest mode are approximately \(1 : 1.594 : 2.136 : 2.295 : 2.653 : \ldots\) — entirely non-harmonic.
</div>

This non-harmonicity is why a simple drum does not produce a clearly defined musical pitch. The ear, hearing inharmonic partials that do not fit a common fundamental, does not assign a definite pitch sensation (or assigns one only vaguely based on the lowest mode).

### 5.2 Tuned Percussion

Despite the inherent inharmonicity of membranes and plates, many percussion instruments produce clear pitches. The solution in each case is to use the physical system to bring certain modes into harmonic (or approximately harmonic) ratios while suppressing or damping the remaining inharmonic ones.

The *timpani* (kettledrum) is the classic example. The air cavity enclosed by the kettle below the drumhead couples to the membrane, shifting several of the lower \((1,n)\) and \((2,n)\) modes upward so that their frequencies approximate the ratios 1 : 1.5 : 2 : 2.5 — a harmonic-like series that gives the timpani its characteristic definite pitch. The player also deliberately strikes the head at roughly one-quarter of the diameter from the rim, which preferentially excites the \((1,1)\) mode (which participates in the near-harmonic series) while suppressing the \((0,1)\) mode (which does not).

The *marimba bar* achieves tuning through geometry: the wooden bar is undercut in a curved arch along its underside. By adjusting the depth and shape of this arch, the maker can precisely control the frequency of the second transverse mode, pulling it to exactly four times the fundamental (two octaves above). This gives the marimba its characteristic warm, pure tone — the ear hears two harmonically related partials and fuses them into a single rich, pitched percept. The *vibraphone* uses a similar undercut to tune the second partial to three times the fundamental (a twelfth), and additionally employs resonating tubes and a motor-driven vane system to produce vibrato.

### 5.3 Bells and Inharmonic Spectra

Orchestral bells (tubular bells, orchestral chimes) and cup bells (church bells, handbells) produce tones with approximately harmonic partial structures achieved through their three-dimensional geometry rather than through deliberate undercuts. A church bell's partials — the hum, prime, tierce, quint, nominal, and superquint — are tuned through centuries of foundry craft to approximate specific intervals, giving the bell a complex but recognizable pitch identity.

The *hum tone* of a bell is approximately one octave below the *prime*, which defines the perceived pitch. The *tierce* is a minor third above the prime; the *quint* is a fifth above; the *nominal* is an octave above the prime. Modern bell founders verify and adjust these partials by selectively removing metal from specific regions of the bell's inner surface, a process called *tuning* that requires both acoustic measurement and experienced craftsmanship.

### 5.4 The Human Voice: Source-Filter Model

The voice is perhaps the most sophisticated acoustic instrument in existence. Gunnar Fant's *source-filter model* (1960) provides the theoretical framework for understanding vocal sound production.

<div class="definition">
In Fant's <strong>source-filter model</strong> of voice production, the radiated speech spectrum is the product of three components:

\[
\hat{S}(f) = \hat{U}_g(f)\cdot H(f)\cdot R(f),
\]
where:
<ul>
<li>\(\hat{U}_g(f)\) is the Fourier spectrum of the <em>glottal volume velocity waveform</em> — the airflow through the vibrating vocal folds. Its spectrum has energy at the fundamental frequency \(F_0\) and all harmonics \(nF_0\), falling off at approximately \(-12\) dB/octave above \(F_0\).</li>
<li>\(H(f)\) is the <em>vocal tract transfer function</em>, characterizing the resonant filtering of the vocal tract cavity between glottis and lips. Its peaks are the <em>formants</em>.</li>
<li>\(R(f) \propto f^2\) is the <em>radiation characteristic</em> of the lips, which act as a small acoustic monopole source (+6 dB/octave).</li>
</ul>
</div>

{{< score id="music276/17-spectral-envelope" caption="Source-filter model illustration: the glottal source has harmonics at f₀, 2f₀, … with falling amplitude; the vocal tract formants shape the spectral envelope." >}}

The vocal tract resonances — *formants* — are denoted \(F_1, F_2, F_3, \ldots\) in ascending order. For a uniform tube of length \(L_{vt} \approx 17\) cm (adult male), treating it as closed-open:

\[
F_n \approx \frac{(2n-1)c}{4 L_{vt}}, \quad n = 1, 2, 3, \ldots
\]
giving \(F_1 \approx 500\) Hz, \(F_2 \approx 1500\) Hz, \(F_3 \approx 2500\) Hz. Real vocal tract shapes, modified by tongue, jaw, lip, and velum movements, shift these formant frequencies to cover a wide range.

*Vowel identity* is determined primarily by the positions of the first two formants \((F_1, F_2)\) in the acoustic space. The vowel /a/ (as in "father") has high \(F_1 \approx 700\)–800 Hz and relatively low \(F_2 \approx 1100\)–1200 Hz. The vowel /i/ (as in "see") has low \(F_1 \approx 270\)–300 Hz and very high \(F_2 \approx 2200\)–2300 Hz. The vowel /u/ (as in "moon") has low \(F_1\) and low \(F_2\). These \((F_1, F_2)\) coordinates define the *vowel space*, and the entire vowel inventory of a language can be visualized as a set of points in this two-dimensional plane.

### 5.5 Formants in the Singing Voice: Soprano and Vowel Modification

An important additional complication arises for soprano singers, who sing at fundamental frequencies (\(F_0\)) that may exceed \(F_1\) for certain vowels. The vowel /a/ has \(F_1 \approx 800\) Hz; a soprano singing A5 (880 Hz) has \(F_0 > F_1\), meaning that the first harmonic (the fundamental) lies above the first formant. In this situation, the harmonic nearest to \(F_1\) is the fundamental itself, and the vocal tract amplification of the fundamental is determined by how close \(F_0\) is to \(F_1\).

Sopranos routinely modify their vowels — adjusting tongue height, jaw opening, and lip configuration — to keep a vocal tract formant aligned with the fundamental or with one of the lower harmonics, maximizing vocal power at high pitches even at the cost of vowel intelligibility. The phenomenon, known as *formant tuning*, results in the characteristic indistinctness of soprano vowels above about E5 (659 Hz): the perceptual identity of the vowel is sacrificed for loudness and ease of production at high pitch. This is an acoustic constraint that every composer writing high soprano lines must understand.

### 5.6 The Singer's Formant and Vocal Acoustics

Classical singers — particularly tenors, baritones, and basses — develop a characteristic *singer's formant*: a broad spectral peak centered near 2500–3500 Hz, arising from the clustering of the third, fourth, and sometimes fifth formants. By adjusting the larynx height (lowering it, which lengthens the pharynx) and the geometry of the laryngeal tube, skilled singers can bring \(F_3\), \(F_4\), and \(F_5\) close together in frequency, creating a single broad high-amplitude peak in the vocal transfer function \(H(f)\).

This boost of 10–15 dB in the 2.5–3 kHz range allows the operatic voice to project over a full orchestral accompaniment in a large opera house. The orchestra's long-term average spectrum has a centroid well below 2 kHz; the 2.5–3 kHz region is relatively unoccupied. The singer's formant exploits this acoustic window to make the voice audible and intelligible without electronic amplification — a remarkable physiological and acoustic adaptation developed through intensive training.

---

## Chapter 6: Room Acoustics and Concert Hall Design

The experience of music in a room is shaped not only by the direct sound from the instrument but also by the many reflections that arrive at the listener's ears afterward, and by the slow decay of sound energy as it is gradually absorbed by the room's surfaces. Room acoustics is the discipline that studies this interaction, with direct consequences for the design of concert halls, recording studios, and rehearsal spaces.

### 6.1 Reverberation and Sabine's Formula

When a sound source in a room suddenly stops, the sound energy decays gradually as it bounces repeatedly off walls, ceiling, and floor, losing energy at each reflection. The *reverberation time* \(T_{60}\) is defined as the time required for the sound energy density to fall by 60 dB (a factor of \(10^6\) in intensity) after the source ceases.

<div class="theorem">
<strong>Sabine's Formula.</strong> For a diffuse sound field in a room of volume \(V\) (m\(^3\)) and total absorption \(A\) (m\(^2\), or sabins), the reverberation time is

\[
T_{60} = \frac{0.161\, V}{A},
\]
where the total absorption is

\[
A = \sum_i S_i \alpha_i,
\]
with \(S_i\) the area of the \(i\)th surface (m\(^2\)) and \(\alpha_i \in [0, 1]\) its absorption coefficient. A value \(\alpha = 1\) means perfectly absorbing (all incident energy is absorbed); \(\alpha = 0\) means perfectly reflective.
</div>

{{< score id="music276/22-dry-vs-reverberant" caption="Dry vs. reverberant acoustic: isolated staccato notes (studio) versus sustained blending notes (concert hall), illustrating the acoustic effect of different T₆₀ values." >}}

The derivation of Sabine's formula assumes that the sound field is *diffuse* — that energy is uniformly distributed in all directions throughout the room, which is a good approximation when the room dimensions are large compared to the wavelength and when surfaces are reasonably irregular. For rooms with highly non-uniform absorption (e.g., a room with one very absorptive wall and highly reflective others), the Eyring-Norris formula is more accurate:

\[
T_{60} = \frac{0.161\, V}{-S\ln(1 - \bar{\alpha})},
\]
where \(\bar{\alpha} = A/S\) is the mean absorption coefficient averaged over the total surface area \(S\).

<div class="example">
<strong>Example 6.1.</strong> The Grosser Musikvereinssaal in Vienna has a volume of approximately \(V = 15{,}000\) m\(^3\) and a measured occupied \(T_{60} \approx 2.0\) s at 500 Hz. Sabine's formula gives the total occupied absorption:

\[
A = \frac{0.161 \times 15{,}000}{2.0} \approx 1{,}208 \text{ m}^2.
\]
The unoccupied hall, with empty wood seats, has \(T_{60} \approx 3.2\) s, implying \(A_{\text{empty}} \approx 755\) m\(^2\). Each audience member and seat contributes approximately \((1{,}208 - 755)/1{,}680 \approx 0.27\) m\(^2\) of absorption — a value consistent with published measurements of audience absorption.
</div>

{{< score id="music276/21-room-direct-reflections" caption="Example 6.1: Room impulse structure — direct sound at time 0, early reflections at +15/+30/+50/+80 ms, and reverberant tail, each at reduced amplitude." >}}

### 6.2 The Structure of Room Impulse Responses

The *room impulse response* \(h(t)\) completely characterizes the acoustic behavior of a room between a specific source position and a specific receiver position. It is the pressure waveform arriving at the receiver when the source emits an ideal instantaneous impulse (\(\delta\)-function pulse). Any sound \(s(t)\) played in the room reaches the receiver as

\[
p(t) = (s * h)(t) = \int_{-\infty}^{\infty} s(\tau)\, h(t - \tau)\, d\tau,
\]
the convolution of the source signal with the impulse response.

The impulse response has a characteristic structure in three temporal zones. The *direct sound* arrives at time \(t_0 = d/c\) (where \(d\) is the source-to-receiver distance), as a single sharp peak. The *early reflections* arrive in the interval roughly 0–80 ms after the direct sound, as a series of discrete echoes from nearby surfaces. The *reverberant tail* consists of exponentially decaying diffuse energy, extending for a time roughly equal to \(T_{60}\).

{{< score id="music276/21-room-direct-reflections" caption="Room impulse response: direct sound and successive early reflections arriving at 0, 15, 30, 50, 80 ms with decaying amplitude." >}}

### 6.3 The Precedence Effect

<div class="definition">
The <strong>precedence effect</strong> (also called the <em>Haas effect</em>, 1949) refers to the perceptual fusion of closely spaced reflections with the direct sound. When a reflection arrives within approximately 1 ms of the direct sound, the two are completely fused into a single perceived event with elevated loudness. For reflections arriving between about 1 and 30–35 ms after the direct sound, the reflection is fused with the direct sound and does not produce a perceptible echo — the listener's localization is dominated by the direction of the first-arriving wave (the *law of the first wavefront*), even if the reflection is 10 dB louder. Reflections arriving more than about 35–50 ms after the direct sound (at conversational intensities) are perceived as distinct echoes.
</div>

The precedence effect has major implications for the acoustic design of concert halls. Early reflections from the side walls, ceiling, and balcony fronts, arriving within the 1–30 ms window, enhance the perceived loudness (adding 3–10 dB of loudness without disturbing localization), contribute to *envelopment* (the sensation of being surrounded by sound), and increase *intimacy* (the perceptual closeness to the source). In the great shoebox halls, the narrow width ensures that first-order side-wall reflections arrive within 20–25 ms of the direct sound, maximizing this beneficial early energy.

{{< score id="music276/22-dry-vs-reverberant" caption="Precedence effect: the dry (upper) score shows separated notes perceived as distinct; the reverberant (lower) score shows notes blending under reverberation's influence." >}}

### 6.4 Acoustic Measurement Methods

The room impulse response can be measured experimentally by several methods. The classic method uses a pistol shot or balloon burst as an approximating impulse, but this is limited by the difficulty of creating a truly impulsive source with adequate signal-to-noise ratio. Modern practice instead uses *swept-sine excitation* (a sinusoidal signal whose frequency sweeps from the lowest to highest frequency of interest over several seconds) or *maximum-length sequence* (MLS) excitation (a pseudorandom binary signal with a flat power spectrum). The room impulse response is recovered by cross-correlating the received signal with the known excitation:

\[
h(t) = (r * x^{\text{rev}})(t),
\]
where \(r(t)\) is the recorded response and \(x^{\text{rev}}(t)\) is the time-reversed excitation signal. Swept-sine measurement has become dominant because of its immunity to nonlinear distortion artifacts that affect MLS measurements, and because the sweep rate can be adjusted to allocate more measurement energy at low frequencies where room noise is highest.

From the measured impulse response, acoustic parameters are computed: \(T_{60}\) (reverberation time) from the energy decay curve; *C80* (clarity for music, the ratio in decibels of energy arriving in the first 80 ms to energy arriving after 80 ms); *D50* (definition, the fraction of energy in the first 50 ms — used for speech); *IACC* (interaural cross-correlation, measuring spatial impression); and *G* (strength, measuring the total energy relative to the direct sound at a reference distance). These parameters form the objective acoustic profile of a hall and can be compared systematically across different venues.

### 6.5 Optimal Reverberation and Hall Geometry

Different musical uses require very different reverberation times, as determined by both the intelligibility requirements of the content and the temporal density of the musical texture.

For *speech and theater*, clarity (the ability to distinguish successive phonemes and words) is paramount. Reverberation smears successive phonemes together; the optimal \(T_{60}\) for a lecture hall or theater is 0.6–0.9 s. For *chamber music*, where harmonic progressions unfold rapidly and individual voices must remain distinct, \(T_{60} \approx 1.3\)–1.6 s is ideal. For *Romantic orchestral music*, with its large textural contrasts, powerful climaxes, and sustained harmonic blocks, the optimal \(T_{60}\) is 1.8–2.2 s. For *pipe organ music* and *choral polyphony in large liturgical spaces*, the continuous legato of vocal lines blends beautifully under \(T_{60} = 3\)–5 s, though intelligibility of text suffers severely.

Three hall geometries have dominated concert hall architecture. The *shoebox* (rectangular) hall — exemplified by the Musikverein Wien (1870) and Boston Symphony Hall (1900) — is consistently rated among the finest acoustically. Its narrow width (typically 20–24 m) ensures strong lateral reflections, and the high ceiling (typically 15–18 m) sends reflected energy back to the audience on a slower path, extending early energy without creating flutter echoes. The ornate plasterwork — caryatids, coffered ceiling panels, deep niches — acts as geometric *diffusers*, scattering sound energy in many directions and preventing harsh specular echoes.

The *vineyard* design, pioneered by Hans Scharoun in the Berlin Philharmonie (1963) and later adopted by Gehry's Walt Disney Concert Hall (2003) and Rem Koolhaas's Guangzhou Opera House, surrounds the orchestra with terraced audience platforms. This creates an immediate visual and psychological intimacy — no audience member is more than about 30 m from the platform — but the acoustics are more challenging to control. Lateral early reflections from side walls are less consistent than in the shoebox, and the complex surface geometry requires careful modeling to avoid acoustic dead zones and flutter echoes.

The *fan-shaped* hall (wide, with audience fanning out from the stage) was fashionable in the mid-20th century for its large seating capacity but has generally poor acoustics: lateral early reflections are weaker because the side walls are distant from most of the audience, and the wide, shallow room produces less spatial impression.

---

## Chapter 7: The Auditory System and Pitch Perception

Having studied sound production and propagation in considerable detail, we now turn to the other end of the acoustic chain: the biological machinery by which the auditory system converts pressure variations into the rich perceptual world of pitch, timbre, loudness, and space. The ear is, in many respects, a more sophisticated signal processor than any device human engineering has yet produced — dynamically compressive, exquisitely frequency-selective, and capable of operating over more than 13 orders of magnitude in intensity.

### 7.1 Anatomy of the Auditory Periphery

The auditory periphery is conventionally divided into the outer ear, middle ear, and inner ear.

The *outer ear* consists of the *pinna* (the visible cartilaginous flap) and the *external auditory meatus* (ear canal), approximately 2.5 cm long and terminating at the *tympanic membrane* (eardrum). The pinna's irregular, folded shape introduces direction-dependent and frequency-dependent filtering — the *head-related transfer function* (HRTF) — that the brain uses for vertical localization (elevation perception) and front-back discrimination. The ear canal acts as a quarter-wave resonator with resonant frequency near \(f = c/(4 \times 0.025) \approx 3{,}430\) Hz, boosting sound pressure at the eardrum by up to 10–15 dB in the 2–5 kHz range and contributing to the shape of the equal-loudness contours.

The *middle ear* contains three tiny ossicles — the *malleus* (hammer), *incus* (anvil), and *stapes* (stirrup) — which form a mechanical lever system. This system achieves an impedance match between the low-impedance air (acoustic impedance \(\rho c \approx 420\) Pa·s/m) and the high-impedance fluid of the cochlea (\(\rho c \approx 1.5 \times 10^6\) Pa·s/m). Without impedance matching, approximately 99.9% of incident acoustic energy would be reflected at the air-fluid interface — a 30 dB transmission loss. The middle ear recovers approximately 25–28 dB of this through two mechanisms: the area ratio between the tympanic membrane (\(\approx 55\) mm\(^2\)) and the stapes footplate (\(\approx 3.2\) mm\(^2\)) provides a pressure amplification by a factor of about 17, and the lever action of the malleus-incus combination provides an additional factor of about 1.3.

The *inner ear* (cochlea) is a fluid-filled, snail-shaped structure coiled approximately 2.75 turns in the temporal bone of the skull. The cochlea is divided along its length by the *basilar membrane* (BM) and *Reissner's membrane* into three fluid-filled chambers: the scala vestibuli, scala media, and scala tympani. The basilar membrane spans the length of the cochlea (\(\approx 35\) mm) and is graded in mechanical properties: stiff and narrow near the base (oval window end) and flexible and wide near the apex.

### 7.2 The Basilar Membrane and Tonotopic Organization

When the stapes footplate moves in response to a sound, it creates a pressure wave in the cochlear fluid that sets the basilar membrane into traveling-wave motion. Georg von Békésy (Nobel Prize, 1961) directly observed these traveling waves in cadaver cochleae and found that each frequency produces maximum basilar membrane displacement at a characteristic location: high frequencies at the base, low frequencies at the apex.

<div class="definition">
The <strong>characteristic frequency</strong> (CF) of a location \(x\) mm from the apex of the human cochlea is approximately given by the Greenwood function:

\[
f_{\mathrm{CF}}(x) = A\left(10^{ax} - k\right),
\]
where \(A \approx 165.4\) Hz, \(a \approx 0.06\) mm\(^{-1}\), and \(k \approx 0.88\) (for the human cochlea). This logarithmic mapping means that each millimetre along the basilar membrane from base to apex corresponds to approximately the same musical interval (roughly 1/3 to 1/2 of an octave per mm in the mid-frequency range), encoding the musical scale in a geometrically regular way.
</div>

{{< score id="music276/03-octave-equivalence" caption="Tonotopic mapping: C2 through C6 at exact octave spacings (65–1047 Hz) — each octave occupies the same basilar-membrane distance under the logarithmic Greenwood map." >}}

The tonotopic organization of the basilar membrane is preserved throughout the auditory pathway: the auditory nerve fibers, cochlear nucleus, inferior colliculus, medial geniculate nucleus, and primary auditory cortex (A1) are all organized tonotopically, with neurons responding to different frequencies arranged in a systematic spatial order.

### 7.3 Hair Cells and Neural Transduction

Atop the basilar membrane, within the *organ of Corti*, lie two populations of sensory cells: approximately 3,500 *inner hair cells* (IHC) arranged in a single row, and approximately 12,000 *outer hair cells* (OHC) arranged in three rows. Each hair cell has a bundle of *stereocilia* — tiny hair-like projections — on its apical surface.

When the basilar membrane deflects, the stereocilia are bent due to the shearing motion between the membrane and the overlying *tectorial membrane*. Bending in the excitatory direction (toward the tallest stereocilia) stretches fine *tip links* connecting adjacent stereocilia, mechanically opening ion channels. Potassium ions (K\(^+\)) rush into the hair cell from the endolymph (which has an unusually high K\(^+\) concentration maintained by the *stria vascularis*), depolarizing the cell and triggering calcium-dependent vesicle fusion at the ribbon synapses below the cell. The inner hair cells release glutamate, which excites the fibers of the auditory nerve, generating action potentials that travel to the brainstem.

The outer hair cells, far more numerous, serve primarily as *electromotile amplifiers*. Their cell bodies contain prestin, a voltage-sensitive motor protein that contracts and expands the cell body in synchrony with the membrane potential, creating active mechanical forces that amplify the traveling wave on the basilar membrane — particularly for quiet sounds. This *cochlear amplifier* adds approximately 40–60 dB of gain for soft sounds, providing the ear's enormous sensitivity and its remarkable frequency selectivity (sharp tuning curves). Hair cell damage, whether from noise exposure, ototoxic drugs, or aging, destroys this amplification irreversibly, resulting in sensorineural hearing loss.

### 7.4 Auditory Scene Analysis and Stream Segregation

{{< score id="music276/28-gestalt-grouping" caption="Gestalt auditory grouping: notes in the same register group together by proximity; the two register groups form two distinct Gestalt streams." >}}

In real musical situations, the auditory system faces the inverse problem: given a mixture of sounds from multiple sources arriving simultaneously at the two ears, reconstruct the individual source streams. Albert Bregman (1990) termed this capacity *auditory scene analysis* (ASA) and identified a set of organizational principles by which the auditory system groups acoustic features into coherent perceptual streams.

Grouping operates on two levels. *Simultaneous grouping* (within a single moment of time) uses cues such as common onset and offset (components starting and ending together are more likely to belong to the same source), harmonicity (partials fitting a common fundamental tend to fuse into a single percept), and common spatial location. *Sequential grouping* (across time) uses cues such as proximity in pitch (notes close in pitch tend to form the same melodic stream), similarity in timbre, and continuity of trajectory (a tone gliding smoothly upward groups with itself).

<div class="example">
<strong>Example 7.2.</strong> The *auditory streaming* effect (van Noorden, 1975) demonstrates sequential grouping. When two pure tones at frequencies \(f_A\) and \(f_B\) alternate rapidly (e.g., ABA–ABA–ABA…), listeners hear either one integrated stream of alternating tones or two separate streams — a high-pitched stream of B tones and a low-pitched stream of A tones. The percept switches from integrated to segregated as the frequency separation \(|f_A - f_B|\) increases or as the tempo increases. The boundary between the two percepts lies at roughly 4–6 semitones for slow tempos, becoming narrower (easier to split) at faster tempos. This streaming phenomenon underlies the polyphonic illusion in J. S. Bach's solo violin and cello works: a single instrument playing rapid single notes across two registers creates the perceptual illusion of two simultaneous melodic lines.
</div>

{{< score id="music276/14-auditory-streaming" caption="Example 7.2: Auditory streaming — rapid alternating notes at two pitch levels (high E/G, low C/D) that segregate into two perceptual streams at fast tempos." >}}

{{< score id="music276/15-melodic-fission" caption="Melodic fission: very fast alternating notes spanning a wide range, which split into a high and a low melodic stream (van Noorden's streaming boundary effect)." >}}

### 7.5 Place Theory and Temporal Theory of Pitch

Two complementary theories have historically described how the auditory system encodes pitch.

<div class="definition">
The <strong>place theory</strong> of pitch (Helmholtz, 1863) proposes that pitch is encoded by the location of maximum basilar membrane displacement. Since different frequencies excite different places along the BM, the brain reads out pitch by identifying the most strongly activated neural channel. This theory predicts that the frequency resolution of pitch perception is limited by the mechanical tuning of the BM — the critical bandwidth at each frequency.

The <strong>temporal theory</strong> (or rate-place/volley theory) proposes that pitch is encoded in the timing of auditory nerve action potentials. Nerve fibers tend to fire preferentially at a specific phase of each cycle of the stimulus — a property called <em>phase locking</em>. The inter-spike intervals in the auditory nerve then contain information about the period of the sound, and the brain extracts pitch by measuring these intervals.
</div>

{{< score id="music276/04-beating-semitone" caption="Place vs. temporal theory: two close intervals (minor 2nd A4–Bb4 and semitone C5–C#5) that reveal frequency-place selectivity on the basilar membrane." >}}

The two theories are not mutually exclusive; modern understanding holds that both mechanisms operate and cooperate across different frequency ranges. Phase locking in the auditory nerve is robust up to about 4–5 kHz in humans; above that frequency, the nerve can no longer follow the rapid oscillations, and place information dominates. Below about 1 kHz, temporal information is so precise that just noticeable differences in frequency can be as small as 0.1–0.2% (roughly 2–3 cents). Between 1 and 5 kHz, both mechanisms contribute. Above 5 kHz, pitch perception becomes increasingly vague and musical melodies lose their clear tonal quality.

### 7.5 The Just Noticeable Difference in Frequency

The *just noticeable difference* (JND) in frequency is the smallest change in frequency that a listener can reliably detect. For sinusoidal tones, the JND depends on frequency, duration, and intensity. At 1 kHz and 60 dB SPL with tones of duration 200 ms or longer, the JND is approximately 2–3 Hz (0.2–0.3%). At low frequencies (100–200 Hz), the JND in absolute hertz is smaller (about 1 Hz) but represents a larger percentage. The JND expressed in cents is roughly constant across the musical frequency range at about 3–6 cents for pure tones, and 1–3 cents for complex tones (which provide additional harmonic information for pitch encoding).

These values have direct implications for the perception of mistuning. A piano tuned 5 cents sharp in one octave would be detectable by a trained listener in a controlled test, though unnoticed in ensemble playing. The equal temperament major third, 14 cents sharp of just, is well above the JND and is distinctly audible as beating in a sustained pianissimo chord.

### 7.6 Virtual Pitch and the Missing Fundamental

One of the most compelling demonstrations in auditory science is the phenomenon of *virtual pitch*, or the *missing fundamental*.

<div class="theorem">
When a complex tone contains harmonics \(nf_1, (n+1)f_1, (n+2)f_1, \ldots\) but does not contain the fundamental component \(f_1\) itself, a listener perceives a pitch corresponding to \(f_1\) — the <em>virtual pitch</em> or <em>residue pitch</em>. This percept is robust, can override a physically present (but weaker) component at an adjacent frequency, and persists even when the missing fundamental lies below the transmission range of the acoustic system.
</div>

{{< score id="music276/12-missing-fundamental" caption="Virtual pitch: harmonics 3, 4, 5 of 200 Hz (600, 800, 1000 Hz) presented without the fundamental — listeners hear the missing C3 (200 Hz)." >}}

<div class="example">
<strong>Example 7.1.</strong> Harmonics 3, 4, and 5 of a 200 Hz tone have frequencies 600, 800, and 1000 Hz. If only these three components are presented (with no energy at 200 Hz, 400 Hz, or any other frequency), listeners consistently report hearing a pitch near 200 Hz. The auditory system appears to perform a form of harmonic template matching, searching for the fundamental that best accounts for the observed pattern of harmonics. This can be modeled as finding the \(f_0\) that minimizes some cost function of the deviations of observed partials from integer multiples of \(f_0\).
</div>

{{< score id="music276/12-missing-fundamental" caption="Example 7.1: Partials 3–5 of 200 Hz (notated as G4, C5, E5) with the fundamental absent — the auditory system reconstructs the missing C3." >}}

The missing fundamental explains why a telephone (which transmits frequencies above roughly 300 Hz) reproduces male speech with recognizable voice pitch near 100–150 Hz: the harmonics above 300 Hz are sufficient for the auditory system to reconstruct the pitch. It explains why a small speaker with poor bass response still sounds musical. It also underlies several important musical illusions, including the bass pedal tones of pipe organs: many large organ pipes speak at frequencies below the lowest resonance of the room or the acoustic range of the listener's speaker system, and the virtual pitch supplies the perceived bass.

### 7.7 Pitch Circularity: The Shepard Tone

The *Shepard tone* (R. N. Shepard, 1964) is an auditory illusion producing a pitch that appears to ascend (or descend) endlessly through successive semitones without ever actually becoming higher (or lower) in absolute frequency.

A Shepard tone is constructed as a superposition of sinusoids at frequencies that are exact octave multiples of one another (e.g., \(f, 2f, 4f, 8f, \ldots\)), with amplitudes shaped by a fixed bell-shaped spectral envelope that emphasizes middle frequencies and fades out the very high and very low components. As the pitch class ascends by one semitone (a factor of \(2^{1/12}\)), the entire pattern shifts: the highest component fades out and a new component fades in one octave below, so the overall spectral distribution remains identical. After 12 semitone steps the pattern has returned to exactly its original frequency distribution — yet the perceived pitch has "ascended" continuously.

{{< score id="music276/23-shepard-tone" caption="Shepard tone: an ascending chromatic scale C through B in which pitch class rises continuously — after 12 steps the pattern repeats, creating the endless-rise illusion." >}}

The illusion exploits the ambiguity of octave equivalence in pitch perception. Because all components are octave-related, the auditory system cannot assign an absolute octave register — only a pitch class (the note name, e.g., "A" regardless of octave). The gradual brightening of the spectral envelope as the tone rises a semitone biases the pitch judgment toward "higher," even though the total acoustic pattern is cyclic.

---

## Chapter 8: Consonance, Dissonance, and Tuning Systems

The final chapter addresses a question that has occupied music theorists, mathematicians, and acousticians for over two millennia: why do some combinations of tones sound pleasant and stable (consonant) while others sound tense and unstable (dissonant)? And what tuning systems best serve the diverse requirements of different musical genres and instruments? The answers draw on everything we have developed about the harmonic series, critical bands, beats, and pitch perception.

### 8.1 Beats Between Pure Tones

Before analyzing the complex case of two musical tones with full harmonic series, we consider the simplest case: two pure sinusoids at nearby frequencies \(f_1\) and \(f_2\). Their superposition is

\[
\cos(2\pi f_1 t) + \cos(2\pi f_2 t) = 2\cos\!\left(\pi (f_1 - f_2) t\right)\cos\!\left(\pi (f_1 + f_2) t\right),
\]

which is a rapid oscillation at the average frequency \(\bar{f} = (f_1 + f_2)/2\), amplitude-modulated at the *beat frequency* \(f_{\text{beat}} = |f_1 - f_2|\). When \(f_{\text{beat}}\) is less than about 10–15 Hz, the ear resolves the individual amplitude pulsations as slow, regular beats — the slight rhythmic waxing and waning that a piano tuner uses to check interval purity. As \(f_{\text{beat}}\) increases toward 15–40 Hz, the beats are too rapid to resolve individually but create a percept of *roughness* or *dissonance* — an unpleasant, harsh quality. Above about 50–60 Hz, the two tones begin to be heard as separate pitches, and roughness decreases again.

This pattern — maximum roughness at beat frequencies of 15–30 Hz — is the psychoacoustic basis of Helmholtz's theory of dissonance.

{{< score id="music276/04-beating-semitone" caption="Beats between pure tones: a minor 2nd (A4–Bb4, ~26 Hz beat) and a semitone (C5–C#5, ~31 Hz beat) — both in the maximum roughness range of 15–40 Hz." >}}

### 8.2 Helmholtz's Theory of Dissonance

Hermann von Helmholtz (1863) proposed that the consonance or dissonance of a musical interval is determined by the roughness arising from beating between nearly coincident partials of the two tones. A musical interval is consonant when the low-order partials of the two tones either coincide exactly (producing no beats) or are separated by more than the roughness range (producing no roughness). It is dissonant when multiple pairs of partials fall within the roughness range and produce simultaneous fast beats.

<div class="example">
<strong>Example 8.1.</strong> Two tones a pure perfect fifth apart (frequency ratio 3:2, e.g., 300 Hz and 200 Hz) have partials at 200, 400, 600, 800, 1000, \ldots Hz and 300, 600, 900, 1200, \ldots Hz respectively. The partials at 600 Hz coincide exactly; the partials at 1200 Hz coincide exactly; and so on. With pure intervals, there is no roughness between coincident partials. Two tones a major second apart (ratio approximately 9:8, e.g., 200 Hz and 225 Hz) have no low-order partial coincidences, and numerous pairs of partials are separated by 25 Hz — exactly in the peak roughness range. The result is high roughness and strong dissonance.
</div>

{{< score id="music276/06-consonance-dissonance-spectrum" caption="Example 8.1: Consonance–dissonance spectrum — interval pairs from unison through minor 2nd, major 2nd, minor 3rd, major 3rd, tritone, to octave." >}}

Helmholtz's theory predicts the traditional hierarchy of consonances in Western music — octave, fifth, fourth, major third, minor third — in essentially the correct order, based on the frequency of partial coincidences and the magnitudes of beating between non-coincident partials. However, the theory is incomplete: it predicts that the octave (2:1) should be maximally consonant (all partials of the upper tone coincide with partials of the lower), which is correct, but it cannot fully explain why certain simultaneous intervals sound beautiful in a harmonic context even when some roughness is present, or why the same interval sounds different in different registers.

### 8.3 Tonal Consonance versus Cultural Consonance

Helmholtz's roughness-based theory of consonance is a *sensory* theory: it predicts which intervals produce physical roughness from coinciding partials, independent of any musical context or enculturation. But musical consonance and dissonance are not purely sensory — they are also *contextual* and *syntactic*. A diminished seventh chord, which has relatively high sensory dissonance, sounds dramatically tense and unstable in tonal context; the same four pitches presented in isolation without context might still sound rough, but the urgency of their resolution comes from learned tonal expectations.

Huron (2006) distinguishes five components of what we loosely call "consonance": roughness (Helmholtz's sensory factor), sensory interference from spectral overlap, pitch commonality (how many partials are shared between simultaneous tones), expectation (how well the interval fits learned tonal patterns), and pleasantness. These five components partially but not perfectly correlate with one another and with listeners' judgments of consonance. The cross-cultural evidence is mixed: some studies find that individuals from cultures without Western tonal music rate interval consonance in broadly similar rank orders to Western listeners (suggesting a sensory basis), while others find significant cross-cultural differences for certain intervals (suggesting cultural learning).

The resolution seems to be that roughness provides a sensory foundation for the consonance hierarchy — particularly for the extremes (unisons and octaves are universally preferred; minor seconds and tritones universally produce more discomfort) — while the intermediate intervals (thirds, sixths) show significant cross-cultural variability and are more strongly modulated by enculturation.

### 8.4 Plomp and Levelt: The Consonance Curve

Plomp and Levelt (1965) conducted systematic psychoacoustic experiments with pairs of *pure tones* and derived the empirical consonance curve for intervals between sinusoids.

<div class="definition">
The <strong>Plomp-Levelt consonance function</strong> for two pure tones at frequencies \(f_1 \le f_2\) describes consonance as a function of the normalized frequency separation \(\Delta f / \mathrm{CB}(\bar{f})\), where \(\mathrm{CB}(\bar{f})\) is the critical bandwidth at the average frequency \(\bar{f}\). Consonance is maximum (roughness zero) when \(\Delta f = 0\) (unison) and when \(\Delta f / \mathrm{CB} \ge 1\) (the tones are more than a critical bandwidth apart). Roughness is maximum at \(\Delta f / \mathrm{CB} \approx 0.25\).
</div>

{{< score id="music276/05-critical-bandwidth" caption="Plomp-Levelt critical bandwidth: unison (no beating), major 2nd (within critical band, rough), major 3rd (near CB edge), perfect 5th (outside CB, smooth)." >}}

For complex tones with multiple harmonics, the total roughness of a dyad is the sum of roughnesses from all pairs of partials:

\[
D(f_1, f_2) = \sum_{m=1}^{N}\sum_{n=1}^{N} d(m f_1,\, n f_2,\, A_{1m},\, A_{2n}),
\]
where \(d(f_a, f_b, a, b)\) is the Plomp-Levelt dissonance for two pure tones at frequencies \(f_a\) and \(f_b\) with amplitudes \(a\) and \(b\). Plotting this total roughness as a function of the frequency ratio \(f_2/f_1\) for a sawtooth-like spectrum reveals minima (consonance maxima) at exactly the just intervals: 2:1 (octave), 3:2 (fifth), 4:3 (fourth), 5:4 (major third), 6:5 (minor third), 5:3 (major sixth), and so on — in close agreement with the traditional hierarchy of Western consonances. This was a major triumph of psychoacoustic theory: the consonance hierarchy emerges from first-principles auditory mechanics, without invoking cultural convention.

### 8.4 Pythagorean Tuning and Just Intonation

The history of Western tuning is a history of compromise between competing ideals. We trace the major systems chronologically.

*Pythagorean tuning* constructs the chromatic scale by stacking pure perfect fifths (ratio 3:2):

\[
f_n = f_0 \cdot \left(\frac{3}{2}\right)^n, \quad n = 0, 1, 2, \ldots, 11,
\]
reducing each result by factors of 2 to keep all pitches within a single octave. The twelve pitches generated by this process form the twelve chromatic notes, but they do not close into a perfect circle: twelve pure fifths overshoot seven pure octaves by the *Pythagorean comma*:

\[
\Pi = \left(\frac{3}{2}\right)^{12} \Big/ 2^7 = \frac{3^{12}}{2^{19}} = \frac{531441}{524288} \approx 1.01364 \approx 23.5 \text{ cents}.
\]

The Pythagorean major third has frequency ratio \((3/2)^4 / 4 = 81/64 \approx 1.2656\), which is 21.5 cents sharp of the pure major third \(5/4 = 1.250\) (the *syntonic comma* \(\approx 21.5\) cents). Pythagorean tuning gives beautiful fifths and fourths but harshly impure major thirds — suitable for medieval organum and early polyphony that avoided thirds, but problematic for Renaissance music that emphasized the major third as the defining interval of the triad.

*Just intonation* corrects the third by using the pure 5:4 ratio, which requires introducing a second size of whole tone. The just diatonic scale has ratios:

\[
1 : \frac{9}{8} : \frac{5}{4} : \frac{4}{3} : \frac{3}{2} : \frac{5}{3} : \frac{15}{8} : 2.
\]
The two whole tones are the *major tone* (9:8 \(\approx 203.9\) cents) and the *minor tone* (10:9 \(\approx 182.4\) cents), differing by the syntonic comma (21.5 cents). Just intonation gives maximally consonant triads in a single key but creates serious problems for modulation: the same pitch may need to be tuned differently depending on whether it functions as the major third of one chord or the fifth of another. Just intonation is most naturally suited to a cappella choral singing, where singers can continuously adjust pitch to minimize roughness.

{{< score id="music276/07-just-intonation-scale" caption="Just intonation C major scale with ratio annotations 1/1 through 2/1: the pure intervals that minimize roughness between partials." >}}

{{< score id="music276/09-pythagorean-scale" caption="Pythagorean tuning: stacked pure fifths (C, G, D, A, E, B, F#) — pure fifths but sharper major thirds (81/64 vs. 5/4)." >}}

### 8.5 Meantone Temperament and the Wolf Fifth

*Meantone temperament*, developed in the 15th–17th centuries and used widely through the 18th century on keyboard instruments, distributes the syntonic comma evenly over the four fifths needed to build a major third. In quarter-comma meantone, each of these four fifths is tempered narrow by one-quarter of the syntonic comma (\(\approx 5.4\) cents), so four consecutive fifths sum to a pure major third plus two octaves:

\[
4 \times \left(\frac{3}{2} \cdot 2^{-1/(4 \times \ln(81/80)/\ln 2)}\right) \approx \frac{5}{4} \times 4 \quad \text{(over two octaves)}.
\]
Meantone gives beautifully pure major thirds (the characteristic warmth of Renaissance and Baroque keyboard music) in the most common keys — C, G, D, F, B-flat — but produces a severely out-of-tune fifth in one position of the cycle of fifths: the "wolf fifth" between G-sharp and E-flat (or enharmonically equivalent notes), which may be 35–40 cents flat of pure. Playing in keys that require the wolf fifth is distinctly unpleasant, restricting music to a subset of keys.

{{< score id="music276/10-meantone-wolf-fifth" caption="Meantone temperament: the pure fifth (702¢), the tempered meantone fifth (696.6¢, −5.4¢), and the wolf fifth G#–Eb (737.6¢, +35.6¢)." >}}

### 8.6 Equal Temperament

*12-tone equal temperament* (12-TET) distributes the Pythagorean comma evenly among all twelve fifths, tempering each by one-twelfth of the comma (approximately 2 cents):

<div class="definition">
In <strong>12-tone equal temperament</strong>, the frequency ratio of a semitone is the twelfth root of two:

\[
r = 2^{1/12} \approx 1.05946.
\]
The frequency of the note \(n\) semitones above a reference pitch \(f_0\) is

\[
f_n = f_0 \cdot 2^{n/12}.
\]
A <em>cent</em> is defined as one hundredth of a semitone: \(k\) cents corresponds to a frequency ratio of \(2^{k/1200}\). The cent scale makes it easy to compare intervals across tuning systems.
</div>

{{< score id="music276/08-equal-temperament-scale" caption="12-TET C major scale with cent deviations from just intonation: E is +13.7¢ sharp, A is +15.6¢ sharp, showing the systematic compromises of equal temperament." >}}

The equal-tempered fifth is \(2^{7/12} \approx 1.49831\), which is 1.955 cents narrow of the pure fifth 3:2 \(\approx 1.50000\) — a discrepancy audible only in a direct comparison with a pure reference but essentially imperceptible in normal musical contexts. The equal-tempered major third is \(2^{4/12} = 2^{1/3} \approx 1.25992\), which is 13.7 cents sharp of the pure major third 5:4 = 1.25000. This is a much more substantial impurity, clearly audible as approximately 6–7 beats per second in a sustained piano major third in the middle register, and more rapid (more conspicuous) in the treble.

The equal-tempered minor third (300 cents) is 15.6 cents flat of the pure minor third 6:5 (315.6 cents). The major sixth (900 cents) is 15.6 cents sharp of the pure major sixth 5:3 (884.4 cents). These systematic deviations give 12-TET its characteristic compromise sound: slightly tense thirds and sixths, with nearly perfect fifths and octaves.

### 8.7 Comparison of Tuning Systems

<div class="remark">
The following table compares the major tuning systems on the key intervals (in cents, where 100 cents \(=\) one semitone):

| Interval | Pure | Pythagorean | Quarter-comma Meantone | 12-TET |
|---|---|---|---|---|
| Perfect fifth | 702.0 | 702.0 | 696.6 | 700.0 |
| Major third | 386.3 | 407.8 | 386.3 | 400.0 |
| Minor third | 315.6 | 294.1 | 310.3 | 300.0 |
| Major second | 203.9 | 203.9 | 193.2 | 200.0 |
| Wolf fifth (MT) | — | — | 737.6 | — |

The trade-offs are stark: Pythagorean tuning maximizes fifths (pure) at the cost of sharp thirds; meantone maximizes thirds (pure) at the cost of the wolf fifth; 12-TET compromises all intervals slightly but allows free modulation through all keys.
</div>

{{< score id="music276/09-pythagorean-scale" caption="Pythagorean tuning — stacked pure fifths produce the chromatic scale, but the major third (81/64) is 21.5¢ sharper than just." >}}

{{< score id="music276/08-equal-temperament-scale" caption="12-TET cent deviations from just: the uniform compromise that enables free modulation at the cost of impure thirds." >}}

The practical choice of tuning depends on the musical genre, instrument, and compositional style. A cappella choral singing and string quartets naturally gravitate toward just intonation and can dynamically adjust pitch in real time. Keyboard instruments with fixed pitch must choose a static tuning; equal temperament has dominated keyboard practice since the mid-19th century. Wind orchestras rely on the players' ability to adjust intonation continuously to minimize roughness in sustained chords. Barbershop quartet singing has developed a strong preference for just intonation: the "lock and ring" of a perfectly tuned seventh chord (with a 7:4 harmonic seventh) is the genre's most celebrated sonic ideal.

### 8.8 Well Temperament and the Affective Theory of Keys

Between the extremes of pure just intonation and 12-TET lie a family of *well temperaments* popular in the 17th and 18th centuries, including Werckmeister III (1691), Kirnberger III (1779), and the many temperaments proposed by Neidhardt, Vallotti, and others. These systems make all 24 keys usable (unlike meantone) but preserve different degrees of purity in different keys: the most common keys (C, G, D, F) are close to meantone and have nearly pure major thirds, while the remote keys (C-sharp, F-sharp, B) are closer to Pythagorean and have slightly sharper, more tense thirds.

This variation in key color was widely perceived in the Baroque and early Classical periods as giving each key an *affect* or emotional character: C major pure and simple; D major brilliant and triumphant; B minor dark and melancholy; E-flat major noble and solemn. Johann Mattheson (1713) and other theorists catalogued these key affects in detail. Whether Bach's *Well-Tempered Clavier* was composed for a specific well temperament (in which these key colors are acoustically grounded) or for equal temperament (in which they vanish) remains contested among music historians and tuning theorists, and is one of the most actively debated questions in the history of musical acoustics.

### 8.9 Inharmonic Timbres and Alternative Consonance

The consonance theory developed in this chapter assumes instruments with harmonic spectra. When instruments with inharmonic spectra — bells, metallophones, certain electronic sounds — are combined, the standard harmonic intervals no longer minimize roughness, and the traditional hierarchy of consonances breaks down.

<div class="remark">
William Sethares (1993) showed that for any fixed inharmonic spectrum, one can derive a corresponding <em>inharmonic tuning system</em> in which roughness is minimized by intervals matching the partial ratios of the spectrum. For the Javanese gamelan, whose bronze instruments have partials at approximately 1, 2.76, 5.52, and 8.41 times the fundamental (decidedly non-harmonic), the pelog and slendro scales used in gamelan music correspond approximately to the intervals that minimize roughness for that specific spectrum. The same intervals would sound highly dissonant on harmonic instruments like violins or voices. This suggests that consonance is not a universal absolute but a relational property of the combination of <em>timbre</em> and <em>tuning</em> — a relationship discovered and refined over centuries by musical communities whose ears are tuned (literally) to the instruments they play.
</div>

{{< score id="music276/06-consonance-dissonance-spectrum" caption="Inharmonic consonance: the standard interval-roughness spectrum for harmonic timbres — gamelan timbres would invert or radically reshape this curve." >}}

The unity of the science of musical sound lies precisely in this web of relationships. The harmonic series, born from the physics of vibrating strings and air columns, shapes the consonance hierarchy through the psychoacoustics of critical bands and roughness. The architecture of concert halls is designed to deliver this sound, shaped by centuries of aesthetic refinement, to ears whose anatomy encodes the logarithm of frequency along the basilar membrane — matching, perhaps not coincidentally, the logarithmic structure of the musical scale. The cultural and the physical, the biological and the mathematical, are woven together in every moment of musical experience.

---

## Supplementary Material: Selected Topics

### S.0 The Bowed String: A Limit-Cycle Oscillator

The interaction between a bow and a string is one of the most complex oscillator dynamics in all of musical acoustics. Unlike the plucked or struck string — which receives an initial energy input and then decays freely — the bowed string is a *self-sustained oscillator*, maintained in periodic motion by the continuous transfer of energy from the moving bow.

The mechanism, described by Lord Rayleigh (1877) and modeled quantitatively by McIntyre, Schumacher, and Woodhouse (1983), is the *stick-slip* cycle. The bow hair, coated with rosin (a pine resin that has a high static friction coefficient and a lower kinetic friction coefficient), exerts a force on the string. In the *sticking* phase, static friction causes the string to travel with the bow, building up potential energy in the string's displacement. When the tension in the string exceeds the maximum static friction force, the string *slips*, shooting back rapidly toward its equilibrium, and the kinetic friction during the slip phase is much lower, allowing this rapid motion. When the string returns to near equilibrium and its velocity matches the bow velocity again, sticking resumes — and the cycle repeats.

The remarkable result, predicted by the reflection function model and confirmed experimentally, is that the stick-slip cycle locks onto the fundamental period of the string, so that the string executes a nearly perfect sawtooth-wave displacement: linear rise during the stick phase, rapid fall during the slip phase. The fraction of the period spent in the slip phase (approximately equal to the bow-to-bridge distance divided by the string length, normalized by the period) is the *beta ratio* \(\beta = d_{b}/L\), where \(d_b\) is the bow-to-bridge distance. The resulting Helmholtz motion produces a spectrum with all harmonics present with amplitudes proportional to \(1/n\) (a perfect sawtooth), weighted by the amplitude spectrum of the corner at the stick-slip transition.

<div class="remark">
In practice, the bowed string produces a richer and more complex motion than the ideal Helmholtz wave. The string's stiffness, the finite width of the bow, and the complex mechanical admittance of the bridge and instrument body all modify the ideal waveform. The most audible consequence is the dependence of the attack on bowing technique: starting a bowed note requires careful management of the initial stick-slip transient. Too light a bow pressure and the string never enters the stick-slip regime — the result is a "surface" or "whistling" sound (the Schelleng upper threshold). Too heavy and the string remains stuck throughout the cycle, producing a scratchy, unpitched noise (the Schelleng lower threshold). The playable range lies between these two extremes, and it narrows for louder dynamics and for bowing near the bridge (shorter \(\beta\), requiring higher bow pressure). Mastering the dynamics of the Helmholtz oscillator is a large part of what violin study entails.
</div>

{{< score id="music276/30-sawtooth-spectrum" caption="Bowed-string sawtooth spectrum: Helmholtz motion produces all harmonics at amplitudes 1/n, visible as noteheads at successive partial positions." >}}

### S.1 Nonlinear Acoustics and Combination Tones

The acoustic theory developed in the preceding chapters is largely *linear*: we assumed that pressure fluctuations are small enough that the wave equation can be derived from a linear approximation to the equation of state of the gas. In practice, all acoustic systems exhibit some degree of nonlinearity — and in certain musical contexts, this nonlinearity becomes perceptually important.

When two sinusoidal tones at frequencies \(f_1\) and \(f_2\) pass through a nonlinear system, the output contains not only the original frequencies but also *combination tones* at frequencies of the form

\[
f_{mn} = |m f_1 \pm n f_2|, \quad m, n = 0, 1, 2, \ldots
\]
The most perceptually prominent is the *cubic difference tone* at \(2f_1 - f_2\) (for \(f_2 > f_1\)), and the *quadratic difference tone* at \(f_2 - f_1\). Tartini (1754) described the audibility of the difference tone \(f_2 - f_1\) in quiet sustained intervals played on the violin, and he used these "Tartini tones" as a check on the purity of just intervals: a pure fifth (3:2 ratio) produces a difference tone exactly one octave below the lower note (\(3f - 2f = f\)), while a mistuned fifth produces a difference tone slightly off from that position, revealing the detuning.

{{< score id="music276/13-combination-tones" caption="Combination tones: two primary tones (G4 at 392 Hz, C5 at 523 Hz) generate a difference tone at 131 Hz (C3), audible as a bass Tartini tone." >}}

The cochlea itself is a nonlinear system (due to the active mechanics of the outer hair cells), and it generates combination tones internally. The *distortion product otoacoustic emission* (DPOAE) at \(2f_1 - f_2\) is measurable with a sensitive microphone in the ear canal even without any external stimulus at that frequency — it is generated within the cochlea and radiates back through the middle ear. DPOAEs are widely used clinically as a non-invasive measure of cochlear health, particularly for screening neonatal hearing.

For musical instruments, nonlinear wave propagation in the bore of a brass instrument at high playing levels causes a progressive steepening of the acoustic pressure waveform — a phenomenon analogous to the formation of shock waves in supersonic aerodynamics, though much milder. The steepening enriches the high-frequency content of the spectrum, contributing to the dramatic brightening of brass tone at fortissimo that is one of the most characteristic sounds of the symphony orchestra.

### S.2 Loudness Summation and Masking

The decibel level of a complex sound is not a sufficient predictor of its perceived loudness, because the auditory system integrates loudness differently across frequency. The *loudness* of a complex sound is approximately the sum of the loudnesses of its components within each critical band, with critical bands acting as semi-independent loudness channels.

*Simultaneous masking* occurs when a loud sound (the *masker*) reduces the audibility of a softer sound (the *target*) presented at the same time. The masker spreads its masking effect broadly upward in frequency (upward spread of masking) and narrowly downward. The masking pattern in the frequency domain is called the *excitation pattern*, and its shape is governed by the frequency selectivity of the basilar membrane. A narrowband noise masker centered at 1 kHz masks tones much more effectively above 1 kHz than below, because the traveling wave on the basilar membrane has a gradual basal slope and a steep apical slope.

<div class="definition">
The <strong>threshold of masking</strong> \(L_m(f)\) is the minimum SPL of a sinusoidal target at frequency \(f\) that is detectable in the presence of a masker. For a narrowband noise masker at center frequency \(f_m\) and level \(L\) dB, the masked threshold at a frequency \(\Delta f\) above the masker (in the range \(\Delta f / f_m \in [0, 1]\)) is approximately

\[
L_m(f_m + \Delta f) \approx L - \alpha\, \frac{\Delta f}{f_m},
\]
for a simplified linear model, where \(\alpha\) is a slope parameter on the order of 25–30 dB per octave on the low-frequency side and 50–80 dB per octave on the high-frequency side.
</div>

{{< score id="music276/18-masking" caption="Simultaneous masking: a loud A4 masker obscures a softer B4 target — upward spread of masking means the higher-frequency target is more vulnerable." >}}

*Temporal masking* extends the masking effect into time: *forward masking* (post-stimulatory masking) occurs when the masker raises the threshold for a target presented after the masker has ended, for up to 100–200 ms. *Backward masking* (pre-stimulatory masking) can occur when the masker follows the target by up to about 20 ms — a counterintuitive result explained by the time required for neural processing to reach its decision threshold. Temporal masking plays an important role in the perception of the complex onsets and releases of musical notes, and in the psychoacoustic model underlying perceptual audio coding algorithms such as MP3 (MPEG-1 Audio Layer III) and AAC.

### S.3 Spatial Hearing and the HRTF

The perception of the spatial direction and distance of a sound source is achieved through three primary cues: *interaural time difference* (ITD), *interaural level difference* (ILD), and spectral cues from the pinna (HRTF).

The ITD is the difference in the time of arrival of a sound at the two ears. For a source at azimuth angle \(\theta\) (measured from the median plane), the ITD for a head of radius \(r \approx 8.5\) cm is approximately

\[
\mathrm{ITD} \approx \frac{r}{c}\left(\theta + \sin\theta\right),
\]
which reaches a maximum of about 650–700 \(\mu\)s for a source directly to one side (\(\theta = 90°\)). The auditory system is exquisitely sensitive to ITD: JNDs for ITD can be as small as 10–15 \(\mu\)s (corresponding to about 1° of azimuthal resolution near the median plane). Phase locking in the auditory nerve makes this precision possible for frequencies below about 1500 Hz; above that frequency, phase locking is insufficient for ITD extraction, and the system relies instead on ILD.

The ILD is the difference in sound pressure level between the two ears, caused by the acoustic shadow cast by the head. For frequencies below about 500 Hz, the head is much smaller than the wavelength and casts negligible shadow (\(\mathrm{ILD} \approx 0\)). For frequencies above 2–3 kHz, the head shadow can produce ILDs of 10–20 dB for lateral sources. The combination of ITD and ILD gives unambiguous lateral localization but is insufficient to distinguish front from back or to determine elevation — both of which require spectral cues from the HRTF.

In concert hall acoustics, the binaural reproduction of music via headphones (or two-channel stereo loudspeakers) fails to reproduce the natural HRTF of the listening room and the performer positions. The development of *binaural room impulse response* (BRIR) measurement and convolution-based auralization allows realistic simulations of acoustic spaces, enabling architects to "hear" a hall before it is built.

### S.4 Musical Intervals and the Perception of Harmony

Beyond the pairwise consonance of dyads, harmony in tonal music involves the simultaneous sounding of three or more notes (chords) and the succession of chords over time (harmonic progressions). The psychoacoustics of chord perception extends the dyadic consonance theory in important ways.

For a major triad in root position (frequencies \(f\), \(5f/4\), \(3f/2\) in just intonation), the combined harmonic series of the three notes has a strong common fundamental at \(f\) and extensive partial coincidences among the upper harmonics. The chord is perceived as a *unified sonority* — the three tones fuse into a single perceptual object rather than being heard as three separate pitches — when the partials of the components reinforce a common virtual pitch. The degree of fusion depends on the complexity of the frequency ratios: the simpler the ratios (3:4:5 for a just major triad), the stronger the fusion.

<div class="example">
<strong>Example S.1.</strong> A just major triad on C4 (262 Hz) has tones at approximately:

\[
f_1 = 262 \text{ Hz (C4)}, \quad f_2 = \frac{5}{4} \times 262 = 327.5 \text{ Hz (E4)}, \quad f_3 = \frac{3}{2} \times 262 = 393 \text{ Hz (G4)}.
\]
The harmonic series of C4 includes 262, 524, 786, 1048, 1310, 1572, \ldots Hz.
The harmonic series of E4 includes 327.5, 655, 982.5, 1310, 1637.5, \ldots Hz.
The harmonic series of G4 includes 393, 786, 1179, 1572, 1965, \ldots Hz.
The partials 1310 Hz (5th harmonic of C4, 4th harmonic of E4) and 1572 Hz (6th harmonic of C4, 5th of E4, 4th of G4) and 786 Hz (3rd harmonic of C4, 2nd of G4) all coincide, reinforcing a common perceived pitch at C4. In equal temperament, these coincidences are slightly broken: E4 in 12-TET is 13.7 cents sharp of just, so the 4th harmonic of E4 lands at \(4 \times 262 \times 2^{4/12} \approx 1315\) Hz rather than 1310 Hz — a discrepancy of about 5 Hz, producing slow beats in a quiet sustained context.
</div>

{{< score id="music276/35-just-major-triad" caption="Example S.1: Just major triad C–E–G (4:5:6 ratio) and its equal-tempered counterpart — the 13.7¢ sharp ET major third produces slow beats on the coincident partials." >}}

The *harmonic tension* of a chord in tonal music — its sense of needing to resolve to a more stable chord — is partially explained by the roughness of its partial interactions and partially by learned syntactic expectations built up through musical enculturation. The dominant seventh chord (e.g., G–B–D–F in C major) has a higher roughness score than the tonic major triad (C–E–G) because of the tritone between B and F, whose partials interact in the peak roughness range. This increased roughness corresponds to the strong tendency of the dominant seventh to resolve to the tonic, a relationship that forms the cornerstone of tonal harmony.

{{< score id="music276/26-tonal-hierarchy" caption="Tonal hierarchy: tonic triad (most stable), dominant (tension), subdominant, and scale degree 4 (least stable, tritone from tonic) — stability reflected in resolution tendency." >}}

{{< score id="music276/25-tritone-paradox" caption="Tritone paradox: C–F# and F#–C are interval-class equivalent but perceived as ascending or descending differently depending on the listener's language background." >}}

### S.5 Digital Audio and the Sampling Theorem

Modern music production, distribution, and analysis is almost entirely digital. The conversion of a continuous acoustic signal into a digital representation, and the faithful reconstruction of the original from its digital form, rests on one of the most important results in applied mathematics.

<div class="theorem">
<strong>Nyquist-Shannon Sampling Theorem.</strong> A continuous-time signal \(s(t)\) that is <em>band-limited</em> — containing no frequency components above \(f_{\max}\) — is completely determined by its sample values at a uniform sampling rate \(f_s \ge 2 f_{\max}\). The original signal can be perfectly reconstructed from its samples via sinc interpolation:

\[
s(t) = \sum_{n=-\infty}^{\infty} s\!\left(\frac{n}{f_s}\right) \operatorname{sinc}\!\left(f_s t - n\right), \quad \operatorname{sinc}(x) = \frac{\sin(\pi x)}{\pi x}.
\]
</div>

The sampling rate \(f_s = 44{,}100\) Hz used in the CD standard (established in 1980–1982) was chosen to slightly exceed \(2 \times 20{,}000 = 40{,}000\) Hz — the nominal upper limit of human hearing — with a margin for the practical anti-aliasing filter. At \(f_s = 44.1\) kHz, each second of audio requires \(44{,}100\) samples per channel. With 16-bit quantization (65,536 amplitude levels), a stereo CD stores approximately \(44{,}100 \times 2 \times 16 \approx 1.41\) megabits per second. The signal-to-quantization-noise ratio (SQNR) for uniform \(B\)-bit quantization is approximately

\[
\mathrm{SQNR} \approx 6.02B + 1.76 \text{ dB},
\]
giving \(6.02 \times 16 + 1.76 \approx 98\) dB for 16-bit audio — well within the dynamic range of human hearing for undithered signals.

*Dithering* — the addition of low-level noise before quantization — converts the deterministic quantization distortion (which creates audible harmonic artifacts in low-level signals) into random noise with a flat spectrum, trading a small increase in noise floor for a dramatic improvement in signal quality at low amplitudes. Properly dithered 16-bit audio is widely considered audibly transparent (indistinguishable from higher bit-depth formats) for most musical signals at typical listening levels.

### S.6 Acoustic Impedance and Transmission Lines

The concept of *acoustic impedance* is the fundamental tool for analyzing the behavior of sound in bounded media — tubes, rooms, horns — and at interfaces between different media. It is the acoustic analogue of electrical impedance in circuit theory.

<div class="definition">
The <strong>acoustic impedance</strong> at a point in a duct is defined as the ratio of acoustic pressure \(p\) to volume velocity \(U\) (volume of air flowing past a cross-section per unit time):

\[
Z = \frac{p}{U} \quad \text{(Pa·s/m}^3\text{, or acoustic ohms)}.
\]
For a plane wave traveling in one direction in a duct of cross-sectional area \(S\), the <strong>characteristic impedance</strong> is

\[
Z_0 = \frac{\rho c}{S}.
\]
</div>

The transmission line analogy maps acoustic systems onto electrical circuits: acoustic pressure corresponds to voltage, volume velocity to current, and characteristic impedance to the ratio of voltage to current in a transmission line. A tube of length \(L\) terminated by a load impedance \(Z_L\) has an input impedance

\[
Z_{\mathrm{in}} = Z_0 \frac{Z_L + i Z_0 \tan(kL)}{Z_0 + i Z_L \tan(kL)},
\]
where \(k = \omega/c\) is the wavenumber. This formula predicts the resonant frequencies as the poles of \(Z_{\mathrm{in}}\) (for an open end, \(Z_L \to 0\), giving \(Z_0 \tan(kL) = 0\), i.e., \(kL = n\pi\), or \(f_n = nc/2L\) — the open pipe result).

The impedance formalism is particularly powerful for analyzing the behavior of brass instrument bores, which consist of multiple sections of different bore profile joined end to end. The bore can be discretized into short sections, each modeled as a short transmission line element, and the total input impedance computed by cascading the element impedance matrices — a method implemented in modern brass acoustics simulation software (e.g., the BIAS and BORE programs used in research and instrument design).

### S.6b Active Room Acoustics and Electroacoustic Enhancement

For certain architectural or functional constraints, passive acoustic design alone cannot achieve the desired acoustic character. A multipurpose hall that must serve both unamplified orchestral concerts (needing \(T_{60} \approx 2\) s) and amplified theatre or opera (needing \(T_{60} \approx 0.8\) s) cannot optimally satisfy both requirements with fixed passive surfaces. Similarly, a historic building may have architectural constraints that preclude adding the absorbing or diffusing surfaces needed for good speech intelligibility.

*Electroacoustic enhancement* (EAE) systems address these challenges by using arrays of microphones, digital signal processing, and loudspeakers to modify the perceived acoustic character of a space. The two main approaches are *reverberation enhancement* (adding synthetic reverberation to make a room "sound larger") and *direct-sound reinforcement* (boosting the direct sound level without adding reverberation, as in conventional sound reinforcement).

The *LARES* (Lexicon Acoustic Reverberation Enhancement System) and *SIAP* (System for Improved Acoustic Performance) are early examples of reverberation enhancement systems. More sophisticated modern systems, such as *VRAS* (Variable Room Acoustics System) and *CARMEN*, use feedback between microphone arrays and loudspeaker arrays to create controllable gain in the late-reverberant field. The gain must remain below the *Larsen threshold* — the feedback gain at which the system becomes unstable and produces a howl — which limits the maximum achievable increase in \(T_{60}\). For practical installations, increases of 50–100% in \(T_{60}\) are achievable without audible artifacts.

A subtler application is *acoustic glare reduction* using active diffusion: loudspeakers positioned at specular reflection points play back delayed, decorrelated versions of the direct sound, creating the effect of a diffuse surface and reducing harsh specular reflections from flat parallel walls.

### S.7 The Acoustics of Rooms at Low Frequencies

Sabine's diffuse-field theory (Chapter 6) becomes inaccurate at low frequencies, where the room dimensions are comparable to or smaller than the acoustic wavelength. In this regime — typically below a few hundred hertz, depending on room size — the acoustic field is dominated by a small number of *room modes*, the standing-wave resonances of the enclosure.

For a rectangular room of dimensions \(L_x \times L_y \times L_z\), the modal frequencies are given by

\[
f_{mnp} = \frac{c}{2}\sqrt{\left(\frac{m}{L_x}\right)^2 + \left(\frac{n}{L_y}\right)^2 + \left(\frac{p}{L_z}\right)^2}, \quad m, n, p = 0, 1, 2, \ldots
\]
not all zero simultaneously. The lowest room mode is the *axial mode* along the longest dimension: for a 10 m room, \(f_{100} = 343/20 \approx 17\) Hz — below the range of most music. The density of modes increases as \(f^2\) (roughly), so above a certain *Schroeder frequency*

\[
f_S \approx 2000\sqrt{\frac{T_{60}}{V}} \text{ Hz},
\]
modes overlap so densely that the field becomes diffuse and Sabine's formula applies. For a room with \(V = 200\) m\(^3\) and \(T_{60} = 0.5\) s, \(f_S \approx 2000\sqrt{0.5/200} \approx 100\) Hz.

Below \(f_S\), low-frequency acoustics in a room is a mode problem, not a diffuse-field problem. The audible consequence is *bass coloration*: certain bass frequencies are strongly reinforced (where the source is at an antinode of a room mode and the listener is also at an antinode) and others are strongly attenuated (where source or listener is at a node). This is why a home listening room sounds radically different at different positions — the bass response can vary by 20–30 dB across the room. Low-frequency room treatment (bass traps — thick, dense absorbing panels placed at pressure antinodes, typically room corners) is the most effective mitigation.

### S.8 Psychoacoustics of Vibrato and Tremolo

Vibrato and tremolo are two of the most common expressive devices in music, often confused but acoustically distinct.

*Vibrato* is a periodic modulation of frequency (pitch) around a nominal center frequency. For a sinusoidal vibrato at modulation rate \(f_v\) Hz and depth \(\Delta f\) Hz, the instantaneous frequency is

\[
f(t) = f_0 + \Delta f \sin(2\pi f_v t),
\]
and the signal is a *frequency-modulated* (FM) tone. The instantaneous phase is

\[
\phi(t) = 2\pi \int_0^t f(\tau)\, d\tau = 2\pi f_0 t + \frac{\Delta f}{f_v}\cos(2\pi f_v t),
\]
so the modulation index is \(\beta = \Delta f / f_v\). For a violin vibrato with depth \(\Delta f = 20\) Hz (about \(\pm 13\) cents at A4) and rate \(f_v = 6\) Hz, the modulation index is \(\beta = 20/6 \approx 3.3\). Fourier analysis of an FM tone shows sidebands at \(f_0 \pm n f_v\) for all integers \(n\), with amplitudes given by Bessel functions \(J_n(\beta)\) — so a deep vibrato has significant energy spread over many sidebands, enriching the timbre markedly.

Perceptually, vibrato at rates of 5–8 Hz with depths of 25–50 cents is characteristic of classical string and vocal performance. It enriches the timbre (FM sidebands spread energy around each harmonic), helps the voice or instrument project over accompaniment (frequency smearing reduces cancellation by room modes), and contributes to the perceived warmth and expressivity of the tone. Interestingly, vibrato also serves as a *perceptual glue* in ensemble intonation: the constant frequency fluctuation makes small pitch deviations between instruments less salient, partially masking the beats that would otherwise reveal mistuning.

*Tremolo* is a periodic modulation of amplitude (loudness) at a modulation rate \(f_t\). For a sinusoidal amplitude modulation:

\[
s(t) = \bigl[1 + m\sin(2\pi f_t t)\bigr]\cos(2\pi f_0 t),
\]
where \(m \in [0, 1]\) is the modulation depth. By the product-to-sum identity, this equals

\[
s(t) = \cos(2\pi f_0 t) + \frac{m}{2}\cos\bigl(2\pi(f_0 + f_t)t\bigr) + \frac{m}{2}\cos\bigl(2\pi(f_0 - f_t)t\bigr),
\]
showing that amplitude modulation creates exactly two sidebands at \(f_0 \pm f_t\). Tremolo at rates of 4–8 Hz produces a pulsating, heartbeat-like effect used in organs (the *tremulant* mechanism), electric guitars, and certain orchestral passages. The perceptual distinction between vibrato and tremolo is important: vibrato in classical performance tends to be centered on the notated pitch (the time-averaged pitch is close to the target), while tremolo does not change the perceived pitch at all for slow modulation rates.

<div class="remark">
The perceptual boundary between vibrato and amplitude modulation that produces roughness lies at the threshold of about 15–20 Hz modulation rate. Below this rate, amplitude modulation is heard as a slow pulsation or tremolo; above it, the modulation produces roughness and ultimately (above about 50 Hz for typical carrier frequencies) creates the sensation of two separate tones. This is the same roughness boundary that governs the perception of dissonant beats between partials — a beautiful unification of two apparently different musical phenomena under the single concept of temporal modulation resolution in the auditory system.
</div>

{{< score id="music276/34-vibrato-tremolo" caption="Vibrato vs. tremolo: upper staff shows a sustained note with pitch-modulation ties (vibrato); lower staff shows alternating forte/piano articulation (tremolo amplitude modulation)." >}}

### S.9 The Piano Action: Mechanics and Acoustics

The *piano action* — the mechanical system between the key and the string — is an engineering marvel of the 19th century and represents the most mechanically complex part of any common musical instrument. A modern grand piano action contains approximately 12,500 parts, and each of the 88 notes has an independent action assembly with roughly the same number of moving components as a fine mechanical watch.

The key function of the piano action is the *escapement*: a mechanism that allows the hammer to be thrown toward the string with the velocity imparted by the player's finger, then to escape from the key mechanism and fall back freely after striking, so that the string can vibrate undamped while the key is still depressed. Without the escapement, the hammer would damp the string immediately after contact, killing the tone. The *repetition mechanism* (or *double escapement*, invented by Sébastien Érard in 1821) allows the hammer to return to an intermediate position after the first blow, enabling rapid re-striking of the same note without fully releasing the key — essential for fast repeated-note passages and trills.

The acoustic consequence of the hammer's mechanical properties is significant. A new, unworn piano hammer has a felt covering of graded hardness — softer on the outside, harder on the inside (near the molton core). At low velocities (soft playing), the outer soft felt is compressed during contact, and the contact duration is long (roughly 4–8 ms). Long contact acts as a low-pass filter on the spectral content transmitted to the string: harmonics with half-wavelengths shorter than the contact duration are suppressed. At high velocities (loud playing), the harder inner felt contacts the string with a short duration (1–2 ms), and the high-frequency harmonics are transmitted strongly — producing the bright, sharp tone of a fortissimo piano attack. This velocity-dependent spectral balance is the fundamental mechanism of the piano's dynamic expressivity, and it is precisely what distinguishes a well-regulated piano with properly voiced hammers from a poorly maintained one.

The total sound of a piano note is also shaped by the *duplex scale* — short lengths of string beyond the bridge that are not the primary speaking length but are connected sympathetically to it. These segments, tuned to harmonics of the note by adjusting their length, add a faint but characteristic halo of overtone resonance to the piano's sound, particularly at soft dynamics. The duplex scale is present in most modern concert grand pianos and is considered by many builders to contribute to the instrument's characteristic richness and sustain.

### S.9b Perceptual Audio Coding and Musical Quality

The development of perceptual audio codecs — systems that compress digital audio by discarding information that the ear cannot perceive — is one of the most successful applications of psychoacoustic theory to engineering. The MP3 (MPEG-1 Audio Layer III) codec, introduced in 1993, achieves compression ratios of 10:1 or higher over uncompressed PCM audio by exploiting three psychoacoustic phenomena: simultaneous masking, temporal masking, and the critical band structure of auditory frequency analysis.

The encoding process divides the audio spectrum into subbands corresponding approximately to critical bands (32 subbands in Layer III, further refined by a modified discrete cosine transform). Within each subband, it computes the *masking threshold* — the minimum level of a signal that would be audible given the levels of other signals in adjacent bands and in adjacent time frames. Any signal component below its masking threshold is inaudible and can be quantized with fewer bits (or discarded entirely) without perceptible degradation. Bits are then dynamically allocated across subbands, concentrating quantization precision where it is most needed.

At bitrates of 128 kbps (kilobits per second), MP3 is often indistinguishable from uncompressed CD audio (\(\approx 1411\) kbps) in casual listening. In critical listening by trained subjects using high-quality playback systems, artifacts become audible — particularly a *pre-echo* on transient sounds (a brief burst of quantization noise that precedes a sharp attack, arising from the MDCT's finite time-frequency uncertainty) and *tonal noise* under complex musical passages where the masking model is violated. At 320 kbps, MP3 is considered transparent (indistinguishable from CD) by the overwhelming majority of listeners.

The AAC (Advanced Audio Coding) codec, introduced in 1997 and used by iTunes and streaming services, improves on MP3 through more efficient entropy coding, improved joint stereo coding, and a more accurate perceptual model, achieving CD-transparent quality at bitrates around 128–192 kbps for most musical content.

### S.10 The Physics of the Singing Bowls and Struck Idiophones

Tibetan singing bowls, crystal bowls, and the Chinese bianzhong (set of tuned bells) represent a distinct category of struck idiophones whose acoustic behavior illuminates several of the principles discussed throughout this course. The singing bowl, made of an alloy of five to seven metals, is struck with a padded mallet and sustained by rubbing the rim with a wooden or leather-covered stick. The friction between stick and rim excites the bowl into oscillation through a mechanism closely analogous to the bowed string: a stick-slip interaction that preferentially excites the fundamental mode, with the frequency determined by the bowl's geometry and material.

The fundamental mode of a singing bowl is the \((2, 0)\) mode — two nodal lines and zero nodal circles — corresponding to an elliptical deformation of the circular rim: the rim alternately flattens and elongates in orthogonal directions. The frequency of this mode for a bowl of radius \(a\), wall thickness \(h\), density \(\rho\), and Young's modulus \(E\) is approximately

\[
f_{20} \approx \frac{h}{2\pi a^2}\sqrt{\frac{E}{3\rho(1-\nu^2)}},
\]
where \(\nu\) is Poisson's ratio of the bowl material. The Chladni pattern of a singing bowl struck and dusted with fine powder reveals four antinodal regions alternating with four nodal regions around the circumference, corresponding to the four-lobed deformation of the \((2, 0)\) mode.

The acoustic radiation from a singing bowl is *directional*: because the bowl radiates as a quadrupole (four antinodes alternately expanding and contracting), the sound field has four lobes of maximum intensity at 45° to the nodal lines and four nodes in the directions of the Chladni nodal lines. A listener slowly circling the bowl will hear four maxima and four minima of loudness per revolution. This directional pattern also means that the bowl is a very inefficient radiator: the quadrupole radiation falls off more rapidly with distance than a dipole or monopole, which is why singing bowls are quiet instruments best experienced in close proximity.

### S.11 Bioacoustics, Hearing Damage, and Conservation of Musical Hearing

No account of the science of musical sound would be complete without attention to the fragility of the auditory system and the occupational hazards faced by musicians. The cochlear hair cells that transduce acoustic energy into neural signals are among the most metabolically active cells in the body and are exquisitely sensitive to damage from excessive noise exposure and ototoxic chemicals.

Noise-induced hearing loss (NIHL) results from both acute acoustic trauma (a single very loud event, such as an explosion or a gunshot, which can rupture the tectorial membrane or destroy hair cells outright) and cumulative noise exposure (prolonged exposure at moderate-to-high levels, which depletes the energy reserves of hair cells and eventually leads to their death). Hair cells, once destroyed, do not regenerate in mammals — hearing loss from NIHL is irreversible. The risk of damage is described by equal-energy models: the acoustic energy dose is

\[
\mathcal{D} = \int_0^T I(t)\, dt,
\]
and the risk of damage is approximately constant for a given total energy dose, regardless of whether it is delivered rapidly (high intensity, short time) or slowly (lower intensity, long time).

<div class="remark">
Musicians are at substantially elevated risk of hearing loss compared to the general population. Orchestral musicians are regularly exposed to levels of 85–105 dB SPL during rehearsals and concerts; percussionists and brass players in positions near each other face the highest exposures. A 2011 study of European orchestral musicians found that 52% reported tinnitus (ringing in the ears) and 43% had measurable high-frequency hearing loss attributable to occupational noise. The implementation of musician's earplugs — custom-molded, flat-attenuation devices that reduce sound levels by a fixed amount (15 or 25 dB) uniformly across frequencies, unlike conventional foam plugs that preferentially attenuate high frequencies — has become increasingly standard practice in professional orchestral settings.
</div>

{{< score id="music276/19-loudness-dynamics" caption="Occupational noise levels: the same A4 at ppp (~40 dB), mp (~70 dB), and fff (~100 dB), illustrating the range from safe to hazardous orchestral exposure." >}}

The perceptual consequences of hearing loss extend beyond reduced sensitivity. Cochlear damage destroys not only the passive mechanics of the basilar membrane but also the active cochlear amplifier provided by the outer hair cells. The result is a broadening of auditory filters (reduced frequency selectivity), which impairs the ability to separate concurrent sounds in a complex auditory scene — the phenomenon known as the *cocktail party problem*. For musicians, the consequences of reduced frequency selectivity include difficulty in hearing individual lines within a polyphonic texture, impaired tuning sensitivity, and reduced ability to detect small intonation errors — the very skills most central to musical excellence. Preserving musical hearing is not merely a quality-of-life issue but a professional necessity, and the acoustical science of hearing protection deserves the same careful attention as the science of concert hall design or instrument acoustics.

### S.12 Consonance in Spectral Music and Microtonal Composition

{{< score id="music276/11-overtone-chord" caption="Spectral music basis: the first 6 partials of C2 voiced as a chord — Grisey's *Partiels* begins with exactly this overtone sonority orchestrated across the ensemble." >}}

The 20th and 21st centuries have seen composers systematically interrogate the assumptions of the Western tonal tradition, including the harmonic series, equal temperament, and the consonance hierarchy. *Spectral music*, originating in Paris in the 1970s with composers such as Gérard Grisey and Tristan Murail, takes the harmonic series as its primary compositional material: chords are derived directly from the partial series of a chosen fundamental, and the microtonally precise frequency ratios of the partials are approximated using quarter-tones, eighth-tones, or other microtonal notation.

Grisey's *Partiels* (1975), for large ensemble, begins with the sound of a low E on the trombone and then unfolds an orchestrated "slow-motion" version of its harmonic series — each partial assigned to a different instrument, with microtonal adjustments to bring all partials to their just positions rather than their equal-tempered approximations. The result is a chord of extraordinary resonance and fusion, because all partials of the chord are exact multiples of the fundamental: the entire ensemble sounds as if it is a single giant instrument producing its natural overtones.

*Microtonal equal temperaments* other than 12-TET provide alternative tuning environments with different patterns of consonance and dissonance. 19-TET (dividing the octave into 19 equal steps) approximates the pure major third (386.3 cents) very closely: the 19-TET major third is \(6 \times 1200/19 \approx 378.9\) cents, only 7.4 cents flat of just — much closer than 12-TET's 13.7 cents sharp. 19-TET also has a near-pure minor third and reasonable approximations to the seventh harmonic (7:4), making it attractive for just-intonation-like harmonies in a closed, equal-tempered system. 31-TET approximates quarter-comma meantone almost exactly (each fifth is \(18 \times 1200/31 \approx 696.8\) cents, compared to 696.6 cents in quarter-comma meantone) and provides near-pure approximations to nearly all just intervals up to the 11th harmonic, at the cost of a more complex notation system.

<div class="example">
<strong>Example S.2.</strong> In 31-TET, the step size is \(1200/31 \approx 38.7\) cents. The major third is \(10 \times 38.7 \approx 387\) cents — only 0.7 cents sharp of just. The perfect fifth is \(18 \times 38.7 \approx 696.8\) cents — only 5.2 cents flat of just (almost identical to quarter-comma meantone). The harmonic seventh (7:4 \(\approx 968.8\) cents) is approximated by \(25 \times 38.7 \approx 967.7\) cents — only 1.1 cents flat. This extraordinary approximation quality of 31-TET for low-prime harmonics was recognized by Christiaan Huygens in 1691, long before the systematic study of microtonal temperaments.
</div>

{{< score id="music276/07-just-intonation-scale" caption="Example S.2: Just intonation scale ratios — 31-TET approximates these ratios to within 1¢ for the major third and harmonic seventh." >}}

The development of electronic and computer music has liberated composers from the physical constraints of fixed-pitch mechanical instruments. Arbitrary frequency ratios, including irrational ones, can be specified and realized with perfect accuracy. Composers such as Harry Partch (who built custom instruments in 43-tone just intonation), La Monte Young (who explored sustained just-intonation drones), and James Tenney (who used rational frequency ratios derived from the harmonic series in a rigorous compositional framework) have demonstrated that the tonal resources of just intonation far exceed those of any equal temperament, at the cost of requiring purpose-built instruments or electronic realization. The science of tuning systems is therefore not a closed chapter from the 18th century but a living field at the intersection of acoustics, mathematics, and compositional aesthetics.

### S.13 Summary of Key Physical and Perceptual Parameters

{{< score id="music276/27-absolute-pitch" caption="Absolute pitch exercise: four pitches (F#4, Eb5, B3, Ab4) for identification by pitch name alone — a test of absolute pitch ability." >}}

{{< score id="music276/28-gestalt-grouping" caption="Gestalt grouping by proximity: notes in the low register form one group (A), notes in the high register form another (B) — proximity is a primary streaming cue." >}}

{{< score id="music276/20-rhythmic-meter" caption="Metric accent patterns: 4/4 (strong–weak–weak–weak) vs. 3/4 (strong–weak–weak) — meter shapes rhythmic expectation and accent perception." >}}

{{< score id="music276/29-rhythmic-expectation" caption="Rhythmic expectation and violation: a regular 4/4 pattern is established, then the expected downbeat is omitted — the missing beat creates a palpable perceptual surprise." >}}

The following table collects the key quantitative parameters that have appeared throughout these notes, for quick reference.

<div class="definition">
<strong>Reference table of acoustic and psychoacoustic quantities.</strong>

| Quantity | Symbol | Typical value or formula | Unit |
|---|---|---|---|
| Speed of sound (20°C) | \(c\) | 343 | m/s |
| Reference intensity | \(I_0\) | \(10^{-12}\) | W/m\(^2\) |
| Reference pressure | \(p_0\) | \(2 \times 10^{-5}\) | Pa |
| Frequency range of hearing | — | 20–20,000 | Hz |
| Basilar membrane length | — | 35 | mm |
| Number of inner hair cells | — | 3,500 | — |
| Critical bandwidth (1 kHz) | CB | 130 (approx.) | Hz |
| JND in frequency (1 kHz) | — | 2–3 | Hz |
| Threshold of pain | — | 120 | dB SPL |
| Vocal tract length (adult male) | \(L_{vt}\) | 17 (approx.) | cm |
| Singer's formant | — | 2500–3500 | Hz |
| Pythagorean comma | \(\Pi\) | 23.5 | cents |
| Syntonic comma | — | 21.5 | cents |
| 12-TET major third error | — | +13.7 (sharp) | cents |
| 12-TET fifth error | — | −2.0 (flat) | cents |
| Sabine constant | — | 0.161 | m\(^3\)/(m\(^2\)·s) |
| Precedence effect window | — | 30–35 | ms |
| Optimal \(T_{60}\) (orchestra) | — | 1.8–2.2 | s |
| CD sampling rate | \(f_s\) | 44,100 | Hz |
| CD dynamic range (16-bit) | SQNR | 98 (approx.) | dB |
</div>

{{< score id="music276/24-melodic-minor" caption="Melodic vs. harmonic minor scales in A: the raised 6th and 7th degrees of the melodic minor (ascending) contrast with the augmented 2nd of the harmonic minor." >}}

These numbers are not mere cataloguing; each one is the crystallized result of a physical derivation, an experimental measurement, or both, and each connects directly to the practical decisions made by instrument makers, concert hall architects, recording engineers, and performing musicians every day. The science of musical sound is, ultimately, a science of these connections — the web of relationships linking the restoring force in a vibrating string, the nonlinear mechanics of a bowed bow hair, the logarithmic mapping of the basilar membrane, the roughness of a mistuned third, the reflections from the plasterwork of a 19th-century Viennese concert hall, and the subjective experience of beauty in organized sound.

---
