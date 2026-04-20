---
title: "SYDE 381: Thermodynamics"
subjects: "SYDE"
---

## Sources and References

- Moran, Shapiro, Boettner, and Bailey, *Fundamentals of Engineering Thermodynamics*.
- Cengel and Boles, *Thermodynamics: An Engineering Approach*.
- Borgnakke and Sonntag, *Fundamentals of Thermodynamics*.
- Callen, *Thermodynamics and an Introduction to Thermostatistics*.
- Bejan, *Advanced Engineering Thermodynamics*.
- Incropera, DeWitt, Bergman, and Lavine, *Fundamentals of Heat and Mass Transfer*.
- Atkins and de Paula, *Physical Chemistry* (for statistical-thermodynamics framing).
- MIT OpenCourseWare 2.005 / 2.006 *Thermal-Fluids Engineering*.
- Stanford ME 170 *Thermodynamics* public course materials.

---

## Orientation: Thermodynamics as a Systems Discipline

Thermodynamics is often introduced as the study of heat and work, but in a systems design setting it is more useful to frame it as the systematic accounting of **energy**: how energy is stored, how it is transformed from one form to another, how much useful work can in principle be extracted from a given resource, and how much of that potential is irreversibly lost whenever a real process occurs. Every engineered artifact that consumes or delivers energy — a building, a data center, a vehicle, a photovoltaic array, a water heater, a kiln — is a thermodynamic system, and its design trade-offs between performance, cost, and environmental footprint are trade-offs whose ceilings are set by the laws of thermodynamics.

The discipline rests on four empirical laws. The **Zeroth Law** defines temperature through the transitivity of thermal equilibrium. The **First Law** is the conservation of energy, extended to include heat as a form of energy transfer. The **Second Law** introduces entropy and asymmetry: energy is conserved in quantity but degrades in quality, and only some fraction of a thermal resource can ever become work. The **Third Law** fixes the zero of entropy at absolute zero and rules out the possibility of cooling a body to that limit in a finite number of steps. Systems designers rarely need the Third Law in routine calculation, but the first three shape essentially every energy balance, every efficiency estimate, and every sustainability argument the engineer will make.

This set of notes follows a progression from definitions and properties, through the First and Second Laws for closed systems and control volumes, into power and refrigeration cycles, heat transfer, applications in the built and natural environment, and a short introduction to the statistical interpretation that underwrites the macroscopic theory.

<div><strong>Why a systems framing matters.</strong> <em>A boiler efficiency of 92% looks excellent when measured by First Law energy balance but looks mediocre once Second Law exergy is applied, because high-temperature combustion is being used to make lukewarm water. Systems designers have to hold both views simultaneously: the First Law tells you whether the numbers balance, the Second Law tells you whether the architecture was worth building.</em></div>

## 1. Systems, Properties, and State

### 1.1 System, Surroundings, Boundary

A **thermodynamic system** is a region of the universe singled out for analysis. Everything outside is the **surroundings**, and the real or imagined surface separating them is the **boundary**. Boundaries may be rigid or deformable, permeable or impermeable, adiabatic (no heat crosses) or diathermal.

Three canonical system types recur throughout the course:

- **Isolated system:** no mass and no energy cross the boundary. A perfectly insulated, sealed vessel approximates this.
- **Closed system (control mass):** no mass crosses, but energy may cross as heat or work. A sealed piston-cylinder is the prototype.
- **Open system (control volume):** mass, heat, and work all cross the boundary. Turbines, pumps, nozzles, compressors, heat exchangers, and buildings with air changes are all control volumes.

### 1.2 Properties, State, and Process

A **property** is any measurable characteristic that depends only on the current condition of the system, not on the path taken to reach it: pressure \(P\), temperature \(T\), specific volume \(v\), specific internal energy \(u\), specific enthalpy \(h\), specific entropy \(s\). Properties are either **extensive** (scale with system size — total volume \(V\), total internal energy \(U\)) or **intensive** (independent of size — \(T\), \(P\), \(v\)). Dividing an extensive property by mass gives its corresponding **specific** intensive property.

The **state** of a simple compressible system is fully fixed by two independent intensive properties (the **state postulate**). A **process** is a sequence of states; a **cycle** is a process that returns to its initial state. A **quasi-equilibrium** (quasi-static) process proceeds slowly enough that the system can be modeled as a sequence of equilibrium states, which is the assumption that makes reversible-path integrals meaningful.

### 1.3 Temperature and Pressure

Temperature is not a raw primitive but a consequence of the Zeroth Law: two bodies individually in thermal equilibrium with a third are in equilibrium with each other, so there exists a scalar field that agrees across such equilibria. In SI we use the kelvin, defined now through the fixed value of the Boltzmann constant \(k_B\). Celsius and Kelvin share a degree size; absolute scales are mandatory in any equation involving ratios of temperatures, including essentially all Second Law expressions.

Pressure is the normal force per unit area exerted by a fluid on a surface. It is isotropic in a fluid at rest. In thermodynamic expressions involving gases, **absolute pressure** is required; gauge pressure is defined relative to local atmospheric pressure.

