---
title: "ECON 483: Financial Economics"
prof: "Keisuke Teeple"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Lecture notes by Keisuke Teeple (posted after each class). No single required textbook.

**Supplementary texts** — Bonanno, G. (2019). *Uncertainty, Risk, and Information*. Independently Published. / Magill, M. and Quinzii, M. (1996). *Theory of Incomplete Markets*. MIT Press. / Duffie, D. (2001). *Dynamic Asset Pricing Theory*, 3rd Edition. Princeton University Press. / Mas-Colell, A., Whinston, M.D., and Green, J.R. (1995). *Microeconomic Theory*. Oxford University Press (Chapters 6, 19).

**Key papers** — Kyle, A.S. (1985). "Continuous Auctions and Insider Trading." *Econometrica*, 53(6): 1315–1335. / Kyle, A.S. (1989). "Informed Speculation with Imperfect Competition." *Review of Economic Studies*, 56(3): 317–355. / Glosten, L. and Milgrom, P. (1985). "Bid, Ask and Transaction Prices in a Specialist Market with Heterogeneously Informed Traders." *Journal of Financial Economics*, 14: 71–100. / Grossman, S. (1976). "On the Efficiency of Competitive Stock Markets where Trades have Diverse Information." *Journal of Finance*, 31(2): 573–585. / Morris, S. and Shin, H.S. (2002). "Social Value of Public Information." *American Economic Review*, 92(5): 1521–1534. / Banerjee, A. (1992). "A Simple Model of Herd Behavior." *Quarterly Journal of Economics*, 107(3): 797–817. / Brunnermeier, M. and Pedersen, L. (2005). "Predatory Trading." *Journal of Finance*, 60(4): 1825–1863.

**Online resources** — MIT OCW 15.401 Finance Theory; MIT OCW 14.123 Microeconomic Theory III (choice under uncertainty); Yale Financial Theory (Shiller); Princeton finance lecture notes.

---

# Chapter 1: Choice Under Uncertainty

## 1.1 Why Model Uncertainty?

Financial economics is fundamentally about making decisions whose outcomes are not known with certainty. The prices of assets depend on uncertain future payoffs; investors allocate wealth across risky and safe instruments; insurance markets transfer risk between parties with different exposures. To analyze all of these, we need a coherent theory of how rational agents make choices when facing uncertain outcomes.

The modern approach rests on **expected utility theory**, axiomatically developed by von Neumann and Morgenstern (1944). Before proceeding to portfolio theory and asset pricing, this chapter develops the mathematical foundations of choice under uncertainty.

## 1.2 States of the World and Lotteries

Let \(\Omega = \{\omega_1, \omega_2, \ldots, \omega_S\}\) denote the finite set of possible **states of the world**. A **lottery** (or probability distribution) over outcomes \(X = \{x_1, \ldots, x_n\}\) is a function \(p : X \to [0,1]\) with \(\sum_i p(x_i) = 1\).

We write a simple two-outcome lottery as \(L = (p, x_1; 1-p, x_2)\) — receive \(x_1\) with probability \(p\) and \(x_2\) with probability \(1-p\).

**Compound lotteries** are lotteries over lotteries. The **reduction axiom** (part of the von Neumann-Morgenstern axioms) states that agents care only about the probability distribution over final outcomes, not the structure of the compound lottery.

## 1.3 The von Neumann-Morgenstern Expected Utility Theorem

<div class="theorem">
<strong>Expected Utility Theorem (von Neumann and Morgenstern 1944):</strong> If a preference relation over lotteries satisfies the axioms of completeness, transitivity, continuity, and independence, then there exists a utility function <em>u</em> over outcomes such that lotteries are ranked by expected utility:

\[
L \succeq L' \iff E[u(L)] \geq E[u(L')]
\]
That is, \(\sum_i p_i u(x_i) \geq \sum_j q_j u(x_j)\). The function <em>u</em> is unique up to positive affine transformations.
</div>

