---
title: "ACTSC 331: Life Contingencies 2"
prof: "Emily Kozlowski"
subjects: "ACTSC"
---

## Sources and References

- **Primary textbook** — Dickson, D.C.M., Hardy, M.R., Waters, H.R. *Actuarial Mathematics for Life Contingent Risks*, 3rd ed., Cambridge University Press, 2020.
- **Supplementary texts** — Bowers, Gerber, Hickman, Jones, Nesbitt, *Actuarial Mathematics*, 2nd ed., Society of Actuaries, 1997; Promislow, S.D., *Fundamentals of Actuarial Mathematics*, 3rd ed., Wiley, 2015.
- **Online resources** — SOA FAM-L / LTAM study materials; Mary Hardy's published lecture slides on policy values and multi-state modelling; Norberg, R., "Multi-state Models in Insurance Mathematics", *Scandinavian Actuarial Journal* lecture notes.

# Chapter 1: Policy Values and Reserves

A life insurance contract produces a stream of cashflows — premiums flowing in, benefits and expenses flowing out — whose timing is governed by a future lifetime random variable. At issue, the equivalence principle balances the expected present value of premiums against the expected present value of outgo. Once the contract is in force, that initial balance no longer holds: premiums already received have accumulated, benefits may already have been paid, and the remaining future cashflows carry a different expected present value. The insurer must therefore hold a reserve, called a **policy value**, which measures the liability attached to an in-force policy. This chapter develops the theory of policy values in discrete and continuous time.

## The Prospective Loss and Net Premium Policy Values

Fix a policy issued to a life aged \(x\), with level annual benefit premium \(P\), benefits payable at end of year of death, and term \(n\) (possibly infinite). Let \(T_x\) be the future lifetime of the insured and condition on survival to time \(t\), so \(T_{x+t}\) denotes the remaining future lifetime.

<div class="definition">
The <strong>prospective loss-at-time-t random variable</strong> \( L_t \) is the present value at time \( t \) of future benefits less future premiums, evaluated on the remaining lifetime \( T_{x+t} \). The <strong>net premium policy value</strong> is its conditional expectation
\[ {}_tV = \mathbb{E}[L_t \mid T_x > t]. \]
</div>

For a fully discrete term insurance of sum insured \(S\) on \((x)\), with level premium \(P\) paid while the policy is in force,

\[ {}_tV = S\,A_{x+t:\overline{n-t}|}^{\,1} - P\,\ddot a_{x+t:\overline{n-t}|}. \]

For an endowment, replace the term insurance symbol by the endowment symbol and include a pure endowment component. This *prospective formula* is the definitional one: it looks forward from time \(t\) and evaluates outstanding liabilities. An equivalent **retrospective formula** accumulates the excess of premiums collected over benefits paid, but it only equals the prospective reserve when the premium basis matches the valuation basis — an assumption rarely true in practice.

## Recursive Formulas and NAAR

A one-period recursion relates \({}_tV\) to \({}_{t+1}V\) by tracing what happens to the policy between times \(t\) and \(t+1\). At time \(t\) the insurer holds \({}_tV\); immediately afterwards the premium \(P\) is collected, then the fund earns interest \(i\) over the year. At the end of the year, either the insured died — probability \(q_{x+t}\) — in which case the death benefit \(S_{t+1}\) is paid, or the insured survived — probability \(p_{x+t}\) — in which case the insurer must hold \({}_{t+1}V\) for the next year. Equating these,

\[ ({}_tV + P)(1+i) = q_{x+t}\,S_{t+1} + p_{x+t}\,{}_{t+1}V. \]

Rearranging,

\[ ({}_tV + P)(1+i) - {}_{t+1}V = q_{x+t}\bigl(S_{t+1} - {}_{t+1}V\bigr). \]

The quantity \(\mathrm{NAAR}_{t+1} = S_{t+1} - {}_{t+1}V\) is the **net amount at risk**: the additional money the insurer must produce from pooled mortality releases to cover a death claim, beyond what is already being held in the dying life's own reserve. Because death releases the reserve that would otherwise have been carried forward, the effective cost of a claim is only the NAAR, not the full sum insured. Aggregated over many policies, the cost of deaths in year \(t+1\) has expectation \(q_{x+t}\cdot\mathrm{NAAR}_{t+1}\) per policy, and its variance drives the mortality risk capital the insurer must hold.

