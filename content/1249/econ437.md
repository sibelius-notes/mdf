---
title: "ECON 437: Urban Economics"
prof: "Ryan George"
subjects: "ECON"
---

## Sources and References

**Primary texts** — McCann, Philip. *Modern Urban and Regional Economics*, 2nd ed. Oxford University Press, 2013. Polèse, Mario. *The Wealth and Poverty of Regions: Why Cities Matter*. University of Chicago Press, 2009.

**Supplementary texts** — Glaeser, Edward. *Triumph of the City: How Our Greatest Invention Makes Us Richer, Smarter, Greener, Healthier and Happier*. Penguin, 2011. Fujita, Masahisa, Paul Krugman, and Anthony Venables. *The Spatial Economy: Cities, Regions, and International Trade*. MIT Press, 1999. Alonso, William. *Location and Land Use*. Harvard University Press, 1964. O'Sullivan, Arthur. *Urban Economics*, 8th ed. McGraw-Hill, 2012.

**Key articles** — Krugman (1991), "Increasing returns and economic geography," *JPE*; Roback (1982), "Wages, rents, and the quality of life," *JPE*; Nechyba and Walsh (2004), "Urban sprawl," *JEP*; Jacobs (1961), *Death and Life of Great American Cities*, Ch. 22; Hamilton (1975), "Zoning and property taxation," *Urban Studies*.

**Online resources** — MIT OCW 11.481J (Analysis of Transport Systems); SERC Urban Economics notes; Glaeser's Harvard Urban Lab; Statistics Canada Census of Population.

---

# Chapter 1: Introduction to Economic Geography

## Section 1.1: Why Does Geography Matter?

Cities exist because proximity reduces costs. Despite declining communication and transportation costs, economic activity remains intensely concentrated — more than half the world's population lives in cities occupying less than 3% of land surface. Understanding this concentration is the central question of economic geography and urban economics.

<div class="definition">
<strong>Economic Geography:</strong> The study of the spatial distribution of economic activity — why industries cluster, why some regions prosper while others decline, and how the spatial organisation of the economy shapes incomes, productivity, and welfare.
</div>

Krugman (1998) famously argued that economic geography was the "final frontier" of economics — the one area where mainstream equilibrium analysis had been least applied, yet which determines the welfare of billions of people through urbanisation and regional development.

## Section 1.2: The Three Dichotomies

McCann organises economic geography around three recurring dichotomies:

1. **Agglomeration vs. dispersion:** Forces pulling activity together (increasing returns, knowledge spillovers) versus forces pushing it apart (land rents, congestion, competition for inputs).
2. **Traded vs. non-traded sectors:** Export-base industries that bring income into a region versus local service industries that circulate it internally.
3. **Absolute vs. comparative advantage:** Regions that are absolutely more productive in all activities versus regions that have an advantage only in specific sectors.

---

# Chapter 2: Industrial Location Theory

## Section 2.1: Von Thünen's Land Use Model

Johann Heinrich von Thünen's (1826) model of agricultural land use is the foundation of all spatial economics. In the isolated state, a single city sits at the centre and farmland surrounds it. Different agricultural products vary in their **bid rent** — the maximum rent per unit of land that a farmer can afford while earning normal profit.

<div class="definition">
<strong>Bid Rent:</strong> The maximum rent per unit of land that a land user can afford at a given distance from the city, given the product price, yield, and transport cost. It equals the value of output minus production and transport costs.
</div>

For a crop with market price \( p \), yield per unit land \( y \), production cost \( c \), and transport cost \( k \) per unit per unit distance, the bid rent at distance \( d \) is:

\[ R(d) = (p - c)y - k \cdot y \cdot d = R_0 - t \cdot d \]

where \( R_0 = (p - c)y \) is the bid rent at the city and \( t = k \cdot y \) is the bid rent gradient. Land users with steep gradients (high transport costs or high-value products) locate closer to the city; those with flat gradients locate further out.

