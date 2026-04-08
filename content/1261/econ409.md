---
title: "ECON 409: Workers, Jobs, and Wages"
prof: "Francisco Gonzalez"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — No required textbook. Course is based on instructor notes and a curated journal article reading list posted on the course website.

**Key articles** — Roy (1951), "Some thoughts on the distribution of earnings," *Oxford Economic Papers*; Rosen (1983), "The equilibrium approach to labor markets," NBER Working Paper 1165; Roback (1982), "Wages, rents, and the quality of life," *Journal of Political Economy*; Autor (2014), "Skills, education, and the rise of earnings inequality," *Science*; Shimer (2005), "The cyclical behavior of equilibrium unemployment and vacancies," *AER*; Hoynes, Miller, and Schaller (2012), "Who suffers during recessions?" *JEP*; Albanesi and Kim (2021), "Effects of the COVID-19 recession on the US labor market," *JEP*; Chetty et al. (2024), "The economic impacts of COVID-19," *QJE*; Bernanke and Blanchard (2023), "What caused the US pandemic-era inflation," Brookings; Goldin (2006, 2014), *AER*.

**Supplementary texts** — Pissarides, Christopher. *Equilibrium Unemployment Theory*, 2nd ed. MIT Press, 2000. Acemoglu, Daron, and David Autor. "Skills, tasks and technologies: Implications for employment and earnings." *Handbook of Labor Economics*, vol. 4B, Elsevier, 2011.

**Online resources** — NBER working papers; Opportunity Insights data; BLS Current Population Survey; Statistics Canada LFS.

---

# Chapter 1: Self-Selection and the Roy Model

## Section 1.1: The Distribution of Earnings as a Selection Problem

Why do workers earn different wages? One answer points to productivity differences; another points to discrimination or monopsony. A third, less intuitive answer is that observed wages are an artefact of selection — the workers we observe in each occupation are not a random draw from the population but the result of individuals choosing the occupations in which they have the highest comparative advantage.

<div class="definition">
<strong>Roy Model (1951):</strong> A two-sector model in which each individual has a potential wage in each sector, and selects into the sector where their wage is highest. The observed wage distribution in each sector reflects positive or negative selection, depending on the correlation between sector-specific skills.
</div>

## Section 1.2: The Two-Sector Roy Model

Let each worker have potential log-earnings \( (w_1, w_2) \) in sectors 1 and 2, jointly normally distributed:

\[ \begin{pmatrix} w_1 \\ w_2 \end{pmatrix} \sim \mathcal{N} \left( \begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix},\, \begin{pmatrix} \sigma_1^2 & \rho\sigma_1\sigma_2 \\ \rho\sigma_1\sigma_2 & \sigma_2^2 \end{pmatrix} \right) \]

A worker selects into sector 1 if \( w_1 > w_2 \), i.e., if \( w_1 - w_2 > 0 \).

**Positive selection into sector 1** occurs when \( \rho \) is high and \( \sigma_1 > \sigma_2 \): workers who earn highly in sector 1 also tend to earn highly in sector 2, but the dispersion of skill in sector 1 is greater. Workers sort into sector 1 if they are in the upper tail of the joint distribution — the sector 1 workforce is positively selected (above average in both).

