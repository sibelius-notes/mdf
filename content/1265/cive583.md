---
title: "CIVE 583: Design of Urban Water Systems"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Mays, L. W., *Water Distribution Systems Handbook*; Butler, D., Digman, C. J., Makropoulos, C., and Davies, J. W., *Urban Drainage*.

**Supplementary texts** — Walski, T. M., Chase, D. V., Savic, D. A., Grayman, W., Beckwith, S., and Koelle, E., *Advanced Water Distribution Modeling and Management*; Akan, A. O. and Houghtalen, R. J., *Urban Hydrology, Hydraulics, and Stormwater Quality*; ASCE/EWRI, *Manual of Practice No. 77 — Design and Construction of Sanitary and Storm Sewers*.

**Online resources** — US EPA SWMM and EPANET open-source documentation; Canada's *Canadian Guidelines for Drinking Water Quality* (Health Canada); Ontario Ministry of the Environment *Design Guidelines for Drinking-Water Systems* and *Design Guidelines for Sewage Works*; Water Research Foundation open technical reports; AWWA standards public summaries.

---

# Chapter 1: Urban Water Systems in Context

A city's water infrastructure comprises three interacting systems: potable water supply and distribution, wastewater collection and treatment, and stormwater management. Designing each well requires understanding how it interacts with the others, with the city's growth patterns, and with a changing climate.

## 1.1 The Urban Water Cycle

Water is withdrawn from surface or groundwater sources, treated, distributed, used, and eventually discharged — as wastewater to a treatment plant and receiving water body, or as stormwater to rivers and lakes. Leakage, infiltration, evaporation, and reuse complicate the accounting. A whole-system perspective supports design decisions that reduce losses, recover resources, and enhance resilience.

## 1.2 Levels of Service and Sustainability

**Levels of service** express the performance residents expect: water pressure during peak hour, days without sewer backup, streets flooded no more than once in \(n\) years, contaminant concentrations below regulatory limits. Sustainability analyses add dimensions of energy, greenhouse gas intensity, life-cycle cost, and ecosystem integrity.

<div class="definition">
<strong>Integrated urban water management.</strong> Planning and designing water supply, wastewater, and stormwater systems jointly, so that demand management, source protection, water reuse, green infrastructure, and conventional grey infrastructure act as coherent parts of a single system.
</div>

# Chapter 2: Water Supply and Distribution

## 2.1 Demand Forecasting

Average day demand is estimated from population times per-capita usage (\(200\text{–}400\ \text{L/person·day}\) for typical residential users, plus commercial, industrial, and non-revenue water). Maximum day and peak hour factors (typically 1.5–2.5 and 2.5–4.0 times the average) size source and distribution capacity. Fire demand is superimposed on maximum day; a **required fire flow** is calculated from the largest served building's area and construction type.

## 2.2 Network Hydraulics

Flow in a pressurized network obeys continuity at each node and the energy equation along each pipe. Head loss in a pipe of length \(L\) and diameter \(D\) under the Darcy–Weisbach equation is

\[
h_f = f\,\frac{L}{D}\,\frac{V^2}{2g}
\]

with the friction factor \(f\) from the Colebrook–White equation or a Haaland explicit approximation. The Hazen–Williams equation is also widely used:

\[
h_f = \frac{10.67\, Q^{1.852}\, L}{C^{1.852}\, D^{4.87}}
\]

Looped networks are solved by the Hardy Cross method or — in practice — by software implementing gradient methods (EPANET).

## 2.3 Pumping and Storage

Pump curves relate head to discharge; the operating point lies at the intersection of pump and system curves. Storage reservoirs equalize demand and supply, provide fire reserve, and maintain system pressure. Sizing combines diurnal demand balancing (typically 20–25% of maximum day demand) with fire reserve and emergency reserve.

## 2.4 Water Quality in Distribution

Chlorine residuals decay by first-order kinetics \(C(t) = C_0 e^{-k t}\). Water age — the residence time from plant to tap — should generally be minimized; dead ends and oversized mains elevate age and degrade quality. Cross-connections and backflow protection, pressure management to reduce leakage, and pipe material selection are all quality-relevant design decisions.

# Chapter 3: Wastewater Collection

## 3.1 Flow Estimation

Sanitary flow equals water consumption minus outdoor use, plus industrial contributions and infiltration/inflow. Peak factor curves (Babbitt, Harmon) relate peak to average flow by population. Infiltration of groundwater through defective joints can add \(40\text{–}200\ \text{L/capita·day}\) or more in old systems.

## 3.2 Gravity Sewer Hydraulics

Sanitary sewers flow partially full. Manning's equation

\[
Q = \frac{1}{n} A R^{2/3} S^{1/2}
\]

with \(n \approx 0.013\) for PVC or concrete applies. Design velocities of \(0.6\ \text{m/s}\) at design flow maintain self-cleansing against grit deposition; upper velocities of \(3\text{–}4.5\ \text{m/s}\) avoid erosion and hydrogen sulfide generation. Minimum slopes for small-diameter pipes are tabulated to ensure scour.

## 3.3 Pumping Stations and Force Mains