In equilibrium, each ring of land is occupied by the highest bidder. Products with steep rent gradients occupy land near the city; those with flat gradients occupy the periphery. This generates the **Von Thünen rings** — concentric zones of land use ordered by distance from the market.

## Section 2.2: Weber's Industrial Location Theory

Alfred Weber (1909) analysed the optimal location of a manufacturing plant trading off transport costs for raw materials and output versus agglomeration benefits. The **Weber triangle** problem: given raw material sources \( R_1, R_2 \) and a market \( M \), find the plant location \( P \) that minimises total transport costs:

\[ \min_P \; w_1 d(P, R_1) + w_2 d(P, R_2) + w_3 d(P, M) \]

where \( w_i \) are the transport weights. The solution (Varignon point) depends on the weight-to-value ratios of inputs and outputs.

**Material index:** The ratio of material weight to finished product weight. Industries with high material indices (e.g., iron smelting, lumber) locate near raw materials; those with low indices (e.g., electronics, jewellery) locate near markets.

---

# Chapter 3: Agglomeration and Clustering

## Section 3.1: Why Do Firms Cluster?

If land rents rise in cities, why do firms choose to locate there rather than dispersing to cheaper land? The answer lies in **agglomeration economies** — external benefits that arise from spatial proximity.

<div class="definition">
<strong>Agglomeration Economies:</strong> Cost reductions or productivity gains that arise when firms or workers locate in close proximity to each other. They are external to the individual firm (they arise from the broader cluster) and are a form of positive externality.
</div>

Marshall (1920) identified three sources of agglomeration economies, now called the **Marshallian trinity**:

<div class="theorem">
<strong>Marshall's Localisation Economies (MAR externalities):</strong>
<ol>
<li><strong>Labour market pooling:</strong> A thick local labour market reduces the matching problem for both workers and firms. Workers with specialised skills find employers, and firms experiencing shocks can hire or shed workers without costly relocation.</li>
<li><strong>Input sharing:</strong> Nearby firms can share specialised inputs (suppliers, business services, infrastructure) that would be uneconomic for any individual firm to support alone.</li>
<li><strong>Knowledge spillovers:</strong> Ideas, techniques, and know-how diffuse through informal contacts, labour mobility, and observation — "tacit knowledge" that cannot easily be transmitted over long distances.</li>
</ol>
</div>

## Section 3.2: Localisation vs. Urbanisation Economies

<div class="definition">
<strong>Localisation Economies:</strong> Benefits that arise from the geographic concentration of firms in the <em>same industry</em>. Also called Marshall-Arrow-Romer (MAR) externalities. Silicon Valley for semiconductors, Detroit for automobiles, and Toronto's financial district are canonical examples.
</div>

<div class="definition">
<strong>Urbanisation Economies (Jacobs Externalities):</strong> Benefits that arise from the size and diversity of the <em>city as a whole</em>, irrespective of industry composition. Jane Jacobs (1969) argued that cross-industry knowledge spillovers — the "diversity bonus" — drive innovation more than industry specialisation. Dense, diverse cities generate more new ideas per person.
</div>

The empirical literature has not fully resolved the relative importance of MAR vs. Jacobs externalities for growth. Glaeser et al. (1992) find support for Jacobs externalities in US city-industry employment growth; Henderson et al. (1995) find evidence for MAR externalities in manufacturing.

## Section 3.3: Krugman's New Economic Geography

Paul Krugman (1991) formalised agglomeration in a general equilibrium model with monopolistic competition (Dixit-Stiglitz) and iceberg transport costs. The core-periphery model features:

- **Centripetal forces:** Demand linkages (workers buy locally produced goods, increasing local market size), cost linkages (firms near suppliers face lower input costs), and thick labour markets.
- **Centrifugal forces:** Land rents, congestion externalities, and competition for immobile workers push activity to the periphery.