**Negative selection** occurs when \( \rho $ is low and \( \sigma_1 < \sigma_2 \): workers who do well in sector 1 tend to do badly in sector 2. Sector 1 attracts those with low sector-2 potential — a refuge sector for low-skill workers.

<div class="remark">
<strong>Immigration as a Roy Model application:</strong> Borjas (1987, 1991) applied the Roy model to immigrant selection. Immigrants from countries with high earnings inequality (high <em>σ</em>) select positively — they tend to be high-skill workers who find the US skill premium attractive. Immigrants from egalitarian countries select negatively. Empirically, immigrant earnings relative to natives deteriorate over cohorts in the US during the 1970s–80s, consistent with declining positive selection.
</div>

## Section 1.3: Policy Implications

Selection complicates causal inference. A programme evaluated by comparing participants to non-participants in the same sector may be comparing positively selected participants to the general population — **selection bias**. The Roy model formalises this and motivates instrument-based evaluation strategies that identify compliers rather than self-selected participants.

---

# Chapter 2: Compensating Differentials — The Equilibrium Approach

## Section 2.1: From Partial to General Equilibrium

The standard compensating differentials model (Chapter 7 of ECON 351 notes) takes the wage as determined residually given job characteristics. Rosen (1983) embeds this in a general equilibrium framework where both wages and product prices adjust, and where the hedonic wage schedule is an equilibrium object — not a menu from which workers and firms separately choose.

## Section 2.2: Hedonic Equilibrium

Let workers have heterogeneous risk preferences and firms have heterogeneous technologies for producing safety. Each worker's **offer locus** traces the minimum wage required to accept progressively more risk. Each firm's **isoprofit curve** traces wage-risk pairs that yield zero profit.

Equilibrium is a wage-risk schedule \( w(x) \) that simultaneously:
1. Tangentially touches each worker's indifference curve at their chosen risk level (workers' first-order condition).
2. Tangentially touches each firm's isoprofit curve at the same risk level (firms' first-order condition).

The equilibrium schedule satisfies:

\[ \frac{dw}{dx} = MRS_{w,x}^{worker} = MRT_{w,x}^{firm} \]

At each traded risk level, the slope of the hedonic wage schedule equals the worker's marginal willingness to accept risk and the firm's marginal cost of reducing risk.

<div class="example">
<strong>Identification Challenge:</strong> Econometricians observe only the equilibrium schedule — the points where workers and firms are matched. They cannot separately identify worker preferences and firm technologies without additional variation (instruments for supply or demand shifts). This is the fundamental econometric challenge of hedonic market studies.
</div>

## Section 2.3: Extensions — Amenity Differentials and Sorting

Job characteristics other than risk also command compensating differentials: commuting distance, job autonomy, employer quality, geographic location. The Rosen framework generalises to a multi-attribute hedonic wage function. This sets the stage for the Roback model, which extends hedonic pricing to local labour and land markets.

---

# Chapter 3: Local Labour Markets and the Roback Model

## Section 3.1: Spatial Equilibrium

The **spatial equilibrium** concept (Rosen, 1974; Roback, 1982) extends hedonic theory to cities. Workers are mobile across cities; in equilibrium, they must be indifferent between locations (otherwise they would move). Cities differ in wages and rents; amenities justify both higher rents and lower wages.

<div class="definition">
<strong>Roback (1982) Model:</strong> Workers choose a city to maximise utility over consumption, leisure, and city amenities. Firms choose a city to minimise production costs, which depend on wages, rents, and city productivity. In spatial equilibrium, utility and profit levels are equalised across cities.
</div>

## Section 3.2: Worker and Firm Equilibrium Conditions

Let city \( j \) have wage \( w_j \), rent \( r_j \), and amenity level \( s_j \). Workers maximise utility:

\[ U(w_j - r_j \cdot h, s_j) = \bar{U} \quad \forall j \]

where \( h \) is housing consumption. Firms minimise cost per unit output:

\[ C(w_j, r_j, s_j) = \bar{C} \quad \forall j \]

Totally differentiating:

\[ \frac{dw}{ds} = -\frac{U_s / U_w}{1} \quad \text{(worker condition)} \]

\[ \frac{dw}{ds}\bigg|_{firm} = -\frac{C_s / C_w}{1} \quad \text{(firm condition)} \]

If amenities raise firm productivity (\( C_s < 0 \)), firms bid up wages in amenity-rich cities. If amenities benefit only workers (\( C_s = 0 \)), wages fall in amenity-rich cities (workers accept a wage discount). The net effect on rents is unambiguous — rents rise in amenity-rich cities because workers and/or firms are willing to pay more to locate there.

