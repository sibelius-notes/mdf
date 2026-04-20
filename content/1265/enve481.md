---
title: "ENVE 481: Open Channel Hydraulics"
subjects: "ENVE"
---

## Sources and References

- Chow, V. T. *Open-Channel Hydraulics.* McGraw-Hill.
- Henderson, F. M. *Open Channel Flow.* Macmillan.
- Sturm, T. W. *Open Channel Hydraulics.* McGraw-Hill.
- Chaudhry, M. H. *Open-Channel Flow.* Springer.
- Chanson, H. *The Hydraulics of Open Channel Flow.* Butterworth-Heinemann.
- Julien, P. Y. *Erosion and Sedimentation.* Cambridge University Press.
- Julien, P. Y. *River Mechanics.* Cambridge University Press.
- Fischer, H. B., List, E. J., Koh, R. C. Y., Imberger, J., and Brooks, N. H. *Mixing in Inland and Coastal Waters.* Academic Press.
- Arneson, L. A., Zevenbergen, L. W., Lagasse, P. F., and Clopper, P. E. *Evaluating Scour at Bridges (HEC-18).* U.S. Federal Highway Administration.
- Brunner, G. W. *HEC-RAS River Analysis System Hydraulic Reference Manual.* U.S. Army Corps of Engineers, Hydrologic Engineering Center.
- Normann, J. M., Houghtalen, R. J., and Johnston, W. J. *Hydraulic Design of Highway Culverts (HDS-5).* U.S. Federal Highway Administration.
- MIT OpenCourseWare 1.061 *Transport Processes in the Environment.*
- Stanford University CEE 260B *Open Channel Hydraulics* lecture sequence.

---

Open channel hydraulics is the branch of fluid mechanics that describes liquid flow in conduits with a free surface — rivers, canals, culverts under partial flow, storm sewers, overland flow, spillways, and floodplains. The defining feature is the free surface, at which gauge pressure is atmospheric. Unlike pressurized pipe flow, the flow depth itself is an unknown that must be solved simultaneously with velocity, and gravity is the primary driver. This course develops the physical and mathematical models that engineers use to quantify river and channel behaviour at the landscape scale, from steady uniform flow in a prismatic channel to unsteady flood waves rolling down a valley, from localized losses at a bridge or culvert to sediment entrainment and contaminant mixing.

The notes below synthesize the classical treatments of Chow, Henderson, Sturm, Chaudhry, Chanson, and Julien, together with the transport and mixing perspective of open-source lecture sequences such as MIT OCW 1.061 and Stanford CEE 260B. The emphasis is on the physical reasoning behind each model, the regime in which it is valid, and the way it is used in engineering practice for flood mapping, infrastructure sizing, and river restoration.

# Chapter 1: Foundations of Open Channel Flow

## 1.1 Geometry and classification

An open channel is characterized at a cross section by the flow depth \( y \), the top width \( T \), the wetted area \( A \), and the wetted perimeter \( P \). The hydraulic radius is

\[ R = \frac{A}{P} \]

and the hydraulic depth, which controls wave celerity, is

\[ D = \frac{A}{T}. \]

For a wide rectangular channel \( R \to y \) and \( D = y \); for a trapezoidal section with bottom width \( b \), depth \( y \), and side slope \( z \) (horizontal over vertical), \( A = (b + z y)\,y \), \( P = b + 2y\sqrt{1+z^2} \), and \( T = b + 2 z y \). Circular partially filled sections (culverts, sewers) require parameterization by the central angle subtended by the water surface.

Flows are classified along several orthogonal axes. With respect to time, flow is **steady** if local quantities are constant or **unsteady** if they vary. With respect to space, flow is **uniform** if depth, velocity, and area are invariant along the channel, or **non-uniform**; non-uniform flow is further split into **gradually varied flow (GVF)** where streamline curvature is mild and pressure remains nearly hydrostatic, and **rapidly varied flow (RVF)** where curvature is strong (hydraulic jumps, weir crests). With respect to the Reynolds number \( \mathrm{Re} = 4 R V/\nu \), flow is laminar, transitional, or turbulent; almost all engineering river flows are fully turbulent. With respect to the Froude number

\[ \mathrm{Fr} = \frac{V}{\sqrt{g D}}, \]

flow is **subcritical** (\(\mathrm{Fr} < 1\), deep and slow, downstream control, disturbances can propagate upstream), **critical** (\(\mathrm{Fr} = 1\)), or **supercritical** (\(\mathrm{Fr} > 1\), shallow and fast, upstream control, disturbances swept downstream). The Froude number is dynamically fundamental: it is the ratio of inertial to gravitational forces, and equivalently the ratio of mean flow velocity to the celerity of a small shallow-water gravity wave \( c = \sqrt{gD} \).

## 1.2 Continuity in one dimension

For a one-dimensional cross-section-averaged description, conservation of mass takes the form

