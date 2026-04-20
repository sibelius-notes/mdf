---
title: "CIVE 375: Environmental Engineering Principles"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Davis, M.L., *Introduction to Environmental Engineering*, 6th ed., McGraw-Hill, 2021; Mihelcic, J.R. and Zimmerman, J.B., *Environmental Engineering: Fundamentals, Sustainability, Design*, 2nd ed., Wiley, 2014.

**Supplementary texts** — Metcalf & Eddy / AECOM, *Wastewater Engineering: Treatment and Resource Recovery*, 5th ed., McGraw-Hill, 2014; Crittenden, J.C. et al., *MWH's Water Treatment: Principles and Design*, 3rd ed., Wiley, 2012.

**Online resources** — MIT OCW 1.85 "Water and Wastewater Treatment"; US EPA drinking water and wastewater guidance; Health Canada Guidelines for Canadian Drinking Water Quality; Environment and Climate Change Canada regulations; WHO public water safety publications.

---

# Chapter 1: Water Quality Fundamentals

## 1.1 Constituents and Parameters

Physical: temperature, turbidity, color, taste, odor, TDS, TSS.
Chemical inorganic: pH, alkalinity, hardness, DO, nitrogen forms, phosphorus, chloride, sulfate, metals, fluoride.
Chemical organic: TOC, BOD, COD, specific compounds (pesticides, solvents, pharmaceuticals).
Microbiological: total coliforms, fecal coliforms (E. coli), protozoa (Giardia, Cryptosporidium), viruses, indicator organisms.
Radiological: gross alpha, gross beta, radium, uranium, radon.

Drinking water standards (Health Canada MAC, WHO GV) set thresholds. Surface water body quality standards (freshwater, marine) protect aquatic life and recreation.

## 1.2 Equilibrium Chemistry

Carbonate system: \( CO_2 \rightleftharpoons H_2CO_3 \rightleftharpoons HCO_3^- \rightleftharpoons CO_3^{2-} \). pH, alkalinity, and total inorganic carbon form a closed equilibrium. Relevance: lime softening, pH control, corrosion.

Solubility products, complexation, oxidation-reduction. Metals: speciation depends on pH and redox; controls mobility and toxicity.

## 1.3 Reaction Kinetics

First-order decay \( dC/dt = -kC \) for microbial die-off, pesticide degradation, radioactive decay. Second-order for reactions between two reactants. Temperature dependence via Arrhenius. Half-life \( t_{1/2} = 0.693/k \) for first-order.

## 1.4 Fate and Transport

Advection, dispersion, diffusion, sorption (linear isotherm \( K_d \)), biodegradation, volatilization. Retardation \( R = 1 + \rho_b K_d/\theta \). Governing transport equations used for groundwater, surface water, and treatment process design.

# Chapter 2: Water Treatment

## 2.1 Treatment Objectives

Remove particulates (clarity, protection of downstream steps), inactivate/remove pathogens, reduce disinfection by-products precursors (NOM), soften (if hard), correct pH/alkalinity, remove specific contaminants (iron, manganese, arsenic, fluoride, nitrate).

## 2.2 Conventional Treatment Train

Screening → coagulation → flocculation → sedimentation → filtration → disinfection → distribution. Design flow based on peak demand; redundancy for reliability.

Coagulation: alum (Al\(_2\)(SO\(_4\))\(_3\)), ferric chloride, PAC. Coagulant dose and pH optimization via jar tests. Rapid mix G × t \( \sim \) 10\(^4\), followed by flocculation G × t \( \sim \) 10\(^5\).

Sedimentation: overflow rate \( v_o = Q/A \) [m/h] controls particle capture. Typical 1-3 m/h.

Filtration: rapid sand (conventional), dual-media (anthracite + sand), multimedia. Loading rate 5-15 m/h. Backwashing restores capacity. Slow sand filters (0.1-0.4 m/h, no chemicals) for smaller systems or disinfection-free needs.

## 2.3 Disinfection

Chlorination: chlorine gas or hypochlorite produces HOCl, OCl\(^-\); Ct (concentration × time) values ensure pathogen inactivation. Chlorine dose, residual, contact time specified. Disinfection by-products (THMs, HAAs) form from NOM reaction; regulated (80 µg/L THM, 60 µg/L HAA5 in Canada/US).

Chloramination: NH\(_3\) + HOCl → NH\(_2\)Cl; longer-lived residual in distribution, fewer DBPs, but weaker on Cryptosporidium.

UV: effective against bacteria, viruses, protozoa; no chemical residual. Ct expressed as dose (mJ/cm\(^2\)); 40 mJ/cm\(^2\) for 4-log inactivation of most targets.

Ozone: strong oxidant, effective against Cryptosporidium; produces bromate if bromide present.

## 2.4 Advanced Treatment

Membrane filtration (MF, UF, NF, RO), activated carbon (GAC, PAC) for taste/odor and trace organics, ion exchange for specific ions (nitrate, arsenic). Adoption driven by source water quality and emerging contaminants (PFAS, pharmaceuticals).

# Chapter 3: Wastewater Treatment

## 3.1 Characteristics

Domestic wastewater: 200-400 mg/L BOD, 200-400 mg/L TSS, 30-80 mg/L TKN, 5-15 mg/L P. Diurnal and weekly flow variation. Industrial contributions vary with local economy; pretreatment programs limit what enters municipal sewers.

## 3.2 Primary Treatment

Screening (coarse and fine), grit removal, primary sedimentation. Removes 50-70% of TSS, 25-40% of BOD. Primary sludge goes to digestion.

## 3.3 Secondary Treatment

