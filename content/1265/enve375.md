---
title: "ENVE 375: Physico-Chemical Processes"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — MWH (Crittenden, J. C., Trussell, R. R., Hand, D. W., Howe, K. J., and Tchobanoglous, G.), *Water Treatment: Principles and Design*; Davis, M. L., *Water and Wastewater Engineering: Design Principles and Practice*.

**Supplementary texts** — Benjamin, M. M., *Water Chemistry*; Stumm, W. and Morgan, J. J., *Aquatic Chemistry*; Weber, W. J. and DiGiano, F. A., *Process Dynamics in Environmental Systems*.

**Online resources** — US EPA *Drinking Water Treatability Database*; AWWA *Water Quality and Treatment Handbook* public summaries; World Health Organization *Guidelines for Drinking-Water Quality*; Health Canada *Guidelines for Canadian Drinking Water Quality*; IWA Publishing open-access journal articles.

---

# Chapter 1: Framework and Mass Balances

Physico-chemical treatment processes remove or transform constituents without relying primarily on biological activity. The fundamental design tool is the mass balance on a chosen control volume, closed by rate expressions appropriate to the process.

## 1.1 Reactor Types

Three idealized reactors anchor design: batch, continuous-flow stirred tank (CSTR), and plug-flow reactor (PFR). For a first-order reaction with rate constant \(k\) and residence time \(\tau = V/Q\),

\[
\text{CSTR: } \frac{C_{\text{out}}}{C_{\text{in}}} = \frac{1}{1 + k\tau},\qquad \text{PFR: } \frac{C_{\text{out}}}{C_{\text{in}}} = e^{-k\tau}
\]

A PFR achieves greater conversion than a CSTR of the same volume for orders greater than zero; \(N\) CSTRs in series approach PFR performance as \(N \to \infty\).

## 1.2 Residence Time Distribution

Real reactors are neither perfectly mixed nor perfectly plug flow. Tracer tests yield the residence time distribution \(E(t)\), with mean \(\bar t\) and variance \(\sigma^2\). The tanks-in-series model fits an integer number \(n\) of equivalent CSTRs from \(n = \bar t^2/\sigma^2\). Short-circuiting and dead volumes reduce effective contact time and degrade disinfection.

<div class="definition">
<strong>CT concept.</strong> For disinfection, the product of disinfectant residual concentration <em>C</em> and contact time <em>T</em> at the <em>T<sub>10</sub></em> (time at which 90% of flow has not yet exited) quantifies required exposure for a target log-inactivation of target organisms.
</div>

# Chapter 2: Coagulation and Flocculation

## 2.1 Particle Stability

Natural waters contain colloidal particles (clays, natural organic matter, microbes) held in suspension by electrostatic repulsion and hydration forces. DLVO theory sums van der Waals attraction and electrostatic repulsion; the zeta potential measures the diffuse-layer charge. Destabilization requires reducing the energy barrier through charge neutralization or enmeshment.

## 2.2 Coagulant Chemistry

Metal coagulants — alum (\(\mathrm{Al_2(SO_4)_3 \cdot 14H_2O}\)), ferric chloride (\(\mathrm{FeCl_3}\)), polyaluminum chloride — hydrolyze to form polynuclear species and amorphous hydroxide floc. The dose and pH combination determines the dominant mechanism: charge neutralization at low dose and acidic pH, sweep coagulation at high dose and near-neutral pH. Cationic polymers provide bridging at low dose.

## 2.3 Mixing

Rapid mixing disperses coagulant (\(G > 500\ \text{s}^{-1}\)); flocculation slowly agglomerates floc (\(G = 20\text{–}70\ \text{s}^{-1}\)). The Camp–Stein velocity gradient is

\[
G = \sqrt{\frac{P}{\mu V}}
\]

Tapered-flocculation basins decrease \(G\) through the train to grow floc without shearing it apart. The product \(Gt\) (often \(10^4\text{–}10^5\)) is a useful heuristic.

# Chapter 3: Gravity Separation and Filtration

## 3.1 Sedimentation

Discrete particles settle at Stokes velocity

\[
v_s = \frac{g(\rho_p - \rho_w)d^2}{18\mu}
\]

for low Reynolds number. A rectangular sedimentation basin removes particles with \(v_s \ge v_0 = Q/A_s\) (the overflow rate) regardless of depth, in the classical Camp analysis. Real basins show short-circuiting and density currents; effluent troughs and inlet baffles improve performance. Plate and tube settlers reduce footprint by shortening settling distance.

## 3.2 Flocculent and Hindered Settling

Flocculent particles aggregate during settling; column tests yield isoconcentration lines that guide design. Hindered (zone) settling occurs at high concentrations; the batch thickening flux \(G_b(C) = C\,v_s(C)\) and the underflow flux \(G_u(C) = C\,u\) combine to determine thickener area.

## 3.3 Granular Filtration

Deep-bed filters (sand, anthracite, GAC) remove particles by interception, sedimentation, and diffusion within the media. The Iwasaki removal equation

\[
\frac{\partial C}{\partial L} = -\lambda C
\]

with a filter coefficient \(\lambda\) that evolves with deposit captures the transient behaviour. Head loss grows over the filter run until backwashing is required; run length balances production and backwash cost. Membrane filtration (MF, UF, NF, RO) provides progressively finer separation; fouling management and cleaning chemistry are central to design.