\[ \frac{\partial A}{\partial t} + \frac{\partial Q}{\partial x} = q_\ell, \]

where \( Q = V A \) is the volumetric discharge and \( q_\ell \) is the lateral inflow per unit length. In prismatic channels with no lateral inflow and steady flow, \( Q \) is constant along \( x \), so \( V_1 A_1 = V_2 A_2 \). The unsteady form couples depth and discharge and becomes, together with the momentum equation, the Saint-Venant system.

## 1.3 Energy equation and total head

Applying the Bernoulli equation along a streamline and assuming hydrostatic pressure across a section gives the total head at a cross section referenced to an arbitrary datum,

\[ H = z_b + y\cos\theta + \alpha\frac{V^2}{2g}, \]

where \( z_b \) is the bed elevation, \( \theta \) the bed slope angle (usually small enough that \( \cos\theta \approx 1 \)), and \( \alpha \) the energy (Coriolis) coefficient that corrects for the non-uniform velocity profile; \( \alpha \) is typically taken between 1.05 and 1.15 for natural rivers. Between two sections separated by a friction head loss \( h_f \) and an eddy loss \( h_e \),

\[ z_{b1} + y_1 + \alpha_1\frac{V_1^2}{2g} = z_{b2} + y_2 + \alpha_2\frac{V_2^2}{2g} + h_f + h_e. \]

This is the backbone of the standard-step method for water-surface profiles.

## 1.4 Momentum equation and specific force

Applied to a control volume between two sections of a horizontal channel neglecting friction, the momentum principle yields the **specific force**

\[ M = \beta\frac{Q^2}{gA} + \bar{h}_c A, \]

where \( \bar{h}_c \) is the depth to the centroid of the section and \( \beta \) is the momentum coefficient (1.01–1.07 for rivers). The momentum equation is essential where energy is dissipated in a way that cannot be quantified a priori, most importantly across hydraulic jumps; conjugate depths sharing the same \( M \) are sequent depths of a jump.

## 1.5 Pressure distribution and slope effects

The hydrostatic assumption \( p = \rho g (y - z) \) holds when streamlines are nearly parallel. Where streamlines curve strongly (over spillway crests, downstream of sluice gates) pressure deviates from hydrostatic; on a concave bed it is larger, on a convex bed smaller, which explains low pressures and potential cavitation on ogee spillways. On steep channels the component of weight normal to the bed reduces effective pressure by \( \cos^2\theta \); for river slopes below about 10% the correction is negligible and is routinely ignored.

<div class="bg-blue-100 border-l-4 border-blue-500 p-3 my-4">
<strong>Physical picture.</strong> <em>Fr</em> compares flow speed to shallow-water wave speed. When <em>Fr</em> &lt; 1 a pebble dropped in the channel sends ripples both upstream and downstream; when <em>Fr</em> &gt; 1 all ripples are swept downstream. This is why subcritical reaches have downstream hydraulic control and supercritical reaches have upstream control.
</div>

# Chapter 2: Uniform Flow

## 2.1 Force balance and the Chezy equation

Uniform flow is an idealization in which gravity driving the flow exactly balances boundary friction, so depth, velocity, and area are constant along a prismatic channel and the water surface is parallel to the bed. A control-volume force balance on a slice of length \( dx \) gives

\[ \rho g A S_0 \, dx = \tau_0 P \, dx, \]

so the boundary shear stress is

\[ \tau_0 = \rho g R S_0. \]

Assuming \( \tau_0 \propto \rho V^2 \) yields the **Chezy equation**

\[ V = C\sqrt{R S_0}, \]

with \( C \) the Chezy coefficient. \( C \) is not dimensionless and depends on boundary roughness and Reynolds number.

## 2.2 Manning's equation

Empirical fits to open-channel data across many scales led Manning, Gauckler, and Strickler to the relation (in SI units)

\[ V = \frac{1}{n}\,R^{2/3} S_0^{1/2}, \qquad Q = \frac{1}{n}\,A R^{2/3} S_0^{1/2}. \]

\( n \) is Manning's roughness coefficient, tabulated from concrete-lined canals (\( n \approx 0.013 \)) to vegetated floodplains (\( n \approx 0.1 \)) and boulder-bedded mountain streams (\( n \approx 0.05 \)). Manning's equation is the workhorse of river engineering; its implicit assumption is fully rough turbulence, and it degrades in smooth laboratory flumes where \( n \) loses its scale independence. For compound sections (main channel plus floodplain) the cross section is subdivided and discharges added; care is needed with vertical division lines to avoid spurious contributions to \( P \).

## 2.3 Normal depth and conveyance

At a given \( Q \) and \( S_0 \) the depth satisfying Manning's equation is the **normal depth** \( y_n \). Writing \( K(y) = (1/n) A R^{2/3} \) as the conveyance, \( Q = K\sqrt{S_0} \) and the normal-depth calculation reduces to solving \( K(y_n) = Q/\sqrt{S_0} \) — typically by Newton iteration. Normal depth is the asymptote toward which gradually varied profiles tend far from controls.

