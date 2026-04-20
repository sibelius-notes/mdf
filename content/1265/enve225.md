---
title: "ENVE 225: Environmental Modelling"
subjects: "ENVE"
---

## Sources and References

- Chapra, S. C. *Surface Water-Quality Modeling*. Waveland Press reprint of the McGraw-Hill edition.
- Thomann, R. V., and J. A. Mueller. *Principles of Surface Water Quality Modeling and Control*. Harper and Row.
- Clark, M. M. *Transport Modeling for Environmental Engineers and Scientists*. Wiley-Interscience.
- Reible, D. D. *Fundamentals of Environmental Engineering*. CRC Press / Springer.
- Chapra, S. C., and R. P. Canale. *Numerical Methods for Engineers*. McGraw-Hill.
- Davis, M. L., and D. A. Cornwell. *Introduction to Environmental Engineering*. McGraw-Hill.
- Masters, G. M., and W. P. Ela. *Introduction to Environmental Engineering and Science*. Pearson.
- Logan, B. E. *Environmental Transport Processes*. Wiley.
- Nazaroff, W. W., and L. Alvarez-Cohen. *Environmental Engineering Science*. Wiley.
- Fetter, C. W. *Contaminant Hydrogeology*. Waveland Press.
- Bear, J. *Hydraulics of Groundwater*. Dover reprint.
- Seinfeld, J. H., and S. N. Pandis. *Atmospheric Chemistry and Physics*. Wiley.
- Turner, D. B. *Workbook of Atmospheric Dispersion Estimates*. Lewis Publishers.
- MIT OpenCourseWare 1.061, *Transport Processes in the Environment*.
- MIT OpenCourseWare 1.77, *Water Quality Control*.
- Stanford CEE 101B, *Mechanics of Fluids*, and CEE 166, *Water Quality Control*, open course materials.
- US EPA guidance documents on QUAL2K, WASP, AERMOD, and MODFLOW/MT3DMS.

---

# Chapter 1: Foundations of Environmental Modelling

Environmental modelling is the discipline of translating the physics, chemistry, and biology of natural and engineered systems into mathematical statements that can be solved, analysed, and interrogated. Engineers build models for three closely related reasons: to predict how a system will behave under conditions that have not yet occurred, to interpret observations and extract the processes that produced them, and to design interventions, such as wastewater treatment plants, stormwater ponds, or emission controls, whose performance must meet regulatory targets before they are built. The mathematical core of almost every environmental model is the same: a statement of conservation, typically of mass, momentum, or energy, combined with constitutive relations that describe how fluxes depend on state variables. For ENVE 225 the dominant conservation law is mass, and the dominant mathematical object is the differential equation.

## 1.1 What a Model Is

A model is a simplification. The modeller selects a system boundary, chooses a set of state variables, identifies the processes that change those state variables, and writes an equation that links them in time and space. The equation is almost always a differential equation because environmental processes, such as the decay of a pollutant, the transport of dissolved species by flowing water, the dispersion of a plume in the atmosphere, and the slow bleeding of contaminants from a polluted aquifer, all operate continuously rather than as discrete jumps. When those continuous processes are approximated on a computer, the differential equation is replaced by an algebraic approximation (a finite difference or finite volume rule) that can be stepped forward in time; the model becomes numerical rather than analytical, but its origin is still the same conservation statement.

A useful model has three properties. First, it is mechanistic enough that its parameters have physical meaning; a first-order decay rate, a dispersion coefficient, or a reaeration rate is not merely a curve-fitting constant but a measurable property of the system. Second, it is simple enough that its behaviour can be understood, at least qualitatively, without simulation; an engineer should be able to predict whether increasing the flow, reducing the inflow concentration, or shortening the residence time will raise or lower the outlet concentration before touching a computer. Third, it is calibrated and validated against data from the system it claims to represent; a model whose parameters are taken from textbook ranges and never compared to measurements is a hypothesis, not a tool.

## 1.2 Continuum and Discrete Descriptions

Environmental systems can be described on two very different scales. In a continuum description, the state variables (concentration, temperature, velocity) are smooth functions of position and time, and conservation is expressed as a partial differential equation for a density per unit volume. In a discrete description, the system is divided into a finite number of compartments (tanks, layers, lake segments, soil cells, atmospheric boxes) and conservation is expressed as a coupled system of ordinary differential equations, one per compartment. The continuum view is natural for phenomena that vary smoothly over short length scales, such as groundwater contaminant plumes, estuary salinity intrusion, or atmospheric emissions from a single stack. The discrete view is natural for phenomena whose spatial structure is dominated by fixed geometric units, such as a chain of reactors in a treatment plant, the epilimnion and hypolimnion of a stratified lake, or the upstream and downstream reaches of a river that has been segmented for regulatory analysis. A well-designed course will insist that both descriptions are really the same physics at different resolutions; a tanks-in-series model with enough tanks approaches the plug flow reactor, and a finite volume discretisation of the advection–diffusion equation is, conceptually, a tanks-in-series model in disguise.

## 1.3 Units, Dimensions, and Dimensional Homogeneity

Every modelling equation must be dimensionally homogeneous. In practice, this is the fastest bug detector available to an engineer: if the left- and right-hand sides of an equation do not have the same units, the equation is wrong. Concentration is most often written as mass per unit volume, \( \text{M}\,\text{L}^{-3} \) (for example mg L\(^{-1}\)), flow as \( \text{L}^{3}\,\text{T}^{-1} \), mass flux as \( \text{M}\,\text{T}^{-1} \), reaction rate as \( \text{M}\,\text{L}^{-3}\,\text{T}^{-1} \), and diffusivity or dispersivity as \( \text{L}^{2}\,\text{T}^{-1} \). The ratio of a volume to a volumetric flow produces a residence time, \( \tau = V/Q \), which is arguably the single most important derived quantity in this course. A first-order reaction rate constant has dimensions of inverse time, \( \text{T}^{-1} \), and the dimensionless product \( k\tau \) (Damkohler number) decides whether a reactor is reaction-limited or transport-limited.

