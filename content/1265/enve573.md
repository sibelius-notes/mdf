---
title: "ENVE 573: Contaminant Transport"
subjects: "ENVE"
---

## Overview

ENVE 573 develops the quantitative framework for predicting how chemicals move and transform in surface water, groundwater, and soil, and how those predictions inform the design of remediation systems. The course sits at the intersection of environmental fluid mechanics, reactive transport theory, numerical analysis, and engineering practice. It treats modelling not as an exercise in programming a solver but as a disciplined inquiry: pose a question, formalise a mass balance, select constitutive laws, prescribe boundary and initial conditions, solve, calibrate, and test the result against observations before committing to a management decision.

A recurring theme is that the governing equations are few in number but their range of behaviour is enormous. The same advection-dispersion-reaction equation describes a tracer plume in a sand aquifer, dissolved oxygen deficit below a sewage outfall, and an aerosol cloud in an estuary. What changes between problems is the geometry, the parameter values, the source function, and the dominant balance of terms. A modeller who understands which terms dominate, and under what circumstances a term that is usually negligible becomes controlling, can diagnose a problem long before a numerical solution is attempted.

<div class="note-callout">
<strong>Guiding principle.</strong> <em>All models are wrong; some are useful.</em> A useful transport model is the simplest representation that reproduces the observations relevant to the decision at hand, with uncertainty bounds wide enough to be honest and narrow enough to be actionable.
</div>

## The Model-Building Process

Environmental modelling proceeds through a sequence that is rarely linear in practice but is useful as a reference. The analyst first states the management question: will the plume reach the municipal well in thirty years, what effluent concentration satisfies a stream standard, how much mass must be removed to reopen a site. The question determines the spatial and temporal scales that matter, which in turn fixes the level of process detail that is needed. A model built to answer a ten-year plume-capture question should not carry pore-scale reactive-surface detail; a model built to interpret a column experiment should not smear sorption over a regional aquifer.

From the question the modeller proceeds to a conceptual model, a narrative and sketch identifying the sources, the receiving media, the transport pathways, the reactions, and the boundaries. The conceptual model is then translated into mathematics: a control volume, a mass balance, constitutive equations for fluxes and reactions, and auxiliary conditions. The mathematical model is implemented either analytically or numerically, calibrated against data, tested against independent observations, and finally exercised for prediction.

Limitations of environmental models are structural, parametric, and observational. Structural limitations arise from processes that are absent from the equations, such as neglecting matrix diffusion in fractured rock or neglecting NAPL dissolution in a plume model. Parametric limitations arise from uncertain or unidentifiable parameters, especially when calibration targets are sparse. Observational limitations arise from the scale mismatch between point measurements and grid-averaged state variables. Measures of model success include the Nash-Sutcliffe efficiency, the root-mean-square error between simulated and observed concentrations, the bias, and, for management applications, the fraction of decisions that would be reversed by plausible parameter perturbations.

## Contaminant Types and Sources

Contaminants in engineering practice are classified by phase behaviour, reactivity, and regulatory framing. Dissolved conservative tracers such as chloride move with the fluid and are valuable for characterising flow. Reactive solutes such as nitrate, dissolved organic carbon, and metals undergo biological or chemical transformation. Hydrophobic organics partition between water, solid, gas, and non-aqueous liquid phases. Non-aqueous phase liquids (NAPLs) form a separate fluid phase; light NAPLs (LNAPLs) such as gasoline float on the water table while dense NAPLs (DNAPLs) such as chlorinated solvents sink below it. Colloids and pathogens behave as particles and are sensitive to straining and attachment. Radionuclides combine chemical speciation with decay.

Sources are point or distributed, continuous or instantaneous, constant or time-varying. A leaking underground storage tank approximates a continuous point source; an agricultural field is a distributed source; a spill event is an instantaneous or short-duration pulse. The mathematical representation of the source enters the governing equation either as a boundary condition on the concentration at a specified location or as an internal source term \( S(\mathbf{x},t) \) with units of mass per volume per time.

## The Advection-Dispersion-Reaction Equation

Mass conservation for a single dissolved species in a saturated porous medium, combining advective and dispersive fluxes with a general reaction term, yields

