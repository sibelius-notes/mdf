---
title: "CHEM 221: Multi-Component Analysis"
prof: "Tadeusz Górecki"
subjects: "CHEM"
---

## Sources and References

**Primary textbook** — Daniel C. Harris, Charles A. Lucy, *Quantitative Chemical Analysis*, 10th ed. (W. H. Freeman, 2020)
**Supplementary texts** — Douglas A. Skoog, F. James Holler, Stanley R. Crouch, *Principles of Instrumental Analysis*, 7th ed. (Cengage Learning, 2018); Douglas A. Skoog, Donald M. West, F. James Holler, Stanley R. Crouch, *Fundamentals of Analytical Chemistry*, 10th ed. (Cengage Learning, 2014)
**Online resources** — MIT OCW 5.33 Advanced Chemical Experimentation (ocw.mit.edu); LibreTexts Analytical Chemistry (chem.libretexts.org); NIST Chemistry WebBook (webbook.nist.gov); Journal of Analytical Atomic Spectrometry (RSC Publishing)

---

# Chapter 1: Electrochemical Fundamentals

## 1.1 Why Electrochemistry?

Consider the humble pH meter sitting on every analytical chemistry bench. A glass probe is dipped into an unknown solution, a number appears on a digital display within seconds, and the analyst records it without a second thought. Yet packed inside that glass probe is a remarkable piece of physics: a thin membrane of specially formulated glass, hydrated on both surfaces, develops a potential difference that encodes the hydrogen-ion activity of the solution with millivolt-level precision. The measurement requires no reagents, no calibration curve in the traditional sense, and no destruction of the sample. It works because the laws of thermodynamics connect chemical potential to electrical potential in a precise and exploitable way.

Electrochemistry as a formal discipline traces back to Alessandro Volta's invention of the voltaic pile in 1800, which provided the first steady source of electrical current and immediately opened experiments that were impossible with electrostatic machines. Within a decade, Humphry Davy used electrolysis to isolate sodium and potassium for the first time. Michael Faraday, Davy's student, quantified the relationship between charge passed and mass deposited or dissolved, formulating the laws that bear his name. The thermodynamic foundation came later, with Josiah Willard Gibbs connecting free energy to electrochemical potential in the 1870s, and Walther Nernst extending the equilibrium treatment to non-standard conditions in 1889. The Nernst equation, derived rigorously below, is the master equation underlying nearly every electroanalytical technique.

The unifying concept in electrochemistry is that chemical reactions involving electron transfer can be harnessed to produce measurable electrical signals, and conversely that imposed electrical signals can drive chemical reactions that would not otherwise occur spontaneously. The analytical chemist exploits both directions: in potentiometry, the equilibrium potential of a cell is measured to determine analyte activity; in voltammetry, an imposed potential drives reduction or oxidation and the resulting current is measured; in coulometry, a controlled current is used to generate a reagent or to drive a reaction to completion while the charge passed is counted.

## 1.2 Galvanic and Electrolytic Cells

An **electrochemical cell** consists of two electrodes in contact with an electrolyte solution (or two solutions connected by a salt bridge), with electron transfer occurring at each electrode surface. The two classes of cells differ in the direction of energy flow.

In a **galvanic cell** (also called a voltaic cell), a spontaneous chemical reaction drives electron flow through an external circuit, doing electrical work on the surroundings. The Daniell cell — zinc in zinc sulfate solution connected through a salt bridge to copper in copper sulfate solution — is the textbook example. The spontaneous reaction Zn(s) + Cu²⁺(aq) → Zn²⁺(aq) + Cu(s) has a positive standard free energy change ΔG° < 0 (negative in sign convention), and the resulting cell potential E° = +1.10 V drives electrons from the zinc anode through the external circuit to the copper cathode.

In an **electrolytic cell**, an external power supply forces a non-spontaneous reaction to occur. Electroplating, electrorefining, and the industrial production of chlorine and sodium hydroxide by the chlor-alkali process are all electrolytic. In analytical applications, electrogravimetry and coulometric titrations use electrolytic cells where the analyst imposes a potential or current to drive a quantitative reaction.

The **electrode** at which oxidation occurs is called the **anode**; the electrode at which reduction occurs is the **cathode**. This convention holds regardless of whether the cell is galvanic or electrolytic. In galvanic cells the anode is negative (electrons flow away from it into the external circuit); in electrolytic cells the anode is positive (the external supply forces electrons out of it). The apparent contradiction dissolves when one remembers that the sign convention for anode and cathode is defined by the chemistry (oxidation vs. reduction), not by the polarity of the applied potential.

## 1.3 Electrode Potential and the Standard Hydrogen Electrode

The potential of an individual electrode cannot be measured in isolation — only differences between two electrodes are physically meaningful. By international convention (IUPAC), all electrode potentials are measured against the **standard hydrogen electrode** (SHE), which is assigned a potential of exactly 0.000 V at all temperatures. The SHE consists of a platinum electrode saturated with hydrogen gas at unit fugacity (≈ 1 bar) in contact with an acidic solution where the hydrogen-ion activity is unity (≈ 1 mol/L at standard state). The half-reaction is

\[
2\,\text{H}^+(\text{aq}) + 2e^- \rightleftharpoons \text{H}_2(\text{g}), \qquad E^\circ = 0.000\,\text{V}
\]

The **standard reduction potential** \( E^\circ \) of any half-reaction is the potential measured against the SHE when all species are at unit activity. A positive \( E^\circ \) means the couple is a better oxidant than H⁺; a negative \( E^\circ \) means the couple is a better reductant than H₂. For example, the Cu²⁺/Cu couple has \( E^\circ = +0.337\,\text{V} \), meaning copper is spontaneously deposited when connected to the SHE, while the Zn²⁺/Zn couple has \( E^\circ = -0.763\,\text{V} \), meaning zinc spontaneously dissolves (is oxidized) when connected to the SHE.

The cell potential for a galvanic or electrolytic cell is

\[
E_\text{cell} = E_\text{cathode} - E_\text{anode}
\]

where both electrode potentials are written as reduction potentials. If \( E_\text{cell} > 0 \), the reaction as written is spontaneous; if \( E_\text{cell} < 0 \), external work must be supplied to drive it.

## 1.4 The Nernst Equation

Standard potentials apply only when all species are at unit activity. The **Nernst equation** extends the treatment to arbitrary activities.

The starting point is the relationship between the Gibbs free energy change and the cell potential:

\[
\Delta G = -nFE
\]

where \( n \) is the number of electrons transferred per formula unit, \( F = 96{,}485\,\text{C mol}^{-1} \) is the Faraday constant, and \( E \) is the cell potential under the conditions of interest. Under standard conditions \( \Delta G^\circ = -nFE^\circ \). The van't Hoff isotherm connects these:

\[
\Delta G = \Delta G^\circ + RT\ln Q
\]

Substituting:

\[
-nFE = -nFE^\circ + RT\ln Q
\]

Dividing through by \( -nF \):

\[
E = E^\circ - \frac{RT}{nF}\ln Q
\]

At \( T = 298.15\,\text{K} \), substituting \( R = 8.314\,\text{J mol}^{-1}\text{K}^{-1} \) and converting the natural logarithm:

\[
E = E^\circ - \frac{0.05916}{n}\log Q
\]

This is the **Nernst equation**. The factor 0.05916 V (often written as 59.16 mV) at 25 °C is called the **Nernstian slope** and represents the change in potential per decade change in activity ratio. For a one-electron couple, a tenfold change in the activity ratio of oxidised to reduced form shifts the potential by 59.16 mV.

<div class="example">
<strong>Example 1.1 — Nernst Equation for the Fe³⁺/Fe²⁺ Couple.</strong> Calculate the potential of a platinum electrode immersed in a solution where \( a_{\text{Fe}^{3+}} = 0.010 \) and \( a_{\text{Fe}^{2+}} = 0.100 \), given \( E^\circ(\text{Fe}^{3+}/\text{Fe}^{2+}) = +0.771\,\text{V} \).

The half-reaction is Fe³⁺ + e⁻ → Fe²⁺, so <em>n</em> = 1 and <em>Q</em> = [Fe²⁺]/[Fe³⁺].

\[
E = 0.771 - \frac{0.05916}{1}\log\frac{0.100}{0.010} = 0.771 - 0.05916 \times 1 = 0.712\,\text{V}
\]

The potential is 59.16 mV lower than \( E^\circ \) because the ratio [reduced]/[oxidised] is 10:1, favouring the reduced form.
</div>

## 1.5 Liquid Junction Potential

When two electrolyte solutions of different composition are in contact (e.g., through a salt bridge or a porous frit), ions diffuse across the boundary at different rates. Faster-diffusing cations or anions create a charge separation at the interface, which produces a potential difference called the **liquid junction potential** \( E_j \). For a simple junction between two HCl solutions of different concentrations, H⁺ (mobility 36.2 × 10⁻⁸ m² V⁻¹ s⁻¹) diffuses much faster than Cl⁻ (mobility 7.9 × 10⁻⁸ m² V⁻¹ s⁻¹), so the dilute side acquires a positive charge and \( E_j \) can be several millivolts.

Junction potentials are undesirable in analytical measurements because they add an unknown, variable term to the measured cell voltage. They are minimised by using a **salt bridge** containing a concentrated solution of an electrolyte whose cation and anion have nearly equal mobilities — KCl (K⁺ and Cl⁻ have mobilities 7.62 and 7.91 × 10⁻⁸ m² V⁻¹ s⁻¹, respectively) and KNO₃ are the most common choices. The concentrated bridge dominates the junction and, because its ions diffuse at similar rates, produces only a small and approximately constant \( E_j \) of a few millivolts.

## 1.6 Reference Electrodes

The SHE is inconvenient for routine use — it requires hydrogen gas, a carefully prepared platinum surface, and a perfectly activity-controlled acid solution. Two practical reference electrodes are universally used in the laboratory.

The **saturated calomel electrode** (SCE) is a half-cell consisting of mercury in contact with mercurous chloride (calomel, Hg₂Cl₂) and a saturated KCl solution. Its potential is determined by the half-reaction

\[
\text{Hg}_2\text{Cl}_2(s) + 2e^- \rightleftharpoons 2\,\text{Hg}(l) + 2\,\text{Cl}^-(\text{aq}), \qquad E = +0.241\,\text{V vs. SHE at 25°C}
\]

The potential is fixed by the chloride activity in the saturated KCl solution. The SCE is robust and inexpensive, but it contains mercury (an environmental concern) and its potential shifts noticeably with temperature (0.67 mV/°C).

The **silver-silver chloride electrode** (Ag/AgCl) is now more widely used and consists of a silver wire coated with AgCl immersed in a KCl solution. Its half-reaction is

\[
\text{AgCl}(s) + e^- \rightleftharpoons \text{Ag}(s) + \text{Cl}^-(\text{aq}), \qquad E = +0.197\,\text{V vs. SHE in 3.5\,M KCl at 25°C}
\]

The Ag/AgCl electrode has lower temperature dependence, is non-toxic, and can be miniaturised easily.

## 1.7 Overpotential and Butler-Volmer Kinetics

In an ideal thermodynamic treatment, an electrode reaction would begin as soon as the applied potential equals the equilibrium value. In practice, additional driving force is required to overcome the activation energy barrier for electron transfer. The **overpotential** \( \eta \) is defined as the difference between the applied electrode potential and the equilibrium (Nernst) potential:

\[
\eta = E_\text{applied} - E_\text{eq}
\]

The **Butler-Volmer equation** describes how the current density \( j \) depends on overpotential:

\[
j = j_0 \left[\exp\!\left(\frac{\alpha n F \eta}{RT}\right) - \exp\!\left(-\frac{(1-\alpha)nF\eta}{RT}\right)\right]
\]