<div class="note">
<strong>Dimensional reasoning first.</strong> Before solving any environmental modelling problem, write down the dimensions of every symbol. If a proposed formula does not balance dimensionally, no algebraic manipulation can save it. Dimensional analysis also shows when two parameters, for example a rate constant and a residence time, must appear only as a dimensionless product.
</div>

# Chapter 2: Mass Balances and Control Volumes

The mass balance is the backbone of environmental modelling. Every differential equation introduced later in the course can be traced back to a statement that mass is neither created nor destroyed, only rearranged among inflows, outflows, reactions, and storage. The control volume is the bookkeeping device that makes this statement precise.

## 2.1 The General Mass Balance Statement

For a species of mass \( m \) inside an arbitrary control volume, the integral mass balance is simply

\[
\frac{dm}{dt} = \dot{m}_{\text{in}} - \dot{m}_{\text{out}} + \dot{m}_{\text{reaction}} ,
\]

where \( \dot{m}_{\text{in}} \) and \( \dot{m}_{\text{out}} \) are the mass flow rates across the control surface and \( \dot{m}_{\text{reaction}} \) is the net rate of generation by chemical, biological, or radiological reactions inside the control volume. When the mass is carried by a flowing fluid, the flux across the boundary is the product of volumetric flow \( Q \) and concentration \( C \), giving \( \dot{m} = Q C \). If reactions are first-order in concentration with rate constant \( k \), then \( \dot{m}_{\text{reaction}} = -k C V \) for a well-mixed volume \( V \). The bookkeeping is mechanical, but the choice of control volume is where engineering judgement enters: the right boundary makes the equation simple, the wrong boundary makes it either trivial (everything cancels) or intractable (too many unknown fluxes).

## 2.2 Steady State and Transient Forms

Environmental problems come in two flavours. In a steady-state problem the storage term \( dm/dt \) vanishes and the mass balance reduces to an algebraic relationship among fluxes; this is the regime used to size a treatment plant at design flow or to compute the long-term concentration in a lake. In a transient problem the storage term is retained and the result is an ordinary or partial differential equation; this is the regime used to analyse startup, shutdown, storm pulses, spills, and seasonal stratification. A good modeller develops the habit of writing the transient form first and then, if the problem warrants, dropping the storage term as an approximation rather than assuming steady state from the outset.

## 2.3 The Reynolds Transport Theorem

When the control volume is moving, deforming, or the fluid inside it is non-uniform, the simple integral balance needs a more careful derivation. The Reynolds transport theorem relates the time derivative of any extensive property \( B \) (for example mass of a species) inside a control volume to the flux of that property across the control surface. In its general form, for a control volume \( CV \) bounded by a control surface \( CS \) with outward unit normal \( \mathbf{n} \) and fluid velocity \( \mathbf{v} \),

\[
\frac{dB_{\text{sys}}}{dt} = \frac{d}{dt}\int_{CV} \beta\, \rho\, dV + \int_{CS} \beta\, \rho\, \left( \mathbf{v}\cdot\mathbf{n} \right)\, dA ,
\]

where \( \beta \) is the property per unit mass and \( \rho \) is the fluid density. Setting \( B \) equal to the mass of a dissolved species gives the standard mass balance; setting \( B \) equal to momentum recovers the Navier–Stokes form; setting \( B \) equal to energy recovers the first law applied to a flowing system. For environmental modelling the theorem does three things. It makes explicit that the storage term is a volume integral and the transport terms are surface integrals, which is essential when volumes and surfaces are not simply the product of constants and time. It justifies, through Gauss's theorem, the conversion of the integral mass balance into the local partial differential equation that appears later as the advection–diffusion–reaction equation. And it provides a rigorous framework for moving control volumes, for example a Lagrangian parcel of water drifting down a river or a sediment layer that is slowly burying itself.

## 2.4 Volume and Surface Integration

Even when the physics is settled, evaluating the integrals in the Reynolds transport theorem often dominates the work. Three patterns appear repeatedly. When concentration is uniform inside the control volume (the well-mixed assumption), the volume integral reduces to \( C V \). When concentration varies along a single coordinate, for example depth in a stratified lake, the integral reduces to a one-dimensional integration that is often tabulated or evaluated by simple quadrature. When concentration varies in all three dimensions, as in an atmospheric plume, the integral is evaluated analytically for Gaussian profiles and numerically otherwise. Surface integrals follow the same logic: if the flux is uniform over an inlet of area \( A \), it reduces to \( Q C \); if the flux varies, for example turbulent deposition on a vegetated surface, it is evaluated by integrating a flux profile.

<div class="warning">
<strong>Common mass balance mistakes.</strong> Forgetting to multiply concentration by flow when writing the inflow or outflow term; using volumetric flow for one stream and mass flow for another in the same equation; applying a first-order rate constant to a segment where the concentration is not uniform; and assuming steady state when the characteristic time of the forcing is shorter than the residence time of the system. Check each of these before trusting any result.
</div>

# Chapter 3: Ideal Reactor Models

Reactor models are the simplest, and most useful, mass balance equations an environmental engineer will meet. They describe how a chemical or biological species behaves in a well-defined vessel with specified inflow and outflow. The three canonical idealisations, batch, continuous stirred tank (CSTR), and plug flow (PFR), are the building blocks for treatment plant design and for interpreting pulses, spills, and tracer studies in rivers and lakes.

## 3.1 The Batch Reactor

A batch reactor has no inflow and no outflow during operation. Everything that enters goes in at time zero, reacts for a residence period, and leaves together at the end. The mass balance on a species with concentration \( C \) in a batch reactor of volume \( V \) reduces to

\[
V\,\frac{dC}{dt} = -k\,C\,V \quad\Rightarrow\quad \frac{dC}{dt} = -k\,C ,
\]

for a first-order reaction. The solution is the familiar exponential decay \( C(t) = C_0 \exp\!\left( -k t \right) \), and the half-life is \( t_{1/2} = \ln 2 / k \). A batch reactor is the cleanest place to measure a rate constant because there are no confounding transport terms; if a laboratory wants to know \( k \) for a pesticide under specified conditions, a batch test is where they start.

