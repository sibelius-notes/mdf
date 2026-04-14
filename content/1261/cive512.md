---
title: "CIVE 512: Rehabilitation of Structures"
prof: "Adil Al-Mayah"
subjects: "CIVE"
---

## Sources and References

- Emmons, P. H. *Concrete Repair and Maintenance Illustrated: Problem Analysis, Repair Strategy, Techniques*. R.S. Means.
- ACI Committee 562. *Code Requirements for Assessment, Repair, and Rehabilitation of Existing Concrete Structures (ACI 562) and Commentary*. American Concrete Institute.
- ACI Committee 546. *Guide to Concrete Repair (ACI 546R)*. American Concrete Institute.
- International Concrete Repair Institute (ICRI) Technical Guidelines, including Guideline No. 310.2R *Selecting and Specifying Concrete Surface Preparation for Sealers, Coatings, Polymer Overlays, and Concrete Repair*.
- Bungey, J. H.; Millard, S. G.; Grantham, M. G. *Testing of Concrete in Structures*. Taylor and Francis.
- Bertolini, L.; Elsener, B.; Pedeferri, P.; Redaelli, E.; Polder, R. *Corrosion of Steel in Concrete: Prevention, Diagnosis, Repair*. Wiley-VCH.
- ACI Committee 440. *Guide for the Design and Construction of Externally Bonded FRP Systems for Strengthening Concrete Structures (ACI 440.2R)*. American Concrete Institute.
- Neville, A. M. *Properties of Concrete*. Pearson.
- fib Bulletin 14. *Externally Bonded FRP Reinforcement for RC Structures*. Fédération Internationale du Béton.
- Hollaway, L. C.; Teng, J. G. *Strengthening and Rehabilitation of Civil Infrastructures Using Fibre-Reinforced Polymer (FRP) Composites*. Woodhead.
- MIT OpenCourseWare 1.051 *Structural Engineering Design* and Cambridge University Engineering Tripos Part IIB structures modules on assessment and durability of existing structures.

# Chapter 1: Motivation, Integrated Design, and the Repair Process

Rehabilitation engineering addresses the large and aging population of existing buildings, bridges, parking structures, marine works, and industrial facilities that no longer meet their intended performance criteria. Unlike new design, where a clean slate allows free choice of materials, sections, and details, rehabilitation begins with a host structure whose geometry, materials, damage, and service history are partly unknown and must be inferred. This reality shifts the engineering mindset from selection to investigation, from optimization in isolation to compromise under the constraints imposed by the existing fabric.

Motivations for intervention span several categories. Durability-driven rehabilitation arises when deterioration of concrete or steel threatens the structure's remaining service life even though current demands are still satisfied. Capacity-driven strengthening becomes necessary when code updates, changes in occupancy, increased live or seismic loads, or revised traffic classifications push demand beyond the original capacity. Damage repair follows accidental events such as impact, fire, blast, earthquake, or scour. Finally, functional modifications such as new openings, added stories, or equipment foundations generate localized rehabilitation needs even in otherwise healthy members.

ACI 562 formalizes rehabilitation engineering as a structured process. The assessment must establish the structure's existing condition, identify causes of deterioration, and evaluate whether current capacity meets current or anticipated demand. The engineer then designs repairs that restore, enhance, or preserve performance while considering compatibility with the substrate, constructability under service conditions, and the remaining life expected after intervention. An integrated design philosophy recognizes that the repair material, the existing substrate, the bond at their interface, and the surrounding environment form one composite system whose long-term behaviour depends on the weakest link.

Safety considerations pervade every stage. Field investigations frequently take place on partially damaged members, and removal of cover concrete or corroded reinforcement can temporarily reduce capacity. Temporary shoring, staged removal sequences, and conservative assumptions about residual strength protect both workers and the public. The repair process typically follows the sequence of condition survey, detailed investigation and testing, diagnosis of root causes, selection of repair strategy, design and specification, execution, and post-repair monitoring. Emmons emphasizes that skipping or rushing diagnosis is the most common source of repair failure, since treating a symptom without removing its cause almost guarantees recurrence.

# Chapter 2: Materials Overview — Concrete, Steel, and FRP