The model generates a **catastrophic agglomeration** result: when transport costs fall below a critical threshold, all manufacturing concentrates in a single core. This provides a theoretical foundation for the observed dramatic geographic concentration of manufacturing industries.

---

# Chapter 4: The Spatial Distribution of Activities — Size and Location

## Section 4.1: Zipf's Law and City Size Distributions

Empirically, city sizes across countries follow a power law: the city with rank \( r \) has population roughly \( P_1 / r \), where \( P_1 \) is the largest city's population. This is **Zipf's Law** (rank-size rule), which implies a Pareto distribution with exponent close to 1. No economic theory fully explains this regularity, but it is one of the most robust empirical regularities in social science.

<div class="remark">
<strong>Primacy:</strong> Developing countries often have one dominant city (a primate city) that is far larger than the second city — deviating from Zipf's Law. This reflects transport cost structure, colonial history, and centralised political economies. Examples: Bangkok (Thailand), Lagos (Nigeria), Buenos Aires (Argentina).
</div>

## Section 4.2: The Regional Origins of Wealth — Polèse

Polèse (*Wealth and Poverty of Regions*) argues that geographic prosperity is self-reinforcing: regions that become wealthy accumulate human capital, institutions, and network advantages that attract further investment. Three geographic forces shape regional development:

1. **First nature geography:** Climate, natural resources, access to navigable waterways — the initial endowments that determined where early settlements and trade routes arose.
2. **Second nature geography:** Agglomeration economies, market access, and the cumulative advantages of existing settlements — the endogenous economic geography that builds on initial advantages.
3. **Institutional geography:** Property rights, rule of law, fiscal federalism — political and institutional structures that support or undermine market integration and investment.

The persistence of regional inequality reflects the strength of second-nature geography: once established, wealthy cities attract further capital and talent, while declining regions face a vicious cycle of outmigration, fiscal stress, and deteriorating services.

---

# Chapter 5: European Cities and Economic History

## Section 5.1: The Rise of Cities in Medieval Europe

The commercial revolution of the 11th–12th centuries transformed European urbanisation. Verhulst (*The Rise of Cities in N-W Europe*) traces the emergence of new commercial cities in Flanders, the Rhine valley, and Northern Italy — cities that arose not from royal decree but from merchant initiative, navigational access, and wool trade.

Key drivers:
- **Long-distance trade:** The revival of Mediterranean and North Sea trade created demand for entrepôt cities (Bruges, Venice, Genoa) at geographic intersections of trade routes.
- **Markets and fairs:** Periodic fairs (Champagne fairs) reduced transaction costs by assembling buyers and sellers in one time and place.
- **Urban institutions:** Merchant guilds, notarial records, and early contract law reduced enforcement costs and enabled impersonal exchange beyond face-to-face communities.

## Section 5.2: The First Modern Economy — De Vries and Van der Woude

The Dutch Republic of the 17th century was the first modern market economy, in the view of De Vries and Van der Woude. The urban-rural relationship in the Dutch Republic was distinctive:

- **Urbanisation rate:** Over 40% urban by 1700 — far above any other European nation.
- **Market integration:** Unified capital markets, commodity exchanges (Amsterdam bourse), and insurance markets allocated capital efficiently across the economy.
- **Rural commercialisation:** Dutch farmers produced for markets, not subsistence — enabling the urban population to specialise in manufactures and trade.

The Dutch case illustrates that urbanisation is not merely a consequence of industrialisation but can precede it, driven by commercial activity and market integration.

---

# Chapter 6: Colonialism, Ecosystem Transformation, and Regional Development

## Section 6.1: State Simplifications — Scott (1996)

James Scott's concept of "seeing like a state" captures how modern states simplified complex, legible representations of space, nature, and populations to enable taxation, conscription, and administration. High modernist urbanism (Le Corbusier's towers in the park) applied this state logic to city planning — reducing complex, organic city patterns to abstract geometric forms.

