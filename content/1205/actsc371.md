---
title: "ACTSC 371: Introduction to Investments"
prof: "Surya Banerjee"
---

These notes cover the full content of ACTSC 371 as taught at the University of Waterloo, following the syllabus based on *Investments* by Bodie, Kane, and Marcus (9th Canadian Edition). The course covers three major arcs: the theory of capital markets and portfolio selection, fixed income securities and term structure, and derivative securities including options, futures, and swaps.

# Part I: Capital Markets and Financial Instruments

## Chapter 1: The Investment Environment

Every course in investments must begin by answering a fundamental question: what is an investment, and why do organized markets for investments exist? The answer leads quickly to the two-sided nature of capital markets — they are simultaneously a mechanism for transferring resources across time and a mechanism for transferring risk across agents. Before developing the quantitative machinery of portfolio theory, it is essential to understand the institutional landscape in which investment takes place.

### Real Assets and Financial Assets

<div class="definition"><strong>Definition 1.1 (Real Assets and Financial Assets).</strong> <strong>Real assets</strong> are the productive capacity of an economy: land, buildings, machines, human capital, knowledge, and organizational capital. They generate the goods and services that constitute real economic output. <strong>Financial assets</strong> are claims on real assets or obligations of other parties — stocks, bonds, derivatives, and bank deposits. They do not themselves produce output, but determine how the income flowing from real assets is distributed among investors.</div>

The distinction matters for welfare accounting. When a share of Royal Bank changes hands at a higher price, no new productive capacity has been created; the gain to the buyer is the mirror image of an implicit loss to the seller. Society's real wealth is determined by its stock of real assets and the productivity with which they are employed. Financial assets matter because they influence how efficiently real assets are allocated to their highest-valued uses, and who bears the risks inherent in production.

<div class="remark"><strong>Remark.</strong> A common confusion is to treat financial wealth and real wealth as the same thing. In aggregate, they are not. If every household's stock portfolio doubles overnight, aggregate real output does not change. Financial claims are zero-sum in aggregate (every asset is someone's liability, or a claim on something real), while real assets are not. The financial crisis of 2008 illustrated the distinction sharply: financial asset prices collapsed, which in turn disrupted real investment, credit allocation, and output — the channel from financial disruption to real disruption is through the allocation and intermediation functions, not because financial assets are themselves productive.</div>

Financial assets serve two essential economic functions. First, they allow **consumption timing**: a household that earns income in working years but wishes to consume in retirement holds financial claims that transfer purchasing power forward in time; a corporation that invests now to generate future cash flows issues securities that transfer the funding backward. Second, they allow **risk allocation**: financial contracts allow parties with comparative advantages in bearing different risks to specialize accordingly — an insurance company can bear longevity risk that individuals cannot efficiently self-insure.

### A History of Investment Markets

The history of organized capital markets spans more than four millennia, but the essential architecture of modern markets emerged in the seventeenth century.

The **Code of Hammurabi** (c. 1754 BC) codified interest on loans of grain and silver with specified collateral terms and dispute resolution procedures — the earliest written legal framework for financial contracts. Medieval Italian merchant bankers in Venice and Genoa developed the **bill of exchange** (an instrument combining the functions of a loan, a currency exchange, and a payment order) and **marine insurance** to allow long-distance trade to scale beyond individual merchant capacity.

The **Dutch East India Company (VOC)** issued the world's first publicly traded shares on the Amsterdam Stock Exchange in **1602**. The immediate consequence was speculative excess: the tulip mania of **1637** — in which forward contracts on a single tulip bulb sold for prices exceeding a skilled craftsman's annual wage before collapsing to near zero — established a recurring template. Financial innovation enables genuine economic activity; speculative excess follows; the bubble collapses; regulation and institutional reform ensue.

The **New York Stock Exchange** was founded in **1792** under the Buttonwood Agreement among 24 brokers. The **Toronto Stock Exchange** began operations in **1861** with 18 listed companies. The modern U.S. securities regulatory framework was built almost entirely in response to the **Crash of 1929** and ensuing Great Depression: the Securities Act of 1933 introduced mandatory disclosure for new securities issues, and the Securities Exchange Act of 1934 established the Securities and Exchange Commission and regulated secondary market trading. **Black Monday** (October 19, 1987) saw the Dow Jones Industrial Average fall 22.6% in a single session, without obvious economic cause, forcing a rethink of market microstructure and circuit breakers. The **dot-com bubble and crash** (1995–2002) and the **global financial crisis** (2008–2009) each added further layers to the regulatory framework and to investors' understanding of systemic risk.

### The Structure of the Investment Industry

The investment process involves two separable decisions, and understanding their relative importance is prerequisite to organizing any study of investments.

<div class="definition"><strong>Definition 1.2 (Asset Allocation and Security Selection).</strong> The <strong>asset allocation</strong> decision is the division of an investor's wealth among broad asset classes: equities, fixed income, real estate, commodities, and cash equivalents. The <strong>security selection</strong> decision is the choice of specific securities within each class.</div>

Empirical research by Brinson, Hood, and Beebower (1986) found that asset allocation explains approximately 90% of the variation in long-run portfolio returns across institutional investors. Security selection, despite commanding the majority of active management fees, accounts for a relatively modest fraction of total return variation. This finding motivates the emphasis in portfolio theory on the asset class level before the individual security level.

**Financial intermediaries** — commercial banks, investment banks, mutual funds, pension funds, insurance companies, hedge funds — exist to solve information and scale problems that individual investors cannot solve efficiently. A retail investor cannot profitably assess the creditworthiness of thousands of corporate and government borrowers; a bank can, and pays for this expertise with the spread between lending and deposit rates. A small investor cannot achieve meaningful diversification with high transaction costs; a mutual fund can pool assets to reduce average transaction costs and achieve diversification.

---

## Chapter 2: Financial Markets and Instruments

Financial instruments can be broadly classified by maturity (short vs. long term), by the nature of the claim (debt vs. equity vs. derivative), and by the creditworthiness of the issuer (government vs. corporate). This chapter surveys the major instruments that appear throughout the course.

### The Money Market

The **money market** encompasses short-term debt instruments with maturities of one year or less. The combination of short maturities, high credit quality, and liquid secondary markets makes these instruments close substitutes for cash.

<div class="definition"><strong>Definition 2.1 (Treasury Bill).</strong> A <strong>Treasury bill (T-bill)</strong> is a short-term government debt obligation issued at a discount to face value. The Government of Canada sells T-bills with maturities of 91, 182, and 364 days. The investor's return is the difference between the purchase price and face value received at maturity. T-bills are considered the closest available approximation to a <strong>risk-free asset</strong>: default risk is negligible, and short maturity minimizes interest rate risk.</div>

The yield on a T-bill is most naturally expressed as a **bond equivalent yield** to facilitate comparison with other instruments:

\[ y_{BEY} = \frac{F - P}{P} \times \frac{365}{T} \]

where \(F\) is face value, \(P\) is purchase price, and \(T\) is days to maturity. Alternatively, the **bank discount yield** convention divides by face value rather than price:

\[ y_{BD} = \frac{F - P}{F} \times \frac{360}{T} \]

The bank discount yield understates the true return (it divides by face value, which exceeds price) and uses a 360-day year; it should not be compared directly to yields on other instruments quoted on a 365-day, price-divided basis.

<div class="example"><strong>Example 2.1.</strong> A 91-day Government of Canada T-bill with face value \$10,000 is purchased for \$9,910. The bank discount yield is:
\[ y_{BD} = \frac{10000 - 9910}{10000} \times \frac{360}{91} = \frac{90}{10000} \times 3.956 = 0.0356 = 3.56\% \]
The bond equivalent yield is:
\[ y_{BEY} = \frac{90}{9910} \times \frac{365}{91} = 0.009082 \times 4.011 = 0.03643 = 3.64\% \]
The BEY exceeds the BD yield because it divides by the actual price paid and uses a 365-day year.</div>

<div class="definition"><strong>Definition 2.2 (Certificate of Deposit).</strong> A <strong>certificate of deposit (CD)</strong> is a time deposit offered by a commercial bank specifying a fixed interest rate for a fixed term. <strong>Negotiable CDs</strong> (typically \$100,000 or more) can be sold in the secondary market before maturity, converting them from illiquid time deposits to liquid money market instruments.</div>

<div class="definition"><strong>Definition 2.3 (Commercial Paper).</strong> <strong>Commercial paper</strong> is a short-term unsecured promissory note issued by a corporation to fund short-term operating needs such as inventory and accounts receivable. Maturities typically range from a few days to 270 days. Only firms with strong credit ratings can access the commercial paper market; lower-rated firms must use bank credit lines or asset-backed commercial paper programs.</div>

<div class="definition"><strong>Definition 2.4 (Repurchase Agreement).</strong> A <strong>repurchase agreement (repo)</strong> is the sale of securities with a simultaneous agreement to repurchase them at a specified price and date. From the seller's perspective, it is secured short-term borrowing: the securities serve as collateral. The interest rate is the **repo rate** — the difference between the sale and repurchase prices expressed as an annualized rate. A **reverse repo** is the mirror transaction from the buyer/lender's perspective.</div>