\[
\frac{\partial (\theta C)}{\partial t} + \nabla \cdot \left(\mathbf{q} C\right) - \nabla \cdot \left(\theta \mathbf{D} \nabla C\right) = \theta R(C) + S,
\]

where \( C \) is aqueous concentration \(\left[M L^{-3}\right]\), \( \theta \) is porosity (or water content), \( \mathbf{q} \) is the Darcy flux \(\left[L T^{-1}\right]\), \( \mathbf{D} \) is the hydrodynamic dispersion tensor \(\left[L^{2} T^{-1}\right]\), \( R \) is the net reactive source, and \( S \) external sources or sinks. When \( \theta \) is constant and the flow is divergence-free, this reduces to the more familiar

\[
\frac{\partial C}{\partial t} + \mathbf{v} \cdot \nabla C - \nabla \cdot \left(\mathbf{D} \nabla C\right) = R(C),
\]

with seepage velocity \( \mathbf{v} = \mathbf{q}/\theta \). The same equation form, with different parameter meanings, describes solute transport in rivers (replace \( \theta \) by cross-sectional area, \( \mathbf{v} \) by stream velocity, \( \mathbf{D} \) by longitudinal dispersion coefficient) and in the atmosphere.

Three limits clarify behaviour. In the advection-dominated limit, concentration contours translate with velocity \( \mathbf{v} \) with little spreading. In the dispersion-dominated limit, the plume spreads symmetrically like a diffusing Gaussian. In the reaction-dominated limit, the local concentration is controlled by kinetics and the spatial structure is nearly uniform over the reaction length scale. The dimensionless Peclet number \( \mathrm{Pe} = v L / D \) and Damkohler number \( \mathrm{Da} = k L / v \) quantify these balances.

## Diffusion and Dispersion

Molecular diffusion in water is governed by Fick's law with coefficients \( D_m \) of order \( 10^{-9}\,\mathrm{m^{2}\,s^{-1}} \) for small ions. In a porous medium the effective diffusion coefficient is reduced by the tortuosity \( \tau \) so that \( D_e = D_m / \tau \), with \( \tau \) often in the range 1.5 to 6. Mechanical dispersion, sometimes called kinematic dispersion, arises from the variability of pore-scale velocities: fluid moves faster at pore centres than at walls, fluid in large pores outruns fluid in small pores, and tortuous paths expose neighbouring fluid parcels to different residence times. The net effect at the continuum scale resembles diffusion but scales with velocity.

A widely used linear parameterisation, following Bear and Scheidegger, is

\[
D_L = \alpha_L v + D_e, \qquad D_T = \alpha_T v + D_e,
\]

with longitudinal dispersivity \( \alpha_L \) and transverse dispersivity \( \alpha_T \). Field experience shows that \( \alpha_L \) grows with the travel distance of the plume, a phenomenon called scale-dependent dispersion. This scale effect reflects unresolved heterogeneity in the hydraulic conductivity field: what is called dispersion at one scale is advection through a more complex velocity field at a finer scale. Stochastic theories of Gelhar, Dagan, and others predict that \( \alpha_L \) approaches an asymptotic macrodispersivity after a travel distance of several correlation lengths of the log-conductivity field.

In surface water, dispersion has different mechanics. In a river the primary mechanism is shear flow dispersion: the combination of a non-uniform velocity profile over the cross-section and transverse mixing generates a longitudinal spreading that behaves as diffusion once the cross-section is well mixed. Fischer's analysis gives \( D_L \approx 0.011 \, u^{2} W^{2} / (H u_{*}) \) for natural streams, where \( W \) is width, \( H \) is depth, \( u \) is mean velocity and \( u_{*} \) is shear velocity. In lakes and estuaries the dispersion coefficient encompasses turbulent eddies, wind-driven circulation, and tidal pumping.

<div class="note-callout">
<strong>Diffusion versus dispersion.</strong> <em>Molecular diffusion</em> is a property of the fluid and solute, present even in a stagnant medium; <em>mechanical dispersion</em> is a property of the flow field and the medium, vanishing when \( v = 0 \); <em>hydrodynamic dispersion</em> is their sum. Treating dispersion as Fickian is an approximation whose validity improves with travel distance relative to heterogeneity length scales.
</div>

## Boundary and Initial Conditions

