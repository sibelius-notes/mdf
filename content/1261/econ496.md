---
title: "ECON 496: Advanced Macroeconomics"
prof: "Derek Stacey"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Lecture slides and notes by Derek Stacey (University of Waterloo, Winter 2026), posted on LEARN.

**Supplementary texts** — Pissarides, C.A., *Equilibrium Unemployment Theory*, 2nd ed. (MIT Press, 2000); Mortensen, D.T. & Pissarides, C.A., "Job Creation and Job Destruction in the Theory of Unemployment," *Review of Economic Studies* 61 (1994); Romer, D., *Advanced Macroeconomics*, 4th ed. (McGraw-Hill, 2012), Ch. 10–11.

**Key papers (search-and-matching literature):**
- Stigler, G.J. (1961), "The Economics of Information," *Journal of Political Economy* 69(3): 213–225.
- McCall, J.J. (1970), "Economics of Information and Job Search," *Quarterly Journal of Economics* 84(1): 113–126.
- Burdett, K. & Judd, K.L. (1983), "Equilibrium Price Dispersion," *Econometrica* 51(4): 955–969.
- Mortensen, D.T. & Pissarides, C.A. (1994), "Job Creation and Job Destruction in the Theory of Unemployment," *Review of Economic Studies* 61(3): 397–415.
- Pissarides, C.A. (2000), *Equilibrium Unemployment Theory*, 2nd ed.
- Moen, E.R. (1997), "Competitive Search Equilibrium," *Journal of Political Economy* 105(2): 385–411.
- Shimer, R. (1998), "Mismatch," *American Economic Review* 88(2): 1–5.
- Butters, G.R. (1977), "Equilibrium Distributions of Sales and Advertising Prices," *Review of Economic Studies* 44(3): 465–491.
- Burdett, K., Shi, S. & Wright, R. (2001), "Pricing and Matching with Frictions," *Journal of Political Economy* 109(5): 1060–1085.

**Online resources** — MIT OCW 14.452 (Advanced Macroeconomics); Princeton Graduate Macro notes (Moll, Violante); Chicago Booth Labor/Macro reading group materials; NBER Working Paper series.

---

# Chapter 1: Mathematical Preliminaries

## 1.1 Probability Theory for Search Models

Search-and-matching models are built on probability theory. This chapter reviews the essential toolkit.

### 1.1.1 Random Variables and Distributions