## Gross Premium Reserves, Expenses and Modified Reserves

Real contracts carry expenses: acquisition expenses (commissions, underwriting, medicals) are heavy at issue, while renewal expenses and claim handling costs are much smaller. A **gross premium policy value** (GPPV) values all future outgo — benefits and all expenses — against the gross (office) premium actually charged, whereas a **net premium policy value** (NPPV) uses a purely mortality-and-interest valuation.

Because acquisition expenses are front-loaded and office premiums are level, the GPPV is typically negative in the first policy year — the insurer has not yet recovered its setup cost — and only turns positive once renewal premiums have refilled the account. Holding a negative reserve is both economically misleading and illegal under most regulatory regimes. A **modified premium reserve** smooths this by pretending, for reserving only, that a smaller "valuation" premium was paid in year one and a larger one thereafter, so the reserve stays nonnegative. Under **full preliminary term** (**FPT**), the year-one valuation premium exactly equals the net single premium for a one-year term insurance on \((x)\), and from year two the reserve is computed as a net premium reserve on \((x+1)\) with term \(n-1\). FPT has the practical interpretation that the first year is treated as a pure one-year term policy, and the long-term contract effectively begins at duration 1.

## Asset Shares and Gain/Loss Analysis

The **asset share** is the actual fund per in-force policy generated by running a pooled block of business through realised interest, mortality and expense experience, rather than the assumed basis. At the end of year \(t+1\),

