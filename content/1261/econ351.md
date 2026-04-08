---
title: "ECON 351: Labour Economics"
prof: "Mikal Skuterud"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Benjamin, Dwayne, Morley Gunderson, Thomas Lemieux, Craig Riddell, and Tammy Schirle. *Labour Market Economics*, 9th ed. McGraw-Hill Ryerson, 2021.

**Supplementary texts** — Borjas, George J. *Labor Economics*, 8th ed. McGraw-Hill, 2020. Cahuc, Pierre, Stéphane Carcillo, and André Zylberberg. *Labor Economics*, 2nd ed. MIT Press, 2014.

**Online resources** — MIT OpenCourseWare 14.64 (Labor Economics); Statistics Canada Labour Force Survey (LFS) public use microdata; NBER Working Paper series on labour economics; Borjas *Labor Economics* companion site.

---

# Chapter 1: Introduction to Labour Market Economics

## Section 1.1: Why Labour Markets Are Different

Labour markets differ from markets for ordinary commodities in several important ways:

1. **Workers are people.** The seller of labour retains ownership of the human capital being rented; the "good" traded cannot be repossessed. This creates incentive problems (effort, shirking) that ordinary commodity markets lack.
2. **Social norms and institutions.** Minimum wages, employment standards legislation, collective bargaining, and anti-discrimination law regulate labour transactions in ways that have no counterpart in the market for wheat.
3. **Search and matching frictions.** Jobs and workers are heterogeneous and geographically dispersed; finding a mutually acceptable match takes time and resources.
4. **Long-term relationships.** Unlike spot markets, most labour relationships persist for years, with implicit promises of job security, seniority rights, and internal promotion.

## Section 1.2: Measuring Labour Market Outcomes — Statistics Canada Concepts

Statistics Canada's **Labour Force Survey (LFS)** classifies all civilians aged 15 and older into three mutually exclusive states:

<div class="definition">
<strong>Employed:</strong> Worked for pay or profit in the reference week, or had a job but were absent (on vacation, ill, etc.).
</div>

<div class="definition">
<strong>Unemployed:</strong> Were without work in the reference week, were available for work, and had actively searched for work in the past four weeks.
</div>

<div class="definition">
<strong>Not in the Labour Force:</strong> Neither employed nor meeting all three unemployment criteria — includes full-time students, retirees, discouraged workers, and caregivers.
</div>

Key rates:

\[ \text{Unemployment Rate} = \frac{U}{E + U} \]

\[ \text{Participation Rate} = \frac{E + U}{\text{Working-age population}} \]

\[ \text{Employment Rate} = \frac{E}{\text{Working-age population}} \]

<div class="remark">
<strong>Discouraged Workers:</strong> Individuals who want to work but have stopped searching because they believe no jobs are available. They are counted as <em>not in the labour force</em> rather than unemployed, causing the official unemployment rate to understate labour market slack during recessions. Statistics Canada's R8 measure of "underutilisation" adds discouraged workers and involuntary part-timers to the numerator.
</div>

---

# Chapter 2: Labour Supply — Individual Attachment to the Labour Market

## Section 2.1: The Static Labour-Leisure Model

Each individual chooses how to allocate their time endowment \( T \) between market work \( H \) and leisure \( L = T - H \). Utility depends on consumption \( C \) and leisure \( L \):

\[ \max_{C, L} \; U(C, L) \quad \text{subject to} \quad C = w(T - L) + V \]

where \( w \) is the real wage and \( V \) is non-labour income. The budget constraint can be rewritten using the concept of **full income**:

\[ C + wL = wT + V \equiv I^F \]

Full income is the value of the time endowment plus non-labour income. The slope of the budget constraint in (L, C) space is \( -w \): an hour of leisure sacrificed raises consumption by \( w \).

At the interior optimum:

\[ MRS_{L,C} = \frac{MU_L}{MU_C} = w \]

The marginal rate of substitution of leisure for consumption equals the wage — the individual is indifferent at the margin between an extra hour of leisure and the goods \( w \) could buy.

