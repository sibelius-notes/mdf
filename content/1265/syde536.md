---
title: "SYDE 536: Modelling Transportation Systems"
subjects: "SYDE"
---

## Sources and References

- Ortúzar and Willumsen, <em>Modelling Transport</em> (Wiley)
- Sheffi, <em>Urban Transportation Networks: Equilibrium Analysis with Mathematical Programming Methods</em> (Prentice Hall)
- Mannering, Washburn, <em>Principles of Highway Engineering and Traffic Analysis</em> (Wiley)
- Greene, <em>Econometric Analysis</em> (Pearson)
- TRB, <em>Highway Capacity Manual</em>

---

# Chapter 1: The Four-Step Framework

## 1.1 Overview

Transportation modelling at regional scale has historically proceeded in four steps: trip generation, trip distribution, mode choice, and traffic assignment. Each step takes outputs of the previous one and applies a theoretically grounded or empirically calibrated transformation. Modern practice augments this sequence with activity-based, agent-based, and dynamic-traffic-assignment alternatives, but the four-step lens remains essential vocabulary.

## 1.2 Transportation as a System

Transportation systems couple land use, population, economics, infrastructure, and behaviour. Travel demand derives from activity patterns: commuting, shopping, schooling, socialising, freight. Supply-side characteristics — network topology, vehicle capacity, service quality — interact with demand through congestion and mode choice. Feedback between demand and supply, short-term and long-term, complicates analysis.

# Chapter 2: Bayesian Modelling of Collision Rates

## 2.1 Collision Data

Collision data are counts by location, time, vehicle type, and severity — typically sparse at individual sites, heavy-tailed, and subject to reporting biases. Classical frequentist analyses treat observed rates as estimates of true risks, but small samples at specific locations give unreliable estimates.

## 2.2 Bayesian Framework

Bayesian methods combine a prior distribution with observed data via Bayes' theorem:

\[
p(\theta | y) = \frac{p(y|\theta)\,p(\theta)}{p(y)}.
\]

For collision counts, a Poisson likelihood with a gamma prior for the rate yields a gamma posterior — the classical empirical Bayes approach. Hierarchical models pool information across sites while allowing site-specific deviation, shrinking unreliable individual estimates toward a group mean in proportion to their sample size.

<div class="example">
A site observed for two years with 3 crashes has a raw rate of 1.5 crashes/year with high sampling uncertainty. Pooling with similar sites in a hierarchical Bayesian model produces a shrunken estimate around 1.0 crashes/year with much tighter credible intervals.
</div>

## 2.3 Application

Bayesian collision models inform identification of hazardous sites, before-after evaluation of countermeasures, and allocation of safety funds. They also quantify uncertainty in ways decision-makers can use: credible intervals, posterior probability that rate exceeds a threshold, and probability that a site is among the top-k hazards.

# Chapter 3: Discrete Choice of Travel Mode

## 3.1 Random Utility

Discrete choice models assume a traveller selects the alternative (car, bus, bike, walk, train) with maximum utility. Utility is random from the analyst's perspective:

\[
U_{in} = V_{in} + \varepsilon_{in},
\]

with systematic \( V_{in} \) capturing observed attributes and random \( \varepsilon_{in} \) unobserved heterogeneity.

## 3.2 Multinomial Logit

The most common specification assumes \( \varepsilon \) i.i.d. extreme-value, giving the multinomial logit (MNL) probability

\[
P_{in} = \frac{\exp(\mu V_{in})}{\sum_{j} \exp(\mu V_{jn})},
\]

with scale \( \mu \). Attributes — travel time, cost, comfort, wait, transfers — enter \( V \) linearly with estimated coefficients, from which elasticities and values of time derive.

## 3.3 Beyond MNL

The MNL independence-from-irrelevant-alternatives assumption fails for correlated alternatives (blue bus / red bus paradox). Nested logit, cross-nested logit, mixed logit, and probit models relax this, at the cost of more complex estimation. Latent-class models segment travellers with distinct preference parameters. Willingness-to-pay for time savings, environmental quality, or reliability emerges from model coefficients.

<div class="definition">
The <strong>value of time</strong> is the ratio of the coefficient of time to the coefficient of cost in a utility specification, expressed in currency per hour — a common input to benefit-cost analysis of transport investments.
</div>

# Chapter 4: Emissions from Operating-Mode Time Series

## 4.1 Vehicle Emissions Mechanisms