\[ AS_{t+1} = \dfrac{(AS_t + P^g - e_t)(1+i') - q'_{x+t}\,S_{t+1}}{p'_{x+t}}, \]

where primed quantities denote realised experience and \(e_t\), \(P^g\) are actual expenses and gross premium. Comparing the asset share with the reserve provides a profit test.

The one-year **gain on a policy** can be decomposed into contributions from interest, mortality and expenses by changing one assumption at a time. Let \(i^*, q^*, e^*\) be the valuation assumptions and let \(i', q', e'\) be the actual experience. Then, writing the end-of-year expected holding as a function of the three inputs, the total gain \(G\) decomposes as

\[ G = G_{\text{int}} + G_{\text{mort}} + G_{\text{exp}}, \]

where the interest gain is roughly \(({}_tV+P-e^*)(i'-i^*)\), the mortality gain is \((q^*-q')(S_{t+1}-{}_{t+1}V)\) (positive when experience is lighter than priced), and the expense gain is \((e^*-e')(1+i')\). This attribution is a management tool: it tells the insurer which lever drove the quarter's surplus.

## Continuous Time and Thiele's Differential Equation

If premiums are paid continuously at rate \(P_t\), benefits of \(S_t\) are payable on death, and interest accrues at force \(\delta\), the policy value \({}_tV\) satisfies a differential equation discovered by the Danish actuary T.N. Thiele. **Thiele's equation** is

\[ \dfrac{d}{dt}\,{}_tV = \delta\,{}_tV + P_t - \mu_{x+t}\bigl(S_t - {}_tV\bigr) - b_t, \]

where \(b_t\) is any continuously payable benefit annuity rate (e.g., disability income). The terms have a clean interpretation: interest \(\delta\,{}_tV\) builds the reserve, premiums \(P_t\) add to it, the mortality term releases NAAR at rate \(\mu_{x+t}\), and continuous benefit outgo drains it. Thiele's equation is a first-order linear ODE and can be solved numerically by Euler or Runge–Kutta methods backward from a terminal boundary condition such as \({}_nV = 0\) for a term insurance.

<div class="theorem">
<strong>Thiele's differential equation.</strong> Under the standard continuous-time actuarial model with constant force of interest \( \delta \), force of mortality \( \mu_{x+t} \), premium rate \( P_t \), and sum insured \( S_t \), the net premium policy value satisfies
\[ \frac{d}{dt}\,{}_tV = \delta\,{}_tV + P_t - \mu_{x+t}\bigl(S_t - {}_tV\bigr). \]
</div>

<div class="example">
Consider a whole life insurance on \( (40) \) with sum insured \( S = 100{,}000 \), level annual premium \( P = 1{,}200 \), valuation rate \( i = 5\% \). Suppose \( {}_5V = 6{,}500 \) and \( q_{45} = 0.0025 \). The one-period recursion gives
\[ (6{,}500 + 1{,}200)(1.05) = 0.0025\cdot 100{,}000 + 0.9975\cdot {}_6V, \]
so \( 8{,}085 = 250 + 0.9975\cdot {}_6V \), yielding \( {}_6V \approx 7{,}855 \). The NAAR at duration 6 is \( 100{,}000 - 7{,}855 = 92{,}145 \), which confirms that almost the entire death benefit is still "at risk" — only a modest fraction is pre-funded by the dying life's own reserve.
</div>

# Chapter 2: Multiple State Models

Not all insurance risks reduce to a binary alive/dead split. A critical-illness policy pays on first diagnosis of cancer, heart attack or stroke; a disability-income contract pays while the insured is unable to work; a long-term-care benefit is triggered by loss of activities of daily living. In each case, the policyholder moves among a finite set of states, and the probabilistic machinery of **multiple state models** (MSM) is needed.

## Notation, Assumptions and Transition Intensities

Let the state space be \(\{0,1,\ldots,k\}\). Write \(Y(t)\) for the state occupied at time \(t\) by a life aged \(x\) at \(t=0\). We assume the **Markov property**: conditional on the present state, the past is irrelevant for the future. Further, we assume the usual regularity: for each pair \(i\neq j\) there is a deterministic **transition intensity**

\[ \mu^{ij}_{x+t} = \lim_{h\to 0^+} \dfrac{\Pr[Y(t+h)=j\mid Y(t)=i]}{h}, \]

and \(\mu^{ii}_{x+t} = -\sum_{j\neq i}\mu^{ij}_{x+t}\). Occupation probabilities are

\[ {}_tp^{ij}_x = \Pr[Y(t)=j\mid Y(0)=i], \]

while \({}_tp^{\overline{ii}}_x\) denotes the probability of remaining continuously in state \(i\) throughout \([0,t]\). The distinction matters: a life may leave state \(i\) and return, so \({}_tp^{ii}_x \geq {}_tp^{\overline{ii}}_x\) with equality only when state \(i\) cannot be re-entered.

## Kolmogorov Forward Equations

Conservation of probability yields a system of ODEs known as the **Kolmogorov forward equations**:

\[ \dfrac{d}{dt}\,{}_tp^{ij}_x = \sum_{k\neq j}\bigl[\,{}_tp^{ik}_x\,\mu^{kj}_{x+t} - {}_tp^{ij}_x\,\mu^{jk}_{x+t}\bigr]. \]

The interpretation: the rate of change of the probability of being in state \(j\) at time \(t\) equals inflow from all other states \(k\) minus outflow from \(j\) to all other states. For the "stuck in state \(i\)" probability, one has

\[ \dfrac{d}{dt}\,{}_tp^{\overline{ii}}_x = -\,{}_tp^{\overline{ii}}_x\sum_{j\neq i}\mu^{ij}_{x+t}, \]

a separable ODE whose solution is \({}_tp^{\overline{ii}}_x = \exp\!\left(-\int_0^t\sum_{j\neq i}\mu^{ij}_{x+s}\,ds\right)\).

<div class="definition">
The <strong>Kolmogorov forward equations</strong> for a continuous-time, time-inhomogeneous Markov chain describe how occupation probabilities evolve given the transition-intensity matrix \( \{\mu^{ij}_{x+t}\} \). They are solved forward in time from \( {}_0p^{ij}_x = \delta_{ij} \).
</div>

## EPVs of Benefits and Premiums

Given occupation probabilities and a force of interest \(\delta\), the expected present value of a lump-sum benefit \(B\) payable on every transition from \(i\) to \(j\) is

\[ \bar A^{ij} = \int_0^\infty B\, e^{-\delta t}\,{}_tp^{0i}_x\,\mu^{ij}_{x+t}\,dt, \]

while a continuous annuity of unit rate payable while in state \(i\) has EPV

\[ \bar a^{ii} = \int_0^\infty e^{-\delta t}\,{}_tp^{0i}_x\,dt. \]

Premiums may be payable only while the insured is in specified states (e.g., healthy). Applying the equivalence principle to an MSM contract equates the EPV of benefits to the EPV of premiums, giving a level or state-dependent premium.

## Policy Values and Thiele in MSM

Policy values are now state-dependent: \({}_tV^{(i)}\) is the reserve given the life is in state \(i\) at duration \(t\). Thiele's equation generalises to the system

\[ \dfrac{d}{dt}\,{}_tV^{(i)} = \delta\,{}_tV^{(i)} - B^{(i)}_t - P^{(i)}_t - \sum_{j\neq i}\mu^{ij}_{x+t}\bigl(S^{ij}_t + {}_tV^{(j)} - {}_tV^{(i)}\bigr), \]

where \(B^{(i)}_t\) is the annuity benefit rate in state \(i\), \(P^{(i)}_t\) is the premium rate in state \(i\), and \(S^{ij}_t\) is the lump sum on transition from \(i\) to \(j\). The bracketed term generalises NAAR: on transition, the insurer pays the lump sum and moves from reserving \({}_tV^{(i)}\) to reserving \({}_tV^{(j)}\).

## Applications

The workhorse model is the three-state **disability insurance** model with states Healthy (0), Disabled (1), Dead (2) and intensities \(\mu^{01}, \mu^{10}, \mu^{02}, \mu^{12}\). Premiums flow only in state 0; an annuity benefit flows in state 1; a lump sum may be payable on entry to state 2. Setting \(\mu^{10}=0\) produces the permanent-disability model. Critical-illness policies typically use a four-state model adding a "diagnosed" state from which recovery is ignored for benefit purposes. Long-term care models often use multiple impairment levels (ADL-based tiers) to reflect progressive care needs.

<div class="example">
In a permanent disability model on \( (60) \) with constant intensities \( \mu^{01}=0.03 \), \( \mu^{02}=0.01 \), \( \mu^{12}=0.05 \), the probability of remaining healthy for 10 years is \( {}_{10}p^{\overline{00}}_{60} = e^{-(0.03+0.01)\cdot 10} = e^{-0.4} \approx 0.6703 \). Over the same ten years the probability of being alive but disabled is obtained by solving the two-state death-and-disability ODE; numerically, \( {}_{10}p^{01}_{60}\approx 0.1812 \). The complement, dead within ten years, is roughly \( 0.1485 \).
</div>

# Chapter 3: Multiple Decrement Models

**Multiple decrement models** (MDM) are the special case of MSMs in which every non-starting state is **absorbing**: the life exits the active state into exactly one of \(m\) decrements and then stays there. Typical decrements are death, withdrawal (lapse), disability, and retirement. Because no re-entry is possible, MDMs admit simplified table-based notation.

## Multiple-Decrement Tables

Let \(l^{(\tau)}_x\) denote the number in the active state at exact age \(x\), and let \(d^{(j)}_x\) denote the number decremented by cause \(j\) between ages \(x\) and \(x+1\). The total decrement is \(d^{(\tau)}_x = \sum_j d^{(j)}_x\), and \(l^{(\tau)}_{x+1} = l^{(\tau)}_x - d^{(\tau)}_x\). The **dependent** rate of decrement by cause \(j\) is

\[ q^{(j)}_x = \dfrac{d^{(j)}_x}{l^{(\tau)}_x}, \]

with \(q^{(\tau)}_x = \sum_j q^{(j)}_x\). These are called dependent because each rate is influenced by the presence of the other decrements — if lapses were removed, more lives would be exposed to death, and the death rate measured in the table would shift.

## Associated Single-Decrement Rates

Each cause has an **associated single-decrement rate** \(q'^{(j)}_x\): the probability of decrement by \(j\) alone in a hypothetical world where only cause \(j\) operates. The associated rates are linked to the dependent rates through an assumption about how decrements are distributed within the year of age.

<div class="definition">
Under the <strong>uniform distribution of decrements (UDD) in the multiple-decrement table</strong> — the assumption that each decrement \( j \) occurs uniformly across \( (x, x+1) \) — the dependent and associated rates satisfy
\[ q^{(j)}_x = q'^{(j)}_x \prod_{k\neq j}\!\left(1 - \tfrac{1}{2}q'^{(k)}_x\right) \]
to second order, and exactly \( q^{(j)}_x = q'^{(j)}_x\cdot(1 - \tfrac{1}{2}\sum_{k\neq j}q'^{(k)}_x + \tfrac{1}{3}\ldots) \) in its full Taylor expansion. A common first-order approximation used in practice is
\[ q^{(j)}_x \approx q'^{(j)}_x\!\left(1 - \tfrac{1}{2}\sum_{k\neq j}q'^{(k)}_x\right). \]
</div>

Under the alternative **UDD in each associated single-decrement table**, the force of decrement \(\mu^{(j)}\) is constant across the year only with respect to exposures in the single-decrement world, and one gets the closed-form relation

\[ q^{(j)}_x = q'^{(j)}_x\,\dfrac{\ln(1 - q^{(\tau)}_x)}{\ln\prod_k(1-q'^{(k)}_x)}. \]