## 3.2 The Continuous Stirred Tank Reactor

A CSTR has continuous inflow and outflow at volumetric rate \( Q \) and is perfectly mixed, so the concentration in the outflow equals the concentration throughout the vessel. The transient mass balance for a first-order reaction is

\[
V\,\frac{dC}{dt} = Q\,C_{\text{in}} - Q\,C - k\,C\,V ,
\]

and at steady state \( dC/dt = 0 \) so the outlet concentration is

\[
C = \frac{C_{\text{in}}}{1 + k\,\tau} ,
\]

where \( \tau = V/Q \) is the hydraulic residence time. The dimensionless product \( k\tau \) is the Damkohler number; when it is large, the reactor is reaction-dominated and the effluent is clean, and when it is small, the reactor barely alters the inflow. The transient response to a step change in \( C_{\text{in}} \) is an exponential approach to the new steady state with time constant \( 1/\left( 1/\tau + k \right) \); the transient response to a pulse input is an exponential washout with time constant \( \tau \) if the species is conservative and \( 1/\left( 1/\tau + k \right) \) if it reacts.

## 3.3 The Plug Flow Reactor

A PFR is a long, narrow vessel in which the fluid moves with uniform velocity and there is no longitudinal mixing. Every fluid element experiences the same residence time \( \tau = V/Q = L/u \), where \( L \) is length and \( u \) is velocity, but different elements travel through the reactor in sequence. The steady-state mass balance on a differential slice of thickness \( dx \) gives

\[
u\,\frac{dC}{dx} = -k\,C ,
\]

whose solution is \( C(L) = C_{\text{in}} \exp\!\left( -k L / u \right) = C_{\text{in}} \exp\!\left( -k\tau \right) \). For the same residence time and rate constant, a PFR achieves a lower outlet concentration than a CSTR, because a CSTR instantly dilutes fresh inflow with already-reacted fluid while a PFR never does. This is the fundamental reason that long, narrow disinfection channels outperform equally sized mixed tanks at the same contact time.

## 3.4 Tanks-in-Series as a Bridge

Real reactors are neither perfectly mixed nor perfectly plug flow. The tanks-in-series model represents a real vessel as a chain of \( N \) identical CSTRs, each with residence time \( \tau / N \). For a first-order reaction the overall outlet concentration is

\[
C = \frac{C_{\text{in}}}{\left( 1 + k\tau / N \right)^{N}} ,
\]

which reduces to the CSTR formula when \( N = 1 \) and approaches the PFR formula \( C_{\text{in}} \exp\!\left( -k\tau \right) \) as \( N \to \infty \). Tracer experiments are the standard way to estimate \( N \) for a real reactor. The same model appears in river water quality modelling as a discrete approximation to a continuous reach, and in lake modelling as a way to represent longitudinal concentration gradients without solving a partial differential equation.

## 3.5 Second-Order and Non-Linear Kinetics

Not every reaction is first-order. A second-order reaction between two species has rate \( r = k C_A C_B \) and, when the two species are initially at the same concentration, gives the batch solution \( 1/C - 1/C_0 = k t \). Michaelis–Menten kinetics, central to biological treatment, give rate \( r = r_{\max} C / \left( K_M + C \right) \), which is first-order at low concentration and zero-order at high concentration. Monod kinetics describe microbial growth as \( \mu = \mu_{\max} S / \left( K_s + S \right) \), where \( S \) is substrate concentration and \( \mu \) is specific growth rate. The formal solution techniques developed for first-order systems still apply, but the results are rarely closed-form, and numerical methods (Chapter 6) become essential.

<table>
<thead>
<tr><th>Reactor</th><th>Steady-state outlet (first-order)</th><th>Design intuition</th></tr>
</thead>
<tbody>
<tr><td>Batch</td><td>\( C_0 \exp\!\left( -k t \right) \)</td><td>Measure rate constants; small-scale production.</td></tr>
<tr><td>CSTR</td><td>\( C_{\text{in}} / \left( 1 + k\tau \right) \)</td><td>Simple, robust, absorbs load shocks; lower conversion for same \( \tau \).</td></tr>
<tr><td>PFR</td><td>\( C_{\text{in}} \exp\!\left( -k\tau \right) \)</td><td>Highest conversion for same \( \tau \); sensitive to short-circuiting.</td></tr>
<tr><td>N CSTRs in series</td><td>\( C_{\text{in}} / \left( 1 + k\tau / N \right)^{N} \)</td><td>Bridges CSTR and PFR; calibrates real vessels.</td></tr>
</tbody>
</table>

# Chapter 4: Analytical Solution of Ordinary Differential Equations

The differential equations that describe reactor dynamics, decay processes, and lumped compartment models are ordinary differential equations in time. Three analytical techniques cover the majority of cases encountered in environmental engineering: separation of variables, integrating factors, and the Laplace transform.

## 4.1 Separation of Variables

When an ODE of the form \( dC/dt = f(C) g(t) \) can be rearranged so that all the \( C \) dependence sits on one side and all the \( t \) dependence sits on the other, both sides can be integrated directly. The first-order decay equation \( dC/dt = -k C \) separates as \( dC/C = -k\,dt \), integrates to \( \ln C = -k t + \text{const} \), and exponentiates to \( C = C_0 \exp\!\left( -k t \right) \). Separation handles almost every homogeneous first-order problem and most non-linear decay problems, including second-order kinetics and Michaelis–Menten in batch mode.

## 4.2 Integrating Factors

For linear first-order ODEs with time-dependent coefficients, \( dC/dt + p(t) C = q(t) \), the standard technique is to multiply through by the integrating factor \( \mu(t) = \exp\!\left( \int p(t)\,dt \right) \). The left-hand side becomes \( d\left( \mu C \right)/dt \), and a single integration yields the solution. A CSTR with a time-varying inflow concentration \( C_{\text{in}}(t) \) produces exactly this form: \( dC/dt + \left( 1/\tau + k \right) C = C_{\text{in}}(t)/\tau \). With \( C_{\text{in}}(t) \) prescribed (for example a step, a ramp, or a sinusoid), the integrating factor method delivers a closed-form expression that reveals the steady-state response, the transient, and the phase lag between forcing and response.