Urban economic implications:
- Zoning laws imposed state-legible land-use categories on mixed-use urban fabrics, reducing density and diversity.
- Infrastructure planning (highways, urban renewal) displaced mixed-income communities in the name of scientific planning, often destroying the social capital and economic networks that made neighbourhoods viable.
- Indigenous land systems — based on usufruct, seasonal rotation, and communal tenure — were often incompatible with surveyor-imposed cadastral systems, enabling expropriation.

## Section 6.2: Colonialism and Spatial Inequality

Colonial governance structures created spatial economies designed to extract resources for metropolitan powers, not to develop regional economies. Transport infrastructure (railways in Africa, canals in India) connected resource extraction sites to ports rather than integrating domestic markets. The resulting "enclave economies" left post-colonial nations with:

- Primate urban hierarchies (capital city dominates; secondary cities are weak)
- Poor inter-regional connectivity
- Export specialisation in primary commodities with limited value-added

Nunn (2008) finds that African regions with higher historical slave trade exposure have lower present-day trust and income — a long causal chain from colonial extraction to contemporary inequality.

---

# Chapter 7: The Monocentric City Model

## Section 7.1: Alonso-Muth-Mills Model

The Alonso-Muth-Mills (AMM) model is the workhorse of urban economics. It extends von Thünen's agricultural bid-rent to a monocentric city where all employment is at the Central Business District (CBD) and residents choose where to live given the trade-off between lower rents in the suburbs and higher commuting costs.

### 7.1.1 Household Optimisation

A household maximises utility over housing \( h \) and a composite consumption good \( c \), given income \( y \), rent \( R(d) \), and commuting cost \( t \cdot d \):

\[ \max_{h, c} \; U(h, c) \quad \text{subject to} \quad c + R(d) \cdot h = y - t \cdot d \]

Budget constraint: \( c + R(d) h = y - td \equiv I(d) \) — income net of commuting costs declines with distance.

### 7.1.2 Bid-Rent Gradient

The bid rent function gives the maximum rent per unit of housing that a household at distance \( d \) can afford while achieving utility level \( \bar{U} \):

\[ R(d) = R_0 - \frac{t}{h} \cdot d \]

For a simple case with inelastic housing demand \( h = \bar{h} \), the bid-rent gradient equals \( -t/\bar{h} \): rents fall linearly with distance at a rate determined by commuting costs and housing consumption. More generally, the **gradient condition** is:

\[ \frac{dR}{dd} = -\frac{t}{h(d)} < 0 \]

Rents necessarily decline with distance to compensate residents for higher commuting costs. If rents did not decline, no one would choose to live further out.

### 7.1.3 Comparative Statics

The AMM model yields several testable predictions:

| Change | Effect on density gradient | Effect on city size |
|---|---|---|
| Higher income \( y \) | Flatter gradient | Larger city (demand for space rises) |
| Higher commuting cost \( t \) | Steeper gradient | Smaller, denser city |
| Population increase | Outward expansion | Larger city |
| Agricultural land value increase | Steeper gradient | Smaller city (land use competes) |

<div class="example">
<strong>Suburbanisation and the Automobile:</strong> The dramatic fall in effective commuting costs brought by the automobile and highway subsidies (post-1945) flattened the bid-rent gradient, allowing households to substitute cheap suburban land for expensive urban land. The AMM model predicts — correctly — that cities spread outward as commuting costs fall. Nechyba and Walsh (2004) provide a comprehensive review of suburbanisation, finding that decentralisation reflects both falling transport costs and rising incomes, with the income effect operating through demand for larger housing.
</div>

## Section 7.2: Urban Sprawl

<div class="definition">
<strong>Urban Sprawl:</strong> Low-density, automobile-dependent suburban development extending far beyond the historical core of a city. Sprawl is associated with long commutes, high infrastructure costs per capita, greater energy use, loss of agricultural land, and spatial segregation by income.
</div>

**Causes of sprawl beyond the AMM model:**