This distinction matters when converting between table sources.

## Fractional Ages and Transitions at Exact Ages

Rates at fractional ages \(x+s\) for \(0<s<1\) are computed by the same fractional-age rules as in life tables, typically UDD or constant force. Some MDMs feature decrements concentrated at exact integer ages — retirement on a fixed birthday is the canonical example — and these must be handled as point masses, placing the retirement decrement either at the start or the end of the year of age depending on the plan design.

<div class="example">
Suppose at age 55 a pension scheme has associated single-decrement rates \( q'^{(d)}_{55}=0.006 \) (death) and \( q'^{(w)}_{55}=0.10 \) (withdrawal). Under UDD in the multiple decrement table,
\[ q^{(d)}_{55} \approx 0.006\,(1-\tfrac{1}{2}\cdot 0.10) = 0.0057,\quad q^{(w)}_{55}\approx 0.10\,(1 - \tfrac{1}{2}\cdot 0.006) = 0.0997. \]
Starting from \( l^{(\tau)}_{55}=100{,}000 \), expected decrements in the year are \( d^{(d)}_{55}\approx 570 \) and \( d^{(w)}_{55}\approx 9{,}970 \), leaving \( l^{(\tau)}_{56}\approx 89{,}460 \).
</div>

# Chapter 4: Multiple Life Models

