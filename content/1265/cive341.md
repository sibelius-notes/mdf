---
title: "CIVE 341: Transportation Engineering Applications"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Roess, R.P., Prassas, E.S., and McShane, W.R., *Traffic Engineering*, 5th ed., Pearson, 2018; Transportation Research Board, *Highway Capacity Manual (HCM) 6th Edition*, 2016 (public summaries).

**Supplementary texts** — Garber, N.J. and Hoel, L.A., *Traffic and Highway Engineering*, 5th ed., Cengage, 2015; Mannering, F.L. and Washburn, S.S., *Principles of Highway Engineering and Traffic Analysis*, 7th ed., Wiley, 2020.

**Online resources** — MIT OCW 1.225J "Transportation Flow Systems"; FHWA Signal Timing Manual; Transport Canada technical reports; TRB open research summaries; TAC Geometric Design Guide public summaries.

---

# Chapter 1: Traffic Engineering Foundations

## 1.1 Traffic Stream Parameters

Flow \( q \) [veh/h], density \( k \) [veh/km], speed \( v \) [km/h] related by \( q = kv \). Types of averaging: time-mean speed (average of point observations) > space-mean speed (instantaneous average in a distance). Headway (time between successive vehicles) and spacing (distance) are microscopic analogs.

## 1.2 Fundamental Diagram

\( q \)-\( k \) relationship shows flow increases with density to capacity, then decreases. Greenshields linear model: \( v = v_f(1 - k/k_j) \), \( q = v_f k(1 - k/k_j) \), maximum flow \( q_c = v_f k_j / 4 \). Nonlinear models (Underwood, May, triangular) refine fit. Capacity drop (5-15%) from free-flow to queue-discharge explains freeway breakdown persistence.

## 1.3 Measurement

Loop detectors (inductive, measure volume and occupancy), radar, lidar, cameras with computer vision, cellular/Bluetooth probes, floating car runs. Each technology has characteristic error and cost profile. Traffic counts (short-term, 24-hour, 48-hour, continuous) sampling strategies balance precision with resource.

## 1.4 Volume, Design, and Level of Service

Annual average daily traffic (AADT), design hourly volume (DHV, typically 8-12% of AADT), peak hour factor (PHF). Volume/capacity ratio and level of service (LOS, A-F) applied to freeways, multilane highways, two-lane highways, urban streets, intersections, weaving sections, ramps. HCM methods differ by facility type.

# Chapter 2: Travel Forecasting

## 2.1 Demand Forecasting Frameworks

Four-step models (generation, distribution, mode choice, assignment) remain dominant in practice. Activity-based models offer deeper behavioral representation; agent-based simulation further resolves individual decisions. Forecasting horizons: 5-10 years (operational), 20-30 years (strategic planning).

## 2.2 Traffic Assignment

User equilibrium (Wardrop 1st): no user can reduce travel time by unilaterally changing routes. System optimal (2nd): total travel time minimized. Real systems operate near UE; SO requires centralized control or pricing. Stochastic user equilibrium accounts for perception errors.

BPR link performance function:

\[ t(x) = t_0\!\left[1 + \alpha(x/c)^\beta\right], \]

with free-flow time \( t_0 \), capacity \( c \), typical \( \alpha = 0.15 \), \( \beta = 4 \). Frank-Wolfe and MSA algorithms solve UE on large networks.

## 2.3 Demand Responsive Effects

Induced demand: new road capacity generates new traffic; elasticity ~0.6-1.0 over long run. Changes to access time reshape mode split, destination choice, and eventually land use. Neglecting induced demand systematically overstates benefits of road expansion.

## 2.4 Scenarios and Uncertainty

Base, high, low growth scenarios; technology scenarios (autonomous vehicles, electrification); policy scenarios. Monte Carlo analysis propagates uncertainty in demographics, economy, fuel prices. Robust decision-making prefers options that perform reasonably across scenarios over those optimized to a single expected future.

# Chapter 3: Intersection Analysis

## 3.1 Signalized Intersection Capacity

Saturation flow rate \( s \) [veh/h-green] from ideal \( s_0 \) (typically 1900) with adjustments for lane width, grade, heavy vehicles, parking, bus blockage, local adjustment factor. Capacity of a movement:

\[ c = s \cdot g/C, \]

with effective green \( g \), cycle length \( C \). Volume/capacity \( v/c \) ratio drives delay and LOS.

## 3.2 Signal Timing

Webster's optimum cycle length:

\[ C_o = \frac{1.5 L + 5}{1 - \sum Y_i}, \]

with lost time \( L \), critical flow ratios \( Y_i = v_i/s_i \). Green splits proportional to critical \( Y_i \). Delay formulas (Webster, HCM incremental) combine uniform and random arrival components.

