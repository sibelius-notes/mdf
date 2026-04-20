---
title: "CIVE 241: Transport Principles and Applications"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Meyer, M.D. and Miller, E.J., *Urban Transportation Planning*, 3rd ed., McGraw-Hill, 2013; Garber, N.J. and Hoel, L.A., *Traffic and Highway Engineering*, 5th ed., Cengage, 2015.

**Supplementary texts** — Ortúzar, J. de D. and Willumsen, L.G., *Modelling Transport*, 4th ed., Wiley, 2011; Vuchic, V.R., *Urban Transit Systems and Technology*, Wiley, 2007.

**Online resources** — MIT OCW 1.201J "Transportation Systems Analysis"; Transport Canada public reports; US DOT Federal Highway Administration open guides; World Bank transport sector publications; TRB Highway Capacity Manual public summaries.

---

# Chapter 1: Transportation Systems and Planning

## 1.1 The Role of Transportation

Transportation moves people and goods and is a foundational infrastructure of modern economies. Travel is mostly derived demand: people travel to reach destinations, not for its own sake (with exceptions). Understanding demand requires modeling activities that generate travel.

## 1.2 Modes and Their Characteristics

- **Auto**: door-to-door, flexible, high cost per passenger-km in capital + energy + externalities.
- **Transit**: bus, light rail, metro, commuter rail, BRT. Efficient at high passenger densities; requires ridership threshold to justify capital.
- **Active**: walking, cycling; healthy, low-carbon, distance- and weather-limited.
- **Intercity rail**: efficient corridor travel 300-800 km.
- **Air**: fast long-distance; high energy per passenger-km but efficient per traveler-hour.
- **Freight**: truck, rail, ship, pipeline, air. Each has a niche of distance × cargo type.

## 1.3 Planning Process

1. Goals and objectives (accessibility, safety, environment).
2. Data collection (travel surveys, counts, land use).
3. Demand forecasting.
4. Alternatives analysis.
5. Evaluation (benefit-cost, multi-criteria).
6. Implementation.
7. Monitoring and feedback.

Public involvement, environmental assessment, and financial analysis run throughout.

## 1.4 Sustainability in Transport

Energy and GHG from transport ~25% of national totals in developed countries; Canada similar. Interventions: mode shift (to transit, active), electrification, operational efficiency, land use changes. Long lifecycles of infrastructure (roads, rail) lock in demand patterns for decades—sustainability decisions compound over time.

# Chapter 2: Demand Estimation

## 2.1 Four-Step Model

The classical sequential demand model:

1. **Trip generation**: number of trips produced / attracted by each zone (regression on demographic, land-use variables; ITE trip generation rates).
2. **Trip distribution**: where do trips go? Gravity model: \( T_{ij} = P_i A_j f(c_{ij})/\sum_k A_k f(c_{ik}) \).
3. **Mode choice**: logit model: \( P_m = e^{V_m}/\sum_k e^{V_k} \), \( V_m = \) utility of mode \( m \).
4. **Route assignment**: network loading via user equilibrium (Wardrop's first principle: no user can reduce travel time by unilaterally changing routes).

## 2.2 Discrete Choice Modeling

Logit, probit, nested logit, and mixed logit models capture choices from finite alternatives. Estimated by maximum likelihood on revealed (actual choices) or stated (survey) preferences. Value of travel time savings emerges from the ratio of time coefficient to cost coefficient.

## 2.3 Activity-Based Models

Newer generation models explicitly represent daily activity schedules (home, work, shop, leisure) and derived travel. Advantages: consistency across time-of-day, chained trips, household-level decisions. Computational and data demands are higher; adoption growing in large metropolitan area models.

## 2.4 Freight Demand

Freight demand depends on industry structure, trade patterns, logistics choices. Commodity flow surveys, origin-destination studies, and supply-chain modeling provide inputs. Trends (e-commerce, just-in-time, reshoring) reshape freight demand over years.

# Chapter 3: Road and Highway Fundamentals

## 3.1 Traffic Flow Relations

Fundamental diagram:

\[ q = k \cdot v, \]

with flow \( q \) [veh/h], density \( k \) [veh/km], space-mean speed \( v \) [km/h]. Free flow (low density, \( v \) near free-flow speed), congested (beyond critical density, flow decreases). Capacity is the maximum \( q \); capacity drop after breakdown is a well-documented phenomenon.

## 3.2 Level of Service

HCM (Highway Capacity Manual) defines LOS A-F by volume/capacity ratio, density, or delay. Design typically targets LOS C or D; LOS F represents breakdown with stop-and-go conditions.

## 3.3 Geometric Design

Horizontal curves (minimum radius for superelevation and friction), vertical curves (stopping sight distance), cross-section (lane width, shoulder, median), intersections (signalized, roundabout, stop control). AASHTO (US) and TAC (Canadian) guides codify practice.

## 3.4 Pavement

Flexible (asphalt) vs. rigid (concrete). Pavement design (AASHTO, Mechanistic-Empirical Pavement Design Guide): traffic loading (ESALs), subgrade strength, climate, materials. Pavement management: condition monitoring, deterioration models, rehabilitation timing.

# Chapter 4: Transit

## 4.1 Transit Modes

- **Bus**: flexible routing, moderate capacity (60-80 per bus, 1000-3000 per hour per lane).
- **Bus Rapid Transit (BRT)**: dedicated lanes, pre-boarding fare collection, level boarding; 15 000+ pphpd achievable.
- **Light rail (LRT)**: electric, often surface with some grade separation; 10 000-20 000 pphpd.
- **Metro (heavy rail)**: fully grade-separated; 30 000-60 000 pphpd.
- **Commuter rail**: longer-distance, peak-focused.

## 4.2 Network Design

Radial (lines converging on CBD) vs. grid vs. hub-and-spoke. Service frequency, span (hours), coverage, and transfers all influence ridership. Mode + network choice match demand density: buses for dispersed or low-density; rail for concentrated corridors.

## 4.3 Operations and Economics

Fare policy (flat, zone, distance), operating cost per passenger-km, subsidy ratio (farebox recovery), equity considerations. Boarding, alighting, dwell time at stops affect overall speed and capacity. Bunching—buses clumping together after delays—is a characteristic operational challenge.

## 4.4 Emerging Mobility

Ride-hailing, on-demand microtransit, shared bikes/scooters, mobility as a service (MaaS) platforms. Potentially complementary to transit; potentially competitive, adding VKT and congestion. Regulatory frameworks adapting; long-term impacts on mode share still emerging.

# Chapter 5: Active Transportation and Intercity

## 5.1 Walking

Walking is the universal mode, yet often underdesigned. Sidewalk width (1.5-2 m minimum, wider in commercial areas), curb cuts, intersection treatments, shade, lighting, surface condition. Level-of-service concepts for pedestrians exist but adoption uneven. Safety: elderly and children are disproportionately injured.

## 5.2 Cycling

Infrastructure hierarchy: shared lane (minimal), painted bike lane (moderate), protected bike lane (high), off-street path (recreational and commuter). Network connectivity and intersection treatment drive ridership more than isolated miles. Dutch, Danish, and increasingly North American cities demonstrate that protected networks yield order-of-magnitude ridership gains.

## 5.3 Rail

High-speed rail competes effectively with air on 300-800 km corridors; energy per passenger-km is a small fraction of air or auto. Conventional rail (110-160 km/h) serves intermediate markets. Rail freight dominates bulk commodities (grain, coal, containers from ports); intermodal (rail + truck) handles containers.

## 5.4 Air and Water

Aviation: energy-intensive (~3-4× more carbon per p-km than auto for similar distances). Airports: capacity constrained at major hubs; noise, land-use, and emissions issues. Marine: highly efficient for bulk cargo; coastal and Great Lakes shipping still viable domestically.

# Chapter 6: Economics and Impact

## 6.1 Transport Economics

Consumer surplus, producer surplus, external costs. Fixed vs. variable costs. Marginal cost pricing (congestion charge) internalizes externalities. Demand elasticity: auto trips fairly inelastic short-run, more elastic long-run (as vehicle stock, land use, and work locations adjust).

## 6.2 Cost-Benefit Analysis

Project evaluation: travel time savings, vehicle operating costs, safety, emissions, construction and maintenance costs, discount rate. Benefit-cost ratio, net present value. Sensitivity analysis on key assumptions (traffic growth, unit costs, discount rate).

## 6.3 Environmental Impact

Vehicle emissions per km × VKT = total emissions. Cradle-to-grave LCA includes manufacturing and infrastructure. Noise: road, rail, air, each with distinct spectra and receptor impacts. Land use: transport infrastructure consumes 20-25% of urban land. Habitat fragmentation (roads splitting wildlife corridors) is significant.

## 6.4 Equity and Access

Access (the ease of reaching opportunities) distinguishes from mobility (the ability to travel). Car-dependent communities exclude those without autos—low-income, young, elderly, disabled. Transit-poor areas within cities concentrate disadvantage. Gender, race, and class all map onto transport outcomes.

<div class="remark">
Transportation engineering integrates physical infrastructure design with social, economic, and environmental considerations. Demand estimation, network analysis, and project evaluation are quantitative; but the choice of <em>what</em> to build&mdash;and for whom&mdash;remains a value-laden public decision the engineer supports with analysis rather than determines.
</div>
