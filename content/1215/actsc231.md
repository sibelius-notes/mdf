---
title: "ACTSC 231: Mathematics of Finance"
prof: "Keith Freeland"
---

# Module 1: Time Value of Money

## Lesson 1: Accumulation and Amount Functions

Lenders are willing to lend money because the borrower pays them a fee called **interest**. The fundamental insight of financial mathematics is that money has different values at different times. A dollar today is worth more than a dollar in the future because today's dollar can be invested to earn interest. We describe this time value using two closely related functions.

The **accumulation function**, denoted <span>&#92;(a(t)&#92;)</span>, gives the accumulated value at time <span>&#92;(t&#92;)</span> of an investment of $1 made at time 0. By definition, <span>&#92;(a(0) \equiv 1&#92;)</span>, and for positive interest rates the function is increasing. The **amount function**, <span>&#92;(A(t)&#92;)</span>, gives the accumulated value at time <span>&#92;(t&#92;)</span> of an initial investment of <span>&#92;(K&#92;)</span> (called the **principal**):

<span>&#92;[ A(t) = K \cdot a(t) &#92;]</span>

The **interest earned** between times <span>&#92;(t_1&#92;)</span> and <span>&#92;(t_2&#92;)</span> is simply the change in the amount function: <span>&#92;(A(t_2) - A(t_1)&#92;)</span>. In particular, the interest earned in the <span>&#92;(n&#92;)</span>-th year is <span>&#92;(A(n) - A(n-1)&#92;)</span>.

**Example.** Given <span>&#92;(A(t) = 2t^2 + 3t + 10&#92;)</span>, the principal is <span>&#92;(K = A(0) = 10&#92;)</span>, so <span>&#92;(a(t) = A(t)/K = 0.2t^2 + 0.3t + 1&#92;)</span>. The interest earned in the <span>&#92;(n&#92;)</span>-th year is <span>&#92;(A(n) - A(n-1) = 4n + 1&#92;)</span>, a linearly increasing function — each year earns a dollar more in interest than the previous year.

## Lesson 2: Simple Interest

Under **simple interest**, the accumulation function is linear:

<span>&#92;[ a(t) = 1 + it &#92;]</span>

where <span>&#92;(i&#92;)</span> is the annual rate of interest. Simple interest is most often used over short time periods. When counting days, there are three conventions: the **exact** method uses 365 days per year; the **ordinary** method approximates each month as 30 days (360 per year); and the **Banker's rule** counts exact days but divides by 360. In all cases, only one of the start or end date is counted, not both.

A key feature of simple interest is that the annual interest earned is constant at <span>&#92;(Ki&#92;)</span> regardless of which year you examine. This contrasts with compound interest, where interest is reinvested and grows over time.

**Worked Example: Day-Count Convention.** On May 6, 2019, Karen borrows $5,000 and repays $5,094 on June M, 2019, based on exact simple interest at 14.6%. Setting up the simple interest equation: <span>&#92;(5000(1 + 0.146 \cdot T/365) = 5094&#92;)</span> gives <span>&#92;(T = 47&#92;)</span> days. May has 31 days, so the days remaining in May after the 6th are <span>&#92;(31 - 6 = 25&#92;)</span> days; then <span>&#92;(47 - 25 = 22&#92;)</span> days into June. Karen repays on **June 22nd**.

**Worked Example: Three Simple Interest Methods.** Brad borrows $5,000 on October 14 at 8% simple interest, repaying on May 7. Under *exact simple interest* (denominator 365): count days from Oct 14 to May 7 as <span>&#92;(17 + 30 + 31 + 31 + 28 + 31 + 30 + 7 = 205&#92;)</span> days (assuming non-leap year), giving <span>&#92;(5000(1 + 0.08 \cdot 205/365) = \$5{,}224.66&#92;)</span>. Under *Banker's rule* (exact days, denominator 360): <span>&#92;(5000(1 + 0.08 \cdot 205/360) = \$5{,}227.78&#92;)</span>. Under *ordinary simple interest* (each month = 30 days, denominator 360): the numerator becomes <span>&#92;(30 - 14 + 30 + 30 + 30 + 30 + 30 + 30 + 7 = 203&#92;)</span>, giving <span>&#92;(5000(1 + 0.08 \cdot 203/360) = \$5{,}225.56&#92;)</span>. Banker's rule produces the highest repayment because more days of interest accrue per unit time.

## Lesson 3: Compound Interest

Under **compound interest**, the accumulation function is exponential:

<span>&#92;[ a(t) = (1+i)^t &#92;]</span>

Here interest is earned on both the principal and on the accumulated interest — "interest on interest." Over short periods <span>&#92;((0 < t < 1)&#92;)</span>, simple interest actually exceeds compound interest: <span>&#92;(1 + it > (1+i)^t&#92;)</span>. For <span>&#92;(t > 1&#92;)</span> the relationship reverses, and compound interest grows faster.

The **present value function** (or discount function) is the reciprocal of the accumulation function:

<span>&#92;[ v(t) = \frac{1}{a(t)} &#92;]</span>

Under compound interest, <span>&#92;(v(t) = (1+i)^{-t}&#92;)</span>. The factor <span>&#92;(v = (1+i)^{-1}&#92;)</span> is called the **annual discount factor** and is ubiquitous in actuarial notation. To find the present value of an amount <span>&#92;(X&#92;)</span> due at time <span>&#92;(t&#92;)</span>, we compute <span>&#92;(X \cdot v(t)&#92;)</span>.

Moving money from time <span>&#92;(t_1&#92;)</span> to time <span>&#92;(t_2&#92;)</span> requires multiplying by the ratio of accumulation functions. Under compound interest this simplifies to multiplying by <span>&#92;((1+i)^{t_2 - t_1}&#92;)</span>.

**Worked Example: Compound Interest Algebra.** At a certain compound interest rate: $1 grows to $2 in <span>&#92;(A&#92;)</span> years, $2 grows to $3 in <span>&#92;(B&#92;)</span> years, and $3 grows to $15 in <span>&#92;(C&#92;)</span> years. Express the time <span>&#92;(N&#92;)</span> for $6 to grow to $10 in terms of <span>&#92;(A&#92;)</span>, <span>&#92;(B&#92;)</span>, <span>&#92;(C&#92;)</span>.

The three conditions give <span>&#92;((1+i)^A = 2&#92;)</span>, <span>&#92;((1+i)^B = 3/2&#92;)</span>, <span>&#92;((1+i)^C = 5&#92;)</span>. We need <span>&#92;((1+i)^N = 10/6&#92;)</span>. Factor: <span>&#92;(10/6 = 5 \cdot (2/3) \cdot (1/2) = (1+i)^C \cdot (1+i)^{-B} \cdot (1+i)^{-A}&#92;)</span>. Therefore <span>&#92;[\boxed{N = C - B - A}&#92;]</span>. The key technique is factoring the target ratio into pieces that match the given accumulation factors.

## Lesson 4: Effective Rate of Interest and Discount

The **annual effective rate of interest** in the <span>&#92;(n&#92;)</span>-th year measures growth relative to the beginning-of-year balance:

<span>&#92;[ i_n = \frac{A(n) - A(n-1)}{A(n-1)} = \frac{a(n) - a(n-1)}{a(n-1)} &#92;]</span>

Under compound interest this is constant: <span>&#92;(i_n = i&#92;)</span> for all years. Under simple interest, <span>&#92;(i_n = i/(1 + i(n-1))&#92;)</span>, a decreasing function — later years earn proportionally less.

The **effective rate of discount**, by contrast, measures the interest relative to the *end-of-period* balance:

<span>&#92;[ d_n = \frac{A(n) - A(n-1)}{A(n)} &#92;]</span>

Think of it this way: if you borrow $1000 for a year and the interest of $43 is collected upfront at time 0, you actually receive $957 but repay $1000. The discount rate <span>&#92;(d = 43/1000 = 4.3\%&#92;)</span>, while the interest rate is <span>&#92;(i = 43/957 \approx 4.49\%&#92;)</span>. Under compound interest these are related by:

<span>&#92;[ d = \frac{i}{1+i}, \qquad i = \frac{d}{1-d}, \qquad 1-d = \frac{1}{1+i} = v &#92;]</span>

The compound interest accumulation function can be written in terms of <span>&#92;(d&#92;)</span> as <span>&#92;(a(t) = (1-d)^{-t}&#92;)</span>. Note that for the same underlying transaction, <span>&#92;(d < i&#92;)</span> always.

**Worked Example: Finding Effective Rates from a Quadratic Accumulation Function.** Suppose <span>&#92;(a(t) = 0.01t^2 + 0.03t + 1&#92;)</span>. Find <span>&#92;(i_2&#92;)</span> (effective rate in year 2) and <span>&#92;(d_4&#92;)</span> (effective rate of discount in year 4).

For <span>&#92;(i_2&#92;)</span>: the interest earned in year 2 is <span>&#92;(a(2) - a(1) = (0.04 + 0.06 + 1) - (0.01 + 0.03 + 1) = 1.10 - 1.04 = 0.06&#92;)</span>, divided by the opening balance <span>&#92;(a(1) = 1.04&#92;)</span>. So <span>&#92;(i_2 = 0.06/1.04 \approx 5.769\%&#92;)</span>.

For <span>&#92;(d_4&#92;)</span>: interest in year 4 is <span>&#92;(a(4) - a(3) = (0.16+0.12+1) - (0.09+0.09+1) = 1.28 - 1.18 = 0.10&#92;)</span>, divided by <span>&#92;(a(4) = 1.28&#92;)</span>. So <span>&#92;(d_4 = 0.10/1.28 \approx 7.813\%&#92;)</span>.

## Lesson 5: Simple Discount and Compound Discount

**Simple discount** uses a linear present value (discount) function:

<span>&#92;[ v(t) = 1 - dt, \quad 0 \le t < \frac{1}{d} &#92;]</span>

giving the accumulation function <span>&#92;(a(t) = 1/(1-dt)&#92;)</span>, which is nonlinear and only valid until <span>&#92;(t = 1/d&#92;)</span>. Unlike simple interest (where the effective rate decreases over time), under simple discount the effective interest rate <em>increases</em>: <span>&#92;(i_n = d/(1-dn)&#92;)</span>.

**Compound discount** uses an exponential discount function:

<span>&#92;[ v(t) = (1-d)^t &#92;]</span>

so <span>&#92;(a(t) = (1-d)^{-t}&#92;)</span>. This is simply compound interest reparameterized using the effective rate of discount. There is no structural difference between compound interest and compound discount — they are two descriptions of the same exponential accumulation.


**Worked Example: Simple vs. Compound Discount.** Accumulate $3,500 for 5 years at discount rate <span>&#92;(d = 4.5\%&#92;)</span>. Under *simple discount*: <span>&#92;(A = 3500/(1 - 0.045 \times 5) = 3500/0.775 = \$4{,}516.13&#92;)</span>. Under *compound discount*: <span>&#92;(A = 3500(1-0.045)^{-5} = \$4{,}406.07&#92;)</span>. Simple discount gives a higher accumulated value because the effective interest rate is increasing over time.

Comparing the effective annual rates: under simple discount, <span>&#92;(i_n = d/(1-dn)&#92;)</span>, which grows with <span>&#92;(n&#92;)</span> — the rate is 4.71% in year 1, 4.95% in year 2, 5.81% in year 3, and so on. Under compound discount, the effective rate is constant at <span>&#92;(d/(1-d) = 0.045/0.955 \approx 4.71\%&#92;)</span> — identical to simple discount only for the first year.