### 1.4 Pure Substances and Phase Behavior

A **pure substance** has uniform and invariable chemical composition. Water, nitrogen, refrigerant R-134a, and combustion-product mixtures at constant composition all qualify. Such substances move through solid, liquid, vapor, and two-phase regions in ways that a \(T\)-\(v\) or \(P\)-\(v\) diagram compactly summarizes.

Key features of the two-phase dome:

- **Saturation curve:** the locus of \((T, P)\) at which liquid and vapor coexist.
- **Quality** \(x = m_g/(m_f + m_g)\) parametrizes the mixture between saturated liquid (\(x=0\)) and saturated vapor (\(x=1\)).
- Specific properties in the dome follow the lever rule, e.g. \(v = v_f + x(v_g - v_f)\), and similarly for \(u\), \(h\), \(s\).
- **Critical point:** the top of the dome; above the critical temperature no phase boundary exists.

Away from the dome the substance is **compressed liquid**, **superheated vapor**, or **supercritical**. Designers of power cycles, refrigeration, and HVAC systems live inside tables or equations of state for a small number of such fluids (water, air, R-134a, R-1234yf, ammonia, CO\(_2\)).

### 1.5 Ideal Gas and Real Gas

When pressure is low relative to critical pressure and temperature high relative to critical temperature, molecular volume and intermolecular forces are negligible and the **ideal gas law** holds:

\[
P v = R T, \qquad P V = m R T = n \bar{R} T,
\]

where \(R = \bar{R}/M\) is the specific gas constant. For ideal gases, \(u\) and \(h\) depend only on \(T\), and the specific heats satisfy \(c_p - c_v = R\) and \(k = c_p/c_v\). Air at atmospheric conditions is well-approximated as ideal with \(R \approx 287 \text{ J/(kg·K)}\), \(k \approx 1.4\).

For real gases near the dome or at high pressure, compressibility factors \(Z = Pv/(RT)\) or cubic equations of state (van der Waals, Redlich-Kwong, Peng-Robinson) become necessary. For this course the ideal gas is the workhorse, with tables used whenever water or a refrigerant is the working fluid.

## 2. Energy, Work, and Heat

Energy enters thermodynamic accounting in three forms: **stored** energy (internal, kinetic, potential) and two **transfer** modes (heat and work).

### 2.1 Forms of Energy

Total energy per unit mass is

\[
e = u + \frac{V^2}{2} + gz,
\]

with \(u\) the specific internal energy — the microscopic kinetic and potential energy of molecules. For a control volume of fluid crossing a boundary, **flow work** \(Pv\) must be added, which motivates the definition of **specific enthalpy**

\[
h \equiv u + Pv.
\]

### 2.2 Work

Work is energy transfer associated with an organized force acting through a distance at the boundary. For a simple compressible substance undergoing a quasi-equilibrium process,

\[
W_b = \int_1^2 P \, dV.
\]

Polytropic processes \(PV^n = \text{const}\) encompass familiar special cases: \(n=0\) isobaric, \(n=1\) isothermal (ideal gas), \(n=k\) isentropic (ideal gas, reversible adiabatic), \(n \to \infty\) isochoric. Other work modes — shaft, electrical, spring, surface — appear additively.

### 2.3 Heat

Heat is energy transfer driven by a temperature difference. It is *not* a property of the system; only the **transfer** is meaningful, not a stored quantity called "heat." A process with zero heat transfer is **adiabatic**. Sign conventions (heat in positive, work out positive) are standard in this course; any consistent choice is acceptable as long as it is declared.

<div><strong>Pitfall: heat versus temperature.</strong> <em>A hot iron bar and a lake at 20 °C can carry comparable total internal energies despite vastly different temperatures. Heat is transfer; temperature is an intensive property. Sloppy use of the word "heat" to mean temperature or internal energy is the source of an astonishing fraction of undergraduate errors.</em></div>

## 3. First Law for Closed Systems

For a closed system undergoing a process between states 1 and 2,

\[
Q_{12} - W_{12} = \Delta U + \Delta \mathrm{KE} + \Delta \mathrm{PE}.
\]

In most problems kinetic and potential terms vanish and the equation reduces to \(Q - W = \Delta U\). For cycles \(\oint dU = 0\) and therefore \(\oint \delta Q = \oint \delta W\).

### 3.1 Special Processes for Ideal Gases

- **Isothermal** (\(T = \text{const}\)): for an ideal gas \(\Delta U = 0\), so \(Q = W = mRT \ln(V_2/V_1)\).
- **Isochoric** (\(V = \text{const}\)): \(W = 0\), \(Q = m c_v (T_2 - T_1)\).
- **Isobaric** (\(P = \text{const}\)): \(Q = m c_p (T_2 - T_1)\); \(W = P(V_2 - V_1)\).
- **Adiabatic reversible** (isentropic for ideal gas): \(TV^{k-1} = \text{const}\), \(TP^{(1-k)/k} = \text{const}\), and \(W = (P_1 V_1 - P_2 V_2)/(k-1)\).

### 3.2 Enthalpy and Phase Change