Concrete is a heterogeneous composite of hydrated cement paste, aggregate, water, air voids, and admixtures whose mechanical and transport properties evolve with time, moisture, and exposure. Compressive strength, typically the design parameter of interest, develops through hydration of calcium silicates to form calcium silicate hydrate and calcium hydroxide. Tensile strength is roughly one-tenth of compressive strength, which is why cracking dominates serviceability discussions. Porosity of the paste and the interfacial transition zone between paste and aggregate governs permeability, and permeability in turn controls the ingress of aggressive species such as chloride ions, carbon dioxide, sulphates, and water.

Steel reinforcement embedded in concrete enjoys natural protection from a passive oxide film stabilized by the high alkalinity of pore solution, with pH near 13. When this protective environment is compromised, corrosion follows the familiar electrochemical model in which anodic iron dissolution and cathodic oxygen reduction occur at spatially distinct sites linked by electron flow through the rebar and ion flow through the pore solution. Bertolini and colleagues formalize corrosion as a two-stage process: an initiation period during which aggressive agents reach the steel, followed by a propagation period during which section loss, expansive oxide formation, and cover cracking accumulate. The service life model

\[
t_{sl} = t_i + t_p
\]

where \( t_i \) is the initiation time and \( t_p \) the propagation time, underpins much of durability-based design and intervention timing.

Fatigue in metals describes progressive damage under cyclic stress below static yield. The Wöhler or S–N diagram relates stress range \( \Delta\sigma \) to cycles-to-failure \( N \) through a power law that, over a wide intermediate range, takes the form

\[
N \, \Delta\sigma^{m} = C
\]

with \( m \approx 3 \) for welded steel details. Detail categories in structural codes classify weld geometries by their fatigue endurance, recognizing that stress concentrations at weld toes, root notches, and geometric discontinuities dominate crack initiation. Rehabilitation of fatigue-damaged steel must therefore address not only residual strength but also the weld quality and local geometry that controlled initiation.

Fibre-reinforced polymer composites consist of high-strength, high-modulus fibres embedded in a polymer matrix, most often epoxy. Carbon, glass, and aramid fibres each offer distinct trade-offs of strength, stiffness, cost, and durability. FRP is linearly elastic to failure, which simplifies analysis but eliminates the ductile warning behaviour of steel. Directionality is intrinsic, so the layup dictates stiffness and strength in each plane. The attractive features of FRP for rehabilitation are its very high specific strength, resistance to electrochemical corrosion, minimal added weight and thickness, and adaptability to curved geometries. Limitations include sensitivity to elevated temperature through the glass transition of the matrix, vulnerability to ultraviolet radiation if unprotected, and debonding as the dominant failure mode of externally bonded systems.

# Chapter 3: Structural Inspection and Non-Destructive Evaluation

Systematic inspection produces the evidence on which every subsequent decision rests. Inspection types range from routine visual surveys, through detailed condition assessments, to specialized investigations triggered by unusual events. Bridge management practice in most jurisdictions prescribes periodic inspection intervals, reporting formats, and training requirements for inspectors, reflecting the importance of consistent, repeatable documentation.

Visual inspection remains the most productive first step because it is inexpensive and reveals macroscopic symptoms that guide targeted testing. Typical findings include map cracking indicative of alkali–aggregate reaction or shrinkage, longitudinal cracks over reinforcement suggesting corrosion, spalls exposing rust-stained bars, delaminations audible as hollow regions when chained or hammered, staining from leaching or efflorescence, and surface scaling from freeze–thaw or de-icing salt exposure. Crack maps, photographic logs, and quantitative measurements of crack width, depth, and spacing feed into later diagnosis.

Instrumented non-destructive evaluation supplements what the eye cannot see. Bungey, Millard, and Grantham classify techniques by the physical principle they exploit. Rebound hammers and ultrasonic pulse velocity correlate surface hardness and wave speed with compressive strength through empirical calibrations, recognizing that absolute strength prediction is weak but relative comparison across a member is reliable. Ground-penetrating radar locates reinforcement, tendons, embedded services, and subsurface voids by exploiting contrasts in dielectric permittivity. Impact-echo identifies delaminations and voids by the resonant frequency of trapped stress waves. Half-cell potential measurements map the thermodynamic driving force for corrosion, while linear polarization resistance quantifies the instantaneous corrosion current density and so supports rate-of-damage estimates. Chloride profiling, petrographic analysis of cores, carbonation depth measurement using phenolphthalein indicators, and strain gauging of representative members round out the typical toolkit.