When gravity service is infeasible, pumping stations lift flow to a higher elevation or pressurize a force main. Wet well volume is sized to limit pump cycling, typically a 5–10 minute cycle with duplex or triplex pumps. Surge analysis addresses water hammer from pump trips; air valves, surge tanks, or slow-closure check valves mitigate the pressure transients.

# Chapter 4: Stormwater Collection and Management

## 4.1 Design Storms and Rainfall

Urban drainage relies on **intensity–duration–frequency** (IDF) curves. For small catchments the **rational method** estimates peak flow

\[
Q_p = C\,i\,A
\]

with runoff coefficient \(C\), rainfall intensity \(i\) at the time of concentration, and catchment area \(A\). For larger or more complex catchments, continuous simulation (SWMM) integrates hydrology and hydraulics.

## 4.2 Sewer Design

Minor-system storm sewers are typically designed for a 2–10-year return period; the major system (streets, swales) passes the 100-year event. Inlet capacity at catch basins is governed by weir and orifice flow depending on ponding depth. Storm sewer hydraulic grade lines must remain below basement or street elevations with adequate freeboard.

## 4.3 Detention and Retention

Detention basins temporarily store peak flow and release it at a controlled rate. Required storage volume is

\[
S = \int_0^{T} (Q_{\text{in}} - Q_{\text{out}})\,dt
\]

using design hydrographs. Retention ponds hold a permanent pool for water quality improvement, removing suspended solids by sedimentation characterized by the overflow rate \(v_s = Q/A_s\).

## 4.4 Low Impact Development and Green Infrastructure

Bioretention cells, permeable pavements, green roofs, and infiltration trenches disconnect impervious area and restore predevelopment hydrology. Design volumes for water quality treatment commonly capture the first \(25\text{–}40\ \text{mm}\) of runoff. Long-term performance requires maintenance — sediment removal, media replacement, vegetation management.

<div class="example">
<strong>Rational method.</strong> A 4 ha site with <em>C = 0.7</em>, time of concentration 15 min, and <em>i = 95 mm/h</em> (10-year intensity) produces <em>Q<sub>p</sub> = 0.7 &times; (95/3600 &times; 10<sup>-3</sup>) &times; (4 &times; 10<sup>4</sup>) &asymp; 0.74 m<sup>3</sup>/s</em>. A detention facility sized to limit release to the predevelopment 0.20 m<sup>3</sup>/s requires roughly 500 m<sup>3</sup> of storage from a triangular hydrograph envelope.
</div>

# Chapter 5: Computer-Aided Design and Modelling

## 5.1 EPANET for Water Distribution

EPANET implements steady-state and extended-period simulation of pressurized water networks, solving continuity and energy equations with the global gradient method. Users define nodes, links, demands, controls, and water quality parameters. The model supports fire-flow analysis, energy audits, and contaminant propagation.

## 5.2 SWMM for Stormwater and Combined Sewers

US EPA SWMM couples hydrology (surface runoff, evaporation, infiltration by Horton, Green-Ampt, or SCS methods) with hydraulics (kinematic wave or dynamic wave). Dual drainage modelling represents the minor and major systems and their interaction during extreme events. LID modules represent green infrastructure within the same framework.

## 5.3 Calibration and Uncertainty

Models must be calibrated against monitored data — flow, pressure, rainfall, water levels — and validated on independent events. Sensitivity and uncertainty analysis identifies the parameters that matter most and bounds the reliability of design recommendations.

# Chapter 6: Subdivision Design Project and Sustainability Integration

## 6.1 Subdivision Layout

A design project integrates land use planning, grading, road layout, lot servicing, and utilities. Water mains follow road right-of-ways with \(1.5\text{–}2.5\ \text{m}\) minimum cover; services extend to each lot with curb stops. Sanitary sewers are laid to minimum cover (\(\approx 2.5\ \text{m}\)) and maximum cover (\(\approx 7\ \text{m}\)) with manholes at every change in alignment, slope, or size. Storm sewers and overland flow routes are designed together so that 100-year flows pass through streets without flooding habitable spaces.

## 6.2 Sustainability and Climate Resilience

Design for the future climate uses updated IDF curves, often via a climate change adjustment factor applied to historical rainfall statistics. Demand management (metering, leak detection, water-efficient fixtures) reduces source stress. Decentralized reuse — greywater, rainwater harvesting — lowers potable demand. Low-carbon materials and pump efficiency reduce embodied and operational carbon.

## 6.3 Asset Management

Networks are long-lived, capital-intensive assets. Condition assessment (CCTV, acoustic leak detection, hydrant flow tests) feeds prioritized renewal programs. Life-cycle cost analyses balance maintenance, rehabilitation, and replacement choices over horizons of 50–100 years.

<div class="remark">
<strong>Design discipline.</strong> Urban water system design earns its reputation as engineering craft through constant integration: hydraulics with water quality, grey infrastructure with green, routine loading with extreme events, and present demands with an uncertain future.
</div>

Modern urban water engineers combine fluency with design codes and software, careful modelling judgment, and an appreciation that every pipe, pump, and pond contributes to a public service that citizens never see until it fails. The objective is an infrastructure that is invisible in operation and reliable in extremity.