For phase changes at constant \(P\), \(Q = m \Delta h\), where \(\Delta h\) equals the tabulated enthalpy of vaporization \(h_{fg}\) or fusion. The large magnitude of \(h_{fg}\) for water (about 2257 kJ/kg at 100 °C) is the reason steam is such an effective heat-transport fluid, and it underlies essentially every thermal power plant ever built.

## 4. First Law for Control Volumes

Real hardware — turbines, compressors, boilers, condensers, heat exchangers — is open. Writing a mass-and-energy balance around a control volume yields

\[
\frac{dE_{cv}}{dt} = \dot{Q} - \dot{W} + \sum_{in} \dot{m}\left(h + \tfrac{V^2}{2} + gz\right) - \sum_{out} \dot{m}\left(h + \tfrac{V^2}{2} + gz\right).
\]

Under the assumption of **steady-state, steady-flow (SSSF)** — \(dE_{cv}/dt = 0\), \(dm_{cv}/dt = 0\), properties at each port fixed in time — this becomes the workhorse SSSF equation.

### 4.1 Single-Inlet, Single-Outlet Devices

- **Nozzle / diffuser:** \(\dot{Q} \approx 0\), \(\dot{W}=0\); energy balance gives \(h_1 + V_1^2/2 = h_2 + V_2^2/2\). A nozzle converts enthalpy to kinetic energy; a diffuser does the reverse.
- **Turbine:** adiabatic, shaft work out. \(\dot{W}_t = \dot{m}(h_1 - h_2)\). An **isentropic turbine** provides the maximum work for given inlet state and outlet pressure; its efficiency \(\eta_t = (h_1 - h_2)/(h_1 - h_{2s})\) compares the real drop to the isentropic one.
- **Compressor / pump:** shaft work in. \(\dot{W}_c = \dot{m}(h_2 - h_1)\). Isentropic efficiency \(\eta_c = (h_{2s} - h_1)/(h_2 - h_1)\).
- **Throttle:** adiabatic, no work, negligible kinetic change; \(h_1 = h_2\). Throttling is isenthalpic and entropy-generating, ubiquitous in refrigeration.
- **Heat exchanger:** no work, usually negligible \(\Delta \mathrm{KE}\), \(\Delta \mathrm{PE}\); energy balance equates heat picked up by one stream to heat given up by the other.
- **Mixing chamber:** energy balance on adiabatic mixing gives \(\sum \dot{m}_i h_i = \dot{m}_{out} h_{out}\).

### 4.2 Transient Control Volumes

Tank-filling and tank-emptying problems drop the steady-state assumption and require the full integral form. The characteristic result is that, for an initially evacuated rigid tank filled from a large line at state \(h_{line}\), the gas inside ends at \(u_2 = h_{line}\) — adiabatic filling raises the internal energy to the line enthalpy.

## 5. Second Law and Entropy

### 5.1 Statements of the Second Law

Two equivalent statements of the Second Law are often introduced:

- **Kelvin-Planck:** no device operating in a cycle can produce net work by exchanging heat with a single thermal reservoir. A heat engine always rejects heat to a cold reservoir.
- **Clausius:** no device operating in a cycle can transfer heat from a cold body to a hot body without requiring a work input.

These are equivalent; a violation of one implies a violation of the other.

### 5.2 Reversibility and the Carnot Limit

A **reversible** process is one whose direction can be flipped by an infinitesimal change in conditions and which leaves no net change in the universe. Real processes are irreversible because of friction, finite-rate heat transfer, unrestrained expansion, mixing, chemical reaction, and inelastic deformation.

A **Carnot cycle** runs between two reservoirs through two isothermal and two isentropic processes. Its thermal efficiency depends only on reservoir temperatures:

\[
\eta_{Carnot} = 1 - \frac{T_C}{T_H}.
\]

Every real heat engine operating between the same reservoirs is less efficient. Carnot's corollaries state that (i) all reversible engines between the same two reservoirs have the same efficiency, and (ii) any real engine has lower efficiency than the reversible one. The Carnot efficiency is the cap that ultimately limits any fossil, nuclear, solar-thermal, or geothermal power plant.

### 5.3 Entropy

The Clausius inequality \(\oint \delta Q / T \le 0\) for any cycle (equality for reversible cycles) implies the existence of a property \(s\) such that

\[
dS = \left(\frac{\delta Q}{T}\right)_{rev}.
\]

For a closed system,

\[
\Delta S = \int \frac{\delta Q}{T} + S_{gen}, \qquad S_{gen} \ge 0,
\]

with equality only for reversible processes. Entropy generation \(S_{gen}\) is zero for reversible processes, positive for irreversible ones, and forbidden from being negative in an isolated system — the celebrated "arrow of time."

### 5.4 \(T\,ds\) Relations and Ideal-Gas Entropy

Combining the First Law with the definition of entropy yields the Gibbs equations,

\[
T\,ds = du + P\,dv, \qquad T\,ds = dh - v\,dP.
\]

For an ideal gas with constant specific heats,

\[
\Delta s = c_v \ln\!\frac{T_2}{T_1} + R \ln\!\frac{v_2}{v_1} = c_p \ln\!\frac{T_2}{T_1} - R \ln\!\frac{P_2}{P_1}.
\]

