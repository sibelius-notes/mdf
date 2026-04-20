---
title: "CIVE 414: Structural Concrete Design"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — MacGregor, J.G. and Wight, J.K., *Reinforced Concrete: Mechanics and Design*, 7th ed., Pearson, 2015; Nilson, A.H., Darwin, D., and Dolan, C.W., *Design of Concrete Structures*, 15th ed., McGraw-Hill, 2016.

**Supplementary texts** — Collins, M.P. and Mitchell, D., *Prestressed Concrete Structures*, Response Publications, 1997; Park, R. and Paulay, T., *Reinforced Concrete Structures*, Wiley, 1975.

**Online resources** — MIT OCW 1.054 "Mechanics and Design of Concrete Structures"; ACI 318 public summaries; CSA A23.3 "Design of Concrete Structures" public documents; fib (International Federation for Structural Concrete) publications.

---

# Chapter 1: Material Behavior

## 1.1 Concrete

Composition: cement, water, fine aggregate, coarse aggregate, sometimes supplementary cementitious materials (fly ash, slag, silica fume) and admixtures. Water-cement ratio primarily governs strength: lower w/c = higher strength but lower workability.

Compressive strength \( f'_c \) measured on 150 mm cylinders at 28 days; typical building concrete 25-40 MPa; high-strength 50-100 MPa. Tensile strength ~10% of compressive, neglected in design.

Stress-strain curve: roughly linear to \( 0.5 f'_c \), curves, peaks near 0.002 strain, descends. Modulus of elasticity:

\[ E_c = 4500\sqrt{f'_c} \text{ MPa} \text{ (CSA A23.3 normal density)}. \]

Shrinkage and creep: long-term deformations of 0.0005-0.001 total strain depending on humidity, load age, size.

## 1.2 Reinforcement

Rebar: deformed steel bars, grade 400W (yield 400 MPa, CSA G30.18). Prestressing strands (7-wire, grade 1860 MPa). Welded wire fabric. Fiber reinforcement (steel, synthetic) supplements conventional rebar in specific applications.

Bond: interlock of ribs with surrounding concrete; development length ensures yield strength can be mobilized. Anchorage at ends via hooks or mechanical devices.

## 1.3 Behavior of Reinforced Concrete

Plain concrete cracks at low tensile strain. Reinforcement bridges cracks, enabling the section to carry tension. Design permits concrete cracking; member behavior modeled with cracked-section assumptions at service and ultimate.

Ductility: reinforced concrete members designed to fail by yielding of steel (ductile) rather than crushing of concrete (brittle). Over-reinforced sections fail by concrete crushing before steel yields; prohibited by code through \( \rho_{max} \) limit.

# Chapter 2: Flexure in Beams

## 2.1 Assumptions

Plane sections remain plane (Bernoulli); strain linear through depth. Concrete tensile strength ignored. Perfect bond between steel and concrete. Stress-strain relations for concrete (parabolic or equivalent rectangular stress block) and steel (elastic-perfectly plastic).

## 2.2 Rectangular Stress Block

At ultimate, concrete compressive force modeled as uniform stress \( \alpha_1 \phi_c f'_c \) over depth \( \beta_1 c \), with:

\[ \alpha_1 = 0.85 - 0.0015 f'_c \geq 0.67, \quad \beta_1 = 0.97 - 0.0025 f'_c \geq 0.67. \]

\( \phi_c = 0.65 \) for concrete, \( \phi_s = 0.85 \) for rebar (CSA A23.3).

## 2.3 Moment Capacity

Force equilibrium:

\[ C = \alpha_1 \phi_c f'_c b \beta_1 c = T = \phi_s A_s f_y. \]

Depth to neutral axis:

\[ c = \frac{\phi_s A_s f_y}{\alpha_1 \phi_c f'_c b \beta_1}. \]

Moment capacity:

\[ M_r = \phi_s A_s f_y (d - \beta_1 c/2), \]

or equivalent forms.

## 2.4 Reinforcement Limits

Minimum \( \rho_{min} = 1.4/f_y \) (about 0.35% for Grade 400) prevents brittle failure after cracking. Maximum \( \rho_{max} \) corresponds to balanced condition (simultaneous yield of steel and crushing of concrete) minus margin (typically 0.75 \( \rho_b \)).

Doubly reinforced: compression steel used when section dimensions constrained and tensile reinforcement would exceed \( \rho_{max} \). Compression steel also improves ductility and reduces long-term deflection.

<div class="example">
<strong>Singly reinforced beam.</strong> <em>b</em> = 300 mm, <em>d</em> = 500 mm, <em>f'<sub>c</sub></em> = 30 MPa, <em>A<sub>s</sub></em> = 3 &times; 25M = 1500 mm<sup>2</sup>, <em>f<sub>y</sub></em> = 400 MPa. Depth of stress block: <em>a</em> = 1500 &times; 0.85 &times; 400/(0.805 &times; 0.65 &times; 30 &times; 300) &asymp; 108 mm. <em>M<sub>r</sub></em> &asymp; 0.85 &times; 1500 &times; 400 &times; (500 &minus; 108/2)/10<sup>6</sup> &asymp; 227 kN&middot;m.
</div>

# Chapter 3: Shear in Beams

## 3.1 Shear Cracking

Diagonal tension cracks initiate at principal tensile stress exceeding concrete tensile strength. Flexure-shear cracks extend existing flexural cracks; web-shear cracks form in unstressed webs. Stirrups (transverse reinforcement) resist shear across cracks.

## 3.2 Design Method (CSA A23.3 General Method)

Based on Modified Compression Field Theory (MCFT): concrete contribution plus stirrup contribution:

\[ V_r = V_c + V_s = \phi_c \lambda \beta \sqrt{f'_c} b_w d_v + \phi_s A_v f_y d_v \cot\theta / s. \]

Parameters \( \beta \) and \( \theta \) depend on longitudinal strain \( \varepsilon_x \); tables or charts simplify.

Simplified method for non-prestressed beams with stirrups: \( \beta = 0.18 \), \( \theta = 35^\circ \) (approximate). Rigorous method iterates \( \varepsilon_x \).

## 3.3 Stirrup Detailing

Minimum stirrups \( A_{v,min} = 0.06\sqrt{f'_c} b_w s/f_y \). Maximum spacing \( \min(600\ \text{mm}, 0.7 d_v) \) for general; tighter near supports and concentrated loads. Bar hooks: 135° for seismic/confinement, 90° for general.

## 3.4 Torsion

Closed stirrups and longitudinal bars together resist torsion. Space-truss analogy: tube thickness \( t \), area enclosed \( A_o \). Combined shear-torsion-flexure checks on interaction surface.

# Chapter 4: D-Regions (Disturbed Regions)

## 4.1 B-Regions vs. D-Regions

B-regions: plane sections remain plane (beam-column theory applies). D-regions: near concentrated loads, reactions, openings, or geometric discontinuities; nonlinear strain distribution. Rule of thumb: D-region extends a distance equal to member depth from discontinuity.

## 4.2 Strut-and-Tie Modeling

Visualize internal load path as struts (concrete in compression), ties (reinforcement in tension), and nodes (joints). Suitable for pile caps, deep beams, corbels, dapped ends, and complex geometries.

Design principle: find equilibrium truss matching applied loads and boundary conditions; size struts, ties, nodes for forces within code-permitted stress limits.

## 4.3 Node Types

- **CCC**: three struts meeting; efficient.
- **CCT**: two struts and one tie; slightly reduced capacity.
- **CTT**: one strut and two ties; weakest.

Node stress limits: \( 0.85 \alpha_1 \phi_c f'_c \) for CCC, reduced for others.

## 4.4 Shear-Friction

Interface transfer of shear across cracks or joints via roughness and clamping action. Design equation \( V_r = \phi_s \mu A_{vf} f_y \), with coefficient of friction \( \mu \) 1.4 (monolithic rough), 1.0 (intentionally roughened construction joint), 0.6 (smooth).

# Chapter 5: Columns

## 5.1 Short vs Slender

Slenderness ratio \( kl/r \). Short column if \( kl/r < 22 \) for members in frames, 34 - 12 \( M_1/M_2 \) for non-sway. Short columns fail by material strength; slender by stability (buckling with moment amplification).

## 5.2 Axial Capacity

Pure axial: \( P_r = \phi_c \alpha_1 f'_c (A_g - A_{st}) + \phi_s A_{st} f_y \), reduced by 0.8 for tied (0.85 for spiral) to account for accidental eccentricity.

## 5.3 Interaction Diagrams

Columns typically carry combined axial + moment. Interaction surface (M-P diagram) traces failure envelope: pure compression, balanced point (simultaneous yield and crushing), pure moment. Design: plot factored force pair (P, M) below and inside the envelope (with resistance factors applied).

Biaxial bending: Bresler's reciprocal formula or contour approximations for rectangular sections with both-axis moments.

## 5.4 Detailing

Ties or spirals confine core concrete, increase ductility, prevent longitudinal bar buckling. Spacing \( \min(16 d_b, 48 d_{tie}, b) \). Seismic: closer spacing, 135° hooks, larger ties. Splices of longitudinal bars alternated or staggered.

# Chapter 6: Slabs and Special Topics

## 6.1 One-Way and Two-Way Slabs

One-way: supported on two opposite edges; bending primarily in one direction. Design as wide beams; secondary reinforcement for shrinkage/temperature.

Two-way: supported on four sides with aspect ratio < 2:1. Distribute load in both directions. Design by direct design method, equivalent frame, or finite element. Minimum thickness by span/depth ratio (L/30, L/24, L/28, L/34 depending on edge conditions).

## 6.2 Flat Plates and Punching Shear

Flat plate: slab directly on columns without beams; simple formwork, shallower. Punching shear at columns critical: concrete cone tears out of slab.

\[ v_r = \phi_c(0.19 + \alpha_s d/b_0)\lambda\sqrt{f'_c}, \]

with \( b_0 \) = critical perimeter at \( d/2 \) from column. Shear heads, stud rails, drop panels, or column capitals enhance punching capacity.

## 6.3 Development and Splices

Development length \( l_d = 0.45 k_1 k_2 k_3 k_4 f_y d_b/(\sqrt{f'_c}) \) with modifiers. Hooks shorten \( l_d \). Splices (Class A or B): 1.0 or 1.3 \( l_d \) depending on stress level and reinforcement percentage spliced at same location. Mechanical couplers replace conventional splices for congested areas.

## 6.4 Serviceability

Deflection: immediate (elastic, cracked section), long-term (creep, shrinkage; multiplier 2-3 for sustained loads). Allowable L/240 to L/480 depending on load type and occupancy.

Cracking: bar spacing and cover control crack widths. Gergely-Lutz and similar empirical models; CSA A23.3 requires surface strain check via \( z \) factor.

## 6.5 Prestressed Concrete

Pre-tensioned (strands stressed before casting, concrete cast around) or post-tensioned (ducts cast into member, strands stressed after curing). Prestress introduces compression in tension zones, enabling crack-free behavior at service and longer spans. Losses: elastic shortening, creep, shrinkage, relaxation of steel; typically 15-20% of initial.

<div class="remark">
Reinforced and prestressed concrete design rests on simple principles&mdash;plane sections, equilibrium, compatible materials&mdash;but requires skill at detailing to turn calculation into a buildable, durable structure. Code provisions codify decades of research and failure lessons; a designer&apos;s task is to apply them with judgment to diverse real conditions.
</div>