## 2.4 Limits of validity and compound roughness

Manning's equation presumes a single prismatic section and homogeneous roughness. In natural rivers, form drag from bedforms (ripples, dunes, bars) contributes to total resistance beyond grain roughness; composite-roughness methods (Einstein-Horton, Pavlovskii) weight sub-perimeter \( n \) values. For vegetated floodplains, rigid- and flexible-stem drag models are more defensible than a blanket \( n \), especially at high stage where vegetation submerges.

# Chapter 3: Specific Energy and Critical Flow

## 3.1 Specific energy

The **specific energy** is the head measured from the channel bed,

\[ E = y + \alpha\frac{V^2}{2g} = y + \alpha\frac{Q^2}{2gA^2}. \]

For a given \( Q \) the function \( E(y) \) is non-monotonic: as \( y \to 0 \) the kinetic term diverges, and as \( y \to \infty \) \( E \to y \). It has a minimum \( E_c \) at the **critical depth** \( y_c \), where

\[ \frac{dE}{dy} = 1 - \frac{Q^2 T}{gA^3} = 0 \quad\Longleftrightarrow\quad \mathrm{Fr}^2 = \frac{Q^2 T}{gA^3} = 1. \]

For a rectangular channel with discharge per unit width \( q = Q/b \),

\[ y_c = \left(\frac{q^2}{g}\right)^{1/3}, \qquad E_c = \frac{3}{2}\,y_c. \]

Two alternate depths \( y_1 \) (subcritical, upper branch) and \( y_2 \) (supercritical, lower branch) share the same \( E \) for a given \( Q \); they are the subcritical and supercritical solutions to the cubic for rectangular sections.

## 3.2 Transitions: steps and contractions

Passage over a gentle bed rise \( \Delta z \) preserves \( E \) minus the rise: \( E_2 = E_1 - \Delta z \). Subcritical approach flow therefore drops in water-surface elevation above the step but remains subcritical provided \( E_1 - \Delta z \geq E_c \); if \( \Delta z \) exceeds \( E_1 - E_c \), the flow **chokes** and the upstream depth must rise (the channel backs up) to supply sufficient energy. Lateral contractions behave analogously with \( q \) increased locally. These concepts underlie the design of broad-crested weirs, flume throats, and channel-geometry transitions.

## 3.3 Critical flow as a control

Because \( E(y) \) has a minimum at \( y_c \), wherever critical depth is forced — a free overfall, a broad-crested weir, a flume throat — discharge is uniquely tied to depth, and the section acts as a **control**. Critical flumes (Parshall, H-flume) exploit this for discharge measurement.

# Chapter 4: The Hydraulic Jump

## 4.1 Conjugate depths

A **hydraulic jump** is the rapid, highly turbulent transition from supercritical to subcritical flow. Because energy is dissipated unpredictably inside the roller, the jump is analyzed with the momentum equation rather than the energy equation. For a rectangular horizontal channel, equating specific force across the jump yields the Belanger equation for the depth ratio,

\[ \frac{y_2}{y_1} = \frac{1}{2}\left(\sqrt{1 + 8\,\mathrm{Fr}_1^2} - 1\right). \]

The energy loss across the jump is

\[ \Delta E = \frac{(y_2 - y_1)^3}{4\,y_1 y_2}. \]

## 4.2 Jump classification

Based on \( \mathrm{Fr}_1 \):

| Froude range | Jump type | Behaviour |
|---|---|---|
| 1.0–1.7 | Undular | Standing surface waves, minimal energy loss |
| 1.7–2.5 | Weak | Small roller, smooth downstream |
| 2.5–4.5 | Oscillating | Periodic jets, erratic — avoid in design |
| 4.5–9.0 | Steady | Stable roller, 45–70% energy loss, preferred for stilling basins |
| > 9.0 | Strong | Rough, high splash, up to 85% dissipation |

## 4.3 Engineering use

Stilling basins below spillways use jumps to dissipate kinetic energy before release to the downstream channel. Basin design (USBR Types II, III, IV) specifies floor blocks, chute blocks, and end sills tuned to the incoming Froude number to force the jump at a predictable location and shorten its length.

# Chapter 5: Gradually Varied Flow

## 5.1 The GVF equation

Assuming hydrostatic pressure, one-dimensional flow, and quasi-steady conditions, differentiation of total head along \( x \) yields

\[ \frac{dy}{dx} = \frac{S_0 - S_f}{1 - \mathrm{Fr}^2}, \]

where \( S_f \) is the friction slope, typically evaluated from Manning's equation at local conditions, \( S_f = n^2 V^2 / R^{4/3} \). The numerator compares gravity driving to friction; the denominator is the Froude term that switches control direction between sub- and supercritical flow.

## 5.2 Profile classification

