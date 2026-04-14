---
title: "CIVE 542: Pavement Structural Design"
prof: "Pejoohan Tavassoti-Kheiry"
subjects: "CIVE"
---

## Sources and References

- Huang, Y. H. *Pavement Analysis and Design*, 2nd edition, Pearson Prentice Hall.
- Papagiannakis, A. T. and Masad, E. A. *Pavement Design and Materials*, Wiley.
- Yoder, E. J. and Witczak, M. W. *Principles of Pavement Design*, Wiley.
- AASHTO *Guide for Design of Pavement Structures*, 1993.
- AASHTO *Mechanistic-Empirical Pavement Design Guide: A Manual of Practice* (MEPDG / Pavement ME Design).
- Transportation Association of Canada, *Pavement Asset Design and Management Guide*.
- NCHRP Report 1-37A, *Guide for Mechanistic-Empirical Design of New and Rehabilitated Pavement Structures*, and related NCHRP reports on calibration and traffic characterization.
- Asphalt Institute, *Thickness Design: Asphalt Pavements for Highways and Streets* (MS-1).
- MIT 1.761 *Transportation Systems Analysis: Performance and Optimization*; UC Berkeley CE 270 *Design of Pavements*; University of Illinois CEE 409 *Pavement Design*.

# Chapter 1: Introduction to Pavement Engineering

Pavements form the load-bearing surface of the overwhelming majority of the transportation network, and their structural design determines how a layered assembly of compacted soil, granular materials, and bound layers distributes repeated wheel loads to the underlying subgrade without accumulating unacceptable damage over a target service life. Two families dominate practice: flexible pavements, in which a relatively thin hot-mix asphalt (HMA) surface rests on granular base and subbase, and rigid pavements, in which a Portland cement concrete (PCC) slab carries loads primarily in bending. Composite and semi-rigid variants combine characteristics of both. The early history of modern pavement engineering traces through the Telford and Macadam construction traditions of the nineteenth century, the AASHO Road Test of 1958 to 1960 that supplied the empirical backbone of AASHTO's structural design methods, and the transition to mechanistic-empirical design codified in the MEPDG in the 2000s.

A pavement section is engineered to satisfy three performance demands simultaneously: structural capacity adequate to carry the cumulative traffic load spectrum, functional quality expressed as ride comfort, friction, and noise, and durability against environmental actions such as freeze-thaw cycling, moisture infiltration, and temperature-driven aging. The hierarchy of layers from surface to subgrade reflects decreasing stiffness and strength, so that vertical stress applied by a tire at the surface spreads through each layer and arrives at the subgrade at a magnitude the in-situ soil can sustain without excessive plastic strain. This load-spreading logic underpins both empirical thickness charts and mechanistic stress-strain analysis.

# Chapter 2: Traffic Analysis and Load Equivalency

Structural design must translate a projected mixed traffic stream into a standardized damage quantity. The AASHO Road Test defined the 18-kip (80 kN) single axle with dual tires as the equivalent single axle load (ESAL), and every other axle configuration is converted to an equivalent number of standard axles using a load equivalency factor (LEF). The fourth-power approximation states that

\[
\text{LEF} \approx \left(\frac{L}{L_{s}}\right)^{4}
\]

where \( L \) is the actual axle load and \( L_{s} \) is the standard axle load, so that doubling an axle load multiplies its structural damage by roughly sixteen. The AASHTO equivalency tables refine this with coefficients that depend on pavement type, structural number, and terminal serviceability.

Design ESALs for the analysis period are obtained by summing over vehicle classes, axle configurations, directional and lane distribution factors, and annual growth. A compact form is

\[
W_{18} = \mathrm{AADT} \cdot T \cdot T_{f} \cdot D \cdot L \cdot 365 \cdot \frac{(1+g)^{n}-1}{g}
\]