Isentropic (\(\Delta s = 0\)) relations for ideal gases follow immediately and are the basis for cycle analysis.

### 5.5 Entropy Balance for Control Volumes

For a control volume at steady state,

\[
\sum \frac{\dot{Q}_j}{T_j} + \sum_{in} \dot{m} s - \sum_{out} \dot{m} s + \dot{S}_{gen} = 0, \qquad \dot{S}_{gen} \ge 0.
\]

Entropy generation quantifies irreversibility. Throttles, finite-\(\Delta T\) heat exchange, mixing, and combustion are the dominant sources in typical energy systems.

## 6. Exergy and the Quality of Energy

### 6.1 Why Energy Quality Matters

The First Law treats all joules equally. The Second Law does not. A joule of electricity can be converted into work with nearly 100% effectiveness; a joule of low-temperature waste heat can do almost no useful work at all. **Exergy** (availability) formalizes this intuition by measuring, for a given system in a given environment \((T_0, P_0)\), the maximum useful work extractable as the system is brought to equilibrium with the environment.

### 6.2 Exergy of a Closed System and of a Flowing Stream

For a closed system,

\[
\Phi = (U - U_0) + P_0(V - V_0) - T_0(S - S_0) + \mathrm{KE} + \mathrm{PE}.
\]

For a flowing stream (control-volume exergy),

\[
\psi = (h - h_0) - T_0(s - s_0) + \tfrac{V^2}{2} + gz.
\]

For heat \(Q\) transferred across a boundary at temperature \(T_b\), the associated exergy is the Carnot work \(\left(1 - T_0/T_b\right)Q\).

### 6.3 Exergy Balance and the Gouy–Stodola Theorem

For a control volume at steady state,

\[
\sum \left(1 - \frac{T_0}{T_j}\right)\dot{Q}_j - \dot{W}_{cv} + \sum_{in}\dot{m}\psi - \sum_{out}\dot{m}\psi - \dot{I} = 0,
\]

with irreversibility rate \(\dot{I} = T_0 \dot{S}_{gen} \ge 0\). Every joule of exergy destroyed anywhere in the system equals the ambient temperature times the entropy generated there. Exergy analysis therefore *maps irreversibilities*: it tells the designer not merely that a system is inefficient, but *where*.

<div><strong>Example of exergy insight.</strong> <em>A residential gas furnace burning methane at an adiabatic flame temperature of roughly 2000 K and delivering room air at 295 K has near-unity First Law efficiency yet destroys most of the fuel's exergy in the combustion and the finite-\(\Delta T\) heat transfer. A heat pump moving the same kilojoule of thermal energy from outdoor air to indoor air destroys far less exergy per unit heat delivered. This is the thermodynamic argument behind building electrification.</em></div>

## 7. Power and Refrigeration Cycles

Practical energy conversion is analyzed through a small family of idealized cycles, each with a characteristic working fluid and hardware inventory. Efficiency bounds follow from the Second Law; performance is improved by raising mean heat-addition temperature, lowering mean heat-rejection temperature, and reducing irreversibilities.

### 7.1 Vapor Power: Rankine Cycle

The **ideal Rankine cycle** comprises an isentropic pump, an isobaric boiler, an isentropic turbine, and an isobaric condenser. Efficiency is

\[
\eta_{th} = \frac{w_{turb} - w_{pump}}{q_{in}} = 1 - \frac{q_{out}}{q_{in}}.
\]

Real implementations improve on the simple cycle with:

- **Superheat:** raises turbine inlet temperature, lifts mean heat-addition temperature, pushes outlet into the superheated region to protect blades from droplets.
- **Reheat:** expands, reheats at intermediate pressure, re-expands. Same motivation.
- **Regeneration:** bleed steam from turbine to preheat feedwater, raising average heat-addition temperature.
- **Supercritical operation:** \(P_{boiler} > P_{crit}\); eliminates two-phase heat transfer in the boiler and pushes efficiency toward 45% for modern coal plants.

Rankine with water is the architecture of every utility-scale steam plant — coal, nuclear, concentrated solar-thermal, biomass, many geothermal, and bottoming cycles of combined-cycle gas turbines.

### 7.2 Gas Power: Brayton Cycle

The **ideal Brayton cycle** — isentropic compression, isobaric combustion, isentropic expansion, isobaric rejection — is the open cycle realized in every jet engine and simple-cycle gas turbine. For cold-air-standard analysis with pressure ratio \(r_p\) and specific-heat ratio \(k\),

\[
\eta_{th,Brayton} = 1 - \frac{1}{r_p^{(k-1)/k}}.
\]

Higher pressure ratio improves efficiency; real limits come from turbine inlet temperature (metallurgy, blade cooling) and compressor stage count. **Regeneration** uses hot exhaust to preheat compressor discharge before combustion and pays off at moderate pressure ratios. **Intercooling** and **reheat** bring the cycle closer to an Ericsson limit.