Channel bed slope is classified relative to the critical slope \( S_c \) (the slope at which normal depth equals critical depth): **M**ild (\( S_0 < S_c \), so \( y_n > y_c \)), **S**teep (\( y_n < y_c \)), **C**ritical (\( y_n = y_c \)), **H**orizontal (\( S_0 = 0 \), \( y_n = \infty \)), and **A**dverse (\( S_0 < 0 \), no real \( y_n \)). Each slope supports up to three zones (1: above both \( y_n \) and \( y_c \); 2: between them; 3: below both) and a correspondingly labeled profile (M1, M2, M3, S1, S2, S3, etc.).

| Profile | Where | Typical setting |
|---|---|---|
| M1 | \( y > y_n > y_c \) | Backwater behind a dam on a mild slope |
| M2 | \( y_n > y > y_c \) | Drawdown to a free overfall on a mild slope |
| M3 | \( y_c > y_n > y \) | Downstream of a sluice gate on a mild slope, ending in a jump |
| S1 | \( y > y_c > y_n \) | Subcritical pool above a steep chute, following a jump |
| S2 | \( y_c > y > y_n \) | Transition from mild to steep channel |
| S3 | \( y > y_n \), both supercritical | Supercritical approach meeting a steeper bed |
| H2, H3 | Horizontal bed | Flat reaches, limiting cases of mild slopes |
| A2, A3 | Adverse | Inverted siphons, adverse reaches |

Near \( y_n \) profiles asymptote to normal depth; near \( y_c \) they become vertical, violating the hydrostatic assumption and signalling the onset of RVF or a hydraulic jump.

## 5.3 Standard-step method

Practical GVF computation proceeds by integrating the energy equation between cross sections. For each reach of length \( \Delta x \) and known \( Q \),

\[ z_{b1} + y_1 + \frac{V_1^2}{2g} = z_{b2} + y_2 + \frac{V_2^2}{2g} + \bar{S}_f\,\Delta x + h_e, \]

with \( \bar{S}_f \) the average friction slope between sections. The depth at one end of the reach is known (control), and the depth at the other is found by iteration. For natural-channel sections this is the **standard-step method** implemented by HEC-RAS and similar software; for prismatic channels the **direct-step method** marches in depth increments and solves for \( \Delta x \). Computation proceeds upstream for subcritical flow and downstream for supercritical flow, propagating information in the direction of the hydraulic control.

<div class="bg-yellow-100 border-l-4 border-yellow-500 p-3 my-4">
<strong>Direction of computation.</strong> <em>Subcritical</em> flow carries information upstream, so start GVF computations at the <em>downstream</em> control (dam, gate, known tailwater) and march upstream. <em>Supercritical</em> flow carries information downstream, so start at the <em>upstream</em> control (sluice, steep-mild break) and march downstream.
</div>

# Chapter 6: Rapidly Varied Flow and Hydraulic Structures

## 6.1 Weirs

Weirs raise the upstream water surface to create a controlled critical section. For a sharp-crested rectangular weir of length \( L \) and head \( H \) above the crest,

\[ Q = C_d\,\frac{2}{3}\,\sqrt{2g}\,L\,H^{3/2}, \]

with \( C_d \) near 0.6 (Rehbock). Broad-crested weirs, where the crest is long enough for flow to become parallel and approach critical depth, obey

\[ Q = C_d\,L\,\sqrt{g}\,\left(\tfrac{2}{3}H\right)^{3/2}. \]

Ogee (standard) spillways are shaped to follow the lower nappe of a free jet; design heads minimize departure from atmospheric pressure on the crest, avoiding cavitation at high heads. V-notch (triangular) weirs follow \( Q \propto H^{5/2} \) and are preferred for low discharges because of their sensitivity.

## 6.2 Culverts

A culvert is a short closed conduit carrying flow under a road or embankment. Its hydraulic behaviour depends on whether **inlet control** or **outlet control** governs:

- **Inlet control.** The inlet is the hydraulic bottleneck; the barrel flows partially full and the discharge is a function only of headwater depth and inlet geometry. This usually applies to steep, short culverts with unsubmerged outlets.
- **Outlet control.** Barrel friction and tailwater matter; the energy equation from headwater to tailwater, including entrance loss, friction loss through the barrel, and exit loss, determines the headwater. Long, mild culverts with high tailwater are typically outlet-controlled.

Design uses the larger of the two headwater depths for safety. Transitions between the two regimes occur as discharge increases; the HEC-22 and HDS-5 manuals formalize the procedures.

## 6.3 Bridges

Bridges constrict the channel at the abutments and add piers. Energy loss occurs from contraction at the upstream face and expansion downstream. For bridges with unsubmerged low-chord and negligible pier submergence, contracted-opening methods (Yarnell, WSPRO) relate the upstream water-surface rise to constriction geometry and velocity; HEC-RAS offers energy, momentum, Yarnell, and WSPRO methods. When the low chord is overtopped or the bridge deck is submerged, the deck itself behaves as a broad-crested weir and/or pressure-flow orifice and special bridge routines are invoked.