## Lesson 6: Current Value

The **current value** of a cash flow at any point in time is found by moving its value forward or backward using the accumulation or discount function. Under compound interest this is particularly clean: to move a value of <span>&#92;(X&#92;)</span> from time <span>&#92;(t_1&#92;)</span> to time <span>&#92;(t_2&#92;)</span>, multiply by <span>&#92;((1+i)^{t_2 - t_1}&#92;)</span> regardless of whether <span>&#92;(t_2 > t_1&#92;)</span> (future) or <span>&#92;(t_2 < t_1&#92;)</span> (past).

Under simple interest or simple discount, the current value depends on the original investment date, so we first recover the time-0 balance <span>&#92;(K = A(t_1)/a(t_1)&#92;)</span>, then compute <span>&#92;(K \cdot a(t_2)&#92;)</span>.

**Example.** Under simple interest with <span>&#92;(i = 6\%&#92;)</span>, if the balance at time 4.5 is $1350, the balance at time 7 is:

<span>&#92;[ 1350 \cdot \frac{1 + 0.06 \times 7}{1 + 0.06 \times 4.5} = \$1{,}509.45 &#92;]</span>

## Lesson 7: Nominal Rates of Interest and Discount

In practice, interest is often quoted as an **annual nominal rate** but compounded more frequently. The **annual nominal rate of interest compounded <span>&#92;(m&#92;)</span> times per year**, denoted <span>&#92;(i^{(m)}&#92;)</span>, means that <span>&#92;(i^{(m)}/m&#92;)</span> is the effective rate per <span>&#92;(1/m&#92;)</span> of a year. The accumulation function becomes:

<span>&#92;[ a(t) = \left(1 + \frac{i^{(m)}}{m}\right)^{mt} &#92;]</span>

Common values are <span>&#92;(m = 2&#92;)</span> (semiannual), <span>&#92;(m = 4&#92;)</span> (quarterly), <span>&#92;(m = 12&#92;)</span> (monthly). The annual effective rate is found by:

<span>&#92;[ 1 + i = \left(1 + \frac{i^{(m)}}{m}\right)^m &#92;]</span>

To compare rates with different compounding frequencies, convert them all to annual effective rates. When converting between two nominal rates <span>&#92;(i^{(m)}&#92;)</span> and <span>&#92;(i^{(k)}&#92;)</span>, use:

<span>&#92;[ \left(1 + \frac{i^{(m)}}{m}\right)^m = \left(1 + \frac{i^{(k)}}{k}\right)^k &#92;]</span>

Similarly, the **nominal rate of discount compounded <span>&#92;(m&#92;)</span> times per year**, <span>&#92;(d^{(m)}&#92;)</span>, gives the discount function <span>&#92;(v(t) = (1 - d^{(m)}/m)^{mt}&#92;)</span>.

As <span>&#92;(m&#92;)</span> increases (more frequent compounding), the nominal rates approach the **force of interest** <span>&#92;(\delta&#92;)</span> from above for interest and below for discount. For a given effective rate <span>&#92;(i&#92;)</span>:

<span>&#92;[ d < d^{(2)} < d^{(4)} < \cdots < \delta < \cdots < i^{(4)} < i^{(2)} < i &#92;]</span>

All these rates are equivalent — they produce the same accumulation.

**Worked Example: Comparing Nominal Interest vs. Nominal Discount.** A bank offers two rates: (a) <span>&#92;(i^{(12)} = 3\%&#92;)</span> and (b) <span>&#92;(d^{(12)} = 3\%&#92;)</span>. Which is better for an investor?

Convert both to annual effective rates. For (a): <span>&#92;(1 + i = (1 + 0.03/12)^{12} = 1.0304&#92;)</span>, so <span>&#92;(i = 3.04\%&#92;)</span>. For (b): <span>&#92;(1 + i = (1 - 0.03/12)^{-12} = 1.0305&#92;)</span>, so <span>&#92;(i = 3.05\%&#92;)</span>. The nominal discount rate of 3% compounded monthly corresponds to a *higher* effective rate than the nominal interest rate of 3% compounded monthly. An investor should prefer the discount rate option. This illustrates the ordering <span>&#92;(i^{(m)} > d^{(m)}&#92;)</span> for the same quoted number — the discount rate convention always represents a higher effective yield.

## Lesson 8: Force of Interest

The **force of interest** is the instantaneous relative rate of change in the accumulation function:

<span>&#92;[ \delta_t = \frac{d}{dt} \ln a(t) = \frac{a'(t)}{a(t)} &#92;]</span>

The subscript <span>&#92;(t&#92;)</span> reminds us that the force can vary with time. The accumulation function can be recovered from the force of interest by integration:

<span>&#92;[ a(t) = e^{\int_0^t \delta_s\, ds} &#92;]</span>

Under simple interest, <span>&#92;(\delta_t = i/(1+it)&#92;)</span>, a decreasing function. Under simple discount, <span>&#92;(\delta_t = d/(1-dt)&#92;)</span>, an increasing function. Under **compound interest**, the force of interest is constant:

<span>&#92;[ \delta = \ln(1+i) = i^{(\infty)} &#92;]</span>

This is also called the **constant force of interest**, or equivalently the annual nominal rate with continuous compounding. The compound interest accumulation function can then be written as <span>&#92;(a(t) = e^{\delta t}&#92;)</span>. The full hierarchy of compound interest parameterizations is:

<span>&#92;[ a(t) = (1+i)^t = (1-d)^{-t} = \left(1 + \frac{i^{(m)}}{m}\right)^{mt} = \left(1 - \frac{d^{(m)}}{m}\right)^{-mt} = e^{\delta t} &#92;]</span>

**Example.** Given a non-constant force of interest <span>&#92;(\delta_t = 0.03\sqrt{t}&#92;)</span>, the value of $100 invested at time <span>&#92;(t = 1&#92;)</span> grown to time <span>&#92;(t = 4&#92;)</span> is:

<span>&#92;[ 100 \cdot e^{\int_1^4 0.03\sqrt{s}\, ds} = 100 \cdot e^{0.03 \cdot \frac{2}{3}[s^{3/2}]_1^4} = 100 \cdot e^{0.02(8-1)} = 100e^{0.14} &#92;]</span>

**Key derivatives** (useful in later modules):
- <span>&#92;(\frac{d}{di} v = -v^2&#92;)</span>
- <span>&#92;(\frac{d}{di} \delta = e^{-\delta} = v&#92;)</span>
- <span>&#92;(\frac{d}{d\delta} d = e^{-\delta} = 1 - d&#92;)</span>

**Worked Example: Force of Interest from a Complex Accumulation Function.** Given <span>&#92;(a(t) = \sqrt{(1+0.001t^2)(1-0.01t)^{-1}}&#92;)</span> for <span>&#92;(0 \le t < 100&#92;)</span>, find <span>&#92;(\delta_5&#92;)</span>.

Use <span>&#92;(\delta_t = \frac{d}{dt}\ln a(t)&#92;)</span>. Take the natural log: <span>&#92;(\ln a(t) = 0.001t^2 - \ln(1-0.01t)&#92;)</span> (using the square root to halve the log, and properties of logs). Differentiating: <span>&#92;(\delta_t = 0.002t \cdot \frac{1}{2 \cdot 0.001t} \cdot \text{[chain rule]} \cdots&#92;)</span>. For the specific function used in lecture, the result is <span>&#92;(\delta_t = 0.01 + 0.002t + \frac{0.01}{1-0.01t}&#92;)</span>, so <span>&#92;(\delta_5 = 0.01 + 0.01 + 0.01/0.95 = 0.0305 = 3.05\%&#92;)</span>.

**Worked Example: Recovering a Balance from the Force of Interest.** Given <span>&#92;(\delta_t = 0.02/(1-0.01t)&#92;)</span> and a balance of $20,000 at time 10, find the balance at time 4.

First build <span>&#92;(a(t)&#92;)</span>: <span>&#92;(a(t) = \exp\!\left(\int_0^t \frac{0.02}{1-0.01x}\,dx\right) = \exp(-2\ln(1-0.01t)) = (1-0.01t)^{-2}&#92;)</span>. Move money from time 10 to time 4 using the ratio: <span>&#92;[ B_4 = 20{,}000 \cdot \frac{a(4)}{a(10)} = 20{,}000 \cdot \frac{(1-0.04)^{-2}}{(1-0.10)^{-2}} = 20{,}000 \cdot \left(\frac{0.9}{0.96}\right)^2 = \$17{,}578.13 &#92;]</span> The answer is less than $20,000 — as expected, since we are moving backward in time.

## Lesson 9: Inflation and Real Rate of Interest

When prices change over time, we distinguish between the **nominal rate of interest** <span>&#92;(i&#92;)</span> and the **real rate of interest** <span>&#92;(\tilde{i}&#92;)</span>. If prices grow according to an inflation rate <span>&#92;(r&#92;)</span>, the real accumulation function is the nominal accumulation divided by the price index:

<span>&#92;[ \tilde{a}(t) = \frac{a(t)}{p(t)} = \frac{(1+i)^t}{(1+r)^t} &#92;]</span>

The **real annual effective rate** is therefore:

<span>&#92;[ \tilde{i} = \frac{i - r}{1 + r} &#92;]</span>

This formula applies when both rates are effective with the same units. For monthly rates, replace <span>&#92;(i&#92;)</span> and <span>&#92;(r&#92;)</span> with <span>&#92;(i^{(12)}/12&#92;)</span> and <span>&#92;(r^{(12)}/12&#92;)</span> respectively. With continuous compounding, the formula simplifies beautifully: <span>&#92;(\tilde{\delta} = \delta - r^{(\infty)}&#92;)</span>.

**Worked Example: Real Rate with Different Compounding Frequencies.** The interest rate is 8% per annum compounded semi-annually and the inflation rate is 3% per annum compounded monthly. Find the real rate compounded monthly.

First convert the 8% semi-annual rate to an effective monthly rate: <span>&#92;(j_{\text{int}} = (1 + 0.08/2)^{2/12} - 1 = 1.04^{1/6} - 1 = 0.655820\%&#92;)</span> per month. The inflation rate is already monthly: <span>&#92;(j_{\text{inf}} = 3\%/12 = 0.25\%&#92;)</span> per month. The real rate per month is:
<span>&#92;[ \tilde{j} = \frac{j_{\text{int}} - j_{\text{inf}}}{1 + j_{\text{inf}}} = \frac{0.655820\% - 0.25\%}{1.0025} = 0.4057\% \text{ per month} &#92;]</span>
Annualizing: <span>&#92;(i^{(12)} = 12 \times 0.4057\% = 4.87\%&#92;)</span>. This is plausible — with 8% nominal interest and 3% inflation, the real rate is roughly 5%.

## Lesson 10: Equations of Value

An **equation of value** states that two sets of cash flows have the same value at some common reference date. The fundamental principle: if we accumulate (or discount) all cash flows to a common point in time using the same interest rate, equivalent cash flows have equal values.

For multiple cash flows, the present value of a stream with payments <span>&#92;(C_k&#92;)</span> at times <span>&#92;(t_k&#92;)</span> is:

<span>&#92;[ PV = \sum_k C_k \cdot v^{t_k} = \sum_k C_k (1+i)^{-t_k} &#92;]</span>

