---
title: "CIVE 440: Transit Planning and Operations"
prof: "Jeff Casello"
subjects: "CIVE"
---

## Sources and References

- Vuchic, V. R. *Urban Transit Systems and Technology*. Wiley, 2007.
- Vuchic, V. R. *Urban Transit: Operations, Planning and Economics*. Wiley, 2005.
- Ceder, A. *Public Transit Planning and Operation: Modeling, Practice and Behaviour*. 2nd ed., CRC Press.
- Transportation Research Board. *Transit Capacity and Quality of Service Manual* (TCQSM), 3rd ed., TCRP Report 165.
- TCRP Synthesis and Research Reports on bus operations, rail transit capacity, and fare policy.
- MIT 1.258J / 1.259J Public Transportation Service and Operations Planning lecture materials.
- UC Berkeley CE 259 Public Transportation Systems materials.
- TU Delft CIE4811 and related transit courses on network design and operations.
- Institute of Transportation Engineers, *Trip Generation Handbook* and related mode-choice references.

# Chapter 1: Transit in the Evolution of Cities

Urban form and transit technology have co-evolved over two centuries. The walking-scale city of the pre-industrial period rarely exceeded a radius of two to three kilometres because all trips were pedestrian. The introduction of the horse-drawn omnibus, then the horse tramway, then the cable car, steam commuter rail, and eventually electric streetcar, successively expanded the feasible commute and allowed cities to restructure around radial corridors. The electric streetcar city of the late nineteenth century produced the characteristic star-shaped settlement pattern still visible in Toronto, Melbourne, and much of Central Europe. Rapid transit—first underground in London, then elevated and tunnel systems in Paris, Berlin, New York, and Boston—raised the attainable commercial density of the core to levels no surface mode could support. The private automobile inverted the relationship from the 1920s onward, dispersing residence and employment and forcing transit into a secondary role in most North American regions. Contemporary transit planning therefore begins with an explicit recognition that a mode is not neutral: the capacity, speed, reliability, and right-of-way of the service chosen constrain which land uses become viable along its corridor.

Vuchic organises modes by three attributes: right-of-way category (ROW), technology, and type of service. Right-of-way category C denotes operation in mixed traffic, B denotes a longitudinally separated but not grade-separated way, and A denotes fully controlled, grade-separated operation. Travel speed, reliability, capacity, and capital cost rise with ROW category, while flexibility falls. This taxonomy is foundational because performance claims about "bus" or "rail" are nearly meaningless without reference to the right-of-way in which the vehicle operates: a bus on category A infrastructure (a true busway) outperforms a streetcar on category C, and a light rail line on category B can match a metro's line speed where stop spacing and signal priority are appropriate.

# Chapter 2: Transit Modes and Their Characteristics

A systematic comparison of modes rests on five families of attributes: vehicle characteristics (capacity, dimensions, propulsion), way characteristics (alignment, grade, geometry, traffic interaction), station characteristics (spacing, platform length, fare-paid area), operating characteristics (headway, speed, reliability, dwell), and system characteristics (network size, fleet, labour).

Conventional bus service, operating on category C right-of-way, offers the lowest capital cost, the greatest network flexibility, and the lowest line capacity—typically in the range of 1,500 to 3,000 passengers per hour per direction at conventional headways. Bus Rapid Transit raises this ceiling substantially by combining category B or A running ways, stations with off-vehicle fare collection, level boarding, and transit signal priority, and in high-end implementations can exceed 10,000 passengers per hour per direction. Light Rail Transit exploits category B alignment, electric traction, and longer trains to offer intermediate capacity—nominally 6,000 to 20,000 passengers per hour per direction—with line speeds between buses and metro. Heavy rail rapid transit, or metro, operates exclusively on category A infrastructure, frequently with automatic train control, and reaches line capacities of 30,000 to over 60,000 passengers per hour per direction on the busiest systems. Commuter rail differs in its long station spacing, peak-oriented service pattern, and frequent shared use of freight corridors. Specialised and automated modes—people movers, monorails, funiculars, aerial trams, group rapid transit—fill niches where terrain, passenger volume, or urban design rule out conventional modes.