Many real contracts are written on more than one life. A joint-and-survivor pension continues until the second of a couple has died; a reversionary annuity begins only after a specified life has died and continues while another is still alive; a last-survivor insurance pays on the second death. The theory of **multiple life models** (MLM) introduces two fundamental statuses and then layers dependence structures on top.

## Joint Life and Last-Survivor Statuses

<div class="definition">
Given two lives aged \( x \) and \( y \) with future lifetimes \( T_x \) and \( T_y \), the <strong>joint life status</strong> \( (xy) \) fails on the first death, and its future lifetime is
\[ T_{xy} = \min(T_x, T_y). \]
The <strong>last-survivor status</strong> \( (\overline{xy}) \) fails on the last death, and its future lifetime is
\[ T_{\overline{xy}} = \max(T_x, T_y). \]
</div>

The pair \((T_{xy}, T_{\overline{xy}})\) rearranges \((T_x, T_y)\) in order, so the fundamental identity

\[ T_{xy} + T_{\overline{xy}} = T_x + T_y \]

holds pointwise. Taking expectations of any monotone function gives a symmetry — in particular, present values are additive:

\[ A_{\overline{xy}} = A_x + A_y - A_{xy},\qquad \ddot a_{\overline{xy}} = \ddot a_x + \ddot a_y - \ddot a_{xy}. \]

This last-survivor decomposition is enormously useful: to value a last-survivor benefit it suffices to value the single lives and the joint-life status.

## Probabilities Under Independence

If \(T_x\) and \(T_y\) are independent, survival of the joint status factorises:

\[ {}_tp_{xy} = \Pr(T_x>t, T_y>t) = {}_tp_x\cdot{}_tp_y, \]

and the force of failure of the joint status is the sum

\[ \mu_{xy}(t) = \mu_{x+t} + \mu_{y+t}. \]

The corresponding whole-life insurance EPV on the joint status is

\[ \bar A_{xy} = \int_0^\infty e^{-\delta t}\,{}_tp_{xy}\bigl(\mu_{x+t}+\mu_{y+t}\bigr)\,dt. \]

Joint annuity values follow by the usual integration against survival:

\[ \bar a_{xy} = \int_0^\infty e^{-\delta t}\,{}_tp_{xy}\,dt. \]

Discrete analogues use annual survival probabilities and replace integrals by sums.

## Reversionary and Contingent Benefits