## 6.4 Spillways

Overflow spillways (ogee), chute spillways, side-channel spillways, and morning-glory spillways each have their own discharge characteristic, but the critical-flow-at-crest idea underlies all of them. Aeration grooves and chute-block arrangements mitigate cavitation; stilling basins or plunge pools below dissipate the kinetic energy of the descending jet.

# Chapter 7: Unsteady Flow and the Saint-Venant Equations

## 7.1 Derivation

Applying conservation of mass and streamwise momentum to a slice of open channel gives the one-dimensional **Saint-Venant equations**,

\[ \frac{\partial A}{\partial t} + \frac{\partial Q}{\partial x} = q_\ell, \]

\[ \frac{\partial Q}{\partial t} + \frac{\partial}{\partial x}\!\left(\beta\frac{Q^2}{A}\right) + gA\frac{\partial y}{\partial x} = gA\,(S_0 - S_f) + \text{lateral terms}. \]

Together they are a hyperbolic system whose characteristics travel at \( V \pm c \), \( c = \sqrt{gD} \). They subsume every steady model discussed earlier: setting \( \partial/\partial t = 0 \) and \( q_\ell = 0 \) recovers the GVF equation; further setting \( \partial/\partial x = 0 \) recovers uniform flow.

## 7.2 Wave approximations

Because the full dynamic equations are computationally heavy, practical flood routing often discards terms believed small:

- **Kinematic wave.** Momentum reduces to \( S_f = S_0 \); the wave is non-diffusive and non-dispersive with celerity \( c_k = dQ/dA \). Useful for steep headwater streams and overland flow where inertia and backwater are negligible.
- **Diffusion wave.** Retains the pressure-gradient term but drops inertia: \( S_f = S_0 - \partial y/\partial x \). Introduces numerical diffusion mimicking attenuation; adequate for many river reaches where tailwater matters.
- **Dynamic wave.** Full Saint-Venant; required where inertia, backwater from downstream structures, or tidal/estuarine effects govern.

## 7.3 Numerical solution

Finite-difference schemes fall into **explicit** (MacCormack, Lax-Wendroff; Courant-limited, \( C = c\,\Delta t/\Delta x \leq 1 \)) and **implicit** (Preissmann four-point scheme used in MIKE-11 and HEC-RAS Unsteady) families. Implicit schemes remain stable at large time steps but require solving a tridiagonal system per step. Boundary conditions must match the characteristic structure: subcritical flow requires one upstream and one downstream condition; supercritical flow requires two upstream conditions.

# Chapter 8: Flood Routing

## 8.1 Hydrologic routing: Muskingum

Hydrologic routing uses only storage-discharge relationships, ignoring the momentum equation. For a river reach, storage is modeled as a weighted combination of inflow \( I \) and outflow \( O \):

\[ S = K\left[x I + (1-x) O\right], \]

with \( K \) a travel-time parameter and \( x \) a weighting factor in \([0, 0.5]\) (\( x = 0 \) recovers linear-reservoir routing; \( x = 0.5 \) yields pure translation). Combined with the continuity equation \( dS/dt = I - O \) and discretized,

\[ O_{j+1} = C_0\,I_{j+1} + C_1\,I_j + C_2\,O_j, \]

with coefficients \( C_0, C_1, C_2 \) in terms of \( K \), \( x \), and \( \Delta t \) summing to unity. The **Muskingum-Cunge** variant ties \( K \) and \( x \) to hydraulic properties (celerity and reach length) so the scheme approximates the diffusion-wave equation with physically interpretable parameters.

## 8.2 Hydraulic routing

Hydraulic routing solves the Saint-Venant equations (or a wave approximation) numerically, giving both stage and discharge at each cross section over time. HEC-RAS Unsteady and MIKE-11 are standard tools. Hydraulic routing is preferred where backwater, hydraulic structures, floodplain storage, or strongly time-varying boundaries matter.

## 8.3 Selection

For long, well-behaved reaches with a single inflow hydrograph and no significant backwater, Muskingum-Cunge is often sufficient. For regulated systems, tributary junctions, or flood mapping that requires stage at every cross section, full hydraulic routing is required.

# Chapter 9: Floodplain Mapping and HEC-RAS Workflow

## 9.1 Floodplain delineation

A floodplain map identifies areas inundated by a design flood (commonly 1% annual exceedance probability, the "100-year flood"). The workflow is:

1. **Hydrology.** Estimate the design-flood hydrograph or peak discharge from gauge records (flood-frequency analysis via log-Pearson III) or from a rainfall-runoff model for ungauged basins.
2. **Topography.** Obtain high-resolution terrain (LiDAR) and extract river bathymetry where channels are wet.
3. **Cross sections.** Cut channel and floodplain cross sections perpendicular to flow at appropriate spacing (tighter through constrictions).
4. **Hydraulic model.** Build a 1-D (HEC-RAS) or 2-D (HEC-RAS 2-D, TUFLOW) model with Manning's \( n \), ineffective flow areas, structures, and boundary conditions.
5. **Calibration.** Match historical high-water marks or gauged stage-discharge by adjusting roughness and ineffective-flow polygons.
6. **Simulation.** Run the design flood, extract water-surface elevations, and intersect with the DEM to delineate inundation.
7. **Mapping.** Publish inundation boundaries, flood depth grids, and regulatory zones (floodway vs flood fringe).

