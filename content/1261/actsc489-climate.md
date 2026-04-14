---
title: "ACTSC 489: Climate Risk Management"
prof: "Fan Yang"
subjects: "ACTSC"
---

## Sources and References

The synthesis below draws on the standard literature in climate risk and actuarial science rather than on any single textbook. Foundational references include Mills, *Insurance in a Climate of Change* (AAAS, 2005), Charpentier's *Computational Actuarial Science with R* (CRC Press, 2014, especially the extreme value chapter), Coles' *An Introduction to Statistical Modeling of Extreme Values* (Springer, 2001), and Embrechts, Klüppelberg, and Mikosch, *Modelling Extremal Events for Insurance and Finance* (Springer, 1997). Industry and regulator publications consulted include the TCFD *Recommendations of the Task Force on Climate-related Financial Disclosures* (2017), the NGFS *Climate Scenarios for Central Banks and Supervisors* (2024 vintage), the IPCC *Sixth Assessment Report* (Working Groups I and II, 2021–2022), the CAS *Climate Risk Disclosure Survey*, and SOA, *Climate Risk: A Practical Guide for Actuaries*. Online data resources include the Copernicus Climate Change Service ERA5 reanalysis, CMIP6 model output via ESGF, NOAA National Centers for Environmental Information, the EM-DAT International Disaster Database, and Munich Re's NatCatSERVICE.

# Chapter 1: Foundations of Climate Risk

Climate risk has moved from an environmental concern to a central topic in financial risk management because the same physical processes that warm the atmosphere also reshape the loss distributions on which insurers, pension funds, and banks depend. To organize the discussion, the financial sector has converged on a three-part taxonomy. *Physical risk* captures losses caused by the climate itself — acute events such as hurricanes and wildfires, and chronic shifts such as sea-level rise and changing precipitation regimes. *Transition risk* refers to losses caused by the policy, technology, and market changes required to decarbonize, including stranded fossil-fuel assets, carbon pricing, and shifting consumer preferences. *Liability risk* arises when affected parties seek compensation through litigation, typically targeting carbon-intensive corporations or their directors and officers.

## Greenhouse Gas Forcing and Observed Warming

The physical driver behind climate change is well understood. Incoming shortwave radiation from the sun is partly reflected and partly absorbed by Earth's surface, which then re-emits energy as longwave infrared radiation. Greenhouse gases — chiefly carbon dioxide, methane, nitrous oxide, and water vapor — absorb a portion of that outgoing radiation and re-emit it in all directions, raising the equilibrium surface temperature. The radiative forcing from a doubling of atmospheric carbon dioxide is roughly 3.7 watts per square meter, and equilibrium climate sensitivity, the long-run warming response, is most likely between 2.5 and 4 degrees Celsius. Since the late nineteenth century the global mean surface temperature has risen by approximately 1.2 degrees Celsius, with the warming concentrated in the past five decades.

<div class="definition">
<strong>Physical climate risk.</strong> The risk of financial loss arising from changes in the physical climate system, including <em>acute</em> hazards (tropical cyclones, floods, wildfires, severe convective storms, hailstorms, heatwaves) and <em>chronic</em> hazards (sea-level rise, glacial retreat, ocean acidification, shifting precipitation patterns).
</div>

## Hazards That Drive Insurance Losses

Tropical cyclones combine wind, storm surge, and rainfall and are the single largest source of catastrophe losses in the North Atlantic basin. Wildfire losses in the western United States and Australia have grown faster than property values, reflecting both increased ignition risk and the extension of the wildland-urban interface. Inland flooding affects nearly every region but is often poorly insured. Severe convective storms — tornadoes, hail, and damaging straight-line winds — produce frequent, moderately sized losses that aggregate to substantial annual totals. Heatwaves drive mortality, agricultural failures, and stress on power infrastructure. Each hazard interacts with vulnerability and exposure in different ways, which is why a unified treatment of climate risk requires hazard-specific modeling.

<div class="example">
<strong>Channels into the balance sheet.</strong> Consider a primary property insurer with 50,000 coastal homeowner policies in Florida. A single major hurricane can transmit climate risk through three channels simultaneously. First, gross losses on the underwriting book rise as wind and surge claims are paid out, possibly by 800 million dollars in a single landfall. Second, the insurer's reinsurance recoveries depend on how the event compares with treaty attachment points, transferring credit and timing risk to the reinsurer. Third, the value of the insurer's invested assets — particularly municipal bonds tied to the affected region — may decline as ratings agencies reassess local fiscal capacity. A pension fund holding similar regional bonds and exposed to long-dated mortality improvements would feel related, though distinct, channels of impact.
</div>