The inspection objective is not merely to detect damage but to diagnose its cause. The same symptom, such as longitudinal cracking over a bar, may arise from chloride-induced corrosion, carbonation, restrained early-age shrinkage, or mechanical overload, and each cause implies a different repair strategy. Triangulating evidence from multiple techniques reduces the risk of misdiagnosis.

# Chapter 4: Concrete Deterioration Mechanisms

Cracking in concrete is so universal that the challenge is distinguishing benign from harmful cracks. Plastic shrinkage cracks form within hours of casting when surface evaporation exceeds the rate at which bleed water rises. Plastic settlement cracks trace the line of top reinforcement as the fresh concrete below the bar settles more than the concrete over it. Drying shrinkage cracks appear as the young concrete loses moisture and is restrained by supports, reinforcement, or adjacent elements. Thermal cracks arise from differential temperatures between freshly placed mass concrete and its surroundings. Structural cracks follow load paths and indicate flexural, shear, torsional, or bearing distress. Each category demands a different response: cosmetic sealing may suffice for inactive shrinkage cracks, whereas structural cracks require investigation of the underlying load path before any treatment.

Corrosion of embedded steel is the single most common deterioration mode in reinforced concrete infrastructure. Chloride-induced corrosion begins when the chloride concentration at the steel reaches a threshold sufficient to destabilize the passive film, a limit conventionally placed near 0.4 percent by mass of cement although local conditions shift this value substantially. Carbonation, the reaction of atmospheric carbon dioxide with calcium hydroxide to form calcium carbonate, progresses from the surface inward and lowers pore-solution pH to values where the passive film cannot be maintained. The carbonation front advances approximately as

\[
x(t) = k \sqrt{t}
\]

where \( k \) depends on concrete quality, relative humidity, and CO\(_2\) concentration. Once corrosion initiates, the volume of corrosion products exceeds that of the consumed steel by a factor of two to six depending on oxide stoichiometry, and the resulting bursting pressure cracks and spalls the cover.

Freeze-thaw damage occurs when water absorbed in the pore network of saturated concrete freezes, generating hydraulic and osmotic pressures that exceed the tensile strength of the paste. Entrained air voids provide expansion reservoirs that relieve these pressures, which is why proper air-void spacing is the central defence. De-icing salts aggravate the problem by increasing the depth of saturation and by producing localized osmotic gradients that drive additional water migration.

Alkali–aggregate reaction, most often alkali–silica reaction, occurs when reactive silica in certain aggregates reacts with hydroxyl ions from the pore solution to form an expansive gel. The gel absorbs water and swells, producing internal tensile stress that generates the characteristic map cracking pattern and, in heavily reinforced members, can cause preferential cracking aligned with the weaker direction. Sulphate attack, delayed ettringite formation, leaching, and biological attack complete the catalogue of environmental distress mechanisms that every rehabilitation engineer must recognize.

# Chapter 5: Flexural and Shear Strengthening of Concrete Beams

Flexural strengthening enhances the moment capacity of a reinforced or prestressed concrete beam beyond what the original section and reinforcement provide. The classical strategies include bonded steel plates, section enlargement with additional reinforcement and jacket concrete, external post-tensioning, and externally bonded or near-surface-mounted FRP. FRP flexural strengthening now dominates practice for many applications because it adds minimal weight, imposes almost no dimensional change, and avoids the corrosion vulnerability of bonded steel plates.

Analysis of a strengthened section relies on the same equilibrium and compatibility principles as ordinary reinforced-concrete design, with three modifications. First, the existing steel carries a strain offset determined by the load present when the FRP is applied; subsequent loading imposes additional strain that adds to this initial value. Second, the FRP has a linear stress–strain response to failure and contributes tension at its own location below the steel, shifting the neutral axis downward and increasing the internal lever arm. Third, debonding typically limits the usable FRP strain well below rupture, so an effective strain or bond-dependent coefficient replaces the ultimate material strain. ACI 440.2R provides explicit expressions for this effective strain. The section moment capacity then follows from