Paratransit, understood broadly, refers to services between fixed-route conventional transit and the private car: shared taxis, dial-a-ride, demand-responsive microtransit, and jitneys. These modes trade line-haul efficiency for coverage flexibility and are central both to accessibility obligations in developed systems and to primary mobility provision in many developing cities.

# Chapter 3: Transit Vehicle Dynamics

Quantitative transit analysis begins with the motion of a single vehicle between stops. The governing equation of motion is

\[
m_e \frac{dv}{dt} = F_t - R(v) - m g \sin\theta
\]

where \(m_e\) is the effective mass (including rotational inertia of wheels and motors), \(F_t\) is the tractive effort, \(R(v)\) is the rolling and aerodynamic resistance, and \(\theta\) is the grade. Resistance is conventionally modelled with the Davis-type expression

\[
R(v) = A + B v + C v^2
\]

with \(A\), \(B\), and \(C\) calibrated to each vehicle family. The tractive effort curve is bounded by adhesion at low speed and by installed power at high speed, so that maximum acceleration is effectively constant up to a base speed \(v_b\) and then falls roughly as \(P/v\) thereafter. Braking obeys a similar envelope, constrained by passenger comfort rather than by physical friction; typical comfort limits are 1.0 to 1.3 m/s\(^2\) in service braking, rising to 1.5 m/s\(^2\) or more in emergency conditions.

Station-to-station travel time is computed by integrating the motion profile over four regimes: acceleration from rest to cruise, cruising at line speed, coasting, and braking to stop. When the interstation distance is short, cruise is never reached and the profile collapses to a triangular acceleration-braking curve. The terminal-to-terminal running time is then the sum of all interstation segments plus total dwell time at intermediate stops.

# Chapter 4: Scheduling, Headways, and Fleet Size

A service plan translates demand into a schedule. Let \(P\) denote the maximum load point passenger volume in the peak hour and let \(C_v\) denote the design capacity per vehicle. A common policy headway expression is

\[
h = \min\left(h_{\max},\; \frac{60\, C_v\, \alpha}{P}\right)
\]

where \(h\) is in minutes per vehicle, \(\alpha\) is a target load factor (for example 0.85 to avoid pass-ups), and \(h_{\max}\) is a policy maximum headway imposed for service quality. The cycle time \(T_c\) required for a single vehicle to complete a round trip, including recovery time at both terminals, is

\[
T_c = T_{out} + T_{back} + T_{rec,1} + T_{rec,2}
\]

and the fleet size needed to maintain headway \(h\) on the line is

\[
N = \left\lceil \frac{T_c}{h} \right\rceil.
\]

Ceder emphasises that scheduling is a hierarchical problem: network design produces routes, timetable development sets trip departure times (often via even-headway, even-load, or hybrid methods), vehicle scheduling assigns trips to blocks, and crew scheduling assigns blocks to drivers subject to labour constraints. Each stage can be solved as an optimisation problem—vehicle scheduling, for example, reduces to a minimum-cost flow on a trip-connection graph.

Time–space diagrams are the central graphical tool for schedule construction. Each vehicle is shown as a trajectory in the distance–time plane; parallel trajectories indicate uniform headway, and the slope represents speed. The diagram reveals opportunities for meets, passes, and coordinated transfers, and it makes layover requirements and bunching risks visually evident.

# Chapter 5: Station, Way, and Line Capacity

Line capacity is almost always limited at the most heavily used station rather than in the running way. The minimum headway between successive trains or buses at a stop is

\[
h_{\min} = t_d + t_c + t_{op}
\]

where \(t_d\) is the dwell time, \(t_c\) is the clearance time governed by braking distance and safe separation, and \(t_{op}\) is an operating margin that absorbs stochastic variation. Dwell time itself is a function of passenger flow, door configuration, fare payment method, and wheelchair accessibility operations; linear regressions of the form \(t_d = a + b n_b + c n_a\), with \(n_b\) and \(n_a\) boarding and alighting counts per busiest door, are standard in the TCQSM.

