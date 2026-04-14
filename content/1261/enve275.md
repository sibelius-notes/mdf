---
title: "ENVE 275: Aquatic Chemistry"
prof: "Anh Pham"
subjects: "ENVE"
---

## Sources and References

- Stumm, W. and Morgan, J. J. *Aquatic Chemistry: Chemical Equilibria and Rates in Natural Waters*, 3rd ed., Wiley-Interscience.
- Benjamin, M. M. *Water Chemistry*, 2nd ed., Waveland Press.
- Snoeyink, V. L. and Jenkins, D. *Water Chemistry*, Wiley.
- Morel, F. M. M. and Hering, J. G. *Principles and Applications of Aquatic Chemistry*, Wiley-Interscience.
- Pankow, J. F. *Aquatic Chemistry Concepts*, Lewis Publishers.
- MIT OpenCourseWare 1.76 *Aquatic Chemistry*.
- Caltech Ge 126 *Aquatic Chemistry*.
- Stanford CEE 260 *Environmental Chemistry*.

# Chapter 1: Scope of Aquatic Chemistry and the Composition of Natural Waters

Aquatic chemistry is the quantitative description of how dissolved species interact with one another, with solid surfaces, and with the gas phase in natural and engineered aqueous systems. Environmental engineers draw on its tools whenever the quality of a water body governs a design decision: selecting a coagulant for a drinking water plant, predicting whether a constructed wetland will precipitate phosphorus, anticipating the fate of a metal in a tailings lagoon, or forecasting the long-term mineralogy of a carbon-storage reservoir. Because virtually every environmental process of interest eventually routes contaminants through water, a mechanistic command of aqueous equilibria is foundational to the discipline.

Natural waters span an enormous range of compositions. Rainwater is dilute but slightly acidic owing to dissolved atmospheric carbon dioxide and trace strong acids. River water reflects the lithology of its watershed: streams draining carbonate terrain carry calcium, magnesium, and bicarbonate in near-stoichiometric proportion, while streams draining silicate rocks carry more sodium and silicic acid. Groundwater, having had long contact with mineral surfaces at elevated partial pressures of carbon dioxide, is typically more concentrated. Seawater, whose composition is remarkably constant in major-ion ratios, is dominated by sodium and chloride, with sulfate, magnesium, calcium, potassium, and bicarbonate constituting the remainder. The ionic strength of seawater is roughly 0.7 mol/L, two or three orders of magnitude above that of most fresh surface waters.

Concentrations are reported in several conventions. Molarity and molality refer to moles per litre of solution and moles per kilogram of solvent, respectively, and coincide for dilute solutions at ordinary temperatures. Mass-based units such as milligrams per litre are common in water-quality practice. Equivalents per litre normalize by charge, a convenience when summing cations and anions. Water hardness is traditionally expressed as mg/L of calcium carbonate, so that a calcium concentration of 40 mg/L corresponds to 100 mg/L as \( \mathrm{CaCO_3} \) because the equivalent weight of \( \mathrm{CaCO_3} \) is exactly twice that of calcium. Converting fluently among these conventions is a prerequisite for every later calculation.

Electroneutrality requires that the sum of positive charges equal the sum of negative charges in any bulk solution:

\[ \sum_i z_i [M_i^{z_i+}] = \sum_j |z_j| [A_j^{z_j-}] \]

This condition, together with mass balances on each dissolved element and the relevant equilibrium expressions, generates the closed system of equations that governs speciation. A failure of electroneutrality in a reported analysis is diagnostic of measurement error or of a missed constituent such as organic acidity. Ionic strength,

\[ I = \tfrac{1}{2} \sum_i c_i z_i^2, \]

weights each ion by the square of its charge and sets the stage for all non-ideality corrections that follow.

# Chapter 2: Chemical Thermodynamics and the Equilibrium Constant

Equilibrium in aquatic chemistry is grounded in the Gibbs free energy. For a reaction \( aA + bB \rightleftharpoons cC + dD \), the change in Gibbs energy under arbitrary conditions is

\[ \Delta G = \Delta G^{\circ} + RT \ln Q, \]

where \( Q \) is the reaction quotient built from the activities of products and reactants. At equilibrium \( \Delta G = 0 \) and \( Q \) equals the equilibrium constant \( K \), yielding

\[ \Delta G^{\circ} = -RT \ln K. \]

Standard Gibbs energies of formation tabulated for aqueous species, solids, and gases allow any equilibrium constant of interest to be computed from

\[ \Delta G^{\circ}_{\mathrm{rxn}} = \sum \nu_i \Delta G^{\circ}_{f,i}. \]

The temperature dependence of \( K \) follows the van't Hoff relation,

\[ \frac{d \ln K}{dT} = \frac{\Delta H^{\circ}}{RT^2}, \]

