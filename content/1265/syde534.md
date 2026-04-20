---
title: "SYDE 534: Electric Energy Systems"
subjects: "SYDE"
---

## Sources and References

- Glover, Overbye, Sarma, <em>Power System Analysis and Design</em> (Cengage)
- Bergen and Vittal, <em>Power Systems Analysis</em> (Prentice Hall)
- Kundur, <em>Power System Stability and Control</em> (McGraw-Hill)
- von Meier, <em>Electric Power Systems: A Conceptual Introduction</em> (Wiley)
- IEA, <em>World Energy Outlook</em> (annual); NREL technical reports

---

# Chapter 1: Traditional Electric Power Systems

## 1.1 Generation

Large generators convert mechanical to electrical energy via synchronous machines. Thermal plants (coal, gas, nuclear) and hydroelectric plants drive synchronous generators that lock to grid frequency. Electrical power generated is

\[
P = \sqrt{3}\,V_L I_L \cos\theta
\]

for three-phase systems with line voltage \( V_L \), line current \( I_L \), and power-factor angle \( \theta \).

## 1.2 Transmission and Distribution

Power transfers from generators to loads through a hierarchy of voltage levels. High voltage transmission (230–765 kV) minimises \( I^{2}R \) losses over long distances; step-down transformers at substations feed subtransmission and distribution. A transmission line's ABCD parameters relate sending and receiving voltages and currents:

\[
\begin{bmatrix} V_s \\ I_s \end{bmatrix} = \begin{bmatrix} A & B \\ C & D \end{bmatrix} \begin{bmatrix} V_r \\ I_r \end{bmatrix}.
\]

Surge impedance loading and line thermal limits bound practical transfers. Reactive power management maintains voltage profiles along the line.

## 1.3 Power Flow

Steady-state analysis solves the non-linear power-flow equations

\[
P_i = \sum_k |V_i||V_k|(G_{ik}\cos\theta_{ik} + B_{ik}\sin\theta_{ik}),
\]

\[
Q_i = \sum_k |V_i||V_k|(G_{ik}\sin\theta_{ik} - B_{ik}\cos\theta_{ik}),
\]

iteratively using Newton-Raphson or fast-decoupled methods. Outputs — bus voltages, line flows, losses — underpin operations, planning, and market clearing.

<div class="example">
A two-bus system with slack and load buses, \( Y_{12} = 1/(j0.1) \), 1 pu load, solves to voltage magnitude 0.95 pu at the load bus and phase angle \( \approx -5.7° \), indicating modest voltage drop for this inductive line.
</div>

# Chapter 2: Power System Components

## 2.1 Generators

Synchronous generators produce voltage via rotating magnetic fields in stator windings. Per-unit reactances — synchronous, transient, subtransient — describe response at different time scales. The swing equation

\[
\frac{2H}{\omega_s}\,\frac{d^{2}\delta}{dt^{2}} = P_m - P_e
\]

governs rotor angle dynamics following disturbances and underlies transient stability analysis.

## 2.2 Transformers

Transformers adjust voltage levels via magnetic coupling between windings. Ideal transformer ratios \( N_1/N_2 \) set voltage and current ratios; non-ideal behaviour is modelled by equivalent circuits with leakage reactance and magnetising branch. Three-phase connections (Y-Y, Y-\( \Delta \), \( \Delta \)-Y, \( \Delta \)-\( \Delta \)) have distinct phase-shift, grounding, and harmonic characteristics.

## 2.3 Loads

Loads vary by type (resistive heating, induction motor, electronic) and thus respond differently to voltage and frequency changes. Aggregated load models include constant power, constant current, constant impedance, and frequency-dependent variants. Demand-side management exploits these dependencies to shape load profiles for grid benefit.

# Chapter 3: Emerging Technologies

## 3.1 Smart Grids

Smart grids integrate digital communication and control with traditional power systems, enabling real-time monitoring, automated control, and bidirectional information flow. Phasor measurement units (PMUs) time-synchronise voltage phasors across the grid, enabling wide-area monitoring and control. Smart meters, demand response, and distributed intelligence transform the grid into a responsive system.

## 3.2 Renewable Integration

Solar PV and wind generation introduce variability and reduced inertia compared to synchronous generators. Power-electronic interfaces (inverters) replace synchronous coupling, requiring new control strategies (grid-forming inverters, synthetic inertia). Geographic and technological diversification smooths aggregate output. Forecasting, reserves, and storage manage residual variability.

## 3.3 Energy Storage

Storage decouples generation from consumption. Pumped hydro dominates installed capacity but siting limits expansion. Lithium-ion batteries are scaling rapidly for short-duration grid services (frequency regulation, peak shifting). Flow batteries, compressed air, and hydrogen address longer-duration storage needs. Round-trip efficiency, cycle life, energy density, and cost shape application fit.