where \( T \) is the truck percentage, \( T_{f} \) the truck factor, \( D \) the directional distribution factor, \( L \) the lane distribution factor, \( g \) the growth rate, and \( n \) the analysis period. Modern mechanistic-empirical design replaces the single ESAL count with a full axle load spectrum, in which monthly and hourly distributions of axles in each load bin drive layer-by-layer damage calculations. Weigh-in-motion (WIM) data supply the spectra in AASHTOWare Pavement ME at the highest hierarchical input level.

# Chapter 3: Stresses and Strains in Layered Pavements

The theoretical basis for computing pavement responses is linear elasticity applied to layered half-spaces. The simplest model is Boussinesq's solution for a point load on a semi-infinite, homogeneous, isotropic, elastic medium, which yields the vertical stress at depth \( z \) below a point load \( P \) as

\[
\sigma_{z} = \frac{3P}{2\pi z^{2}} \cos^{5}\theta
\]

and for a uniformly loaded circular area of radius \( a \) and contact pressure \( p \),

\[
\sigma_{z} = p \left[1 - \left(\frac{z^{2}}{a^{2}+z^{2}}\right)^{3/2}\right]
\]

Boussinesq assumes a single homogeneous medium, which overstates stresses near the surface of a stiff HMA layer. Burmister's two-layer and multilayer elastic theory generalizes the analysis by enforcing interface equilibrium and compatibility between layers of different moduli \( E_{i} \) and Poisson's ratios \( \mu_{i} \). The modular ratio \( E_{1}/E_{2} \) governs how much stress the stiff upper layer diverts away from the weaker subgrade, and the deflection under a circular load is commonly written as

\[
w_{0} = \frac{1.5 p a}{E_{2}} F_{w}
\]

where \( F_{w} \) is Burmister's deflection factor tabulated against modular ratio and the ratio \( h_{1}/a \). Modern practice uses multilayer elastic programs such as KENPAVE's KENLAYER module, BISAR, or WESLEA to obtain the stresses, strains, and displacements at any point in a layered section. For rigid pavements, Westergaard's slab-on-dense-liquid solutions for interior, edge, and corner loading provide the analogous closed-form responses, with the radius of relative stiffness

\[
\ell = \left[\frac{E h^{3}}{12(1-\mu^{2}) k}\right]^{1/4}
\]

setting the scale over which the slab distributes a wheel load to the foundation, where \( k \) is the modulus of subgrade reaction.

Two critical mechanistic responses drive flexible pavement fatigue and rutting: the horizontal tensile strain \( \varepsilon_{t} \) at the bottom of the asphalt layer, and the vertical compressive strain \( \varepsilon_{c} \) at the top of the subgrade. For rigid pavements the critical response is the flexural tensile stress at the bottom of the slab under combined traffic and thermal curling. These responses feed transfer functions that predict distress accumulation over time.

# Chapter 4: Pavement Materials and Characterization

The upper bound layers of a flexible pavement are built from asphalt binder combined with dense- or gap-graded aggregate. Binder grading evolved from penetration and viscosity classifications to the Superpave performance grade (PG) system, in which a binder labeled PG 64-22 must meet rheological criteria at a high pavement temperature of 64 C and a low pavement temperature of -22 C. Superpave mix design selects an aggregate gradation passing control and restricted zones and compacts specimens in a gyratory compactor to obtain volumetric properties such as air voids, voids in mineral aggregate (VMA), and voids filled with asphalt (VFA). Performance testing of mixes now includes the dynamic modulus \( |E^{*}| \) master curve, Hamburg wheel-tracking rut depth, and disc-shaped compact tension or semi-circular bend fracture energy for low-temperature cracking.

Unbound base, subbase, and subgrade materials are characterized by gradation, Atterberg limits, compaction curves, California Bearing Ratio (CBR), and resilient modulus \( M_{R} \). Resilient modulus is the repeated-load triaxial stiffness defined as

\[
M_{R} = \frac{\sigma_{d}}{\varepsilon_{r}}
\]

