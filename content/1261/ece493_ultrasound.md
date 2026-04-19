---
title: "ECE 493: Ultrasound in Medicine and Biology"
prof: "Di Xiao"
subjects: "ECE"
---

## Sources and References

**Primary texts** — Szabo, T. L. (2014). *Diagnostic Ultrasound Imaging: Inside Out* (2nd ed.). Academic Press. — Cobbold, R. S. C. (2007). *Foundations of Biomedical Ultrasound*. Oxford University Press.

**Supplementary texts** — Kremkau, F. W. (2016). *Sonography: Principles and Instruments* (9th ed.). Elsevier. — Duck, F. A., Baker, A. C., & Starritt, H. C. (Eds.). (1998). *Ultrasound in Medicine*. IOP Publishing. — Jensen, J. A. (1996). *Estimation of Blood Velocities Using Ultrasound*. Cambridge University Press.

**Online resources** — IEEE Transactions on Ultrasonics, Ferroelectrics, and Frequency Control (open archive); Ultrasound in Medicine and Biology (Elsevier); Physics in Medicine and Biology tutorials; MIT OpenCourseWare 6.003 Signals and Systems (for Fourier foundations).

---

# Chapter 1: Basic Ultrasound Principles

## 1.1 The Nature of Ultrasound

Ultrasound refers to mechanical (acoustic) waves with frequencies above the audible range — conventionally above 20 kHz. In diagnostic medical imaging, frequencies typically fall in the range of 1–20 MHz, while therapeutic applications can extend to several tens of MHz for high-intensity focused ultrasound (HIFU) or drop to hundreds of kHz for lithotripsy and sonoporation.

Acoustic waves in soft tissue are primarily **longitudinal waves**: the particles of the medium oscillate along the direction of wave propagation. The wave is characterized by local oscillations in pressure, density, and particle displacement about equilibrium values.

For a plane wave propagating in the \(+x\) direction, the acoustic pressure field is:

\[
p(x,t) = P_0 \cos(kx - \omega t)
\]

where \(P_0\) is the pressure amplitude, \(k = \omega/c\) is the wavenumber, \(\omega = 2\pi f\) is the angular frequency, and \(c\) is the speed of sound in the medium.

The **wave equation** governing acoustic pressure in a homogeneous, lossless medium is:

\[
\nabla^2 p = \frac{1}{c^2} \frac{\partial^2 p}{\partial t^2}
\]

In three dimensions, this admits spherical wave solutions of the form \(p = (A/r)\cos(kr - \omega t)\), relevant to point source radiation.

## 1.2 Speed of Sound and Acoustic Impedance

The speed of sound in a medium depends on its elastic properties:

\[
c = \sqrt{\frac{B}{\rho_0}}
\]

where \(B\) is the adiabatic bulk modulus and \(\rho_0\) is the equilibrium mass density. In soft biological tissues, \(c \approx 1540 \text{ m/s}\) — close to the value in water (1480 m/s at 20°C) — because tissue is mostly water. Bone has higher speed (~3500 m/s); fat is slower (~1450 m/s); lung is much slower (~650 m/s) due to air content.

**Acoustic impedance** \(Z\) is the ratio of acoustic pressure to particle velocity:

\[
Z = \rho_0 c \quad [\text{Pa·s/m} = \text{Rayl}]
\]

Acoustic impedance determines how acoustic energy distributes at interfaces. Typical values: water \(\approx 1.5 \text{ MRayl}\), soft tissue \(\approx 1.5\text{–}1.7 \text{ MRayl}\), bone \(\approx 7.8 \text{ MRayl}\), air \(\approx 0.0004 \text{ MRayl}\).

## 1.3 Reflection, Transmission, and Refraction

When a plane wave encounters a planar interface between two media with impedances \(Z_1\) and \(Z_2\), the **pressure reflection coefficient** for normal incidence is:

\[
R = \frac{Z_2 - Z_1}{Z_2 + Z_1}
\]

and the **pressure transmission coefficient** is:

\[
T = \frac{2Z_2}{Z_2 + Z_1}
\]