<div class="example">
<strong>Quality-of-life rankings:</strong> Blomquist, Berger, and Hoehn (1988) use the Roback framework to rank US cities by quality of life. Cities with clean air, mild climate, and low crime have <em>lower</em> wages (workers accept a discount) and <em>higher</em> rents (reflecting willingness to pay for amenities). The quality of life index is the implicit price of the amenity bundle, derived from wage and rent gradients.
</div>

## Section 3.3: Implications for Urban Policy

The Roback framework implies that place-based policies (enterprise zones, regional development grants) face a spatial equilibrium constraint: if a subsidy raises productivity in a depressed region, rents and wages will adjust until inter-regional indifference is restored. The long-run beneficiaries may be landowners (through higher rents) rather than workers. This motivates evaluating place-based policies on their effects on land values rather than wages.

---

# Chapter 4: Human Capital, Technology, and Earnings Inequality

## Section 4.1: The Rise of Earnings Inequality

Since the late 1970s, earnings inequality has risen sharply in the United States and, to a lesser extent, Canada and the UK. The 90th/10th wage percentile ratio rose from about 3.5 in 1980 to over 5.0 by 2000 in the US. Understanding the source of this widening is central to labour economics.

## Section 4.2: Skill-Biased Technological Change (SBTC)

The dominant explanation for rising inequality is **skill-biased technological change** — an exogenous shift in the production function that raises the marginal product of skilled workers relative to unskilled workers.

If the aggregate production function is CES in skilled \( H \) and unskilled \( L \) labour:

\[ Y = \left[ \alpha (A_H H)^{\rho} + (1-\alpha)(A_L L)^{\rho} \right]^{1/\rho} \]

where \( A_H \) is skill-augmenting technology and \( A_L \) is unskill-augmenting technology, the skill premium satisfies:

\[ \frac{w_H}{w_L} = \frac{\alpha}{1-\alpha} \cdot \left( \frac{A_H}{A_L} \right)^{\rho} \cdot \left( \frac{H}{L} \right)^{\rho - 1} \]

When \( \rho < 1 \) (elasticity of substitution \( \sigma = 1/(1-\rho) > 1 \)), skilled and unskilled labour are imperfect substitutes. Rising \( A_H / A_L \) (SBTC) raises the skill premium. Rising supply \( H/L \) reduces it.

The US skill premium rose despite a large increase in the supply of college graduates, suggesting SBTC shifted skill demand faster than supply could keep up. Katz and Murphy (1992) formalise this in a supply-demand framework.

## Section 4.3: Task-Based Framework — Autor, Levy, and Murnane (2003)

Autor, Levy, and Murnane (ALM, 2003) extend SBTC theory to explain **wage polarisation** — the hollowing out of middle-wage employment, with growth concentrated at the top and bottom.

<div class="definition">
<strong>Routine Tasks:</strong> Cognitive and manual tasks that follow well-defined, repetitive rules and are therefore susceptible to automation by computer capital. Examples: bookkeeping, filing, assembly-line work, data entry.
</div>

<div class="definition">
<strong>Non-routine Cognitive Tasks:</strong> Problem-solving, creativity, interpersonal interaction — tasks that require complex judgment and are complementary to computer capital. Concentrated in high-wage professional occupations.
</div>

<div class="definition">
<strong>Non-routine Manual Tasks:</strong> Tasks requiring physical dexterity, adaptability, and situational judgment — not easily automated. Examples: janitors, plumbers, home health aides. Concentrated at the low end of the wage distribution.
</div>

Computers substitute for routine workers (middle-wage) and complement non-routine cognitive workers (high-wage). The result is job polarisation: employment growth at the top and bottom, stagnation in the middle. Autor (2014) confirms this pattern across OECD countries since 1980.

**Autor's Key Finding:** Wage and employment polarisation is not merely a US phenomenon. It reflects the interaction of ICT adoption with the task content of jobs. The "skill premium" should be thought of as a task premium — a premium for non-routine cognitive tasks that computers complement.

