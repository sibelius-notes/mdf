---
title: "CIVE 415: Structural System Design"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — MacGregor, J. G. and Bartlett, F. M., *Reinforced Concrete: Mechanics and Design*; Salmon, C. G., Johnson, J. E., and Malhas, F. A., *Steel Structures: Design and Behavior*.

**Supplementary texts** — Taranath, B. S., *Structural Analysis and Design of Tall Buildings*; Chen, W. F. and Duan, L., *Bridge Engineering Handbook*; Gaylord, E. H., Gaylord, C. N., and Stallmeyer, J. E., *Design of Steel Structures*.

**Online resources** — MIT OpenCourseWare 1.054 *Mechanics and Design of Concrete Structures*; National Research Council of Canada, *National Building Code of Canada* (NBCC) commentary; AISC *Steel Construction Manual* design examples; CSA S16 *Design of Steel Structures* and CSA A23.3 *Design of Concrete Structures* open commentary materials; FHWA *LRFD Bridge Design Specifications* training modules.

---

# Chapter 1: Loads on Building Structures

The starting point for every structural system is the realistic characterization of the forces it must resist. Loads are never single deterministic numbers; they are random variables whose statistics inform the **load factors** and **resistance factors** that appear in modern limit-states codes. A complete design must account for dead, live, snow, wind, earthquake, thermal, and construction loads, as well as the load paths through which these effects travel to the foundation.

## 1.1 Dead, Live, and Environmental Loads

**Dead loads** arise from the self-weight of permanent construction. They are estimated from geometry and material densities. Concrete at roughly \(24\ \text{kN/m}^3\), structural steel at \(77\ \text{kN/m}^3\), and wood framing at \(5\text{–}7\ \text{kN/m}^3\) are representative values. **Live loads** are occupancy-related. Codes tabulate minimum specified uniform and concentrated live loads by occupancy type. Live-load reduction is permitted for members supporting large tributary areas, reflecting the reduced probability that all areas are simultaneously at peak occupancy.

**Snow load** on a roof is computed from a ground snow load \(S_s\) together with basic, exposure, slope, and shape factors:

\[
S = I_s\bigl(S_s(C_b C_w C_s C_a) + S_r\bigr)
\]

where \(I_s\) is the importance factor, \(C_b\) the basic roof snow load factor, \(C_w\) the wind exposure factor, \(C_s\) the slope factor, \(C_a\) the accumulation factor, and \(S_r\) the associated rain load.

## 1.2 Wind Pressures

Wind pressure on a building surface is obtained from the reference velocity pressure \(q\) scaled by exposure, gust, and pressure coefficients:

\[
p = I_w\, q\, C_e\, C_g\, C_p
\]

The external pressure coefficient \(C_p\) depends on wall versus roof, windward versus leeward, and the building aspect ratio. For tall or wind-sensitive structures a **dynamic gust procedure** replaces the static \(C_g\).

## 1.3 Seismic Base Shear

The equivalent static seismic force is

\[
V = \frac{S(T_a)\, M_v\, I_E\, W}{R_d R_o}
\]

where \(S(T_a)\) is the design spectral acceleration at the fundamental period \(T_a\), \(M_v\) accounts for higher-mode effects, \(I_E\) is the importance factor, \(W\) is the seismic weight, and \(R_d R_o\) are ductility and overstrength modification factors.

<div class="definition">
<strong>Limit states design.</strong> A structure satisfies the <em>ultimate limit state</em> when factored resistances exceed factored load effects, and satisfies the <em>serviceability limit state</em> when deflections, vibrations, and cracking remain within tolerable levels under specified (unfactored) loads.
</div>

# Chapter 2: Lateral Load Resisting Systems

Buildings must resist lateral loads from wind and earthquakes through a coherent three-dimensional system of floors, columns, and bracing. The floor diaphragms collect inertial and wind forces and distribute them to vertical elements — shear walls, braced frames, or moment frames — that carry the forces down to the foundation.

## 2.1 Moment Frames

In a **moment-resisting frame** rigid beam-to-column connections develop bending moments that stabilize the frame laterally. Drift under lateral load is typically dominated by flexural deformation of the columns and shear deformation of the panel zones. An approximate portal-frame analysis distributes the total story shear \(V\) among \(n\) columns and assumes inflection points at mid-height of columns and mid-span of beams, giving column shears \(V_c \approx V/n\) and beam shears following from equilibrium.

## 2.2 Braced Frames

Concentric braced frames use diagonal axial members to form a vertical truss. The brace forces under lateral load \(H\) at story \(i\) are \(F_i = H_i/\cos\theta\), where \(\theta\) is the brace angle from horizontal. **Eccentrically braced frames** introduce short links that yield in shear and dissipate seismic energy.

## 2.3 Shear Walls and Core Systems

Shear walls behave as vertical cantilevers. The lateral deflection at the top of a uniform cantilever wall of height \(H\) under a uniformly distributed lateral load \(w\) is

\[
\Delta = \frac{wH^4}{8EI} + \frac{wH^2}{2GA_s}
\]