The corresponding **intensity reflection and transmission coefficients** (\(R_I\) and \(T_I\)) follow from \(R_I = R^2\) and \(T_I = 1 - R_I\) (energy conservation at the interface). At the tissue–air interface, \(Z_1 \approx 1.5 \text{ MRayl}\) and \(Z_2 \approx 0.0004 \text{ MRayl}\), giving \(R \approx -1\): virtually total reflection, which is why ultrasound gel is required to couple the transducer to skin and why imaging through air-filled structures (lung, intestine) is impractical.

For oblique incidence at angle \(\theta_i\) (measured from the normal), Snell's law governs the transmitted beam direction:

\[
\frac{\sin\theta_t}{c_2} = \frac{\sin\theta_i}{c_1}
\]

Refraction at interfaces where \(c_1 \neq c_2\) introduces registration errors in ultrasound images because the scanner assumes straight-line propagation.

## 1.4 Attenuation

Real tissues absorb and scatter acoustic energy, attenuating the wave as it propagates. The pressure amplitude decays exponentially:

\[
p(x) = p_0 \, e^{-\alpha x}
\]

where \(\alpha\) is the **attenuation coefficient** with units of Np/m or (more commonly in clinical contexts) dB/cm. Tissue attenuation increases roughly linearly with frequency:

\[
\alpha \approx \alpha_0 f \quad [\text{dB/cm}]
\]

with \(\alpha_0 \approx 0.5\text{–}1.0\) dB/(cm·MHz) for soft tissues. This frequency dependence is fundamental to the depth–resolution trade-off in diagnostic ultrasound: higher frequencies give finer spatial resolution but penetrate less deeply.

**Attenuation mechanisms** in tissue include:
- *Absorption*: conversion of acoustic energy to heat via viscous and thermal losses.
- *Scattering*: redirection of energy by inhomogeneities (cells, organelles, collagen fibers) smaller than or comparable to the wavelength.
- *Specular reflection*: energy loss at large, smooth interfaces.

---

# Chapter 2: Basics of Ultrasound Imaging

## 2.1 Pulse-Echo Imaging

Clinical B-mode (brightness-mode) ultrasound imaging is based on **pulse-echo ranging**. The transducer emits a short pulse (typically 2–3 cycles at the center frequency), and the scanner records the returning echoes as a function of time. Since \(c\) is assumed constant (~1540 m/s), the round-trip travel time \(t\) maps directly to depth:

\[
d = \frac{c \cdot t}{2}
\]

The amplitude of the returning echo is mapped to pixel brightness. Each transmitted pulse produces one **A-line** (amplitude vs. depth). By electronically or mechanically sweeping the beam direction, a two-dimensional cross-section (**B-mode image**) is constructed from many A-lines.

**Axial resolution** (along the beam direction) is set by the pulse length:

\[
\Delta z_{\text{axial}} = \frac{c \tau}{2}
\]

where \(\tau\) is the pulse duration. Shorter pulses (higher frequency, wider bandwidth) give finer axial resolution. A 5 MHz transducer with a 2-cycle pulse gives \(\tau \approx 0.4 \,\mu\text{s}\), so \(\Delta z_{\text{axial}} \approx 0.3 \text{ mm}\).

**Lateral resolution** (perpendicular to the beam) is set by beam width at the focal depth:

\[
\Delta x_{\text{lateral}} \approx \frac{\lambda \cdot F}{D}
\]

where \(\lambda = c/f\) is the wavelength, \(F\) is the focal distance, and \(D\) is the aperture diameter. Focusing narrows the beam at the focal depth but the beam diverges beyond the Rayleigh range.

## 2.2 Transducer Physics

**Piezoelectric transducers** are the standard technology for medical ultrasound. A piezoelectric crystal (historically PZT — lead zirconate titanate; increasingly PVDF polymer or piezoMEMS) converts between electrical and mechanical energy. An applied voltage causes mechanical strain (inverse piezoelectric effect, used for transmission); pressure on the crystal generates a voltage (direct piezoelectric effect, used for reception).

The transducer's **resonant frequency** is determined by its thickness \(L\):

\[
f_0 = \frac{c_{\text{crystal}}}{2L}
\]

A **matching layer** of thickness \(\lambda/4\) at the crystal–tissue interface maximizes acoustic power transfer by presenting the geometric mean impedance: \(Z_{\text{match}} = \sqrt{Z_{\text{crystal}} Z_{\text{tissue}}}\).

**Backing material** with high acoustic impedance and strong attenuation damps the crystal's free oscillation, shortening the pulse and broadening the bandwidth — essential for good axial resolution.