The **Independence Axiom** is the most restrictive (and most debated): if \(L \succeq L'\), then for any lottery \(M\) and \(\alpha \in (0,1)\):

\[
\alpha L + (1-\alpha)M \succeq \alpha L' + (1-\alpha)M
\]

Mixing both lotteries with the same third lottery \(M\) should not reverse the preference ranking. This is the key axiom that generates the expected utility form.

## 1.4 Risk Aversion

An agent is **risk averse** if they prefer the certain outcome \(E[X]\) to the lottery \(X\) with the same expected value:

\[
u(E[X]) \geq E[u(X)]
\]

This is equivalent (by Jensen's inequality) to \(u\) being concave. Risk aversion implies that agents will pay to reduce risk (will purchase insurance at an actuarially fair price or better).

<div class="definition">
<strong>Certainty Equivalent (CE):</strong> The certain amount of wealth that makes the agent indifferent between receiving that amount for certain and facing the lottery. For a risk-averse agent, <em>CE &lt; E[X]</em>. The difference \(E[X] - CE\) is the <em>risk premium</em> — the maximum amount the agent would pay to eliminate the risk.
</div>

### 1.4.1 Measures of Risk Aversion

**Arrow-Pratt absolute risk aversion (ARA):**

\[
A(w) = -\frac{u''(w)}{u'(w)}
\]

A higher \(A(w)\) means greater risk aversion at wealth level \(w\).

**Arrow-Pratt relative risk aversion (RRA):**

\[
R(w) = -\frac{w \cdot u''(w)}{u'(w)} = w \cdot A(w)
\]

For small, actuarially fair gambles, the risk premium is approximately:

\[
\text{Risk premium} \approx \frac{1}{2} A(w) \text{Var}(X)
\]

**Common utility function families:**

- **Constant Absolute Risk Aversion (CARA):** \(u(w) = -e^{-\alpha w}\), \(A(w) = \alpha\) (constant). Agent's optimal holdings of risky assets do not depend on wealth level.

- **Constant Relative Risk Aversion (CRRA):**

\[
u(w) = \frac{w^{1-\gamma}}{1-\gamma}, \quad \gamma \neq 1 \qquad u(w) = \ln(w), \quad \gamma = 1
\]
\(R(w) = \gamma\) (constant). The fraction of wealth held in risky assets is constant — consistent with observed portfolio behavior and commonly used in macro-finance models.

- **Mean-Variance preferences:** If outcomes are jointly normal (or utility is quadratic), expected utility can be written as a function of mean and variance only:

\[
E[u(w)] = f(\mu_w, \sigma^2_w)
\]
This is the foundation of mean-variance portfolio theory.

## 1.5 Precautionary Savings

**Precautionary savings** refers to the extra saving that risk-averse agents undertake to self-insure against future income uncertainty, beyond what they would save purely from intertemporal smoothing motives.

Consider a two-period model. An agent earns income \(y_1\) today and uncertain income \(\tilde{y}_2\) tomorrow. They choose first-period consumption \(c_1\) and save \(s = y_1 - c_1\). The first-order condition (Euler equation) is:

\[
u'(c_1) = \beta(1+r) E[u'(c_2)]
\]

If \(u''' > 0\) (utility is convex in marginal utility — equivalently, \(u\) exhibits **prudence** in Kimball's 1990 sense), then by Jensen's inequality:

\[
E[u'(c_2)] > u'(E[c_2])
\]

This means that uncertainty about \(c_2\) raises expected marginal utility, requiring a lower \(u'(c_1)\) in equilibrium — that is, higher \(c_1\) (wait, rather: lower \(c_1\) and higher saving). Precautionary saving is captured by the third derivative of \(u\):

\[
P(w) = -\frac{u'''(w)}{u''(w)}
\]

(the coefficient of absolute prudence). A higher \(u'''\) generates more precautionary saving.

## 1.6 Stochastic Dominance

When comparing entire distributions (rather than single numbers), stochastic dominance provides criteria for ranking lotteries that hold for all risk-averse agents within a class.

**First-Order Stochastic Dominance (FOSD):** Lottery \(F\) first-order stochastically dominates lottery \(G\) if every risk-averse (and risk-loving) agent prefers \(F\):

\[
F(x) \leq G(x) \quad \forall x
\]

That is, \(F\) places no more probability on outcomes below any threshold \(x\) than \(G\). Equivalently, \(F\) is "shifted right" relative to \(G\).

**Second-Order Stochastic Dominance (SOSD):** \(F\) second-order stochastically dominates \(G\) if all risk-averse agents prefer \(F\):

\[
\int_{-\infty}^{x} F(t) dt \leq \int_{-\infty}^{x} G(t) dt \quad \forall x
\]

SOSD holds when \(F\) is obtained from \(G\) by a **mean-preserving spread** — shifting probability mass from the center to the tails without changing the mean. Risk-averse agents always prefer lower variance (for the same mean), so they prefer \(F\) over \(G\) whenever \(G\) is a mean-preserving spread of \(F\).

<div class="example">
<strong>Example — SOSD and Insurance:</strong> Let <em>G</em> be the distribution of uninsured wealth (exposed to a risky loss) and <em>F</em> be the distribution of insured wealth (certain). If the insurance is actuarially fair (premium equals expected loss), then <em>F</em> has the same mean as <em>G</em> but zero variance. <em>F</em> SOSD <em>G</em> because <em>G</em> is a mean-preserving spread of <em>F</em>. All risk-averse agents prefer full, actuarially fair insurance — the standard result in insurance economics.
</div>

## 1.7 Insurance Markets and the Value of Risk Sharing

In a world of complete insurance markets, risk-averse agents can trade claims on all states of the world, achieving a **Pareto-efficient** allocation. With complete markets, the first welfare theorem applies: the competitive equilibrium is Pareto optimal.

Key result: with complete markets and homogeneous beliefs, the Pareto-optimal allocation involves **full risk sharing** — each agent's consumption is perfectly correlated with aggregate consumption, and idiosyncratic risks are fully diversified away. The implications of this "complete markets benchmark" are tested against the data in a large empirical literature on consumption insurance; the evidence shows substantial departures from full risk sharing, motivating the study of incomplete markets.

---

# Chapter 2: Portfolio Theory

## 2.1 Mean-Variance Analysis (Markowitz 1952)

Harry Markowitz's portfolio selection theory asks: given a set of risky assets with known expected returns, variances, and covariances, how should an investor allocate wealth to minimize portfolio risk for a given expected return?

Let there be \(n\) risky assets with expected returns \(\boldsymbol{\mu} = (\mu_1, \ldots, \mu_n)'\) and covariance matrix \(\boldsymbol{\Sigma}\). A portfolio is a vector of weights \(\mathbf{w} = (w_1, \ldots, w_n)'\) with \(\mathbf{1}'\mathbf{w} = 1\) (full investment).

**Portfolio expected return and variance:**

\[
\mu_p = \mathbf{w}'\boldsymbol{\mu}
\]

\[
\sigma^2_p = \mathbf{w}'\boldsymbol{\Sigma}\mathbf{w}
\]

**The minimum-variance frontier** is the set of portfolios achieving minimum variance for each level of expected return. Solving the constrained optimization:

\[
\min_{\mathbf{w}} \frac{1}{2} \mathbf{w}'\boldsymbol{\Sigma}\mathbf{w} \quad \text{s.t.} \quad \mathbf{w}'\boldsymbol{\mu} = \mu_p, \quad \mathbf{1}'\mathbf{w} = 1
\]

Using Lagrange multipliers:

\[
\mathcal{L} = \frac{1}{2}\mathbf{w}'\boldsymbol{\Sigma}\mathbf{w} - \lambda(\mathbf{w}'\boldsymbol{\mu} - \mu_p) - \gamma(\mathbf{1}'\mathbf{w} - 1)
\]

FOC: \(\boldsymbol{\Sigma}\mathbf{w}^* = \lambda\boldsymbol{\mu} + \gamma\mathbf{1}\), giving:

\[
\mathbf{w}^* = \lambda\boldsymbol{\Sigma}^{-1}\boldsymbol{\mu} + \gamma\boldsymbol{\Sigma}^{-1}\mathbf{1}
\]

The frontier is a parabola in \((\sigma^2_p, \mu_p)\) space (a hyperbola in \((\sigma_p, \mu_p)\) space). The portion above the global minimum-variance portfolio is the **efficient frontier**.

## 2.2 Two-Fund Separation

<div class="theorem">
<strong>Two-Fund Separation (Tobin 1958):</strong> Every portfolio on the efficient frontier can be expressed as a combination of any two distinct frontier portfolios. Equivalently, all mean-variance efficient investors (regardless of risk aversion) hold the same portfolio of risky assets — differing only in how much they invest in the risky portfolio versus the risk-free asset.
</div>

With a risk-free asset earning \(r_f\), the **Capital Market Line (CML)** describes the efficient frontier for the entire set of assets (risky and risk-free):

\[
\mu_p = r_f + \frac{\mu_T - r_f}{\sigma_T} \sigma_p
\]

where \(T\) is the **tangency portfolio** — the risky portfolio with the highest Sharpe ratio (the slope of the CML):

\[
SR_T = \frac{\mu_T - r_f}{\sigma_T} = \max_\mathbf{w} \frac{\mathbf{w}'\boldsymbol{\mu} - r_f}{\sqrt{\mathbf{w}'\boldsymbol{\Sigma}\mathbf{w}}}
\]

In equilibrium (under the CAPM assumptions), the tangency portfolio equals the **market portfolio** — the value-weighted portfolio of all risky assets.

---

# Chapter 3: Asset Pricing

## 3.1 Arrow-Debreu Securities and Complete Markets

An **Arrow-Debreu security** (or Arrow security) pays one unit of the numéraire in state \(s\) and zero in all other states. Let \(q_s\) denote the price of the Arrow-Debreu security for state \(s\). With complete markets (an Arrow-Debreu security for every state), any asset can be replicated as a portfolio of Arrow securities.

The **no-arbitrage** condition requires that all Arrow-Debreu prices be strictly positive: \(q_s > 0\) for all \(s\). If any \(q_s = 0\), one could buy the Arrow security for free and receive a positive payoff in state \(s\) — a costless profit.

## 3.2 Risk-Neutral Probabilities and the Fundamental Theorem of Asset Pricing

Define **risk-neutral probabilities** by normalizing Arrow-Debreu prices:

\[
\pi^Q_s = \frac{q_s}{\sum_{s'} q_{s'}} = \frac{q_s}{P^B}
\]

where \(P^B = \sum_s q_s\) is the price of the risk-free bond (paying 1 in every state). The risk-free rate satisfies \(1 + r_f = 1/P^B\).

<div class="theorem">
<strong>Fundamental Theorem of Asset Pricing (Harrison and Kreps 1979; Harrison and Pliska 1981):</strong> In a finite state, finite period economy:
<ol>
<li><em>No Arbitrage</em> \(\Longleftrightarrow\) there exist strictly positive risk-neutral probabilities (an equivalent martingale measure \(\mathbb{Q}\)) such that every asset price equals its discounted expected payoff under \(\mathbb{Q}\):

\[
P_i = \frac{1}{1+r_f} E^{\mathbb{Q}}[X_i]
\]
</li>
<li><em>Market Completeness</em> \(\Longleftrightarrow\) the equivalent martingale measure is unique.</li>
</ol>
</div>

The fundamental theorem decouples asset pricing from preference parameters: to price any asset, one need not know agents' utility functions, only the no-arbitrage restriction and the risk-neutral probabilities.

<div class="example">
<strong>Example — Pricing a Stock Option with Arrow-Debreu Prices:</strong> Two states tomorrow: "up" (\(S_u = 120\)) and "down" (\(S_d = 80\)). Current stock price \(S_0 = 100\). Risk-free rate \(r_f = 5\%\), so \(P^B = 1/1.05 \approx 0.952\).

Risk-neutral probabilities: \(S_0 = P^B(\pi^Q S_u + (1-\pi^Q) S_d)\)

\[
100 = \frac{1}{1.05}(120\pi^Q + 80(1-\pi^Q)) \Rightarrow 105 = 40\pi^Q + 80 \Rightarrow \pi^Q = 0.625
\]

Price of a call option with strike \(K = 100\):

\[
C_0 = \frac{1}{1.05}(\pi^Q \cdot \max(120-100, 0) + (1-\pi^Q)\cdot\max(80-100,0)) = \frac{0.625 \times 20}{1.05} \approx 11.90
\]
</div>

## 3.3 The Stochastic Discount Factor (SDF)

A **stochastic discount factor** (SDF), also called a **pricing kernel** or **state-price deflator**, is a random variable \(m\) such that for any asset with payoff \(X\):

\[
P = E[m \cdot X]
\]

From the Arrow-Debreu framework, \(m_s = q_s / \text{prob}_s\) — the Arrow-Debreu price divided by the objective probability of state \(s\).

From the consumer's first-order conditions in an endowment economy (from MIU or CRRA preferences), the equilibrium SDF is:

\[
m_{t+1} = \beta \frac{u'(c_{t+1})}{u'(c_t)}
\]

For CRRA utility \(u(c) = c^{1-\gamma}/(1-\gamma)\):

\[
m_{t+1} = \beta \left(\frac{c_{t+1}}{c_t}\right)^{-\gamma}
\]

The SDF declines in aggregate consumption growth: states where aggregate consumption is high (good states) have low SDF values (assets that pay off in good states are less valuable — "insurance" in bad states commands a premium).

## 3.4 The Capital Asset Pricing Model (CAPM)

The **Capital Asset Pricing Model** (Sharpe 1964; Lintner 1965; Mossin 1966) is the centerpiece of equilibrium asset pricing. It combines the Markowitz mean-variance framework with the market clearing condition that all assets must be held.

<div class="theorem">
<strong>CAPM:</strong> Under the assumptions of (1) mean-variance preferences, (2) homogeneous expectations, (3) a risk-free asset, and (4) no frictions, the expected excess return of any asset <em>i</em> satisfies:

\[
E[R_i] - r_f = \beta_i (E[R_m] - r_f)
\]
where \(\beta_i = \frac{\text{Cov}(R_i, R_m)}{\text{Var}(R_m)}\) is the asset's <em>systematic risk</em> (beta), and \(E[R_m] - r_f\) is the <em>equity risk premium</em>.
</div>

**Derivation sketch.** In equilibrium, the market portfolio \(m\) is mean-variance efficient. For any asset \(i\), the Lagrange condition on the efficient frontier gives:

\[
E[R_i] - r_f = \lambda \text{Cov}(R_i, R_m)
\]

Setting \(i = m\): \(E[R_m] - r_f = \lambda \text{Var}(R_m)\), so \(\lambda = (E[R_m]-r_f)/\text{Var}(R_m)\). Substituting:

\[
E[R_i] - r_f = \frac{\text{Cov}(R_i, R_m)}{\text{Var}(R_m)}(E[R_m] - r_f) = \beta_i(E[R_m]-r_f)
\]

**Economic interpretation.** Only **systematic risk** (co-movement with the market) is priced. **Idiosyncratic risk** is diversifiable and earns no premium. An asset with \(\beta_i > 1\) amplifies market movements — it is aggressive and earns a premium above the market. An asset with \(\beta_i < 0\) is a hedge — it earns less than the risk-free rate.

### 3.4.1 The Security Market Line (SML)

The **Security Market Line** plots expected return against beta for all assets. The SML has:
- Intercept: \(r_f\) (risk-free rate)
- Slope: \(E[R_m] - r_f\) (equity risk premium)

Assets plotting above the SML have positive **alpha** (abnormal return): \(\alpha_i = E[R_i] - [r_f + \beta_i(E[R_m]-r_f)] > 0\). The EMH implies \(\alpha = 0\) for all assets in equilibrium.

<div class="example">
<strong>Example — CAPM Calculation:</strong> Risk-free rate \(r_f = 3\%\). Expected market return \(E[R_m] = 9\%\). Asset A has \(\beta_A = 1.5\). Asset B has \(\beta_B = 0.6\).

\[
E[R_A] = 3 + 1.5(9-3) = 3 + 9 = 12\%
\]

\[
E[R_B] = 3 + 0.6(9-3) = 3 + 3.6 = 6.6\%
\]

If Asset A's actual expected return is observed to be 14%, its alpha is \(\alpha_A = 14 - 12 = 2\%\) — it plots above the SML and represents an abnormal profit opportunity that would be competed away under strong-form efficiency.
</div>

## 3.5 The Equity Risk Premium

**Empirical evidence** on the equity risk premium (ERP): US historical average excess stock returns have been approximately 6–8% per year (compounded) over the 20th century, far exceeding what the standard CAPM with reasonable risk aversion can explain — the **equity premium puzzle** (Mehra and Prescott 1985).

To match a 6% ERP using the CRRA SDF formula:

\[
E[R_m] - r_f \approx \gamma \text{Cov}\left(\frac{\Delta c}{c}, R_m\right)
\]

US consumption growth has variance around 0.1% per year; matching the ERP requires \(\gamma \approx 50\) — an implausibly high risk aversion coefficient (most estimates suggest \(\gamma \in [1, 5]\)).

Proposed resolutions: habit formation (Campbell and Cochrane 1999), rare disasters (Rietz 1988; Barro 2006), long-run risks (Bansal and Yaron 2004), and limited asset market participation.

## 3.6 No-Trade Theorems

In a model with common priors and symmetric information, trade occurs for risk-sharing motives. But when agents have **private information**, the situation is more complex.

The **Milgrom-Stokey no-trade theorem** (1982) states: in a model where agents start from a Pareto-optimal allocation, if trade is purely speculative (no exogenous risk-sharing need), then no trade will occur at any price at which all agents want to trade. The logic: if you want to trade with me, I infer you have information that makes the trade advantageous for you — which makes it disadvantageous for me. Under common priors, this reasoning leads each agent to update beliefs until all speculative trades vanish.

<div class="remark">
<strong>Remark — No-Trade vs. Actual Markets:</strong> Real financial markets exhibit enormous volume — roughly equivalent to global GDP traded <em>daily</em> in equity markets alone. The no-trade theorem suggests that real trading must involve: (1) noise traders (agents with non-informational trading needs — liquidity demands, rebalancing, hedging), (2) disagreements (different priors or models), or (3) asymmetric information combined with noise trading (the Kyle model setup). Understanding trade requires explaining the coexistence of informed traders and noise traders.
</div>

---

# Chapter 4: Game-Theoretic Finance and Market Microstructure

## 4.1 Motivation: Why Game Theory in Finance?

Standard asset pricing models assume perfectly competitive markets where individual traders have no price impact. In reality, large trades move prices; traders with private information strategically hide their positions; market makers set bid-ask spreads to protect against adverse selection. **Market microstructure** studies these frictions at the trading level.

Game-theoretic finance incorporates **strategic behavior** and **asymmetric information**. The leading frameworks — Kyle (1985), Glosten-Milgrom (1985), and their extensions — generate endogenous bid-ask spreads, price impact functions, and information revelation processes.

## 4.2 The Kyle (1985) Model of Insider Trading

Albert Kyle's 1985 *Econometrica* paper "Continuous Auctions and Insider Trading" is one of the most influential models in financial economics. It provides a formal equilibrium model of how private information is incorporated into asset prices through strategic trading.

### 4.2.1 Setup

Three types of agents:
1. **A strategic insider** (informed trader) who knows the true asset value \(v\).
2. **Noise traders** (uninformed, liquidity traders) who trade for exogenous reasons (hedging, portfolio rebalancing), submitting a random order flow \(u \sim N(0, \sigma_u^2)\).
3. **A competitive market maker** who observes total order flow \(y = x + u\) but not individual orders, and sets a price equal to expected value conditional on order flow.

**Value:** \(v \sim N(\bar{v}, \sigma_v^2)\), known to the insider but not the market maker.

### 4.2.2 Equilibrium Strategies

The insider submits a **linear demand schedule**:

\[
x = \beta(v - \mu)
\]

where \(\mu = E[v]\) is the market maker's prior mean and \(\beta > 0\) measures the aggressiveness of insider trading.

The market maker sets price using **Bayesian updating** on order flow:

\[
p = \mu + \lambda y
\]

where \(\lambda\) is the **price impact coefficient** — how much the price moves per unit of net order flow.

### 4.2.3 Solving for Equilibrium

In a linear equilibrium, the market maker's pricing rule and the insider's strategy are mutually consistent. Total order flow is:

\[
y = x + u = \beta(v - \mu) + u
\]

The market maker observes \(y\) and infers:

\[
p = E[v | y] = \mu + \frac{\text{Cov}(v, y)}{\text{Var}(y)} y
\]

Computing covariances:

\[
\text{Cov}(v, y) = \text{Cov}(v, \beta(v-\mu) + u) = \beta \sigma_v^2
\]

\[
\text{Var}(y) = \beta^2 \sigma_v^2 + \sigma_u^2
\]

Therefore:

\[
\lambda = \frac{\beta \sigma_v^2}{\beta^2 \sigma_v^2 + \sigma_u^2}
\]

The insider maximizes expected profit:

\[
E[\pi | v] = E[(v - p)x | v] = (v - \mu - \lambda x)\beta(v-\mu) - \lambda\beta^2(v-\mu)^2 + \ldots
\]

Taking the first-order condition with respect to \(x = \beta(v-\mu)\):

\[
x^* = \frac{v - \mu}{2\lambda} \implies \beta = \frac{1}{2\lambda}
\]

Substituting \(\beta = 1/(2\lambda)\) into the expression for \(\lambda\):

\[
\lambda = \frac{\frac{1}{2\lambda} \sigma_v^2}{\frac{\sigma_v^2}{4\lambda^2} + \sigma_u^2} = \frac{\sigma_v^2}{2\lambda} \cdot \frac{1}{\frac{\sigma_v^2}{4\lambda^2} + \sigma_u^2}
\]

Solving this equation for \(\lambda\):

\[
\lambda^2 \left(\frac{\sigma_v^2}{4\lambda^2} + \sigma_u^2\right) = \frac{\sigma_v^2}{2}
\]

\[
\frac{\sigma_v^2}{4} + \lambda^2 \sigma_u^2 = \frac{\sigma_v^2}{2}
\]

\[
\lambda^2 \sigma_u^2 = \frac{\sigma_v^2}{4}
\]

\[
\boxed{\lambda = \frac{\sigma_v}{2\sigma_u}}
\]

<div class="theorem">
<strong>Kyle (1985) Equilibrium:</strong> The unique linear equilibrium has:

\[
\lambda = \frac{\sigma_v}{2\sigma_u}, \qquad \beta = \frac{\sigma_u}{\sigma_v}
\]
The price impact coefficient \(\lambda\) is increasing in the dispersion of the asset's fundamental value \(\sigma_v\) (more uncertainty about value means more information advantage) and decreasing in the volume of noise trading \(\sigma_u\) (more noise trading allows the insider to hide more). The insider's optimal quantity \(\beta\) is the inverse of \(\lambda\) — more noise trading induces more aggressive insider trading.
</div>

### 4.2.4 Key Properties of the Kyle Equilibrium

**Price informativeness.** After trading, the posterior variance of the asset value is:

\[
\text{Var}(v | y) = \frac{\sigma_v^2}{2}
\]

The market maker learns exactly half the insider's information each period — a striking result. Prices become more informative over time as the insider trades (their private information is gradually revealed through order flow).

**Market depth.** Kyle defines **market depth** as \(1/\lambda\) — the order size needed to move the price by one unit. Deep markets (low \(\lambda\)) are more informationally efficient but may attract more exploitative insider trading.

**Optimal obfuscation.** The insider optimally mixes their information into the order flow at a rate that exactly makes their order indistinguishable from noise. Trading too aggressively reveals information too quickly and destroys the rent from private information.

**Profit.** Expected insider profit is:

\[
E[\pi] = \frac{\sigma_v \sigma_u}{2} = \frac{\text{total information} \times \text{noise depth}}{2}
\]

Larger information advantage (\(\sigma_v\)) and more noise trading (\(\sigma_u\)) both increase insider profit.

### 4.2.5 Extensions: Kyle (1985) Continuous-Time Version

In the continuous-time version of the model, trading occurs in a Brownian motion framework. The key result is that prices follow a **Brownian bridge** from the current price to the true value \(v\). The insider's cumulative order flow is a Brownian motion; over the trading period \([0, 1]\), all private information is revealed exactly at time 1 (the trading deadline). This is the **gradual revelation** result — information is incorporated smoothly, not in a single jump.

## 4.3 The Glosten-Milgrom (1985) Model

**Glosten and Milgrom (1985)** model a **market maker** who sequentially trades with customers who are either informed or noise traders. Unlike Kyle's batch auction, GM is a sequential model.

**Setup:**
- Asset value is \(v \in \{V_H, V_L\}\), known to informed traders, not to the market maker.
- Fraction \(\mu\) of traders are informed; fraction \(1-\mu\) are noise traders who buy or sell with equal probability.
- The market maker posts bid \(b\) and ask \(a > b\); traders choose whether to buy, sell, or abstain.

**Bid-ask spread from adverse selection:**

The market maker breaks even on each trade in expectation. An ask price must satisfy:

\[
a = E[v | \text{buyer}]
\]

because buyers are more likely to be informed when the value is high:

\[
a = V_H \cdot \frac{\mu \cdot 1 + \frac{1-\mu}{2}}{\mu + \frac{1-\mu}{2}} \cdot \text{Pr}(V_H | \text{buy}) + V_L \cdot \text{Pr}(V_L | \text{buy})
\]

where the numerator accounts for the fact that informed buyers only appear when \(v = V_H\).

The key insight of GM: **the bid-ask spread is entirely driven by adverse selection** — the fear that the person on the other side of the trade has better information. In a world with no informed traders (\(\mu = 0\)), the spread would be zero (the market maker faces no information risk).

<div class="definition">
<strong>Bid-Ask Spread (Adverse Selection Component):</strong> In the Glosten-Milgrom model, the equilibrium spread equals:

\[
a - b = 2\mu \cdot \frac{(V_H - V_L)^2}{V_H + V_L} \cdot [\text{adjustment for beliefs}]
\]
More precisely, the spread is proportional to the fraction of informed traders \(\mu\) and the asset value uncertainty \(V_H - V_L\). As information asymmetry falls (e.g., more public disclosure), the spread narrows.
</div>

## 4.4 Beauty Contests and the Morris-Shin Model

**Keynes (1936)** described the stock market as a "beauty contest" — investors care not about the true value of stocks but about what other investors think the value is (and what they think others think, and so on). This **higher-order belief** structure generates departures from fundamentals.

**Morris and Shin (2002)** formalize beauty contest logic in the context of the social value of public information. In their model:
- A continuum of agents each receive a private signal \(x_i = \theta + \varepsilon_i\) about a fundamental \(\theta \sim N(0, 1/\alpha)\).
- Agents also observe a public signal \(y = \theta + \eta\) with precision \(\beta\).
- Each agent chooses an action \(a_i\) to minimize a loss function that penalizes both distance from the fundamental and distance from the average action (coordination motive):

\[
L_i = (1-r)(a_i - \theta)^2 + r(a_i - \bar{a})^2
\]

**Key result:** The equilibrium action overweights the public signal relative to its precision:

\[
a_i = (1-\kappa)E_i[\theta] + \kappa y
\]

where \(\kappa\) increases with the coordination motive \(r\) and the public signal precision \(\beta\).

**Policy implication (paradox of transparency):** More precise public information can make agents overly coordinate on the public signal, reducing the aggregation of private information. This raises the possibility that greater central bank transparency can reduce market informativeness — a provocative result that generated substantial debate. It implies that central bank communication quality matters: vague forward guidance that induces agents to use their own information may be socially superior to highly precise announcements that crowd out private information.

## 4.5 Herd Behavior — The Banerjee (1992) Model

**Banerjee (1992)** models a sequential decision problem where agents have private signals but also observe the actions (not signals) of predecessors. The setup:

- A good decision \(a = 1\) (correct) and bad decision \(a = 0\).
- True state \(\theta \in \{0, 1\}\), equal prior \(\text{Pr}(\theta = 1) = 1/2\).
- Each agent \(i\) observes a private signal \(s_i\) and the history of prior agents' actions.

**Informational cascade:** After a sufficiently long string of agents choosing \(a = 1\), agent \(n\)'s posterior after seeing the history overwhelms any private signal. Agent \(n\) rationally ignores their private signal and follows the herd — not because they are irrational but because the cumulative public information (from prior actions) outweighs their private signal.

<div class="remark">
<strong>Key Properties of Herds:</strong>
<ul>
<li>Cascades can start on incorrect actions — if early agents happen to receive wrong signals, later agents herd on the wrong decision.</li>
<li>Herds are fragile: a single highly informative public signal can break a cascade and restart independent information processing.</li>
<li>Herds do not aggregate information efficiently: later agents stop revealing their private information, leaving socially useful information unused.</li>
<li>In financial markets, herds can amplify asset price bubbles and crashes — agents buy (or sell) because others are doing so, disconnecting prices from fundamentals.</li>
</ul>
</div>

## 4.6 Predatory Trading — Brunnermeier and Pedersen (2005)

**Brunnermeier and Pedersen (2005)** model predatory trading: a situation where traders prey on a distressed counterpart who must liquidate a large position, strategically front-running and amplifying price pressure to profit at the distressed trader's expense.

**Setup:**
- A distressed trader must sell \(X_0 > 0\) shares over \(T\) periods (due to margin calls or regulatory constraints).
- Other strategic traders observe the distressed seller's liquidation.
- Price impact is linear in net order flow.

**Equilibrium:** Strategic traders initially sell alongside the distressed trader (front-running), amplifying price pressure and driving the asset price below fundamental value. After the distressed trader finishes, strategic traders buy back at the depressed price, profiting from the round trip.

**Price dynamics:**

\[
p_t = v - \lambda \sum_{\tau \leq t} y_\tau
\]

where \(y_t\) is net order flow at time \(t\). Strategic traders maximize:

\[
\Pi^s = \sum_{t} (p_t - p_{T+1}) \cdot x^s_t
\]

The predatory equilibrium features **overshooting**: the price falls below fundamental value during the liquidation and then recovers, generating profits for strategic traders at the expense of the distressed trader (and indirectly, whoever caused the distress).

**Real-world relevance.** The Brunnermeier-Pedersen mechanism helps explain:
- The 1998 Long-Term Capital Management crisis: as LTCM deleveraged, other traders sold the same assets, amplifying losses.
- The 2020 March COVID-19 market dislocation: fire sales by leveraged fund investors were exploited by other traders, creating extreme volatility.
- Broader financial stability concerns about algorithmic trading strategies that detect and front-run institutional order flow.

<div class="example">
<strong>Example — Predatory Trading and the LTCM Crisis:</strong> In August-September 1998, LTCM's massive leveraged positions in convergence trades (long illiquid, short liquid instruments) came under pressure as Russian default triggered a global flight to liquidity. As LTCM was forced to liquidate, other traders (aware of LTCM's position from prime brokerage relationships) sold the same assets ahead of LTCM, amplifying spreads. Fixed income spreads that should have converged instead diverged to extreme levels. The Fed-orchestrated recapitalization prevented a broader market collapse. The episode illustrates how predatory trading can transform idiosyncratic distress into systemic risk.
</div>

---

# Chapter 5: Informational Efficiency and the Grossman Paradox

## 5.1 Rational Expectations Equilibrium

**Grossman (1976)** asked: if prices fully reflect all available information (as the Efficient Markets Hypothesis states), why would anyone gather costly information? If information is already in the price, no one needs to pay to obtain it — but then no one acquires information, so prices cannot be informative. This is the **Grossman-Stiglitz Paradox** (Grossman and Stiglitz 1980).

In Grossman's (1976) rational expectations equilibrium (REE) model with diverse information, the equilibrium price itself aggregates all traders' information — prices function as a sufficient statistic. But in the Grossman-Stiglitz (1980) model, when information acquisition is costly, a fully revealing REE cannot exist: if the price reveals everything, no one would pay to be informed; but then the price reveals nothing, giving someone an incentive to acquire information — a contradiction.

The resolution: **noisy rational expectations equilibrium** where noise (random supply shocks or noise trading) prevents prices from fully revealing informed traders' information. Informed traders earn rents exactly covering their information costs; markets are only partially informative.

**Connection to Kyle (1985):** Noise traders in the Kyle model play the role of "supply noise" — they allow the informed trader to earn rents and prevent full information revelation, consistent with the Grossman-Stiglitz equilibrium notion.

---

# Summary: Key Formulas and Results

**Expected utility:**

\[
E[u(X)] = \sum_s \pi_s u(x_s)
\]

**Arrow-Pratt ARA:**

\[
A(w) = -\frac{u''(w)}{u'(w)}
\]

**CAPM:**

\[
E[R_i] - r_f = \beta_i(E[R_m] - r_f), \quad \beta_i = \frac{\text{Cov}(R_i, R_m)}{\text{Var}(R_m)}
\]

**Stochastic Discount Factor pricing:**

\[
P_i = E[m \cdot X_i], \quad m_{t+1} = \beta\left(\frac{c_{t+1}}{c_t}\right)^{-\gamma}
\]

**Fundamental Theorem (risk-neutral pricing):**

\[
P_i = \frac{E^{\mathbb{Q}}[X_i]}{1 + r_f}
\]

**Kyle (1985) price impact:**

\[
\lambda = \frac{\sigma_v}{2\sigma_u}
\]

**Kyle (1985) insider aggressiveness:**

\[
\beta = \frac{\sigma_u}{\sigma_v} = \frac{1}{2\lambda}
\]

**Kyle (1985) insider expected profit:**

\[
E[\pi] = \frac{\sigma_v \sigma_u}{2}
\]

**Markowitz portfolio variance:**

\[
\sigma^2_p = \mathbf{w}'\boldsymbol{\Sigma}\mathbf{w}
\]

**Capital Market Line:**

\[
\mu_p = r_f + \frac{\mu_T - r_f}{\sigma_T}\sigma_p
\]

**Second-order stochastic dominance condition:**

\[
\int_{-\infty}^x [G(t) - F(t)]\, dt \geq 0 \quad \forall x \quad (F \text{ SOSD } G)
\]

**Morris-Shin overweighting of public signal:**

\[
a_i^* = (1-\kappa)E_i[\theta] + \kappa y, \quad \kappa = \frac{r\beta}{(1-r)\alpha + r\beta + r\alpha}
\]

(where \(\alpha\) is private signal precision, \(\beta\) is public signal precision, \(r\) is coordination weight)