which integrates, under the assumption of a temperature-independent enthalpy, to

\[ \ln \frac{K_2}{K_1} = -\frac{\Delta H^{\circ}}{R}\left(\frac{1}{T_2} - \frac{1}{T_1}\right). \]

Exothermic reactions therefore shift backward as temperature rises. The dissolution of calcium carbonate and of oxygen in water are both classic examples of reactions whose equilibrium constants decrease with warming, an effect that couples aquatic chemistry directly to thermal pollution and climate.

Activities replace concentrations in all equilibrium expressions written for non-ideal solutions. The activity of a dissolved species is \( a_i = \gamma_i [i] \), where \( \gamma_i \) is the single-ion activity coefficient and \( [i] \) is the molar concentration. At infinite dilution \( \gamma_i = 1 \); as ionic strength increases, long-range electrostatic interactions depress activity coefficients below unity. The Debye-Huckel limiting law,

\[ \log \gamma_i = -A z_i^2 \sqrt{I}, \]

applies for \( I < 0.005\ \mathrm{mol/L} \), where \( A \approx 0.509 \) at 25 degrees Celsius. The extended Debye-Huckel and Davies equations, the latter written as

\[ \log \gamma_i = -A z_i^2 \left( \frac{\sqrt{I}}{1+\sqrt{I}} - 0.3\, I \right), \]

extend the range to roughly 0.1 and 0.5 mol/L respectively and suffice for most fresh-water problems. For brines and seawater, specific-interaction theory or Pitzer equations are required. Neutral species are often assigned activity coefficients close to unity, though the Setchenow effect does salt them out slightly at high ionic strength.

# Chapter 3: Acid-Base Equilibria, the pC-pH Diagram, and Buffers

The central equilibrium of every aquatic system is the self-ionization of water, \( K_w = [\mathrm{H}^+][\mathrm{OH}^-] \), with \( pK_w = 14.00 \) at 25 degrees Celsius. Protic species are classified by the acid dissociation constant \( K_a \). A monoprotic acid \( HA \) satisfies

\[ K_a = \frac{[\mathrm{H}^+][A^-]}{[HA]}. \]

Diprotic and triprotic systems generate a cascade of constants \( K_{a1}, K_{a2}, K_{a3} \), and the fractional distribution of the conjugate forms is governed by the alpha functions. For a monoprotic system,

\[ \alpha_0 = \frac{[\mathrm{H}^+]}{[\mathrm{H}^+] + K_a}, \qquad \alpha_1 = \frac{K_a}{[\mathrm{H}^+] + K_a}, \]

with analogous expressions for polyprotic acids. These functions cross at \( \mathrm{pH} = pK_a \) and collapse into the familiar Henderson-Hasselbalch relation when the ratio of conjugate base to acid is specified.

Solving for the pH of an arbitrary mixture requires combining the equilibrium expressions with the mass balance on the parent acid and the proton condition, which is the electroneutrality statement rearranged in terms of how much each species has gained or lost protons relative to a chosen reference level. For a pure solution of sodium bicarbonate the reference level is \( \mathrm{HCO_3^-} \), and the proton condition reads \( [\mathrm{H_2CO_3^*}] + [\mathrm{H}^+] = [\mathrm{CO_3^{2-}}] + [\mathrm{OH^-}] \). The unknown pH follows by simultaneous solution.

The pC-pH diagram is the graphical counterpart. Plotting the logarithm of each species concentration against pH produces a family of lines whose slopes change at each \( pK_a \). Intersections with the \( \mathrm{H^+} \) and \( \mathrm{OH^-} \) lines identify the equivalence points of a titration. Such diagrams are indispensable for visualizing how a buffer works, how an indicator is selected, and why acid rain has different consequences in carbonate versus silicate watersheds.

A buffer resists changes in pH when strong acid or base is added. The buffering intensity, defined as

\[ \beta = \frac{dC_B}{d\mathrm{pH}} = -\frac{dC_A}{d\mathrm{pH}}, \]

quantifies how many moles of strong base must be added per litre to raise the pH by one unit. For a monoprotic weak acid at total concentration \( C_T \), the dominant contribution near \( \mathrm{pH} = pK_a \) is \( \beta \approx 2.303\, C_T\, \alpha_0 \alpha_1 \), which reaches a maximum of \( 0.576\, C_T \) exactly at the half-equivalence point. Natural-water buffering is overwhelmingly supplied by the carbonate system, and engineered treatment steps such as lime softening, remineralization, and corrosion control all manipulate this buffer deliberately.

Alkalinity is the operational quantity measured by titrating to a chosen endpoint, usually near pH 4.5. In carbonate-dominated fresh water it reduces to

\[ \mathrm{Alk} \approx [\mathrm{HCO_3^-}] + 2[\mathrm{CO_3^{2-}}] + [\mathrm{OH^-}] - [\mathrm{H^+}], \]

