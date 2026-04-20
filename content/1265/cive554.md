---
title: "CIVE 554: Geotechnical Engineering 3"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Craig, R. F. (edited by Knappett, J. A.), *Craig's Soil Mechanics*; Das, B. M., *Principles of Geotechnical Engineering*.

**Supplementary texts** — Lambe, T. W. and Whitman, R. V., *Soil Mechanics*; Terzaghi, K., Peck, R. B., and Mesri, G., *Soil Mechanics in Engineering Practice*; Mitchell, J. K. and Soga, K., *Fundamentals of Soil Behavior*.

**Online resources** — MIT OpenCourseWare 1.361 *Advanced Soil Mechanics*; Canadian Geotechnical Society public technical guidelines; US Army Corps of Engineers Engineering Manuals (USACE EM 1110-series); Federal Highway Administration (FHWA) geotechnical engineering circulars; ISSMGE online proceedings.

---

# Chapter 1: Framework of Geotechnical Consulting Practice

Geotechnical engineering in practice is site-specific, evidence-driven, and iterative. A consulting project moves through problem identification, data acquisition, analysis, design, construction support, and post-construction monitoring. Each phase makes decisions under uncertainty about soil, water, and structure interactions.

## 1.1 The Observational Method

Terzaghi and Peck's **observational method** accepts that subsurface conditions are incompletely known. Design proceeds on the most probable conditions, contingent modifications are planned for less favourable outcomes, and instrumentation monitors performance during construction. This framework remains the default in consulting practice for large or risky projects.

## 1.2 Risk and Decision-Making

Geotechnical risk combines geological uncertainty, parameter variability, and model error. A factor of safety encapsulates a simplified view of risk; partial factors in limit-states codes (CSA, Eurocode 7) disaggregate uncertainty by loading and by resistance. Where consequences are severe, **reliability-based design** targets an acceptable failure probability \(p_f\) using the reliability index \(\beta = -\Phi^{-1}(p_f)\).

<div class="definition">
<strong>Geotechnical report.</strong> A consulting deliverable that documents site history, investigation methods, factual data, interpreted parameters, design recommendations, and limitations — a living reference throughout design and construction.
</div>

# Chapter 2: Site Characterization

## 2.1 Desk Study and Reconnaissance

Before mobilizing equipment, the engineer reviews published geology, historical air photos, topographic maps, water well records, and previous reports. A site walkover identifies access constraints, surface water, evidence of past grading, and nearby structures potentially affected by construction.

## 2.2 Subsurface Investigation

A typical investigation uses a combination of boreholes with Standard Penetration Tests (SPT), Shelby tube sampling in cohesive soils, Cone Penetration Tests (CPT) with pore pressure measurement (CPTu), vane shear tests, and in situ pressuremeter or dilatometer tests. Geophysical methods (seismic refraction, MASW, resistivity) extend coverage between boreholes.

## 2.3 Laboratory Testing

Index tests (Atterberg limits, grain-size distribution, water content) classify soils. Strength tests — unconfined compression, consolidated-undrained and consolidated-drained triaxial, direct shear — measure \(c'\), \(\phi'\), and \(c_u\). Consolidation tests provide \(C_c\), \(C_r\), \(c_v\), and preconsolidation pressure \(\sigma'_p\). Data interpretation demands judgment about sample disturbance.

# Chapter 3: Effective Stress and Consolidation

## 3.1 Effective Stress Principle

Terzaghi's principle \(\sigma' = \sigma - u\) underlies virtually every geotechnical calculation. Volume change and strength depend on effective stress, not total stress. In a submerged soil, the increase in effective stress due to an applied surcharge \(\Delta\sigma\) equals the surcharge only after excess pore pressure dissipates.

## 3.2 One-Dimensional Consolidation

Terzaghi's consolidation equation governs the transient excess pore pressure \(u_e(z,t)\):

\[
\frac{\partial u_e}{\partial t} = c_v\,\frac{\partial^2 u_e}{\partial z^2}
\]

with \(c_v = k/(m_v \gamma_w)\). The time factor is \(T_v = c_v t / H_{dr}^2\). The average degree of consolidation \(U\) relates \(T_v\) through tabulated solutions; engineering charts and the approximation \(U \approx \sqrt{4 T_v/\pi}\) for \(U < 0.6\) are routinely used.

## 3.3 Settlement Analysis