## 4.3 The Laplace Transform

The Laplace transform converts a linear ODE with constant coefficients into an algebraic equation in the transform variable \( s \). The transform of a derivative \( dC/dt \) is \( s \tilde{C}(s) - C(0) \), so a first-order equation becomes an algebraic relation between \( \tilde{C}(s) \) and the transform of the forcing. The inverse transform, read from a table or computed by partial fractions, delivers the time-domain solution. The Laplace approach is especially efficient for coupled compartment models, for systems forced by step or impulse inputs, and for deriving transfer functions that describe how a system magnifies or attenuates forcings at different frequencies. For a CSTR with first-order reaction, the transfer function from \( C_{\text{in}} \) to \( C \) is \( 1 / \left( \tau s + 1 + k\tau \right) \), and its gain at zero frequency, \( 1/\left( 1 + k\tau \right) \), recovers the steady-state result from Section 3.2.

## 4.4 Higher-Order and Coupled Systems

Second-order ODEs arise in environmental problems in two main places: oscillatory systems such as contaminant exchange between two coupled reservoirs, and certain analytical solutions to steady one-dimensional advection–diffusion–reaction problems. They can be solved directly (by substitution \( C = e^{\lambda t} \) to obtain a characteristic equation), by reduction to a system of two first-order ODEs, or by Laplace transform. Coupled compartment models, for example the two-layer lake (epilimnion plus hypolimnion) or the soil–sediment–water triad, yield systems of linear ODEs whose behaviour is governed by the eigenvalues of the coefficient matrix. If all eigenvalues have negative real parts, the system is stable; if any eigenvalue has positive real part, the system diverges; complex eigenvalues produce oscillatory transients.

# Chapter 5: Initial and Boundary Conditions

A differential equation on its own has infinitely many solutions. What selects the one solution that describes a real system is the set of initial and boundary conditions. Setting them correctly is the single most error-prone step in environmental modelling, and the one where physical reasoning most clearly dominates mathematical manipulation.

## 5.1 Initial Conditions for ODEs

An ODE of order \( n \) requires \( n \) initial conditions to have a unique solution. For the first-order reactor equations of Chapters 3 and 4, a single initial concentration \( C(0) = C_0 \) is enough. The value of \( C_0 \) is sometimes obvious (the reactor was empty, so \( C_0 = 0 \)) and sometimes subtle (the reactor was operating at steady state with a different inflow, so \( C_0 = C_{\text{in,old}} / \left( 1 + k\tau \right) \)). Second-order and coupled systems require additional information, typically an initial rate or an initial concentration in each compartment.

## 5.2 Boundary Conditions for PDEs

Partial differential equations need boundary conditions on every surface of the spatial domain. Three canonical types recur throughout environmental modelling. A Dirichlet condition fixes the concentration at the boundary, \( C\big|_{\Gamma} = C_b \); it is appropriate when the boundary is held by a reservoir or an external source whose concentration is known, for example atmospheric oxygen at the surface of a well-mixed shallow pond. A Neumann condition fixes the flux at the boundary, \( -D \partial C/\partial n\big|_{\Gamma} = J_b \); it is appropriate for no-flux boundaries such as an impermeable aquifer base or for prescribed deposition rates at ground level. A Robin (mixed) condition links concentration and flux, for example a mass transfer film at a gas–liquid interface where \( -D \partial C/\partial z\big|_{z=0} = k_L \left( C - C_{\text{eq}} \right) \); it is the natural condition for reaeration of a river or volatilisation from a lake.

<div class="note">
<strong>Choosing the right boundary condition.</strong> Ask what is held fixed at the boundary by physics external to the model. If a value is held fixed, use Dirichlet. If a flux is held fixed, use Neumann. If the flux depends on the local concentration through a mass transfer process, use Robin. The mathematics of each is different, and so is the long-term behaviour of the system: Dirichlet forces the boundary, Neumann allows the boundary to float, and Robin negotiates between the two.
</div>

## 5.3 Initial Conditions for PDEs

In addition to boundary conditions in space, PDEs in time require initial conditions throughout the domain. A common choice is a uniform background concentration; another is a localised source, represented mathematically by a Dirac delta, \( C(x, 0) = M \delta(x - x_0) / A \), which corresponds to an instantaneous injection of mass \( M \) at location \( x_0 \) into a cross-section of area \( A \). The Gaussian solutions of Chapter 7 and the atmospheric plume formulas of Chapter 9 are the time-integrated or steady-state responses to such localised initial or source conditions.

# Chapter 6: Numerical Methods for Ordinary Differential Equations

Analytical solutions exist only for a minority of the equations that arise in practice. The remainder must be integrated numerically, and a working environmental modeller needs enough numerical literacy to recognise when a simulation is giving the right answer for the wrong reason.

## 6.1 Euler's Method

The explicit Euler method approximates the derivative \( dC/dt \) at time \( t_n \) by the forward difference \( \left( C_{n+1} - C_n \right) / \Delta t \) and rearranges to give

\[
C_{n+1} = C_n + \Delta t \cdot f\!\left( t_n, C_n \right) ,
\]

where \( f \) is the right-hand side of the ODE \( dC/dt = f(t, C) \). The method is first-order accurate: the global error scales as \( \Delta t \), so halving the step size halves the error. It is conditionally stable: for the decay equation \( dC/dt = -k C \), the numerical solution stays bounded only if \( \Delta t < 2/k \), and is oscillation-free only if \( \Delta t < 1/k \). For stiff systems, where rate constants span many orders of magnitude, Euler's method becomes painful because the step size is dictated by the fastest rate, even when the slowest variable dominates the answer.

## 6.2 The Implicit (Backward) Euler Method

Evaluating \( f \) at time \( t_{n+1} \) instead of \( t_n \) gives the implicit Euler method,

\[
C_{n+1} = C_n + \Delta t \cdot f\!\left( t_{n+1}, C_{n+1} \right) ,
\]