For rail systems, the minimum safe headway depends on the signalling regime. Under a fixed-block three-aspect system the controlling distance is the safe braking distance plus a full block, while moving-block or communications-based train control can compress headway to approximately

\[
h_{\min} \approx \frac{L_t + v T_r + v^2/(2b)}{v} + t_d + t_{op}
\]

where \(L_t\) is train length, \(T_r\) is reaction and response time, and \(b\) is the service braking rate. Line capacity in passengers per hour is then the product of the reciprocal headway, the train length in cars, and the per-car passenger capacity at the chosen load standard.

Bus facilities follow analogous logic, with the TCQSM distinguishing loading area capacity, berth capacity (a function of berth configuration and failure rate), and facility capacity in vehicles and passengers per hour.

# Chapter 6: Transit Network Planning

Network design translates demand, geography, and policy objectives into a set of lines. Vuchic distinguishes radial, grid, trunk-and-feeder, and hybrid networks, each with characteristic advantages. Radial networks minimise travel time to a dominant centre but force transfers for cross-town trips. Grid networks provide uniform coverage and support two-transfer any-to-any travel, but they only work when density is broadly distributed. Trunk-and-feeder concentrates line-haul investment in a few high-capacity corridors fed by local routes, exploiting scale economies on the trunk at the cost of a mandatory transfer.

Timed-transfer networks force all routes meeting at a hub to arrive and depart within a common pulse, guaranteeing short transfer penalties at the cost of tight schedule discipline. The pulse interval typically equals the longest line's policy headway. This architecture is widely used in mid-sized Canadian, European, and Australian cities where demand cannot justify high-frequency service on every route.

Network evaluation uses both operator metrics (revenue vehicle kilometres, cost per passenger, load factor, commercial speed) and user metrics (coverage within walking distance, average travel time, number of transfers, reliability). The ITE and TCRP literatures present standard formulations, and the TCQSM organises user-side metrics under the Quality of Service framework discussed below.

# Chapter 7: Ridership Demand Estimation

Transit ridership forecasting operates at multiple scales. Sketch-planning methods estimate line-level ridership from station-area population, employment, and built-environment variables; direct-demand or "transit sketch" models calibrate elasticities of boardings with respect to service frequency, travel time, and fare. GIS-based buffer methods overlay the corridor's walk shed on population and employment grids and apply empirically calibrated capture rates.

At the regional scale, the four-step model—trip generation, distribution, mode choice, and assignment—remains the standard planning framework, with mode choice typically specified as a multinomial or nested logit utility function of in-vehicle time, out-of-vehicle time, fare, access time, and demographic attributes. A utility specification of the form

\[
U_{transit} = \beta_1 t_{iv} + \beta_2 t_{ov} + \beta_3 f + \beta_4 \text{income}^{-1} + \cdots
\]

yields choice probabilities

\[
P_k = \frac{e^{U_k}}{\sum_j e^{U_j}}
\]

under the logit assumption. Activity-based and agent-based models refine this by simulating individual tours, capturing household interactions, and representing time-of-day and scheduling decisions that aggregate models cannot. Behavioural research on mode choice highlights the importance of perceived reliability, transfer penalties, and crowding, each of which enters contemporary utility specifications as a coefficient-weighted penalty beyond pure clock time.

# Chapter 8: Performance and Quality of Service

The TCQSM organises transit performance into two parallel hierarchies. The service measures address the passenger's perspective: availability (service coverage, hours of service, frequency) and quality (passenger loads, reliability, travel time). The capacity measures address the operator's perspective: the vehicle and person capacity that infrastructure and operating practices can deliver. Both are graded on an A-to-F letter scale to permit succinct communication with the public and with decision-makers.

Frequency Level of Service, for instance, is a direct function of policy headway, with LOS A corresponding to headways of ten minutes or less and LOS F to headways greater than sixty minutes. Passenger load LOS depends on the ratio of passengers to seats, crossing from seated comfort through standing room into crush load. Reliability LOS captures on-time performance, headway adherence, or missed trips, depending on whether the service is schedule-based or frequency-based. These measures feed directly into service standards—explicit, quantitative thresholds that an agency commits to maintain, often as part of its strategic plan or Title VI equity analysis.

