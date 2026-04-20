---
title: "CIVE 413: Structural Steel Design"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Salmon, C.G., Johnson, J.E., and Malhas, F.A., *Steel Structures: Design and Behavior*, 5th ed., Pearson, 2009; Kulak, G.L. and Grondin, G.Y., *Limit States Design in Structural Steel*, 11th ed., CISC, 2020.

**Supplementary texts** — McCormac, J.C. and Csernak, S.F., *Structural Steel Design*, 6th ed., Pearson, 2018; Chen, W.F. and Lui, E.M., *Stability Design of Steel Frames*, CRC Press, 1991.

**Online resources** — MIT OCW 1.051 "Structural Engineering Design"; AISC (American Institute of Steel Construction) steel manual excerpts; CISC Handbook of Steel Construction summaries; CSA S16 "Design of Steel Structures" (public overview).

---

# Chapter 1: Limit States Design Philosophy

## 1.1 Ultimate and Serviceability Limit States

Limit states design requires that structures satisfy:

\[ \phi R_n \geq \sum \alpha_i Q_i, \]

with resistance factor \( \phi \), nominal resistance \( R_n \), load factors \( \alpha_i \), and specified loads \( Q_i \). Ultimate limit states (ULS) guard against collapse; serviceability limit states (SLS) govern deflection, vibration, cracking of cladding, occupant comfort.

Resistance factors in CSA S16: \( \phi = 0.90 \) for tension, compression, flexure; 0.67 for bolt shear; 0.75 for weld ultimate.

## 1.2 Load Combinations

NBCC load combinations include 1.4 D, 1.25 D + 1.5 L, 1.25 D + 1.5 S + 0.5 L, etc. Environmental loads (snow, wind, earthquake) combine with companion factors reflecting low joint-probability of simultaneous maxima.

## 1.3 Steel Materials

ASTM A992 and CSA G40.20/21 grades 350W, 350A. Yield stress \( F_y \) typically 350 MPa; ultimate \( F_u \) 450-490 MPa. Modulus \( E = 200 \) GPa. Weathering steels (A588/350W), high-strength (480, 700 MPa), and stainless steels serve specific applications.

Ductility critical: minimum 20-22% elongation required. Toughness (Charpy V-notch) for dynamic or cold-service applications.

## 1.4 Connections Philosophy

Bolted and welded connections must transmit full member capacity while accommodating fabrication and erection tolerances. Economy: simple, repeatable details; minimize field welding; use standardized bolt sizes.

# Chapter 2: Tension Members

## 2.1 Gross and Net Section

Gross area \( A_g \) = total cross-section. Net area \( A_n = A_g - \sum (d+2)t \) deducts bolt holes (hole diameter + 2 mm for clearance/damage).

For staggered holes (s\(^2\)/4g rule):

\[ A_n = A_g - \sum (d+2) t + \sum \frac{s^2}{4g} t. \]

## 2.2 Effective Net Area

Shear lag reduces effective area when not all elements of section are connected:

\[ A_e = U A_n, \quad U = 1 - \bar x/L. \]

\( U \) for common sections and connection lengths tabulated. For angles connected through one leg, \( U \) can be as low as 0.6.

## 2.3 Design Equations

\[ T_r = \phi A_g F_y, \quad T_r = 0.85 \phi A_n F_u, \]

both checked; governing controls. Block shear:

\[ T_r = \phi(0.6 A_{gv} F_y + A_{nt} F_u) \text{ or } \phi(0.6 A_{nv} F_u + U_{bs} A_{nt} F_u), \]

whichever smaller, within Canadian Code formulation.

## 2.4 Serviceability

Tension members should satisfy slenderness \( L/r \leq 300 \) for primary, 240 for secondary to limit flexibility and avoid handling damage. No strict yield deflection limit.

# Chapter 3: Compression Members

## 3.1 Euler Buckling and Inelastic Behavior

Elastic buckling stress:

\[ F_e = \frac{\pi^2 E}{(KL/r)^2}. \]

Effective length factor \( K \): 1.0 for pinned-pinned, 0.5 for fixed-fixed, 0.7 for fixed-pinned, 2.0 for fixed-free. Actual \( K \) in frames from nomographs or second-order analysis.

Real columns fail inelastically for low slenderness due to residual stresses and initial imperfections. SSRC curves or CSA S16 equation:

\[ \lambda = \sqrt{F_y/F_e}, \quad C_r = \phi A F_y (1 + \lambda^{2n})^{-1/n}, \]

with \( n = 1.34 \) for hot-rolled.

## 3.2 Local Buckling

Compact sections develop full plastic capacity; non-compact sections develop yield; slender sections buckle locally before yielding. Width-to-thickness limits (flange b/t, web h/t) depend on steel grade.

## 3.3 Laterally Unsupported Beams

When compression flange is not continuously braced, lateral-torsional buckling (LTB) governs. Elastic LTB moment:

\[ M_{cr} = \frac{\pi}{L}\sqrt{EI_y GJ + \left(\frac{\pi E}{L}\right)^2 I_y C_w}. \]

\( C_b \) factor adjusts for moment gradient. CSA S16 design:

\[ M_r = \phi M_p \text{ or } \phi M_{u}, \]

depending on whether \( M_u \) is greater or less than 0.67 \( M_p \); intermediate-length beams interpolated.

## 3.4 Beam-Columns

Members carrying both axial compression and bending (frame columns) use interaction equations:

\[ \frac{C_f}{C_r} + \frac{0.85 U_1 M_{fx}}{M_{rx}} + \frac{\beta U_1 M_{fy}}{M_{ry}} \leq 1.0, \]

with amplification factor \( U_1 = \omega_1/(1 - C_f/C_e) \) for P-delta effects.

# Chapter 4: Beams

## 4.1 Plastic and Yield Moments

For compact sections fully braced: \( M_p = Z_x F_y \), plastic modulus \( Z_x \). For non-compact: \( M_y = S_x F_y \). Plastic analysis allows moment redistribution in indeterminate structures, typically giving 10-20% capacity increase.

## 4.2 Shear

\( V_r = \phi A_w F_s \) with \( F_s \) = \( 0.66 F_y \) (shear yield) for compact web. Slender webs (deep girders) check buckling:

\[ F_s = \frac{(180000)k_v}{(h/w)^2}. \]

Stiffeners added to control web buckling and increase \( F_s \) via tension field action.

## 4.3 Deflection

\[ \Delta_{max} = \frac{5 w L^4}{384 EI} \text{ for simple span UDL}. \]

Serviceability limits: L/360 live load, L/240 total for general floors; stricter for brittle finishes.

## 4.4 Composite Beams

Steel beam with concrete slab connected by shear studs acts compositely. Effective slab width, transformed section. Significantly stiffer and stronger (~30-50%) than bare beam; widely used in buildings and bridges.

# Chapter 5: Plate Girders

## 5.1 Proportioning

Plate girders (built-up I sections with slender webs) used when rolled sections insufficient. Web depth typically L/10 to L/15. Web slenderness h/w 100-260. Flange sized for moment, web for shear.

## 5.2 Flexural Strength

Webs too slender for compact moment capacity; reduction factor applied:

\[ M_r = \phi S_{xt} F_y [1 - (h_c/w - r_1)/r_2], \]

where \( r_1, r_2 \) are parameters from code.

Compression-flange lateral bracing and local buckling checks as for rolled beams.

## 5.3 Shear and Stiffeners

Intermediate vertical stiffeners enable tension field action: web diagonal tension + flange compression. Basler-based post-buckling shear strength. Stiffener spacing 2.5 h or based on aspect ratio.

Bearing stiffeners at supports and concentrated loads resist web crippling. Transverse stiffeners designed to prevent web buckling; detail properly welded to flanges and web.

## 5.4 Longitudinal Stiffeners

Single longitudinal stiffener at h/5 from compression flange effective in increasing bending strength when web is deep. Required for bridges with large moment-shear combinations.

# Chapter 6: Connections

## 6.1 Bolted Connections

High-strength bolts (ASTM F3125 Grade A325, A490, ASTM F3148) in slip-critical or bearing-type connections. Slip-critical transfers load by friction between plies; bearing-type permits slip and transfers load by shear in bolt + bearing on plates.

Bolt shear: \( V_r = 0.6 \phi_b A_b F_u \) (threads excluded from shear plane) or 0.7 factor (threads included).

Bearing on connected plate: \( B_r = 3 \phi A_b F_u \); check edge distance.

## 6.2 Welded Connections

Fillet weld capacity:

\[ V_r = \phi_w (0.67)(0.707) w L X_u, \]

with weld leg \( w \), length \( L \), filler metal tensile \( X_u \) (typically 490 MPa for E490). Minimum weld sizes per plate thickness; maximum limited by base metal thickness.

Complete joint penetration (CJP) welds develop base metal strength; partial (PJP) designed for effective throat.

## 6.3 Moment Connections

Rigid moment connections transfer beam flange forces through columns. Details: bolted flange-plate (BFP), reduced beam section (RBS, dog-bone), end plate (4E, 8E), fully welded. RBS prevalent in seismic: creates plastic hinge away from column face.

Column panel zone: must transfer shear from adjacent beam moments without yielding or requiring doublers.

## 6.4 Shear Connections

Simple (shear-only) connections: single-plate (shear tab), double-angle, shear end plate, seated. Design for beam reaction; must have rotational capacity consistent with "simple" idealization.

# Chapter 7: Special Topics

## 7.1 Seismic Design

Ductile systems dissipate energy through controlled inelastic response. Systems: moment-resisting frame (MRF), braced frame (CBF), eccentrically braced frame (EBF), buckling-restrained braced frame (BRBF). Capacity design: weak beam / strong column, strong connection / weak member to avoid brittle failures.

## 7.2 Fatigue

Cyclic loading (cranes, bridges, wind) causes fatigue crack initiation and propagation. S-N curves (stress range vs cycles to failure) stratified by detail category. Constant-amplitude and variable-amplitude loading both considered; Miner's rule for damage summation.

## 7.3 Fire Protection

Steel loses ~50% strength at 550 °C. Passive fire protection: spray-applied cementitious, board, intumescent coatings. Active: sprinklers. Fire resistance ratings (1-4 hours) based on heat transfer analysis and tests per CAN/ULC-S101.

## 7.4 Other Metals

Aluminum: low density (1/3 of steel), lower modulus (1/3), no clear yield, corrosion-resistant. Stainless: higher strength at elevated temperature, cold-formed behavior different. Each with its own design standard.

<div class="remark">
Structural steel design integrates material behavior, instability theory, and connection detailing in a framework of limit states and load combinations. Textbook equations translate into routine practice when paired with steel manual tables, fabrication knowledge, and judgment tempered by code. A safe, efficient, buildable design is the goal&mdash;overly complex geometry or marginal connections betray lack of practice.
</div>
