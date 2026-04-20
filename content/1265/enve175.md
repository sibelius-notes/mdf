---
title: "ENVE 175: Introduction to Environmental Chemistry"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Benjamin, M. M., *Water Chemistry*; vanLoon, G. W. and Duffy, S. J., *Environmental Chemistry: A Global Perspective*.

**Supplementary texts** — Stumm, W. and Morgan, J. J., *Aquatic Chemistry: Chemical Equilibria and Rates in Natural Waters*; Schwarzenbach, R. P., Gschwend, P. M., and Imboden, D. M., *Environmental Organic Chemistry*; Finlayson-Pitts, B. J. and Pitts, J. N., *Chemistry of the Upper and Lower Atmosphere*.

**Online resources** — MIT OpenCourseWare 1.080J *Environmental Chemistry*; US EPA public water and air chemistry technical documents; NOAA atmospheric chemistry overview pages; IUPAC open reports on equilibrium constants; Stanford *Earth's Atmosphere* open lecture materials.

---

# Chapter 1: Framework of Environmental Chemistry

Environmental chemistry describes the sources, transport, transformations, and fates of chemical species in air, water, and soil. It draws on thermodynamics, kinetics, and physical chemistry, and it underpins the design of environmental engineering systems: water and wastewater treatment, air pollution control, waste management, and remediation.

## 1.1 Environmental Compartments

The **atmosphere**, **hydrosphere**, **lithosphere**, and **biosphere** each host distinctive chemistry. Cross-compartmental transfers — gas dissolution, particle deposition, volatilization, uptake by organisms — couple the compartments. An engineer usually asks: where does the substance go, how fast, in what form, and at what concentration?

## 1.2 Units and Concentrations

Aqueous concentrations are expressed in mol/L, mg/L, meq/L, or as element mass (e.g., mg N/L). Gas-phase concentrations use mole fraction, partial pressure, or mass concentration. Conversions between units — especially between \(\mu\text{g/m}^3\) and ppm for air — are essential. The ideal gas law \(pV = nRT\) underlies these conversions.

<div class="definition">
<strong>Environmental fate.</strong> The pathway and state of a chemical after release — encompassing advection, diffusion, partitioning between phases, transformation (abiotic or biotic), and accumulation in biota.
</div>

# Chapter 2: Stoichiometry and Balances

## 2.1 Mass Balances

A control-volume mass balance is the central quantitative tool:

\[
\frac{dM}{dt} = \sum \dot M_{\text{in}} - \sum \dot M_{\text{out}} + R
\]

where \(R\) is the net rate of reaction within the volume. Steady-state (\(dM/dt = 0\)) and well-mixed assumptions simplify many problems; transient, spatially resolved balances lead to reactor design and fate and transport modelling.

## 2.2 Stoichiometric Calculations

Chemical reactions constrain relative amounts of species. Combustion of methane \(\mathrm{CH_4 + 2O_2 \rightarrow CO_2 + 2H_2O}\) ties fuel consumption to oxygen demand and \(\mathrm{CO_2}\) emission. Biological reactions — aerobic oxidation of glucose, anaerobic digestion, nitrification — carry analogous stoichiometric relations that enter process design.

## 2.3 Air–Water Partitioning

Henry's law relates dissolved concentration to partial pressure:

\[
p_i = H_i C_i
\]

with \(H_i\) the Henry's law constant in units consistent with the chosen concentration. Volatile organic compounds with high \(H_i\) escape readily to air; ionizable species often exhibit effective Henry constants that depend on pH.

# Chapter 3: Atmospheric Chemistry

## 3.1 Atmospheric Structure

The atmosphere is layered: troposphere (0–15 km), stratosphere (15–50 km), mesosphere, thermosphere. Temperature and pressure profiles govern vertical mixing. The planetary boundary layer (the lowest 1–2 km) contains most pollution emissions and undergoes daily stability cycles.

## 3.2 Tropospheric Chemistry

The hydroxyl radical \(\mathrm{OH}^{\bullet}\) is the atmosphere's primary cleansing agent. It oxidizes methane, CO, VOCs, and \(\mathrm{SO_2}\). Ozone forms via the NOx photostationary cycle:

\[
\mathrm{NO_2 + h\nu \rightarrow NO + O},\qquad \mathrm{O + O_2 + M \rightarrow O_3 + M},\qquad \mathrm{O_3 + NO \rightarrow NO_2 + O_2}
\]

Peroxy radicals from VOC oxidation convert NO to \(\mathrm{NO_2}\) without consuming \(\mathrm{O_3}\), producing **tropospheric ozone** pollution episodes.

## 3.3 Stratospheric Ozone

Chapman's cycle explains the natural ozone layer. Chlorine from chlorofluorocarbons catalyzes destruction through

\[
\mathrm{Cl + O_3 \rightarrow ClO + O_2},\qquad \mathrm{ClO + O \rightarrow Cl + O_2}
\]

Polar stratospheric clouds amplify destruction each spring over the poles. The Montreal Protocol's phase-out of CFCs has halted ozone depletion, and recovery is projected by mid-century.

## 3.4 Climate-Active Species

\(\mathrm{CO_2}\), \(\mathrm{CH_4}\), \(\mathrm{N_2O}\), water vapour, and halocarbons absorb infrared radiation, warming the surface. Global warming potentials normalize the radiative effect of one kilogram of gas to that of \(\mathrm{CO_2}\) over a specified time horizon; \(\mathrm{CH_4}\) has a 100-year GWP of roughly 28, \(\mathrm{N_2O}\) about 265.

