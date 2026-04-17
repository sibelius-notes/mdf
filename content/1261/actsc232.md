---
title: "ACTSC 232: Life Contingencies 1"
prof: "James Adcock"
subjects: "ACTSC"
---

## Sources and References

These notes synthesize material from several standard references in actuarial mathematics.

- **Primary textbook** — Dickson, D.C.M., Hardy, M.R., Waters, H.R. *Actuarial Mathematics for Life Contingent Risks*, 3rd ed., Cambridge University Press, 2020.
- **Supplementary texts** — Bowers, Gerber, Hickman, Jones, Nesbitt *Actuarial Mathematics*, 2nd ed., Society of Actuaries, 1997; Promislow, S.D. *Fundamentals of Actuarial Mathematics*, 3rd ed., Wiley, 2015.
- **Online resources** — SOA FAM-L study materials; MIT OCW 18.650 and Columbia STAT GR5264 actuarial modeling notes; Mary Hardy's publicly circulated slides on life insurance mathematics.

# Chapter 1: Introduction to Life Insurance Contracts

Life contingencies is the study of financial contracts whose cash flows depend on human survival and death. A **life insurance contract** promises a payment upon the death of an insured life (the policyholder), while a **life annuity** promises periodic payments so long as a specified life survives. Both products transfer longevity and mortality risk between policyholders and an insurer, and both require a probabilistic model of the future lifetime together with a financial model of interest.

Traditional insurance products include **term insurance**, which pays a fixed death benefit only if death occurs within a stated period; **whole life insurance**, which pays upon death whenever it occurs; **endowment insurance**, which pays either on early death or at the end of the term if the life survives; and **pure endowments**, which pay only upon survival to a maturity date. Modern variants — universal life, unit-linked (variable) policies, and equity-indexed contracts — add investment features so that benefits or cash values fluctuate with an underlying fund. The basic mathematical scaffolding for the traditional contracts extends, with some care, to these modern products.

**Life annuities** are the other half of the subject. Immediate annuities begin payments at once; deferred annuities begin after a waiting period. Annuities may pay at the start of each period (annuity-due) or at the end (annuity-immediate), and they may be temporary (paying for at most a fixed number of years provided the life survives) or whole life. **Defined-benefit pension plans** are essentially portfolios of deferred life annuities, and retirement products such as annuitization options on variable annuities convert accumulated wealth into guaranteed lifetime income.

Insurance companies organize themselves as **mutual insurers**, owned collectively by policyholders, or as **stock insurers**, owned by shareholders. Regardless of ownership form, an insurer must price contracts so that the present value of expected benefits, expenses, profit margins, and solvency capital is supported by the present value of expected premiums. This requires assumptions about mortality, interest, expenses, policyholder behavior (lapses and conversions), and investment returns. The actuary's job — and the content of this course — is to construct those assumptions rigorously, use them to compute expected present values and their variances, and translate the results into premiums and reserves.

# Chapter 2: Survival Models

## The future lifetime random variable

Fix a person now aged exactly \(x\), called a **life aged \(x\)** and denoted \((x)\). Their remaining lifetime is a non-negative random variable \(T_x\), measured in years. The distribution of \(T_x\) is described by the **survival function**

\[
S_x(t) = \Pr(T_x > t), \qquad t \geq 0,
\]