Well-posed transport problems require boundary and initial conditions. The common types are Dirichlet, where concentration is prescribed on a portion of the boundary; Neumann, where the dispersive flux \( -\mathbf{D}\nabla C \cdot \mathbf{n} \) is prescribed; and Cauchy or third-type, where the total flux \( \left(\mathbf{v} C - \mathbf{D}\nabla C\right) \cdot \mathbf{n} \) is prescribed. For an injection well delivering mass at rate \( \dot{m} \) into a volume with discharge \( Q \), the correct boundary condition is third-type with \( C_{\text{in}} = \dot{m}/Q \); using a first-type condition at the inflow face overestimates mass entering the domain when dispersion is significant, because dispersive flux then carries additional mass against the advective direction.

Initial conditions specify \( C(\mathbf{x}, 0) \) throughout the domain. For a long-term plume simulation the initial condition may be a snapshot of an existing plume constructed by inverse modelling; for a design calculation the initial condition is often zero concentration.

## Completely Mixed Systems

Before tackling the full partial differential equation, much can be learned from the completely mixed assumption, in which spatial gradients are neglected within a control volume. The mass balance for a single reservoir becomes the ordinary differential equation

\[
V \frac{dC}{dt} = Q_{\text{in}} C_{\text{in}}(t) - Q_{\text{out}} C - V k C + W(t),
\]

where \( V \) is volume, \( Q \) are flow rates, \( k \) is a first-order loss coefficient, and \( W(t) \) is an external loading. For a constant-volume system at steady state with \( Q_{\text{in}}=Q_{\text{out}}=Q \) and constant \( C_{\text{in}} \),

\[
C_{ss} = \frac{Q \, C_{\text{in}} + W}{Q + V k}.
\]

The transient response to a step change in loading is exponential with time constant

\[
\tau = \frac{V}{Q + V k} = \frac{1}{\tau_{\text{res}}^{-1} + k},
\]

combining the hydraulic residence time \( \tau_{\text{res}} = V/Q \) with the reaction time scale \( 1/k \). This simple result underpins Chapra's treatment of lake phosphorus loading, Streeter-Phelps dissolved oxygen modelling, and the response of reservoirs to contaminant pulses.

### Streeter-Phelps and Stream Oxygen

The classical Streeter-Phelps model of dissolved oxygen deficit \( D = C_{s}-C \) below a BOD loading couples two first-order processes:

\[
\frac{dL}{dt} = -k_d L, \qquad \frac{dD}{dt} = k_d L - k_a D,
\]

where \( L \) is the ultimate BOD concentration, \( k_d \) the deoxygenation rate, and \( k_a \) the reaeration rate. In a plug-flow stream with velocity \( u \), time \( t \) is replaced by distance \( x = u t \). The deficit reaches a critical maximum at

\[
t_c = \frac{1}{k_a - k_d} \ln\!\left(\frac{k_a}{k_d}\left[1 - \frac{D_0 \left(k_a-k_d\right)}{k_d L_0}\right]\right),
\]

providing the location of the sag in oxygen downstream of a discharge.

### Feedback and Toxic Substance Models

Coupled reservoirs exchange mass and feed back on each other; a two-box lake with epilimnion and hypolimnion represents seasonal stratification by making the exchange coefficient time-dependent. Toxic substance models add partitioning between dissolved, particulate, and biological compartments, along with sediment-water fluxes. In Chapra's formulation a lake is represented by coupled mass balances for water-column and sediment compartments, with exchange by settling, resuspension, burial, and diffusion across the sediment-water interface. The equilibrium between dissolved and particulate phases is described by a partition coefficient \( K_d \) with units \(\left[L^{3} M^{-1}\right]\), so that the total concentration is

\[
C_T = C \left(1 + K_d \, m\right),
\]

with suspended solids concentration \( m \). Bioaccumulation is added through a bioconcentration factor or a food-web model that tracks uptake and depuration across trophic levels.

## Sorption, Retardation, and Reactive Transport

In a porous medium the solute interacts with mineral and organic surfaces. Under the local-equilibrium assumption the sorbed mass per mass of solid, \( \bar{C} \), depends on the aqueous concentration through an isotherm. The three most common forms are linear (\( \bar{C} = K_d C \)), Freundlich (\( \bar{C} = K_f C^{n} \)) with \( n<1 \) for favourable sorption, and Langmuir (\( \bar{C} = Q_m K_L C/\left(1+K_L C\right) \)) which saturates at high concentration. Substituting a linear isotherm into the mass balance yields