# Chapter 2: Climate Data and Hazard Inventories

Modeling climate risk begins with data. Unlike traditional actuarial work, where exposure and loss histories sit inside the company, climate analysis depends heavily on external scientific data assembled by national agencies, intergovernmental bodies, and reinsurers.

## Observational and Reanalysis Products

Station observations provide long, locally accurate records of temperature, precipitation, and wind, but coverage is uneven and station histories include moves, instrument changes, and urbanization effects. Satellite observations, available since the late 1970s, offer global coverage of variables such as sea-surface temperature, soil moisture, sea ice extent, and atmospheric humidity. Reanalysis products such as ERA5, produced by the European Centre for Medium-Range Weather Forecasts, blend observations with a numerical weather model to generate a physically consistent gridded record of the atmosphere from 1940 to the present. Reanalysis is the workhorse of climate risk analytics because it provides the same variables on the same grid for every location and date.

## Climate Projections

Forward-looking analysis relies on coupled atmosphere-ocean general circulation models. The current vintage, CMIP6, comprises dozens of models run by research centers worldwide, each forced by Shared Socioeconomic Pathways that combine emissions, land use, and demographic assumptions. The pathway labels SSP1-2.6, SSP2-4.5, SSP3-7.0, and SSP5-8.5 correspond to roughly 1.8, 2.7, 3.6, and 4.4 degrees Celsius of warming by 2100. Projections are coarse, typically on grids of 100 to 200 kilometers, so they must be downscaled — either statistically against historical observations or dynamically with a regional climate model — before they can drive a property-level risk calculation.

## Loss and Exposure Databases

Loss histories come from several specialized sources. EM-DAT, maintained by the Centre for Research on the Epidemiology of Disasters, records all global disasters meeting threshold criteria. Munich Re's NatCatSERVICE and Swiss Re's sigma database are commercial collections widely used in industry. NOAA's billion-dollar disaster list tracks U.S. events. Exposure databases come from national property registries, satellite-derived building footprints, and insurance bureaus.

<div class="definition">
<strong>Stationarity.</strong> A time series is <em>stationary</em> if its joint distribution does not change under shifts in time. Classical actuarial loss models implicitly assume stationarity. Climate change violates this assumption, which is why historical loss frequencies must be adjusted before being used to price forward-looking risk.
</div>

# Chapter 3: Catastrophe Modeling

Catastrophe models translate the science of climate hazards into the language of insurance loss distributions. Since the late 1980s, the industry has converged on a four-module architecture, made famous by vendor firms such as RMS, AIR/Verisk, and KCC.

## The Four Modules

The *hazard* module simulates a stochastic event set — typically tens of thousands of synthetic storms, earthquakes, or floods — calibrated to match the historical rate, spatial distribution, and physical character of real events. Each event in the set is associated with a footprint, a grid of physical intensities at every relevant location.

The *exposure* module describes what is at risk: the number, location, replacement value, occupancy class, and structural characteristics of every insured building or piece of infrastructure. Exposure data quality is one of the largest sources of uncertainty in real catastrophe pricing.

The *vulnerability* module connects intensity to damage through a set of damage functions. For wind, this is typically a curve giving mean damage ratio as a function of three-second peak gust speed, with an envelope of uncertainty around the mean. Schematically,

\[
D = f(\text{intensity}; \text{construction, occupancy, age, code})
\]

where \(D \in [0, 1]\) is the ratio of damage to replacement cost.

The *financial* module applies policy conditions — deductibles, sublimits, coinsurance — and reinsurance treaty terms to convert ground-up losses into insured and ceded losses.

## Outputs

The model produces a distribution of annual losses by simulation. The most important summary statistics are the Average Annual Loss (AAL), the Occurrence Exceedance Probability (OEP) curve, the Aggregate Exceedance Probability (AEP) curve, and the Probable Maximum Loss (PML). The AAL is simply the expected annual loss,

\[
\mathrm{AAL} = \mathbb{E}[L] = \int_0^\infty L\,dF(L),
\]

and feeds into the pure premium for a given peril. The OEP at probability \(p\) is the loss \(L^{OEP}_p\) such that the probability of any single event in a year exceeding \(L^{OEP}_p\) equals \(p\). The AEP applies the same exceedance idea to annual aggregate loss.