1. **Fiscal zoning:** Exclusionary zoning (minimum lot sizes, exclusion of multi-family housing) by suburban municipalities seeks to attract high-income residents who contribute more in property taxes than they consume in services, while excluding lower-income households. Hamilton (1975) models fiscal zoning as an efficient equilibrium matching households to jurisdictions by tax-service preferences. Critics argue it enforces racial and income segregation.

2. **Underpriced roads and parking:** Highway user fees and parking charges that are below social marginal cost (including congestion and pollution externalities) subsidise automobile use and dispersed development.

3. **Mortgage interest deduction:** Tax subsidies to homeownership (deductibility of mortgage interest in the US) encourage investment in single-family homes, often in suburbs.

4. **Local land-use regulation:** Stringent planning controls (green belts, urban growth boundaries) in some cities limit supply, but most suburban jurisdictions have permissive zoning that enables sprawl.

---

# Chapter 8: Housing Markets

## Section 8.1: Housing as an Economic Good

Housing is unusual among goods for several reasons that make it a perennial policy concern:

- **Durability:** Housing lasts for decades; the stock adjusts slowly to demand changes.
- **Spatial fixity:** A house cannot be moved; its value depends critically on neighbourhood quality.
- **Heterogeneity:** Every housing unit is unique in location, size, condition, and design.
- **High transaction costs:** Search, legal fees, moving costs, and information asymmetries make housing markets illiquid.
- **Social significance:** Housing determines school district, peer networks, crime exposure, and environmental quality — amplifying inequality.

## Section 8.2: Supply and Demand in Housing Markets

**Demand determinants:** Population growth, household formation, income, mortgage interest rates, expectations of price appreciation, and neighbourhood amenities.

**Supply determinants:** Land availability and cost, construction costs (labour and materials), zoning regulations, building standards, and developer profit expectations.

The elasticity of housing supply is critical. Where supply is elastic (e.g., Texas cities with permissive zoning and flat topography), demand shocks generate large quantity increases and modest price increases. Where supply is inelastic (e.g., San Francisco, Vancouver, with geographic constraints and strict regulation), demand shocks generate large price increases and little new construction.

**Glaeser, Gyourko, and Saks (2005)** estimate that housing prices in high-amenity US cities far exceed construction costs — the gap is the implicit cost of regulatory barriers (zoning permits, design review, environmental review). They call this the **zoning tax**: the wedge between the market value and the social cost of housing, created by supply restrictions.

## Section 8.3: Demand-Side vs. Supply-Side Housing Policy

**Demand-side policies** (housing vouchers, rent subsidies, housing allowances) give households purchasing power in the private market, allowing them to choose location and quality.

**Supply-side policies** (public housing, inclusionary zoning, construction subsidies) directly provide or incentivise the construction of affordable units.

Galster (1997) argues that demand-side policies are generally more efficient: they respect consumer choice, avoid the distortions of below-market public housing, and leverage the private market's ability to provide diverse housing types. However, demand-side policies may merely bid up rents in inelastic markets, transferring income from poor renters to landlords without improving housing quality.

<div class="example">
<strong>Kadi (2014) — Market-based reforms and affordable housing:</strong> Kadi documents that market-oriented housing policy reforms in Vienna, Vienna, and Amsterdam gradually eroded the affordable housing stock as social housing was privatised. Market rents rose rapidly for marginal households as supply-side subsidies were withdrawn, illustrating the limits of demand-side policy in the absence of adequate supply.
</div>

**Inclusionary zoning** requires private developers to include a fraction (typically 10–20%) of units at below-market rents in exchange for development approval. It is a cross-subsidy: market-rate units finance affordable units. Critics argue it functions as a tax on new construction, reducing overall housing supply and raising market-rate prices — potentially harming the households it intends to help.

---

# Chapter 9: Local Public Goods, Zoning, and Fiscal Federalism

## Section 9.1: The Tiebout Mechanism