\[
R \frac{\partial C}{\partial t} + \mathbf{v} \cdot \nabla C - \nabla \cdot \left(\mathbf{D} \nabla C\right) = -R \, k \, C,
\]

with retardation factor

\[
R = 1 + \frac{\rho_b K_d}{\theta},
\]

where \( \rho_b \) is dry bulk density. The effect is to slow the plume by a factor \( R \) and, for a linear decay reaction, to reduce the effective velocity and dispersion by the same factor without changing the shape. For non-linear isotherms the front sharpens (Langmuir, favourable) or broadens (Freundlich with \( n>1 \), unfavourable) and the linear result ceases to apply. For many hydrophobic organics \( K_d \approx f_{oc} K_{oc} \), where \( f_{oc} \) is the fraction of organic carbon on the solid and \( K_{oc} \) is the organic-carbon normalised partition coefficient, which correlates with the octanol-water partition coefficient \( K_{ow} \).

### First-Order Decay and Biodegradation Kinetics

First-order decay \( R(C) = -k C \) is mathematically convenient and describes radioactive decay exactly, hydrolysis approximately, and biodegradation approximately when substrate is low and biomass is constant. More realistic biodegradation follows Monod kinetics,

\[
R(C) = -\mu_{\max} \frac{C}{K_s + C} \, X / Y,
\]

with biomass \( X \), yield \( Y \), maximum specific growth rate \( \mu_{\max} \), and half-saturation \( K_s \). When \( C \ll K_s \) this reduces to first-order with rate \( \mu_{\max} X / (Y K_s) \); when \( C \gg K_s \) it reduces to zero-order. Multiple-substrate problems, such as natural attenuation of petroleum hydrocarbons, require coupling the substrate equations with electron acceptor equations (oxygen, nitrate, sulphate) and biomass growth, sometimes including microbial community succession.

## Analytical Solutions of the ADE

For instructive problems the advection-dispersion equation admits closed-form solutions that illuminate plume behaviour and serve as benchmarks for numerical codes.

### One-Dimensional Ogata-Banks Solution

For a semi-infinite column with uniform \( v \) and \( D \), zero initial concentration, and first-type inlet condition \( C(0,t) = C_0 \), Ogata and Banks (1961) give

\[
\frac{C(x,t)}{C_0} = \frac{1}{2} \left[\operatorname{erfc}\!\left(\frac{x - v t}{2\sqrt{D t}}\right) + \exp\!\left(\frac{v x}{D}\right) \operatorname{erfc}\!\left(\frac{x + v t}{2\sqrt{D t}}\right)\right].
\]

The first term is the advection-dispersion travelling front; the second term corrects for back-diffusion at the inlet and is negligible when \( \mathrm{Pe} = v x / D \) is large. With first-order decay and retardation the solution generalises with \( v \to v/R \), \( D \to D/R \), and an additional exponential factor \( \exp(-k t) \).

### Pulse and Continuous Sources in Higher Dimensions

An instantaneous point release of mass \( M \) into a uniform flow gives a Gaussian cloud,

\[
C(x,y,z,t) = \frac{M}{8 \left(\pi t\right)^{3/2} \sqrt{D_L D_T D_V}} \exp\!\left[-\frac{\left(x - v t\right)^{2}}{4 D_L t} - \frac{y^{2}}{4 D_T t} - \frac{z^{2}}{4 D_V t}\right],
\]

with second moments \( \sigma_i^{2} = 2 D_i t \). A continuous source on a finite patch produces a steady-state plume that, far from the source, is well approximated by the Domenico-Robbins solution, a product of complementary error functions that incorporates finite source dimensions and first-order decay. These analytical solutions, while limited to idealised geometries, are indispensable for scoping calculations and for verifying numerical codes.

## Numerical Solutions

Most field problems require numerical solution because of irregular geometry, heterogeneous parameters, non-linear reactions, and complex source histories. Four families of methods are standard.

### Finite Difference and Finite Volume

The finite difference method discretises derivatives on a structured grid. A forward-time, centred-space explicit scheme for the 1D ADE is