## Section 4.4: Policy Implications

Rising inequality driven by technology poses different policy challenges than inequality driven by discrimination or monopsony:

1. **Education and training:** Investing in skills that complement technology (higher-order cognitive, interpersonal) reduces the premium while raising productivity. Community college and apprenticeship programmes targeting displaced routine workers are a high-return investment.
2. **Redistribution:** When technology generates winner-takes-all returns, the market distribution diverges from the social optimum. Progressive taxation of high incomes or capital income (robot taxes) can partially offset inequality without large efficiency costs if high-skill labour supply is inelastic.
3. **Place-based considerations:** Routine-task intensive industries are geographically concentrated (manufacturing towns in Ohio, Ontario). Job polarisation hits specific communities hard, generating spatial inequality alongside individual earnings inequality.

---

# Chapter 5: Labour Market Stocks, Flows, and Fluctuations

## Section 5.1: Stocks and Flows Accounting

At any point in time, the unemployed stock \( U \) evolves according to:

\[ \frac{dU}{dt} = s \cdot E - f \cdot U \]

where \( s \) is the separation rate (flows from employment to unemployment) and \( f \) is the job-finding rate (flows from unemployment to employment). In steady state:

\[ U = \frac{s \cdot E}{f} \quad \Rightarrow \quad u = \frac{s}{s + f} \]

Shimer (2005) decomposed the variance of US unemployment into the contributions of \( s \) and \( f \). Remarkably, the job-finding rate \( f \) accounts for about 75% of unemployment variation, and the separation rate \( s \) accounts for about 25%. Recessions are primarily times when workers find it harder to get jobs — not times of mass layoffs (contra the conventional Keynesian view).

## Section 5.2: The Shimer Puzzle and the Beveridge Curve

The **Beveridge Curve** plots the unemployment rate against the vacancy rate. During expansions, unemployment is low and vacancies are high; during recessions, the reverse. Cyclical fluctuations trace a downward-sloping curve.

Shimer (2005) noted that standard **Mortensen-Pissarides (MP) search-and-matching models** cannot replicate the observed cyclicality of unemployment and vacancies. In the standard model, wages adjust freely to absorb shocks, leaving employment and vacancy posting roughly stable. But empirically, unemployment and vacancies are highly volatile.

**The MP model:**

The matching function \( M(U, V) = m U^\alpha V^{1-\alpha} \) determines the flow of matches as a function of the unemployment pool \( U \) and vacancy stock \( V \). Define labour market tightness \( \theta = V/U \). Then:

\[ f(\theta) = m \theta^{1-\alpha} \quad \text{(job-finding rate)} \]
\[ q(\theta) = m \theta^{-\alpha} \quad \text{(vacancy-filling rate)} \]

Free entry of vacancies pins down the value of a vacancy at zero. The surplus from a match is split between worker and firm through Nash bargaining. Shimer showed that under plausible parameter values, productivity shocks generate much less unemployment volatility than observed — the model needs sticky wages (Hall, 2005) or match-specific heterogeneity to match the data.

## Section 5.3: Who Suffers During Recessions? — Hoynes, Miller, and Schaller (2012)

Recessions do not affect all workers equally. Hoynes, Miller, and Schaller (2012) exploit variation in industry and demographic composition across US states during post-WWII recessions to document:

- **Cyclical sensitivity is highest** for men, young workers, non-whites, and workers with low education.
- Employment fluctuations account for most of the income cyclicality at the bottom; for higher-wage workers, hours and wages also adjust.
- The business cycle generates persistent inequality: workers who enter the labour market during recessions earn lower wages for a decade or more (Kahn, 2010; Oreopoulos et al., 2012 for Canada).

The result that disadvantaged groups are more cyclically sensitive has two interpretations:
1. **Last hired, first fired:** Low-skill workers are marginal employees, retained during booms but let go first during busts.
2. **Industry composition:** Disadvantaged workers are concentrated in cyclically sensitive industries (manufacturing, construction) relative to stable sectors (government, health care).