which is unconditionally stable for linear problems but requires solving an (often non-linear) equation at each step. In environmental modelling the implicit Euler method is the workhorse for reaction networks in groundwater and atmospheric chemistry, where stability matters more than speed and the algebraic system can be solved efficiently with Newton iteration.

## 6.3 Runge–Kutta Methods

Higher-order explicit methods combine several evaluations of \( f \) per step to increase accuracy without sacrificing explicitness. The classical fourth-order Runge–Kutta (RK4) method uses four function evaluations per step and achieves fourth-order global accuracy:

\[
\begin{aligned}
k_1 &= f\!\left( t_n, C_n \right) , \\
k_2 &= f\!\left( t_n + \tfrac{\Delta t}{2}, C_n + \tfrac{\Delta t}{2} k_1 \right) , \\
k_3 &= f\!\left( t_n + \tfrac{\Delta t}{2}, C_n + \tfrac{\Delta t}{2} k_2 \right) , \\
k_4 &= f\!\left( t_n + \Delta t, C_n + \Delta t\, k_3 \right) ,
\end{aligned}
\]

\[
C_{n+1} = C_n + \frac{\Delta t}{6}\left( k_1 + 2 k_2 + 2 k_3 + k_4 \right) .
\]

RK4 is the standard default for non-stiff environmental ODEs: reaction networks with comparable rate constants, lake mixing models, and most reactor transient analyses. Adaptive-step variants (Runge–Kutta–Fehlberg, Dormand–Prince) automate the choice of \( \Delta t \) by estimating the local error at each step.

## 6.4 Stiffness and When to Switch Methods

A stiff system is one in which the timescales of the fastest processes are much shorter than the timescales over which the solution is wanted. Atmospheric photochemistry, with rates from microseconds to days, is famously stiff. Explicit methods handle stiffness badly: stability forces a time step set by the fastest rate, even when that rate is nearly at equilibrium and contributes almost nothing to the trajectory of interest. Implicit methods, or specialised stiff solvers based on backward differentiation formulas, are the standard response. The warning sign that a model is stiff is that an explicit solver either blows up when \( \Delta t \) is increased or runs unconscionably slowly at the small \( \Delta t \) required for stability.

# Chapter 7: The Advection–Diffusion–Reaction Equation

Scaling down the integral mass balance of Chapter 2 to an infinitesimal control volume produces a partial differential equation that is the central object of environmental transport modelling. In one dimension for a solute of concentration \( C(x, t) \) in a fluid with velocity \( u \), diffusivity or dispersivity \( D \), and first-order reaction with rate constant \( k \),

\[
\frac{\partial C}{\partial t} + u\,\frac{\partial C}{\partial x} = D\,\frac{\partial^{2} C}{\partial x^{2}} - k\,C .
\]

The same structure, extended to three dimensions, describes groundwater transport, atmospheric dispersion, river water quality, and contaminant fate in lakes.

## 7.1 Advection

The advective term \( u \partial C / \partial x \) represents the transport of solute by the bulk motion of the fluid. If \( D \) and \( k \) were zero, the equation would reduce to \( \partial C/\partial t + u \partial C/\partial x = 0 \), whose solution is \( C(x, t) = C_0(x - u t) \): the initial distribution translates downstream at speed \( u \) without change of shape. Pure advection is an idealisation; any real fluid has enough turbulent or molecular mixing to spread the distribution, but for fast flows over short distances, advection dominates and the shape of the initial distribution largely survives.

## 7.2 Diffusion and Dispersion

The diffusive term \( D \partial^2 C / \partial x^2 \) represents mixing, whether molecular (rarely dominant in environmental systems) or turbulent (almost always dominant). The solution to the pure diffusion equation \( \partial C/\partial t = D \partial^2 C/\partial x^2 \) with initial condition \( C(x, 0) = M \delta(x) / A \) is the Gaussian spreading curve

\[
C(x, t) = \frac{M}{A\,\sqrt{4 \pi D t}}\,\exp\!\left( -\frac{x^{2}}{4 D t} \right) ,
\]

whose standard deviation \( \sigma = \sqrt{2 D t} \) grows as the square root of time. This is the signature that distinguishes diffusive from advective transport in tracer experiments. In rivers, the effective longitudinal dispersion coefficient (\( D_L \) in the literature) is much larger than molecular diffusivity because shear flow spreads out a plume far faster than molecular motion; the \( D \) in the model equation is the operational dispersivity that absorbs this effect, not the microscopic property.

## 7.3 Reaction

The reaction term \( -kC \) removes mass by first-order decay; biological uptake, photolysis, radioactive decay, and hydrolysis all plausibly fit this form, at least over limited ranges. When reaction is combined with transport, the steady-state solution in a semi-infinite domain with a prescribed upstream concentration is

\[
C(x) = C_0 \exp\!\left( \frac{u x}{2 D} \left( 1 - \sqrt{1 + \frac{4 k D}{u^{2}}} \right) \right) ,
\]

which reduces to \( C_0 \exp\!\left( -k x / u \right) \) in the advection-dominated limit (small \( D \)) and to a much steeper decay when dispersion is important. The dimensionless group \( 4 k D / u^{2} \) is sometimes called the Peclet-reaction parameter; its value decides whether the upstream concentration affects a given downstream station or not.

## 7.4 Plume Spreading and Continuous Sources

An instantaneous release produces a Gaussian cloud; a continuous source produces a steady plume whose shape is controlled by the advection–diffusion balance. In an idealised river with a cross-section of uniform velocity \( u \) and lateral dispersivity \( D_y \), a continuous source of strength \( \dot{m} \) at the centreline produces, sufficiently far downstream, a lateral Gaussian distribution

\[
C(x, y) = \frac{\dot{m}}{u\,h\,\sqrt{4\pi D_y x / u}}\,\exp\!\left( -\frac{y^{2} u}{4 D_y x} \right) ,
\]

where \( h \) is the depth. The same formula, rotated into vertical and horizontal spread for atmospheric emissions, underlies the Gaussian plume model of Chapter 9.

# Chapter 8: Biochemical Oxygen Demand and the Streeter–Phelps Model