Repos are used extensively by securities dealers for overnight financing of inventory, by banks for short-term liquidity management, and by central banks for implementing monetary policy (an open market purchase of securities is equivalent to a reverse repo from the central bank's perspective).

### The Bond Market

<div class="definition"><strong>Definition 2.5 (Bond).</strong> A <strong>bond</strong> is a debt security in which the issuer (borrower) promises to make periodic coupon payments of amount \(C\) and to repay the face value (par value) \(F\) at maturity date \(T\). The <strong>coupon rate</strong> is \(C/F\), expressed as an annual percentage of face value. In North America, coupons are conventionally paid semi-annually.</div>

**Government of Canada bonds** are the reference instruments for domestic fixed income: they carry sovereign credit (negligible default risk), trade in deep and liquid markets, and define the risk-free rate for longer maturities. **Provincial bonds** carry slightly higher yields reflecting less liquidity and in principle somewhat higher credit risk. **Corporate bonds** carry further premiums reflecting issuer-specific default risk.

<div class="definition"><strong>Definition 2.6 (Indenture and Covenants).</strong> The <strong>indenture</strong> is the legal contract governing a bond issue. It specifies coupon rate, maturity, call and put provisions, sinking fund requirements, and protective <strong>covenants</strong> — restrictions on the issuer's behaviour intended to protect bondholders. Affirmative covenants specify what the issuer must do (maintain insurance, provide audited financials); negative covenants specify what the issuer must not do (take on additional debt beyond specified limits, sell core assets without bondholder consent).</div>

<div class="definition"><strong>Definition 2.7 (Callable and Putable Bonds).</strong> A <strong>callable bond</strong> grants the issuer the right to retire the bond early at a specified <strong>call price</strong> (typically at a premium to par). This benefits the issuer — it can refinance at lower rates if rates fall — and must be compensated by a higher coupon to investors. A <strong>putable bond</strong> grants the holder the right to sell the bond back to the issuer at par before maturity, protecting against rising rates. Callable and putable bonds are said to have <strong>embedded options</strong>.</div>

**Floating-rate bonds** set coupons periodically based on a reference rate (SOFR, formerly LIBOR) plus a fixed spread. They trade near par because their coupons adjust to market rates, making them less sensitive to interest rate moves than fixed-coupon bonds.

**Mortgage-backed securities (MBS)** are bonds whose cash flows derive from a pool of mortgage loans. Securitization converts illiquid individual mortgages into tradeable claims, improving the allocation of mortgage risk. The 2008 financial crisis illustrated the hazard when the complexity of re-securitized MBS (collateralized debt obligations, or CDOs) makes the underlying risk impossible to assess accurately.

### Equity Markets

<div class="definition"><strong>Definition 2.8 (Common Share).</strong> A <strong>common share</strong> (or common stock) represents a fractional ownership claim in a corporation. Common shareholders receive dividends at the discretion of the board of directors, have voting rights on major corporate decisions, and hold a <strong>residual claim</strong> — they are entitled to what remains after all debt obligations are satisfied in liquidation. This makes common equity the most junior claim in the firm's capital structure and therefore the most risky.</div>

<div class="definition"><strong>Definition 2.9 (Preferred Share).</strong> A <strong>preferred share</strong> pays a fixed dividend before any common dividend is declared and has a prior claim in liquidation over common equity, but is junior to all debt. Preferred shares typically carry no voting rights. Dividends not paid in a given period accumulate as arrears for <strong>cumulative preferred</strong> shares. In Canada, intercorporate preferred dividends qualify for the dividend tax credit, making preferred shares particularly attractive to corporate investors in the same tax jurisdiction.</div>

<div class="definition"><strong>Definition 2.10 (American Depositary Receipt).</strong> An <strong>American Depositary Receipt (ADR)</strong> is a U.S. dollar-denominated certificate issued by a U.S. depositary bank, representing a specified number of shares in a foreign company held in custody by that bank. ADRs trade on U.S. exchanges and allow U.S. investors to access foreign equities without direct foreign settlement. The investor bears the underlying equity risk and the foreign exchange risk of the issuer's home currency versus the U.S. dollar.</div>

### Stock Market Indices

A **stock market index** is a number designed to summarize the performance of a specified set of securities. The construction methodology determines the index's economic meaning and its practical use as a benchmark.

<div class="definition"><strong>Definition 2.11 (Price-Weighted Index).</strong> A <strong>price-weighted index</strong> sums the prices of its constituent stocks and divides by a divisor adjusted for stock splits and changes in composition. Each stock's weight equals its price divided by the sum of all prices. A stock trading at \$200 has twice the weight of one trading at \$100, regardless of the firms' relative sizes. The <strong>Dow Jones Industrial Average (DJIA)</strong> and the <strong>Nikkei 225</strong> are price-weighted.</div>

<div class="example"><strong>Example 2.2.</strong> Suppose an index contains two stocks: A at \$60 and B at \$40. The index value is \(\frac{60+40}{2} = 50\). Stock A has weight \(60/100 = 60\%\) and B has weight 40%. If A undergoes a 2-for-1 split, its price falls to \$30 and B remains at \$40. To maintain continuity, the divisor is adjusted: the new index value should still be 50, so the new divisor \(d\) satisfies \(\frac{30+40}{d} = 50\), giving \(d = 1.4\). After the split, A's weight falls to \(30/70 = 42.9\%\) — the split has mechanically reduced A's index influence, even though the firm's total value (capitalization) is unchanged.</div>

<div class="definition"><strong>Definition 2.12 (Market-Capitalization Weighted Index).</strong> A <strong>market-capitalization weighted (value-weighted) index</strong> weights each stock by its total market capitalization, so that a firm worth \$500 billion has ten times the weight of a firm worth \$50 billion. The weight of firm \(i\) at time \(t\) is:
\[ w_i = \frac{P_i \times \text{shares}_i}{\sum_j P_j \times \text{shares}_j} \]
The <strong>S&P 500</strong>, the <strong>S&P/TSX Composite</strong>, and the <strong>MSCI World</strong> are cap-weighted.</div>

Cap-weighted indices have two practical advantages: they are **self-rebalancing** (as prices change, weights naturally adjust with no trading required) and they are **passively replicable** (an investor holding all constituents in proportion to their market caps holds the index, with zero turnover). The disadvantage is that overvalued stocks automatically receive higher weights.

---

## Chapter 3: Trading on Securities Markets

Understanding how securities markets operate — how prices are discovered, how orders are executed, and how investors can use leverage — is essential background for understanding both market efficiency and investment strategy.

### How Firms Issue Securities

<div class="definition"><strong>Definition 3.1 (Initial Public Offering).</strong> An <strong>initial public offering (IPO)</strong> is the first sale of a company's equity securities to the public. The issuer engages an <strong>investment bank</strong> as <strong>underwriter</strong>. In a <strong>firm commitment</strong> arrangement, the bank purchases the entire offering from the issuer at a fixed price and resells to the public at a slightly higher offering price, bearing the price risk if the offering is poorly received. In a <strong>best efforts</strong> arrangement, the bank acts only as agent, committing to best efforts at sale but not bearing unsold inventory risk.</div>

The IPO process begins with preparation of a **prospectus** — a detailed disclosure document filed with the relevant securities regulator — describing the company's business, financial statements, risk factors, and intended use of proceeds. The investment bank then conducts a **roadshow**, presenting to institutional investors and building a **book** of intended orders. The final offering price is set based on this information through a process called **book building**.

<div class="definition"><strong>Definition 3.2 (IPO Underpricing).</strong> <strong>IPO underpricing</strong> is the empirical observation that the average first-day return on IPO stocks significantly exceeds zero — the offering price is set below the first-day closing market price. In the U.S. and Canada, average first-day returns have historically been 10–20%, representing money left on the table by the issuer.</div>

Two prominent theories explain IPO underpricing. The **winner's curse** (Rock, 1986) argues that informed investors bid aggressively for attractive offerings and stay away from unattractive ones. Uninformed investors, not knowing which offerings are attractive, submit bids to all offerings and are crowded out of good ones (informed investors take the full allocation) but receive full allocations of bad ones. To attract uninformed investors, issuers must underprice enough to compensate for the adverse allocation they systematically receive. The **information revelation** theory (Benveniste and Spindt, 1989) argues that underpricing compensates institutional investors for truthfully revealing positive private information during book building.

### Market Structure

<div class="definition"><strong>Definition 3.3 (Market Types).</strong> Securities markets are organized along a spectrum:
<ul>
<li>A <strong>direct search market</strong> requires buyers and sellers to find each other independently, with high search costs and dispersed prices.</li>
<li>A <strong>brokered market</strong> relies on brokers who specialize in matching counterparties, earning commissions without holding positions. Commercial real estate and corporate bonds are brokered.</li>
<li>A <strong>dealer market</strong> has dealers who hold inventory and quote continuous bid and ask prices. Dealers earn the bid-ask spread as compensation for liquidity provision and inventory risk. The OTC bond and currency markets are dealer markets.</li>
<li>An <strong>auction market</strong> centralizes all orders in a single venue and uses competitive price discovery. The TSX and NYSE are continuous auction markets.</li>
</ul></div>

<div class="definition"><strong>Definition 3.4 (Bid-Ask Spread).</strong> In a dealer market, the <strong>bid price</strong> is the price at which the dealer will buy from the investor, and the <strong>ask (offer) price</strong> is the price at which the dealer will sell to the investor. The <strong>bid-ask spread</strong> is the difference: \(\text{spread} = P_{\text{ask}} - P_{\text{bid}}\). The spread compensates the dealer for three costs: order processing, inventory carrying costs, and adverse selection (the risk that the counterparty is better informed).</div>

### Order Types

<div class="definition"><strong>Definition 3.5 (Market and Limit Orders).</strong> A <strong>market order</strong> is an instruction to buy or sell immediately at the best available price. Execution is certain; price is not. A <strong>limit order</strong> specifies the maximum price acceptable for a buy (or minimum for a sell). The order enters the <strong>limit order book</strong> and executes only if the market price reaches the specified level. Price is certain; execution is not.</div>

<div class="definition"><strong>Definition 3.6 (Stop Order).</strong> A <strong>stop order</strong> becomes a market order once the security's price touches a specified <strong>trigger price</strong>. A stop-sell at \$45 on a position purchased at \$60 limits losses but executes at market price once \$45 is touched — in a fast-falling market, the actual execution price may be substantially below \$45. Stop orders do not guarantee a particular exit price; they guarantee execution after the trigger is touched.</div>

### Margin Trading and Short Selling

<div class="definition"><strong>Definition 3.7 (Margin Trading).</strong> <strong>Margin trading</strong> is the purchase of securities using borrowed funds from a broker. The <strong>initial margin</strong> requirement specifies the minimum fraction of the position value that must be funded by the investor's own equity. In Canada and the U.S., initial margin on equities is typically 50%. The <strong>maintenance margin</strong> is the minimum equity fraction that must be maintained subsequently; if equity falls below this level, a <strong>margin call</strong> is issued requiring additional deposits to restore the account to initial margin.</div>

<div class="proposition"><strong>Proposition 3.8 (Margin Call Trigger Price).</strong> Suppose an investor buys \(N\) shares at price \(P_0\), financing the purchase with equity \(E_0 = m P_0 N\) and a loan of \((1-m)P_0 N\), where \(m\) is the initial margin fraction. The maintenance margin level is \(\bar{m}\). A margin call is triggered when the stock price falls to:
\[ P^* = \frac{(1-m)P_0}{1 - \bar{m}} \]
At \(P^*\), the equity in the account equals \(\bar{m}\) times the position value.</div>

<div class="proof"><strong>Derivation.</strong> The loan outstanding is fixed at \(L = (1-m)P_0 N\). At stock price \(P\), the equity is \(E = PN - L = PN - (1-m)P_0 N\). The margin ratio is \(E/(PN) = 1 - (1-m)P_0/P\). Setting this equal to \(\bar{m}\):
\[ 1 - \frac{(1-m)P_0}{P^*} = \bar{m} \implies P^* = \frac{(1-m)P_0}{1 - \bar{m}} \qquad \square \]</div>

<div class="example"><strong>Example 3.1.</strong> An investor buys 100 shares of a stock at \$50 with 50% initial margin, borrowing \$2,500. The loan is fixed at \$2,500. The maintenance margin is 25%. The margin call trigger price is:
\[ P^* = \frac{(1 - 0.5) \times 50}{1 - 0.25} = \frac{25}{0.75} = \$33.33 \]
If the stock falls below \$33.33, a margin call is issued. At \$33.33, equity = \(33.33 \times 100 - 2500 = \$833\), which is \(833/3333 = 25\%\) of position value. ✓</div>

<div class="definition"><strong>Definition 3.9 (Short Sale).</strong> A <strong>short sale</strong> involves borrowing shares from a broker (who typically borrows them from another client's margin account), selling them in the open market, and later repurchasing shares in the market to return to the lender. The short seller profits if the stock price falls. The short seller must pay any dividends declared on the borrowed shares to the lender, and must maintain a margin account. The maximum gain on a short position is 100% (if the stock falls to zero); the maximum loss is theoretically unlimited (if the stock price rises without bound).</div>

---

# Part II: Portfolio Theory

## Chapter 4: Return and Risk

The quantitative analysis of investment begins with precise definitions of return and risk. The intuitive notion that higher expected reward comes at the cost of higher risk is correct, but requires mathematical precision to be operationally useful.

### Measuring Returns

<div class="definition"><strong>Definition 4.1 (Holding Period Return).</strong> The <strong>holding period return (HPR)</strong> over a single period is:
\[ r = \frac{P_1 - P_0 + D_1}{P_0} = \underbrace{\frac{P_1 - P_0}{P_0}}_{\text{capital gain yield}} + \underbrace{\frac{D_1}{P_0}}_{\text{dividend yield}} \]
where \(P_0\) and \(P_1\) are the beginning and ending prices, and \(D_1\) is any cash dividend received during the period.</div>

When returns are measured over multiple sub-periods, two summary statistics arise naturally:

<div class="definition"><strong>Definition 4.2 (Arithmetic and Geometric Mean Returns).</strong> Given returns \(r_1, r_2, \ldots, r_T\) over \(T\) equal-length sub-periods, the <strong>arithmetic mean return</strong> is:
\[ \bar{r}_A = \frac{1}{T}\sum_{t=1}^{T} r_t \]
The <strong>geometric mean return</strong> is:
\[ \bar{r}_G = \left[\prod_{t=1}^{T}(1 + r_t)\right]^{1/T} - 1 \]</div>

<div class="proposition"><strong>Proposition 4.3 (Arithmetic vs. Geometric Mean).</strong> For any sequence of non-constant returns, \(\bar{r}_A > \bar{r}_G\). The approximation:
\[ \bar{r}_A - \bar{r}_G \approx \frac{\sigma^2}{2} \]
holds, where \(\sigma^2\) is the variance of the periodic returns. The arithmetic mean is the appropriate estimate of the expected return in any single future period; the geometric mean is the realized compound growth rate over the history.</div>

<div class="example"><strong>Example 4.1.</strong> A stock returns +50% in year 1 and −33.3% in year 2.
\[ \bar{r}_A = \frac{0.50 + (-0.333)}{2} = 8.35\% \]
\[ \bar{r}_G = \sqrt{(1.50)(0.667)} - 1 = \sqrt{1.0005} - 1 \approx 0.025\% \]
The geometric mean is nearly zero because a 50% gain followed by a 33.3% loss returns to approximately the starting value: \(1.50 \times 0.667 = 1.000\). The arithmetic mean of 8.35% gives the expected return for each individual year's draw, not the compounded growth.</div>

### Expected Return and Variance

When returns are treated as random variables (the appropriate treatment in forward-looking analysis), the relevant statistics are:

<div class="definition"><strong>Definition 4.4 (Expected Return, Variance, and Standard Deviation).</strong> Let \(r\) be a random variable representing the return on an asset. If the asset has \(S\) possible states \(s = 1, \ldots, S\) occurring with probabilities \(p_s\) and delivering returns \(r_s\), then:
\[ E(r) = \sum_{s=1}^{S} p_s r_s \]
\[ \sigma^2 = \text{Var}(r) = \sum_{s=1}^{S} p_s \bigl[r_s - E(r)\bigr]^2 \]
\[ \sigma = \sqrt{\sigma^2} \]
The standard deviation \(\sigma\) is expressed in the same units as the return and serves as the primary measure of risk in mean-variance analysis.</div>

<div class="example"><strong>Example 4.2.</strong> An analyst assigns the following return scenarios to a stock:

| State | Probability | Return |
|-------|-------------|--------|
| Strong growth | 0.25 | 44% |
| Normal | 0.45 | 14% |
| Recession | 0.30 | −16% |

\[ E(r) = 0.25(0.44) + 0.45(0.14) + 0.30(-0.16) = 0.110 + 0.063 - 0.048 = 12.5\% \]
\[ \sigma^2 = 0.25(0.44 - 0.125)^2 + 0.45(0.14 - 0.125)^2 + 0.30(-0.16 - 0.125)^2 \]
\[ = 0.25(0.0992) + 0.45(0.000225) + 0.30(0.0812) = 0.02480 + 0.000101 + 0.02436 = 0.04926 \]
\[ \sigma = \sqrt{0.04926} = 22.2\% \]</div>

### Covariance, Correlation, and Portfolio Risk

The co-movement of assets determines the diversification benefit from combining them in a portfolio:

<div class="definition"><strong>Definition 4.5 (Covariance and Correlation).</strong> The <strong>covariance</strong> between the returns of assets \(i\) and \(j\) is:
\[ \sigma_{ij} = \text{Cov}(r_i, r_j) = \sum_s p_s \bigl[r_{i,s} - E(r_i)\bigr]\bigl[r_{j,s} - E(r_j)\bigr] \]
The <strong>correlation coefficient</strong> normalises the covariance to the unit interval:
\[ \rho_{ij} = \frac{\sigma_{ij}}{\sigma_i \sigma_j}, \qquad \rho_{ij} \in [-1, 1] \]
A correlation of \(+1\) indicates perfect positive co-movement; \(-1\) indicates perfect negative co-movement; \(0\) indicates no linear relationship.</div>

<div class="theorem"><strong>Theorem 4.6 (Two-Asset Portfolio Statistics).</strong> Let asset 1 have expected return \(E(r_1)\) and standard deviation \(\sigma_1\), and asset 2 have \(E(r_2)\) and \(\sigma_2\), with correlation \(\rho_{12}\). For a portfolio with weight \(w\) in asset 1 and \((1-w)\) in asset 2:
\[ E(r_p) = w E(r_1) + (1-w)E(r_2) \]
\[ \sigma_p^2 = w^2\sigma_1^2 + (1-w)^2\sigma_2^2 + 2w(1-w)\sigma_1\sigma_2\rho_{12} \]</div>

<div class="remark"><strong>Remark.</strong> The expected return formula is linear in weights — straightforward averaging. The variance formula is the key insight of modern portfolio theory. For any \(\rho_{12} < 1\), portfolio variance is strictly less than the weighted average of individual variances \(w^2\sigma_1^2 + (1-w)^2\sigma_2^2 + 2w(1-w)\sigma_1\sigma_2\). The reduction comes entirely from the cross-term involving \(\rho_{12}\). When \(\rho_{12} = -1\), there exists a weight \(w^*\) that achieves \(\sigma_p = 0\) (a perfectly hedged portfolio). This is diversification in its purest mathematical form.</div>

<div class="example"><strong>Example 4.3.</strong> Stock A: \(E(r_A) = 10\%\), \(\sigma_A = 20\%\). Stock B: \(E(r_B) = 6\%\), \(\sigma_B = 10\%\). Correlation \(\rho_{AB} = 0.1\). For a 60/40 portfolio (\(w=0.6\)):
\[ E(r_p) = 0.6(10\%) + 0.4(6\%) = 6\% + 2.4\% = 8.4\% \]
\[ \sigma_p^2 = (0.6)^2(0.04) + (0.4)^2(0.01) + 2(0.6)(0.4)(0.2)(0.1)(0.1) \]
\[ = 0.0144 + 0.0016 + 0.00096 = 0.01696 \]
\[ \sigma_p = \sqrt{0.01696} = 13.02\% \]
The weighted-average standard deviation would be \(0.6(20\%) + 0.4(10\%) = 16\%\). The portfolio standard deviation of 13.02% is substantially lower — this is the diversification benefit.</div>

### The Sharpe Ratio

The most widely used risk-adjusted performance measure is the ratio of expected excess return to standard deviation:

<div class="definition"><strong>Definition 4.7 (Sharpe Ratio).</strong> The <strong>Sharpe ratio</strong> (reward-to-variability ratio) of a portfolio \(p\) is:
\[ S_p = \frac{E(r_p) - r_f}{\sigma_p} \]
where \(r_f\) is the risk-free rate. The Sharpe ratio measures the additional expected return earned per unit of standard deviation — it is the slope of the **Capital Allocation Line** (defined in Chapter 5).</div>

The Sharpe ratio is the appropriate performance measure when the portfolio being evaluated represents the investor's entire risky portfolio — i.e., when it has no diversification relationship with other holdings. When the portfolio is a component of a larger portfolio, the appropriate measure is the information ratio or Treynor ratio (which uses beta-adjusted risk).

### Historical Evidence on Risk and Return

Decades of data from Canadian and U.S. markets establish the empirical risk-return relationship with considerable precision. Canadian equities (S&P/TSX) have historically delivered arithmetic mean annual returns of approximately 11–13%, with annual standard deviation near 18–20%. Long-term Government of Canada bonds have returned roughly 6–8% with standard deviation near 10%. 91-day T-bills have returned approximately 3–5% with near-zero variance.

<div class="definition"><strong>Definition 4.8 (Equity Risk Premium).</strong> The <strong>equity risk premium (ERP)</strong> is the expected excess return of equities over the risk-free rate:
\[ \text{ERP} = E(r_M) - r_f \]
Historically (1926–2020), the U.S. arithmetic ERP has been approximately 7–8% per year. Forward-looking estimates, based on current valuations, are typically somewhat lower. The ERP compensates equity investors for bearing systematic risk — the co-movement of equity returns with aggregate consumption and output that cannot be diversified away.</div>

---

## Chapter 5: Capital Allocation to Risky Assets

### Utility and Risk Aversion

Investors differ in their tolerance for risk. We model this formally through utility functions that trade off expected return against return variance:

<div class="definition"><strong>Definition 5.1 (Mean-Variance Utility).</strong> The <strong>mean-variance utility</strong> of an investment portfolio with expected return \(E(r)\) and variance \(\sigma^2\) is:
\[ U = E(r) - \frac{1}{2}A\sigma^2 \]
where \(A > 0\) is the investor's <strong>coefficient of risk aversion</strong>. A higher value of \(A\) means the investor penalises variance more heavily relative to expected return. Empirical estimates from market data typically place \(A\) in the range 2–4 for average investors.</div>

<div class="definition"><strong>Definition 5.2 (Certainty Equivalent Return).</strong> The <strong>certainty equivalent return (CER)</strong> is the risk-free return that the investor regards as equivalent to the risky portfolio. For mean-variance utility:
\[ \text{CER} = E(r) - \frac{1}{2}A\sigma^2 \]
An investor accepts a risky portfolio only if its CER exceeds the available risk-free rate \(r_f\).</div>

<div class="example"><strong>Example 5.1.</strong> Two portfolios are available:
<ul>
<li>Portfolio P: \(E(r_P) = 12\%\), \(\sigma_P = 20\%\)</li>
<li>Portfolio Q: \(E(r_Q) = 8\%\), \(\sigma_Q = 10\%\)</li>
</ul>
For an investor with \(A = 3\):
\[ \text{CER}_P = 12\% - \frac{1}{2}(3)(0.04) = 12\% - 6\% = 6\% \]
\[ \text{CER}_Q = 8\% - \frac{1}{2}(3)(0.01) = 8\% - 1.5\% = 6.5\% \]
This investor prefers Q despite its lower expected return, because P's higher variance more than offsets its higher expected return. For \(A = 1\):
\[ \text{CER}_P = 12\% - 2\% = 10\%, \quad \text{CER}_Q = 8\% - 0.5\% = 7.5\% \]
This investor prefers P. Risk aversion determines which portfolio is preferred.</div>

### The Capital Allocation Line

The central problem of capital allocation is: given a risk-free asset and a risky portfolio, what fraction of wealth should an investor place in each?

<div class="definition"><strong>Definition 5.3 (Capital Allocation Line).</strong> Consider a risk-free asset with return \(r_f\) and a risky portfolio \(P\) with expected return \(E(r_P)\) and standard deviation \(\sigma_P\). An investor who places fraction \(y\) in \(P\) and \((1-y)\) in the risk-free asset holds a <strong>complete portfolio</strong> \(C\) with:
\[ E(r_C) = r_f + y[E(r_P) - r_f] \]
\[ \sigma_C = y\sigma_P \]
Eliminating \(y = \sigma_C/\sigma_P\), the locus of achievable risk-return combinations is the <strong>Capital Allocation Line (CAL)</strong>:
\[ E(r_C) = r_f + \frac{E(r_P) - r_f}{\sigma_P} \cdot \sigma_C \]
The slope of the CAL is the Sharpe ratio \(S_P = [E(r_P) - r_f]/\sigma_P\).</div>

The CAL is a straight line in mean-standard deviation space, passing through the risk-free point \((0, r_f)\) and the risky portfolio point \((\sigma_P, E(r_P))\). Points along the CAL to the left of \(P\) correspond to \(y < 1\) (partial investment in \(P\) plus risk-free lending); points to the right of \(P\) correspond to \(y > 1\) (leveraged investment, i.e., borrowing at \(r_f\) to invest more than 100% in \(P\)).

<div class="theorem"><strong>Theorem 5.4 (Optimal Complete Portfolio).</strong> An investor with mean-variance utility coefficient \(A\) maximises utility by allocating fraction:
\[ y^* = \frac{E(r_P) - r_f}{A\sigma_P^2} \]
to the risky portfolio \(P\).</div>

<div class="proof"><strong>Derivation.</strong> Substituting the complete portfolio statistics into the utility function:
\[ U(y) = r_f + y[E(r_P) - r_f] - \frac{1}{2}A(y\sigma_P)^2 \]
Taking the derivative with respect to \(y\) and setting equal to zero:
\[ \frac{dU}{dy} = E(r_P) - r_f - Ay\sigma_P^2 = 0 \implies y^* = \frac{E(r_P) - r_f}{A\sigma_P^2} \qquad \square \]</div>

<div class="example"><strong>Example 5.2.</strong> Let \(r_f = 3\%\), \(E(r_P) = 12\%\), \(\sigma_P = 18\%\), and \(A = 4\).
\[ y^* = \frac{0.12 - 0.03}{4 \times (0.18)^2} = \frac{0.09}{4 \times 0.0324} = \frac{0.09}{0.1296} = 69.4\% \]
The investor places 69.4% in the risky portfolio and 30.6% in T-bills. The complete portfolio has:
\[ E(r_C) = 3\% + 0.694(12\% - 3\%) = 3\% + 6.25\% = 9.25\% \]
\[ \sigma_C = 0.694 \times 18\% = 12.49\% \]</div>

### The Efficient Frontier and the Separation Theorem

When investors can combine any number of risky assets freely, the full opportunity set of achievable risk-return combinations is bounded by a curve called the efficient frontier:

<div class="definition"><strong>Definition 5.5 (Efficient Frontier).</strong> The <strong>minimum-variance frontier</strong> is the set of portfolios with the minimum variance achievable for each level of expected return. The <strong>efficient frontier</strong> is the upper portion of the minimum-variance frontier — the set of portfolios that, for each level of variance, offer the maximum expected return. No rational, risk-averse investor would hold a portfolio strictly below the efficient frontier, as it is dominated by a frontier portfolio.</div>

The **minimum-variance portfolio (MVP)** is the leftmost point on the frontier — the portfolio with the lowest achievable variance across all risky portfolios. For two assets, the MVP weight is:

\[ w_1^{MVP} = \frac{\sigma_2^2 - \sigma_{12}}{\sigma_1^2 + \sigma_2^2 - 2\sigma_{12}} \]

<div class="theorem"><strong>Theorem 5.6 (Two-Fund Separation Theorem).</strong> When a risk-free asset is available, every mean-variance efficient investor — regardless of their risk aversion coefficient — holds the same risky portfolio: the portfolio that maximizes the Sharpe ratio (the <strong>tangency portfolio</strong>). Risk aversion determines only the split between the risk-free asset and this tangency portfolio.</div>

This is the most powerful theorem in classical portfolio theory. It implies that the optimal risky portfolio is the same for all investors regardless of preferences — preferences only determine how much of the risky portfolio to hold. In equilibrium, if all investors hold the same risky portfolio, that portfolio must be the market portfolio (since all assets must be held in aggregate), which is the derivation that leads to the CAPM.

---

## Chapter 7 (§7.1): The Capital Asset Pricing Model

### Assumptions and the Market Portfolio

The **Capital Asset Pricing Model (CAPM)**, developed by Sharpe (1964), Lintner (1965), and Mossin (1966), uses the two-fund separation theorem to derive equilibrium expected returns for all risky assets.

<div class="definition"><strong>Definition 7.1 (CAPM Assumptions).</strong> The CAPM rests on the following idealized conditions:
<ol>
<li>All investors are mean-variance optimizers with identical single-period horizons.</li>
<li>All investors have <strong>homogeneous expectations</strong>: identical beliefs about expected returns, variances, and covariances of all assets.</li>
<li>All risky assets are publicly traded and perfectly divisible; no taxes or transaction costs.</li>
<li>Investors can borrow and lend unlimited amounts at the common risk-free rate \(r_f\).</li>
</ol></div>

Under these assumptions, the two-fund separation theorem implies every investor holds the same risky portfolio. Since investors collectively own the economy's entire stock of risky assets, the common risky portfolio must be the **market portfolio**:

<div class="definition"><strong>Definition 7.2 (Market Portfolio).</strong> The <strong>market portfolio</strong> \(M\) contains every risky asset in the economy, weighted by its market capitalization:
\[ w_i^M = \frac{P_i \times \text{shares}_i}{\sum_j P_j \times \text{shares}_j} \]
In practice, broad market indices (S&P/TSX Composite, S&P 500, MSCI World) serve as proxies for the market portfolio.</div>

<div class="definition"><strong>Definition 7.3 (Capital Market Line).</strong> The CAL corresponding to the market portfolio is the <strong>Capital Market Line (CML)</strong>:
\[ E(r_C) = r_f + \frac{E(r_M) - r_f}{\sigma_M} \cdot \sigma_C \]
The CML represents the highest achievable Sharpe ratio; no portfolio outside the CML exists in equilibrium. The slope \([E(r_M) - r_f]/\sigma_M\) is the market price of risk per unit of total standard deviation. The CML describes only efficient portfolios — it does not apply to individual assets.</div>

### Beta and the Security Market Line

For individual securities, the relevant risk measure is not total standard deviation (much of which can be diversified away) but systematic risk:

<div class="definition"><strong>Definition 7.4 (Beta).</strong> The <strong>beta</strong> of asset \(i\) measures its sensitivity to the market portfolio's returns:
\[ \beta_i = \frac{\text{Cov}(r_i, r_M)}{\text{Var}(r_M)} = \frac{\sigma_{iM}}{\sigma_M^2} \]
Beta is the slope coefficient in the regression \(r_i = \alpha_i + \beta_i r_M + \varepsilon_i\). The market portfolio has \(\beta_M = 1\) by construction. A risk-free asset has \(\beta = 0\).</div>

<div class="theorem"><strong>Theorem 7.5 (Security Market Line / CAPM).</strong> In equilibrium, the expected return of every asset satisfies:
\[ \boxed{E(r_i) = r_f + \beta_i[E(r_M) - r_f]} \]
This relationship defines the <strong>Security Market Line (SML)</strong>. The quantity \(E(r_M) - r_f\) is the <strong>market risk premium</strong>.</div>

<div class="proof"><strong>Derivation (sketch).</strong> Consider adding a small amount \(\varepsilon\) of asset \(i\) to the market portfolio (reducing other holdings proportionally). The change in expected portfolio return is:
\[ \Delta E(r) = \varepsilon [E(r_i) - E(r_M)] \]
The change in portfolio variance is (to first order):
\[ \Delta\sigma^2 = 2\varepsilon[\text{Cov}(r_i, r_M) - \sigma_M^2] = 2\varepsilon\sigma_M^2[\beta_i - 1] \]
For the market portfolio to be optimal, the marginal reward-to-risk trade-off must be the same for every asset as for the market itself. This requirement yields the SML. \(\square\)</div>

<div class="definition"><strong>Definition 7.6 (Alpha).</strong> The <strong>Jensen's alpha</strong> of asset \(i\) is the deviation of its expected return from the SML:
\[ \alpha_i = E(r_i) - \bigl[r_f + \beta_i(E(r_M) - r_f)\bigr] \]
In CAPM equilibrium, \(\alpha_i = 0\) for every asset. In empirical tests of the CAPM (using realized returns), a positive alpha indicates outperformance relative to systematic risk; a negative alpha indicates underperformance.</div>

<div class="example"><strong>Example 7.1.</strong> The risk-free rate is 3%, the market risk premium is 7%, and stock XYZ has \(\beta = 1.3\). The CAPM required return is:
\[ E(r_{XYZ}) = 3\% + 1.3 \times 7\% = 3\% + 9.1\% = 12.1\% \]
If the analyst estimates the stock's true expected return at 14%, the stock has an alpha of \(14\% - 12.1\% = 1.9\%\), suggesting it is underpriced relative to its systematic risk.</div>

### Risk Decomposition

<div class="theorem"><strong>Theorem 7.7 (Decomposition of Total Risk).</strong> For any asset \(i\) with return \(r_i = \alpha_i + \beta_i r_M + \varepsilon_i\) (where \(\text{Cov}(r_M, \varepsilon_i) = 0\)):
\[ \sigma_i^2 = \underbrace{\beta_i^2 \sigma_M^2}_{\text{systematic risk}} + \underbrace{\sigma^2(\varepsilon_i)}_{\text{idiosyncratic risk}} \]
Only systematic risk (the first component) commands a risk premium. Idiosyncratic risk averages to zero in a diversified portfolio and earns no expected return compensation.</div>

The **coefficient of determination** \(R^2 = \beta_i^2\sigma_M^2/\sigma_i^2\) measures what fraction of the asset's variance is systematic. A well-diversified portfolio has \(R^2\) near 1; an individual stock might have \(R^2\) of 20–50%.

---

# Part III: Fixed Income Securities

## Chapter 12: Bond Prices and Yields

Fixed income securities are the largest component of global capital markets by total value outstanding. Governments and corporations issue bonds to fund expenditures; pension funds, insurance companies, and individual investors hold them for their income stream and to manage risk. Understanding how bonds are priced and how their yields relate to returns is the foundation of fixed income analysis.

### Bond Characteristics

<div class="definition"><strong>Definition 12.1 (Coupon Bond).</strong> A <strong>coupon bond</strong> issued at face value \(F\) with coupon rate \(c\) and maturity of \(T\) semi-annual periods makes coupon payments of \(C = cF/2\) every six months and repays \(F\) at maturity. The <strong>indenture</strong> specifies all terms of the obligation, including covenants protecting the bondholder's position.</div>

<div class="definition"><strong>Definition 12.2 (Zero-Coupon Bond).</strong> A <strong>zero-coupon bond</strong> (or pure discount bond) makes no periodic payments; the investor buys the bond at a price below face value and receives face value at maturity. The return arises entirely from price appreciation. Zero-coupon bonds are important both as practical instruments (e.g., stripped government bonds) and as theoretical building blocks: any coupon bond can be understood as a portfolio of zeros, one for each cash flow date.</div>

<div class="definition"><strong>Definition 12.3 (Callable and Putable Bonds).</strong> A <strong>callable bond</strong> includes a call provision allowing the issuer to retire the bond early at the call price, typically at a premium to par. The call option has positive value to the issuer (and is therefore a cost to the investor, who must be compensated with a higher coupon). A <strong>putable bond</strong> grants the holder the right to sell back to the issuer at par before maturity, protecting against rising rates. A convertible bond grants the holder the right to exchange the bond for equity shares at a specified conversion ratio.</div>

### Bond Pricing

<div class="theorem"><strong>Theorem 12.4 (Bond Pricing Formula).</strong> The price of a coupon bond with \(T\) remaining semi-annual periods, semi-annual coupon \(C\), face value \(F\), and semi-annual yield \(y\) is:
\[ P = \sum_{t=1}^{T} \frac{C}{(1+y)^t} + \frac{F}{(1+y)^T} = C \cdot \frac{1 - (1+y)^{-T}}{y} + F(1+y)^{-T} \]
</div>

<div class="proof"><strong>Derivation.</strong> The bond delivers a certain sequence of cash flows. By the principle of no-arbitrage (the absence of riskless profit opportunities), the bond's price must equal the present value of all future cash flows discounted at the market yield \(y\). The sum \(\sum_{t=1}^T C/(1+y)^t\) is a geometric series summing to the annuity formula \(C[1-(1+y)^{-T}]/y\). Adding the present value of face value gives the result. \(\square\)</div>

<div class="example"><strong>Example 12.1.</strong> A Government of Canada bond has 6% annual coupon (paid semi-annually, so \$30 per period), face value \$1,000, 5 years to maturity (\(T = 10\) semi-annual periods), and trades at a yield to maturity of 5% annually (2.5% semi-annual).
\[ P = 30 \cdot \frac{1 - (1.025)^{-10}}{0.025} + 1000 \cdot (1.025)^{-10} \]
\[ = 30 \times 8.7521 + 1000 \times 0.7812 \]
\[ = 262.56 + 781.20 = \$1043.76 \]
The bond prices above par because its coupon rate (6%) exceeds the market yield (5%).</div>

<div class="proposition"><strong>Proposition 12.5 (Par, Premium, and Discount Bonds).</strong> For a fixed-coupon bond:
<ol>
<li>If the coupon rate equals the yield to maturity: \(P = F\) (par bond).</li>
<li>If the coupon rate exceeds the yield to maturity: \(P > F\) (premium bond).</li>
<li>If the coupon rate is less than the yield to maturity: \(P < F\) (discount bond).</li>
</ol>
Furthermore, as maturity approaches, the price of any coupon bond converges to face value regardless of its coupon rate (the <strong>pull to par</strong>).</div>

### Yield Measures

<div class="definition"><strong>Definition 12.6 (Yield to Maturity).</strong> The <strong>yield to maturity (YTM)</strong> of a bond is the discount rate \(y\) that equates the present value of all future cash flows to the current market price:
\[ P = \sum_{t=1}^{T} \frac{CF_t}{(1+y)^t} \]
The YTM is the bond's internal rate of return, assuming coupons are reinvested at the YTM rate. Since no closed-form solution exists for \(y\), it is found numerically (Newton's method or a financial calculator).</div>

<div class="definition"><strong>Definition 12.7 (Current Yield).</strong> The <strong>current yield</strong> is annual coupon divided by price:
\[ y_{\text{current}} = \frac{2C}{P} \]
(for semi-annual bonds, \(2C\) is the annual coupon). The current yield ignores both the time value of money and the capital gain or loss from holding a bond to maturity. It overstates the return on premium bonds (which are bought above par and return face value, incurring a capital loss) and understates the return on discount bonds.</div>

<div class="definition"><strong>Definition 12.8 (Yield to Call).</strong> For a callable bond, the <strong>yield to call (YTC)</strong> is computed as YTM but using the call date as the maturity date and the call price as the terminal cash flow. The <strong>yield to worst</strong> is the minimum of the YTM and all YTCs across possible call dates — it gives the worst-case yield the investor will earn if the issuer calls at the most advantageous time.</div>

<div class="example"><strong>Example 12.2.</strong> A bond has 8% semi-annual coupon, face value \$1,000, 10 years to maturity, and currently trades at \$950. The current yield is:
\[ y_{\text{current}} = \frac{80}{950} = 8.42\% \]
The YTM is found by solving:
\[ 950 = \sum_{t=1}^{20} \frac{40}{(1+y)^t} + \frac{1000}{(1+y)^{20}} \]
Using a financial calculator: N=20, PV=−950, PMT=40, FV=1000 → solve for I/Y: \(y = 4.32\%\) semi-annual, or 8.64% annual YTM. The YTM exceeds the current yield because the bond is priced below par and will generate a capital gain of \$50 at maturity.</div>

### The Price-Yield Relationship

The relationship between bond price and yield is among the most important in fixed income:

<div class="theorem"><strong>Theorem 12.9 (Properties of the Price-Yield Curve).</strong>
<ol>
<li><strong>Inverse relationship:</strong> Bond price is a decreasing function of yield.</li>
<li><strong>Convexity:</strong> The price-yield curve is convex — price increases faster as yield falls than it decreases as yield rises by the same amount.</li>
<li><strong>Maturity effect:</strong> For equal-coupon bonds, longer maturity bonds have greater price sensitivity to yield changes.</li>
<li><strong>Coupon effect:</strong> For equal-maturity bonds, lower coupon bonds have greater price sensitivity to yield changes.</li>
</ol></div>

---

## Chapter 13: The Term Structure of Interest Rates

The term structure describes how yields vary across maturities. Understanding this relationship is prerequisite to both bond portfolio management and derivative pricing.

### Spot Rates and the Yield Curve

<div class="definition"><strong>Definition 13.1 (Spot Rate).</strong> The <strong>spot rate</strong> \(y_t\) is the yield on a zero-coupon (pure discount) bond maturing at time \(t\). Equivalently, it is the rate of return guaranteed on a riskless investment from today until time \(t\). The collection of spot rates across maturities constitutes the <strong>zero-coupon yield curve</strong> (or spot curve).</div>

<div class="definition"><strong>Definition 13.2 (Yield Curve).</strong> The <strong>yield curve</strong> plots the YTM of coupon-bearing government bonds against their maturities. Common shapes:
<ul>
<li><strong>Normal (upward sloping):</strong> long rates exceed short rates — the most common shape historically.</li>
<li><strong>Inverted (downward sloping):</strong> short rates exceed long rates — has reliably preceded U.S. recessions.</li>
<li><strong>Flat:</strong> yields approximately equal across maturities.</li>
<li><strong>Humped:</strong> intermediate maturities carry higher yields than both short and long maturities.</li>
</ul></div>

### Forward Rates

<div class="definition"><strong>Definition 13.3 (Forward Rate).</strong> The <strong>forward rate</strong> \(f_{t,t+1}\) is the interest rate that can be locked in today for a one-period investment beginning at time \(t\). From no-arbitrage:
\[ (1+y_{t+1})^{t+1} = (1+y_t)^t(1 + f_{t,t+1}) \]
Solving:
\[ f_{t,t+1} = \frac{(1+y_{t+1})^{t+1}}{(1+y_t)^t} - 1 \]</div>

<div class="proof"><strong>Derivation.</strong> Two strategies that invest \$1 for \(t+1\) periods must yield the same return (no-arbitrage). Strategy 1: invest in a \((t+1)\)-period zero, earning \((1+y_{t+1})^{t+1}\). Strategy 2: invest in a \(t\)-period zero, then rollover at the forward rate locked in today, earning \((1+y_t)^t(1+f_{t,t+1})\). Setting these equal and solving for \(f_{t,t+1}\) gives the stated result. The forward rate can be locked in by simultaneously buying a long zero and selling short a short zero in appropriate proportions. \(\square\)</div>

<div class="example"><strong>Example 13.1.</strong> Given spot rates: \(y_1 = 3.0\%\) and \(y_2 = 3.5\%\). The one-year forward rate one year from now:
\[ f_{1,2} = \frac{(1.035)^2}{(1.030)^1} - 1 = \frac{1.07122}{1.030} - 1 = 1.03993 - 1 = 4.00\% \]
The forward rate (4.00%) exceeds the current 1-year spot (3.00%) and 2-year spot (3.50%), consistent with the upward-sloping yield curve implying rising expected short rates.</div>

### Bootstrapping the Spot Curve

In practice, the zero-coupon spot curve must be extracted from coupon bond prices through a procedure called **bootstrapping**:

<div class="definition"><strong>Definition 13.4 (Bootstrapping).</strong> <strong>Bootstrapping</strong> is the iterative extraction of spot rates from a sequence of coupon bond prices. Starting with the shortest maturity bond (a single cash flow), solve for \(y_1\). For the next bond, discount the near-term coupons using already-extracted spot rates, and solve for the next spot rate. Continue iteratively to build out the full spot curve.</div>

<div class="example"><strong>Example 13.2.</strong> Suppose we observe (annual coupon, annual compounding):
<ul>
<li>1-year bond: 4% coupon, price \$100.00. Then \(100 = 104/(1+y_1)\), so \(y_1 = 4.00\%\).</li>
<li>2-year bond: 5% coupon, price \$101.50. Then \(101.50 = 5/1.04 + 105/(1+y_2)^2\), so \((1+y_2)^2 = 105/(101.50 - 5/1.04) = 105/96.69 = 1.0860\), giving \(y_2 = 4.22\%\).</li>
</ul></div>

### Theories of the Term Structure

<div class="definition"><strong>Definition 13.5 (Pure Expectations Hypothesis).</strong> The <strong>pure expectations hypothesis (PEH)</strong> holds that long-term yields are geometric averages of expected future short rates:
\[ (1+y_T)^T = \prod_{t=0}^{T-1}(1 + E[r_{t,t+1}]) \]
Under the PEH, forward rates are unbiased forecasts of future spot rates, and all bonds of any maturity offer the same expected return over any holding period. The yield curve slopes upward if and only if the market expects short rates to rise.</div>

<div class="definition"><strong>Definition 13.6 (Liquidity Preference Theory).</strong> The <strong>liquidity preference theory</strong> (Keynes, Hicks) holds that long-term bonds expose investors to greater price risk and therefore require a <strong>liquidity premium</strong> (or term premium) \(\ell_t > 0\):
\[ f_{t-1,t} = E[r_{t-1,t}] + \ell_t \]
The forward rate embeds both the expected future short rate and a risk premium that increases with maturity. This explains why the yield curve typically slopes upward even in periods when short rates are not expected to rise: the term premium creates a persistent upward slope.</div>

<div class="remark"><strong>Remark.</strong> The empirical evidence strongly favors the liquidity preference theory over the pure expectations hypothesis. If the PEH held, the yield curve would predict future interest rates with some accuracy; in practice, yield curve slopes have weak predictive power for future rate changes, suggesting the slope primarily reflects term premia rather than expectations. The inverted yield curve's ability to predict recessions is consistent with either hypothesis — it may reflect expectations of falling rates (expected recession causing central bank cuts) or elevated short-term risk premia relative to long-term premia.</div>

---

## Chapter 14: Managing Bond Portfolios

### Duration

The central risk of bond investing is **interest rate risk** — the inverse relationship between bond prices and yields means that rising rates cause portfolio losses. Duration is the tool for measuring and managing this risk:

<div class="definition"><strong>Definition 14.1 (Macaulay Duration).</strong> The <strong>Macaulay duration</strong> of a bond is the weighted average time to receipt of all cash flows, where weights are the present values of cash flows as fractions of total price:
\[ D = \sum_{t=1}^{T} t \cdot \frac{CF_t/(1+y)^t}{P} = \sum_{t=1}^{T} t \cdot w_t \]
where \(w_t = CF_t/(1+y)^t / P\) and \(\sum_t w_t = 1\). Duration is measured in periods (or years for annual compounding).</div>

<div class="example"><strong>Example 14.1.</strong> A 2-year bond with annual 8% coupon, face \$1,000, YTM = 10%.
\[ P = \frac{80}{1.10} + \frac{1080}{(1.10)^2} = 72.73 + 892.56 = \$965.29 \]
\[ w_1 = 72.73/965.29 = 0.0754, \quad w_2 = 892.56/965.29 = 0.9246 \]
\[ D = 1 \times 0.0754 + 2 \times 0.9246 = 0.0754 + 1.8492 = 1.924 \text{ years} \]
For a zero-coupon bond, \(D = T\) always (all weight on the single terminal cash flow).</div>

<div class="proposition"><strong>Proposition 14.2 (Duration Properties).</strong>
<ol>
<li>The duration of a zero-coupon bond equals its maturity.</li>
<li>Duration increases with maturity (holding coupon rate and yield constant).</li>
<li>Duration decreases as the coupon rate increases (higher coupons weight earlier cash flows more).</li>
<li>Duration decreases as the yield increases (higher yields reduce the relative present value weight of distant cash flows).</li>
<li>The duration of a portfolio equals the value-weighted average of the durations of its component bonds.</li>
</ol></div>

### Modified Duration and Price Sensitivity

Macaulay duration is related to price sensitivity through a simple adjustment:

<div class="theorem"><strong>Theorem 14.3 (Price Sensitivity via Modified Duration).</strong> Let \(D^* = D/(1+y)\) denote the <strong>modified duration</strong>. For a small change \(\Delta y\) in yield:
\[ \frac{\Delta P}{P} \approx -D^* \cdot \Delta y \]
or equivalently:
\[ \Delta P \approx -D^* \cdot P \cdot \Delta y \]
</div>

<div class="proof"><strong>Derivation.</strong> Differentiate the bond price formula with respect to yield:
\[ \frac{dP}{dy} = -\sum_{t=1}^{T} \frac{t \cdot CF_t}{(1+y)^{t+1}} = -\frac{1}{1+y}\sum_{t=1}^{T} \frac{t \cdot CF_t}{(1+y)^t} = -\frac{P \cdot D}{1+y} = -P \cdot D^* \]
Therefore \(dP/P = -D^* \cdot dy\). For discrete changes, this is a linear approximation valid for small \(\Delta y\). \(\square\)</div>

<div class="example"><strong>Example 14.2.</strong> A bond has modified duration \(D^* = 7.2\) years and trades at \$980. If yields rise by 50 basis points (0.50%):
\[ \Delta P \approx -7.2 \times 980 \times 0.005 = -\$35.28 \]
The new approximate price is \$944.72. The dollar duration (\(D^* \times P = 7,056\)) gives the dollar price change per 100 basis point move.</div>

### Convexity

The modified duration approximation is linear in yield changes. The actual price-yield curve is convex — for equal yield changes up and down, the price rises more than it falls. This second-order correction is captured by convexity:

<div class="definition"><strong>Definition 14.4 (Convexity).</strong> The <strong>convexity</strong> of a bond is:
\[ \text{CX} = \frac{1}{P(1+y)^2}\sum_{t=1}^{T}\frac{t(t+1)\cdot CF_t}{(1+y)^t} \]
The improved price approximation including convexity is:
\[ \frac{\Delta P}{P} \approx -D^*\Delta y + \frac{1}{2}\text{CX}\cdot(\Delta y)^2 \]
</div>

<div class="remark"><strong>Remark.</strong> The convexity correction \(\frac{1}{2}\text{CX}\cdot(\Delta y)^2\) is always non-negative for option-free bonds (convexity is always positive). This means bondholders always benefit from convexity: price rises more for yield declines than it falls for equal yield increases. For bonds with embedded calls (callable bonds), convexity can become negative at low yields — when rates are low, the call option is more likely to be exercised, and the bond behaves more like a short-maturity bond, reducing its price appreciation.</div>

### Immunization

<div class="definition"><strong>Definition 14.5 (Immunization).</strong> A bond portfolio is <strong>immunized</strong> against interest rate changes over a target horizon \(H\) if the portfolio's Macaulay duration equals \(H\). An interest rate change creates two offsetting effects: a <strong>price effect</strong> (rising rates lower the portfolio's current value) and a <strong>reinvestment effect</strong> (rising rates allow coupon reinvestment at higher rates). When \(D = H\), these effects exactly offset for small rate changes, leaving the portfolio value at the horizon date unchanged.</div>