\[
C_i^{n+1} = C_i^{n} - \frac{v \Delta t}{2 \Delta x} \left(C_{i+1}^{n} - C_{i-1}^{n}\right) + \frac{D \Delta t}{\Delta x^{2}} \left(C_{i+1}^{n} - 2 C_i^{n} + C_{i-1}^{n}\right).
\]

Stability requires the Courant number \( \mathrm{Cr} = v \Delta t / \Delta x \le 1 \) and the diffusion number \( v_D = D \Delta t / \Delta x^{2} \le 1/2 \). Centred differencing for advection suffers oscillations at sharp fronts when the cell Peclet number \( \mathrm{Pe}_c = v \Delta x / D \) exceeds 2; upwind differencing cures the oscillation at the cost of introducing numerical dispersion of magnitude \( D_{\text{num}} \approx v \Delta x \left(1 - \mathrm{Cr}\right)/2 \), which can dominate physical dispersion on coarse grids.

Finite volume methods integrate the mass balance over a control volume and ensure discrete mass conservation, which is critical for long-term or multi-species simulations. Flux limiters (van Leer, Superbee) blend upwind and higher-order fluxes to retain accuracy at smooth regions while suppressing oscillations at sharp fronts.

### Method of Characteristics and Particle Tracking

The method of characteristics (MOC) splits the ADE into an advection step, solved by tracking particles along streamlines, and a dispersion-reaction step, solved on a fixed grid. Concentrations are interpolated between particles and grid nodes each time step. The random-walk particle tracking method represents the plume by a cloud of particles, each displaced per time step by a deterministic advective step \( \mathbf{v}\left(\mathbf{x}_p\right) \Delta t \) and a random diffusive step with covariance \( 2 \mathbf{D} \Delta t \). In the scalar isotropic case the update is

\[
\mathbf{x}_p^{\,n+1} = \mathbf{x}_p^{\,n} + \mathbf{v}\left(\mathbf{x}_p^{\,n}\right) \Delta t + \boldsymbol{\xi} \sqrt{2 D \Delta t},
\]

with \( \boldsymbol{\xi} \) a vector of independent standard normal variates. The advection-dispersion PDE emerges in the continuum limit by the Fokker-Planck equation. Particle methods are free of numerical dispersion and well suited to plumes with sharp fronts and to sparse concentration fields; they require care when the dispersion tensor is spatially variable because spurious drift appears unless the gradient of \( \mathbf{D} \) is added explicitly.

### Choosing a Method

Finite difference and finite volume are preferred when reactions are complex and the concentration field is smooth; the method of characteristics and particle tracking are preferred when advection dominates and sharp fronts must be preserved. Hybrid approaches such as MT3DMS combine an Eulerian treatment of dispersion and reactions with a Lagrangian treatment of advection.

<div class="note-callout">
<strong>Numerical-dispersion diagnostic.</strong> <em>Before trusting a simulated plume, compare the simulated second spatial moment with the analytical value \( \sigma^{2} = 2 D t + \sigma_{0}^{2} \).</em> Excess variance indicates numerical dispersion; deficient variance indicates under-resolution of the source.
</div>

## Peclet and Courant Constraints

Practical grid design balances accuracy against cost. A commonly used guideline for advection-dispersion problems is

\[
\mathrm{Pe}_c = \frac{v \Delta x}{D} \lesssim 2, \qquad \mathrm{Cr} = \frac{v \Delta t}{\Delta x} \lesssim 1,
\]

with tighter bounds for methods that are not upwind stabilised. When the physical Peclet number is very large, refining the grid to satisfy \( \mathrm{Pe}_c \le 2 \) may be infeasible; in that case an upwind or flux-limited scheme is adopted, or a particle method is used. When simultaneous chemical kinetics are stiff, the time step is further constrained by \( k \Delta t \ll 1 \) for explicit schemes, motivating operator splitting with implicit reaction steps.

## Model Calibration, Sensitivity, and Uncertainty

Calibration adjusts uncertain parameters to reproduce observed concentrations, heads, and fluxes. Manual calibration remains common for conceptual understanding, but automated tools such as PEST (parameter estimation by weighted least squares with Levenberg-Marquardt optimisation) are standard for production work. The objective function is typically