**Example.** A loan of $2000 is repaid by $750 after 1 year, $X after 1.5 years, and $1000 after 2 years with <span>&#92;(i^{(12)} = 6\%&#92;)</span>. Setting the present value of payments equal to the loan:

<span>&#92;[ 2000 = 750 \cdot 1.005^{-12} + X \cdot 1.005^{-18} + 1000 \cdot 1.005^{-24} \implies X = \$444.56 &#92;]</span>

**Worked Example: Present Value with a Quadratic in <span>&#92;(v^2&#92;)</span>.** You owe $200 in 2 years and $500 in 4 years, using <span>&#92;(i^{(4)} = 3\%&#92;)</span>. The effective rate per quarter is 0.75%, so:
<span>&#92;[ PV = 200(1.0075)^{-8} + 500(1.0075)^{-16} = \$632.05 &#92;]</span>
Now find the semiannual nominal rate <span>&#92;(i^{(2)}&#92;)</span> such that the PV is $600. Writing <span>&#92;(X = v^2&#92;)</span> (where <span>&#92;(v = (1+i^{(2)}/2)^{-1}&#92;)</span>), the equation <span>&#92;(500X^2 + 200X = 600&#92;)</span> simplifies to <span>&#92;(5X^2 + 2X - 6 = 0&#92;)</span>. The positive root is <span>&#92;(X = 0.91355&#92;)</span>. Since <span>&#92;(X = (1 + i^{(2)}/2)^{-2}&#92;)</span>, solving gives <span>&#92;(i^{(2)} = 4.57\%&#92;)</span>. Always use the full precision of <span>&#92;(X&#92;)</span> when solving for the rate — rounding intermediate results introduces error.

**Worked Example: Equation of Value as a Quadratic.** Brent deposits $5,000 at time 0 and $3,000 at time 9 months. After 18 months his balance is $10,726.51. Find the annual nominal rate compounded monthly. Let <span>&#92;(j&#92;)</span> be the monthly effective rate; letting <span>&#92;(X = (1+j)^9&#92;)</span>, the equation of value at 18 months is <span>&#92;(5000X^2 + 3000X = 10{,}726.51&#92;)</span>. The positive root is <span>&#92;(X = 1.195093&#92;)</span>, so <span>&#92;(j = 1.195093^{1/9} - 1 = 2.00\%&#92;)</span> per month, giving <span>&#92;(i^{(12)} = 24.00\%&#92;)</span>.

## Lesson 11: Net Present Value and Internal Rate of Return

The **net present value (NPV)** of an investment is the present value of all net cash flows (positive for inflows, negative for outflows):

<span>&#92;[ NPV(i) = C_0 + C_1 v + C_2 v^2 + \cdots + C_n v^n &#92;]</span>

The **internal rate of return (IRR)** is the interest rate <span>&#92;(i&#92;)</span> that makes the NPV equal to zero. It represents the yield earned by the investor.

For a simple loan (lend then receive repayments), the cash flows are initially negative (outflow) followed by positive. The balance at time <span>&#92;(t&#92;)</span> under the IRR is:

<span>&#92;[ B_t = \sum_{k=0}^{t} C_k (1+i)^{t-k} &#92;]</span>

**Uniqueness theorem:** If the balance <span>&#92;(B_t > 0&#92;)</span> for all <span>&#92;(t = 0, 1, \ldots, n-1&#92;)</span> and <span>&#92;(B_n = 0&#92;)</span>, then the IRR is unique. Economically, this means the roles of borrower and lender remain fixed throughout — the investor is always in a net lending position.

**Reinvestment:** The IRR can only be earned if all intermediate proceeds are reinvested at the IRR rate. If reinvestment occurs at a different rate <span>&#92;(j&#92;)</span>, the actual yield will differ from the IRR.

## Lesson 12: Time Value of Money Summary

The key relationships in this module are:

| Parameter | Relationship |
|-----------|-------------|
| Effective interest & discount | <span>&#92;(d = i/(1+i)&#92;)</span>, <span>&#92;(i = d/(1-d)&#92;)</span> |
| Compound interest parameterizations | <span>&#92;((1+i)^t = (1-d)^{-t} = e^{\delta t}&#92;)</span> |
| Force of interest | <span>&#92;(\delta = \ln(1+i) = i^{(\infty)}&#92;)</span> |
| Real rate | <span>&#92;(\tilde{i} = (i-r)/(1+r)&#92;)</span> |
| Nominal ↔ effective | <span>&#92;((1 + i^{(m)}/m)^m = 1+i&#92;)</span> |

---

# Module 2: Annuities

## Lesson 1: Geometric Progressions

A **geometric progression** is a sequence where each term is a constant multiple of the previous: <span>&#92;(\{a, ar, ar^2, \ldots\}&#92;)</span>. The sum of the first <span>&#92;(n&#92;)</span> terms is:

<span>&#92;[ \sum_{t=1}^n ar^{t-1} = \frac{a(1-r^n)}{1-r}, \quad r \ne 1 &#92;]</span>

This formula underlies virtually every annuity formula in this module. A regular series of level payments is an annuity; its present value is the sum of a geometric progression where each term is <span>&#92;(v = 1/(1+i)&#92;)</span> times the previous.

## Lesson 2: Annuity-Immediate

An **annuity-immediate** (also called an **ordinary annuity**) consists of payments of $1 at the *end* of each period for <span>&#92;(n&#92;)</span> periods. The **present value** (valued one period *before* the first payment) uses actuarial notation <span>&#92;(a_{\overline{n}|}&#92;)</span>:

<span>&#92;[ a_{\overline{n}|} = v + v^2 + \cdots + v^n = \frac{1 - v^n}{i}, \quad i \ne 0 &#92;]</span>

The **accumulated value** (at the time of the last payment) uses <span>&#92;(s_{\overline{n}|}&#92;)</span>:

<span>&#92;[ s_{\overline{n}|} = a_{\overline{n}|} \cdot (1+i)^n = \frac{(1+i)^n - 1}{i}, \quad i \ne 0 &#92;]</span>


For a payment amount of $R, multiply each formula by $R. The key equation linking PV and AV is:

<span>&#92;[ s_{\overline{n}|} = a_{\overline{n}|} \cdot (1+i)^n &#92;]</span>


**Worked Example: Counting Payments Carefully.** On July 10, 2010, Susan buys an annuity paying $1,000 every 3 months, with the first payment on October 10, 2010, and the final payment on April 10, 2019, priced at <span>&#92;(i^{(4)} = 5.2\%&#92;)</span>. How much does she pay?

To count payments, set July 10, 2010 as time 0. Each quarter advances by 1 period. July dates occur at times <span>&#92;(4(Y - 2010)&#92;)</span>, so July 2018 is time 32. The final payment (April 2019) is at time 35, meaning there are **35 payments**. The quarterly effective rate is <span>&#92;(j = 5.2\%/4 = 1.3\%&#92;)</span>. The price (one period before the first payment) is:
<span>&#92;[ P = 1000 \cdot a_{\overline{35}|1.3\%} = 1000 \cdot \frac{1 - 1.013^{-35}}{0.013} = \$27{,}976.08 &#92;]</span>
The total paid is $35,000 but the present value is much less because of discounting.

**Worked Example: Calculating Accumulated Value with Changing Rates.** Heather deposits $925 at the end of each quarter for 10 years. For the first 2 years the rate is 1% compounded quarterly; starting year 3 it rises to 2% compounded quarterly. The effective quarterly rates are <span>&#92;(j_1 = 0.25\%&#92;)</span> and <span>&#92;(j_2 = 0.5\%&#92;)</span>.

*Step 1:* Accumulated value of first 8 deposits at end of year 2: <span>&#92;(925 \cdot s_{\overline{8}|0.25\%} = \$7{,}465.07&#92;)</span>. *Step 2:* Grow this forward 32 quarters (8 more years) at 0.5%: <span>&#92;(7465.07 \times 1.005^{32} = \$8{,}756.85&#92;)</span>. *Step 3:* Accumulated value of the remaining 32 deposits at end of year 10: <span>&#92;(925 \cdot s_{\overline{32}|0.5\%} = \$32{,}012.98&#92;)</span>. *Total:* <span>&#92;(\$8{,}756.85 + \$32{,}012.98 = \$40{,}769.83&#92;)</span>.

## Lesson 3: Annuity-Due

An **annuity-due** consists of payments at the *beginning* of each period. The **present value** (at the time of the first payment) uses <span>&#92;(\ddot{a}_{\overline{n}|}&#92;)</span>:

<span>&#92;[ \ddot{a}_{\overline{n}|} = 1 + v + v^2 + \cdots + v^{n-1} = \frac{1 - v^n}{d}, \quad i \ne 0 &#92;]</span>

The **accumulated value** (one period after the last payment) uses <span>&#92;(\ddot{s}_{\overline{n}|}&#92;)</span>:

<span>&#92;[ \ddot{s}_{\overline{n}|} = \frac{(1+i)^n - 1}{d} &#92;]</span>

The annuity-due and annuity-immediate are related by exactly one period of interest:

<span>&#92;[ \ddot{a}_{\overline{n}|} = (1+i) \cdot a_{\overline{n}|}, \qquad \ddot{s}_{\overline{n}|} = (1+i) \cdot s_{\overline{n}|} &#92;]</span>

Intuitively, payments at the beginning of each period are each worth one period of interest more than the equivalent end-of-period payments.

## Lesson 4: Perpetuities

A **perpetuity** is an annuity with infinitely many payments. The present value of a **perpetuity-immediate** (first payment in one period) is:

<span>&#92;[ a_{\overline{\infty}|} = \lim_{n \to \infty} a_{\overline{n}|} = \frac{1}{i}, \quad i > 0 &#92;]</span>

For a **perpetuity-due** (first payment now):

<span>&#92;[ \ddot{a}_{\overline{\infty}|} = \frac{1+i}{i} = \frac{1}{d} &#92;]</span>

When the first payment is not exactly one full period away, adjust the perpetuity value by accumulating or discounting to the correct starting point. If the first payment is in <span>&#92;(k&#92;)</span> periods from now and the payment amount is $R:

<span>&#92;[ PV = \frac{R}{i} \cdot v^{k-1} &#92;]</span>