Of all the analytical solutions in environmental engineering, none is more celebrated than the Streeter–Phelps model of the dissolved oxygen sag downstream of a sewage discharge. It is the textbook example of a coupled first-order system, and it is a genuinely useful regulatory tool.

## 8.1 BOD Kinetics

Biochemical oxygen demand (BOD) is the mass of oxygen that microbial activity will consume, per unit volume of water, as it oxidises the organic matter present. The first-order kinetic model represents the remaining ultimate BOD, \( L(t) \), as decaying at rate \( k_d \),

\[
\frac{dL}{dt} = -k_d L , \quad L(t) = L_0 \exp\!\left( -k_d t \right) .
\]

The oxygen consumed up to time \( t \) is \( L_0 - L(t) = L_0 \left( 1 - \exp\!\left( -k_d t \right) \right) \), which is what the laboratory BOD test measures, conventionally at five days to give the BOD\(_5\). Temperature dependence is usually written as \( k_d(T) = k_d(20)\,\theta^{T - 20} \) with \( \theta \approx 1.047 \).

## 8.2 Dissolved Oxygen Sag

Downstream of a sewage outfall, BOD decays as the organic matter is consumed, and the oxygen that microbes remove must be replaced by reaeration from the atmosphere. Defining the oxygen deficit \( D = C_s - C \) (saturation concentration minus actual concentration), the coupled equations in a plug-flow river reach with travel time \( t \) are

\[
\frac{dL}{dt} = -k_d L , \quad \frac{dD}{dt} = k_d L - k_a D ,
\]

where \( k_a \) is the reaeration rate constant. The first equation solves as before; the second is linear with a prescribed forcing and solves by integrating factor to give the classical Streeter–Phelps formula,

\[
D(t) = \frac{k_d L_0}{k_a - k_d}\left( \exp\!\left( -k_d t \right) - \exp\!\left( -k_a t \right) \right) + D_0 \exp\!\left( -k_a t \right) .
\]

The deficit rises, reaches a maximum, and decays back toward zero. The critical time at which the deficit is maximum is

\[
t_c = \frac{1}{k_a - k_d}\,\ln\!\left[ \frac{k_a}{k_d}\left( 1 - \frac{D_0 \left( k_a - k_d \right)}{k_d L_0} \right) \right] ,
\]

and the corresponding critical deficit decides whether the stream will meet its oxygen standard.

## 8.3 Regulatory Use and Limitations

Streeter–Phelps is the ancestor of every modern river water quality model, from QUAL2K to WASP. Its assumptions — plug flow, first-order BOD decay, first-order reaeration, steady state — are all approximations, and the models that replace it today include nitrification, photosynthesis and respiration, sediment oxygen demand, and longitudinal dispersion. Even so, for a quick screening of a proposed discharge, the Streeter–Phelps formula remains the first calculation an engineer performs, and the critical deficit it predicts still correlates surprisingly well with measured sags when the reach is reasonably long and steady.

<div class="note">
<strong>Why Streeter–Phelps matters pedagogically.</strong> The derivation combines every idea from Chapters 2–5: a mass balance on a control volume, two first-order reactions, analytical solution by integrating factor, and a physically meaningful critical point obtained by differentiation. If a student can derive the Streeter–Phelps equation from scratch, they have mastered the core machinery of environmental modelling.
</div>

# Chapter 9: Atmospheric Dispersion and the Gaussian Plume

The continuous-source solution of Chapter 7 reappears, in its most famous incarnation, as the Gaussian plume model for atmospheric emissions from a stack. For a source of strength \( Q \) (mass per unit time) at effective height \( H \) above ground, in a wind of speed \( u \) aligned with the \( x \) axis, the ground-level concentration at downwind distance \( x \) and crosswind distance \( y \) is

\[
C(x, y, 0) = \frac{Q}{\pi\,u\,\sigma_y\,\sigma_z}\,\exp\!\left( -\frac{y^{2}}{2 \sigma_y^{2}} \right)\,\exp\!\left( -\frac{H^{2}}{2 \sigma_z^{2}} \right) ,
\]

where \( \sigma_y(x) \) and \( \sigma_z(x) \) are the horizontal and vertical dispersion coefficients, tabulated as Pasquill–Gifford curves parameterised by atmospheric stability class. The formula is derived by writing a steady advection–diffusion equation for the plume, assuming the advective transport along the wind dominates, and taking the lateral and vertical spread to be Gaussian with known standard deviations.

## 9.1 Interpretation of the Parameters

The effective stack height \( H \) is the geometric stack height plus the buoyant plume rise, which depends on the temperature and velocity of the stack gases; plume rise formulas (Briggs) are empirical but widely used. The stability class encodes the atmospheric turbulence: unstable daytime conditions give rapid spread and rapid ground-level arrival, stable nighttime conditions give a narrow plume that may travel far before touching the ground. The ground-level concentration has a characteristic maximum at a downwind distance where \( \sigma_z \) grows just large enough that the exponent \( H^{2}/\left( 2 \sigma_z^{2} \right) \) is comparable to unity; beyond this distance, dilution by further spreading dominates.

## 9.2 Averaging Times and Regulatory Use

The Gaussian plume predicts a concentration averaged over the timescale on which the turbulence statistics have been sampled, typically 10 to 60 minutes. Regulatory standards for air quality are often written as 1-hour or 24-hour averages, and conversion factors (or time-averaging within the model) are applied accordingly. Full regulatory models (AERMOD in the United States, CALPUFF for long-range transport) retain the Gaussian structure but add terrain effects, building downwash, chemical transformation, and meteorological data ingestion.

# Chapter 10: Lake, Reservoir, and Groundwater Models

Reactor theory and the advection–diffusion–reaction equation together cover a wide range of environmental systems, but two application areas deserve special attention because they shape the questions environmental engineers most often face.

## 10.1 Lake and Reservoir Models

