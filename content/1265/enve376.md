---
title: "ENVE 376: Biological Processes"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Rittmann, B. E. and McCarty, P. L., *Environmental Biotechnology: Principles and Applications*; Metcalf & Eddy (Tchobanoglous, G., Stensel, H. D., Tsuchihashi, R., and Burton, F.), *Wastewater Engineering: Treatment and Resource Recovery*.

**Supplementary texts** — Henze, M., van Loosdrecht, M. C. M., Ekama, G. A., and Brdjanovic, D. (eds.), *Biological Wastewater Treatment*; Grady, C. P. L., Daigger, G. T., Love, N. G., and Filipe, C. D. M., *Biological Wastewater Treatment*; Madigan, M. T. et al., *Brock Biology of Microorganisms*.

**Online resources** — IWA *Activated Sludge Model Reports* 1–3 (open) and *Anaerobic Digestion Model No. 1* public summary; US EPA *Design Manual: Onsite Wastewater Treatment and Disposal Systems*; Water Environment Federation *MOP 8 Wastewater Treatment Plant Design* public summaries; open-access journal *Water Research* and *Environmental Science & Technology*.

---

# Chapter 1: Microbial Kinetics for Engineered Systems

Biological treatment harnesses microbial metabolism to transform contaminants. Process design rests on kinetic expressions that link growth, substrate utilization, and stoichiometry.

## 1.1 Monod Kinetics

The specific growth rate depends on substrate concentration

\[
\mu = \mu_{\max}\,\frac{S}{K_S + S}
\]

with \(\mu_{\max}\) the maximum specific growth rate and \(K_S\) the half-saturation constant. Substrate utilization rate follows from \(r_S = -\mu X/Y\) where \(X\) is biomass concentration and \(Y\) is the true yield. Decay reduces active biomass at specific rate \(b\), typically \(0.05\text{–}0.15\ \text{d}^{-1}\) at 20 °C.

## 1.2 Mean Cell Residence Time

In a CSTR at steady state, the mean cell residence time (solids retention time, SRT) equals \(1/(\mu - b)\). SRT is the master design variable for activated sludge: too short and biomass washes out; long SRT promotes slow-growing organisms (nitrifiers) and stable performance.

<div class="definition">
<strong>SRT (sludge age).</strong> Mass of biomass in the system divided by mass of biomass leaving per unit time. Sets which organisms can establish, biomass concentration, and sludge production per unit substrate removed.
</div>

## 1.3 Stoichiometry

Stoichiometric coefficients tie substrate removal, oxygen demand, nutrient uptake, and biomass production. For aerobic heterotrophs on BOD,

\[
\mathrm{C_5H_7NO_2\ (biomass)} + 5\mathrm{O_2} \rightarrow 5\mathrm{CO_2} + 2\mathrm{H_2O} + \mathrm{NH_3}
\]

with true yield \(Y \approx 0.4\ \text{kgVSS/kgBOD}\) and oxygen demand per unit substrate determined by the electron balance. For autotrophic nitrifiers, yields are much lower (\(Y \approx 0.1\ \text{kgVSS/kgN}\)) and oxygen demands correspondingly higher.

# Chapter 2: Continuous Flow Reactors With and Without Recycle

## 2.1 Chemostat Without Recycle

For a simple CSTR with hydraulic retention time \(\tau = V/Q\),

\[
S = \frac{K_S(1 + b\tau)}{\tau(\mu_{\max} - b) - 1}
\]

and biomass \(X = Y(S_0 - S)/(1 + b\tau)\). Washout occurs when \(\tau < 1/(\mu_{\max} - b)\).

## 2.2 CSTR With Recycle

Activated sludge processes recycle biomass from a clarifier to maintain high \(X\) at short \(\tau\). The mean cell residence time decouples from hydraulic retention time:

\[
\theta_c = \frac{V\,X}{Q_w X_w + (Q - Q_w) X_e}
\]