<div class="example">
<strong>Reading an EP curve.</strong> Suppose a catastrophe model run on a coastal homeowner book produces an AAL of 12 million dollars, an AEP at the 1-in-100 year point of 180 million dollars, and an OEP at the same return period of 150 million dollars. The pricing actuary would use the AAL to set the technical pure premium, would compare the 1-in-100 AEP to the company's catastrophe reinsurance limit to test capital adequacy, and would use the gap between AEP and OEP to judge how much of the tail comes from clustering of multiple events in a single year.
</div>

## Conditioning the Model on Climate Change

Stock catastrophe models are calibrated to a historical climate. Forward-looking pricing requires that the hazard module be re-run with a perturbed climate state. For tropical cyclones, this typically means adjusting sea-surface temperature, atmospheric humidity, and vertical wind shear in a downscaled climate ensemble, then re-running the synthetic storm set. The resulting *climate-conditioned* event set produces revised AALs and EP curves that vendors increasingly publish alongside the baseline view.

# Chapter 4: Statistical Modeling of Extremes

Catastrophe models are physically detailed but not always available, and even when they are, statistical extreme value theory provides an indispensable independent check. The reason is intuitive: climate-driven losses live in the tail of the distribution, where direct empirical data are scarce, and only extreme value theory (EVT) tells us how to extrapolate beyond the range of observation in a way grounded in probability theory.

## Block Maxima and the GEV

Let \(X_1, X_2, \ldots, X_n\) be independent and identically distributed random variables and let \(M_n = \max(X_1, \ldots, X_n)\) be the block maximum. Under mild regularity conditions, the Fisher–Tippett–Gnedenko theorem says that if there exist normalizing sequences \(a_n > 0\) and \(b_n\) such that \((M_n - b_n) / a_n\) converges in distribution to a non-degenerate limit, that limit must be a Generalized Extreme Value (GEV) distribution. The GEV cumulative distribution function is

\[
G(x) = \exp\!\Bigl\{-\bigl[1 + \xi\,(x - \mu)/\sigma\bigr]^{-1/\xi}\Bigr\}
\]

defined for \(1 + \xi(x - \mu)/\sigma > 0\), where \(\mu \in \mathbb{R}\) is a location parameter, \(\sigma > 0\) is a scale parameter, and \(\xi \in \mathbb{R}\) is the shape parameter. The shape determines the family: \(\xi = 0\) (taken as a limit) gives the light-tailed Gumbel, \(\xi > 0\) gives the heavy-tailed Fréchet, and \(\xi < 0\) gives the bounded Weibull.

<div class="theorem">
<strong>Fisher–Tippett–Gnedenko (extremal types theorem).</strong> Let \(X_1, X_2, \ldots\) be independent and identically distributed random variables, and let \(M_n = \max(X_1, \ldots, X_n)\). If there exist constants \(a_n > 0\) and \(b_n \in \mathbb{R}\) such that

\[
\Pr\!\left(\frac{M_n - b_n}{a_n} \le x\right) \xrightarrow{d} G(x)
\]

for some non-degenerate distribution \(G\), then \(G\) belongs to the GEV family. The result is the extremal analogue of the central limit theorem and justifies fitting a GEV to block maxima of climate variables such as annual maximum daily rainfall or annual maximum wind speed.
</div>

## Peaks Over Threshold and the GPD

A complementary approach uses all observations exceeding a high threshold \(u\) rather than only block maxima. The Pickands–Balkema–de Haan theorem says that, under the same domain-of-attraction conditions, the conditional distribution of exceedances \(Y = X - u \mid X > u\) converges to a Generalized Pareto Distribution (GPD) as \(u\) grows large. The GPD survival function is

\[
\Pr(Y > y) = \bigl(1 + \xi\,y/\sigma\bigr)^{-1/\xi}, \quad y > 0,
\]

with the same shape parameter \(\xi\) as the corresponding GEV. The peaks-over-threshold (POT) approach is more data-efficient than block maxima because it uses every exceedance, not just one per year.

## Return Levels and Risk Measures

Insurance practice usually expresses tail risk in terms of return periods. The \(T\)-year return level \(x_T\) is defined by \(\Pr(X > x_T) = 1/T\). Inverting the GEV gives a closed-form expression,

\[
x_T = \mu + \frac{\sigma}{\xi}\bigl[(-\log(1 - 1/T))^{-\xi} - 1\bigr],
\]