\[
\Phi\left(\boldsymbol{\theta}\right) = \sum_{i=1}^{N} w_i^{2} \left[C_i^{\text{obs}} - C_i^{\text{sim}}\left(\boldsymbol{\theta}\right)\right]^{2},
\]

with weights \( w_i \) chosen to reflect observation variance. Identifiability of parameters is diagnosed by the sensitivity matrix \( \mathbf{J}_{ij} = \partial C_i / \partial \theta_j \); parameters that produce nearly parallel columns of \( \mathbf{J} \) cannot be estimated independently.

Sensitivity analysis distinguishes local methods (partial derivatives at the calibrated solution) from global methods (variance decomposition such as Sobol indices, or screening designs such as Morris elementary effects). Global methods are preferable when the model is non-linear and parameter uncertainty is large.

Uncertainty quantification uses Monte Carlo simulation, linearised error propagation, or Bayesian methods such as Markov chain Monte Carlo. For linear models with Gaussian parameter uncertainty the posterior concentration variance is

\[
\operatorname{Var}(C_i) = \mathbf{J}_i \, \boldsymbol{\Sigma}_{\theta} \, \mathbf{J}_i^{\top},
\]

with parameter covariance \( \boldsymbol{\Sigma}_{\theta} \). For non-linear models Monte Carlo is more reliable but computationally demanding; surrogate models such as polynomial chaos expansions accelerate the propagation.

## Darcy's Law, Heterogeneity, and Groundwater Flow

Transport requires flow. In saturated porous media, Darcy's law

\[
\mathbf{q} = -\mathbf{K} \nabla h
\]

relates the specific discharge to the gradient of hydraulic head \( h \) through the hydraulic conductivity tensor \( \mathbf{K} \). Combined with mass conservation \( S_s \partial h/\partial t + \nabla \cdot \mathbf{q} = 0 \) (with specific storage \( S_s \)) this yields the groundwater flow equation that codes like MODFLOW solve.

Hydraulic conductivity is the single most variable parameter in environmental engineering, spanning more than ten orders of magnitude across geological materials and varying by orders of magnitude within a single aquifer. This heterogeneity is the root cause of scale-dependent dispersion, of preferential flow paths, of the difficulty of plume capture, and of the persistence of contamination in low-conductivity layers. Geostatistical characterisation, using variograms of log-conductivity estimated from slug tests, pumping tests, and sedimentary facies mapping, provides the input to stochastic simulation of plume behaviour.

## Multiphase Flow and NAPLs

Many of the most difficult remediation problems involve non-aqueous liquids. LNAPLs such as gasoline pool at the water table and slowly dissolve into the groundwater; DNAPLs such as trichloroethene sink through the aquifer and accumulate on aquitards as pools and residual ganglia. In multiphase flow each fluid has its own pressure, saturation, and relative permeability, and the phases are connected by capillary pressure-saturation relations such as Brooks-Corey or van Genuchten forms. For two phases (wetting \( w \) and non-wetting \( n \)),

\[
P_c\left(S_w\right) = P_n - P_w,
\]

with \( P_c \) increasing as \( S_w \) decreases and diverging as \( S_w \) approaches its residual value \( S_{wr} \). The generalised Darcy laws are

\[
\mathbf{q}_\alpha = -\frac{\mathbf{k}\, k_{r\alpha}\left(S_\alpha\right)}{\mu_\alpha} \left(\nabla P_\alpha - \rho_\alpha \mathbf{g}\right), \qquad \alpha = w, n,
\]

with intrinsic permeability \( \mathbf{k} \), relative permeabilities \( k_{r\alpha} \), dynamic viscosities \( \mu_\alpha \), and gravity \( \mathbf{g} \). Relative permeabilities are strongly non-linear and hysteretic.

Dissolution of residual NAPL into groundwater is the source that sustains long-lived plumes. Mass transfer is often parameterised as a first-order process \( J = k_f a \left(C_s - C\right) \) with mass-transfer coefficient \( k_f \), specific interfacial area \( a \), and solubility \( C_s \). Because \( k_f a \) depends on saturation, flow velocity, and architecture of the residual, it spans several orders of magnitude across sites.

<div class="note-callout">
<strong>DNAPL as management problem.</strong> <em>A DNAPL pool of a few cubic metres can sustain a dissolved plume of several cubic kilometres for decades.</em> This mismatch between source volume and plume volume explains why source-zone characterisation and targeted treatment usually dominate remediation economics.
</div>