---

# Chapter 6: Labour Market Impacts of COVID-19

## Section 6.1: The 2020 Recession — Albanesi and Kim (2021)

The COVID-19 recession was unusual in several respects:

1. **Composition:** Unlike previous recessions, employment losses were larger for women than men in the initial phase (February–April 2020), reversing the typical pattern. This reflects women's concentration in face-to-face service sectors (hospitality, retail, personal services) that were directly shut down by public health orders.

2. **Speed:** The April 2020 US unemployment rate of 14.7% was reached in two months — faster than any previous recession. The collapse was driven by layoffs, not reduced hiring.

3. **Recovery:** Employment recovered rapidly in summer 2020 as restrictions lifted, but participation rates recovered more slowly, particularly for mothers of young children whose schools and child-care centres remained closed.

Albanesi and Kim (2021) document that the gender-differentiated impact of COVID reversed the historical pattern because the pandemic specifically targeted in-person services — a reversal of the "mancession" character of the 2008–09 recession (which hit construction and manufacturing, predominantly male sectors).

## Section 6.2: High-Frequency Economic Tracking — Chetty et al. (2024)

Raj Chetty and the Opportunity Insights team assembled a new real-time database of economic activity using private sector data (credit card transactions, payroll records, small business revenue, job postings). Key findings:

- **Consumer spending** collapsed by 30–40% in low-income zip codes in April 2020, recovered quickly with the CARES Act stimulus checks.
- **Employment losses** were concentrated among low-wage workers in high-contact industries. High-income workers transitioned to remote work with minimal employment disruption.
- **Business formation** surged after summer 2020, particularly in tradeable services (e-commerce, remote services) enabled by the pandemic.

The Opportunity Insights database demonstrated the value of administrative microdata for policy — traditional survey data arrived with lags of months, while the new data tracked weekly fluctuations in real time, enabling faster policy responses.

## Section 6.3: The Great Resignation and Labour Market Tightness (2021–2022)

After the initial collapse, labour markets tightened dramatically by 2021–22. The US vacancy-to-unemployment ratio reached 2:1 — an all-time high in the Beveridge Curve space, suggesting an outward shift (less efficient matching). Contributing factors:

- **Pandemic-induced preferences:** Workers reassessed work-life balance, triggering voluntary quits to seek better matches (high job-to-job transitions).
- **Early retirement:** Older workers who left the labour force during COVID did not return; the participation rate for those 55+ remained below pre-pandemic levels.
- **Child-care constraints:** Persistent school and care disruptions reduced women's participation.

---

# Chapter 7: Post-COVID Inflation and the Labour Market

## Section 7.1: Bernanke and Blanchard (2023) — A Decomposition of Inflation

The 2021–23 inflation surge was extraordinary: the US CPI rose above 9% (year-on-year) in June 2022, the highest in 40 years. Bernanke and Blanchard (2023) estimate a structural model of the US price level to decompose the inflation episode.

**Key findings:**
1. Initial inflation (2021) was driven primarily by **commodity price shocks** (oil, food) and **supply bottlenecks** (semiconductors, shipping) — supply-side shocks that temporarily shifted the short-run aggregate supply curve.
2. The **labour market tightening** of 2021–22 (the vacancy surge) contributed to wage growth and added to inflation but was not the primary initial cause.
3. **Expectations remained anchored** — inflation expectations did not de-anchor as in the 1970s. This meant the wage-price spiral was contained; labour market normalisation (falling vacancy rates in 2022–23) brought wage growth down without a sharp rise in unemployment (a "soft landing").

**Policy implication:** The Fed's rapid rate increases in 2022–23 were effective because anchored expectations prevented a 1970s-style spiral. The Bernanke-Blanchard decomposition suggests central bank credibility — built over decades — was critical.

## Section 7.2: Wage-Price Dynamics