<div class="example"><strong>Example 14.3.</strong> An insurance company must pay \$1 million in exactly 5 years. Current yield is 8%. Present value of liability: \$1,000,000/\((1.08)^5 = \$680,583\). The company immunizes by constructing a bond portfolio with initial value \$680,583 and Macaulay duration equal to 5 years. If rates immediately shift from 8% to 9%:
<ul>
<li>Price effect: portfolio value falls (present value of future coupons is lower).</li>
<li>Reinvestment effect: coupon income reinvested at 9% instead of 8% — higher reinvestment earnings.</li>
</ul>
These effects exactly offset, and the accumulated portfolio value at year 5 remains close to \$1 million. Immunization must be rebalanced periodically because duration changes at a different rate than calendar time.</div>

---

# Part IV: Equity Valuation

## Chapter 16: Equity Valuation Models

Equity valuation is both more intellectually demanding and more practically influential than fixed income valuation. Unlike bonds, whose cash flows are contractual, equity cash flows depend on managerial decisions, competitive dynamics, and macroeconomic conditions that must be forecast. The valuation models in this chapter provide disciplined frameworks for translating these forecasts into an estimate of intrinsic value.

### Intrinsic Value and Mispricing

<div class="definition"><strong>Definition 16.1 (Intrinsic Value).</strong> The <strong>intrinsic value</strong> \(V_0\) of a share is the present value of all future cash flows that the share will generate for its owner, discounted at the appropriate risk-adjusted required rate of return \(k\). The <strong>required rate of return</strong> is estimated using the CAPM:
\[ k = r_f + \beta[E(r_M) - r_f] \]
If \(V_0 > P_0\) (current market price), the stock is undervalued; if \(V_0 < P_0\), it is overvalued.</div>