## Mass Removal Technologies

Remediation design selects among pump-and-treat, in situ chemical and biological treatment, vapour-phase extraction, and permeable barriers, combining them to address both source zones and dissolved plumes.

### Pump-and-Treat

Extraction wells capture contaminated groundwater which is treated ex situ by air stripping, carbon adsorption, or advanced oxidation and either reinjected or discharged. Capture-zone analysis, based on the steady-state stream function of a single well in a uniform regional flow, gives the capture width \( B_c = Q / \left(2 T i\right) \) at the far-field (with pumping rate \( Q \), transmissivity \( T \), and regional gradient \( i \)) and a stagnation point at \( x_s = -Q/\left(2 \pi T i\right) \) downstream of the well. Pump-and-treat is effective for hydraulic containment but notoriously slow at removing mass, because rate-limited desorption, matrix diffusion from low-conductivity lenses, and NAPL dissolution produce long tailing.

### Air Sparging and Soil Vapour Extraction

Air sparging injects air below the water table to volatilise dissolved and residual VOCs; soil vapour extraction (SVE) removes the vapour through screened wells in the unsaturated zone. Effective radii of influence depend on soil heterogeneity and are usually determined by pilot tests. Mass removal is limited by vapour-phase equilibrium and by bypass through preferred air channels.

### In Situ Chemical Oxidation and Reduction

ISCO injects oxidants such as permanganate, persulphate, hydrogen peroxide with iron catalysis (Fenton), or ozone to degrade contaminants in place. Permanganate is well suited to chlorinated ethenes but generates manganese-dioxide precipitates that reduce permeability; persulphate activation with heat, base, or iron provides radicals that attack a wider range of compounds. ISCR uses zero-valent iron or other reductants for reductive dechlorination. Design must account for natural oxidant demand of the aquifer matrix, often an order of magnitude greater than the contaminant demand.

### Bioremediation

Biostimulation adds electron donors (lactate, emulsified vegetable oil, molasses) to drive anaerobic reductive dechlorination or enhanced aerobic degradation; bioaugmentation adds cultures such as Dehalococcoides to complete the dechlorination pathway of chlorinated ethenes. Monitored natural attenuation relies on documenting that existing biological, chemical, and physical processes reduce contaminant concentrations along the flow path fast enough to meet regulatory objectives.

### Permeable Reactive Barriers

A PRB is a trench filled with reactive material (most commonly zero-valent iron) installed transverse to the flow. Contaminants are degraded as groundwater passes through by diffusion and advection. Design requires the design flow rate, reaction rate constants measured in column tests, and a residence time sufficient to meet the compliance concentration with a safety factor, typically

\[
\tau_{\text{PRB}} = \frac{1}{k} \ln\!\left(\frac{C_{\text{in}}}{C_{\text{target}}}\right),
\]

with \( k \) the first-order removal rate. Long-term performance is controlled by mineral precipitation and biofouling.

## Putting the Pieces Together

A complete contaminant transport study for a site begins with source characterisation (history, mass, composition, architecture), proceeds through hydrogeological characterisation (stratigraphy, hydraulic conductivity distribution, flow directions), couples a calibrated flow model to a transport model with appropriate boundary and initial conditions, incorporates the relevant reactive and multiphase processes, and is tested by forecasting hindcast observations and by sensitivity and uncertainty analysis. The output is not a single plume map but a distribution of plume scenarios that supports defensible decisions about containment, treatment, and closure.

<div class="note-callout">
<strong>Modeller's checklist.</strong> <em>State the decision. Write the mass balance. Identify dominant terms. Choose a solution method appropriate to that balance. Verify against analytical benchmarks. Calibrate with weighted data. Quantify uncertainty. Compare predictions with independent observations. Revise.</em>
</div>

## Worked Example: Ogata-Banks Benchmark