<div class="definition">
<strong>Levelised cost of storage (LCOS)</strong> represents the discounted lifetime cost per unit of energy delivered from storage, analogous to LCOE for generation; it depends sensitively on cycle count, round-trip efficiency, and discount rate.
</div>

## 3.4 Competition and Markets

Electricity markets replace vertical-utility planning with competitive mechanisms: energy, capacity, ancillary services, and congestion management traded through auctions. Locational marginal prices reflect transmission constraints; capacity markets compensate resource adequacy; ancillary services markets procure regulation and reserves. Market design must balance efficiency, reliability, equity, and environmental objectives.

## 3.5 Peer-to-Peer and Microgrids

Peer-to-peer energy trading uses blockchain or centralised platforms to enable local transactions — a household with excess solar selling directly to a neighbour. Microgrids aggregate local generation, storage, and load; they operate grid-connected or islanded and support resilience. Regulatory and tariff innovation lag technical capability in many jurisdictions.

# Chapter 4: Stability and Control

## 4.1 Frequency Control

Grid frequency reflects instantaneous power balance. Primary frequency control (droop in governors) responds in seconds; secondary (automatic generation control) in minutes; tertiary (economic redispatch) in tens of minutes. Under-frequency load shedding is the last line of defence before blackout.

## 4.2 Voltage Control

Voltage control uses reactive power — generator AVRs, capacitor banks, tap-changing transformers, FACTS devices (SVC, STATCOM). Voltage collapse occurs when a system loses capability to deliver reactive power, often triggered by cascading outages under heavy loading.

## 4.3 Stability Categories

Power system stability divides into rotor-angle (small-signal, transient), voltage, and frequency stability, each with fast and slow dynamics. Modern grids with large inverter-based resources introduce new stability issues — sub-synchronous oscillations, interaction among control loops — requiring updated analysis and mitigation.

# Chapter 5: Economic, Environmental, and Sustainability Issues

## 5.1 Generation Economics

Dispatch minimises total cost subject to constraints:

\[
\min \sum_i C_i(P_i),\quad \text{s.t.}\ \sum P_i = P_D + \text{losses}, \ P_i^{min} \le P_i \le P_i^{max}.
\]

Incremental cost (\( dC/dP \)) equalises across dispatched units at the optimum (equal-lambda), with transmission and security constraints modifying the classical result. Unit commitment extends to multi-hour horizons with start-up costs and minimum up/down times.

## 5.2 Environmental Dimensions

Electric power generation is the single largest global source of CO<sub>2</sub> emissions. Decarbonisation pathways combine renewable generation, nuclear energy, carbon capture, electrification of end uses (transport, heating), and efficiency. Local air pollutants, water use, land use, and mineral supply chains raise additional environmental considerations.

## 5.3 Sustainability and Social Dimensions

Energy justice examines distribution of benefits and harms: who bears local pollution, who pays for infrastructure, who enjoys reliable supply, who is energy-poor. Just transition policies address communities dependent on incumbent fossil industries. Indigenous sovereignty, land rights, and consultation obligations shape siting of generation and transmission.

<div class="example">
A 100 MW solar farm in a remote region may deliver low-cost energy, but siting on Indigenous territory without genuine consent violates ethical and often legal obligations; ethically sound siting requires early engagement, benefit-sharing agreements, and ongoing partnership.
</div>

# Chapter 6: Future Challenges and Possibilities

## 6.1 Deep Decarbonisation

Deep decarbonisation combines renewables, long-duration storage, hydrogen, nuclear, and demand-side measures. System operators face unprecedented variability and must coordinate across transmission, distribution, and customer levels. Planning tools increasingly integrate capacity expansion with operational simulation, climate scenarios, and stakeholder engagement.

## 6.2 Resilience and Reliability

Climate-driven extreme events (heatwaves, wildfires, hurricanes, cold snaps) stress grids designed for historical conditions. Resilience combines hardened infrastructure, microgrids, distributed energy resources, and planning for rapid recovery. Reliability standards (NERC in North America) evolve as the resource mix changes.

## 6.3 Digitalisation and Cybersecurity

Digital control and communication enable new capabilities but expand attack surfaces. Cybersecurity frameworks (NIST, NERC CIP) require defence-in-depth across operational technology. Privacy of smart-meter data, fairness of algorithmic demand response, and accountability of automated decisions are emerging policy and ethical questions.

## 6.4 The Integrated Energy System

Electricity increasingly links with transportation (EVs), heating (heat pumps, electric boilers), industrial processes, and data centres. Sector coupling via power-to-X (hydrogen, synthetic fuels) extends the reach of clean electricity. Whole-system planning across these sectors reveals synergies and constraints invisible to single-sector analysis.

<div class="theorem">
A resilient, sustainable electric energy system integrates diverse generation, flexible demand, storage, smart controls, competitive markets, and informed governance — a sociotechnical system whose design demands collaboration across engineering, economics, environmental science, and public policy.
</div>