## 9.2 1-D versus 2-D

One-dimensional models are efficient for confined rivers where flow direction is well defined and cross sections capture hydraulics. Two-dimensional models resolve flow paths across wide floodplains, around structures, and in braided reaches; they are increasingly standard for urban flood mapping. Hybrid 1-D/2-D models combine a 1-D channel with 2-D floodplain where appropriate.

## 9.3 Uncertainty

Floodplain maps embed uncertainty from hydrology (flood-frequency extrapolation), topography (DEM error), roughness, model choice, and structure performance under extreme events (blockage, overtopping). Good practice reports sensitivity runs and uses conservative design assumptions for regulatory mapping.

# Chapter 10: Sediment Transport

## 10.1 Incipient motion and Shields

A sediment particle of diameter \( d \) and submerged specific gravity \( (s-1) \) rests on the bed until the boundary shear stress exceeds a critical value. Shields non-dimensionalized the shear stress by the submerged weight per unit area,

\[ \tau_* = \frac{\tau_0}{(\rho_s - \rho)\,g\,d}, \]

and the particle Reynolds number \( \mathrm{Re}_* = u_* d / \nu \) where \( u_* = \sqrt{\tau_0/\rho} \) is the shear velocity. The **Shields curve** plots the critical \( \tau_{*c} \) at which particles begin to move; for fully rough turbulent flow (\( \mathrm{Re}_* > 500 \)) it asymptotes to roughly \( \tau_{*c} \approx 0.045 \)–\( 0.06 \). Design of stable channels and riprap sizing uses the Shields criterion with a safety factor; lane's method and Maynord's riprap formulas are common applications.

## 10.2 Bed-load transport: Meyer-Peter and Müller

Bed load is the sediment that moves by rolling, sliding, or saltating in near-bed contact. The **Meyer-Peter–Müller (MPM)** formula, a workhorse for gravel-bed rivers, gives the dimensionless bed-load transport rate

\[ q_{b*} = 8\,(\tau_* - \tau_{*c})^{3/2}, \]

with \( q_{b*} = q_b / \sqrt{(s-1) g d^3} \), valid for \( \tau_* \) modestly above \( \tau_{*c} \). Many successor formulas (Einstein, Wilcock-Crowe for mixtures, Parker) refine MPM for sand-gravel mixtures, low transport, or bedform-dominated channels.

## 10.3 Suspended load: the Rouse profile

Above a thin bed-load layer, finer sediment travels in suspension, held aloft by turbulent diffusion against settling. Assuming a balance between upward turbulent flux and downward settling,

\[ \varepsilon_s\,\frac{dc}{dy} + w_s\,c = 0, \]

with \( \varepsilon_s \) an eddy diffusivity typically tied to the log-law mixing length \( \varepsilon_s = \kappa u_* y\,(1 - y/h) \). Integrating yields the **Rouse profile**

\[ \frac{c(y)}{c_a} = \left[\frac{(h - y)/y}{(h - a)/a}\right]^{Z}, \qquad Z = \frac{w_s}{\kappa u_*}, \]

where \( c_a \) is a reference concentration at height \( a \) above the bed, and \( Z \) is the **Rouse number**. Coarse sediment (high \( Z \)) concentrates near the bed; fine sediment (low \( Z \)) distributes nearly uniformly through the depth. The total suspended discharge is the vertical integral of \( c\,V \). Einstein's integration and the method of van Rijn provide practical suspended-load formulas tied to hydraulic quantities.

## 10.4 Bedforms and regime

Granular beds are not static: at low transport they are flat, at moderate transport ripples and dunes migrate downstream, and at high transport antidunes and plane beds reappear. Each regime alters form drag and therefore flow resistance, so sediment transport and roughness are coupled. Engel's, Vanoni's, and van Rijn's regime diagrams map bedform occurrence to flow and sediment parameters.

# Chapter 11: Scour at Bridges

## 11.1 Components of scour

Total scour at a bridge is decomposed into three roughly additive components:

- **Long-term aggradation/degradation** from catchment-scale sediment balance changes (dams, land use).
- **Contraction scour** from acceleration through the bridge opening; by continuity and momentum, a narrower section at fixed discharge erodes its bed to pass the sediment load.
- **Local scour** around individual piers and abutments from horseshoe and wake vortices.

## 11.2 Pier scour — HEC-18

The U.S. Federal Highway Administration's **HEC-18** manual provides the Colorado State University (CSU) equation for equilibrium pier scour depth \( y_s \),