Tiebout (1956) proposed that households reveal their preferences for local public goods by choosing jurisdictions with their preferred tax-service bundles — "voting with their feet." In a world with many jurisdictions, perfect mobility, and full information, the Tiebout mechanism produces an efficient allocation of public goods across jurisdictions.

**Conditions for Tiebout efficiency:**
- Mobile households with no moving costs
- Large number of competing jurisdictions
- No spillovers across jurisdictions
- Costless provision at any scale (no economies or diseconomies of scale)
- Households choose based solely on public good-tax bundles

In practice, these conditions are violated: moving is costly, jurisdictions are few in rural areas, externalities are common (regional transport, air quality), and schools exhibit scale economies.

## Section 9.2: Hamilton's Zoning Model

Hamilton (1975) showed that fiscal zoning — requiring all residents to consume a fixed level of housing — converts the property tax into a benefit tax: residents pay for exactly what they consume in local public services. The property tax is no longer distortionary (no excess burden) because the zoning constraint eliminates fiscal free-riding by those who would otherwise consume little housing but demand extensive public services.

**Property tax capitalisation:** The Hamilton model predicts that local public service quality is capitalised into land values: a school district with $1,000/year in additional service value should have land values $1,000/\( r \) higher (where \( r \) is the discount rate). Oates (1969) tested this and found strong capitalisation, supporting the view that property taxes and public services are jointly valued by residents.

## Section 9.3: Who Pays, Who Benefits? — Heim (2015)

Heim (2015) examines the long-run incidence of urban infrastructure investment in US cities. Public infrastructure raises land values (through productivity and amenity effects), but the beneficiaries are landowners rather than residents. When public investment is financed by broad taxation (income or sales taxes), there is a transfer from non-landowners to landowners — a regressive redistribution.

Counter-argument: If workers are mobile, public infrastructure in a location raises wages (productivity) and land values simultaneously. The incidence between landowners and workers depends on the elasticity of labour supply to the region.

---

# Chapter 10: On the Margins — Slums, Inequality, and Urban Poverty

## Section 10.1: Glaeser on Slums

Glaeser (*Triumph of the City*, 2011) provocatively defends slums as evidence of urban dynamism. Slums exist because cities offer economic opportunities unavailable in rural areas; migrants move from rural poverty to urban poverty because urban poverty is more connected to markets, services, and opportunity ladders.