with contributions from borate, silicate, ammonia, phosphate, and organic acids added when relevant. Alkalinity is a conservative quantity with respect to the addition or removal of carbon dioxide, which makes it a powerful tracer. Acidity is its mirror image, measured by titrating to the phenolphthalein endpoint.

# Chapter 4: The Carbonate System and Hardness

The carbonate system links the atmosphere, surface waters, sediments, and the biosphere. In an open system in equilibrium with atmospheric carbon dioxide, Henry's law fixes the activity of dissolved carbon dioxide:

\[ [\mathrm{H_2CO_3^*}] = K_H\, p_{\mathrm{CO_2}}, \]

with \( K_H \approx 3.3 \times 10^{-2}\ \mathrm{mol/(L\cdot atm)} \) at 25 degrees Celsius. Successive protolyses give \( pK_{a1} \approx 6.35 \) and \( pK_{a2} \approx 10.33 \). A pure water sample in equilibrium with pre-industrial atmospheric carbon dioxide settles at about pH 5.6; with present-day mixing ratios the value is slightly lower, a reminder that rainfall is mildly acidic even in the absence of sulfuric and nitric pollution.

Closed and open systems differ in whether the total dissolved inorganic carbon \( C_T = [\mathrm{H_2CO_3^*}] + [\mathrm{HCO_3^-}] + [\mathrm{CO_3^{2-}}] \) is conserved or whether it is buffered by gas exchange. In groundwater trapped beneath an aquitard the closed assumption holds, and pH can evolve substantially as the water reacts with minerals. In a surface stream the open assumption is usually appropriate on time scales longer than hours.

Calcite and other carbonate minerals establish a further set of heterogeneous equilibria. The dissolution of calcite,

\[ \mathrm{CaCO_3(s)} \rightleftharpoons \mathrm{Ca^{2+}} + \mathrm{CO_3^{2-}}, \]

has a solubility product \( K_{sp} \approx 10^{-8.48} \). A saturation index, defined as the logarithm of the ratio of the ion activity product to \( K_{sp} \), signals whether a water is aggressive toward concrete pipe or prone to scaling heat exchangers. The Langelier index, widely used in drinking water practice, is a convenient reparameterization of this idea.

Hardness is the sum of multivalent cation concentrations expressed as \( \mathrm{CaCO_3} \), dominated in most waters by calcium and magnesium. Carbonate or temporary hardness is the portion that can be removed by boiling, because heating drives carbon dioxide out of solution and precipitates calcium carbonate. Non-carbonate or permanent hardness, associated with sulfate and chloride, requires ion exchange or chemical softening. The lime-soda process combines the addition of calcium hydroxide and sodium carbonate to shift the carbonate equilibria toward precipitation, an illustration of how aquatic chemistry underwrites an entire unit operation.

# Chapter 5: Metal Speciation, Complexation, and Solubility

Dissolved metals rarely exist as bare aquo ions. They are complexed by inorganic ligands such as hydroxide, chloride, carbonate, and sulfate, and by organic ligands ranging from simple carboxylates to natural humic substances and synthetic chelators. Each complex is described by a stability constant; the overall formation constant for \( M + nL \rightleftharpoons ML_n \) is

\[ \beta_n = \frac{[ML_n]}{[M][L]^n}. \]

Hydroxide complexation is ubiquitous and makes the fractional concentration of free metal ion a sensitive function of pH. Aluminum at circumneutral pH, for instance, speciates through a series of hydrolysis products \( \mathrm{Al(OH)^{2+}}, \mathrm{Al(OH)_2^+}, \mathrm{Al(OH)_3^0}, \mathrm{Al(OH)_4^-} \), with a solubility minimum near pH 6 that governs the dose and pH of alum coagulation. Iron, copper, lead, zinc, and cadmium follow analogous patterns with species-specific constants.

Natural organic matter further complicates the picture by donating multiple binding sites with a broad distribution of affinities. Competitive models such as NICA-Donnan and discrete log-K spectra reproduce the observed pH and ionic-strength dependence of metal binding to humic and fulvic acids. The bioavailability of a trace metal to aquatic organisms often tracks the activity of the free aquo ion rather than the total dissolved concentration, the insight at the heart of the free-ion activity model and its successor, the biotic ligand model.

Solid-phase equilibria are written as conditional solubility products. For \( \mathrm{Fe(OH)_3(s)} \),

\[ K_{sp} = [\mathrm{Fe^{3+}}][\mathrm{OH^-}]^3, \]