\[ \frac{y_s}{y_1} = 2.0\,K_1 K_2 K_3 K_4\,\left(\frac{a}{y_1}\right)^{0.65}\,\mathrm{Fr}_1^{0.43}, \]

with \( a \) the pier width, \( y_1 \) upstream depth, \( \mathrm{Fr}_1 \) upstream Froude number, and \( K_i \) correction factors for pier shape, angle of attack, bed condition (clearwater vs live-bed), and bed armouring. Abutment scour follows the Froehlich or HIRE equations depending on setback. Scour estimates feed foundation design: pile-cap elevations, pier footings, and riprap protection must survive the design-flood scour hole.

## 11.3 Countermeasures

Scour countermeasures fall into hydraulic (flow realignment, guide banks), structural (collars, pile groups, sacrificial piles), and armouring (riprap, gabions, grout-filled mattresses) categories. Riprap sizing follows Isbash or HEC-23 formulas; filter fabric or graded granular filters prevent piping beneath the armour.

# Chapter 12: River Mixing and Contaminant Transport

## 12.1 Scales of mixing

A contaminant released in a river mixes on three sequential scales:

1. **Vertical mixing** — across the depth \( h \) by turbulent diffusion; time scale \( T_v \sim h^2/\varepsilon_v \) with \( \varepsilon_v \approx 0.067\,h u_* \). For depths of order 1 m and typical \( u_* \), vertical mixing is complete within tens of meters in swift rivers.
2. **Transverse mixing** — across the width \( W \) by transverse turbulent diffusivity \( \varepsilon_t \approx 0.15\,h u_* \) in straight channels, larger (0.3–0.6) in meandering reaches. The distance to transverse well-mixedness scales as \( L_t \sim U W^2 / \varepsilon_t \) — often kilometres for large rivers.
3. **Longitudinal dispersion** — after cross-sectional mixing, shear between surface and bed velocities smears a plug of tracer along the flow with **Taylor-Aris** dispersion coefficient, well approximated for wide rivers by Fischer's expression

\[ K_L \approx 0.011\,\frac{U^2 W^2}{h\,u_*}, \]

which typically dwarfs molecular diffusion by many orders of magnitude.

## 12.2 Advection-dispersion equation

Once cross-sectional mixing is complete, a depth- and width-averaged contaminant concentration \( c(x, t) \) obeys

\[ \frac{\partial c}{\partial t} + U\frac{\partial c}{\partial x} = K_L\,\frac{\partial^2 c}{\partial x^2} - k c + \frac{S}{A}, \]

with \( k \) a first-order decay rate (biodegradation, radioactive decay) and \( S \) a source term. For an instantaneous point release \( M \) into a channel of area \( A \), the Gaussian plume solution

\[ c(x, t) = \frac{M/A}{\sqrt{4\pi K_L t}}\,\exp\!\left[-\frac{(x - U t)^2}{4 K_L t}\right]\,e^{-k t} \]

underlies spill-response modelling. Real rivers exhibit long tails from dead zones and storage in pool-riffle structures; transient-storage models (OTIS) generalize the Gaussian model by adding an immobile storage zone exchanging mass with the main channel.

## 12.3 Tracer studies

Field tracer tests (fluorescent dyes, salt) calibrate \( U \), \( K_L \), and storage parameters. Rhodamine WT is common for its detectability and low sorption; practical protocols require injection, downstream monitoring, and mass-balance verification.

# Chapter 13: Topics in Physical Hydraulics

## 13.1 Ice-affected rivers

In cold climates a surface ice cover adds a second wetted perimeter and typically doubles hydraulic radius while reducing velocity for the same discharge; composite \( n \) formulas (Sabaneev, Larsen) combine bed and ice roughness. **Ice jams**, where broken ice piles and restricts flow, can raise upstream stage by several metres and pose severe flood hazards during breakup; jam-modified backwater is modelled in HEC-RAS by treating the jam as a floating layer with its own roughness and thickness.

## 13.2 Storm surge and estuarine coupling

Near the coast, the downstream boundary of a river is tidal and surge-affected. During storm events, wind setup and reduced pressure raise sea level and propagate upstream as a backwater; the dynamic Saint-Venant equations with a stage boundary at the estuary capture compound flooding. Nonlinear interaction between river flood and storm surge can amplify coastal flood depths beyond what either driver produces alone.

## 13.3 River morphology and restoration

Regime theory (Lacey, Blench) and channel-forming discharge concepts relate stable channel geometry to dominant discharge and sediment supply. Restoration projects often target the bankfull discharge (approximately the 1–2 year flood) and aim to restore a meandering planform with appropriate pool-riffle-run sequences. Stable channel design balances sediment supply and transport capacity; an imbalance drives aggradation or degradation and potentially avulsion.