# Chapter 4: Adsorption, Air Stripping, and Membranes

## 4.1 Adsorption on Activated Carbon

Granular activated carbon (GAC) removes organic micropollutants by adsorption. Equilibrium is described by the Freundlich isotherm

\[
q_e = K_F C_e^{1/n}
\]

and the Langmuir isotherm \(q_e = q_m K_L C_e/(1 + K_L C_e)\). Dynamic breakthrough is modelled by the Bohart–Adams equation and refined with pore-surface diffusion models (PSDM). Thermal reactivation regenerates spent GAC.

## 4.2 Air Stripping

For volatile organics, air stripping transfers contaminant from water to air. In a countercurrent packed column, the design equation combines the mass-transfer coefficient \(K_L a\), Henry's law \(H\), and the air-to-water ratio \(R = Q_a/Q_w\) yielding

\[
\frac{H_T}{Z} = \frac{1}{(R H - 1)}\ln\!\left[\frac{C_{\text{in}}}{C_{\text{out}}}\frac{RH - 1}{RH} + \frac{1}{RH}\right]
\]

(Onda correlations estimate \(K_L a\) from packing geometry and flow.)

## 4.3 Membrane Processes

Reverse osmosis rejects dissolved ions through dense polyamide membranes driven by pressure. Water flux

\[
J_w = A(\Delta P - \sigma\,\Delta\pi)
\]

and solute flux \(J_s = B\,\Delta C\) from solution-diffusion theory, with recovery, concentration polarization, and fouling limiting practical operation. Nanofiltration selectively rejects multivalent ions and natural organic matter; ultrafiltration and microfiltration reject particles and macromolecules.

<div class="example">
<strong>GAC contactor sizing.</strong> A contactor with empty bed contact time (EBCT) of 15 min and hydraulic loading 10 m/h produces a bed depth of 2.5 m. Freundlich parameters measured in bench tests give a usage rate in kg carbon per m<sup>3</sup> treated; bed life and regeneration schedule follow from breakthrough modelling.
</div>

# Chapter 5: Chemical Oxidation, Reduction, and Disinfection

## 5.1 Chlorination

Chlorine hydrolyses in water: \(\mathrm{Cl_2 + H_2O \rightleftharpoons HOCl + H^+ + Cl^-}\), with \(\mathrm{HOCl}\) (the strong disinfectant) and \(\mathrm{OCl^-}\) in pH-dependent equilibrium (\(\mathrm{p}K_a \approx 7.5\)). Chick–Watson kinetics

\[
\ln(N/N_0) = -k\,C^n t
\]

links survival to CT. Monochloramine is a weaker but longer-lasting residual commonly used in distribution to limit disinfection by-products.

## 5.2 Ozonation and Advanced Oxidation

Ozone, produced on site, reacts directly and via hydroxyl radicals. Advanced oxidation processes (AOPs) — O\(_3\)/H\(_2\)O\(_2\), UV/H\(_2\)O\(_2\), Fenton, photocatalysis — generate OH radicals that oxidize recalcitrant organics. The Rct concept (ratio of OH exposure to ozone exposure) unifies design across AOPs.

## 5.3 UV Disinfection

UV at 254 nm inactivates microbes by dimerizing pyrimidine bases in DNA. The dose is \(D = I\,t\); log inactivation follows dose–response curves that depend on organism. Key design issues are lamp placement, reactor hydraulics, and UV transmittance of the water.

## 5.4 Reduction

Chemical reduction — using sulfite, ferrous iron, or zero-valent iron — converts oxidized species (chromate, perchlorate, chlorinated solvents) to less mobile or less toxic forms. Permeable reactive barriers employ ZVI for in situ groundwater treatment.

# Chapter 6: Integrated Design for Drinking Water, Wastewater, and Remediation

## 6.1 Drinking-Water Treatment

Surface water plants typically train coagulation–flocculation, sedimentation, filtration, disinfection, and stabilization. Enhanced coagulation and GAC adsorption reduce precursors of disinfection by-products. Source-to-tap thinking selects processes for the specific source, not by textbook default.

## 6.2 Wastewater Tertiary Treatment

Physico-chemical steps polish biologically treated wastewater: coagulation/sedimentation or membrane bioreactors for solids, sand or membrane filtration, disinfection, and micropollutant removal by ozone or GAC. Phosphorus precipitation with alum or iron salts achieves low-level P discharge targets.

## 6.3 Stormwater Quality

Stormwater treatment trains detention, sedimentation, filtration (often through engineered media), and infiltration. Target constituents include suspended solids, metals, hydrocarbons, nutrients, and pathogens.

## 6.4 Groundwater and Soils

Remediation combines pump-and-treat (with air stripping or GAC), in situ chemical oxidation (permanganate, persulfate, ozone), in situ chemical reduction (ZVI, dithionite), and thermal methods. Physico-chemical processes interact with biology and transport, so design proceeds from site characterization through bench and pilot testing to full-scale operation.

<div class="remark">
<strong>Unity of the processes.</strong> Despite diverse chemistry, the physico-chemical processes share a common backbone: a mass balance, an equilibrium or rate expression, and a reactor configuration. Fluency with that backbone lets engineers adapt known processes to new contaminants and invent new combinations for emerging problems.
</div>