# Chapter 4: Aquatic Chemistry

## 4.1 Water as a Solvent

Water's polarity, high dielectric constant, and hydrogen bonding make it an exceptional solvent for ionic and polar species. Dissolved species exist as free ions, hydrated complexes, and ion pairs.

## 4.2 Acid–Base Equilibria

The carbonate system dominates natural water chemistry:

\[
\mathrm{CO_2(aq) + H_2O \rightleftharpoons H_2CO_3^{*} \rightleftharpoons HCO_3^- + H^+ \rightleftharpoons CO_3^{2-} + 2H^+}
\]

with \(\mathrm{p}K_{a1} \approx 6.35\) and \(\mathrm{p}K_{a2} \approx 10.33\) at 25 °C. Alkalinity — the capacity to neutralize acid — is

\[
\mathrm{[Alk] = [HCO_3^-] + 2[CO_3^{2-}] + [OH^-] - [H^+]}
\]

pH follows from mass balance on carbonate species, charge balance, and the gas-phase or total carbonate constraint.

## 4.3 Solubility and Mineral Equilibria

A mineral's solubility is governed by its solubility product. For \(\mathrm{CaCO_3}\),

\[
K_{sp} = [\mathrm{Ca^{2+}}][\mathrm{CO_3^{2-}}] \approx 10^{-8.48}
\]

Water stability diagrams (log activity vs pH) map regions where solids precipitate or dissolve. The Langelier Saturation Index measures scaling or corrosive tendencies in distribution pipes.

## 4.4 Complexation

Ligands — \(\mathrm{OH}^-, \mathrm{CO_3^{2-}}\), natural organic matter, EDTA — form complexes with metal ions, altering solubility, bioavailability, and toxicity. Total metal concentration and free ion activity can differ by orders of magnitude.

<div class="example">
<strong>pH of rainwater in equilibrium with atmospheric CO<sub>2</sub>.</strong> With atmospheric <em>pCO<sub>2</sub> = 420 μatm</em> and <em>K<sub>H</sub> = 10<sup>-1.47</sup></em>, dissolved <em>[H<sub>2</sub>CO<sub>3</sub>*] &asymp; 10<sup>-4.85</sup></em> mol/L. Charge balance in pure water gives <em>[H<sup>+</sup>] &asymp; &radic;(K<sub>a1</sub>[H<sub>2</sub>CO<sub>3</sub>*])</em>, yielding pH &asymp; 5.6 — the reference pH for "natural" unpolluted rain.
</div>

# Chapter 5: Reaction Kinetics

## 5.1 Rate Laws

For a reaction \(aA + bB \rightarrow \mathrm{products}\), an empirical rate law

\[
r = k\,[A]^m [B]^n
\]

has orders \(m, n\) determined experimentally. First-order decay \([A] = [A]_0 e^{-kt}\) describes chlorine decay, radioactive decay, and many photolytic reactions. The half-life is \(t_{1/2} = \ln 2 / k\).

## 5.2 Temperature Dependence

The **Arrhenius equation** \(k = A e^{-E_a/RT}\) links rate constants to temperature. A rule of thumb: biological rates roughly double for each 10 °C rise (\(Q_{10} \approx 2\)).

## 5.3 Reactor Models

A continuous-flow stirred tank (CSTR) at steady state with first-order reaction gives

\[
\frac{C_{\text{out}}}{C_{\text{in}}} = \frac{1}{1 + k\tau}
\]

with residence time \(\tau = V/Q\). A plug-flow reactor gives \(C_{\text{out}}/C_{\text{in}} = e^{-k\tau}\). Cascades of CSTRs approach plug flow as the number of tanks increases — a fact exploited in both modelling and design.

# Chapter 6: Oxidation–Reduction Chemistry

## 6.1 Electron Transfer

Redox reactions involve electron transfer. The half-reactions are characterized by standard electrode potentials; for example,

\[
\mathrm{O_2 + 4H^+ + 4e^- \rightarrow 2H_2O},\quad E^\circ = 1.23\ \text{V}
\]

The Nernst equation corrects for non-standard conditions:

\[
E = E^\circ - \frac{RT}{nF}\ln Q
\]

The operating redox state in natural waters is summarized by pE (or Eh).

## 6.2 pE–pH Diagrams

Pourbaix diagrams map the dominant species of an element across pE and pH. Iron's diagram explains why groundwaters deliver soluble Fe(II) and why aerated treatment waters precipitate Fe(III) as rust-coloured hydroxides. Manganese, sulfur, and nitrogen have analogous diagrams central to treatment engineering.

## 6.3 Environmental Significance

Redox conditions govern whether arsenic is mobile (reducing) or sequestered, whether nitrogen is available as nitrate or ammonium, and whether organic pollutants are oxidized or reduced in subsurface plumes. Treatment processes deliberately manipulate redox: chlorination, ozonation, and advanced oxidation processes generate strong oxidants; biological denitrification reduces nitrate to dinitrogen; permeable reactive barriers use zero-valent iron to dechlorinate solvents.

<div class="remark">
<strong>Chemistry as a design tool.</strong> Environmental chemistry is not a parallel discipline to environmental engineering; it is the language in which treatment processes, fate modelling, and regulation speak. Fluency with equilibria, kinetics, and redox is inseparable from competent practice.
</div>

The first course in environmental chemistry arms future engineers with mass balances, equilibrium calculations, kinetic reasoning, and a structured way of thinking about where chemicals go and what they do when they get there. These are the habits on which every downstream course in environmental engineering builds.