where \( j_0 \) is the **exchange current density** (the equal and opposite anodic and cathodic currents flowing at equilibrium) and \( \alpha \) is the **transfer coefficient** (typically ≈ 0.5 for outer-sphere electron-transfer reactions). At large positive overpotentials the second exponential term becomes negligible and the current grows exponentially (Tafel anodic branch); at large negative overpotentials the first term is negligible (Tafel cathodic branch). At small overpotentials both terms contribute and the current is approximately linear in \( \eta \), with slope \( nFj_0/RT \).

A second source of overpotential arises from mass transport. When the electrode reaction is fast but diffusion of reactant from bulk solution to the electrode surface is rate-limiting, the local concentration at the electrode surface falls below the bulk value, and an additional **concentration overpotential** develops. The three-electrode cell (working electrode + reference electrode + auxiliary/counter electrode), controlled by a potentiostat, decouples the measurement of potential from the passage of current: the reference electrode senses the potential at the working electrode with negligible current flow through the high-impedance reference circuit, while the current flows between working and auxiliary electrodes.

---

# Chapter 2: Potentiometry

## 2.1 Clinical Measurement of Blood Electrolytes

In a hospital clinical laboratory, a blood-gas analyser measures Na⁺, K⁺, Cl⁻, Ca²⁺, pH, pCO₂, and pO₂ on a 100-µL sample of whole blood in under 60 seconds. The sodium, potassium, calcium, and chloride measurements are made simultaneously by a bank of ion-selective electrodes. These electrodes are the direct descendants of the glass pH electrode — devices in which a thin membrane develops a potential that depends, through the Nernst equation, on the activity of a specific ion. The clinical analyser is a marvel of miniaturisation, but its operating principle is exactly the same as the bench-top pH meter described in Chapter 1.

## 2.2 The Glass Electrode

The **glass electrode** for pH measurement consists of a thin membrane (~0.1 mm) of a special glass (typically 72% SiO₂, 22% Na₂O, 6% CaO by mass) blown into a bulb shape. The inner surface is in contact with an internal reference solution of fixed pH (usually 0.1 M HCl), and the outer surface is exposed to the test solution. Both surfaces of the glass are hydrated in use, forming a **hydrated gel layer** approximately 100 nm thick that is rich in silicate groups from which H⁺ ions have exchanged with Na⁺ in the glass network.

The membrane potential arises from the difference in hydrogen-ion activity between the two hydrated gel surfaces. H⁺ from the test solution adsorbs onto the outer gel surface, while H⁺ from the internal reference solution establishes the inner surface potential. Because the glass membrane is essentially impermeable to the passage of ions (conductance is carried by Na⁺ migrating through the dry glass interior), the potential difference is a **Donnan equilibrium potential** at each surface rather than a diffusion potential. The sum of the two surface potentials produces a membrane potential:

\[
E_\text{membrane} = \text{const} + \frac{0.05916}{1}\log a_{\text{H}^+}^\text{outer} = \text{const} - 0.05916 \times \text{pH}
\]

The complete cell used for pH measurement is

\[
\text{Ag|AgCl} \mid \text{HCl(inner)} \mid \text{glass membrane} \mid \text{test solution} \mid \text{reference electrode (SCE or Ag/AgCl)}
\]

and the measured cell potential is

\[
E_\text{cell} = \text{const} - 0.05916\,\text{pH} + E_j
\]

where the constant lumps together the internal reference potential, the asymmetry potential, and fixed junction contributions. Because the constant is not known a priori, the pH meter is **calibrated** using two or more buffer solutions of certified pH. Two-point calibration establishes both the slope (ideally −59.16 mV/pH unit at 25 °C) and the offset.

The **asymmetry potential** is a small, slowly varying potential difference that exists even when identical solutions bathe both sides of the membrane. It arises from mechanical strain in the glass and small differences in the chemistry of the two hydrated gel layers. It is corrected by calibration.

The glass electrode has two known failure modes. The **alkaline error** (or sodium error) occurs at pH > 10: the membrane becomes responsive to Na⁺ as well as H⁺, causing the measured pH to be lower than the true value. Special lithium-bearing glasses extend the useful range to pH 14 with reduced alkali error. The **acid error** occurs at pH < 0.5, where the glass absorbs H₂SO₄ molecules, reducing the effective activity of H⁺.

## 2.3 Ion-Selective Electrodes

The glass electrode is a special case of a broader class of devices called **ion-selective electrodes** (ISEs). An ISE contains a membrane — crystalline, liquid, or glassy — that is selectively permeable to one ion. The membrane potential that develops is given by a Nernst-like expression, and the cell potential encodes the activity of the target ion.

**Crystalline membrane ISEs** use a sparingly soluble ionic compound pressed into a pellet. The fluoride electrode uses a single crystal of lanthanum fluoride (LaF₃) doped with europium(II) to increase conductivity. F⁻ ions migrate through vacancies in the crystal lattice, and the membrane potential is Nernstian for F⁻ activities from 10⁻⁶ to 1 M. The fluoride electrode is remarkably selective: only OH⁻ interferes significantly. The electrode is used routinely to measure fluoride in drinking water (WHO limit: 1.5 mg/L) and in industrial effluents. Silver halide and Ag₂S-based ISEs similarly detect Cl⁻, Br⁻, I⁻, SCN⁻, CN⁻, and S²⁻.

**Liquid membrane ISEs** trap an ion-selective ionophore (a lipophilic molecule that selectively binds the target ion) in a hydrophobic polymeric membrane (typically plasticised PVC). The potassium ISE uses **valinomycin**, a cyclic depsipeptide antibiotic from *Streptomyces fulvissimus* that forms a hydrophobic cavity perfectly sized for K⁺. The selectivity of valinomycin for K⁺ over Na⁺ is approximately 10,000:1 — one of the highest natural selectivities known. The calcium ISE uses a diester of phosphoric acid (ETH 1001 or similar), and the nitrate ISE uses quaternary ammonium salts as the ionophore.

## 2.4 The Nikolsky-Eisenman Equation

Real ISEs respond not only to the primary ion \( i \) but also, to a lesser extent, to other ions \( j \) present in solution. The **Nikolsky-Eisenman equation** quantifies this cross-sensitivity:

\[
E = \text{const} + \frac{RT}{z_i F}\ln\!\left(a_i + \sum_j K_{ij}\,a_j^{z_i/z_j}\right)
\]

where \( K_{ij} \) is the **potentiometric selectivity coefficient** for interfering ion \( j \) relative to primary ion \( i \). A small \( K_{ij} \) means low interference from \( j \). For the valinomycin K⁺ electrode, \( K_{K,Na} \approx 2 \times 10^{-4} \), meaning that Na⁺ must be present at 5000 times the concentration of K⁺ before it causes a 1 mV error. In blood serum, where \( [\text{Na}^+] \approx 140\,\text{mM} \) and \( [\text{K}^+] \approx 4\,\text{mM} \), the sodium interference is \( K_{K,Na} \times 140/4 \approx 0.007 \), which is acceptably small.

Selectivity coefficients are determined experimentally by either the **separate solution method** (compare potentials in pure solutions of primary and interfering ions at equal activity) or the **mixed solution method** (fixed interference method or matched potential method). The choice of method matters: separate-solution values assume Nernstian response over the entire activity range, which is not always valid.

<div class="example">
<strong>Example 2.1 — Error from Interfering Ion.</strong> A nitrate ISE has \( K_{\text{NO}_3,\text{Cl}} = 0.002 \). Estimate the error in measuring 1.0 × 10⁻³ M nitrate in a solution also containing 0.10 M chloride. Both ions are monovalent.

From the Nikolsky-Eisenman equation the apparent nitrate activity is:

\[
a_{\text{NO}_3}^\text{app} = a_{\text{NO}_3} + K_{\text{NO}_3,\text{Cl}}\,a_{\text{Cl}} = 1.0\times10^{-3} + 0.002 \times 0.10 = 1.0\times10^{-3} + 2.0\times10^{-4} = 1.2\times10^{-3}
\]

The relative error is (1.2 − 1.0)/1.0 × 100% = <strong>+20%</strong>. In this situation the chloride interference is not negligible.
</div>

## 2.5 Potentiometric Titrations and Gran Linearisation

Potentiometric titrations use an ISE or indicator electrode to detect the equivalence point of a titration without the need for a visual indicator. The cell potential is measured as a function of titrant volume, and the equivalence point is located by differentiation.

The **first derivative** plot \( \Delta E / \Delta V \) vs. \( V \) shows a sharp maximum at the equivalence point. The **second derivative** plot \( \Delta^2 E / \Delta V^2 \) vs. \( V \) crosses zero at the equivalence point, enabling a more precise location. Both methods require dense data points near the equivalence point.

A more elegant approach is the **Gran plot**, introduced by Gunnar Gran in 1952. For a titration of analyte \( A^{z+} \) with titrant \( T^{z-} \), before the equivalence point the activity of \( A^{z+} \) is proportional to the amount unreacted. If the cell potential is \( E = \text{const} + (0.05916/z)\log a_A \), then

\[
F = (V_0 + V)\,10^{zE/0.05916} \propto (V_{eq} - V)
\]

Plotting \( F \) (the Gran function) against volume \( V \) gives a **straight line that extrapolates to zero at the equivalence volume** \( V_{eq} \). This linearisation is powerful because the equivalence point is found by linear extrapolation of data well before the equivalence point — where the electrode response is most reliable and Nernstian. The Gran plot is particularly useful for precipitation titrations (e.g., Ag⁺ vs. Cl⁻ with an Ag ISE) and acid-base titrations measured with a glass electrode.

---

# Chapter 3: Voltammetric Methods

## 3.1 Electron Transfer at an Electrode Surface

Cyclic voltammetry (CV) is often the first experiment performed when characterising a new redox-active compound. A synthesised organometallic complex, an electroactive drug molecule, a metal oxide nanoparticle — each has characteristic CV features that reveal whether oxidation or reduction is chemically reversible, how many electrons are transferred, and whether coupled chemical reactions (CE, EC, ECE mechanisms) are coupled to the electron transfer. The technique is to electrochemistry what NMR is to organic chemistry: a rapid first characterisation that guides further work.

In voltammetry, the potential of the working electrode is controlled by a potentiostat and varied in a programmed way. As the potential is scanned through the formal potential \( E^{\circ'} \) of an electroactive couple, the equilibrium condition at the electrode surface shifts from favouring the oxidised form (at potentials much more positive than \( E^{\circ'} \)) to favouring the reduced form (at potentials much more negative). This drives a current — first controlled by electron-transfer kinetics, then, once the surface concentrations are depleted, controlled by diffusion from the bulk solution.

## 3.2 The Diffusion Layer and Limiting Current

Consider a solution containing an oxidised species O at bulk concentration \( c^* \) near an electrode. When a sufficiently negative potential is applied, O is reduced to R as fast as it arrives. The concentration of O at the electrode surface \( c_s \) falls to zero, and the current is limited entirely by how fast O can diffuse from the bulk to the surface. The **diffusion layer** of thickness \( \delta \) develops, within which the concentration varies from \( c^* \) in the bulk to 0 at the surface. The **limiting current** is

\[
i_L = \frac{nFADc^*}{\delta}
\]

where \( A \) is the electrode area and \( D \) is the diffusion coefficient of O (~10⁻⁵ cm² s⁻¹ in aqueous solution). For an unstirred solution, the diffusion layer grows with time as \( \delta \sim \sqrt{\pi D t} \), and the current decays with time (the Cottrell equation, \( i = nFAc^*\sqrt{D/\pi t} \)). In practice, stirring or convection is used to maintain a steady diffusion layer thickness.

## 3.3 Linear Sweep and Cyclic Voltammetry