### The Dividend Discount Model

<div class="theorem"><strong>Theorem 16.2 (General Dividend Discount Model).</strong> The intrinsic value of a share is the present value of all future dividends:
\[ V_0 = \sum_{t=1}^{\infty}\frac{D_t}{(1+k)^t} \]
where \(D_t\) is the expected dividend in period \(t\) and \(k\) is the required rate of return.</div>

<div class="proof"><strong>Derivation.</strong> A share held for one period delivers dividend \(D_1\) and a selling price \(P_1\). By no-arbitrage:
\[ V_0 = \frac{D_1 + P_1}{1+k} \]
But \(P_1\) itself equals the present value of subsequent dividends discounted one period later. Iterating indefinitely (and assuming the terminal price term vanishes as the horizon grows), the result follows. \(\square\)</div>

### The Gordon Growth Model

The most widely used simplification of the DDM is the constant-growth model:

<div class="theorem"><strong>Theorem 16.3 (Gordon Growth Model).</strong> If dividends grow at a constant rate \(g\) forever (\(D_t = D_0(1+g)^t\)), and if \(k > g\), then:
\[ V_0 = \frac{D_1}{k - g} = \frac{D_0(1+g)}{k - g} \]
</div>

<div class="proof"><strong>Derivation.</strong> Substituting the constant growth assumption into the general DDM:
\[ V_0 = \sum_{t=1}^{\infty}\frac{D_0(1+g)^t}{(1+k)^t} = D_0(1+g)\sum_{t=1}^{\infty}\left(\frac{1+g}{1+k}\right)^{t-1}\cdot\frac{1}{1+k} = \frac{D_0(1+g)}{k-g} \]
using the geometric series formula \(\sum_{t=0}^{\infty} x^t = 1/(1-x)\) for \(|x| < 1\) (which requires \(g < k\)). \(\square\)</div>