the total dissolved iron is the sum of all hydrolysis species, each linked to \( [\mathrm{Fe^{3+}}] \) through its formation constant. The resulting solubility curve has a pronounced minimum in the near-neutral range, which is why iron is scavenged from most surface waters by hydroxide precipitation yet remobilized under acidic mine-drainage conditions. Phosphate removal in wastewater treatment exploits the same principle in reverse, titrating iron or aluminum to precipitate \( \mathrm{FePO_4} \) or \( \mathrm{AlPO_4} \).

# Chapter 6: Oxidation-Reduction Reactions and pE-pH Diagrams

Redox chemistry controls the fate of nitrogen, sulfur, carbon, iron, manganese, and many contaminants. A balanced half-reaction is written as a reduction, for example

\[ \mathrm{O_2(g)} + 4\mathrm{H^+} + 4e^- \rightleftharpoons 2\mathrm{H_2O}, \qquad E^{\circ} = 1.229\ \mathrm{V}. \]

The Nernst equation relates the actual electrode potential to the activities of reactants and products:

\[ E = E^{\circ} - \frac{RT}{nF} \ln Q. \]

At 25 degrees Celsius and base-ten logarithms this collapses to \( E = E^{\circ} - (0.0592/n) \log Q \). Environmental chemists frequently substitute the dimensionless electron activity \( pE = -\log\{e^-\} \), related to \( E \) by \( pE = E / (2.303\, RT/F) \), approximately \( E/0.0592 \) at 25 degrees. The advantage of \( pE \) is that it places redox on the same conceptual footing as pH, and allows the simultaneous use of both master variables in speciation diagrams.

The pE-pH diagram, sometimes called an Eh-pH or Pourbaix diagram, maps the dominant species of an element in two-dimensional master-variable space. Boundaries between aqueous species are vertical when only protons are exchanged, horizontal when only electrons are exchanged, and sloped when both appear in the half reaction. The stability field of liquid water is bounded above by the oxygen line, \( pE = 20.78 - \mathrm{pH} \) at unit oxygen activity, and below by the hydrogen line, \( pE = -\mathrm{pH} \). Natural waters generally lie well inside this window.

Iron is the archetypal pE-pH system. At high \( pE \) and circumneutral pH the stable phase is ferric hydroxide; lowering \( pE \) across the \( \mathrm{Fe^{3+}/Fe^{2+}} \) boundary liberates ferrous iron into solution. This single transition underwrites acid mine drainage, groundwater red-water problems, and the biogeochemistry of anoxic sediments. Sulfur presents an equally rich diagram, with sulfate, elemental sulfur, and sulfide partitioned by redox potential, and with the formation of iron sulfides at low \( pE \) closing a tight loop between the iron and sulfur cycles. Nitrogen cycles from nitrate through nitrite to ammonium as \( pE \) decreases, while carbon cycles from carbon dioxide through organic matter to methane under increasingly reducing conditions.

Kinetic considerations temper the equilibrium picture. Many redox reactions are slow in the absence of a catalyst, and microbial communities supply the catalysis that governs real environmental rates. A thermodynamic prediction therefore indicates the direction of travel, not the speed. Engineered systems exploit this by providing electron acceptors in a sequence that mirrors the natural ordering: aerobic respiration, denitrification, manganese and iron reduction, sulfate reduction, and methanogenesis. Each stage is set by the standard free energy of its half reaction, and the design of a bioreactor amounts to steering a microbial consortium through this ladder.

# Chapter 7: Synthesis and Practice

A mature command of aquatic chemistry rests on a few reusable moves. Write the electroneutrality statement. Write the mass balances. Write the equilibrium expressions, including any heterogeneous equilibria with solids and gases. Correct for non-ideality using the Davies equation or an equivalent. Simplify by identifying the dominant species in each pH region, confirmed on a pC-pH diagram. Check the result against a mass-balance on the conservative tracer, and against the boundaries of the water-stability field on a pE-pH diagram. The same algorithm solves problems as disparate as the pH of a rain droplet, the concentration of dissolved copper in a watershed, and the sulfide concentration in a digester.

Laboratory exercises in an aquatic-chemistry course reinforce the algorithm by forcing the student to confront measurement uncertainty. Titrations of unknown acids teach the shape of buffering curves. Potentiometric and spectrophotometric determinations of trace metals illustrate the difference between total and free concentrations. Experiments with carbonate equilibria illustrate the sensitivity of pH to gas exchange. Writing a clean laboratory report, with a defensible propagation of uncertainty and a comparison against theoretical expectations, consolidates the computational content into a professional habit of quantitative reasoning.

The concepts of equilibrium, speciation, buffering, complexation, and redox are the vocabulary with which every subsequent course in water treatment, hydrogeology, environmental modelling, and contaminant fate and transport is written. The discipline continues to evolve as new ligands enter the environment, as climate alters temperatures and carbonate balances, and as instrumentation reveals finer structure in natural organic matter and mineral surfaces. The equations introduced here remain the scaffolding on which every such advance is hung.