In **linear sweep voltammetry** (LSV), the potential is scanned from an initial value \( E_i \) to a final value \( E_f \) at a constant scan rate \( \nu \) (V s⁻¹). As the potential approaches \( E^{\circ'} \) from positive values (for a reduction), the current rises as O begins to be reduced. It reaches a maximum — the **peak current** — when the diffusion layer has grown sufficiently that the surface concentration of O is nearly zero, then declines as \( 1/\sqrt{t} \) (since the diffusion layer continues to grow and the concentration gradient decreases).

**Cyclic voltammetry** (CV) adds a reverse sweep: after the forward scan reaches \( E_\lambda \) (the switching potential), the potential is reversed and scanned back to \( E_i \). If the reduced product R is stable, it accumulates near the electrode during the forward scan and is re-oxidised during the reverse scan, producing an anodic peak. The complete CV for a reversible couple at a planar electrode shows two peaks: a cathodic peak at \( E_{pc} \) and an anodic peak at \( E_{pa} \).

For a **reversible** (Nernstian) couple, the Randles-Ševčík equation gives the peak current:

\[
i_p = 0.4463\,nFAc^*\!\left(\frac{nFD\nu}{RT}\right)^{1/2}
\]

At 25 °C this simplifies to \( i_p = (2.686 \times 10^5)\,n^{3/2}AD^{1/2}c^*\nu^{1/2} \) (in SI units). The key diagnostics for a reversible couple are:

- \( i_p \propto \nu^{1/2} \) (diffusion-controlled)
- \( E_{pc} - E_{pa} = 59/n \) mV (independent of scan rate)
- \( i_{pa}/i_{pc} = 1 \)
- \( E_{1/2} = (E_{pc} + E_{pa})/2 \approx E^{\circ'} \)

The 59/n mV peak separation arises from the thermodynamics of the diffusion-limited problem: the Nernst equation requires a 59/n mV shift in potential to change the surface concentration ratio by a factor of 10, and the diffusion profiles at the forward and reverse peaks are mirror images separated by this amount.

<div class="example">
<strong>Example 3.1 — Identifying a Reversible Couple.</strong> A CV of 1.0 mM ferrocene in acetonitrile/0.1 M TBAPF₆ at 100 mV s⁻¹ on a 3-mm diameter glassy carbon electrode shows \( E_{pc} = +0.380\,\text{V} \) and \( E_{pa} = +0.440\,\text{V} \) vs. Ag/AgNO₃, with \( i_{pa}/i_{pc} = 1.02 \). Is the couple reversible?

Peak separation = 440 − 380 = 60 mV ≈ 59/1 mV for a one-electron couple. The current ratio is ~1. Both criteria confirm a reversible one-electron oxidation. \( E^{\circ'} = (380+440)/2 = 410\,\text{mV} \) vs. Ag/AgNO₃.
</div>

For a **quasi-reversible** couple, the electron-transfer rate constant \( k^0 \) is comparable to the mass-transfer rate. Peak separation exceeds 59/n mV and increases with scan rate. For a fully **irreversible** couple, no reverse peak is seen, and the peak potential shifts with scan rate by −30/αn mV per decade increase in ν.

## 3.4 Differential Pulse and Square-Wave Voltammetry

Linear sweep voltammetry suffers from a large background (non-Faradaic, capacitive) current caused by the constant change of electrode potential charging the double layer. The charging current scales as \( i_c = C_{dl} \nu A \), and since both Faradaic and charging currents increase with scan rate, simple LSV is not easily improved by scanning faster. **Differential pulse voltammetry** (DPV) and **square-wave voltammetry** (SWV) were developed to discriminate the Faradaic signal from the capacitive background.

In DPV, the potential is incremented in a staircase and a small-amplitude pulse (typically 25–50 mV, duration ~50 ms) is superimposed on each step. The current is sampled twice: just before the pulse (\( i_1 \)) and at the end of the pulse (\( i_2 \)). The reported signal is the difference \( \Delta i = i_2 - i_1 \). Because the charging current decays exponentially with the RC time constant of the cell while the Faradaic current decays more slowly, measuring at the end of the pulse preferentially samples Faradaic current. The DPV response is a symmetric peak centred at \( E^{\circ'} - \Delta E/2 \) (where \( \Delta E \) is the pulse amplitude), with peak width at half-height of \( 3.52RT/nF \approx 90/n \) mV at 25 °C. DPV detection limits are typically 10- to 100-fold lower than DC voltammetry.

SWV applies a symmetric square-wave potential modulation superimposed on a staircase. Forward and reverse currents are sampled on alternate half-cycles and the net current (difference) is plotted. The SWV response is peaked like DPV but the experiment is much faster (complete scan in seconds), making it the preferred technique for routine analysis.

## 3.5 Stripping Voltammetry

**Stripping voltammetry** achieves detection limits in the picomolar to nanomolar range for trace metals by combining an **electrolytic preconcentration step** with a sensitive voltammetric measurement. In **anodic stripping voltammetry** (ASV), the most widely used variant, trace metals (Pb²⁺, Cd²⁺, Cu²⁺, Zn²⁺, etc.) are preconcentrated by reduction onto a hanging mercury drop electrode (HMDE) or a bismuth film electrode at a sufficiently negative potential for 1–10 minutes. The concentrated amalgam or thin film is then stripped anodically by scanning the potential positive; each metal oxidises at a characteristic potential, giving a series of peaks whose heights are proportional to the original concentrations.

The preconcentration factor can be enormous. If the deposition volume of mercury is \( V_{Hg} \approx 10\,\text{nL} \) and the sample volume is \( V_s = 10\,\text{mL} \), the concentration factor is \( V_s/V_{Hg} \approx 10^6 \). In practice, not all the metal is deposited (limited by electrode geometry and stirring efficiency), but effective concentration factors of 10³–10⁵ are routinely achieved, giving detection limits well below 1 µg/L. ASV has been used extensively for environmental monitoring of heavy metals in seawater, river water, and sediment extracts. **Cathodic stripping voltammetry** (CSV) is the analogous technique for anions: halides, sulfide, and arsenate are oxidised to insoluble mercury(I) or mercury(II) compounds on the mercury surface during a preconcentration step, then reduced cathodically.

---

# Chapter 4: Coulometry, Electrogravimetry, and Amperometry

## 4.1 The Definitive Method for Water

The determination of water content is required across an extraordinary range of industries: in pharmaceuticals, water above a few hundred ppm in a hygroscopic drug can cause hydrolysis and loss of potency; in petrochemicals, dissolved water causes pipeline corrosion; in foodstuffs, water activity governs microbial growth and shelf life; in electrical transformer oils, even 50 ppm of water can trigger dielectric breakdown. The definitive method for water determination at levels from 10 ppm to 100% is the **Karl Fischer titration**, invented by the German chemist Karl Fischer in 1935. It is a coulometric method in its modern implementation: water reacts quantitatively with iodine in the presence of sulfur dioxide and a base (methanol + imidazole in modern reagents), and the iodine is generated in situ electrochemically at 100% current efficiency. The analyst simply adds a weighed sample and reads off the microcoulombs of charge consumed — which by Faraday's law gives the moles of water with absolute certainty.

## 4.2 Faraday's Laws

**Faraday's first law** states that the mass of substance produced or consumed at an electrode is proportional to the charge passed. **Faraday's second law** states that the same charge produces equivalent amounts (in moles × valence) of different substances. Both are unified in the relationship:

\[
m = \frac{Q M}{n F}
\]

where \( m \) is the mass (g), \( Q \) is the charge passed (C), \( M \) is the molar mass (g mol⁻¹), \( n \) is the number of electrons per formula unit, and \( F = 96{,}485\,\text{C mol}^{-1} \). This equation has no calibration constant — it depends only on fundamental physical quantities and is therefore an absolute (primary) method of analysis.

<div class="example">
<strong>Example 4.1 — Electrolytic Copper Determination.</strong> A copper solution is electrolysed at controlled potential. The current-time curve is integrated to give Q = 96.5 C. How many milligrams of copper were deposited? (M(Cu) = 63.55 g mol⁻¹, n = 2.)

\[
m = \frac{96.5 \times 63.55}{2 \times 96485} = \frac{6133}{192970} = 0.03179\,\text{g} = 31.8\,\text{mg}
\]
</div>

## 4.3 Controlled-Potential Coulometry

In **controlled-potential coulometry** (also called potentiostatic coulometry), the working electrode is held at a fixed potential chosen to reduce (or oxidise) the analyte quantitatively while minimising interference from other species. As the analyte is consumed, its concentration in solution decreases, and the current falls exponentially:

\[
i(t) = i_0\,e^{-t/\tau}, \qquad \tau = \frac{V}{A k_m}
\]

where \( V \) is the solution volume, \( A \) is the electrode area, and \( k_m \) is the mass-transfer coefficient. The total charge passed is obtained by integrating the current:

\[
Q = \int_0^\infty i\,dt = i_0 \tau
\]

In practice, electrolysis is considered complete when the current has fallen to less than 0.1% of its initial value (about 7 time constants). The charge is measured with an **electronic integrator** or coulometer. Controlled-potential coulometry is particularly useful for the determination of uranium, plutonium, and other actinides in nuclear materials, where its absolute accuracy (no calibration standards needed) is invaluable.

## 4.4 Coulometric Titrations and Karl Fischer Analysis

In **coulometric titrations**, the titrant is generated electrochemically within the cell rather than added from a burette. Because current and time can be measured with high precision, and Faraday's law relates them directly to moles of titrant, coulometric titrations are among the most precise of all titrimetric methods and require no standard solutions.

The Karl Fischer reaction proceeds in two stages. In the original Fischer reagent (pyridine/methanol/SO₂/I₂), the net reaction is:

\[
\text{H}_2\text{O} + \text{I}_2 + \text{SO}_2 + 3\,\text{C}_5\text{H}_5\text{N} \rightarrow 2\,[\text{C}_5\text{H}_5\text{N}{\cdot}\text{HI}] + [\text{C}_5\text{H}_5\text{N}{\cdot}\text{SO}_3]
\]

In modern two-component reagents (Hydranal or Aquastar type), imidazole replaces pyridine and methanol is replaced by other alcohols to improve working range. The stoichiometry is 1 mol I₂ per mole H₂O. In coulometric Karl Fischer, iodine is generated anodically (2I⁻ → I₂ + 2e⁻) at exactly the rate needed to consume water as it is released from the sample. The endpoint is detected biamperometrically: two platinum electrodes are polarised with a small constant current, and the voltage across them drops to near-zero when free iodine first appears in solution (the **dead-stop endpoint**). The total water content is then Q/(2F) moles.

## 4.5 The Clark Oxygen Electrode

The **Clark electrode** (1956), developed by Leland Clark Jr., was the first practical amperometric sensor for dissolved oxygen and is the basis of most modern oxygen electrodes and many biosensors. A platinum cathode and Ag/AgCl reference anode are separated from the sample by an oxygen-permeable Teflon or polyethylene membrane. Oxygen diffuses through the membrane and is reduced at the platinum surface:

\[
\text{O}_2 + 2\,\text{H}_2\text{O} + 4e^- \rightarrow 4\,\text{OH}^-
\]

at a potential of about −0.65 V vs. Ag/AgCl. The current is proportional to the partial pressure of oxygen in the sample. The membrane serves two purposes: it excludes interfering species (proteins, other reducible ions) and establishes a well-defined, thin diffusion layer that controls the response time and sensitivity.

## 4.6 Rotating Disk Electrode and Levich Equation

The **rotating disk electrode** (RDE) overcomes the problem of diffusion layer growth in unstirred solutions by spinning the electrode, which creates a well-defined convective flow that sweeps solution towards the centre of the disk and out radially. At steady state, the diffusion layer thickness is

\[
\delta = 1.61\,D^{1/3}\,\omega^{-1/2}\,\nu^{1/6}
\]

where \( \omega \) is the angular velocity (rad s⁻¹) and \( \nu \) is the kinematic viscosity of the solution. Substituting into the limiting current expression gives the **Levich equation**:

\[
i_L = 0.620\,nFAD^{2/3}\omega^{1/2}\nu^{-1/6}c^*
\]

A plot of \( i_L \) vs. \( \omega^{1/2} \) is linear through the origin for a purely diffusion-controlled process (Levich plot). Deviations from linearity indicate kinetic complications. The RDE is extensively used in electrocatalysis research (oxygen reduction reaction on Pt, Pd, and carbon surfaces for fuel cells) and for measuring diffusion coefficients.

---

# Chapter 5: Molecular Spectroscopy — Absorption

## 5.1 Beyond the Colorimeter: FTIR and Raman

A student in a first-year organic laboratory uses a KBr pellet in an IR spectrometer to confirm that a synthesised product contains the carbonyl group predicted by the structure. The instrument scans a grating over a range of wavenumbers, measuring transmitted intensity at each point. The experiment works, but it is slow and requires large samples. In a modern pharmaceutical quality control laboratory, the same identification is accomplished in two seconds on a powder pressed against an ATR crystal, using a Fourier-transform infrared spectrometer that simultaneously measures all wavelengths. In a counterfeit drug investigation, a portable Raman spectrometer identifies the active ingredient through the sealed container without opening it.

These advances share a common thread: the shift from wavelength-scanning instruments (where one wavelength is measured at a time) to techniques that encode spectral information differently — either through interferometry (FTIR) or through inelastic scattering (Raman).

## 5.2 Revisiting Beer-Lambert: Deviations and Multicomponent Analysis

The Beer-Lambert law \( A = \varepsilon bc \) holds strictly only for monochromatic radiation, dilute solutions of non-associating analytes, and absence of stray light. Real measurements deviate from this ideal in predictable ways.

**Polychromatic radiation** is the most common instrumental source of deviation. If the radiation reaching the detector spans a range of wavelengths \( \lambda_1 \) to \( \lambda_2 \) over which \( \varepsilon \) varies, then

\[
A_\text{meas} = -\log\frac{\int P_0(\lambda)\,10^{-\varepsilon(\lambda)bc}\,d\lambda}{\int P_0(\lambda)\,d\lambda}
\]

This average is always less than the true Beer-Lambert absorbance at the peak, because the integral is dominated by less-absorbed wavelengths on the sides of the absorption band. The calibration curve is concave downward (negative deviation from linearity). Narrowing the bandpass by reducing the slit width or using a better monochromator restores linearity.

**Stray light** is radiation that reaches the detector at wavelengths outside the intended bandpass — scattered from optical surfaces, diffracted into wrong orders, or passed by imperfect blocking filters. At high absorbance, when the transmitted beam is very weak, even a small fraction of stray light is proportionately large and the measured transmittance is limited by the stray light fraction. This is why Beer-Lambert linearity breaks down above \( A \approx 2 \) for most instruments, regardless of how narrow the bandpass is.

For **mixtures** of absorbing species with overlapping spectra, Beer-Lambert superposition allows the simultaneous determination of \( n \) analytes by measuring absorbance at \( n \) or more wavelengths:

\[
A_k = \sum_{i=1}^n \varepsilon_{ik}\,b\,c_i, \qquad k = 1,2,\ldots,m
\]

In matrix form, **A** = \( \mathbf{E}b\mathbf{c} \), and if \( m \geq n \) the concentrations are found by least-squares: \( \hat{\mathbf{c}} = (\mathbf{E}^T\mathbf{E})^{-1}\mathbf{E}^T\mathbf{A}/b \). This is the basis of diode-array spectrophotometry for multi-component pharmaceutical analysis (e.g., simultaneous determination of aspirin, caffeine, and paracetamol in a tablet).

## 5.3 Fourier-Transform Infrared Spectroscopy

The heart of an FTIR spectrometer is the **Michelson interferometer**: a beamsplitter (KBr coated with Ge for mid-IR) divides the infrared beam from a broadband source (a Globar, a resistively heated silicon carbide rod) into two paths. One beam travels to a fixed mirror; the other to a moving mirror displaced by a distance \( d \). When the two beams recombine at the beamsplitter, they interfere constructively or destructively depending on the path difference \( \delta = 2d \).

For monochromatic light of wavenumber \( \tilde{\nu} \), the recombined intensity at the detector oscillates as

\[
I(\delta,\tilde{\nu}) = \tfrac{1}{2}I_0(\tilde{\nu})\left[1 + \cos(2\pi\tilde{\nu}\delta)\right]
\]

For a broadband source, the total detector signal is an **interferogram**:

\[
I(\delta) = \int_0^\infty B(\tilde{\nu})\left[1 + \cos(2\pi\tilde{\nu}\delta)\right]d\tilde{\nu}
\]

The spectrum \( B(\tilde{\nu}) \) is recovered by Fourier transformation of the interferogram (after subtracting the dc offset):

\[
B(\tilde{\nu}) = \int_{-\infty}^{\infty}\left[I(\delta) - \tfrac{1}{2}\int B\,d\tilde{\nu}\right]\cos(2\pi\tilde{\nu}\delta)\,d\delta
\]

The FTIR has three intrinsic advantages over a dispersive instrument. The **Jacquinot (throughput) advantage**: the interferometer has no slits and can use a large circular aperture, so it transmits far more energy than a grating spectrometer for the same resolution. The **Fellgett (multiplex) advantage**: all wavelengths are measured simultaneously throughout the entire scan, so for a scan of duration \( T \) containing \( M \) resolution elements, the signal-to-noise ratio is improved by a factor of \( \sqrt{M} \) over a scanning spectrometer that spends \( T/M \) seconds on each element. The **Connes (wavenumber accuracy) advantage**: a He-Ne laser with a precisely known wavelength (632.8 nm) monitors the mirror displacement and triggers data acquisition at precisely equal intervals of path difference, giving wavenumber accuracy better than 0.01 cm⁻¹.

**Attenuated total reflectance** (ATR) FTIR has largely replaced transmission techniques for routine analysis. An IR beam undergoes total internal reflection at the interface between a high-refractive-index crystal (diamond, ZnSe, or Ge) and the sample. The evanescent wave extends approximately 0.5–2 µm into the sample at each reflection; if the sample absorbs IR radiation at that wavelength, the evanescent wave is attenuated. A multi-bounce ATR crystal gives effective path lengths of tens of micrometres. The great advantage of ATR is that no sample preparation is needed: solids, pastes, liquids, and aqueous solutions are measured by pressing them against the crystal.

## 5.4 Raman Spectroscopy

When monochromatic light irradiates a sample, most photons are scattered elastically (Rayleigh scattering) with no change in frequency. A tiny fraction (~1 in 10⁷) is scattered inelastically with a frequency shift equal to a vibrational frequency of the molecule. This is **Raman scattering**, predicted theoretically by Smekal in 1923 and observed experimentally by Raman and Krishnan in 1928. Raman received the Nobel Prize in 1930 — one of the fastest awards in Nobel history.

In the Stokes Raman process, the photon loses energy to the molecule (which is excited from its vibrational ground state to a higher level), and the scattered photon has lower frequency than the incident photon. In anti-Stokes Raman, the molecule starts in a vibrationally excited state and gives energy to the photon. At room temperature, Stokes scattering is more intense (more molecules in the ground state).

The selection rule for Raman activity is fundamentally different from IR: a vibrational mode is Raman-active if the **molecular polarisability** changes during the vibration, whereas IR activity requires a change in **dipole moment**. The complementarity rule (valid for centrosymmetric molecules) states that no vibrational mode can be both IR and Raman active. This makes Raman and FTIR complementary: a symmetric C=C stretch that is Raman active but IR-inactive can be detected by Raman while being invisible to IR.

Modern Raman instruments use a 785-nm (or 1064-nm) diode laser to minimise sample fluorescence (which can overwhelm Raman signals with UV or visible excitation). A notch or edge filter rejects the Rayleigh line, and the remaining scattered light is dispersed onto a CCD detector. **Surface-enhanced Raman scattering** (SERS) exploits the plasmon resonance of gold or silver nanoparticles to enhance Raman signals by factors of 10⁶–10¹⁰, enabling single-molecule detection.

---

# Chapter 6: Molecular Luminescence

## 6.1 Single-Molecule Detection

The idea of detecting a single fluorescent molecule — one dye molecule drifting through a focused laser beam — seemed implausible as recently as the 1980s. By 1990, it had been demonstrated in solution by Richard Keller at Los Alamos. Today, single-molecule fluorescence is a standard tool in biophysics: a single protein labelled with a dye is tracked as it walks along a DNA strand, folds and unfolds in real time, or catalyses a reaction. The signal is a brief burst of photons as the molecule traverses the focal volume, and the number of photons per burst encodes the quantum yield, and hence the conformation, of the molecule at the moment of detection. This extraordinary sensitivity is possible because fluorescence is background-free: scattered laser light is rejected by spectral filtering, and the dark background makes individual photon bursts detectable above noise.

## 6.2 The Jablonski Diagram

The photophysics of fluorescent and phosphorescent molecules is most conveniently displayed on a **Jablonski diagram**, which shows the electronic and vibrational energy levels of the molecule and the transitions between them.

The singlet ground state is labelled \( S_0 \). Absorption of a photon raises the molecule to a vibrationally excited level of \( S_1 \) or \( S_2 \) (or higher) on a timescale of ~10⁻¹⁵ s. **Vibrational relaxation** (VR) within each electronic state is fast (~10⁻¹² s), quickly populating the lowest vibrational level of the excited state. **Internal conversion** (IC) is non-radiative relaxation between electronic states of the same spin multiplicity, and is especially fast between \( S_2 \) and \( S_1 \) (Kasha's rule states that emission occurs from the lowest excited state of a given multiplicity).

**Fluorescence** is radiative emission from \( S_1 \rightarrow S_0 \), occurring on a timescale of \( 10^{-9} \)–\( 10^{-7} \) s. **Intersystem crossing** (ISC) is non-radiative transition from the singlet manifold to the lower-energy triplet state \( T_1 \), facilitated by spin-orbit coupling. From \( T_1 \), **phosphorescence** (\( T_1 \rightarrow S_0 \)) occurs on a much longer timescale (\( 10^{-4} \)–\( 10^2 \) s) because the spin-forbidden nature of the transition reduces the radiative rate constant.

The **fluorescence quantum yield** is the fraction of absorbed photons that are re-emitted as fluorescence:

\[
\Phi_f = \frac{k_f}{k_f + k_{IC} + k_{ISC} + k_q[Q]}
\]

where \( k_f \) is the fluorescence rate constant, \( k_{IC} \) and \( k_{ISC} \) are the non-radiative rate constants for internal conversion and intersystem crossing, and \( k_q[Q] \) represents quenching by external species. The **fluorescence lifetime** \( \tau = 1/(k_f + k_{IC} + k_{ISC}) \) is the average time a molecule spends in \( S_1 \) before emitting or undergoing non-radiative relaxation. Values of \( \tau \) range from ~0.1 ns (rapidly relaxing molecules) to ~20 ns (aromatic hydrocarbons like anthracene).

The **Stokes shift** — the difference in energy between the absorption maximum and fluorescence emission maximum — arises from vibrational relaxation in both the excited and ground states. A molecule absorbs to a vibrationally excited \( S_1 \) level and relaxes to \( v = 0 \) of \( S_1 \) before emitting; the emission then leaves the ground state vibrationally excited, which subsequently relaxes. The net energy lost is approximately twice the energy of the lowest vibrational frequency of the molecule. The Stokes shift is important analytically: it means the excitation and emission wavelengths are different, allowing spectral separation of the laser/lamp light from the weaker fluorescence signal.

## 6.3 Fluorescence Instrumentation

A conventional **spectrofluorometer** uses right-angle geometry: the detector is placed perpendicular to the incident beam, so that scattered excitation light does not directly reach the detector (which would if the detector were in line with the beam). A xenon arc lamp provides broadband excitation; an excitation monochromator selects the excitation wavelength; a second emission monochromator (or bandpass filter) in front of the PMT or CCD detector selects the emission wavelength.

Fluorescence is measured against a dark background, making it inherently more sensitive than absorbance measurements. At low concentrations, the fluorescence signal is

\[
F = \Phi_f I_0 \left(1 - 10^{-A}\right) \approx 2.303\,\Phi_f I_0 \varepsilon b c
\]

(the approximation holds for \( A < 0.01 \)). Sensitivity is proportional to lamp intensity \( I_0 \), quantum yield \( \Phi_f \), and molar absorptivity \( \varepsilon \). Detection limits for strongly fluorescent molecules (rhodamine B, fluorescein) with laser excitation can reach sub-femtomolar concentrations.

At high concentrations, the linear relationship breaks down because the absorber attenuates the excitation beam significantly before it reaches the centre of the cell (**inner filter effect**), and the emitted fluorescence is re-absorbed on its way out (**reabsorption**). Both effects cause negative deviations at high concentration. They can be corrected mathematically or experimentally minimised by using short path lengths or front-face geometry.

## 6.4 Quenching and the Stern-Volmer Equation

Fluorescence is reduced in the presence of certain molecules called **quenchers**. Quenching can occur by two distinct mechanisms.

In **dynamic (collisional) quenching**, a quencher Q collides with the excited fluorophore \( M^* \) during its lifetime in \( S_1 \), accepting the excitation energy by non-radiative transfer. The rate of quenching is \( k_q[Q]\tau \), and the observed quantum yield is reduced by the factor \( (1 + k_q \tau [Q])^{-1} \). Both the intensity and the lifetime are reduced by the same factor, giving the **Stern-Volmer equation**:

\[
\frac{I_0}{I} = \frac{\tau_0}{\tau} = 1 + K_{SV}[Q]
\]

where \( K_{SV} = k_q \tau_0 \) is the Stern-Volmer constant. A plot of \( I_0/I \) vs. \( [Q] \) is linear with slope \( K_{SV} \). Typical quenchers include O₂, I⁻, Cs⁺, acrylamide, and heavy-atom compounds. Dynamic quenching is diffusion-limited; \( k_q \) values near the diffusion limit (~10⁹–10¹⁰ M⁻¹ s⁻¹) indicate that essentially every collision is quenching.

In **static quenching**, the quencher forms a non-fluorescent complex with the fluorophore in the ground state. The complex does not fluoresce but also does not affect the lifetime of uncomplexed fluorophores; thus fluorescence intensity decreases but the lifetime of the remaining free fluorophore is unchanged. Static quenching can be distinguished from dynamic quenching by measuring lifetimes, by varying temperature (higher temperature disrupts the ground-state complex, increasing fluorescence — the opposite of dynamic quenching, where higher temperature increases diffusion and decreases fluorescence), and by the shape of a modified Stern-Volmer plot.

## 6.5 Phosphorescence and Chemiluminescence

**Phosphorescence** is observable in frozen rigid matrices (glass at 77 K) or in rigid polymers, where collisional deactivation of \( T_1 \) is suppressed. The long phosphorescence lifetime (milliseconds to seconds) allows time-gated detection, where the fluorescence (which decays in nanoseconds) is gated off and only the phosphorescence is measured after a delay. This time-gated detection dramatically reduces interference from short-lived fluorescent backgrounds and scattered light.

**Room-temperature phosphorescence** (RTP) is observed when the phosphor is adsorbed on a heavy-atom-containing surface (e.g., filter paper wet with KI) or included in a cyclodextrin cavity that rigidises the molecule and enhances spin-orbit coupling.

**Chemiluminescence** is light emission accompanying a chemical reaction, without the need for external photoexcitation. The reaction produces an electronically excited product, which then emits. The classic example is **luminol** (5-amino-2,3-dihydrophthalazine-1,4-dione) oxidised by hydrogen peroxide in the presence of Fe²⁺ or hemin — the reaction used in forensic blood detection. The iron(II) in haemoglobin catalyses the oxidation; even minute traces of blood remaining after cleaning (concentrations below 1 ppm) produce a visible blue glow. The analytical advantage of chemiluminescence over fluorescence is the absence of an excitation source, which eliminates the major source of background signal (scattered excitation light). Detection limits for chemiluminescence-based immunoassays (CLIA) rival those of radioimmunology without the radiation hazard.

---

# Chapter 7: Atomic Spectroscopy

## 7.1 Trace Metals in Drinking Water

In April 2014, the city of Flint, Michigan switched its water supply from Lake Huron (treated and distributed by Detroit) to the Flint River, a more corrosive water. The distribution pipes, many of which contained lead solder or lead connectors, began to leach lead into the tap water. By 2015, blood-lead levels in children living in Flint had doubled. The investigation that revealed the crisis relied heavily on **inductively coupled plasma-mass spectrometry** (ICP-MS): water samples were collected across the city, acid-digested, and analysed for lead, copper, and iron at concentrations below 1 µg/L (ppb) — concentrations far below what any other common analytical technique could detect reliably. ICP-MS is now the standard method for trace metal analysis in environmental monitoring, clinical toxicology, and food safety.

## 7.2 Atomic Energy Levels and Boltzmann Distribution

In atomic spectroscopy, analyte atoms must first be converted to free, gaseous atoms (atomised), usually by a flame or plasma. At high temperatures, a fraction of atoms occupies excited electronic states. The equilibrium population of a level \( j \) with energy \( E_j \) above the ground state is given by the **Boltzmann distribution**:

\[
\frac{N_j}{N_0} = \frac{g_j}{g_0}\exp\!\left(-\frac{E_j}{kT}\right)
\]

where \( g_j \) and \( g_0 \) are the degeneracies of the excited and ground states, and \( k = 1.381 \times 10^{-23}\,\text{J K}^{-1} \) is Boltzmann's constant.

<div class="example">
<strong>Example 7.1 — Excited-State Population for Na at 589 nm.</strong> The first excited state of sodium (3p, responsible for the yellow sodium D line at 589 nm) lies at \( E_j = 3.37 \times 10^{-19}\,\text{J} \) above the ground state (3s). The degeneracy ratio \( g_j/g_0 = 2 \). Calculate the fraction of Na atoms in the excited state in a flame at 2500 K and in an ICP at 6000 K.

At 2500 K:

\[
\frac{N_j}{N_0} = 2\exp\!\left(-\frac{3.37\times10^{-19}}{1.381\times10^{-23}\times2500}\right) = 2\exp(-9.76) = 1.14 \times 10^{-4}
\]

At 6000 K:

\[
\frac{N_j}{N_0} = 2\exp\!\left(-\frac{3.37\times10^{-19}}{1.381\times10^{-23}\times6000}\right) = 2\exp(-4.07) = 0.034
\]

At flame temperature, only ~0.01% of sodium atoms are excited — 99.99% are in the ground state, making atomic absorption extremely favourable. At ICP temperature, ~3.4% are excited, giving strong emission.
</div>

## 7.3 Flame Atomic Absorption Spectrometry

In **flame AAS** (FAAS), the analyte solution is nebulised into a pneumatic nebuliser, the aerosol is mixed with fuel and oxidant in a spray chamber (large droplets fall to waste, leaving only fine droplets), and the resulting mist is burned in a long (10 cm), slot-burner flame. Common flame types are air-acetylene (~2300 °C, for most metals) and nitrous oxide-acetylene (~2700 °C, for refractory elements such as Al, V, W that form stable oxides in cooler flames).

The radiation source is the **hollow-cathode lamp** (HCL): a low-pressure discharge lamp in which a cathode made of the analyte metal emits narrow atomic emission lines characteristic of that element. Because the HCL emission lines are intrinsically narrow (Doppler-broadened at cool cathode temperatures), they coincide precisely with the absorption lines of ground-state analyte atoms in the flame. This high spectral resolution — the source line perfectly matches the absorption line — is the key advantage of AAS: each element is measured by its own lamp, eliminating spectral interference from other elements.

Background absorption (from broadband absorption by molecular species or particulate scattering in the flame) is corrected using a **deuterium lamp background corrector** (D₂ lamp): a hydrogen lamp emits a continuum; the analyte atomic absorption is a very narrow peak in this continuum and the molecular absorption is broad. The D₂ lamp sees only the broadband molecular absorption; subtracting D₂-lamp absorbance from HCL absorbance yields the true atomic absorbance.

**Zeeman-effect background correction** is more powerful: a magnetic field (0.5–1 T) is applied to the atomiser (graphite furnace). The analyte absorption line splits into \( \pi \) and \( \sigma \) components (normal or anomalous Zeeman splitting). With a polariser, \( \sigma \) components (shifted away from the original wavelength) measure only background, while \( \pi \) component (at the original wavelength) measures analyte + background. The difference gives the analyte signal. Zeeman correction works correctly even when the background absorption is structured (molecular bands), which the D₂ lamp method cannot handle.

## 7.4 Graphite Furnace AAS

**Graphite furnace AAS** (GFAAS), also called electrothermal atomisation AAS (ET-AAS), achieves detection limits 100–1000 times lower than FAAS by confining the atom cloud in a small graphite tube (2–5 cm long, 5–8 mm i.d.) where the atom population builds to higher concentrations than in an open flame. A measured volume (typically 5–50 µL) of sample is pipetted onto the tube wall or onto a graphite platform (the L'vov platform) and the tube is heated through a programmed temperature sequence:

| Stage | Temperature (°C) | Purpose |
|---|---|---|
| Drying | 80–120 | Remove solvent |
| Pyrolysis (ashing) | 400–1200 | Remove matrix interferences |
| Atomisation | 1700–2700 | Rapidly vaporise analyte |
| Clean-out | 2800+ | Remove residues |

The **L'vov platform** is a small graphite platform on which the sample sits. When the tube wall is hot but the platform is still cool, the sample remains on the platform and analyte vaporisation is delayed until the gas-phase temperature has stabilised. This **isothermal atomisation** reduces gas-phase chemical interferences (which occur when the analyte vaporises into a rapidly changing, non-equilibrium gas-phase environment) and improves reproducibility. Chemical modifiers (Pd + Mg(NO₃)₂ is a universal modifier) stabilise the analyte to higher pyrolysis temperatures, allowing more complete removal of the matrix.

## 7.5 ICP-OES and ICP-MS

The **inductively coupled plasma** (ICP) source, introduced by Fassel and Kniseley in the early 1970s, uses a radiofrequency induction coil (27 or 40 MHz) to sustain a plasma of argon at approximately 6000–8000 K. The plasma is formed in a three-concentric-tube torch: the outer stream of argon cools the outer tube (plasma gas, ~15 L/min), the middle stream provides auxiliary gas (1 L/min), and the inner tube carries the sample aerosol (nebuliser gas, ~1 L/min) through the central channel of the plasma.

In **ICP-OES** (optical emission spectrometry), the intense emission from the hot plasma is viewed either axially (along the plasma axis) or radially (perpendicular to the axis) by a spectrometer. Axial viewing gives higher sensitivity (longer emission path) but more matrix interferences from the cooler, lower end of the plasma. Radial viewing is more robust for complex matrices. Modern instruments simultaneously measure over 50 elements by recording an emission spectrum on a CCD detector.

In **ICP-MS**, instead of measuring optical emission, the ions produced in the plasma are extracted through sampler and skimmer cones into a high-vacuum region and mass-analysed. The ICP at atmospheric pressure contains ions at ~10⁶–10⁷ µg/mL per element; the interface differentially pumps the gas from atmospheric pressure down to ~10⁻⁵ Torr. A quadrupole, magnetic sector, or time-of-flight mass analyser separates ions by \( m/z \). ICP-MS detection limits are in the range 1–100 pg/mL (ppt) for most elements — orders of magnitude better than flame AAS.

A challenge for ICP-MS is **polyatomic interferences**: Ar-based plasma ions such as \(^{40}\text{Ar}^{16}\text{O}^+\) (m/z = 56) interfere with \(^{56}\text{Fe}^+\), and \(^{40}\text{Ar}^{38}\text{Ar}^+\) (m/z = 78) interferes with \(^{78}\text{Se}^+\). These are addressed by a **collision/reaction cell** (CRC) inserted between the ion extraction region and the mass analyser. Helium in the CRC removes polyatomic ions by collisional dissociation; hydrogen reacts specifically with ArO⁺ to give Ar + H₂O⁺, which has a different mass. High-resolution sector instruments (resolving power ~10,000) can separate most polyatomic ions by their exact mass difference.

<div class="remark">
<strong>Detection limit comparison for selected elements (approximate, aqueous solutions):</strong>

| Technique | Fe (µg/L) | Pb (µg/L) | Cd (µg/L) | Notes |
|---|---|---|---|---|
| Flame AAS | 3 | 15 | 0.5 | Simple, single-element |
| GFAAS | 0.03 | 0.05 | 0.001 | Small volume, slow |
| ICP-OES | 0.5 | 20 | 0.3 | Multi-element, fast |
| ICP-MS | 0.001 | 0.001 | 0.0001 | Isotope ratio, ultratrace |
</div>

---

# Chapter 8: Mass Spectrometry

## 8.1 Doping Control and the Power of MS/MS

The World Anti-Doping Agency (WADA) tests athletes' urine samples for hundreds of prohibited substances, some of which are present at concentrations below 1 ng/mL (ppb). A single urine sample from a Tour de France rider must be screened for anabolic steroids, peptide hormones, stimulants, diuretics, and designer drugs — in a single analytical run, within 24 hours. The method of choice is **liquid chromatography-tandem mass spectrometry** (LC-MS/MS). The combination of chromatographic separation and the specificity of two sequential mass-selection steps gives a confirmation test capable of identifying trace analytes even in extremely complex biological matrices. The technique essentially eliminates false positives: the probability that two substances co-elute at exactly the same retention time and fragment into the same product ions at the same intensity ratio is vanishingly small.

## 8.2 Ionisation Methods

Before mass analysis, analytes must be converted to gas-phase ions. The choice of ionisation method is the first and most important decision in MS method development.

**Electron ionisation** (EI) is the oldest and most standardised method, used almost exclusively with GC-MS. A beam of 70-eV electrons bombards the vaporised analyte. The excess energy (~70 − ionisation energy ≈ 60 eV) is far greater than needed for ionisation (~10 eV), so the resulting radical cation \( M^{+\bullet} \) fragments extensively. The fragmentation pattern is highly reproducible and characteristic — libraries of over 300,000 EI spectra enable computerised library searching. Key fragmentation pathways include **α-cleavage** (bond adjacent to a heteroatom or radical centre breaks homolytically), the **McLafferty rearrangement** (six-membered transition state, requires γ-H and a C=O group), and the **retro-Diels-Alder** for cyclohexene systems. The molecular ion \( M^{+\bullet} \) is present if the molecule is stable to fragmentation; it may be absent for labile molecules. **Isotope patterns** from chlorine (³⁵Cl:³⁷Cl = 3:1) and bromine (⁷⁹Br:⁸¹Br = 1:1) are diagnostic and appear in every fragment containing these halogens.

**Chemical ionisation** (CI) uses a reagent gas (methane, ammonia, or isobutane) at ~1 Torr. The reagent gas is ionised by the electron beam and forms reactive ions (CH₅⁺ from methane) that protonate the analyte in a gentler exothermic reaction:

\[
\text{CH}_5^+ + \text{M} \rightarrow [\text{M}+\text{H}]^+ + \text{CH}_4
\]

The protonated molecule \( [\text{M}+\text{H}]^+ \) contains only ~1–2 eV of excess energy (vs. ~60 eV for EI), giving much less fragmentation — hence the molecular mass is more reliably observed, at the cost of less structural information.

**Electrospray ionisation** (ESI), developed by John Fenn (Nobel 2002), is the dominant ionisation method for LC-MS and biomolecule analysis. A solution of analyte is pumped through a metal capillary held at 3–5 kV relative to the inlet of the mass spectrometer. The electric field and pneumatic nebulisation (nitrogen sheath gas) produce a fine spray of charged droplets at atmospheric pressure. As solvent evaporates, the droplet radius shrinks and the surface charge density increases. When the electrostatic repulsion exceeds the surface tension (the **Rayleigh limit**), the droplet undergoes **Coulombic fission** into smaller droplets. Eventually, by either repeated fission (charged residue model, favoured for large proteins) or direct ion evaporation (ion evaporation model, favoured for small molecules), gas-phase ions are produced. Large molecules such as proteins acquire many charges (\( [M + nH]^{n+} \)), distributing the charge across many basic sites, enabling mass analysis of molecules >1 MDa even with a quadrupole of limited \( m/z \) range.

**MALDI** (matrix-assisted laser desorption/ionisation), developed by Hillenkamp, Karas, and Tanaka (Nobel 2002), is the preferred method for polymer and protein analysis by time-of-flight MS. The analyte is co-crystallised with a UV-absorbing matrix compound (2,5-dihydroxybenzoic acid DHB, α-cyano-4-hydroxycinnamic acid CHCA for peptides, sinapinic acid for proteins). A UV laser pulse (337 nm N₂ or 355 nm Nd:YAG) ablates the matrix and analyte together; the matrix absorbs the laser energy and undergoes rapid phase explosion, carrying analyte molecules into the gas phase and protonating them. The mechanism is not fully understood, but mostly singly charged \( [M+H]^+ \) ions are produced — unlike ESI. MALDI is tolerant of buffers and salts at low concentrations, making it convenient for biological samples.

## 8.3 Mass Analysers

**Quadrupole mass filters** consist of four parallel rods arranged in a square array. Opposite rod pairs are electrically connected; one pair receives a potential \( +(U + V\cos\omega t) \) and the other \( -(U + V\cos\omega t) \), where \( U \) is the DC voltage and \( V \) is the RF amplitude. Ion trajectories through this oscillating field are stable only for a narrow range of \( m/z \) at a given \( U/V \) ratio. By scanning \( U \) and \( V \) simultaneously at fixed \( U/V \), the quadrupole transmits ions of successive \( m/z \) values. Resolution is unit mass (~1 Da), sufficient to resolve most small-molecule analytes. Quadrupoles are compact, relatively inexpensive, and well suited to quantitative analysis with selected ion monitoring (SIM) or MRM.

**Time-of-flight** (TOF) analysers separate ions by their velocities after acceleration through a potential \( V \). All ions receive the same kinetic energy \( eV = \frac{1}{2}mv^2 \), so lighter ions travel faster and arrive at the detector sooner. The relationship between arrival time and mass is:

\[
t = L\sqrt{\frac{m}{2eV}} \implies \frac{m}{z} = \frac{2eVt^2}{L^2}
\]

Resolution is limited by the spread in initial kinetic energies. The **reflectron** (ion mirror) corrects for this: faster ions penetrate deeper into the reflecting field and travel a longer path, allowing slower ions of the same \( m/z \) to catch up. Reflectron TOF achieves resolving power of 10,000–50,000, enabling accurate mass determination to a few ppm.

The **Orbitrap**, introduced by Alexander Makarov in 2000 and commercialised by Thermo Scientific in 2005, traps ions in an electrostatic field between a central spindle-shaped electrode and an outer barrel electrode. Ions orbit around and oscillate along the spindle at a frequency:

\[
\omega = \sqrt{\frac{k}{m/z}}
\]

where \( k \) is a field parameter. The oscillating ion cloud induces an **image current** on split outer electrodes; Fourier transformation of the time-domain image current gives the frequency spectrum and hence the \( m/z \) spectrum. Resolving power exceeds 500,000 and mass accuracy is better than 1 ppm with internal calibration.

**Tandem MS** (\( \text{MS}^n \)) selects a precursor ion in the first stage, fragments it (by collision-induced dissociation, CID, in an inert gas such as Ar or N₂), and analyses the product ions in the second stage. In a **triple quadrupole** (QqQ), Q1 selects the precursor, q2 (the collision cell, a short RF-only quadrupole) fragments it, and Q3 analyses products. **Multiple reaction monitoring** (MRM) selects a specific precursor → product pair — for example, testosterone \( m/z \) 289 → 97 — and gives extremely high selectivity for quantitative analysis in complex matrices.

---

# Chapter 9: Extraction and Sample Preparation

## 9.1 The Hidden Half of Analysis

Most textbook discussions of analytical methods focus on the instrument — the spectrometer, the chromatograph, the mass analyser. Yet in practice, **sample preparation** typically accounts for 60–80% of the total analysis time and is the dominant source of error. The raw sample arriving at the laboratory — a food product, a blood specimen, a water sample, a soil core — must be transformed into a clean solution containing the analyte in a form compatible with the instrument. The transformation may involve dissolution, dilution, preconcentration, matrix removal, or derivatisation. Getting this right is as important as having a good instrument.

## 9.2 Liquid-Liquid Extraction

**Liquid-liquid extraction** (LLE) partitions an analyte between two immiscible liquid phases (usually aqueous and organic). At equilibrium, the **distribution ratio** \( D \) is

\[
D = \frac{c_\text{org}}{c_\text{aq}} = \frac{\text{all forms of analyte in organic phase}}{\text{all forms of analyte in aqueous phase}}
\]

(Note: \( D \) differs from the simple partition coefficient \( K_D = [\text{A}]_\text{org}/[\text{A}]_\text{aq} \) in that \( D \) accounts for all chemical forms, including protonated/deprotonated and complexed species.) The extraction efficiency for a single extraction using volume \( V_\text{org} \) of organic solvent from volume \( V_\text{aq} \) of aqueous solution is

\[
E = \frac{D}{D + V_\text{aq}/V_\text{org}} \times 100\%
\]

For a fixed total volume of organic solvent, multiple small extractions are more efficient than a single large extraction. After \( n \) extractions each using volume \( V_\text{org}/n \), the fraction remaining in the aqueous phase is

\[
q_n = \left(\frac{D' + 1}{D' + n}\right)^n \rightarrow e^{-n D'} \text{ for large } n
\]

where \( D' = D V_\text{org}/(n V_\text{aq}) \). Three extractions with one-third the volume each give significantly higher total recovery than one extraction with the full volume.

For ionisable analytes, \( D \) depends strongly on pH because the uncharged form partitions into organic solvents while the charged form does not. For a weak acid HA with \( pK_a = 5 \), at pH 3 (two units below \( pK_a \)) over 99% is in the neutral HA form and \( D \approx K_D \); at pH 7 (two units above) over 99% is in the A⁻ form and \( D \approx K_D \times 10^{-2} \). This pH dependence is exploited analytically: extract the analyte as the neutral form at low pH, then back-extract into an alkaline aqueous phase to strip it from the organic solvent.

## 9.3 Solid-Phase Extraction

**Solid-phase extraction** (SPE) uses a small bed of sorbent packed in a cartridge or syringe barrel (100 mg–1 g sorbent, 1–6 mL bed) to retain analytes from a large volume of sample solution, concentrating them by a factor of 10–1000. The four steps are:

1. **Conditioning**: the sorbent is wetted with a solvent compatible with the sample (e.g., methanol then water for C18 SPE) to solvate the functional groups and remove air bubbles.
2. **Loading**: the sample solution is passed through the sorbent; analytes are retained by the dominant interaction (reversed-phase: hydrophobic; normal phase: polar; ion exchange: electrostatic; mixed mode: combined).
3. **Washing**: an intermediate-strength solvent removes matrix interferents while the analytes remain retained.
4. **Eluting**: a strong solvent (high organic content for RP, buffer of correct pH/ionic strength for ion exchange) releases the analytes in a small volume.

C18 (octadecylsilyl) cartridges are the most widely used for reversed-phase SPE. The **breakthrough volume** — the maximum sample volume that can be loaded without analyte loss — depends on the retention factor of the analyte on the sorbent and is determined empirically by loading increasing volumes and monitoring the eluate.

The **QuEChERS** (Quick, Easy, Cheap, Effective, Rugged, Safe) method, developed by Anastassiades et al. in 2003, has become the standard for pesticide residue analysis in foods. A blended food sample is extracted with acetonitrile and anhydrous MgSO₄/NaCl added to drive phase separation. A portion of the organic extract is transferred to a tube containing **dispersive-SPE** sorbents (primary secondary amine, PSA, to remove sugars and fatty acids; C18 to remove lipids; MgSO₄ to remove residual water) and vortex-mixed. The cleaned-up extract is injected directly into GC-MS or LC-MS. The entire process takes under 15 minutes per sample.

## 9.4 Solid-Phase Microextraction

**SPME**, invented by Janusz Pawliszyn at the University of Waterloo in 1990, miniaturises the extraction onto a thin polymeric coating bonded to a fused-silica fibre inside a syringe-like device. The fibre is exposed either directly to the sample solution (direct immersion SPME) or to the headspace above the sample (headspace SPME), and analytes partition into the coating until equilibrium is reached.

At equilibrium, the amount of analyte extracted is

\[
n = \frac{K_{fs}\,V_f\,V_s\,c_0}{K_{fs}\,V_f + V_s}
\]

where \( K_{fs} = c_f/c_s \) is the fibre-sample distribution constant, \( V_f \) is the fibre coating volume (~0.5 µL for 100 µm PDMS coating on a 1-cm fibre), \( V_s \) is the sample volume, and \( c_0 \) is the initial analyte concentration. When \( V_s \gg K_{fs}V_f \), the equation simplifies to \( n \approx K_{fs}V_f c_0 \), meaning the extraction is exhaustive from the fibre's perspective (it extracts a fixed, small percentage of the analyte regardless of sample volume). In headspace SPME, the three-phase equilibrium (sample → headspace → fibre) allows analysis of volatile and semi-volatile compounds with minimal carryover of involatile matrix components.

---

# Chapter 10: Gas Chromatography

## 10.1 Detecting Organochlorines at Parts-per-Trillion

Polychlorinated biphenyls (PCBs) and organochlorine pesticides (DDT, dieldrin, heptachlor) accumulate in fatty tissues and biomagnify up the food chain. Regulatory limits for PCBs in fish are set at 2 µg/kg wet weight — at the parts-per-trillion level in a complex lipid matrix. Achieving this detection limit requires three things: efficient chromatographic separation (dozens of PCB congeners plus co-extracted lipids), a selective and sensitive detector (ECD responds to electronegative halogens and has essentially zero response to co-extracted non-chlorinated compounds), and careful sample cleanup (SPE or gel permeation chromatography to remove lipids). GC-ECD has been the method of choice for organochlorine analysis since the 1960s and remains so today.

## 10.2 Open-Tubular Column Theory: The Golay Equation

The introduction of open-tubular (capillary) columns by Marcel Golay in 1958 transformed gas chromatography from a preparative technique with modest resolution into a high-resolution analytical tool capable of separating hundreds of components in a single run. The key equation governing band broadening in an open-tubular column is the **Golay equation**:

\[
H = \frac{B}{u} + C_s\,u + C_M\,u
\]

There is no **A** (eddy diffusion) term — unlike packed columns, open-tubular columns have no packing material to cause multiple path lengths. \( B/u \) represents **longitudinal diffusion** along the column (molecules diffuse from the band maximum towards lower concentrations). \( C_s u \) is the **stationary phase mass transfer** term (resistance to mass transfer between mobile and stationary phases, proportional to \( d_f^2/D_s \) where \( d_f \) is film thickness and \( D_s \) is diffusivity in the stationary phase). \( C_M u \) is the **mobile phase (gas) mass transfer** term (resistance to diffusion across the column radius, proportional to \( r^2/D_M \) where \( r \) is column radius and \( D_M \) is gas-phase diffusivity).

The minimum plate height occurs at the **optimum velocity**:

\[
u_\text{opt} = \sqrt{\frac{B}{C_s + C_M}}
\]

Because \( D_M \) in gases is high (~0.1 cm² s⁻¹) compared to liquids (~10⁻⁵ cm² s⁻¹), the gas-phase mass transfer term \( C_M \) is small, and much higher carrier gas velocities (up to 10× \( u_\text{opt} \)) can be used with only modest loss of efficiency. This practical flexibility is exploited in fast GC: short, narrow columns operated above optimum velocity give fast separations with acceptable efficiency.

## 10.3 Stationary Phases and Selectivity

The stationary phase governs which analytes are retained longest and how they are separated from one another. Stationary phases are classified by polarity, which determines the dominant intermolecular interactions with analytes.

**Poly(dimethylsiloxane)** (PDMS, DB-1 or HP-1) is the most commonly used non-polar phase. It has low viscosity across a wide temperature range (−60 to +300°C), is chemically stable, and bleeds slowly. Non-polar analytes (hydrocarbons, chlorinated compounds) are separated approximately in order of boiling point.

**5% Phenyl-PDMS** (DB-5, HP-5) incorporates phenyl groups that add slight π-π interaction selectivity. It is the industry default for pesticide screening (US EPA 8270 and 8081 methods use DB-5 columns) and is the most widely used GC column in the world.

**Cyanopropyl-PDMS** phases (DB-23, DB-225) have strong dipole-dipole interactions and are selective for fatty acid methyl esters (FAMEs) — the standard phases for FAME analysis in food fats.

**Poly(ethylene glycol)** (PEG, Carbowax, DB-Wax) is strongly polar and selective for alcohols, ketones, esters, and polar compounds. It bleeds above 250°C and cannot be used at high temperatures.

The **Kováts retention index** system provides a standardised framework for comparing retention data across different columns and temperatures. Each analyte is assigned a retention index \( I \) by interpolation between the retention times of the two bracketing n-alkanes:

\[
I = 100\left[z + \frac{\log t'_r(x) - \log t'_r(z)}{\log t'_r(z+1) - \log t'_r(z)}\right]
\]

where \( z \) is the carbon number of the smaller bracketing alkane. Retention indices are much more reproducible across laboratories than retention times and are tabulated in databases such as NIST for over 100,000 compounds on standard columns.

## 10.4 Injection Techniques

The **split/splitless injector** is the most common for analytical GC. A small volume (0.5–2 µL) of liquid sample is injected through a septum into a heated liner (250°C), where it vaporises instantaneously. In **split mode**, most of the vapour is vented to atmosphere through a split valve (split ratios 10:1 to 500:1), and only a small fraction enters the column — this gives narrow, well-shaped peaks but dilutes the sample. In **splitless mode**, the split valve is closed for 30–60 s, allowing the entire vaporised sample to be swept onto the column; concentrated samples are needed, and the analyte must be focused at the head of the column by a cold **solvent effect** (the solvent condenses at the cold column head, concentrating the analyte).

**SPME** desorption in the GC inlet is achieved by inserting the exposed fibre directly into the heated injector; analytes desorb from the coating and are swept onto the column. In splitless mode with a cooled column inlet, band focusing is efficient and excellent peak shapes are obtained.

## 10.5 Detectors

The **flame ionisation detector** (FID) burns the column effluent in a hydrogen-air flame. Carbon-containing compounds produce ions and free electrons in the flame (through a mechanism involving CH radicals reacting with oxygen to give CHO⁺ + e⁻). The resulting current is measured between a collector electrode and the flame jet. The FID responds to virtually all organic compounds with C-H bonds; it does not respond to water, CO₂, N₂, O₂, or noble gases. The response is proportional to the mass of carbon per unit time (mass-sensitive detector) and is remarkably linear over seven decades of concentration. It is the universal detector for organic compounds in GC.

The **electron capture detector** (ECD) contains a ⁶³Ni foil (a β emitter) that ionises the carrier gas (N₂ or 5% CH₄/Ar), producing a standing current. Electronegative molecules (halogens, nitro groups, certain carbonyl compounds) capture electrons and reduce this standing current. The ECD is exceptionally sensitive for chlorinated and brominated compounds (LOD < 1 pg) but has a limited linear dynamic range (~10³) and is non-destructive, allowing the effluent to be collected for further analysis. The ⁶³Ni source requires NRC/CNSC licensing in Canada.

The **nitrogen-phosphorus detector** (NPD, or thermionic detector) uses a heated alkali bead (rubidium or caesium silicate) positioned above the FID-like flame. The bead selectively sensitises responses to N and P containing compounds, while suppressing carbon compound responses by a factor of ~10⁴. LODs for nitrogen compounds (~0.1 pg N/s) and phosphorus compounds (~0.01 pg P/s) enable trace analysis of pesticides, drugs, and explosives.

---

# Chapter 11: Liquid Chromatography

## 11.1 Proteomics by Reversed-Phase HPLC-MS/MS

A cell lysate contains tens of thousands of proteins, each present at wildly different abundances. To characterise the **proteome** — the complete protein complement of a cell under a given condition — the proteins are digested with trypsin into peptides (trypsin cleaves at Lys and Arg residues, generating peptides of 6–20 amino acids). The complex peptide mixture is injected onto a 15-cm C18 capillary column (75-µm i.d., 1.7-µm particle size) operating at nanoflow rates (200–300 nL/min). A 90-minute gradient from 2% to 40% acetonitrile/water (with 0.1% formic acid) separates thousands of peptides. The eluent passes directly through a nano-ESI tip into a high-resolution mass spectrometer (Orbitrap). In a single LC-MS/MS experiment, the instrument identifies peptide precursor ions, fragments the most abundant ones (data-dependent acquisition, DDA), and matches the product ion spectra against protein databases — identifying 2000–5000 proteins from a single injection. This workflow is now the foundation of quantitative proteomics.

## 11.2 Retention Mechanism in Reversed-Phase HPLC

In **reversed-phase HPLC** (RP-HPLC), the stationary phase is non-polar (hydrophobic, e.g., C18-bonded silica) and the mobile phase is polar (water-organic mixture). Analytes are retained by **hydrophobic interaction** — the tendency of non-polar regions of the analyte to associate with the C18 chains rather than with water. This is primarily an entropic effect: water molecules form ordered cages around non-polar solutes (the hydrophobic effect), so transferring the non-polar solute to the organic stationary phase releases ordered water molecules and increases entropy.

The retention factor \( k \) decreases approximately log-linearly with increasing organic modifier content:

\[
\log k \approx \log k_w - S\phi
\]

where \( k_w \) is the retention factor in pure water, \( \phi \) is the volume fraction of organic modifier, and \( S \) is a constant (~4 for acetonitrile, ~3 for methanol). This is the **linear solvent strength model** (LSS) and it enables rational gradient elution design: if the slope \( S \) is known (from two isocratic experiments), the optimum gradient can be calculated to give equally spaced peaks across the chromatogram.

**Column selectivity** is determined by the chemistry of the bonded phase. C18 is the standard workhorse — high coverage, retentive, stable. **Phenyl** phases add π-π interactions, improving the separation of aromatic compounds from each other. **Cyano** phases (−C₃H₆−CN) are less retentive than C18 and offer different selectivity for polar analytes. **Fluoro** phases (−C₆H₄F or −C₈F₁₇) have unique selectivity for halogenated compounds and drugs with fluorine substituents. **Embedded polar group** phases (a carbamate or amide group buried in the C8 or C12 chain) can be used with 100% aqueous mobile phases without stationary phase dewetting.

## 11.3 Ion-Exchange and Size-Exclusion Chromatography

**Ion-exchange chromatography** (IEC) separates ions by their differential affinity for a charged stationary phase. **Strong cation exchangers** (SCX) bear sulfonate groups (−SO₃⁻) and retain positively charged analytes; elution is achieved by increasing the ionic strength or pH. **Strong anion exchangers** (SAX) bear quaternary ammonium groups (−N⁺(CH₃)₃) and retain anions. **Suppressed ion chromatography** for the simultaneous determination of inorganic anions (F⁻, Cl⁻, NO₂⁻, NO₃⁻, SO₄²⁻, PO₄³⁻) uses a carbonate eluent, separates anions on a low-capacity anion exchanger, then passes the column effluent through a **suppressor** that converts the eluent carbonate to carbonic acid (which is poorly conducting and does not interfere with conductivity detection) and converts analyte anions to their conjugate acid or sodium salt. Detection by conductivity gives LODs below 0.1 mg/L for common anions.

**Size-exclusion chromatography** (SEC, also GPC for polymer analysis and GFC for aqueous systems) separates analytes by their hydrodynamic volume. Larger molecules cannot penetrate small pores in the gel particles and elute first (near the void volume \( V_0 \)); smaller molecules penetrate pores and spend more time inside, eluting later (near the total permeation volume \( V_t \)). The calibration curve of log(molecular weight) vs. elution volume is approximately linear over a useful range determined by the pore size distribution. SEC provides molar mass distribution data (number-average \( M_n \), weight-average \( M_w \), and dispersity \( Ð = M_w/M_n \)) for polymers. Absolute molar masses require online light-scattering or viscometry detectors.

## 11.4 UHPLC and Column Technology

Ultra-high-performance liquid chromatography (UHPLC or UPLC, trade name by Waters) uses columns packed with sub-2-µm particles operated at pressures up to 1000 bar (15,000 psi). The van Deemter minimum plate height scales as \( H_\text{min} \approx 2d_p \), so halving the particle size from 5 µm to 1.7 µm halves the minimum plate height. At the same column length, efficiency doubles; alternatively, the column length can be halved while maintaining the same efficiency, giving a 4-fold reduction in run time (since \( t_r \propto L \) and the higher flow rate also contributes). UHPLC reduces analysis time from 30 minutes to under 5 minutes for typical pharmaceutical assays.

**Core-shell** (fused-core, superficially porous) particles represent an alternative approach. A solid silica core (~1.7 µm) is surrounded by a thin porous shell (~0.5 µm). The thin shell reduces the mass transfer \( C \) term (shorter diffusion path in the particle) while the solid core reduces the longitudinal diffusion \( B \) term (less intra-particle void volume). Core-shell columns with 2.7-µm particles give efficiency approaching sub-2-µm UHPLC at pressures compatible with conventional HPLC instruments.

## 11.5 Detection in HPLC

The **diode-array detector** (DAD, also PDA) uses a grating to disperse the transmitted light onto a multi-element photodiode array, recording a full UV-Vis spectrum (typically 190–800 nm) at each time point. This allows post-run extraction of chromatograms at any wavelength, peak purity assessment (comparing spectra at leading and trailing edges of a peak to check for co-elution), and library matching for unknown identification.

The **evaporative light-scattering detector** (ELSD) nebulises the column effluent, evaporates the mobile phase in a drift tube, and detects the remaining analyte particles as they scatter a laser beam. It responds to any analyte that is less volatile than the mobile phase, making it universal for non-UV-absorbing compounds (lipids, carbohydrates, polymers). However, the response is non-linear (log-log plot), which complicates quantitation.

The **LC-MS interface** is the most informative HPLC detector. ESI and APCI interfaces convert column effluent to gas-phase ions at atmospheric pressure; the ions are sampled through a capillary or cone into the mass spectrometer. The combination of chromatographic separation with MS/MS detection gives both retention time and mass spectral evidence for identification — two independent dimensions of selectivity — making it effectively impossible to have false positives.

---

# Chapter 12: Electroseparation Methods

## 12.1 Capillary Electrophoresis and the Human Genome Project

The Human Genome Project, completed in 2003, required sequencing approximately 3 billion base pairs of DNA. The sequencing chemistry (Sanger dideoxy method) generates fragments of DNA ending at each of the four bases, labelled with four different fluorescent dyes. The original approach was slab-gel electrophoresis, in which fragments migrate through a polyacrylamide gel slab at different speeds depending on size, and four-colour laser-induced fluorescence detection reads the sequence from the gel. This was slow, labour-intensive, and difficult to automate. The bottleneck was broken when capillary gel electrophoresis (CGE) replaced slab gels: 96 or more fused-silica capillaries, each 50 µm i.d. and 50 cm long, filled with replaceable polymer solution, run in parallel with automated injection and detection. Each capillary could read ~800 bases in ~1 hour, and a 96-capillary array thus produced nearly 80,000 bases per hour. Without CGE, the Human Genome Project would have taken decades longer.

## 12.2 Electrophoresis and Electroosmotic Flow

In **electrophoresis**, ions in solution move under the influence of an electric field. The electrophoretic force on an ion of charge \( q \) in a field \( E \) is \( F_E = qE \). At terminal velocity, this is balanced by viscous drag (Stokes law for a sphere of radius \( r \) in solvent of viscosity \( \eta \)):

\[
F_f = 6\pi\eta r v
\]

Setting \( F_E = F_f \):

\[
v = \frac{qE}{6\pi\eta r} = \mu_{ep} E
\]

where \( \mu_{ep} = q/(6\pi\eta r) \) is the **electrophoretic mobility**. Ions of higher charge or smaller size move faster. In a capillary filled with buffer at pH values above about 3, the silanol groups (Si-OH) on the fused-silica inner wall are ionised to SiO⁻, creating a negatively charged surface. Counter-ions (cations) accumulate near the wall, forming the **diffuse double layer**. When an axial electric field is applied, the cation excess in the diffuse layer migrates towards the cathode, dragging the bulk solvent with it. This bulk solvent flow is the **electroosmotic flow** (EOF).

The EOF velocity is related to the ζ-potential of the capillary wall through the Helmholtz-Smoluchowski equation:

\[
v_{eo} = -\frac{\varepsilon \zeta}{4\pi\eta} E = \mu_{eo} E
\]

A key property of EOF is its **plug flow profile**: because the driving force is uniformly distributed along the entire capillary wall (not just at the ends as in pressure-driven flow), the velocity profile is flat across the capillary cross-section. Compare this to pressure-driven (Poiseuille) flow, which has a parabolic profile with zero velocity at the walls and maximum velocity at the centre — band broadening in pressure-driven flow arises partly from this dispersion in velocities. The plug flow profile in EOF contributes essentially zero to band dispersion, and is the fundamental reason why CE achieves far higher efficiency (10⁵–10⁷ theoretical plates) than pressure-driven HPLC.

## 12.3 Capillary Zone Electrophoresis

In **capillary zone electrophoresis** (CZE), a thin plug of sample is injected at one end of a buffer-filled capillary (typically 25–75 µm i.d., 30–100 cm total length, 20–80 cm to detector). An electric field of 100–500 V/cm is applied; analytes migrate under the combined influence of their electrophoretic mobility and the EOF. The **apparent mobility** is

\[
\mu_{app} = \mu_{ep} + \mu_{eo}
\]

At typical operating pH (7–9 in phosphate or borate buffer), \( \mu_{eo} \) is large and directed towards the cathode (where the detector is placed). Even anions, which have negative \( \mu_{ep} \) (directed towards the anode), are swept towards the detector by the EOF if \( |\mu_{eo}| > |\mu_{ep}| \). This means all ions (cations, anions, and neutrals) pass the detector in order: fastest cations first, then slower cations, then neutral compounds (which all co-migrate at the same velocity \( \mu_{eo} E \)), then slowest anions last.

The migration time is

\[
t_m = \frac{L_d}{(\mu_{ep} + \mu_{eo})E} = \frac{L_d L_t}{(\mu_{ep} + \mu_{eo})V}
\]

where \( L_d \) is the length to the detector, \( L_t \) is the total capillary length, and \( V \) is the applied voltage. High voltage is important for speed and efficiency: the plate number is

\[
N = \frac{\mu_{app} V}{2 D}
\]

where \( D \) is the diffusion coefficient. Unlike chromatography, where longer columns always mean more plates but also more time, in CE increasing the voltage increases both efficiency and speed simultaneously — limited only by Joule heating, which causes thermal band broadening and boiling at high ionic strength.

**On-capillary UV detection** is the most common CE detection mode: the polyimide coating is burned off a 2-mm window near the cathodic end, and UV light is focused through the fused-silica capillary. The effective path length is equal to the capillary inner diameter (50–75 µm), far shorter than a 1-cm HPLC cell. This short path length reduces sensitivity by about two orders of magnitude compared to HPLC-UV. Extended path-length cells (bubble cell: locally widened capillary, 3-fold path increase; Z-cell: Z-shaped path, 3-mm effective path) partially compensate. **Laser-induced fluorescence** (LIF) detection with 488-nm Ar-ion or 532-nm Nd:YAG laser excitation, and derivatisation with fluorescein isothiocyanate (FITC) or fluorescamine, achieves attomolar detection limits and is the method used in DNA sequencing.

## 12.4 Micellar Electrokinetic Chromatography

CZE separates ions by charge-to-size ratio. Neutral compounds all migrate at the same velocity (the EOF velocity) and are not separated. **Micellar electrokinetic chromatography** (MEKC), introduced by Terabe et al. in 1984, introduces **sodium dodecyl sulphate** (SDS, an anionic surfactant above its critical micelle concentration of ~8 mM in water) as a pseudo-stationary phase. SDS micelles are spherical aggregates (~60–80 molecules, diameter ~4 nm) with a hydrophobic interior and negatively charged exterior. Under the applied electric field, SDS micelles migrate electrophoretically towards the anode (because they are anionic), but the EOF sweeps them towards the cathode. Since \( \mu_{eo} > |\mu_{ep}(\text{SDS})| \) at typical operating conditions, the net migration of micelles is towards the cathode, but more slowly than the EOF.

Analytes partition between the aqueous buffer and the micellar pseudo-stationary phase. A hydrophilic analyte spends most of its time in the aqueous phase and migrates close to \( t_0 \) (the migration time of an unretained compound like methanol). A hydrophobic analyte spends most of its time inside the micelle and migrates close to \( t_{mc} \) (the migration time of a totally retained compound like Sudan III). Analytes with intermediate hydrophobicity separate between \( t_0 \) and \( t_{mc} \) — this is the **window of separation** or migration window. The capacity factor in MEKC is defined analogously to chromatography:

\[
k' = \frac{t_r - t_0}{t_{mc} - t_r}
\]

and the resolution equation has the same form as in chromatography, with the additional selectivity factor accounting for the \( t_0/t_{mc} \) window. MEKC is applicable to neutrals (unlike CZE), charged compounds, and complex mixtures. It is particularly useful for the separation of pharmaceutical enantiomers (using chiral surfactants or chiral additives), polyaromatic hydrocarbons (PAHs), and vitamins.

## 12.5 Capillary Electrochromatography and Two-Dimensional Separations

**Capillary electrochromatography** (CEC) packs a CE capillary with stationary phase particles (e.g., C18, 3 µm) and uses EOF to drive the mobile phase through the packed bed — no pump is needed. CEC combines the stationary phase selectivity of HPLC with the plug-flow profile of CE, potentially achieving higher efficiency than either technique alone. In practice, CEC is difficult because packing uniformity is critical, bubble formation at the frits is problematic, and the technique has not been widely adopted commercially despite its theoretical promise.

**Two-dimensional separations** exploit the fact that the peak capacity of a single separation (\( n_c \approx 1 + \sqrt{N}/4 \)) is fundamentally limited. In a **comprehensive two-dimensional** separation (LC×LC, GC×GC), the entire effluent from the first dimension is sampled and injected into the second dimension repeatedly. If the two dimensions have orthogonal selectivity (e.g., normal phase × reversed phase, or non-polar GC × polar GC), the total peak capacity is the product:

\[
n_c(\text{2D}) = n_{c1} \times n_{c2}
\]

For \( n_{c1} = 50 \) and \( n_{c2} = 200 \), the two-dimensional peak capacity is 10,000 — far beyond what any one-dimensional method can achieve. **Comprehensive two-dimensional GC** (GC×GC) with a cryogenic modulator and time-of-flight MS detection is now the standard for complex petrochemical and food flavour analysis, resolving thousands of compounds that would be hopelessly co-eluted in one-dimensional GC.
