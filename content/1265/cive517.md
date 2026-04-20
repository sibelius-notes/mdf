---
title: "CIVE 517: Structural Wood Design"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Breyer, D. E., Fridley, K. J., Cobeen, K. E., and Pollock, D. G., *Design of Wood Structures — ASD/LRFD*; Williamson, T. G. (ed.), *APA Engineered Wood Handbook*.

**Supplementary texts** — Canadian Wood Council, *Wood Design Manual*; Porteous, J. and Kermani, A., *Structural Timber Design to Eurocode 5*; Thelandersson, S. and Larsen, H. J. (eds.), *Timber Engineering*.

**Online resources** — Canadian Wood Council public technical bulletins and *Introduction to Wood Design*; APA — The Engineered Wood Association technical notes; FPInnovations open reports on mass timber; CSA O86 *Engineering Design in Wood* public commentary; US Forest Products Laboratory *Wood Handbook* (General Technical Report FPL-GTR-190).

---

# Chapter 1: Wood as an Engineering Material

Wood is a renewable, cellular, anisotropic biological composite. Its structure — parallel tubular cells of cellulose reinforced in a lignin matrix — produces dramatic directional differences in strength and stiffness. Understanding these properties is the foundation of structural wood design.

## 1.1 Anatomy and Orthotropy

Softwood lumber (spruce, pine, fir, hemlock, Douglas fir) dominates North American construction. The longitudinal grain direction has an elastic modulus on the order of \(10\text{–}14\ \text{GPa}\); radial and tangential moduli are roughly an order of magnitude lower. For engineering purposes wood is modelled as **orthotropic** with three principal axes (longitudinal, radial, tangential), but most design calculations distinguish only parallel-to-grain and perpendicular-to-grain properties.

## 1.2 Moisture Content and Shrinkage

Wood is hygroscopic. Below the **fibre saturation point** (\(\approx 30\%\) moisture content) further drying causes shrinkage; above it, free water fills the lumens without dimensional change. Tangential shrinkage from green to oven-dry can be 6–8%; radial 3–5%; longitudinal negligible. Design moisture conditions — dry service (MC ≤ 15%) or wet — affect specified strengths.

## 1.3 Defects, Grading, and Engineered Wood

Natural defects — knots, slope of grain, splits, wane — reduce strength. **Visual** and **machine stress-rated** grading classify lumber into strength classes. Engineered wood products overcome natural variability: **glulam** (glued laminated timber), **LVL** (laminated veneer lumber), **PSL** (parallel strand lumber), **LSL** (laminated strand lumber), **CLT** (cross-laminated timber), and plywood/OSB sheathing. CLT panels use orthogonally oriented layers to achieve two-way behaviour and dimensional stability.

<div class="definition">
<strong>Specified strength.</strong> The characteristic strength value listed in design standards after adjustment for size, duration of load, moisture, treatment, and system effects. In CSA O86 the factored resistance combines specified strength with a resistance factor φ.
</div>

# Chapter 2: Limit States Design for Wood

## 2.1 Design Philosophy

Canadian wood design uses **limit states design** in CSA O86. Factored resistances must exceed factored load effects:

\[
\phi R_n \ge \sum \alpha_i Q_i
\]

Resistance factors reflect material variability (\(\phi = 0.9\) for sawn lumber flexure, for example), while load factors come from the *National Building Code*.

## 2.2 Modification Factors

Specified strengths are adjusted by modifiers:

- \(K_D\) — duration of load (short, standard, permanent);
- \(K_{S}\) — service condition (dry vs wet);
- \(K_T\) — treatment (incising, preservatives);
- \(K_H\) — system factor recognizing load sharing;
- \(K_Z\) — size factor.

For example, the factored bending resistance of a sawn lumber beam is

\[
M_r = \phi\, F_b\, S\, K_D K_H K_{Sb} K_T K_{Zb} K_L
\]

where \(S\) is the section modulus and \(K_L\) the lateral stability factor.

# Chapter 3: Beams and Joists

## 3.1 Flexure

Bending stresses are checked at the extreme fibre. For a rectangular section \(S = bd^2/6\). Because wood's tension strength parallel to grain is significantly lower than its compression strength (tension failures are brittle), designers avoid heavy notches on the tension edge.

## 3.2 Shear

Shear parallel to grain is the governing mode in short, heavily loaded beams. Factored shear resistance for a rectangular section is

\[
V_r = \phi F_v\,\tfrac{2}{3} bd\, K_D K_{Sv} K_T K_{Zv}
\]

where \(F_v\) is the specified shear strength. Checks are performed at the distance \(d\) from supports.

## 3.3 Lateral Torsional Stability

Tall, narrow beams buckle laterally under load. The lateral stability factor \(K_L\) reduces the bending resistance when the compression edge is inadequately restrained. Full-depth blocking or continuous sheathing typically provides \(K_L = 1.0\).

## 3.4 Deflection