**Combined cycle:** exhausts a Brayton top cycle into a Rankine bottom cycle via a heat recovery steam generator. Combined-cycle efficiencies above 60% are achievable in modern utility units; in all realistic natural-gas generation scenarios this is the architecture of choice.

### 7.3 Reciprocating Engine Cycles

- **Otto cycle** (spark ignition): isentropic compression, isochoric heat addition, isentropic expansion, isochoric heat rejection. With compression ratio \(r = V_1/V_2\), \(\eta_{Otto} = 1 - 1/r^{k-1}\). Real SI engines are limited by knock, which caps \(r\) around 10–12 for gasoline.
- **Diesel cycle** (compression ignition): isobaric rather than isochoric heat addition. With cut-off ratio \(r_c\),

\[
\eta_{Diesel} = 1 - \frac{1}{r^{k-1}}\left[\frac{r_c^{k} - 1}{k(r_c - 1)}\right].
\]

For the same compression ratio Otto beats Diesel, but Diesels tolerate much higher \(r\) (14–22) because they compress air alone, so they win in practice.

- **Dual (limited-pressure) cycle:** heat addition partly isochoric, partly isobaric; a better model of real CI combustion.

### 7.4 Refrigeration and Heat Pumps

The **vapor-compression refrigeration cycle** — evaporator, compressor, condenser, throttle — is the mirror of Rankine with a refrigerant (R-134a, R-1234yf, R-410A, CO\(_2\), ammonia). Performance is measured by **coefficient of performance**,

\[
\mathrm{COP}_{ref} = \frac{Q_L}{W_{net,in}}, \qquad \mathrm{COP}_{HP} = \frac{Q_H}{W_{net,in}} = \mathrm{COP}_{ref} + 1.
\]

The Carnot bound in refrigeration is

\[
\mathrm{COP}_{ref,rev} = \frac{T_L}{T_H - T_L}, \qquad \mathrm{COP}_{HP,rev} = \frac{T_H}{T_H - T_L}.
\]

A heat pump sized for mild climate heating can deliver 3–4 units of heat per unit of electrical work, which is why heat-pump space heating outperforms combustion on both exergy and carbon grounds whenever the grid is cleaner than the gas it displaces.

Other refrigeration architectures worth noting: **absorption cycles** (water-ammonia or water-lithium-bromide; driven by heat rather than work, useful when waste heat is abundant), **gas refrigeration** (reverse Brayton; cryogenics, aircraft environmental control), and **thermoelectric** (no cycle, no fluid; Peltier junctions; quiet and compact but low COP).

## 8. Heat Transfer

Thermodynamics sets the limits; heat transfer sets the rates. Without rate information the First Law cannot be applied to buildings, electronics, heat exchangers, or solar collectors. The three mechanisms are conduction, convection, and radiation.

### 8.1 Conduction

Heat conducts through solids (and, to a smaller extent, stationary fluids) by molecular interaction without bulk motion. The one-dimensional **Fourier law** is

\[
\dot{q} = -k \frac{dT}{dx},
\]

with thermal conductivity \(k\) in W/(m·K). For a plane wall of thickness \(L\), area \(A\), and steady conduction between surface temperatures \(T_1\) and \(T_2\),

\[
\dot{Q} = \frac{kA(T_1 - T_2)}{L} = \frac{T_1 - T_2}{R_{cond}}, \qquad R_{cond} = \frac{L}{kA}.
\]

The **thermal resistance network** approach, analogous to electrical circuits, handles series (composite walls) and parallel (studs + insulation) paths. A typical exterior wall section might combine drywall, vapor barrier, insulation, sheathing, and cladding with parallel stud paths; the network gives the overall \(U\)-value central to building energy analysis.

For cylindrical geometry (pipes, wire insulation),

\[
\dot{Q} = \frac{2\pi k L (T_1 - T_2)}{\ln(r_2/r_1)}.
\]

There is a **critical radius** \(r_{cr} = k/h\) below which adding insulation to a pipe can *increase* heat loss because increased surface area for convection wins against added conductive resistance.

The transient heat equation \(\partial T/\partial t = \alpha \nabla^2 T\), with thermal diffusivity \(\alpha = k/(\rho c_p)\), governs unsteady conduction. The **Biot number** \(\mathrm{Bi} = hL/k\) tells you whether lumped-capacitance (\(\mathrm{Bi} \ll 0.1\)) is defensible.

### 8.2 Convection

Convection is heat transfer between a surface and an adjacent moving fluid. **Newton's law of cooling** states

\[
\dot{q} = h (T_s - T_\infty),
\]

with convective coefficient \(h\) depending on geometry, flow regime, fluid properties, and temperature difference. Dimensionless groups structure the correlations:

- **Reynolds** \(\mathrm{Re} = \rho V L/\mu\) (inertial vs viscous).
- **Prandtl** \(\mathrm{Pr} = \mu c_p/k\) (momentum vs thermal diffusivity).
- **Nusselt** \(\mathrm{Nu} = hL/k\) (convective vs conductive at the wall).
- **Grashof** \(\mathrm{Gr} = g\beta(T_s - T_\infty)L^3/\nu^2\) and **Rayleigh** \(\mathrm{Ra} = \mathrm{Gr}\,\mathrm{Pr}\) (natural convection).