Consider a 1D column with \( v = 0.1\,\mathrm{m\,d^{-1}} \), \( D = 0.01\,\mathrm{m^{2}\,d^{-1}} \), and \( C_0 = 1 \). At \( x = 5\,\mathrm{m} \) and \( t = 50\,\mathrm{d} \), the advective time \( x/v = 50\,\mathrm{d} \) equals the simulation time, so the front centre is at \( x = 5\,\mathrm{m} \) and \( C/C_0 = 1/2 \) from the first term. The spread \( 2\sqrt{D t} = 2\sqrt{0.01 \times 50} \approx 1.41\,\mathrm{m} \) controls the width of the transition. At \( x = 4\,\mathrm{m} \), the argument of the first \( \operatorname{erfc} \) is \(-0.71\) and \( \operatorname{erfc}(-0.71) \approx 1.68 \), giving \( C/C_0 \approx 0.84 \); at \( x = 6\,\mathrm{m} \), the argument is \( +0.71 \) and \( \operatorname{erfc}(0.71) \approx 0.32 \), giving \( C/C_0 \approx 0.16 \). The second term contributes less than \( 10^{-12} \) because \( v x / D = 60 \) and the exponential in \( \operatorname{erfc} \) of positive argument decays much faster than \( \exp(vx/D) \) grows. A finite-difference code should reproduce these numbers to four significant figures; if not, the time step or grid spacing is too coarse for the prescribed Peclet number.

## Quick-Reference Table

| Quantity | Symbol | Typical units |
|---|---|---|
| Aqueous concentration | \( C \) | \( \mathrm{mg\,L^{-1}} \) |
| Porosity / water content | \( \theta \) | dimensionless |
| Darcy flux | \( \mathbf{q} \) | \( \mathrm{m\,d^{-1}} \) |
| Seepage velocity | \( \mathbf{v}=\mathbf{q}/\theta \) | \( \mathrm{m\,d^{-1}} \) |
| Dispersion coefficient | \( D \) | \( \mathrm{m^{2}\,d^{-1}} \) |
| Longitudinal dispersivity | \( \alpha_L \) | \( \mathrm{m} \) |
| Partition coefficient | \( K_d \) | \( \mathrm{L\,kg^{-1}} \) |
| Retardation factor | \( R \) | dimensionless |
| First-order rate | \( k \) | \( \mathrm{d^{-1}} \) |
| Peclet (cell) | \( v \Delta x / D \) | dimensionless |
| Courant | \( v \Delta t / \Delta x \) | dimensionless |
| Damkohler | \( k L / v \) | dimensionless |

## Sources and References

- Bear, J. *Dynamics of Fluids in Porous Media.* Dover, 1972.
- Bear, J., and A. H.-D. Cheng. *Modeling Groundwater Flow and Contaminant Transport.* Springer, 2010.
- Fetter, C. W. *Contaminant Hydrogeology*, 2nd ed. Waveland Press, 2008.
- Domenico, P. A., and F. W. Schwartz. *Physical and Chemical Hydrogeology*, 2nd ed. Wiley, 1998.
- Zheng, C., and G. D. Bennett. *Applied Contaminant Transport Modeling*, 2nd ed. Wiley, 2002.
- Chapra, S. C. *Surface Water-Quality Modeling.* Waveland Press, 2008.
- Fischer, H. B., E. J. List, R. C. Y. Koh, J. Imberger, and N. H. Brooks. *Mixing in Inland and Coastal Waters.* Academic Press, 1979.
- Gelhar, L. W. *Stochastic Subsurface Hydrology.* Prentice Hall, 1993.
- Ogata, A., and R. B. Banks. "A Solution of the Differential Equation of Longitudinal Dispersion in Porous Media." U.S. Geological Survey Professional Paper 411-A, 1961.
- Pankow, J. F., and J. A. Cherry. *Dense Chlorinated Solvents and other DNAPLs in Groundwater.* Waterloo Press, 1996.
- Schwarzenbach, R. P., P. M. Gschwend, and D. M. Imboden. *Environmental Organic Chemistry*, 3rd ed. Wiley, 2016.
- Wiedemeier, T. H., H. S. Rifai, C. J. Newell, and J. T. Wilson. *Natural Attenuation of Fuels and Chlorinated Solvents in the Subsurface.* Wiley, 1999.
- MIT OpenCourseWare 1.72 *Groundwater Hydrology*.
- Stanford CEE 262C *Hydrodynamics of Surface Water*.
- Doherty, J. *PEST: Model-Independent Parameter Estimation, User Manual.* Watermark Numerical Computing.