<div class="example"><strong>Example 16.1.</strong> A firm just paid a dividend \(D_0 = \$2.50\). Dividends are expected to grow at \(g = 5\%\) indefinitely. The required return is \(k = 10\%\).
\[ V_0 = \frac{2.50 \times 1.05}{0.10 - 0.05} = \frac{2.625}{0.05} = \$52.50 \]
If the stock currently trades at \$48, it appears undervalued by \$4.50.

Rearranging the Gordon model provides a useful alternative perspective:
\[ k = \frac{D_1}{V_0} + g \]
The required return equals the dividend yield plus the (constant) capital gain rate. This decomposition holds at every point in time in the constant-growth model.</div>

### The Plowback Model of Growth

The constant growth rate \(g\) is not arbitrary — it is determined by the firm's reinvestment policy:

<div class="definition"><strong>Definition 16.4 (Plowback Ratio and Sustainable Growth).</strong> The <strong>plowback ratio</strong> (or retention ratio) \(b = 1 - d\) is the fraction of earnings retained for reinvestment, where \(d\) is the payout ratio. If the firm earns a return on equity (ROE) on its reinvested earnings, the sustainable growth rate is:
\[ g = b \times \text{ROE} \]
A firm paying out all earnings as dividends (\(b=0\)) has \(g=0\); a firm retaining 60% of earnings with ROE of 15% grows at 9%.</div>