## 2.3 Array Transducers and Electronic Scanning

Modern clinical scanners use **phased arrays** and **linear arrays** of hundreds of individual piezoelectric elements. Electronic beam steering and focusing are achieved by controlling the timing (delay profile) of excitation and receive signals across elements:

- **Transmit focusing**: firing elements with delays \(\tau_i\) such that pulses arrive simultaneously at the focal point.
- **Receive focusing (dynamic focusing)**: applying time-varying delays to the received signals at each depth during A-line reconstruction.

The **delay profile** for focusing at depth \(F\) with element \(i\) at lateral position \(x_i\):

\[
\tau_i = \frac{\sqrt{F^2 + x_i^2} - F}{c}
\]

Beam steering to angle \(\theta\) from normal requires an additional linear phase gradient across the array.

**Linear array** scanners fire element sub-apertures sequentially to scan a rectangular field of view — common in abdominal and obstetric imaging. **Phased arrays** (smaller footprint) steer the beam through a wide angular range — used in cardiac (echocardiography) through small acoustic windows (intercostal space).

---

# Chapter 3: Ultrasound Imaging Acquisition and Beamforming

## 3.1 Beamforming Fundamentals

**Beamforming** is the process of combining signals from multiple elements (on receive) or shaping the excitation (on transmit) to form a spatially directed, focused beam. On receive, the received radio-frequency (RF) signal from element \(i\) is \(r_i(t)\). The coherently summed (delay-and-sum) beamformed signal is:

\[
s(t) = \sum_{i=1}^{N} w_i \cdot r_i(t - \tau_i(t))
\]

where \(w_i\) are apodization weights that taper the aperture to reduce sidelobe levels.

**Sidelobes** are grating lobes from periodic element spacing and spatial side-lobes from abrupt aperture truncation. Apodization (Hann, Hamming, or Gaussian windows) trades peak sidelobe level for main-lobe width — a parallel to windowing in digital signal processing.

## 3.2 Image Formation Pipeline

The signal processing pipeline from raw element data to a B-mode image involves:

1. **RF data acquisition** — analog-to-digital conversion of each element's received signal (typically 10–40 MHz sampling rate).
2. **Time-gain compensation (TGC)** — depth-dependent amplification to compensate for attenuation, ensuring that equal reflectors at different depths produce equal image brightness.
3. **Delay-and-sum beamforming** — applying dynamic receive delays to focus the received data.
4. **Envelope detection** — demodulation of the RF signal to extract the echo amplitude envelope. The analytic signal \(s_a(t) = s(t) + j\mathcal{H}\{s(t)\}\) (where \(\mathcal{H}\) is the Hilbert transform) has magnitude \(|s_a(t)|\) equal to the envelope.
5. **Log compression** — mapping the wide dynamic range (~80–100 dB) of tissue echoes to the display range (~30–40 dB) using a logarithmic grayscale transfer function.
6. **Scan conversion** — mapping the polar (or sector) coordinate beamformed data to a rectangular display grid via interpolation.

## 3.3 Coherent Plane-Wave Compounding

Classical focused imaging fires one focused beam per A-line, limiting frame rate. **Plane-wave (unfocused) transmission** illuminates the entire field of view with a single transmission, enabling very high frame rates (hundreds to thousands per second). By coherently compounding reconstructed images from plane waves transmitted at multiple angles \(\theta_k\):

\[
I_{\text{compound}} = \left| \sum_{k} s_k(x,z) \right|^2
\]

coherent compounding recovers image quality (resolution and contrast) comparable to conventional focused imaging while maintaining high temporal resolution. This enables **ultrafast ultrasound imaging** — applications include functional brain imaging via neurovascular coupling detection, myocardial strain imaging, and super-resolution vascular imaging.

---

# Chapter 4: Ultrasound-Based Blood Flow Measurements

## 4.1 The Doppler Effect

When a target moves relative to the transducer, the received frequency differs from the transmitted frequency by the **Doppler shift**:

\[
f_d = \frac{2 f_0 v \cos\theta}{c}
\]

where \(v\) is the target speed, \(\theta\) is the angle between the velocity vector and the beam direction, and \(f_0\) is the transmit frequency. For typical blood velocities (0.1–1 m/s) and diagnostic frequencies (3–10 MHz), Doppler shifts fall in the audible range (hundreds to thousands of Hz), which is why early Doppler systems used audible output.

