---
title: "CIVE 343: Traffic Simulation Modelling and Applications"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Treiber, M. and Kesting, A., *Traffic Flow Dynamics: Data, Models and Simulation*, Springer, 2013; Barceló, J. (ed.), *Fundamentals of Traffic Simulation*, Springer, 2010.

**Supplementary texts** — Daganzo, C.F., *Fundamentals of Transportation and Traffic Operations*, Pergamon, 1997; Kerner, B.S., *The Physics of Traffic*, Springer, 2004.

**Online resources** — MIT OCW 1.225J "Transportation Flow Systems"; TRB Simulation Task Force public guidelines; FHWA Traffic Analysis Toolbox open volumes; SUMO (open-source simulator) documentation; TRANSIMS archives.

---

# Chapter 1: Traffic Flow Dynamics

## 1.1 Macroscopic Description

Treat traffic as a continuum: density \( k(x,t) \) [veh/km], flow \( q(x,t) \), mean speed \( v(x,t) \). Conservation:

\[ \frac{\partial k}{\partial t} + \frac{\partial q}{\partial x} = 0. \]

Closure by a speed-density relation \( v = V(k) \) yields the **LWR model** (Lighthill-Whitham-Richards):

\[ \frac{\partial k}{\partial t} + \frac{dQ(k)}{dk}\frac{\partial k}{\partial x} = 0, \]

a first-order quasilinear hyperbolic PDE. Characteristics travel at wave speed \( dQ/dk \); shocks form when characteristics intersect.

## 1.2 Shock Waves

Conservation across a moving discontinuity:

\[ u_{shock} = \frac{q_2 - q_1}{k_2 - k_1}. \]

Downstream slow-moving congestion propagates upstream as a shock. Engineers use shock-wave analysis to predict queue growth upstream of signals, lane closures, and incidents. Queue length \( L \) grows as \( L = (u_{shock}) t \) while demand exceeds capacity.

## 1.3 Higher-Order Models

Payne-Whitham (1970s) and Aw-Rascle (2000) add a momentum equation for speed dynamics, better capturing acceleration lag and stop-and-go instabilities. Trade-off: more parameters, greater fidelity but higher calibration demand. LWR remains standard for network-wide analysis.

## 1.4 Phase Transitions

Kerner's three-phase theory (free flow, synchronized, wide moving jam). Wide moving jams propagate upstream at roughly constant ~15 km/h independent of traffic conditions—a scaling observation from extensive freeway data. Implications for real-time detection and control of congestion waves.

# Chapter 2: Simulation Paradigms

## 2.1 Microscopic Simulation

Each vehicle modeled as an agent with position, velocity, acceleration. Car-following models (Gipps, IDM, Wiedemann) describe longitudinal dynamics; lane-change models (MOBIL, Gipps) govern lateral. Time step (0.1-1 s). Outputs: individual trajectories, aggregate flow-density-speed.

Intelligent Driver Model (IDM):

\[ \dot v = a\!\left[1 - (v/v_0)^\delta - (s^*/s)^2\right], \]

\[ s^* = s_0 + v T + \frac{v\Delta v}{2\sqrt{ab}}. \]

Parameters: desired speed \( v_0 \), headway \( T \), max acceleration \( a \), comfortable deceleration \( b \), minimum gap \( s_0 \).

## 2.2 Mesoscopic Simulation

Between micro and macro: typically represent vehicles or packets on links with aggregate behavior (speed from link density). Efficient for large networks, losing fine microscopic detail. DynaMIT and DYNASMART are examples. Useful for DTA (dynamic traffic assignment).

## 2.3 Macroscopic Simulation

Solve LWR or higher-order PDE on link networks via the Cell Transmission Model (CTM, Daganzo). CTM discretizes links into cells of length \( v_f \Delta t \); sending and receiving flows at boundaries mirror the fundamental diagram. Fast; suitable for planning and network-wide DTA.

## 2.4 Agent-Based Models

Activity-based, agent-based simulation (MATSim, TRANSIMS, POLARIS) integrates demand and network. Each agent has a daily plan; plans replanned day-to-day until equilibrium or a specified stopping criterion. Richer outputs (accessibility, equity, emissions) at higher computational cost.

# Chapter 3: Stochastic Foundations

## 3.1 Arrivals and Queues

Random vehicle arrivals often modeled as Poisson: \( P(n \text{ in } t) = e^{-\lambda t}(\lambda t)^n/n! \). Headways exponentially distributed when arrivals Poisson; realistic traffic shows more structured headways (shifted exponential, log-normal) once platoons form.

M/M/1 queue: mean waiting time \( W = \rho/(\mu(1-\rho)) \), \( \rho = \lambda/\mu \). Approximates isolated signal at low-volume conditions. For saturated or oversaturated signals, deterministic queuing models dominate.

## 3.2 Car-Following Noise

Human drivers exhibit variable reaction times, desired speeds, headways. Stochastic calibrations add distributions to parameters. Important for realistic flow breakdown, capacity variability, and crash risk metrics (time-to-collision distributions).