where \( \sigma_{d} \) is the cyclic deviator stress and \( \varepsilon_{r} \) is the recoverable axial strain, and it is stress-dependent for granular materials (often modeled with the \( k_{1}\text{-}k_{2}\text{-}k_{3} \) universal model) and moisture-dependent for fine-grained soils. Subgrade identification by the AASHTO and Unified Soil Classification System guides the designer to likely problems: expansive clays demand moisture barriers or stabilization, while frost-susceptible silts require non-frost-susceptible subbases or adequate depth below the frost line. Frost action, through ice lens growth during freezing and bearing capacity loss on thaw, motivates the Canadian practice of designing to protect against differential heave and spring thaw weakening.

# Chapter 5: AASHTO 1993 Flexible Pavement Design

The AASHTO 1993 Guide is an empirical method calibrated to the AASHO Road Test and extended over decades through regression updates. The flexible pavement design equation relates the required structural number (SN) to the predicted traffic, reliability, and serviceability loss through

\[
\log_{10} W_{18} = Z_{R} S_{0} + 9.36 \log_{10}(SN+1) - 0.20 + \frac{\log_{10}\left(\frac{\Delta PSI}{4.2-1.5}\right)}{0.40 + \frac{1094}{(SN+1)^{5.19}}} + 2.32 \log_{10} M_{R} - 8.07
\]

where \( W_{18} \) is the cumulative 18-kip ESAL, \( Z_{R} \) is the standard normal deviate for the chosen reliability, \( S_{0} \) is the overall standard deviation of traffic and performance, \( \Delta PSI \) is the allowable drop in the Present Serviceability Index from initial to terminal, and \( M_{R} \) is the effective roadbed resilient modulus. The structural number is then distributed among layers according to

\[
SN = a_{1} D_{1} + a_{2} D_{2} m_{2} + a_{3} D_{3} m_{3}
\]

where each \( a_{i} \) is a layer coefficient reflecting relative strength, \( D_{i} \) is the layer thickness, and \( m_{i} \) is a drainage coefficient. Reliability is handled by increasing the design traffic above the mean prediction, effectively building a safety margin against the combined uncertainty in materials, construction, and future loading. The companion rigid pavement equation relates PCC slab thickness to traffic, concrete modulus of rupture, modulus of subgrade reaction, drainage, and load transfer.

# Chapter 6: Asphalt Institute and Mechanistic Design for Flexible Pavements

The Asphalt Institute MS-1 method is a mechanistic-empirical procedure that computes the maximum allowable number of load repetitions from transfer functions anchored in layered-elastic responses. The fatigue cracking criterion has the form

\[
N_{f} = f_{1} (\varepsilon_{t})^{-f_{2}} (E^{*})^{-f_{3}}
\]

and the subgrade rutting criterion has the form

\[
N_{r} = f_{4} (\varepsilon_{c})^{-f_{5}}
\]

with regression coefficients \( f_{1}, \ldots, f_{5} \) calibrated to observed field performance. Designers iterate layer thicknesses and moduli until both fatigue and rutting demands are satisfied for the target traffic and reliability. The Transportation Association of Canada (TAC) approach in the *Pavement Asset Design and Management Guide* likewise integrates mechanistic responses with Canadian climate and materials data, and the Shell Pavement Design Method offers a parallel European lineage of the same philosophy.

# Chapter 7: Mechanistic-Empirical Pavement Design Guide (MEPDG)

The MEPDG, implemented in AASHTOWare Pavement ME Design, represents the current state of practice. Inputs are organized in three hierarchical levels, with level 1 using site-specific measured values, level 2 using regional correlations, and level 3 using national defaults. Traffic inputs include axle load spectra, vehicle class distributions, monthly adjustment factors, and growth. Climate inputs are drawn from the Enhanced Integrated Climatic Model, which simulates temperature and moisture profiles through the pavement on an hourly basis. Material inputs include the dynamic modulus master curve for asphalt, resilient modulus nonlinear models for unbound layers, and the modulus of rupture and coefficient of thermal expansion for concrete.

The MEPDG then runs a month-by-month simulation that computes critical strains and stresses from a layered elastic or finite element engine, applies calibrated transfer functions for rutting, bottom-up and top-down fatigue cracking, thermal cracking, and International Roughness Index (IRI), and accumulates damage using Miner's hypothesis