<div class="remark"><strong>Remark (Modigliani-Miller insight).</strong> The Gordon model implies that a firm with higher \(g\) is worth more. But note that \(g = b \times \text{ROE}\) increases both the growth in dividends and reduces the current dividend (since higher \(b\) means lower payout). Growth only adds value if \(\text{ROE} > k\) — if the firm earns more than its cost of equity on retained earnings. If \(\text{ROE} = k\), paying out all earnings as dividends (no growth) yields the same stock price as retaining and reinvesting. This is the content of Modigliani-Miller dividend irrelevance in a world without taxes.</div>

### Multistage Growth Models

<div class="definition"><strong>Definition 16.5 (Two-Stage DDM).</strong> A <strong>two-stage DDM</strong> models a period of high or abnormal growth at rate \(g_1\) for the first \(T\) periods, followed by a perpetual mature growth rate \(g_2 < k\):
\[ V_0 = \sum_{t=1}^{T}\frac{D_t}{(1+k)^t} + \frac{P_T}{(1+k)^T} \]
where \(D_t = D_0(1+g_1)^t\) and the terminal value uses the Gordon model: \(P_T = D_{T+1}/(k - g_2)\).</div>

<div class="example"><strong>Example 16.2.</strong> A firm has just paid \(D_0 = \$1.00\). It is expected to grow at 20% for the next 3 years (growth phase), then settle to a perpetual 5% growth rate. Required return \(k = 12\%\).

Dividends during high-growth phase:
\[ D_1 = 1.20, \quad D_2 = 1.44, \quad D_3 = 1.728 \]

Terminal value at \(T = 3\):
\[ P_3 = \frac{D_4}{k - g_2} = \frac{1.728 \times 1.05}{0.12 - 0.05} = \frac{1.8144}{0.07} = \$25.92 \]

Present value:
\[ V_0 = \frac{1.20}{1.12} + \frac{1.44}{1.12^2} + \frac{1.728}{1.12^3} + \frac{25.92}{1.12^3} \]
\[ = 1.071 + 1.148 + 1.230 + 18.44 = \$21.89 \]

Note that the terminal value accounts for \$18.44/\$21.89 = 84% of total value — the assumed long-run growth rate dominates the valuation.</div>

### Price Ratios

The **price-to-earnings (P/E) ratio** is the most widely used equity valuation metric. The Gordon model implies a theoretical P/E:

<div class="definition"><strong>Definition 16.6 (P/E Ratio and PVGO).</strong> The <strong>price-to-earnings ratio</strong> is \(P/E = P_0/E_1\). For the Gordon growth model with payout ratio \(d = D_1/E_1\):
\[ \frac{P_0}{E_1} = \frac{d}{k - g} \]
The stock price can be decomposed as:
\[ P_0 = \frac{E_1}{k} + \text{PVGO} \]
where \(E_1/k\) is the value of the stock as a no-growth perpetuity and \(\text{PVGO}\) (Present Value of Growth Opportunities) is the additional value from profitable reinvestment. If \(\text{ROE} > k\), \(\text{PVGO} > 0\); if \(\text{ROE} = k\), \(\text{PVGO} = 0\).</div>

---

# Part V: Derivative Securities

## Chapter 18: Options and Other Derivatives Markets

Derivatives are financial contracts whose payoffs depend on the values of underlying assets. They serve two distinct social purposes: **hedging** (reducing existing exposures) and **price discovery** (aggregating information about future asset prices). This chapter covers the institutional mechanics of options markets and the fundamental pricing relationships that constrain option values.

### Option Fundamentals

<div class="definition"><strong>Definition 18.1 (Call and Put Options).</strong> A <strong>call option</strong> is the right, but not the obligation, to <strong>buy</strong> a specified underlying asset at a specified <strong>strike price</strong> \(X\) on or before a specified <strong>expiration date</strong> \(T\). A <strong>put option</strong> is the right to <strong>sell</strong> at \(X\). The buyer of an option pays the <strong>option premium</strong> to the seller (writer). An <strong>American option</strong> may be exercised at any time before expiry; a <strong>European option</strong> only at expiry.</div>