A **reversionary annuity** pays continuously to \((y)\) while \((y)\) is alive and \((x)\) is dead. Its EPV is the difference

\[ \bar a_{x\mid y} = \bar a_y - \bar a_{xy}, \]

because paying to \(y\) throughout life and subtracting the portion during which \(x\) is also alive leaves precisely the post-\(x\)-death segment. Contingent insurances — paying on the first death only if it is a particular life — can be written as integrals against the marginal force of failure restricted to that life.

## Common Shock and Dependence

Real couples do not die independently: shared accidents, shared health behaviours and grief-driven "broken-heart" mortality induce positive dependence. The simplest non-independent model is the **common shock** model, in which three independent Poisson forces drive failures: an individual force \(\mu^*_x\) affecting only \(x\), an individual force \(\mu^*_y\) affecting only \(y\), and a common shock force \(\lambda\) killing both simultaneously. Under this model,

\[ {}_tp_{xy} = e^{-\lambda t}\,{}_tp^*_x\,{}_tp^*_y, \]

where \({}_tp^*_x\) uses the individual force only. To preserve the marginal mortality of \((x)\), the individual force is taken as \(\mu_{x+t} - \lambda\), so that \({}_tp_x = e^{-\lambda t}\,{}_tp^*_x\). The common shock component introduces positive correlation: simultaneous deaths occur with positive probability, and the joint-status EPVs differ from the independent case.

<div class="theorem">
<strong>Last-survivor decomposition.</strong> For any two-life status — independent or dependent — the identity \( T_{xy}+T_{\overline{xy}} = T_x+T_y \) implies, via linearity of expectation, that
\[ A_{\overline{xy}} = A_x + A_y - A_{xy}, \qquad \ddot a_{\overline{xy}} = \ddot a_x + \ddot a_y - \ddot a_{xy}. \]
The identity is model-free: it does not require independence.
</div>

More general dependence can be built using **copulas**: a bivariate copula \(C\) couples the marginal survival functions \(S_x(t)\) and \(S_y(t)\) into a joint survival function \(S_{xy}(s,t) = C(S_x(s),S_y(t))\). Frank, Clayton and Gumbel copulas are popular parametric families; empirical studies of couple mortality typically fit mild positive dependence. When dependence is ignored, reserves for joint-life products tend to be biased downward for insurances paying on first death (because correlated failures concentrate claim timing).

<div class="example">
Let \( x = 65 \), \( y = 62 \), independent lives, constant forces \( \mu_{x+t} = 0.02 \) and \( \mu_{y+t} = 0.015 \), \( \delta = 0.05 \). Then
\[ \bar a_{xy} = \int_0^\infty e^{-(0.05+0.02+0.015)t}\,dt = \dfrac{1}{0.085}\approx 11.76, \]
\[ \bar a_x = \dfrac{1}{0.07}\approx 14.29, \quad \bar a_y = \dfrac{1}{0.065}\approx 15.38. \]
The last-survivor annuity is \( \bar a_{\overline{xy}} = 14.29 + 15.38 - 11.76 \approx 17.91 \), and a reversionary annuity to \( y \) following the death of \( x \) is worth \( \bar a_y - \bar a_{xy} \approx 15.38 - 11.76 = 3.62 \).
</div>

## Closing Remarks

The four chapters above trace a single thread: the equivalence principle at issue, the policy value at in-force valuation dates, and the generalisation of both to richer state spaces. Chapter 1 builds the machinery of reserves for the classical alive/dead single-life model, including the Thiele ODE that shows the continuous-time structure of reserve growth and release. Chapter 2 extends the setup to Markovian multi-state models, giving Kolmogorov forward equations and state-dependent Thiele equations — and, with a disability or LTC interpretation, opens the door to a whole industry of health-insurance products. Chapter 3 is the absorbing-state special case, with its table-based notation and the subtle distinction between dependent rates \(q^{(j)}\) and their associated single-decrement analogues \(q'^{(j)}\). Chapter 4 layers joint-life statuses, deterministic identities for last-survivor benefits, and models of dependence including common shock and copulas. Together, these tools cover the valuation of the overwhelming majority of individual life and health insurance products encountered in practice, and they form the standard content of any second-year life contingencies course aligned with AMLCR, the SOA FAM-L/LTAM syllabus, and the CIA's accreditation requirements.