**Glaeser's argument:**
- Slums concentrate the very poor but offer them access to informal labour markets, NGO services, and urban public goods (clinics, schools) absent in rural areas.
- Policies that prevent rural-urban migration (registration systems like China's hukou) reduce welfare by preventing the rural poor from accessing the urban wage premium.
- The appropriate response to slums is investment in urban infrastructure and property rights, not forced clearance or migration controls.

## Section 10.2: Berner (2000) — Eviction of the Poorest

Berner (2000) challenges the view that slum upgrading and tenure security uniformly benefit the poor. In the Philippines, slum regularisation programmes conferred formal titles on residents — but also made them targets of land speculation and displacement by higher-income users. The poor were pushed to more distant, less-connected peripheries.

**Key tension:** Improving urban amenities in poor neighbourhoods raises land values, attracting higher-income residents and displacing the poor (gentrification). Policies intended to benefit the poor may ultimately transfer wealth to landowners.

**Policy implications:**
- Community land trusts — ownership structures that separate land from buildings — can prevent displacement by removing land from speculative markets.
- Subsidised rental housing provides affordability without the displacement risk of homeownership subsidisation in appreciating markets.

---

# Chapter 11: Inequality, Space, and the Spatial Mismatch

## Section 11.1: Concentrated Poverty — Wilson (2008)

William Julius Wilson argues that concentrated urban poverty in American inner cities is the product of two structural forces operating since the 1970s:

1. **Deindustrialisation:** The loss of manufacturing jobs in central cities eliminated the employment base for low-skilled workers, particularly Black Americans concentrated in Northern cities.
2. **Middle-class exodus:** Civil rights legislation and rising incomes enabled upwardly mobile Black families to leave inner-city neighbourhoods, removing role models, social capital, and political voice.

The interaction of economic isolation (no nearby jobs) and social isolation (loss of working-class networks) produces a distinctive pathology of concentrated poverty: high crime, low educational attainment, weak social norms around employment.

**Policy implication:** Addressing concentrated poverty requires both place-based interventions (neighbourhood investment) and people-based interventions (Earned Income Tax Credits, job training). Mobility vouchers (Moving to Opportunity) allow poor families to move to higher-opportunity neighbourhoods — with demonstrated long-run benefits for children's adult outcomes (Chetty, Hendren, and Katz, 2016).

## Section 11.2: The Spatial Mismatch Hypothesis — Kain (1968, 2004)

John Kain (1968) proposed that residential segregation imposed by discrimination prevents Black workers from accessing suburban employment growth — a **spatial mismatch** between where they live and where jobs are.

Testing spatial mismatch is difficult because residential location and employment are simultaneously determined. Kain's (2004) retrospective review concludes that spatial mismatch remains empirically important but that its magnitude has diminished as suburban transportation improved and spatial discrimination in housing markets weakened.

**Modern relevance:** Job access inequality persists in Canada. Transit access determines which workers can reach suburban employment centres. Areas in Toronto's 905 region with limited transit face effective job access disadvantage for car-less households — a contemporary spatial mismatch.

## Section 11.3: McDowell (2015) — Labour Geographies and Body Work

McDowell (2015) brings a feminist economic geography perspective to labour markets, examining how physical and emotional labour (care work, cleaning, hospitality) is distributed across bodies, neighbourhoods, and genders. "Body work" — tasks performed on or for other bodies — is undervalued relative to cognitive work, and is disproportionately performed by women, migrants, and racialised workers.

Economic geography is not only about where industries locate but about who performs what work, how that work is valued, and how spatial sorting (residential segregation, zoning) concentrates disadvantaged workers in low-wage service jobs. Urban inequality is simultaneously economic, spatial, and social.

---

# Chapter 12: Synthesis — Cities, Welfare, and Policy

## Section 12.1: The Urban Productivity Premium

Dense cities are more productive. The elasticity of city productivity with respect to population (often called the **agglomeration elasticity**) is estimated at approximately 0.02–0.05 in micro-econometric studies — a city twice as large is about 2–5% more productive per worker, all else equal (Rosenthal and Strange, 2004).

This premium reflects all three Marshallian mechanisms plus selection: cities attract more able workers. Separating true agglomeration from sorting is methodologically challenging; most credible estimates use within-worker variation around city-level changes (Combes, Duranton, and Gobillon, 2008).

## Section 12.2: Policy Challenges

Urban economics generates clear policy prescriptions but also sharp trade-offs:

1. **Housing supply and affordability:** Relaxing land-use regulation raises supply, lowers prices, and potentially raises urban productivity. But it may generate gentrification pressures in specific neighbourhoods and externalities (increased density, changed neighbourhood character).

2. **Infrastructure and congestion pricing:** Road pricing equal to marginal congestion costs would reduce traffic, lower emissions, and fund transit. Political resistance arises because the incidence of congestion pricing falls on existing car commuters who lose a previously free (if congested) road.

3. **Place-based policy vs. people-based policy:** Investing in depressed regions (place-based) versus investing in individuals who can then migrate (people-based). Both have a role: people-based policies build human capital mobility; place-based policies protect immobile assets (homeownership, social networks) and avoid the social disruption of mass outmigration.

4. **Indigenous land rights and urban development:** Urban growth in Canada occurs on unceded Indigenous territories. Reconciliation requires not only symbolic recognition but substantive engagement with land revenue sharing, Indigenous planning authority, and housing support for urban Indigenous populations.