<div class="definition"><strong>Definition 18.2 (Moneyness).</strong> An option is:
<ul>
<li><strong>In the money (ITM):</strong> Call: \(S > X\); Put: \(S < X\). Immediate exercise would be profitable.</li>
<li><strong>At the money (ATM):</strong> \(S \approx X\).</li>
<li><strong>Out of the money (OTM):</strong> Call: \(S < X\); Put: \(S > X\). Immediate exercise would not be profitable.</li>
</ul>
The <strong>intrinsic value</strong> of a call is \(\max(S-X,0)\); of a put is \(\max(X-S,0)\). Any excess of market price over intrinsic value is the <strong>time value</strong>.</div>

### Option Payoffs and Profits

<div class="theorem"><strong>Theorem 18.3 (Option Payoffs at Expiry).</strong> At expiration, the payoffs are:

| Position | Payoff at Expiry |
|----------|-----------------|
| Long call | \(\max(S_T - X, 0)\) |
| Short call | \(-\max(S_T - X, 0)\) |
| Long put | \(\max(X - S_T, 0)\) |
| Short put | \(-\max(X - S_T, 0)\) |

The profit is payoff minus the premium paid (or plus premium received for short positions).</div>

<div class="example"><strong>Example 18.1.</strong> A call option has strike \(X = \$50\) and premium \(C = \$3\). Payoff and profit as a function of \(S_T\):

| \(S_T\) | Payoff | Profit |
|---------|--------|--------|
| 40 | 0 | \(-3\) |
| 50 | 0 | \(-3\) |
| 53 | 3 | 0 (break-even) |
| 60 | 10 | 7 |
| 70 | 20 | 17 |

The break-even stock price is \(X + C = 53\). Maximum loss = \$3 (premium paid); maximum gain is unlimited.</div>

### Option Strategies

<div class="definition"><strong>Definition 18.4 (Protective Put).</strong> A <strong>protective put</strong> combines a long position in the stock with a long put option:
\[ \text{Payoff} = S_T + \max(X - S_T, 0) = \max(S_T, X) \]
This provides downside insurance: the position value never falls below \(X\), regardless of how far the stock drops. The cost is the put premium, which functions exactly as an insurance premium.</div>

<div class="definition"><strong>Definition 18.5 (Covered Call).</strong> A <strong>covered call</strong> combines a long stock position with a short call:
\[ \text{Payoff} = S_T - \max(S_T - X, 0) = \min(S_T, X) \]
The investor collects the call premium and retains upside up to the strike, but caps gains above the strike. Covered calls are attractive when the investor believes the stock will not rise significantly above the strike in the near term.</div>

<div class="definition"><strong>Definition 18.6 (Straddle).</strong> A <strong>straddle</strong> combines a long call and a long put with the same strike and expiry:
\[ \text{Payoff} = \max(S_T - X, 0) + \max(X - S_T, 0) = |S_T - X| \]
The straddle profits from large moves in either direction. It is valuable when the investor expects high volatility but is uncertain about direction — before an earnings announcement, regulatory decision, or merger vote, for instance.</div>

### Factors Affecting Option Prices

<div class="theorem"><strong>Theorem 18.7 (Option Price Determinants).</strong> The following relationships hold for European options on non-dividend paying stocks:

| Factor | Call | Put | Intuition |
|--------|------|-----|-----------|
| Stock price \(S\) ↑ | ↑ | ↓ | Higher \(S\) makes call more ITM, put more OTM |
| Strike price \(X\) ↑ | ↓ | ↑ | Higher \(X\) makes call less valuable, put more valuable |
| Time to expiry \(T\) ↑ | ↑ | ↑ | More time = more chance of favorable moves |
| Volatility \(\sigma\) ↑ | ↑ | ↑ | Higher \(\sigma\) increases probability of large payoffs |
| Risk-free rate \(r_f\) ↑ | ↑ | ↓ | Call embeds deferred purchase; put embeds deferred sale |
| Dividends ↑ | ↓ | ↑ | Dividends reduce stock price, hurting calls and helping puts |
</div>

The volatility sensitivity deserves special emphasis. Unlike all other inputs, which affect calls and puts in opposite directions, **both** calls and puts benefit from higher volatility. This is because option payoffs are asymmetric: the holder benefits from large moves on the favorable side but is protected against large moves on the unfavorable side (the option simply expires worthless). Higher volatility expands the distribution of outcomes and therefore increases expected payoffs for both call and put holders.

### Put-Call Parity

The most fundamental no-arbitrage constraint linking call and put prices is:

<div class="theorem"><strong>Theorem 18.8 (Put-Call Parity).</strong> For European options on a non-dividend paying stock with the same strike \(X\) and expiry \(T\):
\[ C + Xe^{-rT} = P + S_0 \]
or equivalently:
\[ C - P = S_0 - Xe^{-rT} \]
</div>

<div class="proof"><strong>Derivation.</strong> Construct two portfolios:
<ul>
<li><strong>Portfolio A:</strong> Buy call, invest \(Xe^{-rT}\) in risk-free bonds.</li>
<li><strong>Portfolio B:</strong> Buy put, buy stock.</li>
</ul>
Payoffs at expiry \(T\):

| Outcome | Portfolio A | Portfolio B |
|---------|-------------|-------------|
| \(S_T > X\) | \((S_T - X) + X = S_T\) | \(0 + S_T = S_T\) |
| \(S_T \leq X\) | \(0 + X = X\) | \((X - S_T) + S_T = X\) |

The payoffs are identical for all outcomes. By no-arbitrage, the initial costs must be equal:
\[ C + Xe^{-rT} = P + S_0 \qquad \square \]</div>

<div class="example"><strong>Example 18.2.</strong> A stock trades at \$50. A 3-month European call with strike \$50 is priced at \$4.50. The continuously compounded risk-free rate is 4% per year. What should a put with the same strike and expiry be worth?
\[ P = C + Xe^{-rT} - S_0 = 4.50 + 50e^{-0.04 \times 0.25} - 50 \]
\[ = 4.50 + 50(0.9900) - 50 = 4.50 + 49.50 - 50 = \$4.00 \]
If the put traded at \$4.40, an arbitrageur could earn a riskless profit of \$0.40 by buying the put (\$4.40), selling the call (\$4.50), buying the stock (\$50), and borrowing \$49.50 — a net inflow of \$0.40 now, with zero net cash flows at expiry regardless of \(S_T\).</div>

---

## Chapter 19: Option Valuation

### The Binomial Option Pricing Model

The binomial model provides the conceptual foundation for all option pricing. It shows that option values can be derived from the principle of no-arbitrage alone, without any assumptions about investor risk preferences.

<div class="definition"><strong>Definition 19.1 (Single-Period Binomial Model).</strong> The stock currently trades at \(S\). Over one period it moves to either \(S_u = uS\) (up) with risk-neutral probability \(p\) or \(S_d = dS\) (down). A call option with strike \(X\) has payoffs \(C_u = \max(uS - X, 0)\) and \(C_d = \max(dS - X, 0)\) at expiry.</div>

<div class="theorem"><strong>Theorem 19.2 (Binomial Call Price).</strong> The no-arbitrage call price is:
\[ C = \frac{pC_u + (1-p)C_d}{1 + r_f} \]
where the <strong>risk-neutral probability</strong> is:
\[ p = \frac{(1+r_f) - d}{u - d} \]
and \(r_f\) is the one-period risk-free rate. The <strong>hedge ratio</strong> (delta) of the replicating portfolio is:
\[ \Delta = \frac{C_u - C_d}{S_u - S_d} = \frac{C_u - C_d}{(u-d)S} \]</div>

<div class="proof"><strong>Derivation.</strong> Construct a riskless portfolio by holding \(\Delta\) shares and being short one call. The portfolio must earn the risk-free rate:
\[ \Delta S_u - C_u = \Delta S_d - C_d \implies \Delta = \frac{C_u - C_d}{S_u - S_d} \]
The current cost of this portfolio is \(\Delta S - C\). Since it is riskless:
\[ \Delta S - C = \frac{\Delta S_d - C_d}{1+r_f} \implies C = \Delta S - \frac{\Delta S_d - C_d}{1+r_f} \]
Substituting \(\Delta\) and simplifying yields the risk-neutral pricing formula. The risk-neutral probability \(p = [(1+r_f)-d]/(u-d)\) is chosen so that the stock earns the risk-free rate in expectation: \(pS_u + (1-p)S_d = S(1+r_f)\). \(\square\)</div>

<div class="example"><strong>Example 19.1.</strong> Stock price \(S = \$100\). Over one period, up factor \(u = 1.20\), down factor \(d = 0.80\), risk-free rate \(r_f = 5\%\). Call strike \(X = \$105\).
\[ S_u = 120, \quad C_u = \max(120-105, 0) = 15 \]
\[ S_d = 80, \quad C_d = \max(80-105, 0) = 0 \]
\[ p = \frac{1.05 - 0.80}{1.20 - 0.80} = \frac{0.25}{0.40} = 0.625 \]
\[ C = \frac{0.625 \times 15 + 0.375 \times 0}{1.05} = \frac{9.375}{1.05} = \$8.93 \]
Hedge ratio: \(\Delta = (15-0)/(120-80) = 15/40 = 0.375\). A portfolio long 0.375 shares, short one call costs \(0.375 \times 100 - 8.93 = \$28.57\) and pays \(0.375 \times 80 - 0 = \$30 = 28.57 \times 1.05\). ✓</div>

### The Black-Scholes Formula

As the number of binomial periods increases and the time step shrinks to zero, the binomial model converges to the **Black-Scholes formula**:

<div class="theorem"><strong>Theorem 19.3 (Black-Scholes Option Pricing Model).</strong> Assume the stock price follows a geometric Brownian motion with continuously compounded drift \(\mu\) and volatility \(\sigma\), and that the risk-free rate is \(r\) (continuously compounded). For a European call on a non-dividend paying stock:
\[ C = S_0 N(d_1) - Xe^{-rT}N(d_2) \]
\[ P = Xe^{-rT}N(-d_2) - S_0 N(-d_1) \]
where:
\[ d_1 = \frac{\ln(S_0/X) + (r + \sigma^2/2)T}{\sigma\sqrt{T}}, \qquad d_2 = d_1 - \sigma\sqrt{T} \]
and \(N(\cdot)\) is the standard normal CDF.</div>

<div class="remark"><strong>Remark (Interpretation).</strong> The Black-Scholes formula has a clean economic interpretation. \(N(d_2)\) is the risk-neutral probability that the call expires in the money (\(S_T > X\)). \(N(d_1)\) is the call's delta — the hedge ratio, or the number of shares of stock that replicate one long call. The formula says:
\[ C = \underbrace{S_0 N(d_1)}_{\text{expected stock receipt}} - \underbrace{Xe^{-rT}N(d_2)}_{\text{expected strike payment}} \]
The drift \(\mu\) does not appear in the formula — consistent with the risk-neutral pricing approach in which the stock earns the risk-free rate. Investor risk preferences are irrelevant once we know the stock price and volatility.</div>

<div class="example"><strong>Example 19.2.</strong> Stock price \(S_0 = \$50\), strike \(X = \$50\) (ATM), time \(T = 0.5\) years, risk-free rate \(r = 5\%\), volatility \(\sigma = 30\%\).
\[ d_1 = \frac{\ln(1) + (0.05 + 0.045)(0.5)}{0.30\sqrt{0.5}} = \frac{0 + 0.0475}{0.2121} = 0.2239 \]
\[ d_2 = 0.2239 - 0.2121 = 0.0118 \]
\[ N(d_1) = N(0.2239) \approx 0.5886, \quad N(d_2) = N(0.0118) \approx 0.5047 \]
\[ C = 50(0.5886) - 50e^{-0.025}(0.5047) = 29.43 - 50(0.9753)(0.5047) = 29.43 - 24.61 = \$4.82 \]
By put-call parity: \(P = 4.82 + 50e^{-0.025} - 50 = 4.82 - 1.23 = \$3.59\).</div>

### The Greeks