## Section 2.2: Income and Substitution Effects

A wage increase has two components:

<div class="definition">
<strong>Substitution Effect:</strong> Leisure becomes relatively more expensive (its opportunity cost rises), so the individual substitutes toward consumption and increases hours worked. Always positive for labour supply.
</div>

<div class="definition">
<strong>Income Effect:</strong> Higher wages make the individual richer; if leisure is a normal good, they purchase more leisure and reduce hours worked. Always negative for labour supply.
</div>

The **net** response of hours worked to a wage increase is ambiguous. Empirically:

- **Women (especially married women):** Historically large positive labour supply elasticity, driven by a dominant substitution effect. Labour force participation rose dramatically from the 1960s to 2000s as real wages rose.
- **Men (prime age):** Small or negative labour supply elasticity, reflecting a roughly offsetting income effect.
- **Older workers:** Negative elasticity, consistent with early retirement when wealth increases.

The **backward-bending labour supply curve** (positive slope at low wages, negative at high wages) captures this pattern for a representative worker.

## Section 2.3: Corner Solutions and Participation

When a worker is not participating (\( H = 0 \)), the optimum is at a corner of the budget set. The individual does not work if and only if:

\[ w < w^* \equiv MRS_{L,C}\big|_{H=0} \]

The **reservation wage** \( w^* \) is the minimum wage at which the individual is just willing to enter the labour force. An increase in non-labour income \( V \) raises the reservation wage (income effect), reducing participation. This is the mechanism by which social assistance and welfare programs reduce labour force participation.

## Section 2.4: Household Labour Supply