A fully mixed lake, in which the concentration is uniform throughout the volume, is a CSTR. Substituting typical values gives the central result of lake modelling: for a conservative species the steady-state lake concentration equals the volume-weighted mean of inflow concentrations, and for a first-order sink the steady-state concentration is reduced by the factor \( 1/\left( 1 + k\tau \right) \). The characteristic timescale for the lake to approach a new steady state after a change in loading is \( 1/\left( 1/\tau + k \right) \), which for large lakes with long residence times can be years or decades; Vollenweider's classical phosphorus loading models exploit exactly this structure.

A stratified lake is a two-box model, with an epilimnion (surface layer, well mixed by wind) and a hypolimnion (bottom layer, largely isolated during summer). Mass exchange between the two layers is represented by a bulk exchange coefficient. Seasonal turnover, during which the entire water column mixes, is represented either by setting the exchange coefficient to a very large value during the turnover window or by re-initialising the two compartments to the same concentration.

## 10.2 Groundwater Flow and Contaminant Transport

Groundwater flow in a saturated aquifer obeys Darcy's law, \( q = -K \nabla h \), where \( q \) is the Darcy flux, \( K \) is the hydraulic conductivity, and \( h \) is the hydraulic head. Combined with mass conservation, this yields the groundwater flow equation \( S_s \partial h/\partial t = \nabla \cdot \left( K \nabla h \right) \), where \( S_s \) is specific storage. In steady flow this reduces to Laplace's or Poisson's equation depending on whether there are sources or sinks.

Contaminant transport in groundwater is described by the advection–diffusion–reaction equation with the velocity taken as the pore-water velocity, \( v = q/n \), where \( n \) is porosity, and the dispersivity taken as a scale-dependent property of the porous medium. Retardation by sorption divides the transport velocity by a retardation factor \( R = 1 + \rho_b K_d / n \), where \( \rho_b \) is the bulk density and \( K_d \) is the sorption partition coefficient; strongly sorbing contaminants move at a fraction of the pore-water velocity. Degradation, either abiotic (hydrolysis) or biotic (microbial), is represented by a first-order rate constant that may itself depend on substrate and electron acceptor availability. Analytical solutions for simple geometries (Ogata–Banks for a semi-infinite column with a step injection, Domenico for a continuous source in three dimensions) provide the screening-level tools, and numerical codes (MODFLOW for flow, MT3DMS for transport) handle the geometries and heterogeneities of real sites.

## 10.3 Atmospheric Box Models

A well-mixed airshed, for example an urban basin on a stagnant day, can be modelled as a CSTR whose volume is the basin area multiplied by the mixing height and whose flushing flow is the wind speed multiplied by the cross-sectional area normal to the wind. The same formula that governs lake concentrations, \( C_{\text{ss}} = C_{\text{in}} / \left( 1 + k\tau \right) \) plus a source term \( \dot{m}/Q \), tells the engineer what ambient concentration an emission rate will produce. Box models are crude, but they set expectations and bound the answers delivered by more detailed Gaussian, puff, or Eulerian grid models.

# Chapter 11: Numerical Methods for Partial Differential Equations

Partial differential equations rarely have closed-form solutions when domains are irregular, coefficients vary in space, or reactions are non-linear. Finite difference methods are the standard entry point and illustrate the ideas that finite volume and finite element methods refine.

## 11.1 Finite Differences for the Advection–Diffusion Equation

Discretising the one-dimensional advection–diffusion equation on a uniform grid with spacing \( \Delta x \) and time step \( \Delta t \) replaces derivatives by differences. An explicit, centred-difference scheme gives

\[
\frac{C_i^{n+1} - C_i^{n}}{\Delta t} + u\,\frac{C_{i+1}^{n} - C_{i-1}^{n}}{2 \Delta x} = D\,\frac{C_{i+1}^{n} - 2 C_i^{n} + C_{i-1}^{n}}{\Delta x^{2}} .
\]

The scheme is second-order accurate in space and first-order in time. Its stability is governed by two dimensionless numbers: the Courant number \( Cr = u \Delta t / \Delta x \), which must satisfy \( Cr \le 1 \) for any explicit scheme to track waves without blowing up, and the diffusion number \( Fo = D \Delta t / \Delta x^{2} \), which must satisfy \( Fo \le 1/2 \) for an explicit diffusion update to be stable. Violating either condition produces exponentially growing oscillations that no amount of post-processing can disguise.

## 11.2 Upwind Differencing and Numerical Diffusion

Centred differences for advection are unconditionally unstable for the pure advection equation, even though they look innocuous. The standard remedy is upwind differencing: when \( u > 0 \), the spatial derivative is approximated as \( \left( C_i - C_{i-1} \right)/\Delta x \), using information from the direction the flow is coming from. Upwind schemes are stable up to \( Cr = 1 \), but they introduce numerical diffusion that blurs sharp fronts; the engineer must decide whether the blurring is tolerable at the grid resolution being used. Higher-order schemes (QUICK, MUSCL, TVD limiters) aim to combine the stability of upwind with the accuracy of centred differences, but they are outside the scope of a first course.

## 11.3 Implicit and Crank–Nicolson Schemes

Implicit schemes evaluate the spatial derivatives at the new time level \( n+1 \), which removes the stability restriction at the cost of solving a linear system at each step. The Crank–Nicolson scheme averages explicit and implicit updates, gaining second-order accuracy in time while retaining unconditional stability for diffusion. For a one-dimensional domain these linear systems are tridiagonal and can be solved by the Thomas algorithm in a single sweep.

## 11.4 Verification and the Method of Manufactured Solutions

Any numerical code can produce plausible-looking output. Verification is the process of confirming that it produces the right output. The most reliable technique is to compare numerical solutions against analytical benchmarks (Gaussian spreading, Streeter–Phelps, Ogata–Banks) on identical problems, refining the grid and time step until the error decays at the theoretical rate. When no analytical solution is available, the method of manufactured solutions constructs an artificial problem for which the exact answer is known by design, and tests the code against it. A model that has not been verified is not a model; it is a hypothesis dressed in output files.

# Chapter 12: Calibration, Validation, Uncertainty, and Sensitivity