The standard framework treats wage-price dynamics through the **New Keynesian Phillips Curve**:

\[ \pi_t = \pi_t^e + \kappa \hat{y}_t + u_t \]

where \( \pi_t \) is inflation, \( \pi_t^e \) is expected inflation, \( \hat{y}_t \) is the output gap, and \( u_t \) captures cost shocks. Wage Phillips Curves link nominal wage growth to unemployment:

\[ \Delta w_t = \pi_t^e - \gamma (u_t - u^*) + \text{productivity growth} \]

In 2021–22, both the output gap and cost shocks (\( u_t \)) were positive simultaneously — an unusual combination. Bernanke and Blanchard estimate that roughly 40% of peak inflation was attributable to supply bottlenecks and commodity shocks, 30% to the tightness of the labour market, and 30% to the interaction effects.

---

# Chapter 8: The Gender Gap — A Grand Convergence

## Section 8.1: Goldin's Quiet Revolution (2006)

Claudia Goldin (2006, Nobel Prize 2023) characterised the transformation of women's work in the United States over the 20th century as a "quiet revolution" — not a sudden change but a gradual, multi-generational shift driven by rising returns to education, falling discrimination, changing social norms, and technological change in home production.

**Phases of the revolution:**
1. **Pre-1940:** Women's labour force participation was low and concentrated in young, single women. Marriage typically ended employment.
2. **1940s–1960s:** "U-shaped" life-cycle participation emerged as older married women re-entered the labour market, often in clerical occupations.
3. **1970s–1990s:** The shift to anticipatory investment — women began planning careers from adolescence, choosing college majors, delaying marriage, reducing fertility.
4. **Post-1990:** Convergence in educational attainment and occupational choice, with the remaining gap concentrated in hours-intensive occupations.

## Section 8.2: The Last Chapter — Goldin (2014)

Goldin (2014) argues that the remaining gender earnings gap — roughly 18–20% in the US, 12–15% in Canada — is driven not by discrimination within occupations but by the **structure of the labour market**: the non-linear (convex) relationship between earnings and hours in highly paid professional and managerial occupations.

In occupations where a 60-hour week pays more than twice a 30-hour week (law, finance, consulting), workers who cannot commit to long, flexible hours face a disproportionate earnings penalty. Since women disproportionately bear childcare and elder-care responsibilities, they are more likely to work part-time or request schedule flexibility — and pay a wage penalty that exceeds proportional hours differences.

\[ \frac{w_{60}}{w_{30}} > 2 \quad \Rightarrow \quad \text{non-linear returns to hours} \]

**Policy implication:** Equal pay legislation and diversity hiring cannot close the remaining gap if the underlying cause is the structure of hours premiums. Policies that reduce the premium to long hours — subsidised child care, parental leave mandates (including for fathers), technological facilitation of remote work — are more targeted remedies.

## Section 8.3: The Parenthood Penalty

Empirical research using administrative data (Kleven et al., 2019 for Denmark; Schirle and Skuterud for Canada) documents a **child penalty**: earnings fall sharply for women at childbirth but are largely unaffected for men. The gap grows over time as children continue to constrain mothers' hours more than fathers'.

<div class="example">
<strong>Child Penalty Decomposition:</strong> Using an event-study design centred on the birth of the first child, Kleven et al. (2019) find that Danish women's earnings fall by about 20% at childbirth (relative to the counterfactual trend), with the penalty persisting for 10+ years. Danish men's earnings are unaffected. The gap operates through all three margins — participation, hours, and wages — with the earnings-per-hour component being the smallest, confirming that the penalty is primarily a supply-side response to child-rearing demands rather than employer discrimination.
</div>

The persistence of the child penalty across egalitarian Nordic countries suggests it is driven by deep preferences or biological factors (breastfeeding, mother-infant bonding) rather than purely institutional barriers — though generous, well-paid paternity leave (as in Sweden and Quebec) does partially equalise the penalty.