Selecting \(\theta_c\) sets required reactor volume, biomass concentration, and excess sludge production. Typical activated sludge operates \(\theta_c = 5\text{–}15\ \text{d}\); nitrification requires \(\theta_c\) long enough to retain nitrifiers at the operating temperature (Arrhenius correction with \(\theta \approx 1.07\)).

## 2.3 Plug Flow and Tanks in Series

Plug-flow reactors achieve lower effluent concentrations than CSTRs at the same total volume for substrate-limited kinetics; they also concentrate the initial substrate spike at the inlet, which can overload aeration or cause foaming if not addressed. Step-feed and tapered aeration distribute loading.

# Chapter 3: Aeration System Design

## 3.1 Oxygen Transfer

Oxygen transfer from gas to liquid follows

\[
\frac{dC}{dt} = K_L a\,(C^* - C)
\]

with \(K_L a\) the overall mass transfer coefficient and \(C^*\) the saturation concentration. Actual oxygen transfer rate (AOTR) differs from standard (SOTR) through temperature, salinity (α, β), and dissolved oxygen setpoint:

\[
\mathrm{AOTR} = \mathrm{SOTR}\cdot\alpha\,F\cdot 1.024^{T-20}\cdot\frac{\beta C^*_{20} - C_L}{C^*_{20}}
\]

Fine-bubble diffusers (standard oxygen transfer efficiency 15–30%) outperform coarse bubbles, reducing energy but susceptible to fouling.

## 3.2 Blower and Diffuser Selection

Airflow requirement follows from oxygen demand divided by AOTR per unit air. Blower discharge pressure balances static head, diffuser loss, and piping losses. Turndown capability, control strategy (DO-based, ammonia-based), and energy efficiency are central to modern aeration design.

## 3.3 Alternatives to Mechanical Aeration

Submerged aeration with turbines, brush aerators in oxidation ditches, and pure-oxygen systems serve specialized applications. Membrane aerated biofilm reactors (MABR) transfer oxygen directly through a gas-permeable membrane to a biofilm, achieving very high transfer efficiency.

# Chapter 4: Activated Sludge and Nutrient Removal

## 4.1 Conventional Process

Conventional activated sludge removes carbonaceous BOD with SRT of 5–8 days, MLSS 2,000–4,000 mg/L, and HRT of 4–8 hours. Secondary clarifiers settle the biomass for recycle; state-point analysis relates solids loading rate, underflow rate, and sludge blanket level.

## 4.2 Biological Nitrogen Removal

Nitrification oxidizes \(\mathrm{NH_4^+}\) to \(\mathrm{NO_3^-}\) and denitrification reduces \(\mathrm{NO_3^-}\) to \(\mathrm{N_2}\) using organic carbon as electron donor. Configurations include **Modified Ludzack–Ettinger** (pre-denitrification), **Bardenpho** (4-stage, with post-denitrification polishing), and **sequencing batch reactors** that cycle aerobic and anoxic phases in time rather than space.

Partial nitritation/anammox routes save energy and carbon: \(\mathrm{NH_4^+}\) is partially oxidized to \(\mathrm{NO_2^-}\), and anammox bacteria combine the two to produce \(\mathrm{N_2}\) with no organic carbon.

## 4.3 Biological Phosphorus Removal

Enhanced biological phosphorus removal (EBPR) relies on polyphosphate-accumulating organisms (PAOs) that take up P in excess during aerobic periods after anaerobic release of P and uptake of volatile fatty acids. Anaerobic-anoxic-aerobic (A²O) and UCT configurations integrate EBPR with nitrogen removal.

<div class="example">
<strong>Aeration energy.</strong> A 50,000 m<sup>3</sup>/d plant treating BOD<sub>5</sub> 200 mg/L and TKN 40 mg/L requires roughly 11,000 kg/d O<sub>2</sub> for carbon oxidation plus about 8,000 kg/d for nitrification. At 2 kgO<sub>2</sub>/kWh (AOTR basis), aeration alone consumes about 9,500 kWh/d — typically the largest single energy user in a wastewater plant.
</div>