## 3.3 Coordination

Through a corridor, offsets between adjacent signals can produce "green waves" for the major direction of travel. Time-space diagrams visualize platoon progression. Bandwidth-based (MAXBAND) and delay-based (TRANSYT) optimization methods. Adaptive systems (SCOOT, SCATS) adjust timings in real time based on detection.

## 3.4 Alternative Intersections

Roundabouts (reduce speed, simplify conflicts, eliminate severe angle crashes), displaced left turn (DLT), restricted crossing U-turn (RCUT), continuous flow intersection (CFI), diverging diamond interchange (DDI). Each has specific demand and geometry niches.

# Chapter 4: Operational Control and ITS

## 4.1 Ramp Metering

Fixed-time, local-traffic-responsive (ALINEA), coordinated freeway-wide algorithms. Benefits: delays breakdown, smooths merges, increases mainline throughput. Queues at ramps and fairness (meter bypass equity) are implementation concerns.

## 4.2 Dynamic Lane Management

High-occupancy vehicle (HOV), high-occupancy toll (HOT), dynamic pricing, managed lanes. Responsive speed limits (VSL) during congestion smooth flow and reduce rear-end crashes. Part-time shoulder use (hard shoulder running) as temporary capacity.

## 4.3 Traveler Information

Dynamic message signs (DMS), 511 phone and web, mobile apps, in-vehicle navigation. Accuracy and timeliness of information drive user response. Some systems actively shape routing; others report to empower choice.

## 4.4 Connected and Automated Vehicles

V2V and V2I communications (DSRC, C-V2X) enable cooperative adaptive cruise control, signal phase and timing messages, eco-driving. Fully automated vehicles may shift demand, crash profiles, and infrastructure requirements; penetration timelines remain uncertain.

# Chapter 5: Safety Analysis

## 5.1 Crash Data and Analysis

Crash reports (MV-104 equivalents), geocoded locations, severity (fatal, injury, property damage). Crash rate \( = \) crashes per million vehicle-miles / entries. Network screening identifies sites with excess crashes relative to predicted; empirical Bayes adjusts for regression-to-mean.

## 5.2 Highway Safety Manual Framework

HSM (AASHTO, 2010) provides:

- Safety Performance Functions (SPFs): predict crash frequency as function of AADT and geometry.
- Crash Modification Factors (CMFs): ratio of expected crashes with treatment to without.
- Economic analysis: crash costs (fatal ~$11 million US, injury $600k, PDO $10k) against treatment cost.

## 5.3 Countermeasures

Proven engineering treatments: centerline and shoulder rumble strips, skid-resistant surfaces, improved delineation, roundabouts, median barriers, protected-only left turns, pedestrian refuge islands, leading pedestrian intervals. Systemic approach targets treatment locations by risk rather than only high-crash sites.

## 5.4 Vulnerable Road Users

Pedestrian and cyclist fatalities overrepresent all transport deaths. Safe system approach: reduce speeds (30-40 km/h in residential zones), separate modes where speeds exceed survivability thresholds, design for human error and tolerable consequences.

# Chapter 6: Economic Evaluation

## 6.1 Benefit Categories

Travel time savings, vehicle operating costs, safety (crash reduction), emissions (air quality, climate), noise, construction cost, maintenance. Values of time (VOT) derived from stated/revealed preference; typically $15-25/h for commuting in North America.

## 6.2 Cost-Benefit Metrics

Net present value:

\[ NPV = \sum_{t=0}^{T}\frac{B_t - C_t}{(1+r)^t}. \]

Benefit-cost ratio, internal rate of return, equivalent uniform annual benefit. Discount rate (3-7% typical public projects) dominates long-horizon outcomes; social discount rate lower than private reflects intergenerational equity.

## 6.3 Multi-Criteria Analysis

Non-monetizable attributes (equity, aesthetics, strategic) handled through scoring and weighted sums, or outranking methods (ELECTRE, PROMETHEE). Sensitivity to weights and rating uncertainties essential.

## 6.4 Life-Cycle and Externality Costing

Infrastructure life-cycle cost: capital + operations & maintenance + rehab + end-of-life. Internalize externalities through shadow pricing or explicit environmental and social accounts. LCCA (Life-Cycle Cost Analysis) standard in pavement type selection, bridge design, and asset management.

<div class="remark">
Traffic engineering rests on a few fundamental relations (flow, density, speed; demand-capacity; signal timing) applied consistently across facility types. Modern practice extends into ITS, safety analytics, and economic evaluation&mdash;each adding data and methods, but always answering the recurring question: with limited resources, which intervention yields the most benefit for the most people?
</div>