combining flexural and shear components. Coupled walls, in which piers are linked by deep beams, provide efficient lateral resistance by mobilizing axial tension–compression couples.

<div class="example">
<strong>Tributary lateral force.</strong> A ten-story building of uniform plan receives a total wind base shear of <em>V = 4000 kN</em>. If four identical shear walls share the load equally and each wall has height <em>H = 40 m</em>, flexural stiffness <em>EI = 5 × 10⁹ kN·m²</em>, and shear stiffness <em>GA<sub>s</sub> = 4 × 10⁶ kN</em>, the tip deflection of one wall under a triangular distribution is on the order of tens of millimetres, well below the common <em>H/500</em> drift limit.
</div>

# Chapter 3: Floor Systems

The floor is both a gravity element and a lateral diaphragm. Economy depends on matching span, loading, and architectural constraints to an appropriate system.

## 3.1 One-Way and Two-Way Slabs

**One-way slabs** span between parallel supports; reinforcement is primarily in the short direction. **Two-way slabs** distribute load to supports on all four sides. Direct design and equivalent frame methods, based on moment coefficients, apportion positive and negative moments between middle and column strips. Punching shear at interior columns requires verification using a critical section located \(d/2\) from the column face, with factored shear stress compared to the concrete resistance \(v_c\).

## 3.2 Composite Steel–Concrete Floors

In a composite beam, shear studs transfer longitudinal shear between the steel section and a concrete slab cast on a profiled deck. The nominal flexural resistance is governed by plastic analysis of the composite section. If the slab can fully develop its compression capacity \(C = 0.85 f'_c\, b_{\text{eff}}\, a\), and the steel section fully yields in tension \(T = A_s F_y\), equilibrium sets \(C = T\) and locates the plastic neutral axis, from which the moment arm and plastic moment follow.

## 3.3 Vibration Serviceability

Floor vibrations from walking must be controlled. The first natural frequency of a simply supported beam is

\[
f_n = \frac{\pi}{2}\sqrt{\frac{EI}{mL^4}}
\]

A common acceptability criterion is \(f_n > 8\ \text{Hz}\) for office floors; more refined criteria use peak acceleration under a walking forcing function.

# Chapter 4: Composite Construction Details

## 4.1 Shear Connectors

The number of headed studs between a maximum moment location and an adjacent zero-moment point equals the horizontal shear divided by the design resistance \(q_r\) of a single stud. For full shear connection,

\[
n = \frac{\min(C_{\max}, T_{\max})}{q_r}
\]

## 4.2 Effective Width and Creep

The **effective slab width** is taken as the minimum of one quarter span, spacing between beam centrelines, and twelve times the slab thickness. Long-term creep of the concrete reduces composite stiffness; a modular ratio \(n = E_s/E_c\) adjusted for sustained loading is used in elastic deflection calculations.

## 4.3 Construction Sequence Effects

Unshored construction requires the bare steel section to carry the wet concrete and construction loads, while the composite section carries only subsequent superimposed loads. Deflections are computed in two stages and superposed.

# Chapter 5: Introduction to Bridge Design

## 5.1 Load Combinations

Canadian bridge design follows CSA S6, using load combinations that include dead load, live load (the CL-625 truck or lane load), dynamic load allowance, wind, thermal effects, earthquake, and, where applicable, ice and stream pressure. The impact factor (dynamic load allowance) is applied to the static live load to model vehicle dynamics.

## 5.2 Girder Distribution

A multi-girder bridge distributes a single truck across several parallel girders. Distribution factors from code tables or from grillage or finite-element analysis give the fraction of axle load carried by each girder. For a simple span under a moving truck, the absolute maximum bending moment occurs when the resultant of the axles and a neighbouring axle straddle the span centreline symmetrically — a classical result from influence-line analysis.

## 5.3 Fatigue

Steel bridge components experience millions of stress cycles. Fatigue life is evaluated using S–N curves tied to detail categories. Miner's rule gives the cumulative damage

\[
D = \sum_i \frac{n_i}{N_i}
\]

with failure predicted at \(D = 1\). Weld toes, cover-plate terminations, and intermittent welds are high-risk details.

# Chapter 6: Special Topics in Structural Systems

## 6.1 Performance-Based Design

Performance-based design specifies discrete performance objectives — immediate occupancy, life safety, collapse prevention — and demonstrates that the structure meets each under a corresponding hazard level. Nonlinear static (pushover) and nonlinear response-history analyses provide the demands.

## 6.2 Progressive Collapse

Following sudden local damage, a structure must resist disproportionate collapse. The **alternate load path method** analyses the structure with one column notionally removed, checking that remaining members redistribute the load by catenary or membrane action.

## 6.3 Constructability and Integration

A practical structural system integrates with mechanical, electrical, and architectural systems. Coordinated penetrations through beams and walls, tolerances for prefabrication, and an explicit stability system during erection are essential. The lateral system must be continuous from roof to foundation, with a clear path to the ground that the engineer can trace on a single sketch. This discipline — sizing members, detailing connections, and drawing a coherent load path — is the central craft of structural system design.