Activated sludge: aeration tank + secondary clarifier + return activated sludge. Design parameters: F/M ratio (0.2-0.4), MLSS (2000-4000 mg/L), hydraulic retention time (4-8 h), SRT (5-15 days). Achieves 90%+ BOD and TSS removal.

Variants: conventional plug flow, complete mix, step feed, oxidation ditch, sequencing batch reactor (SBR), membrane bioreactor (MBR). MBRs integrate biology + membrane filtration; compact, high-quality effluent, higher cost.

Trickling filters, RBCs, MBBR, IFAS as attached-growth alternatives or supplements.

## 3.4 Nutrient Removal

Nitrification (ammonia to nitrate) requires aerobic conditions, long SRT, alkalinity. Denitrification (nitrate to nitrogen gas) in anoxic zone with organic carbon source.

Biological phosphorus removal: alternating anaerobic/aerobic zones select for polyphosphate-accumulating organisms (PAOs). Chemical P removal: alum, ferric, or lime precipitation to polishing levels (< 0.5 mg/L).

Configurations: A\(^2\)/O, Bardenpho, UCT, Johannesburg.

## 3.5 Disinfection and Outfall

UV or chlorination before discharge. Dissolved oxygen, pH, temperature ensure compliance with permit. Receiving water mixing zone analysis (CORMIX, Visual Plumes) establishes whether effluent meets water quality standards at end of dilution.

# Chapter 4: Air Pollution Overview

## 4.1 Pollutants

Criteria pollutants (PM, SO\(_2\), NO\(_x\), CO, O\(_3\), Pb), HAPs, GHGs. Ambient concentration depends on emissions, atmospheric dispersion, chemical transformation.

## 4.2 Dispersion

Gaussian plume model for point sources; line sources for highways; area sources for cities. Stability classes (A-F) strongly influence ground-level concentrations. Tall stacks dilute emissions but transport pollutants regionally.

## 4.3 Control Technologies

Cyclones, electrostatic precipitators, fabric filters, scrubbers for particulates. Absorption for soluble gases, adsorption for VOCs, thermal/catalytic oxidation for VOCs and odors. SCR/SNCR for NO\(_x\), FGD for SO\(_2\). Selection by pollutant, flowrate, concentration, economic constraints.

## 4.4 Regulation and Climate

CAA (US), CEPA (Canada), EU Industrial Emissions Directive. Market mechanisms: cap and trade (acid rain, RGGI, EU ETS). Climate: GHG reporting, carbon pricing, net-zero pathways, CCS.

# Chapter 5: Solid and Hazardous Waste

## 5.1 MSW Management

Collection (curbside, dumpster, transfer station), disposal (landfill, incineration with energy recovery), and recovery (recycling, composting, anaerobic digestion). Hierarchy: prevent > reuse > recycle > recover > dispose.

## 5.2 Landfill Design

Modern sanitary landfills: engineered liners (geomembrane + clay, or dual-composite), leachate collection and treatment, gas collection and combustion/flaring, daily cover, final cap. Leachate composition evolves from acidogenic (high BOD, low pH) to methanogenic (lower BOD, neutral pH) to mature (dilute, organic-refractory) over decades.

Stability and settlement of landfill mass; slope analysis for tall cells. Post-closure monitoring 30+ years (in Canada, Ontario MECP requirements).

## 5.3 Incineration and Energy Recovery

Mass-burn facilities combust MSW at 850-1000 °C; energy recovered as steam/electricity. Air pollution control: SCR, baghouse, wet scrubber, activated carbon injection for mercury and dioxins. Bottom ash and fly ash managed as non-hazardous or hazardous depending on metals content.

## 5.4 Hazardous Waste

RCRA framework (US), HWMP (provincial) in Canada. Characteristic hazards: ignitability, corrosivity, reactivity, toxicity (TCLP). Treatment: biological for organics, chemical for inorganics, physical (filtration, distillation), thermal (incineration, plasma). Secure landfill for residuals.

## 5.5 Contaminated Sites and Remediation

Brownfields redevelopment. Investigation: phase I (historical), phase II (sampling), phase III (delineation, risk assessment). Remediation: excavation, in-situ bioremediation, chemical oxidation, pump-and-treat, permeable reactive barriers, thermal desorption, stabilization.

# Chapter 6: Regulatory Framework and Design Practice

## 6.1 Canadian Regulatory Structure

CEPA 1999 federal framework; provincial delegation (Ontario Environmental Protection Act; Ontario Water Resources Act). Environmental Assessment for major projects. Federal fisheries and navigable waters overlap with provincial water management.

## 6.2 Standards and Guidelines

Ambient water quality (CCME Canadian Environmental Quality Guidelines), drinking water (Health Canada), air quality (Canadian Ambient Air Quality Standards CAAQS), soil (CCME soil quality). Enforcement through orders, fines, and criminal charges for severe non-compliance.

## 6.3 Pollution Prevention

Source reduction preferred over end-of-pipe treatment. Green chemistry principles, efficient processes, industrial symbiosis, extended producer responsibility. Engineering design incorporates life-cycle thinking from the outset.

## 6.4 Professional Practice

Environmental engineers must respect legal requirements, protect public health, and communicate uncertainty honestly. PEO / provincial regulators set professional practice expectations. Ethics codes (Engineers Canada guideline on environmental stewardship) articulate the duty to the environment in professional conduct.

<div class="remark">
Environmental engineering converts fundamental sciences (chemistry, biology, fluid mechanics) into the practical infrastructure that delivers clean water, manages wastewater, and controls pollution. Unit operations connect reliably once their principles are internalized; sound practice integrates them into treatment trains appropriate to site, source, and regulatory context.
</div>