Correlations of form \(\mathrm{Nu} = C\,\mathrm{Re}^m \mathrm{Pr}^n\) are legion. Representative forced-convection results include:

- **Turbulent internal flow (Dittus-Boelter):** \(\mathrm{Nu} = 0.023\,\mathrm{Re}^{0.8}\,\mathrm{Pr}^{n}\), with \(n=0.4\) for heating, \(0.3\) for cooling, valid for \(\mathrm{Re} \ge 10^4\), \(0.7 \le \mathrm{Pr} \le 160\), \(L/D \ge 10\).
- **External flow over flat plate (laminar, local):** \(\mathrm{Nu}_x = 0.332\,\mathrm{Re}_x^{1/2}\,\mathrm{Pr}^{1/3}\).
- **Cross flow over cylinders (Churchill-Bernstein):** a single correlation valid from \(\mathrm{Re}\,\mathrm{Pr} > 0.2\).
- **Natural convection over vertical plate:** \(\mathrm{Nu} = 0.59\,\mathrm{Ra}^{1/4}\) (laminar), \(0.1\,\mathrm{Ra}^{1/3}\) (turbulent).

The **heat-exchanger effectiveness-NTU** method parametrizes exchanger performance through \(\varepsilon = \dot{Q}/\dot{Q}_{max}\), \(\mathrm{NTU} = UA/C_{min}\), \(C_r = C_{min}/C_{max}\), with \(\varepsilon(\mathrm{NTU}, C_r)\) depending on flow arrangement (parallel, counter, cross, shell-and-tube). Counterflow always outperforms parallel flow for the same \(UA\).

### 8.3 Radiation

All bodies above absolute zero emit electromagnetic radiation. A perfect emitter and absorber is a **blackbody**, with Planck's spectral distribution and the Stefan-Boltzmann integrated emission

\[
E_b = \sigma T^4, \qquad \sigma = 5.670 \times 10^{-8}\ \mathrm{W/(m^2 K^4)}.
\]

**Wien's displacement law** \(\lambda_{max} T \approx 2898\ \mu\mathrm{m}\cdot\mathrm{K}\) places the peak wavelength of solar emission (\(T \approx 5800\) K) in the visible and Earth's emission (\(T \approx 288\) K) in the long-wave infrared — the spectral separation that underlies both greenhouse-gas physics and selective-surface solar collectors.

Real surfaces are characterized by emissivity \(\varepsilon(\lambda, \theta)\), absorptivity \(\alpha\), reflectivity \(\rho\), and (for non-opaque surfaces) transmissivity \(\tau\). **Kirchhoff's law** gives \(\alpha(\lambda, T) = \varepsilon(\lambda, T)\) at equilibrium. For diffuse gray surfaces exchanging radiation,

\[
\dot{Q}_{1 \to 2} = \frac{\sigma(T_1^4 - T_2^4)}{\dfrac{1-\varepsilon_1}{\varepsilon_1 A_1} + \dfrac{1}{A_1 F_{12}} + \dfrac{1-\varepsilon_2}{\varepsilon_2 A_2}},
\]

where \(F_{12}\) is the view factor. Radiation often dominates at high temperatures (furnaces, kilns, space applications) and in vacuum, and it is never truly negligible at building-envelope temperatures, where it is routinely lumped into a linearized coefficient \(h_{rad}\).

### 8.4 Combined Modes

Realistic surfaces exchange heat simultaneously by multiple modes — e.g., a sunlit roof absorbs short-wave solar, emits long-wave to the sky, convects to outdoor air, and conducts to the building interior. Thermal circuits combine these in series (across layers) and parallel (different mechanisms at a surface) just as in electrical analysis.

## 9. Energy and Environment Applications

A systems design curriculum should leave the student able to reason about energy systems encountered in practice. This section sketches how the foundations above bear on buildings, transportation, and large-scale generation.

### 9.1 Buildings and HVAC

A building envelope is an assembly of walls, roof, floor, windows, and air-exchange paths. Steady-state heat-loss estimation couples each element's \(UA\)-value to the heating/cooling degree days of the climate to estimate annual loads. \(U\)-value is the inverse of the element's total thermal resistance (interior film, layers, exterior film), with surface films typically \(h_i \approx 8\) W/(m\(^2\) K) inside, \(h_o \approx 25\) W/(m\(^2\) K) outside. Windows combine convection (inside and outside), conduction through glass, and radiation; low-emissivity coatings drastically cut long-wave transmission.

**Infiltration and ventilation** introduce outside air at outdoor enthalpy \(h_{out}\) and require conditioning to indoor enthalpy \(h_{in}\). Energy or enthalpy recovery ventilators transfer sensible and latent heat between exhaust and supply streams.

HVAC analysis uses **psychrometrics** — thermodynamic properties of moist air. Dry-bulb temperature, wet-bulb temperature, humidity ratio \(\omega = m_w/m_a\), relative humidity \(\phi\), and specific enthalpy \(h = c_{p,a}T + \omega(h_{fg,0} + c_{p,v}T)\) suffice to characterize moist air states on a psychrometric chart. Heating, cooling, humidification, dehumidification, and adiabatic mixing appear as distinct paths on the chart; systems design trades off energy use, comfort, and indoor air quality among them.