which gives the probability that \((x)\) survives at least \(t\) more years. We require \(S_x(0) = 1\), \(S_x\) non-increasing, and \(\lim_{t \to \infty} S_x(t) = 0\). The distribution function is \(F_x(t) = 1 - S_x(t)\), and if \(T_x\) is absolutely continuous, its density is \(f_x(t) = -S_x'(t)\).

A fundamental consistency principle links survival probabilities at different ages: if we know the distribution from birth, then \(S_x(t) = S_0(x+t)/S_0(x)\). Actuaries write \({}_tp_x = S_x(t)\) for the probability that \((x)\) survives \(t\) years and \({}_tq_x = 1 - {}_tp_x\) for the complementary probability of death within \(t\) years. When \(t = 1\) the prefix is dropped: \(p_x\) and \(q_x\).

## Force of mortality

The instantaneous rate of death at age \(x\), conditional on survival to that age, is the **force of mortality**

\[
\mu_x = -\frac{S_0'(x)}{S_0(x)} = \lim_{h \to 0^+} \frac{1}{h}\,\Pr(T_0 \leq x+h \mid T_0 > x).
\]

It plays the role of a hazard rate. From the definition one recovers the survival function by integration:

\[
S_x(t) = \exp\!\left(-\int_0^t \mu_{x+s}\,ds\right).
\]

The density of \(T_x\) then factors as \(f_x(t) = {}_tp_x\,\mu_{x+t}\), a product of "survives to \(t\)" and "dies instantaneously at \(x+t\)."

<div class="definition">
<strong>Gompertz and Makeham laws.</strong> The <strong>Gompertz law</strong> posits an exponentially growing force of mortality, <em>μ<sub>x</sub> = Bc<sup>x</sup></em> with B &gt; 0 and c &gt; 1, capturing the observation that human mortality roughly doubles every eight years in middle adulthood. The <strong>Makeham law</strong> adds an age-independent accident term, <em>μ<sub>x</sub> = A + Bc<sup>x</sup></em>, giving a better fit at younger ages where accidents dominate senescence.
</div>

## Curtate lifetime and expectations

Many contracts pay at the end of the year of death, so it is convenient to define the **curtate future lifetime** \(K_x = \lfloor T_x \rfloor\), a non-negative integer random variable with \(\Pr(K_x = k) = {}_kp_x\,q_{x+k}\) for \(k = 0, 1, 2, \dots\).

Two summary measures are standard. The **complete expectation of life** is

\[
\mathring{e}_x = \mathbb{E}[T_x] = \int_0^{\infty} {}_tp_x\,dt,
\]

obtained by integrating the survival function. The **curtate expectation** is

\[
e_x = \mathbb{E}[K_x] = \sum_{k=1}^{\infty} {}_kp_x.
\]

The two are connected, under the uniform distribution of deaths assumption, by \(\mathring{e}_x \approx e_x + \tfrac{1}{2}\). Higher moments follow from \(\mathbb{E}[T_x^2] = 2 \int_0^{\infty} t\,{}_tp_x\,dt\), and the variance of \(T_x\) is then computed as usual.

<div class="example">
<strong>De Moivre's law.</strong> Assume <em>S<sub>0</sub>(x) = 1 − x/ω</em> for 0 ≤ x ≤ ω. Then <em>μ<sub>x</sub> = 1/(ω − x)</em>, <em><sub>t</sub>p<sub>x</sub> = 1 − t/(ω − x)</em>, and the complete expectation of life is <em>(ω − x)/2</em>, the classical midpoint of the remaining interval. Though crude, this toy model is a useful sanity check for formulas.
</div>

# Chapter 3: Life Tables and Selection

## Construction of a life table

A **life table** tabulates, at integer ages, a radix population \(l_x\) interpreted as the expected number of survivors from \(l_0\) newborns. Given any survival function \(S_0\), one sets \(l_x = l_0 \cdot S_0(x)\). The number of deaths between ages \(x\) and \(x+1\) is \(d_x = l_x - l_{x+1}\). One-year mortality and survival probabilities recover directly:

\[
q_x = \frac{d_x}{l_x}, \qquad p_x = \frac{l_{x+1}}{l_x}, \qquad {}_np_x = \frac{l_{x+n}}{l_x}, \qquad {}_nq_x = 1 - {}_np_x.
\]

A useful deferred form is \({}_{m|n}q_x = {}_mp_x \cdot {}_nq_{x+m}\), the probability that \((x)\) survives \(m\) years and then dies in the next \(n\) years.

<div class="theorem">
<strong>Product identity for survival.</strong> For non-negative integers m and n,

\[
{}_{m+n}p_x = {}_mp_x \cdot {}_np_{x+m}.
\]

This multiplicative decomposition follows from the definition of conditional probability and is the basis of almost every recursive computation in a life table.
</div>

## Population versus insurance tables and selection

A **population life table** is estimated from census and death-registry data for a general population. An **insurance life table** is built from the experience of insured lives, who typically display lower mortality than the general population because they have been medically underwritten. More importantly, the mortality of a newly underwritten life is *temporarily* lower than that of a life who was underwritten several years ago at the same attained age — an effect called **selection**.

Select tables tabulate probabilities of the form \(q_{[x]+k}\), where \([x]\) is the age at selection (when the policy was issued) and \(k\) is the number of years since selection. After a **select period** of \(s\) years, the selection effect is assumed to wear off and the table becomes the **ultimate table**, in which only attained age matters: \(q_{[x]+k} = q_{x+k}\) for \(k \geq s\). Typical select periods for modern life-insurance tables are 2 to 15 years.

<div class="remark">
In a select-and-ultimate table, probabilities on a given diagonal (fixed attained age, varying duration since selection) are not equal; someone just underwritten at age 50 has lower one-year mortality than someone underwritten at age 45 five years ago, even though both are now attained age 50.
</div>

## Fractional age assumptions

Life tables give information only at integer ages, but insurance products generate cash flows at arbitrary times. We therefore need an interpolation rule for ages between integers. Two assumptions dominate practice.

The **uniform distribution of deaths (UDD)** assumes that, over each year of age, deaths are spread uniformly. Concretely, for \(0 \leq s < 1\),

\[
{}_sq_x = s\,q_x, \qquad {}_sp_x = 1 - s\,q_x.
\]

This assumption is simple and yields closed-form adjustments relating discrete and continuous insurance and annuity values. A standard consequence, useful for non-integer start ages, is

\[
{}_sq_{x+r} = \frac{s\,q_x}{1 - r\,q_x}, \qquad 0 \leq r+s \leq 1.
\]

The **constant force of mortality (CFM)** assumption holds \(\mu_{x+s} = \mu_x^\ast\) (a constant) for \(0 \leq s < 1\). Under CFM, \({}_sp_x = (p_x)^s\) and one-year probabilities match. CFM is the more natural assumption when the rest of the model is expressed in continuous time, while UDD interfaces more cleanly with classical life-table arithmetic.

<div class="example">
<strong>Half-year survival.</strong> If q<sub>60</sub> = 0.010, then under UDD the probability a life aged exactly 60.3 survives 0.5 years is <em><sub>0.5</sub>p<sub>60.3</sub> = 1 − (0.5)(0.010)/(1 − 0.3·0.010) ≈ 0.99499</em>. Under CFM, one computes <em>p<sub>60</sub><sup>0.5</sup> = 0.99<sup>0.5</sup> ≈ 0.99499</em> as well, so for small q the two are numerically nearly identical.
</div>

# Chapter 4: Life Insurance Benefits

## Present-value random variables

An insurance benefit paid at a future time \(\tau\) has present value \(v^{\tau}\) at the valuation date, where \(v = 1/(1+i)\) is the annual discount factor corresponding to interest rate \(i\). Let \(\delta = \ln(1+i)\) be the force of interest, so that \(v^t = e^{-\delta t}\). Because the payment time depends on \(T_x\), the present value is itself a random variable \(Z\), and pricing amounts to computing the moments of \(Z\).

## Whole life and term insurance

For a **whole life insurance** paying 1 at the moment of death, \(Z = v^{T_x}\). Its **expected present value** (EPV) is

\[
\bar A_x = \mathbb{E}[v^{T_x}] = \int_0^{\infty} v^t\,{}_tp_x\,\mu_{x+t}\,dt.
\]

For the discrete analog paying 1 at the end of the year of death, \(Z = v^{K_x + 1}\) and

\[
A_x = \mathbb{E}[v^{K_x+1}] = \sum_{k=0}^{\infty} v^{k+1}\,{}_kp_x\,q_{x+k}.
\]

An **\(n\)-year term insurance** has present value \(v^{T_x}\mathbf{1}_{\{T_x \leq n\}}\) (continuous case), and its EPV is written \(\bar A^{1}_{x:\overline{n}|}\) or \(A^{1}_{x:\overline{n}|}\). An **\(n\)-year pure endowment**, which pays 1 only on survival to time \(n\), has present value \(v^n \mathbf{1}_{\{T_x > n\}}\) and EPV

\[
A_{x:\,\overline{n}|}^{\,\,\,1} = v^n\,{}_np_x.
\]

An **\(n\)-year endowment insurance** is the sum of term and pure endowment; its EPV is \(A_{x:\overline{n}|} = A^{1}_{x:\overline{n}|} + A_{x:\overline{n}|}^{\,\,\,1}\). A **deferred whole life** insurance uses \(v^{T_x}\mathbf{1}_{\{T_x > u\}}\), with EPV

\[
{}_{u|}\bar A_x = \int_u^{\infty} v^t\,{}_tp_x\,\mu_{x+t}\,dt = v^u\,{}_up_x\,\bar A_{x+u}.
\]

## Recursion and variance

The discrete whole-life EPV satisfies the one-step recursion

\[
A_x = v\,q_x + v\,p_x\,A_{x+1},
\]

obtained by conditioning on whether death occurs in the first year. Analogous recursions exist for term and endowment insurances and are the workhorse of life-table computation.

<div class="theorem">
<strong>Variance via the "rule of moments."</strong> For Z = v<sup>T<sub>x</sub></sup>,

\[
\mathrm{Var}(Z) = {}^2\bar A_x - (\bar A_x)^2,
\]

where <em><sup>2</sup>Ā<sub>x</sub></em> denotes the EPV of the same contract computed with force of interest 2δ (equivalently, interest rate <em>(1+i)<sup>2</sup> − 1</em>). The same identity holds in the discrete case with A<sub>x</sub>. This works because E[Z<sup>2</sup>] = E[v<sup>2T<sub>x</sub></sup>] is a valuation of 1 at the doubled force of interest.
</div>

## Benefits paid \(1/m\)-thly and continuous limits

Real insurance benefits are often paid at the end of the month of death (\(m = 12\)). Under UDD one can show

\[
A^{(m)}_x = \frac{i}{i^{(m)}}\,A_x, \qquad \bar A_x = \frac{i}{\delta}\,A_x,
\]

the second identity being the \(m \to \infty\) limit of the first. Here \(i^{(m)}\) is the nominal rate compounded \(m\) times per year equivalent to \(i\). These adjustments let an actuary compute continuous and \(m\)-thly insurance values directly from an integer-age life table, without re-integrating.

<div class="example">
<strong>A quick whole-life value.</strong> Under a mortality law with constant force <em>μ</em>, the integral for Ā<sub>x</sub> collapses to <em>μ/(μ + δ)</em>, independent of x. If μ = 0.01 and δ = 0.05, then Ā<sub>x</sub> ≈ 0.1667. The corresponding discrete value, at the same effective rate, is obtained by multiplying by <em>δ/i</em>.
</div>

# Chapter 5: Life Annuities

## Annuity-due and annuity-immediate

A **whole life annuity-due** pays 1 at times \(0, 1, 2, \dots\) while \((x)\) is alive. Its present value is \(Y = \ddot a_{\overline{K_x+1}|}\), and its EPV is

\[
\ddot a_x = \sum_{k=0}^{\infty} v^k\,{}_kp_x.
\]

The **annuity-immediate** omits the payment at time 0 and pays at \(1, 2, \dots\), giving \(a_x = \ddot a_x - 1\). For an **\(n\)-year temporary annuity-due**, payments cease at time \(n-1\) at the latest, and

\[
\ddot a_{x:\overline{n}|} = \sum_{k=0}^{n-1} v^k\,{}_kp_x.
\]

A **deferred annuity** starts payments after \(u\) years: \({}_{u|}\ddot a_x = v^u\,{}_up_x\,\ddot a_{x+u}\).

## Continuous and \(1/m\)-thly annuities

A **continuous life annuity** pays at rate 1 per year continuously while \((x)\) survives, yielding

\[
\bar a_x = \int_0^{\infty} v^t\,{}_tp_x\,dt = \mathbb{E}\!\left[\frac{1 - v^{T_x}}{\delta}\right] = \frac{1 - \bar A_x}{\delta}.
\]

An \(m\)-thly annuity-due paying \(1/m\) at the start of each \(m\)-thly period has EPV \(\ddot a^{(m)}_x\). Under UDD,

\[
\ddot a^{(m)}_x = \alpha(m)\,\ddot a_x - \beta(m),
\]

where \(\alpha(m) = id/(i^{(m)}d^{(m)})\) and \(\beta(m) = (i - i^{(m)})/(i^{(m)}d^{(m)})\), with \(d = 1-v\) and \(d^{(m)}\) the \(m\)-thly discount rate. As \(m \to \infty\) these reduce to the continuous annuity formula.

## Fundamental relationship between \(A\) and \(\ddot a\)

Because \(\ddot a_{\overline{K+1}|} = (1 - v^{K+1})/d\), taking expectations gives the cornerstone identity

\[
\ddot a_x = \frac{1 - A_x}{d}, \qquad \bar a_x = \frac{1 - \bar A_x}{\delta}.
\]

<div class="theorem">
<strong>Variance of the annuity present value.</strong> For fully discrete whole life annuities,

\[
\mathrm{Var}(Y) = \mathrm{Var}\!\left(\frac{1 - v^{K_x+1}}{d}\right) = \frac{{}^2A_x - (A_x)^2}{d^2}.
\]

Thus the variance of the annuity PV is proportional to the variance of the corresponding insurance PV, with proportionality constant 1/d<sup>2</sup>. The continuous analog replaces d by δ.
</div>

The one-step recursion \(\ddot a_x = 1 + v\,p_x\,\ddot a_{x+1}\) is the annuity counterpart of the insurance recursion and can be verified either directly from the summation or via the identity with \(A_x\).

<div class="example">
<strong>Annuity from constant force.</strong> With μ = 0.01, δ = 0.05, continuous whole-life annuity <em>ā<sub>x</sub> = 1/(μ + δ) = 1/0.06 ≈ 16.67</em>. The identity <em>ā<sub>x</sub> = (1 − Ā<sub>x</sub>)/δ</em> gives the same answer: (1 − 0.1667)/0.05 = 16.67. Consistency of the insurance and annuity formulas is a good debugging habit.
</div>

# Chapter 6: Benefit Premiums

## The loss-at-issue random variable

Consider a fully discrete whole life insurance of 1 on \((x)\), funded by level annual premiums of \(P\) payable in advance while the life survives. Define the **loss-at-issue random variable**

\[
L_0 = v^{K_x+1} - P\,\ddot a_{\overline{K_x+1}|}.
\]

This is the present value at time 0 of benefits paid minus premiums received. A positive \(L_0\) is a loss to the insurer; a negative \(L_0\) is a profit.

## The equivalence principle

The **net premium**, or **benefit premium**, is determined by setting \(\mathbb{E}[L_0] = 0\):

\[
P = \frac{A_x}{\ddot a_x}.
\]

This is the **equivalence principle** of premium calculation. It ensures that the expected present value of benefits equals the expected present value of premiums, leaving the insurer with no expected profit and no expected loss. Analogous formulas hold for term insurance, endowment insurance, continuous contracts, and annuities, using the appropriate EPVs in the numerator and denominator.

<div class="example">
<strong>Whole-life net premium.</strong> If A<sub>50</sub> = 0.25 and ä<sub>50</sub> = 15 at the chosen interest rate, then the annual net premium per unit of benefit is P = 0.25/15 ≈ 0.01667. A policy with face value 100 000 would carry an annual net premium near 1 667 before expenses.
</div>

## Variance of the loss and the portfolio percentile principle

Substituting \(\ddot a_{\overline{K+1}|} = (1 - v^{K+1})/d\) into \(L_0\) gives

\[
L_0 = \left(1 + \frac{P}{d}\right) v^{K_x+1} - \frac{P}{d}.
\]

The variance is therefore

\[
\mathrm{Var}(L_0) = \left(1 + \frac{P}{d}\right)^2 \left[{}^2A_x - (A_x)^2\right],
\]

so reducing loss variance requires reducing \({}^2A_x - (A_x)^2\), which depends on mortality and interest assumptions.

When an insurer sells many such policies, the aggregate loss is \(\sum_i L_0^{(i)}\). Assuming independence and a large portfolio, a normal approximation applies. The **portfolio percentile premium** is chosen so that

\[
\Pr\!\left(\sum_i L_0^{(i)} < 0\right) \geq 1 - \alpha
\]

for a chosen confidence level \(1 - \alpha\). Because the aggregate mean and variance are both increasing in \(P\), one solves for the smallest \(P\) that yields enough of a cushion between the mean aggregate loss (typically negative) and zero, in units of the aggregate standard deviation. For a portfolio of \(N\) independent policies, the portfolio percentile premium exceeds the equivalence-principle premium by a term of order \(1/\sqrt{N}\), vanishing as the portfolio grows.

## Gross premiums, expenses, and extra risks

Real policies carry **expenses**: commissions, underwriting costs, issue expenses, and ongoing maintenance. The **gross loss-at-issue** subtracts expected expenses (themselves present-valued on mortality-adjusted annuities) from premium income and adds them to benefits. The **gross premium** \(G\) is then found by setting the expected gross loss to zero. Typical expense structures split into per-policy fixed charges, per-unit charges proportional to benefit, and percentage-of-premium charges; each contributes its own annuity-valued term to the equation.

<div class="remark">
Expense structures are typically front-loaded — first-year expenses are much higher than renewal-year expenses. This causes initial reserves to be negative or small, a phenomenon handled by modified reserving methods such as the full preliminary term approach introduced in later courses.
</div>

Finally, policies on impaired lives carry **extra risk**, usually modeled in one of two ways. **Age rating** treats the impaired life as though they were some number of years older: a 50-year-old with moderate risk factors is priced at age 55 mortality, and the premium is simply \(A_{55}/\ddot a_{55}\). **Additive extra force of mortality** adds a constant (or age-dependent) \(\phi_x\) to the baseline force of mortality, yielding survival probabilities

\[
{}_tp_x^\ast = {}_tp_x \cdot \exp\!\left(-\int_0^t \phi_{x+s}\,ds\right).
\]

When \(\phi\) is constant, this amounts to multiplying the ordinary survival function by \(e^{-\phi t}\), which is equivalent to valuing a standard contract at an increased force of interest \(\delta + \phi\) — a remarkably clean computational shortcut. Multiplicative mortality adjustments (**multiple of standard**) are also common in practice.

<div class="theorem">
<strong>Equivalence principle, general form.</strong> For any insurance-annuity combination with benefit present value Z and premium annuity present value Ÿ, paid at rate P,

\[
P = \frac{\mathbb{E}[Z]}{\mathbb{E}[\ddot Y]}.
\]

This formula specializes to whole life, term, endowment, limited-pay, and deferred contracts by choosing Z and Ÿ accordingly, and it extends to contracts with non-unit benefits and variable premium schedules by linearity of expectation.
</div>

These six chapters assemble the core toolkit of classical life contingencies: a probabilistic model for future lifetime, a tabulation scheme for practical computation, valuation formulas for insurance and annuity benefits, and a premium-calculation principle that ties everything together. Every topic in later courses — reserves, multiple-state models, multiple-decrement theory, profit testing, and stochastic interest — builds on the foundations laid here.