# Chapter 5: Anaerobic Digestion and Solid Waste Management

## 5.1 Anaerobic Stoichiometry and Kinetics

Anaerobic digestion produces biogas (\(\mathrm{CH_4}\) and \(\mathrm{CO_2}\)) and reduces organic solids. The Buswell equation estimates methane yield from empirical formula:

\[
\mathrm{C_aH_bO_cN_d} + \left(a - \tfrac{b}{4} - \tfrac{c}{2} + \tfrac{3d}{4}\right)\mathrm{H_2O} \rightarrow \left(\tfrac{a}{2} + \tfrac{b}{8} - \tfrac{c}{4} - \tfrac{3d}{8}\right)\mathrm{CH_4} + \left(\tfrac{a}{2} - \tfrac{b}{8} + \tfrac{c}{4} + \tfrac{3d}{8}\right)\mathrm{CO_2} + d\,\mathrm{NH_3}
\]

Typical methane yields: 0.35 m\(^3\)/kg COD destroyed. SRT requirements are long (15–30 d for mesophilic digestion at 35 °C, shorter for thermophilic at 55 °C) reflecting slow methanogen kinetics. The IWA **ADM1** model captures hydrolysis, acidogenesis, acetogenesis, and methanogenesis with inhibition terms for pH, ammonia, and hydrogen.

## 5.2 High-Rate Anaerobic Reactors

Upflow anaerobic sludge blanket (UASB), expanded granular sludge bed (EGSB), and anaerobic membrane bioreactors achieve high loading rates through biomass retention. They suit soluble, warm, concentrated wastewaters — breweries, food processing, municipal wastewater in warm climates.

## 5.3 Solid Waste Applications

Organic solid waste — food waste, agricultural residues, sewage sludge — is stabilized by aerobic composting or anaerobic digestion. Composting process design uses C:N, moisture, and aeration control; pile temperature self-heats to pasteurization levels. Anaerobic digestion additionally produces biogas used for heat and power.

# Chapter 6: Natural and Subsurface Treatment Systems

## 6.1 Constructed Wetlands

Free-water-surface and subsurface-flow constructed wetlands remove BOD, solids, nutrients, and pathogens through combined physical, chemical, and biological processes. Design uses the \(P\)-\(k\)-\(C^*\) model

\[
C_e = C^* + (C_i - C^*)\exp\!\left(-\frac{k\,t}{h}\right)
\]

with \(C^*\) an irreducible background concentration. Wetlands provide habitat and low-energy treatment but require substantial land area.

## 6.2 Land Treatment and Soil Aquifer Treatment

Slow-rate land treatment applies wastewater to crops; rapid infiltration and soil aquifer treatment leverage soils as biological filters. Design balances hydraulic loading, nutrient loading, and groundwater protection.

## 6.3 Groundwater Bioremediation

In situ bioremediation of petroleum hydrocarbons uses biosparging and biostimulation with oxygen and nutrients. Chlorinated solvent bioremediation uses anaerobic reductive dechlorination with electron donors (lactate, emulsified vegetable oil) and often bioaugmentation with \(\textit{Dehalococcoides}\) strains that achieve complete dechlorination to ethene.

## 6.4 Soil Bioventing and Composting

Bioventing delivers air to vadose-zone contamination, stimulating aerobic biodegradation of hydrocarbons. Above-ground biopiles and composting treat excavated soils with amendment and aeration. Performance is verified by respirometry and soil-gas oxygen/CO\(_2\) monitoring.

<div class="remark">
<strong>From organism to facility.</strong> The discipline of biological process engineering is to connect the molecular-scale behaviour of microbial populations to the cubic-metre-per-second behaviour of treatment facilities, and to make that connection transparent enough that operators can maintain performance as loads, temperatures, and regulations change over decades.
</div>
