---
title: "CIVE 354: Geotechnical Engineering 2"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Das, B.M., *Principles of Foundation Engineering*, 9th ed., Cengage, 2019; Budhu, M., *Soil Mechanics and Foundations*, 4th ed., Wiley, 2019.

**Supplementary texts** — Bowles, J.E., *Foundation Analysis and Design*, 5th ed., McGraw-Hill, 1996; Craig, R.F., *Craig's Soil Mechanics*, 8th ed., CRC Press, 2012.

**Online resources** — MIT OCW 1.361 "Advanced Soil Mechanics"; Canadian Foundation Engineering Manual (CGS) public summaries; FHWA Geotechnical Engineering Circulars; ISO 22475 soil investigation standards (public summaries); USGS and GSC soil and rock properties databases.

---

# Chapter 1: Earth Pressure Theories

## 1.1 States of Stress in Soil

A retained soil mass exerts pressure on any structure containing it. Three characteristic states:

- **At-rest** (\( K_0 \)): no lateral movement, \( K_0 \approx 1 - \sin\phi' \) for normally consolidated.
- **Active**: wall moves away from soil; soil relaxes, pressure decreases.
- **Passive**: wall pushes into soil; soil compresses, pressure increases.

Small strains (0.1-1% of wall height) suffice to mobilize active state; larger (2-5%) for passive.

## 1.2 Rankine's Theory

Assumes smooth vertical wall, horizontal backfill. For cohesionless soil:

\[ K_a = \tan^2(45^\circ - \phi'/2), \quad K_p = \tan^2(45^\circ + \phi'/2). \]

Active/passive earth pressure at depth \( z \): \( p_a = K_a \gamma z \), \( p_p = K_p \gamma z \). For cohesive soil, \( \sigma'_a = K_a \sigma'_v - 2c'\sqrt{K_a} \); tension crack depth \( z_c = 2c'/(\gamma \sqrt{K_a}) \).

## 1.3 Coulomb's Theory

Handles wall friction (angle \( \delta \)) and inclined backfill. Earth pressure coefficient derived from limit equilibrium of wedge behind wall. Gives smaller \( K_a \) (friction on wall reduces soil weight mobilized) and larger \( K_p \) (friction aids passive resistance). Caution: Coulomb \( K_p \) overestimates passive resistance when \( \delta \) is large; log-spiral or more rigorous methods preferred.

## 1.4 Surcharge and Water

Surface loading \( q \) adds \( K_a q \) uniform pressure. Point and line loads generate distribution approximated by Boussinesq theory or empirical charts. Water pressure acts independently: total lateral pressure = effective earth pressure + pore water pressure.

# Chapter 2: Retaining Walls

## 2.1 Types

- **Gravity**: rely on self-weight (stone, mass concrete).
- **Cantilever**: RC with stem, heel, toe, using backfill weight above heel for stability.
- **Counterfort**: cantilever with bracing ribs, for taller heights.
- **Anchored**: sheet pile or soldier piles with tiebacks into soil.
- **MSE (mechanically stabilized earth)**: reinforced soil (geogrid, strip) with facing.

## 2.2 Stability Checks

For gravity/cantilever walls:

1. **Sliding**: FS = (resisting shear at base + passive) / active horizontal thrust ≥ 1.5.
2. **Overturning**: FS = moment of stabilizing forces / moment of overturning ≥ 2.0.
3. **Bearing capacity**: \( q_{max} \leq q_{allowable} \); check eccentricity within middle third.
4. **Global stability**: slope stability of wall + foundation + soil mass, FS ≥ 1.3.

## 2.3 Drainage

Water pressure behind walls doubles or triples earth thrust. Weep holes, drainage blankets, filter fabric, and drain pipes reduce pore pressures. Freeze-thaw considerations in cold climates: free-draining backfill prevents ice lensing pressures.

## 2.4 Design Process

Select wall type and geometry, compute lateral pressures, check stability, size reinforcement (for RC), detail drainage, consider constructability. Finite element analysis refines stress-strain response for complex geometries or sensitive sites.

# Chapter 3: Shallow Foundations

## 3.1 Bearing Capacity

Terzaghi's equation for strip footing:

\[ q_u = c'N_c + q N_q + \tfrac{1}{2}\gamma B N_\gamma, \]

with bearing capacity factors \( N_c, N_q, N_\gamma \) from \( \phi' \). Meyerhof, Hansen, and Vesic extensions add shape, depth, inclination, ground slope, and base-tilt factors. Eccentric loading handled via effective footing width \( B' = B - 2e \).

Allowable bearing capacity \( q_{all} = q_u/FS \) with FS typically 3.

## 3.2 Settlement

Total settlement = immediate (elastic) + consolidation + secondary (creep).

Elastic: \( s_i = q B (1-\nu^2)I_s/E_s \), with influence factor \( I_s \) (rigid vs flexible, shape) and soil modulus \( E_s \).

Consolidation (clay):

\[ s_c = \frac{C_c H}{1+e_0}\log\!\frac{\sigma'_{v,0} + \Delta\sigma}{\sigma'_{v,0}}. \]

Rate from Terzaghi 1D consolidation theory; time factor \( T_v = c_v t/H_d^2 \).

Typical allowable settlements: 25 mm total, 20 mm differential for ordinary buildings; stricter for sensitive structures.

## 3.3 Footing Types

Spread (isolated), combined (for adjacent columns or property-line eccentricity), strap (eccentric footings linked by strap beam), mat/raft (single footing for entire structure). Mat foundations appropriate when footings would overlap 50%+ of plan area.

## 3.4 Design Considerations

Frost depth (below frost line in cold climates; 1.2-2 m in Canada). Adjacent excavations (loss of confinement). Water table (reduces effective stress, affects \( q_u \)). Expansive or collapsible soils (replace, treat, or design to tolerate movement).

# Chapter 4: Deep Foundations

## 4.1 When Deep?

Weak surface soils, high loads, large lateral or uplift, scour at bridge piers, expansive soils. Deep foundations transfer load to competent strata by end-bearing, shaft friction, or both.

## 4.2 Pile Types

- **Driven**: steel H-piles, steel pipe (open or closed), precast concrete, timber. Dynamic installation; capacity correlates with pile driving analysis (PDA, CAPWAP).
- **Drilled shafts (caissons)**: augered or slurry-supported excavation, cast in place. Suitable for large diameter, varied soil, or sensitive neighbors.
- **CFA (continuous flight auger)**: auger + grout, mid-range.
- **Micropiles**: small diameter, drilled and grouted; used in restricted access or low-capacity retrofits.

## 4.3 Axial Capacity

Total: \( Q_u = Q_p + Q_s \) (point + shaft).

End bearing in cohesionless: \( q_p = \sigma'_v N_q \); in cohesive: \( q_p = 9 c_u \).

Shaft friction: \( f_s = K \sigma'_v \tan\delta \) (cohesionless, \( \alpha \)-method, \( \beta \)-method). Cohesive: \( f_s = \alpha c_u \) (API/Tomlinson). Allowable: FS 2-3.

## 4.4 Lateral Capacity

Laterally loaded piles analyzed by \( p \)-\( y \) methods: soil reaction per unit length as function of lateral deflection at each depth. Reese and Matlock criteria for soft clay, stiff clay, sand. Finite element or LPILE software solves the beam-on-nonlinear-foundation.

## 4.5 Group Effects

Piles in groups interact. Group efficiency \( \eta < 1 \) (friction piles in clay, pile soil block fails rather than individual piles); can be \( > 1 \) in sand (driven piles densify intermediate soil). Center-to-center spacing typically 3-4 diameters.

# Chapter 5: Braced Excavations

## 5.1 Excavation Systems

- **Soldier piles with lagging**: vertical soldier beams drilled on centers, timber or steel lagging between; common for urban excavations.
- **Sheet piles**: interlocking steel sections driven; water-resistant.
- **Secant piles**: overlapping drilled concrete piles; rigid, water-resistant.
- **Slurry (diaphragm) walls**: panel-by-panel excavation with bentonite, RC; very rigid, used for deep cofferdams.
- **Soil nailing**: horizontal grouted bars stabilize faces from within.

## 5.2 Support Systems

- **Internal bracing (struts)**: across excavation, efficient but obstructs work.
- **Rakers**: angled struts from corner.
- **Tiebacks (anchors)**: drilled into retained soil, grouted, stressed; unobstructed work area.

## 5.3 Earth Pressure on Braced Cuts

Unlike rigid walls, braced cuts rarely allow full active state to develop. Terzaghi-Peck empirical pressure diagrams (trapezoidal for sand, rectangular for soft clay) are used for strut design. Apparent earth pressure coefficient is higher than Rankine active.

## 5.4 Ground Movements

Excavations cause ground settlement behind the wall. Peck's envelopes relate settlement to distance, categorized by soil type. In soft clay, settlements at 1-2% of excavation depth are common; tighter control (< 0.5%) needs stiffer walls and pre-loaded supports. Damage assessment on nearby structures uses angular distortion (Skempton, Boscardin-Cording).

# Chapter 6: Slope Stability

## 6.1 Modes of Failure

Rotational (curved slip surface, typical in homogeneous clay), translational (planar along weak layer), wedge (in rock along two intersecting joints), flow (saturated materials). Identification from site investigation informs analysis method.

## 6.2 Method of Slices

Divide slip mass into vertical slices; apply force/moment equilibrium to each. Ordinary method of slices (Fellenius), Bishop's simplified, Spencer, Morgenstern-Price, Janbu differ in assumptions about interslice forces and rigor. Spencer and Morgenstern-Price satisfy full equilibrium.

\( FS \) = resisting moment / driving moment. Acceptable values: 1.3-1.5 (permanent slopes), 1.25 (temporary), 1.1-1.2 (seismic, pseudo-static).

## 6.3 Effective Stress vs Total Stress

Drained analysis (effective stress, \( c' \), \( \phi' \)): long-term condition. Undrained (total stress, \( c_u \)): immediately after excavation or loading in clay. Critical condition varies by loading rate, soil permeability, boundary drainage. Example: cut slope in clay is most stable initially, least stable years later after equilibration of pore pressures; fill slope on clay is least stable immediately.

## 6.4 Stabilization

Flatten slope, add berm or buttress at toe, drain water (horizontal drains, dewatering wells, surface grading), reinforce (nails, piles, soil anchors), reduce driving weight (lightweight fill, benches), or modify material (compaction, chemical stabilization, preloading). Instrumentation (inclinometers, piezometers, survey prisms) monitors performance.

<div class="remark">
Foundation and retaining-wall engineering applies soil mechanics to the realities of structures resting on and retained by soils. Equations abstract; actual ground is variable, often surprising, and unforgiving of assumptions. Competent practice integrates investigation, analysis, construction knowledge, and observation during work.
</div>