valid for \(\xi \neq 0\). For \(\xi = 0\) the corresponding Gumbel limit is \(x_T = \mu - \sigma \log(-\log(1 - 1/T))\). Climate change is incorporated by letting one or more parameters depend on a covariate. A common specification is non-stationary location with a linear time trend,

\[
\mu(t) = \mu_0 + \mu_1 t,
\]

which can also be replaced by physically motivated covariates such as the global mean surface temperature, an El Niño index, or carbon dioxide concentration. Risk measures such as Value-at-Risk and Tail Value-at-Risk follow naturally. With \(L\) the annual loss,

\[
\mathrm{TVaR}_\alpha(L) = \frac{1}{1 - \alpha}\int_\alpha^1 \mathrm{VaR}_u(L)\,du,
\]

which equals the conditional mean \(\mathbb{E}[L \mid L > \mathrm{VaR}_\alpha(L)]\) when the loss distribution is continuous.

<div class="example">
<strong>Non-stationary rainfall fit.</strong> Suppose annual maximum daily rainfall at a station is fitted with a GEV in which only the location parameter trends in time, \(\mu(t) = \mu_0 + \mu_1 t\), and the maximum likelihood estimates are \(\hat\mu_0 = 80\) millimeters, \(\hat\mu_1 = 0.4\) millimeters per year, \(\hat\sigma = 18\) millimeters, and \(\hat\xi = 0.15\). The 100-year return level computed for the climate of the year 2000 is approximately 220 millimeters, while the same calculation for the year 2050 gives 240 millimeters — a 9 percent increase in the design rainfall, with corresponding implications for stormwater capacity and flood insurance pricing.
</div>

# Chapter 5: Climate Risk Transfer and Capital

Once climate-conditioned losses have been quantified, the insurer must decide how much to retain, how much to cede through reinsurance, and how much capital to hold against the residual.

## Reinsurance under Climate Stress

The traditional reinsurance toolkit — quota share, surplus, excess of loss, and stop loss — remains the backbone of climate risk transfer. A quota share treaty cedes a fixed proportion of every premium and loss and is administratively simple. An excess-of-loss treaty pays only when an individual loss or aggregate exceeds a retention, and is the standard structure for catastrophe protection. A stop loss treaty caps the cedent's loss ratio and is more common in agriculture. Climate change matters because rising AALs, rising tail percentiles, and rising correlations across perils all push reinsurance pricing upward and shrink available capacity in the most exposed zones.

## Insurance-Linked Securities

Capital markets supplement the reinsurance market through Insurance-Linked Securities (ILS), of which catastrophe bonds are the best-known instrument. A cat bond is issued by a special-purpose vehicle that receives the principal from investors, invests it in a collateral account, and pays a floating coupon equal to a money-market rate plus a spread. If a defined trigger event occurs during the risk period — for example, a Florida hurricane causing industry losses above a threshold, or a parametric trigger such as central pressure below a threshold and landfall in a defined region — part or all of the principal is forgiven and used to indemnify the sponsoring insurer. Sidecars are quota share vehicles funded by external capital. Industry loss warranties are simpler derivative contracts that pay a fixed amount when industry-wide losses exceed an index level.

The expected loss on a cat bond, from the investor's point of view, is

\[
\mathrm{EL} = \frac{1}{F}\int p(L)\,L\,dL,
\]

where \(F\) is the face value and \(p(L)\) is the density of principal loss. The market spread is then quoted as a *multiple* of expected loss,

\[
\text{spread} = \mathrm{EL} \times \text{multiple},
\]

with multiples typically running between 2 and 4 in the primary cat bond market and varying with peril, attachment, and macro liquidity. A 4 percent expected loss bond at a multiple of three would carry a spread of about 12 percent over the money-market reference rate, reflecting both the tail risk and the illiquidity of the instrument.

<div class="example">
<strong>Layering a hurricane program.</strong> A mid-sized Florida primary insurer with a 1-in-250 OEP of 750 million dollars retains the first 100 million dollars, places a traditional excess-of-loss layer from 100 to 400 million dollars at a rate-on-line of 12 percent, and sponsors a 350 million dollar catastrophe bond covering the layer from 400 to 750 million dollars at a spread of 8 percent over the reference rate. The bond's expected loss is approximately 2.5 percent, giving a multiple of around 3.2, in line with broader market pricing for that attachment point.
</div>

## Capital under Solvency Regimes