When two adults share a household, their labour supply decisions interact through joint budget constraints and household production. The **specialisation model** predicts that heterogeneous comparative advantages (e.g., one partner's comparative advantage in home production) lead to one partner specialising in market work and the other in home production — a prediction that matches traditional household patterns but has weakened as the gender wage gap has narrowed.

The **collective model** (Chiappori, 1988) treats the household as the result of efficient bargaining between two individuals with distinct preferences. Each partner's labour supply responds not just to wages but to their bargaining power, proxied by their relative earnings potential or divorce laws.

---

# Chapter 3: Public Policy and Work Incentives

## Section 3.1: The Welfare Participation Decision

Social assistance creates an implicit tax on work through the benefit reduction rate (BRR). If benefits are reduced by \$0.50 for every dollar earned, the effective wage is \( w(1 - 0.50) = 0.50w \), and the budget constraint becomes flatter once the person works.

<div class="example">
<strong>Budget Constraint with Social Assistance:</strong> Consider a person with a weekly time endowment of 100 hours, a market wage of $15/hour, and welfare benefits of $500/week (reduced at a 70% rate once earnings exceed $200/week). The budget constraint has three segments: (1) full welfare at zero hours of work; (2) a kink at $200 earnings where the BRR kicks in; (3) a flatter segment until benefits reach zero. The effective net wage on segment (2) is $15 × (1 − 0.70) = $4.50/hour. Many individuals optimise at the kink point — a <em>poverty trap</em>.
</div>

The labour supply distortion of social assistance can be measured by the **elasticity of employment** with respect to the benefit level. Canadian evidence (Fortin, Truchon, and Beausejour) finds elasticities of −0.3 to −0.6: a 10% increase in welfare benefits reduces employment among eligible groups by 3–6%.

## Section 3.2: Employment Insurance and Work Incentives

Employment Insurance (EI) creates two distortions: reduced search intensity while unemployed (longer unemployment spells) and altered entry and exit from seasonal employment patterns.

**Benefit formula:** EI replaces 55% of insured earnings, up to a maximum of approximately $60,000 in insured earnings per year (2024 values). The minimum qualifying period is typically 420–700 hours of insurable employment, with lower thresholds in high-unemployment regions.

**Empirical evidence on duration:** Canadian studies (Christofides and McKenna, 1996; Fortin and Lacroix, 1997) find that hazard rates out of unemployment spike just before benefits expire — a "spike" consistent with duration dependence induced by EI. Benefit exhaustion concentrates job acceptance, suggesting that EI induces some workers to remain unemployed while benefits are available.

## Section 3.3: Minimum Wages

The minimum wage is a wage floor below which it is illegal to employ workers. In a competitive labour market, a binding minimum wage (set above \( w^* \)) reduces employment and creates a surplus of labour (unemployment):

\[ \text{Employment loss} = L^S(w_{min}) - L^D(w_{min}) \]

But the monopsony model (Section 5.2 below) reverses this prediction — in a market where the employer has wage-setting power, a minimum wage can simultaneously raise wages and increase employment up to the competitive level.

**Card and Krueger (1994):** Their influential study of New Jersey and Pennsylvania fast-food restaurants around New Jersey's 1992 minimum wage increase found no evidence of employment reduction. This launched a literature using "difference-in-differences" designs, exploiting state/province-level variation in minimum wages.

**Dube, Lester, and Reich (2010):** Using county pairs across state borders, found no negative employment effect of minimum wage increases on restaurant employment, with elasticities close to zero. The identification strategy controls for local economic trends that confound simple cross-state comparisons.

---

# Chapter 4: Labour Supply over the Life Cycle

## Section 4.1: Intertemporal Labour Supply

Over a lifetime, a worker allocates time between market work and leisure across many periods. The intertemporal substitution model (MaCurdy, 1981) predicts that workers should work more in periods when wages are high relative to the permanent wage, and take more leisure in periods when wages are low — **intertemporal substitution of labour supply**.

The Euler equation for consumption implies:

\[ \frac{\dot{C}}{C} = r - \rho \]

where \( r \) is the real interest rate and \( \rho \) is the rate of time preference. Consumption grows faster when \( r > \rho \). Analogously, labour supply tilts toward periods of high wages:

\[ \frac{d \ln H_t}{d \ln w_t}\bigg|_{lifetime wealth constant} = \sigma_{LS} > 0 \]

The **Frisch elasticity** \( \sigma_{LS} \) governs intertemporal substitution, holding lifetime wealth constant. Estimated Frisch elasticities range from 0.5 to 1.5 for women and 0.1 to 0.5 for men in most micro studies.

## Section 4.2: Retirement

Retirement is the long-run intertemporal labour supply decision. Workers compare the utility of continued employment (wage income) with the utility of retirement (public pension, private savings, leisure). Public pension parameters — benefit levels, early retirement penalties, delayed retirement credits — directly shift the budget constraint at older ages.

The **Canada Pension Plan (CPP)** provides benefits at age 65 based on career average earnings. Taking benefits at 60 reduces them by 36% (0.6% per month); deferring to 70 raises them by 42%. These adjustments create strong incentives around the standard retirement age.

---

# Chapter 5: Labour Demand

## Section 5.1: Labour Demand in Competitive Markets

A competitive, profit-maximising firm hires labour up to the point where the **value of the marginal product** equals the wage:

\[ w = P \cdot MP_L = VMP_L \]

The firm's labour demand curve is the downward-sloping \( VMP_L \) schedule (given diminishing marginal returns). A rise in the product price \( P \) or an improvement in technology shifts labour demand outward; a rise in the price of a complementary input (e.g., capital for skilled labour) shifts it inward.

### 5.1.1 Elasticity of Labour Demand

The own-wage elasticity of labour demand \( \eta_{LL} < 0 \) governs the employment response to a wage change:

\[ \eta_{LL} = \frac{\partial \ln L}{\partial \ln w} \]

**Hicks-Marshall Rules** describe the determinants of \( |\eta_{LL}| \):

1. The more easily other inputs substitute for labour, the more elastic is labour demand.
2. The more elastic is the product demand, the more elastic is labour demand (scale effect).
3. The larger is labour's share in total cost, the more elastic is labour demand (importance of being unimportant: if labour is a small cost share, wage increases have little effect on price and hence output).
4. The more elastic the supply of complementary inputs, the more elastic is labour demand.

Typical estimates of \( \eta_{LL} \) for the aggregate economy range from −0.3 to −0.5 in the short run and −0.5 to −1.0 in the long run.

## Section 5.2: Monopsony in the Labour Market

<div class="definition">
<strong>Monopsony:</strong> A labour market in which there is a single buyer of labour. The monopsonist faces an upward-sloping labour supply curve: to hire more workers, it must raise the wage for all workers (under uniform wages). The marginal labour cost exceeds the wage: <em>MLC = w + L(dw/dL) > w</em>.
</div>

A monopsonist maximises profit by setting:

\[ VMP_L = MLC > w \]

Employment and wages are both below the competitive level — a double exploitation of workers. The degree of monopsonistic exploitation is measured by the **Pigouvian exploitation index**:

\[ \frac{VMP_L - w}{w} = \frac{1}{\varepsilon_S} \]

where \( \varepsilon_S \) is the elasticity of labour supply to the firm (not the market). When supply to the firm is very elastic (perfect competition), exploitation is zero.

## Section 5.3: Non-Wage Benefits and Quasi-Fixed Costs

Labour costs include more than the wage. **Non-wage benefits** — pensions, extended health, dental, life insurance — are part of total compensation. Their share has grown in Canada from under 10% of payroll in 1960 to over 20% in the 2020s.

**Quasi-fixed costs** are labour costs that do not vary with hours — hiring and training costs, administrative overhead, fixed statutory benefits. Because quasi-fixed costs are spread over more hours when workers work longer, firms facing high quasi-fixed costs prefer longer hours per worker over more workers:

\[ \frac{W \cdot H + F}{H} = W + \frac{F}{H} \downarrow \text{ as } H \uparrow \]

This helps explain why overtime hours are common rather than hiring additional part-time workers, and why mandated benefits may reduce employment by raising quasi-fixed costs.

---

# Chapter 6: Labour Market Equilibrium

## Section 6.1: Competitive Equilibrium with Heterogeneous Labour

When workers differ in skill, the labour market clears at a wage structure that reflects human capital differences. A simple two-skill model has:

- Skilled workers with wage \( w_S \)
- Unskilled workers with wage \( w_U \)
- Skill premium \( \pi = w_S / w_U > 1 \)

The skill premium is determined by the relative supply of and demand for skills. The dramatic rise in the US and Canadian skill premium since the 1980s reflects a skill-biased technological change (SBTC) hypothesis: technology (especially ICT) complements skilled workers and substitutes for routine-task workers.

## Section 6.2: Minimum Wage in Equilibrium

In a competitive labour market with homogeneous workers, a minimum wage \( \bar{w} > w^* \) creates unemployment equal to \( L^S(\bar{w}) - L^D(\bar{w}) \). The total wage bill paid to employed workers may rise or fall depending on whether demand is elastic or inelastic. The welfare analysis shows:

- Workers who remain employed gain (higher wages)
- Workers who lose jobs lose (no employment income)
- Employers lose (higher labour costs)
- Consumers lose (higher product prices)

Net welfare effect depends on the distribution of gains and losses and the weight placed on different groups in the social welfare function.

---

# Chapter 7: Compensating Wage Differentials

## Section 7.1: Theory

<div class="definition">
<strong>Compensating Differential:</strong> A wage premium paid to workers in jobs with unfavourable characteristics — high risk of injury, unpleasant conditions, irregular hours, low job security. Named by Adam Smith (<em>Wealth of Nations</em>, 1776), who identified five sources of inter-occupational wage differences.
</div>

In equilibrium, workers are indifferent across jobs with different characteristics after accounting for compensating differentials. The equilibrium **hedonic wage schedule** \( w(x) \) maps job characteristic \( x \) (e.g., fatality risk) to the equilibrium wage:

\[ \frac{dw}{dx} = \text{marginal willingness to accept compensation for characteristic } x \]

For a negative characteristic (injury risk \( p \)), the hedonic wage schedule slopes upward in \( p \). Workers with lower risk aversion sort into risky jobs and earn the compensating differential; workers with higher risk aversion sort into safe jobs.

## Section 7.2: The Value of a Statistical Life (VSL)

The compensating differential for fatality risk provides an estimate of the **Value of a Statistical Life (VSL)** — the aggregate willingness to pay for a marginal reduction in fatality risk across many workers:

\[ VSL = \frac{dw/dp}{\Delta p} = \frac{\text{wage premium per unit of risk}}{\text{risk increase}} \]

If 1,000 workers each accept a $500/year wage premium to bear a 1/1,000 increase in annual fatality risk, the VSL equals $500 × 1,000 = $500,000. More modern studies using panel data and matched worker-firm datasets find VSL estimates in the range of $5–15 million (2020 USD), forming the empirical foundation for cost-benefit analysis of safety regulations.

<div class="remark">
<strong>Limitations of the compensating differentials model:</strong> The model assumes workers have full information about job risks, can freely move between jobs, and are in a competitive market. Empirical tests face severe omitted variable bias: risky jobs often have lower wages because they disproportionately employ low-skill workers. Correcting for worker heterogeneity typically eliminates or reverses the raw risk-wage correlation, making hedonic estimates sensitive to specification.
</div>

---

# Chapter 8: Human Capital Theory

## Section 8.1: The Becker Framework

<div class="definition">
<strong>Human Capital:</strong> The stock of knowledge, skills, health, and habits that a person possesses and that raise their productive capacity and earnings. Like physical capital, human capital is accumulated through investment (schooling, training) and depreciates over time.
</div>

Becker (1964) formalised human capital as an investment decision: individuals invest in education and training when the present discounted value of the resulting increase in earnings exceeds the cost of investment.

**Investment rule:** Invest in schooling as long as

\[ \sum_{t=s}^{R} \frac{w_t(s+1) - w_t(s)}{(1+r)^{t-s}} \geq C(s) \]

where \( s \) is years of schooling, \( R \) is retirement age, \( r \) is the discount rate, and \( C(s) \) is the direct and opportunity cost of an additional year of school.

## Section 8.2: The Mincer Wage Equation

Jacob Mincer (1974) derived a log-linear wage equation from a simple human capital investment model. The standard Mincer specification is:

\[ \ln w = \alpha + \beta S + \gamma E + \delta E^2 + \varepsilon \]

where \( S \) is years of schooling, \( E \) is years of potential experience, and \( E^2 \) captures the concavity of experience-earnings profiles (earnings grow quickly early in careers, then plateau or decline).

The coefficient \( \beta \) is the **private rate of return to schooling** — an additional year of schooling raises earnings by approximately \( \beta \times 100 \) percent. OLS estimates of \( \beta \) range from 6–10% in most OECD countries.

**Endogeneity problem:** Individuals self-select into education; those with higher ability may earn more regardless of schooling. OLS estimates of \( \beta \) conflate the causal effect of schooling with the correlation between ability and education — **ability bias** likely causes upward bias in OLS.

**Instrumental variable strategies:** Card (1995) uses proximity to college as an instrument for schooling, arguing that students near colleges face lower costs of attending but similar labour market returns. Card finds IV estimates exceeding OLS, suggesting the return to schooling is *higher* for compliers (those whose education is sensitive to distance), consistent with credit-constrained individuals facing a higher marginal return.

## Section 8.3: General vs. Firm-Specific Training

Becker (1964) distinguishes two types of on-the-job training:

<div class="definition">
<strong>General Training:</strong> Raises the worker's productivity at <em>all</em> firms equally. Because competitors would bid away a trained worker, the competitive firm cannot recoup training costs through a lower post-training wage. Therefore, workers pay for general training by accepting a lower wage during training.
</div>

<div class="definition">
<strong>Firm-Specific Training:</strong> Raises the worker's productivity <em>only</em> at the current firm. The trained worker is not more valuable elsewhere, so competitors cannot bid them away. The firm and worker share the costs and returns, creating a bilateral employment rent that reduces turnover and generates long job tenure.
</div>

The sharing of specific training costs and returns is the theoretical foundation for the observation that wages rise with tenure at the current firm even after controlling for experience.

---

# Chapter 9: Discrimination in the Labour Market

## Section 9.1: Empirical Patterns

Labour market discrimination refers to unequal treatment of workers with identical productive characteristics based on race, gender, ethnicity, age, or other protected characteristics. Measuring discrimination requires separating the earnings gap into:

1. **Explained component:** Differences in human capital (education, experience, industry, occupation).
2. **Unexplained component:** The residual wage gap after controlling for observable characteristics — often taken as an upper bound on discrimination.

The **Oaxaca-Blinder decomposition** decomposes the wage gap between groups A and B:

\[ \ln \bar{w}_A - \ln \bar{w}_B = \underbrace{(\bar{X}_A - \bar{X}_B)'\hat{\beta}_B}_{\text{endowments}} + \underbrace{\bar{X}_A'(\hat{\beta}_A - \hat{\beta}_B)}_{\text{coefficients (discrimination)}} \]

The first term attributes the gap to differences in observable characteristics; the second attributes it to different returns to those characteristics — a measure of discrimination if the characteristics are truly productivity-relevant.

## Section 9.2: Becker's Taste-Based Discrimination

Becker (1957) modelled discrimination as a preference. An employer with a **taste for discrimination** against group B behaves as if hiring group B workers costs \( w_B(1 + d) \) rather than \( w_B \), where \( d > 0 \) is the discrimination coefficient. The discriminating employer hires group B only if:

\[ w_B \leq \frac{w_A}{1 + d} \]

In a competitive market, non-discriminating employers earn higher profits by hiring the cheaper group B workers, undercutting discriminating employers and driving them out. Discrimination persists in the long run only if:

- Most employers are discriminating (no non-discriminating entrants)
- There are barriers to entry (regulation, monopsony)
- Employers have market power (can earn long-run profits)

Empirical implication: discrimination should be lower in more competitive industries. Some support for this prediction: wages gaps are larger in regulated sectors.

## Section 9.3: Statistical Discrimination

<div class="definition">
<strong>Statistical Discrimination:</strong> Employers use group membership as a signal of expected productivity because they cannot perfectly observe individual productivity. If employer believes group B has higher variance in productivity or lower average productivity, they may pay all group B members a lower wage even if individual productivity is identical.
</div>

Statistical discrimination is individually rational but collectively inefficient: it creates a self-fulfilling equilibrium where group B members under-invest in human capital because the return is lower (their investment is discounted by the market), which confirms the employer's prior.

## Section 9.4: Gender Wage Gap

The gender wage gap in Canada has narrowed substantially since the 1970s — from about 40% in 1981 to roughly 12–15% today (controlling for hours). Goldin (2014) argues the remaining gap is driven primarily by the differential cost of flexible hours: occupations that reward long, inflexible hours (law, finance, management) pay a disproportionate premium for face-time. Women, who disproportionately bear child-rearing responsibilities, are less able to supply those hours, leading to a gap concentrated among parents.

Policy implications: equal pay legislation addresses wage discrimination; the residual gap linked to hours flexibility requires policies targeting care responsibilities (subsidised child care, paternity leave mandates).

---

# Chapter 10: Trade Unions

## Section 10.1: Union Objectives and Wage-Employment Trade-Off

A union with monopoly power in the labour market chooses wages to maximise member welfare, taking the employer's labour demand curve as given. Two polar models:

<div class="definition">
<strong>Monopoly Union Model:</strong> The union sets the wage to maximise total utility of members, and the employer chooses employment along its labour demand curve. The union faces a wage-employment trade-off: higher wages raise the wage per employed member but reduce employment.
</div>

If the union maximises the **rent** accruing to employed workers \( (w - \bar{w}) \cdot L \), the optimal wage satisfies:

\[ \frac{w - \bar{w}}{w} = -\frac{1}{\eta_{LL}} \]

This mirrors the Lerner monopoly pricing formula, with \( \bar{w} \) as the "cost" (opportunity wage) and \( \eta_{LL} \) as the demand elasticity.

<div class="definition">
<strong>Efficient Contracts Model:</strong> Rather than letting the employer set employment after the union sets the wage, both parties bargain over a wage-employment bundle. Efficient contracts lie on the contract curve where the union's and employer's indifference curves are tangent. Efficient contracts yield higher wages <em>and</em> higher employment than the monopoly union model — Pareto improvements are possible.
</div>

## Section 10.2: Union Wage Premium

Unions raise the wages of their members. Cross-sectional estimates of the union wage premium in Canada range from 10–20%, but OLS likely overstates the causal effect because unions organise workers with lower wages in the absence of unionisation. Panel estimates using worker fixed effects find smaller premiums of 5–15%.

Unions also compress the wage distribution: wages are more equal within the union sector (pay equity across skills) and the union threat effect may compress wages in the non-union sector as non-union employers raise wages to prevent organising.

---

# Chapter 11: Unemployment

## Section 11.1: Types of Unemployment

<div class="definition">
<strong>Frictional Unemployment:</strong> Arises from the time required for workers and jobs to be matched. Even in a healthy economy with plentiful jobs, workers spend time searching for the best match. Frictional unemployment is efficient up to the point where the marginal cost of additional search equals the marginal benefit.
</div>

<div class="definition">
<strong>Structural Unemployment:</strong> Arises from a mismatch between the skills workers have and the skills employers need, or between geographic locations of workers and jobs. The decline of manufacturing in Canada's industrial heartland created structural unemployment among workers with industry-specific skills.
</div>

<div class="definition">
<strong>Cyclical Unemployment:</strong> Arises from insufficient aggregate demand during recessions. Keynesian in origin — nominal wage rigidity prevents the labour market from clearing during demand shortfalls.
</div>

**Natural rate of unemployment (NAIRU):** The unemployment rate consistent with stable inflation, comprising frictional and structural components. In Canada, the natural rate is estimated at approximately 5–6%.

## Section 11.2: Search Theory

Job search models (Mortensen, 1970; McCall, 1970) treat unemployment as an optimal stopping problem. A worker samples wage offers \( w \) from a known distribution \( F(w) \) and must decide each period whether to accept the current offer or continue searching.

The optimal strategy is a **reservation wage rule**: accept any offer with \( w \geq w^R \) and reject otherwise. The reservation wage satisfies the asset-value equation:

\[ r w^R = b + \lambda \int_{w^R}^{\infty} (w - w^R) dF(w) \]

where \( r \) is the discount rate, \( b \) is the flow value of unemployment (UI benefits plus home production), and \( \lambda \) is the arrival rate of job offers.

Comparative statics:
- Higher \( b \) (more generous UI) raises \( w^R \), lengthening unemployment spells — the moral hazard cost of EI.
- Higher \( \lambda \) (more frequent offers) raises \( w^R \) but reduces expected spell duration — the labour market tightness effect.

## Section 11.3: Efficiency Wages

<div class="definition">
<strong>Efficiency Wage:</strong> A wage paid above the market-clearing level to elicit effort, reduce turnover, or attract higher-quality workers. The firm voluntarily pays a premium because the resulting productivity gain exceeds the cost.
</div>

In the **shirking model** (Shapiro and Stiglitz, 1984), workers choose between working and shirking. Detected shirkers are fired and must search for another job at the market wage. The no-shirking condition requires:

\[ w \geq \bar{w} + \frac{(r + q)e}{p} \]

where \( \bar{w} \) is the market wage, \( q \) is the separation rate, \( e \) is the effort cost, and \( p \) is the detection probability. Firms pay efficiency wages to deter shirking; in equilibrium, all firms pay above-market wages and equilibrium unemployment exists to make firing credible.

Efficiency wages provide a microeconomic foundation for **wage rigidity** — wages do not fall to clear the labour market because the wage level disciplines worker effort.