<div class="bg-green-100 border-l-4 border-green-500 p-3 my-4">
<strong>Systems view.</strong> Every chapter above plugs into the same one-dimensional framework of continuity, energy, and momentum. The <em>distinction</em> between models — uniform, GVF, RVF, Muskingum, Saint-Venant — is which assumptions (time-steadiness, streamline curvature, storage closure) are retained and which are dropped. Match the model to the regime and the engineering question.
</div>

# Chapter 14: Worked Conceptual Examples

## 14.1 Uniform flow in a trapezoid

Given a trapezoidal channel with \( b = 4.0 \) m, \( z = 2 \), \( S_0 = 0.0016 \), and \( n = 0.025 \), find normal depth for \( Q = 30 \) m\(^3\)/s. Writing \( A = (4 + 2y)\,y \), \( P = 4 + 2y\sqrt{5} \), and \( Q = (1/n) A R^{2/3} S_0^{1/2} \) gives an implicit equation for \( y_n \). Newton iteration starting from \( y = 2 \) m converges in a few steps to roughly \( y_n \approx 1.7 \) m, with \( V \approx 2.4 \) m/s and \( \mathrm{Fr} \approx 0.65 \) — subcritical, consistent with a mild slope.

## 14.2 Choke at a bed step

A rectangular channel \( b = 5 \) m carries \( Q = 20 \) m\(^3\)/s at \( y_1 = 2.0 \) m. A smooth bed hump of \( \Delta z = 0.3 \) m. Compute \( q = 4 \), \( y_c = (16/9.81)^{1/3} \approx 1.18 \) m, \( E_c = 1.77 \) m, \( V_1 = 2.0 \) m/s, \( E_1 = 2.0 + 0.20 = 2.20 \) m. Over the hump \( E_2 = 1.90 \) m \( > E_c \), so the flow passes without choking; the upper branch of \( E(y) \) at \( E = 1.90 \) gives a subcritical \( y_2 \) slightly less than \( y_1 \). Had \( \Delta z \) exceeded \( E_1 - E_c \approx 0.43 \) m the channel would have choked and \( y_1 \) would have risen.

## 14.3 Hydraulic jump below a gate

A sluice gate releases \( q = 4.5 \) m\(^2\)/s at \( y_1 = 0.40 \) m. Then \( V_1 = 11.25 \) m/s and \( \mathrm{Fr}_1 = V_1/\sqrt{g y_1} = 5.7 \). Belanger gives \( y_2/y_1 = 3.6 \), so \( y_2 \approx 1.45 \) m and \( \Delta E \approx 2.7 \) m — a strong jump suitable for a stilling-basin Type III with chute blocks and baffle piers.

## 14.4 Gaussian spill in a river

A 5 kg slug of conservative dye is released to a river with \( U = 0.8 \) m/s, \( W = 30 \) m, \( h = 1.5 \) m, \( u_* = 0.08 \) m/s, \( A = 45 \) m\(^2\). Fischer: \( K_L \approx 0.011\,(0.8)^2 (30)^2/(1.5 \cdot 0.08) \approx 53 \) m\(^2\)/s. Peak concentration at \( x = 5 \) km is \( t = 6250 \) s, \( c_{\max} = (5/45)/\sqrt{4\pi \cdot 53 \cdot 6250} \approx 1.1\times 10^{-4} \) kg/m\(^3\) \( = 0.11 \) mg/L, with plume standard deviation \( \sigma_x = \sqrt{2 K_L t} \approx 810 \) m — useful for siting a downstream intake shut-off.

# Chapter 15: Practical Perspective

## 15.1 What modern river engineers actually do

Daily practice blends the tools in this course. Floodplain mapping feeds regulatory products. Bridge and culvert hydraulics decide sizing and scour protection for transport infrastructure. Environmental flows and mixing analyses govern effluent discharge permits and spill response. Sediment transport assessments support river restoration, dredging, and reservoir sedimentation studies. Climate change layers hydrologic non-stationarity onto every design discharge; contemporary practice extends frequency analysis with climate-informed approaches (downscaled GCMs, non-stationary flood frequency).

## 15.2 Common failure modes of analysis

Beyond modelling software mastery, the principal sources of engineering error are misidentifying the hydraulic control (leading to wrong GVF direction), underestimating Manning's \( n \) on densely vegetated floodplains, neglecting ineffective flow areas at bridges, and extrapolating sediment-transport formulas far outside their calibration range. A defensible project files every modelling assumption with its justification, reports sensitivity, and states the bounds within which the result is trustworthy.

## 15.3 Closing

Open channel hydraulics sits at the intersection of fluid mechanics, geomorphology, stochastic hydrology, and infrastructure engineering. The unifying one-dimensional framework reduces enormous natural complexity to tractable equations, and the skill lies in knowing which simplification is valid where. Whether the question is the height of a levee, the scour around a new bridge pier, the inundation extent of a design flood, or the travel time of a spilled contaminant, the answer is traceable to continuity, energy, momentum, and a careful accounting of the boundary conditions that the river itself imposes.