Total settlement of a layer of thickness \(H\) under a stress increase \(\Delta\sigma'\) is

\[
s = \frac{C_c}{1 + e_0}\, H\,\log_{10}\!\frac{\sigma'_0 + \Delta\sigma'}{\sigma'_0}
\]

for a normally consolidated soil, with a corresponding expression using \(C_r\) for overconsolidated soils. Secondary compression uses \(C_\alpha\) over log-time. Differential settlement — the gradient across a structure — often controls tolerability.

# Chapter 4: Shear Strength and Slope Stability

## 4.1 Drained and Undrained Strength

Effective-stress strength is \(\tau_f = c' + \sigma'\tan\phi'\). Total-stress undrained strength \(\tau_f = c_u\) is appropriate for short-term conditions in saturated clays. Selecting the right strength envelope for the time frame of interest is a central decision.

## 4.2 Limit Equilibrium Slope Analysis

For a circular slip surface the method of slices (Bishop's simplified method) gives

\[
F = \frac{\sum [c'b + (W - ub)\tan\phi']/m_\alpha}{\sum W\sin\alpha}
\]

with \(m_\alpha = \cos\alpha (1 + \tan\alpha \tan\phi'/F)\). Iteration solves for \(F\). Noncircular surfaces use Morgenstern–Price or Spencer formulations. Modern practice runs many candidate surfaces to find a minimum.

## 4.3 Seismic and Transient Cases

Pseudo-static analysis adds a horizontal seismic coefficient \(k_h\) to the driving terms. For liquefiable sands, post-earthquake residual strength \(s_{r}\) is used on potentially liquefied layers. Rapid drawdown in embankments and reservoirs generates transient pore pressure states that can govern stability.

<div class="example">
<strong>Staged embankment.</strong> Placing an embankment on soft clay in stages allows undrained strength to grow as excess pore pressure dissipates. Vertical wick drains shorten the drainage path, accelerating consolidation under Terzaghi's radial-plus-vertical solution. The next lift is placed only once measured pore pressures and settlement rates indicate adequate gain in <em>c<sub>u</sub></em>.
</div>

# Chapter 5: Foundation Design

## 5.1 Bearing Capacity

Terzaghi's bearing capacity equation for a strip footing of width \(B\) at depth \(D\) is

\[
q_{\text{ult}} = c'N_c + q N_q + \tfrac{1}{2}\gamma B N_\gamma
\]

with shape, depth, inclination, and groundwater modifiers. Meyerhof, Hansen, and Vesić forms refine the factors. Allowable pressure usually controls via settlement, not ultimate capacity.

## 5.2 Shallow Foundation Settlement

Elastic settlement under a flexible loaded area uses \(s = qB(1-\nu^2) I_f/E_s\). For sands, Schmertmann's strain-influence factor method integrates \(I_z\) through a depth of \(2B\) using \(E_s\) from CPT or SPT correlations.

## 5.3 Deep Foundations

Driven and bored piles transfer load through shaft friction \(Q_s = \int f_s\, A_s\) and end bearing \(Q_p = q_p A_p\). Unit shaft friction in clay uses \(f_s = \alpha c_u\) or \(\beta \sigma'_v\) methods; in sand, \(f_s = \sigma'_v K \tan\delta\). Group effects reduce capacity for closely spaced piles in cohesive soils. Lateral capacity is analyzed as a beam on a Winkler foundation (p–y curves).

## 5.4 Excavations and Retaining Structures

Active and passive lateral earth pressures follow Rankine or Coulomb theory. Braced excavations use Peck's apparent pressure diagrams for strut force design. Deflection of flexible retaining walls is computed with beam-on-elastic-foundation or finite-element analysis; adjacent structures set serviceability limits on wall deflection.

# Chapter 6: Project Execution and Case Studies

## 6.1 Dewatering and Groundwater Control

Construction dewatering requires estimation of pumping rates using Dupuit–Forchheimer flow to wells, design of well points or deep wells, and consideration of induced settlement at adjacent structures from lowered water tables. Recharge wells can mitigate settlement risks.

## 6.2 Ground Improvement

Techniques include preloading with wick drains, stone columns, deep soil mixing, jet grouting, dynamic compaction, and vibrocompaction. Selection balances soil type, target improvement, depth, schedule, and cost. Verification uses pre- and post-improvement in situ testing.

## 6.3 Instrumentation and Monitoring

Inclinometers, piezometers, settlement plates, and total-station optical monitoring provide data to confirm performance. Trigger levels tied to the observational method direct contingency actions. Modern practice increasingly uses automated data acquisition, fibre-optic distributed sensing, and cloud-based dashboards accessible to the project team in real time.

## 6.4 Reporting and Communication

A consulting geotechnical report separates **factual** content (borehole logs, lab data, in situ test results) from **interpretive** content (parameter selection, design recommendations). Limitations are stated explicitly. The engineer's communication — to architects, structural engineers, contractors, regulators, and owners — is as important as the computation. The projects that succeed are those in which uncertainty is acknowledged, contingencies are planned, and observations drive decisions.

<div class="remark">
<strong>From analysis to judgment.</strong> Consulting geotechnical engineering is the disciplined translation of partial subsurface evidence into decisions that work. Good practice holds two ideas at once: rigorous computation within a chosen model, and constant humility about the gap between model and ground.
</div>