Heat pumps are dramatically more exergy-efficient than combustion for space heating whenever outdoor temperatures remain above the point at which their COP drops below the ratio of electricity-to-gas source-energy factors. Ground-source heat pumps, by coupling to the near-constant ground temperature, maintain high COP all year at the cost of capital-intensive boreholes.

### 9.2 Combustion and Emissions

Combustion is the fast, exothermic oxidation of a fuel. Stoichiometric combustion of methane is

\[
\mathrm{CH_4} + 2\mathrm{O_2} \to \mathrm{CO_2} + 2\mathrm{H_2O},
\]

with theoretical air defined by the oxygen required plus accompanying atmospheric nitrogen. Real combustion uses excess air; **equivalence ratio** \(\phi = (F/A)/(F/A)_{stoich}\) parametrizes rich (\(\phi > 1\)) versus lean (\(\phi < 1\)). Adiabatic flame temperature follows from an energy balance with zero heat loss.

Emissions physics tracks CO (from rich incomplete combustion), unburned hydrocarbons (from quenching at walls), NO\(_x\) (thermal NO formed at high \(T\); lean-premixed combustion is the mitigation lever), soot (rich diffusion flames), SO\(_2\) (from fuel sulfur; scrubbing or low-sulfur fuel), and CO\(_2\). A systems designer's CO\(_2\) inventory is fixed by fuel carbon content and combustion efficiency; mitigation is either cleaner fuel or not combusting at all.

**Higher and lower heating values** differ by whether the product water is condensed (HHV) or left as vapor (LHV). Condensing boilers capture much of the latent heat of combustion water and reach 95%+ First Law efficiency, but the exergy argument of section 6 still applies.

### 9.3 Renewables

- **Solar thermal:** flat-plate and evacuated-tube collectors, and concentrating (parabolic trough, tower, dish) systems. Collector efficiency drops with operating temperature because radiative losses scale as \(T^4\). Concentration compensates by reducing loss area relative to absorbing area. Concentrated solar with thermal storage (molten salt) enables dispatchable Rankine generation.
- **Photovoltaic:** not a thermodynamic heat engine but a quantum device; worth distinguishing from thermal pathways. Detailed balance places the Shockley-Queisser single-junction limit near 33%.
- **Wind:** kinetic-energy extraction. The Betz limit \(16/27 \approx 59.3\%\) bounds the fraction of kinetic energy in the upstream stream tube that a rotor can capture without stalling the flow.
- **Geothermal:** low-temperature reservoirs drive binary (ORC — organic Rankine) cycles; high-enthalpy reservoirs support direct steam turbines. Sustainability depends on reinjection to preserve the resource.
- **Ocean energy:** tidal (potential/kinetic), wave, and OTEC (ocean thermal energy conversion). OTEC efficiencies are tiny because \(\Delta T\) between surface and deep water is small, but energy fluxes integrated globally are large.

<div><strong>Design takeaway.</strong> <em>Renewables do not magically escape thermodynamic bounds — wind has Betz, solar thermal has Carnot at collector temperature, PV has Shockley-Queisser. What they change is the exergy cost of the fuel, since solar and wind resources are essentially free. The engineering consequence is that renewable system design is dominated by capital cost, capacity factor, and integration with storage and grid, rather than by fuel efficiency per se.</em></div>

### 9.4 Life-Cycle Energy

A systems designer's scope extends beyond operational energy to **embodied energy** — the energy used to extract, process, transport, install, maintain, and dispose of a system. Steel, aluminum, and concrete have embodied energies of order 20, 200, and 1 MJ/kg respectively; photovoltaic modules and wind turbines have well-studied energy payback times on the order of 1–2 years in good resource. Life-cycle assessment is the framework that couples thermodynamic accounting to environmental accounting.

## 10. Introduction to Statistical Thermodynamics

Classical thermodynamics is phenomenological: it treats temperature, entropy, and pressure as measurable bulk properties without asking where they come from. Statistical thermodynamics derives them from the mechanics of many-particle systems. The payoff for a systems designer is not computational — you will not normally evaluate partition functions on the job — but conceptual. The statistical view explains *why* entropy exists, *why* the Second Law holds, and *why* certain approximations (e.g., constant specific heats) are good ones.

### 10.1 Microstates, Macrostates, and Boltzmann Entropy

A system's **microstate** specifies every degree of freedom (positions, momenta, quantum occupation numbers). Its **macrostate** is specified by macroscopic observables (energy, volume, particle number). An enormous number of microstates \(\Omega(E,V,N)\) is typically consistent with a given macrostate.

Boltzmann's entropy connects the two:

\[
S = k_B \ln \Omega,
\]

with \(k_B = 1.381 \times 10^{-23}\) J/K. Entropy *is* the logarithm of the count of microstates consistent with the macroscopic description. The Second Law then reads: isolated systems evolve toward macrostates of vastly larger \(\Omega\), because those macrostates occupy vastly more phase-space volume; reversibility is not forbidden, merely astronomically unlikely on thermodynamic time scales.