\[
M_n = A_s f_s \left( d - \tfrac{a}{2} \right) + \psi_f A_f f_{fe} \left( h - \tfrac{a}{2} \right)
\]

where \( A_f \) is the FRP area, \( f_{fe} \) the effective FRP stress, and \( \psi_f \) a strength reduction factor that recognizes the additional uncertainty of bonded composite action. Ductility checks ensure that the strengthened beam still yields the internal steel before concrete crushing or FRP rupture in order to preserve warning behaviour.

Shear strengthening resists the diagonal tension induced by shear and the accompanying flexural tension. FRP is wrapped around the web in U-wraps, complete wraps, or side-bonded strips, and its contribution adds to the concrete and steel shear contributions through a truss model analogous to stirrup analysis. Anchorage is critical because debonding of the FRP from the web at the ends of the strip limits the strain that can be developed. Mechanical anchors, full wraps, and fibre anchors each extend the usable strain and so the available contribution. Interaction of flexural and shear strengthening requires attention because each modifies the internal force distribution and the failure mode.

# Chapter 6: Flexural Strengthening Using External Prestressing

External prestressing applies tendons outside the concrete cross section, anchored at specially detailed end regions and deflected at intermediate saddles to follow a chosen profile. The tendons introduce compressive force and a variable eccentricity that together produce a secondary moment opposing gravity loads. Because the tendons are external, friction losses at deviators are small, replacement is feasible, and inspection is straightforward, which makes external post-tensioning attractive for bridges where corrosion of internal tendons has become a widespread problem.

The analysis combines the classical prestressed-concrete equations with additional considerations for externally applied force paths. At service, the top and bottom fibre stresses of the composite section under dead load, live load, and prestress are

\[
\sigma = \frac{N}{A} \pm \frac{M\,y}{I} \mp \frac{P\,e\,y}{I}
\]

where \( P \) is the effective prestress force after losses, \( e \) the eccentricity, and the signs follow from the fibre of interest. At ultimate, the tendon stress must be computed using a member-level compatibility rather than a section-level one, because the unbonded tendon strain depends on the overall deformation between anchorages. Simplified code expressions give an effective stress increment as a function of the concrete member strain averaged between anchors. Losses from anchorage slip, friction at deviators, elastic shortening, relaxation of the tendon steel, creep, and shrinkage of the concrete reduce the long-term prestress and must be estimated explicitly.

Anchorage detailing is a central design task. Local bearing stresses at the anchors, transverse bursting stresses, and secondary moments in the end region all require careful evaluation. Deviator blocks transfer the change of tendon direction as a concentrated load on the existing concrete, which often governs design because the existing member was never detailed for such a force.

# Chapter 7: Concrete Surface Repair

Surface repair restores the protective cover, geometry, and often the local bond capacity of deteriorated concrete. ACI 546R and Emmons together frame repair selection around the root cause, the exposure class, the service constraints, and the compatibility required between substrate and repair material. The ICRI guidelines standardize the vocabulary of surface preparation with concrete surface profiles and specify measurement methods for roughness, moisture, and soundness.

Repair selection begins with removal. Partial-depth removal takes out the deteriorated concrete to a sound substrate, exposing reinforcement where corrosion has occurred. Full-depth removal replaces the entire member thickness where damage is extensive. Removal methods include hand tools, pneumatic breakers, hydrodemolition, and abrasive blasting. Hydrodemolition, delivered by high-pressure water jets, removes unsound concrete selectively, minimizes microcracking of the substrate, cleans the exposed reinforcement, and leaves a rough, open profile ideal for bond, which is why it has become the preferred method for large-scale bridge deck rehabilitation.