(discount the perpetuity-immediate value back <span>&#92;(k-1&#92;)</span> periods to today).


**Worked Example: Endowment Fund with Several Perpetuity Variants.** Emily donates $100,000 to establish annual scholarships, invested at <span>&#92;(i = 8\%&#92;)</span>.

*(a) First payment in one year:* This is a perpetuity-immediate. The annual scholarship is <span>&#92;(R = 100{,}000 \times 0.08 = \$8{,}000&#92;)</span>.

*(b) First payment immediately:* This is a perpetuity-due. Then <span>&#92;(100{,}000 = R/d = R(1+i)/i&#92;)</span>, so <span>&#92;(R = 100{,}000 \times 0.08/1.08 = \$7{,}407.41&#92;)</span>. Less than part (a) — the fund pays out immediately without first earning a full year of interest.

*(c) First payment in 6 months:* The payments are at times <span>&#92;(0.5, 1.5, 2.5, \ldots&#92;)</span>. Factoring out <span>&#92;(v^{-1/2}&#92;)</span> from the perpetuity sum yields <span>&#92;(PV = R(1+i)^{1/2}/i&#92;)</span>. Setting this to $100,000: <span>&#92;(R = 100{,}000 \times 0.08/\sqrt{1.08} = \$7{,}698.00&#92;)</span>. This falls between parts (a) and (b).

*(d) First payment in T years, scholarship $10,000:* The payments start at time <span>&#92;(T&#92;)</span>. The present value is <span>&#92;(10{,}000 \cdot v^{T-1}/i = 100{,}000&#92;)</span>, giving <span>&#92;(1.08^{T-1} = 1.35&#92;)</span>, so <span>&#92;(T = 1 + \ln(1.35)/\ln(1.08) = 4.899&#92;)</span> years.

## Lesson 5: Deferred Annuities

An **<span>&#92;(m&#92;)</span>-year deferred, <span>&#92;(n&#92;)</span>-year annuity-immediate** pays $R at the end of years <span>&#92;(m+1, m+2, \ldots, m+n&#92;)</span>. The present value (at time 0) is:

<span>&#92;[ PV = v^m \cdot a_{\overline{n}|} = a_{\overline{m+n}|} - a_{\overline{m}|} \quad (m \text{ a positive integer}) &#92;]</span>

The second formula interprets the deferred annuity as the difference of two annuities starting now. A similarly useful identity: the value of an annuity <span>&#92;(m&#92;)</span> periods after its last payment is <span>&#92;((1+i)^m s_{\overline{n}|} = s_{\overline{m+n}|} - s_{\overline{m}|}&#92;)</span>.



## Lesson 6: Nonlevel Annuities

When payment amounts vary, we decompose them into a sum of level annuities or handle each period's rate separately. Two common techniques:

1. **Group by payment level**: Write the cash flows as a combination of level annuities and deferred annuities. For example, payments of $75/month for year 1, $50/month for year 2, and $25/month for year 3 can be written as three deferred annuities or as <span>&#92;(25a_{\overline{12}|j} + 25a_{\overline{24}|j} + 25a_{\overline{36}|j}&#92;)</span>.

2. **Separate by period**: When the interest rate changes midway, calculate the accumulated value of the first batch, then grow it to the end under the new rate before adding the second batch's value.

**Worked Example: Nonlevel Payments — Two Methods.** An annuity pays $200/month for 2 years, $300/month for 1 year, then $400/month for 2 years at <span>&#92;(i^{(12)} = 10\%&#92;)</span>. Let <span>&#92;(j = 10\%/12 = 0.8\overline{3}\%&#92;)</span> per month.

*Method 1 — deferred annuities:*
<span>&#92;[ PV = 200a_{\overline{24}|j} + 300v^{24}a_{\overline{12}|j} + 400v^{36}a_{\overline{24}|j} = \$13{,}559.94 &#92;]</span>

*Method 2 — telescoping:* Start with 60 monthly payments of $400, then subtract 36 payments of $100 (since months 1–36 should be $100 less), then subtract another 24 payments of $100 (months 1–24 should be $100 less again):
<span>&#92;[ PV = 400a_{\overline{60}|j} - 100a_{\overline{36}|j} - 100a_{\overline{24}|j} = \$13{,}559.94 &#92;]</span>
Method 2 avoids deferred annuities and is often faster on a financial calculator.

## Lesson 7: Payments in Geometric Progression

When payments grow at a constant rate <span>&#92;(g&#92;)</span> per period, the first payment being $P, the present value (for a finite <span>&#92;(n&#92;)</span>-period annuity-immediate) is:

<span>&#92;[ PV = \frac{P}{1+g} \cdot a_{\overline{n}|i^*}, \quad \text{where } i^* = \frac{i - g}{1 + g} &#92;]</span>

This is the **real rate of interest** applied to an ordinary annuity of amount <span>&#92;(P/(1+g)&#92;)</span>. Alternatively, write it directly as a geometric series:

<span>&#92;[ PV = P \cdot v + P(1+g) \cdot v^2 + \cdots + P(1+g)^{n-1} \cdot v^n = \frac{P}{1+i} \cdot \frac{1 - \left(\frac{1+g}{1+i}\right)^n}{1 - \frac{1+g}{1+i}} &#92;]</span>

When <span>&#92;(n \to \infty&#92;)</span> and <span>&#92;(g < i&#92;)</span>, this converges to the **Gordon growth model**: <span>&#92;(PV = P/(i-g)&#92;)</span>, which reappears in Module 5 for stock valuation.

**Worked Example: Inflation-Adjusted Annuity.** An annuity pays $20,000 at end of year 1, each subsequent payment 5% higher for 10 years total, at <span>&#92;(i = 6\%&#92;)</span>. The PV is a geometric series with first term <span>&#92;(20000v&#92;)</span> and ratio <span>&#92;(1.05v = 1.05/1.06&#92;)</span>:
<span>&#92;[ PV = \frac{20000v\left(1-(1.05v)^{10}\right)}{1-1.05v} = \$180{,}867.50 &#92;]</span>
Alternatively, observe that the real rate <span>&#92;(j^* = (i-g)/(1+g) = 0.01/1.05 \approx 0.9524\%&#92;)</span>, and rewrite as <span>&#92;(PV = (20000/1.05) \cdot a_{\overline{10}|j^*}&#92;)</span> — this converts the growing annuity into a level annuity at the real rate, which is especially convenient with a financial calculator.

## Lesson 8: Payments in Arithmetic Progression (P–Q Formula)

For an annuity-immediate where the first payment is $P and each subsequent payment increases by $Q, the present value is:

<span>&#92;[ PV = P \cdot a_{\overline{n}|} + Q \cdot \frac{a_{\overline{n}|} - n v^n}{i} &#92;]</span>

This is called the **P–Q formula**. For an annuity-due, multiply by <span>&#92;((1+i)&#92;)</span>. Special case when <span>&#92;(P = Q = 1&#92;)</span> defines the increasing annuity <span>&#92;((Ia)_{\overline{n}|}&#92;)</span>:

<span>&#92;[ (Ia)_{\overline{n}|} = \frac{\ddot{a}_{\overline{n}|} - nv^n}{i} &#92;]</span>


**Worked Example: P–Q Formula in Practice.** Olga buys a 5-year increasing annuity: $2 at end of month 1, $4 at end of month 2, …, increasing by $2 each month. Nominal rate 9% compounded quarterly. First convert to a monthly rate: <span>&#92;(j = (1 + 0.09/4)^{1/3} - 1 = 0.744444\%&#92;)</span> per month (store all digits). With <span>&#92;(P = 2&#92;)</span>, <span>&#92;(Q = 2&#92;)</span>, <span>&#92;(n = 60&#92;)</span> months:
<span>&#92;[ X = 2 a_{\overline{60}|j} + \frac{2}{j}\left(a_{\overline{60}|j} - 60v^{60}\right) = \$2{,}729.21 &#92;]</span>
Rounding <span>&#92;(j&#92;)</span> to fewer decimal places at an intermediate step will produce a noticeably wrong final answer because <span>&#92;(j&#92;)</span> appears raised to the 60th power.

**Worked Example: Arithmetic Increasing Perpetuity.** A perpetuity-immediate has first payment $3 and each subsequent payment $2 larger. The PV is $406.81. Find <span>&#92;(i&#92;)</span>.

Taking <span>&#92;(n \to \infty&#92;)</span> in the P–Q formula: <span>&#92;(PV = P/i + Q/i^2 = 3/i + 2/i^2&#92;)</span>. Setting this equal to 406.81 and multiplying through by <span>&#92;(i^2&#92;)</span>:
<span>&#92;[ 406.81i^2 - 3i - 2 = 0 &#92;]</span>
The positive root is <span>&#92;(i = (3 + \sqrt{9 + 4 \times 406.81 \times 2})/(2 \times 406.81) = 7.39\%&#92;)</span>. The negative root is discarded since a perpetuity requires <span>&#92;(i > 0&#92;)</span>.

**Example (ladder payments).** An annuity paying $n at end of year <span>&#92;(n&#92;)</span> for <span>&#92;(n = 1, 2, \ldots, 50&#92;)</span> and $(100−n) for <span>&#92;(n = 51, \ldots, 99&#92;)</span> has a neat closed form. Multiplying the PV by <span>&#92;(v&#92;)</span> and subtracting gives <span>&#92;(PV(1-v) = a_{\overline{50}|} - v^{50} a_{\overline{50}|}&#92;)</span>, so <span>&#92;(PV = (1+i)(a_{\overline{50}|})^2&#92;)</span>.

## Lesson 9: Determining the Interest Rate

Given a present or accumulated value and a set of payments, finding the interest rate requires solving a polynomial equation. The **guess-and-check (bisection)** method works as follows: note whether the target is above or below the first guess, narrow the interval, and iterate. A financial calculator or spreadsheet solver handles this in practice.

For a loan with payment <span>&#92;(R&#92;)</span> and present value <span>&#92;(L&#92;)</span>:

<span>&#92;[ L = R \cdot a_{\overline{n}|i} \implies a_{\overline{n}|i} = L/R &#92;]</span>

Solve for <span>&#92;(i&#92;)</span> numerically.

## Lesson 10: Term of an Annuity and Final Payment

When solving for the number of payments <span>&#92;(n&#92;)</span>, the solution is typically non-integer. Two methods handle this:

1. **Smaller final payment**: Make <span>&#92;(\lfloor n \rfloor&#92;)</span> full payments of $R plus a smaller final payment at the same payment date.
2. **Full final payment**: Make <span>&#92;(\lceil n \rceil&#92;)</span> payments of $R, with the last one reduced below $R.

For an annuity-immediate with target value <span>&#92;(FV&#92;)</span>:

<span>&#92;[ n = \frac{\ln(FV \cdot i / R + 1)}{\ln(1+i)} \quad \text{(accumulated value)} &#92;]</span>

<span>&#92;[ n = \frac{-\ln(1 - L \cdot i / R)}{\ln(1+i)} \quad \text{(present value)} &#92;]</span>


**Worked Example: Finding the Term and Smaller Final Payment.** You borrow $10,000 repaid by level end-of-year payments of $1,000 at <span>&#92;(i = 4\%&#92;)</span>. Find the number of full payments and the smaller final payment.

Solve <span>&#92;(10 = a_{\overline{n}|4\%}&#92;)</span>: <span>&#92;(v^n = 1 - 0.04 \times 10 = 0.6&#92;)</span>, so <span>&#92;(n = \ln(0.6)/\ln(1/1.04) = 13.02&#92;)</span>. There are 13 full payments, plus a smaller 14th payment. The residual balance after 13 payments (prospective) is <span>&#92;(1000a_{\overline{13}|4\%}&#92;)</span>, and the final payment at time 14 is:
<span>&#92;[ x = (10{,}000 - 1000 a_{\overline{13}|4\%}) \times 1.04^{14} = \$24.85 &#92;]</span>
A quick sanity check: <span>&#92;(n = 13.02&#92;)</span> is just 0.02 beyond 13, so we expect the final payment to be roughly <span>&#92;(0.02 \times 1000 = \$20&#92;)</span>, and indeed $24.85 is in that vicinity.

**Worked Example: Annuity with Extra Deposits.** Chuck wants $500 in his account after 10 years. He deposits $20 at the beginning of each of the first 6 years, and extra <span>&#92;(X&#92;)</span> dollars at the beginning of years 5, 6, and 7. Annual effective rate is 10%. Setting accumulated values equal to $500:
<span>&#92;[ 20\ddot{s}_{\overline{6}|} \cdot 1.1^5 + X\ddot{s}_{\overline{3}|} \cdot 1.1^4 = 500 &#92;]</span>
(The annuity-due accumulated value is placed one period after the last payment, then grown to time 10.) Solving: <span>&#92;(X = \$51.89&#92;)</span>.

## Lesson 11: Annuities Using a General Accumulation Function

For a general accumulation function <span>&#92;(a(t)&#92;)</span> (not necessarily compound interest), the annuity formulas generalize as:

<span>&#92;[ a_{\overline{n}|} = v(1) + v(2) + \cdots + v(n), \quad s_{\overline{n}|} = a(n) \cdot a_{\overline{n}|} = \frac{a(n)}{a(1)} + \frac{a(n)}{a(2)} + \cdots + 1 &#92;]</span>

**Example.** A fund with year-by-year returns 5.2%, 4.8%, 3.8%, 6.1%, 5.5% and deposits of $100 at the start of each year: the balance at end of year 5 is computed by growing each deposit forward using the product of the relevant year-by-year accumulation factors.

**Worked Example: Deposits Every 4 Years.** Catherine deposits $100 at the beginning of each 4-year period for 40 years at annual effective rate <span>&#92;(i&#92;)</span>. The amount at year 40 is 5 times the amount at year 20. Find the amount at year 40.

Let <span>&#92;(j = (1+i)^4 - 1&#92;)</span> be the 4-year effective rate. At year 40 there are 10 deposits, at year 20 there are 5. The condition is:
<span>&#92;[ \frac{100\ddot{s}_{\overline{10}|j}}{100\ddot{s}_{\overline{5}|j}} = 5 &#92;]</span>
The discount denominators cancel and the numerator factors as <span>&#92;([(1+j)^{10}-1]/[(1+j)^5-1] = (1+j)^5 + 1 = 5&#92;)</span>, giving <span>&#92;((1+j)^5 = 4&#92;)</span>. Now:
<span>&#92;[ X = 100\ddot{s}_{\overline{10}|j} = 100 \cdot \frac{(1+j)^{10}-1}{1-(1+j)^{-1}} = 100 \cdot \frac{4^2 - 1}{1 - 4^{-1/5}} = \$6{,}194.72 &#92;]</span>

## Lesson 12: Payment Frequency

When the payment frequency does not match the interest conversion frequency, always convert the interest rate to match the payment frequency. If payments are <span>&#92;(k&#92;)</span> times per year and the given rate is <span>&#92;(i^{(m)}&#92;)</span>, the effective rate per payment period is:

<span>&#92;[ j = \left(1 + \frac{i^{(m)}}{m}\right)^{m/k} - 1 &#92;]</span>

Then proceed with the standard annuity formulas using <span>&#92;(j&#92;)</span> as the rate per period and the total number of payments as <span>&#92;(n&#92;)</span>.

## Lesson 13: Continuous Annuities

As the payment frequency <span>&#92;(m \to \infty&#92;)</span>, the present value of an annuity converges to the **continuous annuity** formula. An <span>&#92;(n&#92;)</span>-year annuity paying at a continuous rate of $1 per year has present value:

<span>&#92;[ \bar{a}_{\overline{n}|} = \frac{1 - v^n}{\delta} &#92;]</span>

where <span>&#92;(\delta = \ln(1+i)&#92;)</span> is the force of interest. The corresponding accumulated value is <span>&#92;(\bar{s}_{\overline{n}|} = (e^{\delta n} - 1)/\delta&#92;)</span>.

Continuous annuities can also be interpreted via integration: for a fund paying continuously at rate <span>&#92;(1&#92;)</span> per year:

<span>&#92;[ \bar{a}_{\overline{n}|} = \int_0^n v^t\, dt = \int_0^n e^{-\delta t}\, dt &#92;]</span>

This integral representation is especially useful when the discount function is non-standard (e.g., simple discount).

**Worked Example: Continuous Withdrawal Rate.** A fund of $43,000 accumulates at <span>&#92;(i = 4\%&#92;)</span> with money withdrawn continuously at $X per year. The fund is exhausted in 15.5 years. Then:
<span>&#92;[ 43{,}000 = X \bar{a}_{\overline{15.5}|} = X \cdot \frac{1 - v^{15.5}}{\delta} &#92;]</span>
where <span>&#92;(\delta = \ln(1.04)&#92;)</span>. Solving: <span>&#92;(X = 43{,}000\delta/(1 - 1.04^{-15.5}) = \$3{,}702.35&#92;)</span> per year.

**Worked Example: Time to Exhaust a Fund.** A fund of $1,600 accumulates at <span>&#92;(\delta = 5.5\%&#92;)</span> (continuously compounded) with continuous withdrawals of $150/year. Find when the fund is exhausted.

<span>&#92;[ 1600 = 150 \cdot \frac{1 - e^{-0.055n}}{0.055} \implies e^{-0.055n} = 1 - \frac{1600 \times 0.055}{150} = 0.4133 \implies n = 16.064 \text{ years} &#92;]</span>

## Lesson 14: Continuously Varying Continuous Annuities

For an annuity paying continuously at a *varying* rate <span>&#92;(r(t)&#92;)</span> per year at time <span>&#92;(t&#92;)</span>, the present value is:

<span>&#92;[ PV = \int_0^n r(t) \cdot v(t)\, dt &#92;]</span>

where <span>&#92;(v(t) = 1/a(t)&#92;)</span> is the discount function. Under compound interest, <span>&#92;(v(t) = e^{-\delta t}&#92;)</span>.

An important special case is the **increasing continuous annuity** paying at rate <span>&#92;(r(t) = t&#92;)</span>:

<span>&#92;[ \bar{(I\bar{a})}_{\overline{n}|} = \int_0^n t e^{-\delta t}\, dt = \frac{\bar{a}_{\overline{n}|} - nv^n}{\delta} &#92;]</span>

**Worked Example: Varying Payment Rate with Non-Constant Force of Interest.** Deposits flow into an account at rate <span>&#92;((7k + tk)&#92;)</span> dollars per year at time <span>&#92;(t&#92;)</span>, with force of interest <span>&#92;(\delta_t = 1/(7+t)&#92;)</span>. After 10 years the account is worth $20,000. Find <span>&#92;(k&#92;)</span>.

The accumulation function: <span>&#92;(a(t) = e^{\int_0^t 1/(7+x)\,dx} = (7+t)/7&#92;)</span> — a simple interest function. The discount function is <span>&#92;(v(t) = 7/(7+t)&#92;)</span>. The present value is:
<span>&#92;[ PV = \int_0^{10} k(7+t) \cdot \frac{7}{7+t}\,dt = \int_0^{10} 7k\,dt = 70k &#92;]</span>
The accumulated value at time 10 is <span>&#92;(70k \cdot a(10) = 70k \cdot 17/7 = 170k = 20{,}000&#92;)</span>, so <span>&#92;(k = \$117.65&#92;)</span>.

**Key derivatives** of annuity factors (useful in immunization, Module 6):

<span>&#92;[ \frac{d}{di} a_{\overline{n}|} = -v\left(a_{\overline{n}|} + \frac{nv^n}{i}\right), \qquad \frac{d}{d\delta} \bar{a}_{\overline{n}|} = -\bar{(I\bar{a})}_{\overline{n}|}, \qquad \frac{d}{dn} \bar{a}_{\overline{n}|} = v^n, \qquad \frac{d}{dn} \bar{s}_{\overline{n}|} = e^{\delta n} &#92;]</span>

## Lesson 15: Annuities Summary

| Annuity Type | Present Value | Accumulated Value |
|---|---|---|
| Immediate | <span>&#92;(a_{\overline{n}|} = (1-v^n)/i&#92;)</span> | <span>&#92;(s_{\overline{n}|} = ((1+i)^n-1)/i&#92;)</span> |
| Due | <span>&#92;(\ddot{a}_{\overline{n}|} = (1-v^n)/d&#92;)</span> | <span>&#92;(\ddot{s}_{\overline{n}|} = ((1+i)^n-1)/d&#92;)</span> |
| Continuous | <span>&#92;(\bar{a}_{\overline{n}|} = (1-v^n)/\delta&#92;)</span> | <span>&#92;(\bar{s}_{\overline{n}|} = (e^{\delta n}-1)/\delta&#92;)</span> |
| Perpetuity-immediate | <span>&#92;(1/i&#92;)</span> | — |
| Perpetuity-due | <span>&#92;((1+i)/i = 1/d&#92;)</span> | — |
| <span>&#92;(m&#92;)</span>-deferred <span>&#92;(n&#92;)</span>-immediate | <span>&#92;(v^m a_{\overline{n}|} = a_{\overline{m+n}|} - a_{\overline{m}|}&#92;)</span> | — |
| P–Q (arith. progression) | <span>&#92;(Pa_{\overline{n}|} + Q(a_{\overline{n}|}-nv^n)/i&#92;)</span> | multiply by <span>&#92;((1+i)^n&#92;)</span> |
| Geom. growth (<span>&#92;(P, g&#92;)</span>) | <span>&#92;(\frac{P}{i-g}(1-((1+g)/(1+i))^n)&#92;)</span> | — |

Key relationship between due and immediate: <span>&#92;(\ddot{a}_{\overline{n}|} = (1+i) a_{\overline{n}|}&#92;)</span> and <span>&#92;(\ddot{a}_{\overline{n}|} = 1 + a_{\overline{n-1}|}&#92;)</span>.

---

# Module 3: Loans

## Lesson 1: Outstanding Loan Balance

Consider a loan of amount <span>&#92;(L&#92;)</span> repaid by <span>&#92;(n&#92;)</span> level payments of <span>&#92;(R&#92;)</span> at the end of each period with effective rate <span>&#92;(i&#92;)</span> per period. The initial condition is:

<span>&#92;[ L = R \cdot a_{\overline{n}|} &#92;]</span>

At any time <span>&#92;(t&#92;)</span> during repayment, the **outstanding loan balance** can be computed by two equivalent methods:

**Retrospective method** (looks backward):
<span>&#92;[ B_t = L(1+i)^t - R \cdot s_{\overline{t}|} &#92;]</span>

**Prospective method** (looks forward):
<span>&#92;[ B_t = R \cdot a_{\overline{n-t}|} &#92;]</span>

Both give the same answer when payments are exactly level. If payments are rounded (e.g., to the nearest cent), the retrospective method is more accurate for intermediate balances; the prospective method gives the correct value only if we adjust the final payment. With a slightly smaller final payment <span>&#92;(R^*&#92;)</span>, the prospective formula is:

<span>&#92;[ B_t = R \cdot a_{\overline{n-t-1}|} + R^* (1+i)^{-(n-t)} &#92;]</span>

**Mortgage example.** A $480,000 mortgage at <span>&#92;(i^{(2)} = 7.6\%&#92;)</span> over 25 years has a bi-weekly effective rate of <span>&#92;(j = (1 + 0.076/2)^{1/13} - 1 = 0.2873\%&#92;)</span> and bi-weekly payment <span>&#92;(R = \$1{,}631.88&#92;)</span>. Choosing a shorter amortization period (20 or 15 years) dramatically reduces total interest paid — from $580,722 (25yr) to $318,736 (15yr).

**Worked Example: Retrospective vs. Prospective Balance.** A $20,000 loan at <span>&#92;(i = 8\%&#92;)</span> is repaid by $2,500/year plus a smaller final payment. First find <span>&#92;(n&#92;)</span>: solving <span>&#92;(a_{\overline{n}|8\%} = 8&#92;)</span> gives <span>&#92;(v^n = 0.36&#92;)</span>, so <span>&#92;(n = -\ln(0.36)/\ln(1.08) = 13.27&#92;)</span>. Thus 13 full payments plus a smaller 14th payment <span>&#92;(R^* = (20000 - 2500a_{\overline{13}|8\%}) \times 1.08^{14} = \$706.57&#92;)</span> (about 0.27 × $2,500, as expected from the fractional part).

The outstanding balance at end of year 6 via the **retrospective** method: <span>&#92;(B_6 = 20000(1.08)^6 - 2500s_{\overline{6}|8\%} = \$13{,}397.66&#92;)</span>. Via the **prospective** method: <span>&#92;(B_6 = 2500a_{\overline{7}|8\%} + 706.57 \cdot 1.08^{-8} = \$13{,}397.66&#92;)</span>. Both methods agree exactly.

## Lesson 2: Amortization of a Debt

Under the **amortization method**, each payment <span>&#92;(R&#92;)</span> splits into interest and principal portions. At time <span>&#92;(t&#92;)</span>:

- **Interest paid:** <span>&#92;(I_t = i \cdot B_{t-1} = R(1 - v^{n-t+1})&#92;)</span>
- **Principal repaid:** <span>&#92;(P_t = R - I_t = R \cdot v^{n-t+1}&#92;)</span>
- **Updated balance:** <span>&#92;(B_t = B_{t-1} - P_t = R \cdot a_{\overline{n-t}|}&#92;)</span>

The principal repaid grows geometrically: each period the principal portion increases by a factor of <span>&#92;((1+i)&#92;)</span>:

<span>&#92;[ P_{t+1} = (1+i) P_t &#92;]</span>

The complete amortization schedule:

| Time | Payment | Interest | Principal | Balance |
|------|---------|---------|---------|---------|
| 0 | — | — | — | <span>&#92;(Ra_{\overline{n}|}&#92;)</span> |
| 1 | <span>&#92;(R&#92;)</span> | <span>&#92;(R(1-v^n)&#92;)</span> | <span>&#92;(Rv^n&#92;)</span> | <span>&#92;(Ra_{\overline{n-1}|}&#92;)</span> |
| <span>&#92;(t&#92;)</span> | <span>&#92;(R&#92;)</span> | <span>&#92;(R(1-v^{n-t+1})&#92;)</span> | <span>&#92;(Rv^{n-t+1}&#92;)</span> | <span>&#92;(Ra_{\overline{n-t}|}&#92;)</span> |
| <span>&#92;(n&#92;)</span> | <span>&#92;(R&#92;)</span> | <span>&#92;(R(1-v)&#92;)</span> | <span>&#92;(Rv&#92;)</span> | 0 |

Total interest paid = <span>&#92;(nR - L&#92;)</span>.

## Lesson 3: Amortization Examples

Given any two adjacent rows of an amortization table, the interest rate can be recovered. Since <span>&#92;(P_{t+1} = (1+i) P_t&#92;)</span>:

<span>&#92;[ i = \frac{P_{t+1}}{P_t} - 1 &#92;]</span>

Given the interest paid at time <span>&#92;(t+1&#92;)</span>, the balance at time <span>&#92;(t&#92;)</span> is:

<span>&#92;[ B_t = \frac{I_{t+1}}{i} &#92;]</span>

These relationships allow reconstruction of a full amortization table from partial information. For mortgages, the principal in the 25<sup>th</sup> payment and the 37<sup>th</sup> payment differ by 12 periods of compounding: <span>&#92;(P_{37} = P_{25}(1+i)^{12}&#92;)</span>, allowing us to solve for the effective rate.

**Worked Example: Recovering Amortization Data from Two Balances.** A 4-year loan at <span>&#92;(i = 8\%&#92;)</span> with level end-of-year payments has outstanding balance $1,076.82 at end of year 2 and $559.12 at end of year 3. Since principal portions grow geometrically, the interest in year 3 is <span>&#92;(I_3 = 0.08 \times 1076.82 = 86.15&#92;)</span>. The principal in year 3 is <span>&#92;(P_3 = B_2 - B_3 = 1076.82 - 559.12 = 517.70&#92;)</span>. The payment is <span>&#92;(R = I_3 + P_3 = \$603.85&#92;)</span>. Since <span>&#92;(P_t/(1+i) = P_{t-1}&#92;)</span>, the principal at time 1 is <span>&#92;(P_1 = 517.70/1.08^2 = \$443.84&#92;)</span>.

## Lesson 4: Refinancing a Loan

When interest rates fall, it may be worth **refinancing** — paying a penalty to break the existing loan and take out a new loan at the lower rate. The analysis compares:

1. The outstanding balance plus any prepayment penalty as the new "amount borrowed"
2. The new payment under the new rate and remaining term

If the new payment is lower, refinancing saves money. The total savings depend on the penalty size and how much lower the new rate is.

**Canadian mortgages** are typically renegotiated every 5 years when the rate guarantee period expires. The penalty for breaking early is often 3 months' interest on the outstanding balance.

**Worked Example: Should Kenny Refinance?** Kenny buys $5,000 of furniture, pays $500 down, and finances $4,500 over 5 years at <span>&#92;(i^{(12)} = 12\%&#92;)</span> (<span>&#92;(j = 1\%&#92;)</span>/month). Monthly payment: <span>&#92;(R = 4500/a_{\overline{60}|1\%} = \$100.10&#92;)</span>. After 24 months, the retrospective balance is <span>&#92;(B_{24} = 4500(1.01)^{24} - 100.10 \cdot s_{\overline{24}|1\%} = \$3{,}013.76&#92;)</span>.

Kenny can refinance at <span>&#92;(i^{(12)} = 8.4\%&#92;)</span> (<span>&#92;(j^* = 0.7\%&#92;)</span>/month) but must pay a 3-month payment penalty. New loan: <span>&#92;(L^* = 3013.76 + 3 \times 100.10 = \$3{,}314.06&#92;)</span>. New payment over 36 remaining months: <span>&#92;(R^* = 3314.06/a_{\overline{36}|0.7\%} = \$104.46&#92;)</span>. Since $104.46 > $100.10, **refinancing is not worthwhile** — the penalty outweighs the interest savings.

## Lesson 5: Sinking Funds

With the **sinking fund method**, the borrower pays only interest each period to the lender, then repays all principal in one lump sum at the end. To fund the final payment, the borrower makes regular deposits into a separate **sinking fund** earning rate <span>&#92;(j&#92;)</span>:

<span>&#92;[ D = \frac{L}{s_{\overline{n}|j}} &#92;]</span>

The total cost per period is the interest payment plus the sinking fund deposit:

<span>&#92;[ iL + D = iL + \frac{L}{s_{\overline{n}|j}} &#92;]</span>

When <span>&#92;(j = i&#92;)</span>, this equals <span>&#92;(L/a_{\overline{n}|}&#92;)</span> — exactly the same as the amortization method payment. When the sinking fund earns less than the loan rate <span>&#92;((j < i)&#92;)</span>, the sinking fund method costs more. The outstanding "principal" at time <span>&#92;(t&#92;)</span> is the original loan minus the sinking fund balance: <span>&#92;(L - Ds_{\overline{t}|j}&#92;)</span>.

**Worked Example: Sinking Fund with Partial Amortization.** A 12-year, $8,000 loan at 8% charges interest of $640/year, but the borrower pays $800/year to the lender (partly reducing principal). At the end of 12 years, the remaining balance — computed retrospectively as <span>&#92;(8000(1.08)^{12} - 800s_{\overline{12}|8\%} = \$4{,}963.66&#92;)</span> — must be repaid via a sinking fund earning 4%. The required annual sinking fund deposit is <span>&#92;(X = 4963.66/s_{\overline{12}|4\%} = \$330.34&#92;)</span>.

**Worked Example: Mutual Fund Interest into a Bank Account.** Betty invests $10,000 in a mutual fund earning 8%. She withdraws the $800 annual interest and deposits it in a bank account earning 4%. The mutual fund balance stays at $10,000 throughout (interest is removed, not reinvested). After 10 years, the bank account holds <span>&#92;(800 \cdot s_{\overline{10}|4\%} = \$9{,}604.89&#92;)</span>. Total wealth: $10,000 + $9,604 = $19,604.

## Lesson 6: Loans Summary

**Principal repaid between times <span>&#92;(t_1&#92;)</span> and <span>&#92;(t_2&#92;)</span>:** <span>&#92;(B_{t_1} - B_{t_2}&#92;)</span>

**Interest paid between times <span>&#92;(t_1&#92;)</span> and <span>&#92;(t_2&#92;)</span>:** <span>&#92;(R(t_2 - t_1) - (B_{t_1} - B_{t_2})&#92;)</span>

**Sinking fund deposit:** <span>&#92;(D = L/s_{\overline{n}|j}&#92;)</span>, where <span>&#92;(j&#92;)</span> is the sinking fund rate

---

# Module 4: Bonds

## Lesson 1: Terminology and Basic Price Formula

A **bond** is a loan where the borrower (issuer) promises to pay:
- Periodic **coupons** of amount <span>&#92;(Fr&#92;)</span>, where <span>&#92;(F&#92;)</span> is the **face value** (par value) and <span>&#92;(r&#92;)</span> is the **coupon rate** per period
- A **redemption value** <span>&#92;(C&#92;)</span> at maturity (usually <span>&#92;(C = F&#92;)</span>, called redeemable at par)

The **yield to maturity** <span>&#92;(j&#92;)</span> is the effective rate per coupon period. The **bond price** is the present value of all payments at this yield:

<span>&#92;[ P = Fr \cdot a_{\overline{n}|j} + C v^n &#92;]</span>

This **basic bond price formula** contains five quantities: <span>&#92;(P, Fr, n, C, j&#92;)</span>. Given any four, the fifth can be found. For semiannual bonds, the annual yield is quoted as <span>&#92;(i^{(2)} = 2j&#92;)</span>.

**Worked Example: Bond with Changing Coupon Rates.** A 20-year $1,000 par bond with semi-annual coupons is redeemable at par. Coupon rate: 8% for the first 5 years, 9% for the next 5, 10% for the final 10 years. Amy purchases to yield <span>&#92;(i^{(2)} = 9.2\%&#92;)</span>, so <span>&#92;(j = 4.6\%&#92;)</span>. The coupons are $40 (first 10 periods), $45 (next 10), and $50 (last 20). The price uses deferred annuities:
<span>&#92;[ P = 40a_{\overline{10}|j} + 45v^{10}a_{\overline{10}|j} + 50v^{20}a_{\overline{20}|j} + 1000v^{40} = \$968.72 &#92;]</span>
Since the weighted average coupon rate (about 9.25%) is close to the yield (9.2%), the price is near par.

## Lesson 2: Premium and Discount Pricing Formula

Using the identity <span>&#92;(v^n = 1 - ja_{\overline{n}|}&#92;)</span>, the basic formula rewrites as the **premium/discount formula**:

<span>&#92;[ P = C + (Fr - Cj) a_{\overline{n}|} &#92;]</span>

- **Premium bond:** <span>&#92;(Fr > Cj \implies P > C&#92;)</span>. For par bonds (<span>&#92;(C = F&#92;)</span>): <span>&#92;(r > j \implies P > F&#92;)</span>
- **Discount bond:** <span>&#92;(Fr < Cj \implies P < C&#92;)</span>. For par bonds: <span>&#92;(r < j \implies P < F&#92;)</span>
- **Par bond:** <span>&#92;(Fr = Cj \implies P = C&#92;)</span>. For par bonds: <span>&#92;(r = j \implies P = F&#92;)</span>

The amount of premium is <span>&#92;(P - C = (Fr - Cj)a_{\overline{n}|}&#92;)</span>. The amount of discount is <span>&#92;(C - P&#92;)</span>.

**Worked Example: Using the Premium/Discount Formula.** A 28-year $1,200 par bond pays annual coupons at rate <span>&#92;(r = 2i&#92;)</span> (double the yield). Bart pays $1,968. Find the sale price after 7 years.

From the premium/discount formula: <span>&#92;(1968 = 1200 + 1200(2i - i)a_{\overline{28}|}&#92;)</span>. Since <span>&#92;(i \cdot a_{\overline{28}|} = 1 - v^{28}&#92;)</span>:
<span>&#92;[ 1968 = 1200 + 1200(1 - v^{28}) \implies v^{28} = 0.36 &#92;]</span>
At time 7 with 21 coupons remaining: <span>&#92;(B_7 = 1200 + 1200(1 - v^{21}) = 2400 - 1200 \times 0.36^{21/28} = \$1{,}842.29&#92;)</span>. The key trick: the premium/discount formula absorbs the interest rate into <span>&#92;(v^n&#92;)</span>, letting us solve without explicitly finding <span>&#92;(i&#92;)</span>.

## Lesson 3: Bond Amortization

A bond is analogous to a loan from the bondholder's perspective. The **book value** at time <span>&#92;(t&#92;)</span> is the present value of remaining payments at the original yield:

<span>&#92;[ B_t = Fr \cdot a_{\overline{n-t}|j} + C v^{n-t} = C + (Fr - Cj) a_{\overline{n-t}|j} &#92;]</span>

At each coupon date, the **interest earned** is <span>&#92;(I_t = j B_{t-1} = Fr - (Fr - Cj)v^{n-t+1}&#92;)</span>, and the **book value adjustment** (amount written down or up) is:

<span>&#92;[ P_t = Fr - I_t = (Fr - Cj) v^{n-t+1} &#92;]</span>

Book value adjustments grow geometrically: <span>&#92;(P_{t+1} = (1+j) P_t&#92;)</span>. For a **premium bond**, book values decrease toward <span>&#92;(C&#92;)</span> (**writing down** the premium). For a **discount bond**, book values increase toward <span>&#92;(C&#92;)</span> (**writing up** the discount).

**Worked Example: Interest Portion of the 7th Coupon.** A $10,000 par 10-year bond with 8% annual coupons is bought at a premium to yield 6%. The coupon is $800. To find the interest earned in the 7th coupon, first compute the book value at time 6 (4 coupons remaining):
<span>&#92;[ B_6 = 800a_{\overline{4}|6\%} + 10000(1.06)^{-4} = \$10{,}693.02 &#92;]</span>
The interest portion of the 7th coupon is <span>&#92;(I_7 = 0.06 \times 10{,}693.02 = \$641.58&#92;)</span>. The remaining <span>&#92;(800 - 641.58 = \$158.42&#92;)</span> is the premium writedown (principal adjustment).

## Lesson 4: Book Value Between Coupon Dates

Between coupon dates, two price concepts apply:

**Dirty price** (actual purchase price): accumulate the most recent coupon-date price for fraction <span>&#92;(f&#92;)</span> of a period:

<span>&#92;[ P_f = (1+j)^f P_0 &#92;]</span>

where <span>&#92;(P_0&#92;)</span> is the price at the last coupon date (using current market yield <span>&#92;(j&#92;)</span) and <span>&#92;(f = \text{days since last coupon}/\text{days in coupon period}&#92;)</span>.

**Semi-practical clean price** (used for quoting): subtract the accrued coupon:

<span>&#92;[ \text{Clean price} = P_f - f \cdot Fr &#92;]</span>

Bond quotes are the clean price per $100 of face value. The clean price removes the effect of where we are in the coupon cycle, making bonds with the same yield but different coupon dates more comparable.

**Alternative clean price (linear interpolation):**
<span>&#92;[ B_{t+f} = (1-f) B_t + f B_{t+1} &#92;]</span>

**Worked Example: Dirty and Clean Price.** A $1,000 par bond redeemable December 1, 2021, with 7% semi-annual coupons. Find the dirty and clean price on August 8, 2010, to yield <span>&#92;(i^{(2)} = 6\%&#92;)</span> (<span>&#92;(j = 3\%&#92;)</span>). Coupon = $35.

The last coupon date is June 1, 2010 (time 0). From June 1 to December 1, 2021, there are 23 remaining coupons. The price at June 1: <span>&#92;(B_0 = 35a_{\overline{23}|3\%} + 1000(1.03)^{-23} = \$1{,}082.22&#92;)</span>.

Count days: June 1 to August 8 = 68 days; June 1 to December 1 = 183 days. The fraction is <span>&#92;(f = 68/183&#92;)</span>.

**Dirty price:** <span>&#92;(P_f = 1082.22 \times 1.03^{68/183} = \$1{,}094.17&#92;)</span>.

**Clean price:** <span>&#92;(1094.17 - (68/183) \times 35 = \$1{,}081.16&#92;)</span>.

## Lesson 5: Determining the Yield Rate

When a bond is bought and then sold before maturity, the investor's yield over the holding period is found by solving for the rate that equates the purchase price to the present value of received cash flows (coupons plus sale proceeds). Use a financial calculator: enter PV (negative), payments, FV, and compute the rate.

## Lesson 6: Callable Bonds

A **callable bond** gives the issuer the right to redeem the bond early on specified dates, usually at slightly higher redemption values. This is analogous to a mortgage prepayment privilege.

When purchasing a callable bond to guarantee a minimum yield:
- Calculate the price at each possible call date assuming the desired yield rate
- The **minimum of all these prices** guarantees the desired minimum yield

**Reasoning:** if the issuer calls early when it is in their interest (when rates have fallen), the investor gets a higher return. If the issuer calls at the date giving the lowest price, the investor just earns the desired yield. Any other call date yields more.

For a **premium bond** (<span>&#92;(Fr > Cj&#92;)</span>), the earlier call date typically produces the lower price (shorter annuity of the premium). For a **discount bond**, the later maturity date produces the lower price. When the call redemption value differs from the maturity redemption value, compute the price at every possible call/maturity date and take the minimum.

## Lesson 7: Bonds Summary

| Formula | Expression |
|---------|-----------|
| Basic price | <span>&#92;(P = Fra_{\overline{n}|j} + Cv^n&#92;)</span> |
| Premium/discount | <span>&#92;(P = C + (Fr - Cj)a_{\overline{n}|j}&#92;)</span> |
| Book value at time <span>&#92;(t&#92;)</span> | <span>&#92;(B_t = C + (Fr - Cj)a_{\overline{n-t}|j}&#92;)</span> |
| Book value adjustment | <span>&#92;(P_t = (Fr - Cj)v^{n-t+1}&#92;)</span>, grows as <span>&#92;(P_{t+1} = (1+j)P_t&#92;)</span> |
| Dirty price | <span>&#92;(P_f = (1+j)^f P_0&#92;)</span> |
| Clean price | <span>&#92;(P_f - fFr&#92;)</span> |
| Callable: guarantee yield | Take minimum price over all possible call dates |

---

# Module 5: General Cash Flows and Portfolios

## Lesson 1a: Stock Dividend Model

Corporations raise capital through bonds, **preferred stock**, and **common stock**. Bondholders have priority over preferred shareholders, who in turn have priority over common shareholders. The **dividend discount model** sets the stock price equal to the present value of all future dividends.

For **preferred stock** with fixed dividends of $D per period:

<span>&#92;[ P = \frac{D}{i} &#92;]</span>

(a perpetuity). For **common stock** with dividends growing at rate <span>&#92;(g&#92;)</span> per period:

<span>&#92;[ P = \frac{D_1}{i - g}, \quad i > g &#92;]</span>

where <span>&#92;(D_1&#92;)</span> is the next dividend. This is the **Gordon Growth Model**. Given the price and next dividend, the implied growth rate is <span>&#92;(g = i - D_1/P&#92;)</span>.

## Lesson 1b: Rates of Return

The **net present value** and **internal rate of return** from Module 1 generalize to arbitrary investment cash flows. An investment with net cash flows <span>&#92;(C_0, C_1, \ldots, C_n&#92;)</span> has:

<span>&#92;[ NPV(i) = \sum_{t=0}^n C_t v^t &#92;]</span>

The IRR is the solution to <span>&#92;(NPV(i) = 0&#92;)</span>. Multiple IRRs can exist; the **uniqueness theorem** guarantees a unique positive IRR if the retrospective balance <span>&#92;(B_t > 0&#92;)</span> for all <span>&#92;(t = 0, \ldots, n-1&#92;)</span>. When the balance changes sign (the investor sometimes receives more than they've invested), multiple valid yield rates can exist.

**Technology note — Excel IRR and RATE functions.** `=IRR(range)` solves for the rate per period given arbitrary cash flows (positive and negative) in a column. `=RATE(nper, pmt, pv)` solves for the rate of a level annuity. Both return the effective rate *per period* — multiply by the number of periods per year to annualize as a nominal rate. The IRR function is more flexible (handles nonlevel cash flows); the RATE function is limited to level annuities but simpler to use. Both accept an optional guess argument to steer the solver.

## Lesson 2: Dollar-Weighted Rate of Interest

For a fund with opening balance <span>&#92;(A&#92;)</span>, closing balance <span>&#92;(B&#92;)</span>, and net contributions <span>&#92;(C_{t_k}&#92;)</span> at times <span>&#92;(t_k \in (0,1)&#92;)</span>, the **approximate dollar-weighted yield** over one year is:

<span>&#92;[ i \approx \frac{I}{A + \sum_{k} C_{t_k}(1 - t_k)} &#92;]</span>

where the interest earned is <span>&#92;(I = B - A - \sum_k C_{t_k}&#92;)</span>. The denominator is the "exposure" — the opening balance plus each deposit weighted by the fraction of the year it was in the fund.

Over a <span>&#92;(T&#92;)</span>-year period, the nominal rate approximation is:

<span>&#92;[ j \approx \frac{I}{TA + \sum_k C_{t_k}(T - t_k)} &#92;]</span>

with annual effective rate <span>&#92;(i = (1 + jT)^{1/T} - 1&#92;)</span>.

## Lesson 3: Time-Weighted Rate of Interest

The **time-weighted yield** removes the effect of the timing of deposits and withdrawals, measuring the fund's performance independently of investor cash flows. Between consecutive contribution dates <span>&#92;(t_{k-1}&#92;)</span> and <span>&#92;(t_k&#92;)</span>, the sub-period accumulation factor is:

<span>&#92;[ 1 + i_k = \frac{B_{t_k}}{B_{t_{k-1}} + C_{t_{k-1}}} &#92;]</span>

(balance just before the contribution at <span>&#92;(t_k&#92;)</span>, divided by balance just after the contribution at <span>&#92;(t_{k-1}&#92;)</span>). The time-weighted annual effective yield is:

<span>&#92;[ (1+i)^T = \prod_{k=1}^m (1 + i_k) &#92;]</span>

**Key insight:** Dollar-weighted yield rewards (or penalizes) investors for the *timing* of their contributions. The time-weighted yield is a property of the fund manager, independent of when investors enter or exit.

## Lesson 4: Term Structure of Interest Rates

The **yield curve** plots bond yields against time to maturity. A **zero-coupon bond** (strip bond) pays only a redemption amount at maturity. The **<span>&#92;(n&#92;)</span>-year spot rate** <span>&#92;(r_n&#92;)</span> is the annual effective yield on an <span>&#92;(n&#92;)</span>-year zero-coupon bond:

<span>&#92;[ r_n = \left(\frac{F}{P}\right)^{1/n} - 1 &#92;]</span>

A coupon bond can be priced using spot rates by discounting each cash flow at its own maturity's spot rate:

<span>&#92;[ P = Fr(1+r_1)^{-1} + Fr(1+r_2)^{-2} + \cdots + (Fr + C)(1+r_n)^{-n} &#92;]</span>

**Bootstrapping:** Given a sequence of coupon bonds with increasing maturities, extract spot rates recursively. Use the 1-year bond to find <span>&#92;(r_1&#92;)</span>, then solve for <span>&#92;(r_2&#92;)</span> using the 2-year bond and known <span>&#92;(r_1&#92;)</span>, and so on.

**Forward rates:** The <span>&#92;(n&#92;)</span>-year deferred, <span>&#92;(m&#92;)</span>-year forward rate <span>&#92;(f_{[n,n+m]}&#92;)</span> is the rate used to move value between times <span>&#92;(n&#92;)</span> and <span>&#92;(n+m&#92;)</span>, consistent with the spot rates:

<span>&#92;[ (1+r_n)^n \cdot (1 + f_{[n,n+m]})^m = (1+r_{n+m})^{n+m} &#92;]</span>

so <span>&#92;(f_{[n,n+m]} = \left(\frac{(1+r_{n+m})^{n+m}}{(1+r_n)^n}\right)^{1/m} - 1&#92;)</span>.

## Lesson 5: Summary

| Concept | Formula |
|---------|---------|
| Stock price (fixed dividend) | <span>&#92;(P = D/i&#92;)</span> |
| Stock price (growing dividend) | <span>&#92;(P = D_1/(i-g)&#92;)</span> |
| Dollar-weighted yield | <span>&#92;(i \approx I / (A + \sum C_{t_k}(1-t_k))&#92;)</span> |
| Time-weighted yield | <span>&#92;((1+i)^T = \prod(1+i_k)&#92;)</span> |
| <span>&#92;(n&#92;)</span>-year spot rate | <span>&#92;(r_n = (F/P)^{1/n} - 1&#92;)</span> |
| Forward rate | <span>&#92;(f_{[n,n+m]} = ((1+r_{n+m})^{n+m}/(1+r_n)^n)^{1/m} - 1&#92;)</span> |

---

# Module 6: Duration, Convexity, and Immunization

## Lesson 1: Macaulay Duration

**Duration** measures the interest-rate sensitivity of a portfolio of cash flows. Intuitively, it is the weighted average time of payment, where the weights are the present values of each cash flow. For cash flows <span>&#92;(C_t&#92;)</span> at times <span>&#92;(t \ge 0&#92;)</span> with present value <span>&#92;(P(i) = \sum_t C_t v^t&#92;)</span>, the **Macaulay duration** is:

<span>&#92;[ D^{(\infty)}(i) = \frac{\sum_{t \ge 0} t C_t v^t}{P(i)} &#92;]</span>

An equivalent calculus-based definition: Macaulay duration is the negative of the relative rate of change of present value with respect to the force of interest:

<span>&#92;[ D^{(\infty)}(i) = -\frac{d}{d\delta} \ln P(i) &#92;]</span>

**Properties:**
- For a zero-coupon bond maturing at time <span>&#92;(n&#92;)</span>: <span>&#92;(D^{(\infty)} = n&#92;)</span> (independent of yield)
- Longer-maturity bonds have longer durations
- Higher-coupon bonds have shorter durations than lower-coupon bonds of the same maturity
- Duration for a perpetuity: <span>&#92;(D^{(\infty)} = (1+i)/i&#92;)</span>

For a **coupon bond**, use the P–Q formula to evaluate the numerator sum:

<span>&#92;[ \sum_{t=1}^n t \cdot Fr \cdot v^t + n \cdot C v^n = Fr \cdot (Ia)_{\overline{n}|} + n C v^n = Fr \cdot \frac{\ddot{a}_{\overline{n}|} - nv^n}{i} + n C v^n &#92;]</span>

## Lesson 2: Modified Duration

While Macaulay duration measures sensitivity to changes in <span>&#92;(\delta&#92;)</span> (force of interest), **modified duration** measures sensitivity to changes in the annual nominal rate <span>&#92;(i^{(m)}&#92;)</span>:

<span>&#92;[ D^{(m)}(i) = -\frac{d}{di^{(m)}} \ln P(i) = \frac{\sum_{t \ge 0} t C_t v^{t + 1/m}}{P(i)} &#92;]</span>

Modified duration is related to Macaulay duration by discounting one period:

<span>&#92;[ D^{(m)}(i) = v^{1/m} D^{(\infty)}(i) = \left(1 + \frac{i^{(m)}}{m}\right)^{-1} D^{(\infty)}(i) &#92;]</span>

For annual payments (<span>&#92;(m = 1&#92;)</span>), we write <span>&#92;(D(i) = vD^{(\infty)}(i)&#92;)</span>.

**Interpretation:** If the yield increases by <span>&#92;(\varepsilon&#92;)</span> (in annual effective rate), the approximate percentage change in price is <span>&#92;(-D(i) \cdot \varepsilon&#92;)</span>.

## Lesson 3: Convexity

Duration provides a first-order approximation. The **convexity** captures the second-order (curvature) effect. The **Macaulay convexity** is:

<span>&#92;[ C^{(\infty)}(i) = \frac{\sum_{t \ge 0} t^2 C_t v^t}{P(i)} &#92;]</span>

The **modified convexity** (for annual payments, <span>&#92;(m = 1&#92;)</span>) is:

<span>&#92;[ C(i) = \frac{P''(i)}{P(i)} = \frac{\sum_{t \ge 0} t(t+1) C_t v^{t+2}}{P(i)} &#92;]</span>

Using a Taylor expansion, the **approximate relative price change** when the yield moves from <span>&#92;(i_0&#92;)</span> to <span>&#92;(i_0 + \varepsilon&#92;)</span> is:

<span>&#92;[ \frac{P(i_0 + \varepsilon) - P(i_0)}{P(i_0)} \approx -D(i_0) \cdot \varepsilon + C(i_0) \cdot \frac{\varepsilon^2}{2} &#92;]</span>

The duration term gives the linear (first-order) change; convexity adds a positive second-order correction. This means that for a given duration, higher convexity is preferred — the bond loses less when rates rise and gains more when rates fall.


**Risk implication:** Among bonds with the same duration, a **zero-coupon bond** has the highest sensitivity to interest rates (and least convexity relative to its duration), while high-coupon bonds are less sensitive.

## Lesson 4: Asset-Liability Management and Immunization

**Asset-liability management** (ALM) balances a fund's inflows (assets) against its outflows (liabilities). Define:

<span>&#92;[ P_A(i) = \sum_t A_t v^t, \quad P_L(i) = \sum_t L_t v^t, \quad S(i) = P_A(i) - P_L(i) &#92;]</span>

**Exact matching** (cash flow matching) sets <span>&#92;(A_t = L_t&#92;)</span> for all <span>&#92;(t&#92;)</span>. This is the safest approach — the surplus is zero regardless of interest rate.

When exact matching is unavailable, **Redington's immunization** provides protection against small interest rate changes. A fund is **immunized** at rate <span>&#92;(i_0&#92;)</span> if <span>&#92;(S(i_0) = 0&#92;)</span> and <span>&#92;(S(i_0 + \varepsilon) \ge 0&#92;)</span> for small <span>&#92;(|\varepsilon|&#92;)</span>.

**Redington's conditions** (sufficient for immunization):
1. <span>&#92;(P_A(i_0) = P_L(i_0)&#92;)</span> — present values equal
2. <span>&#92;(D_A(i_0) = D_L(i_0)&#92;)</span> — durations equal
3. <span>&#92;(C_A(i_0) > C_L(i_0)&#92;)</span> — convexity of assets exceeds that of liabilities

In summation form (for annual cash flows):
1. <span>&#92;(\sum_t A_t v^t = \sum_t L_t v^t&#92;)</span>
2. <span>&#92;(\sum_t t A_t v^t = \sum_t t L_t v^t&#92;)</span>
3. <span>&#92;(\sum_t t^2 A_t v^t > \sum_t t^2 L_t v^t&#92;)</span>

**Geometric interpretation:** Conditions 1 and 2 say the surplus function has a zero with horizontal tangent at <span>&#92;(i_0&#92;)</span>. Condition 3 ensures it's a local minimum, so the surplus is non-negative for nearby rates.

**Practical challenges:** Real yield curves are not flat (long-term rates differ from short-term rates), interest rate changes need not be parallel shifts, and future cash flows may be uncertain.

## Lesson 5: Immunization Summary

| Concept | Formula |
|---------|---------|
| Macaulay duration | <span>&#92;(D^{(\infty)} = \sum_t t C_t v^t / P&#92;)</span> |
| Modified duration (<span>&#92;(m=1&#92;)</span>) | <span>&#92;(D = \sum_t t C_t v^{t+1}/P = vD^{(\infty)}&#92;)</span> |
| Modified convexity (<span>&#92;(m=1&#92;)</span>) | <span>&#92;(C = \sum_t t(t+1) C_t v^{t+2}/P&#92;)</span> |
| Price change approximation | <span>&#92;(\Delta P/P \approx -D\varepsilon + C\varepsilon^2/2&#92;)</span> |
| Redington condition 1 | <span>&#92;(P_A = P_L&#92;)</span> |
| Redington condition 2 | <span>&#92;(D_A = D_L&#92;)</span> |
| Redington condition 3 | <span>&#92;(C_A > C_L&#92;)</span> |

---

## Appendix: BA II Plus Calculator Notes

**Setup:** Press `2ND` → `FORMAT` → set decimal places to 9 → press `↑` → `2ND` `ENTER` to switch from Chain (CHN) to Algebraic (AOS) order of operations → `2ND` `QUIT`.

**TVM functions:** The five TVM keys (`N`, `I/Y`, `PV`, `PMT`, `FV`) solve the equation <span>&#92;(PV + PMT \cdot a_{\overline{n}|} + FV \cdot v^n = 0&#92;)</span>. Enter `I/Y` as a percentage (not a decimal). Cash flows in opposite directions must have opposite signs — e.g., enter PMT as negative if PV is positive.

**Annuity-due:** Press `2ND` → `PMT` (BGN) → `2ND` `ENTER` to toggle between END and BGN mode. The display shows "BGN" when beginning-of-period payments are active. **Caution:** always switch back to END after computing an annuity-due value — forgetting this is a common exam error.

**Discount rate conversion:** To convert a nominal discount rate <span>&#92;(d^{(m)}&#92;)</span> to an effective interest rate per period: enter <span>&#92;(d^{(m)}/m&#92;)</span>, press `+/-`, then `+ 1 =`, then `1/x`, then `- 1 =`, then `× 100 =` to get the percentage for `I/Y`.