<div class="definition"><strong>Definition 19.4 (The Greeks).</strong> The <strong>Greeks</strong> quantify an option's sensitivity to each input:
<ul>
<li><strong>Delta (\(\Delta\)):</strong> \(\partial C/\partial S = N(d_1)\) for a call; \(-N(-d_1)\) for a put. The fraction of a share needed to hedge one long call.</li>
<li><strong>Gamma (\(\Gamma\)):</strong> \(\partial^2 C/\partial S^2 = n(d_1)/(S\sigma\sqrt{T})\) where \(n(\cdot)\) is the standard normal PDF. Rate of change of delta; always positive for long options.</li>
<li><strong>Vega (\(\nu\)):</strong> \(\partial C/\partial \sigma = S\sqrt{T}n(d_1)\). Sensitivity to volatility; always positive for long options.</li>
<li><strong>Theta (\(\Theta\)):</strong> \(\partial C/\partial T\). Time decay; typically negative for long options — the option loses value as expiry approaches.</li>
<li><strong>Rho (\(\rho\)):</strong> \(\partial C/\partial r = XTe^{-rT}N(d_2)\) for a call. Sensitivity to the risk-free rate.</li>
</ul></div>

<div class="remark"><strong>Remark (Gamma-Theta Trade-off).</strong> For a delta-hedged long option position, the two dominant P&L drivers are gamma and theta. Gamma is positive (the position benefits from large stock moves in either direction — positive convexity); theta is negative (the position loses value as time passes). The Black-Scholes PDE can be interpreted as the break-even condition: theta decay exactly compensates gamma gains when the stock moves by the diffusion amount \(\sigma S\sqrt{dt}\) per unit time. If realized volatility exceeds the implied volatility used to price the option, the gamma gains outpace the theta decay and the long option position profits.</div>

### Implied Volatility

<div class="definition"><strong>Definition 19.5 (Implied Volatility).</strong> The <strong>implied volatility</strong> of an option is the value of \(\sigma\) that, when input into the Black-Scholes formula, produces the observed market price. Implied volatility is the market's consensus forecast of the stock's future realized volatility embedded in option prices.</div>

The empirical finding that implied volatility varies systematically across strikes — the **volatility smile** or **volatility skew** — is evidence against the log-normal assumption. For equity index options, implied volatility typically decreases with strike (a skew): out-of-the-money puts carry higher implied volatility than at-the-money or out-of-the-money calls. This reflects investors' willingness to pay a premium to hedge against market crashes — the left tail of the return distribution is fatter than the log-normal model predicts.

---

## Chapter 20: Futures, Forwards, and Swap Markets

### Futures and Forwards: Institutional Background

<div class="definition"><strong>Definition 20.1 (Forward Contract).</strong> A <strong>forward contract</strong> is a privately negotiated agreement to buy or sell a specified asset at a specified price (the **forward price**) at a specified future date (the **delivery date**). Forwards are customized to the parties' needs and traded over the counter (OTC). Because they are bilateral agreements with no intermediary guarantee, they expose each party to **counterparty credit risk** — the risk that the other party defaults before delivery.</div>

<div class="definition"><strong>Definition 20.2 (Futures Contract).</strong> A <strong>futures contract</strong> is a standardized exchange-traded agreement to buy or sell a specified quantity of an asset at a specified price on a specified future date. The exchange's **clearinghouse** stands between all buyers and sellers, guaranteeing performance and eliminating counterparty risk. Futures are marked to market daily — gains and losses are settled in cash each evening through the clearinghouse.</div>

<div class="definition"><strong>Definition 20.3 (Marking to Market and Margin).</strong> In futures markets, the <strong>initial margin</strong> is a good-faith deposit required when the contract is entered. Each day, gains or losses are credited or debited to the margin account based on the change in futures price (daily settlement). If the margin account falls below the <strong>maintenance margin</strong>, a **margin call** requires the account to be topped back up to the initial margin level. If the investor fails to meet a margin call, the position is closed.</div>

<div class="example"><strong>Example 20.1.</strong> An investor enters a long futures contract on 100 barrels of crude oil at \$80/barrel. Initial margin = \$3,000; maintenance margin = \$2,500. If the futures price falls to \$77, the daily loss is \(100 \times (-3) = -\$300\), reducing the margin account from \$3,000 to \$2,700. The next day, price falls to \$75: daily loss = \$200, margin account = \$2,500 (exactly at maintenance). One more day with any decline triggers a margin call to restore the account to \$3,000.</div>

### Futures Pricing: The Cost of Carry Model

<div class="theorem"><strong>Theorem 20.4 (Futures Pricing for Non-Dividend Paying Assets).</strong> For an asset with no carrying costs or intermediate cash flows:
\[ F_0 = S_0(1+r_f)^T \]
(discrete compounding) or \(F_0 = S_0 e^{rT}\) (continuous compounding), where \(S_0\) is the current spot price, \(r_f\) is the risk-free rate, and \(T\) is time to delivery in years.</div>

<div class="proof"><strong>Derivation (cash-and-carry arbitrage).</strong>
<ul>
<li><strong>If \(F_0 > S_0(1+r_f)^T\):</strong> At \(t=0\): borrow \(S_0\) at \(r_f\), buy the asset, enter a short futures at \(F_0\). At \(T\): deliver the asset, receive \(F_0\), repay \(S_0(1+r_f)^T\). Riskless profit = \(F_0 - S_0(1+r_f)^T > 0\). Selling futures pressure drives \(F_0\) down.</li>
<li><strong>If \(F_0 < S_0(1+r_f)^T\):</strong> At \(t=0\): sell asset short, invest \(S_0\) at \(r_f\), enter a long futures at \(F_0\). At \(T\): take delivery at \(F_0\), use to close short position. Receive \(S_0(1+r_f)^T\). Riskless profit = \(S_0(1+r_f)^T - F_0 > 0\). Buying futures pressure drives \(F_0\) up.</li>
</ul>
Both arbitrage opportunities are eliminated only when \(F_0 = S_0(1+r_f)^T\). \(\square\)</div>

<div class="definition"><strong>Definition 20.5 (Cost of Carry).</strong> More generally, the futures price incorporates all costs and benefits of holding the underlying asset until delivery:
\[ F_0 = S_0 e^{(r + u - d)T} \]
where \(u\) is the continuously compounded storage cost (for commodities) or zero for financial assets, and \(d\) is the continuous dividend yield (for stocks or indices) or convenience yield (for commodities). The term \(r + u - d\) is the <strong>net cost of carry</strong>.</div>

<div class="definition"><strong>Definition 20.6 (Basis and Convergence).</strong> The <strong>basis</strong> is defined as \(S_0 - F_0\). For non-dividend-paying assets, basis = \(-S_0 r_f T < 0\) (futures exceed spot price, called **contango**). For dividend-paying assets or commodities with high convenience yield, \(d > r + u\) and the basis can be positive (futures below spot, called **backwardation**). At expiry, the futures price converges to the spot price: \(F_T = S_T\).</div>

### Hedging with Futures

<div class="definition"><strong>Definition 20.7 (Short Hedge and Long Hedge).</strong> A <strong>short hedge</strong> involves selling futures to protect against a price decline in an asset held or to be produced. A farmer who has planted wheat in spring and will sell at harvest enters a short wheat futures position to lock in a selling price. A <strong>long hedge</strong> involves buying futures to lock in the acquisition cost of an asset to be purchased. An airline entering a long crude oil futures position to lock in jet fuel costs is a long hedge.</div>

<div class="theorem"><strong>Theorem 20.8 (Minimum Variance Hedge Ratio).</strong> Let \(\Delta S\) and \(\Delta F\) denote changes in spot and futures prices. The hedge ratio \(h\) (futures contracts per unit of spot exposure) that minimizes the variance of the hedged position is:
\[ h^* = \rho_{SF} \cdot \frac{\sigma_S}{\sigma_F} \]
where \(\rho_{SF}\) is the correlation between spot and futures price changes.</div>

<div class="proof"><strong>Derivation.</strong> The hedged position P&L is \(\Delta S - h\Delta F\). Its variance is:
\[ \text{Var}(\Delta S - h\Delta F) = \sigma_S^2 - 2h\sigma_{SF} + h^2\sigma_F^2 \]
Differentiating with respect to \(h\) and setting to zero: \(-2\sigma_{SF} + 2h\sigma_F^2 = 0 \implies h^* = \sigma_{SF}/\sigma_F^2 = \rho_{SF}\sigma_S/\sigma_F\). \(\square\)</div>

<div class="remark"><strong>Remark.</strong> The hedge ratio equals one (a unit hedge) only when spot and futures prices are perfectly correlated and have equal volatility. In practice, the hedged asset often differs from the futures contract's underlying in grade, location, or timing — introducing **basis risk**. Basis risk means the hedge cannot be perfect even with the optimal ratio. The hedging effectiveness \(R^2 = \rho_{SF}^2\) measures the fraction of spot price variance eliminated by the optimal hedge.</div>

### Swap Markets

<div class="definition"><strong>Definition 20.9 (Interest Rate Swap).</strong> An <strong>interest rate swap</strong> is an agreement in which two counterparties exchange periodic interest payments on a specified <strong>notional principal</strong>. In a <strong>plain vanilla swap</strong>, one party pays a fixed rate (the **swap rate**) while the other pays a floating rate (typically SOFR), both applied to the same notional. The notional itself is never exchanged — only the net interest difference changes hands.</div>

<div class="example"><strong>Example 20.2.</strong> Company A has issued \$10 million in floating-rate debt at SOFR + 1%. It fears rising rates. It enters a 3-year swap in which it pays a fixed rate of 4% and receives SOFR on a \$10 million notional. Net position:
<ul>
<li>Pays: SOFR + 1% (on actual debt) + 4% (fixed on swap) − SOFR (received on swap) = 5% fixed.</li>
</ul>
The floating-rate debt has been effectively converted to 5% fixed-rate, eliminating interest rate risk. The swap dealer earns the bid-offer spread between the fixed rates paid by fixed-rate receivers and fixed-rate payers.</div>

<div class="definition"><strong>Definition 20.10 (Swap Valuation).</strong> At inception, a plain vanilla interest rate swap is structured so its value is zero: the swap rate is set so that the present value of fixed payments equals the present value of expected floating payments:
\[ \sum_{t=1}^{T} \frac{k \cdot \text{Notional}}{(1+y_t)^t} = \text{Notional} - \frac{\text{Notional}}{(1+y_T)^T} \]
where \(k\) is the swap rate (annual fixed coupon as a fraction of notional) and \(y_t\) are the relevant spot rates. This shows that a pay-fixed swap is equivalent to a long position in a floating-rate bond and a short position in a fixed-rate bond.</div>

<div class="definition"><strong>Definition 20.11 (Credit Default Swap).</strong> A <strong>credit default swap (CDS)</strong> is a bilateral contract in which the <strong>protection buyer</strong> pays periodic premiums (the **CDS spread**, in basis points per annum on notional) to the <strong>protection seller</strong>, who in return agrees to pay the notional (minus recovery value) if a specified <strong>reference entity</strong> defaults. The CDS spread is a direct market measure of credit risk: a wider spread reflects higher perceived default probability. CDSs allow credit risk to be separated from interest rate risk and transferred to parties who wish to take credit exposure, or used to hedge credit exposure by bond holders.</div>

<div class="remark"><strong>Remark.</strong> The financial crisis of 2008 demonstrated the systemic dangers of concentrated, opaque CDS positions. AIG had written credit protection on hundreds of billions of mortgage-related CDOs; when housing prices fell and CDO values collapsed, AIG faced margin calls it could not meet, triggering a government bailout. The episode illustrated that derivative markets can transfer risk efficiently in normal conditions but can create dangerous concentrations when many institutions hold similar positions on the same side of a trade.</div>