Vehicle tailpipe emissions depend on engine load, speed, acceleration, temperature, and mileage. Key pollutants include CO<sub>2</sub>, NOx, particulate matter, hydrocarbons, and CO. Engine management, catalytic converters, and particulate filters reduce emissions per mile, but stop-and-go driving and cold starts raise per-mile rates substantially.

## 4.2 Operating Mode Framework

The EPA MOVES model and similar tools classify instantaneous driving into <em>operating modes</em> defined by speed and vehicle-specific power (VSP). Each mode has an emission rate; aggregate emissions

\[
E = \sum_k t_k \cdot e_k
\]

sum the product of time-in-mode \( t_k \) and rate \( e_k \) across modes. Time-series speed profiles from GPS-equipped vehicles or traffic simulations provide the mode distributions.

## 4.3 Applications

This approach captures how congestion, signal coordination, gradient, and driving behaviour alter emissions beyond what average speed models show. Signal optimisation, eco-routing, and speed management policies can be evaluated by simulating their effect on operating-mode distributions.

# Chapter 5: Traffic Simulation

## 5.1 Macroscopic Models

Macroscopic traffic flow treats vehicles as a fluid with density \( k \), flow \( q \), and speed \( v \). Continuity gives

\[
\frac{\partial k}{\partial t} + \frac{\partial q}{\partial x} = 0,
\]

and fundamental diagrams link \( q, k, v \). Shockwave analysis follows congestion onset and dissipation.

## 5.2 Microscopic Models

Microscopic models simulate individual vehicles with car-following rules (Gipps, intelligent driver model) and lane-changing logic. Stochastic models capture driver heterogeneity. Calibration against real trajectories is essential and non-trivial.

## 5.3 Mesoscopic and Dynamic Assignment

Mesoscopic models balance detail with scale — aggregating individual vehicles into packets on links. Dynamic traffic assignment combines network-scale routing with time-varying conditions to model how traveller choices evolve during congestion onset and response to information.

<div class="remark">
Traffic simulations produce pretty animations but often hide the assumptions driving results. Robust conclusions require sensitivity analysis on demand, calibration, and routing logic.
</div>

# Chapter 6: Modelling Transportation for Sustainable Communities

## 6.1 Global Models

At global and community scales, frameworks such as the ASIF identity (Activity × Structure × Intensity × Fuel) decompose emissions into travel demand, mode shares, energy intensity, and carbon intensity. Scenario analyses test how policies — electrification, densification, transit investment, mode shift — alter each term.

## 6.2 Traffic Operations and Congestion

Operational simulations evaluate traffic signal timing, ramp metering, transit signal priority, and incident management. Queue-based analytical models and microscopic simulations complement one another; the Highway Capacity Manual provides standard procedures for level-of-service estimation.

Congestion pricing, high-occupancy vehicle lanes, and active traffic management are modelled to predict effects on mode choice, route choice, and emissions. The efficiency gains from pricing often exceed those from capacity expansion; political feasibility, equity, and complementary transit investments determine adoption.

## 6.3 Multi-Modal and Connected-Autonomous Futures

Growing integration of walking, cycling, transit, shared mobility, and private vehicles demands multi-modal models that capture transfers, first-last-mile, and complementary uses. Connected and autonomous vehicles (CAV) introduce new behaviours — platooning, cooperative intersections, empty repositioning — with uncertain effects on congestion, safety, and mode choice. Scenario modelling explores plausible CAV futures.

## 6.4 Equity and Access

Transportation modelling increasingly measures access — to jobs, education, healthcare, food — by population group. Accessibility metrics include cumulative opportunities reachable within a time budget and gravity-based potentials. Environmental justice analyses trace how pollution, displacement, and investment fall across communities. Modelling without equity framing risks perpetuating historical inequities.

<div class="example">
A transit investment analysis that considered only ridership and cost-per-rider would miss that a proposed line traverses low-income neighbourhoods currently isolated from employment centres; accessibility metrics and equity weighting might shift the investment priority.
</div>

<div class="theorem">
Transportation modelling couples demand (behaviour, preferences, activity), supply (networks, vehicles, services), and operations (flow, delay, reliability), each at multiple scales. Integrative models — Bayesian safety analysis, discrete choice of mode, operating-mode emissions, dynamic traffic simulation — inform policies that balance efficiency, safety, environmental impact, and equity.
</div>

The course builds fluency across this modelling portfolio, preparing students to support the decisions that will shape 21st-century mobility — as planners, consultants, researchers, or policymakers.