Regulators require insurers to hold capital sufficient to absorb a one-year shock at a high confidence level. Under Solvency II in Europe, the natural catastrophe submodule of the standard formula calibrates each peril at the 99.5 percent VaR, equivalent to a 1-in-200 year aggregate loss. Canada's OSFI uses a similar internal target capital test, and the U.S. NAIC risk-based capital framework has a catastrophe component. Climate change enters these calculations by re-weighting the underlying severity distributions; firms using internal models can incorporate climate-conditioned event sets directly, while those using standard formulas rely on regulator updates to the calibration parameters.

# Chapter 6: Governance, Disclosure, and Strategic Planning

Climate risk management is not only a quantitative exercise — it is also a governance discipline. The actuary's modeling output must connect to board-level oversight, regulator-mandated disclosure, and forward-looking strategic decisions.

## TCFD and ISSB

The Task Force on Climate-related Financial Disclosures, convened by the Financial Stability Board in 2015, published its recommendations in 2017. The TCFD framework rests on four pillars: *governance* (how the board oversees climate risk), *strategy* (what the actual and potential impacts of climate risk are on the business), *risk management* (how climate risks are identified, assessed, and managed), and *metrics and targets* (what indicators are used to track progress). In 2023 the International Sustainability Standards Board issued IFRS S2 *Climate-related Disclosures*, which absorbs the TCFD architecture into a formal accounting standard now being adopted by national regulators around the world.

<div class="definition">
<strong>Scenario analysis.</strong> A structured exploration of how a business performs under a defined set of plausible futures, used to test resilience and inform strategy. A <em>scenario</em> differs from a forecast in that it makes no claim about likelihood; the goal is to span the space of plausible outcomes rather than to predict the most likely one.
</div>

## NGFS Scenarios

The Network for Greening the Financial System, a coalition of central banks and supervisors, publishes a standardized set of climate scenarios that are now used worldwide for stress testing. The headline narratives are *orderly* (early, smooth policy action that meets the Paris goals), *disorderly* (delayed but eventually aggressive action that produces sharper transition shocks), *hot house world* (current policies only, with severe long-run physical risk), and *too-little-too-late* (delayed and partial action, suffering both transition shocks and physical damage). Each narrative is paired with quantitative variables — temperature trajectories, carbon prices, GDP impacts — that can be plugged directly into a financial model.

## Limitations and the Role of the Actuary

Scenario analysis under deep uncertainty has well-known limitations. Model risk is pervasive: each step of the chain from emissions pathway to climate model to downscaled hazard to vulnerability function to financial loss adds compounding uncertainty. Distributional concerns arise because climate impacts fall most heavily on populations and regions least able to adapt, which raises questions about the fairness of risk-based pricing. Insurers may withdraw from regions where premiums become unaffordable, creating protection gaps that are increasingly the focus of regulatory attention.

Looking forward, several directions are reshaping the field. *Parametric insurance* — products that pay on the basis of an objective trigger such as wind speed or rainfall, rather than on documented losses — speeds claims handling and reduces moral hazard, and is well suited to climate risks where speed of recovery matters. *Climate adaptation premium credits* reward policyholders who invest in resilience, such as roof retrofits, defensible space around homes in wildfire zones, or elevated foundations in flood plains. *Transition planning support* engages actuaries in advising clients on the financial implications of decarbonization, including the long-tail liabilities of retiring carbon-intensive assets and the new exposures arising from emerging green technologies.

<div class="theorem">
<strong>Coherence of TVaR.</strong> The Tail Value-at-Risk \(\mathrm{TVaR}_\alpha\) is a coherent risk measure: it is monotone, positively homogeneous, translation invariant, and subadditive. Subadditivity, \(\mathrm{TVaR}_\alpha(L_1 + L_2) \le \mathrm{TVaR}_\alpha(L_1) + \mathrm{TVaR}_\alpha(L_2)\), is the crucial property for climate risk aggregation: it ensures that diversification across regions and perils never penalizes the insurer in the risk metric, in contrast to plain VaR, which can fail subadditivity for heavy-tailed losses.
</div>

The job of the climate-aware actuary is therefore both technical and communicative. The technical side demands fluency in physical climate data, catastrophe models, extreme value statistics, and reinsurance structuring. The communicative side demands the ability to translate model output into language that boards, regulators, and policyholders can act on, while being honest about the depth of uncertainty involved. As the climate continues to change faster than balance sheets typically reprice, that combination of skills is becoming one of the defining competences of the modern actuarial profession.