Compatibility between repair material and substrate spans several dimensions. Dimensional compatibility requires matching of elastic modulus, creep, shrinkage, and coefficient of thermal expansion so that restrained volume changes do not crack the repair or debond it. Chemical compatibility prevents alkali–silica reaction between new and old constituents and avoids accelerating corrosion of existing reinforcement. Electrochemical compatibility becomes critical when a repair of high-quality, low-permeability concrete is placed adjacent to chloride-contaminated parent concrete, since the contrast can create an incipient anode where previously passive steel begins to corrode in the zone just outside the patch. Cathodic protection, sacrificial galvanic anodes embedded at the patch perimeter, and realkalization treatments all address this compatibility failure.

Repair materials include Portland-cement-based mortars with or without polymer modification, magnesium phosphate cements for rapid-setting applications, calcium sulphoaluminate cements, epoxy mortars, and polymer concretes. Each trades strength development, durability, cost, and temperature range differently, and selection should follow from a performance specification rather than brand preference.

# Chapter 8: Steel Problems and Rehabilitation

Steel members in bridges and industrial structures deteriorate through mechanisms distinct from those in concrete. Corrosion reduces section thickness and, at pits, generates stress concentrations that promote fatigue cracking. Fatigue damage accumulates under cyclic loads, particularly at welded details where geometric and metallurgical discontinuities create local stress raisers. Brittle fracture, favoured by low temperature, high constraint, and plate thickness, can propagate a small crack catastrophically. Impact, overload, and fire damage account for the remainder of severe structural distress in steel.

Assessment of a cracked steel detail starts with crack mapping using visual, magnetic particle, dye penetrant, ultrasonic, or radiographic techniques. The detail category, stress range history, and crack geometry then feed into a fracture-mechanics evaluation in which the stress intensity factor

\[
K = Y \sigma \sqrt{\pi a}
\]

with \( a \) the crack length and \( Y \) a geometric factor, is compared to the fracture toughness of the material to estimate critical crack sizes and remaining fatigue life by integrating the Paris law crack growth relation.

Conventional repair of cracked welds begins with crack removal by grinding or gouging back to sound metal, followed by rewelding with a qualified procedure and preheat appropriate to the plate thickness and chemistry. Drilling a stop hole at the crack tip arrests growth by blunting the crack and redistributing local stress, and is often used as a temporary measure before full repair. Bolted splice plates restore cross section and load path without heat input, which is valuable for members sensitive to welding residual stresses or hydrogen embrittlement. Section replacement is warranted when damage is too extensive for local repair.

Innovative repair methods apply FRP patches to steel members in the same way as to concrete. A carbon-fibre laminate bonded across a fatigue crack reduces the stress range at the crack tip by sharing load, can prolong fatigue life substantially, and avoids the heat input and residual stresses of welded patches. Post-tensioning with external tendons relieves dead-load stresses in steel girders and can extend fatigue life by lowering the mean stress of the cyclic history. Peening, ultrasonic impact treatment, and toe grinding at fatigue-critical welds improve local geometry and introduce compressive residual stresses, raising the fatigue endurance of the detail.

# Chapter 9: Case Studies and the Engineering of Compromise

Case studies from bridge decks, parking garages, marine structures, and heritage buildings illustrate how the principles from earlier chapters combine in practice. A typical bridge-deck rehabilitation involves chloride profiling, half-cell mapping, removal of delaminated concrete by hydrodemolition, installation of galvanic anodes at patch perimeters, replacement of corroded reinforcement, placement of a low-permeability repair concrete, and finally a protective waterproofing membrane and asphalt overlay. A parking-garage slab repair might add cathodic protection over the full deck area to extend service life by halting corrosion propagation system-wide. A historic building rehabilitation confronts additional constraints from reversibility, aesthetic preservation, and unknown internal materials, often favouring non-intrusive FRP strengthening over section enlargement.

The common thread is that rehabilitation decisions balance technical performance, cost, construction logistics, user disruption, and remaining service life. An optimal new design maximizes some engineering objective subject to a fixed budget. An optimal rehabilitation design, by contrast, chooses among imperfect alternatives, each of which interacts with an existing structure carrying decades of damage, incomplete records, and uncertain future exposure. The engineer's task is to make that choice defensible through disciplined investigation, physically grounded analysis, appropriate safety margins, and a monitoring plan that allows future adjustments when the structure's response departs from prediction.