# Chapter 9: Operations, Control, and Technology

Once designed, transit service must be operated reliably. Control strategies address the natural instability of bus lines, in which a delayed vehicle attracts more passengers, incurs longer dwells, falls further behind, and eventually "bunches" with its follower. Control tools include holding at time points, stop-skipping, short-turning, expressing, and—on newer systems—active headway management using real-time automatic vehicle location data. The mathematical theory of bus bunching, studied since Newell and Potts, shows that without intervention headway variance grows downstream from any disturbance.

Technology applications to operations are now pervasive. Automatic vehicle location provides the real-time position and schedule adherence data that underpin both dispatcher control and passenger information systems. Automatic passenger counters, deployed on a sample of the fleet, yield load profiles for service planning. General Transit Feed Specification data—static and real-time—have standardised the publication of schedules and vehicle positions, enabling third-party trip planners and rigorous reliability analysis. Electronic fare collection, contactless media, and account-based back-office systems reduce dwell, support distance-based and time-based fare structures, and generate rich origin-destination data for planning. Transit signal priority, queue jump lanes, and dedicated bus lanes exploit intelligent transportation systems to recover speed and reliability in mixed traffic.

Safety, security, maintenance, and accessibility operations round out agency responsibilities. Full accessibility demands level boarding, adequate manoeuvring room, audio and visual information, and paratransit service to complement the fixed-route system for trips it cannot serve.

# Chapter 10: Transit Economics, Ownership, Fares, and Finance

Transit is almost universally provided under public ownership or close regulation because unregulated markets fail to capture the external benefits—reduced congestion, emissions, accidents, and equitable access—that justify service at densities and fares below commercial break-even. The historical trajectory runs from private unregulated operation through municipal ownership and subsidy, brief waves of contracted competition and deregulation, and a contemporary pattern in which network planning and revenue risk typically rest with a public authority while operation may be contracted. Developing-country systems frequently combine public trunk services with informal paratransit.

Transit cost structure is dominated by labour and vehicle costs that scale with vehicle-hours and vehicle-kilometres, with fixed facility costs amortised separately. A linear cost model,

\[
C_{total} = c_h\, VH + c_k\, VK + c_p\, N_p + C_{fixed}
\]

where \(VH\) is vehicle-hours, \(VK\) is vehicle-kilometres, and \(N_p\) is peak vehicles, supports marginal cost analysis for service changes.

Fare structures include flat, zonal, distance-based, and time-based options. Objectives include revenue generation, equity, simplicity, modal integration, and demand management. The aggregate elasticity of transit ridership with respect to fare, consolidated across many studies in the Simpson-Curtin rule and subsequent meta-analyses, is approximately \(-0.3\) in the short run—inelastic, so that fare increases raise revenue but reduce patronage. Elasticities are larger for off-peak riders, for discretionary trips, and in the long run. Finance draws on farebox revenue, dedicated taxes (sales, property, fuel, payroll), general government contributions, advertising and ancillary revenue, and capital grants, with the specific mix varying widely across jurisdictions.

# Chapter 11: Contemporary Trends

Automated and connected vehicle technology reshapes transit on several fronts. Automatic train control is mature on rail. Automated bus operations remain at pilot scale, but driverless shuttles and automated guideway systems are deployed in constrained environments. Ride-hailing and microtransit services compete with and complement conventional transit; empirical evidence suggests they substitute for short urban transit trips while serving first- and last-mile gaps in suburban contexts. Mobility-as-a-Service platforms aim to integrate planning, booking, and payment across modes. Electrification—battery-electric buses, zero-emission fleet mandates, overhead and wayside charging—alters vehicle economics, facility design, and energy planning. Climate policy and equity commitments increasingly frame funding decisions, reinforcing transit's role beyond congestion relief. The planner's task in each case is to translate these emerging options into quantified performance, cost, and equity outcomes using the analytical tools developed through the rest of the course.