No environmental model is a complete description. Every model has adjustable parameters, and every set of observations used to estimate those parameters has noise, gaps, and representation error. Calibration, validation, and uncertainty analysis are the disciplines that turn a model from a plausible story into a tool with known limits.

## 12.1 Parameter Estimation

Given observations \( y_i \) at times or locations \( x_i \), and a model \( M(x_i; \boldsymbol{\theta}) \) depending on a parameter vector \( \boldsymbol{\theta} \), the standard calibration problem is to choose \( \boldsymbol{\theta} \) that minimises a misfit function, typically the sum of squared residuals

\[
J(\boldsymbol{\theta}) = \sum_{i=1}^{N} \left( y_i - M(x_i; \boldsymbol{\theta}) \right)^{2} .
\]

For linear-in-parameters models the minimisation is a linear least-squares problem with a closed-form solution. For non-linear models (most environmental models are non-linear in at least some parameters) iterative techniques are required: Gauss–Newton, Levenberg–Marquardt, or general-purpose optimisers. Identifiability is a recurrent issue: several parameter combinations may fit the data equally well, and the calibration must either include informative data that separates them or accept that the model has irreducible ambiguity.

## 12.2 Validation

Validation is the step in which the calibrated model is compared against data that were not used in calibration. The distinction matters because a model with enough parameters can always be made to fit any finite data set; what demonstrates predictive skill is that the model, with parameters fixed during calibration, continues to track independent observations. Split-sample validation (reserve the last year of data for validation, calibrate on the rest), cross-validation (leave out one observation at a time), and predictive validation (apply the model to a new system and compare to measurements) are the standard techniques. Validation does not prove a model is right; it quantifies the extent to which it has so far not been shown to be wrong.

## 12.3 Sensitivity Analysis

Sensitivity analysis asks how the model output responds to changes in the input parameters. A local sensitivity is the partial derivative of output with respect to input evaluated at the calibrated parameter values, \( \partial y / \partial \theta_j \), often normalised to give dimensionless sensitivity coefficients. Global sensitivity analysis explores the entire plausible range of parameters, typically by Monte Carlo sampling, and reports the fraction of output variance attributable to each parameter (Sobol indices) or to each pair of parameters. Sensitivity analysis is indispensable for prioritising data collection: the parameters to which the output is most sensitive are the ones whose measurement will most reduce predictive uncertainty.

## 12.4 Uncertainty Propagation

The final step is to translate uncertainty in parameters, inputs, and model structure into uncertainty in predictions. Analytical propagation via the first-order second-moment method approximates the output variance as \( \text{Var}(y) \approx \sum_j \left( \partial y / \partial \theta_j \right)^{2} \text{Var}(\theta_j) \), valid when the model is approximately linear over the relevant parameter range. Monte Carlo propagation draws parameter samples from their posterior distributions, runs the model for each sample, and reports the empirical distribution of predictions. Bayesian inference (Markov chain Monte Carlo) goes further and delivers a posterior distribution over parameters conditioned on data, naturally producing predictive distributions rather than point predictions. In regulatory practice, the outputs are often summarised as 10th, 50th, and 90th percentile predictions, or as exceedance probabilities for a given standard.

<div class="warning">
<strong>Modelling ethics.</strong> A model whose uncertainty is not communicated alongside its predictions is dangerous. An effluent compliance forecast reported as a single number invites the reader to treat it as certain, when the honest answer may be that the model predicts compliance with 60 percent probability under the assumed conditions. Always report ranges, confidence intervals, or scenario envelopes rather than single numbers whenever uncertainty is non-negligible — which, in environmental engineering, is essentially always.
</div>

# Chapter 13: Putting It Together — A Modelling Workflow

Every substantial modelling task follows, implicitly or explicitly, the same sequence of steps. Making them explicit is useful not because the workflow is rigid but because naming the steps makes their failures diagnosable.

First, define the question. What decision will the model support? A model built to compare two effluent discharge options is different from a model built to explain why last summer's algal bloom occurred, and conflating the two wastes effort.

Second, choose the system boundary and the state variables. This choice fixes the level of detail and rules out questions the model cannot answer. A lake model that tracks only phosphorus cannot answer questions about dissolved oxygen; a groundwater flow model that tracks only heads cannot forecast contaminant arrival times unless a transport module is added.

Third, identify the processes. For each state variable, write the mass balance and identify the terms: advection, diffusion, reactions, exchanges. For each term, decide whether it is significant enough to retain; dimensional analysis and characteristic scale arguments guide these decisions and prevent model bloat.

Fourth, write the equations. Ordinary or partial differential equations, discrete or continuous, linear or non-linear; with initial and boundary conditions informed by the physics of the system boundary. This is the step at which Chapters 2 through 10 of this course are directly applied.

Fifth, solve the equations. Analytical solutions where available (Chapters 4 and 7); otherwise numerical (Chapters 6 and 11). Verification against analytical benchmarks or the method of manufactured solutions is non-negotiable if the numerical code was written for the project.

Sixth, calibrate against data. Parameter estimation with attention to identifiability; validation against an independent data set or scenario. Report which parameters were calibrated, which were fixed from the literature, and what the residuals looked like.

Seventh, quantify uncertainty. Local and global sensitivity analysis to identify dominant parameters; Monte Carlo or Bayesian propagation to translate parameter uncertainty into predictive uncertainty; communication of the results as distributions or exceedance probabilities rather than single numbers.

Eighth, document, archive, and pass on. A model is only useful if it can be re-run. Archive the equations, the parameter values, the data, the code, and the verification results. A modelling report that cannot be reproduced five years later from the archive has not finished its job.

The chapters of this course develop, in order, the tools required by each step of this workflow. Mass balances and control volumes provide the language for step three. Ordinary differential equations and their analytical and numerical solutions supply step five for lumped systems. Partial differential equations and their numerical solutions supply step five for spatially distributed systems. Initial and boundary conditions make the mathematical problems well posed. Calibration, validation, and uncertainty analysis close the loop between model and observation. The worked examples of reactors, BOD–DO sag, lakes, groundwater, and atmospheric dispersion demonstrate the workflow in settings that an environmental engineer will meet repeatedly in practice.