## 3.3 Route Choice Under Uncertainty

Travel times are uncertain due to congestion, incidents, weather. Users' value of reliability often 0.8-1.2 × value of mean time; route choice models incorporate both mean and variance. Prospect theory and regret-based alternatives relax expected utility.

## 3.4 Monte Carlo for Scenario Analysis

Run many replications of a stochastic simulation; report distributions of outcomes (queue length, delay, travel time). Variance reduction techniques (common random numbers, Latin hypercube) improve efficiency. Confidence intervals on aggregate measures rather than point estimates.

# Chapter 4: Calibration and Validation

## 4.1 Calibration

Adjust model parameters so outputs match observed data (counts, speeds, travel times, OD patterns). Genetic algorithms, simultaneous perturbation stochastic approximation (SPSA), Bayesian methods. Objective functions: GEH statistic, RMSE, mean absolute percentage error.

GEH = \( \sqrt{2(M-C)^2/(M+C)} \); < 5 for 85% of counts is a common acceptance criterion (FHWA).

## 4.2 Validation

Test calibrated model against independent data (held-out time periods, screenline counts, probe-vehicle speeds). Pass/fail criteria specified in project scope. Sensitivity analysis on key parameters identifies which have most influence on outputs.

## 4.3 Common Pitfalls

Over-fitting to aggregate data while missing micro-behavior; under-representing demand for high-volume periods; ignoring driver heterogeneity; using default parameters inappropriately; assuming steady demand when actual is time-variant. Documentation and peer review are essential safeguards.

## 4.4 Data Sources

Traffic counts (ATR, permanent count stations, temporary short-counts), speed surveys, travel time (Bluetooth, cellular, probe vehicles), video, loop detectors. Emerging: connected vehicle data, navigation-app anonymized travel times (INRIX, HERE, Google), drone surveillance. Data cleaning and outlier screening are non-trivial.

<div class="example">
<strong>Signalized intersection micro-simulation.</strong> Represent a four-leg signalized intersection with 120 s cycle, four phases. Demand 600 veh/h east-west, 300 veh/h north-south. IDM driver parameters with headway distribution mean 1.8 s. Simulate 1 hour with 10 random seeds. Outputs: mean control delay 35 s (LOS D), queue 95th percentile 8 vehicles. Compare to HCM analytical result (33 s delay)&mdash;agreement within uncertainty.
</div>

# Chapter 5: Applications

## 5.1 Operational Analysis

Evaluate signal retiming, ramp metering, lane management. Simulate before-after scenarios; compare delay, travel time, queue length, emissions. Small-network applications; calibration against field data closes the credibility loop.

## 5.2 Incident and Work Zone Management

Capacity reduction due to incident or lane closure propagates upstream. Simulate detour strategies, diversion response, and ITS interventions (dynamic message signs, ramp control). Benefits measured in total person-hours of delay saved.

## 5.3 Planning-Level Scenarios

DTA on a metropolitan network evaluates projects (new bridge, HOT lane, transit extension) against baseline. 20-year horizons project future demand; multiple scenarios capture uncertainty. Results feed environmental review and benefit-cost analysis.

## 5.4 Emerging Technologies

Connected and automated vehicle (CAV) scenarios: platoon formation (closer headways, higher capacity), cooperative merge, signal phase optimization. Shared automated mobility may increase VKT (induced trips, empty repositioning) even as it reduces per-trip congestion. Sensitivity to penetration rate essential in analysis.

# Chapter 6: Optimization and Prediction

## 6.1 Simulation-Based Optimization

Black-box optimization of objectives (delay, throughput, emissions) over decision variables (signal timings, metering rates, pricing). Surrogate modeling (response surface, Gaussian process) reduces expensive simulation runs. Multi-objective formulations (delay vs. equity) yield Pareto frontiers.

## 6.2 Short-Term Forecasting

Data-driven methods (ARIMA, neural networks, LSTM, transformers) forecast traffic conditions 5-60 minutes ahead from sensor data. Graph neural networks exploit network structure. Real-time operations (ramp metering, routing guidance, incident detection) benefit from short-horizon predictions.

## 6.3 Scenario Evaluation and Decision Support

Simulation outputs feed decision-support dashboards for operators and planners. Visualization (heat maps, time-space plots, animation) conveys complex dynamics. Policy decisions rarely reduce to one number; simulation provides the evidence base for informed trade-offs.

## 6.4 Credibility and Professional Practice

Simulation studies must document inputs, assumptions, calibration, sensitivity, and limitations. Model choice should match problem (micro for operations, meso/macro for planning). Peer review, reproducibility (seed settings, version control), and professional judgment are cornerstones. A pretty animation is not evidence.

<div class="remark">
Traffic simulation complements analytical methods by handling stochastic, nonlinear, and highly heterogeneous systems. The engineer who understands the fundamental physics (flow, density, shocks), the stochastic processes, the calibration discipline, and the decision context turns simulation from a demonstration tool into a genuine aid to decision.
</div>