Serviceability limits bound live-load deflection (often \(L/360\)) and total-load deflection (often \(L/240\)). Creep deflection under sustained load can double the initial elastic deflection in wet service.

<div class="example">
<strong>Joist sizing.</strong> A 38 × 235 mm spruce–pine–fir joist at 400 mm on centre, spanning 4.0 m, supports a residential floor (1.9 kPa live, 0.5 kPa dead). Factored moment and shear are computed, lateral support from sheathing and bridging gives <em>K<sub>L</sub> ≈ 1.0</em>, and the controlling check is usually live-load deflection to <em>L/360 ≈ 11 mm</em>, verified via <em>&Delta; = 5wL<sup>4</sup>/(384EI)</em>.
</div>

# Chapter 4: Columns

## 4.1 Compression Parallel to Grain

Axially loaded columns fail by crushing (short columns), elastic buckling (slender), or inelastic buckling (intermediate). CSA O86 uses the slenderness ratio \(C_c = L_e/d\) and an empirical column equation

\[
K_C = \left[1 + \frac{F_c\,K_D K_{Sc} K_T}{35\, E_{05}\, K_{SE}\, K_T}\,C_c^3\right]^{-1}
\]

which smoothly transitions between crushing and Euler buckling.

## 4.2 Combined Axial and Bending

Beam–columns are checked using an interaction equation

\[
\left(\frac{P_f}{P_r}\right)^2 + \frac{M_f}{M_r\,(1 - P_f/P_E)} \le 1.0
\]

with a \(P\)-delta amplification through the Euler load \(P_E\).

## 4.3 Bearing Perpendicular to Grain

At beam supports, crushing perpendicular to grain governs. The bearing area is chosen to satisfy \(Q_r = \phi F_{cp} A_b K_B K_{Zcp}\) with \(K_B\) a length-of-bearing modifier.

# Chapter 5: Connections

Connections dominate the design and often the cost of timber structures.

## 5.1 Dowel-Type Fasteners

Nails, screws, bolts, and dowels transfer load by bending of the fastener and embedment of the wood. **European Yield Model** (EYM) equations derived by Johansen give six possible yield modes based on whether the wood crushes on one or both sides and whether the fastener forms one or two plastic hinges. For a single-shear connection with thin side member,

\[
Z = \min\left\{f_{es}\,d\,\ell_s,\ \ \frac{1}{\gamma}\sqrt{\tfrac{2}{3}f_y\,f_{es}\,d^3},\ \dots\right\}
\]

CSA O86 tabulates factored lateral resistances with geometric, row, and group factors to account for end distance, edge distance, spacing, and group action.

## 5.2 Shear Plates and Split Rings

For heavy timber, shear plates and split-ring connectors enlarge the effective bearing area and develop high per-fastener capacities. These are often used in heavy trusses and glulam connections.

## 5.3 Modern Connections

Self-tapping screws, glued-in rods, and steel side plates with dowels have enabled the current generation of mass timber structures. Concealed knife-plate connectors preserve fire resistance by protecting steel within the member.

# Chapter 6: Shear Walls, Diaphragms, and Mass Timber Buildings

## 6.1 Diaphragm Action

A floor or roof sheathed with plywood or OSB acts as a deep beam resisting in-plane lateral loads. The **shear flow** \(v\) around the perimeter is the total diaphragm shear divided by the depth. Chord forces in the boundary members are \(T = C = M/b\) where \(M\) is the diaphragm moment and \(b\) the depth.

## 6.2 Shear Walls

A shear wall transfers lateral forces from the diaphragm above to the diaphragm or foundation below. The unit shear capacity depends on sheathing thickness, nail size, and nail spacing along panel edges. Overturning is resisted by hold-down anchors at the wall ends; the tension in the hold-down is

\[
T = \frac{V\,h}{L} - \frac{w_D L}{2}
\]

where \(V\) is the lateral force at the top of the wall, \(h\) is the wall height, \(L\) the wall length, and \(w_D\) the dead load tributary to the wall.

## 6.3 Mass Timber Systems

Cross-laminated timber enables mid-rise and tall wood buildings. Two-way CLT slabs are analyzed using orthotropic plate theory or simplified strip methods. Fire resistance of mass timber is achieved through **char layer** protection: wood chars at a predictable rate (\(\approx 0.65\ \text{mm/min}\) for softwoods), and the remaining uncharred section is checked for load capacity at the end of the required fire duration. The char rate enters design via

\[
d_{\text{char}} = \beta_0\, t
\]

with the residual depth \(d_{\text{res}} = d_0 - d_{\text{char}} - d_{\text{zero-strength}}\) used for structural checks. This calculable fire behaviour is a key reason mass timber has entered the tall-building envelope once occupied by steel and concrete alone.

The modern wood designer works fluently with anisotropy, moisture, creep, duration-of-load effects, and detailed connection mechanics, producing structures that are efficient, expressive, and — in their embodied carbon — well aligned with a decarbonizing construction industry.