The Doppler equation contains \(\cos\theta\): Doppler measurements are angle-dependent. At \(\theta = 90°\) (beam perpendicular to flow), no Doppler shift is detected. Accurate velocity quantification requires careful angle correction or angle-independent techniques.

## 4.2 Pulsed-Wave and Color Doppler

**Continuous-wave (CW) Doppler** transmits and receives simultaneously through separate crystals, with unlimited depth range and sensitivity but no depth selectivity.

**Pulsed-wave (PW) Doppler** gates the receiver to a specific depth (sample volume), enabling depth-resolved velocity measurements. The pulsed system transmits pulses at pulse repetition frequency (PRF) and samples the received signal at the same rate. The received phase shift between successive pulses is proportional to the Doppler shift. The maximum unambiguous velocity is limited by the Nyquist criterion applied to the PRF:

\[
v_{\max} = \frac{c \cdot \text{PRF}}{4 f_0 \cos\theta}
\]

**Color flow imaging** extends PW Doppler to display velocity as a color overlay on the B-mode image. Each image pixel is processed for mean Doppler shift (typically via autocorrelation), and coded red (toward transducer) or blue (away). The frame rate is inversely related to the number of focal zones and the color packet size (number of pulses per direction).

## 4.3 Power Doppler and Vector Flow Imaging

**Power Doppler** displays the integrated Doppler power (zeroth lag of the autocorrelation), which is proportional to the number of moving scatterers rather than their velocity. Power Doppler is more sensitive to slow flow and eliminates angle dependence, making it useful for perfusion imaging, at the cost of velocity directional information.

**Vector flow imaging** — achieved through transverse oscillation beamforming or speckle tracking — recovers both axial and lateral velocity components, enabling angle-independent quantitative flow visualization. This is increasingly important in cardiovascular applications where complex, multidirectional flow is clinically significant.

---

# Chapter 5: Ultrasound Wave-Matter Interactions

## 5.1 General Interactions in Imaging

Beyond specular reflection at smooth interfaces, ultrasound interacts with tissue through:

**Diffuse scattering** — wavelength-scale or sub-wavelength tissue structures (red blood cells with diameter ~8 μm at diagnostic frequencies of 3–10 MHz) act as Rayleigh scatterers. Rayleigh scattering intensity scales as \(f^4\) — strongly favoring higher frequencies — and is isotropic. Blood, which consists of billions of such scatterers, produces the characteristic speckle pattern in Doppler imaging.

**Speckle** — the granular texture in B-mode images — is an interference pattern arising from coherent superposition of echoes from spatially unresolved scatterers. Speckle is not noise in the traditional sense: it contains information about the scatterer distribution and is reproducible for a given transducer position. However, it reduces contrast resolution and obscures subtle tissue features. Compounding (frequency compounding, spatial compounding) reduces speckle by averaging partially decorrelated images.

## 5.2 Nonlinear Ultrasonics and Harmonic Imaging

The wave equation derived in Section 1.1 assumes linear acoustics. At finite amplitudes — such as those used in diagnostic imaging (peak pressures of 0.1–3 MPa at the focus) — nonlinear effects are significant. The **Westervelt equation** governs nonlinear wave propagation in a lossy medium:

\[
\nabla^2 p - \frac{1}{c_0^2}\frac{\partial^2 p}{\partial t^2} + \frac{\delta}{c_0^4}\frac{\partial^3 p}{\partial t^3} = -\frac{\beta}{\rho_0 c_0^4}\frac{\partial^2 p^2}{\partial t^2}
\]

where \(\delta\) is the sound diffusivity (capturing thermoviscous absorption) and \(\beta\) is the **coefficient of nonlinearity**:

\[
\beta = 1 + \frac{B}{2A}
\]

\(B/A\) is the parameter of nonlinearity of the medium; for water \(B/A \approx 5\), for soft tissue \(B/A \approx 6\text{–}9\), for blood \(B/A \approx 6\).

As a finite-amplitude wave propagates, energy is progressively transferred from the fundamental frequency \(f_0\) to higher harmonics \(2f_0, 3f_0, \ldots\). The second harmonic \(2f_0\) grows approximately as:

\[
p_2(x) \propto \beta \, p_0^2 \, f_0 \, x \cdot e^{-2\alpha_1 x}
\]

where \(\alpha_1\) is the attenuation at \(f_0\). The harmonic field builds from zero at the transducer, reaches a maximum at an intermediate depth, then decays due to the stronger attenuation of \(2f_0\).

**Tissue harmonic imaging (THI)** — transmitting at \(f_0\) and receiving at \(2f_0\) — dramatically improves image quality because:

- The harmonic beam is narrower (higher effective frequency) and has reduced sidelobes.
- Near-field artifacts, reverberations, and clutter generated at the fundamental frequency are suppressed (they do not build to significant harmonic levels in the short near-field path).

THI is now the default mode on nearly all clinical scanners.

## 5.3 Acoustic Cavitation

**Cavitation** refers to the nucleation, oscillation, and collapse of gas or vapor bubbles under the influence of acoustic pressure waves.

**Stable (non-inertial) cavitation**: at moderate acoustic pressures, pre-existing gas nuclei or deliberately introduced microbubbles undergo sustained nonlinear oscillation at or near their resonant frequency. The resonant frequency of a spherical bubble of radius \(R_0\) in a liquid (Minnaert frequency):

\[
f_{\text{res}} = \frac{1}{2\pi R_0}\sqrt{\frac{3\gamma p_0}{\rho_0}}
\]

where \(\gamma\) is the ratio of specific heats of the gas, \(p_0\) is the ambient pressure, and \(\rho_0\) is the liquid density. For \(R_0 = 1 \,\mu\text{m}\) in water, \(f_{\text{res}} \approx 3 \text{ MHz}\) — matching typical diagnostic frequencies, which is why microbubble contrast agents are engineered to this size range.

Stable cavitation produces radiation forces (acoustic streaming, bubble translation) and microstreaming around the bubble that enhance mass transport and permeabilize cell membranes — mechanisms exploited in drug delivery and sonoporation.

**Inertial (transient) cavitation**: at high rarefactional pressures exceeding the cavitation threshold, bubbles expand rapidly during the rarefaction phase and then collapse violently during compression. Collapse of a spherical bubble generates:

- Localized temperatures of thousands of Kelvin (sonoluminescence)
- Pressures of tens of GPa
- High-velocity liquid microjets (for bubbles near solid surfaces)
- Reactive oxygen species (ROS) via sonochemistry

The **mechanical index (MI)** quantifies the cavitation risk:

\[
\text{MI} = \frac{p_{\text{neg}}}{\sqrt{f_{\text{center}}}}
\]

where \(p_{\text{neg}}\) is the peak negative pressure in MPa and \(f_{\text{center}}\) is in MHz. Regulatory limits set MI < 1.9 for diagnostic scanners in the US.

## 5.4 Acoustic Radiation Force and Streaming

A propagating acoustic wave carries **momentum**. When the wave is attenuated (by absorption or scattering), the momentum is transferred to the medium, exerting a **radiation force** in the direction of propagation:

\[
F_{\text{rad}} = \frac{2\alpha I}{c}
\]

where \(I\) is the local intensity and \(\alpha\) is the absorption coefficient. In fluids, spatially varying radiation force drives **acoustic streaming** — a bulk DC flow in the direction of wave propagation.

**Acoustic radiation force impulse (ARFI) imaging** exploits radiation force to mechanically deform tissue locally. A focused "push pulse" displaces tissue at the focus; the displacement (typically 1–20 μm) is tracked with cross-correlation of ultrasound speckle signals before and after the push. Stiffer tissues displace less. ARFI and its derivative, **shear wave elastography (SWE)**, enable quantitative tissue stiffness mapping — valuable for liver fibrosis staging, thyroid nodule characterization, and breast lesion assessment.

In SWE, the push pulse generates shear waves that propagate laterally away from the push region at shear wave speed \(c_s\). For a nearly incompressible elastic material:

\[
G = \rho c_s^2
\]

where \(G\) is the shear modulus. Cancerous tissue is typically 5–10× stiffer than normal parenchyma, giving shear wave speeds of 5–10 m/s versus ~1–2 m/s for normal liver.

---

# Chapter 6: Therapeutic Ultrasound

## 6.1 Thermal Mechanisms of Ultrasound Bioeffects