### 10.2 Ensembles and the Boltzmann Distribution

For a system in thermal contact with a heat bath at temperature \(T\), the probability of microstate \(i\) with energy \(E_i\) is

\[
p_i = \frac{e^{-E_i/(k_B T)}}{Z}, \qquad Z = \sum_i e^{-E_i/(k_B T)}.
\]

\(Z\) is the **canonical partition function**. All thermodynamic properties follow from it: \(\langle E \rangle = -\partial \ln Z/\partial \beta\) with \(\beta = 1/(k_B T)\), \(F = -k_B T \ln Z\) (Helmholtz free energy), \(S = -\partial F/\partial T\), and so on.

Two qualitative consequences matter:

- **Exponential suppression:** states with energy much greater than \(k_B T\) are essentially never occupied. This is why thermal noise at room temperature (roughly 1/40 eV) cannot excite optical transitions (several eV) but can excite rotational or translational modes (millielectronvolts).
- **Equal probability at equal energy:** the distribution depends only on energy, not on microstructural labels; this is the statistical origin of the Zeroth Law.

### 10.3 Equipartition and Specific Heats

For a classical system with Hamiltonian quadratic in each of \(f\) independent degrees of freedom, **equipartition** gives

\[
\langle E \rangle = \tfrac{f}{2} k_B T \quad \text{per molecule},
\]

and a molar heat capacity of \(fR/2\). Monatomic ideal gases have \(f=3\) translational modes, so \(c_v = 3R/2\), \(c_p = 5R/2\), \(k = 5/3 \approx 1.67\). Diatomic gases add 2 rotational modes (\(c_v = 5R/2\), \(k = 7/5 = 1.4\)), matching air to good accuracy at ordinary temperatures. Vibrational modes freeze out at low \(T\) because their characteristic \(\hbar\omega/k_B\) exceeds room temperature — a quantum effect that equipartition misses but that a quantum partition function captures exactly.

### 10.4 Statistical Interpretation of Irreversibility

The classical Second Law is time-asymmetric; the microscopic equations of motion (Newtonian or quantum) are time-symmetric. The resolution — Boltzmann's H-theorem and its modern successors — is that macroscopic irreversibility reflects overwhelming statistical weight, not microscopic law. Reversing the molecular velocities of a gas after free expansion would in principle return it to the original small volume, but that initial condition has Lebesgue measure zero in any thermodynamically reasonable sense. The arrow of time is a boundary-condition phenomenon: the universe started in an extraordinarily low-entropy state, and its evolution toward high entropy is what we experience as forward time.

### 10.5 Connection Back to Engineering

Statistical thermodynamics supplies three practical reminders to an engineer:

- Specific heats are not constant. Their variation with temperature reflects which modes are active, and cycle analyses that assume constant \(c_p\) over hundreds of kelvin will err; this is why air-standard analysis uses temperature-dependent tables in careful work.
- Entropy is information. The negentropy of a well-ordered state (a charged battery, a separated mixture, a cold reservoir) is, in a precise sense, the information that distinguishes it from equilibrium. Preserving negentropy requires minimizing entropy generation.
- The Second Law is probabilistic, not absolute. For macroscopic systems the probability of spontaneous entropy decrease is so small as to be operationally zero; for nanoscale and biological systems it is not, and fluctuation theorems (Jarzynski, Crooks) quantify when small-system thermodynamics begins to look different from bulk thermodynamics.

## 11. Synthesis: A Thermodynamic Checklist for Systems Design

Every energy-system design problem encountered in SYDE practice eventually reduces to a short list of thermodynamic questions:

1. **Draw the control volume.** Where are the boundaries? What crosses them — mass, heat, work, radiation?
2. **Apply the First Law.** Does the energy balance close? Where is stored energy changing? What are the dominant transfer terms?
3. **Apply the Second Law.** Which processes generate entropy? Which temperatures characterize heat transfer? What is the Carnot bound for any conversion step?
4. **Compute exergy.** How much useful work is available in the resource? Where is exergy destroyed? Would a different architecture destroy less?
5. **Evaluate heat-transfer rates.** Are conduction, convection, and radiation all accounted for at each surface? Are the correlations applicable to the geometry and flow regime?
6. **Check temperature-dependent properties.** Are constant-specific-heat assumptions acceptable over the temperature range of the process?
7. **Widen to life cycle.** Does operational analysis dominate, or is embodied energy comparable? Are end-of-life flows included?
8. **Sanity check with statistical intuition.** Is any postulated process violating equipartition, the Boltzmann distribution, or the improbability of spontaneous order? If so, something is wrong.

The tools presented in this set of notes — state principles, First Law for closed systems and control volumes, Second Law, entropy and exergy, ideal cycles, heat-transfer mechanisms and correlations, application-domain structure, and the statistical foundations — together constitute a minimum working kit. The engineering judgment that integrates them into a design is built by practicing them on problems until the steps above become automatic, and that practice is the real subject of the course.