\[
D = \sum_{i=1}^{T} \frac{n_{i}}{N_{i}}
\]

where \( n_{i} \) is the number of load applications in increment \( i \) and \( N_{i} \) is the corresponding allowable number at that increment's conditions. Design is acceptable when predicted distresses at the desired reliability remain below specified performance thresholds over the analysis period. Local calibration of the transfer functions is essential because national coefficients inherited from the LTPP database may bias predictions under regional climate, materials, and construction practices.

# Chapter 8: Rigid Pavement Design and Analysis

Rigid pavements carry load through plate bending of a PCC slab over a supporting foundation. The classical Westergaard analysis provides closed-form expressions for maximum tensile stress at the slab bottom for interior, edge, and corner loading positions, and subsequent refinements by Pickett, Ray, and Ioannides generalized these to broader loading and support conditions. Temperature and moisture gradients through the slab introduce curling and warping stresses that combine with traffic stresses to produce the critical bending demand, usually during cool nights for top-down cracking and warm days for bottom-up cracking.

Jointed plain concrete pavement (JPCP) relies on transverse contraction joints with dowel bars that transfer shear across the joint and limit faulting. The joint spacing is typically set between 4 and 5 meters and must be short enough to control the ratio \( L/\ell \), where \( L \) is the slab length and \( \ell \) is the radius of relative stiffness, to keep curling stresses within allowable limits. Continuously reinforced concrete pavement (CRCP) uses longitudinal steel to force fine-spaced cracking and eliminate transverse joints. Design in AASHTO 1993 solves for slab thickness given the modulus of rupture, effective modulus of subgrade reaction, load transfer coefficient, drainage coefficient, reliability, and traffic, while MEPDG predicts transverse cracking, faulting, and smoothness over the analysis period.

# Chapter 9: Distresses, Failure Mechanisms, and Pavement Preservation

Flexible pavement distresses fall into three families: load-associated cracking including longitudinal wheel-path, alligator, and top-down cracks; non-load distresses such as transverse thermal cracking and block cracking from oxidative aging; and deformation distresses such as rutting from HMA shear flow, base densification, and subgrade consolidation. Rigid pavement distresses include transverse and longitudinal cracking driven by fatigue and curling, faulting from erosion and inadequate load transfer at joints, joint spalling, and materials-related durability problems such as alkali-silica reaction and D-cracking. The Pavement Condition Index (PCI), International Roughness Index (IRI), and Pavement Serviceability Index (PSI) quantify the condition of an in-service section and trigger maintenance, rehabilitation, or reconstruction decisions.

Pavement management systems integrate condition monitoring, performance prediction, and optimization to allocate budgets across a network. Life-cycle cost analysis discounts future agency and user costs to present worth using

\[
PW = \sum_{t=0}^{n} \frac{C_{t}}{(1+i)^{t}}
\]

where \( C_{t} \) is the cost at year \( t \), \( i \) is the real discount rate, and \( n \) is the analysis period, and compares alternatives through present worth or equivalent uniform annual cost. Preservation strategies applied early in a section's deterioration curve, such as crack sealing, chip seals, microsurfacing, and thin HMA overlays, extend life at a fraction of the cost of rehabilitation and are central to modern asset management.

# Chapter 10: Airport Pavements and Specialized Applications

Airport pavements must carry much heavier gear loads distributed over multiple wheel assemblies at lower repetition counts than highways. Design accounts for gear configuration, tire pressure, and taxiway versus runway traffic using procedures embodied in the Federal Aviation Administration's FAARFIELD program, which performs layered elastic analysis for flexible pavements and three-dimensional finite element analysis for rigid pavements with calibrated cumulative damage factors. Specialized applications in industrial and port facilities introduce concentrated static loads and slow-moving heavy equipment, low-volume rural roads require design approaches tuned to limited traffic and local materials, and urban streets must accommodate utility cuts and tight geometric constraints. Across all of these applications, the same mechanistic framework of layered responses, damage accumulation, and life-cycle evaluation applies, with empirical calibration adjusted to the relevant loading regime.