High-intensity focused ultrasound (HIFU) exploits tissue absorption to deposit thermal energy at a focal point. The bioheat equation describes temperature evolution in perfused tissue:

\[
\rho c_p \frac{\partial T}{\partial t} = \nabla \cdot (k \nabla T) - W_b c_b (T - T_b) + Q_{\text{US}}
\]

where \(\rho c_p\) is the volumetric heat capacity, \(k\) is thermal conductivity, \(W_b\) is blood perfusion rate, \(c_b\) is blood specific heat, \(T_b\) is arterial blood temperature, and the ultrasound heat source term is:

\[
Q_{\text{US}} = 2\alpha I_{\text{SPTA}}
\]

(\(I_{\text{SPTA}}\) = spatial-peak temporal-average intensity).

**Thermal dose** quantifies the biological effect of sustained heating:

\[
\text{CEM}_{43} = \int_0^t R^{43-T(t')} dt'
\]

where \(R = 0.5\) for \(T < 43°\text{C}\) and \(R = 0.25\) for \(T \geq 43°\text{C}\). Tissue necrosis occurs reliably at CEM\(_{43} \geq 240\) minutes. HIFU can deposit this dose in seconds at the focal point while sparing overlying tissue.

**HIFU applications** include:
- Prostate cancer ablation
- Uterine fibroid treatment
- Liver and kidney tumor ablation
- Essential tremor treatment via MRI-guided transcranial HIFU (focused through the intact skull)

**MR-guided HIFU (MRgFUS)** uses real-time MRI thermometry (proton resonance frequency shift method) to monitor and control temperature during sonication, enabling precise closed-loop ablation.

## 6.2 Microbubbles in Imaging and Therapy

**Ultrasound contrast agents (UCAs)** are encapsulated microbubbles (1–10 μm diameter) with a gas core (typically perfluorocarbon) and a stabilizing shell (phospholipid, albumin, or polymer). The shell prevents rapid gas dissolution and extends circulation lifetime to minutes.

### Bubble Dynamics

The Rayleigh-Plesset equation governs spherical bubble dynamics:

\[
\rho_L \left(R\ddot{R} + \frac{3}{2}\dot{R}^2\right) = p_g(R) - p_0 - p_a(t) - \frac{4\mu_L \dot{R}}{R} - \frac{2\sigma}{R}
\]

where \(R(t)\) is bubble radius, \(p_g(R)\) is gas pressure, \(p_0\) is ambient pressure, \(p_a(t)\) is applied acoustic pressure, \(\mu_L\) is liquid viscosity, and \(\sigma\) is surface tension. Shell effects are incorporated as additional viscosity and elastic terms.

At low MI (< 0.1–0.2), bubbles oscillate nearly linearly — used in **contrast-enhanced ultrasound (CEUS)** for perfusion imaging. Nonlinear bubble response at higher MI generates second-harmonic, ultraharmonic, and broadband emissions exploited in **nonlinear contrast imaging** (pulse inversion, amplitude modulation) to suppress tissue signal while retaining the bubble signal.

### Therapeutic Applications

**Sonoporation** — the transient membrane permeabilization caused by stable cavitation and microstreaming — enhances uptake of drugs and nucleic acids into cells. Drug-loaded microbubbles accumulate at a target site (via ligand-targeted shell chemistry), and focused ultrasound triggers drug release and local sonoporation simultaneously.

**Blood-brain barrier (BBB) opening** — the tight junctions of the BBB normally prevent passage of most therapeutics into the brain. Focused ultrasound combined with circulating microbubbles (at diagnostic MI levels, ~0.3–0.5) transiently disrupts tight junctions via stable cavitation, opening the BBB locally for 4–6 hours. This technique has entered clinical trials for drug delivery in glioblastoma, Alzheimer's disease, and Parkinson's disease.

**Histotripsy** — purely mechanical ablation using microsecond-duration ultrasound pulses at very high pressure (> 10–20 MPa peak negative) to controllably generate and sustain a cavitation bubble cloud at the focus, mechanically homogenizing tissue without significant thermal deposition. Histotripsy produces sharply demarcated lesions visible in real-time on ultrasound.

---

# Chapter 7: Biosafety Considerations

## 7.1 Ultrasound-Induced Bioeffects

The biological effects of diagnostic ultrasound exposure have been studied for decades. Effects are broadly classified by mechanism:

**Thermal bioeffects** arise from tissue heating due to absorption. Diagnostic ultrasound operates at intensities and duty cycles that produce negligible heating (typically < 1°C above baseline) in soft tissue. The **thermal index (TI)** estimates the temperature rise at the focus relative to a 1°C threshold:

\[
\text{TI} = \frac{W}{W_{\text{deg}}}
\]

Three variants exist: TIS (soft tissue), TIB (bone at focus), TIC (cranial bone). Regulatory guidance recommends TI < 1.0 for most obstetric applications.

**Mechanical bioeffects** arise from cavitation and radiation force. In the absence of ultrasound contrast agents, stable cavitation is unlikely at MI < 0.4 in soft tissue; inertial cavitation is unlikely at MI < 1.0. For applications involving contrast agents, these thresholds are lower.

**Non-thermal, non-cavitation effects** include direct radiation force on tissue, acoustic streaming, and stress on cell membranes from oscillating pressure. At diagnostic exposure levels, these effects are not considered clinically significant in soft tissue.

## 7.2 Safety Standards and Output Limits

Regulatory frameworks for diagnostic ultrasound in North America and Europe are based on the **Output Display Standard (ODS)**, which requires real-time display of MI and TI on the scanner. Users are expected to apply the **ALARA principle** (As Low As Reasonably Achievable) — using the minimum output necessary to obtain the required diagnostic information.

Key regulatory limits (FDA, 510(k) track):
- MI ≤ 1.9 for all applications except ophthalmic (MI ≤ 0.23).
- ISPTA (spatial-peak temporal-average intensity) ≤ 720 mW/cm² for cardiac/peripheral vascular; ≤ 94 mW/cm² for ophthalmic.
- No limit on TI is mandated, but TI < 0.4 is recommended for first-trimester obstetric scanning.

**Hydrophone measurements** — calibrated membrane or needle hydrophones in a water tank — are used to characterize transducer acoustic output in derating-corrected intensity values (applying a 0.3 dB/cm/MHz derate factor to simulate tissue attenuation from the transducer to the point of measurement).

## 7.3 Measurement Standards

International standards governing ultrasound safety measurements include:

- **IEC 62127** series: measurement and characterization of medical ultrasonic equipment
- **IEC 61161**: radiation pressure measurement by radiation force balance
- **NEMA UD-3**: standard for real-time display of thermal and mechanical indices on diagnostic ultrasound equipment
- **IEEE 790**: guide for medical ultrasound field parameter definitions

Measurement quantities include:
- \(I_{\text{SPTA}}\) (spatial-peak temporal-average intensity)
- \(I_{\text{SPPA}}\) (spatial-peak pulse-average intensity)
- \(W\) (acoustic power, measured by radiation force balance)
- Pressure waveform and derived quantities (peak positive, peak negative pressure, center frequency, pulse duration) measured by calibrated hydrophone

The relationship between hydrophone-measured pressure \(p(t)\) and intensity is:

\[
I = \frac{p^2}{Z}
\]

for plane waves, where the instantaneous intensity is averaged over appropriate time intervals to obtain \(I_{\text{SPTA}}\) or \(I_{\text{SPPA}}\).

## 7.4 Special Populations and Elevated-Risk Scenarios

Certain clinical contexts warrant elevated attention to safety:

**Fetal exposures** — the developing fetus lacks thermal regulatory capacity; bone ossification during the second and third trimesters creates acoustic absorption and TIB elevation. Guidelines recommend time-domain exposure limits (limiting scanning duration) when TIB or TIS exceeds thresholds.

**Ophthalmic applications** — the eye has high water content, no thermoregulatory blood flow in the lens and vitreous, and is sensitive to temperature. Stricter MI and intensity limits apply. Transcranial applications (TCD — transcranial Doppler) are limited by skull heating; the cranial bone acts as both absorber and reflector.

**Contrast-enhanced imaging** — presence of microbubbles dramatically lowers the cavitation threshold. Bioeffects including petechial hemorrhage, cardiac arrhythmia (at high MI with intracardiac bubbles), and cell permeabilization have been observed in animal studies. Clinical protocols mandate monitoring and restrict high-MI scanning during contrast bolus passage in sensitive organs.