A random variable \( X \) is characterised by its cumulative distribution function (CDF) \( F(x) = \Pr(X \leq x) \). For a continuous random variable, the probability density function (PDF) is \( f(x) = F'(x) \). The expectation is:

\[ E[X] = \int_{-\infty}^\infty x \, f(x) \, dx \]

In wage-posting models, wages are drawn from a distribution \( F(w) \) over a support \( [\underline{w}, \bar{w}] \). A worker sampling from this distribution forms expectations of the wage offer and compares each realisation to their reservation wage.

### 1.1.2 Order Statistics and the Maximum of a Sample

If \( w_1, \ldots, w_n \) are independent draws from \( F(w) \), the maximum \( M_n = \max\{w_1, \ldots, w_n\} \) has CDF:

\[ F_{M_n}(w) = \left[ F(w) \right]^n \]

This is central to Stigler's analysis: a worker sampling \( n \) offers takes the best (maximum), and the expected value of the best offer increases with \( n \), but at a diminishing rate.

### 1.1.3 Poisson Processes

Many search models use Poisson processes to model the arrival of job offers. A Poisson process with arrival rate \( \lambda \) generates:
- Expected number of arrivals in interval \( [0,t] \): \( \lambda t \)
- Probability of exactly \( k \) arrivals in \( [0,t] \): \( e^{-\lambda t}(\lambda t)^k / k! \)
- Probability of at least one arrival in \( [0,t] \): \( 1 - e^{-\lambda t} \)

In the McCall model, job offers arrive at Poisson rate \( \lambda \), with each offer drawn independently from \( F(w) \).

### 1.1.4 Discounted Cash Flow Valuation

The present value of a stream of payments \( \{x_t\}_{t=0}^\infty \) discounted at rate \( r \) is:

\[ PV = \int_0^\infty e^{-rt} x_t \, dt \quad \text{(continuous time)} \]

\[ PV = \sum_{t=0}^\infty \frac{x_t}{(1+r)^t} = \sum_{t=0}^\infty \beta^t x_t \quad \text{(discrete time, } \beta = 1/(1+r)\text{)} \]

The value of a permanent flow of \( x \) per period is:

\[ PV = \frac{x}{r} \quad \text{(continuous time)} \quad \text{or} \quad PV = \frac{x}{1-\beta} \quad \text{(discrete time)} \]

These formulas are ubiquitous in search models when computing the value of being employed at wage \( w \).

---

# Chapter 2: One-Sided Consumer Search

## 2.1 Stigler (1961): The Economics of Information

### 2.1.1 Motivation and Setup

George Stigler's 1961 paper launched the economics of search. The central observation is that buyers (or workers) face price (or wage) dispersion in markets, and acquiring information about prices is costly. How many quotes should a buyer obtain?

Consider a buyer who observes prices drawn independently from a distribution \( F(p) \) over \( [\underline{p}, \bar{p}] \). The buyer samples \( n \) sellers and purchases from the cheapest. Each sample costs \( c > 0 \). The buyer chooses \( n \) to minimise expected total cost: the expected minimum price plus search costs.

Expected minimum price from \( n \) draws:

\[ E[\min\{p_1,\ldots,p_n\}] = \int_{\underline{p}}^{\bar{p}} p \cdot n \left[1 - F(p)\right]^{n-1} f(p) \, dp \]

As \( n \) increases by one, the expected savings in price (the marginal benefit of search) diminish. The marginal cost of search is a constant \( c \). The optimal sample size \( n^* \) balances marginal benefit and marginal cost.

<div class="theorem">
<strong>Stigler's Optimal Sample:</strong> The consumer searches until the expected marginal gain from one additional price quote equals the cost of obtaining it. Because the expected gain is decreasing in \( n \) while the cost is constant, there is a unique interior optimum \( n^* \). Equilibrium price dispersion can persist precisely because search is costly — sellers face downward-sloping demand rather than the perfectly elastic demand of frictionless competition.
</div>

### 2.1.2 Key Implications

Stigler's framework has several important implications:

1. **Dispersion is an equilibrium outcome.** Because sampling is costly, not all buyers observe all prices, so sellers with higher prices still attract buyers. Price dispersion is a natural feature of markets with search frictions, not a sign of irrationality.

2. **Diminishing returns to search.** The value of information has diminishing returns: the first price quote is highly valuable (it establishes a reference point), but the \( n \)-th is worth very little (the minimum of a large sample changes little with an additional observation).

3. **Heterogeneous search intensity.** Buyers who purchase frequently have a higher payoff to search (since they benefit from the lower price on every unit), so they sample more intensively. This predicts that experienced buyers face lower prices than occasional buyers — consistent with empirical evidence in housing, insurance, and labour markets.

<div class="remark">
<strong>Limitation of Stigler's Model:</strong> Stigler assumed a fixed sample size chosen upfront. McCall (1970) and later authors showed that sequential search — where the searcher decides after each draw whether to stop or continue — is strictly preferable and generates a simpler decision rule (the reservation wage).
</div>

## 2.2 McCall (1970): Sequential Job Search and the Reservation Wage

### 2.2.1 The Search Environment

McCall's model formalises optimal sequential job search. An unemployed worker receives one wage offer per period, drawn independently from a distribution \( F(w) \) with support \( [\underline{w}, \bar{w}] \). If the worker accepts wage \( w \), they receive \( w \) per period forever (no on-the-job search, no layoffs). If the worker rejects the offer, they receive unemployment benefit \( b \) this period and draw a new offer next period. The worker discounts the future at rate \( \beta \in (0,1) \).

### 2.2.2 Bellman Equations

Let \( V_e(w) \) be the value of employment at wage \( w \) and \( V_u \) be the value of unemployment. Employment is an absorbing state (no separation), so:

\[ V_e(w) = w + \beta V_e(w) \implies V_e(w) = \frac{w}{1-\beta} \]

The unemployed worker receives benefit \( b \) and draws a wage offer \( w' \). They accept if \( V_e(w') > V_u \) and reject otherwise:

\[ V_u = b + \beta \int_{\underline{w}}^{\bar{w}} \max\left\{V_e(w'), V_u\right\} \, dF(w') \]

This is the Bellman equation for the value of unemployment.

<div class="definition">
<strong>Reservation Wage:</strong> The reservation wage \( w^* \) is defined by the indifference condition \( V_e(w^*) = V_u \). The optimal strategy is to accept any offer with \( w \geq w^* \) and reject any offer with \( w < w^* \). Since \( V_e(w) = w/(1-\beta) \) is increasing in \( w \), the reservation wage strategy is optimal — it is never better to accept a lower wage today and wait for a higher one later.
</div>

### 2.2.3 Solving for the Reservation Wage

Since \( V_u = w^*/(1-\beta) \) at the reservation wage, the Bellman equation becomes:

\[ \frac{w^*}{1-\beta} = b + \beta \int_{\underline{w}}^{\bar{w}} \max\left\{\frac{w'}{1-\beta}, \frac{w^*}{1-\beta}\right\} dF(w') \]

Simplifying:

\[ \frac{w^*}{1-\beta} = b + \frac{\beta}{1-\beta}\left[ w^* + \int_{w^*}^{\bar{w}} (w' - w^*) \, dF(w') \right] \]

Rearranging yields the implicit equation for the reservation wage:

\[ w^* = b(1-\beta) + \beta \int_{w^*}^{\bar{w}} (w' - w^*) \, dF(w') + \beta w^* \]

\[ w^*(1-\beta) = b(1-\beta) + \beta \int_{w^*}^{\bar{w}} (w' - w^*) \, dF(w') \]

Or equivalently:

\[ w^* - b = \frac{\beta}{1-\beta} \int_{w^*}^{\bar{w}} (w - w^*) \, dF(w) \]

The left side is the opportunity cost of one more period of search (foregone benefit \( b \)); the right side is the expected discounted gain from searching one more period (the option value of search).

<div class="theorem">
<strong>McCall Comparative Statics:</strong>
<ul>
<li><strong>Higher UI benefits (\( b \uparrow \)):</strong> The reservation wage \( w^* \) rises. Workers become more selective; unemployment duration increases. This is the moral hazard effect of unemployment insurance.</li>
<li><strong>Higher discount factor (\( \beta \uparrow \)):</strong> Workers are more patient, raise \( w^* \), and wait longer for better offers.</li>
<li><strong>Greater wage dispersion:</strong> Higher variance of \( F(w) \) (mean-preserving spread) raises the option value of search and thus raises \( w^* \) and unemployment duration.</li>
<li><strong>Higher offer arrival rate:</strong> In the Poisson version, a higher \( \lambda \) means offers arrive more frequently; the cost of search (foregone wages per unit time) stays fixed while the option value of search falls, <em>reducing</em> \( w^* \). More offers per period makes search less valuable at the margin.</li>
</ul>
</div>

### 2.2.4 Continuous-Time Version

In continuous time with Poisson offer arrivals at rate \( \lambda \) and discount rate \( r \):

\[ r V_u = b + \lambda \int_{w^*}^{\bar{w}} (V_e(w) - V_u) \, dF(w) \]

Since \( V_e(w) = w/r \), this becomes:

\[ r V_u = b + \lambda \int_{w^*}^{\bar{w}} \left(\frac{w}{r} - V_u\right) dF(w) \]

At the reservation wage \( r V_u = w^* \):

\[ w^* = b + \frac{\lambda}{r} \int_{w^*}^{\bar{w}} (w - w^*) \, dF(w) \]

This is the continuous-time analogue: the flow value of unemployment equals the flow benefit \( b \) plus the expected capital gain from receiving an acceptable offer.

---

# Chapter 3: Noisy Search and Price Dispersion

## 3.1 Burdett and Judd (1983): Equilibrium Price Dispersion

### 3.1.1 The Diamond Paradox and Its Resolution

A major puzzle in search economics is the Diamond paradox (Diamond 1971): with sequential search and positive search costs, the unique equilibrium has all firms charging the monopoly price — there is no price dispersion in equilibrium. The reasoning is a backward-induction argument: if there were any dispersion, consumers would search until they found the lowest-price firm, but then firms would undercut each other to attract those consumers, unravelling any equilibrium with price dispersion.

Burdett and Judd (1983) resolve this paradox by allowing consumers to sample more than one price simultaneously (noisy search). The key insight is that when some consumers compare multiple prices and others do not, firms face a non-trivial trade-off: a lower price attracts both consumers who sample only you and consumers who are comparing you to a competitor, while a higher price extracts more surplus from consumers who sampled only one firm.

### 3.1.2 The Model

There is a unit mass of consumers and a large number of identical firms (each producing at zero marginal cost). Each consumer independently samples either 1 firm (with probability \( \mu_1 \)) or 2 firms (with probability \( \mu_2 = 1 - \mu_1 \)) and buys from the cheapest firm sampled.

A firm charging price \( p \) sells to:
- Every single-sampling consumer who drew this firm: their demand is \( \mu_1 / N \) where \( N \) is the number of firms (large).
- Every two-sampling consumer who drew this firm and no cheaper alternative: probability \( [1 - F(p)] \) per competitor draws higher.

In a symmetric equilibrium, all firms randomise over a price distribution \( F(p) \). A firm must earn equal profit at every price in the support — otherwise it would deviate. This equal-profit condition pins down the equilibrium \( F(p) \).

<div class="theorem">
<strong>Burdett-Judd Equilibrium:</strong> When \( \mu_1 > 0 \) and \( \mu_2 > 0 \), there exists a unique mixed-strategy equilibrium in which firms randomise over prices on a continuous interval \( [\underline{p}, \bar{p}] \) with \( \underline{p} < \bar{p} \). Price dispersion exists in equilibrium — the Diamond paradox is resolved because firms with heterogeneous customer types face a genuine trade-off between margin and volume.
</div>

---

# Chapter 4: Two-Sided Random Search — The DMP Model

## 4.1 Overview of the Diamond-Mortensen-Pissarides Framework

The Diamond-Mortensen-Pissarides (DMP) model is the foundation of modern equilibrium unemployment theory, earning Mortensen and Pissarides the 2010 Nobel Prize (jointly with Diamond). It is a two-sided search model: both workers and firms search for each other, and meetings occur randomly via a matching function. Wages are determined by Nash bargaining after a meeting.

The model provides a coherent framework for understanding unemployment, vacancies, and wages simultaneously.

## 4.2 The Matching Function

The aggregate matching function \( M(u, v) \) gives the flow of new matches as a function of the mass of unemployed workers \( u \) and the mass of open vacancies \( v \):

\[ M = M(u, v) = \mu \, u^\alpha v^{1-\alpha}, \quad \alpha \in (0,1) \]

This Cobb-Douglas form satisfies the standard properties: constant returns to scale (CRS), increasing in both arguments, concavity.

Define labour market tightness:

\[ \theta = \frac{v}{u} \]

A higher \( \theta \) means a tighter labour market — more vacancies relative to unemployed workers. The job-finding rate for workers and the vacancy-filling rate for firms are:

\[ p(\theta) = \frac{M(u,v)}{u} = \mu \theta^{1-\alpha} \quad \text{(job-finding rate, increasing in } \theta\text{)} \]

\[ q(\theta) = \frac{M(u,v)}{v} = \mu \theta^{-\alpha} \quad \text{(vacancy-filling rate, decreasing in } \theta\text{)} \]

<div class="definition">
<strong>Labour Market Tightness:</strong> \( \theta = v/u \) summarises the state of the labour market. A higher \( \theta \) (tighter market) benefits workers (higher job-finding rate \( p(\theta) \)) but hurts firms (lower vacancy-filling rate \( q(\theta) \)).
</div>

## 4.3 Asset Values and Bellman Equations

Let all agents discount the future at rate \( r \). Jobs are destroyed at exogenous Poisson rate \( s > 0 \). Each filled job produces output \( y \) and pays wage \( w \) (determined by bargaining). Posting a vacancy costs flow \( \kappa > 0 \).

### 4.3.1 Worker Value Functions

Let \( V_e \) be the value of employment and \( V_u \) be the value of unemployment (receiving flow benefit \( b \)). In continuous time:

\[ r V_e = w + s(V_u - V_e) \]

\[ r V_u = b + p(\theta)(V_e - V_u) \]

The first equation says: the flow return on employment equals the wage plus the expected capital loss from job destruction (rate \( s \), loss \( V_e - V_u \)). The second says: the flow return on unemployment equals \( b \) plus the expected capital gain from finding a job (rate \( p(\theta) \), gain \( V_e - V_u \)).

Equivalently, using the Bellman equation form:

\[ r V_u = b + \lambda(\theta)\left[ V_e - V_u \right] \]

where \( \lambda(\theta) \equiv p(\theta) \) is the contact rate.

### 4.3.2 Firm Value Functions

Let \( J_f \) be the value of a filled job and \( J_v \) be the value of a vacancy:

\[ r J_f = (y - w) + s(J_v - J_f) \]

\[ r J_v = -\kappa + q(\theta)(J_f - J_v) \]

**Free entry:** In equilibrium, firms post vacancies until profits are driven to zero. If \( J_v = 0 \) (which holds in steady state with free entry), then:

\[ q(\theta) J_f = \kappa \]

Substituting \( r J_f = y - w - s J_f \) (from the filled-job equation with \( J_v = 0 \)):

\[ J_f = \frac{y - w}{r + s} \]

The job creation (JC) condition becomes:

\[ \frac{y - w}{r + s} = \frac{\kappa}{q(\theta)} \]

<div class="theorem">
<strong>Job Creation Condition:</strong>
\[ \frac{y - w}{r + s} = \frac{\kappa}{q(\theta)} \]
This equates the value of a filled job (present value of the profit flow) to the cost of creating it (expected cost of vacancy posting, where \( \kappa/q(\theta) \) is the expected time-to-fill times cost per period). It pins down the equilibrium relationship between \( w \) and \( \theta \): higher wages reduce job creation, lowering \( \theta \) (a looser market for workers).
</div>

## 4.4 Nash Bargaining over Wages

Workers and firms divide the match surplus \( S = J_f + (V_e - V_u) \) — the total gain from the match over the next best alternatives. Nash bargaining allocates the surplus according to the worker's bargaining power \( \beta \in (0,1) \):

\[ V_e - V_u = \beta S = \beta \left[ J_f + (V_e - V_u) \right] \]

\[ J_f = (1-\beta) S \]

The Nash bargaining wage satisfies:

\[ \beta J_f = (1-\beta)(V_e - V_u) \]

Substituting the asset values and solving for \( w \):

\[ w = (1-\beta)b + \beta(y + \kappa\theta) \]

<div class="theorem">
<strong>Wage Equation:</strong> The bargained wage \( w = (1-\beta)b + \beta(y + \kappa\theta) \) is a weighted average of the worker's outside option (\( b \), the unemployment benefit) and the firm's productivity net of recruiting costs (\( y + \kappa\theta \)). Higher tightness \( \theta \) raises wages because workers have better outside options — they find jobs faster. Higher \( \beta \) gives workers a larger share of the surplus.
</div>

## 4.5 The Beveridge Curve

The Beveridge curve describes the steady-state relationship between vacancies and unemployment. In steady state, flows into unemployment (job destruction) equal flows out (job finding):

\[ s(1-u) = p(\theta) u \]

Solving for \( u \):

\[ u = \frac{s}{s + p(\theta)} \]

This is the Beveridge curve: for a given \( \theta \), the unemployment rate is determined by the separation rate \( s \) and the job-finding rate \( p(\theta) = \mu\theta^{1-\alpha} \). A higher \( \theta \) (more vacancies per unemployed worker) reduces unemployment — the Beveridge curve slopes downward in \( (u, v) \) space.

<div class="example">
<strong>Beveridge Curve Shifts:</strong> The curve shifts outward (more vacancies needed for the same unemployment rate) when structural mismatch increases — for instance, when the sectoral composition of job openings diverges from the composition of unemployed workers' skills. After the 2008 financial crisis, the US Beveridge curve appeared to shift outward, suggesting structural as well as cyclical unemployment.
</div>

## 4.6 Equilibrium and Efficiency

The equilibrium is characterised by the pair \( (w, \theta) \) solving simultaneously the JC condition and the wage equation. Graphically, the JC curve is downward-sloping in \( (w, \theta) \) space (higher wages reduce vacancy posting, so equilibrium tightness falls), and the wage equation is upward-sloping (higher tightness gives workers better outside options, raising wages). The intersection gives the unique equilibrium.

### 4.6.1 The Hosios Condition

The decentralised DMP equilibrium is generally inefficient because of a search externality: each firm ignores the fact that posting a vacancy congests the market for other firms (reduces \( q(\theta) \)), and each worker ignores that their presence in the pool congests the market for other workers.

The efficiency condition — due to Hosios (1990) — requires that the worker's bargaining power \( \beta \) equal the elasticity of the matching function with respect to unemployment \( \alpha \):

\[ \beta = \alpha \]

When this holds, the private returns to job search and vacancy posting exactly equal the social returns, and the decentralised equilibrium achieves the social optimum. When \( \beta \neq \alpha \), the economy either under- or over-creates jobs.

<div class="theorem">
<strong>Hosios Condition for Efficiency:</strong> The decentralised equilibrium is constrained efficient if and only if \( \beta = \alpha \), where \( \beta \) is the worker's Nash bargaining share and \( \alpha \) is the elasticity of the matching function with respect to unemployment. This is a knife-edge condition; in general, the search equilibrium involves externalities that can justify active labour market policy.
</div>

---

# Chapter 5: Two-Sided Directed Search

## 5.1 Moen (1997): Competitive Search Equilibrium

### 5.1.1 Limitations of Random Search with Nash Bargaining

In the DMP model, wages are determined after a match by Nash bargaining. This creates a hold-up problem: because the wage is set after the vacancy is posted and the worker is found, neither party can fully commit to the terms of the match at the time the search investment is made. Firms may under-invest in vacancy posting relative to the social optimum (unless the Hosios condition holds by coincidence).

Moen (1997) proposes an alternative: what if firms post wages before search occurs, and workers direct their search toward the most attractive postings?

### 5.1.2 The Directed Search Framework

In Moen's model, firms post wages \( w \) in advance. Workers observe all posted wages and choose which submarket (defined by a posted wage) to enter. Within each submarket, matching is random — there is a local matching function. In equilibrium, workers must be indifferent across submarkets (otherwise all would flock to the best-paying), pinning down the tightness \( \theta(w) \) as a function of the posted wage.

The key relationship is the market-utility curve: for a worker to be indifferent between submarkets with different wage-tightness combinations \( (w, \theta)  \), their expected value must be equal:

\[ \frac{p(\theta) w}{r + s + p(\theta)} = \bar{U} \]

where \( \bar{U} \) is the equilibrium worker utility. Higher wages attract more workers (lower tightness per worker), while higher tightness makes it harder to fill vacancies.

A firm chooses \( w \) to maximise its expected profit, taking \( \bar{U} \) as given (a competitive externality). The optimal wage equates the marginal benefit of a higher wage (attracting more applications, filling the vacancy sooner) to the marginal cost (lower per-period profit once the job is filled).

### 5.1.3 The Efficiency of Competitive Search

<div class="theorem">
<strong>Moen (1997) — Efficiency of Competitive Search:</strong> In the competitive search equilibrium, the Hosios condition is satisfied endogenously. The decentralised equilibrium achieves the social planner's allocation without requiring any particular relationship between \( \beta \) and \( \alpha \). The commitment power of posting wages in advance internalises the externalities that create inefficiency in the DMP model.
</div>

The intuition is that by posting wages competitively, firms endogenously choose the \( (w, \theta) \) combination that maximises total surplus subject to delivering workers their equilibrium utility \( \bar{U} \). This is exactly what the social planner would choose.

### 5.1.4 Wage Posting vs. Nash Bargaining

The directed search model has several empirical advantages over Nash bargaining:
- It generates a cleaner mapping from economic fundamentals to wages (wages are not just a function of bargaining power).
- It is consistent with wage posting institutions observed in many labour markets (job boards, salary offers).
- It can be extended to allow wage dispersion across firms, providing a tractable model of firm-level wage heterogeneity.

## 5.2 Shimer (1998): Mismatch in Directed Search

### 5.2.1 Heterogeneity and Mismatch

Shimer (1998) extends directed search to allow for worker and job heterogeneity. In the real world, there are many types of workers (different skills, locations, experience) and many types of jobs (different industries, occupation requirements). Even when aggregate vacancies and unemployed workers are plentiful, unemployment can remain high if workers and jobs are systematically mismatched.

In Shimer's model, there are multiple types of workers and firms. Each type defines a submarket. In competitive search equilibrium, each submarket has its own market-tightness and wage pair \( (\theta_k, w_k) \). Workers direct their search to the submarket that maximises their expected return.

### 5.2.2 The Shimer Puzzle

Shimer (2005) raises a separate but related challenge to the DMP model: when calibrated to match average US labour market statistics (mean unemployment duration, vacancy filling rates, job finding rates), the model generates far too little volatility in unemployment and wages in response to aggregate productivity shocks. Specifically:

- The data shows that the standard deviation of vacancies is about 10 times larger than the standard deviation of productivity.
- The calibrated DMP model generates only about one-tenth of observed vacancy and unemployment volatility.

This is the Shimer puzzle. The problem arises because Nash bargaining absorbs all productivity shocks into wages, leaving little variation in the value of vacancies and hence little volatility in vacancy posting.

<div class="remark">
<strong>Proposed Resolutions to the Shimer Puzzle:</strong> Several mechanisms have been proposed to amplify the DMP model's response to shocks:
<ul>
<li><strong>Wage rigidity:</strong> Hall (2005) shows that if wages are somewhat rigid (e.g., set by long-term norms), productivity shocks feed more into job creation rather than wages, restoring volatility.</li>
<li><strong>Large firm models:</strong> Models with large firms that hire multiple workers generate different bargaining dynamics.</li>
<li><strong>On-the-job search:</strong> Allowing employed workers to search amplifies the effect of shocks on wages and employment.</li>
</ul>
</div>

---

# Chapter 6: Coordination Frictions and Market Congestion

## 6.1 Butters (1977): Urn-Ball Matching and Price Dispersion

### 6.1.1 The Urn-Ball Model

Butters (1977) is one of the earliest directed search models, using a Poisson urn-ball matching process. The setup involves firms sending price advertisements (or wage offers) to workers. Each advertisement is directed randomly — each of the \( L \) workers is equally likely to receive any given advertisement.

If there are \( M \) advertisements in total and \( L \) workers, the probability that a given worker receives at least one advertisement is:

\[ \Pr(\text{at least one ad}) = 1 - \left(1 - \frac{1}{L}\right)^M \approx 1 - e^{-M/L} \]

where the approximation uses the law of large numbers as \( L \to \infty \). Let \( a = M/L \) be the ratio of advertisements to workers (ads per worker). The probability a worker receives at least one ad is \( 1 - e^{-a} \).

### 6.1.2 Equilibrium Price Distribution

Butters derives an equilibrium distribution of advertised prices. The key observation is that a firm setting a higher price earns more per sale but faces more competition (workers receiving multiple ads will choose the lowest-priced offer). In equilibrium, all prices in the support earn equal expected profit, which pins down the equilibrium price distribution.

This generates a non-degenerate equilibrium price distribution — price dispersion is an equilibrium outcome. Butters' model is an early demonstration that directed search (firms sending ads to workers) combined with coordination frictions (workers receiving multiple ads) generates rich price dispersion.

## 6.2 Burdett, Shi, and Wright (2001): Pricing and Matching with Frictions

### 6.2.1 Market Congestion in Two-Sided Search

Burdett, Shi, and Wright (2001) develop a model that unifies the insights of Butters (1977) and the competitive search literature. There are \( B \) buyers (workers) and \( S \) sellers (firms). Each seller posts a price \( p \) (wage). Buyers direct their applications to sellers based on posted prices.

The matching process is urn-ball: each buyer applies to one seller, and each seller serves at most one buyer (capacity constraint). If \( n \) buyers apply to the same seller, the seller picks one randomly. The matching probability for a buyer who applies to a seller with \( \theta' \) buyers per seller is \( 1/\theta' \), and the seller's probability of matching with at least one buyer is \( 1 - e^{-\theta'} / \theta' \) (using Poisson approximation).

### 6.2.2 Equilibrium Characterisation

In equilibrium, buyers are indifferent across sellers, so all seller-specific submarkets deliver the same buyer utility \( \bar{u} \). A seller posting price \( p \) attracts a queue length \( \theta(p) \) solving:

\[ \frac{p \cdot (1/\theta(p))}{1} = \bar{u} \implies p = \bar{u} \cdot \theta(p) \]

Higher prices attract fewer applicants (lower \( \theta(p) \)); lower prices attract more. Sellers trade off margin against queue length.

<div class="theorem">
<strong>Burdett-Shi-Wright Equilibrium:</strong> When the capacity constraint binds (sellers can serve only one buyer), there is a unique symmetric equilibrium in which all sellers post the same price and attract the same queue length. This "directed search" equilibrium is efficient — it achieves the social planner's allocation — because each seller internalises the congestion they impose on other sellers when setting their price.
</div>

### 6.2.3 Price Dispersion with Heterogeneous Sellers

When sellers are heterogeneous (e.g., different productivities), the equilibrium features price dispersion. More productive sellers post higher wages (to attract longer queues and fill their position faster), while less productive sellers post lower wages (to attract fewer applicants at higher margin). This generates a positive relationship between seller productivity and posted wages — consistent with empirical evidence from employer-employee matched datasets.

---

# Chapter 7: Applications — Structural Estimation and Calibration

## 7.1 From Theory to Data

A distinctive feature of ECON 496 is the emphasis on applying search models to data through calibration and structural estimation. This section outlines the methodology.

### 7.1.1 Calibration

Calibration involves choosing model parameters to match specific moments (averages) observed in the data, without formal statistical estimation. The typical approach for DMP models:

1. Choose the functional form of the matching function (e.g., Cobb-Douglas with elasticity \( \alpha \)).
2. Set \( \alpha \) to match the labour share in matching (e.g., 0.5 as in much of the literature, or estimated from microdata).
3. Set the separation rate \( s \) to match observed average job destruction rates (e.g., from JOLTS data in the US or LFS in Canada).
4. Choose \( r \) from financial data (e.g., short-term real interest rate).
5. Set vacancy cost \( \kappa \) and matching efficiency \( \mu \) to match average unemployment rate and vacancy-filling rate.
6. Check the model's implications for moments not directly targeted (out-of-sample validity).

### 7.1.2 Structural Estimation

Structural estimation (e.g., maximum likelihood or method of moments) jointly estimates all parameters by minimising the distance between model-implied moments and data moments, with standard errors computed via the delta method or bootstrap.

<div class="example">
<strong>Estimating the McCall Model:</strong> Given a sample of unemployment duration data, the researcher can estimate the arrival rate \( \lambda \) and the parameters of the wage distribution \( F(w) \) by maximum likelihood. The model implies that the duration until job acceptance follows an exponential distribution with parameter \( \lambda[1 - F(w^*)] \). Matching the observed distribution of durations to the model's implied distribution identifies the structural parameters.
</div>

## 7.2 Online Platforms and Real Estate Markets

The course's primary applications are to markets with significant frictions:

### 7.2.1 Online Platforms

Online job boards (LinkedIn, Indeed) and product platforms (eBay, Airbnb) exhibit rich price dispersion — identical products transact at different prices simultaneously. Search theory predicts that price dispersion should be decreasing in search costs (because lower costs induce more comparison shopping). The digitisation of markets has dramatically reduced search costs, compressing price dispersion in some markets (e.g., airline tickets) while leaving it substantial in others (e.g., healthcare, housing).

### 7.2.2 Real Estate Markets

Housing markets exhibit classic search frictions:
- Sellers and buyers must be matched; this takes time (average time-on-market).
- Prices are not posted publicly and often involve negotiation (analogous to Nash bargaining).
- Buyers observe only a sample of available homes; the matching of buyers to specific houses involves significant search.

The directed search model predicts that in a hot market (high buyer-to-seller ratio), sellers should set higher asking prices and expect faster sales — a prediction consistent with empirical patterns in housing markets.

---

# Chapter 8: Price Dispersion and Market Design

## 8.1 Sources of Price Dispersion

Building on the course's theoretical foundations, this chapter synthesises the major mechanisms generating equilibrium price dispersion.

<div class="definition">
<strong>Price Dispersion:</strong> Price dispersion refers to the simultaneous existence of different prices for identical (or near-identical) goods or services in a market. Standard competitive theory predicts the law of one price; search frictions explain why dispersion persists in equilibrium.
</div>

The main mechanisms are:

1. **Search costs (Stigler 1961):** Costly information acquisition allows sellers with higher prices to survive.
2. **Sequential search (McCall 1970 / Diamond 1971):** With positive search costs and sequential offers, monopoly pricing can be an equilibrium (Diamond paradox).
3. **Noisy search (Burdett-Judd 1983):** When some consumers compare prices and others do not, sellers face a non-trivial trade-off generating equilibrium dispersion.
4. **Directed search with heterogeneous sellers (BSW 2001):** More productive sellers post higher prices attracting longer queues.
5. **On-the-job search (Burdett-Mortensen 1998):** Workers receiving outside offers while employed generate an equilibrium wage distribution.

## 8.2 Welfare Implications

Price dispersion has ambiguous welfare implications:
- It can reflect market power (monopoly rents extracted from consumers with high search costs).
- It can also reflect efficient heterogeneity (different products serving different needs at different prices).
- Reducing search costs through policy (e.g., price transparency regulation) may reduce dispersion and increase consumer surplus but may also reduce entry by low-margin firms, potentially reducing variety.

The structural approach allows welfare comparisons across counterfactual market designs — a central deliverable of the structural methodology emphasised in this course.

---

# Chapter 9: Dynamic Optimisation and Value Functions

## 9.1 Bellman's Principle of Optimality

All search models are applications of dynamic programming. Bellman's principle states that an optimal policy has the property that, regardless of the initial state and initial decision, the remaining decisions must constitute an optimal policy with regard to the state resulting from the first decision.

Formally, for a stationary infinite-horizon problem:

\[ V(x) = \max_{a \in A(x)} \left\{ u(x,a) + \beta \int V(x') \, dP(x' | x, a) \right\} \]

where \( x \) is the state, \( a \) is the action, \( u(x,a) \) is the flow payoff, and \( P(x'|x,a) \) is the transition distribution over next-period states.

<div class="theorem">
<strong>Contraction Mapping Theorem:</strong> Under standard assumptions (bounded payoffs, \( \beta < 1 \)), the Bellman operator \( T \) defined by:
\[ (TV)(x) = \max_{a \in A(x)} \left\{ u(x,a) + \beta \int V(x') \, dP(x' | x, a) \right\} \]
is a contraction on the space of bounded continuous functions, with unique fixed point \( V^* \). The sequence \( T^n V \) converges to \( V^* \) for any initial \( V \). This guarantees both existence and uniqueness of the value function, and the optimal policy is the argmax of the Bellman equation.
</div>

## 9.2 Solving Search Models Numerically

In practice, value functions for search models with rich heterogeneity are solved numerically:

1. **Discretise the state space** (e.g., a finite grid of wage offers \( \{w_1, \ldots, w_N\} \)).
2. **Value function iteration:** Start with \( V^0 = 0 \), apply \( T \) repeatedly until convergence: \( \| V^{n+1} - V^n \| < \varepsilon \).
3. **Extract the policy function** (the reservation wage in the McCall model).
4. **Simulate the model** to generate moments for calibration/estimation.

## 9.3 Steady-State Distributions

Many search models are characterised not just by individual optimal decisions but by the resulting steady-state distribution of outcomes (wages, employment states, match qualities). Computing these distributions is essential for bringing models to data.

In the McCall model, the steady-state unemployment rate is:

\[ u^* = \frac{1}{1 + \lambda[1 - F(w^*)]/\phi} \]

where \( \phi \) is the rate of job destruction. In the DMP model, the Beveridge curve gives:

\[ u^* = \frac{s}{s + p(\theta^*)} \]

where \( \theta^* \) is the equilibrium market tightness. These steady-state relationships are the primary targets for calibration.

---

# Chapter 10: Synthesis and Empirical Connections

## 10.1 The Search-Theoretic View of Labour Markets

The search-and-matching framework delivers a unified picture of labour markets that differs fundamentally from the competitive model:

- **Unemployment is an equilibrium phenomenon**, not a disequilibrium outcome caused by wages being too high. Even at the equilibrium wage, matching takes time.
- **Wages are not equal to marginal products.** They depend on outside options, bargaining power, and market tightness.
- **Vacancies and unemployment coexist** in equilibrium — the Beveridge curve is not a disequilibrium phenomenon but reflects the steady state of flows.
- **Search frictions generate rents** that are divided between workers and firms according to their relative bargaining power and market conditions.

## 10.2 Policy Implications

The DMP model has clear implications for labour market policy:

<div class="example">
<strong>Unemployment Insurance:</strong> In the McCall model, higher UI benefits \( b \) raise the reservation wage \( w^* \), extending unemployment duration but also raising the quality of matches (workers wait for better jobs). The optimal UI policy trades off the moral hazard cost (longer duration) against the efficiency gain (better matches). Empirically, this trade-off has been estimated extensively; a 10% increase in UI benefits is associated with roughly a 1–1.5 week increase in unemployment duration.
</div>

<div class="example">
<strong>Employment Protection Legislation:</strong> In the DMP model, higher firing costs reduce job destruction (by raising the threshold productivity below which firms find it worth destroying matches) but also reduce job creation (by raising the option value of staying with a match, which reduces hiring). The net effect on unemployment is theoretically ambiguous and depends on whether the reduction in job destruction dominates the reduction in job creation.
</div>

## 10.3 The Hosios Condition and Optimal Policy

The Hosios condition \( \beta = \alpha \) characterises efficient decentralised equilibrium. When it fails:

- If \( \beta > \alpha \): workers have too much bargaining power relative to their share in the matching function. Wages are too high, vacancy posting is too low, and unemployment is too high. A subsidy to vacancy posting (or a cap on wages) can restore efficiency.
- If \( \beta < \alpha \): firms have too much power. Wages are too low, there are too many vacancies, and workers are overworked. A tax on vacancy posting or an increase in UI benefits can restore efficiency.

In practice, calibrated models suggest that the US and Canadian labour markets operate close to but not exactly at the Hosios condition, with some tendency toward under-posting of vacancies.

## 10.4 Extensions and Frontiers

The core search models covered in this course have been extended in many directions:

- **On-the-job search (Burdett-Mortensen 1998):** Employed workers continue to search; generates an equilibrium wage distribution even with homogeneous workers.
- **Heterogeneous workers and firms (Shimer-Smith 2000):** Match quality depends on the compatibility of worker and firm types; generates assortative matching and mismatch.
- **Firm dynamics (Elsby-Michaels-Ratner 2015):** Firms of different sizes have different recruiting and separation behaviour; search frictions interact with firm dynamics.
- **Online platforms (Einav-Farronato-Levin 2016):** Digital platforms change the structure of matching; search models are being adapted to understand Uber, Airbnb, and similar markets.
- **Macro-finance:** Search frictions in financial markets (Duffie-Garleanu-Pedersen 2005) apply the same mathematical structure to over-the-counter bond and derivative markets.
